import Mathlib.RingTheory.Regular.ProjectiveDimension
import Mathlib.RingTheory.Regular.Flat
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.RingTheory.KrullDimension.Regular
import Mathlib.RingTheory.Ideal.AssociatedPrime.Finiteness
import Mathlib.RingTheory.Ideal.AssociatedPrime.Localization
import Mathlib.RingTheory.Ideal.KrullsHeightTheorem
import Mathlib.RingTheory.Ideal.Cotangent
import Mathlib.RingTheory.LocalRing.Module
import Mathlib.RingTheory.LocalRing.Quotient
import Mathlib.RingTheory.Flat.FaithfullyFlat.Algebra
import Mathlib.RingTheory.AdicCompletion.AsTensorProduct
import Mathlib.RingTheory.AdicCompletion.LocalRing
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.RingTheory.MvPowerSeries.Equiv
import Mathlib.RingTheory.MvPowerSeries.Inverse
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.RingTheory.ReesAlgebra
import Mathlib.Algebra.Algebra.Tower
import Mathlib.Algebra.Homology.DerivedCategory.Ext.Linear
import Mathlib.Algebra.Homology.DerivedCategory.Ext.ExactSequences
import Mathlib.Algebra.Category.ModuleCat.Projective
import Mathlib.CategoryTheory.Abelian.Projective.Dimension
import Mathlib.CategoryTheory.Preadditive.Projective.Resolution
import Mathlib.Algebra.MvPolynomial.Basic

/-!
This file is not the roadmap and is not exhaustive. The reader document is definitive.
These statements suggest Lean forms so contributors and reviewers can converge on names and
signatures. They assert no implementation. All theorem proofs are placeholders.

R03.3, issue #6322, Codex. Mathlib 082e2d3; Tau Ceti f790474.
SF.0 and P7 are not installed library modules. The following *definition snapshots* retain
those suppliers' actual objects so the signatures can be checked at the pin. Assembly must
replace the snapshots with imports. They are not new targets or proved supplier results.
No Tor-amplitude, excellence, catenarity or derived algebra is simulated by a bare predicate.
-/

noncomputable section
universe u
open CategoryTheory CategoryTheory.Abelian IsLocalRing
open scoped TensorProduct Polynomial Pointwise

-- Supplier snapshot: SchemeAndStackFoundations:SF.0/depth.
namespace Module
variable (R : Type u) [CommRing R] (M : Type u) [AddCommGroup M] [Module R M]
def depth (I : Ideal R) : ℕ∞ :=
  ⨆ (s : List R) (_ : ∀ a ∈ s, a ∈ I) (_ : RingTheory.Sequence.IsWeaklyRegular M s),
    (s.length : ℕ∞)
abbrev primeLocalization (p : PrimeSpectrum R) := LocalizedModule p.asIdeal.primeCompl M
end Module
namespace IsLocalRing
variable (R : Type u) [CommRing R] [IsLocalRing R]
    (M : Type u) [AddCommGroup M] [Module R M]
def depth : ℕ∞ := Module.depth R M (maximalIdeal R)
end IsLocalRing
namespace Module
variable (R : Type u) [CommRing R] (M : Type u) [AddCommGroup M] [Module R M]
-- Supplier snapshot: SchemeAndStackFoundations:SF.0/cohen-macaulay.
def IsCohenMacaulay : Prop := IsNoetherianRing R ∧ Module.Finite R M ∧
  ∀ p : PrimeSpectrum R, Subsingleton (primeLocalization R M p) ∨
    (IsLocalRing.depth (Localization.AtPrime p.asIdeal) (primeLocalization R M p) : WithBot ℕ∞) =
      Module.supportDim (Localization.AtPrime p.asIdeal) (primeLocalization R M p)
end Module
namespace Ring
abbrev IsCohenMacaulay (R : Type u) [CommRing R] := Module.IsCohenMacaulay R R
end Ring

-- Supplier snapshot: P7's actual ordinary Rees quotient, degree-one class, generator map.
namespace TauCeti.HilbertSamuel
variable {R : Type u} [CommRing R]
abbrev reesCoefficientIdeal (q : Ideal R) := q.map (algebraMap R (reesAlgebra q))
abbrev adicGradedRing (q : Ideal R) := (reesAlgebra q) ⧸ reesCoefficientIdeal q
instance (q : Ideal R) : Algebra (R ⧸ q) (adicGradedRing q) :=
  Ideal.Quotient.algebraQuotientOfLEComap Ideal.le_comap_map
