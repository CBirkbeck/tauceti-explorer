/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/DiamondEtaleCohomology--C0.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers converge on names and signatures.
They claim no implementation; every proof and every unfinished construction is `sorry`.

BP-DiamondEtaleCohomology--C0 (stages C0–C7: ECD §§14, 16–20).
Pinned Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
The file imports Mathlib modules only.

PROTOTYPE LIMIT. Neither pinned library has perfectoid spaces, small v-stacks, diamonds, their
sites or ∞-categorical enhancements. Those carriers are owned by DiamondsAndVStacks (D1–D6),
PerfectoidSpaces (P4–P6) and EnhancedDerivedSheaves (E1–E3). This prototype is written against
one explicit supplier interface, `Carriers`, whose fields are *data only*: categories, functors
and small skeleta (at a cutoff κ) of the over-categories that define the sites. It has no
Prop-valued fields. Geometric conditions that cannot be typed against these data (for example
"f is quasicompact" for a map of small v-stacks, or the ∞-categorical coherence of an
enhancement) are omitted from the signatures and recorded in the comment above the declaration
and in the packet; they are never replaced by `True` or by a Prop-valued placeholder. The
notions this packet owns (the sites, D_ét, universal closedness, properness for v-sheaves,
constructibility on spectral spaces, perfect-constructibility) are genuine definitions in terms
of these data or of Mathlib. Consequently an arbitrary instance of `Carriers` does NOT satisfy
the stated theorems: they are suggested shapes to be specialised to the supplier objects.
Derived categories are Mathlib's 1-categorical `DerivedCategory`; statements about the
enhanced ∞-categories 𝒟_ét are recorded at the homotopy level.

Function-notation laws such as (f ∘ g)^* ≃ g^* ∘ f^* are written in Lean's diagrammatic
composition: for `g : Z ⟶ Y` and `f : Y ⟶ X`, `pull (g ≫ f) ≅ pull f ⋙ pull g`.
-/
import Mathlib.CategoryTheory.Sites.Grothendieck
import Mathlib.CategoryTheory.Sites.Abelian
import Mathlib.CategoryTheory.Sites.Point.Conservative
import Mathlib.CategoryTheory.Sites.Continuous
import Mathlib.CategoryTheory.Sites.CoverLifting
import Mathlib.CategoryTheory.Sites.LeftExact
import Mathlib.CategoryTheory.Sites.SheafCohomology.Basic
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Category.ModuleCat.Colimits
import Mathlib.Algebra.Category.ModuleCat.Limits
import Mathlib.Algebra.Category.ModuleCat.FilteredColimits
import Mathlib.CategoryTheory.Comma.Over.Basic
import Mathlib.CategoryTheory.Limits.Shapes.Pullback.HasPullback
import Mathlib.CategoryTheory.Limits.Shapes.Terminal
import Mathlib.CategoryTheory.Presentable.Finite
import Mathlib.CategoryTheory.Triangulated.Subcategory
import Mathlib.CategoryTheory.ObjectProperty.FullSubcategory
import Mathlib.CategoryTheory.Monoidal.Closed.Basic
import Mathlib.Topology.Category.TopCat.Basic
import Mathlib.Topology.Constructible
import Mathlib.Topology.Spectral.Basic
import Mathlib.Topology.Sheaves.Sheaf
import Mathlib.Topology.Maps.Proper.Basic
import Mathlib.RingTheory.Finiteness.Defs
import Mathlib.RingTheory.Noetherian.Defs
import Mathlib.Algebra.Category.ModuleCat.Adjunctions
import Mathlib.Algebra.Category.ModuleCat.Monoidal.Closed
import Mathlib.Algebra.Category.ModuleCat.Monoidal.Symmetric
import Mathlib.Algebra.Category.Ring.Basic
import Mathlib.Algebra.Homology.DerivedCategory.ExactFunctor
import Mathlib.Algebra.Homology.DerivedCategory.HomologySequence
import Mathlib.Algebra.Homology.DerivedCategory.TStructure
import Mathlib.AlgebraicTopology.SimplicialObject.Basic
import Mathlib.CategoryTheory.Abelian.Subcategory
import Mathlib.CategoryTheory.Filtered.Basic
import Mathlib.CategoryTheory.Functor.OfSequence
import Mathlib.CategoryTheory.Limits.Preserves.Basic
import Mathlib.CategoryTheory.Monoidal.Braided.Basic
import Mathlib.CategoryTheory.ObjectProperty.Extensions
import Mathlib.CategoryTheory.ObjectProperty.Retract
import Mathlib.CategoryTheory.Sites.ConstantSheaf
import Mathlib.CategoryTheory.Sites.Monoidal
import Mathlib.CategoryTheory.Sites.Over
import Mathlib.CategoryTheory.Triangulated.TStructure.TruncLEGT
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.RepresentationTheory.Basic
import Mathlib.RingTheory.Valuation.ValuationSubring
import Mathlib.Topology.Algebra.Group.Defs
import Mathlib.Topology.LocallyClosed
import Mathlib.Topology.LocallyConstant.Algebra
import Mathlib.Topology.QuasiSeparated
import Mathlib.Topology.Sheaves.Abelian
import Mathlib.Topology.Sheaves.Functors
import Mathlib.Topology.Sheaves.Stalks
import Mathlib.Topology.Spectral.Hom

noncomputable section

set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

open CategoryTheory Limits Topology

universe u

namespace TauCeti.DiamondEtale

/-- The supplier interface (data only). Every field is owned by another roadmap: small v-stacks,
diamonds, locally spatial diamonds and their underlying spaces by DiamondsAndVStacks D4–D5,
strictly totally disconnected perfectoid spaces by D1, perfectoid Tate and field pairs by
PerfectoidSpaces P4. The small categories `EtOver`, `QpOver`, `VOver` are skeleta at a fixed
cutoff κ of the categories of locally separated étale maps, locally separated quasi-pro-étale
maps and maps from κ-small small v-sheaves to the base (ECD Definition 14.1); their objects are
the maps themselves, with source functors to the over-categories. -/
structure Carriers where
  /-- Small v-stacks on Perf (D4). -/
  V : Type (u+1)
  [cat : Category.{u} V]
  [pb : HasPullbacks V]
  [term : HasTerminal V]
  /-- The underlying topological space `|Y|` (D4). -/
  pts : V ⥤ TopCat.{u}
  /-- Diamonds (D4) and locally spatial diamonds (D5), with forgetful functors. -/
  Dia : Type (u+1)
  [diaCat : Category.{u} Dia]
  diaV : Dia ⥤ V
  LS : Type (u+1)
  [lsCat : Category.{u} LS]
  lsDia : LS ⥤ Dia
  /-- Strictly totally disconnected perfectoid spaces (D1); they are locally spatial diamonds. -/
  Std : Type (u+1)
  [stdCat : Category.{u} Std]
  stdLS : Std ⥤ LS
  /-- Skeleta at a cutoff of the étale, quasi-pro-étale and v-sites (ECD 14.1). -/
  EtOver : LS → Type u
  [etCat : ∀ Y, SmallCategory (EtOver Y)]
  etSrc : ∀ Y, EtOver Y ⥤ Over (diaV.obj (lsDia.obj Y))
  QpOver : Dia → Type u
  [qpCat : ∀ Y, SmallCategory (QpOver Y)]
  qpSrc : ∀ Y, QpOver Y ⥤ Over (diaV.obj Y)
  VOver : V → Type u
  [vCat : ∀ Y, SmallCategory (VOver Y)]
  vSrc : ∀ Y, VOver Y ⥤ Over Y
  /-- Every étale map is quasi-pro-étale, every quasi-pro-étale map has a small v-sheaf as source. -/
  etQp : ∀ Y, EtOver Y ⥤ QpOver (lsDia.obj Y)
  qpV : ∀ Y, QpOver Y ⥤ VOver (diaV.obj Y)
  /-- Perfectoid Tate pairs `(R, R⁺)` with `Spa(R, R°) ⊂ Spa(R, R⁺)`, and perfectoid field pairs
  `(K, K⁺)` among them (PerfectoidSpaces P4). -/
  TatePair : Type u
  spa : TatePair → V
  spaCirc : TatePair → V
  circIncl : ∀ P, spaCirc P ⟶ spa P
  FieldPair : Type u
  fieldTate : FieldPair → TatePair
  /-- Small skeleta of the categories of étale maps `U → Y` of small v-stacks (D3), used for `f_!`. -/
  EtVOver : V → Type u
  [etVCat : ∀ Y, SmallCategory (EtVOver Y)]
  etVSrc : ∀ Y, EtVOver Y ⥤ Over Y
  /-- The fixed prime `p`: Perf consists of perfectoid spaces of characteristic `p`. -/
  p : ℕ

attribute [instance] Carriers.cat Carriers.pb Carriers.term Carriers.diaCat Carriers.lsCat
  Carriers.stdCat Carriers.etCat Carriers.qpCat Carriers.vCat Carriers.etVCat

variable (S : Carriers.{u})

namespace Carriers

/-- The small v-stack underlying a diamond, a locally spatial diamond, a strictly totally
disconnected space. -/
abbrev ofDia (Y : S.Dia) : S.V := S.diaV.obj Y
abbrev ofLS (Y : S.LS) : S.V := S.diaV.obj (S.lsDia.obj Y)
abbrev ofStd (X : S.Std) : S.LS := S.stdLS.obj X

end Carriers

/-! ## Sites (DiamondEtaleCohomology:C0/etale-site, quasi-pro-etale-site, v-site) -/

/-- C0/etale-site: the étale site `Y_ét` of a locally spatial diamond, with jointly surjective
coverings (ECD 14.1(i)). -/
def etaleSite (Y : S.LS) : GrothendieckTopology (S.EtOver Y) := sorry

/-- C0/quasi-pro-etale-site: the quasi-pro-étale site `Y_qproét` of a diamond at a cutoff
(ECD 14.1(ii)). -/
def qproetSite (Y : S.Dia) : GrothendieckTopology (S.QpOver Y) := sorry

/-- C0/v-site: the v-site `Y_v` of a small v-stack at a cutoff (ECD 14.1(iii)). -/
def vSite (Y : S.V) : GrothendieckTopology (S.VOver Y) := sorry

variable (Λ : Type u) [CommRing Λ]

/-- Sheaves of Λ-modules on the three sites. -/
abbrev EtSh (Y : S.LS) := Sheaf (etaleSite S Y) (ModuleCat.{u} Λ)
abbrev QpSh (Y : S.Dia) := Sheaf (qproetSite S Y) (ModuleCat.{u} Λ)
abbrev VSh (Y : S.V) := Sheaf (vSite S Y) (ModuleCat.{u} Λ)

attribute [local instance] HasDerivedCategory.standard

/-- C0/cutoff-derived-categories: the derived categories `D(Y_ét, Λ)`, `D(Y_qproét, Λ)` and
`D(Y_v, Λ)` (the latter two at the fixed cutoff of `Carriers`). -/
abbrev DEt (Y : S.LS) := DerivedCategory (EtSh S Λ Y)
abbrev DQp (Y : S.Dia) := DerivedCategory (QpSh S Λ Y)
abbrev DV (Y : S.V) := DerivedCategory (VSh S Λ Y)

/-! ## Comparison morphisms and pullbacks (C0/comparison-morphisms) -/

/-- `ν_Y^*` on sheaves and on derived categories. -/
def nuSh (Y : S.LS) : EtSh S Λ Y ⥤ QpSh S Λ (S.lsDia.obj Y) := sorry
def nuPull (Y : S.LS) : DEt S Λ Y ⥤ DQp S Λ (S.lsDia.obj Y) := sorry
/-- `λ_Y^*` on sheaves and on derived categories. -/
def lambdaSh (Y : S.Dia) : QpSh S Λ Y ⥤ VSh S Λ (S.ofDia Y) := sorry
def lambdaPull (Y : S.Dia) : DQp S Λ Y ⥤ DV S Λ (S.ofDia Y) := sorry
/-- Their right adjoints `ν_Y*`, `λ_Y*` (sheaf level) and `Rν_Y*`, `Rλ_Y*`. -/
def nuPush (Y : S.LS) : QpSh S Λ (S.lsDia.obj Y) ⥤ EtSh S Λ Y := sorry
def lambdaPush (Y : S.Dia) : VSh S Λ (S.ofDia Y) ⥤ QpSh S Λ Y := sorry
def nuAdj (Y : S.LS) : nuSh S Λ Y ⊣ nuPush S Λ Y := sorry
def lambdaAdj (Y : S.Dia) : lambdaSh S Λ Y ⊣ lambdaPush S Λ Y := sorry

/-- Pullback along a map of small v-stacks on the v-derived categories (for 0-truncated maps the
pullback of the morphism of sites; in general through a Čech nerve, C3/pullback). -/
def vPull {Y' Y : S.V} (f : Y' ⟶ Y) : DV S Λ Y ⥤ DV S Λ Y' := sorry
/-- The étale embedding `D(X_ét, Λ) → D(X_v, Λ)` for strictly totally disconnected `X`
(`λ^* ν^*`, fully faithful by C0/unbounded-comparison-std). -/
def stdEmb (X : S.Std) : DEt S Λ (S.ofStd X) ⥤ DV S Λ (S.ofLS (S.ofStd X)) :=
  nuPull S Λ (S.ofStd X) ⋙ lambdaPull S Λ (S.lsDia.obj (S.ofStd X))

/-! ## The étale derived category (C2/etale-derived-category) -/

/-- C2/etale-derived-category: `D_ét(Y, Λ) ⊂ D(Y_v, Λ)`, the objects whose pullback to every
strictly totally disconnected `X → Y` lies in the essential image of `D(X_ét, Λ)` (ECD 14.13). -/
def Det (Y : S.V) : ObjectProperty (DV S Λ Y) := fun A =>
  ∀ (X : S.Std) (f : S.ofLS (S.ofStd X) ⟶ Y), (stdEmb S Λ X).essImage ((vPull S Λ f).obj A)

/-- The category `D_ét(Y, Λ)` as a full subcategory. -/
abbrev DetCat (Y : S.V) := (Det S Λ Y).FullSubcategory

/-- C0/std-etale-acyclic: for strictly totally disconnected `X`, étale sheaves on `X` are sheaves
on the space `|X|`. -/
def stdSpaceEquiv (X : S.Std) :
    EtSh S Λ (S.ofStd X) ≌ TopCat.Sheaf (ModuleCat.{u} Λ) (S.pts.obj (S.ofLS (S.ofStd X))) := sorry

/-! ## The four operations on D_ét (C3), cross-stage constructors -/

/-- C3/pullback: `f^* : D_ét(Y, Λ) → D_ét(Y', Λ)`. -/
def pull {Y' Y : S.V} (f : Y' ⟶ Y) : DetCat S Λ Y ⥤ DetCat S Λ Y' := sorry
/-- C3/pushforward: `Rf_* : D_ét(Y', Λ) → D_ét(Y, Λ)`. -/
def push {Y' Y : S.V} (f : Y' ⟶ Y) : DetCat S Λ Y' ⥤ DetCat S Λ Y := sorry
/-- C3/pushforward: `f^* ⊣ Rf_*` (ECD Lemma 17.5). -/
def pullPushAdj {Y' Y : S.V} (f : Y' ⟶ Y) : pull S Λ f ⊣ push S Λ f := sorry
/-- C3/etale-tensor: the derived tensor product on `D_ét(Y, Λ)`. -/
def etTensor (Y : S.V) : DetCat S Λ Y ⥤ DetCat S Λ Y ⥤ DetCat S Λ Y := sorry
/-- The unit: the constant sheaf `Λ_Y`. -/
def unitObj (Y : S.V) : DetCat S Λ Y := sorry
/-- C3/internal-hom: `RHom_Λ(−, −)` on `D_ét(Y, Λ)`. -/
def etHom (Y : S.V) : (DetCat S Λ Y)ᵒᵖ ⥤ DetCat S Λ Y ⥤ DetCat S Λ Y := sorry

/-- C5/etale-extension-by-zero: `f_!` for an étale `f : U → Y` (an object of `EtVOver Y`). -/
def etaleShriek {Y : S.V} (U : S.EtVOver Y) : DetCat S Λ ((S.etVSrc Y).obj U).left ⥤ DetCat S Λ Y := sorry
def etaleShriekAdj {Y : S.V} (U : S.EtVOver Y) :
    etaleShriek S Λ U ⊣ pull S Λ ((S.etVSrc Y).obj U).hom := sorry

/-! ## Proper and partially proper maps (C4), genuine definitions over the carriers

These are stated for maps of small v-sheaves; the 0-truncatedness clause needed for v-stacks
is not typable against `Carriers` and is omitted. -/

/-- Quasicompactness of a map, tested by pullback along maps from quasicompact objects (for small
v-sheaves `Z` quasicompactness is quasicompactness of `|Z|`). -/
def IsQuasicompactMap {X Y : S.V} (f : X ⟶ Y) : Prop :=
  ∀ (Z : S.V) (g : Z ⟶ Y), CompactSpace (S.pts.obj Z) → CompactSpace (S.pts.obj (pullback f g))

/-- C4/proper-map: universal closedness, `|X ×_Y Z| → |Z|` closed for all `Z → Y` (ECD 18.1). -/
def IsUniversallyClosed {X Y : S.V} (f : X ⟶ Y) : Prop :=
  ∀ (Z : S.V) (g : Z ⟶ Y), IsClosedMap (S.pts.map (pullback.snd f g))

/-- Separatedness of a map of small v-sheaves: the diagonal is a quasicompact universally closed
injection, i.e. a closed immersion. -/
def IsSeparatedMap {X Y : S.V} (f : X ⟶ Y) : Prop :=
  IsQuasicompactMap S (pullback.diagonal f) ∧ IsUniversallyClosed S (pullback.diagonal f)

/-- C4/proper-map: proper = quasicompact, separated and universally closed (ECD 18.1). -/
def IsProper {X Y : S.V} (f : X ⟶ Y) : Prop :=
  IsQuasicompactMap S f ∧ IsSeparatedMap S f ∧ IsUniversallyClosed S f

/-- C4/partially-proper-map: separated, with lifts along `Spa(R, R°) ⊂ Spa(R, R⁺)` for all perfectoid
Tate pairs (ECD 18.4). -/
def IsPartiallyProper {X Y : S.V} (f : X ⟶ Y) : Prop :=
  IsSeparatedMap S f ∧ ∀ (P : S.TatePair) (a : S.spaCirc P ⟶ X) (b : S.spa P ⟶ Y),
    a ≫ f = S.circIncl P ≫ b → ∃ c : S.spa P ⟶ X, S.circIncl P ≫ c = a ∧ c ≫ f = b

/-- C4/canonical-compactification: the canonical compactification of a (separated) map, with its
factorisation `X → X̄^{/Y} → Y` (ECD 18.6). Separatedness of `f` is a hypothesis of the
construction in the packet; it is omitted here. -/
def cpt {X Y : S.V} (f : X ⟶ Y) : S.V := sorry
def toCpt {X Y : S.V} (f : X ⟶ Y) : X ⟶ cpt S f := sorry
def cptMap {X Y : S.V} (f : X ⟶ Y) : cpt S f ⟶ Y := sorry

end TauCeti.DiamondEtale

/-! # Stages C0–C1 of BP-DiamondEtaleCohomology--C0: the sites, cutoff derived categories,
geometric stalks, the comparison morphisms `ν`, `λ`, the separated pro-étale hull `λ∘_X`,
ECD 14.2–14.11 (repleteness, left-completeness, comparisons) and ECD 16.1–16.10 (base change). -/
-- EXTRA IMPORTS: Mathlib.CategoryTheory.Sites.Over, Mathlib.Algebra.Homology.DerivedCategory.TStructure, Mathlib.CategoryTheory.Functor.OfSequence
namespace TauCeti.DiamondEtale
open CategoryTheory Limits Topology
attribute [local instance] HasDerivedCategory.standard
variable (S : Carriers.{u}) (Λ : Type u) [CommRing Λ]

open Opposite

/-! ## Supplier constructions used by C0–C1

These are data (objects, maps, isomorphisms) owned by DiamondsAndVStacks D4–D5 that `Carriers`
does not list; they are named here with `sorry` bodies. -/

/-- The spatial diamond `Spa(R, R⁺)^♢` of a perfectoid Tate pair as a locally spatial diamond
(DiamondsAndVStacks D5), with its identification with `S.spa P`. -/
def spaLS (P : S.TatePair) : S.LS := sorry
def spaLSIso (P : S.TatePair) : S.ofLS (spaLS S P) ≅ S.spa P := sorry

/-- The final object `id : Y → Y` of `Y_ét`. -/
def etTop (Y : S.LS) : S.EtOver Y := sorry
def etTopSrc (Y : S.LS) : (S.etSrc Y).obj (etTop S Y) ≅ Over.mk (𝟙 (S.ofLS Y)) := sorry
def etTopIsTerminal (Y : S.LS) : IsTerminal (etTop S Y) := sorry

-- omitted hypothesis (`qpTop`, `vTop`): `Y` is κ-small for the cutoff κ of `Carriers`.
/-- The final object `id : Y → Y` of `Y_qproét`. -/
def qpTop (Y : S.Dia) : S.QpOver Y := sorry
def qpTopSrc (Y : S.Dia) : (S.qpSrc Y).obj (qpTop S Y) ≅ Over.mk (𝟙 (S.ofDia Y)) := sorry

/-- The object `id : Y → Y` of `Y_v` for a diamond `Y` (a diamond is a small v-sheaf). -/
def vTop (Y : S.Dia) : S.VOver (S.ofDia Y) := sorry
def vTopSrc (Y : S.Dia) : (S.vSrc (S.ofDia Y)).obj (vTop S Y) ≅ Over.mk (𝟙 (S.ofDia Y)) := sorry

/-- The source of an étale map `U → Y` as a locally spatial diamond with its map to `Y`. -/
def etSlice {Y : S.LS} (U : S.EtOver Y) : S.LS := sorry
def etSliceι {Y : S.LS} (U : S.EtOver Y) : etSlice S U ⟶ Y := sorry
def etSliceIso {Y : S.LS} (U : S.EtOver Y) :
    (S.etSrc Y).obj U ≅ Over.mk (S.diaV.map (S.lsDia.map (etSliceι S U))) := sorry

/-- The source of a quasi-pro-étale map `U → Y` as a diamond with its map to `Y`. -/
def qpSlice {Y : S.Dia} (U : S.QpOver Y) : S.Dia := sorry
def qpSliceι {Y : S.Dia} (U : S.QpOver Y) : qpSlice S U ⟶ Y := sorry
def qpSliceIso {Y : S.Dia} (U : S.QpOver Y) :
    (S.qpSrc Y).obj U ≅ Over.mk (S.diaV.map (qpSliceι S U)) := sorry

/-- An étale map is quasi-pro-étale and a quasi-pro-étale map has a small v-sheaf as source:
the inclusions of sites are compatible with the source functors. -/
def etQpSrcIso (Y : S.LS) : S.etQp Y ⋙ S.qpSrc (S.lsDia.obj Y) ≅ S.etSrc Y := sorry
def qpVSrcIso (Y : S.Dia) : S.qpV Y ⋙ S.vSrc (S.ofDia Y) ≅ S.qpSrc Y := sorry

/-- Global sections `Γ(Y_ét, −)`: evaluation at the final object. -/
abbrev etGamma (Y : S.LS) : EtSh S Λ Y ⥤ ModuleCat.{u} Λ :=
  (sheafSections (etaleSite S Y) (ModuleCat.{u} Λ)).obj (op (etTop S Y))

/-! ## C0/etale-site -/

/-- DiamondEtaleCohomology:C0/etale-site (ECD Definition 14.1(i)): a family of étale maps generates
a covering sieve iff the images of the `|Y′_i|` cover `|Y′|`. -/
theorem etaleSite.mem_iff_surjective_points {Y : S.LS} {U : S.EtOver Y} {ι : Type u}
    (V : ι → S.EtOver Y) (g : ∀ i, V i ⟶ U) :
    Sieve.ofArrows V g ∈ etaleSite S Y U ↔
      ∀ x : S.pts.obj ((S.etSrc Y).obj U).left,
        ∃ i, x ∈ Set.range ⇑(S.pts.map ((S.etSrc Y).map (g i)).left) := sorry

/-- `Y_ét` has finite limits. -/
instance etaleSite.hasFiniteLimits (Y : S.LS) : HasFiniteLimits (S.EtOver Y) := sorry

/-- Finite limits in `Y_ét` are fibre products and equalizers of small v-stacks over `Y`. -/
theorem etaleSite.preservesFiniteLimits_src (Y : S.LS) : PreservesFiniteLimits (S.etSrc Y) :=
  sorry

/-- The slice `(Y_ét)/U` is the étale site of `U`. -/
def etaleSite.over_equiv {Y : S.LS} (U : S.EtOver Y) : Over U ≌ S.EtOver (etSlice S U) := sorry

/-- ... as sites: both functors of the equivalence are continuous. -/
theorem etaleSite.over_equiv_isContinuous {Y : S.LS} (U : S.EtOver Y) :
    (etaleSite.over_equiv S U).functor.IsContinuous ((etaleSite S Y).over U)
        (etaleSite S (etSlice S U)) ∧
      (etaleSite.over_equiv S U).inverse.IsContinuous (etaleSite S (etSlice S U))
        ((etaleSite S Y).over U) := sorry

/-- Base change `Z_ét → Y_ét`, `Z′ ↦ Z′ ×_Z Y`, along a map `f : Y → Z` of locally spatial
diamonds. -/
def etaleSite.pullback {Y Z : S.LS} (f : Y ⟶ Z) : S.EtOver Z ⥤ S.EtOver Y := sorry

instance etaleSite.pullback_isContinuous {Y Z : S.LS} (f : Y ⟶ Z) :
    (etaleSite.pullback S f).IsContinuous (etaleSite S Z) (etaleSite S Y) := sorry

theorem etaleSite.pullback_preservesFiniteLimits {Y Z : S.LS} (f : Y ⟶ Z) :
    PreservesFiniteLimits (etaleSite.pullback S f) := sorry

/-- The source of `Z′ ×_Z Y → Y` is the fibre product of small v-stacks. -/
def etaleSite.pullback_src {Y Z : S.LS} (f : Y ⟶ Z) (U : S.EtOver Z) :
    (S.etSrc Y).obj ((etaleSite.pullback S f).obj U) ≅
      Over.mk (Limits.pullback.snd ((S.etSrc Z).obj U).hom (S.diaV.map (S.lsDia.map f))) := sorry

/-- `(g ∘ f)_ét = g_ét ∘ f_ét`. -/
def etaleSite.pullback_comp {X Y Z : S.LS} (f : X ⟶ Y) (g : Y ⟶ Z) :
    etaleSite.pullback S (f ≫ g) ≅ etaleSite.pullback S g ⋙ etaleSite.pullback S f := sorry

/-- `id_ét = id`. -/
def etaleSite.pullback_id (Y : S.LS) : etaleSite.pullback S (𝟙 Y) ≅ 𝟭 _ := sorry

/-! Placeholder carriers for objects owned by other roadmaps and absent from `Carriers`: the
étale site of an affinoid perfectoid space (DiamondsAndVStacks D2) and analytic adic spaces over
`ℤ_p` with their étale sites (DiamondsAndVStacks D6). They are data with `sorry` bodies. -/

/-- The étale site of the affinoid perfectoid space `Spa(R, R⁺)` (DiamondsAndVStacks D2). -/
def PerfEtOver (P : S.TatePair) : Type u := sorry
instance (P : S.TatePair) : SmallCategory (PerfEtOver S P) := sorry
def perfEtSite (P : S.TatePair) : GrothendieckTopology (PerfEtOver S P) := sorry

/-- For a perfectoid space `X = Spa(R, R⁺)`, `X_ét` (of the diamond) is the étale site of the
perfectoid space `X`. Only affinoid perfectoid spaces `Spa(R, R⁺)` are available in `Carriers`. -/
def etaleSite.perfectoid_compat (P : S.TatePair) : PerfEtOver S P ≌ S.EtOver (spaLS S P) := sorry

/-- ... compatibly with coverings. -/
theorem etaleSite.perfectoid_compat_isContinuous (P : S.TatePair) :
    (etaleSite.perfectoid_compat S P).functor.IsContinuous (perfEtSite S P)
        (etaleSite S (spaLS S P)) ∧
      (etaleSite.perfectoid_compat S P).inverse.IsContinuous (etaleSite S (spaLS S P))
        (perfEtSite S P) := sorry

/-- Analytic adic spaces over `ℤ_p` (DiamondsAndVStacks D6). -/
def AnAdicSpace : Type (u+1) := sorry
/-- `Z ↦ Z^♢`, a locally spatial diamond (ECD Lemma 15.6). -/
def AnAdicSpace.diamond (Z : AnAdicSpace.{u}) : S.LS := sorry
/-- The étale site `Z_ét` of an analytic adic space (at the cutoff). -/
def AnAdicSpace.EtOver (Z : AnAdicSpace.{u}) : Type u := sorry
instance (Z : AnAdicSpace.{u}) : SmallCategory (AnAdicSpace.EtOver Z) := sorry
def AnAdicSpace.etaleSite (Z : AnAdicSpace.{u}) : GrothendieckTopology (AnAdicSpace.EtOver Z) :=
  sorry

/-- `(Z^♢)_ét ≃ Z_ét` for an analytic adic space `Z` over `ℤ_p` (ECD Lemma 15.6). -/
def etaleSite.adic_compat (Z : AnAdicSpace.{u}) :
    AnAdicSpace.EtOver Z ≌ S.EtOver (AnAdicSpace.diamond S Z) := sorry

theorem etaleSite.adic_compat_isContinuous (Z : AnAdicSpace.{u}) :
    (etaleSite.adic_compat S Z).functor.IsContinuous (AnAdicSpace.etaleSite Z)
        (etaleSite S (AnAdicSpace.diamond S Z)) ∧
      (etaleSite.adic_compat S Z).inverse.IsContinuous (etaleSite S (AnAdicSpace.diamond S Z))
        (AnAdicSpace.etaleSite Z) := sorry

-- omitted hypothesis (tests etaleSite_geometricPoint, etaleSite_chain): `C` algebraically closed
-- (and `C⁺ = O_C` for the first); not typable on `S.FieldPair`.
/-- test etaleSite_geometricPoint (computation): for `Y = Spa(C, O_C)`, `C` algebraically closed,
global sections `Y_ét^∼ → Λ-Mod` is an equivalence. -/
example (K : S.FieldPair) : (etGamma S Λ (spaLS S (S.fieldTate K))).IsEquivalence := by sorry

/-- test etaleSite_chain (computation): for `Y = Spa(C, C⁺)`, `C` algebraically closed, `Y_ét^∼` is
equivalent to sheaves on the totally ordered space `|Y|`. -/
example (K : S.FieldPair) :
    Nonempty (EtSh S Λ (spaLS S (S.fieldTate K)) ≌
      TopCat.Sheaf (ModuleCat.{u} Λ) (S.pts.obj (S.ofLS (spaLS S (S.fieldTate K))))) := by sorry

/-- test etaleSite_empty (degenerate): for `Y = ∅` (`|Y|` empty) the site has one object and the
topos is the terminal category. -/
example (Y : S.LS) (hY : IsEmpty (S.pts.obj (S.ofLS Y))) :
    Nonempty (Unique (S.EtOver Y)) ∧
      ∀ F : Sheaf (etaleSite S Y) (Type u), Nonempty (IsTerminal F) := by sorry

/-- test etaleSite_tilt (compatibility): `Spa(R, R⁺)^♢_ét` is the étale site of the perfectoid
space; the further identification with `Spa(R♭, R♭⁺)_ét` needs untilts, absent from `Carriers`. -/
example (P : S.TatePair) : Nonempty (PerfEtOver S P ≌ S.EtOver (spaLS S P)) := by sorry

/-- test etaleSite_not_qproet (non-example): not every quasi-pro-étale map is étale (e.g.
`Spa(C, O_C) × S → Spa(C, O_C)` for an infinite profinite set `S`). -/
example : ¬ ∀ (Y : S.LS) (U : S.QpOver (S.lsDia.obj Y)),
    ∃ W : S.EtOver Y, Nonempty ((S.etQp Y).obj W ≅ U) := by sorry

/-! ## Cutoff cardinals and cutoff skeleta (used by C0/quasi-pro-etale-site, v-site,
cutoff-derived-categories) -/

/-- Cutoff cardinals (ECD Lemma 4.1): uncountable strong limit cardinals of uncountable
cofinality such that every `λ < κ` is below the cofinality of some strong limit `κ_λ < κ`. -/
def IsCutoffCardinal (κ : Cardinal.{u}) : Prop :=
  Cardinal.aleph0 < κ ∧ κ.IsStrongLimit ∧ Cardinal.aleph0 < κ.ord.cof ∧
    ∀ l < κ, ∃ k < κ, k.IsStrongLimit ∧ l < k.ord.cof

/-- The cutoff at which `Carriers` fixes its skeleta `QpOver`, `VOver`. -/
def carrierCutoff : Cardinal.{u} := sorry

theorem carrierCutoff_isCutoff : IsCutoffCardinal (carrierCutoff.{u}) := sorry

/-- The κ-small skeleton `Y_qproét,κ` of the quasi-pro-étale site of a diamond. -/
def QpOverCut (Y : S.Dia) (κ : Cardinal.{u}) : Type u := sorry
instance (Y : S.Dia) (κ : Cardinal.{u}) : SmallCategory (QpOverCut S Y κ) := sorry
def qproetSiteCut (Y : S.Dia) (κ : Cardinal.{u}) : GrothendieckTopology (QpOverCut S Y κ) :=
  sorry
/-- The inclusion `Y_qproét,κ ⊂ Y_qproét,κ′` for `κ ≤ κ′`. -/
def qpCutIncl (Y : S.Dia) {κ κ' : Cardinal.{u}} (h : κ ≤ κ') :
    QpOverCut S Y κ ⥤ QpOverCut S Y κ' := sorry
/-- At the cutoff of `Carriers`, the skeleton is `S.QpOver Y`. -/
def qpCarrierEquiv (Y : S.Dia) : QpOverCut S Y carrierCutoff.{u} ≌ S.QpOver Y := sorry

abbrev QpShCut (Y : S.Dia) (κ : Cardinal.{u}) := Sheaf (qproetSiteCut S Y κ) (ModuleCat.{u} Λ)
/-- The induced functor on sheaf topoi `Y_qproét,κ^∼ → Y_qproét,κ′^∼` (left adjoint of
restriction along `qpCutIncl`). -/
def qpCutSh (Y : S.Dia) {κ κ' : Cardinal.{u}} (h : κ ≤ κ') :
    QpShCut S Λ Y κ ⥤ QpShCut S Λ Y κ' := sorry

/-- The κ-small skeleton `Y_v,κ` of the v-site of a small v-stack. -/
def VOverCut (Y : S.V) (κ : Cardinal.{u}) : Type u := sorry
instance (Y : S.V) (κ : Cardinal.{u}) : SmallCategory (VOverCut S Y κ) := sorry
def vSiteCut (Y : S.V) (κ : Cardinal.{u}) : GrothendieckTopology (VOverCut S Y κ) := sorry
def vCutIncl (Y : S.V) {κ κ' : Cardinal.{u}} (h : κ ≤ κ') : VOverCut S Y κ ⥤ VOverCut S Y κ' :=
  sorry
def vCarrierEquiv (Y : S.V) : VOverCut S Y carrierCutoff.{u} ≌ S.VOver Y := sorry

abbrev VShCut (Y : S.V) (κ : Cardinal.{u}) := Sheaf (vSiteCut S Y κ) (ModuleCat.{u} Λ)
def vCutSh (Y : S.V) {κ κ' : Cardinal.{u}} (h : κ ≤ κ') : VShCut S Λ Y κ ⥤ VShCut S Λ Y κ' :=
  sorry

/-! ## Distinguished full subsites (ECD Lemmas 14.4, 14.5 and Proposition 14.8) -/

/-- Objects of `Y_v` whose source is strictly totally disconnected. -/
def vStdObj (Y : S.V) : ObjectProperty (S.VOver Y) := fun U =>
  ∃ X : S.Std, Nonempty (((S.vSrc Y).obj U).left ≅ S.ofLS (S.ofStd X))

/-- Objects of `Y_qproét` whose source is strictly totally disconnected. -/
def qpStdObj (Y : S.Dia) : ObjectProperty (S.QpOver Y) := fun U =>
  ∃ X : S.Std, Nonempty (((S.qpSrc Y).obj U).left ≅ S.ofLS (S.ofStd X))

/-- `X_qproét,qc,sep`: quasicompact separated (pro-étale) maps `X′ → X`. -/
def qpQcSepObj (X : S.Std) : ObjectProperty (S.QpOver (S.lsDia.obj (S.ofStd X))) := fun U =>
  IsQuasicompactMap S ((S.qpSrc _).obj U).hom ∧ IsSeparatedMap S ((S.qpSrc _).obj U).hom

/-- `X_v,qcqs`: quasicompact quasiseparated maps `X′ → X` (representability of `X′`, required
in the proof of ECD Lemma 14.4, is not typable against `Carriers` and is omitted). -/
def vQcqsObj (X : S.Std) : ObjectProperty (S.VOver (S.ofLS (S.ofStd X))) := fun U =>
  IsQuasicompactMap S ((S.vSrc _).obj U).hom ∧
    IsQuasicompactMap S (pullback.diagonal ((S.vSrc _).obj U).hom)

/-- `Y_ét,qc,sep`: quasicompact separated étale maps `Y′ → Y`. -/
def etQcSepObj (Y : S.LS) : ObjectProperty (S.EtOver Y) := fun U =>
  IsQuasicompactMap S ((S.etSrc Y).obj U).hom ∧ IsSeparatedMap S ((S.etSrc Y).obj U).hom

/-! ## C0/quasi-pro-etale-site -/

/-- DiamondEtaleCohomology:C0/quasi-pro-etale-site: for cutoff cardinals `κ ≤ κ′` the functor on
sheaf topoi is fully faithful and preserves sections over objects of `Y_qproét,κ` (preservation
of higher cohomology is `cutoffDerived.transition_fullyFaithful`). -/
theorem qproetSite.restrict_fullyFaithful (Y : S.Dia) {κ κ' : Cardinal.{u}}
    (hκ : IsCutoffCardinal κ) (hκ' : IsCutoffCardinal κ') (h : κ ≤ κ') :
    (qpCutSh S Λ Y h).Full ∧ (qpCutSh S Λ Y h).Faithful ∧
      ∀ (U : QpOverCut S Y κ) (F : QpShCut S Λ Y κ),
        Nonempty (((qpCutSh S Λ Y h).obj F).obj.obj (op ((qpCutIncl S Y h).obj U)) ≅
          F.obj.obj (op U)) := sorry

/-- The slice of `Y_qproét` at `U` is `U_qproét`. -/
def qproetSite.over_equiv {Y : S.Dia} (U : S.QpOver Y) : Over U ≌ S.QpOver (qpSlice S U) :=
  sorry

theorem qproetSite.over_equiv_isContinuous {Y : S.Dia} (U : S.QpOver Y) :
    (qproetSite.over_equiv S U).functor.IsContinuous ((qproetSite S Y).over U)
        (qproetSite S (qpSlice S U)) ∧
      (qproetSite.over_equiv S U).inverse.IsContinuous (qproetSite S (qpSlice S U))
        ((qproetSite S Y).over U) := sorry

/-- Base change `Y_qproét → Y′_qproét` along a map `f : Y′ → Y` of diamonds. -/
def qproetSite.pullback {Y' Y : S.Dia} (f : Y' ⟶ Y) : S.QpOver Y ⥤ S.QpOver Y' := sorry

instance qproetSite.pullback_isContinuous {Y' Y : S.Dia} (f : Y' ⟶ Y) :
    (qproetSite.pullback S f).IsContinuous (qproetSite S Y) (qproetSite S Y') := sorry

theorem qproetSite.pullback_preservesFiniteLimits {Y' Y : S.Dia} (f : Y' ⟶ Y) :
    PreservesFiniteLimits (qproetSite.pullback S f) := sorry

def qproetSite.pullback_src {Y' Y : S.Dia} (f : Y' ⟶ Y) (U : S.QpOver Y) :
    (S.qpSrc Y').obj ((qproetSite.pullback S f).obj U) ≅
      Over.mk (Limits.pullback.snd ((S.qpSrc Y).obj U).hom (S.diaV.map f)) := sorry

def qproetSite.pullback_comp {X Y Z : S.Dia} (f : X ⟶ Y) (g : Y ⟶ Z) :
    qproetSite.pullback S (f ≫ g) ≅ qproetSite.pullback S g ⋙ qproetSite.pullback S f := sorry

def qproetSite.pullback_id (Y : S.Dia) : qproetSite.pullback S (𝟙 Y) ≅ 𝟭 _ := sorry

/-- `Y_ét → Y_qproét` preserves coverings and fibre products (its compatibility with sources is
`etQpSrcIso`). -/
theorem qproetSite.etale_le (Y : S.LS) :
    CoverPreserving (etaleSite S Y) (qproetSite S (S.lsDia.obj Y)) (S.etQp Y) ∧
      PreservesLimitsOfShape WalkingCospan (S.etQp Y) := sorry

/-- The underlying functor of `ν_Y` is continuous. -/
instance etQp_isContinuous (Y : S.LS) :
    (S.etQp Y).IsContinuous (etaleSite S Y) (qproetSite S (S.lsDia.obj Y)) := sorry

/-- Strictly totally disconnected spaces form a basis of `Y_qproét`. -/
theorem qproetSite.std_basis (Y : S.Dia) : (qpStdObj S Y).ι.IsCoverDense (qproetSite S Y) :=
  sorry

/-- test qproetSite_geometricPoint (computation): for `X = Spa(C, O_C)` the quasicompact separated
objects (the `X × S`, `S` profinite; profinite sets are not in `Carriers`) form a basis of
`X_qproét`, so sheaves on `X_qproét` are sheaves on them. -/
example (X : S.Std) :
    (qpQcSepObj S X).ι.IsCoverDense (qproetSite S (S.lsDia.obj (S.ofStd X))) := by sorry

/-- test qproetSite_empty (degenerate): for `Y = ∅` the topos is the terminal category. -/
example (Y : S.Dia) (hY : IsEmpty (S.pts.obj (S.ofDia Y))) :
    ∀ F : Sheaf (qproetSite S Y) (Type u), Nonempty (IsTerminal F) := by sorry

/-- test qproetSite_etale_object (compatibility): a jointly surjective étale family covers in
`Y_ét` and in `Y_qproét`. -/
example (Y : S.LS) (U : S.EtOver Y) (R : Sieve U) (hR : R ∈ etaleSite S Y U) :
    R.functorPushforward (S.etQp Y) ∈ qproetSite S (S.lsDia.obj Y) ((S.etQp Y).obj U) := by sorry

/-- test qproetSite_not_v (non-example): not every object of `Y_v` is quasi-pro-étale (e.g.
`Spa(C′, O_C′) → Spa(C, O_C)` for `C ⊊ C′`). -/
example : ¬ ∀ (Y : S.Dia) (U : S.VOver (S.ofDia Y)),
    ∃ W : S.QpOver Y, Nonempty ((S.qpV Y).obj W ≅ U) := by sorry

/-! ## C0/v-site -/

/-- DiamondEtaleCohomology:C0/v-site: for cutoff cardinals `κ ≤ κ′` the functor on sheaf topoi is
fully faithful and preserves sections. -/
theorem vSite.restrict_fullyFaithful (Y : S.V) {κ κ' : Cardinal.{u}}
    (hκ : IsCutoffCardinal κ) (hκ' : IsCutoffCardinal κ') (h : κ ≤ κ') :
    (vCutSh S Λ Y h).Full ∧ (vCutSh S Λ Y h).Faithful ∧
      ∀ (U : VOverCut S Y κ) (F : VShCut S Λ Y κ),
        Nonempty (((vCutSh S Λ Y h).obj F).obj.obj (op ((vCutIncl S Y h).obj U)) ≅
          F.obj.obj (op U)) := sorry

/-- Strictly totally disconnected spaces form a basis of `Y_v` (so restriction to them is an
equivalence of topoi by the comparison lemma). -/
theorem vSite.perfectoid_basis (Y : S.V) : (vStdObj S Y).ι.IsCoverDense (vSite S Y) := sorry

/-- The slice of `Y_v` at `U → Y` is `U_v`. -/
def vSite.over_equiv {Y : S.V} (U : S.VOver Y) : Over U ≌ S.VOver ((S.vSrc Y).obj U).left :=
  sorry

theorem vSite.over_equiv_isContinuous {Y : S.V} (U : S.VOver Y) :
    (vSite.over_equiv S U).functor.IsContinuous ((vSite S Y).over U)
        (vSite S ((S.vSrc Y).obj U).left) ∧
      (vSite.over_equiv S U).inverse.IsContinuous (vSite S ((S.vSrc Y).obj U).left)
        ((vSite S Y).over U) := sorry

-- omitted hypothesis: `f` is 0-truncated (not typable against `Carriers`; maps of diamonds,
-- the only ones used below, are 0-truncated).
/-- Base change `Y_v → Y′_v` along a 0-truncated map `f : Y′ → Y`. -/
def vSite.pullback_zeroTruncated {Y' Y : S.V} (f : Y' ⟶ Y) : S.VOver Y ⥤ S.VOver Y' := sorry

-- omitted hypothesis: `f` is 0-truncated.
instance vSite.pullback_isContinuous {Y' Y : S.V} (f : Y' ⟶ Y) :
    (vSite.pullback_zeroTruncated S f).IsContinuous (vSite S Y) (vSite S Y') := sorry

def vSite.pullback_src {Y' Y : S.V} (f : Y' ⟶ Y) (U : S.VOver Y) :
    (S.vSrc Y').obj ((vSite.pullback_zeroTruncated S f).obj U) ≅
      Over.mk (Limits.pullback.snd ((S.vSrc Y).obj U).hom f) := sorry

def vSite.pullback_comp {X Y Z : S.V} (f : X ⟶ Y) (g : Y ⟶ Z) :
    vSite.pullback_zeroTruncated S (f ≫ g) ≅
      vSite.pullback_zeroTruncated S g ⋙ vSite.pullback_zeroTruncated S f := sorry

/-- The v-site is subcanonical. -/
theorem vSite.representable_isSheaf (Y : S.V) (U : S.VOver Y) :
    Presheaf.IsSheaf (vSite S Y) (yoneda.obj U) := sorry

/-- The underlying functor of `λ_Y` is continuous. -/
instance qpV_isContinuous (Y : S.Dia) :
    (S.qpV Y).IsContinuous (qproetSite S Y) (vSite S (S.ofDia Y)) := sorry

/-- test vSite_empty (degenerate): for `Y = ∅` the topos is the terminal category. -/
example (Y : S.V) (hY : IsEmpty (S.pts.obj Y)) :
    ∀ F : Sheaf (vSite S Y) (Type u), Nonempty (IsTerminal F) := by sorry

/-- test vSite_subcanonical (characterisation): `Hom_Y(−, Y′)` is a sheaf on `Y_v`. -/
example (Y : S.V) (U : S.VOver Y) : Presheaf.IsSheaf (vSite S Y) (yoneda.obj U) := by sorry

/-- test vSite_perfectoid_compat (compatibility): for a perfectoid space `X` (here strictly totally
disconnected) the perfectoid objects form a basis of `X_v`; the identification with the v-site of
DiamondsAndVStacks D2 is not typable against `Carriers`. -/
example (X : S.Std) : (vStdObj S (S.ofLS (S.ofStd X))).ι.IsCoverDense (vSite S _) := by sorry

/-- test vSite_not_qproet (non-example): some v-covers are not quasi-pro-étale, so
`Y_qproét → Y_v` is not essentially surjective for some diamond `Y`. -/
example : ∃ Y : S.Dia, ¬ (S.qpV Y).EssSurj := by sorry

/-! ## Pullback and pushforward on the three sites (C0/comparison-morphisms, C1) -/

/-- `f_ét*` on sheaves: restriction along the continuous base-change functor. -/
abbrev etPushSh {Y' Y : S.LS} (f : Y' ⟶ Y) : EtSh S Λ Y' ⥤ EtSh S Λ Y :=
  (etaleSite.pullback S f).sheafPushforwardContinuous (ModuleCat.{u} Λ) (etaleSite S Y)
    (etaleSite S Y')
/-- `f_ét^*` on sheaves. -/
def etPullSh {Y' Y : S.LS} (f : Y' ⟶ Y) : EtSh S Λ Y ⥤ EtSh S Λ Y' := sorry
def etAdjSh {Y' Y : S.LS} (f : Y' ⟶ Y) : etPullSh S Λ f ⊣ etPushSh S Λ f := sorry
/-- `f_ét^*` and `Rf_ét*` on derived categories. -/
def etPullD {Y' Y : S.LS} (f : Y' ⟶ Y) : DEt S Λ Y ⥤ DEt S Λ Y' := sorry
def etPushD {Y' Y : S.LS} (f : Y' ⟶ Y) : DEt S Λ Y' ⥤ DEt S Λ Y := sorry
def etAdjD {Y' Y : S.LS} (f : Y' ⟶ Y) : etPullD S Λ f ⊣ etPushD S Λ f := sorry
/-- `(a ≫ b)^* ≅ a^* ∘ b^*` (diagrammatic order). -/
def etPullD_comp {A B C : S.LS} (a : A ⟶ B) (b : B ⟶ C) (c : A ⟶ C) (h : a ≫ b = c) :
    etPullD S Λ c ≅ etPullD S Λ b ⋙ etPullD S Λ a := sorry
/-- `f_ét^*` is t-exact. -/
def etPullD_homology {Y' Y : S.LS} (f : Y' ⟶ Y) (i : ℤ) :
    etPullD S Λ f ⋙ DerivedCategory.homologyFunctor _ i ≅
      DerivedCategory.homologyFunctor _ i ⋙ etPullSh S Λ f := sorry
def etPullD_single {Y' Y : S.LS} (f : Y' ⟶ Y) :
    DerivedCategory.singleFunctor _ 0 ⋙ etPullD S Λ f ≅
      etPullSh S Λ f ⋙ DerivedCategory.singleFunctor _ 0 := sorry
/-- `R^i f_ét*`. -/
abbrev etHigherPush {Y' Y : S.LS} (f : Y' ⟶ Y) (i : ℤ) : EtSh S Λ Y' ⥤ EtSh S Λ Y :=
  DerivedCategory.singleFunctor _ 0 ⋙ etPushD S Λ f ⋙ DerivedCategory.homologyFunctor _ i

/-- `f_qproét*` on sheaves: restriction along the continuous base-change functor. -/
abbrev qpPushSh {Y' Y : S.Dia} (f : Y' ⟶ Y) : QpSh S Λ Y' ⥤ QpSh S Λ Y :=
  (qproetSite.pullback S f).sheafPushforwardContinuous (ModuleCat.{u} Λ) (qproetSite S Y)
    (qproetSite S Y')
def qpPullSh {Y' Y : S.Dia} (f : Y' ⟶ Y) : QpSh S Λ Y ⥤ QpSh S Λ Y' := sorry
def qpAdjSh {Y' Y : S.Dia} (f : Y' ⟶ Y) : qpPullSh S Λ f ⊣ qpPushSh S Λ f := sorry
def qpPullSh_comp {A B C : S.Dia} (a : A ⟶ B) (b : B ⟶ C) (c : A ⟶ C) (h : a ≫ b = c) :
    qpPullSh S Λ c ≅ qpPullSh S Λ b ⋙ qpPullSh S Λ a := sorry
def qpPullD {Y' Y : S.Dia} (f : Y' ⟶ Y) : DQp S Λ Y ⥤ DQp S Λ Y' := sorry
def qpPushD {Y' Y : S.Dia} (f : Y' ⟶ Y) : DQp S Λ Y' ⥤ DQp S Λ Y := sorry
def qpAdjD {Y' Y : S.Dia} (f : Y' ⟶ Y) : qpPullD S Λ f ⊣ qpPushD S Λ f := sorry
def qpPullD_comp {A B C : S.Dia} (a : A ⟶ B) (b : B ⟶ C) (c : A ⟶ C) (h : a ≫ b = c) :
    qpPullD S Λ c ≅ qpPullD S Λ b ⋙ qpPullD S Λ a := sorry
def qpPushD_comp {A B C : S.Dia} (a : A ⟶ B) (b : B ⟶ C) (c : A ⟶ C) (h : a ≫ b = c) :
    qpPushD S Λ c ≅ qpPushD S Λ a ⋙ qpPushD S Λ b := sorry
def qpPushD_id {A : S.Dia} (a : A ⟶ A) (h : a = 𝟙 A) : qpPushD S Λ a ≅ 𝟭 _ := sorry
def qpPullD_homology {Y' Y : S.Dia} (f : Y' ⟶ Y) (i : ℤ) :
    qpPullD S Λ f ⋙ DerivedCategory.homologyFunctor _ i ≅
      DerivedCategory.homologyFunctor _ i ⋙ qpPullSh S Λ f := sorry
def qpPullD_single {Y' Y : S.Dia} (f : Y' ⟶ Y) :
    DerivedCategory.singleFunctor _ 0 ⋙ qpPullD S Λ f ≅
      qpPullSh S Λ f ⋙ DerivedCategory.singleFunctor _ 0 := sorry
abbrev qpHigherPush {Y' Y : S.Dia} (f : Y' ⟶ Y) (i : ℤ) : QpSh S Λ Y' ⥤ QpSh S Λ Y :=
  DerivedCategory.singleFunctor _ 0 ⋙ qpPushD S Λ f ⋙ DerivedCategory.homologyFunctor _ i

-- omitted hypothesis (all `v`-pushforwards): `f` is 0-truncated.
/-- `f_v*` on sheaves: restriction along the continuous base-change functor. -/
abbrev vPushSh {Y' Y : S.V} (f : Y' ⟶ Y) : VSh S Λ Y' ⥤ VSh S Λ Y :=
  (vSite.pullback_zeroTruncated S f).sheafPushforwardContinuous (ModuleCat.{u} Λ) (vSite S Y)
    (vSite S Y')
def vPullSh {Y' Y : S.V} (f : Y' ⟶ Y) : VSh S Λ Y ⥤ VSh S Λ Y' := sorry
def vAdjSh {Y' Y : S.V} (f : Y' ⟶ Y) : vPullSh S Λ f ⊣ vPushSh S Λ f := sorry
def vPullSh_comp {A B C : S.V} (a : A ⟶ B) (b : B ⟶ C) (c : A ⟶ C) (h : a ≫ b = c) :
    vPullSh S Λ c ≅ vPullSh S Λ b ⋙ vPullSh S Λ a := sorry
/-- `Rf_v*` on derived categories, right adjoint of `vPull`. -/
def vPushD {Y' Y : S.V} (f : Y' ⟶ Y) : DV S Λ Y' ⥤ DV S Λ Y := sorry
def vAdjD {Y' Y : S.V} (f : Y' ⟶ Y) : vPull S Λ f ⊣ vPushD S Λ f := sorry
def vPull_comp {A B C : S.V} (a : A ⟶ B) (b : B ⟶ C) (c : A ⟶ C) (h : a ≫ b = c) :
    vPull S Λ c ≅ vPull S Λ b ⋙ vPull S Λ a := sorry
def vPushD_comp {A B C : S.V} (a : A ⟶ B) (b : B ⟶ C) (c : A ⟶ C) (h : a ≫ b = c) :
    vPushD S Λ c ≅ vPushD S Λ a ⋙ vPushD S Λ b := sorry
def vPushD_id {A : S.V} (a : A ⟶ A) (h : a = 𝟙 A) : vPushD S Λ a ≅ 𝟭 _ := sorry
def vPull_homology {Y' Y : S.V} (f : Y' ⟶ Y) (i : ℤ) :
    vPull S Λ f ⋙ DerivedCategory.homologyFunctor _ i ≅
      DerivedCategory.homologyFunctor _ i ⋙ vPullSh S Λ f := sorry
abbrev vHigherPush {Y' Y : S.V} (f : Y' ⟶ Y) (i : ℤ) : VSh S Λ Y' ⥤ VSh S Λ Y :=
  DerivedCategory.singleFunctor _ 0 ⋙ vPushD S Λ f ⋙ DerivedCategory.homologyFunctor _ i

/-! ## C0/cutoff-derived-categories -/

/-- `D(Y_v,κ, Λ)` and `D(Y_qproét,κ, Λ)` at a cutoff `κ`. -/
abbrev DVCut (Y : S.V) (κ : Cardinal.{u}) := DerivedCategory (VShCut S Λ Y κ)
abbrev DQpCut (Y : S.Dia) (κ : Cardinal.{u}) := DerivedCategory (QpShCut S Λ Y κ)

/-- The transition functor `D(Y_v,κ, Λ) → D(Y_v,κ′, Λ)` for `κ ≤ κ′`. -/
def cutoffDerived.transition (Y : S.V) {κ κ' : Cardinal.{u}} (h : κ ≤ κ') :
    DVCut S Λ Y κ ⥤ DVCut S Λ Y κ' := sorry
instance cutoffDerived.transition_commShift (Y : S.V) {κ κ' : Cardinal.{u}} (h : κ ≤ κ') :
    (cutoffDerived.transition S Λ Y h).CommShift ℤ := sorry
/-- The transition functor `D(Y_qproét,κ, Λ) → D(Y_qproét,κ′, Λ)`. -/
def cutoffDerived.qpTransition (Y : S.Dia) {κ κ' : Cardinal.{u}} (h : κ ≤ κ') :
    DQpCut S Λ Y κ ⥤ DQpCut S Λ Y κ' := sorry

/-- DiamondEtaleCohomology:C0/cutoff-derived-categories: for cutoff cardinals `κ ≤ κ′` the
transition functor is fully faithful and triangulated (commutes with shifts and cones). -/
theorem cutoffDerived.transition_fullyFaithful (Y : S.V) {κ κ' : Cardinal.{u}}
    (hκ : IsCutoffCardinal κ) (hκ' : IsCutoffCardinal κ') (h : κ ≤ κ') :
    (cutoffDerived.transition S Λ Y h).Full ∧ (cutoffDerived.transition S Λ Y h).Faithful ∧
      (cutoffDerived.transition S Λ Y h).IsTriangulated := sorry

/-- The quasi-pro-étale transition functors are fully faithful. -/
theorem cutoffDerived.qpTransition_fullyFaithful (Y : S.Dia) {κ κ' : Cardinal.{u}}
    (hκ : IsCutoffCardinal κ) (hκ' : IsCutoffCardinal κ') (h : κ ≤ κ') :
    (cutoffDerived.qpTransition S Λ Y h).Full ∧ (cutoffDerived.qpTransition S Λ Y h).Faithful :=
  sorry

/-- The transition functors commute with the cohomology sheaves (hence with canonical
truncations). -/
def cutoffDerived.transition_homology (Y : S.V) {κ κ' : Cardinal.{u}} (h : κ ≤ κ') (i : ℤ) :
    cutoffDerived.transition S Λ Y h ⋙ DerivedCategory.homologyFunctor _ i ≅
      DerivedCategory.homologyFunctor _ i ⋙ vCutSh S Λ Y h := sorry

/-- The category `D(Y_v, Λ)` of all small objects, the filtered colimit over cutoffs. -/
def DVSmall (Λ : Type u) [CommRing Λ] (Y : S.V) : Type (u+1) := sorry
instance (Y : S.V) : Category.{u+1} (DVSmall S Λ Y) := sorry

/-- The functor `D(Y_v,κ, Λ) → D(Y_v, Λ)`. -/
def cutoffDerived.ofCutoff (Y : S.V) (κ : Cardinal.{u}) : DVCut S Λ Y κ ⥤ DVSmall S Λ Y := sorry

/-- Every object of `D(Y_v, Λ)` comes from some cutoff, and Hom groups are computed at any cutoff
(the functors from cutoffs are fully faithful). -/
theorem cutoffDerived.ofCutoff_spec (Y : S.V) :
    (∀ κ : Cardinal.{u}, IsCutoffCardinal κ →
        (cutoffDerived.ofCutoff S Λ Y κ).Full ∧ (cutoffDerived.ofCutoff S Λ Y κ).Faithful) ∧
      ∀ A : DVSmall S Λ Y, ∃ κ : Cardinal.{u}, IsCutoffCardinal κ ∧
        (cutoffDerived.ofCutoff S Λ Y κ).essImage A := sorry

/-- The functors from cutoffs are compatible with the transitions. -/
def cutoffDerived.ofCutoff_transition (Y : S.V) {κ κ' : Cardinal.{u}} (h : κ ≤ κ') :
    cutoffDerived.transition S Λ Y h ⋙ cutoffDerived.ofCutoff S Λ Y κ' ≅
      cutoffDerived.ofCutoff S Λ Y κ := sorry

/-- The canonical t-structure on `D(Y_v,κ, Λ)`; `D⁺`, `D⁻`, `D^b` are its `plus`, `minus`,
`bounded` subcategories. -/
abbrev cutoffDerived.tStructure (Y : S.V) (κ : Cardinal.{u}) :
    Triangulated.TStructure (DVCut S Λ Y κ) := DerivedCategory.TStructure.t

/-- The transitions are t-exact: `H^i` is computed at any cutoff. -/
theorem cutoffDerived.tStructure_transition (Y : S.V) {κ κ' : Cardinal.{u}}
    (hκ : IsCutoffCardinal κ) (hκ' : IsCutoffCardinal κ') (h : κ ≤ κ') (A : DVCut S Λ Y κ)
    (n : ℤ) :
    ((cutoffDerived.tStructure S Λ Y κ).IsLE A n ↔
        (cutoffDerived.tStructure S Λ Y κ').IsLE ((cutoffDerived.transition S Λ Y h).obj A) n) ∧
      ((cutoffDerived.tStructure S Λ Y κ).IsGE A n ↔
        (cutoffDerived.tStructure S Λ Y κ').IsGE ((cutoffDerived.transition S Λ Y h).obj A) n) :=
  sorry

/-- `λ_Y^*` is t-exact: it commutes with the cohomology sheaves. -/
def cutoffDerived.pullback (Y : S.Dia) (i : ℤ) :
    lambdaPull S Λ Y ⋙ DerivedCategory.homologyFunctor _ i ≅
      DerivedCategory.homologyFunctor _ i ⋙ lambdaSh S Λ Y := sorry
def cutoffDerived.pullback_single (Y : S.Dia) :
    DerivedCategory.singleFunctor _ 0 ⋙ lambdaPull S Λ Y ≅
      lambdaSh S Λ Y ⋙ DerivedCategory.singleFunctor _ 0 := sorry
/-- `ν_Y^*` is t-exact. -/
def cutoffDerived.pullback_nu (Y : S.LS) (i : ℤ) :
    nuPull S Λ Y ⋙ DerivedCategory.homologyFunctor _ i ≅
      DerivedCategory.homologyFunctor _ i ⋙ nuSh S Λ Y := sorry
def cutoffDerived.pullback_nu_single (Y : S.LS) :
    DerivedCategory.singleFunctor _ 0 ⋙ nuPull S Λ Y ≅
      nuSh S Λ Y ⋙ DerivedCategory.singleFunctor _ 0 := sorry

/-- test cutoffDerived_zeroRing (degenerate): for `Λ = 0` every `D(Y_v, Λ)` is zero. -/
example [Subsingleton Λ] (Y : S.V) (A : DV S Λ Y) : IsZero A := by sorry

/-- test cutoffDerived_cohomology_transition (characterisation): `H^i` of the image of `A` at
`κ′` is the image of `H^i(A)`. -/
example (Y : S.V) {κ κ' : Cardinal.{u}} (h : κ ≤ κ') (i : ℤ) (A : DVCut S Λ Y κ) :
    Nonempty ((DerivedCategory.homologyFunctor _ i).obj ((cutoffDerived.transition S Λ Y h).obj A)
      ≅ (vCutSh S Λ Y h).obj ((DerivedCategory.homologyFunctor _ i).obj A)) := by sorry

/-- test cutoffDerived_set_generated (compatibility): at a fixed cutoff, `D(Y_v,κ, Λ)` is Mathlib's
`DerivedCategory` of the abelian category of sheaves of Λ-modules on `Y_v,κ`. -/
example (Y : S.V) (κ : Cardinal.{u}) :
    DVCut S Λ Y κ = DerivedCategory (Sheaf (vSiteCut S Y κ) (ModuleCat.{u} Λ)) := by sorry

/-- test cutoffDerived_not_one_topos (non-example): for `Y ≠ ∅` no single cutoff suffices: some
transition is not essentially surjective. -/
example [Nontrivial Λ] (Y : S.V) (hY : Nonempty (S.pts.obj Y)) (κ : Cardinal.{u})
    (hκ : IsCutoffCardinal κ) :
    ∃ (κ' : Cardinal.{u}) (h : κ ≤ κ'), IsCutoffCardinal κ' ∧
      ¬ (cutoffDerived.transition S Λ Y h).EssSurj := by sorry

/-! ## C0/algebraic-topoi -/

/-- Topos-theoretic quasicompactness of an object of a site: every covering sieve contains a finite
covering family. -/
def IsQuasicompactObject {C : Type u} [SmallCategory C] (J : GrothendieckTopology C) (U : C) :
    Prop :=
  ∀ R ∈ J U, ∃ (n : ℕ) (V : Fin n → C) (g : ∀ i, V i ⟶ U), (∀ i, R (g i)) ∧ Sieve.ofArrows V g ∈ J U

/-- Topos-theoretic quasiseparatedness: fibre products over `U` of quasicompact objects are
quasicompact. -/
def IsQuasiseparatedObject {C : Type u} [SmallCategory C] (J : GrothendieckTopology C) (U : C) :
    Prop :=
  ∀ ⦃W V₁ V₂ : C⦄ (p₁ : W ⟶ V₁) (p₂ : W ⟶ V₂) (g₁ : V₁ ⟶ U) (g₂ : V₂ ⟶ U),
    IsPullback p₁ p₂ g₁ g₂ → IsQuasicompactObject J V₁ → IsQuasicompactObject J V₂ →
      IsQuasicompactObject J W

-- omitted: the assertion that the topoi are algebraic (SGA 4 VI 2.3); algebraic and coherent
-- topoi are not in Mathlib.
-- omitted hypothesis (third clause): `Y` is 0-truncated (a small v-sheaf).
/-- DiamondEtaleCohomology:C0/algebraic-topoi (ECD Proposition 14.2): topos-theoretic
quasicompactness and quasiseparatedness of objects agree with those of small v-stacks. -/
theorem algebraicTopoi :
    (∀ (Y : S.LS) (U : S.EtOver Y),
      (IsQuasicompactObject (etaleSite S Y) U ↔
          CompactSpace (S.pts.obj ((S.etSrc Y).obj U).left)) ∧
        (IsQuasiseparatedObject (etaleSite S Y) U ↔
          IsQuasicompactMap S (pullback.diagonal (terminal.from ((S.etSrc Y).obj U).left)))) ∧
    (∀ (Y : S.Dia) (U : S.QpOver Y),
      (IsQuasicompactObject (qproetSite S Y) U ↔
          CompactSpace (S.pts.obj ((S.qpSrc Y).obj U).left)) ∧
        (IsQuasiseparatedObject (qproetSite S Y) U ↔
          IsQuasicompactMap S (pullback.diagonal (terminal.from ((S.qpSrc Y).obj U).left)))) ∧
    (∀ (Y : S.V) (U : S.VOver Y),
      (IsQuasicompactObject (vSite S Y) U ↔
          CompactSpace (S.pts.obj ((S.vSrc Y).obj U).left)) ∧
        (IsQuasiseparatedObject (vSite S Y) U ↔
          IsQuasicompactMap S (pullback.diagonal (terminal.from ((S.vSrc Y).obj U).left)))) :=
  sorry

/-! ## C0/geometric-stalk and C0/etale-site-enough-points

A geometric point of a locally spatial diamond `Y` is given by a perfectoid field pair
`K = (C, C⁺)` and a map `ȳ : Spa(C, C⁺) → Y`.
omitted hypotheses (all declarations of this section): `C` is algebraically closed, `ȳ` is
quasi-pro-étale and sends the closed point to the given `y ∈ |Y|` (not typable against
`Carriers`). -/

/-- The fibre functor of a geometric point: `U ↦ {lifts of ȳ to U}`. The stalk is the colimit of
`F(U)` over its category of elements, i.e. over the étale neighbourhoods `ȳ → U`. -/
def geometricStalk.fiber (Y : S.LS) (K : S.FieldPair) (ybar : spaLS S (S.fieldTate K) ⟶ Y) :
    S.EtOver Y ⥤ Type u where
  obj U := { g : S.ofLS (spaLS S (S.fieldTate K)) ⟶ ((S.etSrc Y).obj U).left //
    g ≫ ((S.etSrc Y).obj U).hom = S.diaV.map (S.lsDia.map ybar) }
  map φ := TypeCat.ofHom fun g =>
    ⟨g.1 ≫ ((S.etSrc Y).map φ).left, by rw [Category.assoc, Over.w]; exact g.2⟩
  map_id := sorry
  map_comp := sorry

/-- The point of the site `Y_ét` (in the sense of Mathlib's `GrothendieckTopology.Point`)
defined by a geometric point. -/
def geometricStalk.toPoint (Y : S.LS) (K : S.FieldPair) (ybar : spaLS S (S.fieldTate K) ⟶ Y) :
    (etaleSite S Y).Point.{u} where
  fiber := geometricStalk.fiber S Y K ybar
  isCofiltered := sorry
  initiallySmall := sorry
  jointly_surjective := sorry

/-- DiamondEtaleCohomology:C0/geometric-stalk: the stalk functor `F ↦ F_ȳ` on sheaves of
Λ-modules, the fibre functor of the point `geometricStalk.toPoint`. -/
def geometricStalk (Y : S.LS) (K : S.FieldPair) (ybar : spaLS S (S.fieldTate K) ⟶ Y) :
    EtSh S Λ Y ⥤ ModuleCat.{u} Λ :=
  (geometricStalk.toPoint S Y K ybar).sheafFiber

/-- `F_ȳ ≅ Γ(Spa(C, C⁺)_ét, ȳ^*F)`, naturally in `F`. -/
def geometricStalk.eq_pullback_sections (Y : S.LS) (K : S.FieldPair)
    (ybar : spaLS S (S.fieldTate K) ⟶ Y) :
    geometricStalk S Λ Y K ybar ≅ etPullSh S Λ ybar ⋙ etGamma S Λ (spaLS S (S.fieldTate K)) :=
  sorry

/-- The stalk functor is exact and commutes with all colimits (on sheaves of sets and of
Λ-modules). -/
theorem geometricStalk.exact (Y : S.LS) (K : S.FieldPair) (ybar : spaLS S (S.fieldTate K) ⟶ Y) :
    PreservesFiniteLimits (geometricStalk S Λ Y K ybar) ∧
      PreservesColimitsOfSize.{u, u} (geometricStalk S Λ Y K ybar) ∧
      PreservesFiniteLimits ((geometricStalk.toPoint S Y K ybar).sheafFiber (A := Type u)) ∧
      PreservesColimitsOfSize.{u, u}
        ((geometricStalk.toPoint S Y K ybar).sheafFiber (A := Type u)) := sorry

/-- `(f_ét^*F)_ȳ′ ≅ F_{f∘ȳ′}`. -/
def geometricStalk.map {Y' Y : S.LS} (f : Y' ⟶ Y) (K : S.FieldPair)
    (ybar' : spaLS S (S.fieldTate K) ⟶ Y') :
    etPullSh S Λ f ⋙ geometricStalk S Λ Y' K ybar' ≅ geometricStalk S Λ Y K (ybar' ≫ f) := sorry

/-- The stalk of the constant sheaf with value `M` is `M`. -/
def geometricStalk.of_constant (Y : S.LS) (K : S.FieldPair) (ybar : spaLS S (S.fieldTate K) ⟶ Y) :
    constantSheaf (etaleSite S Y) (ModuleCat.{u} Λ) ⋙ geometricStalk S Λ Y K ybar ≅ 𝟭 _ := sorry

/-- test geometricStalk_closedPoint (computation): for `Y = Spa(C, C⁺)` and `ȳ = id`,
`F_ȳ = F(Y)`. -/
example (K : S.FieldPair) :
    Nonempty (geometricStalk S Λ (spaLS S (S.fieldTate K)) K (𝟙 _) ≅
      etGamma S Λ (spaLS S (S.fieldTate K))) := by sorry

/-- test geometricStalk_constant (degenerate): the stalk of the constant sheaf `M` is `M`. -/
example (Y : S.LS) (K : S.FieldPair) (ybar : spaLS S (S.fieldTate K) ⟶ Y) (M : ModuleCat.{u} Λ) :
    Nonempty ((geometricStalk S Λ Y K ybar).obj ((constantSheaf (etaleSite S Y) _).obj M) ≅ M) := by
  sorry

/-- test geometricStalk_isPoint (compatibility): `geometricStalk` is the fibre functor of a
`GrothendieckTopology.Point` of `Y_ét`. -/
example (Y : S.LS) (K : S.FieldPair) (ybar : spaLS S (S.fieldTate K) ⟶ Y) :
    geometricStalk S Λ Y K ybar = (geometricStalk.toPoint S Y K ybar).sheafFiber := by sorry

/-- test geometricStalk_generic_vs_global (non-example): stalks at generalizations are not global
sections (for `Y = Spa(C, C⁺)` of rank 2, `j_!M` has `F(Y) = 0` but `F_η̄ = M`). -/
example [Nontrivial Λ] :
    ¬ ∀ (K K' : S.FieldPair) (eta : spaLS S (S.fieldTate K') ⟶ spaLS S (S.fieldTate K)),
      Nonempty (geometricStalk S Λ _ K' eta ≅ etGamma S Λ (spaLS S (S.fieldTate K))) := by sorry

/-- DiamondEtaleCohomology:C0/etale-site-enough-points (ECD Proposition 14.3): the geometric
points form a conservative family of points of `Y_ét`. -/
theorem etaleSiteEnoughPoints (Y : S.LS) :
    ObjectProperty.IsConservativeFamilyOfPoints
      (fun Φ : (etaleSite S Y).Point.{u} => ∃ (K : S.FieldPair)
        (ybar : spaLS S (S.fieldTate K) ⟶ Y), Φ = geometricStalk.toPoint S Y K ybar) := sorry

theorem etaleSiteEnoughPoints.hasEnoughPoints (Y : S.LS) :
    GrothendieckTopology.HasEnoughPoints.{u} (etaleSite S Y) := sorry

/-- A map of étale sheaves of Λ-modules is an isomorphism iff it is so on all geometric stalks. -/
theorem etaleSiteEnoughPoints.isIso_iff {Y : S.LS} {F G : EtSh S Λ Y} (φ : F ⟶ G) :
    IsIso φ ↔ ∀ (K : S.FieldPair) (ybar : spaLS S (S.fieldTate K) ⟶ Y),
      IsIso ((geometricStalk S Λ Y K ybar).map φ) := sorry

/-- A section is zero iff all its germs at geometric points are zero. -/
theorem etaleSiteEnoughPoints.section_eq_zero {Y : S.LS} (F : EtSh S Λ Y) (U : S.EtOver Y)
    (s : F.obj.obj (op U)) :
    s = 0 ↔ ∀ (K : S.FieldPair) (ybar : spaLS S (S.fieldTate K) ⟶ Y)
      (x : (geometricStalk.fiber S Y K ybar).obj U),
        ((geometricStalk.toPoint S Y K ybar).toPresheafFiber U x F.obj).hom s = 0 := sorry

/-! ## C0/comparison-morphisms -/

/-- DiamondEtaleCohomology:C0/comparison-morphisms: the morphism of topoi
`λ_Y : Y_v^∼ → Y_qproét^∼`, recorded as the adjunction `λ_Y^* ⊣ λ_Y*`. -/
def lambdaY (Y : S.Dia) : lambdaSh S Λ Y ⊣ lambdaPush S Λ Y := lambdaAdj S Λ Y

/-- `λ_Y*` is restriction along the continuous functor `Y_qproét → Y_v` underlying `λ_Y`. -/
def lambdaY.pushIso (Y : S.Dia) :
    lambdaPush S Λ Y ≅ (S.qpV Y).sheafPushforwardContinuous (ModuleCat.{u} Λ) (qproetSite S Y)
      (vSite S (S.ofDia Y)) := sorry

/-- The morphism of topoi `ν_Y : Y_qproét^∼ → Y_ét^∼` (`ν_Y^* ⊣ ν_Y*`). -/
def nuY (Y : S.LS) : nuSh S Λ Y ⊣ nuPush S Λ Y := nuAdj S Λ Y

/-- `ν_Y*` is restriction along the continuous functor `Y_ét → Y_qproét` underlying `ν_Y`. -/
def nuY.pushIso (Y : S.LS) :
    nuPush S Λ Y ≅ (S.etQp Y).sheafPushforwardContinuous (ModuleCat.{u} Λ) (etaleSite S Y)
      (qproetSite S (S.lsDia.obj Y)) := sorry

/-- `λ_Y^*` and `ν_Y^*` preserve finite limits and all colimits; the underlying functors of sites
preserve finite limits. -/
theorem lambdaY_pullback_finiteLimits (Y : S.Dia) (Y' : S.LS) :
    PreservesFiniteLimits (lambdaSh S Λ Y) ∧ PreservesColimitsOfSize.{u, u} (lambdaSh S Λ Y) ∧
      PreservesFiniteLimits (nuSh S Λ Y') ∧ PreservesColimitsOfSize.{u, u} (nuSh S Λ Y') ∧
      PreservesFiniteLimits (S.qpV Y) ∧ PreservesFiniteLimits (S.etQp Y') := sorry

def etPullSh_comp {A B C : S.LS} (a : A ⟶ B) (b : B ⟶ C) (c : A ⟶ C) (h : a ≫ b = c) :
    etPullSh S Λ c ≅ etPullSh S Λ b ⋙ etPullSh S Λ a := sorry

/-- `f_v^* ∘ λ_Y^* ≅ λ_{Y′}^* ∘ f_qproét^*` for a map `f : Y′ → Y` of diamonds. -/
def comparison_square_v {Y' Y : S.Dia} (f : Y' ⟶ Y) :
    lambdaSh S Λ Y ⋙ vPullSh S Λ (S.diaV.map f) ≅ qpPullSh S Λ f ⋙ lambdaSh S Λ Y' := sorry

/-- ... compatibly with composition of maps. -/
theorem comparison_square_v_comp {Y'' Y' Y : S.Dia} (f : Y'' ⟶ Y') (g : Y' ⟶ Y) :
    comparison_square_v S Λ (f ≫ g) =
      Functor.isoWhiskerLeft (lambdaSh S Λ Y) (vPullSh_comp S Λ (S.diaV.map f) (S.diaV.map g)
          (S.diaV.map (f ≫ g)) (S.diaV.map_comp f g).symm) ≪≫
        (Functor.associator _ _ _).symm ≪≫
        Functor.isoWhiskerRight (comparison_square_v S Λ g) (vPullSh S Λ (S.diaV.map f)) ≪≫
        Functor.associator _ _ _ ≪≫
        Functor.isoWhiskerLeft (qpPullSh S Λ g) (comparison_square_v S Λ f) ≪≫
        (Functor.associator _ _ _).symm ≪≫
        Functor.isoWhiskerRight (qpPullSh_comp S Λ f g (f ≫ g) rfl).symm (lambdaSh S Λ Y'') :=
  sorry

/-- The derived version `f_v^* λ_Y^* ≅ λ_{Y′}^* f_qproét^*`. -/
def comparison_square_v_derived {Y' Y : S.Dia} (f : Y' ⟶ Y) :
    lambdaPull S Λ Y ⋙ vPull S Λ (S.diaV.map f) ≅ qpPullD S Λ f ⋙ lambdaPull S Λ Y' := sorry

/-- `f_qproét^* ∘ ν_Y^* ≅ ν_{Y′}^* ∘ f_ét^*` for a map `f : Y′ → Y` of locally spatial diamonds. -/
def comparison_square_et {Y' Y : S.LS} (f : Y' ⟶ Y) :
    nuSh S Λ Y ⋙ qpPullSh S Λ (S.lsDia.map f) ≅ etPullSh S Λ f ⋙ nuSh S Λ Y' := sorry

/-- ... compatibly with composition of maps. -/
theorem comparison_square_et_comp {Y'' Y' Y : S.LS} (f : Y'' ⟶ Y') (g : Y' ⟶ Y) :
    comparison_square_et S Λ (f ≫ g) =
      Functor.isoWhiskerLeft (nuSh S Λ Y) (qpPullSh_comp S Λ (S.lsDia.map f) (S.lsDia.map g)
          (S.lsDia.map (f ≫ g)) (S.lsDia.map_comp f g).symm) ≪≫
        (Functor.associator _ _ _).symm ≪≫
        Functor.isoWhiskerRight (comparison_square_et S Λ g) (qpPullSh S Λ (S.lsDia.map f)) ≪≫
        Functor.associator _ _ _ ≪≫
        Functor.isoWhiskerLeft (etPullSh S Λ g) (comparison_square_et S Λ f) ≪≫
        (Functor.associator _ _ _).symm ≪≫
        Functor.isoWhiskerRight (etPullSh_comp S Λ f g (f ≫ g) rfl).symm (nuSh S Λ Y'') :=
  sorry

/-- The derived version `f_qproét^* ν_Y^* ≅ ν_{Y′}^* f_ét^*`. -/
def comparison_square_et_derived {Y' Y : S.LS} (f : Y' ⟶ Y) :
    nuPull S Λ Y ⋙ qpPullD S Λ (S.lsDia.map f) ≅ etPullD S Λ f ⋙ nuPull S Λ Y' := sorry

/-- For a quasi-pro-étale `U → Y`, the restriction of `λ_Y` to the slice at `U` is `λ_U`
(restriction to the slice is pullback along the slice map `qpSliceι`, by
`qproetSite.over_equiv`). -/
def comparison_slice {Y : S.Dia} (U : S.QpOver Y) :
    lambdaSh S Λ Y ⋙ vPullSh S Λ (S.diaV.map (qpSliceι S U)) ≅
      qpPullSh S Λ (qpSliceι S U) ⋙ lambdaSh S Λ (qpSlice S U) := sorry

/-- For an étale `U → Y`, the restriction of `ν_Y` to the slice at `U` is `ν_U`. -/
def comparison_slice_et {Y : S.LS} (U : S.EtOver Y) :
    nuSh S Λ Y ⋙ qpPullSh S Λ (S.lsDia.map (etSliceι S U)) ≅
      etPullSh S Λ (etSliceι S U) ⋙ nuSh S Λ (etSlice S U) := sorry

/-- The derived pushforwards `Rλ_Y*`, `Rν_Y*`. -/
def lambdaPushD (Y : S.Dia) : DV S Λ (S.ofDia Y) ⥤ DQp S Λ Y := sorry
def nuPushD (Y : S.LS) : DQp S Λ (S.lsDia.obj Y) ⥤ DEt S Λ Y := sorry

/-- The derived adjunction `λ_Y^* ⊣ Rλ_Y*`. -/
def comparison_derived (Y : S.Dia) : lambdaPull S Λ Y ⊣ lambdaPushD S Λ Y := sorry
/-- The derived adjunction `ν_Y^* ⊣ Rν_Y*`. -/
def comparison_derived_nu (Y : S.LS) : nuPull S Λ Y ⊣ nuPushD S Λ Y := sorry

/-- `R^iλ_Y*` and `R^iν_Y*`. -/
abbrev lambdaHigherPush (Y : S.Dia) (i : ℤ) : VSh S Λ (S.ofDia Y) ⥤ QpSh S Λ Y :=
  DerivedCategory.singleFunctor _ 0 ⋙ lambdaPushD S Λ Y ⋙ DerivedCategory.homologyFunctor _ i
abbrev nuHigherPush (Y : S.LS) (i : ℤ) : QpSh S Λ (S.lsDia.obj Y) ⥤ EtSh S Λ Y :=
  DerivedCategory.singleFunctor _ 0 ⋙ nuPushD S Λ Y ⋙ DerivedCategory.homologyFunctor _ i

/-- `R^0λ_Y* = λ_Y*` and `R^0ν_Y* = ν_Y*`. -/
def lambdaHigherPush_zero (Y : S.Dia) : lambdaHigherPush S Λ Y 0 ≅ lambdaPush S Λ Y := sorry
def nuHigherPush_zero (Y : S.LS) : nuHigherPush S Λ Y 0 ≅ nuPush S Λ Y := sorry

/-- test comparison_geometricPoint (computation): `ν_Y^*` sends constant sheaves to constant
sheaves; for `Y = Spa(C, O_C)` this says `ν_Y^*M` is the discrete condensed module
`S ↦ C(S, M)`. -/
example (Y : S.LS) :
    Nonempty (constantSheaf (etaleSite S Y) (ModuleCat.{u} Λ) ⋙ nuSh S Λ Y ≅
      constantSheaf (qproetSite S (S.lsDia.obj Y)) (ModuleCat.{u} Λ)) := by sorry

/-- test comparison_empty (degenerate): for `Y = ∅` both `ν_Y^*` and `λ_Y^*` are equivalences
(of terminal topoi). -/
example (Y : S.LS) (hY : IsEmpty (S.pts.obj (S.ofLS Y))) :
    (nuSh S Λ Y).IsEquivalence ∧ (lambdaSh S Λ (S.lsDia.obj Y)).IsEquivalence := by sorry

/-- test comparison_perfectoid (compatibility): for a perfectoid (here strictly totally
disconnected) `X`, `ν_X` is the morphism of sites given by the inclusion of étale maps into
quasi-pro-étale maps; the D2 pro-étale site itself is not in `Carriers`. -/
example (X : S.Std) :
    Nonempty (nuPush S Λ (S.ofStd X) ≅ (S.etQp (S.ofStd X)).sheafPushforwardContinuous
      (ModuleCat.{u} Λ) (etaleSite S _) (qproetSite S _)) := by sorry

/-- test comparison_nu_not_essSurj (non-example): `ν_Y^*` is not essentially surjective for
`Y = Spa(C, O_C)` (the sheaf `S ↦ C(S, ℤ_p)` is not discrete). -/
example [Nontrivial Λ] (K : S.FieldPair) : ¬ (nuSh S Λ (spaLS S (S.fieldTate K))).EssSurj := by
  sorry

/-! ## C0/perfectoid-bases-and-coherent-subsites -/

-- omitted: coherence of the topoi `X_qproét,qc,sep^∼`, `X_v,qcqs^∼` (coherent topoi are not in
-- Mathlib); representability of the objects of `X_v,qcqs`.
/-- DiamondEtaleCohomology:C0/perfectoid-bases-and-coherent-subsites (proof of ECD Lemma 14.4):
strictly totally disconnected spaces form bases of `Y_v` and `Y_qproét`; for strictly totally
disconnected `X` the qcqs subsites are bases (so they have the same topoi) and are stable under
fibre products. -/
theorem perfectoidBasesAndCoherentSubsites :
    (∀ Y : S.V, (vStdObj S Y).ι.IsCoverDense (vSite S Y)) ∧
    (∀ Y : S.Dia, (qpStdObj S Y).ι.IsCoverDense (qproetSite S Y)) ∧
    (∀ X : S.Std, (qpQcSepObj S X).ι.IsCoverDense (qproetSite S (S.lsDia.obj (S.ofStd X)))) ∧
    (∀ X : S.Std, (vQcqsObj S X).ι.IsCoverDense (vSite S (S.ofLS (S.ofStd X)))) ∧
    (∀ (X : S.Std) ⦃W A B C : S.QpOver (S.lsDia.obj (S.ofStd X))⦄ (p₁ : W ⟶ A) (p₂ : W ⟶ B)
        (g₁ : A ⟶ C) (g₂ : B ⟶ C), IsPullback p₁ p₂ g₁ g₂ →
        qpQcSepObj S X A → qpQcSepObj S X B → qpQcSepObj S X C → qpQcSepObj S X W) ∧
    (∀ (X : S.Std) ⦃W A B C : S.VOver (S.ofLS (S.ofStd X))⦄ (p₁ : W ⟶ A) (p₂ : W ⟶ B)
        (g₁ : A ⟶ C) (g₂ : B ⟶ C), IsPullback p₁ p₂ g₁ g₂ →
        vQcqsObj S X A → vQcqsObj S X B → vQcqsObj S X C → vQcqsObj S X W) := sorry

/-! ## C0/separated-pro-etale-hull -/

-- omitted hypothesis (whole section): `X′` is a perfectoid space (representability is not
-- typable against `Carriers`); quasicompactness and quasiseparatedness of `X′ → X` are imposed
-- through `vQcqsObj`.
/-- DiamondEtaleCohomology:C0/separated-pro-etale-hull (ECD Lemma 14.5): the separated pro-étale
hull `λ∘_X(X′)`, an object of `X_qproét,qc,sep`. -/
def sepProetHull {X : S.Std} (Xt : (vQcqsObj S X).FullSubcategory) :
    S.QpOver (S.lsDia.obj (S.ofStd X)) := sorry

/-- The map `X′ → λ∘_X(X′)` over `X`. -/
def sepProetHull.toHull {X : S.Std} (Xt : (vQcqsObj S X).FullSubcategory) :
    Xt.obj ⟶ (S.qpV _).obj (sepProetHull S Xt) := sorry

/-- `λ∘_X(X′) → X` is quasicompact, separated (and pro-étale). -/
theorem sepProetHull.mem {X : S.Std} (Xt : (vQcqsObj S X).FullSubcategory) :
    qpQcSepObj S X (sepProetHull S Xt) := sorry

/-- The factorisation of `g : X′ → Z` through `λ∘_X(X′)` for a separated pro-étale `Z → X`. -/
def sepProetHull.lift {X : S.Std} (Xt : (vQcqsObj S X).FullSubcategory)
    (Z : S.QpOver (S.lsDia.obj (S.ofStd X))) (hZ : IsSeparatedMap S ((S.qpSrc _).obj Z).hom)
    (g : Xt.obj ⟶ (S.qpV _).obj Z) : sepProetHull S Xt ⟶ Z := sorry

/-- The universal property: the lift factors `g`, uniquely. -/
theorem sepProetHull.lift_comp {X : S.Std} (Xt : (vQcqsObj S X).FullSubcategory)
    (Z : S.QpOver (S.lsDia.obj (S.ofStd X))) (hZ : IsSeparatedMap S ((S.qpSrc _).obj Z).hom)
    (g : Xt.obj ⟶ (S.qpV _).obj Z) :
    sepProetHull.toHull S Xt ≫ (S.qpV _).map (sepProetHull.lift S Xt Z hZ g) = g ∧
      ∀ h : sepProetHull S Xt ⟶ Z, sepProetHull.toHull S Xt ≫ (S.qpV _).map h = g →
        h = sepProetHull.lift S Xt Z hZ g := sorry

/-- `X′ → λ∘_X(X′)` is surjective. -/
theorem sepProetHull.surjective {X : S.Std} (Xt : (vQcqsObj S X).FullSubcategory) :
    Function.Surjective ⇑(S.pts.map ((S.vSrc _).map (sepProetHull.toHull S Xt)).left) := sorry

/-- Functoriality: `λ∘_X(X′₂) → λ∘_X(X′₁)`, the lift of `X′₂ → X′₁ → λ∘_X(X′₁)`. -/
def sepProetHull.map {X : S.Std} {X₂ X₁ : (vQcqsObj S X).FullSubcategory} (φ : X₂ ⟶ X₁) :
    sepProetHull S X₂ ⟶ sepProetHull S X₁ :=
  sepProetHull.lift S X₂ (sepProetHull S X₁) (sepProetHull.mem S X₁).2
    (φ.hom ≫ sepProetHull.toHull S X₁)

theorem sepProetHull.map_id {X : S.Std} (X₁ : (vQcqsObj S X).FullSubcategory) :
    sepProetHull.map S (𝟙 X₁) = 𝟙 _ := sorry

theorem sepProetHull.map_comp {X : S.Std} {X₃ X₂ X₁ : (vQcqsObj S X).FullSubcategory}
    (φ : X₃ ⟶ X₂) (ψ : X₂ ⟶ X₁) :
    sepProetHull.map S (φ ≫ ψ) = sepProetHull.map S φ ≫ sepProetHull.map S ψ := sorry

/-- Surjections go to surjections. -/
theorem sepProetHull.map_surjective {X : S.Std} {X₂ X₁ : (vQcqsObj S X).FullSubcategory}
    (φ : X₂ ⟶ X₁) (hφ : Function.Surjective ⇑(S.pts.map ((S.vSrc _).map φ.hom).left)) :
    Function.Surjective ⇑(S.pts.map ((S.qpSrc _).map (sepProetHull.map S φ)).left) := sorry

/-- If `X′ → X` is itself quasicompact separated pro-étale, then `λ∘_X(X′) = X′`. -/
theorem sepProetHull.of_proetale {X : S.Std} (Z : S.QpOver (S.lsDia.obj (S.ofStd X)))
    (hZ : qpQcSepObj S X Z) (hZ' : vQcqsObj S X ((S.qpV _).obj Z)) :
    IsIso (sepProetHull.toHull S ⟨(S.qpV _).obj Z, hZ'⟩) := sorry

/-- `|λ∘_X(X′)|` is the image of `|X′| → |X| ×_{π₀ X} π₀ X′` (a subspace of `|X| × π₀ X′`). -/
theorem sepProetHull.spectral_image {X : S.Std} (Xt : (vQcqsObj S X).FullSubcategory) :
    ∃ e : S.pts.obj ((S.vSrc _).obj ((S.qpV _).obj (sepProetHull S Xt))).left ≃ₜ
        Set.range (fun x : S.pts.obj ((S.vSrc _).obj Xt.obj).left =>
          ((S.pts.map ((S.vSrc _).obj Xt.obj).hom x, ConnectedComponents.mk x) :
            S.pts.obj (S.ofLS (S.ofStd X)) ×
              ConnectedComponents (S.pts.obj ((S.vSrc _).obj Xt.obj).left))),
      ∀ x, (e (S.pts.map ((S.vSrc _).map (sepProetHull.toHull S Xt)).left x)).1 =
        (S.pts.map ((S.vSrc _).obj Xt.obj).hom x, ConnectedComponents.mk x) := sorry

/-- test sepProetHull_self (degenerate): `λ∘_X(X) = X`. -/
example (X : S.Std) (h : vQcqsObj S X (vTop S (S.lsDia.obj (S.ofStd X)))) :
    IsIso ((S.qpSrc _).obj (sepProetHull S ⟨vTop S (S.lsDia.obj (S.ofStd X)), h⟩)).hom := by
  sorry

/-- test sepProetHull_geometricPoints (computation): for connected `X = Spa(C, C⁺)` and connected
`X′` (e.g. `Spa(C′, C′⁺)`), `λ∘_X(X′) = X` exactly when `X′ → X` is surjective. -/
example (X : S.Std) (Xt : (vQcqsObj S X).FullSubcategory)
    [ConnectedSpace (S.pts.obj (S.ofLS (S.ofStd X)))]
    [ConnectedSpace (S.pts.obj ((S.vSrc _).obj Xt.obj).left)] :
    IsIso ((S.qpSrc _).obj (sepProetHull S Xt)).hom ↔
      Function.Surjective ⇑(S.pts.map ((S.vSrc _).obj Xt.obj).hom) := by sorry

/-- test sepProetHull_profinite (computation): for `X′ → X` quasicompact separated pro-étale, such
as `X × S` with `S` profinite (profinite sets are not in `Carriers`), `λ∘_X(X′) ≅ X′`. -/
example (X : S.Std) (Z : S.QpOver (S.lsDia.obj (S.ofStd X))) (hZ : qpQcSepObj S X Z)
    (hZ' : vQcqsObj S X ((S.qpV _).obj Z)) :
    Nonempty (sepProetHull S ⟨(S.qpV _).obj Z, hZ'⟩ ≅ Z) := by sorry

/-- test sepProetHull_not_identity (non-example): `X′ → λ∘_X(X′)` is not always an isomorphism
(for `Spa(C′, O_C′) → Spa(C, O_C)`, `C ⊊ C′`, the hull is `Spa(C, O_C)`). -/
example : ¬ ∀ (X : S.Std) (Xt : (vQcqsObj S X).FullSubcategory),
    IsIso (sepProetHull.toHull S Xt) := by sorry

/-- DiamondEtaleCohomology:C0/separated-pro-etale-hull-fibre-products (ECD Lemma 14.5): for a
diagram `X′₁ → X′₃ ← X′₂` of strictly totally disconnected spaces over `X`,
`λ∘_X(X′₁ ×_{X′₃} X′₂) ≅ λ∘_X(X′₁) ×_{λ∘_X(X′₃)} λ∘_X(X′₂)`. -/
theorem separatedProEtaleHullFibreProducts {X : S.Std} {X₁ X₂ X₃ P : (vQcqsObj S X).FullSubcategory}
    (a₁ : X₁ ⟶ X₃) (a₂ : X₂ ⟶ X₃) (p₁ : P ⟶ X₁) (p₂ : P ⟶ X₂)
    (h₁ : vStdObj S _ X₁.obj) (h₂ : vStdObj S _ X₂.obj) (h₃ : vStdObj S _ X₃.obj)
    (hP : IsPullback ((S.vSrc _).map p₁.hom).left ((S.vSrc _).map p₂.hom).left
      ((S.vSrc _).map a₁.hom).left ((S.vSrc _).map a₂.hom).left) :
    IsPullback ((S.qpSrc _).map (sepProetHull.map S p₁)).left
      ((S.qpSrc _).map (sepProetHull.map S p₂)).left
      ((S.qpSrc _).map (sepProetHull.map S a₁)).left
      ((S.qpSrc _).map (sepProetHull.map S a₂)).left := sorry

/-! ## C0/v-pullback-formula -/

/-- The canonical map `F(λ∘_X(X′)) → (λ_X^*F)(X′)`: the unit `F → λ_X*λ_X^*F` at `λ∘_X(X′)`
followed by restriction along `X′ → λ∘_X(X′)`. -/
def hullPullMap {X : S.Std} (F : QpSh S Λ (S.lsDia.obj (S.ofStd X)))
    (Xt : (vQcqsObj S X).FullSubcategory) :
    F.obj.obj (op (sepProetHull S Xt)) ⟶ ((lambdaSh S Λ _).obj F).obj.obj (op Xt.obj) := sorry

/-- DiamondEtaleCohomology:C0/v-pullback-formula (proof of ECD Lemma 14.4): on `X_v,qcqs`,
`λ_X^*F` is the sheafification of the separated presheaf `X′ ↦ F(λ∘_X(X′))`: the canonical map
is injective, and it is bijective on the strictly totally disconnected `X′` (a basis, by
`perfectoidBasesAndCoherentSubsites`). -/
theorem vPullbackFormula {X : S.Std} (F : QpSh S Λ (S.lsDia.obj (S.ofStd X))) :
    (∀ Xt : (vQcqsObj S X).FullSubcategory, Mono (hullPullMap S Λ F Xt)) ∧
      ∀ Xt : (vQcqsObj S X).FullSubcategory, vStdObj S _ Xt.obj →
        IsIso (hullPullMap S Λ F Xt) := sorry

/-! ## ECD Lemma 14.4 – Proposition 14.8: limits, full faithfulness, vanishing -/

/-- DiamondEtaleCohomology:C0/pullback-preserves-limits (ECD Lemma 14.4): `λ_Y^*` and the
quasi-pro-étale pullbacks `f^*` commute with all small limits. -/
theorem pullbackPreservesLimits (Y : S.Dia) :
    PreservesLimitsOfSize.{u, u} (lambdaSh S Λ Y) ∧
      ∀ {Y' : S.Dia} (f : Y' ⟶ Y), PreservesLimitsOfSize.{u, u} (qpPullSh S Λ f) := sorry

/-- DiamondEtaleCohomology:C0/v-pullback-fully-faithful (ECD Proposition 14.7): the unit
`F → λ_Y*λ_Y^*F` is an isomorphism, i.e. `λ_Y^*` is fully faithful. -/
theorem vPullbackFullyFaithful (Y : S.Dia) : IsIso (lambdaAdj S Λ Y).unit := sorry

-- omitted: the clause for sheaves of (nonabelian) groups in degree 1; nonabelian cohomology of
-- these sites is not stated against `Carriers`.
/-- DiamondEtaleCohomology:C0/v-pullback-higher-vanishing (ECD Proposition 14.7): for `F` on
`Y_qproét` pulled back from `Y_ét`, `R^iλ_Y*λ_Y^*F = 0` for `i > 0`. -/
theorem vPullbackHigherVanishing (Y : S.LS) (F : QpSh S Λ (S.lsDia.obj Y))
    (hF : (nuSh S Λ Y).essImage F) (i : ℤ) (hi : 0 < i) :
    IsZero ((lambdaHigherPush S Λ (S.lsDia.obj Y) i).obj ((lambdaSh S Λ _).obj F)) := sorry

/-- The canonical map `colim_j F(Ỹ_j) → (ν_Y^*F)(lim_j Ỹ_j)` for a cofiltered diagram of étale
maps and a cone over it in `Y_qproét`. -/
def nuColimMap {Y : S.LS} (F : EtSh S Λ Y) {I : Type u} [SmallCategory I] (D : I ⥤ S.EtOver Y)
    (c : Cone (D ⋙ S.etQp Y)) :
    colimit (D.op ⋙ F.obj) ⟶ ((nuSh S Λ Y).obj F).obj.obj (op c.pt) := sorry

-- omitted: the full faithfulness of `Pro(Y_ét,qc,sep) → Y_qproét` and the statement that its
-- essential image is a basis (pro-categories are not available in the pinned Mathlib).
/-- DiamondEtaleCohomology:C0/etale-to-quasi-pro-etale-basis (proof of ECD Proposition 14.8):
for a spatial diamond `Y`, `Y_ét,qc,sep` is a basis of `Y_ét`, and for `Ỹ = lim_j Ỹ_j` (a limit of
small v-stacks) of a cofiltered diagram in `Y_ét,qc,sep`, `(ν_Y^*F)(Ỹ) = colim_j F(Ỹ_j)`. -/
theorem etaleToQuasiProEtaleBasis (Y : S.LS) (hqc : CompactSpace (S.pts.obj (S.ofLS Y)))
    (hqs : IsQuasicompactMap S (pullback.diagonal (terminal.from (S.ofLS Y)))) :
    (etQcSepObj S Y).ι.IsCoverDense (etaleSite S Y) ∧
      ∀ (F : EtSh S Λ Y) (I : Type u) [SmallCategory I] [IsCofiltered I]
        (D : I ⥤ (etQcSepObj S Y).FullSubcategory)
        (c : Cone ((D ⋙ (etQcSepObj S Y).ι) ⋙ S.etQp Y)),
        IsLimit ((S.qpSrc (S.lsDia.obj Y) ⋙ Over.forget _).mapCone c) →
          IsIso (nuColimMap S Λ F (D ⋙ (etQcSepObj S Y).ι) c) := sorry

-- omitted: the clause for sheaves of (nonabelian) groups in degree 1.
/-- DiamondEtaleCohomology:C0/quasi-pro-etale-pullback-fully-faithful (ECD Proposition 14.8):
`ν_Y^*` is fully faithful and `R^iν_Y*ν_Y^*F = 0` for `i > 0`. -/
theorem quasiProEtalePullbackFullyFaithful (Y : S.LS) :
    IsIso (nuAdj S Λ Y).unit ∧
      ∀ (F : EtSh S Λ Y) (i : ℤ), 0 < i →
        IsZero ((nuHigherPush S Λ Y i).obj ((nuSh S Λ Y).obj F)) := sorry

/-! ## C0/etale-cohomology-continuity -/

/-- `RΓ(Y_ét, −)` and `H^j(Y_ét, −)`. -/
def etRGamma (Y : S.LS) : DEt S Λ Y ⥤ DerivedCategory (ModuleCat.{u} Λ) := sorry
abbrev etH (Y : S.LS) (j : ℤ) : EtSh S Λ Y ⥤ ModuleCat.{u} Λ :=
  DerivedCategory.singleFunctor _ 0 ⋙ etRGamma S Λ Y ⋙ DerivedCategory.homologyFunctor _ j
def etH_zero (Y : S.LS) : etH S Λ Y 0 ≅ etGamma S Λ Y := sorry

/-- The pullback map `H^j(Y, G) → H^j(Y′, g^*G)`. -/
def etH_pullMap {Y' Y : S.LS} (g : Y' ⟶ Y) (j : ℤ) :
    etH S Λ Y j ⟶ etPullSh S Λ g ⋙ etH S Λ Y' j := sorry

/-- The system `i ↦ H^j(Y_i, F_i)` of a cofiltered system with final object `0`, where `F_i` is
the pullback of `F₀`. -/
def etCohomologySystem {I : Type u} [SmallCategory I] [HasTerminal I] (D : I ⥤ S.LS)
    (F₀ : EtSh S Λ (D.obj (⊤_ I))) (j : ℤ) : Iᵒᵖ ⥤ ModuleCat.{u} Λ where
  obj i := (etH S Λ (D.obj i.unop) j).obj ((etPullSh S Λ (D.map (terminal.from i.unop))).obj F₀)
  map {i i'} f := (etH_pullMap S Λ (D.map f.unop) j).app _ ≫
    (etH S Λ (D.obj i'.unop) j).map ((etPullSh_comp S Λ (D.map f.unop)
      (D.map (terminal.from i.unop)) (D.map (terminal.from i'.unop))
      (by rw [← Functor.map_comp]; exact congrArg D.map (terminal.hom_ext _ _))).inv.app F₀)
  map_id := sorry
  map_comp := sorry

/-- The pullback map `H^j(Y_i, F_i) → H^j(Y, F)` along a leg `Y → Y_i` of a cone. -/
def etContinuityLeg {I : Type u} [SmallCategory I] [HasTerminal I] (D : I ⥤ S.LS) (c : Cone D)
    (F₀ : EtSh S Λ (D.obj (⊤_ I))) (j : ℤ) (i : I) :
    (etH S Λ (D.obj i) j).obj ((etPullSh S Λ (D.map (terminal.from i))).obj F₀) ⟶
      (etH S Λ c.pt j).obj ((etPullSh S Λ (c.π.app (⊤_ I))).obj F₀) :=
  (etH_pullMap S Λ (c.π.app i) j).app _ ≫
    (etH S Λ c.pt j).map ((etPullSh_comp S Λ (c.π.app i) (D.map (terminal.from i))
      (c.π.app (⊤_ I)) (c.w _)).inv.app F₀)

/-- The comparison map `colim_i H^j(Y_i, F_i) → H^j(Y, F)` for a cone `Y → Y_i`. -/
def etContinuityMap {I : Type u} [SmallCategory I] [HasTerminal I] (D : I ⥤ S.LS) (c : Cone D)
    (F₀ : EtSh S Λ (D.obj (⊤_ I))) (j : ℤ) :
    colimit (etCohomologySystem S Λ D F₀ j) ⟶
      (etH S Λ c.pt j).obj ((etPullSh S Λ (c.π.app (⊤_ I))).obj F₀) :=
  colimit.desc (etCohomologySystem S Λ D F₀ j)
    { pt := (etH S Λ c.pt j).obj ((etPullSh S Λ (c.π.app (⊤_ I))).obj F₀)
      ι := { app := fun i => etContinuityLeg S Λ D c F₀ j i.unop
             naturality := sorry } }

-- omitted: the clauses for sheaves of sets (`j = 0`) and of groups (`j = 0, 1`); the statement
-- is given for sheaves of Λ-modules, all `j`.
/-- DiamondEtaleCohomology:C0/etale-cohomology-continuity (ECD Proposition 14.9): for a
cofiltered system of spatial diamonds `Y_i` with final object `0` and inverse limit `Y` (as small
v-sheaves), `colim_i H^j(Y_i, F_i) → H^j(Y, F)` is an isomorphism. -/
theorem etaleCohomologyContinuity {I : Type u} [SmallCategory I] [IsCofiltered I] [HasTerminal I]
    (D : I ⥤ S.LS) (hqc : ∀ i, CompactSpace (S.pts.obj (S.ofLS (D.obj i))))
    (hqs : ∀ i, IsQuasicompactMap S (pullback.diagonal (terminal.from (S.ofLS (D.obj i)))))
    (c : Cone D) (hc : IsLimit ((S.lsDia ⋙ S.diaV).mapCone c)) (F₀ : EtSh S Λ (D.obj (⊤_ I)))
    (j : ℤ) : IsIso (etContinuityMap S Λ D c F₀ j) := sorry

/-- The system `(i → i₀) ↦ R^q f_{i,i₀*}F_i` on `(Y_{i₀})_ét` (transition maps: base change). -/
def etRelSystem {I : Type u} [SmallCategory I] [HasTerminal I] (D : I ⥤ S.LS)
    (F₀ : EtSh S Λ (D.obj (⊤_ I))) (q : ℤ) (i₀ : I) : (Over i₀)ᵒᵖ ⥤ EtSh S Λ (D.obj i₀) where
  obj k := (etHigherPush S Λ (D.map k.unop.hom) q).obj
    ((etPullSh S Λ (D.map (terminal.from k.unop.left))).obj F₀)
  map _ := sorry
  map_id := sorry
  map_comp := sorry

/-- The comparison map `colim_{i → i₀} R^q f_{i,i₀*}F_i → R^q f_{i₀*}F`. -/
def etRelContinuityMap {I : Type u} [SmallCategory I] [HasTerminal I] (D : I ⥤ S.LS) (c : Cone D)
    (F₀ : EtSh S Λ (D.obj (⊤_ I))) (q : ℤ) (i₀ : I) :
    colimit (etRelSystem S Λ D F₀ q i₀) ⟶
      (etHigherPush S Λ (c.π.app i₀) q).obj ((etPullSh S Λ (c.π.app (⊤_ I))).obj F₀) := sorry

/-- Relative form: `R^q f_{i₀*}F = colim_{i → i₀} R^q f_{i,i₀*}F_i` on `(Y_{i₀})_ét`. -/
theorem etaleCohomologyContinuity.relative {I : Type u} [SmallCategory I] [IsCofiltered I]
    [HasTerminal I] (D : I ⥤ S.LS) (hqc : ∀ i, CompactSpace (S.pts.obj (S.ofLS (D.obj i))))
    (hqs : ∀ i, IsQuasicompactMap S (pullback.diagonal (terminal.from (S.ofLS (D.obj i)))))
    (c : Cone D) (hc : IsLimit ((S.lsDia ⋙ S.diaV).mapCone c)) (F₀ : EtSh S Λ (D.obj (⊤_ I)))
    (q : ℤ) (i₀ : I) : IsIso (etRelContinuityMap S Λ D c F₀ q i₀) := sorry

/-! ## C0/std-etale-acyclic -/

/-- DiamondEtaleCohomology:C0/std-etale-acyclic (proof of ECD Proposition 14.10): for strictly
totally disconnected `X` (with `X_ét^∼ ≃ Sh(|X|)` given by `stdSpaceEquiv`), every étale cover of a
quasicompact open `U ⊂ X` is refined by a finite disjoint open cover of `U`, and
`H^i(U_ét, F) = 0` for `i > 0`. -/
theorem stdEtaleAcyclic (X : S.Std) (U : S.EtOver (S.ofStd X))
    (hU : IsOpenEmbedding ⇑(S.pts.map ((S.etSrc _).obj U).hom))
    (hUc : CompactSpace (S.pts.obj ((S.etSrc _).obj U).left)) :
    (∀ R ∈ etaleSite S _ U, ∃ (n : ℕ) (V : Fin n → S.EtOver (S.ofStd X)) (g : ∀ k, V k ⟶ U),
      (∀ k, R (g k)) ∧ (∀ k, IsOpenEmbedding ⇑(S.pts.map ((S.etSrc _).map (g k)).left)) ∧
      Pairwise (fun k l => Disjoint (Set.range ⇑(S.pts.map ((S.etSrc _).map (g k)).left))
        (Set.range ⇑(S.pts.map ((S.etSrc _).map (g l)).left))) ∧
      (⋃ k, Set.range ⇑(S.pts.map ((S.etSrc _).map (g k)).left)) = Set.univ) ∧
    ∀ (F : EtSh S Λ (S.ofStd X)) (i : ℤ), 0 < i →
      IsZero ((etH S Λ (etSlice S U) i).obj ((etPullSh S Λ (etSliceι S U)).obj F)) := sorry

/-! ## C0/quasi-pro-etale-topos-replete, C0/v-topos-replete, C0/left-completeness -/

/-- DiamondEtaleCohomology:C0/quasi-pro-etale-topos-replete (proof of ECD Proposition 14.10): for
every sequence of epimorphisms of sheaves `⋯ → F₂ → F₁ → F₀` on `Y_qproét`, `lim_n F_n → F₀` is an
epimorphism (at the cutoff of `Carriers`). -/
theorem quasiProEtaleToposReplete (Y : S.Dia) (F : ℕ → Sheaf (qproetSite S Y) (Type u))
    (f : ∀ n, F (n + 1) ⟶ F n) (hf : ∀ n, Epi (f n)) :
    Epi (limit.π (Functor.ofOpSequence f) (op 0)) := sorry

/-- The same for sheaves of Λ-modules. -/
theorem quasiProEtaleToposReplete.module (Y : S.Dia) (F : ℕ → QpSh S Λ Y)
    (f : ∀ n, F (n + 1) ⟶ F n) (hf : ∀ n, Epi (f n)) :
    Epi (limit.π (Functor.ofOpSequence f) (op 0)) := sorry

/-- DiamondEtaleCohomology:C0/v-topos-replete (proof of ECD Proposition 14.10): the topos of
sheaves on `Y_v` is replete. -/
theorem vToposReplete (Y : S.V) (F : ℕ → Sheaf (vSite S Y) (Type u))
    (f : ∀ n, F (n + 1) ⟶ F n) (hf : ∀ n, Epi (f n)) :
    Epi (limit.π (Functor.ofOpSequence f) (op 0)) := sorry

theorem vToposReplete.module (Y : S.V) (F : ℕ → VSh S Λ Y)
    (f : ∀ n, F (n + 1) ⟶ F n) (hf : ∀ n, Epi (f n)) :
    Epi (limit.π (Functor.ofOpSequence f) (op 0)) := sorry

/-- The Postnikov limit `R lim_n τ^{≥ -n} A` of the canonical truncations; Mathlib has no
homotopy limits in derived categories, so the construction is named here. -/
def postnikovLimit {C : Type*} [Category C] [Abelian C] (A : DerivedCategory C) :
    DerivedCategory C := sorry
/-- The comparison map `A → R lim_n τ^{≥ -n} A`. -/
def toPostnikovLimit {C : Type*} [Category C] [Abelian C] (A : DerivedCategory C) :
    A ⟶ postnikovLimit A := sorry

/-- DiamondEtaleCohomology:C0/left-completeness (ECD Proposition 14.11): `D(Y_v, Λ)`,
`D(Y_qproét, Λ)` (Y a diamond) and `D(X_ét, Λ)` (X strictly totally disconnected) are
left-complete. -/
theorem leftCompleteness :
    (∀ (Y : S.V) (A : DV S Λ Y), IsIso (toPostnikovLimit A)) ∧
      (∀ (Y : S.Dia) (A : DQp S Λ Y), IsIso (toPostnikovLimit A)) ∧
      ∀ (X : S.Std) (A : DEt S Λ (S.ofStd X)), IsIso (toPostnikovLimit A) := sorry

/-! ## C0/bounded-below-comparison, C0/unbounded-comparison-std -/

/-- DiamondEtaleCohomology:C0/bounded-below-comparison (ECD Proposition 14.10): on `D⁺`, `ν_Y^*` and
`λ_Y^*ν_Y^*` are fully faithful. -/
theorem boundedBelowComparison (Y : S.LS) :
    ((DerivedCategory.TStructure.t (C := EtSh S Λ Y)).plus.ι ⋙ nuPull S Λ Y).Full ∧
      ((DerivedCategory.TStructure.t (C := EtSh S Λ Y)).plus.ι ⋙ nuPull S Λ Y).Faithful ∧
      ((DerivedCategory.TStructure.t (C := EtSh S Λ Y)).plus.ι ⋙ nuPull S Λ Y ⋙
        lambdaPull S Λ (S.lsDia.obj Y)).Full ∧
      ((DerivedCategory.TStructure.t (C := EtSh S Λ Y)).plus.ι ⋙ nuPull S Λ Y ⋙
        lambdaPull S Λ (S.lsDia.obj Y)).Faithful := sorry

/-- DiamondEtaleCohomology:C0/unbounded-comparison-std (ECD Proposition 14.10): for strictly
totally disconnected `X`, `ν_X^*` and `λ_X^*ν_X^*` are fully faithful on unbounded derived
categories. -/
theorem unboundedComparisonStd (X : S.Std) :
    (nuPull S Λ (S.ofStd X)).Full ∧ (nuPull S Λ (S.ofStd X)).Faithful ∧
      (stdEmb S Λ X).Full ∧ (stdEmb S Λ X).Faithful := sorry

/-! ## C1/base-change-transformations -/

/-- A map of diamonds is quasi-pro-étale (and locally separated, at the cutoff of `Carriers`) if
it is isomorphic to an object of `Y_qproét`. -/
def IsQproetMap {Y' Y : S.Dia} (f : Y' ⟶ Y) : Prop :=
  ∃ U : S.QpOver Y, Nonempty ((S.qpSrc Y).obj U ≅ Over.mk (S.diaV.map f))

/-- Quasicompact quasiseparated maps of small v-stacks. -/
def IsQcqsMap {X Y : S.V} (f : X ⟶ Y) : Prop :=
  IsQuasicompactMap S f ∧ IsQuasicompactMap S (pullback.diagonal f)

/-- DiamondEtaleCohomology:C1/base-change-transformations (ECD Theorem 16.1): the natural
transformation `λ_Y^* ∘ Rf_qproét* ⟶ Rf_v* ∘ λ_{Y′}^*` of functors `D(Y′_qproét, Λ) → D(Y_v, Λ)`,
the mate of `f_v^*λ_Y^* ≅ λ_{Y′}^*f_qproét^*`. -/
def vQproetBaseChange {Y' Y : S.LS} (f : Y' ⟶ Y) :
    qpPushD S Λ (S.lsDia.map f) ⋙ lambdaPull S Λ (S.lsDia.obj Y) ⟶
      lambdaPull S Λ (S.lsDia.obj Y') ⋙ vPushD S Λ (S.diaV.map (S.lsDia.map f)) :=
  mateEquiv (qpAdjD S Λ (S.lsDia.map f)) (vAdjD S Λ (S.diaV.map (S.lsDia.map f)))
    (comparison_square_v_derived S Λ (S.lsDia.map f)).hom

/-- The degree-zero (sheaf-level) transformation `λ_Y^*f_qproét* ⟶ f_v*λ_{Y′}^*`, the mate of the
commutation isomorphism `comparison_square_v`. -/
def vQproetBaseChange0 {Y' Y : S.LS} (f : Y' ⟶ Y) :
    qpPushSh S Λ (S.lsDia.map f) ⋙ lambdaSh S Λ (S.lsDia.obj Y) ⟶
      lambdaSh S Λ (S.lsDia.obj Y') ⋙ vPushSh S Λ (S.diaV.map (S.lsDia.map f)) :=
  mateEquiv (qpAdjSh S Λ (S.lsDia.map f)) (vAdjSh S Λ (S.diaV.map (S.lsDia.map f)))
    (comparison_square_v S Λ (S.lsDia.map f)).hom

/-- The natural transformation `ν_Y^* ∘ Rf_ét* ⟶ Rf_qproét* ∘ ν_{Y′}^*` (ECD Proposition 16.6). -/
def etQproetBaseChange {Y' Y : S.LS} (f : Y' ⟶ Y) :
    etPushD S Λ f ⋙ nuPull S Λ Y ⟶ nuPull S Λ Y' ⋙ qpPushD S Λ (S.lsDia.map f) :=
  mateEquiv (etAdjD S Λ f) (qpAdjD S Λ (S.lsDia.map f)) (comparison_square_et_derived S Λ f).hom

/-- For a commutative square `g′ : Y′ → Y`, `f′ : Y′ → X′`, `f : Y → X`, `g : X′ → X` of locally
spatial diamonds, `g^*Rf_* ⟶ Rf′_*g′^*` on the quasi-pro-étale sites. -/
def squareBaseChange {Y' Y X' X : S.LS} (g' : Y' ⟶ Y) (f' : Y' ⟶ X') (f : Y ⟶ X) (g : X' ⟶ X)
    (h : g' ≫ f = f' ≫ g) :
    qpPushD S Λ (S.lsDia.map f) ⋙ qpPullD S Λ (S.lsDia.map g) ⟶
      qpPullD S Λ (S.lsDia.map g') ⋙ qpPushD S Λ (S.lsDia.map f') :=
  mateEquiv (qpAdjD S Λ (S.lsDia.map f)) (qpAdjD S Λ (S.lsDia.map f'))
    ((qpPullD_comp S Λ (S.lsDia.map f') (S.lsDia.map g) _ rfl).inv ≫
      (qpPullD_comp S Λ (S.lsDia.map g') (S.lsDia.map f) _
        (by rw [← Functor.map_comp, h, Functor.map_comp])).hom)

/-- The same on the étale sites. -/
def squareBaseChangeEt {Y' Y X' X : S.LS} (g' : Y' ⟶ Y) (f' : Y' ⟶ X') (f : Y ⟶ X) (g : X' ⟶ X)
    (h : g' ≫ f = f' ≫ g) :
    etPushD S Λ f ⋙ etPullD S Λ g ⟶ etPullD S Λ g' ⋙ etPushD S Λ f' :=
  mateEquiv (etAdjD S Λ f) (etAdjD S Λ f')
    ((etPullD_comp S Λ f' g _ rfl).inv ≫ (etPullD_comp S Λ g' f _ h).hom)

/-- The same on the v-sites (for squares of small v-stacks). -/
def vSquareBaseChange {Y' Y X' X : S.V} (g' : Y' ⟶ Y) (f' : Y' ⟶ X') (f : Y ⟶ X) (g : X' ⟶ X)
    (h : g' ≫ f = f' ≫ g) :
    vPushD S Λ f ⋙ vPull S Λ g ⟶ vPull S Λ g' ⋙ vPushD S Λ f' :=
  mateEquiv (vAdjD S Λ f) (vAdjD S Λ f')
    ((vPull_comp S Λ f' g _ rfl).inv ≫ (vPull_comp S Λ g' f _ h).hom)

/-- For composable `h` and `f`, the transformation for `h ≫ f` is the pasting of those for `f`
and `h`. -/
theorem vQproetBaseChange.comp {Y'' Y' Y : S.LS} (h : Y'' ⟶ Y') (f : Y' ⟶ Y) :
    vQproetBaseChange S Λ (h ≫ f) =
      Functor.whiskerRight (qpPushD_comp S Λ (S.lsDia.map h) (S.lsDia.map f) (S.lsDia.map (h ≫ f))
          (S.lsDia.map_comp h f).symm).hom (lambdaPull S Λ (S.lsDia.obj Y)) ≫
        (Functor.associator _ _ _).hom ≫
        Functor.whiskerLeft (qpPushD S Λ (S.lsDia.map h)) (vQproetBaseChange S Λ f) ≫
        (Functor.associator _ _ _).inv ≫
        Functor.whiskerRight (vQproetBaseChange S Λ h) (vPushD S Λ (S.diaV.map (S.lsDia.map f))) ≫
        (Functor.associator _ _ _).hom ≫
        Functor.whiskerLeft (lambdaPull S Λ (S.lsDia.obj Y''))
          (vPushD_comp S Λ (S.diaV.map (S.lsDia.map h)) (S.diaV.map (S.lsDia.map f))
            (S.diaV.map (S.lsDia.map (h ≫ f))) (by simp)).inv := sorry

/-- For `f = id` the transformation is the identity (up to `R(id)_* ≅ id`). -/
theorem vQproetBaseChange.id (Y : S.LS) :
    vQproetBaseChange S Λ (𝟙 Y) =
      Functor.whiskerRight (qpPushD_id S Λ (S.lsDia.map (𝟙 Y)) (S.lsDia.map_id Y)).hom
          (lambdaPull S Λ (S.lsDia.obj Y)) ≫
        (Functor.leftUnitor _).hom ≫ (Functor.rightUnitor _).inv ≫
        Functor.whiskerLeft (lambdaPull S Λ (S.lsDia.obj Y))
          (vPushD_id S Λ (S.diaV.map (S.lsDia.map (𝟙 Y))) (by simp)).inv :=
  sorry

/-- Restriction to a quasi-pro-étale `u : U → Y` carries the transformation for `f` to that for
`f_U = f ×_Y U`: for the cartesian square, the quasi-pro-étale and v base change maps along `u`
are isomorphisms, and the pasting identity relating `vQproetBaseChange f` and
`vQproetBaseChange f_U` holds. -/
theorem vQproetBaseChange.slice {U' U Y' Y : S.LS} (u' : U' ⟶ Y') (fU : U' ⟶ U) (f : Y' ⟶ Y)
    (u : U ⟶ Y) (h : u' ≫ f = fU ≫ u) (hu : IsQproetMap S (S.lsDia.map u))
    (hcart : IsPullback (S.diaV.map (S.lsDia.map u')) (S.diaV.map (S.lsDia.map fU))
      (S.diaV.map (S.lsDia.map f)) (S.diaV.map (S.lsDia.map u))) :
    IsIso (squareBaseChange S Λ u' fU f u h) ∧
      IsIso (vSquareBaseChange S Λ (S.diaV.map (S.lsDia.map u')) (S.diaV.map (S.lsDia.map fU))
        (S.diaV.map (S.lsDia.map f)) (S.diaV.map (S.lsDia.map u))
        (by simp only [← Functor.map_comp, h])) ∧
      Functor.whiskerRight (vQproetBaseChange S Λ f) (vPull S Λ (S.diaV.map (S.lsDia.map u))) ≫
          (Functor.associator _ _ _).hom ≫
          Functor.whiskerLeft (lambdaPull S Λ (S.lsDia.obj Y'))
            (vSquareBaseChange S Λ (S.diaV.map (S.lsDia.map u')) (S.diaV.map (S.lsDia.map fU))
              (S.diaV.map (S.lsDia.map f)) (S.diaV.map (S.lsDia.map u))
              (by simp only [← Functor.map_comp, h])) =
        (Functor.associator _ _ _).hom ≫
          Functor.whiskerLeft (qpPushD S Λ (S.lsDia.map f))
            (comparison_square_v_derived S Λ (S.lsDia.map u)).hom ≫
          (Functor.associator _ _ _).inv ≫
          Functor.whiskerRight (squareBaseChange S Λ u' fU f u h) (lambdaPull S Λ (S.lsDia.obj U)) ≫
          (Functor.associator _ _ _).hom ≫
          Functor.whiskerLeft (qpPullD S Λ (S.lsDia.map u')) (vQproetBaseChange S Λ fU) ≫
          (Functor.associator _ _ _).inv ≫
          Functor.whiskerRight (comparison_square_v_derived S Λ (S.lsDia.map u')).inv
            (vPushD S Λ (S.diaV.map (S.lsDia.map fU))) ≫
          (Functor.associator _ _ _).hom := sorry

/-- The base change morphism `λ_Y^*R^if_qproét*F → R^if_v*λ_{Y′}^*F` on cohomology sheaves,
induced by `vQproetBaseChange` (using t-exactness of `λ^*`). -/
def vQproetBaseChangeSh {Y' Y : S.LS} (f : Y' ⟶ Y) (i : ℤ) :
    qpHigherPush S Λ (S.lsDia.map f) i ⋙ lambdaSh S Λ (S.lsDia.obj Y) ⟶
      lambdaSh S Λ (S.lsDia.obj Y') ⋙ vHigherPush S Λ (S.diaV.map (S.lsDia.map f)) i :=
  (Functor.associator _ _ _).hom ≫
    Functor.whiskerLeft (DerivedCategory.singleFunctor _ 0)
      ((Functor.associator _ _ _).hom ≫
        Functor.whiskerLeft (qpPushD S Λ (S.lsDia.map f))
          (cutoffDerived.pullback S Λ (S.lsDia.obj Y) i).inv ≫
        (Functor.associator _ _ _).inv ≫
        Functor.whiskerRight (vQproetBaseChange S Λ f) (DerivedCategory.homologyFunctor _ i) ≫
        (Functor.associator _ _ _).hom) ≫
    (Functor.associator _ _ _).inv ≫
    Functor.whiskerRight (cutoffDerived.pullback_single S Λ (S.lsDia.obj Y')).hom
      (vPushD S Λ (S.diaV.map (S.lsDia.map f)) ⋙ DerivedCategory.homologyFunctor _ i) ≫
    (Functor.associator _ _ _).hom

/-- The base change morphism `ν_Y^*R^if_ét*F → R^if_qproét*ν_{Y′}^*F`. -/
def etQproetBaseChangeSh {Y' Y : S.LS} (f : Y' ⟶ Y) (i : ℤ) :
    etHigherPush S Λ f i ⋙ nuSh S Λ Y ⟶ nuSh S Λ Y' ⋙ qpHigherPush S Λ (S.lsDia.map f) i :=
  (Functor.associator _ _ _).hom ≫
    Functor.whiskerLeft (DerivedCategory.singleFunctor _ 0)
      ((Functor.associator _ _ _).hom ≫
        Functor.whiskerLeft (etPushD S Λ f) (cutoffDerived.pullback_nu S Λ Y i).inv ≫
        (Functor.associator _ _ _).inv ≫
        Functor.whiskerRight (etQproetBaseChange S Λ f) (DerivedCategory.homologyFunctor _ i) ≫
        (Functor.associator _ _ _).hom) ≫
    (Functor.associator _ _ _).inv ≫
    Functor.whiskerRight (cutoffDerived.pullback_nu_single S Λ Y').hom
      (qpPushD S Λ (S.lsDia.map f) ⋙ DerivedCategory.homologyFunctor _ i) ≫
    (Functor.associator _ _ _).hom

/-- The base change morphism `g^*R^if_*F → R^if′_*g′^*F` on the quasi-pro-étale sites. -/
def squareBaseChangeSh {Y' Y X' X : S.LS} (g' : Y' ⟶ Y) (f' : Y' ⟶ X') (f : Y ⟶ X) (g : X' ⟶ X)
    (h : g' ≫ f = f' ≫ g) (i : ℤ) :
    qpHigherPush S Λ (S.lsDia.map f) i ⋙ qpPullSh S Λ (S.lsDia.map g) ⟶
      qpPullSh S Λ (S.lsDia.map g') ⋙ qpHigherPush S Λ (S.lsDia.map f') i :=
  (Functor.associator _ _ _).hom ≫
    Functor.whiskerLeft (DerivedCategory.singleFunctor _ 0)
      ((Functor.associator _ _ _).hom ≫
        Functor.whiskerLeft (qpPushD S Λ (S.lsDia.map f))
          (qpPullD_homology S Λ (S.lsDia.map g) i).inv ≫
        (Functor.associator _ _ _).inv ≫
        Functor.whiskerRight (squareBaseChange S Λ g' f' f g h)
          (DerivedCategory.homologyFunctor _ i) ≫
        (Functor.associator _ _ _).hom) ≫
    (Functor.associator _ _ _).inv ≫
    Functor.whiskerRight (qpPullD_single S Λ (S.lsDia.map g')).hom
      (qpPushD S Λ (S.lsDia.map f') ⋙ DerivedCategory.homologyFunctor _ i) ≫
    (Functor.associator _ _ _).hom

/-- The base change morphism `g^*R^if_*F → R^if′_*g′^*F` on the étale sites. -/
def squareBaseChangeEtSh {Y' Y X' X : S.LS} (g' : Y' ⟶ Y) (f' : Y' ⟶ X') (f : Y ⟶ X)
    (g : X' ⟶ X) (h : g' ≫ f = f' ≫ g) (i : ℤ) :
    etHigherPush S Λ f i ⋙ etPullSh S Λ g ⟶ etPullSh S Λ g' ⋙ etHigherPush S Λ f' i :=
  (Functor.associator _ _ _).hom ≫
    Functor.whiskerLeft (DerivedCategory.singleFunctor _ 0)
      ((Functor.associator _ _ _).hom ≫
        Functor.whiskerLeft (etPushD S Λ f) (etPullD_homology S Λ g i).inv ≫
        (Functor.associator _ _ _).inv ≫
        Functor.whiskerRight (squareBaseChangeEt S Λ g' f' f g h)
          (DerivedCategory.homologyFunctor _ i) ≫
        (Functor.associator _ _ _).hom) ≫
    (Functor.associator _ _ _).inv ≫
    Functor.whiskerRight (etPullD_single S Λ g').hom
      (etPushD S Λ f' ⋙ DerivedCategory.homologyFunctor _ i) ≫
    (Functor.associator _ _ _).hom

/-- `RΓ(U, −)` for an object `U` of `Y_qproét`, resp. `Y_v`, and `H^i(U, −)`. -/
def qpRGammaAt (Y : S.Dia) (U : S.QpOver Y) : DQp S Λ Y ⥤ DerivedCategory (ModuleCat.{u} Λ) :=
  sorry
def vRGammaAt (Y : S.V) (U : S.VOver Y) : DV S Λ Y ⥤ DerivedCategory (ModuleCat.{u} Λ) := sorry
abbrev qpHAt (Y : S.Dia) (U : S.QpOver Y) (i : ℤ) : QpSh S Λ Y ⥤ ModuleCat.{u} Λ :=
  DerivedCategory.singleFunctor _ 0 ⋙ qpRGammaAt S Λ Y U ⋙ DerivedCategory.homologyFunctor _ i
abbrev vHAt (Y : S.V) (U : S.VOver Y) (i : ℤ) : VSh S Λ Y ⥤ ModuleCat.{u} Λ :=
  DerivedCategory.singleFunctor _ 0 ⋙ vRGammaAt S Λ Y U ⋙ DerivedCategory.homologyFunctor _ i

/-- For strictly totally disconnected `X`, `f : Y′ → X` and `X̃ ∈ X_v` with factorisation
`X̃ → λ∘_X(X̃) → X`, the comparison
`RΓ((λ∘_X(X̃) ×_X Y′)_qproét, A) → RΓ((X̃ ×_X Y′)_v, λ_{Y′}^*A)`. -/
def hullComparisonD {X : S.Std} {Y' : S.LS} (f : Y' ⟶ S.ofStd X)
    (Xt : (vQcqsObj S X).FullSubcategory) :
    qpRGammaAt S Λ (S.lsDia.obj Y')
        ((qproetSite.pullback S (S.lsDia.map f)).obj (sepProetHull S Xt)) ⟶
      lambdaPull S Λ (S.lsDia.obj Y') ⋙ vRGammaAt S Λ (S.ofLS Y')
        ((vSite.pullback_zeroTruncated S (S.diaV.map (S.lsDia.map f))).obj Xt.obj) := sorry

/-- Its effect `H^i((λ∘_X(X̃) ×_X Y′)_qproét, F) → H^i((X̃ ×_X Y′)_v, λ_{Y′}^*F)` on sheaves. -/
def hullComparison {X : S.Std} {Y' : S.LS} (f : Y' ⟶ S.ofStd X)
    (Xt : (vQcqsObj S X).FullSubcategory) (i : ℤ) :
    qpHAt S Λ (S.lsDia.obj Y') ((qproetSite.pullback S (S.lsDia.map f)).obj (sepProetHull S Xt)) i
      ⟶ lambdaSh S Λ (S.lsDia.obj Y') ⋙ vHAt S Λ (S.ofLS Y')
        ((vSite.pullback_zeroTruncated S (S.diaV.map (S.lsDia.map f))).obj Xt.obj) i :=
  Functor.whiskerLeft (DerivedCategory.singleFunctor _ 0)
      (Functor.whiskerRight (hullComparisonD S Λ f Xt) (DerivedCategory.homologyFunctor _ i) ≫
        (Functor.associator _ _ _).hom) ≫
    (Functor.associator _ _ _).inv ≫
    Functor.whiskerRight (cutoffDerived.pullback_single S Λ (S.lsDia.obj Y')).hom
      (vRGammaAt S Λ (S.ofLS Y')
        ((vSite.pullback_zeroTruncated S (S.diaV.map (S.lsDia.map f))).obj Xt.obj) ⋙
          DerivedCategory.homologyFunctor _ i) ≫
    (Functor.associator _ _ _).hom

/-- On cohomology sheaves the derived transformation induces the sheaf-level base change maps (this
is the definition of `vQproetBaseChangeSh`); for strictly totally disconnected `X` the degree-`i`
map is an isomorphism at `F` once the comparison over `λ∘_X(X̃) ×_X Y′` and `X̃ ×_X Y′` is an
isomorphism for all strictly totally disconnected `X̃ ∈ X_v`. -/
theorem vQproetBaseChange.cohomology {X : S.Std} {Y' : S.LS} (f : Y' ⟶ S.ofStd X) (i : ℤ)
    (F : QpSh S Λ (S.lsDia.obj Y'))
    (hF : ∀ Xt : (vQcqsObj S X).FullSubcategory, vStdObj S _ Xt.obj →
      IsIso ((hullComparison S Λ f Xt i).app F)) :
    IsIso ((vQproetBaseChangeSh S Λ f i).app F) := sorry

/-- test baseChange_id (degenerate): for `f = id_Y` the base change transformations are
isomorphisms (the identity up to `R(id)_* ≅ id`, cf. `vQproetBaseChange.id`). -/
example (Y : S.LS) :
    IsIso (vQproetBaseChange S Λ (𝟙 Y)) ∧ IsIso (etQproetBaseChange S Λ (𝟙 Y)) := by sorry

/-- test baseChange_fold (computation): for the fold map `Y ⊔ Y → Y` the degree-0 base change
morphism is an isomorphism (`λ_Y^*F₁ × λ_Y^*F₂` on both sides). -/
example (Y Y' : S.LS) (ι₁ ι₂ : Y ⟶ Y') (f : Y' ⟶ Y) (h₁ : ι₁ ≫ f = 𝟙 Y) (h₂ : ι₂ ≫ f = 𝟙 Y)
    (hc : IsColimit (BinaryCofan.mk (S.diaV.map (S.lsDia.map ι₁)) (S.diaV.map (S.lsDia.map ι₂))))
    (F : QpSh S Λ (S.lsDia.obj Y')) : IsIso ((vQproetBaseChange0 S Λ f).app F) := by sorry

/-- test baseChange_degree_zero (characterisation): in degree 0 the transformation is the mate of
the commutation isomorphism (up to `R^0f_* ≅ f_*`); its evaluation at strictly totally
disconnected `X̃` is `hullComparison` in degree 0. -/
example {Y' Y : S.LS} (f : Y' ⟶ Y) :
    ∃ (e₁ : qpHigherPush S Λ (S.lsDia.map f) 0 ≅ qpPushSh S Λ (S.lsDia.map f))
      (e₂ : vHigherPush S Λ (S.diaV.map (S.lsDia.map f)) 0 ≅
        vPushSh S Λ (S.diaV.map (S.lsDia.map f))),
      vQproetBaseChangeSh S Λ f 0 ≫ Functor.whiskerLeft _ e₂.hom =
        Functor.whiskerRight e₁.hom _ ≫ vQproetBaseChange0 S Λ f := by sorry

/-- test baseChange_ArtinSchreier (non-example): with `p`-torsion coefficients the comparison over
`λ∘_X(X̃) ×_X Y′` need not be an isomorphism (Artin–Schreier classes on the perfectoid closed
disc). -/
example [Nontrivial Λ] (hp : (S.p : Λ) = 0) :
    ¬ ∀ (X : S.Std) (Y' : S.LS) (f : Y' ⟶ S.ofStd X) (Xt : (vQcqsObj S X).FullSubcategory)
      (i : ℤ) (F : QpSh S Λ (S.lsDia.obj Y')), (nuSh S Λ Y').essImage F →
        IsIso ((hullComparison S Λ f Xt i).app F) := by sorry

/-! ## C1/strictly-local-reduction -/

-- omitted: the second reduction step (to `X = Spa(C, C⁺)`, `X̃ = Spa(C̃, C̃⁺)`,
-- `X′ = Spa(C′, C′⁺)` with surjective maps to `X`, and `F = j_!M` for a quasicompact open
-- `V ⊂ X′`); geometric points of `Y′` as perfectoid spaces and extension by zero along `V ⊂ X′`
-- are not typable against `Carriers`.
/-- DiamondEtaleCohomology:C1/strictly-local-reduction (proof of ECD Theorem 16.1): for a class
`P` of maps stable under base change, the degree-`i` base change isomorphism for all `f ∈ P`
follows from the comparison over connected strictly totally disconnected `X` and `X̃`. -/
theorem strictlyLocalReduction (i : ℤ) (P : ∀ {Y' Y : S.LS}, (Y' ⟶ Y) → Prop)
    (hP : ∀ {Y'' Y' X' X : S.LS} (g' : Y'' ⟶ Y') (f' : Y'' ⟶ X') (f : Y' ⟶ X) (g : X' ⟶ X),
      IsPullback (S.diaV.map (S.lsDia.map g')) (S.diaV.map (S.lsDia.map f'))
        (S.diaV.map (S.lsDia.map f)) (S.diaV.map (S.lsDia.map g)) → P f → P f')
    (hloc : ∀ (X : S.Std) (Y' : S.LS) (f : Y' ⟶ S.ofStd X), P f →
      ConnectedSpace (S.pts.obj (S.ofLS (S.ofStd X))) →
      ∀ Xt : (vQcqsObj S X).FullSubcategory, vStdObj S _ Xt.obj →
        ConnectedSpace (S.pts.obj ((S.vSrc _).obj Xt.obj).left) →
        ∀ F : QpSh S Λ (S.lsDia.obj Y'), (nuSh S Λ Y').essImage F →
          IsIso ((hullComparison S Λ f Xt i).app F)) :
    ∀ {Y' Y : S.LS} (f : Y' ⟶ Y), P f → ∀ F : QpSh S Λ (S.lsDia.obj Y'),
      (nuSh S Λ Y').essImage F → IsIso ((vQproetBaseChangeSh S Λ f i).app F) := sorry

/-! ## C1: ECD Theorem 16.1 and Corollary 16.4 -/

/-- DiamondEtaleCohomology:C1/v-pushforward-degree-zero (ECD Theorem 16.1(i)): for `F` on
`Y′_qproét` pulled back from `Y′_ét`, `λ_Y^*f_qproét*F → f_v*λ_{Y′}^*F` is an isomorphism. -/
theorem vPushforwardDegreeZero {Y' Y : S.LS} (f : Y' ⟶ Y) (F : QpSh S Λ (S.lsDia.obj Y'))
    (hF : (nuSh S Λ Y').essImage F) : IsIso ((vQproetBaseChange0 S Λ f).app F) := sorry

/-- ... and over strictly totally disconnected `X = Y`, the degree-0 comparison is an
isomorphism for every `X̃ ∈ X_v`. -/
theorem vPushforwardDegreeZero.hull {X : S.Std} {Y' : S.LS} (f : Y' ⟶ S.ofStd X)
    (F : QpSh S Λ (S.lsDia.obj Y')) (hF : (nuSh S Λ Y').essImage F)
    (Xt : (vQcqsObj S X).FullSubcategory) : IsIso ((hullComparison S Λ f Xt 0).app F) := sorry

/-- DiamondEtaleCohomology:C1/v-pushforward-quasi-pro-etale (ECD Theorem 16.1(ii)): for `f`
quasi-pro-étale, `λ_Y^*R^if_qproét*F → R^if_v*λ_{Y′}^*F` is an isomorphism for all `i ≥ 0`. -/
theorem vPushforwardQuasiProEtale {Y' Y : S.LS} (f : Y' ⟶ Y) (hf : IsQproetMap S (S.lsDia.map f))
    (F : QpSh S Λ (S.lsDia.obj Y')) (hF : (nuSh S Λ Y').essImage F) :
    ∀ i : ℕ, IsIso ((vQproetBaseChangeSh S Λ f i).app F) := sorry

theorem vPushforwardQuasiProEtale.hull {X : S.Std} {Y' : S.LS} (f : Y' ⟶ S.ofStd X)
    (hf : IsQproetMap S (S.lsDia.map f)) (F : QpSh S Λ (S.lsDia.obj Y'))
    (hF : (nuSh S Λ Y').essImage F) (Xt : (vQcqsObj S X).FullSubcategory) :
    ∀ i : ℕ, IsIso ((hullComparison S Λ f Xt i).app F) := sorry

/-- DiamondEtaleCohomology:C1/v-pushforward-prime-to-p (ECD Theorem 16.1(iii)): if `nΛ = 0` with
`n` prime to `p`, `λ_Y^*R^if_qproét*F → R^if_v*λ_{Y′}^*F` is an isomorphism for all `i ≥ 0`. -/
theorem vPushforwardPrimeToP {Y' Y : S.LS} (f : Y' ⟶ Y) (n : ℕ) (hn : Nat.Coprime n S.p)
    (hΛ : (n : Λ) = 0) (F : QpSh S Λ (S.lsDia.obj Y')) (hF : (nuSh S Λ Y').essImage F) :
    ∀ i : ℕ, IsIso ((vQproetBaseChangeSh S Λ f i).app F) := sorry

theorem vPushforwardPrimeToP.hull {X : S.Std} {Y' : S.LS} (f : Y' ⟶ S.ofStd X) (n : ℕ)
    (hn : Nat.Coprime n S.p) (hΛ : (n : Λ) = 0) (F : QpSh S Λ (S.lsDia.obj Y'))
    (hF : (nuSh S Λ Y').essImage F) (Xt : (vQcqsObj S X).FullSubcategory) :
    ∀ i : ℕ, IsIso ((hullComparison S Λ f Xt i).app F) := sorry

/-- DiamondEtaleCohomology:C1/derived-v-pushforward-comparison (ECD Corollary 16.4): if `f` is
quasi-pro-étale or `nΛ = 0` with `n` prime to `p`, then for `A ∈ D(Y′_qproét, Λ)` with all
cohomology sheaves pulled back from `Y′_ét`, `λ_Y^*Rf_qproét*A → Rf_v*λ_{Y′}^*A` is an
isomorphism. -/
theorem derivedVPushforwardComparison {Y' Y : S.LS} (f : Y' ⟶ Y)
    (hf : IsQproetMap S (S.lsDia.map f) ∨ ∃ n : ℕ, Nat.Coprime n S.p ∧ (n : Λ) = 0)
    (A : DQp S Λ (S.lsDia.obj Y'))
    (hA : ∀ j : ℤ, (nuSh S Λ Y').essImage ((DerivedCategory.homologyFunctor _ j).obj A)) :
    IsIso ((vQproetBaseChange S Λ f).app A) := sorry

/-- ... more precisely, over strictly totally disconnected `X = Y`,
`RΓ((λ∘_X(X̃) ×_X Y′)_qproét, A) = RΓ((X̃ ×_X Y′)_v, λ_{Y′}^*A)`. -/
theorem derivedVPushforwardComparison.hull {X : S.Std} {Y' : S.LS} (f : Y' ⟶ S.ofStd X)
    (hf : IsQproetMap S (S.lsDia.map f) ∨ ∃ n : ℕ, Nat.Coprime n S.p ∧ (n : Λ) = 0)
    (A : DQp S Λ (S.lsDia.obj Y'))
    (hA : ∀ j : ℤ, (nuSh S Λ Y').essImage ((DerivedCategory.homologyFunctor _ j).obj A))
    (Xt : (vQcqsObj S X).FullSubcategory) : IsIso ((hullComparisonD S Λ f Xt).app A) := sorry

/-! ## C1: ECD Proposition 16.6 – Corollary 16.10 -/

/-- DiamondEtaleCohomology:C1/etale-qproet-pushforward (ECD Proposition 16.6): for qcqs `f`,
`ν_Y^*R^if_ét*F → R^if_qproét*ν_{Y′}^*F` is an isomorphism for all `i ≥ 0`. -/
theorem etaleQproetPushforward {Y' Y : S.LS} (f : Y' ⟶ Y)
    (hf : IsQcqsMap S (S.diaV.map (S.lsDia.map f))) (F : EtSh S Λ Y') :
    ∀ i : ℕ, IsIso ((etQproetBaseChangeSh S Λ f i).app F) := sorry

/-- DiamondEtaleCohomology:C1/derived-etale-qproet-pushforward (ECD Corollary 16.7): for qcqs `f`
and `A ∈ D⁺(Y′_ét, Λ)`, `ν_Y^*Rf_ét*A → Rf_qproét*ν_{Y′}^*A` is an isomorphism. -/
theorem derivedEtaleQproetPushforward {Y' Y : S.LS} (f : Y' ⟶ Y)
    (hf : IsQcqsMap S (S.diaV.map (S.lsDia.map f))) (A : DEt S Λ Y')
    (hA : (DerivedCategory.TStructure.t (C := EtSh S Λ Y')).plus A) :
    IsIso ((etQproetBaseChange S Λ f).app A) := sorry

/-- ... and for strictly totally disconnected `Y`, `Y′` the same holds for all `A`. -/
theorem derivedEtaleQproetPushforward.std {X' X : S.Std} (f : S.ofStd X' ⟶ S.ofStd X)
    (hf : IsQcqsMap S (S.diaV.map (S.lsDia.map f))) (A : DEt S Λ (S.ofStd X')) :
    IsIso ((etQproetBaseChange S Λ f).app A) := sorry

/-- DiamondEtaleCohomology:C1/qproet-base-change-sheaves (ECD Corollary 16.9): for a cartesian
square of locally spatial diamonds and `F` on `Y_qproét` pulled back from `Y_ét`,
`g^*R^if_*F → R^if′_*g′^*F` is an isomorphism (i) for `i = 0`, (ii) for all `i` if `f` or `g` is
quasi-pro-étale, (iii) for all `i` if `nΛ = 0` with `n` prime to `p`. -/
theorem qproetBaseChangeSheaves {Y' Y X' X : S.LS} (g' : Y' ⟶ Y) (f' : Y' ⟶ X') (f : Y ⟶ X)
    (g : X' ⟶ X) (h : g' ≫ f = f' ≫ g)
    (hcart : IsPullback (S.diaV.map (S.lsDia.map g')) (S.diaV.map (S.lsDia.map f'))
      (S.diaV.map (S.lsDia.map f)) (S.diaV.map (S.lsDia.map g)))
    (F : QpSh S Λ (S.lsDia.obj Y)) (hF : (nuSh S Λ Y).essImage F) :
    IsIso ((squareBaseChangeSh S Λ g' f' f g h 0).app F) ∧
      (IsQproetMap S (S.lsDia.map f) ∨ IsQproetMap S (S.lsDia.map g) →
        ∀ i : ℕ, IsIso ((squareBaseChangeSh S Λ g' f' f g h i).app F)) ∧
      (∀ n : ℕ, Nat.Coprime n S.p → (n : Λ) = 0 →
        ∀ i : ℕ, IsIso ((squareBaseChangeSh S Λ g' f' f g h i).app F)) := sorry

/-- DiamondEtaleCohomology:C1/qproet-base-change-complexes (ECD Corollary 16.9): if `f` or `g` is
quasi-pro-étale or `nΛ = 0` with `n` prime to `p`, then `g^*Rf_*A → Rf′_*g′^*A` is an isomorphism
for `A ∈ D(Y_qproét, Λ)` with all cohomology sheaves pulled back from `Y_ét`. -/
theorem qproetBaseChangeComplexes {Y' Y X' X : S.LS} (g' : Y' ⟶ Y) (f' : Y' ⟶ X') (f : Y ⟶ X)
    (g : X' ⟶ X) (h : g' ≫ f = f' ≫ g)
    (hcart : IsPullback (S.diaV.map (S.lsDia.map g')) (S.diaV.map (S.lsDia.map f'))
      (S.diaV.map (S.lsDia.map f)) (S.diaV.map (S.lsDia.map g)))
    (hcond : IsQproetMap S (S.lsDia.map f) ∨ IsQproetMap S (S.lsDia.map g) ∨
      ∃ n : ℕ, Nat.Coprime n S.p ∧ (n : Λ) = 0)
    (A : DQp S Λ (S.lsDia.obj Y))
    (hA : ∀ j : ℤ, (nuSh S Λ Y).essImage ((DerivedCategory.homologyFunctor _ j).obj A)) :
    IsIso ((squareBaseChange S Λ g' f' f g h).app A) := sorry

/-- DiamondEtaleCohomology:C1/etale-base-change-sheaves (ECD Corollary 16.10): for a cartesian
square of locally spatial diamonds with `f` qcqs and `F` on `Y_ét`, `g^*R^if_*F → R^if′_*g′^*F`
is an isomorphism (i) for `i = 0`, (ii) for all `i` if `f` or `g` is quasi-pro-étale, (iii) for
all `i` if `nΛ = 0` with `n` prime to `p`. -/
theorem etaleBaseChangeSheaves {Y' Y X' X : S.LS} (g' : Y' ⟶ Y) (f' : Y' ⟶ X') (f : Y ⟶ X)
    (g : X' ⟶ X) (h : g' ≫ f = f' ≫ g)
    (hcart : IsPullback (S.diaV.map (S.lsDia.map g')) (S.diaV.map (S.lsDia.map f'))
      (S.diaV.map (S.lsDia.map f)) (S.diaV.map (S.lsDia.map g)))
    (hf : IsQcqsMap S (S.diaV.map (S.lsDia.map f))) (F : EtSh S Λ Y) :
    IsIso ((squareBaseChangeEtSh S Λ g' f' f g h 0).app F) ∧
      (IsQproetMap S (S.lsDia.map f) ∨ IsQproetMap S (S.lsDia.map g) →
        ∀ i : ℕ, IsIso ((squareBaseChangeEtSh S Λ g' f' f g h i).app F)) ∧
      (∀ n : ℕ, Nat.Coprime n S.p → (n : Λ) = 0 →
        ∀ i : ℕ, IsIso ((squareBaseChangeEtSh S Λ g' f' f g h i).app F)) := sorry

/-- DiamondEtaleCohomology:C1/etale-base-change-complexes (ECD Corollary 16.10): with `f` qcqs, if
`f` or `g` is quasi-pro-étale or `nΛ = 0` with `n` prime to `p`, then `g^*Rf_*A → Rf′_*g′^*A` is
an isomorphism for every `A ∈ D⁺(Y_ét, Λ)`. -/
theorem etaleBaseChangeComplexes {Y' Y X' X : S.LS} (g' : Y' ⟶ Y) (f' : Y' ⟶ X') (f : Y ⟶ X)
    (g : X' ⟶ X) (h : g' ≫ f = f' ≫ g)
    (hcart : IsPullback (S.diaV.map (S.lsDia.map g')) (S.diaV.map (S.lsDia.map f'))
      (S.diaV.map (S.lsDia.map f)) (S.diaV.map (S.lsDia.map g)))
    (hf : IsQcqsMap S (S.diaV.map (S.lsDia.map f)))
    (hcond : IsQproetMap S (S.lsDia.map f) ∨ IsQproetMap S (S.lsDia.map g) ∨
      ∃ n : ℕ, Nat.Coprime n S.p ∧ (n : Λ) = 0)
    (A : DEt S Λ Y) (hA : (DerivedCategory.TStructure.t (C := EtSh S Λ Y)).plus A) :
    IsIso ((squareBaseChangeEt S Λ g' f' f g h).app A) := sorry

end TauCeti.DiamondEtale


/-! # Stages C2, C3, C5, C6 (ECD §§14, 16, 17, 19): D_ét, the operations on it, extension by zero,
proper base change, invariance under change of algebraically closed base field

Names this part adds beyond the packet API (for the assembler; check for clashes with other parts):
* genuine definitions over `Carriers`/Mathlib: `stdV`, `lsMap`, `stdMap`, `etSrc`, `etMap`,
  `IsVCoverFamily`, `IsVCover`, `IsQproetMapToDia`, `IsQproetV`, `IsEtaleV`, `IsQuasiseparatedMap`,
  `IsTruncGEMap`, `etEmb`, `IsEtPlus`, `etPlus`, `etEmbDet`, `stdSpaceDet`, `vConst`, `vUnit`,
  `constObj`, `vFree`, `Carriers.atCutoff`, `IsCartesian`, `IsVHypercover`, `IsAdequateCutoff`,
  `etDual`, `IsDualizableEt`, `ZRSpace`, `openSubV`, `openSubIncl`, `annulusMap`,
  `CohomologyAndPi0Invariant`, and the honest constructions `push_comp`, `push_id`,
  `pushBaseChangeOf`, `pushBaseChange`, `etaleShriekBaseChangeOf`, `etHom.pull_map`, `pbcAdjoint`,
  `pbcMapGen`, `pbcMap`, `pbcBaseChangeLift`;
* supplier data (sorry-bodied constructions): `qpPull`, `qpPush`, `vPush`, `vPullPushAdj`,
  `etPushDer`, `etPullDer`, `vToEtPush`, `vToEtAdj`, `etToQp`, `rGamma`, `rGammaPull`, `rGammaV`,
  `contSheaf`, `VOverAt`, `vSrcAt`, `qpVAt`, `enhancedV.transition`, `simpSite`, `simpTopology`,
  `simpRestrict`, `simpCartMap`, `simpPull`, `etaleCoreflection`, `vTensor`, `vShTensor`, `vHom`,
  `constD`, `moduleDTensor`, `moduleDHom`, `moduleRestrictD`, `moduleExtendD`, `spaceDPull`,
  `spaceDTensor`, `openSub`, `etBaseChange`, `etBaseChangeMap`, `profiniteProduct`, `profiniteProj`,
  `spdDisc`, `spdDiscMap`, `classifyingStack`, `classifyingPoint`, `residueField`, `plusResidue`,
  `residueMap`, `tAdicPoint`, `tAdicPointMap`, `annulusOpen`, and the isomorphisms named by the
  packet API (`pull_comp`, `pull_id`, ...). -/
-- EXTRA IMPORTS: Mathlib.Algebra.Homology.DerivedCategory.TStructure, Mathlib.Algebra.Homology.DerivedCategory.HomologySequence, Mathlib.AlgebraicTopology.SimplicialObject.Basic, Mathlib.RingTheory.Valuation.ValuationSubring, Mathlib.FieldTheory.IsAlgClosed.Basic, Mathlib.CategoryTheory.Monoidal.Braided.Basic, Mathlib.Topology.Sheaves.Abelian, Mathlib.CategoryTheory.Triangulated.TStructure.TruncLEGT, Mathlib.Algebra.Homology.DerivedCategory.ExactFunctor, Mathlib.Topology.LocallyConstant.Algebra, Mathlib.Algebra.Category.ModuleCat.Adjunctions
namespace TauCeti.DiamondEtale
open CategoryTheory Limits Topology
attribute [local instance] HasDerivedCategory.standard
variable (S : Carriers.{u}) (Λ : Type u) [CommRing Λ]

/-! ## Helper notions (genuine definitions over the carriers) -/

/-- The small v-stack underlying a strictly totally disconnected perfectoid space. -/
abbrev stdV (X : S.Std) : S.V := S.ofLS (S.ofStd X)

/-- The map of small v-stacks underlying a map of locally spatial diamonds. -/
abbrev lsMap {Y' Y : S.LS} (f : Y' ⟶ Y) : S.ofLS Y' ⟶ S.ofLS Y := S.diaV.map (S.lsDia.map f)

/-- A family `fᵢ : Xᵢ → Y` of maps of small v-stacks is jointly surjective as maps of v-stacks
(at the cutoff of `Carriers`): every object `T → Y` of the v-site is covered by objects over which
`T → Y` lifts through some `fᵢ`. This is surjectivity of `⊔ Xᵢ → Y` in the v-topos. -/
def IsVCoverFamily {ι : Type u} {X : ι → S.V} {Y : S.V} (f : ∀ i, X i ⟶ Y) : Prop :=
  ∀ T : S.VOver Y, (⟨fun T' _ => ∃ (i : ι) (h : ((S.vSrc Y).obj T').left ⟶ X i),
      h ≫ f i = ((S.vSrc Y).obj T').hom, by
      rintro T₁ T₂ g ⟨i, h, hh⟩ k
      exact ⟨i, ((S.vSrc Y).map k).left ≫ h, by simp [hh]⟩⟩ : Sieve T) ∈ vSite S Y T

/-- A map of small v-stacks is a v-cover (surjective as a map of v-stacks). -/
def IsVCover {X Y : S.V} (f : X ⟶ Y) : Prop := IsVCoverFamily S (fun _ : PUnit.{u+1} => f)

/-- A map into a diamond is a (locally separated, κ-small) quasi-pro-étale map: it is isomorphic
over `Y` to an object of the quasi-pro-étale site `Y_qproét`. -/
def IsQproetMapToDia {Y' : S.V} {Y : S.Dia} (f : Y' ⟶ S.ofDia Y) : Prop :=
  ∃ U : S.QpOver Y, Nonempty ((S.qpSrc Y).obj U ≅ Over.mk f)

/-- A map of small v-stacks is quasi-pro-étale: its base change to every strictly totally
disconnected `X → Y` is quasi-pro-étale (ECD Definition 10.1, at the cutoff). -/
def IsQproetV {Y' Y : S.V} (f : Y' ⟶ Y) : Prop :=
  ∀ (X : S.Std) (g : stdV S X ⟶ Y), IsQproetMapToDia S (Y := S.lsDia.obj (S.ofStd X)) (pullback.snd f g)

/-- A map of small v-stacks is (locally separated, κ-small) étale: it is isomorphic over `Y` to
an object of `EtVOver Y`. -/
def IsEtaleV {Y' Y : S.V} (f : Y' ⟶ Y) : Prop :=
  ∃ U : S.EtVOver Y, Nonempty ((S.etVSrc Y).obj U ≅ Over.mk f)

/-- Quasiseparatedness: the diagonal is quasicompact. -/
def IsQuasiseparatedMap {X Y : S.V} (f : X ⟶ Y) : Prop :=
  IsQuasicompactMap S (pullback.diagonal f)

/-- `f : A → B` in a derived category exhibits `B` as `τ^{≥ n} A`: `B ∈ D^{≥ n}` and `f` induces
isomorphisms on `H^i` for `i ≥ n`. -/
def IsTruncGEMap {C : Type*} [Category C] [Abelian C] [HasDerivedCategory C]
    {A B : DerivedCategory C} (n : ℤ) (f : A ⟶ B) : Prop :=
  (∀ i : ℤ, i < n → IsZero ((DerivedCategory.homologyFunctor C i).obj B)) ∧
    ∀ i : ℤ, n ≤ i → IsIso ((DerivedCategory.homologyFunctor C i).map f)

/-- The comparison `λ^* ν^* : D(Y_ét, Λ) → D(Y_v, Λ)` for a locally spatial diamond. -/
def etEmb (Y : S.LS) : DEt S Λ Y ⥤ DV S Λ (S.ofLS Y) :=
  nuPull S Λ Y ⋙ lambdaPull S Λ (S.lsDia.obj Y)

/-- `A ∈ D⁺(Y_ét, Λ) ⊂ D(Y_v, Λ)`: `A` is the image of a bounded below complex of étale sheaves. -/
def IsEtPlus (Y : S.LS) : ObjectProperty (DV S Λ (S.ofLS Y)) := fun A =>
  ∃ B : DEt S Λ Y, DerivedCategory.TStructure.t.plus B ∧ Nonempty ((etEmb S Λ Y).obj B ≅ A)

/-- Pullback on the quasi-pro-étale derived categories (supplier data, C0/comparison-morphisms). -/
def qpPull {Y' Y : S.Dia} (f : Y' ⟶ Y) : DQp S Λ Y ⥤ DQp S Λ Y' := sorry

/-! ## C2/v-local-etaleness (ECD Theorem 14.12) -/

/-- DiamondEtaleCohomology:C2/v-local-etaleness (ECD Theorem 14.12 (i), v-version): for a
v-cover `f : Y' → Y` of locally spatial diamonds, if `f^*A ∈ D⁺(Y'_ét, Λ)` then
`A ∈ D⁺(Y_ét, Λ)`. -/
theorem vLocalEtaleness {Y' Y : S.LS} (f : Y' ⟶ Y)
    (hf : IsVCover S (lsMap S f)) (A : DV S Λ (S.ofLS Y))
    (hA : IsEtPlus S Λ Y' ((vPull S Λ (lsMap S f)).obj A)) :
    IsEtPlus S Λ Y A := sorry

/-- ECD Theorem 14.12 (i), quasi-pro-étale version. -/
theorem vLocalEtaleness_qproet {Y' Y : S.LS} (f : Y' ⟶ Y)
    (hf : IsVCover S (lsMap S f)) (A : DQp S Λ (S.lsDia.obj Y))
    (hA : ∃ B : DEt S Λ Y', DerivedCategory.TStructure.t.plus B ∧
      Nonempty ((nuPull S Λ Y').obj B ≅ (qpPull S Λ (S.lsDia.map f)).obj A)) :
    ∃ B : DEt S Λ Y, DerivedCategory.TStructure.t.plus B ∧ Nonempty ((nuPull S Λ Y).obj B ≅ A) :=
  sorry

/-- ECD Theorem 14.12 (ii), v-version: for a v-cover `X' → X` of strictly totally
disconnected spaces, `f^*A ∈ D(X'_ét, Λ)` implies `A ∈ D(X_ét, Λ)` (unbounded). -/
theorem vLocalEtaleness_std {X' X : S.Std} (f : X' ⟶ X)
    (hf : IsVCover S (lsMap S (S.stdLS.map f))) (A : DV S Λ (stdV S X))
    (hA : (stdEmb S Λ X').essImage ((vPull S Λ (lsMap S (S.stdLS.map f))).obj A)) :
    (stdEmb S Λ X).essImage A := sorry

/-- ECD Theorem 14.12 (ii), quasi-pro-étale version. -/
theorem vLocalEtaleness_std_qproet {X' X : S.Std} (f : X' ⟶ X)
    (hf : IsVCover S (lsMap S (S.stdLS.map f)))
    (A : DQp S Λ (S.lsDia.obj (S.ofStd X)))
    (hA : (nuPull S Λ (S.ofStd X')).essImage ((qpPull S Λ (S.lsDia.map (S.stdLS.map f))).obj A)) :
    (nuPull S Λ (S.ofStd X)).essImage A := sorry

/-! ## C2/etale-derived-category (ECD Definition 14.13): API and tests -/

/-- Membership in `D_ét` is tested on all maps from strictly totally disconnected spaces. -/
theorem Det.mem_iff_std (Y : S.V) (A : DV S Λ Y) :
    Det S Λ Y A ↔ ∀ (X : S.Std) (f : stdV S X ⟶ Y), (stdEmb S Λ X).essImage ((vPull S Λ f).obj A) :=
  sorry

/-- Membership in `D_ét` is tested on one v-cover by (a family of, i.e. a disjoint union of)
strictly totally disconnected spaces. -/
theorem Det.mem_iff_cover {Y : S.V} {ι : Type u} (X : ι → S.Std) (f : ∀ i, stdV S (X i) ⟶ Y)
    (hf : IsVCoverFamily S f) (A : DV S Λ Y) :
    Det S Λ Y A ↔ ∀ i, (stdEmb S Λ (X i)).essImage ((vPull S Λ (f i)).obj A) := sorry

/-- Membership in `D_ét` is detected on cohomology sheaves. -/
theorem Det.mem_iff_cohomology (Y : S.V) (A : DV S Λ Y) :
    Det S Λ Y A ↔ ∀ i : ℤ, Det S Λ Y ((DerivedCategory.singleFunctor _ 0).obj
      ((DerivedCategory.homologyFunctor _ i).obj A)) := sorry

/-- `g^*` (on `D(Y_v, Λ)`) carries `D_ét(Y, Λ)` into `D_ét(Y', Λ)`. -/
theorem Det.pullback_mem {Y' Y : S.V} (g : Y' ⟶ Y) (A : DV S Λ Y) (hA : Det S Λ Y A) :
    Det S Λ Y' ((vPull S Λ g).obj A) := sorry

/-- For strictly totally disconnected `X`, `D_ét(X, Λ)` is the essential image of `D(X_ét, Λ)`. -/
theorem Det.std_eq (X : S.Std) : Det S Λ (stdV S X) = (stdEmb S Λ X).essImage := sorry

/-- For a locally spatial diamond `Y`, `D⁺_ét(Y, Λ)` is the essential image of `D⁺(Y_ét, Λ)`. -/
theorem Det.plus_eq (Y : S.LS) :
    Det S Λ (S.ofLS Y) ⊓ DerivedCategory.TStructure.t.plus = IsEtPlus S Λ Y := sorry

instance Det.isClosedUnderIsomorphisms (Y : S.V) : (Det S Λ Y).IsClosedUnderIsomorphisms := sorry

/-- `D_ét(Y, Λ)` is a triangulated subcategory of `D(Y_v, Λ)` (so `DetCat` is pretriangulated). -/
instance Det.isTriangulated (Y : S.V) : (Det S Λ Y).IsTriangulated := sorry

/-- `D_ét(Y, Λ)` is closed under the canonical truncations (part of `Det.isTriangulated` in the
packet), so it carries the induced t-structure. -/
theorem Det.truncation_mem (Y : S.V) (A : DV S Λ Y) (hA : Det S Λ Y A) (n : ℤ) :
    Det S Λ Y ((DerivedCategory.TStructure.t.truncLE n).obj A) ∧
      Det S Λ Y ((DerivedCategory.TStructure.t.truncGE n).obj A) := sorry

/-! ## Supplier data used below (sorry-bodied constructions) -/

/-- `RΓ(Y, −) : D_ét(Y, Λ) → D(Λ)` (supplier data). For a connected strictly totally disconnected
`X = Spa(C, C⁺)` it computes the stalk at the closed point (the geometric stalk, C0/geometric-stalk). -/
def rGamma (Y : S.V) : DetCat S Λ Y ⥤ DerivedCategory (ModuleCat.{u} Λ) := sorry

/-- The pullback map on cohomology `RΓ(Y, A) → RΓ(Y', h^*A)` (supplier data). -/
def rGammaPull {Y' Y : S.V} (h : Y' ⟶ Y) : rGamma S Λ Y ⟶ pull S Λ h ⋙ rGamma S Λ Y' := sorry

/-- The v-pushforward `Rf_v* : D(Y'_v, Λ) → D(Y_v, Λ)` (supplier data, C1), right adjoint to `vPull`. -/
def vPush {Y' Y : S.V} (f : Y' ⟶ Y) : DV S Λ Y' ⥤ DV S Λ Y := sorry
def vPullPushAdj {Y' Y : S.V} (f : Y' ⟶ Y) : vPull S Λ f ⊣ vPush S Λ f := sorry

/-- The quasi-pro-étale pushforward `Rf_qproét*` for maps of diamonds (supplier data, C1). -/
def qpPush {Y' Y : S.Dia} (f : Y' ⟶ Y) : DQp S Λ Y' ⥤ DQp S Λ Y := sorry

/-- The étale pushforward `Rf_ét*` and pullback `f_ét^*` for maps of locally spatial diamonds
(supplier data, C1). -/
def etPushDer {Y' Y : S.LS} (f : Y' ⟶ Y) : DEt S Λ Y' ⥤ DEt S Λ Y := sorry
def etPullDer {Y' Y : S.LS} (f : Y' ⟶ Y) : DEt S Λ Y ⥤ DEt S Λ Y' := sorry

/-- The v-sheaf `T ↦ C(|T|, M)` of continuous maps into a topological Λ-module (supplier data). -/
def contSheaf (Y : S.V) (M : Type u) [TopologicalSpace M] [AddCommGroup M] [Module Λ M] :
    VSh S Λ Y := sorry

/-- The comparison `D(|X|, Λ) → D(X_ét, Λ) → D_ét(X, Λ)` for strictly totally disconnected `X`,
through `stdSpaceEquiv` (C0/std-etale-acyclic) and `stdEmb`. -/
def stdSpaceDet (X : S.Std) :
    DerivedCategory (TopCat.Sheaf (ModuleCat.{u} Λ) (S.pts.obj (stdV S X))) ⥤ DetCat S Λ (stdV S X) :=
  haveI := Functor.additive_of_preserves_binary_products (stdSpaceEquiv S Λ X).inverse
  (Det S Λ (stdV S X)).lift ((stdSpaceEquiv S Λ X).inverse.mapDerivedCategory ⋙ stdEmb S Λ X)
    (fun B => by rw [Det.std_eq]; exact ⟨_, ⟨Iso.refl _⟩⟩)

/-- test Det_zero_ring (degenerate): for `Λ = 0`, `D_ét(Y, Λ) = 0`. -/
example [Subsingleton Λ] (Y : S.V) (A : DetCat S Λ Y) : IsZero A := by sorry

/-- test Det_empty (degenerate): for `Y = ∅` (an initial small v-stack), `D_ét(Y, Λ) = 0`. -/
example (Y : S.V) (hY : IsInitial Y) (A : DetCat S Λ Y) : IsZero A := by sorry

/-- test Det_geometric_point (computation): for `Y = Spa(C, O_C)` with `C` algebraically closed
(a strictly totally disconnected space whose underlying space is one point), global sections give
an equivalence `D_ét(Y, Λ) ≃ D(Λ)`. -/
example (X : S.Std) [Nonempty (S.pts.obj (stdV S X))] [Subsingleton (S.pts.obj (stdV S X))] :
    (rGamma S Λ (stdV S X)).IsEquivalence := by sorry

/-- test Det_std (compatibility): for strictly totally disconnected `X`, `D_ét(X, Λ)` is equivalent
to Mathlib's derived category of sheaves of Λ-modules on `|X|`. -/
example (X : S.Std) : (stdSpaceDet S Λ X).IsEquivalence := by sorry

/-- test Det_condensed_nonexample (non-example): for `Y = Spa(C, O_C)` the v-sheaf
`S ↦ C(|S|, Λ)` is not in `D_ét(Y, Λ)`. The packet takes `Λ = Z_p`; stated for any first countable
non-discrete profinite coefficient ring (the properties of `Z_p` that the argument uses). -/
example [TopologicalSpace Λ] [CompactSpace Λ] [T2Space Λ] [TotallyDisconnectedSpace Λ]
    [FirstCountableTopology Λ] (hΛ : ¬ DiscreteTopology Λ)
    (X : S.Std) [Nonempty (S.pts.obj (stdV S X))] [Subsingleton (S.pts.obj (stdV S X))] :
    ¬ Det S Λ (stdV S X) ((DerivedCategory.singleFunctor _ 0).obj (contSheaf S Λ (stdV S X) Λ)) := by
  sorry

/-! ## C2/etale-test-on-one-cover (ECD Remark 14.14) -/

/-- DiamondEtaleCohomology:C2/etale-test-on-one-cover (ECD Remark 14.14): `A ∈ D_ét(Y, Λ)` as
soon as its pullback to one v-cover by a locally spatial diamond lies in `D_ét`. The identifications
`D⁺_ét = D⁺(Y_ét)` (locally spatial `Y`) and `D_ét = D(Y_ét)` (strictly totally disconnected `Y`)
are `Det.plus_eq` and `Det.std_eq`. The remark "in general `D_ét(Y, Λ) ≠ D(Y_ét, Λ)`" is an
existence statement without a carrier object and is omitted. -/
theorem etaleTestOnOneCover {Y : S.V} (X : S.LS) (f : S.ofLS X ⟶ Y) (hf : IsVCover S f)
    (A : DV S Λ Y) (hA : Det S Λ (S.ofLS X) ((vPull S Λ f).obj A)) : Det S Λ Y A := sorry

/-! ## C2/etale-derived-left-complete (ECD Proposition 14.15, first part) -/

/-- DiamondEtaleCohomology:C2/etale-derived-left-complete (ECD Proposition 14.15): every Postnikov
tower `(A_n)` in `D_ét(Y, Λ)` (with `A_{n+1} → A_n` exhibiting `A_n = τ^{≥ -n} A_{n+1}`) has a limit in
`D_ét(Y, Λ)`, i.e. an object `L ∈ D_ét` with compatible maps exhibiting `A_n = τ^{≥ -n} L`.
Homotopy-level shadow: Mathlib's `DerivedCategory` has no homotopy limits, so the formula
`A ≅ R lim τ^{≥ -n} A` is recorded through this existence statement (such an `L` is the `R lim` in
the left-complete `D(Y_v, Λ)`). -/
theorem etaleDerivedLeftComplete (Y : S.V) (A : ℕ → DV S Λ Y) (hA : ∀ n, Det S Λ Y (A n))
    (π : ∀ n, A (n + 1) ⟶ A n) (hπ : ∀ n : ℕ, IsTruncGEMap (-(n : ℤ)) (π n)) :
    ∃ (L : DV S Λ Y) (p : ∀ n, L ⟶ A n), Det S Λ Y L ∧ (∀ n, p (n + 1) ≫ π n = p n) ∧
      ∀ n : ℕ, IsTruncGEMap (-(n : ℤ)) (p n) := sorry

/-! ## C2/left-completion-comparison (ECD Proposition 14.15) -/

/-- The embedding `D_ét(Y, Λ) → D(Y_qproét, Λ)` for a locally spatial diamond (`Rλ_*` restricted to
`D_ét`; supplier data). -/
def etToQp (Y : S.LS) : DetCat S Λ (S.ofLS Y) ⥤ DQp S Λ (S.lsDia.obj Y) := sorry

/-- `D(Y_ét, Λ) → D(Y_v, Λ)` lands in `D_ét(Y, Λ)`. -/
theorem etEmb_mem (Y : S.LS) (B : DEt S Λ Y) : Det S Λ (S.ofLS Y) ((etEmb S Λ Y).obj B) := sorry

/-- The functor `D(Y_ét, Λ) → D_ét(Y, Λ)`. -/
def etEmbDet (Y : S.LS) : DEt S Λ Y ⥤ DetCat S Λ (S.ofLS Y) :=
  (Det S Λ (S.ofLS Y)).lift (etEmb S Λ Y) (etEmb_mem S Λ Y)

/-- DiamondEtaleCohomology:C2/left-completion-comparison (ECD Proposition 14.15): the embedding
`D⁺(Y_ét, Λ) ⊂ D(Y_qproét, Λ)` extends to a fully faithful embedding `D_ét(Y, Λ) ⊂ D(Y_qproét, Λ)`
whose image consists of the objects all of whose cohomology sheaves come from `Y_ét`. The
left-completion statement itself is `leftCompletionComparison_tower` (its homotopy-level shadow);
compatibility with the enhancements and cutoff transitions is ∞-categorical and omitted. -/
theorem leftCompletionComparison (Y : S.LS) :
    Nonempty (etToQp S Λ Y).FullyFaithful ∧
    (etToQp S Λ Y).essImage = (fun A => ∀ i : ℤ,
      (nuSh S Λ Y).essImage ((DerivedCategory.homologyFunctor _ i).obj A)) ∧
    ∀ B : DEt S Λ Y, DerivedCategory.TStructure.t.plus B →
      Nonempty ((etToQp S Λ Y).obj ((etEmbDet S Λ Y).obj B) ≅ (nuPull S Λ Y).obj B) := sorry

/-- Left completion, homotopy-level shadow: every Postnikov tower `(B_n)` in `D(Y_ét, Λ)` has a limit
in `D_ét(Y, Λ)` with the prescribed truncations, and every object of `D_ét(Y, Λ)` has all its
truncations `τ^{≥ n}` in `D⁺(Y_ét, Λ)`. -/
theorem leftCompletionComparison_tower (Y : S.LS) :
    (∀ (B : ℕ → DEt S Λ Y) (π : ∀ n, B (n + 1) ⟶ B n), (∀ n : ℕ, IsTruncGEMap (-(n : ℤ)) (π n)) →
      ∃ (L : DetCat S Λ (S.ofLS Y)) (p : ∀ n, L.obj ⟶ (etEmb S Λ Y).obj (B n)),
        (∀ n, p (n + 1) ≫ (etEmb S Λ Y).map (π n) = p n) ∧ ∀ n : ℕ, IsTruncGEMap (-(n : ℤ)) (p n)) ∧
    ∀ (A : DetCat S Λ (S.ofLS Y)) (n : ℤ),
      IsEtPlus S Λ Y ((DerivedCategory.TStructure.t.truncGE n).obj A.obj) := sorry

/-! ## C2/cohomology-sheaf-criterion (ECD Proposition 14.16) -/

/-- DiamondEtaleCohomology:C2/cohomology-sheaf-criterion (ECD Proposition 14.16) -/
theorem cohomologySheafCriterion (Y : S.V) (A : DV S Λ Y) :
    Det S Λ Y A ↔ ∀ i : ℤ, Det S Λ Y ((DerivedCategory.singleFunctor _ 0).obj
      ((DerivedCategory.homologyFunctor _ i).obj A)) := sorry

/-! ## C2/qproet-pushforward-etale (ECD Corollary 16.5) -/

/-- DiamondEtaleCohomology:C2/qproet-pushforward-etale (ECD Corollary 16.5), case `nΛ = 0` with
`n` prime to `p`: if `Rf_qproét* A ∈ D_ét(Y, Λ) ⊂ D(Y_qproét, Λ)`, then `Rf_v* A ∈ D_ét(Y, Λ)` and the
two agree. -/
theorem qproetPushforwardEtale (n : ℕ) (hn : Nat.Coprime n S.p) (hΛ : (n : Λ) = 0) {Y' Y : S.LS}
    (f : Y' ⟶ Y) (A : DetCat S Λ (S.ofLS Y'))
    (hA : (etToQp S Λ Y).essImage ((qpPush S Λ (S.lsDia.map f)).obj ((etToQp S Λ Y').obj A))) :
    ∃ B : DetCat S Λ (S.ofLS Y), Nonempty (B.obj ≅ (vPush S Λ (lsMap S f)).obj A.obj) ∧
      Nonempty ((etToQp S Λ Y).obj B ≅ (qpPush S Λ (S.lsDia.map f)).obj ((etToQp S Λ Y').obj A)) :=
  sorry

/-- ECD Corollary 16.5, case `f` quasi-pro-étale. -/
theorem qproetPushforwardEtale_qproet {Y' Y : S.LS} (f : Y' ⟶ Y) (hf : IsQproetV S (lsMap S f))
    (A : DetCat S Λ (S.ofLS Y'))
    (hA : (etToQp S Λ Y).essImage ((qpPush S Λ (S.lsDia.map f)).obj ((etToQp S Λ Y').obj A))) :
    ∃ B : DetCat S Λ (S.ofLS Y), Nonempty (B.obj ≅ (vPush S Λ (lsMap S f)).obj A.obj) ∧
      Nonempty ((etToQp S Λ Y).obj B ≅ (qpPush S Λ (S.lsDia.map f)).obj ((etToQp S Λ Y').obj A)) :=
  sorry

/-! ## C2/qcqs-pushforward-preserves-etale (ECD Corollary 16.8) -/

/-- DiamondEtaleCohomology:C2/qcqs-pushforward-preserves-etale (ECD Corollary 16.8 (i)): for a qcqs
quasi-pro-étale map, `Rf_v*` preserves `D_ét`. -/
theorem qcqsPushforwardPreservesEtale {Y' Y : S.V} (f : Y' ⟶ Y) (hqc : IsQuasicompactMap S f)
    (hqs : IsQuasiseparatedMap S f) (hf : IsQproetV S f) (A : DV S Λ Y') (hA : Det S Λ Y' A) :
    Det S Λ Y ((vPush S Λ f).obj A) := sorry

/-- ECD Corollary 16.8 (ii), first part: with `nΛ = 0`, `n` prime to `p`, `Rf_v*` preserves
`D⁺_ét` for qcqs `f`. -/
theorem qcqsPushforwardPreservesEtale_primeToP (n : ℕ) (hn : Nat.Coprime n S.p) (hΛ : (n : Λ) = 0)
    {Y' Y : S.V} (f : Y' ⟶ Y) (hqc : IsQuasicompactMap S f) (hqs : IsQuasiseparatedMap S f)
    (A : DV S Λ Y') (hA : Det S Λ Y' A) (hA' : DerivedCategory.TStructure.t.plus A) :
    Det S Λ Y ((vPush S Λ f).obj A) ∧ DerivedCategory.TStructure.t.plus ((vPush S Λ f).obj A) :=
  sorry

/-- ECD Corollary 16.8 (ii), second part: for locally spatial `Y', Y`, under `D⁺_ét = D⁺(−_ét)`,
`Rf_v* = Rf_ét*`. -/
theorem qcqsPushforwardPreservesEtale_locallySpatial (n : ℕ) (hn : Nat.Coprime n S.p)
    (hΛ : (n : Λ) = 0) {Y' Y : S.LS} (f : Y' ⟶ Y) (hqc : IsQuasicompactMap S (lsMap S f))
    (hqs : IsQuasiseparatedMap S (lsMap S f)) (B : DEt S Λ Y')
    (hB : DerivedCategory.TStructure.t.plus B) :
    Nonempty ((vPush S Λ (lsMap S f)).obj ((etEmb S Λ Y').obj B) ≅
      (etEmb S Λ Y).obj ((etPushDer S Λ f).obj B)) := sorry

/-! ## Constant sheaves -/

/-- The constant v-sheaf with value a Λ-module `M`. -/
def vConst (Y : S.V) (M : ModuleCat.{u} Λ) : VSh S Λ Y :=
  (constantSheaf (vSite S Y) (ModuleCat.{u} Λ)).obj M

/-- The constant sheaf `Λ`, placed in degree `0` of `D(Y_v, Λ)`. -/
def vUnit (Y : S.V) : DV S Λ Y :=
  (DerivedCategory.singleFunctor _ 0).obj (vConst S Λ Y (ModuleCat.of Λ Λ))

/-! ## C2/enhanced-v-derived-category (ECD Lemma 17.1)

No Mathlib carrier exists for presentable stable ∞-categories. The API names are given their
homotopy-level shadows: the homotopy category (Mathlib's `DerivedCategory`), the transition and
pullback functors between homotopy categories with their full faithfulness and composition
isomorphisms, and the derived category of the simplicial site with its cartesian objects.
Presentability, stability and the higher coherences are omitted. -/

/-- The v-site skeleton at another cutoff cardinal `κ` (supplier data, C0/cutoff-derived-categories). -/
def VOverAt (κ : Cardinal.{u}) (Y : S.V) : Type u := sorry
instance VOverAt.category (κ : Cardinal.{u}) (Y : S.V) : SmallCategory (VOverAt S κ Y) := sorry
def vSrcAt (κ : Cardinal.{u}) (Y : S.V) : VOverAt S κ Y ⥤ Over Y := sorry
def qpVAt (κ : Cardinal.{u}) (Y : S.Dia) : S.QpOver Y ⥤ VOverAt S κ (S.ofDia Y) := sorry

/-- The supplier interface at the cutoff `κ`: the same small v-stacks and étale and quasi-pro-étale
sites, with the v-site replaced by the site of κ-small objects. `DV (S.atCutoff κ) Λ Y` is
`D(Y_v,κ, Λ)` and `Det (S.atCutoff κ) Λ Y` is `D_ét` computed at the cutoff `κ`. -/
abbrev Carriers.atCutoff (κ : Cardinal.{u}) : Carriers.{u} :=
  { S with
    VOver := VOverAt S κ
    vCat := fun Y => inferInstance
    vSrc := vSrcAt S κ
    qpV := qpVAt S κ }

/-- DiamondEtaleCohomology:C2/enhanced-v-derived-category (ECD Lemma 17.1), API `enhancedV`: the ∞-category `𝒟(Y_v,κ, Λ)`, recorded by its
homotopy category `D(Y_v,κ, Λ)` (at the cutoff of `Carriers`). -/
abbrev enhancedV (Y : S.V) := DV S Λ Y

/-- API `enhancedV.transition`: the transition functor `D(Y_v,κ, Λ) → D(Y_v,κ', Λ)` for `κ ≤ κ'`
(supplier data). -/
def enhancedV.transition {κ κ' : Cardinal.{u}} (h : κ ≤ κ') (Y : S.V) :
    DV (S.atCutoff κ) Λ Y ⥤ DV (S.atCutoff κ') Λ Y := sorry

/-- The transition functors are fully faithful and preserve small coproducts. -/
theorem enhancedV.transition_fullyFaithful {κ κ' : Cardinal.{u}} (h : κ ≤ κ') (Y : S.V) :
    Nonempty (enhancedV.transition S Λ h Y).FullyFaithful ∧
      ∀ J : Type u, PreservesColimitsOfShape (Discrete J) (enhancedV.transition S Λ h Y) := sorry

/-- Composition of transition functors for `κ ≤ κ' ≤ κ''` (supplier data). -/
def enhancedV.transition_comp {κ κ' κ'' : Cardinal.{u}} (h : κ ≤ κ') (h' : κ' ≤ κ'') (Y : S.V) :
    enhancedV.transition S Λ (h.trans h') Y ≅
      enhancedV.transition S Λ h Y ⋙ enhancedV.transition S Λ h' Y := sorry

/-- API `enhancedV.pullback`: the composition isomorphism `(f ∘ g)_v^* ≃ g_v^* ∘ f_v^*` of
v-pullbacks (supplier data; written diagrammatically). The 0-truncatedness of `f` and `g` is not
typable against `Carriers` and is omitted (`vPull` is defined for all maps). -/
def enhancedV.pullback {Z Y X : S.V} (g : Z ⟶ Y) (f : Y ⟶ X) :
    vPull S Λ (g ≫ f) ≅ vPull S Λ f ⋙ vPull S Λ g := sorry

/-- v-pullbacks commute with the cutoff transitions and preserve small coproducts. -/
theorem enhancedV.pullback_transition {κ κ' : Cardinal.{u}} (h : κ ≤ κ') {Y' Y : S.V}
    (f : Y' ⟶ Y) :
    Nonempty (enhancedV.transition S Λ h Y ⋙ vPull (S.atCutoff κ') Λ f ≅
      vPull (S.atCutoff κ) Λ f ⋙ enhancedV.transition S Λ h Y') ∧
      ∀ J : Type u, PreservesColimitsOfShape (Discrete J) (vPull S Λ f) := sorry

open Simplicial

/-- The simplicial v-site of a simplicial small v-stack (supplier data, E3). -/
def simpSite (X : SimplicialObject S.V) : Type u := sorry
instance simpSite.category (X : SimplicialObject S.V) : SmallCategory (simpSite S X) := sorry
def simpTopology (X : SimplicialObject S.V) : GrothendieckTopology (simpSite S X) := sorry

/-- API `enhancedV.simplicial`: the derived category `D(Y_•,v, Λ)` of the simplicial site. -/
abbrev enhancedV.simplicial (X : SimplicialObject S.V) :=
  DerivedCategory (Sheaf (simpTopology S X) (ModuleCat.{u} Λ))

/-- Restriction to the `n`-th term `D(Y_•,v, Λ) → D(Y_n,v, Λ)` (supplier data). -/
def simpRestrict (X : SimplicialObject S.V) (n : ℕ) :
    enhancedV.simplicial S Λ X ⥤ DV S Λ (X.obj (Opposite.op ⦋n⦌)) := sorry

/-- The transition maps `α^* A_m → A_n` for `α : [m] → [n]` (supplier data). -/
def simpCartMap (X : SimplicialObject S.V) {m n : ℕ} (α : ⦋m⦌ ⟶ ⦋n⦌) :
    simpRestrict S Λ X m ⋙ vPull S Λ (X.map α.op) ⟶ simpRestrict S Λ X n := sorry

/-- The cartesian objects of `D(Y_•,v, Λ)`: all transition maps are isomorphisms. -/
def IsCartesian (X : SimplicialObject S.V) : ObjectProperty (enhancedV.simplicial S Λ X) :=
  fun A => ∀ (m n : ℕ) (α : ⦋m⦌ ⟶ ⦋n⦌), IsIso ((simpCartMap S Λ X α).app A)

/-- API `enhancedV.homotopy`: the homotopy category is a triangulated category (Mathlib's
`DerivedCategory`, with its shifts and distinguished triangles). -/
theorem enhancedV.homotopy (Y : S.V) : IsTriangulated (enhancedV S Λ Y) := sorry

/-- test enhancedV_zero_ring (degenerate): for `Λ = 0`, `D(Y_v,κ, Λ)` is zero. -/
example [Subsingleton Λ] (Y : S.V) (A : enhancedV S Λ Y) : IsZero A := by sorry

/-- test enhancedV_point (computation): for `Y = Spa(C, O_C)` (a strictly totally disconnected space
with one point) and `ℓΛ = 0` for a prime `ℓ ≠ p` (the packet takes `Λ = F_ℓ`),
`π_0 Map(Λ, Λ[i]) = Hom(Λ, Λ[i])` is `Λ` for `i = 0` and `0` otherwise. -/
example (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ S.p) (hΛ : (ℓ : Λ) = 0) (X : S.Std)
    [Nonempty (S.pts.obj (stdV S X))] [Subsingleton (S.pts.obj (stdV S X))] :
    Nonempty ((vUnit S Λ (stdV S X) ⟶ vUnit S Λ (stdV S X)) ≃+ Λ) ∧
      ∀ i : ℤ, i ≠ 0 → Subsingleton (vUnit S Λ (stdV S X) ⟶ (vUnit S Λ (stdV S X))⟦i⟧) := by
  sorry

/-- test enhancedV_homotopy_category (compatibility): the homotopy category of `𝒟(Y_v,κ, Λ)` is
`D(Y_v,κ, Λ)` with its shifts and distinguished triangles. -/
example (Y : S.V) : IsTriangulated (DV S Λ Y) := by sorry

/-- test enhancedV_not_set_presentable_uncut (non-example), homotopy-level shadow: no single cutoff
suffices — for every `κ` some transition `D(Y_v,κ, Λ) → D(Y_v,κ', Λ)` is not essentially surjective
(for nonempty `Y` and `Λ ≠ 0`), which is why the colimit over all cutoffs is not generated by a set
and the construction is made at a fixed `κ`. Presentability itself is ∞-categorical and omitted. -/
example [Nontrivial Λ] (Y : S.V) [Nonempty (S.pts.obj Y)] (κ : Cardinal.{u}) :
    ∃ (κ' : Cardinal.{u}) (h : κ ≤ κ'), ¬ (enhancedV.transition S Λ h Y).EssSurj := by sorry

/-! ## C2/v-hyperdescent (ECD Proposition 17.3) -/

/-- Coskeleta exist in `Over Y` (it has finite limits since `V` has pullbacks and a terminal object). -/
instance coskeleton_exists (Y : S.V) (n : ℕ) (F : (SimplexCategory.Truncated n)ᵒᵖ ⥤ Over Y) :
    (SimplexCategory.Truncated.inclusion n).op.HasRightKanExtension F := sorry

/-- A simplicial object `Y_• → Y` of small v-stacks over `Y` is a v-hypercover: `Y_0 → Y` and all
matching maps `Y_{n+1} → (cosk_n Y_•)_{n+1}` (coskeleta relative to `Y`) are v-covers. -/
def IsVHypercover {Y : S.V} (X : SimplicialObject (Over Y)) : Prop :=
  IsVCover S (X.obj (Opposite.op ⦋0⦌)).hom ∧ ∀ n : ℕ,
    IsVCover S ((((SimplicialObject.coskAdj n).unit.app X).app (Opposite.op ⦋n + 1⦌)).left)

/-- Pullback `D(Y_v, Λ) → D(Y_•,v, Λ)` along an augmented simplicial object (supplier data). -/
def simpPull {Y : S.V} (X : SimplicialObject (Over Y)) :
    DV S Λ Y ⥤ enhancedV.simplicial S Λ (X ⋙ Over.forget Y) := sorry

/-- Its `n`-th term is the pullback along `Y_n → Y` (supplier data). -/
def simpPull_restrict {Y : S.V} (X : SimplicialObject (Over Y)) (n : ℕ) :
    simpPull S Λ X ⋙ simpRestrict S Λ (X ⋙ Over.forget Y) n ≅
      vPull S Λ (X.obj (Opposite.op ⦋n⦌)).hom := sorry

/-- DiamondEtaleCohomology:C2/v-hyperdescent (ECD Proposition 17.3), on homotopy categories: for a
v-hypercover `Y_• → Y`, pullback `D(Y_v, Λ) → D(Y_•,v, Λ)` is fully faithful with essential image
the cartesian objects. Omitted: the 0-truncatedness of `Y_i → Y` (not typable against `Carriers`)
and the ∞-categorical statement for `𝒟(Y_v, Λ)`. -/
theorem vHyperdescent {Y : S.V} (X : SimplicialObject (Over Y)) (hX : IsVHypercover S X) :
    Nonempty (simpPull S Λ X).FullyFaithful ∧
      (simpPull S Λ X).essImage = IsCartesian S Λ (X ⋙ Over.forget Y) := sorry

/-! ## C2/etale-category-one-cutoff (ECD Remark 17.4) -/

/-- `κ` is adequate for `Y`: some v-hypercover of `Y` has κ-small terms. Omitted: the terms are
disjoint unions of strictly totally disconnected spaces and `κ` is a cutoff cardinal in the sense of
ECD §4 (neither is typable against `Carriers`). -/
def IsAdequateCutoff (κ : Cardinal.{u}) (Y : S.V) : Prop :=
  ∃ X : SimplicialObject (Over Y), IsVHypercover S X ∧ ∀ n : ℕ,
    ∃ U : (S.atCutoff κ).VOver Y, Nonempty (((S.atCutoff κ).vSrc Y).obj U ≅ X.obj (Opposite.op ⦋n⦌))

/-- DiamondEtaleCohomology:C2/etale-category-one-cutoff (ECD Remark 17.4): `D_ét(Y, Λ)` is the
category of cartesian objects of `D(Y_•,v, Λ)` with terms in `D_ét(Y_n, Λ)` (for a hypercover by
disjoint unions of strictly totally disconnected spaces these are `D(Y_n,ét, Λ)`; that hypothesis is
omitted, as the statement holds for every v-hypercover); and `D_ét(Y, Λ)` lies in `D(Y_v,κ, Λ)` for
every `κ` making the terms κ-small. Omitted: `κ` is a cutoff cardinal in the sense of ECD §4. -/
theorem etaleCategoryOneCutoff {Y : S.V} (X : SimplicialObject (Over Y)) (hX : IsVHypercover S X) :
    (∀ B : enhancedV.simplicial S Λ (X ⋙ Over.forget Y),
      (∃ A : DV S Λ Y, Det S Λ Y A ∧ Nonempty ((simpPull S Λ X).obj A ≅ B)) ↔
        IsCartesian S Λ (X ⋙ Over.forget Y) B ∧
          ∀ n : ℕ, Det S Λ _ ((simpRestrict S Λ (X ⋙ Over.forget Y) n).obj B)) ∧
    ∀ {κ κ' : Cardinal.{u}} (h : κ ≤ κ'), (∀ n : ℕ, ∃ U : (S.atCutoff κ).VOver Y,
        Nonempty (((S.atCutoff κ).vSrc Y).obj U ≅ X.obj (Opposite.op ⦋n⦌))) →
      ∀ A : DV (S.atCutoff κ') Λ Y, Det (S.atCutoff κ') Λ Y A →
        (enhancedV.transition S Λ h Y).essImage A := sorry

/-! ## C2/enhanced-etale-category (ECD Lemma 17.1) -/

/-- DiamondEtaleCohomology:C2/enhanced-etale-category (ECD Lemma 17.1), API `enhancedEt`:
`𝒟_ét(Y, Λ)`, recorded by its homotopy category `D_ét(Y, Λ)`. -/
abbrev enhancedEt (Y : S.V) := DetCat S Λ Y

/-- API `enhancedEt.presentable`, homotopy-level shadow: `D_ét(Y, Λ)` has small coproducts and is a
triangulated category. Presentability is ∞-categorical and omitted. -/
theorem enhancedEt.presentable (Y : S.V) :
    HasCoproducts.{u} (enhancedEt S Λ Y) ∧ IsTriangulated (enhancedEt S Λ Y) := sorry

/-- API `enhancedEt.closed_colimits`: `D_ét(Y, Λ)` is closed under small coproducts (and, being
triangulated, under cones) in `D(Y_v, Λ)`. -/
theorem enhancedEt.closed_colimits (Y : S.V) {J : Type u} (A : J → DV S Λ Y) [HasCoproduct A]
    (hA : ∀ j, Det S Λ Y (A j)) : Det S Λ Y (∐ A) := sorry

/-- API `enhancedEt.homotopy`: the homotopy category `D_ét(Y, Λ)` with its triangulated structure
induced from `D(Y_v, Λ)`. -/
abbrev enhancedEt.homotopy (Y : S.V) : Pretriangulated (enhancedEt S Λ Y) := inferInstance

/-- API `enhancedEt.cutoff_independent`: for `κ ≤ κ'` with `κ` adequate for `Y`, the transition
functor restricts to an equivalence between `D_ét(Y, Λ)` computed at `κ` and at `κ'` (it is fully
faithful by `enhancedV.transition_fullyFaithful`). -/
theorem enhancedEt.cutoff_independent {κ κ' : Cardinal.{u}} (h : κ ≤ κ') (Y : S.V)
    (hκ : IsAdequateCutoff S κ Y) :
    (∀ A, Det (S.atCutoff κ) Λ Y A → Det (S.atCutoff κ') Λ Y ((enhancedV.transition S Λ h Y).obj A)) ∧
      ∀ B, Det (S.atCutoff κ') Λ Y B →
        ∃ A, Det (S.atCutoff κ) Λ Y A ∧ Nonempty ((enhancedV.transition S Λ h Y).obj A ≅ B) := sorry

/-- API `enhancedEt.descent`, homotopy-level shadow of `𝒟_ét(Y, Λ) ≃ lim_{[n] ∈ Δ} 𝒟(Y_n,ét, Λ)`:
pullback restricted to `D_ét(Y, Λ)` is fully faithful onto the cartesian objects with étale terms.
Omitted: the terms are disjoint unions of strictly totally disconnected spaces. -/
theorem enhancedEt.descent {Y : S.V} (X : SimplicialObject (Over Y)) (hX : IsVHypercover S X) :
    Nonempty ((Det S Λ Y).ι ⋙ simpPull S Λ X).FullyFaithful ∧
      ((Det S Λ Y).ι ⋙ simpPull S Λ X).essImage = IsCartesian S Λ (X ⋙ Over.forget Y) ⊓
        (fun B => ∀ n : ℕ, Det S Λ _ ((simpRestrict S Λ (X ⋙ Over.forget Y) n).obj B)) := sorry

/-- test enhancedEt_std (compatibility): for strictly totally disconnected `X`,
`𝒟_ét(X, Λ) ≃ 𝒟(|X|, Λ)` (homotopy level). -/
example (X : S.Std) : (stdSpaceDet S Λ X).IsEquivalence := by sorry

/-- test enhancedEt_point (computation): for `Y = Spa(C, O_C)`, `𝒟_ét(Y, Λ) ≃ 𝒟(Λ)` (homotopy level). -/
example (X : S.Std) [Nonempty (S.pts.obj (stdV S X))] [Subsingleton (S.pts.obj (stdV S X))] :
    (rGamma S Λ (stdV S X)).IsEquivalence := by sorry

/-- test enhancedEt_empty (degenerate): for `Y = ∅`, `𝒟_ét(Y, Λ)` is zero. -/
example (Y : S.V) (hY : IsInitial Y) (A : enhancedEt S Λ Y) : IsZero A := by sorry

/-! ## C2/etale-coreflection (ECD Corollary 17.2) -/

/-- DiamondEtaleCohomology:C2/etale-coreflection (ECD Corollary 17.2), API `etaleCoreflection`: the right adjoint `R_Yét : D(Y_v, Λ) → D_ét(Y, Λ)`
of the inclusion (supplier data: the homotopy category of the right adjoints at adequate cutoffs). -/
def etaleCoreflection (Y : S.V) : DV S Λ Y ⥤ DetCat S Λ Y := sorry

/-- The adjunction `incl ⊣ R_Yét`. -/
def etaleCoreflection.adj (Y : S.V) : (Det S Λ Y).ι ⊣ etaleCoreflection S Λ Y := sorry

/-- `R_Yét` commutes with shifts, by the adjunction with the (triangulated) inclusion. -/
instance etaleCoreflection.commShift (Y : S.V) : (etaleCoreflection S Λ Y).CommShift ℤ :=
  (etaleCoreflection.adj S Λ Y).rightAdjointCommShift ℤ

/-- API `etaleCoreflection.counit_iso_of_mem`: for `A ∈ D_ét(Y, Λ)` the counit `R_Yét(A) → A` is an
isomorphism. -/
theorem etaleCoreflection.counit_iso_of_mem (Y : S.V) (A : DV S Λ Y) (hA : Det S Λ Y A) :
    IsIso ((etaleCoreflection.adj S Λ Y).counit.app A) := sorry

/-- API `etaleCoreflection.exact`: `R_Yét` is exact (triangulated) and commutes with all limits. -/
theorem etaleCoreflection.exact (Y : S.V) :
    (etaleCoreflection S Λ Y).IsTriangulated ∧ PreservesLimitsOfSize.{u, u} (etaleCoreflection S Λ Y) :=
  sorry

/-- API `etaleCoreflection.cutoff`: `R_Yét` computed at `κ` and at `κ' ≥ κ` agree on `D(Y_v,κ, Λ)`
(for `κ` adequate for `Y`). -/
theorem etaleCoreflection.cutoff {κ κ' : Cardinal.{u}} (h : κ ≤ κ') (Y : S.V)
    (hκ : IsAdequateCutoff S κ Y) :
    Nonempty (etaleCoreflection (S.atCutoff κ) Λ Y ⋙ (Det (S.atCutoff κ) Λ Y).ι ⋙
        enhancedV.transition S Λ h Y ≅
      enhancedV.transition S Λ h Y ⋙ etaleCoreflection (S.atCutoff κ') Λ Y ⋙
        (Det (S.atCutoff κ') Λ Y).ι) := sorry

/-- The derived pushforward `R(ν ∘ λ)_* : D(Y_v, Λ) → D(Y_ét, Λ)` along the map of sites
`Y_v → Y_ét` (supplier data, C0/comparison-morphisms), right adjoint to `etEmb`. -/
def vToEtPush (Y : S.LS) : DV S Λ (S.ofLS Y) ⥤ DEt S Λ Y := sorry
def vToEtAdj (Y : S.LS) : etEmb S Λ Y ⊣ vToEtPush S Λ Y := sorry

/-- API `etaleCoreflection.bounded_formula`: for locally spatial `Y`, `R_Yét = R(ν ∘ λ)_*` on
`D⁺(Y_v, Λ)`. -/
theorem etaleCoreflection.bounded_formula (Y : S.LS) (A : DV S Λ (S.ofLS Y))
    (hA : DerivedCategory.TStructure.t.plus A) :
    Nonempty ((etaleCoreflection S Λ (S.ofLS Y)).obj A ≅ (etEmbDet S Λ Y).obj ((vToEtPush S Λ Y).obj A)) :=
  sorry

/-- test enhancedEt_not_all_sheaves (non-example): limits in `D_ét(Y, Λ)` are computed with the
coreflection, `∏^{ét} A_j = R_Yét(∏ A_j)`. That `D_ét(Y, Λ)` is not closed under limits in
`D(Y_v,κ, Λ)` "in general" is an existence statement without a carrier object and is omitted. -/
example (Y : S.V) {J : Type u} (A : J → DetCat S Λ Y) [HasProduct fun j => (A j).obj]
    [HasProduct A] :
    Nonempty ((etaleCoreflection S Λ Y).obj (∏ᶜ fun j => (A j).obj) ≅ ∏ᶜ A) := by sorry

/-- `RΓ(Y_v, −) : D(Y_v, Λ) → D(Λ)` (supplier data). -/
def rGammaV (Y : S.V) : DV S Λ Y ⥤ DerivedCategory (ModuleCat.{u} Λ) := sorry

/-- test etaleCoreflection_on_etale (degenerate): `R_Yét(A) ≅ A` for `A ∈ D_ét(Y, Λ)`. -/
example (Y : S.V) (A : DetCat S Λ Y) : Nonempty ((etaleCoreflection S Λ Y).obj A.obj ≅ A) := by
  sorry

/-- test etaleCoreflection_point (computation): for `Y = Spa(C, O_C)`, `R_Yét(A)` is the constant
complex `RΓ(Y_v, A)` (under `RΓ : D_ét(Y, Λ) ≃ D(Λ)`). -/
example (X : S.Std) [Nonempty (S.pts.obj (stdV S X))] [Subsingleton (S.pts.obj (stdV S X))] :
    Nonempty (etaleCoreflection S Λ (stdV S X) ⋙ rGamma S Λ (stdV S X) ≅ rGammaV S Λ (stdV S X)) := by
  sorry

/-- test etaleCoreflection_std (compatibility): for strictly totally disconnected `Y`,
`R_Yét = R(ν ∘ λ)_*` on all of `D(Y_v, Λ)`. -/
example (X : S.Std) (A : DV S Λ (stdV S X)) :
    Nonempty ((etaleCoreflection S Λ (stdV S X)).obj A ≅
      (etEmbDet S Λ (S.ofStd X)).obj ((vToEtPush S Λ (S.ofStd X)).obj A)) := by sorry

/-- test etaleCoreflection_not_identity (non-example): for `Y = Spa(C, O_C)` and the v-sheaf
`S ↦ C(|S|, Λ)` (packet: `Λ = Z_p`; here a first countable non-discrete profinite ring),
`R_Yét` of it is `Λ[0]`, which differs from the sheaf itself (the sheaf is not in `D_ét`). -/
example [TopologicalSpace Λ] [CompactSpace Λ] [T2Space Λ] [TotallyDisconnectedSpace Λ]
    [FirstCountableTopology Λ] (hΛ : ¬ DiscreteTopology Λ)
    (X : S.Std) [Nonempty (S.pts.obj (stdV S X))] [Subsingleton (S.pts.obj (stdV S X))] :
    Nonempty ((etaleCoreflection S Λ (stdV S X)).obj
        ((DerivedCategory.singleFunctor _ 0).obj (contSheaf S Λ (stdV S X) Λ)) ≅
      unitObj S Λ (stdV S X)) ∧
    ¬ Det S Λ (stdV S X) ((DerivedCategory.singleFunctor _ 0).obj (contSheaf S Λ (stdV S X) Λ)) := by
  sorry

/-! ## C2/etale-coreflection-bounded-formula (ECD after Corollary 17.2) -/

/-- DiamondEtaleCohomology:C2/etale-coreflection-bounded-formula: for a locally spatial diamond `Y`,
`R_Yét = R(ν ∘ λ)_*` (followed by `D⁺(Y_ét, Λ) ⊂ D_ét(Y, Λ)`) on `D⁺(Y_v, Λ)`; for strictly totally
disconnected `Y` on all of `D(Y_v, Λ)`. -/
theorem etaleCoreflectionBoundedFormula :
    (∀ (Y : S.LS) (A : DV S Λ (S.ofLS Y)), DerivedCategory.TStructure.t.plus A →
      Nonempty ((etaleCoreflection S Λ (S.ofLS Y)).obj A ≅
        (etEmbDet S Λ Y).obj ((vToEtPush S Λ Y).obj A))) ∧
    ∀ (X : S.Std) (A : DV S Λ (stdV S X)),
      Nonempty ((etaleCoreflection S Λ (stdV S X)).obj A ≅
        (etEmbDet S Λ (S.ofStd X)).obj ((vToEtPush S Λ (S.ofStd X)).obj A)) := sorry

/-! ## Constant objects of `D_ét` -/

/-- Constant sheaves lie in `D_ét`. -/
theorem vConst_mem (Y : S.V) (M : ModuleCat.{u} Λ) :
    Det S Λ Y ((DerivedCategory.singleFunctor _ 0).obj (vConst S Λ Y M)) := sorry

/-- The constant sheaf with value `M`, in degree `0`, as an object of `D_ét(Y, Λ)`. -/
def constObj (Y : S.V) (M : ModuleCat.{u} Λ) : DetCat S Λ Y :=
  ⟨(DerivedCategory.singleFunctor _ 0).obj (vConst S Λ Y M), vConst_mem S Λ Y M⟩

/-- The unit `Λ_Y` of p00 is the constant sheaf `Λ` (supplier data). -/
def unitObj_iso (Y : S.V) : unitObj S Λ Y ≅ constObj S Λ Y (ModuleCat.of Λ Λ) := sorry

/-- The map of small v-stacks underlying a map of strictly totally disconnected spaces. -/
abbrev stdMap {X' X : S.Std} (f : X' ⟶ X) : stdV S X' ⟶ stdV S X := lsMap S (S.stdLS.map f)

/-- `D⁺(Y_ét, Λ)` as an object property of `D(Y_ét, Λ)`. -/
abbrev etPlus (Y : S.LS) : ObjectProperty (DEt S Λ Y) := DerivedCategory.TStructure.t.plus

/-! ## C3/pullback (ECD §17, the construction before Lemma 17.5) -/

/-- API `pull_comp`: `(f ∘ g)^* ≃ g^* ∘ f^*`, written diagrammatically (supplier data). -/
def pull_comp {Z Y X : S.V} (g : Z ⟶ Y) (f : Y ⟶ X) :
    pull S Λ (g ≫ f) ≅ pull S Λ f ⋙ pull S Λ g := sorry

/-- API `pull_id`: `(𝟙 Y)^* ≅ 𝟭` (supplier data). -/
def pull_id (Y : S.V) : pull S Λ (𝟙 Y) ≅ 𝟭 _ := sorry

/-- `pull_comp` is coherently associative. -/
theorem pull_comp_assoc {W Z Y X : S.V} (h : W ⟶ Z) (g : Z ⟶ Y) (f : Y ⟶ X) :
    (pull_comp S Λ h (g ≫ f)).hom ≫ Functor.whiskerRight (pull_comp S Λ g f).hom (pull S Λ h) =
      eqToHom (by rw [Category.assoc]) ≫ (pull_comp S Λ (h ≫ g) f).hom ≫
        Functor.whiskerLeft (pull S Λ f) (pull_comp S Λ h g).hom := sorry

/-- API `pull_zeroTruncated`: `f^*` on `D_ét` is the restriction of the v-pullback `f_v^*`
(supplier data). With p00's `vPull` (the pullback of the morphism of sites for 0-truncated `f`,
through a Čech nerve in general) this holds for every `f`, so the 0-truncatedness hypothesis is not
needed in the statement. -/
def pull_zeroTruncated {Y' Y : S.V} (f : Y' ⟶ Y) :
    pull S Λ f ⋙ (Det S Λ Y').ι ≅ (Det S Λ Y).ι ⋙ vPull S Λ f := sorry

/-- API `pull_locallySpatial`: for a map of locally spatial diamonds, `f^*` restricted to the image
of `D(Y_ét, Λ)` (in particular to `D⁺_ét = D⁺(−_ét)`) is `f_ét^*` (supplier data). -/
def pull_locallySpatial {Y' Y : S.LS} (f : Y' ⟶ Y) :
    etEmbDet S Λ Y ⋙ pull S Λ (lsMap S f) ≅ etPullDer S Λ f ⋙ etEmbDet S Λ Y' := sorry

/-- API `pull_tStructure`: `f^*` is t-exact. -/
theorem pull_tStructure {Y' Y : S.V} (f : Y' ⟶ Y) (A : DetCat S Λ Y) (n : ℤ) :
    (DerivedCategory.TStructure.t.IsGE A.obj n →
        DerivedCategory.TStructure.t.IsGE ((pull S Λ f).obj A).obj n) ∧
      (DerivedCategory.TStructure.t.IsLE A.obj n →
        DerivedCategory.TStructure.t.IsLE ((pull S Λ f).obj A).obj n) := sorry

/-- API `pull_colimits`: `f^*` preserves all small colimits (it is a left adjoint). -/
theorem pull_colimits {Y' Y : S.V} (f : Y' ⟶ Y) : PreservesColimitsOfSize.{u, u} (pull S Λ f) :=
  sorry

/-- `f^*` commutes with shifts (supplier data). -/
instance pull.commShift {Y' Y : S.V} (f : Y' ⟶ Y) : (pull S Λ f).CommShift ℤ := sorry

/-- `f^*` is exact (triangulated). -/
theorem pull_isTriangulated {Y' Y : S.V} (f : Y' ⟶ Y) : (pull S Λ f).IsTriangulated := sorry

/-- The derived pullback of sheaves of Λ-modules along a continuous map (supplier data). -/
def spaceDPull {X Y : TopCat.{u}} (φ : X ⟶ Y) :
    DerivedCategory (TopCat.Sheaf (ModuleCat.{u} Λ) Y) ⥤ DerivedCategory (TopCat.Sheaf (ModuleCat.{u} Λ) X) :=
  sorry

/-- A small v-stack `Spd k` for a discrete field `k` (supplier data, DiamondsAndVStacks). -/
def spdDisc (k : Type u) [Field k] : S.V := sorry

/-- The classifying stack `[∗/G]` of a group over `∗ = Spd k` and its point `∗ → [∗/G]`
(supplier data, DiamondsAndVStacks D4). -/
def classifyingStack (k : Type u) [Field k] (G : Type u) [Group G] : S.V := sorry
def classifyingPoint (k : Type u) [Field k] (G : Type u) [Group G] :
    spdDisc S k ⟶ classifyingStack S k G := sorry

/-- test pull_id_test (degenerate): `pull (𝟙 Y) A ≅ A`. -/
example (Y : S.V) (A : DetCat S Λ Y) : Nonempty ((pull S Λ (𝟙 Y)).obj A ≅ A) := by sorry

/-- test pull_constant (computation): `f^*` carries the constant sheaf `Λ_Y` to `Λ_{Y'}`. -/
example {Y' Y : S.V} (f : Y' ⟶ Y) : Nonempty ((pull S Λ f).obj (unitObj S Λ Y) ≅ unitObj S Λ Y') := by
  sorry

/-- test pull_std_compat (compatibility): for `f : X' → X` strictly totally disconnected, `f^*`
corresponds to the derived pullback of sheaves on `|X|` along `|f|` under `D_ét = D(|−|, Λ)`. -/
example {X' X : S.Std} (f : X' ⟶ X) :
    Nonempty (stdSpaceDet S Λ X ⋙ pull S Λ (stdMap S f) ≅
      spaceDPull Λ (S.pts.map (stdMap S f)) ⋙ stdSpaceDet S Λ X') := by sorry

/-- test pull_comp_order (characterisation): for `g : Z → Y` and `f : Y → X`,
`(f ∘ g)^* ≃ g^* ∘ f^*`, i.e. `pull (g ≫ f) ≅ pull f ⋙ pull g` (the other order does not typecheck). -/
example {Z Y X : S.V} (g : Z ⟶ Y) (f : Y ⟶ X) :
    Nonempty (pull S Λ (g ≫ f) ≅ pull S Λ f ⋙ pull S Λ g) := by sorry

/-- test pull_classifying_stack (computation): for a finite group `G ≠ 1`, `∗ = Spd F̄_p` (here
`Spd k`, `k` algebraically closed of characteristic `p`) and `f : ∗ → [∗/G]`, `f^*` is the forgetful
functor `D(Λ[G]) → D(Λ)`, which is not fully faithful (for `Λ ≠ 0`). The identification
`D_ét([∗/G], Λ) ≃ D(Λ[G])` is not stated. -/
example (k : Type u) [Field k] [IsAlgClosed k] [CharP k S.p] (G : Type u) [Group G] [Finite G]
    [Nontrivial G] [Nontrivial Λ] :
    IsEmpty (pull S Λ (classifyingPoint S k G)).FullyFaithful := by sorry

/-! ## C3/pushforward (ECD Lemma 17.5) -/

/-- `Rf_*` commutes with shifts (by adjunction with `f^*`). -/
instance push.commShift {Y' Y : S.V} (f : Y' ⟶ Y) : (push S Λ f).CommShift ℤ :=
  (pullPushAdj S Λ f).rightAdjointCommShift ℤ

/-- API `push_comp`: `R(f ∘ g)_* ≃ Rf_* ∘ Rg_*`, the mate of `pull_comp`. -/
def push_comp {Z Y X : S.V} (g : Z ⟶ Y) (f : Y ⟶ X) :
    push S Λ (g ≫ f) ≅ push S Λ g ⋙ push S Λ f :=
  ((pullPushAdj S Λ (g ≫ f)).ofNatIsoLeft (pull_comp S Λ g f)).rightAdjointUniq
    ((pullPushAdj S Λ f).comp (pullPushAdj S Λ g))

/-- API `push_id`: `R(𝟙 Y)_* ≅ 𝟭`, the mate of `pull_id`. -/
def push_id (Y : S.V) : push S Λ (𝟙 Y) ≅ 𝟭 _ :=
  ((pullPushAdj S Λ (𝟙 Y)).ofNatIsoLeft (pull_id S Λ Y)).rightAdjointUniq Adjunction.id

/-- API `push_limits`: `Rf_*` is exact and preserves all limits. -/
theorem push_limits {Y' Y : S.V} (f : Y' ⟶ Y) :
    (push S Λ f).IsTriangulated ∧ PreservesLimitsOfSize.{u, u} (push S Λ f) := sorry

/-- API `push_globalSections`: for `f : Y → ∗` (the terminal small v-stack), `Rf_*` computes Hom in
`D_ét`: `Hom(Λ_Y, A[i]) = Hom(Λ_∗, (Rf_* A)[i])` (supplier data; it is the adjunction combined with
`f^* Λ_∗ ≅ Λ_Y`). -/
def push_globalSections (Y : S.V) (A : DetCat S Λ Y) (i : ℤ) :
    (unitObj S Λ Y ⟶ A⟦i⟧) ≃+
      (unitObj S Λ (⊤_ S.V) ⟶ ((push S Λ (terminal.from Y)).obj A)⟦i⟧) := sorry

/-- API `push_eq_coreflection`: `Rf_* = R_Yét ∘ Rf_v*` (supplier data; node
pushforward-via-coreflection). -/
def push_eq_coreflection {Y' Y : S.V} (f : Y' ⟶ Y) :
    push S Λ f ≅ (Det S Λ Y').ι ⋙ vPush S Λ f ⋙ etaleCoreflection S Λ Y := sorry

/-- API `push_locallySpatial`: for locally spatial `Y', Y`, `Rf_* = Rf_ét*` on
`D⁺_ét(Y', Λ) = D⁺(Y'_ét, Λ)` (supplier data; node pushforward-locally-spatial). -/
def push_locallySpatial {Y' Y : S.LS} (f : Y' ⟶ Y) :
    (etPlus S Λ Y').ι ⋙ etEmbDet S Λ Y' ⋙ push S Λ (lsMap S f) ≅
      (etPlus S Λ Y').ι ⋙ etPushDer S Λ f ⋙ etEmbDet S Λ Y := sorry

/-- The product `Y × T` of a small v-stack with a profinite set and its projection (supplier data,
PerfectoidSpaces P6/product-with-profinite-set). -/
def profiniteProduct (Y : S.V) (T : Type u) [TopologicalSpace T] [CompactSpace T] [T2Space T]
    [TotallyDisconnectedSpace T] : S.V := sorry
def profiniteProj (Y : S.V) (T : Type u) [TopologicalSpace T] [CompactSpace T] [T2Space T]
    [TotallyDisconnectedSpace T] : profiniteProduct S Y T ⟶ Y := sorry

/-- test push_id_test (degenerate): `R(𝟙 Y)_* A ≅ A`. -/
example (Y : S.V) (A : DetCat S Λ Y) : Nonempty ((push S Λ (𝟙 Y)).obj A ≅ A) := by sorry

/-- test push_point (computation): for `f : Spa(C, O_C) × T → Spa(C, O_C)` with `T` profinite and
a Λ-module `M`, `Rf_* M` is the module `C(T, M)` of locally constant functions, in degree `0`. -/
example (X : S.Std) [Nonempty (S.pts.obj (stdV S X))] [Subsingleton (S.pts.obj (stdV S X))]
    (T : Type u) [TopologicalSpace T] [CompactSpace T] [T2Space T] [TotallyDisconnectedSpace T]
    (M : ModuleCat.{u} Λ) :
    Nonempty ((push S Λ (profiniteProj S (stdV S X) T)).obj (constObj S Λ _ M) ≅
      constObj S Λ (stdV S X) (ModuleCat.of Λ (LocallyConstant T M))) := by sorry

/-- test push_adjunction (characterisation): `Hom(f^*B, A) ≅ Hom(B, Rf_* A)`, naturally. -/
example {Y' Y : S.V} (f : Y' ⟶ Y) (B : DetCat S Λ Y) (A : DetCat S Λ Y') :
    ((pull S Λ f).obj B ⟶ A) ≃ (B ⟶ (push S Λ f).obj A) :=
  (pullPushAdj S Λ f).homEquiv B A

/-- test push_not_v_pushforward (non-example): `Rf_*` takes values in `D_ét` while `Rf_v*` need not
(that "in general" failure has no carrier object and is omitted); they agree on `D⁺_ét` for qcqs `f`
with `nΛ = 0`, `n` prime to `p`. -/
example (n : ℕ) (hn : Nat.Coprime n S.p) (hΛ : (n : Λ) = 0) {Y' Y : S.V} (f : Y' ⟶ Y)
    (hqc : IsQuasicompactMap S f) (hqs : IsQuasiseparatedMap S f) (A : DetCat S Λ Y')
    (hA : DerivedCategory.TStructure.t.plus A.obj) :
    Nonempty (((push S Λ f).obj A).obj ≅ (vPush S Λ f).obj A.obj) := by sorry

/-! ## C3/pushforward-via-coreflection, C3/pushforward-locally-spatial -/

/-- DiamondEtaleCohomology:C3/pushforward-via-coreflection (ECD §17, after Lemma 17.5):
`Rf_* = R_Yét ∘ Rf_v*` on `D_ét(Y', Λ)`. -/
theorem pushforwardViaCoreflection {Y' Y : S.V} (f : Y' ⟶ Y) :
    Nonempty (push S Λ f ≅ (Det S Λ Y').ι ⋙ vPush S Λ f ⋙ etaleCoreflection S Λ Y) := sorry

/-- DiamondEtaleCohomology:C3/pushforward-locally-spatial: for a map of locally spatial diamonds,
`Rf_* = Rf_ét*` on `D⁺_ét(Y', Λ) = D⁺(Y'_ét, Λ)`. The left-completed formula
`Rf_*(R lim A_n) = R lim Rf_ét* A_n` needs homotopy limits, which Mathlib's `DerivedCategory` lacks;
it is omitted. -/
theorem pushforwardLocallySpatial {Y' Y : S.LS} (f : Y' ⟶ Y) (B : DEt S Λ Y')
    (hB : DerivedCategory.TStructure.t.plus B) :
    Nonempty ((push S Λ (lsMap S f)).obj ((etEmbDet S Λ Y').obj B) ≅
      (etEmbDet S Λ Y).obj ((etPushDer S Λ f).obj B)) := sorry

/-! ## C3/qcqs-base-change-bounded, C3/qcqs-base-change-finite-cd (ECD Proposition 17.6) -/

/-- The base change transformation `g^* Rf_* → Rf̃_* g'^*` for a commutative square
`g' ≫ f = f̃ ≫ g`: the mate of `f̃^* g^* ≅ (g ∘ f̃)^* = (f ∘ g')^* ≅ g'^* f^*`. -/
def pushBaseChangeOf {Y' Y Yt Yt' : S.V} {f : Y' ⟶ Y} {g : Yt ⟶ Y} {f' : Yt' ⟶ Yt} {g' : Yt' ⟶ Y'}
    (w : g' ≫ f = f' ≫ g) : push S Λ f ⋙ pull S Λ g ⟶ pull S Λ g' ⋙ push S Λ f' :=
  mateEquiv (pullPushAdj S Λ f) (pullPushAdj S Λ f')
    ((pull_comp S Λ f' g).inv ≫ eqToHom (congrArg (pull S Λ) w.symm) ≫ (pull_comp S Λ g' f).hom)

/-- The base change transformation for the cartesian square `Y' ×_Y Yt`. -/
def pushBaseChange {Y' Y Yt : S.V} (f : Y' ⟶ Y) (g : Yt ⟶ Y) :
    push S Λ f ⋙ pull S Λ g ⟶ pull S Λ (pullback.fst f g) ⋙ push S Λ (pullback.snd f g) :=
  pushBaseChangeOf S Λ pullback.condition

/-- DiamondEtaleCohomology:C3/qcqs-base-change-bounded (ECD Proposition 17.6 (i)): with `nΛ = 0`,
`n` prime to `p`, and `f` qcqs: for `A ∈ D⁺_ét(Y', Λ)`, `Rf_v* A ∈ D⁺_ét(Y, Λ)`, hence
`Rf_* A = Rf_v* A`; and `Rf_*` commutes with every base change on `D⁺_ét`. -/
theorem qcqsBaseChangeBounded (n : ℕ) (hn : Nat.Coprime n S.p) (hΛ : (n : Λ) = 0) {Y' Y : S.V}
    (f : Y' ⟶ Y) (hqc : IsQuasicompactMap S f) (hqs : IsQuasiseparatedMap S f) :
    (∀ A : DetCat S Λ Y', DerivedCategory.TStructure.t.plus A.obj →
      Det S Λ Y ((vPush S Λ f).obj A.obj) ∧
        DerivedCategory.TStructure.t.plus ((vPush S Λ f).obj A.obj) ∧
        Nonempty (((push S Λ f).obj A).obj ≅ (vPush S Λ f).obj A.obj)) ∧
    ∀ {Yt : S.V} (g : Yt ⟶ Y) (A : DetCat S Λ Y'), DerivedCategory.TStructure.t.plus A.obj →
      IsIso ((pushBaseChange S Λ f g).app A) := sorry

/-- DiamondEtaleCohomology:C3/qcqs-base-change-finite-cd (ECD Proposition 17.6 (ii)): if moreover
`Rf_*` has finite cohomological dimension `N` on sheaves, then `Rf_* A = Rf_v* A ∈ D_ét(Y, Λ)` and
base change holds for all `A ∈ D_ét(Y', Λ)` (no hypothesis on `Rf̃_*`). -/
theorem qcqsBaseChangeFiniteCd (n : ℕ) (hn : Nat.Coprime n S.p) (hΛ : (n : Λ) = 0) {Y' Y : S.V}
    (f : Y' ⟶ Y) (hqc : IsQuasicompactMap S f) (hqs : IsQuasiseparatedMap S f) (N : ℕ)
    (hN : ∀ A : DetCat S Λ Y', DerivedCategory.TStructure.t.IsLE A.obj 0 →
      DerivedCategory.TStructure.t.IsGE A.obj 0 → ∀ i : ℤ, (N : ℤ) < i →
        IsZero ((DerivedCategory.homologyFunctor _ i).obj ((push S Λ f).obj A).obj)) :
    (∀ A : DetCat S Λ Y', Nonempty (((push S Λ f).obj A).obj ≅ (vPush S Λ f).obj A.obj)) ∧
    ∀ {Yt : S.V} (g : Yt ⟶ Y) (A : DetCat S Λ Y'), IsIso ((pushBaseChange S Λ f g).app A) := sorry

/-! ## Supplier data on `D(Λ)` and on spaces -/

/-- The derived tensor product and derived Hom of `D(Λ)` (supplier data; Mathlib has no derived
tensor product on `DerivedCategory (ModuleCat Λ)`). -/
def moduleDTensor : DerivedCategory (ModuleCat.{u} Λ) ⥤ DerivedCategory (ModuleCat.{u} Λ) ⥤
    DerivedCategory (ModuleCat.{u} Λ) := sorry
def moduleDHom : (DerivedCategory (ModuleCat.{u} Λ))ᵒᵖ ⥤ DerivedCategory (ModuleCat.{u} Λ) ⥤
    DerivedCategory (ModuleCat.{u} Λ) := sorry

/-- The derived tensor product on `D(|X|, Λ)` for a topological space (supplier data). -/
def spaceDTensor (X : TopCat.{u}) : DerivedCategory (TopCat.Sheaf (ModuleCat.{u} Λ) X) ⥤
    DerivedCategory (TopCat.Sheaf (ModuleCat.{u} Λ) X) ⥤
      DerivedCategory (TopCat.Sheaf (ModuleCat.{u} Λ) X) := sorry

/-- The constant-sheaf functor `D(Λ) → D(Y_v, Λ)` (supplier data). -/
def constD (Y : S.V) : DerivedCategory (ModuleCat.{u} Λ) ⥤ DV S Λ Y := sorry

/-- The open sub-v-stack of `Y` attached to an open subset `W ⊆ |Y|` (ECD Proposition 12.9), as an
étale map (supplier data); `openSub_spec` records that it is an open embedding onto `W`. -/
def openSub (Y : S.V) (W : TopologicalSpace.Opens (S.pts.obj Y)) : S.EtVOver Y := sorry

theorem openSub_spec (Y : S.V) (W : TopologicalSpace.Opens (S.pts.obj Y)) :
    IsOpenEmbedding (S.pts.map ((S.etVSrc Y).obj (openSub S Y W)).hom) ∧
      Set.range (S.pts.map ((S.etVSrc Y).obj (openSub S Y W)).hom) = (W : Set (S.pts.obj Y)) ∧
      Mono ((S.etVSrc Y).obj (openSub S Y W)).hom := sorry

/-- The open sub-v-stack `U` and its inclusion `j : U → Y`. -/
abbrev openSubV (Y : S.V) (W : TopologicalSpace.Opens (S.pts.obj Y)) : S.V :=
  ((S.etVSrc Y).obj (openSub S Y W)).left
abbrev openSubIncl (Y : S.V) (W : TopologicalSpace.Opens (S.pts.obj Y)) : openSubV S Y W ⟶ Y :=
  ((S.etVSrc Y).obj (openSub S Y W)).hom

/-! ## C3/v-derived-tensor (ECD §17) -/

/-- DiamondEtaleCohomology:C3/v-derived-tensor (ECD §17), API `vTensor`: the derived tensor product `⊗^L_Λ` on `D(Y_v, Λ)`
(supplier data, EnhancedDerivedSheaves E1). -/
def vTensor (Y : S.V) : DV S Λ Y ⥤ DV S Λ Y ⥤ DV S Λ Y := sorry

/-- The monoidal structure on `D(Y_v, Λ)` with tensor `vTensor` and unit the constant sheaf `Λ`
(associator, unitors and coherence are supplier data). -/
abbrev vTensor.monoidal (Y : S.V) : MonoidalCategory (DV S Λ Y) where
  tensorObj A B := ((vTensor S Λ Y).obj A).obj B
  whiskerLeft A _ _ g := ((vTensor S Λ Y).obj A).map g
  whiskerRight f B := ((vTensor S Λ Y).map f).app B
  tensorHom f g := ((vTensor S Λ Y).map f).app _ ≫ ((vTensor S Λ Y).obj _).map g
  tensorUnit := vUnit S Λ Y
  associator := sorry
  leftUnitor := sorry
  rightUnitor := sorry
  tensorHom_def := sorry
  id_tensorHom_id := sorry
  tensorHom_comp_tensorHom := sorry
  whiskerLeft_id := sorry
  id_whiskerRight := sorry
  associator_naturality := sorry
  leftUnitor_naturality := sorry
  rightUnitor_naturality := sorry
  pentagon := sorry
  triangle := sorry

/-- API `vTensor.symmetricMonoidal`: the symmetric monoidal structure (homotopy-level shadow of
"presentably symmetric monoidal"; presentability and colimit preservation in the ∞-sense are
omitted; supplier data). -/
abbrev vTensor.symmetricMonoidal (Y : S.V) :
    letI := vTensor.monoidal S Λ Y
    SymmetricCategory (DV S Λ Y) := sorry

/-- API `vTensor.pull`: `f^*(A ⊗^L B) ≃ f^*A ⊗^L f^*B`, naturally in `A, B` (supplier data). -/
def vTensor.pull {Y' Y : S.V} (f : Y' ⟶ Y) :
    vTensor S Λ Y ⋙ (Functor.whiskeringRight _ _ _).obj (vPull S Λ f) ≅
      vPull S Λ f ⋙ vTensor S Λ Y' ⋙ (Functor.whiskeringLeft _ _ _).obj (vPull S Λ f) := sorry

/-- The (sheafified) tensor product of sheaves of Λ-modules on `Y_v` (supplier data). -/
def vShTensor (Y : S.V) : VSh S Λ Y ⥤ VSh S Λ Y ⥤ VSh S Λ Y := sorry

/-- API `vTensor.cohomology_flat`: if `B` is a flat sheaf of Λ-modules (`− ⊗ B` is exact), then
`H^i(A ⊗^L B) = H^i(A) ⊗ B`. -/
theorem vTensor.cohomology_flat (Y : S.V) (B : VSh S Λ Y)
    (hB : PreservesFiniteLimits ((vShTensor S Λ Y).flip.obj B)) (A : DV S Λ Y) (i : ℤ) :
    Nonempty ((DerivedCategory.homologyFunctor _ i).obj
        (((vTensor S Λ Y).obj A).obj ((DerivedCategory.singleFunctor _ 0).obj B)) ≅
      ((vShTensor S Λ Y).obj ((DerivedCategory.homologyFunctor _ i).obj A)).obj B) := sorry

/-- test vTensor_unit (degenerate): `Λ ⊗^L A ≃ A`. -/
example (Y : S.V) (A : DV S Λ Y) : Nonempty (((vTensor S Λ Y).obj (vUnit S Λ Y)).obj A ≅ A) := by
  sorry

/-- test vTensor_constant (computation): `const M ⊗^L const N = const (M ⊗^L_Λ N)`. -/
example (Y : S.V) (M N : ModuleCat.{u} Λ) :
    Nonempty (((vTensor S Λ Y).obj ((DerivedCategory.singleFunctor _ 0).obj (vConst S Λ Y M))).obj
        ((DerivedCategory.singleFunctor _ 0).obj (vConst S Λ Y N)) ≅
      (constD S Λ Y).obj (((moduleDTensor Λ).obj ((DerivedCategory.singleFunctor _ 0).obj M)).obj
        ((DerivedCategory.singleFunctor _ 0).obj N))) := by sorry

/-- test vTensor_pull (compatibility): for `f : X' → X` strictly totally disconnected,
`f^*(A ⊗^L B) ≃ f^*A ⊗^L f^*B` (its agreement with the tensor product of sheaves on `|X'|` is
`etTensor_std`). -/
example {X' X : S.Std} (f : X' ⟶ X) (A B : DV S Λ (stdV S X)) :
    Nonempty ((vPull S Λ (stdMap S f)).obj (((vTensor S Λ _).obj A).obj B) ≅
      ((vTensor S Λ _).obj ((vPull S Λ (stdMap S f)).obj A)).obj ((vPull S Λ (stdMap S f)).obj B)) := by
  sorry

/-- test vTensor_not_exact (non-example): `H^{-1}(Λ/a ⊗^L Λ/a) = Tor_1(Λ/a, Λ/a) = Λ/a ≠ 0` for a
regular non-unit `a` (packet: `Λ = Z`, `a = p`), on a nonempty strictly totally disconnected `X`. -/
example (a : Λ) (ha : IsSMulRegular Λ a) (hu : ¬ IsUnit a) (X : S.Std)
    [Nonempty (S.pts.obj (stdV S X))] :
    ¬ IsZero ((DerivedCategory.homologyFunctor _ (-1)).obj
      (((vTensor S Λ (stdV S X)).obj ((DerivedCategory.singleFunctor _ 0).obj
        (vConst S Λ _ (ModuleCat.of Λ (Λ ⧸ Ideal.span {a}))))).obj
        ((DerivedCategory.singleFunctor _ 0).obj (vConst S Λ _ (ModuleCat.of Λ (Λ ⧸ Ideal.span {a})))))) := by
  sorry

/-! ## C3/etale-tensor (ECD Lemma 17.7) -/

/-- API `etTensor.incl`: the inclusion `D_ét(Y, Λ) → D(Y_v, Λ)` is monoidal (supplier data). -/
def etTensor.incl (Y : S.V) :
    etTensor S Λ Y ⋙ (Functor.whiskeringRight _ _ _).obj (Det S Λ Y).ι ≅
      (Det S Λ Y).ι ⋙ vTensor S Λ Y ⋙ (Functor.whiskeringLeft _ _ _).obj (Det S Λ Y).ι := sorry
def etTensor.inclUnit (Y : S.V) : (unitObj S Λ Y).obj ≅ vUnit S Λ Y := sorry

/-- API `etTensor.pull`: `f^*` is monoidal, `f^*(A ⊗^L B) ≃ f^*A ⊗^L f^*B` (supplier data). -/
def etTensor.pull {Y' Y : S.V} (f : Y' ⟶ Y) :
    etTensor S Λ Y ⋙ (Functor.whiskeringRight _ _ _).obj (pull S Λ f) ≅
      pull S Λ f ⋙ etTensor S Λ Y' ⋙ (Functor.whiskeringLeft _ _ _).obj (pull S Λ f) := sorry

/-- API `etTensor.colimits`: `⊗^L` preserves colimits separately in each variable. -/
theorem etTensor.colimits (Y : S.V) (A : DetCat S Λ Y) :
    PreservesColimitsOfSize.{u, u} ((etTensor S Λ Y).obj A) ∧
      PreservesColimitsOfSize.{u, u} ((etTensor S Λ Y).flip.obj A) := sorry

/-- API `etTensor.stalk`: for a geometric point `x : Spa(C, C⁺) → Y` (a map from a connected
strictly totally disconnected space), `(A ⊗^L B)_x = A_x ⊗^L_Λ B_x`, with the geometric stalk
`A_x = RΓ(Spa(C, C⁺), x^*A)`. Stated for all small v-stacks `Y` (the packet takes `Y` locally
spatial). -/
theorem etTensor.stalk {Y : S.V} (X : S.Std) [ConnectedSpace (S.pts.obj (stdV S X))]
    (x : stdV S X ⟶ Y) (A B : DetCat S Λ Y) :
    Nonempty ((rGamma S Λ _).obj ((DiamondEtale.pull S Λ x).obj (((etTensor S Λ Y).obj A).obj B)) ≅
      ((moduleDTensor Λ).obj ((rGamma S Λ _).obj ((DiamondEtale.pull S Λ x).obj A))).obj
        ((rGamma S Λ _).obj ((DiamondEtale.pull S Λ x).obj B))) := sorry

/-- test etTensor_unit (degenerate): `Λ_Y ⊗^L A ≅ A` in `D_ét(Y, Λ)`. -/
example (Y : S.V) (A : DetCat S Λ Y) : Nonempty (((etTensor S Λ Y).obj (unitObj S Λ Y)).obj A ≅ A) := by
  sorry

/-- test etTensor_point (computation): for `Y = Spa(C, O_C)`, under `RΓ : D_ét(Y, Λ) ≃ D(Λ)` the
tensor product is `⊗^L_Λ`. -/
example (X : S.Std) [Nonempty (S.pts.obj (stdV S X))] [Subsingleton (S.pts.obj (stdV S X))] :
    Nonempty (etTensor S Λ (stdV S X) ⋙ (Functor.whiskeringRight _ _ _).obj (rGamma S Λ _) ≅
      rGamma S Λ _ ⋙ moduleDTensor Λ ⋙ (Functor.whiskeringLeft _ _ _).obj (rGamma S Λ _)) := by
  sorry

/-- test etTensor_std (compatibility): for strictly totally disconnected `X`, the tensor product on
`D_ét(X, Λ)` is the derived tensor product of sheaves of Λ-modules on `|X|`. -/
example (X : S.Std) (A B : DerivedCategory (TopCat.Sheaf (ModuleCat.{u} Λ) (S.pts.obj (stdV S X)))) :
    Nonempty (((etTensor S Λ _).obj ((stdSpaceDet S Λ X).obj A)).obj ((stdSpaceDet S Λ X).obj B) ≅
      (stdSpaceDet S Λ X).obj (((spaceDTensor Λ _).obj A).obj B)) := by sorry

/-- test etTensor_lower_shriek (characterisation): for a quasicompact open `j : U ⊂ Y`,
`j_!Λ_U ⊗^L A ≅ j_!j^*A`. -/
example (Y : S.V) (W : TopologicalSpace.Opens (S.pts.obj Y)) (hW : IsCompact (W : Set (S.pts.obj Y)))
    (A : DetCat S Λ Y) :
    Nonempty (((etTensor S Λ Y).obj ((etaleShriek S Λ (openSub S Y W)).obj (unitObj S Λ _))).obj A ≅
      (etaleShriek S Λ (openSub S Y W)).obj ((pull S Λ (openSubIncl S Y W)).obj A)) := by sorry

/-- The internal Hom of `D(Y_v, Λ)` (supplier data). -/
def vHom (Y : S.V) : (DV S Λ Y)ᵒᵖ ⥤ DV S Λ Y ⥤ DV S Λ Y := sorry

/-- test etTensor_not_closed_v_hom (non-example): the v-internal Hom of two objects of `D_ét` need
not lie in `D_ét`: for `Y = Spa(C, O_C)`, `Λ ≠ 0` and `A = ⊕_ℕ Λ`, `Hom_v(A, Λ)` is not in `D_ét`. -/
example [Nontrivial Λ] (X : S.Std) [Nonempty (S.pts.obj (stdV S X))]
    [Subsingleton (S.pts.obj (stdV S X))] :
    ¬ Det S Λ (stdV S X) (((vHom S Λ _).obj (Opposite.op ((DerivedCategory.singleFunctor _ 0).obj
      (vConst S Λ _ (ModuleCat.of Λ (ULift.{u} ℕ →₀ Λ)))))).obj (vUnit S Λ _)) := by sorry

/-! ## C3/internal-hom (ECD Lemma 17.8) -/

/-- API `etHom.adj`: `Hom(B ⊗^L A, C) ≅ Hom(B, RHom_Λ(A, C))` (supplier data). -/
def etHom.adj (Y : S.V) (A : DetCat S Λ Y) :
    (etTensor S Λ Y).flip.obj A ⊣ (etHom S Λ Y).obj (Opposite.op A) := sorry

/-- API `etHom.eq_coreflection`: `RHom_Λ(A, C) ≅ R_Yét(RHom_{D(Y_v, Λ)}(A, C))` (supplier data). -/
def etHom.eq_coreflection (Y : S.V) (A : DetCat S Λ Y) :
    (etHom S Λ Y).obj (Opposite.op A) ≅
      (Det S Λ Y).ι ⋙ (vHom S Λ Y).obj (Opposite.op A.obj) ⋙ etaleCoreflection S Λ Y := sorry

/-- API `etHom.globalSections`: `RΓ(Y, RHom_Λ(A, C))` computes `RHom_{D_ét}(A, C)`: on cohomology,
`Hom(Λ_Y, RHom_Λ(A, C[i])) = Hom(A, C[i])` (supplier data). -/
def etHom.globalSections (Y : S.V) (A C : DetCat S Λ Y) (i : ℤ) :
    (unitObj S Λ Y ⟶ ((etHom S Λ Y).obj (Opposite.op A)).obj (C⟦i⟧)) ≃+ (A ⟶ C⟦i⟧) := sorry

/-- API `etHom.pull_map`: the map `f^* RHom_Λ(A, C) → RHom_Λ(f^*A, f^*C)`, adjoint to
`f^*RHom(A, C) ⊗ f^*A ≅ f^*(RHom(A, C) ⊗ A) → f^*C`. -/
def etHom.pull_map {Y' Y : S.V} (f : Y' ⟶ Y) (A C : DetCat S Λ Y) :
    (pull S Λ f).obj (((etHom S Λ Y).obj (Opposite.op A)).obj C) ⟶
      ((etHom S Λ Y').obj (Opposite.op ((pull S Λ f).obj A))).obj ((pull S Λ f).obj C) :=
  (etHom.adj S Λ Y' ((pull S Λ f).obj A)).homEquiv _ _
    (((etTensor.pull S Λ f).inv.app (((etHom S Λ Y).obj (Opposite.op A)).obj C)).app A ≫
      (pull S Λ f).map ((etHom.adj S Λ Y A).counit.app C))

/-- `etHom.pull_map` is an isomorphism for `f` étale. -/
theorem etHom.pull_map_isIso {Y : S.V} (U : S.EtVOver Y) (A C : DetCat S Λ Y) :
    IsIso (etHom.pull_map S Λ ((S.etVSrc Y).obj U).hom A C) := sorry

/-- The dual `A^∨ = RHom_Λ(A, Λ_Y)`. -/
def etDual (Y : S.V) (A : DetCat S Λ Y) : DetCat S Λ Y :=
  ((etHom S Λ Y).obj (Opposite.op A)).obj (unitObj S Λ Y)

/-- API `etHom.dual`: the canonical map `A^∨ ⊗^L C → RHom_Λ(A, C)` (supplier data). -/
def etHom.dual (Y : S.V) (A C : DetCat S Λ Y) :
    ((etTensor S Λ Y).obj (etDual S Λ Y A)).obj C ⟶ ((etHom S Λ Y).obj (Opposite.op A)).obj C :=
  sorry

/-- `A` is dualizable: the canonical map `A^∨ ⊗^L A → RHom_Λ(A, A)` is an isomorphism (the
Dold–Puppe characterisation of dualizable objects in a closed symmetric monoidal category). -/
def IsDualizableEt (Y : S.V) (A : DetCat S Λ Y) : Prop := IsIso (etHom.dual S Λ Y A A)

/-- For dualizable `A`, `RHom_Λ(A, C) ≅ A^∨ ⊗^L C` for all `C`. -/
theorem etHom.dual_isIso (Y : S.V) (A : DetCat S Λ Y) (hA : IsDualizableEt S Λ Y A)
    (C : DetCat S Λ Y) : IsIso (etHom.dual S Λ Y A C) := sorry

/-- test etHom_unit (degenerate): `RHom_Λ(Λ_Y, C) ≅ C`. -/
example (Y : S.V) (C : DetCat S Λ Y) :
    Nonempty (((etHom S Λ Y).obj (Opposite.op (unitObj S Λ Y))).obj C ≅ C) := by sorry

/-- test etHom_point (computation): for `Y = Spa(C, O_C)`, under `RΓ : D_ét(Y, Λ) ≃ D(Λ)`,
`RHom_Λ` is the derived Hom of complexes of Λ-modules. -/
example (X : S.Std) [Nonempty (S.pts.obj (stdV S X))] [Subsingleton (S.pts.obj (stdV S X))] :
    Nonempty (etHom S Λ (stdV S X) ⋙ (Functor.whiskeringRight _ _ _).obj (rGamma S Λ _) ≅
      (rGamma S Λ _).op ⋙ moduleDHom Λ ⋙ (Functor.whiskeringLeft _ _ _).obj (rGamma S Λ _)) := by
  sorry

/-- test etHom_std_compat (compatibility): for strictly totally disconnected `X` and a quasicompact
open `j : U ⊂ X`, `RHom_Λ(j_!Λ_U, C) ≅ Rj_* j^* C`. -/
example (X : S.Std) (W : TopologicalSpace.Opens (S.pts.obj (stdV S X)))
    (hW : IsCompact (W : Set (S.pts.obj (stdV S X)))) (C : DetCat S Λ (stdV S X)) :
    Nonempty (((etHom S Λ _).obj (Opposite.op ((etaleShriek S Λ (openSub S _ W)).obj
        (unitObj S Λ _)))).obj C ≅
      (push S Λ (openSubIncl S _ W)).obj ((pull S Λ (openSubIncl S _ W)).obj C)) := by sorry

/-- test etHom_not_v_hom (non-example): for `Y = Spa(C, O_C)`, `Λ ≠ 0` (packet: `Λ = Z`) and
`A = ⊕_ℕ Λ`, the v-internal Hom `Hom(A, Λ)` (the sheaf `S ↦ C(S, Λ^ℕ)`) is not in `D_ét`, while the
étale internal Hom `RHom_Λ(A, Λ)` is the constant sheaf with value `Λ^ℕ`. -/
example [Nontrivial Λ] (X : S.Std) [Nonempty (S.pts.obj (stdV S X))]
    [Subsingleton (S.pts.obj (stdV S X))] :
    ¬ Det S Λ (stdV S X) (((vHom S Λ _).obj (Opposite.op ((DerivedCategory.singleFunctor _ 0).obj
      (vConst S Λ _ (ModuleCat.of Λ (ULift.{u} ℕ →₀ Λ)))))).obj (vUnit S Λ _)) ∧
    Nonempty (((etHom S Λ _).obj (Opposite.op (constObj S Λ _ (ModuleCat.of Λ (ULift.{u} ℕ →₀ Λ))))).obj
        (unitObj S Λ _) ≅ constObj S Λ (stdV S X) (ModuleCat.of Λ (ULift.{u} ℕ → Λ))) := by sorry

/-! ## C3/pushforward-internal-hom (ECD Corollary 17.9) -/

/-- DiamondEtaleCohomology:C3/pushforward-internal-hom (ECD Corollary 17.9):
`Rf_* RHom_Λ(f^*A, B) ≅ RHom_Λ(A, Rf_* B)`, naturally in `A` and `B`. -/
theorem pushforwardInternalHom {Y' Y : S.V} (f : Y' ⟶ Y) :
    Nonempty ((pull S Λ f).op ⋙ etHom S Λ Y' ⋙ (Functor.whiskeringRight _ _ _).obj (push S Λ f) ≅
      etHom S Λ Y ⋙ (Functor.whiskeringLeft _ _ _).obj (push S Λ f)) := sorry

/-! ## C3/change-of-coefficients (ECD paragraph before Proposition 14.10) -/

/-- DiamondEtaleCohomology:C3/change-of-coefficients (ECD paragraph before Proposition 14.10), API
`restrictScalars`: `φ_* : D_ét(Y, Λ') → D_ét(Y, Λ)` for a ring map `φ : Λ → Λ'` (supplier data). -/
def restrictScalars {Λ' : Type u} [CommRing Λ'] (φ : Λ →+* Λ') (Y : S.V) :
    DetCat S Λ' Y ⥤ DetCat S Λ Y := sorry

/-- API `extendScalars`: `φ^* = Λ' ⊗^L_Λ − : D_ét(Y, Λ) → D_ét(Y, Λ')` (supplier data). -/
def extendScalars {Λ' : Type u} [CommRing Λ'] (φ : Λ →+* Λ') (Y : S.V) :
    DetCat S Λ Y ⥤ DetCat S Λ' Y := sorry

/-- `φ^* ⊣ φ_*` (supplier data). -/
def extendScalarsAdj {Λ' : Type u} [CommRing Λ'] (φ : Λ →+* Λ') (Y : S.V) :
    extendScalars S Λ φ Y ⊣ restrictScalars S Λ φ Y := sorry

/-- API `restrictScalars_pull`: `φ_* ∘ f^* ≅ f^* ∘ φ_*` (supplier data). -/
def restrictScalars_pull {Λ' : Type u} [CommRing Λ'] (φ : Λ →+* Λ') {Y' Y : S.V} (f : Y' ⟶ Y) :
    pull S Λ' f ⋙ restrictScalars S Λ φ Y' ≅ restrictScalars S Λ φ Y ⋙ pull S Λ f := sorry

/-- API `restrictScalars_push`: `φ_* ∘ Rf_* ≅ Rf_* ∘ φ_*` (supplier data). -/
def restrictScalars_push {Λ' : Type u} [CommRing Λ'] (φ : Λ →+* Λ') {Y' Y : S.V} (f : Y' ⟶ Y) :
    push S Λ' f ⋙ restrictScalars S Λ φ Y ≅ restrictScalars S Λ φ Y' ⋙ push S Λ f := sorry

/-- API `extendScalars_pull`: `φ^* ∘ f^* ≅ f^* ∘ φ^*` (supplier data); `extendScalars_tensor`
records that `φ^*` is monoidal. -/
def extendScalars_pull {Λ' : Type u} [CommRing Λ'] (φ : Λ →+* Λ') {Y' Y : S.V} (f : Y' ⟶ Y) :
    pull S Λ f ⋙ extendScalars S Λ φ Y' ≅ extendScalars S Λ φ Y ⋙ pull S Λ' f := sorry

def extendScalars_tensor {Λ' : Type u} [CommRing Λ'] (φ : Λ →+* Λ') (Y : S.V) :
    etTensor S Λ Y ⋙ (Functor.whiskeringRight _ _ _).obj (extendScalars S Λ φ Y) ≅
      extendScalars S Λ φ Y ⋙ etTensor S Λ' Y ⋙
        (Functor.whiskeringLeft _ _ _).obj (extendScalars S Λ φ Y) := sorry

/-- API `changeOfCoefficients_comp`: `(ψ ∘ φ)_* ≅ φ_* ∘ ψ_*` and `(ψ ∘ φ)^* ≅ ψ^* ∘ φ^*`
(supplier data). -/
def changeOfCoefficients_comp {Λ' Λ'' : Type u} [CommRing Λ'] [CommRing Λ''] (φ : Λ →+* Λ')
    (ψ : Λ' →+* Λ'') (Y : S.V) :
    (restrictScalars S Λ (ψ.comp φ) Y ≅ restrictScalars S Λ' ψ Y ⋙ restrictScalars S Λ φ Y) ×
      (extendScalars S Λ (ψ.comp φ) Y ≅ extendScalars S Λ φ Y ⋙ extendScalars S Λ' ψ Y) := sorry

/-- Restriction and derived extension of scalars on `D(Λ)` (supplier data). -/
def moduleRestrictD {Λ' : Type u} [CommRing Λ'] (φ : Λ →+* Λ') :
    DerivedCategory (ModuleCat.{u} Λ') ⥤ DerivedCategory (ModuleCat.{u} Λ) := sorry
def moduleExtendD {Λ' : Type u} [CommRing Λ'] (φ : Λ →+* Λ') :
    DerivedCategory (ModuleCat.{u} Λ) ⥤ DerivedCategory (ModuleCat.{u} Λ') := sorry

/-- test restrictScalars_id (degenerate): for `φ = id`, `φ_* ≅ 𝟭` and `φ^* ≅ 𝟭`. -/
example (Y : S.V) :
    Nonempty (restrictScalars S Λ (RingHom.id Λ) Y ≅ 𝟭 _) ∧
      Nonempty (extendScalars S Λ (RingHom.id Λ) Y ≅ 𝟭 _) := by sorry

/-- test extendScalars_reduction (computation): `φ^*Λ = Λ'` and `φ_*φ^*Λ` is the constant sheaf `Λ'`
viewed as a Λ-module (packet: `Λ = Z/ℓ² → Λ' = Z/ℓ`; stated for any `φ`). -/
example {Λ' : Type u} [CommRing Λ'] (φ : Λ →+* Λ') (Y : S.V) :
    Nonempty ((extendScalars S Λ φ Y).obj (unitObj S Λ Y) ≅ unitObj S Λ' Y) ∧
      Nonempty ((restrictScalars S Λ φ Y).obj ((extendScalars S Λ φ Y).obj (unitObj S Λ Y)) ≅
        constObj S Λ Y (letI := φ.toModule; ModuleCat.of Λ Λ')) := by sorry

/-- test changeOfCoefficients_point (compatibility): for `Y = Spa(C, O_C)`, under `D_ét ≃ D(Λ)` these
are restriction and derived extension of scalars of module categories. -/
example {Λ' : Type u} [CommRing Λ'] (φ : Λ →+* Λ') (X : S.Std) [Nonempty (S.pts.obj (stdV S X))]
    [Subsingleton (S.pts.obj (stdV S X))] :
    Nonempty (restrictScalars S Λ φ (stdV S X) ⋙ rGamma S Λ _ ≅ rGamma S Λ' _ ⋙ moduleRestrictD Λ φ) ∧
      Nonempty (extendScalars S Λ φ (stdV S X) ⋙ rGamma S Λ' _ ≅ rGamma S Λ _ ⋙ moduleExtendD Λ φ) := by
  sorry

/-- test extendScalars_not_underived (non-example): for `φ : Λ → Λ/a` (`a` a regular non-unit;
packet: `Z → Z/p`), `φ^*(Λ/a) = Λ/a ⊗^L_Λ Λ/a` has `H^{-1} ≠ 0` (on a nonempty `X`), so the
underived extension of scalars is not the right functor. -/
example (a : Λ) (ha : IsSMulRegular Λ a) (hu : ¬ IsUnit a) (X : S.Std)
    [Nonempty (S.pts.obj (stdV S X))] :
    ¬ IsZero ((DerivedCategory.homologyFunctor _ (-1)).obj
      ((extendScalars S Λ (Ideal.Quotient.mk (Ideal.span {a})) (stdV S X)).obj
        (constObj S Λ (stdV S X) (ModuleCat.of Λ (Λ ⧸ Ideal.span {a})))).obj) := by sorry

/-! ## C5/etale-extension-by-zero (ECD Definition/Proposition 19.1) -/

/-- The source and structure map of an étale map given as an object of `EtVOver Y`. -/
abbrev etSrc {Y : S.V} (U : S.EtVOver Y) : S.V := ((S.etVSrc Y).obj U).left
abbrev etMap {Y : S.V} (U : S.EtVOver Y) : etSrc S U ⟶ Y := ((S.etVSrc Y).obj U).hom

/-- API `etaleShriek.tExact`: `f_!` commutes with canonical truncations (it is t-exact). -/
theorem etaleShriek.tExact {Y : S.V} (U : S.EtVOver Y) (A : DetCat S Λ (etSrc S U)) (n : ℤ) :
    (DerivedCategory.TStructure.t.IsGE A.obj n →
        DerivedCategory.TStructure.t.IsGE ((etaleShriek S Λ U).obj A).obj n) ∧
      (DerivedCategory.TStructure.t.IsLE A.obj n →
        DerivedCategory.TStructure.t.IsLE ((etaleShriek S Λ U).obj A).obj n) := sorry

/-- API `etaleShriek.comp`: for étale `g : Y'' → Y'` and `f : Y' → Y`, `(f ∘ g)_! ≅ f_! ∘ g_!`, where
`W` represents the composite étale map (supplier data). -/
def etaleShriek.comp {Y : S.V} (U : S.EtVOver Y) (V : S.EtVOver (etSrc S U)) (W : S.EtVOver Y)
    (e : (S.etVSrc Y).obj W ≅ Over.mk (etMap S V ≫ etMap S U)) :
    DiamondEtale.pull S Λ e.hom.left ⋙ etaleShriek S Λ W ≅ etaleShriek S Λ V ⋙ etaleShriek S Λ U :=
  sorry

/-- `(𝟙 Y)_! ≅ 𝟭`, for `W` representing the identity (supplier data). -/
def etaleShriek.id {Y : S.V} (W : S.EtVOver Y) (e : (S.etVSrc Y).obj W ≅ Over.mk (𝟙 Y)) :
    DiamondEtale.pull S Λ e.hom.left ⋙ etaleShriek S Λ W ≅ 𝟭 _ := sorry

/-- The free sheaf of Λ-modules `Λ[h_Z]` on the sheafified representable presheaf of an object of
the v-site. -/
def vFree (Y : S.V) (Z : S.VOver Y) : VSh S Λ Y :=
  (presheafToSheaf (vSite S Y) (ModuleCat.{u} Λ)).obj (yoneda.obj Z ⋙ ModuleCat.free Λ)

/-- API `etaleShriek.sheaf`: `f_!` of the sheaf represented by an étale `Z → Y'` is the sheaf
represented by `Z → Y' → Y`. Stated for all small v-stacks `Y` (the packet takes `Y` perfectoid). -/
theorem etaleShriek.sheaf {Y : S.V} (U : S.EtVOver Y) (Z : S.VOver (etSrc S U)) (Z' : S.VOver Y)
    (e : Over.mk (((S.vSrc _).obj Z).hom ≫ etMap S U) ≅ (S.vSrc Y).obj Z')
    (hZ : IsEtaleV S ((S.vSrc _).obj Z).hom) (B : DetCat S Λ (etSrc S U))
    (hB : Nonempty (B.obj ≅ (DerivedCategory.singleFunctor _ 0).obj (vFree S Λ _ Z))) :
    Nonempty (((etaleShriek S Λ U).obj B).obj ≅
      (DerivedCategory.singleFunctor _ 0).obj (vFree S Λ Y Z')) := sorry

/-- API `etaleShriek.projection`: the projection formula `f_!(A ⊗^L f^*B) ≅ f_!A ⊗^L B`
(supplier data). -/
def etaleShriek.projection {Y : S.V} (U : S.EtVOver Y) (A : DetCat S Λ (etSrc S U))
    (B : DetCat S Λ Y) :
    (etaleShriek S Λ U).obj (((etTensor S Λ _).obj A).obj ((DiamondEtale.pull S Λ (etMap S U)).obj B)) ≅
      ((etTensor S Λ Y).obj ((etaleShriek S Λ U).obj A)).obj B := sorry

/-- API `etaleShriek.homAdj`: `RHom_Λ(f_!A, B) ≅ Rf_* RHom_Λ(A, f^*B)` (supplier data). -/
def etaleShriek.homAdj {Y : S.V} (U : S.EtVOver Y) (A : DetCat S Λ (etSrc S U)) (B : DetCat S Λ Y) :
    ((etHom S Λ Y).obj (Opposite.op ((etaleShriek S Λ U).obj A))).obj B ≅
      (push S Λ (etMap S U)).obj (((etHom S Λ _).obj (Opposite.op A)).obj
        ((DiamondEtale.pull S Λ (etMap S U)).obj B)) := sorry

/-- test etaleShriek_id (degenerate): for `f = 𝟙 Y`, `f_! ≅ 𝟭`. -/
example {Y : S.V} (W : S.EtVOver Y) (e : (S.etVSrc Y).obj W ≅ Over.mk (𝟙 Y)) :
    Nonempty (pull S Λ e.hom.left ⋙ etaleShriek S Λ W ≅ 𝟭 _) := by sorry

/-- test etaleShriek_disjoint (computation): for the fold map `f : Y ⊔ Y → Y`, `f_!(A, B) = A ⊕ B`;
an object of `D_ét(Y ⊔ Y, Λ)` is the pair of its restrictions to the two summands. -/
example {Y : S.V} (c : BinaryCofan Y Y) (hc : IsColimit c) (W : S.EtVOver Y)
    (e : (S.etVSrc Y).obj W ≅ Over.mk (hc.desc (BinaryCofan.mk (𝟙 Y) (𝟙 Y))))
    (C : DetCat S Λ (etSrc S W)) :
    Nonempty ((etaleShriek S Λ W).obj C ≅
      (pull S Λ (c.inl ≫ e.inv.left)).obj C ⊞ (pull S Λ (c.inr ≫ e.inv.left)).obj C) := by sorry

/-- test etaleShriek_stalk (compatibility): for an open immersion `j : U ⊂ Y` and a geometric point
`x : Spa(C, C⁺) → Y` with closed point `z`, `(j_!A)_x = A_x` if `x` lies in `U` and `0` if its image
is outside `|U|` (the geometric stalk is `RΓ(Spa(C, C⁺), x^*−)`). Stated for all small v-stacks `Y`
(the packet takes `Y` locally spatial). -/
example {Y : S.V} (W : TopologicalSpace.Opens (S.pts.obj Y)) (A : DetCat S Λ (openSubV S Y W))
    (X : S.Std) [ConnectedSpace (S.pts.obj (stdV S X))] (x : stdV S X ⟶ Y)
    (z : S.pts.obj (stdV S X)) (hz : IsClosed ({z} : Set (S.pts.obj (stdV S X)))) :
    (S.pts.map x z ∉ W →
      IsZero ((rGamma S Λ _).obj ((pull S Λ x).obj ((etaleShriek S Λ (openSub S Y W)).obj A)))) ∧
    ∀ x' : stdV S X ⟶ openSubV S Y W, x' ≫ openSubIncl S Y W = x →
      Nonempty ((rGamma S Λ _).obj ((pull S Λ x).obj ((etaleShriek S Λ (openSub S Y W)).obj A)) ≅
        (rGamma S Λ _).obj ((pull S Λ x').obj A)) := by sorry

/-- test etaleShriek_finite_etale (computation): for a finite étale map `f` of degree `d` over a
geometric point `Spa(C, O_C)` (an étale map whose source has `d` points), `f_!Λ = Λ^d`. -/
example (X : S.Std) [Nonempty (S.pts.obj (stdV S X))] [Subsingleton (S.pts.obj (stdV S X))]
    (U : S.EtVOver (stdV S X)) (d : ℕ) [Finite (S.pts.obj (etSrc S U))]
    (hd : Nat.card (S.pts.obj (etSrc S U)) = d) :
    Nonempty ((etaleShriek S Λ U).obj (unitObj S Λ _) ≅
      constObj S Λ (stdV S X) (ModuleCat.of Λ (Fin d → Λ))) := by sorry

/-- test etaleShriek_not_pushforward (non-example): for the open immersion
`j : Spa(C, O_C) ⊂ Spa(C, C⁺)` with `C⁺ ≠ O_C` (an open `W` of a connected strictly totally
disconnected `X` missing the closed point), `j_!Λ` has zero stalk at the closed point while `Rj_*Λ`
does not (`Λ ≠ 0`), so `j_! ≠ Rj_*`. -/
example [Nontrivial Λ] (X : S.Std) [ConnectedSpace (S.pts.obj (stdV S X))]
    (W : TopologicalSpace.Opens (S.pts.obj (stdV S X))) (z : S.pts.obj (stdV S X))
    (hz : IsClosed ({z} : Set (S.pts.obj (stdV S X)))) (hzW : z ∉ W)
    (hW : (W : Set (S.pts.obj (stdV S X))).Nonempty) :
    IsZero ((rGamma S Λ _).obj ((etaleShriek S Λ (openSub S _ W)).obj (unitObj S Λ _))) ∧
      ¬ IsZero ((rGamma S Λ _).obj ((push S Λ (openSubIncl S _ W)).obj (unitObj S Λ _))) := by sorry

/-! ## C5/extension-by-zero-base-change (ECD Definition/Proposition 19.1) -/

/-- The base change `U ×_Y Yt → Yt` of an étale map along `g : Yt → Y` and its projection to `U`
(supplier data; `etBaseChange_isPullback` records that the square is cartesian). -/
def etBaseChange {Y Yt : S.V} (U : S.EtVOver Y) (g : Yt ⟶ Y) : S.EtVOver Yt := sorry
def etBaseChangeMap {Y Yt : S.V} (U : S.EtVOver Y) (g : Yt ⟶ Y) :
    etSrc S (etBaseChange S U g) ⟶ etSrc S U := sorry

theorem etBaseChange_isPullback {Y Yt : S.V} (U : S.EtVOver Y) (g : Yt ⟶ Y) :
    IsPullback (etBaseChangeMap S U g) (etMap S (etBaseChange S U g)) (etMap S U) g := sorry

/-- The base change transformation `f̃_! g'^* → g^* f_!` for a commutative square
`g' ≫ f = f̃ ≫ g` with `f, f̃` étale: the mate of `g'^* f^* ≅ (f ∘ g')^* = (g ∘ f̃)^* ≅ f̃^* g^*`. -/
def etaleShriekBaseChangeOf {Y Yt : S.V} {U : S.EtVOver Y} {U' : S.EtVOver Yt} {g : Yt ⟶ Y}
    {g' : etSrc S U' ⟶ etSrc S U} (w : g' ≫ etMap S U = etMap S U' ≫ g) :
    pull S Λ g' ⋙ etaleShriek S Λ U' ⟶ etaleShriek S Λ U ⋙ pull S Λ g :=
  (mateEquiv (etaleShriekAdj S Λ U) (etaleShriekAdj S Λ U')).symm
    ((pull_comp S Λ g' (etMap S U)).inv ≫ eqToHom (congrArg (pull S Λ) w) ≫
      (pull_comp S Λ (etMap S U') g).hom)

/-- DiamondEtaleCohomology:C5/extension-by-zero-base-change (ECD Definition/Proposition 19.1): for a cartesian
square, the base change transformation `f̃_! g'^* → g^* f_!` is an isomorphism. -/
theorem extensionByZeroBaseChange {Y Yt : S.V} {U : S.EtVOver Y} {U' : S.EtVOver Yt} {g : Yt ⟶ Y}
    {g' : etSrc S U' ⟶ etSrc S U} (h : IsPullback g' (etMap S U') (etMap S U) g) :
    IsIso (etaleShriekBaseChangeOf S Λ h.w) := sorry

/-! ## C5/open-support-triangle (ECD Remark 19.3) -/

open Pretriangulated in
/-- DiamondEtaleCohomology:C5/open-support-triangle (ECD Remark 19.3): for an open immersion `j : U ⊂ Y`,
`j^* j_! ≅ 𝟭` (the unit is an isomorphism), so `j_!` is fully faithful; `j_!` is the classical
extension by zero (its geometric stalks vanish at points outside `|U|`); and the cone `C` of the
counit `j_!j^*A → A` satisfies `j^*C = 0`. The remark that `|Y| ∖ |U|` need not underlie a closed
sub-v-sheaf is a non-existence statement without a carrier object and is omitted. -/
theorem openSupportTriangle (Y : S.V) (W : TopologicalSpace.Opens (S.pts.obj Y)) :
    IsIso (etaleShriekAdj S Λ (openSub S Y W)).unit ∧
    Nonempty (etaleShriek S Λ (openSub S Y W)).FullyFaithful ∧
    (∀ (X : S.Std), ConnectedSpace (S.pts.obj (stdV S X)) → ∀ (x : stdV S X ⟶ Y)
      (z : S.pts.obj (stdV S X)), IsClosed ({z} : Set (S.pts.obj (stdV S X))) → S.pts.map x z ∉ W →
        ∀ A : DetCat S Λ (openSubV S Y W),
          IsZero ((rGamma S Λ _).obj ((pull S Λ x).obj ((etaleShriek S Λ (openSub S Y W)).obj A)))) ∧
    ∀ (A C : DetCat S Λ Y) (g : A ⟶ C)
      (h : C ⟶ ((etaleShriek S Λ (openSub S Y W)).obj ((pull S Λ (openSubIncl S Y W)).obj A))⟦(1 : ℤ)⟧),
      Triangle.mk ((etaleShriekAdj S Λ (openSub S Y W)).counit.app A) g h ∈ distTriang (DetCat S Λ Y) →
        IsZero ((pull S Λ (openSubIncl S Y W)).obj C) := sorry

/-! ## C5/exchange-map (ECD Theorem 19.2, the map) -/

/-- The adjoint `f^* j_! Rg_* ≅ j'_! g^* Rg_* → j'_!` of the exchange map, for an étale `j` and its base
change `j'` along `f`, using the (invertible) base change for `j_!` and the counit of `g^* ⊣ Rg_*`. -/
def pbcAdjoint {Y' Y : S.V} (f : Y' ⟶ Y) (U : S.EtVOver Y) :
    push S Λ (etBaseChangeMap S U f) ⋙ etaleShriek S Λ U ⋙ pull S Λ f ⟶
      etaleShriek S Λ (etBaseChange S U f) :=
  haveI := extensionByZeroBaseChange S Λ (etBaseChange_isPullback S U f)
  Functor.whiskerLeft (push S Λ (etBaseChangeMap S U f))
      (inv (etaleShriekBaseChangeOf S Λ (etBaseChange_isPullback S U f).w)) ≫
    Functor.whiskerRight (pullPushAdj S Λ (etBaseChangeMap S U f)).counit
      (etaleShriek S Λ (etBaseChange S U f)) ≫ (Functor.leftUnitor _).hom

/-- The exchange map `j_! Rg_* → Rf_* j'_!` for an étale `j : U → Y` and its base change along
`f : Y' → Y` (the transpose of `pbcAdjoint` under `f^* ⊣ Rf_*`). -/
def pbcMapGen {Y' Y : S.V} (f : Y' ⟶ Y) (U : S.EtVOver Y) :
    push S Λ (etBaseChangeMap S U f) ⋙ etaleShriek S Λ U ⟶
      etaleShriek S Λ (etBaseChange S U f) ⋙ push S Λ f :=
  (Functor.rightUnitor _).inv ≫
    Functor.whiskerLeft (push S Λ (etBaseChangeMap S U f) ⋙ etaleShriek S Λ U)
      (pullPushAdj S Λ f).unit ≫
    Functor.whiskerRight (pbcAdjoint S Λ f U) (push S Λ f)

/-- DiamondEtaleCohomology:C5/exchange-map (ECD Theorem 19.2), API `pbcMap`: the transformation `j_! ∘ Rg_* ⟶ Rf_* ∘ j'_!` for
`j : U ⊂ Y` the open immersion of an open `W ⊆ |Y|`, `g : U' = U ×_Y Y' → U` and `j' : U' ⊂ Y'`.
Properness of `f` is a hypothesis of the theorems, not of the construction. -/
def pbcMap {Y' Y : S.V} (f : Y' ⟶ Y) (W : TopologicalSpace.Opens (S.pts.obj Y)) :
    push S Λ (etBaseChangeMap S (openSub S Y W) f) ⋙ etaleShriek S Λ (openSub S Y W) ⟶
      etaleShriek S Λ (etBaseChange S (openSub S Y W) f) ⋙ push S Λ f :=
  pbcMapGen S Λ f (openSub S Y W)

/-- API `pbcMap.adjoint`: the adjoint `f^* j_! Rg_* → j'_!` of `pbcMap` is `j'_!(counit)` composed with
the base change isomorphism for `j_!`. -/
theorem pbcMap.adjoint {Y' Y : S.V} (f : Y' ⟶ Y) (W : TopologicalSpace.Opens (S.pts.obj Y))
    (A : DetCat S Λ (etSrc S (etBaseChange S (openSub S Y W) f))) :
    ((pullPushAdj S Λ f).homEquiv _ _).symm ((pbcMap S Λ f W).app A) =
      (pbcAdjoint S Λ f (openSub S Y W)).app A := sorry

/-- API `pbcMap.restrict`: after restriction to `U` along `j^*`, the exchange map becomes the identity
of `Rg_*` under `j^* j_! ≅ 𝟭` and base change for `Rf_*` along the open immersion `j`; the prototype
records that it becomes an isomorphism. -/
theorem pbcMap.restrict {Y' Y : S.V} (f : Y' ⟶ Y) (W : TopologicalSpace.Opens (S.pts.obj Y)) :
    IsIso (Functor.whiskerRight (pbcMap S Λ f W) (DiamondEtale.pull S Λ (openSubIncl S Y W))) := sorry

/-- The map `Ũ' → U'` between the two base changes in `pbcMap.baseChange`, induced by the
cartesian square defining `U' = U ×_Y Y'`. -/
def pbcBaseChangeLift {Y' Y Yt : S.V} (f : Y' ⟶ Y) (h : Yt ⟶ Y) (U : S.EtVOver Y) :
    etSrc S (etBaseChange S (etBaseChange S U h) (pullback.snd f h)) ⟶ etSrc S (etBaseChange S U f) :=
  (etBaseChange_isPullback S U f).lift
    (etBaseChangeMap S (etBaseChange S U h) (pullback.snd f h) ≫ etBaseChangeMap S U h)
    (etMap S (etBaseChange S (etBaseChange S U h) (pullback.snd f h)) ≫ pullback.fst f h) (by
      rw [Category.assoc, (etBaseChange_isPullback S U h).w, ← Category.assoc,
        (etBaseChange_isPullback S (etBaseChange S U h) (pullback.snd f h)).w, Category.assoc,
        Category.assoc, pullback.condition])

/-- API `pbcMap.baseChange`: the exchange map is compatible with base change along `h : Yt → Y`: the
square formed by the exchange maps for the data over `Y` and for the pulled back data over `Yt`
and the base change transformations for `j_!`, `Rg_*`, `Rf_*` and `j'_!` commutes. -/
theorem pbcMap.baseChange {Y' Y Yt : S.V} (f : Y' ⟶ Y) (h : Yt ⟶ Y) (U : S.EtVOver Y) :
    Functor.whiskerLeft (push S Λ (etBaseChangeMap S U f))
        (etaleShriekBaseChangeOf S Λ (etBaseChange_isPullback S U h).w) ≫
      Functor.whiskerRight (pbcMapGen S Λ f U) (DiamondEtale.pull S Λ h) ≫
      Functor.whiskerLeft (etaleShriek S Λ (etBaseChange S U f))
        (pushBaseChangeOf S Λ (pullback.condition (f := f) (g := h))) =
    Functor.whiskerRight (pushBaseChangeOf S Λ
        ((etBaseChange_isPullback S U f).lift_fst _ _ _ :
          pbcBaseChangeLift S f h U ≫ etBaseChangeMap S U f = _))
        (etaleShriek S Λ (etBaseChange S U h)) ≫
      Functor.whiskerLeft (DiamondEtale.pull S Λ (pbcBaseChangeLift S f h U))
        (pbcMapGen S Λ (pullback.snd f h) (etBaseChange S U h)) ≫
      Functor.whiskerRight (etaleShriekBaseChangeOf S Λ
        ((etBaseChange_isPullback S U f).lift_snd _ _ _ :
          pbcBaseChangeLift S f h U ≫ etMap S (etBaseChange S U f) = _))
        (push S Λ (pullback.snd f h)) := sorry

/-- test pbcMap_U_eq_Y (degenerate): if `U = Y` the transformation is the identity of `Rf_*` (under
`j_! ≅ 𝟭`); the prototype records that it is an isomorphism. -/
example {Y' Y : S.V} (f : Y' ⟶ Y) : IsIso (pbcMap S Λ f ⊤) := by sorry

/-- test pbcMap_f_id (degenerate): if `f = 𝟙 Y` the transformation is the identity of `j_!` (an
isomorphism). -/
example (Y : S.V) (W : TopologicalSpace.Opens (S.pts.obj Y)) : IsIso (pbcMap S Λ (𝟙 Y) W) := by sorry

/-- test pbcMap_restrict_U (characterisation): after applying `j^*` the transformation becomes the
identity `Rg_* → Rg_*` (base change for `Rf_*` along the open immersion `j`); recorded as an
isomorphism. -/
example {Y' Y : S.V} (f : Y' ⟶ Y) (W : TopologicalSpace.Opens (S.pts.obj Y)) :
    IsIso (Functor.whiskerRight (pbcMap S Λ f W) (pull S Λ (openSubIncl S Y W))) := by sorry

/-- test pbcMap_not_iso_nonproper (non-example): for the non-proper open immersion
`f = j : Spa(C, O_C) ⊂ Spa(C, C⁺)` (`C⁺ ≠ O_C`: an open `W` of a connected strictly totally
disconnected `X` missing the closed point), `j_!Rg_*Λ = j_!Λ → Rf_*j'_!Λ = Rf_*Λ` is not an
isomorphism (stalks `0` and `Λ ≠ 0` at the closed point). -/
example [Nontrivial Λ] (X : S.Std) [ConnectedSpace (S.pts.obj (stdV S X))]
    (W : TopologicalSpace.Opens (S.pts.obj (stdV S X))) (z : S.pts.obj (stdV S X))
    (hz : IsClosed ({z} : Set (S.pts.obj (stdV S X)))) (hzW : z ∉ W)
    (hW : (W : Set (S.pts.obj (stdV S X))).Nonempty) :
    ¬ IsIso ((pbcMap S Λ (openSubIncl S _ W) W).app (unitObj S Λ _)) := by sorry

/-! ## C5/compactification-hypercover -/

/-- DiamondEtaleCohomology:C5/compactification-hypercover (ECD proof of Theorem 19.2): for a proper
`Y' → X` over a strictly totally disconnected `X`, there is a v-hypercover `Y'_• → Y'` whose terms are
canonical compactifications `X̄'_i^{/X}` of strictly totally disconnected `X'_i → X`, proper over `X`.
Omitted: that the `Y'_i` are affinoid perfectoid (not typable against `Carriers`), and the formula
`RΓ(Y', B) = R lim_{[i] ∈ Δ} RΓ(Y'_i, B)`, which needs homotopy limits over `Δ` (its homotopy-level
content is `vHyperdescent` applied to this hypercover). -/
theorem compactificationHypercover (X : S.Std) {Y' : S.V} (p : Y' ⟶ stdV S X) (hp : IsProper S p) :
    ∃ (H : SimplicialObject (Over Y')) (X' : ℕ → S.Std) (q : ∀ i, stdV S (X' i) ⟶ stdV S X)
      (e : ∀ i, (H.obj (Opposite.op ⦋i⦌)).left ≅ cpt S (q i)),
      IsVHypercover S H ∧ (∀ i, (e i).hom ≫ cptMap S (q i) = (H.obj (Opposite.op ⦋i⦌)).hom ≫ p) ∧
        ∀ i, IsProper S (cptMap S (q i)) := sorry

/-! ## C5/compactified-field-point-topos -/

/-- The residue field `K` of a perfectoid field pair `(C, C⁺)`, the image `V = C⁺/C°°` of `C⁺` in it,
and the map of residue fields induced by a map `Spa(C', C'⁺) → Spa(C, C⁺)` (supplier data,
PerfectoidSpaces P4). -/
def residueField (P : S.FieldPair) : Type u := sorry
instance residueField.field (P : S.FieldPair) : Field (residueField S P) := sorry
def plusResidue (P : S.FieldPair) : ValuationSubring (residueField S P) := sorry
def residueMap {P P' : S.FieldPair} (q : S.spa (S.fieldTate P') ⟶ S.spa (S.fieldTate P)) :
    residueField S P →+* residueField S P' := sorry

/-- The relative Zariski–Riemann space `Spa(K', V)`: valuation subrings of `K'` containing the
valuation subring `V` of the subfield `K` (via `ι : K → K'`). -/
def ZRSpace {K K' : Type u} [Field K] [Field K'] (ι : K →+* K') (V : ValuationSubring K) : Type u :=
  {W : ValuationSubring K' // V ≤ W.comap ι}

/-- Its topology (that of `Spa(K', V)` with `K'` discrete): generated by the sets `{W | x ∈ W}`, which
are the rational subsets `{|x| ≤ 1}`. -/
instance ZRSpace.topologicalSpace {K K' : Type u} [Field K] [Field K'] (ι : K →+* K')
    (V : ValuationSubring K) : TopologicalSpace (ZRSpace ι V) :=
  TopologicalSpace.generateFrom (Set.range fun x : K' => {W : ZRSpace ι V | x ∈ W.1})

/-- DiamondEtaleCohomology:C5/compactified-field-point-topos (ECD proof of Theorem 19.2): for connected
strictly totally disconnected `X = Spa(C, C⁺)`, `X' = Spa(C', C'⁺)` with `X' → X` and
`Y' = X̄'^{/X}` (the locally spatial diamond underlying the canonical compactification): `|Y'|` has a
single rank-one (= maximal) point, i.e. it is irreducible; `Y'_ét^∼ ≃ |Y'|^∼` (stated for sheaves of
Λ-modules); and `|Y'| ≅ |Spa(K', V)|` for the residue fields `K ⊂ K'` and `V = C⁺/C°°`. -/
theorem compactifiedFieldPointTopos (P P' : S.FieldPair) (X X' : S.Std)
    (eX : stdV S X ≅ S.spa (S.fieldTate P)) (eX' : stdV S X' ≅ S.spa (S.fieldTate P'))
    (q : stdV S X' ⟶ stdV S X) (Y' : S.LS) (eY : S.ofLS Y' ≅ cpt S q) :
    IrreducibleSpace (S.pts.obj (S.ofLS Y')) ∧
      Nonempty (EtSh S Λ Y' ≌ TopCat.Sheaf (ModuleCat.{u} Λ) (S.pts.obj (S.ofLS Y'))) ∧
      Nonempty (S.pts.obj (S.ofLS Y') ≃ₜ ZRSpace (residueMap S (eX'.inv ≫ q ≫ eX.hom)) (plusResidue S P)) :=
  sorry

/-! ## C5/zariski-riemann-acyclicity (ECD Lemma 19.4) -/

section
attribute [local instance] HasExt.standard

/-- DiamondEtaleCohomology:C5/zariski-riemann-acyclicity (ECD Lemma 19.4): for algebraically closed
fields `K ⊂ K'`, a valuation subring `V ⊂ K`, `T' = Spa(K', V)`, `f : T' → T = Spa(K, V)`,
`V' ↦ V' ∩ K`, and `s ∈ T` the closed point (`V` itself): a sheaf `F` of torsion abelian groups on
`T'` with `F_{x'} = 0` for all `x' ∈ f⁻¹(s)` has `RΓ(T', F) = 0`. -/
theorem zariskiRiemannAcyclicity {K K' : Type u} [Field K] [Field K'] [IsAlgClosed K] [IsAlgClosed K']
    [Algebra K K'] (V : ValuationSubring K)
    (F : TopCat.Sheaf AddCommGrpCat.{u} (TopCat.of (ZRSpace (algebraMap K K') V)))
    (htors : ∀ (x : ZRSpace (algebraMap K K') V) (s : F.presheaf.stalk x), IsOfFinAddOrder s)
    (hF : ∀ x : ZRSpace (algebraMap K K') V, x.1.comap (algebraMap K K') = V →
      IsZero (F.presheaf.stalk x)) :
    ∀ n : ℕ, Subsingleton (Sheaf.H.{u+1} F n) := sorry

end

/-! ## C5/proper-base-change-bounded, C5/proper-base-change-unbounded (ECD Theorem 19.2) -/

/-- DiamondEtaleCohomology:C5/proper-base-change-bounded (ECD Theorem 19.2, `nΛ = 0` with `n` prime
to `p`): for proper `f : Y' → Y` and an open immersion `j : U ⊂ Y`, `j_! Rg_* A → Rf_* j'_! A` is an
isomorphism for every `A ∈ D⁺_ét(U', Λ)`. -/
theorem properBaseChangeBounded (n : ℕ) (hn : Nat.Coprime n S.p) (hΛ : (n : Λ) = 0) {Y' Y : S.V}
    (f : Y' ⟶ Y) (hf : IsProper S f) (W : TopologicalSpace.Opens (S.pts.obj Y))
    (A : DetCat S Λ (etSrc S (etBaseChange S (openSub S Y W) f)))
    (hA : DerivedCategory.TStructure.t.plus A.obj) : IsIso ((pbcMap S Λ f W).app A) := sorry

/-- ECD Theorem 19.2, case `f` quasi-pro-étale. -/
theorem properBaseChangeBounded_qproet {Y' Y : S.V} (f : Y' ⟶ Y) (hf : IsProper S f)
    (hfq : IsQproetV S f) (W : TopologicalSpace.Opens (S.pts.obj Y))
    (A : DetCat S Λ (etSrc S (etBaseChange S (openSub S Y W) f)))
    (hA : DerivedCategory.TStructure.t.plus A.obj) : IsIso ((pbcMap S Λ f W).app A) := sorry

/-- DiamondEtaleCohomology:C5/proper-base-change-unbounded (ECD Theorem 19.2, unbounded): if moreover
`Rf_*` has finite cohomological dimension `N` on sheaves, the exchange map is an isomorphism on all
of `D_ét(U', Λ)` (case `nΛ = 0`, `n` prime to `p`). -/
theorem properBaseChangeUnbounded (n : ℕ) (hn : Nat.Coprime n S.p) (hΛ : (n : Λ) = 0) {Y' Y : S.V}
    (f : Y' ⟶ Y) (hf : IsProper S f) (W : TopologicalSpace.Opens (S.pts.obj Y)) (N : ℕ)
    (hN : ∀ A : DetCat S Λ Y', DerivedCategory.TStructure.t.IsLE A.obj 0 →
      DerivedCategory.TStructure.t.IsGE A.obj 0 → ∀ i : ℤ, (N : ℤ) < i →
        IsZero ((DerivedCategory.homologyFunctor _ i).obj ((push S Λ f).obj A).obj))
    (A : DetCat S Λ (etSrc S (etBaseChange S (openSub S Y W) f))) :
    IsIso ((pbcMap S Λ f W).app A) := sorry

/-- ECD Theorem 19.2, unbounded, case `f` quasi-pro-étale. -/
theorem properBaseChangeUnbounded_qproet {Y' Y : S.V} (f : Y' ⟶ Y) (hf : IsProper S f)
    (hfq : IsQproetV S f) (W : TopologicalSpace.Opens (S.pts.obj Y)) (N : ℕ)
    (hN : ∀ A : DetCat S Λ Y', DerivedCategory.TStructure.t.IsLE A.obj 0 →
      DerivedCategory.TStructure.t.IsGE A.obj 0 → ∀ i : ℤ, (N : ℤ) < i →
        IsZero ((DerivedCategory.homologyFunctor _ i).obj ((push S Λ f).obj A).obj))
    (A : DetCat S Λ (etSrc S (etBaseChange S (openSub S Y W) f))) :
    IsIso ((pbcMap S Λ f W).app A) := sorry

/-! ## C6: invariance under change of algebraically closed base field (ECD Theorem 19.5)

Geometric points `Spa(C, C⁺)` (`C` algebraically closed complete nonarchimedean, `C⁺` open and bounded)
are the connected strictly totally disconnected spaces (`[ConnectedSpace |X|]`); a map between two of
them is induced by an extension `C ⊂ C'` with `C⁺ ⊂ C'⁺`. The small v-stacks `Spd k` of discrete
fields and the t-adic data of Theorem 19.5 (ii) are supplier data. -/

/-- `Spd k' → Spd k` for an extension of discrete fields (supplier data). -/
def spdDiscMap {k k' : Type u} [Field k] [Field k'] (φ : k →+* k') : spdDisc S k' ⟶ spdDisc S k :=
  sorry

/-- `Spa(C, C⁺)` for `C` the completed algebraic closure of `k((t))` and a fixed open and bounded
valuation subring `C⁺ ⊇ k`, over `Spd k` (supplier data). -/
def tAdicPoint (k : Type u) [Field k] : S.Std := sorry
def tAdicPointMap (k : Type u) [Field k] : stdV S (tAdicPoint S k) ⟶ spdDisc S k := sorry

/-- The affinoid perfectoid annuli `Y'_n = {|t|^n ≤ |ϖ| ≤ |t|^{1/n}} ⊂ Y' = Y ×_k Spa(C, C⁺)` for a
strictly totally disconnected `Y = Spa(A, A⁺)` over `k` (supplier data; the pseudouniformizer `ϖ` of
`A` is a supplier choice). -/
def annulusOpen (k : Type u) [Field k] (X : S.Std) (π : stdV S X ⟶ spdDisc S k) (m : ℕ) :
    TopologicalSpace.Opens (S.pts.obj (pullback π (tAdicPointMap S k))) := sorry

/-- The structure map `f_m : Y'_m → Y` of the annulus. -/
abbrev annulusMap (k : Type u) [Field k] (X : S.Std) (π : stdV S X ⟶ spdDisc S k) (m : ℕ) :
    openSubV S _ (annulusOpen S k X π m) ⟶ stdV S X :=
  openSubIncl S _ (annulusOpen S k X π m) ≫ pullback.fst π (tAdicPointMap S k)

/-- DiamondEtaleCohomology:C6/invariance-complete-extension (ECD Theorem 19.5 (iii)): for `Y` over
`Spa(C, C⁺)`, a surjective `Spa(C', C'⁺) → Spa(C, C⁺)` of geometric points and
`Y' = Y ×_{Spa(C, C⁺)} Spa(C', C'⁺)`, pullback `D_ét(Y, Λ) → D_ét(Y', Λ)` is fully faithful
(`nΛ = 0`, `n` prime to `p`). -/
theorem invarianceCompleteExtension (n : ℕ) (hn : Nat.Coprime n S.p) (hΛ : (n : Λ) = 0)
    (X X' : S.Std) [ConnectedSpace (S.pts.obj (stdV S X))] [ConnectedSpace (S.pts.obj (stdV S X'))]
    (q : stdV S X' ⟶ stdV S X) (hq : Function.Surjective (S.pts.map q)) {Y : S.V}
    (π : Y ⟶ stdV S X) : Nonempty (pull S Λ (pullback.fst π q)).FullyFaithful := sorry

/-- DiamondEtaleCohomology:C6/annulus-exhaustion (ECD proof of Theorem 19.5 (ii)): `Y'` is the
increasing union of the annuli `Y'_m`, and `D_ét(Y, Λ) → D_ét(Y', Λ)` is fully faithful as soon as,
for every `m` and every geometric point `x : Spa(C', C'⁺) → Y`,
`RΓ(Spa(C', C'⁺), x^*A) → RΓ(Y'_m ×_Y Spa(C', C'⁺), f_m^*A)` is an isomorphism for `A ∈ D⁺_ét(Y, Λ)`. -/
theorem annulusExhaustion (k : Type u) [Field k] [IsAlgClosed k] [CharP k S.p] (X : S.Std)
    (π : stdV S X ⟶ spdDisc S k) :
    Monotone (annulusOpen S k X π) ∧ (⨆ m, annulusOpen S k X π m) = ⊤ ∧
    ((∀ (m : ℕ) (X' : S.Std), ConnectedSpace (S.pts.obj (stdV S X')) →
        ∀ (x : stdV S X' ⟶ stdV S X) (A : DetCat S Λ (stdV S X)),
          DerivedCategory.TStructure.t.plus A.obj →
            IsIso ((rGammaPull S Λ (pullback.snd (annulusMap S k X π m) x)).app ((pull S Λ x).obj A))) →
      Nonempty (pull S Λ (pullback.fst π (tAdicPointMap S k))).FullyFaithful) := sorry

/-- DiamondEtaleCohomology:C6/annulus-extension-by-zero-vanishing (ECD proof of Theorem 19.5 (ii)): for
a geometric point `Y = Spa(C', C'⁺)` over `k` with closed point `s` and `j : U = Y ∖ {s} ⊂ Y`, and
`A₀ ∈ D⁺_ét(U, Λ)` (`nΛ = 0`, `n` prime to `p`): `RΓ(Y'_m, f_m^* j_! A₀) = 0` and `RΓ(Y, j_! A₀) = 0`. -/
theorem annulusExtensionByZeroVanishing (n : ℕ) (hn : Nat.Coprime n S.p) (hΛ : (n : Λ) = 0)
    (k : Type u) [Field k] [IsAlgClosed k] [CharP k S.p] (X : S.Std)
    [ConnectedSpace (S.pts.obj (stdV S X))] (π : stdV S X ⟶ spdDisc S k)
    (z : S.pts.obj (stdV S X)) (hz : IsClosed ({z} : Set (S.pts.obj (stdV S X)))) (m : ℕ)
    (A₀ : DetCat S Λ (openSubV S _ ⟨{z}ᶜ, hz.isOpen_compl⟩))
    (hA : DerivedCategory.TStructure.t.plus A₀.obj) :
    IsZero ((rGamma S Λ _).obj ((pull S Λ (annulusMap S k X π m)).obj
      ((etaleShriek S Λ (openSub S _ ⟨{z}ᶜ, hz.isOpen_compl⟩)).obj A₀))) ∧
    IsZero ((rGamma S Λ _).obj ((etaleShriek S Λ (openSub S _ ⟨{z}ᶜ, hz.isOpen_compl⟩)).obj A₀)) :=
  sorry

/-- DiamondEtaleCohomology:C6/perfectoid-annulus-cohomology (ECD proof of Theorem 19.5 (ii)): over a
geometric point `Spa(C', C'⁺)` over `k`, `RΓ(Y'_m, Λ) = Λ` in degree `0` for `ℓΛ = 0`, `ℓ ≠ p` prime
(the packet takes `Λ = F_ℓ`). -/
theorem perfectoidAnnulusCohomology (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ S.p) (hΛ : (ℓ : Λ) = 0)
    (k : Type u) [Field k] [IsAlgClosed k] [CharP k S.p] (X : S.Std)
    [ConnectedSpace (S.pts.obj (stdV S X))] (π : stdV S X ⟶ spdDisc S k) (m : ℕ) :
    Nonempty ((rGamma S Λ _).obj (unitObj S Λ (openSubV S _ (annulusOpen S k X π m))) ≅
      (DerivedCategory.singleFunctor _ 0).obj (ModuleCat.of Λ Λ)) := sorry

/-- DiamondEtaleCohomology:C6/invariance-discrete-to-complete (ECD Theorem 19.5 (ii)): for `Y` over a
discrete algebraically closed field `k` of characteristic `p`, a geometric point `Spa(C, C⁺)` over `k`
and `Y' = Y ×_k Spa(C, C⁺)`, pullback `D_ét(Y, Λ) → D_ét(Y', Λ)` is fully faithful. -/
theorem invarianceDiscreteToComplete (n : ℕ) (hn : Nat.Coprime n S.p) (hΛ : (n : Λ) = 0)
    (k : Type u) [Field k] [IsAlgClosed k] [CharP k S.p] (XC : S.Std)
    [ConnectedSpace (S.pts.obj (stdV S XC))] (c : stdV S XC ⟶ spdDisc S k) {Y : S.V}
    (π : Y ⟶ spdDisc S k) : Nonempty (pull S Λ (pullback.fst π c)).FullyFaithful := sorry

/-- DiamondEtaleCohomology:C6/invariance-discrete-extension (ECD Theorem 19.5 (i)): for an extension
`k ⊂ k'` of discrete algebraically closed fields of characteristic `p` and `Y' = Y ×_k k'`, pullback
`D_ét(Y, Λ) → D_ét(Y', Λ)` is fully faithful. -/
theorem invarianceDiscreteExtension (n : ℕ) (hn : Nat.Coprime n S.p) (hΛ : (n : Λ) = 0)
    {k k' : Type u} [Field k] [Field k'] [IsAlgClosed k] [IsAlgClosed k'] [CharP k S.p]
    (φ : k →+* k') {Y : S.V} (π : Y ⟶ spdDisc S k) :
    Nonempty (pull S Λ (pullback.fst π (spdDiscMap S φ))).FullyFaithful := sorry

/-- The conclusion of ECD Theorem 19.5 for the projection `f : Y' → Y`: `RΓ(Y, A) → RΓ(Y', f^*A)` is an
isomorphism for all `A ∈ D_ét(Y, Λ)`, pullback is a bijection between the open and closed subsets of
`|Y|` and of `|Y'|`, and `Y` is connected iff `Y'` is. -/
def CohomologyAndPi0Invariant {Y' Y : S.V} (f : Y' ⟶ Y) : Prop :=
  (∀ A : DetCat S Λ Y, IsIso ((rGammaPull S Λ f).app A)) ∧
    (∀ s : Set (S.pts.obj Y'), IsClopen s →
      ∃! t : Set (S.pts.obj Y), IsClopen t ∧ (S.pts.map f) ⁻¹' t = s) ∧
    (ConnectedSpace (S.pts.obj Y) ↔ ConnectedSpace (S.pts.obj Y'))

/-- DiamondEtaleCohomology:C6/cohomology-invariance (ECD Theorem 19.5, last part), in the situation
of (iii) (extension of complete algebraically closed base fields). -/
theorem cohomologyInvariance (n : ℕ) (hn : Nat.Coprime n S.p) (hΛ : (n : Λ) = 0)
    (X X' : S.Std) [ConnectedSpace (S.pts.obj (stdV S X))] [ConnectedSpace (S.pts.obj (stdV S X'))]
    (q : stdV S X' ⟶ stdV S X) (hq : Function.Surjective (S.pts.map q)) {Y : S.V}
    (π : Y ⟶ stdV S X) : CohomologyAndPi0Invariant S Λ (pullback.fst π q) := sorry

/-- ECD Theorem 19.5, last part, in the situation of (ii) (discrete to complete base field). -/
theorem cohomologyInvariance_discreteToComplete (n : ℕ) (hn : Nat.Coprime n S.p)
    (hΛ : (n : Λ) = 0) (k : Type u) [Field k] [IsAlgClosed k] [CharP k S.p] (XC : S.Std)
    [ConnectedSpace (S.pts.obj (stdV S XC))] (c : stdV S XC ⟶ spdDisc S k) {Y : S.V}
    (π : Y ⟶ spdDisc S k) : CohomologyAndPi0Invariant S Λ (pullback.fst π c) := sorry

/-- ECD Theorem 19.5, last part, in the situation of (i) (extension of discrete base fields). -/
theorem cohomologyInvariance_discreteExtension (n : ℕ) (hn : Nat.Coprime n S.p) (hΛ : (n : Λ) = 0)
    {k k' : Type u} [Field k] [Field k'] [IsAlgClosed k] [IsAlgClosed k'] [CharP k S.p]
    (φ : k →+* k') {Y : S.V} (π : Y ⟶ spdDisc S k) :
    CohomologyAndPi0Invariant S Λ (pullback.fst π (spdDiscMap S φ)) := sorry

end TauCeti.DiamondEtale


/-! # Stages C4 (ECD §18, proper and partially proper maps, canonical compactifications) and
C7 (ECD §20 without 20.9, 20.10, 20.17: constructible sheaves and perfect-constructible complexes) -/
-- EXTRA IMPORTS: Mathlib.Topology.Sheaves.Functors, Mathlib.Topology.Sheaves.Abelian, Mathlib.Topology.Sheaves.Stalks, Mathlib.CategoryTheory.Sites.ConstantSheaf, Mathlib.CategoryTheory.Sites.Over, Mathlib.Algebra.Homology.DerivedCategory.ExactFunctor, Mathlib.CategoryTheory.Abelian.Subcategory, Mathlib.CategoryTheory.ObjectProperty.Extensions, Mathlib.CategoryTheory.ObjectProperty.Retract, Mathlib.Topology.QuasiSeparated, Mathlib.Topology.LocallyClosed, Mathlib.Topology.Spectral.Hom, Mathlib.CategoryTheory.Filtered.Basic, Mathlib.CategoryTheory.Limits.Preserves.Basic, Mathlib.RepresentationTheory.Basic, Mathlib.Topology.Algebra.Group.Defs, Mathlib.Algebra.Category.Ring.Basic, Mathlib.CategoryTheory.Sites.Monoidal, Mathlib.Algebra.Category.ModuleCat.Monoidal.Closed, Mathlib.Algebra.Category.ModuleCat.Monoidal.Symmetric
namespace TauCeti.DiamondEtale
open CategoryTheory Limits Topology
attribute [local instance] HasDerivedCategory.standard
variable (S : Carriers.{u}) (Λ : Type u) [CommRing Λ]

/-! ## C4: proper and partially proper maps (ECD §18)

Throughout, the 0-truncatedness clauses of ECD §18 (maps of v-sheaves rather than v-stacks) are
not typable against `Carriers` and are omitted, as in the prelude's `IsProper`. -/

/-! ### Auxiliary notions over the carriers -/

/-- The v-sheaf `T̲ : X ↦ C(|X|, T)` attached to a topological space (owned by DiamondsAndVStacks;
for locally compact Hausdorff `T` it is a small v-sheaf). -/
def ofTop : TopCat.{u} ⥤ S.V := sorry

/-- A closed immersion of small v-sheaves: an injective, quasicompact, universally closed map
(ECD Definition 10.7(ii); equivalent by ECD Corollary 10.6 and the reduction in Definition 18.1). -/
def IsClosedImmersion {X Y : S.V} (f : X ⟶ Y) : Prop :=
  Mono f ∧ IsQuasicompactMap S f ∧ IsUniversallyClosed S f

/-- Surjectivity of a map of small v-stacks as a map of v-stacks (ECD §12, before Lemma 12.11):
for every object `V → Y` of the v-site of `Y`, the maps that lift to `Y'` generate a covering
sieve. -/
def IsSurjectiveMap {Y' Y : S.V} (f : Y' ⟶ Y) : Prop :=
  ∀ U : S.VOver Y, Sieve.generate (fun ⦃V : S.VOver Y⦄ (_ : V ⟶ U) =>
    ∃ l : ((S.vSrc Y).obj V).left ⟶ Y', l ≫ f = ((S.vSrc Y).obj V).hom) ∈ vSite S Y U

/-- Quasi-pro-étale maps of small v-stacks (ECD Definition 10.1(i)), tested after pullback to
strictly totally disconnected spaces: the pullback is (isomorphic over the base to) an object of
the quasi-pro-étale site at the cutoff of `Carriers`. The "locally separated" clause of ECD 10.1(i)
is not typable against `Carriers` and is omitted. -/
def IsQuasiProEtaleMap {Y' Y : S.V} (f : Y' ⟶ Y) : Prop :=
  ∀ (X : S.Std) (g : S.ofLS (S.ofStd X) ⟶ Y),
    ∃ (W : S.QpOver (S.lsDia.obj (S.ofStd X))) (e : ((S.qpSrc _).obj W).left ≅ pullback f g),
      e.hom ≫ pullback.snd f g = ((S.qpSrc _).obj W).hom

/-- Separated v-stacks: `Y → ∗` is separated (ECD Definition 10.7, last sentence). -/
def IsSeparatedStack : ObjectProperty S.V := fun Y => IsSeparatedMap S (terminal.from Y)

/-- C4/partially-proper-map API: a v-stack `Y` is partially proper if `Y → ∗` is (ECD 18.4). -/
def IsPartiallyProperStack (Y : S.V) : Prop := IsPartiallyProper S (terminal.from Y)

/-- The valuative criterion for perfectoid field pairs `(K, K⁺)`: every square
`Spa(K, O_K) → X`, `Spa(K, K⁺) → Y` has a unique lift `Spa(K, K⁺) → X`. -/
def UniqueLiftsField {X Y : S.V} (f : X ⟶ Y) : Prop :=
  ∀ (K : S.FieldPair) (a : S.spaCirc (S.fieldTate K) ⟶ X) (b : S.spa (S.fieldTate K) ⟶ Y),
    a ≫ f = S.circIncl (S.fieldTate K) ≫ b →
      ∃! c : S.spa (S.fieldTate K) ⟶ X, S.circIncl (S.fieldTate K) ≫ c = a ∧ c ≫ f = b

/-- The lifting property for perfectoid Tate pairs `(R, R⁺)`: every square `Spa(R, R°) → X`,
`Spa(R, R⁺) → Y` has a unique lift `Spa(R, R⁺) → X`. -/
def UniqueLiftsTate {X Y : S.V} (f : X ⟶ Y) : Prop :=
  ∀ (P : S.TatePair) (a : S.spaCirc P ⟶ X) (b : S.spa P ⟶ Y),
    a ≫ f = S.circIncl P ≫ b → ∃! c : S.spa P ⟶ X, S.circIncl P ≫ c = a ∧ c ≫ f = b

/-- Taut spaces (Huber, Definition 5.1.2, recalled before the proof of ECD Proposition 18.10):
quasiseparated, and the closure of every quasicompact open subset is quasicompact. -/
def IsTaut (T : Type*) [TopologicalSpace T] : Prop :=
  QuasiSeparatedSpace T ∧ ∀ U : Set T, IsOpen U → IsCompact U → IsCompact (closure U)

/-- The perfectoid open unit disc over `Spa(K, O_K)` (owned by PerfectoidSpaces; used in the
tests of C4/proper-map and C4/partially-proper-map). -/
def openUnitDisc (K : S.FieldPair) : Over (S.spaCirc (S.fieldTate K)) := sorry

/-- The perfectoid closed unit disc `Spa(K⟨T^{1/p^∞}⟩, O_K⟨T^{1/p^∞}⟩)` over `Spa(K, O_K)` (owned by
PerfectoidSpaces). -/
def closedUnitDisc (K : S.FieldPair) : Over (S.spaCirc (S.fieldTate K)) := sorry

/-! ### C4/proper-map, closed immersions, the topological comparison, the valuative criterion -/

/-- C4/proper-map API: universal closedness may be tested on strictly totally disconnected
perfectoid spaces (ECD Definition 18.1 and the remark after it). -/
theorem IsProper.iff_std {X Y : S.V} (f : X ⟶ Y) :
    IsProper S f ↔ IsQuasicompactMap S f ∧ IsSeparatedMap S f ∧
      ∀ (Z : S.Std) (g : S.ofLS (S.ofStd Z) ⟶ Y), IsClosedMap (S.pts.map (pullback.snd f g)) := by
  sorry

/-- C4/proper-map API: composites of proper maps are proper. -/
theorem IsProper.comp {X Y Z : S.V} (f : X ⟶ Y) (g : Y ⟶ Z) (hf : IsProper S f)
    (hg : IsProper S g) : IsProper S (f ≫ g) := by
  sorry

/-- C4/proper-map API: proper maps are stable under base change. -/
theorem IsProper.baseChange {X Y Z : S.V} (f : X ⟶ Y) (g : Z ⟶ Y) (hf : IsProper S f) :
    IsProper S (pullback.snd f g) := by
  sorry

/-- C4/proper-map API: if `g ∘ f` is proper and `g` is separated, then `f` is proper. -/
theorem IsProper.of_comp {X Y Z : S.V} (f : X ⟶ Y) (g : Y ⟶ Z) (hfg : IsProper S (f ≫ g))
    (hg : IsSeparatedMap S g) : IsProper S f := by
  sorry

/-- C4/proper-map API: the valuative criterion (ECD Proposition 18.3, first part).
Omitted hypothesis: f is 0-truncated (not typable against `Carriers`). -/
theorem IsProper.iff_valuative {X Y : S.V} (f : X ⟶ Y) :
    IsProper S f ↔ IsQuasicompactMap S f ∧ IsQuasicompactMap S (pullback.diagonal f) ∧
      UniqueLiftsField S f := by
  sorry

/-- C4/proper-map API: proper maps are partially proper (ECD Proposition 18.3, second part). -/
theorem IsProper.partiallyProper {X Y : S.V} (f : X ⟶ Y) (hf : IsProper S f) :
    IsPartiallyProper S f := by
  sorry

/-- C4/proper-map API: for proper `f`, the map `|f| : |X| → |Y|` is closed. -/
theorem IsProper.isClosedMap {X Y : S.V} (f : X ⟶ Y) (hf : IsProper S f) :
    IsClosedMap (S.pts.map f) := by
  sorry

/-- test isProper_id (degenerate): the identity of a v-stack is proper. -/
example (Y : S.V) : IsProper S (𝟙 Y) := by sorry

/-- test isProper_closedImmersion (computation): a closed immersion of v-sheaves is proper. -/
example {X Y : S.V} (f : X ⟶ Y) (hf : IsClosedImmersion S f) : IsProper S f := by sorry

/-- test isProper_topological (compatibility): for a map of locally compact Hausdorff spaces, the
induced map of v-sheaves is proper iff the map is proper (Mathlib `IsProperMap`). -/
example {T' T : TopCat.{u}} (f : T' ⟶ T) [LocallyCompactSpace T'] [T2Space T']
    [LocallyCompactSpace T] [T2Space T] : IsProper S ((ofTop S).map f) ↔ IsProperMap f := by
  sorry

/-- test isProper_open_not (non-example): for `K⁺ ⊊ O_K` (equivalently, the inclusion
`Spa(K, O_K) → Spa(K, K⁺)` is not an isomorphism), this open immersion is quasicompact and
separated but not proper. -/
example (K : S.FieldPair) (hK : ¬ IsIso (S.circIncl (S.fieldTate K))) :
    IsQuasicompactMap S (S.circIncl (S.fieldTate K)) ∧ IsSeparatedMap S (S.circIncl (S.fieldTate K)) ∧
      ¬ IsProper S (S.circIncl (S.fieldTate K)) := by
  sorry

/-- test isProper_openDisc_not (non-example): the perfectoid open unit disc over `Spa(K, O_K)` is
partially proper but not quasicompact, hence not proper. -/
example (K : S.FieldPair) :
    IsPartiallyProper S (openUnitDisc S K).hom ∧ ¬ IsQuasicompactMap S (openUnitDisc S K).hom ∧
      ¬ IsProper S (openUnitDisc S K).hom := by
  sorry

/-- DiamondEtaleCohomology:C4/closed-immersion-proper (ECD Remark 18.2) -/
theorem closedImmersionProper {X Y : S.V} (f : X ⟶ Y) (hf : IsClosedImmersion S f) :
    IsProper S f := by
  sorry

/-- DiamondEtaleCohomology:C4/locally-compact-hausdorff-proper (ECD Remark 18.2) -/
theorem locallyCompactHausdorffProper {T' T : TopCat.{u}} (f : T' ⟶ T) [LocallyCompactSpace T']
    [T2Space T'] [LocallyCompactSpace T] [T2Space T] :
    IsProper S ((ofTop S).map f) ↔ IsProperMap f := by
  sorry

/-- DiamondEtaleCohomology:C4/valuative-criterion-proper (ECD Proposition 18.3)
Omitted hypothesis in the criterion: f is 0-truncated (not typable against `Carriers`);
quasiseparatedness is quasicompactness of the diagonal. -/
theorem valuativeCriterionProper {X Y : S.V} (f : X ⟶ Y) :
    (IsProper S f ↔ IsQuasicompactMap S f ∧ IsQuasicompactMap S (pullback.diagonal f) ∧
      UniqueLiftsField S f) ∧ (IsProper S f → UniqueLiftsTate S f) := by
  sorry

/-! ### C4/partially-proper-map, C4/proper-iff-partially-proper-qc, C4/proper-stability -/

/-- C4/partially-proper-map API: by the valuative criterion of separatedness (ECD Proposition
10.9), "separated" may be replaced by "quasiseparated" when the lifts are required to be unique.
Omitted hypothesis: f is 0-truncated (not typable against `Carriers`). -/
theorem IsPartiallyProper.iff_qs {X Y : S.V} (f : X ⟶ Y) :
    IsPartiallyProper S f ↔ IsQuasicompactMap S (pullback.diagonal f) ∧ UniqueLiftsTate S f := by
  sorry

/-- C4/partially-proper-map API: composites of partially proper maps are partially proper. -/
theorem IsPartiallyProper.comp {X Y Z : S.V} (f : X ⟶ Y) (g : Y ⟶ Z)
    (hf : IsPartiallyProper S f) (hg : IsPartiallyProper S g) : IsPartiallyProper S (f ≫ g) := by
  sorry

/-- C4/partially-proper-map API: partially proper maps are stable under base change. -/
theorem IsPartiallyProper.baseChange {X Y Z : S.V} (f : X ⟶ Y) (g : Z ⟶ Y)
    (hf : IsPartiallyProper S f) : IsPartiallyProper S (pullback.snd f g) := by
  sorry

/-- C4/partially-proper-map API: proper maps are partially proper. -/
theorem IsPartiallyProper.of_isProper {X Y : S.V} (f : X ⟶ Y) (hf : IsProper S f) :
    IsPartiallyProper S f :=
  IsProper.partiallyProper S f hf

/-- DiamondEtaleCohomology:C4/proper-iff-partially-proper-qc (ECD Remark 18.5) -/
theorem properIffPartiallyProperQc {X Y : S.V} (f : X ⟶ Y) :
    IsProper S f ↔ IsPartiallyProper S f ∧ IsQuasicompactMap S f := by
  sorry

/-- C4/partially-proper-map API: proper iff partially proper and quasicompact (node
C4/proper-iff-partially-proper-qc). -/
theorem isProper_iff_partiallyProper_qc {X Y : S.V} (f : X ⟶ Y) :
    IsProper S f ↔ IsPartiallyProper S f ∧ IsQuasicompactMap S f :=
  properIffPartiallyProperQc S f

/-- test isPartiallyProper_id (degenerate): identities are partially proper. -/
example (Y : S.V) : IsPartiallyProper S (𝟙 Y) := by sorry

-- test isPartiallyProper_point_residue (computation): for C algebraically closed, Spa(C, O_C) → ∗
-- is partially proper iff the residue field of C is algebraic over F_p. Not stated: the residue
-- field of a perfectoid field pair is not part of the `Carriers` data, and without that
-- hypothesis neither side of the equivalence is determined.

/-- test isPartiallyProper_openDisc (computation): the perfectoid open unit disc over
`Spa(K, O_K)` is partially proper over `Spa(K, O_K)`. -/
example (K : S.FieldPair) : IsPartiallyProper S (openUnitDisc S K).hom := by sorry

/-- test isPartiallyProper_closedDisc_not (non-example): the perfectoid closed unit disc over
`Spa(K, O_K)` is quasicompact and separated but not partially proper. -/
example (K : S.FieldPair) :
    IsQuasicompactMap S (closedUnitDisc S K).hom ∧ IsSeparatedMap S (closedUnitDisc S K).hom ∧
      ¬ IsPartiallyProper S (closedUnitDisc S K).hom := by
  sorry

/-- DiamondEtaleCohomology:C4/proper-stability (ECD, proof of Theorem 19.2): proper and partially
proper maps are stable under composition and base change, the cancellation property holds for
a separated second factor, and a fibre product of two proper maps is proper. -/
theorem properStability :
    (∀ {X Y Z : S.V} (f : X ⟶ Y) (g : Y ⟶ Z), IsProper S f → IsProper S g →
      IsProper S (f ≫ g)) ∧
    (∀ {X Y Z : S.V} (f : X ⟶ Y) (g : Z ⟶ Y), IsProper S f → IsProper S (pullback.snd f g)) ∧
    (∀ {X Y Z : S.V} (f : X ⟶ Y) (g : Y ⟶ Z), IsProper S (f ≫ g) → IsSeparatedMap S g →
      IsProper S f) ∧
    (∀ {X Y Z : S.V} (f : X ⟶ Y) (g : Y ⟶ Z), IsPartiallyProper S f → IsPartiallyProper S g →
      IsPartiallyProper S (f ≫ g)) ∧
    (∀ {X Y Z : S.V} (f : X ⟶ Y) (g : Z ⟶ Y), IsPartiallyProper S f →
      IsPartiallyProper S (pullback.snd f g)) ∧
    (∀ {X Y Z : S.V} (f : X ⟶ Y) (g : Y ⟶ Z), IsPartiallyProper S (f ≫ g) →
      IsSeparatedMap S g → IsPartiallyProper S f) ∧
    (∀ {X Y Z : S.V} (f : X ⟶ Z) (g : Y ⟶ Z), IsProper S f → IsProper S g →
      IsProper S (pullback.fst f g ≫ f)) := by
  sorry

/-! ### C4/compactification-of-separated-sheaf: the envelope `Ȳ` of a separated v-sheaf -/

/-- The envelope `Ȳ` of a separated v-sheaf, `Ȳ(R, R⁺) = Y(R, R°)` on totally disconnected
`Spa(R, R⁺)`. It is the canonical compactification of `Y → ∗` (ECD after Proposition 18.6:
`Ȳ′^{/Y} = Ȳ′ ×_Ȳ Y`, and `∗̄ = ∗`). -/
abbrev cptAbs (Y : S.V) : S.V := cpt S (terminal.from Y)

/-- The injection `Y → Ȳ`. -/
abbrev toCptAbs (Y : S.V) : Y ⟶ cptAbs S Y := toCpt S (terminal.from Y)

/-- C4/compactification-of-separated-sheaf API: a map `Y′ → Y` of separated v-sheaves induces
`Ȳ′ → Ȳ`. Separatedness of `Y′` and `Y` is a hypothesis of the construction; it is omitted from
this data declaration (as for `cpt`) and kept in the statements below. -/
def cpt.map {Y' Y : S.V} (f : Y' ⟶ Y) : cptAbs S Y' ⟶ cptAbs S Y := sorry

theorem cpt.map_id (Y : S.V) : cpt.map S (𝟙 Y) = 𝟙 (cptAbs S Y) := by sorry

theorem cpt.map_comp {Y'' Y' Y : S.V} (f : Y'' ⟶ Y') (g : Y' ⟶ Y) :
    cpt.map S (f ≫ g) = cpt.map S f ≫ cpt.map S g := by
  sorry

/-- Naturality of `Y → Ȳ`. -/
theorem cpt.map_toCpt {Y' Y : S.V} (f : Y' ⟶ Y) :
    toCptAbs S Y' ≫ cpt.map S f = f ≫ toCptAbs S Y := by
  sorry

/-- The functor `Y ↦ Ȳ` (meaningful on separated v-sheaves). -/
def cptFunctor : S.V ⥤ S.V where
  obj := cptAbs S
  map f := cpt.map S f
  map_id Y := cpt.map_id S Y
  map_comp f g := cpt.map_comp S f g

/-- The perfectoid Tate pair `(R, (R⁺)′)`, where `(R⁺)′ ⊂ R⁺` is the smallest open and integrally
closed subring (the integral closure of `F_p + R°°`); owned by PerfectoidSpaces P4. -/
def minIntPair (P : S.TatePair) : S.TatePair := sorry

/-- The map `Spa(R, R⁺) → Spa(R, (R⁺)′)` induced by `(R⁺)′ ⊂ R⁺`. -/
def minIntIncl (P : S.TatePair) : S.spa P ⟶ S.spa (minIntPair S P) := sorry

/-- C4/compactification-of-separated-sheaf API: `Ȳ′^{/Y} = Ȳ′ ×_Ȳ Y` for a map of separated
v-sheaves. -/
theorem cpt.relative_eq {Y' Y : S.V} (f : Y' ⟶ Y) (hY' : IsSeparatedStack S Y')
    (hY : IsSeparatedStack S Y) :
    ∃ e : cpt S f ≅ pullback (cpt.map S f) (toCptAbs S Y),
      e.hom ≫ pullback.snd _ _ = cptMap S f := by
  sorry

/-- DiamondEtaleCohomology:C4/compactification-affinoid-formula (ECD Proposition 18.7(iv)) -/
theorem compactificationAffinoidFormula (P : S.TatePair) :
    ∃ e : cptAbs S (S.spa P) ≅ S.spa (minIntPair S P), toCptAbs S (S.spa P) ≫ e.hom = minIntIncl S P := by
  sorry

/-- C4/compactification-of-separated-sheaf API: for `Y = Spa(R, R⁺)`, `Ȳ = Spa(R, (R⁺)′)` (node
C4/compactification-affinoid-formula). -/
theorem cpt.affinoid (P : S.TatePair) :
    ∃ e : cptAbs S (S.spa P) ≅ S.spa (minIntPair S P), toCptAbs S (S.spa P) ≫ e.hom = minIntIncl S P :=
  compactificationAffinoidFormula S P

/-- C4/compactification-of-separated-sheaf API: every map from a separated `Y` to a partially
proper `Z` extends uniquely along `Y → Ȳ`. -/
theorem cpt.lift {Y Z : S.V} (hY : IsSeparatedStack S Y) (hZ : IsPartiallyProperStack S Z)
    (g : Y ⟶ Z) : ∃! h : cptAbs S Y ⟶ Z, toCptAbs S Y ≫ h = g := by
  sorry

/-- test cpt_affinoid (computation): for `Y = Spa(R, R⁺)`, `Ȳ = Spa(R, (R⁺)′)`. -/
example (P : S.TatePair) :
    Nonempty (cptAbs S (S.spa P) ≅ S.spa (minIntPair S P)) := by sorry

/-- test cpt_of_partiallyProper (degenerate): if `Y` is partially proper, `Y → Ȳ` is an
isomorphism. -/
example (Y : S.V) (hY : IsPartiallyProperStack S Y) : IsIso (toCptAbs S Y) := by sorry

-- test cpt_point (computation): for C algebraically closed with residue field not algebraic over
-- F_p, Spa(C, O_C)‾ = Spa(C, (O_C)′) ≠ Spa(C, O_C). Not stated: algebraic closedness and the residue
-- field of a perfectoid field pair are not part of the `Carriers` data; the formula itself is the
-- test cpt_affinoid.

/-- test cpt_not_spatial_preserving (non-example): the envelope of a separated diamond is a
diamond; that it need not be spatial is not stated (spatiality of `Ȳ` is not asserted anywhere). -/
example (Y : S.V) (hY : IsSeparatedStack S Y) (hd : S.diaV.essImage Y) :
    S.diaV.essImage (cptAbs S Y) := by
  sorry

/-- DiamondEtaleCohomology:C4/compactification-limits-surjectivity (ECD Proposition 18.7(v),(vi))
Omitted hypothesis: the v-sheaves are 0-truncated (limits are taken among separated small
v-stacks of `Carriers`). -/
theorem compactificationLimitsSurjectivity :
    PreservesLimits ((IsSeparatedStack S).ι ⋙ cptFunctor S) ∧
    ∀ {Y' Y : S.V} (f : Y' ⟶ Y), IsSeparatedStack S Y' → IsSeparatedStack S Y →
      IsSurjectiveMap S f → IsSurjectiveMap S (cpt.map S f) := by
  sorry

/-- DiamondEtaleCohomology:C4/compactification-partially-proper (ECD Proposition 18.7(i),(vii)) -/
theorem compactificationPartiallyProper :
    (∀ Y : S.V, IsSeparatedStack S Y → IsPartiallyProperStack S (cptAbs S Y)) ∧
    ∀ {Y' Y : S.V} (f : Y' ⟶ Y), IsSeparatedStack S Y' → IsSeparatedStack S Y →
      IsQuasicompactMap S f → IsProper S (cpt.map S f) := by
  sorry

/-- DiamondEtaleCohomology:C4/compactification-small-diamond (ECD Proposition 18.7(ii),(iii),(viii))
Part (ii) (smallness) is built into the typing: `cpt` takes values in the small v-stacks `S.V`.
Spatiality is not asserted. -/
theorem compactificationSmallDiamond :
    (∀ Y : S.V, IsSeparatedStack S Y → S.diaV.essImage Y → S.diaV.essImage (cptAbs S Y)) ∧
    ∀ {Y' Y : S.V} (f : Y' ⟶ Y), IsSeparatedStack S Y' → IsSeparatedStack S Y →
      IsQuasiProEtaleMap S f → IsQuasiProEtaleMap S (cpt.map S f) := by
  sorry

/-! ### C4/canonical-compactification and its universal property (ECD 18.6, 18.8) -/

/-- C4/canonical-compactification API: the v-stack `Ȳ′^{/Y}` over `Y` attached to a separated
`f : Y′ → Y`, as an object of `Over Y` (the prelude's `cpt` with structure map `cptMap`).
Separatedness of `f` is a hypothesis of the construction, omitted here as in the prelude. -/
abbrev canonicalCompactification {X Y : S.V} (f : X ⟶ Y) : Over Y := Over.mk (cptMap S f)

/-- C4/canonical-compactification API: `f̄^{/Y} ∘ (Y′ → Ȳ′^{/Y}) = f`. -/
theorem canonicalCompactification.fac {X Y : S.V} (f : X ⟶ Y) :
    TauCeti.DiamondEtale.toCpt S f ≫ cptMap S f = f := by
  sorry

/-- C4/canonical-compactification API: the map `Y′ → Ȳ′^{/Y}` over `Y`. -/
def canonicalCompactification.toCpt {X Y : S.V} (f : X ⟶ Y) :
    Over.mk f ⟶ canonicalCompactification S f :=
  Over.homMk (TauCeti.DiamondEtale.toCpt S f) (canonicalCompactification.fac S f)

/-- C4/canonical-compactification API: `f̄^{/Y}` is partially proper (node
C4/canonical-compactification-universal). -/
theorem canonicalCompactification.partiallyProper {X Y : S.V} (f : X ⟶ Y)
    (hf : IsSeparatedMap S f) : IsPartiallyProper S (cptMap S f) := by
  sorry

/-- C4/canonical-compactification API: for partially proper `g : Z → Y`, every `Y`-map `Y′ → Z`
extends uniquely to `Ȳ′^{/Y} → Z`. -/
theorem canonicalCompactification.lift {X Y Z : S.V} (f : X ⟶ Y) (hf : IsSeparatedMap S f)
    (g : Z ⟶ Y) (hg : IsPartiallyProper S g) (h : X ⟶ Z) (hh : h ≫ g = f) :
    ∃! k : cpt S f ⟶ Z, TauCeti.DiamondEtale.toCpt S f ≫ k = h ∧ k ≫ g = cptMap S f := by
  sorry

/-- C4/canonical-compactification API: formation of `Ȳ′^{/Y}` commutes with base change in `Y`. -/
theorem canonicalCompactification.baseChange {X Y Y₁ : S.V} (f : X ⟶ Y) (hf : IsSeparatedMap S f)
    (g : Y₁ ⟶ Y) :
    ∃ e : cpt S (pullback.snd f g) ≅ pullback (cptMap S f) g,
      e.hom ≫ pullback.snd _ _ = cptMap S (pullback.snd f g) := by
  sorry

/-- C4/canonical-compactification API: a map `Y′₂ → Y′₁` of separated `Y`-stacks induces
`Ȳ′₂^{/Y} → Ȳ′₁^{/Y}` (separatedness omitted from this data declaration, as for `cpt`). -/
def canonicalCompactification.map {Y : S.V} {A B : Over Y} (φ : A ⟶ B) :
    canonicalCompactification S A.hom ⟶ canonicalCompactification S B.hom := sorry

theorem canonicalCompactification.map_id {Y : S.V} (A : Over Y) :
    canonicalCompactification.map S (𝟙 A) = 𝟙 _ := by
  sorry

theorem canonicalCompactification.map_comp {Y : S.V} {A B C : Over Y} (φ : A ⟶ B) (ψ : B ⟶ C) :
    canonicalCompactification.map S (φ ≫ ψ) =
      canonicalCompactification.map S φ ≫ canonicalCompactification.map S ψ := by
  sorry

/-- Naturality of `Y′ → Ȳ′^{/Y}`. -/
theorem canonicalCompactification.map_toCpt {Y : S.V} {A B : Over Y} (φ : A ⟶ B) :
    TauCeti.DiamondEtale.toCpt S A.hom ≫ (canonicalCompactification.map S φ).left =
      φ.left ≫ TauCeti.DiamondEtale.toCpt S B.hom := by
  sorry

/-- The functor `Y′ ↦ Ȳ′^{/Y}` on stacks over `Y` (meaningful on separated ones). -/
def cptOverFunctor (Y : S.V) : Over Y ⥤ Over Y where
  obj A := canonicalCompactification S A.hom
  map φ := canonicalCompactification.map S φ
  map_id A := canonicalCompactification.map_id S A
  map_comp φ ψ := canonicalCompactification.map_comp S φ ψ

/-- Separated stacks over `Y`. -/
def SepOver (Y : S.V) : ObjectProperty (Over Y) := fun A => IsSeparatedMap S A.hom

/-- C4/canonical-compactification API: if `f` is partially proper, `Y′ → Ȳ′^{/Y}` is an
isomorphism. -/
theorem canonicalCompactification.of_partiallyProper {X Y : S.V} (f : X ⟶ Y)
    (hf : IsPartiallyProper S f) : IsIso (TauCeti.DiamondEtale.toCpt S f) := by
  sorry

/-- test canonicalCompactification_id (degenerate): for `f = id_Y`, `Ȳ^{/Y} = Y`. -/
example (Y : S.V) : IsIso (TauCeti.DiamondEtale.toCpt S (𝟙 Y)) := by sorry

-- test canonicalCompactification_field (computation): for X = Spa(C, C⁺) and connected strictly
-- totally disconnected X′ = Spa(C′, C′⁺) over X, X̄′^{/X} = Spa(C′, C′°° + C⁺). Not stated: the
-- subring C′°° + C⁺ (a Tate pair built from two pairs and a map between them) is not part of the
-- `Carriers` data.

-- test canonicalCompactification_affinoid (computation): for X′ = Spa(R, R⁺) over
-- X = Spa(A, A⁺), X̄′^{/X} = Spa(R, R⁺_X) with R⁺_X the integral closure of the image of A⁺ plus
-- R°°. Not stated: the relative ring of integral elements R⁺_X is not part of the `Carriers` data;
-- the absolute case is the test cpt_affinoid.

/-- test canonicalCompactification_closedDisc (non-example): for the perfectoid closed unit disc
`D` over `Spa(K, O_K)`, `D → D̄^{/Spa(K, O_K)}` is not an isomorphism (the open-immersion clause of
the packet test is not stated: open immersions are not part of the `Carriers` data). -/
example (K : S.FieldPair) : ¬ IsIso (TauCeti.DiamondEtale.toCpt S (closedUnitDisc S K).hom) := by
  sorry

/-- DiamondEtaleCohomology:C4/canonical-compactification-universal (ECD Proposition 18.6) -/
theorem canonicalCompactificationUniversal {X Y : S.V} (f : X ⟶ Y) (hf : IsSeparatedMap S f) :
    IsPartiallyProper S (cptMap S f) ∧
      ∀ g : Over Y, IsPartiallyProper S g.hom →
        Function.Bijective
          (fun k : canonicalCompactification S f ⟶ g => canonicalCompactification.toCpt S f ≫ k) := by
  sorry

/-- DiamondEtaleCohomology:C4/relative-compactification-properties (ECD Corollary 18.8)
(i), (iii)–(vii) for separated maps over `Y`; (ii) (smallness) is built into the typing (`cpt`
takes values in the small v-stacks `S.V`). Omitted in (iv): the restriction to v-sheaves
(0-truncatedness), so limits are taken among separated small v-stacks over `Y`. -/
theorem relativeCompactificationProperties (Y : S.V) :
    (∀ A : Over Y, IsSeparatedMap S A.hom → IsPartiallyProper S (cptMap S A.hom)) ∧
    (∀ A : Over Y, IsSeparatedMap S A.hom → S.diaV.essImage Y → S.diaV.essImage A.left →
      S.diaV.essImage (cpt S A.hom)) ∧
    PreservesLimits ((SepOver S Y).ι ⋙ cptOverFunctor S Y) ∧
    (∀ {A B : Over Y} (φ : A ⟶ B), IsSeparatedMap S A.hom → IsSeparatedMap S B.hom →
      IsSurjectiveMap S φ.left → IsSurjectiveMap S (canonicalCompactification.map S φ).left) ∧
    (∀ {A B : Over Y} (φ : A ⟶ B), IsSeparatedMap S A.hom → IsSeparatedMap S B.hom →
      IsQuasicompactMap S φ.left → IsProper S (canonicalCompactification.map S φ).left) ∧
    (∀ {A B : Over Y} (φ : A ⟶ B), IsSeparatedMap S A.hom → IsSeparatedMap S B.hom →
      IsQuasiProEtaleMap S φ.left →
        IsQuasiProEtaleMap S (canonicalCompactification.map S φ).left) := by
  sorry

/-! ### C4/proper-image-closed, C4/partially-proper-colimit, C4/tautness-criterion -/

/-- DiamondEtaleCohomology:C4/proper-image-closed (ECD, proof of Proposition 18.9): the
sheaf-theoretic image `Z′` (the factorisation `Z ↠ Z′ ↪ Y′`) is proper over `Y` and closed in `Y′`.
Omitted hypothesis: the v-stacks are v-sheaves (0-truncated). -/
theorem properImageClosed {Y' Y Z : S.V} (f : Y' ⟶ Y) (hf : IsSeparatedMap S f) (p : Z ⟶ Y)
    (hp : IsProper S p) (h : Z ⟶ Y') (hh : h ≫ f = p) :
    ∃ (Z' : S.V) (q : Z ⟶ Z') (i : Z' ⟶ Y'), q ≫ i = h ∧ IsSurjectiveMap S q ∧
      IsProper S (i ≫ f) ∧ IsClosedImmersion S i := by
  sorry

/-- DiamondEtaleCohomology:C4/partially-proper-colimit (ECD Proposition 18.9): `f` is partially
proper iff it is a filtered colimit of proper maps along closed immersions. All objects of `S.V`
are small, so the colimit is small (the "possibly large" case is not typable). Omitted hypothesis:
the v-stacks are v-sheaves (0-truncated). -/
theorem partiallyProperColimit {Y' Y : S.V} (f : Y' ⟶ Y) :
    IsPartiallyProper S f ↔
      ∃ (J : Type u) (_ : SmallCategory J) (_ : IsFiltered J) (D : J ⥤ S.V) (c : Cocone D)
        (_ : IsColimit c) (e : c.pt ≅ Y'),
        (∀ j, IsProper S (c.ι.app j ≫ e.hom ≫ f)) ∧
          ∀ {i j : J} (a : i ⟶ j), IsClosedImmersion S (D.map a) := by
  sorry

/-- DiamondEtaleCohomology:C4/tautness-criterion (ECD Proposition 18.10), for a map from a
locally spatial diamond `Y′` to a spatial diamond `Y`; for `Y` locally spatial, spatiality is
quasicompactness and quasiseparatedness of `|Y|` (ECD Proposition 12.14(iii), Definition 11.17).
The packet's locally spatial (resp. spatial) v-sheaves that are not diamonds are not covered: the
locally spatial objects of `Carriers` are diamonds. -/
theorem tautnessCriterion {Y' Y : S.LS} (f : S.ofLS Y' ⟶ S.ofLS Y)
    [CompactSpace (S.pts.obj (S.ofLS Y))] [QuasiSeparatedSpace (S.pts.obj (S.ofLS Y))] :
    IsPartiallyProper S f ↔ IsTaut (S.pts.obj (S.ofLS Y')) ∧ UniqueLiftsField S f := by
  sorry

/-! ## C7: constructible sheaves and perfect-constructible complexes (ECD §20)

Constructibility for sheaves on spectral spaces, perfect complexes, and the derived constant
and restriction functors are genuine Mathlib constructions; the diamond-level notions are genuine
definitions over the prelude data (`Det`, `vPull`, `stdEmb`, `stdSpaceEquiv`), quantifying over
strictly totally disconnected `X : S.Std` and maps `S.ofLS (S.ofStd X) ⟶ Y`. -/

/-! ### Sheaves of Λ-modules on spectral spaces -/

/-- The inclusion of a subspace `Z ⊂ X` as a morphism of `TopCat`. -/
def subspaceIncl {X : TopCat.{u}} (Z : Set X) : TopCat.of Z ⟶ X :=
  TopCat.ofHom ⟨Subtype.val, continuous_subtype_val⟩

/-- The constant sheaf functor on a topological space (Mathlib's `constantSheaf`). -/
def topConst (X : TopCat.{u}) : ModuleCat.{u} Λ ⥤ TopCat.Sheaf (ModuleCat.{u} Λ) X :=
  constantSheaf (Opens.grothendieckTopology X) (ModuleCat.{u} Λ)

/-- DiamondEtaleCohomology:C7/constructible-sheaf-spectral (ECD Definition 20.1(i), Lemma 20.4):
a sheaf of Λ-modules on a spectral space is constructible if there is a finite stratification
`X = ⊔ Sᵢ` into constructible locally closed subsets such that each `F|_{Sᵢ}` (Mathlib pullback
along the subspace inclusion) is the constant sheaf of a finitely generated Λ-module. -/
def IsConstructibleSheaf [IsNoetherianRing Λ] {X : TopCat.{u}} [SpectralSpace X]
    (F : TopCat.Sheaf (ModuleCat.{u} Λ) X) : Prop :=
  ∃ (n : ℕ) (Z : Fin n → Set X),
    (∀ i, Topology.IsConstructible (Z i) ∧ IsLocallyClosed (Z i)) ∧
    Pairwise (fun i j => Disjoint (Z i) (Z j)) ∧ (⋃ i, Z i) = Set.univ ∧
    ∀ i, ∃ M : ModuleCat.{u} Λ, Module.Finite Λ M ∧
      Nonempty ((TopCat.Sheaf.pullback (ModuleCat.{u} Λ) (subspaceIncl (Z i))).obj F ≅
        (topConst Λ (TopCat.of (Z i))).obj M)

/-- `F|_Z` is the constant sheaf on `Z` attached to a finitely generated Λ-module. -/
def IsConstFGOn {X : TopCat.{u}} (F : TopCat.Sheaf (ModuleCat.{u} Λ) X) (Z : Set X) : Prop :=
  ∃ M : ModuleCat.{u} Λ, Module.Finite Λ M ∧
    Nonempty ((TopCat.Sheaf.pullback (ModuleCat.{u} Λ) (subspaceIncl Z)).obj F ≅
      (topConst Λ (TopCat.of Z)).obj M)

/-- Extension by zero `j_!` along an open subset (absent from Mathlib; a construction used by the
API of C7/constructible-sheaf-spectral). -/
def extendByZero {X : TopCat.{u}} (U : TopologicalSpace.Opens X) :
    TopCat.Sheaf (ModuleCat.{u} Λ) (TopCat.of U) ⥤ TopCat.Sheaf (ModuleCat.{u} Λ) X := sorry

/-- C7/constructible-sheaf-spectral API: the constant sheaf of a finitely generated module is
constructible. -/
theorem IsConstructibleSheaf.constant [IsNoetherianRing Λ] (X : TopCat.{u}) [SpectralSpace X]
    (M : ModuleCat.{u} Λ) [Module.Finite Λ M] : IsConstructibleSheaf Λ ((topConst Λ X).obj M) := by
  sorry

/-- C7/constructible-sheaf-spectral API: `j_!` for a quasicompact open `j : U ⊂ X` and `i_∗` for a
constructible closed `i : Z ⊂ X` preserve constructibility. -/
theorem IsConstructibleSheaf.extendByZero_open [IsNoetherianRing Λ] (X : TopCat.{u})
    [SpectralSpace X] :
    (∀ (U : TopologicalSpace.Opens X) [SpectralSpace (TopCat.of U)],
      IsCompact (U : Set X) → ∀ G : TopCat.Sheaf (ModuleCat.{u} Λ) (TopCat.of U),
        IsConstructibleSheaf Λ G → IsConstructibleSheaf Λ ((extendByZero Λ U).obj G)) ∧
    (∀ (Z : Set X) [SpectralSpace (TopCat.of Z)], IsClosed Z → Topology.IsConstructible Z →
      ∀ G : TopCat.Sheaf (ModuleCat.{u} Λ) (TopCat.of Z), IsConstructibleSheaf Λ G →
        IsConstructibleSheaf Λ ((TopCat.Sheaf.pushforward (ModuleCat.{u} Λ) (subspaceIncl Z)).obj G)) := by
  sorry

/-- C7/constructible-sheaf-spectral API: pullback along a spectral map preserves
constructibility. -/
theorem IsConstructibleSheaf.pullback [IsNoetherianRing Λ] {X Y : TopCat.{u}} [SpectralSpace X]
    [SpectralSpace Y] (f : X ⟶ Y) (hf : IsSpectralMap f) (F : TopCat.Sheaf (ModuleCat.{u} Λ) Y)
    (hF : IsConstructibleSheaf Λ F) :
    IsConstructibleSheaf Λ ((TopCat.Sheaf.pullback (ModuleCat.{u} Λ) f).obj F) := by
  sorry

/-- C7/constructible-sheaf-spectral API: constructible sheaves are closed under kernels,
cokernels and extensions (hence images, as kernels of cokernel maps). -/
theorem IsConstructibleSheaf.kernel_cokernel_extension [IsNoetherianRing Λ] (X : TopCat.{u})
    [SpectralSpace X] :
    let P : ObjectProperty (TopCat.Sheaf (ModuleCat.{u} Λ) X) := fun F => IsConstructibleSheaf Λ F
    P.IsClosedUnderKernels ∧ P.IsClosedUnderCokernels ∧ P.IsClosedUnderExtensions := by
  sorry

/-- DiamondEtaleCohomology:C7/constructible-compact-spectral (ECD Lemma 20.4): constructible
⇔ compact (`IsFinitelyPresentable`), and every sheaf is a filtered colimit of constructible
sheaves. -/
theorem constructibleCompactSpectral [IsNoetherianRing Λ] (X : TopCat.{u}) [SpectralSpace X] :
    (∀ F : TopCat.Sheaf (ModuleCat.{u} Λ) X, IsConstructibleSheaf Λ F ↔ IsFinitelyPresentable.{u} F) ∧
    ∀ F : TopCat.Sheaf (ModuleCat.{u} Λ) X,
      ∃ (J : Type u) (_ : SmallCategory J) (_ : IsFiltered J) (D : J ⥤ TopCat.Sheaf (ModuleCat.{u} Λ) X)
        (c : Cocone D) (_ : IsColimit c), Nonempty (c.pt ≅ F) ∧ ∀ j, IsConstructibleSheaf Λ (D.obj j) := by
  sorry

/-- C7/constructible-sheaf-spectral API: constructible iff compact (node
C7/constructible-compact-spectral). -/
theorem IsConstructibleSheaf.iff_compact [IsNoetherianRing Λ] {X : TopCat.{u}} [SpectralSpace X]
    (F : TopCat.Sheaf (ModuleCat.{u} Λ) X) :
    IsConstructibleSheaf Λ F ↔ IsFinitelyPresentable.{u} F :=
  (constructibleCompactSpectral Λ X).1 F

/-- C7/constructible-sheaf-spectral API: stalks of a constructible sheaf are finitely generated. -/
theorem IsConstructibleSheaf.stalk_fg [IsNoetherianRing Λ] {X : TopCat.{u}} [SpectralSpace X]
    (F : TopCat.Sheaf (ModuleCat.{u} Λ) X) (hF : IsConstructibleSheaf Λ F) (x : X) :
    Module.Finite Λ (F.presheaf.stalk x) := by
  sorry

/-- test isConstructibleSheaf_zero (degenerate): the zero sheaf is constructible. -/
example [IsNoetherianRing Λ] {X : TopCat.{u}} [SpectralSpace X]
    (F : TopCat.Sheaf (ModuleCat.{u} Λ) X) (hF : IsZero F) : IsConstructibleSheaf Λ F := by
  sorry

/-- test isConstructibleSheaf_constant (computation): the constant sheaf `Λⁿ` is constructible. -/
example [IsNoetherianRing Λ] {X : TopCat.{u}} [SpectralSpace X] (n : ℕ) :
    IsConstructibleSheaf Λ ((topConst Λ X).obj (ModuleCat.of Λ (Fin n → Λ))) := by
  sorry

/-- test isConstructibleSheaf_finite_T0 (compatibility): on a finite T0 space (spectral, all
subsets constructible; `SpectralSpace` already includes T0) a sheaf is constructible iff all its
stalks are finitely generated. -/
example [IsNoetherianRing Λ] {X : TopCat.{u}} [SpectralSpace X] [Finite X]
    (F : TopCat.Sheaf (ModuleCat.{u} Λ) X) :
    IsConstructibleSheaf Λ F ↔ ∀ x : X, Module.Finite Λ (F.presheaf.stalk x) := by
  sorry

/-- test isConstructibleSheaf_not_fg (non-example): for `Λ ≠ 0` and `X ≠ ∅`, the constant sheaf
with value `⊕_{n∈ℕ} Λ` is not constructible. -/
example [IsNoetherianRing Λ] [Nontrivial Λ] {X : TopCat.{u}} [SpectralSpace X] [Nonempty X] :
    ¬ IsConstructibleSheaf Λ ((topConst Λ X).obj (ModuleCat.of Λ (ℕ →₀ Λ))) := by
  sorry

/-- test isConstructibleSheaf_not_qc_open (non-example): `j_!Λ_U` is not constructible for an open
`U` that is not quasicompact (stated for every spectral space; the Cantor set with
`U = X ∖ {x}` is an instance). -/
example [IsNoetherianRing Λ] [Nontrivial Λ] {X : TopCat.{u}} [SpectralSpace X]
    (U : TopologicalSpace.Opens X) (hU : ¬ IsCompact (U : Set X)) :
    ¬ IsConstructibleSheaf Λ ((extendByZero Λ U).obj ((topConst Λ (TopCat.of U)).obj (ModuleCat.of Λ Λ))) := by
  sorry

/-! ### Constructible sheaves on strictly totally disconnected spaces (C7/constructible-sheaf-std) -/

/-- The underlying space `|X|` of a strictly totally disconnected perfectoid space. -/
abbrev stdPts (X : S.Std) : TopCat.{u} := S.pts.obj (S.ofLS (S.ofStd X))

/-- `|X|` is spectral for strictly totally disconnected `X` (such `X` are qcqs, ECD Definition
7.15 and Proposition 11.18(i)); a fact about the supplier data, owned by DiamondsAndVStacks D1. -/
instance stdPtsSpectral (X : S.Std) : SpectralSpace (stdPts S X) := sorry

/-- The map `S.ofLS (S.ofStd X') ⟶ S.ofLS (S.ofStd X)` underlying a map of strictly totally
disconnected spaces. -/
abbrev stdMapV {X' X : S.Std} (g : X' ⟶ X) : S.ofLS (S.ofStd X') ⟶ S.ofLS (S.ofStd X) :=
  S.diaV.map (S.lsDia.map (S.stdLS.map g))

/-- C7/constructible-sheaf-std API (ECD Definition 20.1(i)): constructibility of an étale sheaf on
a strictly totally disconnected `X`, through `X_ét ≃ Sh(|X|)` (C0/std-etale-acyclic). -/
def IsConstructibleStd [IsNoetherianRing Λ] (X : S.Std) (F : EtSh S Λ (S.ofStd X)) : Prop :=
  IsConstructibleSheaf Λ ((stdSpaceEquiv S Λ X).functor.obj F)

/-- C7/constructible-sheaf-std API: `F` is constructible iff its image in `Sh(|X|, Λ)` is. -/
theorem IsConstructibleStd.iff_space [IsNoetherianRing Λ] (X : S.Std) (F : EtSh S Λ (S.ofStd X)) :
    IsConstructibleStd S Λ X F ↔ IsConstructibleSheaf Λ ((stdSpaceEquiv S Λ X).functor.obj F) :=
  Iff.rfl

/-- C7/constructible-sheaf-std API: pullback along a map of strictly totally disconnected spaces
(the pullback of sheaves on the underlying spaces) preserves constructibility. -/
theorem IsConstructibleStd.pullback [IsNoetherianRing Λ] {X' X : S.Std} (g : X' ⟶ X)
    (F : EtSh S Λ (S.ofStd X)) (hF : IsConstructibleStd S Λ X F) :
    IsConstructibleStd S Λ X' ((stdSpaceEquiv S Λ X').inverse.obj
      ((TopCat.Sheaf.pullback (ModuleCat.{u} Λ) (S.pts.map (stdMapV S g))).obj
        ((stdSpaceEquiv S Λ X).functor.obj F))) := by
  sorry

/-- test isConstructibleStd_point (computation): for `X = Spa(C, O_C)` (a strictly totally
disconnected space with one point), `F` is constructible iff `F(X)` is finitely generated. -/
example [IsNoetherianRing Λ] (X : S.Std) [Unique (stdPts S X)] (F : EtSh S Λ (S.ofStd X)) :
    IsConstructibleStd S Λ X F ↔
      Module.Finite Λ (((stdSpaceEquiv S Λ X).functor.obj F).presheaf.obj (Opposite.op ⊤)) := by
  sorry

/-- test isConstructibleStd_chain (computation): `j_!Λ` is constructible for a quasicompact open
`j : U ⊂ |X|` (stated for all strictly totally disconnected `X`; the rank-2 point
`Spa(C, C⁺)` with `U = {η}` and stratification `{η} ⊔ {s}` is the packet instance). -/
example [IsNoetherianRing Λ] (X : S.Std) (U : TopologicalSpace.Opens (stdPts S X))
    (hU : IsCompact (U : Set (stdPts S X))) :
    IsConstructibleStd S Λ X ((stdSpaceEquiv S Λ X).inverse.obj
      ((extendByZero Λ U).obj ((topConst Λ (TopCat.of U)).obj (ModuleCat.of Λ Λ)))) := by
  sorry

/-- test isConstructibleStd_profinite (compatibility): if `|X|` is Hausdorff (`X = Spa(C, O_C) × S`
with `S` profinite), constructible sheaves are those constant with finitely generated values on
the members of a finite clopen partition. -/
example [IsNoetherianRing Λ] (X : S.Std) [T2Space (stdPts S X)] (F : EtSh S Λ (S.ofStd X)) :
    IsConstructibleStd S Λ X F ↔
      ∃ (n : ℕ) (Z : Fin n → Set (stdPts S X)), (∀ i, IsClopen (Z i)) ∧
        Pairwise (fun i j => Disjoint (Z i) (Z j)) ∧ (⋃ i, Z i) = Set.univ ∧
        ∀ i, IsConstFGOn Λ ((stdSpaceEquiv S Λ X).functor.obj F) (Z i) := by
  sorry

/-- The sheaf `i_{x∗}Λ` on `|X|` for a point `x` (pushforward along `{x} ⊂ |X|`). -/
def stdSkyscraper (X : S.Std) (x : stdPts S X) : EtSh S Λ (S.ofStd X) :=
  (stdSpaceEquiv S Λ X).inverse.obj ((TopCat.Sheaf.pushforward (ModuleCat.{u} Λ)
    (subspaceIncl ({x} : Set (stdPts S X)))).obj
      ((topConst Λ (TopCat.of ({x} : Set (stdPts S X)))).obj (ModuleCat.of Λ Λ)))

/-- The sum `⊕_{y ∈ |X|} i_{y∗}Λ`. -/
def stdSkyscraperSum (X : S.Std) : EtSh S Λ (S.ofStd X) :=
  haveI : HasColimitsOfShape (Discrete (stdPts S X)) (EtSh S Λ (S.ofStd X)) :=
    CategoryTheory.Sheaf.instHasColimitsOfShape
  ∐ fun y : stdPts S X => stdSkyscraper S Λ X y

/-- test isConstructibleStd_not (non-example), CORRECTED: for `|X|` Hausdorff (`X = Spa(C, O_C) × S`,
`S` profinite) and a point `x` that is not open, `i_{x∗}Λ` is NOT constructible (on a profinite
space the constructible locally closed subsets are the clopen ones, so constructible sheaves are
locally constant, while `i_{x∗}Λ` has stalk `Λ` at `x` and `0` nearby); neither is
`⊕_{y} i_{y∗}Λ`. The packet asserts that `i_{x∗}Λ` is constructible, which is false. -/
example [IsNoetherianRing Λ] [Nontrivial Λ] (X : S.Std) [T2Space (stdPts S X)]
    (x : stdPts S X) (hx : ¬ IsOpen ({x} : Set (stdPts S X))) :
    ¬ IsConstructibleStd S Λ X (stdSkyscraper S Λ X x) ∧
      ¬ IsConstructibleStd S Λ X (stdSkyscraperSum S Λ X) := by
  sorry

/-! ### Constructible sheaves on small v-stacks (C7/constructible-sheaf and its theorems) -/

/-- `F ↦ F[0]` on v-sheaves. -/
abbrev singleV (Y : S.V) : VSh S Λ Y ⥤ DV S Λ Y := DerivedCategory.singleFunctor _ 0

/-- `F ↦ F[0]` on étale sheaves. -/
abbrev singleEt (Y : S.LS) : EtSh S Λ Y ⥤ DEt S Λ Y := DerivedCategory.singleFunctor _ 0

/-- `λ^*ν^*`: étale sheaves on a locally spatial diamond as v-sheaves. -/
abbrev etToV (Y : S.LS) : EtSh S Λ Y ⥤ VSh S Λ (S.ofLS Y) :=
  nuSh S Λ Y ⋙ lambdaSh S Λ (S.lsDia.obj Y)

/-- Source and structure map of an étale map `U → Y` of small v-stacks (an object of
`S.EtVOver Y`). -/
abbrev etvSrc {Y : S.V} (W : S.EtVOver Y) : S.V := ((S.etVSrc Y).obj W).left
abbrev etvMap {Y : S.V} (W : S.EtVOver Y) : etvSrc S W ⟶ Y := ((S.etVSrc Y).obj W).hom

/-- `f^*F` is (the v-sheaf of) a constructible étale sheaf on the strictly totally disconnected
`X`. -/
def IsConstructibleAt [IsNoetherianRing Λ] {Y : S.V} (F : VSh S Λ Y) (X : S.Std)
    (f : S.ofLS (S.ofStd X) ⟶ Y) : Prop :=
  ∃ G : EtSh S Λ (S.ofStd X), IsConstructibleStd S Λ X G ∧
    Nonempty ((vPull S Λ f).obj ((singleV S Λ Y).obj F) ≅ (stdEmb S Λ X).obj ((singleEt S Λ _).obj G))

/-- C7/constructible-sheaf API (ECD Definition 20.1(ii)): `F[0] ∈ D_ét(Y, Λ)` and `f^*F` is
constructible for every strictly totally disconnected `f : X → Y`. -/
def IsConstructible [IsNoetherianRing Λ] (Y : S.V) : ObjectProperty (VSh S Λ Y) := fun F =>
  Det S Λ Y ((singleV S Λ Y).obj F) ∧ ∀ (X : S.Std) (f : S.ofLS (S.ofStd X) ⟶ Y),
    IsConstructibleAt S Λ F X f

/-- C7/constructible-sheaf API: the full subcategory `Cons(Y, Λ)`. -/
abbrev Cons [IsNoetherianRing Λ] (Y : S.V) := (IsConstructible S Λ Y).FullSubcategory

/-- C7/constructible-sheaf API: for a surjection `X → Y` from a strictly totally disconnected
space, `F` is constructible iff `F[0] ∈ D_ét` and `f^*F` is constructible (node
C7/constructible-v-descent). -/
theorem IsConstructible.iff_cover [IsNoetherianRing Λ] {Y : S.V} (X : S.Std)
    (f : S.ofLS (S.ofStd X) ⟶ Y) (hf : IsSurjectiveMap S f) (F : VSh S Λ Y) :
    IsConstructible S Λ Y F ↔ Det S Λ Y ((singleV S Λ Y).obj F) ∧ IsConstructibleAt S Λ F X f := by
  sorry

/-- C7/constructible-sheaf API: pullback along any map of small v-stacks preserves
constructibility (`g^*` is exact, so `g^*(F[0]) = (g^*F)[0]`). -/
theorem IsConstructible.pullback [IsNoetherianRing Λ] {Y' Y : S.V} (g : Y' ⟶ Y) (F : VSh S Λ Y)
    (hF : IsConstructible S Λ Y F) :
    ∃ F' : VSh S Λ Y', IsConstructible S Λ Y' F' ∧
      Nonempty ((vPull S Λ g).obj ((singleV S Λ Y).obj F) ≅ (singleV S Λ Y').obj F') := by
  sorry

/-- C7/constructible-sheaf API: on a spatial diamond (for `Y` locally spatial: `|Y|` quasicompact
and quasiseparated), an étale sheaf is constructible iff it is compact (node
C7/constructible-spatial-characterisation). -/
theorem IsConstructible.iff_compact_spatial [IsNoetherianRing Λ] (Y : S.LS)
    [CompactSpace (S.pts.obj (S.ofLS Y))] [QuasiSeparatedSpace (S.pts.obj (S.ofLS Y))]
    (F : EtSh S Λ Y) :
    IsConstructible S Λ (S.ofLS Y) ((etToV S Λ Y).obj F) ↔ IsFinitelyPresentable.{u} F := by
  sorry

/-- C7/constructible-sheaf API: `j_!G` is constructible for a quasicompact separated étale
`j : U → Y` and constructible `G` on `U` (C5 extension by zero). -/
theorem IsConstructible.etaleShriek [IsNoetherianRing Λ] {Y : S.V} (W : S.EtVOver Y)
    (hqc : IsQuasicompactMap S (etvMap S W)) (hsep : IsSeparatedMap S (etvMap S W))
    (G : VSh S Λ (etvSrc S W)) (hG : IsConstructible S Λ (etvSrc S W) G) :
    ∃ F : VSh S Λ Y, IsConstructible S Λ Y F ∧
      Nonempty (((etaleShriek S Λ W).obj ⟨(singleV S Λ _).obj G, hG.1⟩).obj ≅ (singleV S Λ Y).obj F) := by
  sorry

/-- C7/constructible-sheaf API: geometric stalks of a constructible sheaf on a locally spatial
diamond are finitely generated. A geometric point is a map from a one-point strictly totally
disconnected space `Spa(C, O_C)`; the stalk is the module of sections of the pullback. -/
theorem IsConstructible.stalk_fg [IsNoetherianRing Λ] (Y : S.LS) (F : VSh S Λ (S.ofLS Y))
    (hF : IsConstructible S Λ (S.ofLS Y) F) (X : S.Std) [Unique (stdPts S X)]
    (f : S.ofLS (S.ofStd X) ⟶ S.ofLS Y) :
    ∃ G : EtSh S Λ (S.ofStd X),
      Module.Finite Λ (((stdSpaceEquiv S Λ X).functor.obj G).presheaf.obj (Opposite.op ⊤)) ∧
      Nonempty ((vPull S Λ f).obj ((singleV S Λ _).obj F) ≅ (stdEmb S Λ X).obj ((singleEt S Λ _).obj G)) := by
  sorry

/-- test isConstructible_constant (computation): the constant sheaf `Λ_Y` is constructible. -/
example [IsNoetherianRing Λ] (Y : S.V) :
    IsConstructible S Λ Y ((constantSheaf (vSite S Y) (ModuleCat.{u} Λ)).obj (ModuleCat.of Λ Λ)) := by
  sorry

/-- test isConstructible_zero (degenerate): the zero sheaf is constructible. -/
example [IsNoetherianRing Λ] (Y : S.V) (F : VSh S Λ Y) (hF : IsZero F) :
    IsConstructible S Λ Y F := by
  sorry

/-- test isConstructible_std_compat (compatibility): for strictly totally disconnected `X` the
notion agrees with C7/constructible-sheaf-std. -/
example [IsNoetherianRing Λ] (X : S.Std) (F : EtSh S Λ (S.ofStd X)) :
    IsConstructible S Λ (S.ofLS (S.ofStd X)) ((etToV S Λ (S.ofStd X)).obj F) ↔
      IsConstructibleStd S Λ X F := by
  sorry

-- test isConstructible_open_disc (non-example): for the closed perfectoid unit disc D over
-- Spa(C, O_C) and the non-quasicompact open U = D ∖ {Gauss point}, j_!Λ_U is not constructible.
-- Not stated: the Gauss point, the open subdiamond U and its extension by zero are not part of
-- the `Carriers` data (the spectral-space analogue is the test isConstructibleSheaf_not_qc_open).

/-- test isConstructible_v_sheaf_not (non-example): for `Y = Spa(K, O_K)` and `Λ ≠ 0`, the sheaf
`⊕_{n∈ℕ} Λ_Y` lies in `D_ét` but is not constructible. -/
example [IsNoetherianRing Λ] [Nontrivial Λ] (K : S.FieldPair) :
    Det S Λ (S.spaCirc (S.fieldTate K)) ((singleV S Λ _).obj
      ((constantSheaf (vSite S _) (ModuleCat.{u} Λ)).obj (ModuleCat.of Λ (ℕ →₀ Λ)))) ∧
    ¬ IsConstructible S Λ (S.spaCirc (S.fieldTate K))
      ((constantSheaf (vSite S _) (ModuleCat.{u} Λ)).obj (ModuleCat.of Λ (ℕ →₀ Λ))) := by
  sorry

/-- DiamondEtaleCohomology:C7/constructible-abelian (ECD Remark 20.3): constructible sheaves
contain 0 and are closed under kernels, cokernels, extensions and finite products (images are
kernels of cokernel maps), so `Cons(Y, Λ)` is abelian (`Cons.abelian`). -/
theorem constructibleAbelian [IsNoetherianRing Λ] (Y : S.V) :
    (IsConstructible S Λ Y).ContainsZero ∧ (IsConstructible S Λ Y).IsClosedUnderKernels ∧
      (IsConstructible S Λ Y).IsClosedUnderCokernels ∧
      (IsConstructible S Λ Y).IsClosedUnderExtensions ∧
      (IsConstructible S Λ Y).IsClosedUnderFiniteProducts := by
  sorry

/-- `Cons(Y, Λ)` is an abelian category (from C7/constructible-abelian and Mathlib's
`ObjectProperty` abelian-subcategory instance). -/
instance Cons.abelian [IsNoetherianRing Λ] (Y : S.V) : Abelian (Cons S Λ Y) :=
  have : (IsConstructible S Λ Y).ContainsZero := (constructibleAbelian S Λ Y).1
  have : (IsConstructible S Λ Y).IsClosedUnderKernels := (constructibleAbelian S Λ Y).2.1
  have : (IsConstructible S Λ Y).IsClosedUnderCokernels := (constructibleAbelian S Λ Y).2.2.1
  have : (IsConstructible S Λ Y).IsClosedUnderFiniteProducts :=
    (constructibleAbelian S Λ Y).2.2.2.2
  inferInstance

/-- DiamondEtaleCohomology:C7/constructible-v-descent (ECD Proposition 20.5) -/
theorem constructibleVDescent [IsNoetherianRing Λ] {Y' Y : S.V} (f : Y' ⟶ Y)
    (hf : IsSurjectiveMap S f) (F : VSh S Λ Y)
    (h : ∃ F' : VSh S Λ Y', IsConstructible S Λ Y' F' ∧
      Nonempty ((vPull S Λ f).obj ((singleV S Λ Y).obj F) ≅ (singleV S Λ Y').obj F')) :
    IsConstructible S Λ Y F := by
  sorry

/-- DiamondEtaleCohomology:C7/constructible-spatial-characterisation (ECD Proposition 20.6), for a
spatial diamond `Y` (locally spatial with `|Y|` quasicompact and quasiseparated): (i) ⇔ (ii)
compactness, (i) ⇔ (iii) a constructible stratification of `|Y|` on whose preimages every
strictly totally disconnected pullback is constant with finitely generated value; and every
étale sheaf is a filtered colimit of constructible ones. -/
theorem constructibleSpatialCharacterisation [IsNoetherianRing Λ] (Y : S.LS)
    [CompactSpace (S.pts.obj (S.ofLS Y))] [QuasiSeparatedSpace (S.pts.obj (S.ofLS Y))] :
    (∀ F : EtSh S Λ Y,
      (IsConstructible S Λ (S.ofLS Y) ((etToV S Λ Y).obj F) ↔ IsFinitelyPresentable.{u} F) ∧
      (IsConstructible S Λ (S.ofLS Y) ((etToV S Λ Y).obj F) ↔
        ∃ (n : ℕ) (Z : Fin n → Set (S.pts.obj (S.ofLS Y))),
          (∀ i, Topology.IsConstructible (Z i) ∧ IsLocallyClosed (Z i)) ∧
          Pairwise (fun i j => Disjoint (Z i) (Z j)) ∧ (⋃ i, Z i) = Set.univ ∧
          ∀ (X : S.Std) (f : S.ofLS (S.ofStd X) ⟶ S.ofLS Y), ∃ G : EtSh S Λ (S.ofStd X),
            Nonempty ((vPull S Λ f).obj ((singleV S Λ _).obj ((etToV S Λ Y).obj F)) ≅
              (stdEmb S Λ X).obj ((singleEt S Λ _).obj G)) ∧
            ∀ i, IsConstFGOn Λ ((stdSpaceEquiv S Λ X).functor.obj G) ((S.pts.map f) ⁻¹' Z i))) ∧
    ∀ F : EtSh S Λ Y, ∃ (J : Type u) (_ : SmallCategory J) (_ : IsFiltered J) (D : J ⥤ EtSh S Λ Y)
      (c : Cocone D) (_ : IsColimit c), Nonempty (c.pt ≅ F) ∧
        ∀ j, IsConstructible S Λ (S.ofLS Y) ((etToV S Λ Y).obj (D.obj j)) := by
  sorry

/-! ### Local systems (C7/local-system) -/

/-- C7/local-system API: `L` is étale-locally isomorphic to the constant sheaf of a finitely
generated Λ-module: for every object `V` of `U_ét`, the objects `W → V` over which `L` becomes
constant with finitely generated value generate a covering sieve. -/
def IsLocalSystem [IsNoetherianRing Λ] (U : S.LS) (L : EtSh S Λ U) : Prop :=
  ∀ V : S.EtOver U, Sieve.generate (fun ⦃W : S.EtOver U⦄ (_ : W ⟶ V) =>
    ∃ M : ModuleCat.{u} Λ, Module.Finite Λ M ∧
      Nonempty (((etaleSite S U).overPullback (ModuleCat.{u} Λ) W).obj L ≅
        (constantSheaf ((etaleSite S U).over W) (ModuleCat.{u} Λ)).obj M)) ∈ etaleSite S U V

/-- C7/local-system API: on a spatial diamond (`|U|` quasicompact and quasiseparated), a local
system is constructible. -/
theorem IsLocalSystem.isConstructible [IsNoetherianRing Λ] (U : S.LS)
    [CompactSpace (S.pts.obj (S.ofLS U))] [QuasiSeparatedSpace (S.pts.obj (S.ofLS U))]
    (L : EtSh S Λ U) (hL : IsLocalSystem S Λ U L) :
    IsConstructible S Λ (S.ofLS U) ((etToV S Λ U).obj L) := by
  sorry

/-- C7/local-system API: pullback along any map of locally spatial diamonds preserves local
systems. -/
theorem IsLocalSystem.pullback [IsNoetherianRing Λ] {U' U : S.LS} (g : S.ofLS U' ⟶ S.ofLS U)
    (L : EtSh S Λ U) (hL : IsLocalSystem S Λ U L) :
    ∃ L' : EtSh S Λ U', IsLocalSystem S Λ U' L' ∧
      Nonempty ((vPull S Λ g).obj ((singleV S Λ _).obj ((etToV S Λ U).obj L)) ≅
        (singleV S Λ _).obj ((etToV S Λ U').obj L')) := by
  sorry

/-- C7/local-system API: local systems are closed under `⊗` (Mathlib's `Sheaf.monoidalCategory`)
and under kernels and cokernels. The closure under internal Hom of sheaves is not stated:
Mathlib has no internal Hom of sheaves of modules on a site. -/
theorem IsLocalSystem.tensor_hom [IsNoetherianRing Λ] (U : S.LS) :
    (∀ L L' : EtSh S Λ U, IsLocalSystem S Λ U L → IsLocalSystem S Λ U L' →
      letI := Sheaf.monoidalCategory (etaleSite S U) (ModuleCat.{u} Λ)
      IsLocalSystem S Λ U (MonoidalCategory.tensorObj L L')) ∧
    ObjectProperty.IsClosedUnderKernels (fun L => IsLocalSystem S Λ U L : ObjectProperty (EtSh S Λ U)) ∧
    ObjectProperty.IsClosedUnderCokernels
      (fun L => IsLocalSystem S Λ U L : ObjectProperty (EtSh S Λ U)) := by
  sorry

/-- C7/local-system API: the sheaf on `U = Spa(C, O_C)/G` attached to a continuous representation
of a profinite group `G` (construction). The quasi-pro-étale presentation `π : Spa(C, O_C) → U`
is passed as a map from a strictly totally disconnected space; its `G`-torsor structure is not
typable against `Carriers` and is omitted. -/
def IsLocalSystem.ofRep (U : S.LS) (X : S.Std) (π : S.ofLS (S.ofStd X) ⟶ S.ofLS U)
    (G : Type u) [Group G] [TopologicalSpace G] (M : Type u) [AddCommGroup M] [Module Λ M]
    (ρ : Representation Λ G M) : EtSh S Λ U := sorry

/-- C7/local-system API: for a continuous representation (open stabilisers) of a profinite group
on a finitely generated module, `ofRep` is a local system, trivialised on `Spa(C, O_C)` with value
`M`. Omitted hypothesis: `π` is a `G`-torsor (not typable against `Carriers`). -/
theorem IsLocalSystem.ofRep_isLocalSystem [IsNoetherianRing Λ] (U : S.LS) (X : S.Std)
    [Unique (stdPts S X)] (π : S.ofLS (S.ofStd X) ⟶ S.ofLS U) (G : Type u) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (M : Type u) [AddCommGroup M] [Module Λ M] [Module.Finite Λ M] (ρ : Representation Λ G M)
    (hρ : ∀ m : M, IsOpen {g : G | ρ g m = m}) :
    IsLocalSystem S Λ U (IsLocalSystem.ofRep S Λ U X π G M ρ) ∧
      Nonempty ((vPull S Λ π).obj ((singleV S Λ _).obj
          ((etToV S Λ U).obj (IsLocalSystem.ofRep S Λ U X π G M ρ))) ≅
        (singleV S Λ _).obj ((constantSheaf (vSite S _) (ModuleCat.{u} Λ)).obj (ModuleCat.of Λ M))) := by
  sorry

/-- test isLocalSystem_constant (degenerate): the constant sheaf `Λⁿ` is a local system. -/
example [IsNoetherianRing Λ] (U : S.LS) (n : ℕ) :
    IsLocalSystem S Λ U ((constantSheaf (etaleSite S U) (ModuleCat.{u} Λ)).obj
      (ModuleCat.of Λ (Fin n → Λ))) := by
  sorry

-- test isLocalSystem_finite_etale (computation): for a finite étale Galois G-cover V → U and a
-- finitely generated Λ[G]-module M, the sheaf of G-equivariant maps V → M is a local system
-- trivialised on V. Not stated: finite étale Galois covers and their G-actions are not part of
-- the `Carriers` data.

/-- test isLocalSystem_point (compatibility): on `Spa(C, O_C)` (a one-point strictly totally
disconnected space) local systems are the constant sheaves of finitely generated modules. -/
example [IsNoetherianRing Λ] (X : S.Std) [Unique (stdPts S X)] (L : EtSh S Λ (S.ofStd X)) :
    IsLocalSystem S Λ (S.ofStd X) L ↔ ∃ M : ModuleCat.{u} Λ, Module.Finite Λ M ∧
      Nonempty (L ≅ (constantSheaf (etaleSite S (S.ofStd X)) (ModuleCat.{u} Λ)).obj M) := by
  sorry

/-- test isLocalSystem_not (non-example): `j_!Λ` for a quasicompact open `U ⊂ |X|` that is not
closed (the rank-2 point `Spa(C, C⁺)` with `U = {η}` is the packet instance) is constructible but
not a local system. -/
example [IsNoetherianRing Λ] [Nontrivial Λ] (X : S.Std) (U : TopologicalSpace.Opens (stdPts S X))
    (hU : IsCompact (U : Set (stdPts S X))) (hU' : ¬ IsClosed (U : Set (stdPts S X))) :
    IsConstructibleStd S Λ X ((stdSpaceEquiv S Λ X).inverse.obj
        ((extendByZero Λ U).obj ((topConst Λ (TopCat.of U)).obj (ModuleCat.of Λ Λ)))) ∧
      ¬ IsLocalSystem S Λ (S.ofStd X) ((stdSpaceEquiv S Λ X).inverse.obj
        ((extendByZero Λ U).obj ((topConst Λ (TopCat.of U)).obj (ModuleCat.of Λ Λ)))) := by
  sorry

/-! ### Restriction of support to a constructible closed subset (C7/support-restriction) -/

/-- C7/support-restriction API: for a constructible closed `Z ⊂ |U|`, the exact functor
`L ↦ L|_Z = coker(j′_!j′^*L → L)` on étale sheaves (`j′ : U ∖ Z → U`). Closedness and
constructibility of `Z` are hypotheses of the construction, kept in the statements below. -/
def supportRestrict (U : S.LS) (Z : Set (S.pts.obj (S.ofLS U))) : EtSh S Λ U ⥤ EtSh S Λ U := sorry

/-- C7/support-restriction API: the triangulated version `A ↦ A|_Z = cone(j′_!j′^*A → A)` on
`D_ét(U, Λ)` (for `U` locally spatial; stated on all small v-stacks so that it applies to the
sources of étale maps, which `Carriers` lists as small v-stacks). -/
def supportRestrictDerived (U : S.V) (Z : Set (S.pts.obj U)) : DetCat S Λ U ⥤ DetCat S Λ U := sorry

/-- The map `A → A|_Z`. -/
def supportRestrictDerivedπ (U : S.V) (Z : Set (S.pts.obj U)) :
    𝟭 (DetCat S Λ U) ⟶ supportRestrictDerived S Λ U Z := sorry

/-- C7/support-restriction API: `(L|_Z)_ū = L_ū` for `u ∈ Z` and `0` for `u ∉ Z`, stated for
strictly totally disconnected `U`, where geometric stalks are stalks on `|U|`
(C0/std-etale-acyclic; geometric stalks on general `U` are owned by C0/geometric-stalk). -/
theorem supportRestrict.stalk (X : S.Std) (Z : Set (stdPts S X)) (hZ : IsClosed Z)
    (hZc : Topology.IsConstructible Z) (L : EtSh S Λ (S.ofStd X)) (x : stdPts S X) :
    (x ∈ Z → Nonempty (((stdSpaceEquiv S Λ X).functor.obj
        ((supportRestrict S Λ (S.ofStd X) Z).obj L)).presheaf.stalk x ≅
          ((stdSpaceEquiv S Λ X).functor.obj L).presheaf.stalk x)) ∧
    (x ∉ Z → IsZero (((stdSpaceEquiv S Λ X).functor.obj
        ((supportRestrict S Λ (S.ofStd X) Z).obj L)).presheaf.stalk x)) := by
  sorry

/-- C7/support-restriction API: `j′_!j′^*A → A → A|_Z` is a distinguished triangle, for the
open complement given as an étale monomorphism `W → U` with image `|U| ∖ Z`. -/
theorem supportRestrict.triangle (U : S.V) (Z : Set (S.pts.obj U)) (hZ : IsClosed Z)
    (hZc : Topology.IsConstructible Z) (W : S.EtVOver U) (hW : Mono (etvMap S W))
    (hWZ : Set.range (S.pts.map (etvMap S W)) = Zᶜ) (A : DetCat S Λ U) :
    ∃ δ : ((supportRestrictDerived S Λ U Z).obj A).obj ⟶
        ((etaleShriek S Λ W).obj ((pull S Λ (etvMap S W)).obj A)).obj⟦(1 : ℤ)⟧,
      Pretriangulated.Triangle.mk ((Det S Λ U).ι.map ((etaleShriekAdj S Λ W).counit.app A))
        ((Det S Λ U).ι.map ((supportRestrictDerivedπ S Λ U Z).app A)) δ ∈
          Pretriangulated.distinguishedTriangles := by
  sorry

/-- C7/support-restriction API: `(A|_Z)|_Z ≅ A|_Z` and `(A|_Z)|_{Z′} ≅ A|_{Z∩Z′}`. -/
theorem supportRestrict.idempotent (U : S.V) (Z Z' : Set (S.pts.obj U)) (hZ : IsClosed Z)
    (hZc : Topology.IsConstructible Z) (hZ' : IsClosed Z') (hZ'c : Topology.IsConstructible Z')
    (A : DetCat S Λ U) :
    Nonempty ((supportRestrictDerived S Λ U Z).obj ((supportRestrictDerived S Λ U Z).obj A) ≅
      (supportRestrictDerived S Λ U Z).obj A) ∧
    Nonempty ((supportRestrictDerived S Λ U Z').obj ((supportRestrictDerived S Λ U Z).obj A) ≅
      (supportRestrictDerived S Λ U (Z ∩ Z')).obj A) := by
  sorry

/-- test supportRestrict_all (degenerate): for `Z = |U|`, `L|_Z = L`; for `Z = ∅`, `L|_Z = 0`. -/
example (U : S.LS) (L : EtSh S Λ U) :
    Nonempty ((supportRestrict S Λ U Set.univ).obj L ≅ L) ∧
      IsZero ((supportRestrict S Λ U ∅).obj L) := by
  sorry

/-- test supportRestrict_point (computation): for a closed constructible point `s` of a strictly
totally disconnected `U` (the closed point of the rank-2 point `Spa(C, C⁺)`), `Λ|_{s}` has stalk
`Λ` at `s` and `0` elsewhere. -/
example (X : S.Std) (s : stdPts S X) (hs : IsClosed ({s} : Set (stdPts S X)))
    (hsc : Topology.IsConstructible ({s} : Set (stdPts S X))) :
    Nonempty (((stdSpaceEquiv S Λ X).functor.obj ((supportRestrict S Λ (S.ofStd X) {s}).obj
        ((constantSheaf (etaleSite S _) (ModuleCat.{u} Λ)).obj (ModuleCat.of Λ Λ)))).presheaf.stalk s ≅
          ModuleCat.of Λ Λ) ∧
    ∀ x, x ≠ s → IsZero (((stdSpaceEquiv S Λ X).functor.obj ((supportRestrict S Λ (S.ofStd X) {s}).obj
        ((constantSheaf (etaleSite S _) (ModuleCat.{u} Λ)).obj (ModuleCat.of Λ Λ)))).presheaf.stalk x) := by
  sorry

/-- test supportRestrict_triangle (characterisation): `j′^*(A|_Z) = 0`. -/
example (U : S.V) (Z : Set (S.pts.obj U)) (hZ : IsClosed Z) (hZc : Topology.IsConstructible Z)
    (W : S.EtVOver U) (hW : Mono (etvMap S W)) (hWZ : Set.range (S.pts.map (etvMap S W)) = Zᶜ)
    (A : DetCat S Λ U) :
    IsZero ((pull S Λ (etvMap S W)).obj ((supportRestrictDerived S Λ U Z).obj A)).obj := by
  sorry

-- test supportRestrict_not_subsheaf (non-example): for Z = {s} in Spa(C, C⁺), L|_Z is not i_∗ of
-- a sheaf on a closed sub-v-sheaf, since {s} is not generalizing. Not stated: closed sub-v-sheaves
-- and pushforward along them are not part of the `Carriers` data.

/-! ### Filtrations (C7/constructible-filtration) -/

/-- `F` has a finite filtration `0 = F₀ ⊂ F₁ ⊂ ⋯ ⊂ Fₙ ≅ F` whose graded pieces satisfy `P`. -/
def HasFiltrationBy {C : Type*} [Category* C] [Abelian C] (P : C → Prop) (F : C) : Prop :=
  ∃ (n : ℕ) (G : Fin (n + 1) → C) (m : ∀ i : Fin n, G i.castSucc ⟶ G i.succ),
    (∀ i, Mono (m i)) ∧ IsZero (G 0) ∧ Nonempty (G (Fin.last n) ≅ F) ∧ ∀ i, P (cokernel (m i))

/-- `G[0] ≅ j_!(L|_Z)` for a quasicompact separated étale `j : U → Y` with locally spatial source
`U ≅ S.ofLS V`, a constructible closed `Z ⊂ |V|` and a local system `L` on `V`. -/
def IsGradedPieceCons [IsNoetherianRing Λ] {Y : S.V} (G : VSh S Λ Y) : Prop :=
  ∃ (W : S.EtVOver Y) (V : S.LS) (e : S.ofLS V ≅ etvSrc S W) (Z : Set (S.pts.obj (S.ofLS V)))
    (L : EtSh S Λ V) (B : DetCat S Λ (etvSrc S W)),
    IsQuasicompactMap S (etvMap S W) ∧ IsSeparatedMap S (etvMap S W) ∧ IsClosed Z ∧
    Topology.IsConstructible Z ∧ IsLocalSystem S Λ V L ∧
    Nonempty (B.obj ≅ (vPull S Λ e.inv).obj
      ((singleV S Λ _).obj ((etToV S Λ V).obj ((supportRestrict S Λ V Z).obj L)))) ∧
    Nonempty ((singleV S Λ Y).obj G ≅ ((etaleShriek S Λ W).obj B).obj)

/-- DiamondEtaleCohomology:C7/constructible-filtration (ECD Proposition 20.8), for a spatial
diamond `Y` (locally spatial with `|Y|` quasicompact and quasiseparated). -/
theorem constructibleFiltration [IsNoetherianRing Λ] (Y : S.LS)
    [CompactSpace (S.pts.obj (S.ofLS Y))] [QuasiSeparatedSpace (S.pts.obj (S.ofLS Y))]
    (F : EtSh S Λ Y) :
    IsConstructible S Λ (S.ofLS Y) ((etToV S Λ Y).obj F) ↔
      HasFiltrationBy (IsGradedPieceCons S Λ (Y := S.ofLS Y)) ((etToV S Λ Y).obj F) := by
  sorry

/-! ### Limits of spatial diamonds (C7/constructible-limit-descent) -/

/-- The 2-colimit `2-colim_i Cons(Y_i, Λ)` along pullback, for a cofiltered system of spatial
diamonds (a construction of C7/constructible-limit-descent). -/
def consColim [IsNoetherianRing Λ] {I : Type u} [SmallCategory I] (D : I ⥤ S.LS) :
    Type (u + 1) := sorry

instance consColimCategory [IsNoetherianRing Λ] {I : Type u} [SmallCategory I] (D : I ⥤ S.LS) :
    Category.{u} (consColim S Λ D) := sorry

/-- The natural functor `2-colim_i Cons(Y_i, Λ) → Cons(Y, Λ)` to the limit `Y` (pullback along the
projections `Y → Y_i`). -/
def consColimComparison [IsNoetherianRing Λ] {I : Type u} [SmallCategory I] (D : I ⥤ S.LS)
    (c : Cone (D ⋙ S.lsDia ⋙ S.diaV)) : consColim S Λ D ⥤ Cons S Λ c.pt := sorry

/-- DiamondEtaleCohomology:C7/constructible-limit-descent (ECD Proposition 20.7): for a cofiltered
system of spatial diamonds whose limit `Y` is a spatial diamond, `2-colim_i Cons(Y_i) → Cons(Y)`
is an equivalence. -/
theorem constructibleLimitDescent [IsNoetherianRing Λ] {I : Type u} [SmallCategory I]
    [IsCofiltered I] (D : I ⥤ S.LS)
    (hD : ∀ i, CompactSpace (S.pts.obj (S.ofLS (D.obj i))) ∧
      QuasiSeparatedSpace (S.pts.obj (S.ofLS (D.obj i))))
    (c : Cone (D ⋙ S.lsDia ⋙ S.diaV)) (hc : IsLimit c) (Y : S.LS) (e : S.ofLS Y ≅ c.pt)
    (hY : CompactSpace (S.pts.obj (S.ofLS Y)) ∧ QuasiSeparatedSpace (S.pts.obj (S.ofLS Y))) :
    (consColimComparison S Λ D c).IsEquivalence := by
  sorry

/-! ### Perfect complexes and the derived constant and restriction functors -/

/-- Perfect complexes of Λ-modules: objects of `D(Λ)` isomorphic to a bounded complex of finitely
generated projective modules. Absent from Mathlib (owner DeformationAndDerivedPatchingAlgebra:P7);
this is the standard definition. -/
def IsPerfectComplex : ObjectProperty (DerivedCategory (ModuleCat.{u} Λ)) := fun A =>
  ∃ (K : CochainComplex (ModuleCat.{u} Λ) ℤ) (a b : ℤ),
    (∀ n, (n < a ∨ b < n) → IsZero (K.X n)) ∧
    (∀ n, Module.Projective Λ (K.X n) ∧ Module.Finite Λ (K.X n)) ∧
    Nonempty (DerivedCategory.Q.obj K ≅ A)

instance constantSheaf_preservesFiniteLimits {C : Type u} [SmallCategory C]
    (J : GrothendieckTopology C) : PreservesFiniteLimits (constantSheaf J (ModuleCat.{u} Λ)) :=
  inferInstanceAs (PreservesFiniteLimits (Functor.const _ ⋙ presheafToSheaf J (ModuleCat.{u} Λ)))

instance constantSheaf_preservesFiniteColimits {C : Type u} [SmallCategory C]
    (J : GrothendieckTopology C) : PreservesFiniteColimits (constantSheaf J (ModuleCat.{u} Λ)) :=
  inferInstanceAs (PreservesFiniteColimits (Functor.const _ ⋙ presheafToSheaf J (ModuleCat.{u} Λ)))

instance topConst_additive (X : TopCat.{u}) : (topConst Λ X).Additive :=
  inferInstanceAs ((constantSheaf (Opens.grothendieckTopology X) (ModuleCat.{u} Λ)).Additive)

instance topConst_preservesFiniteLimits (X : TopCat.{u}) : PreservesFiniteLimits (topConst Λ X) :=
  inferInstanceAs (PreservesFiniteLimits
    (constantSheaf (Opens.grothendieckTopology X) (ModuleCat.{u} Λ)))

instance topConst_preservesFiniteColimits (X : TopCat.{u}) :
    PreservesFiniteColimits (topConst Λ X) :=
  inferInstanceAs (PreservesFiniteColimits
    (constantSheaf (Opens.grothendieckTopology X) (ModuleCat.{u} Λ)))

/-- Restriction of sheaves of modules on spaces (Mathlib's `TopCat.Sheaf.pullback`) is left exact
(stalks of `f^*F` are stalks of `F`); this standard fact is not yet in Mathlib. -/
theorem sheafPullback_preservesFiniteLimits {X Y : TopCat.{u}} (f : X ⟶ Y) :
    PreservesFiniteLimits (TopCat.Sheaf.pullback (ModuleCat.{u} Λ) f) := by
  sorry

attribute [local instance] sheafPullback_preservesFiniteLimits

instance sheafPullback_additive {X Y : TopCat.{u}} (f : X ⟶ Y) :
    (TopCat.Sheaf.pullback (ModuleCat.{u} Λ) f).Additive :=
  Functor.additive_of_preserves_binary_products _

instance stdSpaceEquiv_additive (X : S.Std) : (stdSpaceEquiv S Λ X).functor.Additive :=
  Functor.additive_of_preserves_binary_products _

/-- The constant complex functor `D(Λ) → D(X, Λ)` on a topological space. -/
abbrev constDerivedTop (X : TopCat.{u}) :
    DerivedCategory (ModuleCat.{u} Λ) ⥤ DerivedCategory (TopCat.Sheaf (ModuleCat.{u} Λ) X) :=
  (topConst Λ X).mapDerivedCategory

/-- Restriction `A ↦ A|_Z` of complexes of sheaves to a subspace. -/
abbrev restrictDerivedTop {X : TopCat.{u}} (Z : Set X) :
    DerivedCategory (TopCat.Sheaf (ModuleCat.{u} Λ) X) ⥤
      DerivedCategory (TopCat.Sheaf (ModuleCat.{u} Λ) (TopCat.of Z)) :=
  (TopCat.Sheaf.pullback (ModuleCat.{u} Λ) (subspaceIncl Z)).mapDerivedCategory

/-- `D(X_ét, Λ) ≃ D(|X|, Λ)` for strictly totally disconnected `X`. -/
abbrev stdDerivedEquiv (X : S.Std) :
    DEt S Λ (S.ofStd X) ⥤ DerivedCategory (TopCat.Sheaf (ModuleCat.{u} Λ) (stdPts S X)) :=
  (stdSpaceEquiv S Λ X).functor.mapDerivedCategory

/-- The constant complex functor `D(Λ) → D(Y_v, Λ)`. -/
abbrev constDV (Y : S.V) : DerivedCategory (ModuleCat.{u} Λ) ⥤ DV S Λ Y :=
  (constantSheaf (vSite S Y) (ModuleCat.{u} Λ)).mapDerivedCategory

/-- A finite stratification of `X` into constructible locally closed subsets on each of which `A`
is the constant complex of a perfect complex. -/
def IsPcStratification {X : TopCat.{u}} (A : DerivedCategory (TopCat.Sheaf (ModuleCat.{u} Λ) X))
    (n : ℕ) (Z : Fin n → Set X) : Prop :=
  (∀ i, Topology.IsConstructible (Z i) ∧ IsLocallyClosed (Z i)) ∧
    Pairwise (fun i j => Disjoint (Z i) (Z j)) ∧ (⋃ i, Z i) = Set.univ ∧
    ∀ i, ∃ P, IsPerfectComplex Λ P ∧
      Nonempty ((restrictDerivedTop Λ (Z i)).obj A ≅ (constDerivedTop Λ (TopCat.of (Z i))).obj P)

/-- Perfect-constructibility of a complex of sheaves on a spectral space (ECD Definition 20.11(i),
on `|X|`). -/
def IsPerfectConstructibleTop {X : TopCat.{u}} [SpectralSpace X]
    (A : DerivedCategory (TopCat.Sheaf (ModuleCat.{u} Λ) X)) : Prop :=
  ∃ (n : ℕ) (Z : Fin n → Set X), IsPcStratification Λ A n Z

/-- DiamondEtaleCohomology:C7/perfect-constructible-std (ECD Definition 20.11(i)): perfect-
constructibility of `A ∈ D(X_ét, Λ) ≃ D(|X|, Λ)` for strictly totally disconnected `X`. -/
def IsPerfectConstructibleStd (X : S.Std) (A : DEt S Λ (S.ofStd X)) : Prop :=
  IsPerfectConstructibleTop Λ ((stdDerivedEquiv S Λ X).obj A)

/-- C7/perfect-constructible-std API: pullback along maps of strictly totally disconnected
spaces preserves perfect-constructibility (computed in `D_ét`). -/
theorem IsPerfectConstructibleStd.pullback {X' X : S.Std} (g : X' ⟶ X) (A : DEt S Λ (S.ofStd X))
    (hA : IsPerfectConstructibleStd S Λ X A) :
    ∃ A' : DEt S Λ (S.ofStd X'), IsPerfectConstructibleStd S Λ X' A' ∧
      Nonempty ((stdEmb S Λ X').obj A' ≅ (vPull S Λ (stdMapV S g)).obj ((stdEmb S Λ X).obj A)) := by
  sorry

/-- C7/perfect-constructible-std API: a witnessing stratification may be refined, and two
witnessing stratifications have a common witnessing refinement. -/
theorem IsPerfectConstructibleStd.refine (X : S.Std) (A : DEt S Λ (S.ofStd X)) :
    (∀ (n m : ℕ) (Z : Fin n → Set (stdPts S X)) (Z' : Fin m → Set (stdPts S X)),
      IsPcStratification Λ ((stdDerivedEquiv S Λ X).obj A) n Z →
      (∀ j, Topology.IsConstructible (Z' j) ∧ IsLocallyClosed (Z' j)) →
      Pairwise (fun i j => Disjoint (Z' i) (Z' j)) → (⋃ j, Z' j) = Set.univ →
      (∀ j, ∃ i, Z' j ⊆ Z i) → IsPcStratification Λ ((stdDerivedEquiv S Λ X).obj A) m Z') ∧
    (∀ (n m : ℕ) (Z : Fin n → Set (stdPts S X)) (Z' : Fin m → Set (stdPts S X)),
      IsPcStratification Λ ((stdDerivedEquiv S Λ X).obj A) n Z →
      IsPcStratification Λ ((stdDerivedEquiv S Λ X).obj A) m Z' →
      ∃ (k : ℕ) (Z'' : Fin k → Set (stdPts S X)),
        IsPcStratification Λ ((stdDerivedEquiv S Λ X).obj A) k Z'' ∧
          ∀ l, (∃ i, Z'' l ⊆ Z i) ∧ ∃ j, Z'' l ⊆ Z' j) := by
  sorry

/-- test isPerfectConstructibleStd_point (computation): for `X = Spa(C, O_C)` (one point), `A` is
perfect-constructible iff it is the constant complex of a perfect complex, i.e. iff `RΓ(X, A)` is
perfect (on a point `A` is the constant complex on `RΓ(X, A)`). -/
example (X : S.Std) [Unique (stdPts S X)] (A : DEt S Λ (S.ofStd X)) :
    IsPerfectConstructibleStd S Λ X A ↔ ∃ P, IsPerfectComplex Λ P ∧
      Nonempty ((stdDerivedEquiv S Λ X).obj A ≅ (constDerivedTop Λ (stdPts S X)).obj P) := by
  sorry

/-- test isPerfectConstructibleStd_zero (degenerate): the zero complex is perfect-constructible. -/
example (X : S.Std) (A : DEt S Λ (S.ofStd X)) (hA : IsZero A) : IsPerfectConstructibleStd S Λ X A := by
  sorry

/-- test isPerfectConstructibleStd_field (compatibility): over a field, perfect-constructible iff
bounded with constructible cohomology sheaves. -/
example [IsNoetherianRing Λ] (hΛ : IsField Λ) (X : S.Std) (A : DEt S Λ (S.ofStd X)) :
    IsPerfectConstructibleStd S Λ X A ↔
      (∃ a b : ℤ, ∀ n, (n < a ∨ b < n) → IsZero ((DerivedCategory.homologyFunctor _ n).obj A)) ∧
        ∀ n, IsConstructibleStd S Λ X ((DerivedCategory.homologyFunctor _ n).obj A) := by
  sorry

/-- test isPerfectConstructibleStd_not (non-example): on `X = Spa(C, O_C)`, the constant sheaf of a
finitely generated module `M` that is not perfect (e.g. `Z = Λ/ε` over `Λ = Z[ε]/(ε²)`) is
constructible but not perfect-constructible. -/
example [IsNoetherianRing Λ] (X : S.Std) [Unique (stdPts S X)] (M : ModuleCat.{u} Λ)
    [Module.Finite Λ M] (hM : ¬ IsPerfectComplex Λ ((DerivedCategory.singleFunctor _ 0).obj M)) :
    IsConstructibleStd S Λ X ((constantSheaf (etaleSite S _) (ModuleCat.{u} Λ)).obj M) ∧
      ¬ IsPerfectConstructibleStd S Λ X
        ((singleEt S Λ _).obj ((constantSheaf (etaleSite S _) (ModuleCat.{u} Λ)).obj M)) := by
  sorry

/-! ### Perfect-constructible complexes on small v-stacks (C7/perfect-constructible) -/

/-- `f^*A` is (the image of) a perfect-constructible complex on the strictly totally disconnected
`X`. -/
def IsPerfectConstructibleAt {Y : S.V} (A : DV S Λ Y) (X : S.Std)
    (f : S.ofLS (S.ofStd X) ⟶ Y) : Prop :=
  ∃ B : DEt S Λ (S.ofStd X), IsPerfectConstructibleStd S Λ X B ∧
    Nonempty ((vPull S Λ f).obj A ≅ (stdEmb S Λ X).obj B)

/-- C7/perfect-constructible API (ECD Definition 20.11(ii)): `A ∈ D_ét(Y, Λ)` and `f^*A` is
perfect-constructible for every strictly totally disconnected `f : X → Y`. -/
def IsPerfectConstructible (Y : S.V) : ObjectProperty (DV S Λ Y) := fun A =>
  Det S Λ Y A ∧ ∀ (X : S.Std) (f : S.ofLS (S.ofStd X) ⟶ Y), IsPerfectConstructibleAt S Λ A X f

/-- C7/perfect-constructible API: the full subcategory `D_ét,pc(Y, Λ)`. -/
abbrev Dpc (Y : S.V) := (IsPerfectConstructible S Λ Y).FullSubcategory

/-- `A` is locally bounded: bounded after pullback to every strictly totally disconnected space. -/
def IsLocallyBounded {Y : S.V} (A : DV S Λ Y) : Prop :=
  ∀ (X : S.Std) (f : S.ofLS (S.ofStd X) ⟶ Y), ∃ a b : ℤ, ∀ n, (n < a ∨ b < n) →
    IsZero ((DerivedCategory.homologyFunctor _ n).obj ((vPull S Λ f).obj A))

/-- All geometric stalks of `A` are perfect: the pullback to every one-point strictly totally
disconnected space `Spa(C, O_C)` is the constant complex of a perfect complex. -/
def HasPerfectStalks {Y : S.V} (A : DV S Λ Y) : Prop :=
  ∀ (X : S.Std), Unique (stdPts S X) → ∀ f : S.ofLS (S.ofStd X) ⟶ Y,
    ∃ P, IsPerfectComplex Λ P ∧ Nonempty ((vPull S Λ f).obj A ≅ (constDV S Λ _).obj P)

/-- DiamondEtaleCohomology:C7/perfect-constructible-stalk-criterion (ECD Proposition 20.12) -/
theorem perfectConstructibleStalkCriterion [IsNoetherianRing Λ] (Y : S.V) (A : DV S Λ Y) :
    IsPerfectConstructible S Λ Y A ↔ Det S Λ Y A ∧ IsLocallyBounded S Λ A ∧
      (∀ n, IsConstructible S Λ Y ((DerivedCategory.homologyFunctor _ n).obj A)) ∧
      HasPerfectStalks S Λ A := by
  sorry

/-- C7/perfect-constructible API: pullback along any map of small v-stacks preserves
perfect-constructibility. -/
theorem IsPerfectConstructible.pullback {Y' Y : S.V} (g : Y' ⟶ Y) (A : DV S Λ Y)
    (hA : IsPerfectConstructible S Λ Y A) : IsPerfectConstructible S Λ Y' ((vPull S Λ g).obj A) := by
  sorry

/-- C7/perfect-constructible API: for a surjection `X → Y` from a strictly totally disconnected
space, `A` is perfect-constructible iff `A ∈ D_ét` and its pullback is (node
C7/perfect-constructible-v-descent). -/
theorem IsPerfectConstructible.iff_cover {Y : S.V} (X : S.Std) (f : S.ofLS (S.ofStd X) ⟶ Y)
    (hf : IsSurjectiveMap S f) (A : DV S Λ Y) :
    IsPerfectConstructible S Λ Y A ↔ Det S Λ Y A ∧ IsPerfectConstructibleAt S Λ A X f := by
  sorry

/-- C7/perfect-constructible API: the stalk criterion over noetherian Λ (node
C7/perfect-constructible-stalk-criterion). -/
theorem IsPerfectConstructible.iff_noetherian [IsNoetherianRing Λ] (Y : S.V) (A : DV S Λ Y) :
    IsPerfectConstructible S Λ Y A ↔ Det S Λ Y A ∧ IsLocallyBounded S Λ A ∧
      (∀ n, IsConstructible S Λ Y ((DerivedCategory.homologyFunctor _ n).obj A)) ∧
      HasPerfectStalks S Λ A :=
  perfectConstructibleStalkCriterion S Λ Y A

/-- C7/perfect-constructible API: `j_!B` is perfect-constructible for a quasicompact separated étale
`j : U → Y` and perfect-constructible `B` on `U`. -/
theorem IsPerfectConstructible.etaleShriek {Y : S.V} (W : S.EtVOver Y)
    (hqc : IsQuasicompactMap S (etvMap S W)) (hsep : IsSeparatedMap S (etvMap S W))
    (B : DetCat S Λ (etvSrc S W)) (hB : IsPerfectConstructible S Λ _ B.obj) :
    IsPerfectConstructible S Λ Y ((etaleShriek S Λ W).obj B).obj := by
  sorry

/-- C7/perfect-constructible API: `D_ét,pc(Y, Λ)` contains `Λ_Y` and is closed under `⊗^L`. -/
theorem IsPerfectConstructible.tensor (Y : S.V) :
    IsPerfectConstructible S Λ Y (unitObj S Λ Y).obj ∧
      ∀ A B : DetCat S Λ Y, IsPerfectConstructible S Λ Y A.obj → IsPerfectConstructible S Λ Y B.obj →
        IsPerfectConstructible S Λ Y (((etTensor S Λ Y).obj A).obj B).obj := by
  sorry

/-- Derived extension of scalars `Λ′ ⊗^L_Λ −` on v-derived categories (the functor of
C3/change-of-coefficients, `extendScalars`). -/
def extendScalarsDV (Λ' : Type u) [CommRing Λ'] [Algebra Λ Λ'] (Y : S.V) :
    DV S Λ Y ⥤ DV S Λ' Y := sorry

/-- C7/perfect-constructible API: extension of scalars preserves perfect-constructibility. -/
theorem IsPerfectConstructible.changeOfRings (Λ' : Type u) [CommRing Λ'] [Algebra Λ Λ'] {Y : S.V}
    (A : DV S Λ Y) (hA : IsPerfectConstructible S Λ Y A) :
    IsPerfectConstructible S Λ' Y ((extendScalarsDV S Λ Λ' Y).obj A) := by
  sorry

/-- test isPerfectConstructible_unit (computation): `Λ_Y` is perfect-constructible. -/
example (Y : S.V) : IsPerfectConstructible S Λ Y (unitObj S Λ Y).obj := by sorry

/-- test isPerfectConstructible_zero (degenerate): `0` is perfect-constructible. -/
example (Y : S.V) (A : DV S Λ Y) (hA : IsZero A) : IsPerfectConstructible S Λ Y A := by sorry

/-- test isPerfectConstructible_field (compatibility): for a field Λ (e.g. `F_ℓ`), `D_ét,pc` consists
of the locally bounded complexes in `D_ét` with constructible cohomology sheaves. -/
example [IsNoetherianRing Λ] (hΛ : IsField Λ) (Y : S.V) (A : DV S Λ Y) :
    IsPerfectConstructible S Λ Y A ↔ Det S Λ Y A ∧ IsLocallyBounded S Λ A ∧
      ∀ n, IsConstructible S Λ Y ((DerivedCategory.homologyFunctor _ n).obj A) := by
  sorry

/-- test isPerfectConstructible_not_bounded_cons (non-example): on `Spa(K, O_K)`, the constant sheaf
of a finitely generated non-perfect module (e.g. `Λ/ε` over `Λ = Z[ε]/(ε²)`) is constructible
(so `M_Y[0]` is bounded with constructible cohomology) but not perfect-constructible. -/
example [IsNoetherianRing Λ] (K : S.FieldPair) (M : ModuleCat.{u} Λ) [Module.Finite Λ M]
    (hM : ¬ IsPerfectComplex Λ ((DerivedCategory.singleFunctor _ 0).obj M)) :
    IsConstructible S Λ (S.spaCirc (S.fieldTate K)) ((constantSheaf (vSite S _) (ModuleCat.{u} Λ)).obj M) ∧
      ¬ IsPerfectConstructible S Λ (S.spaCirc (S.fieldTate K))
        ((singleV S Λ _).obj ((constantSheaf (vSite S _) (ModuleCat.{u} Λ)).obj M)) := by
  sorry

/-- test isPerfectConstructible_not_sum (non-example): `⊕_{n∈ℕ} Λ_Y` (`Λ ≠ 0`, here on
`Y = Spa(K, O_K)`) is not perfect-constructible. -/
example [Nontrivial Λ] (K : S.FieldPair) :
    ¬ IsPerfectConstructible S Λ (S.spaCirc (S.fieldTate K))
      ((singleV S Λ _).obj ((constantSheaf (vSite S _) (ModuleCat.{u} Λ)).obj
        (ModuleCat.of Λ (ℕ →₀ Λ)))) := by
  sorry

/-- DiamondEtaleCohomology:C7/perfect-constructible-thick (ECD after Definition 20.11):
`D_ét,pc(Y, Λ)` is a thick triangulated subcategory (of `D(Y_v, Λ)`, hence of `D_ét(Y, Λ)`). -/
theorem perfectConstructibleThick (Y : S.V) :
    (IsPerfectConstructible S Λ Y).IsTriangulated ∧
      (IsPerfectConstructible S Λ Y).IsStableUnderRetracts := by
  sorry

/-- DiamondEtaleCohomology:C7/perfect-constructible-over-field (ECD §1 and Proposition 20.12): over a
field, perfect-constructible ⇔ locally bounded with constructible cohomology sheaves; for a
quasicompact locally spatial `Y`, ⇔ bounded with constructible cohomology sheaves. -/
theorem perfectConstructibleOverField [IsNoetherianRing Λ] (hΛ : IsField Λ) :
    (∀ (Y : S.V) (A : DV S Λ Y), IsPerfectConstructible S Λ Y A ↔ Det S Λ Y A ∧
      IsLocallyBounded S Λ A ∧ ∀ n, IsConstructible S Λ Y ((DerivedCategory.homologyFunctor _ n).obj A)) ∧
    ∀ (Y : S.LS), CompactSpace (S.pts.obj (S.ofLS Y)) → ∀ A : DV S Λ (S.ofLS Y),
      IsPerfectConstructible S Λ _ A ↔ Det S Λ _ A ∧
        (∃ a b : ℤ, ∀ n, (n < a ∨ b < n) → IsZero ((DerivedCategory.homologyFunctor _ n).obj A)) ∧
        ∀ n, IsConstructible S Λ _ ((DerivedCategory.homologyFunctor _ n).obj A) := by
  sorry

/-- DiamondEtaleCohomology:C7/perfect-constructible-v-descent (ECD Proposition 20.13) -/
theorem perfectConstructibleVDescent {Y' Y : S.V} (f : Y' ⟶ Y) (hf : IsSurjectiveMap S f)
    (A : DV S Λ Y) (hA : Det S Λ Y A)
    (h : IsPerfectConstructible S Λ Y' ((vPull S Λ f).obj A)) : IsPerfectConstructible S Λ Y A := by
  sorry

/-! ### Locally constant complexes with perfect values (C7/perfect-local-system) -/

/-- C7/perfect-local-system API: `A ∈ D_ét(U, Λ)` is v-locally the constant complex of a perfect
complex: for every object `V` of `U_v`, the objects `W → V` over which `A` becomes constant with
perfect value generate a covering sieve. -/
def IsPerfectLocalSystem (U : S.V) (A : DV S Λ U) : Prop :=
  Det S Λ U A ∧ ∀ V : S.VOver U, Sieve.generate (fun ⦃W : S.VOver U⦄ (_ : W ⟶ V) =>
    ∃ P, IsPerfectComplex Λ P ∧
      Nonempty ((vPull S Λ ((S.vSrc U).obj W).hom).obj A ≅
        (constDV S Λ ((S.vSrc U).obj W).left).obj P)) ∈ vSite S U V

/-- C7/perfect-local-system API: `A` is dualizable with dual `A^∨ = RHom_Λ(A, Λ_U)`, and
`A^∨ ⊗^L B ≅ RHom_Λ(A, B)`. -/
theorem IsPerfectLocalSystem.dualizable (U : S.V) (A : DetCat S Λ U)
    (hA : IsPerfectLocalSystem S Λ U A.obj) (B : DetCat S Λ U) :
    Nonempty (((etTensor S Λ U).obj (((etHom S Λ U).obj (Opposite.op A)).obj (unitObj S Λ U))).obj B ≅
      ((etHom S Λ U).obj (Opposite.op A)).obj B) := by
  sorry

/-- C7/perfect-local-system API: pullback preserves the property. -/
theorem IsPerfectLocalSystem.pullback {U' U : S.V} (g : U' ⟶ U) (A : DV S Λ U)
    (hA : IsPerfectLocalSystem S Λ U A) : IsPerfectLocalSystem S Λ U' ((vPull S Λ g).obj A) := by
  sorry

/-- C7/perfect-local-system API: closed under shifts, retracts, `⊗^L` and duals. (It is not
closed under cones in general; that negative statement is not formalised.) -/
theorem IsPerfectLocalSystem.triangle (U : S.V) :
    ObjectProperty.IsStableUnderShift (fun A => IsPerfectLocalSystem S Λ U A : ObjectProperty (DV S Λ U)) ℤ ∧
    ObjectProperty.IsStableUnderRetracts
      (fun A => IsPerfectLocalSystem S Λ U A : ObjectProperty (DV S Λ U)) ∧
    (∀ A B : DetCat S Λ U, IsPerfectLocalSystem S Λ U A.obj → IsPerfectLocalSystem S Λ U B.obj →
      IsPerfectLocalSystem S Λ U (((etTensor S Λ U).obj A).obj B).obj) ∧
    ∀ A : DetCat S Λ U, IsPerfectLocalSystem S Λ U A.obj →
      IsPerfectLocalSystem S Λ U (((etHom S Λ U).obj (Opposite.op A)).obj (unitObj S Λ U)).obj := by
  sorry

/-- C7/perfect-local-system API: on a spatial diamond, locally constant complexes with perfect
values are perfect-constructible. -/
theorem IsPerfectLocalSystem.isPerfectConstructible (U : S.LS)
    [CompactSpace (S.pts.obj (S.ofLS U))] [QuasiSeparatedSpace (S.pts.obj (S.ofLS U))]
    (A : DV S Λ (S.ofLS U)) (hA : IsPerfectLocalSystem S Λ _ A) :
    IsPerfectConstructible S Λ _ A := by
  sorry

/-- test isPerfectLocalSystem_unit (degenerate): `Λ_U` is locally constant with perfect values. -/
example (U : S.V) : IsPerfectLocalSystem S Λ U (unitObj S Λ U).obj := by sorry

/-- test isPerfectLocalSystem_point (computation): on `Spa(C, O_C)` (a one-point strictly totally
disconnected space) these are exactly the constant complexes of perfect complexes. -/
example (X : S.Std) [Unique (stdPts S X)] (A : DV S Λ (S.ofLS (S.ofStd X))) :
    IsPerfectLocalSystem S Λ _ A ↔ ∃ P, IsPerfectComplex Λ P ∧ Nonempty (A ≅ (constDV S Λ _).obj P) := by
  sorry

/-- test isPerfectLocalSystem_field (compatibility): over a field, `A` is locally constant with
perfect values iff it is bounded and its cohomology sheaves are local systems of
finite-dimensional vector spaces (i.e. their `[0]` are locally constant with perfect values). -/
example (hΛ : IsField Λ) (U : S.V) (A : DV S Λ U) :
    IsPerfectLocalSystem S Λ U A ↔ Det S Λ U A ∧
      (∃ a b : ℤ, ∀ n, (n < a ∨ b < n) → IsZero ((DerivedCategory.homologyFunctor _ n).obj A)) ∧
      ∀ n, IsPerfectLocalSystem S Λ U ((singleV S Λ U).obj ((DerivedCategory.homologyFunctor _ n).obj A)) := by
  sorry

/-- test isPerfectLocalSystem_not_fg (non-example): the constant complex of a module that is not
perfect (e.g. `Q` over `Z`) on a nonempty `U` is locally constant but not with perfect values. -/
example (U : S.V) [Nonempty (S.pts.obj U)] (M : ModuleCat.{u} Λ)
    (hM : ¬ IsPerfectComplex Λ ((DerivedCategory.singleFunctor _ 0).obj M)) :
    ¬ IsPerfectLocalSystem S Λ U ((singleV S Λ U).obj ((constantSheaf (vSite S U) (ModuleCat.{u} Λ)).obj M)) := by
  sorry

/-! ### Restricted compactness, filtrations and limits (C7/perfect-constructible-*) -/

/-- DiamondEtaleCohomology:C7/perfect-constructible-restricted-compactness (ECD Proposition 20.14):
for a spatial diamond `Y` and perfect-constructible `A`, `Hom(A, −)` commutes with filtered colimits
of complexes uniformly bounded to the left in `D_ét` (colimits computed on complexes of sheaves,
which compute the filtered colimit in `D(Y_v, Λ)`). -/
theorem perfectConstructibleRestrictedCompactness (Y : S.LS)
    [CompactSpace (S.pts.obj (S.ofLS Y))] [QuasiSeparatedSpace (S.pts.obj (S.ofLS Y))]
    (A : DV S Λ (S.ofLS Y)) (hA : IsPerfectConstructible S Λ _ A) (n : ℤ) {J : Type u}
    [SmallCategory J] [IsFiltered J] (K : J ⥤ CochainComplex (VSh S Λ (S.ofLS Y)) ℤ)
    (c : Cocone K) (hc : IsColimit c)
    (hK : ∀ j, Det S Λ _ (DerivedCategory.Q.obj (K.obj j)) ∧ ∀ k : ℤ, k < -n →
      IsZero ((DerivedCategory.homologyFunctor _ k).obj (DerivedCategory.Q.obj (K.obj j)))) :
    IsIso (colimit.desc (K ⋙ DerivedCategory.Q ⋙ coyoneda.obj (Opposite.op A))
      ((coyoneda.obj (Opposite.op A)).mapCocone (DerivedCategory.Q.mapCocone c))) := by
  sorry

/-- `A` has a finite filtration `0 = A₀ → A₁ → ⋯ → Aₙ ≅ A` in `D(Y_v, Λ)` whose cones satisfy `P`. -/
def HasTriangFiltrationBy {Y : S.V} (P : DV S Λ Y → Prop) (A : DV S Λ Y) : Prop :=
  ∃ (n : ℕ) (B : Fin (n + 1) → DV S Λ Y) (m : ∀ i : Fin n, B i.castSucc ⟶ B i.succ),
    IsZero (B 0) ∧ Nonempty (B (Fin.last n) ≅ A) ∧
    ∀ i : Fin n, ∃ (G : DV S Λ Y) (g : B i.succ ⟶ G) (δ : G ⟶ (B i.castSucc)⟦(1 : ℤ)⟧),
      Pretriangulated.Triangle.mk (m i) g δ ∈ Pretriangulated.distinguishedTriangles ∧ P G

/-- `G ≅ j_!(L|_Z)` for a quasicompact separated étale `j : U → Y` with locally spatial source, a
constructible closed `Z ⊂ |U|` and `L ∈ D_ét(U, Λ)` locally constant with perfect values. -/
def IsGradedPiecePc {Y : S.V} (G : DV S Λ Y) : Prop :=
  ∃ (W : S.EtVOver Y) (Z : Set (S.pts.obj (etvSrc S W))) (L : DetCat S Λ (etvSrc S W)),
    (S.lsDia ⋙ S.diaV).essImage (etvSrc S W) ∧ IsQuasicompactMap S (etvMap S W) ∧
    IsSeparatedMap S (etvMap S W) ∧ IsClosed Z ∧ Topology.IsConstructible Z ∧
    IsPerfectLocalSystem S Λ _ L.obj ∧
    Nonempty (G ≅ ((etaleShriek S Λ W).obj ((supportRestrictDerived S Λ _ Z).obj L)).obj)

/-- DiamondEtaleCohomology:C7/perfect-constructible-filtration (ECD Proposition 20.16), for a
spatial diamond `Y`: (i) ⇔ (ii) ⇔ (iii). -/
theorem perfectConstructibleFiltration (Y : S.LS)
    [CompactSpace (S.pts.obj (S.ofLS Y))] [QuasiSeparatedSpace (S.pts.obj (S.ofLS Y))]
    (A : DV S Λ (S.ofLS Y)) :
    (IsPerfectConstructible S Λ _ A ↔ Det S Λ _ A ∧
      ∃ (n : ℕ) (Z : Fin n → Set (S.pts.obj (S.ofLS Y))),
        (∀ i, Topology.IsConstructible (Z i) ∧ IsLocallyClosed (Z i)) ∧
        Pairwise (fun i j => Disjoint (Z i) (Z j)) ∧ (⋃ i, Z i) = Set.univ ∧
        ∀ (X : S.Std) (f : S.ofLS (S.ofStd X) ⟶ S.ofLS Y), ∃ B : DEt S Λ (S.ofStd X),
          Nonempty ((vPull S Λ f).obj A ≅ (stdEmb S Λ X).obj B) ∧
          ∀ i, ∃ P, IsPerfectComplex Λ P ∧
            Nonempty ((restrictDerivedTop Λ ((S.pts.map f) ⁻¹' Z i)).obj ((stdDerivedEquiv S Λ X).obj B) ≅
              (constDerivedTop Λ (TopCat.of ((S.pts.map f) ⁻¹' Z i))).obj P)) ∧
    (IsPerfectConstructible S Λ _ A ↔ Det S Λ _ A ∧
      HasTriangFiltrationBy S Λ (IsGradedPiecePc S Λ) A) := by
  sorry

/-- The 2-colimit `2-colim_i D_ét,pc(Y_i, Λ)` along pullback, for a cofiltered system of spatial
diamonds (a construction of C7/perfect-constructible-limit-*). -/
def dpcColim (Λ : Type u) [CommRing Λ] {I : Type u} [SmallCategory I] (D : I ⥤ S.LS) :
    Type (u + 1) := sorry

instance dpcColimCategory (Λ : Type u) [CommRing Λ] {I : Type u} [SmallCategory I]
    (D : I ⥤ S.LS) : Category.{u + 1} (dpcColim S Λ D) := sorry

/-- The natural functor `2-colim_i D_ét,pc(Y_i, Λ) → D_ét,pc(Y, Λ)` to the limit `Y`. -/
def dpcColimComparison {I : Type u} [SmallCategory I] (D : I ⥤ S.LS)
    (c : Cone (D ⋙ S.lsDia ⋙ S.diaV)) : dpcColim S Λ D ⥤ Dpc S Λ c.pt := sorry

/-- The 2-colimit `2-colim_i D_ét,pc(Y, Λ_i)` along extension of scalars, for a filtered system of
rings (a construction of C7/perfect-constructible-limit-fully-faithful and -ring-colimit). -/
def dpcRingColim (Y : S.V) {I : Type u} [SmallCategory I] (R : I ⥤ CommRingCat.{u}) :
    Type (u + 1) := sorry

instance dpcRingColimCategory (Y : S.V) {I : Type u} [SmallCategory I] (R : I ⥤ CommRingCat.{u}) :
    Category.{u + 1} (dpcRingColim S Y R) := sorry

/-- The natural functor `2-colim_i D_ét,pc(Y, Λ_i) → D_ét,pc(Y, Λ)` for `Λ = colim_i Λ_i`. -/
def dpcRingColimComparison (Y : S.V) {I : Type u} [SmallCategory I] (R : I ⥤ CommRingCat.{u})
    (c : Cocone R) : dpcRingColim S Y R ⥤ Dpc S c.pt Y := sorry

/-- DiamondEtaleCohomology:C7/perfect-constructible-limit-fully-faithful (ECD Proposition 20.15,
fully faithfulness): for a cofiltered system of spatial diamonds with spatial limit, and for a
filtered colimit of rings over a spatial diamond, the comparison functors are fully faithful. -/
theorem perfectConstructibleLimitFullyFaithful :
    (∀ {I : Type u} [SmallCategory I] [IsCofiltered I] (D : I ⥤ S.LS),
      (∀ i, CompactSpace (S.pts.obj (S.ofLS (D.obj i))) ∧
        QuasiSeparatedSpace (S.pts.obj (S.ofLS (D.obj i)))) →
      ∀ (c : Cone (D ⋙ S.lsDia ⋙ S.diaV)), IsLimit c → ∀ (Y : S.LS) (e : S.ofLS Y ≅ c.pt),
        CompactSpace (S.pts.obj (S.ofLS Y)) → QuasiSeparatedSpace (S.pts.obj (S.ofLS Y)) →
        (dpcColimComparison S Λ D c).Full ∧ (dpcColimComparison S Λ D c).Faithful) ∧
    (∀ (Y : S.LS), CompactSpace (S.pts.obj (S.ofLS Y)) → QuasiSeparatedSpace (S.pts.obj (S.ofLS Y)) →
      ∀ {I : Type u} [SmallCategory I] [IsFiltered I] (R : I ⥤ CommRingCat.{u}) (c : Cocone R),
        IsColimit c → (dpcRingColimComparison S (S.ofLS Y) R c).Full ∧
          (dpcRingColimComparison S (S.ofLS Y) R c).Faithful) := by
  sorry

/-- DiamondEtaleCohomology:C7/perfect-constructible-limit-equivalence (ECD Proposition 20.15, with
essential surjectivity from Proposition 20.16) -/
theorem perfectConstructibleLimitEquivalence {I : Type u} [SmallCategory I] [IsCofiltered I]
    (D : I ⥤ S.LS)
    (hD : ∀ i, CompactSpace (S.pts.obj (S.ofLS (D.obj i))) ∧
      QuasiSeparatedSpace (S.pts.obj (S.ofLS (D.obj i))))
    (c : Cone (D ⋙ S.lsDia ⋙ S.diaV)) (hc : IsLimit c) (Y : S.LS) (e : S.ofLS Y ≅ c.pt)
    (hY : CompactSpace (S.pts.obj (S.ofLS Y)) ∧ QuasiSeparatedSpace (S.pts.obj (S.ofLS Y))) :
    (dpcColimComparison S Λ D c).IsEquivalence := by
  sorry

/-- DiamondEtaleCohomology:C7/perfect-constructible-ring-colimit (ECD Proposition 20.15, second
part) -/
theorem perfectConstructibleRingColimit (Y : S.LS) [CompactSpace (S.pts.obj (S.ofLS Y))]
    [QuasiSeparatedSpace (S.pts.obj (S.ofLS Y))] {I : Type u} [SmallCategory I] [IsFiltered I]
    (R : I ⥤ CommRingCat.{u}) (c : Cocone R) (hc : IsColimit c) :
    (dpcRingColimComparison S (S.ofLS Y) R c).IsEquivalence := by
  sorry

end TauCeti.DiamondEtale
