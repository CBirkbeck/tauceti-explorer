/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so that contributors and reviewers converge on
names and signatures. No declaration here is an implementation.

The new targets of the H1-valuation-exports packet are prototyped here.
The eleven imported H0 nodes keep their original suggested file and ownership.
Supplier interfaces below specify missing functors, not arbitrary parameters in the
invariance theorems. Implement them as the actual derived étale functors attached to
the scheme morphism. All their proofs and constructions remain supplier obligations.
The generic-extension proof uses pro-étale Rj*. Its bounded-below torsion
transfer requires the SF.2 realization, qcqs direct-image and canonical-unit
comparisons of Bhatt–Scholze 5.1.6, 5.2.6, 5.4.1 and 5.4.3. No pro-étale
carrier or unbounded identification is introduced by these signatures.
Huber 4.2.6–4.2.9 use sheaf local cohomology and ordinary global cohomology.
The SF.2 constructibility specification below expands finite stratifications and
etale local trivializations; it is not an admitted or arbitrary Prop predicate.
-/

import Mathlib.AlgebraicGeometry.Sites.AffineEtale
import Mathlib.AlgebraicGeometry.Sites.EtalePoint
import Mathlib.AlgebraicGeometry.Restrict
import Mathlib.AlgebraicGeometry.Morphisms.FinitePresentation
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.CategoryTheory.Sites.ConstantSheaf
import Mathlib.RingTheory.KrullDimension.Basic
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

namespace Suppliers

-- SF.2 exact inverse image on sheaves, attached to the actual scheme morphism.
def sheafPullback {X Y : Scheme.{u}} (f : Y ⟶ X) :
    EtaleModules R X ⥤ EtaleModules R Y := by sorry

-- Expanded specification of the requested SF.2 constructible-sheaf predicate.
-- On every compact open: a finite partition by constructible locally closed
-- subschemes; on each stratum: etale locally a constant finite R-module.
-- The open/closed factorization specifies genuine subscheme inclusions.
-- No noetherian hypothesis on X is built into this supplier specification.
def constructible {X : Scheme.{u}} (F : EtaleModules R X) : Prop :=
  ∀ (U : X.Opens), IsCompact (U : Set X) →
    ∃ (N : ℕ) (Z C : Fin N → Scheme.{u})
      (i : ∀ a, Z a ⟶ C a) (c : ∀ a, C a ⟶ U.toScheme),
      (∀ a, IsOpenImmersion (i a) ∧ IsClosedImmersion (c a) ∧
        Topology.IsConstructible (Set.range (i a ≫ c a).base)) ∧
      (∀ a b, a ≠ b → Disjoint (Set.range (i a ≫ c a).base)
        (Set.range (i b ≫ c b).base)) ∧
      (∀ x : U.toScheme, ∃ a, x ∈ Set.range (i a ≫ c a).base) ∧
      (∀ a (z : Z a), ∃ (T : Scheme.{u}) (e : T ⟶ Z a) (t : T)
        (M : ModuleCat.{u} R), Etale e ∧ e.base t = z ∧ Module.Finite R M ∧
          Nonempty ((sheafPullback R (e ≫ i a ≫ c a ≫ U.ι)).obj F ≅
            (constantSheaf T.smallEtaleTopology (ModuleCat.{u} R)).obj M))

-- Specification checks for the supplier predicate, not new valuation definitions.
example (X : Scheme.{u}) (F : EtaleModules R X) (hF : IsZero F) :
    constructible R F := by sorry
example (X : Scheme.{u}) (M : ModuleCat.{u} R) [Module.Finite R M] :
    constructible R ((constantSheaf X.smallEtaleTopology (ModuleCat.{u} R)).obj M) := by
  sorry
example {X Y : Scheme.{u}} (f : Y ⟶ X) (F : EtaleModules R X)
    (hF : constructible R F) : constructible R ((sheafPullback R f).obj F) := by sorry

-- EDC.0 sheaf local cohomology i_*Ri^!, with its natural localization triangle.
-- This returns a complex ON X, unlike RGammaSupport which returns R-modules.
def localSupport (X : Scheme.{u}) (T : Set X) (hT : IsClosed T) :
    EtalePlus R X ⥤ EtalePlus R X := by sorry

