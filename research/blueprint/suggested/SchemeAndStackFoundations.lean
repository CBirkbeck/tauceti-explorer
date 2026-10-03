import Mathlib.AlgebraicGeometry.IdealSheaf.Functorial
import Mathlib.LinearAlgebra.TensorProduct.Quotient
import Mathlib.RingTheory.Ideal.Colon
import Mathlib.RingTheory.Flat.Equalizer
import Mathlib.LinearAlgebra.TensorProduct.Pi
import Mathlib.RingTheory.Ideal.Maps
import Mathlib.RingTheory.Finiteness.Basic
/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names and
signatures. This is a partial checkpoint; every implementation is unchecked.
The current elaboration receipt is in the handoff. Open source-proof and baseline adapters
are listed in the packet; admitted signatures certify no implementation.
-/
import Mathlib.Algebra.Category.CommAlgCat.FiniteType
import Mathlib.Algebra.Category.Ring.FilteredColimits
import Mathlib.CategoryTheory.Limits.ConcreteCategory.Basic
import Mathlib.CategoryTheory.Limits.Constructions.Over.Connected
import Mathlib.CategoryTheory.Filtered.Connected
import Mathlib.Algebra.Polynomial.Monic
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

-- node: SchemeAndStackFoundations:SF.0/extended-ideal-stage
lemma mem_extended_iff_exists_stage (I : Ideal R)
    (B : SmallModel.{u} (Neighbourhood I)) (b : (diagram I).obj B) :
    stage I B b ∈ extended I ↔
      ∃ (C : SmallModel.{u} (Neighbourhood I)) (t : B ⟶ C),
        ((diagram I).map t).hom b ∈ I.map (algebraMap R ((diagram I).obj C)) := by sorry

-- node: SchemeAndStackFoundations:SF.0/monic-polynomial-stage
lemma exists_stage_monic_polynomial (I : Ideal R) (f : Polynomial (algebra I))
    (hf : f.Monic) :
    ∃ (B : SmallModel.{u} (Neighbourhood I)) (p : Polynomial ((diagram I).obj B)),
      p.Monic ∧ p.map (stage I B).toRingHom = f := by sorry

-- node: SchemeAndStackFoundations:SF.0/quotient-unit-stage
lemma exists_stage_quotient_unit (I : Ideal R)
    (B : SmallModel.{u} (Neighbourhood I)) (b : (diagram I).obj B)
    (hb : IsUnit (Ideal.Quotient.mk (extended I) (stage I B b))) :
    ∃ (C : SmallModel.{u} (Neighbourhood I)) (t : B ⟶ C),
      IsUnit (Ideal.Quotient.mk (I.map (algebraMap R ((diagram I).obj C)))
        (((diagram I).map t).hom b)) := by sorry

-- node: SchemeAndStackFoundations:SF.0/simple-root-stage
lemma exists_stage_simple_root (I : Ideal R) (f : Polynomial (algebra I))
    (hf : f.Monic) (a0 : algebra I) (hroot : f.eval a0 ∈ extended I)
    (hderiv : IsUnit (Ideal.Quotient.mk (extended I) (f.derivative.eval a0))) :
    ∃ (B : SmallModel.{u} (Neighbourhood I))
      (p : Polynomial ((diagram I).obj B)) (b : (diagram I).obj B),
      p.Monic ∧ p.map (stage I B).toRingHom = f ∧ stage I B b = a0 ∧
        p.eval b ∈ I.map (algebraMap R ((diagram I).obj B)) ∧
        IsUnit (Ideal.Quotient.mk (I.map (algebraMap R ((diagram I).obj B)))
          (p.derivative.eval b)) := by sorry

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



section EtaleSection
variable {B : Type u} [CommRing B] [Algebra R B] [Algebra.Etale R B]

-- node: SchemeAndStackFoundations:SF.0/etale-section-selector
lemma etale_section_selector (σ : B →ₐ[R] R) :
    ∃ e : B, IsIdempotentElem e ∧ σ e = 1 ∧
      ∀ b : B, e * b = e * algebraMap R B (σ b) := by
  let : Algebra B R := σ.toAlgebra
  have : IsScalarTower R B R := IsScalarTower.of_algebraMap_eq' σ.comp_algebraMap.symm
  have hσ : Function.Surjective σ := fun r ↦ ⟨algebraMap R B r, σ.commutes r⟩
  have : Algebra.FormallyEtale B R := Algebra.FormallyEtale.of_restrictScalars (R := R)
  obtain ⟨k, hk, hker⟩ :=
    (Ideal.isIdempotentElem_iff_of_fg _ (Algebra.FinitePresentation.ker_fG_of_surjective σ hσ)).mp
      ((Algebra.FormallyEtale.iff_of_surjective hσ).mp inferInstance)
  have hσk : σ k = 0 := by
    apply RingHom.mem_ker.mp
    change k ∈ RingHom.ker σ.toRingHom
    rw [hker]
    exact Ideal.mem_span_singleton_self k
  refine ⟨1 - k, hk.one_sub, by simp [hσk], ?_⟩
  intro b
  have hb : b - algebraMap R B (σ b) ∈ RingHom.ker σ.toRingHom := by
    simp [RingHom.mem_ker]
  rw [hker] at hb
  obtain ⟨c, hc⟩ := Ideal.mem_span_singleton'.mp hb
  have hz : (1 - k) * (b - algebraMap R B (σ b)) = 0 := by
    rw [← hc]
    calc
      (1 - k) * (c * k) = c * (k - k * k) := by ring
      _ = 0 := by rw [hk]; ring
  exact sub_eq_zero.mp (by simpa only [mul_sub] using hz)


