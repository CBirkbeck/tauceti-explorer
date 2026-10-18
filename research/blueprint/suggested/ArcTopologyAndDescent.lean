import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.RingTheory.Valuation.ValuationRing
import Mathlib.RingTheory.Flat.FaithfullyFlat.Algebra
import Mathlib.RingTheory.KrullDimension.Basic
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.Topology.Spectral.Hom
import Mathlib.Data.ZMod.Basic

/-!
# Arc topology and descent: representative target signatures

The definitive mathematical roadmap is `ArcTopologyAndDescent.md`; this file is not the roadmap.
These suggested forms help contributors and reviewers converge on names and signatures.
This file records light definitions and
representative theorem signatures statable against the pinned Mathlib API; it is not exhaustive.
The scheme sites, coherent topoi and enhanced-category descent theorems are specified in the
roadmap. The affine lifting predicate below fixes a universe of test rings. The roadmap's bounded
cardinality comparison relates these universes to the full scheme topology.

Valuation extensions require injectivity and reflection of units. Fields count as rank zero.
Absolute integral closedness is a predicate on rings, with no domain requirement, and only monic
polynomials of positive degree create root obligations. Formal glueing uses every positive ideal
power. Spectral submersion reflects openness only when the inverse image is compact open.
-/

namespace TauCetiRoadmap.ArcTopologyAndDescent

universe u v w

open Polynomial

/-! ## Layer 0: valuation extensions and rank intervals -/

/-- The extension predicate on ring maps. The valuative applications impose valuation-domain
instances on both rings. `IsLocalHom` reflects units. -/
def IsValuationExtension {V : Type u} {W : Type v} [CommRing V] [CommRing W]
    (f : V →+* W) : Prop :=
  Function.Injective f ∧ IsLocalHom f

/-- Extensions compose. -/
theorem IsValuationExtension.comp {U : Type u} {V : Type v} {W : Type w}
    [CommRing U] [CommRing V] [CommRing W] {f : U →+* V} {g : V →+* W}
    (hf : IsValuationExtension f) (hg : IsValuationExtension g) :
    IsValuationExtension (g.comp f) := by
  sorry

/-- The local condition is exactly the existing unit-reflection class. -/
theorem IsValuationExtension.isLocalHom {V : Type u} {W : Type v}
    [CommRing V] [CommRing W] {f : V →+* W} (hf : IsValuationExtension f) :
    IsLocalHom f := by
  sorry

/-- For valuation domains, the lifting extension convention agrees with faithful flatness. -/
theorem IsValuationExtension.iff_faithfullyFlat {V : Type u} {W : Type v}
    [CommRing V] [IsDomain V] [ValuationRing V]
    [CommRing W] [IsDomain W] [ValuationRing W] (f : V →+* W) :
    letI := f.toAlgebra
    IsValuationExtension f ↔ Module.FaithfullyFlat V W := by
  sorry

/-- The identity is an extension, including for a field. -/
example (V : Type u) [CommRing V] : IsValuationExtension (RingHom.id V) := by
  sorry

/-- An injective map to a fraction field need not reflect units. -/
example (V : Type u) [CommRing V] [IsDomain V] [ValuationRing V]
    (h : ∃ t : V, t ≠ 0 ∧ ¬ IsUnit t) :
    ¬ IsValuationExtension (algebraMap V (FractionRing V)) := by
  sorry

/-- Absolute integral closedness is not restricted to domains. The degree condition excludes 1. -/
def IsAbsolutelyIntegrallyClosed (A : Type u) [CommRing A] : Prop :=
  ∀ p : A[X], p.Monic → 0 < p.natDegree → ∃ a : A, p.eval a = 0

/-- For fields this is the existing algebraic-closedness notion. -/
theorem IsAbsolutelyIntegrallyClosed.iff_isAlgClosed (K : Type u) [Field K] :
    IsAbsolutelyIntegrallyClosed K ↔ IsAlgClosed K := by
  sorry

/-- Arbitrary quotients of an aic ring remain aic, including the zero quotient. -/
theorem IsAbsolutelyIntegrallyClosed.quotient (A : Type u) [CommRing A]
    (h : IsAbsolutelyIntegrallyClosed A) (I : Ideal A) :
    IsAbsolutelyIntegrallyClosed (A ⧸ I) := by
  sorry

/-- Existence of a faithfully flat aic valuation extension, BM21 Lemma 3.28. -/
theorem aic_extension_exists (V : Type u) [CommRing V] [IsDomain V] [ValuationRing V] :
    ∃ (W : Type u) (_ : CommRing W) (_ : IsDomain W) (_ : ValuationRing W)
      (f : V →+* W), IsValuationExtension f ∧ IsAbsolutelyIntegrallyClosed W := by
  sorry

/-- Rational numbers fail the monic-root condition, witnessed by X²−2. -/
example : ¬ IsAbsolutelyIntegrallyClosed ℚ := by
  sorry

/-- The zero ring satisfies the predicate; no domain assumption may be inserted. -/
example : IsAbsolutelyIntegrallyClosed (ZMod 1) := by
  sorry