def localSupportExchange {X Y : Scheme.{u}} (p : Y ⟶ X)
    (T : Set X) (hT : IsClosed T) :
    localSupport R X T hT ⋙ pullback R p ⟶
      pullback R p ⋙ localSupport R Y (p.base ⁻¹' T) (hT.preimage p.continuous) := by
  sorry

end Suppliers

abbrev IntegralCoefficients : Type u := ULift.{u} ℤ

section TorsionSheaves

variable (V W : Type u) [CommRing V] [IsDomain V] [hvalV : ValuationRing V]
  [CommRing W] [IsDomain W] [hvalW : ValuationRing W]
  [hsepV : IsSepClosed (FractionRing V)] [hsepW : IsSepClosed (FractionRing W)]
  (φ : V →+* W) (X : Scheme.{u}) (f : X ⟶ Spec (CommRingCat.of V))

include hvalV hvalW hsepV hsepW

local notation "q" => Spec.map (CommRingCat.ofHom φ)
local notation "p" => pullback.fst f q
local notation "XW" => (pullback f q : Scheme)
local notation "fW" => pullback.snd f q
local notation "single" => DerivedCategory.Plus.singleFunctor (EtaleModules IntegralCoefficients X) 0

-- Huber 4.2.6(i), pp. 243–244. The coefficient condition is elementwise:
-- stalk elements have torsion orders prime to all residue characteristics of (XW).
-- No fixed exponent, locality/injectivity of φ, qcqs or finite type is assumed.
theorem localCohomology_valuation_baseChange
    (F : EtaleModules IntegralCoefficients X)
    (hF : ∀ (Ω : Type u) [Field Ω] [IsSepClosed Ω]
      (s : Spec (CommRingCat.of Ω) ⟶ X)
      (v : ((Scheme.pointSmallEtale s).sheafFiber (A := ModuleCat.{u} IntegralCoefficients)).obj F),
      ∃ m : ℕ, 0 < m ∧ m • v = 0 ∧ ∀ x' : XW, IsUnit (m : (XW).residueField x'))
    (Z : Set (Spec (CommRingCat.of V))) (hZ : IsClosed Z)
    (hcZ : Topology.IsConstructible Z) (hproper : (q).base ⁻¹' Z ≠ Set.univ) :
    IsIso ((Suppliers.localSupportExchange IntegralCoefficients p (f.base ⁻¹' Z)
      (hZ.preimage f.continuous)).app ((single).obj F)) := by
  sorry

-- Huber 4.2.6(ii), p. 244. ηW is the CLOSED point of the open complement,
-- not the generic point unless the complement has just that one point.
theorem localCohomology_collapsedBoundary_vanish
    (F : EtaleModules IntegralCoefficients X)
    (hF : ∀ (Ω : Type u) [Field Ω] [IsSepClosed Ω]
      (s : Spec (CommRingCat.of Ω) ⟶ X)
      (v : ((Scheme.pointSmallEtale s).sheafFiber (A := ModuleCat.{u} IntegralCoefficients)).obj F),
      ∃ m : ℕ, 0 < m ∧ m • v = 0 ∧ ∀ x' : XW, IsUnit (m : (XW).residueField x'))
    (Z' : Set (Spec (CommRingCat.of W))) (hZ' : IsClosed Z')
    (hcZ' : Topology.IsConstructible Z') (hproper : Z' ≠ Set.univ)
    (ηW : Spec (CommRingCat.of W)) (hη : ηW ∉ Z')
    (hclosed : ∀ t : Spec (CommRingCat.of W), t ∉ Z' → Specializes t ηW)
    (hcollapse : ∀ z ∈ Z', (q).base z = (q).base ηW) :
    IsZero ((Suppliers.localSupport IntegralCoefficients XW ((fW).base ⁻¹' Z')
      (hZ'.preimage (fW).continuous)).obj ((Suppliers.pullback IntegralCoefficients p).obj ((single).obj F))) := by
  sorry

-- Huber 4.2.7(i), pp. 244–245: ordinary cohomology for ANY scheme and
-- an arbitrary prime-to-char(X) torsion abelian sheaf, with no common exponent.
theorem torsionSheaf_totalCohomology_valuation_invariance
    (hq : Surjective q) (F : EtaleModules IntegralCoefficients X)
    (hF : ∀ (Ω : Type u) [Field Ω] [IsSepClosed Ω]
      (s : Spec (CommRingCat.of Ω) ⟶ X)
      (v : ((Scheme.pointSmallEtale s).sheafFiber (A := ModuleCat.{u} IntegralCoefficients)).obj F),
      ∃ m : ℕ, 0 < m ∧ m • v = 0 ∧ ∀ x : X, IsUnit (m : X.residueField x)) :
    IsIso ((Suppliers.cohomologyPullback IntegralCoefficients p).app ((single).obj F)) := by
  sorry

-- Huber 4.2.7(ii), pp. 244–245: this specific adjunction unit is an isomorphism.
-- On H⁰ it gives F ≅ p_*p*F; on Hⁿ, n>0, it gives Rⁿp_*p*F=0.
-- The proof sheafifies the chartwise cohomology comparison (Stacks 03Q8);
-- it does not assert vanishing of positive cohomology on each affine chart.
theorem torsionSheaf_valuation_adjunction_descent
    (hq : Surjective q) (F : EtaleModules IntegralCoefficients X)
    (hF : ∀ (Ω : Type u) [Field Ω] [IsSepClosed Ω]
      (s : Spec (CommRingCat.of Ω) ⟶ X)
      (v : ((Scheme.pointSmallEtale s).sheafFiber (A := ModuleCat.{u} IntegralCoefficients)).obj F),
      ∃ m : ℕ, 0 < m ∧ m • v = 0 ∧ ∀ x : X, IsUnit (m : X.residueField x)) :
    IsIso ((Suppliers.adjunction IntegralCoefficients p).unit.app ((single).obj F)) := by
  sorry

end TorsionSheaves

section Finiteness

variable (V : Type u) [CommRing V] [IsDomain V] [hvalV : ValuationRing V]
  [hsepV : IsSepClosed (FractionRing V)]
  (X : Scheme.{u}) (f : X ⟶ Spec (CommRingCat.of V))
  [hnoeth : IsNoetherianRing R] (m : ℕ) (hm : 0 < m) (hR : (m : R) = 0)
  (hchar : ∀ x : X, IsUnit (m : X.residueField x))

include hvalV hsepV hnoeth hm hR hchar

-- Huber 4.2.8, p. 245: Z is a subset of the BASE spectrum; finiteness
-- means finitely many points, not finite fibres or a compactification boundary.
theorem constructibility_finiteValuationBoundary
    [hft : LocallyOfFiniteType f]
    (Z : Set (Spec (CommRingCat.of V))) (hZ : IsClosed Z)
    (hcZ : Topology.IsConstructible Z)
    (hcase : LocallyOfFinitePresentation f ∨ Z.Finite)
    (F : EtaleModules R X) (hF : Suppliers.constructible R F) (n : ℕ) :
    Suppliers.constructible R
      ((DerivedCategory.Plus.homologyFunctor (EtaleModules R X) (n : ℤ)).obj
        ((Suppliers.localSupport R X (f.base ⁻¹' Z) (hZ.preimage f.continuous)).obj
          ((DerivedCategory.Plus.singleFunctor (EtaleModules R X) 0).obj F))) := by
  sorry

-- Huber 4.2.9, pp. 245–246: finite TYPE is global here. Finite presentation
-- is locally-finite-presentation plus quasi-compactness and quasi-separatedness.
-- Only finite generation degree by degree is claimed, with no extra amplitude.
theorem constructibleCohomology_finite
    [hft : LocallyOfFiniteType f] [hqc : QuasiCompact f]
    (hcase : (LocallyOfFinitePresentation f ∧ QuasiSeparated f) ∨ ringKrullDim V < ⊤)
    (F : EtaleModules R X) (hF : Suppliers.constructible R F) (n : ℕ) :
    Module.Finite R
      ((DerivedCategory.Plus.homologyFunctor (ModuleCat.{u} R) (n : ℤ)).obj
        ((Suppliers.RGamma R X).obj
          ((DerivedCategory.Plus.singleFunctor (EtaleModules R X) 0).obj F))) := by
  sorry

-- Key descent used by BOTH branches above, Huber 4.2.8 proof (2), p. 245,
-- and 4.2.9 proof (2), p. 246. This is not the imported reduced-model lemma.
-- A0 is a subring of V; its spectrum map is surjective, and the model has
-- finite rank and separably closed fraction field. Coefficients and Z descend.
theorem finiteRank_descent_valuationData
    [hfp : LocallyOfFinitePresentation f] [hqc : QuasiCompact f] [hqs : QuasiSeparated f]
    (Z : Set (Spec (CommRingCat.of V))) (hZ : IsClosed Z)
    (hcZ : Topology.IsConstructible Z)
    (F : EtaleModules R X) (hF : Suppliers.constructible R F) :
    ∃ (A0 : Subring V), ValuationRing A0 ∧ IsSepClosed (FractionRing A0) ∧
      ringKrullDim A0 < ⊤ ∧ Surjective (Spec.map (CommRingCat.ofHom A0.subtype)) ∧
      ∃ (X0 : Scheme.{u}) (f0 : X0 ⟶ Spec (CommRingCat.of A0))
        (e : X ≅ pullback f0 (Spec.map (CommRingCat.ofHom A0.subtype)))
        (Z0 : Set (Spec (CommRingCat.of A0))) (F0 : EtaleModules R X0),
        LocallyOfFinitePresentation f0 ∧ QuasiCompact f0 ∧ QuasiSeparated f0 ∧
        e.hom ≫ pullback.snd f0 (Spec.map (CommRingCat.ofHom A0.subtype)) = f ∧
        IsClosed Z0 ∧ Topology.IsConstructible Z0 ∧
        (Spec.map (CommRingCat.ofHom A0.subtype)).base ⁻¹' Z0 = Z ∧
        (∀ x0 : X0, IsUnit (m : X0.residueField x0)) ∧
        Suppliers.constructible R F0 ∧
        Nonempty (F ≅ (Suppliers.sheafPullback R
          (e.hom ≫ pullback.fst f0 (Spec.map (CommRingCat.ofHom A0.subtype)))).obj F0) := by
  sorry

end Finiteness

end

end TauCeti.AdicSpace.ValuationBase
