/-
This file is not the roadmap and is not exhaustive. The roadmap document is
 definitive. These statements suggest Lean forms so that contributors and
 reviewers converge on names and signatures. No declaration is an implementation.

Only this follow-up's thirteen nodes are owned here; three name consumed API
facts of the extension construction. ImportedH0 is a
standalone signature adapter for the accepted H0 carrier; it must be replaced by
that carrier, not implemented a second time. Suppliers contains data-valued
signatures for the exact requests in the packet. The étale D⁺/D carriers below
are the existing Mathlib carriers. Missing perfect-constructible, ULA and
oriented-product categories are explicit supplier types, not arbitrary
proposition fields. Their inclusions must be the full subcategory inclusions.

Prototype boundary: the supplied constructible category includes bounded-below
input; the bounded-output refinement remains a mathematical contract. Equivariance of
quadruple exchange, continuous action coherence, enhanced equivalence, and the
cohomological uniform bound are specified in the packet and reader; the current
signature adapter does not encode them. Do not replace these missing conditions
with an unconstrained Prop. The public finite-presentation statements do not
close the inherited locally finite type target.
-/

import Mathlib.AlgebraicGeometry.Sites.AffineEtale
import Mathlib.AlgebraicGeometry.Fiber
import Mathlib.AlgebraicGeometry.Morphisms.FinitePresentation
import Mathlib.AlgebraicGeometry.Morphisms.FiniteType
import Mathlib.AlgebraicGeometry.ValuativeCriterion
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Homology.DerivedCategory.Plus
import Mathlib.CategoryTheory.Equivalence
import Mathlib.CategoryTheory.Limits.Shapes.ZeroObjects
import Mathlib.CategoryTheory.Products.Basic
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.FieldTheory.IsSepClosed
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.Localization.AtPrime.Basic
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.RingTheory.Flat.Basic
import Mathlib.RingTheory.Noetherian.Defs
import Mathlib.RingTheory.Valuation.ValuationRing
import Mathlib.Data.ZMod.Basic

open CategoryTheory CategoryTheory.Limits AlgebraicGeometry Opposite
open scoped ZeroObject
universe u

namespace TauCeti.AlgebraicGeometry.ValuationNearby
noncomputable section

variable (Λ : Type u) [CommRing Λ]

-- Imported EDC.0 notation, realized using existing Mathlib rather than a new D.
abbrev EtaleModules (X : Scheme.{u}) := Sheaf X.smallEtaleTopology (ModuleCat.{u} Λ)
instance (X : Scheme.{u}) : Abelian (EtaleModules Λ X) := inferInstance
instance (X : Scheme.{u}) : HasDerivedCategory (EtaleModules Λ X) :=
  HasDerivedCategory.standard _
instance : HasDerivedCategory (ModuleCat.{u} Λ) := HasDerivedCategory.standard _
abbrev EtalePlus (X : Scheme.{u}) := DerivedCategory.Plus (EtaleModules Λ X)
abbrev EtaleDerived (X : Scheme.{u}) := DerivedCategory (EtaleModules Λ X)
abbrev ModulePlus := DerivedCategory.Plus (ModuleCat.{u} Λ)

namespace Suppliers
-- SF.2: these are the actual functors attached to f, with their adjunction.
def pullback {X Y : Scheme.{u}} (f : Y ⟶ X) : EtalePlus Λ X ⥤ EtalePlus Λ Y := by sorry
def pushforward {X Y : Scheme.{u}} (f : Y ⟶ X) : EtalePlus Λ Y ⥤ EtalePlus Λ X := by sorry
def adjunction {X Y : Scheme.{u}} (f : Y ⟶ X) :
    pullback Λ f ⊣ pushforward Λ f := by sorry
