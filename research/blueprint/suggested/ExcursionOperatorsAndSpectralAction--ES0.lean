import Mathlib

/-!
# Excursion operators and the spectral action: representative target signatures

The roadmap in `../readmes/ExcursionOperatorsAndSpectralAction--ES0.md` is
definitive and this file is not exhaustive. It records definitions and theorem
signatures statable against the pinned APIs; proof placeholders certify no
implementation.

Enhanced centers, condensed Hecke families, stacky Perf and coherent action
anima remain targets in the roadmap. Here reduced central support is expressed
on an actual preadditive homotopy category using Mathlib's ordinary CatCenter.
The scalar-extension theorem distinguishes flatness from the identity-preserving
endomorphism comparison, and the localization criterion concerns ideals only.
-/

open CategoryTheory
open scoped IsMulCommutative
open scoped TensorProduct

namespace TauCetiRoadmap.ExcursionOperatorsAndSpectralAction

universe u v w

/-! ## ES4: reduced central support and its operations -/

section CentralSupport
variable {R : Type w} [CommRing R]
variable {C : Type u} [Category.{v} C] [Preadditive C]

/-- Evaluation of the imported ordinary center, with its existing ring laws. -/
def centerEvaluation (X : C) : CatCenter C →+* End X where
  toFun z := z.app X
  map_one' := rfl
  map_mul' _ _ := rfl
  map_zero' := rfl
  map_add' _ _ := rfl

/-- Kernel of the actual evaluated central ring action. -/
def centralAnnihilator (a : R →+* CatCenter C) (X : C) : Ideal R :=
  RingHom.ker ((centerEvaluation X).comp a)

/-- Reduced central support in Spec R, distinct from stack singular support. -/
def centralSupport (a : R →+* CatCenter C) (X : C) : Set (PrimeSpectrum R) :=
  PrimeSpectrum.zeroLocus (centralAnnihilator a X : Set R)

/-- Annihilation means vanishing of the evaluated central endomorphism. -/
theorem centralAnnihilator_mem (a : R →+* CatCenter C) (X : C) (r : R) :
    r ∈ centralAnnihilator a X ↔ (a r).app X = 0 := by
  sorry

/-- A prime lies in the support precisely when it contains the annihilator. -/
theorem centralSupport_mem (a : R →+* CatCenter C) (X : C) (x : PrimeSpectrum R) :
    x ∈ centralSupport a X ↔ centralAnnihilator a X ≤ x.asIdeal := by
  sorry

/-- Central support is invariant under isomorphism of objects. -/
theorem centralSupport_iso (a : R →+* CatCenter C) {X Y : C} (e : X ≅ Y) :
    centralSupport a X = centralSupport a Y := by
  sorry

-- Scalar evaluation fixes the normalization of the light evaluation map.
example [Linear R C] (X : C) (r : R) :
    centerEvaluation X (Linear.toCatCenter R C r) = r • 𝟙 X := rfl

-- An annihilator contains the unit exactly for a zero object.
example (a : R →+* CatCenter C) (X : C) :
    (1 : R) ∈ centralAnnihilator a X ↔ 𝟙 X = 0 := by
  change ((centerEvaluation X).comp a) 1 = 0 ↔ _
  simp only [map_one, End.one_def]

-- centralSupport_zero: a zero object is expressed by id_X=0.
example (a : R →+* CatCenter C) (X : C) (h : 𝟙 X = 0) :
    centralSupport a X = ∅ := by
  have ha : centralAnnihilator a X = ⊤ := by
    rw [Ideal.eq_top_iff_one]
    change ((centerEvaluation X).comp a) 1 = 0
    simpa only [map_one, End.one_def] using h
  simp [centralSupport, ha]

/-- An injective evaluated central action has full reduced support. -/
theorem centralSupport_of_faithful_action (a : R →+* CatCenter C) (X : C)
    (h : Function.Injective ((centerEvaluation X).comp a)) :
    centralSupport a X = Set.univ := by
  sorry

end CentralSupport