def adicDegreeOne (q : Ideal R) : q →ₗ[R] adicGradedRing q where
  toFun x := Ideal.Quotient.mk (reesCoefficientIdeal q)
    ⟨Polynomial.monomial 1 x.val, reesAlgebra.monomial_mem.mpr (by simpa only [pow_one] using x.property)⟩
  map_add' := by sorry
  map_smul' := by sorry
def adicGeneratorMap (q : Ideal R) {ι : Type*} (a : ι → q) :
    MvPolynomial ι (R ⧸ q) →ₐ[R ⧸ q] adicGradedRing q :=
  MvPolynomial.aeval (fun i => adicDegreeOne q (a i))
end TauCeti.HilbertSamuel

namespace TauCeti.PatchingAlgebra
variable {R S A : Type u} [CommRing R] [CommRing S] [CommRing A]

-- Convenience abbreviations for native objects, not additional target definitions.
abbrev pd (R : Type u) [CommRing R] (M : Type u) [AddCommGroup M] [Module R M] :=
  CategoryTheory.projectiveDimension (ModuleCat.of R M)
abbrev closedFiber [IsLocalRing R] [Algebra R S] :=
  S ⧸ (maximalIdeal R).map (algebraMap R S)
abbrev fiberModule [IsLocalRing R] [Algebra R S] (N : Type u) [AddCommGroup N] [Module S N] :=
  N ⧸ ((maximalIdeal R).map (algebraMap R S) • ⊤ : Submodule S N)

-- These are routine quotient-instance bridges, not replacement mathematical hypotheses.
instance quotientNontrivial (I : Ideal R) [Fact (I ≠ ⊤)] : Nontrivial (R ⧸ I) :=
  Ideal.Quotient.nontrivial_iff.mpr (Fact.out : I ≠ ⊤)
instance quotientLocal [IsLocalRing R] (I : Ideal R) [Fact (I ≠ ⊤)] : IsLocalRing (R ⧸ I) :=
  IsLocalRing.of_surjective' (Ideal.Quotient.mk I) Ideal.Quotient.mk_surjective
instance closedFiberProper [IsLocalRing R] [IsLocalRing S] [Algebra R S]
    [IsLocalHom (algebraMap R S)] :
    Fact ((maximalIdeal R).map (algebraMap R S) ≠ ⊤) := by sorry
-- node: regular-sequence-ideal.
def IsRegularSequenceIdeal (I : Ideal R) : Prop :=
  ∃ f : List R, Ideal.ofList f = I ∧ RingTheory.Sequence.IsRegular R f

namespace IsRegularSequenceIdeal
lemma of_list (f : List R) (hf : RingTheory.Sequence.IsRegular R f) :
    IsRegularSequenceIdeal (Ideal.ofList f) := by sorry
lemma ne_top {I : Ideal R} (hI : IsRegularSequenceIdeal I) : I ≠ ⊤ := by sorry
lemma map_equiv (e : R ≃+* S) (I : Ideal R) :
    IsRegularSequenceIdeal (I.map e.toRingHom) ↔ IsRegularSequenceIdeal I := by sorry
lemma bot [Nontrivial R] : IsRegularSequenceIdeal (⊥ : Ideal R) := by sorry
-- TauCeti.PatchingAlgebra.IsRegularSequenceIdeal.test_empty
example [Nontrivial R] : IsRegularSequenceIdeal (⊥ : Ideal R) := by sorry
-- TauCeti.PatchingAlgebra.IsRegularSequenceIdeal.test_unit
example : ¬ IsRegularSequenceIdeal (⊤ : Ideal R) := by sorry
-- TauCeti.PatchingAlgebra.IsRegularSequenceIdeal.test_polynomial
example {k : Type u} [Field k] :
    IsRegularSequenceIdeal (Ideal.span ({Polynomial.X} : Set k[X])) ∧
      ¬ RingTheory.Sequence.IsRegular k[X] ([0] : List k[X]) := by sorry
end IsRegularSequenceIdeal

section RegularSequences
variable [IsLocalRing R] [IsNoetherianRing R]
lemma regular_generators_iff_dimension_drop (hCM : Ring.IsCohenMacaulay R)
    (f : List R) (hf : ∀ x ∈ f, x ∈ maximalIdeal R) :
    RingTheory.Sequence.IsRegular R f ↔
      ringKrullDim (R ⧸ Ideal.ofList f) + f.length = ringKrullDim R := by sorry
lemma cm_parameter_element (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Nontrivial M] (hCM : Module.IsCohenMacaulay R M)
    (x : R) (hx : x ∈ maximalIdeal R)
    (hd : Module.supportDim R (QuotSMulTop x M) + 1 = Module.supportDim R M) :
    IsSMulRegular M x := by sorry
