import Mathlib

/-!
# Habiro rings: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
statable on the pinned Mathlib carriers and is not exhaustive. The Habiro completion, its tensor,
finite cyclotomic descent and the étale coefficient lifts are interfaces of
HabiroCohomologyFoundations Layer 0, and perfect covers and the completed étale Frobenius are
QWittVectors interfaces; this file states none of them. The ordinary relative Habiro ring, the
Laurent and base-change comparisons, the ordinary/derived comparison and the solid spectral
comparisons remain README targets, since their carriers are not at the pins. Layer 2 records the
native Laurent regularity and factorial divisibility milestones used by those comparisons.

The line milestone works over an arbitrary commutative coefficient ring. The order-one
trivialization remembers the actual evaluator, including its normalization.
-/

namespace TauCetiRoadmap.HabiroRings

open scoped TensorProduct NumberField
open Polynomial

universe u v

/-! ## Layer 2: ordinary coefficients and factorial tensor weights -/

namespace OrdinaryDerivedComparison
/-- Positive Laurent cyclotomic factors are regular on every polynomial coefficient module,
including modules with integer torsion. This is the finite-quotient milestone for Layer 2
ordinary/derived comparison; Wagner, Appendix B, Lemma B.2(c), p.77. -/
theorem laurent_regular (R : Type u) (M : Type v) [CommRing R]
    [AddCommGroup M] [Module R M] (m : ℕ) (hm : 0 < m) :
    Function.Injective (fun x : LaurentPolynomial R ⊗[R] M =>
      (LaurentPolynomial.T (R := R) (m : ℤ) - 1) • x) := by
  sorry

/-- Coefficient characteristic two does not erase the nonconstant Laurent factor. -/
example : (LaurentPolynomial.T (R := ZMod 2) 1 - 1) * 1 ≠ 0 := by
  intro h
  have hc := congrArg (fun f : LaurentPolynomial (ZMod 2) => f.coeff 1) h
  have hone : (1 : LaurentPolynomial (ZMod 2)).coeff 1 = 0 := by
    change (Finsupp.single (0 : ℤ) (1 : ZMod 2)) 1 = 0
    simp
  simp [hone] at hc

/-- Order zero would give the zero operator on a nonzero module. -/
example : ¬ Function.Injective (fun x : LaurentPolynomial (ZMod 2) =>
    (LaurentPolynomial.T (R := ZMod 2) 0 - 1) * x) := by
  intro h
  have hc : (0 : LaurentPolynomial (ZMod 2)) = 1 := h (by simp)
  exact zero_ne_one hc
end OrdinaryDerivedComparison

namespace CountableSolidHabiroTensor
/-- The factorial divisibility controlling the two tensor profiles, over any commutative
coefficient ring. Apply the integral Gaussian-factorial and Pochhammer identities from
HabiroCyclotomicCompletions Layer 1; Wagner, proof of B.8, p.80. -/
theorem factorial_mul_dvd (R : Type u) [CommRing R] (a b : ℕ) :
    (∏ i ∈ Finset.range a, (1 - X ^ (i + 1) : R[X])) *
        (∏ i ∈ Finset.range b, (1 - X ^ (i + 1) : R[X])) ∣
      (∏ i ∈ Finset.range (a + b), (1 - X ^ (i + 1) : R[X])) := by
  sorry

/-- The two-factor witness fixes the direction without dividing at a root of unity. -/
example : (1 - X : ℤ[X]) * (1 - X ^ 2) = (1 - X) ^ 2 * (1 + X) := by
  ring

/-- Reversing factorial divisibility fails at the second root of unity. -/
example : ¬ ((1 - X : ℤ[X]) * (1 - X ^ 2)) ∣ (1 - X) ^ 2 := by
  rintro ⟨g, hg⟩
  have hc := congrArg (Polynomial.eval (-1)) hg
  norm_num at hc

/-- The Gaussian polynomial is 2 at q=1, also in characteristic two. -/
example : (1 + X : ℤ[X]).eval 1 = 2 ∧
    (1 + X : (ZMod 2)[X]).eval 1 = 0 := by
  constructor
  · norm_num
  · simp only [Polynomial.eval_add, Polynomial.eval_one, Polynomial.eval_X]
    decide
end CountableSolidHabiroTensor

/-! ## Layer 5: discriminant-localized number-field coefficients -/

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

/-! ## Layer 6: order-one fibers and completed lines -/

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

/-!
The remaining targets are specified in README.md:

* Layer 1: the category `EtalePair` of perfectly covered Λ-bases with étale algebras.
* Layer 2: `habiroLocalisation`, `IsHabiroComplete` in the Laurent convention,
  `habiroCompletion_polynomial_eq_laurent`, `isHabiroComplete_iff_restrictScalars`,
  `habiroCompletion_eq_zero_iff`, the localization resolution and homotopy-module criterion,
  `ordinaryDerivedComparison`, `habiroTensor_baseChange`; `SphericalCyclotomicLocalization`,
  `SpectralHabiroCompletion`, `SolidHabiroCompletion`, null families and countable tensor profiles.
* Layer 3: the finite prime-chain index and reduced index, the descent principle for monoidal
  localizations and `CyclotomicIndex.mapEqualizer`.
* Layer 4: `RelHabiroStage` with its maps along morphisms of pairs.
* Layer 5: `relativeHabiro`, compatible cyclotomic roots, full Taylor coefficient algebras,
  canonical and Frobenius re-expansion arrows, and the Taylor equalizer presentation.
* Layer 6: `completedScalarExtension`, transported actual K₃ lines and their supported
  field comparison maps, the q−1 completion map and integral order-one evaluation.

These enhanced, spectral and relative carriers are not constructed in this file.
-/

end TauCetiRoadmap.HabiroRings
