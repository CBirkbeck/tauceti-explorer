import Mathlib
import TauCeti.RingTheory.DedekindDomain.SInteger.Basic

/-!
# ArithmeticKTheory: representative target signatures

README.md is the definitive roadmap. This file records light definitions and
representative theorem signatures statable against the pinned Mathlib and Tau Ceti
APIs; it is not exhaustive. Proofs marked `sorry` are mathematical targets.
The denominator monoid uses the existing S-integer subalgebra. Rank functions
are numerical conventions with separate arithmetic ranges; divisibility means
membership in every positive multiplication image; the Bott sign is dualization;
and the positive Bernoulli sequence is reindexed from Mathlib’s arithmetic one.
-/

noncomputable section

open IsDedekindDomain
open scoped Pointwise

namespace TauCetiRoadmap.ArithmeticKTheory

/-! ## Layer 1: S-integers and arithmetic functoriality -/

section SIntegers

variable {R : Type*} [CommRing R] [IsDedekindDomain R]
  (S : Set (HeightOneSpectrum R)) (F : Type*) [Field F]
  [Algebra R F] [IsFractionRing R F]

/-- The candidate denominators are the preimage of the units of the existing ring. -/
def sUnitSubmonoid : Submonoid R :=
  (IsUnit.submonoid (S.integer F)).comap (algebraMap R (S.integer F))

/-- The denominator criterion for arbitrary sets of primes; README §1.1. -/
theorem integer_isLocalization_iff (M : Submonoid R) :
    IsLocalization M (S.integer F) ↔
      M ≤ sUnitSubmonoid S F ∧ ∀ v ∈ S, ∃ m ∈ M, m ∈ v.asIdeal := by
  sorry

example : (1 : R) ∈ sUnitSubmonoid S F ∧
    (0 : R) ∉ sUnitSubmonoid S F := by
  change IsUnit (algebraMap R (S.integer F) 1) ∧
    ¬ IsUnit (algebraMap R (S.integer F) 0)
  simp

/-- Torsion of the class group suffices even when the set of inverted primes is infinite. -/
theorem integer_isLocalization_of_torsion_classGroup
    (htors : ∀ c : ClassGroup R, IsOfFinOrder c) :
    IsLocalization (sUnitSubmonoid S F) (S.integer F) := by
  sorry

end SIntegers

/-! ## Layer 3: finite generation and ranks -/

/-- Numerical rank convention for positive degrees >= 2; degree one is separate. -/
def borelRank (r₁ r₂ n : ℕ) : ℕ :=
  if n % 4 = 1 then r₁ + r₂ else if n % 4 = 3 then r₂ else 0

example : borelRank 1 0 3 = 0 ∧ borelRank 1 0 5 = 1 := by decide

example : borelRank 0 1 3 = 1 ∧ borelRank 0 1 5 = 1 := by decide

theorem borelRank_even (r₁ r₂ k : ℕ) : borelRank r₁ r₂ (2 * k) = 0 := by
  sorry

/-! ## Layer 6: even groups, divisibility and Bott degrees -/

section DivisibleElements

variable (A : Type*) [AddCommGroup A]

/-- The elements divisible by every positive integer. -/
def divisibleSubgroup : AddSubgroup A :=
  ⨅ (m : ℕ) (_ : 1 ≤ m), m • (⊤ : AddSubgroup A)

theorem mem_divisibleSubgroup_iff {x : A} :
    x ∈ divisibleSubgroup A ↔ ∀ m : ℕ, 1 ≤ m → ∃ y, m • y = x := by
  sorry

theorem divisibleSubgroup_eq_bot_of_finite [Finite A] :
    divisibleSubgroup A = ⊥ := by
  sorry