lemma regular_sequence_ideal_minimal_generators (I : Ideal R)
    (hI : IsRegularSequenceIdeal I) (f : List R) (hf : Ideal.ofList f = I)
    (hmin : (f.length : ℕ∞) = I.spanFinrank) : RingTheory.Sequence.IsRegular R f := by sorry
lemma regular_sequence_ideal_faithfully_flat [IsLocalRing S] [IsNoetherianRing S]
    [Algebra R S] [IsLocalHom (algebraMap R S)] [Module.Flat R S]
    (I : Ideal R) (hI : I ≠ ⊤) :
    IsRegularSequenceIdeal I ↔ IsRegularSequenceIdeal (I.map (algebraMap R S)) := by sorry
end RegularSequences

lemma regular_sequence_reflects_faithfully_flat [Algebra R S] [Module.FaithfullyFlat R S]
    (M : Type u) [AddCommGroup M] [Module R M] (f : List R) :
    RingTheory.Sequence.IsRegular M f ↔
      RingTheory.Sequence.IsRegular (S ⊗[R] M) (f.map (algebraMap R S)) := by sorry
lemma regular_surjection_kernel [IsRegularLocalRing R] [IsRegularLocalRing S]
    (φ : R →+* S) (hφ : Function.Surjective φ) :
    ∃ f : List R, RingTheory.Sequence.IsRegular R f ∧ Ideal.ofList f = RingHom.ker φ ∧
      ringKrullDim S + f.length = ringKrullDim R ∧
      ∃ g : List R, RingTheory.Sequence.IsRegular R (f ++ g) ∧
        Ideal.ofList (f ++ g) = maximalIdeal R ∧
        (f ++ g).length = (maximalIdeal R).spanFinrank := by sorry
lemma regular_presentation_change [IsRegularLocalRing R] [IsRegularLocalRing S]
    [IsLocalRing A] [IsNoetherianRing A] (φ : R →+* S) (ψ : S →+* A)
    (hφ : Function.Surjective φ) (hψ : Function.Surjective ψ) :
    IsRegularSequenceIdeal (RingHom.ker (ψ.comp φ)) ↔
      IsRegularSequenceIdeal (RingHom.ker ψ) := by sorry

section Resolutions
variable [IsLocalRing R] [IsNoetherianRing R]
variable (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M]
lemma finite_free_resolution (n : ℕ) : pd R M ≤ n ↔
    ∃ P : ProjectiveResolution (ModuleCat.of R M),
      (∀ i, Module.Finite R (P.complex.X i) ∧ Module.Free R (P.complex.X i)) ∧
      (∀ i, n < i → Subsingleton (P.complex.X i)) := by sorry
lemma minimal_finite_resolution (n : ℕ) (hp : pd R M ≤ n) :
    ∃ P : ProjectiveResolution (ModuleCat.of R M),
      (∀ i, Module.Finite R (P.complex.X i) ∧ Module.Free R (P.complex.X i)) ∧
      (∀ i, n < i → Subsingleton (P.complex.X i)) ∧
      (∀ i, LinearMap.range (P.complex.d (i + 1) i).hom ≤
        maximalIdeal R • (⊤ : Submodule R (P.complex.X i))) := by sorry
lemma minimal_resolution_pd [Nontrivial M] (n : ℕ)
    (P : ProjectiveResolution (ModuleCat.of R M))
    (hF : ∀ i, Module.Finite R (P.complex.X i) ∧ Module.Free R (P.complex.X i))
    (hbound : ∀ i, n < i → Subsingleton (P.complex.X i))
    (hmin : ∀ i, LinearMap.range (P.complex.d (i + 1) i).hom ≤
      maximalIdeal R • (⊤ : Submodule R (P.complex.X i)))
    (hn : Nontrivial (P.complex.X n)) : pd R M = n := by sorry
lemma depth_finite_free [Nontrivial M] [Module.Free R M] :
    IsLocalRing.depth R M = IsLocalRing.depth R R := by sorry
end Resolutions

lemma ext_residue_annihilated [IsLocalRing R]
    (N : Type u) [AddCommGroup N] [Module R N] (i : ℕ)
    (a : R) (ha : a ∈ maximalIdeal R)
    (z : Ext (ModuleCat.of R (ResidueField R)) (ModuleCat.of R N) i) : a • z = 0 := by sorry
lemma ext_minimal_map_zero [IsLocalRing R]
    (F G : Type u) [AddCommGroup F] [AddCommGroup G] [Module R F] [Module R G]
    [Module.Finite R F] [Module.Finite R G] [Module.Free R F] [Module.Free R G]
    (u : F →ₗ[R] G) (hu : LinearMap.range u ≤ maximalIdeal R • (⊤ : Submodule R G))
    (i : ℕ) :
    Ext.postcompOfLinear (Ext.mk₀ (ModuleCat.ofHom u)) R
      (ModuleCat.of R (ResidueField R)) (add_zero i) = 0 := by sorry