section ExactSupport
open CategoryTheory.Limits CategoryTheory.Pretriangulated
variable {R : Type w} [CommRing R]
variable {C : Type u} [Category.{v} C] [Preadditive C]

variable [HasZeroObject C] [HasShift C ℤ]
variable [∀ n : ℤ, (shiftFunctor C n).Additive] [Pretriangulated C]

/-- The complete exact-operation statement on the homotopy-category input.
The central action and its suspension compatibility are actual mathematical data.
Its application to D_lis still requires the E5/HS enhanced comparison. -/
theorem support_exact_operations (a : R →+* CatCenter C)
    (hshift : ∀ (r : R) (X : C) (n : ℤ),
      (a r).app (X⟦n⟧) = (shiftFunctor C n).map ((a r).app X))
    [HasBinaryBiproducts C] :
    (∀ (X : C) (n : ℤ), centralSupport a (X⟦n⟧) = centralSupport a X) ∧
    (∀ X Y : C, centralSupport a (X ⊞ Y) = centralSupport a X ∪ centralSupport a Y) ∧
    (∀ (X Y : C) (i : X ⟶ Y) (r : Y ⟶ X), i ≫ r = 𝟙 X →
      centralSupport a X ⊆ centralSupport a Y) ∧
    (∀ (T : Triangle C), T ∈ distTriang C →
      centralSupport a T.obj₂ ⊆ centralSupport a T.obj₁ ∪ centralSupport a T.obj₃) ∧
    (∀ (T : Triangle C), T ∈ distTriang C →
      centralSupport a T.obj₁ ⊆ centralSupport a T.obj₂ ∪ centralSupport a T.obj₃) ∧
    (∀ (T : Triangle C), T ∈ distTriang C →
      centralSupport a T.obj₃ ⊆ centralSupport a T.obj₁ ∪ centralSupport a T.obj₂) := by
  sorry

end ExactSupport

section SupportComparisons
variable {R S : Type*} [CommRing R] [CommRing S]
variable {C D : Type*} [Category C] [Category D] [Preadditive C] [Preadditive D]

/-- Compatible additive functors give both annihilator and support containment.
This assertion has no flatness or endomorphism-comparison hypothesis. -/
theorem support_compatible_functor (a : R →+* CatCenter C) (b : S →+* CatCenter D)
    (φ : R →+* S) (F : C ⥤ D) [F.Additive]
    (h : ∀ r X, (b (φ r)).app (F.obj X) = F.map ((a r).app X)) (X : C) :
    Ideal.map φ (centralAnnihilator a X) ≤ centralAnnihilator b (F.obj X) ∧
      centralSupport b (F.obj X) ⊆ (PrimeSpectrum.comap φ) ⁻¹' centralSupport a X := by
  sorry

/-- Flat tensoring preserves the kernel of evaluation at the identity.
The module structures are the evaluated central scalar actions, expressed by
ha and hb. The supplied S-linear comparison carries the tensor identity to
the identity of Y; it does not assume the desired annihilator equality.
Geometric scalar extension must supply this comparison at the claimed object. -/
theorem support_coefficient_change [Algebra R S] [Module.Flat R S]
    (a : R →+* CatCenter C) (b : S →+* CatCenter D) (X : C) (Y : D)
    [Module R (End X)] [Module S (End Y)]
    (ha : ∀ r : R, ((a r).app X : End X) = r • (1 : End X))
    (hb : ∀ s : S, ((b s).app Y : End Y) = s • (1 : End Y))
    (e : S ⊗[R] End X ≃ₗ[S] End Y)
    (he : e (1 ⊗ₜ[R] (1 : End X)) = (1 : End Y)) :
    centralAnnihilator b Y = Ideal.map (algebraMap R S) (centralAnnihilator a X) ∧
    centralSupport b Y = (PrimeSpectrum.comap (algebraMap R S)) ⁻¹' centralSupport a X := by
  sorry

