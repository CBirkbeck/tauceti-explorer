/-
This file is not the roadmap and is not exhaustive. The companion roadmap document is
 definitive. These signatures suggest Lean forms so contributors and reviewers can
converge on names and interfaces.

Weight-two comparisons: algebraic compatibility signatures and regression examples.
Baseline: mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.
The algebraic signatures were compiled at the pinned baseline on 2026-09-26.
The seven geometric targets still require the actual
curve/Jacobian, cycle-class, continuous Tate-module Kummer and Iwasawa interfaces named
in the packet. They are not replaced here by opaque carriers or conclusion-bearing
assumptions. The algebra below isolates the comparison steps after those inputs.
-/
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.Data.Int.Basic
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.Algebra.Polynomial.Basic

noncomputable section
namespace TauCeti.GeneralizedHeegnerCycles.WeightTwoChecks

section ExistingChecks
variable {R M N P : Type*} [CommRing R]
variable [AddCommGroup M] [AddCommGroup N] [AddCommGroup P]
variable [Module R M] [Module R N] [Module R P]

example (q : M →ₗ[R] N) (ell : Module.Dual R N) (x : M) :
    q.dualMap ell x = ell (q x) := by
  sorry

example (q : M →ₗ[R] N) (r : N →ₗ[R] P) :
    q.dualMap.comp r.dualMap = (r.comp q).dualMap := by
  sorry

example (q : M →ₗ[R] N) (a : R) (x y : M) :
    q (x - a • y) = q x - a • q y := by
  sorry

example (q : M →ₗ[R] N) (a b : R) (x y : M) :
    q (a • x + b • y) = a • q x + b • q y := by
  sorry

example (q : M →ₗ[R] N) (ell : Module.Dual R N)
    (eta : Module.Dual R M) (c : R) (h : q.dualMap ell = c • eta) (x : M) :
    ell (q x) = c * eta x := by
  sorry
end ExistingChecks

section InitialConductor
variable {F M₀ M₁ : Type*} [Field F]
  [AddCommGroup M₀] [Module F M₀] [AddCommGroup M₁] [Module F M₁]

/-- The normalized initial Euler factor forced by the raw trace and degree.
The letters p, u and d here are scalars. The arithmetic application must separately
identify u with its geometric multiplicity, and d with the actual first degree. -/
lemma initial_corestriction_comparison
    (res : M₀ →ₗ[F] M₁) (cor : M₁ →ₗ[F] M₀)
    (σ τ : Module.End F M₀) (x₀ : M₀) (x₁ : M₁)
    (α a p u d : F) (hα : α ≠ 0) (hu : u ≠ 0)
    (hroot : α ^ 2 - a * α + p = 0) (hdegree : u * d = p - 1)
    (htrace : u • cor x₁ = a • x₀ - σ x₀ - τ x₀)
    (hcorres : cor (res x₀) = d • x₀) (hinv : σ (τ x₀) = x₀) :
    cor (α⁻¹ • (x₁ - α⁻¹ • res x₀)) =
      u⁻¹ • ((x₀ - α⁻¹ • τ x₀) - α⁻¹ • σ (x₀ - α⁻¹ • τ x₀)) := by
  sorry

/-- Changing the bottom alone is not a global renormalization of a nonzero tower. -/
lemma initial_only_rescaling_obstruction
    (cor : M₁ →ₗ[F] M₀) (y₁ : M₁) (y₀ : M₀) (h : cor y₁ = y₀)
    (hy : y₀ ≠ 0) (t : F) (ht : t ≠ 1) : cor y₁ ≠ t • y₀ := by
  sorry

-- Exact scalar model, not an asserted elliptic-curve Fourier coefficient:
-- p=5, alpha=2, a=9/2, u=1, d=4, sigma=tau=id, x0=1, cor=id.
example : (2 : ℚ)⁻¹ * ((5 / 2 : ℚ) - (2 : ℚ)⁻¹ * 4) =
    (1 - (2 : ℚ)⁻¹) ^ 2 := by
  sorry

-- Replacing u=1 by the full unit count 2 changes only the predicted bottom.
example : (2 : ℚ)⁻¹ * ((5 / 2 : ℚ) - (2 : ℚ)⁻¹ * 4) ≠
    (2 : ℚ)⁻¹ * (1 - (2 : ℚ)⁻¹) ^ 2 := by
  sorry

-- In contrast, a uniform rescaling of the entire system is compatible.
example (cor : M₁ →ₗ[F] M₀) (y₁ : M₁) (y₀ : M₀) (h : cor y₁ = y₀) (t : F) :
    cor (t • y₁) = t • y₀ := by
  sorry
end InitialConductor

