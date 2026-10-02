/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names and
signatures. This is a partial checkpoint; every implementation is unchecked.
The current elaboration receipt is in the handoff. Open source-proof and baseline adapters
are listed in the packet; admitted signatures certify no implementation.
-/
import Mathlib.Algebra.Category.CommAlgCat.FiniteType
import Mathlib.CategoryTheory.EssentiallySmall
import Mathlib.CategoryTheory.Filtered.Basic
import Mathlib.CategoryTheory.ObjectProperty.FullSubcategory
import Mathlib.RingTheory.Etale.Basic
import Mathlib.RingTheory.Etale.StandardEtale
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.RingTheory.Jacobson.Ideal
import Mathlib.RingTheory.LocalRing.Basic
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.TensorProduct.Quotient
import Mathlib.Data.ZMod.Basic

open CategoryTheory CategoryTheory.Limits
open scoped TensorProduct
universe u
namespace TauCeti.Henselization
variable {R : Type u} [CommRing R]

-- node: SchemeAndStackFoundations:SF.0/etale-neighbourhood
/-- Canonical reduction map: a baseline instantiation, not a new quotient. -/
abbrev reducedMap (I : Ideal R) (B : CommAlgCat.{u} R) :
    R ⧸ I →+* B ⧸ I.map (algebraMap R B) :=
  Ideal.quotientMap (I.map (algebraMap R B)) (algebraMap R B) Ideal.le_comap_map

def IsNeighbourhood (I : Ideal R) : ObjectProperty (CommAlgCat.{u} R) :=
  fun B => Algebra.Etale R B ∧ Function.Bijective (reducedMap I B)

abbrev Neighbourhood (I : Ideal R) := (IsNeighbourhood I).FullSubcategory

lemma isNeighbourhood_self (I : Ideal R) :
    IsNeighbourhood I (CommAlgCat.of R R) := by sorry

lemma isNeighbourhood_localization (I : Ideal R) (x : R)
    (hx : IsUnit (Ideal.Quotient.mk I x)) :
    IsNeighbourhood I (CommAlgCat.of R (Localization.Away x)) := by sorry

-- test: TauCeti.Henselization.neighbourhood_identity
example (I : Ideal R) : IsNeighbourhood I (CommAlgCat.of R R) := by sorry
-- test: TauCeti.Henselization.neighbourhood_invert_two
example : IsNeighbourhood (Ideal.span {(5 : ℤ)})
    (CommAlgCat.of ℤ (Localization.Away (2 : ℤ))) := by sorry
-- test: TauCeti.Henselization.neighbourhood_reject_invert_five
example : ¬ IsNeighbourhood (Ideal.span {(5 : ℤ)})
    (CommAlgCat.of ℤ (Localization.Away (5 : ℤ))) := by sorry
-- test: TauCeti.Henselization.neighbourhood_reject_two_sheets
example : ¬ IsNeighbourhood (Ideal.span {(5 : ℤ)})
    (CommAlgCat.of ℤ (ℤ × ℤ)) := by sorry

-- node: SchemeAndStackFoundations:SF.0/tensor-neighbourhood
lemma isNeighbourhood_tensor (I : Ideal R) (B C : CommAlgCat.{u} R)
    (hB : IsNeighbourhood I B) (hC : IsNeighbourhood I C) :
    IsNeighbourhood I (CommAlgCat.of R (B ⊗[R] C)) := by sorry

-- node: SchemeAndStackFoundations:SF.0/parallel-equalization
lemma parallel_equalization (I : Ideal R) {B C : Neighbourhood I}
    (f g : B ⟶ C) : ∃ (D : Neighbourhood I) (h : C ⟶ D), f ≫ h = g ≫ h := by sorry

-- node: SchemeAndStackFoundations:SF.0/filtered-neighbourhoods
theorem neighbourhood_isFiltered (I : Ideal R) : IsFiltered (Neighbourhood I) := by sorry
attribute [instance] neighbourhood_isFiltered

-- node: SchemeAndStackFoundations:SF.0/small-neighbourhoods
lemma neighbourhood_essentiallySmall (I : Ideal R) :
    EssentiallySmall.{u} (Neighbourhood I) := by sorry
attribute [instance] neighbourhood_essentiallySmall