/-! ## Layer 1: the scheme v- and h-topologies -/

/- The scheme v-site, finitely presented h-site and universal descent live in the roadmap.
Finite inductive level and the forward abstract-blowup theorem are supplied by EnhancedDerivedSheaves.
-/

/-! ## Layer 2: arc-covers and spectral submersions -/

/-- Affine arc-cover lifting in a fixed universe. Both valuations have rank at most one, and
fields are included. The corresponding scheme map is Spec B → Spec A. -/
def IsRingArcCover {A B : Type u} [CommRing A] [CommRing B] (f : A →+* B) : Prop :=
  ∀ (V : Type u) [CommRing V] [IsDomain V] [ValuationRing V] [Ring.KrullDimLE 1 V]
    (a : A →+* V),
    ∃ (W : Type u) (_ : CommRing W) (_ : IsDomain W) (_ : ValuationRing W)
      (_ : Ring.KrullDimLE 1 W) (i : V →+* W) (b : B →+* W),
      IsValuationExtension i ∧ b.comp f = i.comp a

/-- The lifting condition has the same direction as the scheme cover. -/
theorem IsRingArcCover.comp {A B C : Type u} [CommRing A] [CommRing B] [CommRing C]
    {f : A →+* B} {g : B →+* C} (hf : IsRingArcCover f) (hg : IsRingArcCover g) :
    IsRingArcCover (g.comp f) := by
  sorry

/-- Right cancellation on scheme covers is left cancellation on ring maps. -/
theorem IsRingArcCover.cancel {A B C : Type u} [CommRing A] [CommRing B] [CommRing C]
    (f : A →+* B) (g : B →+* C) (h : IsRingArcCover (g.comp f)) :
    IsRingArcCover f := by
  sorry

/-- Identity covers include the zero ring. -/
example (A : Type u) [CommRing A] : IsRingArcCover (RingHom.id A) := by
  sorry

/-- A generic point alone does not cover a nonfield rank-one valuation spectrum. -/
example (V : Type u) [CommRing V] [IsDomain V] [ValuationRing V]
    [Ring.KrullDimLE 1 V] (h : ∃ t : V, t ≠ 0 ∧ ¬ IsUnit t) :
    ¬ IsRingArcCover (algebraMap V (FractionRing V)) := by
  sorry

/-- A spectral surjection which reflects openness of subsets having compact open inverse image.
The geometric applications impose `SpectralSpace` instances on both spaces. -/
def IsSpectralSubmersion {X : Type u} {Y : Type v}
    [TopologicalSpace X] [TopologicalSpace Y] (f : X → Y) : Prop :=
  IsSpectralMap f ∧ Function.Surjective f ∧
    ∀ U : Set Y, IsCompact (f ⁻¹' U) → IsOpen (f ⁻¹' U) → IsOpen U

/-- Spectral submersions compose. -/
theorem IsSpectralSubmersion.comp {X : Type u} {Y : Type v} {Z : Type w}
    [TopologicalSpace X] [TopologicalSpace Y] [TopologicalSpace Z]
    {f : X → Y} {g : Y → Z} (hf : IsSpectralSubmersion f)
    (hg : IsSpectralSubmersion g) : IsSpectralSubmersion (g ∘ f) := by
  sorry

/-- A spectral submersion reflects compact openness, including compactness by surjectivity. -/
theorem IsSpectralSubmersion.reflect_open {X : Type u} {Y : Type v}
    [TopologicalSpace X] [TopologicalSpace Y] {f : X → Y}
    (hf : IsSpectralSubmersion f) (U : Set Y)
    (hc : IsCompact (f ⁻¹' U)) (ho : IsOpen (f ⁻¹' U)) :
    IsOpen U ∧ IsCompact U := by
  sorry

/-- The identity is spectral-submersive, without a nonempty-space assumption. -/
example (X : Type u) [TopologicalSpace X] : IsSpectralSubmersion (id : X → X) := by
  sorry

/-- Compact-open reflection cannot replace surjectivity. -/
example : ¬ IsSpectralSubmersion (Empty.elim : Empty → PUnit) := by
  sorry

/-! ## Layer 3: finitary descent and valuation detection -/

/- Finitary functors, cotruncated compact generators, the Boolean sheaf on an ultrafilter space
and descent-detecting families require the enhanced carriers specified in the roadmap. -/

/-! ## Layer 4: the arc-descent criterion -/

/-- The repaired prime-extension statement: the kernel-containment condition is essential.
The localization formula in the roadmap separately uses the largest prime above p. -/
theorem corrected_prime_extension {V : Type u} {W : Type v}
    [CommRing V] [IsDomain V] [ValuationRing V]
    [CommRing W] [IsDomain W] [ValuationRing W]
    (hv : IsAbsolutelyIntegrallyClosed V) (hw : IsAbsolutelyIntegrallyClosed W)
    (f : V →+* W) (p : Ideal V) [p.IsPrime]
    (hker : RingHom.ker f ≤ p) (hproper : Ideal.map f p ≠ ⊤) :
    (Ideal.map f p).IsPrime ∧ Ideal.comap f (Ideal.map f p) = p := by
  sorry

