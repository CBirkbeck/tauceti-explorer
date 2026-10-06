/-
This file is not the roadmap and is not exhaustive. The mathematical reader is definitive.
These signatures suggest names and native Lean forms for contributors and reviewers.
Every proof is admitted. The Mathlib arithmetic portion was elaborated with only admission
warnings. The full file could not be elaborated: the shared build lacks the prebuilt Tau Ceti
Newforms.Nebentypus module. No library build was started.
-/
import Mathlib.Data.Nat.Factorization.Defs
import Mathlib.Data.Nat.Totient
import Mathlib.Data.Fin.VecNotation
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.RingTheory.Norm.Transitivity
import Mathlib.LinearAlgebra.FreeModule.Finite.Matrix
import Mathlib.NumberTheory.NumberField.Norm
import Mathlib.RingTheory.Ideal.Norm.AbsNorm
import Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
import Mathlib.NumberTheory.ArithmeticFunction.Moebius
import Mathlib.NumberTheory.ArithmeticFunction.Misc
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Algebra.Polynomial.Degree.Defs
import Mathlib.Algebra.Polynomial.Monic
import TauCeti.NumberTheory.ModularForms.Newforms.Nebentypus
import TauCeti.NumberTheory.ModularForms.TrivialNebentypus

noncomputable section
open scoped BigOperators
namespace TauCeti.EffectiveEllipticComparison

/-- Martin's five rational prime-power factors, in the order s, v∞, v₂, v₃, μ. -/
def localTerms (p e : ℕ) : Fin 5 → ℚ := by sorry

lemma localTerms_zeroExponent (p : ℕ) : localTerms p 0 = 1 := by sorry
lemma localTerms_nonprime (p e : ℕ) (hp : ¬ p.Prime) (he : 0 < e) :
    localTerms p e = 0 := by sorry
lemma localTerms_table (p e : ℕ) (hp : p.Prime) (he : 0 < e) :
    localTerms p e = ![
      (if e = 1 then 1 - 1 / (p : ℚ) else if e = 2 then
        1 - 1 / (p : ℚ) - 1 / (p : ℚ)^2 else
        (1 - 1 / (p : ℚ)) * (1 - 1 / (p : ℚ)^2)),
      (if e % 2 = 1 then 0 else if e = 2 then (p : ℚ) - 2 else
        (p : ℚ)^(e / 2 - 2) * ((p : ℚ) - 1)^2),
      (if p = 2 then (if e = 1 ∨ e = 2 then -1 else if e = 3 then 1 else 0)
        else if p % 4 = 1 then (if e = 2 then -1 else 0)
        else (if e = 1 then -2 else if e = 2 then 1 else 0)),
      (if p = 3 then (if e = 1 ∨ e = 2 then -1 else if e = 3 then 1 else 0)
        else if p % 3 = 1 then (if e = 2 then -1 else 0)
        else (if e = 1 then -2 else if e = 2 then 1 else 0)),
      (if e = 1 then -1 else 0)] := by sorry

-- tests.local_zero_exponent
example : localTerms 0 0 = ![1, 1, 1, 1, 1] := by sorry
-- tests.local_two_square
example : localTerms 2 2 = ![1/4, 0, -1, 1, 0] := by sorry
-- tests.local_three_square
example : localTerms 3 2 = ![5/9, 1, 1, -1, 0] := by sorry
-- tests.local_two_cube
example : localTerms 2 3 = ![3/8, 0, 1, 0, 0] := by sorry

def martinValue (N : ℕ) : ℚ := by sorry
lemma martinValue_zero : martinValue 0 = 0 := by sorry
lemma martinValue_one : martinValue 1 = 0 := by sorry
lemma martinValue_formula (N : ℕ) (hN : 0 < N) :
    martinValue N =
      let T : Fin 5 → ℚ := fun j => ∏ p ∈ N.primeFactors, localTerms p (N.factorization p) j
      (N : ℚ) * T 0 / 12 - T 1 / 2 - T 2 / 4 - T 3 / 3 + T 4 := by sorry

-- tests.dimension_level_one
example : martinValue 1 = 0 := by sorry
-- tests.dimension_eleven
example : martinValue 11 = 1 := by sorry
-- tests.dimension_thirtyfive
example : martinValue 35 = 3 := by sorry
-- tests.dimension_thirty
example : martinValue 30 = 1 := by sorry

/-- Not a new space: a local abbreviation for the native trivial-character intersection. -/
private abbrev newDimension (N : ℕ) [NeZero N] : ℕ :=
  Module.finrank ℂ ↥(TauCeti.cuspFormsNew N 2 ⊓
    TauCeti.cuspFormCharSpace 2 (1 : (ZMod N)ˣ →* ℂˣ))

lemma dimension_comparison (N : ℕ) [NeZero N] :
    martinValue N = (newDimension N : ℚ) := by sorry

lemma product_estimates (N : ℕ) (hN : 0 < N) :
    let T : Fin 5 → ℚ := fun j => ∏ p ∈ N.primeFactors, localTerms p (N.factorization p) j
    (N : ℚ) * T 0 ≤ (N.totient : ℚ) ∧
    |T 2| ≤ (2 : ℚ)^N.primeFactors.card ∧
    |T 3| ≤ (2 : ℚ)^N.primeFactors.card ∧
    0 ≤ T 1 ∧ (T 1)^2 ≤ (N : ℚ) ∧ |T 4| ≤ 1 := by sorry

lemma coarse_bound (N : ℕ) (hN : 0 < N) :
    12 * martinValue N ≤ (N.totient : ℚ) + 7 * (2 : ℚ)^N.primeFactors.card + 12 := by sorry
lemma prime_case (p : ℕ) (hp : p.Prime) :
    12 * martinValue p ≤ (p : ℚ) + 1 ∧
      (12 * martinValue p = (p : ℚ) + 1 ↔ p % 12 = 11) := by sorry
lemma few_primes_large (N : ℕ) (hN : 1521 < N) (hc : ¬ N.Prime)
    (hw : N.primeFactors.card ≤ 2) : 12 * martinValue N < (N : ℚ) + 1 := by sorry
lemma few_primes_small (N : ℕ) (hN : 1 < N) (hbound : N ≤ 1521)
    (hc : ¬ N.Prime) (hw : N.primeFactors.card ≤ 2) :
    12 * martinValue N ≤ (N : ℚ) + 1 ∧
      (12 * martinValue N = (N : ℚ) + 1 ↔ N = 35) := by sorry
