import Mathlib.RingTheory.WittVector.Frobenius
import Mathlib.RingTheory.WittVector.Teichmuller
import Mathlib.RingTheory.Perfectoid.FontaineTheta
import Mathlib.RingTheory.Perfectoid.BDeRham
import Mathlib.RingTheory.PowerSeries.Substitution

/-!
# Integral A_inf cohomology and Breuil–Kisin–Fargues structures

This file is not the roadmap and is not exhaustive. The accompanying
`research/blueprint/readmes/AInfCohomology.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every `sorry` is intentional; no theorem is claimed implemented.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Only light coefficient definitions on existing carriers occur here. The
ringed-topos enhancement, derived completion, Lη, BKF modules, formal/log
schemes, AΩ, infinitesimal cohomology and spectra are README targets because
their required carriers do not exist at these pins. No geometric hypothesis
is discarded to manufacture an assertion about an arbitrary ring or complex.

The generic coefficient identities below hold in their stated generality.
Their specialization to a primitive cyclotomic system in O_C^flat is AI.0.
The two real power-series maps are the algebraic component of AI.7 coefficient
normalization; continuous evaluation at π and [π^flat] remains in the reader.
-/

noncomputable section
open scoped BigOperators
namespace TauCeti.AInfSuggested

section Cyclotomic
variable (p : ℕ) [Fact p.Prime]
variable {S : Type*} [CommRing S] [CharP S p] [PerfectRing S p]

/-- AI.0/cyclotomic-coefficients: the mu formula on the existing Witt carrier. -/
def mu (epsilon : S) : WittVector p S :=
  WittVector.teichmuller p epsilon - 1

/-- Polynomial formula for xi; it uses no division in the Witt ring. -/
def xi (epsilon : S) : WittVector p S :=
  ∑ j ∈ Finset.range p,
    (WittVector.teichmuller p ((_root_.frobeniusEquiv S p).symm epsilon)) ^ j

/-- The Frobenius-shifted theta-kernel generator. -/
def tildeXi (epsilon : S) : WittVector p S :=
  WittVector.frobenius (xi p epsilon)

/-- AI.0/witt-kernel-generators: restriction/Frobenius convention. -/
def xiLevel (epsilon : S) (r : ℕ) : WittVector p S :=
  ∏ j ∈ Finset.range r, ((WittVector.frobeniusEquiv p S).symm^[j]) (xi p epsilon)

/-- The shifted finite-Witt generator, in the same convention as theta_tilde_r. -/
def tildeXiLevel (epsilon : S) (r : ℕ) : WittVector p S :=
  ∏ j ∈ Finset.range r, ((WittVector.frobeniusEquiv p S)^[j + 1]) (xi p epsilon)

/-- The coefficient factorization is valid before imposing perfectoid geometry. -/
theorem mu_factorization (epsilon : S) :
    mu p epsilon = xi p epsilon *
      (WittVector.frobeniusEquiv p S).symm (mu p epsilon) := by sorry

theorem frobenius_mu (epsilon : S) :
    WittVector.frobenius (mu p epsilon) = tildeXi p epsilon * mu p epsilon := by sorry

-- The empty product is the finite-length-zero coefficient test.
example (epsilon : S) : xiLevel p epsilon 0 = 1 := by sorry

-- At length one the two theta conventions already give different generators.
example (epsilon : S) :
    xiLevel p epsilon 1 = xi p epsilon ∧
      tildeXiLevel p epsilon 1 = tildeXi p epsilon := by sorry

-- Non-example: epsilon=1 is not a primitive compatible root system.
example : mu p (1 : S) = 0 ∧ xi p (1 : S) = p := by sorry
end Cyclotomic

section ShiftedTheta
variable {A O : Type*} [CommRing A] [CommRing O]

/-- AI.0/tilde-theta: composition with the inverse coefficient Frobenius. -/
def shiftedTheta (theta : A →+* O) (phi : A ≃+* A) : A →+* O :=
  theta.comp phi.symm.toRingHom

theorem shiftedTheta_surjective (theta : A →+* O) (phi : A ≃+* A)
    (h : Function.Surjective theta) :
    Function.Surjective (shiftedTheta theta phi) := by sorry

/-- This transports an existing principal kernel; it does not assume principality. -/
theorem shiftedTheta_kernel (theta : A →+* O) (phi : A ≃+* A) (x : A)
    (hx : RingHom.ker theta = Ideal.span {x}) :
    RingHom.ker (shiftedTheta theta phi) = Ideal.span {phi x} := by sorry
end ShiftedTheta

section Fontaine
variable (p : ℕ) [Fact p.Prime]
variable (O : Type*) [CommRing O] [Fact (¬IsUnit (p : O))]
variable [IsAdicComplete (Ideal.span {(p : O)}) O]

/-- Uses Mathlib's actual Fontaine theta and pretilt, rather than a new ring. -/
def thetaTilde : WittVector p (PreTilt O p) →+* O :=
  shiftedTheta (WittVector.fontaineTheta O p)
    (WittVector.frobeniusEquiv p (PreTilt O p))

theorem thetaTilde_teichmuller (a : PreTilt O p) :
    thetaTilde p O (WittVector.teichmuller p a) =
      PreTilt.untilt ((_root_.frobeniusEquiv (PreTilt O p) p).symm a) := by sorry

theorem thetaTilde_teichmuller_pow (a : PreTilt O p) :
    thetaTilde p O (WittVector.teichmuller p a ^ p) = PreTilt.untilt a := by sorry

-- Compatibility with the pinned coefficient map on integer coefficients.
example : thetaTilde p O (p : WittVector p (PreTilt O p)) = p := by sorry
end Fontaine

section TorusCoefficient
variable {R : Type*} [CommRing R]

/-- AI.3/q-de-rham-model: nonnegative monomial q-integer coefficient. -/
def qInteger (q : R) (n : ℕ) : R := ∑ j ∈ Finset.range n, q ^ j

/-- The divided torus coefficient identity used before q-specialization. -/
theorem qInteger_factorization (q : R) (n : ℕ) :
    (q - 1) * qInteger q n = q ^ n - 1 := by sorry

-- Reduction q=1 recovers the ordinary logarithmic derivative coefficient.
example (n : ℕ) : qInteger (1 : R) n = n := by sorry
end TorusCoefficient

section BreuilKisinCoefficient
variable {R : Type*} [CommRing R]

/-- AI.7/coefficient-normalization: F on coefficients and u mapped to u^p. -/
def coefficientFrobenius (p : ℕ) (hp : p ≠ 0) (F : R →+* R) :
    PowerSeries R →+* PowerSeries R :=
  (PowerSeries.substAlgHom (PowerSeries.HasSubst.X_pow hp)).toRingHom.comp
    (PowerSeries.map F)

/-- The crystalline specialization includes F on the constant coefficient. -/
def crystallineCoefficient (F : R →+* R) : PowerSeries R →+* R :=
  F.comp (PowerSeries.constantCoeff (R := R))

/-- The coefficient-ring milestone, without any geometric evaluation assumption. -/
theorem coefficientFrobenius_formula (p : ℕ) (hp : p ≠ 0) (F : R →+* R)
    (a : R) (f : PowerSeries R) (n : ℕ) :
    coefficientFrobenius p hp F (PowerSeries.C a) = PowerSeries.C (F a) ∧
    coefficientFrobenius p hp F PowerSeries.X = PowerSeries.X ^ p ∧
    PowerSeries.coeff n (coefficientFrobenius p hp F f) =
      if p ∣ n then F (PowerSeries.coeff (n / p) f) else 0 := by sorry

theorem crystallineCoefficient_commutes (p : ℕ) (hp : p ≠ 0) (F : R →+* R) :
    (crystallineCoefficient F).comp (coefficientFrobenius p hp F) =
      F.comp (crystallineCoefficient F) := by sorry

-- The identity specialization recovers exactly the pinned constantCoeff map.
example : crystallineCoefficient (RingHom.id R) =
    PowerSeries.constantCoeff (R := R) := by sorry

-- In this specialization the formal parameter has degree zero and maps to zero.
example (F : R →+* R) : crystallineCoefficient F PowerSeries.X = 0 := by sorry
end BreuilKisinCoefficient

end TauCeti.AInfSuggested
