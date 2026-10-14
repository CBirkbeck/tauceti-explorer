/-
This file is not the roadmap and is not exhaustive. The accompanying README
is definitive. Suggested Lean forms help contributors and reviewers converge
on interfaces; proof placeholders are intentional and claim no implementation.

Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369.

The thirteen imported arithmetic targets and the two new key inputs
primitive_greenberg_mu_vanishing and anticyclotomic_specialization_control
require the actual continuous Iwasawa cohomology, local conditions, integral
regulators, characteristic ideals and normalized arithmetic functions absent
at these pins. Under WORKERS.md's 2026-10-12 shape they are README targets.
No arbitrary modules or ideal-valued functions stand in for them here.

These eight native algebra examples are the concrete convention checks used
by the README. There is no definition, construction or arithmetic theorem in
this file. In particular, coefficientwise map is not anticyclotomic control.
-/
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.Ideal.Span
import Mathlib.Data.ZMod.Basic

namespace TauCeti.Heegner.Anticyclotomic.ConventionChecks

-- A zero augmentation does not imply that all coefficients vanish modulo p.
example : PowerSeries.constantCoeff (PowerSeries.X : PowerSeries ℤ) = 0 ∧
    PowerSeries.coeff 1 (PowerSeries.X : PowerSeries ℤ) = 1 := by
  sorry

-- Squaring the root moves the first nonzero coefficient from degree 1 to 2.
example : PowerSeries.coeff 1 ((PowerSeries.X : PowerSeries ℤ) ^ 2) = 0 ∧
    PowerSeries.coeff 2 ((PowerSeries.X : PowerSeries ℤ) ^ 2) = 1 := by
  sorry

-- The formal variable remains nonzero after reduction modulo 5.
example : PowerSeries.coeff 1
    (PowerSeries.map (Int.castRingHom (ZMod 5))
      (PowerSeries.X : PowerSeries ℤ)) = 1 := by
  sorry

-- Multiplication by 5 is visible in precisely that reduction.
example : PowerSeries.map (Int.castRingHom (ZMod 5))
    (PowerSeries.C 5 * (PowerSeries.X : PowerSeries ℤ)) = 0 := by
  sorry

-- Inverting the coefficient prime erases its ideal discrepancy.
example : Ideal.span ({PowerSeries.C 5 * PowerSeries.X} : Set (PowerSeries ℚ)) =
    Ideal.span ({PowerSeries.X} : Set (PowerSeries ℚ)) := by
  sorry

-- The discrepancy was present before inversion.
example : Ideal.span ({5} : Set ℤ) ≠ Ideal.span ({1} : Set ℤ) := by
  sorry

-- Ideal containment reverses divisibility of generators.
example : Ideal.span ({(PowerSeries.X : PowerSeries ℤ) ^ 2} : Set (PowerSeries ℤ)) ≤
    Ideal.span ({PowerSeries.X} : Set (PowerSeries ℤ)) := by
  sorry

-- At a fixed height-one prime, two individual bounds and a reverse sum bound
-- force equality of both orders. Arithmetic supplies their finite orders.
example (a b c d : ℕ) (h₁ : a ≤ c) (h₂ : b ≤ d) (h₃ : c + d ≤ a + b) :
    a = c ∧ b = d := by
  sorry

end TauCeti.Heegner.Anticyclotomic.ConventionChecks