-- node: SchemeAndStackFoundations:SF.0/etale-selector-kernel
omit [Algebra.Etale R B] in
lemma etale_selector_kernel (σ : B →ₐ[R] R) {e : B}
    (heσ : σ e = 1) (he : ∀ b : B, e * b = e * algebraMap R B (σ b)) :
    RingHom.ker σ.toRingHom = Ideal.span {1 - e} := by
  apply le_antisymm
  · intro b hb
    have hzb : e * b = 0 := by
      have hσb : σ b = 0 := hb
      simpa only [hσb, map_zero, mul_zero] using he b
    exact Ideal.mem_span_singleton'.mpr ⟨b, by calc
      b * (1 - e) = b - e * b := by ring
      _ = b := by rw [hzb]; ring⟩
  · apply Ideal.span_le.mpr
    intro b hb
    obtain rfl := Set.mem_singleton_iff.mp hb
    simp [RingHom.mem_ker, heσ]

-- node: SchemeAndStackFoundations:SF.0/etale-section-product
lemma etale_section_product (σ : B →ₐ[R] R) :
    ∃ e : B, IsIdempotentElem e ∧ σ e = 1 ∧
      ∃ E : B ≃ₐ[R] R × (B ⧸ Ideal.span {e}), ∀ b : B, (E b).1 = σ b := by
  obtain ⟨e, he, heσ, hselect⟩ := etale_section_selector σ
  have hker := etale_selector_kernel σ heσ hselect
  have hσ : Function.Surjective σ := fun r ↦ ⟨algebraMap R B r, σ.commutes r⟩
  let E₁ := AlgEquiv.prodQuotientOfIsIdempotentElem R he.one_sub he (by ring)
    (by change (1-e)*e=0; rw [sub_mul, one_mul, he]; ring)
  let E₂ : (B ⧸ Ideal.span {1-e}) ≃ₐ[R] R :=
    ((Ideal.span {1-e}).quotientEquivAlgOfEq R hker.symm).trans
      (Ideal.quotientKerAlgEquivOfSurjective hσ)
  refine ⟨e, he, heσ, E₁.trans (AlgEquiv.prodCongr E₂ (.refl)), ?_⟩
  intro b
  rfl

-- node: SchemeAndStackFoundations:SF.0/etale-section-localization
lemma etale_section_localization (σ : B →ₐ[R] R) :
    ∃ e : B, IsIdempotentElem e ∧ σ e = 1 ∧
      ∃ E : Localization.Away e ≃ₐ[R] R,
        ∀ b : B, E (algebraMap B (Localization.Away e) b) = σ b := by
  obtain ⟨e, he, heσ, hselect⟩ := etale_section_selector σ
  let : Algebra B R := σ.toAlgebra
  have : IsScalarTower R B R := IsScalarTower.of_algebraMap_eq' σ.comp_algebraMap.symm
  have : IsLocalization.Away e R := IsLocalization.away_of_isIdempotentElem he
    (etale_selector_kernel σ heσ hselect)
    (fun r ↦ ⟨algebraMap R B r, σ.commutes r⟩)
  let E := (IsLocalization.algEquiv (Submonoid.powers e) (Localization.Away e) R).restrictScalars R
  exact ⟨e, he, heσ, E, fun b ↦ (IsLocalization.algEquiv (Submonoid.powers e) (Localization.Away e) R).commutes b⟩

-- acceptance: first-sheet selector has its actual projection and multiplication law.
example : IsIdempotentElem ((1, 0) : ZMod 5 × ZMod 5) ∧
    (AlgHom.fst (ZMod 5) (ZMod 5) (ZMod 5)) (1, 0) = 1 ∧
    ∀ b : ZMod 5 × ZMod 5, (1, 0) * b =
      (1, 0) * algebraMap (ZMod 5) (ZMod 5 × ZMod 5)
        ((AlgHom.fst (ZMod 5) (ZMod 5) (ZMod 5)) b) := by
  refine ⟨?_, by decide, by decide⟩
  change ((1, 0) : ZMod 5 × ZMod 5) * (1, 0) = (1, 0)
  decide

-- acceptance: the complementary idempotent selects the other sheet.
example : ¬ ((AlgHom.fst (ZMod 5) (ZMod 5) (ZMod 5))
    ((0, 1) : ZMod 5 × ZMod 5) = 1) := by decide

-- acceptance: the actual section kernel is the complementary ideal.
example : RingHom.ker (AlgHom.fst (ZMod 5) (ZMod 5) (ZMod 5)).toRingHom =
    Ideal.span {1 - ((1, 0) : ZMod 5 × ZMod 5)} := by
  apply etale_selector_kernel (AlgHom.fst (ZMod 5) (ZMod 5) (ZMod 5)) (by decide)
  decide

-- acceptance: product comparison carries the given section, not an arbitrary projection.
example (σ : B →ₐ[R] R) :
    ∃ e : B, IsIdempotentElem e ∧ σ e = 1 ∧
      ∃ E : B ≃ₐ[R] R × (B ⧸ Ideal.span {e}), ∀ b : B, (E b).1 = σ b :=
  etale_section_product σ