-- node: SchemeAndStackFoundations:key/henselization
/-- The small diagram is a reindexing of the existing inclusion. -/
noncomputable def diagram (I : Ideal R) :
    SmallModel.{u} (Neighbourhood I) ⥤ CommAlgCat.{u} R :=
  (equivSmallModel.{u} (Neighbourhood I)).inverse ⋙ (IsNeighbourhood I).ι

noncomputable def algebra (I : Ideal R) : CommAlgCat.{u} R := colimit (diagram I)

noncomputable abbrev extended (I : Ideal R) : Ideal (algebra I) := I.map (algebraMap R (algebra I))

noncomputable def stage (I : Ideal R) (B : SmallModel.{u} (Neighbourhood I)) :
    (diagram I).obj B →ₐ[R] algebra I := (colimit.ι (diagram I) B).hom

lemma stage_naturality (I : Ideal R) {B C : SmallModel.{u} (Neighbourhood I)}
    (f : B ⟶ C) :
    (stage I C).comp ((diagram I).map f).hom = stage I B := by sorry

-- node: SchemeAndStackFoundations:SF.0/residue-comparison
lemma quotient_bijective (I : Ideal R) :
    Function.Bijective (reducedMap I (algebra I)) := by sorry

-- node: SchemeAndStackFoundations:SF.0/jacobson-containment
lemma extended_le_jacobson (I : Ideal R) :
    extended I ≤ Ideal.jacobson (⊥ : Ideal (algebra I)) := by sorry

-- node: SchemeAndStackFoundations:SF.0/simple-root-realization
lemma simple_root_lift (I : Ideal R) (f : Polynomial (algebra I))
    (hf : f.Monic) (a0 : algebra I) (hroot : f.eval a0 ∈ extended I)
    (hderiv : IsUnit (Ideal.Quotient.mk (extended I) (f.derivative.eval a0))) :
    ∃ a : algebra I, f.eval a = 0 ∧ a - a0 ∈ extended I := by sorry

-- node: SchemeAndStackFoundations:SF.0/henselian-pair
theorem henselian (I : Ideal R) : HenselianRing (algebra I) (extended I) := by sorry
attribute [instance] henselian

-- node: SchemeAndStackFoundations:SF.0/etale-lift-uniqueness
lemma etale_lift_unique (I : Ideal R) (hI : I ≤ Ideal.jacobson (⊥ : Ideal R))
    (B : CommAlgCat.{u} R) [Algebra.Etale R B] (f g : B →ₐ[R] R)
    (hfg : (Ideal.Quotient.mk I).comp f.toRingHom =
      (Ideal.Quotient.mk I).comp g.toRingHom) : f = g := by sorry

-- node: SchemeAndStackFoundations:SF.0/etale-section-comparison
theorem exists_etale_lift (I : Ideal R) [HenselianRing R I]
    (B : CommAlgCat.{u} R) [Algebra.Etale R B] (σ : B →+* R ⧸ I)
    (hσ : σ.comp (algebraMap R B) = Ideal.Quotient.mk I) :
    ∃ τ : B →ₐ[R] R, (Ideal.Quotient.mk I).comp τ.toRingHom = σ := by sorry

-- node: SchemeAndStackFoundations:SF.0/initial-henselian-pair
theorem existsUnique_lift (I : Ideal R) {S : Type u} [CommRing S]
    (J : Ideal S) [HenselianRing S J] (f : R →+* S) (hf : I ≤ J.comap f) :
    ∃! g : algebra I →+* S, g.comp (algebraMap R (algebra I)) = f := by sorry

-- node: SchemeAndStackFoundations:SF.0/fixed-henselian-pair
lemma fixed_of_henselian (I : Ideal R) [HenselianRing R I] :
    Nonempty (algebra I ≃ₐ[R] R) := by sorry

-- test: TauCeti.Henselization.henselization_zero_ideal
example : Nonempty (algebra (⊥ : Ideal R) ≃ₐ[R] R) := by sorry
-- test: TauCeti.Henselization.henselization_unit_ideal
example : Subsingleton (algebra (⊤ : Ideal R)) := by sorry
-- test: TauCeti.Henselization.henselization_fixed_pair
example (I : Ideal R) [HenselianRing R I] : Nonempty (algebra I ≃ₐ[R] R) := by sorry
-- test: TauCeti.Henselization.henselization_ordinary_finite_field
example : Nonempty (algebra (⊥ : Ideal (ZMod 5)) ≃ₐ[ZMod 5] ZMod 5) := by sorry