section Depth
variable [IsLocalRing R] [IsNoetherianRing R]
variable (K F M : Type u) [AddCommGroup K] [AddCommGroup F] [AddCommGroup M]
    [Module R K] [Module R F] [Module R M]
    [Module.Finite R K] [Module.Finite R F] [Module.Finite R M]
    [Nontrivial K] [Nontrivial F] [Nontrivial M]
lemma minimal_free_injection_depth [Module.Free R K] [Module.Free R F]
    (u : K →ₗ[R] F) (v : F →ₗ[R] M) (hu : Function.Injective u)
    (hex : Function.Exact u v) (hv : Function.Surjective v)
    (hmin : LinearMap.range u ≤ maximalIdeal R • (⊤ : Submodule R F)) :
    1 ≤ IsLocalRing.depth R R ∧ IsLocalRing.depth R M + 1 = IsLocalRing.depth R R := by sorry
lemma depth_syzygy_strict (u : K →ₗ[R] F) (v : F →ₗ[R] M)
    (hu : Function.Injective u) (hex : Function.Exact u v) (hv : Function.Surjective v)
    (hdep : IsLocalRing.depth R K < IsLocalRing.depth R F) :
    1 ≤ IsLocalRing.depth R K ∧ IsLocalRing.depth R M + 1 = IsLocalRing.depth R K := by sorry
end Depth

lemma auslander_buchsbaum [IsLocalRing R] [IsNoetherianRing R]
    (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M] [Nontrivial M]
    (hp : ∃ n : ℕ, pd R M ≤ n) :
    pd R M + (IsLocalRing.depth R M : WithBot ℕ∞) = (IsLocalRing.depth R R : WithBot ℕ∞) := by sorry
lemma regular_quotient_pd_change [IsLocalRing R] [IsNoetherianRing R]
    (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M] [Nontrivial M]
    (hp : ∃ n : ℕ, pd R M ≤ n) (x : R) (hx : x ∈ maximalIdeal R)
    (hR : IsSMulRegular R x) (hM : IsSMulRegular M x) :
    pd (R ⧸ Ideal.span {x}) (QuotSMulTop x M) = pd R M := by sorry

lemma syzygy_depth_bound [IsLocalRing R] [IsNoetherianRing R]
    (K F : ℕ → ModuleCat R) (u : ∀ j, K (j + 1) ⟶ F j) (v : ∀ j, F j ⟶ K j)
    (hfinite : ∀ j, Module.Finite R (K j) ∧ Module.Finite R (F j))
    (hfree : ∀ j, Module.Free R (F j)) (hinj : ∀ j, Function.Injective (u j))
    (hex : ∀ j, Function.Exact (u j) (v j)) (hsurj : ∀ j, Function.Surjective (v j))
    (j : ℕ) : min (IsLocalRing.depth R R) (IsLocalRing.depth R (K 0) + j) ≤
      IsLocalRing.depth R (K j) := by sorry
lemma regular_local_finite_pd [IsRegularLocalRing R] (d : ℕ) (hd : ringKrullDim R = d)
    (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M] : pd R M ≤ d := by sorry
lemma regular_residue_pd [IsRegularLocalRing R] (d : ℕ) (hd : ringKrullDim R = d) :
    pd R (ResidueField R) = d := by sorry
lemma depth_submodule_bound [IsLocalRing R] [IsNoetherianRing R]
    (N : Type u) [AddCommGroup N] [Module R N] [Module.Finite R N]
    (M : Submodule R N) [Nontrivial M] :
    (IsLocalRing.depth R N : WithBot ℕ∞) ≤ Module.supportDim R M := by sorry

section LocalActions
variable [IsLocalRing R] [IsNoetherianRing R] [IsLocalRing S] [IsNoetherianRing S]
    [Algebra R S] [IsLocalHom (algebraMap R S)]
variable (N : Type u) [AddCommGroup N] [Module R N] [Module S N] [IsScalarTower R S N]
lemma depth_surjective_local [Module.Finite S N] (h : Function.Surjective (algebraMap R S)) :
    IsLocalRing.depth R N = IsLocalRing.depth S N := by sorry
lemma depth_finite_local [Module.Finite R S] [Module.Finite S N] :
    IsLocalRing.depth R N = IsLocalRing.depth S N := by sorry
lemma depth_finite_action [Nontrivial N] [Module.Finite R N] :
    IsLocalRing.depth R N = IsLocalRing.depth S N := by sorry