-- acceptance: localization comparison fixes each source element's actual section image.
example (σ : B →ₐ[R] R) :
    ∃ e : B, IsIdempotentElem e ∧ σ e = 1 ∧
      ∃ E : Localization.Away e ≃ₐ[R] R,
        ∀ b : B, E (algebraMap B (Localization.Away e) b) = σ b :=
  etale_section_localization σ

end EtaleSection


-- node: SchemeAndStackFoundations:SF.0/etale-lift-uniqueness
lemma etale_lift_unique (I : Ideal R) (hI : I ≤ Ideal.jacobson (⊥ : Ideal R))
    (B : CommAlgCat.{u} R) [Algebra.Etale R B] (f g : B →ₐ[R] R)
    (hfg : (Ideal.Quotient.mk I).comp f.toRingHom =
      (Ideal.Quotient.mk I).comp g.toRingHom) : f = g := by
  obtain ⟨e, he, hfe, hselect⟩ := etale_section_selector f
  have hge : g e - 1 ∈ I := by
    apply Ideal.Quotient.eq_zero_iff_mem.mp
    have h : Ideal.Quotient.mk I (g e) = 1 := by
      have hh : Ideal.Quotient.mk I (g e) = Ideal.Quotient.mk I (f e) :=
        (DFunLike.congr_fun hfg e).symm
      simpa only [hfe, map_one] using hh
    rw [map_sub, map_one, h, sub_self]
  have hu : IsUnit (g e) := Ideal.isUnit_of_sub_one_mem_jacobson_bot _ (hI hge)
  have heq : g e = 1 := by
    have hid : g e * g e = g e * 1 := by simpa using congrArg g he
    exact hu.mul_left_cancel hid
  ext b
  have h := congrArg g (hselect b)
  simpa [heq] using h.symm

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

-- acceptance: zero ideal detects eventual zero, not injectivity of stage maps.
example (B : SmallModel.{u} (Neighbourhood (⊥ : Ideal R)))
    (b : (diagram (⊥ : Ideal R)).obj B) (hb : stage (⊥ : Ideal R) B b = 0) :
    ∃ (C : SmallModel.{u} (Neighbourhood (⊥ : Ideal R))) (t : B ⟶ C),
      ((diagram (⊥ : Ideal R)).map t).hom b = 0 := by sorry

-- acceptance: a quotient unit need not be a unit before quotienting.
example : ¬ IsUnit (2 : ZMod 30) ∧
    IsUnit (Ideal.Quotient.mk (Ideal.span {(5 : ZMod 30)}) (2 : ZMod 30)) := by sorry

-- acceptance: the empty lower-coefficient family still admits a monic lift.
example (I : Ideal R) :
    ∃ (B : SmallModel.{u} (Neighbourhood I)) (p : Polynomial ((diagram I).obj B)),
      p.Monic ∧ p.map (stage I B).toRingHom = (1 : Polynomial (algebra I)) := by sorry

-- acceptance: the same root is multiple in characteristic two.
example : ¬ IsUnit (((Polynomial.X ^ 2 - 1 : Polynomial (ZMod 2)).derivative).eval 1) := by sorry

end TauCeti.Henselization

open TensorProduct
noncomputable section
namespace TauCeti.SchemeFoundations.FlatAnnihilator
universe faU faV faW faZ
variable {R : Type faU} [CommRing R] (S : Type faV) [CommRing S] [Algebra R S]
variable {M : Type faW} [AddCommGroup M] [Module R M]

lemma ideal_map_eq_tensor_range (I : Ideal R) :
    I.map (algebraMap R S) = LinearMap.range
      ((AlgebraTensorModule.rid R S S).toLinearMap ∘ₗ I.subtype.baseChange S) := by
  sorry

lemma mem_map_kernel_iff [Module.Flat R S] (f : R →ₗ[R] M) (s : S) :
    s ∈ Ideal.map (algebraMap R S) f.ker ↔ s ⊗ₜ[R] f 1 = 0 := by
  sorry

lemma annihilator_eq_generator_kernel {ι : Type faZ} (g : ι → M)
    (hg : Submodule.span R (Set.range g) = ⊤) :
    Module.annihilator R M =
      (LinearMap.pi fun i => LinearMap.toSpanSingleton R M (g i)).ker := by
  sorry

lemma annihilator_flat_baseChange_generators [Module.Flat R S]
    {ι : Type faZ} [Fintype ι] [DecidableEq ι] (g : ι → M)
    (hg : Submodule.span R (Set.range g) = ⊤) :
    (Module.annihilator R M).map (algebraMap R S) =
      Module.annihilator S (S ⊗[R] M) := by
  sorry

lemma annihilator_flat_baseChange [Module.Flat R S] [Module.Finite R M] :
    (Module.annihilator R M).map (algebraMap R S) =
      Module.annihilator S (S ⊗[R] M) := by
  sorry

lemma element_annihilator_flat_baseChange [Module.Flat R S] (m : M) :
    (Submodule.span R {m}).annihilator.map (algebraMap R S) =
      (Submodule.span S {(1 : S) ⊗ₜ[R] m}).annihilator := by
  sorry

lemma annihilator_map_le_baseChange :
    (Module.annihilator R M).map (algebraMap R S) ≤
      Module.annihilator S (S ⊗[R] M) := by
  sorry

