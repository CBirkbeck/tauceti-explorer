/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.RingTheory.FormalGroup.Basic
import Mathlib.RingTheory.PowerSeries.WeierstrassPreparation
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.Data.ZMod.Basic
import TauCeti.AlgebraicGeometry.EllipticCurve.FormalGroup.Basic
import TauCeti.AlgebraicGeometry.EllipticCurve.FormalGroup.AdicPoint
import TauCeti.AlgebraicGeometry.EllipticCurve.FormalGroup.Point.Range

/-!
# Suggested signatures: Lubin–Tate formal modules and quasi-canonical lifts

This file contains suggested forms, rather than an exhaustive checklist. The README is the
specification: it carries every target, hypothesis, proof plan, API and discriminating Check.
Statements here use only carriers available at the pinned Mathlib and Tau Ceti commits.

The four definitions below are coefficient-level predicates with real bodies. The formal
O_K-action, marked-deformation, Tate-lattice quotient, minimal-field and tower-point carriers
are README targets. They are not represented by provisional structures or placeholder types.
In particular this file does not assert that a compiling signature implements any target.

The homomorphism predicate extends Mathlib's actual `FormalGroup`. It is independent of
`FormalGroup.Point`, whose parameters are themselves power series. The evaluated elliptic
point carrier and the unconditional Dedekind-completion parameter map are already imported.

Arithmetic reciprocity, when used in the README, sends a uniformizer to arithmetic Frobenius;
a unit acts on Lubin–Tate torsion through its inverse. In the BKO specialization π = -p and
the primed field comparison is Ψ_n = (Ψ'_(n+1))^Δ'. These future carriers are omitted here.
-/

noncomputable section

namespace LubinTateFormalModulesAndQuasiCanonicalLifts

open PowerSeries

section FormalPredicates

variable {R : Type*} [CommRing R]

/-- A zero-constant series intertwining two existing formal laws. README LT.0/formal-hom. -/
def IsHomSeries (F G : FormalGroup R) (h : PowerSeries R) : Prop :=
  h.constantCoeff = 0 ∧
    PowerSeries.subst F.toPowerSeries h =
      G.toPowerSeries.subst
        ![PowerSeries.subst (MvPowerSeries.X (0 : Fin 2)) h,
          PowerSeries.subst (MvPowerSeries.X (1 : Fin 2)) h]

/-- Strictness is a tangent condition; it does not specify a special-fiber marking. -/
def IsStrictCoordinate (h : PowerSeries R) : Prop :=
  h.constantCoeff = 0 ∧ h.coeff 1 = 1

/-- The native coefficient conditions for an admissible π-series.
The local-field hypotheses belong to the existence theorem, rather than this predicate. -/
def IsLubinTateSeries {k : Type*} [CommRing k]
    (red : R →+* k) (π : R) (q : ℕ) (f : PowerSeries R) : Prop :=
  f.constantCoeff = 0 ∧ f.coeff 1 = π ∧ f.map red = PowerSeries.X ^ q

/-- A normalized logarithm, expressed as a homomorphism to the existing additive law. -/
def IsNormalizedLogarithm (F : FormalGroup R) (ℓ : PowerSeries R) : Prop :=
  IsHomSeries F (FormalGroup.𝔾ₐ (R := R)) ℓ ∧ ℓ.coeff 1 = 1

end FormalPredicates

section FormalMilestones

variable {R : Type*} [CommRing R]

/-- The inverse of a homomorphism with unit derivative is a homomorphism.
This is the unbundled coordinate milestone of README LT.0/formal-hom. -/
theorem homSeries_inverse {F G : FormalGroup R} {h : PowerSeries R}
    (hh : IsHomSeries F G h) (hu : IsUnit (h.coeff 1)) :
    ∃ k : PowerSeries R, IsHomSeries G F k ∧
      PowerSeries.subst k h = PowerSeries.X ∧
      PowerSeries.subst h k = PowerSeries.X := by
  sorry

/-- The normalized logarithm exists uniquely over a characteristic-zero field.
The integral and analytic assertions are the separate README targets LT.0/formal-log
and LT.0/analytic-log; this theorem is a formal power-series statement. -/
theorem normalizedLogarithm_existsUnique {K : Type*} [Field K] [CharZero K]
    (F : FormalGroup K) [F.IsComm] :
    ∃! ℓ : PowerSeries K, IsNormalizedLogarithm F ℓ := by
  sorry

end FormalMilestones

section LubinTateMilestones

variable {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [CharZero O] [Finite (IsLocalRing.ResidueField O)]

/-- The one-variable interpolation milestone, with the same uniformizer on both sides.
The finite-arity version used for addition is README LT.1/interpolation. -/
theorem interpolation_existsUnique (π : O)
    (hπ : IsLocalRing.maximalIdeal O = Ideal.span ({π} : Set O)) (hπ0 : π ≠ 0)
    (f g : PowerSeries O)
    (hf : IsLubinTateSeries (IsLocalRing.residue O) π
      (Nat.card (IsLocalRing.ResidueField O)) f)
    (hg : IsLubinTateSeries (IsLocalRing.residue O) π
      (Nat.card (IsLocalRing.ResidueField O)) g) (a : O) :
    ∃! h : PowerSeries O, h.constantCoeff = 0 ∧ h.coeff 1 = a ∧
      PowerSeries.subst h f = PowerSeries.subst g h := by
  sorry

/-- The underlying Lubin–Tate law, before bundling the future formal O-action.
Existence and uniqueness of the commuting endomorphism with each tangent a is included;
the ring-action identities and its carrier are the full README LT.1/lt-module target. -/
theorem lubinTateLaw_existsUnique (π : O)
    (hπ : IsLocalRing.maximalIdeal O = Ideal.span ({π} : Set O)) (hπ0 : π ≠ 0)
    (f : PowerSeries O)
    (hf : IsLubinTateSeries (IsLocalRing.residue O) π
      (Nat.card (IsLocalRing.ResidueField O)) f) :
    ∃! F : FormalGroup O, F.IsComm ∧ IsHomSeries F F f ∧
      ∀ a : O, ∃! h : PowerSeries O,
        IsHomSeries F F h ∧ h.coeff 1 = a ∧
          PowerSeries.subst h f = PowerSeries.subst f h := by
  sorry

end LubinTateMilestones

section HondaMilestone

/-- The normalized scalar Honda logarithm and its sign.
This is the rational-series part of README LT.4/unramified-honda-comparison. Integrality
of its group law and its O-action require the specified unramified coefficient ring and
Honda's Frobenius-semilinear functional-equation theorem, as stated in that target. -/
theorem quadraticHondaLogarithm_existsUnique {K : Type*} [Field K] [CharZero K]
    (p : ℕ) (hp : 2 ≤ p) (s : ℤ) (hs : s = 1 ∨ s = -1) :
    ∃! ℓ : PowerSeries K, ℓ.constantCoeff = 0 ∧ ℓ.coeff 1 = 1 ∧
      PowerSeries.C (p : K) * ℓ -
          PowerSeries.C (s : K) * PowerSeries.subst (PowerSeries.X ^ (p ^ 2)) ℓ =
        PowerSeries.C (p : K) * PowerSeries.X := by
  sorry

end HondaMilestone

/-! ## Checks for the four retained predicates -/

section Checks

/-- The multiplicative multiplication-by-two series is a homomorphism. -/
example : IsHomSeries (FormalGroup.𝔾ₘ (R := ℚ)) (FormalGroup.𝔾ₘ (R := ℚ))
    (((1 : PowerSeries ℚ) + PowerSeries.X) ^ 2 - 1) := by
  sorry

/-- A tempting nonlinear additive coordinate is not an additive homomorphism over Q. -/
example : ¬ IsHomSeries (FormalGroup.𝔾ₐ (R := ℚ)) (FormalGroup.𝔾ₐ (R := ℚ))
    ((PowerSeries.X : PowerSeries ℚ) + PowerSeries.X ^ 2) := by
  sorry

example : IsStrictCoordinate (PowerSeries.X : PowerSeries ℚ) := by
  sorry

/-- Strict does not mean the identity on a characteristic-p special fiber. -/
example (p : ℕ) [Fact p.Prime] :
    IsStrictCoordinate ((PowerSeries.X : PowerSeries (ZMod p)) + PowerSeries.X ^ p) ∧
      IsHomSeries (FormalGroup.𝔾ₐ (R := ZMod p)) (FormalGroup.𝔾ₐ (R := ZMod p))
        (PowerSeries.X + PowerSeries.X ^ p) ∧
      (PowerSeries.X : PowerSeries (ZMod p)) + PowerSeries.X ^ p ≠ PowerSeries.X := by
  sorry

/-- Integral coefficient model of the standard Z_p admissible series. -/
example (p : ℕ) [Fact p.Prime] :
    IsLubinTateSeries (Int.castRingHom (ZMod p)) (p : ℤ) p
      (PowerSeries.C (p : ℤ) * PowerSeries.X + PowerSeries.X ^ p) := by
  sorry

/-- Integral coefficient model of the cyclotomic Z_p admissible series. -/
example (p : ℕ) [Fact p.Prime] :
    IsLubinTateSeries (Int.castRingHom (ZMod p)) (p : ℤ) p
      (((1 : PowerSeries ℤ) + PowerSeries.X) ^ p - 1) := by
  sorry

example : IsNormalizedLogarithm (FormalGroup.𝔾ₐ (R := ℚ))
    (PowerSeries.X : PowerSeries ℚ) := by
  sorry

/-- The tangent normalization rules out twice the additive logarithm. -/
example : ¬ IsNormalizedLogarithm (FormalGroup.𝔾ₐ (R := ℚ))
    (PowerSeries.C (2 : ℚ) * PowerSeries.X) := by
  sorry

end Checks

end LubinTateFormalModulesAndQuasiCanonicalLifts