-- node: SchemeAndStackFoundations:SF.0/ordinary-local-henselization
lemma local_henselization [IsLocalRing R] :
    IsLocalRing (algebra (IsLocalRing.maximalIdeal R)) := by sorry

section Functoriality
variable {S T : Type u} [CommRing S] [CommRing T]

-- node: SchemeAndStackFoundations:SF.0/henselization-map
/-- The chosen extension of η_S ∘ f by the existing initial-pair theorem. -/
noncomputable def map (I : Ideal R) (J : Ideal S) (f : R →+* S)
    (hf : I ≤ J.comap f) : algebra I →+* algebra J :=
  Classical.choose (existsUnique_lift I (extended J)
    ((algebraMap S (algebra J)).comp f) (by
      intro r hr
      exact Ideal.mem_map_of_mem (algebraMap S (algebra J)) (hf hr))).exists

-- node: SchemeAndStackFoundations:SF.0/henselization-map-unit
lemma map_comp_unit (I : Ideal R) (J : Ideal S) (f : R →+* S)
    (hf : I ≤ J.comap f) :
    (map I J f hf).comp (algebraMap R (algebra I)) =
      (algebraMap S (algebra J)).comp f := by sorry

-- node: SchemeAndStackFoundations:SF.0/henselization-map-ideal
lemma map_extended_le (I : Ideal R) (J : Ideal S) (f : R →+* S)
    (hf : I ≤ J.comap f) :
    extended I ≤ (extended J).comap (map I J f hf) := by sorry

-- node: SchemeAndStackFoundations:SF.0/henselization-map-identity
lemma map_id (I : Ideal R) :
    map I I (RingHom.id R) (by intro r hr; exact hr) =
      RingHom.id (algebra I) := by sorry

-- node: SchemeAndStackFoundations:SF.0/henselization-map-composition
lemma map_comp (I : Ideal R) (J : Ideal S) (K : Ideal T)
    (f : R →+* S) (g : S →+* T)
    (hf : I ≤ J.comap f) (hg : J ≤ K.comap g) :
    map I K (g.comp f) (by intro r hr; exact hg (hf hr)) =
      (map J K g hg).comp (map I J f hf) := by sorry

-- node: SchemeAndStackFoundations:SF.0/henselization-residue-naturality
lemma quotient_naturality (I : Ideal R) (J : Ideal S) (f : R →+* S)
    (hf : I ≤ J.comap f) :
    (Ideal.quotientMap (extended J) (map I J f hf) (map_extended_le I J f hf)).comp
        (reducedMap I (algebra I)) =
      (reducedMap J (algebra J)).comp (Ideal.quotientMap J f hf) := by sorry

-- test: TauCeti.Henselization.map_field_identity
example : map (⊥ : Ideal (ZMod 5)) ⊥ (RingHom.id (ZMod 5))
    (by intro r hr; exact hr) = RingHom.id (algebra (⊥ : Ideal (ZMod 5))) := by sorry

-- test: TauCeti.Henselization.map_scalar_seven
example : map (⊥ : Ideal ℤ) (⊥ : Ideal (ZMod 5)) (Int.castRingHom (ZMod 5))
    (by intro r hr; have hr0 : r = 0 := hr; simp [hr0])
    (algebraMap ℤ (algebra (⊥ : Ideal ℤ)) 7) =
      algebraMap (ZMod 5) (algebra (⊥ : Ideal (ZMod 5))) 2 := by sorry

-- test: TauCeti.Henselization.map_quotient_nine
example : let I : Ideal (ZMod 9) := Ideal.span {(3 : ZMod 9)}
    map I (⊥ : Ideal (ZMod 9 ⧸ I)) (Ideal.Quotient.mk I)
      (by intro r hr; exact (Ideal.Quotient.eq_zero_iff_mem).2 hr)
      (algebraMap (ZMod 9) (algebra I) 3) = 0 := by sorry

-- test: TauCeti.Henselization.map_can_collapse
example : ¬ Function.Injective
    (map (⊥ : Ideal (ZMod 5)) (⊤ : Ideal (ZMod 5)) (RingHom.id (ZMod 5))
      (by intro r hr; trivial)) := by sorry

end Functoriality

end TauCeti.Henselization