lemma sixth_power (N p : ℕ) (hN : 0 < N) (hp : p.Prime) (hd : p^6 ∣ N) :
    12 * martinValue N ≤ (N : ℚ) - 6 := by sorry
lemma two_large_primes (N p q : ℕ) (hN : 0 < N) (hw : 3 ≤ N.primeFactors.card)
    (hp : p.Prime) (hq : q.Prime) (hdp : p ∣ N) (hdq : q ∣ N)
    (h5p : 5 < p) (h5q : 5 < q) (hne : p ≠ q) :
    12 * martinValue N ≤ (N : ℚ) - 9 := by sorry
lemma large_prime_near_six (N p : ℕ) (hN : 1548 ≤ N) (hg : 1 < N.gcd 6)
    (hp : p.Prime) (hd : p ∣ N) (hlarge : 41 < p) :
    12 * martinValue N ≤ (N : ℚ) := by sorry
lemma small_prime_near_six (N p : ℕ) (hN : 0 < N) (hbound : N < 1548)
    (hg : 1 < N.gcd 6) (hp : p.Prime) (hd : p ∣ N) (hlarge : 41 < p) :
    12 * martinValue N ≤ (N : ℚ) := by sorry
lemma bounded_family (p a b c d : ℕ)
    (hp : p ∈ ({7,11,13,17,19,23,29,31,37,41} : Finset ℕ))
    (ha : a ≤ 5) (hb : b ≤ 5) (hc : c ≤ 5) (hd : d ≤ 5)
    (hcount : 3 ≤ (if a = 0 then 0 else 1) + (if b = 0 then 0 else 1) +
      (if c = 0 then 0 else 1) + (if d = 0 then 0 else 1)) :
    12 * martinValue (2^a * 3^b * 5^c * p^d) ≤
      ((2^a * 3^b * 5^c * p^d : ℕ) : ℚ) - 18 := by sorry

theorem martin_bound (N : ℕ) [NeZero N] :
    12 * newDimension N ≤ N + 1 ∧
      (12 * newDimension N = N + 1 ↔ N = 35 ∨ (N.Prime ∧ N % 12 = 11)) := by sorry

section Norm
variable {K : Type*} [Field K] [Algebra ℚ K]
lemma trace_gap (p : ℕ) (hp : 2 ≤ p) (c : K) (s : ℤ) (hs : s = 1 ∨ s = -1)
    (σ : K →ₐ[ℚ] ℂ) (hc : ‖σ c‖ ≤ 2 * Real.sqrt p) :
    (p : K) + 1 - (s : K) * c ≠ 0 := by sorry
lemma trace_norm [FiniteDimensional ℚ K] [Algebra.IsSeparable ℚ K]
    (p : ℕ) (hp : 2 ≤ p) (c : K) (s : ℤ) (hs : s = 1 ∨ s = -1)
    (hc : ∀ σ : K →ₐ[ℚ] ℂ, ‖σ c‖ ≤ 2 * Real.sqrt p) :
    |(Algebra.norm ℚ ((p : K) + 1 - (s : K) * c) : ℝ)| ≤
      (Real.sqrt p + 1)^(2 * Module.finrank ℚ K) := by sorry
end Norm

/-
The node removed_prime_bound has no invented geometric signature here. The existing
Weierstrass carrier is not a residual-representation/conductor package. Its exact E[ell],
minimal discriminant, conductor and level-lowering interfaces remain named mathematical
imports and the EC.1 gap. No Prop field, asserted conclusion or private surrogate replaces them.
-/

def krausF (N : ℕ) [NeZero N] : ℝ := by sorry
def krausG (N : ℕ) [NeZero N] : ℝ := by sorry
def krausH (N : ℕ) [NeZero N] : ℝ := by sorry
lemma krausF_eq (N : ℕ) [NeZero N] :
    krausF N = (Real.sqrt (((CongruenceSubgroup.Gamma0 N).index : ℝ)/6) + 1)^
      (2 * newDimension N) := by sorry
lemma one_le_krausF (N : ℕ) [NeZero N] : 1 ≤ krausF N := by sorry
lemma krausF_of_dimension_zero (N : ℕ) [NeZero N] (h : newDimension N = 0) :
    krausF N = 1 := by sorry
lemma krausG_eq (N : ℕ) [NeZero N] :
    krausG N = (Real.sqrt (((CongruenceSubgroup.Gamma0 (N.lcm 4)).index : ℝ)/6) + 1)^2 := by sorry
lemma one_le_krausG (N : ℕ) [NeZero N] : 1 ≤ krausG N := by sorry
lemma krausG_of_four_dvd (N : ℕ) [NeZero N] (h : 4 ∣ N) :
    krausG N = (Real.sqrt (((CongruenceSubgroup.Gamma0 N).index : ℝ)/6) + 1)^2 := by sorry
lemma krausH_eq (N : ℕ) [NeZero N] : krausH N = max (krausF N) (krausG N) := by sorry
lemma krausF_le_krausH (N : ℕ) [NeZero N] : krausF N ≤ krausH N := by sorry
lemma krausG_le_krausH (N : ℕ) [NeZero N] : krausG N ≤ krausH N := by sorry
lemma krausH_lt_iff (N : ℕ) [NeZero N] (ell : ℝ) :
    krausH N < ell ↔ krausF N < ell ∧ krausG N < ell := by sorry

-- tests.krausF_one
example : krausF 1 = 1 := by sorry
-- tests.krausF_eleven
example : krausF 11 = 3 + 2 * Real.sqrt 2 := by sorry
-- tests.krausF_thirtyfive
example : krausF 35 = (1 + Real.sqrt 8)^6 := by sorry
-- tests.krausG_one
example : krausG 1 = 4 := by sorry
-- tests.krausG_four
example : krausG 4 = 4 ∧ (Real.sqrt ((24 : ℝ)/6) + 1)^2 = 9 := by sorry
-- tests.krausG_eleven
example : krausG 11 = 13 + 4 * Real.sqrt 3 := by sorry
-- tests.krausH_one
example : krausH 1 = 4 := by sorry
-- tests.krausH_four
example : krausH 4 = 4 := by sorry
-- tests.krausH_eleven
example : krausH 11 = 13 + 4 * Real.sqrt 3 := by sorry

