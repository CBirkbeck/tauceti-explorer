/-
This file is not the roadmap and is not exhaustive. The mathematical reader is definitive.
These signatures suggest names and native Lean forms for contributors and reviewers.
Every proof is admitted. This file was not compiled at the pinned libraries.
-/
import Mathlib.Data.Nat.Factorization.Defs
import Mathlib.Data.Nat.Totient
import Mathlib.Data.Matrix.Notation
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.RingTheory.Norm.Transitivity
import Mathlib.LinearAlgebra.FreeModule.Finite.Matrix
import Mathlib.NumberTheory.NumberField.Norm
import Mathlib.RingTheory.Ideal.Norm.AbsNorm
import Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
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

end TauCeti.EffectiveEllipticComparison
