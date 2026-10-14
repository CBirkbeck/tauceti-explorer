import Mathlib.Dynamics.PeriodicPts.Defs
import Mathlib.NumberTheory.ArithmeticFunction.Moebius
import Mathlib.Data.Nat.Totient
import Mathlib.NumberTheory.Height.NumberField
import Mathlib.Tactic

/-!
This file is not the roadmap and is not exhaustive. The reader document is definitive.
These statements suggest Lean forms so that contributors and reviewers converge on
names and signatures. No declaration here claims an implementation of the blueprint.

This follow-up reuses the accepted parent packet. Its heavy targets (projective
normalization, rotation quotient, different/genus, rational differential pushforward,
ray landing and analytic/algebraic comparison, and executable field realization)
remain mathematical signatures and API in the reader: their dynamical carriers are
not supplied at the pins. No replacement opaque data or proposition package is used.

The following are light, real-bodied rational coordinate functions, numeric genus
expressions, and milestones stated on existing carriers. The arithmetic point-list
hypothesis below is the exact ED.3 conclusion for Morton's curve; it is not a claim
that a certificate has already been implemented. The final dynamical theorem is the
unconditional target obtained once that supplier and the reduction are developed.
-/

namespace TauCetiRoadmap.ArithmeticDynamics.DY3

/-- Morton 1992, §2 (17)–(24), pp.354–355. -/
def mortonThreeCycleEquation (t u : ℚ) : ℚ :=
  (t ^ 2 - 1) * u ^ 3 + (t ^ 3 - 2 * t ^ 2 - 9 * t + 2) * u ^ 2 -
    9 * (t ^ 2 - 1) * u - (t ^ 3 - 2 * t ^ 2 - 9 * t + 2)

def mortonThreeCycleParameter (c x : ℚ) : ℚ := 1 + 2 * c + 2 * x + 2 * x ^ 2

def mortonThreeCycleInversePoint (t : ℚ) : ℚ :=
  (t ^ 3 + t ^ 2 - t + 7) / (4 * (t ^ 2 - 1))

def mortonThreeCycleInverseCoefficient (t : ℚ) : ℚ :=
  -(t ^ 6 - 2 * t ^ 5 + 11 * t ^ 4 + 20 * t ^ 3 + 23 * t ^ 2 - 18 * t + 29) /
    (16 * (t ^ 2 - 1) ^ 2)

def mortonThreeCycleRotation (t : ℚ) : ℚ := (t + 3) / (1 - t)

def mortonCycleTrace (t : ℚ) : ℚ := (t ^ 3 - 9 * t) / (t ^ 2 - 1)

/-- Coordinates are used only on the nonzero-denominator domain in the statements. -/
def mortonEllipticCoordinates (t u : ℚ) : ℚ × ℚ :=
  ((t + u + 2) / (t + u),
   (t * u * (t + u - 2) - (3 * (t + u) + 2)) / (t + u) ^ 2)

-- Basic API for the kept light definitions; no auxiliary proof development.
theorem mortonThreeCycleEquation_swap (t u : ℚ) :
    mortonThreeCycleEquation t u = mortonThreeCycleEquation u t := by sorry

theorem mortonThreeCycleEquation_symmetric (t u : ℚ) :
    mortonThreeCycleEquation t u =
      (t * u) ^ 2 * (t + u - 2) - t * u * (6 * (t + u) + 4) -
        ((t + u) ^ 3 - 2 * (t + u) ^ 2 - 9 * (t + u) + 2) := by sorry

theorem mortonThreeCycleParameter_inverse (t : ℚ) (ht : t ^ 2 ≠ 1) :
    mortonThreeCycleParameter (mortonThreeCycleInverseCoefficient t)
      (mortonThreeCycleInversePoint t) = t := by sorry

theorem mortonThreeCycleRotation_compatibility (c x : ℚ)
    (hx : Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) x = 3) :
    mortonThreeCycleParameter c (x ^ 2 + c) =
      mortonThreeCycleRotation (mortonThreeCycleParameter c x) := by sorry

theorem mortonCycleTrace_relation (t : ℚ) (ht : t ^ 2 ≠ 1) :
    mortonThreeCycleInverseCoefficient t =
      -(mortonCycleTrace t ^ 2 - 2 * mortonCycleTrace t + 29) / 16 := by sorry

theorem mortonCycleTrace_rotation (t : ℚ) (ht : t ^ 2 ≠ 1) :
    mortonCycleTrace (mortonThreeCycleRotation t) = mortonCycleTrace t := by sorry

-- Morton Lemma6, p.363. This is the affine equation, not a constructed elliptic carrier.
theorem mortonEllipticEquation (t u : ℚ)
    (hH : mortonThreeCycleEquation t u = 0) (hζ : t + u ≠ 0) :
    (mortonEllipticCoordinates t u).2 ^ 2 =
      4 * (mortonEllipticCoordinates t u).1 ^ 3 -
        11 * (mortonEllipticCoordinates t u).1 ^ 2 +
          8 * (mortonEllipticCoordinates t u).1 := by sorry

theorem mortonEllipticCoordinates_swap (t u : ℚ) :
    mortonEllipticCoordinates t u = mortonEllipticCoordinates u t := by sorry

theorem mortonElliptic_inverse (t u : ℚ) (hζ : t + u ≠ 0) (hζ2 : t + u ≠ 2) :
    t + u = 2 / ((mortonEllipticCoordinates t u).1 - 1) ∧
      t * u = ((t + u) ^ 2 * (mortonEllipticCoordinates t u).2 +
        3 * (t + u) + 2) / (t + u - 2) := by sorry

