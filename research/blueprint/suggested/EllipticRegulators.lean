import Mathlib.Analysis.SpecialFunctions.Elliptic.Weierstrass
import Mathlib.Analysis.Complex.UpperHalfPlane.MoebiusAction
import Mathlib.Analysis.Complex.Periodic
import Mathlib.Analysis.SpecialFunctions.Complex.Log
import Mathlib.NumberTheory.BernoulliPolynomials
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.Algebra.Module.ZLattice.Basic
import Mathlib.Algebra.MonoidAlgebra.MapDomain
import Mathlib.Analysis.Meromorphic.Divisor
import Mathlib.Analysis.Calculus.LogDeriv
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic
import Mathlib.AlgebraicGeometry.EllipticCurve.LFunction
import Mathlib.NumberTheory.GaussSum
import Mathlib.NumberTheory.Harmonic.EulerMascheroni
import Mathlib.NumberTheory.LSeries.DirichletContinuation
import Mathlib.NumberTheory.ModularForms.DedekindEta
import Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
import Mathlib.Analysis.Fourier.ZMod
import Mathlib.Analysis.Fourier.FiniteAbelian.PontryaginDuality
import Mathlib.Analysis.SpecialFunctions.Complex.CircleAddChar
import Mathlib.Analysis.Complex.UpperHalfPlane.Basic
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.GroupTheory.Index
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.Fourier.AddCircle
import Mathlib.Algebra.Module.ZLattice.Summable
import Mathlib.NumberTheory.ZetaValues
import Mathlib.MeasureTheory.Integral.DominatedConvergence
import Mathlib.FieldTheory.RatFunc.AsPolynomial
import Mathlib.Analysis.SpecialFunctions.Complex.LogBounds
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Cotangent
import Mathlib.LinearAlgebra.TensorProduct.Basis
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.StdBasis
import Mathlib.Analysis.SpecialFunctions.Gamma.Deriv
import Mathlib.Analysis.Analytic.Order
import Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass
import Mathlib.LinearAlgebra.Span.Basic
import Mathlib.LinearAlgebra.Prod
import Mathlib.Algebra.Field.Rat
import Mathlib.Algebra.Module.Rat
import Mathlib.Algebra.Group.TypeTags.Basic
import Mathlib.Algebra.Group.TypeTags.Hom
import Mathlib.LinearAlgebra.BilinearForm.Basic
import Mathlib.GroupTheory.FreeAbelianGroup
import Mathlib.Basic.Real.Basic
import Mathlib.AlgebraicGeometry.EllipticCurve.DivisionPolynomial.Basic

/-!
# EllipticRegulators: suggested Lean forms (one file for the parent packet and its parts)

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/EllipticRegulators.md` is definitive. These statements suggest Lean
forms so that contributors and reviewers converge on names and signatures. Every proof is `sorry`,
a planning placeholder: nothing here is claimed formalised, and `implementationStatus` stays
`unchecked`.

## Scope of this file

It joins the suggested file of the parent packet `EllipticRegulators.json` and the eight part
files `EllipticRegulators--ER.1.lean`, ..., `EllipticRegulators--ER.8.lean` (packets
`EllipticRegulators--ER.1.json`, ..., `EllipticRegulators--ER.8.json`), layer by layer: for each
layer ER.n the parent's material comes first (its statements, then its list of items not yet
stated), followed by the ER.n part in its own section, whose docstring keeps the part's scope and
boundary notes and records the namespace change and every replacement made in the join. All
declarations live under the one root namespace `TauCeti.EllipticRegulator`, which the parent and
the ER.1, ER.3, ER.4, ER.5 and ER.8 packets already use; the sub-namespaces `RegulatorPeriods`
(ER.1), `Archimedean` (ER.2), `ER6`, `Modular` (ER.7) and `ER8` are kept, so every packet name
keeps its spelling relative to its sub-namespace. Three packets record a different root: ER.2
(`TauCeti.EllipticRegulators`), ER.6 (`TauCeti.EllipticRegulators.ER6`, whose eleven fully
qualified API and test names carry that prefix) and ER.7 (`EllipticRegulators.Modular`, without
`TauCeti.`, whose 42 API and test names carry that prefix). Their declarations are here as
`TauCeti.EllipticRegulator.Archimedean.*`, `TauCeti.EllipticRegulator.ER6.*` and
`TauCeti.EllipticRegulator.Modular.*`; the packets' namespace fields and qualified names should
follow (handoff note of ASM-EllipticRegulators).

The file imports only Mathlib (pinned 082e2d37e8b0463410cdb532e111cd43d5a66174) because the shared
build has no Tau Ceti object files. The pinned Tau Ceti declarations
(f790474821cf4256814db967cb154e7af3d0c369) that the parts use are named, not imported:
* ER.8: `WeierstrassCurve.Affine.genericX` and `WeierstrassCurve.Affine.genericY` (module
  `TauCeti.AlgebraicGeometry.EllipticCurve.Affine.FunctionField.GenericPoint`) are restated over
  Mathlib's `WeierstrassCurve.Affine.FunctionField` as the stand-ins `ER8.genericX`, `ER8.genericY`;
  `WeierstrassCurve.Affine.isFunctionField`, `TauCeti.Divisor.principal`, `TauCeti.Place.ofPrime`,
  `TauCeti.AlgebraicGeometry.WeilDivisor.ofPoint`, `TauCeti.Place.infinity` and
  `WeierstrassCurve.Affine.CoordinateRing.pointPlace` (through module
  `TauCeti.AlgebraicGeometry.EllipticCurve.Affine.FunctionField.TorsionDivisor`), which Mathlib does
  not have, occur only in a comment block that gives the two declarations needing them verbatim;
  `WeierstrassCurve.zsmul_fromAffine_eq_zero_iff` is cited in a comment.
* ER.5: the ideal-series statements over `TauCeti.NumberTheory.ArithmeticDirichletSeries`
  (`MultiplicativeIdealWeight`, `idealTerm`, `normCoeff`) are a comment block, as in the part file.
* ER.7: `HeckeRing.GL2.Newform` and `UpperHalfPlane.peterssonInner` are named in its docstring.
* Parent: `TauCeti.rouche_windingNumber_comp` and `TauCeti.argumentPrinciple_windingNumber` are
  named in the ER.3 list of items not yet stated.

## Parent packet scope (`EllipticRegulators.json`)

Suppliers by layer (from the parent's fix note FIX-RT-AREA-ktheory-2~2, Codex, 2026-09-30):
ER.1 imports C5/C6; ER.5 imports CM.1/CM.4 with Bloch's maximal-order,
class-number-one E/Q specialization. ER.7 imports Kato L0 units and requests
the early L1 symbol interface, retaining character-specific boundary proofs.
ER.2 imports P.5's generic eta-form and requests an early real-Deligne
interface from a split M.8; the whole late M.8 is not a prerequisite.
ER.6 keeps its potential-good-reduction application of E.6. The functional
equation is conditional outside the supplied E/Q or CM cases.
ER.8 imports the CM class U, E.6 arithmetic models, Coleman L1, and the
periods/exceptional factors from ModularSymbolsPadicLFunctions L1/L2.

BP-EllipticRegulators, revised by the independent review REV-EllipticRegulators:
partial prototype, implementationStatus = unchecked.
Later revisions: FIX-RT-AREA-combinatorics~2 (the Fourier changes; scoped review
REV-FIX-RT-AREA-combinatorics~2, 2026-09-30) and FIX-RT-AREA-ktheory-2~2. The compilation records
of the separate files are superseded by the elaboration of this joined file (end of this
docstring).

Objects that another roadmap owns are not re-planned: the complex uniformisation is
ModularCurvesPartII R12.1's (RS-06), so ER.1 is prototyped on the normalised lattice
`ℤ + τℤ`; η(f, g) is Polylogarithms P.5's and the real Deligne complex MotivicEtaleKTheory
M.8's, so ER.2 is prototyped in coordinates on `ℂ/(ℤ + τℤ)` at `ω = dz`; the Bloch-Wigner
function `D` is Polylogarithms P.1's and is not in a pinned library, so it is a variable,
and statements about it are forms, true once `D` is instantiated by P.1's function; the
modular curve `X₁(N)` is ModularCurvesPartII R12.3's and is absent at the pins, so the
modular units are left out. Nothing below encodes a missing theorem as an assumed
structure field or as a placeholder `Prop`, and no statement is `True`. `sorry` occurs
only as the body of a declaration or as a proof obligation inside one.

Unit tests are `example`s whose docstring begins "Test `<name>`" with the name the packet
gives, or comments `-- Test <name>: not stated; needs …`. An API item or node that cannot
be stated honestly yet is a comment `-- <name>: not stated; needs <missing object>`.
(The part files mark their tests by a comment line with the packet's test name before each
`example`.)

## Elaboration

This joined file was elaborated on 2026-10-06 with `lake env lean` in the shared atlas build at
Mathlib 082e2d3 (wrapper `lean-check`): exit code 0, 343 warnings, every one of them
`declaration uses 'sorry'`; no other warning and no error.
-/

noncomputable section

namespace TauCeti.EllipticRegulator

/-! # Layer ER.1 -/

section ER1

open Complex
open scoped UpperHalfPlane MatrixGroups Real

/-! ## ER.1 — lattice choice and the parameter `q` -/

/-- `ℤ + τℤ` as a Mathlib period pair. Mathlib's `PeriodPair` is not oriented; `τ ∈ ℍ` is. -/
def normalisedPeriodPair (τ : ℍ) : PeriodPair where
  ω₁ := 1
  ω₂ := τ
  indep := sorry

/-- `q = exp(2πiτ)`: Mathlib's `qParam` with period one. -/
abbrev qParameter (τ : ℍ) : ℂ := Function.Periodic.qParam 1 τ

theorem qParameter_norm_lt_one (τ : ℍ) : ‖qParameter τ‖ < 1 := sorry

theorem qParameter_ne_zero (τ : ℍ) : qParameter τ ≠ 0 := sorry

@[simp] theorem qParameter_add_one (τ : ℍ) :
    qParameter (ModularGroup.T • τ) = qParameter τ := sorry

theorem qParameter_real_iff (τ : ℍ) :
    (qParameter τ).im = 0 ↔ ∃ m : ℤ, 2 * (τ : ℂ).re = m := sorry

/-- `ℂ/(ℤ + τℤ) ≃ ℂˣ/q^ℤ`, induced by `z ↦ exp(2πiz)`. -/
def multiplicativePresentation (τ : ℍ) :
    (ℂ ⧸ (normalisedPeriodPair τ).lattice.toAddSubgroup) ≃+
      Additive (ℂˣ ⧸ Subgroup.zpowers (Units.mk0 (qParameter τ) (qParameter_ne_zero τ))) :=
  sorry

/-- Test `q_at_i` (computation). -/
example : qParameter UpperHalfPlane.I = Real.exp (-2 * Real.pi) := sorry

/-- Test `q_eq_qParam` (compatibility). -/
example (τ : ℍ) : qParameter τ = Function.Periodic.qParam 1 τ := rfl

/-- Test `nonreal_q` (non-example): the basis `(γ₁ + 2γ₂, γ₂)` of `y² = x³ - x` gives
`τ' = (2 + i)/5`, whose `q` is not real. -/
example : (cexp (2 * π * I * ((2 + I) / 5))).im ≠ 0 := sorry

end ER1

/-! ### ER.1: items not yet stated (parent)
Each needs an object that no pinned library has, named on its line. -/

-- ER.1/complex-uniformisation: not stated; needs ModularCurvesPartII R12.1's uniformisation of the Weierstrass scheme over ℂ and the homology basis of E(ℂ), neither pinned; the file works on the normalised lattice ℤ + τℤ (`normalisedPeriodPair`).
-- normalisedTau: not stated; needs ModularCurvesPartII R12.1's uniformisation of the Weierstrass scheme over ℂ and the homology basis of E(ℂ), neither pinned; the file works on the normalised lattice ℤ + τℤ (`normalisedPeriodPair`).
-- normalisedUniformisation: not stated; needs ModularCurvesPartII R12.1's uniformisation of the Weierstrass scheme over ℂ and the homology basis of E(ℂ), neither pinned; the file works on the normalised lattice ℤ + τℤ (`normalisedPeriodPair`).
-- normalisedUniformisation_pullback_dz: not stated; needs ModularCurvesPartII R12.1's uniformisation of the Weierstrass scheme over ℂ and the homology basis of E(ℂ), neither pinned; the file works on the normalised lattice ℤ + τℤ (`normalisedPeriodPair`).
-- normalisedUniformisation_indep: not stated; needs ModularCurvesPartII R12.1's uniformisation of the Weierstrass scheme over ℂ and the homology basis of E(ℂ), neither pinned; the file works on the normalised lattice ℤ + τℤ (`normalisedPeriodPair`).
-- normalisedUniformisation_changeOfBasis: not stated; needs ModularCurvesPartII R12.1's uniformisation of the Weierstrass scheme over ℂ and the homology basis of E(ℂ), neither pinned; the file works on the normalised lattice ℤ + τℤ (`normalisedPeriodPair`).
-- normalisedUniformisation_conj: not stated; needs ModularCurvesPartII R12.1's uniformisation of the Weierstrass scheme over ℂ and the homology basis of E(ℂ), neither pinned; the file works on the normalised lattice ℤ + τℤ (`normalisedPeriodPair`).
-- Test tau_of_y2_eq_x3_sub_x: not stated; needs ModularCurvesPartII R12.1's uniformisation of the Weierstrass scheme over ℂ and the homology basis of E(ℂ), neither pinned; the file works on the normalised lattice ℤ + τℤ (`normalisedPeriodPair`).
-- Test tau_negative_discriminant: not stated; needs ModularCurvesPartII R12.1's uniformisation of the Weierstrass scheme over ℂ and the homology basis of E(ℂ), neither pinned; the file works on the normalised lattice ℤ + τℤ (`normalisedPeriodPair`).
-- Test shift_gamma2: not stated; needs ModularCurvesPartII R12.1's uniformisation of the Weierstrass scheme over ℂ and the homology basis of E(ℂ), neither pinned; the file works on the normalised lattice ℤ + τℤ (`normalisedPeriodPair`).
-- Test basis_change_S: not stated; needs ModularCurvesPartII R12.1's uniformisation of the Weierstrass scheme over ℂ and the homology basis of E(ℂ), neither pinned; the file works on the normalised lattice ℤ + τℤ (`normalisedPeriodPair`).
-- Test real_needs_H1plus: not stated; needs ModularCurvesPartII R12.1's uniformisation of the Weierstrass scheme over ℂ and the homology basis of E(ℂ), neither pinned; the file works on the normalised lattice ℤ + τℤ (`normalisedPeriodPair`).

-- ER.1/the-q-parameter-and-the-multiplicative-presentation: not stated; needs the real structure of E (ER.1/all-embeddings-and-the-conjugation-action) or a computation of periods; the q-parameter itself is `qParameter`.
-- multiplicativePresentation_conj: not stated; needs the real structure of E (ER.1/all-embeddings-and-the-conjugation-action) or a computation of periods; the q-parameter itself is `qParameter`.
-- multiplicativePresentation_orientation: not stated; needs the real structure of E (ER.1/all-embeddings-and-the-conjugation-action) or a computation of periods; the q-parameter itself is `qParameter`.
-- Test q_add_one: not stated; needs the real structure of E (ER.1/all-embeddings-and-the-conjugation-action) or a computation of periods; the q-parameter itself is `qParameter`.
-- Test real_points_on_circles: not stated; needs the real structure of E (ER.1/all-embeddings-and-the-conjugation-action) or a computation of periods; the q-parameter itself is `qParameter`.
-- Test negative_q: not stated; needs the real structure of E (ER.1/all-embeddings-and-the-conjugation-action) or a computation of periods; the q-parameter itself is `qParameter`.

-- ER.1/periods-and-the-comparison-isomorphism: not stated; needs the de Rham-Betti comparison (ComplexComparisonPartII C5) and singular H₁ of E(ℂ) with the Hurewicz comparison (gap).

-- ER.1/all-embeddings-and-the-conjugation-action: not stated; needs an elliptic curve over a number field with its complex points at every embedding, which needs R12.1 at each embedding.

section ER1Part

/-! ## ER.1 part (`EllipticRegulators--ER.1.lean`, packet `EllipticRegulators--ER.1.json`)

Join: namespace `TauCeti.EllipticRegulator` (unchanged), with its inner `RegulatorPeriods`. No
replacements. (`RegulatorPeriods.q D` is `Function.Periodic.qParam 1 D.tau`, i.e. the parent's
`qParameter D.tau`; it is a packet name and is kept as stated.)

Scope: ER.1's period choices, beyond the accepted EllipticRegulators packet. Uniformisation is
imported from ModularCurvesPartII:R12.1. C5 supplies proper de Rham--Betti comparison and C6
supplies the actual elliptic Hodge line, integral singular homology and integration pairing.
No field here asserts that an arbitrary pair of complex numbers is the periods of a curve.

The singular-integration supplier request and the geometric part of the imported
 `all-embeddings-and-the-conjugation-action` need those supplier interfaces and are documented
below, without substitute Prop fields. This file prototypes their scalar/embedding consequences.
-/

open Complex
open scoped ComplexConjugate

/-- Periods of a chosen positively oriented integral homology basis, once integration has
 supplied them. Mathlib's PeriodPair does not impose this orientation. -/
structure RegulatorPeriods where
  periods : PeriodPair
  positive : 0 < (periods.ω₂ / periods.ω₁).im

namespace RegulatorPeriods

-- ER.1/oriented-regulator-period-data

def tau (D : RegulatorPeriods) : UpperHalfPlane :=
  ⟨D.periods.ω₂ / D.periods.ω₁, D.positive⟩

def q (D : RegulatorPeriods) : ℂ := Function.Periodic.qParam 1 D.tau

def normalise (D : RegulatorPeriods) (z : ℂ) : ℂ := z / D.periods.ω₁

def square : RegulatorPeriods := by sorry

def scale (D : RegulatorPeriods) (c : ℂ) (hc : c ≠ 0) : RegulatorPeriods := by sorry

theorem ext (D E : RegulatorPeriods) (h₁ : D.periods.ω₁ = E.periods.ω₁)
    (h₂ : D.periods.ω₂ = E.periods.ω₂) : D = E := by sorry

theorem tau_eq (D : RegulatorPeriods) :
    (D.tau : ℂ) = D.periods.ω₂ / D.periods.ω₁ := by sorry

theorem q_eq (D : RegulatorPeriods) :
    D.q = Function.Periodic.qParam 1 D.tau := by sorry

theorem normalise_eq (D : RegulatorPeriods) (z : ℂ) :
    D.normalise z = z / D.periods.ω₁ := by sorry

theorem square_periods : square.periods.ω₁ = 1 ∧ square.periods.ω₂ = I := by sorry

theorem scale_periods (D : RegulatorPeriods) (c : ℂ) (hc : c ≠ 0) :
    (D.scale c hc).periods.ω₁ = c * D.periods.ω₁ ∧
    (D.scale c hc).periods.ω₂ = c * D.periods.ω₂ := by sorry

theorem scale_tau (D : RegulatorPeriods) (c : ℂ) (hc : c ≠ 0) :
    (D.scale c hc).tau = D.tau := by sorry

theorem scale_normalise (D : RegulatorPeriods) (c : ℂ) (hc : c ≠ 0) (z : ℂ) :
    (D.scale c hc).normalise (c * z) = D.normalise z := by sorry

theorem scale_one (D : RegulatorPeriods) : D.scale 1 one_ne_zero = D := by sorry

theorem scale_mul (D : RegulatorPeriods) (c d : ℂ) (hc : c ≠ 0) (hd : d ≠ 0) :
    (D.scale c hc).scale d hd = D.scale (d * c) (mul_ne_zero hd hc) := by sorry

-- RegulatorPeriods.test_square_tau
example : (square.tau : ℂ) = I := by sorry
-- RegulatorPeriods.test_square_q
example : square.q = (Real.exp (-2 * Real.pi) : ℂ) := by sorry
-- RegulatorPeriods.test_scale_identity
example (D : RegulatorPeriods) : D.scale 1 one_ne_zero = D := by sorry
-- RegulatorPeriods.test_q_compatibility
example (D : RegulatorPeriods) : D.q = Function.Periodic.qParam 1 D.tau := by sorry
-- RegulatorPeriods.test_negative_orientation
example : ¬ ∃ D : RegulatorPeriods, D.periods.ω₁ = 1 ∧ D.periods.ω₂ = -I := by sorry

-- ER.1/oriented-basis-transport. The coordinate order is (gamma1,gamma2), and an
-- SL2 matrix (a b; c d) gives (d gamma1+c gamma2,b gamma1+a gamma2).
def rebase (D : RegulatorPeriods) (M : Matrix.SpecialLinearGroup (Fin 2) ℤ) :
    RegulatorPeriods := by sorry

theorem rebase_periods (D : RegulatorPeriods) (M : Matrix.SpecialLinearGroup (Fin 2) ℤ) :
    (D.rebase M).periods.ω₁ = (M 1 1 : ℂ) * D.periods.ω₁ +
      (M 1 0 : ℂ) * D.periods.ω₂ ∧
    (D.rebase M).periods.ω₂ = (M 0 1 : ℂ) * D.periods.ω₁ +
      (M 0 0 : ℂ) * D.periods.ω₂ := by sorry

theorem rebase_one (D : RegulatorPeriods) : D.rebase 1 = D := by sorry

theorem rebase_mul (D : RegulatorPeriods) (M N : Matrix.SpecialLinearGroup (Fin 2) ℤ) :
    (D.rebase N).rebase M = D.rebase (M * N) := by sorry

theorem rebase_lattice (D : RegulatorPeriods) (M : Matrix.SpecialLinearGroup (Fin 2) ℤ) :
    (D.rebase M).periods.lattice = D.periods.lattice := by sorry

theorem rebase_tau (D : RegulatorPeriods) (M : Matrix.SpecialLinearGroup (Fin 2) ℤ) :
    ((D.rebase M).tau : ℂ) =
      ((M 0 0 : ℂ) * (D.tau : ℂ) + (M 0 1 : ℂ)) /
      ((M 1 0 : ℂ) * (D.tau : ℂ) + (M 1 1 : ℂ)) := by sorry

theorem rebase_normalise (D : RegulatorPeriods) (M : Matrix.SpecialLinearGroup (Fin 2) ℤ)
    (z : ℂ) : (D.rebase M).normalise z =
      D.normalise z / ((M 1 0 : ℂ) * (D.tau : ℂ) + (M 1 1 : ℂ)) := by sorry

-- RegulatorPeriods.test_rebase_identity
example (D : RegulatorPeriods) : D.rebase 1 = D := by sorry
-- RegulatorPeriods.test_rebase_inverse
example (D : RegulatorPeriods) (M : Matrix.SpecialLinearGroup (Fin 2) ℤ) :
    (D.rebase M).rebase M⁻¹ = D ∧
    ((D.rebase ModularGroup.S).tau : ℂ) = -1 / (D.tau : ℂ) ∧
    ∀ z : ℂ, (D.rebase ModularGroup.S).normalise z =
      D.normalise z / (D.tau : ℂ) := by sorry
-- RegulatorPeriods.test_rebase_integral_lattice
example (D : RegulatorPeriods) (M : Matrix.SpecialLinearGroup (Fin 2) ℤ) :
    (D.rebase M).periods.lattice = D.periods.lattice ∧
    ((D.rebase ModularGroup.T).tau : ℂ) = (D.tau : ℂ) + 1 ∧
    (∀ z : ℂ, (D.rebase ModularGroup.T).normalise z = D.normalise z) ∧
    (D.rebase ModularGroup.T).q = D.q := by sorry
-- RegulatorPeriods.test_rebase_minus_identity
example (D : RegulatorPeriods) :
    (D.rebase (-1)).tau = D.tau ∧ (D.rebase (-1)).normalise 1 = -D.normalise 1 := by sorry

-- ER.1/conjugate-oriented-periods. Conjugation reverses orientation: negate gamma2,
-- rather than treating the conjugate basis as oriented.
def conjugate (D : RegulatorPeriods) : RegulatorPeriods := by sorry

theorem conjugate_periods (D : RegulatorPeriods) :
    D.conjugate.periods.ω₁ = conj D.periods.ω₁ ∧
    D.conjugate.periods.ω₂ = -conj D.periods.ω₂ := by sorry

theorem conjugate_involutive (D : RegulatorPeriods) : D.conjugate.conjugate = D := by sorry

theorem conjugate_tau (D : RegulatorPeriods) :
    (D.conjugate.tau : ℂ) = -conj (D.tau : ℂ) := by sorry

theorem conjugate_q (D : RegulatorPeriods) : D.conjugate.q = conj D.q := by sorry

theorem conjugate_normalise (D : RegulatorPeriods) (z : ℂ) :
    D.conjugate.normalise (conj z) = conj (D.normalise z) := by sorry

theorem conjugate_lattice (D : RegulatorPeriods) (z : ℂ) :
    z ∈ D.conjugate.periods.lattice ↔ conj z ∈ D.periods.lattice := by sorry

-- RegulatorPeriods.test_conjugate_square
example : square.conjugate = square := by sorry
-- RegulatorPeriods.test_conjugate_twice
example (D : RegulatorPeriods) : D.conjugate.conjugate = D := by sorry
-- RegulatorPeriods.test_conjugate_scalar
example (D : RegulatorPeriods) (c : ℂ) (hc : c ≠ 0) :
    (D.scale c hc).conjugate = D.conjugate.scale (conj c) (by simpa using hc) := by sorry
-- RegulatorPeriods.test_conjugate_not_lower_half_plane
example (D : RegulatorPeriods) :
    0 < (D.conjugate.tau : ℂ).im ∧
    ((square.rebase ModularGroup.T).tau : ℂ) = 1 + I ∧
    ((square.rebase ModularGroup.T).conjugate.tau : ℂ) = -1 + I := by sorry

-- ER.1/real-period-shape. Existence of the real-oriented basis comes from the
-- inherited complex-uniformisation node and C6, not a new uniformisation theorem.
theorem real_period_shape (D : RegulatorPeriods) (m : ℤ)
    (h₁ : conj D.periods.ω₁ = D.periods.ω₁)
    (h₂ : conj D.periods.ω₂ = -D.periods.ω₂ + (m : ℂ) * D.periods.ω₁) :
    2 * (D.tau : ℂ).re = m := by sorry

theorem real_q_sign (D : RegulatorPeriods) (h : (D.tau : ℂ).re = 0 ∨
    (D.tau : ℂ).re = 1 / 2) :
    D.q = (if (D.tau : ℂ).re = 0 then
      (Real.exp (-2 * Real.pi * (D.tau : ℂ).im) : ℂ) else
      -(Real.exp (-2 * Real.pi * (D.tau : ℂ).im) : ℂ)) ∧
    D.q.im = 0 ∧ D.q ≠ 0 ∧ ‖D.q‖ < 1 := by sorry

