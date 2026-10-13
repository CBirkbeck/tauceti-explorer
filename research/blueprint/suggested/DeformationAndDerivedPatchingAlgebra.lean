import Mathlib.RingTheory.Regular.RegularSequence
import Mathlib.RingTheory.Regular.ProjectiveDimension
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.RingTheory.KrullDimension.Module
import Mathlib.RingTheory.Length
import Mathlib.RingTheory.LocalRing.ResidueField.Basic
import Mathlib.RingTheory.LocalRing.RingHom.Basic
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.Localization.AtPrime.Basic
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Data.Nat.Factorial.Basic
import TauCeti.Algebra.Module.Injective.Envelope

/-!
# Deformation and derived patching algebra: suggested end statements

This file is not the roadmap and is not exhaustive. The reader document is
 definitive. These forms suggest names and signatures; they claim no implementation.
Heavy coefficient categories, enhancements, dualizing objects and patching-system
carriers are reader targets. The definitions below have ordinary library carriers
and real bodies. Theorems have placeholder proofs. No data is supplied by a placeholder.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
Cochain convention: C[n]^i=C^{i+n}; concentration in degree b means M[-b].
-/

noncomputable section
universe u v w
open IsLocalRing
open scoped Pointwise

namespace TauCeti.DeformationAndDerivedPatchingAlgebra

variable (A : Type u) [CommRing A]
variable (M : Type v) [AddCommGroup M] [Module A M]

/-- The cumulative length function, before imposing its finiteness hypotheses. -/
def hilbertSamuelFunction (I : Ideal A) (n : ℕ) : ℕ∞ :=
  Module.length A (M ⧸ (I ^ (n + 1) • (⊤ : Submodule A M)))

/-- A degree-indexed coefficient. It is multiplicity only for the eventual length polynomial. -/
def multiplicityCoefficient (d : ℕ) (P : Polynomial ℚ) : ℚ :=
  (Nat.factorial d : ℚ) * P.coeff d

/-- The trace ideal uses all functionals, without a projectivity assumption. -/
def traceIdeal : Ideal A :=
  Ideal.span {a : A | ∃ (f : M →ₗ[A] A) (m : M), f m = a}

/-- An annihilator is nearly faithful when one power vanishes. -/
def NearlyFaithful : Prop :=
  ∃ n : ℕ, 0 < n ∧ (Module.annihilator A M) ^ n = ⊥

/-- Extended depth; weak regularity gives infinite depth to the zero module. -/
def moduleDepth [IsLocalRing A] : ℕ∞ :=
  ⨆ (s : List A) (_ : ∀ a ∈ s, a ∈ maximalIdeal A)
    (_ : RingTheory.Sequence.IsWeaklyRegular M s), (s.length : ℕ∞)

/-- Localization followed by contraction; primality is required for the localization. -/
def symbolicSquare (p : Ideal A) [p.IsPrime] : Ideal A :=
  Ideal.comap (algebraMap A (Localization.AtPrime p))
    ((p ^ 2).map (algebraMap A (Localization.AtPrime p)))

/-- The small-extension condition includes locality, nonzero kernel and principality. -/
def SmallExtension {B : Type w} [CommRing B] [IsLocalRing B] [IsLocalRing A]
    (f : B →+* A) : Prop :=
  IsLocalHom f ∧ Function.Surjective f ∧ RingHom.ker f ≠ ⊥ ∧
    (∃ b : B, RingHom.ker f = Ideal.span {b}) ∧
    maximalIdeal B * RingHom.ker f = ⊥

-- R03.1: the small/elementary distinction is carried by the actual kernel.
theorem smallExtension_kernel_square_zero
    {B : Type w} [CommRing B] [IsLocalRing B] [IsLocalRing A]
    (f : B →+* A) (hf : SmallExtension A f) :
    (RingHom.ker f) ^ 2 = ⊥ := by
  sorry

-- R03.3: end statements, not a development of depth or Hilbert polynomials.
theorem hilbertSamuel_finite [IsLocalRing A] [IsNoetherianRing A] [Module.Finite A M]
    (I : Ideal A) (hI : I ≤ maximalIdeal A)
    (hfinite : Module.length A (M ⧸ (I • (⊤ : Submodule A M))) ≠ ⊤) :
    ∀ n : ℕ, hilbertSamuelFunction A M I n ≠ ⊤ := by
  sorry

theorem hilbertSamuel_eventual_polynomial
    [IsLocalRing A] [IsNoetherianRing A] [Module.Finite A M]
    (I : Ideal A) (hI : I ≤ maximalIdeal A)
    (hfinite : Module.length A (M ⧸ (I • (⊤ : Submodule A M))) ≠ ⊤) :
    ∃! P : Polynomial ℚ, ∃ N : ℕ, ∀ n : ℕ, N ≤ n →
      P.eval (n : ℚ) = ((hilbertSamuelFunction A M I n).toNat : ℚ) := by
  sorry

