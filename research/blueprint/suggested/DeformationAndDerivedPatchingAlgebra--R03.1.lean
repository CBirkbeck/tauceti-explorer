/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names and
signatures. Every proof hole marks planned work; this file claims no implementation.
The coefficient base is a complete Noetherian local ring O with a specified residue map ρ.
The complete DVR specialization does not require a finite residue field.
-/
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.RingTheory.AdicCompletion.Noetherian
import Mathlib.RingTheory.AdicCompletion.LocalRing
import Mathlib.RingTheory.AdicCompletion.Exactness
import Mathlib.RingTheory.AdicCompletion.AsTensorProduct
import Mathlib.RingTheory.AdicCompletion.Topology
import Mathlib.RingTheory.MvPowerSeries.Evaluation
import Mathlib.RingTheory.MvPowerSeries.Equiv
import Mathlib.RingTheory.MvPowerSeries.Inverse
import Mathlib.RingTheory.Ideal.Cotangent
import Mathlib.RingTheory.Finiteness.Descent
import Mathlib.Algebra.Algebra.Subalgebra.Lattice
import Mathlib.CategoryTheory.Category.Basic
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.RingTheory.MvPowerSeries.Ideal
import Mathlib.RingTheory.WittVector.DiscreteValuationRing
import Mathlib.RingTheory.WittVector.Complete
import Mathlib.RingTheory.Smooth.Quotient
import Mathlib.RingTheory.Smooth.Field
import Mathlib.RingTheory.Derivation.Basic
import Mathlib.FieldTheory.PerfectClosure
import Mathlib.Algebra.Exact.Basic
import Mathlib.RingTheory.Nilpotent.GeometricallyReduced
import Mathlib.RingTheory.Localization.AtPrime.Basic
import Mathlib.RingTheory.Spectrum.Prime.Topology
import Mathlib.RingTheory.KrullDimension.Basic

open scoped TensorProduct
noncomputable section
universe u
namespace TauCeti.Coeff

variable (O k : Type u) [CommRing O] [Field k] (ρ : O →+* k)

/-- A local algebra with its genuine, labelled residue quotient. -/
structure Local where
  Carrier : Type u
  [ring : CommRing Carrier]
  [localRing : IsLocalRing Carrier]
  [algebra : Algebra O Carrier]
  residue : Carrier →+* k
  residue_surjective : Function.Surjective residue
  ker_residue : RingHom.ker residue = IsLocalRing.maximalIdeal Carrier
  residue_algebraMap : residue.comp (algebraMap O Carrier) = ρ
attribute [instance] Local.ring Local.localRing Local.algebra
instance : CoeSort (Local O k ρ) (Type u) := ⟨Local.Carrier⟩

/-- Artinian objects, with the same residue convention. -/
structure Artinian extends Local O k ρ where
  [artinianRing : IsArtinianRing Carrier]
attribute [instance] Artinian.artinianRing

/-- Maximal-ideal complete and separated Noetherian local objects. -/
structure Complete extends Local O k ρ where
  [noetherianRing : IsNoetherianRing Carrier]
  [adicComplete : IsAdicComplete (IsLocalRing.maximalIdeal Carrier) Carrier]
attribute [instance] Complete.noetherianRing Complete.adicComplete

variable {O k ρ}

structure Hom (A B : Local O k ρ) where
  toAlgHom : A →ₐ[O] B
  residue_apply : ∀ a, B.residue (toAlgHom a) = A.residue a

namespace Hom
variable {A B C D : Local O k ρ}

def id (A : Local O k ρ) : Hom A A := ⟨AlgHom.id O A, fun _ => rfl⟩
def comp (g : Hom B C) (f : Hom A B) : Hom A C :=
  ⟨g.toAlgHom.comp f.toAlgHom, fun a => (g.residue_apply _).trans (f.residue_apply a)⟩

theorem ext {f g : Hom A B} (h : f.toAlgHom = g.toAlgHom) : f = g := by sorry

theorem isLocalHom (f : Hom A B) : IsLocalHom f.toAlgHom.toRingHom := by sorry

theorem comap_maximalIdeal (f : Hom A B) :
    (IsLocalRing.maximalIdeal B).comap f.toAlgHom.toRingHom = IsLocalRing.maximalIdeal A := by sorry

theorem continuous (f : Hom A B) :
    @Continuous A B (IsLocalRing.maximalIdeal A).adicTopology
      (IsLocalRing.maximalIdeal B).adicTopology f.toAlgHom := by sorry

-- Hom.test_id_residue
example (A : Local O k ρ) (a : A) : A.residue ((id A).toAlgHom a) = A.residue a := by sorry
-- Hom.test_comp_residue
example (f : Hom A B) (g : Hom B C) (a : A) :
    C.residue ((comp g f).toAlgHom a) = A.residue a := by sorry
-- Hom.test_no_variable_to_one: locality excludes evaluation X ↦ 1.
example (A B : Local O k ρ) (f : Hom A B) (x : A)
    (hx : x ∈ IsLocalRing.maximalIdeal A) : f.toAlgHom x ≠ 1 := by sorry
end Hom

instance Local.category : CategoryTheory.Category (Local O k ρ) where
  Hom := Hom
  id := Hom.id
  comp f g := Hom.comp g f
  id_comp := by intros; apply Hom.ext; ext; rfl
  comp_id := by intros; apply Hom.ext; ext; rfl
  assoc := by intros; apply Hom.ext; ext; rfl

instance Artinian.category : CategoryTheory.Category (Artinian O k ρ) where
  Hom A B := Hom A.toLocal B.toLocal
  id A := Hom.id A.toLocal
  comp f g := Hom.comp g f
  id_comp := by intros; apply Hom.ext; ext; rfl
  comp_id := by intros; apply Hom.ext; ext; rfl
  assoc := by intros; apply Hom.ext; ext; rfl

instance Complete.category : CategoryTheory.Category (Complete O k ρ) where
  Hom A B := Hom A.toLocal B.toLocal
  id A := Hom.id A.toLocal
  comp f g := Hom.comp g f
  id_comp := by intros; apply Hom.ext; ext; rfl
  comp_id := by intros; apply Hom.ext; ext; rfl
  assoc := by intros; apply Hom.ext; ext; rfl

namespace Local
variable (A : Local O k ρ)

def residueObject : Local O k ρ := by
  letI : Algebra O k := ρ.toAlgebra
  exact {
    Carrier := k
    residue := RingHom.id k
    residue_surjective := Function.surjective_id
    ker_residue := by sorry
    residue_algebraMap := by sorry }

def split (n : ℕ) : Local O k ρ := by
  letI : Algebra O k := ρ.toAlgebra
  letI : IsLocalRing (TrivSqZeroExt k (Fin n → k)) := by sorry
  exact {
    Carrier := TrivSqZeroExt k (Fin n → k)
    residue := (TrivSqZeroExt.fstHom O k (Fin n → k)).toRingHom
    residue_surjective := by sorry
    ker_residue := by sorry
    residue_algebraMap := by sorry }

def splitAugmentation (n : ℕ) : Hom (split (O := O) (ρ := ρ) n) residueObject := {
  toAlgHom := by
    letI : Algebra O k := ρ.toAlgebra
    exact TrivSqZeroExt.fstHom O k (Fin n → k)
  residue_apply := by sorry }

theorem split_residue (n : ℕ) (x : TrivSqZeroExt k (Fin n → k)) :
    (split (O := O) (ρ := ρ) n).residue x = x.fst := by sorry

-- Local.split_test_zero
example : Function.Bijective (splitAugmentation (O := O) (ρ := ρ) 0).toAlgHom := by sorry
-- Local.split_test_product
example (n : ℕ) (v w : Fin n → k) :
    (TrivSqZeroExt.inr v * TrivSqZeroExt.inr w : (split (O := O) (ρ := ρ) n).Carrier) = 0 := by sorry
-- Local.split_test_unit
example (n : ℕ) (c : k) (v : Fin n → k) :
    IsUnit (TrivSqZeroExt.inl c + TrivSqZeroExt.inr v : (split (O := O) (ρ := ρ) n).Carrier) ↔ c ≠ 0 := by sorry

theorem residue_ne_zero_iff_isUnit (a : A) : A.residue a ≠ 0 ↔ IsUnit a := by sorry

-- Local.test_zero_excluded
example : ¬ Subsingleton A.Carrier := by sorry
-- Local.test_residue_kernel
example (a : A) : A.residue a = 0 ↔ a ∈ IsLocalRing.maximalIdeal A := by sorry
-- Local.test_unit_lift
example (c : k) (hc : c ≠ 0) : ∃ a : A, A.residue a = c ∧ IsUnit a := by sorry
end Local

namespace Artinian
variable (A : Artinian O k ρ)

def split (n : ℕ) : Artinian O k ρ where
  toLocal := Local.split n
  artinianRing := by sorry


def toComplete : Complete O k ρ where
  toLocal := A.toLocal
  noetherianRing := by infer_instance
  adicComplete := by infer_instance

-- Artinian.test_field: the actual residue object has native Artinian and complete instances.
example :
    letI : Algebra O k := ρ.toAlgebra
    IsArtinianRing k ∧ IsAdicComplete (IsLocalRing.maximalIdeal k) k := by sorry
-- Artinian.test_nilpotent
example : IsNilpotent (IsLocalRing.maximalIdeal A.Carrier) := by sorry
-- Artinian.test_noetherian
example : IsNoetherianRing A.Carrier := by sorry
end Artinian

