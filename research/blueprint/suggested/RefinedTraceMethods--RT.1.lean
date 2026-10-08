/-
Suggested Lean declarations for RefinedTraceMethods, part RT.1
(layers RT.1, RT.2, RT.3, RT.3b, RT.4 with RT.4:topological, RT.4:q-Hodge and
RT.4:Habiro-comparison).

This file is not the roadmap and it is not exhaustive. The roadmap document
`research/blueprint/readmes/RefinedTraceMethods--RT.1.md` and the blueprint packet
`research/blueprint/packets/RefinedTraceMethods--RT.1.json` are definitive. The statements
below suggest Lean forms for the definitions, their API and their unit tests, so that
contributors and reviewers converge on names and signatures. Every proof is `sorry`; nothing
here is an implementation.

Independent review REV-RefinedTraceMethods--RT.1~2 corrects the signatures below.
The packet remains needs_changes because the RT.5 foundation ordering is unresolved. Coherent interfaces use quasicategories and mapping-space paths; ordinary
models are shadows. Exact supplier requests remain for the coherent categorical,
spectral and condensed infrastructure, and source proof gaps remain in the packet.
Successful elaboration checks signatures; every mathematical proof remains a placeholder.

Objects that other roadmaps supply (the ∞-category of spectra and its ring and module
objects from StableHomotopyKTheory H.5 and EnhancedDerivedSheaves E5, algebraic K-theory from
GeneralAlgebraicKTheory, small stable ∞-categories) appear in the section `Imported` as
sorry-bodied carriers standing for the suppliers' declarations. Where the libraries already
have a notion (Kähler differentials, exterior and tensor powers, simplicial objects, Witt
vectors, Tate cohomology, vector bundles, Grothendieck groups, Morita equivalence), it is used
directly.
-/
import Mathlib.CategoryTheory.Iso
import Mathlib.Condensed.Light.Module
import Mathlib.Data.ZMod.Basic
import Mathlib.CategoryTheory.Limits.Preserves.Filtered
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.AlgebraicTopology.SimplicialObject.Basic
import Mathlib.AlgebraicTopology.AlternatingFaceMapComplex
import Mathlib.AlgebraicTopology.MooreComplex
import Mathlib.LinearAlgebra.TensorPower.Basic
import Mathlib.Algebra.DirectSum.Module
import Mathlib.AlgebraicTopology.Quasicategory.Basic
import Mathlib.RingTheory.Kaehler.Basic
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.RingTheory.Smooth.Basic
import Mathlib.RingTheory.Etale.Basic
import Mathlib.RingTheory.Morita.Basic
import Mathlib.RingTheory.DividedPowerAlgebra.Init
import Mathlib.RingTheory.WittVector.Frobenius
import Mathlib.RingTheory.WittVector.Verschiebung
import Mathlib.RepresentationTheory.Homological.TateCohomology.Basic
import Mathlib.Topology.VectorBundle.Basic
import Mathlib.GroupTheory.MonoidLocalization.GrothendieckGroup
import Mathlib.Analysis.Complex.Circle
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.LaurentSeries
import Mathlib.Algebra.Polynomial.Basic
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.Algebra.Homology.TotalComplex
import Mathlib.RingTheory.Polynomial.Cyclotomic.Basic
import Mathlib.NumberTheory.Cyclotomic.Basic

set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

noncomputable section

open CategoryTheory

namespace RefinedTraceMethods

/-! ## Coherent supplier interfaces (R4–R6)

These carriers belong to EDS E0/E3/E5 and H.5. SSet.Quasicategory is the pinned
horn-filling predicate, rather than an ordinary Category instance. Mapping spaces,
coherent natural transformations and Ind completions are requested supplier data.
The strict models elsewhere in this file are shadows and are not these interfaces.
-/
namespace Coherent
open scoped Simplicial

structure InftyCategory where
  shape : SSet.{0}
  innerHorns : SSet.Quasicategory shape
attribute [instance] InftyCategory.innerHorns

abbrev Obj (C : InftyCategory) : Type := C.shape _⦋0⦌
abbrev Functor (C D : InftyCategory) := C.shape ⟶ D.shape

def Functor.obj {C D : InftyCategory} (F : Functor C D) (x : Obj C) : Obj D := F.app _ x

/-- Coherent mapping Kan complex, supplied by E0. -/
def Map (C : InftyCategory) (x y : Obj C) : SSet.{0} := sorry
instance (C : InftyCategory) (x y : Obj C) : SSet.KanComplex (Map C x y) := sorry
abbrev Hom {C : InftyCategory} (x y : Obj C) : Type := (Map C x y) _⦋0⦌

/-- A path retains an edge and both endpoint equations. -/
structure Path (K : SSet.{0}) (x y : K _⦋0⦌) where
  edge : K _⦋1⦌
  source : K.δ 1 edge = x
  target : K.δ 0 edge = y

def comp {C : InftyCategory} {x y z : Obj C} : Hom x y → Hom y z → Hom x z := sorry
def identity {C : InftyCategory} (x : Obj C) : Hom x x := sorry
def Functor.map {C D : InftyCategory} (F : Functor C D) {x y : Obj C} :
    Hom x y → Hom (F.obj x) (F.obj y) := sorry

/-- Coherent inverse data, including the two inverse paths in the mapping spaces. -/
structure InverseData {C : InftyCategory} {x y : Obj C} (f : Hom x y) where
  inverse : Hom y x
  left : Path (Map C x x) (comp f inverse) (identity x)
  right : Path (Map C y y) (comp inverse f) (identity y)
def IsEquiv {C : InftyCategory} {x y : Obj C} (f : Hom x y) : Prop := Nonempty (InverseData f)

/-- Coherent natural equivalence data, supplied by E0, includes all simplicial coherences. -/
def NaturalEquivalence {C D : InftyCategory} (F G : Functor C D) : Type := sorry
structure Equivalence (C D : InftyCategory) where
  forward : Functor C D
  inverse : Functor D C
  unit : NaturalEquivalence (𝟙 C.shape) (forward ≫ inverse)
  counit : NaturalEquivalence (inverse ≫ forward) (𝟙 D.shape)

/-- A regular cardinal and its regularity witness; supplier E0 chooses universe bounds. -/
def RegularCardinal : Type := sorry
/-- Coherent Ind_κ completion, rather than a filtered sequence. -/
def IndCompletion (κ : RegularCardinal) (A : InftyCategory) : InftyCategory := sorry
structure PresentabilityWitness (C : InftyCategory) where
  cardinal : RegularCardinal
  compactGenerators : InftyCategory
  indEquivalence : Equivalence (IndCompletion cardinal compactGenerators) C

def IsPresentable (C : InftyCategory) : Prop := Nonempty (PresentabilityWitness C)
/-- A coherent colimit cocone and its mapping-space universal property (EDS E0). -/
def ColimitCocone {J C : InftyCategory} (D : Functor J C) : Type := sorry
/-- Exactness witness contains coherent finite limit and colimit comparisons (EDS E5). -/
def ExactnessWitness {C D : InftyCategory} (F : Functor C D) : Type := sorry
/-- Accessibility includes a regular cardinal and preservation of κ-filtered diagrams. -/
def AccessibilityWitness {C D : InftyCategory} (F : Functor C D) : Type := sorry
/-- All-small-colimit preservation data, coherent on cocones. -/
def ColimitPreservation {C D : InftyCategory} (F : Functor C D) : Type := sorry
/-- Coherent stable structure, zero object and pullback/pushout equivalences (EDS E5). -/
def StableStructure (C : InftyCategory) : Type := sorry
/-- Coherent adjunction with unit/counit natural transformations and triangle homotopies. -/
def Adjunction {C D : InftyCategory} (F : Functor C D) (G : Functor D C) : Type := sorry

/-- Arrow category, homotopy pullback, and mapping-space homotopy equalizer suppliers. -/
def Arrow (C : InftyCategory) : InftyCategory := sorry
def HomotopyEqualizer (K L : SSet.{0}) (f g : K ⟶ L) : SSet.{0} := sorry
/-- Homotopy equalizer vertices contain a point and a path, rather than equal values. -/
theorem HomotopyEqualizer.vertices (K L : SSet.{0}) (f g : K ⟶ L) :
    Nonempty ((HomotopyEqualizer K L f g) _⦋0⦌ ≃
      (Σ x : K _⦋0⦌, Path L (f.app _ x) (g.app _ x))) := sorry

/-- The coherent lax equalizer D ×_{E×E} Fun(Δ¹,E). -/
def LaxEqualizer {D E : InftyCategory} (F G : Functor D E) : InftyCategory := sorry
structure LaxObject {D E : InftyCategory} (F G : Functor D E) where
  obj : Obj D
  arrow : Hom (F.obj obj) (G.obj obj)
def LaxEqualizer.object {D E : InftyCategory} {F G : Functor D E}
    (X : LaxObject F G) : Obj (LaxEqualizer F G) := sorry
def LaxEqualizer.proj {D E : InftyCategory} (F G : Functor D E) :
    Functor (LaxEqualizer F G) D := sorry

def LaxEqualizer.leftMap {D E : InftyCategory} {F G : Functor D E}
    (X Y : LaxObject F G) : Map D X.obj Y.obj ⟶ Map E (F.obj X.obj) (G.obj Y.obj) := sorry
def LaxEqualizer.rightMap {D E : InftyCategory} {F G : Functor D E}
    (X Y : LaxObject F G) : Map D X.obj Y.obj ⟶ Map E (F.obj X.obj) (G.obj Y.obj) := sorry

theorem LaxEqualizer.mapping {D E : InftyCategory} {F G : Functor D E}
    (X Y : LaxObject F G) :
    Nonempty (Map (LaxEqualizer F G) (LaxEqualizer.object X) (LaxEqualizer.object Y) ≅
      HomotopyEqualizer (Map D X.obj Y.obj) (Map E (F.obj X.obj) (G.obj Y.obj))
        (LaxEqualizer.leftMap X Y) (LaxEqualizer.rightMap X Y)) := sorry

theorem LaxEqualizer.instStable {D E : InftyCategory} (F G : Functor D E)
    (hD : StableStructure D) (hE : StableStructure E)
    (hF : ExactnessWitness F) (hG : ExactnessWitness G) :
    Nonempty (StableStructure (LaxEqualizer F G)) ∧
    Nonempty (ExactnessWitness (LaxEqualizer.proj F G)) := sorry

theorem LaxEqualizer.instPresentable {D E : InftyCategory} (F G : Functor D E)
    (hD : PresentabilityWitness D) (hE : PresentabilityWitness E)
    (hF : AccessibilityWitness F) (hG : AccessibilityWitness G)
    (hcolim : ColimitPreservation F) :
    Nonempty (PresentabilityWitness (LaxEqualizer F G)) ∧
    Nonempty (ColimitPreservation (LaxEqualizer.proj F G)) := sorry

theorem LaxEqualizer.conservative {D E : InftyCategory} (F G : Functor D E)
    {x y : Obj (LaxEqualizer F G)} (f : Hom x y) :
    IsEquiv ((LaxEqualizer.proj F G).map f) → IsEquiv f := sorry

/-- Full coherent inverse-tower shape N^op, with its transition maps (E0). -/
def InverseNaturals : InftyCategory := sorry
/-- Derived limit, together with its coherent cone (E0). -/
def limit {J C : InftyCategory} (D : Functor J C) : Obj C := sorry

namespace Endofunctor
abbrev CoAlg {C : InftyCategory} (F : Functor C C) := LaxEqualizer (𝟙 C.shape) F
def Fix {C : InftyCategory} (F : Functor C C) : InftyCategory := sorry
def inclusion {C : InftyCategory} (F : Functor C C) : Functor (Fix F) (CoAlg F) := sorry

theorem coreflection {C : InftyCategory} (F : Functor C C)
    (hC : PresentabilityWitness C) (hF : ColimitPreservation F) :
    ∃ R : Functor (CoAlg F) (Fix F), Nonempty (Adjunction (inclusion F) R) := sorry

/-- Coalgebra lift (X→FX)↦(FX→F²X), with its canonical natural map. -/
def bar {C : InftyCategory} (F : Functor C C) : Functor (CoAlg F) (CoAlg F) := sorry
/-- Right adjoint to the coalgebra lift, built coherently from F⊣R. -/
def barRight {C : InftyCategory} (F R : Functor C C)
    (adj : Adjunction F R) : Functor (CoAlg F) (CoAlg F) := sorry
theorem barRight.adjunction {C : InftyCategory} (F R : Functor C C)
    (adj : Adjunction F R) : Nonempty (Adjunction (bar F) (barRight F R adj)) := sorry
/-- The full inverse tower ...→barRight²X→barRight X→X, with counit transitions. -/
def CoreflectionTower {C : InftyCategory} (F R : Functor C C)
    (adj : Adjunction F R) (X : Obj (CoAlg F)) : Functor InverseNaturals (CoAlg F) := sorry
/-- Pointwise coherent limit of the tower in the coalgebra category. -/
def coreflectionLimit {C : InftyCategory} (F R : Functor C C)
    (adj : Adjunction F R) : Functor (CoAlg F) (CoAlg F) := sorry
theorem coreflectionLimit.value {C : InftyCategory} (F R : Functor C C)
    (adj : Adjunction F R) (X : Obj (CoAlg F)) :
    ∃ e : Hom ((coreflectionLimit F R adj).obj X)
      (Coherent.limit (CoreflectionTower F R adj X)), IsEquiv e := sorry
/-- Fully faithful R and pullback-preserving F, used for the explicit pullback
X×_{RF X}RX. These are not needed merely to form the right-adjoint tower. -/
def RightAdjointComparison {C : InftyCategory} (F R : Functor C C)
    (adj : Adjunction F R) : Type := sorry
/-- Pullback of η_X:X→RF X and Rα:RX→RF X, supplied by E0. -/
def barRightPullback {C : InftyCategory} (F R : Functor C C)
    (adj : Adjunction F R) (X : LaxObject (𝟙 C.shape) F) : Obj C := sorry
theorem barRight.pullback {C : InftyCategory} (F R : Functor C C)
    (adj : Adjunction F R) (hR : RightAdjointComparison F R adj)
    (X : LaxObject (𝟙 C.shape) F) :
    ∃ e : Hom ((LaxEqualizer.proj (𝟙 C.shape) F).obj
      ((barRight F R adj).obj (LaxEqualizer.object X)))
      (barRightPullback F R adj X), IsEquiv e := sorry

/-- Nikolaus–Scholze Proposition II.5.3: the inclusion of the coreflection is the
actual limit functor, in the coherent functor category of coalgebras. -/
theorem coreflection_formula {C : InftyCategory} (F R : Functor C C)
    (hC : PresentabilityWitness C) (hF : ColimitPreservation F)
    (adj : Adjunction F R) :
    ∃ Ri : Functor (CoAlg F) (Fix F), Nonempty (Adjunction (inclusion F) Ri) ∧
      Nonempty (NaturalEquivalence (Ri ≫ inclusion F) (coreflectionLimit F R adj)) := sorry
end Endofunctor

/-- Sp and coherent classifying anima are supplied by H.5 and EDS E0. -/
def Sp : InftyCategory := sorry
structure GroupAnima where
  classifying : InftyCategory
  kan : SSet.KanComplex classifying.shape
  basepoint : Obj classifying

def FunctorCategory (C D : InftyCategory) : InftyCategory := sorry
abbrev SpectraWithAction (G : GroupAnima) := FunctorCategory G.classifying Sp

def SpectraWithAction.res {H G : GroupAnima} (f : Functor H.classifying G.classifying) :
    Functor (SpectraWithAction G) (SpectraWithAction H) := sorry
def SpectraWithAction.trivial (G : GroupAnima) : Functor Sp (SpectraWithAction G) := sorry
def homotopyOrbits (G : GroupAnima) : Functor (SpectraWithAction G) Sp := sorry
def homotopyFixedPoints (G : GroupAnima) : Functor (SpectraWithAction G) Sp := sorry

theorem homotopyOrbits.adj (G : GroupAnima) :
    Nonempty (Adjunction (homotopyOrbits G) (SpectraWithAction.trivial G)) ∧
    Nonempty (Adjunction (SpectraWithAction.trivial G) (homotopyFixedPoints G)) := sorry

theorem SpectraWithAction.instStable (G : GroupAnima) :
    Nonempty (PresentabilityWitness (SpectraWithAction G)) ∧
    Nonempty (StableStructure (SpectraWithAction G)) := sorry

def Circle : GroupAnima := sorry
def CircleQuotient (n : ℕ) (hn : 0 < n) : GroupAnima := sorry
def SpectraWithAction.circleQuotient (n : ℕ) (hn : 0 < n) :
    Equivalence (SpectraWithAction (CircleQuotient n hn)) (SpectraWithAction Circle) := sorry

/-- Requested coherent monoidal/transitivity/cohomology comparison data. -/
def FixedPointLaxMonoidal (G : GroupAnima) : Type := sorry
def NormalActionTransitivity (G : GroupAnima) : Type := sorry
def EMFixedPointComparison (G : GroupAnima) : Type := sorry
theorem homotopyFixedPoints.laxMonoidal (G : GroupAnima) : Nonempty (FixedPointLaxMonoidal G) := sorry
theorem homotopyFixedPoints.trans (G : GroupAnima) : Nonempty (NormalActionTransitivity G) := sorry
theorem homotopyFixedPoints.em (G : GroupAnima) : Nonempty (EMFixedPointComparison G) := sorry

/-- Identity to the prime-Tate product; both are coherent functors with residual action. -/
def PrimeTateTarget : InftyCategory := sorry
def actionDiagonal : Functor (SpectraWithAction Circle) PrimeTateTarget := sorry
def primeTateProduct : Functor (SpectraWithAction Circle) PrimeTateTarget := sorry
abbrev CyclotomicSpectrum := LaxEqualizer actionDiagonal primeTateProduct

def CyclotomicSpectrum.pTypical (p : ℕ) (hp : p.Prime) : InftyCategory := sorry
def CyclotomicSpectrum.forget : Functor CyclotomicSpectrum Sp := sorry
def CyclotomicSpectrum.unit : Obj CyclotomicSpectrum := sorry
theorem CyclotomicSpectrum.instStable : Nonempty (PresentabilityWitness CyclotomicSpectrum) ∧
    Nonempty (StableStructure CyclotomicSpectrum) := sorry
def CyclotomicSpectrum.toPTypical (p : ℕ) (hp : p.Prime) :
    Functor CyclotomicSpectrum (CyclotomicSpectrum.pTypical p hp) := sorry

/-- Test Coherent.LaxEqualizer.constant_loop: homotopy equalizers retain loop paths. -/
example (K : SSet.{0}) (x : K _⦋0⦌) :
    Nonempty ((HomotopyEqualizer K K (𝟙 K) (𝟙 K)) _⦋0⦌ ≃
      (Σ y : K _⦋0⦌, Path K y y)) := sorry
/-- Test Coherent.LaxEqualizer.stability: exact stable inputs yield stable output. -/
example {D E : InftyCategory} (F G : Functor D E) (hD : StableStructure D)
    (hE : StableStructure E) (hF : ExactnessWitness F) (hG : ExactnessWitness G) :
    Nonempty (StableStructure (LaxEqualizer F G)) := sorry
/-- Test Coherent.LaxEqualizer.presentability: κ/Ind accessibility data is required. -/
example {D E : InftyCategory} (F G : Functor D E) (hD : PresentabilityWitness D)
    (hE : PresentabilityWitness E) (hF : AccessibilityWitness F)
    (hG : AccessibilityWitness G) (hc : ColimitPreservation F) :
    Nonempty (PresentabilityWitness (LaxEqualizer F G)) := sorry
end Coherent

/-! ## Coherent coefficient THH, square-zero extensions and convergence (R7–R8)

The connective algebra and module categories, derived fibers, derivations and
colimits in this section are H.5/EDS supplier interfaces. The predicates owned
here are defined using their canonical comparison maps. -/
namespace Coherent
def colimit {J C : InftyCategory} (D : Functor J C) : Obj C := sorry
/-- Siftedness witness: nonempty and homotopy-cofinal diagonal (E0). -/
def SiftedWitness (J : InftyCategory) : Type := sorry
/-- Canonical map colim(FD) → F(colim D), including the coherent cocone. -/
def colimitComparison {J C D : InftyCategory} (F : Functor C D) (X : Functor J C) :
    Hom (colimit (X ≫ F)) (F.obj (colimit X)) := sorry

def IsSiftedColimitPreserving {C D : InftyCategory} (F : Functor C D) : Prop :=
  ∀ (J : InftyCategory) (_ : SiftedWitness J) (X : Functor J C),
    IsEquiv (colimitComparison F X)

def zero (C : InftyCategory) (hC : StableStructure C) : Obj C := sorry
def cofiber {C : InftyCategory} (hC : StableStructure C) {x y : Obj C}
    (f : Hom x y) : Obj C := sorry
def fiber {C : InftyCategory} (hC : StableStructure C) {x y : Obj C}
    (f : Hom x y) : Obj C := sorry
def shift (C : InftyCategory) (hC : StableStructure C) (n : ℤ) : Functor C C := sorry
/-- Supplier E5: t-structure axioms for these predicates: shift closure,
orthogonality of their mapping spaces, and coherent truncation fiber sequences. -/
def TStructureAxioms (C : InftyCategory) (connective coconnective : Obj C → Prop) : Type := sorry
structure TStructure (C : InftyCategory) where
  connective : Obj C → Prop
  coconnective : Obj C → Prop
  axioms : TStructureAxioms C connective coconnective
/-- Compatibility of the t-structure with filtered colimits (E5). -/
def FilteredTCompatibility {C : InftyCategory} (t : TStructure C) : Type := sorry
def ConnectivePart {C : InftyCategory} (t : TStructure C) : InftyCategory := sorry
def ConnectivePart.inclusion {C : InftyCategory} (t : TStructure C) :
    Functor (ConnectivePart t) C := sorry
end Coherent

namespace RT3
open Coherent

def ConnAlg : InftyCategory := sorry
def Bimod (A : Obj ConnAlg) : InftyCategory := sorry
def ConnBimod (A : Obj ConnAlg) : InftyCategory := sorry
def ConnBimod.inclusion (A : Obj ConnAlg) : Functor (ConnBimod A) (Bimod A) := sorry
def algebraForget : Functor ConnAlg Sp := sorry
def bimoduleForget (A : Obj ConnAlg) : Functor (Bimod A) Sp := sorry
def spStable : StableStructure Sp := sorry

def ConnBimod.zero (A : Obj ConnAlg) : Obj (ConnBimod A) := sorry
def regularBimodule (A : Obj ConnAlg) : Obj (Bimod A) := sorry
def sphereAlgebra : Obj ConnAlg := sorry
/-- The coherent split E₁ algebra A⊕M, including both bimodule actions. -/
def sqZero (A : Obj ConnAlg) : Functor (ConnBimod A) ConnAlg := sorry
def sqZero.projection (A : Obj ConnAlg) (M : Obj (ConnBimod A)) :
    Hom ((sqZero A).obj M) A := sorry
/-- Derived derivations fiber(A⊗A→A) → ΣI (H.5). -/
def Derivation (A : Obj ConnAlg) (I : Obj (ConnBimod A)) : Type := sorry
structure ExtensionDatum where
  algebra : Obj ConnAlg
  ideal : Obj (ConnBimod algebra)
  derivation : Derivation algebra ideal
/-- Coherent category of extension data, including changing the base algebra. -/
def AlgSqZero : InftyCategory := sorry
def AlgSqZero.ofDatum (X : ExtensionDatum) : Obj AlgSqZero := sorry
def AlgSqZero.base : Functor AlgSqZero ConnAlg := sorry
def AlgSqZero.extension : Functor AlgSqZero ConnAlg := sorry
/-- Projection from the homotopy pullback A×_{A⊕ΣI}A to A. -/
def AlgSqZero.projection (X : Obj AlgSqZero) :
    Hom (AlgSqZero.extension.obj X) (AlgSqZero.base.obj X) := sorry

def zeroDerivation (A : Obj ConnAlg) (I : Obj (ConnBimod A)) : Derivation A I := sorry
/-- Coherent bar realization with simplices M⊗A^⊗n. -/
def THHcoeff (A : Obj ConnAlg) : Functor (Bimod A) Sp := sorry
/-- Derived extension of scalars in both bimodule actions (H.5). -/
def bimoduleBaseChange {A B : Obj ConnAlg} (f : Hom A B) : Functor (Bimod A) (Bimod B) := sorry
def THHcoeff.map {A B : Obj ConnAlg} (f : Hom A B) (M : Obj (Bimod A)) :
    Hom ((THHcoeff A).obj M) ((THHcoeff B).obj ((bimoduleBaseChange f).obj M)) := sorry
/-- Compact-preservation data for −⊗_A M on Perf(A), supplied by K.4/RT.5. -/
def PerfPreservation (A : Obj ConnAlg) (M : Obj (Bimod A)) : Type := sorry
def categoricalBimoduleTrace (A : Obj ConnAlg) (M : Obj (Bimod A))
    (hM : PerfPreservation A M) : Obj Sp := sorry
theorem THHcoeff.categoricalTrace (A : Obj ConnAlg) (M : Obj (Bimod A))
    (hM : PerfPreservation A M) :
    Nonempty (InverseData (show Hom ((THHcoeff A).obj M)
      (categoricalBimoduleTrace A M hM) from sorry)) := sorry

/-- The full canonical Postnikov diagram, not an object sequence. -/
def postnikovTower (A : Obj ConnAlg) : Functor InverseNaturals ConnAlg := sorry
def postnikovComparison (Ψ : Functor ConnAlg Sp) (A : Obj ConnAlg) :
    Hom (Ψ.obj A) (Coherent.limit (postnikovTower A ≫ Ψ)) := sorry
def IsPostnikovConvergent (Ψ : Functor ConnAlg Sp) : Prop :=
  ∀ A, IsEquiv (postnikovComparison Ψ A)

theorem postnikovConvergent.map (Ψ Φ : Functor ConnAlg Sp)
    (e : NaturalEquivalence Ψ Φ) : IsPostnikovConvergent Ψ ↔ IsPostnikovConvergent Φ := sorry

/-- Relative extension functor on general derivation data. -/
def relativeExtension (Ψ : Functor ConnAlg Sp) : Functor AlgSqZero Sp := sorry
theorem relativeExtension.value (Ψ : Functor ConnAlg Sp) (X : Obj AlgSqZero) :
    Nonempty (InverseData (show Hom ((relativeExtension Ψ).obj X)
      (Coherent.fiber spStable (Ψ.map (AlgSqZero.projection X))) from sorry)) := sorry

def IsInfinitesimallySifted (Ψ : Functor ConnAlg Sp) : Prop :=
  IsSiftedColimitPreserving (relativeExtension Ψ)

theorem infinitesimallySifted.map (Ψ Φ : Functor ConnAlg Sp)
    (e : NaturalEquivalence Ψ Φ) : IsInfinitesimallySifted Ψ ↔ IsInfinitesimallySifted Φ := sorry

def splitComparison (Ψ : Functor ConnAlg Sp) (A : Obj ConnAlg)
    (M : Obj (ConnBimod A)) : Hom (Ψ.obj ((sqZero A).obj M)) (Ψ.obj A) :=
  Ψ.map (sqZero.projection A M)
def IsSplitConstant (Ψ : Functor ConnAlg Sp) : Prop :=
  ∀ (A : Obj ConnAlg) (M : Obj (ConnBimod A)), IsEquiv (splitComparison Ψ A M)
/-- Actual nilpotent π₀-surjection data from H.5, not a derivative hypothesis. -/
def NilSurjection {A B : Obj ConnAlg} (f : Hom A B) : Type := sorry

/-- Raskin Proposition 5.5.3: all independent convergence assumptions are retained. -/
theorem dgmConvergence (Ψ : Functor ConnAlg Sp)
    (hPost : IsPostnikovConvergent Ψ) (hSift : IsInfinitesimallySifted Ψ)
    (hSplit : IsSplitConstant Ψ) {A B : Obj ConnAlg} (f : Hom A B)
    (hf : NilSurjection f) : IsEquiv (Ψ.map f) := sorry

/-- General stable input for Raskin Definition 2.11.2; both t-structures have
filtered-colimit compatibility, in homological grading. -/
structure PseudoContext where
  source : InftyCategory
  target : InftyCategory
  sourceStable : StableStructure source
  targetStable : StableStructure target
  sourceT : TStructure source
  targetT : TStructure target
  sourceFiltered : FilteredTCompatibility sourceT
  targetFiltered : FilteredTCompatibility targetT

abbrev PseudoFunctor (P : PseudoContext) := Functor (ConnectivePart P.sourceT) P.target
/-- Cofiber of ψF⊕ψG → ψ(F⊕G), using the canonical two inclusions. -/
def crossEffect (P : PseudoContext) (ψ : PseudoFunctor P)
    (F G : Obj (ConnectivePart P.sourceT)) : Obj P.target := sorry
/-- The coherent functor G↦Ω B_ψ(F,G), with the actual desuspension. -/
def crossEffectLoop (P : PseudoContext) (ψ : PseudoFunctor P)
    (F : Obj (ConnectivePart P.sourceT)) : PseudoFunctor P := sorry

def pseudoIterate (P : PseudoContext) (ψ : PseudoFunctor P) :
    List (Obj (ConnectivePart P.sourceT)) → PseudoFunctor P
  | [] => ψ
  | F :: rest => crossEffectLoop P (pseudoIterate P ψ rest) F

def reducedComparison (P : PseudoContext) (ψ : PseudoFunctor P) :
    Hom (ψ.obj (show Obj (ConnectivePart P.sourceT) from sorry))
      (Coherent.zero P.target P.targetStable) := sorry

def IsPseudoExtensible (P : PseudoContext) (ψ : PseudoFunctor P) : Prop :=
  IsEquiv (reducedComparison P ψ) ∧ IsSiftedColimitPreserving ψ ∧
  ∀ (inputs : List (Obj (ConnectivePart P.sourceT))) (X : Obj (ConnectivePart P.sourceT)),
    P.targetT.connective ((pseudoIterate P ψ inputs).obj X)

/-- The zero functor and connective-valued linear functors test the entire closure. -/
def zeroPseudo (P : PseudoContext) : PseudoFunctor P := sorry
def LinearityWitness (P : PseudoContext) (ψ : PseudoFunctor P) : Type := sorry
theorem pseudoExtensible.zero (P : PseudoContext) : IsPseudoExtensible P (zeroPseudo P) := sorry
theorem pseudoExtensible.linear (P : PseudoContext) (ψ : PseudoFunctor P)
    (hlin : LinearityWitness P ψ) (hcolim : ColimitPreservation ψ)
    (hconn : ∀ X, P.targetT.connective (ψ.obj X)) : IsPseudoExtensible P ψ := sorry

def integerModuleContext : PseudoContext := sorry
def tensorSquare : PseudoFunctor integerModuleContext := sorry
/-- Test RT3.pseudoExtensible.quadratic: Ω(HZ⊕HZ) is not connective. -/
example : ¬ IsPseudoExtensible integerModuleContext tensorSquare := sorry

def zeroAlgebraFunctor : Functor ConnAlg Sp := sorry
def constantHZ : Functor ConnAlg Sp := sorry
/-- Test RT3.postnikovConvergent.zero. -/
example : IsPostnikovConvergent zeroAlgebraFunctor := sorry
/-- Test RT3.postnikovConvergent.forget: the coherent Postnikov limit comparison. -/
example : IsPostnikovConvergent algebraForget := sorry
/-- Test RT3.postnikovConvergent.not_product: the constant tower limit is HZ;
the product of its values has π₀=∏_N Z. -/
def spHZ : Obj Sp := sorry
def constantHZTowerProduct : Obj Sp := sorry
example (A : Obj ConnAlg) :
    IsEquiv (postnikovComparison constantHZ A) ∧
    ¬ (∃ e : Hom spHZ constantHZTowerProduct, IsEquiv e) := sorry
/-- Test RT3.infinitesimallySifted.constant. -/
example : IsInfinitesimallySifted constantHZ := sorry
/-- Test RT3.infinitesimallySifted.forget: the fiber is the ideal, also as A varies. -/
example : IsInfinitesimallySifted algebraForget := sorry
/-- Test RT3.infinitesimallySifted.fixed_base_insufficient: the condition quantifies
over arbitrary sifted diagrams in AlgSqZero, not only one fiber over A. -/
example (Ψ : Functor ConnAlg Sp) (h : IsInfinitesimallySifted Ψ)
    (J : InftyCategory) (hJ : SiftedWitness J) (X : Functor J AlgSqZero) :
    IsEquiv (colimitComparison (relativeExtension Ψ) X) := h J hJ X

/-- Test RT3.sqZero.zero. -/
example (A : Obj ConnAlg) : IsEquiv (sqZero.projection A (ConnBimod.zero A)) := sorry
/-- Test RT3.AlgSqZero.zero_derivation. -/
example (A : Obj ConnAlg) (I : Obj (ConnBimod A)) :
    ∃ e : Hom (AlgSqZero.extension.obj (AlgSqZero.ofDatum ⟨A,I,zeroDerivation A I⟩))
      ((sqZero A).obj I), IsEquiv e := sorry
/-- Discrete test carrier k[ε]/ε², supplied by H.5 Eilenberg–Mac Lane comparison. -/
def dualNumberAlgebra (k : Type) [CommRing k] : Obj ConnAlg := sorry
/-- Test RT3.sqZero.dual_numbers and RT3.sqZero.not_tensor: the ideal squares to zero. -/
def dualNumberEpsilon (k : Type) [CommRing k] : k × k := (0,1)
def dualNumberMul (k : Type) [CommRing k] (x y : k × k) : k × k :=
  (x.1*y.1, x.1*y.2+x.2*y.1)
example (k : Type) [CommRing k] :
    dualNumberMul k (dualNumberEpsilon k) (dualNumberEpsilon k) = (0,0) := by
  simp [dualNumberMul,dualNumberEpsilon]

def bimoduleZero (A : Obj ConnAlg) : Obj (Bimod A) := sorry
/-- Test RT3.THHcoeff.zero. -/
example (A : Obj ConnAlg) : ∃ e : Hom ((THHcoeff A).obj (bimoduleZero A))
    (Coherent.zero Sp spStable), IsEquiv e := sorry
/-- Test RT3.THHcoeff.sphere. -/
example (M : Obj (Bimod sphereAlgebra)) : ∃ e : Hom ((THHcoeff sphereAlgebra).obj M)
    ((bimoduleForget sphereAlgebra).obj M), IsEquiv e := sorry
/-- The regular bimodule has the cyclic enhancement; general coefficients have
only the simplicial bar. This enhancement is extra data, not automatic. -/
def CyclicBarEnhancement (A : Obj ConnAlg) (M : Obj (Bimod A)) : Type := sorry
/-- Test RT3.THHcoeff.regular / RT3.THHcoeff.no_general_circle. -/
example (A : Obj ConnAlg) : Nonempty (CyclicBarEnhancement A (regularBimodule A)) := sorry
end RT3


/-! ## Imported carriers

Stand-ins for objects owned by other roadmaps. Each is a sorry-bodied declaration naming the
supplier; the roadmap document says which node supplies it. -/

/-- The stable ∞-category of spectra (StableHomotopyKTheory H.5:spectra, compared with
EnhancedDerivedSheaves E5 by E5:spectra-comparison), prototyped by a category. -/
def Spectrum : Type := sorry

instance : Category.{0} Spectrum := sorry

namespace Spectrum

/-- Stable homotopy groups `π_n X`, `n ∈ ℤ`. -/
def homotopyGroup (X : Spectrum) (n : ℤ) : Type := sorry

instance (X : Spectrum) (n : ℤ) : AddCommGroup (X.homotopyGroup n) := sorry

/-- The map on `π_n` induced by a map of spectra. -/
def homotopyGroupMap {X Y : Spectrum} (f : X ⟶ Y) (n : ℤ) :
    X.homotopyGroup n →+ Y.homotopyGroup n := sorry

/-- The sphere spectrum. -/
def sphere : Spectrum := sorry

/-- The zero spectrum. -/
def zero : Spectrum := sorry

/-- The Eilenberg–Mac Lane spectrum `HA` of an abelian group. -/
def em (A : Type) [AddCommGroup A] : Spectrum := sorry

/-- The `n`-fold suspension `Σⁿ X` (`n ∈ ℤ`). -/
def shift (X : Spectrum) (n : ℤ) : Spectrum := sorry

/-- The smash product of spectra. -/
def smash (X Y : Spectrum) : Spectrum := sorry

/-- The fibre of a map of spectra. -/
def fib {X Y : Spectrum} (f : X ⟶ Y) : Spectrum := sorry

/-- The cofibre of a map of spectra. -/
def cofib {X Y : Spectrum} (f : X ⟶ Y) : Spectrum := sorry

/-- The map induced on fibres by a commutative square. -/
def fibMap {A B C D : Spectrum} (f : A ⟶ B) (g : C ⟶ D) (u : A ⟶ C) (v : B ⟶ D)
    (w : f ≫ v = u ≫ g) : fib f ⟶ fib g := sorry

/-- The `p`-completion `X^∧_p` (StableHomotopyKTheory H.6/p-completion). -/
def pCompletion (p : ℕ) (X : Spectrum) : Spectrum := sorry

/-- The rationalisation `X ⊗ ℚ` (StableHomotopyKTheory H.6/rationalisation). -/
def rationalisation (X : Spectrum) : Spectrum := sorry

/-- The connective cover `τ_{≥0} X` (StableHomotopyKTheory H.5:spectra/postnikov-sections). -/
def connectiveCover (X : Spectrum) : Spectrum := sorry

/-- A spectrum is bounded below if its homotopy groups vanish in sufficiently negative degrees. -/
def IsBoundedBelow (X : Spectrum) : Prop :=
  ∃ n : ℤ, ∀ k : ℤ, k < n → Subsingleton (X.homotopyGroup k)

/-- A spectrum is connective if its negative homotopy groups vanish. -/
def IsConnective (X : Spectrum) : Prop :=
  ∀ k : ℤ, k < 0 → Subsingleton (X.homotopyGroup k)

end Spectrum

/-- A commutative square of spectra is cartesian if the induced map on horizontal fibres is an
equivalence. -/
def IsCartesianSquare {A B C D : Spectrum} (f : A ⟶ B) (g : C ⟶ D) (u : A ⟶ C) (v : B ⟶ D)
    (w : f ≫ v = u ≫ g) : Prop :=
  IsIso (Spectrum.fibMap f g u v w)

/-- E₁-algebras in spectra (EnhancedDerivedSheaves E5:abstract/algebra-objects applied to
spectra; StableHomotopyKTheory H.5:spectra/ring-spectrum). -/
def E1Ring : Type := sorry

instance : Category.{0} E1Ring := sorry

/-- E_∞-algebras in spectra (StableHomotopyKTheory H.5:spectra/operadic-algebras). -/
def EInftyRing : Type := sorry

instance : Category.{0} EInftyRing := sorry

namespace E1Ring

/-- The underlying spectrum. -/
def toSpectrum (A : E1Ring) : Spectrum := sorry

/-- The Eilenberg–Mac Lane ring spectrum `HR` of a ring. -/
def ofRing (R : Type) [Ring R] : E1Ring := sorry

/-- The sphere as an E₁-ring. -/
def sphere : E1Ring := sorry

/-- The smash product of E₁-rings. -/
def smash (A B : E1Ring) : E1Ring := sorry

/-- An E₁-ring is connective if its underlying spectrum is. -/
def IsConnective (A : E1Ring) : Prop := A.toSpectrum.IsConnective

/-- The map on underlying spectra. -/
def toSpectrumMap {A B : E1Ring} (f : A ⟶ B) : A.toSpectrum ⟶ B.toSpectrum := sorry

/-- `π_0` of an E₁-ring is a ring. -/
def pi0 (A : E1Ring) : Type := sorry

instance (A : E1Ring) : Ring A.pi0 := sorry

/-- The ring map on `π_0`. -/
def pi0Map {A B : E1Ring} (f : A ⟶ B) : A.pi0 →+* B.pi0 := sorry

end E1Ring

namespace EInftyRing

/-- The underlying E₁-ring. -/
def toE1 (A : EInftyRing) : E1Ring := sorry

/-- The Eilenberg–Mac Lane E_∞-ring of a commutative ring. -/
def ofCommRing (R : Type) [CommRing R] : EInftyRing := sorry

end EInftyRing

/-- Small idempotent-complete stable ∞-categories `Cat^perf_∞` (EnhancedDerivedSheaves E5). -/
def SmallStableCat : Type 1 := sorry

instance : Category.{0} SmallStableCat := sorry

/-- Perfect modules `Perf(A)` over an E₁-ring. -/
def Perf (A : E1Ring) : SmallStableCat := sorry

/-- Connective algebraic K-theory of a small stable ∞-category
(GeneralAlgebraicKTheory K.4, K.2:plus). -/
def connectiveK (C : SmallStableCat) : Spectrum := sorry

/-- Nonconnective algebraic K-theory (GeneralAlgebraicKTheory K.6). -/
def nonconnectiveK (C : SmallStableCat) : Spectrum := sorry

/-- The map on K-theory induced by an exact functor. -/
def connectiveKMap {C D : SmallStableCat} (F : C ⟶ D) : connectiveK C ⟶ connectiveK D := sorry

/-! ## Spectra with group actions, homotopy fixed points and Tate constructions
(core declarations of RT.2 used by the later layers) -/

/-- Spectra with an action of the group `G`: `Sp^{BG} = Fun(BG, Sp)` (RT.2/spectra-with-action). -/
def SpectraWithAction (G : Type) [Group G] : Type := sorry

instance (G : Type) [Group G] : Category.{0} (SpectraWithAction G) := sorry

namespace SpectraWithAction

variable {G : Type} [Group G]

/-- The underlying spectrum. -/
def underlying (X : SpectraWithAction G) : Spectrum := sorry

/-- A spectrum with the trivial `G`-action. -/
def trivial (G : Type) [Group G] (X : Spectrum) : SpectraWithAction G := sorry

end SpectraWithAction

/-- The circle group `T`. -/
abbrev T := Circle

/-- The cyclic group `C_n`, written multiplicatively. -/
abbrev C (n : ℕ) := Multiplicative (ZMod n)

/-- Homotopy orbits `X_{hG}` (RT.2/homotopy-orbits-fixed-points). -/
def homotopyOrbits {G : Type} [Group G] (X : SpectraWithAction G) : Spectrum := sorry

/-- Homotopy fixed points `X^{hG}` (RT.2/homotopy-orbits-fixed-points). -/
def homotopyFixedPoints {G : Type} [Group G] (X : SpectraWithAction G) : Spectrum := sorry

/-- The Tate construction `X^{tG}` of a finite group (RT.2/norm-map-tate). -/
def tateConstruction {G : Type} [Group G] [Fintype G] (X : SpectraWithAction G) : Spectrum :=
  sorry

/-- The `T`-Tate construction `X^{tT}` (RT.2/circle-tate). -/
def circleTate (X : SpectraWithAction T) : Spectrum := sorry

/-- Restriction of a `T`-spectrum to `C_n ⊂ T`. -/
def restrictToCyclic (n : ℕ) (X : SpectraWithAction T) : SpectraWithAction (C n) := sorry

/-- The residual Tate construction `X^{tC_p}` with its residual `T ≅ T/C_p`-action. -/
def residualTate (p : ℕ) (X : SpectraWithAction T) : SpectraWithAction T := sorry

/-! ## THH and cyclotomic spectra (core declarations of RT.2) -/

/-- Topological Hochschild homology of an E₁-ring, with its circle action (RT.2/thh-e1-ring). -/
def THH (A : E1Ring) : SpectraWithAction T := sorry

namespace THH

/-- `THH(R) := THH(HR)` for a discrete ring. -/
def ofRing (R : Type) [Ring R] : SpectraWithAction T := THH (E1Ring.ofRing R)

/-- THH relative to an E_∞-ring `k` (RT.2/relative-thh); `A` is an E₁-`k`-algebra, recorded by
its structure map. -/
def relative (k : EInftyRing) (A : E1Ring) (f : k.toE1 ⟶ A) : SpectraWithAction T := sorry

/-- THH of a small stable ∞-category (RT.2/thh-spectral-categories). -/
def ofCat (C : SmallStableCat) : SpectraWithAction T := sorry

end THH

/-- Cyclotomic spectra: a `T`-spectrum with `T ≅ T/C_p`-equivariant Frobenius maps
`φ_p : X → X^{tC_p}` for every prime `p` (RT.2/cyclotomic-spectrum). -/
structure CyclotomicSpectrum where
  /-- The underlying spectrum with `T`-action. -/
  underlying : SpectraWithAction T
  /-- The Frobenius maps. -/
  frobenius : ∀ p : ℕ, p.Prime → (underlying ⟶ residualTate p underlying)

instance : Category.{0} CyclotomicSpectrum := sorry

/-- Negative topological cyclic homology `TC⁻(X) = X^{hT}` (RT.2/tc-minus-and-tp). -/
def TCminus (X : SpectraWithAction T) : Spectrum := homotopyFixedPoints X

/-- Periodic topological cyclic homology `TP(X) = X^{tT}` (RT.2/tc-minus-and-tp). -/
def TP (X : SpectraWithAction T) : Spectrum := circleTate X

/-- Topological cyclic homology `TC(X) = map_{CycSp}(S, X)` (RT.2/topological-cyclic-homology). -/
def TC (X : CyclotomicSpectrum) : Spectrum := sorry

/-- The cyclotomic spectrum `THH(A)` with its Frobenius (RT.2/cyclotomic-frobenius-thh). -/
def THHcyc (A : E1Ring) : CyclotomicSpectrum := sorry

/-- The Eilenberg–Mac Lane spectrum of derived Hochschild homology `HH(R/ℤ)` with its circle
action (RT.1/hochschild-homology through RT.2/mixed-complexes-are-circle-modules). -/
def hhSpectrum (R : Type) [Ring R] : SpectraWithAction T := sorry

/-- `HC(R) = HH(R)_{hT}`, `HC⁻(R) = HH(R)^{hT}`, `HP(R) = HH(R)^{tT}` as spectra. -/
def hcSpectrum (R : Type) [Ring R] : Spectrum := homotopyOrbits (hhSpectrum R)
def hcMinusSpectrum (R : Type) [Ring R] : Spectrum := homotopyFixedPoints (hhSpectrum R)
def hpSpectrum (R : Type) [Ring R] : Spectrum := circleTate (hhSpectrum R)

/-! ## Complex K-theory spectra (core declarations of RT.4:topological used by RT.4:q-Hodge) -/

/-- Periodic complex K-theory `KU` as an E_∞-ring (RT.4:topological/ku-spectrum). -/
def KU : EInftyRing := sorry

/-- Connective complex K-theory `ku = τ_{≥0} KU` as an E_∞-ring (RT.4:topological/connective-ku). -/
def ku : EInftyRing := sorry


end RefinedTraceMethods

namespace RefinedTraceMethods

/-! ## RT.1 — Algebraic Hochschild and cyclic homology

Declarations for the nodes `RT.1/…`. Helper declarations that are not packet names carry the
prefix `RT1.`. The derived category `D(k)` is not available from the imported Mathlib modules,
so it appears as the sorry-bodied carrier `RT1.DMod k` (with homology, shifts, fibres, derived
tensor products and base change); E_∞-`k`-algebras in `D(k)` appear as `RT1.CAlgD k`. -/

open Opposite Simplicial
open scoped TensorProduct

universe u v u' v'

/-! ### RT.1/cyclic-category -/

/-- Connes' cyclic category `Λ` (RT.1/cyclic-category). Objects are the finite ordinals
`[n] = {0,…,n}`, recorded by `n ∈ ℕ`; a morphism `[m] → [n]` is a pair `(φ, g)` of a morphism
`φ : [m] → [n]` of the simplex category `Δ` and a cyclic automorphism `g` of `[m]`, composed by
the composition law of NS18 Appendix B (the category instance below). -/
def CyclicCategory : Type := ℕ

namespace CyclicCategory

/-- The object `[n]` of `Λ`. -/
def mk (n : ℕ) : CyclicCategory := n

/-- The length `n` of the object `[n]`. -/
def len (x : CyclicCategory) : ℕ := x

/-- The category structure of `Λ`: morphisms `[m] → [n]` are the pairs `(φ, g)` with `φ` a
`Δ`-morphism and `g` a cyclic automorphism of `[m]`, with the composition law of NS18
Appendix B. -/
instance : SmallCategory CyclicCategory := sorry

/-- The wide inclusion `Δ → Λ`, the identity on objects (`[n] ↦ [n]`). -/
def toSimplex : SimplexCategory ⥤ CyclicCategory where
  obj x := mk x.len
  map := sorry
  map_id := sorry
  map_comp := sorry

end CyclicCategory

/-- The inclusion `Δ → Λ` is faithful. -/
instance RT1.toSimplex_faithful : CyclicCategory.toSimplex.Faithful := sorry

/-- The cyclic automorphism `τ_n` of `[n]` in `Λ` (the generator of `Aut_Λ([n])`). -/
def RT1.tau (n : ℕ) : Aut (CyclicCategory.mk n) := sorry

/-- The defining relations of `Λ` between `τ` and the faces `δ_i` and degeneracies `σ_i` of `Δ`
(written as composites in `Λ`, first map on the left): `τ_n δ_i = δ_{i−1} τ_{n−1}` for
`1 ≤ i ≤ n`, `τ_n δ_0 = δ_n`, `τ_n σ_i = σ_{i−1} τ_{n+1}` for `1 ≤ i ≤ n`,
`τ_n σ_0 = σ_n τ_{n+1}²` and `τ_n^{n+1} = id`. -/
theorem RT1.tau_relations :
    (∀ (m : ℕ) (j : Fin (m + 1)),
      CyclicCategory.toSimplex.map (SimplexCategory.δ j.succ) ≫ (RT1.tau (m + 1)).hom =
        (RT1.tau m).hom ≫ CyclicCategory.toSimplex.map (SimplexCategory.δ j.castSucc)) ∧
    (∀ m : ℕ, CyclicCategory.toSimplex.map (SimplexCategory.δ (0 : Fin (m + 2))) ≫
        (RT1.tau (m + 1)).hom = CyclicCategory.toSimplex.map (SimplexCategory.δ (Fin.last (m + 1)))) ∧
    (∀ (m : ℕ) (j : Fin (m + 1)),
      CyclicCategory.toSimplex.map (SimplexCategory.σ j.succ) ≫ (RT1.tau (m + 1)).hom =
        (RT1.tau (m + 2)).hom ≫ CyclicCategory.toSimplex.map (SimplexCategory.σ j.castSucc)) ∧
    (∀ n : ℕ, CyclicCategory.toSimplex.map (SimplexCategory.σ (0 : Fin (n + 1))) ≫
        (RT1.tau n).hom = (RT1.tau (n + 1)).hom ≫ (RT1.tau (n + 1)).hom ≫
          CyclicCategory.toSimplex.map (SimplexCategory.σ (Fin.last n))) ∧
    (∀ n : ℕ, RT1.tau n ^ (n + 1) = 1) := sorry

/-- Every morphism `[m] → [n]` of `Λ` is uniquely a cyclic automorphism `τ_m^j`
(`0 ≤ j ≤ m`) followed by a morphism of `Δ`. -/
theorem CyclicCategory.factor {m n : ℕ} (f : CyclicCategory.mk m ⟶ CyclicCategory.mk n) :
    ∃! p : Fin (m + 1) × (SimplexCategory.mk m ⟶ SimplexCategory.mk n),
      f = (RT1.tau m ^ (p.1 : ℕ)).hom ≫ CyclicCategory.toSimplex.map p.2 := sorry

/-- Test `CyclicCategory.aut_card` (computation): `Aut_Λ([n])` is cyclic of order `n + 1`; for
`n = 0` it is trivial. -/
example (n : ℕ) : IsCyclic (Aut (CyclicCategory.mk n)) ∧
    Nat.card (Aut (CyclicCategory.mk n)) = n + 1 ∧ Subsingleton (Aut (CyclicCategory.mk 0)) :=
  sorry

/-- Cyclic objects of a category `C`: functors `Λᵒᵖ ⥤ C` (RT.1/cyclic-category). -/
abbrev CyclicObject (C : Type u) [Category.{v} C] := CyclicCategoryᵒᵖ ⥤ C

/-- The underlying simplicial object of a cyclic object: restriction along `Δ ⊂ Λ`. -/
def CyclicObject.toSimplicial {C : Type u} [Category.{v} C] :
    CyclicObject C ⥤ SimplicialObject C :=
  (Functor.whiskeringLeft _ _ C).obj CyclicCategory.toSimplex.op

/-- The cyclic operator `t_n = X(τ_n) : X_n → X_n` of a cyclic object. -/
def RT1.cyclicOperator {C : Type u} [Category.{v} C] (X : CyclicObject C) (n : ℕ) :
    X.obj (op (CyclicCategory.mk n)) ⟶ X.obj (op (CyclicCategory.mk n)) :=
  X.map (RT1.tau n).hom.op

/-- Iterated composite `f^i` of an endomorphism. -/
def RT1.homPow {C : Type u} [Category.{v} C] {Y : C} (f : Y ⟶ Y) : ℕ → (Y ⟶ Y)
  | 0 => 𝟙 Y
  | i + 1 => RT1.homPow f i ≫ f

/-- `t_n^{n+1} = id` on `X_n`. -/
theorem CyclicObject.t_pow {C : Type u} [Category.{v} C] (X : CyclicObject C) (n : ℕ) :
    RT1.homPow (RT1.cyclicOperator X n) (n + 1) = 𝟙 _ := sorry

/-- A simplicial object with operators `t_n : X_n → X_n` satisfying the relations of a cyclic
object: `d_i t_n = t_{n−1} d_{i−1}` (`1 ≤ i ≤ n`), `d_0 t_n = d_n`, `s_i t_n = t_{n+1} s_{i−1}`
(`1 ≤ i ≤ n`), `s_0 t_n = t_{n+1}² s_n`, `t_n^{n+1} = id` (composites written first map on the
left). -/
structure RT1.CyclicData (C : Type u) [Category.{v} C] where
  /-- The underlying simplicial object. -/
  X : SimplicialObject C
  /-- The cyclic operators. -/
  t : ∀ n : ℕ, X _⦋n⦌ ⟶ X _⦋n⦌
  d_t : ∀ (m : ℕ) (j : Fin (m + 1)), t (m + 1) ≫ X.δ j.succ = X.δ j.castSucc ≫ t m
  d0_t : ∀ m : ℕ, t (m + 1) ≫ X.δ 0 = X.δ (Fin.last (m + 1))
  s_t : ∀ (m : ℕ) (j : Fin (m + 1)), t (m + 1) ≫ X.σ j.succ = X.σ j.castSucc ≫ t (m + 2)
  s0_t : ∀ n : ℕ, t n ≫ X.σ 0 = X.σ (Fin.last n) ≫ t (n + 1) ≫ t (n + 1)
  t_pow : ∀ n : ℕ, RT1.homPow (t n) (n + 1) = 𝟙 _

/-- The cyclic object defined by a simplicial object with cyclic operators. -/
def CyclicObject.mk {C : Type u} [Category.{v} C] (D : RT1.CyclicData C) : CyclicObject C :=
  sorry

/-- The cyclic object `CyclicObject.mk D` has underlying simplicial object `D.X` and cyclic
operators `D.t`. -/
theorem RT1.CyclicObject.mk_spec {C : Type u} [Category.{v} C] (D : RT1.CyclicData C) :
    ∃ e : CyclicObject.toSimplicial.obj (CyclicObject.mk D) ≅ D.X, ∀ n : ℕ,
      RT1.cyclicOperator (CyclicObject.mk D) n ≫ e.hom.app (op (SimplexCategory.mk n)) =
        e.hom.app (op (SimplexCategory.mk n)) ≫ D.t n := sorry

/-- The simplicial object and cyclic operators of a cyclic object. -/
def RT1.CyclicData.ofCyclic {C : Type u} [Category.{v} C] (X : CyclicObject C) :
    RT1.CyclicData C where
  X := CyclicObject.toSimplicial.obj X
  t n := RT1.cyclicOperator X n
  d_t := sorry
  d0_t := sorry
  s_t := sorry
  s0_t := sorry
  t_pow n := CyclicObject.t_pow X n

/-- Every cyclic object arises from `CyclicObject.mk`. -/
theorem RT1.CyclicObject.mk_ofCyclic {C : Type u} [Category.{v} C] (X : CyclicObject C) :
    Nonempty (CyclicObject.mk (RT1.CyclicData.ofCyclic X) ≅ X) := sorry

/-- Postcomposition with a functor `C ⥤ D` maps cyclic objects to cyclic objects. -/
def CyclicObject.map {C : Type u} [Category.{v} C] {D : Type u'} [Category.{v'} D]
    (F : C ⥤ D) : CyclicObject C ⥤ CyclicObject D :=
  (Functor.whiskeringRight _ _ _).obj F

/-- `CyclicObject.map` is compatible with identities and composition, and with restriction to
simplicial objects. -/
theorem RT1.CyclicObject.map_id_comp {C : Type u} [Category.{v} C] {D : Type u'}
    [Category.{v'} D] {E : Type u'} [Category.{v'} E] (F : C ⥤ D) (G : D ⥤ E) :
    Nonempty (CyclicObject.map (𝟭 C) ≅ 𝟭 (CyclicObject C)) ∧
    Nonempty (CyclicObject.map (F ⋙ G) ≅ CyclicObject.map F ⋙ CyclicObject.map G) ∧
    Nonempty (CyclicObject.map F ⋙ CyclicObject.toSimplicial ≅
      CyclicObject.toSimplicial ⋙ (SimplicialObject.whiskering C D).obj F) := sorry

/-- Test `CyclicObject.constant` (degenerate): the constant simplicial object at `c`, with
`t_n = id`, is a cyclic object. -/
example {C : Type u} [Category.{v} C] (c : C) :
    ∃ D : RT1.CyclicData C, D.X = (Functor.const SimplexCategoryᵒᵖ).obj c ∧ ∀ n, D.t n = 𝟙 _ :=
  sorry

/-- The Hochschild boundary `b = Σ_{i=0}^{n+1} (−1)^i d_i : X_{n+1} → X_n` of a simplicial
object in a preadditive category. -/
def RT1.altFaceSum {C : Type u} [Category.{v} C] [Preadditive C] (X : SimplicialObject C)
    (n : ℕ) : X _⦋n + 1⦌ ⟶ X _⦋n⦌ :=
  ∑ i : Fin (n + 2), ((-1 : ℤ) ^ (i : ℕ)) • X.δ i

/-- Test `CyclicObject.toSimplicial_alternatingFaceMap` (compatibility): for `C` abelian, the
complex `(X_•, b)` of the underlying simplicial object of a cyclic object is Mathlib's
`alternatingFaceMapComplex`. -/
example {C : Type u} [Category.{v} C] [Abelian C] (X : CyclicObject C) (n : ℕ) :
    ((AlgebraicTopology.alternatingFaceMapComplex C).obj
      (CyclicObject.toSimplicial.obj X)).d (n + 1) n =
      RT1.altFaceSum (CyclicObject.toSimplicial.obj X) n := sorry

/-! ### RT.1/cyclic-bar-construction -/

/-- The cyclic bar construction `C_•(A/k)` (RT.1/cyclic-bar-construction): the cyclic `k`-module
with `C_n = A^{⊗_k(n+1)}`, faces `d_i(a_0⊗…⊗a_n) = a_0⊗…⊗a_i a_{i+1}⊗…⊗a_n` (`i < n`),
`d_n(a_0⊗…⊗a_n) = a_n a_0⊗a_1⊗…⊗a_{n−1}`, degeneracies inserting `1` after position `j`, and
cyclic operator the rotation `a_0⊗…⊗a_n ↦ a_n⊗a_0⊗…⊗a_{n−1}`. -/
def CyclicBar (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A] :
    CyclicObject (ModuleCat.{0} k) where
  obj x := ModuleCat.of k (⨂[k]^(CyclicCategory.len x.unop + 1) A)
  map := sorry
  map_id := sorry
  map_comp := sorry

/-- The tuple `(a_0, …, a_i a_{i+1}, …, a_{n+1})` obtained by multiplying the entries `i` and
`i + 1`. -/
def RT1.mergeAt {A : Type} [Mul A] {n : ℕ} (a : Fin (n + 2) → A) (i : Fin (n + 1)) :
    Fin (n + 1) → A :=
  fun j => if (j : ℕ) < i then a j.castSucc else if j = i then a j.castSucc * a j.succ
    else a j.succ

/-- The face maps of the cyclic bar construction on elementary tensors, including the
wrap-around face `d_{n+1}(a_0⊗…⊗a_{n+1}) = a_{n+1}a_0⊗a_1⊗…⊗a_n`. -/
theorem CyclicBar.face_apply (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A] (n : ℕ)
    (a : Fin (n + 2) → A) :
    (∀ i : Fin (n + 1), ((CyclicObject.toSimplicial.obj (CyclicBar k A)).δ i.castSucc).hom
        (PiTensorProduct.tprod k a) = PiTensorProduct.tprod k (RT1.mergeAt a i)) ∧
    ((CyclicObject.toSimplicial.obj (CyclicBar k A)).δ (Fin.last (n + 1))).hom
        (PiTensorProduct.tprod k a) =
      PiTensorProduct.tprod k
        (fun j : Fin (n + 1) => if j = 0 then a (Fin.last (n + 1)) * a 0 else a j.castSucc) :=
  sorry

/-- The signed cyclic operator `t'_n = (−1)^n t_n`, the operator entering Connes' operator `B`
and Connes' complex. -/
def RT1.signedCyclicOperator {C : Type u} [Category.{v} C] [Preadditive C] (X : CyclicObject C)
    (n : ℕ) : X.obj (op (CyclicCategory.mk n)) ⟶ X.obj (op (CyclicCategory.mk n)) :=
  ((-1 : ℤ) ^ n) • RT1.cyclicOperator X n

/-- The cyclic operator of `C_•(A/k)` on elementary tensors. The cyclic-object relations
(`d_0 t_n = d_n`, `d_i t_n = t_{n−1} d_{i−1}`) force the structure operator `t_n` to be the plain
rotation `a_0⊗…⊗a_n ↦ a_n⊗a_0⊗…⊗a_{n−1}`; the signed operator `(−1)^n t_n`, used in `B` and
in Connes' complex, is recorded as the second conjunct. -/
theorem CyclicBar.cyclic_apply (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A]
    (n : ℕ) (a : Fin (n + 1) → A) :
    (RT1.cyclicOperator (CyclicBar k A) n).hom (PiTensorProduct.tprod k a) =
      PiTensorProduct.tprod k (fun j => a ((finRotate (n + 1)).symm j)) ∧
    (RT1.signedCyclicOperator (CyclicBar k A) n).hom (PiTensorProduct.tprod k a) =
      ((-1 : ℤ) ^ n) • PiTensorProduct.tprod k (fun j => a ((finRotate (n + 1)).symm j)) :=
  sorry

/-- The map of cyclic modules induced by a `k`-algebra map, `a_0⊗…⊗a_n ↦ f a_0⊗…⊗f a_n`. -/
def CyclicBar.map {k : Type} [CommRing k] {A A' : Type} [Ring A] [Algebra k A] [Ring A']
    [Algebra k A'] (f : A →ₐ[k] A') : CyclicBar k A ⟶ CyclicBar k A' where
  app x := ModuleCat.ofHom (PiTensorProduct.map (fun _ => f.toLinearMap))
  naturality := sorry

/-- `CyclicBar.map` preserves identities. -/
theorem CyclicBar.map_id (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A] :
    CyclicBar.map (AlgHom.id k A) = 𝟙 (CyclicBar k A) := sorry

/-- `CyclicBar.map` preserves composition. -/
theorem CyclicBar.map_comp {k : Type} [CommRing k] {A A' A'' : Type} [Ring A] [Algebra k A]
    [Ring A'] [Algebra k A'] [Ring A''] [Algebra k A''] (f : A →ₐ[k] A') (g : A' →ₐ[k] A'') :
    CyclicBar.map (g.comp f) = CyclicBar.map f ≫ CyclicBar.map g := sorry

/-- The Hochschild complex `(C_•(A/k), b)`: Mathlib's alternating face map complex of the
underlying simplicial module of the cyclic bar construction. -/
abbrev RT1.hochschildComplex (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A] :
    ChainComplex (ModuleCat.{0} k) ℕ :=
  (AlgebraicTopology.alternatingFaceMapComplex (ModuleCat.{0} k)).obj
    (CyclicObject.toSimplicial.obj (CyclicBar k A))

/-- Degenerate chains `D_n ⊆ X_n`: the span of the images of the degeneracies
`s_j : X_{n−1} → X_n`. -/
def RT1.degenerate {k : Type} [CommRing k] (X : SimplicialObject (ModuleCat.{0} k)) :
    (n : ℕ) → Submodule k (X _⦋n⦌)
  | 0 => ⊥
  | n + 1 => ⨆ i : Fin (n + 1), LinearMap.range (X.σ i).hom

/-- Normalised chains `N_n(X) = X_n / D_n` (the quotient by degenerate elements). -/
def RT1.normalizedChains {k : Type} [CommRing k] (X : SimplicialObject (ModuleCat.{0} k))
    (n : ℕ) : ModuleCat.{0} k :=
  ModuleCat.of k (X _⦋n⦌ ⧸ RT1.degenerate X n)

/-- The Hochschild boundary `b` on normalised chains (it preserves degenerate chains). -/
def RT1.normalizedB {k : Type} [CommRing k] (X : SimplicialObject (ModuleCat.{0} k)) (n : ℕ) :
    RT1.normalizedChains X (n + 1) ⟶ RT1.normalizedChains X n :=
  ModuleCat.ofHom (Submodule.mapQ _ _ (RT1.altFaceSum X n).hom sorry)

/-- `b ∘ b = 0` on normalised chains. -/
theorem RT1.normalizedB_comp {k : Type} [CommRing k] (X : SimplicialObject (ModuleCat.{0} k))
    (n : ℕ) : RT1.normalizedB X (n + 1) ≫ RT1.normalizedB X n = 0 := sorry

/-- The normalised chain complex `(N(X), b)`. -/
def RT1.normalizedComplex {k : Type} [CommRing k] (X : SimplicialObject (ModuleCat.{0} k)) :
    ChainComplex (ModuleCat.{0} k) ℕ :=
  ChainComplex.of (RT1.normalizedChains X) (RT1.normalizedB X) (RT1.normalizedB_comp X)

/-- The map on normalised chains induced by a map of simplicial modules. -/
def RT1.normalizedMap {k : Type} [CommRing k] {X Y : SimplicialObject (ModuleCat.{0} k)}
    (f : X ⟶ Y) (n : ℕ) : RT1.normalizedChains X n ⟶ RT1.normalizedChains Y n :=
  ModuleCat.ofHom (Submodule.mapQ _ _ (f.app (op (SimplexCategory.mk n))).hom sorry)

/-- The Hochschild complex of `A` viewed as a DG algebra concentrated in degree `0`, as
constructed by DGAInfinity layer 8 (imported). -/
def RT1.dgaHochschildComplex (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A] :
    ChainComplex (ModuleCat.{0} k) ℕ := sorry

/-- The normalised Hochschild complex of DGAInfinity layer 8 (imported). -/
def RT1.dgaNormalizedHochschildComplex (k : Type) [CommRing k] (A : Type) [Ring A]
    [Algebra k A] : ChainComplex (ModuleCat.{0} k) ℕ := sorry

/-- The alternating face map complex of the cyclic bar construction is DGAInfinity layer 8's
Hochschild complex of `A`, and its normalised complex is layer 8's normalised Hochschild
complex. -/
theorem CyclicBar.alternatingFaceMapComplex_iso (k : Type) [CommRing k] (A : Type) [Ring A]
    [Algebra k A] :
    Nonempty (RT1.hochschildComplex k A ≅ RT1.dgaHochschildComplex k A) ∧
    Nonempty (RT1.normalizedComplex (CyclicObject.toSimplicial.obj (CyclicBar k A)) ≅
      RT1.dgaNormalizedHochschildComplex k A) := sorry

/-- `b ∘ b = 0` on `C_•(A/k)` (from the simplicial identities). -/
theorem CyclicBar.b_comp_b (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A] (n : ℕ) :
    RT1.altFaceSum (CyclicObject.toSimplicial.obj (CyclicBar k A)) (n + 1) ≫
      RT1.altFaceSum (CyclicObject.toSimplicial.obj (CyclicBar k A)) n = 0 := sorry

/-- The `k`-submodule `[A, A]` spanned by the commutators `ab − ba`. -/
def RT1.commutatorSpan (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A] :
    Submodule k A :=
  Submodule.span k {x | ∃ a b : A, x = a * b - b * a}

/-- Test `CyclicBar.ground_ring` (degenerate): for `A = k`, `H_*(C_•(k/k), b)` is `k` in degree
`0` and `0` elsewhere. -/
example (k : Type) [CommRing k] :
    Nonempty ((RT1.hochschildComplex k k).homology 0 ≅ ModuleCat.of k k) ∧
    ∀ n : ℕ, Limits.IsZero ((RT1.hochschildComplex k k).homology (n + 1)) := sorry

/-- Test `CyclicBar.H0` (computation): `H_0(C_•(A/k), b) ≅ A/[A,A]`; for `A = M_2(k)` this is `k`
via the trace. -/
example (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A] :
    Nonempty ((RT1.hochschildComplex k A).homology 0 ≅
      ModuleCat.of k (A ⧸ RT1.commutatorSpan k A)) ∧
    ∃ f : (Matrix (Fin 2) (Fin 2) k ⧸ RT1.commutatorSpan k (Matrix (Fin 2) (Fin 2) k)) →ₗ[k] k,
      Function.Bijective f ∧ ∀ m, f (Submodule.Quotient.mk m) = Matrix.trace m := sorry

/-- Test `CyclicBar.polynomial_H1` (computation): for `A = k[x]`, `H_1 ≅ k[x]·dx` via
`a_0⊗a_1 ↦ a_0 da_1`. -/
example (k : Type) [CommRing k] :
    ∃ e : (RT1.hochschildComplex k (Polynomial k)).homology 1 ≅
        ModuleCat.of k Ω[Polynomial k⁄k],
      ∀ (z : (RT1.hochschildComplex k (Polynomial k)).cycles 1) (a : Fin 2 → Polynomial k),
        ((RT1.hochschildComplex k (Polynomial k)).iCycles 1).hom z = PiTensorProduct.tprod k a →
        e.hom.hom (((RT1.hochschildComplex k (Polynomial k)).homologyπ 1).hom z) =
          a 0 • KaehlerDifferential.D k (Polynomial k) (a 1) := sorry

/-- Test `CyclicBar.nonexample_signed` (non-example): the signed rotation `(−1)^n τ_n` is not a
cyclic structure: the plain rotation satisfies `d_0 τ_1 = d_1`, while the signed one breaks it in
degree `1` for `A = k` with `2 ≠ 0`. -/
example (k : Type) [CommRing k] (h2 : (2 : k) ≠ 0) :
    RT1.cyclicOperator (CyclicBar k k) 1 ≫
        (CyclicObject.toSimplicial.obj (CyclicBar k k)).δ (0 : Fin 2) =
      (CyclicObject.toSimplicial.obj (CyclicBar k k)).δ (Fin.last 1) ∧
    ¬ (RT1.signedCyclicOperator (CyclicBar k k) 1 ≫
        (CyclicObject.toSimplicial.obj (CyclicBar k k)).δ (0 : Fin 2) =
      (CyclicObject.toSimplicial.obj (CyclicBar k k)).δ (Fin.last 1)) := sorry


/-! ### RT.1/connes-operator -/

/-- The extra degeneracy `s = t_{n+1} s_n : X_n → X_{n+1}` of a cyclic object (for the cyclic bar
construction `s(a_0⊗…⊗a_n) = 1⊗a_0⊗…⊗a_n`). -/
def RT1.extraDegeneracy {C : Type u} [Category.{v} C] (X : CyclicObject C) (n : ℕ) :
    X.obj (op (CyclicCategory.mk n)) ⟶ X.obj (op (CyclicCategory.mk (n + 1))) :=
  (CyclicObject.toSimplicial.obj X).σ (Fin.last n) ≫ RT1.cyclicOperator X (n + 1)

/-- Loday's formula `(1 − τ_{n+1}) s N_n`, `N_n = Σ_{i=0}^n τ_n^i`, on the (unnormalised) chains
of a cyclic object, for a family `τ` of rotation operators. Connes' operator is the case
`τ = RT1.signedCyclicOperator X`. -/
def RT1.connesFormula {C : Type u} [Category.{v} C] [Preadditive C] (X : CyclicObject C)
    (τ : ∀ n : ℕ, X.obj (op (CyclicCategory.mk n)) ⟶ X.obj (op (CyclicCategory.mk n)))
    (n : ℕ) : X.obj (op (CyclicCategory.mk n)) ⟶ X.obj (op (CyclicCategory.mk (n + 1))) :=
  (∑ i ∈ Finset.range (n + 1), RT1.homPow (τ n) i) ≫ RT1.extraDegeneracy X n ≫
    (𝟙 _ - τ (n + 1))

/-- Connes' operator `B = (1 − t)sN : N(X)_n → N(X)_{n+1}` on the normalised complex of a cyclic
`k`-module (RT.1/connes-operator), with `t` the signed cyclic operator; it preserves degenerate
chains. -/
def CyclicObject.connesB {k : Type} [CommRing k] (X : CyclicObject (ModuleCat.{0} k)) (n : ℕ) :
    RT1.normalizedChains (CyclicObject.toSimplicial.obj X) n ⟶
      RT1.normalizedChains (CyclicObject.toSimplicial.obj X) (n + 1) :=
  ModuleCat.ofHom (Submodule.mapQ _ _
    (RT1.connesFormula X (RT1.signedCyclicOperator X) n).hom sorry)

/-- `B ∘ B = 0`. -/
theorem CyclicObject.connesB_sq {k : Type} [CommRing k] (X : CyclicObject (ModuleCat.{0} k))
    (n : ℕ) : CyclicObject.connesB X n ≫ CyclicObject.connesB X (n + 1) = 0 := sorry

/-- `b ∘ B + B ∘ b = 0` on normalised chains (in degree `0` this reads `b ∘ B = 0`). -/
theorem CyclicObject.connesB_comm {k : Type} [CommRing k] (X : CyclicObject (ModuleCat.{0} k)) :
    CyclicObject.connesB X 0 ≫ RT1.normalizedB (CyclicObject.toSimplicial.obj X) 0 = 0 ∧
    ∀ n : ℕ, CyclicObject.connesB X (n + 1) ≫
        RT1.normalizedB (CyclicObject.toSimplicial.obj X) (n + 1) +
      RT1.normalizedB (CyclicObject.toSimplicial.obj X) n ≫ CyclicObject.connesB X n = 0 :=
  sorry

/-- `B` commutes with the maps induced by morphisms of cyclic modules. -/
theorem CyclicObject.connesB_natural {k : Type} [CommRing k]
    {X Y : CyclicObject (ModuleCat.{0} k)} (f : X ⟶ Y) (n : ℕ) :
    CyclicObject.connesB X n ≫ RT1.normalizedMap (CyclicObject.toSimplicial.map f) (n + 1) =
      RT1.normalizedMap (CyclicObject.toSimplicial.map f) n ≫ CyclicObject.connesB Y n := sorry

/-- The class in `N_n(A)` of a chain of `C_n(A/k)`. -/
def RT1.normClass (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A] (n : ℕ) :
    (⨂[k]^(n + 1) A) →ₗ[k]
      RT1.normalizedChains (CyclicObject.toSimplicial.obj (CyclicBar k A)) n :=
  (RT1.degenerate (CyclicObject.toSimplicial.obj (CyclicBar k A)) n).mkQ

/-- Connes' operator on normalised Hochschild chains:
`B(a_0⊗…⊗a_n) = Σ_{i=0}^n (−1)^{ni} 1⊗a_i⊗…⊗a_n⊗a_0⊗…⊗a_{i−1}`. -/
theorem CyclicBar.connesB_apply (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A]
    (n : ℕ) (a : Fin (n + 1) → A) :
    (CyclicObject.connesB (CyclicBar k A) n).hom
        (RT1.normClass k A n (PiTensorProduct.tprod k a)) =
      RT1.normClass k A (n + 1) (∑ i : Fin (n + 1), ((-1 : ℤ) ^ (n * (i : ℕ))) •
        PiTensorProduct.tprod k (Matrix.vecCons (1 : A) (fun j : Fin (n + 1) => a (j + i)))) :=
  sorry

/-- Test `CyclicBar.connesB_unit` (degenerate): `B(1) = 0` in `N_1(A)` because `1⊗1` is
degenerate. -/
example (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A] :
    (CyclicObject.connesB (CyclicBar k A) 0).hom
      (RT1.normClass k A 0 (PiTensorProduct.tprod k (fun _ : Fin 1 => (1 : A)))) = 0 := sorry

/-- Test `CyclicBar.connesB_sq_unnormalised` (characterisation): `B ∘ B = 0` already on
unnormalised chains, since `N_{n+1}(1 − t_{n+1}) = 1 − t_{n+1}^{n+2} = 0`; normalisation only
simplifies the formula for `B`. -/
example (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A] (n : ℕ) :
    RT1.connesFormula (CyclicBar k A) (RT1.signedCyclicOperator (CyclicBar k A)) n ≫
      RT1.connesFormula (CyclicBar k A) (RT1.signedCyclicOperator (CyclicBar k A)) (n + 1) = 0 :=
  sorry

/-- Endomorphisms of the chains `C_n(A/k)`. -/
abbrev RT1.chainEnd (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A] (n : ℕ) : Type :=
  (CyclicBar k A).obj (op (CyclicCategory.mk n)) ⟶ (CyclicBar k A).obj (op (CyclicCategory.mk n))

/-- Test `CyclicObject.nonexample_sign` (non-example): on `A^{⊗(•+1)}` for `A = k[x]` (with
`2 ≠ 0` in `k`), Loday's formula `(1 − τ)sN` built with the plain rotation `τ = t` fails
`bB + Bb = 0` in degree `1`, while the signed rotation `(−1)^n t_n` satisfies it. -/
example (k : Type) [CommRing k] (h2 : (2 : k) ≠ 0) :
    ¬ ((RT1.connesFormula (CyclicBar k (Polynomial k))
          (RT1.cyclicOperator (CyclicBar k (Polynomial k))) 1 ≫
        RT1.altFaceSum (CyclicObject.toSimplicial.obj (CyclicBar k (Polynomial k))) 1 :
          RT1.chainEnd k (Polynomial k) 1) +
      (RT1.altFaceSum (CyclicObject.toSimplicial.obj (CyclicBar k (Polynomial k))) 0 ≫
        RT1.connesFormula (CyclicBar k (Polynomial k))
          (RT1.cyclicOperator (CyclicBar k (Polynomial k))) 0 :
          RT1.chainEnd k (Polynomial k) 1) = 0) ∧
    ((RT1.connesFormula (CyclicBar k (Polynomial k))
          (RT1.signedCyclicOperator (CyclicBar k (Polynomial k))) 1 ≫
        RT1.altFaceSum (CyclicObject.toSimplicial.obj (CyclicBar k (Polynomial k))) 1 :
          RT1.chainEnd k (Polynomial k) 1) +
      (RT1.altFaceSum (CyclicObject.toSimplicial.obj (CyclicBar k (Polynomial k))) 0 ≫
        RT1.connesFormula (CyclicBar k (Polynomial k))
          (RT1.signedCyclicOperator (CyclicBar k (Polynomial k))) 0 :
          RT1.chainEnd k (Polynomial k) 1) = 0) := sorry

/-! ### RT.1/mixed-complex -/

/-- Unbounded mixed complexes, homologically Z-graded. -/
structure MixedComplex (k : Type) [CommRing k] where
  X : ℤ → ModuleCat.{0} k
  b : ∀ n, X (n + 1) ⟶ X n
  B : ∀ n, X n ⟶ X (n + 1)
  b_comp_b : ∀ n, b (n + 1) ≫ b n = 0
  B_comp_B : ∀ n, B n ≫ B (n + 1) = 0
  bB_add_Bb : ∀ n, B (n + 1) ≫ b (n + 1) + b n ≫ B n = 0

namespace MixedComplex

variable {k : Type} [CommRing k]

/-- Morphisms of mixed complexes: graded maps commuting with `b` and `B`. -/
@[ext]
structure Hom (M N : MixedComplex k) where
  /-- The graded components. -/
  f : ∀ n, M.X n ⟶ N.X n
  comm_b : ∀ n, M.b n ≫ f n = f (n + 1) ≫ N.b n
  comm_B : ∀ n, M.B n ≫ f (n + 1) = f n ≫ N.B n

/-- The category of mixed complexes, with identity and composition computed degreewise. -/
instance : Category (MixedComplex k) where
  Hom := Hom
  id M := ⟨fun n => 𝟙 _, by simp, by simp⟩
  comp f g := ⟨fun n => f.f n ≫ g.f n,
    fun n => by rw [← Category.assoc, f.comm_b, Category.assoc, g.comm_b, Category.assoc],
    fun n => by rw [← Category.assoc, f.comm_B, Category.assoc, g.comm_B, Category.assoc]⟩
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

end MixedComplex

/-- The chain complex `(M, b)` of a mixed complex. -/
def RT1.bComplex {k : Type} [CommRing k] (M : MixedComplex k) :
    ChainComplex (ModuleCat.{0} k) ℤ := sorry

/-- The induced map of underlying integer-graded complexes. -/
def RT1.bComplexMap {k : Type} [CommRing k] {M N : MixedComplex k} (f : M ⟶ N) :
    RT1.bComplex M ⟶ RT1.bComplex N := sorry

/-- A morphism of mixed complexes is a quasi-isomorphism if it is a quasi-isomorphism of the
`b`-complexes. -/
def MixedComplex.QuasiIso {k : Type} [CommRing k] {M N : MixedComplex k} (f : M ⟶ N) : Prop :=
  _root_.QuasiIso (RT1.bComplexMap f)

/-- A morphism of mixed complexes is a quasi-isomorphism iff it induces isomorphisms on
`b`-homology (its effect on `HC`, `HC⁻`, `HP` is `MixedComplex.cyclicComplex_quasiIso`). -/
theorem RT1.MixedComplex.quasiIso_iff {k : Type} [CommRing k] {M N : MixedComplex k}
    (f : M ⟶ N) : MixedComplex.QuasiIso f ↔
      ∀ n : ℤ, IsIso (HomologicalComplex.homologyMap (RT1.bComplexMap f) n) := sorry

/-- The mixed complex `(N(X), b, B)` of a cyclic `k`-module, natural in `X`. -/
def MixedComplex.ofCyclic (k : Type) [CommRing k] :
    CyclicObject (ModuleCat.{0} k) ⥤ MixedComplex k := sorry

/-- Normalized cyclic chains are extended by zero below zero. -/
theorem MixedComplex.ofCyclic_X (k : Type) [CommRing k]
    (C : CyclicObject (ModuleCat.{0} k)) (n : ℤ) :
    (n < 0 → Limits.IsZero (((MixedComplex.ofCyclic k).obj C).X n)) ∧
    (0 ≤ n → Nonempty (((MixedComplex.ofCyclic k).obj C).X n ≅
      RT1.normalizedChains (CyclicObject.toSimplicial.obj C) n.toNat)) := sorry

/-- The mixed complex `C(A/k) = (N C_•(A/k), b, B)` of an algebra. -/
abbrev RT1.algMixed (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A] :
    MixedComplex k :=
  (MixedComplex.ofCyclic k).obj (CyclicBar k A)

/-- The chosen degree identification after zero extension. -/
def RT1.algMixedDegreeIso (k A : Type) [CommRing k] [Ring A] [Algebra k A] (n : ℕ) :
    RT1.normalizedChains (CyclicObject.toSimplicial.obj (CyclicBar k A)) n ≅
      (RT1.algMixed k A).X (n : ℤ) := sorry

def RT1.normMixedClass (k A : Type) [CommRing k] [Ring A] [Algebra k A] (n : ℕ) :
    (⨂[k]^(n + 1) A) →ₗ[k] (RT1.algMixed k A).X (n : ℤ) := sorry

/-- Differential graded modules over `k[ε]/ε²` with `|ε| = 1` (homological grading, degrees
`≥ 0`): a chain complex with an action of `ε` of degree `+1`, `ε² = 0`, satisfying the graded
Leibniz rule `dε + εd = 0`. -/
structure RT1.DGModEps (k : Type) [CommRing k] where
  K : ChainComplex (ModuleCat.{0} k) ℤ
  eps : ∀ n, K.X n ⟶ K.X (n + 1)
  eps_sq : ∀ n, eps n ≫ eps (n + 1) = 0
  leibniz : ∀ n, eps (n + 1) ≫ K.d (n + 1 + 1) (n + 1) + K.d (n + 1) n ≫ eps n = 0

/-- Morphisms of dg-modules over `k[ε]/ε²`: chain maps commuting with `ε`. -/
instance (k : Type) [CommRing k] : Category (RT1.DGModEps k) := sorry

/-- Mixed complexes are dg-modules over `k[ε]/ε²` with `|ε| = 1` (`ε` acting by `B`). -/
def MixedComplex.equivDGModule (k : Type) [CommRing k] : MixedComplex k ≌ RT1.DGModEps k :=
  sorry

/-- The unit mixed complex `(k, 0, 0)`: `k` in degree `0`, `b = B = 0`. -/
def RT1.MixedComplex.unit (k : Type) [CommRing k] : MixedComplex k where
  X n := if n = 0 then ModuleCat.of k k else ModuleCat.of k PUnit
  b _ := 0
  B _ := 0
  b_comp_b _ := by simp
  B_comp_B _ := by simp
  bB_add_Bb _ := by simp

/-- The tensor product of mixed complexes `(M⊗N, b⊗1 ± 1⊗b, B⊗1 ± 1⊗B)`, with
`(M⊗N)_n = ⊕_{p+q=n} M_p ⊗_k N_q` (Koszul signs). -/
def MixedComplex.tensor {k : Type} [CommRing k] (M N : MixedComplex k) : MixedComplex k :=
  sorry

/-- The graded pieces of `M ⊗ N`. -/
theorem RT1.MixedComplex.tensor_X {k : Type} [CommRing k] (M N : MixedComplex k) (n : ℤ) :
    Nonempty ((M.tensor N).X n ≅
      ModuleCat.of k (DirectSum ℤ (fun p => (M.X p) ⊗[k] (N.X (n - p))))) := sorry

/-- The tensor product makes mixed complexes symmetric monoidal, with unit `(k, 0, 0)`. -/
theorem RT1.MixedComplex.tensor_symmMonoidal {k : Type} [CommRing k] (M N P : MixedComplex k) :
    Nonempty (M.tensor N ≅ N.tensor M) ∧
    Nonempty ((M.tensor N).tensor P ≅ M.tensor (N.tensor P)) ∧
    Nonempty ((RT1.MixedComplex.unit k).tensor M ≅ M) := sorry

/-- Test `MixedComplex.trivial` (degenerate): `k` in degree `0` with `b = B = 0` is a mixed
complex. -/
example (k : Type) [CommRing k] :
    ∃ M : MixedComplex k, Nonempty (M.X 0 ≅ ModuleCat.of k k) ∧
      (∀ n : ℤ, n ≠ 0 → Limits.IsZero (M.X n)) ∧ (∀ n, M.b n = 0) ∧ (∀ n, M.B n = 0) := sorry

/-- Test `MixedComplex.ofCyclic_ground` (computation): the mixed complex of `k` as a
`k`-algebra is quasi-isomorphic to `(k, 0, 0)`. -/
example (k : Type) [CommRing k] :
    ∃ f : RT1.algMixed k k ⟶ RT1.MixedComplex.unit k, MixedComplex.QuasiIso f := sorry

/-- Test `MixedComplex.nonexample` (non-example): `k` in degrees `0` and `1` with
`b : M_1 → M_0` and `B : M_0 → M_1` both the identity is not a mixed complex
(`bB + Bb = id ≠ 0`). -/
example (k : Type) [CommRing k] [Nontrivial k] :
    ¬ ∃ (M : MixedComplex k) (e₀ : M.X 0 ≅ ModuleCat.of k k) (e₁ : M.X 1 ≅ ModuleCat.of k k),
      e₁.inv ≫ M.b 0 ≫ e₀.hom = 𝟙 _ ∧ e₀.inv ≫ M.B 0 ≫ e₁.hom = 𝟙 _ := sorry

/-! ### RT.1/cyclic-homology -/

/-- The cyclic complex `CC(M) = (M ⊗ k[u⁻¹], b + uB)` (`|u| = −2`, `u·u⁰ = 0`), with the
direct-sum totalisation `CC_n = ⊕_{i ≥ 0} M_{n−2i}`. -/
def MixedComplex.cyclicComplex {k : Type} [CommRing k] (M : MixedComplex k) :
    ChainComplex (ModuleCat.{0} k) ℤ := sorry

/-- Negative cyclic totalization uses a product of all nonnegative u powers. -/
def MixedComplex.negativeCyclicComplex {k : Type} [CommRing k] (M : MixedComplex k) :
    ChainComplex (ModuleCat.{0} k) ℤ := sorry

/-- Laurent series have a finite lower bound on the u exponent. -/
def MixedComplex.laurentPieces {k : Type} [CommRing k] (M : MixedComplex k) (n : ℤ) :
    Submodule k (∀ i : ℤ, M.X (n + 2 * i)) where
  carrier := {a | ∃ r : ℕ, ∀ i : ℤ, i < -(r : ℤ) → a i = 0}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

/-- Periodic totalization is the filtered union of the Laurent product pieces. -/
def MixedComplex.periodicCyclicComplex {k : Type} [CommRing k] (M : MixedComplex k) :
    ChainComplex (ModuleCat.{0} k) ℤ := sorry

/-- Degreewise totalizations for arbitrary unbounded mixed complexes. -/
theorem RT1.MixedComplex.cyclicComplexes_X {k : Type} [CommRing k] (M : MixedComplex k) :
    (∀ n : ℤ, Nonempty (M.cyclicComplex.X n ≅
      ModuleCat.of k (DirectSum ℕ (fun i => M.X (n - 2 * (i : ℤ)))))) ∧
    (∀ n : ℤ, Nonempty (M.negativeCyclicComplex.X n ≅
      ModuleCat.of k (∀ i : ℕ, M.X (n + 2 * (i : ℤ))))) ∧
    (∀ n : ℤ, Nonempty (M.periodicCyclicComplex.X n ≅
      ModuleCat.of k (M.laurentPieces n))) := sorry

/-- `HH_n(M) = H_n(M, b)`. -/
abbrev RT1.mixedHH {k : Type} [CommRing k] (M : MixedComplex k) (n : ℤ) : ModuleCat.{0} k :=
  (RT1.bComplex M).homology n

/-- `HC_n(M) = H_n CC(M)`. -/
abbrev RT1.mixedHC {k : Type} [CommRing k] (M : MixedComplex k) (n : ℤ) : ModuleCat.{0} k :=
  M.cyclicComplex.homology n

/-- `HC⁻_n(M) = H_n CC⁻(M)`. -/
abbrev RT1.mixedHCminus {k : Type} [CommRing k] (M : MixedComplex k) (n : ℤ) :
    ModuleCat.{0} k :=
  M.negativeCyclicComplex.homology n

/-- `HP_n(M) = H_n CP(M)`. -/
abbrev RT1.mixedHP {k : Type} [CommRing k] (M : MixedComplex k) (n : ℤ) : ModuleCat.{0} k :=
  M.periodicCyclicComplex.homology n

/-- The mixed complex of a `k`-flat resolution of `A` (a simplicial resolution by `k`-flat
algebras, or a `k`-flat DG algebra quasi-isomorphic to `A`), well defined up to
quasi-isomorphism; for `A` flat over `k` it is quasi-isomorphic to `C(A/k)`. -/
def RT1.derivedMixed (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A] :
    MixedComplex k := sorry

/-- For `A` flat over `k`, the derived mixed complex is quasi-isomorphic to `C(A/k)`. -/
theorem RT1.derivedMixed_flat (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A]
    [Module.Flat k A] : ∃ f : RT1.derivedMixed k A ⟶ RT1.algMixed k A, MixedComplex.QuasiIso f :=
  sorry

/-- Cyclic homology `HC_n(A/k)` of an algebra, via its (derived) mixed complex. -/
def cyclicHomology (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A] (n : ℕ) :
    ModuleCat.{0} k :=
  RT1.mixedHC (RT1.derivedMixed k A) n

/-- Negative cyclic homology `HC⁻_n(A/k)`, `n ∈ ℤ`. -/
def negativeCyclicHomology (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A] (n : ℤ) :
    ModuleCat.{0} k :=
  RT1.mixedHCminus (RT1.derivedMixed k A) n

/-- Periodic cyclic homology `HP_n(A/k)`, `n ∈ ℤ`. -/
def periodicCyclicHomology (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A] (n : ℤ) :
    ModuleCat.{0} k :=
  RT1.mixedHP (RT1.derivedMixed k A) n

/-- The map `CC(M) → CC(N)` induced by a morphism of mixed complexes. -/
def RT1.cyclicComplexMap {k : Type} [CommRing k] {M N : MixedComplex k} (f : M ⟶ N) :
    M.cyclicComplex ⟶ N.cyclicComplex := sorry

/-- The map `CC⁻(M) → CC⁻(N)` induced by a morphism of mixed complexes. -/
def RT1.negativeCyclicComplexMap {k : Type} [CommRing k] {M N : MixedComplex k} (f : M ⟶ N) :
    M.negativeCyclicComplex ⟶ N.negativeCyclicComplex := sorry

/-- The map `CP(M) → CP(N)` induced by a morphism of mixed complexes. -/
def RT1.periodicCyclicComplexMap {k : Type} [CommRing k] {M N : MixedComplex k} (f : M ⟶ N) :
    M.periodicCyclicComplex ⟶ N.periodicCyclicComplex := sorry

/-- Quasi-isomorphisms of mixed complexes induce isomorphisms on `HC`, `HC⁻` and `HP`. -/
theorem MixedComplex.cyclicComplex_quasiIso {k : Type} [CommRing k] {M N : MixedComplex k}
    (f : M ⟶ N) (hf : MixedComplex.QuasiIso f) :
    _root_.QuasiIso (RT1.cyclicComplexMap f) ∧ _root_.QuasiIso (RT1.negativeCyclicComplexMap f) ∧
      _root_.QuasiIso (RT1.periodicCyclicComplexMap f) := sorry

/-- The map `HP_n(M) → HP_{n−2}(M)` induced by multiplication by `u`. -/
def RT1.periodicU {k : Type} [CommRing k] (M : MixedComplex k) (n : ℤ) :
    RT1.mixedHP M n ⟶ RT1.mixedHP M (n - 2) := sorry

/-- Multiplication by `u` gives `HP_n(A/k) ≅ HP_{n−2}(A/k)`. -/
theorem periodicCyclicHomology.periodicity (k : Type) [CommRing k] (A : Type) [Ring A]
    [Algebra k A] (n : ℤ) :
    IsIso (RT1.periodicU (RT1.derivedMixed k A) n :
      periodicCyclicHomology k A n ⟶ periodicCyclicHomology k A (n - 2)) := sorry

/-- Connes' complex `C^λ_•(A) = (C_•(A/k)/(1 − t'), b)`, `t'` the signed cyclic operator. -/
def RT1.connesComplex (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A] :
    ChainComplex (ModuleCat.{0} k) ℕ :=
  ChainComplex.of
    (fun n => ModuleCat.of k ((CyclicBar k A).obj (op (CyclicCategory.mk n)) ⧸
      LinearMap.range (𝟙 _ - RT1.signedCyclicOperator (CyclicBar k A) n).hom))
    (fun n => ModuleCat.ofHom (Submodule.mapQ _ _
      (RT1.altFaceSum (CyclicObject.toSimplicial.obj (CyclicBar k A)) n).hom sorry))
    sorry

/-- If `ℚ ⊆ k` (and `A` is `k`-flat), `HC_n(A/k) ≅ H_n(C_•(A)/(1 − t))` (Connes' complex). -/
theorem cyclicHomology.connes_complex (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A]
    [Algebra ℚ k] [Module.Flat k A] (n : ℕ) :
    Nonempty (cyclicHomology k A n ≅ (RT1.connesComplex k A).homology n) := sorry

/-- Test `cyclicHomology.ground` (computation): `HC_{2m}(k/k) = k` and `HC_{2m+1}(k/k) = 0` for
`m ≥ 0`. -/
example (k : Type) [CommRing k] (m : ℕ) :
    Nonempty (cyclicHomology k k (2 * m) ≅ ModuleCat.of k k) ∧
      Limits.IsZero (cyclicHomology k k (2 * m + 1)) := sorry

/-- Test `periodicCyclicHomology.ground` (computation): `HP_{2m}(k/k) = k` for all `m ∈ ℤ`. -/
example (k : Type) [CommRing k] (m : ℤ) :
    Nonempty (periodicCyclicHomology k k (2 * m) ≅ ModuleCat.of k k) := sorry

/-- Test `negativeCyclicHomology.ground` (degenerate): `HC⁻_n(k/k) = k` for `n ≤ 0` even and
`0` otherwise. -/
example (k : Type) [CommRing k] (n : ℤ) :
    (n ≤ 0 → Even n → Nonempty (negativeCyclicHomology k k n ≅ ModuleCat.of k k)) ∧
    (¬ (n ≤ 0 ∧ Even n) → Limits.IsZero (negativeCyclicHomology k k n)) := sorry

/-- Test `negativeCyclicHomology.not_cyclic` (non-example): `HC⁻_2(k/k) = 0` while
`HC_2(k/k) = k`, so the cyclic convention `k[u⁻¹]` does not compute `HC⁻`. -/
example (k : Type) [CommRing k] :
    Limits.IsZero (negativeCyclicHomology k k 2) ∧
      Nonempty (cyclicHomology k k 2 ≅ ModuleCat.of k k) := sorry

/-! ### RT.1/sbi-sequence -/

/-- `I : HH_n(M) → HC_n(M)`, induced by the inclusion of the `u⁰`-column. -/
def RT1.sbiI {k : Type} [CommRing k] (M : MixedComplex k) (n : ℤ) :
    RT1.mixedHH M n ⟶ RT1.mixedHC M n := sorry

/-- `S : HC_{n+2}(M) → HC_n(M)`, multiplication by `u` (removing the `u⁰`-column). -/
def RT1.sbiS {k : Type} [CommRing k] (M : MixedComplex k) (n : ℤ) :
    RT1.mixedHC M (n + 2) ⟶ RT1.mixedHC M n := sorry

/-- `B : HC_n(M) → HH_{n+1}(M)`, induced by Connes' operator. -/
def RT1.sbiB {k : Type} [CommRing k] (M : MixedComplex k) (n : ℤ) :
    RT1.mixedHC M n ⟶ RT1.mixedHH M (n + 1) := sorry

/-- `u : HC⁻_{n+2}(M) → HC⁻_n(M)`. -/
def RT1.negU {k : Type} [CommRing k] (M : MixedComplex k) (n : ℤ) :
    RT1.mixedHCminus M (n + 1 + 1) ⟶ RT1.mixedHCminus M n := sorry

/-- `HC⁻_n(M) → HH_n(M)`, reduction modulo `u`. -/
def RT1.negP {k : Type} [CommRing k] (M : MixedComplex k) (n : ℤ) :
    RT1.mixedHCminus M (n : ℤ) ⟶ RT1.mixedHH M n := sorry

/-- `HH_n(M) → HC⁻_{n+1}(M)`, the connecting map (induced by `B`). -/
def RT1.negJ {k : Type} [CommRing k] (M : MixedComplex k) (n : ℤ) :
    RT1.mixedHH M n ⟶ RT1.mixedHCminus M (n + 1) := sorry

/-- SBI and negative-cyclic long exact sequences for all integer degrees of an arbitrary
mixed complex. Bottom-degree conclusions are stated separately under connectivity. -/
theorem sbiSequence {k : Type} [CommRing k] (M : MixedComplex k) :
    (∀ n, Function.Exact (RT1.sbiI M (n + 2)).hom (RT1.sbiS M n).hom) ∧
    (∀ n, Function.Exact (RT1.sbiS M n).hom (RT1.sbiB M n).hom) ∧
    (∀ n, Function.Exact (RT1.sbiB M n).hom (RT1.sbiI M (n + 1)).hom) ∧
    (∀ n, Function.Exact (RT1.negU M n).hom (RT1.negP M n).hom) ∧
    (∀ n, Function.Exact (RT1.negP M n).hom (RT1.negJ M n).hom) ∧
    (∀ n, Function.Exact (RT1.negJ M (n + 1)).hom (RT1.negU M n).hom) := sorry

/-- Bottom-degree SBI consequence for a mixed complex concentrated in nonnegative degrees. -/
theorem sbiSequence.connective {k : Type} [CommRing k] (M : MixedComplex k)
    (hM : ∀ n : ℤ, n < 0 → Limits.IsZero (M.X n)) :
    (∀ n : ℤ, n < 0 → Limits.IsZero (RT1.mixedHC M n)) ∧
    Function.Bijective (RT1.sbiI M 0).hom ∧ Function.Surjective (RT1.sbiI M 1).hom := sorry

/-- A negative-degree mixed object need not have vanishing ordinary cyclic homology in negative degrees. -/
example (k : Type) [CommRing k] : ∃ M : MixedComplex k,
    Nonempty (RT1.mixedHC M (-1) ≅ ModuleCat.of k k) := sorry

/-! ### RT.1/hochschild-homology -/

/-- The derived category `D(k)` of `k`-modules (homological grading), prototyped by a category
(Mathlib's `DerivedCategory` is not imported here). -/
def RT1.DMod (k : Type) [CommRing k] : Type 1 := sorry

instance (k : Type) [CommRing k] : Category.{0} (RT1.DMod k) := sorry

namespace RT1.DMod

variable {k : Type} [CommRing k]

/-- Homology `H_n X`, `n ∈ ℤ`. -/
def homology (X : RT1.DMod k) (n : ℤ) : ModuleCat.{0} k := sorry

/-- The map on `H_n` induced by a map in `D(k)`. -/
def homologyMap {X Y : RT1.DMod k} (f : X ⟶ Y) (n : ℤ) : X.homology n ⟶ Y.homology n := sorry

/-- The localisation functor from (connective) chain complexes to `D(k)`. -/
def ofComplex (k : Type) [CommRing k] : ChainComplex (ModuleCat.{0} k) ℕ ⥤ RT1.DMod k := sorry

/-- Localization of an arbitrary integer-graded complex, supplied by EDS E5. -/
def ofComplexZ (k : Type) [CommRing k] : ChainComplex (ModuleCat.{0} k) ℤ ⥤ RT1.DMod k := sorry

theorem ofComplex_spec (K L : ChainComplex (ModuleCat.{0} k) ℕ) (f : K ⟶ L) :
    (∀ n : ℕ, Nonempty (((ofComplex k).obj K).homology n ≅ K.homology n)) ∧
    (∀ n : ℕ, Limits.IsZero (((ofComplex k).obj K).homology (-((n : ℤ) + 1)))) ∧
    (IsIso ((ofComplex k).map f) ↔ _root_.QuasiIso f) := sorry

/-- A module placed in degree `0`. -/
def ofModule (M : ModuleCat.{0} k) : RT1.DMod k :=
  (ofComplex k).obj ((ChainComplex.single₀ (ModuleCat.{0} k)).obj M)

/-- The shift `X[n]` (`H_m(X[n]) = H_{m−n}(X)`). -/
def shift (X : RT1.DMod k) (n : ℤ) : RT1.DMod k := sorry

/-- The fibre of a map. -/
def fib {X Y : RT1.DMod k} (f : X ⟶ Y) : RT1.DMod k := sorry

/-- The map from the fibre. -/
def fibι {X Y : RT1.DMod k} (f : X ⟶ Y) : fib f ⟶ X := sorry

/-- The connecting map `H_{n+1}(Y) → H_n(fib f)`. -/
def fibδ {X Y : RT1.DMod k} (f : X ⟶ Y) (n : ℤ) : Y.homology (n + 1) ⟶ (fib f).homology n :=
  sorry

/-- The cofibre of a map. -/
def cofib {X Y : RT1.DMod k} (f : X ⟶ Y) : RT1.DMod k := sorry

/-- The derived tensor product `X ⊗^L_k Y`. -/
def tensorL (X Y : RT1.DMod k) : RT1.DMod k := sorry

/-- Derived base change `− ⊗^L_k K : D(k) → D(K)` along a ring map `k → K`. -/
def extendScalars {K : Type} [CommRing K] (f : k →+* K) : RT1.DMod k ⥤ RT1.DMod K := sorry

/-- Restriction of scalars `D(K) → D(k)` along a ring map `k → K`. -/
def restrictScalars {K : Type} [CommRing K] (f : k →+* K) : RT1.DMod K ⥤ RT1.DMod k := sorry

end RT1.DMod

/-- Hochschild homology `HH(A/k) = A ⊗^L_{A ⊗^L_k A^op} A ∈ D(k)` (RT.1/hochschild-homology),
computed by the Hochschild complex of a `k`-flat resolution of `A`: the `b`-complex of
`RT1.derivedMixed k A`. Through RT.2/mixed-complexes-are-circle-modules it carries a circle
action. -/
def HochschildHomology (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A] :
    RT1.DMod k :=
  (RT1.DMod.ofComplexZ k).obj (RT1.bComplex (RT1.derivedMixed k A))

/-- `HH_n(A/k) = H_n HH(A/k)` for `n ∈ ℕ`. -/
abbrev RT1.HH (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A] (n : ℕ) :
    ModuleCat.{0} k :=
  (HochschildHomology k A).homology n

/-- For `A` flat over `k`, `HH(A/k) ≅ (C_•(A/k), b)` in `D(k)`. -/
theorem HochschildHomology.ofFlat (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A]
    [Module.Flat k A] :
    Nonempty (HochschildHomology k A ≅ (RT1.DMod.ofComplex k).obj (RT1.hochschildComplex k A)) :=
  sorry

/-- The map `HH(A/k) → HH(A'/k)` induced by a `k`-algebra map. -/
def HochschildHomology.map {k : Type} [CommRing k] {A A' : Type} [Ring A] [Algebra k A]
    [Ring A'] [Algebra k A'] (f : A →ₐ[k] A') : HochschildHomology k A ⟶ HochschildHomology k A' :=
  sorry

/-- `HochschildHomology.map` preserves identities. -/
theorem HochschildHomology.map_id (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A] :
    HochschildHomology.map (AlgHom.id k A) = 𝟙 (HochschildHomology k A) := sorry

/-- `HochschildHomology.map` preserves composition. -/
theorem HochschildHomology.map_comp {k : Type} [CommRing k] {A A' A'' : Type} [Ring A]
    [Algebra k A] [Ring A'] [Algebra k A'] [Ring A''] [Algebra k A''] (f : A →ₐ[k] A')
    (g : A' →ₐ[k] A'') :
    HochschildHomology.map (g.comp f) = HochschildHomology.map f ≫ HochschildHomology.map g :=
  sorry

/-- Functoriality in pairs: a map of pairs `(k → A) → (k' → A')` (ring maps `f₀ : k → k'`,
`f : A → A'` compatible with the structure maps) induces `HH(A/k) → HH(A'/k')`, a map in `D(k)`
to the restriction of scalars of `HH(A'/k')`. -/
def RT1.HochschildHomology.mapPair {k k' : Type} [CommRing k] [CommRing k'] {A A' : Type}
    [Ring A] [Algebra k A] [Ring A'] [Algebra k' A'] (f₀ : k →+* k') (f : A →+* A')
    (hf : ∀ c : k, f (algebraMap k A c) = algebraMap k' A' (f₀ c)) :
    HochschildHomology k A ⟶ (RT1.DMod.restrictScalars f₀).obj (HochschildHomology k' A') := sorry

/-- Relative Hochschild homology `HH(A, I) = fib(HH(A/k) → HH((A/I)/k))` of a two-sided ideal. -/
def HochschildHomology.relative (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A]
    (I : Ideal A) [I.IsTwoSided] : RT1.DMod k :=
  RT1.DMod.fib (HochschildHomology.map (Ideal.Quotient.mkₐ k I))

/-- The long exact sequence
`… → HH_{n+1}(A) → HH_{n+1}(A/I) → H_n HH(A, I) → HH_n(A) → HH_n(A/I) → …`. -/
theorem RT1.HochschildHomology.relative_exact (k : Type) [CommRing k] (A : Type) [Ring A]
    [Algebra k A] (I : Ideal A) [I.IsTwoSided] (n : ℤ) :
    Function.Exact
      (RT1.DMod.homologyMap (RT1.DMod.fibι (HochschildHomology.map (Ideal.Quotient.mkₐ k I))) n).hom
      (RT1.DMod.homologyMap (HochschildHomology.map (Ideal.Quotient.mkₐ k I)) n).hom ∧
    Function.Exact
      (RT1.DMod.homologyMap (HochschildHomology.map (Ideal.Quotient.mkₐ k I)) (n + 1)).hom
      (RT1.DMod.fibδ (HochschildHomology.map (Ideal.Quotient.mkₐ k I)) n).hom ∧
    Function.Exact
      (RT1.DMod.fibδ (HochschildHomology.map (Ideal.Quotient.mkₐ k I)) n).hom
      (RT1.DMod.homologyMap (RT1.DMod.fibι (HochschildHomology.map (Ideal.Quotient.mkₐ k I))) n).hom :=
  sorry

/-- `HH_0(A/k) ≅ A/[A,A]` (derived `HH_0` agrees with the underived one). -/
theorem HochschildHomology.zeroth (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A] :
    Nonempty (RT1.HH k A 0 ≅ ModuleCat.of k (A ⧸ RT1.commutatorSpan k A)) := sorry

/-- E_∞-algebras in `D(k)` (EnhancedDerivedSheaves E5:abstract), prototyped by a category. -/
def RT1.CAlgD (k : Type) [CommRing k] : Type 1 := sorry

instance (k : Type) [CommRing k] : Category.{0} (RT1.CAlgD k) := sorry

/-- The underlying object of `D(k)`. -/
def RT1.CAlgD.forget (k : Type) [CommRing k] : RT1.CAlgD k ⥤ RT1.DMod k := sorry

/-- A commutative `k`-algebra as an E_∞-`k`-algebra. -/
def RT1.CAlgD.ofCommAlg {k : Type} [CommRing k] (A : Type) [CommRing A] [Algebra k A] :
    RT1.CAlgD k := sorry

/-- `π_0` (= `H_0`) of an E_∞-`k`-algebra, a commutative ring. -/
def RT1.CAlgD.pi0 {k : Type} [CommRing k] (R : RT1.CAlgD k) : Type := sorry

instance {k : Type} [CommRing k] (R : RT1.CAlgD k) : CommRing (RT1.CAlgD.pi0 R) := sorry

/-- For commutative `A`, `HH(A/k)` is an E_∞-`k`-algebra (multiplication from the shuffle
product), with underlying object `HH(A/k)` and `HH_0(A/k) = A` as rings. -/
def HochschildHomology.commutativeAlgebra (k : Type) [CommRing k] (A : Type) [CommRing A]
    [Algebra k A] :
    { R : RT1.CAlgD k // Nonempty ((RT1.CAlgD.forget k).obj R ≅ HochschildHomology k A) ∧
      Nonempty (RT1.CAlgD.pi0 R ≃+* A) } := sorry

/-- Test `HochschildHomology.base` (degenerate): `HH(k/k) ≅ k` in degree `0`. -/
example (k : Type) [CommRing k] :
    Nonempty (HochschildHomology k k ≅ RT1.DMod.ofModule (ModuleCat.of k k)) := sorry

/-- Test `HochschildHomology.polynomial` (computation): `HH_*(k[x]/k) ≅ k[x] ⊕ k[x]dx`,
concentrated in degrees `0` and `1`. -/
example (k : Type) [CommRing k] :
    Nonempty (RT1.HH k (Polynomial k) 0 ≅ ModuleCat.of k (Polynomial k)) ∧
    Nonempty (RT1.HH k (Polynomial k) 1 ≅ ModuleCat.of k Ω[Polynomial k⁄k]) ∧
    ∀ n : ℤ, n ≠ 0 → n ≠ 1 → Limits.IsZero ((HochschildHomology k (Polynomial k)).homology n) :=
  sorry

/-- Test `HochschildHomology.Fp_over_Z_degree2` (computation): `HH_2(𝔽_p/ℤ) ≅ 𝔽_p` (the divided
power generator), while `HH_1(𝔽_p/ℤ) = 0`. -/
example (p : ℕ) [Fact p.Prime] :
    Nonempty (RT1.HH ℤ (ZMod p) 2 ≅ ModuleCat.of ℤ (ZMod p)) ∧
      Limits.IsZero (RT1.HH ℤ (ZMod p) 1) := sorry

/-- Test `HochschildHomology.dual_numbers_nonvanishing` (non-example): for `A = k[x]/(x²)` with
`2` invertible, `HH_n(A/k) ≠ 0` for every `n ≥ 0`, so `HH` is not `Ω^*_{A/k}` for non-smooth
`A`. -/
example (k : Type) [CommRing k] [Nontrivial k] (h2 : IsUnit (2 : k)) (n : ℕ) :
    Nontrivial (RT1.HH k (Polynomial k ⧸ Ideal.span {(Polynomial.X : Polynomial k) ^ 2}) n) :=
  sorry

/-! ### RT.1/morita-invariance -/

/-- The generalised trace `tr : C(M_r(A)) → C(A)`,
`tr(m⁰⊗…⊗mⁿ) = Σ m⁰_{i₀i₁}⊗m¹_{i₁i₂}⊗…⊗mⁿ_{iₙi₀}`, a map of mixed complexes (it commutes with
`b` and `B`). -/
def RT1.matrixTrace (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A] (r : ℕ) :
    RT1.algMixed k (Matrix (Fin r) (Fin r) A) ⟶ RT1.algMixed k A := sorry

/-- The generalised trace on elementary tensors (in degree `0` it is `Matrix.trace`). -/
theorem RT1.matrixTrace_apply (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A]
    (r n : ℕ) (m : Fin (n + 1) → Matrix (Fin r) (Fin r) A) :
    ((RT1.matrixTrace k A r).f n).hom
        (RT1.normMixedClass k (Matrix (Fin r) (Fin r) A) n (PiTensorProduct.tprod k m)) =
      RT1.normMixedClass k A n (∑ i : Fin (n + 1) → Fin r,
        PiTensorProduct.tprod k (fun j => m j (i j) (i (j + 1)))) := sorry

/- The nonunital corner a ↦ E₁₁a is not a mixed-complex map: it fails compatibility
with unit-inserting degeneracies and Connes B. The inverse of matrixTrace belongs in the
derived category of mixed complexes, after the cyclic Morita enhancement is supplied. -/

/-- RT.1/morita-invariance: for `k`-flat `k`-algebras `A`, `B` that are Morita equivalent over
`k`, the Morita bimodules induce a quasi-isomorphism of mixed complexes `C(A/k) ≃ C(B/k)` (a
zigzag of quasi-isomorphisms), hence isomorphisms on `HH_*`, `HC_*`, `HC⁻_*` and `HP_*`; the
generalised trace `C(M_{r+1}(A)) → C(A)` is a quasi-isomorphism of mixed complexes with
a derived inverse after localizing mixed complexes. Naturality of the
isomorphisms and the description through a progenerator `P` with `B ≅ End_A(P)^op` are not
recorded here. -/
theorem moritaInvariance (k A B : Type) [CommRing k] [Ring A] [Algebra k A] [Ring B]
    [Algebra k B] [Module.Flat k A] [Module.Flat k B] (e : MoritaEquivalence k A B) :
    (∃ (P : MixedComplex k) (f : P ⟶ RT1.algMixed k A) (g : P ⟶ RT1.algMixed k B),
      MixedComplex.QuasiIso f ∧ MixedComplex.QuasiIso g) ∧
    (∀ n : ℕ, Nonempty (RT1.HH k A n ≅ RT1.HH k B n)) ∧
    (∀ n : ℕ, Nonempty (cyclicHomology k A n ≅ cyclicHomology k B n)) ∧
    (∀ n : ℤ, Nonempty (negativeCyclicHomology k A n ≅ negativeCyclicHomology k B n)) ∧
    (∀ n : ℤ, Nonempty (periodicCyclicHomology k A n ≅ periodicCyclicHomology k B n)) ∧
    (∀ r : ℕ, MixedComplex.QuasiIso (RT1.matrixTrace k A (r + 1))) := sorry

/-! ### RT.1/external-products -/

/-- The shuffle map `C(A) ⊗ C(A′) → C(A ⊗_k A′)`,
`(a₀⊗a)⊗(a′₀⊗a′) ↦ Σ_{(p,q)-shuffles σ} sgn(σ) (a₀a′₀)⊗σ·(a⊗a′)`, a chain map of `b`-complexes
(compatible with `B` up to the cyclic shuffle correction). -/
def HochschildHomology.shuffle (k : Type) [CommRing k] (A A' : Type) [Ring A] [Algebra k A]
    [Ring A'] [Algebra k A'] :
    RT1.bComplex ((RT1.algMixed k A).tensor (RT1.algMixed k A')) ⟶
      RT1.bComplex (RT1.algMixed k (A ⊗[k] A')) := sorry

/-- For `k`-flat `A`, `A′` the shuffle map is a quasi-isomorphism (Eilenberg–Zilber), and
`C(A) ⊗ C(A′)` and `C(A ⊗ A′)` are quasi-isomorphic as mixed complexes. -/
theorem HochschildHomology.shuffle_quasiIso (k : Type) [CommRing k] (A A' : Type) [Ring A]
    [Algebra k A] [Ring A'] [Algebra k A'] [Module.Flat k A] [Module.Flat k A'] :
    _root_.QuasiIso (HochschildHomology.shuffle k A A') := sorry

/-- The Künneth isomorphism `HH(A ⊗_k A′/k) ≃ HH(A/k) ⊗^L_k HH(A′/k)` in `D(k)` (`k`-flat `A`,
`A′`). -/
def HochschildHomology.kunneth (k : Type) [CommRing k] (A A' : Type) [Ring A] [Algebra k A]
    [Ring A'] [Algebra k A'] [Module.Flat k A] [Module.Flat k A'] :
    HochschildHomology k (A ⊗[k] A') ≅
      RT1.DMod.tensorL (HochschildHomology k A) (HochschildHomology k A') := sorry

/-- Connes' operator on Hochschild homology, `B : HH_n(A/k) → HH_{n+1}(A/k)`, induced by `B` on
the (derived) mixed complex. -/
def RT1.hhConnesB (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A] (n : ℕ) :
    RT1.HH k A n ⟶ RT1.HH k A (n + 1) := sorry

/-- The `A`-module structure on `HH_n(A/k)` for commutative `A` (through `HH_0(A/k) = A` and the
product). -/
instance RT1.hhModule (k : Type) [CommRing k] (A : Type) [CommRing A] [Algebra k A] (n : ℤ) :
    Module A ((HochschildHomology k A).homology n) := sorry

/-- The graded ring `HH_*(A/k) = ⊕_n HH_n(A/k)` of a commutative `k`-algebra `A`. -/
def RT1.HHStar (k : Type) [CommRing k] (A : Type) [CommRing A] [Algebra k A] : Type := sorry

/-- For commutative `A`, the shuffle product makes `HH_*(A/k)` a ring (graded-commutative, see
`RT1.HHStar.graded_comm`; it is not commutative in the ungraded sense, so the instance is a
`Ring`). -/
instance HochschildHomology.commRing (k : Type) [CommRing k] (A : Type) [CommRing A]
    [Algebra k A] : Ring (RT1.HHStar k A) := sorry

/-- `HH_*(A/k)` is a `k`-algebra. -/
instance RT1.HHStar.instAlgebra (k : Type) [CommRing k] (A : Type) [CommRing A] [Algebra k A] :
    Algebra k (RT1.HHStar k A) := sorry

/-- The degree-`n` part of `HH_*(A/k)`. -/
def RT1.HHStar.piece (k : Type) [CommRing k] (A : Type) [CommRing A] [Algebra k A] (n : ℕ) :
    Submodule k (RT1.HHStar k A) := sorry

/-- `HH_*(A/k)` is graded by the `HH_n(A/k)`. -/
instance RT1.HHStar.instGraded (k : Type) [CommRing k] (A : Type) [CommRing A] [Algebra k A] :
    GradedAlgebra (RT1.HHStar.piece k A) := sorry

/-- The degree-`n` part is `HH_n(A/k)`. -/
def RT1.HHStar.pieceEquiv (k : Type) [CommRing k] (A : Type) [CommRing A] [Algebra k A]
    (n : ℕ) : RT1.HHStar.piece k A n ≃ₗ[k] RT1.HH k A n := sorry

/-- The inclusion `HH_n(A/k) → HH_*(A/k)`. -/
def RT1.HHStar.incl (k : Type) [CommRing k] (A : Type) [CommRing A] [Algebra k A] (n : ℕ) :
    RT1.HH k A n →ₗ[k] RT1.HHStar k A :=
  (RT1.HHStar.piece k A n).subtype ∘ₗ (RT1.HHStar.pieceEquiv k A n).symm.toLinearMap

/-- `HH_*(A/k)` is graded-commutative, and `HH_0(A/k) = A` as a subring. -/
theorem RT1.HHStar.graded_comm (k : Type) [CommRing k] (A : Type) [CommRing A] [Algebra k A] :
    (∀ {p q : ℕ} {x y : RT1.HHStar k A}, x ∈ RT1.HHStar.piece k A p →
      y ∈ RT1.HHStar.piece k A q → y * x = ((-1 : ℤ) ^ (p * q)) • (x * y)) ∧
    ∃ ι : A →ₐ[k] RT1.HHStar k A, Function.Injective ι ∧
      LinearMap.range ι.toLinearMap = RT1.HHStar.piece k A 0 := sorry

/-- Connes' operator `B` on `HH_*(A/k)` (degree `+1`). -/
def RT1.HHStar.connesB (k : Type) [CommRing k] (A : Type) [CommRing A] [Algebra k A] :
    RT1.HHStar k A →ₗ[k] RT1.HHStar k A := sorry

/-- `RT1.HHStar.connesB` restricts to `RT1.hhConnesB` on each `HH_n`. -/
theorem RT1.HHStar.connesB_incl (k : Type) [CommRing k] (A : Type) [CommRing A] [Algebra k A]
    (n : ℕ) (x : RT1.HH k A n) :
    RT1.HHStar.connesB k A (RT1.HHStar.incl k A n x) =
      RT1.HHStar.incl k A (n + 1) ((RT1.hhConnesB k A n).hom x) := sorry

/-- For commutative `A`, `B` is a graded derivation of `HH_*(A/k)`:
`B(xy) = B(x)y + (−1)^p x B(y)` for `x` of degree `p`. -/
theorem HochschildHomology.B_derivation (k : Type) [CommRing k] (A : Type) [CommRing A]
    [Algebra k A] {p : ℕ} (x y : RT1.HHStar k A) (hx : x ∈ RT1.HHStar.piece k A p) :
    RT1.HHStar.connesB k A (x * y) =
      RT1.HHStar.connesB k A x * y + ((-1 : ℤ) ^ p) • (x * RT1.HHStar.connesB k A y) := sorry

/-- The external product `HC⁻_p(A) ⊗ HC⁻_q(A′) → HC⁻_{p+q}(A ⊗ A′)` and the `HC⁻`-module
structure `HC⁻_p(A) ⊗ HC_q(A′) → HC_{p+q}(A ⊗ A′)` (both induced by the shuffle map). -/
def negativeCyclicHomology.externalProduct (k : Type) [CommRing k] (A A' : Type) [Ring A]
    [Algebra k A] [Ring A'] [Algebra k A'] :
    (∀ p q : ℤ, negativeCyclicHomology k A p →ₗ[k] negativeCyclicHomology k A' q →ₗ[k]
      negativeCyclicHomology k (A ⊗[k] A') (p + q)) ×
    (∀ (p : ℤ) (q r : ℕ), (r : ℤ) = p + q → negativeCyclicHomology k A p →ₗ[k]
      cyclicHomology k A' q →ₗ[k] cyclicHomology k (A ⊗[k] A') r) := sorry

/-- Test `HochschildHomology.shuffle_unit` (degenerate): with `A′ = k` the shuffle map is the
identity of `C(A)` (under `C(A) ⊗ C(k) ≅ C(A)` and `A ⊗_k k ≅ A`). -/
example (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A] :
    ∃ e : (RT1.algMixed k A).tensor (RT1.algMixed k k) ≅ RT1.algMixed k A,
      HochschildHomology.shuffle k A k ≫
        RT1.bComplexMap ((MixedComplex.ofCyclic k).map
          (CyclicBar.map (Algebra.TensorProduct.rid k k A).toAlgHom)) =
      RT1.bComplexMap e.hom := sorry

/-- Test `HochschildHomology.noncommutative_nonexample` (non-example): for `A = M_2(k)` the
multiplication `A ⊗ A → A` is not an algebra map, so the shuffle product does not induce a ring
structure on `HH_*(A)` in this way. -/
example (k : Type) [CommRing k] [Nontrivial k] :
    ¬ ∃ m : Matrix (Fin 2) (Fin 2) k ⊗[k] Matrix (Fin 2) (Fin 2) k →ₐ[k] Matrix (Fin 2) (Fin 2) k,
      ∀ a b, m (a ⊗ₜ b) = a * b := sorry

/-! ### RT.1/base-change and RT.1/etale-base-change -/

/-- RT.1/base-change: for a map of commutative rings `k → K` and a `k`-algebra `A`:
(1) if `A` or `K` is `k`-flat (so `A ⊗^L_k K = K ⊗_k A`), `HH((K ⊗_k A)/K) ≃ HH(A/k) ⊗^L_k K`
in `D(K)`; (2) `C_•((K ⊗_k A)/K) = C_•(A/k) ⊗_k K` as cyclic `K`-modules; (3) if `K` is
`k`-flat, `HH_n((K ⊗_k A)/K) ≅ HH_n(A/k) ⊗_k K`; (4) under the same Tor vanishing, cyclic
complexes commute with base change in `D(K)` (`HC` commutes with base change); (5) `HC⁻` and
`HP` commute with base change when `K` is a perfect `k`-module, recorded for `K` finite
projective over `k` (on homology). The general derived statement for `A ⊗^L_k K` (an animated
ring), naturality and the compatibility with the circle action are not recorded here. -/
theorem baseChange (k K A : Type) [CommRing k] [CommRing K] [Algebra k K] [Ring A]
    [Algebra k A] :
    (Module.Flat k A ∨ Module.Flat k K →
      Nonempty (HochschildHomology K (K ⊗[k] A) ≅
        (RT1.DMod.extendScalars (algebraMap k K)).obj (HochschildHomology k A))) ∧
    Nonempty (CyclicBar K (K ⊗[k] A) ≅
      (CyclicObject.map (ModuleCat.extendScalars (algebraMap k K))).obj (CyclicBar k A)) ∧
    (Module.Flat k K → ∀ n : ℕ, Nonempty (RT1.HH K (K ⊗[k] A) n ≅
      (ModuleCat.extendScalars (algebraMap k K)).obj (RT1.HH k A n))) ∧
    (Module.Flat k A ∨ Module.Flat k K →
      Nonempty ((RT1.DMod.ofComplexZ K).obj (RT1.derivedMixed K (K ⊗[k] A)).cyclicComplex ≅
        (RT1.DMod.extendScalars (algebraMap k K)).obj
          ((RT1.DMod.ofComplexZ k).obj (RT1.derivedMixed k A).cyclicComplex))) ∧
    (Module.Flat k A → Module.Finite k K → Module.Projective k K → ∀ n : ℤ,
      Nonempty (negativeCyclicHomology K (K ⊗[k] A) n ≅
        (ModuleCat.extendScalars (algebraMap k K)).obj (negativeCyclicHomology k A n)) ∧
      Nonempty (periodicCyclicHomology K (K ⊗[k] A) n ≅
        (ModuleCat.extendScalars (algebraMap k K)).obj (periodicCyclicHomology k A n))) :=
  sorry

/-- RT.1/etale-base-change (Weibel–Geller): for an étale map `A → B` of commutative
`k`-algebras, `B ⊗_A HH_n(A/k) ≅ HH_n(B/k)` as `B`-modules for every `n` (equivalently
`HH(B/k) ≃ B ⊗^L_A HH(A/k)` in `D(B)`, `B` being `A`-flat), and `HH(B/A) ≃ B`. Multiplicativity
of the isomorphism and the sheaf consequences are not recorded here. -/
theorem etaleBaseChange (k A B : Type) [CommRing k] [CommRing A] [CommRing B] [Algebra k A]
    [Algebra A B] [Algebra k B] [IsScalarTower k A B] [Algebra.Etale A B] :
    (∀ n : ℤ, Nonempty ((B ⊗[A] (HochschildHomology k A).homology n) ≃ₗ[B]
      (HochschildHomology k B).homology n)) ∧
    Nonempty (HochschildHomology A B ≅ RT1.DMod.ofModule (ModuleCat.of A B)) := sorry

/-! ### RT.1/hkr-map -/

/-- The Hochschild cycles `Z_n = ker(b : C_n(A/k) → C_{n−1}(A/k))`. -/
def RT1.hochschildCycles (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A] (n : ℕ) :
    Submodule k (⨂[k]^(n + 1) A) :=
  LinearMap.ker ((RT1.hochschildComplex k A).d n (n - 1)).hom

/-- The class in `HH_n(A/k)` of a Hochschild cycle, for `A` flat over `k` (through
`HochschildHomology.ofFlat`). -/
def RT1.hochschildClass (k : Type) [CommRing k] (A : Type) [Ring A] [Algebra k A]
    [Module.Flat k A] (n : ℕ) : RT1.hochschildCycles k A n →ₗ[k] RT1.HH k A n := sorry

/-- The antisymmetrisation map `ε_n : Ω^n_{A/k} → HH_n(A/k)`, `Ω^n_{A/k} = ⋀^n_A Ω¹_{A/k}`,
natural in `k → A`; on `a₀ da₁∧…∧daₙ` it is the class of
`Σ_{σ ∈ S_n} sgn(σ) a₀⊗a_{σ⁻¹(1)}⊗…⊗a_{σ⁻¹(n)}` (derived version for non-flat `A`). -/
def HochschildHomology.hkrMap (k : Type) [CommRing k] (A : Type) [CommRing A] [Algebra k A]
    (n : ℕ) : ModuleCat.of k ↥(⋀[A]^n Ω[A⁄k]) ⟶ RT1.HH k A n := sorry

/-- The antisymmetrisation formula for `ε_n(a₀ da₁∧…∧daₙ)` (for `k`-flat `A`). -/
theorem HochschildHomology.hkrMap_apply (k : Type) [CommRing k] (A : Type) [CommRing A]
    [Algebra k A] [Module.Flat k A] (n : ℕ) (a : Fin (n + 1) → A)
    (z : RT1.hochschildCycles k A n)
    (hz : (z : ⨂[k]^(n + 1) A) = ∑ σ : Equiv.Perm (Fin n),
      ((Equiv.Perm.sign σ : ℤˣ) : ℤ) •
        PiTensorProduct.tprod k (Matrix.vecCons (a 0) (fun i => a (σ.symm i).succ))) :
    (HochschildHomology.hkrMap k A n).hom
        (a 0 • exteriorPower.ιMulti A n (fun i => KaehlerDifferential.D k A (a i.succ))) =
      RT1.hochschildClass k A n z := sorry

/-- The projection `π_n : HH_n(A/k) → Ω^n_{A/k}`, induced by
`a₀⊗…⊗aₙ ↦ a₀ da₁∧…∧daₙ` (`RT1.hkrProjChain`). -/
def HochschildHomology.hkrProj (k : Type) [CommRing k] (A : Type) [CommRing A] [Algebra k A]
    (n : ℕ) : RT1.HH k A n ⟶ ModuleCat.of k ↥(⋀[A]^n Ω[A⁄k]) := sorry

/-- The chain-level map `π_n : C_n(A/k) → Ω^n_{A/k}`. -/
def RT1.hkrProjChain (k : Type) [CommRing k] (A : Type) [CommRing A] [Algebra k A] (n : ℕ) :
    (⨂[k]^(n + 1) A) →ₗ[k] ↥(⋀[A]^n Ω[A⁄k]) := sorry

/-- `π_n(a₀⊗…⊗aₙ) = a₀ da₁∧…∧daₙ`; `π` is a chain map to `(Ω^*, 0)` (`π ∘ b = 0`), and it
induces `HochschildHomology.hkrProj` (for `k`-flat `A`). -/
theorem RT1.hkrProjChain_spec (k : Type) [CommRing k] (A : Type) [CommRing A] [Algebra k A] :
    (∀ (n : ℕ) (a : Fin (n + 1) → A), RT1.hkrProjChain k A n (PiTensorProduct.tprod k a) =
      a 0 • exteriorPower.ιMulti A n (fun i => KaehlerDifferential.D k A (a i.succ))) ∧
    (∀ (n : ℕ) (x : ⨂[k]^(n + 2) A), RT1.hkrProjChain k A n
      ((RT1.altFaceSum (CyclicObject.toSimplicial.obj (CyclicBar k A)) n).hom x) = 0) ∧
    (∀ [Module.Flat k A] (n : ℕ) (z : RT1.hochschildCycles k A n),
      (HochschildHomology.hkrProj k A n).hom (RT1.hochschildClass k A n z) =
        RT1.hkrProjChain k A n z) := sorry

/-- `π_n ∘ ε_n = n! · id`. -/
theorem HochschildHomology.hkrProj_comp_hkrMap (k : Type) [CommRing k] (A : Type) [CommRing A]
    [Algebra k A] (n : ℕ) :
    HochschildHomology.hkrMap k A n ≫ HochschildHomology.hkrProj k A n =
      n.factorial • 𝟙 (ModuleCat.of k ↥(⋀[A]^n Ω[A⁄k])) := sorry

/-- `ε` is a map of graded-commutative algebras: `ε(ω ∧ η) = ε(ω) · ε(η)` in `HH_*(A/k)`. -/
theorem HochschildHomology.hkrMap_mul (k : Type) [CommRing k] (A : Type) [CommRing A]
    [Algebra k A] (p q : ℕ) (ω : ↥(⋀[A]^p Ω[A⁄k])) (η : ↥(⋀[A]^q Ω[A⁄k]))
    (θ : ↥(⋀[A]^(p + q) Ω[A⁄k])) (h : (θ : ExteriorAlgebra A Ω[A⁄k]) = ω * η) :
    RT1.HHStar.incl k A (p + q) ((HochschildHomology.hkrMap k A (p + q)).hom θ) =
      RT1.HHStar.incl k A p ((HochschildHomology.hkrMap k A p).hom ω) *
        RT1.HHStar.incl k A q ((HochschildHomology.hkrMap k A q).hom η) := sorry

/-- In degree one `ε_1 : Ω¹_{A/k} = ⋀¹ Ω[A⁄k] → HH_1(A/k)` is an isomorphism with inverse `π_1`
(all commutative `A`). -/
theorem HochschildHomology.hkrMap_one (k : Type) [CommRing k] (A : Type) [CommRing A]
    [Algebra k A] :
    HochschildHomology.hkrMap k A 1 ≫ HochschildHomology.hkrProj k A 1 = 𝟙 _ ∧
      HochschildHomology.hkrProj k A 1 ≫ HochschildHomology.hkrMap k A 1 = 𝟙 _ := sorry

/-- Test `HochschildHomology.hkrMap_zero` (degenerate): `ε_0 : A → HH_0(A/k) = A` is the
identity (`a ↦` class of `a ∈ C_0`). -/
example (k : Type) [CommRing k] (A : Type) [CommRing A] [Algebra k A] [Module.Flat k A] (a : A)
    (z : RT1.hochschildCycles k A 0)
    (hz : (z : ⨂[k]^(0 + 1) A) = PiTensorProduct.tprod k (fun _ => a)) :
    (HochschildHomology.hkrMap k A 0).hom ((exteriorPower.zeroEquiv A Ω[A⁄k]).symm a) =
      RT1.hochschildClass k A 0 z := sorry

/-- Test `HochschildHomology.hkrMap_polynomial_two` (computation): for `A = k[x,y]`,
`ε_2(dx∧dy)` is the class of `1⊗x⊗y − 1⊗y⊗x`, and it generates `HH_2` (freely over `A`). -/
example (k : Type) [CommRing k] :
    (∀ z : RT1.hochschildCycles k (MvPolynomial (Fin 2) k) 2,
      (z : ⨂[k]^(2 + 1) (MvPolynomial (Fin 2) k)) =
        PiTensorProduct.tprod k ![1, MvPolynomial.X 0, MvPolynomial.X 1] -
          PiTensorProduct.tprod k ![1, MvPolynomial.X 1, MvPolynomial.X 0] →
      (HochschildHomology.hkrMap k (MvPolynomial (Fin 2) k) 2).hom
          (exteriorPower.ιMulti (MvPolynomial (Fin 2) k) 2
            ![KaehlerDifferential.D k _ (MvPolynomial.X 0),
              KaehlerDifferential.D k _ (MvPolynomial.X 1)]) =
        RT1.hochschildClass k (MvPolynomial (Fin 2) k) 2 z) ∧
    Function.Bijective (fun a : MvPolynomial (Fin 2) k =>
      (HochschildHomology.hkrMap k (MvPolynomial (Fin 2) k) 2).hom
        (a • exteriorPower.ιMulti (MvPolynomial (Fin 2) k) 2
          ![KaehlerDifferential.D k _ (MvPolynomial.X 0),
            KaehlerDifferential.D k _ (MvPolynomial.X 1)])) := sorry

/-- Test `HochschildHomology.hkrMap_not_surjective_singular` (non-example): for
`A = k[x]/(x²)`, `ε_2` is not surjective: `Ω²_{A/k} = 0` while `HH_2(A/k) ≠ 0`. -/
example (k : Type) [CommRing k] [Nontrivial k] :
    Subsingleton ↥(⋀[Polynomial k ⧸ Ideal.span {(Polynomial.X : Polynomial k) ^ 2}]^2
      Ω[(Polynomial k ⧸ Ideal.span {(Polynomial.X : Polynomial k) ^ 2})⁄k]) ∧
    ¬ Function.Surjective (HochschildHomology.hkrMap k
      (Polynomial k ⧸ Ideal.span {(Polynomial.X : Polynomial k) ^ 2}) 2).hom := sorry

/-- Test `HochschildHomology.kunneth_polynomial` (computation): `HH_2(k[x,y]/k)` is free of rank
one over `k[x,y]` on `dx∧dy` (i.e. on `ε_2(dx∧dy)`). -/
example (k : Type) [CommRing k] :
    ∃ b : Module.Basis (Fin 1) (MvPolynomial (Fin 2) k) (RT1.HH k (MvPolynomial (Fin 2) k) 2),
      b 0 = (HochschildHomology.hkrMap k (MvPolynomial (Fin 2) k) 2).hom
        (exteriorPower.ιMulti (MvPolynomial (Fin 2) k) 2
          ![KaehlerDifferential.D k _ (MvPolynomial.X 0),
            KaehlerDifferential.D k _ (MvPolynomial.X 1)]) := sorry

/-- Test `HochschildHomology.commRing_compat_Kaehler` (compatibility): for commutative `A`,
`HH_1(A/k) ≅ Ω¹_{A/k}` as `A`-modules, via `a₀⊗a₁ ↦ a₀ da₁`. -/
example (k : Type) [CommRing k] (A : Type) [CommRing A] [Algebra k A] :
    ∃ e : RT1.HH k A 1 ≃ₗ[A] Ω[A⁄k], ∀ [Module.Flat k A] (z : RT1.hochschildCycles k A 1)
      (a : Fin 2 → A), (z : ⨂[k]^(1 + 1) A) = PiTensorProduct.tprod k a →
        e (RT1.hochschildClass k A 1 z) = a 0 • KaehlerDifferential.D k A (a 1) := sorry

/-- Test `CyclicBar.connesB_polynomial` (computation): for `A = k[x]`,
`B[x^m] = [1⊗x^m] = m[x^{m−1}⊗x]` in `HH_1(k[x]) = k[x]dx`, i.e. `m x^{m−1}dx`. -/
example (k : Type) [CommRing k] (m : ℕ) (z₀ : RT1.hochschildCycles k (Polynomial k) 0)
    (z₁ : RT1.hochschildCycles k (Polynomial k) 1)
    (h₀ : (z₀ : ⨂[k]^(0 + 1) (Polynomial k)) = PiTensorProduct.tprod k ![Polynomial.X ^ m])
    (h₁ : (z₁ : ⨂[k]^(1 + 1) (Polynomial k)) =
      PiTensorProduct.tprod k ![Polynomial.X ^ (m - 1), Polynomial.X]) :
    (RT1.hhConnesB k (Polynomial k) 0).hom (RT1.hochschildClass k (Polynomial k) 0 z₀) =
      (m : k) • RT1.hochschildClass k (Polynomial k) 1 z₁ ∧
    (HochschildHomology.hkrProj k (Polynomial k) 1).hom
        ((RT1.hhConnesB k (Polynomial k) 0).hom (RT1.hochschildClass k (Polynomial k) 0 z₀)) =
      exteriorPower.ιMulti (Polynomial k) 1 (fun _ =>
        ((m : Polynomial k) * Polynomial.X ^ (m - 1)) •
          KaehlerDifferential.D k (Polynomial k) Polynomial.X) := sorry

/-! ### RT.1/hkr-theorem -/

/-- RT.1/hkr-theorem (Hochschild–Kostant–Rosenberg): for `A` smooth over `k`, every
antisymmetrisation map `ε_n : Ω^n_{A/k} → HH_n(A/k)` is an isomorphism (multiplicativity is
`HochschildHomology.hkrMap_mul`, so `ε` is an isomorphism of graded-commutative algebras), and
`π_n` inverts it up to `n!` (`π_n ∘ ε_n = n!·id`), so `π_n/n!` is the inverse when `n!` is
invertible in `k`. -/
theorem hkrTheorem (k : Type) [CommRing k] (A : Type) [CommRing A] [Algebra k A]
    [Algebra.Smooth k A] :
    (∀ n : ℕ, IsIso (HochschildHomology.hkrMap k A n)) ∧
    ∀ n : ℕ, HochschildHomology.hkrMap k A n ≫ HochschildHomology.hkrProj k A n =
        n.factorial • 𝟙 _ ∧
      HochschildHomology.hkrProj k A n ≫ HochschildHomology.hkrMap k A n = n.factorial • 𝟙 _ :=
  sorry

/-! ### RT.1/b-equals-d -/

/-- The de Rham differential `d : Ω^n_{A/k} → Ω^{n+1}_{A/k}` of the algebraic de Rham complex
(imported from DerivedDeRhamCohomology DD.2). -/
def RT1.deRhamD (k : Type) [CommRing k] (A : Type) [CommRing A] [Algebra k A] (n : ℕ) :
    ↥(⋀[A]^n Ω[A⁄k]) →ₗ[k] ↥(⋀[A]^(n + 1) Ω[A⁄k]) := sorry

/-- `d(a₀ da₁∧…∧daₙ) = da₀∧da₁∧…∧daₙ` and `d ∘ d = 0`. -/
theorem RT1.deRhamD_spec (k : Type) [CommRing k] (A : Type) [CommRing A] [Algebra k A] :
    (∀ (n : ℕ) (a : Fin (n + 1) → A),
      RT1.deRhamD k A n (a 0 • exteriorPower.ιMulti A n
          (fun i => KaehlerDifferential.D k A (a i.succ))) =
        exteriorPower.ιMulti A (n + 1) (fun i => KaehlerDifferential.D k A (a i))) ∧
    ∀ n : ℕ, (RT1.deRhamD k A (n + 1)).comp (RT1.deRhamD k A n) = 0 := sorry

/-- The mixed complex `(Ω^•_{A/k}, 0, d)`. -/
def RT1.deRhamMixed (k A : Type) [CommRing k] [CommRing A] [Algebra k A] :
    MixedComplex k := sorry

/-- Degree identification of the zero-extended de Rham mixed object. -/
def RT1.deRhamMixedDegreeIso (k A : Type) [CommRing k] [CommRing A] [Algebra k A] (n : ℕ) :
    (RT1.deRhamMixed k A).X (n : ℤ) ≅ ModuleCat.of k (⋀[A]^n Ω[A⁄k]) := sorry

/-- RT.1/b-equals-d (Loday–Quillen, Proposition 2.2): `B ∘ ε_n = ε_{n+1} ∘ d` on
`Ω^n_{A/k}`, and dually `π_{n+1} ∘ B = (n+1)·d ∘ π_n`; if `ℚ ⊆ k`, `μ_n = π_n/n!` is a map of
mixed complexes `(C(A/k), b, B) → (Ω^•_{A/k}, 0, d)`, which is a quasi-isomorphism for `A`
smooth over `k` (so `C(A/k)` is formal). -/
theorem bEqualsD (k : Type) [CommRing k] (A : Type) [CommRing A] [Algebra k A] :
    (∀ n : ℕ, HochschildHomology.hkrMap k A n ≫ RT1.hhConnesB k A n =
      ModuleCat.ofHom (RT1.deRhamD k A n) ≫ HochschildHomology.hkrMap k A (n + 1)) ∧
    (∀ n : ℕ, RT1.hhConnesB k A n ≫ HochschildHomology.hkrProj k A (n + 1) =
      (n + 1) • (HochschildHomology.hkrProj k A n ≫ ModuleCat.ofHom (RT1.deRhamD k A n))) ∧
    ∀ [Algebra ℚ k], ∃ μ : RT1.algMixed k A ⟶ RT1.deRhamMixed k A,
      (∀ (n : ℕ) (a : Fin (n + 1) → A),
        (RT1.deRhamMixedDegreeIso k A n).hom.hom
          ((μ.f n).hom (RT1.normMixedClass k A n (PiTensorProduct.tprod k a))) =
          algebraMap ℚ k ((n.factorial : ℚ)⁻¹) •
            (a 0 • exteriorPower.ιMulti A n (fun i => KaehlerDifferential.D k A (a i.succ)))) ∧
      (Algebra.Smooth k A → MixedComplex.QuasiIso μ) := sorry

/-! ### RT.1/hkr-cyclic-char0 -/

/-- Closed forms `Z^n Ω_{A/k} = ker d`. -/
def RT1.closedForms (k : Type) [CommRing k] (A : Type) [CommRing A] [Algebra k A] (n : ℕ) :
    Submodule k ↥(⋀[A]^n Ω[A⁄k]) :=
  LinearMap.ker (RT1.deRhamD k A n)

/-- Exact forms `dΩ^{n−1}_{A/k}` (zero for `n = 0`). -/
def RT1.exactForms (k : Type) [CommRing k] (A : Type) [CommRing A] [Algebra k A] :
    (n : ℕ) → Submodule k ↥(⋀[A]^n Ω[A⁄k])
  | 0 => ⊥
  | n + 1 => LinearMap.range (RT1.deRhamD k A n)

/-- Algebraic de Rham cohomology `H^n_dR(A/k) = Z^n / dΩ^{n−1}`, realised as the image of the
closed forms in `Ω^n_{A/k} / dΩ^{n−1}_{A/k}`. -/
def RT1.deRham (k : Type) [CommRing k] (A : Type) [CommRing A] [Algebra k A] (n : ℕ) :
    ModuleCat.{0} k :=
  ModuleCat.of k ↥(LinearMap.range
    ((RT1.exactForms k A n).mkQ ∘ₗ (RT1.closedForms k A n).subtype))

/-- `H^n_dR(A/k)` for `n ∈ ℤ` (zero in negative degrees). -/
def RT1.deRhamZ (k : Type) [CommRing k] (A : Type) [CommRing A] [Algebra k A] :
    ℤ → ModuleCat.{0} k
  | Int.ofNat n => RT1.deRham k A n
  | Int.negSucc _ => ModuleCat.of k PUnit

/-- `Z^n Ω_{A/k}` for `n ∈ ℤ` (zero in negative degrees). -/
def RT1.closedFormsZ (k : Type) [CommRing k] (A : Type) [CommRing A] [Algebra k A] :
    ℤ → ModuleCat.{0} k
  | Int.ofNat n => ModuleCat.of k (RT1.closedForms k A n)
  | Int.negSucc _ => ModuleCat.of k PUnit

/-- RT.1/hkr-cyclic-char0: for a commutative `ℚ`-algebra `k` and `A` smooth over `k`,
`HC_n(A/k) ≅ Ω^n/dΩ^{n−1} ⊕ H^{n−2}_dR ⊕ H^{n−4}_dR ⊕ …`,
`HC⁻_n(A/k) ≅ Z^nΩ × Π_{i ≥ 1} H^{n+2i}_dR` and `HP_n(A/k) ≅ Π_{i ∈ ℤ} H^{n+2i}_dR`. Naturality in
`A` and the identification of `S`, `I`, `B` with the evident projections, inclusions and `d`
are not recorded here. -/
theorem hkrCyclicChar0 (k : Type) [CommRing k] (A : Type) [CommRing A] [Algebra k A]
    [Algebra ℚ k] [Algebra.Smooth k A] :
    (∀ n : ℕ, Nonempty (cyclicHomology k A n ≅
      ModuleCat.of k ((↥(⋀[A]^n Ω[A⁄k]) ⧸ RT1.exactForms k A n) ×
        Π i : Fin (n / 2), RT1.deRham k A (n - 2 * ((i : ℕ) + 1))))) ∧
    (∀ n : ℤ, Nonempty (negativeCyclicHomology k A n ≅
      ModuleCat.of k (RT1.closedFormsZ k A n ×
        Π i : ℕ, RT1.deRhamZ k A (n + 2 * ((i : ℤ) + 1))))) ∧
    (∀ n : ℤ, Nonempty (periodicCyclicHomology k A n ≅
      ModuleCat.of k (Π i : ℤ, RT1.deRhamZ k A (n + 2 * i)))) := sorry

/-! ### RT.1/hkr-filtration -/

/-- The derived exterior power `∧^n L_{A/R}` of the cotangent complex, as an object of `D(R)`
(DerivedDeRhamCohomology DD.0). -/
def RT1.wedgeCotangent (R : Type) [CommRing R] (A : Type) [CommRing A] [Algebra R A] (n : ℕ) :
    RT1.DMod R := sorry

/-- RT.1/hkr-filtration: the complete descending HKR filtration has `Fil^0 = HH(A/R)`
and `gr^n = cofib(Fil^{n+1} → Fil^n) ≃ ∧^n L_{A/R}[n]`. The filtration is obtained from
`τ_{≥n}` on polynomial algebras. The connectivity assertion below witnesses completeness
in a left-complete derived category; a coherent inverse-limit clause, multiplicativity,
circle equivariance, and the bounded-p-torsion p-completely quasismooth version remain
omitted from this signature. -/
theorem hkrFiltration (R : Type) [CommRing R] (A : Type) [CommRing A] [Algebra R A] :
    ∃ (F : ℕ → RT1.DMod R) (ι : ∀ n, F (n + 1) ⟶ F n),
      Nonempty (F 0 ≅ HochschildHomology R A) ∧
      (∀ (n : ℕ) (m : ℤ), m < n → Limits.IsZero ((F n).homology m)) ∧
      (∀ n, Nonempty (RT1.DMod.cofib (ι n) ≅ (RT1.wedgeCotangent R A n).shift n)) ∧
      (Algebra.Smooth R A → ∀ n, Nonempty (RT1.DMod.cofib (ι n) ≅
        (RT1.DMod.ofModule (ModuleCat.of R ↥(⋀[A]^n Ω[A⁄R]))).shift n)) := sorry

/-! ### RT.1/hh-universal-property -/

/-- E_∞-`R`-algebras in `D(R)` with an action of the circle `T`. -/
def RT1.CAlgDT (R : Type) [CommRing R] : Type 1 := sorry

instance (R : Type) [CommRing R] : Category.{0} (RT1.CAlgDT R) := sorry

/-- Forgetting the circle action. -/
def RT1.CAlgDT.forget (R : Type) [CommRing R] : RT1.CAlgDT R ⥤ RT1.CAlgD R := sorry

/-- `HH(A/R)` as a `T`-equivariant E_∞-`R`-algebra. -/
def RT1.hhCAlgT (R : Type) [CommRing R] (A : Type) [CommRing A] [Algebra R A] : RT1.CAlgDT R :=
  sorry

/-- The tensor `X ⊗ T = colim_T X` of an E_∞-`R`-algebra with the space `T = S¹`. -/
def RT1.CAlgD.circleTensor {R : Type} [CommRing R] (X : RT1.CAlgD R) : RT1.CAlgD R := sorry

/-- The coproduct `X ⊗^L_R Y` of E_∞-`R`-algebras. -/
def RT1.CAlgD.tensor {R : Type} [CommRing R] (X Y : RT1.CAlgD R) : RT1.CAlgD R := sorry

/-- The multiplication `X ⊗^L_R X → X`. -/
def RT1.CAlgD.mult {R : Type} [CommRing R] (X : RT1.CAlgD R) : RT1.CAlgD.tensor X X ⟶ X := sorry

/-- The pushout `Y ⊗^L_X Z` of E_∞-`R`-algebras. -/
def RT1.CAlgD.relTensor {R : Type} [CommRing R] {X Y Z : RT1.CAlgD R} (f : X ⟶ Y) (g : X ⟶ Z) :
    RT1.CAlgD R := sorry

/-- RT.1/hh-universal-property: `HH(A/R)` with its circle action is the free `T`-equivariant
E_∞-`R`-algebra on `A`: its underlying object is `HH(A/R)`, it is `A ⊗ T` in `CAlg(D(R))`,
maps of `T`-equivariant E_∞-algebras `HH(A/R) → B` correspond (by restriction along the unit
`A → HH(A/R)`) to maps of E_∞-`R`-algebras `A → B`, and `HH(A/R) ≃ A ⊗^L_{A ⊗^L_R A} A`. -/
theorem hhUniversalProperty (R : Type) [CommRing R] (A : Type) [CommRing A] [Algebra R A] :
    Nonempty ((RT1.CAlgD.forget R).obj ((RT1.CAlgDT.forget R).obj (RT1.hhCAlgT R A)) ≅
      HochschildHomology R A) ∧
    Nonempty ((RT1.CAlgDT.forget R).obj (RT1.hhCAlgT R A) ≅
      RT1.CAlgD.circleTensor (RT1.CAlgD.ofCommAlg (k := R) A)) ∧
    (∃ η : RT1.CAlgD.ofCommAlg (k := R) A ⟶ (RT1.CAlgDT.forget R).obj (RT1.hhCAlgT R A),
      ∀ B : RT1.CAlgDT R, Function.Bijective
        (fun f : RT1.hhCAlgT R A ⟶ B => η ≫ (RT1.CAlgDT.forget R).map f)) ∧
    Nonempty ((RT1.CAlgDT.forget R).obj (RT1.hhCAlgT R A) ≅
      RT1.CAlgD.relTensor (RT1.CAlgD.mult (RT1.CAlgD.ofCommAlg (k := R) A))
        (RT1.CAlgD.mult (RT1.CAlgD.ofCommAlg (k := R) A))) := sorry

/-! ### RT.1/hh-of-fp -/

/-- RT.1/hh-of-fp: `HH_*(𝔽_p/ℤ) ≅ 𝔽_p⟨u⟩`, Mathlib's `DividedPowerAlgebra` of `𝔽_p` on a
class `u` of degree `2`: a ring isomorphism carrying `HH_{2n}` onto `𝔽_p·u^{[n]}` (with
`u^{[n]} = dp n 1`), with `HH_{odd} = 0`; and `L_{𝔽_p/ℤ} ≃ 𝔽_p[1]` (so the first HKR graded
piece is `L[1] ≃ 𝔽_p[2]`). The identification of the extension class of `Fil_1 HH(𝔽_p/ℤ)` with
`ℤ/p²` from NS18 Lemma IV.4.7 concerns THH homotopy fixed points, not this HKR quotient. -/
theorem hhOfFp (p : ℕ) [Fact p.Prime] :
    (∃ e : RT1.HHStar ℤ (ZMod p) ≃+* DividedPowerAlgebra (ZMod p) (ZMod p),
      (∀ (n : ℕ) (x : RT1.HHStar ℤ (ZMod p)), x ∈ RT1.HHStar.piece ℤ (ZMod p) (2 * n) ↔
        ∃ c : ZMod p, e x = c • DividedPowerAlgebra.dp (ZMod p) n (1 : ZMod p)) ∧
      ∀ (n : ℕ) (x : RT1.HHStar ℤ (ZMod p)), x ∈ RT1.HHStar.piece ℤ (ZMod p) (2 * n + 1) →
        x = 0) ∧
    Nonempty (RT1.wedgeCotangent ℤ (ZMod p) 1 ≅
      (RT1.DMod.ofModule (ModuleCat.of ℤ (ZMod p))).shift 1) := sorry


end RefinedTraceMethods

/-! ## RT.2 (non-genuine part): Tate constructions, THH, cyclotomic spectra and TC

Helpers private to this part carry the prefix `RT2.`. The ∞-categories of the roadmap are
prototyped by categories; "is an equivalence" is `IsIso`, "is zero" is `Limits.IsZero`, and a
fibre sequence `A → B → C` of spectra is recorded by an identification of `C` with the cofibre
of `A → B` (fibre and cofibre sequences agree in a stable category). -/

namespace RefinedTraceMethods

set_option warn.classDefReducibility false

open MonoidalCategory

/-! ### Helpers -/

/-- The canonical map `B → cofib f`. -/
def RT2.cofibπ {A B : Spectrum} (f : A ⟶ B) : B ⟶ Spectrum.cofib f := sorry

/-- `A → B → C` is a (co)fibre sequence: `g` identifies `C` with the cofibre of `f`. -/
def RT2.IsCofibreSequence {A B C : Spectrum} (f : A ⟶ B) (g : B ⟶ C) : Prop :=
  ∃ e : Spectrum.cofib f ≅ C, RT2.cofibπ f ≫ e.hom = g

/-- The `p`-completion map `X → X^∧_p`. -/
def RT2.pCompletionMap (p : ℕ) (X : Spectrum) : X ⟶ Spectrum.pCompletion p X := sorry

/-- A spectrum is `p`-complete if `X → X^∧_p` is an equivalence. -/
def RT2.IsPComplete (p : ℕ) (X : Spectrum) : Prop := IsIso (RT2.pCompletionMap p X)

/-- Presentable stable categories, read on a categorical prototype: all small limits and
colimits, a zero object, and a commutative square is a pullback iff it is a pushout. -/
class RT2.BicompleteStable (D : Type*) [Category D] : Prop where
  hasLimits : Limits.HasLimits D
  hasColimits : Limits.HasColimits D
  hasZero : Limits.HasZeroObject D
  pullback_iff_pushout : ∀ {A B X Y : D} (f : A ⟶ B) (g : A ⟶ X) (h : B ⟶ Y) (k : X ⟶ Y),
    IsPullback f g h k ↔ IsPushout f g h k

/-- An exact functor: it preserves finite limits and finite colimits. -/
def RT2.IsExact {D E : Type*} [Category D] [Category E] (F : D ⥤ E) : Prop :=
  Limits.PreservesFiniteLimits F ∧ Limits.PreservesFiniteColimits F

/-- The smash product makes `Sp` symmetric monoidal (StableHomotopyKTheory H.5). -/
instance RT2.instMonoidalSpectrum : MonoidalCategory Spectrum := sorry
instance RT2.instSymmetricSpectrum : SymmetricCategory Spectrum := sorry

/-- The pointwise symmetric monoidal structure on `Sp^{BG}`. -/
instance RT2.instMonoidalSWA (G : Type) [Group G] : MonoidalCategory (SpectraWithAction G) :=
  sorry
instance RT2.instSymmetricSWA (G : Type) [Group G] : SymmetricCategory (SpectraWithAction G) :=
  sorry

/-- The map of underlying spectra. -/
def RT2.underlyingMap {G : Type} [Group G] {X Y : SpectraWithAction G} (f : X ⟶ Y) :
    X.underlying ⟶ Y.underlying := sorry

/-- The forgetful functor `Sp^{BG} → Sp`. -/
def RT2.forget (G : Type) [Group G] : SpectraWithAction G ⥤ Spectrum where
  obj X := X.underlying
  map f := RT2.underlyingMap f
  map_id := sorry
  map_comp := sorry

/-- The trivial action on maps. -/
def RT2.trivialMap (G : Type) [Group G] {X Y : Spectrum} (f : X ⟶ Y) :
    SpectraWithAction.trivial G X ⟶ SpectraWithAction.trivial G Y := sorry

/-- The trivial-action functor `Sp → Sp^{BG}`. -/
def RT2.trivialFunctor (G : Type) [Group G] : Spectrum ⥤ SpectraWithAction G where
  obj X := SpectraWithAction.trivial G X
  map f := RT2.trivialMap G f
  map_id := sorry
  map_comp := sorry

/-- `−_{hG}` on maps. -/
def RT2.hOrbitsMap {G : Type} [Group G] {X Y : SpectraWithAction G} (f : X ⟶ Y) :
    homotopyOrbits X ⟶ homotopyOrbits Y := sorry

/-- `−_{hG}` as a functor. -/
def RT2.hOrbits (G : Type) [Group G] : SpectraWithAction G ⥤ Spectrum where
  obj X := homotopyOrbits X
  map f := RT2.hOrbitsMap f
  map_id := sorry
  map_comp := sorry

/-- `−^{hG}` on maps. -/
def RT2.hFixedMap {G : Type} [Group G] {X Y : SpectraWithAction G} (f : X ⟶ Y) :
    homotopyFixedPoints X ⟶ homotopyFixedPoints Y := sorry

/-- `−^{hG}` as a functor. -/
def RT2.hFixed (G : Type) [Group G] : SpectraWithAction G ⥤ Spectrum where
  obj X := homotopyFixedPoints X
  map f := RT2.hFixedMap f
  map_id := sorry
  map_comp := sorry

/-- `−^{tG}` on maps (`G` finite). -/
def RT2.tateMap {G : Type} [Group G] [Fintype G] {X Y : SpectraWithAction G} (f : X ⟶ Y) :
    tateConstruction X ⟶ tateConstruction Y := sorry

/-- `−^{tG}` as a functor (`G` finite). -/
def RT2.tate (G : Type) [Group G] [Fintype G] : SpectraWithAction G ⥤ Spectrum where
  obj X := tateConstruction X
  map f := RT2.tateMap f
  map_id := sorry
  map_comp := sorry

/-- `−^{tT}` on maps. -/
def RT2.circleTateMap {X Y : SpectraWithAction T} (f : X ⟶ Y) : circleTate X ⟶ circleTate Y :=
  sorry

/-- `−^{tT}` as a functor. -/
def RT2.circleTateFunctor : SpectraWithAction T ⥤ Spectrum where
  obj X := circleTate X
  map f := RT2.circleTateMap f
  map_id := sorry
  map_comp := sorry

/-- The residual `X ↦ X^{tC_p}` (with `T/C_p ≅ T`) on maps. -/
def RT2.residualTateMap (p : ℕ) {X Y : SpectraWithAction T} (f : X ⟶ Y) :
    residualTate p X ⟶ residualTate p Y := sorry

/-- The residual Tate construction `−^{tC_p} : Sp^{BT} → Sp^{B(T/C_p)} ≃ Sp^{BT}` as a functor. -/
def RT2.residualTateFunctor (p : ℕ) : SpectraWithAction T ⥤ SpectraWithAction T where
  obj X := residualTate p X
  map f := RT2.residualTateMap p f
  map_id := sorry
  map_comp := sorry

/-- Bounded above spectra. -/
def RT2.IsBoundedAbove (X : Spectrum) : Prop :=
  ∃ n : ℤ, ∀ k : ℤ, n < k → Subsingleton (X.homotopyGroup k)

/-- Residual homotopy orbits `Sp^{BG} → Sp^{B(G/H)}` for `H` normal. -/
def RT2.hOrbitsResidual {G : Type} [Group G] (H : Subgroup G) [H.Normal]
    (X : SpectraWithAction G) : SpectraWithAction (G ⧸ H) := sorry

/-- Residual homotopy fixed points `Sp^{BG} → Sp^{B(G/H)}` for `H` normal. -/
def RT2.hFixedResidual {G : Type} [Group G] (H : Subgroup G) [H.Normal]
    (X : SpectraWithAction G) : SpectraWithAction (G ⧸ H) := sorry

/-- The action of `g ∈ G` on `π_n` of the underlying spectrum. -/
def RT2.piAction {G : Type} [Group G] (X : SpectraWithAction G) (g : G) (n : ℤ) :
    X.underlying.homotopyGroup n →+ X.underlying.homotopyGroup n := sorry

/-- The Eilenberg–Mac Lane spectrum `HM` of a `ℤ[G]`-module, with its `G`-action. -/
def RT2.emRep {G : Type} [Group G] (M : Rep ℤ G) : SpectraWithAction G := sorry

/-- Functoriality of `M ↦ HM` in maps of representations. -/
def RT2.emRepMap {G : Type} [Group G] {M N : Rep ℤ G} (f : M ⟶ N) : RT2.emRep M ⟶ RT2.emRep N :=
  sorry

/-- The subgroup `C_n = μ_n ⊂ T` of `n`-th roots of unity, the kernel of `z ↦ z^n`. -/
def RT2.muT (n : ℕ) : Subgroup T := (powMonoidHom n : T →* T).ker

/-- `HZ` with trivial `G`-action. -/
def RT2.HZ (G : Type) [Group G] : SpectraWithAction G := SpectraWithAction.trivial G (Spectrum.em ℤ)

/-! ### RT.2/spectra-with-action -/

namespace SpectraWithAction

/-- Restriction `Sp^{BG} → Sp^{BH}` along a group homomorphism `H → G` (RT.2/spectra-with-action);
`res_id` and `res_comp` below. -/
def res {H G : Type} [Group H] [Group G] (φ : H →* G) : SpectraWithAction G ⥤ SpectraWithAction H :=
  sorry

/-- Restriction along the identity is the identity. -/
theorem res_id (G : Type) [Group G] : Nonempty (res (MonoidHom.id G) ≅ 𝟭 (SpectraWithAction G)) :=
  sorry

/-- Restriction is compatible with composition of homomorphisms. -/
theorem res_comp {K H G : Type} [Group K] [Group H] [Group G] (ψ : K →* H) (φ : H →* G) :
    Nonempty (res (φ.comp ψ) ≅ res φ ⋙ res ψ) := sorry

/-- `Sp^{BG}` is presentable stable (RT.2/spectra-with-action). The second clause of the packet
statement, that fibres and cofibres are computed underlying, is `forget_exact` below. -/
instance instStable (G : Type) [Group G] : RT2.BicompleteStable (SpectraWithAction G) := sorry

/-- Fibres and cofibres in `Sp^{BG}` are computed underlying: the forgetful functor is exact. -/
theorem forget_exact (G : Type) [Group G] : RT2.IsExact (RT2.forget G) := sorry

/-- The identification `T/C_n ≅ T`, `z ↦ z^n`, inducing `Sp^{B(T/C_n)} ≃ Sp^{BT}`
(RT.2/spectra-with-action). -/
def circleQuotient (n : ℕ) (hn : 0 < n) :
    (T ⧸ RT2.muT n ≃* T) × (SpectraWithAction (T ⧸ RT2.muT n) ≌ SpectraWithAction T) := sorry

/-- The equivalence of `circleQuotient` is restriction along the group isomorphism. -/
theorem circleQuotient_functor (n : ℕ) (hn : 0 < n) :
    Nonempty ((circleQuotient n hn).2.functor ≅ res (circleQuotient n hn).1.symm.toMonoidHom) :=
  sorry

end SpectraWithAction

/-- Spectra with an action of a discrete group (`BG` with `G` discrete): used only to state the
non-example `SpectraWithAction.discrete_vs_continuous` for the discrete circle `T^δ`. -/
def RT2.SpectraWithDiscreteAction (G : Type) [Group G] : Type := sorry

/-- The underlying spectrum of a spectrum with discrete action. -/
def RT2.SpectraWithDiscreteAction.underlying {G : Type} [Group G]
    (X : RT2.SpectraWithDiscreteAction G) : Spectrum := sorry

/-- The action of `g` on `π_n` for a discrete action. -/
def RT2.SpectraWithDiscreteAction.piAction {G : Type} [Group G]
    (X : RT2.SpectraWithDiscreteAction G) (g : G) (n : ℤ) :
    X.underlying.homotopyGroup n →+ X.underlying.homotopyGroup n := sorry

/-- Test `SpectraWithAction.trivialGroup` (degenerate): For G = 1, Sp^{BG} ≃ Sp. -/
example : Nonempty (SpectraWithAction Unit ≌ Spectrum) := sorry

/-- Test `SpectraWithAction.underlying_conservative` (characterisation): a map in Sp^{BG} is an
equivalence iff its underlying map of spectra is. -/
example (G : Type) [Group G] {X Y : SpectraWithAction G} (f : X ⟶ Y) :
    IsIso f ↔ IsIso ((RT2.forget G).map f) := sorry

/-- Test `SpectraWithAction.discrete_vs_continuous` (non-example): `T` acts trivially on `π_*` of
every object of `Sp^{BT}` (T connected), whereas the discrete circle `T^δ` can act nontrivially. -/
example :
    (∀ (X : SpectraWithAction T) (g : T) (n : ℤ), RT2.piAction X g n = AddMonoidHom.id _) ∧
    ∃ (Y : RT2.SpectraWithDiscreteAction T) (g : T) (n : ℤ), Y.piAction g n ≠ AddMonoidHom.id _ :=
  sorry

/-! ### RT.2/homotopy-orbits-fixed-points -/

/-- `−_{hG} ⊣ triv ⊣ −^{hG}` (RT.2/homotopy-orbits-fixed-points). -/
theorem homotopyOrbits.adj (G : Type) [Group G] :
    Nonempty (RT2.hOrbits G ⊣ RT2.trivialFunctor G) ∧
      Nonempty (RT2.trivialFunctor G ⊣ RT2.hFixed G) := sorry

/-- `−^{hG}` is lax symmetric monoidal (RT.2/homotopy-orbits-fixed-points). Consequently `X^{hG}`
is a commutative algebra (E_∞-ring) when `X` is a commutative algebra in `Sp^{BG}`. -/
def homotopyFixedPoints.laxMonoidal (G : Type) [Group G] : (RT2.hFixed G).LaxBraided := sorry

/-- Transitivity: `(X^{hH})^{h(G/H)} ≃ X^{hG}` and `(X_{hH})_{h(G/H)} ≃ X_{hG}` for `H` normal
(RT.2/homotopy-orbits-fixed-points). -/
theorem homotopyFixedPoints.trans {G : Type} [Group G] (H : Subgroup G) [H.Normal]
    (X : SpectraWithAction G) :
    Nonempty (homotopyFixedPoints (RT2.hFixedResidual H X) ≅ homotopyFixedPoints X) ∧
      Nonempty (homotopyOrbits (RT2.hOrbitsResidual H X) ≅ homotopyOrbits X) := sorry

/-- `π_{−i}(HM^{hG}) ≅ H^i(G, M)` (Mathlib `groupCohomology`) and `π_i(HM_{hG}) ≅ H_i(G, M)`
(Mathlib `groupHomology`) for a discrete group `G` (RT.2/homotopy-orbits-fixed-points). -/
theorem homotopyFixedPoints.em {G : Type} [Group G] (M : Rep ℤ G) (i : ℕ) :
    Nonempty ((homotopyFixedPoints (RT2.emRep M)).homotopyGroup (-(i : ℤ)) ≃+
        groupCohomology M i) ∧
      Nonempty ((homotopyOrbits (RT2.emRep M)).homotopyGroup (i : ℤ) ≃+ groupHomology M i) :=
  sorry

/-- Test `homotopyFixedPoints.trivialGroup` (degenerate): For G trivial, X^{hG} = X_{hG} = X. -/
example (X : SpectraWithAction Unit) :
    Nonempty (homotopyFixedPoints X ≅ X.underlying) ∧ Nonempty (homotopyOrbits X ≅ X.underlying) :=
  sorry

/-- Test `homotopyFixedPoints.HZ_circle` (computation): π_*((HZ)^{hT}) = ℤ[t] with |t| = −2
(stated degreewise: `ℤ` in degrees `−2k`, `k ≥ 0`, zero elsewhere). -/
example :
    (∀ k : ℕ, Nonempty ((homotopyFixedPoints (RT2.HZ T)).homotopyGroup (-(2 * k : ℤ)) ≃+ ℤ)) ∧
      ∀ n : ℤ, (∀ k : ℕ, n ≠ -(2 * k : ℤ)) →
        Subsingleton ((homotopyFixedPoints (RT2.HZ T)).homotopyGroup n) := sorry

/-- Test `homotopyFixedPoints.group_cohomology`: derived C₂ fixed points detect higher
integral group cohomology even for a trivial action. -/
example : Nonempty ((homotopyFixedPoints (RT2.HZ (C 2))).homotopyGroup (-2) ≃+ ZMod 2) ∧
    Subsingleton ((homotopyFixedPoints (RT2.HZ (C 2))).homotopyGroup (-1)) := sorry

/-! ### RT.2/norm-map-tate -/

/-- The norm `Nm_G : X_{hG} → X^{hG}`, natural in `X ∈ Sp^{BG}` (RT.2/norm-map-tate). -/
def normMap (G : Type) [Group G] [Fintype G] : RT2.hOrbits G ⟶ RT2.hFixed G := sorry

/-- The canonical map `can : X^{hG} → X^{tG}`, natural in `X`. -/
def RT2.tateCan (G : Type) [Group G] [Fintype G] : RT2.hFixed G ⟶ RT2.tate G := sorry

/-- The norm fibre sequence `X_{hG} → X^{hG} → X^{tG}`, i.e. `X^{tG} = cofib(Nm_G)`
(RT.2/norm-map-tate, the `tateConstruction` item; the construction itself is the prelude's
`tateConstruction`). -/
theorem tateConstruction.fibreSequence {G : Type} [Group G] [Fintype G] (X : SpectraWithAction G) :
    RT2.IsCofibreSequence ((normMap G).app X) ((RT2.tateCan G).app X) := sorry

/-- `−^{tG} : Sp^{BG} → Sp` is exact (RT.2/norm-map-tate). -/
theorem tateConstruction.exact (G : Type) [Group G] [Fintype G] : RT2.IsExact (RT2.tate G) := sorry

/-- Residual Tate construction `−^{tH} : Sp^{BG} → Sp^{B(G/H)}` for `H` normal and finite
(RT.2/norm-map-tate). -/
def tateConstruction.residual {G : Type} [Group G] (H : Subgroup G) [H.Normal] [Fintype H] :
    SpectraWithAction G ⥤ SpectraWithAction (G ⧸ H) := sorry

/-- The underlying spectrum of the residual Tate construction is the Tate construction of the
restriction to `H`. -/
theorem tateConstruction.residual_underlying {G : Type} [Group G] (H : Subgroup G) [H.Normal]
    [Fintype H] (X : SpectraWithAction G) :
    Nonempty (((tateConstruction.residual H).obj X).underlying ≅
      tateConstruction ((SpectraWithAction.res H.subtype).obj X)) := sorry

/-- The induced object `⊕_{g ∈ G} Y` with `G` permuting the summands. -/
def RT2.induced (G : Type) [Group G] [Fintype G] (Y : Spectrum) : SpectraWithAction G := sorry

/-- On induced objects `⊕_{g∈G} Y` the norm is an equivalence (RT.2/norm-map-tate). -/
theorem normMap.induced (G : Type) [Group G] [Fintype G] (Y : Spectrum) :
    IsIso ((normMap G).app (RT2.induced G Y)) := sorry

/-- Test `tateConstruction.trivialGroup` (degenerate): for G trivial, Nm is an equivalence (the
identity of `X`) and X^{tG} = 0. -/
example (X : SpectraWithAction Unit) :
    IsIso ((normMap Unit).app X) ∧ Limits.IsZero (tateConstruction X) := sorry

/-- Test `tateConstruction.HZ_Cp` (computation): π_*(HZ^{tC_p}) ≅ 𝔽_p[t^{±1}], |t| = −2
(stated degreewise: `𝔽_p` in even degrees, zero in odd degrees). -/
example (p : ℕ) [Fact p.Prime] [NeZero p] :
    ∀ k : ℤ, Nonempty ((tateConstruction (RT2.HZ (C p))).homotopyGroup (2 * k) ≃+ ZMod p) ∧
      Subsingleton ((tateConstruction (RT2.HZ (C p))).homotopyGroup (2 * k + 1)) := sorry

/-- Test `tateConstruction.compat_mathlib` (compatibility): for a finite group G and a ℤ[G]-module
M, π_{−i}(HM^{tG}) ≅ Ĥ^i(G, M), Mathlib's `tateCohomology`. -/
example {G : Type} [Group G] [Fintype G] (M : Rep ℤ G) (i : ℤ) :
    Nonempty ((tateConstruction (RT2.emRep M)).homotopyGroup (-i) ≃+ tateCohomology M i) := sorry

/-- Test `tateConstruction.nonexample_Q` (non-example): (HQ)^{tG} = 0 for every finite G although
(HQ)^{hG} = HQ ≠ 0. -/
example (G : Type) [Group G] [Fintype G] :
    Limits.IsZero (tateConstruction (SpectraWithAction.trivial G (Spectrum.em ℚ))) ∧
      Nonempty (homotopyFixedPoints (SpectraWithAction.trivial G (Spectrum.em ℚ)) ≅
        Spectrum.em ℚ) ∧ ¬ Limits.IsZero (Spectrum.em ℚ) := sorry

/-! ### RT.2/tate-of-eilenberg-maclane -/

/-- RT.2/tate-of-eilenberg-maclane: for a finite group `G` and a `ℤ[G]`-module `M`,
`π_i(HM^{tG}) ≅ Ĥ^{−i}(G, M)` (Mathlib `tateCohomology`) naturally in `M`; for `G = C_n` Tate
cohomology is 2-periodic and `π_*(HZ^{tC_n}) ≅ ℤ/n[t^{±1}]`, `|t| = −2` (degreewise). -/
theorem tateOfEilenbergMaclane :
    (∀ (G : Type) [Group G] [Fintype G],
      ∃ e : ∀ (M : Rep ℤ G) (i : ℤ),
          (tateConstruction (RT2.emRep M)).homotopyGroup i ≃+ tateCohomology M (-i),
        ∀ {M N : Rep ℤ G} (f : M ⟶ N) (i : ℤ),
          (e N i).toAddMonoidHom.comp
              (Spectrum.homotopyGroupMap ((RT2.tate G).map (RT2.emRepMap f)) i) =
            ((tateCohomologyFunctor (-i)).map f).hom.toAddMonoidHom.comp (e M i).toAddMonoidHom) ∧
    ∀ (n : ℕ) [NeZero n],
      (∀ (M : Rep ℤ (C n)) (i : ℤ), Nonempty (tateCohomology M i ≃+ tateCohomology M (i + 2))) ∧
      ∀ k : ℤ, Nonempty ((tateConstruction (RT2.HZ (C n))).homotopyGroup (2 * k) ≃+ ZMod n) ∧
        Subsingleton ((tateConstruction (RT2.HZ (C n))).homotopyGroup (2 * k + 1)) := sorry

/-! ### RT.2/tate-vanishing-induced -/

/-- The stable subcategory `Sp^{BG}_{ind}` generated by induced objects: the smallest class
containing the induced objects and the zero objects, closed under isomorphism and under
pullbacks and pushouts (hence under fibres, cofibres and shifts). -/
inductive RT2.InInducedSubcat (G : Type) [Group G] [Fintype G] : SpectraWithAction G → Prop
  | induced (Y : Spectrum) : RT2.InInducedSubcat G (RT2.induced G Y)
  | zero {Z : SpectraWithAction G} : Limits.IsZero Z → RT2.InInducedSubcat G Z
  | pushout {A B X Y : SpectraWithAction G} {f : A ⟶ B} {g : A ⟶ X} {h : B ⟶ Y} {k : X ⟶ Y} :
      IsPushout f g h k → RT2.InInducedSubcat G A → RT2.InInducedSubcat G B →
        RT2.InInducedSubcat G X → RT2.InInducedSubcat G Y
  | pullback {A B X Y : SpectraWithAction G} {f : A ⟶ B} {g : A ⟶ X} {h : B ⟶ Y} {k : X ⟶ Y} :
      IsPullback f g h k → RT2.InInducedSubcat G B → RT2.InInducedSubcat G X →
        RT2.InInducedSubcat G Y → RT2.InInducedSubcat G A

/-- The endomorphism spectrum of `R` (with trivial `C_p`-action) in the Verdier quotient
`Fun(BC_p, Perf(R)) / Perf(R[C_p])` (Land–Mathew–Meier–Tamme, Remark 3.9). -/
def RT2.endInTateQuotient (R : E1Ring) (p : ℕ) : Spectrum := sorry

/-- RT.2/tate-vanishing-induced: (i) `−^{tG}` vanishes on `Sp^{BG}_{ind}`; (ii) `Sp^{BG}_{ind}` is a
`⊗`-ideal; (iii) `can : −^{hG} → −^{tG}` is the universal exact functor under `−^{hG}` killing
`Sp^{BG}_{ind}` (so `−^{tG}` factors through the Verdier quotient); and for a ring spectrum `R`
the endomorphisms of `R` in `Fun(BC_p, Perf(R))/Perf(R[C_p])` are `R^{tC_p}`. -/
theorem tateVanishingInduced :
    (∀ (G : Type) [Group G] [Fintype G],
      (∀ X, RT2.InInducedSubcat G X → Limits.IsZero (tateConstruction X)) ∧
      (∀ X Y, RT2.InInducedSubcat G X → RT2.InInducedSubcat G (X ⊗ Y)) ∧
      ∀ (F : SpectraWithAction G ⥤ Spectrum), RT2.IsExact F →
        (∀ X, RT2.InInducedSubcat G X → Limits.IsZero (F.obj X)) →
        ∀ α : RT2.hFixed G ⟶ F, ∃! β : RT2.tate G ⟶ F, RT2.tateCan G ≫ β = α) ∧
    ∀ (R : E1Ring) (p : ℕ) [Fact p.Prime] [NeZero p],
      Nonempty (RT2.endInTateQuotient R p ≅
        tateConstruction (SpectraWithAction.trivial (C p) R.toSpectrum)) := sorry

/-! ### RT.2/tate-multiplicativity -/

/-- RT.2/tate-multiplicativity: for finite `G` there is a unique lax symmetric monoidal structure
on `−^{tG}` making `can : −^{hG} → −^{tG}` lax symmetric monoidal (contractibility of the space of
such pairs, read as unique existence); the residual `−^{tN} : Sp^{BH} → Sp^{B(H/N)}` for finite
normal `N` is lax symmetric monoidal, in particular `−^{tC_p} : Sp^{BT} → Sp^{BT}` is. -/
theorem tateMultiplicativity :
    (∀ (G : Type) [Group G] [Fintype G],
      ∃! L : (RT2.tate G).LaxBraided,
        (letI := L.toLaxMonoidal
         letI := (homotopyFixedPoints.laxMonoidal G).toLaxMonoidal
         NatTrans.IsMonoidal (RT2.tateCan G))) ∧
    (∀ (H : Type) [Group H] (N : Subgroup H) [N.Normal] [Fintype N],
      Nonempty (tateConstruction.residual N).LaxBraided) ∧
    ∀ (p : ℕ), p.Prime → Nonempty (RT2.residualTateFunctor p).LaxBraided := sorry

/-! ### RT.2/tate-p-local-properties -/

/-- The Postnikov tower `(τ_{≤n} Y)_n` of `Y ∈ Sp^{BG}` as a cone with vertex `Y`. -/
def RT2.postnikovTower {G : Type} [Group G] (Y : SpectraWithAction G) :
    ℕᵒᵖ ⥤ SpectraWithAction G := sorry
def RT2.postnikovCone {G : Type} [Group G] (Y : SpectraWithAction G) :
    Limits.Cone (RT2.postnikovTower Y) := sorry
theorem RT2.postnikovCone_pt {G : Type} [Group G] (Y : SpectraWithAction G) :
    (RT2.postnikovCone Y).pt = Y := sorry

/-- The Whitehead tower `(τ_{≥−n} Y)_n` of `Y ∈ Sp^{BG}` as a cocone with vertex `Y`. -/
def RT2.whiteheadTower {G : Type} [Group G] (Y : SpectraWithAction G) :
    ℕ ⥤ SpectraWithAction G := sorry
def RT2.whiteheadCocone {G : Type} [Group G] (Y : SpectraWithAction G) :
    Limits.Cocone (RT2.whiteheadTower Y) := sorry
theorem RT2.whiteheadCocone_pt {G : Type} [Group G] (Y : SpectraWithAction G) :
    (RT2.whiteheadCocone Y).pt = Y := sorry

/-- The underlying spectrum of `τ_{≤n} Y` is `n`-truncated and that of `τ_{≥−n} Y` is
`(−n)`-connective. -/
theorem RT2.towers_spec {G : Type} [Group G] (Y : SpectraWithAction G) (n : ℕ) :
    (∀ k : ℤ, (n : ℤ) < k → Subsingleton (((RT2.postnikovTower Y).obj (Opposite.op n)).underlying.homotopyGroup k)) ∧
      ∀ k : ℤ, k < -(n : ℤ) → Subsingleton (((RT2.whiteheadTower Y).obj n).underlying.homotopyGroup k) :=
  sorry

/-- The `p`-completion of a spectrum with `G`-action. -/
def RT2.pCompletionAction {G : Type} [Group G] (p : ℕ) (X : SpectraWithAction G) :
    SpectraWithAction G := sorry

theorem RT2.pCompletionAction_underlying {G : Type} [Group G] (p : ℕ) (X : SpectraWithAction G) :
    Nonempty ((RT2.pCompletionAction p X).underlying ≅ Spectrum.pCompletion p X.underlying) := sorry

/-- RT.2/tate-p-local-properties: (i) `−^{hG}`, `−_{hG}`, `−^{tG}` turn the Postnikov tower into a
limit and the Whitehead tower into a colimit; (ii) if `p` acts invertibly on `π_*Y`,
`Y ∈ Sp^{BC_p}`, then `Y^{tC_p} ≃ 0`; (iii) for bounded below `X ∈ Sp^{BC_p}`, `X^{tC_p}` is
`p`-complete and `X^{tC_p} ≃ (X^∧_p)^{tC_p}`. -/
theorem tatePLocalProperties :
    (∀ (G : Type) [Group G] [Fintype G] (Y : SpectraWithAction G),
      Nonempty (Limits.IsLimit ((RT2.hFixed G).mapCone (RT2.postnikovCone Y))) ∧
      Nonempty (Limits.IsLimit ((RT2.hOrbits G).mapCone (RT2.postnikovCone Y))) ∧
      Nonempty (Limits.IsLimit ((RT2.tate G).mapCone (RT2.postnikovCone Y))) ∧
      Nonempty (Limits.IsColimit ((RT2.hFixed G).mapCocone (RT2.whiteheadCocone Y))) ∧
      Nonempty (Limits.IsColimit ((RT2.hOrbits G).mapCocone (RT2.whiteheadCocone Y))) ∧
      Nonempty (Limits.IsColimit ((RT2.tate G).mapCocone (RT2.whiteheadCocone Y)))) ∧
    ∀ (p : ℕ) [Fact p.Prime] [NeZero p],
      (∀ Y : SpectraWithAction (C p),
        (∀ n : ℤ, Function.Bijective (fun x : Y.underlying.homotopyGroup n => p • x)) →
          Limits.IsZero (tateConstruction Y)) ∧
      ∀ X : SpectraWithAction (C p), X.underlying.IsBoundedBelow →
        RT2.IsPComplete p (tateConstruction X) ∧
          Nonempty (tateConstruction X ≅ tateConstruction (RT2.pCompletionAction p X)) := sorry

/-! ### RT.2/tate-orbit-lemma and RT.2/tate-fixpoint-lemma -/

/-- RT.2/tate-orbit-lemma: for bounded below `X ∈ Sp^{BC_{p²}}`, `(X_{hC_p})^{t(C_{p²}/C_p)} ≃ 0`.
Here `G` is cyclic of order `p²` and `H ⊆ G` its subgroup of order `p`. -/
theorem tateOrbitLemma (p : ℕ) [Fact p.Prime] {G : Type} [Group G] [Fintype G] (hG : IsCyclic G)
    (hcard : Fintype.card G = p ^ 2) (H : Subgroup G) [H.Normal] (hH : Nat.card H = p)
    [Fintype (G ⧸ H)] (X : SpectraWithAction G) (hX : X.underlying.IsBoundedBelow) :
    Limits.IsZero (tateConstruction (RT2.hOrbitsResidual H X)) := sorry

/-- RT.2/tate-fixpoint-lemma: for bounded above `X ∈ Sp^{BC_{p²}}`,
`(X^{hC_p})^{t(C_{p²}/C_p)} ≃ 0`. -/
theorem tateFixpointLemma (p : ℕ) [Fact p.Prime] {G : Type} [Group G] [Fintype G]
    (hG : IsCyclic G) (hcard : Fintype.card G = p ^ 2) (H : Subgroup G) [H.Normal]
    (hH : Nat.card H = p) [Fintype (G ⧸ H)] (X : SpectraWithAction G)
    (hX : RT2.IsBoundedAbove X.underlying) :
    Limits.IsZero (tateConstruction (RT2.hFixedResidual H X)) := sorry

/-! ### RT.2/parametrised-tate -/

/-- Kan complexes (∞-groupoids). -/
def RT2.KanComplex : Type 1 := sorry

/-- The points (vertices) of a Kan complex. -/
def RT2.KanComplex.pt (S : RT2.KanComplex) : Type := sorry

/-- The classifying Kan complex `BG`. -/
def RT2.KanComplex.classifying (G : Type) [Group G] : RT2.KanComplex := sorry

/-- Parametrised spectra `Sp^S = Fun(S, Sp)`. -/
def RT2.ParamSpectra (S : RT2.KanComplex) : Type := sorry
instance RT2.instCategoryParamSpectra (S : RT2.KanComplex) : Category.{0} (RT2.ParamSpectra S) :=
  sorry
instance RT2.instMonoidalParamSpectra (S : RT2.KanComplex) :
    MonoidalCategory (RT2.ParamSpectra S) := sorry
instance RT2.instSymmetricParamSpectra (S : RT2.KanComplex) :
    SymmetricCategory (RT2.ParamSpectra S) := sorry

namespace RT2.ParamSpectra

variable (S : RT2.KanComplex)

/-- `p_* = lim_S` for `p : S → ∗`. -/
def pushforward : RT2.ParamSpectra S ⥤ Spectrum := sorry
/-- `p_! = colim_S`. -/
def pushforwardShriek : RT2.ParamSpectra S ⥤ Spectrum := sorry
/-- Evaluation at a point `s`. -/
def eval (s : S.pt) : RT2.ParamSpectra S ⥤ Spectrum := sorry
/-- `s_! : Sp → Sp^S`, left adjoint to evaluation at `s`. -/
def pointPush (s : S.pt) : Spectrum ⥤ RT2.ParamSpectra S := sorry
/-- The parametrised Tate construction `p^T_*`. -/
def tate : RT2.ParamSpectra S ⥤ Spectrum := sorry
/-- The canonical transformation `p_* → p^T_*`. -/
def can : pushforward S ⟶ tate S := sorry
/-- The dualizing spectrum `D_S ∈ Sp^S`. -/
def dualizing : RT2.ParamSpectra S := sorry

end RT2.ParamSpectra

/-- RT.2/parametrised-tate, for a Kan complex `S`: (i) the `s_!S` generate (evaluations are jointly
conservative; their compactness is left out); (ii)–(iii) `p_* → p^T_*` kills the `s_!S` and is
initial among exact functors under `p_*` killing them; (iv) `fib(p_* → p^T_*) ≃ p_!(D_S ⊗ −)`
(the description of the fibres of `D_S` as `lim_t Σ^∞_+ Map(s, t)` and the assembly statement (v)
are left out); (vi) if `p^T_*` kills all `s_!X`, it is lax symmetric monoidal; for `S = BG`, `G`
finite, this recovers `−^{tG}` with `D_{BG}` the sphere with trivial action. -/
theorem parametrisedTate :
    (∀ S : RT2.KanComplex,
      (∀ {X Y : RT2.ParamSpectra S} (f : X ⟶ Y),
        IsIso f ↔ ∀ s : S.pt, IsIso ((RT2.ParamSpectra.eval S s).map f)) ∧
      (∀ s : S.pt, Limits.IsZero ((RT2.ParamSpectra.tate S).obj
        ((RT2.ParamSpectra.pointPush S s).obj Spectrum.sphere))) ∧
      (∀ (F : RT2.ParamSpectra S ⥤ Spectrum), RT2.IsExact F →
        (∀ s : S.pt, Limits.IsZero (F.obj ((RT2.ParamSpectra.pointPush S s).obj Spectrum.sphere))) →
        ∀ θ : RT2.ParamSpectra.pushforward S ⟶ F,
          ∃! β : RT2.ParamSpectra.tate S ⟶ F, RT2.ParamSpectra.can S ≫ β = θ) ∧
      (∀ X : RT2.ParamSpectra S, Nonempty (Spectrum.fib ((RT2.ParamSpectra.can S).app X) ≅
        (RT2.ParamSpectra.pushforwardShriek S).obj (RT2.ParamSpectra.dualizing S ⊗ X))) ∧
      ((∀ (s : S.pt) (Y : Spectrum), Limits.IsZero ((RT2.ParamSpectra.tate S).obj
          ((RT2.ParamSpectra.pointPush S s).obj Y))) →
        Nonempty (RT2.ParamSpectra.tate S).LaxBraided)) ∧
    ∀ (G : Type) [Group G] [Fintype G],
      ∃ e : RT2.ParamSpectra (RT2.KanComplex.classifying G) ≌ SpectraWithAction G,
        Nonempty (e.functor ⋙ RT2.tate G ≅ RT2.ParamSpectra.tate _) ∧
        Nonempty (e.functor.obj (RT2.ParamSpectra.dualizing _) ≅
          SpectraWithAction.trivial G Spectrum.sphere) := sorry

/-! ### More helpers: limits in `Sp`, suspension, restriction to `C_n` -/

/-- `Sp` is presentable stable; in particular it has all small limits and colimits. -/
instance RT2.instStableSpectrum : RT2.BicompleteStable Spectrum := sorry
instance RT2.instHasLimitsSpectrum : Limits.HasLimits Spectrum := sorry
instance RT2.instHasColimitsSpectrum : Limits.HasColimits Spectrum := sorry

/-- The suspension functor `Σ = Σ¹`. -/
def RT2.suspension : Spectrum ⥤ Spectrum where
  obj X := X.shift 1
  map f := sorry
  map_id := sorry
  map_comp := sorry

/-- Restriction `Sp^{BT} → Sp^{BC_n}` as a functor. -/
def RT2.restrictCyclicFunctor (n : ℕ) : SpectraWithAction T ⥤ SpectraWithAction (C n) where
  obj X := restrictToCyclic n X
  map f := sorry
  map_id := sorry
  map_comp := sorry

/-- The canonical `−^{hT} → −^{hC_n}`. -/
def RT2.hFixedToCyclic (n : ℕ) : RT2.hFixed T ⟶ RT2.restrictCyclicFunctor n ⋙ RT2.hFixed (C n) :=
  sorry

/-- The profinite completion `X^∧ = ∏_p X^∧_p`. -/
def RT2.profiniteCompletion (X : Spectrum) : Spectrum :=
  ∏ᶜ fun p : Nat.Primes => Spectrum.pCompletion p X

/-! ### RT.2/circle-tate -/

/-- The circle norm `Nm_T : Σ(X_{hT}) → X^{hT}`, natural in `X ∈ Sp^{BT}` (RT.2/circle-tate). -/
def circleNorm : RT2.hOrbits T ⋙ RT2.suspension ⟶ RT2.hFixed T := sorry

/-- The canonical map `can : X^{hT} → X^{tT}`. -/
def RT2.circleTateCan : RT2.hFixed T ⟶ RT2.circleTateFunctor := sorry

/-- The fibre sequence `Σ X_{hT} → X^{hT} → X^{tT}`, `X^{tT} = cofib(Nm_T)` (RT.2/circle-tate,
the `circleTate` item; the construction is the prelude's `circleTate`). -/
theorem circleTate.fibreSequence (X : SpectraWithAction T) :
    RT2.IsCofibreSequence (circleNorm.app X) (RT2.circleTateCan.app X) := sorry

/-- `Nm_T` exhibits `Σ(−_{hT})` as the universal colimit-preserving functor over `−^{hT}`. -/
theorem circleNorm.universal (F : SpectraWithAction T ⥤ Spectrum) [Limits.PreservesColimits F]
    (α : F ⟶ RT2.hFixed T) : ∃! β : F ⟶ RT2.hOrbits T ⋙ RT2.suspension, β ≫ circleNorm = α :=
  sorry

/-- `−^{tT}` is lax symmetric monoidal (RT.2/circle-tate). -/
def circleTate.laxMonoidal : RT2.circleTateFunctor.LaxBraided := sorry

/-- `can : −^{hT} → −^{tT}` is lax symmetric monoidal for `circleTate.laxMonoidal`, and this
determines the structure uniquely. -/
theorem circleTate.laxMonoidal_unique :
    ∀ L : RT2.circleTateFunctor.LaxBraided,
      (letI := L.toLaxMonoidal
       letI := (homotopyFixedPoints.laxMonoidal T).toLaxMonoidal
       NatTrans.IsMonoidal RT2.circleTateCan) ↔ L = circleTate.laxMonoidal := sorry

/-- The map `−^{tT} → −^{tC_n}` (RT.2/circle-tate). -/
def circleTate.toCyclic (n : ℕ) [NeZero n] :
    RT2.circleTateFunctor ⟶ RT2.restrictCyclicFunctor n ⋙ RT2.tate (C n) := sorry

/-- `circleTate.toCyclic` is compatible with `−^{hT} → −^{hC_n}` (it is the unique lax symmetric
monoidal such transformation; the monoidal clause is left out here). -/
theorem circleTate.toCyclic_comm (n : ℕ) [NeZero n] :
    RT2.circleTateCan ≫ circleTate.toCyclic n =
      RT2.hFixedToCyclic n ≫ Functor.whiskerLeft (RT2.restrictCyclicFunctor n) (RT2.tateCan (C n)) :=
  sorry

/-- `π_*(HZ^{tT}) = ℤ[t^{±1}]`, `|t| = −2` (RT.2/circle-tate; degreewise). -/
theorem circleTate.HZ :
    ∀ k : ℤ, Nonempty ((circleTate (RT2.HZ T)).homotopyGroup (2 * k) ≃+ ℤ) ∧
      Subsingleton ((circleTate (RT2.HZ T)).homotopyGroup (2 * k + 1)) := sorry

/-- Test `circleTate.zero` (degenerate): 0^{tT} = 0. -/
example (X : SpectraWithAction T) (hX : Limits.IsZero X) : Limits.IsZero (circleTate X) := sorry

/-- Test `circleTate.HZ_mod_n` (computation): π_0(HZ^{tT})/n ≅ π_0(HZ^{tC_n}) = ℤ/n. -/
example (n : ℕ) [NeZero n] :
    Nonempty ((circleTate (RT2.HZ T)).homotopyGroup 0 ⧸
        (nsmulAddMonoidHom (α := (circleTate (RT2.HZ T)).homotopyGroup 0) n).range ≃+
      (tateConstruction (RT2.HZ (C n))).homotopyGroup 0) ∧
    Nonempty ((tateConstruction (RT2.HZ (C n))).homotopyGroup 0 ≃+ ZMod n) := sorry

/-- Test `circleTate.not_shift_free` (non-example): without the suspension there is no norm: the
homotopy of `HZ_{hT}` sits in degrees `≥ 0` and that of `HZ^{hT}` in degrees `≤ 0`, and no map
`HZ_{hT} → HZ^{hT}` has cofibre `HZ^{tT}` (compatibly with `can`). -/
example :
    (∀ n : ℤ, n < 0 → Subsingleton ((homotopyOrbits (RT2.HZ T)).homotopyGroup n)) ∧
    (∀ n : ℤ, 0 < n → Subsingleton ((homotopyFixedPoints (RT2.HZ T)).homotopyGroup n)) ∧
    ∀ η : homotopyOrbits (RT2.HZ T) ⟶ homotopyFixedPoints (RT2.HZ T),
      ¬ RT2.IsCofibreSequence η (RT2.circleTateCan.app (RT2.HZ T)) := sorry

/-! ### RT.2/tate-cpn-via-cp -/

/-- The canonical map `X^{tG} → (X^{tH})^{h(G/H)}`. -/
def RT2.tateToIterated {G : Type} [Group G] [Fintype G] (H : Subgroup G) [H.Normal] [Fintype H]
    (X : SpectraWithAction G) :
    tateConstruction X ⟶ homotopyFixedPoints ((tateConstruction.residual H).obj X) := sorry

/-- The canonical map `X^{tT} → (X^{tC_p})^{hT}`. -/
def RT2.circleTateToResidual (p : ℕ) (X : SpectraWithAction T) :
    circleTate X ⟶ homotopyFixedPoints (residualTate p X) := sorry

/-- RT.2/tate-cpn-via-cp: (i) for bounded below `X ∈ Sp^{BC_{p^n}}` (`G` cyclic of order `p^n`,
`H` its subgroup of order `p`), `X^{tC_{p^n}} → (X^{tC_p})^{hC_{p^{n−1}}}` is an equivalence;
(ii) for bounded below `X ∈ Sp^{BT}`, `(X^{tC_p})^{hT}` is `p`-complete and
`X^{tT} → (X^{tC_p})^{hT}` is a `p`-completion, so `∏_p (X^{tC_p})^{hT}` is the profinite
completion of `X^{tT}`. -/
theorem tateCpnViaCp (p : ℕ) [Fact p.Prime] :
    (∀ (n : ℕ) {G : Type} [Group G] [Fintype G], IsCyclic G → Fintype.card G = p ^ n →
      ∀ (H : Subgroup G) [H.Normal] [Fintype H], Nat.card H = p →
      ∀ X : SpectraWithAction G, X.underlying.IsBoundedBelow →
        IsIso (RT2.tateToIterated H X)) ∧
    ∀ X : SpectraWithAction T, X.underlying.IsBoundedBelow →
      RT2.IsPComplete p (homotopyFixedPoints (residualTate p X)) ∧
      (∃ e : Spectrum.pCompletion p (circleTate X) ≅ homotopyFixedPoints (residualTate p X),
        RT2.pCompletionMap p (circleTate X) ≫ e.hom = RT2.circleTateToResidual p X) ∧
      Nonempty ((∏ᶜ fun q : Nat.Primes => homotopyFixedPoints (residualTate q X)) ≅
        RT2.profiniteCompletion (circleTate X)) := sorry

/-! ### RT.2/tate-diagonal -/

/-- `X ↦ X^{⊗p}` with `C_p` permuting the factors. -/
def RT2.smashPower (p : ℕ) : Spectrum ⥤ SpectraWithAction (C p) := sorry

/-- `T_p : X ↦ (X^{⊗p})^{tC_p}`. -/
def RT2.tateSquare (p : ℕ) [NeZero p] : Spectrum ⥤ Spectrum := RT2.smashPower p ⋙ RT2.tate (C p)

/-- The canonical `S → (S^{⊗p})^{hC_p}` (unit of the lax structure of `−^{hC_p}`). -/
def RT2.sphereToHFixedSmashPower (p : ℕ) :
    Spectrum.sphere ⟶ homotopyFixedPoints ((RT2.smashPower p).obj Spectrum.sphere) := sorry

/-- The Tate diagonal `Δ_p : X → (X^{⊗p})^{tC_p}`, natural in `X ∈ Sp` (RT.2/tate-diagonal). -/
def tateDiagonal (p : ℕ) [Fact p.Prime] [NeZero p] : 𝟭 Spectrum ⟶ RT2.tateSquare p := sorry

/-- `X ↦ (X^{⊗p})^{tC_p}` is exact (RT.2/tate-diagonal). -/
theorem tateDiagonal.exact_target (p : ℕ) [Fact p.Prime] [NeZero p] :
    RT2.IsExact (RT2.tateSquare p) := sorry

/-- Uniqueness of the Tate diagonal (RT.2/tate-diagonal): natural transformations `id → F` into an
exact `F : Sp → Sp` correspond to maps `S → F(S)`, and `Δ_p` is the one whose value on `S` is
`S → (S^{⊗p})^{hC_p} → (S^{⊗p})^{tC_p}`. (Its characterisation as the unique lax symmetric
monoidal transformation is left out: the lax structure on `T_p` is not recorded here.) -/
theorem tateDiagonal.unique (p : ℕ) [Fact p.Prime] [NeZero p] :
    (∀ F : Spectrum ⥤ Spectrum, RT2.IsExact F →
      Function.Bijective (fun η : 𝟭 Spectrum ⟶ F => η.app Spectrum.sphere)) ∧
    (tateDiagonal p).app Spectrum.sphere =
      RT2.sphereToHFixedSmashPower p ≫
        (RT2.tateCan (C p)).app ((RT2.smashPower p).obj Spectrum.sphere) := sorry

/-- On `S`, `Δ_p` is the canonical map `S → S^{tC_p}`, a `p`-completion (RT.2/tate-diagonal). -/
theorem tateDiagonal.sphere (p : ℕ) [Fact p.Prime] [NeZero p] :
    ∃ e : Spectrum.pCompletion p Spectrum.sphere ≅ (RT2.tateSquare p).obj Spectrum.sphere,
      RT2.pCompletionMap p Spectrum.sphere ≫ e.hom = (tateDiagonal p).app Spectrum.sphere := sorry

/-- Test `tateDiagonal.zero` (degenerate): Δ_p on the zero spectrum is the zero map `0 → 0`. -/
example (p : ℕ) [Fact p.Prime] [NeZero p] :
    Limits.IsZero ((RT2.tateSquare p).obj Spectrum.zero) := sorry

/-- Test `tateDiagonal.HFp` (computation): π_0 of Δ_p : HF_p → (HF_p^{⊗p})^{tC_p} is the
Frobenius of 𝔽_p (the identity), in particular nonzero. -/
example (p : ℕ) [Fact p.Prime] [NeZero p] :
    ∃ (e : (Spectrum.em (ZMod p)).homotopyGroup 0 ≃+ ZMod p)
      (e' : ((RT2.tateSquare p).obj (Spectrum.em (ZMod p))).homotopyGroup 0 ≃+ ZMod p),
      ∀ x : ZMod p,
        e' (Spectrum.homotopyGroupMap ((tateDiagonal p).app (Spectrum.em (ZMod p))) 0 (e.symm x)) =
          frobenius (ZMod p) p x := sorry

/-- The derived category `D(ℤ)`, symmetric monoidal under `⊗^L`. -/
def RT2.DZ : Type := sorry
instance RT2.instCategoryDZ : Category.{0} RT2.DZ := sorry

/-- `M ↦ (M^{⊗p})^{tC_p}` on `D(ℤ)`. -/
def RT2.DZ.tateSquare (p : ℕ) : RT2.DZ ⥤ RT2.DZ := sorry

/-- The Eilenberg–Mac Lane functor `H : D(ℤ) → Sp`. -/
def RT2.DZ.toSpectrum : RT2.DZ ⥤ Spectrum := sorry

/-- The comparison `(HM^{⊗p})^{tC_p} → H((M^{⊗p})^{tC_p})` from the lax monoidal structure of
`H`. -/
def RT2.DZ.laxTate (p : ℕ) [NeZero p] (M : RT2.DZ) :
    (RT2.tateSquare p).obj (RT2.DZ.toSpectrum.obj M) ⟶
      RT2.DZ.toSpectrum.obj ((RT2.DZ.tateSquare p).obj M) := sorry

/-- Test `tateDiagonal.no_DZ` (non-example): there is no natural transformation
M → (M^{⊗p})^{tC_p} of functors D(ℤ) → D(ℤ) lifting the diagonal (NS18 Theorem III.1.10). -/
example (p : ℕ) [Fact p.Prime] [NeZero p] :
    IsEmpty {η : 𝟭 RT2.DZ ⟶ RT2.DZ.tateSquare p //
      ∀ M : RT2.DZ, (tateDiagonal p).app (RT2.DZ.toSpectrum.obj M) ≫ RT2.DZ.laxTate p M =
        RT2.DZ.toSpectrum.map (η.app M)} := sorry

/-! ### RT.2/cyclic-realisation -/

/-- Connes' cyclic category `Λ`. -/
def RT2.CyclicCategory : Type := sorry
instance RT2.instCategoryCyclicCategory : Category.{0} RT2.CyclicCategory := sorry

/-- The object `[0]` of `Λ`. -/
def RT2.CyclicCategory.zero : RT2.CyclicCategory := sorry

/-- The inclusion `Δ → Λ`. -/
def RT2.simplexToCyclic : SimplexCategory ⥤ RT2.CyclicCategory := sorry

/-- The paracyclic category `Λ_∞`. -/
def RT2.ParacyclicCategory : Type := sorry
instance RT2.instCategoryParacyclicCategory : Category.{0} RT2.ParacyclicCategory := sorry

/-- The inclusion `Δ → Λ_∞`. -/
def RT2.simplexToParacyclic : SimplexCategory ⥤ RT2.ParacyclicCategory := sorry

/-- Cyclic objects `Fun(Λ^op, D)`. -/
abbrev RT2.CyclicObject (D : Type) [Category.{0} D] := RT2.CyclicCategoryᵒᵖ ⥤ D

/-- Objects of `D` with `T`-action, `Fun(BT, D)`. -/
def RT2.FunBT (D : Type) [Category.{0} D] : Type := sorry
instance RT2.instCategoryFunBT (D : Type) [Category.{0} D] : Category.{0} (RT2.FunBT D) := sorry

/-- The underlying object. -/
def RT2.FunBT.underlying (D : Type) [Category.{0} D] : RT2.FunBT D ⥤ D := sorry

/-- The trivial `T`-action. -/
def RT2.FunBT.trivial (D : Type) [Category.{0} D] : D ⥤ RT2.FunBT D := sorry

/-- Postcomposition `Fun(BT, D) → Fun(BT, E)` with a functor `D → E`. -/
def RT2.FunBT.postcomp {D E : Type} [Category.{0} D] [Category.{0} E] (F : D ⥤ E) :
    RT2.FunBT D ⥤ RT2.FunBT E := sorry

/-- `Fun(BT, Sp) = Sp^{BT}`. -/
def RT2.funBTSpectrum : RT2.FunBT Spectrum ≌ SpectraWithAction T := sorry

/-- The realisation `|X| ∈ Fun(BT, D)` of a cyclic object `X ∈ Fun(Λ^op, D)`
(RT.2/cyclic-realisation). -/
def CyclicObject.realize {D : Type} [Category.{0} D] [Limits.HasColimitsOfShape SimplexCategoryᵒᵖ D]
    (X : RT2.CyclicObject D) : RT2.FunBT D := sorry

/-- Realisation as a functor on cyclic objects. -/
def CyclicObject.realizeFunctor (D : Type) [Category.{0} D]
    [Limits.HasColimitsOfShape SimplexCategoryᵒᵖ D] : RT2.CyclicObject D ⥤ RT2.FunBT D where
  obj X := CyclicObject.realize X
  map f := sorry
  map_id := sorry
  map_comp := sorry

/-- The underlying object of `|X|` is the colimit of the simplicial object `X|_{Δ^op}`
(RT.2/cyclic-realisation). -/
theorem CyclicObject.realize_underlying {D : Type} [Category.{0} D]
    [Limits.HasColimitsOfShape SimplexCategoryᵒᵖ D] (X : RT2.CyclicObject D) :
    Nonempty ((RT2.FunBT.underlying D).obj (CyclicObject.realize X) ≅
      Limits.colimit (RT2.simplexToCyclic.op ⋙ X)) := sorry

/-- Naturality of `|−|` in colimit-preserving functors `D → E` (RT.2/cyclic-realisation; naturality
in maps of cyclic objects is `CyclicObject.realizeFunctor`). -/
theorem CyclicObject.realize_map {D E : Type} [Category.{0} D] [Category.{0} E]
    [Limits.HasColimitsOfShape SimplexCategoryᵒᵖ D] [Limits.HasColimitsOfShape SimplexCategoryᵒᵖ E]
    (F : D ⥤ E) [Limits.PreservesColimitsOfShape SimplexCategoryᵒᵖ F] (X : RT2.CyclicObject D) :
    Nonempty (CyclicObject.realize (X ⋙ F) ≅ (RT2.FunBT.postcomp F).obj (CyclicObject.realize X)) :=
  sorry

/-- `Δ^op → Λ_∞^op` is cofinal (NS18 Theorem B.3; RT.2/cyclic-realisation). -/
theorem ParacyclicCategory.cofinal : RT2.simplexToParacyclic.op.Final := sorry

/-- The geometric realisation of a cyclic set, a space with `T`-action. -/
def RT2.cyclicSetRealization (X : RT2.CyclicCategoryᵒᵖ ⥤ Type) : Type := sorry
instance RT2.instTopCyclicSetRealization (X : RT2.CyclicCategoryᵒᵖ ⥤ Type) :
    TopologicalSpace (RT2.cyclicSetRealization X) := sorry
instance RT2.instMulActionCyclicSetRealization (X : RT2.CyclicCategoryᵒᵖ ⥤ Type) :
    MulAction T (RT2.cyclicSetRealization X) := sorry

/-- Test `CyclicObject.realize_const` (degenerate): the realisation of a constant cyclic object `c`
is `c` with trivial `T`-action. -/
example {D : Type} [Category.{0} D] [Limits.HasColimitsOfShape SimplexCategoryᵒᵖ D] (c : D) :
    Nonempty (CyclicObject.realize ((Functor.const RT2.CyclicCategoryᵒᵖ).obj c) ≅
      (RT2.FunBT.trivial D).obj c) := sorry

/-- Test `CyclicObject.realize_circle` (computation): the representable cyclic set `Λ(−, [0])` has
`n + 1` simplices in degree `n` (the simplicial circle) and realises to `T` with its translation
action. -/
example :
    (∀ n : ℕ, Nat.card ((yoneda.obj RT2.CyclicCategory.zero).obj
      (Opposite.op (RT2.simplexToCyclic.obj (SimplexCategory.mk n)))) = n + 1) ∧
    ∃ e : RT2.cyclicSetRealization (yoneda.obj RT2.CyclicCategory.zero) ≃ₜ T,
      ∀ (z : T) (x : RT2.cyclicSetRealization (yoneda.obj RT2.CyclicCategory.zero)),
        e (z • x) = z * e x := sorry

/-- Test `CyclicObject.realize_not_simplicial` (non-example): the simplicial structure does not
determine the circle action: two cyclic spectra with isomorphic underlying simplicial objects can
have non-isomorphic realisations in `Fun(BT, Sp)`. -/
example :
    ∃ (X Y : RT2.CyclicObject Spectrum),
      Nonempty (RT2.simplexToCyclic.op ⋙ X ≅ RT2.simplexToCyclic.op ⋙ Y) ∧
        IsEmpty (CyclicObject.realize X ≅ CyclicObject.realize Y) := sorry

/-! ### RT.2/edgewise-subdivision -/

/-- The category `Λ_r` (objects with a levelwise `C_r`-action). -/
def RT2.CyclicCategoryR (r : ℕ) : Type := sorry
instance RT2.instCategoryCyclicCategoryR (r : ℕ) : Category.{0} (RT2.CyclicCategoryR r) := sorry

/-- The inclusion `Δ → Λ_r`. -/
def RT2.simplexToCyclicR (r : ℕ) : SimplexCategory ⥤ RT2.CyclicCategoryR r := sorry

/-- The `r`-fold edgewise subdivision `sd_r X`, a `Λ_r`-object. -/
def RT2.edgewise {D : Type} [Category.{0} D] (r : ℕ) (X : RT2.CyclicObject D) :
    (RT2.CyclicCategoryR r)ᵒᵖ ⥤ D := sorry

/-- The realisation of a `Λ_r`-object, with its action of `T` (through `T ≅ T/C_r`). -/
def RT2.realizeR {D : Type} [Category.{0} D] [Limits.HasColimitsOfShape SimplexCategoryᵒᵖ D]
    (r : ℕ) (Y : (RT2.CyclicCategoryR r)ᵒᵖ ⥤ D) : RT2.FunBT D := sorry

/-- Levelwise `C_p`-Tate construction of a `Λ_p`-object in spectra (a simplicial spectrum). -/
def RT2.levelwiseTate (p : ℕ) (Y : (RT2.CyclicCategoryR p)ᵒᵖ ⥤ Spectrum) :
    SimplexCategoryᵒᵖ ⥤ Spectrum := sorry

/-- RT.2/edgewise-subdivision: `|sd_r X| ≃ |X|` T-equivariantly (NS18 B.19).
Finite Tate need not commute with realization, even for uniformly bounded-below levels. -/
theorem edgewiseSubdivision :
    ∀ (D : Type) [Category.{0} D] [Limits.HasColimitsOfShape SimplexCategoryᵒᵖ D] (r : ℕ),
      0 < r → ∀ X : RT2.CyclicObject D,
        Nonempty (RT2.realizeR r (RT2.edgewise r X) ≅ CyclicObject.realize X) := sorry

/-- The comparison of NS18 B.20, used by the cyclotomic Frobenius. It is not an equivalence
assertion or a Tate/realization commutation theorem. -/
def RT2.edgewiseTateComparison (p : ℕ) [Fact p.Prime] [NeZero p]
    (X : RT2.CyclicObject Spectrum) :
    Limits.colimit (RT2.levelwiseTate p (RT2.edgewise p X)) ⟶
      tateConstruction
        (restrictToCyclic p (RT2.funBTSpectrum.functor.obj (CyclicObject.realize X))) := sorry

/-! ### RT.2/thh-e1-ring -/

/-- `R/[R, R]`: the quotient of `R` by the additive subgroup generated by commutators. -/
def RT2.commutatorQuotient (R : Type) [Ring R] : Type :=
  R ⧸ AddSubgroup.closure {z : R | ∃ x y : R, z = x * y - y * x}

instance RT2.instAddCommGroupCommutatorQuotient (R : Type) [Ring R] :
    AddCommGroup (RT2.commutatorQuotient R) := by
  unfold RT2.commutatorQuotient; infer_instance

/-- The identification `(H k as E_∞-ring) → (H k as E_1-ring)` of a commutative ring. -/
def RT2.selfStructure (R : Type) [CommRing R] : (EInftyRing.ofCommRing R).toE1 ⟶ E1Ring.ofRing R :=
  sorry

/-- The structure map `HR → HA` of an `R`-algebra `A`. -/
def RT2.algebraMapE1 (R A : Type) [CommRing R] [Ring A] [Algebra R A] :
    (EInftyRing.ofCommRing R).toE1 ⟶ E1Ring.ofRing A := sorry

/-- The `T`-equivariant map `THH(R) → HH(R/ℤ)`. -/
def RT2.thhToHH (R : Type) [Ring R] : THH.ofRing R ⟶ hhSpectrum R := sorry

/-- `THH` on `E_1`-maps (RT.2/thh-e1-ring); `THH.map_id`, `THH.map_comp` below. -/
def THH.map {A B : E1Ring} (f : A ⟶ B) : THH A ⟶ THH B := sorry

theorem THH.map_id (A : E1Ring) : THH.map (𝟙 A) = 𝟙 (THH A) := sorry

theorem THH.map_comp {A B D : E1Ring} (f : A ⟶ B) (g : B ⟶ D) :
    THH.map (f ≫ g) = THH.map f ≫ THH.map g := sorry

/-- The unit map `A → THH(A)` (inclusion of `0`-simplices), a map of underlying spectra
(RT.2/thh-e1-ring). -/
def THH.unit (A : E1Ring) : A.toSpectrum ⟶ (THH A).underlying := sorry

/-- The equivariant sphere unit, separate from the generally nonequivariant degree-zero map. -/
def THH.sphereUnit (A : E1Ring) : SpectraWithAction.trivial T Spectrum.sphere ⟶ THH A := sorry

/-- `π_0 THH(A) ≅ R/[R,R]` for a connective `E_1`-ring `A` with `π_0 A = R` (RT.2/thh-e1-ring). -/
theorem THH.pi0 (A : E1Ring) (hA : A.IsConnective) :
    Nonempty ((THH A).underlying.homotopyGroup 0 ≃+ RT2.commutatorQuotient A.pi0) := sorry

/-- `THH(A)` is connective if `A` is (RT.2/thh-e1-ring). -/
theorem THH.connective (A : E1Ring) (hA : A.IsConnective) : (THH A).underlying.IsConnective :=
  sorry

/-- Test `THH.sphere` (degenerate): THH(S) ≃ S with trivial T-action. -/
example : Nonempty (THH E1Ring.sphere ≅ SpectraWithAction.trivial T Spectrum.sphere) := sorry

/-- Test `THH.Fp_pi2` (computation): π_2 THH(𝔽_p) ≅ 𝔽_p (generated by Bökstedt's σ), while
HH_2(𝔽_p/𝔽_p) = 0. -/
example (p : ℕ) [Fact p.Prime] :
    Nonempty ((THH.ofRing (ZMod p)).underlying.homotopyGroup 2 ≃+ ZMod p) ∧
      Subsingleton ((THH.relative (EInftyRing.ofCommRing (ZMod p)) (E1Ring.ofRing (ZMod p))
        (RT2.selfStructure (ZMod p))).underlying.homotopyGroup 2) := sorry

/-- Test `THH.not_HH` (non-example): THH(𝔽_p) ≠ HH(𝔽_p/𝔽_p) = 𝔽_p: π_2 differs. -/
example (p : ℕ) [Fact p.Prime] :
    IsEmpty (THH.ofRing (ZMod p) ≅ THH.relative (EInftyRing.ofCommRing (ZMod p))
      (E1Ring.ofRing (ZMod p)) (RT2.selfStructure (ZMod p))) := sorry

/-- Test `THH.pi0_compat` (compatibility): π_0 THH(R) ≅ HH_0(R/ℤ) = R/[R,R], induced by the map
`THH(R) → HH(R/ℤ)` (RT.1/hochschild-homology). -/
example (R : Type) [Ring R] :
    Function.Bijective (Spectrum.homotopyGroupMap (RT2.underlyingMap (RT2.thhToHH R)) 0) ∧
      Nonempty ((hhSpectrum R).underlying.homotopyGroup 0 ≃+ RT2.commutatorQuotient R) := sorry

/-! ### RT.2/cyclotomic-frobenius-thh -/

/-- The cyclotomic Frobenius `φ_p : THH(A) → THH(A)^{tC_p}`, `T ≅ T/C_p`-equivariant
(RT.2/cyclotomic-frobenius-thh). -/
def THH.frobenius (A : E1Ring) (p : ℕ) (hp : p.Prime) : THH A ⟶ residualTate p (THH A) := sorry

/-- Naturality of `φ_p` in `A`. -/
theorem THH.frobenius_natural {A B : E1Ring} (f : A ⟶ B) (p : ℕ) (hp : p.Prime) :
    THH.map f ≫ THH.frobenius B p hp = THH.frobenius A p hp ≫ RT2.residualTateMap p (THH.map f) :=
  sorry

/-- `THH(A)` with `(φ_p)_p` as a cyclotomic spectrum (RT.2/cyclotomic-frobenius-thh). -/
def THH.toCyclotomic (A : E1Ring) : CyclotomicSpectrum :=
  ⟨THH A, fun p hp => THH.frobenius A p hp⟩

/-- The prelude's `THHcyc` is `THH.toCyclotomic`. -/
theorem THH.toCyclotomic_eq (A : E1Ring) : THHcyc A = THH.toCyclotomic A := sorry

/-- The underlying spectrum of a trivial action. -/
def RT2.trivialUnderlying (G : Type) [Group G] (X : Spectrum) :
    (SpectraWithAction.trivial G X).underlying ≅ X := sorry

/-- The canonical `X → X^{hG}` for the trivial action (unit of `triv ⊣ −^{hG}`). -/
def RT2.toHFixedTrivial (G : Type) [Group G] (X : Spectrum) :
    X ⟶ homotopyFixedPoints (SpectraWithAction.trivial G X) := sorry

/-- For `A = S`, `φ_p` is `S → S^{hC_p} → S^{tC_p}` (RT.2/cyclotomic-frobenius-thh). -/
theorem THH.frobenius_sphere (p : ℕ) (hp : p.Prime) [NeZero p] :
    ∃ (e : THH E1Ring.sphere ≅ SpectraWithAction.trivial T Spectrum.sphere)
      (e' : (residualTate p (THH E1Ring.sphere)).underlying ≅
        tateConstruction (SpectraWithAction.trivial (C p) Spectrum.sphere)),
      (RT2.trivialUnderlying T Spectrum.sphere).inv ≫ RT2.underlyingMap e.inv ≫
          RT2.underlyingMap (THH.frobenius E1Ring.sphere p hp) ≫ e'.hom =
        RT2.toHFixedTrivial (C p) Spectrum.sphere ≫
          (RT2.tateCan (C p)).app (SpectraWithAction.trivial (C p) Spectrum.sphere) := sorry

/-- `E_∞`-algebras in `Sp^{BG}` (`E_∞`-rings with `G`-action). -/
def RT2.EInftyAlgSWA (G : Type) [Group G] : Type := sorry
instance RT2.instCategoryEInftyAlgSWA (G : Type) [Group G] : Category.{0} (RT2.EInftyAlgSWA G) :=
  sorry

/-- The underlying spectrum with `G`-action. -/
def RT2.EInftyAlgSWA.forget (G : Type) [Group G] : RT2.EInftyAlgSWA G ⥤ SpectraWithAction G :=
  sorry

/-- For an `E_∞`-ring `A`, `φ_p` is a map of `E_∞`-rings with `T`-action
(RT.2/cyclotomic-frobenius-thh, via RT.2/thh-symmetric-monoidal). -/
theorem THH.frobenius_multiplicative (A : EInftyRing) (p : ℕ) (hp : p.Prime) :
    ∃ (B B' : RT2.EInftyAlgSWA T) (e : (RT2.EInftyAlgSWA.forget T).obj B ≅ THH A.toE1)
      (e' : (RT2.EInftyAlgSWA.forget T).obj B' ≅ residualTate p (THH A.toE1)) (g : B ⟶ B'),
      (RT2.EInftyAlgSWA.forget T).map g ≫ e'.hom = e.hom ≫ THH.frobenius A.toE1 p hp := sorry

/-- Test `THH.frobenius_zero` (degenerate): for A = 0, φ_p is the zero map 0 → 0. -/
example (A : E1Ring) (hA : Limits.IsZero A.toSpectrum) (p : ℕ) :
    Limits.IsZero (THH A) ∧ Limits.IsZero (residualTate p (THH A)) := sorry

/-- Test `THH.frobenius_sphere_pcomplete` (computation): π_0(φ_p) for A = S is ℤ → ℤ_p, the
p-completion. -/
example (p : ℕ) [hp : Fact p.Prime] :
    ∃ (e : (THH E1Ring.sphere).underlying.homotopyGroup 0 ≃+ ℤ)
      (e' : (residualTate p (THH E1Ring.sphere)).underlying.homotopyGroup 0 ≃+ ℤ_[p]),
      ∀ n : ℤ, e' (Spectrum.homotopyGroupMap
        (RT2.underlyingMap (THH.frobenius E1Ring.sphere p hp.out)) 0 (e.symm n)) = (n : ℤ_[p]) :=
  sorry

/-- Test `THH.frobenius_not_equivalence` (non-example): φ_p is not an equivalence in general: for
A = HF_p its target has nonzero negative homotopy while THH(𝔽_p) is connective. -/
example (p : ℕ) [hp : Fact p.Prime] :
    ¬ IsIso (THH.frobenius (E1Ring.ofRing (ZMod p)) p hp.out) ∧
      (∃ n : ℤ, n < 0 ∧
        Nontrivial ((residualTate p (THH.ofRing (ZMod p))).underlying.homotopyGroup n)) ∧
      (THH.ofRing (ZMod p)).underlying.IsConnective := sorry

/-! ### RT.2/relative-thh -/

/-- The relative tensor product `M ⊗_R N` in `Sp^{BT}` of a right and a left module over an
`E_1`-algebra `R` in `Sp^{BT}` (the module structures are the ones named where it is used). -/
def RT2.tensorOver (M R N : SpectraWithAction T) : SpectraWithAction T := sorry

/-- The `E_1`-ring underlying a map of `E_∞`-rings. -/
def RT2.toE1Map {k k' : EInftyRing} (u : k ⟶ k') : k.toE1 ⟶ k'.toE1 := sorry

/-- The `E_∞`-ring map `HR → HS` of a ring homomorphism. -/
def RT2.ofCommRingMap {R S : Type} [CommRing R] [CommRing S] (f : R →+* S) :
    EInftyRing.ofCommRing R ⟶ EInftyRing.ofCommRing S := sorry

/-- Derived Hochschild homology `HH(A/R)` as an Eilenberg–Mac Lane spectrum with circle action
(RT.1/hochschild-homology). -/
def RT2.hhRelSpectrum (R A : Type) [CommRing R] [Ring A] [Algebra R A] : SpectraWithAction T :=
  sorry

/-- `THH(A/k) ≃ THH(A) ⊗_{THH(k)} k`, `k` a `THH(k)`-algebra through the augmentation
(RT.2/relative-thh). -/
def THH.relative_baseChange (k : EInftyRing) (A : E1Ring) (f : k.toE1 ⟶ A) :
    THH.relative k A f ≅
      RT2.tensorOver (THH A) (THH k.toE1) (SpectraWithAction.trivial T k.toE1.toSpectrum) := sorry

/-- `THH(HA/HR) ≃ H(HH(A/R))` `T`-equivariantly (RT.2/relative-thh). -/
theorem THH.relative_HZ (R A : Type) [CommRing R] [Ring A] [Algebra R A] :
    Nonempty (THH.relative (EInftyRing.ofCommRing R) (E1Ring.ofRing A) (RT2.algebraMapE1 R A) ≅
      RT2.hhRelSpectrum R A) := sorry

/-- Functoriality of `THH(A/k)` in maps of pairs `(k → A) → (k' → A')` (RT.2/relative-thh). -/
def THH.relative_map {k k' : EInftyRing} {A A' : E1Ring} {f : k.toE1 ⟶ A} {f' : k'.toE1 ⟶ A'}
    (u : k ⟶ k') (g : A ⟶ A') (w : f ≫ g = RT2.toE1Map u ≫ f') :
    THH.relative k A f ⟶ THH.relative k' A' f' := sorry

/-- The base change `A ⊗_k k'` of an `E_1`-`k`-algebra along `k → k'`, with its structure map. -/
def RT2.baseChangeAlg {k k' : EInftyRing} (u : k ⟶ k') (A : E1Ring) (f : k.toE1 ⟶ A) : E1Ring :=
  sorry
def RT2.baseChangeAlgStr {k k' : EInftyRing} (u : k ⟶ k') (A : E1Ring) (f : k.toE1 ⟶ A) :
    k'.toE1 ⟶ RT2.baseChangeAlg u A f := sorry

/-- `THH(A ⊗_k k'/k') ≃ THH(A/k) ⊗_k k'` (RT.2/relative-thh). -/
theorem THH.relative_baseChange_k {k k' : EInftyRing} (u : k ⟶ k') (A : E1Ring)
    (f : k.toE1 ⟶ A) :
    Nonempty (THH.relative k' (RT2.baseChangeAlg u A f) (RT2.baseChangeAlgStr u A f) ≅
      RT2.tensorOver (THH.relative k A f) (SpectraWithAction.trivial T k.toE1.toSpectrum)
        (SpectraWithAction.trivial T k'.toE1.toSpectrum)) := sorry

/-- `E_∞`-ring structures on `THH(A)` and `THH(A/k)` for `E_∞`-rings. -/
def RT2.thhEInfty (A : EInftyRing) : EInftyRing := sorry
def RT2.thhRelEInfty (k A : EInftyRing) (f : k ⟶ A) : EInftyRing := sorry

theorem RT2.thhEInfty_underlying (A : EInftyRing) :
    Nonempty ((RT2.thhEInfty A).toE1.toSpectrum ≅ (THH A.toE1).underlying) := sorry
theorem RT2.thhRelEInfty_underlying (k A : EInftyRing) (f : k ⟶ A) :
    Nonempty ((RT2.thhRelEInfty k A f).toE1.toSpectrum ≅
      (THH.relative k A.toE1 (RT2.toE1Map f)).underlying) := sorry

/-- Powers in the graded ring `π_*A`. -/
def RT2.piPow (A : E1Ring) {n : ℤ} (x : A.toSpectrum.homotopyGroup n) (m : ℕ) :
    A.toSpectrum.homotopyGroup (m * n) := sorry

/-- Test `THH.relative_self` (degenerate): THH(k/k) ≃ k. -/
example (k : EInftyRing) :
    Nonempty (THH.relative k k.toE1 (𝟙 _) ≅ SpectraWithAction.trivial T k.toE1.toSpectrum) := sorry

/-- Test `THH.relative_polynomial` (computation): π_*THH(HZ[x]/HZ) = ℤ[x] ⊕ ℤ[x]dx in degrees
0, 1 (Kähler differentials `Ω[ℤ[x]⁄ℤ]`), zero elsewhere. -/
example :
    Nonempty ((THH.relative (EInftyRing.ofCommRing ℤ) (E1Ring.ofRing (Polynomial ℤ))
      (RT2.algebraMapE1 ℤ (Polynomial ℤ))).underlying.homotopyGroup 0 ≃+ Polynomial ℤ) ∧
    Nonempty ((THH.relative (EInftyRing.ofCommRing ℤ) (E1Ring.ofRing (Polynomial ℤ))
      (RT2.algebraMapE1 ℤ (Polynomial ℤ))).underlying.homotopyGroup 1 ≃+ Ω[Polynomial ℤ⁄ℤ]) ∧
    ∀ n : ℤ, n ≠ 0 → n ≠ 1 → Subsingleton ((THH.relative (EInftyRing.ofCommRing ℤ)
      (E1Ring.ofRing (Polynomial ℤ)) (RT2.algebraMapE1 ℤ (Polynomial ℤ))).underlying.homotopyGroup n) :=
  sorry

/-- Test `THH.relative_vs_absolute` (non-example): π_*THH(HF_p/HZ) = π_*HH(𝔽_p/ℤ) is a divided
power algebra on a degree-2 class (so `x^p = 0` for `x` in degree 2), while π_*THH(HF_p) = 𝔽_p[σ]
is polynomial (`σ^m ≠ 0` for all `m`). -/
example (p : ℕ) [Fact p.Prime] :
    (∀ x : (RT2.thhRelEInfty (EInftyRing.ofCommRing ℤ) (EInftyRing.ofCommRing (ZMod p))
        (RT2.ofCommRingMap (Int.castRingHom (ZMod p)))).toE1.toSpectrum.homotopyGroup 2,
      RT2.piPow _ x p = 0) ∧
    ∃ σ : (RT2.thhEInfty (EInftyRing.ofCommRing (ZMod p))).toE1.toSpectrum.homotopyGroup 2,
      ∀ m : ℕ, RT2.piPow _ σ m ≠ 0 := sorry

/-! ### RT.2/thh-over-thhz -/

/-- The map on rationalisations. -/
def RT2.rationalisationMap {X Y : Spectrum} (f : X ⟶ Y) : X.rationalisation ⟶ Y.rationalisation :=
  sorry

/-- RT.2/thh-over-thhz: for every ring `A`, `THH(A) ⊗_{THH(ℤ)} ℤ ≃ HH(A/ℤ)`; `π_{2k−1}THH(ℤ) ≅ ℤ/k`
for `k ≥ 1` and `π_{2k}THH(ℤ) = 0` for `k ≥ 1` (Bökstedt); consequently `THH(A) → HH(A/ℤ)` is a
rational equivalence. (The mod `p` consequence is not formalised.) -/
theorem thhOverThhz :
    (∀ (A : Type) [Ring A],
      Nonempty (RT2.tensorOver (THH.ofRing A) (THH.ofRing ℤ) (RT2.HZ T) ≅ hhSpectrum A) ∧
      IsIso (RT2.rationalisationMap (RT2.underlyingMap (RT2.thhToHH A)))) ∧
    ∀ k : ℕ, 1 ≤ k →
      Nonempty ((THH.ofRing ℤ).underlying.homotopyGroup (2 * k - 1) ≃+ ZMod k) ∧
      Subsingleton ((THH.ofRing ℤ).underlying.homotopyGroup (2 * k)) := sorry

/-! ### RT.2/lax-equalizer -/

/-- The lax equalizer `LEq(F, G)` of `F, G : D → E`: objects are pairs `(c, f : F c → G c)`
(RT.2/lax-equalizer). Morphisms are the maps `h` of `D` with `f ≫ G h = F h ≫ f'`, so the mapping
spaces are the equalizers of `Map(c, c') ⇉ Map(F c, G c')` (`StrictLaxEqualizer.mapping`). -/
structure StrictLaxEqualizer {D E : Type*} [Category D] [Category E] (F G : D ⥤ E) where
  /-- The object of `D`. -/
  obj : D
  /-- The structure map `F c → G c`. -/
  map : F.obj obj ⟶ G.obj obj

instance RT2.instCategoryStrictLaxEqualizer {D E : Type*} [Category D] [Category E] (F G : D ⥤ E) :
    Category (StrictLaxEqualizer F G) where
  Hom X Y := {h : X.obj ⟶ Y.obj // X.map ≫ G.map h = F.map h ≫ Y.map}
  id X := ⟨𝟙 X.obj, by simp⟩
  comp f g := ⟨f.1 ≫ g.1, sorry⟩
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-- The projection `LEq(F, G) → D`. -/
def StrictLaxEqualizer.proj {D E : Type*} [Category D] [Category E] (F G : D ⥤ E) :
    StrictLaxEqualizer F G ⥤ D where
  obj X := X.obj
  map h := h.1
  map_id := sorry
  map_comp := sorry

/-- Mapping spaces in `LEq(F, G)` are equalizers of `Map(c, c') ⇉ Map(F c, G c')`
(RT.2/lax-equalizer). -/
theorem StrictLaxEqualizer.mapping {D E : Type*} [Category D] [Category E] {F G : D ⥤ E}
    (X Y : StrictLaxEqualizer F G) :
    Nonempty ((X ⟶ Y) ≃ {h : X.obj ⟶ Y.obj // X.map ≫ G.map h = F.map h ≫ Y.map}) := sorry

/-- Stable categories (finite part of `RT2.BicompleteStable`). -/
class RT2.Stable (D : Type*) [Category D] : Prop where
  hasFiniteLimits : Limits.HasFiniteLimits D
  hasFiniteColimits : Limits.HasFiniteColimits D
  hasZero : Limits.HasZeroObject D
  pullback_iff_pushout : ∀ {A B X Y : D} (f : A ⟶ B) (g : A ⟶ X) (h : B ⟶ Y) (k : X ⟶ Y),
    IsPullback f g h k ↔ IsPushout f g h k

/-- `LEq(F, G)` is stable and `LEq(F, G) → D` exact when `D, E` are stable and `F, G` exact
(RT.2/lax-equalizer). -/
theorem StrictLaxEqualizer.instStable {D E : Type*} [Category D] [Category E] [RT2.Stable D]
    [RT2.Stable E] (F G : D ⥤ E) (hF : RT2.IsExact F) (hG : RT2.IsExact G) :
    RT2.Stable (StrictLaxEqualizer F G) ∧ RT2.IsExact (StrictLaxEqualizer.proj F G) := sorry

/-- `LEq(F, G)` has all small limits and colimits and the projection preserves colimits when `D`
is presentable and `F` preserves colimits (RT.2/lax-equalizer; the accessibility hypotheses on `E`
and `G` are left out); limits of `D` preserved by `G` lift. -/
theorem StrictLaxEqualizer.instPresentable {D E : Type} [Category.{0} D] [Category.{0} E]
    [Limits.HasLimits D] [Limits.HasColimits D] (F G : D ⥤ E) [Limits.PreservesColimits F]
    [Limits.PreservesLimits G] :
    Limits.HasLimits (StrictLaxEqualizer F G) ∧ Limits.HasColimits (StrictLaxEqualizer F G) ∧
      Nonempty (Limits.PreservesColimits (StrictLaxEqualizer.proj F G)) := sorry

/-- The projection `LEq(F, G) → D` is conservative (RT.2/lax-equalizer). -/
theorem StrictLaxEqualizer.conservative {D E : Type*} [Category D] [Category E] (F G : D ⥤ E) :
    (StrictLaxEqualizer.proj F G).ReflectsIsomorphisms := sorry

/-- Test `StrictLaxEqualizer.identity` (degenerate): LEq(id_C, id_C) has objects (c, f : c → c). -/
example {D : Type*} [Category D] :
    Nonempty (StrictLaxEqualizer (𝟭 D) (𝟭 D) ≃ Σ c : D, (c ⟶ c)) := sorry

/-- Test `StrictLaxEqualizer.mapping_point` (computation): for C = D = Spaces (prototyped by `Type`) and
F = G = id, maps (∗, id) → (∗, id) form a contractible space (a singleton). -/
example :
    Nonempty (Unique ((⟨PUnit, 𝟙 _⟩ : StrictLaxEqualizer (𝟭 Type) (𝟭 Type)) ⟶ ⟨PUnit, 𝟙 _⟩)) := sorry

/-- Test `StrictLaxEqualizer.not_equalizer` (non-example): LEq(F, G) is not the equalizer: objects carry
a map, not an equivalence. -/
example : ∃ X : StrictLaxEqualizer (𝟭 Type) (𝟭 Type), ¬ IsIso X.map := sorry

/-! ### Cyclotomic spectra: monoidal structure and forgetful functors (helpers) -/

/-- The forgetful functor `CycSp → Sp^{BT}`. -/
def RT2.cycToSWA : CyclotomicSpectrum ⥤ SpectraWithAction T where
  obj X := X.underlying
  map f := sorry
  map_id := sorry
  map_comp := sorry

/-- The symmetric monoidal structure on `CycSp` (RT.2/thh-symmetric-monoidal). -/
instance RT2.instMonoidalCycSp : MonoidalCategory CyclotomicSpectrum := sorry
instance RT2.instSymmetricCycSp : SymmetricCategory CyclotomicSpectrum := sorry

/-- The smash product of `E_1`-rings makes `Alg_{E_1}(Sp)` symmetric monoidal. -/
instance RT2.instMonoidalE1Ring : MonoidalCategory E1Ring := sorry
instance RT2.instSymmetricE1Ring : SymmetricCategory E1Ring := sorry

/-- `THH : Alg_{E_1}(Sp) → CycSp` as a functor. -/
def RT2.THHFunctor : E1Ring ⥤ CyclotomicSpectrum where
  obj A := THH.toCyclotomic A
  map f := sorry
  map_id := sorry
  map_comp := sorry

/-- `THH(A)` of an `E_∞`-ring as an `E_∞`-ring with `T`-action. -/
def RT2.thhEInftyAlg (A : EInftyRing) : RT2.EInftyAlgSWA T := sorry

/-- The tensor `A ⊗ T` of an `E_∞`-ring with the space `T` in `CAlg(Sp)`, with its `T`-action. -/
def RT2.tensorCircle (A : EInftyRing) : RT2.EInftyAlgSWA T := sorry

/-! ### RT.2/thh-symmetric-monoidal -/

/-- RT.2/thh-symmetric-monoidal: `CycSp` is symmetric monoidal with underlying `T`-spectrum the
smash product and Frobenius `X ⊗ Y → X^{tC_p} ⊗ Y^{tC_p} → (X ⊗ Y)^{tC_p}`; `THH` is symmetric
monoidal; for an `E_∞`-ring `A`, `THH(A)` is an `E_∞`-ring with `T`-action equivalent to `A ⊗ T`
(McClure–Schwänzl–Vogt). (The characterisation of `φ_p` as the unique `T`-equivariant extension of
the Tate-valued Frobenius of `A` is left out.) -/
theorem thhSymmetricMonoidal :
    (∃ L : ∀ p : ℕ, (RT2.residualTateFunctor p).LaxBraided,
      ∀ X Y : CyclotomicSpectrum, ∃ e : (X ⊗ Y).underlying ≅ X.underlying ⊗ Y.underlying,
        ∀ (p : ℕ) (hp : p.Prime),
          (X ⊗ Y).frobenius p hp =
            e.hom ≫ (X.frobenius p hp ⊗ₘ Y.frobenius p hp) ≫
              (letI := (L p).toLaxMonoidal
               Functor.LaxMonoidal.μ (RT2.residualTateFunctor p) X.underlying Y.underlying) ≫
              RT2.residualTateMap p e.inv) ∧
    Nonempty RT2.THHFunctor.Braided ∧
    ∀ A : EInftyRing,
      Nonempty ((RT2.EInftyAlgSWA.forget T).obj (RT2.thhEInftyAlg A) ≅ THH A.toE1) ∧
      Nonempty (RT2.thhEInftyAlg A ≅ RT2.tensorCircle A) := sorry

/-! ### RT.2/thh-spectral-categories -/

/-- `THH(C)` of a small stable ∞-category as a cyclotomic spectrum, with underlying `T`-spectrum
the prelude's `THH.ofCat C`. -/
def RT2.thhCatCyc (C : SmallStableCat) : CyclotomicSpectrum := sorry

theorem RT2.thhCatCyc_underlying (C : SmallStableCat) :
    (RT2.thhCatCyc C).underlying = THH.ofCat C := sorry

/-- Exact functors induce cyclotomic maps on `THH` (RT.2/thh-spectral-categories);
`THH.ofCat_map_id`, `THH.ofCat_map_comp` below. -/
def THH.ofCat_map {C D : SmallStableCat} (F : C ⟶ D) : RT2.thhCatCyc C ⟶ RT2.thhCatCyc D := sorry

theorem THH.ofCat_map_id (C : SmallStableCat) : THH.ofCat_map (𝟙 C) = 𝟙 (RT2.thhCatCyc C) := sorry

theorem THH.ofCat_map_comp {C D E : SmallStableCat} (F : C ⟶ D) (G : D ⟶ E) :
    THH.ofCat_map (F ≫ G) = THH.ofCat_map F ≫ THH.ofCat_map G := sorry

/-- `THH(Perf(A)) ≃ THH(A)` as cyclotomic spectra (RT.2/thh-spectral-categories). -/
theorem THH.ofCat_perf (A : E1Ring) : Nonempty (RT2.thhCatCyc (Perf A) ≅ THH.toCyclotomic A) :=
  sorry

/-- Morita equivalences induce equivalences on `THH` (RT.2/thh-spectral-categories), stated for
Morita equivalent rings (Mathlib `MoritaEquivalence`) and for equivalences in `Cat^perf`. -/
theorem THH.ofCat_morita :
    (∀ (A B : Type) [Ring A] [Ring B], Nonempty (MoritaEquivalence ℤ A B) →
      Nonempty (THH.toCyclotomic (E1Ring.ofRing A) ≅ THH.toCyclotomic (E1Ring.ofRing B))) ∧
    ∀ {C D : SmallStableCat} (F : C ⟶ D), IsIso F → IsIso (THH.ofCat_map F) := sorry

/-- Verdier sequences `A → B → B/A` of small stable ∞-categories (data). -/
def RT2.VerdierSequence : Type 1 := sorry
def RT2.VerdierSequence.A (S : RT2.VerdierSequence) : SmallStableCat := sorry
def RT2.VerdierSequence.B (S : RT2.VerdierSequence) : SmallStableCat := sorry
def RT2.VerdierSequence.Q (S : RT2.VerdierSequence) : SmallStableCat := sorry
def RT2.VerdierSequence.i (S : RT2.VerdierSequence) : S.A ⟶ S.B := sorry
def RT2.VerdierSequence.q (S : RT2.VerdierSequence) : S.B ⟶ S.Q := sorry

/-- THH sends Verdier sequences to fibre sequences (THH is a localizing invariant;
RT.2/thh-spectral-categories). -/
theorem THH.ofCat_localizing (S : RT2.VerdierSequence) :
    RT2.IsCofibreSequence ((RT2.cycToSWA ⋙ RT2.forget T).map (THH.ofCat_map S.i))
      ((RT2.cycToSWA ⋙ RT2.forget T).map (THH.ofCat_map S.q)) := sorry

/-- Test `THH.ofCat_zero` (degenerate): THH of the zero category is 0. -/
example (C : SmallStableCat) (hC : Limits.IsZero C) : Limits.IsZero (THH.ofCat C) := sorry

/-- Test `THH.ofCat_matrix` (computation): THH(Perf(M_n(R))) ≃ THH(R) via the Morita equivalence. -/
example (R : Type) [Ring R] (n : ℕ) [NeZero n] :
    Nonempty (THH.ofCat (Perf (E1Ring.ofRing (Matrix (Fin n) (Fin n) R))) ≅ THH.ofRing R) := sorry

/-- Test `THH.ofCat_not_K` (non-example): THH is not K-theory: THH(Perf(𝔽_p)) has π_2 = 𝔽_p while
K_2(𝔽_p) = 0. -/
example (p : ℕ) [Fact p.Prime] :
    Nonempty ((THH.ofCat (Perf (E1Ring.ofRing (ZMod p)))).underlying.homotopyGroup 2 ≃+ ZMod p) ∧
      Subsingleton ((connectiveK (Perf (E1Ring.ofRing (ZMod p)))).homotopyGroup 2) := sorry

/-! ### RT.2/cyclotomic-spectrum -/

/-- `Sp` and `Sp^{BG}` are additive (stable). -/
instance RT2.instPreadditiveSpectrum : Preadditive Spectrum := sorry
instance RT2.instPreadditiveSWA (G : Type) [Group G] : Preadditive (SpectraWithAction G) := sorry

/-- The Prüfer group `C_{p^∞} ⊂ T` of `p`-power roots of unity. -/
def RT2.CpInfty (p : ℕ) : Subgroup T := ⨆ n : ℕ, RT2.muT (p ^ n)

/-- The residual `−^{tC_p} : Sp^{BC_{p^∞}} → Sp^{B(C_{p^∞}/C_p)} ≃ Sp^{BC_{p^∞}}`. -/
def RT2.residualTateCpInfty (p : ℕ) :
    SpectraWithAction (RT2.CpInfty p) ⥤ SpectraWithAction (RT2.CpInfty p) := sorry

/-- `CycSp = LEq(Sp^{BT} ⇉ ∏_p Sp^{BT})` for `id` and `(−^{tC_p})_p` (RT.2/cyclotomic-spectrum). -/
def CyclotomicSpectrum.equivStrictLaxEqualizer :
    CyclotomicSpectrum ≌ StrictLaxEqualizer (Functor.pi' fun _ : Nat.Primes => 𝟭 (SpectraWithAction T))
      (Functor.pi' fun p : Nat.Primes => RT2.residualTateFunctor p) := sorry

/-- `p`-cyclotomic spectra `CycSp_p = LEq(Sp^{BC_{p^∞}} ⇉ Sp^{BC_{p^∞}})` for `id` and `−^{tC_p}`
(RT.2/cyclotomic-spectrum). -/
abbrev CyclotomicSpectrum.pTypical (p : ℕ) : Type :=
  StrictLaxEqualizer (𝟭 (SpectraWithAction (RT2.CpInfty p))) (RT2.residualTateCpInfty p)

/-- The forgetful functor `CycSp → Sp^{BT} → Sp` (RT.2/cyclotomic-spectrum). -/
def CyclotomicSpectrum.forget : CyclotomicSpectrum ⥤ Spectrum := RT2.cycToSWA ⋙ RT2.forget T

/-- The forgetful functor is exact, conservative and preserves small colimits; likewise for
`CycSp_p`. -/
theorem CyclotomicSpectrum.forget_spec :
    RT2.IsExact CyclotomicSpectrum.forget ∧ CyclotomicSpectrum.forget.ReflectsIsomorphisms ∧
      Nonempty (Limits.PreservesColimits CyclotomicSpectrum.forget) ∧
      ∀ p : ℕ, p.Prime →
        RT2.IsExact (StrictLaxEqualizer.proj _ _ ⋙ RT2.forget (RT2.CpInfty p) :
          CyclotomicSpectrum.pTypical p ⥤ Spectrum) ∧
        (StrictLaxEqualizer.proj _ _ ⋙ RT2.forget (RT2.CpInfty p) :
          CyclotomicSpectrum.pTypical p ⥤ Spectrum).ReflectsIsomorphisms := sorry

/-- The Frobenius `S → S^{hC_p} → S^{tC_p}` of the sphere with trivial action. -/
def RT2.sphereFrobenius (p : ℕ) :
    SpectraWithAction.trivial T Spectrum.sphere ⟶
      residualTate p (SpectraWithAction.trivial T Spectrum.sphere) := sorry

/-- The cyclotomic sphere. -/
def RT2.cycSphere : CyclotomicSpectrum :=
  ⟨SpectraWithAction.trivial T Spectrum.sphere, fun p _ => RT2.sphereFrobenius p⟩

/-- The cyclotomic sphere `S` (trivial action, `φ_p : S → S^{hC_p} → S^{tC_p}`) is the unit of
`CycSp` and is `THH(S)` (RT.2/cyclotomic-spectrum). -/
theorem CyclotomicSpectrum.unit :
    Nonempty (𝟙_ CyclotomicSpectrum ≅ RT2.cycSphere) ∧
      Nonempty (RT2.cycSphere ≅ THH.toCyclotomic E1Ring.sphere) := sorry

/-- `CycSp` is presentable stable (RT.2/cyclotomic-spectrum). -/
instance CyclotomicSpectrum.instStable : RT2.BicompleteStable CyclotomicSpectrum := sorry

/-- Restriction `CycSp → CycSp_p` along `C_{p^∞} ⊂ T` (RT.2/cyclotomic-spectrum). -/
def CyclotomicSpectrum.toPTypical (p : ℕ) : CyclotomicSpectrum ⥤ CyclotomicSpectrum.pTypical p :=
  sorry

/-- `toPTypical` restricts the underlying action along `C_{p^∞} ⊂ T`. -/
theorem CyclotomicSpectrum.toPTypical_obj (p : ℕ) (X : CyclotomicSpectrum) :
    ((CyclotomicSpectrum.toPTypical p).obj X).obj =
      (SpectraWithAction.res (RT2.CpInfty p).subtype).obj X.underlying := sorry

/-- Test `CyclotomicSpectrum.zero` (degenerate): 0 with zero Frobenii is the zero object. -/
example (X : SpectraWithAction T) (hX : Limits.IsZero X) :
    Limits.IsZero (⟨X, fun _ _ => 0⟩ : CyclotomicSpectrum) := sorry

/-- Test `CyclotomicSpectrum.sphere_frobenius` (computation): for the cyclotomic sphere,
π_0 φ_p : ℤ → π_0 S^{tC_p} = ℤ_p is the completion map. -/
example (p : ℕ) [hp : Fact p.Prime] :
    ∃ (e : RT2.cycSphere.underlying.underlying.homotopyGroup 0 ≃+ ℤ)
      (e' : (residualTate p RT2.cycSphere.underlying).underlying.homotopyGroup 0 ≃+ ℤ_[p]),
      ∀ n : ℤ, e' (Spectrum.homotopyGroupMap
        (RT2.underlyingMap (RT2.cycSphere.frobenius p hp.out)) 0 (e.symm n)) = (n : ℤ_[p]) := sorry

/-- A spectrum with trivial `T`-action and zero Frobenii. -/
def RT2.trivialZeroCyc (X : Spectrum) : CyclotomicSpectrum :=
  ⟨SpectraWithAction.trivial T X, fun _ _ => 0⟩

/-- Test `CyclotomicSpectrum.trivial_HFp` (non-example): HF_p with trivial T-action and φ_p = 0 is
a cyclotomic spectrum but is not THH(𝔽_p). -/
example (p : ℕ) [Fact p.Prime] :
    IsEmpty (RT2.trivialZeroCyc (Spectrum.em (ZMod p)) ≅ THH.toCyclotomic (E1Ring.ofRing (ZMod p))) :=
  sorry

/-! ### RT.2/tc-minus-and-tp -/

/-- `can : TC⁻(X) → TP(X)` (RT.2/tc-minus-and-tp). -/
def TCminus.can (X : SpectraWithAction T) : TCminus X ⟶ TP X := RT2.circleTateCan.app X

/-- `φ = ∏_p φ_p^{hT} : TC⁻(X) → ∏_p (X^{tC_p})^{hT} ≃ TP(X)^∧` for bounded below cyclotomic `X`
(RT.2/tc-minus-and-tp). -/
def TCminus.frobenius (X : CyclotomicSpectrum) (hX : X.underlying.underlying.IsBoundedBelow) :
    TCminus X.underlying ⟶ RT2.profiniteCompletion (TP X.underlying) := sorry

/-- `TCminus.frobenius` is `∏_p φ_p^{hT}` followed by `∏_p (X^{tC_p})^{hT} ≃ TP(X)^∧`. -/
theorem TCminus.frobenius_spec (X : CyclotomicSpectrum)
    (hX : X.underlying.underlying.IsBoundedBelow) :
    ∃ e : (∏ᶜ fun p : Nat.Primes => homotopyFixedPoints (residualTate p X.underlying)) ≅
        RT2.profiniteCompletion (TP X.underlying),
      TCminus.frobenius X hX =
        Limits.Pi.lift (fun p : Nat.Primes => RT2.hFixedMap (X.frobenius p p.2)) ≫ e.hom := sorry

/-- `TC⁻` and `TP` are lax symmetric monoidal (RT.2/tc-minus-and-tp). -/
def TCminus.laxMonoidal : (RT2.hFixed T).LaxBraided × RT2.circleTateFunctor.LaxBraided :=
  (homotopyFixedPoints.laxMonoidal T, circleTate.laxMonoidal)

/-- `TC⁻(A)` and `TP(A)` are `E_∞`-rings for an `E_∞`-ring `A`. -/
theorem TCminus.laxMonoidal_ring (A : EInftyRing) :
    (∃ R : EInftyRing, Nonempty (R.toE1.toSpectrum ≅ TCminus (THH A.toE1))) ∧
      ∃ R : EInftyRing, Nonempty (R.toE1.toSpectrum ≅ TP (THH A.toE1)) := sorry

/-- `THH(A) → HH(A/ℤ)` induces comparison maps (RT.2/tc-minus-and-tp).
Rational equivalence on underlying spectra does not justify equivalence after infinite
homotopy fixed points or circle Tate. -/
def TCminus.toHC (A : Type) [Ring A] :
    (TCminus (THH.ofRing A) ⟶ hcMinusSpectrum A) ×
      (TP (THH.ofRing A) ⟶ hpSpectrum A) :=
  (RT2.hFixedMap (RT2.thhToHH A), RT2.circleTateMap (RT2.thhToHH A))

/-- Test `TCminus.zero` (degenerate): TC⁻(0) = TP(0) = 0. -/
example (X : SpectraWithAction T) (hX : Limits.IsZero X) :
    Limits.IsZero (TCminus X) ∧ Limits.IsZero (TP X) := sorry

/-- Test `TP.HZ_trivial` (computation): for HZ with trivial T-action, π_*TP = ℤ[t^{±1}]
(degreewise). -/
example :
    ∀ k : ℤ, Nonempty ((TP (RT2.HZ T)).homotopyGroup (2 * k) ≃+ ℤ) ∧
      Subsingleton ((TP (RT2.HZ T)).homotopyGroup (2 * k + 1)) := sorry

/-- Test `TP.not_HP` (non-example): π_0TP(𝔽_p) = ℤ_p while HP_0(𝔽_p/𝔽_p) = 𝔽_p. -/
example (p : ℕ) [Fact p.Prime] :
    Nonempty ((TP (THH.ofRing (ZMod p))).homotopyGroup 0 ≃+ ℤ_[p]) ∧
      Nonempty ((TP (THH.relative (EInftyRing.ofCommRing (ZMod p)) (E1Ring.ofRing (ZMod p))
        (RT2.selfStructure (ZMod p)))).homotopyGroup 0 ≃+ ZMod p) := sorry

/-! ### RT.2/topological-cyclic-homology -/

/-- The mapping spectrum `map_{CycSp}(X, Y)`. -/
def RT2.mapSpectrumCyc (X Y : CyclotomicSpectrum) : Spectrum := sorry

/-- `TC(X) = map_{CycSp}(S, X)` (RT.2/topological-cyclic-homology; `TC` is the prelude's). -/
theorem TC.mapping (X : CyclotomicSpectrum) : Nonempty (TC X ≅ RT2.mapSpectrumCyc RT2.cycSphere X) :=
  sorry

/-- `TC(X, p) = map_{CycSp_p}(S, X)` for a `p`-cyclotomic spectrum (RT.2/topological-cyclic-homology). -/
def TC.pTypical (p : ℕ) (X : CyclotomicSpectrum.pTypical p) : Spectrum := sorry

/-- `TC` as a functor `CycSp → Sp`. -/
def RT2.TCFunctor : CyclotomicSpectrum ⥤ Spectrum where
  obj X := TC X
  map f := sorry
  map_id := sorry
  map_comp := sorry

/-- `TC : CycSp → Sp` is exact (RT.2/topological-cyclic-homology).
Integral TC is not claimed to preserve filtered colimits. The connective mod-p statement
is CMM Theorem 2.7 and requires its separate coefficient functor. -/
theorem TC.exact : RT2.IsExact RT2.TCFunctor := sorry

/-- `TC` is lax symmetric monoidal (RT.2/topological-cyclic-homology). -/
def TC.laxMonoidal : RT2.TCFunctor.LaxBraided := sorry

/-- `TC(A)` is an `E_∞`-ring for an `E_∞`-ring `A`. -/
theorem TC.laxMonoidal_ring (A : EInftyRing) :
    ∃ R : EInftyRing, Nonempty (R.toE1.toSpectrum ≅ TC (THH.toCyclotomic A.toE1)) := sorry

/-- The map `TC(X) → TC⁻(X) = X^{hT}` (RT.2/topological-cyclic-homology). -/
def TC.toTCminus (X : CyclotomicSpectrum) : TC X ⟶ TCminus X.underlying := sorry

/-- Test `TC.zero` (degenerate): TC(0) = 0. -/
example (X : CyclotomicSpectrum) (hX : Limits.IsZero X) : Limits.IsZero (TC X) := sorry

/-- Test `TC.Fp` (computation): π_*TC(𝔽_p)^∧_p = ℤ_p in degrees 0 and −1, zero elsewhere. -/
example (p : ℕ) [Fact p.Prime] :
    Nonempty ((Spectrum.pCompletion p (TC (THH.toCyclotomic (E1Ring.ofRing (ZMod p))))).homotopyGroup
      0 ≃+ ℤ_[p]) ∧
    Nonempty ((Spectrum.pCompletion p (TC (THH.toCyclotomic (E1Ring.ofRing (ZMod p))))).homotopyGroup
      (-1) ≃+ ℤ_[p]) ∧
    ∀ n : ℤ, n ≠ 0 → n ≠ -1 → Subsingleton
      ((Spectrum.pCompletion p (TC (THH.toCyclotomic (E1Ring.ofRing (ZMod p))))).homotopyGroup n) :=
  sorry

/-- Test `TC.not_TCminus` (non-example): π_{−2}TC⁻(𝔽_p) ≠ 0 while π_{−2}TC(𝔽_p) = 0. -/
example (p : ℕ) [Fact p.Prime] :
    Nontrivial ((TCminus (THH.ofRing (ZMod p))).homotopyGroup (-2)) ∧
      Subsingleton ((TC (THH.toCyclotomic (E1Ring.ofRing (ZMod p)))).homotopyGroup (-2)) := sorry

/-! ### RT.2/tc-fibre-sequence -/

/-- `can : X^{hT} ≃ (X^{hC_p})^{h(T/C_p)} → (X^{tC_p})^{h(T/C_p)}`. -/
def RT2.canP (p : ℕ) (X : SpectraWithAction T) :
    homotopyFixedPoints X ⟶ homotopyFixedPoints (residualTate p X) := sorry

/-- The `C_{p^∞}` analogue `X^{hC_{p^∞}} → (X^{tC_p})^{hC_{p^∞}}`. -/
def RT2.canPInfty (p : ℕ) (Y : SpectraWithAction (RT2.CpInfty p)) :
    homotopyFixedPoints Y ⟶ homotopyFixedPoints ((RT2.residualTateCpInfty p).obj Y) := sorry

/-- The map `TC(X, p) → X^{hC_{p^∞}}`. -/
def RT2.tcpToHFixed (p : ℕ) (X : CyclotomicSpectrum.pTypical p) :
    TC.pTypical p X ⟶ homotopyFixedPoints X.obj := sorry

/-- The profinite completion map `Y → Y^∧ = ∏_p Y^∧_p`. -/
def RT2.profiniteCompletionMap (Y : Spectrum) : Y ⟶ RT2.profiniteCompletion Y :=
  Limits.Pi.lift fun p : Nat.Primes => RT2.pCompletionMap p Y

/-- RT.2/tc-fibre-sequence: (i) `TC(X) → X^{hT} → ∏_p (X^{tC_p})^{hT}` is a fibre sequence, the
`p`-th component of the second map being `φ_p^{hT} − can`; (ii) for `p`-cyclotomic `X`,
`TC(X, p) → X^{hC_{p^∞}} → (X^{tC_p})^{hC_{p^∞}}`; (iii) for `X` bounded below,
`TC(X) ≃ fib(φ − can : TC⁻(X) → TP(X)^∧)`. (The comparison with genuine TC for connective `A`,
via RT.2/genuine-tc-agrees, belongs to the genuine part of RT.2.) -/
theorem tcFibreSequence :
    (∀ X : CyclotomicSpectrum,
      RT2.IsCofibreSequence (TC.toTCminus X)
        (Limits.Pi.lift fun p : Nat.Primes =>
          RT2.hFixedMap (X.frobenius p p.2) - RT2.canP p X.underlying)) ∧
    (∀ (p : ℕ) (X : CyclotomicSpectrum.pTypical p),
      RT2.IsCofibreSequence (RT2.tcpToHFixed p X)
        ((RT2.hFixedMap X.map : homotopyFixedPoints X.obj ⟶ _) - RT2.canPInfty p X.obj)) ∧
    ∀ (X : CyclotomicSpectrum) (hX : X.underlying.underlying.IsBoundedBelow),
      RT2.IsCofibreSequence (TC.toTCminus X)
        (TCminus.frobenius X hX -
          TCminus.can X.underlying ≫ RT2.profiniteCompletionMap (TP X.underlying)) := sorry

/-! ### RT.2/tc-p-completion -/

/-- `X^{hT} → ∏_p (X^∧_p)^{hT}`. -/
def RT2.hFixedToCompletions (X : CyclotomicSpectrum) :
    homotopyFixedPoints X.underlying ⟶
      ∏ᶜ fun p : Nat.Primes => homotopyFixedPoints (RT2.pCompletionAction p X.underlying) := sorry

/-- `∏_p TC(X, p)^∧_p → ∏_p (X^∧_p)^{hT}`. -/
def RT2.tcpToCompletions (X : CyclotomicSpectrum) :
    (∏ᶜ fun p : Nat.Primes =>
        Spectrum.pCompletion p (TC.pTypical p ((CyclotomicSpectrum.toPTypical p).obj X))) ⟶
      ∏ᶜ fun p : Nat.Primes => homotopyFixedPoints (RT2.pCompletionAction p X.underlying) := sorry

/-- RT.2/tc-p-completion: for bounded below cyclotomic `X`, `TC(X)^∧_p ≃ TC(X|_{CycSp_p}, p)^∧_p`,
and `TC(X)` is the pullback of `X^{hT} → ∏_p (X^∧_p)^{hT} ← ∏_p TC(X, p)^∧_p` (rationalising this
square gives the rational statement). -/
theorem tcPCompletion (X : CyclotomicSpectrum) (hX : X.underlying.underlying.IsBoundedBelow) :
    (∀ p : ℕ, p.Prime → Nonempty (Spectrum.pCompletion p (TC X) ≅
      Spectrum.pCompletion p (TC.pTypical p ((CyclotomicSpectrum.toPTypical p).obj X)))) ∧
    ∃ (a : TC X ⟶ homotopyFixedPoints X.underlying)
      (b : TC X ⟶ ∏ᶜ fun p : Nat.Primes =>
        Spectrum.pCompletion p (TC.pTypical p ((CyclotomicSpectrum.toPTypical p).obj X))),
      IsPullback a b (RT2.hFixedToCompletions X) (RT2.tcpToCompletions X) := sorry

/-! ### RT.2/trivial-cyclotomic-adjunction -/

/-- The Frobenius `Y → Y^{hC_p} → Y^{tC_p}` of a spectrum with trivial action. -/
def RT2.trivialFrobenius (p : ℕ) (Y : Spectrum) :
    SpectraWithAction.trivial T Y ⟶ residualTate p (SpectraWithAction.trivial T Y) := sorry

/-- `Y ↦ Y^{triv}`, the trivial cyclotomic structure. -/
def RT2.trivCycFunctor : Spectrum ⥤ CyclotomicSpectrum where
  obj Y := ⟨SpectraWithAction.trivial T Y, fun p _ => RT2.trivialFrobenius p Y⟩
  map f := sorry
  map_id := sorry
  map_comp := sorry

/-- Connective cover in `Sp^{BT}`. -/
def RT2.connCoverSWA (X : SpectraWithAction T) : SpectraWithAction T := sorry

theorem RT2.connCoverSWA_underlying (X : SpectraWithAction T) :
    Nonempty ((RT2.connCoverSWA X).underlying ≅ X.underlying.connectiveCover) := sorry

/-- `sh_p X` for a connective cyclotomic `X` (NS18 Construction IV.4.15). -/
def RT2.shiftP (p : ℕ) (X : CyclotomicSpectrum) : CyclotomicSpectrum := sorry

/-- The natural map `X → sh_p X`. -/
def RT2.toShiftP (p : ℕ) (X : CyclotomicSpectrum) : X ⟶ RT2.shiftP p X := sorry

/-- `E_2`-rings. -/
def RT2.E2Ring : Type := sorry
def RT2.E2Ring.toE1 (A : RT2.E2Ring) : E1Ring := sorry

/-- `φ_p^{hT} : TC⁻(X) → (X^{tC_p})^{hT} ≃ TP(X)^∧_p`. -/
def RT2.frobeniusHT (p : ℕ) (X : CyclotomicSpectrum) :
    TCminus X.underlying ⟶ Spectrum.pCompletion p (TP X.underlying) := sorry

/-- RT.2/trivial-cyclotomic-adjunction: (i) `Y ↦ Y^{triv}` is left adjoint to `TC`; (ii) for
connective `X`, `sh_p X` has underlying `T`-spectrum `τ_{≥0}(X^{tC_p})` and `φ_ℓ = 0` for `ℓ ≠ p`
(the formula `φ_p = τ_{≥0}(φ_p^{tC_p})` is left out), and `THH(𝔽_p) ≃ sh_p(HZ_p^{triv})` (the
`E_∞` refinement is left out); (iii) for an `E_2`-ring `A` with `p = 0` in `π_0 A`,
`TC(A) → THH(A)^{hT} → THH(A)^{tT,∧}_p` (`can − φ_p^{hT}`) is a fibre sequence. -/
theorem trivialCyclotomicAdjunction :
    Nonempty (RT2.trivCycFunctor ⊣ RT2.TCFunctor) ∧
    (∀ (p : ℕ) (hp : p.Prime) (X : CyclotomicSpectrum), X.underlying.underlying.IsConnective →
      Nonempty ((RT2.shiftP p X).underlying ≅ RT2.connCoverSWA (residualTate p X.underlying)) ∧
      ∀ (l : ℕ) (hl : l.Prime), l ≠ p → (RT2.shiftP p X).frobenius l hl = 0) ∧
    (∀ (p : ℕ) [Fact p.Prime],
      Nonempty (THH.toCyclotomic (E1Ring.ofRing (ZMod p)) ≅
        RT2.shiftP p (RT2.trivCycFunctor.obj (Spectrum.em ℤ_[p])))) ∧
    ∀ (p : ℕ) (_ : p.Prime) (A : RT2.E2Ring), ((p : A.toE1.pi0) = 0) →
      RT2.IsCofibreSequence (TC.toTCminus (THH.toCyclotomic A.toE1))
        (TCminus.can (THH.toCyclotomic A.toE1).underlying ≫
            RT2.pCompletionMap p (TP (THH.toCyclotomic A.toE1).underlying) -
          RT2.frobeniusHT p (THH.toCyclotomic A.toE1)) := sorry

/-! ### RT.2/hz-module-circle-tate -/

/-- The relative tensor product `M ⊗_R N` of spectra (module structures as named where used). -/
def RT2.tensorOverSp (M R N : Spectrum) : Spectrum := sorry

/-- The `T`-spectrum underlying `X ∈ D(ℤ)^{BT}`. -/
def RT2.DZ.toSWA (X : RT2.FunBT RT2.DZ) : SpectraWithAction T :=
  RT2.funBTSpectrum.functor.obj ((RT2.FunBT.postcomp RT2.DZ.toSpectrum).obj X)

/-- The comparison maps of NS18 Lemma IV.4.12, induced by the lax monoidal structures. -/
def RT2.hzComparison₁ (X : RT2.FunBT RT2.DZ) :
    RT2.tensorOverSp (homotopyFixedPoints (RT2.DZ.toSWA X)) (homotopyFixedPoints (RT2.HZ T))
      (Spectrum.em ℤ) ⟶ (RT2.DZ.toSWA X).underlying := sorry
def RT2.hzComparison₂ (X : RT2.FunBT RT2.DZ) :
    RT2.tensorOverSp (homotopyFixedPoints (RT2.DZ.toSWA X)) (homotopyFixedPoints (RT2.HZ T))
      (circleTate (RT2.HZ T)) ⟶ circleTate (RT2.DZ.toSWA X) := sorry
def RT2.hzComparison₃ (n : ℕ) [NeZero n] (X : RT2.FunBT RT2.DZ) :
    RT2.tensorOverSp (circleTate (RT2.DZ.toSWA X)) (circleTate (RT2.HZ T))
      (tateConstruction (RT2.HZ (C n))) ⟶ tateConstruction (restrictToCyclic n (RT2.DZ.toSWA X)) :=
  sorry

/-- RT.2/hz-module-circle-tate: for `X ∈ D(ℤ)^{BT}` (bounded below; the further finiteness
hypotheses of NS18 Lemma IV.4.12 are left out), `X^{hT} ⊗_{ℤ^{hT}} ℤ → X`,
`X^{hT} ⊗_{ℤ^{hT}} ℤ^{tT} → X^{tT}` and `X^{tT} ⊗_{ℤ^{tT}} ℤ^{tC_n} → X^{tC_n}` are equivalences. -/
theorem hzModuleCircleTate (X : RT2.FunBT RT2.DZ)
    (hX : (RT2.DZ.toSWA X).underlying.IsBoundedBelow) :
    IsIso (RT2.hzComparison₁ X) ∧ IsIso (RT2.hzComparison₂ X) ∧
      ∀ (n : ℕ) [NeZero n], IsIso (RT2.hzComparison₃ n X) := sorry

/-! ### RT.2/mixed-complexes-are-circle-modules -/

/-- A mixed complex over `k`: a chain complex `(C, b)` of `k`-modules with a degree `+1` map `B`
such that `B² = 0` and `bB + Bb = 0`. -/
abbrev RT2.MixedComplex (k : Type) [CommRing k] := RefinedTraceMethods.MixedComplex k

/-- The derived ∞-category `D(k)`. -/
def RT2.DerivedCat (k : Type) [CommRing k] : Type := sorry
instance RT2.instCategoryDerivedCat (k : Type) [CommRing k] : Category.{0} (RT2.DerivedCat k) :=
  sorry

/-- The Eilenberg–Mac Lane functor `D(k) → Sp`. -/
def RT2.DerivedCat.toSpectrum (k : Type) [CommRing k] : RT2.DerivedCat k ⥤ Spectrum := sorry

/-- Mixed complexes localised at quasi-isomorphisms, with the localisation map. -/
def RT2.MixedComplexes (k : Type) [CommRing k] : Type := sorry
instance RT2.instCategoryMixedComplexes (k : Type) [CommRing k] :
    Category.{0} (RT2.MixedComplexes k) := sorry
def RT2.MixedComplexes.of {k : Type} [CommRing k] (M : RT2.MixedComplex k) :
    RT2.MixedComplexes k := sorry

/-- The negative cyclic, periodic cyclic and cyclic complexes of a mixed complex (product
totalisations, shift conventions of RT.1/cyclic-homology). -/
def RT2.MixedComplex.negCyclic {k : Type} [CommRing k] (M : RT2.MixedComplex k) :
    RT2.DerivedCat k := sorry
def RT2.MixedComplex.periodicCyclic {k : Type} [CommRing k] (M : RT2.MixedComplex k) :
    RT2.DerivedCat k := sorry
def RT2.MixedComplex.cyclic {k : Type} [CommRing k] (M : RT2.MixedComplex k) :
    RT2.DerivedCat k := sorry

/-- Homotopy fixed points, Tate construction and homotopy orbits in `Fun(BT, D)`. -/
def RT2.FunBT.hFixed (D : Type) [Category.{0} D] (X : RT2.FunBT D) : D := sorry
def RT2.FunBT.tate (D : Type) [Category.{0} D] (X : RT2.FunBT D) : D := sorry
def RT2.FunBT.hOrbits (D : Type) [Category.{0} D] (X : RT2.FunBT D) : D := sorry

/-- The Hochschild mixed complex `(C(A/k), b, B)` (RT.1/hochschild-homology). -/
def RT2.hochschildMixed (k A : Type) [CommRing k] [Ring A] [Algebra k A] : RT2.MixedComplex k :=
  sorry

/-- `HH(A/k) ∈ D(k)^{BT}` (RT.2/relative-thh, RT.1/hochschild-homology). -/
def RT2.hhDk (k A : Type) [CommRing k] [Ring A] [Algebra k A] : RT2.FunBT (RT2.DerivedCat k) :=
  sorry

/-- RT.2/mixed-complexes-are-circle-modules: `D(k)^{BT}` is equivalent to mixed complexes localised
at quasi-isomorphisms, the equivalence carrying `−^{hT}`, `−^{tT}`, `−_{hT}` to `CC⁻`, `CP`, `CC`;
the `T`-action on `HH(A/k)` corresponds to `(C(A/k), b, B)`, and `HH(A/k)` is the
Eilenberg–Mac Lane object of `RT2.hhRelSpectrum`. -/
theorem mixedComplexesAreCircleModules (k : Type) [CommRing k] :
    ∃ e : RT2.MixedComplexes k ≌ RT2.FunBT (RT2.DerivedCat k),
      (∀ M : RT2.MixedComplex k,
        Nonempty (RT2.FunBT.hFixed _ (e.functor.obj (RT2.MixedComplexes.of M)) ≅ M.negCyclic) ∧
        Nonempty (RT2.FunBT.tate _ (e.functor.obj (RT2.MixedComplexes.of M)) ≅ M.periodicCyclic) ∧
        Nonempty (RT2.FunBT.hOrbits _ (e.functor.obj (RT2.MixedComplexes.of M)) ≅ M.cyclic)) ∧
      ∀ (A : Type) [Ring A] [Algebra k A],
        Nonempty (e.functor.obj (RT2.MixedComplexes.of (RT2.hochschildMixed k A)) ≅ RT2.hhDk k A) ∧
        Nonempty (RT2.funBTSpectrum.functor.obj
          ((RT2.FunBT.postcomp (RT2.DerivedCat.toSpectrum k)).obj (RT2.hhDk k A)) ≅
            RT2.hhRelSpectrum k A) := sorry

/-! ### RT.2/norm-sequence-hc -/

/-- RT.2/norm-sequence-hc, after the Eilenberg–Mac Lane functor: for a `k`-algebra `A`,
`ΣHC(A/k) → HC⁻(A/k) → HP(A/k)` is the circle norm sequence of `HH(A/k)`, with `can` the second
map; on homotopy `HC_{n−1} → HC⁻_n → HP_n` is exact (exactness at the other terms follows from
the cofibre sequence and is not restated). -/
theorem normSequenceHc (k A : Type) [CommRing k] [Ring A] [Algebra k A] :
    RT2.IsCofibreSequence (circleNorm.app (RT2.hhRelSpectrum k A))
        (RT2.circleTateCan.app (RT2.hhRelSpectrum k A)) ∧
    ∀ n : ℤ,
      Function.Exact (Spectrum.homotopyGroupMap (circleNorm.app (RT2.hhRelSpectrum k A)) n)
        (Spectrum.homotopyGroupMap (RT2.circleTateCan.app (RT2.hhRelSpectrum k A)) n) ∧
      Nonempty (((RT2.hOrbits T ⋙ RT2.suspension).obj (RT2.hhRelSpectrum k A)).homotopyGroup n ≃+
        (homotopyOrbits (RT2.hhRelSpectrum k A)).homotopyGroup (n - 1)) := sorry

/-! ### RT.2/thh-spherical-group-rings -/

/-- `E_1`-monoids in spaces, and the spherical monoid ring `S[M] = Σ^∞_+ M`. -/
def RT2.E1MonoidSpace : Type 1 := sorry
def RT2.sphericalMonoidRing (M : RT2.E1MonoidSpace) : E1Ring := sorry

/-- Spaces with `T`-action, and `Σ^∞_+ : Fun(BT, S) → Sp^{BT}`. -/
def RT2.SpaceT : Type 1 := sorry
instance RT2.instCategorySpaceT : Category.{0} RT2.SpaceT := sorry
def RT2.suspT : RT2.SpaceT ⥤ SpectraWithAction T := sorry

/-- The cyclic bar construction `B^{cyc} M` with its `T`-action. -/
def RT2.cyclicBar (M : RT2.E1MonoidSpace) : RT2.SpaceT := sorry

/-- `Z^{hC_p}` with its residual `T ≅ T/C_p`-action, for spaces and for spectra. -/
def RT2.spaceHFixedResidual (p : ℕ) (Z : RT2.SpaceT) : RT2.SpaceT := sorry
def RT2.residualHFixed (p : ℕ) (X : SpectraWithAction T) : SpectraWithAction T := sorry

/-- `ψ_p : B^{cyc}M → (B^{cyc}M)^{hC_p}` from the diagonal (NS18 Lemma IV.3.1). -/
def RT2.psi (p : ℕ) (M : RT2.E1MonoidSpace) :
    RT2.cyclicBar M ⟶ RT2.spaceHFixedResidual p (RT2.cyclicBar M) := sorry

/-- The assembly `Σ^∞_+(Z^{hC_p}) → (Σ^∞_+ Z)^{hC_p}`. -/
def RT2.assembly (p : ℕ) (Z : RT2.SpaceT) :
    RT2.suspT.obj (RT2.spaceHFixedResidual p Z) ⟶ RT2.residualHFixed p (RT2.suspT.obj Z) := sorry

/-- The residual `can : X^{hC_p} → X^{tC_p}`, and the forgetful map `X^{hC_p} → X`. -/
def RT2.residualCan (p : ℕ) (X : SpectraWithAction T) : RT2.residualHFixed p X ⟶ residualTate p X :=
  sorry
def RT2.residualHFixedToUnderlying (p : ℕ) (X : SpectraWithAction T) :
    (RT2.residualHFixed p X).underlying ⟶ X.underlying := sorry

/-- Connected pointed spaces, loop monoids `ΩY` and free loop spaces `LY = Map(S¹, Y)` with the
rotation action. -/
def RT2.PointedConnectedSpace : Type 1 := sorry
def RT2.loopMonoid (Y : RT2.PointedConnectedSpace) : RT2.E1MonoidSpace := sorry
def RT2.freeLoopSpace (Y : RT2.PointedConnectedSpace) : RT2.SpaceT := sorry

/-- `Σ^∞_+` of the map `LY → LY` induced by the `p`-fold cover `S¹ → S¹`. -/
def RT2.loopPower (p : ℕ) (Y : RT2.PointedConnectedSpace) :
    (RT2.suspT.obj (RT2.freeLoopSpace Y)).underlying ⟶
      (RT2.suspT.obj (RT2.freeLoopSpace Y)).underlying := sorry

/-- The `T`-transfer `ΣX_{hT} → X`. -/
def RT2.transferT (X : SpectraWithAction T) : (homotopyOrbits X).shift 1 ⟶ X.underlying := sorry

/-- `p`-completion on maps. -/
def RT2.pCompletionOfMap (p : ℕ) {X Y : Spectrum} (f : X ⟶ Y) :
    Spectrum.pCompletion p X ⟶ Spectrum.pCompletion p Y := sorry

/-- RT.2/thh-spherical-group-rings: `THH(S[M]) ≃ Σ^∞_+ B^{cyc}M` with `φ_p` the composite
`Σ^∞_+ψ_p`, assembly and `can`; for `M = ΩY`, `B^{cyc}ΩY ≃ LY` and `THH(S[ΩY]) ≃ Σ^∞_+ LY`; for
bounded below `p`-complete cyclotomic `X` with a Frobenius lift `φ̃_p : X → X^{hC_p}`, `TC(X)` is
the pullback of `tr : ΣX_{hT} → X` and `id − φ̃_p`; hence `TC(S[ΩY])^∧_p` is the
Bökstedt–Hsiang–Madsen pullback. -/
theorem thhSphericalGroupRings :
    (∀ (M : RT2.E1MonoidSpace) (p : ℕ) (hp : p.Prime),
      ∃ e : THH (RT2.sphericalMonoidRing M) ≅ RT2.suspT.obj (RT2.cyclicBar M),
        THH.frobenius _ p hp ≫ RT2.residualTateMap p e.hom =
          e.hom ≫ RT2.suspT.map (RT2.psi p M) ≫ RT2.assembly p (RT2.cyclicBar M) ≫
            RT2.residualCan p (RT2.suspT.obj (RT2.cyclicBar M))) ∧
    (∀ Y : RT2.PointedConnectedSpace,
      Nonempty (RT2.cyclicBar (RT2.loopMonoid Y) ≅ RT2.freeLoopSpace Y) ∧
      Nonempty (THH (RT2.sphericalMonoidRing (RT2.loopMonoid Y)) ≅
        RT2.suspT.obj (RT2.freeLoopSpace Y))) ∧
    (∀ (p : ℕ) (hp : p.Prime) (X : CyclotomicSpectrum),
      X.underlying.underlying.IsBoundedBelow → RT2.IsPComplete p X.underlying.underlying →
      ∀ φt : X.underlying ⟶ RT2.residualHFixed p X.underlying,
        φt ≫ RT2.residualCan p X.underlying = X.frobenius p hp →
        ∃ (a : TC X ⟶ (homotopyOrbits X.underlying).shift 1) (b : TC X ⟶ X.underlying.underlying),
          IsPullback a b (RT2.transferT X.underlying)
            (𝟙 _ - RT2.underlyingMap φt ≫ RT2.residualHFixedToUnderlying p X.underlying)) ∧
    ∀ (p : ℕ) [Fact p.Prime] (Y : RT2.PointedConnectedSpace),
      ∃ (a : Spectrum.pCompletion p
              (TC (THH.toCyclotomic (RT2.sphericalMonoidRing (RT2.loopMonoid Y)))) ⟶
            Spectrum.pCompletion p
              ((homotopyOrbits (RT2.suspT.obj (RT2.freeLoopSpace Y))).shift 1))
        (b : Spectrum.pCompletion p
              (TC (THH.toCyclotomic (RT2.sphericalMonoidRing (RT2.loopMonoid Y)))) ⟶
            Spectrum.pCompletion p (RT2.suspT.obj (RT2.freeLoopSpace Y)).underlying),
        IsPullback a b (RT2.pCompletionOfMap p (RT2.transferT (RT2.suspT.obj (RT2.freeLoopSpace Y))))
          (RT2.pCompletionOfMap p (𝟙 _ - RT2.loopPower p Y)) := sorry


end RefinedTraceMethods
namespace RefinedTraceMethods

/-! ## RT.2 — Genuine equivariant homotopy theory (NS18 §§II.2–II.6, §§III.4–III.6)

Declarations for the nodes `RT.2/orthogonal-spectra`, `genuine-g-spectra`,
`geometric-fixed-points`, `borel-completion`, `isotropy-separation`,
`geometric-fixed-points-localisation`, `genuine-cyclic-and-circle-spectra`,
`genuine-cyclotomic-spectrum`, `orthogonal-cyclotomic-spectra`, `tr-and-genuine-tc`,
`restriction-pullback`, `genuine-tc-agrees`, `endofunctor-coalgebras`,
`genuine-cyclotomic-coreflection`, `bounded-below-cyclotomic-equivalence`,
`bokstedt-construction` and `thh-models-agree`.

Helper declarations that are not packet names carry the prefix `RT2G.`. Point-set categories
(orthogonal spectra, orthogonal `G`-spectra, pointed spaces) and the ∞-categories built from
them (genuine `G`-spectra, `F`-genuine `T`-spectra, genuine cyclotomic spectra) are prototyped by
sorry-bodied carriers with category instances, exactly as `Spectrum` is in the prelude; an
∞-categorical localisation is prototyped by the 1-categorical universal property
`RT2G.IsLocalizationAt`. -/

open MonoidalCategory

universe u v

/-! ### General helpers -/

/-- `L : C ⥤ D` is a localisation of `C` at the class `W`: it inverts `W`, every functor
inverting `W` factors through `L` up to isomorphism, and the factorisation is unique up to
isomorphism (the 1-categorical form of the universal property of `C[W⁻¹]`). -/
def RT2G.IsLocalizationAt {C D : Type} [Category.{0} C] [Category.{0} D] (L : C ⥤ D)
    (W : MorphismProperty C) : Prop :=
  (∀ ⦃X Y : C⦄ (f : X ⟶ Y), W f → IsIso (L.map f)) ∧
  ∀ (E : Type) [Category.{0} E] (F : C ⥤ E),
    (∀ ⦃X Y : C⦄ (f : X ⟶ Y), W f → IsIso (F.map f)) →
      (∃ F' : D ⥤ E, Nonempty (L ⋙ F' ≅ F)) ∧
        ∀ F₁ F₂ : D ⥤ E, Nonempty (L ⋙ F₁ ≅ L ⋙ F₂) → Nonempty (F₁ ≅ F₂)

/-- `L` with projections `π n : L ⟶ X n` is the sequential limit of the tower
`⋯ → X 2 → X 1 → X 0` with bonding maps `f n : X (n+1) ⟶ X n`. -/
def RT2G.IsSeqLimit {D : Type u} [Category.{v} D] {X : ℕ → D} (f : ∀ n, X (n + 1) ⟶ X n)
    {L : D} (π : ∀ n, L ⟶ X n) : Prop :=
  (∀ n, π (n + 1) ≫ f n = π n) ∧
    ∀ (Z : D) (g : ∀ n, Z ⟶ X n), (∀ n, g (n + 1) ≫ f n = g n) →
      ∃! h : Z ⟶ L, ∀ n, h ≫ π n = g n

/-- Stable categories, read on a categorical prototype: finite limits and colimits, a zero
object, and a commutative square is a pullback iff it is a pushout. -/
class RT2G.Stable (D : Type u) [Category.{v} D] : Prop where
  hasFiniteLimits : Limits.HasFiniteLimits D
  hasFiniteColimits : Limits.HasFiniteColimits D
  hasZero : Limits.HasZeroObject D
  pullback_iff_pushout : ∀ {A B X Y : D} (f : A ⟶ B) (g : A ⟶ X) (h : B ⟶ Y) (k : X ⟶ Y),
    IsPullback f g h k ↔ IsPushout f g h k

/-- The inclusion of the fibre `fib g → X` of a map `g : X ⟶ Y` of spectra. -/
def RT2G.fibInclusion {X Y : Spectrum} (g : X ⟶ Y) : Spectrum.fib g ⟶ X := sorry

/-- `A → B → C` is a fibre sequence: `f` is identified with the fibre inclusion of `g`. -/
def RT2G.IsFibreSequence {A B D : Spectrum} (f : A ⟶ B) (g : B ⟶ D) : Prop :=
  ∃ e : A ≅ Spectrum.fib g, e.hom ≫ RT2G.fibInclusion g = f

/-- The smash product makes `Sp` symmetric monoidal (StableHomotopyKTheory H.5); used locally
in this part to state (lax) monoidality of fixed-point functors. -/
abbrev RT2G.spectrumMonoidal : MonoidalCategory Spectrum := sorry

attribute [local instance] RT2G.spectrumMonoidal

/-- The symmetry of the smash product of spectra. -/
abbrev RT2G.spectrumSymmetric : SymmetricCategory Spectrum := sorry

attribute [local instance] RT2G.spectrumSymmetric

/-- The pointwise symmetric monoidal structure on `Sp^{BG}` (used locally in this part). -/
abbrev RT2G.swaMonoidal (G : Type) [Group G] : MonoidalCategory (SpectraWithAction G) := sorry

attribute [local instance] RT2G.swaMonoidal

/-- The symmetry of the pointwise smash product on `Sp^{BG}`. -/
abbrev RT2G.swaSymmetric (G : Type) [Group G] : SymmetricCategory (SpectraWithAction G) := sorry

attribute [local instance] RT2G.swaSymmetric

/-- Restriction `Sp^{BG} → Sp^{BH}` along a group homomorphism `H → G`. -/
def RT2G.SpectraWithAction.res {G H : Type} [Group G] [Group H] (f : H →* G) :
    SpectraWithAction G ⥤ SpectraWithAction H := sorry

/-- Homotopy fixed points `−^{hG} : Sp^{BG} → Sp` as a functor. -/
def RT2G.hfpFunctor (G : Type) [Group G] : SpectraWithAction G ⥤ Spectrum where
  obj X := homotopyFixedPoints X
  map f := sorry
  map_id := sorry
  map_comp := sorry

/-- Homotopy orbits `−_{hG} : Sp^{BG} → Sp` as a functor. -/
def RT2G.hoFunctor (G : Type) [Group G] : SpectraWithAction G ⥤ Spectrum where
  obj X := homotopyOrbits X
  map f := sorry
  map_id := sorry
  map_comp := sorry

/-- The Tate construction `−^{tG} : Sp^{BG} → Sp` of a finite group as a functor. -/
def RT2G.tateFunctor (G : Type) [Group G] [Finite G] : SpectraWithAction G ⥤ Spectrum where
  obj X := @tateConstruction G _ (Fintype.ofFinite G) X
  map f := sorry
  map_id := sorry
  map_comp := sorry

/-- The canonical map `can : X^{hG} → X^{tG}` (cofibre of the norm). -/
def RT2G.hfpToTate (G : Type) [Group G] [Finite G] : RT2G.hfpFunctor G ⟶ RT2G.tateFunctor G :=
  sorry

/-- `−^{hG}` is lax symmetric monoidal (RT.2/homotopy-orbits-fixed-points). -/
instance RT2G.hfpFunctor_laxMonoidal (G : Type) [Group G] : (RT2G.hfpFunctor G).LaxMonoidal :=
  sorry

/-- The residual Tate construction `−^{tH} : Sp^{BG} → Sp^{B(G/H)}` for a normal subgroup `H` of
a finite group. -/
def RT2G.residualTateFinite {G : Type} [Group G] [Finite G] (H : Subgroup G) [H.Normal] :
    SpectraWithAction G ⥤ SpectraWithAction (G ⧸ H) := sorry

/-- The map `X^{hG} = (X^{hH})^{h(G/H)} → (X^{tH})^{h(G/H)}`. -/
def RT2G.hfpToResidualTate {G : Type} [Group G] [Finite G] (H : Subgroup G) [H.Normal] :
    RT2G.hfpFunctor G ⟶ RT2G.residualTateFinite H ⋙ RT2G.hfpFunctor (G ⧸ H) := sorry

/-- The subgroup `C_p ⊂ C_{p^{n+1}}` of order `p`, generated by `p^n`. -/
def RT2G.cpSub (p n : ℕ) : Subgroup (C (p ^ (n + 1))) :=
  Subgroup.zpowers (Multiplicative.ofAdd ((p ^ n : ℕ) : ZMod (p ^ (n + 1))))

/-! ### Pointed spaces (point-set helpers) -/

/-- Compactly generated weak Hausdorff pointed spaces, prototyped by a category. -/
def RT2G.PointedSpace : Type := sorry

instance RT2G.PointedSpace.instCategory : Category.{0} RT2G.PointedSpace := sorry

/-- The smash product of pointed spaces. -/
instance RT2G.PointedSpace.instMonoidal : MonoidalCategory RT2G.PointedSpace := sorry

/-- The symmetry (twist) `A ∧ B ≅ B ∧ A` of the smash product. -/
instance RT2G.PointedSpace.instSymmetric : SymmetricCategory RT2G.PointedSpace := sorry

/-- The sphere `S^n` (one-point compactification of `ℝ^n`). -/
def RT2G.PointedSpace.sphere (n : ℕ) : RT2G.PointedSpace := sorry

/-- The canonical homeomorphism `S^m ∧ S^n ≅ S^{m+n}` (from `ℝ^m × ℝ^n = ℝ^{m+n}`). -/
def RT2G.PointedSpace.sphereMul (m n : ℕ) :
    RT2G.PointedSpace.sphere m ⊗ RT2G.PointedSpace.sphere n ⟶ RT2G.PointedSpace.sphere (m + n) :=
  sorry

/-- Pointed `G`-spaces `Fun(BG, Top_*)`. -/
abbrev RT2G.PointedGSpace (G : Type) [Group G] := SingleObj G ⥤ RT2G.PointedSpace

/-- Point-set fixed points `Y ↦ Y^G` of a pointed `G`-space. -/
def RT2G.PointedGSpace.fixedPoints (G : Type) [Group G] :
    RT2G.PointedGSpace G ⥤ RT2G.PointedSpace := sorry

/-- The suspension spectrum `Σ^∞ : Top_* → Sp`. -/
def RT2G.suspensionSpectrum : RT2G.PointedSpace ⥤ Spectrum := sorry

/-! ### RT.2/orthogonal-spectra -/

/-- Orthogonal spectra (RT.2/orthogonal-spectra): sequences of pointed spaces `X_n` with
continuous based `O(n)`-actions and structure maps `σ_n : X_n ∧ S¹ → X_{n+1}` whose iterates
`X_n ∧ S^m → X_{n+m}` are `O(n) × O(m)`-equivariant, with levelwise equivariant maps
commuting with the structure maps. Prototyped by a category. -/
def OrthogonalSpectrum : Type := sorry

instance RT2G.OrthogonalSpectrum.instCategory : Category.{0} OrthogonalSpectrum := sorry

/-- The `n`-th space `X_n` of an orthogonal spectrum. -/
def RT2G.OrthogonalSpectrum.level (X : OrthogonalSpectrum) (n : ℕ) : RT2G.PointedSpace := sorry

/-- The homotopy groups `π_i X = colim_n π_{i+n} X_n` (`i ∈ ℤ`) of an orthogonal spectrum. -/
def OrthogonalSpectrum.homotopyGroup (X : OrthogonalSpectrum) (i : ℤ) : Type := sorry

instance RT2G.OrthogonalSpectrum.instAddCommGroup (X : OrthogonalSpectrum) (i : ℤ) :
    AddCommGroup (X.homotopyGroup i) := sorry

/-- The map on `π_i` induced by a map of orthogonal spectra. -/
def RT2G.OrthogonalSpectrum.homotopyGroupMap {X Y : OrthogonalSpectrum} (f : X ⟶ Y) (i : ℤ) :
    X.homotopyGroup i →+ Y.homotopyGroup i := sorry

/-- A stable equivalence of orthogonal spectra: a map inducing isomorphisms on all `π_i`. -/
def RT2G.OrthogonalSpectrum.IsStableEquiv {X Y : OrthogonalSpectrum} (f : X ⟶ Y) : Prop :=
  ∀ i : ℤ, Function.Bijective (RT2G.OrthogonalSpectrum.homotopyGroupMap f i)

/-- The smash product of orthogonal spectra (the Day convolution over `O(n)`-equivariant
sequences, coequalised over the sphere), a monoidal structure on `Sp^O`; its unit is the sphere
spectrum (`RT2G.OrthogonalSpectrum.smash_unit`), and it is symmetric and closed
(`RT2G.OrthogonalSpectrum.instSymmetric`, `RT2G.OrthogonalSpectrum.instClosed`). -/
instance OrthogonalSpectrum.smash : MonoidalCategory OrthogonalSpectrum := sorry

/-- The smash product of orthogonal spectra is symmetric. -/
instance RT2G.OrthogonalSpectrum.instSymmetric : SymmetricCategory OrthogonalSpectrum := sorry

/-- The smash product of orthogonal spectra is closed. -/
instance RT2G.OrthogonalSpectrum.instClosed : MonoidalClosed OrthogonalSpectrum := sorry

/-- The orthogonal sphere spectrum `S`, with `S_n = S^n` and `O(n)` acting on `ℝ^n`. -/
def RT2G.OrthogonalSpectrum.sphere : OrthogonalSpectrum := sorry

/-- The unit of the smash product is the sphere spectrum. -/
theorem RT2G.OrthogonalSpectrum.smash_unit :
    Nonempty (𝟙_ OrthogonalSpectrum ≅ RT2G.OrthogonalSpectrum.sphere) := sorry

/-- The `n`-th space of the sphere is `S^n`. -/
theorem RT2G.OrthogonalSpectrum.sphere_level (n : ℕ) :
    Nonempty (RT2G.OrthogonalSpectrum.level RT2G.OrthogonalSpectrum.sphere n ≅
      RT2G.PointedSpace.sphere n) := sorry

/-- The functor `Sp^O → Sp` to the ∞-category of spectra. -/
def RT2G.OrthogonalSpectrum.toSpectrum : OrthogonalSpectrum ⥤ Spectrum := sorry

/-- Symmetric spectra (StableHomotopyKTheory H.5:spectra), prototyped by a category. -/
def RT2G.SymmetricSpectrum : Type := sorry

instance RT2G.SymmetricSpectrum.instCategory : Category.{0} RT2G.SymmetricSpectrum := sorry

/-- The functor from symmetric spectra to the ∞-category of spectra they present. -/
def RT2G.SymmetricSpectrum.toSpectrum : RT2G.SymmetricSpectrum ⥤ Spectrum := sorry

/-- The forgetful functor from orthogonal to symmetric spectra (restricting the `O(n)`-actions
to `Σ_n ⊂ O(n)`). -/
def RT2G.OrthogonalSpectrum.forgetToSymmetric : OrthogonalSpectrum ⥤ RT2G.SymmetricSpectrum :=
  sorry

/-- Orthogonal and symmetric spectra both present `Sp` (Mandell–May–Schwede–Shipley): the
forgetful functor to symmetric spectra commutes with the functors to `Sp`, and `Sp^O → Sp` is
the localisation at the stable equivalences; hence the forgetful functor (a right Quillen
equivalence) induces an equivalence of the localisations. -/
theorem OrthogonalSpectrum.toSymmetric :
    Nonempty (RT2G.OrthogonalSpectrum.forgetToSymmetric ⋙ RT2G.SymmetricSpectrum.toSpectrum ≅
      RT2G.OrthogonalSpectrum.toSpectrum) ∧
    RT2G.IsLocalizationAt RT2G.OrthogonalSpectrum.toSpectrum
      (fun _ _ f => RT2G.OrthogonalSpectrum.IsStableEquiv f) := sorry

/-- Stable equivalences (the `π_*`-isomorphisms) are exactly the maps that become equivalences
in `Sp`. -/
theorem OrthogonalSpectrum.StableEquiv {X Y : OrthogonalSpectrum} (f : X ⟶ Y) :
    RT2G.OrthogonalSpectrum.IsStableEquiv f ↔ IsIso (RT2G.OrthogonalSpectrum.toSpectrum.map f) :=
  sorry

/-- Test `OrthogonalSpectrum.sphere_pi0` (computation): `π_0` of the orthogonal sphere spectrum
is `ℤ`. -/
example : Nonempty (RT2G.OrthogonalSpectrum.sphere.homotopyGroup 0 ≃+ ℤ) := sorry

/-- The constant orthogonal spectrum at the point. -/
def RT2G.OrthogonalSpectrum.point : OrthogonalSpectrum := sorry

/-- Test `OrthogonalSpectrum.zero` (degenerate): the constant point spectrum is a zero object. -/
example : Limits.IsZero RT2G.OrthogonalSpectrum.point := sorry

/-- Test `OrthogonalSpectrum.not_sequential`: the suspension braiding on S¹∧S¹ has degree −1. -/
example : (β_ (RT2G.PointedSpace.sphere 1) (RT2G.PointedSpace.sphere 1)).hom ≫
      RT2G.PointedSpace.sphereMul 1 1 ≠ RT2G.PointedSpace.sphereMul 1 1 := sorry

/-! ### RT.2/genuine-g-spectra -/

/-- Orthogonal `G`-spectra `GSp^O = Fun(BG, Sp^O)` (smash product with diagonal action),
extended to representations by `X(V) = L(ℝ^n, V)_+ ∧_{O(n)} X_n` for `dim V = n`. -/
abbrev RT2G.OrthogonalGSpectrum (G : Type) [Group G] := SingleObj G ⥤ OrthogonalSpectrum

/-- Restriction of orthogonal `G`-spectra along a group homomorphism `H → G`. -/
def RT2G.OrthogonalGSpectrum.res {G H : Type} [Group G] [Group H] (f : H →* G) :
    RT2G.OrthogonalGSpectrum G ⥤ RT2G.OrthogonalGSpectrum H :=
  (Functor.whiskeringLeft _ _ _).obj (SingleObj.mapHom H G f)

/-- The underlying orthogonal spectrum of an orthogonal `G`-spectrum. -/
def RT2G.OrthogonalGSpectrum.forget (G : Type) [Group G] :
    RT2G.OrthogonalGSpectrum G ⥤ OrthogonalSpectrum :=
  (evaluation (SingleObj G) OrthogonalSpectrum).obj (SingleObj.star G)

/-- The point-set geometric fixed points `Φ^H X` (`H ⊆ G`) of an orthogonal `G`-spectrum, with
`n`-th space `X(ℝ^n ⊗ ρ_H)^H` for `ρ_H` the regular representation of `H`. -/
def RT2G.OrthogonalGSpectrum.geometricFixedPoints {G : Type} [Group G] (H : Subgroup G) :
    RT2G.OrthogonalGSpectrum G ⥤ OrthogonalSpectrum := sorry

/-- Genuine `G`-spectra `GSp` for a finite group `G` (RT.2/genuine-g-spectra): the localisation
`N(GSp^O)[W⁻¹]` of orthogonal `G`-spectra at the maps `f` with `Φ^H f` a stable equivalence for
every subgroup `H ⊆ G` (`RT2G.GenuineSpectrum.localization_isLocalization`), symmetric monoidal
via the cofibrant smash product. -/
def GenuineSpectrum (G : Type) [Group G] [Finite G] : Type := sorry

instance RT2G.GenuineSpectrum.instCategory (G : Type) [Group G] [Finite G] :
    Category.{0} (GenuineSpectrum G) := sorry

/-- The (derived) smash product of genuine `G`-spectra. -/
instance RT2G.GenuineSpectrum.instMonoidal (G : Type) [Group G] [Finite G] :
    MonoidalCategory (GenuineSpectrum G) := sorry

instance RT2G.GenuineSpectrum.instSymmetric (G : Type) [Group G] [Finite G] :
    SymmetricCategory (GenuineSpectrum G) := sorry

/-- The localisation functor `GSp^O → GSp`. -/
def RT2G.GenuineSpectrum.localization (G : Type) [Group G] [Finite G] :
    RT2G.OrthogonalGSpectrum G ⥤ GenuineSpectrum G := sorry

/-- `GSp` is the localisation of orthogonal `G`-spectra at the maps inducing stable
equivalences on all point-set geometric fixed points `Φ^H`. -/
theorem RT2G.GenuineSpectrum.localization_isLocalization (G : Type) [Group G] [Finite G] :
    RT2G.IsLocalizationAt (RT2G.GenuineSpectrum.localization G)
      (fun _ _ f => ∀ H : Subgroup G,
        RT2G.OrthogonalSpectrum.IsStableEquiv
          ((RT2G.OrthogonalGSpectrum.geometricFixedPoints H).map f)) := sorry

/-- Genuine fixed points `−^H : GSp → Sp` for `H ⊆ G`, induced by set-theoretic fixed points of
orthogonal `G`-Ω-spectra; lax symmetric monoidal
(`RT2G.GenuineSpectrum.fixedPoints_laxBraided`). -/
def GenuineSpectrum.fixedPoints {G : Type} [Group G] [Finite G] (H : Subgroup G) :
    GenuineSpectrum G ⥤ Spectrum := sorry

/-- The genuine fixed points are lax symmetric monoidal. -/
instance RT2G.GenuineSpectrum.fixedPoints_laxBraided {G : Type} [Group G] [Finite G]
    (H : Subgroup G) : (GenuineSpectrum.fixedPoints H).LaxBraided := sorry

/-- Geometric fixed points `Φ^H : GSp → Sp` for `H ⊆ G` (derived from the point-set `Φ^H`);
symmetric monoidal (`RT2G.GenuineSpectrum.geometricFixedPoints_braided`). -/
def GenuineSpectrum.geometricFixedPoints {G : Type} [Group G] [Finite G] (H : Subgroup G) :
    GenuineSpectrum G ⥤ Spectrum := sorry

/-- The geometric fixed points are (strong) symmetric monoidal. -/
instance RT2G.GenuineSpectrum.geometricFixedPoints_braided {G : Type} [Group G] [Finite G]
    (H : Subgroup G) : (GenuineSpectrum.geometricFixedPoints H).Braided := sorry

/-- The geometric fixed points `Φ^G` of `GSp` are derived from the point-set ones. -/
theorem RT2G.GenuineSpectrum.geometricFixedPoints_localization {G : Type} [Group G] [Finite G]
    (H : Subgroup G) :
    Nonempty (RT2G.GenuineSpectrum.localization G ⋙ GenuineSpectrum.geometricFixedPoints H ≅
      RT2G.OrthogonalGSpectrum.geometricFixedPoints H ⋙ RT2G.OrthogonalSpectrum.toSpectrum) :=
  sorry

/-- The forgetful functor `GSp → Sp^{BG}`; the transformation `−^H → −^{hH}` through it is
`RT2G.GenuineSpectrum.fixedToHomotopyFixed`. -/
def GenuineSpectrum.toBorel {G : Type} [Group G] [Finite G] :
    GenuineSpectrum G ⥤ SpectraWithAction G := sorry

/-- The forgetful functor `GSp → Sp^{BG}` is symmetric monoidal. -/
instance RT2G.GenuineSpectrum.toBorel_braided {G : Type} [Group G] [Finite G] :
    (GenuineSpectrum.toBorel (G := G)).Braided := sorry

/-- The lax symmetric monoidal transformation `X^H → X^{hH}` for `H ⊆ G`. -/
def RT2G.GenuineSpectrum.fixedToHomotopyFixed {G : Type} [Group G] [Finite G]
    (H : Subgroup G) :
    GenuineSpectrum.fixedPoints H ⟶
      GenuineSpectrum.toBorel ⋙ RT2G.SpectraWithAction.res H.subtype ⋙ RT2G.hfpFunctor H :=
  sorry

/-- The transformation `X^G → X^{hG}` (the case `H = G`, with `Sp^{BG}` not restricted). -/
def RT2G.GenuineSpectrum.fixedToHFP (G : Type) [Group G] [Finite G] :
    GenuineSpectrum.fixedPoints (⊤ : Subgroup G) ⟶
      GenuineSpectrum.toBorel ⋙ RT2G.hfpFunctor G := sorry

/-- A map of genuine `G`-spectra is an equivalence iff all its geometric fixed points
`Φ^H f` (`H ⊆ G`) are equivalences. -/
theorem GenuineSpectrum.equiv_iff {G : Type} [Group G] [Finite G] {X Y : GenuineSpectrum G}
    (f : X ⟶ Y) : IsIso f ↔ ∀ H : Subgroup G, IsIso ((GenuineSpectrum.geometricFixedPoints H).map f) :=
  sorry

/-- The Burnside ring `A(G)`: the Grothendieck ring of finite `G`-sets under disjoint union and
product. -/
def RT2G.BurnsideRing (G : Type) [Group G] [Finite G] : Type := sorry

instance RT2G.BurnsideRing.instCommRing (G : Type) [Group G] [Finite G] :
    CommRing (RT2G.BurnsideRing G) := sorry

/-- The mark homomorphism at `G`: `[S] ↦ #S^G`, the projection onto the geometric part. -/
def RT2G.BurnsideRing.fixedMark (G : Type) [Group G] [Finite G] : RT2G.BurnsideRing G →+* ℤ :=
  sorry

/-- The E_∞-ring `(S_G)^G`, the genuine fixed points of the `G`-sphere (lax monoidality of
`−^G`). -/
def RT2G.GenuineSpectrum.sphereFixedRing (G : Type) [Group G] [Finite G] : E1Ring := sorry

/-- The underlying spectrum of `RT2G.GenuineSpectrum.sphereFixedRing G` is `(S_G)^G`. -/
theorem RT2G.GenuineSpectrum.sphereFixedRing_toSpectrum (G : Type) [Group G] [Finite G] :
    Nonempty ((RT2G.GenuineSpectrum.sphereFixedRing G).toSpectrum ≅
      (GenuineSpectrum.fixedPoints (⊤ : Subgroup G)).obj (𝟙_ (GenuineSpectrum G))) := sorry

/-- tom Dieck–Segal: `π_0((S_G)^G) ≅ A(G)`, the Burnside ring, as rings. -/
theorem GenuineSpectrum.burnside (G : Type) [Group G] [Finite G] :
    Nonempty ((RT2G.GenuineSpectrum.sphereFixedRing G).pi0 ≃+* RT2G.BurnsideRing G) := sorry

/-- The Borel completion `B_G : Sp^{BG} → GSp`, the right adjoint of `GSp → Sp^{BG}`
(RT.2/borel-completion). -/
def RT2G.GenuineSpectrum.borel (G : Type) [Group G] [Finite G] :
    SpectraWithAction G ⥤ GenuineSpectrum G := sorry

/-- Test `GenuineSpectrum.trivialGroup` (degenerate): for `G = 1`, `GSp ≃ Sp`. -/
example : Nonempty (GenuineSpectrum Unit ≌ Spectrum) := sorry

/-- Test `GenuineSpectrum.burnside_C2` (computation): `π_0(S_{C_2})^{C_2} ≅ ℤ²`, the Burnside
ring of `C_2`. -/
example : Nonempty
    (((GenuineSpectrum.fixedPoints (⊤ : Subgroup (C 2))).obj
      (𝟙_ (GenuineSpectrum (C 2)))).homotopyGroup 0 ≃+ ℤ × ℤ) := sorry

/-- Test `GenuineSpectrum.not_borel` (non-example): `GSp → Sp^{BG}` is not an equivalence: the
`C_2`-sphere and its Borel completion have different genuine fixed points
(`π_0 = A(C_2) ≅ ℤ²` versus `ℤ ⊕ ℤ_2^∧`). -/
example : ¬ (GenuineSpectrum.toBorel (G := C 2)).IsEquivalence ∧
    Nonempty (((GenuineSpectrum.fixedPoints (⊤ : Subgroup (C 2))).obj
      (𝟙_ (GenuineSpectrum (C 2)))).homotopyGroup 0 ≃+ ℤ × ℤ) ∧
    Nonempty (((GenuineSpectrum.fixedPoints (⊤ : Subgroup (C 2))).obj
      ((RT2G.GenuineSpectrum.borel (C 2)).obj
        (GenuineSpectrum.toBorel.obj (𝟙_ (GenuineSpectrum (C 2)))))).homotopyGroup 0 ≃+
      ℤ × ℤ_[2]) := sorry

/-! ### RT.2/geometric-fixed-points -/

/-- Geometric fixed points via the complete universe (RT.2/geometric-fixed-points):
`Φ^H_U : GSp^O → (G/H)Sp^O` for `H ⊆ G` normal, with `n`-th space
`hocolim_{V ⊂ U, V^H = 0} X(ℝ^n ⊕ V)^H` (Bousfield–Kan homotopy colimit). The complete
`G`-universe `U` (a countable sum of all irreducible representations) is fixed once and for all;
`U^H` is then a complete `G/H`-universe. -/
def geometricFixedPoints.universe {G : Type} [Group G] (H : Subgroup G) [H.Normal] :
    RT2G.OrthogonalGSpectrum G ⥤ RT2G.OrthogonalGSpectrum (G ⧸ H) := sorry

/-- The natural zig-zag of stable equivalences `Φ^G X ≃ Φ^G_U X`, as an isomorphism of the
induced functors to `Sp`. -/
def geometricFixedPoints.zigzag (G : Type) [Group G] [Finite G] :
    RT2G.OrthogonalGSpectrum.geometricFixedPoints (⊤ : Subgroup G) ⋙
        RT2G.OrthogonalSpectrum.toSpectrum ≅
      geometricFixedPoints.universe (⊤ : Subgroup G) ⋙ RT2G.OrthogonalGSpectrum.forget (G ⧸ ⊤) ⋙
        RT2G.OrthogonalSpectrum.toSpectrum := sorry

/-- Geometric fixed points compose: `Φ^{H′/H}_{U^H} Φ^H_U X ≃ Φ^{H′}_U X` for normal
`H ⊆ H′ ⊆ G`, as genuine `G/H′`-spectra (using `(G/H)/(H′/H) ≅ G/H′`). -/
theorem geometricFixedPoints.comp {G : Type} [Group G] [Finite G] (H H' : Subgroup G) [H.Normal]
    [H'.Normal] (h : H ≤ H') :
    Nonempty (geometricFixedPoints.universe H ⋙
        geometricFixedPoints.universe (H'.map (QuotientGroup.mk' H)) ⋙
        RT2G.OrthogonalGSpectrum.res
          (QuotientGroup.quotientQuotientEquivQuotient H H' h).symm.toMonoidHom ⋙
        RT2G.GenuineSpectrum.localization (G ⧸ H') ≅
      geometricFixedPoints.universe H' ⋙ RT2G.GenuineSpectrum.localization (G ⧸ H')) := sorry

/-- The genuine suspension spectrum `Σ^∞_G : Top_*^{BG} → GSp`. -/
def RT2G.GenuineSpectrum.suspension (G : Type) [Group G] [Finite G] :
    RT2G.PointedGSpace G ⥤ GenuineSpectrum G := sorry

/-- `Φ^G Σ^∞_G Y ≃ Σ^∞ (Y^G)`, naturally in the pointed `G`-space `Y`. -/
theorem geometricFixedPoints.suspension (G : Type) [Group G] [Finite G] :
    Nonempty (RT2G.GenuineSpectrum.suspension G ⋙
        GenuineSpectrum.geometricFixedPoints (⊤ : Subgroup G) ≅
      RT2G.PointedGSpace.fixedPoints G ⋙ RT2G.suspensionSpectrum) := sorry

/-- Test `geometricFixedPoints.trivial` (degenerate): `Φ^{1} = id` (with `G/1 ≅ G`). -/
example (G : Type) [Group G] [Finite G] :
    Nonempty (geometricFixedPoints.universe (⊥ : Subgroup G) ⋙
        RT2G.OrthogonalGSpectrum.res (QuotientGroup.quotientBot (G := G)).symm.toMonoidHom ⋙
        RT2G.GenuineSpectrum.localization G ≅
      RT2G.GenuineSpectrum.localization G) := sorry

/-- Test `geometricFixedPoints.sphere` (computation): `Φ^{C_p} S_{C_p} = S` (fixed points of
spheres of representations with `V^{C_p} = 0` are `S^0`). -/
example (p : ℕ) [Fact p.Prime] :
    Nonempty ((GenuineSpectrum.geometricFixedPoints (⊤ : Subgroup (C p))).obj
      (𝟙_ (GenuineSpectrum (C p))) ≅ Spectrum.sphere) := sorry

/-- Test `geometricFixedPoints.not_fixed` (non-example): `Φ^{C_p} ≠ −^{C_p}`: for the
`C_p`-sphere, `π_0 Φ^{C_p} = ℤ` but `π_0 (S)^{C_p} = A(C_p) = ℤ²`. -/
example (p : ℕ) [Fact p.Prime] :
    Nonempty (((GenuineSpectrum.geometricFixedPoints (⊤ : Subgroup (C p))).obj
      (𝟙_ (GenuineSpectrum (C p)))).homotopyGroup 0 ≃+ ℤ) ∧
    Nonempty (((GenuineSpectrum.fixedPoints (⊤ : Subgroup (C p))).obj
      (𝟙_ (GenuineSpectrum (C p)))).homotopyGroup 0 ≃+ ℤ × ℤ) := sorry

/-! ### Residual fixed points and the maps of isotropy separation (helpers) -/

/-- The underlying spectrum functor `Sp^{BG} → Sp`. -/
def RT2G.SpectraWithAction.forget (G : Type) [Group G] : SpectraWithAction G ⥤ Spectrum where
  obj X := X.underlying
  map f := sorry
  map_id := sorry
  map_comp := sorry

/-- Restriction of genuine spectra along an injective group homomorphism `H → G`. -/
def RT2G.GenuineSpectrum.res {G H : Type} [Group G] [Finite G] [Group H] [Finite H]
    (f : H →* G) : GenuineSpectrum G ⥤ GenuineSpectrum H := sorry

/-- Residual genuine fixed points `−^H : GSp → (G/H)Sp` for `H ⊆ G` normal. -/
def RT2G.GenuineSpectrum.fixedPointsResidual {G : Type} [Group G] [Finite G] (H : Subgroup G)
    [H.Normal] : GenuineSpectrum G ⥤ GenuineSpectrum (G ⧸ H) := sorry

/-- Residual geometric fixed points `Φ^H : GSp → (G/H)Sp` for `H ⊆ G` normal (derived from
`geometricFixedPoints.universe`). -/
def RT2G.GenuineSpectrum.geometricFixedPointsResidual {G : Type} [Group G] [Finite G]
    (H : Subgroup G) [H.Normal] : GenuineSpectrum G ⥤ GenuineSpectrum (G ⧸ H) := sorry

/-- The residual geometric fixed points are derived from `Φ^H_U`. -/
theorem RT2G.GenuineSpectrum.geometricFixedPointsResidual_localization {G : Type} [Group G]
    [Finite G] (H : Subgroup G) [H.Normal] :
    Nonempty (RT2G.GenuineSpectrum.localization G ⋙
        RT2G.GenuineSpectrum.geometricFixedPointsResidual H ≅
      geometricFixedPoints.universe H ⋙ RT2G.GenuineSpectrum.localization (G ⧸ H)) := sorry

/-- The natural map `X^H → Φ^H X` of genuine `G/H`-spectra. -/
def RT2G.GenuineSpectrum.fixedToGeometricResidual {G : Type} [Group G] [Finite G]
    (H : Subgroup G) [H.Normal] :
    RT2G.GenuineSpectrum.fixedPointsResidual H ⟶
      RT2G.GenuineSpectrum.geometricFixedPointsResidual H := sorry

/-- The map `X_{hG} → X^G` (the transfer from the free part). -/
def RT2G.GenuineSpectrum.orbitsToFixed (G : Type) [Group G] [Finite G] :
    GenuineSpectrum.toBorel ⋙ RT2G.hoFunctor G ⟶ GenuineSpectrum.fixedPoints (⊤ : Subgroup G) :=
  sorry

/-- The map `X^G → (Φ^H X)^{G/H}` for `H ⊆ G` normal (`G/H`-fixed points of `X^H → Φ^H X`). -/
def RT2G.GenuineSpectrum.fixedToGeomFixed {G : Type} [Group G] [Finite G] (H : Subgroup G)
    [H.Normal] :
    GenuineSpectrum.fixedPoints (⊤ : Subgroup G) ⟶
      RT2G.GenuineSpectrum.geometricFixedPointsResidual H ⋙
        GenuineSpectrum.fixedPoints (⊤ : Subgroup (G ⧸ H)) := sorry

/-- The map `(Φ^H X)^{G/H} → X^{tG}` (obtained from `X → B_G X` and `(Φ^H B_G X)^{G/H} ≃ X^{tG}`
for `G` a cyclic `p`-group and `H = C_p`). -/
def RT2G.GenuineSpectrum.geomToTate {G : Type} [Group G] [Finite G] (H : Subgroup G) [H.Normal] :
    RT2G.GenuineSpectrum.geometricFixedPointsResidual H ⋙
        GenuineSpectrum.fixedPoints (⊤ : Subgroup (G ⧸ H)) ⟶
      GenuineSpectrum.toBorel ⋙ RT2G.tateFunctor G := sorry

/-- The map `(Φ^H X)^{G/H} → (X^{tH})^{h(G/H)}`. -/
def RT2G.GenuineSpectrum.geomToResidualTate {G : Type} [Group G] [Finite G] (H : Subgroup G)
    [H.Normal] :
    RT2G.GenuineSpectrum.geometricFixedPointsResidual H ⋙
        GenuineSpectrum.fixedPoints (⊤ : Subgroup (G ⧸ H)) ⟶
      GenuineSpectrum.toBorel ⋙ RT2G.residualTateFinite H ⋙ RT2G.hfpFunctor (G ⧸ H) := sorry

/-! ### RT.2/borel-completion -/

/-- RT.2/borel-completion. For a finite group `G`, the forgetful functor `GSp → Sp^{BG}` has a
fully faithful right adjoint `B_G` whose essential image consists of the Borel-complete `X`, those
with `X^H → X^{hH}` an equivalence for every `H ⊆ G`; `B_G` is lax symmetric monoidal and the unit
`id → B_G` (of genuine spectra, after forgetting) is a lax symmetric monoidal transformation. -/
theorem borelCompletion (G : Type) [Group G] [Finite G] :
    ∃ adj : GenuineSpectrum.toBorel ⊣ RT2G.GenuineSpectrum.borel G,
      (RT2G.GenuineSpectrum.borel G).Full ∧ (RT2G.GenuineSpectrum.borel G).Faithful ∧
      (∀ X : GenuineSpectrum G, (RT2G.GenuineSpectrum.borel G).essImage X ↔
        ∀ H : Subgroup G, IsIso ((RT2G.GenuineSpectrum.fixedToHomotopyFixed H).app X)) ∧
      ∃ _ : (RT2G.GenuineSpectrum.borel G).LaxBraided, NatTrans.IsMonoidal adj.unit := sorry

/-! ### RT.2/isotropy-separation -/

/-- RT.2/isotropy-separation. For `G = C_{p^{n+1}}` and `X ∈ GSp` there is a natural fibre
sequence `X_{hG} → X^G → (Φ^{C_p} X)^{G/C_p}`; applied to the Borel completion `B_G Y` of
`Y ∈ Sp^{BG}` it becomes the norm sequence `Y_{hG} → Y^{hG} → Y^{tG}` (the right-hand square
commutes), and this gives `−^{tG}` a lax symmetric monoidal structure for which `−^{hG} → −^{tG}`
is lax symmetric monoidal (agreeing with RT.2/tate-multiplicativity; that the right-hand square
is lax symmetric monoidal, and the agreement, are not recorded in the signature). -/
theorem isotropySeparation (p : ℕ) [Fact p.Prime] (n : ℕ) :
    (∀ X : GenuineSpectrum (C (p ^ (n + 1))),
      RT2G.IsFibreSequence ((RT2G.GenuineSpectrum.orbitsToFixed (C (p ^ (n + 1)))).app X)
        ((RT2G.GenuineSpectrum.fixedToGeomFixed (RT2G.cpSub p n)).app X)) ∧
    (∀ Y : SpectraWithAction (C (p ^ (n + 1))),
      ∃ (e₁ : (GenuineSpectrum.fixedPoints ⊤).obj
            ((RT2G.GenuineSpectrum.borel (C (p ^ (n + 1)))).obj Y) ≅
          (RT2G.hfpFunctor (C (p ^ (n + 1)))).obj Y)
        (e₂ : (GenuineSpectrum.fixedPoints ⊤).obj
            ((RT2G.GenuineSpectrum.geometricFixedPointsResidual (RT2G.cpSub p n)).obj
              ((RT2G.GenuineSpectrum.borel (C (p ^ (n + 1)))).obj Y)) ≅
          (RT2G.tateFunctor (C (p ^ (n + 1)))).obj Y),
        (RT2G.GenuineSpectrum.fixedToGeomFixed (RT2G.cpSub p n)).app
            ((RT2G.GenuineSpectrum.borel (C (p ^ (n + 1)))).obj Y) ≫ e₂.hom =
          e₁.hom ≫ (RT2G.hfpToTate (C (p ^ (n + 1)))).app Y) ∧
    ∃ _ : (RT2G.tateFunctor (C (p ^ (n + 1)))).LaxBraided,
      NatTrans.IsMonoidal (RT2G.hfpToTate (C (p ^ (n + 1)))) := sorry

/-! ### RT.2/genuine-cyclic-and-circle-spectra -/

/-- Orthogonal spectra with continuous `T`-action `TSp^O`. -/
def RT2G.OrthogonalTSpectrum : Type := sorry

instance RT2G.OrthogonalTSpectrum.instCategory : Category.{0} RT2G.OrthogonalTSpectrum := sorry

/-- The underlying orthogonal spectrum. -/
def RT2G.OrthogonalTSpectrum.forget : RT2G.OrthogonalTSpectrum ⥤ OrthogonalSpectrum := sorry

/-- Restriction to the finite subgroup `C_n ⊂ T`: `TSp^O → C_nSp^O`. -/
def RT2G.OrthogonalTSpectrum.resCyclic (n : ℕ+) :
    RT2G.OrthogonalTSpectrum ⥤ RT2G.OrthogonalGSpectrum (C n) := sorry

/-- An `F`-equivalence: a map of orthogonal `T`-spectra inducing equivalences of genuine
`C_n`-spectra for every finite `C_n ⊂ T`. -/
def RT2G.OrthogonalTSpectrum.IsFEquiv {X Y : RT2G.OrthogonalTSpectrum} (f : X ⟶ Y) : Prop :=
  ∀ n : ℕ+, IsIso ((RT2G.GenuineSpectrum.localization (C n)).map
    ((RT2G.OrthogonalTSpectrum.resCyclic n).map f))

/-- `F`-genuine `T`-spectra `TSp_F` (RT.2/genuine-cyclic-and-circle-spectra): the localisation of
`TSp^O` at the `F`-equivalences (`RT2G.OrthogonalTSpectrum.toGenuine_isLocalization`). Only the
finite subgroups of `T` are seen. -/
def GenuineCircleSpectrum : Type := sorry

instance RT2G.GenuineCircleSpectrum.instCategory : Category.{0} GenuineCircleSpectrum := sorry

/-- The localisation functor `TSp^O → TSp_F`. -/
def RT2G.OrthogonalTSpectrum.toGenuine : RT2G.OrthogonalTSpectrum ⥤ GenuineCircleSpectrum :=
  sorry

/-- `TSp_F` is the localisation of `TSp^O` at the `F`-equivalences. -/
theorem RT2G.OrthogonalTSpectrum.toGenuine_isLocalization :
    RT2G.IsLocalizationAt RT2G.OrthogonalTSpectrum.toGenuine
      (fun _ _ f => RT2G.OrthogonalTSpectrum.IsFEquiv f) := sorry

/-- Genuine fixed points `−^{C_n} : TSp_F → Sp^{B(T/C_n)}` for the finite subgroup `C_n ⊂ T`,
with the residual `T/C_n`-action read as a `T`-action via `T/C_n ≅ T`. -/
def GenuineCircleSpectrum.fixedPoints (n : ℕ+) : GenuineCircleSpectrum ⥤ SpectraWithAction T :=
  sorry

/-- Geometric fixed points `Φ^{C_n} : TSp_F → TSp_F`, via `T/C_n ≅ T`. -/
def GenuineCircleSpectrum.geometricFixedPoints (n : ℕ+) :
    GenuineCircleSpectrum ⥤ GenuineCircleSpectrum := sorry

/-- The forgetful functor `TSp_F → Sp^{BT}`. -/
def GenuineCircleSpectrum.toBorel : GenuineCircleSpectrum ⥤ SpectraWithAction T := sorry

/-- Restriction of an `F`-genuine `T`-spectrum to a genuine `C_n`-spectrum. -/
def RT2G.GenuineCircleSpectrum.resCyclic (n : ℕ+) :
    GenuineCircleSpectrum ⥤ GenuineSpectrum (C n) := sorry

/-- The underlying spectrum of `X^{C_n}` is the genuine `C_n`-fixed points of the restriction. -/
theorem RT2G.GenuineCircleSpectrum.fixedPoints_underlying (n : ℕ+) :
    Nonempty (GenuineCircleSpectrum.fixedPoints n ⋙ RT2G.SpectraWithAction.forget T ≅
      RT2G.GenuineCircleSpectrum.resCyclic n ⋙ GenuineSpectrum.fixedPoints ⊤) := sorry

/-- Genuine `C_{p^∞}`-spectra `C_{p^∞}Sp = lim_n C_{p^n}Sp`, the limit along the restriction
functors (RT.2/genuine-cyclic-and-circle-spectra); `RT2G.GenuinePInftySpectrum.level` are the
projections. -/
def GenuinePInftySpectrum (p : ℕ) [Fact p.Prime] : Type := sorry

instance RT2G.GenuinePInftySpectrum.instCategory (p : ℕ) [Fact p.Prime] :
    Category.{0} (GenuinePInftySpectrum p) := sorry

/-- The inclusion `C_{p^n} ⊂ C_{p^{n+1}}`, `x ↦ p x` on `ℤ/p^n → ℤ/p^{n+1}`. -/
def RT2G.cyclicInclusion (p n : ℕ) : C (p ^ n) →* C (p ^ (n + 1)) :=
  AddMonoidHom.toMultiplicative (ZMod.lift (p ^ n)
    ⟨(AddMonoidHom.mulLeft (p : ZMod (p ^ (n + 1)))).comp (Int.castAddHom (ZMod (p ^ (n + 1)))),
      sorry⟩)

/-- The projection `C_{p^∞}Sp → C_{p^n}Sp`. -/
def RT2G.GenuinePInftySpectrum.level (p : ℕ) [Fact p.Prime] (n : ℕ) :
    GenuinePInftySpectrum p ⥤ GenuineSpectrum (C (p ^ n)) := sorry

/-- The projections are compatible with restriction along `C_{p^n} ⊂ C_{p^{n+1}}`. -/
theorem RT2G.GenuinePInftySpectrum.level_res (p : ℕ) [Fact p.Prime] (n : ℕ) :
    Nonempty (RT2G.GenuinePInftySpectrum.level p (n + 1) ⋙
        RT2G.GenuineSpectrum.res (RT2G.cyclicInclusion p n) ≅
      RT2G.GenuinePInftySpectrum.level p n) := sorry

/-- Limit property: compatible families of functors into the `C_{p^n}Sp` lift to `C_{p^∞}Sp`. -/
theorem RT2G.GenuinePInftySpectrum.isLimit (p : ℕ) [Fact p.Prime] (E : Type) [Category.{0} E]
    (F : ∀ n : ℕ, E ⥤ GenuineSpectrum (C (p ^ n)))
    (e : ∀ n : ℕ, F (n + 1) ⋙ RT2G.GenuineSpectrum.res (RT2G.cyclicInclusion p n) ≅ F n) :
    ∃ F' : E ⥤ GenuinePInftySpectrum p,
      ∀ n : ℕ, Nonempty (F' ⋙ RT2G.GenuinePInftySpectrum.level p n ≅ F n) := sorry

/-- The genuine `C_{p^n}`-fixed points `X ↦ X^{C_{p^n}}` of a genuine `C_{p^∞}`-spectrum. -/
def RT2G.GenuinePInftySpectrum.fixedPoints (p : ℕ) [Fact p.Prime] (n : ℕ) :
    GenuinePInftySpectrum p ⥤ Spectrum :=
  RT2G.GenuinePInftySpectrum.level p n ⋙ GenuineSpectrum.fixedPoints ⊤

/-- The underlying spectrum of a genuine `C_{p^∞}`-spectrum. -/
def RT2G.GenuinePInftySpectrum.underlying (p : ℕ) [Fact p.Prime] :
    GenuinePInftySpectrum p ⥤ Spectrum :=
  RT2G.GenuinePInftySpectrum.level p 0 ⋙ GenuineSpectrum.toBorel ⋙
    RT2G.SpectraWithAction.forget _

/-- The identification `C_{p^n} ≅ C_{p^{n+1}}/C_p` (from `C_{p^∞}/C_p ≅ C_{p^∞}`, `z ↦ z^p`). -/
def RT2G.cpQuotientEquiv (p n : ℕ) : C (p ^ n) ≃* C (p ^ (n + 1)) ⧸ RT2G.cpSub p n := sorry

/-- Geometric fixed points `Φ^{C_p} : C_{p^∞}Sp → C_{p^∞}Sp` via `C_{p^∞}/C_p ≅ C_{p^∞}`. -/
def RT2G.GenuinePInftySpectrum.geometricFixedPoints (p : ℕ) [Fact p.Prime] :
    GenuinePInftySpectrum p ⥤ GenuinePInftySpectrum p := sorry

/-- Levelwise, `Φ^{C_p}` is the residual geometric fixed points of `C_{p^{n+1}}`-spectra. -/
theorem RT2G.GenuinePInftySpectrum.geometricFixedPoints_level (p : ℕ) [Fact p.Prime] (n : ℕ) :
    Nonempty (RT2G.GenuinePInftySpectrum.geometricFixedPoints p ⋙
        RT2G.GenuinePInftySpectrum.level p n ≅
      RT2G.GenuinePInftySpectrum.level p (n + 1) ⋙
        RT2G.GenuineSpectrum.geometricFixedPointsResidual (RT2G.cpSub p n) ⋙
        RT2G.GenuineSpectrum.res (RT2G.cpQuotientEquiv p n).toMonoidHom) := sorry

/-- The map `X^{C_{p^{n+1}}} → (Φ^{C_p} X)^{C_{p^n}}`. -/
def RT2G.GenuinePInftySpectrum.fixedToGeomFixed (p : ℕ) [Fact p.Prime] (n : ℕ) :
    RT2G.GenuinePInftySpectrum.fixedPoints p (n + 1) ⟶
      RT2G.GenuinePInftySpectrum.geometricFixedPoints p ⋙
        RT2G.GenuinePInftySpectrum.fixedPoints p n := sorry

/-- The inclusion of fixed points `F : X^{C_{p^{n+1}}} → X^{C_{p^n}}`. -/
def RT2G.GenuinePInftySpectrum.inclusionFixed (p : ℕ) [Fact p.Prime] (n : ℕ) :
    RT2G.GenuinePInftySpectrum.fixedPoints p (n + 1) ⟶
      RT2G.GenuinePInftySpectrum.fixedPoints p n := sorry

/-- The transfer `V : X^{C_{p^n}} → X^{C_{p^{n+1}}}`. -/
def RT2G.GenuinePInftySpectrum.transfer (p : ℕ) [Fact p.Prime] (n : ℕ) :
    RT2G.GenuinePInftySpectrum.fixedPoints p n ⟶
      RT2G.GenuinePInftySpectrum.fixedPoints p (n + 1) := sorry

/-- Restriction of an `F`-genuine `T`-spectrum to a genuine `C_{p^∞}`-spectrum. -/
def RT2G.GenuineCircleSpectrum.toPInfty (p : ℕ) [Fact p.Prime] :
    GenuineCircleSpectrum ⥤ GenuinePInftySpectrum p := sorry

/-- Test `GenuineCircleSpectrum.zero` (degenerate): the zero object has all fixed points `0`. -/
example (X : GenuineCircleSpectrum) (hX : Limits.IsZero X) (n : ℕ+) :
    Limits.IsZero ((GenuineCircleSpectrum.fixedPoints n).obj X) := sorry

/-- Test `GenuineCircleSpectrum.fixed_trivial` (computation): `−^{C_1}` is the underlying
spectrum (with its `T`-action). -/
example : Nonempty (GenuineCircleSpectrum.fixedPoints 1 ≅ GenuineCircleSpectrum.toBorel) := sorry

/-- Fully genuine `T`-spectra (all closed subgroups of `T`, including `T`). -/
def RT2G.FullyGenuineCircleSpectrum : Type := sorry

instance RT2G.FullyGenuineCircleSpectrum.instCategory :
    Category.{0} RT2G.FullyGenuineCircleSpectrum := sorry

/-- The genuine `T`-fixed points `X ↦ X^T` of a fully genuine `T`-spectrum. -/
def RT2G.FullyGenuineCircleSpectrum.fixedPointsT : RT2G.FullyGenuineCircleSpectrum ⥤ Spectrum :=
  sorry

/-- The functor to `F`-genuine `T`-spectra (forgetting the infinite subgroup `T`). -/
def RT2G.FullyGenuineCircleSpectrum.toF :
    RT2G.FullyGenuineCircleSpectrum ⥤ GenuineCircleSpectrum := sorry

/-- Test `GenuineCircleSpectrum.not_fully_genuine` (non-example): `TSp_F` does not see fixed
points for `T` itself: `X^T` is not part of the structure, since some map of fully genuine
`T`-spectra (e.g. `EF_+ → S^0` for the family `F` of finite subgroups) becomes an equivalence in
`TSp_F` without inducing an equivalence on `T`-fixed points. -/
example : ∃ (X Y : RT2G.FullyGenuineCircleSpectrum) (f : X ⟶ Y),
    IsIso (RT2G.FullyGenuineCircleSpectrum.toF.map f) ∧
      ¬ IsIso (RT2G.FullyGenuineCircleSpectrum.fixedPointsT.map f) := sorry

/-! ### RT.2/geometric-fixed-points-localisation -/

/-- RT.2/geometric-fixed-points-localisation. For `H ⊆ G` normal in a finite group,
`Φ^H : GSp → (G/H)Sp` has a fully faithful right adjoint `R_H` whose essential image `GSp_{≥H}`
consists of the `X` with `Φ^N X ≃ 0` (equivalently `X^N ≃ 0`) for every `N` not containing `H`;
on `GSp_{≥H}` the map `−^H → Φ^H` is an equivalence. For the right adjoint `R_{C_p}` of `Φ^{C_p}`
on `F`-genuine `T`-spectra (and on genuine `C_{p^∞}`-spectra), `(R_{C_p} X)^H ≃ X^{H/C_p}` if
`C_p ⊆ H` and `0` otherwise. -/
theorem geometricFixedPointsLocalisation :
    (∀ (G : Type) [Group G] [Finite G] (H : Subgroup G) [H.Normal],
      ∃ (R : GenuineSpectrum (G ⧸ H) ⥤ GenuineSpectrum G)
        (_ : RT2G.GenuineSpectrum.geometricFixedPointsResidual H ⊣ R),
        R.Full ∧ R.Faithful ∧
        (∀ X : GenuineSpectrum G, R.essImage X ↔ ∀ N : Subgroup G, ¬ H ≤ N →
          Limits.IsZero ((GenuineSpectrum.geometricFixedPoints N).obj X)) ∧
        (∀ X : GenuineSpectrum G,
          (∀ N : Subgroup G, ¬ H ≤ N →
            Limits.IsZero ((GenuineSpectrum.geometricFixedPoints N).obj X)) ↔
          (∀ N : Subgroup G, ¬ H ≤ N → Limits.IsZero ((GenuineSpectrum.fixedPoints N).obj X))) ∧
        ∀ X : GenuineSpectrum G, R.essImage X →
          IsIso ((RT2G.GenuineSpectrum.fixedToGeometricResidual H).app X)) ∧
    (∀ (p : ℕ+), (p : ℕ).Prime →
      ∃ (R : GenuineCircleSpectrum ⥤ GenuineCircleSpectrum)
        (_ : GenuineCircleSpectrum.geometricFixedPoints p ⊣ R),
        R.Full ∧ R.Faithful ∧ ∀ X : GenuineCircleSpectrum,
          (∀ m : ℕ+, Nonempty ((GenuineCircleSpectrum.fixedPoints (p * m)).obj (R.obj X) ≅
            (GenuineCircleSpectrum.fixedPoints m).obj X)) ∧
          ∀ n : ℕ+, ¬ (p : ℕ) ∣ n →
            Limits.IsZero ((GenuineCircleSpectrum.fixedPoints n).obj (R.obj X))) ∧
    (∀ (p : ℕ) [Fact p.Prime],
      ∃ (R : GenuinePInftySpectrum p ⥤ GenuinePInftySpectrum p)
        (_ : RT2G.GenuinePInftySpectrum.geometricFixedPoints p ⊣ R),
        R.Full ∧ R.Faithful ∧ ∀ X : GenuinePInftySpectrum p,
          (∀ n : ℕ, Nonempty ((RT2G.GenuinePInftySpectrum.fixedPoints p (n + 1)).obj (R.obj X) ≅
            (RT2G.GenuinePInftySpectrum.fixedPoints p n).obj X)) ∧
          Limits.IsZero ((RT2G.GenuinePInftySpectrum.fixedPoints p 0).obj (R.obj X))) := sorry

/-! ### RT.2/endofunctor-coalgebras -/

/-- Coalgebras `CoAlg_F(C) = LEq(id_C, F)` for an endofunctor `F` of `C`
(RT.2/endofunctor-coalgebras): objects `c` with a map `c → F c`. -/
structure StrictEndofunctor.CoAlg {D : Type u} [Category.{v} D] (F : D ⥤ D) where
  /-- The underlying object `c`. -/
  obj : D
  /-- The structure map `c → F c`. -/
  str : obj ⟶ F.obj obj

/-- Maps of coalgebras: maps `f : c → c'` with `F f ∘ φ = φ' ∘ f`. -/
@[ext]
structure RT2G.CoAlgHom {D : Type u} [Category.{v} D] {F : D ⥤ D}
    (A B : StrictEndofunctor.CoAlg F) where
  /-- The underlying map. -/
  hom : A.obj ⟶ B.obj
  comm : A.str ≫ F.map hom = hom ≫ B.str

instance RT2G.CoAlg.instCategory {D : Type u} [Category.{v} D] (F : D ⥤ D) :
    Category.{v} (StrictEndofunctor.CoAlg F) where
  Hom A B := RT2G.CoAlgHom A B
  id A := ⟨𝟙 A.obj, sorry⟩
  comp f g := ⟨f.hom ≫ g.hom, sorry⟩
  id_comp f := RT2G.CoAlgHom.ext (Category.id_comp _)
  comp_id f := RT2G.CoAlgHom.ext (Category.comp_id _)
  assoc f g h := RT2G.CoAlgHom.ext (Category.assoc _ _ _)

/-- The property of a coalgebra of being a fixed point: its structure map is an isomorphism. -/
def RT2G.isFixedPoint {D : Type u} [Category.{v} D] (F : D ⥤ D) :
    ObjectProperty (StrictEndofunctor.CoAlg F) :=
  fun A => IsIso A.str

/-- Fixed points `Fix_F(C) = Eq(id_C, F) ⊆ CoAlg_F(C)`: the coalgebras `c ≃ F c` (full
subcategory). -/
abbrev StrictEndofunctor.Fix {D : Type u} [Category.{v} D] (F : D ⥤ D) : Type _ :=
  (RT2G.isFixedPoint F).FullSubcategory

/-- Bicompleteness of the ordinary model; this is not infinity-categorical presentability. -/
class RT2G.Bicomplete (D : Type u) [Category.{v} D] : Prop where
  hasLimits : Limits.HasLimits D
  hasColimits : Limits.HasColimits D

/-- Filtered-colimit preservation for the ordinary model; coherent accessibility is imported separately. -/
def RT2G.Accessible {D : Type u} [Category.{v} D] (F : D ⥤ D) : Prop :=
  ∀ (J : Type v) [SmallCategory J] [IsFiltered J], Limits.PreservesColimitsOfShape J F

/-- `F̄ : CoAlg_F → CoAlg_F`, `(c, φ) ↦ (F c, F φ)`. -/
def RT2G.CoAlg.lift {D : Type u} [Category.{v} D] (F : D ⥤ D) :
    StrictEndofunctor.CoAlg F ⥤ StrictEndofunctor.CoAlg F where
  obj A := ⟨F.obj A.obj, F.map A.str⟩
  map f := ⟨F.map (RT2G.CoAlgHom.hom f), sorry⟩
  map_id := sorry
  map_comp := sorry

/-- The endofunctor `R̄_F` of `CoAlg_F` built from a right adjoint `R_F` of `F` (NS18 Lemma II.5.4);
The coherent source formula is Coherent.Endofunctor.barRight.pullback. -/
def RT2G.CoAlg.rightAdj {D : Type u} [Category.{v} D] {F R : D ⥤ D} (adj : F ⊣ R) :
    StrictEndofunctor.CoAlg F ⥤ StrictEndofunctor.CoAlg F := sorry

/-- The natural map `R̄_F → id`, the mate of the structure maps `id → F̄`. -/
def RT2G.CoAlg.rightAdjCounit {D : Type u} [Category.{v} D] {F R : D ⥤ D} (adj : F ⊣ R) :
    RT2G.CoAlg.rightAdj adj ⟶ 𝟭 _ := sorry

/-- Iterates `F^n(A)` of an endofunctor on an object. -/
def RT2G.iter {D : Type u} [Category.{v} D] (F : D ⥤ D) : ℕ → D → D
  | 0, A => A
  | n + 1, A => F.obj (RT2G.iter F n A)

/-- Test `StrictEndofunctor.Fix_id` (degenerate): for `F = id_C`, `CoAlg_F(C)` has objects
`(c, f : c → c)` and `Fix_F(C)` those with `f` an equivalence, i.e. `Fun(Bℤ, C)`. -/
example {D : Type u} [Category.{v} D] :
    Nonempty (StrictEndofunctor.Fix (𝟭 D) ≌ (SingleObj (Multiplicative ℤ) ⥤ D)) := sorry

/-- Test `StrictEndofunctor.CoAlg_zero` (computation): for `F = 0` (constant at the zero object),
`CoAlg_F(C) ≃ C` and `Fix_F(C) = {0}`. -/
example {D : Type u} [Category.{v} D] (Z : D) (hZ : Limits.IsZero Z) :
    Nonempty (StrictEndofunctor.CoAlg ((Functor.const D).obj Z) ≌ D) ∧
      ∀ A : StrictEndofunctor.Fix ((Functor.const D).obj Z), Limits.IsZero A.obj.obj := sorry

/-- Test `StrictEndofunctor.fix_not_coalg` (non-example): a coalgebra `c → F c` that is not an
equivalence, e.g. `0 → F 0` when `F 0 ≠ 0`, is not in `Fix_F`. -/
example {D : Type u} [Category.{v} D] (F : D ⥤ D) (Z : D) (hZ : Limits.IsZero Z)
    (hFZ : ¬ Limits.IsZero (F.obj Z)) :
    ¬ RT2G.isFixedPoint F ⟨Z, hZ.to_ (F.obj Z)⟩ := sorry

/-! ### RT.2/genuine-cyclotomic-spectrum -/

/-- The comparison `Φ^{C_m} Φ^{C_n} ≃ Φ^{C_{mn}}` of geometric fixed points on `TSp_F`. -/
def RT2G.GenuineCircleSpectrum.geometricFixedPointsComp (m n : ℕ+) :
    GenuineCircleSpectrum.geometricFixedPoints n ⋙ GenuineCircleSpectrum.geometricFixedPoints m ≅
      GenuineCircleSpectrum.geometricFixedPoints (m * n) := sorry

/-- Genuine cyclotomic spectra `CycSp^{gen} = (TSp_F)^{hℕ_{>0}}` (RT.2/genuine-cyclotomic-spectrum):
an `F`-genuine `T`-spectrum `X` with equivalences `Φ_n : X ≃ Φ^{C_n} X`, `n ≥ 1`, compatible with
`Φ^{C_m} Φ^{C_n} ≃ Φ^{C_{mn}}`. Only this first coherence is recorded; the higher coherences of
the `ℕ_{>0}`-action are not expressible on the categorical prototype. -/
structure GenuineCyclotomicSpectrum where
  /-- The underlying `F`-genuine `T`-spectrum. -/
  underlying : GenuineCircleSpectrum
  /-- The equivalences `X ≃ Φ^{C_n} X`. -/
  equiv : ∀ n : ℕ+, underlying ≅ (GenuineCircleSpectrum.geometricFixedPoints n).obj underlying
  equiv_mul : ∀ m n : ℕ+, (equiv (m * n)).hom = (equiv m).hom ≫
    (GenuineCircleSpectrum.geometricFixedPoints m).map (equiv n).hom ≫
      (RT2G.GenuineCircleSpectrum.geometricFixedPointsComp m n).hom.app underlying

/-- Maps of genuine cyclotomic spectra: maps of `F`-genuine `T`-spectra commuting with the `Φ_n`. -/
instance RT2G.GenuineCyclotomicSpectrum.instCategory : Category.{0} GenuineCyclotomicSpectrum :=
  sorry

/-- Genuine `p`-cyclotomic spectra `CycSp_p^{gen} = Eq(id, Φ^{C_p})` on `C_{p^∞}Sp`: the fixed
points of the endofunctor `Φ^{C_p}`, i.e. `X` with an equivalence `X ≃ Φ^{C_p} X` (the inverse of
`Φ_p : Φ^{C_p} X ≃ X`). -/
abbrev GenuineCyclotomicSpectrum.pTypical (p : ℕ) [Fact p.Prime] : Type :=
  StrictEndofunctor.Fix (RT2G.GenuinePInftySpectrum.geometricFixedPoints p)

/-- The underlying genuine `C_{p^∞}`-spectrum of a genuine `p`-cyclotomic spectrum. -/
def RT2G.GenuineCyclotomicSpectrum.pUnderlying {p : ℕ} [Fact p.Prime]
    (X : GenuineCyclotomicSpectrum.pTypical p) : GenuinePInftySpectrum p :=
  X.obj.obj

/-- `p`-cyclotomic spectra `CycSp_p` (RT.2/cyclotomic-spectrum: spectra with `C_{p^∞}`-action and
a `C_{p^∞} ≅ C_{p^∞}/C_p`-equivariant Frobenius `X → X^{tC_p}`), a carrier standing for that
node's declaration. -/
def RT2G.PCyclotomicSpectrum (p : ℕ) [Fact p.Prime] : Type := sorry

instance RT2G.PCyclotomicSpectrum.instCategory (p : ℕ) [Fact p.Prime] :
    Category.{0} (RT2G.PCyclotomicSpectrum p) := sorry

/-- The underlying spectrum of a `p`-cyclotomic spectrum. -/
def RT2G.PCyclotomicSpectrum.underlying (p : ℕ) [Fact p.Prime] :
    RT2G.PCyclotomicSpectrum p ⥤ Spectrum := sorry

/-- `TC(X, p) = map_{CycSp_p}(S, X)` (RT.2/topological-cyclic-homology). -/
def RT2G.PCyclotomicSpectrum.TC (p : ℕ) [Fact p.Prime] (X : RT2G.PCyclotomicSpectrum p) :
    Spectrum := sorry

/-- The forgetful functor `CycSp^{gen} → CycSp`, constructed through coalgebras (NS18 §§II.5–II.6);
its Frobenius is described by `RT2G.GenuineCyclotomicSpectrum.forget_frobenius`. -/
def GenuineCyclotomicSpectrum.forget : GenuineCyclotomicSpectrum ⥤ CyclotomicSpectrum := sorry

/-- The forgetful functor `CycSp_p^{gen} → CycSp_p`. -/
def RT2G.GenuineCyclotomicSpectrum.forgetP (p : ℕ) [Fact p.Prime] :
    GenuineCyclotomicSpectrum.pTypical p ⥤ RT2G.PCyclotomicSpectrum p := sorry

/-- The residual `C_p`-Tate construction `X ↦ X^{tC_p}` as a functor `Sp^{BT} → Sp^{BT}`. -/
def RT2G.residualTateFunctor (p : ℕ) : SpectraWithAction T ⥤ SpectraWithAction T where
  obj X := residualTate p X
  map f := sorry
  map_id := sorry
  map_comp := sorry

/-- The natural map `Φ^{C_p} X → Φ^{C_p} B(X) ≃ X^{tC_p}` (Borel completion of `C_p`-spectra,
RT.2/isotropy-separation). -/
def RT2G.GenuineCircleSpectrum.geomToTate (p : ℕ+) :
    GenuineCircleSpectrum.geometricFixedPoints p ⋙ GenuineCircleSpectrum.toBorel ⟶
      GenuineCircleSpectrum.toBorel ⋙ RT2G.residualTateFunctor p := sorry

/-- The forgetful functor keeps the underlying `T`-spectrum and has Frobenius `φ_p` the composite
`X ≃ Φ^{C_p} X → X^{tC_p}` of `Φ_p^{−1}` with `RT2G.GenuineCircleSpectrum.geomToTate`. -/
theorem RT2G.GenuineCyclotomicSpectrum.forget_frobenius (X : GenuineCyclotomicSpectrum)
    (p : ℕ+) (hp : (p : ℕ).Prime) :
    ∃ e : (GenuineCyclotomicSpectrum.forget.obj X).underlying ≅
        GenuineCircleSpectrum.toBorel.obj X.underlying,
      (GenuineCyclotomicSpectrum.forget.obj X).frobenius p hp ≫
          (RT2G.residualTateFunctor p).map e.hom =
        e.hom ≫ GenuineCircleSpectrum.toBorel.map (X.equiv p).hom ≫
          (RT2G.GenuineCircleSpectrum.geomToTate p).app X.underlying := sorry

/-- The restriction maps `R : X^{C_{p^{n+1}}} → (Φ^{C_p} X)^{C_{p^n}} ≃ X^{C_{p^n}}` of a genuine
`p`-cyclotomic spectrum. -/
def GenuineCyclotomicSpectrum.restriction (p : ℕ) [Fact p.Prime]
    (X : GenuineCyclotomicSpectrum.pTypical p) (n : ℕ) :
    (RT2G.GenuinePInftySpectrum.fixedPoints p (n + 1)).obj
        (RT2G.GenuineCyclotomicSpectrum.pUnderlying X) ⟶
      (RT2G.GenuinePInftySpectrum.fixedPoints p n).obj
        (RT2G.GenuineCyclotomicSpectrum.pUnderlying X) :=
  (RT2G.GenuinePInftySpectrum.fixedToGeomFixed p n).app X.obj.obj ≫
    (RT2G.GenuinePInftySpectrum.fixedPoints p n).map (@inv _ _ _ _ X.obj.str X.property)

/-- `CycSp^{gen}` is stable. -/
instance GenuineCyclotomicSpectrum.instStable : RT2G.Stable GenuineCyclotomicSpectrum := sorry

/-- The genuine `p`-cyclotomic sphere: the genuine `C_{p^∞}`-sphere with `Φ^{C_p} S ≃ S`. -/
def RT2G.GenuineCyclotomicSpectrum.sphereP (p : ℕ) [Fact p.Prime] :
    GenuineCyclotomicSpectrum.pTypical p := sorry

/-- The genuine `p`-cyclotomic sphere is levelwise the genuine sphere `S_{C_{p^n}}`. -/
theorem RT2G.GenuineCyclotomicSpectrum.sphereP_level (p : ℕ) [Fact p.Prime] (n : ℕ) :
    Nonempty ((RT2G.GenuinePInftySpectrum.level p n).obj
        (RT2G.GenuineCyclotomicSpectrum.pUnderlying (RT2G.GenuineCyclotomicSpectrum.sphereP p)) ≅
      𝟙_ (GenuineSpectrum (C (p ^ n)))) := sorry

/-- Test `GenuineCyclotomicSpectrum.sphere` (computation): the genuine cyclotomic sphere has
`R : S^{C_p} → S` equal on `π_0` to the projection `A(C_p) → ℤ` onto the geometric part (the
mark `[S] ↦ #S^{C_p}`). -/
example (p : ℕ) [Fact p.Prime] :
    ∃ (e₁ : ((RT2G.GenuinePInftySpectrum.fixedPoints p 1).obj (RT2G.GenuineCyclotomicSpectrum.pUnderlying
          (RT2G.GenuineCyclotomicSpectrum.sphereP p))).homotopyGroup 0 ≃+
          RT2G.BurnsideRing (C (p ^ 1)))
      (e₀ : ((RT2G.GenuinePInftySpectrum.fixedPoints p 0).obj (RT2G.GenuineCyclotomicSpectrum.pUnderlying
          (RT2G.GenuineCyclotomicSpectrum.sphereP p))).homotopyGroup 0 ≃+ ℤ),
      ∀ x, e₀ (Spectrum.homotopyGroupMap
          (GenuineCyclotomicSpectrum.restriction p (RT2G.GenuineCyclotomicSpectrum.sphereP p) 0)
          0 x) = RT2G.BurnsideRing.fixedMark (C (p ^ 1)) (e₁ x) := sorry

/-- Test `GenuineCyclotomicSpectrum.zero` (degenerate): `0` is genuine cyclotomic. -/
example (Z : GenuineCircleSpectrum) (hZ : Limits.IsZero Z) :
    ∃ X : GenuineCyclotomicSpectrum, X.underlying = Z := sorry

/-- The fibre product `Sp^{BT} ×_{∏_p Sp^{BC_{p^∞}}} ∏_p CycSp_p` of NS18 Proposition II.3.4. -/
def RT2G.CycSpFibreProduct : Type := sorry

instance RT2G.CycSpFibreProduct.instCategory : Category.{0} RT2G.CycSpFibreProduct := sorry

/-- The canonical functor from `CycSp` to the fibre product. -/
def RT2G.CycSpFibreProduct.comparison : CyclotomicSpectrum ⥤ RT2G.CycSpFibreProduct := sorry

/-- Test `GenuineCyclotomicSpectrum.fibre_product_nonexample` (non-example): `CycSp` is not
`Sp^{BT} ×_{∏_p Sp^{BC_{p^∞}}} ∏_p CycSp_p` in general (the second claim of NS18 Proposition
II.3.4 as printed); the forgetful functor is constructed without it. -/
example : ¬ RT2G.CycSpFibreProduct.comparison.IsEquivalence := sorry

/-! ### RT.2/genuine-cyclotomic-coreflection -/

/-- A prime as an element of `ℕ+`. -/
def RT2G.primePNat (p : Nat.Primes) : ℕ+ := ⟨p.1, p.2.pos⟩

/-- Coalgebras on `TSp_F` for the commuting family `(Φ^{C_p})_p` (`p` prime). -/
structure RT2G.CycCoAlg where
  /-- The underlying `F`-genuine `T`-spectrum. -/
  obj : GenuineCircleSpectrum
  /-- The structure maps `X → Φ^{C_p} X`. -/
  str : ∀ p : Nat.Primes,
    obj ⟶ (GenuineCircleSpectrum.geometricFixedPoints (RT2G.primePNat p)).obj obj
  comm : ∀ p q : Nat.Primes,
    str p ≫ (GenuineCircleSpectrum.geometricFixedPoints (RT2G.primePNat p)).map (str q) ≫
        (RT2G.GenuineCircleSpectrum.geometricFixedPointsComp _ _).hom.app obj =
      str q ≫ (GenuineCircleSpectrum.geometricFixedPoints (RT2G.primePNat q)).map (str p) ≫
        (RT2G.GenuineCircleSpectrum.geometricFixedPointsComp _ _).hom.app obj ≫
        eqToHom (by rw [mul_comm])

instance RT2G.CycCoAlg.instCategory : Category.{0} RT2G.CycCoAlg := sorry

/-- The inclusion `CycSp^{gen} → CoAlg_{(Φ^{C_p})_p}(TSp_F)`. -/
def RT2G.CycCoAlg.ofGenuine : GenuineCyclotomicSpectrum ⥤ RT2G.CycCoAlg := sorry

/-- RT.2/genuine-cyclotomic-coreflection. The inclusion of genuine `p`-cyclotomic spectra into
coalgebras for `Φ^{C_p}` on `C_{p^∞}Sp` has a right adjoint (NS18 Theorem II.5.6), and the
(fully faithful) inclusion of genuine cyclotomic spectra into coalgebras for the commuting family
`(Φ^{C_p})_p` on `TSp_F` has a right adjoint (NS18 Theorem II.5.13). -/
theorem genuineCyclotomicCoreflection :
    (∀ (p : ℕ) [Fact p.Prime],
      ∃ R : StrictEndofunctor.CoAlg (RT2G.GenuinePInftySpectrum.geometricFixedPoints p) ⥤
          GenuineCyclotomicSpectrum.pTypical p,
        Nonempty ((RT2G.isFixedPoint (RT2G.GenuinePInftySpectrum.geometricFixedPoints p)).ι ⊣ R)) ∧
    RT2G.CycCoAlg.ofGenuine.Full ∧ RT2G.CycCoAlg.ofGenuine.Faithful ∧
    ∃ R : RT2G.CycCoAlg ⥤ GenuineCyclotomicSpectrum, Nonempty (RT2G.CycCoAlg.ofGenuine ⊣ R) :=
  sorry

/-! ### RT.2/bounded-below-cyclotomic-equivalence -/

/-- Genuine cyclotomic spectra with bounded below underlying spectrum. -/
def RT2G.GenuineCyclotomicSpectrum.boundedBelow : ObjectProperty GenuineCyclotomicSpectrum :=
  fun X => (GenuineCircleSpectrum.toBorel.obj X.underlying).underlying.IsBoundedBelow

/-- Genuine `p`-cyclotomic spectra with bounded below underlying spectrum. -/
def RT2G.GenuineCyclotomicSpectrum.boundedBelowP (p : ℕ) [Fact p.Prime] :
    ObjectProperty (GenuineCyclotomicSpectrum.pTypical p) :=
  fun X => ((RT2G.GenuinePInftySpectrum.underlying p).obj
    (RT2G.GenuineCyclotomicSpectrum.pUnderlying X)).IsBoundedBelow

/-- RT.2/bounded-below-cyclotomic-equivalence. The forgetful functors `CycSp_p^{gen} → CycSp_p`
and `CycSp^{gen} → CycSp` restrict to equivalences between the full subcategories of objects with
bounded below underlying spectrum (NS18 Theorems II.6.3 and II.6.9): restricted to bounded below
objects they are fully faithful with essential image the bounded below objects. -/
theorem boundedBelowCyclotomicEquivalence :
    (∀ (p : ℕ) [Fact p.Prime],
      ((RT2G.GenuineCyclotomicSpectrum.boundedBelowP p).ι ⋙
          RT2G.GenuineCyclotomicSpectrum.forgetP p).Full ∧
      ((RT2G.GenuineCyclotomicSpectrum.boundedBelowP p).ι ⋙
          RT2G.GenuineCyclotomicSpectrum.forgetP p).Faithful ∧
      ∀ Y : RT2G.PCyclotomicSpectrum p,
        ((RT2G.GenuineCyclotomicSpectrum.boundedBelowP p).ι ⋙
          RT2G.GenuineCyclotomicSpectrum.forgetP p).essImage Y ↔
        ((RT2G.PCyclotomicSpectrum.underlying p).obj Y).IsBoundedBelow) ∧
    (RT2G.GenuineCyclotomicSpectrum.boundedBelow.ι ⋙ GenuineCyclotomicSpectrum.forget).Full ∧
    (RT2G.GenuineCyclotomicSpectrum.boundedBelow.ι ⋙ GenuineCyclotomicSpectrum.forget).Faithful ∧
    ∀ Y : CyclotomicSpectrum,
      (RT2G.GenuineCyclotomicSpectrum.boundedBelow.ι ⋙ GenuineCyclotomicSpectrum.forget).essImage Y ↔
        Y.underlying.underlying.IsBoundedBelow := sorry

/-! ### RT.2/orthogonal-cyclotomic-spectra -/

/-- Point-set geometric fixed points `Φ^{C_n}_U : TSp^O → TSp^O` for the complete `T`-universe
`U`, with the residual `T/C_n`-action read as a `T`-action via `T/C_n ≅ T`. -/
def RT2G.OrthogonalTSpectrum.geometricFixedPoints (n : ℕ+) :
    RT2G.OrthogonalTSpectrum ⥤ RT2G.OrthogonalTSpectrum := sorry

/-- The natural isomorphism `Φ^{C_m}_U Φ^{C_n}_U X ≅ Φ^{C_{mn}}_U X`. -/
def RT2G.OrthogonalTSpectrum.geometricFixedPointsComp (m n : ℕ+) :
    RT2G.OrthogonalTSpectrum.geometricFixedPoints n ⋙
        RT2G.OrthogonalTSpectrum.geometricFixedPoints m ≅
      RT2G.OrthogonalTSpectrum.geometricFixedPoints (m * n) := sorry

/-- Orthogonal cyclotomic spectra: `X ∈ TSp^O` with `F`-equivalences `Φ_n : Φ^{C_n}_U X → X`
(`n ≥ 1`) such that `Φ_{mn} ∘ (Φ^{C_m}_U Φ^{C_n}_U X ≅ Φ^{C_{mn}}_U X) = Φ_m ∘ Φ^{C_m}_U(Φ_n)`. -/
structure RT2G.OrthogonalCyclotomicSpectrum where
  /-- The underlying orthogonal `T`-spectrum. -/
  obj : RT2G.OrthogonalTSpectrum
  /-- The cyclotomic structure maps `Φ_n : Φ^{C_n}_U X → X`. -/
  frob : ∀ n : ℕ+, (RT2G.OrthogonalTSpectrum.geometricFixedPoints n).obj obj ⟶ obj
  frob_fEquiv : ∀ n : ℕ+, RT2G.OrthogonalTSpectrum.IsFEquiv (frob n)
  frob_mul : ∀ m n : ℕ+,
    (RT2G.OrthogonalTSpectrum.geometricFixedPointsComp m n).hom.app obj ≫ frob (m * n) =
      (RT2G.OrthogonalTSpectrum.geometricFixedPoints m).map (frob n) ≫ frob m

/-- Maps of orthogonal cyclotomic spectra: maps of orthogonal `T`-spectra commuting with the
`Φ_n`. -/
instance RT2G.OrthogonalCyclotomicSpectrum.instCategory :
    Category.{0} RT2G.OrthogonalCyclotomicSpectrum := sorry

/-- The underlying orthogonal `T`-spectrum, as a functor. -/
def RT2G.OrthogonalCyclotomicSpectrum.forget :
    RT2G.OrthogonalCyclotomicSpectrum ⥤ RT2G.OrthogonalTSpectrum := sorry

/-- The underlying spectrum of an orthogonal cyclotomic spectrum. -/
def RT2G.OrthogonalCyclotomicSpectrum.toSpectrum (X : RT2G.OrthogonalCyclotomicSpectrum) :
    Spectrum :=
  RT2G.OrthogonalSpectrum.toSpectrum.obj (RT2G.OrthogonalTSpectrum.forget.obj X.obj)

/-- The functor `N(CycSp^O) → CycSp^{gen}`. -/
def RT2G.OrthogonalCyclotomicSpectrum.toGenuine :
    RT2G.OrthogonalCyclotomicSpectrum ⥤ GenuineCyclotomicSpectrum := sorry

/-- RT.2/orthogonal-cyclotomic-spectra. The functor `N(CycSp^O) → CycSp^{gen}` (which on
underlying objects is the localisation `TSp^O → TSp_F`) is the universal functor inverting the
maps of orthogonal cyclotomic spectra that are `F`-equivalences (Barwick–Glasman). -/
theorem orthogonalCyclotomicSpectra :
    RT2G.IsLocalizationAt RT2G.OrthogonalCyclotomicSpectrum.toGenuine
      (fun _ _ f => RT2G.OrthogonalTSpectrum.IsFEquiv
        (RT2G.OrthogonalCyclotomicSpectrum.forget.map f)) ∧
    ∀ X : RT2G.OrthogonalCyclotomicSpectrum,
      Nonempty ((RT2G.OrthogonalCyclotomicSpectrum.toGenuine.obj X).underlying ≅
        RT2G.OrthogonalTSpectrum.toGenuine.obj X.obj) := sorry

/-! ### RT.2/bokstedt-construction -/

/-- Bökstedt's category `I` (RT.2/bokstedt-construction): objects the finite sets
`n = {1,…,n}` (recorded by `n ∈ ℕ`, including `∅`), morphisms the injections. -/
def BokstedtCategory : Type := ℕ

/-- The cardinality `n` of the object `{1,…,n}` of `I`. -/
def RT2G.BokstedtCategory.card (x : BokstedtCategory) : ℕ := x

instance RT2G.BokstedtCategory.instCategory : SmallCategory BokstedtCategory where
  Hom m n := Fin (RT2G.BokstedtCategory.card m) ↪ Fin (RT2G.BokstedtCategory.card n)
  id _ := Function.Embedding.refl _
  comp f g := f.trans g
  id_comp _ := rfl
  comp_id _ := rfl
  assoc _ _ _ := rfl

/-- The Bökstedt construction (NS18 Definition III.4.3) of an orthogonal spectrum-valued
`I^{k+1}`-diagram `X`: `B(X) = hocolim_{(i_0,…,i_k) ∈ I^{k+1}} Ω^{i_0+⋯+i_k} X(i_0,…,i_k)`
(Bousfield–Kan homotopy colimit; for an orthogonal ring spectrum `A` the diagram is
`RT2G.Bokstedt.ringDiagram A k`, `(i_0,…,i_k) ↦ A_{i_0} ∧ ⋯ ∧ A_{i_k} ∧ −`). -/
def Bokstedt.construction (k : ℕ) (X : (Fin (k + 1) → BokstedtCategory) ⥤ OrthogonalSpectrum) :
    OrthogonalSpectrum := sorry

/-- Functoriality of the Bökstedt construction in the diagram. -/
def RT2G.Bokstedt.constructionMap (k : ℕ)
    {X Y : (Fin (k + 1) → BokstedtCategory) ⥤ OrthogonalSpectrum} (f : X ⟶ Y) :
    Bokstedt.construction k X ⟶ Bokstedt.construction k Y := sorry

/-- Orthogonal ring spectra (monoids for the smash product of orthogonal spectra). -/
def RT2G.OrthogonalRingSpectrum : Type := sorry

instance RT2G.OrthogonalRingSpectrum.instCategory : Category.{0} RT2G.OrthogonalRingSpectrum :=
  sorry

/-- The underlying orthogonal spectrum of an orthogonal ring spectrum. -/
def RT2G.OrthogonalRingSpectrum.toOrthogonal :
    RT2G.OrthogonalRingSpectrum ⥤ OrthogonalSpectrum := sorry

/-- The E₁-ring in `Sp` modelled by an orthogonal ring spectrum. -/
def RT2G.OrthogonalRingSpectrum.toE1 (A : RT2G.OrthogonalRingSpectrum) : E1Ring := sorry

/-- The orthogonal sphere ring spectrum. -/
def RT2G.OrthogonalRingSpectrum.sphere : RT2G.OrthogonalRingSpectrum := sorry

/-- The orthogonal sphere ring spectrum models the sphere. -/
theorem RT2G.OrthogonalRingSpectrum.sphere_toE1 :
    Nonempty (RT2G.OrthogonalRingSpectrum.sphere.toE1 ≅ E1Ring.sphere) := sorry

/-- An orthogonal Eilenberg–Mac Lane ring spectrum `HR` of a ring. -/
def RT2G.OrthogonalRingSpectrum.em (R : Type) [Ring R] : RT2G.OrthogonalRingSpectrum := sorry

/-- The orthogonal `HR` models `HR`. -/
theorem RT2G.OrthogonalRingSpectrum.em_toE1 (R : Type) [Ring R] :
    Nonempty ((RT2G.OrthogonalRingSpectrum.em R).toE1 ≅ E1Ring.ofRing R) := sorry

/-- The Bökstedt diagram `(i_0,…,i_k) ↦ A_{i_0} ∧ ⋯ ∧ A_{i_k} ∧ −` of an orthogonal ring spectrum
(as an orthogonal spectrum-valued `I^{k+1}`-diagram). -/
def RT2G.Bokstedt.ringDiagram (A : RT2G.OrthogonalRingSpectrum) (k : ℕ) :
    (Fin (k + 1) → BokstedtCategory) ⥤ OrthogonalSpectrum := sorry

/-- Functoriality of the Bökstedt diagram in the ring spectrum. -/
def RT2G.Bokstedt.ringDiagramMap (k : ℕ) {A A' : RT2G.OrthogonalRingSpectrum} (f : A ⟶ A') :
    RT2G.Bokstedt.ringDiagram A k ⟶ RT2G.Bokstedt.ringDiagram A' k := sorry

/-- Unstable homotopy sets `π_k(X, *)` of a pointed space. -/
def RT2G.PointedSpace.homotopyGroup (X : RT2G.PointedSpace) (k : ℕ) : Type := sorry

/-- The map on `π_k` induced by a pointed map. -/
def RT2G.PointedSpace.homotopyGroupMap {X Y : RT2G.PointedSpace} (f : X ⟶ Y) (k : ℕ) :
    X.homotopyGroup k → Y.homotopyGroup k := sorry

/-- A pointed map is `n`-connected: bijective on `π_k` for `k < n` and surjective on `π_n`. -/
def RT2G.PointedSpace.IsConnectedMap {X Y : RT2G.PointedSpace} (f : X ⟶ Y) (n : ℕ) : Prop :=
  (∀ k < n, Function.Bijective (RT2G.PointedSpace.homotopyGroupMap f k)) ∧
    Function.Surjective (RT2G.PointedSpace.homotopyGroupMap f n)

/-- The structure maps `σ_n : X_n ∧ S¹ → X_{n+1}` of an orthogonal spectrum. -/
def RT2G.OrthogonalSpectrum.structureMap (X : OrthogonalSpectrum) (n : ℕ) :
    RT2G.OrthogonalSpectrum.level X n ⊗ RT2G.PointedSpace.sphere 1 ⟶
      RT2G.OrthogonalSpectrum.level X (n + 1) := sorry

/-- A convergent orthogonal spectrum (Bökstedt): `σ_n` is `(n + c(n))`-connected for a
nondecreasing unbounded `c : ℕ → ℕ`. -/
def RT2G.OrthogonalSpectrum.IsConvergent (X : OrthogonalSpectrum) : Prop :=
  ∃ c : ℕ → ℕ, Monotone c ∧ (∀ N : ℕ, ∃ n, N ≤ c n) ∧
    ∀ n : ℕ, RT2G.PointedSpace.IsConnectedMap (RT2G.OrthogonalSpectrum.structureMap X n) (n + c n)

/-- NS18 Theorem III.4.4: Bökstedt's construction preserves stable equivalences without a
convergence restriction. Point-set realization hypotheses are separate below. -/
theorem Bokstedt.preserves_equiv (k : ℕ) {A A' : RT2G.OrthogonalRingSpectrum} (f : A ⟶ A')
    (hf : RT2G.OrthogonalSpectrum.IsStableEquiv (RT2G.OrthogonalRingSpectrum.toOrthogonal.map f)) :
    RT2G.OrthogonalSpectrum.IsStableEquiv
      (RT2G.Bokstedt.constructionMap k (RT2G.Bokstedt.ringDiagramMap k f)) := sorry

/-- Supplier witness that every level is well-pointed and the level-zero unit is an
h-cofibration, as required in NS18 Corollary III.6.8. This is model data, not a free Prop. -/
def RT2G.WellPointedRingModel (A : RT2G.OrthogonalRingSpectrum) : Type := sorry

/-- Classical THH (NS18 Definition III.5.1, Proposition III.5.4): the geometric realisation of
the cyclic orthogonal spectrum `[k] ↦ Bokstedt.construction k (RT2G.Bokstedt.ringDiagram A k)`,
an orthogonal cyclotomic spectrum. On a general input this carrier denotes the realization
after a functorial well-pointed replacement. The direct point-set comparison below records
the original model hypotheses. -/
def Bokstedt.classicalTHH (A : RT2G.OrthogonalRingSpectrum) : RT2G.OrthogonalCyclotomicSpectrum :=
  sorry

/-- The `p`-fold subdivided Bökstedt term: the Bökstedt construction over `I^{p(k+1)}` of
`(i^{(1)},…,i^{(p)}) ↦ X(i^{(1)}) ∧ ⋯ ∧ X(i^{(p)})`, with `C_p` permuting the blocks. -/
def RT2G.Bokstedt.subdivided (p k : ℕ) (X : (Fin (k + 1) → BokstedtCategory) ⥤ OrthogonalSpectrum) :
    RT2G.OrthogonalGSpectrum (C p) := sorry

/-- The diagonal map from the Bökstedt term to the `C_p`-geometric fixed points of the `p`-fold
subdivided term. -/
def RT2G.Bokstedt.diagonal (p k : ℕ) (X : (Fin (k + 1) → BokstedtCategory) ⥤ OrthogonalSpectrum) :
    Bokstedt.construction k X ⟶
      (RT2G.OrthogonalGSpectrum.geometricFixedPoints (⊤ : Subgroup (C p))).obj
        (RT2G.Bokstedt.subdivided p k X) := sorry

/-- `Φ^{C_p}` of the `p`-fold subdivided Bökstedt construction is the Bökstedt construction of the
edgewise piece (NS18 Theorem III.4.7): the diagonal is a stable equivalence. -/
theorem Bokstedt.geometricFixedPoints (p : ℕ) (hp : p.Prime) (k : ℕ)
    (X : (Fin (k + 1) → BokstedtCategory) ⥤ OrthogonalSpectrum) :
    RT2G.OrthogonalSpectrum.IsStableEquiv (RT2G.Bokstedt.diagonal p k X) := sorry

/-- Test `Bokstedt.sphere` (degenerate): classical `THH(S) ≃ S`. -/
example : Nonempty (RT2G.OrthogonalCyclotomicSpectrum.toSpectrum
    (Bokstedt.classicalTHH RT2G.OrthogonalRingSpectrum.sphere) ≅ Spectrum.sphere) := sorry

/-- The additive subgroup `[R, R]` of a ring generated by the commutators `xy − yx`. -/
def RT2G.commutatorAddSubgroup (R : Type) [Ring R] : AddSubgroup R :=
  AddSubgroup.closure {z | ∃ x y : R, z = x * y - y * x}

/-- Test `Bokstedt.pi0` (computation): `π_0` of classical `THH(HR)` is `R/[R,R]` for a discrete
ring `R`. -/
example (R : Type) [Ring R] :
    Nonempty ((RT2G.OrthogonalCyclotomicSpectrum.toSpectrum
      (Bokstedt.classicalTHH (RT2G.OrthogonalRingSpectrum.em R))).homotopyGroup 0 ≃+
        R ⧸ RT2G.commutatorAddSubgroup R) := sorry

/-- The naive cyclic bar construction's `p`-fold subdivided term `A^{∧p(k+1)}` (point-set smash
powers of the orthogonal ring spectrum, without Bökstedt's homotopy colimit), with `C_p`
permuting the blocks. -/
def RT2G.Bokstedt.naiveSubdivided (p k : ℕ) (A : RT2G.OrthogonalRingSpectrum) :
    RT2G.OrthogonalGSpectrum (C p) := sorry

/-- Test `Bokstedt.index_automorphisms`: I has two endomorphisms of [2], so it is not ℕ
with its order category. -/
example : Nat.card ((show BokstedtCategory from (2 : ℕ)) ⟶
    (show BokstedtCategory from (2 : ℕ))) = 2 := sorry

/-! ### RT.2/thh-models-agree -/

/-- RT.2/thh-models-agree. For a connective E₁-ring modelled by an orthogonal ring spectrum `A`,
the underlying `T`-spectrum of classical (Bökstedt) `THH(A)` is `THH(A)` of RT.2/thh-e1-ring
(NS18 Theorem III.6.1), classical `THH(A)` is bounded below, and under the equivalence of
RT.2/bounded-below-cyclotomic-equivalence it maps to the cyclotomic spectrum `THH(A)`, so the
Frobenius maps agree (NS18 Theorem III.6.7, Corollary III.6.8). -/
theorem thhModelsAgree (A : RT2G.OrthogonalRingSpectrum)
    (hwell : RT2G.WellPointedRingModel A) (hA : A.toE1.IsConnective) :
    Nonempty (GenuineCircleSpectrum.toBorel.obj
        (RT2G.OrthogonalCyclotomicSpectrum.toGenuine.obj (Bokstedt.classicalTHH A)).underlying ≅
      THH A.toE1) ∧
    RT2G.GenuineCyclotomicSpectrum.boundedBelow
      (RT2G.OrthogonalCyclotomicSpectrum.toGenuine.obj (Bokstedt.classicalTHH A)) ∧
    Nonempty (GenuineCyclotomicSpectrum.forget.obj
        (RT2G.OrthogonalCyclotomicSpectrum.toGenuine.obj (Bokstedt.classicalTHH A)) ≅
      THHcyc A.toE1) := sorry

/-! ### RT.2/tr-and-genuine-tc -/

/-- `TR^{n+1}(X; p) := X^{C_{p^n}}` for a genuine `p`-cyclotomic spectrum `X`
(RT.2/tr-and-genuine-tc; `TR p X n` is `TR^{n+1}`). The limit `TR(X, p) = lim_R TR^n` is
`RT2G.TRlim` (`RT2G.TRlim.isLimit`). -/
def TR (p : ℕ) [Fact p.Prime] (X : GenuineCyclotomicSpectrum.pTypical p) (n : ℕ) : Spectrum :=
  (RT2G.GenuinePInftySpectrum.fixedPoints p n).obj (RT2G.GenuineCyclotomicSpectrum.pUnderlying X)

/-- The restriction `R : TR^{n+2} → TR^{n+1}`, `X^{C_{p^{n+1}}} → (Φ^{C_p} X)^{C_{p^n}} ≃ X^{C_{p^n}}`. -/
def TR.restriction (p : ℕ) [Fact p.Prime] (X : GenuineCyclotomicSpectrum.pTypical p) (n : ℕ) :
    TR p X (n + 1) ⟶ TR p X n :=
  GenuineCyclotomicSpectrum.restriction p X n

/-- The Frobenius `F : TR^{n+2} → TR^{n+1}`, the inclusion of fixed points
`X^{C_{p^{n+1}}} → X^{C_{p^n}}`. -/
def TR.frobenius (p : ℕ) [Fact p.Prime] (X : GenuineCyclotomicSpectrum.pTypical p) (n : ℕ) :
    TR p X (n + 1) ⟶ TR p X n :=
  (RT2G.GenuinePInftySpectrum.inclusionFixed p n).app (RT2G.GenuineCyclotomicSpectrum.pUnderlying X)

/-- The Verschiebung `V : TR^{n+1} → TR^{n+2}`, the transfer `X^{C_{p^n}} → X^{C_{p^{n+1}}}`. -/
def TR.verschiebung (p : ℕ) [Fact p.Prime] (X : GenuineCyclotomicSpectrum.pTypical p) (n : ℕ) :
    TR p X n ⟶ TR p X (n + 1) :=
  (RT2G.GenuinePInftySpectrum.transfer p n).app (RT2G.GenuineCyclotomicSpectrum.pUnderlying X)

/-- `RF = FR` and `RV = VR`. The restriction/transfer composite FV is the residual
C_p norm on homotopy groups. It equals p when the residual action is trivial; the p∞-only
carrier here does not impose the extending continuous circle action that guarantees this. -/
theorem TR.relations (p : ℕ) [Fact p.Prime] (X : GenuineCyclotomicSpectrum.pTypical p) (n : ℕ) :
    TR.restriction p X (n + 1) ≫ TR.frobenius p X n =
        TR.frobenius p X (n + 1) ≫ TR.restriction p X n ∧
    TR.verschiebung p X (n + 1) ≫ TR.restriction p X (n + 1) =
        TR.restriction p X n ≫ TR.verschiebung p X n := sorry

/-- `TR(X, p) = lim_R TR^n(X; p)`. -/
def RT2G.TRlim (p : ℕ) [Fact p.Prime] (X : GenuineCyclotomicSpectrum.pTypical p) : Spectrum :=
  sorry

/-- The projections `TR(X, p) → TR^{n+1}(X; p)`. -/
def RT2G.TRlim.proj (p : ℕ) [Fact p.Prime] (X : GenuineCyclotomicSpectrum.pTypical p) (n : ℕ) :
    RT2G.TRlim p X ⟶ TR p X n := sorry

/-- `TR(X, p)` is the limit of the tower `⋯ →R TR^2 →R TR^1`. -/
theorem RT2G.TRlim.isLimit (p : ℕ) [Fact p.Prime] (X : GenuineCyclotomicSpectrum.pTypical p) :
    RT2G.IsSeqLimit (TR.restriction p X) (RT2G.TRlim.proj p X) := sorry

/-- The endomorphism `F` of `TR(X, p)` induced by the Frobenius maps (which commute with `R`). -/
def RT2G.TRlim.frobenius (p : ℕ) [Fact p.Prime] (X : GenuineCyclotomicSpectrum.pTypical p) :
    RT2G.TRlim p X ⟶ RT2G.TRlim p X := sorry

/-- `F` on `TR(X, p)` is induced by the levelwise `F`. -/
theorem RT2G.TRlim.frobenius_proj (p : ℕ) [Fact p.Prime] (X : GenuineCyclotomicSpectrum.pTypical p)
    (n : ℕ) :
    RT2G.TRlim.frobenius p X ≫ RT2G.TRlim.proj p X n =
      RT2G.TRlim.proj p X (n + 1) ≫ TR.frobenius p X n := sorry

/-- Genuine `TC^{gen}(X, p) = Eq(id, F : TR(X, p) ⇉ TR(X, p))` (characterised by
`RT2G.TCgen.isEqualizer`); the integral `TC^{gen}(X)` given by the pullback (1) is
`RT2G.TCgenInt` (`RT2G.TCgenInt.isPullback`). -/
def TCgen (p : ℕ) [Fact p.Prime] (X : GenuineCyclotomicSpectrum.pTypical p) : Spectrum := sorry

/-- The map `TC^{gen}(X, p) → TR(X, p)`. -/
def RT2G.TCgen.incl (p : ℕ) [Fact p.Prime] (X : GenuineCyclotomicSpectrum.pTypical p) :
    TCgen p X ⟶ RT2G.TRlim p X := sorry

/-- `TC^{gen}(X, p)` is the equalizer of `id` and `F` on `TR(X, p)`. -/
theorem RT2G.TCgen.isEqualizer (p : ℕ) [Fact p.Prime] (X : GenuineCyclotomicSpectrum.pTypical p) :
    ∃ w : RT2G.TCgen.incl p X ≫ 𝟙 _ = RT2G.TCgen.incl p X ≫ RT2G.TRlim.frobenius p X,
      Nonempty (Limits.IsLimit (Limits.Fork.ofι (RT2G.TCgen.incl p X) w)) := sorry

/-- Restriction `CycSp^{gen} → CycSp_p^{gen}` along `C_{p^∞} ⊂ T`. -/
def RT2G.GenuineCyclotomicSpectrum.toPTypical (p : ℕ) [Fact p.Prime] :
    GenuineCyclotomicSpectrum ⥤ GenuineCyclotomicSpectrum.pTypical p := sorry

/-- The product `∏_p X_p` of spectra over the primes. -/
def RT2G.primeProduct (X : Nat.Primes → Spectrum) : Spectrum := sorry

/-- `TC^{gen}(X, p)^∧_p` for the `p`-typical restriction of a genuine cyclotomic `X`. -/
def RT2G.TCgenAt (X : GenuineCyclotomicSpectrum) (p : Nat.Primes) : Spectrum :=
  haveI : Fact p.1.Prime := ⟨p.2⟩
  Spectrum.pCompletion p.1 (TCgen p.1 ((RT2G.GenuineCyclotomicSpectrum.toPTypical p.1).obj X))

/-- The `p`-completion `X^∧_p` of a spectrum with `T`-action. -/
def RT2G.SpectraWithAction.pCompletion (p : ℕ) (X : SpectraWithAction T) : SpectraWithAction T :=
  sorry

/-- `(X^∧_p)^{hT}` for the underlying `T`-spectrum of a genuine cyclotomic `X`. -/
def RT2G.hfpCompletionAt (X : GenuineCyclotomicSpectrum) (p : Nat.Primes) : Spectrum :=
  homotopyFixedPoints
    (RT2G.SpectraWithAction.pCompletion p.1 (GenuineCircleSpectrum.toBorel.obj X.underlying))

/-- Integral genuine `TC^{gen}(X)` (NS18 diagram (1), Goodwillie's corrected definition). -/
def RT2G.TCgenInt (X : GenuineCyclotomicSpectrum) : Spectrum := sorry

/-- `TC^{gen}(X) → X^{hT}`. -/
def RT2G.TCgenInt.toHFP (X : GenuineCyclotomicSpectrum) :
    RT2G.TCgenInt X ⟶ homotopyFixedPoints (GenuineCircleSpectrum.toBorel.obj X.underlying) := sorry

/-- `TC^{gen}(X) → ∏_p TC^{gen}(X, p)^∧_p`. -/
def RT2G.TCgenInt.toProd (X : GenuineCyclotomicSpectrum) :
    RT2G.TCgenInt X ⟶ RT2G.primeProduct (RT2G.TCgenAt X) := sorry

/-- `X^{hT} → ∏_p (X^∧_p)^{hT}`. -/
def RT2G.hfpToCompletions (X : GenuineCyclotomicSpectrum) :
    homotopyFixedPoints (GenuineCircleSpectrum.toBorel.obj X.underlying) ⟶
      RT2G.primeProduct (RT2G.hfpCompletionAt X) := sorry

/-- `∏_p TC^{gen}(X, p)^∧_p → ∏_p (X^∧_p)^{hT}`. -/
def RT2G.TCgenProdToHFP (X : GenuineCyclotomicSpectrum) :
    RT2G.primeProduct (RT2G.TCgenAt X) ⟶ RT2G.primeProduct (RT2G.hfpCompletionAt X) := sorry

/-- The pullback (1): `TC^{gen}(X) = X^{hT} ×_{∏_p (X^∧_p)^{hT}} ∏_p TC^{gen}(X, p)^∧_p`. -/
theorem RT2G.TCgenInt.isPullback (X : GenuineCyclotomicSpectrum) :
    ∃ w : RT2G.TCgenInt.toHFP X ≫ RT2G.hfpToCompletions X =
        RT2G.TCgenInt.toProd X ≫ RT2G.TCgenProdToHFP X,
      IsCartesianSquare (RT2G.TCgenInt.toHFP X) (RT2G.TCgenProdToHFP X) (RT2G.TCgenInt.toProd X)
        (RT2G.hfpToCompletions X) w := sorry

/-- The kernel `V^n W(A)` of the truncation `W(A) → W_n(A)`. -/
def RT2G.wittIdeal (p : ℕ) [Fact p.Prime] (A : Type) [CommRing A] (n : ℕ) :
    Ideal (WittVector p A) :=
  Ideal.span (Set.range (⇑(WittVector.verschiebung (p := p) (R := A)))^[n])

/-- The `p`-typical Witt vectors of length `n`, `W_n(A) = W(A)/V^n W(A)`. -/
abbrev RT2G.TruncatedWitt (p : ℕ) [Fact p.Prime] (A : Type) [CommRing A] (n : ℕ) : Type :=
  WittVector p A ⧸ RT2G.wittIdeal p A n

/-- Classical THH of a ring as a genuine cyclotomic spectrum. -/
def RT2G.genuineTHH (R : Type) [Ring R] : GenuineCyclotomicSpectrum :=
  RT2G.OrthogonalCyclotomicSpectrum.toGenuine.obj
    (Bokstedt.classicalTHH (RT2G.OrthogonalRingSpectrum.em R))

/-- Classical THH of a ring as a genuine `p`-cyclotomic spectrum. -/
def RT2G.genuineTHHp (p : ℕ) [Fact p.Prime] (R : Type) [Ring R] :
    GenuineCyclotomicSpectrum.pTypical p :=
  (RT2G.GenuineCyclotomicSpectrum.toPTypical p).obj (RT2G.genuineTHH R)

/-- Hesselholt–Madsen: for `A` commutative, `π_0 TR^{n+1}(A; p) ≅ W_{n+1}(A)`, with `R`, `F`, `V`
matching truncation, `WittVector.frobenius` and `WittVector.verschiebung` (as additive maps; the
ring structure of `π_0 TR` is not recorded). -/
theorem TR.pi0_witt (p : ℕ) [Fact p.Prime] (A : Type) [CommRing A] :
    ∃ e : ∀ n : ℕ, (TR p (RT2G.genuineTHHp p A) n).homotopyGroup 0 ≃+ RT2G.TruncatedWitt p A (n + 1),
      ∀ (n : ℕ) (x : WittVector p A),
        e n (Spectrum.homotopyGroupMap (TR.restriction p (RT2G.genuineTHHp p A) n) 0
            ((e (n + 1)).symm (Ideal.Quotient.mk (RT2G.wittIdeal p A (n + 2)) x))) =
          Ideal.Quotient.mk (RT2G.wittIdeal p A (n + 1)) x ∧
        e n (Spectrum.homotopyGroupMap (TR.frobenius p (RT2G.genuineTHHp p A) n) 0
            ((e (n + 1)).symm (Ideal.Quotient.mk (RT2G.wittIdeal p A (n + 2)) x))) =
          Ideal.Quotient.mk (RT2G.wittIdeal p A (n + 1)) (WittVector.frobenius x) ∧
        e (n + 1) (Spectrum.homotopyGroupMap (TR.verschiebung p (RT2G.genuineTHHp p A) n) 0
            ((e n).symm (Ideal.Quotient.mk (RT2G.wittIdeal p A (n + 1)) x))) =
          Ideal.Quotient.mk (RT2G.wittIdeal p A (n + 2)) (WittVector.verschiebung x) := sorry

/-- Test `TR.level_one` (degenerate): `TR^1(X; p) = X`. -/
example (p : ℕ) [Fact p.Prime] (X : GenuineCyclotomicSpectrum.pTypical p) :
    Nonempty (TR p X 0 ≅ (RT2G.GenuinePInftySpectrum.underlying p).obj
      (RT2G.GenuineCyclotomicSpectrum.pUnderlying X)) := sorry

/-- Test `TR.Fp_pi0` (computation): `π_0 TR^{n+1}(𝔽_p; p) = ℤ/p^{n+1}`. -/
example (p : ℕ) [Fact p.Prime] (n : ℕ) :
    Nonempty ((TR p (RT2G.genuineTHHp p (ZMod p)) n).homotopyGroup 0 ≃+ ZMod (p ^ (n + 1))) :=
  sorry

/-- Test `TR.not_TC` (non-example): `TR(𝔽_p; p) ≠ TC(𝔽_p; p)`: `π_0 TR(𝔽_p; p) = ℤ_p` but
`π_{−1} TR = 0`, while `π_{−1} TC(𝔽_p) = ℤ_p` (`TC` needs the equalizer with `F`). -/
example (p : ℕ) [Fact p.Prime] :
    Nonempty ((RT2G.TRlim p (RT2G.genuineTHHp p (ZMod p))).homotopyGroup 0 ≃+ ℤ_[p]) ∧
    Subsingleton ((RT2G.TRlim p (RT2G.genuineTHHp p (ZMod p))).homotopyGroup (-1)) ∧
    Nonempty ((TCgen p (RT2G.genuineTHHp p (ZMod p))).homotopyGroup (-1) ≃+ ℤ_[p]) := sorry

/-! ### RT.2/restriction-pullback -/

/-- RT.2/restriction-pullback. For a genuine `C_{p^{n+1}}`-spectrum `X` there is a natural
pullback square with top row `X^{C_{p^{n+1}}} → (Φ^{C_p} X)^{C_{p^{n+1}}/C_p}` and bottom row
`X^{hC_{p^{n+1}}} → X^{tC_{p^{n+1}}}`; if `X` is bounded below the bottom right can be replaced by
`(X^{tC_p})^{h(C_{p^{n+1}}/C_p)}`. (Iterating gives `X^{C_{p^{n+1}}}` as an iterated pullback of
the `X^{hC_{p^k}}` over Tate terms.) -/
theorem restrictionPullback (p : ℕ) [Fact p.Prime] (n : ℕ) (X : GenuineSpectrum (C (p ^ (n + 1)))) :
    (∃ w : (RT2G.GenuineSpectrum.fixedToGeomFixed (RT2G.cpSub p n)).app X ≫
          (RT2G.GenuineSpectrum.geomToTate (RT2G.cpSub p n)).app X =
        (RT2G.GenuineSpectrum.fixedToHFP _).app X ≫
          (RT2G.hfpToTate _).app (GenuineSpectrum.toBorel.obj X),
      IsCartesianSquare ((RT2G.GenuineSpectrum.fixedToGeomFixed (RT2G.cpSub p n)).app X)
        ((RT2G.hfpToTate _).app (GenuineSpectrum.toBorel.obj X))
        ((RT2G.GenuineSpectrum.fixedToHFP _).app X)
        ((RT2G.GenuineSpectrum.geomToTate (RT2G.cpSub p n)).app X) w) ∧
    ((GenuineSpectrum.toBorel.obj X).underlying.IsBoundedBelow →
      ∃ w : (RT2G.GenuineSpectrum.fixedToGeomFixed (RT2G.cpSub p n)).app X ≫
            (RT2G.GenuineSpectrum.geomToResidualTate (RT2G.cpSub p n)).app X =
          (RT2G.GenuineSpectrum.fixedToHFP _).app X ≫
            (RT2G.hfpToResidualTate (RT2G.cpSub p n)).app (GenuineSpectrum.toBorel.obj X),
        IsCartesianSquare ((RT2G.GenuineSpectrum.fixedToGeomFixed (RT2G.cpSub p n)).app X)
          ((RT2G.hfpToResidualTate (RT2G.cpSub p n)).app (GenuineSpectrum.toBorel.obj X))
          ((RT2G.GenuineSpectrum.fixedToHFP _).app X)
          ((RT2G.GenuineSpectrum.geomToResidualTate (RT2G.cpSub p n)).app X) w) := sorry

/-! ### RT.2/genuine-tc-agrees -/

/-- RT.2/genuine-tc-agrees. (i) For a genuine `p`-cyclotomic `X` with bounded below underlying
spectrum, `TC^{gen}(X, p) ≃ TC(X, p)`; (ii) for a genuine cyclotomic `X` with bounded below
underlying spectrum, `TC^{gen}(X) ≃ TC(X)`; in particular, for a connective E₁-ring `A` (modelled
by an orthogonal ring spectrum), the classical (Bökstedt–Hsiang–Madsen–Goodwillie) `TC(A)`, i.e.
`TC^{gen}` of classical `THH(A)`, agrees with `TC(THH(A))` of RT.2/topological-cyclic-homology.
(Naturality of the equivalences is not recorded.) -/
theorem genuineTcAgrees :
    (∀ (p : ℕ) [Fact p.Prime] (X : GenuineCyclotomicSpectrum.pTypical p),
      RT2G.GenuineCyclotomicSpectrum.boundedBelowP p X →
        Nonempty (TCgen p X ≅
          RT2G.PCyclotomicSpectrum.TC p ((RT2G.GenuineCyclotomicSpectrum.forgetP p).obj X))) ∧
    (∀ X : GenuineCyclotomicSpectrum, RT2G.GenuineCyclotomicSpectrum.boundedBelow X →
      Nonempty (RT2G.TCgenInt X ≅ TC (GenuineCyclotomicSpectrum.forget.obj X))) ∧
    ∀ A : RT2G.OrthogonalRingSpectrum, RT2G.WellPointedRingModel A → A.toE1.IsConnective →
      Nonempty (RT2G.TCgenInt
          (RT2G.OrthogonalCyclotomicSpectrum.toGenuine.obj (Bokstedt.classicalTHH A)) ≅
        TC (THHcyc A.toE1)) := sorry


end RefinedTraceMethods

namespace RefinedTraceMethods

/-! ## RT.3 and RT.3b: localizing invariants, traces, Goodwillie calculus, the
Dundas–Goodwillie–McCarthy theorem and the Beilinson fibre square

Auxiliary carriers of this part that are not packet names carry the prefix `RT3.`. -/

namespace RT3

/-! ### Zero objects, exact sequences of small stable ∞-categories, fibre sequences -/

/-- The zero small stable ∞-category. -/
def zeroCat : SmallStableCat := sorry

/-- The (unique) exact functor to the zero category. -/
def toZeroCat (C : SmallStableCat) : C ⟶ zeroCat := sorry

/-- The (unique) exact functor from the zero category. -/
def fromZeroCat (C : SmallStableCat) : zeroCat ⟶ C := sorry

/-- The zero functor `C → 0 → D`. -/
def zeroFunctor (C D : SmallStableCat) : C ⟶ D := toZeroCat C ≫ fromZeroCat D

/-- The (unique) map to the zero spectrum. -/
def toZero (X : Spectrum) : X ⟶ Spectrum.zero := sorry

/-- The (unique) map from the zero spectrum. -/
def fromZero (X : Spectrum) : Spectrum.zero ⟶ X := sorry

/-- The zero map `X → 0 → Y`. -/
def zeroMap (X Y : Spectrum) : X ⟶ Y := toZero X ≫ fromZero Y

/-- The full image of an exact functor `i : A → B`: the full subcategory of `B` spanned by the
objects in the image of `i`. -/
def fullImage {A B : SmallStableCat} (i : A ⟶ B) : SmallStableCat := sorry

/-- The corestriction `A → fullImage i` (essentially surjective by construction). -/
def toFullImage {A B : SmallStableCat} (i : A ⟶ B) : A ⟶ fullImage i := sorry

/-- An exact functor is fully faithful iff its corestriction to its full image is an
equivalence. -/
def IsFullyFaithful {A B : SmallStableCat} (i : A ⟶ B) : Prop := IsIso (toFullImage i)

/-- `Idem(B/A)`: the idempotent completion of the Verdier quotient of `B` by the image of `i`. -/
def idemQuotient {A B : SmallStableCat} (i : A ⟶ B) : SmallStableCat := sorry

/-- The functor `Idem(B/A) → C` induced by `q : B → C` with `q ∘ i ≃ 0`. -/
def idemQuotient.desc {A B C : SmallStableCat} (i : A ⟶ B) (q : B ⟶ C)
    (w : i ≫ q = zeroFunctor A C) : idemQuotient i ⟶ C := sorry

/-- Exact sequences `A → B → C` in `Cat^perf_∞`: the composite is zero, `A → B` is fully
faithful and `Idem(B/A) → C` is an equivalence (RT.3/localizing-invariants). -/
structure ExactSequence where
  /-- The kernel term. -/
  A : SmallStableCat
  /-- The middle term. -/
  B : SmallStableCat
  /-- The quotient term. -/
  C : SmallStableCat
  /-- The inclusion. -/
  i : A ⟶ B
  /-- The projection. -/
  q : B ⟶ C
  /-- The composite is zero. -/
  comp_zero : i ≫ q = zeroFunctor A C
  /-- `A → B` is fully faithful. -/
  fullyFaithful : IsFullyFaithful i
  /-- `Idem(B/A) → C` is an equivalence. -/
  quotient : IsIso (idemQuotient.desc i q comp_zero)

/-- `X → Y → Z` is a fibre sequence of spectra: the square with corners `X, Y, 0, Z` commutes
and is cartesian. -/
def IsFibreSequence {X Y Z : Spectrum} (f : X ⟶ Y) (g : Y ⟶ Z) : Prop :=
  ∃ w : f ≫ g = toZero X ≫ fromZero Z, IsCartesianSquare f (fromZero Z) (toZero X) g w

/-- The functor `c ↦ fib(η_c)` of a natural transformation of spectrum-valued functors. -/
def fibFunctor {𝒞 : Type*} [Category 𝒞] {F G : 𝒞 ⥤ Spectrum} (η : F ⟶ G) : 𝒞 ⥤ Spectrum where
  obj c := Spectrum.fib (η.app c)
  map {c d} f := Spectrum.fibMap (η.app c) (η.app d) (F.map f) (G.map f) (η.naturality f).symm
  map_id := sorry
  map_comp := sorry

/-- The inclusion of the fibre `fib(f) → X`. -/
def fibι {X Y : Spectrum} (f : X ⟶ Y) : Spectrum.fib f ⟶ X := sorry

/-- A functor applied to a commutative square gives a commutative square. -/
theorem map_square {𝒞 𝒟 : Type*} [Category 𝒞] [Category 𝒟] (F : 𝒞 ⥤ 𝒟) {A B C D : 𝒞}
    {f : A ⟶ B} {g : C ⟶ D} {u : A ⟶ C} {v : B ⟶ D} (w : f ≫ v = u ≫ g) :
    F.map f ≫ F.map v = F.map u ≫ F.map g := by
  rw [← F.map_comp, w, F.map_comp]

/-! ### Rings, `Perf` and the basic invariants as functors -/

/-- The exact functor `Perf(A) → Perf(B)` (base change) induced by a map of E₁-rings. -/
def perfMap {A B : E1Ring} (f : A ⟶ B) : Perf A ⟶ Perf B := sorry

/-- `Perf` as a functor on E₁-rings. -/
def perfFunctor : E1Ring ⥤ SmallStableCat where
  obj := Perf
  map := perfMap
  map_id := sorry
  map_comp := sorry

/-- The Postnikov truncation `A → τ_{≤0}A = H(π_0 A)` of an E₁-ring. -/
def toPi0 (A : E1Ring) : A ⟶ E1Ring.ofRing A.pi0 := sorry

/-- The map of Eilenberg–Mac Lane ring spectra induced by a ring map. -/
def ofRingMap {R S : Type} [Ring R] [Ring S] (φ : R →+* S) :
    E1Ring.ofRing R ⟶ E1Ring.ofRing S := sorry

/-- Connective K-theory as a functor (GeneralAlgebraicKTheory K.4). -/
def KFunctor : SmallStableCat ⥤ Spectrum where
  obj := connectiveK
  map := connectiveKMap
  map_id := sorry
  map_comp := sorry

/-- `C ↦ K(C)` composed with `Perf`: `A ↦ K(A)` on E₁-rings. -/
def KRingFunctor : E1Ring ⥤ Spectrum := perfFunctor ⋙ KFunctor

/-- The map on nonconnective K-theory induced by an exact functor (GeneralAlgebraicKTheory K.6). -/
def nonconnectiveKMap {C D : SmallStableCat} (F : C ⟶ D) :
    nonconnectiveK C ⟶ nonconnectiveK D := sorry

/-- The comparison `K(C) → IK(C)` from connective to nonconnective K-theory. -/
def KtoIK (C : SmallStableCat) : connectiveK C ⟶ nonconnectiveK C := sorry

/-- The map of `T`-spectra `THH(C) → THH(D)` induced by an exact functor. -/
def thhCatMap {C D : SmallStableCat} (F : C ⟶ D) : THH.ofCat C ⟶ THH.ofCat D := sorry

/-- The underlying map of spectra of a map of `T`-spectra. -/
def underlyingMap {X Y : SpectraWithAction T} (f : X ⟶ Y) : X.underlying ⟶ Y.underlying := sorry

end RT3

/-! ### RT.3/localizing-invariants -/

/-- A localizing invariant (Land–Tamme convention, no filtered-colimit condition): a functor
`Cat^perf_∞ → Sp` sending exact sequences to fibre sequences. The general stable target `T` is
specialised to spectra here. -/
structure LocalizingInvariant where
  /-- The underlying functor. -/
  toFunctor : SmallStableCat ⥤ Spectrum
  /-- Exact sequences go to fibre sequences. -/
  exact : ∀ S : RT3.ExactSequence,
    RT3.IsFibreSequence (toFunctor.map S.i) (toFunctor.map S.q)

/-- `E(A) := E(Perf(A))` for an E₁-ring `A`. -/
def LocalizingInvariant.ofRing (E : LocalizingInvariant) (A : E1Ring) : Spectrum := E.toFunctor.obj (Perf A)

/-- Localizing invariants invert Morita equivalences; stated for Morita equivalent discrete
rings (Mathlib's `MoritaEquivalence`), whose categories `Perf` agree. -/
theorem LocalizingInvariant.morita (E : LocalizingInvariant) {R S : Type} [Ring R] [Ring S]
    (h : MoritaEquivalence ℤ R S) :
    Nonempty (E.ofRing (E1Ring.ofRing R) ≅ E.ofRing (E1Ring.ofRing S)) := sorry

/-- The fibre of a natural transformation of localizing invariants is localizing. -/
theorem LocalizingInvariant.fib {E E' : LocalizingInvariant} (η : E.toFunctor ⟶ E'.toFunctor) :
    ∃ L : LocalizingInvariant, L.toFunctor = RT3.fibFunctor η := sorry


/-- A truncating invariant: a localizing invariant with `E(A) ≃ E(π_0 A)` (via the Postnikov
truncation) for every connective E₁-ring `A`. -/
structure TruncatingInvariant extends LocalizingInvariant where
  /-- `E(A) → E(τ_{≤0}A)` is an equivalence for connective `A`. -/
  truncating : ∀ A : E1Ring, A.IsConnective →
    IsIso (toFunctor.map (RT3.perfMap (RT3.toPi0 A)))

namespace RT3

/-- Nonconnective K-theory `IK` as a localizing invariant (its localizing property is part of
RT.3/localizing-invariants; GeneralAlgebraicKTheory K.6). -/
def IK : LocalizingInvariant where
  toFunctor :=
    { obj := nonconnectiveK
      map := nonconnectiveKMap
      map_id := sorry
      map_comp := sorry }
  exact := sorry

/-- `THH` (underlying spectrum) as a localizing invariant (RT.2/thh-spectral-categories). -/
def THHinv : LocalizingInvariant where
  toFunctor :=
    { obj := fun C => (THH.ofCat C).underlying
      map := fun F => underlyingMap (thhCatMap F)
      map_id := sorry
      map_comp := sorry }
  exact := sorry

end RT3

/-- Test `LocalizingInvariant.zero` (degenerate): E(0) ≃ 0 for every localizing invariant. -/
example (E : LocalizingInvariant) : Nonempty (E.toFunctor.obj RT3.zeroCat ≅ Spectrum.zero) :=
  sorry

/-- Test `LocalizingInvariant.THH_example` (computation): THH is localizing, and
THH(Perf(A)) ≃ THH(A). -/
example : (∃ E : LocalizingInvariant, ∀ C, E.toFunctor.obj C = (THH.ofCat C).underlying) ∧
    ∀ A : E1Ring, Nonempty (THH.ofCat (Perf A) ≅ THH A) := sorry

/-- Test `LocalizingInvariant.connective_K_nonexample` (non-example): connective K is not
localizing — some exact sequence of small stable ∞-categories is not sent to a fibre sequence
(the failure is in degree 0, where `K_0(B) → K_0(C)` need not be surjective; nonconnective K
repairs it). Stated existentially: for regular rings such as `Perf(ℤ)_{p-tors} → Perf(ℤ) →
Perf(ℤ[1/p])` the sequence is a fibre sequence (`K_0(ℤ) → K_0(ℤ[1/p])` is onto), so a witness
needs negative K-theory. -/
example : ∃ S : RT3.ExactSequence,
    ¬ RT3.IsFibreSequence (connectiveKMap S.i) (connectiveKMap S.q) := sorry

/-! ### RT.3/dennis-trace -/

/-- The topological Dennis trace `K → THH`, a natural transformation of additive invariants
(the point `1 ∈ π_0 Nat(K, THH) ≅ ℤ`). -/
def dennisTrace : RT3.KFunctor ⟶ RT3.THHinv.toFunctor := sorry

namespace RT3

/-- Linearisation `THH(A) → HH(A/ℤ)` for a discrete ring `A`. -/
def linearisation (A : Type) [Ring A] :
    (THH.ofCat (Perf (E1Ring.ofRing A))).underlying ⟶ (hhSpectrum A).underlying := sorry

/-- The additive subgroup `[A, A]` generated by commutators. -/
def commutators (A : Type) [Ring A] : AddSubgroup A :=
  AddSubgroup.closure {x | ∃ a b : A, x = a * b - b * a}

/-- `HH_0(A/ℤ) ≅ A/[A, A]`. -/
def hh0Equiv (A : Type) [Ring A] :
    (hhSpectrum A).underlying.homotopyGroup 0 ≃+ A ⧸ commutators A := sorry

/-- The class `[P] ∈ K_0(A)` of the projective module `P = im(e) ⊆ Aⁿ` of an idempotent
matrix. -/
def idempotentClass (A : Type) [Ring A] {n : ℕ} (e : Matrix (Fin n) (Fin n) A)
    (he : e * e = e) : (connectiveK (Perf (E1Ring.ofRing A))).homotopyGroup 0 := sorry

/-- The class of a unit `u ∈ A^× → K_1(A)`. -/
def unitClass (A : Type) [Ring A] (u : Aˣ) :
    (connectiveK (Perf (E1Ring.ofRing A))).homotopyGroup 1 := sorry

/-- The class in `HH_1(A)` of the Hochschild 1-cycle `a ⊗ b` (a cycle since `ab = ba`). -/
def hh1CycleClass (A : Type) [Ring A] (a b : A) (h : a * b = b * a) :
    (hhSpectrum A).underlying.homotopyGroup 1 := sorry

/-- `HH_1(A/ℤ) ≅ Ω¹_{A/ℤ}` for a commutative ring (HKR in degree 1). -/
def hh1Equiv (A : Type) [CommRing A] :
    (hhSpectrum A).underlying.homotopyGroup 1 ≃+ Ω[A⁄ℤ] := sorry

end RT3

/-- The classical Dennis trace `K_n(A) → HH_n(A/ℤ)`: the topological Dennis trace followed by
linearisation `THH(A) → HH(A/ℤ)`. -/
def dennisTrace.toHH (A : Type) [Ring A] (n : ℤ) :
    (connectiveK (Perf (E1Ring.ofRing A))).homotopyGroup n →+
      (hhSpectrum A).underlying.homotopyGroup n :=
  Spectrum.homotopyGroupMap (dennisTrace.app (Perf (E1Ring.ofRing A)) ≫ RT3.linearisation A) n

/-- On `K_0`, the Dennis trace is the Hattori–Stallings trace: `[im e] ↦ tr(e) ∈ A/[A, A]`. -/
theorem dennisTrace.degree_zero (A : Type) [Ring A] {n : ℕ} (e : Matrix (Fin n) (Fin n) A)
    (he : e * e = e) :
    RT3.hh0Equiv A (dennisTrace.toHH A 0 (RT3.idempotentClass A e he)) =
      (QuotientAddGroup.mk (Matrix.trace e) : A ⧸ RT3.commutators A) := sorry

/-- On a unit `u ∈ K_1(A)`, the Dennis trace is the class of the cycle `u⁻¹ ⊗ u` in
`HH_1(A)` (for commutative `A` this is `d log u`, see `lowDegreeTests`). -/
theorem dennisTrace.degree_one (A : Type) [Ring A] (u : Aˣ) :
    dennisTrace.toHH A 1 (RT3.unitClass A u) =
      RT3.hh1CycleClass A (↑u⁻¹ : A) u (by rw [Units.inv_mul, Units.mul_inv]) := sorry

/-- The Dennis trace is natural in exact functors of small stable ∞-categories. -/
theorem dennisTrace.natural {C D : SmallStableCat} (F : C ⟶ D) :
    connectiveKMap F ≫ dennisTrace.app D =
      dennisTrace.app C ≫ RT3.underlyingMap (RT3.thhCatMap F) := sorry

/-- Test `dennisTrace.free_module` (computation): [A^n] ↦ n ∈ A/[A,A]. -/
example (A : Type) [Ring A] (n : ℕ) :
    RT3.hh0Equiv A (dennisTrace.toHH A 0
        (RT3.idempotentClass A (1 : Matrix (Fin n) (Fin n) A) (mul_one 1))) =
      (QuotientAddGroup.mk (n : A) : A ⧸ RT3.commutators A) := sorry

/-- Test `dennisTrace.zero_category` (degenerate): on the zero category the trace is 0 → 0. -/
example : Nonempty (connectiveK RT3.zeroCat ≅ Spectrum.zero) ∧
    Nonempty ((THH.ofCat RT3.zeroCat).underlying ≅ Spectrum.zero) ∧
    dennisTrace.app RT3.zeroCat = RT3.zeroMap _ _ := sorry

/-- Test `dennisTrace.not_iso` (non-example): K_1(ℤ) = ℤ/2 → HH_1(ℤ) = 0 is not injective, so
the Dennis trace is not an isomorphism in general. -/
example : Nonempty ((connectiveK (Perf (E1Ring.ofRing ℤ))).homotopyGroup 1 ≃+ ZMod 2) ∧
    Subsingleton ((hhSpectrum ℤ).underlying.homotopyGroup 1) ∧
    ¬ Function.Injective (dennisTrace.toHH ℤ 1) := sorry

/-! ### RT.3/cyclotomic-trace -/

namespace RT3

/-- The cyclotomic spectrum `THH(C)` of a small stable ∞-category (RT.2/thh-spectral-categories
with the Frobenius of RT.2/cyclotomic-frobenius-thh). -/
def thhCyc (C : SmallStableCat) : CyclotomicSpectrum where
  underlying := THH.ofCat C
  frobenius := sorry

/-- The map of cyclotomic spectra `THH(C) → THH(D)` induced by an exact functor. -/
def cycMap {C D : SmallStableCat} (F : C ⟶ D) : thhCyc C ⟶ thhCyc D := sorry

/-- The map on `TC` induced by a map of cyclotomic spectra. -/
def TCmap {X Y : CyclotomicSpectrum} (f : X ⟶ Y) : TC X ⟶ TC Y := sorry

/-- `TC` as a localizing invariant of small stable ∞-categories. -/
def TCinv : LocalizingInvariant where
  toFunctor :=
    { obj := fun C => TC (thhCyc C)
      map := fun F => TCmap (cycMap F)
      map_id := sorry
      map_comp := sorry }
  exact := sorry

/-- The map of cyclotomic spectra `THH(A) → THH(B)` induced by a map of E₁-rings. -/
def thhCycMap {A B : E1Ring} (f : A ⟶ B) : THHcyc A ⟶ THHcyc B := sorry

/-- `TC(A) → TC(B)` for a map of E₁-rings. -/
def tcRingMap {A B : E1Ring} (f : A ⟶ B) : TC (THHcyc A) ⟶ TC (THHcyc B) := TCmap (thhCycMap f)

/-- `A ↦ TC(A)` on E₁-rings. -/
def TCRingFunctor : E1Ring ⥤ Spectrum where
  obj A := TC (THHcyc A)
  map := tcRingMap
  map_id := sorry
  map_comp := sorry

/-- `THH(Perf(A)) ≃ THH(A)` as cyclotomic spectra. -/
def thhCycPerfIso (A : E1Ring) : thhCyc (Perf A) ≅ THHcyc A := sorry

/-- The map `TC(X) → TC⁻(X) → X` to the underlying spectrum. -/
def tcToUnderlying (X : CyclotomicSpectrum) : TC X ⟶ X.underlying.underlying := sorry

/-- The class `[A] ∈ K_0(A)` of the free module of rank one. -/
def freeClass (A : E1Ring) : (connectiveK (Perf A)).homotopyGroup 0 := sorry

/-- The unit `1 ∈ π_0 TC(A)`. -/
def tcOne (A : E1Ring) : (TC (THHcyc A)).homotopyGroup 0 := sorry

end RT3

/-- The cyclotomic trace `tr : IK → TC`, a natural transformation of localizing invariants
(Blumberg–Gepner–Tabuada, Hesselholt–Nikolaus: corepresentability of `IK` on noncommutative
motives). -/
def cyclotomicTrace : RT3.IK.toFunctor ⟶ RT3.TCinv.toFunctor := sorry

/-- `tr : K(A) → TC(A)` for an E₁-ring `A`: the composite `K → IK → TC` on `Perf(A)`. -/
def cyclotomicTrace.ofRing (A : E1Ring) : connectiveK (Perf A) ⟶ TC (THHcyc A) :=
  RT3.KtoIK (Perf A) ≫ cyclotomicTrace.app (Perf A) ≫ RT3.TCmap (RT3.thhCycPerfIso A).hom

/-- The cyclotomic trace lifts the Dennis trace: `K → IK → TC → THH` is the Dennis trace. -/
theorem cyclotomicTrace.lifts_dennis (C : SmallStableCat) :
    RT3.KtoIK C ≫ cyclotomicTrace.app C ≫ RT3.tcToUnderlying (RT3.thhCyc C) =
      dennisTrace.app C := sorry

/-- Naturality of the trace in exact functors and in maps of E₁-rings (identities and
composition are those of the functors `IK`, `TC`, `K`). -/
theorem cyclotomicTrace.natural :
    (∀ {C D : SmallStableCat} (F : C ⟶ D),
      RT3.nonconnectiveKMap F ≫ cyclotomicTrace.app D =
        cyclotomicTrace.app C ≫ RT3.TCmap (RT3.cycMap F)) ∧
    (∀ {A B : E1Ring} (f : A ⟶ B),
      connectiveKMap (RT3.perfMap f) ≫ cyclotomicTrace.ofRing B =
        cyclotomicTrace.ofRing A ≫ RT3.tcRingMap f) := sorry

/-- The cyclotomic trace as a natural transformation `K ⟶ TC` of functors on E₁-rings. -/
def RT3.traceNat : RT3.KRingFunctor ⟶ RT3.TCRingFunctor where
  app A := cyclotomicTrace.ofRing A
  naturality := fun _ _ f => cyclotomicTrace.natural.2 f

/-! ### RT.3/relative-trace -/

/-- Relative K-theory `K(f) = fib(K(A) → K(B))` (GeneralAlgebraicKTheory K.5/relative-K-theory). -/
def relativeK {A B : E1Ring} (f : A ⟶ B) : Spectrum :=
  Spectrum.fib (connectiveKMap (RT3.perfMap f))

/-- Relative topological cyclic homology `TC(f) = fib(TC(A) → TC(B))`. -/
def relativeTC {A B : E1Ring} (f : A ⟶ B) : Spectrum := Spectrum.fib (RT3.tcRingMap f)

/-- The relative trace `K(f) → TC(f)` induced by `tr` on fibres. -/
def relativeTrace {A B : E1Ring} (f : A ⟶ B) : relativeK f ⟶ relativeTC f :=
  Spectrum.fibMap _ _ (cyclotomicTrace.ofRing A) (cyclotomicTrace.ofRing B)
    (cyclotomicTrace.natural.2 f)

/-- The trace induces `K(f) → TC(f)` on fibres, compatibly with the fibre inclusions. -/
theorem cyclotomicTrace.relative {A B : E1Ring} (f : A ⟶ B) :
    ∃ g : relativeK f ⟶ relativeTC f,
      g ≫ RT3.fibι (RT3.tcRingMap f) =
        RT3.fibι (connectiveKMap (RT3.perfMap f)) ≫ cyclotomicTrace.ofRing A := sorry

/-- `K^{inv} = fib(IK → TC)`, a localizing invariant (by `LocalizingInvariant.fib`). -/
def Kinv : LocalizingInvariant where
  toFunctor := RT3.fibFunctor cyclotomicTrace
  exact := fun S => by
    obtain ⟨L, hL⟩ := LocalizingInvariant.fib cyclotomicTrace
    rw [← hL]
    exact L.exact S

namespace RT3

/-- The connective version `fib(K → TC)` on a map of E₁-rings. -/
def KinvConnMap {A B : E1Ring} (f : A ⟶ B) :
    Spectrum.fib (cyclotomicTrace.ofRing A) ⟶ Spectrum.fib (cyclotomicTrace.ofRing B) :=
  Spectrum.fibMap _ _ (connectiveKMap (perfMap f)) (tcRingMap f) (cyclotomicTrace.natural.2 f).symm

/-- The nonconnective relative trace `IK(f) → TC(f)`. -/
def relativeIKTrace {A B : E1Ring} (f : A ⟶ B) :
    Spectrum.fib (IK.toFunctor.map (perfMap f)) ⟶ Spectrum.fib (TCinv.toFunctor.map (perfMap f)) :=
  Spectrum.fibMap _ _ (cyclotomicTrace.app (Perf A)) (cyclotomicTrace.app (Perf B))
    (cyclotomicTrace.naturality (perfMap f))

end RT3

/-- `K(f) → TC(f)` is an equivalence iff `K^{inv}(A) → K^{inv}(B)` is (for connective `K` with
the connective `fib(K → TC)`, and for `IK` with `K^{inv}`). -/
theorem Kinv.relative_iff {A B : E1Ring} (f : A ⟶ B) :
    (IsIso (relativeTrace f) ↔ IsIso (RT3.KinvConnMap f)) ∧
    (IsIso (RT3.relativeIKTrace f) ↔ IsIso (Kinv.toFunctor.map (RT3.perfMap f))) := sorry

/-- Test `cyclotomicTrace.sphere_unit` (computation): on π_0 for A = S, ℤ → π_0TC(S) = ℤ,
1 ↦ 1. -/
example : ∃ (e₁ : (connectiveK (Perf E1Ring.sphere)).homotopyGroup 0 ≃+ ℤ)
    (e₂ : (TC (THHcyc E1Ring.sphere)).homotopyGroup 0 ≃+ ℤ),
    e₁ (RT3.freeClass E1Ring.sphere) = 1 ∧ e₂ (RT3.tcOne E1Ring.sphere) = 1 ∧
    Spectrum.homotopyGroupMap (cyclotomicTrace.ofRing E1Ring.sphere) 0
      (RT3.freeClass E1Ring.sphere) = RT3.tcOne E1Ring.sphere := sorry

/-- Test `cyclotomicTrace.zero` (degenerate): on the zero ring both sides vanish. -/
example : Nonempty (connectiveK (Perf (E1Ring.ofRing Unit)) ≅ Spectrum.zero) ∧
    Nonempty (TC (THHcyc (E1Ring.ofRing Unit)) ≅ Spectrum.zero) := sorry

/-- Test `cyclotomicTrace.not_equivalence` (non-example): tr : K(𝔽_p) → TC(𝔽_p) is not an
equivalence, since π_{−1}TC(𝔽_p) ≅ ℤ_p while K_{−1}(𝔽_p) = 0. -/
example (p : ℕ) [Fact p.Prime] :
    Nonempty ((TC (THHcyc (E1Ring.ofRing (ZMod p)))).homotopyGroup (-1) ≃+ ℤ_[p]) ∧
    Subsingleton ((nonconnectiveK (Perf (E1Ring.ofRing (ZMod p)))).homotopyGroup (-1)) ∧
    ¬ IsIso (cyclotomicTrace.ofRing (E1Ring.ofRing (ZMod p))) := sorry

/-- Test `relativeK.identity` (degenerate): for f = id, K(f) = TC(f) = 0. -/
example (A : E1Ring) : Nonempty (relativeK (𝟙 A) ≅ Spectrum.zero) ∧
    Nonempty (relativeTC (𝟙 A) ≅ Spectrum.zero) := sorry

/-- Test `relativeTrace.dual_numbers_pi1` (computation): for f : k[ε] → k with char k = 0,
π_1K(f) = (1 + εk)^× ≅ k and π_1TC(f) ≅ k, compatibly with the relative trace. Here
`k[ε] = TrivSqZeroExt k k` and `f` is the projection `fstHom`. -/
example (k : Type) [Field k] [CharZero k] :
    ∃ (e₁ : (relativeK (RT3.ofRingMap (TrivSqZeroExt.fstHom ℤ k k).toRingHom)).homotopyGroup 1
        ≃+ k)
      (e₂ : (relativeTC (RT3.ofRingMap (TrivSqZeroExt.fstHom ℤ k k).toRingHom)).homotopyGroup 1
        ≃+ k),
      ∀ x, e₂ (Spectrum.homotopyGroupMap
        (relativeTrace (RT3.ofRingMap (TrivSqZeroExt.fstHom ℤ k k).toRingHom)) 1 x) = e₁ x :=
  sorry

/-- Test `relativeK.not_support` (non-example): the relative theory of a localisation is not of
the nilpotent kind (its identification with K-theory with supports is the localisation theorem,
not a definition). Stated as: for `ℤ → ℤ[1/p]` the relative trace `K(f) → TC(f)` is not an
equivalence (π_{−1} of the p-completions differ: 0 versus ℤ_p). -/
example (p : ℕ) [Fact p.Prime] :
    ¬ IsIso (relativeTrace (RT3.ofRingMap (algebraMap ℤ (Localization.Away (p : ℤ))))) := sorry

/-! ### RT.3/trace-uniqueness-multiplicative -/

namespace RT3

/-- E_∞-algebra structures on an invariant for the Day convolution product on additive
(resp. localizing) invariants, whose unit is `K` (resp. `IK`). -/
def EInftyStr (F : SmallStableCat ⥤ Spectrum) : Type := sorry

/-- E_∞-algebras in additive or localizing invariants. -/
structure InvCAlg where
  /-- The underlying invariant. -/
  toFunctor : SmallStableCat ⥤ Spectrum
  /-- The E_∞-structure. -/
  str : EInftyStr toFunctor

/-- E_∞-algebra maps of invariants (points of the mapping space, up to homotopy). -/
def InvCAlg.Hom (X Y : InvCAlg) : Type := sorry

/-- The underlying natural transformation of an E_∞-map. -/
def InvCAlg.Hom.toNatTrans {X Y : InvCAlg} (φ : InvCAlg.Hom X Y) :
    X.toFunctor ⟶ Y.toFunctor := sorry

/-- `K`, the unit of the Day convolution on additive invariants. -/
def KCAlg : InvCAlg := ⟨KFunctor, sorry⟩

/-- `THH` with its E_∞-structure as an additive invariant. -/
def THHCAlg : InvCAlg := ⟨THHinv.toFunctor, sorry⟩

/-- `IK`, the unit of the Day convolution on localizing invariants. -/
def IKCAlg : InvCAlg := ⟨IK.toFunctor, sorry⟩

/-- `TC` with its E_∞-structure as a localizing invariant. -/
def TCCAlg : InvCAlg := ⟨TCinv.toFunctor, sorry⟩

/-- The E₁-map underlying a map of E_∞-rings. -/
def toE1Map {A B : EInftyRing} (f : A ⟶ B) : A.toE1 ⟶ B.toE1 := sorry

/-- The coherent mapping Kan complex of multiplicative invariants, supplied by EDS E0
and the requested early RT.5 motives foundation. Ordinary InvCAlg.Hom is its model shadow. -/
def InvCAlg.mappingSpace (X Y : InvCAlg) : SSet.{0} := sorry
instance (X Y : InvCAlg) : SSet.KanComplex (InvCAlg.mappingSpace X Y) := sorry
/-- Coherent contraction data for a Kan complex (equivalence to a point, with homotopy
inverse and higher coherence). The supplier owns the implementation of this witness. -/
def ContractibilityWitness (K : SSet.{0}) [SSet.KanComplex K] : Type := sorry
end RT3

/-- Node `RefinedTraceMethods:RT.3/trace-uniqueness-multiplicative`. The E_∞-maps `K → THH`
of additive invariants form a contractible space whose point is the Dennis trace; likewise the
E_∞-maps `IK → TC` of localizing invariants, whose point is the cyclotomic trace; hence for an
E_∞-ring `A` the trace `K(A) → TC(A)` is a map of E_∞-rings. (The refinement through the
`TC^n` of Bökstedt–Hsiang–Madsen is not stated.) -/
theorem traceUniquenessMultiplicative :
    (∃ φ : RT3.InvCAlg.Hom RT3.KCAlg RT3.THHCAlg,
      Nonempty (RT3.ContractibilityWitness (RT3.InvCAlg.mappingSpace RT3.KCAlg RT3.THHCAlg)) ∧ φ.toNatTrans = dennisTrace) ∧
    (∃ φ : RT3.InvCAlg.Hom RT3.IKCAlg RT3.TCCAlg,
      Nonempty (RT3.ContractibilityWitness (RT3.InvCAlg.mappingSpace RT3.IKCAlg RT3.TCCAlg)) ∧
        φ.toNatTrans = cyclotomicTrace) ∧
    ∀ A : EInftyRing, ∃ (KA TCA : EInftyRing)
      (eK : KA.toE1.toSpectrum ≅ connectiveK (Perf A.toE1))
      (eT : TCA.toE1.toSpectrum ≅ TC (THHcyc A.toE1)) (φ : KA ⟶ TCA),
      eK.inv ≫ E1Ring.toSpectrumMap (RT3.toE1Map φ) ≫ eT.hom = cyclotomicTrace.ofRing A.toE1 :=
  sorry

/-! ### RT.3/goodwillie-calculus -/

namespace RT3

/-- A pointed category with a zero object `z` and a suspension functor with
`ΣM = 0 ⊔_M 0`. -/
structure SuspensionData (𝒞 : Type) [Category.{0} 𝒞] where
  /-- The zero object. -/
  z : 𝒞
  /-- `z` is a zero object. -/
  isZero : Limits.IsZero z
  /-- The suspension functor. -/
  susp : 𝒞 ⥤ 𝒞
  /-- `ΣM` is the pushout `0 ⊔_M 0`. -/
  isPushout : ∀ M : 𝒞, IsPushout (isZero.from_ M) (isZero.from_ M)
    (isZero.to_ (susp.obj M)) (isZero.to_ (susp.obj M))

variable {𝒞 : Type} [Category.{0} 𝒞]

/-- The reduction `ψ_red := fib(ψ → ψ(0))`. -/
def reduction (D : SuspensionData 𝒞) (ψ : 𝒞 ⥤ Spectrum) : 𝒞 ⥤ Spectrum where
  obj M := Spectrum.fib (ψ.map (D.isZero.from_ M))
  map {M N} f := Spectrum.fibMap (ψ.map (D.isZero.from_ M)) (ψ.map (D.isZero.from_ N))
    (ψ.map f) (𝟙 _) (by
      rw [Category.comp_id, ← ψ.map_comp, D.isZero.eq_of_tgt (f ≫ D.isZero.from_ N)])
  map_id := sorry
  map_comp := sorry

/-- A cube `X : P({0,…,n-1}) → 𝒞` is strongly cocartesian if all its 2-faces are pushouts. -/
def IsStronglyCocartesian {n : ℕ} (X : Finset (Fin n) ⥤ 𝒞) : Prop :=
  ∀ (S : Finset (Fin n)) (i j : Fin n), i ≠ j → i ∉ S → j ∉ S →
    IsPushout (X.map (homOfLE (Finset.subset_insert i S)))
      (X.map (homOfLE (Finset.subset_insert j S)))
      (X.map (homOfLE (Finset.subset_insert j (insert i S))))
      (X.map (homOfLE (Finset.insert_subset_insert j (Finset.subset_insert i S))))

/-- The total fibre of a cube of spectra. -/
def totalFibre {n : ℕ} (X : Finset (Fin n) ⥤ Spectrum) : Spectrum := sorry

/-- A cube of spectra is cartesian if its total fibre vanishes. -/
def IsCartesianCube {n : ℕ} (X : Finset (Fin n) ⥤ Spectrum) : Prop :=
  Nonempty (totalFibre X ≅ Spectrum.zero)

end RT3

/-- `n`-excisive functors: strongly cocartesian `(n+1)`-cubes go to cartesian cubes. -/
def Excisive {𝒞 : Type} [Category.{0} 𝒞] (n : ℕ) (F : 𝒞 ⥤ Spectrum) : Prop :=
  ∀ X : Finset (Fin (n + 1)) ⥤ 𝒞, RT3.IsStronglyCocartesian X → RT3.IsCartesianCube (X ⋙ F)

/-- The Goodwillie derivative (linearisation) `∂ψ = colim_n Ω^n ψ_red Σ^n` of a functor to
spectra, the sequential colimit along the assembly maps `ψ_red(M) → Ω ψ_red(ΣM)`. -/
def GoodwillieDerivative {𝒞 : Type} [Category.{0} 𝒞] (D : RT3.SuspensionData 𝒞)
    (ψ : 𝒞 ⥤ Spectrum) : 𝒞 ⥤ Spectrum := sorry

namespace RT3

variable {𝒞 : Type} [Category.{0} 𝒞]

/-- The canonical map `ψ_red → ∂ψ`. -/
def toDerivative (D : SuspensionData 𝒞) (ψ : 𝒞 ⥤ Spectrum) :
    reduction D ψ ⟶ GoodwillieDerivative D ψ := sorry

/-- The map on derivatives induced by a natural transformation. -/
def derivativeMap (D : SuspensionData 𝒞) {ψ φ : 𝒞 ⥤ Spectrum} (η : ψ ⟶ φ) :
    GoodwillieDerivative D ψ ⟶ GoodwillieDerivative D φ := sorry

end RT3

/- The source's universal property is stated by Coherent.GoodwillieDerivative.universal
below. This ordinary sequential formula is a model; no universal property follows
from SuspensionData alone. -/

/-- If `ψ` is exact (1-excisive) and reduced, then `∂ψ ≃ ψ`. -/
theorem GoodwillieDerivative.exact {𝒞 : Type} [Category.{0} 𝒞] (D : RT3.SuspensionData 𝒞)
    (ψ : 𝒞 ⥤ Spectrum) (h1 : Excisive 1 ψ) (h0 : Nonempty (ψ.obj D.z ≅ Spectrum.zero)) :
    Nonempty (GoodwillieDerivative D ψ ≅ ψ) := sorry

namespace RT3

/-- Connectivity as an object property of spectra. -/
def connectiveProp : ObjectProperty Spectrum := fun X => X.IsConnective

/-- Connective spectra. -/
abbrev ConnSpectrum : Type := connectiveProp.FullSubcategory

/-- Zero object and suspension on connective spectra. -/
def connSuspData : SuspensionData ConnSpectrum := sorry

/-- The functor `Σ^∞Ω^∞` on spectra. -/
def sigmaInftyOmegaInfty : Spectrum ⥤ Spectrum := sorry

/-- `X ⊗ X` with the swap action of `C_2`. -/
def symSquare (X : Spectrum) : SpectraWithAction (C 2) := sorry

/-- The quadratic functor `M ↦ (M ⊗ M)_{hC_2}` on connective spectra. -/
def quadraticFunctor : ConnSpectrum ⥤ Spectrum where
  obj M := homotopyOrbits (symSquare M.obj)
  map := sorry
  map_id := sorry
  map_comp := sorry

end RT3

/-- Test `GoodwillieDerivative.const` (degenerate): the derivative of a constant functor is 0. -/
example {𝒞 : Type} [Category.{0} 𝒞] (D : RT3.SuspensionData 𝒞) (X : Spectrum) (M : 𝒞) :
    Nonempty ((GoodwillieDerivative D ((Functor.const 𝒞).obj X)).obj M ≅ Spectrum.zero) := sorry

/-- Test `GoodwillieDerivative.linear` (computation): the derivative of the identity on
connective spectra extends to the identity on spectra; this restriction is the inclusion. -/
example : Nonempty (GoodwillieDerivative RT3.connSuspData
      RT3.connectiveProp.ι ≅ RT3.connectiveProp.ι) := sorry

/-- Test `GoodwillieDerivative.quadratic` (non-example): M ↦ (M⊗M)_{hC_2} has zero derivative
although it is not zero. -/
example : (∀ M, Nonempty ((GoodwillieDerivative RT3.connSuspData RT3.quadraticFunctor).obj M ≅
      Spectrum.zero)) ∧
    ∃ M, ¬ Nonempty (RT3.quadraticFunctor.obj M ≅ Spectrum.zero) := sorry

/-! ### RT.3/stable-k-theory-thh, RT.3/stable-tc-thh -/

namespace RT3

/-- Connective `A`-bimodules. -/
def StrictConnBimod (A : E1Ring) : Type := sorry

instance (A : E1Ring) : Category.{0} (StrictConnBimod A) := sorry

/-- Zero object and suspension of connective bimodules. -/
def StrictConnBimod.suspData (A : E1Ring) : SuspensionData (StrictConnBimod A) := sorry

/-- The underlying spectrum of a bimodule. -/
def StrictConnBimod.forget (A : E1Ring) : StrictConnBimod A ⥤ Spectrum := sorry

/-- The split square-zero extension `M ↦ A ⊕ M`. -/
def sqZeroShadow (A : E1Ring) : StrictConnBimod A ⥤ E1Ring := sorry

/-- Topological Hochschild homology with coefficients `M ↦ THH(A; M)`. -/
def THHcoeffShadow (A : E1Ring) : StrictConnBimod A ⥤ Spectrum := sorry

/-- The shift functor `Σⁿ` on spectra. -/
def shiftFunctor (n : ℤ) : Spectrum ⥤ Spectrum where
  obj X := X.shift n
  map := sorry
  map_id := sorry
  map_comp := sorry

end RT3

/-- Node `RefinedTraceMethods:RT.3/stable-k-theory-thh` (Dundas–McCarthy). For a connective
E₁-ring `A`, the Goodwillie derivative of `M ↦ K(A ⊕ M)` on connective bimodules is
`M ↦ Σ THH(A; M)` (stable K-theory); for `A = S` it is `M ↦ ΣM`. -/
theorem stableKTheoryThh (A : E1Ring) (hA : A.IsConnective) :
    Nonempty (GoodwillieDerivative (RT3.StrictConnBimod.suspData A) (RT3.sqZeroShadow A ⋙ RT3.KRingFunctor) ≅
      RT3.THHcoeffShadow A ⋙ RT3.shiftFunctor 1) ∧
    Nonempty (GoodwillieDerivative (RT3.StrictConnBimod.suspData E1Ring.sphere)
        (RT3.sqZeroShadow E1Ring.sphere ⋙ RT3.KRingFunctor) ≅
      RT3.StrictConnBimod.forget E1Ring.sphere ⋙ RT3.shiftFunctor 1) := sorry

/-- Node `RefinedTraceMethods:RT.3/stable-tc-thh`. The derivative of `M ↦ TC(A ⊕ M)` is
`M ↦ Σ THH(A; M)`, and the cyclotomic trace induces on derivatives the identification of
RT.3/stable-k-theory-thh; so `tr` is an equivalence on derivatives. -/
theorem stableTcThh (A : E1Ring) (hA : A.IsConnective) :
    ∃ (eK : GoodwillieDerivative (RT3.StrictConnBimod.suspData A) (RT3.sqZeroShadow A ⋙ RT3.KRingFunctor) ≅
        RT3.THHcoeffShadow A ⋙ RT3.shiftFunctor 1)
      (eT : GoodwillieDerivative (RT3.StrictConnBimod.suspData A) (RT3.sqZeroShadow A ⋙ RT3.TCRingFunctor) ≅
        RT3.THHcoeffShadow A ⋙ RT3.shiftFunctor 1),
      RT3.derivativeMap (RT3.StrictConnBimod.suspData A) (Functor.whiskerLeft (RT3.sqZeroShadow A) RT3.traceNat)
        ≫ eT.hom = eK.hom := sorry

/-! ### RT.3/dgm-convergence, RT.3/dgm-theorem -/

namespace RT3

/-- A ring map has nilpotent kernel: some `n`-fold product of kernel elements always vanishes. -/
def HasNilpotentKernel {R S : Type} [Ring R] [Ring S] (φ : R →+* S) : Prop :=
  ∃ n : ℕ, ∀ x : Fin n → R, (∀ i, φ (x i) = 0) → (List.ofFn x).prod = 0

/-- `π_0 A → π_0 B` is surjective with nilpotent kernel. -/
def IsNilSurjection {A B : E1Ring} (f : A ⟶ B) : Prop :=
  Function.Surjective (E1Ring.pi0Map f) ∧ HasNilpotentKernel (E1Ring.pi0Map f)

end RT3

/- The coherent dgmConvergence signature is below, with all three independent
hypotheses of Raskin Proposition 5.5.3. The ordinary derivative model above is
used only for the derivative computations, not as a nil-invariance criterion. -/

/-- Node `RefinedTraceMethods:RT.3/dgm-theorem` (Dundas–Goodwillie–McCarthy). For a map
`f : A → B` of connective E₁-rings with `π_0 A → π_0 B` surjective with nilpotent kernel, the
square `K(A) → TC(A)` over `K(B) → TC(B)` is cartesian (integrally): `K(f) ≃ TC(f)`, and
equivalently `K^{inv}(A) ≃ K^{inv}(B)`. -/
theorem dgmTheorem {A B : E1Ring} (f : A ⟶ B) (hA : A.IsConnective) (hB : B.IsConnective)
    (hf : RT3.IsNilSurjection f) :
    IsCartesianSquare (cyclotomicTrace.ofRing A) (cyclotomicTrace.ofRing B)
      (connectiveKMap (RT3.perfMap f)) (RT3.tcRingMap f) (cyclotomicTrace.natural.2 f).symm ∧
    IsIso (relativeTrace f) ∧ IsIso (Kinv.toFunctor.map (RT3.perfMap f)) := sorry

/-! ### RT.3/goodwillie-rational -/

namespace RT3

/-- `HC(R) → HC(S)` for a ring map. -/
def hcMap {R S : Type} [Ring R] [Ring S] (φ : R →+* S) : hcSpectrum R ⟶ hcSpectrum S := sorry

/-- `HC⁻(R) → HC⁻(S)` for a ring map. -/
def hcMinusMap {R S : Type} [Ring R] [Ring S] (φ : R →+* S) :
    hcMinusSpectrum R ⟶ hcMinusSpectrum S := sorry

/-- `HP(R) → HP(S)` for a ring map. -/
def hpMap {R S : Type} [Ring R] [Ring S] (φ : R →+* S) : hpSpectrum R ⟶ hpSpectrum S := sorry

/-- Relative cyclic homology `HC(R, I) = fib(HC(R) → HC(R/I))`. -/
def relHC {R S : Type} [Ring R] [Ring S] (φ : R →+* S) : Spectrum := Spectrum.fib (hcMap φ)

/-- Relative negative cyclic homology. -/
def relHCminus {R S : Type} [Ring R] [Ring S] (φ : R →+* S) : Spectrum :=
  Spectrum.fib (hcMinusMap φ)

/-- Relative periodic cyclic homology. -/
def relHP {R S : Type} [Ring R] [Ring S] (φ : R →+* S) : Spectrum := Spectrum.fib (hpMap φ)

/-- The relative Goodwillie–Jones Chern character `K(R, I) ⊗ ℚ → HC⁻(R, I) ⊗ ℚ`. -/
def goodwillieJonesChern {R S : Type} [Ring R] [Ring S] (φ : R →+* S) :
    (relativeK (ofRingMap φ)).rationalisation ⟶ (relHCminus φ).rationalisation := sorry

end RT3

/-- Node `RefinedTraceMethods:RT.3/goodwillie-rational` (Goodwillie). For a surjection
`φ : R → R/I` of rings with nilpotent (two-sided) kernel `I`, the relative Chern character
`K(R, I) ⊗ ℚ → HC⁻(R, I) ⊗ ℚ` is an equivalence, relative `HP ⊗ ℚ` vanishes, and
`K_n(R, I) ⊗ ℚ ≅ HC_{n−1}(R ⊗ ℚ, I ⊗ ℚ)` for all `n` (rational relative HC is written as the
rationalisation of `HC` over ℤ, since `HC_*(A ⊗ ℚ) = HC_*(A) ⊗ ℚ`). The Land–Tamme form
(`fib(K_ℚ → HN_ℚ)` truncating) and the simplicial-ring version are not stated separately. -/
theorem goodwillieRational {R S : Type} [Ring R] [Ring S] (φ : R →+* S)
    (hsurj : Function.Surjective φ) (hnil : RT3.HasNilpotentKernel φ) :
    IsIso (RT3.goodwillieJonesChern φ) ∧
    Nonempty ((RT3.relHP φ).rationalisation ≅ Spectrum.zero) ∧
    ∀ n : ℤ, Nonempty ((relativeK (RT3.ofRingMap φ)).rationalisation.homotopyGroup n ≃+
      (RT3.relHC φ).rationalisation.homotopyGroup (n - 1)) := sorry

/-! ### RT.3/kinv-truncating, RT.3/truncating-excision -/

/-- Node `RefinedTraceMethods:RT.3/kinv-truncating`. `K^{inv} = fib(IK → TC)` is truncating:
`K^{inv}(A) → K^{inv}(π_0 A)` is an equivalence for every connective E₁-ring `A` (DGM applied
to `A → π_0 A`). -/
theorem kinvTruncating (A : E1Ring) (hA : A.IsConnective) :
    IsIso (Kinv.toFunctor.map (RT3.perfMap (RT3.toPi0 A))) := sorry

namespace RT3

/-- The map `E(R) → E(S)` of a localizing invariant on a ring map. -/
def invRingMap (E : LocalizingInvariant) {R S : Type} [Ring R] [Ring S] (φ : R →+* S) :
    E.ofRing (E1Ring.ofRing R) ⟶ E.ofRing (E1Ring.ofRing S) :=
  E.toFunctor.map (perfMap (ofRingMap φ))

/-- A Milnor square of rings: `A = B ×_{B'} A'` with `B → B'` surjective (so `A → B` maps
`I = ker(A → A')` isomorphically onto the ideal `ker(B → B')`). -/
structure MilnorSquare (A B A' B' : Type) [Ring A] [Ring B] [Ring A'] [Ring B'] where
  /-- The top map `A → B`. -/
  f : A →+* B
  /-- The left map `A → A'`. -/
  g : A →+* A'
  /-- The right map `B → B'`. -/
  g' : B →+* B'
  /-- The bottom map `A' → B'`. -/
  h : A' →+* B'
  /-- The square commutes. -/
  comm : g'.comp f = h.comp g
  /-- `B → B'` is surjective. -/
  surj : Function.Surjective g'
  /-- `A` is the pullback. -/
  pullback : ∀ (b : B) (a' : A'), g' b = h a' → ∃! a : A, f a = b ∧ g a = a'

end RT3

/-- Node `RefinedTraceMethods:RT.3/truncating-excision`. Every truncating invariant is
nil-invariant and sends Milnor squares to cartesian squares; in particular `K^{inv}` satisfies
excision (Cortiñas, Geisser–Hesselholt, Dundas–Kittang, Land–Tamme), so the obstructions to
excision for `K` and `TC` agree. (Land–Tamme's `⊙`-ring formula and Cortiñas' rational KABI
statement are not stated.) -/
theorem truncatingExcision (E : TruncatingInvariant) :
    (∀ {R S : Type} [Ring R] [Ring S] (φ : R →+* S), Function.Surjective φ →
      RT3.HasNilpotentKernel φ → IsIso (RT3.invRingMap E.toLocalizingInvariant φ)) ∧
    (∀ {A B A' B' : Type} [Ring A] [Ring B] [Ring A'] [Ring B']
      (M : RT3.MilnorSquare A B A' B')
      (w : RT3.invRingMap E.toLocalizingInvariant M.f ≫ RT3.invRingMap E.toLocalizingInvariant M.g'
        = RT3.invRingMap E.toLocalizingInvariant M.g ≫ RT3.invRingMap E.toLocalizingInvariant M.h),
      IsCartesianSquare (RT3.invRingMap E.toLocalizingInvariant M.f)
        (RT3.invRingMap E.toLocalizingInvariant M.h) (RT3.invRingMap E.toLocalizingInvariant M.g)
        (RT3.invRingMap E.toLocalizingInvariant M.g') w) ∧
    (∀ {A B A' B' : Type} [Ring A] [Ring B] [Ring A'] [Ring B']
      (M : RT3.MilnorSquare A B A' B')
      (w : RT3.invRingMap Kinv M.f ≫ RT3.invRingMap Kinv M.g' =
        RT3.invRingMap Kinv M.g ≫ RT3.invRingMap Kinv M.h),
      IsCartesianSquare (RT3.invRingMap Kinv M.f) (RT3.invRingMap Kinv M.h)
        (RT3.invRingMap Kinv M.g) (RT3.invRingMap Kinv M.g') w) := sorry

/-! ### RT.3/tower-square -/

namespace RT3

/-- The tower `n ↦ H(R/I^{n+1})` of E₁-rings. -/
def quotTower (R : Type) [CommRing R] (I : Ideal R) : ℕᵒᵖ ⥤ E1Ring where
  obj n := E1Ring.ofRing (R ⧸ I ^ (n.unop + 1))
  map {m n} h := ofRingMap
    (Ideal.Quotient.factor (Ideal.pow_le_pow_right (Nat.succ_le_succ h.unop.le)))
  map_id := sorry
  map_comp := sorry

/-- The limit of a tower of spectra. -/
def towerLimit (X : ℕᵒᵖ ⥤ Spectrum) : Spectrum := sorry

/-- The projection from the limit of a tower. -/
def towerLimit.π (X : ℕᵒᵖ ⥤ Spectrum) (n : ℕ) : towerLimit X ⟶ X.obj (Opposite.op n) := sorry

/-- The map on limits induced by a map of towers. -/
def towerLimitMap {X Y : ℕᵒᵖ ⥤ Spectrum} (η : X ⟶ Y) : towerLimit X ⟶ towerLimit Y := sorry

/-- The projections are natural. -/
theorem towerLimit_π_naturality {X Y : ℕᵒᵖ ⥤ Spectrum} (η : X ⟶ Y) (n : ℕ) :
    towerLimitMap η ≫ towerLimit.π Y n = towerLimit.π X n ≫ η.app (Opposite.op n) := sorry

end RT3

/-- Node `RefinedTraceMethods:RT.3/tower-square`. For an `I`-adically complete ring `R`, the
square `lim_n K(R/I^n) → lim_n TC(R/I^n)` over `K(R/I) → TC(R/I)` is cartesian. Stated for
commutative `R` (Mathlib's `IsAdicComplete`); the Milnor `lim¹` sequences of the limits and the
continuity of `K` and `TC` (owned elsewhere) are not stated. -/
theorem towerSquare (R : Type) [CommRing R] (I : Ideal R) (hR : IsAdicComplete I R) :
    IsCartesianSquare
      (RT3.towerLimitMap (Functor.whiskerLeft (RT3.quotTower R I) RT3.traceNat))
      (RT3.traceNat.app ((RT3.quotTower R I).obj (Opposite.op 0)))
      (RT3.towerLimit.π _ 0) (RT3.towerLimit.π _ 0)
      (RT3.towerLimit_π_naturality _ 0) := sorry

/-! ### RT.3/hesselholt-nikolaus-assembly -/

namespace RT3

/-- The direct sum of a family of spectra. -/
def directSum {ι : Type} (X : ι → Spectrum) : Spectrum := sorry

/-- Membership in the localizing subcategory of spectra generated by `Y`: the smallest class
containing `Y`, closed under equivalences, shifts, cofibres and direct sums. -/
inductive InLocalizing (Y : Spectrum) : Spectrum → Prop
  | gen : InLocalizing Y Y
  | iso {X X' : Spectrum} : (X ≅ X') → InLocalizing Y X → InLocalizing Y X'
  | shift {X : Spectrum} (n : ℤ) : InLocalizing Y X → InLocalizing Y (X.shift n)
  | cofib {X X' : Spectrum} (f : X ⟶ X') : InLocalizing Y X → InLocalizing Y X' →
      InLocalizing Y (Spectrum.cofib f)
  | sum {ι : Type} (X : ι → Spectrum) : (∀ i, InLocalizing Y (X i)) →
      InLocalizing Y (directSum X)

/-- The group ring `R[C_p] = R ⊗ Σ^∞_+ C_p`. -/
def groupRingCp (R : E1Ring) (p : ℕ) : E1Ring := sorry

/-- `Σ^∞_+ BC_p`. -/
def suspBCp (p : ℕ) : Spectrum := sorry

/-- The TC assembly map `TC(R) ⊗ Σ^∞_+ BC_p → TC(R[C_p])`. -/
def tcAssembly (R : E1Ring) (p : ℕ) :
    Spectrum.smash (TC (THHcyc R)) (suspBCp p) ⟶ TC (THHcyc (groupRingCp R p)) := sorry

end RT3

/-- Node `RefinedTraceMethods:RT.3/hesselholt-nikolaus-assembly`. The cofibre of the TC
assembly map `TC(R) ⊗ Σ^∞_+ BC_p → TC(R[C_p])` lies in the localizing subcategory generated
by the coefficient ring `R`. The generality conditions of Land–Mathew–Meier–Tamme Remark 3.9
are not reproduced in the signature. -/
theorem hesselholtNikolausAssembly (R : E1Ring) (p : ℕ) (hp : p.Prime) :
    RT3.InLocalizing R.toSpectrum (Spectrum.cofib (RT3.tcAssembly R p)) := sorry

/-! ### RT.3/low-degree-tests -/

namespace RT3

/-- The augmentation `k[ε] → k` of the dual numbers `k[ε] = TrivSqZeroExt k k`. -/
def dualAug (k : Type) [CommRing k] : TrivSqZeroExt k k →+* k :=
  (TrivSqZeroExt.fstHom ℤ k k).toRingHom

/-- The Dennis–Stein symbol `⟨aε, b⟩ ∈ K_2(k[ε], (ε))` (K2SymbolsBrauer T.6). -/
def dennisSteinSymbol (k : Type) [CommRing k] (a b : k) :
    (relativeK (ofRingMap (dualAug k))).homotopyGroup 2 := sorry

/-- The truncated polynomial ring `k[t]/(tⁿ)`. -/
abbrev truncPoly (k : Type) [CommRing k] (n : ℕ) : Type :=
  Polynomial k ⧸ Ideal.span {(Polynomial.X ^ n : Polynomial k)}

/-- The augmentation `k[t]/(tⁿ) → k`, `t ↦ 0`. -/
def truncAug (k : Type) [CommRing k] (n : ℕ) (hn : 0 < n) : truncPoly k n →+* k :=
  Ideal.Quotient.lift _ (Polynomial.evalRingHom 0) (fun a ha => by
    obtain ⟨b, rfl⟩ := Ideal.mem_span_singleton'.mp ha
    simp [zero_pow hn.ne'])

end RT3

/-- Node `RefinedTraceMethods:RT.3/low-degree-tests`. For a commutative ring `k`:
`π_1 K(k[ε], (ε)) ≅ (1 + εk)^× ≅ k`; the Dennis–Stein symbols `⟨aε, b⟩` generate
`K_2(k[ε], (ε))`, and for `1/2 ∈ k` van der Kallen's isomorphism `K_2(k[ε], (ε)) ≅ Ω¹_{k/ℤ}`
sends `⟨aε, b⟩` to `a·db` (the sign is absorbed in the isomorphism); for `k[t]/(tⁿ)` the
relative `K_1` is `(1 + t·k[t]/(tⁿ))^×` and the Dennis trace of a unit is `d log`. The
compatibility with `HC_1` for `ℚ ⊆ k` and the comparison of boundary maps with K2SymbolsBrauer's
relative Steinberg presentation are not stated. -/
theorem lowDegreeTests (k : Type) [CommRing k] :
    Nonempty ((relativeK (RT3.ofRingMap (RT3.dualAug k))).homotopyGroup 1 ≃+ k) ∧
    AddSubgroup.closure (Set.range fun ab : k × k => RT3.dennisSteinSymbol k ab.1 ab.2) = ⊤ ∧
    (Invertible (2 : k) →
      ∃ e : (relativeK (RT3.ofRingMap (RT3.dualAug k))).homotopyGroup 2 ≃+ Ω[k⁄ℤ],
        ∀ a b : k, e (RT3.dennisSteinSymbol k a b) = a • KaehlerDifferential.D ℤ k b) ∧
    ∀ (n : ℕ) (hn : 0 < n),
      Nonempty ((relativeK (RT3.ofRingMap (RT3.truncAug k n hn))).homotopyGroup 1 ≃+
        Additive (Units.map (RT3.truncAug k n hn).toMonoidHom).ker) ∧
      ∀ u : (RT3.truncPoly k n)ˣ,
        RT3.hh1Equiv _ (dennisTrace.toHH _ 1 (RT3.unitClass _ u)) =
          (↑u⁻¹ : RT3.truncPoly k n) • KaehlerDifferential.D ℤ (RT3.truncPoly k n) ↑u := sorry

/-! ### RT.3b/qp-coefficients -/

/-- `F(R; ℤ_p) := F(R)^∧_p`, applied to the spectrum `X = F(R)`. -/
def pAdicCoeff (p : ℕ) (X : Spectrum) : Spectrum := Spectrum.pCompletion p X

/-- `F(R; ℚ_p) := F(R)^∧_p[1/p]`: p-complete first, then invert p (not `F(R) ⊗ ℚ_p`, and not
`(F(R) ⊗ ℚ)^∧_p`, which vanishes). -/
def rationalPAdicCoeff (p : ℕ) (X : Spectrum) : Spectrum := (pAdicCoeff p X).rationalisation

namespace RT3

/-- The additive structure on maps of spectra (spectra form a stable, hence additive,
∞-category). -/
instance instPreadditiveSpectrum : Preadditive Spectrum := sorry

/-- The additive structure on maps of cyclotomic spectra. -/
instance instPreadditiveCyclotomic : Preadditive CyclotomicSpectrum := sorry

/-- The Postnikov section `τ_{≤n}` on spectra. -/
def truncLE (n : ℤ) : Spectrum ⥤ Spectrum := sorry

/-- The Postnikov section `τ_{≤n}` on cyclotomic spectra (t-structure with underlying
connective part). -/
def cycTruncLE (n : ℤ) : CyclotomicSpectrum ⥤ CyclotomicSpectrum := sorry

/-- `X ↦ X^∧_p` as a functor. -/
def pAdicFunctor (p : ℕ) : Spectrum ⥤ Spectrum where
  obj := pAdicCoeff p
  map := sorry
  map_id := sorry
  map_comp := sorry

/-- The map `X^∧_p → Y^∧_p`. -/
def pAdicMap (p : ℕ) {X Y : Spectrum} (f : X ⟶ Y) : pAdicCoeff p X ⟶ pAdicCoeff p Y :=
  (pAdicFunctor p).map f

/-- The map `X ⊗ ℚ → Y ⊗ ℚ`. -/
def rationalisationMap {X Y : Spectrum} (f : X ⟶ Y) :
    X.rationalisation ⟶ Y.rationalisation := sorry

/-- The localisation `X^∧_p → X^∧_p[1/p]`. -/
def invertP (p : ℕ) (X : Spectrum) : pAdicCoeff p X ⟶ rationalPAdicCoeff p X := sorry

/-- Exact endofunctors of spectra: functors preserving fibre sequences. -/
structure ExactEndofunctor where
  /-- The underlying functor. -/
  toFunctor : Spectrum ⥤ Spectrum
  /-- Fibre sequences are preserved. -/
  preserves : ∀ {X Y Z : Spectrum} (f : X ⟶ Y) (g : Y ⟶ Z),
    IsFibreSequence f g → IsFibreSequence (toFunctor.map f) (toFunctor.map g)

end RT3

/-- An isogeny: `f` with `g` and `N > 0` such that `g ∘ f = N` and `f ∘ g = N`. -/
def Isogeny {𝒞 : Type*} [Category 𝒞] [Preadditive 𝒞] {X Y : 𝒞} (f : X ⟶ Y) : Prop :=
  ∃ (g : Y ⟶ X) (N : ℕ), 0 < N ∧ f ≫ g = N • 𝟙 X ∧ g ≫ f = N • 𝟙 Y

/-- A quasi-isogeny of bounded-below spectra: each `τ_{≤n} f` is an isogeny (`N` may depend on
`n`). Quasi-isogenies are rational equivalences: `RT3.quasiIsogeny_rational`. -/
def QuasiIsogeny {X Y : Spectrum} (f : X ⟶ Y) : Prop :=
  X.IsBoundedBelow ∧ Y.IsBoundedBelow ∧ ∀ n : ℤ, Isogeny ((RT3.truncLE n).map f)

/-- The exact functor `F ↦ F(−; ℚ_p)` (p-completion followed by rationalisation). -/
def rationalPAdicCoeff.exact (p : ℕ) : RT3.ExactEndofunctor where
  toFunctor :=
    { obj := rationalPAdicCoeff p
      map := sorry
      map_id := sorry
      map_comp := sorry }
  preserves := sorry

namespace RT3

/-- The map `X(−; ℚ_p) → Y(−; ℚ_p)`. -/
def rationalPAdicMap (p : ℕ) {X Y : Spectrum} (f : X ⟶ Y) :
    rationalPAdicCoeff p X ⟶ rationalPAdicCoeff p Y :=
  (rationalPAdicCoeff.exact p).toFunctor.map f

/-- Quasi-isogenies become equivalences after `− ⊗ ℚ`, and after `(−; ℚ_p)`. -/
theorem quasiIsogeny_rational {X Y : Spectrum} (f : X ⟶ Y) (hf : QuasiIsogeny f) :
    IsIso (rationalisationMap f) ∧ ∀ p : ℕ, p.Prime → IsIso (rationalPAdicMap p f) := sorry

/-- A quasi-isogeny of bounded-below cyclotomic spectra: each `τ_{≤n} f` is an isogeny of
cyclotomic spectra. -/
def CycQuasiIsogeny {X Y : CyclotomicSpectrum} (f : X ⟶ Y) : Prop :=
  X.underlying.underlying.IsBoundedBelow ∧ Y.underlying.underlying.IsBoundedBelow ∧
    ∀ n : ℤ, Isogeny ((cycTruncLE n).map f)

end RT3

/-- Test `rationalPAdicCoeff.HZ` (computation): π_0 HZ(−; ℚ_p) = ℚ_p. -/
example (p : ℕ) [Fact p.Prime] :
    Nonempty ((rationalPAdicCoeff p (Spectrum.em ℤ)).homotopyGroup 0 ≃+ ℚ_[p]) := sorry

/-- Test `rationalPAdicCoeff.HQ` (degenerate): HQ(−; ℚ_p) = 0. -/
example (p : ℕ) [Fact p.Prime] : Nonempty (rationalPAdicCoeff p (Spectrum.em ℚ) ≅ Spectrum.zero) :=
  sorry

/-- Test `rationalPAdicCoeff.not_rationalise_first` (non-example): (HZ ⊗ ℚ)^∧_p = 0 ≠
HQ_p = HZ(−; ℚ_p): the order of completion and rationalisation matters. -/
example (p : ℕ) [Fact p.Prime] :
    Nonempty (Spectrum.pCompletion p (Spectrum.em ℤ).rationalisation ≅ Spectrum.zero) ∧
    Nonempty (rationalPAdicCoeff p (Spectrum.em ℤ) ≅ Spectrum.em ℚ_[p]) ∧
    ¬ Nonempty (rationalPAdicCoeff p (Spectrum.em ℤ) ≅ Spectrum.zero) := sorry

/-! ### RT.3b/trivial-vs-thh-fp -/

namespace RT3

/-- The forgetful functor from cyclotomic spectra to `T`-spectra. -/
def cycForget : CyclotomicSpectrum ⥤ SpectraWithAction T where
  obj X := X.underlying
  map := sorry
  map_id := sorry
  map_comp := sorry

/-- The underlying spectrum of a cyclotomic spectrum, as a functor. -/
def cycUnderlying : CyclotomicSpectrum ⥤ Spectrum where
  obj X := X.underlying.underlying
  map f := underlyingMap (cycForget.map f)
  map_id := sorry
  map_comp := sorry

/-- `ℤ^{triv}`: `Hℤ` with trivial `T`-action and trivial cyclotomic Frobenius
`ℤ → ℤ^{tC_p}`. -/
def Ztriv : CyclotomicSpectrum where
  underlying := SpectraWithAction.trivial T (Spectrum.em ℤ)
  frobenius := sorry

/-- The cyclotomic spectrum `ℤ_{hC_p}`. -/
def ZhCp (p : ℕ) : CyclotomicSpectrum := sorry

/-- `ℤ_{hC_p} → ℤ^{triv}`. -/
def ZhCpToZtriv (p : ℕ) : ZhCp p ⟶ Ztriv := sorry

/-- `ℤ^{triv} → THH(𝔽_p)` (from Bökstedt's theorem `THH(𝔽_p) ≃ τ_{≥0}(ℤ^{tC_p})`). -/
def ZtrivToTHHFp (p : ℕ) : Ztriv ⟶ THHcyc (E1Ring.ofRing (ZMod p)) := sorry

/-- The tensor product of cyclotomic spectra. -/
def cycTensor (X Y : CyclotomicSpectrum) : CyclotomicSpectrum := sorry

/-- `X ⊗ −` on maps. -/
def cycTensorMap (X : CyclotomicSpectrum) {Y Y' : CyclotomicSpectrum} (f : Y ⟶ Y') :
    cycTensor X Y ⟶ cycTensor X Y' := sorry

/-- `TP` on maps of `T`-spectra. -/
def tpMap {X Y : SpectraWithAction T} (f : X ⟶ Y) : TP X ⟶ TP Y := sorry

/-- `TC⁻` on maps of `T`-spectra. -/
def tcMinusMap {X Y : SpectraWithAction T} (f : X ⟶ Y) : TCminus X ⟶ TCminus Y := sorry

/-- The canonical map `TC(X) → TC⁻(X)`. -/
def tcToTCminus (X : CyclotomicSpectrum) : TC X ⟶ TCminus X.underlying := sorry

/-- Naturality of `TC → TC⁻`. -/
theorem tcToTCminus_natural {X Y : CyclotomicSpectrum} (f : X ⟶ Y) :
    TCmap f ≫ tcToTCminus Y = tcToTCminus X ≫ tcMinusMap (cycForget.map f) := sorry

/-- The E₁-ring spectrum `R ⊗_S 𝔽_p` (with `π_0 = R/p` and higher Tor^S-terms), not the ring
`R/p`. -/
def modpSpectral (R : Type) [Ring R] (p : ℕ) : E1Ring :=
  E1Ring.smash (E1Ring.ofRing R) (E1Ring.ofRing (ZMod p))

end RT3

/-- Node `RefinedTraceMethods:RT.3b/trivial-vs-thh-fp`. There is a cofibre sequence of
cyclotomic spectra `ℤ_{hC_p} → ℤ^{triv} → THH(𝔽_p)` (detected on underlying spectra, the
forgetful functor being exact and conservative); for bounded-below cyclotomic `X`,
`X ⊗ ℤ^{triv} → X ⊗ THH(𝔽_p)` is a p-adic TP-equivalence, the square of p-completed `TC` and
`TC⁻` terms is cartesian with fibre `(Σ(X ⊗ ℤ_{hC_p})_{hT})^∧_p`; and
`THH(R) ⊗ THH(𝔽_p) ≃ THH(R ⊗_S 𝔽_p)`. -/
theorem trivialVsThhFp (p : ℕ) [Fact p.Prime] :
    RT3.IsFibreSequence (RT3.cycUnderlying.map (RT3.ZhCpToZtriv p))
      (RT3.cycUnderlying.map (RT3.ZtrivToTHHFp p)) ∧
    (∀ X : CyclotomicSpectrum, X.underlying.underlying.IsBoundedBelow →
      IsIso (RT3.pAdicMap p (RT3.tpMap (RT3.cycForget.map (RT3.cycTensorMap X (RT3.ZtrivToTHHFp p)))))
      ∧ IsCartesianSquare
        ((RT3.pAdicFunctor p).map (RT3.TCmap (RT3.cycTensorMap X (RT3.ZtrivToTHHFp p))))
        ((RT3.pAdicFunctor p).map
          (RT3.tcMinusMap (RT3.cycForget.map (RT3.cycTensorMap X (RT3.ZtrivToTHHFp p)))))
        ((RT3.pAdicFunctor p).map (RT3.tcToTCminus _))
        ((RT3.pAdicFunctor p).map (RT3.tcToTCminus _))
        (RT3.map_square (RT3.pAdicFunctor p)
          (RT3.tcToTCminus_natural (RT3.cycTensorMap X (RT3.ZtrivToTHHFp p))))
      ∧ Nonempty (Spectrum.fib
          ((RT3.pAdicFunctor p).map (RT3.TCmap (RT3.cycTensorMap X (RT3.ZtrivToTHHFp p)))) ≅
        Spectrum.pCompletion p
          ((homotopyOrbits (RT3.cycForget.obj (RT3.cycTensor X (RT3.ZhCp p)))).shift 1))) ∧
    ∀ (R : Type) [Ring R], Nonempty (RT3.cycTensor (THHcyc (E1Ring.ofRing R))
      (THHcyc (E1Ring.ofRing (ZMod p))) ≅ THHcyc (RT3.modpSpectral R p)) := sorry

/-! ### RT.3b/reduction-quasi-isogeny -/

namespace RT3

/-- `R/p` for an associative ring: the quotient by the two-sided ideal `pR`. -/
abbrev modp (R : Type) [Ring R] (p : ℕ) : Type := (TwoSidedIdeal.span {(p : R)}).ringCon.Quotient

/-- The quotient map `R → R/p`. -/
def modpπ (R : Type) [Ring R] (p : ℕ) : R →+* modp R p := (TwoSidedIdeal.span {(p : R)}).ringCon.mk'

/-- The Postnikov truncation `R ⊗_S 𝔽_p → π_0(R ⊗_S 𝔽_p) = R/p`. -/
def modpSpectralToQuot (R : Type) [Ring R] (p : ℕ) :
    modpSpectral R p ⟶ E1Ring.ofRing (modp R p) := sorry

end RT3

/-- Node `RefinedTraceMethods:RT.3b/reduction-quasi-isogeny` (AMMN Theorem 3.4). If
`f : A → A′` is a map of connective E₁-rings that is a quasi-isogeny of spectra and
π_0-surjective with nilpotent kernel, then `THH(f)` is a quasi-isogeny of cyclotomic spectra and
`TC(f; ℤ_p)` is a quasi-isogeny; applied to `R ⊗_S 𝔽_p → R/p`, `TC(R ⊗_S 𝔽_p; ℤ_p) →
TC(R/p; ℤ_p)` is a quasi-isogeny and `TC(R ⊗_S 𝔽_p; ℚ_p) ≃ TC(R/p; ℚ_p)`. -/
theorem reductionQuasiIsogeny (p : ℕ) [Fact p.Prime] :
    (∀ {A A' : E1Ring} (f : A ⟶ A'), A.IsConnective → A'.IsConnective →
      QuasiIsogeny (E1Ring.toSpectrumMap f) → RT3.IsNilSurjection f →
      RT3.CycQuasiIsogeny (RT3.thhCycMap f) ∧ QuasiIsogeny (RT3.pAdicMap p (RT3.tcRingMap f))) ∧
    ∀ (R : Type) [Ring R],
      QuasiIsogeny (RT3.pAdicMap p (RT3.tcRingMap (RT3.modpSpectralToQuot R p))) ∧
      IsIso (RT3.rationalPAdicMap p (RT3.tcRingMap (RT3.modpSpectralToQuot R p))) := sorry

/-! ### RT.3b/crystalline-trace-map -/

/-- The comparison `β : TC(R ⊗_S 𝔽_p; ℤ_p) → HP(R; ℤ_p)`, built from `ℤ^{triv} → THH(𝔽_p)`
and the inverse of the p-adic TP-equivalence of RT.3b/trivial-vs-thh-fp. Its ℚ_p-version on
`TC(R/p; ℚ_p)` is `RT3.betaQuot`. -/
def beilinsonBeta (R : Type) [Ring R] (p : ℕ) :
    pAdicCoeff p (TC (THHcyc (RT3.modpSpectral R p))) ⟶ pAdicCoeff p (hpSpectrum R) :=
  sorry

namespace RT3

/-- `β` after inverting p in both source and target: from the p-inverted source `TC(R ⊗_S 𝔽_p; ℚ_p)` (the target is p-inverted). -/
def betaRational (R : Type) [Ring R] (p : ℕ) :
    rationalPAdicCoeff p (TC (THHcyc (modpSpectral R p))) ⟶ rationalPAdicCoeff p (hpSpectrum R) :=
  sorry

/-- The ℚ_p-version `β : TC(R/p; ℚ_p) → HP(R; ℚ_p)`, through the equivalence
`TC(R ⊗_S 𝔽_p; ℚ_p) ≃ TC(R/p; ℚ_p)` of RT.3b/reduction-quasi-isogeny. -/
def betaQuot (R : Type) [Ring R] (p : ℕ) [Fact p.Prime] :
    rationalPAdicCoeff p (TC (THHcyc (E1Ring.ofRing (modp R p)))) ⟶
      rationalPAdicCoeff p (hpSpectrum R) :=
  haveI := ((reductionQuasiIsogeny p).2 R).2
  inv (rationalPAdicMap p (tcRingMap (modpSpectralToQuot R p))) ≫ betaRational R p

/-- The map `R ⊗_S 𝔽_p → R' ⊗_S 𝔽_p` induced by a ring map. -/
def modpSpectralMap (p : ℕ) {R R' : Type} [Ring R] [Ring R'] (φ : R →+* R') :
    modpSpectral R p ⟶ modpSpectral R' p := sorry

/-- The unit map `R → R ⊗_S 𝔽_p`. -/
def toModpSpectral (R : Type) [Ring R] (p : ℕ) : E1Ring.ofRing R ⟶ modpSpectral R p := sorry

/-- The canonical map `TC(R) → TC⁻(R) → HC⁻(R)` (linearisation). -/
def tcToHCminus (R : Type) [Ring R] : TC (THHcyc (E1Ring.ofRing R)) ⟶ hcMinusSpectrum R := sorry

/-- The canonical map `can : HC⁻(R) → HP(R)`. -/
def canHP (R : Type) [Ring R] : hcMinusSpectrum R ⟶ hpSpectrum R := sorry

end RT3

/-- The crystalline trace `tr_crys = β ∘ tr : K(R/p; ℚ_p) → HP(R; ℚ_p)`. -/
def crystallineTrace (R : Type) [Ring R] (p : ℕ) [Fact p.Prime] :
    rationalPAdicCoeff p (connectiveK (Perf (E1Ring.ofRing (RT3.modp R p)))) ⟶
      rationalPAdicCoeff p (hpSpectrum R) :=
  RT3.rationalPAdicMap p (cyclotomicTrace.ofRing _) ≫ RT3.betaQuot R p

/-- `β` is natural in ring maps `R → R′`. -/
theorem beilinsonBeta.natural {R R' : Type} [Ring R] [Ring R'] (p : ℕ) (φ : R →+* R') :
    RT3.pAdicMap p (RT3.tcRingMap (RT3.modpSpectralMap p φ)) ≫ beilinsonBeta R' p =
      beilinsonBeta R p ≫ RT3.pAdicMap p (RT3.hpMap φ) := sorry

/-- `β ∘ (TC(R) → TC(R ⊗_S 𝔽_p)) = can ∘ (TC(R) → HC⁻(R))` on ℤ_p-coefficients. -/
theorem beilinsonBeta.commutes (R : Type) [Ring R] (p : ℕ) :
    RT3.pAdicMap p (RT3.tcRingMap (RT3.toModpSpectral R p)) ≫ beilinsonBeta R p =
      RT3.pAdicMap p (RT3.tcToHCminus R ≫ RT3.canHP R) := sorry

/-- Test `beilinsonBeta.zero` (degenerate): for R = 0 both sides vanish. -/
example (p : ℕ) : Nonempty (pAdicCoeff p (TC (THHcyc (RT3.modpSpectral Unit p))) ≅ Spectrum.zero) ∧
    Nonempty (pAdicCoeff p (hpSpectrum Unit) ≅ Spectrum.zero) := sorry

/-- Test `beilinsonBeta.Zp_pi0` (computation): for R = ℤ_p, π_0β : π_0TC(𝔽_p; ℚ_p) = ℚ_p →
HP_0(ℤ_p; ℚ_p) = ℚ_p is an isomorphism. -/
example (p : ℕ) [Fact p.Prime] :
    Nonempty ((rationalPAdicCoeff p (TC (THHcyc (E1Ring.ofRing (RT3.modp ℤ_[p] p))))).homotopyGroup 0
      ≃+ ℚ_[p]) ∧
    Nonempty ((rationalPAdicCoeff p (hpSpectrum ℤ_[p])).homotopyGroup 0 ≃+ ℚ_[p]) ∧
    Function.Bijective (Spectrum.homotopyGroupMap (RT3.betaQuot ℤ_[p] p) 0) := sorry

/-- Test `crystallineTrace.order` (non-example): `tr ∘ β` is not defined (β lands in HP, tr
starts in K); the crystalline trace is `β ∘ tr`, correcting AMMN Definition 2.14's printed
order. -/
example (R : Type) [Ring R] (p : ℕ) [Fact p.Prime] :
    crystallineTrace R p =
      RT3.rationalPAdicMap p (cyclotomicTrace.ofRing (E1Ring.ofRing (RT3.modp R p))) ≫
        RT3.betaQuot R p := sorry

/-! ### RT.3b/beilinson-square-spectral, RT.3b/beilinson-square-ordinary,
RT.3b/beilinson-fibre-sequence -/

/-- The square of RT.3b/beilinson-square-spectral commutes after inverting p. -/
theorem RT3.betaRational_comm (R : Type) [Ring R] (p : ℕ) :
    RT3.rationalPAdicMap p (RT3.tcRingMap (RT3.toModpSpectral R p)) ≫ RT3.betaRational R p =
      RT3.rationalPAdicMap p (RT3.tcToHCminus R) ≫ RT3.rationalPAdicMap p (RT3.canHP R) := sorry

/-- Node `RefinedTraceMethods:RT.3b/beilinson-square-spectral` (AMMN Theorem 2.12). For an
associative ring `R`, the natural square `TC(R; ℤ_p) → TC(R ⊗_S 𝔽_p)` over
`HC⁻(R; ℤ_p) → HP(R; ℤ_p)` (left map canonical, right map `β`) is cartesian after inverting p.
The bound "τ_{≤2i} of the total cofibre is killed by p^i for i ≤ p − 1" is not stated. -/
theorem beilinsonSquareSpectral (R : Type) [Ring R] (p : ℕ) (hp : p.Prime) :
    IsCartesianSquare (RT3.rationalPAdicMap p (RT3.tcRingMap (RT3.toModpSpectral R p)))
      (RT3.rationalPAdicMap p (RT3.canHP R)) (RT3.rationalPAdicMap p (RT3.tcToHCminus R))
      (RT3.betaRational R p) (RT3.betaRational_comm R p) := sorry

/-- The ordinary Beilinson square commutes. -/
theorem RT3.beilinsonSquare_comm (R : Type) [Ring R] (p : ℕ) [Fact p.Prime] :
    RT3.rationalPAdicMap p (RT3.tcRingMap (RT3.ofRingMap (RT3.modpπ R p))) ≫ RT3.betaQuot R p =
      RT3.rationalPAdicMap p (RT3.tcToHCminus R) ≫ RT3.rationalPAdicMap p (RT3.canHP R) := sorry

/-- Node `RefinedTraceMethods:RT.3b/beilinson-square-ordinary` (AMMN Corollary 3.9). For every
associative unital ring `R`, the square `TC(R; ℚ_p) → TC(R/p; ℚ_p)` over
`HC⁻(R; ℚ_p) → HP(R; ℚ_p)` (left map canonical, right map `β`) is cartesian; no henselian,
commutativity or completeness hypothesis. (The K-theoretic square for henselian commutative `R`
is not part of this node.) -/
theorem beilinsonSquareOrdinary (R : Type) [Ring R] (p : ℕ) [Fact p.Prime] :
    IsCartesianSquare (RT3.rationalPAdicMap p (RT3.tcRingMap (RT3.ofRingMap (RT3.modpπ R p))))
      (RT3.rationalPAdicMap p (RT3.canHP R)) (RT3.rationalPAdicMap p (RT3.tcToHCminus R))
      (RT3.betaQuot R p) (RT3.beilinsonSquare_comm R p) := sorry

/-- Node `RefinedTraceMethods:RT.3b/beilinson-fibre-sequence`. For every associative ring `R`,
`fib(TC(R; ℚ_p) → TC(R/p; ℚ_p)) ≃ Σ HC(R; ℚ_p)` and the cofibre is `Σ² HC(R; ℚ_p)` (homological
shifts; `HC = HH_{hT}`). The integral quasi-isogeny refinements and the shift dictionary are not
stated. -/
theorem beilinsonFibreSequence (R : Type) [Ring R] (p : ℕ) [Fact p.Prime] :
    Nonempty (Spectrum.fib (RT3.rationalPAdicMap p (RT3.tcRingMap (RT3.ofRingMap (RT3.modpπ R p))))
      ≅ (rationalPAdicCoeff p (hcSpectrum R)).shift 1) ∧
    Nonempty (Spectrum.cofib
        (RT3.rationalPAdicMap p (RT3.tcRingMap (RT3.ofRingMap (RT3.modpπ R p)))) ≅
      (rationalPAdicCoeff p (hcSpectrum R)).shift 2) := sorry

/-! ### RT.3b/graded-beilinson-square -/

namespace RT3

/-- The weight-`n` syntomic complex `ℤ_p(n)(R)` (BMS2 graded piece of TC; PrismaticCohomology
PR.4/syntomic-complex), as a spectrum. -/
def syntomicZp (p n : ℕ) (R : Type) [CommRing R] : Spectrum := sorry

/-- `ℤ_p(n)(R) → ℤ_p(n)(S)` for a ring map. -/
def syntomicMap (p n : ℕ) {R S : Type} [CommRing R] [CommRing S] (φ : R →+* S) :
    syntomicZp p n R ⟶ syntomicZp p n S := sorry

/-- p-completed derived de Rham cohomology `LΩ_R` (DerivedDeRhamCohomology DD.2). -/
def derivedDeRham (p : ℕ) (R : Type) [CommRing R] : Spectrum := sorry

/-- The derived Hodge filtration `LΩ^{≥n}_R` (not Hodge-completed). -/
def derivedDeRhamFil (p n : ℕ) (R : Type) [CommRing R] : Spectrum := sorry

/-- The inclusion `LΩ^{≥n}_R → LΩ_R`. -/
def filIncl (p n : ℕ) (R : Type) [CommRing R] : derivedDeRhamFil p n R ⟶ derivedDeRham p R :=
  sorry

/-- `LΩ_R / LΩ^{≥n}_R`. -/
def deRhamQuot (p n : ℕ) (R : Type) [CommRing R] : Spectrum := Spectrum.cofib (filIncl p n R)

/-- Reduction on the Hodge quotient; the integral low-weight comparison uses its fibre. -/
def deRhamQuotMap (p n : ℕ) (R : Type) [CommRing R] :
    deRhamQuot p n R ⟶ deRhamQuot p n (R ⧸ Ideal.span {(p : R)}) := sorry

/-- The left vertical map `ℚ_p(n)(R) → (LΩ^{≥n}_R)_{ℚ_p}`. -/
def syntomicToFil (p n : ℕ) (R : Type) [CommRing R] :
    rationalPAdicCoeff p (syntomicZp p n R) ⟶ rationalPAdicCoeff p (derivedDeRhamFil p n R) := sorry

/-- The right vertical map `χ_n : ℚ_p(n)(R/p) → (LΩ_R)_{ℚ_p}` (from a natural
`ℤ_p(n)(R/p) → p^{−N} LΩ_R`). -/
def chi (p n : ℕ) (R : Type) [CommRing R] :
    rationalPAdicCoeff p (syntomicZp p n (R ⧸ Ideal.span {(p : R)})) ⟶
      rationalPAdicCoeff p (derivedDeRham p R) := sorry

/-- The graded Beilinson square commutes. -/
theorem gradedSquare_comm (p n : ℕ) (R : Type) [CommRing R] :
    rationalPAdicMap p (syntomicMap p n (Ideal.Quotient.mk (Ideal.span {(p : R)}))) ≫ chi p n R =
      syntomicToFil p n R ≫ rationalPAdicMap p (filIncl p n R) := sorry

end RT3

namespace RT3
/-- Derived p-completed cotangent object L_{R/Z_p}, supplied by DD.0. -/
def pCotangent (p : ℕ) (R : Type) [CommRing R] : RT1.DMod R := sorry
/-- Tor amplitude in homological [0,1], tested on every discrete R-module. -/
def CotangentTorAmplitudeZeroOne (p : ℕ) (R : Type) [CommRing R] : Prop :=
  ∀ (M : ModuleCat.{0} R) (j : ℤ), j<0 ∨ 1<j →
    Limits.IsZero ((RT1.DMod.tensorL (pCotangent p R) (RT1.DMod.ofModule M)).homology j)
end RT3

/-- Node `RefinedTraceMethods:RT.3b/graded-beilinson-square` (AMMN Theorem 6.17). For a
p-complete p-torsion-free quasisyntomic ring `R` and `n ≥ 0`, the square
`ℚ_p(n)(R) → ℚ_p(n)(R/p)` over `(LΩ^{≥n}_R)_{ℚ_p} → (LΩ_R)_{ℚ_p}` (right map `χ_n`) is
cartesian; equivalently `fib(ℚ_p(n)(R) → ℚ_p(n)(R/p)) ≃ (LΩ_R/LΩ^{≥n}_R)_{ℚ_p}[−1]`
(cohomological `[−1]` = `Σ^{−1}`); integrally `cofib(ℤ_p(n)(R) → ℤ_p(n)(R/p))` is isogenous to
`LΩ_R/LΩ^{≥n}_R`, and, for `n ≤ p − 2`, the integral syntomic fibre is
`fib(LΩ_R/LΩ^{≥n}_R → LΩ_{R/p}/LΩ^{≥n}_{R/p})[−1]`. The DD.0 cotangent interface supplies the explicit Tor-amplitude hypothesis
in homological degrees [0,1] (cohomological [−1,0]); the quasiregular-semiperfectoid identification with
`A_crys^{φ = p^n}` are not stated. Proposition 6.21 classifies endomorphisms of ℤ_p(n),
not uniqueness of χ_n. -/
theorem gradedBeilinsonSquare (p : ℕ) [Fact p.Prime] (R : Type) [CommRing R]
    (hcompl : IsAdicComplete (Ideal.span {(p : R)}) R)
    (htf : ∀ x : R, (p : R) * x = 0 → x = 0)
    (hL : RT3.CotangentTorAmplitudeZeroOne p R) (n : ℕ) :
    IsCartesianSquare
      (RT3.rationalPAdicMap p (RT3.syntomicMap p n (Ideal.Quotient.mk (Ideal.span {(p : R)}))))
      (RT3.rationalPAdicMap p (RT3.filIncl p n R)) (RT3.syntomicToFil p n R) (RT3.chi p n R)
      (RT3.gradedSquare_comm p n R) ∧
    Nonempty (Spectrum.fib
        (RT3.rationalPAdicMap p (RT3.syntomicMap p n (Ideal.Quotient.mk (Ideal.span {(p : R)})))) ≅
      (rationalPAdicCoeff p (RT3.deRhamQuot p n R)).shift (-1)) ∧
    (∃ q : Spectrum.cofib (RT3.syntomicMap p n (Ideal.Quotient.mk (Ideal.span {(p : R)}))) ⟶
        RT3.deRhamQuot p n R, Isogeny q) ∧
    (n + 2 ≤ p → Nonempty (Spectrum.fib
      (RT3.syntomicMap p n (Ideal.Quotient.mk (Ideal.span {(p : R)}))) ≅
        (Spectrum.fib (RT3.deRhamQuotMap p n R)).shift (-1))) :=
  sorry


end RefinedTraceMethods

namespace RefinedTraceMethods

/-! ## RT.4:topological — complex topological K-theory, KU and ku

Spaces are types with a topology; "compact Hausdorff" is `[CompactSpace X] [T2Space X]`. Spheres
are modelled by unit spheres of the sup norm on `Fin (n + 1) → ℝ` (boundaries of cubes,
homeomorphic to the round spheres), disks by closed unit balls. Complex vector bundles are
Mathlib `VectorBundle ℂ (Fin r → ℂ) E` bundled in `RT4T.ComplexVectorBundle`, and
`TopK X` is Mathlib's `Algebra.GrothendieckAddGroup` of the semiring `RT4T.Vect X` of their
isomorphism classes. Helpers that are not packet names carry the prefix `RT4T`. -/

namespace RT4T

/-- The sphere `Sⁿ`, modelled as the unit sphere of the sup norm in `ℝⁿ⁺¹`. -/
abbrev sphere (n : ℕ) : Type := ↥(Metric.sphere (0 : Fin (n + 1) → ℝ) 1)

/-- The base point `(1, 0, …, 0)` of `Sⁿ`. -/
def sphere.base (n : ℕ) : sphere n := ⟨Pi.single 0 1, sorry⟩

/-- The disk `Dⁿ`, modelled as the closed unit ball of the sup norm in `ℝⁿ`. -/
abbrev disk (n : ℕ) : Type := ↥(Metric.closedBall (0 : Fin n → ℝ) 1)

/-- The boundary sphere `Sⁿ⁻¹ ⊆ Dⁿ`. -/
def diskBoundary (n : ℕ) : TopologicalSpace.Closeds (disk n) :=
  ⟨{x | ‖(x : Fin n → ℝ)‖ = 1}, sorry⟩

/-- A closed subspace of a compact space is compact. -/
instance closeds_compactSpace {X : Type} [TopologicalSpace X] [CompactSpace X]
    (A : TopologicalSpace.Closeds X) : CompactSpace A := sorry

/-- The inclusion of a closed subspace. -/
def closedsIncl {X : Type} [TopologicalSpace X] (A : TopologicalSpace.Closeds X) : C(A, X) :=
  ⟨Subtype.val, continuous_subtype_val⟩

/-- The relation on `X ⊕ pt` identifying all points of `A ⊔ pt`. -/
def collapseRel {X : Type} (A : Set X) (a b : X ⊕ Unit) : Prop :=
  a ∈ (Sum.inl '' A ∪ {Sum.inr ()}) ∧ b ∈ (Sum.inl '' A ∪ {Sum.inr ()})

/-- The quotient `X/A` with `A` collapsed to the base point, realised as `(X ⊔ pt)/(A ⊔ pt)`;
for `A = ∅` this is `X₊`. -/
abbrev collapse (X : Type) [TopologicalSpace X] (A : TopologicalSpace.Closeds X) : Type :=
  Quot (collapseRel (A : Set X))

instance collapse.compactSpace (X : Type) [TopologicalSpace X] [CompactSpace X]
    (A : TopologicalSpace.Closeds X) : CompactSpace (collapse X A) := sorry

instance collapse.t2Space (X : Type) [TopologicalSpace X] [CompactSpace X] [T2Space X]
    (A : TopologicalSpace.Closeds X) : T2Space (collapse X A) := sorry

/-- The base point of `X/A`. -/
def collapse.base (X : Type) [TopologicalSpace X] (A : TopologicalSpace.Closeds X) :
    collapse X A :=
  Quot.mk _ (Sum.inr ())

/-- The quotient map `X → X/A`. -/
def collapse.proj (X : Type) [TopologicalSpace X] (A : TopologicalSpace.Closeds X) :
    C(X, collapse X A) :=
  ⟨fun x => Quot.mk _ (Sum.inl x), sorry⟩

/-- The smash product `X ∧ Y = X × Y / (X × {y₀} ∪ {x₀} × Y)` of pointed spaces. -/
abbrev smash (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y] [T2Space X] [T2Space Y]
    (x₀ : X) (y₀ : Y) : Type :=
  collapse (X × Y) ⟨{p | p.1 = x₀ ∨ p.2 = y₀}, sorry⟩

/-- Two maps are homotopic: there is a continuous `H : I × Y → X` from `f` to `g`. -/
def Homotopic {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y] (f g : C(Y, X)) : Prop :=
  ∃ H : C(unitInterval × Y, X), ∀ y, H (0, y) = f y ∧ H (1, y) = g y

/-- Homotopy classes of maps `[Y, X]`. -/
def homotopyClasses (Y X : Type) [TopologicalSpace X] [TopologicalSpace Y] : Type :=
  Quot (fun f g : C(Y, X) => Homotopic f g)

/-- Pointed homotopy classes `[Y, X]_*` of base-point preserving maps (pointed homotopies). -/
def pointedHomotopyClasses (Y X : Type) [TopologicalSpace X] [TopologicalSpace Y] (y₀ : Y)
    (x₀ : X) : Type :=
  Quot (fun f g : {f : C(Y, X) // f y₀ = x₀} =>
    ∃ H : C(unitInterval × Y, X), (∀ y, H (0, y) = f.1 y ∧ H (1, y) = g.1 y) ∧ ∀ t, H (t, y₀) = x₀)

/-- `X` and `Y` are homotopy equivalent. -/
def HomotopyEquivalent (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y] : Prop :=
  ∃ (f : C(X, Y)) (g : C(Y, X)), Homotopic (g.comp f) (ContinuousMap.id X) ∧
    Homotopic (f.comp g) (ContinuousMap.id Y)

/-- A complex vector bundle of constant rank `rank` over `X`: Mathlib's
`VectorBundle ℂ (Fin rank → ℂ) Fiber`, bundled. -/
structure ComplexVectorBundle (X : Type) [TopologicalSpace X] : Type 1 where
  /-- The rank. -/
  rank : ℕ
  /-- The fibres. -/
  Fiber : X → Type
  [instAddCommGroup : ∀ x, AddCommGroup (Fiber x)]
  [instModule : ∀ x, Module ℂ (Fiber x)]
  [instTopFiber : ∀ x, TopologicalSpace (Fiber x)]
  [instTopTotal : TopologicalSpace (Bundle.TotalSpace (Fin rank → ℂ) Fiber)]
  [instFiberBundle : FiberBundle (Fin rank → ℂ) Fiber]
  [instVectorBundle : VectorBundle ℂ (Fin rank → ℂ) Fiber]

attribute [instance] ComplexVectorBundle.instAddCommGroup ComplexVectorBundle.instModule
  ComplexVectorBundle.instTopFiber ComplexVectorBundle.instTopTotal
  ComplexVectorBundle.instFiberBundle ComplexVectorBundle.instVectorBundle

namespace ComplexVectorBundle

variable {X : Type} [TopologicalSpace X]

/-- An isomorphism of complex vector bundles: fibrewise linear isomorphisms that are
homeomorphisms of total spaces. -/
structure Iso (E F : ComplexVectorBundle X) where
  /-- The fibrewise linear isomorphisms. -/
  fiberEquiv : ∀ x, E.Fiber x ≃ₗ[ℂ] F.Fiber x
  continuous_toFun : Continuous (fun v : Bundle.TotalSpace (Fin E.rank → ℂ) E.Fiber =>
    (⟨v.proj, fiberEquiv v.proj v.snd⟩ : Bundle.TotalSpace (Fin F.rank → ℂ) F.Fiber))
  continuous_invFun : Continuous (fun v : Bundle.TotalSpace (Fin F.rank → ℂ) F.Fiber =>
    (⟨v.proj, (fiberEquiv v.proj).symm v.snd⟩ : Bundle.TotalSpace (Fin E.rank → ℂ) E.Fiber))

/-- The trivial bundle `εⁿ = X × ℂⁿ` (Mathlib `Bundle.Trivial X (Fin n → ℂ)`). -/
def trivial (X : Type) [TopologicalSpace X] (n : ℕ) : ComplexVectorBundle X := sorry

/-- The Whitney sum `E ⊕ F` (fibres `E_x × F_x`). -/
def directSum (E F : ComplexVectorBundle X) : ComplexVectorBundle X := sorry

/-- The tensor product `E ⊗ F` (fibres `E_x ⊗[ℂ] F_x`). -/
def tensor (E F : ComplexVectorBundle X) : ComplexVectorBundle X := sorry

/-- The exterior power `ΛⁱE` (fibres `⋀[ℂ]^i E_x`). -/
def exteriorPower (E : ComplexVectorBundle X) (i : ℕ) : ComplexVectorBundle X := sorry

/-- The fibres of `ΛⁱE` are the exterior powers of the fibres of `E`. -/
theorem exteriorPower_fiber (E : ComplexVectorBundle X) (i : ℕ) (x : X) :
    Nonempty ((E.exteriorPower i).Fiber x ≃ₗ[ℂ] ⋀[ℂ]^i (E.Fiber x)) := sorry

/-- The pullback bundle `f*E` (Mathlib `Bundle.Pullback`). -/
def pullback {Y : Type} [TopologicalSpace Y] (f : C(Y, X)) (E : ComplexVectorBundle X) :
    ComplexVectorBundle Y := sorry

theorem pullback_fiber {Y : Type} [TopologicalSpace Y] (f : C(Y, X))
    (E : ComplexVectorBundle X) (y : Y) :
    Nonempty ((E.pullback f).Fiber y ≃ₗ[ℂ] E.Fiber (f y)) := sorry

end ComplexVectorBundle

/-- Isomorphism classes of complex vector bundles of finite, locally constant rank over `X`, a
commutative semiring under Whitney sum (`+`) and tensor product (`*`), zero the zero bundle and
one the trivial line bundle. A bundle of locally constant rank is a finite disjoint union of
constant-rank bundles over clopen pieces (`Vect.extendByZero`). -/
def Vect (X : Type) [TopologicalSpace X] : Type 1 := sorry

instance (X : Type) [TopologicalSpace X] : CommSemiring (Vect X) := sorry

namespace Vect

variable {X : Type} [TopologicalSpace X]

/-- The class `[E]` of a constant-rank bundle. -/
def mk (E : ComplexVectorBundle X) : Vect X := sorry

/-- The class of a bundle on a clopen piece, extended by the zero bundle. -/
def extendByZero (U : TopologicalSpace.Clopens X) (E : ComplexVectorBundle U) : Vect X := sorry

theorem mk_eq_mk_iff (E F : ComplexVectorBundle X) : mk E = mk F ↔ Nonempty (E.Iso F) := sorry

theorem mk_directSum (E F : ComplexVectorBundle X) : mk (E.directSum F) = mk E + mk F := sorry

theorem mk_tensor (E F : ComplexVectorBundle X) : mk (E.tensor F) = mk E * mk F := sorry

theorem mk_trivial (n : ℕ) : mk (ComplexVectorBundle.trivial X n) = (n : Vect X) := sorry

theorem exists_eq_sum (v : Vect X) : ∃ (n : ℕ) (U : Fin n → TopologicalSpace.Clopens X)
    (E : ∀ i, ComplexVectorBundle (U i)), v = ∑ i, extendByZero (U i) (E i) := sorry

end Vect

/-- `H⁰(X; ℤ)`: the ring of locally constant (= continuous) functions `X → ℤ`. -/
def H0 (X : Type) [TopologicalSpace X] : Subring (X → ℤ) where
  carrier := {f | Continuous f}
  mul_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  zero_mem' := sorry
  neg_mem' := sorry

end RT4T

/-! ### RT.4:topological/complex-k-theory -/

/-- `K(X) = KU⁰(X)` for compact Hausdorff `X`: the Grothendieck group
(Mathlib `Algebra.GrothendieckGroup`, additive form `Algebra.GrothendieckAddGroup`) of the monoid `(Vect_ℂ(X), ⊕)`. It is a commutative
ring under the tensor product (instance below, whose additive group is that of the
Grothendieck group). Topological, not algebraic, K-theory. -/
def TopK (X : Type) [TopologicalSpace X] [CompactSpace X] [T2Space X] : Type 1 :=
  Algebra.GrothendieckAddGroup (RT4T.Vect X)

instance (X : Type) [TopologicalSpace X] [CompactSpace X] [T2Space X] : CommRing (TopK X) where
  __ := (inferInstance : AddCommGroup (Algebra.GrothendieckAddGroup (RT4T.Vect X)))
  mul := sorry
  one := sorry
  mul_assoc := sorry
  one_mul := sorry
  mul_one := sorry
  left_distrib := sorry
  right_distrib := sorry
  zero_mul := sorry
  mul_zero := sorry
  mul_comm := sorry

namespace TopK

variable {X Y Z : Type} [TopologicalSpace X] [CompactSpace X] [T2Space X]
  [TopologicalSpace Y] [CompactSpace Y] [T2Space Y]
  [TopologicalSpace Z] [CompactSpace Z] [T2Space Z]

/-- `[E] ∈ K(X)`: the Grothendieck-group map, a ring map, so `[E ⊕ F] = [E] + [F]` and
`[E ⊗ F] = [E][F]` (`RT4T.Vect.mk_directSum`, `RT4T.Vect.mk_tensor`). -/
def ofBundle : RT4T.Vect X →+* TopK X where
  toFun := Algebra.GrothendieckAddGroup.of
  map_one' := sorry
  map_mul' := sorry
  map_zero' := sorry
  map_add' := sorry

/-- `f* : K(X) → K(Y)` for `f : Y → X`, a ring homomorphism, by pullback of bundles
(functoriality: `RT4T.TopK.pullback_id`, `RT4T.TopK.pullback_comp`). -/
def pullback (f : C(Y, X)) : TopK X →+* TopK Y := sorry

/-- Homotopic maps induce the same map on `K`. -/
theorem homotopy_invariant (f g : C(Y, X)) (h : RT4T.Homotopic f g) :
    pullback f = pullback g := sorry

/-- `rank : K(X) → H⁰(X; ℤ)` (locally constant functions), a ring homomorphism. -/
def rank : TopK X →+* RT4T.H0 X := sorry

/-- Every element of `K(X)` is `[E] − [εᴺ]`; `[E] = [F]` iff `E ⊕ εⁿ ≅ F ⊕ εⁿ` for some `n`. -/
theorem exists_complement :
    (∀ x : TopK X, ∃ (v : RT4T.Vect X) (N : ℕ),
      x = ofBundle v - ofBundle (RT4T.Vect.mk (.trivial X N))) ∧
    ∀ E F : RT4T.ComplexVectorBundle X,
      ofBundle (RT4T.Vect.mk E) = ofBundle (RT4T.Vect.mk F) ↔
        ∃ n : ℕ, Nonempty ((E.directSum (.trivial X n)).Iso (F.directSum (.trivial X n))) := sorry

end TopK

namespace RT4T.TopK

variable {X Y Z : Type} [TopologicalSpace X] [CompactSpace X] [T2Space X]
  [TopologicalSpace Y] [CompactSpace Y] [T2Space Y]
  [TopologicalSpace Z] [CompactSpace Z] [T2Space Z]

theorem pullback_id : TopK.pullback (ContinuousMap.id X) = RingHom.id (TopK X) := sorry

theorem pullback_comp (f : C(Y, X)) (g : C(Z, Y)) :
    TopK.pullback (f.comp g) = (TopK.pullback g).comp (TopK.pullback f) := sorry

theorem pullback_ofBundle (f : C(Y, X)) (E : ComplexVectorBundle X) :
    TopK.pullback f (TopK.ofBundle (Vect.mk E)) = TopK.ofBundle (Vect.mk (E.pullback f)) := sorry

end RT4T.TopK

/-- The tautological (Hopf) line bundle `H` on `ℂP¹ ≅ S²`. -/
def RT4T.hopfBundle : RT4T.ComplexVectorBundle (RT4T.sphere 2) := sorry

theorem RT4T.hopfBundle_rank : RT4T.hopfBundle.rank = 1 := sorry

/-! ### RT.4:topological/reduced-and-graded-k -/

namespace TopK

variable {X Y : Type} [TopologicalSpace X] [CompactSpace X] [T2Space X]
  [TopologicalSpace Y] [CompactSpace Y] [T2Space Y]

/-- `K̃(X) = ker(K(X) → K(pt))` for a pointed compact space `(X, x₀)`. -/
abbrev reduced (X : Type) [TopologicalSpace X] [CompactSpace X] [T2Space X] (x₀ : X) : Type 1 :=
  ↥(RingHom.ker (pullback (ContinuousMap.const Unit x₀)))

/-- `K(X, A) := K̃(X/A)` for a closed subspace `A` (for `A = ∅`, `X/∅ = X₊` and `K(X, ∅) = K(X)`). -/
abbrev relative (X : Type) [TopologicalSpace X] [CompactSpace X] [T2Space X]
    (A : TopologicalSpace.Closeds X) : Type 1 :=
  reduced (RT4T.collapse X A) (RT4T.collapse.base X A)

/-- `K⁻ⁿ(X) := K̃(Sⁿ ∧ X₊)`, with `X₊ = X ⊕ pt` based at the added point. -/
abbrev negative (n : ℕ) (X : Type) [TopologicalSpace X] [CompactSpace X] [T2Space X] : Type 1 :=
  reduced (RT4T.smash (RT4T.sphere n) (X ⊕ Unit) (RT4T.sphere.base n) (Sum.inr ()))
    (RT4T.collapse.base _ _)

end TopK

/-- The map `f* : K⁻ⁿ(X) → K⁻ⁿ(Y)` induced by `f : Y → X`. -/
def RT4T.TopK.negativeMap {X Y : Type} [TopologicalSpace X] [CompactSpace X] [T2Space X]
    [TopologicalSpace Y] [CompactSpace Y] [T2Space Y] (n : ℕ) (f : C(Y, X)) :
    TopK.negative n X →+ TopK.negative n Y := sorry

namespace TopK

variable {X Y : Type} [TopologicalSpace X] [CompactSpace X] [T2Space X]
  [TopologicalSpace Y] [CompactSpace Y] [T2Space Y]

/-- The long exact sequence `K⁻¹(X) → K⁻¹(A) → K(X, A) → K(X) → K(A)` of a compact pair:
exactness at `K(X)`, at `K(X, A)` (with a connecting map `δ`) and at `K⁻¹(A)`. -/
theorem les (A : TopologicalSpace.Closeds X) :
    (∀ x : TopK X, pullback (RT4T.closedsIncl A) x = 0 ↔
      ∃ y : relative X A, pullback (RT4T.collapse.proj X A) y.1 = x) ∧
    ∃ δ : negative 1 A →+ relative X A,
      (∀ y : relative X A, pullback (RT4T.collapse.proj X A) y.1 = 0 ↔ ∃ z, δ z = y) ∧
      (∀ z : negative 1 A, δ z = 0 ↔
        ∃ w : negative 1 X, RT4T.TopK.negativeMap 1 (RT4T.closedsIncl A) w = z) := sorry

/-- The external product `K⁻ⁱ(X) ⊗ K⁻ʲ(Y) → K⁻ⁱ⁻ʲ(X × Y)`, a biadditive map. It is associative
and unital; these laws need the identifications `Sⁱ ∧ Sʲ ≅ Sⁱ⁺ʲ` and are not stated here. -/
def externalProduct (i j : ℕ) :
    negative i X →+ negative j Y →+ negative (i + j) (X × Y) := sorry

end TopK

/-- Test `TopK.point` (computation): K(pt) ≅ ℤ via rank. -/
example : Function.Bijective (TopK.rank (X := Unit)) := sorry

/-- Test `TopK.empty` (degenerate): K(∅) = 0. -/
example : Subsingleton (TopK Empty) := sorry

/-- Test `TopK.sphere_two` (computation): K(S²) ≅ ℤ[H]/(H − 1)², with H the tautological line
bundle on ℂP¹. -/
example : ∃ e : TopK (RT4T.sphere 2) ≃+*
      Polynomial ℤ ⧸ Ideal.span {((Polynomial.X : Polynomial ℤ) - 1) ^ 2},
    e (TopK.ofBundle (RT4T.Vect.mk RT4T.hopfBundle)) = Ideal.Quotient.mk _ Polynomial.X := sorry

/-- Test `TopK.not_algebraic` (non-example): K⁻¹(pt) = K̃(S¹) = 0 while the algebraic
K₁(ℂ) = ℂ^× ≠ 0. -/
example : Subsingleton (TopK.negative 1 Unit) ∧
    Nonempty ((connectiveK (Perf (E1Ring.ofRing ℂ))).homotopyGroup 1 ≃+ Additive ℂˣ) := sorry

/-- Test `TopK.reduced_point` (degenerate): K̃(S⁰) = ℤ and K̃(pt) = 0. -/
example : Nonempty (TopK.reduced (RT4T.sphere 0) (RT4T.sphere.base 0) ≃+ ℤ) ∧
    Subsingleton (TopK.reduced Unit ()) := sorry

/-- Test `TopK.reduced_S1` (computation): K̃(S¹) = 0. -/
example : Subsingleton (TopK.reduced (RT4T.sphere 1) (RT4T.sphere.base 1)) := sorry

/-- Test `TopK.relative_not_quotient_naive` (non-example): K(D², S¹) = K̃(S²) = ℤ while
ker(K(D²) → K(S¹)) = 0. -/
example : Nonempty (TopK.relative (RT4T.disk 2) (RT4T.diskBoundary 2) ≃+ ℤ) ∧
    ∀ x : TopK (RT4T.disk 2), TopK.pullback (RT4T.closedsIncl (RT4T.diskBoundary 2)) x = 0 →
      x = 0 := sorry

/-! ### RT.4:topological/bott-periodicity -/

/-- The Bott class `β = [H] − 1 ∈ K̃(S²)`. -/
def RT4T.bottClass : TopK.reduced (RT4T.sphere 2) (RT4T.sphere.base 2) :=
  ⟨TopK.ofBundle (RT4T.Vect.mk RT4T.hopfBundle) - 1, sorry⟩

/-- `K⁻ⁿ(pt) = K̃(Sⁿ ∧ pt₊) ≅ K̃(Sⁿ)`, induced by the homeomorphism `Sⁿ ∧ pt₊ ≅ Sⁿ`. -/
def RT4T.TopK.negativePointEquiv (n : ℕ) :
    TopK.negative n Unit ≃+ TopK.reduced (RT4T.sphere n) (RT4T.sphere.base n) := sorry

/-- Multiplication by `β`: `K⁻ⁿ(X) → K⁻ⁿ⁻²(X × pt) = K⁻ⁿ⁻²(X)`, `x ↦ x × β`. -/
def RT4T.TopK.bottMap (n : ℕ) (X : Type) [TopologicalSpace X] [CompactSpace X] [T2Space X] :
    TopK.negative n X →+ TopK.negative (n + 2) X :=
  (RT4T.TopK.negativeMap (n + 2) ⟨fun x => (x, ()), by fun_prop⟩).comp
    ((TopK.externalProduct n 2).flip ((RT4T.TopK.negativePointEquiv 2).symm RT4T.bottClass))

open scoped TensorProduct in
/-- Bott periodicity (RT.4:topological/bott-periodicity): the external product
`K(X) ⊗ K(S²) → K(X × S²)` is a ring isomorphism; multiplication by `β` gives
`K⁻ⁿ(X) ≅ K⁻ⁿ⁻²(X)`; `K̃(S²ⁿ) ≅ ℤ` (generated by `βⁿ`) and `K̃(S²ⁿ⁺¹) = 0`. -/
theorem bottPeriodicity (X : Type) [TopologicalSpace X] [CompactSpace X] [T2Space X] :
    (∃ e : TopK X ⊗[ℤ] TopK (RT4T.sphere 2) ≃+* TopK (X × RT4T.sphere 2),
      ∀ a b, e (a ⊗ₜ b) = TopK.pullback (ContinuousMap.fst) a * TopK.pullback ContinuousMap.snd b) ∧
    (∀ n : ℕ, Function.Bijective (RT4T.TopK.bottMap n X)) ∧
    ∀ n : ℕ, Nonempty (TopK.reduced (RT4T.sphere (2 * n)) (RT4T.sphere.base (2 * n)) ≃+ ℤ) ∧
      Subsingleton (TopK.reduced (RT4T.sphere (2 * n + 1)) (RT4T.sphere.base (2 * n + 1))) :=
  sorry

/-! ### RT.4:topological/bu-representability -/

namespace RT4T

/-- The infinite Grassmannian `Gₙ(ℂ^∞)` of `n`-planes (StableHomotopyKTheory H.1). -/
def grassmannian (n : ℕ) : Type := sorry

instance (n : ℕ) : TopologicalSpace (grassmannian n) := sorry

/-- `BU = colimₙ Gₙ(ℂ^∞)`. -/
def BU : Type := sorry

instance : TopologicalSpace BU := sorry

/-- The base point of `BU`. -/
def BU.base : BU := sorry

/-- The infinite unitary group `U = colimₙ U(n)`. -/
def U : Type := sorry

instance : TopologicalSpace U := sorry

/-- The identity element of `U`. -/
def U.one : U := sorry

/-- The based loop space `Ω(Y, y₀)` with the compact-open topology. -/
def loopSpace (Y : Type) [TopologicalSpace Y] (y₀ : Y) : Type :=
  {γ : C(unitInterval, Y) // γ 0 = y₀ ∧ γ 1 = y₀}

instance (Y : Type) [TopologicalSpace Y] (y₀ : Y) : TopologicalSpace (loopSpace Y y₀) := sorry

/-- The constant loop. -/
def loopSpace.const (Y : Type) [TopologicalSpace Y] (y₀ : Y) : loopSpace Y y₀ :=
  ⟨ContinuousMap.const _ y₀, rfl, rfl⟩

/-- Isomorphism classes of rank-`n` complex vector bundles over `X`. -/
def VectRank (X : Type) [TopologicalSpace X] (n : ℕ) : Type 1 :=
  Quot (fun E F : {E : ComplexVectorBundle X // E.rank = n} => Nonempty (E.1.Iso F.1))

end RT4T

/- Representability (RT.4:topological/bu-representability): rank-`n` bundles over paracompact
`X` (here: metric spaces, which are paracompact; Mathlib's `ParacompactSpace` is not imported)
are classified by `[X, Gₙ(ℂ^∞)]` (pullback of the tautological bundle); for compact `X`,
`K̃(X) ≅ [X, ℤ × BU]_*` for a nondegenerate basepoint and `K(X) ≅ [X, ℤ × BU]`; Bott periodicity in space form,
`ℤ × BU ≃ Ω²(ℤ × BU)` and `ΩU ≃ ℤ × BU` (compatibility with `β` is not stated).
The based classification retains the homotopy extension property for the point inclusion. -/
namespace RT4T
/-- Homotopy extension property of {x₀}↪X; for Hausdorff X the inclusion is closed. -/
def NondegenerateBasepoint (X : Type) [TopologicalSpace X] (x₀ : X) : Prop :=
  ∀ (Y : Type) [TopologicalSpace Y] (f : C(X,Y)) (H : C(unitInterval,Y)),
    H 0=f x₀ → ∃ K : C(unitInterval × X,Y),
      (∀ x, K (0,x)=f x) ∧ (∀ t, K (t,x₀)=H t)
end RT4T

theorem buRepresentability :
    (∀ (X : Type) [MetricSpace X] (n : ℕ),
      Nonempty (RT4T.VectRank X n ≃ RT4T.homotopyClasses X (RT4T.grassmannian n))) ∧
    (∀ (X : Type) [TopologicalSpace X] [CompactSpace X] [T2Space X] (x₀ : X)
      (hbase : RT4T.NondegenerateBasepoint X x₀),
      Nonempty (TopK.reduced X x₀ ≃ RT4T.pointedHomotopyClasses X (ℤ × RT4T.BU) x₀ (0, RT4T.BU.base)) ∧
      Nonempty (TopK X ≃ RT4T.homotopyClasses X (ℤ × RT4T.BU))) ∧
    RT4T.HomotopyEquivalent (ℤ × RT4T.BU)
      (RT4T.loopSpace (RT4T.loopSpace (ℤ × RT4T.BU) (0, RT4T.BU.base))
        (RT4T.loopSpace.const _ _)) ∧
    RT4T.HomotopyEquivalent (RT4T.loopSpace RT4T.U RT4T.U.one) (ℤ × RT4T.BU) := sorry

/-! ### RT.4:topological/ku-spectrum -/

namespace RT4T

/-- Stable homotopy groups `π_n A` of an E_∞-ring. -/
abbrev pi (A : EInftyRing) (n : ℤ) : Type := A.toE1.toSpectrum.homotopyGroup n

/-- The underlying E₁-map of an E_∞-map. -/
def EInftyRing.toE1Map {A B : EInftyRing} (f : A ⟶ B) : A.toE1 ⟶ B.toE1 := sorry

/-- The map on `π_n` of an E_∞-map. -/
def piMap {A B : EInftyRing} (f : A ⟶ B) (n : ℤ) : pi A n →+ pi B n :=
  Spectrum.homotopyGroupMap (E1Ring.toSpectrumMap (EInftyRing.toE1Map f)) n

/-- The sphere as an E_∞-ring (initial object). -/
def EInftyRing.sphere : EInftyRing := sorry

/-- The unit map `S → A` of an E_∞-ring. -/
def EInftyRing.unit (A : EInftyRing) : EInftyRing.sphere ⟶ A := sorry

/-- The localisation `A[x⁻¹]` of an E_∞-ring at a homotopy class `x ∈ π_n A`
(`colim(A → Σ⁻ⁿA → Σ⁻²ⁿA → …)`, StableHomotopyKTheory H.5:spectra/sequential-homotopy-colimit). -/
def EInftyRing.invert (A : EInftyRing) {n : ℤ} (x : pi A n) : EInftyRing := sorry

/-- The localisation map `A → A[x⁻¹]`. -/
def EInftyRing.invertMap (A : EInftyRing) {n : ℤ} (x : pi A n) : A ⟶ EInftyRing.invert A x :=
  sorry

/-- The suspension spectrum `Σ^∞_+ X` (StableHomotopyKTheory H.5:spectra/suspension-spectrum). -/
def suspensionSpectrumPlus (X : Type) [TopologicalSpace X] : Spectrum := sorry

/-- The function spectrum `F(X, Y)`. -/
def mapSpectrum (X Y : Spectrum) : Spectrum := sorry

/-- `E^k(X) := π_{−k} F(Σ^∞_+ X, E)`, the cohomology of a space with coefficients in `E`. -/
abbrev spectrumCohomology (E : Spectrum) (X : Type) [TopologicalSpace X] (k : ℤ) : Type :=
  (mapSpectrum (suspensionSpectrumPlus X) E).homotopyGroup (-k)

/-- `f* : E^k(X) → E^k(Y)` for `f : Y → X`. -/
def spectrumCohomology.map (E : Spectrum) {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (f : C(Y, X)) (k : ℤ) : spectrumCohomology E X k →+ spectrumCohomology E Y k := sorry

/-- `Σ^∞_+ ℂP^∞` as an E_∞-ring (`ℂP^∞ = BU(1)` an E_∞-space). -/
def cpInftyPlus : EInftyRing := sorry

/-- The class `β ∈ π₂ Σ^∞_+ ℂP^∞` of the Bott element (`ℂP¹ ⊆ ℂP^∞`). -/
def cpInftyBott : pi cpInftyPlus 2 := sorry

/-- The product of a family of spectra. -/
def spectrumProduct (F : ℤ → Spectrum) : Spectrum := sorry

end RT4T

/-- `KU` represents K-theory: natural isomorphisms `KU⁻ⁿ(X) ≅ K⁻ⁿ(X)` for compact Hausdorff
(in particular finite CW) `X`; compatibility with products is not stated. -/
theorem KU.represents (n : ℕ) :
    ∃ e : ∀ (X : Type) [TopologicalSpace X] [CompactSpace X] [T2Space X],
        RT4T.spectrumCohomology KU.toE1.toSpectrum X (-(n : ℤ)) ≃+ TopK.negative n X,
      ∀ (X Y : Type) [TopologicalSpace X] [CompactSpace X] [T2Space X]
        [TopologicalSpace Y] [CompactSpace Y] [T2Space Y] (f : C(Y, X))
        (x : RT4T.spectrumCohomology KU.toE1.toSpectrum X (-(n : ℤ))),
        e Y (RT4T.spectrumCohomology.map _ f _ x) = RT4T.TopK.negativeMap n f (e X x) := sorry

/-- The Bott class `β ∈ π₂ KU`, the image of `[H] − 1 ∈ K̃(S²)` (`RT4T.KU.bott_spec`). -/
def KU.bott : RT4T.pi KU 2 := sorry

theorem RT4T.KU.bott_spec : ∃ e : RT4T.pi KU 2 ≃+ TopK.reduced (RT4T.sphere 2) (RT4T.sphere.base 2),
    e KU.bott = RT4T.bottClass := sorry

/-- Snaith's theorem: `Σ^∞_+ ℂP^∞[β⁻¹] ≃ KU` as E_∞-rings. -/
def KU.snaith : RT4T.EInftyRing.invert RT4T.cpInftyPlus RT4T.cpInftyBott ≅ KU := sorry

/-- The unit map `S → KU`; it induces the identity `ℤ = π₀S → π₀KU = ℤ` (`RT4T.KU.unit_pi0`). -/
def KU.unit : RT4T.EInftyRing.sphere ⟶ KU := RT4T.EInftyRing.unit KU

theorem RT4T.KU.unit_pi0 : Function.Bijective (RT4T.piMap KU.unit 0) ∧
    Nonempty (RT4T.pi RT4T.EInftyRing.sphere 0 ≃+ ℤ) := sorry

/-- Test `KU.pi0` (computation): π_0KU = ℤ. -/
example : Nonempty (RT4T.pi KU 0 ≃+ ℤ) := sorry

/-- Test `KU.pi_odd` (computation): π_1KU = 0. -/
example : Subsingleton (RT4T.pi KU 1) := sorry

/-- Test `KU.point_K` (degenerate): KU⁰(pt) = K(pt) = ℤ. -/
example : Nonempty (RT4T.spectrumCohomology KU.toE1.toSpectrum Unit 0 ≃+ TopK Unit) ∧
    Nonempty (TopK Unit ≃+ ℤ) := sorry

/-- Test `KU.not_HZ` (non-example): KU is not the generalised Eilenberg–Mac Lane spectrum
`∏ₙ Σ²ⁿHℤ` with the same homotopy groups (the first k-invariant of ku, the integral Bockstein of
`Sq²`, is nonzero). -/
example : ¬ Nonempty (KU.toE1.toSpectrum ≅
    RT4T.spectrumProduct (fun n : ℤ => (Spectrum.em ℤ).shift (2 * n))) := sorry

/-! ### RT.4:topological/connective-ku -/

/-- The E_∞-map `ku → KU` (connective cover), an isomorphism on `π_n` for `n ≥ 0`
(`RT4T.ku.toKU_pi`). -/
def ku.toKU : ku ⟶ KU := sorry

theorem RT4T.ku.toKU_pi : (∀ n : ℤ, 0 ≤ n → Function.Bijective (RT4T.piMap ku.toKU n)) ∧
    Nonempty (ku.toE1.toSpectrum ≅ KU.toE1.toSpectrum.connectiveCover) := sorry

/-- The Bott class `β ∈ π₂ ku`, mapping to `β ∈ π₂ KU` (`RT4T.ku.toKU_bott`). -/
def ku.bott : RT4T.pi ku 2 := sorry

theorem RT4T.ku.toKU_bott : RT4T.piMap ku.toKU 2 ku.bott = KU.bott := sorry

/-- The infinite loop space `Ω^∞ E` of a spectrum. -/
def RT4T.infiniteLoopSpace (E : Spectrum) : Type := sorry

instance (E : Spectrum) : TopologicalSpace (RT4T.infiniteLoopSpace E) := sorry

/-- `Ω^∞ ku ≃ ℤ × BU`. -/
theorem ku.infiniteLoopSpace :
    RT4T.HomotopyEquivalent (RT4T.infiniteLoopSpace ku.toE1.toSpectrum) (ℤ × RT4T.BU) := sorry

/-- Test `ku.pi_neg` (degenerate): π_{−2}ku = 0. -/
example : Subsingleton (RT4T.pi ku (-2)) := sorry

/-- Test `ku.pi2` (computation): π_2 ku = ℤβ. -/
example : ∃ e : RT4T.pi ku 2 ≃+ ℤ, e ku.bott = 1 := sorry

/-- Test `ku.not_KU` (non-example): ku → KU is not an equivalence: π_{−2}KU = ℤ ≠ 0 = π_{−2}ku. -/
example : ¬ IsIso ku.toKU ∧ Subsingleton (RT4T.pi ku (-2)) ∧ Nonempty (RT4T.pi KU (-2) ≃+ ℤ) :=
  sorry

/-! ### RT.4:topological/homotopy-of-ku -/

/-- The multiplication `π_m A ⊗ π_n A → π_{m+n} A` makes `⨁ₙ π_n A` a graded ring. -/
instance RT4T.instGRingPi (A : EInftyRing) : DirectSum.GRing (fun n : ℤ => RT4T.pi A n) := sorry

/-- The graded homotopy ring `π_* A = ⨁ₙ π_n A` of an E_∞-ring. -/
abbrev RT4T.homotopyRing (A : EInftyRing) : Type := DirectSum ℤ (fun n : ℤ => RT4T.pi A n)

/-- Homotopy rings (RT.4:topological/homotopy-of-ku): `π_* ku ≅ ℤ[β]` and
`π_* KU ≅ ℤ[β, β⁻¹]` with `|β| = 2`; a ring isomorphism sending the homogeneous class `β` to the
variable is automatically graded. -/
theorem homotopyOfKu :
    (∃ e : RT4T.homotopyRing ku ≃+* Polynomial ℤ,
      e (DirectSum.of (fun n : ℤ => RT4T.pi ku n) 2 ku.bott) = Polynomial.X) ∧
    ∃ e : RT4T.homotopyRing KU ≃+* LaurentPolynomial ℤ,
      e (DirectSum.of (fun n : ℤ => RT4T.pi KU n) 2 KU.bott) = LaurentPolynomial.T 1 := sorry

/-! ### RT.4:topological/bott-localisation -/

namespace RT4T

/-- Left modules over an E₁-ring in spectra (StableHomotopyKTheory H.5:spectra/operadic-algebras). -/
def Mod (A : E1Ring) : Type := sorry

/-- The underlying spectrum of a module. -/
def Mod.underlying {A : E1Ring} (M : Mod A) : Spectrum := sorry

/-- Base change `B ⊗_A M` along a map of E₁-rings. -/
def Mod.baseChange {A B : E1Ring} (f : A ⟶ B) (M : Mod A) : Mod B := sorry

/-- `M[x⁻¹] = colim(M → Σ⁻ⁿM → Σ⁻²ⁿM → …)` for `x ∈ π_n A` acting on `M`. -/
def Mod.invert {A : E1Ring} (M : Mod A) {n : ℤ} (x : A.toSpectrum.homotopyGroup n) : Mod A :=
  sorry

end RT4T

/-- Bott localisation (RT.4:topological/bott-localisation): `ku → KU` exhibits `KU` as
`ku[β⁻¹]` as E_∞-ku-algebras, and `M ⊗_ku KU ≃ M[β⁻¹]` for every ku-module `M`. -/
theorem bottLocalisation :
    (∃ e : RT4T.EInftyRing.invert ku ku.bott ≅ KU,
      RT4T.EInftyRing.invertMap ku ku.bott ≫ e.hom = ku.toKU) ∧
    ∀ M : RT4T.Mod ku.toE1,
      Nonempty ((RT4T.Mod.baseChange (RT4T.EInftyRing.toE1Map ku.toKU) M).underlying ≅
        (RT4T.Mod.invert M ku.bott).underlying) := sorry

/-! ### RT.4:topological/splitting-principle -/

namespace RT4T

/-- Singular cohomology `Hⁿ(X; A) = π_{−n} F(Σ^∞_+ X, HA)` (StableHomotopyKTheory
H.5:spectra/eilenberg-maclane-cohomology). -/
abbrev cohomology (X : Type) [TopologicalSpace X] (A : Type) [CommRing A] (n : ℤ) : Type :=
  spectrumCohomology (Spectrum.em A) X n

/-- `f* : Hⁿ(X; A) → Hⁿ(Y; A)`. -/
def cohomology.pullback {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y] {A : Type}
    [CommRing A] (f : C(Y, X)) (n : ℤ) : cohomology X A n →+ cohomology Y A n :=
  spectrumCohomology.map _ f n

/-- Cohomology with coefficients in `A` is an `A`-module. -/
instance (X : Type) [TopologicalSpace X] (A : Type) [CommRing A] (n : ℤ) :
    Module A (cohomology X A n) := sorry

/-- Change of coefficients along a ring map. -/
def cohomology.map {X : Type} [TopologicalSpace X] {A B : Type} [CommRing A] [CommRing B]
    (f : A →+* B) (n : ℤ) : cohomology X A n →+ cohomology X B n := sorry

end RT4T

/-- The splitting principle (RT.4:topological/splitting-principle): for `E → X` over compact
Hausdorff `X` there is a compact Hausdorff `F(E)` (the flag bundle) with `p : F(E) → X` such that
`p*E` is a sum of line bundles and `p*` is injective on `K` and on `H^*(−; ℤ)`. -/
theorem splittingPrinciple (X : Type) [TopologicalSpace X] [CompactSpace X] [T2Space X]
    (E : RT4T.ComplexVectorBundle X) :
    ∃ (F : Type) (_ : TopologicalSpace F) (_ : CompactSpace F) (_ : T2Space F) (p : C(F, X))
      (L : Fin E.rank → RT4T.ComplexVectorBundle F),
      (∀ i, (L i).rank = 1) ∧ RT4T.Vect.mk (E.pullback p) = ∑ i, RT4T.Vect.mk (L i) ∧
      Function.Injective (TopK.pullback p) ∧
      ∀ n : ℤ, Function.Injective (RT4T.cohomology.pullback (A := ℤ) p n) := sorry

/-! ### RT.4:topological/lambda-ring-k -/

/-- Pre-λ-rings (stands for KTheoryLowDegrees Z.3/pre-lambda-ring; Mathlib has none): operations
`λⁿ` with `λ⁰ = 1`, `λ¹ = id` and the sum formula `λⁿ(x + y) = ∑_{i+j=n} λⁱ(x) λʲ(y)`, i.e.
`λ_t(x + y) = λ_t(x) λ_t(y)`. -/
class RT4T.PreLambdaRing (R : Type*) [CommRing R] where
  /-- The operations `λⁿ`. -/
  lam : ℕ → R → R
  lam_zero : ∀ x, lam 0 x = 1
  lam_one : ∀ x, lam 1 x = x
  lam_add : ∀ (n : ℕ) (x y : R),
    lam n (x + y) = ∑ i ∈ Finset.range (n + 1), lam i x * lam (n - i) y

/-- The universal polynomial `Pₙ(s₁,…,sₙ; σ₁,…,σₙ)` of KTheoryLowDegrees Z.3/special-lambda-ring:
the coefficient of `tⁿ` in `∏_{i,j}(1 + xᵢyⱼt)` written in the elementary symmetric functions
`sₖ = eₖ(x)`, `σₖ = eₖ(y)` (variables `Sum.inl (k-1)`, `Sum.inr (k-1)`). -/
def RT4T.lambdaMulPoly (n : ℕ) : MvPolynomial (Fin n ⊕ Fin n) ℤ := sorry

/-- The universal polynomial `P_{m,n}(s₁,…,s_{mn})` expressing `λᵐ(λⁿ x)` through
`λ¹x,…,λ^{mn}x` (KTheoryLowDegrees Z.3/special-lambda-ring). -/
def RT4T.lambdaCompPoly (m n : ℕ) : MvPolynomial (Fin (m * n)) ℤ := sorry

/-- Special λ-rings (KTheoryLowDegrees Z.3/special-lambda-ring): `λ_t(1) = 1 + t` and `λⁿ(xy)`,
`λᵐ(λⁿx)` are given by the universal polynomials. -/
class RT4T.SpecialLambdaRing (R : Type*) [CommRing R] [RT4T.PreLambdaRing R] : Prop where
  lam_one_elem : ∀ n : ℕ, 2 ≤ n → RT4T.PreLambdaRing.lam n (1 : R) = 0
  lam_mul : ∀ (n : ℕ) (x y : R), RT4T.PreLambdaRing.lam n (x * y) =
    MvPolynomial.eval₂ (Int.castRingHom R)
      (Sum.elim (fun i : Fin n => RT4T.PreLambdaRing.lam ((i : ℕ) + 1) x)
        (fun i : Fin n => RT4T.PreLambdaRing.lam ((i : ℕ) + 1) y)) (RT4T.lambdaMulPoly n)
  lam_lam : ∀ (m n : ℕ) (x : R), RT4T.PreLambdaRing.lam m (RT4T.PreLambdaRing.lam n x) =
    MvPolynomial.eval₂ (Int.castRingHom R)
      (fun i : Fin (m * n) => RT4T.PreLambdaRing.lam ((i : ℕ) + 1) x) (RT4T.lambdaCompPoly m n)

namespace TopK

variable {X Y : Type} [TopologicalSpace X] [CompactSpace X] [T2Space X]
  [TopologicalSpace Y] [CompactSpace Y] [T2Space Y]

/-- `λⁱ : K(X) → K(X)`, `λⁱ[E] = [ΛⁱE]` (`RT4T.TopK.lambda_ofBundle`), extended to `K(X)` by
`λ_t(E ⊕ F) = λ_t(E) λ_t(F)`. -/
def lambda (X : Type) [TopologicalSpace X] [CompactSpace X] [T2Space X] (i : ℕ) :
    TopK X → TopK X := sorry

/-- `K(X)` is a pre-λ-ring (KTheoryLowDegrees Z.3/pre-lambda-ring), augmented by `rank`. -/
instance instPreLambdaRing : RT4T.PreLambdaRing (TopK X) where
  lam := lambda X
  lam_zero := sorry
  lam_one := sorry
  lam_add := sorry

/-- `K(X)` is a special λ-ring (KTheoryLowDegrees Z.3/special-lambda-ring). -/
instance instSpecialLambdaRing : RT4T.SpecialLambdaRing (TopK X) := sorry

/-- `f*` commutes with every `λⁱ`. -/
theorem lambda_pullback (f : C(Y, X)) (i : ℕ) (x : TopK X) :
    lambda Y i (pullback f x) = pullback f (lambda X i x) := sorry

/-- `λ_t[L] = 1 + [L]t` for a line bundle `L`. -/
theorem lambda_line (L : RT4T.ComplexVectorBundle X) (hL : L.rank = 1) :
    PowerSeries.mk (fun i => lambda X i (ofBundle (RT4T.Vect.mk L))) =
      1 + PowerSeries.C (ofBundle (RT4T.Vect.mk L)) * PowerSeries.X := sorry

end TopK

theorem RT4T.TopK.lambda_ofBundle {X : Type} [TopologicalSpace X] [CompactSpace X] [T2Space X]
    (E : ComplexVectorBundle X) (i : ℕ) :
    TopK.lambda X i (TopK.ofBundle (Vect.mk E)) = TopK.ofBundle (Vect.mk (E.exteriorPower i)) :=
  sorry

/-- Test `TopK.lambda_point` (computation): On K(pt) = ℤ, λ^i(n) = binomial(n, i). -/
example (n i : ℕ) : TopK.lambda Unit i (n : TopK Unit) = (n.choose i : TopK Unit) := sorry

/-- Test `TopK.lambda_zero` (degenerate): λ^0 = 1 and λ^1 = id. -/
example (X : Type) [TopologicalSpace X] [CompactSpace X] [T2Space X] (x : TopK X) :
    TopK.lambda X 0 x = 1 ∧ TopK.lambda X 1 x = x := sorry

/-- Test `TopK.lambda_not_additive` (non-example): λ²(2·1) = 1 ≠ 2λ²(1) = 0 in K(pt). -/
example : TopK.lambda Unit 2 (2 : TopK Unit) = 1 ∧ TopK.lambda Unit 2 1 = 0 ∧
    TopK.lambda Unit 2 (1 + 1) ≠ TopK.lambda Unit 2 1 + TopK.lambda Unit 2 1 := sorry

/-! ### RT.4:topological/adams-operations -/

/-- The Adams operations of a pre-λ-ring (KTheoryLowDegrees Z.3/adams-operations), by Newton's
formula `d/dt log λ_t(x) = ∑_{k ≥ 1} (−1)^{k−1} ψᵏ(x) t^{k−1}`. -/
def RT4T.adamsOp {R : Type*} [CommRing R] [RT4T.PreLambdaRing R] (k : ℕ) (x : R) : R :=
  (-1) ^ (k - 1) * PowerSeries.coeff (k - 1)
    (PowerSeries.mk (fun n => ((n + 1 : ℕ) : R) * RT4T.PreLambdaRing.lam (n + 1) x) *
      PowerSeries.invOfUnit (PowerSeries.mk (fun n => RT4T.PreLambdaRing.lam n x)) 1)

namespace TopK

variable {X Y : Type} [TopologicalSpace X] [CompactSpace X] [T2Space X]
  [TopologicalSpace Y] [CompactSpace Y] [T2Space Y]

/-- `ψᵏ : K(X) → K(X)`, the Adams operation of the special λ-ring `K(X)`. (`ψ⁻¹` is complex
conjugation of bundles; not stated here.) -/
def adams (X : Type) [TopologicalSpace X] [CompactSpace X] [T2Space X] (k : ℕ) :
    TopK X → TopK X :=
  RT4T.adamsOp k

/-- `ψᵏ` (`k ≥ 1`) is a ring homomorphism; it is natural in `X` (`RT4T.TopK.adams_natural`). -/
def adams_ringHom (X : Type) [TopologicalSpace X] [CompactSpace X] [T2Space X] (k : ℕ)
    (hk : 1 ≤ k) : TopK X →+* TopK X where
  toFun := adams X k
  map_one' := sorry
  map_mul' := sorry
  map_zero' := sorry
  map_add' := sorry

/-- `ψᵏ[L] = [L]ᵏ` for a line bundle `L`. -/
theorem adams_line (k : ℕ) (hk : 1 ≤ k) (L : RT4T.ComplexVectorBundle X) (hL : L.rank = 1) :
    adams X k (ofBundle (RT4T.Vect.mk L)) = ofBundle (RT4T.Vect.mk L) ^ k := sorry

/-- `ψᵏ ∘ ψˡ = ψᵏˡ`. -/
theorem adams_comp (k l : ℕ) (hk : 1 ≤ k) (hl : 1 ≤ l) (x : TopK X) :
    adams X k (adams X l x) = adams X (k * l) x := sorry

/-- `ψᵖ(x) ≡ xᵖ mod p K(X)` for `p` prime. -/
theorem adams_frobenius (p : ℕ) (hp : p.Prime) (x : TopK X) :
    ∃ y : TopK X, adams X p x - x ^ p = (p : TopK X) * y := sorry

/-- `ψᵏ = kⁿ` on `K̃(S²ⁿ)`. -/
theorem adams_sphere (n k : ℕ) (hk : 1 ≤ k)
    (x : reduced (RT4T.sphere (2 * n)) (RT4T.sphere.base (2 * n))) :
    adams _ k x.1 = (k : TopK (RT4T.sphere (2 * n))) ^ n * x.1 := sorry

end TopK

theorem RT4T.TopK.adams_natural {X Y : Type} [TopologicalSpace X] [CompactSpace X] [T2Space X]
    [TopologicalSpace Y] [CompactSpace Y] [T2Space Y] (k : ℕ) (f : C(Y, X)) (x : TopK X) :
    TopK.adams Y k (TopK.pullback f x) = TopK.pullback f (TopK.adams X k x) := sorry

/-- Test `TopK.adams_one` (degenerate): ψ^1 = id. -/
example (X : Type) [TopologicalSpace X] [CompactSpace X] [T2Space X] (x : TopK X) :
    TopK.adams X 1 x = x := sorry

/-- Test `TopK.adams_bott` (computation): ψ²(β) = 2β in K̃(S²). -/
example : TopK.adams (RT4T.sphere 2) 2 RT4T.bottClass.1 = 2 * RT4T.bottClass.1 := sorry

/-- Test `TopK.adams_not_power` (non-example): on K̃(S²), β² = 0 but ψ²(β) = 2β ≠ 0 = β². -/
example : RT4T.bottClass.1 ^ 2 = 0 ∧
    TopK.adams (RT4T.sphere 2) 2 RT4T.bottClass.1 ≠ RT4T.bottClass.1 ^ 2 := sorry

/-! ### RT.4:topological/adams-operations-spectra -/

namespace RT4T

/-- The H-space structure `(ℤ × BU) × (ℤ × BU) → ℤ × BU` (Whitney sum). -/
def BU.hmul : C((ℤ × BU) × (ℤ × BU), ℤ × BU) := sorry

/-- `π_n(ℤ × BU)` at the base point `(0, *)`. -/
def BU.homotopyGroup (n : ℕ) : Type := sorry

instance (n : ℕ) : AddCommGroup (BU.homotopyGroup n) := sorry

/-- The map on `π_n(ℤ × BU)` induced by a self-map preserving the component `{0} × BU` up to
homotopy. -/
def BU.homotopyGroupMap (f : C(ℤ × BU, ℤ × BU)) (n : ℕ) :
    BU.homotopyGroup n →+ BU.homotopyGroup n := sorry

/-- Post-composition on homotopy classes. -/
def homotopyClasses.postcomp {X Y Z : Type} [TopologicalSpace X] [TopologicalSpace Y]
    [TopologicalSpace Z] (g : C(X, Z)) : homotopyClasses Y X → homotopyClasses Y Z :=
  Quot.lift (fun f => Quot.mk _ (g.comp f)) sorry

/-- `A[1/k]` for an E_∞-ring `A` (`A ⊗ S[1/k]`). -/
def EInftyRing.invertInt (A : EInftyRing) (k : ℕ) : EInftyRing := sorry

/-- The localisation map `A → A[1/k]`. -/
def EInftyRing.invertIntMap (A : EInftyRing) (k : ℕ) : A ⟶ EInftyRing.invertInt A k := sorry

/-- The Bott class of `KU[1/k]`. -/
def KU.bottInv (k : ℕ) : pi (EInftyRing.invertInt KU k) 2 :=
  piMap (EInftyRing.invertIntMap KU k) 2 KU.bott

end RT4T

/-- `ψᵏ : ℤ × BU → ℤ × BU`, an H-map (`RT4T.BU.adams_isHMap`) representing the Adams operation
`TopK.adams` (`RT4T.BU.adams_represents`); unique up to homotopy. -/
def BU.adams (k : ℕ) : C(ℤ × RT4T.BU, ℤ × RT4T.BU) := sorry

theorem RT4T.BU.adams_isHMap (k : ℕ) :
    Homotopic ((_root_.RefinedTraceMethods.BU.adams k).comp hmul)
      (hmul.comp ((_root_.RefinedTraceMethods.BU.adams k).prodMap
        (_root_.RefinedTraceMethods.BU.adams k))) := sorry

theorem RT4T.BU.adams_represents (k : ℕ) (hk : 1 ≤ k) (X : Type) [TopologicalSpace X]
    [CompactSpace X] [T2Space X] :
    ∃ e : TopK X ≃ homotopyClasses X (ℤ × BU), ∀ x : TopK X,
      e (TopK.adams X k x) = homotopyClasses.postcomp (_root_.RefinedTraceMethods.BU.adams k) (e x) :=
  sorry

/-- `π_{2i}(ψᵏ) = kⁱ`. -/
theorem BU.adams_homotopy (k i : ℕ) (hk : 1 ≤ k) (x : RT4T.BU.homotopyGroup (2 * i)) :
    RT4T.BU.homotopyGroupMap (BU.adams k) (2 * i) x = (k ^ i) • x := sorry

/-- `ψʲψᵏ ≃ ψʲᵏ ≃ ψᵏψʲ`. -/
theorem BU.adams_comm (j k : ℕ) (hj : 1 ≤ j) (hk : 1 ≤ k) :
    RT4T.Homotopic ((BU.adams j).comp (BU.adams k)) (BU.adams (j * k)) ∧
    RT4T.Homotopic ((BU.adams j).comp (BU.adams k)) ((BU.adams k).comp (BU.adams j)) := sorry

/-- The stable Adams operation `ψᵏ : KU[1/k] → KU[1/k]`, an E_∞-map with `ψᵏ(β) = kβ`
(`RT4T.KU.adams_bott`); similarly on `ku[1/k]`. -/
def KU.adams (k : ℕ) : RT4T.EInftyRing.invertInt KU k ⟶ RT4T.EInftyRing.invertInt KU k := sorry

theorem RT4T.KU.adams_bott (k : ℕ) (hk : 1 ≤ k) :
    piMap (_root_.RefinedTraceMethods.KU.adams k) 2 (KU.bottInv k) = k • KU.bottInv k := sorry

/-- Test `BU.adams_one` (degenerate): ψ^1 ≃ id. -/
example : RT4T.Homotopic (BU.adams 1) (ContinuousMap.id _) := sorry

/-- Test `KU.adams_bott` (computation): ψ^2(β) = 2β in π_2KU[1/2]. -/
example : RT4T.piMap (KU.adams 2) 2 (RT4T.KU.bottInv 2) = 2 • RT4T.KU.bottInv 2 := sorry

/-- Test `KU.adams_not_integral` (non-example): there is no E_∞-self-map of KU itself with
ψ²(β) = 2β (on π_{−2}KU it would be multiplication by 1/2). -/
example : ¬ ∃ f : KU ⟶ KU, RT4T.piMap f 2 KU.bott = 2 • KU.bott := sorry

/-! ### RT.4:topological/chern-classes -/

namespace RT4T

/-- Completed even cohomology with Cauchy cup convolution, not componentwise multiplication:
(xy)_n is the finite sum of x_i∪y_j for i+j=n. The unit has only its H⁰ component. -/
def evenCohomology (X : Type) [TopologicalSpace X] (A : Type) [CommRing A] : Type :=
  ∀ i : ℕ, cohomology X A (2 * (i : ℤ))

instance (X : Type) [TopologicalSpace X] (A : Type) [CommRing A] :
    CommRing (evenCohomology X A) where
  __ := (inferInstance : AddCommGroup (∀ i : ℕ, cohomology X A (2 * (i : ℤ))))
  mul := sorry
  one := sorry
  mul_assoc := sorry
  one_mul := sorry
  mul_one := sorry
  left_distrib := sorry
  right_distrib := sorry
  zero_mul := sorry
  mul_zero := sorry
  mul_comm := sorry

/-- The component in `H^{2i}`. -/
def evenCohomology.component {X : Type} [TopologicalSpace X] {A : Type} [CommRing A] (i : ℕ) :
    evenCohomology X A →+ cohomology X A (2 * (i : ℤ)) := sorry

/-- Cup product with the degree equality supplied explicitly. -/
def evenCup {X : Type} [TopologicalSpace X] {A : Type} [CommRing A]
    (i j n : ℕ) (h : i+j=n) :
    cohomology X A (2 * (i : ℤ)) →+ cohomology X A (2 * (j : ℤ)) →+
      cohomology X A (2 * (n : ℤ)) := sorry

/-- The finite convolution identity used by the Whitney and Chern-character formulas. -/
theorem evenCohomology.mul_component {X : Type} [TopologicalSpace X] {A : Type} [CommRing A]
    (x y : evenCohomology X A) (n : ℕ) :
    evenCohomology.component n (x*y) = ∑ ij : {ij : Fin (n+1) × Fin (n+1) //
      ij.1.val+ij.2.val=n}, evenCup ij.val.1.val ij.val.2.val n ij.property
        (evenCohomology.component ij.val.1.val x) (evenCohomology.component ij.val.2.val y) := sorry

/-- The inclusion of `H^{2i}`. -/
def evenCohomology.single {X : Type} [TopologicalSpace X] {A : Type} [CommRing A] (i : ℕ) :
    cohomology X A (2 * (i : ℤ)) →+ evenCohomology X A := sorry

/-- Degreewise pullback, a ring map. -/
def evenCohomology.pullback {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y] {A : Type}
    [CommRing A] (f : C(Y, X)) : evenCohomology X A →+* evenCohomology Y A := sorry

/-- Degreewise change of coefficients, a ring map. -/
def evenCohomology.map {X : Type} [TopologicalSpace X] {A B : Type} [CommRing A] [CommRing B]
    (f : A →+* B) : evenCohomology X A →+* evenCohomology X B := sorry

/-- Graded integral cohomology ring `H^*(X; A) = ⨁ₙ Hⁿ(X; A)`. -/
instance instGRingCohomology (X : Type) [TopologicalSpace X] (A : Type) [CommRing A] :
    DirectSum.GRing (fun n : ℤ => cohomology X A n) := sorry

abbrev cohomologyRing (X : Type) [TopologicalSpace X] (A : Type) [CommRing A] : Type :=
  DirectSum ℤ (fun n : ℤ => cohomology X A n)

/-- `ℂP^∞ = BU(1)`. -/
def CPinfty : Type := sorry

instance : TopologicalSpace CPinfty := sorry

/-- The tautological line bundle on `ℂP^∞`. -/
def CPinfty.taut : ComplexVectorBundle CPinfty := sorry

/-- The universal Chern classes `cᵢ ∈ H^{2i}(BU; ℤ)`. -/
def universalChernClass (i : ℕ) : cohomology BU ℤ (2 * (i : ℤ)) := sorry

end RT4T

/-- The Chern classes `cᵢ(E) ∈ H^{2i}(X; ℤ)`, characterised by naturality, the Whitney formula,
`cᵢ(E) = 0` for `i > rank E` (`RT4T.chernClass_eq_zero`) and `c₁` of the tautological line
bundle on `ℂP^∞` the standard generator. -/
def chernClass {X : Type} [TopologicalSpace X] (E : RT4T.ComplexVectorBundle X) (i : ℕ) :
    RT4T.cohomology X ℤ (2 * (i : ℤ)) := sorry

/-- The total Chern class `c(E) = ∑ᵢ cᵢ(E) ∈ H^{ev}(X; ℤ)`. -/
def RT4T.totalChernClass {X : Type} [TopologicalSpace X] (E : RT4T.ComplexVectorBundle X) :
    RT4T.evenCohomology X ℤ :=
  fun i => chernClass E i

theorem RT4T.chernClass_eq_zero {X : Type} [TopologicalSpace X] (E : ComplexVectorBundle X)
    (i : ℕ) (h : E.rank < i) : chernClass E i = 0 := sorry

namespace chernClass

variable {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]

/-- `cᵢ(f*E) = f*cᵢ(E)`. -/
theorem natural (f : C(Y, X)) (E : RT4T.ComplexVectorBundle X) (i : ℕ) :
    chernClass (E.pullback f) i = RT4T.cohomology.pullback f _ (chernClass E i) := sorry

/-- The Whitney formula `c(E ⊕ F) = c(E) ∪ c(F)`. -/
theorem whitney (E F : RT4T.ComplexVectorBundle X) :
    RT4T.totalChernClass (E.directSum F) = RT4T.totalChernClass E * RT4T.totalChernClass F :=
  sorry

/-- `c(L) = 1 + c₁(L)` and `c₁(L ⊗ L′) = c₁(L) + c₁(L′)` for line bundles. -/
theorem line (L L' : RT4T.ComplexVectorBundle X) (hL : L.rank = 1) (hL' : L'.rank = 1) :
    RT4T.totalChernClass L = 1 + RT4T.evenCohomology.single 1 (chernClass L 1) ∧
    chernClass (L.tensor L') 1 = chernClass L 1 + chernClass L' 1 := sorry

end chernClass

/-- `H^*(BU; ℤ) = ℤ[c₁, c₂, …]` (the variable `i` is `c_{i+1}`); likewise
`H^*(BU(n); ℤ) = ℤ[c₁, …, cₙ]` (not stated). -/
theorem cohomology_BU : ∃ e : RT4T.cohomologyRing RT4T.BU ℤ ≃+* MvPolynomial ℕ ℤ,
    ∀ i : ℕ, e (DirectSum.of (fun n : ℤ => RT4T.cohomology RT4T.BU ℤ n) (2 * ((i + 1 : ℕ) : ℤ))
      (RT4T.universalChernClass (i + 1))) = MvPolynomial.X i := sorry

/-- Test `chernClass.trivial` (degenerate): c(ε^n) = 1. -/
example (X : Type) [TopologicalSpace X] (n : ℕ) :
    RT4T.totalChernClass (RT4T.ComplexVectorBundle.trivial X n) = 1 := sorry

/-- Test `chernClass.CP1` (computation): c_1(H) generates H²(ℂP¹; ℤ) = ℤ. -/
example : ∃ e : RT4T.cohomology (RT4T.sphere 2) ℤ (2 * ((1 : ℕ) : ℤ)) ≃+ ℤ,
    e (chernClass RT4T.hopfBundle 1) = 1 := sorry

/-- Test `chernClass.not_K` (non-example): the total Chern class is not additive: on
ℂP^∞ × ℂP^∞, c(L ⊕ L′) = (1 + x)(1 + y) ≠ 1 + x + y; c is a homomorphism from (K(X), +) to the
units of H^{ev}(X; ℤ). -/
example :
    (let L := RT4T.CPinfty.taut.pullback (ContinuousMap.fst : C(RT4T.CPinfty × RT4T.CPinfty, RT4T.CPinfty))
     let L' := RT4T.CPinfty.taut.pullback (ContinuousMap.snd : C(RT4T.CPinfty × RT4T.CPinfty, RT4T.CPinfty))
     RT4T.totalChernClass (L.directSum L') ≠ 1 + RT4T.evenCohomology.single 1 (chernClass L 1) +
       RT4T.evenCohomology.single 1 (chernClass L' 1)) ∧
    ∀ (X : Type) [TopologicalSpace X] [CompactSpace X] [T2Space X],
      ∃ c : Multiplicative (TopK X) →* (RT4T.evenCohomology X ℤ)ˣ,
        ∀ E : RT4T.ComplexVectorBundle X,
          ((c (Multiplicative.ofAdd (TopK.ofBundle (RT4T.Vect.mk E)))) : RT4T.evenCohomology X ℤ) =
            RT4T.totalChernClass E := sorry

/-! ### RT.4:topological/chern-character -/

namespace RT4T

/-- The geometric realisation of a finite simplicial complex given by its faces
`S ⊆ 𝒫(Fin n)`: points `t ∈ ℝⁿ` with `t ≥ 0`, `∑ t = 1` and support in a face. Every finite CW
complex is homotopy equivalent to one of these (Mathlib's CW complexes are not imported). -/
abbrev polyhedron {n : ℕ} (S : Finset (Finset (Fin n))) : Type :=
  {t : Fin n → ℝ // (∀ i, 0 ≤ t i) ∧ ∑ i, t i = 1 ∧ ∃ σ ∈ S, ∀ i, i ∉ σ → t i = 0}

instance {n : ℕ} (S : Finset (Finset (Fin n))) : CompactSpace (polyhedron S) := sorry

/-- Odd cohomology `∏ᵢ H^{2i+1}(X; A)`. -/
abbrev oddCohomology (X : Type) [TopologicalSpace X] (A : Type) [CommRing A] : Type :=
  ∀ i : ℕ, cohomology X A (2 * (i : ℤ) + 1)

/-- Complex projective space `ℂPⁿ`: the sup-norm unit sphere of `ℂⁿ⁺¹` modulo the circle. -/
abbrev CPn (n : ℕ) : Type :=
  Quot (fun u v : ↥(Metric.sphere (0 : Fin (n + 1) → ℂ) 1) =>
    ∃ z : Circle, (v : Fin (n + 1) → ℂ) = (z : ℂ) • (u : Fin (n + 1) → ℂ))

instance (n : ℕ) : CompactSpace (CPn n) := sorry

instance (n : ℕ) : T2Space (CPn n) := sorry

/-- The tautological line bundle `H` on `ℂPⁿ`. -/
def CPn.taut (n : ℕ) : ComplexVectorBundle (CPn n) := sorry

end RT4T

/-- The Chern character `ch : K(X) → H^{ev}(X; ℚ)`, the unique natural ring homomorphism with
`ch(L) = e^{c₁(L)}` on line bundles. -/
def chernCharacter (X : Type) [TopologicalSpace X] [CompactSpace X] [T2Space X] :
    TopK X →+* RT4T.evenCohomology X ℚ := sorry

namespace chernCharacter

variable {X Y : Type} [TopologicalSpace X] [CompactSpace X] [T2Space X]
  [TopologicalSpace Y] [CompactSpace Y] [T2Space Y]

/-- `ch(L) = exp(c₁(L))`: the `H^{2j}`-component is `c₁(L)ʲ/j!`. -/
theorem line (L : RT4T.ComplexVectorBundle X) (hL : L.rank = 1) (j : ℕ) :
    RT4T.evenCohomology.component j (chernCharacter X (TopK.ofBundle (RT4T.Vect.mk L))) =
      ((j.factorial : ℚ)⁻¹) • RT4T.evenCohomology.component j
        ((RT4T.evenCohomology.single 1
          (RT4T.cohomology.map (Int.castRingHom ℚ) _ (chernClass L 1))) ^ j) := sorry

/-- `ch_j ∘ ψᵏ = kʲ ch_j`. -/
theorem adams (k : ℕ) (hk : 1 ≤ k) (j : ℕ) (x : TopK X) :
    RT4T.evenCohomology.component j (chernCharacter X (TopK.adams X k x)) =
      ((k : ℚ) ^ j) • RT4T.evenCohomology.component j (chernCharacter X x) := sorry

open scoped TensorProduct in
/-- For a finite CW complex (here a finite polyhedron) `ch ⊗ ℚ` is an isomorphism of
`ℤ/2`-graded rings: `K⁰(X) ⊗ ℚ ≅ H^{ev}(X; ℚ)` via `ch` and `K⁻¹(X) ⊗ ℚ ≅ H^{odd}(X; ℚ)`. -/
theorem rational_iso {n : ℕ} (S : Finset (Finset (Fin n))) :
    (∃ e : ℚ ⊗[ℤ] TopK (RT4T.polyhedron S) ≃+* RT4T.evenCohomology (RT4T.polyhedron S) ℚ,
      ∀ x, e (1 ⊗ₜ x) = chernCharacter _ x) ∧
    Nonempty (ℚ ⊗[ℤ] TopK.negative 1 (RT4T.polyhedron S) ≃+
      RT4T.oddCohomology (RT4T.polyhedron S) ℚ) := sorry

/-- `ch` commutes with pullback. -/
theorem natural (f : C(Y, X)) (x : TopK X) :
    chernCharacter Y (TopK.pullback f x) = RT4T.evenCohomology.pullback f (chernCharacter X x) :=
  sorry

end chernCharacter

/-- Test `chernCharacter.trivial` (degenerate): ch(ε^n) = n. -/
example (X : Type) [TopologicalSpace X] [CompactSpace X] [T2Space X] (n : ℕ) :
    chernCharacter X (TopK.ofBundle (RT4T.Vect.mk (.trivial X n))) = (n : RT4T.evenCohomology X ℚ) :=
  sorry

/-- Test `chernCharacter.sphere` (computation): ch(β) is the generator of H²(S²; ℤ) ⊂ H²(S²; ℚ). -/
example : ∃ g : RT4T.cohomology (RT4T.sphere 2) ℤ (2 * ((1 : ℕ) : ℤ)),
    (∃ e : RT4T.cohomology (RT4T.sphere 2) ℤ (2 * ((1 : ℕ) : ℤ)) ≃+ ℤ, e g = 1) ∧
    chernCharacter _ RT4T.bottClass.1 =
      RT4T.evenCohomology.single 1 (RT4T.cohomology.map (Int.castRingHom ℚ) _ g) := sorry

/-- Test `chernCharacter.not_integral` (non-example): for ℂP², ch(H) = 1 + x + x²/2 is not the
image of an integral class. -/
example : ¬ ∃ y : RT4T.evenCohomology (RT4T.CPn 2) ℤ,
    RT4T.evenCohomology.map (Int.castRingHom ℚ) y =
      chernCharacter _ (TopK.ofBundle (RT4T.Vect.mk (RT4T.CPn.taut 2))) := sorry

/-! ### RT.4:topological/ku-circle-actions -/

namespace RT4T

/-- `A^{hT}` for the trivial `T`-action, as an E_∞-ring (cochains `C^*(BT; A)`); its underlying
spectrum is `homotopyFixedPoints (SpectraWithAction.trivial T A)` (`RT4T.EInftyRing.hT_underlying`). -/
def EInftyRing.hT (A : EInftyRing) : EInftyRing := sorry

/-- `A^{tT}` for the trivial `T`-action, as an E_∞-ring. -/
def EInftyRing.tT (A : EInftyRing) : EInftyRing := sorry

/-- `A^{tC_p}` for the trivial `C_p`-action, as an E_∞-ring. -/
def EInftyRing.tCp (A : EInftyRing) (p : ℕ) : EInftyRing := sorry

/-- The `p`-completion of an E_∞-ring. -/
def EInftyRing.pComplete (A : EInftyRing) (p : ℕ) : EInftyRing := sorry

/-- The completion map `A → A^∧_p`. -/
def EInftyRing.pCompleteMap (A : EInftyRing) (p : ℕ) : A ⟶ EInftyRing.pComplete A p := sorry

/-- The maps `A → A^{hT} → A^{tT}` and `A^{hT} → A^{tC_p}`. -/
def EInftyRing.toHT (A : EInftyRing) : A ⟶ EInftyRing.hT A := sorry
def EInftyRing.canHT (A : EInftyRing) : EInftyRing.hT A ⟶ EInftyRing.tT A := sorry

/-- `X^{hT}` is functorial. -/
def EInftyRing.hTMap {A B : EInftyRing} (f : A ⟶ B) : EInftyRing.hT A ⟶ EInftyRing.hT B := sorry

/-- The Tate-valued Frobenius `A → A^{tC_p}` of the trivial cyclotomic structure. -/
def EInftyRing.tateFrobenius (A : EInftyRing) (p : ℕ) : A ⟶ EInftyRing.tCp A p := sorry

theorem EInftyRing.hT_underlying (A : EInftyRing) :
    Nonempty ((EInftyRing.hT A).toE1.toSpectrum ≅
      homotopyFixedPoints (SpectraWithAction.trivial T A.toE1.toSpectrum)) ∧
    Nonempty ((EInftyRing.tT A).toE1.toSpectrum ≅
      circleTate (SpectraWithAction.trivial T A.toE1.toSpectrum)) := sorry

/-- `π₀ A` (ring) and `π₀` of the underlying spectrum agree. -/
def pi0Equiv (A : EInftyRing) : A.toE1.pi0 ≃+ pi A 0 := sorry

/-- `q ∈ π₀(ku^{hT}) = ku⁰(BT)`, the class of the standard representation of `T`. -/
def kuQ : (EInftyRing.hT ku).toE1.pi0 := sorry

/-- The complex orientation `t ∈ π_{−2}(ku^{hT}) = ku²(BT)`. -/
def kuT : pi (EInftyRing.hT ku) (-2) := sorry

/-- The class `u = t⁻¹ ∈ π₂(ku_p^{tC_p})`. -/
def kuU (p : ℕ) : pi (EInftyRing.tCp (EInftyRing.pComplete ku p) p) 2 := sorry

/-- The image of `q` in `π₀(ku_p^{tC_p})`. -/
def kuQTate (p : ℕ) : (EInftyRing.tCp (EInftyRing.pComplete ku p) p).toE1.pi0 := sorry

/-- `f ∈ ℤ[β]((t))` is homogeneous of degree `n` for `|β| = 2`, `|t| = −2`. -/
def IsHomogeneousLaurent (n : ℤ) (f : LaurentSeries (Polynomial ℤ)) : Prop :=
  ∀ (a : ℕ) (b : ℤ), (f.coeff b).coeff a ≠ 0 → 2 * (a : ℤ) - 2 * b = n

/-- `f ∈ ℤ[β][[t]]` is homogeneous of degree `n` for `|β| = 2`, `|t| = −2`. -/
def IsHomogeneousPower (n : ℤ) (f : PowerSeries (Polynomial ℤ)) : Prop :=
  ∀ a b : ℕ, (PowerSeries.coeff b f).coeff a ≠ 0 → 2 * (a : ℤ) - 2 * b = n

end RT4T

/-- ku with circle actions (RT.4:topological/ku-circle-actions), for the trivial action:
`π_*(ku^{hT}) ≅ ℤ[β][[t]]` (graded, `|β| = 2`, `|t| = −2`: an injective graded ring map onto the
finite sums of homogeneous elements) with `q − 1 = βt`; `π_*(ku^{tT}) ≅ ℤ[β]((t))`;
`π₀(ku_p^{tC_p}) ≅ ℤ_p[ζ_p]` with `q ↦ ζ_p`, and the Tate-valued Frobenius sends `β` to
`(ζ_p − 1)u`; `π₀(KU^{hT}) ≅ ℤ[[q − 1]]`. Not stated: the strictness of `q`
(`S[q] → ku^{hT}`), the formal group law `x + y + βxy`, and the full graded form
`π_*(ku^{tC_p}) ≅ π_*(ku^{tT})/[p]_q`. -/
theorem kuCircleActions :
    (∃ e : RT4T.homotopyRing (RT4T.EInftyRing.hT ku) →+* PowerSeries (Polynomial ℤ),
      Function.Injective e ∧
      e (DirectSum.of (fun n : ℤ => RT4T.pi (RT4T.EInftyRing.hT ku) n) 2
          (RT4T.piMap (RT4T.EInftyRing.toHT ku) 2 ku.bott)) = PowerSeries.C Polynomial.X ∧
      e (DirectSum.of (fun n : ℤ => RT4T.pi (RT4T.EInftyRing.hT ku) n) (-2) RT4T.kuT) =
        PowerSeries.X ∧
      (∀ (n : ℤ) (x : RT4T.pi (RT4T.EInftyRing.hT ku) n),
        RT4T.IsHomogeneousPower n (e (DirectSum.of _ n x))) ∧
      ∀ f, f ∈ Set.range e ↔ ∃ N : ℕ, ∀ a b : ℕ, (PowerSeries.coeff b f).coeff a ≠ 0 →
        |(a : ℤ) - b| ≤ N) ∧
    DirectSum.of (fun n : ℤ => RT4T.pi (RT4T.EInftyRing.hT ku) n) 2
        (RT4T.piMap (RT4T.EInftyRing.toHT ku) 2 ku.bott) *
      DirectSum.of (fun n : ℤ => RT4T.pi (RT4T.EInftyRing.hT ku) n) (-2) RT4T.kuT =
      DirectSum.of (fun n : ℤ => RT4T.pi (RT4T.EInftyRing.hT ku) n) 0
        (RT4T.pi0Equiv _ RT4T.kuQ) - 1 ∧
    (∃ e : RT4T.homotopyRing (RT4T.EInftyRing.tT ku) →+* LaurentSeries (Polynomial ℤ),
      Function.Injective e ∧
      e (DirectSum.of (fun n : ℤ => RT4T.pi (RT4T.EInftyRing.tT ku) n) 2
          (RT4T.piMap (RT4T.EInftyRing.toHT ku ≫ RT4T.EInftyRing.canHT ku) 2 ku.bott)) =
        HahnSeries.C Polynomial.X ∧
      e (DirectSum.of (fun n : ℤ => RT4T.pi (RT4T.EInftyRing.tT ku) n) (-2)
          (RT4T.piMap (RT4T.EInftyRing.canHT ku) (-2) RT4T.kuT)) = HahnSeries.single 1 1 ∧
      (∀ (n : ℤ) (x : RT4T.pi (RT4T.EInftyRing.tT ku) n),
        RT4T.IsHomogeneousLaurent n (e (DirectSum.of _ n x))) ∧
      ∀ f, f ∈ Set.range e ↔ ∃ N : ℕ, ∀ (a : ℕ) (b : ℤ), (f.coeff b).coeff a ≠ 0 →
        |(a : ℤ) - b| ≤ N) ∧
    (∀ (p : ℕ) [Fact p.Prime],
      (∃ e : (RT4T.EInftyRing.tCp (RT4T.EInftyRing.pComplete ku p) p).toE1.pi0 ≃+*
          Polynomial ℤ_[p] ⧸ Ideal.span {Polynomial.cyclotomic p ℤ_[p]},
        e (RT4T.kuQTate p) = Ideal.Quotient.mk _ Polynomial.X) ∧
      DirectSum.of (fun n : ℤ => RT4T.pi (RT4T.EInftyRing.tCp (RT4T.EInftyRing.pComplete ku p) p) n)
          2 (RT4T.piMap (RT4T.EInftyRing.tateFrobenius (RT4T.EInftyRing.pComplete ku p) p) 2
            (RT4T.piMap (RT4T.EInftyRing.pCompleteMap ku p) 2 ku.bott)) =
        DirectSum.of _ 0 (RT4T.pi0Equiv _ (RT4T.kuQTate p - 1)) *
          DirectSum.of _ 2 (RT4T.kuU p)) ∧
    ∃ e : (RT4T.EInftyRing.hT KU).toE1.pi0 ≃+* PowerSeries ℤ,
      e (E1Ring.pi0Map (RT4T.EInftyRing.toE1Map (RT4T.EInftyRing.hTMap ku.toKU)) RT4T.kuQ) =
        1 + PowerSeries.X := sorry

/-! ### RT.4:topological/relative-thh-ku -/

/-- The structure map `A → A ⊗ B` of a smash product of E₁-rings (`A` an E_∞-ring). -/
def RT4T.E1Ring.inl (A B : E1Ring) : A ⟶ E1Ring.smash A B := sorry

/-- The smash product of spectra with `T`-action (diagonal action). -/
def RT4T.smashT (X Y : SpectraWithAction T) : SpectraWithAction T := sorry

/-- THH relative to ku and KU (RT.4:topological/relative-thh-ku): for an E₁-ring `S_R`,
`THH(ku ⊗ S_R/ku) ≃ ku ⊗ THH(S_R)` and `THH(KU ⊗ S_R/KU) ≃ KU ⊗ THH(S_R)` `T`-equivariantly
(trivial action on ku, KU); `THH(ku/ku) ≃ ku`, `THH(KU/KU) ≃ KU` with trivial action, so
`TC⁻(ku/ku) = ku^{hT}`; absolute `THH(ku)` is not `ku`, since `π₃(THH(ku) ⊗ ℚ) ≠ 0` (the class
`dβ`). The absence of a cyclotomic Frobenius on relative THH is not stated. -/
theorem relativeThhKu (S : E1Ring) :
    Nonempty (THH.relative ku (E1Ring.smash ku.toE1 S) (RT4T.E1Ring.inl ku.toE1 S) ≅
      RT4T.smashT (SpectraWithAction.trivial T ku.toE1.toSpectrum) (THH S)) ∧
    Nonempty (THH.relative KU (E1Ring.smash KU.toE1 S) (RT4T.E1Ring.inl KU.toE1 S) ≅
      RT4T.smashT (SpectraWithAction.trivial T KU.toE1.toSpectrum) (THH S)) ∧
    Nonempty (THH.relative ku ku.toE1 (𝟙 _) ≅ SpectraWithAction.trivial T ku.toE1.toSpectrum) ∧
    Nonempty (THH.relative KU KU.toE1 (𝟙 _) ≅ SpectraWithAction.trivial T KU.toE1.toSpectrum) ∧
    Nonempty (TCminus (THH.relative ku ku.toE1 (𝟙 _)) ≅ (RT4T.EInftyRing.hT ku).toE1.toSpectrum) ∧
    ¬ Subsingleton ((THH ku.toE1).underlying.rationalisation.homotopyGroup 3) := sorry


end RefinedTraceMethods

namespace RefinedTraceMethods

/-! ## RT.4:q-Hodge and RT.4:Habiro-comparison: q-Hodge filtrations from THH over `ku`

Wagner's construction of q-Hodge filtrations from `THH` relative to `ku`: spherical lifts, light
solid spectra, nuclear modules, even filtrations, Devalapurkar's comparison, cyclonic spectra,
the invariants `TC^{−(m)}` and the comparison with Habiro cohomology, including the Habiro ring
of a number field.

Auxiliary carriers of this part that are not packet names carry the prefix `RT4Q.`. Objects
owned by other roadmaps (derived (q-)de Rham complexes, q-Hodge filtered algebras, Habiro rings,
solid abelian groups) are sorry-bodied carriers whose docstrings name the supplier. -/

open Polynomial

namespace RT4Q

/-! ### Filtered spectra -/

/-- Filtered spectra `Fun(ℤ^op, Sp)` (decreasing `ℤ`-indexed filtrations `fil^⋆`), prototyped by a
category. -/
def FilSpectrum : Type := sorry

instance : Category.{0} FilSpectrum := sorry

namespace FilSpectrum

/-- The `n`-th filtration step `fil^n X`. -/
def fil (X : FilSpectrum) (n : ℤ) : Spectrum := sorry

/-- The transition map `fil^{n+1} X → fil^n X`. -/
def transition (X : FilSpectrum) (n : ℤ) : X.fil (n + 1) ⟶ X.fil n := sorry

/-- The associated graded `gr^n X = cofib(fil^{n+1} X → fil^n X)`. -/
def gr (X : FilSpectrum) (n : ℤ) : Spectrum := Spectrum.cofib (X.transition n)

/-- The underlying object `colim_{n → −∞} fil^n X`. -/
def colim (X : FilSpectrum) : Spectrum := sorry

/-- The limit `lim_{n → ∞} fil^n X`. -/
def lim (X : FilSpectrum) : Spectrum := sorry

/-- A filtration is complete if `lim_n fil^n X ≃ 0`. -/
def IsComplete (X : FilSpectrum) : Prop := ∀ k : ℤ, Subsingleton (X.lim.homotopyGroup k)

/-- `X` is an exhaustive filtration of `M`: `colim_n fil^n X ≃ M`. -/
def IsExhaustiveFor (X : FilSpectrum) (M : Spectrum) : Prop := Nonempty (X.colim ≅ M)

/-- The completion `X^∧`. -/
def completion (X : FilSpectrum) : FilSpectrum := sorry

/-- The zero filtered spectrum. -/
def zero : FilSpectrum := sorry

/-- The map on `n`-th filtration steps. -/
def filMap {X Y : FilSpectrum} (f : X ⟶ Y) (n : ℤ) : X.fil n ⟶ Y.fil n := sorry

/-- The map on associated graded pieces. -/
def grMap {X Y : FilSpectrum} (f : X ⟶ Y) (n : ℤ) : X.gr n ⟶ Y.gr n := sorry

/-- The even regrading `Σ^{−2i} gr^i X` used throughout Wagner's work. -/
def grShift (X : FilSpectrum) (i : ℤ) : Spectrum := (X.gr i).shift (-2 * i)

/-- The pullback `X ×_Z Y` of filtered spectra. -/
def pullback {X Y Z : FilSpectrum} (f : X ⟶ Z) (g : Y ⟶ Z) : FilSpectrum := sorry

/-- Levelwise rationalisation `X ⊗ ℚ`. -/
def rationalise (X : FilSpectrum) : FilSpectrum := sorry

/-- Levelwise `p`-completion. -/
def pCompletion (p : ℕ) (X : FilSpectrum) : FilSpectrum := sorry

/-- The filtration concentrated in filtration degree `0` with value `M` (`fil^n = M` for `n ≤ 0`
and `0` for `n > 0`). -/
def ofSpectrum (M : Spectrum) : FilSpectrum := sorry

end FilSpectrum

/-- The Postnikov connective cover `τ_{≥n} X` (StableHomotopyKTheory H.5:spectra/postnikov-sections). -/
def postnikovCover (X : Spectrum) (n : ℤ) : Spectrum := sorry

/-- The double-speed Postnikov filtration `τ_{≥2⋆} X`. -/
def doubleSpeed (X : Spectrum) : FilSpectrum := sorry

/-- The steps of the double-speed Postnikov filtration: `fil^n = τ_{≥2n} X`. -/
theorem doubleSpeed_fil (X : Spectrum) (n : ℤ) :
    Nonempty ((doubleSpeed X).fil n ≅ postnikovCover X (2 * n)) := sorry

/-- A spectrum is even if its odd homotopy groups vanish. -/
def IsEvenSpectrum (X : Spectrum) : Prop := ∀ k : ℤ, Odd k → Subsingleton (X.homotopyGroup k)

/-- `X` is `p`-complete: the map to its `p`-completion is an equivalence. -/
def IsPComplete (p : ℕ) (X : Spectrum) : Prop := Nonempty (X ≅ Spectrum.pCompletion p X)

/-- The product `∏_i X_i` of a family of spectra. -/
def prod {ι : Type} (X : ι → Spectrum) : Spectrum := sorry

/-- The equalizer of two parallel maps of spectra. -/
def equalizer {X Y : Spectrum} (f g : X ⟶ Y) : Spectrum := sorry

/-- The limit `lim_m X_m` over the positive integers ordered by divisibility, along maps
`X_m → X_n` for `n ∣ m`. -/
def divisibilityLimit (X : ℕ → Spectrum) (f : ∀ m n : ℕ, n ∣ m → (X m ⟶ X n)) : Spectrum :=
  sorry

/-- The limit of a cosimplicial spectrum, `lim_Δ X^•`, prototyped on families indexed by `ℕ`
(the cosimplicial degree) with the coface data left implicit. -/
def totLimit (X : ℕ → Spectrum) : Spectrum := sorry

/-! ### Ring spectra used in this part -/

/-- The underlying spectrum of an E_∞-ring. -/
def sp (A : EInftyRing) : Spectrum := A.toE1.toSpectrum

/-- The sphere spectrum as an E_∞-ring. -/
def sphereInfty : EInftyRing := sorry

/-- The smash product of E_∞-rings. -/
def smashInfty (A B : EInftyRing) : EInftyRing := sorry

/-- The `p`-completion of an E_∞-ring. -/
def pCompleteInfty (p : ℕ) (A : EInftyRing) : EInftyRing := sorry

/-- The rationalisation `A ⊗ ℚ` of an E₁-ring. -/
def rationaliseE1 (A : E1Ring) : E1Ring := sorry

/-- The `p`-completion of an E₁-ring. -/
def pCompleteE1 (p : ℕ) (A : E1Ring) : E1Ring := sorry

/-- The `p`-complete sphere `S_p` as an E_∞-ring. -/
def sphereP (p : ℕ) : EInftyRing := pCompleteInfty p sphereInfty

/-- An E_∞-ring is connective if its underlying spectrum is. -/
def IsConnectiveInfty (A : EInftyRing) : Prop := (sp A).IsConnective

/-- E_n-rings in spectra (`1 ≤ n ≤ ∞` is not enforced; StableHomotopyKTheory
H.5:spectra/operadic-algebras). -/
def EnRing (n : ℕ) : Type := sorry

instance (n : ℕ) : Category.{0} (EnRing n) := sorry

/-- The underlying E₁-ring of an E_n-ring. -/
def EnRing.toE1 {n : ℕ} (R : EnRing n) : E1Ring := sorry

/-- An E_∞-ring regarded as an E_n-ring. -/
def EnRing.ofEInfty (n : ℕ) (A : EInftyRing) : EnRing n := sorry

/-- `ku_A := ku ⊗ S_A` for an E_∞-ring `S_A`. -/
def kuBase (SA : EInftyRing) : EInftyRing := smashInfty ku SA

/-- `ku_R := ku ⊗ S_R` for an E₁-ring `S_R`. -/
def kuOf (SR : E1Ring) : E1Ring := E1Ring.smash ku.toE1 SR

/-- `KU_A := KU ⊗ S_A`. -/
def KUBase (SA : EInftyRing) : EInftyRing := smashInfty KU SA

/-- `KU_R := KU ⊗ S_R`. -/
def KUOf (SR : E1Ring) : E1Ring := E1Ring.smash KU.toE1 SR

/-- The structure map `ku_A → ku_R` induced by `S_A → S_R`. -/
def kuRelMap (SA : EInftyRing) (SR : E1Ring) (f : SA.toE1 ⟶ SR) :
    (kuBase SA).toE1 ⟶ kuOf SR := sorry

/-- The structure map `KU_A → KU_R` induced by `S_A → S_R`. -/
def KURelMap (SA : EInftyRing) (SR : E1Ring) (f : SA.toE1 ⟶ SR) :
    (KUBase SA).toE1 ⟶ KUOf SR := sorry

/-- The relative `THH(ku_R/ku_A)` with its circle action. -/
def thhKu (SA : EInftyRing) (SR : E1Ring) (f : SA.toE1 ⟶ SR) : SpectraWithAction T :=
  THH.relative (kuBase SA) (kuOf SR) (kuRelMap SA SR f)

/-- The Bott element `β ∈ π_2 ku`. -/
def bott : (sp ku).homotopyGroup 2 := sorry

/-! ### Objects supplied by other roadmaps -/

/-- The derived q-de Rham complex `q-dR_{R/A}` of an `A`-algebra over a Λ-ring (or δ-ring) `A`,
an E_∞-algebra over `A[[q−1]]`, regarded as a spectrum (HabiroCohomologyFoundations HQ.3,
derived q-de Rham complexes). -/
def qDeRham (A R : Type) [CommRing A] [CommRing R] [Algebra A R] : Spectrum := sorry

/-- The derived de Rham complex `dR_{R/A}` regarded as a spectrum (DerivedDeRhamCohomology DD.2). -/
def deRham (A R : Type) [CommRing A] [CommRing R] [Algebra A R] : Spectrum := sorry

/-- The Hodge filtration `fil^⋆_{Hdg} dR_{R/A}` (DerivedDeRhamCohomology DD.2). -/
def hodgeFiltration (A R : Type) [CommRing A] [CommRing R] [Algebra A R] : FilSpectrum := sorry

/-- The combined Hodge and `(q−1)`-adic filtration `fil^⋆_{(Hdg,q−1)}` on
`(dR_{R/A} ⊗ ℚ)[[q−1]]`, `fil^n = ∑_{i+j=n} (q−1)^i fil^j_{Hdg}` (HabiroCohomologyFoundations HQ.3). -/
def hodgeQFiltration (A R : Type) [CommRing A] [CommRing R] [Algebra A R] : FilSpectrum := sorry

/-- `dR_{R/A}[1/p][[q−1]]` for the `p`-completed derived de Rham complex
(DerivedDeRhamCohomology DD.2). -/
def rationalDeRhamQ (p : ℕ) (A R : Type) [CommRing A] [CommRing R] [Algebra A R] : Spectrum :=
  sorry

/-- The map `q-dR_{R/A} → dR_{R/A}[1/p][[q−1]]` of `p`-completed complexes (the rationalised
q-de Rham comparison, HabiroCohomologyFoundations HQ.3). -/
def qdRToRational (p : ℕ) (A R : Type) [CommRing A] [CommRing R] [Algebra A R] :
    Spectrum.pCompletion p (qDeRham A R) ⟶ rationalDeRhamQ p A R := sorry

/-- The combined Hodge and `(q−1)`-adic filtration `fil^⋆_{(Hdg,q−1)}` on `dR_{R/A}[1/p][[q−1]]`
(`p`-completed `dR`; HabiroCohomologyFoundations HQ.3). -/
def hodgeQFiltrationP (p : ℕ) (A R : Type) [CommRing A] [CommRing R] [Algebra A R] :
    FilSpectrum := sorry

/-- The `(q−1)`-adic filtration `(q−1)^⋆ q-dR_{R/A}` (`p`-completed). -/
def qAdicFiltration (p : ℕ) (A R : Type) [CommRing A] [CommRing R] [Algebra A R] :
    FilSpectrum := sorry

/-- The q-Hodge complex `q-Hdg_{R/A} := (colim(fil^0 →^{(q−1)} fil^1 → ⋯))^∧_{(q−1)}` of a q-Hodge
filtered algebra (HabiroCohomologyFoundations HQ.3). -/
def qHodgeComplex (A R : Type) [CommRing A] [CommRing R] [Algebra A R] : Spectrum := sorry

/-- The Habiro–Hodge complex `q-ℋdg_{R/A}`, Habiro descent of the q-Hodge complex
(HabiroCohomologyFoundations HQ.3, HabiroRings HR.2–HR.5). -/
def habiroHodgeComplex (A R : Type) [CommRing A] [CommRing R] [Algebra A R] : Spectrum := sorry

/-- Animated `A`-algebras (DerivedDeRhamCohomology DD.2). -/
def AniAlg (A : Type) [CommRing A] : Type := sorry

instance (A : Type) [CommRing A] : Category.{0} (AniAlg A) := sorry

/-- A discrete `A`-algebra as an animated `A`-algebra. -/
def AniAlg.ofAlgebra (A R : Type) [CommRing A] [CommRing R] [Algebra A R] : AniAlg A := sorry

/-- The ∞-category `AniAlg^{q-Hdg}_A` of animated `A`-algebras with q-Hodge filtrations
(HabiroCohomologyFoundations HQ.3). -/
def QHodgeAlg (A : Type) [CommRing A] : Type := sorry

/-- The underlying animated algebra of a q-Hodge filtered algebra. -/
def QHodgeAlg.algebra {A : Type} [CommRing A] (X : QHodgeAlg A) : AniAlg A := sorry

/-- The q-Hodge filtration `fil^⋆_{q-Hdg} q-dR` of a q-Hodge filtered algebra. -/
def QHodgeAlg.filtration {A : Type} [CommRing A] (X : QHodgeAlg A) : FilSpectrum := sorry

/-- The Habiro ring `H_{R/ℤ}` of an étale `ℤ`-algebra (HabiroRings HR.5), defined there by
Habiro descent; for `R = O_F[1/Δ]` it is identified with the Garoufalidis–Scholze–Wheeler–Zagier
ring by HabiroRings HR.5-number-field-comparison. -/
def habiroRing (R : Type) [CommRing R] : Type := sorry

instance (R : Type) [CommRing R] : CommRing (habiroRing R) := sorry

/-- The Habiro ring `H_{O_F[1/Δ]}` of a number field of Garoufalidis–Scholze–Wheeler–Zagier
(HabiroRings HR.5-number-field-comparison/the-number-field-ring). -/
def gswzHabiroRing (F : Type) [Field F] [NumberField F] (Δ : ℕ) : Type := sorry

instance (F : Type) [Field F] [NumberField F] (Δ : ℕ) : CommRing (gswzHabiroRing F Δ) := sorry

/-- The comparison `H_{O_F[1/Δ]} ≅ H_{O_F[1/Δ]/ℤ}` of HabiroRings HR.5-number-field-comparison. -/
def gswzHabiroRing.equiv (F : Type) [Field F] [NumberField F] (Δ : ℕ) :
    gswzHabiroRing F Δ ≃+* habiroRing (Localization.Away (Δ : NumberField.RingOfIntegers F)) :=
  sorry

/-- The absolute discriminant `disc(F)` of a number field (supplied by Mathlib's
`NumberField.discr`, not imported here). -/
def numberFieldDiscr (F : Type) [Field F] [NumberField F] : ℤ := sorry

end RT4Q


/-! ### RT.4:q-Hodge/spherical-lift -/

namespace RT4Q

/-- The flat spherical polynomial ring `S[x] = S[ℕ]` as an E_∞-ring. -/
def sphericalPolynomial : EInftyRing := sorry

/-- The ring `ℤ_p{x}_∞/x` of Wagner Example 1.11 (the `p`-completed perfection of `ℤ_p[x]`
modulo `x`). -/
def wagnerQuotientRing (p : ℕ) [Fact p.Prime] : Type := sorry

instance (p : ℕ) [Fact p.Prime] : CommRing (wagnerQuotientRing p) := sorry

instance (p : ℕ) [Fact p.Prime] : Algebra ℤ_[p] (wagnerQuotientRing p) := sorry

/-- `K ⊗_{ku} ℤ` for an E₁-`ku`-algebra `K`. -/
def kuReduction (K : E1Ring) (f : ku.toE1 ⟶ K) : E1Ring := sorry

/-- The filtration `Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻(K/ku)` produced from an E₁-`ku`-algebra `K` by the
construction of RT.4:q-Hodge/q-hodge-comparison-map (Wagner Example 1.11). -/
def kuLiftFiltration (K : E1Ring) (f : ku.toE1 ⟶ K) : FilSpectrum := sorry

/-- Reduction modulo `β` of a filtered module over the Rees algebra `ℤ[β][[t]]` of
`(q−1)^⋆ℤ[[q−1]]` (with `q − 1 = βt`). -/
def modBeta (X : FilSpectrum) : FilSpectrum := sorry

end RT4Q

namespace RT4Q
/-- HR.1's p-completely perfectly covered δ-ring witness. -/
def PPerfectlyCovered (p : ℕ) (A : Type) [CommRing A] : Type := sorry
/-- Coherent S¹-equivariant E∞ refinement of the specified Tate-valued ring map. -/
def TateEquivariantRefinement (p : ℕ) (SA : EInftyRing)
    (f : SA ⟶ RT4T.EInftyRing.tCp SA p) : Type := sorry
/-- Canonical map of trivial-action E∞ algebras SA→SA^{tC_p}. -/
def cyclotomicBaseCan (p : ℕ) (SA : EInftyRing) : SA ⟶ RT4T.EInftyRing.tCp SA p := sorry
end RT4Q

/-- A `p`-cyclotomic base (Wagner 3.1(tC_p)): a `p`-complete connective E_∞-ring `S_A` with
`S_A ⊗_{S_p} ℤ_p ≃ A`, a δ-ring Frobenius `φ` on `A`, and an `S¹`-equivariant Tate-valued
Frobenius `S_A → S_A^{tC_p}` (trivial action on `S_A`, residual `S¹/C_p`-action on the target).
Perfect covering, the E∞ equivariant refinement, and its π₀ Frobenius square
are explicit fields. -/
structure CyclotomicBase (p : ℕ) (A : Type) [CommRing A] where
  prime : p.Prime
  perfectlyCovered : RT4Q.PPerfectlyCovered p A
  /-- The lift `S_A`. -/
  lift : EInftyRing
  /-- `S_A` is connective. -/
  connective : RT4Q.IsConnectiveInfty lift
  /-- `S_A` is `p`-complete. -/
  pComplete : RT4Q.IsPComplete p (RT4Q.sp lift)
  /-- `S_A ⊗_{S_p} ℤ_p ≃ A`. -/
  reduction : Nonempty (RT4Q.pCompleteInfty p (RT4Q.smashInfty lift (EInftyRing.ofCommRing ℤ)) ≅
    EInftyRing.ofCommRing A)
  /-- The Frobenius lift `φ` of the δ-ring `A`. -/
  frobeniusLift : A →+* A
  /-- `φ` lifts the `p`-th power map. -/
  frobenius_congr : ∀ a : A, ∃ b : A, frobeniusLift a = a ^ p + (p : A) * b
  pi0Identification : A ≃+* lift.toE1.pi0
  /-- The `S¹`-equivariant Tate-valued Frobenius `S_A → S_A^{tC_p}`. -/
  tateFrobenius : lift ⟶ RT4T.EInftyRing.tCp lift p
  equivariant : RT4Q.TateEquivariantRefinement p lift tateFrobenius
  pi0Frobenius : ∀ a : A,
    E1Ring.pi0Map (RT4T.EInftyRing.toE1Map tateFrobenius) (pi0Identification a) =
      E1Ring.pi0Map (RT4T.EInftyRing.toE1Map (RT4Q.cyclotomicBaseCan p lift))
        (pi0Identification (frobeniusLift a))

/-- A spherical lift of an `A`-algebra `R` over the E_∞-ring `S_A`: a connective E_n-ring `S_R`
(`n = 1` or `2` recorded as a parameter) with an `S_A`-algebra structure and an equivalence
`S_R ⊗ ℤ ≃ R` (Wagner 3.2 and 4.18). A lift merely to an E₁- or E₂-`ku`-algebra is not a
spherical lift (see `SphericalLift.ku_not_enough`). -/
structure SphericalLift (SA : EInftyRing) (R : Type) [CommRing R] (n : ℕ) where
  /-- The lift `S_R`. -/
  ring : RT4Q.EnRing n
  /-- The `S_A`-algebra structure. -/
  structureMap : SA.toE1 ⟶ ring.toE1
  /-- `S_R` is connective. -/
  connective : ring.toE1.IsConnective
  /-- `S_R ⊗ ℤ ≃ R`. -/
  reduction : Nonempty (E1Ring.smash ring.toE1 (E1Ring.ofRing ℤ) ≅ E1Ring.ofRing R)

/-- `ku_R := ku ⊗ S_R` (to be `p`-completed in the local case); `ku_A := ku ⊗ S_A` is
`RT4Q.kuBase`. -/
def SphericalLift.kuLift {SA : EInftyRing} {R : Type} [CommRing R] {n : ℕ}
    (L : SphericalLift SA R n) : E1Ring :=
  RT4Q.kuOf L.ring.toE1

/-- Étale `A`-algebras have canonical E_∞-lifts: if `S_A ⊗ ℤ ≃ A` and `R` is étale over `A`, there
is a spherical lift of `R` over `S_A` whose underlying ring is an E_∞-ring (the étale-framed smooth
case is not recorded here). -/
theorem SphericalLift.ofEtale (SA : EInftyRing) (A R : Type) [CommRing A] [CommRing R]
    [Algebra A R] [Algebra.Etale A R] (n : ℕ)
    (hA : Nonempty (RT4Q.smashInfty SA (EInftyRing.ofCommRing ℤ) ≅ EInftyRing.ofCommRing A)) :
    ∃ (L : SphericalLift SA R n) (S : EInftyRing), Nonempty (L.ring ≅ RT4Q.EnRing.ofEInfty n S) :=
  sorry

/-! ## Structured local/global lifting input (R15)

The Λ-ring, perfect-cover and cotangent witnesses are requested from HR.1 and
DD.0. The cover diagram carries all cofaces/degeneracies and reduction maps.
-/
namespace RT4Q
open Coherent

def CosimplicialShape : InftyCategory := sorry
def AugmentedCosimplicialShape : InftyCategory := sorry
def LambdaRingStructure (A : Type) [CommRing A] : Type := sorry
def PerfectlyCoveredWitness (A : Type) [CommRing A] : Type := sorry
def QuasiLCIWitness (A R : Type) [CommRing A] [CommRing R] [Algebra A R] : Type := sorry
def pCoefficient (A : Type) [CommRing A] (p : ℕ) : Type := sorry
instance (A : Type) [CommRing A] (p : ℕ) : CommRing (pCoefficient A p) := sorry
/-- Faithfully p-quasisyntomic cover and relative semiperfectness mod p (DD.0). -/
def SemiperfectCoverWitness (p : ℕ) (A R S : Type)
    [CommRing A] [CommRing R] [CommRing S] : Type := sorry
/-- Lifted augmented Čech diagram over S_A, with p-complete connective values,
and coherent reduction to the p-completed Čech nerve (H.5, E0). -/
def LiftedCechReduction (p : ℕ) (SA : EInftyRing) (R S : Type)
    [CommRing R] [CommRing S]
    (D : Functor AugmentedCosimplicialShape RT3.ConnAlg) : Type := sorry

structure LocalE1Choice (p : ℕ) (A R : Type) [CommRing A] [CommRing R]
    (B : CyclotomicBase p A) where
  torsionFree : ∀ x : R, (p : R)*x=0 → x=0
  cover : Type
  commRing : CommRing cover
  coverWitness : @SemiperfectCoverWitness p A R cover _ _ commRing
  diagram : Functor AugmentedCosimplicialShape RT3.ConnAlg
  reduction : @LiftedCechReduction p B.lift R cover _ commRing diagram

/-- A connective p-complete E₂-algebra lift over the specified tC_p base. -/
structure LocalE2Choice (p : ℕ) (A R : Type) [CommRing A] [CommRing R]
    (B : CyclotomicBase p A) where
  lift : SphericalLift B.lift R 2
  pComplete : IsPComplete p lift.ring.toE1.toSpectrum

inductive LocalLiftBranch (p : ℕ) (A R : Type) [CommRing A] [CommRing R]
    (B : CyclotomicBase p A)
  | e1 : LocalE1Choice p A R B → LocalLiftBranch p A R B
  | e2 : LocalE2Choice p A R B → LocalLiftBranch p A R B

/-- Arithmetic reduction and rational identifications, coherent on overlaps (H.6/E0). -/
def ArithmeticLiftCompatibility (SA : EInftyRing) (A R : Type)
    [CommRing A] [CommRing R]
    (B : ∀ p : ℕ, p.Prime → CyclotomicBase p (pCoefficient A p))
    (L : ∀ (p : ℕ) (hp : p.Prime),
      LocalLiftBranch p (pCoefficient A p) (pCoefficient R p) (B p hp)) : Type := sorry

structure CompatibleSphericalLifts (SA : EInftyRing) (A R : Type)
    [CommRing A] [CommRing R] [Algebra A R] where
  lambda : LambdaRingStructure A
  perfectlyCovered : PerfectlyCoveredWitness A
  quasiLCI : QuasiLCIWitness A R
  boundedTorsion : ∀ (p : ℕ), p.Prime → ∃ N : ℕ,
    ∀ x : R, (∃ n : ℕ, (p : R)^n*x=0) → (p : R)^N*x=0
  base : ∀ (p : ℕ), p.Prime → CyclotomicBase p (pCoefficient A p)
  localChoices : ∀ (p : ℕ) (hp : p.Prime),
    LocalLiftBranch p (pCoefficient A p) (pCoefficient R p) (base p hp)
  compatibility : ArithmeticLiftCompatibility SA A R base localChoices

/-- The source construction supplies a connective global E₁ lift. -/
def CompatibleSphericalLifts.glue {SA : EInftyRing} {A R : Type}
    [CommRing A] [CommRing R] [Algebra A R]
    (G : CompatibleSphericalLifts SA A R) : SphericalLift SA R 1 := sorry
/-- Higher refinement is retained only when every local branch has it. -/
def AllE2Branches {SA : EInftyRing} {A R : Type}
    [CommRing A] [CommRing R] [Algebra A R]
    (G : CompatibleSphericalLifts SA A R) : Prop :=
  ∀ (p : ℕ) (hp : p.Prime), ∃ L : LocalE2Choice p (pCoefficient A p)
    (pCoefficient R p) (G.base p hp), G.localChoices p hp = LocalLiftBranch.e2 L

theorem CompatibleSphericalLifts.e2 {SA : EInftyRing} {A R : Type}
    [CommRing A] [CommRing R] [Algebra A R]
    (G : CompatibleSphericalLifts SA A R) (h : AllE2Branches G) :
    ∃ L : SphericalLift SA R 2, Nonempty (L.ring.toE1 ≅ G.glue.ring.toE1) := sorry

/-- A supplied global lift is identified with the chosen gluing, not merely any
E₁ lift of the same discrete ring. It has enough local E_n refinement for n. -/
def GlobalEnCompatibility {SA : EInftyRing} {A R : Type}
    [CommRing A] [CommRing R] [Algebra A R] {n : ℕ}
    (G : CompatibleSphericalLifts SA A R) (L : SphericalLift SA R n) : Type := sorry
class CompatibleGlobalInput (SA : EInftyRing) (A R : Type)
    [CommRing A] [CommRing R] [Algebra A R] {n : ℕ} (L : SphericalLift SA R n) where
  choices : CompatibleSphericalLifts SA A R
  identifies : GlobalEnCompatibility choices L

/-- The chosen gluing supplies its own compatibility data to the strict model. -/
@[instance_reducible]
def CompatibleSphericalLifts.globalInput {SA : EInftyRing} {A R : Type}
    [CommRing A] [CommRing R] [Algebra A R]
    (G : CompatibleSphericalLifts SA A R) : CompatibleGlobalInput SA A R G.glue :=
  ⟨G, sorry⟩

/-- A₂ is a morphism in the coherent cyclonic E∞ algebra category. The mapping
space itself retains all prime/divisor coherences, beyond its displayed paths. -/
def CyclonicAlgebras : InftyCategory := sorry
def CircleAlgebras : InftyCategory := sorry
def cyclonicForgetAlgebra : Functor CyclonicAlgebras CircleAlgebras := sorry
def circleBase (SA : EInftyRing) : Obj CircleAlgebras := sorry
def cyctBase (SA : EInftyRing) : Obj CyclonicAlgebras := sorry
def trivBase (SA : EInftyRing) : Obj CyclonicAlgebras := sorry
/-- Identifies the source and target underlying circle algebras with S_A. -/
def underlyingA2Map (SA : EInftyRing)
    (f : Hom (cyctBase SA) (trivBase SA)) : Hom (circleBase SA) (circleBase SA) := sorry
structure CyclonicBaseCoherence (SA : EInftyRing) where
  morphism : Hom (cyctBase SA) (trivBase SA)
  underlyingIdentity : Path (Map CircleAlgebras (circleBase SA) (circleBase SA))
    (underlyingA2Map SA morphism) (identity (circleBase SA))

def CyclonicBaseCoherence.adams {SA : EInftyRing} (C : CyclonicBaseCoherence SA)
    (m : ℕ) (hm : 0<m) : Hom (circleBase SA) (circleBase SA) := sorry
def circleTateAlgebra (SA : EInftyRing) (p : ℕ) : Obj CircleAlgebras := sorry
def circleCan (SA : EInftyRing) (p : ℕ) : Hom (circleBase SA) (circleTateAlgebra SA p) := sorry
def circlePhi (SA : EInftyRing) (p : ℕ) (hp : p.Prime) :
    Hom (circleBase SA) (circleTateAlgebra SA p) := sorry
def tateAdams {SA : EInftyRing} (C : CyclonicBaseCoherence SA) (p m : ℕ)
    (hm : 0<m) : Hom (circleTateAlgebra SA p) (circleTateAlgebra SA p) := sorry

def CyclonicBaseCoherence.frobeniusSquare {SA : EInftyRing}
    (C : CyclonicBaseCoherence SA) (p m : ℕ) (hp : p.Prime) (hm : 0<m) :
    Path (Map CircleAlgebras (circleBase SA) (circleTateAlgebra SA p))
      (comp (C.adams (p*m) (Nat.mul_pos hp.pos hm)) (circleCan SA p))
      (comp (circlePhi SA p hp) (tateAdams C p m hm)) := sorry
/-- Coherent commuting Frobenius lifts, including rational/spherical reductions (HR.1/E0). -/
def CommutingFrobeniusData (SA : EInftyRing) : Type := sorry
def CyclonicBaseCoherence.fromFrobenius (SA : EInftyRing)
    (D : CommutingFrobeniusData SA) : CyclonicBaseCoherence SA := sorry
def CyclonicModules (SA : EInftyRing) : InftyCategory := sorry
/-- THH(S_R/S_A)^cyct ⊗_{S_A^cyct} S_A^triv, then tensor with cyclonic ku. -/
def CyclonicBaseCoherence.relativeTHH {SA : EInftyRing} (C : CyclonicBaseCoherence SA)
    (SR : E1Ring) (f : SA.toE1 ⟶ SR) : Obj (CyclonicModules SA) := sorry


/-- Test RT4Q.CyclonicBaseCoherence.one. -/
example (SA : EInftyRing) (D : CommutingFrobeniusData SA) :
    Nonempty (Path (Map CircleAlgebras (circleBase SA) (circleBase SA))
      ((CyclonicBaseCoherence.fromFrobenius SA D).adams 1 (by decide))
      (identity (circleBase SA))) := sorry
/-- Test RT4Q.CyclonicBaseCoherence.list_insufficient: a bare family omits this path data. -/
example {SA : EInftyRing} (C : CyclonicBaseCoherence SA) (p m : ℕ)
    (hp : p.Prime) (hm : 0<m) :
    Nonempty (Path (Map CircleAlgebras (circleBase SA) (circleTateAlgebra SA p))
      (comp (C.adams (p*m) (Nat.mul_pos hp.pos hm)) (circleCan SA p))
      (comp (circlePhi SA p hp) (tateAdams C p m hm))) := ⟨C.frobeniusSquare p m hp hm⟩
end RT4Q

/-- Per-prime lifts and the rational lift glue to a global spherical lift `S_R` (E₁, or E₂ if (E₂)
holds at every prime). The compatibility of the rationalised `p`-adic lifts with the rational lift,
which the gluing also uses, is not recorded in the signature. -/
theorem SphericalLift.glue (SA : EInftyRing) (A R : Type)
    [CommRing A] [CommRing R] [Algebra A R]
    (G : RT4Q.CompatibleSphericalLifts SA A R) :
    ∃ L : SphericalLift SA R 1, Nonempty (L.ring.toE1 ≅ G.glue.ring.toE1) := sorry

/-- Test `SphericalLift.polynomial` (computation): `S[x]` is an E_∞-lift of `ℤ[x]`. -/
example (n : ℕ) : ∃ L : SphericalLift RT4Q.sphereInfty ℤ[X] n,
    Nonempty (L.ring ≅ RT4Q.EnRing.ofEInfty n RT4Q.sphericalPolynomial) := sorry

/-- Test `SphericalLift.base` (degenerate): `S` itself lifts `ℤ` (`A = R = ℤ`). -/
example (n : ℕ) : ∃ L : SphericalLift RT4Q.sphereInfty ℤ n,
    Nonempty (L.ring ≅ RT4Q.EnRing.ofEInfty n RT4Q.sphereInfty) := sorry

/-- Test `SphericalLift.ku_not_enough` (non-example): `R = ℤ_p{x}_∞/x` has an E₁-`ku`-algebra lift,
but the resulting filtration is not a q-deformation of the Hodge filtration (its reduction modulo
`β` is not the Hodge filtration; Wagner 1.11). -/
example (p : ℕ) [Fact p.Prime] :
    ∃ (K : E1Ring) (f : ku.toE1 ⟶ K),
      Nonempty (RT4Q.kuReduction K f ≅ E1Ring.ofRing (RT4Q.wagnerQuotientRing p)) ∧
      ¬ Nonempty (RT4Q.modBeta (RT4Q.kuLiftFiltration K f) ≅
        RT4Q.hodgeFiltration ℤ_[p] (RT4Q.wagnerQuotientRing p)) := sorry


/-! ### RT.4:q-Hodge/solid-spectra -/

namespace RT4Q

/-- Light condensed spectra `Cond(Sp)`: sheaves of spectra on light profinite sets. -/
def CondSpectrum : Type := sorry

instance : Category.{0} CondSpectrum := sorry

/-- The discrete embedding `X ↦ X̲` (fully faithful and symmetric monoidal). -/
def discrete : Spectrum ⥤ CondSpectrum := sorry

/-- The tensor product of condensed spectra. -/
def condTensor (M N : CondSpectrum) : CondSpectrum := sorry

/-- The internal mapping object `Hom(M, N)` of condensed spectra. -/
def condHom (M N : CondSpectrum) : CondSpectrum := sorry

/-- The cofibre of a map of condensed spectra. -/
def condCofib {M N : CondSpectrum} (f : M ⟶ N) : CondSpectrum := sorry

/-- The condensed spectrum `S[{∞}]`. -/
def spherePoint : CondSpectrum := sorry

/-- The condensed spectrum `S[ℕ ∪ {∞}]` on the one-point compactification of `ℕ`. -/
def sphereOnePointCompact : CondSpectrum := sorry

/-- The map `S[{∞}] → S[ℕ ∪ {∞}]`. -/
def pointInclusion : spherePoint ⟶ sphereOnePointCompact := sorry

/-- `Null := cofib(S[{∞}] → S[ℕ ∪ {∞}])`. -/
def null : CondSpectrum := condCofib pointInclusion

/-- The shift `σ : Null → Null` induced by `n ↦ n + 1`. -/
def nullShift : null ⟶ null := sorry

/-- The map `1 − σ^*` on `Hom(Null, M)`. -/
def oneMinusShift (M : CondSpectrum) : condHom null M ⟶ condHom null M := sorry

/-- A condensed spectrum `M` is solid if `1 − σ^*` is an equivalence on `Hom(Null, M)`. -/
def IsSolid (M : CondSpectrum) : Prop := IsIso (oneMinusShift M)

end RT4Q

/-- Light solid spectra `Sp_■ ⊆ Cond(Sp)`: the full subcategory of solid condensed spectra
(Clausen–Scholze; extends VStackSheavesAndLisseCategories VS2's solid abelian groups to spectra).
It is closed under limits and colimits. -/
def SolidSpectrum : Type := {M : RT4Q.CondSpectrum // RT4Q.IsSolid M}

instance : Category.{0} SolidSpectrum := sorry

namespace RT4Q

/-- The fully faithful inclusion `Sp_■ ⊆ Cond(Sp)`. -/
def solidInclusion : SolidSpectrum ⥤ CondSpectrum := sorry

/-- Solidification `(−)^■ : Cond(Sp) → Sp_■`. -/
def solidification : CondSpectrum ⥤ SolidSpectrum := sorry

/-- `Null^■`. -/
def nullSolid : SolidSpectrum := solidification.obj null

/-- The product `∏_ℕ S` in `Sp_■`. -/
def prodSphere : SolidSpectrum := sorry

/-- The zero solid spectrum. -/
def solidZero : SolidSpectrum := sorry

/-- The mapping spectrum between solid spectra. -/
def solidMap (X Y : SolidSpectrum) : Spectrum := sorry

end RT4Q

/-- `(−)^■ : Cond(Sp) → Sp_■` is left adjoint to the inclusion. -/
theorem SolidSpectrum.solidify : Nonempty (RT4Q.solidification ⊣ RT4Q.solidInclusion) := sorry

/-- The solid tensor product `M ⊗^■ N := (M ⊗ N)^■` (symmetric monoidal; the coherence data are
not recorded). -/
def SolidSpectrum.tensor (M N : SolidSpectrum) : SolidSpectrum :=
  RT4Q.solidification.obj
    (RT4Q.condTensor (RT4Q.solidInclusion.obj M) (RT4Q.solidInclusion.obj N))

/-- `Null^■ ≃ ∏_ℕ S` and it generates `Sp_■` (`Hom(Null^■, M) ≃ 0` forces `M ≃ 0`). Compactness of
`Null^■` is not recorded in the signature. -/
theorem SolidSpectrum.generator :
    Nonempty (RT4Q.nullSolid ≅ RT4Q.prodSphere) ∧
      ∀ M : SolidSpectrum, (∀ k : ℤ, Subsingleton ((RT4Q.solidMap RT4Q.nullSolid M).homotopyGroup k)) →
        Nonempty (M ≅ RT4Q.solidZero) := sorry

/-- The embedding of `p`-complete spectra, `X ↦ X^∧_p` regarded as a solid spectrum; it is fully
faithful and symmetric monoidal on bounded-below objects (`RT4Q.ofPComplete_bijective`,
`RT4Q.ofPComplete_tensor`). -/
def SolidSpectrum.ofPComplete (p : ℕ) : Spectrum ⥤ SolidSpectrum := sorry

/-- `SolidSpectrum.ofPComplete` is fully faithful on bounded-below `p`-complete spectra. -/
theorem RT4Q.ofPComplete_bijective (p : ℕ) (X Y : Spectrum) (hX : X.IsBoundedBelow)
    (hY : Y.IsBoundedBelow) (hXp : RT4Q.IsPComplete p X) (hYp : RT4Q.IsPComplete p Y) :
    Function.Bijective (fun f : X ⟶ Y => (SolidSpectrum.ofPComplete p).map f) := sorry

/-- `SolidSpectrum.ofPComplete` is monoidal on bounded-below spectra:
`(X ⊗ Y)^∧_p ≃ X^∧_p ⊗^■ Y^∧_p`. -/
theorem RT4Q.ofPComplete_tensor (p : ℕ) (X Y : Spectrum) (hX : X.IsBoundedBelow)
    (hY : Y.IsBoundedBelow) :
    Nonempty ((SolidSpectrum.ofPComplete p).obj (X.smash Y) ≅
      SolidSpectrum.tensor ((SolidSpectrum.ofPComplete p).obj X)
        ((SolidSpectrum.ofPComplete p).obj Y)) := sorry

/-- Test `SolidSpectrum.discrete` (degenerate): discrete spectra are solid. -/
example (X : Spectrum) : RT4Q.IsSolid (RT4Q.discrete.obj X) := sorry

/-- Test `SolidSpectrum.product` (computation): `Null^■ ≃ ∏_ℕ S`. -/
example : Nonempty (RT4Q.nullSolid ≅ RT4Q.prodSphere) := sorry

/-- Test `SolidSpectrum.not_all_condensed` (non-example): the condensed spectrum `S[ℕ ∪ {∞}]` is
not solid. -/
example : ¬ RT4Q.IsSolid RT4Q.sphereOnePointCompact := sorry

/-! ### RT.4:q-Hodge/nuclear-objects -/

namespace RT4Q

/-- Solid E₁ ring spectra; right-left pairing is used without a commutativity assumption. -/
def SolidRing : Type := sorry

instance : Category.{0} SolidRing := sorry

/-- A discrete commutative ring as a solid ring. -/
def SolidRing.ofCommRing (R : Type) [CommRing R] : SolidRing := sorry

/-- `LMod_R(Sp_■)`. -/
def SolidMod (R : SolidRing) : Type := sorry

instance (R : SolidRing) : Category.{0} (SolidMod R) := sorry

/-- Ambient unit of solid spectra. -/
def solidSphere : SolidSpectrum := solidification.obj (discrete.obj Spectrum.sphere)

/-- Data of a coherent E∞ refinement of the solid E₁ algebra, supplied by VS2. -/
def SolidCommutativeRefinement (R : SolidRing) : Type := sorry

/-- Opposite E₁ solid ring, supplied by the spectral module interface. -/
def SolidRing.op (R : SolidRing) : SolidRing := sorry

/-- An explicit commutative refinement; needed only for the monoidal left-module signatures. -/
class SolidRing.Commutative (R : SolidRing) : Prop where
  refinement : Nonempty (SolidCommutativeRefinement R)

instance (R : SolidRing) [SolidRing.Commutative R] : MonoidalCategory (SolidMod R) := sorry

/-- Ambient underlying solid spectrum. -/
def SolidMod.underlying {R : SolidRing} (M : SolidMod R) : SolidSpectrum := sorry

/-- Regular left module. -/
def SolidMod.self (R : SolidRing) : SolidMod R := sorry

/-- The ambient solid mapping object, not a left module over general E₁ R. -/
def SolidMod.ihom {R : SolidRing} (M N : SolidMod R) : SolidSpectrum := sorry

/-- The right-module dual of a left module. -/
def SolidMod.dualRight {R : SolidRing} (M : SolidMod R) : SolidMod R.op := sorry

/-- The right-left relative tensor. -/
def SolidMod.relativeTensor {R : SolidRing} (N : SolidMod R.op) (M : SolidMod R) :
    SolidSpectrum := sorry

/-- The canonical ambient mapping comparison. -/
def SolidMod.dualTensorToHom {R : SolidRing} (M N : SolidMod R) :
    SolidMod.relativeTensor (SolidMod.dualRight M) N ⟶ SolidMod.ihom M N := sorry

/-- Classifier evaluation uses the ambient solid sphere and right-left relative tensor. -/
def SolidMod.classified {R : SolidRing} {M N : SolidMod R} :
    (RT4Q.solidSphere ⟶ SolidMod.relativeTensor (SolidMod.dualRight M) N) → (M ⟶ N) := sorry

/-- A map is trace-class if it lies in the image of `SolidMod.classified`. -/
def IsTraceClass {R : SolidRing} {M N : SolidMod R} (φ : M ⟶ N) : Prop :=
  φ ∈ Set.range (SolidMod.classified (M := M) (N := N))

/-- `M` is dualizable: `Hom_R(M, R) ⊗_R N → Hom_R(M, N)` is an equivalence for all `N`. -/
def IsDualizable {R : SolidRing} (M : SolidMod R) : Prop :=
  ∀ N : SolidMod R, IsIso (SolidMod.dualTensorToHom M N)

/-- The sequential colimit `colim(M_0 → M_1 → ⋯)` in `LMod_R(Sp_■)`. -/
def SolidMod.seqColim {R : SolidRing} (F : ℕ ⥤ SolidMod R) : SolidMod R := sorry

/-- The cofibre of a map of solid modules. -/
def SolidMod.cofib {R : SolidRing} {M N : SolidMod R} (f : M ⟶ N) : SolidMod R := sorry

/-- The direct sum of a family of solid modules. -/
def SolidMod.sum {R : SolidRing} {ι : Type} (M : ι → SolidMod R) : SolidMod R := sorry

/-- The product `∏_ℕ R` in `Mod_R(Sp_■)`. -/
def SolidMod.prodUnit (R : SolidRing) : SolidMod R := sorry

/-- The mapping spectrum `Hom_R(P, M)`. -/
def SolidMod.homSpectrum {R : SolidRing} (P : SolidMod R) : SolidMod R ⥤ Spectrum := sorry

/-- The sequential colimit of spectra. -/
def seqColimSpectrum (F : ℕ ⥤ Spectrum) : Spectrum := sorry

/-- The comparison `colim_n Hom(P, M_n) → Hom(P, colim_n M_n)`. -/
def SolidMod.colimComparison {R : SolidRing} (P : SolidMod R) (F : ℕ ⥤ SolidMod R) :
    seqColimSpectrum (F ⋙ SolidMod.homSpectrum P) ⟶
      (SolidMod.homSpectrum P).obj (SolidMod.seqColim F) := sorry

/-- The mapping-spectrum functor of P preserves all small filtered colimits. -/
def IsCompactObj {R : SolidRing} (P : SolidMod R) : Prop :=
  Limits.PreservesFilteredColimits (SolidMod.homSpectrum P)

/-- Base change `S ⊗_R −` along a map of solid rings. -/
def SolidMod.baseChange {R S : SolidRing} (f : R ⟶ S) : SolidMod R ⥤ SolidMod S := sorry

end RT4Q

/-- Ambient classifier characterization of trace-class maps for general E₁ R. -/
theorem TraceClass {R : RT4Q.SolidRing} {M N : RT4Q.SolidMod R} (φ : M ⟶ N) :
    RT4Q.IsTraceClass φ ↔
      ∃ η : RT4Q.solidSphere ⟶ RT4Q.SolidMod.relativeTensor
        (RT4Q.SolidMod.dualRight M) N,
        RT4Q.SolidMod.classified η = φ := sorry

/-- Basic nuclear modules: `M ≃ colim(M_0 → M_1 → ⋯)` with trace-class transition maps. -/
def BasicNuclear {R : RT4Q.SolidRing} (M : RT4Q.SolidMod R) : Prop :=
  ∃ F : ℕ ⥤ RT4Q.SolidMod R,
    (∀ n : ℕ, RT4Q.IsTraceClass (F.map (homOfLE (Nat.le_succ n)))) ∧
      Nonempty (M ≅ RT4Q.SolidMod.seqColim F)

/-- Nuclear modules: the subcategory generated under colimits (cofibres and direct sums, closed
under equivalence) by the basic nuclear modules (Wagner Theorem 2.11 gives closure under shifts,
`ω_1`-compact generation and base change). -/
def Nuclear {R : RT4Q.SolidRing} (M : RT4Q.SolidMod R) : Prop :=
  ∀ (P : RT4Q.SolidMod R), RT4Q.IsCompactObj P →
    ∀ f : P ⟶ M, RT4Q.IsTraceClass f

/-- Base change `S ⊗_R −` preserves nuclear modules. -/
theorem Nuclear.baseChange {R S : RT4Q.SolidRing} (f : R ⟶ S) (M : RT4Q.SolidMod R)
    (hM : Nuclear M) : Nuclear ((RT4Q.SolidMod.baseChange f).obj M) := sorry

open MonoidalCategory in
/-- `Hom_R(P, R) ⊗_R M ≃ Hom_R(P, M)` for compact `P` and nuclear `M`. -/
theorem Nuclear.homCompact {R : RT4Q.SolidRing} (P M : RT4Q.SolidMod R)
    (hP : RT4Q.IsCompactObj P) (hM : Nuclear M) :
    IsIso (RT4Q.SolidMod.dualTensorToHom P M) := sorry

/-- Test `Nuclear.dualizable` (degenerate): dualizable objects, in particular the unit, are
nuclear (the identity of a dualizable object is trace-class). -/
example {R : RT4Q.SolidRing} (P : RT4Q.SolidMod R) (hP : RT4Q.IsDualizable P) : Nuclear P :=
  sorry

/-- Test `TraceClass.zero`: a zero classifier gives the zero map for arbitrary modules. -/
instance (R : RT4Q.SolidRing) : Limits.HasZeroMorphisms (RT4Q.SolidMod R) := sorry
example {R : RT4Q.SolidRing} (M N : RT4Q.SolidMod R) :
    RT4Q.IsTraceClass (0 : M ⟶ N) := sorry

/-- Test `Nuclear.not_all` (non-example): compactness does not make an identity trace-class:
for discrete `R = ℤ` the compact generator `Null_ℤ ≃ ∏_ℕ ℤ` is not dualizable (its dual is
`⊕_ℕ ℤ`, Wagner 2.3), so its identity is not trace-class. -/
example : ¬ RT4Q.IsTraceClass (𝟙 (RT4Q.SolidMod.prodUnit (RT4Q.SolidRing.ofCommRing ℤ))) := sorry


/-! ### RT.4:q-Hodge/perfect-even-filtration -/

namespace RT4Q

/-- Left modules over an E₁-ring. -/
def LMod (R : E1Ring) : Type := sorry

instance (R : E1Ring) : Category.{0} (LMod R) := sorry

/-- The underlying spectrum of a module. -/
def LMod.underlying {R : E1Ring} (M : LMod R) : Spectrum := sorry

/-- `R` as a left module over itself. -/
def LMod.self (R : E1Ring) : LMod R := sorry

/-- Base change `S ⊗_R −` along a map of E₁-rings. -/
def LMod.baseChange {R S : E1Ring} (f : R ⟶ S) : LMod R ⥤ LMod S := sorry

/-- The `n`-th term `S^{⊗_R (n+1)}` of the Čech nerve of `R → S`. -/
def cechRing {R S : E1Ring} (f : R ⟶ S) (n : ℕ) : E1Ring := sorry

/-- The unit `R → S^{⊗_R (n+1)}`. -/
def cechUnit {R S : E1Ring} (f : R ⟶ S) (n : ℕ) : R ⟶ cechRing f n := sorry

end RT4Q

/-- Opposite ring and its left-module model, imported from H.5. -/
def E1Ring.op (R : E1Ring) : E1Ring := sorry

namespace RT4Q
/-- Cofibers and shifts are the coherent spectral module operations. -/
def LMod.shift {R : E1Ring} (M : LMod R) (n : ℤ) : LMod R := sorry
def LMod.cofib {R : E1Ring} {M N : LMod R} (f : M ⟶ N) : LMod R := sorry

def IsPerfectEven {R : E1Ring} (M : LMod R) : Prop :=
  ∀ P : LMod R → Prop,
    (∀ n : ℤ, P ((LMod.self R).shift (2 * n))) →
    (∀ N N' : LMod R, Nonempty (N ≅ N') → P N → P N') →
    (∀ (N N' : LMod R) (f : N ⟶ N'), P N → P (LMod.cofib f) → P N') →
    (∀ (N N' : LMod R) (i : N ⟶ N') (r : N' ⟶ N), i ≫ r = 𝟙 N → P N' → P N) → P M

/-- Coherent module category and model comparison, requested from H.5/EDS E0. -/
def LMod.coherentCategory (R : E1Ring) : Coherent.InftyCategory := sorry
def LMod.fromCoherent {R : E1Ring} : Coherent.Obj (LMod.coherentCategory R) → LMod R := sorry
def LMod.toCoherent {R : E1Ring} : LMod R → Coherent.Obj (LMod.coherentCategory R) := sorry
/-- All-small-filtered coherent diagram data, requested from EDS E0. -/
def FilteredShape (J : Coherent.InftyCategory) : Type := sorry
def CoherentColimit {J : Coherent.InftyCategory} {R : E1Ring}
    (D : Coherent.Functor J (LMod.coherentCategory R)) : LMod R := sorry

structure EvenFlatPresentation {R : E1Ring} (M : LMod R) where
  index : Coherent.InftyCategory
  filtered : FilteredShape index
  diagram : Coherent.Functor index (LMod.coherentCategory R)
  perfect : ∀ j : Coherent.Obj index, IsPerfectEven (LMod.fromCoherent (diagram.obj j))
  comparison : Nonempty (CoherentColimit diagram ≅ M)

def IsEvenFlat {R : E1Ring} (M : LMod R) : Prop := Nonempty (EvenFlatPresentation M)

/-- Coherent even site, with covers given by perfect-even fibers. -/
def EvenSite (R : E1Ring) : Coherent.InftyCategory := sorry
/-- Category of abelian sheaves on the even site, supplied by EDS E0. -/
def EvenSheaf (R : E1Ring) : Type := sorry
instance (R : E1Ring) : Category.{0} (EvenSheaf R) := sorry
instance (R : E1Ring) : Limits.HasZeroObject (EvenSheaf R) := sorry

/-- Sheafification, not presheaf point evaluation. -/
def evenHomotopySheaf {R : E1Ring} (M : LMod R) (j : ℤ) : EvenSheaf R := sorry
def IsHomologicallyEven {R : E1Ring} (M : LMod R) : Prop :=
  ∀ j : ℤ, Odd j → Limits.IsZero (evenHomotopySheaf M j)

/-- Spectral Yoneda sheaf on the coherent even site. -/
def evenYoneda {R : E1Ring} (M : LMod R) : Type := sorry

/-- S and cofiber as right modules, and the cofiber as a left module. -/
def ringMapRightModule {R S : E1Ring} (f : R ⟶ S) : LMod R.op := sorry
def ringMapCofiberRight {R S : E1Ring} (f : R ⟶ S) : LMod R.op := sorry
def ringMapCofiberLeft {R S : E1Ring} (f : R ⟶ S) : LMod R := sorry

def IsEvenFaithfullyFlat {R S : E1Ring} (f : R ⟶ S) : Prop :=
  IsEvenFlat (ringMapRightModule f) ∧ IsEvenFlat (ringMapCofiberRight f) ∧
    IsHomologicallyEven (ringMapCofiberLeft f)

/-- Opposite-map compatibility, with the side convention reversed. -/
def ringMapOpposite {R S : E1Ring} (f : R ⟶ S) : R.op ⟶ S.op := sorry
def ringMapLeftModule {R S : E1Ring} (f : R ⟶ S) : LMod R := sorry
def IsRightEvenFaithfullyFlat {R S : E1Ring} (f : R ⟶ S) : Prop :=
  IsEvenFlat (ringMapLeftModule f) ∧ IsEvenFlat (ringMapCofiberLeft f) ∧
    IsHomologicallyEven (ringMapCofiberRight f)
theorem faithfullyEvenFlat.op {R S : E1Ring} (f : R ⟶ S) :
    IsEvenFaithfullyFlat (ringMapOpposite f) ↔ IsRightEvenFaithfullyFlat f := sorry

/-- Test RT4Q.perfectEven.unit / RT4Q.perfectEven.zero_cover. -/
example (R : E1Ring) : IsPerfectEven (LMod.self R) := sorry
/-- Test RT4Q.perfectEven.retract, genuinely includes split retracts. -/
example {R : E1Ring} (M N : LMod R) (i : M ⟶ N) (r : N ⟶ M)
    (h : i ≫ r = 𝟙 M) (hN : IsPerfectEven N) : IsPerfectEven M := sorry
/-- Test RT4Q.perfectEven.not_stable: odd free suspension is excluded over HZ. -/
example : ¬ IsPerfectEven ((LMod.self (E1Ring.ofRing ℤ)).shift 1) := sorry
/-- Test RT4Q.evenFlat.unit. -/
example (R : E1Ring) : IsEvenFlat (LMod.self R) := sorry
/-- Zero module (H.5). -/
def LMod.zero (R : E1Ring) : LMod R := sorry
/-- Tests RT4Q.evenFlat.zero and RT4Q.homologicalEven.zero. -/
example (R : E1Ring) : IsEvenFlat (LMod.zero R) ∧ IsHomologicallyEven (LMod.zero R) := sorry
/-- Discrete ring module construction (H.5 spectral model comparison). -/
def LMod.em (R : Type) [Ring R] (M : Type) [AddCommGroup M] [Module R M] :
    LMod (E1Ring.ofRing R) := sorry
/-- Test RT4Q.evenFlat.torsion: odd Tor prevents flatness despite homological evenness. -/
example (p : ℕ) [Fact p.Prime] :
    IsHomologicallyEven (LMod.em ℤ (ZMod p)) ∧ ¬ IsEvenFlat (LMod.em ℤ (ZMod p)) := sorry
/-- Tests RT4Q.homologicalEven.unit and RT4Q.homologicalEven.not_pi_even. -/
example : IsHomologicallyEven (LMod.self E1Ring.sphere) ∧
    ¬ IsEvenSpectrum E1Ring.sphere.toSpectrum := sorry
/-- Test RT4Q.homologicalEven.discrete_even. -/
example {R : E1Ring} (M : LMod R) (h : IsEvenSpectrum M.underlying) :
    IsHomologicallyEven M := sorry
/-- Test RT4Q.faithfullyEvenFlat.identity. -/
example (R : E1Ring) : IsEvenFaithfullyFlat (𝟙 R) := sorry
/-- Tests RT4Q.faithfullyEvenFlat.polynomial / RT4Q.faithfullyEvenFlat.injection_insufficient. -/
def integralPolynomialMap : E1Ring.ofRing ℤ ⟶ E1Ring.ofRing ℤ[X] := sorry
def integralRationalMap : E1Ring.ofRing ℤ ⟶ E1Ring.ofRing ℚ := sorry
example : IsEvenFaithfullyFlat integralPolynomialMap := sorry
example : ¬ IsEvenFaithfullyFlat integralRationalMap := sorry
end RT4Q

namespace RT4Q

/-- Coherent filtered-spectrum category and Δ-shaped limit (EDS E0). -/
def FilSpectrum.coherentCategory : Coherent.InftyCategory := sorry
def FilSpectrum.totLimit
    (D : Coherent.Functor CosimplicialShape FilSpectrum.coherentCategory) : FilSpectrum := sorry

/-- The zero E_∞-ring. -/
def zeroInfty : EInftyRing := sorry

/-- `Σ^{2n}` of the weight-`n` row of the Adams–Novikov `E_2`-page,
`π_k = Ext^{2n−k, 2n}_{MU_*MU}(MU_*, MU_*)` (StableHomotopyKTheory). -/
def adamsNovikovGr (n : ℤ) : Spectrum := sorry

end RT4Q

/-- The even filtration `fil^⋆_ev E := lim_{E → B, B even} τ_{≥2⋆}B` of Hahn–Raksit–Wilson, the
right Kan extension of the double-speed Postnikov filtration from even E_∞-rings. -/
def evenFiltration (E : EInftyRing) : RT4Q.FilSpectrum := sorry

/-- Pstrągowski's perfect even filtration `fil^⋆_{P-ev/R} M` of a left `R`-module: double-speed
sheaf truncations of `Hom_R(−, M)` on perfect even `R`-modules with the even topology, evaluated
at `R`. -/
def perfectEvenFiltration (R : E1Ring) (M : RT4Q.LMod R) : RT4Q.FilSpectrum := sorry

/-- Fixed-base Čech diagram: in degree n, apply perfectEvenFiltration over R to the
R-module S^{⊗_R(n+1)}⊗_R M, retaining all cofaces and degeneracies (Theorem 6.26). -/
def RT4Q.perfectCechDiagram {R S : E1Ring} (f : R ⟶ S) (M : RT4Q.LMod R) :
    Coherent.Functor RT4Q.CosimplicialShape RT4Q.FilSpectrum.coherentCategory := sorry

/-- If either `R` or `M` is even, `fil^⋆_{P-ev/R} M = τ_{≥2⋆}M`.
Pstrągowski §§2.4–2.5 gives this comparison; no flatness hypothesis is needed here. -/
theorem perfectEvenFiltration.even (R : E1Ring) (M : RT4Q.LMod R)
    (h : RT4Q.IsEvenSpectrum R.toSpectrum ∨ RT4Q.IsEvenSpectrum M.underlying) :
    Nonempty (perfectEvenFiltration R M ≅ RT4Q.doubleSpeed M.underlying) := sorry

/-- Faithfully even flat descent after completion: completed `fil(M)` is the completed
Čech limit. The faithful condition uses right even flatness of S and its cofiber and
left homological evenness of the cofiber, as in Pstrągowski Definition 6.15. -/
theorem perfectEvenFiltration.descent {R S : E1Ring} (f : R ⟶ S)
    (hf : RT4Q.IsEvenFaithfullyFlat f) (M : RT4Q.LMod R) :
    Nonempty ((perfectEvenFiltration R M).completion ≅
      (RT4Q.FilSpectrum.totLimit (RT4Q.perfectCechDiagram f M)).completion) := sorry

/-- E₂ refinement of the ring map and its coherent algebra Čech nerve, supplied by H.5. -/
def RT4Q.E2CechRefinement {R S : E1Ring} (f : R ⟶ S) : Type := sorry
/-- Varying-ring Čech filtration, constructed only from the E₂ refinement. -/
def RT4Q.algebraCechDiagram {R S : E1Ring} (f : R ⟶ S)
    (h2 : RT4Q.E2CechRefinement f) (M : RT4Q.LMod R) :
    Coherent.Functor RT4Q.CosimplicialShape RT4Q.FilSpectrum.coherentCategory := sorry
/-- Pstrągowski Theorem 6.27: the varying-ring algebra form requires E₂ input. -/
theorem perfectEvenFiltration.algebraDescent {R S : E1Ring} (f : R ⟶ S)
    (h2 : RT4Q.E2CechRefinement f) (hf : RT4Q.IsEvenFaithfullyFlat f) (M : RT4Q.LMod R) :
    Nonempty ((perfectEvenFiltration R M).completion ≅
      (RT4Q.FilSpectrum.totLimit (RT4Q.algebraCechDiagram f h2 M)).completion) := sorry

/-- For E_∞-rings admitting a faithfully even flat map to an even E_∞-ring, the
perfect even filtration agrees with HRW's after completion. The map, actual faithful condition, and even target
are explicit hypotheses. -/
theorem perfectEvenFiltration.compare_HRW (E S : EInftyRing) (f : E.toE1 ⟶ S.toE1)
    (hf : RT4Q.IsEvenFaithfullyFlat f) (hS : RT4Q.IsEvenSpectrum S.toE1.toSpectrum) :
    Nonempty ((perfectEvenFiltration E.toE1 (RT4Q.LMod.self E.toE1)).completion ≅
      (evenFiltration E).completion) := sorry

/-- Pstrągowski's filtration is always exhaustive. -/
theorem perfectEvenFiltration.exhaustive (R : E1Ring) (M : RT4Q.LMod R) :
    (perfectEvenFiltration R M).IsExhaustiveFor M.underlying := sorry

/-- Test `evenFiltration.even_ring` (computation): `fil^⋆_ev ku = τ_{≥2⋆}ku`, with
`gr^n = Σ^{2n} H(π_{2n} ku)`. -/
example : Nonempty (evenFiltration ku ≅ RT4Q.doubleSpeed (RT4Q.sp ku)) ∧
    ∀ n : ℤ, Nonempty ((evenFiltration ku).gr n ≅
      (Spectrum.em ((RT4Q.sp ku).homotopyGroup (2 * n))).shift (2 * n)) := sorry

/-- Test `evenFiltration.zero` (degenerate): the even filtration of `0` is `0`. -/
example : Nonempty (evenFiltration RT4Q.zeroInfty ≅ RT4Q.FilSpectrum.zero) := sorry

/-- Test `evenFiltration.not_postnikov` (non-example): for `E = S` the even filtration is not the
double-speed Postnikov filtration; it is the décalé Adams–Novikov filtration, whose associated
graded is the Adams–Novikov `E_2`-page. -/
example : ¬ Nonempty (evenFiltration RT4Q.sphereInfty ≅ RT4Q.doubleSpeed (RT4Q.sp RT4Q.sphereInfty)) ∧
    ∀ n : ℤ, Nonempty ((evenFiltration RT4Q.sphereInfty).gr n ≅ RT4Q.adamsNovikovGr n) := sorry

/-! ### RT.4:q-Hodge/solid-even-filtration -/

namespace RT4Q

/-- Filtered solid spectra `Fun(ℤ^op, Sp_■)`. -/
def FilSolid : Type := sorry

instance : Category.{0} FilSolid := sorry

/-- The underlying filtered spectrum (value at the point). -/
def FilSolid.underlying (X : FilSolid) : FilSpectrum := sorry

/-- The zero filtered solid spectrum. -/
def FilSolid.zero : FilSolid := sorry

/-- The completion of a filtered solid spectrum. -/
def FilSolid.completion (X : FilSolid) : FilSolid := sorry

/-- The Day convolution tensor product of filtered solid spectra. -/
def FilSolid.tensor (X Y : FilSolid) : FilSolid := sorry

/-- The cosimplicial limit `lim_Δ X^•` (coface maps left implicit). -/
def FilSolid.coherentCategory : Coherent.InftyCategory := sorry
def FilSolid.totLimit
    (D : Coherent.Functor CosimplicialShape FilSolid.coherentCategory) : FilSolid := sorry

/-- The double-speed Postnikov filtration `τ_{≥2⋆}M` of a solid spectrum. -/
def solidDoubleSpeed (M : SolidSpectrum) : FilSolid := sorry

/-- The underlying spectrum (value at the point) of a solid spectrum. -/
def solidEval (M : SolidSpectrum) : Spectrum := sorry

/-- The zero module. -/
def SolidMod.zero (R : SolidRing) : SolidMod R := sorry

/-- The `n`-fold shift of a solid module. -/
def SolidMod.shift {R : SolidRing} (M : SolidMod R) (n : ℤ) : SolidMod R := sorry

/-- `S` regarded as an `R`-module along `f : R → S`. -/
def SolidMod.ofRingMap {R S : SolidRing} (f : R ⟶ S) : SolidMod R := sorry

/-- A discrete E₁-ring as a solid ring. -/
def SolidRing.ofE1 (R : E1Ring) : SolidRing := sorry

/-- A discrete module as a solid module. -/
def SolidMod.ofLMod {R : E1Ring} (M : LMod R) : SolidMod (SolidRing.ofE1 R) := sorry

/-- The `p`-completion of an E₁-ring as a solid ring (`R^∧_p ∈ Sp_■`). -/
def SolidRing.ofPComplete (p : ℕ) (R : E1Ring) : SolidRing := sorry

/-- The solid sphere as a solid ring. -/
def SolidRing.sphere : SolidRing := sorry
instance : SolidRing.Commutative SolidRing.sphere := sorry


/-- The underlying solid spectrum of a solid ring. -/
def SolidRing.underlying (R : SolidRing) : SolidSpectrum := sorry

/-- The `n`-th term of the Čech nerve of a map of solid rings. -/
def solidCechRing {R S : SolidRing} (f : R ⟶ S) (n : ℕ) : SolidRing := sorry

/-- The unit map into the `n`-th Čech term. -/
def solidCechUnit {R S : SolidRing} (f : R ⟶ S) (n : ℕ) : R ⟶ solidCechRing f n := sorry

/-- The map of underlying spectra induced by a map of solid rings. -/
def solidRingMapEval {R S : SolidRing} (f : R ⟶ S) :
    solidEval R.underlying ⟶ solidEval S.underlying := sorry

/-- `Null_R := R ⊗^■ Null^■`. -/
def nullMod (R : SolidRing) : SolidMod R := sorry

/-- Solid perfect even `R`-modules `Perf_ev(R_■)`: the smallest class containing the
`Σ^{2n} Null_R` and closed under equivalences, extensions, and retracts. -/
def IsSolidPerfectEven {R : SolidRing} (M : SolidMod R) : Prop :=
  ∀ P : SolidMod R → Prop,
    (∀ n : ℤ, P ((nullMod R).shift (2 * n))) →
    (∀ N N' : SolidMod R, Nonempty (N ≅ N') → P N → P N') →
    (∀ (N N' : SolidMod R) (f : N ⟶ N'), P N → P (SolidMod.cofib f) → P N') →
    (∀ (N N' : SolidMod R) (i : N ⟶ N') (r : N' ⟶ N), i ≫ r = 𝟙 N → P N' → P N) →
    P M

/-- Coherent solid module category, supplied by the light spectral interface. -/
def SolidMod.coherentCategory (R : SolidRing) : Coherent.InftyCategory := sorry
def SolidMod.fromCoherent {R : SolidRing} :
    Coherent.Obj (SolidMod.coherentCategory R) → SolidMod R := sorry
def SolidColimit {J : Coherent.InftyCategory} {R : SolidRing}
    (D : Coherent.Functor J (SolidMod.coherentCategory R)) : SolidMod R := sorry

structure SolidEvenPresentation {R : SolidRing} (M : SolidMod R) where
  index : Coherent.InftyCategory
  filtered : FilteredShape index
  diagram : Coherent.Functor index (SolidMod.coherentCategory R)
  perfect : ∀ j : Coherent.Obj index, IsSolidPerfectEven (SolidMod.fromCoherent (diagram.obj j))
  comparison : Nonempty (SolidColimit diagram ≅ M)

def IsSolidIndPerfectEven {R : SolidRing} (M : SolidMod R) : Prop :=
  Nonempty (SolidEvenPresentation M)

/-- Condensed homotopy is light condensed abelian-group valued, using the pinned carrier. -/
def condensedHomotopy (M : SolidSpectrum) (j : ℤ) : LightCondAb := sorry

def IsCondensedHomotopyEvenSpectrum (M : SolidSpectrum) : Prop :=
  ∀ j : ℤ, Odd j → Limits.IsZero (condensedHomotopy M j)
def IsCondensedHomotopyEven {R : SolidRing} (M : SolidMod R) : Prop :=
  IsCondensedHomotopyEvenSpectrum M.underlying

def IsSolidEvenFlat {R : SolidRing} (M : SolidMod R) : Prop :=
  ∀ E : SolidMod R.op, IsCondensedHomotopyEven E →
    IsCondensedHomotopyEvenSpectrum (SolidMod.relativeTensor E M)

def SolidEvenSite (R : SolidRing) : Coherent.InftyCategory := sorry
def SolidEvenSheaf (R : SolidRing) : Type := sorry
instance (R : SolidRing) : Category.{0} (SolidEvenSheaf R) := sorry
instance (R : SolidRing) : Limits.HasZeroObject (SolidEvenSheaf R) := sorry
/-- Sheafification of condensed mapping homotopy on the solid even site. -/
def solidEvenHomotopySheaf {R : SolidRing} (M : SolidMod R) (j : ℤ) : SolidEvenSheaf R := sorry

def IsSolidHomologicallyEven {R : SolidRing} (M : SolidMod R) : Prop :=
  ∀ j : ℤ, Odd j → Limits.IsZero (solidEvenHomotopySheaf M j)

/-- Both S and the cofiber with their opposite-side module structures. -/
def solidMapRightModule {R S : SolidRing} (f : R ⟶ S) : SolidMod R.op := sorry
def solidMapCofiberLeft {R S : SolidRing} (f : R ⟶ S) : SolidMod R := sorry
def solidMapCofiberRight {R S : SolidRing} (f : R ⟶ S) : SolidMod R.op := sorry

def IsSolidEvenFaithfullyFlat {R S : SolidRing} (f : R ⟶ S) : Prop :=
  IsSolidEvenFlat (SolidMod.ofRingMap f) ∧ IsSolidEvenFlat (solidMapRightModule f) ∧
    IsSolidEvenFlat (solidMapCofiberLeft f) ∧ IsSolidEvenFlat (solidMapCofiberRight f)

/-- The dual of Null_R as a bimodule, viewed separately on both sides. -/
def nullDualLeft (R : SolidRing) : SolidMod R := sorry
def nullDualRight (R : SolidRing) : SolidMod R.op := sorry

structure AssumptionR (R : SolidRing) : Prop where
  leftNuclear : Nuclear (nullDualLeft R)
  rightNuclear : Nuclear (nullDualRight R)
  leftIndPerfect : IsSolidIndPerfectEven (nullDualLeft R)
  rightIndPerfect : IsSolidIndPerfectEven (nullDualRight R)

theorem AssumptionR.discrete (R : E1Ring) (h : R.toSpectrum.IsBoundedBelow) :
    AssumptionR (SolidRing.ofE1 R) := sorry
theorem AssumptionR.pComplete (R : E1Ring) (h : R.toSpectrum.IsBoundedBelow)
    (p : ℕ) [Fact p.Prime] : AssumptionR (SolidRing.ofPComplete p R) := sorry

theorem solidIndPerfectEven_to_flat {R : SolidRing} (M : SolidMod R)
    (h : IsSolidIndPerfectEven M) : IsSolidEvenFlat M := sorry
/-- Conditional converse, not an unconditional solid Lazard theorem. -/
theorem solidEvenFlat_to_indPerfect {R : SolidRing} (M : SolidMod R)
    (hR : AssumptionR R) (hM : Nuclear M) (hf : IsSolidEvenFlat M) :
    IsSolidIndPerfectEven M := sorry

/-- Tests perfectEven.unit and perfectEven.retract for the solid site. -/
example (R : SolidRing) : IsSolidPerfectEven (nullMod R) := sorry
example {R : SolidRing} (M N : SolidMod R) (i : M ⟶ N) (r : N ⟶ M)
    (h : i ≫ r = 𝟙 M) (hN : IsSolidPerfectEven N) : IsSolidPerfectEven M := sorry
/-- Test faithfullyEvenFlat.identity (solid). -/
example (R : SolidRing) : IsSolidEvenFaithfullyFlat (𝟙 R) := sorry
/-- Tests RT4Q.assumptionR.discrete_Z / RT4Q.assumptionR.pComplete_Z. -/
example : AssumptionR (SolidRing.ofE1 (E1Ring.ofRing ℤ)) := sorry
example (p : ℕ) [Fact p.Prime] : AssumptionR (SolidRing.ofPComplete p (E1Ring.ofRing ℤ)) := sorry
/-- Test RT4Q.assumptionR.not_one_sided: extracting R requires all four fields. -/
example {R : SolidRing} (h : AssumptionR R) :
    Nuclear (nullDualRight R) ∧ IsSolidIndPerfectEven (nullDualRight R) := sorry
/-- Test RT4Q.solidEvenFlat.no_unconditional_converse: all required input data remain. -/
example {R : SolidRing} (M : SolidMod R) (hR : AssumptionR R) (hM : Nuclear M)
    (hf : IsSolidEvenFlat M) : IsSolidIndPerfectEven M := sorry

end RT4Q

/-- The solid even filtration `fil^⋆_{ev/R} M` in filtered solid spectra: the double-speed sheaf
truncations of `Hom_R(−, M)` on `Perf_ev(R_■)` (generated by `Σ^{2n} Null_R`; covers the maps
with solid perfect even fibre), evaluated at `R`. -/
def solidEvenFiltration (R : RT4Q.SolidRing) (M : RT4Q.SolidMod R) : RT4Q.FilSolid := sorry

open MonoidalCategory in
/-- The lax monoidal structure maps `fil_{ev/R} M ⊗ fil_{ev/R} N → fil_{ev/R}(M ⊗_R N)`
(Wagner 2.5). -/
def solidEvenFiltration.laxMonoidal (R : RT4Q.SolidRing) [RT4Q.SolidRing.Commutative R] (M N : RT4Q.SolidMod R) :
    RT4Q.FilSolid.tensor (solidEvenFiltration R M) (solidEvenFiltration R N) ⟶
      solidEvenFiltration R (M ⊗ N) := sorry

/-- If the condensed homotopy sheaves of M vanish in odd degrees,
`fil^⋆_{ev/R} M ≃ τ_{≥2⋆} M` (Wagner 2.4). The signature uses condensed sheaf vanishing;
even homotopy after evaluation at a point does not supply it.
Homological evenness alone does not assert the Whitehead-tower identification. -/
theorem solidEvenFiltration.even (R : RT4Q.SolidRing) (M : RT4Q.SolidMod R)
    (hM : RT4Q.IsCondensedHomotopyEven M) :
    Nonempty (solidEvenFiltration R M ≅ RT4Q.solidDoubleSpeed M.underlying) := sorry

/-- On discrete homologically even inputs the solid even filtration agrees with Pstrągowski's
(Wagner Corollary 2.17); the displayed discrete homotopy-evenness assumptions imply
discrete homological evenness by Pstrągowski Lemma 2.36. The general homologically
even comparison is not yet expressed by this restricted signature. -/
theorem solidEvenFiltration.compare_pstragowski (R : E1Ring) (M : RT4Q.LMod R)
    (hR : RT4Q.IsEvenSpectrum R.toSpectrum) (hM : RT4Q.IsEvenSpectrum M.underlying) :
    Nonempty ((solidEvenFiltration (RT4Q.SolidRing.ofE1 R) (RT4Q.SolidMod.ofLMod M)).underlying ≅
      perfectEvenFiltration R M) := sorry

/-- Fixed-base solid Čech diagram: filter each derived tensor term as an R-module,
retaining the coherent cofaces and degeneracies (Wagner Theorem 2.19). -/
def RT4Q.solidCechDiagram {R S : RT4Q.SolidRing} (f : R ⟶ S) (M : RT4Q.SolidMod R) :
    Coherent.Functor RT4Q.CosimplicialShape RT4Q.FilSolid.coherentCategory := sorry

/-- Solid faithfully even flat descent for nuclear `S` over `R`, up to completion (Wagner
Theorem 2.19). Assumption R, nuclearity of S and M, solid homological evenness of M,
and both-sided solid faithful even flatness are explicit hypotheses. -/
theorem solidEvenFiltration.descent {R S : RT4Q.SolidRing} (f : R ⟶ S)
    (hR : RT4Q.AssumptionR R)
    (hS : Nuclear (RT4Q.SolidMod.ofRingMap f)) (hf : RT4Q.IsSolidEvenFaithfullyFlat f)
    (M : RT4Q.SolidMod R) (hM : Nuclear M) (he : RT4Q.IsSolidHomologicallyEven M) :
    Nonempty ((solidEvenFiltration R M).completion ≅
      (RT4Q.FilSolid.totLimit (RT4Q.solidCechDiagram f M)).completion) := sorry

/-- Test `solidEvenFiltration.even_ring` (computation): `fil^⋆_ev(ku^∧_p) = τ_{≥2⋆} ku^∧_p`. -/
example (p : ℕ) [Fact p.Prime] :
    Nonempty (solidEvenFiltration (RT4Q.SolidRing.ofPComplete p ku.toE1)
        (RT4Q.SolidMod.self _) ≅
      RT4Q.solidDoubleSpeed ((SolidSpectrum.ofPComplete p).obj (RT4Q.sp ku))) := sorry

/-- Test `solidEvenFiltration.zero` (degenerate): `fil_ev(0) = 0`. -/
example (R : RT4Q.SolidRing) :
    Nonempty (solidEvenFiltration R (RT4Q.SolidMod.zero R) ≅ RT4Q.FilSolid.zero) := sorry

open MonoidalCategory in
/-- Test `solidEvenFiltration.not_perfect_dual` (non-example): `Perf_ev(R_■)` is not closed under
duals: `Hom_S(Null_S, S) ≃ ⊕_ℕ S` is not solid perfect even (Wagner 2.3). -/
example :
    Nonempty (RT4Q.SolidMod.ihom (RT4Q.nullMod RT4Q.SolidRing.sphere)
        (𝟙_ (RT4Q.SolidMod RT4Q.SolidRing.sphere)) ≅
      RT4Q.SolidMod.underlying (RT4Q.SolidMod.sum (fun _ : ℕ =>
        𝟙_ (RT4Q.SolidMod RT4Q.SolidRing.sphere)))) ∧
    ¬ RT4Q.IsSolidPerfectEven (RT4Q.nullDualLeft RT4Q.SolidRing.sphere) := sorry


/-! ### RT.4:q-Hodge/even-circle-fixed-points -/

namespace RT4Q

/-- Even-filtered `T_ev`-modules, `T_ev := fil^⋆_ev S[S¹]` (modules over the even-filtered
spherical group ring of the circle; Antieau–Riggenbach §2.3, after Raksit). -/
def EvFilTMod : Type := sorry

instance : Category.{0} EvFilTMod := sorry

/-- The underlying filtered spectrum. -/
def EvFilTMod.underlying (X : EvFilTMod) : FilSpectrum := sorry

/-- The underlying spectrum `colim_n fil^n X` with its circle action. -/
def EvFilTMod.toTSpectrum (X : EvFilTMod) : SpectraWithAction T := sorry

/-- The zero module. -/
def EvFilTMod.zero : EvFilTMod := sorry

/-- `fil^⋆_ev E` with the trivial `T_ev`-action (through the augmentation `T_ev → S_ev`). -/
def EvFilTMod.trivial (E : EInftyRing) : EvFilTMod := sorry

/-- The naive construction: `(fil^n X)^{hT}` formed degreewise in `Fun(ℤ^op, Sp)`, ignoring
`T_ev`. -/
def naiveFixedPoints (X : EvFilTMod) : FilSpectrum := sorry

/-- The degree-`i` part `(q−1)^i Λ[[q−1]]` (`(q−1)^i := 1` for `i ≤ 0`) of the Rees algebra of the
`(q−1)`-adic filtration, `≅ Λ[β][[t]]` with `q − 1 = βt`; here `q − 1` is the power series
variable. -/
abbrev reesPiece (Λ : Type) [CommRing Λ] (i : ℤ) : Type :=
  ↥((Ideal.span {(PowerSeries.X : PowerSeries Λ)}) ^ i.toNat)

end RT4Q

/-- Filtered homotopy fixed points `X^{hT_ev} := Hom^⋆_{T_ev}(S_ev, X)` of an even-filtered
`T_ev`-module; `fil^⋆_{ev,hS¹}TC⁻ := (fil^⋆_ev THH)^{hT_ev}`. -/
def evenCircleFixedPoints (X : RT4Q.EvFilTMod) : RT4Q.FilSpectrum := sorry

/-- The filtered Tate construction `X^{tT_ev}`; `fil^⋆_{ev,tS¹}TP := (fil^⋆_ev THH)^{tT_ev}`. -/
def evenCircleTate (X : RT4Q.EvFilTMod) : RT4Q.FilSpectrum := sorry

namespace RT4Q
/-- Canonical stage inclusion into the colimit underlying spectrum (E0/H.5). -/
def EvFilTMod.stageMap (X : EvFilTMod) (i : ℤ) :
    X.underlying.fil i ⟶ X.toTSpectrum.underlying := sorry
def EvFilTMod.UniformTruncationBounds (X : EvFilTMod) : Prop :=
  ∀ (i j : ℤ), i<j → Subsingleton ((Spectrum.fib (X.stageMap i)).homotopyGroup j)
end RT4Q

/-- Under AR24 Lemma 2.75(iv) uniform stage truncation bounds, the underlying object of the completion of `X^{hT_ev}` is
`(underlying X)^{hT}`. -/
theorem evenCircleFixedPoints.underlying (X : RT4Q.EvFilTMod) (hc : X.underlying.IsComplete)
    (he : X.underlying.IsExhaustiveFor X.toTSpectrum.underlying)
    (htr : X.UniformTruncationBounds) :
    (evenCircleFixedPoints X).completion.IsExhaustiveFor (homotopyFixedPoints X.toTSpectrum) :=
  sorry

/-- `Σ^{−2i} gr^i (ku_ev^{hT_ev}) ≅ ℤ[β][[t]]_i ≅ (q−1)^i ℤ[[q−1]]`, the Rees algebra of the
`(q−1)`-adic filtration. -/
theorem evenCircleFixedPoints.graded (i : ℤ) :
    Nonempty ((evenCircleFixedPoints (RT4Q.EvFilTMod.trivial ku)).grShift i ≅
      Spectrum.em (RT4Q.reesPiece ℤ i)) := sorry

/-- Test `evenCircleFixedPoints.ku` (computation): `π_*(ku^{hT}) ≅ ℤ[β][[t]]` for the trivial
action (even, with `π_{2i} ≅ (q−1)^i ℤ[[q−1]]`). -/
example : RT4Q.IsEvenSpectrum (homotopyFixedPoints (SpectraWithAction.trivial T (RT4Q.sp ku))) ∧
    ∀ i : ℤ, Nonempty ((homotopyFixedPoints (SpectraWithAction.trivial T (RT4Q.sp ku))).homotopyGroup
      (2 * i) ≃+ RT4Q.reesPiece ℤ i) := sorry

/-- Test `evenCircleFixedPoints.zero` (degenerate): `0^{hT_ev} = 0`. -/
example : Nonempty (evenCircleFixedPoints RT4Q.EvFilTMod.zero ≅ RT4Q.FilSpectrum.zero) := sorry

/-- Test `evenCircleFixedPoints.not_naive` (non-example): forming `(fil_ev X)^{hT}` degreewise without
`T_ev` gives the wrong answer (already for `ku`, where the naive graded pieces are not discrete). -/
example : ¬ Nonempty (evenCircleFixedPoints (RT4Q.EvFilTMod.trivial ku) ≅
    RT4Q.naiveFixedPoints (RT4Q.EvFilTMod.trivial ku)) := sorry

/-! ### RT.4:q-Hodge/solid-thh-even-filtration -/

namespace RT4Q

/-- The structure map `k ⊗ S_A → k ⊗ S_R` induced by `S_A → S_R`. -/
def smashRelMap (k SA : EInftyRing) (SR : E1Ring) (f : SA.toE1 ⟶ SR) :
    (smashInfty k SA).toE1 ⟶ E1Ring.smash k.toE1 SR := sorry

/-- Solid relative THH, `THH_■(k_R/k_A)` with `k_A := k ⊗^■ S_A`, `k_R := k ⊗^■ S_R`. -/
def solidTHH (k SA : EInftyRing) (SR : E1Ring) (f : SA.toE1 ⟶ SR) : SolidSpectrum := sorry

/-- The even filtration `fil^⋆_ev THH_■(k_R/k_A)` (the solid even filtration for E₂-lifts). -/
def solidEvenTHH (k SA : EInftyRing) (SR : E1Ring) (f : SA.toE1 ⟶ SR) : FilSolid := sorry

/-- `THH(k_R/k_A)` as an E₁-ring (for an E₂-lift `S_R`). -/
def thhAsE1 (k SA : EInftyRing) (SR : E1Ring) (f : SA.toE1 ⟶ SR) : E1Ring := sorry

/-- Base change of filtered solid modules along `k → l`: `X ⊗_{fil_ev k} fil_ev l`. -/
def FilSolid.baseChange {k l : EInftyRing} (g : k ⟶ l) (X : FilSolid) : FilSolid := sorry

/-- Hochschild homology `HH(R/A)` as an E_∞-ring (RT.1/hochschild-homology). -/
def hhRing (A R : Type) [CommRing A] [CommRing R] [Algebra A R] : EInftyRing := sorry

end RT4Q

/-- Discrete condensed models with their identified p-completions, as in Wagner Lemma 3.7.
The witness includes k=(k°)^∧_p and T=(T°)^∧_p in solid spectra. -/
def RT4Q.DiscretePCompleteModels (p : ℕ) (k : EInftyRing) (T : E1Ring) : Type := sorry

/-- Even filtrations on solid relative THH (Wagner §3). Let `k` be a connective even E_∞-ring
with `π_{2∗}k` `p`-torsion free, `(A, S_A)` a `p`-cyclotomic base and `S_R` an E₂-lift of `R`.
Then (i) `THH_■(k_R/k_A)` is the `p`-completed relative THH (Lemma 3.7); (ii) its even filtration
is complete and exhaustive (Corollary 3.14); (iii) it satisfies base change along `k → l`
(Corollaries 3.17–3.19); (iv) for `k = ℤ` it is the `p`-completion of HRW's filtration on
`HH(R/A)` (Corollary 3.21) and in general it is the `p`-completion of Pstrągowski's filtration
(Corollary 3.24). Not recorded: the cosimplicial formula (Proposition 3.11), the bifiltration
with HKR graded pieces (Corollary 3.15), the comparisons on `HC⁻` and `HP`, and the case (E₁),
where the filtration is `lim_Δ τ_{≥2⋆}` over the even resolution. -/
theorem solidThhEvenFiltration (p : ℕ) [Fact p.Prime] (A R : Type) [CommRing A] [CommRing R]
    [Algebra A R] (B : CyclotomicBase p A) (L : SphericalLift B.lift R 2) (k : EInftyRing)
    (hmodels : RT4Q.DiscretePCompleteModels p k L.ring.toE1)
    (hk : RT4Q.IsConnectiveInfty k) (hke : RT4Q.IsEvenSpectrum (RT4Q.sp k))
    (hkp : ∀ (n : ℤ) (x : (RT4Q.sp k).homotopyGroup (2 * n)), (p : ℤ) • x = 0 → x = 0) :
    Nonempty (RT4Q.solidTHH k B.lift L.ring.toE1 L.structureMap ≅
      (SolidSpectrum.ofPComplete p).obj (THH.relative (RT4Q.smashInfty k B.lift)
        (E1Ring.smash k.toE1 L.ring.toE1)
        (RT4Q.smashRelMap k B.lift L.ring.toE1 L.structureMap)).underlying) ∧
    (RT4Q.solidEvenTHH k B.lift L.ring.toE1 L.structureMap).underlying.IsComplete ∧
    (RT4Q.solidEvenTHH k B.lift L.ring.toE1 L.structureMap).underlying.IsExhaustiveFor
      (RT4Q.solidEval (RT4Q.solidTHH k B.lift L.ring.toE1 L.structureMap)) ∧
    (∀ (l : EInftyRing) (g : k ⟶ l), RT4Q.IsConnectiveInfty l → RT4Q.IsEvenSpectrum (RT4Q.sp l) →
      Nonempty (RT4Q.solidEvenTHH l B.lift L.ring.toE1 L.structureMap ≅
        RT4Q.FilSolid.baseChange g (RT4Q.solidEvenTHH k B.lift L.ring.toE1 L.structureMap))) ∧
    Nonempty ((RT4Q.solidEvenTHH (EInftyRing.ofCommRing ℤ) B.lift L.ring.toE1
        L.structureMap).underlying ≅
      RT4Q.FilSpectrum.pCompletion p (evenFiltration (RT4Q.hhRing A R))) ∧
    Nonempty ((RT4Q.solidEvenTHH k B.lift L.ring.toE1 L.structureMap).underlying ≅
      RT4Q.FilSpectrum.pCompletion p (perfectEvenFiltration
        (RT4Q.thhAsE1 k B.lift L.ring.toE1 L.structureMap) (RT4Q.LMod.self _))) := sorry

/-! ### RT.4:q-Hodge/image-of-j -/

namespace RT4Q

/-- The E₁-map underlying a map of E_∞-rings. -/
def toE1Map {A B : EInftyRing} (f : A ⟶ B) : A.toE1 ⟶ B.toE1 := sorry

/-- The class `β_1 ∈ π_{2p²−2p−2} S^∧_p` in the cokernel of `J` (StableHomotopyKTheory). -/
def beta1 (p : ℕ) : (sp (sphereP p)).homotopyGroup (2 * (p : ℤ) ^ 2 - 2 * p - 2) := sorry

/-- The unit `S_p → j`. -/
def unitToJ (p : ℕ) (j : EInftyRing) : sphereP p ⟶ j := sorry

end RT4Q

/-- The connective image-of-J spectrum `j := τ_{≥0} S_{K(1)}` at `p`, an E_∞-ring (at odd `p`, the
connective cover of `KU_p^{h(𝔽_p^××ℤ)}`, with the principal-unit Adams action;
the connective Adams-summand fiber description has shift `2p−2`). -/
def imageOfJ (p : ℕ) [Fact p.Prime] : EInftyRing := sorry

/-- The E_∞-map `j → ku_p` (unit of the Adams summand). -/
def imageOfJ.toKu (p : ℕ) [Fact p.Prime] : imageOfJ p ⟶ RT4Q.pCompleteInfty p ku := sorry

/-- `π_0 j = ℤ_p`. -/
theorem imageOfJ.pi0 (p : ℕ) [Fact p.Prime] : Nonempty ((imageOfJ p).toE1.pi0 ≃+* ℤ_[p]) := sorry

/-- Devalapurkar's variant `j_{p,0}` (thesis Notation 6.2.8), an E_∞-ring. -/
def imageOfJ.variant (p : ℕ) [Fact p.Prime] : EInftyRing := sorry

/-- Test `imageOfJ.pi0_test` (computation): `π_0 j = ℤ_p`. -/
example (p : ℕ) [Fact p.Prime] : Nonempty ((imageOfJ p).toE1.pi0 ≃+* ℤ_[p]) := sorry

/-- Test `imageOfJ.connective` (degenerate): `π_n j = 0` for `n < 0`. -/
example (p : ℕ) [Fact p.Prime] (n : ℤ) (hn : n < 0) :
    Subsingleton ((RT4Q.sp (imageOfJ p)).homotopyGroup n) := sorry

/-- Test `imageOfJ.not_sphere` (non-example): `j ≠ S^∧_p` for `p` odd: `β_1 ≠ 0` in
`π_{2p²−2p−2} S^∧_p` maps to zero in `π_* j`. -/
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) :
    ¬ Nonempty (imageOfJ p ≅ RT4Q.sphereP p) ∧ RT4Q.beta1 p ≠ 0 ∧
      Spectrum.homotopyGroupMap (E1Ring.toSpectrumMap (RT4Q.toE1Map (RT4Q.unitToJ p (imageOfJ p))))
        _ (RT4Q.beta1 p) = 0 := sorry

/-! ### RT.4:q-Hodge/devalapurkar-raksit-thh, devalapurkar-comparison,
nikolaus-e1-equivalence -/

namespace RT4Q

/-- Levelwise `p`-completion of a `T`-spectrum. -/
def pCompleteT (p : ℕ) (X : SpectraWithAction T) : SpectraWithAction T := sorry

/-- The connective cover of a `T`-spectrum. -/
def connCoverT (X : SpectraWithAction T) : SpectraWithAction T := sorry

/-- `S_p[[q − 1]]` as an E_∞-ring. -/
def sphereQ (p : ℕ) : EInftyRing := sorry

/-- `ℤ_p[ζ_p] = ℤ_p[q]/Φ_p(q)`. -/
abbrev zetaRing (p : ℕ) [Fact p.Prime] : Type := AdjoinRoot (cyclotomic p ℤ_[p])

/-- The structure map `S_p[[q−1]] → ℤ_p[ζ_p]`, `q ↦ ζ_p`. -/
def qToZeta (p : ℕ) [Fact p.Prime] : (sphereQ p).toE1 ⟶ E1Ring.ofRing (zetaRing p) := sorry

/-- `THH(ℤ_p[ζ_p]/S_p[[q−1]])^∧_p` with its circle action. -/
def thhZeta (p : ℕ) [Fact p.Prime] : SpectraWithAction T :=
  pCompleteT p (THH.relative (sphereQ p) (E1Ring.ofRing (zetaRing p)) (qToZeta p))

/-- `THH(ℤ_p[ζ_p]/S_p[[q−1]])^∧_p` as an E_∞-ring (`S¹ × ℤ_p^×`-equivariance not recorded). -/
def thhZetaInfty (p : ℕ) [Fact p.Prime] : EInftyRing := sorry

/-- `τ_{≥0}(ku_p^{tC_p})` as an E_∞-ring (`S¹ × ℤ_p^×`-equivariance not recorded). -/
def kuTateConnInfty (p : ℕ) [Fact p.Prime] : EInftyRing := sorry

/-- `τ_{≥0}(ku_p^{tC_p})` with its residual `S¹ ≃ S¹/C_p`-action. -/
def kuTateConn (p : ℕ) [Fact p.Prime] : SpectraWithAction T :=
  connCoverT (residualTate p (SpectraWithAction.trivial T (sp (pCompleteInfty p ku))))

end RT4Q

/-- Devalapurkar–Raksit: for `p` odd, `THH(ℤ_p)^∧_p ≃ τ_{≥0}(j^{tC_p})` as `S¹`-spectra (and as
cyclotomic E_∞-rings, not recorded), compatibly with `THH(𝔽_p) ≃ τ_{≥0}(ℤ_p^{tC_p})`; the
analogous statement fails at `p = 2`. The compatibility with `j → THH(ℤ_p)^∧_p` is not recorded. -/
theorem devalapurkarRaksitThh (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) :
    Nonempty (RT4Q.pCompleteT p (THH.ofRing ℤ_[p]) ≅
      RT4Q.connCoverT (residualTate p (SpectraWithAction.trivial T (RT4Q.sp (imageOfJ p))))) ∧
    Nonempty (THH.ofRing (ZMod p) ≅
      RT4Q.connCoverT (residualTate p (SpectraWithAction.trivial T (Spectrum.em ℤ_[p])))) ∧
    ¬ Nonempty (RT4Q.pCompleteT 2 (THH.ofRing ℤ_[2]) ≅
      RT4Q.connCoverT (residualTate 2 (SpectraWithAction.trivial T (RT4Q.sp (imageOfJ 2))))) :=
  sorry

/-- Devalapurkar's comparison (Wagner Theorem 4.1, thesis Theorem 6.4.1): for `p > 2`,
`THH(ℤ_p[ζ_p]/S_p[[q−1]])^∧_p ≃ τ_{≥0}(ku_p^{tC_p})` as E_∞-rings and as `S¹`-spectra (`S¹` acting on
`ku^{tC_p}` through `S¹ ≃ S¹/C_p`). Not recorded: the `ℤ_p^×`-equivariance (Adams operations),
the `S_p[[q−1]]`-algebra structure with `q ↦ q`, and the compatibility with `THH(𝔽_p)`. -/
theorem devalapurkarComparison (p : ℕ) [Fact p.Prime] (hp : 2 < p) :
    Nonempty (RT4Q.thhZetaInfty p ≅ RT4Q.kuTateConnInfty p) ∧
    Nonempty (RT4Q.thhZeta p ≅ RT4Q.kuTateConn p) := sorry

/-- Nikolaus (Wagner Theorem 4.16): for every prime `p`, including `p = 2`,
`THH(ℤ_p[ζ_p]/S_p[[q−1]])^∧_p ≃ τ_{≥0}(ku_p^{tC_p})` as `S¹`-spectra and as E₁-rings. At p = 2, an E_∞ refinement is not known here. -/
theorem nikolausE1Equivalence (p : ℕ) [Fact p.Prime] :
    Nonempty ((RT4Q.thhZetaInfty p).toE1 ≅ (RT4Q.kuTateConnInfty p).toE1) ∧
    Nonempty (RT4Q.thhZeta p ≅ RT4Q.kuTateConn p) := sorry


/-! ### RT.4:q-Hodge/q-hodge-comparison-map -/

namespace RT4Q

/-- The constant filtration `fil^n = M` for all `n`. -/
def constFil (M : Spectrum) : FilSpectrum := sorry

/-- The map of constant filtrations induced by a map of spectra. -/
def constFilMap {M N : Spectrum} (f : M ⟶ N) : constFil M ⟶ constFil N := sorry

/-- The even regrading `Σ^{−2∗}gr^∗ X` regarded as a filtered spectrum: `fil^i = Σ^{−2i} gr^i X`
with transition maps given by `t` (graded `ℤ[t]`-modules are filtered objects). -/
def evenRegraded (X : FilSpectrum) : FilSpectrum := sorry

/-- The maps `t^i : Σ^{−2i} gr^i X → gr^0 X` assembled into a map of filtered spectra. -/
def evenRegradedToGr0 (X : FilSpectrum) : evenRegraded X ⟶ constFil (X.gr 0) := sorry

/-- The map from the combined filtration to the constant filtration on `dR_{R/A}[1/p][[q−1]]`. -/
def hodgeQToConst (p : ℕ) (A R : Type) [CommRing A] [CommRing R] [Algebra A R] :
    hodgeQFiltrationP p A R ⟶ constFil (rationalDeRhamQ p A R) := sorry

/-- The local even filtration `fil^⋆_ev THH_■(ku_R/ku_A)` (`p`-complete, solid) as an
even-filtered `T_ev`-module. -/
def localThhEven (p : ℕ) (SA : EInftyRing) (SR : E1Ring) (f : SA.toE1 ⟶ SR) : EvFilTMod := sorry

/-- `fil^⋆_{ev,hS¹}TC⁻_■(ku_R/ku_A) := (fil^⋆_ev THH_■(ku_R/ku_A))^{hT_ev}`. -/
def localTCminusEven (p : ℕ) (SA : EInftyRing) (SR : E1Ring) (f : SA.toE1 ⟶ SR) : FilSpectrum :=
  evenCircleFixedPoints (localThhEven p SA SR f)

/-- An abelian group homomorphism as a map of Eilenberg–Mac Lane spectra. -/
def emMap {M N : Type} [AddCommGroup M] [AddCommGroup N] (d : M →+ N) :
    Spectrum.em M ⟶ Spectrum.em N := sorry

/-- The q-derivative `∇_q : f ↦ (f(qx) − f(x))/(qx − x)`, from `(q−1)^i Λ[x][[q−1]]` to
`(q−1)^{i−1} Λ[x][[q−1]]` (the coefficient of `dx`). -/
def qDerivative (Λ : Type) [CommRing Λ] (i : ℤ) :
    reesPiece Λ[X] i →+ reesPiece Λ[X] (i - 1) := sorry

end RT4Q

/-- The comparison map `ψ^0_R : q-dR_{R/A} → gr^0_{ev,tS¹}TP_■ ≃ gr^0_{ev,hS¹}TC⁻_■(ku_R/ku_A)` in
the local case, built from the cyclotomic Frobenius of `THH(S_R/S_A)` and Devalapurkar's comparison
(`p > 2`; Nikolaus's for `p = 2` in case (E₁)); `q-dR_{R/A}` is `p`-completed. -/
def qHodgeComparison (p : ℕ) [Fact p.Prime] (A R : Type) [CommRing A] [CommRing R] [Algebra A R]
    (B : CyclotomicBase p A) {n : ℕ} (L : SphericalLift B.lift R n) :
    Spectrum.pCompletion p (RT4Q.qDeRham A R) ⟶
      (RT4Q.localTCminusEven p B.lift L.ring.toE1 L.structureMap).gr 0 := sorry

/-- The q-Hodge filtration as the pullback
`fil^⋆_{q-Hdg} q-dR_{R/A} := q-dR_{R/A} ×_{gr^0} Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻_■(ku_R/ku_A)` along `ψ^0_R`. -/
def qHodgeFiltration (p : ℕ) [Fact p.Prime] (A R : Type) [CommRing A] [CommRing R] [Algebra A R]
    (B : CyclotomicBase p A) {n : ℕ} (L : SphericalLift B.lift R n) : RT4Q.FilSpectrum :=
  RT4Q.FilSpectrum.pullback (RT4Q.constFilMap (qHodgeComparison p A R B L))
    (RT4Q.evenRegradedToGr0 (RT4Q.localTCminusEven p B.lift L.ring.toE1 L.structureMap))

/-- Modulo `β` the comparison is the de Rham comparison for `HC⁻`: the reduction of the q-Hodge
filtration modulo `β` is the Hodge filtration on `dR_{R/A}` (`p`-completed). -/
theorem qHodgeComparison.mod_beta (p : ℕ) [Fact p.Prime] (A R : Type) [CommRing A] [CommRing R]
    [Algebra A R] (B : CyclotomicBase p A) {n : ℕ} (L : SphericalLift B.lift R n) :
    Nonempty (RT4Q.modBeta (qHodgeFiltration p A R B L) ≅
      (RT4Q.hodgeFiltration A R).pCompletion p) := sorry

/-- `Σ^{−2∗}gr^∗(ku^{hT}) ≅ ℤ_p[β][[t]]` (`p`-complete), with `q − 1 = βt`: the `i`-th piece is
`(q−1)^i ℤ_p[[q−1]]`. -/
theorem qHodgeComparison.coefficients (p : ℕ) [Fact p.Prime] (i : ℤ) :
    Nonempty ((evenCircleFixedPoints (RT4Q.EvFilTMod.trivial (RT4Q.pCompleteInfty p ku))).grShift i ≅
      Spectrum.em (RT4Q.reesPiece ℤ_[p] i)) := sorry

/-- Test `qHodgeFiltration.zero_degree` (degenerate): `fil^0_{q-Hdg} = q-dR_{R/A}`. -/
example (p : ℕ) [Fact p.Prime] (A R : Type) [CommRing A] [CommRing R] [Algebra A R]
    (B : CyclotomicBase p A) {n : ℕ} (L : SphericalLift B.lift R n) :
    Nonempty ((qHodgeFiltration p A R B L).fil 0 ≅ Spectrum.pCompletion p (RT4Q.qDeRham A R)) :=
  sorry

/-- Test `qHodgeFiltration.polynomial` (computation): for `R = ℤ_p[x]` with the lift `S_p[x]`,
`fil^i = ((q−1)^i ℤ_p[x][[q−1]] → (q−1)^{i−1} ℤ_p[x][[q−1]] dx)` for `i ≥ 1` (Raksit's example). -/
example (p : ℕ) [Fact p.Prime] (B : CyclotomicBase p ℤ_[p]) (hB : Nonempty (B.lift ≅ RT4Q.sphereP p))
    {n : ℕ} (L : SphericalLift B.lift ℤ_[p][X] n)
    (hL : Nonempty (L.ring ≅ RT4Q.EnRing.ofEInfty n (RT4Q.pCompleteInfty p RT4Q.sphericalPolynomial)))
    (i : ℤ) (hi : 1 ≤ i) :
    Nonempty ((qHodgeFiltration p ℤ_[p] ℤ_[p][X] B L).fil i ≅
      Spectrum.fib (RT4Q.emMap (RT4Q.qDerivative ℤ_[p] i))) := sorry

/-- Test `qHodgeFiltration.not_qadic` (non-example): `fil^⋆_{q-Hdg}` is not the `(q−1)`-adic
filtration `(q−1)^⋆ q-dR` (on `ℤ_p[x]` the term `dx` sits in filtration `i − 1`, not `i`). -/
example (p : ℕ) [Fact p.Prime] (B : CyclotomicBase p ℤ_[p]) (hB : Nonempty (B.lift ≅ RT4Q.sphereP p))
    {n : ℕ} (L : SphericalLift B.lift ℤ_[p][X] n)
    (hL : Nonempty (L.ring ≅ RT4Q.EnRing.ofEInfty n (RT4Q.pCompleteInfty p RT4Q.sphericalPolynomial))) :
    ¬ Nonempty (qHodgeFiltration p ℤ_[p] ℤ_[p][X] B L ≅ RT4Q.qAdicFiltration p ℤ_[p] ℤ_[p][X]) :=
  sorry

/-! ### RT.4:q-Hodge/p-complete-comparison-odd, p-complete-comparison-two,
quasi-regular-quotients -/

/-- Wagner Theorem 4.8: for `p > 2` and an E_n-lift (`n = 2`, or `n = 1` in case (E₁), whose cover
data is not recorded), `ψ^0_R` identifies the completed q-Hodge filtration with
`Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻_■(ku_R/ku_A)`; modulo `β` it is the Hodge filtration on `dR_{R/A}`, and
after rationalisation the combined (Hodge, `q−1`)-filtration on `dR_{R/A}[1/p][[q−1]]`. Not
recorded: the `ℤ_p[β][[t]]`-module structure beyond the `t`-transitions, the conditions on `A`
and `R` (perfectly covered, bounded `p^∞`-torsion, `p`-quasi-lci), and the `E_{n−1}`-monoidality
(Remark 4.9). -/
theorem pCompleteComparisonOdd (p : ℕ) [Fact p.Prime] (hp : 2 < p) (A R : Type) [CommRing A]
    [CommRing R] [Algebra A R] (B : CyclotomicBase p A) {n : ℕ} (hn : 1 ≤ n)
    (L : SphericalLift B.lift R n) :
    Nonempty ((qHodgeFiltration p A R B L).completion ≅
      RT4Q.evenRegraded (RT4Q.localTCminusEven p B.lift L.ring.toE1 L.structureMap)) ∧
    Nonempty (RT4Q.modBeta (qHodgeFiltration p A R B L) ≅
      (RT4Q.hodgeFiltration A R).pCompletion p) ∧
    Nonempty ((qHodgeFiltration p A R B L).rationalise.completion ≅
      (RT4Q.hodgeQFiltrationP p A R).completion) := sorry

/- Wagner Theorem 4.14: at `p = 2`, for `R` 2-torsion free with an E₁-lift `S_R` and E₁-lifts
`S_{R_∞^n}` of the terms `R_∞^n` of the Čech nerve of a 2-quasi-syntomic cover `R → R_∞` (case
3.2(E₁); the cover conditions are not recorded), the even filtration is the ad hoc filtration
`lim_Δ τ_{≥2⋆}TC⁻_■(ku_{R_∞^•}/ku_A)` and the conclusions of Theorem 4.8 hold. Case (E₂) at
`p = 2` remains open. -/
/-- E₁ cover coherence: the displayed sequence is the augmented p-completed Čech
nerve of a quasisyntomic relatively semiperfect cover, with all lifted maps. -/
def RT4Q.LiftedCoverCoherence {A : Type} [CommRing A] (B : CyclotomicBase 2 A)
    (Rc : ℕ → Type) [∀ m, CommRing (Rc m)]
    (Lc : ∀ m, SphericalLift B.lift (Rc m) 1) : Type := sorry
def RT4Q.liftedCoverDiagram {A : Type} [CommRing A] (B : CyclotomicBase 2 A)
    (Rc : ℕ → Type) [∀ m, CommRing (Rc m)]
    (Lc : ∀ m, SphericalLift B.lift (Rc m) 1) (h : RT4Q.LiftedCoverCoherence B Rc Lc) :
    Coherent.Functor RT4Q.CosimplicialShape RT4Q.FilSpectrum.coherentCategory := sorry

theorem pCompleteComparisonTwo (A R : Type) [CommRing A] [CommRing R] [Algebra A R]
    (B : CyclotomicBase 2 A) (L : SphericalLift B.lift R 1)
    (hR : ∀ r : R, (2 : R) * r = 0 → r = 0)
    (Rc : ℕ → Type) [∀ m, CommRing (Rc m)] (Lc : ∀ m, SphericalLift B.lift (Rc m) 1)
    (hcover : RT4Q.LiftedCoverCoherence B Rc Lc) :
    Nonempty (RT4Q.localTCminusEven 2 B.lift L.ring.toE1 L.structureMap ≅
      RT4Q.FilSpectrum.totLimit (RT4Q.liftedCoverDiagram B Rc Lc hcover)) ∧
    Nonempty ((qHodgeFiltration 2 A R B L).completion ≅
      RT4Q.evenRegraded (RT4Q.localTCminusEven 2 B.lift L.ring.toE1 L.structureMap)) ∧
    Nonempty (RT4Q.modBeta (qHodgeFiltration 2 A R B L) ≅
      (RT4Q.hodgeFiltration A R).pCompletion 2) ∧
    Nonempty ((qHodgeFiltration 2 A R B L).rationalise.completion ≅
      (RT4Q.hodgeQFiltrationP 2 A R).completion) := sorry

/-- Identity-cover quasi-regular input: the relatively semiperfect reduction, p-quasi-lci
cotangent bound and p-completeness of both R and its spherical lift. -/
structure RT4Q.IdentityCoverQuasiRegularInput (p : ℕ) (A R : Type)
    [CommRing A] [CommRing R] [Algebra A R] (B : CyclotomicBase p A)
    (L : SphericalLift B.lift R 1) where
  quasiLCI : RT4Q.QuasiLCIWitness A R
  relativelySemiperfect : RT4Q.SemiperfectCoverWitness p A R R
  pComplete : RT4Q.IsPComplete p (Spectrum.em R)
  pCompleteLift : RT4Q.IsPComplete p L.ring.toE1.toSpectrum

/-- Wagner Theorem 4.17: for `R` `p`-torsion free with an E₁-lift `S_R` and `R/p` relatively
semiperfect over `A`, with the complete identity-cover input recorded below, `q-dR_{R/A}` and `dR_{R/A}` are static and
`fil^⋆_{q-Hdg} q-dR_{R/A} = q-dR_{R/A} ×_{dR_{R/A}[1/p][[q−1]]} fil^⋆_{(Hdg,q−1)}`; hence it is
independent of the lift (and canonically a filtered E_∞-algebra, not recorded). -/
theorem quasiRegularQuotients (p : ℕ) [Fact p.Prime] (A R : Type) [CommRing A] [CommRing R]
    [Algebra A R] (B : CyclotomicBase p A) (L : SphericalLift B.lift R 1)
    (hR : ∀ r : R, (p : R) * r = 0 → r = 0)
    (hqr : RT4Q.IdentityCoverQuasiRegularInput p A R B L) :
    (∀ k : ℤ, k ≠ 0 → Subsingleton ((Spectrum.pCompletion p (RT4Q.qDeRham A R)).homotopyGroup k)) ∧
    (∀ k : ℤ, k ≠ 0 → Subsingleton ((Spectrum.pCompletion p (RT4Q.deRham A R)).homotopyGroup k)) ∧
    Nonempty (qHodgeFiltration p A R B L ≅
      RT4Q.FilSpectrum.pullback (RT4Q.constFilMap (RT4Q.qdRToRational p A R))
        (RT4Q.hodgeQToConst p A R)) ∧
    ∀ L' : SphericalLift B.lift R 1,
      Nonempty (qHodgeFiltration p A R B L ≅ qHodgeFiltration p A R B L') := sorry

/-! ### RT.4:q-Hodge/global-even-filtration -/

namespace RT4Q

/-- The profinite filtration `∏_p fil^⋆_ev THH_■(ku_{R̂_p}/ku_{Â_p})` (with (E₁)- and (E₂)-primes
treated separately, Wagner 4.21). -/
def profiniteThhEven (SA : EInftyRing) (SR : E1Ring) (f : SA.toE1 ⟶ SR) : FilSpectrum := sorry

/-- `fil^⋆_{HKR} HH(R/A) ⊗ ℚ[β]_ev`, the rational even filtration. -/
def rationalHHBeta (A R : Type) [CommRing A] [CommRing R] [Algebra A R] : FilSpectrum := sorry

end RT4Q

/-- The global even filtration `fil^⋆_ev THH(ku_R/ku_A)`, glued as the pullback of the profinite
filtration and the rational filtration `fil^⋆_ev HH(R/A) ⊗ ℚ[β]_ev` over the rationalised
profinite one (Wagner 4.21–4.23), as an even-filtered `T_ev`-module; then
`fil_{ev,hS¹}TC⁻ := (fil_ev THH)^{hT_ev}`. The compatible per-prime (E₁)/(E₂) choices are required by CompatibleGlobalInput. -/
def globalEvenFiltrationShadow (A R : Type) [CommRing A] [CommRing R] [Algebra A R] (SA : EInftyRing)
    {n : ℕ} (L : SphericalLift SA R n) [RT4Q.CompatibleGlobalInput SA A R L] : RT4Q.EvFilTMod := sorry

/-- Restriction to the profinite filtration. -/
def globalEvenFiltrationShadow.profinite (A R : Type) [CommRing A] [CommRing R] [Algebra A R]
    (SA : EInftyRing) {n : ℕ} (L : SphericalLift SA R n) [RT4Q.CompatibleGlobalInput SA A R L] :
    (globalEvenFiltrationShadow A R SA L).underlying ⟶
      RT4Q.profiniteThhEven SA L.ring.toE1 L.structureMap := sorry

/-- Restriction to the rational filtration `fil_ev HH(R/A) ⊗ ℚ[β]_ev`. -/
def globalEvenFiltrationShadow.rational (A R : Type) [CommRing A] [CommRing R] [Algebra A R]
    (SA : EInftyRing) {n : ℕ} (L : SphericalLift SA R n) [RT4Q.CompatibleGlobalInput SA A R L] :
    (globalEvenFiltrationShadow A R SA L).underlying ⟶ RT4Q.rationalHHBeta A R := sorry

/-- The glued comparison `ψ^0_R : q-dR_{R/A} → gr^0_{ev,hS¹}TC⁻(ku_R/ku_A)` (Wagner 4.25, using
Lemma 4.29). -/
def globalComparisonShadow (A R : Type) [CommRing A] [CommRing R] [Algebra A R] (SA : EInftyRing)
    {n : ℕ} (L : SphericalLift SA R n) [RT4Q.CompatibleGlobalInput SA A R L] :
    RT4Q.qDeRham A R ⟶ (evenCircleFixedPoints (globalEvenFiltrationShadow A R SA L)).gr 0 := sorry

/-- Test `globalEvenFiltration.integers` (computation): for `A = R = ℤ`,
`fil_{ev,hS¹}TC⁻(ku/ku) = τ_{≥2⋆} ku^{hS¹}`. -/
example {n : ℕ} (L : SphericalLift RT4Q.sphereInfty ℤ n)
    (hL : Nonempty (L.ring ≅ RT4Q.EnRing.ofEInfty n RT4Q.sphereInfty))
    [RT4Q.CompatibleGlobalInput RT4Q.sphereInfty ℤ ℤ L] :
    Nonempty (evenCircleFixedPoints (globalEvenFiltrationShadow ℤ ℤ RT4Q.sphereInfty L) ≅
      RT4Q.doubleSpeed (homotopyFixedPoints (SpectraWithAction.trivial T (RT4Q.sp ku)))) := sorry

/-- Test `globalEvenFiltration.rational_part` (degenerate): after `− ⊗ ℚ` the filtration is
`fil_{HKR} HH(R/A) ⊗ ℚ[β]_ev`. -/
example (A R : Type) [CommRing A] [CommRing R] [Algebra A R] (SA : EInftyRing) {n : ℕ}
    (L : SphericalLift SA R n) [RT4Q.CompatibleGlobalInput SA A R L] :
    Nonempty ((globalEvenFiltrationShadow A R SA L).underlying.rationalise ≅ RT4Q.rationalHHBeta A R) :=
  sorry

/- Test `globalEvenFiltration.identity_base` is stated with the primary coherent input
at the end of this file. The former unrestricted existence nonexample was unsupported. -/

/-! ### RT.4:q-Hodge/q-hodge-global, q-hodge-multiplicativity, raksit-polynomial-example -/

namespace RT4Q

/-- The global q-Hodge filtration `fil^⋆_{q-Hdg} q-dR_{R/A}`: the pullback of
`Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻(ku_R/ku_A)` along the glued comparison `ψ^0_R`. -/
def globalQHodgeFiltrationShadow (A R : Type) [CommRing A] [CommRing R] [Algebra A R] (SA : EInftyRing)
    {n : ℕ} (L : SphericalLift SA R n) [RT4Q.CompatibleGlobalInput SA A R L] : FilSpectrum :=
  FilSpectrum.pullback (constFilMap (globalComparisonShadow A R SA L))
    (evenRegradedToGr0 (evenCircleFixedPoints (globalEvenFiltrationShadow A R SA L)))

/-- The β-localised (`KU`) even filtration `fil^⋆_ev THH(KU_R/KU_A)`, an even-filtered
`T_ev`-module (localisation at `β` in homotopical degree 2 and filtration degree 1). -/
def globalEvenFiltrationKU (A R : Type) [CommRing A] [CommRing R] [Algebra A R]
    (SA : EInftyRing) {n : ℕ} (L : SphericalLift SA R n) [RT4Q.CompatibleGlobalInput SA A R L] : EvFilTMod := sorry

/-- E_m-algebras in `AniAlg^{q-Hdg}_A` (HabiroCohomologyFoundations HQ.3). -/
def QHodgeEnAlg (m : ℕ) (A : Type) [CommRing A] : Type := sorry

/-- The underlying q-Hodge filtered algebra of an E_m-algebra in `AniAlg^{q-Hdg}_A`. -/
def QHodgeEnAlg.forget {m : ℕ} {A : Type} [CommRing A] (X : QHodgeEnAlg m A) : QHodgeAlg A :=
  sorry

end RT4Q

/-- Wagner Theorems 1.2 and 4.27: for `A` a perfectly covered Λ-ring with the lifts of 3.1(tC_p)
at every prime and `R` a quasi-lci `A`-algebra with glued spherical lift `S_R` over `S_A`
(`n = 1` or `2`), `ψ^0_R` identifies the completed q-Hodge filtration with
`Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻(ku_R/ku_A)`; modulo `β` the uncompleted filtration is the Hodge filtration
on `dR_{R/A}`; after rationalisation and `(q−1)`-completion it is the combined Hodge and
`(q−1)`-adic filtration on `(dR_{R/A} ⊗ ℚ)[[q−1]]`; so `(R, fil_{q-Hdg})` is an object of
`AniAlg^{q-Hdg}_A`. Not recorded: the conditions on `A` and `R` (perfect covering, bounded
`p^∞`-torsion, per-prime (E₁)/(E₂) choices, the addendum (R₂)) and the `ℤ[β][[t]]`-module structure
beyond the `t`-transitions. Theorem 1.2 is the case `A = ℤ`, `R` quasi-syntomic, `2 ∈ R^×`, `n = 2`. -/
theorem qHodgeGlobal (A R : Type) [CommRing A] [CommRing R] [Algebra A R] (SA : EInftyRing)
    (hSA : Nonempty (RT4Q.smashInfty SA (EInftyRing.ofCommRing ℤ) ≅ EInftyRing.ofCommRing A))
    {n : ℕ} (hn : 1 ≤ n) (L : SphericalLift SA R n) [RT4Q.CompatibleGlobalInput SA A R L] :
    Nonempty ((RT4Q.globalQHodgeFiltrationShadow A R SA L).completion ≅
      RT4Q.evenRegraded (evenCircleFixedPoints (globalEvenFiltrationShadow A R SA L))) ∧
    Nonempty (RT4Q.modBeta (RT4Q.globalQHodgeFiltrationShadow A R SA L) ≅ RT4Q.hodgeFiltration A R) ∧
    Nonempty ((RT4Q.globalQHodgeFiltrationShadow A R SA L).rationalise.completion ≅
      (RT4Q.hodgeQFiltration A R).completion) ∧
    ∃ X : RT4Q.QHodgeAlg A, Nonempty (X.algebra ≅ RT4Q.AniAlg.ofAlgebra A R) ∧
      Nonempty (X.filtration ≅ RT4Q.globalQHodgeFiltrationShadow A R SA L) := sorry

/-- Completeness, multiplicativity and the graded comparison (Wagner Corollary 3.14, Remark 4.28):
(i) `fil^⋆_ev THH(ku_R/ku_A)` and `fil^⋆_{ev,hS¹}TC⁻` are complete and exhaustive; (ii) for
E_n-lifts with `n ≥ 2`, `(R, fil_{q-Hdg})` is an `E_{n−1}`-algebra in `AniAlg^{q-Hdg}_A`;
(iii) `Σ^{−2i} gr^i_{ev,hS¹}TC⁻ ≃ fil^i_{q-Hdg} q-dR^∧` for every `i`, and HQ.3's q-Hodge complex
`q-Hdg_{R/A}` is `gr^0` of the `S¹`-even filtration on `TC⁻(KU_R/KU_A)`. The a posteriori
E_∞-structure at (E₁)-primes (Theorem 4.17) is not recorded. -/
theorem qHodgeMultiplicativity (A R : Type) [CommRing A] [CommRing R] [Algebra A R]
    (SA : EInftyRing)
    (hSA : Nonempty (RT4Q.smashInfty SA (EInftyRing.ofCommRing ℤ) ≅ EInftyRing.ofCommRing A))
    {n : ℕ} (hn : 1 ≤ n) (L : SphericalLift SA R n) [RT4Q.CompatibleGlobalInput SA A R L] :
    ((globalEvenFiltrationShadow A R SA L).underlying.IsComplete ∧
      (globalEvenFiltrationShadow A R SA L).underlying.IsExhaustiveFor
        (RT4Q.thhKu SA L.ring.toE1 L.structureMap).underlying ∧
      (evenCircleFixedPoints (globalEvenFiltrationShadow A R SA L)).IsComplete ∧
      (evenCircleFixedPoints (globalEvenFiltrationShadow A R SA L)).IsExhaustiveFor
        (TCminus (RT4Q.thhKu SA L.ring.toE1 L.structureMap))) ∧
    (2 ≤ n → ∃ Y : RT4Q.QHodgeEnAlg (n - 1) A,
      Nonempty (Y.forget.algebra ≅ RT4Q.AniAlg.ofAlgebra A R) ∧
      Nonempty (Y.forget.filtration ≅ RT4Q.globalQHodgeFiltrationShadow A R SA L)) ∧
    (∀ i : ℤ, Nonempty ((evenCircleFixedPoints (globalEvenFiltrationShadow A R SA L)).grShift i ≅
      (RT4Q.globalQHodgeFiltrationShadow A R SA L).completion.fil i)) ∧
    Nonempty (RT4Q.qHodgeComplex A R ≅
      (evenCircleFixedPoints (RT4Q.globalEvenFiltrationKU A R SA L)).gr 0) := sorry

/-- Raksit's example (Wagner Theorem 1.4): for `S_R = S[x]` the `S¹`-even filtration on
`TC⁻(ku[x]/ku)` computes the coordinate q-de Rham complex of `ℤ[x]`, with
`Σ^{−2i} gr^i = ((q−1)^i ℤ[x][[q−1]] → (q−1)^{i−1} ℤ[x][[q−1]] dx)` for `i ≥ 0` (for `i = 0` the
whole complex `ℤ[x][[q−1]] →^{∇_q} ℤ[x][[q−1]] dx`). The framed smooth generalisation (Theorem 6.10)
is not recorded. -/
theorem raksitPolynomialExample {n : ℕ} (L : SphericalLift RT4Q.sphereInfty ℤ[X] n)
    (hL : Nonempty (L.ring ≅ RT4Q.EnRing.ofEInfty n RT4Q.sphericalPolynomial))
    [RT4Q.CompatibleGlobalInput RT4Q.sphereInfty ℤ ℤ[X] L] :
    ∀ i : ℤ, 0 ≤ i →
      Nonempty ((evenCircleFixedPoints (globalEvenFiltrationShadow ℤ ℤ[X] RT4Q.sphereInfty L)).grShift i ≅
        Spectrum.fib (RT4Q.emMap (RT4Q.qDerivative ℤ i))) := sorry


/-! ### RT.4:q-Hodge/cyclonic-spectrum -/

/-- Cyclonic spectra (Barwick–Glasman): spectra with an `S¹`-action that is genuine for every finite
cyclic subgroup `C_m ⊆ S¹`, the localising subcategory of genuine `S¹`-spectra generated by the
cells `S¹/C_m` (RT.2/genuine-cyclic-and-circle-spectra). Unlike genuine cyclotomic spectra they
carry no identifications `Φ^{C_p}X ≃ X`. -/
def CyclonicSpectrum : Type := sorry

instance : Category.{0} CyclonicSpectrum := sorry

/-- Genuine fixed points `X^{C_m}` with the residual `S¹/C_m ≅ S¹`-action. -/
def CyclonicSpectrum.fixedPoints (X : CyclonicSpectrum) (m : ℕ) : SpectraWithAction T := sorry

/-- Geometric fixed points `X^{ΦC_m}` with the residual `S¹/C_m ≅ S¹`-action. -/
def CyclonicSpectrum.geometricFixedPoints (X : CyclonicSpectrum) (m : ℕ) : SpectraWithAction T :=
  sorry

namespace RT4Q

/-- The underlying `S¹`-spectrum of a cyclonic spectrum. -/
def cyclonicUnderlying (X : CyclonicSpectrum) : SpectraWithAction T := sorry

/-- The map on genuine fixed points. -/
def fixedPointsMap {X Y : CyclonicSpectrum} (f : X ⟶ Y) (m : ℕ) :
    X.fixedPoints m ⟶ Y.fixedPoints m := sorry

/-- The map on geometric fixed points. -/
def geometricFixedPointsMap {X Y : CyclonicSpectrum} (f : X ⟶ Y) (m : ℕ) :
    X.geometricFixedPoints m ⟶ Y.geometricFixedPoints m := sorry

/-- A cyclonic spectrum is bounded below if all `X^{ΦC_m}` (equivalently all `X^{C_m}`) are. -/
def cyclonicBoundedBelow (X : CyclonicSpectrum) : Prop :=
  ∀ m : ℕ, 0 < m → (X.geometricFixedPoints m).underlying.IsBoundedBelow

/-- Naive cyclonic spectra: families `(Y_m)_{m ≥ 1}` of spectra with `S¹/C_m`-actions and
Frobenius-type maps `Y_{pd} → (Y_d)^{tC_p}`. -/
structure NaiveCyclonic where
  /-- The terms `Y_m` (only `m ≥ 1` is used). -/
  obj : ℕ → SpectraWithAction T
  /-- The Frobenius-type maps. -/
  frob : ∀ p d : ℕ, p.Prime → 0 < d → (obj (p * d) ⟶ residualTate p (obj d))

instance : Category.{0} NaiveCyclonic := sorry

/-- A naive cyclonic spectrum is bounded below if every term is. -/
def naiveBoundedBelow (Y : NaiveCyclonic) : Prop :=
  ∀ m : ℕ, 0 < m → (Y.obj m).underlying.IsBoundedBelow

/-- Bounded-below cyclonic spectra. -/
abbrev BBCyclonic := ObjectProperty.FullSubcategory cyclonicBoundedBelow

/-- Bounded-below naive cyclonic spectra. -/
abbrev BBNaiveCyclonic := ObjectProperty.FullSubcategory naiveBoundedBelow

/-- The divisors `d ∣ m`. -/
abbrev DivisorIdx (m : ℕ) := {d : ℕ // d ∈ m.divisors}

/-- The pairs `(p, d)` with `p` prime and `pd ∣ m`. -/
abbrev PrimeDivisorIdx (m : ℕ) := {pd : ℕ × ℕ // pd.1.Prime ∧ 0 < pd.2 ∧ pd.1 * pd.2 ∣ m}

/-- The source `∏_{d|m} (X^{ΦC_d})^{hC_{m/d}}` of the fixed-point formula. -/
def fixedPointSource (X : CyclonicSpectrum) (m : ℕ) : Spectrum :=
  prod (fun d : DivisorIdx m =>
    homotopyFixedPoints (restrictToCyclic (m / d.1) (X.geometricFixedPoints d.1)))

/-- The target `∏_p ∏_{pd|m} ((X^{ΦC_d})^{tC_p})^{hC_{m/pd}}` of the fixed-point formula. -/
def fixedPointTarget (X : CyclonicSpectrum) (m : ℕ) : Spectrum :=
  prod (fun pd : PrimeDivisorIdx m =>
    homotopyFixedPoints (restrictToCyclic (m / (pd.1.1 * pd.1.2))
      (residualTate pd.1.1 (X.geometricFixedPoints pd.1.2))))

/-- The canonical maps `can`. -/
def cyclonicCan (X : CyclonicSpectrum) (m : ℕ) : fixedPointSource X m ⟶ fixedPointTarget X m :=
  sorry

/-- The Frobenius maps `φ`. -/
def cyclonicPhi (X : CyclonicSpectrum) (m : ℕ) : fixedPointSource X m ⟶ fixedPointTarget X m :=
  sorry

end RT4Q

/-- The families `{(−)^{C_m}}` and `{(−)^{ΦC_m}}` are each jointly conservative. -/
theorem CyclonicSpectrum.conservative {X Y : CyclonicSpectrum} (f : X ⟶ Y) :
    (IsIso f ↔ ∀ m : ℕ, 0 < m → IsIso (RT4Q.fixedPointsMap f m)) ∧
    (IsIso f ↔ ∀ m : ℕ, 0 < m → IsIso (RT4Q.geometricFixedPointsMap f m)) := sorry

/-- Bounded-below cyclonic spectra are equivalent to bounded-below naive cyclonic spectra. -/
def CyclonicSpectrum.boundedBelow_naive : RT4Q.BBCyclonic ≌ RT4Q.BBNaiveCyclonic := sorry

/-- For bounded-below `X`, `X^{C_m}` is the equalizer of `can` and `φ`:
`X^{C_m} ≃ eq(∏_{d|m}(X^{ΦC_d})^{hC_{m/d}} ⇉ ∏_p ∏_{pd|m}((X^{ΦC_d})^{tC_p})^{hC_{m/pd}})`. -/
theorem CyclonicSpectrum.fixedPoints_formula (X : CyclonicSpectrum)
    (hX : RT4Q.cyclonicBoundedBelow X) (m : ℕ) (hm : 0 < m) :
    Nonempty ((X.fixedPoints m).underlying ≅
      RT4Q.equalizer (RT4Q.cyclonicCan X m) (RT4Q.cyclonicPhi X m)) := sorry

/-- Test `CyclonicSpectrum.trivial` (degenerate): for `m = 1`, `X^{C_1}` is the underlying
spectrum. -/
example (X : CyclonicSpectrum) : Nonempty (X.fixedPoints 1 ≅ RT4Q.cyclonicUnderlying X) := sorry

/-! ### RT.4:q-Hodge/cyclonic-ku -/

/-- Genuine `S¹`-equivariant connective K-theory `ku_{S¹}` restricted to a cyclonic spectrum (a
cyclonic E_∞-ring; the ring structure is not recorded). -/
def cyclonicKu : CyclonicSpectrum := sorry

/-- `KU_{S¹} := ku_{S¹}[β^{−1}]` with the genuine Bott element (equivariant Snaith theorem). -/
def cyclonicKU : CyclonicSpectrum := sorry

namespace RT4Q

/-- `ℤ[q]/(q^m − 1) = RU(C_m)`. -/
abbrev repRing (m : ℕ) : Type := ℤ[X] ⧸ Ideal.span {(X ^ m - 1 : ℤ[X])}

/-- The inflation `ℤ[q]/(q^m − 1) → ℤ[q]/(q^{mn} − 1)`, `q ↦ q^n`. -/
def inflationQuot (m n : ℕ) : repRing m →+* repRing (m * n) :=
  Ideal.quotientMap _ (Polynomial.expand ℤ n).toRingHom sorry

/-- The inflation map `ku^{C_m} → ku^{C_{mn}}` along `z ↦ z^n`. -/
def kuInflation (m n : ℕ) :
    (CyclonicSpectrum.fixedPoints cyclonicKu m).underlying ⟶ (CyclonicSpectrum.fixedPoints cyclonicKu (m * n)).underlying := sorry

end RT4Q

/-- `π_*(ku^{C_m}) ≅ ℤ[β, q]/(q^m − 1)`: even, vanishing in negative degrees, and
`π_{2i} ≅ β^i ℤ[q]/(q^m − 1)` for `i ≥ 0`. -/
theorem cyclonicKu.fixedPoints (m : ℕ) (hm : 0 < m) :
    RT4Q.IsEvenSpectrum (CyclonicSpectrum.fixedPoints cyclonicKu m).underlying ∧
    (∀ k : ℤ, k < 0 → Subsingleton ((CyclonicSpectrum.fixedPoints cyclonicKu m).underlying.homotopyGroup k)) ∧
    ∀ i : ℕ, Nonempty ((CyclonicSpectrum.fixedPoints cyclonicKu m).underlying.homotopyGroup (2 * i) ≃+
      RT4Q.repRing m) := sorry

/-- Inflation `ku^{C_m} → ku^{C_{mn}}` is `q ↦ q^n`, `β ↦ β` on homotopy. -/
theorem cyclonicKu.inflation (m n : ℕ) (hm : 0 < m) (hn : 0 < n) (i : ℕ) :
    ∃ (e : (CyclonicSpectrum.fixedPoints cyclonicKu m).underlying.homotopyGroup (2 * i) ≃+ RT4Q.repRing m)
      (e' : (CyclonicSpectrum.fixedPoints cyclonicKu (m * n)).underlying.homotopyGroup (2 * i) ≃+
        RT4Q.repRing (m * n)),
      ∀ x, e' (Spectrum.homotopyGroupMap (RT4Q.kuInflation m n) (2 * i) x) =
        RT4Q.inflationQuot m n (e x) := sorry

/-- Each `ku^{ΦC_m}` is bounded below. -/
theorem cyclonicKu.geometric_boundedBelow (m : ℕ) (hm : 0 < m) :
    (CyclonicSpectrum.geometricFixedPoints cyclonicKu m).underlying.IsBoundedBelow := sorry

/-- Test `CyclonicSpectrum.ku_fixed` (computation): `π_*(ku^{C_m}) ≅ ℤ[β, q]/(q^m − 1)`. -/
example (m : ℕ) (hm : 0 < m) :
    RT4Q.IsEvenSpectrum (CyclonicSpectrum.fixedPoints cyclonicKu m).underlying ∧
    ∀ i : ℕ, Nonempty ((CyclonicSpectrum.fixedPoints cyclonicKu m).underlying.homotopyGroup (2 * i) ≃+
      RT4Q.repRing m) := sorry

/-- Test `CyclonicSpectrum.no_restriction` (non-example): a cyclonic spectrum need not have
TR-type restriction maps `X^{C_{pm}} → X^{C_m}`, which would come from an identification
`Φ^{C_p}X ≃ X`: for cyclonic `ku` there is none (only inflations; the inclusion-of-fixed-points
maps are the `F`-type maps, not `R`). -/
example (p : ℕ) (hp : p.Prime) :
    ¬ Nonempty (CyclonicSpectrum.geometricFixedPoints cyclonicKu p ≅ RT4Q.cyclonicUnderlying cyclonicKu) := sorry

/-- Test `cyclonicKu.m_one` (degenerate): `ku^{C_1} = ku`. -/
example : Nonempty ((CyclonicSpectrum.fixedPoints cyclonicKu 1).underlying ≅ RT4Q.sp ku) := sorry

/-- Test `cyclonicKu.pi0_C2` (computation): `π_0(ku^{C_2}) = ℤ[q]/(q² − 1) = RU(C_2)`. -/
example : Nonempty ((CyclonicSpectrum.fixedPoints cyclonicKu 2).underlying.homotopyGroup 0 ≃+ RT4Q.repRing 2) :=
  sorry

/-- Test `cyclonicKU.not_bounded_below` (non-example): `KU^{ΦC_m}` is not bounded below, so the
bounded-below cyclonic machinery does not apply to `KU` directly. -/
example (m : ℕ) (hm : 0 < m) :
    ¬ (cyclonicKU.geometricFixedPoints m).underlying.IsBoundedBelow := sorry


/-! ### RT.4:q-Hodge/tc-minus-m -/

/-- `TC^{−(m)}(X) := (X^{C_m})^{h(S¹/C_m)}`: genuine `C_m`-fixed points followed by homotopy fixed
points of the residual circle `S¹/C_m ≅ S¹`. -/
def TCminusM (X : CyclonicSpectrum) (m : ℕ) : Spectrum := homotopyFixedPoints (X.fixedPoints m)

namespace RT4Q

/-- The maps `TC^{−(m)}(X) → TC^{−(n)}(X)` for `n ∣ m` (Wagner Remark 5.62). -/
def tcMinusMDivisorMap (X : CyclonicSpectrum) {m n : ℕ} (h : n ∣ m) : TCminusM X m ⟶ TCminusM X n :=
  sorry

/-- The `(q^m − 1)`-adic completion `ℤ[q]^∧_{(q^m−1)}`. -/
abbrev adicCompletionQ (m : ℕ) : Type :=
  AdicCompletion (Ideal.span {(X ^ m - 1 : ℤ[X])}) ℤ[X]

/-- The degree-`i` piece `(q^m − 1)^i ℤ[q]^∧_{(q^m−1)}` of the `(q^m−1)`-adic filtration
(`(q^m−1)^i := 1` for `i ≤ 0`). -/
abbrev adicReesPiece (m : ℕ) (i : ℤ) : Type :=
  ↥((Ideal.span {(X ^ m - 1 : ℤ[X])}) ^ i.toNat • (⊤ : Submodule ℤ[X] (adicCompletionQ m)))

end RT4Q

/-- `TC^{−(1)} = TC⁻`. -/
theorem TCminusM.one (X : CyclonicSpectrum) :
    Nonempty (TCminusM X 1 ≅ TCminus (RT4Q.cyclonicUnderlying X)) := sorry

/-- The maps `TC^{−(m)} → TC^{−(n)}` for `n ∣ m` (Remark 5.62) are functorial in the divisibility
poset: the identity for `n = m`, and compatible with composition. -/
theorem TCminusM.divisor (X : CyclonicSpectrum) :
    (∀ m : ℕ, RT4Q.tcMinusMDivisorMap X (dvd_refl m) = 𝟙 _) ∧
    ∀ (m n k : ℕ) (h₁ : n ∣ m) (h₂ : k ∣ n),
      RT4Q.tcMinusMDivisorMap X h₁ ≫ RT4Q.tcMinusMDivisorMap X h₂ =
        RT4Q.tcMinusMDivisorMap X (h₂.trans h₁) := sorry

/-- `π_{2∗}TC^{−(m)}(ku/ku) ≅ (q^m − 1)^⋆ ℤ[q]^∧_{(q^m−1)}` (and the odd homotopy vanishes). -/
theorem TCminusM.ku (m : ℕ) (hm : 0 < m) :
    RT4Q.IsEvenSpectrum (TCminusM cyclonicKu m) ∧
    ∀ i : ℤ, Nonempty ((TCminusM cyclonicKu m).homotopyGroup (2 * i) ≃+ RT4Q.adicReesPiece m i) :=
  sorry

/-- Test `TCminusM.m_one` (degenerate): `TC^{−(1)}(X) = X^{hS¹}`. -/
example (X : CyclonicSpectrum) :
    Nonempty (TCminusM X 1 ≅ homotopyFixedPoints (RT4Q.cyclonicUnderlying X)) := sorry

/-- Test `TCminusM.ku_pi0` (computation): `π_0 TC^{−(m)}(ku/ku) = ℤ[q]^∧_{(q^m−1)}`. -/
example (m : ℕ) (hm : 0 < m) :
    Nonempty ((TCminusM cyclonicKu m).homotopyGroup 0 ≃+ RT4Q.adicCompletionQ m) := sorry

/-- Test `TCminusM.not_TR` (non-example): there is no TR-type restriction map
`TC^{−(pm)} → TC^{−(m)}`; such a map would be the composite of
`TC^{−(p)}(ku) → (ku^{ΦC_p})^{hS¹}` with an identification `(ku^{ΦC_p})^{hS¹} ≃ TC^{−(1)}(ku)`, and
there is none. The limit in RT.4:Habiro-comparison is along the divisibility maps
`RT4Q.tcMinusMDivisorMap`. -/
example (p : ℕ) (hp : p.Prime) :
    ¬ Nonempty (homotopyFixedPoints (CyclonicSpectrum.geometricFixedPoints cyclonicKu p) ≅
      TCminusM cyclonicKu 1) := sorry

/-! ### RT.4:q-Hodge/cyclonic-even-filtrations -/

namespace RT4Q

/-- Cyclonic E₁-rings. -/
def CyclonicRing : Type := sorry

/-- The underlying cyclonic spectrum of a cyclonic ring. -/
def CyclonicRing.toCyclonic (Tr : CyclonicRing) : CyclonicSpectrum := sorry

/-- Cyclonic left modules over a cyclonic E₁-ring. -/
def CyclonicMod (Tr : CyclonicRing) : Type := sorry

/-- The underlying cyclonic spectrum of a cyclonic module. -/
def CyclonicMod.toCyclonic {Tr : CyclonicRing} (M : CyclonicMod Tr) : CyclonicSpectrum := sorry

/-- The zero cyclonic module. -/
def CyclonicMod.zero (Tr : CyclonicRing) : CyclonicMod Tr := sorry

/-- Cyclonic `ku_{S¹}` as a cyclonic E₁-ring (underlying `cyclonicKu`). -/
def cyclonicKuRing : CyclonicRing := sorry

/-- Cyclonic `ku` as a module over itself. -/
def cyclonicKuSelf : CyclonicMod cyclonicKuRing := sorry

/-- `THH(ku_R/ku_A)` with the modified cyclonic structure
`THH(S_R/S_A)^{cyct} ⊗_{S_A^{cyct}} S_A^{triv} ⊗ ku_{S¹}` (Wagner Definition 5.45; uses (A₂)). -/
def thhKuCyclonic (SA : EInftyRing) (SR : E1Ring) (f : SA.toE1 ⟶ SR) : CyclonicMod cyclonicKuRing :=
  sorry

/-- `THH(KU_R/KU_A)` with its cyclonic structure (tensored with `KU_{S¹}`). -/
def thhKUCyclonic (SA : EInftyRing) (SR : E1Ring) (f : SA.toE1 ⟶ SR) : CyclonicSpectrum := sorry

/-- Localisation at `β` (homotopical degree 2, filtration degree 1):
`X ⊗_{ku_ev^{C_m}} KU_ev^{C_m}`. -/
def betaLocalise (X : EvFilTMod) : EvFilTMod := sorry

end RT4Q

/-- The cyclonic even filtration `fil^⋆_{ev/T,C_m} M^{C_m}` of a cyclonic module `M` over a cyclonic
E₁-ring `T`, with its residual `(T/C_m)_ev`-action:
`eq(∏_{d|m}(fil^⋆_ev M^{ΦC_d})^{hC_{m/d},ev} ⇉ ∏_p ∏_{pd|m}((fil^⋆_ev M^{ΦC_d})^{tC_p,ev})^{hC_{m/pd},ev})`
with `fil^⋆_ev M^{ΦC_d} := fil^⋆_{P-ev/T^{ΦC_d}} M^{ΦC_d}`.
The primary cyclonicEvenFiltration below retains Wagner 5.46’s full hypotheses. Then
`fil^⋆_{ev,S¹}TC^{−(m)} := (fil^⋆_{ev,C_m} M^{C_m})^{h(T/C_m)_ev}`. -/
def cyclonicEvenFiltrationShadow (Tr : RT4Q.CyclonicRing) (M : RT4Q.CyclonicMod Tr) (m : ℕ) :
    RT4Q.EvFilTMod := sorry

/-- The `KU` version by `β`-localisation:
`fil^⋆_{ev,C_m}THH(KU_R/KU_A)^{C_m} := fil^⋆_{ev,C_m}THH(ku_R/ku_A)^{C_m} ⊗_{ku_ev^{C_m}} KU_ev^{C_m}`;
no fixed-point formula is applied to the unbounded `KU`-objects directly. -/
def cyclonicEvenFiltrationShadow.KU (SA : EInftyRing) (SR : E1Ring) (f : SA.toE1 ⟶ SR) (m : ℕ) :
    RT4Q.EvFilTMod :=
  RT4Q.betaLocalise (cyclonicEvenFiltrationShadow RT4Q.cyclonicKuRing (RT4Q.thhKuCyclonic SA SR f) m)

/-- For `m = 1` the cyclonic even filtration gives `fil_{ev,hS¹}TC⁻`. -/
theorem cyclonicEvenFiltrationShadow.m_one (A R : Type) [CommRing A] [CommRing R] [Algebra A R]
    (SA : EInftyRing) {n : ℕ} (L : SphericalLift SA R n)
    [RT4Q.CompatibleGlobalInput SA A R L] :
    Nonempty (evenCircleFixedPoints (cyclonicEvenFiltrationShadow RT4Q.cyclonicKuRing
        (RT4Q.thhKuCyclonic SA L.ring.toE1 L.structureMap) 1) ≅
      evenCircleFixedPoints (globalEvenFiltrationShadow A R SA L)) := sorry

/-- Test `cyclonicEvenFiltration.ku` (computation):
`fil_{ev,S¹}TC^{−(m)}(ku/ku) ≃ τ_{≥2⋆}((ku^{C_m})^{h(S¹/C_m)})`. -/
example (m : ℕ) (hm : 0 < m) :
    Nonempty (evenCircleFixedPoints (cyclonicEvenFiltrationShadow RT4Q.cyclonicKuRing
        RT4Q.cyclonicKuSelf m) ≅ RT4Q.doubleSpeed (TCminusM cyclonicKu m)) := sorry

/-- Test `cyclonicEvenFiltration.zero` (degenerate): the filtration of `0` is `0`. -/
example (Tr : RT4Q.CyclonicRing) (m : ℕ) :
    Nonempty (cyclonicEvenFiltrationShadow Tr (RT4Q.CyclonicMod.zero Tr) m ≅ RT4Q.EvFilTMod.zero) :=
  sorry

/-- Test `cyclonicEvenFiltration.no_direct_KU` (non-example): `THH(KU/KU) = KU` is not a
bounded-below cyclonic spectrum, so the bounded-below formula does not apply to it directly; the
`β`-localisation of the `ku` filtration is used instead. -/
example : ¬ RT4Q.cyclonicBoundedBelow
    (RT4Q.thhKUCyclonic RT4Q.sphereInfty RT4Q.sphereInfty.toE1 (𝟙 _)) := sorry

/-! ### RT.4:Habiro-comparison -/

namespace RT4Q

/-- The completed `m`-twisted q-Hodge filtration (Wagner 5.50), constructed from the q-Hodge
filtration of RT.4:q-Hodge/q-hodge-global. -/
def twistedQHodgeFiltration (m : ℕ) (A R : Type) [CommRing A] [CommRing R] [Algebra A R]
    (SA : EInftyRing) {n : ℕ} (L : SphericalLift SA R n) : FilSpectrum := sorry

/-- The derived q-de Rham–Witt complexes `q-W_m dR^i_{R/A}` (Wagner Corollary 5.58;
HabiroCohomologyFoundations HQ.3). -/
def qDeRhamWitt (m : ℕ) (A R : Type) [CommRing A] [CommRing R] [Algebra A R] (i : ℤ) :
    Spectrum := sorry

/-- The maps `Σ^{−2i}gr^i_{ev,S¹}TC^{−(m)}(KU_R/KU_A) → Σ^{−2i}gr^i_{ev,S¹}TC^{−(n)}(KU_R/KU_A)`
for `n ∣ m` (Remark 5.62). -/
def kuGrDivisorMap (SA : EInftyRing) (SR : E1Ring) (f : SA.toE1 ⟶ SR) (i : ℤ) {m n : ℕ}
    (h : n ∣ m) :
    (evenCircleFixedPoints (cyclonicEvenFiltrationShadow.KU SA SR f m)).grShift i ⟶
      (evenCircleFixedPoints (cyclonicEvenFiltrationShadow.KU SA SR f n)).grShift i := sorry

/-- The unit `S → S_R` of an E_∞-ring. -/
def unitInfty (S : EInftyRing) : sphereInfty ⟶ S := sorry

/-- Étale E_∞-algebras over a connective E_∞-ring `A` (Lurie, HA §7.5). -/
def EtaleEInftyAlg (A : EInftyRing) : Type := sorry

instance (A : EInftyRing) : Category.{0} (EtaleEInftyAlg A) := sorry

/-- The underlying E_∞-ring of an étale E_∞-`A`-algebra. -/
def EtaleEInftyAlg.ring {A : EInftyRing} (B : EtaleEInftyAlg A) : EInftyRing := sorry

/-- `π_0` of an E_∞-ring as a commutative ring. -/
def pi0Comm (A : EInftyRing) : Type := sorry

instance (A : EInftyRing) : CommRing (pi0Comm A) := sorry

/-- Étale algebras over a commutative ring `R` (Mathlib's `Algebra.Etale`). -/
structure EtaleAlg (R : Type) [CommRing R] where
  /-- The algebra. -/
  carrier : Type
  [commRing : CommRing carrier]
  [algebra : Algebra R carrier]
  /-- It is étale over `R`. -/
  etale : Algebra.Etale R carrier

instance (R : Type) [CommRing R] : Category.{0} (EtaleAlg R) := sorry

/-- The functor `B ↦ π_0 B`. -/
def pi0Functor (A : EInftyRing) : EtaleEInftyAlg A ⥤ EtaleAlg (pi0Comm A) := sorry

/-- `lim_m TC^{−(m)}(KU ⊗ S_R/KU)` as an E_∞-ring (regarded as an E₁-ring); its underlying spectrum
is the limit along the divisibility maps (`RT4Q.habiroTCRing_toSpectrum`). -/
def habiroTCRing (S : EInftyRing) : E1Ring := sorry

/-- The underlying spectrum of `RT4Q.habiroTCRing S` is `lim_m TC^{−(m)}(KU ⊗ S/KU)`. -/
theorem habiroTCRing_toSpectrum (S : EInftyRing) :
    Nonempty ((habiroTCRing S).toSpectrum ≅
      divisibilityLimit (fun m => TCminusM (thhKUCyclonic sphereInfty S.toE1 (toE1Map (unitInfty S))) m)
        (fun m n h => tcMinusMDivisorMap _ h)) := sorry

end RT4Q

/-- Lurie (HA Theorem 7.5.0.6): for a connective E_∞-ring `A`, `B ↦ π_0 B` is an equivalence from
étale E_∞-`A`-algebras to étale `π_0 A`-algebras. In particular every étale `ℤ`-algebra `R` has a
unique étale E_∞-`S`-algebra `S_R` with `S_R ⊗ ℤ ≃ R`. -/
theorem etaleEinftyLift (A : EInftyRing) (hA : RT4Q.IsConnectiveInfty A) :
    (RT4Q.pi0Functor A).IsEquivalence ∧
    ∀ (R : Type) [CommRing R] [Algebra.Etale ℤ R],
      ∃ B : RT4Q.EtaleEInftyAlg RT4Q.sphereInfty,
        Nonempty (RT4Q.smashInfty B.ring (EInftyRing.ofCommRing ℤ) ≅ EInftyRing.ofCommRing R) ∧
        ∀ B' : RT4Q.EtaleEInftyAlg RT4Q.sphereInfty,
          Nonempty (RT4Q.smashInfty B'.ring (EInftyRing.ofCommRing ℤ) ≅ EInftyRing.ofCommRing R) →
            Nonempty (B ≅ B') := sorry

/-- Wagner Corollary 6.15: for a number field `F`, `Δ` divisible by `6` and by `disc(F)`,
`R = O_F[1/Δ]` and `S_R` its unique étale E_∞-lift, the Habiro ring `H_{O_F[1/Δ]}` of
Garoufalidis–Scholze–Wheeler–Zagier is `π_0 lim_m TC^{−(m)}(KU ⊗ S_R/KU)`; the comparison goes
through HabiroRings HR.5's relative Habiro ring `H_{R/ℤ}` (and HR.6's degree-zero identification),
no new definition of the ring being made. -/
theorem numberFieldHabiro (F : Type) [Field F] [NumberField F] (Δ : ℕ) (h6 : 6 ∣ Δ)
    (hdisc : RT4Q.numberFieldDiscr F ∣ (Δ : ℤ)) (B : RT4Q.EtaleEInftyAlg RT4Q.sphereInfty)
    (hB : Nonempty (RT4Q.smashInfty B.ring (EInftyRing.ofCommRing ℤ) ≅
      EInftyRing.ofCommRing (Localization.Away (Δ : NumberField.RingOfIntegers F)))) :
    Nonempty (RT4Q.gswzHabiroRing F Δ ≃+* (RT4Q.habiroTCRing B.ring).pi0) ∧
    Nonempty (RT4Q.habiroRing (Localization.Away (Δ : NumberField.RingOfIntegers F)) ≃+*
      (RT4Q.habiroTCRing B.ring).pi0) := sorry

/-! ## R1/R2: derived mixed objects and cyclic coextensions -/
/-- Coherent derived localization D(Λ), supplied through the EDS E5 request. -/
def DerivedMixedComplex (k : Type) [CommRing k] : Coherent.InftyCategory := sorry

def DerivedMixedComplex.ofMixed {k : Type} [CommRing k] (M : MixedComplex k) :
    Coherent.Obj (DerivedMixedComplex k) := sorry

def DerivedMixedComplex.map {k : Type} [CommRing k] {M N : MixedComplex k} (f : M ⟶ N) :
    Coherent.Hom (DerivedMixedComplex.ofMixed M) (DerivedMixedComplex.ofMixed N) := sorry

theorem DerivedMixedComplex.inverts {k : Type} [CommRing k] {M N : MixedComplex k}
    (f : M ⟶ N) (hf : MixedComplex.QuasiIso f) : Coherent.IsEquiv (DerivedMixedComplex.map f) := sorry

/-- Tests DerivedMixedComplex.ground / DerivedMixedComplex.acyclic / DerivedMixedComplex.not_abelian_derived. -/
example (k : Type) [CommRing k] :
    ∃ M : MixedComplex k, Nonempty (M.X 0 ≅ ModuleCat.of k k) ∧
      ∀ n : ℤ, n ≠ 0 → Limits.IsZero (M.X n) := sorry
/-- Coherent zero object in the derived category. -/
def DerivedMixedComplex.zero (k : Type) [CommRing k] : Coherent.Obj (DerivedMixedComplex k) := sorry
/-- The zero mixed complex. -/
def MixedComplex.zero (k : Type) [CommRing k] : MixedComplex k := sorry
example {k : Type} [CommRing k] (M : MixedComplex k)
    (h : ∀ n : ℤ, Limits.IsZero ((RT1.bComplex M).homology n)) :
    ∃ f : M ⟶ MixedComplex.zero k, Coherent.IsEquiv (DerivedMixedComplex.map f) := sorry
example {k : Type} [CommRing k] {M N : MixedComplex k} (f : M ⟶ N)
    (hf : MixedComplex.QuasiIso f) : Coherent.IsEquiv (DerivedMixedComplex.map f) := sorry

/-- Precyclic modules: faces and cyclic operators, without degeneracy data. -/
def PrecyclicModule (k : Type) [CommRing k] : Type := sorry
instance (k : Type) [CommRing k] : Category.{0} (PrecyclicModule k) := sorry
/-- Forgetting degeneracies, keeping the precyclic structure. -/
def PrecyclicModule.ofCyclic (k : Type) [CommRing k] :
    CyclicObject (ModuleCat.{0} k) ⥤ PrecyclicModule k := sorry

def PrecyclicMixedCone (k : Type) [CommRing k] : PrecyclicModule k ⥤ MixedComplex k := sorry
abbrev PrecyclicMixedCone.map {k : Type} [CommRing k] {C D : PrecyclicModule k} (f : C ⟶ D) :=
  (PrecyclicMixedCone k).map f

def PrecyclicMixedCone.compare {k : Type} [CommRing k]
    (C : CyclicObject (ModuleCat.{0} k)) :
    (PrecyclicMixedCone k).obj ((PrecyclicModule.ofCyclic k).obj C) ⟶
      (MixedComplex.ofCyclic k).obj C := sorry

theorem PrecyclicMixedCone.compare_quasiIso {k : Type} [CommRing k]
    (C : CyclicObject (ModuleCat.{0} k)) : MixedComplex.QuasiIso (PrecyclicMixedCone.compare C) := sorry

/-- Tests PrecyclicMixedCone.unital / PrecyclicMixedCone.zero / PrecyclicMixedCone.corner. -/
example (k : Type) [CommRing k] :
    MixedComplex.QuasiIso (PrecyclicMixedCone.compare (CyclicBar k k)) := sorry
def PrecyclicModule.zero (k : Type) [CommRing k] : PrecyclicModule k := sorry
example (k : Type) [CommRing k] :
    ∀ n : ℤ, Limits.IsZero (((PrecyclicMixedCone k).obj (PrecyclicModule.zero k)).X n) := sorry
/-- Nonunital maps act on the modified cone without preserving degeneracies. -/
def PrecyclicModule.matrixCorner (k A : Type) [CommRing k] [Ring A] [Algebra k A]
    (r : ℕ) (hr : 0 < r) :
    (PrecyclicModule.ofCyclic k).obj (CyclicBar k A) ⟶
      (PrecyclicModule.ofCyclic k).obj (CyclicBar k (Matrix (Fin r) (Fin r) A)) := sorry
example (k A : Type) [CommRing k] [Ring A] [Algebra k A] (r : ℕ) (hr : 0 < r) :
    ∃ f : ((PrecyclicModule.ofCyclic k) ⋙ PrecyclicMixedCone k).obj (CyclicBar k A) ⟶
      ((PrecyclicModule.ofCyclic k) ⋙ PrecyclicMixedCone k).obj
        (CyclicBar k (Matrix (Fin r) (Fin r) A)),
      f = PrecyclicMixedCone.map (PrecyclicModule.matrixCorner k A r hr) := sorry

/-- An actually unbounded example. -/
def MixedComplex.allDegrees (k : Type) [CommRing k] : MixedComplex k where
  X _ := ModuleCat.of k k
  b _ := 0
  B _ := 0
  b_comp_b _ := by simp
  B_comp_B _ := by simp
  bB_add_Bb _ := by simp

/-- Test periodicCyclicHomology.laurent_bound: no infinitely many negative powers. -/
example (k : Type) [CommRing k] [Nontrivial k] :
    (fun _ : ℤ => (1 : k)) ∉ (MixedComplex.allDegrees k).laurentPieces 0 := sorry
/-- Nonnegative all-ones belongs to the Laurent piece; its lower bound is zero. -/
example (k : Type) [CommRing k] :
    (fun i : ℤ => if i < 0 then (0 : k) else 1) ∈
      (MixedComplex.allDegrees k).laurentPieces 0 := sorry
/-- Test cyclicHomology.sum_not_product: all-ones is not finitely supported. -/
example (k : Type) [CommRing k] [Nontrivial k] :
    ¬ Set.Finite {i : ℕ | (1 : k) ≠ 0} := sorry
/-- Test MixedComplex.negative_degree: the primary carrier has negative degrees. -/
example (k : Type) [CommRing k] :
    ∃ M : MixedComplex k, Nonempty ((RT1.bComplex M).homology (-1) ≅ ModuleCat.of k k) := sorry

namespace HochschildHomology
open scoped TensorProduct
/-- Component extraction of the completed negative cyclic map. -/
def cnLeading {k : Type} [CommRing k] (M : MixedComplex k) (n : ℤ) :
    M.negativeCyclicComplex.X n ⟶ M.X n := sorry
def cnFirst {k : Type} [CommRing k] (M : MixedComplex k) (n : ℤ) :
    M.negativeCyclicComplex.X n ⟶ M.X (n + 2) := sorry
def cnInjection {k : Type} [CommRing k] (M : MixedComplex k) (n : ℤ) :
    M.X n ⟶ M.negativeCyclicComplex.X n := sorry

/-- A cyclic coextension keeps its leading b-map, degree-two correction, and completed map.
The chain-map condition on completed includes (b+uB)-compatibility. -/
def bDegreeIso {k : Type} [CommRing k] (M : MixedComplex k) (n : ℤ) :
    (RT1.bComplex M).X n ≅ M.X n := sorry

structure CyclicShuffleData {k : Type} [CommRing k] (M N : MixedComplex k) where
  leading : RT1.bComplex M ⟶ RT1.bComplex N
  correction : ∀ n : ℤ, M.X n ⟶ N.X (n + 2)
  completed : M.negativeCyclicComplex ⟶ N.negativeCyclicComplex
  leadingAgreement : ∀ n : ℤ,
    cnInjection M n ≫ completed.f n ≫ cnLeading N n = (bDegreeIso M n).inv ≫ leading.f n ≫ (bDegreeIso N n).hom
  correctionAgreement : ∀ n : ℤ,
    cnInjection M n ≫ completed.f n ≫ cnFirst N n = correction n

def cyclicShuffle (k A A' : Type) [CommRing k] [Ring A] [Algebra k A]
    [Ring A'] [Algebra k A'] :
    CyclicShuffleData ((RT1.algMixed k A).tensor (RT1.algMixed k A'))
      (RT1.algMixed k (A ⊗[k] A')) := sorry

theorem cyclicShuffle.leading (k A A' : Type) [CommRing k] [Ring A] [Algebra k A]
    [Ring A'] [Algebra k A'] : (cyclicShuffle k A A').leading = shuffle k A A' := sorry

theorem cyclicShuffle.quasiIso (k A A' : Type) [CommRing k] [Ring A] [Algebra k A]
    [Ring A'] [Algebra k A'] [Module.Flat k A] [Module.Flat k A'] :
    _root_.QuasiIso (cyclicShuffle k A A').completed := sorry
/-- Test HochschildHomology.shuffle_not_B_map: the leading b-map alone is not the completed cyclic map. -/
example (k A A' : Type) [CommRing k] [Ring A] [Algebra k A] [Ring A'] [Algebra k A']
    (n : ℤ) : cnInjection _ n ≫ (cyclicShuffle k A A').completed.f n ≫ cnFirst _ n =
      (cyclicShuffle k A A').correction n := sorry
end HochschildHomology



/-! ## Finite synthetic cyclic norm and underlying comparison (R14)

AR24 Definition 2.61, Construction 2.63, Proposition 2.67 and Lemma 2.75.
SynT is Mod_{T_ev}(SynSp). The power-pullback algebra retains the residual circle
structure; the norm is finite-group duality, without the circle suspension.
-/
namespace SyntheticFiniteCyclic
open Coherent

def SynT : InftyCategory := sorry
def stable : StableStructure SynT := sorry
def forgetCircle : Functor SynT (Coherent.SpectraWithAction Coherent.Circle) := sorry
def underlyingSp : Functor SynT Sp := sorry
def powerPullbackAlgebra (n : ℕ) (hn : 0<n) : Type := sorry
/-- Tensor with ρ(n)^*T_ev over T_ev. -/
def orbits (n : ℕ) (hn : 0<n) : Functor SynT SynT := sorry
/-- Mapping out of ρ(n)^*T_ev over T_ev. -/
def fixed (n : ℕ) (hn : 0<n) : Functor SynT SynT := sorry
/-- Both adjoints retain the residual power-pullback algebra action. -/
def ResidualAction (n : ℕ) (hn : 0<n) (M : Obj SynT) : Type := sorry
def residual (n : ℕ) (hn : 0<n) (M : Obj SynT) : ResidualAction n hn M := sorry
/-- Finite duality norm: no Σ appears in its source. -/
def norm (n : ℕ) (hn : 0<n) (M : Obj SynT) :
    Hom ((orbits n hn).obj M) ((fixed n hn).obj M) := sorry

def tate (n : ℕ) (hn : 0<n) (M : Obj SynT) : Obj SynT :=
  Coherent.cofiber stable (norm n hn M)
/-- The coherent functor with the preceding object values. -/
def tateFunctor (n : ℕ) (hn : 0<n) : Functor SynT SynT := sorry
/-- Lax monoidal structure, including unit, tensor maps and coherence (E5). -/
def LaxMonoidalWitness (n : ℕ) (hn : 0<n) : Type := sorry
theorem laxMonoidal (n : ℕ) (hn : 0<n) : Nonempty (LaxMonoidalWitness n hn) := sorry
/-- Thick closure of modules induced from synthetic spectra, as in Definition 2.64. -/
def ThickInducedWitness (M : Obj SynT) : Type := sorry
theorem induced_zero (n : ℕ) (hn : 0<n) (M : Obj SynT)
    (hM : ThickInducedWitness M) :
    ∃ e : Hom (tate n hn M) (Coherent.zero SynT stable), IsEquiv e := sorry

/-- Finite cyclic classifying anima with its inclusion in B S¹ (E0). -/
def finiteCyclic (n : ℕ) (hn : 0<n) : GroupAnima := sorry
def restriction (n : ℕ) (hn : 0<n) :
    Functor (Coherent.SpectraWithAction Coherent.Circle) (Coherent.SpectraWithAction (finiteCyclic n hn)) := sorry

def orbitComparison (n : ℕ) (hn : 0<n) (M : Obj SynT) :
    Hom ((underlyingSp).obj ((orbits n hn).obj M))
      ((Coherent.homotopyOrbits (finiteCyclic n hn)).obj
        ((restriction n hn).obj (forgetCircle.obj M))) := sorry

def fixedComparison (n : ℕ) (hn : 0<n) (M : Obj SynT) :
    Hom (underlyingSp.obj ((fixed n hn).obj M))
      ((Coherent.homotopyFixedPoints (finiteCyclic n hn)).obj
        ((restriction n hn).obj (forgetCircle.obj M))) := sorry

/-- Homotopy groups and stage map of the underlying filtered spectrum (H.5). -/
def pi (X : Obj Sp) (j : ℤ) : ModuleCat.{0} ℤ := sorry
def stage (M : Obj SynT) (i : ℤ) : Obj Sp := sorry
def stageMap (M : Obj SynT) (i : ℤ) : Hom (stage M i) (underlyingSp.obj M) := sorry

def IsTruncated {X Y : Obj Sp} (f : Hom X Y) (i : ℤ) : Prop :=
  ∀ j : ℤ, i<j → Limits.IsZero (pi (Coherent.fiber RT3.spStable f) j)

def UniformTruncationBounds (M : Obj SynT) : Prop :=
  ∀ i : ℤ, IsTruncated (stageMap M i) i
/-- Even E∞ base B and a coherent module over B[S¹]_ev (AR24 2.75(v)). -/
def EvenBaseModuleWitness (M : Obj SynT) : Type := sorry
def DoubleTruncationBounds (M : Obj SynT) : Prop :=
  ∀ i : ℤ, IsTruncated (stageMap M i) (2*i)

theorem underlying_orbits (n : ℕ) (hn : 0<n) (M : Obj SynT) :
    IsEquiv (orbitComparison n hn M) := sorry

theorem underlying (n : ℕ) (hn : 0<n) (M : Obj SynT)
    (h : UniformTruncationBounds M) : IsEquiv (fixedComparison n hn M) := sorry

theorem underlying_evenBase (n : ℕ) (hn : 0<n) (M : Obj SynT)
    (hB : EvenBaseModuleWitness M) (h : DoubleTruncationBounds M) :
    IsEquiv (fixedComparison n hn M) := sorry

/-- Test SyntheticFiniteCyclic.one. -/
example (M : Obj SynT) : IsEquiv (norm 1 (by decide) M) ∧
    ∃ e : Hom (tate 1 (by decide) M) (Coherent.zero SynT stable), IsEquiv e := sorry
/-- Test SyntheticFiniteCyclic.induced. -/
example (n : ℕ) (hn : 0<n) (M : Obj SynT) (hM : ThickInducedWitness M) :
    ∃ e : Hom (tate n hn M) (Coherent.zero SynT stable), IsEquiv e := sorry
/-- Test SyntheticFiniteCyclic.no_shift: the circle norm has source ΣM_{S¹}. -/
def circleOrbits (M : Obj SynT) : Obj SynT := sorry
def circleFixed (M : Obj SynT) : Obj SynT := sorry
def circleNorm (M : Obj SynT) :
    Hom ((Coherent.shift SynT stable 1).obj (circleOrbits M)) (circleFixed M) := sorry
example (n : ℕ) (hn : 0<n) (M : Obj SynT) :
    Nonempty (Hom ((orbits n hn).obj M) ((fixed n hn).obj M)) := ⟨norm n hn M⟩
/-- Test SyntheticFiniteCyclic.whitehead: double Whitehead over an even base
has the bounds; identifying finite fixed-point Whitehead also requires even M. -/
def doubleWhitehead (B : Obj Sp) (M : Obj Sp) : Obj SynT := sorry
def EvenRingWitness (B : Obj Sp) : Type := sorry
def EvenModuleWitness (B M : Obj Sp) : Type := sorry
example (B M : Obj Sp) (hB : EvenRingWitness B) (hM : EvenModuleWitness B M)
    (n : ℕ) (hn : 0<n) : DoubleTruncationBounds (doubleWhitehead B M) ∧
      IsEquiv (fixedComparison n hn (doubleWhitehead B M)) := sorry
end SyntheticFiniteCyclic

/-! ## Snaith construction and graded Laurent HKR (R10–R11) -/
namespace RT4T
/-- E∞ ring Σ∞_+K(Z,2), with multiplication from tensor product of line bundles. -/
def sigmaCPInfinity : EInftyRing := sorry
def sigmaCPBott : pi sigmaCPInfinity 2 := sorry
/-- Theorem 6.5.1 of Elliptic Cohomology II. -/
def snaithModel : EInftyRing.invert sigmaCPInfinity sigmaCPBott ≅ KU := sorry
/-- Multiplication by k on K(Z,2), before Bott inversion. -/
def snaithPower (k : ℕ) : sigmaCPInfinity ⟶ sigmaCPInfinity := sorry
theorem snaithPower.bott (k : ℕ) :
    piMap (snaithPower k) 2 sigmaCPBott = k • sigmaCPBott := sorry
/-- After k is inverted, kβ is a unit, so E∞ localization extends the power map. -/
def snaithAdams (k : ℕ) (hk : 1≤k) :
    EInftyRing.invertInt KU k ⟶ EInftyRing.invertInt KU k := sorry
/-- Identifies the localized construction with the previously named stable operation. -/
theorem snaithAdams.agrees (k : ℕ) (hk : 1≤k) :
    snaithAdams k hk = _root_.RefinedTraceMethods.KU.adams k := sorry
/-- Test RT4T.snaithAdams.one. -/
example : snaithAdams 1 (by decide) = 𝟙 _ := sorry
/-- Test RT4T.snaithAdams.bott. -/
example : piMap (snaithAdams 2 (by decide)) 2 (KU.bottInv 2) = 2 • KU.bottInv 2 := sorry
/-- Test RT4T.snaithAdams.integral_obstruction. -/
example : ¬ ∃ f : KU ⟶ KU, piMap f 2 KU.bott = 2 • KU.bott := sorry

/-- Polynomial graded HKR model: β^j is in degree 2j and β^jσβ in degree 2j+3.
All other chain groups vanish. Bβ^j=jβ^{j−1}σβ, including B1=0. -/
def gradedPolynomialMixed : MixedComplex ℚ where
  X n := if (Even n ∧ 0≤n) ∨ (Odd n ∧ 3≤n) then ModuleCat.of ℚ ℚ
    else ModuleCat.of ℚ (Fin 0 → ℚ)
  b _ := 0
  B n := if h : Even n ∧ 2≤n then by
    have hs : Odd (n+1) ∧ 3≤n+1 := sorry
    have ha : (Even n ∧ 0≤n) ∨ (Odd n ∧ 3≤n) := Or.inl ⟨h.1, by omega⟩
    have hb : (Even (n+1) ∧ 0≤n+1) ∨ (Odd (n+1) ∧ 3≤n+1) := Or.inr hs
    simpa only [ite_eq_left ha, ite_eq_left hb] using
      (((n / 2 : ℤ) : ℚ) • (𝟙 (ModuleCat.of ℚ ℚ)))
    else 0
  b_comp_b := sorry
  B_comp_B := sorry
  bB_add_Bb := sorry
/-- Rational ku cyclic bar, under the characteristic-zero graded-dg comparison. -/
def rationalKuBarMixed : MixedComplex ℚ := sorry
theorem gradedPolynomialHKR :
    ∃ e : Coherent.Hom (DerivedMixedComplex.ofMixed rationalKuBarMixed)
      (DerivedMixedComplex.ofMixed gradedPolynomialMixed), Coherent.IsEquiv e := sorry
/-- Negative polynomial degrees vanish, in contrast to the Laurent model. -/
example : Limits.IsZero (gradedPolynomialMixed.X (-2)) ∧
    Limits.IsZero (gradedPolynomialMixed.X 1) := sorry
/-- β contributes in degree 2 and its nonzero Connes image σβ in degree 3. -/
example : Nonempty (gradedPolynomialMixed.X 2 ≅ ModuleCat.of ℚ ℚ) ∧
    Nonempty (gradedPolynomialMixed.X 3 ≅ ModuleCat.of ℚ ℚ) ∧
    gradedPolynomialMixed.B 2 ≠ 0 := sorry

/-- In each integer degree the basis is β^j (degree 2j) or β^jδ (degree 2j+1).
The operators are b=0 and B(β^j)=jβ^jδ, B(β^jδ)=0. -/
def gradedLaurentMixed : MixedComplex ℚ where
  X _ := ModuleCat.of ℚ ℚ
  b _ := 0
  B n := if Even n then ((n / 2 : ℤ) : ℚ) • 𝟙 _ else 0
  b_comp_b := sorry
  B_comp_B := sorry
  bB_add_Bb := sorry
/-- Characteristic-zero dg model Q[β^{±1}], |β|=2 (EDS E5/DD.0). -/
def rationalKUBarMixed : MixedComplex ℚ := sorry
/-- Quasi-isomorphism via the graded diagonal Koszul resolution, with B=d. -/
theorem gradedLaurentHKR :
    ∃ e : Coherent.Hom (DerivedMixedComplex.ofMixed rationalKUBarMixed)
      (DerivedMixedComplex.ofMixed gradedLaurentMixed), Coherent.IsEquiv e := sorry
/-- Negative powers are present, with the expected nonzero Connes operator. -/
example : gradedLaurentMixed.B (-2) = (-1 : ℚ) • 𝟙 (ModuleCat.of ℚ ℚ) ∧
    gradedLaurentMixed.B (-1) = 0 := sorry
/-- Bβ=βδ in homological degree 3: absolute KU_Q has a nontrivial circle action. -/
example : gradedLaurentMixed.B 2 = 𝟙 (ModuleCat.of ℚ ℚ) := sorry

/-- Test representability on S⁰, retaining the rank component. -/
example : NondegenerateBasepoint (sphere 0) (sphere.base 0) ∧
    Nonempty (TopK.reduced (sphere 0) (sphere.base 0) ≃+ ℤ) ∧
    Nonempty (pointedHomotopyClasses (sphere 0) (ℤ × BU) (sphere.base 0) (0,BU.base) ≃ ℤ) ∧
    Subsingleton (pointedHomotopyClasses (sphere 0) BU (sphere.base 0) BU.base) := sorry
end RT4T

/-! ## Structured lift examples (R15) -/
namespace RT4Q
abbrev ZInvertTwo := Localization.Away (2 : ℤ)
/-- Localization of the spherical base, compatible with every p-adic branch. -/
def sphericalInvertTwo : EInftyRing := sorry
/-- Test RT4Q.CompatibleSphericalLifts.invert_two: at p=2 the completion is zero. -/
example : Nonempty (CompatibleSphericalLifts sphericalInvertTwo ZInvertTwo ZInvertTwo) ∧
    Nonempty (CyclonicBaseCoherence sphericalInvertTwo) := sorry
/-- Test RT4Q.CyclonicBaseCoherence.invert_two: the unit test for Theorem 5.63 is in scope. -/
example : IsUnit (2 : ZInvertTwo) := sorry
/-- Test RT4Q.CompatibleSphericalLifts.polynomial: the lifted toric Čech reductions exist. -/
example : Nonempty (CompatibleSphericalLifts sphereInfty ℤ ℤ[X]) := sorry
/-- Test RT4Q.CompatibleSphericalLifts.not_arbitrary: an E₁ ku lift carries different data. -/
example (p : ℕ) [Fact p.Prime] :
    ∃ (K : E1Ring) (f : ku.toE1 ⟶ K), Nonempty (kuReduction K f ≅
      E1Ring.ofRing (wagnerQuotientRing p)) ∧
      ¬ Nonempty (modBeta (kuLiftFiltration K f) ≅
        hodgeFiltration ℤ_[p] (wagnerQuotientRing p)) := sorry
/-- Test RT4Q.CyclonicBaseCoherence.toric: ψ^m(x)=x^m for the spherical torus. -/
def sphericalTorus : EInftyRing := sorry
def torusCoordinate : sphericalTorus.toE1.pi0 := sorry
def toricAdamsModel (C : CyclonicBaseCoherence sphericalTorus) (m : ℕ) :
    sphericalTorus.toE1.pi0 →+* sphericalTorus.toE1.pi0 := sorry
example : ∃ C : CyclonicBaseCoherence sphericalTorus, ∀ m : ℕ, 0<m →
    toricAdamsModel C m torusCoordinate = torusCoordinate^m := sorry
end RT4Q

/-! ## Coherent genuine coalgebra model -/
namespace Coherent
/-- Genuine C_{p∞} spectra supplied by RT.2/genuine-cyclic-and-circle-spectra. -/
def GenuinePInftySp (p : ℕ) (hp : p.Prime) : InftyCategory := sorry
def geometricP (p : ℕ) (hp : p.Prime) :
    Functor (GenuinePInftySp p hp) (GenuinePInftySp p hp) := sorry
abbrev GenuineCyclotomicSpectrum (p : ℕ) (hp : p.Prime) := Endofunctor.Fix (geometricP p hp)
def GenuineCyclotomicSpectrum.underlying (p : ℕ) (hp : p.Prime) :
    Functor (GenuineCyclotomicSpectrum p hp) Sp := sorry
/-- Coalgebra coreflection with equivalence on underlying nonequivariant spectra. -/
def genuineCoreflection (p : ℕ) (hp : p.Prime) :
    Functor (Endofunctor.CoAlg (geometricP p hp)) (GenuineCyclotomicSpectrum p hp) := sorry
def genuineInclusion (p : ℕ) (hp : p.Prime) :
    Functor (GenuineCyclotomicSpectrum p hp) (Endofunctor.CoAlg (geometricP p hp)) :=
  Endofunctor.inclusion (geometricP p hp)
def genuineForget (p : ℕ) (hp : p.Prime) :
    Functor (Endofunctor.CoAlg (geometricP p hp)) Sp := sorry
theorem genuineCoreflection.adjunction (p : ℕ) (hp : p.Prime) :
    Nonempty (Adjunction (genuineInclusion p hp) (genuineCoreflection p hp)) := sorry
/-- The counit of that coherent adjunction, not an unrelated inhabited type. -/
def genuineCoreflection.counit (p : ℕ) (hp : p.Prime)
    (X : Obj (Endofunctor.CoAlg (geometricP p hp))) :
    Hom ((genuineInclusion p hp).obj ((genuineCoreflection p hp).obj X)) X := sorry
/-- NS18 II.5.6: this counit is an equivalence after forgetting to spectra. -/
theorem genuineCoreflection.underlying (p : ℕ) (hp : p.Prime)
    (X : Obj (Endofunctor.CoAlg (geometricP p hp))) :
    IsEquiv ((genuineForget p hp).map (genuineCoreflection.counit p hp X)) := sorry
end Coherent

/-! ## Global primary interfaces use the specified compatible inputs (R15).

The shadow constructors are used only inside signatures comparing models.
These entry points consume the actual arithmetic-gluing choices. -/

def globalEvenFiltration (A R : Type) [CommRing A] [CommRing R] [Algebra A R]
    (SA : EInftyRing) (G : RT4Q.CompatibleSphericalLifts SA A R) : RT4Q.EvFilTMod := by
  letI := G.globalInput
  exact globalEvenFiltrationShadow A R SA G.glue

def globalEvenFiltration.profinite (A R : Type) [CommRing A] [CommRing R] [Algebra A R]
    (SA : EInftyRing) (G : RT4Q.CompatibleSphericalLifts SA A R) :
    (globalEvenFiltration A R SA G).underlying ⟶
      RT4Q.profiniteThhEven SA G.glue.ring.toE1 G.glue.structureMap := sorry

def globalEvenFiltration.rational (A R : Type) [CommRing A] [CommRing R] [Algebra A R]
    (SA : EInftyRing) (G : RT4Q.CompatibleSphericalLifts SA A R) :
    (globalEvenFiltration A R SA G).underlying ⟶ RT4Q.rationalHHBeta A R := sorry

def globalComparison (A R : Type) [CommRing A] [CommRing R] [Algebra A R]
    (SA : EInftyRing) (G : RT4Q.CompatibleSphericalLifts SA A R) :
    RT4Q.qDeRham A R ⟶ (evenCircleFixedPoints (globalEvenFiltration A R SA G)).gr 0 := by
  letI := G.globalInput
  exact globalComparisonShadow A R SA G.glue

/-- Test `globalEvenFiltration.identity_base`: an identified identity lift gives the
relative coefficient object with its trivial circle action. -/
example (A : Type) [CommRing A] (SA : EInftyRing)
    (G : RT4Q.CompatibleSphericalLifts SA A A)
    (hidentity : IsIso G.glue.structureMap) :
    Nonempty ((RT4Q.thhKu SA G.glue.ring.toE1 G.glue.structureMap).underlying ≅
      (RT4Q.sp (RT4Q.kuBase SA))) := sorry

namespace RT4Q

def globalQHodgeFiltration (A R : Type) [CommRing A] [CommRing R] [Algebra A R]
    (SA : EInftyRing) (G : CompatibleSphericalLifts SA A R) : FilSpectrum := by
  letI := G.globalInput
  exact globalQHodgeFiltrationShadow A R SA G.glue

/-- Complex orientation data for an E₁ ring, owned by H.5/H.6. -/
def ComplexOrientation (R : E1Ring) : Type := sorry
def geometricRing (Tr : CyclonicRing) (d : ℕ) (hd : 0<d) : E1Ring := sorry
def geometricFixedRing (Tr : CyclonicRing) (d p : ℕ) (hd : 0<d)
    (hp : p.Prime) : E1Ring := sorry
/-- (M^{ΦC_d})^{hC_p} over (T^{ΦC_d})^{hC_p}, as a coherent spectral module. -/
def geometricFixedModule {Tr : CyclonicRing} (M : CyclonicMod Tr)
    (d p : ℕ) (hd : 0<d) (hp : p.Prime) : LMod (geometricFixedRing Tr d p hd hp) := sorry

structure CyclonicEvenHypotheses (Tr : CyclonicRing) (M : CyclonicMod Tr) where
  ringBounded : cyclonicBoundedBelow Tr.toCyclonic
  moduleBounded : cyclonicBoundedBelow M.toCyclonic
  orientations : ∀ (d : ℕ) (hd : 0<d), ComplexOrientation (geometricRing Tr d hd)
  homologicalEven : ∀ (d p : ℕ) (hd : 0<d) (hp : p.Prime),
    IsHomologicallyEven (geometricFixedModule M d p hd hp)

end RT4Q

/-- Wagner 5.46: the bounded, complex-orientable, homologically even range. -/
def cyclonicEvenFiltration (Tr : RT4Q.CyclonicRing) (M : RT4Q.CyclonicMod Tr)
    (h : RT4Q.CyclonicEvenHypotheses Tr M) (m : ℕ) (hm : 0<m) : RT4Q.EvFilTMod :=
  cyclonicEvenFiltrationShadow Tr M m

namespace RT4Q
/-- Model comparison for the A₂-base-changed cyclonic module. -/
def correctedThhKuCyclonic {SA : EInftyRing} (C : CyclonicBaseCoherence SA)
    (SR : E1Ring) (f : SA.toE1 ⟶ SR) : CyclonicMod cyclonicKuRing := sorry

def correctedThhKUCyclonic {SA : EInftyRing} (C : CyclonicBaseCoherence SA)
    (SR : E1Ring) (f : SA.toE1 ⟶ SR) : CyclonicSpectrum := sorry
end RT4Q

/-- Construct bounded ku first, and only then invert β. -/
def cyclonicEvenFiltration.KU {SA : EInftyRing} (C : RT4Q.CyclonicBaseCoherence SA)
    (SR : E1Ring) (f : SA.toE1 ⟶ SR)
    (h : RT4Q.CyclonicEvenHypotheses RT4Q.cyclonicKuRing
      (RT4Q.correctedThhKuCyclonic C SR f)) (m : ℕ) (hm : 0<m) : RT4Q.EvFilTMod :=
  RT4Q.betaLocalise (cyclonicEvenFiltration RT4Q.cyclonicKuRing
    (RT4Q.correctedThhKuCyclonic C SR f) h m hm)

/-- The strong comparison signature retains the gluing input and A₂ data and
identifies the actual corrected cyclonic module, rather than an arbitrary ψ list. -/
theorem twistedQHodgeComparison (A R : Type) [CommRing A] [CommRing R] [Algebra A R]
    (SA : EInftyRing) (G : RT4Q.CompatibleSphericalLifts SA A R)
    (C : RT4Q.CyclonicBaseCoherence SA) (h2 : IsUnit (2:R))
    (h : RT4Q.CyclonicEvenHypotheses RT4Q.cyclonicKuRing
      (RT4Q.correctedThhKuCyclonic C G.glue.ring.toE1 G.glue.structureMap))
    (m : ℕ) (hm : 0<m) :
    Nonempty ((RT4Q.twistedQHodgeFiltration m A R SA G.glue).completion ≅
      RT4Q.evenRegraded (evenCircleFixedPoints (cyclonicEvenFiltration RT4Q.cyclonicKuRing
        (RT4Q.correctedThhKuCyclonic C G.glue.ring.toE1 G.glue.structureMap) h m hm))) ∧
    (∀ i : ℤ, Nonempty ((cyclonicEvenFiltration RT4Q.cyclonicKuRing
      (RT4Q.correctedThhKuCyclonic C G.glue.ring.toE1 G.glue.structureMap) h m hm).underlying.grShift i ≅
        RT4Q.qDeRhamWitt m A R i)) ∧
    (∀ i : ℤ, Nonempty ((TCminusM cyclonicKu m).homotopyGroup (2*i) ≃+
      RT4Q.adicReesPiece m i)) := sorry

/-- Corrected divisor maps include A₂ and the coherent residual actions. -/
def correctedKuGrDivisorMap {SA : EInftyRing} (C : RT4Q.CyclonicBaseCoherence SA)
    (SR : E1Ring) (f : SA.toE1 ⟶ SR)
    (h : RT4Q.CyclonicEvenHypotheses RT4Q.cyclonicKuRing
      (RT4Q.correctedThhKuCyclonic C SR f)) (i : ℤ)
    (m n : ℕ) (hm : 0<m) (hn : 0<n) (hd : n∣m) :
    (evenCircleFixedPoints (cyclonicEvenFiltration.KU C SR f h m hm)).grShift i ⟶
      (evenCircleFixedPoints (cyclonicEvenFiltration.KU C SR f h n hn)).grShift i := sorry
/-- The positive divisor diagram, with identity/composition and higher coherence (E0). -/
def RT4Q.DivisorDiagramCoherence (X : (n : ℕ) → 0<n → Spectrum)
    (maps : ∀ (m n : ℕ) (hm : 0<m) (hn : 0<n) (_ : n∣m), X m hm ⟶ X n hn) : Type := sorry
/-- Coherent inverse limit on the positive divisor category, supplied by E0. -/
def positiveDivisorLimit (X : (n : ℕ) → 0<n → Spectrum)
    (maps : ∀ (m n : ℕ) (hm : 0<m) (hn : 0<n) (_ : n∣m), X m hm ⟶ X n hn)
    (coherence : RT4Q.DivisorDiagramCoherence X maps) : Spectrum := sorry


namespace Coherent
open scoped Simplicial
/-- Coherent natural mapping Kan complex, supplied by E0. -/
def NaturalMap {C D : InftyCategory} (F G : Functor C D) : SSet.{0} := sorry
instance {C D : InftyCategory} (F G : Functor C D) : SSet.KanComplex (NaturalMap F G) := sorry
abbrev NaturalHom {C D : InftyCategory} (F G : Functor C D) : Type := (NaturalMap F G) _⦋0⦌
/-- Homotopy equivalence data for a Kan-space map, supplied by E0. -/
def SpaceEquivalenceWitness {K L : SSet.{0}} (f : K ⟶ L) : Type := sorry
/-- All filtered-diagram comparisons, with their canonical maps (E0). -/
def FilteredColimitPreservation {C D : InftyCategory} (F : Functor C D) : Type := sorry

structure DerivativeContext where
  source : InftyCategory
  target : InftyCategory
  sourceStable : StableStructure source
  targetStable : StableStructure target
  sourcePresentable : PresentabilityWitness source
  targetPresentable : PresentabilityWitness target

/-- Raskin 2.3: reduce, iterate ΩψΣ, and take the coherent sequential colimit. -/
def GoodwillieDerivative (P : DerivativeContext) (ψ : Functor P.source P.target)
    (hψ : IsSiftedColimitPreserving ψ) : Functor P.source P.target := sorry

def GoodwillieDerivative.unit (P : DerivativeContext) (ψ : Functor P.source P.target)
    (hψ : IsSiftedColimitPreserving ψ) : NaturalHom ψ (GoodwillieDerivative P ψ hψ) := sorry
/-- Precomposition with the unit, as a map of mapping spaces. -/
def GoodwillieDerivative.precompose (P : DerivativeContext) (ψ : Functor P.source P.target)
    (hψ : IsSiftedColimitPreserving ψ) (L : Functor P.source P.target) :
    NaturalMap (GoodwillieDerivative P ψ hψ) L ⟶ NaturalMap ψ L := sorry

/-- Initial among continuous exact functors under ψ. Continuous means preserving
filtered colimits; both cocompleteness and the sifted-colimit assumption remain visible. -/
theorem GoodwillieDerivative.universal (P : DerivativeContext) (ψ : Functor P.source P.target)
    (hψ : IsSiftedColimitPreserving ψ) :
    Nonempty (ExactnessWitness (GoodwillieDerivative P ψ hψ)) ∧
    Nonempty (FilteredColimitPreservation (GoodwillieDerivative P ψ hψ)) ∧
    ∀ (L : Functor P.source P.target) (_ : ExactnessWitness L)
      (_ : FilteredColimitPreservation L),
      Nonempty (SpaceEquivalenceWitness (GoodwillieDerivative.precompose P ψ hψ L)) := sorry

theorem GoodwillieDerivative.exact (P : DerivativeContext) (ψ : Functor P.source P.target)
    (hψ : IsSiftedColimitPreserving ψ) (hExact : ExactnessWitness ψ) :
    Nonempty (NaturalEquivalence (GoodwillieDerivative P ψ hψ) ψ) := sorry
/-- Variant 2.3.2: truncate the source before stabilization. The double colimit,
not suspension of an arbitrary pointed category, extends from the connective part. -/
def GoodwillieDerivative.connective (P : DerivativeContext) (t : TStructure P.source)
    (ht : FilteredTCompatibility t) (ψ : Functor (ConnectivePart t) P.target)
    (hψ : IsSiftedColimitPreserving ψ) : Functor P.source P.target := sorry
def GoodwillieDerivative.connectivePrecompose (P : DerivativeContext) (t : TStructure P.source)
    (ht : FilteredTCompatibility t) (ψ : Functor (ConnectivePart t) P.target)
    (hψ : IsSiftedColimitPreserving ψ) (L : Functor P.source P.target) :
    NaturalMap (GoodwillieDerivative.connective P t ht ψ hψ) L ⟶
      NaturalMap ψ (ConnectivePart.inclusion t ≫ L) := sorry

theorem GoodwillieDerivative.connectiveUniversal (P : DerivativeContext) (t : TStructure P.source)
    (ht : FilteredTCompatibility t) (ψ : Functor (ConnectivePart t) P.target)
    (hψ : IsSiftedColimitPreserving ψ) :
    Nonempty (ColimitPreservation (GoodwillieDerivative.connective P t ht ψ hψ)) ∧
    ∀ (L : Functor P.source P.target) (_ : ColimitPreservation L),
      Nonempty (SpaceEquivalenceWitness
        (GoodwillieDerivative.connectivePrecompose P t ht ψ hψ L)) := sorry

def zeroFunctor (P : DerivativeContext) : Functor P.source P.target := sorry
theorem zeroFunctor.sifted (P : DerivativeContext) : IsSiftedColimitPreserving (zeroFunctor P) := sorry
/-- Test Coherent.GoodwillieDerivative.zero: the derivative of zero is zero. -/
example (P : DerivativeContext) : Nonempty (NaturalEquivalence
    (GoodwillieDerivative P (zeroFunctor P) (zeroFunctor.sifted P)) (zeroFunctor P)) := sorry
/-- Test Coherent.GoodwillieDerivative.linear: continuous exact input is unchanged. -/
example (P : DerivativeContext) (ψ : Functor P.source P.target)
    (hψ : IsSiftedColimitPreserving ψ) (hExact : ExactnessWitness ψ) :
    Nonempty (NaturalEquivalence (GoodwillieDerivative P ψ hψ) ψ) := sorry
/-- Test Coherent.GoodwillieDerivative.continuity: the universal property quantifies
only over continuous exact L; finite excision alone supplies no such witness. -/
example (P : DerivativeContext) (ψ : Functor P.source P.target)
    (hψ : IsSiftedColimitPreserving ψ) (L : Functor P.source P.target)
    (hL : ExactnessWitness L) (hCont : FilteredColimitPreservation L) :
    Nonempty (SpaceEquivalenceWitness (GoodwillieDerivative.precompose P ψ hψ L)) :=
  (GoodwillieDerivative.universal P ψ hψ).2.2 L hL hCont
end Coherent

/-- Wagner 5.61: completeness uses the compatible lifts and corrected A₂ module. -/
theorem cyclonicEvenFiltration.complete (A R : Type) [CommRing A] [CommRing R] [Algebra A R]
    (SA : EInftyRing) (G : RT4Q.CompatibleSphericalLifts SA A R)
    (C : RT4Q.CyclonicBaseCoherence SA) (h2 : IsUnit (2:R))
    (h : RT4Q.CyclonicEvenHypotheses RT4Q.cyclonicKuRing
      (RT4Q.correctedThhKuCyclonic C G.glue.ring.toE1 G.glue.structureMap)) (m : ℕ) (hm : 0<m) :
    (evenCircleFixedPoints (cyclonicEvenFiltration.KU C G.glue.ring.toE1 G.glue.structureMap h m hm)).IsComplete ∧
    (evenCircleFixedPoints (cyclonicEvenFiltration.KU C G.glue.ring.toE1 G.glue.structureMap h m hm)).IsExhaustiveFor
      (TCminusM (RT4Q.correctedThhKUCyclonic C G.glue.ring.toE1 G.glue.structureMap) m) := sorry

/-- Theorem 5.63, with the actual positive-divisor diagram and compatible lift data. -/
theorem habiroComparisonTheorem (A R : Type) [CommRing A] [CommRing R] [Algebra A R]
    (SA : EInftyRing) (G : RT4Q.CompatibleSphericalLifts SA A R)
    (C : RT4Q.CyclonicBaseCoherence SA) (h2 : IsUnit (2:R))
    (h : RT4Q.CyclonicEvenHypotheses RT4Q.cyclonicKuRing
      (RT4Q.correctedThhKuCyclonic C G.glue.ring.toE1 G.glue.structureMap)) (i : ℤ)
    (coherence : RT4Q.DivisorDiagramCoherence
      (fun m hm => (evenCircleFixedPoints
        (cyclonicEvenFiltration.KU C G.glue.ring.toE1 G.glue.structureMap h m hm)).grShift i)
      (correctedKuGrDivisorMap C G.glue.ring.toE1 G.glue.structureMap h i)) :
    Nonempty (RT4Q.habiroHodgeComplex A R ≅ positiveDivisorLimit
      (fun m hm => (evenCircleFixedPoints
        (cyclonicEvenFiltration.KU C G.glue.ring.toE1 G.glue.structureMap h m hm)).grShift i)
      (correctedKuGrDivisorMap C G.glue.ring.toE1 G.glue.structureMap h i) coherence) := sorry


/-- Wagner’s m=1 identification uses the actual corrected relative cyclonic module. -/
theorem cyclonicEvenFiltration.m_one (A R : Type) [CommRing A] [CommRing R] [Algebra A R]
    (SA : EInftyRing) (G : RT4Q.CompatibleSphericalLifts SA A R)
    (C : RT4Q.CyclonicBaseCoherence SA)
    (h : RT4Q.CyclonicEvenHypotheses RT4Q.cyclonicKuRing
      (RT4Q.correctedThhKuCyclonic C G.glue.ring.toE1 G.glue.structureMap)) :
    Nonempty (evenCircleFixedPoints (cyclonicEvenFiltration RT4Q.cyclonicKuRing
      (RT4Q.correctedThhKuCyclonic C G.glue.ring.toE1 G.glue.structureMap) h 1 (by decide)) ≅
      evenCircleFixedPoints (globalEvenFiltration A R SA G)) := sorry

namespace RT3
/-- Test RT3.pseudoExtensible.zero. -/
example (P : PseudoContext) : IsPseudoExtensible P (zeroPseudo P) := sorry
/-- Test RT3.pseudoExtensible.linear. -/
example (P : PseudoContext) (ψ : PseudoFunctor P) (hlin : LinearityWitness P ψ)
    (hcolim : Coherent.ColimitPreservation ψ)
    (hconn : ∀ X, P.targetT.connective (ψ.obj X)) : IsPseudoExtensible P ψ := sorry
end RT3

namespace HochschildHomology
open scoped TensorProduct
/-- B of the leading shuffle minus the shuffle of tensor B, before taking homology. -/
def shuffleBDifference (k A A' : Type) [CommRing k] [Ring A] [Algebra k A]
    [Ring A'] [Algebra k A'] (n : ℤ) :
    ((RT1.algMixed k A).tensor (RT1.algMixed k A')).X n ⟶
      (RT1.algMixed k (A ⊗[k] A')).X (n+1) := sorry
/-- Test HochschildHomology.shuffle_not_B_map: already polynomial inputs over Q
have a nonzero chain-level mismatch; the cyclic correction compensates for it. -/
example : ∃ n : ℤ, shuffleBDifference ℚ (Polynomial ℚ) (Polynomial ℚ) n ≠ 0 := sorry
end HochschildHomology
/-- Test PrecyclicMixedCone.corner: the rank-two corner fails to send 1 to 1. -/
example : Matrix.single (0 : Fin 2) (0 : Fin 2) (1 : ℚ) ≠
    (1 : Matrix (Fin 2) (Fin 2) ℚ) := sorry
/-- The trivial Λ-module k in the unbounded derived category (EDS E5). -/
def DerivedMixedComplex.trivialModule (k : Type) [CommRing k] :
    Coherent.Obj (DerivedMixedComplex k) := sorry
/-- Test DerivedMixedComplex.ground: the localization of the cyclic unit is k. -/
example (k : Type) [CommRing k] : ∃ f : Coherent.Hom
    (DerivedMixedComplex.ofMixed ((MixedComplex.ofCyclic k).obj (CyclicBar k k)))
    (DerivedMixedComplex.trivialModule k), Coherent.IsEquiv f := sorry

/-! ### Routed CMM item 033: full graded de Rham–Witt/TR comparison -/
namespace RT2W
open scoped DirectSum
/-- CR.4 supplies finite de Rham–Witt forms, including degree zero Witt vectors. -/
def forms (p : ℕ) [Fact p.Prime] (R : Type) [CommRing R] (s n : ℕ) : Type := sorry
instance (p : ℕ) [Fact p.Prime] (R : Type) [CommRing R] (s n : ℕ) :
    AddCommGroup (forms p R s n) := sorry
/-- Degree n of W_s Ω_R^*[σ_s], with |σ_s|=2: a finite direct sum. -/
abbrev polynomialPiece (p : ℕ) [Fact p.Prime] (R : Type) [CommRing R] (s n : ℕ) :=
  ⨁ a : {a : ℕ // 2*a ≤ n}, forms p R s (n-2*a.1)
abbrev polynomialGraded (p : ℕ) [Fact p.Prime] (R : Type) [CommRing R] (s : ℕ) :=
  ⨁ n : ℕ, polynomialPiece p R s n
/-- Graded multiplication uses the Witt wedge product and addition of σ exponents. -/
instance (p : ℕ) [Fact p.Prime] (R : Type) [CommRing R] (s : ℕ) :
    DirectSum.GRing (polynomialPiece p R s) := sorry
abbrev trGraded (p : ℕ) [Fact p.Prime] (R : Type) [CommRing R] (s : ℕ) :=
  ⨁ n : ℕ, (TR p (RT2G.genuineTHHp p R) s).homotopyGroup (n : ℤ)
instance (p : ℕ) [Fact p.Prime] (R : Type) [CommRing R] (s : ℕ) :
    DirectSum.GRing (fun n : ℕ => (TR p (RT2G.genuineTHHp p R) s).homotopyGroup (n : ℤ)) := sorry
/-- Restriction sends σ_{s+2} to pσ_{s+1}, after compatible normalization. -/
def polynomialRestriction (p : ℕ) [Fact p.Prime] (R : Type) [CommRing R] (s : ℕ) :
    polynomialGraded p R (s+2) →+* polynomialGraded p R (s+1) := sorry
def trRestriction (p : ℕ) [Fact p.Prime] (R : Type) [CommRing R] (s : ℕ) :
    trGraded p R (s+1) →+* trGraded p R s := sorry
/-- CR.4's inverse restriction limit of forms, graded by form degree. -/
def infiniteForms (p : ℕ) [Fact p.Prime] (R : Type) [CommRing R] (n : ℕ) : Type := sorry
instance (p : ℕ) [Fact p.Prime] (R : Type) [CommRing R] (n : ℕ) :
    AddCommGroup (infiniteForms p R n) := sorry
abbrev infiniteGraded (p : ℕ) [Fact p.Prime] (R : Type) [CommRing R] :=
  ⨁ n : ℕ, infiniteForms p R n
instance (p : ℕ) [Fact p.Prime] (R : Type) [CommRing R] :
    DirectSum.GRing (infiniteForms p R) := sorry
abbrev trLimitGraded (p : ℕ) [Fact p.Prime] (R : Type) [CommRing R] :=
  ⨁ n : ℕ, (RT2G.TRlim p (RT2G.genuineTHHp p R)).homotopyGroup (n : ℤ)
instance (p : ℕ) [Fact p.Prime] (R : Type) [CommRing R] :
    DirectSum.GRing (fun n : ℕ => (RT2G.TRlim p (RT2G.genuineTHHp p R)).homotopyGroup (n : ℤ)) := sorry
/-- Frobenius operators in the two infinite graded rings. -/
def formsFrobenius (p : ℕ) [Fact p.Prime] (R : Type) [CommRing R] :
    infiniteGraded p R →+* infiniteGraded p R := sorry
def limitFrobenius (p : ℕ) [Fact p.Prime] (R : Type) [CommRing R] :
    trLimitGraded p R →+* trLimitGraded p R := sorry
/-- The comparison preserves each total homological degree, not just the underlying ring. -/
def PreservesDegrees (p : ℕ) [Fact p.Prime] (R : Type) [CommRing R] (s : ℕ)
    (e : polynomialGraded p R (s+1) ≃+* trGraded p R s) : Prop :=
  ∀ n x, x ∈ (DirectSum.of (polynomialPiece p R (s+1)) n).range ↔
    e x ∈ (DirectSum.of (fun n : ℕ =>
      (TR p (RT2G.genuineTHHp p R) s).homotopyGroup (n : ℤ)) n).range
/-- The infinite comparison also preserves form degree. -/
def PreservesLimitDegrees (p : ℕ) [Fact p.Prime] (R : Type) [CommRing R]
    (e : infiniteGraded p R ≃+* trLimitGraded p R) : Prop :=
  ∀ n x, x ∈ (DirectSum.of (infiniteForms p R) n).range ↔
    e x ∈ (DirectSum.of (fun n : ℕ =>
      (RT2G.TRlim p (RT2G.genuineTHHp p R)).homotopyGroup (n : ℤ)) n).range
/-- Node RT.2/tr-de-rham-witt-hkr. Index s in TR is level s+1. -/
theorem hesselholtHKR (p : ℕ) [Fact p.Prime] (R : Type) [CommRing R]
    [Algebra (ZMod p) R] [Algebra.Smooth (ZMod p) R] :
    ∃ e : ∀ s : ℕ, polynomialGraded p R (s+1) ≃+* trGraded p R s,
      (∀ s, PreservesDegrees p R s (e s)) ∧
      (∀ s x, trRestriction p R s (e (s+1) x) =
        e s (polynomialRestriction p R s x)) ∧
      ∃ eLimit : infiniteGraded p R ≃+* trLimitGraded p R,
        PreservesLimitDegrees p R eLimit ∧
        ∀ x, limitFrobenius p R (eLimit x) = eLimit (formsFrobenius p R x) := sorry
/-- CMM's ind-smooth extension uses finite-level colimits and the specific restriction tower. -/
def IndSmoothWitness (p : ℕ) [Fact p.Prime] (R : Type) [CommRing R]
    [Algebra (ZMod p) R] : Type := sorry
theorem hesselholtHKR_indSmooth (p : ℕ) [Fact p.Prime] (R : Type) [CommRing R]
    [Algebra (ZMod p) R] (h : IndSmoothWitness p R) :
    (∀ s : ℕ, Nonempty (polynomialGraded p R (s+1) ≃+* trGraded p R s)) ∧
    Nonempty (infiniteGraded p R ≃+* trLimitGraded p R) := sorry
/-- Finite TR has Bott classes which do not survive its restriction limit. -/
example (p : ℕ) [Fact p.Prime] (s : ℕ) :
    Nonempty ((TR p (RT2G.genuineTHHp p (ZMod p)) s).homotopyGroup 2 ≃+ ZMod (p^(s+1))) ∧
    Subsingleton ((RT2G.TRlim p (RT2G.genuineTHHp p (ZMod p))).homotopyGroup 2) := sorry
end RT2W

/-! ### Routed LMMT item 49: the finite-action Tate quotient -/
namespace Coherent.TateQuotient
/-- H.5/K.4 supply coherent Perf and tensor structures; EDS E5 supplies the quotient. -/
def perf (R : EInftyRing) : Coherent.InftyCategory := sorry
def finiteAction (R : EInftyRing) (p : ℕ) (hp : p.Prime) : Coherent.InftyCategory := sorry
/-- The thick induced ideal is Perf(R[C_p]), included fully in finiteAction. -/
def inducedIdeal (R : EInftyRing) (p : ℕ) (hp : p.Prime) : Coherent.InftyCategory := sorry
def inducedInclusion (R : EInftyRing) (p : ℕ) (hp : p.Prime) :
    Coherent.Functor (inducedIdeal R p hp) (finiteAction R p hp) := sorry
def quotient (R : EInftyRing) (p : ℕ) (hp : p.Prime) : Coherent.InftyCategory := sorry
def trivialUnit (R : EInftyRing) (p : ℕ) (hp : p.Prime) : Coherent.Obj (quotient R p hp) := sorry
/-- Endomorphism E∞ ring of that unit, not the quotient's object set. -/
def endUnit (R : EInftyRing) (p : ℕ) (hp : p.Prime) : EInftyRing := sorry
/-- Exact symmetric monoidal refinement of a specific coherent functor, supplied by EDS. -/
def ExactTensorRefinement {C D : Coherent.InftyCategory} (F : Coherent.Functor C D) : Type := sorry
/-- K.6 supplies the nonconnective K spectrum of a coherent stable category. -/
def k (C : Coherent.InftyCategory) : Spectrum := sorry
/-- K.6's multiplicative refinement, used for the module structure. -/
def kRing (R : EInftyRing) : EInftyRing := sorry
def UnderlyingModuleEquivalence (R : EInftyRing) (M : RT4Q.LMod R.toE1) (X : Spectrum) : Type := sorry
/-- Node RT.2/tate-verdier-quotient. Commutativity supplies the tensor conclusion. -/
theorem end_tate (R : EInftyRing) (p : ℕ) (hp : p.Prime) :
    Nonempty (endUnit R p hp ≅ RT4T.EInftyRing.tCp R p) ∧
    (∃ F : Coherent.Functor (perf (RT4T.EInftyRing.tCp R p)) (quotient R p hp),
      Nonempty (ExactTensorRefinement F)) ∧
    ∃ M : RT4Q.LMod (kRing (RT4T.EInftyRing.tCp R p)).toE1,
      Nonempty (UnderlyingModuleEquivalence _ M (k (quotient R p hp))) := sorry
end Coherent.TateQuotient

end RefinedTraceMethods
