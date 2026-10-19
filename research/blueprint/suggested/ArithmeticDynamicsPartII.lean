import Mathlib.Algebra.Field.ZMod
import Mathlib.Data.Nat.Totient
import Mathlib.NumberTheory.Divisors
import Mathlib.Algebra.BigOperators.Field
import Mathlib.Data.Fin.VecNotation

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers can converge on names
and signatures. The README carries every target, hypothesis, API obligation and check.

Only light formulas over existing carriers and raw-coordinate milestones appear here.
CA.4 owns the Markoff carriers and moves; they are not redefined as new data here.
New group images, conic parametrizations, level structures, finite-group socles and
certificate trees remain README targets. Every `sorry` below marks an unimplemented goal.
The effective endpoint remains subject to the reader's explicit G3/G4 proof gaps.
-/

open scoped BigOperators

namespace TauCeti.ArithmeticDynamicsPartII

/-- Raw weight formula; its identities require a nonzero coefficient-three solution.
README MD.1/penner-weights. This raw formula does not define another Markoff carrier. -/
noncomputable def pennerWeight {K : Type*} [Field K] (x : Fin 3 → K) (i : Fin 3) : K := by
  classical
  exact if x i = 0 then 0
  else if x 0 * x 1 * x 2 = 0 then 1 / 2
  else (x i) ^ 2 / (3 * x 0 * x 1 * x 2)

/-- MD.1/weight-identities, including the singular-denominator extension. -/
theorem weight_sum {K : Type*} [Field K] (h2 : (2 : K) ≠ 0) (h3 : (3 : K) ≠ 0)
    (x : Fin 3 → K) (hx : x ≠ 0)
    (hm : (x 0)^2 + (x 1)^2 + (x 2)^2 = 3 * x 0 * x 1 * x 2) :
    ∑ i, pennerWeight x i = 1 := by
  sorry

/-- MD.1/involution-balance. Fixed points and the empty type are permitted. -/
theorem involution_balance {C K : Type*} [Fintype C] [Field K]
    (h2 : (2 : K) ≠ 0) (r : C → C) (hr : Function.Involutive r)
    (f : C → K) (hf : ∀ x, f x + f (r x) = 1) :
    ∑ x, f x = (Fintype.card C : K) / 2 := by
  sorry

/-- MD.1/component-divisibility's field-valued final step; no graph carrier needed. -/
theorem divisibility_of_three_balances (p n : ℕ) [Fact p.Prime]
    (h : (n : ZMod p) = (3 : ZMod p) * ((n : ZMod p) / 2)) : p ∣ n := by
  sorry

local instance : Fact (Nat.Prime 5) := ⟨by decide⟩

-- MD.1 distinguishing checks: ordinary root and a zero-coordinate point.
example : pennerWeight (![1, 1, 1] : Fin 3 → ℚ) 0 = 1 / 3 := by
  sorry

example : pennerWeight (![0, 1, 2] : Fin 3 → ZMod 5) 0 = 0 ∧
    pennerWeight (![0, 1, 2] : Fin 3 → ZMod 5) 1 = 3 ∧
    pennerWeight (![0, 1, 2] : Fin 3 → ZMod 5) 2 = 3 := by
  sorry

example : (∑ i : Fin 3, pennerWeight (0 : Fin 3 → ℚ) i) = 0 := by
  sorry

/-- MD.2/rotation-orbit-count's light divisor-sum formula. -/
def divisorPhi (n : ℕ) : ℚ :=
  ∑ d ∈ n.divisors, (Nat.totient d : ℚ) / d

example : divisorPhi 1 = 1 ∧ divisorPhi 2 = 3 / 2 := by
  sorry

example : divisorPhi 4 = 2 ∧ divisorPhi 6 = 5 / 2 := by
  sorry

/-- MD.5/maximal-divisors on a natural cutoff. The README permits real cutoffs too. -/
def maximalDivisors (n x : ℕ) : Finset ℕ :=
  n.divisors.filter fun d => d ≤ x ∧ ∀ e ∈ n.divisors, d ∣ e → e ≤ x → e = d

-- The two incomparable maximal divisors distinguish this from “largest divisor”.
example : maximalDivisors 12 6 = {4, 6} := by
  sorry

example : maximalDivisors 12 0 = ∅ ∧ maximalDivisors 12 12 = {12} := by
  sorry

example : maximalDivisors 1 1 = {1} := by
  sorry

/-- MD.5/effective-bound's exact candidate, not a certificate of connectivity. -/
def primorial (n : ℕ) : ℕ :=
  ∏ q ∈ Finset.range (n + 1), if q.Prime then q else 1

def sourceCutoff : ℕ :=
  primorial 863 * primorial 53 * primorial 13 * primorial 7 * primorial 5 * 3^3 * 2^5

example : primorial 5 = 30 := by
  sorry

/-- Exact arithmetic is separate from acceptance of the algorithm's output. -/
theorem sourceCutoff_lt_decimal : sourceCutoff + 1 < 3489 * 10^389 := by
  sorry

/-- MD.0/finite-regressions: the coefficient-three characteristic-three exception. -/
theorem mod_three_card :
    Nat.card {x : Fin 3 → ZMod 3 //
      (x 0)^2 + (x 1)^2 + (x 2)^2 = 3 * x 0 * x 1 * x 2 ∧ x ≠ 0} = 8 := by
  sorry

/-- MD.4/eventual-connectivity expressed as positive integral lifting over existing types.
The root-orbit bridge in the README supplies the graph equivalence. -/
theorem eventual_positive_lifting :
    ∃ P : ℕ, ∀ p : ℕ, p.Prime → P < p →
      ∀ x : Fin 3 → ZMod p,
        (x 0)^2 + (x 1)^2 + (x 2)^2 = 3 * x 0 * x 1 * x 2 → x ≠ 0 →
        ∃ y : Fin 3 → ℤ, (∀ i, 0 < y i) ∧
          (y 0)^2 + (y 1)^2 + (y 2)^2 = 3 * y 0 * y 1 * y 2 ∧
          ∀ i, (y i : ZMod p) = x i := by
  sorry

/-- MD.5/effective-bound, an open blueprint target with gaps G3/G4.
This sorry does not discharge the local-constant problem or the certificate check. -/
theorem effective_positive_lifting (p : ℕ) (hp : p.Prime) (hlarge : 3489 * 10^389 < p)
    (x : Fin 3 → ZMod p)
    (hm : (x 0)^2 + (x 1)^2 + (x 2)^2 = 3 * x 0 * x 1 * x 2) (hx : x ≠ 0) :
    ∃ y : Fin 3 → ℤ, (∀ i, 0 < y i) ∧
      (y 0)^2 + (y 1)^2 + (y 2)^2 = 3 * y 0 * y 1 * y 2 ∧
      ∀ i, (y i : ZMod p) = x i := by
  sorry

/-- MD.7/integral-image, with the primitive CRT condition stated directly.
The reader proves the necessity by positive descent, not by a false composite CRT lift. -/
theorem mixed_zero_no_lift :
    ¬ ∃ y : Fin 3 → ℤ,
      (y 0)^2 + (y 1)^2 + (y 2)^2 = 3 * y 0 * y 1 * y 2 ∧
      ∀ i, (y i : ZMod 65) = 40 := by
  sorry

-- Both mixed points satisfy their equations modulo 65.
example : (40 : ZMod 65)^2 + 40^2 + 40^2 = 3 * 40 * 40 * 40 := by
  sorry

example : (55 : ZMod 65)^2 + 55^2 + 55^2 = 55 * 55 * 55 := by
  sorry

end TauCeti.ArithmeticDynamicsPartII
