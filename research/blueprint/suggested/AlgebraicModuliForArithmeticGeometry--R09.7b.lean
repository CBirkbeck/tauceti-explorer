import Mathlib.RingTheory.MvPowerSeries.Order
import Mathlib.RingTheory.MvPowerSeries.NoZeroDivisors
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.RingTheory.Ideal.Span
import Mathlib.Algebra.Order.BigOperators.Group.Finset

/-!
# R09.7b: local invariant, maximal contact and coefficient ideals

This file is not the roadmap and is not exhaustive. The definitive document is
`research/blueprint/readmes/AlgebraicModuliForArithmeticGeometry--R09.7b.md`.
These are suggested forms of native-carrier milestones and discriminating examples;
elaborating them does not finish the layer or supply their proofs.

The accepted R09.7 packet owns the local theory. R09.7a owns its geometric
coefficient-completion comparison. No second marked-presentation, Samuel-certificate,
history or invariant-word carrier is introduced here. WORKERS.md's fixed shape leaves
those unavailable geometric carriers in the reader. Only native power series, ideals,
and finite rational sums occur below. All mathematical proofs remain targets.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
-/

noncomputable section
namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.LocalInvariantExamples

open scoped BigOperators

private abbrev S := MvPowerSeries (Fin 2) ℚ
private abbrev x : S := MvPowerSeries.X 0
private abbrev y : S := MvPowerSeries.X 1

/-! Order conventions and the first admissible cusp chart (reader Checks O1–O3). -/
example : MvPowerSeries.order (0 : S) = ⊤ := by sorry
example : MvPowerSeries.order (1 : S) = 0 := by sorry
example : MvPowerSeries.order (x ^ 2 + y ^ 5) = 2 := by sorry

-- Substituting z = x*t and cancelling x^2 gives t^2+x^3.
-- The first order can remain two; a scalar multiplicity is not a termination measure.
example : (x * y) ^ 2 + x ^ 5 = x ^ 2 * (y ^ 2 + x ^ 3) := by sorry
example : MvPowerSeries.order (y ^ 2 + x ^ 3) = 2 := by sorry

/-! Coefficients are already native: a series in z with coefficients in S.
The following is the algebraic specialization of the imported completion comparison;
it does not assert the existence of a compatible geometric completion. -/
example (f : PowerSeries ℚ) (q : ℕ) :
    (Nat.factorial q : ℚ)⁻¹ *
      PowerSeries.constantCoeff ((PowerSeries.derivative ℚ)^[q] f) =
        PowerSeries.coeff q f := by sorry

-- C1: cusp, mark two. The q=1 coefficient is retained as zero.
example : PowerSeries.coeff 0
    ((PowerSeries.X : PowerSeries S) ^ 2 + PowerSeries.C (x ^ 3)) = x ^ 3 := by sorry
example : PowerSeries.coeff 1
    ((PowerSeries.X : PowerSeries S) ^ 2 + PowerSeries.C (x ^ 3)) = 0 := by sorry

-- C2: cubic, marks three and two. Common mark six gives (y^10,x^12).
example : PowerSeries.coeff 0
    ((PowerSeries.X : PowerSeries S) ^ 3 + PowerSeries.C (x ^ 4) * PowerSeries.X +
      PowerSeries.C (y ^ 5)) = y ^ 5 := by sorry
example : PowerSeries.coeff 1
    ((PowerSeries.X : PowerSeries S) ^ 3 + PowerSeries.C (x ^ 4) * PowerSeries.X +
      PowerSeries.C (y ^ 5)) = x ^ 4 := by sorry
example : PowerSeries.coeff 2
    ((PowerSeries.X : PowerSeries S) ^ 3 + PowerSeries.C (x ^ 4) * PowerSeries.X +
      PowerSeries.C (y ^ 5)) = 0 := by sorry
example : Ideal.span ({(y ^ 5) ^ 2, (x ^ 4) ^ 3} : Set S) =
    Ideal.span ({y ^ 10, x ^ 12} : Set S) := by sorry

-- C3: pure contact power. Including q=d would introduce a unit.
example (d q : ℕ) (hqd : q < d) :
    PowerSeries.coeff q ((PowerSeries.X : PowerSeries S) ^ d) = 0 := by sorry
example (d : ℕ) :
    PowerSeries.coeff d ((PowerSeries.X : PowerSeries S) ^ d) = 1 := by sorry

-- C4: linear coefficient matters after completion; mark two gives (y^3,y^2).
example : Ideal.span ({y ^ 3, y ^ 2} : Set S) =
    Ideal.span ({y ^ 2} : Set S) := by sorry

/-! The strict derivative bound in the Samuel presentation (Check S3).
These test the already recorded correction E1902, not a new erratum. -/
example : Ideal.span
    ({(PowerSeries.X : PowerSeries ℚ) ^ 2,
       PowerSeries.derivative ℚ (PowerSeries.X ^ 2)} : Set (PowerSeries ℚ)) =
    Ideal.span ({PowerSeries.X} : Set (PowerSeries ℚ)) := by sorry
example : Ideal.span
    ({(PowerSeries.X : PowerSeries ℚ) ^ 2,
       PowerSeries.derivative ℚ (PowerSeries.X ^ 2),
       PowerSeries.derivative ℚ
         (PowerSeries.derivative ℚ (PowerSeries.X ^ 2))} : Set (PowerSeries ℚ)) = ⊤ := by sorry

/-! Monomial descent: a native numerical consequence of R09.7/monomial-decrease.
At a pivot in a minimal centre, its replacement has smaller nonnegative weight.
The geometric chart identification and invariance of the earlier prefix are imports. -/
theorem monomial_pivot_drop {ι : Type*} [DecidableEq ι]
    (I : Finset ι) (w : ι → ℚ) (i : ι) (hi : i ∈ I)
    (hthreshold : 1 ≤ ∑ j ∈ I, w j)
    (hminimal : ∑ j ∈ I.erase i, w j < 1) :
    0 ≤ (∑ j ∈ I, w j) - 1 ∧ (∑ j ∈ I, w j) - 1 < w i := by sorry

example : (1 / 2 : ℚ) + 1 / 2 - 1 = 0 := by sorry
example : (3 / 2 : ℚ) - 1 = 1 / 2 := by sorry
example : ¬ ((1 : ℚ) + 1 - 1 < 1) := by sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.LocalInvariantExamples