/-- A finite subgroup containing all infinite-height elements has an eventual
intersection bound; its exponent need not be such a bound. -/
theorem inter_mul_eventually_eq_divisibleSubgroup (T : AddSubgroup A)
    [Finite T] (hT : divisibleSubgroup A ≤ T) :
    ∃ m₀ : ℕ, 1 ≤ m₀ ∧ ∀ m : ℕ, 1 ≤ m → m₀ ∣ m →
      T ⊓ m • (⊤ : AddSubgroup A) = divisibleSubgroup A := by
  sorry

example : divisibleSubgroup ℚ = ⊤ := by
  ext x
  simp only [divisibleSubgroup, AddSubgroup.mem_iInf, AddSubgroup.mem_top, iff_true]
  intro m hm
  rw [AddSubgroup.mem_smul_pointwise_iff_exists]
  refine ⟨x / m, trivial, ?_⟩
  rw [nsmul_eq_mul, mul_div_cancel₀]
  exact_mod_cast (show m ≠ 0 by omega)

example : divisibleSubgroup (ZMod 4) = ⊥ ∧
    (2 : ℕ) • (⊤ : AddSubgroup (ZMod 4)) ≠ ⊥ ∧
    ∀ x : ZMod 4, (2 : ℕ) • ((2 : ℕ) • x) = 0 := by
  constructor
  · apply le_antisymm _ bot_le
    intro x hx
    simp only [divisibleSubgroup, AddSubgroup.mem_iInf] at hx
    rcases (AddSubgroup.mem_smul_pointwise_iff_exists x 4 ⊤).mp (hx 4 (by decide)) with
      ⟨y, _, hy⟩
    have hy0 : (4 : ℕ) • y = (0 : ZMod 4) := by
      rw [nsmul_eq_mul, ZMod.natCast_self, zero_mul]
    exact hy.symm.trans hy0
  · refine ⟨?_, by decide⟩
    intro h
    have htwo : (2 : ZMod 4) ∈ (2 : ℕ) • (⊤ : AddSubgroup (ZMod 4)) := by
      rw [AddSubgroup.mem_smul_pointwise_iff_exists]
      exact ⟨1, trivial, by decide⟩
    rw [h] at htwo
    exact (by decide : (2 : ZMod 4) ≠ 0) htwo

/-- The integers have no nonzero element divisible by every positive integer. -/
theorem divisibleSubgroup_int : divisibleSubgroup ℤ = ⊥ := by
  sorry

end DivisibleElements

/-- Slot (cohomological degree, twist) for the positive/negative piece of degree 2j.
`positive = true` means the +1 eigenspace of dualization, not complex conjugation. -/
def bottCohomologySlot (j : ℤ) (positive : Bool) : ℕ × ℤ :=
  if positive = decide (Even j) then (0, j) else (2, j + 1)

theorem bottCohomologySlot_totalDegree (j : ℤ) (positive : Bool) :
    2 * (bottCohomologySlot j positive).2 -
      ((bottCohomologySlot j positive).1 : ℤ) = 2 * j := by
  sorry

example : bottCohomologySlot 0 true = (0, 0) ∧
    bottCohomologySlot 0 false = (2, 1) := by decide

example : bottCohomologySlot (-1) true = (2, 0) ∧
    bottCohomologySlot (-1) false = (0, -1) := by decide

/-- The positive even-degree two-rank table, totalized by zero at odd degrees.
Arithmetic use requires dyadic S, a real place and n > 0; README §6.4. -/
def evenTwoRank (r s t j n : ℕ) : ℕ :=
  if n % 8 = 2 then r + s + t - 1
  else if n % 8 = 4 ∨ n % 8 = 6 then j + s + t - 1
  else if n % 8 = 0 then s + t - 1 else 0

/-- Increasing s adds one at every even input of the numerical rank table. -/
theorem evenTwoRank_add_prime (r s t j n : ℕ) (hs : 1 ≤ s) (hn : Even n) :
    evenTwoRank r (s + 1) t j n = evenTwoRank r s t j n + 1 := by
  sorry

example : evenTwoRank 1 1 0 0 2 = 1 ∧ evenTwoRank 1 1 0 0 4 = 0 := by
  decide

