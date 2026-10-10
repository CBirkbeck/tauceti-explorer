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
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.Data.ZMod.Basic

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
def reductionEquiv (P : Matrix (Fin d) (Fin r) S) (I : Ideal S) :
    (PatchedModule P ⧸ (I • ⊤ : Submodule S (PatchedModule P))) ≃ₗ[S]
      PatchedModule (P.map (Ideal.Quotient.mk I)) := by sorry

-- PatchedModule.test_zero_matrix
example : Nonempty (PatchedModule (0 : Matrix (Fin d) (Fin r) S) ≃ₗ[S] (Fin d → S)) :=
  by sorry

-- PatchedModule.test_identity_matrix
example : Subsingleton (PatchedModule (1 : Matrix (Fin d) (Fin d) S)) := by sorry

-- PatchedModule.test_uniformizer_matrix: in fact valid for any scalar t.
example (t : S) :
    Nonempty (PatchedModule (fun (_ : Fin 1) (_ : Fin 1) => t) ≃ₗ[S]
      (S ⧸ Ideal.span {t})) := by sorry

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
      E.phi = g.comp D.phi} := by sorry

-- FinitePatchDatum.test_zero_presentation
example (D : FinitePatchDatum O S A R H X aug d 0) :
    Nonempty (X ≃ₗ[S] (Fin d → S)) := by sorry

-- FinitePatchDatum.test_action_distinguishes. In the reader take A=k[[u]],
-- X=k², and the two actions of u to be zero and the nonzero square-zero Jordan matrix.
example (D E : FinitePatchDatum O S A R H X aug d r) (a : A)
    (hgen : D.presentation.generator = E.presentation.generator)
    (hdiff : D.action a ≠ E.action a) : ¬ Nonempty (Equiv D E) := by sorry

-- FinitePatchDatum.test_specialization_kernel
-- In the reader X=(O/π^n)[z]/(z²), H=O/π^n, aug=(z), q=constant evaluation.
example (D : FinitePatchDatum O S A R H X aug d r) :
    ∀ x, D.specialization x = 0 ↔ x ∈ (aug • ⊤ : Submodule S X) := by sorry

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

-- CompatiblePatchTower.test_twisted_action
example (T : CompatiblePatchTower S A I d r) {m n : ℕ} (h : m ≤ n) (a : A)
    (x : T.toInverseSystem.obj (Opposite.op n))
    (hzero : T.action n a x = 0) :
    T.action m a ((T.toInverseSystem.map (homOfLE h).op).hom x) = 0 := by sorry

-- CompatiblePatchTower.test_skipping_levels
example (T : CompatiblePatchTower S A I d r) :
    Nonempty ((limit (T.cofinalRestrict (fun n => 2*n+1) (by
      intro m n h; change 2*m+1 < 2*n+1; omega)).toInverseSystem).carrier ≃ₗ[S]
      (limit T.toInverseSystem).carrier) := by sorry

/-- The specified coherent finite equivalences induce the native limit
comparison. No comparison of unrelated diagonal extractions is assumed. -/
theorem patching_choice_comparison (T U : CompatiblePatchTower S A I d r)
    (e : T.toInverseSystem ≅ U.toInverseSystem) :
    Nonempty ((limit T.toInverseSystem).carrier ≃ₗ[S]
      (limit U.toInverseSystem).carrier) := by sorry

end CompatiblePatchTower

namespace PatchedModule

variable {S A : Type u} [CommRing S] [CommRing A] [IsNoetherianRing S]
  [IsLocalRing S] [IsAdicComplete (IsLocalRing.maximalIdeal S) S]
  {I : ℕ → Ideal S} {d r : ℕ}