lemma prime_power_convolution (p e : ℕ) (hp : p.Prime) :
    (ArithmeticFunction.moebius * ArithmeticFunction.moebius) (p ^ e) =
      (if e = 0 then 1 else if e = 1 then -2 else if e = 2 then 1 else 0) ∧
    (ArithmeticFunction.moebius * ArithmeticFunction.moebius) *
      (ArithmeticFunction.sigma 0 : ArithmeticFunction ℤ) = 1 := by sorry

lemma real_exponent_bound (L d g p : ℕ) (hL : 0 < L) (hd : d ≤ g)
    (hp : 2 ≤ p) (hg : 12 * g ≤ L + 1) :
    (Real.sqrt p + 1) ^ (2 * d) ≤
      (Real.sqrt p + 1) ^ (((L : ℝ) + 1) / 6) := by sorry

section IntegerNorm
open scoped NumberField
variable {K : Type*} [Field K] [NumberField K]
lemma prime_divides_integral_norm (ell : ℕ) (hell : ell.Prime)
    (I : Ideal (𝓞 K)) (hI : I.IsPrime) (hI0 : I ≠ ⊥)
    (habove : Ideal.comap (Int.castRingHom (𝓞 K)) I = Ideal.span {(ell : ℤ)})
    (x : 𝓞 K) (hx : x ∈ I) :
    (ell : ℤ) ∣ Algebra.norm ℤ x ∧
      (x ≠ 0 → Algebra.norm ℤ x ≠ 0 ∧ (ell : ℤ) ≤ |Algebra.norm ℤ x|) := by sorry
end IntegerNorm

open Polynomial

def krausLocalFilters {R : Type*} [CommRing R] (p e : ℕ) (a : R) :
    Polynomial R × Polynomial R := by sorry

lemma krausLocalFilters_two {R : Type*} [CommRing R] (e : ℕ) (a : R) :
    krausLocalFilters 2 e a =
      (if e = 0 then (1 - C a * X + 2 * X ^ 2, 1)
       else if e = 1 then (1 - C a * X, 1) else (1, 1)) := by sorry
lemma krausLocalFilters_odd {R : Type*} [CommRing R] (p e : ℕ) (hp : p ≠ 2) (a : R) :
    krausLocalFilters p e a =
      (if e = 0 then (1, 1)
       else if e = 1 then (1, 1 - C ((p : R) + 1 - a) * X)
       else (1, 1 - C ((p : R) + 1) * X + C (p : R) * X ^ 2)) := by sorry
lemma krausLocalFilters_constant {R : Type*} [CommRing R] (p e : ℕ) (a : R) :
    (krausLocalFilters p e a).1.coeff 0 = 1 ∧
      (krausLocalFilters p e a).2.coeff 0 = 1 := by sorry
lemma krausLocalFilters_map {R S : Type*} [CommRing R] [CommRing S]
    (φ : R →+* S) (p e : ℕ) (a : R) :
    ((krausLocalFilters p e a).1.map φ, (krausLocalFilters p e a).2.map φ) =
      krausLocalFilters p e (φ a) := by sorry

-- tests.filters_two_unramified
example : krausLocalFilters 2 0 (3 : ℤ) = (1 - 3 * X + 2 * X ^ 2, 1) := by sorry
-- tests.filters_two_square
example : krausLocalFilters 2 2 (0 : ℤ) = (1, 1) := by sorry
-- tests.filters_three_once
example : krausLocalFilters 3 1 (-1 : ℤ) = (1, 1 - 5 * X) := by sorry
-- tests.filters_three_square
example : krausLocalFilters 3 2 (0 : ℤ) = (1, 1 - 4 * X + 3 * X ^ 2) := by sorry

def lemosNumerator (r : ℕ) : Polynomial ℤ := by sorry
lemma lemosNumerator_table :
    lemosNumerator 2 = (X + 16) ^ 3 ∧
    lemosNumerator 3 = (X + 27) * (X + 3) ^ 3 ∧
    lemosNumerator 5 = (X ^ 2 + 10 * X + 5) ^ 3 ∧
    lemosNumerator 7 = (X ^ 2 + 5 * X + 1) ^ 3 * (X ^ 2 + 13 * X + 49) ∧
    lemosNumerator 13 = (X ^ 4 + 7 * X ^ 3 + 20 * X ^ 2 + 19 * X + 1) ^ 3 *
      (X ^ 2 + 5 * X + 13) := by sorry
lemma lemosNumerator_monic (r : ℕ) (hr : r ∈ ({2, 3, 5, 7, 13} : Finset ℕ)) :
    (lemosNumerator r).Monic ∧ (lemosNumerator r).natDegree = r + 1 := by sorry
lemma lemosNumerator_constant :
    (lemosNumerator 2).coeff 0 = 4096 ∧
    (lemosNumerator 3).coeff 0 = 729 ∧
    (lemosNumerator 5).coeff 0 = 125 ∧
    (lemosNumerator 7).coeff 0 = 49 ∧
    (lemosNumerator 13).coeff 0 = 13 := by sorry
lemma lemosNumerator_other (r : ℕ) (hr : r ∉ ({2, 3, 5, 7, 13} : Finset ℕ)) :
    lemosNumerator r = 0 := by sorry

-- tests.j_two_constant
example : (lemosNumerator 2).eval 0 = 4096 := by sorry
-- tests.j_seven_degree
example : (lemosNumerator 7).natDegree = 8 ∧ (lemosNumerator 7).coeff 0 = 49 := by sorry
-- tests.j_thirteen_degree
example : (lemosNumerator 13).natDegree = 14 ∧ (lemosNumerator 13).coeff 0 = 13 := by sorry
-- tests.j_eleven_other
example : lemosNumerator 11 = 0 := by sorry

def lemosIntegralJ (r : ℕ) : Finset ℤ := by sorry
lemma mem_lemosIntegralJ (r : ℕ) (j : ℤ) :
    j ∈ lemosIntegralJ r ↔ r ∈ ({2, 3, 5, 7, 13} : Finset ℕ) ∧
      ∃ t : ℤ, t ≠ 0 ∧ t ∣ (lemosNumerator r).coeff 0 ∧
        j = (lemosNumerator r).eval t / t := by sorry
lemma lemosIntegralJ_other (r : ℕ) (hr : r ∉ ({2, 3, 5, 7, 13} : Finset ℕ)) :
    lemosIntegralJ r = ∅ := by sorry
