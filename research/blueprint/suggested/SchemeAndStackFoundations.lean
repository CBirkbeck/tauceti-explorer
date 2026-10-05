import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.RingTheory.LocalRing.ResidueField.Fiber
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.RingTheory.FiniteType
import Mathlib.FieldTheory.PurelyInseparable.Basic
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.AlgebraicGeometry.Noetherian
import Mathlib.Order.RelSeries
import Mathlib.AlgebraicGeometry.Sites.Fpqc
import Mathlib.AlgebraicGeometry.Morphisms.Etale
import Mathlib.CategoryTheory.MorphismProperty.Representable
import Mathlib.CategoryTheory.Sites.Sheaf
import Mathlib.Topology.Sheaves.LocallySurjective
import Mathlib.CategoryTheory.Sites.LeftExact
import Mathlib.Algebra.Category.Ring.FilteredColimits
import Mathlib.AlgebraicGeometry.IdealSheaf.Functorial
import Mathlib.LinearAlgebra.TensorProduct.Quotient
import Mathlib.RingTheory.Ideal.Colon
import Mathlib.RingTheory.Flat.Equalizer
import Mathlib.LinearAlgebra.TensorProduct.Pi
import Mathlib.RingTheory.Ideal.Maps
import Mathlib.RingTheory.Finiteness.Basic
import Mathlib.Algebra.Category.CommAlgCat.FiniteType
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
import Mathlib.GroupTheory.GroupExtension.Basic
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.Topology.Homeomorph.Defs
import Mathlib.Algebra.Azumaya.Matrix

