/-
Weight-two comparisons: algebraic compatibility tests only.

Baseline: mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.
These examples use existing module, linear-map and dual types. They are not
formalizations of Abel--Jacobi, Kummer, Hida or Iwasawa comparison theorems.
This file has not been compiled in the submitting browser environment.

The seven geometric target signatures are intentionally not faked with opaque
carriers or assumptions containing their conclusions. Their unavailable inputs
and exact supplier contracts are recorded in the packet and handoff. In
particular, multiplicative Kummer cohomology with mu_m coefficients is not an
alias for the Tate-module Kummer map of an elliptic curve.
-/

import Mathlib.LinearAlgebra.Dual.Defs

noncomputable section

namespace TauCeti.GeneralizedHeegnerCycles.WeightTwoChecks

variable {R M N P : Type*} [CommRing R]
variable [AddCommGroup M] [AddCommGroup N] [AddCommGroup P]
variable [Module R M] [Module R N] [Module R P]

-- Evaluation after a quotient is evaluation against its transpose.
example (q : M →ₗ[R] N) (ell : Module.Dual R N) (x : M) :
    q.dualMap ell x = ell (q x) :=
  LinearMap.dualMap_apply q ell x

-- The order of the two transpose maps is reversed.
example (q : M →ₗ[R] N) (r : N →ₗ[R] P) :
    q.dualMap.comp r.dualMap = (r.comp q).dualMap :=
  LinearMap.dualMap_comp_dualMap q r

-- A finite-level stabilization is transported without changing its scalar.
-- Here a is an arbitrary scalar; ordinariness is not hidden in its type.
example (q : M →ₗ[R] N) (a : R) (x y : M) :
    q (x - a • y) = q x - a • q y := by
  simp only [map_sub, map_smul]

-- The linear part of character-weighted transport, without an averaging factor.
example (q : M →ₗ[R] N) (a b : R) (x y : M) :
    q (a • x + b • y) = a • q x + b • q y := by
  simp only [map_add, map_smul]

-- A supplied differential-pullback equality produces exactly its scalar.
-- The arithmetic proof of that pullback equality is not assumed to exist here.
example (q : M →ₗ[R] N) (ell : Module.Dual R N)
    (eta : Module.Dual R M) (c : R) (h : q.dualMap ell = c • eta) (x : M) :
    ell (q x) = c * eta x := by
  change (q.dualMap ell) x = c * eta x
  rw [h]
  rfl

end TauCeti.GeneralizedHeegnerCycles.WeightTwoChecks