lemma lemosIntegralJ_cards :
    (lemosIntegralJ 2).card = 25 ∧ (lemosIntegralJ 3).card = 13 ∧
    (lemosIntegralJ 5).card = 8 ∧ (lemosIntegralJ 7).card = 6 ∧
    (lemosIntegralJ 13).card = 4 := by sorry

-- tests.integral_j_two
example : (lemosIntegralJ 2).card = 25 ∧ 0 ∈ lemosIntegralJ 2 ∧
    1728 ∈ lemosIntegralJ 2 := by sorry
-- tests.integral_j_five
example : (lemosIntegralJ 5).card = 8 ∧ 64 ∈ lemosIntegralJ 5 := by sorry
-- tests.integral_j_thirteen
example : lemosIntegralJ 13 = {-64 * 9 * 4079 ^ 3, 576, 4096 * 27 * 19,
    4096 * 27 * 19 * 991 ^ 3} := by sorry
-- tests.integral_j_other
example : lemosIntegralJ 11 = ∅ := by sorry

end TauCeti.EffectiveEllipticComparison

/-
Signature boundary audit (mathematical specifications are in the reader and packet).
These names have no prototype here. Native newform coefficient-field, integral congruence,
local Galois, conductor, Cartan-modular-curve or winding-quotient interfaces are missing.
Their conditions are left out under PROTOCOL §13. No private surrogate or Prop assumption
bundle is introduced. Each entry gives the exact packet node and direct suppliers.

EllipticModularityEffectiveComparisons:EC.1/removed-prime-bound
TauCeti.EffectiveEllipticComparison.removed_prime_bound
  prerequisites: EllipticModularityEffectiveComparisons:EC.1/removed-prime-degree-bound, EllipticModularityEffectiveComparisons:EC.1/coefficient-orbit-degree, EllipticModularityEffectiveComparisons:EC.1/real-exponent-bound

EllipticModularityEffectiveComparisons:EC.0/correction-convolution
TauCeti.EffectiveEllipticComparison.correction_convolution
  prerequisites: EllipticModularityEffectiveComparisons:EC.0/prime-power-convolution, EllipticModularityEffectiveComparisons:EC.0/local-factors, tauceti:TauCetiRoadmap/ModularForms#layer-10-the-modular-curve-γℍ-and-the-dimension-formulas

EllipticModularityEffectiveComparisons:EC.1/coefficient-orbit-degree
TauCeti.EffectiveEllipticComparison.coefficient_orbit_degree
  prerequisites: tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields, tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality, tauceti:TauCeti.cuspFormsNew_inf_cuspFormCharSpace

EllipticModularityEffectiveComparisons:EC.1/removed-prime-degree-bound
TauCeti.EffectiveEllipticComparison.removed_prime_degree_bound
  prerequisites: EllipticCurveModularity:R29.6/modularity-theorem, SerreWeightAndLevelOptimisation:R20.6/reduced-level-of-elliptic-curve, SerreWeightAndLevelOptimisation:R20.6/weight-two-newform-at-reduced-level, SerreWeightAndLevelOptimisation:R20.6/removed-prime-trace-congruence, EllipticModularityEffectiveComparisons:EC.1/trace-gap, EllipticModularityEffectiveComparisons:EC.1/trace-norm, AutomorphicGaloisRepresentations:R19.6, DeligneWeightsAndPurity:DWP.1/weil-estimate-for-abelian-varieties, EllipticModularityEffectiveComparisons:EC.1/prime-divides-integral-norm

EllipticModularityEffectiveComparisons:EC.3/exact-weight-two-lift
TauCeti.EffectiveEllipticComparison.exact_weight_two_lift
  prerequisites: EllipticCurveModularity:R29.6/modularity-theorem, SerreWeightAndLevelOptimisation:R20.2/descend-to-serre-level, SerreWeightAndLevelOptimisation:R20.3, AutomorphicGaloisRepresentations:R19.6/residual-representation-of-a-newform, ArithmeticGaloisRepresentations:R01.6

EllipticModularityEffectiveComparisons:EC.3/rationality-from-small-primes
TauCeti.EffectiveEllipticComparison.rationality_from_small_primes
  prerequisites: ComputationalNumberTheory:CN.3/modular-data-equality, tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields, tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality, tauceti:TauCetiRoadmap/ModularForms#layer-10-the-modular-curve-γℍ-and-the-dimension-formulas, tauceti:TauCeti.ModularForm.eq_of_sturm_bound

EllipticModularityEffectiveComparisons:EC.3/nonrational-witness
TauCeti.EffectiveEllipticComparison.nonrational_witness
  prerequisites: EllipticModularityEffectiveComparisons:EC.3/rationality-from-small-primes, AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical

EllipticModularityEffectiveComparisons:EC.3/small-prime-below-f
TauCeti.EffectiveEllipticComparison.small_prime_below_f
  prerequisites: EllipticModularityEffectiveComparisons:EC.2/kraus-f, tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor

EllipticModularityEffectiveComparisons:EC.3/bounded-integer-trace-norm
TauCeti.EffectiveEllipticComparison.bounded_integer_trace_norm
  prerequisites: AutomorphicGaloisRepresentations:R19.6, DeligneWeightsAndPurity:DWP.1/weil-estimate-for-abelian-varieties, mathlib:Algebra.norm_eq_prod_embeddings, ArithmeticGaloisRepresentations:R01.6

EllipticModularityEffectiveComparisons:EC.3/rational-coefficient-forcing
TauCeti.EffectiveEllipticComparison.rational_coefficient_forcing
  prerequisites: EllipticModularityEffectiveComparisons:EC.3/exact-weight-two-lift, EllipticModularityEffectiveComparisons:EC.3/nonrational-witness, EllipticModularityEffectiveComparisons:EC.3/small-prime-below-f, EllipticModularityEffectiveComparisons:EC.3/bounded-integer-trace-norm, EllipticModularityEffectiveComparisons:EC.1/prime-divides-integral-norm, EllipticModularityEffectiveComparisons:EC.1/coefficient-orbit-degree, ArithmeticGaloisRepresentations:R01.3, ArithmeticGaloisRepresentations:R01.6, AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical, AutomorphicGaloisRepresentations:R19.6/residual-representation-of-a-newform