namespace Complete
variable (A : Complete O k ρ)

def completionEquiv : A.Carrier ≃ₐ[A.Carrier]
    AdicCompletion (IsLocalRing.maximalIdeal A.Carrier) A.Carrier :=
  AdicCompletion.ofAlgEquiv _

-- Complete.test_separated
example (a : A.Carrier) (ha : ∀ n : ℕ, a ∈ IsLocalRing.maximalIdeal A.Carrier ^ n) : a = 0 := by sorry
-- Complete.test_dvr_allowed: Artinianity is not imposed on a complete object.
example : IsNoetherianRing (MvPowerSeries (Fin 1) k) ∧
    IsLocalRing (MvPowerSeries (Fin 1) k) ∧
    IsAdicComplete (IsLocalRing.maximalIdeal (MvPowerSeries (Fin 1) k))
      (MvPowerSeries (Fin 1) k) ∧
    ¬ IsArtinianRing (MvPowerSeries (Fin 1) k) := by sorry
-- Complete.test_completion_comparison
example (a : A.Carrier) : A.completionEquiv a =
    AdicCompletion.of (IsLocalRing.maximalIdeal A.Carrier) A.Carrier a := by sorry
end Complete

namespace Extension
variable {A B : Local O k ρ}

def Nilpotent (f : Hom A B) : Prop :=
  Function.Surjective f.toAlgHom ∧ IsNilpotent (RingHom.ker f.toAlgHom.toRingHom)

def SquareZero (f : Hom A B) : Prop :=
  Function.Surjective f.toAlgHom ∧ RingHom.ker f.toAlgHom.toRingHom ^ 2 = ⊥

def Small (f : Hom A B) : Prop :=
  Function.Surjective f.toAlgHom ∧ RingHom.ker f.toAlgHom.toRingHom ≠ ⊥ ∧
    (RingHom.ker f.toAlgHom.toRingHom).IsPrincipal ∧
    IsLocalRing.maximalIdeal A * RingHom.ker f.toAlgHom.toRingHom = ⊥

theorem Nilpotent.surjective {f : Hom A B} (h : Nilpotent f) : Function.Surjective f.toAlgHom := by sorry

theorem Nilpotent.ker_nilpotent {f : Hom A B} (h : Nilpotent f) :
    IsNilpotent (RingHom.ker f.toAlgHom.toRingHom) := by sorry

theorem Nilpotent.comp {C : Local O k ρ} {f : Hom A B} {g : Hom B C}
    (hf : Nilpotent f) (hg : Nilpotent g) : Nilpotent (Hom.comp g f) := by sorry

theorem SquareZero.surjective {f : Hom A B} (h : SquareZero f) :
    Function.Surjective f.toAlgHom := by sorry

theorem SquareZero.split (n : ℕ) :
    SquareZero (Local.splitAugmentation (O := O) (ρ := ρ) n) := by sorry

theorem SquareZero.nilpotent {f : Hom A B} (h : SquareZero f) : Nilpotent f := by sorry

theorem Small.squareZero {f : Hom A B} (h : Small f) : SquareZero f := by sorry

theorem Small.ker_le_maximalIdeal {f : Hom A B} (h : Small f) :
    RingHom.ker f.toAlgHom.toRingHom ≤ IsLocalRing.maximalIdeal A := by sorry