/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names and
signatures. This is a partial checkpoint; every implementation is unchecked.
The current elaboration receipt is in the handoff. Open source-proof and baseline adapters
are listed in the packet; admitted signatures certify no implementation.
-/

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

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open CategoryTheory AlgebraicGeometry Opposite
variable {X Y : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

lemma extendedIdeal_le_ker (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens) :
    (I.ideal U).map (f.app U).hom ≤
      RingHom.ker ((I.comap f).subschemeι.app (f ⁻¹ᵁ U)).hom := by
  sorry

def quotientToClosed (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens) :
    (Γ(X, f ⁻¹ᵁ U) ⧸ (I.ideal U).map (f.app U).hom) →+*
      Γ((I.comap f).subscheme, (I.comap f).subschemeι ⁻¹ᵁ (f ⁻¹ᵁ U)) :=
  Ideal.Quotient.lift _ ((I.comap f).subschemeι.app (f ⁻¹ᵁ U)).hom
    (by sorry)

lemma quotientToClosed_mk (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (a : Γ(X, f ⁻¹ᵁ U)) :
    quotientToClosed I f U (Ideal.Quotient.mk _ a) =
      (I.comap f).subschemeι.app (f ⁻¹ᵁ U) a := by
  sorry

lemma quotientToClosed_unique (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (q : (Γ(X, f ⁻¹ᵁ U) ⧸ (I.ideal U).map (f.app U).hom) →+*
      Γ((I.comap f).subscheme, (I.comap f).subschemeι ⁻¹ᵁ (f ⁻¹ᵁ U)))
    (hq : q.comp (Ideal.Quotient.mk _) = ((I.comap f).subschemeι.app (f ⁻¹ᵁ U)).hom) :
    q = quotientToClosed I f U := by
  sorry

lemma quotientToClosed_naturality (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V : Y.affineOpens} (h : U ≤ V) :
    CommRingCat.ofHom (quotientRestriction I f h) ≫
        CommRingCat.ofHom (quotientToClosed I f U) =
      CommRingCat.ofHom (quotientToClosed I f V) ≫
        (I.comap f).subscheme.presheaf.map
          ((TopologicalSpace.Opens.map (I.comap f).subschemeι.base).map
            ((TopologicalSpace.Opens.map f.base).map (homOfLE h))).op := by
  sorry

lemma quotientToClosed_eq_inv (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) :
    CommRingCat.ofHom (quotientToClosed I f U) = (comapObjIso I f U H).inv := by
  sorry

lemma quotientToClosed_injective (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) :
    Function.Injective (quotientToClosed I f U) := by
  sorry

lemma quotientToClosed_surjective (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) :
    Function.Surjective (quotientToClosed I f U) := by
  sorry

def quotientToClosedNatTrans (I : Y.IdealSheafData) (f : X ⟶ Y) :
    quotientPresheaf I f ⟶
      ((show Monotone (fun U : Y.affineOpens => U.1) from fun _ _ h => h).functor ⋙
        TopologicalSpace.Opens.map f.base ⋙
        TopologicalSpace.Opens.map (I.comap f).subschemeι.base).op ⋙
          (I.comap f).subscheme.presheaf where
  app U := CommRingCat.ofHom (quotientToClosed I f U.unop)
  naturality _ _ h := by sorry

lemma quotientToClosedNatTrans_app (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) :
    (quotientToClosedNatTrans I f).app (op U) = CommRingCat.ofHom (quotientToClosed I f U) := by
  sorry

lemma quotientToClosedNatTrans_affine (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f] :
    quotientToClosedNatTrans I f = (comapObjNatIso I f).inv := by
  sorry

lemma quotientToClosedNatTrans_isIso (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f] :
    IsIso (quotientToClosedNatTrans I f) := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open CategoryTheory AlgebraicGeometry Opposite
variable {X Y : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

-- test: QuotientToClosedChecked.actual_factorization
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens) :
    (quotientToClosed I f U).comp (Ideal.Quotient.mk _) =
      ((I.comap f).subschemeι.app (f ⁻¹ᵁ U)).hom := by
  sorry

-- test: QuotientToClosedChecked.top_ideal
example (f : X ⟶ Y) (U : Y.affineOpens)
    (q : Γ(X, f ⁻¹ᵁ U) ⧸ ((⊤ : Y.IdealSheafData).ideal U).map (f.app U).hom) :
    quotientToClosed (⊤ : Y.IdealSheafData) f U q = 0 := by
  sorry

-- test: QuotientToClosedChecked.nonreduced_section
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    let b := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    let q := quotientToClosed I (𝟙 X) U (Ideal.Quotient.mk _ b)
    q ≠ 0 ∧ q ^ 2 = 0 := by
  sorry

-- test: QuotientToClosedChecked.nonflat_surviving_unit
example :
    let Y := Spec (.of ℤ)
    let X := Spec (.of (ZMod 2))
    let f : X ⟶ Y := Spec.map (CommRingCat.ofHom (Int.castRingHom (ZMod 2)))
    let I : Y.IdealSheafData := Scheme.IdealSheafData.ofIdealTop (Ideal.span {2})
    let U : Y.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    quotientToClosed I f U 1 ≠ 0 := by
  sorry

-- test: QuotientToClosedNatTransChecked.basic_open
example (I : Y.IdealSheafData) (f : X ⟶ Y) (V : Y.affineOpens)
    (s : Γ(Y, V)) (a : Γ(X, f ⁻¹ᵁ V)) :
    (quotientToClosedNatTrans I f).app (op (Y.affineBasicOpen s))
      ((quotientPresheaf I f).map (homOfLE (Y.affineBasicOpen_le s)).op (Ideal.Quotient.mk _ a)) =
        (I.comap f).subschemeι.app (f ⁻¹ᵁ (Y.affineBasicOpen s))
          ((X.presheaf.map ((TopologicalSpace.Opens.map f.base).map
            (homOfLE (Y.affineBasicOpen_le s))).op) a) := by
  sorry

-- test: QuotientToClosedNatTransChecked.two_step_overlap
example (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V W : Y.affineOpens} (h : U ≤ V) (k : V ≤ W) :
    (quotientPresheaf I f).map (homOfLE k).op ≫
        (quotientPresheaf I f).map (homOfLE h).op ≫
        (quotientToClosedNatTrans I f).app (op U) =
      (quotientToClosedNatTrans I f).app (op W) ≫
        (I.comap f).subscheme.presheaf.map
          ((TopologicalSpace.Opens.map (I.comap f).subschemeι.base).map
            ((TopologicalSpace.Opens.map f.base).map (homOfLE (h.trans k)))).op := by
  sorry

-- test: QuotientToClosedNatTransChecked.affine_roundtrip
example (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f] :
    quotientToClosedNatTrans I f ≫ (comapObjNatIso I f).hom = 𝟙 _ := by
  sorry

-- test: QuotientToClosedNatTransChecked.nonaffine_obstruction
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (h : ¬ Function.Surjective ((quotientToClosedNatTrans I f).app (op U))) :
    ¬ IsAffineHom f := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open CategoryTheory AlgebraicGeometry Opposite
variable {X : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

lemma allOpenKernel_restriction (I : X.IdealSheafData) {U V : X.Opens} (h : U ≤ V) :
    RingHom.ker (I.subschemeι.app V).hom ≤
      (RingHom.ker (I.subschemeι.app U).hom).comap (X.presheaf.map (homOfLE h).op).hom := by
  sorry

def allOpenRestriction (I : X.IdealSheafData) {U V : X.Opens} (h : U ≤ V) :
    (Γ(X, V) ⧸ RingHom.ker (I.subschemeι.app V).hom) →+*
      (Γ(X, U) ⧸ RingHom.ker (I.subschemeι.app U).hom) :=
  Ideal.quotientMap _ (X.presheaf.map (homOfLE h).op).hom (by sorry)

lemma allOpenRestriction_mk (I : X.IdealSheafData) {U V : X.Opens} (h : U ≤ V)
    (a : Γ(X, V)) :
    allOpenRestriction I h (Ideal.Quotient.mk _ a) =
      Ideal.Quotient.mk _ (X.presheaf.map (homOfLE h).op a) := by
  sorry

lemma allOpenRestriction_id (I : X.IdealSheafData) (U : X.Opens) :
    allOpenRestriction I (le_refl U) = RingHom.id _ := by
  sorry

lemma allOpenRestriction_comp (I : X.IdealSheafData) {U V W : X.Opens}
    (h : U ≤ V) (k : V ≤ W) :
    (allOpenRestriction I h).comp (allOpenRestriction I k) =
      allOpenRestriction I (h.trans k) := by
  sorry

def allOpenQuotient (I : X.IdealSheafData) : X.Opensᵒᵖ ⥤ CommRingCat.{u} where
  obj U := .of (Γ(X, U.unop) ⧸ RingHom.ker (I.subschemeι.app U.unop).hom)
  map h := CommRingCat.ofHom (allOpenRestriction I h.unop.le)
  map_id U := by sorry
  map_comp h k := by sorry

lemma allOpenQuotient_obj (I : X.IdealSheafData) (U : X.Opens) :
    (allOpenQuotient I).obj (op U) =
      CommRingCat.of (Γ(X, U) ⧸ RingHom.ker (I.subschemeι.app U).hom) := by
  sorry

lemma allOpenQuotient_map (I : X.IdealSheafData) {U V : X.Opens} (h : U ≤ V) :
    (allOpenQuotient I).map (homOfLE h).op = CommRingCat.ofHom (allOpenRestriction I h) := by
  sorry

def allOpenToClosed (I : X.IdealSheafData) : allOpenQuotient I ⟶
    (TopologicalSpace.Opens.map I.subschemeι.base).op ⋙ I.subscheme.presheaf where
  app U := CommRingCat.ofHom (I.subschemeι.app U.unop).hom.kerLift
  naturality U V h := by sorry

lemma allOpenToClosed_mk (I : X.IdealSheafData) (U : X.Opens) (a : Γ(X, U)) :
    (allOpenToClosed I).app (op U) (Ideal.Quotient.mk _ a) = I.subschemeι.app U a := by
  sorry

lemma allOpenToClosed_injective (I : X.IdealSheafData) (U : X.Opens) :
    Function.Injective ((allOpenToClosed I).app (op U)) := by
  sorry

lemma allOpenToClosed_affine_bijective (I : X.IdealSheafData) (U : X.affineOpens) :
    Function.Bijective ((allOpenToClosed I).app (op U.1)) := by
  sorry

lemma allOpenToClosed_affine_agreement (I : X.IdealSheafData) (U : X.affineOpens) :
    (allOpenToClosed I).app (op U.1) =
      CommRingCat.ofHom (Ideal.quotientMap (I.ideal U) (RingHom.id _)
        (by rw [I.ker_subschemeι_app U]; exact le_rfl)) ≫ (I.subschemeObjIso U).inv := by
  sorry

lemma allOpenToClosed_locally_surjective (I : X.IdealSheafData) :
    Presheaf.IsLocallySurjective (Opens.grothendieckTopology X)
      (allOpenToClosed I) := by
  sorry

lemma allOpenToClosed_locally_injective (I : X.IdealSheafData) :
    Presheaf.IsLocallyInjective (Opens.grothendieckTopology X)
      (allOpenToClosed I) := by
  sorry

def allOpenSheafComparison (I : X.IdealSheafData) :
    sheafify (Opens.grothendieckTopology X) (allOpenQuotient I) ⟶
      (TopologicalSpace.Opens.map I.subschemeι.base).op ⋙ I.subscheme.presheaf :=
  sheafifyLift _ (allOpenToClosed I)
    (by sorry)

lemma allOpenSheafComparison_factor (I : X.IdealSheafData) :
    toSheafify (Opens.grothendieckTopology X) (allOpenQuotient I) ≫
      allOpenSheafComparison I = allOpenToClosed I := by
  sorry

lemma allOpenSheafComparison_mk (I : X.IdealSheafData) (U : X.Opens) (a : Γ(X, U)) :
    (allOpenSheafComparison I).app (op U)
      ((toSheafify (Opens.grothendieckTopology X) (allOpenQuotient I)).app (op U)
        (Ideal.Quotient.mk _ a)) = I.subschemeι.app U a := by
  sorry

lemma allOpenSheafComparison_unique (I : X.IdealSheafData)
    (q : sheafify (Opens.grothendieckTopology X) (allOpenQuotient I) ⟶
      (TopologicalSpace.Opens.map I.subschemeι.base).op ⋙ I.subscheme.presheaf)
    (hq : toSheafify (Opens.grothendieckTopology X) (allOpenQuotient I) ≫
      q = allOpenToClosed I) : q = allOpenSheafComparison I := by
  sorry

lemma allOpenSheafComparison_isIso (I : X.IdealSheafData) :
    IsIso (allOpenSheafComparison I) := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open CategoryTheory AlgebraicGeometry Opposite
variable {X Y : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

-- test: AllOpenRestrictionChecked.two_step
example (I : X.IdealSheafData) {U V W : X.Opens} (h : U ≤ V) (k : V ≤ W)
    (a : Γ(X, W) ⧸ RingHom.ker (I.subschemeι.app W).hom) :
    (allOpenQuotient I).map (homOfLE h).op
      ((allOpenQuotient I).map (homOfLE k).op a) =
        (allOpenQuotient I).map (homOfLE (h.trans k)).op a := by
  sorry

-- test: AllOpenQuotientChecked.affine_ideal
example (I : X.IdealSheafData) (U : X.affineOpens) (a : Γ(X, U)) :
    (allOpenToClosed I).app (op U.1) (Ideal.Quotient.mk _ a) = 0 ↔ a ∈ I.ideal U := by
  sorry

-- test: AllOpenQuotientChecked.unit_ideal
example (U : X.affineOpens) (a : Γ(X, U) ⧸
    RingHom.ker ((⊤ : X.IdealSheafData).subschemeι.app U).hom) : a = 0 := by
  sorry

-- test: AllOpenQuotientChecked.nonreduced
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    let a := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    let q := (allOpenToClosed I).app (op U.1) (Ideal.Quotient.mk _ a)
    q ≠ 0 ∧ q ^ 2 = 0 := by
  sorry

-- test: AllOpenToClosedChecked.affine_roundtrip
example (I : X.IdealSheafData) (U : X.affineOpens)
    (a : Γ(X, U) ⧸ RingHom.ker (I.subschemeι.app U).hom) :
    (RingEquiv.ofBijective ((allOpenToClosed I).app (op U.1)).hom
      (allOpenToClosed_affine_bijective I U)).symm
      ((allOpenToClosed I).app (op U.1) a) = a := by
  sorry

-- test: AllOpenToClosedChecked.nonaffine_obstruction
example (I : X.IdealSheafData) (U : X.Opens)
    (h : ¬ Function.Surjective ((allOpenToClosed I).app (op U))) : ¬ IsAffineOpen U := by
  sorry

-- test: AllOpenSheafComparisonChecked.representative_inverse
example (I : X.IdealSheafData) (U : X.Opens) (a : Γ(X, U)) :
    let q := allOpenSheafComparison I
    let _ := allOpenSheafComparison_isIso I
    (inv q).app (op U) (I.subschemeι.app U a) =
      (toSheafify (Opens.grothendieckTopology X) (allOpenQuotient I)).app (op U)
        (Ideal.Quotient.mk _ a) := by
  sorry

-- test: AllOpenSheafComparisonChecked.pullback_agreement
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens) (a : Γ(X, f ⁻¹ᵁ U)) :
    (allOpenSheafComparison (I.comap f)).app (op (f ⁻¹ᵁ U))
      ((toSheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap f))).app
        (op (f ⁻¹ᵁ U)) (Ideal.Quotient.mk _ a)) =
          quotientToClosed I f U (Ideal.Quotient.mk _ a) := by
  sorry

-- test: AllOpenSheafComparisonChecked.arbitrary_section
example (I : X.IdealSheafData) (U : X.Opens)
    (s : Γ(I.subscheme, I.subschemeι ⁻¹ᵁ U)) :
    ∃ q, (allOpenSheafComparison I).app (op U) q = s := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open CategoryTheory AlgebraicGeometry Opposite
variable {X Y : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

def quotientToKernel (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens) :
    (Γ(X, f ⁻¹ᵁ U) ⧸ (I.ideal U).map (f.app U).hom) →+*
      (Γ(X, f ⁻¹ᵁ U) ⧸ RingHom.ker ((I.comap f).subschemeι.app (f ⁻¹ᵁ U)).hom) :=
  Ideal.quotientMap _ (RingHom.id _) (extendedIdeal_le_ker I f U)

lemma quotientToKernel_mk (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (a : Γ(X, f ⁻¹ᵁ U)) :
    quotientToKernel I f U (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

lemma quotientToKernel_surjective (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) : Function.Surjective (quotientToKernel I f U) := by
  sorry

lemma quotientToKernel_factor (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens) :
    ((allOpenToClosed (I.comap f)).app (op (f ⁻¹ᵁ U))).hom.comp
      (quotientToKernel I f U) = quotientToClosed I f U := by
  sorry

lemma quotientToKernel_injective_iff (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) :
    Function.Injective (quotientToKernel I f U) ↔ Function.Injective (quotientToClosed I f U) := by
  sorry

lemma quotientToKernel_bijective (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) :
    Function.Bijective (quotientToKernel I f U) := by
  sorry

lemma quotientToKernel_naturality (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V : Y.affineOpens} (h : U ≤ V) :
    CommRingCat.ofHom (quotientRestriction I f h) ≫ CommRingCat.ofHom (quotientToKernel I f U) =
      CommRingCat.ofHom (quotientToKernel I f V) ≫
        (allOpenQuotient (I.comap f)).map
          ((TopologicalSpace.Opens.map f.base).map (homOfLE h)).op := by
  sorry

def quotientToKernelNatTrans (I : Y.IdealSheafData) (f : X ⟶ Y) :
    quotientPresheaf I f ⟶
      ((show Monotone (fun U : Y.affineOpens => U.1) from fun _ _ h => h).functor ⋙
        TopologicalSpace.Opens.map f.base).op ⋙ allOpenQuotient (I.comap f) where
  app U := CommRingCat.ofHom (quotientToKernel I f U.unop)
  naturality _ _ h := quotientToKernel_naturality I f h.unop.le

lemma quotientToKernelNatTrans_app (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) :
    (quotientToKernelNatTrans I f).app (op U) = CommRingCat.ofHom (quotientToKernel I f U) := by
  sorry

lemma quotientToKernelNatTrans_factor (I : Y.IdealSheafData) (f : X ⟶ Y) :
    quotientToKernelNatTrans I f ≫
      Functor.whiskerLeft ((show Monotone (fun U : Y.affineOpens => U.1) from fun _ _ h => h).functor ⋙
        TopologicalSpace.Opens.map f.base).op (allOpenToClosed (I.comap f)) =
      quotientToClosedNatTrans I f := by
  sorry

lemma quotientToKernelNatTrans_isIso (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f] :
    IsIso (quotientToKernelNatTrans I f) := by
  sorry

lemma quotientToKernelNatTrans_sheaf_factor (I : Y.IdealSheafData) (f : X ⟶ Y) :
    quotientToKernelNatTrans I f ≫
      Functor.whiskerLeft ((show Monotone (fun U : Y.affineOpens => U.1) from fun _ _ h => h).functor ⋙
        TopologicalSpace.Opens.map f.base).op
        (toSheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap f)) ≫
          allOpenSheafComparison (I.comap f)) = quotientToClosedNatTrans I f := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open CategoryTheory AlgebraicGeometry Opposite
variable {X Y : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

-- test: QuotientToKernelChecked.affine_roundtrip
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (H : IsAffineOpen (f ⁻¹ᵁ U))
    (a : Γ(X, f ⁻¹ᵁ U) ⧸ (I.ideal U).map (f.app U).hom) :
    (RingEquiv.ofBijective (quotientToKernel I f U)
      (quotientToKernel_bijective I f U H)).symm (quotientToKernel I f U a) = a := by
  sorry

-- test: QuotientToKernelChecked.unit_ideal
example (f : X ⟶ Y) (U : Y.affineOpens)
    (q : Γ(X, f ⁻¹ᵁ U) ⧸ ((⊤ : Y.IdealSheafData).ideal U).map (f.app U).hom) :
    quotientToKernel (⊤ : Y.IdealSheafData) f U q = 0 := by
  sorry

-- test: QuotientToKernelChecked.empty_open
example (I : Y.IdealSheafData) (f : X ⟶ Y)
    (q : Γ(X, f ⁻¹ᵁ (⊥ : Y.Opens)) ⧸
      (I.ideal ⟨⊥, isAffineOpen_bot Y⟩).map (f.app (⊥ : Y.Opens)).hom) :
    quotientToKernel I f ⟨⊥, isAffineOpen_bot Y⟩ q = 0 := by
  sorry

-- test: QuotientToKernelChecked.strict_kernel_obstruction
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (a : Γ(X, f ⁻¹ᵁ U))
    (ha : a ∈ RingHom.ker ((I.comap f).subschemeι.app (f ⁻¹ᵁ U)).hom)
    (hn : a ∉ (I.ideal U).map (f.app U).hom) :
    ¬ Function.Injective (quotientToKernel I f U) ∧ ¬ IsAffineOpen (f ⁻¹ᵁ U) := by
  sorry

-- test: QuotientToKernelNatChecked.two_step_restriction
example (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V W : Y.affineOpens} (h : U ≤ V) (k : V ≤ W)
    (q : Γ(X, f ⁻¹ᵁ W) ⧸ (I.ideal W).map (f.app W).hom) :
    (quotientToKernelNatTrans I f).app (op U)
      (quotientRestriction I f h (quotientRestriction I f k q)) =
    (allOpenQuotient (I.comap f)).map
      ((TopologicalSpace.Opens.map f.base).map (homOfLE (h.trans k))).op
        ((quotientToKernelNatTrans I f).app (op W) q) := by
  sorry

-- test: QuotientToKernelNatChecked.nonreduced_identity
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    let a := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    let q := (quotientToKernelNatTrans I (𝟙 X)).app (op U) (Ideal.Quotient.mk _ a)
    q ≠ 0 ∧ q ^ 2 = 0 := by
  sorry

-- test: QuotientToKernelNatChecked.sheaf_factor_on_every_class
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (q : Γ(X, f ⁻¹ᵁ U) ⧸ (I.ideal U).map (f.app U).hom) :
    (allOpenSheafComparison (I.comap f)).app (op (f ⁻¹ᵁ U))
      ((toSheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap f))).app
        (op (f ⁻¹ᵁ U)) ((quotientToKernelNatTrans I f).app (op U) q)) =
      quotientToClosed I f U q := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open CategoryTheory AlgebraicGeometry Opposite
variable {X Y Z : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option maxHeartbeats 200000

lemma extendedIdeal_comp (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : g ⁻¹ᵁ U ∈ Y.affineOpens) :
    (I.ideal U).map ((f ≫ g).app U).hom =
      ((I.comap g).ideal ⟨g ⁻¹ᵁ U, H⟩).map (f.app (g ⁻¹ᵁ U)).hom := by
  sorry

def quotientCompIso (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : g ⁻¹ᵁ U ∈ Y.affineOpens) :
    (Γ(X, (f ≫ g) ⁻¹ᵁ U) ⧸ (I.ideal U).map ((f ≫ g).app U).hom) ≃+*
      (Γ(X, f ⁻¹ᵁ (g ⁻¹ᵁ U)) ⧸
        ((I.comap g).ideal ⟨g ⁻¹ᵁ U, H⟩).map (f.app (g ⁻¹ᵁ U)).hom) :=
  Ideal.quotEquivOfEq (extendedIdeal_comp I f g U H)

lemma quotientCompIso_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : g ⁻¹ᵁ U ∈ Y.affineOpens) (a : Γ(X, (f ≫ g) ⁻¹ᵁ U)) :
    quotientCompIso I f g U H (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

lemma quotientCompIso_inv_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : g ⁻¹ᵁ U ∈ Y.affineOpens) (a : Γ(X, (f ≫ g) ⁻¹ᵁ U)) :
    (quotientCompIso I f g U H).symm (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

lemma quotientCompIso_naturality (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    {U V : Z.affineOpens} (h : U ≤ V)
    (HU : g ⁻¹ᵁ U ∈ Y.affineOpens) (HV : g ⁻¹ᵁ V ∈ Y.affineOpens) :
    CommRingCat.ofHom (quotientRestriction I (f ≫ g) h) ≫
      (quotientCompIso I f g U HU).toCommRingCatIso.hom =
    (quotientCompIso I f g V HV).toCommRingCatIso.hom ≫
      CommRingCat.ofHom (quotientRestriction (I.comap g) f
        (show (⟨g ⁻¹ᵁ U, HU⟩ : Y.affineOpens) ≤ ⟨g ⁻¹ᵁ V, HV⟩ from g.preimage_mono h)) := by
  sorry

def kernelCompIso (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (V : X.Opens) :
    (Γ(X, V) ⧸ RingHom.ker ((I.comap (f ≫ g)).subschemeι.app V).hom) ≃+*
      (Γ(X, V) ⧸ RingHom.ker (((I.comap g).comap f).subschemeι.app V).hom) :=
  Ideal.quotEquivOfEq (congrArg (fun J : X.IdealSheafData =>
    RingHom.ker (J.subschemeι.app V).hom) (I.comap_comp f g))

lemma kernelCompIso_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (V : X.Opens) (a : Γ(X, V)) :
    kernelCompIso I f g V (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

lemma kernelCompIso_inv_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (V : X.Opens) (a : Γ(X, V)) :
    (kernelCompIso I f g V).symm (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

lemma quotientCompIso_kernel_factor (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : g ⁻¹ᵁ U ∈ Y.affineOpens) :
    (kernelCompIso I f g ((f ≫ g) ⁻¹ᵁ U)).toRingHom.comp
      (quotientToKernel I (f ≫ g) U) =
    (quotientToKernel (I.comap g) f ⟨g ⁻¹ᵁ U, H⟩).comp
      (quotientCompIso I f g U H).toRingHom := by
  sorry

lemma kernelCompIso_naturality (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    {U V : X.Opens} (h : U ≤ V) :
    CommRingCat.ofHom (allOpenRestriction (I.comap (f ≫ g)) h) ≫
      (kernelCompIso I f g U).toCommRingCatIso.hom =
    (kernelCompIso I f g V).toCommRingCatIso.hom ≫
      CommRingCat.ofHom (allOpenRestriction ((I.comap g).comap f) h) := by
  sorry

def quotientCompNatIso (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    [IsAffineHom g] :
    quotientPresheaf I (f ≫ g) ≅
      (show Monotone (fun U : Z.affineOpens =>
        (⟨g ⁻¹ᵁ U, U.2.preimage g⟩ : Y.affineOpens))
        from fun _ _ h => g.preimage_mono h).functor.op ⋙ quotientPresheaf (I.comap g) f :=
  NatIso.ofComponents (fun U =>
    (quotientCompIso I f g U.unop (U.unop.2.preimage g)).toCommRingCatIso)
    (fun h => quotientCompIso_naturality I f g h.unop.le _ _)

lemma quotientCompNatIso_app (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    [IsAffineHom g] (U : Z.affineOpens) :
    (quotientCompNatIso I f g).hom.app (op U) =
      (quotientCompIso I f g U (U.2.preimage g)).toCommRingCatIso.hom := by
  sorry

lemma quotientCompNatIso_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    [IsAffineHom g] (U : Z.affineOpens) (a : Γ(X, (f ≫ g) ⁻¹ᵁ U)) :
    (quotientCompNatIso I f g).hom.app (op U) (Ideal.Quotient.mk _ a) =
      Ideal.Quotient.mk _ a := by
  sorry

lemma quotientCompNatIso_inv_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    [IsAffineHom g] (U : Z.affineOpens) (a : Γ(X, (f ≫ g) ⁻¹ᵁ U)) :
    (quotientCompNatIso I f g).inv.app (op U) (Ideal.Quotient.mk _ a) =
      Ideal.Quotient.mk _ a := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open CategoryTheory AlgebraicGeometry Opposite
variable {X Y Z : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

-- test: QuotientCompChecked.roundtrip
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : g ⁻¹ᵁ U ∈ Y.affineOpens)
    (q : Γ(X, (f ≫ g) ⁻¹ᵁ U) ⧸ (I.ideal U).map ((f ≫ g).app U).hom) :
    (quotientCompIso I f g U H).symm (quotientCompIso I f g U H q) = q := by
  sorry

-- test: QuotientCompChecked.unit_ideal
example (f : X ⟶ Y) (g : Y ⟶ Z) (U : Z.affineOpens)
    (H : g ⁻¹ᵁ U ∈ Y.affineOpens)
    (q : Γ(X, (f ≫ g) ⁻¹ᵁ U) ⧸
      ((⊤ : Z.IdealSheafData).ideal U).map ((f ≫ g).app U).hom) :
    quotientCompIso (⊤ : Z.IdealSheafData) f g U H q = 0 := by
  sorry

-- test: QuotientCompChecked.empty_open
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (H : g ⁻¹ᵁ (⊥ : Z.Opens) ∈ Y.affineOpens)
    (q : Γ(X, (f ≫ g) ⁻¹ᵁ (⊥ : Z.Opens)) ⧸
      (I.ideal ⟨⊥, isAffineOpen_bot Z⟩).map ((f ≫ g).app (⊥ : Z.Opens)).hom) :
    quotientCompIso I f g ⟨⊥, isAffineOpen_bot Z⟩ H q = 0 := by
  sorry

-- test: QuotientCompChecked.nonreduced_identity
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    let a := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    let q := quotientCompIso I (𝟙 X) (𝟙 X) U U.2 (Ideal.Quotient.mk _ a)
    q ≠ 0 ∧ q ^ 2 = 0 := by
  sorry

-- test: KernelCompChecked.roundtrip
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (V : X.Opens)
    (q : Γ(X, V) ⧸ RingHom.ker ((I.comap (f ≫ g)).subschemeι.app V).hom) :
    (kernelCompIso I f g V).symm (kernelCompIso I f g V q) = q := by
  sorry

-- test: KernelCompChecked.empty_open
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (q : Γ(X, (⊥ : X.Opens)) ⧸
      RingHom.ker ((I.comap (f ≫ g)).subschemeι.app (⊥ : X.Opens)).hom) :
    kernelCompIso I f g ⊥ q = 0 := by
  sorry

-- test: KernelCompChecked.comparison_on_every_class
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : g ⁻¹ᵁ U ∈ Y.affineOpens)
    (q : Γ(X, (f ≫ g) ⁻¹ᵁ U) ⧸ (I.ideal U).map ((f ≫ g).app U).hom) :
    kernelCompIso I f g ((f ≫ g) ⁻¹ᵁ U) (quotientToKernel I (f ≫ g) U q) =
    quotientToKernel (I.comap g) f ⟨g ⁻¹ᵁ U, H⟩ (quotientCompIso I f g U H q) := by
  sorry

-- test: QuotientCompNatChecked.two_step_restriction
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) [IsAffineHom g]
    {U V W : Z.affineOpens} (h : U ≤ V) (k : V ≤ W)
    (q : Γ(X, (f ≫ g) ⁻¹ᵁ W) ⧸ (I.ideal W).map ((f ≫ g).app W).hom) :
    (quotientCompNatIso I f g).hom.app (op U)
      (quotientRestriction I (f ≫ g) h (quotientRestriction I (f ≫ g) k q)) =
    quotientRestriction (I.comap g) f
      (show (⟨g ⁻¹ᵁ U, U.2.preimage g⟩ : Y.affineOpens) ≤
        ⟨g ⁻¹ᵁ W, W.2.preimage g⟩ from g.preimage_mono (h.trans k))
      ((quotientCompNatIso I f g).hom.app (op W) q) := by
  sorry

-- test: QuotientCompNatChecked.inverse_on_every_class
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) [IsAffineHom g]
    (U : Z.affineOpens)
    (q : Γ(X, (f ≫ g) ⁻¹ᵁ U) ⧸ (I.ideal U).map ((f ≫ g).app U).hom) :
    (quotientCompNatIso I f g).inv.app (op U)
      ((quotientCompNatIso I f g).hom.app (op U) q) = q := by
  sorry

-- test: QuotientCompNatChecked.kernel_square_on_every_class
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) [IsAffineHom g]
    (U : Z.affineOpens)
    (q : Γ(X, (f ≫ g) ⁻¹ᵁ U) ⧸ (I.ideal U).map ((f ≫ g).app U).hom) :
    kernelCompIso I f g ((f ≫ g) ⁻¹ᵁ U) ((quotientToKernelNatTrans I (f ≫ g)).app (op U) q) =
    (quotientToKernelNatTrans (I.comap g) f).app (op ⟨g ⁻¹ᵁ U, U.2.preimage g⟩)
      ((quotientCompNatIso I f g).hom.app (op U) q) := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open CategoryTheory AlgebraicGeometry Opposite
variable {X Y Z : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

def kernelCompNatIso (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    allOpenQuotient (I.comap (f ≫ g)) ≅ allOpenQuotient ((I.comap g).comap f) :=
  NatIso.ofComponents (fun U => (kernelCompIso I f g U.unop).toCommRingCatIso)
    (fun h => kernelCompIso_naturality I f g h.unop.le)

lemma kernelCompNatIso_app (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : X.Opens) :
    (kernelCompNatIso I f g).app (op U) = (kernelCompIso I f g U).toCommRingCatIso := by
  sorry

lemma kernelCompNatIso_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : X.Opens) (a : Γ(X, U)) :
    (kernelCompNatIso I f g).hom.app (op U) (Ideal.Quotient.mk _ a) =
      Ideal.Quotient.mk _ a := by
  sorry

lemma kernelCompNatIso_inv_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : X.Opens) (a : Γ(X, U)) :
    (kernelCompNatIso I f g).inv.app (op U) (Ideal.Quotient.mk _ a) =
      Ideal.Quotient.mk _ a := by
  sorry

def sheafCompNatIso (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    sheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap (f ≫ g))) ≅
      sheafify (Opens.grothendieckTopology X) (allOpenQuotient ((I.comap g).comap f)) :=
  (sheafification (Opens.grothendieckTopology X) CommRingCat).mapIso (kernelCompNatIso I f g)

lemma sheafCompNatIso_unit (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    toSheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap (f ≫ g))) ≫
      (sheafCompNatIso I f g).hom =
    (kernelCompNatIso I f g).hom ≫
      toSheafify (Opens.grothendieckTopology X) (allOpenQuotient ((I.comap g).comap f)) := by
  sorry

lemma sheafCompNatIso_unit_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : X.Opens) (a : Γ(X, U)) :
    (sheafCompNatIso I f g).hom.app (op U)
      ((toSheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap (f ≫ g)))).app
        (op U) (Ideal.Quotient.mk _ a)) =
    (toSheafify (Opens.grothendieckTopology X) (allOpenQuotient ((I.comap g).comap f))).app
      (op U) (Ideal.Quotient.mk _ a) := by
  sorry

lemma sheafCompNatIso_inv_unit_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : X.Opens) (a : Γ(X, U)) :
    (sheafCompNatIso I f g).inv.app (op U)
      ((toSheafify (Opens.grothendieckTopology X) (allOpenQuotient ((I.comap g).comap f))).app
        (op U) (Ideal.Quotient.mk _ a)) =
    (toSheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap (f ≫ g)))).app
      (op U) (Ideal.Quotient.mk _ a) := by
  sorry

