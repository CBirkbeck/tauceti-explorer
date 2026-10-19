import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.RingTheory.Localization.AtPrime.Basic
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.MvPowerSeries.Inverse
import Mathlib.RingTheory.LocalRing.ResidueField.Defs
import Mathlib.RingTheory.Ideal.MinimalPrime.Basic
import Mathlib.Algebra.Module.Torsion.Free
import Mathlib.RingTheory.Etale.Basic
import Mathlib.RingTheory.FiniteType
import Mathlib.RingTheory.KrullDimension.Basic
import Mathlib.Algebra.CharP.Defs

/-!
# Étale duality, cycle classes and perverse sheaves, Part II: suggested signatures

This file is not the roadmap and is not exhaustive. The definitive mathematical roadmap is
`research/blueprint/readmes/EtaleDualityAndPerverseSheavesPartII.md`. The statements below
suggest Lean forms so that contributors and reviewers converge on names and signatures.

The pinned Mathlib and Tau Ceti have no derived étale cohomology of schemes (only the underived
`AlgebraicGeometry.Scheme.ellAdicSheaf`), no strict henselization of schemes, no alteration
topology and no perfectoid predicate. The cohomological targets of every layer are therefore
README targets. What the pins can state is the commutative algebra of Layer EQ.1:

* partially algebraizable complete local rings (Illusie–Laszlo–Orgogozo, Exposé V, 2.1.1),
  with their API and unit tests;
* the Cohen–Gabber theorem in characteristic `p` (Exposé IV, Théorème 2.1.1);
* partial algebraization in equal characteristic (Exposé V, Théorème 2.1.2).

The definitions and constructions whose carriers are not at the pins are specified in the README
under the following names (API items and unit tests included):

* `alteration-category` — `AltCat`, `AltCat.md`, `AltCat.hasPullbacks`, `AltCat.final`, `AltCat.flatBaseChange`, `MaximallyEllPrimeFinite`, `AltCat.test_final`, `AltCat.test_blowup_product`, `AltCat.test_closed_point_not_object`, `AltCat.test_alteration_compat`
* `ell-prime-alteration-topology` — `AltTopology`, `AltTopology.etale_mem`, `AltTopology.proper_mem`, `AltTopology.flatBaseChange`, `AltTopology.mono`, `AltHypercover`, `AltTopology.test_gaussian_odd`, `AltTopology.test_gaussian_two`, `AltTopology.test_ell_one`, `AltTopology.test_open_not_cover`, `AltTopology.test_nisnevich`
* `partially-algebraizable` — `PartiallyAlgebraizable.geometric`, `PartiallyAlgebraizable.test_not_finite_type_over_A`
* `oriented-product-topos` — `OrientedProduct`, `OrientedProduct.fst`, `OrientedProduct.snd`, `OrientedProduct.twoCell`, `OrientedProduct.lift`, `OrientedProduct.map`, `OrientedProduct.coherent`, `OrientedProduct.test_point_base`, `OrientedProduct.test_trait`, `OrientedProduct.test_points`, `OrientedProduct.test_not_fibre_product`
* `oriented-alteration-topology` — `OrientedAltSite`, `OrientedAltSite.ofAltHypercover`, `OrientedAltSite.augmentation`, `OrientedAltSite.baseChange`, `OrientedAltSite.test_trivial`, `OrientedAltSite.test_proper_base`, `OrientedAltSite.test_zariski_Y`, `OrientedAltSite.test_not_cover`
* `dimension-function` — `DimensionFunction`, `DimensionFunction.etaleRestrict`, `DimensionFunction.sub_locallyConstant`, `DimensionFunction.ofStrictLocal`, `DimensionFunction.negCodim`, `DimensionFunction.ofFiniteType`, `DimensionFunction.supSheaf`, `DimensionFunction.test_trait`, `DimensionFunction.test_field`, `DimensionFunction.test_affine_line_over_trait`, `DimensionFunction.test_line_plane`, `DimensionFunction.test_finite_type_field`
* `transition-morphism` — `TransitionMorphism`, `TransitionMorphism.natural`, `TransitionMorphism.comp`, `TransitionMorphism.finite`, `TransitionMorphism.trait`, `TransitionMorphism.etale`, `TransitionMorphism.test_trait_constant`, `TransitionMorphism.test_identity`, `TransitionMorphism.test_composition`, `TransitionMorphism.test_skyscraper`
* `potential-dualizing-complex` — `PotentialDualizing`, `PotentialDualizing.etaleRestrict`, `PotentialDualizing.shift`, `PotentialDualizing.regularPullback`, `PotentialDualizing.shriekPullback`, `PotentialDualizing.unique`, `PotentialDualizing.mem_perv`, `PotentialDualizing.test_point`, `PotentialDualizing.test_trait`, `PotentialDualizing.test_trait_unshifted`, `PotentialDualizing.test_empty`, `PotentialDualizing.test_finite_type_field`
* `gabber-perverse-t-structure` — `GabberTStructure`, `GabberTStructure.le_iff`, `GabberTStructure.ge_iff`, `GabberTStructure.heartStack`, `GabberTStructure.etale`, `GabberTStructure.shift`, `GabberTStructure.test_point`, `GabberTStructure.test_trait_dualizing`, `GabberTStructure.test_trait_constant`, `GabberTStructure.test_middle`
* `dualizing-complex` — `IsDualizingComplex`, `IsDualizingComplex.dual`, `IsDualizingComplex.biduality`, `IsDualizingComplex.restrictOpen`, `IsDualizingComplex.unique`, `IsDualizingComplex.sga5`, `IsDualizingComplex.test_point`, `IsDualizingComplex.test_double`, `IsDualizingComplex.test_empty`, `IsDualizingComplex.test_finite_type`
* `matched-punctured-opens` — `MatchedPuncturedOpen`, `MatchedPuncturedOpen.mono`, `MatchedPuncturedOpen.top`, `MatchedPuncturedOpen.generic`, `MatchedPuncturedOpen.basicOpen`, `MatchedPuncturedOpen.completion`, `MatchedPuncturedOpen.test_top`, `MatchedPuncturedOpen.test_generic`, `MatchedPuncturedOpen.test_point_fibre`, `MatchedPuncturedOpen.test_not_arbitrary_open`
-/