def exchange {X Y X' Y' : Scheme.{u}} (f : Y ⟶ X) (f' : Y' ⟶ X')
    (g : X' ⟶ X) (h : Y' ⟶ Y) (w : h ≫ f = f' ≫ g) :
    pushforward Λ f ⋙ pullback Λ g ⟶ pullback Λ h ⋙ pushforward Λ f' := by sorry

-- LPV.0, proposed early general-base Part II prefix: coherent oriented site.
def OrientedModules (Λ : Type u) [CommRing Λ] {X S : Scheme.{u}} (f : X ⟶ S) : Type (u + 1) := by sorry
instance {X S : Scheme.{u}} (f : X ⟶ S) :
    Category.{u + 1} (OrientedModules Λ f) := by sorry
instance {X S : Scheme.{u}} (f : X ⟶ S) : Abelian (OrientedModules Λ f) := by sorry
instance {X S : Scheme.{u}} (f : X ⟶ S) :
    HasDerivedCategory (OrientedModules Λ f) := HasDerivedCategory.standard _
abbrev OrientedPlus {X S : Scheme.{u}} (f : X ⟶ S) :=
  DerivedCategory.Plus (OrientedModules Λ f)
def orientedNearby {X S : Scheme.{u}} (f : X ⟶ S) :
    EtalePlus Λ X ⥤ OrientedPlus Λ f := by sorry
def orientedPullback {X S T : Scheme.{u}} (f : X ⟶ S) (h : T ⟶ S) :
    OrientedPlus Λ f ⥤ OrientedPlus Λ (pullback.snd f h) := by sorry
def orientedExchange {X S T : Scheme.{u}} (f : X ⟶ S) (h : T ⟶ S) :
    orientedNearby Λ f ⋙ orientedPullback Λ f h ⟶
      pullback Λ (CategoryTheory.Limits.pullback.fst f h) ⋙
        orientedNearby Λ (CategoryTheory.Limits.pullback.snd f h) := by sorry

-- EDC.0 additions: actual full subcategories of the imported D⁺, with the
-- Hansen–Scholze perfect-stratification convention on qcqs schemes.
def ConstructibleBounded (Λ : Type u) [CommRing Λ] (X : Scheme.{u}) : Type (u + 1) := by sorry
instance (X : Scheme.{u}) : Category.{u + 1} (ConstructibleBounded Λ X) := by sorry
def constructibleInclusion (X : Scheme.{u}) :
    ConstructibleBounded Λ X ⥤ EtalePlus Λ X := by sorry
def ConstructiblePlus (Λ : Type u) [CommRing Λ] (X : Scheme.{u}) : Type (u + 1) := by sorry
instance (X : Scheme.{u}) : Category.{u + 1} (ConstructiblePlus Λ X) := by sorry
def constructiblePlusInclusion (X : Scheme.{u}) :
    ConstructiblePlus Λ X ⥤ EtalePlus Λ X := by sorry
def PerfectConstructible (Λ : Type u) [CommRing Λ] (X : Scheme.{u}) : Type (u + 1) := by sorry
instance (X : Scheme.{u}) : Category.{u + 1} (PerfectConstructible Λ X) := by sorry
instance (X : Scheme.{u}) : HasZeroObject (PerfectConstructible Λ X) := by sorry
def pcInclusion (X : Scheme.{u}) : PerfectConstructible Λ X ⥤ EtalePlus Λ X := by sorry
-- Actual restriction of perfect-constructible objects; its inclusion commutes
-- canonically with pullback, as required of the EDC.0 supplier.
def pcPullback {X Y : Scheme.{u}} (g : Y ⟶ X) :
    PerfectConstructible Λ X ⥤ PerfectConstructible Λ Y := by sorry
abbrev pcInclusionD (X : Scheme.{u}) : PerfectConstructible Λ X ⥤ EtaleDerived Λ X :=
  pcInclusion Λ X ⋙ DerivedCategory.Plus.ι (C := EtaleModules Λ X)

-- SF.2: full subcategory of perfect-constructible SCHEME ULA objects for f.
-- Prove HS4.1 first for ambient correspondence dualizability, then use HS4.4
-- to identify this category with geometric ULA. HS4.4 is not an early input.
def ULACategory (Λ : Type u) [CommRing Λ] {X S : Scheme.{u}} (f : X ⟶ S) : Type (u + 1) := by sorry
instance {X S : Scheme.{u}} (f : X ⟶ S) : Category.{u + 1} (ULACategory Λ f) := by sorry
instance {X S : Scheme.{u}} (f : X ⟶ S) : HasZeroObject (ULACategory Λ f) := by sorry
def ulaInclusion {X S : Scheme.{u}} (f : X ⟶ S) :
    ULACategory Λ f ⥤ EtalePlus Λ X := by sorry

-- These are the actual generic fibre and its projection, using existing limits.
abbrev genericBaseMap (V : Type u) [CommRing V] [IsDomain V] :
    Spec (CommRingCat.of (FractionRing V)) ⟶ Spec (CommRingCat.of V) :=
  Spec.map (CommRingCat.ofHom (algebraMap V (FractionRing V)))
abbrev genericFiber {V : Type u} [CommRing V] [IsDomain V]
    {X : Scheme.{u}} (f : X ⟶ Spec (CommRingCat.of V)) :=
  CategoryTheory.Limits.pullback f (genericBaseMap V)
abbrev genericInclusion {V : Type u} [CommRing V] [IsDomain V]
    {X : Scheme.{u}} (f : X ⟶ Spec (CommRingCat.of V)) : genericFiber f ⟶ X :=
  CategoryTheory.Limits.pullback.fst f (genericBaseMap V)
def genericRestriction {V : Type u} [CommRing V] [IsDomain V]
    {X : Scheme.{u}} (f : X ⟶ Spec (CommRingCat.of V)) :
    ULACategory Λ f ⥤ PerfectConstructible Λ (genericFiber f) := by sorry

def OrientedConstructible (Λ : Type u) [CommRing Λ] {X S : Scheme.{u}} (f : X ⟶ S) : Type (u + 1) := by sorry
instance {X S : Scheme.{u}} (f : X ⟶ S) :
    Category.{u + 1} (OrientedConstructible Λ f) := by sorry
def orientedConstructibleInclusion {X S : Scheme.{u}} (f : X ⟶ S) :
    OrientedConstructible Λ f ⥤ OrientedPlus Λ f := by sorry
end Suppliers

namespace ImportedH0
-- Adapter for the EXISTING H0 node, not a second owned definition/API.
structure Quadruple where
  V : Type u
  [commRing : CommRing V]
  [domain : IsDomain V]
  [valuation : ValuationRing V]
  η : PrimeSpectrum V
  s : PrimeSpectrum V
  specializes : η ⤳ s
  X : Scheme.{u}
  f : X ⟶ Spec (CommRingCat.of V)
  henselian : HenselianLocalRing (Localization.AtPrime s.asIdeal)
  sepClosed : IsSepClosed (IsLocalRing.ResidueField (Localization.AtPrime s.asIdeal))
attribute [instance] Quadruple.commRing Quadruple.domain Quadruple.valuation
  Quadruple.henselian Quadruple.sepClosed
abbrev residueEta (Q : Quadruple.{u}) :=
  IsLocalRing.ResidueField (Localization.AtPrime Q.η.asIdeal)
abbrev residueSpecial (Q : Quadruple.{u}) :=
  IsLocalRing.ResidueField (Localization.AtPrime Q.s.asIdeal)

-- H0 strict localization, supplied by the actual strict-henselization owner.
def strictLocalization (Q : Quadruple.{u}) (L : Type u) [Field L]
    [Algebra (residueEta Q) L] [IsSepClosure (residueEta Q) L] : Scheme.{u} := by sorry
def strictLocalizationMap (Q : Quadruple.{u}) (L : Type u) [Field L]
    [Algebra (residueEta Q) L] [IsSepClosure (residueEta Q) L] :
    strictLocalization Q L ⟶ Spec (CommRingCat.of Q.V) := by sorry
abbrev tubeInclusion (Q : Quadruple.{u}) (L : Type u) [Field L]
    [Algebra (residueEta Q) L] [IsSepClosure (residueEta Q) L] :=
  CategoryTheory.Limits.pullback.fst Q.f (strictLocalizationMap Q L)
abbrev nearby (Q : Quadruple.{u}) (L : Type u) [Field L]
    [Algebra (residueEta Q) L] [IsSepClosure (residueEta Q) L] :
    EtalePlus Λ Q.X ⥤ EtalePlus Λ (Q.f.fiber Q.s) :=
  Suppliers.pullback Λ (tubeInclusion Q L) ⋙
    Suppliers.pushforward Λ (tubeInclusion Q L) ⋙ Suppliers.pullback Λ (Q.f.fiberι Q.s)
def shred (Q : Quadruple.{u}) (L : Type u) [Field L]
    [Algebra (residueEta Q) L] [IsSepClosure (residueEta Q) L] :
    Suppliers.OrientedPlus Λ Q.f ⥤ EtalePlus Λ (Q.f.fiber Q.s) := by sorry

def residueEtaMap {Q Q' : Quadruple.{u}} (h : Q.V →+* Q'.V)
    (hη : Q.η.asIdeal = Q'.η.asIdeal.comap h) : residueEta Q →+* residueEta Q' :=
  IsLocalRing.ResidueField.map (Localization.localRingHom Q.η.asIdeal Q'.η.asIdeal h hη)
structure Hom (Q' : Quadruple.{u}) (L' : Type u) [Field L']
    [Algebra (residueEta Q') L'] (Q : Quadruple.{u}) (L : Type u) [Field L]
    [Algebra (residueEta Q) L] where
  h : Q.V →+* Q'.V
  g : Q'.X ⟶ Q.X
  comm : g ≫ Q.f = Q'.f ≫ Spec.map (CommRingCat.ofHom h)
  mapη : Q.η.asIdeal = Q'.η.asIdeal.comap h
  maps : Q.s.asIdeal = Q'.s.asIdeal.comap h
  ι : L →+* L'
  ι_comp : ι.comp (algebraMap (residueEta Q) L) =
    (algebraMap (residueEta Q') L').comp (residueEtaMap h mapη)

def specialMap {Q Q' : Quadruple.{u}} {L L' : Type u} [Field L] [Field L']
    [Algebra (residueEta Q) L] [Algebra (residueEta Q') L'] (φ : Hom Q' L' Q L) :
    Q'.f.fiber Q'.s ⟶ Q.f.fiber Q.s := by sorry
def nearbyExchange {Q Q' : Quadruple.{u}} {L L' : Type u} [Field L] [Field L']
    [Algebra (residueEta Q) L] [Algebra (residueEta Q') L']
    [IsSepClosure (residueEta Q) L] [IsSepClosure (residueEta Q') L']
    (φ : Hom Q' L' Q L) :
    nearby Λ Q L ⋙ Suppliers.pullback Λ (specialMap φ) ⟶
      Suppliers.pullback Λ φ.g ⋙ nearby Λ Q' L' := by sorry
end ImportedH0

-- New comparison, Lu–Zheng Lemma 4.1 / Remark 4.2(a), pp. 26–27.
def orientedShred_identification (Q : ImportedH0.Quadruple.{u}) (L : Type u) [Field L]
    [Algebra (ImportedH0.residueEta Q) L] [IsSepClosure (ImportedH0.residueEta Q) L] :
    Suppliers.orientedNearby Λ Q.f ⋙ ImportedH0.shred Λ Q L ≅
      ImportedH0.nearby Λ Q L := by sorry

-- New theorem, Lu–Zheng Example 4.26(2), p. 37. No hypothesis on h.
theorem valuation_universalPsiGoodness (V : Type u) [CommRing V] [IsDomain V]
    [ValuationRing V] (n : ℕ) (hn : 0 < n) (hΛ : (n : Λ) = 0) (hV : IsUnit (n : V))
    {X T : Scheme.{u}} (f : X ⟶ Spec (CommRingCat.of V))
    (h : T ⟶ Spec (CommRingCat.of V)) (F : EtalePlus Λ X) :
    IsIso ((Suppliers.orientedExchange Λ f h).app F) := by sorry

-- The actual imported β; dominance and flatness are deliberately absent.
-- Galois action/equivariance remains the explicit H0 carrier obligation.
theorem valuation_cartesianBaseChange {Q Q' : ImportedH0.Quadruple.{u}}
    {L L' : Type u} [Field L] [Field L']
    [Algebra (ImportedH0.residueEta Q) L] [Algebra (ImportedH0.residueEta Q') L']
    [IsSepClosure (ImportedH0.residueEta Q) L] [IsSepClosure (ImportedH0.residueEta Q') L']
    (φ : ImportedH0.Hom Q' L' Q L)
    (hcart : IsPullback φ.g Q'.f Q.f (Spec.map (CommRingCat.ofHom φ.h)))
    (n : ℕ) (hn : 0 < n) (hΛ : (n : Λ) = 0)
    (hs : IsUnit (n : ImportedH0.residueSpecial Q)) (F : EtalePlus Λ Q.X) :
    IsIso ((ImportedH0.nearbyExchange Λ φ).app F) := by sorry

namespace Suppliers
-- Actual geometric points and strict-local specialization diagrams, for the
-- universal Milnor comparison. No unverified 'cohomologically proper' field.
structure GeometricPoint (T : Scheme.{u}) where
  Ω : Type u
  [field : Field Ω]
  [sepClosed : IsSepClosed Ω]
  map : Spec (CommRingCat.of Ω) ⟶ T
attribute [instance] GeometricPoint.field GeometricPoint.sepClosed

def pointLocalization {T : Scheme.{u}} (a : GeometricPoint T) : Scheme.{u} := by sorry
def pointLocalizationMap {T : Scheme.{u}} (a : GeometricPoint T) :
    pointLocalization a ⟶ T := by sorry
structure Specialization {T : Scheme.{u}} (a b : GeometricPoint T) where
  lift : pointLocalization b ⟶ pointLocalization a
  comm : lift ≫ pointLocalizationMap a = pointLocalizationMap b

def milnorTube {X T : Scheme.{u}} (f : X ⟶ T)
    (x : GeometricPoint X) (a b : GeometricPoint T) (sp : Specialization a b)
    (ι : a.Ω →+* x.Ω)
    (hx : x.map ≫ f = Spec.map (CommRingCat.ofHom ι) ≫ a.map)
    (F : EtalePlus Λ X) : ModulePlus Λ := by sorry
def milnorFibre {X T : Scheme.{u}} (f : X ⟶ T)
    (x : GeometricPoint X) (a b : GeometricPoint T) (sp : Specialization a b)
    (ι : a.Ω →+* x.Ω)
    (hx : x.map ≫ f = Spec.map (CommRingCat.ofHom ι) ≫ a.map)
    (F : EtalePlus Λ X) : ModulePlus Λ := by sorry
-- The actual restriction of cohomology along b → T_(b), not a chosen iso.
def milnorRestriction {X T : Scheme.{u}} (f : X ⟶ T)
    (x : GeometricPoint X) (a b : GeometricPoint T) (sp : Specialization a b)
    (ι : a.Ω →+* x.Ω)
    (hx : x.map ≫ f = Spec.map (CommRingCat.ofHom ι) ≫ a.map)
    (F : EtalePlus Λ X) :
    milnorTube Λ f x a b sp ι hx F ⟶ milnorFibre Λ f x a b sp ι hx F := by sorry

end Suppliers

-- Bounded constructible ℤ/n input retained from Orgogozo v1 Th. 5.1.
-- Encoding Λ=ℤ/n by a ring equivalence avoids a fabricated torsion predicate.
theorem valuation_universalMilnorComparison (V : Type u) [CommRing V] [IsDomain V]
    [ValuationRing V] (n : ℕ) (hn : 0 < n) (hV : IsUnit (n : V))
    (coeff : Λ ≃+* ZMod n) {X T : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of V)) [LocallyOfFinitePresentation f] [QuasiCompact f] [QuasiSeparated f]
    (h : T ⟶ Spec (CommRingCat.of V))
    (x : Suppliers.GeometricPoint (CategoryTheory.Limits.pullback f h))
    (a b : Suppliers.GeometricPoint T) (sp : Suppliers.Specialization a b)
    (ι : a.Ω →+* x.Ω)
    (hx : x.map ≫ CategoryTheory.Limits.pullback.snd f h =
      Spec.map (CommRingCat.ofHom ι) ≫ a.map)
    (F : Suppliers.ConstructibleBounded Λ X) :
    IsIso (Suppliers.milnorRestriction Λ (CategoryTheory.Limits.pullback.snd f h)
      x a b sp ι hx ((Suppliers.pullback Λ (CategoryTheory.Limits.pullback.fst f h)).obj
        ((Suppliers.constructibleInclusion Λ X).obj F))) := by sorry

-- D⁺_c input, as in Lu–Zheng 4.27(2); bounded input remains in the Milnor node.
theorem valuation_orientedConstructibility (V : Type u) [CommRing V] [IsDomain V]
    [ValuationRing V] [IsNoetherianRing Λ] (n : ℕ) (hn : 0 < n)
    (hΛ : (n : Λ) = 0) (hV : IsUnit (n : V))
    {X : Scheme.{u}} (f : X ⟶ Spec (CommRingCat.of V)) [LocallyOfFinitePresentation f] [QuasiCompact f] [QuasiSeparated f]
    (F : Suppliers.ConstructiblePlus Λ X) :
    ∃ G : Suppliers.OrientedConstructible Λ f,
      Nonempty ((Suppliers.orientedConstructibleInclusion Λ f).obj G ≅
        (Suppliers.orientedNearby Λ f).obj ((Suppliers.constructiblePlusInclusion Λ X).obj F)) := by
  sorry

section AIC
def aicGenericExtensionEquivalence
    (V : Type u) [CommRing V] [IsDomain V] [ValuationRing V]
    [IsAlgClosed (FractionRing V)] [IsNoetherianRing Λ]
    (ℓ r : ℕ) (hℓ : ℓ.Prime) (hr : 0 < r)
    (hΛ : (ℓ ^ r : Λ) = 0) (hV : IsUnit (ℓ : V))
    {X : Scheme.{u}} (f : X ⟶ Spec (CommRingCat.of V))
    [IsSeparated f] [LocallyOfFinitePresentation f] [QuasiCompact f] [QuasiSeparated f] :
    Suppliers.ULACategory Λ f ≌ Suppliers.PerfectConstructible Λ (Suppliers.genericFiber f) := by
  sorry

variable (V : Type u) [CommRing V] [IsDomain V] [hval : ValuationRing V]
  [haic : IsAlgClosed (FractionRing V)] [hnoeth : IsNoetherianRing Λ]
  (ℓ r : ℕ) (hℓ : ℓ.Prime) (hr : 0 < r)
  (hΛ : (ℓ ^ r : Λ) = 0) (hV : IsUnit (ℓ : V))
  {X : Scheme.{u}} (f : X ⟶ Spec (CommRingCat.of V))
  [hsep : IsSeparated f] [hfp : LocallyOfFinitePresentation f] [hqc : QuasiCompact f] [hqs : QuasiSeparated f]

include hval haic hnoeth hℓ hr hΛ hV hsep hfp hqc hqs

-- The one new construction. Its inverse is identified with Rj* by the API below.
local notation "e" => aicGenericExtensionEquivalence Λ V ℓ r hℓ hr hΛ hV f
local notation "j" => Suppliers.genericInclusion f

-- API names and meanings agree with the packet; the maps are canonical.
theorem aicGenericExtensionEquivalence_functor : (e).functor = Suppliers.genericRestriction Λ f := by
  sorry

def aicGenericExtensionEquivalence_inverse :
    (e).inverse ⋙ Suppliers.ulaInclusion Λ f ≅
      Suppliers.pcInclusion Λ (Suppliers.genericFiber f) ⋙ Suppliers.pushforward Λ j := by sorry

theorem aicGenericExtension_unit (A : Suppliers.ULACategory Λ f) :
    IsIso ((Suppliers.adjunction Λ j).unit.app ((Suppliers.ulaInclusion Λ f).obj A)) := by sorry

theorem aicGenericExtension_counit (F : Suppliers.PerfectConstructible Λ (Suppliers.genericFiber f)) :
    IsIso ((Suppliers.adjunction Λ j).counit.app
      ((Suppliers.pcInclusion Λ (Suppliers.genericFiber f)).obj F)) := by sorry

theorem aicGenericExtension_perfectConstructible
    (F : Suppliers.PerfectConstructible Λ (Suppliers.genericFiber f)) :
    ∃ G : Suppliers.PerfectConstructible Λ X,
      Nonempty ((Suppliers.pcInclusion Λ X).obj G ≅
        (Suppliers.pushforward Λ j).obj
          ((Suppliers.pcInclusion Λ (Suppliers.genericFiber f)).obj F)) := by sorry

-- test: aicGenericExtension_zero
example : IsZero ((e).inverse.obj (0 : Suppliers.PerfectConstructible Λ (Suppliers.genericFiber f))) := by
  sorry
-- test: aicGenericExtension_recovery -- use the actual adjunction counit.
example (F : Suppliers.PerfectConstructible Λ (Suppliers.genericFiber f)) :
    IsIso ((Suppliers.adjunction Λ j).counit.app
      ((Suppliers.pcInclusion Λ (Suppliers.genericFiber f)).obj F)) := by sorry
-- test: aicGenericExtension_supported_ULA
example (A : Suppliers.ULACategory Λ f)
    (hzero : IsZero ((Suppliers.pullback Λ j).obj ((Suppliers.ulaInclusion Λ f).obj A))) :
    IsZero A := by sorry

-- Closed special fibre of the AIC base, compared on TOTAL perfect input.
-- The left side is the inherited i*Rj*j* formula: at the generic point of an
-- AIC base the strict localization is Spec K. The right side extends j*F.
def aicNearby_extensionIdentification :
    Suppliers.pcInclusion Λ X ⋙ Suppliers.pullback Λ j ⋙ Suppliers.pushforward Λ j ⋙
        Suppliers.pullback Λ (f.fiberι (IsLocalRing.closedPoint V)) ≅
      Suppliers.pcPullback Λ j ⋙ (e).inverse ⋙ Suppliers.ulaInclusion Λ f ⋙
        Suppliers.pullback Λ (f.fiberι (IsLocalRing.closedPoint V)) := by sorry
end AIC

-- test: aicGenericExtension_field -- the generic inclusion of a field is an iso
-- up to the existing pullback identification. Every perfect complex is allowed.
example (K : Type u) [Field K] [IsAlgClosed K] [IsNoetherianRing Λ]
    {X : Scheme.{u}} (f : X ⟶ Spec (CommRingCat.of K))
    (F : Suppliers.PerfectConstructible Λ X) :
    IsIso ((Suppliers.adjunction Λ (Suppliers.genericInclusion f)).unit.app
      ((Suppliers.pcInclusion Λ X).obj F)) := by sorry

-- Flat total-scheme exchange; it does not assume preservation of closed points.
theorem aicGenericExtension_flatBaseChange
    (V W : Type u) [CommRing V] [IsDomain V] [ValuationRing V]
    [CommRing W] [IsDomain W] [ValuationRing W] [Algebra V W] [Module.Flat V W]
    [IsAlgClosed (FractionRing V)] [IsAlgClosed (FractionRing W)] [IsNoetherianRing Λ]
    (ℓ r : ℕ) (hℓ : ℓ.Prime) (hr : 0 < r)
    (hΛ : (ℓ ^ r : Λ) = 0) (hV : IsUnit (ℓ : V))
    {X : Scheme.{u}} (f : X ⟶ Spec (CommRingCat.of V))
    [IsSeparated f] [LocallyOfFinitePresentation f] [QuasiCompact f] [QuasiSeparated f]
    (ge : Suppliers.genericFiber
      (CategoryTheory.Limits.pullback.snd f (Spec.map (CommRingCat.ofHom (algebraMap V W)))) ⟶
      Suppliers.genericFiber f)
    (w : ge ≫ Suppliers.genericInclusion f =
      Suppliers.genericInclusion
        (CategoryTheory.Limits.pullback.snd f (Spec.map (CommRingCat.ofHom (algebraMap V W)))) ≫
        CategoryTheory.Limits.pullback.fst f (Spec.map (CommRingCat.ofHom (algebraMap V W))))
    (F : Suppliers.PerfectConstructible Λ (Suppliers.genericFiber f)) :
    IsIso ((Suppliers.exchange Λ (Suppliers.genericInclusion f)
      (Suppliers.genericInclusion
        (CategoryTheory.Limits.pullback.snd f (Spec.map (CommRingCat.ofHom (algebraMap V W)))))
      (CategoryTheory.Limits.pullback.fst f (Spec.map (CommRingCat.ofHom (algebraMap V W))))
      ge w).app ((Suppliers.pcInclusion Λ (Suppliers.genericFiber f)).obj F)) := by sorry

namespace Suppliers
-- EDC.1 relative duality and EDC.0 tensor, on the EXISTING unbounded carrier.
def pushforwardD {X Y : Scheme.{u}} (f : Y ⟶ X) : EtaleDerived Λ Y ⥤ EtaleDerived Λ X := by sorry
def relativeDuality {X S : Scheme.{u}} (f : X ⟶ S)
    [IsSeparated f] [LocallyOfFinitePresentation f] [QuasiCompact f] [QuasiSeparated f] :
    (EtaleDerived Λ X)ᵒᵖ ⥤ EtaleDerived Λ X := by sorry
-- The canonical map: restrict the relative dual to the generic fibre and
-- follow the adjunction unit, using the ULA duality base-change comparison.
def genericDualityMap {V : Type u} [CommRing V] [IsDomain V]
    {X : Scheme.{u}} (f : X ⟶ Spec (CommRingCat.of V))
    [IsSeparated f] [LocallyOfFinitePresentation f] [QuasiCompact f] [QuasiSeparated f]
    (F : PerfectConstructible Λ (genericFiber f)) :
    (relativeDuality Λ f).obj
        (op ((pushforwardD Λ (genericInclusion f)).obj
          ((pcInclusionD Λ (genericFiber f)).obj F))) ⟶
      (pushforwardD Λ (genericInclusion f)).obj
        ((relativeDuality Λ (CategoryTheory.Limits.pullback.snd f (genericBaseMap V))).obj
          (op ((pcInclusionD Λ (genericFiber f)).obj F))) := by sorry
def externalProductOn {X Y P : Scheme.{u}} (a : P ⟶ X) (b : P ⟶ Y) :
    (EtaleDerived Λ X × EtaleDerived Λ Y) ⥤ EtaleDerived Λ P := by sorry

def genericProductFst {V : Type u} [CommRing V] [IsDomain V] {X Y : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of V)) (g : Y ⟶ Spec (CommRingCat.of V)) :
    genericFiber (CategoryTheory.Limits.pullback.fst f g ≫ f) ⟶ genericFiber f := by sorry
def genericProductSnd {V : Type u} [CommRing V] [IsDomain V] {X Y : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of V)) (g : Y ⟶ Spec (CommRingCat.of V)) :
    genericFiber (CategoryTheory.Limits.pullback.fst f g ≫ f) ⟶ genericFiber g := by sorry

def genericKunnethMap {V : Type u} [CommRing V] [IsDomain V] {X Y : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of V)) (g : Y ⟶ Spec (CommRingCat.of V))
    (F : EtaleDerived Λ (genericFiber f)) (G : EtaleDerived Λ (genericFiber g)) :
    (externalProductOn Λ (CategoryTheory.Limits.pullback.fst f g)
      (CategoryTheory.Limits.pullback.snd f g)).obj
        ((pushforwardD Λ (genericInclusion f)).obj F,
         (pushforwardD Λ (genericInclusion g)).obj G) ⟶
      (pushforwardD Λ (genericInclusion (CategoryTheory.Limits.pullback.fst f g ≫ f))).obj
        ((externalProductOn Λ (genericProductFst f g) (genericProductSnd f g)).obj (F, G)) := by sorry
end Suppliers

section DualityAndProduct
theorem aicGenericExtension_relativeDuality
    (V : Type u) [CommRing V] [IsDomain V] [ValuationRing V]
    [IsAlgClosed (FractionRing V)] [IsNoetherianRing Λ]
    (ℓ r : ℕ) (hℓ : ℓ.Prime) (hr : 0 < r)
    (hΛ : (ℓ ^ r : Λ) = 0) (hV : IsUnit (ℓ : V))
    {X : Scheme.{u}} (f : X ⟶ Spec (CommRingCat.of V))
    [IsSeparated f] [LocallyOfFinitePresentation f] [QuasiCompact f] [QuasiSeparated f]
    (F : Suppliers.PerfectConstructible Λ (Suppliers.genericFiber f)) :
    IsIso (Suppliers.genericDualityMap Λ f F) := by sorry

variable (V : Type u) [CommRing V] [IsDomain V] [hval : ValuationRing V]
  [haic : IsAlgClosed (FractionRing V)] [hnoeth : IsNoetherianRing Λ]
  (ℓ r : ℕ) (hℓ : ℓ.Prime) (hr : 0 < r)
  (hΛ : (ℓ ^ r : Λ) = 0) (hV : IsUnit (ℓ : V))
  {X : Scheme.{u}} (f : X ⟶ Spec (CommRingCat.of V))
  [hsep : IsSeparated f] [hfp : LocallyOfFinitePresentation f] [hqc : QuasiCompact f] [hqs : QuasiSeparated f]

include hval haic hnoeth hℓ hr hΛ hV hsep hfp hqc hqs

-- Künneth uses the canonical map and the actual product projections.
theorem aicGenericExtension_kunneth {Y : Scheme.{u}}
    (g : Y ⟶ Spec (CommRingCat.of V)) [IsSeparated g] [LocallyOfFinitePresentation g] [QuasiCompact g] [QuasiSeparated g]
    (F : Suppliers.PerfectConstructible Λ (Suppliers.genericFiber f))
    (G : Suppliers.PerfectConstructible Λ (Suppliers.genericFiber g)) :
    IsIso (Suppliers.genericKunnethMap Λ f g
      ((Suppliers.pcInclusionD Λ (Suppliers.genericFiber f)).obj F)
      ((Suppliers.pcInclusionD Λ (Suppliers.genericFiber g)).obj G)) := by sorry
end DualityAndProduct
end
end TauCeti.AlgebraicGeometry.ValuationNearby