def closedCompNatIso (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    (TopologicalSpace.Opens.map (I.comap (f ≫ g)).subschemeι.base).op ⋙
      (I.comap (f ≫ g)).subscheme.presheaf ≅
    (TopologicalSpace.Opens.map ((I.comap g).comap f).subschemeι.base).op ⋙
      ((I.comap g).comap f).subscheme.presheaf :=
  let _ := allOpenSheafComparison_isIso (I.comap (f ≫ g))
  let _ := allOpenSheafComparison_isIso ((I.comap g).comap f)
  (asIso (allOpenSheafComparison (I.comap (f ≫ g)))).symm ≪≫
    sheafCompNatIso I f g ≪≫ asIso (allOpenSheafComparison ((I.comap g).comap f))

lemma sheafCompNatIso_closed (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    (sheafCompNatIso I f g).hom ≫ allOpenSheafComparison ((I.comap g).comap f) =
      allOpenSheafComparison (I.comap (f ≫ g)) ≫ (closedCompNatIso I f g).hom := by
  sorry

lemma closedCompNatIso_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : X.Opens) (a : Γ(X, U)) :
    (closedCompNatIso I f g).hom.app (op U) ((I.comap (f ≫ g)).subschemeι.app U a) =
      ((I.comap g).comap f).subschemeι.app U a := by
  sorry

lemma closedCompNatIso_inv_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : X.Opens) (a : Γ(X, U)) :
    (closedCompNatIso I f g).inv.app (op U) (((I.comap g).comap f).subschemeι.app U a) =
      (I.comap (f ≫ g)).subschemeι.app U a := by
  sorry

lemma kernelCompNatIso_closed (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    (kernelCompNatIso I f g).hom ≫ allOpenToClosed ((I.comap g).comap f) =
      allOpenToClosed (I.comap (f ≫ g)) ≫ (closedCompNatIso I f g).hom := by
  sorry

lemma sheafCompNatIso_unique (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (q : sheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap (f ≫ g))) ⟶
      sheafify (Opens.grothendieckTopology X) (allOpenQuotient ((I.comap g).comap f)))
    (hq : q ≫ allOpenSheafComparison ((I.comap g).comap f) =
      allOpenSheafComparison (I.comap (f ≫ g)) ≫ (closedCompNatIso I f g).hom) :
    q = (sheafCompNatIso I f g).hom := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open CategoryTheory AlgebraicGeometry Opposite
variable {X Y Z : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

-- test: CompositeKernelPresheafChecked.roundtrip
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (U : X.Opens)
    (q : (allOpenQuotient (I.comap (f ≫ g))).obj (op U)) :
    (kernelCompNatIso I f g).inv.app (op U)
      ((kernelCompNatIso I f g).hom.app (op U) q) = q := by
  sorry

-- test: CompositeKernelPresheafChecked.empty_open
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (q : (allOpenQuotient (I.comap (f ≫ g))).obj (op (⊥ : X.Opens))) :
    (kernelCompNatIso I f g).hom.app (op (⊥ : X.Opens)) q = 0 := by
  sorry

-- test: CompositeKernelPresheafChecked.two_restrictions
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    {U V W : X.Opens} (h : U ≤ V) (k : V ≤ W)
    (q : (allOpenQuotient (I.comap (f ≫ g))).obj (op W)) :
    (kernelCompNatIso I f g).hom.app (op U)
      (allOpenRestriction (I.comap (f ≫ g)) h
        (allOpenRestriction (I.comap (f ≫ g)) k q)) =
    allOpenRestriction ((I.comap g).comap f) (h.trans k)
      ((kernelCompNatIso I f g).hom.app (op W) q) := by
  sorry

-- test: CompositeClosedPresheafChecked.all_sections_roundtrip
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (U : X.Opens)
    (s : Γ((I.comap (f ≫ g)).subscheme, (I.comap (f ≫ g)).subschemeι ⁻¹ᵁ U)) :
    (closedCompNatIso I f g).inv.app (op U)
      ((closedCompNatIso I f g).hom.app (op U) s) = s := by
  sorry

-- test: CompositeClosedPresheafChecked.all_quotient_classes
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (U : X.Opens)
    (q : (allOpenQuotient (I.comap (f ≫ g))).obj (op U)) :
    (allOpenToClosed ((I.comap g).comap f)).app (op U)
      ((kernelCompNatIso I f g).hom.app (op U) q) =
    (closedCompNatIso I f g).hom.app (op U)
      ((allOpenToClosed (I.comap (f ≫ g))).app (op U) q) := by
  sorry

-- test: CompositeClosedPresheafChecked.restriction
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    {U V : X.Opens} (h : U ≤ V)
    (s : Γ((I.comap (f ≫ g)).subscheme, (I.comap (f ≫ g)).subschemeι ⁻¹ᵁ V)) :
    (closedCompNatIso I f g).hom.app (op U)
      ((I.comap (f ≫ g)).subscheme.presheaf.map
        (homOfLE ((I.comap (f ≫ g)).subschemeι.preimage_mono h)).op s) =
    ((I.comap g).comap f).subscheme.presheaf.map
      (homOfLE (((I.comap g).comap f).subschemeι.preimage_mono h)).op
      ((closedCompNatIso I f g).hom.app (op V) s) := by
  sorry

-- test: CompositeSheafChecked.all_sections_square
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (U : X.Opens)
    (q : (sheafify (Opens.grothendieckTopology X)
      (allOpenQuotient (I.comap (f ≫ g)))).obj (op U)) :
    (allOpenSheafComparison ((I.comap g).comap f)).app (op U)
      ((sheafCompNatIso I f g).hom.app (op U) q) =
    (closedCompNatIso I f g).hom.app (op U)
      ((allOpenSheafComparison (I.comap (f ≫ g))).app (op U) q) := by
  sorry

-- test: CompositeSheafChecked.forced_comparison
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    let _ := allOpenSheafComparison_isIso ((I.comap g).comap f)
    allOpenSheafComparison (I.comap (f ≫ g)) ≫ (closedCompNatIso I f g).hom ≫
      inv (allOpenSheafComparison ((I.comap g).comap f)) = (sheafCompNatIso I f g).hom := by
  sorry

-- test: CompositeSheafChecked.nonreduced_identity
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.Opens := ⊤
    let a := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    let q := (sheafCompNatIso I (𝟙 X) (𝟙 X)).hom.app (op U)
      ((toSheafify (Opens.grothendieckTopology X)
        (allOpenQuotient (I.comap (𝟙 X ≫ 𝟙 X)))).app (op U) (Ideal.Quotient.mk _ a))
    q ≠ 0 ∧ q ^ 2 = 0 := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open CategoryTheory AlgebraicGeometry Opposite
variable {X Y Z W : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option maxHeartbeats 800000

lemma allOpenQuotient_eqToIso_mk (I J : X.IdealSheafData) (h : I = J)
    (U : X.Opens) (a : Γ(X, U)) :
    (eqToIso (congrArg allOpenQuotient h)).hom.app (op U) (Ideal.Quotient.mk _ a) =
      Ideal.Quotient.mk _ a := by
  sorry

lemma allOpenQuotient_iso_eqToIso (I J : X.IdealSheafData) (h : I = J)
    (e : allOpenQuotient I ≅ allOpenQuotient J)
    (he : ∀ (U : X.Opens) (a : Γ(X, U)),
      e.hom.app (op U) (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a) :
    e = eqToIso (congrArg allOpenQuotient h) := by
  sorry

lemma kernelCompNatIso_eqToIso (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    kernelCompNatIso I f g = eqToIso (congrArg allOpenQuotient (I.comap_comp f g)) := by
  sorry

lemma sheafCompNatIso_eqToIso (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    sheafCompNatIso I f g = eqToIso (congrArg
      (fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X)
        (allOpenQuotient K)) (I.comap_comp f g)) := by
  sorry

lemma allOpenSheafComparison_eqToIso (I J : X.IdealSheafData) (h : I = J) :
    let _ := allOpenSheafComparison_isIso I
    let _ := allOpenSheafComparison_isIso J
    (asIso (allOpenSheafComparison I)).symm ≪≫
      eqToIso (congrArg (fun K : X.IdealSheafData =>
        sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) h) ≪≫
      asIso (allOpenSheafComparison J) =
    eqToIso (congrArg (fun K : X.IdealSheafData =>
      (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) h) := by
  sorry

lemma closedCompNatIso_eqToIso (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    closedCompNatIso I f g = eqToIso (congrArg
      (fun K : X.IdealSheafData =>
        (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf)
      (I.comap_comp f g)) := by
  sorry

lemma kernelCompNatIso_id_left (I : Y.IdealSheafData) (f : X ⟶ Y) :
    kernelCompNatIso I (𝟙 X) f ≪≫
      eqToIso (congrArg allOpenQuotient ((I.comap f).comap_id)) =
    eqToIso (congrArg (fun k : X ⟶ Y => (allOpenQuotient (I.comap k))) (Category.id_comp f)) := by
  sorry

lemma kernelCompNatIso_id_right (I : Y.IdealSheafData) (f : X ⟶ Y) :
    kernelCompNatIso I f (𝟙 Y) ≪≫
      eqToIso (congrArg (fun K : Y.IdealSheafData => (allOpenQuotient (K.comap f))) I.comap_id) =
    eqToIso (congrArg (fun k : X ⟶ Y => (allOpenQuotient (I.comap k))) (Category.comp_id f)) := by
  sorry

lemma kernelCompNatIso_assoc (I : W.IdealSheafData)
    (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W) :
    kernelCompNatIso I (f ≫ g) h ≪≫ kernelCompNatIso (I.comap h) f g =
      eqToIso (congrArg (fun k : X ⟶ W => (allOpenQuotient (I.comap k))) (Category.assoc f g h)) ≪≫
        kernelCompNatIso I f (g ≫ h) ≪≫
          eqToIso (congrArg (fun K : Y.IdealSheafData => (allOpenQuotient (K.comap f)))
            (I.comap_comp g h)) := by
  sorry

lemma sheafCompNatIso_id_left (I : Y.IdealSheafData) (f : X ⟶ Y) :
    sheafCompNatIso I (𝟙 X) f ≪≫
      eqToIso (congrArg (fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) ((I.comap f).comap_id)) =
    eqToIso (congrArg (fun k : X ⟶ Y => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (I.comap k))) (Category.id_comp f)) := by
  sorry

lemma sheafCompNatIso_id_right (I : Y.IdealSheafData) (f : X ⟶ Y) :
    sheafCompNatIso I f (𝟙 Y) ≪≫
      eqToIso (congrArg (fun K : Y.IdealSheafData => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (K.comap f))) I.comap_id) =
    eqToIso (congrArg (fun k : X ⟶ Y => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (I.comap k))) (Category.comp_id f)) := by
  sorry

lemma sheafCompNatIso_assoc (I : W.IdealSheafData)
    (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W) :
    sheafCompNatIso I (f ≫ g) h ≪≫ sheafCompNatIso (I.comap h) f g =
      eqToIso (congrArg (fun k : X ⟶ W => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (I.comap k))) (Category.assoc f g h)) ≪≫
        sheafCompNatIso I f (g ≫ h) ≪≫
          eqToIso (congrArg (fun K : Y.IdealSheafData => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (K.comap f)))
            (I.comap_comp g h)) := by
  sorry

lemma closedCompNatIso_id_left (I : Y.IdealSheafData) (f : X ⟶ Y) :
    closedCompNatIso I (𝟙 X) f ≪≫
      eqToIso (congrArg (fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) ((I.comap f).comap_id)) =
    eqToIso (congrArg (fun k : X ⟶ Y => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (I.comap k))) (Category.id_comp f)) := by
  sorry

lemma closedCompNatIso_id_right (I : Y.IdealSheafData) (f : X ⟶ Y) :
    closedCompNatIso I f (𝟙 Y) ≪≫
      eqToIso (congrArg (fun K : Y.IdealSheafData => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (K.comap f))) I.comap_id) =
    eqToIso (congrArg (fun k : X ⟶ Y => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (I.comap k))) (Category.comp_id f)) := by
  sorry

lemma closedCompNatIso_assoc (I : W.IdealSheafData)
    (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W) :
    closedCompNatIso I (f ≫ g) h ≪≫ closedCompNatIso (I.comap h) f g =
      eqToIso (congrArg (fun k : X ⟶ W => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (I.comap k))) (Category.assoc f g h)) ≪≫
        closedCompNatIso I f (g ≫ h) ≪≫
          eqToIso (congrArg (fun K : Y.IdealSheafData => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (K.comap f)))
            (I.comap_comp g h)) := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open CategoryTheory AlgebraicGeometry Opposite
variable {X Y Z W : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option maxHeartbeats 100000

-- test: CompositeCoherenceChecked.kernel_threefold_sections
example (I : W.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W)
    (U : X.Opens) (q : (allOpenQuotient (I.comap ((f ≫ g) ≫ h))).obj (op U)) :
    (kernelCompNatIso I (f ≫ g) h ≪≫ kernelCompNatIso (I.comap h) f g).hom.app (op U) q =
      (eqToIso (congrArg (fun k : X ⟶ W => (allOpenQuotient (I.comap k))) (Category.assoc f g h)) ≪≫
        kernelCompNatIso I f (g ≫ h) ≪≫
          eqToIso (congrArg (fun K : Y.IdealSheafData => (allOpenQuotient (K.comap f)))
            (I.comap_comp g h))).hom.app (op U) q := by
  sorry

-- test: CompositeCoherenceChecked.sheaf_threefold_sections
example (I : W.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W)
    (U : X.Opens) (q : ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (I.comap ((f ≫ g) ≫ h))).obj (op U)) :
    (sheafCompNatIso I (f ≫ g) h ≪≫ sheafCompNatIso (I.comap h) f g).hom.app (op U) q =
      (eqToIso (congrArg (fun k : X ⟶ W => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (I.comap k))) (Category.assoc f g h)) ≪≫
        sheafCompNatIso I f (g ≫ h) ≪≫
          eqToIso (congrArg (fun K : Y.IdealSheafData => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (K.comap f)))
            (I.comap_comp g h))).hom.app (op U) q := by
  sorry

-- test: CompositeCoherenceChecked.closed_threefold_sections
example (I : W.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W)
    (U : X.Opens) (q : ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (I.comap ((f ≫ g) ≫ h))).obj (op U)) :
    (closedCompNatIso I (f ≫ g) h ≪≫ closedCompNatIso (I.comap h) f g).hom.app (op U) q =
      (eqToIso (congrArg (fun k : X ⟶ W => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (I.comap k))) (Category.assoc f g h)) ≪≫
        closedCompNatIso I f (g ≫ h) ≪≫
          eqToIso (congrArg (fun K : Y.IdealSheafData => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (K.comap f)))
            (I.comap_comp g h))).hom.app (op U) q := by
  sorry

-- test: CompositeCoherenceChecked.kernel_identity_sections
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : X.Opens)
    (q : (allOpenQuotient (I.comap (𝟙 X ≫ f))).obj (op U)) :
    (kernelCompNatIso I (𝟙 X) f ≪≫
      eqToIso (congrArg allOpenQuotient ((I.comap f).comap_id))).hom.app (op U) q =
      (eqToIso (congrArg (fun k : X ⟶ Y => (allOpenQuotient (I.comap k))) (Category.id_comp f))).hom.app (op U) q := by
  sorry

-- test: CompositeCoherenceChecked.sheaf_identity_sections
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : X.Opens)
    (q : ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (I.comap (f ≫ 𝟙 Y))).obj (op U)) :
    (sheafCompNatIso I f (𝟙 Y) ≪≫
      eqToIso (congrArg (fun K : Y.IdealSheafData => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (K.comap f))) I.comap_id)).hom.app (op U) q =
      (eqToIso (congrArg (fun k : X ⟶ Y => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (I.comap k))) (Category.comp_id f))).hom.app (op U) q := by
  sorry

-- test: CompositeCoherenceChecked.closed_identity_sections
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : X.Opens)
    (q : ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (I.comap (f ≫ 𝟙 Y))).obj (op U)) :
    (closedCompNatIso I f (𝟙 Y) ≪≫
      eqToIso (congrArg (fun K : Y.IdealSheafData => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (K.comap f))) I.comap_id)).hom.app (op U) q =
      (eqToIso (congrArg (fun k : X ⟶ Y => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (I.comap k))) (Category.comp_id f))).hom.app (op U) q := by
  sorry

-- test: CompositeCoherenceChecked.kernel_empty_open
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (q : (allOpenQuotient (I.comap (f ≫ g))).obj (op (⊥ : X.Opens))) :
    (eqToIso (congrArg allOpenQuotient (I.comap_comp f g))).hom.app
      (op (⊥ : X.Opens)) q = 0 := by
  sorry

-- test: CompositeCoherenceChecked.closed_inverse_transport
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (h : I.comap (f ≫ g) = (I.comap g).comap f) :
    (closedCompNatIso I f g).symm =
    (eqToIso (congrArg (fun K : X.IdealSheafData =>
      (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) h)).symm := by
  sorry

-- test: CompositeCoherenceChecked.sheaf_nonreduced
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.Opens := ⊤
    let a := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    ∀ e : sheafify (Opens.grothendieckTopology X)
        (allOpenQuotient (I.comap (𝟙 X ≫ 𝟙 X))) ≅
      sheafify (Opens.grothendieckTopology X)
        (allOpenQuotient ((I.comap (𝟙 X)).comap (𝟙 X))),
    let q := e.hom.app (op U)
      ((toSheafify (Opens.grothendieckTopology X)
        (allOpenQuotient (I.comap (𝟙 X ≫ 𝟙 X)))).app (op U) (Ideal.Quotient.mk _ a))
    q ≠ 0 ∧ q ^ 2 = 0 := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

namespace TauCeti.SchemeFoundations.IdealPullback
open CategoryTheory AlgebraicGeometry Opposite
universe sqU
variable {X Y Z : Scheme.{sqU}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option maxHeartbeats 800000

noncomputable def quotientToSheafNatTrans (I : Y.IdealSheafData) (f : X ⟶ Y) :
    quotientPresheaf I f ⟶
      ((show Monotone (fun U : Y.affineOpens => U.1) from fun _ _ h => h).functor ⋙
        TopologicalSpace.Opens.map f.base).op ⋙
          sheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap f)) :=
  quotientToKernelNatTrans I f ≫
    Functor.whiskerLeft ((show Monotone (fun U : Y.affineOpens => U.1)
      from fun _ _ h => h).functor ⋙ TopologicalSpace.Opens.map f.base).op
      (toSheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap f)))

