/-
This suggested file is not the roadmap and is not exhaustive. The roadmap document is definitive;
these signatures, API lemmas and tests suggest Lean forms so contributors can agree on interfaces.
Every `sorry` records planned work, not an implementation.

The pinned Tau Ceti library DOES contain HeckeRing.GL2.Newform, with a nonzero natural level,
integer weight and inherited nebentypus. We use that carrier below. The curve-conductor,
residual-representation and modular-curve/Jacobian interfaces still have precise commented
contracts at the end. Those comments are NOT elaborated signatures.

The initial mathematical construction has primitive level M dividing conductor N. Only the later
exact-conductor theorem identifies M=N. The fixed-level `newformOf` interface below is conditional
on an explicit existence proof, stated using the actual Newform and WeierstrassCurve.LFunction.
It does not assert that an arbitrary E has a newform at an arbitrary N. The mathematical roadmap
must supply this hypothesis; this conditional choice does not prove modularity.
-/
import Mathlib.AlgebraicGeometry.EllipticCurve.LFunction
import Mathlib.NumberTheory.ModularForms.DedekindEta
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.RingTheory.Norm.Basic
import Mathlib.RingTheory.Ideal.Operations
import Mathlib.Data.Fintype.Pigeonhole
import Mathlib.Data.Nat.Totient
import Mathlib.Data.Set.Finite.Basic
import TauCeti.NumberTheory.ModularForms.Newforms.Newform

open NumberField UpperHalfPlane

namespace TauCeti.EllipticCurve.Modularity

variable (E : WeierstrassCurve ℚ) [E.IsElliptic]

/-! ## R29.1: exceptional primes and named tests -/

/-- Data prototype for the four prime clauses of Σ_E. Its conductor and subgroup definition
is specified in the packet; the Set-valued placeholder is not a proof of any property. -/
noncomputable def exceptionalPrimes (E : WeierstrassCurve ℚ) [E.IsElliptic] : Set ℕ := sorry

theorem exceptionalPrimes_finite : (exceptionalPrimes E).Finite := sorry

/-- Named packet test. -/
theorem exceptionalPrimes_contains_small :
    2 ∈ exceptionalPrimes E ∧ 3 ∈ exceptionalPrimes E ∧ 5 ∈ exceptionalPrimes E := sorry

theorem seven_le_of_not_mem {p : ℕ} (hp : p.Prime) (h : p ∉ exceptionalPrimes E) :
    7 ≤ p := sorry

def curve11a1 : WeierstrassCurve ℚ := ⟨0, -1, 1, -10, -20⟩
def curve26b1 : WeierstrassCurve ℚ := ⟨1, -1, 1, -3, 3⟩
def curveCM : WeierstrassCurve ℚ := ⟨0, 0, 0, -1, 0⟩
def curveValuationOnly : WeierstrassCurve ℚ := ⟨1, 0, 0, -7, 9⟩

instance : curve11a1.IsElliptic := by sorry
instance : curve26b1.IsElliptic := by sorry
instance : curveCM.IsElliptic := by sorry
instance : curveValuationOnly.IsElliptic := by sorry

theorem exceptionalPrimes_11a1 :
    5 ∈ exceptionalPrimes curve11a1 ∧ 11 ∈ exceptionalPrimes curve11a1 := sorry

theorem exceptionalPrimes_CM :
    (exceptionalPrimes curveCM).Finite ∧ 2 ∈ exceptionalPrimes curveCM := sorry

/-- Δ=-11^5, v₁₁(j)=-5; a₃=-1 gives nonsquare Frobenius discriminant 3 mod 7. -/
theorem exceptionalPrimes_11a1_seven : 7 ∉ exceptionalPrimes curve11a1 := sorry

/-- Both order-seven rational torsion and v₂(j)=-7 imply membership. -/
theorem exceptionalPrimes_26b1 : 7 ∈ exceptionalPrimes curve26b1 := sorry

/-- Valuation-only: v₂(j)=-7; a₃=-2 rules out a rational cyclic seven-subgroup. -/
theorem exceptionalPrimes_valuation_only : 7 ∈ exceptionalPrimes curveValuationOnly := sorry