namespace TauCetiRoadmap.EtaleDualityAndPerverseSheavesPartII

universe u v

open IsLocalRing

/-! ## Layer EQ.1: partially algebraizable complete local rings -/

/-- Illusie–Laszlo–Orgogozo, Exposé V, 2.1.1. A complete noetherian local ring `A` with a family
of ideals `I` is *partially algebraizable* if there are a complete noetherian local ring `B` of
smaller Krull dimension, a finite-type `B`-algebra `C`, a maximal ideal `n` of `C` over the
maximal ideal of `B`, and an isomorphism of `A` with the completion of `C_n` under which every
`I e` is extended from an ideal of `C_n`. -/
def PartiallyAlgebraizable (A : Type u) [CommRing A] [IsLocalRing A] {E : Type v}
    (I : E → Ideal A) : Prop :=
  ∃ (B : Type u) (_ : CommRing B) (_ : IsLocalRing B) (_ : IsNoetherianRing B)
    (_ : IsAdicComplete (maximalIdeal B) B) (C : Type u) (_ : CommRing C) (_ : Algebra B C)
    (_ : Algebra.FiniteType B C) (n : Ideal C) (_ : n.IsMaximal),
    n.comap (algebraMap B C) = maximalIdeal B ∧ ringKrullDim B < ringKrullDim A ∧
    ∃ e : A ≃+* AdicCompletion (maximalIdeal (Localization.AtPrime n)) (Localization.AtPrime n),
      ∀ i, ∃ J : Ideal (Localization.AtPrime n),
        I i = (J.map (algebraMap (Localization.AtPrime n)
          (AdicCompletion (maximalIdeal (Localization.AtPrime n))
            (Localization.AtPrime n)))).comap e.toRingHom

namespace PartiallyAlgebraizable

variable {A : Type u} [CommRing A] [IsLocalRing A] {E : Type v} {I : E → Ideal A}