lemma quotientToSheafNatTrans_mk (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (a : Γ(X, f ⁻¹ᵁ U)) :
    (quotientToSheafNatTrans I f).app (op U) (Ideal.Quotient.mk _ a) =
      (toSheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap f))).app
        (op (f ⁻¹ᵁ U)) (Ideal.Quotient.mk _ a) := by
  sorry

lemma quotientToSheafNatTrans_factor (I : Y.IdealSheafData) (f : X ⟶ Y) :
    quotientToSheafNatTrans I f ≫
      Functor.whiskerLeft ((show Monotone (fun U : Y.affineOpens => U.1)
        from fun _ _ h => h).functor ⋙ TopologicalSpace.Opens.map f.base).op
        (allOpenSheafComparison (I.comap f)) = quotientToClosedNatTrans I f := by
  sorry

lemma quotientToSheafNatTrans_unique (I : Y.IdealSheafData) (f : X ⟶ Y)
    (q : quotientPresheaf I f ⟶
      ((show Monotone (fun U : Y.affineOpens => U.1) from fun _ _ h => h).functor ⋙
        TopologicalSpace.Opens.map f.base).op ⋙
          sheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap f)))
    (hq : q ≫ Functor.whiskerLeft ((show Monotone (fun U : Y.affineOpens => U.1)
      from fun _ _ h => h).functor ⋙ TopologicalSpace.Opens.map f.base).op
      (allOpenSheafComparison (I.comap f)) = quotientToClosedNatTrans I f) :
    q = quotientToSheafNatTrans I f := by
  sorry

lemma quotientToSheafNatTrans_app_isIso (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) :
    IsIso ((quotientToSheafNatTrans I f).app (op U)) := by
  sorry

lemma quotientToSheafNatTrans_isIso (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f] :
    IsIso (quotientToSheafNatTrans I f) := by
  sorry

lemma quotientCompNatIso_kernel (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    [IsAffineHom g] :
    quotientToKernelNatTrans I (f ≫ g) ≫
      Functor.whiskerLeft ((show Monotone (fun U : Z.affineOpens => U.1)
        from fun _ _ h => h).functor ⋙ TopologicalSpace.Opens.map (f ≫ g).base).op
        (kernelCompNatIso I f g).hom =
    (quotientCompNatIso I f g).hom ≫
      Functor.whiskerLeft (show Monotone (fun U : Z.affineOpens =>
        (⟨g ⁻¹ᵁ U, U.2.preimage g⟩ : Y.affineOpens))
        from fun _ _ h => g.preimage_mono h).functor.op
        (quotientToKernelNatTrans (I.comap g) f) := by
  sorry

lemma quotientCompNatIso_closed (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    [IsAffineHom g] :
    quotientToClosedNatTrans I (f ≫ g) ≫
      Functor.whiskerLeft ((show Monotone (fun U : Z.affineOpens => U.1)
        from fun _ _ h => h).functor ⋙ TopologicalSpace.Opens.map (f ≫ g).base).op
        (closedCompNatIso I f g).hom =
    (quotientCompNatIso I f g).hom ≫
      Functor.whiskerLeft (show Monotone (fun U : Z.affineOpens =>
        (⟨g ⁻¹ᵁ U, U.2.preimage g⟩ : Y.affineOpens))
        from fun _ _ h => g.preimage_mono h).functor.op
        (quotientToClosedNatTrans (I.comap g) f) := by
  sorry

lemma quotientCompNatIso_sheaf (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    [IsAffineHom g] :
    quotientToSheafNatTrans I (f ≫ g) ≫
      Functor.whiskerLeft ((show Monotone (fun U : Z.affineOpens => U.1)
        from fun _ _ h => h).functor ⋙ TopologicalSpace.Opens.map (f ≫ g).base).op
        (sheafCompNatIso I f g).hom =
    (quotientCompNatIso I f g).hom ≫
      Functor.whiskerLeft (show Monotone (fun U : Z.affineOpens =>
        (⟨g ⁻¹ᵁ U, U.2.preimage g⟩ : Y.affineOpens))
        from fun _ _ h => g.preimage_mono h).functor.op
        (quotientToSheafNatTrans (I.comap g) f) := by
  sorry

lemma quotientCompNatIso_kernel_inverse (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    [IsAffineHom g] :
    Functor.whiskerLeft (show Monotone (fun U : Z.affineOpens =>
      (⟨g ⁻¹ᵁ U, U.2.preimage g⟩ : Y.affineOpens))
      from fun _ _ h => g.preimage_mono h).functor.op
      (quotientToKernelNatTrans (I.comap g) f) ≫
      Functor.whiskerLeft ((show Monotone (fun U : Z.affineOpens => U.1)
        from fun _ _ h => h).functor ⋙ TopologicalSpace.Opens.map (f ≫ g).base).op
        (kernelCompNatIso I f g).inv =
    (quotientCompNatIso I f g).inv ≫ quotientToKernelNatTrans I (f ≫ g) := by
  sorry

lemma quotientCompNatIso_closed_inverse (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    [IsAffineHom g] :
    Functor.whiskerLeft (show Monotone (fun U : Z.affineOpens =>
      (⟨g ⁻¹ᵁ U, U.2.preimage g⟩ : Y.affineOpens))
      from fun _ _ h => g.preimage_mono h).functor.op
      (quotientToClosedNatTrans (I.comap g) f) ≫
      Functor.whiskerLeft ((show Monotone (fun U : Z.affineOpens => U.1)
        from fun _ _ h => h).functor ⋙ TopologicalSpace.Opens.map (f ≫ g).base).op
        (closedCompNatIso I f g).inv =
    (quotientCompNatIso I f g).inv ≫ quotientToClosedNatTrans I (f ≫ g) := by
  sorry

lemma quotientCompNatIso_sheaf_inverse (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    [IsAffineHom g] :
    Functor.whiskerLeft (show Monotone (fun U : Z.affineOpens =>
      (⟨g ⁻¹ᵁ U, U.2.preimage g⟩ : Y.affineOpens))
      from fun _ _ h => g.preimage_mono h).functor.op
      (quotientToSheafNatTrans (I.comap g) f) ≫
      Functor.whiskerLeft ((show Monotone (fun U : Z.affineOpens => U.1)
        from fun _ _ h => h).functor ⋙ TopologicalSpace.Opens.map (f ≫ g).base).op
        (sheafCompNatIso I f g).inv =
    (quotientCompNatIso I f g).inv ≫ quotientToSheafNatTrans I (f ≫ g) := by
  sorry

lemma quotientCompIso_closed_factor (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : g ⁻¹ᵁ U ∈ Y.affineOpens) :
    CommRingCat.ofHom (quotientToClosed I (f ≫ g) U) ≫
      (closedCompNatIso I f g).hom.app (op ((f ≫ g) ⁻¹ᵁ U)) =
    (quotientCompIso I f g U H).toCommRingCatIso.hom ≫
      CommRingCat.ofHom (quotientToClosed (I.comap g) f ⟨g ⁻¹ᵁ U, H⟩) := by
  sorry

lemma quotientCompIso_sheaf_factor (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : g ⁻¹ᵁ U ∈ Y.affineOpens) :
    (quotientToSheafNatTrans I (f ≫ g)).app (op U) ≫
      (sheafCompNatIso I f g).hom.app (op ((f ≫ g) ⁻¹ᵁ U)) =
    (quotientCompIso I f g U H).toCommRingCatIso.hom ≫
      (quotientToSheafNatTrans (I.comap g) f).app (op ⟨g ⁻¹ᵁ U, H⟩) := by
  sorry

lemma quotientToSheafNatTrans_injective_iff (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) :
    Function.Injective ((quotientToSheafNatTrans I f).app (op U)) ↔
      Function.Injective (quotientToClosed I f U) := by
  sorry

lemma quotientToSheafNatTrans_surjective_iff (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) :
    Function.Surjective ((quotientToSheafNatTrans I f).app (op U)) ↔
      Function.Surjective (quotientToClosed I f U) := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

namespace TauCeti.SchemeFoundations.IdealPullback
open CategoryTheory AlgebraicGeometry Opposite
universe sqU
variable {X Y Z : Scheme.{sqU}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option maxHeartbeats 800000

-- test: QuotientComparisonSquaresChecked.identity_bijective
example (I : X.IdealSheafData) (U : X.affineOpens) :
    Function.Bijective ((quotientToSheafNatTrans I (𝟙 X)).app (op U)) := by
  sorry

-- test: QuotientComparisonSquaresChecked.empty_open
example (I : Y.IdealSheafData) (f : X ⟶ Y)
    (q : (quotientPresheaf I f).obj (op ⟨⊥, isAffineOpen_bot Y⟩)) :
    (quotientToSheafNatTrans I f).app (op ⟨⊥, isAffineOpen_bot Y⟩) q = 0 := by
  sorry

-- test: QuotientComparisonSquaresChecked.surjectivity_obstruction
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (h : ¬ Function.Surjective (quotientToClosed I f U)) :
    ¬ Function.Surjective ((quotientToSheafNatTrans I f).app (op U)) := by
  sorry

-- test: QuotientComparisonSquaresChecked.single_affine_preimage
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : IsAffineOpen (g ⁻¹ᵁ U))
    (q : (quotientPresheaf I (f ≫ g)).obj (op U)) :
    (sheafCompNatIso I f g).hom.app (op ((f ≫ g) ⁻¹ᵁ U))
      ((quotientToSheafNatTrans I (f ≫ g)).app (op U) q) =
    (quotientToSheafNatTrans (I.comap g) f).app (op ⟨g ⁻¹ᵁ U, H⟩)
      (quotientCompIso I f g U H q) := by
  sorry

-- test: QuotientComparisonSquaresChecked.kernel_inverse_sections
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) [IsAffineHom g]
    (U : Z.affineOpens)
    (q : (quotientPresheaf (I.comap g) f).obj (op ⟨g ⁻¹ᵁ U, U.2.preimage g⟩)) :
    (kernelCompNatIso I f g).inv.app (op ((f ≫ g) ⁻¹ᵁ U))
      ((quotientToKernelNatTrans (I.comap g) f).app (op ⟨g ⁻¹ᵁ U, U.2.preimage g⟩) q) =
    (quotientToKernelNatTrans I (f ≫ g)).app (op U)
      ((quotientCompNatIso I f g).inv.app (op U) q) := by
  sorry

-- test: QuotientComparisonSquaresChecked.closed_inverse_sections
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) [IsAffineHom g]
    (U : Z.affineOpens)
    (q : (quotientPresheaf (I.comap g) f).obj (op ⟨g ⁻¹ᵁ U, U.2.preimage g⟩)) :
    (closedCompNatIso I f g).inv.app (op ((f ≫ g) ⁻¹ᵁ U))
      ((quotientToClosedNatTrans (I.comap g) f).app (op ⟨g ⁻¹ᵁ U, U.2.preimage g⟩) q) =
    (quotientToClosedNatTrans I (f ≫ g)).app (op U)
      ((quotientCompNatIso I f g).inv.app (op U) q) := by
  sorry

-- test: QuotientComparisonSquaresChecked.sheaf_inverse_sections
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) [IsAffineHom g]
    (U : Z.affineOpens)
    (q : (quotientPresheaf (I.comap g) f).obj (op ⟨g ⁻¹ᵁ U, U.2.preimage g⟩)) :
    (sheafCompNatIso I f g).inv.app (op ((f ≫ g) ⁻¹ᵁ U))
      ((quotientToSheafNatTrans (I.comap g) f).app (op ⟨g ⁻¹ᵁ U, U.2.preimage g⟩) q) =
    (quotientToSheafNatTrans I (f ≫ g)).app (op U)
      ((quotientCompNatIso I f g).inv.app (op U) q) := by
  sorry

-- test: QuotientComparisonSquaresChecked.nonreduced_identity
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    let a := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    let q := (quotientToSheafNatTrans I (𝟙 X)).app (op U) (Ideal.Quotient.mk _ a)
    q ≠ 0 ∧ q ^ 2 = 0 := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

namespace TauCeti.SchemeFoundations.IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
universe quotientTowerLevel
variable {X Y Z W : Scheme.{quotientTowerLevel}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option maxHeartbeats 800000

lemma quotientPresheaf_eqToIso_mk (I J : Y.IdealSheafData) (h : I = J)
    (f : X ⟶ Y) (U : Y.affineOpens) (a : Γ(X, f ⁻¹ᵁ U)) :
    (eqToIso (congrArg (fun K => quotientPresheaf K f) h)).hom.app (op U)
      (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

lemma quotientPresheaf_hom_ext (I : Y.IdealSheafData) (f : X ⟶ Y)
    {F : Y.affineOpensᵒᵖ ⥤ CommRingCat}
    (α β : quotientPresheaf I f ⟶ F)
    (H : ∀ (U : Y.affineOpens) (a : Γ(X, f ⁻¹ᵁ U)),
      α.app (op U) (Ideal.Quotient.mk _ a) = β.app (op U) (Ideal.Quotient.mk _ a)) :
    α = β := by
  sorry

lemma quotientPresheaf_assoc_mk (I : W.IdealSheafData)
    (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W) (U : W.affineOpens)
    (a : Γ(X, ((f ≫ g) ≫ h) ⁻¹ᵁ U)) :
    (eqToIso (congrArg (quotientPresheaf I) (Category.assoc f g h))).hom.app
      (op U) (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

lemma quotientCompNatIso_assoc_left_mk (I : W.IdealSheafData)
    (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W) [IsAffineHom g] [IsAffineHom h]
    (U : W.affineOpens) (a : Γ(X, ((f ≫ g) ≫ h) ⁻¹ᵁ U)) :
    (quotientCompNatIso I (f ≫ g) h ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
        (⟨h ⁻¹ᵁ U, U.2.preimage h⟩ : Z.affineOpens))
        from fun _ _ k => h.preimage_mono k).functor.op
        (quotientCompNatIso (I.comap h) f g)).hom.app (op U) (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

lemma quotientCompNatIso_eqToIso_mk (I : Z.IdealSheafData)
    (f : X ⟶ Y) (g : Y ⟶ Z) [IsAffineHom g]
    (J : Y.IdealSheafData) (hJ : I.comap g = J)
    (U : Z.affineOpens) (a : Γ(X, (f ≫ g) ⁻¹ᵁ U)) :
    (quotientCompNatIso I f g ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : Z.affineOpens =>
        (⟨g ⁻¹ᵁ U, U.2.preimage g⟩ : Y.affineOpens))
        from fun _ _ k => g.preimage_mono k).functor.op
        (eqToIso (congrArg (fun K => quotientPresheaf K f) hJ))).hom.app
          (op U) (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

lemma quotientPresheaf_assoc_post_mk (I : W.IdealSheafData)
    (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W)
    {F : W.affineOpensᵒᵖ ⥤ CommRingCat}
    (α : quotientPresheaf I (f ≫ g ≫ h) ⟶ F)
    (U : W.affineOpens) (a : Γ(X, ((f ≫ g) ≫ h) ⁻¹ᵁ U)) :
    ((eqToIso (congrArg (quotientPresheaf I) (Category.assoc f g h))).hom ≫ α).app
      (op U) (Ideal.Quotient.mk _ a) = α.app (op U) (Ideal.Quotient.mk _ a) := by
  sorry

lemma quotientCompNatIso_assoc_right_mk (I : W.IdealSheafData)
    (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W) [IsAffineHom g] [IsAffineHom h]
    (U : W.affineOpens) (a : Γ(X, ((f ≫ g) ≫ h) ⁻¹ᵁ U)) :
    (eqToIso (congrArg (quotientPresheaf I) (Category.assoc f g h)) ≪≫
      quotientCompNatIso I f (g ≫ h) ≪≫
        Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
          (⟨(g ≫ h) ⁻¹ᵁ U, U.2.preimage (g ≫ h)⟩ : Y.affineOpens))
          from fun _ _ k => (g ≫ h).preimage_mono k).functor.op
          (eqToIso (congrArg (fun K => quotientPresheaf K f) (I.comap_comp g h)))).hom.app (op U) (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

lemma quotientCompNatIso_assoc (I : W.IdealSheafData)
    (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W) [IsAffineHom g] [IsAffineHom h] :
    quotientCompNatIso I (f ≫ g) h ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
        (⟨h ⁻¹ᵁ U, U.2.preimage h⟩ : Z.affineOpens))
        from fun _ _ k => h.preimage_mono k).functor.op
        (quotientCompNatIso (I.comap h) f g) =
    eqToIso (congrArg (quotientPresheaf I) (Category.assoc f g h)) ≪≫
      quotientCompNatIso I f (g ≫ h) ≪≫
        Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
          (⟨(g ≫ h) ⁻¹ᵁ U, U.2.preimage (g ≫ h)⟩ : Y.affineOpens))
          from fun _ _ k => (g ≫ h).preimage_mono k).functor.op
          (eqToIso (congrArg (fun K => quotientPresheaf K f) (I.comap_comp g h))) := by
  sorry

lemma quotientPresheaf_id_right_mk (I : Y.IdealSheafData)
    (f : X ⟶ Y) (U : Y.affineOpens) (a : Γ(X, f ⁻¹ᵁ U)) :
    (eqToIso (congrArg (quotientPresheaf I) (Category.comp_id f))).hom.app
      (op U) (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

lemma quotientCompNatIso_id_right (I : Y.IdealSheafData) (f : X ⟶ Y) :
    quotientCompNatIso I f (𝟙 Y) ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : Y.affineOpens =>
        (⟨(𝟙 Y) ⁻¹ᵁ U, U.2.preimage (𝟙 Y)⟩ : Y.affineOpens))
        from fun _ _ k => (𝟙 Y : Y ⟶ Y).preimage_mono k).functor.op
        (eqToIso (congrArg (fun K => quotientPresheaf K f) I.comap_id)) =
      eqToIso (congrArg (quotientPresheaf I) (Category.comp_id f)) := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

