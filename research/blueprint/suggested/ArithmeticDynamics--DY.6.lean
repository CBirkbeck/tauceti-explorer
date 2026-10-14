/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ArithmeticDynamics--DY.6.md` is definitive. These
statements suggest Lean forms so contributors and reviewers converge on names
and signatures. They claim no implementation. The accepted base file supplies
the inherited DY.6 statements; this file supplies only the follow-up.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
All theorem bodies are placeholders. Heavy analytic and geometric carriers,
including affine-torus Lattes data, are targets in the reader document.
-/

import Mathlib.FieldTheory.FinTrdeg
import Mathlib.FieldTheory.PrimitiveElement
import Mathlib.FieldTheory.RatFunc.Basic
import Mathlib.FieldTheory.IntermediateField.Adjoin.Algebra
import Mathlib.RingTheory.AlgebraicIndependent.Adjoin
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.RingTheory.Localization.Integral
import Mathlib.RingTheory.Localization.Integer
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.Basic.Complex.Basic

set_option linter.unusedVariables false

namespace TauCeti.ArithmeticDynamics.FamiliesFollowup

open Polynomial

/-! Integral presentation: the coefficient denominator lies in Z[T], and the
marked family is independent of a field-generating family. The existential
fraction-field embedding gives L its scalar structure inside the statement;
no new presentation carrier or data-valued placeholder is introduced. -/

/-- followup-integral-primitive-presentation, including a common denominator. -/
theorem integralPrimitivePresentation (L : Type*) [Field L] [Algebra ℚ L]
    [Algebra.EssFiniteType ℚ L] {I : Type*} [Finite I] (s : I → L) :
    ∃ (n : ℕ) (t : Fin n → L)
      (e : FractionRing (MvPolynomial (Fin n) ℤ) →+* L),
      AlgebraicIndependent ℚ t ∧
      (∀ a : MvPolynomial (Fin n) ℤ,
        e (algebraMap _ (FractionRing (MvPolynomial (Fin n) ℤ)) a) =
          MvPolynomial.eval₂ (Int.castRingHom L) t a) ∧
      (letI := e.toAlgebra
       ∃ (y : L) (H : Polynomial (MvPolynomial (Fin n) ℤ))
         (c : FractionRing (MvPolynomial (Fin n) ℤ)),
         c ≠ 0 ∧
         IntermediateField.adjoin (FractionRing (MvPolynomial (Fin n) ℤ)) {y} = ⊤ ∧
         0 < H.natDegree ∧
         H.map (algebraMap _ (FractionRing (MvPolynomial (Fin n) ℤ))) =
           C c * minpoly (FractionRing (MvPolynomial (Fin n) ℤ)) y ∧
         Irreducible (H.map (algebraMap _ (FractionRing (MvPolynomial (Fin n) ℤ)))) ∧
         (H.map (algebraMap _ (FractionRing (MvPolynomial (Fin n) ℤ)))).Separable ∧
         H.eval₂ (MvPolynomial.eval₂Hom (Int.castRingHom L) t) y = 0 ∧
         ∃ (U : I → Polynomial (MvPolynomial (Fin n) ℤ))
           (V : MvPolynomial (Fin n) ℤ),
           V ≠ 0 ∧ ∀ i,
             (U i).degree < H.degree ∧
             s i = (U i).eval₂ (MvPolynomial.eval₂Hom (Int.castRingHom L) t) y /
               MvPolynomial.eval₂ (Int.castRingHom L) t V) := sorry

/-- followup-primitive-root-transport. The root equation is over the embedded
parameter field, without an irreducibility assumption over the target field. -/
theorem primitiveRootTransport (F L E : Type*) [Field F] [Field L] [Field E]
    [Algebra F L] (y : L) (hy : IsIntegral F y)
    (hgen : IntermediateField.adjoin F {y} = ⊤)
    (e : F →+* E) (η : E) (hη : (minpoly F y).eval₂ e η = 0) :
    ∃! σ : L →+* E, (∀ a : F, σ (algebraMap F L a) = e a) ∧ σ y = η := sorry

/-- The marked-expression evaluation identity is an API consequence of the
whole-field embedding, with a denominator in the parameter ring. -/
theorem markedExpression_transport {A L E : Type*} [CommRing A] [Field L] [Field E]
    (j : A →+* L) (e : A →+* E) (σ : L →+* E)
    (hσ : ∀ a, σ (j a) = e a) (y x : L) (η : E) (hy : σ y = η)
    (U : Polynomial A) (V : A) (hV : j V ≠ 0)
    (hx : x = U.eval₂ j y / j V) :
    σ x = U.eval₂ e η / e V ∧ e V ≠ 0 := sorry

/-- followup-lech-integral-assembly. This is a verification adapter for the
inherited endpoint, not a second atlas node for Lech's theorem. -/
theorem lechIntegralAssembly (L : Type*) [Field L] [Algebra ℚ L]
    [Algebra.EssFiniteType ℚ L] (s : Finset L) (N : ℕ) :
    ∃ p : ℕ, N < p ∧ ∃ _ : Fact p.Prime, ∃ σ : L →+* ℚ_[p],
      ∀ x ∈ s, ‖σ x‖ ≤ 1 := sorry

/-! Discriminating presentation tests. These test the denominator convention
and degenerate fields, rather than manufacturing a private model of a field. -/

/-- The zero-parameter case represents 1/6 with an integral denominator. -/
example : (C (1 : ℤ)).eval₂ (Int.castRingHom ℚ) 0 / (6 : ℚ) = 1 / 6 := sorry

/-- Degree one includes the trivial algebraic extension. -/
example : (X : Polynomial ℤ).natDegree = 1 ∧
    (X : Polynomial ℤ).eval₂ (Int.castRingHom ℚ) 0 = 0 := sorry

/-- Zero marks require no invertibility assumption on the mark. -/
example (L : Type*) [Field L] (y : L) :
    (0 : Polynomial ℤ).eval₂ (Int.castRingHom L) y / (1 : L) = 0 := sorry

/-- In a quadratic extension, the inverse can have a parameter-only denominator. -/
example {L : Type*} [Field L] (t y : L) (hy : y ^ 2 = t)
    (hden : t ^ 2 - t ≠ 0) :
    (y + t)⁻¹ = (t - y) / (t ^ 2 - t) := sorry

/-- Injectivity of the parameter evaluation is essential for fraction transport. -/
example (e : RatFunc ℚ →+* ℚ) :
    e (algebraMap ℚ[X] (RatFunc ℚ) X) ≠ 0 := sorry

/-! Other follow-up end statements statable at the pins. The reader document
states all hypotheses of the remaining targets; no height, torus quotient or
hybrid-measure carrier is replaced by an abstract proposition here. -/

/-- followup-ritt-common-iterate. The iterate is composition, and the support
condition explicitly handles s=0 as the monomial case. -/
theorem rittCommonIterate (F G : Polynomial ℂ) (hd : 1 < F.natDegree)
    (n : ℕ) (hn : 0 < n) :
    (fun z : ℂ => F.eval z)^[n] = (fun z : ℂ => G.eval z)^[n] ↔
      ∃ (β γ : ℂ) (H : Polynomial ℂ) (r s : ℕ),
        γ ≠ 0 ∧
        (∀ k, H.coeff k ≠ 0 → ∃ m : ℕ, k = r + s * m) ∧
        F = C (-β) + C γ * H.comp (X + C β) ∧
        G = C (-β) + H.comp (X + C β) ∧
        γ ^ s = 1 ∧ γ ^ (∑ k ∈ Finset.range n, F.natDegree ^ k) = 1 := sorry

/-- The order-one iterate has no root-of-unity ambiguity. -/
example (F G : Polynomial ℂ) :
    (fun z : ℂ => F.eval z)^[1] = (fun z : ℂ => G.eval z)^[1] ↔ F = G := sorry

/-- Odd degree admits a nontrivial equal-iterate pair. -/
example : (fun z : ℂ => -(z ^ 3))^[2] = (fun z : ℂ => z ^ 3)^[2] := sorry

/-- Even degree with multiplier -1 does not satisfy the same condition. -/
example (n : ℕ) (hn : 0 < n) :
    (fun z : ℂ => -(z ^ 2))^[n] ≠ (fun z : ℂ => z ^ 2)^[n] := sorry

/-- The complex specialization of followup-linear-synchronized-intersection.
The reader states the characteristic-zero form and its field reduction. -/
theorem linearSynchronizedIntersection (a b c e x₀ y₀ : ℂ)
    (ha : a ≠ 0) (hc : c ≠ 0)
    (hcommon : Set.Infinite {z : ℂ | ∃ n : ℕ,
      (fun w => a * w + b)^[n] x₀ = z ∧ (fun w => c * w + e)^[n] y₀ = z}) :
    ∃ m : ℕ, 0 < m ∧
      (fun w : ℂ => a * w + b)^[m] = (fun w : ℂ => c * w + e)^[m] := sorry

end TauCeti.ArithmeticDynamics.FamiliesFollowup