EllipticModularityEffectiveComparisons:EC.3/rational-form-elliptic-realization
TauCeti.EffectiveEllipticComparison.rational_form_elliptic_realization
  prerequisites: ModularCurvesPartII:R14.5/modular-quotient, ModularCurvesPartII:R14.5/modular-quotient-dimension, AutomorphicGaloisRepresentations:R19.6/weight-two-tate-module-decomposition, AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical, AutomorphicGaloisRepresentations:R19.6/residual-representation-of-a-newform, ArithmeticGaloisRepresentations:R01.6, ArithmeticGaloisRepresentations:R01.5, ModularCurvesPartII:R14.5/trivial-character-J0

EllipticModularityEffectiveComparisons:EC.3/kraus-rational-realization
TauCeti.EffectiveEllipticComparison.kraus_rational_realization
  prerequisites: EllipticModularityEffectiveComparisons:EC.3/exact-weight-two-lift, EllipticModularityEffectiveComparisons:EC.3/rational-coefficient-forcing, EllipticModularityEffectiveComparisons:EC.3/rational-form-elliptic-realization

EllipticModularityEffectiveComparisons:EC.3/odd-eisenstein-series
TauCeti.EffectiveEllipticComparison.odd_eisenstein_series
  prerequisites: tauceti:TauCetiRoadmap/ModularForms#layer-10-the-modular-curve-γℍ-and-the-dimension-formulas, AlgebraicModularFormsAndSerreWeights:R15.2

EllipticModularityEffectiveComparisons:EC.3/filtered-coefficients
TauCeti.EffectiveEllipticComparison.filtered_coefficients
  prerequisites: EllipticModularityEffectiveComparisons:EC.3/local-mod-four-filters, EllipticModularityEffectiveComparisons:EC.3/odd-eisenstein-series, tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor, AlgebraicModularFormsAndSerreWeights:R15.2

EllipticModularityEffectiveComparisons:EC.3/prime-power-ideal-sturm
TauCeti.EffectiveEllipticComparison.prime_power_ideal_sturm
  prerequisites: EllipticModularityEffectiveComparisons:EC.3/filtered-coefficients, AlgebraicModularFormsAndSerreWeights:R15.2

EllipticModularityEffectiveComparisons:EC.3/finite-four-count-witness
TauCeti.EffectiveEllipticComparison.finite_four_count_witness
  prerequisites: EllipticModularityEffectiveComparisons:EC.3/prime-power-ideal-sturm, AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical

EllipticModularityEffectiveComparisons:EC.3/small-prime-below-g
TauCeti.EffectiveEllipticComparison.small_prime_below_g
  prerequisites: EllipticModularityEffectiveComparisons:EC.2/kraus-g

EllipticModularityEffectiveComparisons:EC.3/mod-four-trace-transfer
TauCeti.EffectiveEllipticComparison.mod_four_trace_transfer
  prerequisites: EllipticModularityEffectiveComparisons:EC.3/finite-four-count-witness, EllipticModularityEffectiveComparisons:EC.3/small-prime-below-g, tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68, ArithmeticGaloisRepresentations:R01.6, EllipticModularityEffectiveComparisons:EC.1/trace-gap, ArithmeticGaloisRepresentations:R01.3, AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical, AutomorphicGaloisRepresentations:R19.6/residual-representation-of-a-newform

EllipticModularityEffectiveComparisons:EC.3/four-count-rational-two
TauCeti.EffectiveEllipticComparison.four_count_rational_two
  prerequisites: ArithmeticGaloisRepresentations:R01.4, ArithmeticGaloisRepresentations:R01.5, ArithmeticGaloisRepresentations:R01.6

EllipticModularityEffectiveComparisons:EC.3/four-count-full-two-selection
TauCeti.EffectiveEllipticComparison.four_count_full_two_selection
  prerequisites: EllipticModularityEffectiveComparisons:EC.3/four-count-rational-two, EllipticModularityEffectiveComparisons:EC.3/four-count-square-classes, tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv, tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68

EllipticModularityEffectiveComparisons:EC.3/kraus-full-two-realization
TauCeti.EffectiveEllipticComparison.kraus_full_two_realization
  prerequisites: EllipticCurveModularity:R29.6/modularity-theorem, EllipticModularityEffectiveComparisons:EC.2/kraus-h, EllipticModularityEffectiveComparisons:EC.3/kraus-rational-realization, EllipticModularityEffectiveComparisons:EC.3/mod-four-trace-transfer, EllipticModularityEffectiveComparisons:EC.3/four-count-full-two-selection, tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv, ArithmeticGaloisRepresentations:R01.6, ArithmeticGaloisRepresentations:R01.3

EllipticModularityEffectiveComparisons:EC.3/deletion-conductor-away
TauCeti.EffectiveEllipticComparison.deletion_conductor_away
  prerequisites: SerreWeightAndLevelOptimisation:R20.6/reduced-level-of-elliptic-curve, ArithmeticGaloisRepresentations:R01.3, ArithmeticGaloisRepresentations:R01.6, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/multiplicative-torsion-inertia

EllipticModularityEffectiveComparisons:EC.3/deletion-level-exact-adapter
TauCeti.EffectiveEllipticComparison.deletion_level_exact_adapter
  prerequisites: EllipticModularityEffectiveComparisons:EC.3/deletion-conductor-away, SerreWeightAndLevelOptimisation:R20.6/reduced-level-of-elliptic-curve, SerreWeightAndLevelOptimisation:R20.3, ArithmeticGaloisRepresentations:R01.6, AlgebraicModularFormsAndSerreWeights:R15.4/weight-two-iff-finite-flat-at-p, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/finite-flat-weight-two-criterion

EllipticModularityEffectiveComparisons:EC.4/prime-isogeny-potential-good
TauCeti.EffectiveEllipticComparison.prime_isogeny_potential_good
  prerequisites: EllipticModularityEffectiveComparisons:EC.4/finite-eisenstein-quotient, EllipticModularityEffectiveComparisons:EC.4/eisenstein-cusp-formal-immersion, ModularCurvesPartII:R14.6, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv

EllipticModularityEffectiveComparisons:EC.4/isogeny-character-exponents
TauCeti.EffectiveEllipticComparison.isogeny_character_exponents
  prerequisites: EllipticModularityEffectiveComparisons:EC.4/prime-isogeny-potential-good, ArithmeticGaloisRepresentations:R01.2, ArithmeticGaloisRepresentations:R01.6, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-tame-inertia