/-- The domain excludes p=5; this does not claim the absence of any modular form at p=5. -/
theorem serreWitness_not_at_exceptional : 5 ∈ exceptionalPrimes curve11a1 := sorry

/-! ## R29.2–R29.3: arithmetic interfaces -/

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

/-! ## R29.3–R29.4: a conditional interface on the actual Newform carrier -/

section FixedLevel

variable (N : ℕ) [NeZero N]
variable (hN : ∃ f : HeckeRing.GL2.Newform N 2, f.χ = 1 ∧
  ∀ p : ℕ, p.Prime → ¬ p ∣ N →
    (qExpansion 1 f.toCuspForm).coeff p = (E.LFunction p : ℂ))

/-- Fixed-level export after the primitive-level construction and exact-conductor theorem.
The existence hypothesis is explicit and meaningful; it is not an opaque modularity field. -/
noncomputable def newformOf : HeckeRing.GL2.Newform N 2 := Classical.choose hN

theorem newformOf_coeff_prime (p : ℕ) (hp : p.Prime) (hpN : ¬ p ∣ N) :
    (qExpansion 1 (newformOf E N hN).toCuspForm).coeff p = (E.LFunction p : ℂ) := sorry

/-- Uses the prime-agreement theorem owned by ModularForms Layer 5. -/
theorem newformOf_unique (g : HeckeRing.GL2.Newform N 2) (hgχ : g.χ = 1)
    (hg : ∀ p : ℕ, p.Prime → ¬ p ∣ N →
      (qExpansion 1 g.toCuspForm).coeff p = (E.LFunction p : ℂ)) :
    g = newformOf E N hN := sorry

/-- Uses Galois conjugation and integrality from ModularForms Layers 8/8g and uniqueness
from Layer 5. Prime coefficients alone do not give integrality by definition. -/
theorem newformOf_coeff_int (n : ℕ) :
    (qExpansion 1 (newformOf E N hN).toCuspForm).coeff n ∈
      Set.range (Int.cast : ℤ → ℂ) := sorry

end FixedLevel


/-! The witness carrier exists. These two level-11 tests can be stated for any supplied
trivial-character witness, independently of the unavailable residual comparison map. -/
theorem serreWitness_11a1 (f : HeckeRing.GL2.Newform 11 2) (hfχ : f.χ = 1)
    (z : UpperHalfPlane) :
    f.toCuspForm z = ModularForm.eta (z : ℂ) ^ 2 * ModularForm.eta (11 * (z : ℂ)) ^ 2 := sorry

theorem serreWitness_trace_2 (f : HeckeRing.GL2.Newform 11 2) (hfχ : f.χ = 1) :
    (qExpansion 1 f.toCuspForm).coeff 2 = -2 := sorry

theorem newformOf_11a1
    (h11 : ∃ f : HeckeRing.GL2.Newform 11 2, f.χ = 1 ∧
      ∀ p : ℕ, p.Prime → ¬ p ∣ 11 →
        (qExpansion 1 f.toCuspForm).coeff p = (curve11a1.LFunction p : ℂ))
    (z : UpperHalfPlane) :
    (newformOf curve11a1 11 h11).toCuspForm z =
      ModularForm.eta (z : ℂ) ^ 2 * ModularForm.eta (11 * (z : ℂ)) ^ 2 := sorry

/-
Imported contract, NOT a new declaration in this roadmap:
  eq_of_eigenvalue_eq_across_levels
Owner: tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization.
For positive M,M′ dividing N, normalized weight-two newforms with trivial characters and equal
Fourier coefficients at almost all primes away from N have M=M′ and are equal after level
transport. All-good-index fixed-space SMO is a different hypothesis. The old copies at level 22
of the level-11 newform do not qualify as newforms at the larger level.

Precise contracts needing the linked conductor/residual/Jacobian interfaces (not executable Lean):

irreducible_of_not_mem: for a PRIME p outside Σ_E, the G_ℚ-module E[p] is irreducible;
  absolute irreducibility follows from oddness and p≥7 (R01.4/R01.6).
