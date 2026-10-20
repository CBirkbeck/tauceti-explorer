import Mathlib

/-!
# Habiro rings: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
statable on the pinned Mathlib carriers and is not exhaustive. In particular, the relative Habiro
ring, enhanced completion and descent, and solid spectral comparisons remain targets in the README.

Prime completion here is Mathlib's ordinary `AdicCompletion`. The Frobenius milestone only needs
an endomorphism of the base lifting Frobenius; the full relative construction uses perfectly
covered Λ-rings. The line milestone works over an arbitrary commutative coefficient ring. The
order-one trivialization remembers the actual evaluator, including its normalization.
-/

namespace TauCetiRoadmap.HabiroRings

open scoped TensorProduct NumberField

universe u v

/- ## Layer 1: perfect covers and completed Frobenius -/

section Frobenius

variable {A : Type u} {R : Type v} [CommRing A] [CommRing R] [Algebra A R]
  [Algebra.Etale A R]

/-- An étale algebra has a unique Frobenius lift after prime completion, semilinear for the
chosen Frobenius lift on the base. This is the ordinary-completion milestone of Layer 1;
Wagner, §2.2, 2.7, p.15. The endomorphism itself need not be invertible. -/
theorem frobLift_existsUnique (p : ℕ) (hp : p.Prime) (ψ : A →+* A)
    (hψ : ∀ a : A, ψ a - a ^ p ∈ Ideal.span {(p : A)}) :
    let Rp := AdicCompletion (Ideal.span {(p : R)}) R
    ∃! φ : Rp →+* Rp,
      (∀ a : A,
        φ (algebraMap R Rp (algebraMap A R a)) =
          algebraMap R Rp (algebraMap A R (ψ a))) ∧
      ∀ x : Rp, φ x - x ^ p ∈ Ideal.span {(p : Rp)} := by
  sorry

end Frobenius

/- ## Layer 5: discriminant-localized number-field coefficients -/

/-- Inverting a nonzero multiple of the discriminant makes the ring of integers étale over ℤ.
The ring comparison uses this hypothesis; divisibility by 6 is additionally required for the
GSWZ line applications in Layer 6. Wagner, Corollary 2.13, p.19. -/
theorem etale_localization_away_discr (F : Type u) [Field F] [NumberField F]
    (Δ : ℤ) (hΔ : Δ ≠ 0) (hd : NumberField.discr F ∣ Δ)
    (R : Type v) [CommRing R] [Algebra (𝓞 F) R]
    [IsLocalization.Away (Δ : 𝓞 F) R] : Algebra.Etale ℤ R := by
  sorry

/-- The same étaleness criterion only requires inverting every prime in the discriminant's
support, regardless of multiplicity. This is the radical form of the preceding milestone. -/
theorem etale_localization_away_of_prime_dvd (F : Type u) [Field F] [NumberField F]
    (Δ : ℤ) (hΔ : Δ ≠ 0)
    (hd : ∀ p : ℕ, p.Prime → (p : ℤ) ∣ NumberField.discr F → (p : ℤ) ∣ Δ)
    (R : Type v) [CommRing R] [Algebra (𝓞 F) R]
    [IsLocalization.Away (Δ : 𝓞 F) R] : Algebra.Etale ℤ R := by
  sorry

/- ## Layer 6: order-one fibers and completed lines -/

namespace OrderOneFibre

variable {H : Type u} {R : Type v} {M : Type u}
  [CommRing H] [CommRing R] [Algebra H R]
  [AddCommGroup M] [Module H M] [Module.Invertible H M]

/-- The actual evaluation map trivializes the base-changed invertible module when it has a
preimage of 1. Its underlying map is the given evaluator, so a rescaling changes the normalization.
This specializes Mathlib's bijectivity criterion to the order-one fiber of Layer 6. -/
noncomputable def trivialization (e : (R ⊗[H] M) →ₗ[R] R)
    (hunit : ∃ x, e x = 1) : (R ⊗[H] M) ≃ₗ[R] R :=
  LinearEquiv.ofBijective e (Module.Invertible.bijective_of_surjective (by
    obtain ⟨x, hx⟩ := hunit
    intro r
    refine ⟨r • x, ?_⟩
    simp [hx]))

/-- The zero evaluator fails the necessary unit test even on the trivial line. -/
theorem zeroEvaluation : ¬ ∃ x : ℤ ⊗[ℤ] ℤ, (0 : (ℤ ⊗[ℤ] ℤ) →ₗ[ℤ] ℤ) x = 1 := by
  simp

/-- The tensor-unit evaluator retains the coefficient of the trivial line. -/
example (r : ℤ) :
    trivialization (TensorProduct.lid ℤ ℤ).toLinearMap
      ⟨1 ⊗ₜ[ℤ] 1, by simp⟩ (1 ⊗ₜ[ℤ] r) = r := by
  simp [trivialization]

/-- Negating the evaluator negates the normalized coordinate. -/
example :
    trivialization (-(TensorProduct.lid ℤ ℤ).toLinearMap)
      ⟨1 ⊗ₜ[ℤ] (-1), by simp⟩ (1 ⊗ₜ[ℤ] (3 : ℤ)) = -3 := by
  simp [trivialization]

end OrderOneFibre

section CompletedLine

variable {R : Type u} [CommRing R]

noncomputable local instance coeffAlgebra : Algebra (PowerSeries R) R :=
  (PowerSeries.constantCoeff (R := R)).toAlgebra

/-- An invertible module over R[[X]] whose order-one fiber is trivial is itself free of rank one.
The coefficient ring R is arbitrary: X lies in the Jacobson radical without a locality or
Noetherian hypothesis. Layer 6 applies this to the actual transported K₃ line after its integral
order-one evaluation has been established. -/
theorem completedRegulatorTriviality {P : Type v} [AddCommGroup P]
    [Module (PowerSeries R) P] [Module.Invertible (PowerSeries R) P]
    (h : Nonempty ((P ⧸ ((Ideal.span {PowerSeries.X (R := R)}) •
      (⊤ : Submodule (PowerSeries R) P))) ≃ₗ[PowerSeries R] R)) :
    Nonempty (P ≃ₗ[PowerSeries R] PowerSeries R) := by
  sorry

end CompletedLine

end TauCetiRoadmap.HabiroRings