-- Nilpotent.test_identity
example (A : Local O k ρ) : Nilpotent (Hom.id A) := by sorry
-- Nilpotent.test_square_zero
example (f : Hom A B) (h : SquareZero f) : Nilpotent f := by sorry
-- Nilpotent.test_not_surjective
example (f : Hom A B) (h : ¬ Function.Surjective f.toAlgHom) :
    letI : Algebra O k := ρ.toAlgebra
    let P : Local O k ρ := {
      Carrier := MvPowerSeries (Fin 1) k
      algebra := (MvPowerSeries.C.comp ρ).toAlgebra
      residue := MvPowerSeries.constantCoeff
      residue_surjective := by sorry
      ker_residue := by sorry
      residue_algebraMap := by sorry }
    letI : Algebra O P.Carrier := P.algebra
    let aug : Hom P (Local.residueObject (O := O) (ρ := ρ)) :=
      ⟨{ __ := (MvPowerSeries.constantCoeff : MvPowerSeries (Fin 1) k →+* k),
          commutes' := by sorry }, by sorry⟩
    ¬ Nilpotent f ∧ Function.Surjective aug.toAlgHom ∧ ¬ Nilpotent aug := by sorry
-- SquareZero.test_identity
example (A : Local O k ρ) : SquareZero (Hom.id A) := by sorry
-- SquareZero.test_small
example (f : Hom A B) (h : Small f) : SquareZero f := by sorry
-- SquareZero.test_cube_not_square: the augmentation k[t]/(t³)→k has nonzero kernel square.
example :
    let R := MvPowerSeries (Fin 1) k
    let I : Ideal R := Ideal.span {MvPowerSeries.X 0 ^ 3}
    let q : R ⧸ I →+* k := Ideal.Quotient.lift I MvPowerSeries.constantCoeff (by sorry)
    RingHom.ker q ^ 2 ≠ ⊥ := by sorry
-- Small.test_identity
example (A : Local O k ρ) : ¬ Small (Hom.id A) := by sorry
-- Small.test_principal_required: a two-dimensional square-zero kernel is excluded.
example : ¬ Small (Local.splitAugmentation (O := O) (ρ := ρ) 2) := by sorry
-- Small.test_annihilator_required
example : Small (Local.splitAugmentation (O := O) (ρ := ρ) 1) := by sorry
example :
    let R := MvPowerSeries (Fin 1) k
    let I : Ideal R := Ideal.span {MvPowerSeries.X 0 ^ 3}
    let q : R ⧸ I →+* k := Ideal.Quotient.lift I MvPowerSeries.constantCoeff (by sorry)
    letI : IsLocalRing (R ⧸ I) := by sorry
    IsLocalRing.maximalIdeal (R ⧸ I) * RingHom.ker q ≠ ⊥ := by sorry
end Extension


namespace Local
variable (A : Local O k ρ) (M : Type u) [AddCommGroup M] [Module A M]

/-- Transport the annihilated action through the actual labelled residue map. -/
@[instance_reducible]
def residueModule (h : ∀ a ∈ IsLocalRing.maximalIdeal A, ∀ v : M, a • v = 0) :
    Module k M where
  smul c v := (Classical.choose (A.residue_surjective c)) • v
  one_smul := by sorry
  mul_smul := by sorry
  smul_add := by sorry
  smul_zero := by sorry
  add_smul := by sorry
  zero_smul := by sorry

theorem residueModule_smul (h : ∀ a ∈ IsLocalRing.maximalIdeal A, ∀ v : M, a • v = 0)
    (a : A) (c : k) (ha : A.residue a = c) (v : M) :
    letI := A.residueModule M h
    c • v = a • v := by sorry

theorem residueModule_independent (h : ∀ a ∈ IsLocalRing.maximalIdeal A, ∀ v : M, a • v = 0)
    (a b : A) (hab : A.residue a = A.residue b) (v : M) : a • v = b • v := by sorry

theorem residueModule_tower (h : ∀ a ∈ IsLocalRing.maximalIdeal A, ∀ v : M, a • v = 0)
    (a : A) (c : k) (v : M) :
    letI := A.residueModule M h
    (A.residue a * c) • v = a • (c • v) := by sorry

-- Local.residueModule_test_zero
example (h : ∀ a ∈ IsLocalRing.maximalIdeal A, ∀ v : M, a • v = 0)
    (hz : Subsingleton M) :
    letI := A.residueModule M h
    ∀ c : k, c • (0 : M) = 0 := by sorry
-- Local.residueModule_test_residue
example (a : A) (c : k) :
    letI : Module A k := Module.compHom k A.residue
    let h : ∀ a ∈ IsLocalRing.maximalIdeal A, ∀ v : k, a • v = 0 := by sorry
    letI := A.residueModule k h
    A.residue a • c = A.residue a * c := by sorry
-- Local.residueModule_test_difference
example (h : ∀ a ∈ IsLocalRing.maximalIdeal A, ∀ v : M, a • v = 0)
    (a b : A) (hab : A.residue a = A.residue b) (v : M) : (a - b) • v = 0 := by sorry
end Local

/-- The denominator is a submodule of the maximal ideal, not the whole ring. -/
def RelativeCotangent {A B : Local O k ρ} (f : Hom A B) : Type u :=
  (IsLocalRing.maximalIdeal B) ⧸
    Submodule.comap (IsLocalRing.maximalIdeal B).subtype
      ((IsLocalRing.maximalIdeal A).map f.toAlgHom.toRingHom ⊔
        IsLocalRing.maximalIdeal B ^ 2)

namespace RelativeCotangent
variable {A B : Local O k ρ} (f : Hom A B)

instance additive : AddCommGroup (RelativeCotangent f) := by
  unfold RelativeCotangent
  infer_instance
instance ringModule : Module B (RelativeCotangent f) := by
  unfold RelativeCotangent
  infer_instance
instance residueModule : Module k (RelativeCotangent f) :=
  B.residueModule (RelativeCotangent f) (by sorry)

def mk (b : IsLocalRing.maximalIdeal B) : RelativeCotangent f := Submodule.Quotient.mk b

theorem mk_eq_zero (b : IsLocalRing.maximalIdeal B) : mk f b = 0 ↔
    b.val ∈ (IsLocalRing.maximalIdeal A).map f.toAlgHom.toRingHom ⊔
      IsLocalRing.maximalIdeal B ^ 2 := by sorry

/-- The induced map is available as data, with its quotient computation exposed below. -/
def map {A' B' : Local O k ρ} (f' : Hom A' B')
    (a : Hom A A') (b : Hom B B') (hsq : Hom.comp b f = Hom.comp f' a) :
    RelativeCotangent f →ₗ[k] RelativeCotangent f' := by sorry

theorem map_mk {A' B' : Local O k ρ} (f' : Hom A' B')
    (a : Hom A A') (b : Hom B B') (hsq : Hom.comp b f = Hom.comp f' a)
    (x : IsLocalRing.maximalIdeal B) :
    map f f' a b hsq (mk f x) = mk f' ⟨b.toAlgHom x, by sorry⟩ := by sorry

theorem map_id : map f f (Hom.id A) (Hom.id B) (by sorry) = LinearMap.id := by sorry

theorem map_comp {A' B' A'' B'' : Local O k ρ} (f' : Hom A' B') (f'' : Hom A'' B'')
    (a : Hom A A') (b : Hom B B') (a' : Hom A' A'') (b' : Hom B' B'')
    (hsq : Hom.comp b f = Hom.comp f' a) (hsq' : Hom.comp b' f' = Hom.comp f'' a') :
    map f f'' (Hom.comp a' a) (Hom.comp b' b) (by sorry) =
      (map f' f'' a' b' hsq').comp (map f f' a b hsq) := by sorry

-- RelativeCotangent.test_identity
example (A : Local O k ρ) : Subsingleton (RelativeCotangent (Hom.id A)) := by sorry
-- RelativeCotangent.test_split, including n=0.
example (n : ℕ) :
    letI : Algebra O k := ρ.toAlgebra
    let i : Hom (Local.residueObject (O := O) (ρ := ρ)) (Local.split n) :=
      ⟨TrivSqZeroExt.inlAlgHom O k (Fin n → k), by sorry⟩
    ∃ e : RelativeCotangent i ≃ₗ[k] (Fin n → k),
      ∀ j : Fin n,
        e (mk i ⟨TrivSqZeroExt.inr (Pi.single j 1), by sorry⟩) = Pi.single j 1 := by sorry
-- RelativeCotangent.test_base_parameter: every base direction dies for the identity.
example (A : Local O k ρ) (x : IsLocalRing.maximalIdeal A) :
    mk (Hom.id A) x = 0 := by sorry
end RelativeCotangent

namespace Extension.Small
variable {A B : Local O k ρ} {f : Hom A B}
theorem ker_finrank_one (h : Extension.Small f) :
    letI := A.residueModule (RingHom.ker f.toAlgHom.toRingHom) (by sorry)
    Module.finrank k (RingHom.ker f.toAlgHom.toRingHom) = 1 := by sorry
end Extension.Small

namespace Artinian
variable {A B C : Artinian O k ρ}

def pullback [Fact (Function.Surjective ρ)] (f : Hom A.toLocal C.toLocal) (g : Hom B.toLocal C.toLocal) : Artinian O k ρ := by
  let P := AlgHom.equalizer
    (f.toAlgHom.comp (AlgHom.fst O A.Carrier B.Carrier))
    (g.toAlgHom.comp (AlgHom.snd O A.Carrier B.Carrier))
  letI : IsLocalRing P := by sorry
  letI : IsArtinianRing P := by sorry
  exact {
    Carrier := P
    residue := A.residue.comp ((AlgHom.fst O A.Carrier B.Carrier).comp P.val).toRingHom
    residue_surjective := by sorry
    ker_residue := by sorry
    residue_algebraMap := by sorry }

variable [Fact (Function.Surjective ρ)]

def pullbackFst (f : Hom A.toLocal C.toLocal) (g : Hom B.toLocal C.toLocal) :
    Hom (pullback f g).toLocal A.toLocal := {
  toAlgHom := { toFun := fun x => x.val.1
                map_zero' := by sorry
                map_one' := by sorry
                map_add' := by sorry
                map_mul' := by sorry
                commutes' := by sorry }
  residue_apply := by sorry }

def pullbackSnd (f : Hom A.toLocal C.toLocal) (g : Hom B.toLocal C.toLocal) :
    Hom (pullback f g).toLocal B.toLocal := {
  toAlgHom := { toFun := fun x => x.val.2
                map_zero' := by sorry
                map_one' := by sorry
                map_add' := by sorry
                map_mul' := by sorry
                commutes' := by sorry }
  residue_apply := by sorry }

def pullbackLift {D : Local O k ρ} (f : Hom A.toLocal C.toLocal) (g : Hom B.toLocal C.toLocal)
    (h : Hom D A.toLocal) (i : Hom D B.toLocal) (hc : Hom.comp f h = Hom.comp g i) :
    Hom D (pullback f g).toLocal := {
  toAlgHom := { toFun := fun d => ⟨(h.toAlgHom d, i.toAlgHom d), by sorry⟩
                map_zero' := by sorry
                map_one' := by sorry
                map_add' := by sorry
                map_mul' := by sorry
                commutes' := by sorry }
  residue_apply := by sorry }

theorem pullbackLift_fst {D : Local O k ρ}
    (f : Hom A.toLocal C.toLocal) (g : Hom B.toLocal C.toLocal)
    (h : Hom D A.toLocal) (i : Hom D B.toLocal) (hc : Hom.comp f h = Hom.comp g i) :
    Hom.comp (pullbackFst f g) (pullbackLift f g h i hc) = h := by sorry

theorem pullbackLift_snd {D : Local O k ρ}
    (f : Hom A.toLocal C.toLocal) (g : Hom B.toLocal C.toLocal)
    (h : Hom D A.toLocal) (i : Hom D B.toLocal) (hc : Hom.comp f h = Hom.comp g i) :
    Hom.comp (pullbackSnd f g) (pullbackLift f g h i hc) = i := by sorry

theorem pullback_ext {D : Local O k ρ} (f : Hom A.toLocal C.toLocal) (g : Hom B.toLocal C.toLocal)
    (h i : Hom D (pullback f g).toLocal)
    (h₁ : Hom.comp (pullbackFst f g) h = Hom.comp (pullbackFst f g) i)
    (h₂ : Hom.comp (pullbackSnd f g) h = Hom.comp (pullbackSnd f g) i) : h = i := by sorry

-- Artinian.pullback_test_identity
example (f : Hom A.toLocal B.toLocal) :
    Function.Bijective (pullbackFst f (Hom.id B.toLocal)).toAlgHom := by sorry
-- Artinian.pullback_test_dual
example :
    letI : Algebra O k := ρ.toAlgebra
    let D := split (O := O) (ρ := ρ) 1
    let K := split (O := O) (ρ := ρ) 0
    let a : Hom D.toLocal K.toLocal :=
      { toAlgHom := (TrivSqZeroExt.inlAlgHom O k (Fin 0 → k)).comp
          (TrivSqZeroExt.fstHom O k (Fin 1 → k))
        residue_apply := by sorry }
    let P := pullback a a
    IsLocalRing.maximalIdeal P.Carrier ^ 2 = ⊥ ∧
      (letI := P.toLocal.residueModule (IsLocalRing.maximalIdeal P.Carrier) (by sorry)
       Module.finrank k (IsLocalRing.maximalIdeal P.Carrier) = 2) := by sorry
-- Artinian.pullback_test_residue
example (f : Hom A.toLocal C.toLocal) (g : Hom B.toLocal C.toLocal) (x : (pullback f g).Carrier) :
    (pullback f g).residue x = A.residue x.val.1 := by sorry
end Artinian

namespace Complete
variable (A : Complete O k ρ)

def quotient (I : Ideal A.Carrier) (hI : I ≤ IsLocalRing.maximalIdeal A.Carrier) : Complete O k ρ := by
  letI : IsLocalRing (A.Carrier ⧸ I) := by sorry
  letI : IsAdicComplete (IsLocalRing.maximalIdeal (A.Carrier ⧸ I)) (A.Carrier ⧸ I) := by sorry
  exact {
    Carrier := A.Carrier ⧸ I
    residue := Ideal.Quotient.lift I A.residue (by sorry)
    residue_surjective := by sorry
    ker_residue := by sorry
    residue_algebraMap := by sorry }

def quotientMk (I : Ideal A.Carrier) (hI : I ≤ IsLocalRing.maximalIdeal A.Carrier) :
    Hom A.toLocal (A.quotient I hI).toLocal :=
  ⟨Ideal.Quotient.mkₐ O I, by sorry⟩

theorem quotient_residue (I : Ideal A.Carrier) (hI : I ≤ IsLocalRing.maximalIdeal A.Carrier) (a : A.Carrier) :
    (A.quotient I hI).residue (Ideal.Quotient.mk I a) = A.residue a := by sorry

def quotientLift {B : Local O k ρ} (I : Ideal A.Carrier) (hI : I ≤ IsLocalRing.maximalIdeal A.Carrier)
    (f : Hom A.toLocal B) (hf : ∀ a ∈ I, f.toAlgHom a = 0) :
    Hom (A.quotient I hI).toLocal B := ⟨Ideal.Quotient.liftₐ I f.toAlgHom hf, by sorry⟩

theorem quotientLift_mk {B : Local O k ρ} (I : Ideal A.Carrier)
    (hI : I ≤ IsLocalRing.maximalIdeal A.Carrier) (f : Hom A.toLocal B)
    (hf : ∀ a ∈ I, f.toAlgHom a = 0) (a : A.Carrier) :
    (A.quotientLift I hI f hf).toAlgHom (Ideal.Quotient.mk I a) = f.toAlgHom a := by sorry

theorem quotientLift_unique {B : Local O k ρ} (I : Ideal A.Carrier)
    (hI : I ≤ IsLocalRing.maximalIdeal A.Carrier) (f : Hom A.toLocal B)
    (hf : ∀ a ∈ I, f.toAlgHom a = 0) (g : Hom (A.quotient I hI).toLocal B)
    (hg : Hom.comp g (A.quotientMk I hI) = f) :
    g = A.quotientLift I hI f hf := by sorry

-- Complete.quotient_test_zero
example : Function.Bijective (A.quotientMk ⊥ bot_le).toAlgHom := by sorry
-- Complete.quotient_test_maximal
example : Function.Bijective (A.quotient (IsLocalRing.maximalIdeal A.Carrier) le_rfl).residue := by sorry
-- Complete.quotient_test_proper
example : ¬ (⊤ : Ideal A.Carrier) ≤ IsLocalRing.maximalIdeal A.Carrier := by sorry

def truncation (n : ℕ) : Artinian O k ρ where
  toLocal := (A.quotient (IsLocalRing.maximalIdeal A.Carrier ^ (n + 1)) (by sorry)).toLocal
  artinianRing := by sorry

def truncationMk (n : ℕ) : Hom A.toLocal (A.truncation n).toLocal :=
  A.quotientMk _ (by sorry)

def truncationTransition {i j : ℕ} (hij : i ≤ j) : Hom (A.truncation j).toLocal (A.truncation i).toLocal :=
  ⟨Ideal.Quotient.factorₐ O (show IsLocalRing.maximalIdeal A.Carrier ^ (j + 1) ≤
    IsLocalRing.maximalIdeal A.Carrier ^ (i + 1) from by sorry), by sorry⟩

theorem truncationTransition_comp {i j l : ℕ} (hij : i ≤ j) (hjl : j ≤ l) :
    Hom.comp (A.truncationTransition hij) (A.truncationTransition hjl) =
      A.truncationTransition (hij.trans hjl) := by sorry

-- Complete.truncation_test_zero
example : Function.Bijective (A.truncation 0).residue := by sorry
-- Complete.truncation_test_artinian
example (n : ℕ) : IsArtinianRing (A.truncation n).Carrier := by infer_instance
-- Complete.truncation_test_square_zero
example (n : ℕ) : Extension.SquareZero (A.truncationTransition (Nat.le_succ n)) := by sorry
end Complete


namespace Complete
variable (A : Complete O k ρ)

/-- The base object is available only when its actual residue is surjective. -/
def base [IsLocalRing O] [IsNoetherianRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    (hρ : Function.Surjective ρ) (hker : RingHom.ker ρ = IsLocalRing.maximalIdeal O) :
    Complete O k ρ := {
  Carrier := O
  residue := ρ
  residue_surjective := hρ
  ker_residue := hker
  residue_algebraMap := by sorry }

def powerSeries (n : ℕ) : Complete O k ρ := by
  letI : IsAdicComplete (IsLocalRing.maximalIdeal (MvPowerSeries (Fin n) A.Carrier))
      (MvPowerSeries (Fin n) A.Carrier) := by sorry
  exact {
    Carrier := MvPowerSeries (Fin n) A.Carrier
    residue := A.residue.comp MvPowerSeries.constantCoeff
    residue_surjective := by sorry
    ker_residue := by sorry
    residue_algebraMap := by sorry }

def powerSeriesC (n : ℕ) : Hom A.toLocal (A.powerSeries n).toLocal := {
  toAlgHom := {
    __ := MvPowerSeries.C
    commutes' := by sorry }
  residue_apply := by sorry }

def powerSeriesX (n : ℕ) (i : Fin n) : IsLocalRing.maximalIdeal (A.powerSeries n).Carrier :=
  ⟨MvPowerSeries.X i, by sorry⟩

theorem powerSeries_residue (n : ℕ) (f : MvPowerSeries (Fin n) A.Carrier) :
    (A.powerSeries n).residue f = A.residue (MvPowerSeries.constantCoeff f) := by sorry

-- Complete.powerSeries_test_empty
example : Function.Bijective (A.powerSeriesC 0).toAlgHom := by sorry
-- Complete.powerSeries_test_variable
example (n : ℕ) (i : Fin n) :
    (A.powerSeries n).residue (MvPowerSeries.X i) = 0 ∧
      (A.powerSeries n).residue 1 = 1 := by sorry
-- Complete.powerSeries_test_nonartinian
example : ¬ IsArtinianRing (MvPowerSeries (Fin 1) k) := by sorry

open scoped MvPowerSeries.WithPiTopology in
/-- Native evaluation with the genuinely maximal-adically small variable values. -/
def powerSeriesEval {B : Complete O k ρ} (f : Hom A.toLocal B.toLocal)
    {n : ℕ} (x : Fin n → IsLocalRing.maximalIdeal B.Carrier) :
    Hom (A.powerSeries n).toLocal B.toLocal := by
  letI : WithIdeal A.Carrier := ⟨IsLocalRing.maximalIdeal A.Carrier⟩
  letI : WithIdeal B.Carrier := ⟨IsLocalRing.maximalIdeal B.Carrier⟩
  letI : CompleteSpace B.Carrier := by sorry
  letI : T2Space B.Carrier := by sorry
  let e := MvPowerSeries.eval₂Hom (φ := f.toAlgHom.toRingHom) (a := fun i => (x i).val)
    (by sorry) (by sorry)
  exact { toAlgHom := { __ := e, commutes' := by sorry }
          residue_apply := by sorry }

theorem powerSeriesEval_C {B : Complete O k ρ} (f : Hom A.toLocal B.toLocal)
    {n : ℕ} (x : Fin n → IsLocalRing.maximalIdeal B.Carrier) (a : A.Carrier) :
    (A.powerSeriesEval f x).toAlgHom (MvPowerSeries.C a) = f.toAlgHom a := by sorry

theorem powerSeriesEval_X {B : Complete O k ρ} (f : Hom A.toLocal B.toLocal)
    {n : ℕ} (x : Fin n → IsLocalRing.maximalIdeal B.Carrier) (i : Fin n) :
    (A.powerSeriesEval f x).toAlgHom (MvPowerSeries.X i) = (x i).val := by sorry

theorem powerSeriesEval_unique {B : Complete O k ρ} (f : Hom A.toLocal B.toLocal)
    {n : ℕ} (x : Fin n → IsLocalRing.maximalIdeal B.Carrier)
    (e : Hom (A.powerSeries n).toLocal B.toLocal)
    (hc : Hom.comp e (A.powerSeriesC n) = f)
    (hx : ∀ i, e.toAlgHom (MvPowerSeries.X i) = (x i).val) :
    e = A.powerSeriesEval f x := by sorry

-- Complete.powerSeriesEval_test_empty
example {B : Complete O k ρ} (f : Hom A.toLocal B.toLocal) :
    Hom.comp (A.powerSeriesEval f (fun i : Fin 0 => Fin.elim0 i)) (A.powerSeriesC 0) = f := by sorry
-- Complete.powerSeriesEval_test_zero
example {B : Complete O k ρ} (f : Hom A.toLocal B.toLocal) (n : ℕ)
    (s : MvPowerSeries (Fin n) A.Carrier) :
    (A.powerSeriesEval f (fun _ => (0 : IsLocalRing.maximalIdeal B.Carrier))).toAlgHom s =
      f.toAlgHom (MvPowerSeries.constantCoeff s) := by sorry
-- Complete.powerSeriesEval_test_one_excluded
example {B : Complete O k ρ} (n : ℕ) (i : Fin n)
    (e : Hom (A.powerSeries n).toLocal B.toLocal) : e.toAlgHom (MvPowerSeries.X i) ≠ 1 := by sorry

variable (B : Complete O k ρ)

def tensorIdeal : Ideal (A.Carrier ⊗[O] B.Carrier) :=
  (IsLocalRing.maximalIdeal A.Carrier).map (Algebra.TensorProduct.includeLeft :
    A.Carrier →ₐ[O] A.Carrier ⊗[O] B.Carrier).toRingHom ⊔
  (IsLocalRing.maximalIdeal B.Carrier).map (Algebra.TensorProduct.includeRight :
    B.Carrier →ₐ[O] A.Carrier ⊗[O] B.Carrier).toRingHom

/-- The ordinary tensor residue map is the native tensor lift. -/
def tensorResidueOrdinary : A.Carrier ⊗[O] B.Carrier →+* k := by
  letI : Algebra O k := ρ.toAlgebra
  let a : A.Carrier →ₐ[O] k := { __ := A.residue, commutes' := by sorry }
  let b : B.Carrier →ₐ[O] k := { __ := B.residue, commutes' := by sorry }
  exact (Algebra.TensorProduct.lift a b (by sorry)).toRingHom

/-- This is only the CNL packing of AdicSpacesPartII:F0's native completion. -/
def tensor [Fact (Function.Surjective ρ)] : Complete O k ρ := by
  let T := A.Carrier ⊗[O] B.Carrier
  let J := A.tensorIdeal B
  letI : IsNoetherianRing (AdicCompletion J T) := by sorry
  letI : IsLocalRing (AdicCompletion J T) := by sorry
  letI : IsAdicComplete (IsLocalRing.maximalIdeal (AdicCompletion J T)) (AdicCompletion J T) := by sorry
  let q : T ⧸ J →+* k := Ideal.Quotient.lift J (A.tensorResidueOrdinary B) (by sorry)
  exact {
    Carrier := AdicCompletion J T
    residue := q.comp (AdicCompletion.evalOneₐ J).toRingHom
    residue_surjective := by sorry
    ker_residue := by sorry
    residue_algebraMap := by sorry }

variable [Fact (Function.Surjective ρ)]

def tensorInl : Hom A.toLocal (A.tensor B).toLocal := {
  toAlgHom := {
    __ := (algebraMap (A.Carrier ⊗[O] B.Carrier)
      (AdicCompletion (A.tensorIdeal B) (A.Carrier ⊗[O] B.Carrier))).comp
      (Algebra.TensorProduct.includeLeft : A.Carrier →ₐ[O] A.Carrier ⊗[O] B.Carrier).toRingHom
    commutes' := by sorry }
  residue_apply := by sorry }

def tensorInr : Hom B.toLocal (A.tensor B).toLocal := {
  toAlgHom := {
    __ := (algebraMap (A.Carrier ⊗[O] B.Carrier)
      (AdicCompletion (A.tensorIdeal B) (A.Carrier ⊗[O] B.Carrier))).comp
      (Algebra.TensorProduct.includeRight : B.Carrier →ₐ[O] A.Carrier ⊗[O] B.Carrier).toRingHom
    commutes' := by sorry }
  residue_apply := by sorry }

theorem tensorLift {D : Complete O k ρ} (a : Hom A.toLocal D.toLocal) (b : Hom B.toLocal D.toLocal) :
    ∃! e : Hom (A.tensor B).toLocal D.toLocal,
      Hom.comp e (A.tensorInl B) = a ∧ Hom.comp e (A.tensorInr B) = b := by sorry

theorem tensor_residue_tmul (a : A.Carrier) (b : B.Carrier) :
    (A.tensor B).residue (AdicCompletion.of (A.tensorIdeal B) (A.Carrier ⊗[O] B.Carrier)
      (a ⊗ₜ[O] b)) = A.residue a * B.residue b := by sorry

-- Complete.tensor_test_base
example [IsLocalRing O] [IsNoetherianRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    (hρ : Function.Surjective ρ) (hker : RingHom.ker ρ = IsLocalRing.maximalIdeal O) :
    Function.Bijective ((base hρ hker).tensorInr A).toAlgHom := by sorry
-- Complete.tensor_test_series: the joint presentation has both genuine variables.
example [IsLocalRing O] [IsNoetherianRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    (hρ : Function.Surjective ρ) (hker : RingHom.ker ρ = IsLocalRing.maximalIdeal O) :
    Nonempty ((((base hρ hker).powerSeries 1).tensor ((base hρ hker).powerSeries 1)).Carrier ≃ₐ[O]
      MvPowerSeries (Fin 2) O) := by sorry
-- Complete.tensor_test_artinian
example (D E : Artinian O k ρ) :
    Function.Bijective (algebraMap (D.toComplete.Carrier ⊗[O] E.toComplete.Carrier)
      (AdicCompletion (D.toComplete.tensorIdeal E.toComplete)
        (D.toComplete.Carrier ⊗[O] E.toComplete.Carrier))) := by sorry
end Complete


/-- Raw labelled coefficient data allow the base residue map to cease being surjective
when k is extended; this bundle is not renamed CNL_O(K) under the classical convention. -/
structure ResidueExtension (R : Complete O k ρ) {K : Type u} [Field K] (ι : k →+* K)
    extends Complete O K (ι.comp ρ) where
  map : R.Carrier →+* Carrier
  local_map : IsLocalHom map
  map_algebraMap : map.comp (algebraMap O R.Carrier) = algebraMap O Carrier
  residue_commutes : residue.comp map = ι.comp R.residue
  maximal_map : IsLocalRing.maximalIdeal Carrier = (IsLocalRing.maximalIdeal R.Carrier).map map
  faithful : letI := map.toAlgebra; Module.FaithfullyFlat R.Carrier Carrier

namespace ResidueExtension
variable (R : Complete O k ρ)

def identity : ResidueExtension R (RingHom.id k) := {
  toComplete := {
    toLocal := { R.toLocal with residue_algebraMap := by sorry }
    noetherianRing := R.noetherianRing
    adicComplete := R.adicComplete }
  map := RingHom.id R.Carrier
  local_map := by sorry
  map_algebraMap := by sorry
  residue_commutes := by sorry
  maximal_map := by sorry
  faithful := by sorry }

-- ResidueExtension.test_identity
example : (identity R).map = RingHom.id R.Carrier := by rfl
-- ResidueExtension.test_series: coefficient extension has the unramified maximal ideal.
example {K : Type u} [Field K] (ι : k →+* K) :
    let f : MvPowerSeries (Fin 1) k →+* MvPowerSeries (Fin 1) K := MvPowerSeries.map ι
    letI := f.toAlgebra
    Module.FaithfullyFlat (MvPowerSeries (Fin 1) k) (MvPowerSeries (Fin 1) K) ∧
    IsLocalRing.maximalIdeal (MvPowerSeries (Fin 1) K) =
      (IsLocalRing.maximalIdeal (MvPowerSeries (Fin 1) k)).map f ∧
    MvPowerSeries.constantCoeff.comp f = ι.comp MvPowerSeries.constantCoeff := by sorry
-- ResidueExtension.test_ramified: higher ramification fails the displayed maximal-ideal condition.
example {S : Type u} [CommRing S] [IsDomain S] [IsLocalRing S]
    (f : R.Carrier →+* S) (π : S) (hπ : Ideal.span {π} = IsLocalRing.maximalIdeal S)
    (hπ₀ : π ≠ 0) (hπu : ¬ IsUnit π) (e : ℕ) (he : 1 < e)
    (hmap : (IsLocalRing.maximalIdeal R.Carrier).map f = Ideal.span {π ^ e}) :
    (IsLocalRing.maximalIdeal R.Carrier).map f ≠ IsLocalRing.maximalIdeal S := by sorry
end ResidueExtension

/-- Strict means characteristic zero; p is a uniformizer, not merely a nonunit. -/
structure CohenRing (p : ℕ) (k : Type u) [Fact p.Prime] [Field k] [CharP k p] where
  Carrier : Type u
  [ring : CommRing Carrier]
  [domain : IsDomain Carrier]
  [dvr : IsDiscreteValuationRing Carrier]
  [charZero : CharZero Carrier]
  [complete : IsAdicComplete (IsLocalRing.maximalIdeal Carrier) Carrier]
  residue : Carrier →+* k
  residue_surjective : Function.Surjective residue
  ker_residue : RingHom.ker residue = IsLocalRing.maximalIdeal Carrier
  maximal_eq_span_p : IsLocalRing.maximalIdeal Carrier = Ideal.span {(p : Carrier)}
attribute [instance] CohenRing.ring CohenRing.domain CohenRing.dvr CohenRing.charZero CohenRing.complete

namespace CohenRing
variable {p : ℕ} [Fact p.Prime] [CharP k p] (C : CohenRing p k)

def residueEquiv : C.Carrier ⧸ Ideal.span {(p : C.Carrier)} ≃+* k :=
  RingEquiv.ofBijective
    (Ideal.Quotient.lift (Ideal.span {(p : C.Carrier)}) C.residue (by sorry)) (by sorry)

def toComplete : Complete C.Carrier k C.residue := {
  Carrier := C.Carrier
  residue := C.residue
  residue_surjective := C.residue_surjective
  ker_residue := C.ker_residue
  residue_algebraMap := by sorry }

def witt [PerfectRing k p] : CohenRing p k := {
  Carrier := WittVector p k
  charZero := by sorry
  complete := by sorry
  residue := WittVector.constantCoeff
  residue_surjective := by sorry
  ker_residue := by sorry
  maximal_eq_span_p := by sorry }

-- CohenRing.test_witt
example [PerfectRing k p] :
    (witt (p := p) (k := k)).Carrier = WittVector p k ∧
      IsLocalRing.maximalIdeal (WittVector p k) = Ideal.span {(p : WittVector p k)} := by sorry
-- CohenRing.test_truncated: p is nonzero and killed by p in C/(p²).
example :
    let Q := C.Carrier ⧸ Ideal.span {(p : C.Carrier) ^ 2}
    ¬ CharZero Q ∧ IsArtinianRing Q ∧ (p : Q) ≠ 0 ∧ (p : Q) ^ 2 = 0 := by sorry
-- CohenRing.test_ramified
example {S : Type u} [CommRing S] [IsDomain S] [IsLocalRing S]
    (π : S) (hπ : Ideal.span {π} = IsLocalRing.maximalIdeal S)
    (hπ₀ : π ≠ 0) (hπu : ¬ IsUnit π) (e : ℕ) (he : 1 < e)
    (hp : Ideal.span {(p : S)} = Ideal.span {π ^ e}) :
    IsLocalRing.maximalIdeal S ≠ Ideal.span {(p : S)} := by sorry
end CohenRing

namespace Hom
variable {A B C : Complete O k ρ}

/-- This predicate quantifies actual lifts of commuting residue-preserving diagrams. -/
def FormallySmooth (f : Hom A.toLocal B.toLocal) : Prop :=
  ∀ (D E : Artinian O k ρ) (e : Hom D.toLocal E.toLocal), Extension.Small e →
    ∀ (u : Hom A.toLocal D.toLocal) (v : Hom B.toLocal E.toLocal),
      comp e u = comp v f → ∃ w : Hom B.toLocal D.toLocal, comp e w = v ∧ comp w f = u

theorem FormallySmooth.lift {f : Hom A.toLocal B.toLocal} (hf : FormallySmooth f)
    (D E : Artinian O k ρ) (e : Hom D.toLocal E.toLocal) (he : Extension.Small e)
    (u : Hom A.toLocal D.toLocal) (v : Hom B.toLocal E.toLocal) (hc : comp e u = comp v f) :
    ∃ w : Hom B.toLocal D.toLocal, comp e w = v ∧ comp w f = u := by sorry

theorem formallySmooth_iff_surjections (f : Hom A.toLocal B.toLocal) : FormallySmooth f ↔
    ∀ (D E : Artinian O k ρ) (e : Hom D.toLocal E.toLocal), Function.Surjective e.toAlgHom →
      ∀ (u : Hom A.toLocal D.toLocal) (v : Hom B.toLocal E.toLocal),
        comp e u = comp v f → ∃ w : Hom B.toLocal D.toLocal, comp e w = v ∧ comp w f = u := by sorry

theorem FormallySmooth.comp {f : Hom A.toLocal B.toLocal} {g : Hom B.toLocal C.toLocal}
    (hf : FormallySmooth f) (hg : FormallySmooth g) : FormallySmooth (comp g f) := by sorry

-- Hom.formallySmooth_test_identity
example : FormallySmooth (id A.toLocal) := by sorry
-- Hom.formallySmooth_test_series
example (n : ℕ) : FormallySmooth (A.powerSeriesC n) := by sorry
-- Hom.formallySmooth_test_dual
example :
    let K := (Artinian.split (O := k) (ρ := RingHom.id k) 0).toComplete
    let D := (Artinian.split (O := k) (ρ := RingHom.id k) 1).toComplete
    let f : Hom K.toLocal D.toLocal := {
      toAlgHom := (TrivSqZeroExt.inlAlgHom k k (Fin 1 → k)).comp
        (TrivSqZeroExt.fstHom k k (Fin 0 → k))
      residue_apply := by sorry }
    ¬ FormallySmooth f := by sorry
end Hom


namespace Artinian
variable [Fact (Function.Surjective ρ)]
/-- A finite chain permits a zero-length chain and retains the endpoint isomorphism. -/
theorem small_factorization (A B : Artinian O k ρ) (f : Hom A.toLocal B.toLocal)
    (hf : Function.Surjective f.toAlgHom) :
    ∃ n : ℕ, ∃ C : ℕ → Artinian O k ρ,
      ∃ e : (i : ℕ) → Hom (C i).toLocal (C (i + 1)).toLocal,
      ∃ t : (i : ℕ) → Hom A.toLocal (C i).toLocal,
      ∃ g : Hom (C n).toLocal B.toLocal,
        C 0 = A ∧ HEq (t 0) (Hom.id A.toLocal) ∧
          Function.Bijective g.toAlgHom ∧ Hom.comp g (t n) = f ∧
          (∀ i < n, Extension.Small (e i)) ∧
          (∀ i < n, t (i + 1) = Hom.comp (e i) (t i)) := by sorry
end Artinian

namespace Complete
variable (A : Complete O k ρ)

theorem truncation_limit :
    ∃ e : A.Carrier ≃ₐ[O] AdicCompletion (IsLocalRing.maximalIdeal A.Carrier) A.Carrier,
      ∀ a : A.Carrier, ∀ n : ℕ,
        AdicCompletion.evalₐ (IsLocalRing.maximalIdeal A.Carrier) (n + 1) (e a) =
          Ideal.Quotient.mk (IsLocalRing.maximalIdeal A.Carrier ^ (n + 1)) a := by sorry

theorem powerSeries_presentation {B : Complete O k ρ} (f : Hom A.toLocal B.toLocal)
    {n : ℕ} (x : Fin n → IsLocalRing.maximalIdeal B.Carrier)
    (hx : Submodule.span k (Set.range (fun i => RelativeCotangent.mk f (x i))) = ⊤) :
    Function.Surjective (A.powerSeriesEval f x).toAlgHom := by sorry

variable (B : Complete O k ρ) [Fact (Function.Surjective ρ)]

theorem tensor_pushout (D : Complete O k ρ) :
    ∃ e : Hom (A.tensor B).toLocal D.toLocal ≃
      (Hom A.toLocal D.toLocal × Hom B.toLocal D.toLocal),
      ∀ h, e h = (Hom.comp h (A.tensorInl B), Hom.comp h (A.tensorInr B)) := by sorry

theorem tensor_symm :
    ∃ e : (A.tensor B).Carrier ≃ₐ[O] (B.tensor A).Carrier,
      (B.tensor A).residue.comp e.toRingHom = (A.tensor B).residue ∧
      ∀ a b, e (AdicCompletion.of (A.tensorIdeal B) (A.Carrier ⊗[O] B.Carrier) (a ⊗ₜ[O] b)) =
        AdicCompletion.of (B.tensorIdeal A) (B.Carrier ⊗[O] A.Carrier) (b ⊗ₜ[O] a) := by sorry

theorem tensor_assoc (C : Complete O k ρ) :
    ∃ e : ((A.tensor B).tensor C).Carrier ≃ₐ[O] (A.tensor (B.tensor C)).Carrier,
      (A.tensor (B.tensor C)).residue.comp e.toRingHom = ((A.tensor B).tensor C).residue := by sorry

/-- Joint quotient presentation, expressed using actual evaluation-kernel extensions. -/
theorem tensor_presentation [IsLocalRing O] [IsNoetherianRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    (hρ : Function.Surjective ρ) (hker : RingHom.ker ρ = IsLocalRing.maximalIdeal O)
    (r s : ℕ) (I : Ideal (MvPowerSeries (Fin r) O)) (J : Ideal (MvPowerSeries (Fin s) O))
    (hI : I ≤ IsLocalRing.maximalIdeal (MvPowerSeries (Fin r) O))
    (hJ : J ≤ IsLocalRing.maximalIdeal (MvPowerSeries (Fin s) O))
    (x : Fin r → Fin (r + s)) (y : Fin s → Fin (r + s))
    (hxy : Function.Bijective (Sum.elim x y)) :
    let C := base hρ hker
    let U := C.powerSeries (r + s)
    let fx := C.powerSeriesEval (C.powerSeriesC (r + s)) (fun i => C.powerSeriesX (r + s) (x i))
    let fy := C.powerSeriesEval (C.powerSeriesC (r + s)) (fun i => C.powerSeriesX (r + s) (y i))
    let K := I.map fx.toAlgHom.toRingHom ⊔ J.map fy.toAlgHom.toRingHom
    Nonempty ((((C.powerSeries r).quotient I hI).tensor ((C.powerSeries s).quotient J hJ)).Carrier ≃ₐ[O]
      U.Carrier ⧸ K) := by sorry

theorem tensor_finite_factor [IsNoetherianRing O] [Module.Finite O A.Carrier] :
    Function.Bijective (algebraMap (A.Carrier ⊗[O] B.Carrier)
      (AdicCompletion (A.tensorIdeal B) (A.Carrier ⊗[O] B.Carrier))) := by sorry
end Complete

namespace Hom
variable {A B : Complete O k ρ}

theorem surjective_iff_relative [IsLocalRing O] [IsNoetherianRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    (hρ : Function.Surjective ρ) (hker : RingHom.ker ρ = IsLocalRing.maximalIdeal O)
    (f : Hom A.toLocal B.toLocal) :
    Function.Surjective f.toAlgHom ↔
      (IsLocalRing.maximalIdeal A.Carrier).map f.toAlgHom.toRingHom =
        IsLocalRing.maximalIdeal B.Carrier := by sorry

/-- The equivalence is over A through f, stated by its restriction to coefficients. -/
theorem formallySmooth_iff_series (f : Hom A.toLocal B.toLocal) : FormallySmooth f ↔
    ∃ n : ℕ, ∃ e : (A.powerSeries n).Carrier ≃ₐ[O] B.Carrier,
      (∀ a : A.Carrier, e (MvPowerSeries.C a) = f.toAlgHom a) ∧
      B.residue.comp e.toRingHom = (A.powerSeries n).residue := by sorry

theorem compatible_truncation_lifts {D : Complete O k ρ} (f : Hom A.toLocal B.toLocal)
    (hf : FormallySmooth f) (u : Hom A.toLocal D.toLocal) (N : ℕ)
    (v₀ : Hom B.toLocal (D.truncation N).toLocal)
    (hc : comp v₀ f = comp (D.truncationMk N) u) :
    ∃ v : (n : ℕ) → Hom B.toLocal (D.truncation (N + n)).toLocal,
      HEq (v 0) v₀ ∧
      (∀ n, comp (v n) f = comp (D.truncationMk (N + n)) u) ∧
      (∀ n, comp (D.truncationTransition (show N + n ≤ N + (n + 1) by omega)) (v (n + 1)) = v n) := by sorry

theorem lift_complete_surjection {D E : Complete O k ρ} (f : Hom A.toLocal B.toLocal)
    (hf : FormallySmooth f) (e : Hom D.toLocal E.toLocal) (he : Function.Surjective e.toAlgHom)
    (u : Hom A.toLocal D.toLocal) (v : Hom B.toLocal E.toLocal) (hc : comp e u = comp v f) :
    ∃ w : Hom B.toLocal D.toLocal, comp e w = v ∧ comp w f = u := by sorry

/-- The finite-level strengthening retains both the prescribed quotient lift and map to E. -/
theorem lift_complete_surjection_prescribed {D E : Complete O k ρ} (f : Hom A.toLocal B.toLocal)
    (hf : FormallySmooth f) (e : Hom D.toLocal E.toLocal) (he : Function.Surjective e.toAlgHom)
    (u : Hom A.toLocal D.toLocal) (v : Hom B.toLocal E.toLocal) (hc : comp e u = comp v f)
    (N : ℕ) (w₀ : Hom B.toLocal (D.truncation N).toLocal)
    (hw₀ : comp w₀ f = comp (D.truncationMk N) u)
    (hcompat : ∀ b, ∃ d : D.Carrier,
      (D.truncationMk N).toAlgHom d = w₀.toAlgHom b ∧ e.toAlgHom d = v.toAlgHom b) :
    ∃ w : Hom B.toLocal D.toLocal,
      comp e w = v ∧ comp w f = u ∧ comp (D.truncationMk N) w = w₀ := by sorry
end Hom

namespace Completion
variable {R S : Type u} [CommRing R] [CommRing S]

theorem noetherian (I : Ideal R) (hI : I.FG) [IsNoetherianRing (R ⧸ I)] :
    IsNoetherianRing (AdicCompletion I R) := by sorry

theorem cofinal_ideals (I J : Ideal R)
    (hIJ : ∀ n : ℕ, ∃ m : ℕ, J ^ m ≤ I ^ n)
    (hJI : ∀ n : ℕ, ∃ m : ℕ, I ^ m ≤ J ^ n) :
    ∃ e : AdicCompletion I R ≃+* AdicCompletion J R,
      ∀ r : R, e (AdicCompletion.of I R r) = AdicCompletion.of J R r := by sorry

theorem quotient_finite_ideal [IsLocalRing R]
    [IsNoetherianRing (AdicCompletion (IsLocalRing.maximalIdeal R) R)]
    (I : Ideal R) (hI : I.FG) :
    let m := IsLocalRing.maximalIdeal R
    let IH := I.map (algebraMap R (AdicCompletion m R))
    let mQ := m.map (Ideal.Quotient.mk I)
    Nonempty ((AdicCompletion m R ⧸ IH) ≃+* AdicCompletion mQ (R ⧸ I)) := by sorry

theorem artinian_quotients_of_noetherian [IsLocalRing R]
    [IsNoetherianRing (AdicCompletion (IsLocalRing.maximalIdeal R) R)] (n : ℕ) (hn : 0 < n) :
    IsArtinianRing (R ⧸ IsLocalRing.maximalIdeal R ^ n) := by sorry

theorem flat_algebra [IsNoetherianRing R] [Algebra R S] [Module.Flat R S] (I : Ideal R) :
    Module.Flat R (AdicCompletion I S) := by sorry

theorem faithful_algebra [IsNoetherianRing R] [Algebra R S] [Module.FaithfullyFlat R S]
    (I : Ideal R) (hI : I ≤ Ideal.jacobson (⊥ : Ideal R)) :
    Module.FaithfullyFlat R (AdicCompletion I S) := by sorry

theorem flat_finite_compare [IsNoetherianRing R] [Algebra R S] [Module.Flat R S]
    (I : Ideal R) (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M] :
    ∃ e : (AdicCompletion I S) ⊗[R] M ≃ₗ[R] AdicCompletion I (S ⊗[R] M),
      ∀ s : S, ∀ m : M,
        e (AdicCompletion.of I S s ⊗ₜ[R] m) =
          AdicCompletion.of I (S ⊗[R] M) (s ⊗ₜ[R] m) := by sorry

theorem finite_domain_local [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R] [Algebra R S] [Module.Finite R S] [IsDomain S] :
    ∃ h : IsLocalRing S, letI := h; IsAdicComplete (IsLocalRing.maximalIdeal S) S := by sorry
end Completion

namespace ResidueExtension
variable (R : Complete O k ρ) {K : Type u} [Field K] (ι : k →+* K)

theorem exists_complete : Nonempty (ResidueExtension R ι) := by sorry

theorem finite_iff (E : ResidueExtension R ι) (M : Type u) [AddCommGroup M] [Module R.Carrier M] :
    letI := E.map.toAlgebra
    Module.Finite R.Carrier M ↔ Module.Finite E.Carrier (E.Carrier ⊗[R.Carrier] M) := by sorry
end ResidueExtension

namespace ResidueExtension
/-- The general source statement also starts with a base that is not yet complete. -/
theorem «exists» {R K : Type u} [CommRing R] [IsLocalRing R]
    [IsNoetherianRing R] [Field K] (q : R →+* k)
    (hq : Function.Surjective q) (hker : RingHom.ker q = IsLocalRing.maximalIdeal R)
    (ι : k →+* K) :
    ∃ S : Type u, ∃ _ : CommRing S, ∃ _ : IsLocalRing S,
      ∃ _ : IsNoetherianRing S, ∃ _ : IsAdicComplete (IsLocalRing.maximalIdeal S) S,
        ∃ f : R →+* S, ∃ qS : S →+* K,
          IsLocalHom f ∧ Function.Surjective qS ∧
          RingHom.ker qS = IsLocalRing.maximalIdeal S ∧ qS.comp f = ι.comp q ∧
          (IsLocalRing.maximalIdeal R).map f = IsLocalRing.maximalIdeal S ∧
          (letI := f.toAlgebra; Module.FaithfullyFlat R S) := by sorry
end ResidueExtension

namespace CohenRing
variable {p : ℕ} [Fact p.Prime] [CharP k p]

theorem «exists» : Nonempty (CohenRing p k) := by sorry

theorem coefficient_map_exists (C : CohenRing p k) (R : Complete O k ρ) :
    ∃ f : C.Carrier →+* R.Carrier,
      IsLocalHom f ∧ R.residue.comp f = C.residue ∧
      @Continuous C.Carrier R.Carrier (IsLocalRing.maximalIdeal C.Carrier).adicTopology
        (IsLocalRing.maximalIdeal R.Carrier).adicTopology f := by sorry

theorem coefficient_map_injective (C : CohenRing p k) (R : Complete O k ρ)
    (hp : ∀ r : R.Carrier, (p : R.Carrier) * r = 0 → r = 0)
    (f : C.Carrier →+* R.Carrier) (hf : R.residue.comp f = C.residue) :
    Function.Injective f := by sorry

theorem presentation (C : CohenRing p k) (R : Complete O k ρ) :
    ∃ n : ℕ, ∃ f : MvPowerSeries (Fin n) C.Carrier →+* R.Carrier,
      Function.Surjective f ∧ ∀ s,
        R.residue (f s) = C.residue (MvPowerSeries.constantCoeff s) := by sorry

theorem equal_characteristic_section {R : Type u} [CommRing R] [IsLocalRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R] [CharP R p]
    (q : R →+* k) (hq : Function.Surjective q) (hker : RingHom.ker q = IsLocalRing.maximalIdeal R) :
    ∃ s : k →+* R, q.comp s = RingHom.id k := by sorry
end CohenRing



namespace Complete
variable (B : Complete O k ρ)

/-- Exactness is on actual finite-module tensor maps, with the endpoint conditions explicit. -/
theorem tensor_finite_exact [Module.Flat O B.Carrier]
    (M₁ M₂ M₃ : Type u) [AddCommGroup M₁] [AddCommGroup M₂] [AddCommGroup M₃]
    [Module O M₁] [Module O M₂] [Module O M₃]
    [Module.Finite O M₁] [Module.Finite O M₂] [Module.Finite O M₃]
    (f : M₁ →ₗ[O] M₂) (g : M₂ →ₗ[O] M₃)
    (hf : Function.Injective f) (hg : Function.Surjective g) (he : Function.Exact f g) :
    Function.Injective (f.lTensor B.Carrier) ∧
      Function.Exact (f.lTensor B.Carrier) (g.lTensor B.Carrier) ∧
      Function.Surjective (g.lTensor B.Carrier) ∧
      Module.Finite B.Carrier (B.Carrier ⊗[O] M₂) ∧
      IsAdicComplete (IsLocalRing.maximalIdeal B.Carrier) (B.Carrier ⊗[O] M₂) := by sorry

variable (C : Complete O k ρ) [Fact (Function.Surjective ρ)]

theorem tensor_cotangent [IsLocalRing O] [IsNoetherianRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    (hρ : Function.Surjective ρ) (hker : RingHom.ker ρ = IsLocalRing.maximalIdeal O) :
    let A := base hρ hker
    let b : Hom A.toLocal B.toLocal := ⟨Algebra.ofId O B.Carrier, by sorry⟩
    let c : Hom A.toLocal C.toLocal := ⟨Algebra.ofId O C.Carrier, by sorry⟩
    let t := Hom.comp (B.tensorInl C) b
    ∃ e : (RelativeCotangent b × RelativeCotangent c) ≃ₗ[k] RelativeCotangent t,
      (∀ x : IsLocalRing.maximalIdeal B.Carrier,
        e (RelativeCotangent.mk b x, 0) =
          RelativeCotangent.mk t ⟨(B.tensorInl C).toAlgHom x, by sorry⟩) ∧
      (∀ y : IsLocalRing.maximalIdeal C.Carrier,
        e (0, RelativeCotangent.mk c y) =
          RelativeCotangent.mk t ⟨(B.tensorInr C).toAlgHom y, by sorry⟩) := by sorry
end Complete

namespace RelativeCotangent
variable {A B : Local O k ρ}

theorem dual_derivations (f : Hom A B) :
    letI : Algebra A B := f.toAlgHom.toRingHom.toAlgebra
    letI : Module A k := Module.compHom k A.residue
    letI : Module B k := Module.compHom k B.residue
    letI : SMulCommClass A k k := by sorry
    letI : SMulCommClass k B k := by sorry
    ∃ e : Derivation A B k ≃ₗ[k] (RelativeCotangent f →ₗ[k] k),
      ∀ d : Derivation A B k, ∀ x : IsLocalRing.maximalIdeal B,
        e d (mk f x) = d x.val := by sorry
end RelativeCotangent

namespace ResidueExtension
/-- The intermediate flat local algebra has no Noetherianity assertion. -/
theorem uncompleted_exists {R K : Type u} [CommRing R] [IsLocalRing R] [Field K]
    (q : R →+* k) (hq : Function.Surjective q)
    (hker : RingHom.ker q = IsLocalRing.maximalIdeal R) (ι : k →+* K) :
    ∃ (S : Type u) (hS : CommRing S) (hlocal : IsLocalRing S)
      (f : R →+* S) (qS : S →+* K),
      letI := f.toAlgebra
      Module.Flat R S ∧ IsLocalHom f ∧ Function.Surjective qS ∧
        RingHom.ker qS = IsLocalRing.maximalIdeal S ∧
        qS.comp f = ι.comp q ∧
        IsLocalRing.maximalIdeal S = (IsLocalRing.maximalIdeal R).map f := by sorry
end ResidueExtension

namespace CohenRing
variable {p : ℕ} [Fact p.Prime] [CharP k p]

/-- The map is to the native Witt ring of the native perfect closure, and is a choice. -/
theorem perfect_hull_map (C : CohenRing p k) :
    ∃ f : C.Carrier →+* WittVector p (PerfectClosure k p),
      Function.Injective f ∧ IsLocalHom f ∧
        WittVector.constantCoeff.comp f = (PerfectClosure.of k p).comp C.residue ∧
        (letI := f.toAlgebra; Module.FaithfullyFlat C.Carrier (WittVector p (PerfectClosure k p))) ∧
        @Continuous C.Carrier (WittVector p (PerfectClosure k p))
          (IsLocalRing.maximalIdeal C.Carrier).adicTopology
          (IsLocalRing.maximalIdeal (WittVector p (PerfectClosure k p))).adicTopology f := by sorry

/-- This comparison is given the chosen Cohen embedding, rather than hidden representative data. -/
theorem perfect_residue_basechange (C : CohenRing p k) (R : Complete O k ρ)
    (a : C.Carrier →+* R.Carrier) (ha : R.residue.comp a = C.residue)
    (b : C.Carrier →+* WittVector p (PerfectClosure k p))
    (hb : WittVector.constantCoeff.comp b = (PerfectClosure.of k p).comp C.residue)
    (hflat : letI := b.toAlgebra; Module.FaithfullyFlat C.Carrier (WittVector p (PerfectClosure k p))) :
    letI := a.toAlgebra
    letI := b.toAlgebra
    let T := R.Carrier ⊗[C.Carrier] WittVector p (PerfectClosure k p)
    let J := (IsLocalRing.maximalIdeal R.Carrier).map
      (Algebra.TensorProduct.includeLeft : R.Carrier →ₐ[C.Carrier] T).toRingHom
    ∃ E : ResidueExtension R (PerfectClosure.of k p),
      ∃ e : E.Carrier ≃+* AdicCompletion J T,
        ∀ r : R.Carrier,
          e (E.map r) = AdicCompletion.of J T
            ((Algebra.TensorProduct.includeLeft : R.Carrier →ₐ[C.Carrier] T) r) := by sorry

/-- Arbitrary complete targets and the prescribed square are retained;
separability is expressed by native geometric reducedness of the field extension. -/
theorem compatible_over_separable {K : Type u} [Field K] [CharP K p]
    (ι : k →+* K) (hsep : letI := ι.toAlgebra; Algebra.IsGeometricallyReduced k K)
    (C : CohenRing p k) (D : CohenRing p K)
    (R : Complete O k ρ) (S : Complete O K (ι.comp ρ))
    [CharZero R.Carrier] [CharZero S.Carrier]
    (β : R.Carrier →+* S.Carrier) (hβ : IsLocalHom β)
    (hres : S.residue.comp β = ι.comp R.residue)
    (a : C.Carrier →+* R.Carrier) (ha : R.residue.comp a = C.residue) :
    ∃ b : D.Carrier →+* S.Carrier, ∃ c : C.Carrier →+* D.Carrier,
      Function.Injective b ∧ IsLocalHom b ∧ IsLocalHom c ∧
        S.residue.comp b = D.residue ∧ D.residue.comp c = ι.comp C.residue ∧
        β.comp a = b.comp c := by sorry
end CohenRing

/- Signatures that need supplier types rather than proof holes:
TauCeti.Coeff.Complete.modularCurves_witt_comparison needs the upstream ModularCurves7D category.
TauCeti.Coeff.Complete.tensor_isDomain_at_regular_point needs R03.3's regular-local predicate
and rational-point localization interface. Its exact arbitrary-DVR statement is in the packet.
TauCeti.Coeff.Completion.hom_pro_comparison and TauCeti.Coeff.Completion.hom_lim_one_zero
need E2's pro-system and lim-one interfaces; ordinary completion is not used as a substitute.
TauCeti.Coeff.Completion.ocohen_basechange and TauCeti.Coeff.Completion.finite_residue_basechange
need a relative O-Cohen bundle and the coefficient-diagonal and
pseudocompact comparison interfaces identified in gap 7. These omitted signatures are
recorded in prototypeAudit; no placeholder mathematical predicates are introduced.
-/


namespace Completion
variable {R S : Type u} [CommRing R] [CommRing S]

/-- The fixed product is indexed by the actual primes over p; original S-elements fix the map. -/
theorem finite_algebra_product [IsNoetherianRing R] [Algebra R S] [Module.Finite R S]
    (p : Ideal R) [p.IsPrime] :
    let A := Localization.AtPrime p
    let AH := AdicCompletion (IsLocalRing.maximalIdeal A) A
    let Q := {q : PrimeSpectrum S // q.asIdeal.comap (algebraMap R S) = p}
    letI : (q : Q) → q.val.asIdeal.IsPrime := fun q => q.val.isPrime
    ∃ e : (AH ⊗[R] S) ≃ₐ[R]
      ((q : Q) → AdicCompletion
        (IsLocalRing.maximalIdeal (Localization.AtPrime q.val.asIdeal))
        (Localization.AtPrime q.val.asIdeal)),
      ∀ s : S, ∀ q : Q,
        e (1 ⊗ₜ[R] s) q = AdicCompletion.of
          (IsLocalRing.maximalIdeal (Localization.AtPrime q.val.asIdeal))
          (Localization.AtPrime q.val.asIdeal) (algebraMap S _ s) := by sorry

/-- Corrected BIP23 Lemma3.35: the residue extension over the contracted prime is finite. -/
theorem local_field_basechange [Finite k] (R : Complete k k (RingHom.id k))
    (A : Type u) [CommRing A] [Algebra R.Carrier A] [Algebra k A]
    [IsScalarTower k R.Carrier A] [Algebra.FiniteType R.Carrier A]
    (p : Ideal A) [p.IsPrime]
    (hdim : ringKrullDim (R.Carrier ⧸ p.comap (algebraMap R.Carrier A)) = 1)
    (ι₀ : (p.comap (algebraMap R.Carrier A)).ResidueField →+* p.ResidueField)
    (hι₀ : ∀ r : R.Carrier,
      ι₀ (algebraMap R.Carrier (p.comap (algebraMap R.Carrier A)).ResidueField r) =
        algebraMap A p.ResidueField (algebraMap R.Carrier A r))
    (hfinite : letI := ι₀.toAlgebra;
      Module.Finite (p.comap (algebraMap R.Carrier A)).ResidueField p.ResidueField) :
    let K := p.ResidueField
    letI : Algebra k K := ((algebraMap A K).comp (algebraMap k A)).toAlgebra
    letI : IsScalarTower k k K := by sorry
    let f : A →ₐ[k] K := { __ := algebraMap A K, commutes' := by sorry }
    let T := K ⊗[k] A
    let q := RingHom.ker (Algebra.TensorProduct.lift (Algebra.ofId k K) f (by sorry)).toRingHom
    letI : q.IsPrime := by sorry
    let L := Localization.AtPrime p
    let LH := AdicCompletion (IsLocalRing.maximalIdeal L) L
    let U := Localization.AtPrime q
    let UH := AdicCompletion (IsLocalRing.maximalIdeal U) U
    Nonempty (UH ≃+* MvPowerSeries (Fin 1) LH) := by sorry
end Completion

end TauCeti.Coeff
