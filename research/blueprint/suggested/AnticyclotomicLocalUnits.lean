import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.Tactic.NormNum

/-!
# Signed anticyclotomic local units: statements available at the pins

This file is not exhaustive: the roadmap reader is definitive. These statements
suggest names and signatures for contributors and reviewers. The complete
mathematical targets, hypotheses, APIs and tests are in the reader.
The Lubin–Tate tower, its Coleman norm, compact unit limit, signed formal points
and integral modular models are not available at the pins. They remain reader
and packet targets. This file gives light definitions on existing carriers and
algebraic milestones used in ALU.8. It introduces no replacement data structures.

Conventions: p ≥ 5, the unramified quadratic coefficient field, and π = -p.
The trivial character has exponent zero. Unit signs kill opposite conductor
parity; point signs kill the same parity. The π-adic generator needs the
(-1)^n correction to the p-adic generator.
-/

noncomputable section

namespace AnticyclotomicLocalUnits

/-- True denotes plus parity. The input is a conductor exponent, not an order. -/
def plusConductorParity (c : ℕ) : Bool := decide (c % 2 = 0)

/-- The coefficient formula used for δ at zero when the series is a unit.
This is a formula on existing power series, not a construction of Coleman series. -/
def logDerivativeAtZero {K : Type*} [Field K] (f : PowerSeries K) : K :=
  PowerSeries.coeff 1 f / PowerSeries.constantCoeff f

/-- ALU.8: an augmentation-compatible derivative detects a unit power series.
Under a rank-one coordinate X⁻ ≃ O[[T]], this is the generator argument.
Continuity of d alone does not imply the hypothesis haug. -/
theorem isUnit_of_unit_augmentation_derivative
    {R : Type*} [CommRing R]
    (d : PowerSeries R →ₗ[R] R)
    (haug : ∀ f, d f = PowerSeries.constantCoeff f * d 1)
    {f : PowerSeries R} (hu : IsUnit (d f)) : IsUnit f := by
  sorry

/-- ALU.8: the actual plus inclusion splits the minus quotient once it is
surjective and the two submodules have zero intersection. All carriers here
already exist at the pins; no Iwasawa or cohomological construction is assumed. -/
theorem isCompl_of_disjoint_of_quotient_surjective
    {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]
    (P Q : Submodule R M) (hdisjoint : Disjoint P Q)
    (hsurj : Function.Surjective (Q.mkQ.comp P.subtype)) : IsCompl P Q := by
  sorry

-- Conductor tests: 1 has exponent 0, exact order p has exponent 2,
-- and exact order p^2 has exponent 3 in the specified anticyclotomic tower.
example : plusConductorParity 0 = true := by decide
example : plusConductorParity 2 = true := by decide
example : plusConductorParity 3 = false := by decide

-- Three independent coefficient-formula tests.
example : logDerivativeAtZero (PowerSeries.C (7 : ℚ)) = 0 := by
  simp [logDerivativeAtZero]

example : logDerivativeAtZero
    (1 + PowerSeries.C (3 : ℚ) * PowerSeries.X) = 3 := by
  simp [logDerivativeAtZero]

example : logDerivativeAtZero
    (PowerSeries.C (2 : ℚ) + PowerSeries.C (6 : ℚ) * PowerSeries.X) = 3 := by
  norm_num [logDerivativeAtZero]

-- The missing augmentation hypothesis has a concrete obstruction: coefficient
-- extraction at T sends T to 1, although T is not a unit. This is the test for
-- the strengthened reading of Rubin87 Lemma 4.2 (reader E12).
example : PowerSeries.coeff 1 (PowerSeries.X : PowerSeries ℚ) = 1 ∧
    ¬ IsUnit (PowerSeries.X : PowerSeries ℚ) := by
  simp [PowerSeries.isUnit_iff_constantCoeff]

end AnticyclotomicLocalUnits
