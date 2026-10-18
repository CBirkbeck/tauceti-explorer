import Mathlib.NumberTheory.Cyclotomic.Gal
import Mathlib.NumberTheory.NumberField.CMField
import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.RingTheory.RootsOfUnity.Complex
import Mathlib.FieldTheory.IntermediateField.Adjoin.Basic

/-!
# Arithmetic Iwasawa theory: statements available at the library pins

The reader document IntegralIwasawaTheory--I.8.md contains all targets of I.8, I.9 and L0–L4.
This compact prototype states a few endpoints on existing carriers. The reviewed packet
records the precise supplier contracts and corrections to be carried into the reader. It does not develop the
missing arithmetic theory. In particular, the Burns–Flach complex, completed Selmer modules,
integral determinant lattices, logarithm map and class-module invariants remain README targets;
none is replaced here by an assumed structure or a proposition storing its expected theorem.

The root and smoothing conventions are those of L0. The Vandiver predicate is L3's shared
predicate on the existing maximal real cyclotomic field. Baker–Brumer is imported from
LinearFormsInLogarithms §8.10 through deep powering; its proof is not developed here.
Proof placeholders below assert only
proposed theorems; every data definition has its actual body.
-/

noncomputable section

namespace TauCeti.IntegralIwasawa

/-- L0: compatible complex roots; the arithmetic API uses positive root orders. -/
def zeta (m : ℕ) : ℂ := Complex.exp (2 * Real.pi * Complex.I / m)

/-- The embedded cyclotomic field, using Mathlib's existing adjoining-field carrier. -/
abbrev Qmu (m : ℕ) : IntermediateField ℚ ℂ := IntermediateField.adjoin ℚ {zeta m}

/-- The real generator field. Identifying it with the existing maximal real field is a target. -/
abbrev QmuPlus (m : ℕ) : IntermediateField ℚ ℂ :=
  IntermediateField.adjoin ℚ {zeta m + (zeta m)⁻¹}

/-- L0 root compatibility endpoint (RJW §10.2, pp. 47–48). -/
theorem zeta_mul_pow (m n : ℕ) (hm : 0 < m) (hn : 0 < n) :
    zeta (m * n) ^ n = zeta m := sorry

/-- The tower inclusion has a positive target order; divisibility into zero is excluded. -/
theorem Qmu_mono {m n : ℕ} (h : m ∣ n) (hn : 0 < n) : Qmu m ≤ Qmu n := sorry

/-- L0 degree endpoint on an existing carrier; no unproved data instance is introduced. -/
theorem finrank_Qmu {m : ℕ} (hm : 0 < m) :
    Module.finrank ℚ (Qmu m) = Nat.totient m := sorry

/-- L0 real-field comparison (Sharifi Example 1.4.11, p. 26; current Tau Ceti fixed-field API). -/
theorem mem_QmuPlus_iff {m : ℕ} (hm : 0 < m) (x : Qmu m) :
    (x : ℂ) ∈ QmuPlus m ↔ starRingEnd ℂ (x : ℂ) = (x : ℂ) := sorry

/-- The quadratic degree comparison is used only for root orders greater than two. -/
theorem finrank_QmuPlus {m : ℕ} (hm : 2 < m) :
    2 * Module.finrank ℚ (QmuPlus m) = Module.finrank ℚ (Qmu m) := sorry

/-- L0 smoothed root difference, with its polynomial value at every input. -/
def cValue (m a : ℕ) : ℂ := ∑ i ∈ Finset.range a, zeta m ^ i

/-- L0 real smoothing factor: integer exponents prevent truncated natural subtraction. -/
def gammaValue (m h a : ℕ) : ℂ :=
  zeta m ^ ((h : ℤ) * (1 - (a : ℤ))) * cValue m a

/-- L0 unit endpoint: integrality of both directions expresses a unit in the integral closure,
not merely a nonzero element of the ambient field (RJW Lemma 12.18, journal p. 186, corrected). -/
theorem cValue_integral_unit {m a : ℕ} (hm : 1 < m) (ha : a.Coprime m) :
    IsIntegral ℤ (cValue m a) ∧ IsIntegral ℤ ((cValue m a)⁻¹) ∧ cValue m a ≠ 0 := sorry

/-- L0 real smoothing endpoint; h is an inverse to two modulo the root order. -/
theorem gammaValue_real {m h a : ℕ} (hm : 2 < m) (hh : 2 * h ≡ 1 [MOD m]) :
    starRingEnd ℂ (gammaValue m h a) = gammaValue m h a := sorry

/-- L3: Vandiver's condition, used in this roadmap only for odd primes.
The class-group and maximal-real-field carriers already exist at the pins. -/
def Vandiver (p : ℕ) : Prop :=
  ¬ p ∣ NumberField.classNumber (NumberField.maximalRealSubfield (CyclotomicField p ℚ))

/-- L3's degree-one example (RJW Corollary 13.16, journal p. 194). -/
theorem vandiver_three : Vandiver 3 := sorry

-- Discriminating examples for the light definitions; the reader carries the full API/tests.
example : Qmu 1 = ⊥ := sorry

-- Different conductor integers can define the same field.
example : Qmu 3 = Qmu 6 := sorry

-- This fails if the positivity condition is removed from Qmu_mono.
example : ¬ Qmu 3 ≤ Qmu 0 := sorry

example : QmuPlus 4 = ⊥ := sorry

example : cValue 3 2 = -(zeta 3 ^ 2) := sorry

example : starRingEnd ℂ (cValue 5 2) ≠ cValue 5 2 := sorry

example : gammaValue 5 3 2 = -((1 + Real.sqrt 5 : ℝ) / 2 : ℂ) := sorry

example : Vandiver 5 := sorry

example : Vandiver 7 := sorry

-- Sharifi Lemma 4.3.4, p. 110: a prime-power cyclotomic value is p, not p^k.
example : Polynomial.eval (1 : ℚ) (Polynomial.cyclotomic 9 ℚ) = 3 := sorry

end TauCeti.IntegralIwasawa