-- ER.1/primitive-real-regulator-cycles. These are coordinate theorems on the actual
-- integral lattice; geometric interpretation uses the imported singular-period map.
theorem real_conjugation_coordinates (D : RegulatorPeriods) (m u v : ℤ)
    (h₁ : conj D.periods.ω₁ = D.periods.ω₁)
    (h₂ : conj D.periods.ω₂ = -D.periods.ω₂ + (m : ℂ) * D.periods.ω₁) :
    conj ((u : ℂ) * D.periods.ω₁ + (v : ℂ) * D.periods.ω₂) =
    ((u + m * v : ℤ) : ℂ) * D.periods.ω₁ - (v : ℂ) * D.periods.ω₂ := by sorry

theorem positive_cycle_coordinates (m u v : ℤ) :
    (u + m * v = u ∧ -v = v) ↔ v = 0 := by sorry

theorem negative_cycle_coordinates_zero (u v : ℤ) :
    (u = -u ∧ -v = -v) ↔ u = 0 := by sorry

theorem negative_cycle_coordinates_one (u v : ℤ) :
    (u + v = -u ∧ -v = -v) ↔ ∃ k : ℤ, u = -k ∧ v = 2 * k := by sorry

theorem negative_cycle_period_zero (D : RegulatorPeriods) (h : (D.tau : ℂ).re = 0) :
    D.normalise D.periods.ω₂ = ((D.tau : ℂ).im : ℂ) * I := by sorry

theorem negative_cycle_period_one (D : RegulatorPeriods) (h : (D.tau : ℂ).re = 1 / 2) :
    D.normalise (-D.periods.ω₁ + 2 * D.periods.ω₂) =
      2 * ((D.tau : ℂ).im : ℂ) * I := by sorry

theorem eigensublattice_index_two (u v : ℤ) :
    ((∃ a b : ℤ, (u,v) = (a-b,2*b)) ↔ Even v) ∧
    (AddSubgroup.closure ({(1, 0), (-1, 2)} : Set (ℤ × ℤ))).index = 2 := by sorry

-- ER.1/exponential-conjugation-coordinates, also at nonreal embeddings.
theorem exponential_conjugate (z : ℂ) :
    Function.Periodic.qParam 1 (conj z) = (conj (Function.Periodic.qParam 1 z))⁻¹ := by sorry

theorem exponential_neg (z : ℂ) :
    Function.Periodic.qParam 1 (-z) = (Function.Periodic.qParam 1 z)⁻¹ := by sorry

-- ER.1/regulator-period-handoff; these are equalities of period scalars, not a
-- separately chosen comparison matrix or an assertion about an undefined Deligne complex.
theorem regulator_period_handoff (D : RegulatorPeriods) :
    D.normalise D.periods.ω₁ = 1 ∧ D.normalise D.periods.ω₂ = (D.tau : ℂ) ∧
    D.q = Function.Periodic.qParam 1 D.tau ∧ D.q ≠ 0 ∧ ‖D.q‖ < 1 := by sorry

end RegulatorPeriods

-- Imported ER.1/all-embeddings-and-the-conjugation-action: use actual Mathlib embeddings. E_sigma,
-- c_sigma and period integrals are supplied by R12.1/C6. Choosing gamma1_bar=c gamma1,
-- gamma2_bar=-c gamma2 gives D_bar=D.conjugate; q_bar=conj q. At real embeddings
-- retain the real-adapted basis instead of forcing D_bar=D.conjugate.
section Embeddings
-- NumberField.ComplexEmbedding.conjugate and involutive_conjugate already supply
-- coefficient conjugation and its involutivity. They are imported, not redeclared.

theorem paired_embedding_period_q (D E : RegulatorPeriods) (h : E = D.conjugate) :
    (E.tau : ℂ) = -conj (D.tau : ℂ) ∧ E.q = conj D.q := by sorry

end Embeddings

/-
The C6 singular-integration supplier request (geometric contract, omitted Lean signature):
H1_sing(E(C);Z) --integration against omega--> Lambda_omega is a Z-linear isomorphism;
its value on the projection of t |-> t*lambda is lambda. Stage 5 of upstream
AlgebraicTopology supplies torus singular homology and its coordinate generators. Stage 6
supplies the integral intersection pairing. C6 supplies its compatibility with holomorphic
integration and C5's comparison. Neither a deck-group alias for H1 nor arbitrary periods
stored as part of E substitute for this map. The first homology is not available as an
elliptic geometric interface at the pins; there is no honest Lean signature for that map yet.

All-embedding rank: H1 of the disjoint union has rank 2*[K:Q]. At a real place each positive/negative part
has rank one; a pair of nonreal embeddings contributes rank two to each eigenspace. Hence
rank H1^-=r1+2*r2=[K:Q]. This geometric theorem is imported from the parent packet and DJZ
Remark 3.14, not newly encoded with arbitrary vector spaces.
-/

end ER1Part

/-! # Layer ER.2 -/

section ER2

open Complex
open scoped UpperHalfPlane MatrixGroups Real

/-! ## ER.2 in coordinates on `ℂ/Λ` (ω = dz). -/

/-- `∂̄u = ((∂ₓ + i ∂ᵧ) u) / 2` for a real function on `ℂ`. -/
def dbar (u : ℂ → ℝ) (z : ℂ) : ℂ :=
  ((fderiv ℝ u z 1 : ℂ) + I * (fderiv ℝ u z I : ℂ)) / 2

/-- Brunault (1.27) at `ω = dz`: `∫ log|f| dz ∧ ∂̄ log|g| = -2i ∫ log|f| ∂_{z̄} log|g| dx dy`
over a fundamental domain of `Λ` (`Ω^{1,0}` of `ℂ/Λ` is spanned by `dz`). -/
def symbolRegulator (L : PeriodPair) (f g : ℂ → ℂ) : ℂ :=
  -2 * I * ∫ z in ZSpan.fundamentalDomain L.basis,
    (Real.log ‖f z‖ : ℂ) * dbar (fun w => Real.log ‖g w‖) z

/-- Test `const_entry` (degenerate). -/
example (L : PeriodPair) (c : ℂ) (g : ℂ → ℂ) (hg : Meromorphic g)
    (hper : ∀ l ∈ L.lattice, ∀ z, g (z + l) = g z) :
    symbolRegulator L (fun _ => c) g = 0 := sorry

/- test `theta_quotient_value` (computation): for τ = 0.2 + 1.1i and the theta quotients of the
packet test, `‖symbolRegulator (normalisedPeriodPair τ) f g - (-0.1656624 + 0.0350051 * I)‖ < 1e-6`;
θ₁ is expressible through Mathlib's `jacobiTheta₂`. -/

end ER2

/-! ### ER.2: items not yet stated (parent)
Each needs an object that no pinned library has, named on its line. -/

-- ER.2/the-deligne-cohomology-target: not stated; needs the real Deligne complex of MotivicEtaleKTheory M.8 and H¹(E(ℂ), ℝ(1)), neither pinned; the target is used here through `symbolRegulator` at ω = dz.
-- ellipticDeligneTarget: not stated; needs the real Deligne complex of MotivicEtaleKTheory M.8 and H¹(E(ℂ), ℝ(1)), neither pinned; the target is used here through `symbolRegulator` at ω = dz.
-- ellipticDeligneTarget_equivHom: not stated; needs the real Deligne complex of MotivicEtaleKTheory M.8 and H¹(E(ℂ), ℝ(1)), neither pinned; the target is used here through `symbolRegulator` at ω = dz.
-- ellipticDeligneTarget_finrank: not stated; needs the real Deligne complex of MotivicEtaleKTheory M.8 and H¹(E(ℂ), ℝ(1)), neither pinned; the target is used here through `symbolRegulator` at ω = dz.
-- ellipticDeligneTarget_toReal: not stated; needs the real Deligne complex of MotivicEtaleKTheory M.8 and H¹(E(ℂ), ℝ(1)), neither pinned; the target is used here through `symbolRegulator` at ω = dz.
-- ellipticDeligneTarget_toReal_orientation: not stated; needs the real Deligne complex of MotivicEtaleKTheory M.8 and H¹(E(ℂ), ℝ(1)), neither pinned; the target is used here through `symbolRegulator` at ω = dz.
-- Test finrank_over_Q: not stated; needs the real Deligne complex of MotivicEtaleKTheory M.8 and H¹(E(ℂ), ℝ(1)), neither pinned; the target is used here through `symbolRegulator` at ω = dz.
-- Test finrank_over_Qi: not stated; needs the real Deligne complex of MotivicEtaleKTheory M.8 and H¹(E(ℂ), ℝ(1)), neither pinned; the target is used here through `symbolRegulator` at ω = dz.
-- Test not_the_product: not stated; needs the real Deligne complex of MotivicEtaleKTheory M.8 and H¹(E(ℂ), ℝ(1)), neither pinned; the target is used here through `symbolRegulator` at ω = dz.
-- Test real_symbols_land_in_minus: not stated; needs the real Deligne complex of MotivicEtaleKTheory M.8 and H¹(E(ℂ), ℝ(1)), neither pinned; the target is used here through `symbolRegulator` at ω = dz.
-- Test orientation_sign: not stated; needs the real Deligne complex of MotivicEtaleKTheory M.8 and H¹(E(ℂ), ℝ(1)), neither pinned; the target is used here through `symbolRegulator` at ω = dz.

-- ER.2/the-eta-form-and-its-differential-identity: not stated; needs Polylogarithms P.5's η(f, g) as a pinned differential form.

-- ER.2/the-regulator-on-symbols: not stated; needs K₂ of the function field of E (K2SymbolsBrauer T.2) as the domain; the file states the integral formula `symbolRegulator` on pairs of periodic meromorphic functions.
-- symbolRegulator_symbol: not stated; needs K₂ of the function field of E (K2SymbolsBrauer T.2) as the domain; the file states the integral formula `symbolRegulator` on pairs of periodic meromorphic functions.
-- symbolRegulator_steinberg: not stated; needs K₂ of the function field of E (K2SymbolsBrauer T.2) as the domain; the file states the integral formula `symbolRegulator` on pairs of periodic meromorphic functions.
-- symbolRegulator_const: not stated; needs K₂ of the function field of E (K2SymbolsBrauer T.2) as the domain; the file states the integral formula `symbolRegulator` on pairs of periodic meromorphic functions.
-- symbolRegulator_antisymm: not stated; needs K₂ of the function field of E (K2SymbolsBrauer T.2) as the domain; the file states the integral formula `symbolRegulator` on pairs of periodic meromorphic functions.
-- symbolRegulator_eq_half_eta: not stated; needs K₂ of the function field of E (K2SymbolsBrauer T.2) as the domain; the file states the integral formula `symbolRegulator` on pairs of periodic meromorphic functions.
-- symbolRegulator_periods: not stated; needs K₂ of the function field of E (K2SymbolsBrauer T.2) as the domain; the file states the integral formula `symbolRegulator` on pairs of periodic meromorphic functions.
-- symbolRegulator_real: not stated; needs K₂ of the function field of E (K2SymbolsBrauer T.2) as the domain; the file states the integral formula `symbolRegulator` on pairs of periodic meromorphic functions.
-- Test steinberg: not stated; needs K₂ of the function field of E (K2SymbolsBrauer T.2) as the domain; the file states the integral formula `symbolRegulator` on pairs of periodic meromorphic functions.
-- Test theta_quotient_value: not stated; needs K₂ of the function field of E (K2SymbolsBrauer T.2) as the domain; the file states the integral formula `symbolRegulator` on pairs of periodic meromorphic functions.
-- Test not_dc: not stated; needs K₂ of the function field of E (K2SymbolsBrauer T.2) as the domain; the file states the integral formula `symbolRegulator` on pairs of periodic meromorphic functions.
-- Test real_values: not stated; needs K₂ of the function field of E (K2SymbolsBrauer T.2) as the domain; the file states the integral formula `symbolRegulator` on pairs of periodic meromorphic functions.

-- ER.2/the-normalisation-factor: not stated; needs Beilinson's regulator from M.8 and Polylogarithms P.5/regulator-induces-beilinson.

-- ER.2/torsion-ambiguity-has-zero-regulator: not stated; needs K₂ of a number-field curve and its torsion (EllipticKTheory E.3), not pinned.

section ER2Part

/-! ## ER.2 part (`EllipticRegulators--ER.2.lean`, packet `EllipticRegulators--ER.2.json`)