EllipticModularityEffectiveComparisons:EC.4/isogeny-character-frobenius
TauCeti.EffectiveEllipticComparison.isogeny_character_frobenius
  prerequisites: EllipticModularityEffectiveComparisons:EC.4/isogeny-character-exponents, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1, ArithmeticGaloisRepresentations:R01.2, ArithmeticGaloisRepresentations:R01.6

EllipticModularityEffectiveComparisons:EC.4/small-frobenius-trace-list
TauCeti.EffectiveEllipticComparison.small_frobenius_trace_list
  prerequisites: tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1

EllipticModularityEffectiveComparisons:EC.4/isogeny-character-zero-case
TauCeti.EffectiveEllipticComparison.isogeny_character_zero_case
  prerequisites: EllipticModularityEffectiveComparisons:EC.4/isogeny-character-frobenius, EllipticModularityEffectiveComparisons:EC.4/small-frobenius-trace-list

EllipticModularityEffectiveComparisons:EC.4/isogeny-character-third-case
TauCeti.EffectiveEllipticComparison.isogeny_character_third_case
  prerequisites: EllipticModularityEffectiveComparisons:EC.4/isogeny-character-frobenius, EllipticModularityEffectiveComparisons:EC.4/small-frobenius-trace-list

EllipticModularityEffectiveComparisons:EC.4/isogeny-character-half-case
TauCeti.EffectiveEllipticComparison.isogeny_character_half_case
  prerequisites: EllipticModularityEffectiveComparisons:EC.4/isogeny-character-frobenius, tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1

EllipticModularityEffectiveComparisons:EC.4/mazur-prime-isogeny-classification
TauCeti.EffectiveEllipticComparison.mazur_prime_isogeny_classification
  prerequisites: EllipticModularityEffectiveComparisons:EC.4/prime-isogeny-potential-good, EllipticModularityEffectiveComparisons:EC.4/isogeny-character-exponents, EllipticModularityEffectiveComparisons:EC.4/isogeny-character-zero-case, EllipticModularityEffectiveComparisons:EC.4/isogeny-character-third-case, EllipticModularityEffectiveComparisons:EC.4/isogeny-character-half-case, tauceti:TauCetiRoadmap/ModularForms#layer-10-the-modular-curve-γℍ-and-the-dimension-formulas

EllipticModularityEffectiveComparisons:EC.4/minimal-composite-levels
TauCeti.EffectiveEllipticComparison.minimal_composite_levels
  prerequisites: EllipticModularityEffectiveComparisons:EC.4/mazur-prime-isogeny-classification, tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv, tauceti:TauCetiRoadmap/ModularForms#layer-10-the-modular-curve-γℍ-and-the-dimension-formulas

EllipticModularityEffectiveComparisons:EC.4/genus-one-isogeny-points
TauCeti.EffectiveEllipticComparison.genus_one_isogeny_points
  prerequisites: ModularCurvesPartII:R12.5, tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv

EllipticModularityEffectiveComparisons:EC.4/remaining-composite-cusps
TauCeti.EffectiveEllipticComparison.remaining_composite_cusps
  prerequisites: EllipticModularityEffectiveComparisons:EC.4/kenku-39-cusps, EllipticModularityEffectiveComparisons:EC.4/kenku-65-cusps, EllipticModularityEffectiveComparisons:EC.4/kenku-91-cusps, EllipticModularityEffectiveComparisons:EC.4/kenku-125-cusps, EllipticModularityEffectiveComparisons:EC.4/kenku-169-cusps

EllipticModularityEffectiveComparisons:EC.4/composite-extension-exclusion
TauCeti.EffectiveEllipticComparison.composite_extension_exclusion
  prerequisites: EllipticModularityEffectiveComparisons:EC.4/minimal-composite-levels, EllipticModularityEffectiveComparisons:EC.4/genus-one-isogeny-points, EllipticModularityEffectiveComparisons:EC.4/remaining-composite-cusps, tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv

EllipticModularityEffectiveComparisons:EC.4/mazur-kenku-cyclic-degrees
TauCeti.EffectiveEllipticComparison.mazur_kenku_cyclic_degrees
  prerequisites: EllipticModularityEffectiveComparisons:EC.4/mazur-prime-isogeny-classification, EllipticModularityEffectiveComparisons:EC.4/minimal-composite-levels, EllipticModularityEffectiveComparisons:EC.4/genus-one-isogeny-points, EllipticModularityEffectiveComparisons:EC.4/remaining-composite-cusps, EllipticModularityEffectiveComparisons:EC.4/composite-extension-exclusion

EllipticModularityEffectiveComparisons:EC.4/rational-two-times-prime
TauCeti.EffectiveEllipticComparison.rational_two_times_prime
  prerequisites: ArithmeticGaloisRepresentations:R01.6, tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv, tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68

EllipticModularityEffectiveComparisons:EC.4/full-two-cyclic-four
TauCeti.EffectiveEllipticComparison.full_two_cyclic_four
  prerequisites: tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv, tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68

EllipticModularityEffectiveComparisons:EC.4/full-two-times-prime
TauCeti.EffectiveEllipticComparison.full_two_times_prime
  prerequisites: EllipticModularityEffectiveComparisons:EC.4/full-two-cyclic-four, ArithmeticGaloisRepresentations:R01.6, tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv, ArithmeticGaloisRepresentations:R01.3

EllipticModularityEffectiveComparisons:EC.4/irreducible-one-two
TauCeti.EffectiveEllipticComparison.irreducible_one_two
  prerequisites: EllipticModularityEffectiveComparisons:EC.4/rational-two-times-prime, EllipticModularityEffectiveComparisons:EC.4/mazur-kenku-cyclic-degrees

EllipticModularityEffectiveComparisons:EC.4/irreducible-full-two
TauCeti.EffectiveEllipticComparison.irreducible_full_two
  prerequisites: EllipticModularityEffectiveComparisons:EC.4/full-two-times-prime, EllipticModularityEffectiveComparisons:EC.4/mazur-kenku-cyclic-degrees

EllipticModularityEffectiveComparisons:EC.5/large-prime-isogeny-cm
TauCeti.EffectiveEllipticComparison.large_prime_isogeny_cm
  prerequisites: EllipticModularityEffectiveComparisons:EC.4/mazur-prime-isogeny-classification, tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv, ComplexMultiplicationAndExplicitReciprocity:CM.3