theorem mortonExceptionalCoordinates (t u : ℚ)
    (hH : mortonThreeCycleEquation t u = 0) (hζ : t + u = 0 ∨ t + u = 2) :
    (t = 1 ∧ u = -1) ∨ (t = -1 ∧ u = 1) ∨ (t = 1 ∧ u = 1) := by sorry

theorem mortonElliptic_fibre (t u t' u' : ℚ)
    (hζ : t + u ≠ 0) (hζ2 : t + u ≠ 2)
    (hζ' : t' + u' ≠ 0) (hζ2' : t' + u' ≠ 2)
    (h : mortonEllipticCoordinates t u = mortonEllipticCoordinates t' u') :
    (t = t' ∧ u = u') ∨ (t = u' ∧ u = t') := by sorry

theorem distinctCycles_mortonEquation (c x y : ℚ)
    (hx : Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) x = 3)
    (hy : Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) y = 3)
    (hxy : y ≠ x ∧ y ≠ x ^ 2 + c ∧ y ≠ (x ^ 2 + c) ^ 2 + c) :
    mortonThreeCycleEquation (mortonThreeCycleParameter c x)
      (mortonThreeCycleParameter c y) = 0 ∧
      (mortonThreeCycleParameter c x) ^ 2 ≠ 1 ∧
        (mortonThreeCycleParameter c y) ^ 2 ≠ 1 := by sorry

/-- ED.3's exact affine list is consumed with the actual equation and coordinates. -/
theorem mortonRationalAffinePoints
    (hE : ∀ X Y : ℚ, Y ^ 2 = 4 * X ^ 3 - 11 * X ^ 2 + 8 * X →
      (X = 0 ∧ Y = 0) ∨ (X = 1 ∧ (Y = 1 ∨ Y = -1)) ∨
        (X = 2 ∧ (Y = 2 ∨ Y = -2)))
    (t u : ℚ) (hH : mortonThreeCycleEquation t u = 0) :
    (t = -1 ∨ t = 1) ∧ (u = -1 ∨ u = 1) := by sorry

/-- Morton Theorem3, p.346: every two exact rational period3 points share one cycle. -/
theorem atMostOneRationalThreeCycle (c x y : ℚ)
    (hx : Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) x = 3)
    (hy : Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) y = 3) :
    y = x ∨ y = x ^ 2 + c ∨ y = (x ^ 2 + c) ^ 2 + c := by sorry

-- Numeric abbreviations for the genus formula; no geometric genus carrier is fabricated.
noncomputable def quadraticNu (n : ℕ) : ℚ :=
  (∑ e ∈ n.divisors, (ArithmeticFunction.moebius (n / e) : ℚ) * 2 ^ e) / 2

noncomputable def quadraticEvenCorrection (n : ℕ) : ℚ :=
  (∑ r ∈ n.divisors.filter (fun r => Even r ∧ Odd (n / r)),
    (ArithmeticFunction.moebius (n / r) : ℚ) * 2 ^ (r / 2)) / (4 * n)

noncomputable def quadraticGenusOneExpression (n : ℕ) : ℚ :=
  1 + ((n : ℚ) - 3) * quadraticNu n / 2 -
    (∑ e ∈ n.divisors.filter (fun e => e < n),
      (e : ℚ) * quadraticNu e * Nat.totient (n / e)) / 2

noncomputable def quadraticGenusZeroExpression (n : ℕ) : ℚ :=
  1 + (1 / 2 - 3 / (2 * (n : ℚ))) * quadraticNu n -
    (∑ e ∈ n.divisors.filter (fun e => e < n),
      quadraticNu e * Nat.totient (n / e)) / 2 - quadraticEvenCorrection n

-- The formula-to-geometric-genus equalities are README targets on imported curve models.
example : quadraticGenusOneExpression 4 = 2 := by sorry
example : quadraticGenusZeroExpression 5 = 2 := by sorry
example : quadraticGenusZeroExpression 6 = 4 := by sorry

-- Field-degree normalization of the native pinned height, on affine representatives.
theorem relativeHeightCandidateBound (K : Type*) [Field K] [NumberField K]
    (x : K) (B D : ℝ)
    (hB : Height.logHeight₁ x / (Module.finrank ℚ K : ℝ) ≤ B)
    (hD : Real.exp ((Module.finrank ℚ K : ℝ) * B) ≤ D) :
    Height.mulHeight₁ x ≤ D := by sorry

-- Discriminating computed values for the explicit coordinate API.
example : mortonThreeCycleEquation 0 0 = -2 := by
  norm_num [mortonThreeCycleEquation]

example : mortonThreeCycleEquation 1 1 = 0 ∧ mortonThreeCycleEquation 1 (-1) = 0 ∧
    mortonThreeCycleEquation (-1) 1 = 0 ∧ mortonThreeCycleEquation (-1) (-1) = 0 := by
  norm_num [mortonThreeCycleEquation]

example : mortonThreeCycleParameter (-29 / 16) (5 / 4) = 3 ∧
    mortonThreeCycleParameter (-29 / 16) (-1 / 4) = -3 ∧
    mortonThreeCycleParameter (-29 / 16) (-7 / 4) = 0 := by
  norm_num [mortonThreeCycleParameter]

example : mortonCycleTrace 3 = 0 ∧ mortonCycleTrace (-3) = 0 ∧ mortonCycleTrace 0 = 0 := by
  norm_num [mortonCycleTrace]

example : mortonEllipticCoordinates (-1) (-1) = (0, 0) := by
  norm_num [mortonEllipticCoordinates]

example : (1 : ℚ) + (-1) = 0 := by norm_num

end TauCetiRoadmap.ArithmeticDynamics.DY3