theorem hilbertSamuel_degree_and_positive_integral_coefficient
    [IsLocalRing A] [IsNoetherianRing A] [Module.Finite A M] [Nontrivial M]
    (I : Ideal A) (hI : I ≤ maximalIdeal A)
    (hfinite : Module.length A (M ⧸ (I • (⊤ : Submodule A M))) ≠ ⊤)
    (d : ℕ) (hd : Module.supportDim A M = (d : WithBot ℕ∞))
    (P : Polynomial ℚ)
    (hP : ∃ N : ℕ, ∀ n : ℕ, N ≤ n →
      P.eval (n : ℚ) = ((hilbertSamuelFunction A M I n).toNat : ℚ)) :
    P.natDegree = d ∧ ∃ e : ℕ, 0 < e ∧ multiplicityCoefficient d P = (e : ℚ) := by
  sorry

theorem finite_projective_dimension_depth
    [IsLocalRing A] [IsNoetherianRing A] [Module.Finite A M] [Nontrivial M]
    (hpd : CategoryTheory.projectiveDimension (ModuleCat.of A M) ≠ ⊤) :
    CategoryTheory.projectiveDimension (ModuleCat.of A M) +
      (moduleDepth A M : WithBot ℕ∞) = (moduleDepth A A : WithBot ℕ∞) := by
  sorry

theorem regular_local_finite_module_dimension_bound
    [IsRegularLocalRing A] [Module.Finite A M] :
    CategoryTheory.projectiveDimension (ModuleCat.of A M) ≤ ringKrullDim A := by
  sorry

theorem regular_local_maximal_cm_free
    [IsRegularLocalRing A] [Module.Finite A M] [Nontrivial M]
    (hdepth : (moduleDepth A M : WithBot ℕ∞) = ringKrullDim A) :
    Module.Free A M := by
  sorry

theorem trace_eq_top_iff_free_summand [IsLocalRing A] [Module.Finite A M] :
    traceIdeal A M = ⊤ ↔
      ∃ (i : A →ₗ[A] M) (r : M →ₗ[A] A), r.comp i = LinearMap.id := by
  sorry

theorem symbolicSquare_membership (p : Ideal A) [p.IsPrime] (a : A) :
    a ∈ symbolicSquare A p ↔ ∃ s : A, s ∉ p ∧ s * a ∈ p ^ 2 := by
  sorry

theorem matlis_finite_bidouble
    [IsLocalRing A] [IsNoetherianRing A] [IsAdicComplete (maximalIdeal A) A]
    [Module.Finite A M]
    (E : Type w) [AddCommGroup E] [Module A E]
    (i : ResidueField A →ₗ[A] E) (hi : TauCeti.IsInjectiveEnvelope i) :
    ∃ e : M ≃ₗ[A] ((M →ₗ[A] E) →ₗ[A] E), ∀ m f, e m f = f m := by
  sorry

-- R03.6: full support and a quotient ring are separate assertions.
theorem nearlyFaithful_iff_full_support [IsNoetherianRing A] [Module.Finite A M] :
    NearlyFaithful A M ↔ Module.support A M = Set.univ := by
  sorry

theorem reduced_quotient_identification
    {B : Type w} [CommRing B] [IsNoetherianRing A] [IsReduced A]
    [Module B M] (f : A →+* B) (hf : Function.Surjective f)
    (hcompat : ∀ a : A, ∀ m : M, a • m = f a • m)
    (hsupport : Module.support A M = Set.univ) :
    Function.Injective f := by
  sorry

-- P7: residue exactness is exactness at the middle, with no endpoint injection.
theorem three_term_residue_exactness [IsLocalRing A]
    (F₀ F₁ F₂ : Type v)
    [AddCommGroup F₀] [AddCommGroup F₁] [AddCommGroup F₂]
    [Module A F₀] [Module A F₁] [Module A F₂]
    [Module.Free A F₀] [Module.Free A F₁] [Module.Free A F₂]
    [Module.Finite A F₀] [Module.Finite A F₁] [Module.Finite A F₂]
    (f : F₀ →ₗ[A] F₁) (g : F₁ →ₗ[A] F₂) (hgf : g.comp f = 0)
    (hresidue : ∀ y : F₁, g y ∈ maximalIdeal A • (⊤ : Submodule A F₂) →
      ∃ x : F₀, y - f x ∈ maximalIdeal A • (⊤ : Submodule A F₁)) :
    LinearMap.range f = LinearMap.ker g := by
  sorry

-- A few computations pin down the two polynomial normalizations.
example : multiplicityCoefficient 0 (Polynomial.C (5 : ℚ)) = 5 := by
  simp [multiplicityCoefficient]

example : multiplicityCoefficient 2
    (Polynomial.C (1 / 2 : ℚ) * Polynomial.X^2 +
      Polynomial.C (3 / 2 : ℚ) * Polynomial.X + 1) = 1 := by
  sorry

example : multiplicityCoefficient 2 (Polynomial.X + (1 : Polynomial ℚ)) = 0 := by
  simp [multiplicityCoefficient, Polynomial.coeff_X, Polynomial.coeff_one]

example : multiplicityCoefficient 3 (0 : Polynomial ℚ) = 0 := by
  simp [multiplicityCoefficient]

example [Subsingleton M] (I : Ideal A) (n : ℕ) :
    hilbertSamuelFunction A M I n = 0 := by
  simp [hilbertSamuelFunction]

end TauCeti.DeformationAndDerivedPatchingAlgebra
