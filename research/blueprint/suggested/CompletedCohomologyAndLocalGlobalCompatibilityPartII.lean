import Mathlib.Algebra.Module.Submodule.Ker
import Mathlib.RingTheory.Ideal.Maps
import Mathlib.RingTheory.Spectrum.Prime.Topology

/-!
This file is not the roadmap and is not exhaustive. The accompanying roadmap
README is definitive. These statements suggest Lean names and signatures so
contributors and reviewers can converge on the intended interfaces.

The compact shape follows WORKERS.md (2026-10-12). The pins do not contain
local deformation rings, compact Iwasawa-module categories, p-adic Hodge types,
patched modules or locally analytic representations. Their full statements,
APIs and discriminating tests are README targets, not surrogate structures here.
The README's omission ledger accounts for them.

PD.2/capture-scalar-detection is statable over native kernels and scalar actions.
The final theorem is the algebraic projection of PD.4/density-from-testing,
after its arithmetic argument identifies a contracted vanishing ideal.
No arithmetic density theorem is claimed to have been formalised here.
-/

set_option autoImplicit false

namespace TauCeti.PatchedDensity

section TestingKernels

variable {O R M : Type*} [CommRing O] [CommRing R]
variable [AddCommGroup M] [Module O M] [Module R M]
variable {ι : Type*} {V : ι → Type*}
variable [∀ i, AddCommGroup (V i)] [∀ i, Module O (V i)]

/-- The algebraic common-kernel content of EP Lemma 2.7. -/
theorem endomorphism_eq_zero_of_test_kernels
    (f : (i : ι) → M →ₗ[O] V i)
    (hsep : (⨅ i, LinearMap.ker (f i)) = ⊥)
    (u : M →ₗ[O] M) (hkill : ∀ i, (f i).comp u = 0) :
    u = 0 := by
  sorry

/-- The faithful-scalar consequence used in the patched testing argument. -/
theorem scalar_eq_zero_of_test_kernels [FaithfulSMul R M]
    (f : (i : ι) → M →ₗ[O] V i)
    (hsep : (⨅ i, LinearMap.ker (f i)) = ⊥)
    (a : R) (hkill : ∀ i m, f i (a • m) = 0) :
    a = 0 := by
  sorry

end TestingKernels

section Spectrum

variable {R S M : Type*} [CommRing R] [CommRing S]
variable [AddCommGroup M] [Module R M] [FaithfulSMul R M]

/-- The geometric conclusion once arithmetic testing computes the ideal. -/
theorem dense_image_of_comap_vanishingIdeal_eq_annihilator
    (φ : R →+* S) (T : Set (PrimeSpectrum S))
    (hideal : Ideal.comap φ (PrimeSpectrum.vanishingIdeal T) =
      Module.annihilator R M) :
    Dense ((PrimeSpectrum.comap φ) '' T) := by
  sorry

end Spectrum

-- Native-carrier checks of the common-kernel convention (PD.2).
example : LinearMap.ker (LinearMap.id : ℤ →ₗ[ℤ] ℤ) = ⊥ := by
  sorry

example : LinearMap.ker (0 : ℤ →ₗ[ℤ] ℤ) = ⊤ := by
  sorry

example (f : Empty → ℤ →ₗ[ℤ] ℤ) :
    (⨅ i, LinearMap.ker (f i)) = ⊤ := by
  sorry

-- Comparison with the existing vanishing-ideal/closure theorem (PD.4).
example {R : Type*} [CommRing R] (T : Set (PrimeSpectrum R))
    (h : PrimeSpectrum.vanishingIdeal T = ⊥) : Dense T := by
  sorry

end TauCeti.PatchedDensity