lemma support_dimension_finite_action [Nontrivial N] [Module.Finite R N] :
    Module.supportDim R N = Module.supportDim S N := by sorry
end LocalActions
lemma module_miracle_flatness [IsRegularLocalRing R] [IsLocalRing S] [IsNoetherianRing S]
    [Algebra R S] [IsLocalHom (algebraMap R S)]
    (N : Type u) [AddCommGroup N] [Module R N] [Module S N] [IsScalarTower R S N] [Nontrivial N] [Module.Finite R N]
    (hCM : Module.IsCohenMacaulay S N) (hd : Module.supportDim S N = ringKrullDim R) :
    Module.Free R N := by sorry

-- Scalar restriction has an exact associated-prime comparison; finiteness of the map is absent.
lemma associated_primes_scalar_restriction [IsNoetherianRing S] [Algebra R S]
    (N : Type u) [AddCommGroup N] [Module R N] [Module S N] [IsScalarTower R S N] :
    associatedPrimes R N = (Ideal.comap (algebraMap R S)) '' associatedPrimes S N := by sorry

lemma depth_finite_semilocal [IsLocalRing R] [IsNoetherianRing R] [Algebra R S]
    [Module.Finite R S] [Nontrivial S]
    (N : Type u) [AddCommGroup N] [Module R N] [Module S N] [IsScalarTower R S N]
    [Module.Finite S N] :
    Module.depth R N (maximalIdeal R) =
      ⨅ (q : PrimeSpectrum S) (_ : q.asIdeal.IsMaximal),
        IsLocalRing.depth (Localization.AtPrime q.asIdeal) (Module.primeLocalization S N q) := by sorry
lemma finite_action_image [IsNoetherianRing R] [Algebra R S]
    (M : Type u) [AddCommGroup M] [Module R M] [Module S M] [IsScalarTower R S M]
    [Module.Finite R M] :
    Module.Finite R (Algebra.lsmul R R M : S →ₐ[R] Module.End R M).range ∧
      Nonempty ((S ⧸ Module.annihilator S M) ≃+*
        (Algebra.lsmul R R M : S →ₐ[R] Module.End R M).range) := by sorry
lemma equal_dimension_action_faithful [IsNoetherianRing R] [IsNoetherianRing S]
    [IsDomain R] [IsDomain S] [Algebra R S]
    (d : ℕ) (hR : ringKrullDim R = d) (hS : ringKrullDim S = d)
    (M : Type u) [AddCommGroup M] [Module R M] [Module S M] [IsScalarTower R S M]
    [Module.Finite R M] [FaithfulSMul R M] [Nontrivial M] :
    FaithfulSMul S M ∧ Module.Finite R S := by sorry
lemma kisin_projective_module [IsNoetherianRing R] [IsNoetherianRing S]
    [IsDomain R] [IsDomain S] [Algebra R S]
    (hregR : ∀ p : PrimeSpectrum R, IsRegularLocalRing (Localization.AtPrime p.asIdeal))
    (hregS : ∀ p : PrimeSpectrum S, IsRegularLocalRing (Localization.AtPrime p.asIdeal))
    (d : ℕ) (hR : ringKrullDim R = d) (hS : ringKrullDim S = d)
    (M : Type u) [AddCommGroup M] [Module R M] [Module S M] [IsScalarTower R S M]
    [Module.Finite R M] [Module.Projective R M] [Nontrivial M] :
    Module.Finite S M ∧ Module.Projective S M ∧ FaithfulSMul S M ∧ Module.Finite R S := by sorry

lemma flat_fibre_injection_cokernel [IsLocalRing R] [IsNoetherianRing R]
    [IsLocalRing S] [IsNoetherianRing S] [Algebra R S] [IsLocalHom (algebraMap R S)]
    (N : Type u) [AddCommGroup N] [Module R N] [Module S N] [IsScalarTower R S N]
    [Module.Finite S N]
    (P : Type u) [AddCommGroup P] [Module R P] [Module.Flat R P] (u : N →ₗ[R] P)
    (hf : Function.Injective
      ((maximalIdeal R • (⊤ : Submodule R N)).mapQ
        (maximalIdeal R • (⊤ : Submodule R P)) u (by
          rw [← Submodule.map_le_iff_le_comap, Submodule.map_smul'']
          exact smul_mono_right _ le_top))) :
    Function.Injective u ∧ Module.Flat R (P ⧸ LinearMap.range u) := by sorry

section FlatLocal
variable [IsLocalRing R] [IsNoetherianRing R] [IsLocalRing S] [IsNoetherianRing S]
    [Algebra R S] [IsLocalHom (algebraMap R S)]
