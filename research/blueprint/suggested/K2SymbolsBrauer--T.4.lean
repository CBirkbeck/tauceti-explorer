import TauCeti.FieldTheory.FunctionField.Divisor.Eval
import TauCeti.FieldTheory.FunctionField.Place.RatFunc.Basic
import TauCeti.AlgebraicGeometry.EllipticCurve.Affine.FunctionField.Finrank
import Mathlib.Tactic

/-!
# Rational function fields and reciprocity: suggested end statements

Blueprint only. The two reciprocity theorems below are unproved targets.
The README specifies integral Milnor groups, Bass–Tate exactness, simple norms,
Kato independence, all-extension base change and the residue squares. Their
carriers are not implemented at the atlas pins, so no stand-in carrier or
assumed reciprocity structure is introduced here.

The native factor in the product theorem is written using existing place
orders, residue norms and degrees. Its residue argument has order zero, as
checked below. The sign is already normed to the constant field: its exponent
contains the residue degree. The finite function-field hypothesis is essential
for both degree and determinant norm to have their intended meaning.

Imported target IDs, retained in the predecessor packet:
T.4/leading-coefficient-splitting, /residue-section, /filtration-quotients,
/simple-transfer (its full API and five unit tests are in the README),
/milnor-projection-formula, /restriction-transfer-degree, /transfer-low-degrees,
/transfer-base-change (simple only), /p-closed-generation, /kato-prime-degree,
/prime-degree-residue-on-generated-symbols, /kato-commuting-square,
/projective-line-reciprocity, /valuation-comparison.

Continuation proof targets, indexed in the README and packet:
T.4/degree-filtration-generation, /bass-tate-filtration-assembly,
/prime-to-p-detection, /tower-splitting-formula,
/prime-degree-residue-descent, /constant-extension-completion,
/kato-tower-comparison, /finite-transfer-base-change,
/complete-residue-descent, /finite-normalization-residue,
/integral-curve-reciprocity, /reciprocity-evaluation-compatibility.
-/

open scoped BigOperators Classical
open TauCeti

namespace TauCetiBlueprint.K2RationalReciprocity

variable {k K : Type*} [Field k] [Field K] [Algebra k K]

/-- Degree-two specialization of integral curve reciprocity, in the
uniformizer-last convention. The union includes every possibly nontrivial
factor, even when the divisors meet. -/
theorem weil_reciprocity_product (hK : IsFunctionField k K) (f g : Kˣ) :
    ∏ P ∈ (Divisor.principal hK f).support ∪ (Divisor.principal hK g).support,
      ((-1 : kˣ) ^ ((P.degree : ℤ) * P.ord (f : K) * P.ord (g : K)) *
        P.normResidueOrOne (f ^ P.ord (g : K) * g ^ (-P.ord (f : K)))) = 1 := by
  sorry

/-- General evaluation reciprocity, whose elliptic specialization is the
existing EllipticCurves Layer 2 milestone. -/
theorem eval_principal_reciprocity (hK : IsFunctionField k K) (f g : Kˣ)
    (hdisj : Disjoint (Divisor.principal hK f).support
      (Divisor.principal hK g).support) :
    (Divisor.principal hK g).eval f = (Divisor.principal hK f).eval g := by
  sorry

-- The rational argument of normResidueOrOne in the product theorem is a unit
-- at P. This check prevents a silent use of its default value at a zero/pole.
example (P : Place k K) (f g : Kˣ) :
    P.ord ((f ^ P.ord (g : K) * g ^ (-P.ord (f : K)) : Kˣ) : K) = 0 := by
  simp only [Units.val_mul, Units.val_zpow_eq_zpow_val]
  rw [P.ord_mul (zpow_ne_zero _ f.ne_zero) (zpow_ne_zero _ g.ne_zero)]
  simp only [P.ord_zpow]
  ring

-- Existing evaluation on the zero divisor is the empty product.
example (f : Kˣ) : (0 : Divisor k K).eval f = 1 := by simp

-- Compatibility uses the same native principal divisors and evaluation, with
-- no conversion through a second divisor theory.
example {F : Type*} [Field F] (W : WeierstrassCurve.Affine F)
    (f g : W.FunctionFieldˣ)
    (hdisj : Disjoint (Divisor.principal W.isFunctionField f).support
      (Divisor.principal W.isFunctionField g).support) :
    (Divisor.principal W.isFunctionField g).eval f =
      (Divisor.principal W.isFunctionField f).eval g :=
  eval_principal_reciprocity W.isFunctionField f g hdisj

-- At 0, 2 and infinity for f=t, g=t-2 over ℚ the normed factors are
-- -1/2, 2 and -1. The infinity factor is necessary.
example : (-1 / 2 : ℚ) * 2 * (-1) = 1 := by norm_num

-- For disjoint divisors of t/(t-1) and (t-2)/(t-3), both evaluations are 4/3.
example : ((2 : ℚ) / (3 / 2)) = (2 / 3) / (1 / 2) := by norm_num

-- Degree-zero self-base-change for two independent square roots in
-- characteristic two needs Artinian length 4, not nilpotence index 3.
example : (2 : ℕ) ^ 2 ≠ 2 * 2 - 1 := by norm_num

end TauCetiBlueprint.K2RationalReciprocity
