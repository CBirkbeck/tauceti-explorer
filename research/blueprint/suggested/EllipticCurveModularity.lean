/-
Suggested.lean — EllipticCurveModularity (modularity and modular parametrisations of elliptic curves over ℚ)

This file is a prototype, not a library file. It records the signatures, API lemmas and unit tests planned by
`research/blueprint/packets/EllipticCurveModularity.json`, each proved by `sorry`. Node ids are given in the comments.

Under the accepted restructuring RS-06 this roadmap keeps the application to an arbitrary E/ℚ; the general theory (Tate
modules, Serre's conjecture, newforms, local–global compatibility, modular quotients, the Abel–Jacobi map) is imported
from its owners. The arithmetic lemmas of the argument are prototyped here against Mathlib; statements that need objects
not yet in the pinned libraries (residual representations, newforms, J₀(N)) are recorded as comments.
-/
import Mathlib.AlgebraicGeometry.EllipticCurve.LFunction
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.RingTheory.Norm.Basic
import Mathlib.RingTheory.Ideal.Operations
import Mathlib.Data.Fintype.Pigeonhole
import Mathlib.Data.Nat.Totient
import Mathlib.Data.Set.Finite.Basic

open NumberField

namespace TauCeti.EllipticCurve.Modularity

/-! ## R29.1. The exceptional primes -/

variable (E : WeierstrassCurve ℚ) [E.IsElliptic]

/-- `EllipticCurveModularity:R29.1/exceptional-primes`: p ≤ 5, bad primes, primes dividing v_ℓ(j_E) at multiplicative
ℓ, and degrees of rational cyclic isogenies. -/
noncomputable def exceptionalPrimes (E : WeierstrassCurve ℚ) [E.IsElliptic] : Set ℕ := sorry

theorem exceptionalPrimes_finite : (exceptionalPrimes E).Finite := sorry

theorem two_mem_exceptionalPrimes : 2 ∈ exceptionalPrimes E := sorry

theorem five_mem_exceptionalPrimes : 5 ∈ exceptionalPrimes E := sorry

/-- Every prime outside the exceptional set is a prime of good reduction and at least 7. -/
theorem seven_le_of_not_mem {p : ℕ} (hp : p.Prime) (h : p ∉ exceptionalPrimes E) : 7 ≤ p := sorry

/-
theorem irreducible_of_not_mem (h : p ∉ exceptionalPrimes E) : (ρ̄ E p).IsAbsolutelyIrreducible   -- R01.4, R01.6
theorem conductor_residual_eq (h : p ∉ exceptionalPrimes E) : conductor (ρ̄ E p) = conductor E   -- residual-conductor-equality
-/

/-! ## R29.2. Trivial nebentypus by reduction -/

/-- `EllipticCurveModularity:R29.2/trivial-nebentypus-by-reduction`: a root of unity of order prime to p that is ≡ 1
modulo a prime above p equals 1. -/
theorem eq_one_of_pow_eq_one_of_sub_mem {K : Type*} [Field K] [NumberField K] (ζ : 𝓞 K) {m : ℕ} (hm : ζ ^ m = 1)
    (𝔭 : Ideal (𝓞 K)) [𝔭.IsPrime] {p : ℕ} (hp : (p : 𝓞 K) ∈ 𝔭) (hpm : ¬ p ∣ m) (h : ζ - 1 ∈ 𝔭) : ζ = 1 := sorry

/-! ## R29.3. Pigeonhole and the norm argument -/

/-- `EllipticCurveModularity:R29.3/pigeonhole-infinite-fiber`. -/
theorem exists_infinite_fiber {ι : Type*} [Finite ι] {P : Set ℕ} (hP : P.Infinite) (F : ℕ → ι) :
    ∃ i, (P ∩ F ⁻¹' {i}).Infinite := sorry

/-- `EllipticCurveModularity:R29.3/algebraic-integer-norm-vanishing`, integer form. -/
theorem int_eq_zero_of_forall_dvd {n : ℤ} {P : Set ℕ} (hP : P.Infinite) (h : ∀ p ∈ P, (p : ℤ) ∣ n) : n = 0 := sorry

/-- `EllipticCurveModularity:R29.3/algebraic-integer-norm-vanishing`. -/
theorem eq_zero_of_mem_primes {K : Type*} [Field K] [NumberField K] (α : 𝓞 K) {P : Set ℕ} (hP : P.Infinite)
    (hprime : ∀ p ∈ P, p.Prime)
    (h : ∀ p ∈ P, ∃ 𝔭 : Ideal (𝓞 K), 𝔭.IsPrime ∧ (p : 𝓞 K) ∈ 𝔭 ∧ α ∈ 𝔭) : α = 0 := sorry

-- Unit tests.
example : ¬ ∃ P : Set ℕ, P.Infinite ∧ ∀ p ∈ P, (p : ℤ) ∣ 6 := sorry
/-- The primes split into the classes 1 and 3 mod 4; one class is infinite. -/
example : ∃ b : Bool, ({p : ℕ | p.Prime} ∩ (fun p => p % 4 == 1) ⁻¹' {b}).Infinite := sorry
/-- A nonzero algebraic integer lies in primes above only finitely many p: 2 ∈ 𝓞 ℚ(i) is not in primes above 3. -/
example : ¬ (3 : ℤ) ∣ 2 := by decide

/-
R29.3–R29.6 at the level of newforms and Jacobians (owners: Tau Ceti ModularForms Layers 4, 5, 7, 8g;
ModularCurvesPartII R14.5–R14.6; AutomorphicGaloisRepresentations R19.4, R19.6; ClassicalSerreModularity R27.6):

noncomputable def newformOf (E) : HeckeRing.GL2.Newform (conductor E) 2                          -- newform-of-E
theorem newformOf_coeff_prime (ℓ) (hℓ : ¬ ℓ ∣ conductor E) : a_ℓ (newformOf E) = E.ap ℓ
theorem newformOf_coeff_int (n) : a_n (newformOf E) ∈ Set.range (Int.cast : ℤ → ℂ)                   -- rational-coefficient-field
theorem level_newformOf : level (newformOf E) = conductor E                                        -- exact-conductor
theorem localPolynomial_eq (ℓ) : E.localPolynomial ℤ_[ℓ]… = 1 - a_ℓ (newformOf E) X + 𝟙 ℓ X²        -- bad-euler-factors
theorem exists_isogeny_modularQuotient : Nonempty (A (newformOf E) ⟶ E)                           -- isogeny-to-E
noncomputable def modularParametrisation : X₀ (conductor E) ⟶ E                                     -- modular-parametrisation
theorem modularParametrisation_cusp : modularParametrisation E ∞ = 0
theorem modularity : ∃ f : Newform (conductor E) 2, ∀ p, a_p f = E.ap p                             -- modularity-theorem
theorem LSeries_eq : E.LSeries = LSeries (newformOf E)                                               -- l-function-continuation
-/

end TauCeti.EllipticCurve.Modularity
