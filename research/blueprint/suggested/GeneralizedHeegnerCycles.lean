/-
This file is not the roadmap and is not exhaustive. The definitive roadmap is
research/blueprint/readmes/GeneralizedHeegnerCycles.md. These statements suggest
Lean forms so contributors and reviewers can converge on names and signatures.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Only Mathlib is imported.
The compact shape follows WORKERS and PACKAGE_REVIEW (12 October 2026).

The two real-bodied definitions below are linear components of the CM differential
normalization and positive-conductor stabilization. The other declarations are
algebraic milestones of GH.3/GH.8. They do not construct arithmetic carriers.
The full target statements, hypotheses, API and definition tests are in the reader.
In particular, CM elliptic-curve structures, graph cycles, Chow groups, Abel--Jacobi
maps, continuous Kummer maps, regulator maps, Hida coefficients and Iwasawa Selmer
modules are omitted until their actual supplier interfaces exist at the pins.
The proposed bridge targets also remain reader targets. No opaque stand-ins,
admitted data, or conclusion-bearing fields replace these missing constructions.
-/
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.NumberTheory.MulChar.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Defs
import Mathlib.Data.Rat.Defs
import Mathlib.Data.ZMod.Basic

open scoped BigOperators
noncomputable section
namespace TauCeti.GeneralizedHeegnerCycles.LinearChecks

section CMNormalization
variable {F V : Type*} [Field F] [AddCommGroup V] [Module F V]

/-- Linear component of GH.0: normalize an actual conjugate-line vector.
The arithmetic application supplies the CM action and its eigenline separately. -/
def etaOfOmega (cup : V →ₗ[F] V →ₗ[F] F) (omega eta : V) : V :=
  (cup omega eta)⁻¹ • eta

-- Calls the definition, rejecting the unnormalized vector for pairing value two.
example (cup : V →ₗ[F] V →ₗ[F] F) (omega eta : V)
    (h : cup omega eta ≠ 0) : cup omega (etaOfOmega cup omega eta) = 1 := by
  sorry

-- Normalization is inverse in the differential's scaling, not covariant.
example (cup : V →ₗ[F] V →ₗ[F] F) (omega eta : V) (a : F) (ha : a ≠ 0) :
    etaOfOmega cup (a • omega) eta = a⁻¹ • etaOfOmega cup omega eta := by
  sorry

-- A zero pairing gives zero and cannot certify a normalized CM pair.
example (cup : V →ₗ[F] V →ₗ[F] F) (omega eta : V) (h : cup omega eta = 0) :
    etaOfOmega cup omega eta = 0 := by
  sorry
end CMNormalization

section PositiveClass
variable {F M N : Type*} [Field F]
  [AddCommGroup M] [Module F M] [AddCommGroup N] [Module F N]

/-- GH.3 positive branch: q=p^(2r-2). At weight two q=1.
The lower vector is the actual restricted lower-conductor class in application. -/
def positiveClass (alpha q : F) (z lower : M) : M := z - (q / alpha) • lower

example (alpha : F) (z lower : M) : positiveClass alpha 0 z lower = z := by
  sorry

example : positiveClass (2 : ℚ) 1 (5 : ℚ) 4 = 3 := by
  sorry

-- At weight four, p=5 gives q=25; omitting q must change the value.
example : positiveClass (2 : ℚ) 25 (5 : ℚ) 4 = -45 ∧
    positiveClass (2 : ℚ) 25 (5 : ℚ) 4 ≠ positiveClass (2 : ℚ) 1 (5 : ℚ) 4 := by
  sorry
end PositiveClass

section InitialConductor
variable {F M₀ M₁ : Type*} [Field F]
  [AddCommGroup M₀] [Module F M₀] [AddCommGroup M₁] [Module F M₁]

/-- GH.8 initial-corestriction-comparison. The application must identify the
actual first trace, unit index u, first degree d and reciprocity operators. -/
theorem initial_corestriction_comparison
    (res : M₀ →ₗ[F] M₁) (cor : M₁ →ₗ[F] M₀)
    (sigma tau : Module.End F M₀) (x₀ : M₀) (x₁ : M₁)
    (alpha a p u d : F) (halpha : alpha ≠ 0) (hu : u ≠ 0)
    (hroot : alpha ^ 2 - a * alpha + p = 0) (hdegree : u * d = p - 1)
    (htrace : u • cor x₁ = a • x₀ - sigma x₀ - tau x₀)
    (hcorres : cor (res x₀) = d • x₀) (hinv : sigma (tau x₀) = x₀) :
    cor (alpha⁻¹ • (x₁ - alpha⁻¹ • res x₀)) =
      u⁻¹ • ((x₀ - alpha⁻¹ • tau x₀) - alpha⁻¹ • sigma (x₀ - alpha⁻¹ • tau x₀)) := by
  sorry

-- Exact scalar fixture: p=5, alpha=2, a=9/2, u=1, d=4.
example : (2 : ℚ)⁻¹ * ((5 / 2 : ℚ) - (2 : ℚ)⁻¹ * 4) =
    (1 - (2 : ℚ)⁻¹) ^ 2 ∧
    (2 : ℚ)⁻¹ * ((5 / 2 : ℚ) - (2 : ℚ)⁻¹ * 4) ≠
      (2 : ℚ)⁻¹ * (1 - (2 : ℚ)⁻¹) ^ 2 := by
  sorry
