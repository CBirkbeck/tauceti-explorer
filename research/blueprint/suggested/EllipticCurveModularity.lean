/-
Suggested.lean — EllipticCurveModularity (modularity and modular parametrisations of elliptic curves over ℚ)

This file is a prototype, not a library file or an exhaustive roadmap. The reader document is definitive;
these statements suggest names and Lean signatures. Stateable prototypes use `sorry`; the contract ledger below
records the remaining interfaces without claiming that comments are elaborated declarations. Node ids refer to
`research/blueprint/packets/EllipticCurveModularity.json`.

Under the accepted restructuring RS-06 this roadmap keeps the application to an arbitrary E/ℚ; the general theory (Tate
modules, Serre's conjecture, newforms, local–global compatibility, modular quotients, the Abel–Jacobi map) is imported
from its owners. The arithmetic lemmas of the argument are prototyped here against Mathlib; statements that need objects
not yet available here (the residual-representation/conductor interface and J₀(N)) are recorded as comments.
`HeckeRing.GL2.Newform` itself exists at Tau Ceti f790474; the missing pieces include the conductor-indexed
elliptic witness, its residual comparison and the quotient/parametrisation interfaces.
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
theorem irreducible_of_not_mem (h : p ∉ exceptionalPrimes E) : (ρ̄ E p).IsIrreducible   -- R01.6; p.Prime required
-- Absolute irreducibility is a separate odd-characteristic application of R01.4.
theorem conductor_residual_eq (h : p ∉ exceptionalPrimes E) : conductor (ρ̄ E p) = conductor E   -- residual-conductor-equality
-/

/-! Named packet tests for `exceptional-primes`. These are prototypes, not verified Lean proofs.
The coefficient order is a₁,a₂,a₃,a₄,a₆. Exact arithmetic supporting the expected values is in the review report. -/

def curve11a1 : WeierstrassCurve ℚ := ⟨0, -1, 1, -10, -20⟩
def curve26b1 : WeierstrassCurve ℚ := ⟨1, -1, 1, -3, 3⟩
def curveValuationOnly : WeierstrassCurve ℚ := ⟨1, 0, 0, -7, 9⟩
def curveCM : WeierstrassCurve ℚ := ⟨0, 0, 0, -1, 0⟩

instance : curve11a1.IsElliptic := by sorry
instance : curve26b1.IsElliptic := by sorry
instance : curveValuationOnly.IsElliptic := by sorry
instance : curveCM.IsElliptic := by sorry

theorem exceptionalPrimes_11a1 :
    5 ∈ exceptionalPrimes curve11a1 ∧ 11 ∈ exceptionalPrimes curve11a1 := by sorry

theorem exceptionalPrimes_contains_small :
    2 ∈ exceptionalPrimes E ∧ 3 ∈ exceptionalPrimes E ∧ 5 ∈ exceptionalPrimes E := by sorry

theorem exceptionalPrimes_CM :
    (exceptionalPrimes curveCM).Finite ∧ 2 ∈ exceptionalPrimes curveCM := by sorry

-- No rational cyclic 7-subgroup: at the good prime 3 the discriminant is 3 mod 7, a nonsquare.
theorem exceptionalPrimes_11a1_seven : 7 ∉ exceptionalPrimes curve11a1 := by sorry

-- A point of exact order 7, and multiplicative v₂(j) = -7; the curve is good at 7.
theorem exceptionalPrimes_26b1 : 7 ∈ exceptionalPrimes curve26b1 := by sorry

-- The valuation clause alone: no rational cyclic 7-subgroup, since at 3 the discriminant is 6 mod 7.
theorem exceptionalPrimes_valuation_only : 7 ∈ exceptionalPrimes curveValuationOnly := by sorry

/-! ## R29.2. Trivial nebentypus by reduction -/

/-- `EllipticCurveModularity:R29.2/trivial-nebentypus-by-reduction`: a root of unity of order prime to p that is ≡ 1
modulo a prime above p equals 1. The primality of `p` is needed: for `p = 4`, `m = 2`, `ζ = -1` and `𝔭 = (2)` in `ℤ`
all other hypotheses hold (added by REV-EllipticCurveModularity). -/
theorem eq_one_of_pow_eq_one_of_sub_mem {K : Type*} [Field K] [NumberField K] (ζ : 𝓞 K) {m : ℕ} (hm : ζ ^ m = 1)
    (𝔭 : Ideal (𝓞 K)) [𝔭.IsPrime] {p : ℕ} (hp' : p.Prime) (hp : (p : 𝓞 K) ∈ 𝔭) (hpm : ¬ p ∣ m)
    (h : ζ - 1 ∈ 𝔭) : ζ = 1 := sorry

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

IMPORTED CONTRACT, not a local theorem/node:
Owner: tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization
Miyake 4.6.19, specialized to weight two and trivial character. The pinned fixed-level
Newform.eq_of_forall_notMem_eigenvalue_eq does not supply this prime-agreement contract.

theorem eq_of_eigenvalue_eq_across_levels {N M M' : ℕ} [NeZero N] [NeZero M] [NeZero M']
    (f : HeckeRing.GL2.Newform M 2) (g : HeckeRing.GL2.Newform M' 2)
    (hM : M ∣ N) (hM' : M' ∣ N) (hfχ : f.χ = 1) (hgχ : g.χ = 1)
    (S : Finset ℕ)
    (h : ∀ ℓ : ℕ, ℓ.Prime → ¬ ℓ ∣ N → ℓ ∉ S → A_ℓ(f) = A_ℓ(g)) :
    M = M' ∧ HEq f g
Here A_ℓ is the supplier's good Fourier coefficient; after M = M', compare the
forms by transport. Only finitely many primes divide the nonzero N. The level-11/22 oldform
acceptance belongs to newform-of-E, and is not a proof of this imported theorem.
R29.3 first constructs a primitive form at a nonzero M dividing N=conductor E.
Only after R29.4/exact-conductor may the following final export have level N.
noncomputable def newformOf (E) : HeckeRing.GL2.Newform (conductor E) 2                          -- final export
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

/-
UNSTATEABLE CONTRACT LEDGER (remaining RT /5 obligation, not Lean declarations).
All sixteen packet API names are represented either by prototypes above or by these comments.
No arbitrary-level newform is asserted from a curve without a conductor/level relation.

R29.1:
  goodReduction_of_not_mem: p.Prime and p ∉ exceptionalPrimes E imply p ∤ conductor E.
  Needs the supplier's conductor and reduction interfaces; irreducible_of_not_mem likewise
  needs the actual residual representation. Oddness and absolute irreducibility remain separate.

R29.2:
  serreWitness: for p.Prime and p ∉ Σ_E, construct a weight-two newform g_p at exact N,
    trivial character, a coefficient field embedding and a prime λ_p above p.
  serreWitness_level: project the exact level N, weight two and trivial character data.
  serreWitness_trace: for ℓ.Prime and ℓ ∤ N*p, a_ℓ(g_p) reduces to a_ℓ(E) modulo λ_p.
  serreWitness_residual: identify the actual residual representation of g_p at λ_p with E[p].
  Tests requiring those interfaces:
    serreWitness_11a1: at p=7 use the level-11 eta-product newform.
    serreWitness_trace_2: a₂(g_7)=-2=a₂(E) for E=11a1.
    serreWitness_not_at_exceptional: p=5 is exceptional, so no witness is requested.

R29.3:
  newformOf_unique: compare normalized weight-two trivial-character newforms of levels M,M′
    dividing N with the same good prime coefficients; import Layer 5, prove M=M′ and transport.
  Tests requiring the curve/newform and q-expansion interfaces:
    newformOf_11a1: the final level-11 newform is η(z)²η(11z)².
    newformOf_isogeny_invariant: 11a1,11a2,11a3 give the same final form after level transport.
    newformOf_twist: at good primes away from the twist conductor, coefficients are twisted
      by the quadratic character; compare primitive levels, not an arbitrary oldform ambient level.

R29.5:
  modularParametrisation_nonconstant: the actual X₀(N)→E composite has positive degree.
  modularParametrisation_pullback: pull back ω_E to c·2πi F_E(z)dz for a nonzero scalar c,
    with the quotient, isogeny and differential conventions specified.
  Tests requiring curve morphisms, choices and degree:
    modularParametrisation_11a1: the chosen composite is the degree-one isomorphism X₀(11)→11a1.
    modularParametrisation_11a3: compose that isomorphism with the chosen minimal 5-isogeny;
      its degree is 5. Arbitrary isogeny choices do not have this degree.
    modularParametrisation_37a: the chosen optimal parametrisation has degree 2.

R29.6:
  The quotient converse must use the R14.5 old/new decomposition with multiplicity τ(N/M).
  R19.6 compares individual A_f and uses restriction of scalars from K_{f,λ} to ℚ_r.
  Absolute irreducibility, constituent selection and descent are still proof obligations;
  semisimplicity alone does not identify V_r(E) with one V_{f,λ}.
-/

end TauCeti.EllipticCurve.Modularity