/-- The maximal prime over p can differ from the extended prime pW. -/
theorem largest_prime_above {V : Type u} {W : Type v}
    [CommRing V] [IsDomain V] [ValuationRing V]
    [CommRing W] [IsDomain W] [ValuationRing W]
    (hv : IsAbsolutelyIntegrallyClosed V) (hw : IsAbsolutelyIntegrallyClosed W)
    (f : V →+* W) (p : Ideal V) [p.IsPrime]
    (hker : RingHom.ker f ≤ p) (hproper : Ideal.map f p ≠ ⊤) :
    ∃ q : Ideal W, q.IsPrime ∧ Ideal.comap f q = p ∧
      ∀ r : Ideal W, r.IsPrime → Ideal.comap f r = p → r ≤ q := by
  sorry

/-! ## Layer 5: the coherent arc-topos and unrestricted excision -/

/- Bounded arc-sites, coherent sheafification and the Milnor pushout are roadmap targets. -/

/-! ## Layer 6: étale cohomology and étale objects -/

/- The étale targets use the enhanced sheaf categories and the strict-henselization point interface.
The finite-chain model has injective transition maps, but all natural transformations as morphisms.
-/

/-! ## Layer 7: constructible complexes, differentials and perfect schemes -/

/- The h-differential functor and the constructible/perfect categories are roadmap targets.
The algebraic-space Hom theorem additionally requires the stated Perf-Tannaka supplier.
-/

/-! ## Layer 8: formal glueing and henselian rigidity -/

/-- A light predicate for a formal glueing datum. The quotient uses map(I^n), equal to (map I)^n.
No quotient isomorphisms are chosen as data. -/
def FormalGlueingDatum {A : Type u} {B : Type v} [CommRing A] [CommRing B]
    (f : A →+* B) (I : Ideal A) : Prop :=
  I.FG ∧ ∀ n : ℕ, 0 < n →
    Function.Bijective (Ideal.quotientMap (Ideal.map f (I ^ n)) f Ideal.le_comap_map)

/-- The completion map is a formal datum for a finitely generated ideal, without noetherianity. -/
theorem FormalGlueingDatum.completion (A : Type u) [CommRing A]
    (I : Ideal A) (hI : I.FG) :
    FormalGlueingDatum (algebraMap A (AdicCompletion I A)) I := by
  sorry

/-- The zero ideal forces the original map to be an isomorphism. -/
theorem FormalGlueingDatum.zero_iff {A : Type u} {B : Type v}
    [CommRing A] [CommRing B] (f : A →+* B) :
    FormalGlueingDatum f ⊥ ↔ Function.Bijective f := by
  sorry

/-- For the unit ideal the quotient conditions are vacuous. -/
theorem FormalGlueingDatum.unit {A : Type u} {B : Type v}
    [CommRing A] [CommRing B] (f : A →+* B) : FormalGlueingDatum f ⊤ := by
  sorry

/-- The identity supplies a datum for every finitely generated ideal. -/
example (A : Type u) [CommRing A] (I : Ideal A) (hI : I.FG) :
    FormalGlueingDatum (RingHom.id A) I := by
  sorry

/-- Agreement modulo I alone is insufficient: Z/4 → Z/2 fails at the second power. -/
example : ¬ FormalGlueingDatum (Int.castRingHom (ZMod 2))
    (Ideal.span ({2} : Set ℤ)) := by
  sorry

/-! ## Layer 9: the arc_t-topology and rigid generic fibres -/

/- ArcTCover, ArcTEquivalence, genericEtale and totalIntegralClosure are specified in the roadmap. -/

/-! ## Layer 10: Künneth and affinoid vanishing -/

/- The enhanced étale-cohomology and analytic-algebra interfaces are required for these end theorems.
The rational-domain bound uses max; the general affinoid bounds are d+1 for torsion and d for
residue-invertible prime-power torsion. -/

/-! ## Layer 11: I-complete arc-covers and formal schemes -/

/- ICompleteArcCover and formalArc are specified with the complete valuation tests in the roadmap. -/

/-! ## Layer 12: perfectoid bases and integral hyperdescent -/

/- Perfectoid structure, formal-target representables, tilting and A_inf hyperdescent use the imported
perfectoid and prism carriers. The README also specifies every heavy definition omitted here:
ValuationInterval, UniversalDescent, VCover, HSite, ArcCover, CotruncatedTarget, Finitary,
DetectionFamily, BooleanSheaf, Excision, BoundedArcSite, HDifferentialFunctor, RigidFunctor,
ArcTCover, ArcTEquivalence, GenericFibreCohomology, TotalIntegralClosure, ICompleteArcCover
and FormalArcSite. ArcCover restricts to the light IsRingArcCover predicate on affines.
The five real-bodied predicates above are IsValuationExtension, IsAbsolutelyIntegrallyClosed,
IsRingArcCover, IsSpectralSubmersion and FormalGlueingDatum.
-/

end TauCetiRoadmap.ArcTopologyAndDescent
