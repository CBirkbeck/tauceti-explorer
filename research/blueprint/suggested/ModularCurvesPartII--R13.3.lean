/-
Suggested statements for Modular curves, following Katz–Mazur, Part II:
Uniformization, integral boundary and Hecke cohomology, part R13.3–R14.2.

The roadmap is research/blueprint/readmes/ModularCurvesPartII--R13.3.md;
this file is a compact selection of statements available at the pinned carriers.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
Every packet node has implementationStatus = unchecked.

The generalized proper Tate family, modular stacks/coarse curves, relative
Jacobian/norm and geometric correspondence carriers are README targets. They
are not replaced by new axiomatic structures here. Current upstream equation-
level Tate coefficients and the prime-level compactification are imports.

The light definitions below compute the arithmetic of existing finite carriers.
Their names ending in Branches describe Hermite-normal-form data, not a
constructed modular curve. The general counting statements are end theorems;
there is no development of subgroup or moduli theory in this suggested file.
-/

import Mathlib.Data.Nat.Totient
import Mathlib.Data.Finset.NatDivisors
import Mathlib.Data.Finset.Prod
import Mathlib.Basic.Complex.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring
import TauCeti.NumberTheory.HeckeRing.GL2.Basic

set_option maxRecDepth 4096

namespace TauCeti.ModularCurves

open scoped BigOperators

/-! R14.1: degree arithmetic of the disjoint order-p correspondence. -/

/-- Rank of a degeneracy leg for a prime p. Its geometric meaning is in the README. -/
def degeneracyDegree (N p : ℕ) : ℕ := if p ∣ N then p else p + 1

/-- Test `degree_degeneracy_coprime`: N=11, p=2. -/
example : degeneracyDegree 11 2 = 3 := by decide

/-- Test `degree_degeneracy_dvd`: N=10, p=5. -/
example : degeneracyDegree 10 5 = 5 := by decide

/-- Coprime composite acceptance: the index-6 correspondence at level 11. -/
example : degeneracyDegree 11 2 * degeneracyDegree 11 3 = 12 := by decide

/-! R13.4a / R14.1: full and cyclic counts differ at repeated primes. -/

/-- HNF triples (a,d,b), with ad=m and 0≤b<d. Only a finite Nat enumeration. -/
def allSubgroupBranches (m : ℕ) : Finset (ℕ × ℕ × ℕ) :=
  ((Finset.range (m + 1)).product
    ((Finset.range (m + 1)).product (Finset.range (m + 1)))).filter
    (fun t => 0 < t.1 ∧ 0 < t.2.1 ∧ t.1 * t.2.1 = m ∧ t.2.2 < t.2.1)

/-- The cyclic HNF filter; it omits the scalar subgroup E[r] for r>1. -/
def cyclicSubgroupBranches (m : ℕ) : Finset (ℕ × ℕ × ℕ) :=
  (allSubgroupBranches m).filter (fun t => Nat.gcd (Nat.gcd t.1 t.2.1) t.2.2 = 1)

/-- Full-subgroup counting milestone, R14.1/full-and-cyclic-correspondences. -/
theorem allSubgroupBranches_card (m : ℕ) (hm : 0 < m) :
    (allSubgroupBranches m).card = ∑ d ∈ m.divisors, d := by
  sorry

/-- Prime-square cyclic degree milestone: ψ(p²)=p²+p. -/
theorem cyclicSubgroupBranches_primeSquare_card (p : ℕ) (hp : p.Prime) :
    (cyclicSubgroupBranches (p ^ 2)).card = p ^ 2 + p := by
  sorry

/-- Test `fullCyclic_one`: identity degree in both conventions. -/
example : (allSubgroupBranches 1).card = 1 ∧ (cyclicSubgroupBranches 1).card = 1 := by
  decide

/-- Test `fullCyclic_four`: σ₁(4)=7, ψ(4)=6. -/
example : (allSubgroupBranches 4).card = 7 ∧ (cyclicSubgroupBranches 4).card = 6 := by
  decide

/-- The excluded scalar branch is precisely the one detecting the m=4 error. -/
example : (2, 2, 0) ∈ allSubgroupBranches 4 ∧ (2, 2, 0) ∉ cyclicSubgroupBranches 4 := by
  decide

/-- Test `fullCyclic_squarefree`: m=6 gives twelve in both conventions. -/
example : (allSubgroupBranches 6).card = 12 ∧ (cyclicSubgroupBranches 6).card = 12 := by
  decide

/-- Another repeated prime: m=9 has one extra scalar subgroup. -/
example : (allSubgroupBranches 9).card = 13 ∧ (cyclicSubgroupBranches 9).card = 12 := by
  decide

/-- The coprime abstract product is already Tau Ceti's theorem, not a new plan. -/
example (m n : ℕ+) (hcop : Nat.Coprime (m : ℕ) (n : ℕ)) :
    HeckeRing.GL2.heckeT m * HeckeRing.GL2.heckeT n =
      HeckeRing.GL2.heckeT (m * n) :=
  HeckeRing.GL2.heckeT_mul_of_coprime m n hcop

/-! R14.1: component-fixed analytic shadow; field descent is a README target. -/

/-- The analytic Fricke formula on a chosen component. -/
noncomputable def atkinLehnerAnalytic (N z : ℂ) : ℂ := -1 / (N * z)

/-- Test `atkinLehnerAnalytic_involutive`, with essential nonzero hypotheses. -/
theorem atkinLehnerAnalytic_involutive (N z : ℂ) (hN : N ≠ 0) (hz : z ≠ 0) :
    atkinLehnerAnalytic N (atkinLehnerAnalytic N z) = z := by
  unfold atkinLehnerAnalytic
  field_simp

/-- Test `diamond_group_order_11`: the effective coarse unit quotient. -/
example : Nat.totient 11 / 2 = 5 := by decide

/-- Test `atkinLehnerExact_twelve`: exact divisors of 12 exclude 2 and 6. -/
example :
    ((12 : ℕ).divisors.filter (fun d => Nat.Coprime d (12 / d))) = {1, 3, 4, 12} := by
  decide

/-! R13.3: arithmetic checks of the corrected d-gon cusp indexing. -/

/-- Test `gammaOneBoundary_five`: two components, not eight, for N=d=5. -/
example : Nat.totient 5 / 2 * Nat.totient (5 / 5) = 2 := by decide

/-- Test `gammaOneBoundary_four`: the 4-gon stratum has degree one. -/
example : Nat.totient 4 / 2 * Nat.totient (4 / 4) = 1 := by decide

/-- Test `gammaOneBoundary_galois`: two degree-two components at N=15,d=5. -/
example : Nat.totient 5 / 2 * Nat.totient (15 / 5) = 4 := by decide

/-! R13.5 / R13.6: numerical checks of the precise split-Cartan model. -/

/-- At ℓ=13 the stated extension has ramification 84. -/
example : 12 * (1 : ℕ) * (6 * 1 + 1) = 84 := by decide

/-- At ℓ=37 the K_(3,3) graph has nine edges and first Betti number four. -/
example : 3 * (3 : ℕ) - (3 + 3) + 1 = 4 := by decide

/-- The component genera and graph genus give g=45 at k=3, ℓ=37. -/
example : 3 * (3 : ℕ) ^ 2 + 2 * ((3 - 1) * (3 * 3 - 2) / 2) + (2 * 3 - 2) = 45 := by
  decide

/-- Acceptance for the first Baran quartic at 2. On Z=1 the derivative
conditions reduce to g=t^7+t^3+1=0 and X=t^3+1, and F becomes t^10+1.
This Bézout identity rules out a common root over the algebraic closure.
The Z=0 argument is given in the README. -/
theorem baran_mod_two_certificate (R : Type*) [CommRing R] [CharP R 2] (t : R) :
    (t^9 + t^8 + t^7 + t^3 + t^2 + t + 1) * (t^7 + t^3 + 1) +
      (t^6 + t^5 + t^4 + t^2 + t) * (t^10 + 1) = 1 := by
  have h2 : (2 : R) = 0 := CharP.cast_eq_zero R 2
  ring_nf
  simp [h2]

/-! R14.2: the trace–pullback arithmetic is integral, even at ℓ dividing degree.
The norm, polarization, faithful image and Kummer-twisted Tate carrier themselves
remain README targets using the named lower suppliers. -/

/-- Test `albanese_comp_picZero_degeneracy`: same-leg norm–pull has multiplier 3. -/
example : degeneracyDegree 11 2 = 2 + 1 := by decide

end TauCeti.ModularCurves