section UniformComparison
variable {R : Type*} [CommRing R]
variable {M N : ℕ → Type*}
  [∀ n, AddCommGroup (M n)] [∀ n, Module R (M n)]
  [∀ n, AddCommGroup (N n)] [∀ n, Module R (N n)]

/-- The kernel bound holds for every sequence, hence for compatible sequences.
There is one common scalar d. No inverse-limit exactness is used. -/
lemma uniform_coherent_kernel_bound
    (f : ∀ n, M n →ₗ[R] N n) (g : ∀ n, N n →ₗ[R] M n) (d : R)
    (hgf : ∀ n x, g n (f n x) = d • x)
    (x : ∀ n, M n) (hx : ∀ n, f n (x n) = 0) :
    ∀ n, d • x n = 0 := by
  sorry

/-- A compatible backward comparison lifts d times every compatible sequence.
The explicit witness is g_n(y_n); no new Iwasawa carrier is introduced. -/
lemma uniform_coherent_lift
    (μ : ∀ n, M (n + 1) →ₗ[R] M n)
    (ν : ∀ n, N (n + 1) →ₗ[R] N n)
    (f : ∀ n, M n →ₗ[R] N n) (g : ∀ n, N n →ₗ[R] M n) (d : R)
    (hfg : ∀ n y, f n (g n y) = d • y)
    (hg : ∀ n y, μ n (g (n + 1) y) = g n (ν n y))
    (y : ∀ n, N n) (hy : ∀ n, ν n (y (n + 1)) = y n) :
    ∃ x : ∀ n, M n,
      (∀ n, μ n (x (n + 1)) = x n) ∧ (∀ n, f n (x n) = d • y n) := by
  sorry

-- A nonunit uniform denominator need not give an integral isomorphism.
example : ¬ ∃ x : ℤ, 2 * x = 1 := by
  sorry

-- The multiple, rather than every element itself, is lifted integrally.
example (y : ℤ) : ∃ x : ℤ, 2 * x = 2 * y := by
  sorry
end UniformComparison

section UnboundedDenominators
/-- The integral inverse system Z <-[2]- Z <-[2]- ... has only the zero section. -/
lemma doubling_tower_zero (x : ℕ → ℤ) (h : ∀ n, x n = 2 * x (n + 1)) :
    ∀ n, x n = 0 := by
  sorry

-- The level maps f_n=2^n are natural from that tower to the constant tower.
example (n : ℕ) (x : ℤ) : (2 : ℤ) ^ n * (2 * x) = 2 ^ (n + 1) * x := by
  sorry

-- Every level map is surjective over Q (and is also injective).
example (n : ℕ) (y : ℚ) : ∃ x : ℚ, (2 : ℚ) ^ n * x = y := by
  sorry

-- Nevertheless the constant integral section 1 has no coherent preimage.
example : ¬ ∃ x : ℕ → ℤ,
    (∀ n, x n = 2 * x (n + 1)) ∧ (∀ n, (2 : ℤ) ^ n * x n = 1) := by
  sorry
end UnboundedDenominators


section RegulatorDescentChecks
variable {R M N : Type*} [CommRing R]
  [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]

-- Existing quotient algebra: an exact preimage identity is sufficient.
-- In the arithmetic application, the source/target coefficient submodules
-- and this identity must be supplied by the actual regulator construction.
example (P : Submodule R M) (Q : Submodule R N) (f : M →ₗ[R] N)
    (h : P ≤ Q.comap f) (hpreimage : Q.comap f = P) :
    Function.Injective (P.mapQ Q f h) := by
  sorry

-- Multiplication by X is injective over Q[X], but its reduction at X=0
-- is zero on the nonzero quotient Q[X]/(X), identified by constant coefficient.
example : Function.Injective (fun f : Polynomial ℚ => Polynomial.X * f) ∧
    (∀ f : Polynomial ℚ, (Polynomial.X * f).coeff 0 = 0) ∧
    (1 : Polynomial ℚ).coeff 0 ≠ 0 := by
  sorry

-- A scalar projection can lose information on a two-dimensional space.
example : ¬ Function.Injective (LinearMap.fst ℚ ℚ ℚ) := by
  sorry

-- A specified identification with a line and a nonzero functional do suffice.
example {F V : Type*} [Field F] [AddCommGroup V] [Module F V]
    (e : V ≃ₗ[F] F) (ell : Module.Dual F V) (hell : ell ≠ 0) :
    Function.Injective ell := by
  sorry
end RegulatorDescentChecks

#check Submodule.mapQ
#check Submodule.ker_mapQ
#check Submodule.mkQ_map_self
#check LinearMap.ker_eq_bot

end TauCeti.GeneralizedHeegnerCycles.WeightTwoChecks
