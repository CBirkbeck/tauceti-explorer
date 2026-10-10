/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names and
signatures. Every proof hole marks planned work; this file claims no implementation.
Supplier interfaces below restate only the typed boundaries used from R03.1 and SF.4.
The full natural socle-extension obstruction interface is requested from SF.4.
-/
import Mathlib.RingTheory.AdicCompletion.Noetherian
import Mathlib.RingTheory.AdicCompletion.Topology
import Mathlib.RingTheory.MvPowerSeries.Evaluation
import Mathlib.RingTheory.MvPowerSeries.Inverse
import Mathlib.RingTheory.MvPowerSeries.Ideal
import Mathlib.RingTheory.Filtration
import Mathlib.RingTheory.Nakayama
import Mathlib.RingTheory.Ideal.Cotangent
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.TensorProduct.Basis
import Mathlib.LinearAlgebra.Dual.Lemmas
import Mathlib.CategoryTheory.Equivalence
import Mathlib.GroupTheory.FreeGroup.Basic
import Mathlib.CategoryTheory.Types.Basic
import Mathlib.Algebra.TrivSqZeroExt.Basic
import TauCeti.RingTheory.Derivation.DualNumber
import TauCeti.Topology.Algebra.Group.Profinite.MaximalProP
import Mathlib.Topology.Algebra.Category.ProfiniteGrp.Completion
import Mathlib.Topology.Instances.Discrete
import Mathlib.Topology.Instances.Matrix
import Mathlib.Data.ZMod.Basic

noncomputable section
open CategoryTheory
open scoped TensorProduct
universe u v
set_option linter.unusedVariables false
namespace TauCeti.DeformationAlgebra

namespace Supplier
variable (Λ k : Type u) [CommRing Λ] [Field k] (ρ : Λ →+* k)
/-- R03.1's actual labelled local coefficient object. -/
structure Local where
  Carrier : Type u
  [ring : CommRing Carrier]
  [localRing : IsLocalRing Carrier]
  [algebra : Algebra Λ Carrier]
  residue : Carrier →+* k
  surjective : Function.Surjective residue
  kernel : RingHom.ker residue = IsLocalRing.maximalIdeal Carrier
  base_residue : residue.comp (algebraMap Λ Carrier) = ρ
attribute [instance] Local.ring Local.localRing Local.algebra
instance : CoeSort (Local Λ k ρ) (Type u) := ⟨Local.Carrier⟩
structure Artinian extends Local Λ k ρ where
  [artinian : IsArtinianRing Carrier]
attribute [instance] Artinian.artinian
structure Complete extends Local Λ k ρ where
  [noetherian : IsNoetherianRing Carrier]
  [complete : IsAdicComplete (IsLocalRing.maximalIdeal Carrier) Carrier]
attribute [instance] Complete.noetherian Complete.complete
variable {Λ k ρ}
structure Hom (A B : Local Λ k ρ) where
  alg : A →ₐ[Λ] B
  residue : ∀ x, B.residue (alg x) = A.residue x
namespace Hom
def id (A : Local Λ k ρ) : Hom A A := ⟨AlgHom.id Λ A, fun _ => rfl⟩
def comp {A B C : Local Λ k ρ} (g : Hom B C) (f : Hom A B) : Hom A C :=
  ⟨g.alg.comp f.alg, fun x => (g.residue _).trans (f.residue _)⟩
theorem ext {A B : Local Λ k ρ} {f g : Hom A B} (h : f.alg = g.alg) : f = g := by sorry
end Hom
instance : CategoryTheory.Category (Artinian Λ k ρ) where
  Hom A B := Hom A.toLocal B.toLocal
  id A := Hom.id A.toLocal
  comp f g := Hom.comp g f
  id_comp := by intros; apply Hom.ext; ext; rfl
  comp_id := by intros; apply Hom.ext; ext; rfl
  assoc := by intros; apply Hom.ext; ext; rfl

instance : CategoryTheory.Category (Complete Λ k ρ) where
  Hom A B := Hom A.toLocal B.toLocal
  id A := Hom.id A.toLocal
  comp f g := Hom.comp g f
  id_comp := by intros; apply Hom.ext; ext; rfl
  comp_id := by intros; apply Hom.ext; ext; rfl
  assoc := by intros; apply Hom.ext; ext; rfl

/-- SF.4's augmentation presentation, without imposing the already consequential kernel identity. -/
structure ClassicalArtin where
  Carrier : Type u
  [ring : CommRing Carrier]
  [localRing : IsLocalRing Carrier]
  [algebra : Algebra Λ Carrier]
  [artinian : IsArtinianRing Carrier]
  augmentation : Carrier →+* k
  surjective : Function.Surjective augmentation
  base_residue : augmentation.comp (algebraMap Λ Carrier) = ρ
attribute [instance] ClassicalArtin.ring ClassicalArtin.localRing
  ClassicalArtin.algebra ClassicalArtin.artinian
structure ClassicalHom (A B : ClassicalArtin (Λ := Λ) (k := k) (ρ := ρ)) where
  alg : A.Carrier →ₐ[Λ] B.Carrier
  augmentation : ∀ x, B.augmentation (alg x) = A.augmentation x
instance : CategoryTheory.Category (ClassicalArtin (Λ := Λ) (k := k) (ρ := ρ)) where
  Hom A B := ClassicalHom A B
  id A := ⟨AlgHom.id Λ A.Carrier, fun _ => rfl⟩
  comp f g := ⟨g.alg.comp f.alg, fun x => (g.augmentation _).trans (f.augmentation _)⟩
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry

/-- SF.4's complete augmentation boundary, without an Artinian hypothesis. -/
structure ClassicalComplete where
  Carrier : Type u
  [ring : CommRing Carrier]
  [localRing : IsLocalRing Carrier]
  [algebra : Algebra Λ Carrier]
  [noetherian : IsNoetherianRing Carrier]
  [complete : IsAdicComplete (IsLocalRing.maximalIdeal Carrier) Carrier]
  augmentation : Carrier →+* k
  surjective : Function.Surjective augmentation
  base_residue : augmentation.comp (algebraMap Λ Carrier) = ρ
attribute [instance] ClassicalComplete.ring ClassicalComplete.localRing
  ClassicalComplete.algebra ClassicalComplete.noetherian ClassicalComplete.complete
structure ClassicalCompleteHom
    (A B : ClassicalComplete (Λ := Λ) (k := k) (ρ := ρ)) where
  alg : A.Carrier →ₐ[Λ] B.Carrier
  augmentation : ∀ x, B.augmentation (alg x) = A.augmentation x
instance : CategoryTheory.Category (ClassicalComplete (Λ := Λ) (k := k) (ρ := ρ)) where
  Hom A B := ClassicalCompleteHom A B
  id A := ⟨AlgHom.id Λ A.Carrier, fun _ => rfl⟩
  comp f g := ⟨g.alg.comp f.alg, fun x => (g.augmentation _).trans (f.augmentation _)⟩
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry

variable (Λ k ρ) [IsLocalRing Λ] [IsNoetherianRing Λ]
  [IsAdicComplete (IsLocalRing.maximalIdeal Λ) Λ]
  [Fact (Function.Surjective ρ)] [Fact (RingHom.ker ρ = IsLocalRing.maximalIdeal Λ)]
def base : Complete Λ k ρ := {
  Carrier := Λ
  residue := ρ
  surjective := Fact.out
  kernel := Fact.out
  base_residue := by simp }
variable {Λ k ρ}
def series (d : ℕ) : Complete Λ k ρ := {
  Carrier := MvPowerSeries (Fin d) Λ
  noetherian := by sorry
  complete := by sorry
  residue := ρ.comp MvPowerSeries.constantCoeff
  surjective := by sorry
  kernel := by sorry
  base_residue := by sorry }
def baseMap (R : Local Λ k ρ) : Hom (base Λ k ρ).toLocal R :=
  ⟨Algebra.ofId Λ R, by sorry⟩
/-- R03.1 relative cotangent, with the denominator inside the maximal ideal. -/
def RelativeCotangent (R : Local Λ k ρ) : Type u :=
  (IsLocalRing.maximalIdeal R) ⧸
    Submodule.comap (IsLocalRing.maximalIdeal R).subtype
      (IsLocalRing.maximalIdeal R ^ 2 ⊔
        (IsLocalRing.maximalIdeal Λ).map (algebraMap Λ R))
instance (R : Local Λ k ρ) : AddCommGroup (RelativeCotangent R) := by
  unfold RelativeCotangent; infer_instance
instance (R : Local Λ k ρ) : Module k (RelativeCotangent R) := by sorry
def cotClass (R : Local Λ k ρ) (x : IsLocalRing.maximalIdeal R) : RelativeCotangent R :=
  Submodule.Quotient.mk x
instance (R : Complete Λ k ρ) : Module.Finite k (RelativeCotangent R.toLocal) := by sorry

def represented (R : Complete Λ k ρ) : Artinian Λ k ρ ⥤ Type u where
  obj A := Hom R.toLocal A.toLocal
  map f := TypeCat.ofHom (fun g => Hom.comp f g)
  map_id := by sorry
  map_comp := by sorry

def residueObject : Artinian Λ k ρ := by
  letI : Algebra Λ k := ρ.toAlgebra
  exact {
    Carrier := k
    residue := RingHom.id k
    surjective := Function.surjective_id
    kernel := by sorry
    base_residue := by sorry }
def dualObject : Artinian Λ k ρ := by
  letI : Algebra Λ k := ρ.toAlgebra
  letI : IsLocalRing (TrivSqZeroExt k k) := by sorry
  letI : IsArtinianRing (TrivSqZeroExt k k) := by sorry
  exact {
    Carrier := TrivSqZeroExt k k
    residue := (TrivSqZeroExt.fstHom Λ k k).toRingHom
    surjective := by sorry
    kernel := by sorry
    base_residue := by sorry }

/-- All finite socle extensions, including zero kernel; supplied by the SF.4 request. -/
structure SocleExtension where
  B : Artinian Λ k ρ
  A : Artinian Λ k ρ
  map : Hom B.toLocal A.toLocal
  surjective : Function.Surjective map.alg
  killed : ∀ b ∈ IsLocalRing.maximalIdeal B.Carrier,
    ∀ x ∈ RingHom.ker map.alg.toRingHom, b * x = 0
abbrev SocleExtension.Kernel (e : SocleExtension (Λ := Λ) (k := k) (ρ := ρ)) :=
  RingHom.ker e.map.alg.toRingHom
instance (e : SocleExtension (Λ := Λ) (k := k) (ρ := ρ)) : Module k e.Kernel := by sorry
instance (e : SocleExtension (Λ := Λ) (k := k) (ρ := ρ)) : Module.Finite k e.Kernel := by sorry
structure ExtensionSquare (e e' : SocleExtension (Λ := Λ) (k := k) (ρ := ρ)) where
  upstairs : Hom e.B.toLocal e'.B.toLocal
  downstairs : Hom e.A.toLocal e'.A.toLocal
  commutes : Hom.comp e'.map upstairs = Hom.comp downstairs e.map
def ExtensionSquare.kernelMap {e e' : SocleExtension (Λ := Λ) (k := k) (ρ := ρ)}
    (s : ExtensionSquare e e') : e.Kernel →ₗ[k] e'.Kernel := {
  toFun x := ⟨s.upstairs.alg x, by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry }

/-- Genuine lifting squares, not an opaque smoothness flag. -/
def SmoothNat {F G : Artinian Λ k ρ ⥤ Type u} (α : F ⟶ G) : Prop :=
  ∀ (e : SocleExtension (Λ := Λ) (k := k) (ρ := ρ)) (x : F.obj e.A) (y : G.obj e.B),
    α.app e.A x = G.map e.map y →
    ∃ z : F.obj e.B, F.map e.map z = x ∧ α.app e.B z = y
/-- Smoothness on socle extensions is equivalent to all Artinian surjections by factorization. -/
structure Hull (R : Complete Λ k ρ) (F : Artinian Λ k ρ ⥤ Type u) where
  map : represented R ⟶ F
  smooth : SmoothNat map
  tangent_bijective : Function.Bijective (map.app dualObject)

/-- The full requested SF.4 interface: tensor values, exact lifting criterion and kernel naturality. -/
structure NaturalObstruction (F : Artinian Λ k ρ ⥤ Type u)
    (O : Type u) [AddCommGroup O] [Module k O] where
  obstruction : ∀ (e : SocleExtension (Λ := Λ) (k := k) (ρ := ρ)), F.obj e.A → O ⊗[k] e.Kernel
  complete : ∀ e x, obstruction e x = 0 ↔ ∃ y : F.obj e.B, F.map e.map y = x
  natural : ∀ (e e' : SocleExtension (Λ := Λ) (k := k) (ρ := ρ))
    (s : ExtensionSquare e e') (x : F.obj e.A),
    TensorProduct.map (LinearMap.id : O →ₗ[k] O) s.kernelMap (obstruction e x) =
      obstruction e' (F.map s.downstairs x)
def cotMap {A B : Local Λ k ρ} (f : Hom A B) :
    RelativeCotangent A →ₗ[k] RelativeCotangent B := by sorry
end Supplier

open Supplier CategoryTheory
variable (Λ k : Type u) [CommRing Λ] [Field k] (ρ : Λ →+* k)
  [IsLocalRing Λ] [IsNoetherianRing Λ]
  [IsAdicComplete (IsLocalRing.maximalIdeal Λ) Λ]
  [Fact (Function.Surjective ρ)] [Fact (RingHom.ker ρ = IsLocalRing.maximalIdeal Λ)]

/-- R03.2/coefficient-and-functor-comparison. -/
def coefficientEquivalence : Artinian Λ k ρ ≌ ClassicalArtin (Λ := Λ) (k := k) (ρ := ρ) := by sorry

def completeCoefficientEquivalence :
    Complete Λ k ρ ≌ ClassicalComplete (Λ := Λ) (k := k) (ρ := ρ) := by sorry

def tangentEquivRelativeDual (R : Complete Λ k ρ) :
    (represented R).obj (dualObject (Λ := Λ) (k := k) (ρ := ρ)) ≃
      (RelativeCotangent R.toLocal →ₗ[k] k) := by sorry

variable {Λ k ρ}
structure MinimalPresentation (R : Complete Λ k ρ) where
  d : ℕ
  map : Hom (series (Λ := Λ) (k := k) (ρ := ρ) d).toLocal R.toLocal
  surjective : Function.Surjective map.alg
  minimal : RingHom.ker map.alg.toRingHom ≤
    IsLocalRing.maximalIdeal (MvPowerSeries (Fin d) Λ) ^ 2 ⊔
      (IsLocalRing.maximalIdeal Λ).map MvPowerSeries.C

def minimalPresentation (R : Complete Λ k ρ) {d : ℕ}
    (b : Module.Basis (Fin d) k (RelativeCotangent R.toLocal))
    (x : Fin d → IsLocalRing.maximalIdeal R.Carrier)
    (hx : ∀ i, cotClass R.toLocal (x i) = b i) : MinimalPresentation R := by sorry

theorem minimalPresentation_X (R : Complete Λ k ρ) {d : ℕ}
    (b : Module.Basis (Fin d) k (RelativeCotangent R.toLocal))
    (x : Fin d → IsLocalRing.maximalIdeal R.Carrier)
    (hx : ∀ i, cotClass R.toLocal (x i) = b i) :
    ∃ h : (minimalPresentation R b x hx).d = d,
    ∀ i, (minimalPresentation R b x hx).map.alg
      (MvPowerSeries.X (Fin.cast h.symm i)) = (x i).val := by sorry

theorem minimalPresentation_surjective (R : Complete Λ k ρ) (P : MinimalPresentation R) :
    Function.Surjective P.map.alg := by sorry

def minimalPresentation_quotient (R : Complete Λ k ρ) (P : MinimalPresentation R) :
    ((series (Λ := Λ) (k := k) (ρ := ρ) P.d).Carrier ⧸ RingHom.ker P.map.alg.toRingHom)
      ≃ₐ[Λ] R.Carrier := by sorry

theorem minimalPresentation_ker_le (R : Complete Λ k ρ) {d : ℕ}
    (q : Hom (series (Λ := Λ) (k := k) (ρ := ρ) d).toLocal R.toLocal)
    (hq : Function.Surjective q.alg) :
    (RingHom.ker q.alg.toRingHom ≤
      IsLocalRing.maximalIdeal (MvPowerSeries (Fin d) Λ) ^ 2 ⊔
        (IsLocalRing.maximalIdeal Λ).map MvPowerSeries.C) ↔
    Function.Bijective (Supplier.cotMap q) := by sorry

theorem minimalPresentation_variable_count (R : Complete Λ k ρ) (P : MinimalPresentation R) :
    P.d = Module.finrank k (RelativeCotangent R.toLocal) := by sorry

-- TauCeti.DeformationAlgebra.minimalPresentation_base
example : ∃ P : MinimalPresentation (base Λ k ρ), P.d = 0 ∧ Function.Bijective P.map.alg := by sorry

/-- Field test objects use the same genuine coefficient structure. -/
def fieldBase (K : Type u) [Field K] : Complete K K (RingHom.id K) := {
  Carrier := K
  residue := RingHom.id K
  surjective := Function.surjective_id
  kernel := by sorry
  base_residue := by sorry }
def fieldSeries (K : Type u) [Field K] (d : ℕ) : Local K K (RingHom.id K) := {
  Carrier := MvPowerSeries (Fin d) K
  residue := MvPowerSeries.constantCoeff
  surjective := by sorry
  kernel := by sorry
  base_residue := by sorry }

def residueComplete : Complete Λ k ρ := by
  letI : Algebra Λ k := ρ.toAlgebra
  exact {
    Carrier := k
    residue := RingHom.id k
    surjective := Function.surjective_id
    kernel := by sorry
    base_residue := by sorry }
-- TauCeti.DeformationAlgebra.minimalPresentation_residue
example (π : Λ) (hm : IsLocalRing.maximalIdeal Λ = Ideal.span {π})
    (hn : π ∉ IsLocalRing.maximalIdeal Λ ^ 2) :
    ∃ P : MinimalPresentation (residueComplete (Λ := Λ) (k := k) (ρ := ρ)),
      P.d = 0 ∧ ¬ RingHom.ker ρ ≤ IsLocalRing.maximalIdeal Λ ^ 2 := by sorry

-- TauCeti.DeformationAlgebra.minimalPresentation_extra_variable
example (K : Type u) [Field K] :
    ∃ q : Hom (fieldSeries K 2) (fieldSeries K 1),
      Function.Surjective q.alg ∧
      q.alg (MvPowerSeries.X (0 : Fin 2)) = MvPowerSeries.X (0 : Fin 1) ∧
      q.alg (MvPowerSeries.X (1 : Fin 2)) = 0 ∧
      ¬ Function.Bijective (Supplier.cotMap q) := by sorry

/-- Actual quotient of the ideal module, not J/J². -/
def RelationSpace (A : Local Λ k ρ) (J : Ideal A.Carrier) : Type u :=
  J ⧸ (IsLocalRing.maximalIdeal A.Carrier • (⊤ : Submodule A.Carrier J))
instance (A : Local Λ k ρ) (J : Ideal A.Carrier) : AddCommGroup (RelationSpace A J) := by
  unfold RelationSpace; infer_instance
instance (A : Local Λ k ρ) (J : Ideal A.Carrier) : Module A.Carrier (RelationSpace A J) := by
  unfold RelationSpace; infer_instance
instance (A : Local Λ k ρ) (J : Ideal A.Carrier) : Module k (RelationSpace A J) := by sorry

def relationClass (A : Local Λ k ρ) (J : Ideal A.Carrier) : J →ₗ[A.Carrier] RelationSpace A J :=
  (IsLocalRing.maximalIdeal A.Carrier • (⊤ : Submodule A.Carrier J)).mkQ

theorem relationClass_eq_zero (A : Local Λ k ρ) (J : Ideal A.Carrier) (x : J) :
    relationClass A J x = 0 ↔
      x ∈ IsLocalRing.maximalIdeal A.Carrier • (⊤ : Submodule A.Carrier J) := by sorry

def relationLinearEquiv (A : Local Λ k ρ) (J : Ideal A.Carrier)
    (I : Type u) [AddCommGroup I] [Module k I] :
    letI : Module A.Carrier I := Module.compHom I A.residue
    (RelationSpace A J →ₗ[k] I) ≃ (J →ₗ[A.Carrier] I) := by sorry

theorem relationSpace_finite (A : Local Λ k ρ) [IsNoetherianRing A.Carrier]
    (J : Ideal A.Carrier) : Module.Finite k (RelationSpace A J) := by sorry
instance (A : Local Λ k ρ) [IsNoetherianRing A.Carrier] (J : Ideal A.Carrier) :
    Module.Finite k (RelationSpace A J) := relationSpace_finite A J

theorem relation_basis_generates (A : Local Λ k ρ) [IsNoetherianRing A.Carrier]
    (J : Ideal A.Carrier) {r : ℕ} (b : Module.Basis (Fin r) k (RelationSpace A J))
    (x : Fin r → J) (hx : ∀ i, relationClass A J (x i) = b i) :
    Ideal.span (Set.range (fun i => (x i).val)) = J := by sorry

theorem relation_generators_span (A : Local Λ k ρ) [IsNoetherianRing A.Carrier]
    (J : Ideal A.Carrier) {r : ℕ} (x : Fin r → J)
    (hx : Ideal.span (Set.range (fun i => (x i).val)) = J) :
    Submodule.span k (Set.range (fun i => relationClass A J (x i))) = ⊤ := by sorry

-- TauCeti.DeformationAlgebra.RelationSpace_zero
example (A : Local Λ k ρ) : Module.finrank k (RelationSpace A ⊥) = 0 := by sorry
-- TauCeti.DeformationAlgebra.RelationSpace_square
example (K : Type u) [Field K] :
    Module.finrank K (RelationSpace (fieldSeries K 1)
      (Ideal.span {(MvPowerSeries.X (0 : Fin 1)) ^ 2})) = 1 := by sorry
-- TauCeti.DeformationAlgebra.RelationSpace_square_maximal
example (K : Type u) [Field K] :
    Module.finrank K (RelationSpace (fieldSeries K 2)
      (IsLocalRing.maximalIdeal (MvPowerSeries (Fin 2) K) ^ 2)) = 3 := by sorry
-- TauCeti.DeformationAlgebra.RelationSpace_nonminimal
example (K : Type u) [Field K] :
    Module.finrank K (RelationSpace (fieldSeries K 1)
      (Ideal.span {MvPowerSeries.X (0 : Fin 1)})) = 1 := by sorry

namespace Supplier
/-- Packing a native ideal quotient, imported from R03.1/complete-quotient. -/
def quotientComplete (S : Complete Λ k ρ) (J : Ideal S.Carrier)
    (hJ : J ≤ IsLocalRing.maximalIdeal S.Carrier) : Complete Λ k ρ := by
  letI : IsLocalRing (S.Carrier ⧸ J) := by sorry
  letI : IsNoetherianRing (S.Carrier ⧸ J) := by sorry
  letI : IsAdicComplete (IsLocalRing.maximalIdeal (S.Carrier ⧸ J)) (S.Carrier ⧸ J) := by sorry
  exact {
    Carrier := S.Carrier ⧸ J
    residue := Ideal.Quotient.lift J S.residue (by sorry)
    surjective := by sorry
    kernel := by sorry
    base_residue := by sorry }
def quotientArtin (S : Complete Λ k ρ) (J : Ideal S.Carrier) (N : ℕ)
    (hN : 0 < N) (hpow : IsLocalRing.maximalIdeal S.Carrier ^ N ≤ J)
    (hJ : J ≤ IsLocalRing.maximalIdeal S.Carrier) : Artinian Λ k ρ := by
  letI : IsLocalRing (S.Carrier ⧸ J) := by sorry
  letI : IsArtinianRing (S.Carrier ⧸ J) := by sorry
  exact {
    Carrier := S.Carrier ⧸ J
    residue := Ideal.Quotient.lift J S.residue (by sorry)
    surjective := by sorry
    kernel := by sorry
    base_residue := by sorry }
end Supplier

section MatrixCoordinates
variable {d n : ℕ} (L : Fin d → Matrix.GeneralLinearGroup (Fin n) Λ)
    (W : Set (FreeGroup (Fin d)))
abbrev MatrixSeries (Λ : Type u) [CommRing Λ] (d n : ℕ) :=
  MvPowerSeries (Fin d × Fin n × Fin n) Λ

def framedSeries : Complete Λ k ρ := {
  Carrier := MatrixSeries Λ d n
  noetherian := by sorry
  complete := by sorry
  residue := ρ.comp MvPowerSeries.constantCoeff
  surjective := by sorry
  kernel := by sorry
  base_residue := by sorry }

def framedUniversalMatrix (i : Fin d) : Matrix.GeneralLinearGroup (Fin n) (MatrixSeries Λ d n) :=
  Matrix.GeneralLinearGroup.mk''
    (fun a b => MvPowerSeries.C ((L i).val a b) + MvPowerSeries.X (i,a,b)) (by sorry)

theorem framedUniversalMatrix_entry (i : Fin d) (a b : Fin n) :
    (framedUniversalMatrix L i).val a b =
      MvPowerSeries.C ((L i).val a b) + MvPowerSeries.X (i,a,b) := by sorry

def framedIdeal : Ideal (MatrixSeries Λ d n) :=
  Ideal.span {z | ∃ w ∈ W, ∃ a b : Fin n,
    z = ((FreeGroup.lift (framedUniversalMatrix L) w).val - 1) a b}

variable (hW : ∀ w ∈ W, FreeGroup.lift (fun i => Matrix.GeneralLinearGroup.map ρ (L i)) w = 1)
def framedMatrixRing (hW : ∀ w ∈ W,
    FreeGroup.lift (fun i => Matrix.GeneralLinearGroup.map ρ (L i)) w = 1) : Complete Λ k ρ :=
  quotientComplete (framedSeries (Λ := Λ) (k := k) (ρ := ρ) (d := d) (n := n))
    (framedIdeal L W) (by sorry)

structure FramedMatrixPoint (A : Local Λ k ρ) where
  matrices : Fin d → Matrix.GeneralLinearGroup (Fin n) A.Carrier
  residual : ∀ i, Matrix.GeneralLinearGroup.map A.residue (matrices i) =
    Matrix.GeneralLinearGroup.map ρ (L i)
  words : ∀ w ∈ W, FreeGroup.lift matrices w = 1

def framedMatrixPointsEquiv (A : Artinian Λ k ρ) :
    Hom (framedMatrixRing L W hW).toLocal A.toLocal ≃ FramedMatrixPoint L W A.toLocal := by sorry

def framedPointMap {A B : Local Λ k ρ} (f : Hom A B)
    (x : FramedMatrixPoint L W A) : FramedMatrixPoint L W B := {
  matrices := fun i => Matrix.GeneralLinearGroup.map f.alg.toRingHom (x.matrices i)
  residual := by sorry
  words := by sorry }

theorem framedMatrixPointsEquiv_natural {A B : Artinian Λ k ρ}
    (f : Hom A.toLocal B.toLocal) (x : Hom (framedMatrixRing L W hW).toLocal A.toLocal) :
    framedMatrixPointsEquiv L W hW B (Hom.comp f x) =
      framedPointMap L W f (framedMatrixPointsEquiv L W hW A x) := by sorry

theorem framedMatrixRing_empty_relations : framedIdeal L ∅ = ⊥ := by sorry

theorem framedMatrixRing_tangent_le :
    Module.finrank k (RelativeCotangent (framedMatrixRing L W hW).toLocal) ≤ d * n^2 := by sorry

theorem framedUniversalMatrix_quotient_words (w : FreeGroup (Fin d)) (hw : w ∈ W) :
    Matrix.GeneralLinearGroup.map (Ideal.Quotient.mk (framedIdeal L W))
      (FreeGroup.lift (framedUniversalMatrix L) w) = 1 := by sorry

-- TauCeti.DeformationAlgebra.framedMatrixRing_free
example : Nonempty ((framedMatrixRing (k := k) (ρ := ρ) L ∅ (by simp)).Carrier ≃ₐ[Λ] MatrixSeries Λ d n) := by sorry
-- TauCeti.DeformationAlgebra.framedMatrixRing_no_generators
example (L₀ : Fin 0 → Matrix.GeneralLinearGroup (Fin n) Λ) :
    Nonempty ((framedMatrixRing (k := k) (ρ := ρ) L₀ ∅ (by simp)).Carrier ≃ₐ[Λ] Λ) := by sorry
end MatrixCoordinates

-- TauCeti.DeformationAlgebra.framedMatrixRing_involution_char_two
example (K : Type u) [Field K] [CharP K 2] :
    let L : Fin 1 → Matrix.GeneralLinearGroup (Fin 1) K := fun _ => 1
    let W : Set (FreeGroup (Fin 1)) := {FreeGroup.of 0 ^ 2}
    letI : Fact (Function.Surjective (RingHom.id K)) := ⟨Function.surjective_id⟩
    letI : Fact (RingHom.ker (RingHom.id K) = IsLocalRing.maximalIdeal K) := ⟨by sorry⟩
    Nonempty ((framedMatrixRing (k := K) (ρ := RingHom.id K) L W (by sorry)).Carrier ≃ₐ[K]
      (MvPowerSeries (Fin 1) K ⧸ Ideal.span {(MvPowerSeries.X (0 : Fin 1) : MvPowerSeries (Fin 1) K)^2})) := by sorry
-- TauCeti.DeformationAlgebra.framedMatrixRing_involution_char_ne_two
example (K : Type u) [Field K] (h2 : (2 : K) ≠ 0) :
    let L : Fin 1 → Matrix.GeneralLinearGroup (Fin 1) K := fun _ => 1
    let W : Set (FreeGroup (Fin 1)) := {FreeGroup.of 0 ^ 2}
    letI : Fact (Function.Surjective (RingHom.id K)) := ⟨Function.surjective_id⟩
    letI : Fact (RingHom.ker (RingHom.id K) = IsLocalRing.maximalIdeal K) := ⟨by sorry⟩
    Nonempty ((framedMatrixRing (k := K) (ρ := RingHom.id K) L W (by sorry)).Carrier ≃ₐ[K] K) := by sorry

section Relations
variable (R : Complete Λ k ρ) (P : MinimalPresentation R)
abbrev presentationSeries := series (Λ := Λ) (k := k) (ρ := ρ) P.d
abbrev presentationIdeal := RingHom.ker P.map.alg.toRingHom
abbrev presentationRelations := RelationSpace (presentationSeries R P).toLocal (presentationIdeal R P)

/-- One evaluated lift of the variable tuple, with an actual coefficient-algebra map. -/
structure PresentationLift (e : SocleExtension (Λ := Λ) (k := k) (ρ := ρ))
    (f : Hom R.toLocal e.A.toLocal) where
  evaluation : Hom (presentationSeries R P).toLocal e.B.toLocal
  commutes : Hom.comp e.map evaluation = Hom.comp f P.map

def presentationObstruction (e : SocleExtension (Λ := Λ) (k := k) (ρ := ρ))
    (f : Hom R.toLocal e.A.toLocal) : presentationRelations R P →ₗ[k] e.Kernel := by sorry

theorem presentationObstruction_apply (e : SocleExtension (Λ := Λ) (k := k) (ρ := ρ))
    (f : Hom R.toLocal e.A.toLocal) (l : PresentationLift R P e f) (j : presentationIdeal R P) :
    (presentationObstruction R P e f (relationClass (presentationSeries R P).toLocal _ j)).val =
      l.evaluation.alg j := by sorry

theorem presentationObstruction_independent (e : SocleExtension (Λ := Λ) (k := k) (ρ := ρ))
    (f : Hom R.toLocal e.A.toLocal) (l l' : PresentationLift R P e f) (j : presentationIdeal R P) :
    l.evaluation.alg j = l'.evaluation.alg j := by sorry

theorem presentationObstruction_zero_iff (e : SocleExtension (Λ := Λ) (k := k) (ρ := ρ))
    (f : Hom R.toLocal e.A.toLocal) : presentationObstruction R P e f = 0 ↔
    ∃ g : Hom R.toLocal e.B.toLocal, Hom.comp e.map g = f := by sorry

theorem presentationObstruction_natural
    (e e' : SocleExtension (Λ := Λ) (k := k) (ρ := ρ)) (s : ExtensionSquare e e')
    (f : Hom R.toLocal e.A.toLocal) :
    s.kernelMap.comp (presentationObstruction R P e f) =
      presentationObstruction R P e' (Hom.comp s.downstairs f) := by sorry

def presentationObstruction_tensor : NaturalObstruction (represented R)
    (Module.Dual k (presentationRelations R P)) := by sorry

def relationTensorEvaluation (I : Type u) [AddCommGroup I] [Module k I] :
    (Module.Dual k (presentationRelations R P) ⊗[k] I) ≃ₗ[k]
      (presentationRelations R P →ₗ[k] I) := by sorry

theorem presentationObstruction_tensor_apply
    (e : SocleExtension (Λ := Λ) (k := k) (ρ := ρ))
    (f : Hom R.toLocal e.A.toLocal) :
    relationTensorEvaluation R P e.Kernel
      ((presentationObstruction_tensor R P).obstruction e f) =
        presentationObstruction R P e f := by sorry

-- TauCeti.DeformationAlgebra.presentationObstruction_zero_relations
example (hJ : presentationIdeal R P = ⊥)
    (e : SocleExtension (Λ := Λ) (k := k) (ρ := ρ)) (f : Hom R.toLocal e.A.toLocal) :
    presentationObstruction R P e f = 0 := by sorry

/-- The algebraic hypotheses on the finite truncation exponent. -/
def AdmissibleExponent (N : ℕ) : Prop := 0 < N ∧
  presentationIdeal R P ⊓ IsLocalRing.maximalIdeal (presentationSeries R P).Carrier ^ N ≤
    IsLocalRing.maximalIdeal (presentationSeries R P).Carrier * presentationIdeal R P

theorem relationTestExponent_exists : ∃ N, AdmissibleExponent R P N := by sorry

def relationTestExtension (N : ℕ) (hN : AdmissibleExponent R P N) :
    SocleExtension (Λ := Λ) (k := k) (ρ := ρ) := by
  let S := presentationSeries R P
  let J := presentationIdeal R P
  let m := IsLocalRing.maximalIdeal S.Carrier
  exact {
    B := quotientArtin S (m * J ⊔ m ^ N) N hN.1 (by sorry) (by sorry)
    A := quotientArtin S (J ⊔ m ^ N) N hN.1 (by sorry) (by sorry)
    map := by sorry
    surjective := by sorry
    killed := by sorry }

def relationTestKernelEquiv (N : ℕ) (hN : AdmissibleExponent R P N) :
    (relationTestExtension R P N hN).Kernel ≃ₗ[k] presentationRelations R P := by sorry

def relationTestPoint (N : ℕ) (hN : AdmissibleExponent R P N) :
    Hom R.toLocal (relationTestExtension R P N hN).A.toLocal := by sorry

theorem relationTestExtension_obstruction (N : ℕ) (hN : AdmissibleExponent R P N) :
    (relationTestKernelEquiv R P N hN).toLinearMap.comp
      (presentationObstruction R P (relationTestExtension R P N hN) (relationTestPoint R P N hN)) =
      LinearMap.id := by sorry

def relationTestPushout (N : ℕ) (hN : AdmissibleExponent R P N)
    (ell : Module.Dual k (presentationRelations R P)) :
    SocleExtension (Λ := Λ) (k := k) (ρ := ρ) := by
  let e := relationTestExtension R P N hN
  let L := ell.comp (relationTestKernelEquiv R P N hN).toLinearMap
  let Q : Ideal e.B.Carrier := {
    carrier := {b | ∃ x : e.Kernel, x.val = b ∧ L x = 0}
    zero_mem' := by sorry
    add_mem' := by sorry
    smul_mem' := by sorry }
  letI : IsLocalRing (e.B.Carrier ⧸ Q) := by sorry
  letI : IsArtinianRing (e.B.Carrier ⧸ Q) := by sorry
  exact {
    B := {
      Carrier := e.B.Carrier ⧸ Q
      residue := Ideal.Quotient.lift Q e.B.residue (by sorry)
      surjective := by sorry
      kernel := by sorry
      base_residue := by sorry }
    A := e.A
    map := by sorry
    surjective := by sorry
    killed := by sorry }

def relationTestPushoutKernelEquiv (N : ℕ) (hN : AdmissibleExponent R P N)
    (ell : Module.Dual k (presentationRelations R P)) (hell : ell ≠ 0) :
    (relationTestPushout R P N hN ell).Kernel ≃ₗ[k] k := by sorry

def relationTestPushoutSquare (N : ℕ) (hN : AdmissibleExponent R P N)
    (ell : Module.Dual k (presentationRelations R P)) :
    ExtensionSquare (relationTestExtension R P N hN) (relationTestPushout R P N hN ell) := by sorry

theorem relationTestPushoutSquare_kernel (N : ℕ) (hN : AdmissibleExponent R P N)
    (ell : Module.Dual k (presentationRelations R P)) (hell : ell ≠ 0) :
    (relationTestPushoutKernelEquiv R P N hN ell hell).toLinearMap.comp
      (relationTestPushoutSquare R P N hN ell).kernelMap =
        ell.comp (relationTestKernelEquiv R P N hN).toLinearMap := by sorry

theorem relationTestPushout_no_lift (N : ℕ) (hN : AdmissibleExponent R P N)
    (ell : Module.Dual k (presentationRelations R P)) (hell : ell ≠ 0) :
    ¬ ∃ g : Hom R.toLocal (relationTestPushout R P N hN ell).B.toLocal,
      Hom.comp (relationTestPushout R P N hN ell).map g =
        Hom.comp (relationTestPushoutSquare R P N hN ell).downstairs (relationTestPoint R P N hN) := by sorry

theorem relationTestExtension_cofinal (N N' : ℕ)
    (hN : AdmissibleExponent R P N) (hN' : AdmissibleExponent R P N') (hle : N ≤ N') :
    ∃ s : ExtensionSquare (relationTestExtension R P N' hN') (relationTestExtension R P N hN),
      (relationTestKernelEquiv R P N hN).toLinearMap.comp s.kernelMap =
        (relationTestKernelEquiv R P N' hN').toLinearMap := by sorry

-- TauCeti.DeformationAlgebra.relationTestExtension_zero
example (hJ : presentationIdeal R P = ⊥) (N : ℕ) (hN : AdmissibleExponent R P N) :
    Function.Bijective (relationTestExtension R P N hN).map.alg := by sorry

variable {F : Artinian Λ k ρ ⥤ Type u} (H : Hull R F)
    {O : Type u} [AddCommGroup O] [Module k O] [Module.Finite k O]
    (ob : NaturalObstruction F O)

def relationDualInjection (H : Hull R F) (ob : NaturalObstruction F O) : Module.Dual k (presentationRelations R P) →ₗ[k] O := by sorry

include H ob in
theorem relation_bound :
    Function.Injective (relationDualInjection R P H ob) ∧
    Module.finrank k (presentationRelations R P) ≤ Module.finrank k O := by sorry

include H ob in
theorem zero_obstruction_hull_series (hO : Module.finrank k O = 0) :
    Nonempty (R.Carrier ≃ₐ[Λ] MvPowerSeries (Fin P.d) Λ) := by sorry

include H ob in
theorem relation_bound_generators :
    ∃ r ≤ Module.finrank k O, ∃ f : Fin r → (presentationSeries R P).Carrier,
      Ideal.span (Set.range f) = presentationIdeal R P := by sorry
end Relations

section ContinuousFrames
variable (Γ : Type v) [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
    [CompactSpace Γ] [T2Space Γ] [TotallyDisconnectedSpace Γ] [Finite k]
    {d n : ℕ} (g : Fin d → Γ)
    (hgen : (Subgroup.closure (Set.range g)).topologicalClosure = ⊤)
    (bar : Γ →* Matrix.GeneralLinearGroup (Fin n) k)
    (hbar : @Continuous Γ (Matrix.GeneralLinearGroup (Fin n) k) _ ⊥ bar)

/-- The topology on universal matrices is the induced product of the ring's adic topology. -/
abbrev adicGLTopology (A : Local Λ k ρ) (n : ℕ) :
    TopologicalSpace (Matrix.GeneralLinearGroup (Fin n) A.Carrier) := by
  letI : TopologicalSpace A.Carrier := (IsLocalRing.maximalIdeal A.Carrier).adicTopology
  exact TopologicalSpace.induced Units.val inferInstance

/-- An actual continuous homomorphism in the fixed residual basis. -/
def ContinuousFramedPoint (A : Local Λ k ρ) : Type (max u v) :=
  {r : Γ →* Matrix.GeneralLinearGroup (Fin n) A.Carrier //
    @Continuous Γ (Matrix.GeneralLinearGroup (Fin n) A.Carrier) _ ⊥ r ∧
      ∀ x, Matrix.GeneralLinearGroup.map A.residue (r x) = bar x}

def continuousFramedRing (g : Fin d → Γ)
    (hgen : (Subgroup.closure (Set.range g)).topologicalClosure = ⊤)
    (bar : Γ →* Matrix.GeneralLinearGroup (Fin n) k)
    (hbar : @Continuous Γ (Matrix.GeneralLinearGroup (Fin n) k) _ ⊥ bar) :
    Complete Λ k ρ := by sorry

local notation "RC" => continuousFramedRing (Λ := Λ) (k := k) (ρ := ρ) Γ g hgen bar hbar

def continuousFramedUniversal : Γ →* Matrix.GeneralLinearGroup (Fin n) (RC).Carrier := by sorry

theorem continuousFramedUniversal_continuous :
    @Continuous Γ (Matrix.GeneralLinearGroup (Fin n) (RC).Carrier) _
      (adicGLTopology (RC).toLocal n) (continuousFramedUniversal Γ g hgen bar hbar) := by sorry

theorem continuousFramedUniversal_residue (x : Γ) :
    Matrix.GeneralLinearGroup.map (RC).residue
      (continuousFramedUniversal Γ g hgen bar hbar x) = bar x := by sorry

def continuousFramedPointsEquiv (A : Artinian Λ k ρ) :
    Hom (RC).toLocal A.toLocal ≃ ContinuousFramedPoint Γ bar A.toLocal := by sorry

theorem continuousFramedPointsEquiv_apply (A : Artinian Λ k ρ)
    (f : Hom (RC).toLocal A.toLocal) (x : Γ) :
    (continuousFramedPointsEquiv Γ g hgen bar hbar A f).val x =
      Matrix.GeneralLinearGroup.map f.alg.toRingHom
        (continuousFramedUniversal Γ g hgen bar hbar x) := by sorry

def continuousFrameMap {A B : Artinian Λ k ρ} (f : Hom A.toLocal B.toLocal)
    (x : ContinuousFramedPoint Γ bar A.toLocal) : ContinuousFramedPoint Γ bar B.toLocal :=
  ⟨(Matrix.GeneralLinearGroup.map f.alg.toRingHom).comp x.val, by sorry⟩

theorem continuousFramedPointsEquiv_natural {A B : Artinian Λ k ρ}
    (f : Hom A.toLocal B.toLocal) (x : Hom (RC).toLocal A.toLocal) :
    continuousFramedPointsEquiv Γ g hgen bar hbar B (Hom.comp f x) =
      continuousFrameMap Γ bar f (continuousFramedPointsEquiv Γ g hgen bar hbar A x) := by sorry

theorem continuousFramedRing_tangent_le :
    Module.finrank k (RelativeCotangent (RC).toLocal) ≤ d * n^2 := by sorry

theorem continuousFramedRing_choice_iso {d' : ℕ} (g' : Fin d' → Γ)
    (hg' : (Subgroup.closure (Set.range g')).topologicalClosure = ⊤) :
    ∃! e : (RC).Carrier ≃ₐ[Λ]
        (continuousFramedRing (Λ := Λ) (ρ := ρ) Γ g' hg' bar hbar).Carrier,
      ∀ x, Matrix.GeneralLinearGroup.map e.toAlgHom.toRingHom
          (continuousFramedUniversal Γ g hgen bar hbar x) =
        continuousFramedUniversal Γ g' hg' bar hbar x := by sorry

/-- Literal maximal-pro-p-kernel reduction; the arithmetic Φ_p predicate is not redefined. -/
theorem continuousFramed_proP_reduction (p : ℕ) [Fact p.Prime] [CharP k p]
    (A : Artinian Λ k ρ) (x : ContinuousFramedPoint Γ bar A.toLocal) :
    (TauCeti.proPKernel p bar.ker).map bar.ker.subtype ≤ x.val.ker := by sorry

theorem continuousFramed_proP_represents (p : ℕ) [Fact p.Prime] [CharP k p]
    (hfinite : ∃ s : Finset (bar.ker ⧸ TauCeti.proPKernel p bar.ker),
      (Subgroup.closure (s : Set (bar.ker ⧸ TauCeti.proPKernel p bar.ker))).topologicalClosure = ⊤) :
    ∃ R : Complete Λ k ρ,
      ∃ e : ∀ A : Artinian Λ k ρ, Hom R.toLocal A.toLocal ≃ ContinuousFramedPoint Γ bar A.toLocal,
        ∀ (A B : Artinian Λ k ρ) (f : Hom A.toLocal B.toLocal) (x : Hom R.toLocal A.toLocal),
          e B (Hom.comp f x) = continuousFrameMap Γ bar f (e A x) := by sorry
end ContinuousFrames

/-- Supplier boundary for ProfiniteProPGroups Layer 4: the native completion carrier. -/
abbrev FreeProfinite (d : ℕ) :=
  ProfiniteGrp.ProfiniteCompletion.completion (GrpCat.of (FreeGroup (Fin d)))
def freeProfiniteGenerator (d : ℕ) (i : Fin d) : FreeProfinite d :=
  ProfiniteGrp.ProfiniteCompletion.etaFn (GrpCat.of (FreeGroup (Fin d))) (FreeGroup.of i)

-- TauCeti.DeformationAlgebra.continuousFramedRing_trivial
example [Finite k] {n : ℕ} :
    let gen : Fin 0 → PUnit := Fin.elim0
    let bar : PUnit →* Matrix.GeneralLinearGroup (Fin n) k := 1
    Nonempty ((continuousFramedRing (Λ := Λ) (k := k) (ρ := ρ)
      PUnit gen (by sorry) bar (by sorry)).Carrier ≃ₐ[Λ] Λ) := by sorry
-- TauCeti.DeformationAlgebra.continuousFramedRing_free
example [Finite k] (d n : ℕ)
    (bar : FreeProfinite d →* Matrix.GeneralLinearGroup (Fin n) k)
    (hbar : @Continuous (FreeProfinite d) _ _ ⊥ bar) :
    Nonempty ((continuousFramedRing (Λ := Λ) (k := k) (ρ := ρ)
      (FreeProfinite d) (freeProfiniteGenerator d) (by sorry) bar hbar).Carrier ≃ₐ[Λ]
      MatrixSeries Λ d n) := by sorry
-- TauCeti.DeformationAlgebra.continuousFramedRing_involution
example (K : Type u) [Field K] [Finite K] [CharP K 2] :
    let Γ := Multiplicative (ZMod 2)
    letI : TopologicalSpace Γ := ⊥
    letI : IsTopologicalGroup Γ := by sorry
    letI : CompactSpace Γ := by sorry
    letI : TotallyDisconnectedSpace Γ := by sorry
    letI : Fact (Function.Surjective (RingHom.id K)) := ⟨Function.surjective_id⟩
    letI : Fact (RingHom.ker (RingHom.id K) = IsLocalRing.maximalIdeal K) := ⟨by sorry⟩
    let gen : Fin 1 → Γ := fun _ => Multiplicative.ofAdd 1
    let bar : Γ →* Matrix.GeneralLinearGroup (Fin 1) K := 1
    Nonempty ((continuousFramedRing (Λ := K) (k := K) (ρ := RingHom.id K)
      Γ gen (by sorry) bar (by sorry)).Carrier ≃ₐ[K]
      (MvPowerSeries (Fin 1) K ⧸ Ideal.span
        {(MvPowerSeries.X (0 : Fin 1) : MvPowerSeries (Fin 1) K)^2})) := by sorry

/-- The ring lifting predicate supplied by R03.1, expanded as actual coefficient diagrams. -/
def CoefficientFormallySmooth {R S : Complete Λ k ρ} (f : Hom R.toLocal S.toLocal) : Prop :=
  ∀ (e : SocleExtension (Λ := Λ) (k := k) (ρ := ρ))
    (a : Hom R.toLocal e.B.toLocal) (b : Hom S.toLocal e.A.toLocal),
    Hom.comp e.map a = Hom.comp b f →
      ∃ c : Hom S.toLocal e.B.toLocal, Hom.comp e.map c = b ∧ Hom.comp c f = a

def representedMap {R S : Complete Λ k ρ} (f : Hom R.toLocal S.toLocal) :
    represented S ⟶ represented R where
  app A := TypeCat.ofHom (fun b => Hom.comp b f)
  naturality := by sorry

theorem smooth_prorep_iff {R S : Complete Λ k ρ} (f : Hom R.toLocal S.toLocal) :
    SmoothNat (representedMap f) ↔ CoefficientFormallySmooth f := by sorry

theorem smooth_prorep_series_iff {R S : Complete Λ k ρ} (f : Hom R.toLocal S.toLocal) :
    CoefficientFormallySmooth f ↔
      letI : Algebra R.Carrier S.Carrier := f.alg.toRingHom.toAlgebra
      ∃ d : ℕ, Nonempty (S.Carrier ≃ₐ[R.Carrier] MvPowerSeries (Fin d) R.Carrier) := by sorry

def Unobstructed (F : Artinian Λ k ρ ⥤ Type u) : Prop :=
  ∀ e : SocleExtension (Λ := Λ) (k := k) (ρ := ρ), Function.Surjective (F.map e.map)

theorem unobstructed_hull_iff {F : Artinian Λ k ρ ⥤ Type u}
    (R : Complete Λ k ρ) (H : Hull R F) :
    Unobstructed F ↔ ∃ d : ℕ, Nonempty (R.Carrier ≃ₐ[Λ] MvPowerSeries (Fin d) Λ) := by sorry

section OrbitHull
variable (K : Type u) [Field K]
instance : Fact (Function.Surjective (RingHom.id K)) := ⟨Function.surjective_id⟩
instance : Fact (RingHom.ker (RingHom.id K) = IsLocalRing.maximalIdeal K) := ⟨by sorry⟩

def fieldSeriesComplete (d : ℕ) : Complete K K (RingHom.id K) := {
  __ := fieldSeries K d
  noetherian := by sorry
  complete := by sorry }

def principalUnitOrbitSetoid (A : Local K K (RingHom.id K)) :
    Setoid (IsLocalRing.maximalIdeal A.Carrier) where
  r x y := ∃ v : A.Carrierˣ, A.residue v.val = 1 ∧ v.val * x.val = y.val
  iseqv := by sorry

def principalUnitOrbitFunctor : Artinian K K (RingHom.id K) ⥤ Type u where
  obj A := Quotient (principalUnitOrbitSetoid K A.toLocal)
  map f := TypeCat.ofHom (Quotient.map
    (fun x => (⟨f.alg x, by sorry⟩ : IsLocalRing.maximalIdeal _)) (by sorry))
  map_id := by sorry
  map_comp := by sorry

def principalUnitOrbitMap : represented (fieldSeriesComplete K 1) ⟶ principalUnitOrbitFunctor K where
  app A := TypeCat.ofHom (fun f => Quotient.mk _
    (⟨f.alg (MvPowerSeries.X (0 : Fin 1)), by sorry⟩ : IsLocalRing.maximalIdeal A.Carrier))
  naturality := by sorry

/-- A compatible hull automorphism need not be the identity. -/
def principalUnitOrbitAutomorphism :
    MvPowerSeries (Fin 1) K ≃ₐ[K] MvPowerSeries (Fin 1) K := by sorry

theorem principalUnitOrbitAutomorphism_X :
    principalUnitOrbitAutomorphism K (MvPowerSeries.X (0 : Fin 1)) =
      MvPowerSeries.X (0 : Fin 1) + (MvPowerSeries.X (0 : Fin 1)) ^ 2 := by sorry

def principalUnitOrbitAutomorphismHom :
    Hom (fieldSeriesComplete K 1).toLocal (fieldSeriesComplete K 1).toLocal :=
  ⟨(principalUnitOrbitAutomorphism K).toAlgHom, by sorry⟩

theorem principalUnitOrbitMap_automorphism (A : Artinian K K (RingHom.id K))
    (f : Hom (fieldSeriesComplete K 1).toLocal A.toLocal) :
    (principalUnitOrbitMap K).app A (Hom.comp f (principalUnitOrbitAutomorphismHom K)) =
      (principalUnitOrbitMap K).app A f := by sorry

def principalUnitOrbit_hull : Hull (fieldSeriesComplete K 1) (principalUnitOrbitFunctor K) := {
  map := principalUnitOrbitMap K
  smooth := by sorry
  tangent_bijective := by sorry }

theorem principalUnitOrbit_not_prorep :
    ¬ ∃ R : Complete K K (RingHom.id K), Nonempty (represented R ≅ principalUnitOrbitFunctor K) := by sorry

-- TauCeti.DeformationAlgebra.principalUnitOrbit_automorphism_nontrivial
example : principalUnitOrbitAutomorphism K ≠ AlgEquiv.refl := by sorry

-- TauCeti.DeformationAlgebra.principalUnitOrbit_zero
example : Subsingleton ((principalUnitOrbitFunctor K).obj
    (residueObject (Λ := K) (k := K) (ρ := RingHom.id K))) := by sorry
-- TauCeti.DeformationAlgebra.principalUnitOrbit_dual
example (a b : K) :
    let A := dualObject (Λ := K) (k := K) (ρ := RingHom.id K)
    let x : IsLocalRing.maximalIdeal A.Carrier := ⟨TrivSqZeroExt.inr a, by sorry⟩
    let y : IsLocalRing.maximalIdeal A.Carrier := ⟨TrivSqZeroExt.inr b, by sorry⟩
    Quotient.mk (principalUnitOrbitSetoid K A.toLocal) x =
      Quotient.mk (principalUnitOrbitSetoid K A.toLocal) y ↔ a = b := by sorry
end OrbitHull

section ConcreteRelationTests
variable (K : Type u) [Field K]
def quadraticRing : Complete K K (RingHom.id K) :=
  quotientComplete (fieldSeriesComplete K 1)
    (Ideal.span {(MvPowerSeries.X (0 : Fin 1) : MvPowerSeries (Fin 1) K)^2}) (by sorry)
def quadraticPresentation : MinimalPresentation (quadraticRing K) := {
  d := 1
  map := by sorry
  surjective := by sorry
  minimal := by sorry }
def quadraticRelation : presentationIdeal (quadraticRing K) (quadraticPresentation K) :=
  ⟨(MvPowerSeries.X (0 : Fin 1))^2, by sorry⟩

-- TauCeti.DeformationAlgebra.presentationObstruction_square
example :
    let R := quadraticRing K
    let P := quadraticPresentation K
    let hN : AdmissibleExponent R P 3 := by sorry
    let e := relationTestExtension R P 3 hN
    let f := relationTestPoint R P 3 hN
    let j := relationClass (presentationSeries R P).toLocal _ (quadraticRelation K)
    (presentationObstruction R P e f j).val =
      Ideal.Quotient.mk
        (IsLocalRing.maximalIdeal (presentationSeries R P).Carrier * presentationIdeal R P ⊔
          IsLocalRing.maximalIdeal (presentationSeries R P).Carrier ^ 3)
        ((MvPowerSeries.X (0 : Fin 1))^2) ∧
    presentationObstruction R P e f j ≠ 0 := by sorry

-- TauCeti.DeformationAlgebra.relationTestExtension_quadratic
example :
    let R := quadraticRing K
    let P := quadraticPresentation K
    let hN : AdmissibleExponent R P 3 := by sorry
    let e := relationTestExtension R P 3 hN
    Nonempty (e.B.Carrier ≃ₐ[K]
      (MvPowerSeries (Fin 1) K ⧸ Ideal.span
        {(MvPowerSeries.X (0 : Fin 1) : MvPowerSeries (Fin 1) K)^3})) ∧
      Nonempty (e.A.Carrier ≃ₐ[K] R.Carrier) := by sorry

def squareMaximalRing : Complete K K (RingHom.id K) :=
  quotientComplete (fieldSeriesComplete K 2)
    (IsLocalRing.maximalIdeal (MvPowerSeries (Fin 2) K)^2) (by sorry)
def squareMaximalPresentation : MinimalPresentation (squareMaximalRing K) := {
  d := 2
  map := by sorry
  surjective := by sorry
  minimal := by sorry }
-- TauCeti.DeformationAlgebra.relationTestExtension_three_relations
example :
    let R := squareMaximalRing K
    let P := squareMaximalPresentation K
    let hN : AdmissibleExponent R P 3 := by sorry
    Module.finrank K (relationTestExtension R P 3 hN).Kernel = 3 := by sorry

/-- The actual truncated field-series coefficients used by the orbit and nonminimal tests. -/
def fieldTruncation (N : ℕ) (hN : 0 < N) : Artinian K K (RingHom.id K) :=
  quotientArtin (fieldSeriesComplete K 1)
    (IsLocalRing.maximalIdeal (MvPowerSeries (Fin 1) K)^N) N hN le_rfl (by sorry)
def truncationVariable (N : ℕ) (hN : 0 < N) : (fieldTruncation K N hN).Carrier :=
  Ideal.Quotient.mk (IsLocalRing.maximalIdeal (MvPowerSeries (Fin 1) K)^N)
    (MvPowerSeries.X (0 : Fin 1))
def cubicExtension : SocleExtension (Λ := K) (k := K) (ρ := RingHom.id K) := {
  B := fieldTruncation K 3 (by decide)
  A := fieldTruncation K 2 (by decide)
  map := by sorry
  surjective := by sorry
  killed := by sorry }
def dualExtension : SocleExtension (Λ := K) (k := K) (ρ := RingHom.id K) := {
  B := fieldTruncation K 2 (by decide)
  A := residueObject
  map := by sorry
  surjective := by sorry
  killed := by sorry }

-- TauCeti.DeformationAlgebra.presentationObstruction_nonminimal
example :
    ∃ f₀ f₁ : Hom (fieldSeriesComplete K 1).toLocal (dualExtension K).B.toLocal,
      Hom.comp (dualExtension K).map f₀ = Hom.comp (dualExtension K).map f₁ ∧
      f₀.alg (MvPowerSeries.X (0 : Fin 1)) = 0 ∧
      f₁.alg (MvPowerSeries.X (0 : Fin 1)) = truncationVariable K 2 (by decide) ∧
      f₀.alg (MvPowerSeries.X (0 : Fin 1)) ≠ f₁.alg (MvPowerSeries.X (0 : Fin 1)) := by sorry
-- TauCeti.DeformationAlgebra.relationTestExtension_nonminimal
example : ∃ s : Hom (dualExtension K).A.toLocal (dualExtension K).B.toLocal,
    Hom.comp (dualExtension K).map s = Hom.id (dualExtension K).A.toLocal := by sorry

/-- The native equalizer algebra from R03.1/artinian-pullback. -/
def selfPullbackAlgebra (e : SocleExtension (Λ := K) (k := K) (ρ := RingHom.id K)) :
    Subalgebra K (e.B.Carrier × e.B.Carrier) where
  carrier := {x | e.map.alg x.1 = e.map.alg x.2}
  mul_mem' := by sorry
  add_mem' := by sorry
  algebraMap_mem' := by sorry

def selfPullback (e : SocleExtension (Λ := K) (k := K) (ρ := RingHom.id K)) :
    Local K K (RingHom.id K) := by
  letI : IsLocalRing (selfPullbackAlgebra K e) := by sorry
  exact {
    Carrier := selfPullbackAlgebra K e
    residue := e.B.residue.comp
      ((RingHom.fst e.B.Carrier e.B.Carrier).comp (selfPullbackAlgebra K e).val.toRingHom)
    surjective := by sorry
    kernel := by sorry
    base_residue := by sorry }

-- TauCeti.DeformationAlgebra.principalUnitOrbit_pullback
example :
    let e := cubicExtension K
    let t := truncationVariable K 3 (by decide)
    let P := selfPullback K e
    let x : IsLocalRing.maximalIdeal P.Carrier := ⟨⟨(t,t), by sorry⟩, by sorry⟩
    let y : IsLocalRing.maximalIdeal P.Carrier := ⟨⟨(t,t+t^2), by sorry⟩, by sorry⟩
    Quotient.mk (principalUnitOrbitSetoid K P) x ≠
      Quotient.mk (principalUnitOrbitSetoid K P) y ∧
    Quotient.mk (principalUnitOrbitSetoid K e.B.toLocal)
      (⟨t, by sorry⟩ : IsLocalRing.maximalIdeal e.B.Carrier) =
    Quotient.mk (principalUnitOrbitSetoid K e.B.toLocal)
      (⟨t+t^2, by sorry⟩ : IsLocalRing.maximalIdeal e.B.Carrier) := by sorry
end ConcreteRelationTests

/-- The mixed-characteristic test uses the base parameter, with zero series variables. -/
def residuePresentation : MinimalPresentation (residueComplete (Λ := Λ) (k := k) (ρ := ρ)) := {
  d := 0
  map := by sorry
  surjective := by sorry
  minimal := by sorry }
def uniformiserExtension (π : Λ) (hm : IsLocalRing.maximalIdeal Λ = Ideal.span {π}) :
    SocleExtension (Λ := Λ) (k := k) (ρ := ρ) := {
  B := quotientArtin (base Λ k ρ) (IsLocalRing.maximalIdeal Λ ^ 2) 2 (by decide) le_rfl (by sorry)
  A := residueObject
  map := by sorry
  surjective := by sorry
  killed := by sorry }
-- TauCeti.DeformationAlgebra.presentationObstruction_uniformiser
example (π : Λ) (hm : IsLocalRing.maximalIdeal Λ = Ideal.span {π})
    (hn : π ∉ IsLocalRing.maximalIdeal Λ ^ 2) :
    let R := residueComplete (Λ := Λ) (k := k) (ρ := ρ)
    let P := residuePresentation (Λ := Λ) (k := k) (ρ := ρ)
    let e := uniformiserExtension (k := k) (ρ := ρ) π hm
    let f : Hom R.toLocal e.A.toLocal := by sorry
    let j : presentationIdeal R P := ⟨MvPowerSeries.C π, by sorry⟩
    (presentationObstruction R P e f (relationClass (presentationSeries R P).toLocal _ j)).val =
      Ideal.Quotient.mk (IsLocalRing.maximalIdeal Λ ^ 2) π ∧
    presentationObstruction R P e f (relationClass (presentationSeries R P).toLocal _ j) ≠ 0 := by sorry

end TauCeti.DeformationAlgebra