variable (N : Type u) [AddCommGroup N] [Module R N] [Module S N] [IsScalarTower R S N]
    [Module.Finite S N] [Module.Flat R N]
lemma flat_fibre_regular_lift (y : S) (hy : y ∈ maximalIdeal S)
    (hreg : IsSMulRegular (fiberModule (R := R) (S := S) N) y) :
    IsSMulRegular N y ∧ Module.Flat R (QuotSMulTop y N) := by sorry
lemma flat_depth_zero_fibre [Nontrivial N]
    (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M] [Nontrivial M]
    (hf : IsLocalRing.depth (closedFiber (R := R) (S := S))
      (fiberModule (R := R) (S := S) N) = 0) :
    IsLocalRing.depth S (N ⊗[R] M) = IsLocalRing.depth R M := by sorry
lemma flat_local_tensor_depth [Nontrivial N]
    (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M] [Nontrivial M] :
    IsLocalRing.depth S (N ⊗[R] M) = IsLocalRing.depth R M +
      IsLocalRing.depth (closedFiber (R := R) (S := S))
        (fiberModule (R := R) (S := S) N) := by sorry
lemma relative_flat_module_free [Module.Flat R S]
    (hf : Module.Free (closedFiber (R := R) (S := S))
      (fiberModule (R := R) (S := S) N)) : Module.Free S N := by sorry
lemma relative_flat_module_pd [Module.Flat R S]
    [IsRegularLocalRing (closedFiber (R := R) (S := S))]
    (d : ℕ) (hd : ringKrullDim (closedFiber (R := R) (S := S)) = d) : pd S N ≤ d := by sorry
end FlatLocal
lemma flat_local_ring_depth [IsLocalRing R] [IsNoetherianRing R]
    [IsLocalRing S] [IsNoetherianRing S] [Algebra R S] [IsLocalHom (algebraMap R S)]
    [Module.Flat R S] :
    IsLocalRing.depth S S = IsLocalRing.depth R R +
      IsLocalRing.depth (closedFiber (R := R) (S := S)) (closedFiber (R := R) (S := S)) := by sorry
lemma flat_local_cm [IsLocalRing R] [IsNoetherianRing R]
    [IsLocalRing S] [IsNoetherianRing S] [Algebra R S] [IsLocalHom (algebraMap R S)]
    [Module.Flat R S] :
    Ring.IsCohenMacaulay S ↔ Ring.IsCohenMacaulay R ∧
      Ring.IsCohenMacaulay (closedFiber (R := R) (S := S)) := by sorry
lemma completion_depth [IsLocalRing R] [IsNoetherianRing R]
    (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M] [Nontrivial M] :
    IsLocalRing.depth (AdicCompletion (maximalIdeal R) R) (AdicCompletion (maximalIdeal R) M) =
      IsLocalRing.depth R M := by sorry

-- node: has-regular-sequence-presentation. The quantified source ring is actual data.
def HasRegularSequencePresentation (A : Type u) [CommRing A] : Prop :=
  ∃ S : CommRingCat.{u}, IsRegularLocalRing S ∧
    ∃ φ : S →+* A, Function.Surjective φ ∧ IsRegularSequenceIdeal (RingHom.ker φ)
-- node: complete-intersection-local. It is absolute and uses the actual completion.
def IsCompleteIntersection (A : Type u) [CommRing A] [IsLocalRing A] : Prop :=
  IsNoetherianRing A ∧ HasRegularSequencePresentation (AdicCompletion (maximalIdeal A) A)
-- node: locally-complete-intersection. Prime localization, not an lci morphism.
def IsLocallyCompleteIntersection (A : Type u) [CommRing A] : Prop :=
  IsNoetherianRing A ∧ ∀ p : PrimeSpectrum A, IsCompleteIntersection (Localization.AtPrime p.asIdeal)

namespace HasRegularSequencePresentation
lemma of_regular [IsRegularLocalRing A] : HasRegularSequencePresentation A := by sorry
lemma nontrivial (h : HasRegularSequencePresentation A) : Nontrivial A := by sorry
lemma congr (e : A ≃+* S) : HasRegularSequencePresentation A ↔ HasRegularSequencePresentation S := by sorry
-- TauCeti.PatchingAlgebra.HasRegularSequencePresentation.test_field
example {k : Type u} [Field k] : HasRegularSequencePresentation k := by sorry
-- TauCeti.PatchingAlgebra.HasRegularSequencePresentation.test_dual_numbers
example {k : Type u} [Field k] :
    HasRegularSequencePresentation (PowerSeries k ⧸ Ideal.span {(PowerSeries.X : PowerSeries k) ^ 2}) ∧
      ¬ IsRegularLocalRing (PowerSeries k ⧸ Ideal.span {(PowerSeries.X : PowerSeries k) ^ 2}) := by sorry