lemma ideal_map_iInf_finite [Module.Flat R S]
    {ι : Type faZ} [Fintype ι] [DecidableEq ι] (I : ι → Ideal R) :
    (⨅ i, I i).map (algebraMap R S) = ⨅ i, (I i).map (algebraMap R S) := by
  sorry

end TauCeti.SchemeFoundations.FlatAnnihilator

namespace TauCeti.SchemeFoundations.FlatAnnihilator

-- test: FlatAnnihilatorChecked.empty_family
example {R S : Type*} [CommRing R] [CommRing S] [Algebra R S]
    [Module.Flat R S] :
    (⨅ i : Fin 0, (fun _ => (⊥ : Ideal R)) i).map (algebraMap R S) = ⊤ := by
  sorry

-- test: FlatAnnihilatorChecked.identity_extension
example {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]
    [Module.Finite R M] :
    Module.annihilator R (R ⊗[R] M) = Module.annihilator R M := by
  sorry

-- test: FlatAnnihilatorChecked.zero_module
example {R S : Type*} [CommRing R] [CommRing S] [Algebra R S]
    [Module.Flat R S] :
    Module.annihilator S (S ⊗[R] (⊥ : Submodule R R)) = ⊤ := by
  sorry

-- test: FlatAnnihilatorChecked.zero_element
example {R S M : Type*} [CommRing R] [CommRing S] [Algebra R S]
    [AddCommGroup M] [Module R M] [Module.Flat R S] :
    (Submodule.span S {(1 : S) ⊗ₜ[R] (0 : M)}).annihilator = ⊤ := by
  sorry

-- test: FlatAnnihilatorChecked.nonreduced_element
example : (2 : ZMod 4) ≠ 0 ∧
    (2 : ZMod 4) ∈
      (Submodule.span (ZMod 4) {(1 : ZMod 4) ⊗ₜ[ZMod 4] (2 : ZMod 4)}).annihilator := by
  sorry

-- test: FlatAnnihilatorChecked.nonreduced_diagonal
example : ((2, 2) : ZMod 4 × ZMod 4) ≠ 0 ∧
    ((2, 2) : ZMod 4 × ZMod 4) ∈
      (Submodule.span (ZMod 4 × ZMod 4)
        {(1 : ZMod 4 × ZMod 4) ⊗ₜ[ZMod 4] (2 : ZMod 4)}).annihilator := by
  sorry

section Nonflat
local instance : Algebra (ZMod 4) (ZMod 2) :=
  (ZMod.castHom (show 2 ∣ 4 by decide) (ZMod 2)).toAlgebra

-- test: FlatAnnihilatorChecked.nonflat_element_failure
example :
    (Submodule.span (ZMod 4) {(2 : ZMod 4)}).annihilator.map
      (algebraMap (ZMod 4) (ZMod 2)) = ⊥ ∧
    (Submodule.span (ZMod 2) {(1 : ZMod 2) ⊗ₜ[ZMod 4] (2 : ZMod 4)}).annihilator = ⊤ ∧
    (⊥ : Ideal (ZMod 2)) ≠ ⊤ := by
  sorry

end Nonflat
end TauCeti.SchemeFoundations.FlatAnnihilator

open TensorProduct
noncomputable section
namespace TauCeti.SchemeFoundations.QuotientBaseChange
universe qbU qbV qbW qbZ
variable {R : Type qbU} [CommRing R] (S : Type qbV) [CommRing S] [Algebra R S]
variable {M : Type qbW} [AddCommGroup M] [Module R M]
variable {N : Type qbZ} [AddCommGroup N] [Module R N]

lemma quotient_baseChange_square (Q : Submodule R M) :
    (AlgebraTensorModule.tensorQuotientEquiv S R S Q).toLinearMap ∘ₗ
      Q.mkQ.baseChange S = (Q.baseChange S).mkQ := by
  sorry

lemma quotient_baseChange_annihilator (Q : Submodule R M) :
    Module.annihilator S (S ⊗[R] (M ⧸ Q)) =
      Module.annihilator S ((S ⊗[R] M) ⧸ Q.baseChange S) := by
  sorry

lemma quotient_annihilator_flat_baseChange (Q : Submodule R M)
    [Module.Flat R S] [Module.Finite R (M ⧸ Q)] :
    (Module.annihilator R (M ⧸ Q)).map (algebraMap R S) =
      Module.annihilator S ((S ⊗[R] M) ⧸ Q.baseChange S) := by
  sorry

lemma quotient_annihilator_map_le_baseChange (Q : Submodule R M) :
    (Module.annihilator R (M ⧸ Q)).map (algebraMap R S) ≤
      Module.annihilator S ((S ⊗[R] M) ⧸ Q.baseChange S) := by
  sorry

lemma baseChange_range (f : M →ₗ[R] N) :
    LinearMap.range (f.baseChange S) = f.range.baseChange S := by
  sorry

lemma baseChange_map (Q : Submodule R M) (f : M →ₗ[R] N) :
    (Q.map f).baseChange S = (Q.baseChange S).map (f.baseChange S) := by
  sorry

lemma baseChange_le_comap (Q : Submodule R M) (P : Submodule R N)
    (f : M →ₗ[R] N) (hf : Q ≤ P.comap f) :
    Q.baseChange S ≤ (P.baseChange S).comap (f.baseChange S) := by
  sorry