/-- Invariance under ring isomorphisms carrying the ideals. -/
theorem of_iso {A' : Type u} [CommRing A'] [IsLocalRing A'] (h : PartiallyAlgebraizable A I)
    (φ : A ≃+* A') : PartiallyAlgebraizable A' (fun i => (I i).map φ.toRingHom) := by
  sorry

/-- The base of a presentation has smaller Krull dimension. -/
theorem dim_lt (h : PartiallyAlgebraizable A I) :
    ∃ (B : Type u) (_ : CommRing B), ringKrullDim B < ringKrullDim A := by
  sorry

/-- Enlarging the family by the intersection of two of its members keeps it partially
algebraizable, with the same presentation (completion is flat). -/
theorem inter (h : PartiallyAlgebraizable A I) (i j : E) :
    PartiallyAlgebraizable A (fun o : Option E => o.elim (I i ⊓ I j) I) := by
  sorry

/-- `test_field`: a field is never partially algebraizable, since no local ring has negative
dimension. -/
example (k : Type u) [Field k] (I : E → Ideal k) : ¬ PartiallyAlgebraizable k I := by
  sorry

/-- `test_power_series`: `k⟦x₀, …, x_d⟧` with the coordinate ideals is partially algebraizable
over `k⟦x₀, …, x_{d-1}⟧`. -/
example (k : Type u) [Field k] (d : ℕ) :
    PartiallyAlgebraizable (MvPowerSeries (Fin (d + 1)) k)
      (fun i : Fin (d + 1) => Ideal.span {MvPowerSeries.X i}) := by
  sorry

/-- `test_graph`: in `k⟦x, y⟧` the ideal `(y - x²)` is extended from `k⟦x⟧[y]` localized at
`(x, y)`. -/
example (k : Type u) [Field k] :
    PartiallyAlgebraizable (MvPowerSeries (Fin 2) k)
      (fun _ : Unit => Ideal.span {MvPowerSeries.X 1 - MvPowerSeries.X 0 ^ 2}) := by
  sorry

end PartiallyAlgebraizable

/-! ## Layer EQ.1: the Cohen–Gabber theorem and partial algebraization -/

/-- Illusie–Laszlo–Orgogozo, Exposé IV, Théorème 2.1.1 (Gabber). A complete noetherian local
reduced ring of characteristic `p`, equidimensional of dimension `d`, is finite, torsion-free and
generically étale over a power series subring `k⟦t₁, …, t_d⟧` with the same residue field. -/
theorem cohenGabber (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A] [IsLocalRing A]
    [IsNoetherianRing A] [IsAdicComplete (maximalIdeal A) A] [CharP A p] [IsReduced A] (d : ℕ)
    (hequi : ∀ P ∈ minimalPrimes A, ringKrullDim (A ⧸ P) = d) :
    ∃ f : MvPowerSeries (Fin d) (ResidueField A) →+* A, Function.Injective f ∧
      (∀ c : ResidueField A, residue A (f (MvPowerSeries.C c)) = c) ∧
      (letI := f.toAlgebra
       Module.Finite (MvPowerSeries (Fin d) (ResidueField A)) A ∧
        Module.IsTorsionFree (MvPowerSeries (Fin d) (ResidueField A)) A) ∧
      ∃ g : MvPowerSeries (Fin d) (ResidueField A), g ≠ 0 ∧
        (letI := (Localization.awayMap f g).toAlgebra
         Algebra.Etale (Localization.Away g) (Localization.Away (f g))) := by
  sorry

/-- Illusie–Laszlo–Orgogozo, Exposé V, Théorème 2.1.2. A complete noetherian local reduced ring
containing a field, which is not itself a field, is partially algebraizable for every finite
family of ideals. -/
theorem partiallyAlgebraizable_of_equalCharacteristic (A : Type u) [CommRing A] [IsLocalRing A]
    [IsNoetherianRing A] [IsAdicComplete (maximalIdeal A) A] [IsReduced A] (k : Type u) [Field k]
    [Algebra k A] (hA : ¬ IsField A) {E : Type v} [Finite E] (I : E → Ideal A) :
    PartiallyAlgebraizable A I := by
  sorry

end TauCetiRoadmap.EtaleDualityAndPerverseSheavesPartII