-- TauCeti.PatchingAlgebra.HasRegularSequencePresentation.test_zero_ring
example [Subsingleton A] : ¬ HasRegularSequencePresentation A := by sorry
end HasRegularSequencePresentation
namespace IsCompleteIntersection
lemma isNoetherian [IsLocalRing A] (h : IsCompleteIntersection A) : IsNoetherianRing A := by sorry
lemma completion_presentation [IsLocalRing A] (h : IsCompleteIntersection A) :
    HasRegularSequencePresentation (AdicCompletion (maximalIdeal A) A) := by sorry
lemma congr [IsLocalRing A] [IsLocalRing S] (e : A ≃+* S) :
    IsCompleteIntersection A ↔ IsCompleteIntersection S := by sorry
-- TauCeti.PatchingAlgebra.IsCompleteIntersection.test_field
example {k : Type u} [Field k] : IsCompleteIntersection k := by sorry
end IsCompleteIntersection

-- Explicit small quotients for the remaining definition tests. These are concrete rings.
abbrev dualNumbers (k : Type u) [Field k] := PowerSeries k ⧸ Ideal.span {(PowerSeries.X : PowerSeries k) ^ 2}
instance dualNumbersProper (k : Type u) [Field k] :
    Fact ((Ideal.span {(PowerSeries.X : PowerSeries k) ^ 2} : Ideal (PowerSeries k)) ≠ ⊤) := by sorry
abbrev badArtin (k : Type u) [Field k] := MvPowerSeries (Fin 2) k ⧸
  (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → MvPowerSeries (Fin 2) k))) ^ 2
instance badArtinProper (k : Type u) [Field k] :
    Fact (((Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → MvPowerSeries (Fin 2) k))) ^ 2) ≠ ⊤) := by sorry
-- TauCeti.PatchingAlgebra.IsCompleteIntersection.test_hypersurface
example {k : Type u} [Field k] : IsCompleteIntersection (dualNumbers k) ∧
    ¬ IsRegularLocalRing (dualNumbers k) := by sorry
-- TauCeti.PatchingAlgebra.IsCompleteIntersection.test_non_ci_artin
example {k : Type u} [Field k] :
    Ring.IsCohenMacaulay (badArtin k) ∧ ringKrullDim (badArtin k) = 0 ∧
      ¬ IsCompleteIntersection (badArtin k) := by sorry

namespace IsLocallyCompleteIntersection
lemma isNoetherian (h : IsLocallyCompleteIntersection A) : IsNoetherianRing A := by sorry
lemma atPrime (h : IsLocallyCompleteIntersection A) (p : PrimeSpectrum A) :
    IsCompleteIntersection (Localization.AtPrime p.asIdeal) := by sorry
lemma congr (e : A ≃+* S) : IsLocallyCompleteIntersection A ↔ IsLocallyCompleteIntersection S := by sorry
-- TauCeti.PatchingAlgebra.IsLocallyCompleteIntersection.test_zero_ring
example [Subsingleton A] : IsLocallyCompleteIntersection A := by sorry
-- TauCeti.PatchingAlgebra.IsLocallyCompleteIntersection.test_polynomial
example {k : Type u} [Field k] : IsLocallyCompleteIntersection k[X] := by sorry
-- TauCeti.PatchingAlgebra.IsLocallyCompleteIntersection.test_bad_factor
example {k : Type u} [Field k] : ¬ IsLocallyCompleteIntersection (k × badArtin k) := by sorry
end IsLocallyCompleteIntersection

lemma complete_presentation_independence [IsLocalRing A] [IsNoetherianRing A]
    [IsAdicComplete (maximalIdeal A) A] [IsRegularLocalRing S]
    (φ : S →+* A) (hφ : Function.Surjective φ) :
    HasRegularSequencePresentation A ↔ IsRegularSequenceIdeal (RingHom.ker φ) := by sorry
lemma ci_regular_quotient [IsRegularLocalRing R] (I : Ideal R)
    [Fact (I ≠ ⊤)] (hI : I ≤ maximalIdeal R) :
    IsCompleteIntersection (R ⧸ I) ↔ IsRegularSequenceIdeal I := by sorry
lemma conormal_generators_lift [IsLocalRing R] [IsNoetherianRing R]
    (I : Ideal R) (hI : I ≤ maximalIdeal R) (c : ℕ) (f : Fin c → I)
    (hf : Submodule.span (R ⧸ I) (Set.range fun i => I.toCotangent (f i)) = ⊤) :
    Ideal.span (Set.range fun i => (f i : R)) = I := by sorry
