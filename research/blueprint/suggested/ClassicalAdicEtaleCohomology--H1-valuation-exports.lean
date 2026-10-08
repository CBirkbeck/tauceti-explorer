/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so that contributors and reviewers converge on
names and signatures. No declaration here is an implementation.

Checkpoint: only the four NEW nodes of the H1-valuation-exports packet are prototyped.
The eleven imported H0 nodes keep their original suggested file and ownership.
Supplier interfaces below specify missing functors, not arbitrary parameters in the
invariance theorems. Implement them as the actual derived étale functors attached to
the scheme morphism. All their proofs and constructions remain supplier obligations.
No signature for the unread finite-boundary theorem is fabricated.
-/

import Mathlib.AlgebraicGeometry.Sites.AffineEtale
import Mathlib.AlgebraicGeometry.Fiber
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Homology.DerivedCategory.Plus
import Mathlib.CategoryTheory.Adjunction.Basic
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.FieldTheory.IsSepClosed
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.RingTheory.Flat.FaithfullyFlat.Basic
import Mathlib.RingTheory.Valuation.ValuationRing

open CategoryTheory CategoryTheory.Limits AlgebraicGeometry Opposite

universe u

namespace TauCeti.AdicSpace.ValuationBase

noncomputable section

variable (R : Type u) [CommRing R]

-- EDC.0/etale-derived-category: abbreviations of EXISTING Mathlib carriers.
abbrev EtaleModules (X : Scheme.{u}) :=
  Sheaf X.smallEtaleTopology (ModuleCat.{u} R)

instance (X : Scheme.{u}) : Abelian (EtaleModules R X) := inferInstance

instance (X : Scheme.{u}) : HasDerivedCategory (EtaleModules R X) :=
  HasDerivedCategory.standard _

instance : HasDerivedCategory (ModuleCat.{u} R) := HasDerivedCategory.standard _

abbrev EtalePlus (X : Scheme.{u}) := DerivedCategory.Plus (EtaleModules R X)
abbrev ModulePlus := DerivedCategory.Plus (ModuleCat.{u} R)

namespace Suppliers

-- SF.2 request: exact inverse image, derived direct image, adjunction, and
-- composition with derived global sections, on the bounded-below carrier.
def pullback {X Y : Scheme.{u}} (f : Y ⟶ X) : EtalePlus R X ⥤ EtalePlus R Y := by
  sorry

def pushforward {X Y : Scheme.{u}} (f : Y ⟶ X) : EtalePlus R Y ⥤ EtalePlus R X := by
  sorry

def adjunction {X Y : Scheme.{u}} (f : Y ⟶ X) :
    pullback R f ⊣ pushforward R f := by
  sorry

def RGamma (X : Scheme.{u}) : EtalePlus R X ⥤ ModulePlus R := by
  sorry

def gammaIso {X Y : Scheme.{u}} (f : Y ⟶ X) :
    pushforward R f ⋙ RGamma R X ≅ RGamma R Y := by
  sorry

-- The imported comparison is fixed by its adjunction unit, rather than chosen
-- merely because the source and target have isomorphic cohomology groups.
def cohomologyPullback {X Y : Scheme.{u}} (f : Y ⟶ X) :
    RGamma R X ⟶ pullback R f ⋙ RGamma R Y where
  app E := (RGamma R X).map ((adjunction R f).unit.app E) ≫
    (gammaIso R f).hom.app ((pullback R f).obj E)
  naturality := by sorry

-- EDC.0/cohomology-with-supports, restricted to D⁺. SF.2 supplies the natural
-- morphism of localization triangles. This is closed support, not compact support.
def RGammaSupport (X : Scheme.{u}) (Z : Set X) (hZ : IsClosed Z) :
    EtalePlus R X ⥤ ModulePlus R := by
  sorry