end InitialConductor

section PositiveTrace
variable {F M₀ M₁ M₂ : Type*} [Field F]
  [AddCommGroup M₀] [Module F M₀] [AddCommGroup M₁] [Module F M₁]
  [AddCommGroup M₂] [Module F M₂]

/-- GH.8 positive-tail-corestriction: the repeated positive degree is p.
The first transition is the preceding distinct theorem. -/
theorem positive_trace_normalization
    (cor : M₂ →ₗ[F] M₁) (res₁ : M₀ →ₗ[F] M₁) (res₂ : M₁ →ₗ[F] M₂)
    (x₀ : M₀) (x₁ : M₁) (x₂ : M₂) (alpha a p : F) (n : ℕ)
    (halpha : alpha ≠ 0) (hroot : alpha ^ 2 - a * alpha + p = 0)
    (htrace : cor x₂ = a • x₁ - res₁ x₀)
    (hdegree : cor (res₂ x₁) = p • x₁) :
    cor ((alpha ^ (n + 2))⁻¹ • positiveClass alpha 1 x₂ (res₂ x₁)) =
      (alpha ^ (n + 1))⁻¹ • positiveClass alpha 1 x₁ (res₁ x₀) := by
  sorry
end PositiveTrace

section UniformComparison
variable {R : Type*} [CommRing R]
variable {M N : ℕ → Type*}
  [∀ n, AddCommGroup (M n)] [∀ n, Module R (M n)]
  [∀ n, AddCommGroup (N n)] [∀ n, Module R (N n)]

/-- GH.8 uniform-coherent-lift: the same d works at every level.
The actual forward and backward integral maps remain a GH.1 obligation. -/
theorem uniform_coherent_lift
    (mu : ∀ n, M (n + 1) →ₗ[R] M n)
    (nu : ∀ n, N (n + 1) →ₗ[R] N n)
    (f : ∀ n, M n →ₗ[R] N n) (g : ∀ n, N n →ₗ[R] M n) (d : R)
    (hfg : ∀ n y, f n (g n y) = d • y)
    (hg : ∀ n y, mu n (g (n + 1) y) = g n (nu n y))
    (y : ∀ n, N n) (hy : ∀ n, nu n (y (n + 1)) = y n) :
    ∃ x : ∀ n, M n,
      (∀ n, mu n (x (n + 1)) = x n) ∧ (∀ n, f n (x n) = d • y n) := by
  sorry
end UniformComparison

section PrimitiveCharacters
variable {G R M N : Type*} [CommGroup G] [Fintype G]
  [CommRing R] [IsDomain R]
  [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]

/-- GH.3/GH.8 character cancellation: beta is p^(2r-2)/alpha in general.
Scalar orthogonality is used before acting on M, which may have torsion.
The arithmetic quotient action and Shapiro moment are separate reader targets. -/
theorem primitive_character_stabilization
    (H : Subgroup G) (chi : G →* R) (hchi : ∃ h : H, chi (h : G) ≠ 1)
    (q : M →ₗ[R] N) (a b : G → M) (beta c : R)
    (hb : ∀ (g : G) (h : H), b (g * (h : G)) = b g) :
    q (c • ∑ g : G, chi g • (a g - beta • b g)) =
      c • ∑ g : G, chi g • q (a g) := by
  sorry

example (x : ZMod 8) : (1 : ℤ) • x + (-1 : ℤ) • x = 0 := by
  sorry
end PrimitiveCharacters

section RegulatorChecks
variable {R S M N : Type*} [CommRing R] [CommRing S]
  [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]

-- Existing quotient algebra requires the actual preimage equality.
example (P : Submodule R M) (Q : Submodule R N) (f : M →ₗ[R] N)
    (h : P ≤ Q.comap f) (hpreimage : Q.comap f = P) :
    Function.Injective (P.mapQ Q f h) := by
  sorry

/-- GH.8 specialization obstruction. A regular exceptional model is a different
construction from evaluating a coefficient whose inverse is already specified. -/
theorem specialization_of_inverse_ne_zero [Nontrivial S] (rho : R →+* S)
    (lambda invlambda : R) (hinv : lambda * invlambda = 1) : rho lambda ≠ 0 := by
  sorry
end RegulatorChecks

-- Correct root-sign slope distinguishes both signs; reducing the sign modulo 2 does not.
example : ((1 - (1 : ℚ)) / 2 = 0) ∧ ((1 - (-1 : ℚ)) / 2 = 1) := by
  sorry

-- BDP17's CM correspondence has factor (2 sqrt(-D))^u, not its inverse.
example : (2 * (3 : ℚ)) ^ 2 = 36 ∧ (2 * (3 : ℚ)) ^ 2 ≠ (2 * (3 : ℚ))⁻¹ ^ 2 := by
  sorry

end TauCeti.GeneralizedHeegnerCycles.LinearChecks