goodReduction_of_not_mem: for a PRIME p outside Σ_E, p does not divide the conductor of E;
  equivalently E has good reduction at p, using a minimal local equation (R01.6/EllipticCurves L4).
conductor_residual_eq: for a PRIME p outside Σ_E, the prime-to-p conductor of ρ̄_{E,p} is N_E.

serreWitness: for a PRIME p outside Σ_E, return (g_p, λ_p), with g_p a normalized weight-two
  newform at N_E, trivial character, and λ_p a prime of its coefficient field above p.
serreWitness_level: the witness has weight two, level N_E and trivial character.
serreWitness_trace: for a PRIME ℓ not dividing N_E*p, a_ℓ(g_p) and a_ℓ(E) are congruent mod λ_p.
serreWitness_residual: an isomorphism ρ̄_{g_p,λ_p} ≅ ρ̄_{E,p}, with the coefficient extension stated.
serreWitness_11a1: at p=7, g_p is q∏_{n≥1}(1-q^n)^2(1-q^(11*n))^2, at level 11.
serreWitness_trace_2: for this p=7 witness, a₂(g_p)=-2=a₂(curve11a1).
  Supplying a witness and its residual/coefficient-field maps is not implemented by the
  fixed-level conditional choice above.

newformOf (initial interface): choose (M_E,F_E), M_E positive and dividing N_E, F_E a Newform
  of weight two, trivial character, and good prime coefficients a_ℓ(E) for ℓ not dividing N_E.
newformOf_unique (initial interface): the primitive levels agree and the forms agree after
  transport. level_newformOf, from exact-conductor, then identifies M_E=N_E and supplies hN
  in the actual fixed-level signatures above. No conductor theorem is hidden in a comment
  beside an unconditional constructor.
newformOf_11a1: the exported primitive form at N_E=11 is η(z)^2 η(11*z)^2.
newformOf_isogeny_invariant: a specified ℚ-isogeny E→E′ gives the same conductor and the same
  primitive form after transport; in particular 11a1, 11a2 and 11a3 share their form.
newformOf_twist: for squarefree nonzero d, the primitive newform attached to E^(d) is the
  primitive associate of F_E twisted by χ_d. At primes away from both conductors and d its
  coefficient is χ_d(ℓ)*a_ℓ(F_E). A possibly imprimitive twist is not asserted new at an
  arbitrary displayed ambient level.

modularParametrisation: with N=N_E and a CHOSEN ℚ-isogeny λ:A_{F_E}→E, compose the Abel–Jacobi
  map at the rational cusp ∞, the modular quotient, and λ to obtain φ_{E,λ}:X₀(N)→E over ℚ.
modularParametrisation_cusp: φ_{E,λ}(∞)=O.
modularParametrisation_nonconstant: φ_{E,λ} is nonconstant, hence has positive degree.
modularParametrisation_pullback: for a nonzero invariant differential ω_E, there is c∈ℚ× with
  φ_{E,λ}^*ω_E=c*2πi*F_E(z) dz under the complex comparison.
modularParametrisation_11a1: the optimal quotient with λ=id has degree one and is an isomorphism.
modularParametrisation_11a3: with a specified minimal-degree five-isogeny 11a1→11a3, degree is five.
modularParametrisation_37a: for optimal 37a1 (y²+y=x³−x) and λ=id, degree is two.

Other layer contracts:
localPolynomial_eq: all local factors match the weight-two newform, with split/nonsplit
  multiplicative signs +1/-1 and additive coefficient zero, after M_E=N_E.
exists_isogeny_modularQuotient: a ℚ-isogeny A_{F_E}→E exists by the Tate comparison and Faltings.
modularity: the three formulations in R29.6 are equivalent and hold for every elliptic E/ℚ.
  The Jacobian decomposition has τ(N/M) old copies, Galois-orbit indexing and restriction of
  scalars from K_{f,λ}. The constituent argument imports absolute irreducibility from R19.1;
  semisimplicity alone does not identify a two-dimensional quotient with one summand.
LSeries_eq: the entire continuation of the coefficient L-series has the level-N completed
  functional equation with sign the eigenvalue of −W_N (ModularForms Layer 7).
-/

end TauCeti.EllipticCurve.Modularity