EllipticModularityEffectiveComparisons:EC.5/exceptional-projective-exclusion
TauCeti.EffectiveEllipticComparison.exceptional_projective_exclusion
  prerequisites: EllipticModularityEffectiveComparisons:EC.5/projective-inertia-order, ArithmeticGaloisRepresentations:R01.4

EllipticModularityEffectiveComparisons:EC.5/split-cartan-exclusion
TauCeti.EffectiveEllipticComparison.split_cartan_exclusion
  prerequisites: EllipticModularityEffectiveComparisons:EC.5/split-cartan-large-primes, EllipticModularityEffectiveComparisons:EC.5/split-cartan-finite-sieve, ModularCurvesPartII:R12.3

EllipticModularityEffectiveComparisons:EC.5/proper-image-nonsplit
TauCeti.EffectiveEllipticComparison.proper_image_nonsplit
  prerequisites: EllipticModularityEffectiveComparisons:EC.5/large-prime-isogeny-cm, ArithmeticGaloisRepresentations:R01.6, tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv, EllipticModularityEffectiveComparisons:EC.5/exceptional-projective-exclusion, EllipticModularityEffectiveComparisons:EC.5/split-cartan-exclusion, ArithmeticGaloisRepresentations:R01.4

EllipticModularityEffectiveComparisons:EC.5/nonsplit-potential-multiplicative
TauCeti.EffectiveEllipticComparison.nonsplit_potential_multiplicative
  prerequisites: ArithmeticGaloisRepresentations:R01.4, ArithmeticGaloisRepresentations:R01.2, ArithmeticGaloisRepresentations:R01.6, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/multiplicative-torsion-inertia

EllipticModularityEffectiveComparisons:EC.5/cartan-correspondence-kills-old
TauCeti.EffectiveEllipticComparison.cartan_correspondence_kills_old
  prerequisites: ModularCurvesPartII:R14.2/jacobian-and-functoriality, ModularCurvesPartII:R14.5, ArithmeticGaloisRepresentations:R01.4, tauceti:TauCetiRoadmap/ModularForms#layer-10-the-modular-curve-γℍ-and-the-dimension-formulas

EllipticModularityEffectiveComparisons:EC.5/winding-period-component
TauCeti.EffectiveEllipticComparison.winding_period_component
  prerequisites: ModularSymbolsPadicLFunctions:L0, ModularSymbolsPadicLFunctions:L1, ModularCurvesPartII:R14.2/integral-hecke-algebra, ModularCurvesPartII:R14.3/weight-two-shimura-isomorphism, ModularCurvesPartII:R14.3/betti-free-rank-two

EllipticModularityEffectiveComparisons:EC.5/winding-class-nonzero
TauCeti.EffectiveEllipticComparison.winding_class_nonzero
  prerequisites: ModularSymbolsPadicLFunctions:L0, ModularCurvesPartII:R14.2/jacobian-and-functoriality, ModularCurvesPartII:R12.3, EllipticModularityEffectiveComparisons:EC.5/cartan-correspondence-kills-old

EllipticModularityEffectiveComparisons:EC.5/finite-winding-quotient
TauCeti.EffectiveEllipticComparison.finite_winding_quotient
  prerequisites: EllipticModularityEffectiveComparisons:EC.5/winding-class-nonzero, EllipticModularityEffectiveComparisons:EC.5/winding-period-component, ModularCurvesPartII:R14.5, ModularCurvesPartII:R14.2/integral-hecke-algebra, RankZeroOneBSD:BSD.4

EllipticModularityEffectiveComparisons:EC.5/cartan-cusp-residue
TauCeti.EffectiveEllipticComparison.cartan_cusp_residue
  prerequisites: ModularCurvesPartII:R12.3, ModularCurvesPartII:R13.3, ModularCurvesPartII:R13.5, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv

EllipticModularityEffectiveComparisons:EC.5/cartan-cusp-formal-immersion
TauCeti.EffectiveEllipticComparison.cartan_cusp_formal_immersion
  prerequisites: EllipticModularityEffectiveComparisons:EC.5/finite-winding-quotient, ModularCurvesPartII:R13.3, ModularCurvesPartII:R14.6, AlgebraicModularFormsAndSerreWeights:R15.2, tauceti:TauCetiRoadmap/ModularForms#layer-10-the-modular-curve-γℍ-and-the-dimension-formulas

EllipticModularityEffectiveComparisons:EC.5/cartan-point-torsion
TauCeti.EffectiveEllipticComparison.cartan_point_torsion
  prerequisites: EllipticModularityEffectiveComparisons:EC.5/finite-winding-quotient, ModularCurvesPartII:R14.2/jacobian-and-functoriality, ModularCurvesPartII:R12.3

EllipticModularityEffectiveComparisons:EC.5/cartan-denominator-exclusion
TauCeti.EffectiveEllipticComparison.cartan_denominator_exclusion
  prerequisites: EllipticModularityEffectiveComparisons:EC.5/cartan-cusp-residue, EllipticModularityEffectiveComparisons:EC.5/cartan-cusp-formal-immersion, EllipticModularityEffectiveComparisons:EC.5/cartan-point-torsion, ModularCurvesPartII:R14.6, NeronModelsAndSemistableAbelianVarieties:R11.5, EllipticModularityEffectiveComparisons:EC.5/nonsplit-potential-multiplicative

EllipticModularityEffectiveComparisons:EC.5/integral-j-forcing
TauCeti.EffectiveEllipticComparison.integral_j_forcing
  prerequisites: EllipticModularityEffectiveComparisons:EC.5/proper-image-nonsplit, EllipticModularityEffectiveComparisons:EC.5/cartan-denominator-exclusion, EllipticModularityEffectiveComparisons:EC.5/nonsplit-potential-multiplicative, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv

EllipticModularityEffectiveComparisons:EC.5/genus-zero-j-map
TauCeti.EffectiveEllipticComparison.genus_zero_j_map
  prerequisites: EllipticModularityEffectiveComparisons:EC.5/genus-zero-j-numerators, ModularCurvesPartII:R12.5, ModularCurvesPartII:R12.3, ComputationalNumberTheory:CN.3/modular-data-equality

EllipticModularityEffectiveComparisons:EC.5/integral-parameter-divisibility
TauCeti.EffectiveEllipticComparison.integral_parameter_divisibility
  prerequisites: EllipticModularityEffectiveComparisons:EC.5/genus-zero-j-numerators

