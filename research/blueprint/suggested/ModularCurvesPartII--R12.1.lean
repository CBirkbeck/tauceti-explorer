import Mathlib.Analysis.SpecialFunctions.Elliptic.Weierstrass
import Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass
import Mathlib.RingTheory.Polynomial.Cyclotomic.Basic
import Mathlib.NumberTheory.ArithmeticFunction.Misc
import TauCeti.AlgebraicGeometry.IrreducibleOfConnectedDomainStalk
import Mathlib.Tactic.Ring
import Mathlib.Tactic.NormNum

/-!
This file is not the roadmap and is not exhaustive. The companion roadmap
README is definitive. These statements suggest Lean names and signatures
so that contributors and reviewers can converge on them.

The 2026-10-12 WORKERS shape takes precedence over the earlier exhaustive
prototype rule. Only native carriers and light definitions with real bodies
appear here. Analytic spaces, generalized elliptic curves, coherent
Γ₀ decontractions, integral moduli stacks and the geometric Hecke comparison
are README targets, with their complete API and tests there. No invented
carrier or data-valued placeholder stands in for those constructions.
-/

noncomputable section

namespace TauCeti.ModularCurves

/-! R12.1: Mathlib already owns the period pair, ℘ and its differential equation. -/

def latticeWeierstrass (L : PeriodPair) : WeierstrassCurve ℂ where
  a₁ := 0
  a₂ := 0
  a₃ := 0
  a₄ := -L.g₂ / 4
  a₆ := -L.g₃ / 4

theorem latticeWeierstrass_discriminant (L : PeriodPair) :
    (latticeWeierstrass L).Δ = L.g₂ ^ 3 - 27 * L.g₃ ^ 2 := by
  sorry

/-- This is the missing nonsingularity milestone, not a restatement of the ODE. -/
theorem latticeWeierstrass_isElliptic (L : PeriodPair) :
    (latticeWeierstrass L).IsElliptic := by
  sorry

-- The coordinate factor 1/2 is essential for the native five-coefficient model.
-- Packet test: latticeWeierstrass_equation.
example (L : PeriodPair) (z : ℂ) (hz : z ∉ L.lattice) :
    (L.derivWeierstrassP z / 2) ^ 2 =
      L.weierstrassP z ^ 3 - L.g₂ * L.weierstrassP z / 4 - L.g₃ / 4 := by
  sorry

-- Packet test: latticeWeierstrass_square (its g₃ half). The square lattice is stable
-- under multiplication by i, so g₃ = 0; then j = 1728 by the discriminant formula.
example (h : LinearIndependent ℝ ![(1 : ℂ), Complex.I]) :
    (PeriodPair.mk 1 Complex.I h).g₃ = 0 := by
  sorry

-- Packet test: latticeWeierstrass_collapsed_basis. Periods 1 and 2 are real-linearly
-- dependent, so they do not form a `PeriodPair`.
example : ¬ LinearIndependent ℝ ![(1 : ℂ), 2] := by
  intro h
  have := LinearIndependent.pair_iff.mp h 2 (-1) (by norm_num)
  norm_num at this

-- The pole test involves the analytic comparison and remains stated in the README.

/-! R13.1: the split integral one-gon equation, valid also in characteristic two. -/

def splitOneGonEquation : WeierstrassCurve ℤ where
  a₁ := 1
  a₂ := 0
  a₃ := 0
  a₄ := 0
  a₆ := 0

-- Packet test: neronPolygon_one. This is the affine normalization equation.
example (t : ℤ) :
    (t ^ 2 * (t + 1)) ^ 2 + (t * (t + 1)) * (t ^ 2 * (t + 1)) =
      (t * (t + 1)) ^ 3 := by
  ring

-- A light equation record does not assert ellipticity or define the polygon stack.
example : splitOneGonEquation.Δ = 0 := by
  norm_num [splitOneGonEquation, WeierstrassCurve.Δ, WeierstrassCurve.b₂,
    WeierstrassCurve.b₄, WeierstrassCurve.b₆, WeierstrassCurve.b₈]

-- Source issue E107: the discriminant of the level-three normal form y(y + a₁x + a₃) = x³.
example (a₁ a₃ : ℂ) :
    (WeierstrassCurve.mk a₁ 0 a₃ 0 0).Δ = a₃ ^ 3 * (a₁ ^ 3 - 27 * a₃) := by
  simp only [WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄,
    WeierstrassCurve.b₆, WeierstrassCurve.b₈]
  ring

/-! R12.5: the all-subgroup Hecke degree at n = 4 is σ₁(4) = 7; the cyclic degree is ψ(4) = 6. -/

-- Packet test: charZeroHecke_degree_four (its all-subgroup half).
example : ArithmeticFunction.sigma 1 4 = 7 := by
  rw [ArithmeticFunction.sigma_one_apply]
  decide

/-! R13.2: use the native cyclotomic degree theorem for primitive-root bases. -/

example : (Polynomial.cyclotomic 6 ℤ).natDegree = 2 := by
  rw [Polynomial.natDegree_cyclotomic]
  decide

/-! R12.4: the final connected-to-irreducible implication already exists. -/

open _root_.AlgebraicGeometry in
example (X : Scheme) [IsLocallyNoetherian X] [ConnectedSpace X]
    (hStalks : ∀ x : X.carrier, IsDomain (X.presheaf.stalk x)) :
    IrreducibleSpace X := by
  exact TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk X hStalks

end TauCeti.ModularCurves
