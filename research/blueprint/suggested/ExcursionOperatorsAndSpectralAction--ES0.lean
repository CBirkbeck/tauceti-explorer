/-
This file is not the roadmap and is not exhaustive. The mathematical roadmap
in ../readmes/ExcursionOperatorsAndSpectralAction--ES0.md is definitive.
These are suggested statements for contributors; proof placeholders do not
certify any implementation.

The enhanced stable categories, condensed Hecke families, stacky Perf and
coherent action anima used in ES0–ES4 are README targets. Their carriers are
not supplied at the library pins. The declarations here concern reduced
central support after passing to an actual preadditive homotopy category.
They do not replace the enhanced constructions by ordinary projections.

Mathlib's CatCenter, its ring laws and its scalar map are imported. The three
light definitions below use those existing carriers. The end theorems and
examples state the generic support results and their hypothesis checks.
-/

import Mathlib.CategoryTheory.Center.Linear
import Mathlib.CategoryTheory.Preadditive.AdditiveFunctor
import Mathlib.RingTheory.Spectrum.Prime.Basic
import Mathlib.RingTheory.Spectrum.Prime.RingHom
import Mathlib.RingTheory.Ideal.Maps
import Mathlib.RingTheory.Flat.Basic
import Mathlib.CategoryTheory.Triangulated.Pretriangulated
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.Algebra.DualNumber
import Mathlib.Data.ZMod.Basic

open CategoryTheory
open scoped IsMulCommutative
open scoped TensorProduct

namespace TauCetiBlueprint.Excursion

universe u v w

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

theorem centralAnnihilator_mem (a : R →+* CatCenter C) (X : C) (r : R) :
    r ∈ centralAnnihilator a X ↔ (a r).app X = 0 := by
  sorry

theorem centralSupport_mem (a : R →+* CatCenter C) (X : C) (x : PrimeSpectrum R) :
    x ∈ centralSupport a X ↔ centralAnnihilator a X ≤ x.asIdeal := by
  sorry

theorem centralSupport_iso (a : R →+* CatCenter C) {X Y : C} (e : X ≅ Y) :
    centralSupport a X = centralSupport a Y := by
  sorry

-- centralSupport_zero: a zero object is expressed by id_X=0 in a preadditive category.
example (a : R →+* CatCenter C) (X : C) (h : 𝟙 X = 0) :
    centralSupport a X = ∅ := by
  sorry

-- The faithful-action support criterion.
example (a : R →+* CatCenter C) (X : C)
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

theorem centralSupport_idempotent {R : Type*} [CommRing R]
    (a : R →+* CatCenter C) (e : R) (he : e * e = e) (X Y : C)
    (hX : (a e).app X = 𝟙 X) (hY : (a e).app Y = 0) :
    centralSupport a X ⊆ PrimeSpectrum.zeroLocus ({1-e} : Set R) ∧
      centralSupport a Y ⊆ PrimeSpectrum.zeroLocus ({e} : Set R) := by
  sorry

end IdempotentSupport

section ModuleSupportExamples
variable (R : Type u) [CommRing R]

-- centralSupport_free: the concrete rank-one scalar module computation.
example : centralAnnihilator (Linear.toCatCenter R (ModuleCat R)) (ModuleCat.of R R) = ⊥ ∧
    centralSupport (Linear.toCatCenter R (ModuleCat R)) (ModuleCat.of R R) = Set.univ := by
  sorry

variable (k : Type u) [Field k]

-- centralSupport_nilpotent: degree-zero observation of k compact in Perf(k).
-- The scalar category is ModuleCat k; k is not asserted to be perfect over k[ε].
example :
    let a : DualNumber k →+* CatCenter (ModuleCat k) :=
      (Linear.toCatCenter k (ModuleCat k)).comp (TrivSqZeroExt.fstHom k k k).toRingHom
    centralAnnihilator a (ModuleCat.of k k) = Ideal.span ({DualNumber.eps} : Set (DualNumber k)) ∧
      centralSupport a (ModuleCat.of k k) = Set.univ := by
  sorry

end ModuleSupportExamples

-- support_coefficient_change_requires_End_comparison: even for the flat identity
-- ring map, replacing the scalar module by zero changes its annihilator.
-- The additive zero functor is compatible with scalar actions. Thus those
-- hypotheses alone cannot imply equality, without the endomorphism comparison.
example :
    centralAnnihilator (Linear.toCatCenter ℤ (ModuleCat ℤ)) (ModuleCat.of ℤ ℤ) = ⊥ ∧
    centralAnnihilator (Linear.toCatCenter ℤ (ModuleCat ℤ))
      (ModuleCat.of ℤ (Fin 0 → ℤ)) = ⊤ := by
  sorry

-- support_coefficient_change_requires_flatness: ℚ tensored with ℤ/2 is zero.
-- Its degree-zero End tensor comparison is therefore an equivalence to End(0)
-- preserving the identity, yet the annihilator grows from zero to the unit ideal.
example :
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

end TauCetiBlueprint.Excursion