lemma quotient_baseChange_naturality (Q : Submodule R M) (P : Submodule R N)
    (f : M →ₗ[R] N) (hf : Q ≤ P.comap f) :
    (AlgebraTensorModule.tensorQuotientEquiv S R S P).toLinearMap ∘ₗ
      (Q.mapQ P f hf).baseChange S =
    (Q.baseChange S).mapQ (P.baseChange S) (f.baseChange S)
        (baseChange_le_comap S Q P f hf) ∘ₗ
      (AlgebraTensorModule.tensorQuotientEquiv S R S Q).toLinearMap := by
  sorry

lemma cokernel_annihilator_flat_baseChange (f : M →ₗ[R] N)
    [Module.Flat R S] [Module.Finite R (N ⧸ f.range)] :
    (Module.annihilator R (N ⧸ f.range)).map (algebraMap R S) =
      Module.annihilator S ((S ⊗[R] N) ⧸ LinearMap.range (f.baseChange S)) := by
  sorry

noncomputable def cokernelBaseChangeEquiv (f : M →ₗ[R] N) :
    S ⊗[R] (N ⧸ f.range) ≃ₗ[S]
      (S ⊗[R] N) ⧸ LinearMap.range (f.baseChange S) :=
  AlgebraTensorModule.tensorQuotientEquiv S R S f.range ≪≫ₗ
    Submodule.quotEquivOfEq _ _ (baseChange_range S f).symm

lemma cokernelBaseChangeEquiv_tmul (f : M →ₗ[R] N) (s : S) (n : N) :
    cokernelBaseChangeEquiv S f (s ⊗ₜ[R] (Submodule.Quotient.mk n)) =
      Submodule.Quotient.mk (s ⊗ₜ[R] n) := by
  sorry

lemma cokernelBaseChangeEquiv_symm_mk_tmul (f : M →ₗ[R] N) (s : S) (n : N) :
    (cokernelBaseChangeEquiv S f).symm (Submodule.Quotient.mk (s ⊗ₜ[R] n)) =
      s ⊗ₜ[R] (Submodule.Quotient.mk n) := by
  sorry

lemma cokernel_baseChange_square (f : M →ₗ[R] N) :
    (cokernelBaseChangeEquiv S f).toLinearMap ∘ₗ
      f.range.mkQ.baseChange S = (LinearMap.range (f.baseChange S)).mkQ := by
  sorry

end TauCeti.SchemeFoundations.QuotientBaseChange

open TensorProduct
noncomputable section
namespace TauCeti.SchemeFoundations.QuotientBaseChange

-- test: QuotientBaseChangeChecked.identity_cokernel
example {R S M : Type*} [CommRing R] [CommRing S] [Algebra R S]
    [AddCommGroup M] [Module R M] :
    Subsingleton ((S ⊗[R] M) ⧸
      LinearMap.range ((LinearMap.id : M →ₗ[R] M).baseChange S)) := by
  sorry

-- test: QuotientBaseChangeChecked.zero_map_scalar
example :
    AlgebraTensorModule.rid ℤ (ZMod 5) (ZMod 5)
      (((LinearMap.range ((0 : ℤ →ₗ[ℤ] ℤ).baseChange (ZMod 5))).quotEquivOfEqBot
        (by simp))
      (cokernelBaseChangeEquiv (ZMod 5) (0 : ℤ →ₗ[ℤ] ℤ)
        ((3 : ZMod 5) ⊗ₜ[ℤ] (Submodule.Quotient.mk (7 : ℤ))))) = 1 := by
  sorry

-- test: QuotientBaseChangeChecked.inverse_representative
example :
    (cokernelBaseChangeEquiv (ZMod 4) (LinearMap.toSpanSingleton ℤ ℤ (2 : ℤ))).symm
      (Submodule.Quotient.mk ((3 : ZMod 4) ⊗ₜ[ℤ] (7 : ℤ))) =
        (3 : ZMod 4) ⊗ₜ[ℤ] (Submodule.Quotient.mk (7 : ℤ)) := by
  sorry

-- test: QuotientBaseChangeChecked.nonflat_injective_map_collapses
example :
    Function.Injective (LinearMap.toSpanSingleton ℤ ℤ (2 : ℤ)) ∧
      (LinearMap.toSpanSingleton ℤ ℤ (2 : ℤ)).baseChange (ZMod 2) = 0 ∧
      ((1 : ZMod 2) ⊗ₜ[ℤ] (1 : ℤ)) ≠ 0 := by
  sorry

-- test: QuotientBaseChangeChecked.nonreduced_quotient_annihilator
example : (2 : ZMod 4) ≠ 0 ∧
    (2 : ZMod 4) ∈ Module.annihilator (ZMod 4)
      (((ZMod 4) ⊗[ZMod 4] (ZMod 4)) ⧸
        (Ideal.span {(2 : ZMod 4)}).baseChange (ZMod 4)) := by
  sorry

-- test: QuotientBaseChangeChecked.nonreduced_diagonal_quotient
example : ((2, 2) : ZMod 4 × ZMod 4) ≠ 0 ∧
    ((2, 2) : ZMod 4 × ZMod 4) ∈ Module.annihilator (ZMod 4 × ZMod 4)
      (((ZMod 4 × ZMod 4) ⊗[ZMod 4] (ZMod 4)) ⧸
        (Ideal.span {(2 : ZMod 4)}).baseChange (ZMod 4 × ZMod 4)) := by
  sorry