EllipticModularityEffectiveComparisons:EC.5/quadratic-twist-surjectivity
TauCeti.EffectiveEllipticComparison.quadratic_twist_surjectivity
  prerequisites: ArithmeticGaloisRepresentations:R01.4, ArithmeticGaloisRepresentations:R01.6, tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5

EllipticModularityEffectiveComparisons:EC.5/large-isogeny-j-table
TauCeti.EffectiveEllipticComparison.large_isogeny_j_table
  prerequisites: EllipticModularityEffectiveComparisons:EC.4/mazur-prime-isogeny-classification, ModularCurvesPartII:R12.5, ComplexMultiplicationAndExplicitReciprocity:CM.3

EllipticModularityEffectiveComparisons:EC.5/large-isogeny-image-certificates
TauCeti.EffectiveEllipticComparison.large_isogeny_image_certificates
  prerequisites: EllipticModularityEffectiveComparisons:EC.5/large-isogeny-j-table, EllipticModularityEffectiveComparisons:EC.5/quadratic-twist-surjectivity, ArithmeticGaloisRepresentations:R01.4, ArithmeticGaloisRepresentations:R01.6

EllipticModularityEffectiveComparisons:EC.5/small-isogeny-image-certificates
TauCeti.EffectiveEllipticComparison.small_isogeny_image_certificates
  prerequisites: EllipticModularityEffectiveComparisons:EC.5/finite-integral-j, EllipticModularityEffectiveComparisons:EC.5/quadratic-twist-surjectivity, ArithmeticGaloisRepresentations:R01.4, ArithmeticGaloisRepresentations:R01.6, ComplexMultiplicationAndExplicitReciprocity:CM.5

EllipticModularityEffectiveComparisons:EC.5/lemos-surjectivity
TauCeti.EffectiveEllipticComparison.lemos_surjectivity
  prerequisites: EllipticModularityEffectiveComparisons:EC.5/large-prime-isogeny-cm, EllipticModularityEffectiveComparisons:EC.5/integral-j-forcing, EllipticModularityEffectiveComparisons:EC.5/finite-integral-j, EllipticModularityEffectiveComparisons:EC.5/large-isogeny-image-certificates, EllipticModularityEffectiveComparisons:EC.5/small-isogeny-image-certificates

EllipticModularityEffectiveComparisons:EC.3/four-count-square-classes
TauCeti.EffectiveEllipticComparison.four_count_square_classes
  prerequisites: EllipticModularityEffectiveComparisons:EC.3/four-count-rational-two, tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv, tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68, ArithmeticGaloisRepresentations:R01.5

EllipticModularityEffectiveComparisons:EC.4/kenku-39-cusps
TauCeti.EffectiveEllipticComparison.kenku_39_cusps
  prerequisites: ModularCurvesPartII:R12.5, ModularCurvesPartII:R14.2/jacobian-and-functoriality

EllipticModularityEffectiveComparisons:EC.4/kenku-65-cusps
TauCeti.EffectiveEllipticComparison.kenku_65_cusps
  prerequisites: ModularCurvesPartII:R12.5, ModularCurvesPartII:R14.2/jacobian-and-functoriality

EllipticModularityEffectiveComparisons:EC.4/kenku-91-cusps
TauCeti.EffectiveEllipticComparison.kenku_91_cusps
  prerequisites: ModularCurvesPartII:R12.5, ModularCurvesPartII:R14.2/jacobian-and-functoriality

EllipticModularityEffectiveComparisons:EC.4/kenku-125-cusps
TauCeti.EffectiveEllipticComparison.kenku_125_cusps
  prerequisites: ModularCurvesPartII:R12.5, ModularCurvesPartII:R14.2/jacobian-and-functoriality

EllipticModularityEffectiveComparisons:EC.4/kenku-169-cusps
TauCeti.EffectiveEllipticComparison.kenku_169_cusps
  prerequisites: ModularCurvesPartII:R12.5, ModularCurvesPartII:R14.2/jacobian-and-functoriality

EllipticModularityEffectiveComparisons:EC.4/finite-eisenstein-quotient
TauCeti.EffectiveEllipticComparison.finite_eisenstein_quotient
  prerequisites: ModularCurvesPartII:R14.2/jacobian-and-functoriality, ModularCurvesPartII:R14.2/integral-hecke-algebra, ModularCurvesPartII:R14.6

EllipticModularityEffectiveComparisons:EC.4/eisenstein-cusp-formal-immersion
TauCeti.EffectiveEllipticComparison.eisenstein_cusp_formal_immersion
  prerequisites: EllipticModularityEffectiveComparisons:EC.4/finite-eisenstein-quotient, ModularCurvesPartII:R13.3, ModularCurvesPartII:R14.6, AlgebraicModularFormsAndSerreWeights:R15.2

EllipticModularityEffectiveComparisons:EC.5/projective-inertia-order
TauCeti.EffectiveEllipticComparison.projective_inertia_order
  prerequisites: tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv, ArithmeticGaloisRepresentations:R01.2, ArithmeticGaloisRepresentations:R01.6

EllipticModularityEffectiveComparisons:EC.5/split-cartan-large-primes
TauCeti.EffectiveEllipticComparison.split_cartan_large_primes
  prerequisites: ModularCurvesPartII:R12.5, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv, ArakelovGeometryAndAbelianHeights:R35.4, ArakelovGeometryAndAbelianHeights:R35.5, FaltingsFinitenessAndIsogenyTheorems:R28.4

EllipticModularityEffectiveComparisons:EC.5/heegner-gross-split-criterion
TauCeti.EffectiveEllipticComparison.heegner_gross_split_criterion
  prerequisites: ModularCurvesPartII:R12.5, ModularCurvesPartII:R14.6, ModularCurvesPartII:R14.2/jacobian-and-functoriality, ComplexMultiplicationAndExplicitReciprocity:CM.3

EllipticModularityEffectiveComparisons:EC.5/split-cartan-finite-sieve
TauCeti.EffectiveEllipticComparison.split_cartan_finite_sieve
  prerequisites: EllipticModularityEffectiveComparisons:EC.5/heegner-gross-split-criterion, ComplexMultiplicationAndExplicitReciprocity:CM.5, ComputationalNumberTheory:CN.3/modular-data-equality

-/
