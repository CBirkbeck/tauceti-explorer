/-
Suggested.lean — ModularCurvesPartII, part R14.3 (cohomological realisations, modular quotients, bad-prime interfaces)

This file is a prototype, not a library file. It records signatures, API lemmas and unit tests planned by
`research/blueprint/packets/ModularCurvesPartII--R14.3.json`, each proved by `sorry`. Node ids are given in the comments.

Jacobians of modular curves, their Hecke actions and Tate modules are not in the pinned libraries (they are supplied by
this roadmap's R14.2 and by Tau Ceti's JacobianChallenge); the geometric statements are therefore recorded as comments.
The commutative-algebra core of Shimura's dimension theorem is prototyped against Mathlib.
-/
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.LinearAlgebra.FreeModule.Finite.Basic
import Mathlib.LinearAlgebra.Dimension.Free
import Mathlib.RingTheory.TensorProduct.Free
import Mathlib.NumberTheory.ModularForms.Basic

namespace TauCeti.ModularCurves

/-- `ModularCurvesPartII:R14.5/newform-hecke-prime`: the kernel of the eigenvalue character of a Hecke algebra. -/
def heckePrime {T K : Type*} [CommRing T] [Field K] (χ : T →+* K) : Ideal T := RingHom.ker χ

theorem heckePrime_isPrime {T K : Type*} [CommRing T] [Field K] (χ : T →+* K) : (heckePrime χ).IsPrime := sorry

/-- The algebraic core of `ModularCurvesPartII:R14.5/modular-quotient-dimension`: a module free of rank two over a
commutative ring stays free of rank two after base change to A ⧸ P, i.e. V / P V. -/
theorem free_rank_two_quotient {A V : Type*} [CommRing A] [AddCommGroup V] [Module A V] [Module.Free A V]
    [Module.Finite A V] [Nontrivial A] (h : Module.finrank A V = 2) (P : Ideal A) [P.IsPrime] :
    Module.Free (A ⧸ P) (TensorProduct A (A ⧸ P) V) ∧
      Module.finrank (A ⧸ P) (TensorProduct A (A ⧸ P) V) = 2 := sorry

-- Unit test: the character sending everything to its image in ℚ has kernel ⊥ on ℤ.
example : heckePrime (Int.castRingHom ℚ) = ⊥ := sorry

/-
Geometric statements (suppliers: ModularCurvesPartII R14.2, R13.2, R12.3, R12.5; Tau Ceti JacobianChallenge Layer F;
AbelianSchemesAndArithmeticModuli A2, A6; NeronModelsAndSemistableAbelianVarieties R11.1):

theorem shimuraIsomorphism_hecke (N ≥ 5) : Sh (T_p f ⊕ T̄_p ḡ) = T_p^* (Sh (f ⊕ ḡ))              -- weight-two-shimura-isomorphism
theorem cup_eq_petersson : (Sh x, Sh y) = 4π (⟨f₁, g₂⟩ - ⟨f₂, g₁⟩)                                 -- cup-product-petersson
theorem H1_free_rank_two : Module.Free (ℚ ⊗ T₁ N) (H¹(X₁ N, ℚ)) ∧ finrank = 2                    -- betti-free-rank-two
noncomputable def modularQuotient (f : Newform N 2) : AbelianVariety ℚ := J₁(N) ⧸ heckePrime f     -- modular-quotient
theorem dim_modularQuotient : dim (modularQuotient f) = [K_f : ℚ]                                  -- modular-quotient-dimension
theorem eichlerShimura (hp : ¬ p ∣ N) : (T_p)_* = F + ⟨p⟩_* ∘ F^∨ in End (J₁(N)_{F_p})             -- special-fibre-eichler-shimura
noncomputable def abelJacobiInfty : X₀ N ⟶ J₀ N                                                     -- rational-cusp-abel-jacobi
-/

end TauCeti.ModularCurves