Join: namespace `TauCeti.EllipticRegulators` (the part file and its packet's `library.namespace`)
→ `TauCeti.EllipticRegulator`; the inner namespace `Archimedean` is kept, so the packet names
`Archimedean.*` are unchanged relative to the namespace. No replacements.

ER.2 uses the accepted EllipticRegulators packet and imports generic Deligne
theory from the early M.8 interface and general curve currents from P.5.
Neither API exists at the pinned baseline. We therefore omit the unavailable
geometric conditions and identify each omitted signature below. We do not
replace them by arbitrary cohomology carriers, asserted comparison fields, or
Prop-valued placeholders. The code here is the actual period-coordinate model
after the ER.1 comparison, with Mathlib's eigenspaces and infinite-place count.
It checks the orbit API and the constants; it does not implement that comparison.
-/

namespace Archimedean

/-- ER.1's real-place conjugation matrix in untwisted period coordinates.
For the geometry ε is 0 or 1. The coordinate calculation holds for every real ε. -/
def realConj (ε : ℝ) : Module.End ℝ (ℝ × ℝ) where
  toFun x := (x.1, ε * x.1 - x.2)
  map_add' := by sorry
  map_smul' := by sorry

/-- ER.1's geometric conjugate transport has already identified the second
complex component with the first. Only in those coordinates is conjugation swap. -/
def pairConj : Module.End ℝ ((ℝ × ℝ) × (ℝ × ℝ)) where
  toFun x := (x.2, x.1)
  map_add' := by sorry
  map_smul' := by sorry

abbrev RealMinus (ε : ℝ) := (realConj ε).eigenspace (-1)
abbrev PairMinus := pairConj.eigenspace (-1)
abbrev OrbitModel (R C : Type*) (ε : R → ℝ) :=
  (∀ r, RealMinus (ε r)) × (C → PairMinus)

/-- ER.2/archimedean-orbit-equivalence, after Tate untwisting and ER.1 periods.
The geometric composite needs the missing cohomology comparison, not additional
axioms in this definition. -/
def orbitEquiv {R C : Type*} (ε : R → ℝ) :
    OrbitModel R C ε ≃ₗ[ℝ] ((R → ℝ) × (C → ℝ × ℝ)) := by sorry

theorem orbitEquiv_real {R C : Type*} (ε : R → ℝ)
    (x : OrbitModel R C ε) (r : R) :
    (orbitEquiv ε x).1 r = (x.1 r).val.2 := by sorry

theorem orbitEquiv_complex {R C : Type*} (ε : R → ℝ)
    (x : OrbitModel R C ε) (c : C) :
    (orbitEquiv ε x).2 c = (x.2 c).val.1 := by sorry

theorem orbitEquiv_symm {R C : Type*} (ε : R → ℝ)
    (b : R → ℝ) (u : C → ℝ × ℝ) :
    (∀ r, (((orbitEquiv ε).symm (b,u)).1 r).val = (0,b r)) ∧
    (∀ c, (((orbitEquiv ε).symm (b,u)).2 c).val = (u c,-u c)) := by sorry

theorem orbitEquiv_ext {R C : Type*} (ε : R → ℝ)
    (x y : OrbitModel R C ε) :
    x = y ↔
      (∀ r, (orbitEquiv ε x).1 r = (orbitEquiv ε y).1 r) ∧
      (∀ c, (orbitEquiv ε x).2 c = (orbitEquiv ε y).2 c) := by sorry

theorem real_mem_iff (ε : ℝ) (x : ℝ × ℝ) :
    x ∈ (realConj ε).eigenspace (-1) ↔ x.1 = 0 := by sorry

theorem pair_mem_iff (x : (ℝ × ℝ) × (ℝ × ℝ)) :
    x ∈ pairConj.eigenspace (-1) ↔ x.2 = -x.1 := by sorry

-- Test Archimedean.rectangular_real
example :
    (0,1) ∈ (realConj 0).eigenspace (-1) ∧
    (∀ h : (0,1) ∈ (realConj 0).eigenspace (-1),
      (orbitEquiv (R := Unit) (C := Empty) (fun _ => 0)
        (fun _ => ⟨(0,1),h⟩, fun c => nomatch c)).1 () = 1) ∧
    (1,0) ∉ (realConj 0).eigenspace (-1) := by sorry

-- Test Archimedean.tilted_real
example :
    (∀ b : ℝ, (0,b) ∈ (realConj 1).eigenspace (-1)) ∧
    (1,0) ∉ (realConj 1).eigenspace (-1) := by sorry

-- Test Archimedean.complex_pair
example :
    ((1,2),(-1,-2)) ∈ pairConj.eigenspace (-1) ∧
    (∀ h : ((1,2),(-1,-2)) ∈ pairConj.eigenspace (-1),
      (orbitEquiv (R := Empty) (C := Unit) (fun r => nomatch r)
        ((fun r => nomatch r),fun _ => ⟨((1,2),(-1,-2)),h⟩)).2 () = (1,2)) ∧
    ((1,0),(-1,0)) ∈ pairConj.eigenspace (-1) ∧
    ((0,1),(0,-1)) ∈ pairConj.eigenspace (-1) ∧
    (∀ a b : ℝ,
      a • (((1,0),(-1,0)) : (ℝ × ℝ) × (ℝ × ℝ)) +
      b • (((0,1),(0,-1)) : (ℝ × ℝ) × (ℝ × ℝ)) = 0 → a=0 ∧ b=0) := by sorry

-- Test Archimedean.empty_orbits
example :
    ∀ x : OrbitModel Empty Empty (fun r => nomatch r),
      x = 0 ∧ (orbitEquiv (C := Empty) (fun r : Empty => nomatch r)).symm (0,0) = 0 := by sorry

-- Test Archimedean.invariant_pair_fails
example :
    pairConj (((1,2),(1,2)) : (ℝ × ℝ) × (ℝ × ℝ)) = ((1,2),(1,2)) ∧
    ((1,2),(1,2)) ∉ pairConj.eigenspace (-1) := by sorry

/-- ER.2/archimedean-rank-from-orbits: linear-algebra part. -/
theorem archimedean_rank {R C : Type*} [Fintype R] [Fintype C] (ε : R → ℝ) :
    Module.finrank ℝ (OrbitModel R C ε) = Fintype.card R + 2 * Fintype.card C := by sorry

/-- The arithmetic step uses the pinned theorem, not a new number-field API. -/
example (F : Type*) [Field F] [NumberField F] :
    NumberField.InfinitePlace.nrRealPlaces F +
      2 * NumberField.InfinitePlace.nrComplexPlaces F = Module.finrank ℚ F := by sorry

end Archimedean

/-! ER.2/elliptic-deligne-specialisation-contract:
`elliptic_deligne_specialisation` is not stated: needs early M.8's actual Deligne
complex/hypercohomology and C5's geometric H¹ comparison, including conjugation
and cup/trace compatibility. On a curve Ω^{≥2}=0, so F²=0. Its required
signature is the real linear equivalence of H²_D(E_R,R(2)) with the geometric
minus eigenspace of H¹(⊔σ Eσ(C),R(1)), induced by the exact sequence with F²=0.
Coefficient conjugation composed with geometric c* must become -c* on R(1).

ER.2/chern-character-symbol-comparison:
`chern_character_symbol_comparison` is not stated: needs actual K₂(E), its
restriction, Deligne cup product and P.5 current comparison. Required equality:
under the accepted wedge equivalence, r_D(γ)(ω) = 2 r_E(res γ)(ω), componentwise
at all embeddings, with symbol representative iη and positive unit cup product.
The following local coefficient calculation is its π₁/i check, not its missing
cohomological theorem. No generic regulator is postulated here.
-/

private def imaginaryProjection (z : ℂ) : ℂ := (z - star z) / 2

private def cupCoefficient (lf lg : ℝ) (df dg : ℂ) : ℂ :=
  (lf : ℂ) * imaginaryProjection dg - (lg : ℂ) * imaginaryProjection df

theorem cupCoefficient_eq_i_eta (lf lg : ℝ) (df dg : ℂ) :
    cupCoefficient lf lg df dg = Complex.I * ((lf * dg.im - lg * df.im : ℝ) : ℂ) := by sorry

-- A nonzero coefficient rules out dropping i or inserting an extra 2π.
example : cupCoefficient 1 0 0 Complex.I = Complex.I := by sorry

/-! ER.2/oriented-period-coordinate-comparison:
`oriented_period_coordinate_comparison` is not stated on actual cohomology:
needs ER.1's geometric homology/intersection/period pairing and early M.8/P.5.
Required equality is toReal(ν)=-2π a(γ₂), where ν=2πi a and a(γ₊)=0;
for ν=[iη(res γ)] it is -∮γ₂η=2 Im(r_E(res γ)(ω₀)). The accepted definition
`ellipticDeligneTarget_toReal` is reused, not redefined below. These are its
period-chart computations. W uses ν∧ω, γ₊·γ₂=1, and ω₀(γ₊)=1.
-/

private def wedgePeriods (ν₁ ν₂ ω₁ ω₂ : ℂ) : ℂ := ν₁ * ω₂ - ν₂ * ω₁

theorem wedgePeriods_minus (b τ : ℂ) : wedgePeriods 0 b 1 τ = -b := by sorry

theorem tate_period_coordinate (b : ℝ) (τ : ℂ) :
    Complex.imCLM (wedgePeriods 0 (2 * Real.pi * Complex.I * b) 1 τ) =
      -2 * Real.pi * b := by sorry

theorem regulator_period_coordinate (t : ℝ) :
    2 * ((-Complex.I / 2) * (t : ℂ)).im = -t := by sorry

theorem scaled_pairing_coordinate (t : ℝ) :
    (-Complex.I * (t : ℂ)) / (2 * Real.pi * Complex.I) =
      ((-t / (2 * Real.pi) : ℝ) : ℂ) := by sorry

-- Acceptance: untwisted transverse period1 gives -2π; η-period1 gives -1.
example :
    Complex.imCLM (wedgePeriods 0 (2 * Real.pi * Complex.I) 1 Complex.I) =
      -2 * Real.pi ∧ 2 * (-Complex.I / 2).im = -1 := by sorry

-- Acceptance: integral shear of γ₂ does not change its value when ν(γ₊)=0.
example (b τ : ℂ) (n : ℤ) : wedgePeriods 0 b 1 (τ + n) = wedgePeriods 0 b 1 τ := by sorry

-- Acceptance: reverse γ₊, γ₂ and ω₀ together, preserving intersection+1.
example (b τ : ℂ) : wedgePeriods 0 (-b) 1 τ = -wedgePeriods 0 b 1 τ := by sorry

-- Non-example: the transverse-only formula fails for a plus period.
example : wedgePeriods 1 0 1 Complex.I ≠ -(0 : ℂ) := by sorry

-- Reused torsion-ambiguity node: actual K₂ lift statement needs E.3 types.
-- This checks its torsion-killing step against an actual real vector space.
example {A V : Type*} [AddCommGroup A] [AddCommGroup V] [Module ℝ V]
    (r : A →+ V) (x : A) (n : ℕ) (hn : n ≠ 0) (hx : n • x = 0) :
    r x = 0 := by sorry

end ER2Part

/-! # Layer ER.3 -/

/-! ## ER.3 — `D` is Polylogarithms P.1's Bloch–Wigner function. It is not in a pinned
library, so it is an explicit argument and each lemma assumes only what it uses. -/

section ER3

open Complex
open scoped UpperHalfPlane MatrixGroups Real

variable (D : ℂ → ℝ)

/-- `D_q(x) = ∑_{n ∈ ℤ} D(x qⁿ)` (Bloch Lemma 8.1.1, Brunault (1.38)). -/
def ellipticDilog (q x : ℂ) : ℝ := ∑' n : ℤ, D (x * q ^ n)

/-- Bloch's `J(x) = log|x| log|1 - x|`. -/
def blochJ₀ (x : ℂ) : ℝ := Real.log ‖x‖ * Real.log ‖1 - x‖

/-- Bloch's companion (8.1.4). NOT a function on `E`: see `blochJ_mul_q`. -/
def blochJ (q x : ℂ) : ℝ :=
  (∑' n : ℕ, blochJ₀ (x * q ^ n)) - ∑' n : ℕ, blochJ₀ (x⁻¹ * q ^ (n + 1))

/-- The `q`-invariant regularisation (Zagier 1990, p. 616; Bloch Lemma 10.2.2). -/
def ellipticJ (q x : ℂ) : ℝ :=
  blochJ q x + Real.log ‖q‖ ^ 2 / 3 *
    Polynomial.aeval (Real.log ‖x‖ / Real.log ‖q‖) (Polynomial.bernoulli 3)

/-- Bloch's convention `R_q = J + i D_q` (8.1.2). Brunault's `2 R_ω(P, 0)` is `-conj (R_q x)`. -/
def ellipticR (q x : ℂ) : ℂ := (ellipticJ q x : ℂ) + (ellipticDilog D q x : ℂ) * I

theorem ellipticDilog_mul_q (hD : Continuous D) {q x : ℂ} (hq₀ : q ≠ 0) (hq : ‖q‖ < 1)
    (hx : x ≠ 0) : ellipticDilog D q (q * x) = ellipticDilog D q x := sorry

theorem ellipticDilog_inv (hD : ∀ z, D z⁻¹ = -D z) {q x : ℂ} (hq₀ : q ≠ 0) (hq : ‖q‖ < 1) :
    ellipticDilog D q x⁻¹ = -ellipticDilog D q x := sorry

theorem blochJ_mul_q {q x : ℂ} (hq₀ : q ≠ 0) (hq : ‖q‖ < 1) (hx : x ≠ 0) :
    blochJ q (q * x) - blochJ q x = -Real.log ‖x‖ ^ 2 := sorry

theorem ellipticJ_mul_q {q x : ℂ} (hq₀ : q ≠ 0) (hq : ‖q‖ < 1) (hx : x ≠ 0) :
    ellipticJ q (q * x) = ellipticJ q x := sorry

theorem ellipticR_im (q x : ℂ) : (ellipticR D q x).im = ellipticDilog D q x := sorry

/-- ER.3/lattice-basis-change: `R_{γτ}(e^{2πi z/(cτ+d)}) = R_τ(e^{2πi z}) / (c τ̄ + d)`. -/
theorem ellipticR_smul (hD : ∀ z, D z⁻¹ = -D z) (γ : SL(2, ℤ)) (τ : ℍ) (z : ℂ) :
    ellipticR D (qParameter (γ • τ)) (cexp (2 * π * I * z / ((γ 1 0 : ℂ) * τ + γ 1 1))) =
      ellipticR D (qParameter τ) (cexp (2 * π * I * z)) /
        ((γ 1 0 : ℂ) * (starRingEnd ℂ) (τ : ℂ) + γ 1 1) := sorry

/-- Test `blochJ_not_invariant` (non-example): `J_q(qx) - J_q(x) = -(log|x|)² ≠ 0` for `|x| ≠ 1`. -/
example {q x : ℂ} (hq₀ : q ≠ 0) (hq : ‖q‖ < 1) (hx : ‖x‖ ≠ 1) (hx₀ : x ≠ 0) :
    blochJ q (q * x) ≠ blochJ q x := sorry

/-- Test `real_locus` (degenerate): for real `q` and `|x| = 1`, `J(q; x) = 0`. -/
example {q x : ℂ} (hq₀ : q ≠ 0) (hq : ‖q‖ < 1) (hqr : q.im = 0) (hx : ‖x‖ = 1) :
    ellipticJ q x = 0 := sorry

end ER3

/-! ### ER.3: items not yet stated (parent)
Each needs an object that no pinned library has, named on its line. -/

-- ER.3/the-elliptic-dilogarithm: not stated; needs Polylogarithms P.1's Bloch-Wigner function as a pinned declaration (it is the variable `D` here, so value tests cannot be stated).
-- ellipticDilog_converges: not stated; needs Polylogarithms P.1's Bloch-Wigner function as a pinned declaration (it is the variable `D` here, so value tests cannot be stated).
-- ellipticDilog_continuous: not stated; needs Polylogarithms P.1's Bloch-Wigner function as a pinned declaration (it is the variable `D` here, so value tests cannot be stated).
-- ellipticDilog_conj: not stated; needs Polylogarithms P.1's Bloch-Wigner function as a pinned declaration (it is the variable `D` here, so value tests cannot be stated).
-- ellipticDilog_distribution: not stated; needs Polylogarithms P.1's Bloch-Wigner function as a pinned declaration (it is the variable `D` here, so value tests cannot be stated).
-- ellipticDilog_real: not stated; needs Polylogarithms P.1's Bloch-Wigner function as a pinned declaration (it is the variable `D` here, so value tests cannot be stated).
-- ellipticDilog_orientation_sign: not stated; needs Polylogarithms P.1's Bloch-Wigner function as a pinned declaration (it is the variable `D` here, so value tests cannot be stated).
-- Test value_at_i: not stated; needs Polylogarithms P.1's Bloch-Wigner function as a pinned declaration (it is the variable `D` here, so value tests cannot be stated).
-- Test vanishing: not stated; needs Polylogarithms P.1's Bloch-Wigner function as a pinned declaration (it is the variable `D` here, so value tests cannot be stated).
-- Test distribution_two: not stated; needs Polylogarithms P.1's Bloch-Wigner function as a pinned declaration (it is the variable `D` here, so value tests cannot be stated).
-- Test one_sided_not_invariant: not stated; needs Polylogarithms P.1's Bloch-Wigner function as a pinned declaration (it is the variable `D` here, so value tests cannot be stated).
-- Test brunault_fourier: not stated; needs Polylogarithms P.1's Bloch-Wigner function as a pinned declaration (it is the variable `D` here, so value tests cannot be stated).

-- ER.3/the-companion-and-Bloch-convention: not stated; needs Polylogarithms P.1's Bloch-Wigner function and divisors with permitted lifts; the functions themselves are `blochJ`, `ellipticJ`, `ellipticR`.
-- blochJ_divisor: not stated; needs Polylogarithms P.1's Bloch-Wigner function and divisors with permitted lifts; the functions themselves are `blochJ`, `ellipticJ`, `ellipticR`.
-- ellipticJ_eq_blochJ_of_permitted: not stated; needs Polylogarithms P.1's Bloch-Wigner function and divisors with permitted lifts; the functions themselves are `blochJ`, `ellipticJ`, `ellipticR`.
-- ellipticJ_inv: not stated; needs Polylogarithms P.1's Bloch-Wigner function and divisors with permitted lifts; the functions themselves are `blochJ`, `ellipticJ`, `ellipticR`.
-- ellipticR_re: not stated; needs Polylogarithms P.1's Bloch-Wigner function and divisors with permitted lifts; the functions themselves are `blochJ`, `ellipticJ`, `ellipticR`.
-- ellipticJ_eq_zero_of_real: not stated; needs Polylogarithms P.1's Bloch-Wigner function and divisors with permitted lifts; the functions themselves are `blochJ`, `ellipticJ`, `ellipticR`.
-- Test two_sided_diverges: not stated; needs Polylogarithms P.1's Bloch-Wigner function and divisors with permitted lifts; the functions themselves are `blochJ`, `ellipticJ`, `ellipticR`.
-- Test ellipticJ_invariant: not stated; needs Polylogarithms P.1's Bloch-Wigner function and divisors with permitted lifts; the functions themselves are `blochJ`, `ellipticJ`, `ellipticR`.
-- Test value: not stated; needs Polylogarithms P.1's Bloch-Wigner function and divisors with permitted lifts; the functions themselves are `blochJ`, `ellipticJ`, `ellipticR`.
-- Test permitted_lift: not stated; needs Polylogarithms P.1's Bloch-Wigner function and divisors with permitted lifts; the functions themselves are `blochJ`, `ellipticJ`, `ellipticR`.

-- ER.3/the-steinberg-relation-by-truncation: not stated; needs K₂ of the function field of E (K2SymbolsBrauer T.2/matsumoto) and Bloch's truncation estimates (the lemma nodes of ER.3).

-- ER.3/fourier-and-kronecker-eisenstein: not stated; needs Fourier series on the torus ℂ/Λ with conditional convergence, and the Bloch-Wigner function as a pinned declaration.

-- ER.3/bloch-wigner-bounds-at-zero: not stated; needs Polylogarithms P.1's Bloch-Wigner function as a pinned declaration.

-- ER.3/green-function-of-the-curve: not stated; needs the Arakelov Green kernel of GrossZagierAndArithmeticHeights GZ.2 and distributions on ℂ/Λ, neither pinned.
-- greenFunction: not stated; needs the Arakelov Green kernel of GrossZagierAndArithmeticHeights GZ.2 and distributions on ℂ/Λ, neither pinned.
-- greenFunction_fourier: not stated; needs the Arakelov Green kernel of GrossZagierAndArithmeticHeights GZ.2 and distributions on ℂ/Λ, neither pinned.
-- greenFunction_translate: not stated; needs the Arakelov Green kernel of GrossZagierAndArithmeticHeights GZ.2 and distributions on ℂ/Λ, neither pinned.
-- greenFunction_closedForm: not stated; needs the Arakelov Green kernel of GrossZagierAndArithmeticHeights GZ.2 and distributions on ℂ/Λ, neither pinned.
-- greenFunction_logAbs: not stated; needs the Arakelov Green kernel of GrossZagierAndArithmeticHeights GZ.2 and distributions on ℂ/Λ, neither pinned.
-- greenFunction_eq_arakelov: not stated; needs the Arakelov Green kernel of GrossZagierAndArithmeticHeights GZ.2 and distributions on ℂ/Λ, neither pinned.
-- Test integral_zero: not stated; needs the Arakelov Green kernel of GrossZagierAndArithmeticHeights GZ.2 and distributions on ℂ/Λ, neither pinned.
-- Test closed_form_value: not stated; needs the Arakelov Green kernel of GrossZagierAndArithmeticHeights GZ.2 and distributions on ℂ/Λ, neither pinned.
-- Test laplacian: not stated; needs the Arakelov Green kernel of GrossZagierAndArithmeticHeights GZ.2 and distributions on ℂ/Λ, neither pinned.
-- Test not_absolutely_convergent: not stated; needs the Arakelov Green kernel of GrossZagierAndArithmeticHeights GZ.2 and distributions on ℂ/Λ, neither pinned.
-- Test arakelov: not stated; needs the Arakelov Green kernel of GrossZagierAndArithmeticHeights GZ.2 and distributions on ℂ/Λ, neither pinned.

-- ER.3/goncharov-function-and-the-regulator: not stated; needs the Green function of ER.3/green-function-of-the-curve.

-- ER.3/steinberg-relation-on-the-projective-line: not stated; needs Polylogarithms P.1's Bloch-Wigner function and P.5's projective-line identities.

-- ER.3/truncated-theta-products: not stated; needs the truncated theta products of Bloch's Lecture 8 with their zero counts (Tau Ceti's Rouché and argument principle, not imported).

-- ER.3/zeros-of-truncated-products: not stated; needs Tau Ceti's `TauCeti.rouche_windingNumber_comp` and `TauCeti.argumentPrinciple_windingNumber` (not imported).

-- ER.3/companion-truncation-estimates: not stated; needs the truncated theta products of Bloch's Lecture 8.

-- ER.3/steinberg-for-the-companion: not stated; needs K₂ of the function field of E and the truncation estimates.

-- ER.3/steinberg-for-the-dilogarithm: not stated; needs K₂ of the function field of E and the truncation estimates.

section ER3Part

/-! ## ER.3 part (`EllipticRegulators--ER.3.lean`, packet `EllipticRegulators--ER.3.json`)

Join: namespace `TauCeti.EllipticRegulator` (unchanged). Replacement: in
`complex_fourier_coefficients` the part's local `let` copies of the parent's objects are bound to
the parent's declarations: `orbitD := fun x => ∑' r : ℤ, D (x * q ^ r)` is `ellipticDilog D q`
(the same series), and `orbitJ := fun x => (∑' r, J₀ (x * q ^ r)) - (∑' r, J₀ (q ^ (r + 1) / x)) +
(log ‖q‖) ^ 2 / 3 * bernoulliFun 3 (log ‖x‖ / log ‖q‖)` with `J₀ w = log ‖w‖ * log ‖1 - w‖` is
`ellipticJ q` (`blochJ₀`, `blochJ`, and `Polynomial.aeval t (Polynomial.bernoulli 3) =
bernoulliFun 3 t`); the auxiliary `let ordinaryJ` (the parent's `blochJ₀`) is dropped. The
`let q` stays, because `τ : ℂ` here while the parent's `qParameter` takes `τ : ℍ`.

This part adds four declarations to the reviewed parent ER.3. The parent's Dq, Bloch companion,
 regularised companion, annulus truncation, both Steinberg limits, basis change, Green kernel
 and regulator pairing keep their original owners and prototypes in EllipticRegulators.lean.
 They are not copied or represented by substitute Prop-valued structures here.

The ordinary Bloch–Wigner function is a parameter with its concrete unit-disc formula,
 continuity and inversion hypotheses: Polylogarithms P.1 supplies precisely these inputs.
 Coordinate let expressions below specify the already owned orbit sums without redefining
 a competing elliptic dilogarithm. The finite-factor projective-line signature represents
 the generic K != 0,1 case; the roadmap records the exceptional-constant limit as a gap.

GZ.2's normalized Green-kernel request and the Gaussian pairing convergence gap cannot yet
 be expressed against a supplied geometric interface. Those signatures are omitted here;
 the definitive document states the exact obligations, with no substitute assertion field.
-/

open Complex MeasureTheory Filter
open scoped ComplexConjugate Topology BigOperators

-- Packet node (marker added in the join): ER.3/weight-two-kronecker-kernel
/-- The zero-extended summand with character exp(2πi(mb-na)). -/
def kroneckerTerm (τ : ℂ) (a b : ℝ) (v : ℤ × ℤ) : ℂ := by sorry

lemma kroneckerTerm_zero (τ : ℂ) (a b : ℝ) :
    kroneckerTerm τ a b (0, 0) = 0 := by sorry

lemma kroneckerTerm_eq (τ : ℂ) (a b : ℝ) (v : ℤ × ℤ) (hv : v ≠ (0, 0)) :
    kroneckerTerm τ a b v =
      Complex.exp (2 * (Real.pi : ℂ) * I * ((v.1 : ℂ) * b - (v.2 : ℂ) * a)) /
        (((v.1 : ℂ) + (v.2 : ℂ) * τ) ^ 2 *
          ((v.1 : ℂ) + (v.2 : ℂ) * conj τ)) := by sorry

lemma kroneckerTerm_norm (τ : ℂ) (hy : 0 < τ.im) (a b : ℝ)
    (v : ℤ × ℤ) (hv : v ≠ (0, 0)) :
    ‖kroneckerTerm τ a b v‖ = (‖(v.1 : ℂ) + (v.2 : ℂ) * τ‖ ^ 3)⁻¹ := by sorry

lemma kroneckerTerm_neg_index (τ : ℂ) (a b : ℝ) (m n : ℤ) :
    kroneckerTerm τ a b (-m, -n) =
      -conj (Complex.exp (2 * (Real.pi : ℂ) * I * ((m : ℂ) * b - (n : ℂ) * a))) /
        (((m : ℂ) + (n : ℂ) * τ) ^ 2 * ((m : ℂ) + (n : ℂ) * conj τ)) := by sorry

lemma kroneckerTerm_neg_point (τ : ℂ) (a b : ℝ) (m n : ℤ) :
    kroneckerTerm τ (-a) (-b) (m, n) = -kroneckerTerm τ a b (-m, -n) := by sorry

lemma kroneckerTerm_add_int_left (τ : ℂ) (a b : ℝ) (k : ℤ) (v : ℤ × ℤ) :
    kroneckerTerm τ (a + k) b v = kroneckerTerm τ a b v := by sorry

lemma kroneckerTerm_add_int_right (τ : ℂ) (a b : ℝ) (k : ℤ) (v : ℤ × ℤ) :
    kroneckerTerm τ a (b + k) v = kroneckerTerm τ a b v := by sorry

lemma kroneckerTerm_circle (τ : ℂ) (a b : ℝ) (v : ℤ × ℤ) (hv : v ≠ (0, 0)) :
    kroneckerTerm τ a b v =
      @fourier 1 (-v.2) (a : AddCircle (1 : ℝ)) * @fourier 1 v.1 (b : AddCircle (1 : ℝ)) /
        (((v.1 : ℂ) + (v.2 : ℂ) * τ) ^ 2 *
          ((v.1 : ℂ) + (v.2 : ℂ) * conj τ)) := by sorry

-- kernel_zero_index
example : kroneckerTerm I 0 0 (0, 0) = 0 := by sorry

-- kernel_real_axis
example : kroneckerTerm I 0 0 (1, 0) = 1 := by sorry

-- kernel_imaginary_axis
example : kroneckerTerm I 0 0 (0, 1) = -I := by sorry

-- kernel_quarter_phase
example : kroneckerTerm I (1 / 4) 0 (0, 1) = -1 := by sorry

-- kernel_circle_character
example : kroneckerTerm I 0 (1 / 4) (1, 0) =
    @fourier 1 1 ((1 / 4 : ℝ) : AddCircle (1 : ℝ)) ∧
    @fourier 1 1 ((1 / 4 : ℝ) : AddCircle (1 : ℝ)) = I := by sorry

-- kernel_not_green
example : kroneckerTerm I 0 0 (2, 0) = (1 / 8 : ℂ) ∧
    kroneckerTerm I 0 0 (2, 0) ≠ (1 / 4 : ℂ) := by sorry

-- Packet node (marker added in the join): ER.3/complex-fourier-coefficient-calculation
/-- Direct Fourier coefficients. The `let` expressions specify the imported Dq and J(q;x);
 in this file they are the parent's `ellipticDilog D q` and `ellipticJ q`.
 The disc formula, continuity and inversion identify the parameter D with P.1's function.
 The normalized double integral has character conjugate exp(2πi(mb-na)). -/
theorem complex_fourier_coefficients
    (τ : ℂ) (hy : 0 < τ.im) (D : ℂ → ℝ)
    (hD_cont : Continuous D) (hD_zero : D 0 = 0) (hD_one : D 1 = 0)
    (hD_inv : ∀ w : ℂ, w ≠ 0 → D w⁻¹ = -D w)
    (hD_disc : ∀ w : ℂ, w ≠ 0 → ‖w‖ < 1 →
      D w = (∑' k : ℕ, w ^ (k + 1) / ((k + 1 : ℂ) ^ 2)).im +
        Real.log ‖w‖ * (Complex.log (1 - w)).im) :
    let q := Complex.exp (2 * (Real.pi : ℂ) * I * τ)
    let orbitD : ℂ → ℝ := ellipticDilog D q
    let orbitJ : ℂ → ℝ := ellipticJ q
    ∀ m n : ℤ,
      (∫ b in (0 : ℝ)..1, ∫ a in (0 : ℝ)..1,
        let x := Complex.exp (2 * (Real.pi : ℂ) * I * ((a : ℂ) + (b : ℂ) * τ))
        ((orbitD x : ℂ) - I * (orbitJ x : ℂ)) *
          Complex.exp (-2 * (Real.pi : ℂ) * I * ((m : ℂ) * b - (n : ℂ) * a))) =
      if (m, n) = (0, 0) then 0
      else -(τ.im : ℂ) ^ 2 /
        ((Real.pi : ℂ) * ((m : ℂ) + (n : ℂ) * τ) ^ 2 *
          ((m : ℂ) + (n : ℂ) * conj τ)) := by sorry

-- Packet node (marker added in the join): ER.3/complex-fourier-reconstruction
/-- Fourier reconstruction against the two baseline unit-circle Fourier bases.
 `hcoeff` is the output of the preceding coefficient calculation, not an assumed target
 equality. This signature separates that output from the summability/uniqueness step. -/
theorem complex_fourier_reconstruction
    (τ : ℂ) (hy : 0 < τ.im) (F : C(AddCircle (1 : ℝ) × AddCircle (1 : ℝ), ℂ))
    (hcoeff : ∀ m n : ℤ,
      (∫ b : AddCircle (1 : ℝ), ∫ a : AddCircle (1 : ℝ),
        F (a, b) * @fourier 1 n a * @fourier 1 (-m) b
          ∂AddCircle.haarAddCircle ∂AddCircle.haarAddCircle) =
      if (m, n) = (0, 0) then 0
      else -(τ.im : ℂ) ^ 2 /
        ((Real.pi : ℂ) * ((m : ℂ) + (n : ℂ) * τ) ^ 2 *
          ((m : ℂ) + (n : ℂ) * conj τ))) :
    TendstoUniformly
      (fun s : Finset (ℤ × ℤ) => fun p : ℝ × ℝ =>
        ∑ v ∈ s, kroneckerTerm τ p.1 p.2 v)
      (fun p : ℝ × ℝ => ∑' v : ℤ × ℤ, kroneckerTerm τ p.1 p.2 v) atTop ∧
    ∀ a b : ℝ,
      Summable (fun v : ℤ × ℤ => ‖kroneckerTerm τ a b v‖) ∧
      F ((a : AddCircle (1 : ℝ)), (b : AddCircle (1 : ℝ))) =
        (-(τ.im : ℂ) ^ 2 / (Real.pi : ℂ)) *
          ∑' v : ℤ × ℤ, kroneckerTerm τ a b v := by sorry

-- Packet node (marker added in the join): ER.3/relative-projective-line-chow-bridge
/-- The relative projective-line identity in a finite-factor presentation of the rational
 divisors. The degree and product conditions give f(infinity)=f(0)=1. The factor identities
 give all the finite zero/pole multiplicities, including negative integer exponents.
 The general Chow-interface proof is imported from P.5 rather than encoded as a Prop field. -/
theorem relative_projective_line_steinberg
    (D : ℂ → ℝ) (hD_cont : Continuous D) (hD_zero : D 0 = 0) (hD_one : D 1 = 0)
    (hD_inv : ∀ w : ℂ, w ≠ 0 → D w⁻¹ = -D w)
    (hD_disc : ∀ w : ℂ, w ≠ 0 → ‖w‖ < 1 →
      D w = (∑' k : ℕ, w ^ (k + 1) / ((k + 1 : ℂ) ^ 2)).im +
        Real.log ‖w‖ * (Complex.log (1 - w)).im)
    (A B : Finset ℂ) (d e : ℂ → ℤ) (f : RatFunc ℂ) (K : ℂ)
    (hK_zero : K ≠ 0) (hK_one : K ≠ 1)
    (hA : ∀ α ∈ A, α ≠ 0) (hB : ∀ β ∈ B, β ≠ 0)
    (hdegree_f : ∑ α ∈ A, d α = 0) (hdegree_g : ∑ β ∈ B, e β = 0)
    (hproduct_f : ∏ α ∈ A, α ^ (d α) = 1)
    (hf : f = ∏ α ∈ A, (RatFunc.X - RatFunc.C α) ^ (d α))
    (hg : RatFunc.C K - f = RatFunc.C (K - 1) *
      ∏ β ∈ B, (RatFunc.X - RatFunc.C β) ^ (e β)) :
    ∑ α ∈ A, ∑ β ∈ B, (d α : ℝ) * (e β : ℝ) * D (β / α) = 0 := by sorry

end ER3Part

/-! # Layer ER.4 -/

section Diamond

open Complex
open scoped UpperHalfPlane MatrixGroups Real

variable {A : Type*} [AddCommGroup A]
open AddMonoidAlgebra

/-- ER.4/the-diamond-convolution: `(Σ mᵢ[Pᵢ]) ⋄ (Σ nⱼ[Qⱼ]) = Σ mᵢnⱼ[Qⱼ - Pᵢ]`, i.e. the product in
`ℤ[A]` of the reflection of `D` with `D'` (Bloch's `F⁻ * G`, Lemma 8.1.4). -/
noncomputable def diamond (D D' : AddMonoidAlgebra ℤ A) : AddMonoidAlgebra ℤ A :=
  AddMonoidAlgebra.mapDomain (fun a : A => -a) D * D'

/-- The degree (augmentation) of a divisor. -/
noncomputable def divDeg (D : AddMonoidAlgebra ℤ A) : ℤ := D.coeff.sum fun _ n => n

@[simp] theorem diamond_single_single (P Q : A) (m n : ℤ) :
    diamond (single P m) (single Q n) = single (Q - P) (m * n) := by sorry
@[simp] theorem diamond_add_left (D₁ D₂ D' : AddMonoidAlgebra ℤ A) :
    diamond (D₁ + D₂) D' = diamond D₁ D' + diamond D₂ D' := by sorry
@[simp] theorem diamond_add_right (D D'₁ D'₂ : AddMonoidAlgebra ℤ A) :
    diamond D (D'₁ + D'₂) = diamond D D'₁ + diamond D D'₂ := by sorry
theorem divDeg_diamond (D D' : AddMonoidAlgebra ℤ A) :
    divDeg (diamond D D') = divDeg D * divDeg D' := by sorry
theorem diamond_single_left (P : A) (D' : AddMonoidAlgebra ℤ A) :
    diamond (single P 1) D' = AddMonoidAlgebra.mapDomain (fun a => a - P) D' := by sorry
/-- The opposite convention is the reflection of `D ⋄ D'`, not its negation. -/
theorem diamond_comm (D D' : AddMonoidAlgebra ℤ A) :
    diamond D' D = AddMonoidAlgebra.mapDomain (fun a : A => -a) (diamond D D') := by sorry
theorem diamond_map {B : Type*} [AddCommGroup B] (φ : A →+ B) (D D' : AddMonoidAlgebra ℤ A) :
    AddMonoidAlgebra.mapDomain φ (diamond D D') =
      diamond (AddMonoidAlgebra.mapDomain φ D) (AddMonoidAlgebra.mapDomain φ D') := by sorry

/-- Test `diamond_two_points` (computation): `[1] ⋄ [3] = [2]` in `ℤ[ℤ/5]`. -/
example : diamond (single (1 : ZMod 5) 1) (single 3 1) = single 2 1 := by sorry
/-- Test `diamond_degree_zero` (degenerate). -/
example (D' : AddMonoidAlgebra ℤ A) : diamond 0 D' = 0 := by sorry
/-- Test `diamond_opposite_is_reflection` (non-example): the opposite convention is not the negation. -/
example : AddMonoidAlgebra.mapDomain (fun a : ZMod 5 => -a) (diamond (single 1 1) (single 3 1)) ≠
    -diamond (single (1 : ZMod 5) 1) (single 3 1) := by sorry
/-- Test `diamond_eq_convolution` (characterisation): the coefficients of `D ⋄ D'`. -/
example [DecidableEq A] (D D' : AddMonoidAlgebra ℤ A) (c : A) :
    (diamond D D').coeff c = D.coeff.sum fun a m => D'.coeff.sum fun b n => if b - a = c then m * n else 0 := by
  sorry
/-- Test `diamond_odd_sign` (characterisation): an odd function changes sign under the opposite convention. -/
example (F : A → ℂ) (hF : ∀ a, F (-a) = -F a) (D D' : AddMonoidAlgebra ℤ A) :
    (diamond D' D).coeff.sum (fun a n => (n : ℂ) * F a) =
      -(diamond D D').coeff.sum (fun a n => (n : ℂ) * F a) := by sorry

end Diamond

section ER4

open Complex
open scoped UpperHalfPlane MatrixGroups Real

variable (D : ℂ → ℝ)

/-- ER.3's `R_q = J(q; ·) + i D_q` in the coordinate `z` of `ℂ/(ℤ + ℤτ)`: `x = exp(2πiz)`. -/
def ellipticRτ (τ : ℍ) (z : ℂ) : ℂ := ellipticR D (qParameter τ) (cexp (2 * π * I * z))

/-- Evaluation of `ellipticR` on a divisor of `ℂ` (points of `E_τ` given by lifts). -/
noncomputable def ellipticRDiv (τ : UpperHalfPlane) (Δ : AddMonoidAlgebra ℤ ℂ) : ℂ :=
  Δ.coeff.sum fun z n => (n : ℂ) * ellipticRτ D τ z

/-- The divisor of a `(ℤ + ℤτ)`-periodic meromorphic function on the half-open fundamental
parallelogram, as a finite divisor (from `MeromorphicOn.divisor`). -/
noncomputable def fundDivisor (τ : UpperHalfPlane) (f : ℂ → ℂ) : AddMonoidAlgebra ℤ ℂ := sorry

/-- ER.2's regulator at `ω = dz`: `∫_{E_τ} log|f| dz ∧ ∂̄ log|g| = -i ∫∫ log|f| · conj(g'/g) dx dy`. -/
noncomputable def regulatorAtDz (τ : UpperHalfPlane) (f g : ℂ → ℂ) : ℂ :=
  -Complex.I * ((τ : ℂ).im : ℂ) * ∫ s in (0 : ℝ)..1, ∫ t in (0 : ℝ)..1,
    (Real.log ‖f (s + t * τ)‖ : ℂ) * (starRingEnd ℂ) (logDeriv g (s + t * τ))

/-- ER.4/the-divisor-formula: `r({f,g})(dz) = ½ · conj (R_q((f) ⋄ (g)))`, no tame-symbol hypothesis. -/
theorem divisor_formula (τ : UpperHalfPlane) (f g : ℂ → ℂ)
    (hf : MeromorphicOn f Set.univ) (hg : MeromorphicOn g Set.univ)
    (hf₁ : ∀ z, f (z + 1) = f z) (hfτ : ∀ z, f (z + τ) = f z)
    (hg₁ : ∀ z, g (z + 1) = g z) (hgτ : ∀ z, g (z + τ) = g z)
    (hf₀ : ∃ z, f z ≠ 0) (hg₀ : ∃ z, g z ≠ 0) :
    regulatorAtDz τ f g =
      (1 / 2 : ℂ) * (starRingEnd ℂ) (ellipticRDiv D τ (diamond (fundDivisor τ f) (fundDivisor τ g))) := by
  sorry

/- ER.4/bloch-lift-formula is a statement about lifts to `ℂˣ`; its signature needs Bloch's
unregularised `J_q`, owned by ER.3. Left out here rather than stated as `True`. -/

/-- `(ρ) = (C² - 1)[0] - Σ_{b ∈ E[C] ∖ 0} [b]`, torsion points lifted to `(k + ℓτ)/C`. -/
noncomputable def blochRhoDiv (τ : UpperHalfPlane) (C : ℕ) : AddMonoidAlgebra ℤ ℂ :=
  AddMonoidAlgebra.single 0 ((C : ℤ) ^ 2 - 1) -
    ∑ k ∈ Finset.range C, ∑ l ∈ Finset.range C,
      if (k, l) = (0, 0) then 0 else AddMonoidAlgebra.single (((k : ℂ) + l * τ) / C) 1

/-- `(f_a) = C[a] - C[0]`. -/
noncomputable def torsionFunctionDiv (C : ℕ) (a : ℂ) : AddMonoidAlgebra ℤ ℂ :=
  AddMonoidAlgebra.single a (C : ℤ) - AddMonoidAlgebra.single 0 (C : ℤ)

/-- ER.4/the-regulator-of-the-corrected-classes (Bloch Lemma 10.2.2): `R_q(S_a) = C³ R_q(a)`. -/
theorem ellipticRDiv_blochClass (τ : UpperHalfPlane) (C : ℕ) (hC : 0 < C) (k l : ℕ)
    (hk : k < C) (hl : l < C) (hkl : (k, l) ≠ (0, 0)) :
    ellipticRDiv D τ (diamond (blochRhoDiv τ C) (torsionFunctionDiv C (((k : ℂ) + l * τ) / C))) =
      (C : ℂ) ^ 3 * ellipticRτ D τ (((k : ℂ) + l * τ) / C) := by sorry

/- ER.4 imports the generic coefficient, inversion, Parseval and normalization-comparison
interface from AdditiveCombinatorics:AC.0. That missing interface must be built on the pinned
AddChar basis/orthogonality, not redefined here. The following declarations specify only
the C-torsion identification and its comparisons. The `complexBasis.repr` target is already
available at the pin; AC.0 owns its general averaged-coefficient formula. -/

/-- API `torsionFourierCharacter`: χ_(k,ℓ)(a,b) = exp(2πi(ak−bℓ)/C). -/
noncomputable def torsionFourierCharacter (C : ℕ) [NeZero C]
    (kl : ZMod C × ZMod C) : AddChar (ZMod C × ZMod C) ℂ where
  toFun ab := ZMod.stdAddChar (ab.1 * kl.1 - ab.2 * kl.2)
  map_zero_eq_one' := by sorry
  map_add_eq_mul' := by sorry

theorem torsionFourierCharacter_apply (C : ℕ) [NeZero C]
    (kl ab : ZMod C × ZMod C) :
    torsionFourierCharacter C kl ab = Complex.exp (2 * Real.pi * Complex.I *
      ((((ab.1.val * kl.1.val : ℕ) : ℤ) - ((ab.2.val * kl.2.val : ℕ) : ℤ) : ℤ) : ℂ) / C) := by
  sorry

/-- API `torsionFourierDuality`: identify the C-torsion dual using the existing characters. -/
noncomputable def torsionFourierDuality (C : ℕ) [NeZero C] :
    (ZMod C × ZMod C) ≃ AddChar (ZMod C × ZMod C) ℂ :=
  Equiv.ofBijective (torsionFourierCharacter C) (by sorry)

/-- ER.4/finite-fourier-transform: Bloch (10.2.1), the AC.0 average `1/C²` on C² points. -/
noncomputable def finiteFourier10 (C : ℕ) [NeZero C] (f : ZMod C × ZMod C → ℂ)
    (kl : ZMod C × ZMod C) : ℂ :=
  ((C : ℂ) ^ 2)⁻¹ * ∑ ab : ZMod C × ZMod C, f ab *
    Complex.exp (2 * Real.pi * Complex.I *
      ((-((ab.1.val * kl.1.val : ℕ) : ℤ) + ((ab.2.val * kl.2.val : ℕ) : ℤ) : ℤ) : ℂ) / C)

/-- ER.4/bloch-theorem-10-2-1, in analytic form (`R_q(S_{x/C}) = C³ R_q(x/C)`). -/
theorem bloch_theorem_10_2_1 (τ : UpperHalfPlane) (C : ℕ) [NeZero C]
    (f : ZMod C × ZMod C → ℂ) (hodd : ∀ x, f (-x) = -f x) :
    ∑ kl : ZMod C × ZMod C, finiteFourier10 C f kl *
        ((C : ℂ) ^ 3 * ellipticRτ D τ (((kl.1.val : ℂ) + kl.2.val * τ) / C)) =
      Complex.I * ((τ : ℂ).im : ℂ) ^ 2 * (C : ℂ) ^ 3 / Real.pi *
        ∑' mn : {p : ℤ × ℤ // p ≠ 0}, f ((mn.1.1 : ZMod C), (mn.1.2 : ZMod C)) /
          (((mn.1.1 : ℂ) * τ + mn.1.2) ^ 2 * ((mn.1.1 : ℂ) * (starRingEnd ℂ) τ + mn.1.2)) := by
  sorry

/-- API `finiteFourier10_eq_complexBasis_repr`: specialize AC.0's coefficient comparison. -/
theorem finiteFourier10_eq_complexBasis_repr (C : ℕ) [NeZero C]
    (f : ZMod C × ZMod C → ℂ) (kl : ZMod C × ZMod C) :
    finiteFourier10 C f kl =
      (AddChar.complexBasis (ZMod C × ZMod C)).repr f (torsionFourierCharacter C kl) := by
  sorry

/-- API `finiteFourier10_eq_dft`: the second DFT index is negated. -/
theorem finiteFourier10_eq_dft (C : ℕ) [NeZero C]
    (f : ZMod C × ZMod C → ℂ) (kl : ZMod C × ZMod C) :
    finiteFourier10 C f kl = ((C : ℂ)^2)⁻¹ *
      ZMod.dft (fun a => ZMod.dft (fun b => f (a, b)) (-kl.2)) kl.1 := by
  sorry

/-- API `finiteFourier10_parseval`: specialize AC.0 Parseval through torsionFourierDuality. -/
theorem finiteFourier10_parseval (C : ℕ) [NeZero C] (f : ZMod C × ZMod C → ℂ) :
    ∑ kl, ‖finiteFourier10 C f kl‖ ^ 2 = ((C : ℝ)^2)⁻¹ * ∑ ab, ‖f ab‖ ^ 2 := by
  sorry

/-- API `finiteFourier10_inversion`: specialize AC.0 inversion; no new generic proof. -/
theorem finiteFourier10_inversion (C : ℕ) [NeZero C] (f : ZMod C × ZMod C → ℂ) (ab : ZMod C × ZMod C) :
    f ab = ∑ kl : ZMod C × ZMod C, finiteFourier10 C f kl *
      Complex.exp (2 * Real.pi * Complex.I *
        ((((ab.1.val * kl.1.val : ℕ) : ℤ) - ((ab.2.val * kl.2.val : ℕ) : ℤ) : ℤ) : ℂ) / C) := by
  sorry

/-- API `finiteFourier10_odd`: `f` is odd iff its transform is. -/
theorem finiteFourier10_odd (C : ℕ) [NeZero C] (f : ZMod C × ZMod C → ℂ) :
    (∀ x, f (-x) = -f x) ↔ ∀ x, finiteFourier10 C f (-x) = -finiteFourier10 C f x := by
  sorry

/-- API `finiteFourier10_single`: the transform of a point mass. -/
theorem finiteFourier10_single (C : ℕ) [NeZero C] (ab kl : ZMod C × ZMod C) :
    finiteFourier10 C (fun x => if x = ab then 1 else 0) kl =
      ((C : ℂ) ^ 2)⁻¹ * Complex.exp (2 * Real.pi * Complex.I *
        ((-((ab.1.val * kl.1.val : ℕ) : ℤ) + ((ab.2.val * kl.2.val : ℕ) : ℤ) : ℤ) : ℂ) / C) := by
  sorry

/-- Test `finiteFourier10_C3` (computation): `C = 3`, `f = δ_(1,0) − δ_(2,0)`. -/
example : finiteFourier10 3 (fun x => if x = (1, 0) then 1 else if x = (2, 0) then -1 else 0) (1, 0) =
    -(Complex.I * (Real.sqrt 3 : ℂ)) / 9 := by
  sorry

/-- Test `finiteFourier10_zero` (degenerate). -/
example (C : ℕ) [NeZero C] : finiteFourier10 C 0 = 0 := by
  sorry

/-- Test `finiteFourier10_C1` (degenerate). -/
example (f : ZMod 1 × ZMod 1 → ℂ) : finiteFourier10 1 f (0, 0) = f (0, 0) := by
  sorry

/-- Test `finiteFourier10_parseval_single` (computation): a unitary normalization fails. -/
example : ∑ kl : ZMod 3 × ZMod 3,
    ‖finiteFourier10 3 (fun ab => if ab = (0, 0) then 1 else 0) kl‖ ^ 2 = (1 / 9 : ℝ) := by
  sorry

/-- Test `finiteFourier10_basis` (compatibility): the character transforms to its point mass. -/
example (C : ℕ) [NeZero C] (kl uv : ZMod C × ZMod C) :
    finiteFourier10 C (torsionFourierCharacter C kl) uv = if uv = kl then 1 else 0 := by
  sorry

/-- Test `finiteFourier10_inv` (characterisation): inversion recovers `f`. -/
example (C : ℕ) [NeZero C] (f : ZMod C × ZMod C → ℂ) :
    (fun ab : ZMod C × ZMod C => ∑ kl : ZMod C × ZMod C, finiteFourier10 C f kl *
      Complex.exp (2 * Real.pi * Complex.I *
        ((((ab.1.val * kl.1.val : ℕ) : ℤ) - ((ab.2.val * kl.2.val : ℕ) : ℤ) : ℤ) : ℂ) / C)) = f := by
  sorry

-- Test finiteFourier10_not_one_over_C: not stated; it compares Bloch's printed normalisation with this one
-- and is recorded in the packet as a non-example of Theorem 10.2.1's constant.

/- ER.4/transfer-and-the-trace-formula needs Milnor K₂ of function fields with the transfer
(K2SymbolsBrauer T.4); its signature belongs next to those declarations and is left out here. -/

end ER4

/-! ### ER.4: items not yet stated (parent)
Each needs an object that no pinned library has, named on its line. -/

-- finiteFourier10_eq_fourierO: stated above as `fourierO_eq_finiteFourier10` (the same relation, read from ER.5).

section ER4Part

/-! ## ER.4 part (`EllipticRegulators--ER.4.lean`, packet `EllipticRegulators--ER.4.json`)

Join: working namespace `BP_ER4` → `TauCeti.EllipticRegulator` (the packet's
`library.namespace`); the packet names are unchanged. Replacements of part-local copies by the
parent's objects (the same functions): `torsionFourier` → `finiteFourier10` (ER.4/finite-fourier-
transform: average `1/C²` with kernel `exp(2πi(-ak + bℓ)/C)`, which is `star (stdAddChar (ak - bℓ))`),
`q` → `qParameter` (both `Function.Periodic.qParam 1 τ`), `character` → `torsionFourierCharacter`
(both `ab ↦ stdAddChar (ab.1 * kl.1 - ab.2 * kl.2)`; the parent's is an `AddChar`, coerced). The
other coordinate abbreviations (`T`, `x`, `li2Disc`, `logTerm`, `rawLog`, `rawDilog`, `correction`,
`odd`, `lift`, `w`, the kernels, `B`, `H`, `M₁`, `M₂`, `tauI`) have no parent counterpart and keep
their names (none is a packet name; none clashes).

The imported parent ER.4 declarations and AC.0 general Fourier API are not
restated here. Their unavailable curve/K₂ types are left to their owning files.
-/

open scoped BigOperators ComplexConjugate UpperHalfPlane
open Complex Real

abbrev T (C : ℕ) := ZMod C × ZMod C
-- Coordinate forms of imported ER.4 and P.1 objects, not new public theory.
-- Joined file: the part's `torsionFourier C f u = (∑ a, ∑ b, f (a,b) * star
-- (ZMod.stdAddChar (a * u.1 - b * u.2))) / C^2` is the parent's `finiteFourier10 C f u`.
abbrev x (C : ℕ) (τ : ℍ) (u : T C) : ℂ :=
  Function.Periodic.qParam 1 (((u.1.val : ℂ) + (u.2.val : ℂ) * (τ : ℂ)) / (C : ℂ))
-- Joined file: the part's `q τ := Function.Periodic.qParam 1 (τ : ℂ)` is the parent's
-- `qParameter τ`.
abbrev li2Disc (z : ℂ) : ℂ := ∑' j : ℕ, z^(j+1) / ((j+1 : ℕ) : ℂ)^2
abbrev logTerm (z : ℂ) : ℂ := (Real.log ‖z‖ : ℂ) * Complex.log (1-z)
abbrev rawLog (τ : ℍ) (z : ℂ) : ℂ :=
  (∑' n : ℕ, logTerm (z * qParameter τ ^ n)) -
    ∑' n : ℕ, logTerm (z⁻¹ * qParameter τ ^ (n+1))
abbrev rawDilog (τ : ℍ) (z : ℂ) : ℝ :=
  (∑' n : ℕ, (li2Disc (z * qParameter τ ^ n)).im) -
    ∑' n : ℕ, (li2Disc (z⁻¹ * qParameter τ ^ (n+1))).im
abbrev correction (C : ℕ) (τ : ℍ) (u : T C) : ℂ :=
  let v : ℝ := (u.2.val : ℝ) / C
  (4 * Real.pi^2 * τ.im^2 * (v^3/3 - v^2/2 + v/6) : ℝ)
def blochLogTerm (C : ℕ) [NeZero C] (τ : ℍ) (f : T C → ℂ) : ℂ :=
  ∑ u : T C, finiteFourier10 C f u * rawLog τ (x C τ u)
def blochDilogTerm (C : ℕ) [NeZero C] (τ : ℍ) (f : T C → ℂ) : ℂ :=
  I * ∑ u : T C, finiteFourier10 C f u * (rawDilog τ (x C τ u) : ℂ)
abbrev odd (C : ℕ) (f : T C → ℂ) := ∀ u, f (-u) = - f u
abbrev lift (C : ℕ) (f : T C → ℂ) (m n : ℤ) : ℂ := f (m,n)
abbrev w (τ : ℍ) (m n : ℤ) : ℂ := (m : ℂ)*(τ : ℂ) + n
abbrev logKernel (τ : ℍ) (p : ℤ × ℤ) : ℂ :=
  if p.1 = 0 then 0 else 1 / ((p.1 : ℂ) * w τ p.1 p.2 ^ 2)
abbrev imKernel (τ : ℍ) (p : ℤ × ℤ) : ℂ :=
  if p.1 = 0 then 0 else ( (1 / ((p.1 : ℂ)^2 * w τ p.1 p.2)).im : ℂ)
abbrev latticeKernel (τ : ℍ) (p : ℤ × ℤ) : ℂ :=
  if p = (0,0) then 0 else 1 / (w τ p.1 p.2^2 * star (w τ p.1 p.2))
abbrev B (C : ℕ) [NeZero C] (τ : ℍ) (f : T C → ℂ) : ℂ :=
  ∑ u, finiteFourier10 C f u * correction C τ u
abbrev H (C : ℕ) [NeZero C] (f : T C → ℂ) : ℂ :=
  (∑' m : ℕ, (∑ b : ZMod C, lift C f (m+1) b.val) / ((m+1 : ℕ) : ℂ)^2) / C
abbrev M₁ (C : ℕ) [NeZero C] (τ : ℍ) (f : T C → ℂ) : ℂ :=
  2 * I * ∑ u : T C, finiteFourier10 C f u *
    ((∑' n : ℕ, (li2Disc (x C τ u * qParameter τ^n)).im) : ℂ)
abbrev M₂ (C : ℕ) [NeZero C] (f : T C → ℂ) : ℂ :=
  -I * ∑ k : ZMod C, finiteFourier10 C f (k,0) *
    ((li2Disc (Function.Periodic.qParam 1 ((k.val : ℂ) / C))).im : ℂ)

/- These coordinate abbreviations stand for the imported torsion adapter, principal
Li₂ on the closed disc, and ER.3 raw/regularized companions. They add no new
Fourier, polylogarithm, elliptic curve or K₂ interfaces. The unavailable geometric
objects are specified in the reader and are not replaced by arbitrary predicates. -/
-- Joined file: the part's `character C u a := ZMod.stdAddChar (a.1 * u.1 - a.2 * u.2)` is the
-- parent's `torsionFourierCharacter C u`, used through its coercion to a function.
abbrev horizontalKernel (n : ℤ) : ℂ := if n = 0 then 0 else 1 / (n : ℂ)^3
abbrev verticalKernel (τ : ℍ) (p : ℤ × ℤ) : ℂ :=
  if p.1 = 0 then 0 else latticeKernel τ p
abbrev tauI : ℍ := ⟨I, by simp⟩

-- EllipticRegulators:ER.4/direct-series-convergence
-- This is a target-level convergence declaration: its estimates are
-- proved together before any finite/infinite sum interchange.
theorem directSeriesConvergence (C : ℕ) [NeZero C] (τ : ℍ) (f : T C → ℂ) :
    (∀ u : T C,
      Summable (fun n : ℕ => ‖logTerm (x C τ u * qParameter τ^n)‖) ∧
      Summable (fun n : ℕ => ‖logTerm ((x C τ u)⁻¹ * qParameter τ^(n+1))‖) ∧
      Summable (fun p : ℕ × ℕ =>
        ‖(Real.log ‖x C τ u * qParameter τ^p.1‖ : ℂ) *
          (x C τ u * qParameter τ^p.1)^(p.2+1) / ((p.2+1 : ℕ) : ℂ)‖) ∧
      Summable (fun p : ℕ × ℕ =>
        ‖(Real.log ‖(x C τ u)⁻¹ * qParameter τ^(p.1+1)‖ : ℂ) *
          ((x C τ u)⁻¹ * qParameter τ^(p.1+1))^(p.2+1) / ((p.2+1 : ℕ) : ℂ)‖) ∧
      Summable (fun n : ℕ => ‖li2Disc (x C τ u * qParameter τ^n)‖) ∧
      Summable (fun n : ℕ => ‖li2Disc ((x C τ u)⁻¹ * qParameter τ^(n+1))‖) ∧
      Summable (fun p : ℕ × ℕ =>
        ‖(x C τ u * qParameter τ^p.1)^(p.2+1) / ((p.2+1 : ℕ) : ℂ)^2‖) ∧
      Summable (fun p : ℕ × ℕ =>
        ‖((x C τ u)⁻¹ * qParameter τ^(p.1+1))^(p.2+1) / ((p.2+1 : ℕ) : ℂ)^2‖)) ∧
    Summable (fun p : ℤ × ℤ => ‖lift C f p.1 p.2 * logKernel τ p‖) ∧
    Summable (fun p : ℤ × ℤ => ‖lift C f p.1 p.2 * imKernel τ p‖) ∧
    Summable (fun p : ℤ × ℤ => ‖lift C f p.1 p.2 * latticeKernel τ p‖) ∧
    Summable (fun n : ℤ => ‖lift C f 0 n * horizontalKernel n‖) := by
  sorry

-- API: blochLogTerm (weighted-logarithmic-term).
theorem blochLogTerm_apply (C : ℕ) [NeZero C] (τ : ℍ) (f : T C → ℂ) :
    blochLogTerm C τ f = ∑ u, finiteFourier10 C f u * rawLog τ (x C τ u) := by
  sorry
theorem blochLogTerm_zero (C : ℕ) [NeZero C] (τ : ℍ) :
    blochLogTerm C τ (fun _ => 0) = 0 := by
  sorry
theorem blochLogTerm_add (C : ℕ) [NeZero C] (τ : ℍ) (f g : T C → ℂ) :
    blochLogTerm C τ (f + g) = blochLogTerm C τ f + blochLogTerm C τ g := by
  sorry
theorem blochLogTerm_smul (C : ℕ) [NeZero C] (τ : ℍ) (f : T C → ℂ) (c : ℂ) :
    blochLogTerm C τ (c • f) = c * blochLogTerm C τ f := by
  sorry
theorem blochLogTerm_character (C : ℕ) [NeZero C] (τ : ℍ) (u : T C) :
    blochLogTerm C τ (torsionFourierCharacter C u) = rawLog τ (x C τ u) := by
  sorry
theorem blochLogTerm_boundary (z : ℂ) (hz : ‖z‖ = 1) : logTerm z = 0 := by
  sorry

-- Tests: log_test_trivial_level
example (τ : ℍ) (f : T 1 → ℂ) : blochLogTerm 1 τ f = 0 := by
  sorry
-- log_test_character_level_three
example (τ : ℍ) : blochLogTerm 3 τ (torsionFourierCharacter 3 (0,1)) =
    rawLog τ (Function.Periodic.qParam 1 ((τ : ℂ) / 3)) := by
  sorry
-- log_test_unit_boundary
example : logTerm I = 0 ∧ logTerm 1 = 0 := by
  sorry
-- log_test_complex_scalar
-- A real-part logarithmic kernel also passes this linearity test.
example (C : ℕ) [NeZero C] (τ : ℍ) (f : T C → ℂ) :
    blochLogTerm C τ (I • f) = I * blochLogTerm C τ f := by
  sorry
-- log_test_nonreal_kernel: detects replacing Complex.log by its real part.
example : (logTerm (I / 2)).im = Real.log 2 * Real.arctan (1 / 2) ∧
    0 < (logTerm (I / 2)).im := by
  sorry

-- API: blochDilogTerm (weighted-dilogarithmic-term).
theorem blochDilogTerm_apply (C : ℕ) [NeZero C] (τ : ℍ) (f : T C → ℂ) :
    blochDilogTerm C τ f = I * ∑ u, finiteFourier10 C f u *
      (rawDilog τ (x C τ u) : ℂ) := by
  sorry
theorem blochDilogTerm_zero (C : ℕ) [NeZero C] (τ : ℍ) :
    blochDilogTerm C τ (fun _ => 0) = 0 := by
  sorry
theorem blochDilogTerm_add (C : ℕ) [NeZero C] (τ : ℍ) (f g : T C → ℂ) :
    blochDilogTerm C τ (f + g) = blochDilogTerm C τ f + blochDilogTerm C τ g := by
  sorry
theorem blochDilogTerm_smul (C : ℕ) [NeZero C] (τ : ℍ) (f : T C → ℂ) (c : ℂ) :
    blochDilogTerm C τ (c • f) = c * blochDilogTerm C τ f := by
  sorry
theorem blochDilogTerm_character (C : ℕ) [NeZero C] (τ : ℍ) (u : T C) :
    blochDilogTerm C τ (torsionFourierCharacter C u) = I * (rawDilog τ (x C τ u) : ℂ) := by
  sorry
-- EllipticRegulators:ER.4/dilogarithmic-orbit-splitting (marker added in the join)
theorem blochDilogTerm_split (C : ℕ) [NeZero C] (τ : ℍ) (f : T C → ℂ)
    (hf : odd C f) : blochDilogTerm C τ f = M₁ C τ f + M₂ C f := by
  sorry

-- Tests: dilog_test_trivial_level
example (τ : ℍ) (f : T 1 → ℂ) : blochDilogTerm 1 τ f = 0 := by
  sorry
-- dilog_test_character_level_three
example (τ : ℍ) : blochDilogTerm 3 τ (torsionFourierCharacter 3 (0,1)) =
    I * (rawDilog τ (Function.Periodic.qParam 1 ((τ : ℂ) / 3)) : ℂ) := by
  sorry
-- dilog_test_complex_scalar
example (C : ℕ) [NeZero C] (τ : ℍ) (f : T C → ℂ) :
    blochDilogTerm C τ (I • f) = I * blochDilogTerm C τ f := by
  sorry
-- dilog_test_unit_circle
example : blochDilogTerm 4 tauI (torsionFourierCharacter 4 (1,0)) =
    I * ((li2Disc I).im : ℂ) +
      2 * I * ((∑' n : ℕ, (li2Disc
        (I * (Real.exp (-2 * Real.pi * (n+1)) : ℂ))).im) : ℂ) := by
  sorry

-- EllipticRegulators:ER.4/torsion-bernoulli-horizontal-term
theorem torsionBernoulliHorizontalTerm (C : ℕ) [NeZero C] (τ : ℍ)
    (f : T C → ℂ) (hf : odd C f) :
    B C τ f = I * (τ.im : ℂ)^2 / (Real.pi : ℂ) *
      ∑' n : ℤ, lift C f 0 n * horizontalKernel n := by
  sorry

-- EllipticRegulators:ER.4/logarithmic-lattice-evaluation
theorem logarithmicLatticeEvaluation (C : ℕ) [NeZero C] (τ : ℍ)
    (f : T C → ℂ) (hf : odd C f) :
    blochLogTerm C τ f = -(τ.im : ℂ) / (2 * (Real.pi : ℂ)) *
      ∑' p : ℤ × ℤ, lift C f p.1 p.2 * logKernel τ p := by
  sorry

-- EllipticRegulators:ER.4/dilogarithmic-forward-evaluation
theorem dilogarithmicForwardEvaluation (C : ℕ) [NeZero C] (τ : ℍ)
    (f : T C → ℂ) (hf : odd C f) :
    M₁ C τ f = H C f - 1 / (2 * (Real.pi : ℂ)) *
      ∑' p : ℤ × ℤ, lift C f p.1 p.2 * imKernel τ p := by
  sorry

-- EllipticRegulators:ER.4/dilogarithmic-boundary-evaluation
theorem dilogarithmicBoundaryEvaluation (C : ℕ) [NeZero C]
    (f : T C → ℂ) (hf : odd C f) : M₂ C f = -H C f := by
  sorry

-- EllipticRegulators:ER.4/dilogarithmic-lattice-evaluation
theorem dilogarithmicLatticeEvaluation (C : ℕ) [NeZero C] (τ : ℍ)
    (f : T C → ℂ) (hf : odd C f) :
    blochDilogTerm C τ f = -1 / (2 * (Real.pi : ℂ)) *
      ∑' p : ℤ × ℤ, lift C f p.1 p.2 * imKernel τ p := by
  sorry

-- EllipticRegulators:ER.4/direct-raw-fourier-identity
-- rawLog + i rawDilog is ER.3's J_q^Bl + i D_q on these lifts.
theorem directRawFourierIdentity (C : ℕ) [NeZero C] (τ : ℍ)
    (f : T C → ℂ) (hf : odd C f) :
    (∑ u, finiteFourier10 C f u *
      (rawLog τ (x C τ u) + I * (rawDilog τ (x C τ u) : ℂ))) =
    I * (τ.im : ℂ)^2 / (Real.pi : ℂ) *
      ∑' p : ℤ × ℤ, lift C f p.1 p.2 * verticalKernel τ p := by
  sorry

-- EllipticRegulators:ER.4/direct-regularized-fourier-identity
-- Multiply this by C^3 only after using the parent class-regulator formula.
theorem directRegularizedFourierIdentity (C : ℕ) [NeZero C] (τ : ℍ)
    (f : T C → ℂ) (hf : odd C f) :
    (∑ u, finiteFourier10 C f u *
      (rawLog τ (x C τ u) + I * (rawDilog τ (x C τ u) : ℂ) + correction C τ u)) =
    I * (τ.im : ℂ)^2 / (Real.pi : ℂ) *
      ∑' p : ℤ × ℤ, lift C f p.1 p.2 * latticeKernel τ p := by
  sorry

end ER4Part

/-! # Layer ER.5 -/

section ER5

open Complex
open scoped UpperHalfPlane MatrixGroups Real

variable (D : ℂ → ℝ)

/-! ## ER.5 — the CM example (analytic core; the K-theory classes come from EllipticKTheory E.7) -/

/-- The pairing `⟨a + bτ, k + ℓτ⟩ = e^{2πi(-aℓ + bk)/C}` on `O/CO`, in coordinates `(a, b)`. -/
noncomputable def pairingO (C : ℕ) [NeZero C] (x y : ZMod C × ZMod C) : ℂ :=
  Complex.exp (2 * Real.pi * Complex.I *
    ((-((x.1.val * y.2.val : ℕ) : ℤ) + ((x.2.val * y.1.val : ℕ) : ℤ) : ℤ) : ℂ) / C)

/-- ER.5/fourier-transform-on-O-mod-C: `F̂(x) = C⁻¹ Σ_y F(y) ⟨x, y⟩` (the kernel of the proof of
Lemma 11.1.7; the kernel printed in (11.1.1) is `⟨y, x⟩`, source issue E7). -/
noncomputable def fourierO (C : ℕ) [NeZero C] (F : ZMod C × ZMod C → ℂ) (x : ZMod C × ZMod C) : ℂ :=
  (C : ℂ)⁻¹ * ∑ y, F y * pairingO C x y

/-- API `pairingO_swap`: `⟨x, y⟩ · ⟨y, x⟩ = 1`. -/
theorem pairingO_swap (C : ℕ) [NeZero C] (x y : ZMod C × ZMod C) : pairingO C x y * pairingO C y x = 1 := by
  sorry

/-- API `fourierO_inversion`: import AC.0 inversion via the ER.4 scale comparison. -/
theorem fourierO_inversion (C : ℕ) [NeZero C] (F : ZMod C × ZMod C → ℂ) (y : ZMod C × ZMod C) :
    F y = (C : ℂ)⁻¹ * ∑ x, fourierO C F x * (pairingO C x y)⁻¹ := by
  sorry

/-- API `fourierO_eq_finiteFourier10`: in the coordinates `(m, n) ↦ n + mτ`. -/
theorem fourierO_eq_finiteFourier10 (C : ℕ) [NeZero C] (F : ZMod C × ZMod C → ℂ) (kl : ZMod C × ZMod C) :
    finiteFourier10 C (fun mn => F (mn.2, mn.1)) kl = (C : ℂ)⁻¹ * fourierO C F kl := by
  sorry

/-- Test `fourierO_normalisation` (compatibility): `fourierO` is `C` times Lecture 10's transform with the
input coordinates swapped and the output index unchanged. -/
example (C : ℕ) [NeZero C] (F : ZMod C × ZMod C → ℂ) (x : ZMod C × ZMod C) :
    fourierO C F x = (C : ℂ) * finiteFourier10 C (fun mn => F (mn.2, mn.1)) x := by
  sorry

/-- API `fourierO_parseval`: the unitary transform preserves the counting norm. -/
theorem fourierO_parseval (C : ℕ) [NeZero C] (F : ZMod C × ZMod C → ℂ) :
    ∑ x, ‖fourierO C F x‖ ^ 2 = ∑ y, ‖F y‖ ^ 2 := by
  sorry

/-- Test `fourierO_output_index` (non-example): swapping the dual index is false. -/
example : fourierO 3 (fun y => if y = (1, 0) then 1 else 0) (0, 1) =
      Complex.exp (2 * Real.pi * Complex.I / 3) / 3 ∧
    fourierO 3 (fun y => if y = (1, 0) then 1 else 0) (1, 0) = (1 / 3 : ℂ) := by
  sorry

-- pairingO_mul_left: not stated (Lemma 11.1.4); needs the multiplication of O/CO in the coordinates
-- `a + bτ`, i.e. the minimal polynomial of τ, which the CM setup of ER.5 fixes (CM.4, not pinned).
-- Test pairingO_lemma_11_1_4: not stated; needs pairingO_mul_left for O = ℤ[i], C = 4.
-- Test fourierO_chi_Qi: not stated; needs the character χ of ER.5 for ℚ(i), C = 4 (CM.4).
-- Test fourierO_printed_kernel: not stated; it is `lattice_sum_form` with the printed kernel and the opposite
-- sign (source issue EllipticRegulators/E7).

/-- ER.5/lattice-sum-form-of-theorem-10-2-1 ((11.1.2) with the corrected kernel). Here `τ` is a
root of `X² + A X + B` and `F` is a function on `O/CO` in the coordinates `(a, b) ↦ a + bτ`. -/
theorem lattice_sum_form (τ : UpperHalfPlane) (C : ℕ) [NeZero C]
    (F : ZMod C × ZMod C → ℂ) (hodd : ∀ x, F (-x) = -F x) :
    ∑ x : ZMod C × ZMod C, fourierO C F x *
        ((C : ℂ) ^ 3 * ellipticRτ D τ (((x.1.val : ℂ) + x.2.val * τ) / C)) =
      Complex.I * ((τ : ℂ).im : ℂ) ^ 2 * (C : ℂ) ^ 4 / Real.pi *
        ∑' mn : {p : ℤ × ℤ // p ≠ 0}, F ((mn.1.1 : ZMod C), (mn.1.2 : ZMod C)) /
          (((mn.1.1 : ℂ) + mn.1.2 * τ) ^ 2 * ((mn.1.1 : ℂ) + mn.1.2 * (starRingEnd ℂ) τ)) := by
  sorry

/-- ER.5/the-L-value-theorem, worked instance for 32a2 (τ = i, C = 4, index points 1/4 and
(3+2i)/4): `L(E,2) = (π/2)(D_q(e^{πi/2}) + D_q(e^{2πi(3+2i)/4}))`, i.e. in terms of `ellipticR`. -/
theorem bloch_L_value_32a2 :
    (WeierstrassCurve.mk 0 0 0 (-1) 0 : WeierstrassCurve ℚ).LSeries 2 =
      (Real.pi / 2 : ℂ) * ((ellipticRτ D UpperHalfPlane.I (1 / 4) +
        ellipticRτ D UpperHalfPlane.I ((3 + 2 * Complex.I) / 4)).im : ℂ) := by sorry

/- The general ER.5 theorem needs the Grössencharakter of a CM curve (CM.4) and the class `U`
(EllipticKTheory E.7); it is left out here rather than stated with placeholder hypotheses. -/

end ER5

/-! ### ER.5: items not yet stated (parent)
Each needs an object that no pinned library has, named on its line. -/

-- ER.5/the-CM-setup-and-the-hecke-character: not stated; needs the Grössencharakter of a CM elliptic curve (ComplexMultiplicationAndExplicitReciprocity CM.4) and Hecke characters on ideals (Tau Ceti GlobalNumberFields layer 9), neither pinned.
-- cmHeckeCharacter: not stated; needs the Grössencharakter of a CM elliptic curve (ComplexMultiplicationAndExplicitReciprocity CM.4) and Hecke characters on ideals (Tau Ceti GlobalNumberFields layer 9), neither pinned.
-- cmHeckeCharacter_conductor: not stated; needs the Grössencharakter of a CM elliptic curve (ComplexMultiplicationAndExplicitReciprocity CM.4) and Hecke characters on ideals (Tau Ceti GlobalNumberFields layer 9), neither pinned.
-- cmFiniteCharacter_conj: not stated; needs the Grössencharakter of a CM elliptic curve (ComplexMultiplicationAndExplicitReciprocity CM.4) and Hecke characters on ideals (Tau Ceti GlobalNumberFields layer 9), neither pinned.
-- deuringComparison: not stated; needs the Grössencharakter of a CM elliptic curve (ComplexMultiplicationAndExplicitReciprocity CM.4) and Hecke characters on ideals (Tau Ceti GlobalNumberFields layer 9), neither pinned.
-- deuringComparison_badPrimes: not stated; needs the Grössencharakter of a CM elliptic curve (ComplexMultiplicationAndExplicitReciprocity CM.4) and Hecke characters on ideals (Tau Ceti GlobalNumberFields layer 9), neither pinned.
-- cm_maximal_order: not stated; needs the Grössencharakter of a CM elliptic curve (ComplexMultiplicationAndExplicitReciprocity CM.4) and Hecke characters on ideals (Tau Ceti GlobalNumberFields layer 9), neither pinned.
-- Test deuring_32a2: not stated; needs the Grössencharakter of a CM elliptic curve (ComplexMultiplicationAndExplicitReciprocity CM.4) and Hecke characters on ideals (Tau Ceti GlobalNumberFields layer 9), neither pinned.
-- Test deuring_bad_prime_32a2: not stated; needs the Grössencharakter of a CM elliptic curve (ComplexMultiplicationAndExplicitReciprocity CM.4) and Hecke characters on ideals (Tau Ceti GlobalNumberFields layer 9), neither pinned.
-- Test not_from_endomorphisms: not stated; needs the Grössencharakter of a CM elliptic curve (ComplexMultiplicationAndExplicitReciprocity CM.4) and Hecke characters on ideals (Tau Ceti GlobalNumberFields layer 9), neither pinned.
-- Test cm_fields_over_Q: not stated; needs the Grössencharakter of a CM elliptic curve (ComplexMultiplicationAndExplicitReciprocity CM.4) and Hecke characters on ideals (Tau Ceti GlobalNumberFields layer 9), neither pinned.

-- ER.5/the-class-U: not stated; needs K₂ of E over a number field with the classes S_a of EllipticKTheory E.7/bloch-classes and the Galois action (CM.2).
-- cmCharExtend: not stated; needs K₂ of E over a number field with the classes S_a of EllipticKTheory E.7/bloch-classes and the Galois action (CM.2).
-- blochClassU: not stated; needs K₂ of E over a number field with the classes S_a of EllipticKTheory E.7/bloch-classes and the Galois action (CM.2).
-- blochClassU_summand_orbit: not stated; needs K₂ of E over a number field with the classes S_a of EllipticKTheory E.7/bloch-classes and the Galois action (CM.2).
-- blochClassU_galois_invariant: not stated; needs K₂ of E over a number field with the classes S_a of EllipticKTheory E.7/bloch-classes and the Galois action (CM.2).
-- blochClassU_descends: not stated; needs K₂ of E over a number field with the classes S_a of EllipticKTheory E.7/bloch-classes and the Galois action (CM.2).
-- blochClassU_rational: not stated; needs K₂ of E over a number field with the classes S_a of EllipticKTheory E.7/bloch-classes and the Galois action (CM.2).
-- Test blochClassU_Qi_C4: not stated; needs K₂ of E over a number field with the classes S_a of EllipticKTheory E.7/bloch-classes and the Galois action (CM.2).
-- Test blochClassU_zero_point: not stated; needs K₂ of E over a number field with the classes S_a of EllipticKTheory E.7/bloch-classes and the Galois action (CM.2).
-- Test blochClassU_descends_test: not stated; needs K₂ of E over a number field with the classes S_a of EllipticKTheory E.7/bloch-classes and the Galois action (CM.2).
-- Test blochClassU_index_set: not stated; needs K₂ of E over a number field with the classes S_a of EllipticKTheory E.7/bloch-classes and the Galois action (CM.2).

-- ER.5/nonvanishing-and-what-is-not-claimed: not stated; needs the Euler product of a Hecke L-series over ideals (Tau Ceti ArithmeticDirichletSeries layer 0).

-- ER.5/cm-twisting-and-distribution: not stated; needs the CM action of O on E[C] (CM.2).

-- ER.5/fourier-transform-of-the-character: not stated; needs the finite character of the Grössencharakter (CM.4).

section ER5Part

/-! ## ER.5 part (`EllipticRegulators--ER.5.lean`, packet `EllipticRegulators--ER.5.json`)

Join: working namespace `BP_ER5` → `TauCeti.EllipticRegulator` (the packet's
`library.namespace`); the packet names are unchanged. Name clashes resolved by removing the part's
local copies (same objects): `T` (ER.4's `T`, identical), `pairingO`, `fourierO` and
`finiteFourier10` (the parent's ER.5 and ER.4 declarations; the part's `stdAddChar` kernels are the
parent's `exp(2πi(·)/C)` kernels, and its `/ C`, `/ C^2` are the parent's `C⁻¹ *`, `(C^2)⁻¹ *`).
`oppositeFourier` and the finite test tables keep their names.

The shared build has pinned Mathlib; the cited Tau Ceti modules lack object files.
Their exact suggested forms are comments below, with the pinned declarations
read directly in source. No Tau Ceti library build is started.

The eight accepted parent declarations are imported by identifier in the packet,
not re-created here. In particular the CM, conductor, torsion-class and K₂
carriers are unavailable. Their signatures are omitted below where they cannot
honestly be stated. There are no substitute Prop-valued fields or fake axioms.
-/

open scoped BigOperators ComplexConjugate
open NumberField

-- Concrete coordinate adapters for the IMPORTED parent Fourier API.
-- Joined file: the part's `T C := ZMod C × ZMod C` is ER.4's `T`; its `pairingO C x y :=
-- ZMod.stdAddChar (-x.1 * y.2 + x.2 * y.1)` and `fourierO C F x := (∑ y, F y * pairingO C x y) / C`
-- are the parent's `pairingO` and `fourierO`.
abbrev oppositeFourier (C : ℕ) [NeZero C] (F : T C → ℂ) (x : T C) : ℂ :=
  (∑ y : T C, F y * pairingO C y x) / (C : ℂ)
-- Joined file: the part's `finiteFourier10 C f u := (∑ v, f v * star (ZMod.stdAddChar
-- (v.1 * u.1 - v.2 * u.2))) / C^2` is the parent's `finiteFourier10`.

-- dual-first-fourier-comparison: the expressible coordinate statement.
theorem dualFirstFourierComparison (C : ℕ) [NeZero C] (F : T C → ℂ) (u : T C) :
    fourierO C F u = (C : ℂ) * finiteFourier10 C (fun v => F (v.2,v.1)) u := by
  sorry

-- cm-gauss-coefficient. gC is the residue of conjugate g in the CM application;
-- the raw finite-weight definition itself needs no unavailable CM carrier.
def cmGaussCoefficient (C : ℕ) [NeZero C] (F : T C → ℂ) (g : ℂ) (gC : T C) : ℂ :=
  g * fourierO C F gC
lemma cmGaussCoefficient_apply (C : ℕ) [NeZero C] (F : T C → ℂ)
    (g : ℂ) (gC : T C) :
    cmGaussCoefficient C F g gC =
      g * ((∑ x : T C, F x * pairingO C gC x) / (C : ℂ)) := by
  sorry
lemma cmGaussCoefficient_congr (C : ℕ) [NeZero C] (F G : T C → ℂ)
    (h : ∀ x, F x = G x) (g : ℂ) (gC : T C) :
    cmGaussCoefficient C F g gC = cmGaussCoefficient C G g gC := by
  sorry
lemma cmGaussCoefficient_zero (C : ℕ) [NeZero C] (g : ℂ) (gC : T C) :
    cmGaussCoefficient C (fun _ => 0) g gC = 0 := by
  sorry
lemma cmGaussCoefficient_add (C : ℕ) [NeZero C] (F G : T C → ℂ)
    (g : ℂ) (gC : T C) :
    cmGaussCoefficient C (fun x => F x + G x) g gC =
      cmGaussCoefficient C F g gC + cmGaussCoefficient C G g gC := by
  sorry
lemma cmGaussCoefficient_smul (C : ℕ) [NeZero C] (F : T C → ℂ)
    (c g : ℂ) (gC : T C) :
    cmGaussCoefficient C (fun x => c * F x) g gC = c * cmGaussCoefficient C F g gC := by
  sorry
lemma cmGaussCoefficient_oppositeKernel (C : ℕ) [NeZero C] (F : T C → ℂ)
    (hodd : ∀ x, F (-x) = -F x) (g : ℂ) (gC : T C) :
    g * oppositeFourier C F gC = -cmGaussCoefficient C F g gC := by
  sorry

/- These API statements require the imported, presently unavailable CM datum:
cmGaussCoefficient_changeGenerator:
  f' = ζ f, g' = ζ⁻¹g, C fixed, ζ∈μ => Γ_C(χ,g') = Γ_C(χ,g).
cmGaussCoefficient_real:
  primitive χ, χ(x̄)=χ̄(x), (f̄)=(f), χ|μ=embedding => conjugate Γ = Γ.
cmGaussCoefficient_norm:
  under those same CM hypotheses, ‖Γ‖ = N(g) = C²/N(f) > 0.
primitiveGaussNormalization (primitive-gauss-normalization):
  support Hχ = ḡ·(O/f̄)×; |Hχ(ḡ)|²=N(g); Γ real and nonzero.
These are full conditional statements in the reader; they are not weakened to
unconditional claims about arbitrary finite weights. Their eventual signatures
must use CM.4's character/conductor API, not an arbitrary predicate called CM.

conductorFiberRegulatorEvaluation (conductor-fiber-regulator-evaluation):
  sum_w Hχ(w) R_C(w) = Γ_C(χ,g) sum_x∈W χ(x) R_C(x).
unitOrbitRegulatorCount (unit-orbit-regulator-count):
  μ acts freely on W; x↦xχ̄(x) identifies W/μ with its image;
  sum_x∈W χ(x) R_C(x) = |μ| R_q(U).
  Rational descent of U and its pure-imaginary regulator require the selected
  uniformization to transport conjugation to z↦z̄; CM.1/2 certify this input.
principalGeneratorLSeriesComparison (principal-generator-L-series-comparison):
  sum_a≠0 χ(a)/(a²ā) = |μ| LSeries(normCoeff κ ψ.toIdealArithmeticFunction,2).
These require E.7's S and K₂ carriers and CM.4's principal-ideal law. They are
omitted, rather than turned into statements about a fabricated K₂ type.
-/

/- The Tau Ceti modules below exist at the pin but lack prebuilt object files.
Their forms are therefore recorded, without a shadow implementation:
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Convergence
import TauCeti.NumberTheory.ArithmeticDirichletSeries.EulerProduct.Analytic
open TauCeti

-- cm-ideal-series-at-two: expressible norm-growth specialization. The owner
-- CM.4 supplies the particular ψ and hnorm; the bound itself is concrete.
theorem cmIdealSeriesConverges {K : Type*} [Field K] [NumberField K]
    (ψ : MultiplicativeIdealWeight K)
    (hnorm : ∀ J : (Ideal (𝓞 K))⁰,
      ‖ψ (J : Ideal (𝓞 K))‖ ≤ (Ideal.absNorm (J : Ideal (𝓞 K)) : ℝ)^((1:ℝ)/2))
    {s : ℂ} (hs : (3:ℝ)/2 < s.re) :
    Summable (idealTerm K ψ.toIdealArithmeticFunction s) := by
  sorry
-- This is the exact existing baseline implication, not new ideal Euler theory.
example {K : Type*} [Field K] [NumberField K] (ψ : MultiplicativeIdealWeight K)
    (hs : Summable (idealTerm K ψ.toIdealArithmeticFunction (2:ℂ))) :
    LSeries (normCoeff K ψ.toIdealArithmeticFunction) (2:ℂ) ≠ 0 := by
  sorry
-- cm-ideal-series-at-two combines the incoming bound with that implication.
theorem cmIdealSeriesAtTwo {K : Type*} [Field K] [NumberField K]
    (ψ : MultiplicativeIdealWeight K)
    (hnorm : ∀ J : (Ideal (𝓞 K))⁰,
      ‖ψ (J : Ideal (𝓞 K))‖ ≤ (Ideal.absNorm (J : Ideal (𝓞 K)) : ℝ)^((1:ℝ)/2)) :
    Summable (idealTerm K ψ.toIdealArithmeticFunction (2:ℂ)) ∧
      LSeries (normCoeff K ψ.toIdealArithmeticFunction) (2:ℂ) ≠ 0 := by
  sorry

-/

-- unit-factor-cancellation-certificate: actual complex scalar algebra. Its two
-- hypotheses are the separately planned equalities for A_C, not K₂ substitutes.
theorem unitFactorCancellationCertificate (C w : ℕ) (y : ℝ) (Γ A R L : ℂ)
    (hC : 0 < C) (hw : 0 < w) (hy : 0 < y)
    (hreg : A = (w:ℂ) * Γ * R)
    (hseries : A = (Complex.I * (y:ℂ)^2 * (C:ℂ)^4 / (Real.pi:ℂ)) * (w:ℂ) * L) :
    L = ((Real.pi:ℂ) * Γ / (Complex.I * (y:ℂ)^2 * (C:ℂ)^4)) * R := by
  sorry

-- The opposite-kernel coefficient is Γop = -Γ. Expressing the corrected
-- theorem with Γop requires a second minus, leaving the actual L-value fixed.
example (C w : ℕ) (y : ℝ) (Γ Γop A R L : ℂ)
    (hC : 0 < C) (hw : 0 < w) (hy : 0 < y) (hop : Γop = -Γ)
    (hreg : A = (w:ℂ) * Γ * R)
    (hseries : A = (Complex.I * (y:ℂ)^2 * (C:ℂ)^4 / (Real.pi:ℂ)) * (w:ℂ) * L) :
    L = (-(Real.pi:ℂ) * Γop / (Complex.I * (y:ℂ)^2 * (C:ℂ)^4)) * R := by
  sorry

-- Finite tables for tests; these are coordinate models of imported χ, not a
-- second conductor or CM character construction.
abbrev chi4 (x : T 4) : ℂ :=
  if x.1.val % 2 = x.2.val % 2 then 0
  else if x.1.val % 2 = 1 then
    if (x.1.val + x.2.val) % 4 = 1 then 1 else -1
  else if (x.1.val + x.2.val) % 4 = 1 then Complex.I else -Complex.I
abbrev tau3 : ℂ := (1 + (Real.sqrt 3:ℂ) * Complex.I) / 2
abbrev chi6 (x : T 6) : ℂ :=
  let r : T 6 := (x.1 + 2*x.2, 2*x.1 + x.2)
  if r = (1,2) then 1 else if r = (5,4) then -1
  else if r = (2,1) then tau3 else if r = (4,5) then -tau3
  else if r = (1,5) then tau3 - 1 else if r = (5,1) then 1 - tau3 else 0
abbrev chi7 (x : T 7) : ℂ :=
  let r := (x.1 + 4*x.2).val
  if r = 0 then 0 else if r = 1 ∨ r = 2 ∨ r = 4 then 1 else -1
abbrev chi14 (x : T 14) : ℂ :=
  chi7 ((x.1.val : ZMod 7),(x.2.val : ZMod 7))
abbrev indicator4 (x : T 4) : ℂ :=
  if x.1.val % 2 = x.2.val % 2 then 0 else 1

-- All seven tests attached to the new definition, under their packet names.
-- cmGaussCoefficient_Qi_C4
example : fourierO 4 chi4 (1,1) = 1 + Complex.I ∧
    cmGaussCoefficient 4 chi4 (1-Complex.I) (1,1) = 2 := by
  sorry
-- cmGaussCoefficient_Eisenstein_C6
example : fourierO 6 chi6 (5,2) = (Real.sqrt 3:ℂ)*Complex.I ∧
    cmGaussCoefficient 6 chi6 (-(Real.sqrt 3:ℂ)*Complex.I) (5,2) = 3 := by
  sorry
-- cmGaussCoefficient_Qsqrt7_C7
example : fourierO 7 chi7 (6,2) = (Real.sqrt 7:ℂ)*Complex.I ∧
    cmGaussCoefficient 7 chi7 (-(Real.sqrt 7:ℂ)*Complex.I) (6,2) = 7 := by
  sorry
-- cmGaussCoefficient_zero_weight
example : cmGaussCoefficient 4 (fun _ => 0) (1-Complex.I) (1,1) = 0 := by
  sorry
-- cmGaussCoefficient_wrong_kernel
example : (1-Complex.I) * oppositeFourier 4 chi4 (1,1) = -2 := by
  sorry
-- cmGaussCoefficient_imprimitive
example : fourierO 4 indicator4 (1,1) = 0 ∧
    cmGaussCoefficient 4 indicator4 (1-Complex.I) (1,1) = 0 := by
  sorry
-- cmGaussCoefficient_changeGenerator_Qi: f' = i*f, g' = -i*g.
example : cmGaussCoefficient 4 chi4 (-1-Complex.I) (3,1) = 2 := by
  sorry

-- Imported parent definition tests relevant to the new comparison.
-- fourierO_output_index: same output, no swap.
example : fourierO 3 (fun x => if x = (1,0) then 1 else 0) (0,1) =
    Complex.exp (2*(Real.pi:ℂ)*Complex.I/3)/3 := by
  sorry
example : fourierO 3 (fun x => if x = (1,0) then 1 else 0) (1,0) = 1/3 := by
  sorry
-- Gaussian χ is odd, agrees with the embedding on μ, and kills nonunits.
example : chi4 (1,0) = 1 ∧ chi4 (0,1) = Complex.I ∧ chi4 (1,1) = 0 := by
  sorry
example : ∀ x : T 4, chi4 (-x) = -chi4 x := by
  sorry

-- three-CM-normalization-examples: exact finite orbit certificate; actual K₂
-- equalities U=S_1/4+S_(3+2i)/4 and the three Eisenstein classes require E.7.
abbrev gaussianIndex (x : T 4) : T 4 :=
  if chi4 x = 1 then x else if chi4 x = -1 then -x
  else if chi4 x = Complex.I then (x.2,-x.1) else (-x.2,x.1)
example : {x : T 4 | chi4 x ≠ 0}.ncard = 8 := by
  sorry
example : (gaussianIndex '' {x : T 4 | chi4 x ≠ 0}) = {(1,0),(3,2)} := by
  sorry

-- extra-prime-level-counterexample: exact finite cardinalities, numerical
-- factor-two diagnostic is recorded in the reader, not asserted here as proof.
example : {x : T 14 | chi14 x ≠ 0}.ncard = 168 := by
  sorry
example : cmGaussCoefficient 14 chi14 (-2*(Real.sqrt 7:ℂ)*Complex.I) (12,4) = 28 := by
  sorry

/- Imported parent construction signatures, API and tests remain definitive in
EllipticRegulators.json, EllipticKTheory E.7 and the CM owner files:
cmHeckeCharacter, cmHeckeCharacter_conductor ((f̄)=(f)), cmFiniteCharacter_conj,
deuringComparison, deuringComparison_badPrimes, cm_maximal_order;
deuring_32a2, deuring_bad_prime_32a2, not_from_endomorphisms, cm_fields_over_Q.
cmCharExtend, blochClassU, blochClassU_summand_orbit,
blochClassU_galois_invariant, blochClassU_descends, blochClassU_rational;
blochClassU_Qi_C4, blochClassU_zero_point, blochClassU_descends_test,
blochClassU_index_set. No new definition in this part replaces those imports.
The general parent pairing/Fourier API (inversion, multiplication, Parseval)
remains in AC.0; only its coordinate comparison is prototyped here.
-/

end ER5Part

/-! # Layer ER.6 -/

/-! ## ER.6 — integral parts and the Beilinson statement
The integral part is EllipticKTheory E.6's `integralPart`; the Deligne target is ER.2's. The
regulator on the integral part, `BeilinsonConjecture` and `beilinson_forms_equivalent` are stated
against those declarations and are left out of this file until they exist; in particular no
`True`-valued placeholder is used for them. -/

/-! ### ER.6: items not yet stated (parent)
Each needs an object that no pinned library has, named on its line. -/

-- ER.6/the-regulator-on-the-integral-part: not stated; needs EllipticKTheory E.6's integral part and M.8's Deligne target, neither in a pinned library.
-- regulatorOnIntegralPart: not stated; needs EllipticKTheory E.6's integral part and M.8's Deligne target, neither in a pinned library.
-- regulatorOnIntegralPart_apply: not stated; needs EllipticKTheory E.6's integral part and M.8's Deligne target, neither in a pinned library.
-- regulatorOnIntegralPart_realify: not stated; needs EllipticKTheory E.6's integral part and M.8's Deligne target, neither in a pinned library.
-- regulatorTarget_finrank: not stated; needs EllipticKTheory E.6's integral part and M.8's Deligne target, neither in a pinned library.
-- Test regulatorOnIntegralPart_compat: not stated; needs EllipticKTheory E.6's integral part and M.8's Deligne target, neither in a pinned library.
-- Test regulatorTarget_Qi: not stated; needs EllipticKTheory E.6's integral part and M.8's Deligne target, neither in a pinned library.
-- Test regulatorOnIntegralPart_bloch: not stated; needs EllipticKTheory E.6's integral part and M.8's Deligne target, neither in a pinned library.
-- Test regulatorOnIntegralPart_not_defined_off_integral: not stated; needs EllipticKTheory E.6's integral part and M.8's Deligne target, neither in a pinned library.
-- Test regulatorOnIntegralPart_constants: not stated; needs EllipticKTheory E.6's integral part and M.8's Deligne target, neither in a pinned library.

-- ER.6/the-beilinson-statement: not stated; needs the integral part (EllipticKTheory E.6) and the regulator on it (ER.6/the-regulator-on-the-integral-part).
-- BeilinsonConjecture: not stated; needs the integral part (EllipticKTheory E.6) and the regulator on it (ER.6/the-regulator-on-the-integral-part).
-- BeilinsonConjectureAtTwo: not stated; needs the integral part (EllipticKTheory E.6) and the regulator on it (ER.6/the-regulator-on-the-integral-part).
-- BeilinsonConjecture.finrank: not stated; needs the integral part (EllipticKTheory E.6) and the regulator on it (ER.6/the-regulator-on-the-integral-part).
-- BeilinsonConjecture.isIso: not stated; needs the integral part (EllipticKTheory E.6) and the regulator on it (ER.6/the-regulator-on-the-integral-part).
-- Test beilinson_rank_over_Q: not stated; needs the integral part (EllipticKTheory E.6) and the regulator on it (ER.6/the-regulator-on-the-integral-part).
-- Test beilinson_rank_over_Qi: not stated; needs the integral part (EllipticKTheory E.6) and the regulator on it (ER.6/the-regulator-on-the-integral-part).
-- Test beilinson_whole_K2_false: not stated; needs the integral part (EllipticKTheory E.6) and the regulator on it (ER.6/the-regulator-on-the-integral-part).
-- Test beilinson_at_two_needs_no_continuation: not stated; needs the integral part (EllipticKTheory E.6) and the regulator on it (ER.6/the-regulator-on-the-integral-part).

-- ER.6/three-conclusions-that-are-not-the-same: not stated; needs the statements it compares (ER.5, ER.7, ER.6/the-beilinson-statement).

-- ER.6/the-vertical-step-that-is-required: not stated; needs EllipticKTheory E.6/vertical-residues.

-- ER.6/potentially-good-reduction-integrality: not stated; needs regular models and vertical residues (EllipticKTheory E.6, StableReduction layer 5).

-- ER.6/beilinson-forms-equivalent: not stated; needs the functional equation of L(E, s) (EllipticCurveModularity R29.6), not pinned.

section ER6Part

/-! ## ER.6 part (`EllipticRegulators--ER.6.lean`, packet `EllipticRegulators--ER.6.json`)

Join: namespace `TauCeti.EllipticRegulators.ER6` (the part file, its packet's `library.namespace`
and `leanName`s) → `TauCeti.EllipticRegulator.ER6`; names relative to `ER6` are unchanged. No
replacements.

I below is an actual rational vector space; B is an actual Betti rational
structure. These are the linear algebra inputs to the imported ER.2/ER.6
regulator, not definitions of K-theory or Deligne cohomology. The arithmetic
specialisations cannot yet be stated at the baseline: see the boundary comments
at the end. No conjectural rank is assumed in the witness API.

The ER.2 request supplies B = H¹(E(C), Q(1))⁻ and its scalar-extension
comparison with the real Deligne target. The existing real-target computation
alone does not expose that rational API. Three API signatures below are also
separate packet lemma nodes because other nodes use them as prerequisites:
regulatorDet_changeBetti, HasDeterminantWitness.surjective and
HasDeterminantWitness.rescaleValue.
-/

open Module Filter
open scoped TensorProduct Topology

namespace ER6

variable {d : ℕ} {I B : Type*}
  [AddCommGroup I] [Module ℚ I] [AddCommGroup B] [Module ℚ B]

-- Packet node (marker added in the join): ER.6/regulator-determinant-in-betti-coordinates
/-- Columns are regulator images of the frame, in a fixed rational Betti basis. -/
def regulatorDet (b : Basis (Fin d) ℚ B)
    (r : I →ₗ[ℚ] ℝ ⊗[ℚ] B) (x : Fin d → I) : ℝ :=
  Matrix.det (fun i j => (b.baseChange ℝ).repr (r (x j)) i)

theorem regulatorDet_eq_matrix (b : Basis (Fin d) ℚ B)
    (r : I →ₗ[ℚ] ℝ ⊗[ℚ] B) (x : Fin d → I) :
    regulatorDet b r x = Matrix.det (fun i j => (b.baseChange ℝ).repr (r (x j)) i) := by
  sorry

theorem regulatorDet_changeFrame (b : Basis (Fin d) ℚ B)
    (r : I →ₗ[ℚ] ℝ ⊗[ℚ] B) (x : Fin d → I) (A : Matrix (Fin d) (Fin d) ℚ) :
    regulatorDet b r (fun j => ∑ k, A k j • x k) =
      regulatorDet b r x * (A.det : ℝ) := by
  sorry

-- Packet node (marker added in the join): ER.6/regulator-det-change-betti
theorem regulatorDet_changeBetti (b b' : Basis (Fin d) ℚ B)
    (r : I →ₗ[ℚ] ℝ ⊗[ℚ] B) (x : Fin d → I) :
    regulatorDet b r x =
      ((Matrix.det (fun i j => b.repr (b' j) i) : ℚ) : ℝ) * regulatorDet b' r x := by
  sorry

theorem regulatorDet_zero (hd : 0 < d) (b : Basis (Fin d) ℚ B) :
    regulatorDet b (0 : I →ₗ[ℚ] ℝ ⊗[ℚ] B) (fun _ => 0) = 0 := by
  sorry

theorem regulatorDet_pullback {J : Type*} [AddCommGroup J] [Module ℚ J]
    (b : Basis (Fin d) ℚ B) (r : I →ₗ[ℚ] ℝ ⊗[ℚ] B)
    (f : J →ₗ[ℚ] I) (x : Fin d → J) :
    regulatorDet b (r.comp f) x = regulatorDet b r (fun j => f (x j)) := by
  sorry

-- regulatorDet_identity: nearest baseline tensor-basis compatibility.
example (b : Basis (Fin d) ℚ B) :
    regulatorDet b (TensorProduct.mk ℚ ℝ B 1) b = 1 := by
  sorry

-- regulatorDet_empty: the determinant convention in dimension zero.
example (b : Basis (Fin 0) ℚ B) (r : I →ₗ[ℚ] ℝ ⊗[ℚ] B) (x : Fin 0 → I) :
    regulatorDet b r x = 1 := by
  sorry

-- regulatorDet_swap_two: signed determinant, not an absolute determinant.
example (b : Basis (Fin 2) ℚ B) :
    regulatorDet b (TensorProduct.mk ℚ ℝ B 1) (fun j => b (1 - j)) = -1 := by
  sorry

-- regulatorDet_double_one: changing a rational generator changes the coefficient.
example (b : Basis (Fin 1) ℚ B) :
    regulatorDet b (TensorProduct.mk ℚ ℝ B 1) (fun j => (2 : ℚ) • b j) = 2 := by
  sorry

-- Packet node (marker added in the join): ER.6/constructed-determinant-witness
/-- A constructed full-dimensional subspace with the required determinant value.
No assertion about the dimension or kernel of the whole domain is included. -/
def HasDeterminantWitness (b : Basis (Fin d) ℚ B)
    (r : I →ₗ[ℚ] ℝ ⊗[ℚ] B) (ell : ℝ) : Prop :=
  ell ≠ 0 ∧ ∃ (x : Fin d → I) (q : ℚ), q ≠ 0 ∧ regulatorDet b r x = (q : ℝ) * ell

theorem HasDeterminantWitness.mk (b : Basis (Fin d) ℚ B)
    (r : I →ₗ[ℚ] ℝ ⊗[ℚ] B) (ell : ℝ) (h : ell ≠ 0)
    (x : Fin d → I) (q : ℚ) (hq : q ≠ 0)
    (hdet : regulatorDet b r x = (q : ℝ) * ell) : HasDeterminantWitness b r ell := by
  sorry

theorem HasDeterminantWitness.det_ne_zero (b : Basis (Fin d) ℚ B)
    (r : I →ₗ[ℚ] ℝ ⊗[ℚ] B) (ell : ℝ) (h : HasDeterminantWitness b r ell) :
    ∃ x : Fin d → I, regulatorDet b r x ≠ 0 := by
  sorry

-- Packet node (marker added in the join): ER.6/determinant-witness-rescale-value
theorem HasDeterminantWitness.rescaleValue (b : Basis (Fin d) ℚ B)
    (r : I →ₗ[ℚ] ℝ ⊗[ℚ] B) (ell : ℝ) (a : ℚ) (ha : a ≠ 0) :
    HasDeterminantWitness b r ((a : ℝ) * ell) ↔ HasDeterminantWitness b r ell := by
  sorry

theorem HasDeterminantWitness.changeBetti (b b' : Basis (Fin d) ℚ B)
    (r : I →ₗ[ℚ] ℝ ⊗[ℚ] B) (ell : ℝ) :
    HasDeterminantWitness b r ell ↔ HasDeterminantWitness b' r ell := by
  sorry

theorem HasDeterminantWitness.liftAlongSurjection {J : Type*}
    [AddCommGroup J] [Module ℚ J] (b : Basis (Fin d) ℚ B)
    (r : I →ₗ[ℚ] ℝ ⊗[ℚ] B) (f : J →ₗ[ℚ] I) (hf : Function.Surjective f) (ell : ℝ) :
    HasDeterminantWitness b (r.comp f) ell ↔ HasDeterminantWitness b r ell := by
  sorry

-- Packet node (marker added in the join): ER.6/determinant-witness-surjective
theorem HasDeterminantWitness.surjective (b : Basis (Fin d) ℚ B)
    (r : I →ₗ[ℚ] ℝ ⊗[ℚ] B) (rR : ℝ ⊗[ℚ] I →ₗ[ℝ] ℝ ⊗[ℚ] B)
    (hR : ∀ (a : ℝ) (x : I), rR (a ⊗ₜ[ℚ] x) = a • r x)
    (ell : ℝ) (h : HasDeterminantWitness b r ell) : Function.Surjective rR := by
  sorry

-- determinantWitness_identity: an exact determinant certificate.
example (b : Basis (Fin d) ℚ B) :
    HasDeterminantWitness b (TensorProduct.mk ℚ ℝ B 1) 1 := by
  sorry

-- determinantWitness_zeroValue: zero leading coefficients are excluded explicitly.
example (b : Basis (Fin d) ℚ B) (r : I →ₗ[ℚ] ℝ ⊗[ℚ] B) :
    ¬ HasDeterminantWitness b r 0 := by
  sorry

-- determinantWitness_zeroRegulator: an arbitrary rational q=0 cannot certify a zero map.
example (hd : 0 < d) (b : Basis (Fin d) ℚ B) (ell : ℝ) :
    ¬ HasDeterminantWitness b (0 : I →ₗ[ℚ] ℝ ⊗[ℚ] B) ell := by
  sorry

-- determinantWitness_extraKernel: the projection Q² -> Q has a witness and a kernel.
example (b : Basis (Fin 1) ℚ B) :
    HasDeterminantWitness b
      ((TensorProduct.mk ℚ ℝ B 1).comp (LinearMap.fst ℚ B B)) 1 ∧
    ¬ Function.Injective (LinearMap.fst ℚ B B) := by
  sorry

-- Packet node (marker added in the join): ER.6/full-integral-basis-criterion
/-- The full conjecture's linear algebra: real injectivity is the extra condition.
Finite dimensionality of I is a conclusion in this signature, not an assumption. -/
theorem fullBasisCriterion (b : Basis (Fin d) ℚ B)
    (r : I →ₗ[ℚ] ℝ ⊗[ℚ] B) (rR : ℝ ⊗[ℚ] I →ₗ[ℝ] ℝ ⊗[ℚ] B)
    (hR : ∀ (a : ℝ) (x : I), rR (a ⊗ₜ[ℚ] x) = a • r x) (ell : ℝ) :
    (HasDeterminantWitness b r ell ∧ Function.Injective rR) ↔
      (ell ≠ 0 ∧ ∃ (a : Basis (Fin d) ℚ I) (q : ℚ),
        q ≠ 0 ∧ regulatorDet b r a = (q : ℝ) * ell) := by
  sorry

-- Packet node (marker added in the join): ER.6/modularity-supplied-leading-term-limit
/- The arithmetic E/Q specialisation below is obtained from R29.6, not from
WeierstrassCurve.LSeries alone. The conditional analytic calculation has genuine
functions and explicit identities; no surrogate proposition packages the FE.
The identity near zero is punctured because Mathlib's Gamma is totalised there. -/
theorem leadingTermLimit (d : ℕ) (N : ℕ) (hN : 0 < N)
    (w : ℤ) (hw : w = 1 ∨ w = -1) (L Lambda : ℂ → ℂ)
    (hcont : ContinuousAt Lambda 0)
    (hzero : ∀ᶠ s in 𝓝[≠] (0 : ℂ), Lambda s =
      (N : ℂ) ^ (s / 2) * (2 * (Real.pi : ℂ)) ^ (-(d : ℂ) * s) *
        Complex.Gamma s ^ d * L s)
    (htwo : Lambda 2 = (N : ℂ) * (2 * (Real.pi : ℂ)) ^ (-(2 * d : ℂ)) * L 2)
    (hFE : Lambda 0 = (w : ℂ) * Lambda 2) :
    Tendsto (fun s : ℂ => L s / s ^ d) (𝓝[≠] 0)
      (𝓝 ((w : ℂ) * (N : ℂ) * (2 * (Real.pi : ℂ)) ^ (-(2 * d : ℂ)) * L 2)) := by
  sorry

theorem leadingTermOrder (d : ℕ) (L : ℂ → ℂ) (hf : AnalyticAt ℂ L 0)
    (c : ℂ) (hc : c ≠ 0)
    (hlim : Tendsto (fun s : ℂ => L s / s ^ d) (𝓝[≠] 0) (𝓝 c)) :
    analyticOrderAt L 0 = d := by
  sorry

-- Packet node (marker added in the join): ER.6/determinant-witnesses-in-the-two-normalisations
theorem atTwoWitness_iff (b : Basis (Fin d) ℚ B)
    (r : I →ₗ[ℚ] ℝ ⊗[ℚ] B) (ellZero LTwo : ℝ)
    (N : ℕ) (hN : 0 < N) (w : ℤ) (hw : w = 1 ∨ w = -1)
    (hfactor : ellZero = (w : ℝ) * N * (2 * Real.pi) ^ (-(2 * d : ℤ)) * LTwo) :
    HasDeterminantWitness b r ellZero ↔
      HasDeterminantWitness b r (Real.pi ^ (-(2 * d : ℤ)) * LTwo) := by
  sorry

-- conductor32_factor: rational coefficient changes; the period is not redefined.
example : (1 : ℚ) * 32 * (2 : ℚ) ^ (-(2 : ℤ)) = 8 := by
  sorry

-- Packet node (marker added in the join): ER.6/strictness-and-a-vertical-non-example
-- horizontal_nonintegral_curve: DJZ Theorem 8.3 with g=1, f=x+12, m=x-4.
example : (WeierstrassCurve.mk (-1 : ℚ) 0 12 0 0).c₄ = 289 ∧
    (WeierstrassCurve.mk (-1 : ℚ) 0 12 0 0).Δ = -561600 := by
  sorry

-- Packet node (marker added in the join): ER.6/potentially-good-integrality-by-local-descent
-- (`potentiallyGoodIntegralityByDescent`) and ER.6/integral-nonzero-bloch-class
-- (`integralCMClassNonzero`), both omitted below.
/- Signatures omitted at the higher-object boundary, with no dummy K-groups:
potentiallyGoodIntegralityByDescent: I(E)=K2(E) tensor Q for E/F potentially
good at all finite places. Requires E.6 finite-extension reflection and
local-global integral membership (requested, Scholl I Corollary 1.3.4 and
Proposition 1.3.6; Scholl II section 2), plus the requested local regular-model,
model-independence and good-reduction integrality specialisations of E.6.
integralCMClassNonzero: Bloch's ER.5 class U lies in I(E) if E has potentially
good reduction everywhere. Nonvanishing of the universal regulator also uses
the ER.2 normalisation comparison as an explicit hypothesis. The potential-good
criterion belongs to the existing elliptic local-reduction layer. No full-rank conclusion, or automatic rational
determinant comparison from a rescaled dilogarithm, is asserted.
The genuine E/F target uses ER.2's Betti rational structure and universal
regulator; its normalisation comparison remains an inherited parent gap.
-/

end ER6

end ER6Part

/-! # Layer ER.7 -/

section ER7

open Complex
open scoped UpperHalfPlane MatrixGroups Real

open Filter Topology

/-! ## ER.7 — Eisenstein series, the Rankin–Selberg integral, the explicit Beilinson theorem -/

variable {N : ℕ} [NeZero N]

/-- Brunault (3.4): `E_x(z, s) = Σ' Im(z)^s / |m z + n|^(2s)` over `(m, n) ≡ x (mod N)`, `Re s > 1`. -/
noncomputable def eisensteinE (x : ZMod N × ZMod N) (z : ℍ) (s : ℂ) : ℂ :=
  ∑' p : {mn : ℤ × ℤ // mn ≠ 0 ∧ ((mn.1 : ZMod N), (mn.2 : ZMod N)) = x},
    ((z.im : ℝ) : ℂ) ^ s / ((‖(p.1.1 : ℂ) * z + p.1.2‖ : ℝ) : ℂ) ^ (2 * s)

/-- Brunault (3.9). -/
noncomputable def eisensteinStar (x : ZMod N × ZMod N) (z : ℍ) : ℝ := sorry

theorem tendsto_eisensteinE_sub_pole (x : ZMod N × ZMod N) (z : ℍ) :
    Tendsto (fun σ : ℝ => eisensteinE x z σ - (Real.pi : ℂ) / ((N : ℂ) ^ 2 * ((σ : ℂ) - 1)))
      (𝓝[>] 1) (𝓝 (eisensteinStar x z : ℂ)) := sorry

/-- (3.15), `x` a row vector. -/
theorem eisensteinStar_smul (x : ZMod N × ZMod N) (g : SL(2, ℤ)) (z : ℍ) :
    eisensteinStar x (g • z) =
      eisensteinStar (x.1 * (g 0 0 : ZMod N) + x.2 * (g 1 0 : ZMod N),
                      x.1 * (g 0 1 : ZMod N) + x.2 * (g 1 1 : ZMod N)) z := sorry

/-- Définition 70. -/
noncomputable def eisensteinStarOf (f : ZMod N → ℂ) (z : ℍ) : ℂ :=
  ∑ v, f v * eisensteinStar ((0 : ZMod N), v) z

theorem eisensteinStarOf_odd (f : ZMod N → ℂ) (hf : ∀ v, f (-v) = -f v) (z : ℍ) :
    eisensteinStarOf f z = 0 := sorry

/-- Test `eisensteinStarOf_odd` (degenerate): an odd `f`, e.g. an odd Dirichlet character, gives `0`. -/
example (χ : DirichletCharacter ℂ N) (hχ : χ.Odd) (z : ℍ) : eisensteinStarOf (fun v => χ v) z = 0 := by
  sorry

/-- API `eisensteinStar_conj`: `E*_(u,v)(−z̄) = E*_(−u,v)(z)`. -/
theorem eisensteinStar_conj (x : ZMod N × ZMod N) (z : ℍ) :
    eisensteinStar x ⟨-(starRingEnd ℂ) (z : ℂ), by sorry⟩ = eisensteinStar (-x.1, x.2) z := by
  sorry

/-- Test `eisensteinStar_T` (non-example of the column convention): `E*_(u,v)(z + 1) = E*_(u,u+v)(z)`. -/
example (x : ZMod N × ZMod N) (z : ℍ) :
    eisensteinStar x (ModularGroup.T • z) = eisensteinStar (x.1, x.1 + x.2) z := by
  sorry

-- eisensteinStarOf_fourier: not stated; needs the Fourier expansion (3.27) of E*_f in the cusp
-- parameter, whose K-Bessel-free form requires the Kronecker limit formulas (gap).
-- Test pole_normalisation: not stated; a statement that a limit does not exist needs the residue
-- π/N² of E_x at s = 1, which is ER.7/real-analytic-eisenstein-series's `tendsto_eisensteinE_sub_pole`.

/-- Test `eisensteinStar_levelOne_i` (Kronecker's first limit formula at `z = i`). -/
example : (eisensteinStar (N := 1) (0, 0) UpperHalfPlane.I : ℝ) =
    2 * Real.pi * (Real.eulerMascheroniConstant - Real.log 2
      - 2 * Real.log ‖ModularForm.eta Complex.I‖) := sorry

/-- Test `fourier_convention`: Brunault's `f̂` is `ZMod.dft`; for primitive even `χ`, `χ̂ = τ(χ) χ̄`. -/
example (χ : DirichletCharacter ℂ N) (hχ : χ.IsPrimitive) (he : χ.Even) (b : ZMod N) :
    ZMod.dft (fun v => χ v) b = gaussSum χ ZMod.stdAddChar * χ⁻¹ b := sorry

/-- Test `modularUnit_divisor_level5` at the level of L-values: `L(2, (·/5)) = 4π²/(25√5)`. -/
example (χ : DirichletCharacter ℂ 5) (hχ : χ.Even) (h1 : χ ≠ 1) :
    DirichletCharacter.LFunction χ 2 = 4 * (Real.pi : ℂ) ^ 2 / (25 * ((Real.sqrt 5 : ℝ) : ℂ)) := sorry

/-- ER.3 (to be supplied there with a real signature): the elliptic dilogarithm of a real
elliptic curve at a rational point, in the orientation making `∫_{E(ℝ)} ω > 0`. -/
noncomputable def ellipticDilogOfCurve (W : WeierstrassCurve ℚ) (P : ℚ × ℚ) : ℝ := sorry

/-- ER.7/the-X1-11-example (Corollaire 101) for `y² + y = x³ − x²`, `P = (0,0)`. -/
theorem LSeries_X1_11_two (W : WeierstrassCurve ℚ) (hW : W = ⟨0, -1, 1, 0, 0⟩) :
    W.LSeries 2 = (10 / 11 : ℂ) * Real.pi * ellipticDilogOfCurve W (0, 0) := sorry

theorem ellipticDilog_X1_11_exotic (W : WeierstrassCurve ℚ) (hW : W = ⟨0, -1, 1, 0, 0⟩) :
    ellipticDilogOfCurve W (1, -1) = 3 / 2 * ellipticDilogOfCurve W (0, 0) := sorry

end ER7

/-! ### ER.7: items not yet stated (parent)
Each needs an object that no pinned library has, named on its line. -/

-- ER.7/modular-units-and-their-divisors: not stated; needs the modular curve X₁(N)(ℂ) with its cusps (ModularCurvesPartII R12.3), absent at the pins; the Eisenstein series it is built from are stated above.
-- modularUnit: not stated; needs the modular curve X₁(N)(ℂ) with its cusps (ModularCurvesPartII R12.3), absent at the pins; the Eisenstein series it is built from are stated above.
-- modularUnit_logabs: not stated; needs the modular curve X₁(N)(ℂ) with its cusps (ModularCurvesPartII R12.3), absent at the pins; the Eisenstein series it is built from are stated above.
-- modularUnit_leadingCoeff: not stated; needs the modular curve X₁(N)(ℂ) with its cusps (ModularCurvesPartII R12.3), absent at the pins; the Eisenstein series it is built from are stated above.
-- modularUnit_unique: not stated; needs the modular curve X₁(N)(ℂ) with its cusps (ModularCurvesPartII R12.3), absent at the pins; the Eisenstein series it is built from are stated above.
-- modularUnit_divisor: not stated; needs the modular curve X₁(N)(ℂ) with its cusps (ModularCurvesPartII R12.3), absent at the pins; the Eisenstein series it is built from are stated above.
-- modularUnit_add: not stated; needs the modular curve X₁(N)(ℂ) with its cusps (ModularCurvesPartII R12.3), absent at the pins; the Eisenstein series it is built from are stated above.
-- modularUnit_eq_siegel: not stated; needs the modular curve X₁(N)(ℂ) with its cusps (ModularCurvesPartII R12.3), absent at the pins; the Eisenstein series it is built from are stated above.
-- Test modularUnit_odd: not stated; needs the modular curve X₁(N)(ℂ) with its cusps (ModularCurvesPartII R12.3), absent at the pins; the Eisenstein series it is built from are stated above.
-- Test modularUnit_trivial_character: not stated; needs the modular curve X₁(N)(ℂ) with its cusps (ModularCurvesPartII R12.3), absent at the pins; the Eisenstein series it is built from are stated above.
-- Test divisor_on_cusps: not stated; needs the modular curve X₁(N)(ℂ) with its cusps (ModularCurvesPartII R12.3), absent at the pins; the Eisenstein series it is built from are stated above.
-- Test modularUnit_primitive_fourier: not stated; needs the modular curve X₁(N)(ℂ) with its cusps (ModularCurvesPartII R12.3), absent at the pins; the Eisenstein series it is built from are stated above.

-- ER.7/the-regulator-integral-and-its-evaluation: not stated; needs X₁(N), newforms with character and K₂ of X₁(N) (ModularCurvesPartII R12.3, ModularForms layers 0 and 7).

-- ER.7/the-explicit-theorem-for-an-elliptic-curve: not stated; needs the newform of E (EllipticCurveModularity R29.6) and twisted L-values; its N = 11 instance is `LSeries_X1_11_two`.

-- ER.7/the-pushforward-and-its-hypotheses: not stated; needs a modular parametrisation X₀(N) → E (EllipticCurveModularity R29.5).

-- ER.7/kronecker-limit-formulas: not stated; needs the Dedekind eta function's transformation law and Siegel's continuation of E_x (gap); `ModularForm.eta` is pinned but the limit formula is not.

-- ER.7/dirichlet-series-convolution: not stated; needs L(f, s) of a newform with character (ModularForms layer 7).

-- ER.7/rankin-selberg-integral: not stated; needs the Petersson product on X₁(N) (ModularCurvesPartII R12.5, ModularForms layer 7).

-- ER.7/manin-drinfeld: not stated; needs the Jacobian of X₁(N) with its cuspidal subgroup (JacobianChallenge layer F, ModularCurvesPartII R12.3).

-- ER.7/harmonicity-of-eisenstein-series: not stated; needs X₁(N)(ℂ) as a Riemann surface (ModularCurvesPartII R12.3).

-- ER.7/divisors-of-character-units: not stated; needs the modular units u_χ on X₁(N).

-- ER.7/rationality-of-modular-units: not stated; needs the model of X₁(N) over ℚ (ModularCurvesPartII R12.6).

-- ER.7/symbols-of-modular-units-in-K2: not stated; needs K₂ of X₁(N) (EllipticKTheory-style K-theory of the modular curve), not pinned.

-- ER.7/explicit-beilinson-theorem-degeneracy: not stated; needs degeneracy maps of modular curves (ModularCurvesPartII R14.1).

-- ER.7/real-structure-of-the-regulator: not stated; needs the real structure of X₁(N) (ModularCurvesPartII R12.6).

-- ER.7/spanning-for-prime-level: not stated; needs K₂ of X₁(p) and its regulator.

-- ER.7/eta-form-of-divisors: not stated; needs one-forms on ℍ with Eisenstein coefficients, which need the modular units and a differential-forms API on ℍ.
-- etaDiv: not stated; needs one-forms on ℍ with Eisenstein coefficients, which need the modular units and a differential-forms API on ℍ.
-- etaDiv_antisymm: not stated; needs one-forms on ℍ with Eisenstein coefficients, which need the modular units and a differential-forms API on ℍ.
-- etaDiv_bilinear: not stated; needs one-forms on ℍ with Eisenstein coefficients, which need the modular units and a differential-forms API on ℍ.
-- d_etaDiv: not stated; needs one-forms on ℍ with Eisenstein coefficients, which need the modular units and a differential-forms API on ℍ.
-- etaDiv_eq_units: not stated; needs one-forms on ℍ with Eisenstein coefficients, which need the modular units and a differential-forms API on ℍ.
-- integral_eisenstein_eq_etaDiv: not stated; needs one-forms on ℍ with Eisenstein coefficients, which need the modular units and a differential-forms API on ℍ.
-- Test etaDiv_closed_degree_zero: not stated; needs one-forms on ℍ with Eisenstein coefficients, which need the modular units and a differential-forms API on ℍ.
-- Test etaDiv_not_closed: not stated; needs one-forms on ℍ with Eisenstein coefficients, which need the modular units and a differential-forms API on ℍ.
-- Test etaDiv_self: not stated; needs one-forms on ℍ with Eisenstein coefficients, which need the modular units and a differential-forms API on ℍ.
-- Test etaDiv_units_compat: not stated; needs one-forms on ℍ with Eisenstein coefficients, which need the modular units and a differential-forms API on ℍ.

-- ER.7/manin-cycle-and-its-boundary: not stated; needs relative homology of X₁(N) with Manin's presentation (ModularForms layer 8).
-- maninCycle: not stated; needs relative homology of X₁(N) with Manin's presentation (ModularForms layer 8).
-- maninCycle_boundary: not stated; needs relative homology of X₁(N) with Manin's presentation (ModularForms layer 8).
-- maninCycle_bilinear: not stated; needs relative homology of X₁(N) with Manin's presentation (ModularForms layer 8).
-- Test maninCycle_closed_primitive: not stated; needs relative homology of X₁(N) with Manin's presentation (ModularForms layer 8).
-- Test maninCycle_zero: not stated; needs relative homology of X₁(N) with Manin's presentation (ModularForms layer 8).
-- Test maninCycle_odd: not stated; needs relative homology of X₁(N) with Manin's presentation (ModularForms layer 8).

-- ER.7/unfolding-over-the-fundamental-domain: not stated; needs integration over a fundamental domain of Γ₁(N) (Mathlib's automorphize lemma exists, but the Eisenstein integrand needs X₁(N)).

-- ER.7/cycle-formula: not stated; needs relative cycles on X₁(N).

-- ER.7/nonvanishing-of-a-twisted-value: not stated; needs twisted L-values of a newform (ModularForms layer 7) and Merel's appendix (gap).

-- ER.7/rational-combination-for-L-E-2: not stated; needs the Néron period of E (NeronModelsAndSemistableAbelianVarieties R11.6) and the newform of E.

-- ER.7/prime-level-L-value-formula: not stated; needs the Rankin-Selberg residue (AutomorphicLFunctionsAndLocalFactors AL.3).

-- ER.7/regulator-under-finite-pushforward: not stated; needs pushforward of K₂ along finite maps of curves (gap).

section ER7Part

/-! ## ER.7 part (`EllipticRegulators--ER.7.lean`, packet `EllipticRegulators--ER.7.json`)

Join: namespace `EllipticRegulators.Modular` (the part file, its packet's `library.namespace` and
`declarationName`s) → `TauCeti.EllipticRegulator.Modular`; names relative to `Modular` are
unchanged. No replacements.

The baseline has no scheme K2/real Deligne/modular-unit carriers supplying the
geometric statements. The four constructions below prototype their algebraic
operations on supplied genuine modules, linear maps and group homomorphisms.
They do not implement those carriers or turn missing conditions into Prop fields.
The missing geometric instantiations and theorem signatures are identified below.

Actual Tau Ceti declarations read at the pin:
HeckeRing.GL2.Newform (TauCeti.NumberTheory.ModularForms.Newforms.Newform):
normalized new EigenformAwayFromLevel; no bad-prime eigenvalue interface implied.
UpperHalfPlane.peterssonInner
(TauCeti.NumberTheory.ModularForms.Petersson.Basic): conjugate-first integral.
Merel is first-linear and index-normalized. The geometry uses a supplier adapter.
Those modules are not imported into this Mathlib-only elaboration: the existing
shared Tau Ceti build is at a different commit, and no new build is created.
-/

namespace Modular

section Subspaces
variable {A B C D : Type*}
  [AddCommGroup A] [Module ℚ A] [AddCommGroup B] [Module ℚ B]
  [AddCommGroup C] [Module ℚ C] [AddCommGroup D] [Module ℚ D]

-- Packet node (marker added in the join): ER.7/fixed-level-beilinson-subspace
/-- Q_K: span first, then impose compactness by restriction. -/
def fixedLevelBeilinson (j : A →ₗ[ℚ] B) (S : Set B) : Submodule ℚ A :=
  (Submodule.span ℚ S).comap j

lemma fixedLevelBeilinson_mem (j : A →ₗ[ℚ] B) (S : Set B) (x : A) :
    x ∈ fixedLevelBeilinson j S ↔ j x ∈ Submodule.span ℚ S := by sorry

lemma fixedLevelBeilinson_id (S : Set A) :
    fixedLevelBeilinson LinearMap.id S = Submodule.span ℚ S := by sorry

lemma fixedLevelBeilinson_mono (j : A →ₗ[ℚ] B) {S T : Set B} (h : S ⊆ T) :
    fixedLevelBeilinson j S ≤ fixedLevelBeilinson j T := by sorry

lemma fixedLevelBeilinson_empty (j : A →ₗ[ℚ] B) (h : Function.Injective j) :
    fixedLevelBeilinson j ∅ = ⊥ := by sorry

lemma fixedLevelBeilinson_pullback (j : A →ₗ[ℚ] B) (j' : C →ₗ[ℚ] D)
    (a : A →ₗ[ℚ] C) (b : B →ₗ[ℚ] D) (S : Set B) (S' : Set D)
    (comm : j'.comp a = b.comp j)
    (hs : ∀ s ∈ S, b s ∈ Submodule.span ℚ S') :
    (fixedLevelBeilinson j S).map a ≤ fixedLevelBeilinson j' S' := by sorry

lemma fixedLevelBeilinson_linearCombination (j : A →ₗ[ℚ] B) (S : Set B)
    {ι : Type*} (s : Finset ι) (c : ι → ℚ) (x : ι → A)
    (h : ∀ i ∈ s, j (x i) ∈ Submodule.span ℚ S) :
    (∑ i ∈ s, c i • x i) ∈ fixedLevelBeilinson j S := by sorry

-- Packet node (marker added in the join): ER.7/beilinson-subspace
/-- P_K: geometric directedness is a separate theorem, not a definition field. -/
def beilinsonSubspace {ι : Type*} {M : ι → Type*}
    [∀ i, AddCommGroup (M i)] [∀ i, Module ℚ (M i)]
    (Q : ∀ i, Submodule ℚ (M i)) (t : ∀ i, M i →ₗ[ℚ] A) : Submodule ℚ A :=
  ⨆ i, (Q i).map (t i)

lemma beilinsonSubspace_transfer {ι : Type*} {M : ι → Type*}
    [∀ i, AddCommGroup (M i)] [∀ i, Module ℚ (M i)]
    (Q : ∀ i, Submodule ℚ (M i)) (t : ∀ i, M i →ₗ[ℚ] A)
    (i : ι) (x : M i) (hx : x ∈ Q i) :
    t i x ∈ beilinsonSubspace Q t := by sorry

lemma beilinsonSubspace_finiteWitness {ι : Type*} [Nonempty ι] {M : ι → Type*}
    [∀ i, AddCommGroup (M i)] [∀ i, Module ℚ (M i)]
    (Q : ∀ i, Submodule ℚ (M i)) (t : ∀ i, M i →ₗ[ℚ] A)
    (hd : Directed (· ≤ ·) (fun i => (Q i).map (t i))) (x : A) :
    x ∈ beilinsonSubspace Q t ↔ ∃ i, ∃ y ∈ Q i, t i y = x := by sorry

lemma beilinsonSubspace_single (Q : Submodule ℚ A) (t : A →ₗ[ℚ] B) :
    beilinsonSubspace (fun _ : Unit => Q) (fun _ => t) = Q.map t := by sorry

lemma beilinsonSubspace_zero {ι : Type*} {M : ι → Type*}
    [∀ i, AddCommGroup (M i)] [∀ i, Module ℚ (M i)]
    (t : ∀ i, M i →ₗ[ℚ] A) :
    beilinsonSubspace (fun i => (⊥ : Submodule ℚ (M i))) t = ⊥ := by sorry

lemma beilinsonSubspace_mono {ι : Type*} {M : ι → Type*}
    [∀ i, AddCommGroup (M i)] [∀ i, Module ℚ (M i)]
    (Q Q' : ∀ i, Submodule ℚ (M i)) (t : ∀ i, M i →ₗ[ℚ] A)
    (h : ∀ i, Q i ≤ Q' i) :
    beilinsonSubspace Q t ≤ beilinsonSubspace Q' t := by sorry

lemma beilinsonSubspace_map {ι : Type*} {M : ι → Type*}
    [∀ i, AddCommGroup (M i)] [∀ i, Module ℚ (M i)]
    (Q : ∀ i, Submodule ℚ (M i)) (t : ∀ i, M i →ₗ[ℚ] A) (f : A →ₗ[ℚ] B) :
    (beilinsonSubspace Q t).map f =
      beilinsonSubspace Q (fun i => f.comp (t i)) := by sorry

lemma beilinsonSubspace_degree (Q : Submodule ℚ A) (t : A →ₗ[ℚ] B)
    (d : ℚ) (hd : d ≠ 0) : Q.map (d • t) = Q.map t := by sorry

-- Packet node (marker added in the join): ER.7/elliptic-beilinson-subspace
/-- P_E,φ: the norm image of P_K. No norm injectivity is built in. -/
def ellipticBeilinsonSubspace (push : A →ₗ[ℚ] B) (P : Submodule ℚ A) :
    Submodule ℚ B := P.map push

lemma ellipticBeilinsonSubspace_mem (push : A →ₗ[ℚ] B) (P : Submodule ℚ A)
    (β : B) : β ∈ ellipticBeilinsonSubspace push P ↔ ∃ ξ ∈ P, push ξ = β := by sorry

lemma ellipticBeilinsonSubspace_id (P : Submodule ℚ A) :
    ellipticBeilinsonSubspace LinearMap.id P = P := by sorry

lemma ellipticBeilinsonSubspace_comp (f : A →ₗ[ℚ] B) (g : B →ₗ[ℚ] C)
    (P : Submodule ℚ A) :
    ellipticBeilinsonSubspace (g.comp f) P =
      ellipticBeilinsonSubspace g (ellipticBeilinsonSubspace f P) := by sorry

lemma ellipticBeilinsonSubspace_zero (P : Submodule ℚ A) :
    ellipticBeilinsonSubspace (0 : A →ₗ[ℚ] B) P = ⊥ := by sorry

lemma ellipticBeilinsonSubspace_regulator (push : A →ₗ[ℚ] B)
    (rA : A →ₗ[ℚ] C) (rB : B →ₗ[ℚ] D) (t : C →ₗ[ℚ] D)
    (comm : rB.comp push = t.comp rA) (P : Submodule ℚ A) :
    (ellipticBeilinsonSubspace push P).map rB = (P.map rA).map t := by sorry

lemma ellipticBeilinsonSubspace_integral (push : A →ₗ[ℚ] B)
    (P IA : Submodule ℚ A) (IB : Submodule ℚ B)
    (hp : P ≤ IA) (hi : IA.map push ≤ IB) :
    ellipticBeilinsonSubspace push P ≤ IB := by sorry
end Subspaces

section Reduction
variable {U V : Type*} [Group U] [CommGroup V]

-- Packet node (marker added in the join): ER.7/ordinary-unit-reduction
/-- The DVR residue of u^ord(p)/p^ord(u), with its ramification exponent. -/
def normalizedUnitReduction (v : U →* Multiplicative ℤ) (ac : U →* V)
    (p u : U) : V :=
  ac u ^ (Multiplicative.toAdd (v p)) / ac p ^ (Multiplicative.toAdd (v u))

lemma normalizedUnitReduction_formula (v : U →* Multiplicative ℤ)
    (ac : U →* V) (p u : U) :
    normalizedUnitReduction v ac p u =
      ac u ^ (Multiplicative.toAdd (v p)) / ac p ^ (Multiplicative.toAdd (v u)) := by sorry

lemma normalizedUnitReduction_mul (v : U →* Multiplicative ℤ)
    (ac : U →* V) (p u w : U) :
    normalizedUnitReduction v ac p (u * w) =
      normalizedUnitReduction v ac p u * normalizedUnitReduction v ac p w := by sorry

lemma normalizedUnitReduction_inv (v : U →* Multiplicative ℤ)
    (ac : U →* V) (p u : U) :
    normalizedUnitReduction v ac p u⁻¹ = (normalizedUnitReduction v ac p u)⁻¹ := by sorry

lemma normalizedUnitReduction_zpow (v : U →* Multiplicative ℤ)
    (ac : U →* V) (p u : U) (a : ℤ) :
    normalizedUnitReduction v ac p (u ^ a) = (normalizedUnitReduction v ac p u) ^ a := by sorry

lemma normalizedUnitReduction_orderZero (v : U →* Multiplicative ℤ)
    (ac : U →* V) (p u : U) (hu : Multiplicative.toAdd (v u) = 0) :
    normalizedUnitReduction v ac p u = ac u ^ (Multiplicative.toAdd (v p)) := by sorry

lemma normalizedUnitReduction_multiplyBase (v : U →* Multiplicative ℤ)
    (ac : U →* V) (p u : U) (a : ℤ) :
    normalizedUnitReduction v ac p (u * p ^ a) = normalizedUnitReduction v ac p u := by sorry

lemma normalizedUnitReduction_changeAngular (v : U →* Multiplicative ℤ)
    (ac ac' : U →* V) (t : V)
    (h : ∀ x, ac' x = ac x * t ^ (-Multiplicative.toAdd (v x))) (p u : U) :
    normalizedUnitReduction v ac' p u = normalizedUnitReduction v ac p u := by sorry
end Reduction

section Tests
-- fixedLevelBeilinson_test_identity
example : fixedLevelBeilinson (LinearMap.id : ℚ →ₗ[ℚ] ℚ) {1} = ⊤ := by sorry

-- fixedLevelBeilinson_test_empty
example : fixedLevelBeilinson
    ((LinearMap.id : ℚ →ₗ[ℚ] ℚ).prod 0) (∅ : Set (ℚ × ℚ)) = ⊥ := by sorry

-- fixedLevelBeilinson_test_cancellation: individual generators lie outside j(A).
example : (1 : ℚ) ∈ fixedLevelBeilinson
    ((LinearMap.id : ℚ →ₗ[ℚ] ℚ).prod 0) ({(1,1), (0,1)} : Set (ℚ × ℚ)) := by sorry

-- fixedLevelBeilinson_test_vertical
example : (1 : ℚ) ∉ fixedLevelBeilinson
    ((LinearMap.id : ℚ →ₗ[ℚ] ℚ).prod 0) ({(0,1)} : Set (ℚ × ℚ)) := by sorry

-- beilinsonSubspace_test_single
example (Q : Submodule ℚ (ℚ × ℚ)) :
    beilinsonSubspace (fun _ : Unit => Q) (fun _ => LinearMap.id) = Q := by sorry

-- beilinsonSubspace_test_zero
example : beilinsonSubspace (fun _ : Unit => (⊥ : Submodule ℚ ℚ))
    (fun _ => (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) = ⊥ := by sorry

-- beilinsonSubspace_test_newLevel
example : beilinsonSubspace
    (fun n : ℕ => if n = 0 then Submodule.span ℚ ({(1,0)} : Set (ℚ × ℚ)) else ⊤)
    (fun _ => (LinearMap.id : (ℚ × ℚ) →ₗ[ℚ] (ℚ × ℚ))) = ⊤ ∧
    Submodule.span ℚ ({(1,0)} : Set (ℚ × ℚ)) ≠ ⊤ := by sorry

-- beilinsonSubspace_test_degree
example : beilinsonSubspace (fun _ : Unit => (⊤ : Submodule ℚ ℚ))
    (fun _ => (2 : ℚ) • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) = ⊤ := by sorry

-- normalizedUnitReduction_test_base
example {U V : Type*} [Group U] [CommGroup V]
    (v : U →* Multiplicative ℤ) (ac : U →* V) (p : U) :
    normalizedUnitReduction v ac p p = 1 := by sorry

-- normalizedUnitReduction_test_unramified
example {U V : Type*} [Group U] [CommGroup V]
    (v : U →* Multiplicative ℤ) (ac : U →* V) (p u : U)
    (hp : Multiplicative.toAdd (v p) = 1) (hu : Multiplicative.toAdd (v u) = 0) :
    normalizedUnitReduction v ac p u = ac u := by sorry

-- normalizedUnitReduction_test_ramified: specialized residue 2 produces 4.
example {U : Type*} [Group U] (v : U →* Multiplicative ℤ) (ac : U →* ℚˣ)
    (p u : U) (hp : Multiplicative.toAdd (v p) = 2)
    (hu : Multiplicative.toAdd (v u) = 0) (ha : (ac u : ℚ) = 2) :
    ((normalizedUnitReduction v ac p u : ℚˣ) : ℚ) = 4 := by sorry

-- normalizedUnitReduction_test_baseMultiple
example {U V : Type*} [Group U] [CommGroup V]
    (v : U →* Multiplicative ℤ) (ac : U →* V) (p u : U) :
    normalizedUnitReduction v ac p (u * p ^ (3 : ℤ)) = normalizedUnitReduction v ac p u := by sorry

-- ellipticBeilinsonSubspace_test_identity
example : ellipticBeilinsonSubspace LinearMap.id
    (Submodule.span ℚ ({(1,0)} : Set (ℚ × ℚ))) =
    Submodule.span ℚ ({(1,0)} : Set (ℚ × ℚ)) := by sorry

-- ellipticBeilinsonSubspace_test_zero
example : ellipticBeilinsonSubspace (0 : ℚ →ₗ[ℚ] ℚ) ⊤ = ⊥ := by sorry

-- ellipticBeilinsonSubspace_test_projection
example : ellipticBeilinsonSubspace (LinearMap.fst ℚ ℚ ℚ)
    (Submodule.span ℚ ({(0,1)} : Set (ℚ × ℚ))) = ⊥ := by sorry

-- ellipticBeilinsonSubspace_test_degree
example : ellipticBeilinsonSubspace
    ((3 : ℚ) • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) ⊤ = ⊤ := by sorry
end Tests

/-!
Geometric theorem signatures omitted because the supplier carriers/conditions are
not yet expressible at the pins. The full mathematical signatures are in the
packet and reader under these node ids. No dummy carrier or axiomatized predicate
stands in for them:

ER.7/cuspidal-hecke-separation — disjoint good-prime cusp/Jacobian Hecke spectra;
requires algebraic modular curves, Jacobian and compatible cusp correspondences.
ER.7/constant-symbol-regulator-correction — compact lift with unchanged projected
regulator; full-level F-rational cusp units and Weil reciprocity keep the lift
in the unit-symbol span; requires early L1 and compact/open Deligne projection.
ER.7/regulator-period-inclusion — all-embedding period-line inclusion;
requires normalized RS, coefficient field periods and real Deligne regulator.
The L-value quotient in SS 2.3 has no 2πi factor; that factor belongs to
the regulator integral in SS 1.3.2 and 5.2.
ER.7/regulator-nonvanishing-after-level-change — finite auxiliary-level nonzero
pairing, never primitive-character existence at the initial level.
ER.7/isotypic-regulator-image — full Hom(Vπ^K,Qbar) image, including oldvectors.
ER.7/beilinson-rational-structure — Q-structure of real Betti H¹(1), not full K2 rank.
ER.7/beilinson-determinant-formula — g-th derivative determinant line modulo Q×.
ER.7/supersingular-orders-of-modular-units — componentwise equal orders using the
cuspidal supersingular module quotient Qbar[Σ]/Qbar[S].
ER.7/full-level-modular-symbol-integrality — vertical tame boundaries vanish over
finite fields; requires arithmetic-surface localization with weight comparison.
ER.7/integral-beilinson-subspace — P_K lies in the model-independent integral part.
General modular curves need resolved regular graphs/common models, total K/G
transfer and restriction-compatible weight projectors, not elliptic-only E.6.
ER.7/elliptic-regulator-adjointness — proper covariance, form duality and invariant
rational Galois descent on E, without an unproved orbit-sum noncancellation claim.
Its compact-class proof does not close the stronger inherited function-field
assertion; that compact/open functorial extension remains in G2.
ER.7/modular-elliptic-regulator-line — integral class β with regulator L′(E,0)b;
conditional on φ/f first, then uses R29.5/R29.6 for every E/Q.

Inherited definitions/theorems retain their names in EllipticRegulators.lean and
are imported by packet id, not declared a second time here. In particular the
Kronecker formulas, Manin–Drinfeld, Brunault's explicit theorem and Merel-based
prime-level formulas are not fresh definitions. G3 retains analytic E15/E16
error-location obligations; G4 retains the rigorous X1(11) sign obligation.
-/

end Modular

end ER7Part

/-! # Layer ER.8 -/

/-! ## ER.8 — worked examples
The regulator values of ER.8/the-integrality-worked-example
(`r_E({x, y} + {-1, x})(ω) = -(5 i / 4) D_E(P) = -(π i / 2) L'(E, 0)`) and the P¹ identity
(`∫_γ η(z, 1 - z) = D(e^{iπ/3})`) are stated once ER.2's `symbolRegulator` and Polylogarithms'
Bloch–Wigner function have real signatures; until then they are left out, not replaced by `True`. -/

/-! ### ER.8: items not yet stated (parent)
Each needs an object that no pinned library has, named on its line. -/

-- ER.8/the-syntomic-comparison: not stated; needs the syntomic regulator (PadicHodgeRegulators D.5) and Coleman integration (ColemanIntegration L1).

-- ER.8/the-normalisation-example: not stated; needs Polylogarithms P.5's η(f, g) as a pinned form and P.1's Bloch-Wigner function.

-- ER.8/the-CM-worked-example: not stated; needs Bloch's class U (ER.5) and EllipticKTheory E.8's certificates.

-- ER.8/the-nonrational-torsion-example: not stated; needs points over ℚ(√−3) and the transfer of K₂ (EllipticKTheory E.7/transfer-of-certified-classes).

-- ER.8/the-conductor-14-example: not stated; needs the regulator of Siegel-unit classes of Brunault 2016, which needs X₁(14).

section ER8Part

/-! ## ER.8 part (`EllipticRegulators--ER.8.lean`, packet `EllipticRegulators--ER.8.json`)

Join: namespace `TauCeti.EllipticRegulator.ER8` (unchanged). Tau Ceti: the part imported
`TauCeti.AlgebraicGeometry.EllipticCurve.Affine.FunctionField.GenericPoint` and
`...FunctionField.TorsionDivisor`; here `genericX`/`genericY` are Mathlib stand-ins in `ER8`
(section `GenericPoint`), so `(curve36 K).toAffine.genericX` is written
`genericX (curve36 K).toAffine` (same for `genericY`), and `quadraticFunctionT_principal` with the
test `quadratic_function_divisor` are a comment block giving their signatures verbatim.

Scope: EllipticRegulators ER.8, continuing the accepted parent packet. General K-theory,
Coleman integration, syntomic/étale regulators, CM uniformisation and refined p-adic
distributions are imported from their owners. They are not defined here.

The scalar and rational-scalar predicate below are algebraic coordinate calculations.
The quadratic symbol below really uses the existing elliptic function field and the free
abelian group before the imported symbol quotient. Finite residue-table tests evaluate
that raw representative; they do not postulate a tame map on all K₂. The geometric
comparison and certificate signatures that cannot yet be stated are identified at the end.
-/

namespace ER8

section Scalar

variable {K H : Type*} [Field K] [AddCommGroup H] [Module K H]

/-- ER.8/frobenius-regulator-scalar: geometric use requires a nonzero cup denominator. -/
def frobeniusRegulatorScalar (p gamma : K) (B : LinearMap.BilinForm K H)
    (omega v r : H) : K := by sorry

theorem frobeniusRegulatorScalar_eq (p gamma : K) (B : LinearMap.BilinForm K H)
    (omega v r : H) :
    frobeniusRegulatorScalar p gamma B omega v r =
      (1 - p / gamma) * B r v / B omega v := by sorry

theorem frobeniusRegulatorScalar_zero (p gamma : K) (B : LinearMap.BilinForm K H)
    (omega v : H) : frobeniusRegulatorScalar p gamma B omega v 0 = 0 := by sorry

theorem frobeniusRegulatorScalar_add (p gamma : K) (B : LinearMap.BilinForm K H)
    (omega v r s : H) :
    frobeniusRegulatorScalar p gamma B omega v (r + s) =
      frobeniusRegulatorScalar p gamma B omega v r +
        frobeniusRegulatorScalar p gamma B omega v s := by sorry

theorem frobeniusRegulatorScalar_smul (p gamma c : K)
    (B : LinearMap.BilinForm K H) (omega v r : H) :
    frobeniusRegulatorScalar p gamma B omega v (c • r) =
      c * frobeniusRegulatorScalar p gamma B omega v r := by sorry

theorem frobeniusRegulatorScalar_scale_eigenvector (p gamma c : K)
    (B : LinearMap.BilinForm K H) (omega v r : H)
    (_hc : c ≠ 0) (_hgamma : gamma ≠ 0) (_hden : B omega v ≠ 0) :
    frobeniusRegulatorScalar p gamma B omega (c • v) r =
      frobeniusRegulatorScalar p gamma B omega v r := by sorry

theorem frobeniusRegulatorScalar_scale_differential (p gamma c : K)
    (B : LinearMap.BilinForm K H) (omega v r : H) (_hc : c ≠ 0) :
    frobeniusRegulatorScalar p gamma B (c • omega) v r =
      c⁻¹ * frobeniusRegulatorScalar p gamma B omega v r := by sorry

/-- The linear-algebra part of ER.8/elliptic-syntomic-etale-factor. Its assumptions are
Frobenius similitude and an eigenvector equation, not the desired regulator equality. -/
theorem elliptic_syntomic_etale_pairing (p gamma : K)
    (B : LinearMap.BilinForm K H) (Phi : H →ₗ[K] H) (z v : H)
    (_hp : p ≠ 0) (_hgamma : gamma ≠ 0)
    (_hPhi : ∀ a b, B (Phi a) (Phi b) = p * B a b)
    (_hv : Phi v = gamma • v) :
    B (z - (p ^ 2)⁻¹ • Phi z) v = (1 - (p * gamma)⁻¹) * B z v := by sorry

/-- The determinant pairing used only for small coordinate tests. -/
def detPairing : LinearMap.BilinForm ℚ (ℚ × ℚ) := by sorry

theorem detPairing_eq (a b c d : ℚ) : detPairing (a,b) (c,d) = a*d-b*c := by sorry

-- Test frobenius_scalar_small
example : frobeniusRegulatorScalar 5 2 detPairing (1,0) (0,1) (3,0) = -9/2 := by sorry

-- Test frobenius_scalar_zero
example : frobeniusRegulatorScalar 5 2 detPairing (1,0) (0,1) 0 = 0 := by sorry

-- Test frobenius_scalar_eigenvector
example : frobeniusRegulatorScalar 5 2 detPairing (1,0) (0,7) (3,0) = -9/2 := by sorry

-- Test frobenius_scalar_bad_denominator
example : detPairing (1,0) (1,0) = 0 ∧
    frobeniusRegulatorScalar 5 2 detPairing (1,0) (1,0) (3,0) = 0 := by sorry

end Scalar

section Relation

variable {M K : Type*} [AddCommGroup M] [Module ℚ M] [Field K] [CharZero K]

/-- ER.8/weight-two-beilinson-relation. The predicate has its actual existential body.
In geometric use M is the imported arithmetic-integral motivic group. -/
def WeightTwoBeilinsonRelation (rInf : M →ₗ[ℚ] ℝ) (rP : M →ₗ[ℚ] K)
    (A : ℝ) (B : K) : Prop :=
  ∃ xi : M, ∃ q : ℚ, ∃ epsilon : ℤ,
    xi ≠ 0 ∧ q ≠ 0 ∧ (epsilon = 1 ∨ epsilon = -1) ∧
    rInf xi ≠ 0 ∧ rP xi ≠ 0 ∧
    A = (q : ℝ) * rInf xi ∧ B = (epsilon : K) * (q : K) * rP xi

theorem weightTwoBeilinsonRelation_iff (rInf : M →ₗ[ℚ] ℝ) (rP : M →ₗ[ℚ] K)
    (A : ℝ) (B : K) :
    WeightTwoBeilinsonRelation rInf rP A B ↔
      ∃ xi : M, ∃ q : ℚ, ∃ epsilon : ℤ,
        xi ≠ 0 ∧ q ≠ 0 ∧ (epsilon = 1 ∨ epsilon = -1) ∧
        rInf xi ≠ 0 ∧ rP xi ≠ 0 ∧
        A = (q : ℝ) * rInf xi ∧ B = (epsilon : K) * (q : K) * rP xi := by sorry

theorem weightTwoBeilinsonRelation_ratios
    (rInf : M →ₗ[ℚ] ℝ) (rP : M →ₗ[ℚ] K) (A : ℝ) (B : K)
    (xi : M) (q : ℚ) (epsilon : ℤ) (_hi : rInf xi ≠ 0) (_hp : rP xi ≠ 0)
    (_hA : A = (q : ℝ) * rInf xi)
    (_hB : B = (epsilon : K) * (q : K) * rP xi) :
    A / rInf xi = (q : ℝ) ∧ B / rP xi = (epsilon : K) * (q : K) := by sorry

theorem weightTwoBeilinsonRelation_rescale_witness
    (rInf : M →ₗ[ℚ] ℝ) (rP : M →ₗ[ℚ] K) (A : ℝ) (B : K)
    (xi : M) (q c : ℚ) (epsilon : ℤ) (_hc : c ≠ 0)
    (_hxi : xi ≠ 0) (_hq : q ≠ 0) (_hepsilon : epsilon = 1 ∨ epsilon = -1)
    (_hi : rInf xi ≠ 0) (_hp : rP xi ≠ 0)
    (_hA : A = (q : ℝ) * rInf xi)
    (_hB : B = (epsilon : K) * (q : K) * rP xi) :
    c • xi ≠ 0 ∧ q/c ≠ 0 ∧ (epsilon = 1 ∨ epsilon = -1) ∧
    rInf (c • xi) ≠ 0 ∧ rP (c • xi) ≠ 0 ∧
    A = ((q / c : ℚ) : ℝ) * rInf (c • xi) ∧
    B = (epsilon : K) * ((q / c : ℚ) : K) * rP (c • xi) := by sorry

theorem weightTwoBeilinsonRelation_change_sign
    (rInf : M →ₗ[ℚ] ℝ) (rP : M →ₗ[ℚ] K) (A : ℝ) (B : K) :
    WeightTwoBeilinsonRelation (-rInf) rP A B ↔
      WeightTwoBeilinsonRelation rInf rP A B := by sorry

/-- Test coordinate map, not a substitute for the Deligne regulator. -/
def rationalRealCoordinate : ℚ →ₗ[ℚ] ℝ := by sorry

theorem rationalRealCoordinate_eq (x : ℚ) : rationalRealCoordinate x = (x : ℝ) := by sorry

-- Test beilinson_relation_small
example : WeightTwoBeilinsonRelation rationalRealCoordinate
    (2 • LinearMap.id : ℚ →ₗ[ℚ] ℚ) 3 6 := by sorry

-- Test beilinson_relation_zero
example (rInf : M →ₗ[ℚ] ℝ) (A : ℝ) (B : K) :
    ¬ WeightTwoBeilinsonRelation rInf (0 : M →ₗ[ℚ] K) A B := by sorry

-- Test beilinson_relation_wrong_ratio
example : ¬ WeightTwoBeilinsonRelation rationalRealCoordinate
    (2 • LinearMap.id : ℚ →ₗ[ℚ] ℚ) 3 5 := by sorry

-- Test beilinson_relation_negative_sign
example : WeightTwoBeilinsonRelation rationalRealCoordinate
    (2 • LinearMap.id : ℚ →ₗ[ℚ] ℚ) 3 (-6) := by sorry

end Relation

section GenericPoint

open Polynomial

/-- Prototyping stand-in, restated over Mathlib: the generic `x`-coordinate, the class of `X` in
the function field `W.FunctionField = FractionRing W.CoordinateRing`. An implementation uses the
pinned Tau Ceti declaration `WeierstrassCurve.Affine.genericX` (module
`TauCeti.AlgebraicGeometry.EllipticCurve.Affine.FunctionField.GenericPoint`), which has this
definition; it is not imported because the shared build has no Tau Ceti object files. -/
noncomputable def genericX {R : Type*} [CommRing R] (W : WeierstrassCurve.Affine R) :
    W.FunctionField :=
  algebraMap W.CoordinateRing W.FunctionField (WeierstrassCurve.Affine.CoordinateRing.mk W (C X))

/-- Prototyping stand-in, restated over Mathlib: the generic `y`-coordinate, the class of `Y` in
the function field. An implementation uses the pinned Tau Ceti declaration
`WeierstrassCurve.Affine.genericY` (same module as `genericX`), which has this definition. -/
noncomputable def genericY {R : Type*} [CommRing R] (W : WeierstrassCurve.Affine R) :
    W.FunctionField :=
  algebraMap W.CoordinateRing W.FunctionField (WeierstrassCurve.Affine.CoordinateRing.mk W X)

end GenericPoint

section Quadratic

open WeierstrassCurve WeierstrassCurve.Affine
-- `open TauCeti.AlgebraicGeometry` (part file) dropped: a Tau Ceti namespace, not available here.

variable (K : Type*) [Field K] [CharZero K]

/-- The explicit curve data of ER.8/quadratic-corrected-symbol. -/
def curve36 : WeierstrassCurve K := ⟨0,0,0,0,1⟩

instance curve36_isElliptic : (curve36 K).IsElliptic := by sorry

abbrev FF36 := (curve36 K).toAffine.FunctionField

variable {K}

def quadraticEll (zeta : K) : FF36 K :=
  genericY (curve36 K).toAffine -
    2 * algebraMap K (FF36 K) (zeta ^ 2) * genericX (curve36 K).toAffine + 1

def quadraticSecant (zeta : K) : FF36 K :=
  genericY (curve36 K).toAffine -
    algebraMap K (FF36 K) (zeta ^ 2) * genericX (curve36 K).toAffine - 1

def quadraticEllUnit (zeta : K) (_hzeta : zeta ^ 2 + zeta + 1 = 0) : (FF36 K)ˣ := by sorry

theorem quadraticEllUnit_val (zeta : K) (hzeta : zeta ^ 2 + zeta + 1 = 0) :
    (quadraticEllUnit zeta hzeta).val = quadraticEll zeta := by sorry

def quadraticXUnit : (FF36 K)ˣ := by sorry

theorem quadraticXUnit_val : (quadraticXUnit (K := K)).val =
    genericX (curve36 K).toAffine := by sorry

def quadraticFunctionT (zeta : K) (_hzeta : zeta ^ 2 + zeta + 1 = 0) : (FF36 K)ˣ := by sorry

def quadraticFunctionA : (FF36 K)ˣ := by sorry

def quadraticFunctionB : (FF36 K)ˣ := by sorry

theorem quadraticFunctionT_val (zeta : K) (hzeta : zeta ^ 2 + zeta + 1 = 0) :
    (quadraticFunctionT zeta hzeta).val =
      (quadraticEll zeta)^2 * (quadraticSecant zeta)^2 /
        ((algebraMap K (FF36 K) (zeta^2) * genericX (curve36 K).toAffine)^2 *
          (algebraMap K (FF36 K) (zeta^2) * genericX (curve36 K).toAffine + 1)) := by sorry

theorem quadraticFunctionA_val : (quadraticFunctionA (K := K)).val =
    (genericY (curve36 K).toAffine - 1)^2 := by sorry

theorem quadraticFunctionB_val : (quadraticFunctionB (K := K)).val =
    (genericY (curve36 K).toAffine + 1)^2 := by sorry

def quadraticConstUnit (a : K) (_ha : a ≠ 0) : (FF36 K)ˣ := by sorry

theorem quadraticConstUnit_val (a : K) (ha : a ≠ 0) :
    (quadraticConstUnit a ha).val = algebraMap K (FF36 K) a := by sorry

theorem zeta_ne_zero (zeta : K) (_hzeta : zeta^2+zeta+1=0) : zeta ≠ 0 := by sorry

theorem cT_ne_zero (zeta : K) (_hzeta : zeta^2+zeta+1=0) : 1/(4*zeta^2) ≠ 0 := by sorry

theorem cB_ne_zero (zeta : K) (_hzeta : zeta^2+zeta+1=0) : 2*zeta^2 ≠ 0 := by sorry

def symbolPair0 (zeta : K) (hzeta : zeta^2+zeta+1=0) : (FF36 K)ˣ × (FF36 K)ˣ :=
  (quadraticEllUnit zeta hzeta, quadraticXUnit)

def symbolPairT (zeta : K) (hzeta : zeta^2+zeta+1=0) : (FF36 K)ˣ × (FF36 K)ˣ :=
  (quadraticFunctionT zeta hzeta, quadraticConstUnit (1/(4*zeta^2)) (cT_ne_zero zeta hzeta))

def symbolPairA : (FF36 K)ˣ × (FF36 K)ˣ :=
  (quadraticFunctionA, quadraticConstUnit 2 (by sorry))

def symbolPairB (zeta : K) (hzeta : zeta^2+zeta+1=0) : (FF36 K)ˣ × (FF36 K)ˣ :=
  (quadraticFunctionB, quadraticConstUnit (2*zeta^2) (cB_ne_zero zeta hzeta))

/-- This is the raw representative, not a new definition of Milnor or Quillen K₂. -/
def quadraticSymbol (zeta : K) (_hzeta : zeta^2+zeta+1=0) :
    FreeAbelianGroup ((FF36 K)ˣ × (FF36 K)ˣ) := by sorry

theorem quadraticSymbol_expand (zeta : K) (hzeta : zeta^2+zeta+1=0) :
    quadraticSymbol zeta hzeta =
      6 • FreeAbelianGroup.of (symbolPair0 zeta hzeta) +
        FreeAbelianGroup.of (symbolPairT zeta hzeta) +
        FreeAbelianGroup.of (symbolPairA (K := K)) +
        FreeAbelianGroup.of (symbolPairB zeta hzeta) := by sorry

theorem quadraticSymbol_map {G : Type*} [AddCommGroup G]
    (phi : FreeAbelianGroup ((FF36 K)ˣ × (FF36 K)ˣ) →+ G)
    (zeta : K) (hzeta : zeta^2+zeta+1=0) :
    phi (quadraticSymbol zeta hzeta) =
      6 • phi (FreeAbelianGroup.of (symbolPair0 zeta hzeta)) +
        phi (FreeAbelianGroup.of (symbolPairT zeta hzeta)) +
        phi (FreeAbelianGroup.of (symbolPairA (K := K))) +
        phi (FreeAbelianGroup.of (symbolPairB zeta hzeta)) := by sorry

theorem pointT_nonsingular (zeta : K) (_hzeta : zeta^2+zeta+1=0) :
    (curve36 K).toAffine.Nonsingular (2*zeta) 3 := by sorry

/- `quadraticFunctionT_principal` (API) and Test `quadratic_function_divisor`: not stated in this
Mathlib-only file. They need Tau Ceti's places and divisors of a function field, which Mathlib does
not have: `WeierstrassCurve.Affine.isFunctionField`, `TauCeti.Divisor.principal`,
`TauCeti.Place.ofPrime`, `TauCeti.AlgebraicGeometry.WeilDivisor.ofPoint`, `TauCeti.Place.infinity`
and `WeierstrassCurve.Affine.CoordinateRing.pointPlace`, all available through the pinned module
`TauCeti.AlgebraicGeometry.EllipticCurve.Affine.FunctionField.TorsionDivisor` (whose
`WeierstrassCurve.Affine.exists_principal_zsmul_pointPlace_sub_infinity` is the general form).
Signatures verbatim from the part file, which has `open TauCeti.AlgebraicGeometry` in this section:

variable [DecidableEq K] [IsDedekindDomain (curve36 K).toAffine.CoordinateRing]

theorem quadraticFunctionT_principal (zeta : K) (hzeta : zeta^2+zeta+1=0) :
    TauCeti.Divisor.principal (curve36 K).toAffine.isFunctionField
        (quadraticFunctionT zeta hzeta) =
      (6 : ℤ) • (WeilDivisor.ofPoint
        (TauCeti.Place.ofPrime K (FF36 K)
          (CoordinateRing.pointPlace (pointT_nonsingular zeta hzeta).left)) -
        WeilDivisor.ofPoint (TauCeti.Place.infinity (curve36 K).toAffine)) := by sorry

-- Test quadratic_function_divisor
example (zeta : K) (hzeta : zeta^2+zeta+1=0) :
    TauCeti.Divisor.principal (curve36 K).toAffine.isFunctionField
        (quadraticFunctionT zeta hzeta) =
      (6 : ℤ) • (WeilDivisor.ofPoint
        (TauCeti.Place.ofPrime K (FF36 K)
          (CoordinateRing.pointPlace (pointT_nonsingular zeta hzeta).left)) -
        WeilDivisor.ofPoint (TauCeti.Place.infinity (curve36 K).toAffine)) := by sorry
-/

end Quadratic

section ResidueTables

variable {K : Type*} [Field K] [CharZero K]

/-- Finite table on the four displayed generators; it is not the geometric tame map.
The geometric agreement of these tables is proved in the packet's local calculation. -/
def residueTable (zeta : K) (hzeta : zeta^2+zeta+1=0) (u v w : Kˣ) :
    ((FF36 K)ˣ × (FF36 K)ˣ) → Additive Kˣ := by
  classical
  exact fun a => Additive.ofMul
    (if a = symbolPair0 zeta hzeta then u else
      if a = symbolPairT zeta hzeta then v else
        if a = symbolPairB zeta hzeta then w else 1)

def fieldUnit (a : K) (_ha : a ≠ 0) : Kˣ := by sorry

theorem fieldUnit_val (a : K) (ha : a ≠ 0) : (fieldUnit a ha).val = a := by sorry

-- Test quadratic_symbol_tameT_table
example (zeta : K) (hzeta : zeta^2+zeta+1=0) :
    let c := fieldUnit (1/(4*zeta^2)) (cT_ne_zero zeta hzeta)
    Additive.toMul ((FreeAbelianGroup.lift
      (residueTable zeta hzeta c (c^(-6 : ℤ)) 1))
        (quadraticSymbol zeta hzeta)) = 1 := by sorry

-- Test quadratic_symbol_tameB_table
example (zeta : K) (hzeta : zeta^2+zeta+1=0) :
    let c := fieldUnit (2*zeta^2) (cB_ne_zero zeta hzeta)
    Additive.toMul ((FreeAbelianGroup.lift
      (residueTable zeta hzeta c 1 (c^(-6 : ℤ))))
        (quadraticSymbol zeta hzeta)) = 1 ∧
    (c : K) = 2*zeta^2 := by sorry

-- Test quadratic_symbol_infinity_table
example (zeta : K) (hzeta : zeta^2+zeta+1=0) :
    let cT := fieldUnit (1/(4*zeta^2)) (cT_ne_zero zeta hzeta)
    let cA := fieldUnit (2 : K) (by sorry)
    let cB := fieldUnit (2*zeta^2) (cB_ne_zero zeta hzeta)
    let values : ((FF36 K)ˣ × (FF36 K)ˣ) → Additive Kˣ := by
      classical
      exact fun a => Additive.ofMul
        (if a = symbolPairT zeta hzeta then cT^6 else
          if a = symbolPairA (K := K) then cA^6 else
            if a = symbolPairB zeta hzeta then cB^6 else 1)
    Additive.toMul ((FreeAbelianGroup.lift values) (quadraticSymbol zeta hzeta)) = 1 := by sorry

-- Test quadratic_uncorrected_nonexample
example (zeta : K) (hzeta : zeta^2+zeta+1=0) :
    let c := fieldUnit (1/(4*zeta^2)) (cT_ne_zero zeta hzeta)
    Additive.toMul ((FreeAbelianGroup.lift
      (residueTable zeta hzeta c (c^(-6 : ℤ)) 1))
        (FreeAbelianGroup.of (symbolPair0 zeta hzeta))) = c ∧ c ≠ 1 := by sorry

end ResidueTables

section PolynomialChecks

variable {K : Type*} [Field K] [CharZero K]
open Polynomial
open scoped Polynomial.Bivariate

/-- The statable division-polynomial computation in ER.8/cm36-full-torsion-certificate. -/
-- The packet uses the existing `Affine.CoordinateRing.mk_ψ` to transport this Ψ
-- computation to ψ, and Tau Ceti's `zsmul_fromAffine_eq_zero_iff` to transport
-- Jacobian annihilation to the affine torsion input of the principal-divisor theorem.
theorem cm36_division_polynomial (x y : K) (_hE : y^2=x^3+1) :
    ((curve36 K).Ψ 6).evalEval x y =
      6*x*y*(x^3+4)*(x^3-8)*(x^9+228*x^6+48*x^3+64) := by sorry

theorem quadratic_tangent_factorisation (zeta x : K) (_hzeta : zeta^2+zeta+1=0) :
    (2*zeta^2*x-1)^2-x^3-1 = -x*(x-2*zeta)^2 := by sorry

theorem quadratic_secant_factorisation (zeta x : K) (_hzeta : zeta^2+zeta+1=0) :
    (zeta^2*x+1)^2-x^3-1 = -x*(x-2*zeta)*(x+zeta) := by sorry

theorem quadratic_norm_functions (zeta x y : K) (_hzeta : zeta^2+zeta+1=0) :
    (y-2*zeta^2*x+1)*(y-2*zeta*x+1) = (y+1)^2+2*x*(y+1)+4*x^2 ∧
    (y-zeta^2*x-1)*(y-zeta*x-1) = (y-1)^2+x*(y-1)+x^2 := by sorry

theorem quadratic_degree_two_residue (zeta : K) (_hzeta : zeta^2+zeta+1=0) :
    (1/(4*zeta^2))^6*(1/4 : K)^(-6 : ℤ) = 1 := by sorry

/-- Odd quadratic Gauss-sum test for the accepted-manuscript source issue E29. -/
theorem odd_quadratic_gauss_test (zeta : K) (_hzeta : zeta^2+zeta+1=0) :
    (zeta-zeta^2)^2 = -3 ∧ 3/(zeta-zeta^2) = -(zeta-zeta^2) := by sorry

end PolynomialChecks

/-!
The following geometric declarations are not stated with substitute types or arbitrary
Prop fields. The packet's third gap records this prototype limitation.

* `elliptic_syntomic_pairing` (ER.8/good-reduction-elliptic-pairing) requires the actual
  D.5 weight-two regulator, smooth proper O_K model, H_syn²/H_dR¹ identification and
  cup/trace, plus Coleman L1's elliptic constant-term/finite-extension interface. Its
  equality is Tr(reg_syn(u) cup eta)=sum n_i int_(div f_i)log(g_i)eta. Holomorphic
  evaluation alone must not be represented as the whole H_dR¹ vector.
* `elliptic_syntomic_etale_factor` requires D.2/D.5's actual étale regulator and
  Bloch–Kato logarithm. The linear-algebra component is stated above, but the
  cohomological identity reg_syn=(1-p^(-2)Phi)log_BK reg_et is not postulated.
* `neron_refinement_period_dictionary` requires the actual L1 period lines, L2 refined
  distribution and L3 non-theta-critical eigenlift, and the geometric primitive cycles
  of ER.1. The owner convention has gamma^(-nu)tau(chi)L(E,chi^-1,1)/Omega^sign.
* `weight_two_padic_beilinson_conjecture` is a conjectural assertion on the actual
  E.6 arithmetic-integral group, ER.2 Deligne coordinate and D.5 regulator, with good
  reduction, selected slope and Phi(omega)≠gamma omega. The predicate above has an
  actual body; this conjecture is not asserted for arbitrary linear maps.
* `cm36_full_torsion_certificate` and `cm36_corrected_l_value` require E.7's actual
  certificate/S_a quotient, CM.1/CM.2's fixed torsion-coordinate/Galois dictionary
  and ER.5 U. The statable division-polynomial computation appears above. The exact
  scalar is pi/(324i), not the printed extra factor six.
* API `quadraticSymbol_certified` needs E.7's actual certificate map and E.3's
  rational lift from the raw representative. The principal-divisor compatibility
  and all five raw-representative unit tests have signatures above.
* `quadratic_transfer_certificate` needs the actual E.7 transfer. Its rational
  representative is 6{H,x}+{F,1/4}+{fA,4}+{fB,4}; 3-torsion was discarded, so
  the integral norm is not assigned this representative by definition.
* `quadratic_regulator_trace` needs ER.3/ER.4's actual R_q and symbol regulator.
  The full result is 18 conjugate(R_q(T)+R_q(Tbar)-R_q(A)); only after the real
  rational-class comparison is it -18i(D(T)+D(Tbar)-D(A)).
* `integral_example_padic_eligibility` needs the actual E.6 model, integral part,
  vertical residues and E.8 integral certificate of the parent 11a3 class. It
  cannot be stated merely by assuming a field called “integral”. Its complex
  scalar is evaluated on the period-one differential (dx/(2y+1))/Omega_plus;
  evaluation on the Néron differential itself multiplies it by Omega_plus.
-/

-- Packet nodes of the omitted declarations listed above (markers added in the join):
-- ER.8/good-reduction-elliptic-pairing (`elliptic_syntomic_pairing`), ER.8/elliptic-syntomic-etale-factor,
-- ER.8/neron-refinement-period-dictionary, ER.8/weight-two-padic-beilinson-conjecture,
-- ER.8/cm36-full-torsion-certificate, ER.8/cm36-corrected-l-value, ER.8/quadratic-corrected-symbol
-- (`quadraticSymbol_certified`), ER.8/quadratic-transfer-certificate,
-- ER.8/quadratic-regulator-trace, ER.8/integral-example-padic-eligibility.

end ER8

end ER8Part

end TauCeti.EllipticRegulator