/-- The ring-theoretic half of localization; this does not construct a telescope. -/
theorem centralSupport_subset_principal_iff (a : R →+* CatCenter C) (X : C) (f : R) :
    centralSupport a X ⊆ PrimeSpectrum.zeroLocus ({f} : Set R) ↔
      ∃ n : ℕ, (a (f ^ n)).app X = 0 := by
  sorry

end SupportComparisons

section IdempotentSupport
variable {C : Type*} [Category C] [Preadditive C]

/-- Complementary scalar projectors constrain support to complementary loci. -/
theorem centralSupport_idempotent {R : Type*} [CommRing R]
    (a : R →+* CatCenter C) (e : R) (he : e * e = e) (X Y : C)
    (hX : (a e).app X = 𝟙 X) (hY : (a e).app Y = 0) :
    centralSupport a X ⊆ PrimeSpectrum.zeroLocus ({1-e} : Set R) ∧
      centralSupport a Y ⊆ PrimeSpectrum.zeroLocus ({e} : Set R) := by
  sorry

end IdempotentSupport

section ModuleSupportExamples
variable (R : Type u) [CommRing R]

/-- The scalar action on the rank-one free module is faithful and has full support. -/
theorem centralSupport_free : centralAnnihilator (Linear.toCatCenter R (ModuleCat R)) (ModuleCat.of R R) = ⊥ ∧
    centralSupport (Linear.toCatCenter R (ModuleCat R)) (ModuleCat.of R R) = Set.univ := by
  sorry

variable (k : Type u) [Field k]

/-- The dual-number residue action has nonzero annihilator but full reduced support.
This is a degree-zero computation in ModuleCat k, without claiming k is perfect over k[ε]. -/
theorem centralSupport_nilpotent :
    let a : DualNumber k →+* CatCenter (ModuleCat k) :=
      (Linear.toCatCenter k (ModuleCat k)).comp (TrivSqZeroExt.fstHom k k k).toRingHom
    centralAnnihilator a (ModuleCat.of k k) = Ideal.span ({DualNumber.eps} : Set (DualNumber k)) ∧
      centralSupport a (ModuleCat.of k k) = Set.univ := by
  sorry

end ModuleSupportExamples

/-- Under the flat identity map on ℤ, the scalar module and zero have different
annihilators despite their compatibility through the additive zero functor.
Thus flatness and compatible actions alone do not imply annihilator equality. -/
theorem support_coefficient_change_requires_End_comparison :
    centralAnnihilator (Linear.toCatCenter ℤ (ModuleCat ℤ)) (ModuleCat.of ℤ ℤ) = ⊥ ∧
    centralAnnihilator (Linear.toCatCenter ℤ (ModuleCat ℤ))
      (ModuleCat.of ℤ (Fin 0 → ℤ)) = ⊤ := by
  sorry

/-- The nonflat map ℤ → ℤ/2 kills ℚ. The End tensor comparison preserves the
identity, yet the annihilator grows from zero to the unit ideal. -/
theorem support_coefficient_change_requires_flatness :
    let X := ModuleCat.of ℚ ℚ
    let Y := ModuleCat.of (ZMod 2) (Fin 0 → ZMod 2)
    let a : ℤ →+* CatCenter (ModuleCat ℚ) :=
      (Linear.toCatCenter ℚ (ModuleCat ℚ)).comp (Int.castRingHom ℚ)
    let b := Linear.toCatCenter (ZMod 2) (ModuleCat (ZMod 2))
    (¬ Module.Flat ℤ (ZMod 2)) ∧
    (∃ e : (ZMod 2) ⊗[ℤ] End X ≃ₗ[ZMod 2] End Y,
      e (1 ⊗ₜ[ℤ] (1 : End X)) = (1 : End Y)) ∧
    centralAnnihilator a X = ⊥ ∧ centralAnnihilator b Y = ⊤ ∧
    Ideal.map (Int.castRingHom (ZMod 2)) (centralAnnihilator a X) ≠
      centralAnnihilator b Y := by
  sorry

end TauCetiRoadmap.ExcursionOperatorsAndSpectralAction