/-- This is the module-specific comparison with a native categorical limit.
Cofinal/open are stated as ideal inequalities, not an opaque condition. -/
def limitEquiv (T : CompatiblePatchTower S A I d r)
    (P : Matrix (Fin d) (Fin r) S)
    (hP : ∀ n, P.map (Ideal.Quotient.mk (I n)) = T.matrix n)
    (hopen : ∀ n, ∃ e : ℕ, IsLocalRing.maximalIdeal S ^ e ≤ I n)
    (hcofinal : ∀ e : ℕ, ∃ n, I n ≤ IsLocalRing.maximalIdeal S ^ e) :
    PatchedModule P ≃ₗ[S] (limit T.toInverseSystem).carrier := by sorry

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
        (IsLocalRing.maximalIdeal S ^ e • ⊤ : Submodule S T.H)) :
    Nonempty ((PatchedModule P ⧸
      (T.augmentation • ⊤ : Submodule S (PatchedModule P))) ≃ₗ[S] T.H) := by sorry

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

-- PatchedAction.test_nonfaithful: a variable v that vanishes on every finite
-- reduction vanishes on the separated patched module, not in the action ring.
example [IsHausdorff I M] (rho : A →+* Module.End S M) (v : A)
    (hv : ∀ n, endReduction I n (rho v) = 0) : rho v = 0 := by sorry

end PatchedAction
end LimitActions

/-- Kisin's element-power ideal, kept distinct from the ordinary ideal power. -/
abbrev elementPowerIdeal (D : Type u) [CommRing D] [IsLocalRing D] (r : ℕ) : Ideal D :=
  Ideal.span {x | ∃ a ∈ IsLocalRing.maximalIdeal D, a ^ r = x}

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

-- KisinPatchDatum.test_ring_not_end_image
example (T : KisinPatchDatum S C D Q L V c s r) (a : D) (ha : a ≠ 0)
    (hkill : ∀ x : L, a • x = 0) :
    ¬ Function.Injective (fun d : D => fun x : L => d • x) := by sorry

-- KisinPatchDatum.test_framing_kernel
example (T : KisinPatchDatum S C D Q L V c s r)
    (J : Ideal D) (hJ : J = ⊥) : Nonempty ((D ⧸ J) ≃ₐ[C] D) := by sorry

end KisinPatchDatum

/- Named targets whose full statements require recorded supplier objects.
The reader and packet state every hypothesis and conclusion precisely.

balanced_square_presentation: Balanced S M ↔ β₁≤β₀, with a square
presentation of size β₀. The two Betti numbers need request 1 to R03.3.

patching_depth_numerical: the free case gives depth_A M=q+1; the square
proper-support case gives pd_S M=1 and depth_A M=q. Native regular
sequences and IsRegularLocalRing are imported, while depth and its comparison
need request 2 to R03.3. No new abstract depth is declared here.

balanced_modules_and_module_patching (CG Proposition 2.3): with the two
separate scalar-image containments, balanced finite H_N and the A-linear
augmentation comparison, H is integrally R-free. q≥1, A has q−1 variables,
H=0 is handled directly. Depends on the previous depth target.

kisin_patching_criterion (Kisin Proposition 3.3.1): R is finite over S₀,
M[1/p] finite projective faithful over R[1/p]. The source's complete-local
generic-fibre formal smoothness and regularity need request 3 to R03.1.
The same-dimensional-domain lemma is already the integrated R03.3 target.
No algebraic Algebra.FormallySmooth instance is asserted for it.
-/

/-- The native presentation has its expected finite generator bound. -/
theorem patched_module_finite {S : Type u} [CommRing S] {d r : ℕ}
    (P : Matrix (Fin d) (Fin r) S) : Module.Finite S (PatchedModule P) := by sorry

/-- Free-presentation case of module patching, before numerical support arguments. -/
theorem free_module_patching {S : Type u} [CommRing S] (d : ℕ) :
    Nonempty (PatchedModule (0 : Matrix (Fin d) (Fin 0) S) ≃ₗ[S] (Fin d → S)) := by sorry

end TauCeti.ModulePatching
