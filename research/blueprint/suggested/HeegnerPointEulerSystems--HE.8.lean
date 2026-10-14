import Mathlib.Algebra.Module.LinearMap.Defs
import Mathlib.Data.Rat.Defs

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These signatures suggest Lean forms so that contributors and
reviewers converge on names and signatures; they claim no implementation.

HE.8 already has accepted targets in HeegnerPointEulerSystems--HE.7s.lean.
This refinement states only elementary normalization formulas over carriers
already present at the pins. It introduces no arithmetic stand-in carrier.

The eight new arithmetic targets, including tracedNormModule and its four API
items, need ring-class fields, actual compact norm modules, Selmer structures
and perfect arithmetic complexes. They are fully specified in the README.
The four tracedNormModule tests are likewise README tests until those carriers
exist. In particular, a free scalar module is not declared to be that module.

The formulas below refine the accepted initial-euler-factor and
stabilized-corestriction targets. Their arithmetic hypotheses, Artin actions,
first-step correction and d(k) trace identifications remain in the README.
-/

namespace TauCeti.Heegner.Anticyclotomic.Normalization

/-- Algebraic split factor, retaining the Artin variable before augmentation. -/
theorem split_factor {R : Type*} [CommRing R] (u v s : R) :
    u * v - (u + v) * s + s ^ 2 = (u - s) * (v - s) := by
  sorry

/-- Algebraic inert factor when the two roots have sum a_p and product p. -/
theorem inert_factor {R : Type*} [CommRing R] (u v : R) :
    (u * v + 1) ^ 2 - (u + v) ^ 2 = (u ^ 2 - 1) * (v ^ 2 - 1) := by
  sorry

/-- Positive-level scalar trace identity. The degree and raw recurrence
are hypotheses about the supplied linear map, not about an invented tower. -/
theorem positive_trace
    {R M V : Type*} [CommRing R] [AddCommGroup M] [Module R M]
    [AddCommGroup V] [Module R V]
    (cor : M →ₗ[R] V) (u : Rˣ) (a p : R)
    (x y : M) (Y Z : V)
    (hroot : (u : R) ^ 2 - a * (u : R) + p = 0)
    (hraw : cor x = a • Y - Z) (hdegree : cor y = p • Y) :
    cor (x - ((u⁻¹ : Rˣ) : R) • y) =
      (u : R) • (Y - ((u⁻¹ : Rˣ) : R) • Z) := by
  sorry

/-- Stabilization commutes with a linear coefficient map. -/
theorem stabilization_map
    {R M V : Type*} [CommRing R] [AddCommGroup M] [Module R M]
    [AddCommGroup V] [Module R V]
    (f : M →ₗ[R] V) (u : Rˣ) (r : ℕ) (x y : M) :
    f ((((u⁻¹ : Rˣ) : R) ^ r) • (x - ((u⁻¹ : Rˣ) : R) • y)) =
      (((u⁻¹ : Rˣ) : R) ^ r) • (f x - ((u⁻¹ : Rˣ) : R) • f y) := by
  sorry

-- Discriminating initial-factor cases: neither factor is a 5-adic unit.
example : ((5 : ℤ) + 1 - 1) ^ 2 = 25 := by
  sorry

example : ((5 : ℤ) + 1) ^ 2 - 1 ^ 2 = 35 := by
  sorry

-- The predecessor subtraction and the outer scaling are both necessary.
example : (2 : ℚ)⁻¹ * (4 - (2 : ℚ)⁻¹ * 2) = 3 / 2 := by
  sorry

end TauCeti.Heegner.Anticyclotomic.Normalization