example : evenTwoRank 2 1 0 1 2 = 2 ∧ evenTwoRank 2 1 0 1 4 = 1 ∧
    evenTwoRank 0 1 0 0 0 = 0 ∧ evenTwoRank 0 0 0 0 0 = 0 := by
  decide

/-! ## Layer 7: Bernoulli numbers and regular primes -/

/-- Translation of Weibel's positive, reindexed Bernoulli convention for k>=1. -/
def bernoulliTop (k : ℕ) : ℚ := (-1) ^ (k + 1) * bernoulli (2 * k)

example : bernoulliTop 1 = 1 / 6 ∧ bernoulliTop 0 = -1 := by
  norm_num [bernoulliTop, bernoulli_two]

example : bernoulliTop 2 = 1 / 30 := by
  norm_num [bernoulliTop, bernoulli, bernoulli'_four]

/-- Used with an explicit prime hypothesis; this never includes Vandiver's condition. -/
def IsRegularPrime (p : ℕ) : Prop :=
  ¬ p ∣ NumberField.classNumber (CyclotomicField p ℚ)

example : IsRegularPrime 0 ∧ ¬ IsRegularPrime 1 := by
  simp [IsRegularPrime, NumberField.classNumber_ne_zero]

/-- Kummer’s finite Bernoulli-numerator criterion for an odd prime; README §7.2. -/
theorem kummer_criterion (p : ℕ) (hp : p.Prime) (hodd : Odd p) :
    ¬ IsRegularPrime p ↔
      ∃ k ∈ Finset.Icc 1 ((p - 3) / 2), (p : ℤ) ∣ (bernoulli (2 * k)).num := by
  sorry

/-- Three is regular: the Bernoulli range in Kummer’s criterion is empty. -/
theorem isRegularPrime_three : IsRegularPrime 3 := by
  sorry

/-- Every prime below 37 is regular, including the separate class-number case p = 2. -/
theorem isRegularPrime_of_lt_37 (p : ℕ) (hp : p.Prime) (hbound : p < 37) :
    IsRegularPrime p := by
  sorry

/-- Kummer’s criterion detects the numerator of B₃₂ at the first irregular prime. -/
theorem not_isRegularPrime_37 : ¬ IsRegularPrime 37 := by
  sorry

/-
The README additionally specifies QCat.rankFiltration, LayerPoset, their relative
homology and spectral sequence; WInvariant, its finite orders and IsExceptional;
eInvariant and the integral odd tables; signatureDefect, positiveEvenK,
localSymbolFamily, rawWildKernel, symbolWildKernel, cohomologicalWildKernel and
IsSpecial and IsVerySpecial; OrderCertificate, ArithmeticData and CertifiedExample;
ramifiedResiduePullback and rationalSIntegerEquiv; bottAdamsPiece,
bottEvenExact, bottEvenEdgeEquiv and bottOddEdgeEquiv; tateNormFiltration,
tateFiltration, tateAlpha and tateUnitSubgroup;
GoldenCongruenceLattice, GoldenResidueSection and GoldenFinitePrimeCertificate.
Its cohomological descent maps are cyclotomicH2Descent,
cyclotomicPicardDescentSequence, cyclotomicPositiveH2Descent and
cyclotomicPositivePicardDescentSequence.
It also specifies cyclotomicWreathMap, harrisSegalMap,
compatibleClassCyclotomicPrime, cyclotomicPicardInjection and regularBottShift.
The additional arithmetic certificate and conditional completion targets are
caputoSexticArithmeticCertificate and
rawWildKernel_eq_symbol_of_localRestriction_eq_zero.
The README also specifies L- and
Grothendieck–Witt finiteness, the cyclotomic Picard injection and the integral
regular-prime consequences. Their higher K, cohomology, spectral and
certificate carriers are supplied by the roadmaps named there.
-/

end TauCetiRoadmap.ArithmeticKTheory
