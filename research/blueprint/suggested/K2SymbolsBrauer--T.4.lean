import Mathlib
import TauCeti.FieldTheory.FunctionField.Divisor.Eval
import TauCeti.AlgebraicGeometry.EllipticCurve.Affine.FunctionField.Finrank

/-!
# Rational function fields and reciprocity: suggested end statements

**This file is not the roadmap and is not exhaustive.** The definitive document is
the companion reader `K2SymbolsBrauer--T.4.md`. These statements suggest Lean forms
for particular milestones; discharging them finishes neither a layer nor the roadmap.

The two general reciprocity theorems below are unproved targets.
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

/-- The residue argument in the tame factor has order zero, so
`normResidueOrOne` agrees with the genuine residue norm there. This is the
local adapter specified by the reciprocity-evaluation comparison target. -/
theorem tame_argument_ord (P : Place k K) (f g : Kˣ) :
    P.ord ((f ^ P.ord (g : K) * g ^ (-P.ord (f : K)) : Kˣ) : K) = 0 := by
  simp only [Units.val_mul, Units.val_zpow_eq_zpow_val]
  rw [P.ord_mul (zpow_ne_zero _ f.ne_zero) (zpow_ne_zero _ g.ne_zero)]
  simp only [P.ord_zpow]
  ring

/-- Specialize general reciprocity on the native Weierstrass function field.
For an elliptic curve this is the EllipticCurves Layer 2 evaluation milestone;
the pinned function-field instance does not require ellipticity. -/
theorem weierstrass_eval_principal_reciprocity {F : Type*} [Field F]
    (W : WeierstrassCurve.Affine F)
    (f g : W.FunctionFieldˣ)
    (hdisj : Disjoint (Divisor.principal W.isFunctionField f).support
      (Divisor.principal W.isFunctionField g).support) :
    (Divisor.principal W.isFunctionField g).eval f =
      (Divisor.principal W.isFunctionField f).eval g :=
  eval_principal_reciprocity W.isFunctionField f g hdisj

end TauCetiBlueprint.K2RationalReciprocity