def supportPullback {X Y : Scheme.{u}} (f : Y ⟶ X) (Z : Set X) (hZ : IsClosed Z) :
    RGammaSupport R X Z hZ ⟶
      pullback R f ⋙ RGammaSupport R Y (f.base ⁻¹' Z)
        (hZ.preimage f.continuous) := by
  sorry

end Suppliers

section Invariance

variable (V W : Type u) [CommRing V] [IsDomain V] [hvalV : ValuationRing V]
  [CommRing W] [IsDomain W] [hvalW : ValuationRing W] [Algebra V W]
  [hflat : Module.FaithfullyFlat V W]
  (ℓ n : ℕ) (hℓ : ℓ.Prime) (hn : 0 < n)
  (hR : (ℓ ^ n : R) = 0) (hV : IsUnit (ℓ : V))
  (X : Scheme.{u}) [hqc : CompactSpace X] [hqs : QuasiSeparatedSpace X]
  (f : X ⟶ Spec (CommRingCat.of V))

include hvalV hvalW hflat hqc hqs hℓ hn hR hV

-- Hansen–Scholze, Relative perversity, Corollary 4.5, pp. 22–23.
-- D⁺ permits arbitrary qcqs X: there is deliberately no finite-type assumption.
theorem totalCohomology_valuation_invariance
    [IsAlgClosed (FractionRing V)] [IsAlgClosed (FractionRing W)]
    (E : EtalePlus R X) :
    IsIso ((Suppliers.cohomologyPullback R
      (pullback.fst f (Spec.map (CommRingCat.ofHom (algebraMap V W))))).app E) := by
  sorry

-- Derived consequence using the radicial perfection square and topological
-- invariance of the scheme étale site (Stacks §59.45). The fraction fields need
-- only be separably closed; no false implication IsSepClosed -> IsAlgClosed.
theorem totalCohomology_sepClosed_valuation_invariance
    [IsSepClosed (FractionRing V)] [IsSepClosed (FractionRing W)]
    (E : EtalePlus R X) :
    IsIso ((Suppliers.cohomologyPullback R
      (pullback.fst f (Spec.map (CommRingCat.ofHom (algebraMap V W))))).app E) := by
  sorry

-- H_Z keeps the same degree across base change. The open complement is qcqs;
-- requiring it to be compact is a sufficient, explicit hypothesis in this prototype.
theorem closedSupport_valuation_invariance
    [IsSepClosed (FractionRing V)] [IsSepClosed (FractionRing W)]
    (Z : Set X) (hZ : IsClosed Z) (hU : IsCompact (Zᶜ : Set X))
    (E : EtalePlus R X) :
    IsIso ((Suppliers.supportPullback R
      (pullback.fst f (Spec.map (CommRingCat.ofHom (algebraMap V W)))) Z hZ).app E) := by
  sorry

end Invariance

namespace Suppliers

-- Imported H0 nearby-cycle construction, specialized to algebraically closed
-- generic fields. A scheme square is recorded, with its actual geometric maps.
abbrev nearby {X G T : Scheme.{u}} (i : T ⟶ X) (j : G ⟶ X) :
    EtalePlus R G ⥤ EtalePlus R T := pushforward R j ⋙ pullback R i

def nearbyExchange {X X' G G' T T' : Scheme.{u}}
    (i : T ⟶ X) (j : G ⟶ X) (i' : T' ⟶ X') (j' : G' ⟶ X')
    (g : X' ⟶ X) (gs : T' ⟶ T) (ge : G' ⟶ G)
    (wi : i' ≫ g = gs ≫ i) (wj : j' ≫ g = ge ≫ j) :
    nearby R i j ⋙ pullback R gs ⟶ pullback R ge ⋙ nearby R i' j' := by
  sorry

-- Imported H0/invariance-comparison-map, using that exchange map.
def nearbyInvariance {X X' G G' T T' : Scheme.{u}}
    (i : T ⟶ X) (j : G ⟶ X) (i' : T' ⟶ X') (j' : G' ⟶ X')
    (g : X' ⟶ X) (gs : T' ⟶ T) (ge : G' ⟶ G)
    (wi : i' ≫ g = gs ≫ i) (wj : j' ≫ g = ge ≫ j) (F : EtalePlus R G) :
    (RGamma R T).obj ((nearby R i j).obj F) ⟶
      (RGamma R T').obj ((nearby R i' j').obj ((pullback R ge).obj F)) :=
  (cohomologyPullback R gs).app ((nearby R i j).obj F) ≫
    (RGamma R T').map ((nearbyExchange R i j i' j' g gs ge wi wj).app F)

-- Imported proper-nearby-cycle-cohomology: its canonical MAP, before asserting
-- properness makes it an isomorphism. This direction matches the packet's square.
def properNearbyComparison {X G T : Scheme.{u}} (i : T ⟶ X) (j : G ⟶ X)
    (F : EtalePlus R G) :
    (RGamma R G).obj F ⟶ (RGamma R T).obj ((nearby R i j).obj F) :=
  (gammaIso R j).inv.app F ≫
    (cohomologyPullback R i).app ((pushforward R j).obj F)

end Suppliers

section Coherence

variable (V W : Type u) [CommRing V] [IsDomain V] [hvalV : ValuationRing V]
  [CommRing W] [IsDomain W] [hvalW : ValuationRing W] [Algebra V W]
  [hflat : Module.FaithfullyFlat V W]
  [hsepV : IsSepClosed (FractionRing V)] [hsepW : IsSepClosed (FractionRing W)]
  (ℓ n : ℕ) (hℓ : ℓ.Prime) (hn : 0 < n)
  (hR : (ℓ ^ n : R) = 0) (hV : IsUnit (ℓ : V))
  (X : Scheme.{u}) (f : X ⟶ Spec (CommRingCat.of V)) [hproper : IsProper f]

include hvalV hvalW hflat hsepV hsepW hproper hℓ hn hR hV

local notation "h" => Spec.map (CommRingCat.ofHom (algebraMap V W))
local notation "g" => pullback.fst f h
local notation "fW" => pullback.snd f h
local notation "j" => pullback.fst f
  (Spec.map (CommRingCat.ofHom (algebraMap V (FractionRing V))))
local notation "jW" => pullback.fst fW
  (Spec.map (CommRingCat.ofHom (algebraMap W (FractionRing W))))
local notation "i" => f.fiberι (IsLocalRing.closedPoint V)
local notation "iW" => Scheme.Hom.fiberι fW (IsLocalRing.closedPoint W)

-- Actual generic and closed fibres. The over-map equations characterize gs and
-- ge because their fibre inclusions are monomorphisms; they are not placeholders
-- for an unspecified comparison. Formal tubes keep the imported H0 signature.
theorem properNearbyInvariance_coherence
    (gs : Scheme.Hom.fiber fW (IsLocalRing.closedPoint W) ⟶ f.fiber (IsLocalRing.closedPoint V))
    (wi : iW ≫ g = gs ≫ i)
    (ge : pullback fW (Spec.map (CommRingCat.ofHom (algebraMap W (FractionRing W)))) ⟶
      pullback f (Spec.map (CommRingCat.ofHom (algebraMap V (FractionRing V)))))
    (wj : jW ≫ g = ge ≫ j)
    (F : EtalePlus R
      (pullback f (Spec.map (CommRingCat.ofHom (algebraMap V (FractionRing V)))))) :
    Suppliers.properNearbyComparison R i j F ≫
        Suppliers.nearbyInvariance R i j iW jW g gs ge wi wj F =
      (Suppliers.cohomologyPullback R ge).app F ≫
        Suppliers.properNearbyComparison R iW jW ((Suppliers.pullback R ge).obj F) := by
  sorry

end Coherence

end

end TauCeti.AdicSpace.ValuationBase