lemma ci_conormal_criterion [IsRegularLocalRing R] (I : Ideal R) [Fact (I ≠ ⊤)]
    (hI : I ≤ maximalIdeal R) (c : ℕ) (hc : ringKrullDim (R ⧸ I) + c = ringKrullDim R) :
    IsCompleteIntersection (R ⧸ I) ↔
      ∃ f : Fin c → I.Cotangent, Submodule.span (R ⧸ I) (Set.range f) = ⊤ := by sorry

-- Actual quotient maps determine the module structures in these signatures.
lemma finite_tor_conormal_injection [IsLocalRing R] [IsNoetherianRing R]
    (I J : Ideal R) (hIJ : I ≤ J) (hJ : J ≤ maximalIdeal R) :
    let φ : R ⧸ I →+* R ⧸ J := Ideal.quotientMap J (RingHom.id R) (by simpa using hIJ)
    letI := φ.toAlgebra
    (∃ n : ℕ, pd (R ⧸ I) (R ⧸ J) ≤ n) → I ⊓ (maximalIdeal R * J) = maximalIdeal R * I := by sorry
lemma nested_regular_ideals [IsLocalRing R] [IsNoetherianRing R]
    (I J : Ideal R) (hIJ : I ≤ J) (hJm : J ≤ maximalIdeal R)
    (hJ : IsRegularSequenceIdeal J) :
    let φ : R ⧸ I →+* R ⧸ J := Ideal.quotientMap J (RingHom.id R) (by simpa using hIJ)
    letI := φ.toAlgebra
    (∃ n : ℕ, pd (R ⧸ I) (R ⧸ J) ≤ n) →
      IsRegularSequenceIdeal I ∧ IsRegularSequenceIdeal (J.map (Ideal.Quotient.mk I)) := by sorry
lemma flat_regular_fibre_ideals [IsLocalRing R] [IsNoetherianRing R]
    [IsLocalRing S] [IsNoetherianRing S] [Algebra R S] [IsLocalHom (algebraMap R S)]
    [Module.Flat R S] [IsRegularLocalRing (closedFiber (R := R) (S := S))]
    (I : Ideal R) (J : Ideal S) (hI : I ≤ maximalIdeal R) (hJ : J ≤ maximalIdeal S)
    (hIJ : I.map (algebraMap R S) ≤ J) :
    let φ : R ⧸ I →+* S ⧸ J :=
      Ideal.quotientMap J (algebraMap R S) (Ideal.map_le_iff_le_comap.mp hIJ)
    letI := φ.toAlgebra
    Module.Flat (R ⧸ I) (S ⧸ J) →
      (IsRegularSequenceIdeal J ↔ IsRegularSequenceIdeal I ∧
        IsRegularSequenceIdeal (J.map (Ideal.Quotient.mk (I.map (algebraMap R S))))) := by sorry
lemma flat_local_ci [IsLocalRing R] [IsNoetherianRing R]
    [IsLocalRing S] [IsNoetherianRing S] [Algebra R S] [IsLocalHom (algebraMap R S)]
    [Module.Flat R S] : IsCompleteIntersection S ↔ IsCompleteIntersection R ∧
      IsCompleteIntersection (closedFiber (R := R) (S := S)) := by sorry
lemma ci_localization [IsLocalRing R] [IsNoetherianRing R]
    (hCI : IsCompleteIntersection R) (p : PrimeSpectrum R) :
    IsCompleteIntersection (Localization.AtPrime p.asIdeal) := by sorry
lemma ci_maximal_detection [IsNoetherianRing R] : IsLocallyCompleteIntersection R ↔
    ∀ p : PrimeSpectrum R, p.asIdeal.IsMaximal →
      IsCompleteIntersection (Localization.AtPrime p.asIdeal) := by sorry
lemma ci_cohen_macaulay [IsLocalRing R] [IsNoetherianRing R]
    (hCI : IsCompleteIntersection R) : Ring.IsCohenMacaulay R := by sorry

lemma regular_local_graded_polynomial [IsRegularLocalRing R] (d : ℕ)
    (hd : ringKrullDim R = d) (f : Fin d → maximalIdeal R)
    (hf : Ideal.span (Set.range fun i => (f i : R)) = maximalIdeal R) :
    Function.Bijective (TauCeti.HilbertSamuel.adicGeneratorMap (maximalIdeal R) f) := by sorry
lemma regular_local_domain [IsRegularLocalRing R] : IsDomain R := by sorry

end TauCeti.PatchingAlgebra
