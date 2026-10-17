import Mathlib

/-!
# Explicit K₃ and Bloch groups: representative target signatures

The roadmap is `research/blueprint/readmes/K3BlochGroups.md`, with complete
contracts in its blueprint packet. This file is not exhaustive. The admissible
pair and its five-term word are light definitions on existing field and finitely
supported-function carriers. Forming and comparing the Bloch/K₃ objects requires
the genuine supplier constructions stated in the roadmap.
-/

namespace TauCetiRoadmap.K3BlochGroups

noncomputable section

/-! ## Layer 3: the integral five-term convention -/

/-- Both entries avoid 0 and 1, and they are distinct. No denominator in the
five-term relation then vanishes. -/
def IsAdmissiblePair {F : Type*} [Field F] (x y : F) : Prop :=
  x ≠ 0 ∧ x ≠ 1 ∧ y ≠ 0 ∧ y ≠ 1 ∧ x ≠ y

/-- The raw integral relation [x]−[y]+[y/x]−[(1−x⁻¹)/(1−y⁻¹)]+[(1−x)/(1−y)].
It is a finite word, not a proposed replacement for the Bloch group. -/
def fiveTermWord {F : Type*} [Field F] (x y : F) : F →₀ ℤ :=
  Finsupp.single x 1 - Finsupp.single y 1 + Finsupp.single (y / x) 1 -
    Finsupp.single ((1 - x⁻¹) / (1 - y⁻¹)) 1 +
    Finsupp.single ((1 - x) / (1 - y)) 1

/-- Change of fields preserves the actual integral word and its orientation. -/
theorem fiveTermWord_map {F L : Type*} [Field F] [Field L]
    (f : F →+* L) (x y : F) :
    Finsupp.mapDomain f (fiveTermWord x y) = fiveTermWord (f x) (f y) := by
  sorry

/-- The five arguments remain admissible symbols under the pair hypotheses. -/
theorem fiveTermWord_support {F : Type*} [Field F] (x y : F)
    (h : IsAdmissiblePair x y) (z : F) (hz : z ∈ (fiveTermWord x y).support) :
    z ≠ 0 ∧ z ≠ 1 := by
  sorry

example : IsAdmissiblePair (2 : ℚ) 3 := by
  sorry

example {F : Type*} [Field F] (x : F) : ¬ IsAdmissiblePair x x := by
  sorry

/-- A rational example fixes all five arguments and their signs. -/
example : fiveTermWord (2 : ℚ) 3 =
    Finsupp.single 2 1 - Finsupp.single 3 1 + Finsupp.single (3 / 2) 1 -
      Finsupp.single (3 / 4) 1 + Finsupp.single (1 / 2) 1 := by
  sorry

/- Steinberg-space K₃, the Milnor product and indecomposable cokernel, enhanced
Tor and integral Bloch–Wigner comparisons, finite-field stabilization with the
characteristic inverted, the norm-one Cartan homology map and real/p-adic
regulator transport need their exact mathematical carriers. Group orders alone
do not define any of these comparison maps. -/

end

end TauCetiRoadmap.K3BlochGroups