-- test: QuotientBaseChangeChecked.top_quotient_annihilator
example {R S M : Type*} [CommRing R] [CommRing S] [Algebra R S]
    [AddCommGroup M] [Module R M] :
    Module.annihilator S ((S ⊗[R] M) ⧸ (⊤ : Submodule R M).baseChange S) = ⊤ := by
  sorry

-- test: QuotientBaseChangeChecked.zero_ring_cokernel
example : Subsingleton ((ZMod 1 ⊗[ℤ] ℤ) ⧸
    LinearMap.range ((LinearMap.toSpanSingleton ℤ ℤ (2 : ℤ)).baseChange (ZMod 1))) := by
  sorry

end TauCeti.SchemeFoundations.QuotientBaseChange


noncomputable section

namespace TauCeti.SchemeFoundations.IdealPullback
open CategoryTheory CategoryTheory.Limits AlgebraicGeometry Opposite
variable {X Y : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

lemma ideal_comap_top (I : Y.IdealSheafData) (f : X ⟶ Y)
    [IsAffine X] [IsAffine Y] :
    (I.comap f).ideal ⟨⊤, isAffineOpen_top X⟩ =
      (I.ideal ⟨⊤, isAffineOpen_top Y⟩).map f.appTop.hom := by
  sorry

lemma comap_restrict (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.Opens) :
    (I.comap f).comap (f ⁻¹ᵁ U).ι = (I.comap U.ι).comap (f ∣_ U) := by
  sorry

lemma ideal_restrict_top (I : X.IdealSheafData) (U : X.affineOpens) :
    (I.comap U.1.ι).ideal ⟨⊤, @isAffineOpen_top _ U.2⟩ =
      (I.ideal U).comap U.1.topIso.hom.hom := by
  sorry

lemma ideal_comap_affineOpen (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) :
    (I.comap f).ideal ⟨f ⁻¹ᵁ U, H⟩ = (I.ideal U).map (f.app U).hom := by
  sorry

lemma ideal_comap_of_isAffineHom (I : Y.IdealSheafData) (f : X ⟶ Y)
    [IsAffineHom f] (U : Y.affineOpens) :
    (I.comap f).ideal ⟨f ⁻¹ᵁ U, U.2.preimage f⟩ = (I.ideal U).map (f.app U).hom := by
  sorry

def comapObjIso (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) :
    Γ((I.comap f).subscheme, (I.comap f).subschemeι ⁻¹ᵁ (f ⁻¹ᵁ U)) ≅
      CommRingCat.of (Γ(X, f ⁻¹ᵁ U) ⧸ (I.ideal U).map (f.app U).hom) :=
  (I.comap f).subschemeObjIso ⟨f ⁻¹ᵁ U, H⟩ ≪≫
    (Ideal.quotEquivOfEq (ideal_comap_affineOpen I f U H)).toCommRingCatIso

lemma comapObjIso_inclusion (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) :
    (I.comap f).subschemeι.app (f ⁻¹ᵁ U) ≫ (comapObjIso I f U H).hom =
      CommRingCat.ofHom (Ideal.Quotient.mk ((I.ideal U).map (f.app U).hom)) := by
  sorry

lemma comapObjIso_mk (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) (b : Γ(X, f ⁻¹ᵁ U)) :
    (comapObjIso I f U H).hom ((I.comap f).subschemeι.app (f ⁻¹ᵁ U) b) =
      Ideal.Quotient.mk ((I.ideal U).map (f.app U).hom) b := by
  sorry

lemma comapObjIso_inv_mk (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) (b : Γ(X, f ⁻¹ᵁ U)) :
    (comapObjIso I f U H).inv (Ideal.Quotient.mk ((I.ideal U).map (f.app U).hom) b) =
      (I.comap f).subschemeι.app (f ⁻¹ᵁ U) b := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback


namespace TauCeti.SchemeFoundations.IdealPullback
open CategoryTheory AlgebraicGeometry
variable {X Y Z : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

-- test: IdealPullbackChecked.composition
example [IsAffine X] [IsAffine Y] [IsAffine Z]
    (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    (I.comap (f ≫ g)).ideal ⟨⊤, isAffineOpen_top X⟩ =
      ((I.ideal ⟨⊤, isAffineOpen_top Z⟩).map g.appTop.hom).map f.appTop.hom := by
  sorry

-- test: IdealPullbackChecked.empty_open
example (I : Y.IdealSheafData) (f : X ⟶ Y) :
    ∀ x : Γ((I.comap f).subscheme, (I.comap f).subschemeι ⁻¹ᵁ
      (f ⁻¹ᵁ (⊥ : Y.Opens))),
      (comapObjIso I f ⟨⊥, isAffineOpen_bot Y⟩ (by simpa using isAffineOpen_bot X)).hom x = 0 := by
  sorry

-- test: IdealPullbackChecked.inverse_representative
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (H : IsAffineOpen (f ⁻¹ᵁ U)) (b : Γ(X, f ⁻¹ᵁ U)) :
    (comapObjIso I f U H).inv ((comapObjIso I f U H).hom
      ((I.comap f).subschemeι.app (f ⁻¹ᵁ U) b)) =
        (I.comap f).subschemeι.app (f ⁻¹ᵁ U) b := by
  sorry

-- test: IdealPullbackChecked.nonflat_quotient
example :
    let f := Spec.map (CommRingCat.ofHom (Int.castRingHom (ZMod 2)))
    let I : (Spec (.of ℤ)).IdealSheafData :=
      Scheme.IdealSheafData.ofIdealTop (Ideal.span {2})
    I ≠ ⊥ ∧ I.comap f = ⊥ := by
  sorry

-- test: IdealPullbackChecked.nonreduced_quotient
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    let b := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    let y := (I.comap (𝟙 X)).subschemeι.app U b
    (comapObjIso I (𝟙 X) U U.2).hom y ≠ 0 ∧
      ((comapObjIso I (𝟙 X) U U.2).hom y) ^ 2 = 0 := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open CategoryTheory AlgebraicGeometry Opposite
variable {X Y : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

lemma extendedIdeal_restrict (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V : Y.affineOpens} (h : U ≤ V) :
    ((I.ideal V).map (f.app V).hom).map
      (X.presheaf.map ((TopologicalSpace.Opens.map f.base).map (homOfLE h)).op).hom =
        (I.ideal U).map (f.app U).hom := by
  sorry

def quotientRestriction (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V : Y.affineOpens} (h : U ≤ V) :
    (Γ(X, f ⁻¹ᵁ V) ⧸ (I.ideal V).map (f.app V).hom) →+*
      (Γ(X, f ⁻¹ᵁ U) ⧸ (I.ideal U).map (f.app U).hom) :=
  Ideal.quotientMap _
    (X.presheaf.map ((TopologicalSpace.Opens.map f.base).map (homOfLE h)).op).hom
    (Ideal.map_le_iff_le_comap.mp (extendedIdeal_restrict I f h).le)

lemma quotientRestriction_mk (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V : Y.affineOpens} (h : U ≤ V) (b : Γ(X, f ⁻¹ᵁ V)) :
    quotientRestriction I f h (Ideal.Quotient.mk _ b) =
      Ideal.Quotient.mk _
        ((X.presheaf.map ((TopologicalSpace.Opens.map f.base).map (homOfLE h)).op) b) := by
  sorry

lemma quotientRestriction_id (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) :
    quotientRestriction I f (le_refl U) = RingHom.id _ := by
  sorry

lemma quotientRestriction_comp (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V W : Y.affineOpens} (h : U ≤ V) (k : V ≤ W) :
    quotientRestriction I f (h.trans k) =
      (quotientRestriction I f h).comp (quotientRestriction I f k) := by
  sorry

lemma comapObjIso_naturality (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V : Y.affineOpens} (h : U ≤ V)
    (HU : IsAffineOpen (f ⁻¹ᵁ U)) (HV : IsAffineOpen (f ⁻¹ᵁ V)) :
    (I.comap f).subscheme.presheaf.map
        ((TopologicalSpace.Opens.map (I.comap f).subschemeι.base).map
          ((TopologicalSpace.Opens.map f.base).map (homOfLE h))).op ≫
      (comapObjIso I f U HU).hom =
        (comapObjIso I f V HV).hom ≫ CommRingCat.ofHom (quotientRestriction I f h) := by
  sorry

lemma comapObjIso_inv_naturality (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V : Y.affineOpens} (h : U ≤ V)
    (HU : IsAffineOpen (f ⁻¹ᵁ U)) (HV : IsAffineOpen (f ⁻¹ᵁ V)) :
    CommRingCat.ofHom (quotientRestriction I f h) ≫ (comapObjIso I f U HU).inv =
      (comapObjIso I f V HV).inv ≫
        (I.comap f).subscheme.presheaf.map
          ((TopologicalSpace.Opens.map (I.comap f).subschemeι.base).map
            ((TopologicalSpace.Opens.map f.base).map (homOfLE h))).op := by
  sorry

def quotientPresheaf (I : Y.IdealSheafData) (f : X ⟶ Y) :
    Y.affineOpensᵒᵖ ⥤ CommRingCat.{u} where
  obj U := CommRingCat.of (Γ(X, f ⁻¹ᵁ U.unop) ⧸
    (I.ideal U.unop).map (f.app U.unop).hom)
  map h := CommRingCat.ofHom (quotientRestriction I f h.unop.le)
  map_id U := by
    sorry
  map_comp h k := by
    sorry

lemma quotientPresheaf_obj (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) :
    (quotientPresheaf I f).obj (op U) =
      CommRingCat.of (Γ(X, f ⁻¹ᵁ U) ⧸ (I.ideal U).map (f.app U).hom) := by
  sorry

lemma quotientPresheaf_map (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V : Y.affineOpens} (h : U ≤ V) :
    (quotientPresheaf I f).map (homOfLE h).op =
      CommRingCat.ofHom (quotientRestriction I f h) := by
  sorry

def comapObjNatIso (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f] :
    ((show Monotone (fun U : Y.affineOpens => U.1) from fun _ _ h => h).functor ⋙
      TopologicalSpace.Opens.map f.base ⋙
      TopologicalSpace.Opens.map (I.comap f).subschemeι.base).op ⋙
        (I.comap f).subscheme.presheaf ≅ quotientPresheaf I f :=
  NatIso.ofComponents (fun U => comapObjIso I f U.unop (U.unop.2.preimage f))
    (fun h => by sorry)

lemma comapObjNatIso_app (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f]
    (U : Y.affineOpens) :
    (comapObjNatIso I f).app (op U) = comapObjIso I f U (U.2.preimage f) := by
  sorry

lemma comapObjNatIso_hom_app (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f]
    (U : Y.affineOpens) :
    (comapObjNatIso I f).hom.app (op U) = (comapObjIso I f U (U.2.preimage f)).hom := by
  sorry

lemma comapObjNatIso_inv_app (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f]
    (U : Y.affineOpens) :
    (comapObjNatIso I f).inv.app (op U) = (comapObjIso I f U (U.2.preimage f)).inv := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open CategoryTheory AlgebraicGeometry Opposite
variable {X Y : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

-- test: QuotientRestrictionChecked.empty_target
example (I : Y.IdealSheafData) (f : X ⟶ Y) (V : Y.affineOpens)
    (q : Γ(X, f ⁻¹ᵁ V) ⧸ (I.ideal V).map (f.app V).hom) :
    quotientRestriction I f (show (⟨⊥, isAffineOpen_bot Y⟩ : Y.affineOpens) ≤ V
      from (show (⊥ : Y.Opens) ≤ V.1 from bot_le)) q = 0 := by
  sorry

-- test: QuotientRestrictionChecked.triple_overlap
example (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V W T : Y.affineOpens} (h : U ≤ V) (k : V ≤ W) (l : W ≤ T)
    (q : Γ(X, f ⁻¹ᵁ T) ⧸ (I.ideal T).map (f.app T).hom) :
    quotientRestriction I f ((h.trans k).trans l) q =
      quotientRestriction I f h (quotientRestriction I f k (quotientRestriction I f l q)) := by
  sorry

-- test: QuotientRestrictionChecked.nonreduced_identity
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    let b := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    quotientRestriction I (𝟙 X) (le_refl U) (Ideal.Quotient.mk _ b) ≠ 0 ∧
      (quotientRestriction I (𝟙 X) (le_refl U) (Ideal.Quotient.mk _ b)) ^ 2 = 0 := by
  sorry

-- test: QuotientPresheafChecked.basic_open_representative
example (I : Y.IdealSheafData) (f : X ⟶ Y) (V : Y.affineOpens)
    (s : Γ(Y, V)) (b : Γ(X, f ⁻¹ᵁ V)) :
    (quotientPresheaf I f).map (homOfLE (Y.affineBasicOpen_le s)).op
      (Ideal.Quotient.mk _ b) =
        Ideal.Quotient.mk _ ((X.presheaf.map
          ((TopologicalSpace.Opens.map f.base).map
            (homOfLE (Y.affineBasicOpen_le s))).op) b) := by
  sorry

-- test: QuotientPresheafChecked.nonflat_surviving_unit
example :
    let Y := Spec (.of ℤ)
    let X := Spec (.of (ZMod 2))
    let f : X ⟶ Y := Spec.map (CommRingCat.ofHom (Int.castRingHom (ZMod 2)))
    let I : Y.IdealSheafData := Scheme.IdealSheafData.ofIdealTop (Ideal.span {2})
    let U : Y.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    (1 : (quotientPresheaf I f).obj (op U)) ≠ 0 := by
  sorry

-- test: QuotientPresheafChecked.zero_ideal_path
example (f : X ⟶ Y) {U V W : Y.affineOpens} (h : U ≤ V) (k : V ≤ W)
    (b : Γ(X, f ⁻¹ᵁ W)) :
    (quotientPresheaf (⊥ : Y.IdealSheafData) f).map (homOfLE h).op
      ((quotientPresheaf (⊥ : Y.IdealSheafData) f).map (homOfLE k).op
        (Ideal.Quotient.mk _ b)) =
        (quotientPresheaf (⊥ : Y.IdealSheafData) f).map (homOfLE (h.trans k)).op
          (Ideal.Quotient.mk _ b) := by
  sorry

-- test: ComapObjNatIsoChecked.roundtrip
example (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f]
    (U : Y.affineOpens)
    (x : Γ((I.comap f).subscheme, (I.comap f).subschemeι ⁻¹ᵁ (f ⁻¹ᵁ U))) :
    (comapObjNatIso I f).inv.app (op U) ((comapObjNatIso I f).hom.app (op U) x) = x := by
  sorry

-- test: ComapObjNatIsoChecked.forward_overlap
example (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f]
    {U V W : Y.affineOpens} (h : U ≤ V) (k : V ≤ W) :
    (I.comap f).subscheme.presheaf.map
      ((TopologicalSpace.Opens.map (I.comap f).subschemeι.base).map
        ((TopologicalSpace.Opens.map f.base).map (homOfLE (h.trans k)))).op ≫
        (comapObjNatIso I f).hom.app (op U) =
      (comapObjNatIso I f).hom.app (op W) ≫
        (quotientPresheaf I f).map (homOfLE k).op ≫
          (quotientPresheaf I f).map (homOfLE h).op := by
  sorry

-- test: ComapObjNatIsoChecked.inverse_overlap
example (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f]
    {U V : Y.affineOpens} (h : U ≤ V) :
    (quotientPresheaf I f).map (homOfLE h).op ≫
      (comapObjNatIso I f).inv.app (op U) =
        (comapObjNatIso I f).inv.app (op V) ≫
          (I.comap f).subscheme.presheaf.map
            ((TopologicalSpace.Opens.map (I.comap f).subschemeι.base).map
              ((TopologicalSpace.Opens.map f.base).map (homOfLE h))).op := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback
