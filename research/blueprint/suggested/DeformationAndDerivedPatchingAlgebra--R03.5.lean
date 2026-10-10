/-
This file is not the roadmap and is not exhaustive. The accompanying roadmap
reader is definitive. These proposed Lean forms help contributors and reviewers
converge on names and signatures; the admitted proofs claim no implementation.

Part R03.5: Patching modules. CG Definitions 2.1–2.2 and Proposition 2.3,
PDF pp. 11–14; Taylor, proof of Theorem 4.1, pp. 218–221; Kisin,
Proposition 3.3.1 and Lemma 3.3.4, pp. 1157–1159.

The concrete algebraic data below specialize to the complete local coefficient
objects supplied by R03.1. Their topologies are the specified adic topologies.
Canonical residue Tor, restriction-of-scalars depth and generic-fibre formal
smoothness need the three precise supplier interfaces recorded in the packet.
No unexpressed condition is represented by a free proposition parameter.
-/
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.LinearAlgebra.TensorProduct.Tower
import Mathlib.Algebra.Category.ModuleCat.Limits
import Mathlib.CategoryTheory.CofilteredSystem
import Mathlib.RingTheory.AdicCompletion.Exactness
import Mathlib.RingTheory.AdicCompletion.Noetherian
import Mathlib.RingTheory.AdicCompletion.RingHom
import Mathlib.RingTheory.Finiteness.Cardinality
import Mathlib.RingTheory.LocalRing.Quotient
import Mathlib.RingTheory.Regular.RegularSequence
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.RingTheory.MvPowerSeries.Ideal
import Mathlib.RingTheory.MvPowerSeries.Inverse
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.RingTheory.DualNumber
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.RingTheory.TensorProduct.Basic

noncomputable section

open CategoryTheory CategoryTheory.Limits
open scoped TensorProduct

namespace TauCeti.ModulePatching

universe u

/-- A chosen presentation, including its bases. This is auxiliary data for
balance and finite patch data, not a replacement for native cokernels. -/
structure BasedPresentation (S M : Type u) [CommRing S] [AddCommGroup M]
    [Module S M] (d r : ℕ) where
  matrix : Matrix (Fin d) (Fin r) S
  generator : (Fin d → S) →ₗ[S] M
  generator_surjective : Function.Surjective generator
  range_eq_ker : LinearMap.range matrix.mulVecLin = LinearMap.ker generator

/-- Native square-presentation form of CG balance. The canonical defect
comparison is the separate `balanced-square-presentation` target. -/
def Balanced (S M : Type u) [CommRing S] [AddCommGroup M] [Module S M] : Prop :=
  ∃ d : ℕ, Nonempty (BasedPresentation S M d d)

namespace Balanced

variable {S M N : Type u} [CommRing S] [AddCommGroup M] [Module S M]
  [AddCommGroup N] [Module S N]

lemma of_equiv (e : M ≃ₗ[S] N) : Balanced S M ↔ Balanced S N := by sorry

/-- Reduction along a quotient, stated using the native base-change carrier. -/
lemma baseChange (J : Ideal S) (h : Balanced S M) :
    Balanced (S ⧸ J) ((S ⧸ J) ⊗[S] M) := by sorry

-- Balanced.defect_eq is omitted until R03.3 supplies the genuine k-module
-- structure on native Tor₁ and the minimal-resolution comparison. Its exact
-- statement is defect(M)=a-b for a minimal presentation with ranks a,b;
-- subtraction is in ℤ. No replacement defect or arbitrary predicate is defined.

-- Balanced.test_zero
example [Subsingleton M] : Balanced S M := by sorry

-- Balanced.test_cyclic_quotient
example [IsLocalRing S] [IsNoetherianRing S] (t : S)
    (ht : t ∈ IsLocalRing.maximalIdeal S) (hne : t ≠ 0) :
    Balanced S (S ⧸ Ideal.span {t}) := by sorry

-- Balanced.test_free_rank
example (d : ℕ) : Balanced S (Fin d → S) := by sorry

-- Balanced.test_residue_two_variables
-- Native scalar structure is restriction along the actual constant coefficient map.
example (k : Type u) [Field k] :
    let S := MvPowerSeries (Fin 2) k
    letI : Module S k := Module.compHom k MvPowerSeries.constantCoeff
    ¬ Balanced S k := by sorry

end Balanced

/-- The abelian Taylor–Wiles relation ideal in a native finite-variable series
ring. This notation is auxiliary to the comparison target. -/
abbrev groupRelations (O : Type u) [CommRing O] (q p N : ℕ) :
    Ideal (MvPowerSeries (Fin q) O) :=
  Ideal.span (Set.range fun i : Fin q =>
    (1 + MvPowerSeries.X i : MvPowerSeries (Fin q) O) ^ (p ^ N) - 1)

