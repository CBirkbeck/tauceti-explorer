import TauCeti.FieldTheory.FunctionField.Divisor.Basic

/-!
This file is not the roadmap and is not exhaustive. The companion README is
definitive. These statements suggest Lean forms so contributors and reviewers
converge on names and signatures; they claim no implementation.

GC.5 uses the existing weighted divisor degree, not the unweighted sum of
coefficients. This light definition indexes the auxiliary choices in the
accepted parent packet. No stack or lisse-sheaf carrier is simulated here.

Geometric omission ledger (all declarations remain README targets):
* signedDivisorTensorLine: zero, effective, sum, neg, decomposition,
  closedPoint; tests test_empty, test_degree_two_negative,
  test_cancellation, test_order_three.
* picardCharacter.normalizedUniversalProperty: compatible morphisms from the
  normalized presentations, uniquely induced from the all-degree sheaf.
* picardCharacter.signedTranslation: arbitrary signed away divisors, identity,
  composition, inverse, and compatibility with the effective translation.
* hatCharacter.addition: whole-space pullback comparison, effective restriction,
  associativity, symmetry and unit, including nonzero zero-section stalks.
Their exact carriers, hypotheses, source locators and checks are in the README.
They require actual root Picard stacks, morphisms, rank-one lisse categories,
tensor/dual/pullback operations, and effective descent; these are absent at the
pins. Scheme.Modules is not a substitute for an ell-adic lisse category.

Imported parent GC.5 declarations (not redeclared): auxiliary-divisors,
divisorTensorLine (zero, sum, closedPoint; tests empty, rational, degree_two),
translate-high-degree, picardCharacter (component, comparison, translation;
tests negative_degree, common_sum, high_degree), choice-comparison,
choice-cocycle, effective-pullback, unit-trivialization,
high-degree-multiplication, all-degree-multiplication, character-associativity,
character-symmetry-unit, hatCharacter (definition, effective, zeroSection;
tests effective, zero, degree_zero). Those signatures have the same geometric
carrier obstruction. The README gives their full imported contract by node id.

WORKERS.md's 2026-10-12 shape: only real-bodied light definitions over existing
carriers, end statements statable at the pins, and examples belong in this file.
-/

noncomputable section

namespace TauCeti.RamifiedClassField

open TauCeti
open TauCeti.AlgebraicGeometry

variable {k F : Type*} [Field k] [Field F] [Algebra k F]

/-- Effective away-place divisors carrying degree d above the bound B. -/
def auxiliaryDivisors (S : Set (Place k F)) (d B : ℤ) : Set (Divisor k F) :=
  {D | 0 ≤ D ∧ (∀ P ∈ S, D P = 0) ∧ B ≤ d + Divisor.degree D}

namespace auxiliaryDivisors

variable {S : Set (Place k F)} {d B B' : ℤ} {D E : Divisor k F}

theorem mem_iff : D ∈ auxiliaryDivisors S d B ↔
    0 ≤ D ∧ (∀ P ∈ S, D P = 0) ∧ B ≤ d + Divisor.degree D := by
  sorry

theorem effective (hD : D ∈ auxiliaryDivisors S d B) : 0 ≤ D := by
  sorry

theorem away (hD : D ∈ auxiliaryDivisors S d B) (P : Place k F)
    (hP : P ∈ S) : D P = 0 := by
  sorry

theorem degree_bound (hD : D ∈ auxiliaryDivisors S d B) :
    B ≤ d + Divisor.degree D := by
  sorry

theorem mono_bound (hBB' : B' ≤ B) (hD : D ∈ auxiliaryDivisors S d B) :
    D ∈ auxiliaryDivisors S d B' := by
  sorry

/-- A common effective enlargement; both inputs have nonnegative degree. -/
theorem add_mem (hD : D ∈ auxiliaryDivisors S d B)
    (hE : E ∈ auxiliaryDivisors S d B) :
    D + E ∈ auxiliaryDivisors S d B ∧ D ≤ D + E ∧ E ≤ D + E := by
  sorry

/-- The witness is an away place of any positive residue degree. -/
theorem nonempty_of_away_place (hF : IsFunctionField k F) (P : Place k F)
    (hP : P ∉ S) : (auxiliaryDivisors S d B).Nonempty := by
  sorry

theorem zero_mem_iff : (0 : Divisor k F) ∈ auxiliaryDivisors S d B ↔ B ≤ d := by
  sorry

-- test_zero: catches an incorrect strict bound or a nonempty-support condition.
example : (0 : Divisor k F) ∈ auxiliaryDivisors S d B ↔ B ≤ d := by
  sorry

-- test_degree_two: detects use of unweighted divisor degree.
example (P : Place k F) (hP : P ∉ S) (hdeg : P.degree = 2) :
    WeilDivisor.ofPoint P ∈ auxiliaryDivisors S d B ↔ B ≤ d + 2 := by
  sorry

-- test_negative: a signed divisor is not an effective auxiliary choice.
example (P : Place k F) :
    -WeilDivisor.ofPoint P ∉ auxiliaryDivisors S d B := by
  sorry

-- test_ramified: meeting the degree bound does not permit ramified support.
example (P : Place k F) (hP : P ∈ S) :
    WeilDivisor.ofPoint P ∉ auxiliaryDivisors S d B := by
  sorry

-- test_negative_degree: no degree-one point is needed to cross the bound.
example (P : Place k F) (hP : P ∉ S) (hdeg : P.degree = 2) :
    4 • WeilDivisor.ofPoint P ∈ auxiliaryDivisors S (-5) 3 ∧
      3 • WeilDivisor.ofPoint P ∉ auxiliaryDivisors S (-5) 3 := by
  sorry

end auxiliaryDivisors
end TauCeti.RamifiedClassField