namespace TauCeti.SchemeFoundations.IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
universe quotientTowerTestLevel
variable {X Y Z W : Scheme.{quotientTowerTestLevel}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option maxHeartbeats 800000

-- test: QuotientTowerChecked.ideal_transport_roundtrip
example (I J : Y.IdealSheafData) (h : I = J) (f : X ⟶ Y)
    (U : Y.affineOpens) (q : (quotientPresheaf I f).obj (op U)) :
    (eqToIso (congrArg (fun K => quotientPresheaf K f) h)).inv.app (op U)
      ((eqToIso (congrArg (fun K => quotientPresheaf K f) h)).hom.app (op U) q) = q := by
  sorry

-- test: QuotientTowerChecked.right_identity_sections
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (q : (quotientPresheaf I (f ≫ 𝟙 Y)).obj (op U)) :
    (quotientCompNatIso I f (𝟙 Y) ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : Y.affineOpens =>
        (⟨(𝟙 Y) ⁻¹ᵁ U, U.2.preimage (𝟙 Y)⟩ : Y.affineOpens))
        from fun _ _ k => (𝟙 Y : Y ⟶ Y).preimage_mono k).functor.op
        (eqToIso (congrArg (fun K => quotientPresheaf K f) I.comap_id))).hom.app (op U) q =
      (eqToIso (congrArg (quotientPresheaf I) (Category.comp_id f))).hom.app (op U) q := by
  sorry

-- test: QuotientTowerChecked.assoc_sections
example (I : W.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W)
    [IsAffineHom g] [IsAffineHom h] (U : W.affineOpens)
    (q : (quotientPresheaf I ((f ≫ g) ≫ h)).obj (op U)) :
    (quotientCompNatIso I (f ≫ g) h ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
        (⟨h ⁻¹ᵁ U, U.2.preimage h⟩ : Z.affineOpens))
        from fun _ _ k => h.preimage_mono k).functor.op
        (quotientCompNatIso (I.comap h) f g)).hom.app (op U) q =
      (eqToIso (congrArg (quotientPresheaf I) (Category.assoc f g h)) ≪≫
      quotientCompNatIso I f (g ≫ h) ≪≫
        Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
          (⟨(g ≫ h) ⁻¹ᵁ U, U.2.preimage (g ≫ h)⟩ : Y.affineOpens))
          from fun _ _ k => (g ≫ h).preimage_mono k).functor.op
          (eqToIso (congrArg (fun K => quotientPresheaf K f) (I.comap_comp g h)))).hom.app (op U) q := by
  sorry

-- test: QuotientTowerChecked.assoc_inverse_sections
example (I : W.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W)
    [IsAffineHom g] [IsAffineHom h] (U : W.affineOpens)
    (q : (quotientPresheaf ((I.comap h).comap g) f).obj
      (op ⟨g ⁻¹ᵁ (h ⁻¹ᵁ U), (U.2.preimage h).preimage g⟩)) :
    (quotientCompNatIso I (f ≫ g) h ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
        (⟨h ⁻¹ᵁ U, U.2.preimage h⟩ : Z.affineOpens))
        from fun _ _ k => h.preimage_mono k).functor.op
        (quotientCompNatIso (I.comap h) f g)).inv.app (op U) q =
      (eqToIso (congrArg (quotientPresheaf I) (Category.assoc f g h)) ≪≫
      quotientCompNatIso I f (g ≫ h) ≪≫
        Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
          (⟨(g ≫ h) ⁻¹ᵁ U, U.2.preimage (g ≫ h)⟩ : Y.affineOpens))
          from fun _ _ k => (g ≫ h).preimage_mono k).functor.op
          (eqToIso (congrArg (fun K => quotientPresheaf K f) (I.comap_comp g h)))).inv.app (op U) q := by
  sorry

-- test: QuotientTowerChecked.kernel_target_sections
example (I : W.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W)
    [IsAffineHom g] [IsAffineHom h] (U : W.affineOpens)
    (q : (quotientPresheaf I ((f ≫ g) ≫ h)).obj (op U)) :
    (quotientToKernelNatTrans ((I.comap h).comap g) f).app
      (op ⟨g ⁻¹ᵁ (h ⁻¹ᵁ U), (U.2.preimage h).preimage g⟩) ((quotientCompNatIso I (f ≫ g) h ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
        (⟨h ⁻¹ᵁ U, U.2.preimage h⟩ : Z.affineOpens))
        from fun _ _ k => h.preimage_mono k).functor.op
        (quotientCompNatIso (I.comap h) f g)).hom.app (op U) q) =
    (quotientToKernelNatTrans ((I.comap h).comap g) f).app
      (op ⟨g ⁻¹ᵁ (h ⁻¹ᵁ U), (U.2.preimage h).preimage g⟩) ((eqToIso (congrArg (quotientPresheaf I) (Category.assoc f g h)) ≪≫
      quotientCompNatIso I f (g ≫ h) ≪≫
        Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
          (⟨(g ≫ h) ⁻¹ᵁ U, U.2.preimage (g ≫ h)⟩ : Y.affineOpens))
          from fun _ _ k => (g ≫ h).preimage_mono k).functor.op
          (eqToIso (congrArg (fun K => quotientPresheaf K f) (I.comap_comp g h)))).hom.app (op U) q) := by
  sorry

-- test: QuotientTowerChecked.closed_target_sections
example (I : W.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W)
    [IsAffineHom g] [IsAffineHom h] (U : W.affineOpens)
    (q : (quotientPresheaf I ((f ≫ g) ≫ h)).obj (op U)) :
    (quotientToClosedNatTrans ((I.comap h).comap g) f).app
      (op ⟨g ⁻¹ᵁ (h ⁻¹ᵁ U), (U.2.preimage h).preimage g⟩) ((quotientCompNatIso I (f ≫ g) h ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
        (⟨h ⁻¹ᵁ U, U.2.preimage h⟩ : Z.affineOpens))
        from fun _ _ k => h.preimage_mono k).functor.op
        (quotientCompNatIso (I.comap h) f g)).hom.app (op U) q) =
    (quotientToClosedNatTrans ((I.comap h).comap g) f).app
      (op ⟨g ⁻¹ᵁ (h ⁻¹ᵁ U), (U.2.preimage h).preimage g⟩) ((eqToIso (congrArg (quotientPresheaf I) (Category.assoc f g h)) ≪≫
      quotientCompNatIso I f (g ≫ h) ≪≫
        Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
          (⟨(g ≫ h) ⁻¹ᵁ U, U.2.preimage (g ≫ h)⟩ : Y.affineOpens))
          from fun _ _ k => (g ≫ h).preimage_mono k).functor.op
          (eqToIso (congrArg (fun K => quotientPresheaf K f) (I.comap_comp g h)))).hom.app (op U) q) := by
  sorry

-- test: QuotientTowerChecked.sheaf_target_sections
example (I : W.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W)
    [IsAffineHom g] [IsAffineHom h] (U : W.affineOpens)
    (q : (quotientPresheaf I ((f ≫ g) ≫ h)).obj (op U)) :
    (quotientToSheafNatTrans ((I.comap h).comap g) f).app
      (op ⟨g ⁻¹ᵁ (h ⁻¹ᵁ U), (U.2.preimage h).preimage g⟩) ((quotientCompNatIso I (f ≫ g) h ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
        (⟨h ⁻¹ᵁ U, U.2.preimage h⟩ : Z.affineOpens))
        from fun _ _ k => h.preimage_mono k).functor.op
        (quotientCompNatIso (I.comap h) f g)).hom.app (op U) q) =
    (quotientToSheafNatTrans ((I.comap h).comap g) f).app
      (op ⟨g ⁻¹ᵁ (h ⁻¹ᵁ U), (U.2.preimage h).preimage g⟩) ((eqToIso (congrArg (quotientPresheaf I) (Category.assoc f g h)) ≪≫
      quotientCompNatIso I f (g ≫ h) ≪≫
        Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
          (⟨(g ≫ h) ⁻¹ᵁ U, U.2.preimage (g ≫ h)⟩ : Y.affineOpens))
          from fun _ _ k => (g ≫ h).preimage_mono k).functor.op
          (eqToIso (congrArg (fun K => quotientPresheaf K f) (I.comap_comp g h)))).hom.app (op U) q) := by
  sorry

-- test: QuotientTowerChecked.empty_source
example (I : W.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W)
    [IsAffineHom g] [IsAffineHom h]
    (q : (quotientPresheaf I ((f ≫ g) ≫ h)).obj (op ⟨⊥, isAffineOpen_bot W⟩)) :
    (quotientCompNatIso I (f ≫ g) h ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
        (⟨h ⁻¹ᵁ U, U.2.preimage h⟩ : Z.affineOpens))
        from fun _ _ k => h.preimage_mono k).functor.op
        (quotientCompNatIso (I.comap h) f g)).hom.app (op ⟨⊥, isAffineOpen_bot W⟩) q = 0 := by
  sorry

-- test: QuotientTowerChecked.nonreduced_identity_tower
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    let f : X ⟶ X := 𝟙 X
    let g : X ⟶ X := 𝟙 X
    let h : X ⟶ X := 𝟙 X
    let a := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    let q := (quotientCompNatIso I (f ≫ g) h ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : X.affineOpens =>
        (⟨h ⁻¹ᵁ U, U.2.preimage h⟩ : X.affineOpens))
        from fun _ _ k => h.preimage_mono k).functor.op
        (quotientCompNatIso (I.comap h) f g)).hom.app (op U) (Ideal.Quotient.mk _ a)
    q ≠ 0 ∧ q ^ 2 = 0 := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback



open scoped TensorProduct
open AlgebraicGeometry

namespace TauCeti.SchemeFoundations.Excellence

/-- Noetherian geometric regularity, tested after finite purely inseparable extensions. -/
def GeometricallyRegular (k B : Type u) [Field k] [CommRing B] [Algebra k B] : Prop :=
  IsNoetherianRing B ∧
    ∀ (L : Type u) [Field L] [Algebra k L], Module.Finite k L →
      IsPurelyInseparable k L → IsRegularRing (L ⊗[k] B)

lemma GeometricallyRegular.regular (k B : Type u) [Field k] [CommRing B]
    [Algebra k B] (h : GeometricallyRegular k B) : IsRegularRing B := by sorry

lemma GeometricallyRegular.finite_extension (k B L : Type u) [Field k] [CommRing B]
    [Algebra k B] [Field L] [Algebra k L] [Module.Finite k L]
    (h : GeometricallyRegular k B) : IsRegularRing (L ⊗[k] B) := by sorry

lemma GeometricallyRegular.algEquiv (k B C : Type u) [Field k] [CommRing B]
    [CommRing C] [Algebra k B] [Algebra k C] (e : B ≃ₐ[k] C) :
    GeometricallyRegular k B ↔ GeometricallyRegular k C := by sorry

-- test: GeometricallyRegular.test_field
example (k : Type u) [Field k] : GeometricallyRegular k k := by sorry
-- test: GeometricallyRegular.test_zero
example (k : Type u) [Field k] :
    GeometricallyRegular k (k ⧸ (⊤ : Ideal k)) := by sorry
-- test: GeometricallyRegular.test_dual_numbers
example (k : Type u) [Field k] : ¬ GeometricallyRegular k (TrivSqZeroExt k k) := by sorry
-- test: GeometricallyRegular.test_inseparable
example (k L : Type u) [Field k] [Field L] [Algebra k L] [Module.Finite k L]
    [IsPurelyInseparable k L] (h : ¬ Algebra.IsSeparable k L) :
    ¬ GeometricallyRegular k L := by sorry

/-- Flatness plus Noetherian geometrically regular native residue-field fibres. -/
def RegularAlgebraMap (R B : Type u) [CommRing R] [CommRing B] [Algebra R B] : Prop :=
  Module.Flat R B ∧ ∀ p : PrimeSpectrum R,
    GeometricallyRegular p.asIdeal.ResidueField (p.asIdeal.Fiber B)

lemma RegularAlgebraMap.flat (R B : Type u) [CommRing R] [CommRing B]
    [Algebra R B] (h : RegularAlgebraMap R B) : Module.Flat R B := by sorry

lemma RegularAlgebraMap.fibre (R B : Type u) [CommRing R] [CommRing B]
    [Algebra R B] (h : RegularAlgebraMap R B) (p : PrimeSpectrum R) :
    GeometricallyRegular p.asIdeal.ResidueField (p.asIdeal.Fiber B) := by sorry

lemma RegularAlgebraMap.field_iff (k L : Type u) [Field k] [Field L] [Algebra k L]
    [Module.Finite k L] :
    RegularAlgebraMap k L ↔ Algebra.IsSeparable k L := by sorry

-- test: RegularAlgebraMap.test_identity
example (R : Type u) [CommRing R] : RegularAlgebraMap R R := by sorry
-- test: RegularAlgebraMap.test_zero
example (R : Type u) [CommRing R] : RegularAlgebraMap R (R ⧸ (⊤ : Ideal R)) := by sorry
-- test: RegularAlgebraMap.test_flat_not_regular
example (k : Type u) [Field k] :
    Module.Flat k (TrivSqZeroExt k k) ∧ ¬ RegularAlgebraMap k (TrivSqZeroExt k k) := by sorry

/-- The actual regular locus; it need not be open without a further hypothesis. -/
def regularLocus (R : Type u) [CommRing R] : Set (PrimeSpectrum R) :=
  {p | IsRegularLocalRing (Localization.AtPrime p.asIdeal)}

lemma mem_regularLocus (R : Type u) [CommRing R] (p : PrimeSpectrum R) :
    p ∈ regularLocus R ↔ IsRegularLocalRing (Localization.AtPrime p.asIdeal) := by sorry

lemma regularLocus_eq_univ (R : Type u) [CommRing R] [IsRegularRing R] :
    regularLocus R = Set.univ := by sorry

lemma regularLocus_ringEquiv (R S : Type u) [CommRing R] [CommRing S]
    (e : R ≃+* S) (q : PrimeSpectrum S) :
    q ∈ regularLocus S ↔ PrimeSpectrum.comap e.toRingHom q ∈ regularLocus R := by sorry

-- test: regularLocus.test_field
example (k : Type u) [Field k] : regularLocus k = Set.univ := by sorry
-- test: regularLocus.test_zero
example (R : Type u) [CommRing R] :
    regularLocus (R ⧸ (⊤ : Ideal R)) = ∅ := by sorry
-- test: regularLocus.test_dual_numbers
example (k : Type u) [Field k] : regularLocus (TrivSqZeroExt k k) = ∅ := by sorry

/-- At every prime, the completion of the local ring has regular formal fibres. -/
def IsGRing (R : Type u) [CommRing R] : Prop :=
  IsNoetherianRing R ∧ ∀ p : PrimeSpectrum R,
    RegularAlgebraMap (Localization.AtPrime p.asIdeal)
      (AdicCompletion (IsLocalRing.maximalIdeal (Localization.AtPrime p.asIdeal))
        (Localization.AtPrime p.asIdeal))

lemma IsGRing.noetherian (R : Type u) [CommRing R] (h : IsGRing R) :
    IsNoetherianRing R := by sorry

lemma IsGRing.completion_regular (R : Type u) [CommRing R] (h : IsGRing R)
    (p : PrimeSpectrum R) :
    RegularAlgebraMap (Localization.AtPrime p.asIdeal)
      (AdicCompletion (IsLocalRing.maximalIdeal (Localization.AtPrime p.asIdeal))
        (Localization.AtPrime p.asIdeal)) := by sorry

lemma IsGRing.ringEquiv (R S : Type u) [CommRing R] [CommRing S]
    (e : R ≃+* S) (h : IsGRing R) : IsGRing S := by sorry

-- test: IsGRing.test_field
example (k : Type u) [Field k] : IsGRing k := by sorry
-- test: IsGRing.test_zero
example (R : Type u) [CommRing R] : IsGRing (R ⧸ (⊤ : Ideal R)) := by sorry
-- test: IsGRing.test_complete_local
example (R : Type u) [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R] : IsGRing R := by sorry

/-- Openness for every finite-type algebra, rather than only for the base spectrum. -/
def IsJ2 (R : Type u) [CommRing R] : Prop :=
  IsNoetherianRing R ∧ ∀ (B : Type u) [CommRing B] [Algebra R B],
    Algebra.FiniteType R B → IsOpen (regularLocus B)

lemma IsJ2.noetherian (R : Type u) [CommRing R] (h : IsJ2 R) :
    IsNoetherianRing R := by sorry

lemma IsJ2.regularLocus_open (R B : Type u) [CommRing R] [CommRing B] [Algebra R B]
    [Algebra.FiniteType R B] (h : IsJ2 R) : IsOpen (regularLocus B) := by sorry

lemma IsJ2.ringEquiv (R S : Type u) [CommRing R] [CommRing S]
    (e : R ≃+* S) (h : IsJ2 R) : IsJ2 S := by sorry

-- test: IsJ2.test_field
example (k : Type u) [Field k] : IsJ2 k := by sorry
-- test: IsJ2.test_zero
example (R : Type u) [CommRing R] : IsJ2 (R ⧸ (⊤ : Ideal R)) := by sorry
-- test: IsJ2.test_singular_allowed
example (k : Type u) [Field k] : IsJ2 (TrivSqZeroExt k k) := by sorry

def IsQuasiExcellentRing (R : Type u) [CommRing R] : Prop := IsGRing R ∧ IsJ2 R

lemma IsQuasiExcellentRing.gRing (R : Type u) [CommRing R]
    (h : IsQuasiExcellentRing R) : IsGRing R := by sorry
lemma IsQuasiExcellentRing.j2 (R : Type u) [CommRing R]
    (h : IsQuasiExcellentRing R) : IsJ2 R := by sorry

lemma IsQuasiExcellentRing.noetherian (R : Type u) [CommRing R]
    (h : IsQuasiExcellentRing R) : IsNoetherianRing R := h.1.1

-- test: IsQuasiExcellentRing.test_field
example (k : Type u) [Field k] : IsQuasiExcellentRing k := by sorry
-- test: IsQuasiExcellentRing.test_zero
example (R : Type u) [CommRing R] : IsQuasiExcellentRing (R ⧸ (⊤ : Ideal R)) := by sorry
-- test: IsQuasiExcellentRing.test_nilpotents_allowed
example (k : Type u) [Field k] : IsQuasiExcellentRing (TrivSqZeroExt k k) := by sorry

/-- The final conjunct is the expansion of the imported R03.3/catenary predicate
for every finite-type algebra. There is no second catenary-ring node here. -/
def IsExcellentRing (R : Type u) [CommRing R] : Prop :=
  IsQuasiExcellentRing R ∧ ∀ (B : Type u) [CommRing B] [Algebra R B],
    Algebra.FiniteType R B → ∀ p q : PrimeSpectrum B, p ≤ q →
      (∃ n : ℕ, ∀ s : LTSeries (PrimeSpectrum B),
        s.head = p → s.last = q → s.length ≤ n) ∧
      ∀ s t : LTSeries (PrimeSpectrum B),
        s.head = p → s.last = q → t.head = p → t.last = q →
        (∀ i : Fin s.length, s (Fin.castSucc i) ⋖ s i.succ) →
        (∀ i : Fin t.length, t (Fin.castSucc i) ⋖ t i.succ) → s.length = t.length