/-- Native quotient/group-ring comparison. Its generator characterization fixes
the group element associated to each power-series variable. -/
def cyclic_group_ring_quotients (O : Type u) [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [CharZero O]
    [Finite (IsLocalRing.ResidueField O)]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    (q p N : ℕ) [Fact p.Prime] [CharP (IsLocalRing.ResidueField O) p]
    (hN : 0 < N) :
    (MvPowerSeries (Fin q) O ⧸ groupRelations O q p N) ≃ₐ[O]
      MonoidAlgebra O (Multiplicative (Fin q → ZMod (p ^ N))) := by sorry

lemma cyclic_group_ring_quotients_variable (O : Type u) [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [CharZero O]
    [Finite (IsLocalRing.ResidueField O)]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    (q p N : ℕ) [Fact p.Prime] [CharP (IsLocalRing.ResidueField O) p]
    (hN : 0 < N) (i : Fin q) :
    cyclic_group_ring_quotients O q p N hN
      (Ideal.Quotient.mk (groupRelations O q p N) (1 + MvPowerSeries.X i)) =
    MonoidAlgebra.single (Multiplicative.ofAdd
      (Pi.single i (1 : ZMod (p ^ N)) : Fin q → ZMod (p ^ N))) (1 : O) := by sorry

/-- Both openness and cofinality are required; intersection zero alone is weaker. -/
theorem cofinal_artinian_cutoffs (O : Type u) [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [CharZero O]
    [Finite (IsLocalRing.ResidueField O)]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    (pi : O) (hpi : Ideal.span {pi} = IsLocalRing.maximalIdeal O)
    (q p : ℕ) [Fact p.Prime] [CharP (IsLocalRing.ResidueField O) p] :
    let S := MvPowerSeries (Fin q) O
    let b : ℕ → Ideal S := fun n =>
      Ideal.span {MvPowerSeries.C pi ^ (n+1)} ⊔ groupRelations O q p (n+1)
    Antitone b ∧ (∀ n, ∃ e : ℕ, IsLocalRing.maximalIdeal S ^ e ≤ b n) ∧
      (∀ e : ℕ, ∃ n, b n ≤ IsLocalRing.maximalIdeal S ^ e) ∧
      (⨅ n, b n) = ⊥ ∧ (∀ n, Finite (S ⧸ b n)) := by sorry

theorem annihilator_cutoffs (O R H : Type u) [CommRing O] [IsLocalRing O]
    [IsNoetherianRing O] [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    [Algebra O R] [IsLocalHom (algebraMap O R)]
    [Finite (IsLocalRing.ResidueField R)]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R]
    [AddCommGroup H] [Module R H] [Module O H] [IsScalarTower O R H]
    [Module.Finite R H] [Module.Finite O H] [Nontrivial H]
    (pi : O) (hpi : Ideal.span {pi} = IsLocalRing.maximalIdeal O) :
    let J := (⊤ : Submodule R H).annihilator
    let d : ℕ → Ideal R := fun n => Ideal.span {algebraMap O R pi ^ (n+1)} ⊔ J ^ (n+1)
    Antitone d ∧ (∀ n, ∃ e : ℕ, IsLocalRing.maximalIdeal R ^ e ≤ d n) ∧
      (∀ e : ℕ, ∃ n, d n ≤ IsLocalRing.maximalIdeal R ^ e) ∧
      (⨅ n, d n) = ⊥ ∧ (∀ n, Finite (R ⧸ d n)) ∧
      (∀ n, Ideal.span {algebraMap O R pi ^ (n+1)} ≤ d n ∧
        d n ≤ Ideal.span {algebraMap O R pi ^ (n+1)} ⊔ J) := by sorry

/-- A native presented module, parameterized by the already lifted matrix. -/
abbrev PatchedModule {S : Type u} [CommRing S] {d r : ℕ}
    (P : Matrix (Fin d) (Fin r) S) :=
  (Fin d → S) ⧸ LinearMap.range P.mulVecLin

namespace PatchedModule

variable {S : Type u} [CommRing S] {d r : ℕ}

/-- This is the native quotient projection, not a new surjection notion. -/
def generator (P : Matrix (Fin d) (Fin r) S) :
    (Fin d → S) →ₗ[S] PatchedModule P := (LinearMap.range P.mulVecLin).mkQ

lemma generator_surjective (P : Matrix (Fin d) (Fin r) S) :
    Function.Surjective (generator P) := by sorry

/-- Canonical reduction of the presentation. The right-hand native cokernel
is viewed as an S-module by restriction along the ideal quotient. -/
def cokernelBaseChange (P : Matrix (Fin d) (Fin r) S) (I : Ideal S) :
    (PatchedModule P ⧸ (I • ⊤ : Submodule S (PatchedModule P))) ≃ₗ[S]
      PatchedModule (P.map (Ideal.Quotient.mk I)) := by sorry

-- PatchedModule.test_zero_matrix
example : ∃ e : PatchedModule (0 : Matrix (Fin d) (Fin r) S) ≃ₗ[S] (Fin d → S),
    ∀ v : Fin d → S, e (generator (0 : Matrix (Fin d) (Fin r) S) v) = v := by sorry

-- PatchedModule.test_identity_matrix
example : Subsingleton (PatchedModule (1 : Matrix (Fin d) (Fin d) S)) := by sorry

-- PatchedModule.test_uniformizer_matrix: in fact valid for any scalar t.
example (t : S) :
    ∃ e : PatchedModule (fun (_ : Fin 1) (_ : Fin 1) => t) ≃ₗ[S]
      (S ⧸ Ideal.span {t}),
      ∀ v : Fin 1 → S, e (generator (fun (_ : Fin 1) (_ : Fin 1) => t) v) =
        Ideal.Quotient.mk (Ideal.span {t}) (v 0) := by sorry

end PatchedModule

section DecoratedData

variable (O S A R H X : Type u)
  [CommRing O] [CommRing S] [CommRing A] [CommRing R]
  [Algebra O S] [Algebra O A] [Algebra O R]
  [AddCommGroup H] [Module S H] [Module R H]
  [AddCommGroup X] [Module S X]

/-- The algebraic core of a finite datum. For patching, S and R are the finite
cutoff rings T,D, H is the finite augmentation target, and the local/finite
hypotheses in the reader are imposed. The actual action is retained. -/
structure FinitePatchDatum (aug : Ideal S) (d r : ℕ) where
  presentation : BasedPresentation S X d r
  action : A →+* Module.End S X
  action_coeff : ∀ (o : O) (x : X),
    action (algebraMap O A o) x = (algebraMap O S o) • x
  phi : A →ₐ[O] R
  phi_surjective : Function.Surjective phi
  specialization : X →ₗ[S] H
  specialization_surjective : Function.Surjective specialization
  specialization_kernel : LinearMap.ker specialization = aug • ⊤
  action_specialization : ∀ (a : A) (x : X),
    specialization (action a x) = phi a • specialization x

end DecoratedData

namespace FinitePatchDatum

variable {O S A R H X : Type u}
  [CommRing O] [CommRing S] [CommRing A] [CommRing R]
  [Algebra O S] [Algebra O A] [Algebra O R]
  [AddCommGroup H] [Module S H] [Module R H]
  [AddCommGroup X] [Module S X] {aug : Ideal S} {d r : ℕ}

/-- Preserving fixed bases entails equality of the relation matrices and
intertwining the generator projections. -/
structure Equiv (D E : FinitePatchDatum O S A R H X aug d r) where
  moduleEquiv : X ≃ₗ[S] X
  matrix_eq : D.presentation.matrix = E.presentation.matrix
  generators : moduleEquiv.toLinearMap.comp D.presentation.generator = E.presentation.generator
  phi_eq : D.phi = E.phi
  actions : ∀ (a : A) (x : X), moduleEquiv (D.action a x) = E.action a (moduleEquiv x)
  specialization : E.specialization.comp moduleEquiv.toLinearMap = D.specialization

lemma equiv_iff (D E : FinitePatchDatum O S A R H X aug d r) :
    Nonempty (Equiv D E) ↔ ∃ e : X ≃ₗ[S] X,
      D.presentation.matrix = E.presentation.matrix ∧
      e.toLinearMap.comp D.presentation.generator = E.presentation.generator ∧
      D.phi = E.phi ∧
      (∀ a x, e (D.action a x) = E.action a (e x)) ∧
      E.specialization.comp e.toLinearMap = D.specialization := by sorry

/-- The target modules carry their genuine quotient scalar structures. The
surjective semilinear maps and their kernels specify those quotients without
inventing a new carrier. The returned datum also records the reduced matrix. -/
def reduce {S' R' H' X' : Type u} [CommRing S'] [CommRing R']
    [Algebra O S'] [Algebra O R']
    [AddCommGroup H'] [Module S' H'] [Module R' H']
    [AddCommGroup X'] [Module S' X']
    (D : FinitePatchDatum O S A R H X aug d r)
    (I : Ideal S) (f : S →ₐ[O] S') (hf : Function.Surjective f)
    (hker : RingHom.ker f.toRingHom = I)
    (g : R →ₐ[O] R') (hg : Function.Surjective g)
    (qx : X →ₛₗ[f.toRingHom] X') (hqx : Function.Surjective qx)
    (hkx : LinearMap.ker qx = I • ⊤)
    (qh : H →ₛₗ[f.toRingHom] H') (hqh : Function.Surjective qh)
    (hkh : LinearMap.ker qh = I • ⊤)
    (hscalar : ∀ (a : R) (h : H), qh (a • h) = g a • qh h) :
    {E : FinitePatchDatum O S' A R' H' X' (aug.map f.toRingHom) d r //
      E.presentation.matrix = D.presentation.matrix.map f.toRingHom ∧
      E.phi = g.comp D.phi ∧
      (∀ v, E.presentation.generator (fun i => f (v i)) =
        qx (D.presentation.generator v)) ∧
      (∀ a x, E.action a (qx x) = qx (D.action a x)) ∧
      (∀ x, E.specialization (qx x) = qh (D.specialization x))} := by sorry

-- FinitePatchDatum.test_zero_presentation
example (D : FinitePatchDatum O S A R H X aug d 0) :
    ∃ e : X ≃ₗ[S] (Fin d → S),
      ∀ v, e (D.presentation.generator v) = v := by sorry

-- FinitePatchDatum.test_action_distinguishes: the two actual actions on k².
example (k : Type u) [Field k] :
    let A := MvPowerSeries (Fin 1) k
    let X := Fin 2 → k
    ∃ D E : FinitePatchDatum k k A k (Fin 0 → k) X ⊤ 2 0,
      D.presentation.generator = LinearMap.id ∧
      E.presentation.generator = LinearMap.id ∧
      D.action (MvPowerSeries.X (0 : Fin 1)) = 0 ∧
      (∀ x : X, E.action (MvPowerSeries.X (0 : Fin 1)) x = ![x 1, 0]) ∧
      ¬ Nonempty (Equiv D E) := by sorry

-- FinitePatchDatum.test_specialization_kernel
-- Native dual numbers are the indicated polynomial quotient. Take B=O/π^n.
example (B : Type u) [CommRing B] :
    let T := DualNumber B
    letI : Module T B := Module.compHom B (TrivSqZeroExt.fstHom B B B).toRingHom
    let aug : Ideal T := Ideal.span {DualNumber.eps}
    ∃ D : FinitePatchDatum B T T B B T aug 1 0,
      (∀ x, D.specialization x = TrivSqZeroExt.fst x) ∧
      (∀ x, D.specialization x = 0 ↔ x ∈ (aug • ⊤ : Submodule T T)) := by sorry

/-- The actual action factors through a uniform quotient, even when it is
nonfaithful. The exponent bounds the cardinality of all self-maps of X. -/
theorem action_cutoff [IsLocalRing A] [Finite X]
    (D : FinitePatchDatum O S A R H X aug d r) :
    IsLocalRing.maximalIdeal A ^ (Nat.card X ^ Nat.card X) ≤
      RingHom.ker D.action := by sorry

/-- Finiteness on each fixed carrier. The finite-class statement in the reader
then uses the finitely many native cokernels of the possible matrices. -/
theorem finite_decorated_data [IsLocalRing A] [IsNoetherianRing A]
    [Finite (IsLocalRing.ResidueField A)] [Finite S] [Finite R]
    [Finite H] [Finite X] :
    Finite (FinitePatchDatum O S A R H X aug d r) := by sorry

end FinitePatchDatum

section Towers

variable (S A : Type u) [CommRing S] [CommRing A]

/-- Auxiliary coordinate reduction; the scalar ring S is fixed throughout. -/
def coordinateReduction {I J : Ideal S} (h : J ≤ I) (d : ℕ) :
    (Fin d → S ⧸ J) →ₗ[S] (Fin d → S ⧸ I) :=
  LinearMap.pi fun i => (Ideal.Quotient.factorₐ S h).toLinearMap.comp (LinearMap.proj i)

/-- A chosen tower retains the native module functor, its based presentation,
coefficient map to the original ring quotients, augmentation quotients and
actual actions. Scalar structures on cutoff modules carry concrete compatibility
equations. It does not invent maps between the original arithmetic levels. -/
structure CompatiblePatchTower (I : ℕ → Ideal S) (d r : ℕ) where
  descending : ∀ {m n}, m ≤ n → I n ≤ I m
  toInverseSystem : ℕᵒᵖ ⥤ ModuleCat.{u} S
  matrix : ∀ n, Matrix (Fin d) (Fin r) (S ⧸ I n)
  generators : ∀ n, (Fin d → S ⧸ I n) →ₗ[S] toInverseSystem.obj (Opposite.op n)
  surjective : ∀ n, Function.Surjective (generators n)
  exact : ∀ n, LinearMap.range ((matrix n).mulVecLin.restrictScalars S) =
    LinearMap.ker (generators n)
  matrix_compatible : ∀ {m n} (h : m ≤ n),
    (matrix n).map (Ideal.Quotient.factor (descending h)) = matrix m
  generators_compatible : ∀ {m n} (h : m ≤ n),
    (toInverseSystem.map (homOfLE h).op).hom.comp (generators n) =
      (generators m).comp (coordinateReduction S (descending h) d)
  action : ∀ n, A →+* Module.End S (toInverseSystem.obj (Opposite.op n))
  action_compatible : ∀ {m n} (h : m ≤ n) (a : A) (x : toInverseSystem.obj (Opposite.op n)),
    (toInverseSystem.map (homOfLE h).op).hom (action n a x) =
      action m a ((toInverseSystem.map (homOfLE h).op).hom x)
  O : Type u
  [coeffRing : CommRing O]
  [coeffS : Algebra O S]
  [coeffA : Algebra O A]
  R : Type u
  [ringR : CommRing R]
  [coeffR : Algebra O R]
  [scalarR : Algebra S R]
  [coeffScalarR : IsScalarTower O S R]
  J : ℕ → Ideal R
  targetDescending : ∀ {m n}, m ≤ n → J n ≤ J m
  H : Type u
  [groupH : AddCommGroup H]
  [moduleRH : Module R H]
  [moduleSH : Module S H]
  [scalarH : IsScalarTower S R H]
  L : ℕ → Ideal R
  moduleDescending : ∀ {m n}, m ≤ n → L n ≤ L m
  [cutoffX : ∀ n, Module (S ⧸ I n) (toInverseSystem.obj (Opposite.op n))]
  [scalarX : ∀ n, IsScalarTower S (S ⧸ I n) (toInverseSystem.obj (Opposite.op n))]
  [cutoffH : ∀ n, Module (S ⧸ I n) (H ⧸ (L n • ⊤ : Submodule R H))]
  [scalarCutoffH : ∀ n, IsScalarTower S (S ⧸ I n) (H ⧸ (L n • ⊤ : Submodule R H))]
  [cutoffRH : ∀ n, Module (R ⧸ J n) (H ⧸ (L n • ⊤ : Submodule R H))]
  residueAction : ∀ n (a : R) (x : H ⧸ (L n • ⊤ : Submodule R H)),
    (Ideal.Quotient.mk (J n) a) • x = a • x
  augmentation : Ideal S
  datum : ∀ n, FinitePatchDatum O (S ⧸ I n) A (R ⧸ J n)
    (H ⧸ (L n • ⊤ : Submodule R H)) (toInverseSystem.obj (Opposite.op n))
    (augmentation.map (Ideal.Quotient.mk (I n))) d r
  datum_matrix : ∀ n, (datum n).presentation.matrix = matrix n
  datum_generator : ∀ n,
    (datum n).presentation.generator.restrictScalars S = generators n
  datum_action : ∀ n (a : A) (x : toInverseSystem.obj (Opposite.op n)),
    (datum n).action a x = action n a x
  phi_compatible : ∀ {m n} (h : m ≤ n),
    (Ideal.Quotient.factorₐ O (targetDescending h)).comp (datum n).phi = (datum m).phi
  specialization_compatible : ∀ {m n} (h : m ≤ n),
    ((Submodule.mapQ (L n • ⊤ : Submodule R H) (L m • ⊤ : Submodule R H)
      LinearMap.id (by simpa using Submodule.smul_mono_left (moduleDescending h))).restrictScalars S).comp
        ((datum n).specialization.restrictScalars S) =
      ((datum m).specialization.restrictScalars S).comp
        (toInverseSystem.map (homOfLE h).op).hom

end Towers

attribute [instance] CompatiblePatchTower.coeffRing CompatiblePatchTower.coeffS
  CompatiblePatchTower.coeffA CompatiblePatchTower.ringR CompatiblePatchTower.coeffR
  CompatiblePatchTower.scalarR CompatiblePatchTower.coeffScalarR
  CompatiblePatchTower.groupH CompatiblePatchTower.moduleRH
  CompatiblePatchTower.moduleSH CompatiblePatchTower.scalarH
  CompatiblePatchTower.cutoffX CompatiblePatchTower.scalarX
  CompatiblePatchTower.cutoffH CompatiblePatchTower.scalarCutoffH
  CompatiblePatchTower.cutoffRH

namespace CompatiblePatchTower

variable {S A : Type u} [CommRing S] [CommRing A] {I : ℕ → Ideal S} {d r : ℕ}

/-- Cofinal restriction of the already chosen tower; not independence of arbitrary extractions. -/
def cofinalRestrict (T : CompatiblePatchTower S A I d r)
    (f : ℕ → ℕ) (hf : StrictMono f) : CompatiblePatchTower S A (I ∘ f) d r := by sorry

lemma cofinalRestrict_functor (T : CompatiblePatchTower S A I d r)
    (f : ℕ → ℕ) (hf : StrictMono f) :
    (T.cofinalRestrict f hf).toInverseSystem =
      hf.monotone.functor.op ⋙ T.toInverseSystem := by sorry

lemma cofinalRestrict_matrix (T : CompatiblePatchTower S A I d r)
    (f : ℕ → ℕ) (hf : StrictMono f) (n : ℕ) :
    (T.cofinalRestrict f hf).matrix n = T.matrix (f n) := by sorry

-- CompatiblePatchTower.test_composition
example (T : CompatiblePatchTower S A I d r) (n : ℕ)
    (x : T.toInverseSystem.obj (Opposite.op (n+2))) :
    (T.toInverseSystem.map (homOfLE (show n ≤ n+2 by omega)).op).hom x =
      (T.toInverseSystem.map (homOfLE (show n ≤ n+1 by omega)).op).hom
        ((T.toInverseSystem.map (homOfLE (show n+1 ≤ n+2 by omega)).op).hom x) := by sorry

-- CompatiblePatchTower.test_twisted_action: identity reduction rejects the twist.
example (k : Type u) [Field k] :
    ∃ rho sigma : MvPowerSeries (Fin 1) k →+* Module.End k (Fin 2 → k),
      (∀ x, rho (MvPowerSeries.X (0 : Fin 1)) x = ![x 1, 0]) ∧
      sigma (MvPowerSeries.X (0 : Fin 1)) = 0 ∧
      ¬ (∀ (a : MvPowerSeries (Fin 1) k) (x : Fin 2 → k),
        (LinearMap.id : (Fin 2 → k) →ₗ[k] (Fin 2 → k)) (rho a x) =
          sigma a ((LinearMap.id : (Fin 2 → k) →ₗ[k] (Fin 2 → k)) x)) := by sorry

-- CompatiblePatchTower.test_skipping_levels
example (T : CompatiblePatchTower S A I d r) :
    ∃ e : (limit (T.cofinalRestrict (fun n => 2*n+1) (by
      intro m n h; change 2*m+1 < 2*n+1; omega)).toInverseSystem).carrier ≃ₗ[S]
      (limit T.toInverseSystem).carrier,
      ∀ n x, HEq ((limit.π T.toInverseSystem (Opposite.op (2*n+1))).hom (e x))
        ((limit.π (T.cofinalRestrict (fun n => 2*n+1) (by
          intro m n h; change 2*m+1 < 2*n+1; omega)).toInverseSystem
            (Opposite.op n)).hom x) := by sorry

/-- A specified coherent comparison, with the constructed limit actions and
specializations characterized by their finite projections. The joint separation
of the target reductions expresses completeness/Hausdorffness at the use site. -/
theorem patching_choice_comparison (T U : CompatiblePatchTower S A I d r)
    (e : T.toInverseSystem ≅ U.toInverseSystem)
    (hact : ∀ n a x, (e.hom.app (Opposite.op n)).hom (T.action n a x) =
      U.action n a ((e.hom.app (Opposite.op n)).hom x))
    (rhoT : A →+* Module.End S (limit T.toInverseSystem).carrier)
    (rhoU : A →+* Module.End S (limit U.toInverseSystem).carrier)
    (hT : ∀ n a x, (limit.π T.toInverseSystem (Opposite.op n)).hom (rhoT a x) =
      T.action n a ((limit.π T.toInverseSystem (Opposite.op n)).hom x))
    (hU : ∀ n a x, (limit.π U.toInverseSystem (Opposite.op n)).hom (rhoU a x) =
      U.action n a ((limit.π U.toInverseSystem (Opposite.op n)).hom x))
    {H : Type u} [AddCommGroup H] [Module S H]
    (Q : ℕ → Type u) [∀ n, AddCommGroup (Q n)] [∀ n, Module S (Q n)]
    (red : ∀ n, H →ₗ[S] Q n)
    (hsep : ∀ x y, (∀ n, red n x = red n y) → x = y)
    (sT : (limit T.toInverseSystem).carrier →ₗ[S] H)
    (sU : (limit U.toInverseSystem).carrier →ₗ[S] H)
    (qT : ∀ n, T.toInverseSystem.obj (Opposite.op n) →ₗ[S] Q n)
    (qU : ∀ n, U.toInverseSystem.obj (Opposite.op n) →ₗ[S] Q n)
    (hq : ∀ n x, qU n ((e.hom.app (Opposite.op n)).hom x) = qT n x)
    (hsT : ∀ n x, red n (sT x) = qT n ((limit.π T.toInverseSystem (Opposite.op n)).hom x))
    (hsU : ∀ n x, red n (sU x) = qU n ((limit.π U.toInverseSystem (Opposite.op n)).hom x)) :
    ∃! f : (limit T.toInverseSystem).carrier ≃ₗ[S] (limit U.toInverseSystem).carrier,
      (∀ n x, (limit.π U.toInverseSystem (Opposite.op n)).hom (f x) =
        (e.hom.app (Opposite.op n)).hom
          ((limit.π T.toInverseSystem (Opposite.op n)).hom x)) ∧
      (∀ a x, f (rhoT a x) = rhoU a (f x)) ∧
      (∀ x, sU (f x) = sT x) := by sorry

end CompatiblePatchTower

/-- The finite-class diagonal selection used for decorated data. The setoids
are the actual decoration-preserving equivalences, and reductions respect them.
Original arithmetic levels are not included in the finite quotients. -/
theorem patching_extraction (D : ℕ → Type u) [∀ n, Setoid (D n)]
    [∀ n, Finite (Quotient (inferInstance : Setoid (D n)))]
    (red : ∀ {n m}, n ≤ m → D m → D n)
    (red_id : ∀ n (x : D n), red (le_refl n) x = x)
    (red_comp : ∀ {n m l} (h : n ≤ m) (k : m ≤ l) (x : D l),
      red h (red k x) = red (h.trans k) x)
    (red_equiv : ∀ {n m} (h : n ≤ m) (x y : D m), x ≈ y → red h x ≈ red h y)
    (datum : ∀ (m n : ℕ), n ≤ m → D n)
    (datum_reduce : ∀ (l m n : ℕ) (h : n ≤ m) (k : m ≤ l),
      red h (datum l m k) ≈ datum l n (h.trans k)) :
    ∃ (m n : ℕ → ℕ) (hm : StrictMono m) (hn : StrictMono n)
      (hlevel : ∀ i, n i ≤ m i),
      ∀ i, red (hn.monotone (Nat.le_succ i)) (datum (m (i+1)) (n (i+1)) (hlevel (i+1))) ≈
        datum (m i) (n i) (hlevel i) := by sorry

namespace PatchedModule

variable {S A : Type u} [CommRing S] [CommRing A] [IsNoetherianRing S]
  [IsLocalRing S] [IsAdicComplete (IsLocalRing.maximalIdeal S) S]
  {I : ℕ → Ideal S} {d r : ℕ}

/-- The reduction lands in the selected cutoff module, with its chosen bases. -/
def reductionEquiv (T : CompatiblePatchTower S A I d r)
    (P : Matrix (Fin d) (Fin r) S)
    (hP : ∀ n, P.map (Ideal.Quotient.mk (I n)) = T.matrix n) (n : ℕ) :
    (PatchedModule P ⧸ (I n • ⊤ : Submodule S (PatchedModule P))) ≃ₗ[S]
      T.toInverseSystem.obj (Opposite.op n) := by sorry

lemma reductionEquiv_generator (T : CompatiblePatchTower S A I d r)
    (P : Matrix (Fin d) (Fin r) S)
    (hP : ∀ n, P.map (Ideal.Quotient.mk (I n)) = T.matrix n)
    (n : ℕ) (v : Fin d → S) :
    reductionEquiv T P hP n
      ((I n • ⊤ : Submodule S (PatchedModule P)).mkQ (generator P v)) =
        T.generators n (fun i => Ideal.Quotient.mk (I n) (v i)) := by sorry

/-- This is the module-specific comparison with a native categorical limit.
Cofinal/open are stated as ideal inequalities, not an opaque condition. -/
def limitEquiv (T : CompatiblePatchTower S A I d r)
    (P : Matrix (Fin d) (Fin r) S)
    (hP : ∀ n, P.map (Ideal.Quotient.mk (I n)) = T.matrix n)
    (hopen : ∀ n, ∃ e : ℕ, IsLocalRing.maximalIdeal S ^ e ≤ I n)
    (hcofinal : ∀ e : ℕ, ∃ n, I n ≤ IsLocalRing.maximalIdeal S ^ e) :
    PatchedModule P ≃ₗ[S] (limit T.toInverseSystem).carrier := by sorry

lemma limitEquiv_generator (T : CompatiblePatchTower S A I d r)
    (P : Matrix (Fin d) (Fin r) S)
    (hP : ∀ n, P.map (Ideal.Quotient.mk (I n)) = T.matrix n)
    (hopen : ∀ n, ∃ e : ℕ, IsLocalRing.maximalIdeal S ^ e ≤ I n)
    (hcofinal : ∀ e : ℕ, ∃ n, I n ≤ IsLocalRing.maximalIdeal S ^ e)
    (n : ℕ) (v : Fin d → S) :
    (limit.π T.toInverseSystem (Opposite.op n)).hom
      (limitEquiv T P hP hopen hcofinal (generator P v)) =
        T.generators n (fun i => Ideal.Quotient.mk (I n) (v i)) := by sorry

/-- Lifting the finitely many coherent matrix coefficients uses the native
adic completeness of S, after comparing the cofinal ideals with its powers. -/
theorem matrix_lift (T : CompatiblePatchTower S A I d r)
    (hopen : ∀ n, ∃ e : ℕ, IsLocalRing.maximalIdeal S ^ e ≤ I n)
    (hcofinal : ∀ e : ℕ, ∃ n, I n ≤ IsLocalRing.maximalIdeal S ^ e) :
    ∃ P : Matrix (Fin d) (Fin r) S,
      ∀ n, P.map (Ideal.Quotient.mk (I n)) = T.matrix n := by sorry

/-- Exact augmentation specialization is derived from the decorated quotient
maps and complete, cofinal target quotients. It is not a general assertion that
inverse limits commute with taking an arbitrary quotient. -/
theorem augmentation_specialization (T : CompatiblePatchTower S A I d r)
    [Module.Finite S T.H] [IsAdicComplete (IsLocalRing.maximalIdeal S) T.H]
    (P : Matrix (Fin d) (Fin r) S)
    (hP : ∀ n, P.map (Ideal.Quotient.mk (I n)) = T.matrix n)
    (hopen : ∀ n, ∃ e : ℕ, IsLocalRing.maximalIdeal S ^ e ≤ I n)
    (hcofinal : ∀ e : ℕ, ∃ n, I n ≤ IsLocalRing.maximalIdeal S ^ e)
    (hLopen : ∀ n, ∃ e : ℕ,
      (IsLocalRing.maximalIdeal S ^ e • ⊤ : Submodule S T.H) ≤
        (T.L n • ⊤ : Submodule T.R T.H).restrictScalars S)
    (hLcofinal : ∀ e : ℕ, ∃ n,
      (T.L n • ⊤ : Submodule T.R T.H).restrictScalars S ≤
        (IsLocalRing.maximalIdeal S ^ e • ⊤ : Submodule S T.H))
    (rho : A →+* Module.End S (PatchedModule P))
    (hrho : ∀ n a x, reductionEquiv T P hP n
      ((I n • ⊤ : Submodule S (PatchedModule P)).mkQ (rho a x)) =
      T.action n a (reductionEquiv T P hP n
        ((I n • ⊤ : Submodule S (PatchedModule P)).mkQ x)))
    (phi : A →ₐ[T.O] T.R)
    (hphi : ∀ n, (Ideal.Quotient.mkₐ T.O (T.J n)).comp phi = (T.datum n).phi) :
    ∃ e : (PatchedModule P ⧸
      (T.augmentation • ⊤ : Submodule S (PatchedModule P))) ≃ₗ[S] T.H,
      (∀ a x, e ((T.augmentation • ⊤ : Submodule S (PatchedModule P)).mkQ (rho a x)) =
        phi a • e ((T.augmentation • ⊤ : Submodule S (PatchedModule P)).mkQ x)) ∧
      (∀ n x, (T.L n • ⊤ : Submodule T.R T.H).mkQ
        (e ((T.augmentation • ⊤ : Submodule S (PatchedModule P)).mkQ x)) =
        (T.datum n).specialization (reductionEquiv T P hP n
          ((I n • ⊤ : Submodule S (PatchedModule P)).mkQ x))) := by sorry

end PatchedModule

section LimitActions

variable {S A M : Type u} [CommRing S] [CommRing A]
  [AddCommGroup M] [Module S M] (I : Ideal S)

/-- Reduction on endomorphisms uses the native quotient module. -/
def endReduction (n : ℕ) :
    Module.End S M →+* Module.End S (M ⧸ (I ^ n • ⊤ : Submodule S M)) := by sorry

/-- Coordinatewise limit action. The ideal is the specified adic ideal;
complete module structure and all action coherence are explicit. -/
def PatchedAction [IsAdicComplete I M]
    (rho : ∀ n, A →+* Module.End S (M ⧸ (I ^ n • ⊤ : Submodule S M)))
    (hcompat : ∀ {m n} (h : m ≤ n) (a : A) (x : M),
      (Submodule.mapQ _ _ LinearMap.id
        (by simpa using Submodule.smul_mono_left (Ideal.pow_le_pow_right h)))
        (rho n a ((I ^ n • ⊤ : Submodule S M).mkQ x)) =
      rho m a ((I ^ m • ⊤ : Submodule S M).mkQ x)) :
    A →+* Module.End S M := by sorry

namespace PatchedAction

/-- Reduction characterization of the constructed action, with the prescribed
finite action on the right. This is stronger than reducing an arbitrary action. -/
lemma reduce [IsAdicComplete I M]
    (rho : ∀ n, A →+* Module.End S (M ⧸ (I ^ n • ⊤ : Submodule S M)))
    (hcompat : ∀ {m n} (h : m ≤ n) (a : A) (x : M),
      (Submodule.mapQ _ _ LinearMap.id
        (by simpa using Submodule.smul_mono_left (Ideal.pow_le_pow_right h)))
        (rho n a ((I ^ n • ⊤ : Submodule S M).mkQ x)) =
      rho m a ((I ^ m • ⊤ : Submodule S M).mkQ x))
    (n : ℕ) (a : A) (x : M) :
    (I ^ n • ⊤ : Submodule S M).mkQ ((PatchedAction I rho hcompat) a x) =
      rho n a ((I ^ n • ⊤ : Submodule S M).mkQ x) := by sorry

lemma unique [IsHausdorff I M] (rho sigma : A →+* Module.End S M)
    (h : ∀ n, (endReduction I n).comp rho = (endReduction I n).comp sigma) :
    rho = sigma := by sorry

/-- Ring-map comparison is separate from comparison of their module actions. -/
lemma phi_unique {O R : Type u} [CommRing O] [CommRing R]
    [Algebra O A] [Algebra O R] [IsLocalRing R]
    [IsHausdorff (IsLocalRing.maximalIdeal R) R]
    (phi psi : A →ₐ[O] R)
    (h : ∀ n, (Ideal.Quotient.mkₐ O (IsLocalRing.maximalIdeal R ^ n)).comp phi =
      (Ideal.Quotient.mkₐ O (IsLocalRing.maximalIdeal R ^ n)).comp psi) :
    phi = psi := by sorry

/-- Compatible-surjection conclusion with its compactness hypothesis explicit. -/
lemma phi_surjective {O R : Type u} [CommRing O] [CommRing R]
    [Algebra O A] [Algebra O R] [IsLocalRing R]
    [TopologicalSpace A] [CompactSpace A]
    (phi : A →ₐ[O] R)
    (hclosed : ∀ n r, IsClosed {a : A | Ideal.Quotient.mk (IsLocalRing.maximalIdeal R ^ n) (phi a) =
      Ideal.Quotient.mk (IsLocalRing.maximalIdeal R ^ n) r})
    [IsHausdorff (IsLocalRing.maximalIdeal R) R]
    (hsurj : ∀ n, Function.Surjective
      ((Ideal.Quotient.mkₐ O (IsLocalRing.maximalIdeal R ^ n)).comp phi)) :
    Function.Surjective phi := by sorry

-- PatchedAction.test_constants
example {O : Type u} [CommRing O] [Algebra O A] [Algebra O S]
    [IsHausdorff I M] (rho : A →+* Module.End S M)
    (hcoeff : ∀ (n : ℕ) (o : O),
      endReduction I n (rho (algebraMap O A o)) =
        endReduction I n (LinearMap.lsmul S M (algebraMap O S o))) :
    ∀ (o : O) (x : M), rho (algebraMap O A o) x = (algebraMap O S o) • x := by sorry

-- PatchedAction.test_multiplication
example (rho : A →+* Module.End S M) (a b : A) (x : M) :
    rho (a*b) x = rho a (rho b x) := by sorry

-- PatchedAction.test_nonfaithful: the actual variable survives in the ring.
example :
    ∃ rho : MvPowerSeries (Fin 1) S →+* Module.End S S,
      (∀ f x, rho f x = MvPowerSeries.constantCoeff f * x) ∧
      rho (MvPowerSeries.X (0 : Fin 1)) = 0 ∧
      (∀ n, endReduction (M := S) I n (rho (MvPowerSeries.X (0 : Fin 1))) = 0) := by sorry

end PatchedAction
end LimitActions

/-- Compactness assembles one scalar lift valid at every finite reduction. -/
theorem scalar_image_limit {S A M : Type u} [CommRing S] [CommRing A]
    [TopologicalSpace A] [CompactSpace A] [AddCommGroup M] [Module S M]
    (I : Ideal S) [IsHausdorff I M] (rho : A →+* Module.End S M)
    (hclosed : ∀ (n : ℕ) (s : S), IsClosed {a : A | ∀ x : M,
      (I ^ n • ⊤ : Submodule S M).mkQ (rho a x) =
        (I ^ n • ⊤ : Submodule S M).mkQ (s • x)})
    (hfinite : ∀ (n : ℕ) (s : S), ∃ a : A, ∀ x : M,
      (I ^ n • ⊤ : Submodule S M).mkQ (rho a x) =
        (I ^ n • ⊤ : Submodule S M).mkQ (s • x)) :
    ∀ s : S, ∃ a : A, ∀ x : M, rho a x = s • x := by sorry

/-- The scalar lift is a choice. Augmentation containment uses its own kernel
image hypothesis, separate from containment of the whole scalar image. -/
theorem power_series_action_and_finiteness (O A R M : Type u)
    [CommRing O] [IsLocalRing O] [IsNoetherianRing O]
    [CommRing A] [IsLocalRing A] [IsNoetherianRing A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [Algebra O A] [IsLocalHom (algebraMap O A)]
    [CommRing R] [Algebra O R] [AddCommGroup M]
    [Module O M] [Module A M] [IsScalarTower O A M] [Nontrivial M]
    (q : ℕ) [Module (MvPowerSeries (Fin q) O) M]
    [IsScalarTower O (MvPowerSeries (Fin q) O) M]
    [SMulCommClass (MvPowerSeries (Fin q) O) A M]
    [Module.Finite (MvPowerSeries (Fin q) O) M]
    (phi : A →ₐ[O] R)
    (himage : ∀ s : MvPowerSeries (Fin q) O, ∃ a : A, ∀ x : M, a • x = s • x)
    (haug : ∀ s : MvPowerSeries (Fin q) O,
      s ∈ (Ideal.span (Set.range fun i : Fin q => (MvPowerSeries.X i : MvPowerSeries (Fin q) O))) →
      ∃ a : A, phi a = 0 ∧ ∀ x : M, a • x = s • x) :
    Module.Finite A M ∧ ∃ iota : MvPowerSeries (Fin q) O →ₐ[O] A,
      IsLocalHom iota.toRingHom ∧
      (∀ (s : MvPowerSeries (Fin q) O) (x : M), iota s • x = s • x) ∧
      (Ideal.span (Set.range fun i : Fin q => (MvPowerSeries.X i : MvPowerSeries (Fin q) O))).map iota.toRingHom ≤
        RingHom.ker phi.toRingHom ⊔ (⊤ : Submodule A M).annihilator := by sorry

/-- CG Proposition 2.3 in the native square-presentation form of balance.
The group-ring comparison above identifies these unreduced coefficient quotients
with O[(Z/p^(N+1))^q]. Depth is a proof dependency, not a missing condition. -/
theorem balanced_modules_and_module_patching (O R H : Type u)
    [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [CharZero O]
    [Finite (IsLocalRing.ResidueField O)]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    [CommRing R] [IsLocalRing R] [IsNoetherianRing R] [Algebra O R]
    [IsLocalHom (algebraMap O R)]
    [Finite (IsLocalRing.ResidueField R)]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R]
    [AddCommGroup H] [Module R H] [Module O H] [IsScalarTower O R H]
    [Module.Finite R H] [Module.Finite O H]
    (q p : ℕ) (hq : 1 ≤ q) (hp : 3 ≤ p) [Fact p.Prime]
    [CharP (IsLocalRing.ResidueField O) p]
    (phi : ℕ → MvPowerSeries (Fin (q-1)) O →ₐ[O] R)
    (hphi : ∀ n, Function.Surjective (phi n))
    (HN : ℕ → Type u) [∀ n, AddCommGroup (HN n)] [∀ n, Module O (HN n)]
    [∀ n, Module (MvPowerSeries (Fin q) O) (HN n)]
    [∀ n, IsScalarTower O (MvPowerSeries (Fin q) O) (HN n)]
    [∀ n, Module (MvPowerSeries (Fin q) O ⧸ groupRelations O q p (n+1)) (HN n)]
    [∀ n, IsScalarTower (MvPowerSeries (Fin q) O)
      (MvPowerSeries (Fin q) O ⧸ groupRelations O q p (n+1)) (HN n)]
    [∀ n, Module.Finite (MvPowerSeries (Fin q) O ⧸ groupRelations O q p (n+1)) (HN n)]
    (hbalanced : ∀ n, Balanced
      (MvPowerSeries (Fin q) O ⧸ groupRelations O q p (n+1)) (HN n))
    (rho : ∀ n, MvPowerSeries (Fin (q-1)) O →+*
      Module.End (MvPowerSeries (Fin q) O) (HN n))
    (hcoeff : ∀ n (o : O) (x : HN n),
      rho n (algebraMap O (MvPowerSeries (Fin (q-1)) O) o) x = o • x)
    (specialize : ∀ n, HN n →ₗ[O] H)
    (hsurj : ∀ n, Function.Surjective (specialize n))
    (hker : ∀ n, (LinearMap.ker (specialize n)).toAddSubgroup =
      ((Ideal.span (Set.range fun i : Fin q => (MvPowerSeries.X i : MvPowerSeries (Fin q) O))) • ⊤ :
        Submodule (MvPowerSeries (Fin q) O) (HN n)).toAddSubgroup)
    (hequiv : ∀ (n : ℕ) (a : MvPowerSeries (Fin (q-1)) O) (x : HN n),
      specialize n (rho n a x) = phi n a • specialize n x)
    (himage : ∀ n (s : MvPowerSeries (Fin q) O),
      ∃ a : MvPowerSeries (Fin (q-1)) O, ∀ x : HN n, rho n a x = s • x)
    (haug : ∀ (n : ℕ) (s : MvPowerSeries (Fin q) O),
      s ∈ (Ideal.span (Set.range fun i : Fin q => (MvPowerSeries.X i : MvPowerSeries (Fin q) O))) →
      ∃ a : MvPowerSeries (Fin (q-1)) O,
        phi n a = 0 ∧ ∀ x : HN n, rho n a x = s • x) :
    Module.Free R H := by sorry

/-- Kisin's element-power ideal, kept distinct from the ordinary ideal power. -/
abbrev elementPowerIdeal (D : Type u) [CommRing D] [IsLocalRing D] (r : ℕ) : Ideal D :=
  Ideal.span {x | ∃ a ∈ IsLocalRing.maximalIdeal D, a ^ r = x}

/-- The two sorts of Kisin variables have different cutoff relations. -/
abbrev kisinCutoff (O : Type u) [CommRing O] (pi : O) (h j p m : ℕ) :
    Ideal (MvPowerSeries (Fin (h+j)) O) :=
  Ideal.span {MvPowerSeries.C pi ^ m} ⊔ Ideal.span (Set.range fun i : Fin (h+j) =>
    if i.val < h then (1 + MvPowerSeries.X i) ^ (p ^ m) - 1
      else MvPowerSeries.X i ^ (p ^ m))

/-- The mixed-characteristic estimate in Kisin's proof, with the nilpotent
residual-action step explicit. No ordinary maximal-ideal power is substituted. -/
theorem kisin_element_power_cutoff (O : Type u) [CommRing O] [IsLocalRing O]
    (pi : O) (hpi : Ideal.span {pi} = IsLocalRing.maximalIdeal O)
    (p : ℕ) [Fact p.Prime] [CharP (IsLocalRing.ResidueField O) p]
    (h j m s : ℕ) (hvars : 0 < h+j) (hm : 0 < m)
    (A L : Type u) [CommRing A] [Algebra (MvPowerSeries (Fin (h+j)) O) A]
    [AddCommGroup L] [Module A L] [Module (MvPowerSeries (Fin (h+j)) O) L]
    [IsScalarTower (MvPowerSeries (Fin (h+j)) O) A L]
    (a : A)
    (hnil : ∀ x : L, a ^ s • x ∈
      ((Ideal.span {MvPowerSeries.C pi} ⊔
        Ideal.span (Set.range fun i : Fin (h+j) => MvPowerSeries.X i)) • ⊤ :
          Submodule (MvPowerSeries (Fin (h+j)) O) L)) :
    ∀ x : L, a ^ (s * m * p ^ m * (h+j)) • x ∈
      (kisinCutoff O pi h j p m • ⊤ : Submodule (MvPowerSeries (Fin (h+j)) O) L) := by sorry

section KisinData

variable (S C D Q L V : Type u) [CommRing S] [CommRing C] [CommRing D] [CommRing Q]
  [IsLocalRing D] [Algebra C D] [Algebra C Q]
  [AddCommGroup L] [Module D L] [Module C L] [IsScalarTower C D L]
  [Module S L]
  [AddCommGroup V] [Module C V] [Module S V] [Module Q V]
  [IsScalarTower C Q V]
  (c : Ideal S) [Module (S ⧸ c) L]

/-- Algebraic core of the ring-module datum. Q is the specified quotient of R
and V is the specified quotient of M, not arbitrary replacement targets. -/
structure KisinPatchDatum (s r : ℕ) where
  scalar : (S ⧸ c) →+* D
  target : D →+* Q
  target_surjective : Function.Surjective target
  target_coeff : ∀ a : C, target (algebraMap C D a) = algebraMap C Q a
  framing_surjective : Function.Surjective (algebraMap C D)
  powerIdeal_zero : elementPowerIdeal D r = ⊥
  positive_bound : 0 < r
  basis : Module.Basis (Fin s) (S ⧸ c) L
  scalar_action : ∀ (a : S ⧸ c) (x : L), scalar a • x = a • x
  scalar_restrict : ∀ (a : S) (x : L), (Ideal.Quotient.mk c a) • x = a • x
  target_scalar : ∀ (a : S) (x : V), target (scalar (Ideal.Quotient.mk c a)) • x = a • x
  specialization : L →ₗ[C] V
  specialization_surjective : Function.Surjective specialization
  specialization_action : ∀ (a : D) (x : L), specialization (a • x) = target a • specialization x

end KisinData

namespace KisinPatchDatum

variable {S C D Q L V : Type u} [CommRing S] [CommRing C] [CommRing D] [CommRing Q]
  [IsLocalRing D] [Algebra C D] [Algebra C Q]
  [AddCommGroup L] [Module D L] [Module C L] [IsScalarTower C D L]
  [Module S L]
  [AddCommGroup V] [Module C V] [Module S V] [Module Q V]
  [IsScalarTower C Q V] {c : Ideal S} [Module (S ⧸ c) L] {s r : ℕ}

/-- Exposes the ring independently of its possibly nonfaithful action image. -/
def ring (_ : KisinPatchDatum S C D Q L V c s r) : Type u := D

/-- Actual ring and based-module comparison, with every decoration retained. -/
structure Equiv (T U : KisinPatchDatum S C D Q L V c s r) where
  ringEquiv : D ≃ₐ[C] D
  moduleEquiv : L ≃ₗ[C] L
  scalars : ∀ a : S ⧸ c, ringEquiv (T.scalar a) = U.scalar a
  target : U.target.comp ringEquiv.toRingHom = T.target
  actions : ∀ (a : D) (x : L), moduleEquiv (a • x) = ringEquiv a • moduleEquiv x
  basis : ∀ i, moduleEquiv (T.basis i) = U.basis i
  specialization : U.specialization.comp moduleEquiv.toLinearMap = T.specialization

lemma equiv_iff (T U : KisinPatchDatum S C D Q L V c s r) :
    Nonempty (Equiv T U) ↔
      ∃ (e : D ≃ₐ[C] D) (f : L ≃ₗ[C] L),
        (∀ a : S ⧸ c, e (T.scalar a) = U.scalar a) ∧
        U.target.comp e.toRingHom = T.target ∧
        (∀ (a : D) (x : L), f (a • x) = e a • f x) ∧
        (∀ i, f (T.basis i) = U.basis i) ∧
        U.specialization.comp f.toLinearMap = T.specialization := by sorry

/-- Full ring/module reduction, stated through genuine native quotient maps.
The target carriers and scalar structures are supplied with their quotient
kernel/action equations; the new basis and scalar map are constructed. -/
def reduce {D' Q' L' V' : Type u} [CommRing D'] [CommRing Q']
    [IsLocalRing D'] [Algebra C D'] [Algebra C Q']
    [AddCommGroup L'] [Module D' L'] [Module C L'] [Module S L']
    [IsScalarTower C D' L']
    [AddCommGroup V'] [Module C V'] [Module S V'] [Module Q' V']
    [IsScalarTower C Q' V']
    (T : KisinPatchDatum S C D Q L V c s r)
    (c' : Ideal S) [Module (S ⧸ c') L']
    (hc : c ≤ c') (r' : ℕ) (hr' : 0 < r')
    (qD : D →ₐ[C] D') (hD : Function.Surjective qD)
    (hkD : RingHom.ker qD.toRingHom =
      c'.map (T.scalar.comp (Ideal.Quotient.mk c)) ⊔ elementPowerIdeal D r')
    (qQ : Q →ₐ[C] Q') (hQ : Function.Surjective qQ)
    (hqt : RingHom.ker qD.toRingHom ≤ RingHom.ker (qQ.toRingHom.comp T.target))
    (qL : L →ₗ[C] L') (hL : Function.Surjective qL)
    (hkL : (LinearMap.ker qL).toAddSubgroup = (c' • ⊤ : Submodule S L).toAddSubgroup)
    (hact : ∀ (a : D) (x : L), qL (a • x) = qD a • qL x)
    (hscal : ∀ (a : S ⧸ c) (x : L),
      qL (a • x) = (Ideal.Quotient.factor hc a) • qL x)
    (hrestrict : ∀ (a : S) (x : L'), (Ideal.Quotient.mk c' a) • x = a • x)
    (qV : V →ₗ[C] V') (hV : Function.Surjective qV)
    (hkV : (LinearMap.ker qV).toAddSubgroup = (c' • ⊤ : Submodule S V).toAddSubgroup)
    (hvscal : ∀ (a : S) (x : V), qV (a • x) = a • qV x)
    (hvact : ∀ (a : Q) (x : V), qV (a • x) = qQ a • qV x) :
    {U : KisinPatchDatum S C D' Q' L' V' c' s r' //
      (∀ a : S ⧸ c, U.scalar (Ideal.Quotient.factor hc a) = qD (T.scalar a)) ∧
      U.target.comp qD.toRingHom = qQ.toRingHom.comp T.target ∧
      U.specialization.comp qL = qV.comp T.specialization ∧
      (∀ i, U.basis i = qL (T.basis i))} := by sorry

-- KisinPatchDatum.test_power_ideal
-- Exact concrete characteristic-p diagnostic, independent of the datum carrier.
example (k : Type u) [Field k] (p : ℕ) [Fact p.Prime] [CharP k p] :
    let P := MvPolynomial (Fin 2) k
    let J : Ideal P := Ideal.span {MvPolynomial.X (0 : Fin 2) ^ p,
      MvPolynomial.X (1 : Fin 2) ^ p}
    let D := P ⧸ J
    ∃ (_ : IsLocalRing D),
      elementPowerIdeal D p = ⊥ ∧ IsLocalRing.maximalIdeal D ^ p ≠ ⊥ := by sorry

-- KisinPatchDatum.test_ring_not_end_image: actual dual-number ring and quotient action.
example (k : Type u) [Field k] :
    let D := DualNumber k
    letI : Algebra D k := (TrivSqZeroExt.fstHom k k k).toRingHom.toAlgebra
    (DualNumber.eps : D) ≠ 0 ∧
      (∀ x : k, (DualNumber.eps : D) • x = 0) ∧
      ¬ Nonempty (D ≃ₐ[D] k) := by sorry

-- KisinPatchDatum.test_framing_kernel
example (T : KisinPatchDatum S C D Q L V c s r)
    (hD : c.map (T.scalar.comp (Ideal.Quotient.mk c)) = ⊥)
    (hL : (c • ⊤ : Submodule S L) = ⊥) :
    ∃ (eD : (D ⧸ (c.map (T.scalar.comp (Ideal.Quotient.mk c)) ⊔
        elementPowerIdeal D r)) ≃ₐ[C] D)
      (eL : (L ⧸ (c • ⊤ : Submodule S L)) ≃ₗ[S] L),
      (∀ x, eD (Ideal.Quotient.mk _ x) = x) ∧
      (∀ x, eL ((c • ⊤ : Submodule S L).mkQ x) = x) ∧
      (∀ x, T.target (eD (Ideal.Quotient.mk _ x)) = T.target x) ∧
      (∀ x, T.specialization (eL ((c • ⊤ : Submodule S L).mkQ x)) =
        T.specialization x) := by sorry

end KisinPatchDatum

/-- The augmentation uses only the first h variables. -/
abbrev kisinAugmentation (O : Type u) [CommRing O] (h j : ℕ) :
    Ideal (MvPowerSeries (Fin (h+j)) O) :=
  Ideal.span (Set.range fun i : Fin (h+j) =>
    if i.val < h then MvPowerSeries.X i else 0)

/-- Auxiliary input schema for the four finite-level conditions. It records
native rings, modules, quotient actions, maps and bases; it assumes no patched
object, comparison of original arithmetic levels, or generic-fibre conclusion. -/
structure KisinFiniteLevels (O B R M : Type u) [CommRing O] [CommRing B]
    [Algebra O B] [CommRing R] [Algebra B R]
    (h j d p : ℕ) [Algebra (MvPowerSeries (Fin (h+j)) O) R]
    [AddCommGroup M] [Module R M] [Module (MvPowerSeries (Fin (h+j)) O) M]
    [IsScalarTower (MvPowerSeries (Fin (h+j)) O) R M] where
  Rn : ℕ → Type u
  [rings : ∀ n, CommRing (Rn n)]
  [localRings : ∀ n, IsLocalRing (Rn n)]
  [base : ∀ n, Algebra B (Rn n)]
  [scalar : ∀ n, Algebra (MvPowerSeries (Fin (h+j)) O) (Rn n)]
  coefficients : ∀ n (o : O),
    algebraMap B (Rn n) (algebraMap O B o) =
      algebraMap (MvPowerSeries (Fin (h+j)) O) (Rn n) (MvPowerSeries.C o)
  localScalar : ∀ n, IsLocalHom (algebraMap (MvPowerSeries (Fin (h+j)) O) (Rn n))
  Mn : ℕ → Type u
  [groups : ∀ n, AddCommGroup (Mn n)]
  [actions : ∀ n, Module (Rn n) (Mn n)]
  [seriesActions : ∀ n, Module (MvPowerSeries (Fin (h+j)) O) (Mn n)]
  [scalarTowers : ∀ n, IsScalarTower (MvPowerSeries (Fin (h+j)) O) (Rn n) (Mn n)]
  phi : ∀ n, Rn n →ₐ[B] R
  phi_surjective : ∀ n, Function.Surjective (phi n)
  phi_scalar : ∀ n s, phi n (algebraMap (MvPowerSeries (Fin (h+j)) O) (Rn n) s) =
    algebraMap (MvPowerSeries (Fin (h+j)) O) R s
  phi_kernel : ∀ n, RingHom.ker (phi n).toRingHom =
    (kisinAugmentation O h j).map (algebraMap (MvPowerSeries (Fin (h+j)) O) (Rn n))
  specialize : ∀ n, Mn n →ₗ[MvPowerSeries (Fin (h+j)) O] M
  specialize_surjective : ∀ n, Function.Surjective (specialize n)
  specialize_kernel : ∀ n, LinearMap.ker (specialize n) =
    kisinAugmentation O h j • ⊤
  specialize_action : ∀ n (a : Rn n) x,
    specialize n (a • x) = phi n a • specialize n x
  bn : ℕ → Ideal (MvPowerSeries (Fin (h+j)) O)
  bn_eq : ∀ n, bn n = (⊤ : Submodule (MvPowerSeries (Fin (h+j)) O) (Mn n)).annihilator
  bn_le : ∀ n, bn n ≤ Ideal.span (Set.range fun i : Fin (h+j) =>
    if i.val < h then (1 + MvPowerSeries.X i) ^ (p ^ n) - 1 else 0)
  [quotientActions : ∀ n, Module (MvPowerSeries (Fin (h+j)) O ⧸ bn n) (Mn n)]
  [quotientTowers : ∀ n, IsScalarTower (MvPowerSeries (Fin (h+j)) O)
    (MvPowerSeries (Fin (h+j)) O ⧸ bn n) (Mn n)]
  rank : ℕ → ℕ
  basis : ∀ n, Module.Basis (Fin (rank n)) (MvPowerSeries (Fin (h+j)) O ⧸ bn n) (Mn n)
  framing : ∀ n, MvPowerSeries (Fin (h+j-d)) B →ₐ[B] Rn n
  framing_surjective : ∀ n, Function.Surjective (framing n)

attribute [instance] KisinFiniteLevels.rings KisinFiniteLevels.localRings
  KisinFiniteLevels.base KisinFiniteLevels.scalar KisinFiniteLevels.groups
  KisinFiniteLevels.actions KisinFiniteLevels.seriesActions KisinFiniteLevels.scalarTowers
  KisinFiniteLevels.quotientActions KisinFiniteLevels.quotientTowers

/-- The simultaneous construction retains the ring kernel as well as the
module kernel. Generic-fibre smoothness is not used until the next criterion. -/
theorem kisin_ring_module_patching (O B R M : Type u)
    [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [CharZero O]
    [Finite (IsLocalRing.ResidueField O)]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    [CommRing B] [IsDomain B] [IsLocalRing B] [IsNoetherianRing B]
    [Algebra O B] [Module.Flat O B] [IsLocalHom (algebraMap O B)]
    [Finite (IsLocalRing.ResidueField B)]
    [IsAdicComplete (IsLocalRing.maximalIdeal B) B]
    [CommRing R] [Algebra B R]
    (h j d p : ℕ) (hvars : 0 < h+j) (hd : d ≤ h+j)
    (hdim : ringKrullDim B = d+1) [Fact p.Prime] [CharP (IsLocalRing.ResidueField O) p]
    [Algebra (MvPowerSeries (Fin (h+j)) O) R]
    [AddCommGroup M] [Module R M] [Module (MvPowerSeries (Fin (h+j)) O) M]
    [IsScalarTower (MvPowerSeries (Fin (h+j)) O) R M] [Nontrivial M]
    (hcoeff : ∀ o : O, algebraMap B R (algebraMap O B o) =
      algebraMap (MvPowerSeries (Fin (h+j)) O) R (MvPowerSeries.C o))
    (input : KisinFiniteLevels O B R M h j d p) :
    ∃ (Rinf : Type u) (_ : CommRing Rinf) (_ : IsLocalRing Rinf)
      (_ : IsNoetherianRing Rinf) (_ : IsAdicComplete (IsLocalRing.maximalIdeal Rinf) Rinf)
      (_ : Algebra B Rinf) (_ : Algebra (MvPowerSeries (Fin (h+j)) O) Rinf)
      (Minf : Type u) (_ : AddCommGroup Minf) (_ : Module Rinf Minf)
      (_ : Module (MvPowerSeries (Fin (h+j)) O) Minf)
      (_ : IsScalarTower (MvPowerSeries (Fin (h+j)) O) Rinf Minf)
      (s : ℕ) (basis : Module.Basis (Fin s) (MvPowerSeries (Fin (h+j)) O) Minf)
      (framing : MvPowerSeries (Fin (h+j-d)) B →ₐ[B] Rinf)
      (phi : Rinf →ₐ[B] R)
      (specialize : Minf →ₗ[MvPowerSeries (Fin (h+j)) O] M),
      0 < s ∧ (∀ n, input.rank n = s) ∧ Function.Surjective framing ∧
      (∀ o : O, algebraMap B Rinf (algebraMap O B o) =
        algebraMap (MvPowerSeries (Fin (h+j)) O) Rinf (MvPowerSeries.C o)) ∧
      IsLocalHom (algebraMap (MvPowerSeries (Fin (h+j)) O) Rinf) ∧
      Function.Surjective phi ∧
      RingHom.ker phi.toRingHom =
        (kisinAugmentation O h j).map (algebraMap (MvPowerSeries (Fin (h+j)) O) Rinf) ∧
      Function.Surjective specialize ∧
      LinearMap.ker specialize = kisinAugmentation O h j • ⊤ ∧
      (∀ a x, specialize (a • x) = phi a • specialize x) ∧
      (∀ s0, phi (algebraMap (MvPowerSeries (Fin (h+j)) O) Rinf s0) =
        algebraMap (MvPowerSeries (Fin (h+j)) O) R s0) := by sorry

/-- Inverting the uniformizer can remove a nonzero integral action kernel.
The module is O with the R-action induced by phi; epsilon kills that module.
Its generic fibre is the field E under the displayed algebra equivalence. -/
theorem generic_fibre_versus_integral_faithfulness
    (O E : Type u) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [Field E] [Algebra O E] [IsFractionRing O E]
    (pi : O) (hpi : Ideal.span {pi} = IsLocalRing.maximalIdeal O) (hpi0 : pi ≠ 0) :
    let J : Ideal (Polynomial O) := Ideal.span
      {Polynomial.C pi * Polynomial.X, Polynomial.X ^ 2}
    let R := Polynomial O ⧸ J
    let epsilon : R := Ideal.Quotient.mk J Polynomial.X
    ∃ phi : R →ₐ[O] O,
      Function.Surjective phi ∧ epsilon ≠ 0 ∧ phi epsilon = 0 ∧
      algebraMap O R pi * epsilon = 0 ∧
      ∃ e : (E ⊗[O] R) ≃ₐ[E] E,
        ∀ r : R, e (1 ⊗ₜ[O] r) = algebraMap O E (phi r) := by sorry

/-- The component example has an actual regular sequence on its native module.
Its depth/dimension wording is supplied by the numerical interface request. -/
theorem generic_fibre_component_boundary (O : Type u)
    [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    (pi : O) (hpi : Ideal.span {pi} = IsLocalRing.maximalIdeal O) (hpi0 : pi ≠ 0) :
    let S := MvPowerSeries (Fin 2) O
    let J : Ideal S := Ideal.span {MvPowerSeries.X (0 : Fin 2) * MvPowerSeries.X (1 : Fin 2)}
    let A := S ⧸ J
    let U : Ideal A := Ideal.span {Ideal.Quotient.mk J (MvPowerSeries.X (0 : Fin 2))}
    let V : Ideal A := Ideal.span {Ideal.Quotient.mk J (MvPowerSeries.X (1 : Fin 2))}
    RingTheory.Sequence.IsRegular (A ⧸ U)
      [algebraMap O A pi, Ideal.Quotient.mk J (MvPowerSeries.X (1 : Fin 2))] ∧
      U ≠ ⊥ ∧ ¬ U ≤ V := by sorry

/- Named targets whose full statements require recorded supplier objects.
The reader and packet state every hypothesis and conclusion precisely.

balanced_square_presentation: Balanced S M ↔ β₁≤β₀, with a square
presentation of size β₀. The two Betti numbers need request 1 to R03.3.

patching_depth_numerical: the free case gives depth_A M=q+1; the square
proper-support case gives pd_S M=1 and depth_A M=q. Native regular
sequences and IsRegularLocalRing are imported, while depth and its comparison
need request 2 to R03.3. No new abstract depth is declared here.

kisin_patching_criterion (Kisin Proposition 3.3.1): R is finite over S₀,
M[1/p] finite projective faithful over R[1/p]. The source's complete-local
generic-fibre formal smoothness and regularity need request 3 to R03.1.
The same-dimensional-domain lemma is already the integrated R03.3 target.
No algebraic Algebra.FormallySmooth instance is asserted for it.
-/

/-- The native presentation has its expected finite generator bound. -/
theorem patched_module_finite {S : Type u} [CommRing S] {d r : ℕ}
    (P : Matrix (Fin d) (Fin r) S) : Module.Finite S (PatchedModule P) := by sorry

/-- The free case for the selected tower, characterized on every retained basis.
The action, scalar lift and specialization are supplied by their separate targets. -/
theorem free_module_patching {S A : Type u} [CommRing S] [CommRing A]
    [IsNoetherianRing S] [IsLocalRing S]
    [IsAdicComplete (IsLocalRing.maximalIdeal S) S]
    {I : ℕ → Ideal S} {d : ℕ} (T : CompatiblePatchTower S A I d 0)
    (hopen : ∀ n, ∃ e : ℕ, IsLocalRing.maximalIdeal S ^ e ≤ I n)
    (hcofinal : ∀ e : ℕ, ∃ n, I n ≤ IsLocalRing.maximalIdeal S ^ e) :
    ∃ e : (limit T.toInverseSystem).carrier ≃ₗ[S] (Fin d → S),
      ∀ n v, (limit.π T.toInverseSystem (Opposite.op n)).hom (e.symm v) =
        T.generators n (fun i => Ideal.Quotient.mk (I n) (v i)) := by sorry

end TauCeti.ModulePatching
