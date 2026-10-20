import Mathlib

/-!
# Habiro rings: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
statable on the pinned Mathlib carriers and is not exhaustive. The Habiro completion, its tensor,
finite cyclotomic descent and the étale coefficient lifts are interfaces of
HabiroCohomologyFoundations Layer 0, and perfect covers and the completed étale Frobenius are
QWittVectors interfaces; this file states none of them. The ordinary relative Habiro ring, the
Laurent and base-change comparisons, the ordinary/derived comparison and the solid spectral
comparisons remain README targets, since their carriers are not at the pins. Layer 0 records
arbitrary-ideal étale object existence, the marked reduction map and the
ordinary completed mapping property on existing carriers. The general finite descent and
regular-principal enhanced universality targets remain in the README. Layer 2 records the
native Laurent regularity and factorial divisibility milestones used by those comparisons.

The line milestone works over an arbitrary commutative coefficient ring. The order-one
trivialization remembers the actual evaluator, including its normalization.
-/

namespace TauCetiRoadmap.HabiroRings

open scoped TensorProduct NumberField
open Polynomial

universe u v w

/-! ## Layer 0: general marked deformations -/

namespace EtaleDeformation

variable {B : Type u} [CommRing B] (I : Ideal B)
  {E : Type v} {E' : Type w} [CommRing E] [CommRing E']
  [Algebra B E] [Algebra B E']
  {D : Type*} {D' : Type*} [CommRing D] [CommRing D']
  [Algebra (B ⧸ I) D] [Algebra (B ⧸ I) D']

/-- Reduce an algebra map through its actual source and target markings. The formula is
ε′ ∘ (id ⊗ g) ∘ ε⁻¹; the ordinary carriers exist without an étaleness hypothesis. -/
noncomputable def reduceMap
    (ε : ((B ⧸ I) ⊗[B] E) ≃ₐ[B ⧸ I] D)
    (ε' : ((B ⧸ I) ⊗[B] E') ≃ₐ[B ⧸ I] D') (g : E →ₐ[B] E') :
    D →ₐ[B ⧸ I] D' :=
  ε'.toAlgHom.comp ((Algebra.TensorProduct.map (AlgHom.id (B ⧸ I) (B ⧸ I)) g).comp
    ε.symm.toAlgHom)

/-- The same marking on both sides preserves the identity map. -/
example (ε : ((B ⧸ I) ⊗[B] E) ≃ₐ[B ⧸ I] D) :
    reduceMap I ε ε (AlgHom.id B E) = AlgHom.id (B ⧸ I) D := by
  ext x
  simp [reduceMap]

/-- Changing the target marking to the split swap changes the reduced identity at (1,0). -/
example [Nontrivial (B ⧸ I)]
    (ε : ((B ⧸ I) ⊗[B] E) ≃ₐ[B ⧸ I] ((B ⧸ I) × (B ⧸ I))) :
    let swap : ((B ⧸ I) × (B ⧸ I)) ≃ₐ[B ⧸ I] ((B ⧸ I) × (B ⧸ I)) :=
      { RingEquiv.prodComm with commutes' := fun _ => rfl }
    reduceMap I ε (ε.trans swap) (AlgHom.id B E) (1, 0) = ((0 : B ⧸ I), 1) ∧
      reduceMap I ε (ε.trans swap) (AlgHom.id B E) (1, 0) ≠ ((1 : B ⧸ I), 0) := by
  dsimp
  simp [reduceMap, RingEquiv.prodComm]

/-- Every étale algebra over any quotient B/I has an ordinary étale object lift with a
specified reduction equivalence. No finite generation or nilpotence of I is assumed.
Stacks, Lemma 10.143.10 (04D1), Commutative Algebra, p.385; README §0.2. -/
theorem exists_lift (B : Type u) [CommRing B] (I : Ideal B)
    (D : Type v) [CommRing D] [Algebra (B ⧸ I) D]
    [Algebra.Etale (B ⧸ I) D] :
    ∃ E : CommAlgCat.{max u v} B, Algebra.Etale B E ∧
      Nonempty (((B ⧸ I) ⊗[B] E) ≃ₐ[B ⧸ I] D) := by
  sorry

end EtaleDeformation

namespace CompletedEtaleLift

/-- The ordinary completed lift has the unique map into any I-complete target inducing a
given map E → C/IC. Marking transport gives README §0.5 homEquiv. This extends the existing
formally smooth complete-target lift from E to its actual AdicCompletion carrier. -/
theorem mapUnique (B : Type u) (E : Type v) (C : Type w)
    [CommRing B] [CommRing E] [CommRing C] [Algebra B E] [Algebra B C]
    [Algebra.Etale B E] (I : Ideal B) (hI : I.FG)
    [IsAdicComplete (I.map (algebraMap B C)) C]
    (g : E →ₐ[B] C ⧸ I.map (algebraMap B C)) :
    ∃! h : AdicCompletion (I.map (algebraMap B E)) E →ₐ[B] C,
      ∀ x : E, Ideal.Quotient.mk (I.map (algebraMap B C))
        (h (algebraMap E (AdicCompletion (I.map (algebraMap B E)) E) x)) = g x := by
  sorry

/-- Static 𝔽₂ is ordinarily 2-complete, but the derived reduction has a nonzero kernel in
its two-term multiplication-by-2 differential. It cannot replace ℤ₂ in README §0.6. -/
example : (2 : ZMod 2) * 1 = 0 ∧
    ¬ Function.Injective (fun x : ZMod 2 => (2 : ZMod 2) * x) := by
  constructor
  · decide
  · intro h
    have hc : (0 : ZMod 2) = 1 := h (by decide)
    exact zero_ne_one hc

end CompletedEtaleLift

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
The remaining definitions and enhanced targets are specified in README.md:

* Layer 0: the marked object `EtaleDeformation`, its reduction equivalence,
  `CompletedEtaleLift` with its quotient, map and marked-comparison API, and
  `CompletedEtaleLift.principal_universality`.
* Layer 1: the category `EtalePair` of perfectly covered Λ-bases with étale algebras.
* Layer 2: `habiroLocalisation`, `IsHabiroComplete` in the Laurent convention,
  `habiroCompletion_polynomial_eq_laurent`, `isHabiroComplete_iff_restrictScalars`,
  the localization resolution and homotopy-module criterion, `ordinaryDerivedComparison`,
  `habiroTensor_baseChange`, `SphericalCyclotomicLocalization`, `SpectralHabiroCompletion`,
  `IsHabiroCompleteSolid`, `habiroCompletionSolid`, `toSolid`, `SolidHabiroCompletion`,
  `CountableSolidHabiroFree` and its null-family/profile tensor comparisons.
* Layer 3: `CyclotomicIndex` and its reduced prime-chain index,
  `FiniteMonoidalDescent.Datum` and its reconstruction, algebra and sheaf comparisons,
  and `CyclotomicIndex.mapEqualizer`.
* Layer 4: `RelHabiroStage` with its maps along morphisms of pairs.
* Layer 5: `relativeHabiro`, compatible cyclotomic roots, full Taylor coefficient algebras,
  canonical and Frobenius re-expansion arrows, and the Taylor equalizer presentation.
* Layer 6: `completedScalarExtension`, `picMap`, actual transported K₃ lines and their
  supported field comparisons, the q−1 completion map and integral order-one evaluation.

The enhanced, spectral and relative carriers above are not constructed in this file.
-/

end TauCetiRoadmap.HabiroRings