lemma IsExcellentRing.quasiExcellent (R : Type u) [CommRing R]
    (h : IsExcellentRing R) : IsQuasiExcellentRing R := by sorry

lemma IsExcellentRing.finiteType (R B : Type u) [CommRing R] [CommRing B]
    [Algebra R B] [Algebra.FiniteType R B] (h : IsExcellentRing R) :
    IsExcellentRing B := by sorry

lemma IsExcellentRing.localization (R : Type u) [CommRing R] (M : Submonoid R)
    (h : IsExcellentRing R) : IsExcellentRing (Localization M) := by sorry

-- test: IsExcellentRing.test_field
example (k : Type u) [Field k] : IsExcellentRing k := by sorry
-- test: IsExcellentRing.test_zero
example (R : Type u) [CommRing R] : IsExcellentRing (R ⧸ (⊤ : Ideal R)) := by sorry
-- test: IsExcellentRing.test_integers
example : IsExcellentRing ℤ := by sorry
-- test: IsExcellentRing.test_nilpotents_allowed
example (k : Type u) [Field k] : IsExcellentRing (TrivSqZeroExt k k) := by sorry
-- test: IsExcellentRing.test_complete_local
example (R : Type u) [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R] : IsExcellentRing R := by sorry

def IsQuasiExcellentScheme (X : Scheme.{u}) : Prop :=
  ∀ x : X, ∃ U : X.Opens, x ∈ U ∧ IsAffineOpen U ∧ IsQuasiExcellentRing Γ(X, U)

lemma IsQuasiExcellentScheme.affine_iff (X : Scheme.{u}) :
    IsQuasiExcellentScheme X ↔
      ∀ U : X.Opens, IsAffineOpen U → IsQuasiExcellentRing Γ(X, U) := by sorry

lemma IsQuasiExcellentScheme.locallyNoetherian (X : Scheme.{u})
    (h : IsQuasiExcellentScheme X) : IsLocallyNoetherian X := by sorry

lemma IsQuasiExcellentScheme.iso (X Y : Scheme.{u}) (e : X ≅ Y)
    (h : IsQuasiExcellentScheme X) : IsQuasiExcellentScheme Y := by sorry

-- test: IsQuasiExcellentScheme.test_spec
example (R : Type u) [CommRing R] :
    IsQuasiExcellentScheme (Spec (.of R)) ↔ IsQuasiExcellentRing R := by sorry
-- test: IsQuasiExcellentScheme.test_field
example (k : Type u) [Field k] : IsQuasiExcellentScheme (Spec (.of k)) := by sorry
-- test: IsQuasiExcellentScheme.test_zero
example (R : Type u) [CommRing R] :
    IsQuasiExcellentScheme (Spec (.of (R ⧸ (⊤ : Ideal R)))) := by sorry

-- node: SchemeAndStackFoundations:key/excellent-schemes
def IsExcellentScheme (X : Scheme.{u}) : Prop :=
  ∀ x : X, ∃ U : X.Opens, x ∈ U ∧ IsAffineOpen U ∧ IsExcellentRing Γ(X, U)

lemma IsExcellentScheme.affine_iff (X : Scheme.{u}) :
    IsExcellentScheme X ↔
      ∀ U : X.Opens, IsAffineOpen U → IsExcellentRing Γ(X, U) := by sorry

lemma IsExcellentScheme.quasiExcellent (X : Scheme.{u})
    (h : IsExcellentScheme X) : IsQuasiExcellentScheme X := by sorry

lemma IsExcellentScheme.locallyNoetherian (X : Scheme.{u})
    (h : IsExcellentScheme X) : IsLocallyNoetherian X := by sorry

-- test: IsExcellentScheme.test_spec
example (R : Type u) [CommRing R] :
    IsExcellentScheme (Spec (.of R)) ↔ IsExcellentRing R := by sorry
-- test: IsExcellentScheme.test_field
example (k : Type u) [Field k] : IsExcellentScheme (Spec (.of k)) := by sorry
-- test: IsExcellentScheme.test_empty
example (R : Type u) [CommRing R] :
    IsExcellentScheme (Spec (.of (R ⧸ (⊤ : Ideal R)))) := by sorry
-- test: IsExcellentScheme.test_nonreduced
example (k : Type u) [Field k] :
    IsExcellentScheme (Spec (.of (TrivSqZeroExt k k))) := by sorry

end TauCeti.SchemeFoundations.Excellence



open CategoryTheory CategoryTheory.Limits Opposite AlgebraicGeometry
namespace TauCeti.SchemeFoundations.Spaces

abbrev SchemePresheaf := Scheme.{u}ᵒᵖ ⥤ Type u

/-- A named condition on the native diagonal, using native relative representability. -/
def RepresentableDiagonal (F : SchemePresheaf.{u}) : Prop :=
  yoneda.relativelyRepresentable (prod.lift (𝟙 F) (𝟙 F))

lemma RepresentableDiagonal.of_scheme (X : Scheme.{u}) :
    RepresentableDiagonal (yoneda.obj X) := by sorry

lemma RepresentableDiagonal.iso (F G : SchemePresheaf.{u}) (e : F ≅ G) :
    RepresentableDiagonal F ↔ RepresentableDiagonal G := by sorry

lemma RepresentableDiagonal.from_scheme (F : SchemePresheaf.{u})
    (h : RepresentableDiagonal F) (X : Scheme.{u}) (a : yoneda.obj X ⟶ F) :
    yoneda.relativelyRepresentable a := by sorry

-- test: RepresentableDiagonal.test_field
example (k : Type u) [Field k] :
    RepresentableDiagonal (yoneda.obj (Spec (.of k))) := by sorry
-- test: RepresentableDiagonal.test_empty
example : RepresentableDiagonal (yoneda.obj Scheme.empty.{u}) := by sorry
-- test: RepresentableDiagonal.test_nonreduced
example (k : Type u) [Field k] :
    RepresentableDiagonal (yoneda.obj (Spec (.of (TrivSqZeroExt k k)))) := by sorry

/-- Etaleness and surjectivity are tested on every represented scheme base change. -/
def EtaleAtlas (F : SchemePresheaf.{u}) (U : Scheme.{u}) (a : yoneda.obj U ⟶ F) : Prop :=
  MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
    MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a

lemma EtaleAtlas.representable (F : SchemePresheaf.{u}) (U : Scheme.{u})
    (a : yoneda.obj U ⟶ F) (h : EtaleAtlas F U a) :
    yoneda.relativelyRepresentable a := by sorry

lemma EtaleAtlas.etale (F : SchemePresheaf.{u}) (U : Scheme.{u})
    (a : yoneda.obj U ⟶ F) (h : EtaleAtlas F U a) :
    MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a := by sorry

lemma EtaleAtlas.surjective (F : SchemePresheaf.{u}) (U : Scheme.{u})
    (a : yoneda.obj U ⟶ F) (h : EtaleAtlas F U a) :
    MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a := by sorry

lemma EtaleAtlas.yoneda_iff (U X : Scheme.{u}) (f : U ⟶ X) :
    EtaleAtlas (yoneda.obj X) U (yoneda.map f) ↔ Etale f ∧ Surjective f := by sorry

-- test: EtaleAtlas.test_identity
example (X : Scheme.{u}) : EtaleAtlas (yoneda.obj X) X (𝟙 (yoneda.obj X)) := by sorry
-- test: EtaleAtlas.test_empty_identity
example : EtaleAtlas (yoneda.obj Scheme.empty.{u}) Scheme.empty
    (𝟙 (yoneda.obj Scheme.empty)) := by sorry
-- test: EtaleAtlas.test_empty_not_cover
example (k : Type u) [Field k] (a : yoneda.obj Scheme.empty ⟶ yoneda.obj (Spec (.of k))) :
    ¬ EtaleAtlas (yoneda.obj (Spec (.of k))) Scheme.empty a := by sorry

/-- Absolute algebraic spaces. A space over S carries a map to h_S in the native over-category.
No quasi-compactness of the diagonal or properness is imposed. -/
def IsAlgebraicSpace (F : SchemePresheaf.{u}) : Prop :=
  Presheaf.IsSheaf Scheme.fppfTopology F ∧ RepresentableDiagonal F ∧
    ∃ (U : Scheme.{u}) (a : yoneda.obj U ⟶ F), EtaleAtlas F U a

lemma IsAlgebraicSpace.sheaf (F : SchemePresheaf.{u}) (h : IsAlgebraicSpace F) :
    Presheaf.IsSheaf Scheme.fppfTopology F := by sorry
lemma IsAlgebraicSpace.diagonal (F : SchemePresheaf.{u}) (h : IsAlgebraicSpace F) :
    RepresentableDiagonal F := by sorry
lemma IsAlgebraicSpace.atlas (F : SchemePresheaf.{u}) (h : IsAlgebraicSpace F) :
    ∃ (U : Scheme.{u}) (a : yoneda.obj U ⟶ F), EtaleAtlas F U a := by sorry
lemma IsAlgebraicSpace.of_scheme (X : Scheme.{u}) :
    IsAlgebraicSpace (yoneda.obj X) := by sorry
lemma IsAlgebraicSpace.iso (F G : SchemePresheaf.{u}) (e : F ≅ G) :
    IsAlgebraicSpace F ↔ IsAlgebraicSpace G := by sorry

-- test: IsAlgebraicSpace.test_field
example (k : Type u) [Field k] : IsAlgebraicSpace (yoneda.obj (Spec (.of k))) := by sorry
-- test: IsAlgebraicSpace.test_empty
example : IsAlgebraicSpace (yoneda.obj Scheme.empty.{u}) := by sorry
-- test: IsAlgebraicSpace.test_nonreduced
example (k : Type u) [Field k] :
    IsAlgebraicSpace (yoneda.obj (Spec (.of (TrivSqZeroExt k k)))) := by sorry
-- test: IsAlgebraicSpace.test_arbitrary_scheme
example (X : Scheme.{u}) : IsAlgebraicSpace (yoneda.obj X) := by sorry

end TauCeti.SchemeFoundations.Spaces

open Topology
universe gerbU gerbV gerbW
namespace TauCeti.SchemeFoundations.GaloisGerbs
variable (N : Type gerbU) (E : Type gerbV) (G : Type gerbW)
variable [Group N] [Group E] [Group G]
variable [TopologicalSpace N] [TopologicalSpace E] [TopologicalSpace G]
variable [IsTopologicalGroup E] [IsTopologicalGroup G] [DiscreteTopology N]
/-- Topological extension prefix only: the algebraic kernel and Galois quotient are
specified separately in the definitive roadmap. -/
structure TopologicalExtension [IsTopologicalGroup E] [IsTopologicalGroup G]
    [DiscreteTopology N] extends GroupExtension N E G where
  inl_embedding : Topology.IsEmbedding toGroupExtension.inl
  rightHom_continuous : Continuous toGroupExtension.rightHom
  rightHom_quotient : Topology.IsQuotientMap toGroupExtension.rightHom
variable {N E G}
namespace TopologicalExtension
theorem kernel_iff (T : TopologicalExtension N E G) (e : E) :
    T.rightHom e = 1 ↔ ∃ n : N, T.inl n = e := by
  rw [← MonoidHom.mem_ker, ← T.range_inl_eq_ker_rightHom]
  rfl
theorem inl_project (T : TopologicalExtension N E G) (n : N) :
    T.rightHom (T.inl n) = 1 := T.toGroupExtension.rightHom_inl n
theorem continuous_projection (T : TopologicalExtension N E G) :
    Continuous T.rightHom ∧ Topology.IsQuotientMap T.rightHom :=
  ⟨T.rightHom_continuous, T.rightHom_quotient⟩
end TopologicalExtension
/-- A witnessed topological chart, not a claim that the whole extension splits. -/
structure LocalSplitChart (T : TopologicalExtension N E G) where
  subgroup : Subgroup G
  subgroup_open : IsOpen (subgroup : Set G)
  sectionHom : subgroup →* E
  section_continuous : Continuous sectionHom
  project_section : ∀ g : subgroup, T.rightHom (sectionHom g) = (g : G)
  chart : (N × subgroup) ≃ₜ {e : E // T.rightHom e ∈ subgroup}
  chart_formula : ∀ n g, (chart (n,g)).val = T.inl n * sectionHom g
namespace LocalSplitChart
theorem section_one (T : TopologicalExtension N E G) (C : LocalSplitChart T) :
    C.sectionHom 1 = 1 := C.sectionHom.map_one
theorem section_mul (T : TopologicalExtension N E G) (C : LocalSplitChart T)
    (g h : C.subgroup) : C.sectionHom (g*h) = C.sectionHom g * C.sectionHom h :=
  C.sectionHom.map_mul g h
theorem chart_value (T : TopologicalExtension N E G) (C : LocalSplitChart T)
    (n : N) (g : C.subgroup) : (C.chart (n,g)).val = T.inl n * C.sectionHom g :=
  C.chart_formula n g
end LocalSplitChart
example (T : TopologicalExtension N E G) (n : N) :
    T.rightHom (T.inl n) = 1 := TopologicalExtension.inl_project T n
example (T : TopologicalExtension N E G) (C : LocalSplitChart T) :
    C.sectionHom 1 = 1 := LocalSplitChart.section_one T C
example (R : Type*) [CommRing R] : IsAzumaya R (Matrix (Fin 2) (Fin 2) R) :=
  IsAzumaya.matrix R (Fin 2)
#print axioms TopologicalExtension.kernel_iff
#print axioms TopologicalExtension.inl_project
#print axioms TopologicalExtension.continuous_projection
#print axioms TopologicalExtension
#print axioms LocalSplitChart
#print axioms LocalSplitChart.section_one
#print axioms LocalSplitChart.section_mul
#print axioms LocalSplitChart.chart_value
end TauCeti.SchemeFoundations.GaloisGerbs

/- N29 typed omission ledger: these are MATHEMATICAL COMMENTS, not Lean signatures.
The definitive reader and TypedOmissions.json specify all omitted carriers, APIs and tests.
Node SchemeAndStackFoundations:SF.2/sheaf-algebra: For a native scheme X, an associative unital O_X-algebra is a sheaf of rings A with a central structure map O_X→A. Require its underlying O_X-module to be quasi-coherent. Morphisms are unital sheaf-ring maps preserving the central structure map. The carrier is not a sheaf of commutative algebras: matrix algebras must be allowed.
TauCeti.SchemeFoundations.Brauer.SheafAlgebra.sections: On every affine U, A(U) is an algebra over O_X(U), possibly noncommutative.
TauCeti.SchemeFoundations.Brauer.SheafAlgebra.hom_ext: Algebra-sheaf maps agreeing on all affine opens are equal.
TauCeti.SchemeFoundations.Brauer.SheafAlgebra.pullback: For f:Y→X, f* A is a quasi-coherent O_Y-algebra with the canonical central unit.
TauCeti.SchemeFoundations.Brauer.SheafAlgebra.test_matrix2: Mat_2(O_X) is such an algebra; for X=Spec(k), its affine sections are Mat_2(k).
TauCeti.SchemeFoundations.Brauer.SheafAlgebra.test_scalar: O_X itself is the rank-one algebra object.
TauCeti.SchemeFoundations.Brauer.SheafAlgebra.test_noncommutative: For X=Spec(Q), Mat_2(Q) is admitted although E_12E_21≠E_21E_12.
Node SchemeAndStackFoundations:SF.2/azumaya: A quasi-coherent O_X-algebra A is Azumaya when there is a surjective étale covering U_i→X and O_{U_i}-algebra isomorphisms f_i* A≅Mat_{d_i}(O_{U_i}), with d_i≥1. This implies finite locally free and faithful underlying module. Degree is locally constant; no single global degree is required.
TauCeti.SchemeFoundations.Brauer.Azumaya.local_matrix: A is Azumaya exactly when it has a positive-degree étale-local matrix splitting.
TauCeti.SchemeFoundations.Brauer.Azumaya.degree: On a connected base the degree d is constant and the module rank is d².
TauCeti.SchemeFoundations.Brauer.Azumaya.pullback: Any scheme pullback preserves Azumaya algebras.
TauCeti.SchemeFoundations.Brauer.Azumaya.test_matrix: Mat_n(O_X) is Azumaya for every n≥1.
TauCeti.SchemeFoundations.Brauer.Azumaya.test_scalar: O_X is degree-one Azumaya.
TauCeti.SchemeFoundations.Brauer.Azumaya.test_dual_numbers: Over a field k, k[ε]/(ε²), though finite free, is not an Azumaya k-algebra.
Node SchemeAndStackFoundations:SF.2/stabilized-equivalence: On X, A≈B means there exist finite locally free O_X-modules F,G of positive rank at every point and an O_X-algebra isomorphism A⊗End(F)≅B⊗End(G). Use this stabilization relation on Azumaya algebras; it is not merely isomorphism of underlying modules.
TauCeti.SchemeFoundations.Brauer.StabilizedEquivalence.refl: Every Azumaya algebra is equivalent to itself using F=G=O_X.
TauCeti.SchemeFoundations.Brauer.StabilizedEquivalence.symm: A≈B implies B≈A.
TauCeti.SchemeFoundations.Brauer.StabilizedEquivalence.trans: A≈B and B≈C imply A≈C.
TauCeti.SchemeFoundations.Brauer.StabilizedEquivalence.test_matrix: Mat_n(O_X)≈O_X for every n≥1.
TauCeti.SchemeFoundations.Brauer.StabilizedEquivalence.test_field: Over Spec(k), this is the usual stabilization relation for finite-dimensional central simple k-algebras.
TauCeti.SchemeFoundations.Brauer.StabilizedEquivalence.test_zero_rank: Zero-rank F or G is excluded: allowing both would collapse every pair via a zero algebra.
Node SchemeAndStackFoundations:key/scheme-brauer: Br_Az(X) is the quotient of Azumaya O_X-algebras by stabilized equivalence. Multiplication is tensor product, identity is O_X and inverse is the opposite algebra. Give it the resulting commutative-group structure. Keep this group distinct from all of H²_et(X,G_m), and from its torsion subgroup Br′(X).
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.mk: The class [A] of an Azumaya O_X-algebra.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.mul_mk: [A][B]=[A⊗B].
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.inv_mk: [A]⁻¹=[A^op].
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.end_zero: End(F) has identity class for positive-rank finite locally free F.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.pullback: Scheme maps act contravariantly on Br_Az by pullback.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.delta: The canonical étale cohomology class is a natural injective homomorphism into H²_et(X,G_m), without unconditional surjectivity.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.test_matrix: [Mat_2(O_X)] is the identity.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.test_real: Br_Az(Spec(R)) has the real quaternion class of order two; its pullback to Spec(C) is the identity.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.test_field: Br_Az(Spec(k)) identifies with the existing field Brauer group through the central-simple-algebra dictionary.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.test_dual_numbers: A non-Azumaya finite free algebra such as k[ε]/(ε²) has no Azumaya-class constructor.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.test_not_h2: The construction is not defined to be all of H²_et(X,G_m), nor is Br_Az=Br′ asserted for arbitrary X.
Node SchemeAndStackFoundations:SF.2/cohomological-brauer: Br′(X) is the subgroup of H² on the native small étale site with coefficients in the units sheaf G_m consisting of elements killed by some positive integer. Do not redefine the cohomology carrier. The Azumaya-to-cohomology map lands here under the stated quasi-compact or connected hypotheses.
TauCeti.SchemeFoundations.Brauer.CohomologicalBrauer.inclusion: The inclusion Br′(X)→H²_et(X,G_m) is injective.
TauCeti.SchemeFoundations.Brauer.CohomologicalBrauer.mem_iff: A class belongs exactly when some positive integer kills it.
TauCeti.SchemeFoundations.Brauer.CohomologicalBrauer.pullback: Pullback on cohomology preserves torsion classes.
TauCeti.SchemeFoundations.Brauer.CohomologicalBrauer.test_complex: Br′(Spec(C))=0.
TauCeti.SchemeFoundations.Brauer.CohomologicalBrauer.test_real: Br′(Spec(R))≅Z/2 and the quaternion class maps to its nonzero element.
TauCeti.SchemeFoundations.Brauer.CohomologicalBrauer.test_nontorsion: A nontorsion H² class, if present on X, is excluded by the subgroup membership condition.
Node SchemeAndStackFoundations:SF.2/affine-comparison: For A a quasi-coherent algebra on Spec(R), the étale-local matrix condition is equivalent to the native IsAzumaya R Γ(A,Spec(R)) predicate.
Node SchemeAndStackFoundations:SF.2/tensor: Azumaya A,B on X have Azumaya tensor product; on a common étale splitting cover, Mat_d⊗Mat_e≅Mat_de.
Node SchemeAndStackFoundations:SF.2/opposite: The opposite A^op of an Azumaya algebra is Azumaya, with matrix transposition identifying its local splitting.
Node SchemeAndStackFoundations:SF.2/equivalence-refl: A≈A with F=G=O_X of positive rank one.
Node SchemeAndStackFoundations:SF.2/equivalence-symm: If A≈B then B≈A.
Node SchemeAndStackFoundations:SF.2/equivalence-trans: If A≈B and B≈C then A≈C, using tensor products of the witnessing positive-rank bundles.
Node SchemeAndStackFoundations:SF.2/operation-well-defined: If A≈A′ and B≈B′ then A⊗B≈A′⊗B′.
Node SchemeAndStackFoundations:SF.2/unit: The tensor class of O_X is an identity, since A⊗O_X≅A as O_X-algebras.
Node SchemeAndStackFoundations:SF.2/inverse: For Azumaya A, A⊗A^op≅End_O_X(A), with A positive-rank finite locally free; hence its stabilization class is the identity.
Node SchemeAndStackFoundations:SF.2/pullback-id: For X, pullback along id_X is the identity homomorphism of Br_Az(X).
Node SchemeAndStackFoundations:SF.2/pullback-comp: For Z→Y→X, pullback on Br_Az is the composite of the two pullback homomorphisms.
Node SchemeAndStackFoundations:SF.2/end-zero: For finite locally free F of positive rank at every point, [End(F)] is the identity in Br_Az(X).
Node SchemeAndStackFoundations:SF.2/field-comparison: For a field k, Br_Az(Spec(k)) is canonically isomorphic to the existing BrauerGroup k using finite-dimensional central simple algebras.
Node SchemeAndStackFoundations:SF.2/delta-injective: The homomorphism δ:Br_Az(X)→H²_et(X,G_m) is injective; this does not say its image is the whole cohomology group or all torsion classes.
Node SchemeAndStackFoundations:SF.2/degree-annihilation: If A has constant module rank d² with d≥1, then [A]^d is the identity in Br_Az(X).
Node SchemeAndStackFoundations:SF.2/torsion-image: If X is quasi-compact or connected, every Azumaya class is torsion and δ factors through Br′(X).
Node SchemeAndStackFoundations:SF.2/pullback: For a scheme morphism f:Y→X, define f*:Br_Az(X)→Br_Az(Y) by pulling back Azumaya algebra sheaves and their stabilization witnesses. This is a group homomorphism and requires no flatness of f.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.pullback_mk: f*([A])=[f*A].
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.pullback_one: f*(1)=1.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.pullback_mul: f*([A][B])=f*([A])f*([B]).
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.pullback_test_id: Identity pullback fixes every class.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.pullback_test_matrix: Every pulled-back matrix algebra has identity class.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.pullback_test_quaternion: R→C kills the Hamilton quaternion class.
Node SchemeAndStackFoundations:SF.2/splitting-torsor: For an Azumaya A of constant degree d, the sheaf Isom_O-alg(Mat_d(O_X),A) is an étale PGL_d-torsor. It is the splitting-torsor construction, not the already-owned general definition of a torsor.
TauCeti.SchemeFoundations.Brauer.SplittingTorsor.points: Its sections over an étale U are algebra isomorphisms Mat_d(O_U)≅A|_U.
TauCeti.SchemeFoundations.Brauer.SplittingTorsor.action: PGL_d acts by precomposition and makes it a torsor.
TauCeti.SchemeFoundations.Brauer.SplittingTorsor.naturality: Pullback of the frame torsor identifies with the frame torsor of f*A.
TauCeti.SchemeFoundations.Brauer.SplittingTorsor.test_matrix: For A=Mat_d(O_X), the identity frame is a global section.
TauCeti.SchemeFoundations.Brauer.SplittingTorsor.test_degree1: Degree one gives the trivial PGL_1-torsor.
TauCeti.SchemeFoundations.Brauer.SplittingTorsor.test_quaternion: Hamilton quaternions over R have no R-frame but have a frame after R→C.
Node SchemeAndStackFoundations:SF.2/delta: Construct δ_X:Br_Az(X)→H²_et(X,G_m) from the obstruction to lifting projective frames to linear frames. On constant degree d it is the boundary of 1→G_m→GL_d→PGL_d→1 applied to the splitting torsor. For variable degree glue the same scalar-banded splitting gerbe.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.delta_mk: δ([A]) is the scalar splitting-gerbe class of A.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.delta_mul: δ is a homomorphism.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.delta_pullback: δ_Y(f*α)=f*(δ_X(α)).
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.delta_test_matrix: δ([Mat_d(O_X)])=0.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.delta_test_real: The real quaternion class maps to the nonzero order-two class.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.delta_test_no_surjectivity: No axiom declaring δ surjective is included; arbitrary X need not have Br_Az=Br′.
Node SchemeAndStackFoundations:SF.2/affine-dualizing: For a Noetherian commutative ring A, a dualizing complex ω in D(A) has finite injective dimension, finite A-module cohomology in every degree, and the canonical homothety A→RHom_A(ω,ω) is a quasi-isomorphism. Finite injective dimension includes boundedness; this is not the predicate that ω is a single module.
TauCeti.SchemeFoundations.Coherent.DualizingComplex.homothety: The canonical homothety is an isomorphism in D(A).
TauCeti.SchemeFoundations.Coherent.DualizingComplex.cohomology_finite: Every H^i(ω) is finite over A.
TauCeti.SchemeFoundations.Coherent.DualizingComplex.biduality: For K in D^b_fg(A), the evaluation K→RHom(RHom(K,ω),ω) is an isomorphism.
TauCeti.SchemeFoundations.Coherent.DualizingComplex.test_field: For a field k, k[0] is dualizing.
TauCeti.SchemeFoundations.Coherent.DualizingComplex.test_regular_shift: For a d-dimensional regular local ring, A[d] is the normalized dualizing complex.
TauCeti.SchemeFoundations.Coherent.DualizingComplex.test_non_cm: For A=k[x,y]/(x²,xy) localized at (x,y), the normalized dualizing complex has nonzero H^-1 and H^0, so a single shifted module is insufficient.
Node SchemeAndStackFoundations:SF.2/scheme-dualizing: For a locally Noetherian X, a dualizing complex K in D(O_X) is affine-locally the sheafification of a ring dualizing complex: for every affine U=Spec(A), K|_U≅~ω_A with ω_A dualizing. A cover criterion is equivalent, but is proved separately.
TauCeti.SchemeFoundations.Coherent.SchemeDualizing.affine: Restriction to every affine open comes from a ring dualizing complex.
TauCeti.SchemeFoundations.Coherent.SchemeDualizing.cover_iff: Checking this on an affine open cover suffices.
TauCeti.SchemeFoundations.Coherent.SchemeDualizing.restrict: Restriction to an open subscheme preserves the dualizing property.
TauCeti.SchemeFoundations.Coherent.SchemeDualizing.test_field: On Spec(k), ~k[0] is dualizing.
TauCeti.SchemeFoundations.Coherent.SchemeDualizing.test_disjoint: Dualizing complexes on a disjoint union are chosen componentwise; unequal shifts are allowed.
TauCeti.SchemeFoundations.Coherent.SchemeDualizing.test_projective_line: On P¹_k, O(-2)[1] is dualizing.
Node SchemeAndStackFoundations:SF.2/normalized-dualizing: For a Noetherian local ring (A,m,κ), a dualizing ω is normalized when RHom_A(κ,ω)≅κ[0]; equivalently Ext^i_A(κ,ω) vanishes for i≠0 and Ext^0 is one-dimensional over κ. Shifts are cohomological: H^i(K[r])=H^{i+r}(K).
TauCeti.SchemeFoundations.Coherent.NormalizedDualizing.residue: RHom_A(κ,ω)≅κ[0].
TauCeti.SchemeFoundations.Coherent.NormalizedDualizing.finite_local: For finite local A→B, RHom_A(B,ω_A) is normalized over B.
TauCeti.SchemeFoundations.Coherent.NormalizedDualizing.shift_unique: Among shifts of one local dualizing complex, exactly one is normalized.
TauCeti.SchemeFoundations.Coherent.NormalizedDualizing.test_field: κ[0] is normalized over κ.
TauCeti.SchemeFoundations.Coherent.NormalizedDualizing.test_dvr: A[1] is normalized for a regular DVR A.
TauCeti.SchemeFoundations.Coherent.NormalizedDualizing.test_wrong_shift: For a regular DVR, A[0] is dualizing but not normalized.
Node SchemeAndStackFoundations:key/coherent-duality: For separated finite-type morphisms f:X→Y of Noetherian schemes over a fixed Noetherian base S, construct f!:D^+_qc(O_Y)→D^+_qc(O_X), coherently contravariant under composition. On proper f it is the restriction of the right adjoint of Rf*:D_qc(O_X)→D_qc(O_Y). This is coherent O-module duality, not étale-coefficient Verdier duality.
TauCeti.SchemeFoundations.Coherent.CoherentDuality.comp: (g∘f)!≅f!g! with unit and associativity coherence.
TauCeti.SchemeFoundations.Coherent.CoherentDuality.proper_adjunction: For proper f, Hom(Rf*K,M)≅Hom(K,f!M) in the stated derived categories.
TauCeti.SchemeFoundations.Coherent.CoherentDuality.finite: For finite f, f*f!M≅RHom_Y(f*O_X,M).
TauCeti.SchemeFoundations.Coherent.CoherentDuality.regular_immersion: For a Koszul-regular immersion of codimension c, f!M≅Lf*M⊗det(N_f)[-c].
TauCeti.SchemeFoundations.Coherent.CoherentDuality.smooth_proper: For smooth proper f of relative dimension d, f!M≅Lf*M⊗Ω^d_{X/Y}[d].
TauCeti.SchemeFoundations.Coherent.CoherentDuality.test_projective_line: For f:P¹_k→Spec(k), f!k≅O(-2)[1].
TauCeti.SchemeFoundations.Coherent.CoherentDuality.test_closed_prime: For Spec(F_p)→Spec(Z), f!Z≅F_p[-1], with H^1=F_p.
TauCeti.SchemeFoundations.Coherent.CoherentDuality.test_underived_hom: Hom_Z(F_p,Z)=0 does not compute the preceding derived shriek complex.
TauCeti.SchemeFoundations.Coherent.CoherentDuality.test_finite_flat: For finite flat A→B, f!A=Hom_A(B,A) in degree zero.
TauCeti.SchemeFoundations.Coherent.CoherentDuality.test_dual_numbers_trace: For char(k)=0 and B=k[ε]/ε², the algebra trace pairing is degenerate; the finite-duality module is not made isomorphic to B by that pairing.
Node SchemeAndStackFoundations:SF.2/affine-cover: The every-affine definition of a dualizing complex is equivalent to checking one affine open cover.
Node SchemeAndStackFoundations:SF.2/biduality: If X is Noetherian with dualizing ω, RHom_X(-,ω) is an involution of D_Coh(X), interchanges D^+_Coh and D^-_Coh, and preserves D^b_Coh.
Node SchemeAndStackFoundations:SF.2/composition: For composable morphisms in FTS_S, (g∘f)!≅f!g!, with the pseudofunctor associativity and unit constraints.
Node SchemeAndStackFoundations:SF.2/proper-adjunction: For proper f in FTS_S, f! on D^+_qc is the restricted right adjoint of Rf* on D_qc.
Node SchemeAndStackFoundations:SF.2/trace-comp: For proper X→Y→Z, the counit for the composite agrees with Rg* applied to the f-counit followed by the g-counit, under canonical composition identifications.
Node SchemeAndStackFoundations:SF.2/finite-formula: For finite f:X→Y in FTS_S, f*f!M≅RHom_O_Y(f*O_X,M), for M in D^+_qc(Y).
Node SchemeAndStackFoundations:SF.2/closed-formula: For a closed immersion f:X→Y in FTS_S, f!M is RHom_O_Y(O_X,M) with its O_X-module structure.
Node SchemeAndStackFoundations:SF.2/cartier-formula: For an effective Cartier divisor f:X→Y, f!M≅Lf*M⊗f*O_Y(X)[-1].
Node SchemeAndStackFoundations:SF.2/regular-immersion: For a Koszul-regular immersion f of codimension c in FTS_S, f!M≅Lf*M⊗∧^c N_f[-c].
Node SchemeAndStackFoundations:SF.2/smooth-proper: For smooth proper f of constant relative dimension d in FTS_S, f!M≅Lf*M⊗Ω^d_{X/Y}[d].
Node SchemeAndStackFoundations:SF.2/preserves-dualizing: If f is in FTS_S and ω_Y is dualizing, then f!ω_Y is dualizing on X.
Node SchemeAndStackFoundations:SF.2/serre-proper: For proper X/k, put ω_X=f!k. For K in D_qc(X), Ext^i_X(K,ω_X)≅Hom_k(H^-i(X,K),k), naturally and compatibly with shifts and distinguished triangles.
Node SchemeAndStackFoundations:SF.2/canonical-module: For proper X/k of dimension d and ω_X=f!k, H^-d(ω_X) is coherent, satisfies S2, and its support is the union of the dimension-d irreducible components.
Node SchemeAndStackFoundations:SF.2/trace: For proper f in FTS_S and M in D^+_qc(Y), the coherent trace is the counit Rf*f!M→M of the proper adjunction. It is not the ordinary algebra trace, nor an asserted isomorphism for every lci fundamental class.
TauCeti.SchemeFoundations.Coherent.CoherentTrace.natural: Trace commutes with morphisms M→N.
TauCeti.SchemeFoundations.Coherent.CoherentTrace.comp: Proper composite traces agree through the shriek/pushforward composition isomorphisms.
TauCeti.SchemeFoundations.Coherent.CoherentTrace.finite: For finite affine A→B, the counit is derived evaluation at 1∈B.
TauCeti.SchemeFoundations.Coherent.CoherentTrace.test_identity: The identity-map trace is the identity.
TauCeti.SchemeFoundations.Coherent.CoherentTrace.test_finite_flat: For finite flat A→B, Hom_A(B,A)→A sends λ to λ(1).
TauCeti.SchemeFoundations.Coherent.CoherentTrace.test_dual_numbers: For B=k[ε]/ε² in characteristic zero, duality uses evaluation on Hom_k(B,k); it is not an invertible ordinary algebra-trace pairing.
Node SchemeAndStackFoundations:SF.2/linearized-sheaf: For a ringed space X with a left action of a discrete group Γ by ringed-space automorphisms, a Γ-equivariant O_X-module F is an O_X-module together with a lift Γ→Aut(X,F) over the given action. Equivalently give pullback-linearization isomorphisms satisfying the unit and composition cocycle, including the canonical pullback coherences. Γ may move X; ordinary Action(X.Modules,Γ) supplies only the fixed-base special case.
TauCeti.SchemeFoundations.Equivariant.EquivariantSheaf.forget: Forget to the underlying O_X-module.
TauCeti.SchemeFoundations.Equivariant.EquivariantSheaf.transport: A group element transports sections across its induced open-set automorphism, semilinearly over the transported scalar sections.
TauCeti.SchemeFoundations.Equivariant.EquivariantSheaf.hom_ext: Equivariant maps equal on underlying module-sheaf maps are equal.
TauCeti.SchemeFoundations.Equivariant.EquivariantSheaf.test_trivial_group: For Γ=1, the category is the ordinary O_X-module sheaf category.
TauCeti.SchemeFoundations.Equivariant.EquivariantSheaf.test_point: On a one-point ringed space with ring R and trivial ring action, objects are R-linear representations of Γ.
TauCeti.SchemeFoundations.Equivariant.EquivariantSheaf.test_moving_base: Z acting on R by translations transports an open interval to a different interval; a fixed-base automorphism of one sheaf alone does not specify this action.
Node SchemeAndStackFoundations:SF.2/enough-injectives: The category of semilinear Γ-equivariant O_X-modules is abelian and has enough injectives for an arbitrary discrete Γ. The forgetful and coinduction adjunctions must be constructed, including sheafification and products; a finite-group hypothesis is not imposed.
Node SchemeAndStackFoundations:SF.2/invariant-sections: The left-exact functor Γ(X,-)^Γ from semilinear equivariant O_X-modules to abelian groups takes the invariant subgroup of ordinary global sections under their induced Γ-action. For moving bases the total open X is still invariant.
TauCeti.SchemeFoundations.Equivariant.InvariantSections.inclusion: Include invariant sections into ordinary global sections.
TauCeti.SchemeFoundations.Equivariant.InvariantSections.mem_iff: A section is invariant exactly when every γ fixes it under semilinear global transport.
TauCeti.SchemeFoundations.Equivariant.InvariantSections.map: An equivariant sheaf map induces a map of invariant sections.
TauCeti.SchemeFoundations.Equivariant.InvariantSections.test_trivial: For Γ=1, these are all global sections.
TauCeti.SchemeFoundations.Equivariant.InvariantSections.test_sign: For C2 acting on Z by sign on a point, the invariant group is zero.
TauCeti.SchemeFoundations.Equivariant.InvariantSections.test_trivial_action: For C2 acting trivially on Z on a point, the invariant group is Z.
Node SchemeAndStackFoundations:key/equivariant-sheaf-cohomology: For a discrete group Γ acting on a ringed space X and semilinear equivariant sheaf F, H^n(X,Γ;F) is the n-th right derived functor of F↦Γ(X,F)^Γ in the equivariant abelian sheaf category. Derive the composite; do not define it as H^n(X,F)^Γ.
TauCeti.SchemeFoundations.Equivariant.EquivariantCohomology.h0: H^0(X,Γ;F)≅Γ(X,F)^Γ.
TauCeti.SchemeFoundations.Equivariant.EquivariantCohomology.trivial_group: For Γ=1, H^n agrees with ordinary O_X-module sheaf cohomology.
TauCeti.SchemeFoundations.Equivariant.EquivariantCohomology.point: On a point, it is group cohomology of the module of sections.
TauCeti.SchemeFoundations.Equivariant.EquivariantCohomology.map: Equivariant sheaf maps induce cohomology maps.
TauCeti.SchemeFoundations.Equivariant.EquivariantCohomology.spectral: H^p(Γ,H^q(X,F)) converges to H^{p+q}(X,Γ;F) once the named composite-functor acyclicity is proved.
TauCeti.SchemeFoundations.Equivariant.EquivariantCohomology.test_c2: For X a point and C2 acting trivially on Z, H^1=0 and H^2≅Z/2.
TauCeti.SchemeFoundations.Equivariant.EquivariantCohomology.test_trivial: For Γ=1 it recovers ordinary sheaf cohomology.
TauCeti.SchemeFoundations.Equivariant.EquivariantCohomology.test_wrong_invariants: On a point ordinary H^2(point,Z)^C2=0, while equivariant H^2(point,C2;Z)≅Z/2.
TauCeti.SchemeFoundations.Equivariant.EquivariantCohomology.test_inverted_order: For finite Γ and Q-vector-space coefficients, invariants are exact and H^n(X,Γ;F)≅H^n(X,F)^Γ.
TauCeti.SchemeFoundations.Equivariant.EquivariantCohomology.test_translation: For constant Z on R with Z acting by translations, equivariant H^1≅Z whereas ordinary H^1(R,Z)=0.
Node SchemeAndStackFoundations:SF.2/ext: For semilinear Γ-equivariant O_X-modules F,G, Ext^n_{Γ,O_X}(F,G) derives G↦Hom_{Γ,O_X}(F,G) in the second variable of the equivariant abelian category.
TauCeti.SchemeFoundations.Equivariant.EquivariantExt.h0: Ext^0 is equivariant Hom.
TauCeti.SchemeFoundations.Equivariant.EquivariantExt.map_first: Ext is contravariant in F.
TauCeti.SchemeFoundations.Equivariant.EquivariantExt.map_second: Ext is covariant in G.
TauCeti.SchemeFoundations.Equivariant.EquivariantExt.test_trivial: Γ=1 gives ordinary O_X-module Ext.
TauCeti.SchemeFoundations.Equivariant.EquivariantExt.test_point: On a point with ring Z it is Ext in the Z[Γ]-module category.
TauCeti.SchemeFoundations.Equivariant.EquivariantExt.test_c2: For C2 acting trivially on Z, Ext^2_{C2,Z}(Z,Z)≅Z/2.
Node SchemeAndStackFoundations:SF.2/support: For a Γ-stable closed subset D⊂X, H^n_D(X,Γ;F) derives the invariant sections supported in D. The support functor is the kernel of global restriction Γ(X,F)→Γ(X minus D,F); derive that left-exact functor, rather than taking invariants of ordinary supported cohomology.
TauCeti.SchemeFoundations.Equivariant.EquivariantSupport.h0: H^0_D is the invariant subgroup of sections vanishing on the complement of D.
TauCeti.SchemeFoundations.Equivariant.EquivariantSupport.closed_all: For D=X, supported cohomology equals equivariant global cohomology.
TauCeti.SchemeFoundations.Equivariant.EquivariantSupport.closed_empty: For D=∅, it is zero in every degree.
TauCeti.SchemeFoundations.Equivariant.EquivariantSupport.test_all_point: For X=D a point and C2 acting trivially on Z, H^2_D≅Z/2.
TauCeti.SchemeFoundations.Equivariant.EquivariantSupport.test_empty: Empty support has zero cohomology.
TauCeti.SchemeFoundations.Equivariant.EquivariantSupport.test_unstable: For Z translating R, the singleton {0} is not stable and is not accepted as equivariant support.
Node SchemeAndStackFoundations:SF.2/hom-invariants: Hom_{Γ,O_X}(F,G) is the invariant subgroup of Hom_{O_X}(F,G) under conjugation of linearizations.
Node SchemeAndStackFoundations:SF.2/degree-zero: H^0(X,Γ;F)≅Γ(X,F)^Γ naturally.
Node SchemeAndStackFoundations:SF.2/ordinary-comparison: For Γ=1, H^n(X,1;F) is naturally isomorphic to ordinary sheaf cohomology.
Node SchemeAndStackFoundations:SF.2/point-comparison: For a one-point space, equivariant cohomology agrees with group cohomology of its section module.
Node SchemeAndStackFoundations:SF.2/invariants-acyclic: For an injective equivariant O_X-module sheaf I, its global-section Γ-module is acyclic for invariants. Obtain this by a retract of the sections of a coinduced sheaf; no exactness of the free O_X-module left adjoint to abelian-group sections is assumed.
Node SchemeAndStackFoundations:SF.2/spectral-sequence: For arbitrary discrete Γ, there is a natural first-quadrant spectral sequence H^p(Γ,H^q(X,F))⇒H^{p+q}(X,Γ;F).
Node SchemeAndStackFoundations:SF.2/localization: For a Γ-stable closed D and invariant complement U, the natural supported, global and restricted equivariant cohomology maps give a long exact sequence, with boundary H^n(U,Γ;F|_U)→H^{n+1}_D(X,Γ;F).
Node SchemeAndStackFoundations:key/galois-gerbs: Fix a characteristic-zero field k, a Galois extension k′/k inside an algebraic closure, and Γ=Gal(k′/k) with its Krull topology. A gerb consists of a linear algebraic group H/k′ and a topological extension 1→H(k′)→E→Γ→1 with discrete kernel. Every lift of σ acts on the kernel through an algebraic σ-semilinear automorphism of H. Over Gal(k′/K) for some finite K/k inside k′, there is a local splitting chart whose algebraic conjugation action is effective descent to K. None of these conditions forces a global splitting.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerb.kernel: The kernel is H/k′ with its discrete point group.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerb.local_chart: A finite K/k and a continuous splitting over Gal(k′/K) with effective algebraic K-descent and a topological chart are part of the data.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerb.conjugation: Conjugation by a lift of σ agrees on points with an algebraic σ-semilinear automorphism.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerb.neutral: A k-defined H has the neutral semidirect-product gerb.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerb.base_extension: Enlarging k′ uses Galois pullback and algebraic-kernel point pushout.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerb.test_neutral: For H/k the neutral gerb is H(k′)⋊Gal(k′/k) with its original algebraic descent.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerb.test_c4: The C4 extension of Gal(C/R)=C2 by μ2(C) satisfies local splitting over C but has no global splitting.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerb.test_alg_closed: For k′=k algebraically closed the Galois quotient is trivial.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerb.test_topology: The discrete H(k′) topology is not replaced by the analytic point topology, even for C-points.
Node SchemeAndStackFoundations:SF.1/morphism: A morphism E→E′ of k′/k-gerbs is a continuous group homomorphism over id_Γ together with an algebraic k′-group homomorphism H→H′ whose point map agrees with the extension map on the kernel. Continuity alone on the discrete point kernels is not algebraicity.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerbMorphism.identity: Identity extension and algebraic maps define the identity morphism.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerbMorphism.comp: Compose both maps; the two compatibility squares and continuity are preserved.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerbMorphism.kernel_points: The restriction to H(k′) is the point map of the recorded algebraic homomorphism.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerbMorphism.test_power: Over algebraically closed k, G_m kernel endomorphisms z↦z^n for n∈Z are algebraic morphisms.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerbMorphism.test_identity: The identity morphism has identity kernel and quotient maps.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerbMorphism.test_conjugation: For the neutral G_m gerb over C/R, complex conjugation on the discrete C× kernel is continuous but is not a C-algebraic kernel map.
Node SchemeAndStackFoundations:SF.1/conjugacy: For morphisms f1,f2:E→E′, kernel conjugacy means there is h∈H′(k′) with Int(i′(h))∘f1=f2. Retain the conjugators as data/sets when needed; do not identify conjugate morphisms before the application asks for a quotient.
TauCeti.SchemeFoundations.GaloisGerbs.GerbConjugacy.refl: The identity kernel point conjugates a morphism to itself.
TauCeti.SchemeFoundations.GaloisGerbs.GerbConjugacy.symm: An inverse kernel point reverses a conjugacy.
TauCeti.SchemeFoundations.GaloisGerbs.GerbConjugacy.trans: The product of two conjugators yields the composite conjugacy.
TauCeti.SchemeFoundations.GaloisGerbs.GerbConjugacy.test_identity: Every morphism is conjugate to itself by 1.
TauCeti.SchemeFoundations.GaloisGerbs.GerbConjugacy.test_trivial_kernel: With trivial target kernel, conjugacy is equality of morphisms.
TauCeti.SchemeFoundations.GaloisGerbs.GerbConjugacy.test_not_any_lift: A target element projecting nontrivially to Γ is not admitted as a kernel conjugator.
Node SchemeAndStackFoundations:SF.1/neutral: For a linear algebraic group H defined over k, construct the k′/k-gerb H(k′)⋊Gal(k′/k), using the algebraic Galois action and the discrete point-kernel/product topology. The local splitting is global in this special example, but not required for general gerbs.
TauCeti.SchemeFoundations.GaloisGerbs.NeutralGerb.inclusion: h↦(h,1) is the kernel inclusion.
TauCeti.SchemeFoundations.GaloisGerbs.NeutralGerb.projection: (h,σ)↦σ is the quotient.
TauCeti.SchemeFoundations.GaloisGerbs.NeutralGerb.section: σ↦(1,σ) is the continuous global section.
TauCeti.SchemeFoundations.GaloisGerbs.NeutralGerb.test_trivial: For H=1, the extension is Γ itself.
TauCeti.SchemeFoundations.GaloisGerbs.NeutralGerb.test_gm: For H=G_m over R and k′=C, the action is complex conjugation on C×.
TauCeti.SchemeFoundations.GaloisGerbs.NeutralGerb.test_point_stabilizers: Every algebraic kernel point is fixed by an open Galois subgroup, which makes the action on the discrete kernel continuous.
Node SchemeAndStackFoundations:SF.1/conjugator-scheme: For f1,f2:E→E′, construct the k-scheme Isom(f1,f2) whose R-points are h∈H′(k′⊗_k R) satisfying Int(h)f1_R=f2_R after the specified kernel-point pushouts. For f1=f2 it is the descended automorphism k-group I_f. Scheme representability and descent are proof obligations, not an arbitrary point-set quotient.
TauCeti.SchemeFoundations.GaloisGerbs.ConjugatorScheme.points: R-points are exactly the algebraic-kernel conjugators satisfying the full extension equation.
TauCeti.SchemeFoundations.GaloisGerbs.ConjugatorScheme.automorphisms: Isom(f,f) is the descended automorphism group I_f.
TauCeti.SchemeFoundations.GaloisGerbs.ConjugatorScheme.neutral_basechange: For a neutral target, base change I_f to k′ is the centralizer of the algebraic kernel image.
TauCeti.SchemeFoundations.GaloisGerbs.ConjugatorScheme.test_trivial: If the target kernel is trivial and f1=f2, the conjugator scheme is the trivial group.
TauCeti.SchemeFoundations.GaloisGerbs.ConjugatorScheme.test_gm: For the identity map of the neutral G_m gerb, I_f=G_m over k.
TauCeti.SchemeFoundations.GaloisGerbs.ConjugatorScheme.test_kernel: A conjugator is a kernel-algebra point; arbitrary target-extension elements are not its R-points.
Node SchemeAndStackFoundations:SF.1/pro-gerb: A pro-gerb is a compatible projective system of finite-stage k′/k-gerbs with continuous extension transitions and algebraic kernel transitions. Pro-morphisms are compatible finite-stage maps. Stagewise conjugacy means each stage admits a conjugator; it does not assert compatible conjugators or one element in an inverse-limit kernel without an extra existence theorem.
TauCeti.SchemeFoundations.GaloisGerbs.ProGerb.stage: Every finite stage is a gerb with the same Galois quotient and its own algebraic kernel.
TauCeti.SchemeFoundations.GaloisGerbs.ProGerb.transition: Transition maps are gerb morphisms satisfying the projective-system coherence.
TauCeti.SchemeFoundations.GaloisGerbs.ProGerb.stagewise_conjugate: Conjugacy of pro-morphisms is the source’s stagewise relation, with no unproved global-conjugator upgrade.
TauCeti.SchemeFoundations.GaloisGerbs.ProGerb.test_constant: A constant system recovers the original gerb and its morphisms.
TauCeti.SchemeFoundations.GaloisGerbs.ProGerb.test_kottwitz: The Kottwitz protorus has rational character group Q through finite stages (1/n)Z; this is a required HKW22 consumer test, not a freshly read theorem here.
TauCeti.SchemeFoundations.GaloisGerbs.ProGerb.test_wrong_global_conjugacy: Stagewise nonempty conjugator sets alone do not supply a compatible inverse-limit conjugator.
Node SchemeAndStackFoundations:SF.1/centralizer: For f:E′→G_G into the neutral gerb of G/k, the base change of I_f to k′ is the algebraic centralizer of f_alg(H′) in G_{k′}. The descended k-form is defined by conjugation through lifts of Γ.
Node SchemeAndStackFoundations:SF.1/cocycle: Fix f:E′→G_G with neutral target. Morphisms f′ with the same algebraic kernel map correspond to continuous 1-cocycles of Gal(k′/k) in I_f(k′), and are conjugate to f exactly when the associated H¹ class is trivial.
Node SchemeAndStackFoundations:SF.1/splitting-field-extension: For k′⊂k″ over k, transport a k′/k-gerb by pullback along Gal(k″/k)→Gal(k′/k) and pushout H(k′)→H(k″), preserving the algebraic kernel maps, semilinear conjugation and local effective-descent chart. This changes both quotient and kernel, not just one.
TauCeti.SchemeFoundations.GaloisGerbs.GerbFieldExtension.kernel: The transported algebraic kernel is H_{k″}.
TauCeti.SchemeFoundations.GaloisGerbs.GerbFieldExtension.projection: The quotient is Gal(k″/k).
TauCeti.SchemeFoundations.GaloisGerbs.GerbFieldExtension.neutral: Neutral gerbs transport to the neutral gerb of the same k-defined algebraic group.
TauCeti.SchemeFoundations.GaloisGerbs.GerbFieldExtension.test_identity: For k″=k′ it recovers the original gerb up to its canonical isomorphism.
TauCeti.SchemeFoundations.GaloisGerbs.GerbFieldExtension.test_neutral: A globally split neutral gerb remains neutral.
TauCeti.SchemeFoundations.GaloisGerbs.GerbFieldExtension.test_kernel_changes: For G_m and R⊂C, a transport that leaves kernel points equal to R× does not produce the C× kernel of the transported gerb.
Untyped concrete tests for SchemeAndStackFoundations:SF.1/topological-extension
TauCeti.SchemeFoundations.GaloisGerbs.TopologicalExtension.test_kernel: For the neutral extension N⋊Γ, an element lies in the kernel precisely when its Γ-coordinate is one.
TauCeti.SchemeFoundations.GaloisGerbs.TopologicalExtension.test_unit: The trivial-kernel identity extension Γ→Γ has the given quotient topology.
TauCeti.SchemeFoundations.GaloisGerbs.TopologicalExtension.test_wrong_topology: Giving the embedded kernel a strictly coarser topology than its discrete subspace topology fails the embedding requirement.
Untyped concrete tests for SchemeAndStackFoundations:SF.1/local-splitting-chart
TauCeti.SchemeFoundations.GaloisGerbs.LocalSplitChart.test_neutral: The neutral extension has U=Γ and s(γ)=(1,γ), with its product chart.
TauCeti.SchemeFoundations.GaloisGerbs.LocalSplitChart.test_c4: For C4→C2, the trivial open subgroup has a chart even though no homomorphic section exists on all C2.
TauCeti.SchemeFoundations.GaloisGerbs.LocalSplitChart.test_unit_coordinate: The chart sends (1,1) to 1, and (n,1) to i(n).
-/

/- Independent-review prototype boundary: TauCeti.Henselization.algebra is the explicit presentation of the imported PerfectoidSpaces:P3/henselisation-of-pairs carrier. Its canonical presentation equivalence remains a gap.
Added GaloisGerb.test_nonsemilinear_extension: Let τ(x+iy)=x+2y−iy on the additive group C, and form C⋊τGal(C/R) with discrete kernel Ga(C). This split topological extension is not a gerb with that algebraic kernel: τ(1)=1 and τ(i)=2−i, so τ is not complex-antilinear and cannot be an algebraic conjugation-semilinear automorphism of Ga/C. Inner conjugation cannot repair it because the kernel is abelian.
API importedPresentationEquiv: The displayed small-neighbourhood colimit is canonically the imported P3 henselization, commuting with η, the extended ideal, stage maps and canonical residue map. -/
