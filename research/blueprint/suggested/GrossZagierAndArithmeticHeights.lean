/-
Copyright (c) 2026 Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Algebra.Colimit.Module
import Mathlib.LinearAlgebra.QuadraticForm.Basic
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.RingTheory.Trace.Basic
import Mathlib.RingTheory.LaurentSeries
import Mathlib.RingTheory.Length
import Mathlib.Analysis.SpecialFunctions.Gamma.Deligne
import Mathlib.Analysis.SpecialFunctions.Pow.Complex
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.Calculus.Deriv.Mul
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.NumberTheory.NumberField.Units.Basic
import Mathlib.NumberTheory.NumberField.Cyclotomic.Basic
import Mathlib.NumberTheory.Height.NumberField
import Mathlib.Data.Nat.Factorization.Defs
import Mathlib.Algebra.Module.TransferInstance
import Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass
import TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.Regulator
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.Module.Submodule.Lattice
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.FiniteDimensional.Basic
import Mathlib.RingTheory.Trace.Defs
import Mathlib.RingTheory.TensorProduct.Maps
import Mathlib.RingTheory.PowerSeries.Evaluation
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.NumberTheory.ModularForms.Basic
import Mathlib.NumberTheory.ModularForms.Petersson
import Mathlib.Analysis.Complex.UpperHalfPlane.Measure
import Mathlib.MeasureTheory.Integral.Bochner.Set
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.LinearAlgebra.Matrix.Notation

/-!
# Gross–Zagier formulas and arithmetic heights — suggested declarations

This file is not the roadmap and is not exhaustive. The roadmap document is
definitive: `research/blueprint/readmes/GrossZagierAndArithmeticHeights.md`.
The statements suggest Lean forms so contributors and reviewers can converge
on names and signatures. Proposed proofs are admitted; implementation statuses
remain unchecked.

Mathlib pin: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti pin: f790474821cf4256814db967cb154e7af3d0c369.

The retained GZ.0–GZ.7 and GZ.8–GZ.9 signatures are partial algebraic
prototypes. Their geometric and analytic inputs still require the packet's
supplier contracts. Unsafe signatures omitted by the independent part reviews
remain named in comments. Elaborating these prototypes does not establish the
Gross–Zagier formulas or instantiate their missing arithmetic data.

GZ.1's character convention is V_chi (eigenvalue chi), whereas GZ.8's
chiIsotypic chi uses eigenvalue chi inverse. Thus A(chi) = V_(chi inverse).
The GZ.8 coeffPairing prototype models the M-valued input owned by GZ.1;
the actual L-base-change constructor and geometric compatibility are pending.
There is no second planned owner for coefficient heights.

See the assembly handoff for the exact elaboration results and the distinction
between a full pinned check and a Mathlib-only diagnostic. No missing carrier
is represented by a dummy proposition.
-/

noncomputable section NormalizationsAndKernels

open scoped BigOperators ENNReal NNReal
open Filter Topology Height Matrix MeasureTheory TensorProduct
local instance {α : Sort*} (p : α → Prop) : DecidablePred p := Classical.decPred p

/-!
Pinned Tau Ceti height section: nodes and declaration names.
GrossZagierAndArithmeticHeights:GZ.0/x-height-canonical-height — WeierstrassCurve.Affine.Point.xCanonicalHeight
GrossZagierAndArithmeticHeights:GZ.0/bsd-height-pairing — WeierstrassCurve.Affine.bsdHeightPairing
GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator — WeierstrassCurve.Affine.bsdRegulator
GrossZagierAndArithmeticHeights:GZ.0/height-convention-dictionary — TauCeti.GrossZagier.heightConventions
GrossZagierAndArithmeticHeights:GZ.0/canonical-height-rational — WeierstrassCurve.Affine.canonicalHeightRat
GrossZagierAndArithmeticHeights:GZ.0/trace-versus-average — WeierstrassCurve.Affine.canonicalHeightRat_average
GrossZagierAndArithmeticHeights:GZ.0/unitary-and-motivic-centres — TauCeti.GrossZagier.deriv_completed_at_one_of_eq_zero
GrossZagierAndArithmeticHeights:GZ.0/heegner-unit-index — TauCeti.GrossZagier.unitIndex
GrossZagierAndArithmeticHeights:GZ.0/artin-map-convention — TauCeti.GrossZagier.artinConvention
GrossZagierAndArithmeticHeights:GZ.0/real-period-components — TauCeti.GrossZagier.realPeriod_eq_card_components_mul
-/
namespace WeierstrassCurve.Affine

open TensorProduct
/-- The existing additive tensor symmetry transfers the rational scalar action.
This supplies the right-hand rationalization without redefining the tensor. -/
local instance tensorRatModule (A : Type*) [AddCommGroup A] : Module ℚ (A ⊗[ℤ] ℚ) :=
  (TensorProduct.comm ℤ A ℚ).toAddEquiv.module ℚ

variable {F : Type*} [Field F] {W : Affine F} [AdmissibleAbsValues F] [DecidableEq F]

/-! ## The x-height and the BSD pairing -/

/-- GZ.0/x-height-canonical-height: `ĥ_x = lim h(x(2ⁿP))/4ⁿ = 2 · canonicalHeight`. -/
def Point.xCanonicalHeight (P : W.Point) : ℝ := 2 * P.canonicalHeight

theorem Point.xCanonicalHeight_eq_two_mul (P : W.Point) :
    P.xCanonicalHeight = 2 * P.canonicalHeight := by sorry

theorem Point.tendsto_naiveHeight_div_four_pow [W.toAffine.IsElliptic] (P : W.Point) :
    Tendsto (fun n : ℕ ↦ ((2 ^ n) • P).naiveHeight / 4 ^ n) atTop (𝓝 P.xCanonicalHeight) := by
  sorry

@[simp] theorem Point.xCanonicalHeight_nsmul [W.toAffine.IsElliptic] (n : ℕ) (P : W.Point) :
    (n • P).xCanonicalHeight = n ^ 2 * P.xCanonicalHeight := by sorry

theorem Point.xCanonicalHeight_eq_zero_iff [W.toAffine.IsElliptic]
    [Northcott (fun P : W.Point ↦ P.canonicalHeight)] (P : W.Point) :
    P.xCanonicalHeight = 0 ↔ IsOfFinAddOrder P := by sorry

-- Test: WeierstrassCurve.Affine.Point.xCanonicalHeight_zero
example : (0 : W.Point).xCanonicalHeight = 0 := by sorry

-- Test: WeierstrassCurve.Affine.Point.xCanonicalHeight_ne_canonicalHeight
example [W.toAffine.IsElliptic] (P : W.Point)
    (hP : P.canonicalHeight ≠ 0) : P.xCanonicalHeight ≠ P.canonicalHeight := by sorry

-- Test: WeierstrassCurve.Affine.Point.xCanonicalHeight_two_nsmul
example [W.toAffine.IsElliptic] (P : W.Point) :
    ((2 : ℕ) • P).xCanonicalHeight = 4 * P.xCanonicalHeight := by sorry

-- Test: WeierstrassCurve.Affine.Point.xCanonicalHeight_eq_neronTatePairing
example [W.toAffine.IsElliptic] (P : W.Point) :
    P.xCanonicalHeight = 2 * neronTatePairing W P P := by sorry

variable (W) in
/-- GZ.0/bsd-height-pairing: the polar form of `canonicalHeight`, `2 •` Tau Ceti's pairing. -/
def bsdHeightPairing [W.toAffine.IsElliptic] : LinearMap.BilinMap ℤ W.Point ℝ :=
  QuadraticMap.polarBilin (canonicalHeightQuadratic W)

theorem bsdHeightPairing_apply [W.toAffine.IsElliptic] (P Q : W.Point) :
    bsdHeightPairing W P Q = (P + Q).canonicalHeight - P.canonicalHeight - Q.canonicalHeight := by
  sorry

theorem bsdHeightPairing_eq_two_smul [W.toAffine.IsElliptic] :
    bsdHeightPairing W = 2 • neronTatePairing W := by sorry

@[simp] theorem bsdHeightPairing_self [W.toAffine.IsElliptic] (P : W.Point) :
    bsdHeightPairing W P P = P.xCanonicalHeight := by sorry

theorem bsdHeightPairing_comm [W.toAffine.IsElliptic] (P Q : W.Point) :
    bsdHeightPairing W P Q = bsdHeightPairing W Q P := by sorry

theorem bsdHeightPairing_eq_zero_of_isOfFinAddOrder_left [W.toAffine.IsElliptic] {P : W.Point}
    (hP : IsOfFinAddOrder P) (Q : W.Point) : bsdHeightPairing W P Q = 0 := by sorry

-- Test: WeierstrassCurve.Affine.bsdHeightPairing_self_zero
example [W.toAffine.IsElliptic] : bsdHeightPairing W 0 0 = 0 := by
  sorry

-- Test: WeierstrassCurve.Affine.bsdHeightPairing_ne_neronTatePairing
example [W.toAffine.IsElliptic] (P : W.Point)
    (hP : P.canonicalHeight ≠ 0) : bsdHeightPairing W P P ≠ neronTatePairing W P P := by sorry

-- Test: WeierstrassCurve.Affine.bsdHeightPairing_two_nsmul
example [W.toAffine.IsElliptic] (P : W.Point) :
    bsdHeightPairing W ((2 : ℕ) • P) P = 2 * P.xCanonicalHeight := by sorry

-- Test: WeierstrassCurve.Affine.bsdHeightPairing_self_eq_two_mul
example [W.toAffine.IsElliptic] (P : W.Point) :
    bsdHeightPairing W P P = 2 * P.canonicalHeight := by sorry

/-! ## The BSD regulator -/

variable (W) in
/-- GZ.0/bsd-regulator: the Gram determinant of the BSD pairing on a basis of `E(K)/tors`. -/
def bsdRegulator [W.toAffine.IsElliptic] [Module.Finite ℤ (PointModTorsion W)] : ℝ :=
  |((2 : ℝ) • neronTateGramMatrix W (Module.finBasis ℤ (PointModTorsion W))).det|

theorem bsdRegulator_eq_two_pow_mul_regulator [W.toAffine.IsElliptic]
    [Module.Finite ℤ (PointModTorsion W)] :
    bsdRegulator W = 2 ^ Module.finrank ℤ (PointModTorsion W) * regulator W := by sorry

theorem bsdRegulator_eq_abs_det [W.toAffine.IsElliptic] [Module.Finite ℤ (PointModTorsion W)]
    {ι : Type*} [Fintype ι] [DecidableEq ι] (b : Module.Basis ι ℤ (PointModTorsion W)) :
    bsdRegulator W = |((2 : ℝ) • neronTateGramMatrix W b).det| := by sorry

@[simp] theorem bsdRegulator_of_finrank_eq_zero [W.toAffine.IsElliptic]
    [Module.Finite ℤ (PointModTorsion W)] (h : Module.finrank ℤ (PointModTorsion W) = 0) :
    bsdRegulator W = 1 := by sorry

theorem bsdRegulator_of_finrank_eq_one [W.toAffine.IsElliptic]
    [Module.Finite ℤ (PointModTorsion W)] (b : Module.Basis (Fin 1) ℤ (PointModTorsion W))
    (P : W.Point) (hP : (QuotientAddGroup.mk P : PointModTorsion W) = b 0) :
    bsdRegulator W = P.xCanonicalHeight := by sorry

-- Test: WeierstrassCurve.Affine.bsdRegulator_rank_zero
example [W.toAffine.IsElliptic] [Module.Finite ℤ (PointModTorsion W)]
    (h : Module.finrank ℤ (PointModTorsion W) = 0) : bsdRegulator W = 1 ∧ regulator W = 1 := by sorry

-- Test: WeierstrassCurve.Affine.bsdRegulator_rank_one
example [W.toAffine.IsElliptic] [Module.Finite ℤ (PointModTorsion W)]
    (h : Module.finrank ℤ (PointModTorsion W) = 1) : bsdRegulator W = 2 * regulator W := by sorry

-- Test: WeierstrassCurve.Affine.bsdRegulator_ne_regulator
example [W.toAffine.IsElliptic] [Module.Finite ℤ (PointModTorsion W)]
    (h : 0 < Module.finrank ℤ (PointModTorsion W)) (hreg : regulator W ≠ 0) :
    bsdRegulator W ≠ regulator W := by sorry

-- Test: WeierstrassCurve.Affine.bsdRegulator_eq_xCanonicalHeight
example [W.toAffine.IsElliptic]
    [Module.Finite ℤ (PointModTorsion W)] (h : Module.finrank ℤ (PointModTorsion W) = 1)
    (P : W.Point) (hP : ∀ Q : W.Point, ∃ n : ℤ, IsOfFinAddOrder (Q - n • P)) :
    bsdRegulator W = P.xCanonicalHeight := by sorry

/-! ## The canonical height on `E(K) ⊗ ℚ` -/

variable (W) in
/-- GZ.0/canonical-height-rational. -/
def canonicalHeightRat [W.toAffine.IsElliptic] : QuadraticMap ℚ (W.Point ⊗[ℤ] ℚ) ℝ := sorry

open TensorProduct

@[simp] theorem canonicalHeightRat_tmul [W.toAffine.IsElliptic] (P : W.Point) (q : ℚ) :
    canonicalHeightRat W (P ⊗ₜ q) = (q : ℝ) ^ 2 * P.canonicalHeight := by sorry

theorem canonicalHeightRat_unique [W.toAffine.IsElliptic]
    (Q : QuadraticMap ℚ (W.Point ⊗[ℤ] ℚ) ℝ) (hQ : ∀ P : W.Point, Q (P ⊗ₜ 1) = P.canonicalHeight) :
    Q = canonicalHeightRat W := by sorry

theorem canonicalHeightRat_nonneg [W.toAffine.IsElliptic] (x : W.Point ⊗[ℤ] ℚ) :
    0 ≤ canonicalHeightRat W x := by sorry

-- Test: WeierstrassCurve.Affine.canonicalHeightRat_inv_nat
example [W.toAffine.IsElliptic] (P : W.Point) (m : ℕ) :
    canonicalHeightRat W (P ⊗ₜ (1 / m : ℚ)) = P.canonicalHeight / m ^ 2 := by sorry

-- Test: WeierstrassCurve.Affine.canonicalHeightRat_torsion
example [W.toAffine.IsElliptic] {P : W.Point}
    (hP : IsOfFinAddOrder P) : canonicalHeightRat W (P ⊗ₜ 1) = 0 := by sorry

-- Test: WeierstrassCurve.Affine.canonicalHeightRat_one
example [W.toAffine.IsElliptic] (P : W.Point) :
    canonicalHeightRat W (P ⊗ₜ 1) = P.canonicalHeight := by sorry

-- Test: WeierstrassCurve.Affine.canonicalHeightRat_not_linear
example [W.toAffine.IsElliptic] (P : W.Point)
    (hP : P.canonicalHeight ≠ 0) : canonicalHeightRat W (P ⊗ₜ 2) ≠ 2 * P.canonicalHeight := by
  sorry

/-- GZ.0/trace-versus-average: the average of `h` points is their sum over `h`. -/
theorem canonicalHeightRat_average [W.toAffine.IsElliptic] {h : ℕ} (P : Fin h → W.Point) :
    canonicalHeightRat W ((∑ i, P i) ⊗ₜ (1 / h : ℚ)) = (∑ i, P i).canonicalHeight / h ^ 2 := by
  sorry

end WeierstrassCurve.Affine

/-! ## Centres, CM constants and conventions -/

namespace TauCeti.GrossZagier

open Complex

/-- GZ.0/unitary-and-motivic-centres: at a zero of `L`, `Λ′(1) = N^{1/2} Γ_ℂ(1) L′(1)`, and
`Γ_ℂ(1) = 1/π`. -/
theorem deriv_completed_at_one_of_eq_zero (L : ℂ → ℂ) (N : ℕ) (hL : DifferentiableAt ℂ L 1)
    (h0 : L 1 = 0) :
    deriv (fun s ↦ (N : ℂ) ^ (s / 2) * Gammaℂ s * L s) 1 = (N : ℂ) ^ (1 / 2 : ℂ) / π * deriv L 1 ∧
    deriv (fun s ↦ L (s + 1 / 2)) (1 / 2) = deriv L 1 := by sorry

/-- GZ.0/heegner-unit-index: `u(K) = #μ(K)/2`. -/
def unitIndex (K : Type*) [Field K] [NumberField K] : ℕ := NumberField.Units.torsionOrder K / 2

theorem two_mul_unitIndex (K : Type*) [Field K] [NumberField K]
    (hK : NumberField.InfinitePlace.nrRealPlaces K = 0) :
    2 * unitIndex K = NumberField.Units.torsionOrder K := by sorry

theorem unitIndex_eq_one_iff (K : Type*) [Field K] [NumberField K]
    (hK : Module.finrank ℚ K = 2) (hc : NumberField.InfinitePlace.nrRealPlaces K = 0) :
    unitIndex K = 1 ↔ NumberField.Units.torsionOrder K = 2 := by sorry

-- Test: TauCeti.GrossZagier.unitIndex_gaussian
example : unitIndex (CyclotomicField 4 ℚ) = 2 := by sorry

-- Test: TauCeti.GrossZagier.unitIndex_eisenstein
example : unitIndex (CyclotomicField 3 ℚ) = 3 := by sorry

-- Test: TauCeti.GrossZagier.unitIndex_sqrt_neg_seven
example (K : Type*) [Field K] [NumberField K]
    (hK : Module.finrank ℚ K = 2) (hc : NumberField.InfinitePlace.nrRealPlaces K = 0)
    (h : NumberField.discr K = -7) : unitIndex K = 1 := by sorry

-- Test: TauCeti.GrossZagier.unitIndex_ne_torsionOrder
example (K : Type*) [Field K] [NumberField K]
    (hc : NumberField.InfinitePlace.nrRealPlaces K = 0) :
    unitIndex K ≠ NumberField.Units.torsionOrder K := by sorry

/-- GZ.0/artin-map-convention: changing the reciprocity convention replaces a character by its
inverse. -/
theorem artinConvention {A G : Type*} [CommGroup A] [Group G] (art : A →* G) (χ : G →* ℂˣ)
    (a : A) : χ ((art a)⁻¹) = (χ (art a))⁻¹ := by sorry

/-! The real periods themselves belong to EllipticCurves Layer 7.
fullPeriod and identityPeriod are its actual integrals for the same differential.
Their supplier carrier and component comparison are omitted here. No period
placeholder is defined in this roadmap. -/
/- Omitted realPeriod_eq_card_components_mul: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-- GZ.0/height-convention-dictionary, collected. -/
theorem heightConventions {F : Type*} [Field F] {W : WeierstrassCurve.Affine F}
    [AdmissibleAbsValues F] [DecidableEq F] [W.toAffine.IsElliptic]
    [Module.Finite ℤ (WeierstrassCurve.Affine.PointModTorsion W)] :
    (∀ P : W.Point, P.xCanonicalHeight = 2 * P.canonicalHeight) ∧
    WeierstrassCurve.Affine.bsdHeightPairing W = 2 • WeierstrassCurve.Affine.neronTatePairing W ∧
    WeierstrassCurve.Affine.bsdRegulator W =
      2 ^ Module.finrank ℤ (WeierstrassCurve.Affine.PointModTorsion W) *
        WeierstrassCurve.Affine.regulator W := by sorry

end TauCeti.GrossZagier

namespace TauCeti.GrossZagier

/-! GrossZagierAndArithmeticHeights:GZ.1/neron-tate-height-and-the-poincare-pairing — Poincaré height pairing
P and Q denote the actual rational-point groups of A and A-dual. The RP.0/A2
canonical line-bundle-height construction is not yet available as a Lean term.
Its quadratic height is an explicit input here; the geometric hypotheses are
omitted from these algebraic signatures, and are mandatory in the packet.
-/
section Poincare
variable {P Q P' Q' : Type*} [AddCommGroup P] [AddCommGroup Q]
  [AddCommGroup P'] [AddCommGroup Q']
/-- Cross term of the canonical quadratic height of the rigidified biextension. -/
def poincareHeight (h : QuadraticMap ℤ (P × Q) ℝ) : P →ₗ[ℤ] Q →ₗ[ℤ] ℝ := by sorry
theorem poincareHeight_add_left (h : QuadraticMap ℤ (P × Q) ℝ) (x x' : P) (y : Q) :
  poincareHeight h (x+x') y = poincareHeight h x y + poincareHeight h x' y := by sorry
theorem poincareHeight_add_right (h : QuadraticMap ℤ (P × Q) ℝ) (x : P) (y y' : Q) :
  poincareHeight h x (y+y') = poincareHeight h x y + poincareHeight h x y' := by sorry
theorem poincareHeight_hom_adjoint (hA : QuadraticMap ℤ (P × Q) ℝ)
    (hB : QuadraticMap ℤ (P' × Q') ℝ) (u : P →+ P') (v : Q' →+ Q)
    (hcomp : ∀ x y, hB (u x,y)-hB (u x,0)-hB (0,y) =
      hA (x,v y)-hA (x,0)-hA (0,v y)) (x : P) (y : Q') :
  poincareHeight hB (u x) y = poincareHeight hA x (v y) := by sorry
theorem poincareHeight_polarization (q : QuadraticMap ℤ P ℝ)
    (h : QuadraticMap ℤ (P × P) ℝ)
    (hp : ∀ x y, h (x,y)-h (x,0)-h (0,y) = q (x+y)-q x-q y) (x y : P) :
  poincareHeight h x y = q (x+y)-q x-q y := by sorry
-- Test: poincareHeight_zero
example (h : QuadraticMap ℤ (P × Q) ℝ) (x : P) (y : Q) :
  poincareHeight h 0 y = 0 ∧ poincareHeight h x 0 = 0 := by sorry
-- Test: poincareHeight_elliptic_diagonal
example (q : QuadraticMap ℤ P ℝ) (h : QuadraticMap ℤ (P × P) ℝ)
    (hp : ∀ x y, h (x,y)-h (x,0)-h (0,y) = q (x+y)-q x-q y) (x : P) :
  poincareHeight h x x = 2 * q x := by sorry
-- Test: poincareHeight_integer_adjunction
example (h : QuadraticMap ℤ (P × Q) ℝ) (n : ℤ) (x : P) (y : Q) :
  poincareHeight h (n • x) y = poincareHeight h x (n • y) ∧
  poincareHeight h (n • x) y = n * poincareHeight h x y := by sorry
end Poincare

/-! GrossZagierAndArithmeticHeights:GZ.1/coefficient-valued-height — Endomorphism-field height pairing
M denotes the real scalar extension of the coefficient field, not a new
coefficient field. A field of degree greater than one generally gives a product
real algebra. Nondegeneracy of its trace pairing is a genuine displayed
hypothesis. The strict GL2, dual-action and scalar-extension identifications
are omitted until their owners supply the geometric carrier.
-/
section Coefficient
variable {M P Q : Type*} [CommRing M] [Algebra ℝ M] [Module.Finite ℝ M]
  [AddCommGroup P] [Module ℝ P] [Module M P] [IsScalarTower ℝ M P]
  [AddCommGroup Q] [Module ℝ Q] [Module M Q] [IsScalarTower ℝ M Q]
def coefficientHeight (b : P →ₗ[ℝ] Q →ₗ[ℝ] ℝ) (x : P) (y : Q) : M := by sorry
theorem coefficientHeight_trace (b : P →ₗ[ℝ] Q →ₗ[ℝ] ℝ)
    (htrace : Function.Injective (fun z : M ↦ fun m : M ↦ Algebra.trace ℝ M (m*z)))
    (m : M) (x : P) (y : Q) :
  Algebra.trace ℝ M (m * coefficientHeight b x y) = b (m • x) y := by sorry
theorem coefficientHeight_smul (b : P →ₗ[ℝ] Q →ₗ[ℝ] ℝ)
    (htrace : Function.Injective (fun z : M ↦ fun m : M ↦ Algebra.trace ℝ M (m*z)))
    (hadj : ∀ (m : M) (x : P) (y : Q), b (m • x) y = b x (m • y)) (m : M) (x : P) (y : Q) :
  coefficientHeight b (m • x) y = m * coefficientHeight b x y ∧
  coefficientHeight b x (m • y) = m * coefficientHeight b x y := by sorry
theorem coefficientHeight_add (b : P →ₗ[ℝ] Q →ₗ[ℝ] ℝ)
    (htrace : Function.Injective (fun z : M ↦ fun m : M ↦ Algebra.trace ℝ M (m*z)))
    (x x' : P) (y y' : Q) :
  coefficientHeight (M := M) b (x+x') y =
    coefficientHeight (M := M) b x y + coefficientHeight (M := M) b x' y ∧
  coefficientHeight (M := M) b x (y+y') =
    coefficientHeight (M := M) b x y + coefficientHeight (M := M) b x y' := by sorry
theorem coefficientHeight_basis_independent (b : P →ₗ[ℝ] Q →ₗ[ℝ] ℝ)
    (htrace : Function.Injective (fun z : M ↦ fun m : M ↦ Algebra.trace ℝ M (m*z)))
    (H : P → Q → M) (hH : ∀ m x y, Algebra.trace ℝ M (m * H x y)=b (m • x) y) :
  H = coefficientHeight b := by sorry
-- Test: coefficientHeight_rational
example (b : ℝ →ₗ[ℝ] ℝ →ₗ[ℝ] ℝ) (x y : ℝ) :
  (coefficientHeight b x y : ℝ) = b x y := by sorry
-- Test: coefficientHeight_zero
example (b : P →ₗ[ℝ] Q →ₗ[ℝ] ℝ)
    (htrace : Function.Injective (fun z : M ↦ fun m : M ↦ Algebra.trace ℝ M (m*z))) :
  (coefficientHeight b 0 0 : M) = 0 := by sorry
-- Test: coefficientHeight_trace_not_coordinate
example (hrank : Module.finrank ℝ M = 2) : Algebra.trace ℝ M (1 : M) = 2 := by sorry
end Coefficient

/-! GrossZagierAndArithmeticHeights:GZ.1/character-height-pairing — Character-component height pairing
The submodules are the actual inverse-character eigenspaces after a fixed
coefficient embedding. Their arithmetic construction and real coefficient
algebra are omitted. The displayed algebraic signatures do not prove their
identification with arbitrary submodules.
-/
section Character
variable {V W G : Type*} [AddCommGroup V] [Module ℂ V]
  [AddCommGroup W] [Module ℂ W] [Group G] [Fintype G]
def characterHeight (b : V →ₗ[ℂ] W →ₗ[ℂ] ℂ) (Vχ : Submodule ℂ V)
    (Wχinv : Submodule ℂ W) : Vχ →ₗ[ℂ] Wχinv →ₗ[ℂ] ℂ := by sorry
theorem characterHeight_projector (b : V →ₗ[ℂ] W →ₗ[ℂ] ℂ)
    (ρ : G → V →ₗ[ℂ] V) (ρdual : G → W →ₗ[ℂ] W)
    (χ : G →* ℂˣ) (hadj : ∀ g x y, b (ρ g x) y = b x (ρdual g⁻¹ y)) (x : V) (y : W) :
  b ((Fintype.card G : ℂ)⁻¹ • ∑ g, (χ g : ℂ)⁻¹ • ρ g x) y =
  b x ((Fintype.card G : ℂ)⁻¹ • ∑ g, (χ g : ℂ) • ρdual g y) := by sorry
theorem characterHeight_smul (b : V →ₗ[ℂ] W →ₗ[ℂ] ℂ) (S : Submodule ℂ V)
    (T : Submodule ℂ W) (a c : ℂ) (x : S) (y : T) :
  characterHeight b S T (a • x) (c • y) = a*c*characterHeight b S T x y := by sorry
theorem characterHeight_galois (b : V →ₗ[ℂ] W →ₗ[ℂ] ℂ)
    (ρ : G → V →ₗ[ℂ] V) (ρdual : G → W →ₗ[ℂ] W)
    (S : Submodule ℂ V) (T : Submodule ℂ W)
    (ρS : G → S →ₗ[ℂ] S) (ρT : G → T →ₗ[ℂ] T)
    (hinv : ∀ g x y,b (ρS g x) (ρT g y)=b x y) (g : G) (x : S) (y : T) :
  characterHeight b S T (ρS g x) (ρT g y)=characterHeight b S T x y := by sorry
-- Test: characterHeight_trivial
example (b : V →ₗ[ℂ] W →ₗ[ℂ] ℂ) (S : Submodule ℂ V) (T : Submodule ℂ W)
    (x : S) (y : T) : characterHeight b S T x y = b x y := by sorry
-- Test: characterHeight_wrong_character
example (b : V →ₗ[ℂ] W →ₗ[ℂ] ℂ) (u : V →ₗ[ℂ] V) (v : W →ₗ[ℂ] W)
    (hinv : ∀ x y, b (u x) (v y)=b x y) (a c : ℂ) (hac : a*c≠1)
    (x : V) (y : W) (hx : u x=a • x) (hy : v y=c • y) : b x y=0 := by sorry
-- Test: characterHeight_average_square
example (b : V →ₗ[ℂ] W →ₗ[ℂ] ℂ) (h : ℕ) (x : V) (y : W) :
  b ((h : ℂ)⁻¹ • x) ((h : ℂ)⁻¹ • y) = (h : ℂ)^(-2 : ℤ) * b x y := by sorry
end Character

/-! GrossZagierAndArithmeticHeights:GZ.3/normalised-hodge-class-and-xi-parametrised-realisation — Normalized Hodge class
D is the rational Picard/arithmetic Hodge class carrier component by component.
The stack/cusp Hodge line and actual proper level maps are supplier inputs,
omitted from this rational scaling signature.
-/
section Hodge
variable {D : Type*} [AddCommGroup D] [Module ℚ D]
def normalizedHodgeClass (c : D) (degree : ℚ) : D := by sorry
theorem normalizedHodgeClass_degree (deg : D →ₗ[ℚ] ℚ) (c : D) (hc : deg c≠0) :
  deg (normalizedHodgeClass c (deg c))=1 := by sorry
theorem normalizedHodgeClass_pullback (c c' : D) (d d' : ℚ) (hd : d≠0) (hd' : d'≠0)
    (pull : D →ₗ[ℚ] D) (n : ℚ) (hp : pull c=c') (hd : d'=n*d) :
  pull (normalizedHodgeClass c d)=n • normalizedHodgeClass c' d' := by sorry
theorem normalizedHodgeClass_pushforward (c c' : D) (d d' n : ℚ)
    (hd : d≠0) (hd' : d'≠0) (push : D →ₗ[ℚ] D)
    (hp : push c'=n • c) (hdeg : d'=n*d) :
  push (normalizedHodgeClass c' d')=normalizedHodgeClass c d := by sorry
-- Test: normalizedHodgeClass_degree_one
example (d : ℚ) (hd : d≠0) : normalizedHodgeClass d d=1 := by sorry
-- Test: normalizedHodgeClass_compact
example (c : D) (d : ℚ) : normalizedHodgeClass c d=d⁻¹ • c := by sorry
-- Test: normalizedHodgeClass_double_cover
example (c c' : D) (d : ℚ) (hd : d≠0) (pull push : D →ₗ[ℚ] D)
    (hp : pull c=c') (hq : push c'=2 • c) :
  pull (normalizedHodgeClass c d)=2 • normalizedHodgeClass c' (2*d) ∧
  push (normalizedHodgeClass c' (2*d))=normalizedHodgeClass c d := by sorry
end Hodge

/-! GrossZagierAndArithmeticHeights:GZ.3/rational-xi-realization — Rational ξ-normalized realization
H i is Hom(J_i,A) tensor Q with transition by the actual level maps.
The xi-normalized curve-map/Jacobian-Hom equivalence and its geometric
actions are not yet typed by the supplier; those identifications are omitted.
The transparent alias retains the real colimit carrier and imports its
construction. The zero-class and identity tests use its specified inputs.
-/
section RationalRealization
variable {I : Type*} [Preorder I] [DecidableEq I] [Nonempty I] [IsDirectedOrder I]
  (H : I → Type*) [∀ i, AddCommGroup (H i)] [∀ i, Module ℚ (H i)]
  (transition : ∀ i j, i≤j → H i →ₗ[ℚ] H j)
/-- The actual level colimit, using Mathlib's module colimit. -/
abbrev rationalXiRealization := Module.DirectLimit H transition
theorem rationalXiRealization_level (i j : I) (hij : i≤j) (f : H i) :
  Module.DirectLimit.of ℚ I H transition j (transition i j hij f)=
    Module.DirectLimit.of ℚ I H transition i f := by sorry
theorem rationalXiRealization_ext {V : Type*} [AddCommGroup V] [Module ℚ V]
    (f g : rationalXiRealization H transition →ₗ[ℚ] V)
    (h : ∀ i, f.comp (Module.DirectLimit.of ℚ I H transition i)=
      g.comp (Module.DirectLimit.of ℚ I H transition i)) : f=g := by sorry
theorem rationalXiRealization_actions (T m : rationalXiRealization H transition →ₗ[ℚ]
    rationalXiRealization H transition) (h : T.comp m=m.comp T) (f : rationalXiRealization H transition) :
  T (m f)=m (T f) := by sorry
theorem rationalXiRealization_xi {D A : Type*} [AddCommGroup D] [Module ℚ D]
    [AddCommGroup A] [Module ℚ A] (AJ : D →ₗ[ℚ] A) (degree : D →ₗ[ℚ] ℚ)
    (ξ : D) (hξ : degree ξ=1) : AJ (ξ-degree ξ • ξ)=0 := by sorry
-- Test: rationalXiRealization_constant
example (i : I) : Module.DirectLimit.of ℚ I H transition i (0 : H i)=0 := by sorry
-- Test: rationalXiRealization_identity
example (i : I) {D : Type*} [AddCommGroup D] [Module ℚ D]
    (AJ : D →ₗ[ℚ] D) (hAJ : AJ=LinearMap.id) (d : D) : AJ d=d := by sorry
-- Test: rationalXiRealization_finer_level
example (i j : I) (hij : i≤j) (f : H i) :
  Module.DirectLimit.of ℚ I H transition i f=
    Module.DirectLimit.of ℚ I H transition j (transition i j hij f) := by sorry
end RationalRealization

/-! GrossZagierAndArithmeticHeights:GZ.3/composition-pairing — Volume-normalized composition pairing
The dualG argument already includes the inverse Jacobian polarization.
Rational points and endomorphism-field identification are omitted. Scalar
volume is rational in this finite-level signature; the adelic real-volume
and complex Petersson realization are separate comparison targets.
-/
section Composition
variable {J A : Type*} [AddCommGroup J] [Module ℚ J] [AddCommGroup A] [Module ℚ A]
def compositionPairing (f : J →ₗ[ℚ] A) (dualG : A →ₗ[ℚ] J)
    (volume : ℚ) : A →ₗ[ℚ] A := by sorry
theorem compositionPairing_add (f f' : J →ₗ[ℚ] A) (g g' : A →ₗ[ℚ] J)
    (vol : ℚ) :
  compositionPairing (f+f') g vol = compositionPairing f g vol + compositionPairing f' g vol ∧
  compositionPairing f (g+g') vol = compositionPairing f g vol + compositionPairing f g' vol := by sorry
theorem compositionPairing_level (f : J →ₗ[ℚ] A) (g : A →ₗ[ℚ] J)
    (vol d : ℚ) (hd : d≠0) :
  compositionPairing (d • f) g (d*vol)=compositionPairing f g vol := by sorry
theorem compositionPairing_endomorphism (f : J →ₗ[ℚ] A) (g : A →ₗ[ℚ] J)
    (m : A →ₗ[ℚ] A) (vol : ℚ) :
  compositionPairing (m.comp f) g vol=m.comp (compositionPairing f g vol) := by sorry
theorem compositionPairing_elliptic (f : J →ₗ[ℚ] A) (g : A →ₗ[ℚ] J)
    (degree vol : ℚ) (hdeg : f.comp g=degree • LinearMap.id) :
  compositionPairing f g vol=(degree/vol) • LinearMap.id := by sorry
-- Test: compositionPairing_zero
example (g : A →ₗ[ℚ] J) (vol : ℚ) : compositionPairing 0 g vol=0 := by sorry
-- Test: compositionPairing_cover
example (f : J →ₗ[ℚ] A) (g : A →ₗ[ℚ] J) (vol : ℚ) :
  compositionPairing (2 • f) g (2*vol)=compositionPairing f g vol := by sorry
-- Test: compositionPairing_isogeny
example (f : J →ₗ[ℚ] A) (g : A →ₗ[ℚ] J) (vol m : ℚ) :
  compositionPairing (m • f) g vol=m • compositionPairing f g vol := by sorry
end Composition

/-! GrossZagierAndArithmeticHeights:GZ.3/manin-constant — Manin constant
D is the rational differential space on X0(N). Actual modular newform,
minimal Neron differential and parametrization pullback carriers are omitted;
the scalar extraction is expressed against their genuine nonzero line.
The 11a3 example represents its source-computed pullback 5 omega_f, without
asserting that the source curve has been built in Lean.
-/
section Manin
variable {D : Type*} [AddCommGroup D] [Module ℚ D]
def maninConstant (ωf pullω : D) : ℚ := by sorry
theorem maninConstant_pullback (ωf pullω : D) (hf : ωf≠0)
    (hline : pullω∈Submodule.span ℚ {ωf}) : pullω=maninConstant ωf pullω • ωf := by sorry
theorem maninConstant_isogeny (ωf pullω : D) (hf : ωf≠0)
    (hline : pullω∈Submodule.span ℚ {ωf}) (a : ℚ) :
  maninConstant ωf (a • pullω)=a*maninConstant ωf pullω := by sorry
theorem maninConstant_sign (ωf pullω : D) (hf : ωf≠0)
    (hline : pullω∈Submodule.span ℚ {ωf}) :
  maninConstant ωf (-pullω) = -maninConstant ωf pullω := by sorry
-- Test: maninConstant_multiplication
example (ωf pullω : D) (hf : ωf≠0) (hline : pullω∈Submodule.span ℚ {ωf})
    (n : ℤ) (degree : ℕ) :
  maninConstant ωf (n • pullω)=n*maninConstant ωf pullω ∧
    n.natAbs^2*degree=degree*n.natAbs^2 := by sorry
-- Test: maninConstant_sign_valuation
example (ωf pullω : D) (hf : ωf≠0) (hline : pullω∈Submodule.span ℚ {ωf}) :
  |maninConstant ωf (-pullω)|=|maninConstant ωf pullω| := by sorry
-- Test: maninConstant_11a3
example (ωf : D) (hf : ωf≠0) : maninConstant ωf (5 • ωf)=5 := by sorry
end Manin

/-! GrossZagierAndArithmeticHeights:GZ.4/toric-hom-space — Local toric functional space
G denotes the embedded local torus; ρ is the restriction of the actual
local representation. Continuous Hom is used here. The SR.2 smooth-category
variant and GL2 Casselman-Wallach admissibility hypotheses are omitted until
their representation carriers are supplied.
-/
section ToricHom
variable {G V : Type*} [Group G] [AddCommGroup V] [Module ℂ V]
  [TopologicalSpace V]
def toricHom (ρ : G → V →L[ℂ] V) (χ : G →* ℂˣ) : Submodule ℂ (V →L[ℂ] ℂ) := by sorry
theorem toricHom_equivariance (ρ : G → V →L[ℂ] V) (χ : G →* ℂˣ)
    (ℓ : toricHom ρ χ) (t : G) (x : V) :
  (ℓ : V →L[ℂ] ℂ) (ρ t x)=(χ t : ℂ)⁻¹ * (ℓ : V →L[ℂ] ℂ) x := by sorry
theorem toricHom_transport {W : Type*} [AddCommGroup W] [Module ℂ W] [TopologicalSpace W]
    (ρ : G → V →L[ℂ] V) (σ : G → W →L[ℂ] W) (χ : G →* ℂˣ)
    (e : V ≃L[ℂ] W) (he : ∀ t x, e (ρ t x)=σ t (e x)) :
  Nonempty (toricHom ρ χ ≃ₗ[ℂ] toricHom σ χ) := by sorry
theorem toricHom_center (ρ : G → V →L[ℂ] V) (χ : G →* ℂˣ)
    (z : G) (ω : ℂ) (hz : ∀ x, ρ z x=ω • x) (hmatch : (χ z : ℂ)*ω≠1) :
  toricHom ρ χ=⊥ := by sorry
-- Test: toricHom_wrong_center
example (ρ : G → V →L[ℂ] V) (χ : G →* ℂˣ) (z : G)
    (hz : ∀ x, ρ z x=2 • x) (hχ : χ z=1) : toricHom ρ χ=⊥ := by sorry
-- Test: toricHom_zero_vector
example (ρ : G → V →L[ℂ] V) (χ : G →* ℂˣ) (ℓ : toricHom ρ χ) :
  (ℓ : V →L[ℂ] ℂ) 0=0 := by sorry
-- Test: toricHom_character_inverse
example (ρ : G → V →L[ℂ] V) (χ : G →* ℂˣ) (ℓ : toricHom ρ χ)
    (x : V) (t : G) (a : ℂ) (ha : a≠(χ t : ℂ)⁻¹) (hx : ρ t x=a • x) :
  (ℓ : V →L[ℂ] ℂ) x=0 := by sorry
end ToricHom

/-! GrossZagierAndArithmeticHeights:GZ.4/normalized-toric-integral — Normalized local toric form
factor is exactly the local L-ratio in the packet, not an adjustable
constant. The local-field quotient, Haar normalization, essentially unitary
representation and Saito-Tunnell Hom identification are omitted from these
integral signatures. The spherical input is the MP/GL2 computed integral,
and zeroHom needs its actual toric-functional factorization theorem.
-/
section ToricIntegral
variable {T V W : Type*} [MeasurableSpace T] [AddCommGroup V] [Module ℂ V]
  [AddCommGroup W] [Module ℂ W]
def normalizedToricForm (factor : ℂ) (μ : MeasureTheory.Measure T)
    (ρ : T → V →ₗ[ℂ] V) (χ : T → ℂ) (b : V →ₗ[ℂ] W →ₗ[ℂ] ℂ) : V → W → ℂ := by sorry
theorem normalizedToricForm_bilinear (factor : ℂ) (μ : MeasureTheory.Measure T)
    (ρ : T → V →ₗ[ℂ] V) (χ : T → ℂ) (b : V →ₗ[ℂ] W →ₗ[ℂ] ℂ)
    (hconv : ∀ x y, MeasureTheory.Integrable (fun t ↦ b (ρ t x) y*χ t) μ)
    (a c : ℂ) (x x' : V) (y y' : W) :
  normalizedToricForm factor μ ρ χ b (a • x+c • x') y =
    a*normalizedToricForm factor μ ρ χ b x y+c*normalizedToricForm factor μ ρ χ b x' y ∧
  normalizedToricForm factor μ ρ χ b x (a • y+c • y') =
    a*normalizedToricForm factor μ ρ χ b x y+c*normalizedToricForm factor μ ρ χ b x y' := by sorry
theorem normalizedToricForm_rescale (factor c : ℂ) (r : ℝ≥0∞)
    (μ : MeasureTheory.Measure T) (ρ : T → V →ₗ[ℂ] V) (χ : T → ℂ)
    (b : V →ₗ[ℂ] W →ₗ[ℂ] ℂ) (hr : r≠⊤) (x : V) (y : W) :
  normalizedToricForm factor (r • μ) ρ χ (c • b) x y =
    (r.toReal : ℂ)*c*normalizedToricForm factor μ ρ χ b x y := by sorry
theorem normalizedToricForm_twist (factor : ℂ) (μ : MeasureTheory.Measure T)
    (ρ : T → V →ₗ[ℂ] V) (χ m : T → ℂ) (hm : ∀ t, m t≠0)
    (b : V →ₗ[ℂ] W →ₗ[ℂ] ℂ) :
  normalizedToricForm factor μ (fun t ↦ m t • ρ t) (fun t ↦ χ t/m t) b =
    normalizedToricForm factor μ ρ χ b := by sorry
theorem normalizedToricForm_zeroHom (factor : ℂ) (μ : MeasureTheory.Measure T)
    (ρ : T → V →ₗ[ℂ] V) (χ : T → ℂ) (b : V →ₗ[ℂ] W →ₗ[ℂ] ℂ)
    (hzero : ∀ x y, ∫ t, b (ρ t x) y*χ t ∂μ=0) :
  normalizedToricForm factor μ ρ χ b=0 := by sorry
-- Test: normalizedToricForm_spherical
example (factor : ℂ) (μ : MeasureTheory.Measure T) (ρ : T → V →ₗ[ℂ] V)
    (χ : T → ℂ) (b : V →ₗ[ℂ] W →ₗ[ℂ] ℂ) (x : V) (y : W)
    (hunram : factor*(∫ t, b (ρ t x) y*χ t ∂μ)=b x y) :
  normalizedToricForm factor μ ρ χ b x y=b x y := by sorry
-- Test: normalizedToricForm_zero
example (factor : ℂ) (μ : MeasureTheory.Measure T) (ρ : T → V →ₗ[ℂ] V)
    (χ : T → ℂ) (b : V →ₗ[ℂ] W →ₗ[ℂ] ℂ) (y : W) :
  normalizedToricForm factor μ ρ χ b 0 y=0 := by sorry
-- Test: normalizedToricForm_measure_two
example (factor : ℂ) (μ : MeasureTheory.Measure T) (ρ : T → V →ₗ[ℂ] V)
    (χ : T → ℂ) (b : V →ₗ[ℂ] W →ₗ[ℂ] ℂ) (x : V) (y : W) :
  normalizedToricForm factor (2 • μ) ρ χ b x y=2*normalizedToricForm factor μ ρ χ b x y := by sorry
end ToricIntegral

/-! GrossZagierAndArithmeticHeights:GZ.4/admissible-toric-order — Admissible toric order
The order-lattice carrier, local prime ideal discriminant and the split
conductor orientation are omitted; Subring is only the generic order
underlying ring. disc denotes the valuation exponent in this signature;
its equality disc R=n encodes the ideal discriminant p^n before that
carrier is available. The split-orientation test records c1=c, while the
actual two-character lattice choice remains mandatory in the packet.
-/
section ToricOrder
variable {B K : Type*} [Ring B] [Ring K]
def admissibleToricOrder (ι : K →+* B) (disc : Subring B → ℕ)
    (conductorOrder : ℕ → Subring K) (n c : ℕ) (nonsplit : Bool) : Set (Subring B) := by sorry
theorem admissibleToricOrder_intersection (ι : K →+* B) (disc : Subring B → ℕ)
    (O : ℕ → Subring K) (n c : ℕ) (ns : Bool)
    (R : Subring B) (hR : R∈admissibleToricOrder ι disc O n c ns) :
  R.comap ι=O (if ns && decide (c<n) then 0 else c) := by sorry
theorem admissibleToricOrder_discriminant (ι : K →+* B) (disc : Subring B → ℕ)
    (O : ℕ → Subring K) (n c : ℕ) (ns : Bool)
    (R : Subring B) (hR : R∈admissibleToricOrder ι disc O n c ns) : disc R=n := by sorry
theorem admissibleToricOrder_conjugate (ι : K →+* B) (disc : Subring B → ℕ)
    (O : ℕ → Subring K) (n c : ℕ) (ns : Bool) (e : B ≃+* B)
    (hι : e.toRingHom.comp ι=ι) (hd : ∀ R, disc (R.map e.toRingHom)=disc R)
    (R : Subring B) (hR : R∈admissibleToricOrder ι disc O n c ns) :
  R.map e.toRingHom∈admissibleToricOrder ι disc O n c ns := by sorry
-- Test: admissibleToricOrder_unramified
example (ι : K →+* B) (disc : Subring B → ℕ) (O : ℕ → Subring K)
    (ns : Bool) (R : Subring B) (hR : R∈admissibleToricOrder ι disc O 0 0 ns) : R.comap ι=O 0 := by sorry
-- Test: admissibleToricOrder_mismatch
example (ι : K →+* B) (disc : Subring B → ℕ) (O : ℕ → Subring K)
    (n c : ℕ) (hc : c<n) (R : Subring B)
    (hR : R∈admissibleToricOrder ι disc O n c true) : R.comap ι=O 0 := by sorry
-- Test: admissibleToricOrder_split_orientation
example (n c : ℕ) (hc : 0<c ∧ c<n) : (if false && decide (c<n) then 0 else c)=c := by sorry
end ToricOrder

/-! GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing — Global arithmetic intersection on curves
D is the vector space of arithmetic divisor classes on the compatible
regular model system, supplied by SR/TB. Actual local length, Green-current
and model gluing constructions are omitted from the signature. The finite
fibre-kernel example below checks the imported SR output, not a new proof.
-/
section Intersection
variable {D X V : Type*} [AddCommGroup D] [Module ℝ D]
def arithmeticIntersection (finite infinite : D →ₗ[ℝ] D →ₗ[ℝ] ℝ)
    (extensionDegree : ℕ) : D →ₗ[ℝ] D →ₗ[ℝ] ℝ := by sorry
theorem arithmeticIntersection_add (fin inf : D →ₗ[ℝ] D →ₗ[ℝ] ℝ)
    (d : ℕ) (a b c : D) :
  arithmeticIntersection fin inf d (a+b) c =
    arithmeticIntersection fin inf d a c + arithmeticIntersection fin inf d b c := by sorry
theorem arithmeticIntersection_symm (fin inf : D →ₗ[ℝ] D →ₗ[ℝ] ℝ)
    (hfin : ∀ a b, fin a b=fin b a) (hinf : ∀ a b, inf a b=inf b a)
    (d : ℕ) (a b : D) :
  arithmeticIntersection fin inf d a b = arithmeticIntersection fin inf d b a := by sorry
theorem arithmeticIntersection_projection (fin inf : D →ₗ[ℝ] D →ₗ[ℝ] ℝ)
    (pull push : D →ₗ[ℝ] D)
    (hfin : ∀ a b, fin (pull a) b=fin a (push b))
    (hinf : ∀ a b, inf (pull a) b=inf a (push b)) (d : ℕ) (a b : D) :
  arithmeticIntersection fin inf d (pull a) b =
    arithmeticIntersection fin inf d a (push b) := by sorry
theorem arithmeticIntersection_baseChange (fin inf : D →ₗ[ℝ] D →ₗ[ℝ] ℝ)
    (d e : ℕ) (he : e≠0) :
  arithmeticIntersection ((e : ℝ) • fin) ((e : ℝ) • inf) (e*d) =
    arithmeticIntersection fin inf d := by sorry
-- Test: arithmeticIntersection_fibre_kernel
example (fin : D →ₗ[ℝ] D →ₗ[ℝ] ℝ) (fibre E : D)
    (degree : D →ₗ[ℝ] ℝ) (base : ℝ)
    (hfibre : ∀ d,fin fibre d=degree d*base) (hdegree : degree E=0) : fin fibre E=0 := by sorry
-- Test: arithmeticIntersection_principal
example (fin inf : D →ₗ[ℝ] D →ₗ[ℝ] ℝ) (principal E : D)
    (hproduct : fin principal E + inf principal E=0) (d : ℕ) :
  arithmeticIntersection fin inf d principal E=0 := by sorry
-- Test: arithmeticIntersection_complex_weight
example (a : ℝ) (ha : a≠0) : 2*a≠a := by sorry
end Intersection

/-! GrossZagierAndArithmeticHeights:GZ.2/admissible-arithmetic-extension — Admissible arithmetic extension
The current A2/SR/TB baseline lacks the compatible arithmetic class carrier.
The analytic and vertical normalization conditions cannot yet be applied to
this section’s bare linear maps. They are omitted from the construction
signature, not stored in a substitute proposition. The characterization
needs the construction’s same normalization maps; realizing that dependence
is an explicit carrier refinement in GZ.2.
-/
/- Signatures and tests omitted for GZ.2/admissible-arithmetic-extension. The constructor only depends on generic restriction and cannot encode the chosen curvature, vertical and Hodge normalizations. See the independent review and the packet gap. -/

/-! GrossZagierAndArithmeticHeights:GZ.2/arakelov-probability-form — Arakelov probability form
Each μ_i is the measure (i/2) α_i∧conj(α_i) from the actual orthonormal
holomorphic basis. The construction is (1/g) times their sum. Holomorphic
forms, unitary basis change and the torus area identification are omitted
until ChernCurvatureDistributionTheory/TB.6 supplies those terms.
-/
section ArakelovMeasure
variable {X : Type*} [MeasurableSpace X]
def arakelovMeasure {g : ℕ} (μ : Fin g → MeasureTheory.Measure X) : MeasureTheory.Measure X := by sorry
theorem arakelovMeasure_basis_independent {g : ℕ} (μ ν : Fin g → MeasureTheory.Measure X)
    (hb : ∑ i, μ i=∑ i, ν i) : arakelovMeasure μ=arakelovMeasure ν := by sorry
theorem arakelovMeasure_mass {g : ℕ} (hg : 0<g) (μ : Fin g → MeasureTheory.Measure X)
    (hμ : ∀ i, μ i Set.univ=1) : arakelovMeasure μ Set.univ=1 := by sorry
theorem arakelovMeasure_isometry {g : ℕ} (μ : Fin g → MeasureTheory.Measure X)
    (f : X → X) (hf : Measurable f) :
  MeasureTheory.Measure.map f (arakelovMeasure μ) =
    arakelovMeasure (fun i ↦ MeasureTheory.Measure.map f (μ i)) := by sorry
-- Test: arakelovMeasure_genus_two
example (μ : Fin 2 → MeasureTheory.Measure X) (hμ : ∀ i, μ i Set.univ=1) :
  arakelovMeasure μ Set.univ=1 ∧ ((2 : ℝ)⁻¹)=1/2 := by sorry
-- Test: arakelovMeasure_genus_one
example (μ : MeasureTheory.Measure X) : arakelovMeasure (fun _ : Fin 1 ↦ μ)=μ := by sorry
-- Test: arakelovMeasure_wrong_mass
example (μ : Fin 2 → MeasureTheory.Measure X) (hμ : ∀ i, μ i Set.univ=1) :
  (∑ i, μ i) Set.univ=2 := by sorry
end ArakelovMeasure

/-! GrossZagierAndArithmeticHeights:GZ.2/archimedean-admissible-metric — Archimedean admissible metric
L x is the actual complex line fibre and the elements are norms on fibres,
not currents. Smoothness, positivity and norm homogeneity are omitted until
the hermitian-line supplier gives their dependent carrier. c1 is its actual
Chern-current map; the set condition is c1(norm)=degree times mu.
-/
section Curvature
variable {X C : Type*} {L : X → Type*} [AddCommGroup C] [Module ℝ C]
def admissibleMetric (c1 : (∀ x, L x → ℝ) → C) (μ : C) (degree : ℝ) :
    Set (∀ x, L x → ℝ) := by sorry
theorem admissibleMetric_tensor (c1 : (∀ x, L x → ℝ) → C) (μ : C) (d e : ℝ)
    (tensor : (∀ x, L x → ℝ) → (∀ x, L x → ℝ) → (∀ x, L x → ℝ))
    (hcurv : ∀ a b, c1 (tensor a b)=c1 a+c1 b)
    (a b : ∀ x, L x → ℝ) (ha : a∈admissibleMetric c1 μ d)
    (hb : b∈admissibleMetric c1 μ e) : tensor a b∈admissibleMetric c1 μ (d+e) := by sorry
theorem admissibleMetric_rescale (c1 : (∀ x, L x → ℝ) → C) (μ : C) (d c : ℝ)
    (hc : 0<c) (hnorm : ∀ a, c1 (fun x v ↦ c*a x v)=c1 a)
    (a : ∀ x, L x → ℝ) (ha : a∈admissibleMetric c1 μ d) :
  (fun x v ↦ c*a x v)∈admissibleMetric c1 μ d := by sorry
theorem admissibleMetric_fibre (c1 : (∀ x, L x → ℝ) → C) (μ : C) (d : ℝ)
    (restriction : (∀ x, L x → ℝ) → (∀ x, L x → ℝ))
    (hcurv : ∀ a,c1 (restriction a)=c1 a) (a : ∀ x, L x → ℝ)
    (ha : a∈admissibleMetric c1 μ d) : restriction a∈admissibleMetric c1 μ d := by sorry
-- Test: admissibleMetric_degree_zero
example (c1 : (∀ x, L x → ℝ) → C) (μ : C) (a : ∀ x, L x → ℝ)
    (ha : a∈admissibleMetric c1 μ 0) : c1 a=0 := by sorry
-- Test: admissibleMetric_degree_two
example (c1 : (∀ x, L x → ℝ) → C) (μ : C) (a : ∀ x, L x → ℝ)
    (ha : c1 a=2 • μ) : a∈admissibleMetric c1 μ 2 := by sorry
-- Test: admissibleMetric_wrong_curvature
example (c1 : (∀ x, L x → ℝ) → C) (μ : C) (hμ : μ≠0)
    (a : ∀ x, L x → ℝ) (ha : c1 a=μ) : a∉admissibleMetric c1 μ 2 := by sorry
end Curvature

/-! GrossZagierAndArithmeticHeights:GZ.2/admissible-green-function — Degree-weighted admissible Green function
The current equation is ddc(g)=degree • μ−δ. Local logarithmic singularity
and smooth extension of g+log|f| are omitted because the current/domain
carrier is not yet present. The omitted condition is not a free predicate
argument. The metric equation below is the Poincare-Lelong consequence.
-/
section GreenCurrent
variable {G C : Type*} [AddCommGroup G] [Module ℝ G] [AddCommGroup C] [Module ℝ C]
def admissibleGreen (ddc : G →ₗ[ℝ] C) (μ δ : C) (degree : ℝ) : Set G := by sorry
theorem admissibleGreen_add (ddc : G →ₗ[ℝ] C) (μ δ ε : C) (d e : ℝ) (f g : G)
    (hf : f∈admissibleGreen ddc μ δ d) (hg : g∈admissibleGreen ddc μ ε e) :
  f+g∈admissibleGreen ddc μ (δ+ε) (d+e) := by sorry
theorem admissibleGreen_constant (ddc : G →ₗ[ℝ] C) (μ δ : C) (d : ℝ) (g c : G)
    (hg : g∈admissibleGreen ddc μ δ d) (hc : ddc c=0) :
  g+c∈admissibleGreen ddc μ δ d := by sorry
theorem admissibleGreen_metric (ddc : G →ₗ[ℝ] C) (μ δ : C) (d : ℝ) (g : G)
    (hg : g∈admissibleGreen ddc μ δ d) : ddc g+δ=d • μ := by sorry
-- Test: admissibleGreen_zero
example (ddc : G →ₗ[ℝ] C) (μ : C) : (0 : G)∈admissibleGreen ddc μ 0 0 := by sorry
-- Test: admissibleGreen_degree_two
example (ddc : G →ₗ[ℝ] C) (μ δ : C) (g : G)
    (hg : g∈admissibleGreen ddc μ δ 2) : ddc g+δ=2 • μ := by sorry
-- Test: admissibleGreen_missing_degree
example (ddc : G →ₗ[ℝ] C) (mass : C →ₗ[ℝ] ℝ) (μ : C)
    (hm : mass μ=1) (hddc : ∀ g, mass (ddc g)=0) : ∀ g, ddc g≠μ := by sorry
end GreenCurrent

/-! GrossZagierAndArithmeticHeights:GZ.2/normalized-arakelov-green — Normalized Arakelov Green function
X is the off-diagonal analytic point domain and C its currents. Only the
normalization equations are expressed. Elliptic Green-operator solvability,
self-adjointness, smoothness and the logarithmic diagonal extension are
omitted until the named analytic supplier provides their actual types.
The final example checks the sign of the local logarithmic principal part;
it does not claim smoothness from a scalar identity.
-/
/- Signatures and tests omitted for GZ.2/normalized-arakelov-green. An arbitrary linear ddc operator need not solve the Green equation; compact-curve Green solvability and logarithmic currents are missing. See the independent review and the packet gap. -/

/-! GrossZagierAndArithmeticHeights:GZ.2/arakelov-dualizing-metric — Arakelov dualizing metric
L is the actual fibre of omega tensor O(x), with the latter factor normalized
by the Green norm. Residue pullback gives its norm, and determines the omega
norm by cancelling that factor. The curve/genus, Chern-form and diagonal
adjunction identifications are omitted, so the last two curvature examples
are signatures for genus one and two respectively, not assertions about
arbitrary residue families or arbitrary Chern-form operations.
-/
section DualizingMetric
variable {X C : Type*} {L : X → Type*} [∀ x, AddCommGroup (L x)]
  [∀ x, Module ℂ (L x)] [AddCommGroup C] [Module ℝ C]
def arakelovDualizingMetric (residue : ∀ x, L x →ₗ[ℂ] ℂ) : ∀ x, L x → ℝ := by sorry
theorem arakelovDualizingMetric_residue (residue : ∀ x, L x →ₗ[ℂ] ℂ) (x : X) (v : L x) :
  arakelovDualizingMetric residue x v = ‖residue x v‖ := by sorry
/- Omitted arakelovDualizingMetric_curvature: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
/- Omitted arakelovDualizingMetric_diagonal: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
-- Test: arakelovDualizingMetric_genus_one
/- Omitted test:arakelovDualizingMetric_genus_one: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
-- Test: arakelovDualizingMetric_genus_two
/- Omitted test:arakelovDualizingMetric_genus_two: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
-- Test: arakelovDualizingMetric_rescale
example (residue : ∀ x, L x →ₗ[ℂ] ℂ) (x : X) (v : L x)
    (hv : residue x v≠0) (c : ℝ) (hc : 0<c) (hne : c≠1) :
  c*arakelovDualizingMetric residue x v≠‖residue x v‖ := by sorry
end DualizingMetric

/-! GrossZagierAndArithmeticHeights:GZ.2/graph-admissible-measure — Admissible reduction-graph measure
X is the metric graph. vertex v is its Dirac measure; length e is unit
edge length measure, and resistance e is effective resistance in the
complement of that edge (infinity for a bridge). The actual generic graph,
Laplacian and Green operator are TB.3 inputs. Their defining relation and
self-adjointness hypotheses are omitted from the two Green signatures;
K must be the genus-weighted canonical divisor. No graph is re-planned here.
-/
section GraphMeasure
variable {X V E : Type*} [MeasurableSpace X] [Fintype V] [Fintype E]
def graphAdmissibleMeasure (g : ℕ) (genus : V → ℕ) (resistance : E → ℝ≥0∞)
    (vertex : V → MeasureTheory.Measure X) (length : E → MeasureTheory.Measure X) :
    MeasureTheory.Measure X := by sorry
theorem graphAdmissibleMeasure_mass (g : ℕ) (genus : V → ℕ) (resistance : E → ℝ≥0∞)
    (vertex : V → MeasureTheory.Measure X) (length : E → MeasureTheory.Measure X)
    (hg : 0<g) (hgenus : (∑ v, (genus v : ℝ≥0∞))+
      ∑ e, (resistance e+1)⁻¹=(g : ℝ≥0∞))
    (hv : ∀ v, vertex v Set.univ=1) (he : ∀ e, length e Set.univ=1) :
  graphAdmissibleMeasure g genus resistance vertex length Set.univ=1 := by sorry
/- Omitted graphAdmissibleGreen_laplacian: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
/- Omitted graphAdmissibleGreen_canonical: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
theorem graphAdmissibleMeasure_pushforward (g : ℕ) (genus : V → ℕ) (resistance : E → ℝ≥0∞)
    (vertex : V → MeasureTheory.Measure X) (length : E → MeasureTheory.Measure X)
    (i : X → X) (hi : Measurable i) :
  MeasureTheory.Measure.map i (graphAdmissibleMeasure g genus resistance vertex length)=
  graphAdmissibleMeasure g genus resistance
    (fun v ↦ MeasureTheory.Measure.map i (vertex v))
    (fun e ↦ MeasureTheory.Measure.map i (length e)) := by sorry
-- Test: graphAdmissibleMeasure_good_reduction
example (g : ℕ) (hg : 0<g) (δ : MeasureTheory.Measure X) :
  graphAdmissibleMeasure g (fun _ : Fin 1 ↦ g) (fun e : Fin 0 ↦ Fin.elim0 e)
    (fun _ ↦ δ) (fun e : Fin 0 ↦ Fin.elim0 e)=δ := by sorry
-- Test: graphAdmissibleMeasure_tate_cycle
example (δ length : MeasureTheory.Measure X) :
  graphAdmissibleMeasure 1 (fun _ : Fin 1 ↦ 0) (fun _ : Fin 1 ↦ 0)
    (fun _ ↦ δ) (fun _ ↦ length)=length := by sorry
-- Test: graphAdmissibleMeasure_genus_weight
example (δ : MeasureTheory.Measure X) (hδ : δ Set.univ=1) :
  graphAdmissibleMeasure 2 (fun _ : Fin 1 ↦ 0) (fun e : Fin 0 ↦ Fin.elim0 e)
    (fun _ ↦ δ) (fun e : Fin 0 ↦ Fin.elim0 e) Set.univ=0 := by sorry
end GraphMeasure

/-! GrossZagierAndArithmeticHeights:GZ.2/real-admissible-descent — Admissible metrics at real places
X is the actual complex line-bundle total space and r its conjugation
orbit relation. The real structure and preservation of the canonical
Arakelov/residue norms are supplied by the requested TB.2/TB.6 descent.
Those analytic/arithmetic identifications are omitted; the quotient
universal property is expressed against the baseline Quotient.
-/
section RealDescent
variable {X : Type*}
def realAdmissibleMetric (r : Setoid X) (norm : X → ℝ)
    (hinv : ∀ x y, r.r x y → norm x=norm y) : Quotient r → ℝ := by sorry
theorem realAdmissibleMetric_pullback (r : Setoid X) (norm : X → ℝ)
    (hinv : ∀ x y, r.r x y → norm x=norm y) (x : X) :
  realAdmissibleMetric r norm hinv (Quotient.mk r x)=norm x := by sorry
theorem realAdmissibleMetric_unique (r : Setoid X) (norm : X → ℝ)
    (hinv : ∀ x y, r.r x y → norm x=norm y) (f : Quotient r → ℝ)
    (hf : ∀ x, f (Quotient.mk r x)=norm x) : f=realAdmissibleMetric r norm hinv := by sorry
theorem realAdmissibleMetric_residue (r : Setoid X) (norm : X → ℝ)
    (hinv : ∀ x y, r.r x y → norm x=norm y) (residue : X → ℂ)
    (hres : ∀ x, norm x=‖residue x‖) (x : X) :
  realAdmissibleMetric r norm hinv (Quotient.mk r x)=‖residue x‖ := by sorry
-- Test: realAdmissibleMetric_conjugate_points
example (r : Setoid X) (norm : X → ℝ) (hinv : ∀ x y, r.r x y → norm x=norm y)
    (x y : X) (hxy : r.r x y) : norm x=norm y := by sorry
-- Test: realAdmissibleMetric_real_point
example : ‖(1 : ℂ)‖=1 := by sorry
-- Test: realAdmissibleMetric_wrong_involution
example (r : Setoid X) (norm : X → ℝ) (x y : X) (hxy : r.r x y) (hne : norm x≠norm y) :
  ¬∃ f : Quotient r → ℝ, ∀ z, f (Quotient.mk r z)=norm z := by sorry
end RealDescent

/-! GrossZagierAndArithmeticHeights:GZ.2/colmez-residue-line — Residue-normalized adjunction line
A is O_H, K is H, and L is the integral lattice of
(L_U tensor O(P/e)) restricted to P. Residue produces an actual submodule
of H. Finite generation/invertibility, the norm, local lengths and the
Arakelov degree are omitted until their arithmetic-line carrier is present;
the degree signature retains its exact finite-minus-log-norm formula.
-/
section ResidueLine
variable {A K L : Type*} [CommRing A] [Field K] [Algebra A K]
  [AddCommGroup L] [Module A L]
def residueAdjunctionLine (residue : L →ₗ[A] K) : Submodule A K := by sorry
theorem residueAdjunctionLine_constructor (residue : L →ₗ[A] K) :
  residueAdjunctionLine residue=LinearMap.range residue := by sorry
theorem residueAdjunctionLine_residue_coordinate (residue residue' : L →ₗ[A] K)
    (hres : residue=residue') : residueAdjunctionLine residue=residueAdjunctionLine residue' := by sorry
theorem residueAdjunctionLine_finite_lattice (residue : L →ₗ[A] K) (a : K) :
  a∈residueAdjunctionLine residue ↔ ∃ x, residue x=a := by sorry
/- Omitted residueAdjunctionLine_degree: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
-- Test: residueAdjunctionLine_coordinate_unit
example (residue : L →ₗ[A] K) (u : Aˣ) :
  residueAdjunctionLine ((u : A) • residue)=residueAdjunctionLine residue := by sorry
-- Test: residueAdjunctionLine_ramification_one
example (D : ℚ) : D/(1 : ℚ)=D := by sorry
-- Test: residueAdjunctionLine_unscaled_divisor
example (D : ℚ) (hD : D≠0) : D/2≠D := by sorry
end ResidueLine

/-! GrossZagierAndArithmeticHeights:GZ.6/colmez-torus-average — Finite CM orbit average
C is the genuine finite CM torus quotient, not the unit-index group.
The quotient construction is imported from HE/class field theory.
-/
def cmOrbitAverage {C : Type*} [Fintype C] (f : C → ℂ) : ℂ := by sorry
theorem cmOrbitAverage_constructor {C : Type*} [Fintype C] (f : C → ℂ) : cmOrbitAverage f=(Fintype.card C : ℂ)⁻¹*∑ x,f x := by sorry
theorem cmOrbitAverage_constant {C : Type*} [Fintype C] [Nonempty C] (c : ℂ) : cmOrbitAverage (fun _ : C ↦ c)=c := by sorry
theorem cmOrbitAverage_representative_independent {C D : Type*} [Fintype C] [Fintype D] (e : C ≃ D) (f : D → ℂ) : cmOrbitAverage (f ∘ e)=cmOrbitAverage f := by sorry
theorem cmOrbitAverage_trace {C : Type*} [Fintype C] (f : C → ℂ) : ∑ x,f x=(Fintype.card C : ℂ)*cmOrbitAverage f := by sorry
-- Test: cmOrbitAverage_constant_one
example {C : Type*} [Fintype C] [Nonempty C] : cmOrbitAverage (fun _ : C ↦ (1 : ℂ))=1 := by sorry
-- Test: cmOrbitAverage_singleton
example (c : ℂ) : cmOrbitAverage (fun _ : Fin 1 ↦ c)=c := by sorry
-- Test: cmOrbitAverage_unit_index_separate
example : cmOrbitAverage (fun _ : Fin 3 ↦ (1 : ℂ))=1 ∧ (∑ _ : Fin 3,(1 : ℂ))=3 := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.6/colmez-whittaker — Normalized local Whittaker terms
a is the embedded Fourier index. D and d denote absolute local norms of
the discriminant and different. The raw Fourier integral and local L-functions
are AL/MP inputs. Central-zero and almost-all-place Weil identities are
omitted from the hypotheses until the actual standard-vector carrier exists;
the corresponding signatures express precisely those normalization targets.
-/
def normalizedWhittaker (a : ℂ) (γ : ℂˣ) (Lnext Lcurrent : ℂ → ℂ)
    (disc different : ℝ) (raw : ℂ → ℂ) : ℂ → ℂ := by sorry
theorem normalizedWhittaker_constructor (a : ℂ) (γ : ℂˣ) (Lnext Lcurrent raw : ℂ → ℂ) (D d : ℝ) (s : ℂ) :
  normalizedWhittaker a γ Lnext Lcurrent D d raw s=
    (γ : ℂ)⁻¹*(if a=0 then Lnext s/Lcurrent s*(Real.sqrt D*Real.sqrt d : ℂ)⁻¹ else 1)*raw s := by sorry
/- Omitted normalizedWhittaker_zero_value: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
theorem normalizedWhittaker_nonzero_index (a : ℂ) (ha : a≠0) (γ : ℂˣ) (Lnext Lcurrent raw : ℂ → ℂ) (D d : ℝ) (s : ℂ) :
  normalizedWhittaker a γ Lnext Lcurrent D d raw s=(γ : ℂ)⁻¹*raw s := by sorry
theorem normalizedWhittaker_zero_index (γ : ℂˣ) (Lnext Lcurrent raw : ℂ → ℂ) (D d : ℝ) (s : ℂ) :
  normalizedWhittaker 0 γ Lnext Lcurrent D d raw s=
    (γ : ℂ)⁻¹*(Lnext s/Lcurrent s)*(Real.sqrt D*Real.sqrt d : ℂ)⁻¹*raw s := by sorry
-- Test: normalizedWhittaker_standard_zero
/- Omitted test:normalizedWhittaker_standard_zero: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
-- Test: normalizedWhittaker_zero_branch
example (z : ℂ) (hz : z≠0) : 2*z≠z := by sorry
-- Test: normalizedWhittaker_incoherent_product_sign
example : ((-1 : ℂ)⁻¹)= -1 := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.6/colmez-local-k-c — Local derivative and zero-term corrections
The two analytic local Whittaker families are the genuine separately
normalized nonzero and zero branches. factor=L(1,eta_v)/vol(E_v^1),
φ1 is the evaluated first tensor factor, and value is r(g)φ_v.
The nearby quaternion and fibrewise tensor integration carriers are omitted.
-/
def localDerivativeCorrection (factor : ℂ) (φ1 : ℂ) (nonzeroWhittaker zeroWhittaker : ℂ → ℂ)
    (logDelta value : ℂ) : ℂ × ℂ := by sorry
theorem localDerivativeCorrection_constructor (factor φ1 logDelta value : ℂ) (W W0 : ℂ → ℂ) :
  localDerivativeCorrection factor φ1 W W0 logDelta value=
    (factor*φ1*deriv W 0,deriv W0 0+logDelta*value) := by sorry
theorem localDerivativeCorrection_pure_tensor (factor φ1 logDelta value : ℂ) (W W0 : ℂ → ℂ) :
  (localDerivativeCorrection factor φ1 W W0 logDelta value).1=factor*φ1*deriv W 0 := by sorry
theorem localDerivativeCorrection_linear (a b : ℂ) (W W0 V V0 : ℂ → ℂ)
    (hW : DifferentiableAt ℂ W 0) (hW0 : DifferentiableAt ℂ W0 0)
    (hV : DifferentiableAt ℂ V 0) (hV0 : DifferentiableAt ℂ V0 0) :
  localDerivativeCorrection 1 1 (a • W+b • V) (a • W0+b • V0) 0 0=
    a • localDerivativeCorrection 1 1 W W0 0 0+b • localDerivativeCorrection 1 1 V V0 0 0 := by sorry
theorem localDerivativeCorrection_zero_correction (factor φ1 logDelta value : ℂ) (W W0 : ℂ → ℂ) :
  (localDerivativeCorrection factor φ1 W W0 logDelta value).2=deriv W0 0+logDelta*value := by sorry
-- Test: localDerivativeCorrection_zero_function
example (factor φ1 logDelta : ℂ) : localDerivativeCorrection factor φ1 0 0 logDelta 0=(0,0) := by sorry
-- Test: localDerivativeCorrection_arch_zero
example (W W0 : ℂ → ℂ) (logDelta value : ℂ) (hstd : deriv W0 0+logDelta*value=0) :
  (localDerivativeCorrection 1 1 W W0 logDelta value).2=0 := by sorry
-- Test: localDerivativeCorrection_different_index
example (x : ℂ) (hx : x≠0) : 2*x≠x := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-partial-rankin-series — Ideal-class Rankin series
a n and r n represent index n+1. The construction is Lremoved(2s-2k+1)
times their positive-index Dirichlet series. r is complex-valued to permit
finite character transforms; integral ideal counts are coerced into it.
Automorphic L-function identification and actual characters are omitted;
finite orthogonality and convergence are genuine algebraic hypotheses.
-/
def partialRankin (Lremoved : ℂ → ℂ) (a r : ℕ → ℂ) (k : ℕ) (s : ℂ) : ℂ := by sorry
theorem partialRankin_character_sum {C : Type*} [Fintype C] (χ : C → ℂ) (L : ℂ → ℂ) (a : ℕ → ℂ) (r : C → ℕ → ℂ)
    (k : ℕ) (s : ℂ) (hr : ∀ A,Summable (fun n ↦ a n*r A n*((n+1 : ℕ) : ℂ)^(-s))) :
  (∑ A,χ A*partialRankin L a (r A) k s)=
    partialRankin L a (fun n ↦ ∑ A,χ A*r A n) k s := by sorry
theorem partialRankin_fourier_inverse {C D : Type*} [Fintype C] [Fintype D] [DecidableEq C]
    (χ : D → C → ℂ) (LA : C → ℂ)
    (ho : ∀ A B,∑ d,(χ d A)⁻¹*χ d B=if A=B then (Fintype.card C : ℂ) else 0) (A : C) :
  LA A=(Fintype.card C : ℂ)⁻¹*∑ d,(χ d A)⁻¹*∑ B,χ d B*LA B := by sorry
theorem partialRankin_removed_factors (L : ℂ → ℂ) (ε : ℕ → ℂ) (primes : Finset ℕ) (a r : ℕ → ℂ) (k : ℕ) (s : ℂ) :
  partialRankin (fun t ↦ L t*∏ p∈primes,1-ε p*(p : ℂ)^(-t)) a r k s=
    (∏ p∈primes,1-ε p*(p : ℂ)^(-(2*s-2*k+1)))*partialRankin L a r k s := by sorry
-- Test: partialRankin_trivial_character
example {C : Type*} [Fintype C] (L : ℂ → ℂ) (a : ℕ → ℂ) (r : C → ℕ → ℂ) (k : ℕ) (s : ℂ)
    (hr : ∀ A,Summable (fun n ↦ a n*r A n*((n+1 : ℕ) : ℂ)^(-s))) :
  (∑ A,partialRankin L a (r A) k s)=partialRankin L a (fun n ↦ ∑ A,r A n) k s := by sorry
-- Test: partialRankin_bad_prime
example (p : ℕ) (ε s z : ℂ) (hz : z≠0) (hfactor : ε*(p : ℂ)^(1-2*s)≠0) :
  (1-ε*(p : ℂ)^(1-2*s))*z≠z := by sorry
-- Test: partialRankin_basis_indicator
example {C : Type*} [Fintype C] [DecidableEq C] (A B : C) :
  (∑ x : C,(if x=A then (1 : ℂ) else 0)*(if x=B then 1 else 0))=if A=B then 1 else 0 := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-theta — Pseudo-theta datum
U is the actual unit-square quotient, and term is φbad(g,x,u) times
the ambient Weil translate r_V(g)φgood. Nonsingular outer/inner theta use
r_V1 and r_V0 respectively. The displayed outer/inner sum identities
require the supplied restriction/extension identification to become those
theta comparison statements; it is omitted until MP.6 supplies its carrier.
-/
def pseudoTheta {G U X : Type*} (V0 V1 : Set X) (term : G → U → X → ℂ) (g : G) : ℂ := by sorry
theorem pseudoTheta_constructor {G U X : Type*} (V0 V1 : Set X) (term : G → U → X → ℂ) (g : G) :
  pseudoTheta V0 V1 term g=∑' u,∑' x : ↥(V1\V0),term g u x := by sorry
theorem pseudoTheta_outer {G U X : Type*} (V1 : Set X) (term : G → U → X → ℂ) (g : G) :
  pseudoTheta ∅ V1 term g=∑' u,∑' x : ↥V1,term g u x := by sorry
theorem pseudoTheta_inner {G U X : Type*} [Zero X] (V1 : Set X) (h0 : (0 : X)∈V1)
    (term : G → U → X → ℂ) (g : G)
    (hs : ∀ u, Summable (fun x : ↥V1 ↦ term g u x)) :
  ∀ u, (∑' x : ↥V1,term g u x)=(∑' x : ↥(V1\{0}),term g u x)+term g u 0 := by sorry
theorem pseudoTheta_unit_invariant {G U X : Type*} (V0 V1 : Set X) (term : G → U → X → ℂ)
    (transform : X → X) (hterm : ∀ g u x,term g u (transform x)=term g u x) (g : G) :
  pseudoTheta V0 V1 (fun g u x ↦ term g u (transform x)) g=pseudoTheta V0 V1 term g := by sorry
-- Test: pseudoTheta_empty_truncation
example {G U X : Type*} (V1 : Set X) (term : G → U → X → ℂ) (g : G) :
  pseudoTheta ∅ V1 term g=∑' u,∑' x : ↥V1,term g u x := by sorry
-- Test: pseudoTheta_full_space
example {G U X : Type*} (term : G → U → X → ℂ) (g : G) :
  pseudoTheta ∅ Set.univ term g=∑' u,∑' x,term g u x := by sorry
-- Test: pseudoTheta_wrong_ambient_weight
example : (2 : ℝ)^1≠(2 : ℝ)^0 := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.6/mixed-theta-eisenstein — Mixed theta–Eisenstein kernel
This signature displays the pure-tensor unit-quotient factorization.
The general Schwartz kernel is its linear extension, constructed with the
actual P1(F)\SL2(F) coset sum and incoherent Weil data. Those representation
and meromorphic-continuation conditions are omitted here.
-/
def mixedThetaEisenstein {G U : Type*} (theta : U → G → ℂ)
    (eisenstein : ℂ → U → G → ℂ) (s : ℂ) (g : G) : ℂ := by sorry
theorem mixedThetaEisenstein_constructor {G U : Type*} (θ : U → G → ℂ) (E : ℂ → U → G → ℂ) (s : ℂ) (g : G) :
  mixedThetaEisenstein θ E s g=∑' u,θ u g*E s u g := by sorry
theorem mixedThetaEisenstein_tensor_factorization {G U : Type*} (θ : U → G → ℂ) (E : ℂ → U → G → ℂ) (s : ℂ) (g : G) :
  mixedThetaEisenstein θ E s g=∑' u,θ u g*E s u g := by sorry
theorem mixedThetaEisenstein_linear {G U : Type*} (θ : U → G → ℂ) (E : ℂ → U → G → ℂ) (a s : ℂ) (g : G) :
  mixedThetaEisenstein (a • θ) E s g=a*mixedThetaEisenstein θ E s g := by sorry
theorem mixedThetaEisenstein_central_zero {G U : Type*} (θ : U → G → ℂ) (E : ℂ → U → G → ℂ)
    (hinc : ∀ u g,E 0 u g=0) (g : G) : mixedThetaEisenstein θ E 0 g=0 := by sorry
-- Test: mixedThetaEisenstein_zero_schwartz
example {G U : Type*} (E : ℂ → U → G → ℂ) (s : ℂ) (g : G) :
  mixedThetaEisenstein (0 : U → G → ℂ) E s g=0 := by sorry
-- Test: mixedThetaEisenstein_tensor_components
example (θ : Fin 1 → Fin 1 → ℂ) (E : ℂ → Fin 1 → Fin 1 → ℂ) (s : ℂ) :
  mixedThetaEisenstein θ E s 0=θ 0 0*E s 0 0 := by sorry
-- Test: mixedThetaEisenstein_incoherent_central_value
example : (fun s : ℂ ↦ s) 0=0 ∧ deriv (fun s : ℂ ↦ s) 0=1 := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.6/special-correspondence-cycle — Special correspondence cycle
C and D are the actual imported cycle groups, and push is proper pushforward
with residue-degree multiplicities. Generic reduced image is not that map.
The actual Hecke push-pull and double-coset convolution maps are omitted;
these signatures expose their additive cycle consequences.
-/
def specialCorrespondenceCycle {C D : Type*} [AddCommGroup C] [AddCommGroup D]
    (push : C →+ D) (fundamental : C) : D := by sorry
theorem specialCorrespondenceCycle_action {C D : Type*} [AddCommGroup C] [AddCommGroup D] (push : C →+ D)
    (fundamental : C) (action : D →+ D) :
  action (specialCorrespondenceCycle push fundamental)=action (push fundamental) := by sorry
theorem specialCorrespondenceCycle_level {C D : Type*} [AddCommGroup C] [AddCommGroup D]
    (p q : C →+ D) (hp : p=q) (fundamental : C) :
  specialCorrespondenceCycle p fundamental=specialCorrespondenceCycle q fundamental := by sorry
theorem specialCorrespondenceCycle_convolution {C D : Type*} [AddCommGroup C] [AddCommGroup D] (p q : C →+ D) (fundamental : C) :
  specialCorrespondenceCycle (p+q) fundamental=
  specialCorrespondenceCycle p fundamental+specialCorrespondenceCycle q fundamental := by sorry
-- Test: specialCorrespondenceCycle_identity
example {C : Type*} [AddCommGroup C] (diagonal : C) :
  specialCorrespondenceCycle (AddMonoidHom.id C) diagonal=diagonal := by sorry
-- Test: specialCorrespondenceCycle_degree_two
example {C D : Type*} [AddCommGroup C] [AddCommGroup D] (push : C →+ D) (fundamental : C) :
  specialCorrespondenceCycle push (2 • fundamental)=2 • specialCorrespondenceCycle push fundamental := by sorry
-- Test: specialCorrespondenceCycle_zero_action
example {C D : Type*} [AddCommGroup C] [AddCommGroup D] (push : C →+ D) :
  specialCorrespondenceCycle push 0=0 := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.6/cm-degree-zero-class — ξ-normalized CM divisor
D denotes the imported rational divisor class space; degree has one
coordinate per geometric component. Abel-Jacobi/Pic0 and CM reciprocity
identifications are omitted until their actual carriers are supplied.
-/
def cmDegreeZeroClass {D : Type*} [AddCommGroup D] (point hodge : D) : D := by sorry
theorem cmDegreeZeroClass_degree {D C : Type*} [AddCommGroup D] [AddCommGroup C] (degree : D →+ C)
    (point hodge : D) (h : degree point=degree hodge) : degree (cmDegreeZeroClass point hodge)=0 := by sorry
theorem cmDegreeZeroClass_galois {D : Type*} [AddCommGroup D] (σ : D →+ D) (point hodge : D) :
  σ (cmDegreeZeroClass point hodge)=cmDegreeZeroClass (σ point) (σ hodge) := by sorry
theorem cmDegreeZeroClass_character {D : Type*} [AddCommGroup D] [Module ℂ D] {G : Type*} [Fintype G]
    (χ : G → ℂ) (point hodge : G → D) :
  ∑ σ,χ σ • cmDegreeZeroClass (point σ) (hodge σ)=
    (∑ σ,χ σ • point σ)-(∑ σ,χ σ • hodge σ) := by sorry
-- Test: cmDegreeZeroClass_degree_zero
example {D C : Type*} [AddCommGroup D] [AddCommGroup C] (degree : D →+ C)
    (point hodge : D) (h : degree point=degree hodge) : degree (cmDegreeZeroClass point hodge)=0 := by sorry
-- Test: cmDegreeZeroClass_wrong_component
example : cmDegreeZeroClass ((1 : ℤ),(0 : ℤ)) (0,1)=(1,-1) ∧ cmDegreeZeroClass ((1 : ℤ),(0 : ℤ)) (0,1)≠0 := by sorry
-- Test: cmDegreeZeroClass_hodge_average
example {D : Type*} [AddCommGroup D] (hodge : D) : cmDegreeZeroClass hodge hodge=0 := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.6/picard-generating-series — Picard-valued generating series
C is a finite Picard coefficient realization of the actual proper cycles.
I flattens the a and double-coset indices; weights contain the source Weil
coefficient and stabilizer w_U. The Hodge constant and curve/Picard
modularity hypotheses are omitted, not asserted for arbitrary weights.
The rescaled level map is the displayed continuous linear pushforward.
-/
def picardGeneratingSeries {G I C : Type*} [NormedAddCommGroup C] [NormedSpace ℂ C]
    (constant : G → C) (weights : I → G → ℂ) (cycles : I → C) (g : G) : C := by sorry
theorem picardGeneratingSeries_coefficient {G I C : Type*} [NormedAddCommGroup C] [NormedSpace ℂ C]
    (constant : G → C) (weights : I → G → ℂ) (cycles : I → C) (g : G) :
  picardGeneratingSeries constant weights cycles g=constant g+∑' i,weights i g • cycles i := by sorry
theorem picardGeneratingSeries_level {G I C : Type*} [NormedAddCommGroup C] [NormedSpace ℂ C]
    (constant : G → C) (weights : I → G → ℂ) (cycles : I → C)
    (push : C →L[ℂ] C) (g : G) (hs : Summable (fun i ↦ weights i g • cycles i)) :
  push (picardGeneratingSeries constant weights cycles g)=
    picardGeneratingSeries (push ∘ constant) weights (push ∘ cycles) g := by sorry
theorem picardGeneratingSeries_modular {G I C : Type*} [NormedAddCommGroup C] [NormedSpace ℂ C]
    (constant : G → C) (weights : I → G → ℂ) (cycles : I → C)
    (translate : G → G) (j : G → ℂ) (h0 : ∀ g,constant (translate g)=j g • constant g)
    (hw : ∀ i g,weights i (translate g)=j g*weights i g) (g : G) :
  picardGeneratingSeries constant weights cycles (translate g)=j g • picardGeneratingSeries constant weights cycles g := by sorry
-- Test: picardGeneratingSeries_zero
example {G I C : Type*} [NormedAddCommGroup C] [NormedSpace ℂ C] (cycles : I → C) (g : G) :
  picardGeneratingSeries (0 : G → C) (0 : I → G → ℂ) cycles g=0 := by sorry
-- Test: picardGeneratingSeries_diagonal
example {G C : Type*} [NormedAddCommGroup C] [NormedSpace ℂ C] (constant : G → C)
    (weights : Fin 1 → G → ℂ) (diagonal : C) (g : G) :
  picardGeneratingSeries constant weights (fun _ : Fin 1 ↦ diagonal) g=constant g+weights 0 g • diagonal := by sorry
-- Test: picardGeneratingSeries_rational_factor
example (z : ℂ) : (1/2 : ℂ)*z*4=2*z := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.6/arithmetic-height-kernel — Arithmetic height kernel
This is the correspondence-height integrand, with the toric regularized
cycle action already applied. The actual truncation/constant subtraction,
Picard action and Faltings-Hriljac identification are omitted; they remain
mandatory inputs in the packet. No integral is assigned a value by a
proposition or a formal symbol.
-/
def arithmeticHeightKernel {V : Type*} [AddCommGroup V] [Module ℂ V]
    (height : V →ₗ[ℂ] V →ₗ[ℂ] ℂ) (cycleAction : V →ₗ[ℂ] V) (x y : V) : ℂ := by sorry
theorem arithmeticHeightKernel_bilinear {V : Type*} [AddCommGroup V] [Module ℂ V] (h : V →ₗ[ℂ] V →ₗ[ℂ] ℂ)
    (Z : V →ₗ[ℂ] V) (a b : ℂ) (x x' y : V) :
  arithmeticHeightKernel h Z (a • x+b • x') y=
    a*arithmeticHeightKernel h Z x y+b*arithmeticHeightKernel h Z x' y := by sorry
theorem arithmeticHeightKernel_level {V : Type*} [AddCommGroup V] [Module ℂ V] (h : V →ₗ[ℂ] V →ₗ[ℂ] ℂ)
    (Z Z' : V →ₗ[ℂ] V) (hZ : Z=Z') (x y : V) :
  arithmeticHeightKernel h Z x y=arithmeticHeightKernel h Z' x y := by sorry
theorem arithmeticHeightKernel_local {V : Type*} [AddCommGroup V] [Module ℂ V] (h : V →ₗ[ℂ] V →ₗ[ℂ] ℂ)
    (Z : V →ₗ[ℂ] V) (x y : V) : arithmeticHeightKernel h Z x y=h (Z x) y := by sorry
-- Test: arithmeticHeightKernel_zero
example {V : Type*} [AddCommGroup V] [Module ℂ V] (h : V →ₗ[ℂ] V →ₗ[ℂ] ℂ) (Z : V →ₗ[ℂ] V) (y : V) :
  arithmeticHeightKernel h Z 0 y=0 := by sorry
-- Test: arithmeticHeightKernel_average
example {V : Type*} [AddCommGroup V] [Module ℂ V] (h : V →ₗ[ℂ] V →ₗ[ℂ] ℂ) (Z : V →ₗ[ℂ] V) (n : ℕ) (x y : V) :
  arithmeticHeightKernel h Z ((n : ℂ)⁻¹ • x) ((n : ℂ)⁻¹ • y)=
    (n : ℂ)^(-2 : ℤ)*arithmeticHeightKernel h Z x y := by sorry
-- Test: arithmeticHeightKernel_cycle_multiplicity
example {V : Type*} [AddCommGroup V] [Module ℂ V] (h : V →ₗ[ℂ] V →ₗ[ℂ] ℂ) (Z : V →ₗ[ℂ] V) (x y : V) :
  arithmeticHeightKernel h (2 • Z) x y=2*arithmeticHeightKernel h Z x y := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.7/degenerate-schwartz-classes — Degenerate Schwartz classes
S is the actual MP extended Schwartz space, eval is evaluation, a and b
are valuations of uq(x) and uq(x2), and weil is the imported extended action.
Their local-field/quaternionic identifications are omitted. The final test
is a Schwartz function zero at the origin with a nonzero Fourier value
at zero, so identity-only vanishing cannot replace the orbit condition.
-/
section DegenerateSchwartz
variable {S X U G : Type*} [AddCommGroup S] [Module ℂ S]
def degenerateSchwartzOne (eval : X → U → S →ₗ[ℂ] ℂ)
    (a b : X → U → WithTop ℤ) (different : ℤ) : Submodule ℂ S := by sorry
def degenerateSchwartzTwo (evalZero : U → S →ₗ[ℂ] ℂ)
    (weil : G → S →ₗ[ℂ] S) : Submodule ℂ S := by sorry
def degenerateSchwartz (eval : X → U → S →ₗ[ℂ] ℂ)
    (a b : X → U → WithTop ℤ) (different : ℤ)
    (evalZero : U → S →ₗ[ℂ] ℂ) (weil : G → S →ₗ[ℂ] S) :
    Submodule ℂ S × Submodule ℂ S := by sorry
theorem degenerateSchwartzOne_support (eval : X → U → S →ₗ[ℂ] ℂ)
    (a b : X → U → WithTop ℤ) (d : ℤ) (φ : degenerateSchwartzOne eval a b d)
    (x : X) (u : U) (h : a x u≥(-d : ℤ) ∨ b x u≥(-d : ℤ)) :
  eval x u φ=0 := by sorry
theorem degenerateSchwartzTwo_translate (evalZero : U → S →ₗ[ℂ] ℂ)
    (weil : G → S →ₗ[ℂ] S) (φ : degenerateSchwartzTwo evalZero weil) (g : G) (u : U) :
  evalZero u (weil g φ)=0 := by sorry
-- Test: degenerateSchwartz_zero
example (eval : X → U → S →ₗ[ℂ] ℂ) (a b : X → U → WithTop ℤ) (d : ℤ)
    (ev0 : U → S →ₗ[ℂ] ℂ) (weil : G → S →ₗ[ℂ] S) :
  (0 : S)∈degenerateSchwartzOne eval a b d ∧ (0 : S)∈degenerateSchwartzTwo ev0 weil := by sorry
-- Test: degenerateSchwartzOne_boundary
example (eval : X → U → S →ₗ[ℂ] ℂ) (a b : X → U → WithTop ℤ) (d : ℤ)
    (φ : degenerateSchwartzOne eval a b d) (x : X) (u : U) (hb : b x u=(-d : ℤ)) :
  eval x u φ=0 := by sorry
-- Test: degenerateSchwartzTwo_identity_only
example : (fun x : ℝ ↦ x^2*Real.exp (-Real.pi*x^2)) 0=0 ∧
    (∫ x : ℝ, x^2*Real.exp (-Real.pi*x^2))>0 := by sorry
end DegenerateSchwartz

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function — Special test function and integral j
This gives the five genuine local factors of the restricted tensor product.
The order ring, local action, Gaussian and rescaled norm shell are supplier
inputs. Their invariance and auxiliary Weil-orbit identity are omitted
from the two corresponding signatures until the MP order/action carrier is
available; no implication from O_E-units containment to order containment
is used. Nonprimitive vectors fail the integral generator test.
-/
def colmezTestFunction {X U : Type*} (order units shell : Set X) (unitU : Set U)
    (q : ℕ) (caseIndex : Fin 5) (gaussian : X → U → ℂ) : X → U → ℂ := by sorry
theorem colmezTestFunction_constructor {X U : Type*} (O Ounits shell : Set X) (Ou : Set U) (q : ℕ)
    (i : Fin 5) (gaussian : X → U → ℂ) (x : X) (u : U) :
  colmezTestFunction O Ounits shell Ou q i gaussian x u=
    if i=0 then gaussian x u else if u∈Ou then
      if i=2 then Set.indicator Ounits (fun _ ↦ (1 : ℂ)) x else
      if i=3 then Set.indicator Ounits (fun _ ↦ (1 : ℂ)) x-
        (1+q+(q : ℂ)^2)⁻¹*Set.indicator shell (fun _ ↦ (1 : ℂ)) x else
      Set.indicator O (fun _ ↦ (1 : ℂ)) x else 0 := by sorry
/- Omitted colmezTestFunction_biinvariant: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
/- Omitted colmezTestFunction_auxiliary_degenerate: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
theorem colmezTestFunction_order_containment {X : Type*} (OE O : Set X) (h : OE⊆O) (x : X) (hx : x∈OE) : x∈O := by sorry
-- Test: colmezTestFunction_auxiliary_q_two
example  : -(1+2+(2 : ℂ)^2)⁻¹= -1/7 := by sorry
-- Test: colmezTestFunction_division_units
example {X U : Type*} (O Ounits shell : Set X) (Ou : Set U) (q : ℕ)
    (gaussian : X → U → ℂ) (x : X) (u : U) (hx : x∉Ounits) :
  colmezTestFunction O Ounits shell Ou q 2 gaussian x u=0 := by sorry
-- Test: colmezTestFunction_primitive_generator
example : ¬Function.Surjective (fun n : ℤ ↦ 2*n) := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-norm-shells — Norm congruence shells and ramified correction
q is uq on the original quadratic line, and val is the local valuation.
The self-dual measure and the opposite norm-class cutoff come from RP/MP.
The third API expression is the finite ramified correction template; the
actual off-O_E indicator and the fibre-integral carrier remain omitted.
-/
/-- Finite shell sum in alpha; its off-O_E indicator is a separate factor. -/
private def ramifiedShellCorrection (N d : ℕ) (shellIntegral : ℕ → ℂ) (disc : ℝ) : ℂ := by sorry
def normShell {X F : Type*} [AddGroup F] (quadratic : X → F)
    (val : F → WithTop ℤ) (a : F) (n different : ℤ) : Set X := by sorry
theorem normShell_constructor {X F : Type*} [AddGroup F] (q : X → F) (v : F → WithTop ℤ)
    (a : F) (n d : ℤ) (x : X) : x∈normShell q v a n d ↔ v (q x-a)≥(n-d : ℤ) := by sorry
theorem normShell_measure {X F : Type*} [AddGroup F] [MeasurableSpace X] (q : X → F) (v : F → WithTop ℤ)
    (a : F) (n d : ℤ) (μ : MeasureTheory.Measure X) :
  μ (normShell q v a n d)=μ {x | v (q x-a)≥(n-d : ℤ)} := by sorry
theorem normShell_ramified_correction (N : ℕ) (d : ℕ) (shellIntegral : ℕ → ℂ) (disc : ℝ) :
  ramifiedShellCorrection N d shellIntegral disc=
    (Real.log N/Real.sqrt disc : ℂ)*(∑ n∈Finset.range d,(N : ℂ)^n*shellIntegral n) := by sorry
theorem normShell_inert_cutoff {X F : Type*} [AddGroup F] (q : X → F) (v : F → WithTop ℤ) (a : F)
    (d m : ℤ) (hcut : ∀ x,v (q x-a)≤(m : ℤ)) (n : ℤ) (hn : n-d>m) :
  normShell q v a n d=∅ := by sorry
-- Test: normShell_inert_last_shell
example {X F : Type*} [AddGroup F] (q : X → F) (v : F → WithTop ℤ) (a : F)
    (hcut : ∀ x,v (q x-a)≤(0 : ℤ)) (n : ℤ) (hn : 0<n) : normShell q v a n 0=∅ := by sorry
-- Test: normShell_unramified_different
example (N : ℕ) (shellIntegral : ℕ → ℂ) : (∑ n∈Finset.range 0,(N : ℂ)^n*shellIntegral n)=0 := by sorry
-- Test: normShell_different_vs_discriminant
example (shellIntegral : ℕ → ℂ) (h : shellIntegral 0≠0) :
  (∑ n∈Finset.range 1,shellIntegral n)≠(∑ n∈Finset.range 0,shellIntegral n) := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-omega-self — Diagonal coefficient and modified self-intersection
omega is the genuine E-nonzero Weil sum; e is the independent unit index.
The scalar extraction uses the actual diagonal coefficient Omega/e.
Arithmetic self-intersection and its extended local diagonal inputs are
separate; the latter do not define the former.
-/
def modifiedSelfIntersection {V : Type*} [Fintype V]
    (omega : ℂ) (globalSelf : ℝ) (extendedLocal : V → ℝ) (q : V → ℕ) : ℂ × ℝ := by sorry
theorem modifiedSelfIntersection_constructor {V : Type*} [Fintype V] (Ω : ℂ) (i : ℝ) (iv : V → ℝ) (q : V → ℕ) :
  modifiedSelfIntersection Ω i iv q=(Ω,i-∑ v,iv v*Real.log (q v)) := by sorry
theorem modifiedSelfIntersection_coefficient {V : Type*} [Fintype V] (Ω : ℂ) (i : ℝ) (iv : V → ℝ) (q : V → ℕ) (e : ℕ) :
  (modifiedSelfIntersection Ω i iv q).1/(e : ℂ)=Ω/(e : ℂ) := by sorry
theorem modifiedSelfIntersection_proper_subtraction {P : Type*} [AddCommGroup P] [Module ℂ P] (Z t : P) (Ω : ℂ) (e : ℕ) :
  (Z-(Ω/(e : ℂ)) • t)+(Ω/(e : ℂ)) • t=Z := by sorry
theorem modifiedSelfIntersection_average {C : Type*} [Fintype C] [Nonempty C] (iv : C → ℂ) :
  cmOrbitAverage iv=(Fintype.card C : ℂ)⁻¹*∑ t,iv t := by sorry
-- Test: modifiedSelfIntersection_split_extended_zero
example (Ω : ℂ) (i : ℝ) (q : Fin 1 → ℕ) :
  (modifiedSelfIntersection Ω i (fun _ : Fin 1 ↦ 0) q).2=i := by sorry
-- Test: modifiedSelfIntersection_elliptic_index_two
example (Ω : ℂ) : Ω/(2 : ℂ)= (1/2 : ℂ)*Ω := by sorry
-- Test: modifiedSelfIntersection_self_not_extension
example (q : Fin 1 → ℕ) : (modifiedSelfIntersection 0 1 (fun _ : Fin 1 ↦ 0) q).2=1 := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-rev-archimedean-derivative-kernel — Archimedean derivative kernel
The integral is in the convergent lambda<0 range and is meromorphically
continued with the actual source family. The torus-average signature
omits the actual holomorphic projection operation and its nearby-quaternion
coefficient identification; the packet specifies it without a free guard.
-/
def archDerivativeKernel (lambda : ℝ) (s : ℂ) : ℂ := by sorry
theorem archDerivativeKernel_constructor (lambda : ℝ) (s : ℂ) : archDerivativeKernel lambda s=
  Complex.Gamma (s+1)/(2*(4*Real.pi : ℂ)^s)*
    ∫ t in Set.Ici (1 : ℝ), ((t : ℂ)*(1-(lambda*t : ℂ))^(s+1))⁻¹ := by sorry
theorem archDerivativeKernel_lambda_domain (y1Norm y2Norm : ℝ) (hy1 : 0<y1Norm) (hy2 : y2Norm<0)
    (hy : 0<y1Norm+y2Norm) : y2Norm/(y1Norm+y2Norm)<0 := by sorry
/- Omitted archDerivativeKernel_torus_average: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
theorem archDerivativeKernel_zero_parameter (lambda : ℝ) (hlambda : lambda<0) : archDerivativeKernel lambda 0=(1/2 : ℂ)*Real.log ((1-lambda)/(-lambda)) := by sorry
-- Test: archDerivativeKernel_lambda_minus_one
example  : archDerivativeKernel (-1) 0=(Real.log 2/2 : ℂ) := by sorry
-- Test: archDerivativeKernel_diagonal_limit
example : Filter.Tendsto (fun lambda : ℝ ↦ Real.log ((1-lambda)/(-lambda))/2) (𝓝[<] 0) Filter.atTop := by sorry
-- Test: archDerivativeKernel_normalization_half
example (lambda : ℝ) (hlambda : lambda<0) : 2*archDerivativeKernel lambda 0=(Real.log ((1-lambda)/(-lambda)) : ℂ) := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-arch-green — Regularized archimedean multiplicity
germ is the actual meromorphic nearby-quaternion Green sum with the E-star
terms omitted. Its construction, holomorphic remainder and distinct-point
ordinary-height identification cannot yet be typed; they are omitted from
this finite-part signature. The analytic Q0 test and pole limit retain the
normalization and exclusion required by the packet.
-/
def regularizedCmGreen (germ : LaurentSeries ℂ) : ℂ := by sorry
theorem regularizedCmGreen_constructor (germ : LaurentSeries ℂ) : regularizedCmGreen germ=germ.coeff 0 := by sorry
/- Omitted regularizedCmGreen_distinct_points: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
theorem regularizedCmGreen_diagonal_exclusion {I : Type*} (E : Set I) (terms : I → LaurentSeries ℂ) (finite : Finset I) :
  regularizedCmGreen (∑ i∈finite.filter (fun i ↦ i∉E),terms i)=
    ∑ i∈finite.filter (fun i ↦ i∉E),regularizedCmGreen (terms i) := by sorry
theorem regularizedCmGreen_constant_term (a b : ℂ) : regularizedCmGreen (HahnSeries.single (-1 : ℤ) a+HahnSeries.single 0 b)=b := by sorry
-- Test: regularizedCmGreen_Q_zero
example (t : ℝ) (ht : 1<t) : (∫ u in Set.Ici (0 : ℝ),(t+Real.sqrt (t^2-1)*Real.cosh u)⁻¹)=Real.log ((t+1)/(t-1))/2 := by sorry
-- Test: regularizedCmGreen_ordinary_domain
example : Filter.Tendsto (fun t : ℝ ↦ Real.log ((t+1)/(t-1))/2) (𝓝[>] 1) Filter.atTop := by sorry
-- Test: regularizedCmGreen_pole_subtraction
example (a b : ℂ) : regularizedCmGreen (HahnSeries.single (-1 : ℤ) a+HahnSeries.single 0 b)=b := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-finite-multiplicity — Finite local multiplicities and diagonal omission
nearby is the actual two-orbit geometric multiplicity evaluated on its
quotient carrier; upper and lower are the two distinct split prime
multiplicities. The actual nonsplit quotient, m_phi/n_phi sums and diagonal
exclusion are omitted, while the inversion and half-sum formulas remain
explicit. The r=1 test checks the denominator in the upper formula.
-/
def cmLocalMultiplicity {X : Type*} (nonsplit : Bool)
    (nearby upper lower : X → ℝ) (x : X) : ℝ := by sorry
theorem cmLocalMultiplicity_constructor {X : Type*} (ns : Bool) (nearby upper lower : X → ℝ) (x : X) :
  cmLocalMultiplicity ns nearby upper lower x=if ns then nearby x else (upper x+lower x)/2 := by sorry
theorem cmLocalMultiplicity_diagonal_omission {X : Type*} (ordinary excluded : Set X) (x : X) :
  x∈ordinary\excluded ↔ x∈ordinary ∧ x∉excluded := by sorry
theorem cmLocalMultiplicity_inverse_symmetry {X : Type*} (inv : X → X) (nearby upper lower : X → ℝ) (ns : Bool)
    (hm : ∀ x,nearby (inv x)=nearby x) (h1 : ∀ x,upper (inv x)=upper x)
    (h2 : ∀ x,lower (inv x)=lower x) (x : X) :
  cmLocalMultiplicity ns nearby upper lower (inv x)=cmLocalMultiplicity ns nearby upper lower x := by sorry
theorem cmLocalMultiplicity_ordinary_average {X : Type*} (nearby upper lower : X → ℝ) (x : X) :
  cmLocalMultiplicity false nearby upper lower x=(upper x+lower x)/2 := by sorry
-- Test: cmLocalMultiplicity_ordinary_r_one
example (q : ℕ) (hq : 1<q) : (q : ℝ)^(1-0-1)*((q : ℝ)-1)=(q : ℝ)-1 := by sorry
-- Test: cmLocalMultiplicity_split_diagonal
example {X : Type*} (nearby upper lower : X → ℝ) (x : X) (hu : upper x=0) (hl : lower x=0) :
  cmLocalMultiplicity false nearby upper lower x=0 := by sorry
-- Test: cmLocalMultiplicity_wrong_half_sum
example : cmLocalMultiplicity false (fun _ : Fin 1 ↦ 0) (fun _ ↦ 2) (fun _ ↦ 0) 0=1 := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-resolvent-kernel — Classical resolvent kernel
The actual definition is -2 times the group sum of Q_(s-1) at the
displayed hyperbolic argument. Γ is the PSL2 congruence image; left and
right are genuine group actions. Δ is the hyperbolic Laplacian. These
identifications, off-orbit domain, Im(z),Im(w)>0 and Re(s)>1 are omitted
until the analytic suppliers type them. Local uniform convergence and
complex-s holomorphy strengthen the Summable signature in the packet.
-/
def classicalResolvent {Γ : Type*} (Q : ℝ → ℝ → ℝ) (action : Γ → ℂ → ℂ)
    (s : ℝ) (z w : ℂ) : ℝ := by sorry
/- Omitted classicalResolvent_invariant: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
/- Omitted classicalResolvent_laplacian: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
/- Omitted classicalResolvent_converges: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
-- Test: classicalResolvent_orbit_diagonal
example {Γ : Type*} (action : Γ → ℂ → ℂ) (γ : Γ) (z w : ℂ)
    (h : z=action γ w) : 1+‖z-action γ w‖^2/(2*z.im*(action γ w).im)=1 := by sorry
-- Test: classicalResolvent_sl2_double_count
example {Γ : Type*} (Q : ℝ → ℝ → ℝ) (action : Γ → ℂ → ℂ) (s : ℝ) (z w : ℂ)
    (h : Summable (fun γ ↦ Q (s-1) (1+‖z-action γ w‖^2/(2*z.im*(action γ w).im)))) :
  classicalResolvent Q (fun γ : Fin 2×Γ ↦ action γ.2) s z w=2*classicalResolvent Q action s z w := by sorry
-- Test: classicalResolvent_residue_sign
example  : (-12 : ℝ)/3= -4 := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-marked-green-kernel — Marked modular Green kernel
G,E0,Einfty are the actual Laurent germs at s=1. The definition is
(G+4*pi*E0+4*pi*Einfty+single(-1,kappa)).coeff 0+2*kappa-lambda.
E0 is evaluated at w_N z, Einfty at zprime. N>1, cusp expansions,
off-marked-point domain, squared-log singularity and actual hyperbolic
Laplacian are omitted until TB/MF supply the analytic curve carrier.
The plain-finite-part example records its nonzero Laplacian kappa;
it cannot yet apply that operator to the actual uncorrected kernel.
-/
def markedModularGreen (G E0 Einfty : LaurentSeries ℂ) (kappa lambda : ℂ) : ℂ := by sorry
/- Omitted markedModularGreen_cusp_zero: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
/- Omitted markedModularGreen_singularities: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
/- Omitted markedModularGreen_fricke: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
-- Test: markedModularGreen_four_residues
example (κ : ℂ) : κ-κ-κ+κ=0 := by sorry
-- Test: markedModularGreen_plain_finite_part
example (κ : ℂ) (hκ : κ≠0) : κ≠0 ∧ κ-κ-κ+κ=0 := by sorry
-- Test: markedModularGreen_level_one
example {X : Type*} (zero infinity : X) (hlevelone : zero=infinity) : ¬zero≠infinity := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-hecke-green-kernel — Hecke Green kernel
The definition is the sum_i G(z,reps_i(w)). reps are the actual finite
Hecke-correspondence representatives; d=σ1(m). hecke is the geometric
operator formed from those reps, and fricke the Atkin-Lehner action.
Those identities, m prime to N and the underlying modular-curve carrier
are omitted. The repeated ± representatives require the factor one-half.
-/
def heckeGreen {X : Type*} {d : ℕ} (G : X → X → ℝ) (reps : Fin d → X → X)
    (z w : X) : ℝ := by sorry
theorem heckeGreen_one {X : Type*} (G : X → X → ℝ) (z w : X) :
  heckeGreen G (fun _ : Fin 1 ↦ id) z w=G z w := by sorry
/- Omitted heckeGreen_hecke: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
/- Omitted heckeGreen_fricke: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
-- Test: heckeGreen_m_one
example {X : Type*} (G : X → X → ℝ) (z w : X) :
  heckeGreen G (fun _ : Fin 1 ↦ id) z w=G z w := by sorry
-- Test: heckeGreen_sign_quotient
example {X : Type*} {d : ℕ} (G : X → X → ℝ) (reps : Fin d → X → X) (z w : X) :
  (1/2 : ℝ)*(∑ ij : Fin 2×Fin d,G z (reps ij.2 w))=heckeGreen G reps z w := by sorry
-- Test: heckeGreen_cusp_degree
example (ℓ : ℕ) (κ : ℝ) :
  heckeGreen (fun _ _ : Unit ↦ κ) (fun _ : Fin (ℓ+1) ↦ id) () ()=(ℓ+1)*κ := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-cm-kernel-invariants — CM kernel invariants
The defining sum has both class constraints a/b=A and ab/n=B. C is
the actual ideal class group. The ideal-change bijection is a genuine
class-pair reindexing input; its modular Fricke construction is omitted.
Off-diagonal domain and prime-discriminant trivial genus identification
are omitted, while the empty-square-class test retains the real constraint.
-/
def cmKernelInvariant {C : Type*} [CommGroup C] [Fintype C] [DecidableEq C]
    (kernel : C → C → ℝ) (A B n : C) : ℝ := by sorry
theorem cmKernelInvariant_sum_genus {C : Type*} [CommGroup C] [Fintype C] [DecidableEq C] (kernel : C → C → ℝ) (A n : C) :
  (∑ B,cmKernelInvariant kernel A B n)=
    ∑ a,∑ b,if a*b⁻¹=A then kernel a b else 0 := by sorry
theorem cmKernelInvariant_ideal_independent {C : Type*} [CommGroup C] [Fintype C] [DecidableEq C] (kernel kernel' : C → C → ℝ)
    (A B n n' : C) (e : C×C ≃ C×C)
    (he : ∀ a b, (a*b⁻¹=A ∧ a*b*n⁻¹=B) ↔
      ((e (a,b)).1*(e (a,b)).2⁻¹=A ∧ (e (a,b)).1*(e (a,b)).2*n'⁻¹=B))
    (hk : ∀ a b,kernel a b=kernel' (e (a,b)).1 (e (a,b)).2) :
  cmKernelInvariant kernel A B n=cmKernelInvariant kernel' A B n' := by sorry
theorem cmKernelInvariant_empty {C : Type*} [CommGroup C] [Fintype C] [DecidableEq C] (kernel : C → C → ℝ) (A B n : C)
    (hgenus : ¬∃ c : C,c^2=B*n*A⁻¹) : cmKernelInvariant kernel A B n=0 := by sorry
-- Test: cmKernelInvariant_prime_D
example (c : ℝ) : cmKernelInvariant (fun _ _ : Unit ↦ c) 1 1 1=c := by sorry
-- Test: cmKernelInvariant_wrong_genus
example {C : Type*} [CommGroup C] [Fintype C] [DecidableEq C] (kernel : C → C → ℝ) (A B n : C)
    (hgenus : ¬∃ c : C,c^2=B*n*A⁻¹) : cmKernelInvariant kernel A B n=0 := by sorry
-- Test: cmKernelInvariant_diagonal
example (r : ℕ) (diagonal : Finset ℕ) (hcount : diagonal.card=r) (hr : 0<r) : diagonal.Nonempty := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-half-hom-count — Half Hom count
H is the actual degree-m Hom fibre of chosen integral cyclic-isogeny
diagrams at W/pi^n. The free sign quotient and degree-one isomorphism
identification are imported geometric inputs; arbitrary coarse diagrams
are not assigned a Hom functor here.
-/
def halfHomCount (H : Type*) [Fintype H] : ℚ := by sorry
theorem halfHomCount_sign_orbits {H O : Type*} [Fintype H] [Fintype O] (cover : H → O)
    (hfree : Fintype.card H=2*Fintype.card O) : halfHomCount H=Fintype.card O := by sorry
theorem halfHomCount_degree_one {H I : Type*} [Fintype H] [Fintype I] (e : H ≃ I) : halfHomCount H=halfHomCount I := by sorry
theorem halfHomCount_reduction {H H' : Type*} [Fintype H] [Fintype H'] (reduction : H' → H)
    (hinj : Function.Injective reduction) : halfHomCount H'≤halfHomCount H := by sorry
-- Test: halfHomCount_empty
example  : halfHomCount (Fin 0)=0 := by sorry
-- Test: halfHomCount_two_isomorphisms
example  : halfHomCount (Fin 2)=1 := by sorry
-- Test: halfHomCount_stabilizer
example  : halfHomCount (Fin 6)=3 ∧ halfHomCount (Fin 6)≠1 := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-set — New CM homomorphisms
full is the actual Artinian Hom fibre; liftable is the injective image
from W. The quaternion negativePart identification holds at nonsplit CM
places. Canonical ordinary lifting gives liftable=full. Those geometric
identifications are explicit inputs, not consequences of set vocabulary.
-/
def newCMHom {H : Type*} (full liftable : Set H) : Set H := by sorry
theorem newCMHom_partition {H : Type*} (full liftable : Set H) (hl : liftable⊆full) :
  Disjoint liftable (newCMHom full liftable) ∧ full=liftable∪newCMHom full liftable := by sorry
theorem newCMHom_quaternion {H K : Type*} [Zero K] (full liftable : Set H) (negativePart : H → K)
    (hl : ∀ b∈full,b∈liftable ↔ negativePart b=0) (b : H) :
  b∈newCMHom full liftable ↔ b∈full ∧ negativePart b≠0 := by sorry
theorem newCMHom_ordinary {H : Type*} (full : Set H) : newCMHom full full=∅ := by sorry
-- Test: newCMHom_ordinary_empty
example {H : Type*} (full : Set H) : newCMHom full full=∅ := by sorry
-- Test: newCMHom_cm_scalar
example {H : Type*} (full liftable : Set H) (b : H) (hb : b∈liftable) : b∉newCMHom full liftable := by sorry
-- Test: newCMHom_nonzero_negative_part
example {H K : Type*} [Zero K] (full liftable : Set H) (negativePart : H → K)
    (hl : ∀ b∈full,b∈liftable ↔ negativePart b=0) (b : H) (hb : b∈full)
    (hn : negativePart b≠0) : b∈newCMHom full liftable := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-self-intersection-tangent — Tangent self-intersection number
ord is the actual DVR valuation restricted to nonzero elements.
The coefficient is specified by tangent=alpha times integral tangent basis.
The inverse convention changes its sign; model smoothness and component
orthogonality for the local height formula remain geometric hypotheses.
-/
def cmSelfIntersection {K : Type*} [Field K] (ord : Kˣ → ℤ) (tangentCoefficient : Kˣ) : ℤ := by sorry
theorem cmSelfIntersection_basis {K : Type*} [Field K] (ord : Kˣ → ℤ) (hmul : ∀ a b,ord (a*b)=ord a+ord b)
    (α unit : Kˣ) (hu : ord unit=0) : cmSelfIntersection ord (α/unit)=cmSelfIntersection ord α := by sorry
theorem cmSelfIntersection_scale {K : Type*} [Field K] (ord : Kˣ → ℤ) (hmul : ∀ a b,ord (a*b)=ord a+ord b) (α a : Kˣ) :
  cmSelfIntersection ord (a*α)=ord a+cmSelfIntersection ord α := by sorry
theorem cmSelfIntersection_height {K : Type*} [Field K] (ord : Kˣ → ℤ) (α : Kˣ) (q : ℕ) :
  -(cmSelfIntersection ord α : ℝ)*Real.log q=-(ord α : ℝ)*Real.log q := by sorry
-- Test: cmSelfIntersection_integral_basis
example {K : Type*} [Field K] (ord : Kˣ → ℤ) (h1 : ord 1=0) : cmSelfIntersection ord 1=0 := by sorry
-- Test: cmSelfIntersection_uniformizer
example {K : Type*} [Field K] (ord : Kˣ → ℤ) (π : Kˣ) (hπ : ord π=1) : cmSelfIntersection ord π=1 := by sorry
-- Test: cmSelfIntersection_reciprocal
example {K : Type*} [Field K] (ord : Kˣ → ℤ) (hmul : ∀ a b,ord (a*b)=ord a+ord b)
    (π : Kˣ) (hπ : ord π=1) : cmSelfIntersection ord π⁻¹= -1 := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.2/classical-p-height-sum — Rational-prime CM height sum
V is the actual finite set of places of H above p, with residue degree f_v.
The proper tangent-normalized local intersection lengths are imported.
The actual number-field place classification is omitted from the small
inert and ramified tests, which retain its predicted cardinalities.
-/
def cmPrimeHeightSum {V : Type*} [Fintype V] (placeValue : V → ℝ) : ℝ := by sorry
theorem cmPrimeHeightSum_log_norm {V : Type*} [Fintype V] (p : ℕ) (f : V → ℕ) (length : V → ℝ) :
  cmPrimeHeightSum (fun v ↦ -length v*Real.log ((p : ℝ)^(f v)))=
  -(∑ v,length v*(f v))*Real.log p := by sorry
theorem cmPrimeHeightSum_galois {V W : Type*} [Fintype V] [Fintype W] (e : V ≃ W) (placeValue : W → ℝ) :
  cmPrimeHeightSum (placeValue ∘ e)=cmPrimeHeightSum placeValue := by sorry
theorem cmPrimeHeightSum_global {V : Type*} [Fintype V] (placeValue : ℕ → V → ℝ) (hs : ∀ v,Summable (fun p ↦ placeValue p v)) :
  (∑' p,cmPrimeHeightSum (placeValue p))=∑ v,∑' p,placeValue p v := by sorry
-- Test: cmPrimeHeightSum_inert
example (h p : ℕ) (length : Fin h → ℝ) :
  cmPrimeHeightSum (fun v ↦ -length v*Real.log ((p : ℝ)^2))=
    -2*(∑ v,length v)*Real.log p := by sorry
-- Test: cmPrimeHeightSum_ramified
example (h f p : ℕ) (length : Fin (h/f) → ℝ) :
  cmPrimeHeightSum (fun v ↦ -length v*Real.log ((p : ℝ)^f))=
    -(f : ℝ)*(∑ v,length v)*Real.log p := by sorry
-- Test: cmPrimeHeightSum_wrong_cardinality
example  : (3 : ℕ)^2=9 ∧ (3 : ℕ)^2≠2 := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.2/classical-archimedean-height-sum — Archimedean CM height sum
V consists of the h complex places, each contributing one squared-norm
complex symbol. e is the actual Galois class-orbit bijection. No further
embedding weight two is used. The final test awaits the actual Hecke CM
disjointness carrier; its condition r_A(m)=0 is the stated input here.
-/
def cmArchimedeanHeightSum {V : Type*} [Fintype V] (placeValue : V → ℝ) : ℝ := by sorry
theorem cmArchimedeanHeightSum_orbit {V C : Type*} [Fintype V] [Fintype C] (e : V ≃ C) (placeValue : V → ℝ) :
  cmArchimedeanHeightSum placeValue=∑ c,placeValue (e.symm c) := by sorry
theorem cmArchimedeanHeightSum_add {V : Type*} [Fintype V] (placeValue placeValue' : V → ℝ) :
  cmArchimedeanHeightSum (placeValue+placeValue')=cmArchimedeanHeightSum placeValue+cmArchimedeanHeightSum placeValue' := by sorry
theorem cmArchimedeanHeightSum_class_count (h : ℕ) (c : ℝ) : cmArchimedeanHeightSum (fun _ : Fin h ↦ c)=h*c := by sorry
-- Test: cmArchimedeanHeightSum_h_one
example (placeValue : Fin 1 → ℝ) : cmArchimedeanHeightSum placeValue=placeValue 0 := by sorry
-- Test: cmArchimedeanHeightSum_double_weight
example (placeValue : Fin 2 → ℝ) : cmArchimedeanHeightSum (2 • placeValue)=2*cmArchimedeanHeightSum placeValue := by sorry
-- Test: cmArchimedeanHeightSum_disjoint
example {X : Type*} (x : X) (heckeOrbit : Set X) (N r : ℕ)
    (hN : 1<N) (hCM : x∈heckeOrbit ↔ 0<r) (hr : r=0) : x∉heckeOrbit := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.2/classical-complex-height-symbol — Squared-norm complex height symbol
green is the actual unsquared-norm normalized Arakelov kernel.
D and E are disjoint degree-zero divisors; E=div(f) is omitted from the
principal signature until the actual curve/divisor carrier is available.
The uniqueness signature only expresses transport of the constructed
Green symbol; continuity and the principal-divisor universal property
remain the full requirement in the packet.
-/
def classicalComplexHeight {X : Type*} (green : X → X → ℝ) (D E : X →₀ ℤ) : ℝ := by sorry
/- Omitted classicalComplexHeight_principal: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
theorem classicalComplexHeight_add {X : Type*} (green : X → X → ℝ) (D D' E : X →₀ ℤ) :
  classicalComplexHeight green (D+D') E=classicalComplexHeight green D E+classicalComplexHeight green D' E := by sorry
theorem classicalComplexHeight_unique {X : Type*} (green green' : X → X → ℝ) (h : green=green') :
  classicalComplexHeight green=classicalComplexHeight green' := by sorry
-- Test: classicalComplexHeight_zero
example {X : Type*} (green : X → X → ℝ) (E : X →₀ ℤ) : classicalComplexHeight green 0 E=0 := by sorry
-- Test: classicalComplexHeight_scale_function
example {X : Type*} (D : X →₀ ℤ) (hdeg : D.sum (fun _ n ↦ n)=0) (f : X → ℂ)
    (c : ℂ) (hc : c≠0) (hf : ∀ x∈D.support,f x≠0) :
  D.sum (fun x n ↦ (n : ℝ)*Real.log (‖c*f x‖^2))=D.sum (fun x n ↦ (n : ℝ)*Real.log (‖f x‖^2)) := by sorry
-- Test: classicalComplexHeight_square_factor
example  : Real.log ((2 : ℝ)^2)=2*Real.log 2 ∧ Real.log ((2 : ℝ)^2)≠Real.log 2 := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-s2-assumption — Two auxiliary split places
V is the finite-place carrier. G v and U v are the actual local GL2
quotient and unit-parameter carriers. ev is the Weil transform at the
zero vector, evaluated on that full orbit. The Weil representation and
maximal-order/unramified-character identifications are omitted; the
two-place condition retains all g,u evaluations.
-/
def twoSplitDegeneracy {V : Type*} {G U : V → Type*} [DecidableEq V] (split unramified maximal : Set V)
    (orbitZero : ∀ v,G v → U v → ℂ) : Set (Finset V) := by sorry
theorem twoSplitDegeneracy_constructor {V : Type*} {G U : V → Type*} [DecidableEq V] (s u m : Set V) (ev : ∀ v,G v → U v → ℂ) (S : Finset V) :
  S∈twoSplitDegeneracy s u m ev ↔ S.card=2 ∧ ∀ v∈S,v∈s ∧ v∈u ∧ v∈m ∧ ∀ g u,ev v g u=0 := by sorry
theorem twoSplitDegeneracy_place_projection {V : Type*} {G U : V → Type*} [DecidableEq V] (s u m : Set V) (ev : ∀ v,G v → U v → ℂ)
    (S : Finset V) (hS : S∈twoSplitDegeneracy s u m ev) (v : V) (hv : v∈S) : v∈s ∧ v∈u := by sorry
theorem twoSplitDegeneracy_weil_zero {V : Type*} {G U : V → Type*} [DecidableEq V] (s u m : Set V) (ev : ∀ v,G v → U v → ℂ)
    (S : Finset V) (hS : S∈twoSplitDegeneracy s u m ev) (v : V) (hv : v∈S) (g : G v) (u : U v) : ev v g u=0 := by sorry
theorem twoSplitDegeneracy_linear {V : Type*} {G U : V → Type*} [DecidableEq V] (s u m : Set V) (ev ev' : ∀ v,G v → U v → ℂ) (S : Finset V)
    (h : S∈twoSplitDegeneracy s u m ev) (h' : S∈twoSplitDegeneracy s u m ev') (a : ℂ) :
  S∈twoSplitDegeneracy s u m (fun v g u ↦ ev v g u+a*ev' v g u) := by sorry
-- Test: twoSplitDegeneracy_zero_schwartz
example {V : Type*} {G U : V → Type*} [DecidableEq V] (s u m : Set V) (S : Finset V) (hS : S.card=2)
    (hv : ∀ v∈S,v∈s ∧ v∈u ∧ v∈m) : S∈twoSplitDegeneracy (G:=G) (U:=U) s u m (fun _ _ _ ↦ 0) := by sorry
-- Test: twoSplitDegeneracy_single_place
example {V : Type*} {G U : V → Type*} [DecidableEq V] (s u m : Set V) (ev : ∀ v,G v → U v → ℂ) (v : V) :
  {v}∉twoSplitDegeneracy s u m ev := by sorry
-- Test: twoSplitDegeneracy_zero_at_identity_only
example  : (fun x : ℝ ↦ x^2*Real.exp (-Real.pi*x^2)) 0=0 ∧
    (∫ x : ℝ,x^2*Real.exp (-Real.pi*x^2))>0 := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-tangent-symbol — Tangent-normalized CM height symbol
The limit is of the actual nearby-point local symbol minus r log|g|.
A real punctured coordinate is used to display it; the analytic/algebraic
local-field topology, existence and global divisor-class identification are
omitted. Change of parameter subtracts r log|gprime/g|, as in the packet.
-/
def cmTangentHeight (ordinary logParameter : ℝ → ℝ) (multiplicity : ℕ) : ℝ := by sorry
theorem cmTangentHeight_disjoint (placeValue logg : ℝ → ℝ) : cmTangentHeight placeValue logg 0=
  Filter.lim (Filter.map placeValue (𝓝[≠] (0 : ℝ))) := by sorry
theorem cmTangentHeight_change (placeValue logg : ℝ → ℝ) (r : ℕ) (a value : ℝ)
    (hlim : Tendsto (fun y ↦ placeValue y-r*logg y) (𝓝[≠] (0 : ℝ)) (𝓝 value)) :
  cmTangentHeight placeValue (fun y ↦ logg y+a) r=cmTangentHeight placeValue logg r-r*a := by sorry
/- Omitted cmTangentHeight_global: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
-- Test: cmTangentHeight_multiplicity
example (f g : ℝ → ℝ) : cmTangentHeight f g 2=
  Filter.lim (Filter.map (fun y ↦ f y-2*g y) (𝓝[≠] (0 : ℝ))) := by sorry
-- Test: cmTangentHeight_root_unity
example (f g : ℝ → ℝ) (r : ℕ) (ζ : ℂ) (hζ : ζ^6=1) :
  cmTangentHeight f (fun y ↦ g y+Real.log ‖ζ‖) r=cmTangentHeight f g r := by sorry
-- Test: cmTangentHeight_scaling_product
example {V : Type*} [Fintype V] (a : V → ℝ) (hproduct : ∑ v,a v=0) (r : ℕ) : ∑ v,(r : ℝ)*a v=0 := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-eta-tangent — Eta-normalized CM tangent
T is the genuine coordinate of Delta(dq/q)^tensor6 in the cotangent
line; etaCMTangent is a dual tangent whose inverse sixth power is T.
The line trivialization and integral/orbifold parameter are omitted.
The unit-index-one pairing is tangent times cotangent equal to one;
the cotangent coordinate in this branch is the inverse tangent. The
factor 1/u in d(g^(1/u)) remains explicit.
-/
def etaCMTangent (sixthCotangentTensor : ℂˣ) : ℂˣ := by sorry
theorem etaCMTangent_orbifold (T : ℂˣ) (u : ℕ) (hu : 0<u) (g : ℝ) (hg : 0<g) :
  (1/(u : ℝ))*Real.rpow g (1/(u : ℝ)-1)*g=Real.rpow g (1/(u : ℝ))/(u : ℝ) := by sorry
theorem etaCMTangent_unit_index_one (T : ℂˣ) : etaCMTangent T*(etaCMTangent T)⁻¹=1 := by sorry
theorem etaCMTangent_ambiguity (T tangent : ℂˣ) (h : tangent^(-6 : ℤ)=T) :
  (tangent/etaCMTangent T)^6=1 := by sorry
-- Test: etaCMTangent_ordinary
example (T : ℂˣ) : (etaCMTangent T)^(-6 : ℤ)=T := by sorry
-- Test: etaCMTangent_cubic_stabilizer
example (g : ℝ) (hg : 0<g) :
  (1/3 : ℝ)*Real.rpow g (1/3-1)*g=Real.rpow g (1/3)/3 ∧ (1/3 : ℝ)≠1 := by sorry
-- Test: etaCMTangent_global_tensor
example (T ζ : ℂˣ) (hζ : ζ^6=1) : (ζ*etaCMTangent T)^(-6 : ℤ)=T := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-diagonal-green-kernel — Diagonal Green finite part
I is a finite orbit fibre after the infinite resolvent sum has been formed.
The full determinant-m representative sum and eta finite-part construction
are omitted. off and self are their actual Laurent germs; diagonal
multiplicity is u*r, not r or the number of full automorphisms.
-/
def diagonalHeckeGreen {I : Type*} [Fintype I] (hit : Set I)
    (off : I → LaurentSeries ℂ) (self : LaurentSeries ℂ) : LaurentSeries ℂ := by sorry
theorem diagonalHeckeGreen_off_diagonal {I : Type*} [Fintype I] (off : I → LaurentSeries ℂ) (self : LaurentSeries ℂ) :
  diagonalHeckeGreen ∅ off self=∑ i,off i := by sorry
theorem diagonalHeckeGreen_diagonal_count {I : Type*} [Fintype I] [DecidableEq I] (hit : Set I) (off : I → LaurentSeries ℂ)
    (self : LaurentSeries ℂ) (u r : ℕ) (hc : (Finset.univ.filter (fun i ↦ i∈hit)).card=u*r) :
  diagonalHeckeGreen hit off self=
    (∑ i∈Finset.univ.filter (fun i ↦ i∉hit),off i)+(u*r : ℕ) • self := by sorry
theorem diagonalHeckeGreen_laurent {I : Type*} [Fintype I] (hit : Set I) (off : I → LaurentSeries ℂ) (self : LaurentSeries ℂ) :
  (diagonalHeckeGreen hit off self).coeff 0=
    ∑ i,if i∈hit then self.coeff 0 else (off i).coeff 0 := by sorry
-- Test: diagonalHeckeGreen_no_hit
example {I : Type*} [Fintype I] (off : I → LaurentSeries ℂ) (self : LaurentSeries ℂ) :
  diagonalHeckeGreen ∅ off self=∑ i,off i := by sorry
-- Test: diagonalHeckeGreen_hit_u
example (self : LaurentSeries ℂ) : diagonalHeckeGreen (Set.univ : Set (Fin 3)) (fun _ ↦ 0) self=3 • self := by sorry
-- Test: diagonalHeckeGreen_omit_self
example (self : LaurentSeries ℂ) (h : self≠0) :
  diagonalHeckeGreen (Set.univ : Set (Fin 3)) (fun _ ↦ 0) self≠0 := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-inert-order-model — Inert quaternionic order model
A and B are the exact fractional alpha and beta ideals of the packet,
O the subgroup integral at every different prime, with the specified
connecting orientation. Coordinates describe alpha+beta*j, not a new
quaternion algebra. Quaternion multiplication, reduced discriminant and
the local CM reduction identifications are omitted. The set imposes
alpha in A, beta in B and alpha-sign*beta in O (sign=1 for the basic model).
-/
def inertOrderModel {K : Type*} [Field K] (A B O : Submodule ℤ K) : Set (K×K) := by sorry
/- Omitted inertOrderModel_norm: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
/- Omitted inertOrderModel_discriminant: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
theorem inertOrderModel_hom_ideal {K : Type*} [Field K] (A B O : Submodule ℤ K) (star : K →+* K) (a α β : K) :
  (α*a,β*star a).2=β*star a := by sorry
-- Test: inertOrderModel_correct_q
example  : (-(3*23 : ℤ))%7=1 := by sorry
-- Test: inertOrderModel_wrong_q
example  : (11 : ℤ)%7=(-3 : ℤ)%7 ∧ (-(3*11 : ℤ))%7≠1 := by sorry
-- Test: inertOrderModel_conjugate_ideal
example (α β a : ℂ) : β*star a≠β*a ↔ β*(star a-a)≠0 := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-inert-hom-lattice — Inert CM Hom lattice
A and B are the exact fractional alpha and beta ideals of the packet,
O the subgroup integral at every different prime, with the specified
connecting orientation. Coordinates describe alpha+beta*j, not a new
quaternion algebra. Quaternion multiplication, reduced discriminant and
the local CM reduction identifications are omitted. The set imposes
alpha in A, beta in B and alpha-sign*beta in O (sign=1 for the basic model).
-/
def inertCMHomLattice {K : Type*} [Field K] (A B O : Submodule ℤ K) (sign : K) : Set (K×K) := by sorry
theorem inertCMHomLattice_beta {K : Type*} [Field K] (A B O : Submodule ℤ K) (α β sign : K)
    (h : (α,β)∈inertCMHomLattice A B O sign) : β∈B := by sorry
theorem inertCMHomLattice_connecting_convention {I : Type*} [CommGroup I] (b bbar : I) : bbar*b⁻¹=(b*bbar⁻¹)⁻¹ := by sorry
theorem inertCMHomLattice_degree {K : Type*} [Field K] (A B O : Submodule ℤ K) (s : K) (norm : K → ℚ)
    (p q Na m : ℚ) (x : inertCMHomLattice A B O s)
    (hm : norm x.val.1+p*q*norm x.val.2=m*Na) (hNa : Na≠0) :
  (norm x.val.1+p*q*norm x.val.2)/Na=m := by sorry
-- Test: inertCMHomLattice_b_one
example {K : Type*} [Field K] (A B O : Submodule ℤ K) : inertCMHomLattice A B O 1=inertOrderModel A B O := by sorry
-- Test: inertCMHomLattice_orientation
example {I : Type*} [CommGroup I] (b bbar : I) (h : bbar*b⁻¹≠b*bbar⁻¹) :
  bbar*b⁻¹≠(bbar*b⁻¹)⁻¹ := by sorry
-- Test: inertCMHomLattice_sign
example {K : Type*} [Field K] (A B O : Submodule ℤ K) (s α β : K) :
  (α,β)∈inertCMHomLattice A B O s ↔ (-α,-β)∈inertCMHomLattice A B O s := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-order-model — Ramified quaternionic order model
A and B are the exact fractional alpha and beta ideals of the packet,
O the subgroup integral at every different prime, with the specified
connecting orientation. Coordinates describe alpha+beta*j, not a new
quaternion algebra. Quaternion multiplication, reduced discriminant and
the local CM reduction identifications are omitted. The set imposes
alpha in A, beta in B and alpha-sign*beta in O (sign=1 for the basic model).
-/
def ramifiedOrderModel {K : Type*} [Field K] (A B O : Submodule ℤ K) (sign : K) : Set (K×K) := by sorry
theorem ramifiedOrderModel_norm {K : Type*} [Field K] (A B O : Submodule ℤ K) (s : K)
    (norm : K → ℚ) (q : ℚ) (x : ramifiedOrderModel A B O s)
    (quaternionNorm : K×K → ℚ) (h : ∀ a b,quaternionNorm (a,b)=norm a+q*norm b) :
  quaternionNorm x.val=norm x.val.1+q*norm x.val.2 := by sorry
theorem ramifiedOrderModel_ideals (p Nc Ncprime N m D : ℕ) (hc : p∣Nc) (hcprime : p∣Ncprime)
    (hNorm : Nc+N*Ncprime=m*D) : p∣m*D := by sorry
theorem ramifiedOrderModel_places (h f p : ℕ) (hf : f∣h) (hpos : 0<f) (residueCard : ℕ)
    (hcard : residueCard=p^f) : (h/f)*f=h ∧ Real.log residueCard=f*Real.log p := by sorry
-- Test: ramifiedOrderModel_beta_congruence
example  : ((1 : ℤ)-(1 : ℤ))%7=0 ∧ ((1 : ℤ)-(2 : ℤ))%7≠0 := by sorry
-- Test: ramifiedOrderModel_p_divides_n
example (p n : ℕ) (hp : 0<p) (hn : 0<n) : 0<p*n ∧ p∣p*n := by sorry
-- Test: ramifiedOrderModel_residue_weight
example (h p : ℕ) : (h/2 : ℝ)*(2*Real.log p)=(h/2*2 : ℝ)*Real.log p := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-inert-norm-ideal-map — Inert norm-ideal map
I is the actual group of fractional ideals with zero adjoined, principal
its genuine principal-ideal map. The output is (alpha)d/a and
(beta)d*q*b/(n*bbar*abar). Integrality, ideal classes, absolute ideal norm
and lifting-valuation hypotheses are omitted until the CM ideal supplier
can express them; the source fixes each of them exactly.
-/
def inertNormIdeals {K I : Type*} [Field K] [CommGroupWithZero I]
    (principal : K →*₀ I) (different a q n b bbar abar : I) (α β : K) : I×I := by sorry
/- Omitted inertNormIdeals_classes: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
/- Omitted inertNormIdeals_norm: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
/- Omitted inertNormIdeals_valuation: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
-- Test: inertNormIdeals_nonzero
/- Omitted test:inertNormIdeals_nonzero: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/
-- Test: inertNormIdeals_sign
example {K I : Type*} [Field K] [CommGroupWithZero I] (principal : K →*₀ I)
    (hminus : principal (-1)=1) (d a q n b bbar abar : I) (α β : K) :
  inertNormIdeals principal d a q n b bbar abar (-α) (-β)=
    inertNormIdeals principal d a q n b bbar abar α β := by sorry
-- Test: inertNormIdeals_bad_a
example (ord : ℚˣ → ℤ) (hord : ∀ x y,ord (x*y)=ord x+ord y)
    (x a : ℚˣ) (ha : ord a≠0) : ord (x*a)≠ord x := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-kernel — Classical Rankin kernel
The function is sum_i theta(reps_i z)*E(dilate(reps_i z)); reps are the
actual trace from level N|D| to N and dilate is multiplication by N.
Slash factors, modular-form membership and the coefficient transform
identity are omitted; the Fourier signature below is refined separately.
-/
def classicalRankinKernel {X : Type*} {d : ℕ} (theta eisenstein : X → ℂ)
    (dilate : X → X) (reps : Fin d → X → X) : X → ℂ := by sorry
/- Omitted classicalRankinKernel_trace: Arbitrary scalar/function inputs are not tied to the modular, quadratic-character or ideal-count objects; the statement can be false under the displayed hypotheses. -/
/- Omitted classicalRankinKernel_fourier: Arbitrary scalar/function inputs are not tied to the modular, quadratic-character or ideal-count objects; the statement can be false under the displayed hypotheses. -/
theorem classicalRankinKernel_class_dependence {X : Type*} {d : ℕ} (θ θ' E : X → ℂ) (dilate : X → X)
    (reps : Fin d → X → X) (c : ℂ) :
  classicalRankinKernel (θ+c • θ') E dilate reps=
    classicalRankinKernel θ E dilate reps+c • classicalRankinKernel θ' E dilate reps := by sorry
-- Test: classicalRankinKernel_level_one
example (D : ℤ) (hD : D<0) : (1 : ℕ)*D.natAbs=D.natAbs := by sorry
-- Test: classicalRankinKernel_negative_D
example (N : ℕ) (hN : 0<N) (D : ℤ) (hD : D<0) : 0<N*D.natAbs ∧ (N : ℤ)*D<0 := by sorry
-- Test: classicalRankinKernel_zero_theta
example {X : Type*} {d : ℕ} (E : X → ℂ) (dilate : X → X) (reps : Fin d → X → X) :
  classicalRankinKernel 0 E dilate reps=0 := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-combination — Genus Eisenstein combination
I indexes ordered fundamental-discriminant decompositions D1*D2=D.
The formula sums epsilon*genus/(kappa*absD^(s+2k-3/2))*E(scale z).
Their character/group identities and congruence-level membership are
omitted; the two dependencies are expressed by equality of actual
character values. Negative D1 has kappa=i, retained in the prime test.
-/
def genusEisensteinCombination {I X : Type*} [Fintype I]
    (epsilon genus kappa : I → ℂ) (absD : I → ℕ) (scale : I → X → X)
    (E : I → ℂ → X → ℂ) (k : ℕ) (s : ℂ) : X → ℂ := by sorry
theorem genusEisensteinCombination_genus {I X : Type*} [Fintype I] (ε χ χ' κ : I → ℂ) (D : I → ℕ)
    (scale : I → X → X) (E : I → ℂ → X → ℂ) (k : ℕ) (s : ℂ) (h : χ=χ') :
  genusEisensteinCombination ε χ κ D scale E k s=genusEisensteinCombination ε χ' κ D scale E k s := by sorry
theorem genusEisensteinCombination_level_residue {I X : Type*} [Fintype I] (ε ε' χ κ : I → ℂ) (D : I → ℕ)
    (scale : I → X → X) (E : I → ℂ → X → ℂ) (k : ℕ) (s : ℂ) (h : ε=ε') :
  genusEisensteinCombination ε χ κ D scale E k s=genusEisensteinCombination ε' χ κ D scale E k s := by sorry
theorem genusEisensteinCombination_prime (p : ℕ) (E1 ED : ℂ → ℂ → ℂ) (s z : ℂ) :
  genusEisensteinCombination (fun _ : Fin 2 ↦ 1) (fun _ ↦ 1)
    (fun i ↦ if i=0 then 1 else Complex.I) (fun i ↦ if i=0 then 1 else p)
    (fun i z ↦ if i=0 then (p : ℂ)*z else z) (fun i ↦ if i=0 then E1 else ED) 1 s z=
    E1 s ((p : ℂ)*z)-Complex.I*(p : ℂ)^(-s-1/2)*ED s z := by sorry
-- Test: genusEisensteinCombination_prime_terms
example  : Fintype.card (Fin 2)=2 := by sorry
-- Test: genusEisensteinCombination_ordered
example (c : ℂ) : (∑ _ : Fin 2,c)=2*c := by sorry
-- Test: genusEisensteinCombination_i_factor
example (z : ℂ) (hz : z≠0) : z/Complex.I≠z := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-function — Rankin genus-sign function
D1,D2 are the unique decomposition with gcd(d,D)=|D2|, not arbitrary
independent discriminants. The source norm congruence and primitive
quadratic/genus-character carriers are omitted. The piecewise definition
uses gcd(d,n/d,D) and epsilon2(-N*n/d), preserving the sign of n.
-/
def rankinGenusSign (D N n d D1 D2 : ℤ) (epsilon1 epsilon2 : ℤ → ℤ) (genus : ℤ) : ℤ := by sorry
theorem rankinGenusSign_values (D N n d D1 D2 : ℤ) (ε1 ε2 : ℤ → ℤ) (χ : ℤ)
    (h1 : ∀ x,ε1 x∈({-1,0,1} : Set ℤ)) (h2 : ∀ x,ε2 x∈({-1,0,1} : Set ℤ))
    (hχ : χ∈({-1,1} : Set ℤ)) : rankinGenusSign D N n d D1 D2 ε1 ε2 χ∈({-1,0,1} : Set ℤ) := by sorry
/- Omitted rankinGenusSign_complement: Arbitrary scalar/function inputs are not tied to the modular, quadratic-character or ideal-count objects; the statement can be false under the displayed hypotheses. -/
/- Omitted rankinGenusSign_multiplicative: Arbitrary scalar/function inputs are not tied to the modular, quadratic-character or ideal-count objects; the statement can be false under the displayed hypotheses. -/
-- Test: rankinGenusSign_common_ramification
example (D N n d D1 D2 : ℤ) (ε1 ε2 : ℤ → ℤ) (χ : ℤ)
    (h : Nat.gcd (Int.gcd d (n/d)) D.natAbs≠1) : rankinGenusSign D N n d D1 D2 ε1 ε2 χ=0 := by sorry
-- Test: rankinGenusSign_positive_cancellation
example (divisors : Finset ℕ) (ε : ℕ → ℤ) (e : divisors ≃ divisors)
    (h : ∀ d,ε (e d)=-ε d) : (∑ d∈divisors,ε d)=0 := by sorry
-- Test: rankinGenusSign_negative_index
/- Omitted rankinGenusSign_negative_index: the scalar identity did not test the genus-sign construction. Use the packet’s n=±3 character computation once the actual quadratic-character carrier is available. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-signed-divisor-sums — Signed divisor sums
epsilon is the actual genus sign of the preceding construction, not an
unsigned positive-index ideal-count function. The logarithmic second
component is for n>0; negative n retains only the first component.
Prime-contribution formula and split vanishing omit the imported norm
congruence/ideal-count carriers, which the packet states exactly.
-/
def signedDivisorSums (epsilon : ℤ → ℕ → ℤ) (n : ℤ) : ℤ×ℝ := by sorry
theorem signedDivisorSums_log (ε : ℤ → ℕ → ℤ) (n : ℤ) (hn : 0<n) :
  (signedDivisorSums ε n).2=Real.log n*(signedDivisorSums ε n).1-
    2*∑ d∈n.natAbs.divisors,(ε n d : ℝ)*Real.log d := by sorry
/- Omitted signedDivisorSums_prime_support: Arbitrary scalar/function inputs are not tied to the modular, quadratic-character or ideal-count objects; the statement can be false under the displayed hypotheses. -/
theorem signedDivisorSums_negative (ε : ℤ → ℕ → ℤ) (n : ℤ) (sign : ℕ → ℤ)
    (h : ∀ d∈n.natAbs.divisors,ε (-n) d=sign d*ε n d) :
  (signedDivisorSums ε (-n)).1=∑ d∈n.natAbs.divisors,sign d*ε n d := by sorry
-- Test: signedDivisorSums_one
example (ε : ℤ → ℕ → ℤ) : (signedDivisorSums ε 1).2=0 := by sorry
-- Test: signedDivisorSums_split
example (ε : ℤ → ℕ → ℤ) (n : ℤ) (p : ℕ) (splitContribution : ℝ)
    (hsplit : splitContribution=0) : (signedDivisorSums ε n).2+splitContribution=(signedDivisorSums ε n).2 := by sorry
-- Test: signedDivisorSums_negative_tail
example  : (signedDivisorSums (fun n d ↦ if d=1 then 1 else if d=3 then if n<0 then 1 else -1 else 0) 3).1=0 ∧
    (signedDivisorSums (fun n d ↦ if d=1 then 1 else if d=3 then if n<0 then 1 else -1 else 0) (-3)).1=2 := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.0/root-number-and-measure-normalisation-corrections — Base-change signs and measure comparison
rankin and baseChange are the actual local root numbers. The translation
rankin=eta(-1)*baseChange is imported from AL and fixed in htranslate.
The quotient periods P,Q use total torus volume 2Leta.
-/
theorem rootNumber_measure_comparison (rankin baseChange etaMinusOne : ℂ)
    (htranslate : rankin=etaMinusOne*baseChange) (P Q Leta : ℂ) (hL : Leta≠0) :
  (P/(2*Leta))*(Q/(2*Leta))=(2*Leta)^(-2 : ℤ)*(P*Q) := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.0/identity-rescaling — Rescaling height and period identities

-/
theorem identity_rescaling {V W : Type*} [AddCommGroup V] [Module ℝ V]
    [AddCommGroup W] [Module ℝ W] (H α : V →ₗ[ℝ] W →ₗ[ℝ] ℝ)
    (C L a b c : ℝ) (h : ∀ x y,H x y=C*L*α x y) (x : V) (y : W) :
  (a • H) x y=a*C*L*α x y ∧
  ((b*c) • α) x y=b*c*α x y ∧ (b*(H x y))*(b*(H x y))=b^2*(H x y)^2 := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.1/elliptic-poincare-comparison — Elliptic Poincaré comparison
V is E(K), pinned its exact Tau Ceti pairing and poincare the canonical
RP biextension pairing. The actual line bundle, principal polarization and
coordinate-height comparison hypotheses are omitted, not free predicates.
-/
/- Omitted elliptic_poincare_comparison: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.2/hodge-index-theorem-and-admissible-arithmetic-extensions — Faltings–Hriljac comparison
D consists of the componentwise degree-zero divisor classes; J is Pic0
under the principal polarization. Model smoothness, flat admissibility and
disjoint representatives are omitted pending the actual SR/TB carriers.
-/
/- Omitted faltingsHriljac: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.3/strict-gl2-realization — Strict GL₂ realization and transfer
M is End0(A) of the actual simple parametrized quotient and A here is
its tangent space. Simplicity, rational Hecke summand, irreducibility and
Jacquet-Langlands identifications are omitted until the GL2/A2 carriers exist.
-/
/- Omitted strictGL2_realization: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.3/petersson-composition-comparison — Petersson and modular-degree comparison
The inputs are the actual integrals of the named differential and its
pullback, and c is the Manin scalar. Their analytic-geometric definitions
and coefficient embedding are omitted; no normalization is chosen to force equality.
-/
/- Omitted petersson_composition_comparison: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.3/manin-integrality-and-p-unit — Integral Manin constant and p-unit range
This is the optimal semistable-at-p branch. Nonconstant parametrization,
minimal differential, normalized newform and connected quotient kernel are
omitted until the actual elliptic/modular morphism carrier is available.
-/
/- Omitted maninConstant_integral_p_unit: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.3/manin-isogeny-twist-transfer — Manin isogeny and twist transfer
ord is the actual minimal-differential p-adic valuation. The twist factor
is treated by the same p-unit transport with p not dividing 2ND; its local
minimal-model construction is omitted. Prime-to-isogeny degree is essential.
-/
theorem maninConstant_isogeny_twist_transfer (ord : ℚˣ → ℤ)
    (hmul : ∀ x y,ord (x*y)=ord x+ord y) (c a adual degree : ℚˣ)
    (hdual : a*adual=degree) (ha : 0≤ord a) (hadual : 0≤ord adual)
    (hdeg : ord degree=0) (hc : ord c=0) : ord (a*c)=0 := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.3/manin-degree-divisibility — Manin constant and modular degree
c and degree are the actual nonzero absolute Manin constant and modular
degree for Gamma1(N) <= Gamma <= Gamma0(N). The source exceptional valuations
and Gamma1 strengthening are specified in the packet; morphism hypotheses are omitted.
-/
/- Omitted maninConstant_dvd_modularDegree: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional — Saito–Tunnell dichotomy
ρ is the actual irreducible local representation and epsilon the
base-change root number. Genericity/inner-form transfer and all field
hypotheses are omitted; this includes the separate archimedean alternatives.
-/
/- Omitted saitoTunnell: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.4/unramified-toric-value — Unramified toric value and finite product
beta is the normalized toric form on the actual spherical unramified
pair, with unramified quadratic field and compact torus quotient volume one.
Its representation, measure and standard-vector hypotheses are omitted.
-/
/- Omitted normalizedToricForm_unramified: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.4/toric-test-vectors — Nonzero toric test vectors
l is a genuine distinguished toric functional. The source admissible-order
line and real weight carriers are omitted. The existence statement does
not assert any incorrectly oriented newvector is a test vector.
-/
theorem toricTestVector_nonzero {V : Type*} [AddCommGroup V] [Module ℂ V]
    (l : V →ₗ[ℂ] ℂ) (hl : l≠0) : ∃ f : V,l f≠0 := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.5/coherent-quaternionic-specialization — Coherent quaternionic theta specialization
These are the actual coherent norm-space kernels. Ordinary anisotropic
data have zero correction; divergent split binary/ternary data use the
correct regularized first/second-term input. Weil and Witt-index hypotheses are omitted.
-/
/- Omitted coherentQuaternionicTheta: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.5/waldspurger-period-formula-and-its-siegel-weil-proof — Waldspurger period formula
P and Q are actual probability toric periods; alpha uses the quaternionic
Tamagawa Petersson form of volume two. Cuspidality, central characters,
local/global representations and regularized proof hypotheses are omitted.
-/
/- Omitted waldspurger: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.5/toric-period-nonvanishing — Toric period nonvanishing criterion
localHom is provisionally represented inside V; its true restricted
tensor/local representation carriers and factorization theorem hypotheses
are omitted. The criterion concerns a fixed character, not twist existence.
-/
/- Omitted toricPeriod_nonzero_iff: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.5/finite-vector-variation — Finite test-vector variation

-/
theorem waldspurger_vector_variation {I : Type*} [Fintype I]
    (period periodprime C : ℂ) (factors factorsprime : I → ℂ)
    (h : period=C*∏ v,factors v) (hprime : periodprime=C*∏ v,factorsprime v) :
  periodprime*(∏ v,factors v)=period*(∏ v,factorsprime v) := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.6/incoherent-central-derivative — Incoherent central derivative
I is the actual continued incoherent kernel. Differentiability and
interchange of the expansions are supplied by the separate analytic
convergence nodes, not inferred from this algebraic sign statement.
-/
theorem incoherentKernel_derivative {G : Type*} (I : ℂ → G → ℂ)
    (hodd : ∀ s g,I (-s) g= -I s g) (g : G) : I 0 g=0 := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.6/arithmetic-theta-lifting — Arithmetic theta lifting comparison
Both sides are the actual projected Jacobian homomorphisms after rational
scalar extension; Picard-correspondence-to-Hom, finite level and projection
conditions are omitted until their suppliers give typed geometric terms.
-/
/- Omitted arithmeticThetaLift_comparison: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/generating-series-arithmetic-theta-lifting-and-the-kernel-identity — Projected arithmetic kernel identity
A is the automorphic-form carrier and project the fixed cuspidal isotypic
projection. Its actual analytic growth/orthogonality and test-data hypotheses
are omitted. The statement is projected, not pointwise.
-/
/- Omitted arithmeticKernel_projected_identity: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/good-local-arithmetic-identity — Good-place arithmetic identity
The two terms are the actual good-place coefficients. Local level,
conductor, degeneracy, deformation lengths and analytic continuation
hypotheses cannot yet be applied to typed supplier objects and are omitted.
-/
/- Omitted goodLocal_arithmetic_identity: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/nearby-coherent-orthogonality — Nearby coherent kernel orthogonality
nearby is the coherent B(v) kernel and target lies in sigma, whose local
distinction/ramification set differs. These actual local representation
hypotheses are omitted. No vanishing of nearby itself is asserted.
-/
/- Omitted nearbyCoherent_orthogonal: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/degenerate-schwartz-functions-local-decomposition-and-approximation — Nearby quaternionic approximation
The actual kernels are automorphic and satisfy the source degenerate
test-data comparison on 1^S GL2(A^S). Their density/K-finiteness and
approximation hypotheses are omitted; the coherent sum is generally nonzero.
-/
/- Omitted nearbyQuaternionic_approximation: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/boundary-cusp-correction — Modular cusp and boundary correction
raw, boundary and corrected are the actual finite-level modular kernels.
Cusp expansions and the asserted corrected height/projection comparison
are the full packet target; their geometric operators are omitted here.
-/
theorem modularBoundary_correction {A : Type*} [AddCommGroup A] [Module ℂ A]
    (project : A →ₗ[ℂ] A) (raw boundary corrected : A)
    (hcorrect : corrected=raw+boundary) : project corrected=project raw+project boundary := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.2/admissible-metric-existence — Complex admissible metric existence
L is the actual holomorphic line bundle on a connected positive-genus
compact curve. Smooth norm and Chern-current conditions are omitted;
uniqueness is of norms up to one positive constant, not equality.
-/
/- Omitted admissibleMetric_exists_unique: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.2/explicit-skeleton-measure — Explicit admissible skeleton measure
X is the model skeleton, vertex Dirac and edge unit-mass length measures.
The connected polarized graph, minimal split semistable model and genus
identity are omitted. Bridges use resistance infinity; loops zero.
-/
/- Omitted graphAdmissibleMeasure_resistance_formula: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-comparison — Pseudo-theta comparison on a small bad-place compact
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_pseudo_comparison: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-automorphic — Automorphic sum reduces to nondegenerate outer theta
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_pseudo_automorphic: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-weight-cancel — Positive-codimension theta cancellation
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_pseudo_weight_cancel: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/colmez-projected-derivative — Projected derivative decomposition
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_projected_derivative: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-order-sandwich — Integral order sandwich
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_order_sandwich: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-shell-inert — Inert norm-shell cutoff
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_shell_inert: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-shell-ramified — Ramified norm-shell volume
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_shell_ramified: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-k-inert — Inert logarithmic singularity and diagonal extension
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_k_inert: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-k-ramified — Ramified logarithmic singularity and diagonal extension
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_k_ramified: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-c-arch — Archimedean zero-term correction
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_c_arch: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-c-finite — Finite zero-term correction
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_c_finite: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/colmez-series-automorphy — Automorphy and cuspidality of the height series
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_series_automorphy: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-arch-proper — Archimedean proper-height expression
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_arch_proper: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-nonsplit-proper — Nonsplit proper-height expression
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_nonsplit_proper: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-ordinary-pairing — Ordinary multiplicity and local pairing
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_ordinary_pairing: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-split-proper — Split proper height and zero extended diagonal
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_split_proper: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-height-decomposition-series — Full local decomposition of the height series
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_height_decomposition_series: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-local-m-inert — Supersingular inert local intersection
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_local_m_inert: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-local-m-ramified — Wild-inclusive ramified local intersection
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_local_m_ramified: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-local-m-division — Superspecial local intersection
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_local_m_division: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-local-n — Diagonal-correction local coefficient
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_local_n: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-superspecial-m — Superspecial multiplicity by uniformization
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_superspecial_m: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-vertical-pseudo — Vertical correction is nonsingular pseudo-theta
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_vertical_pseudo: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-vertical-split-zero — Vertical correction vanishes at B-split places
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_vertical_split_zero: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-kernel-schwartz — Analytic–arithmetic difference is a finite pseudo-theta sum
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_kernel_schwartz: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-local-cancel-nonsplit — Nonsplit diagonal cancellation
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_local_cancel_nonsplit: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-local-cancel-split — Split diagonal cancellation
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_local_cancel_split: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-nonzero-theta — Nonzero associated weight-one theta
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_nonzero_theta: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-adjunction-arch — Archimedean adjunction constant
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_adjunction_arch: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-small-level-diagonal — Extended local diagonal vanishes at small away-v level
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_small_level_diagonal: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-modified-projection — Geometric realization of extended self-intersection
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_modified_projection: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-adjunction-finite — Finite adjunction lattice identity
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_adjunction_finite: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-arithmetic-adjunction — Arithmetic adjunction for the CM point
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_arithmetic_adjunction: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-derivative-of-the-mixed-theta — Derivative of the mixed theta–Eisenstein series before projection
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_rev_derivative_of_the_mixed_theta: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-archimedean-holomorphic-projection-of-log — Archimedean holomorphic projection of log δ∞·W^(2)
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_rev_archimedean_holomorphic_projection_of_log: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-local-whittaker-series-for-incoherent — Local Whittaker series for incoherent sections
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_rev_local_whittaker_series_for_incoherent: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/colmez-rev-corrected-cm-multiplicity-at-split — Corrected CM multiplicity at 𝔹-split, E-nonsplit places
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
/- Omitted colmez_rev_corrected_cm_multiplicity_at_split: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-hodge-class-terms-vanish-and — Hodge-class terms vanish and the height series splits into horizontal and vertical parts
The parameters are the actual kernels, coefficients, measures and orders
of the stated Yuan-Zhang source result. Their adelic/quaternionic/geometric
carrier conditions are omitted where the named suppliers lack Lean types;
the exact hypotheses and corrected versions are binding in the packet.
-/
theorem colmez_rev_hodge_class_terms_vanish_and (Z i j : ℝ)
    (pairings : Fin 4 → ℝ) (h1 : pairings 1=0) (h2 : pairings 2=0)
    (h3 : pairings 3=0) (hZ : Z=pairings 0-pairings 1-pairings 2+pairings 3)
    (hij : pairings 0= -i-j) : Z= -i-j := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-height-green-characterization — Marked Green height characterization
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_height_green_characterization: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-resolvent-residue — Resolvent residue
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_resolvent_residue: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-cusp-expansion — Resolvent cusp expansion
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_cusp_expansion: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-green-constant — Modular Green constant
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_green_constant: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-archimedean-height — Archimedean modular height formula
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_archimedean_height: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-hecke-kernel-action — Hecke kernel action
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
theorem gz86_hecke_kernel_action {X : Type*} {d : ℕ} (reps : Fin d → X → X)
    (G : X → X → ℝ) (z w : X) (c : ℝ) :
  heckeGreen (fun _ _ ↦ c) reps z w=d*c ∧ heckeGreen G reps z w=∑ i,G z (reps i w) := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-hecke-archimedean-height — Hecke archimedean height formula
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_hecke_archimedean_height: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-atkin-lehner-invariance — Atkin–Lehner kernel invariance
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_atkin_lehner_invariance: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-cm-genus-orbits — CM genus-orbit count
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_cm_genus_orbits: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-hyperbolic-norm-parameter — Hyperbolic norm parameter
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
theorem gz86_hyperbolic_norm_parameter (a b c d : ℝ) :
  (a-d)^2+(b+c)^2=a^2+b^2+c^2+d^2-2*(a*d-b*c) ∧
  (a+d)^2+(b-c)^2=(a-d)^2+(b+c)^2+4*(a*d-b*c) := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-pair-count — Quadratic-pair representation count
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_pair_count: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-congruence-count — Ramified-congruence pair count
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_ramified_congruence_count: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-prime-discriminant-count — Prime-discriminant pair count
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_prime_discriminant_count: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-genus-pair-count — Genus pair count
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_genus_pair_count: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-genus-kernel-evaluation — Genus kernel evaluation
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_genus_kernel_evaluation: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-orbit-kernel-evaluation — CM orbit kernel evaluation
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_orbit_kernel_evaluation: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-genus-character-filter — Genus-character filter
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_genus_character_filter: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-cm-eisenstein-sum — CM Eisenstein sum
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_cm_eisenstein_sum: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-disjoint-archimedean-sum — Disjoint archimedean CM formula
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_disjoint_archimedean_sum: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-tangent-product-formula — Tangent product formula
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
theorem gz86_tangent_product_formula {V : Type*} [Fintype V] (placeValue logScale : V → ℝ)
    (a b : ℤ) (hproduct : Finset.univ.sum logScale=0) :
  Finset.univ.sum (fun v : V ↦ placeValue v+((a*b : ℤ) : ℝ)*(logScale v))=Finset.univ.sum placeValue := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-complex-tangent-asymptotic — Complex tangent asymptotic
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_complex_tangent_asymptotic: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-diagonal-archimedean-height — Diagonal archimedean CM formula
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_diagonal_archimedean_height: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-renormalized-self-value — Renormalized resolvent self-value
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_renormalized_self_value: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-self-value-orbit-sum — Self-value CM orbit sum
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_self_value_orbit_sum: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-total-archimedean-formula — Total archimedean CM formula
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_total_archimedean_formula: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-degree-one-intersection — Degree-one CM intersection count
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_degree_one_intersection: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-supersingular-eichler-order — Supersingular Eichler realization
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_supersingular_eichler_order: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-split-vanishing — Split CM intersection vanishing
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_split_vanishing: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-hom-intersection-count — CM Hom intersection count
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_hom_intersection_count: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-hom-quaternion-realization — CM Hom quaternion realization
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_hom_quaternion_realization: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-endomorphism-congruence-order — CM endomorphism congruence order
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_endomorphism_congruence_order: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-inert-disjoint-intersection — Inert disjoint intersection formula
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_inert_disjoint_intersection: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-disjoint-intersection — Ramified disjoint intersection formula
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_ramified_disjoint_intersection: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-new-automorphism-length — New automorphism length
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
This specialization requires a smooth coarse integral diagram, u_x=1
and v not dividing N. Elliptic and level cases retain the tensor correction.
-/
/- Omitted gz86_new_automorphism_length: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-j-tangent-values — Special j tangent values
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_j_tangent_values: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-intersection — New Hom intersection formula
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_new_hom_intersection: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-inert-total-intersection — Inert total intersection formula
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_inert_total_intersection: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-total-intersection — Ramified total intersection formula
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_ramified_total_intersection: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-split-total-intersection — Split total intersection formula
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_split_total_intersection: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-level-intersection — Level intersection formula
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_level_intersection: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-split-height-sum — Split-prime height sum
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_split_height_sum: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-inert-height-sum — Inert-prime height sum
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_inert_height_sum: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-height-sum — Ramified-prime height sum
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_ramified_height_sum: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-inert-unit-count — Inert unit-orbit count
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_inert_unit_count: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-global-local-archimedean-sum — Global-local archimedean comparison
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_global_local_archimedean_sum: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-finite-height-sum — Total finite CM height formula
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_finite_height_sum: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-norm-one-generators — Norm-one generator count
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
theorem gz86_norm_one_generators (Nc Ncprime p N D : ℕ) (h : Nc+p*N*Ncprime=D) :
  Nc+(p*Ncprime)*N=D ∧ p∣p*Ncprime := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-level-reduction-component — CM level reduction component
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_level_reduction_component: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-component-orthogonality — CM component orthogonality
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_component_orthogonality: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-finite-intersection-height — Finite CM intersection height
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_finite_intersection_height: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-prime-to-p-hom-count — Prime-to-p Hom decomposition
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_prime_to_p_hom_count: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/classical-isomorphism-intersection-count — Diagram isomorphism intersection count
The inputs denote the actual classical CM points, Hecke kernels, ideal
counts and local symbols of the cited result. The standing odd fundamental
discriminant, Heegner condition, prime-to-level and source-specific model
hypotheses are omitted when their imported carrier is not yet available.
The exact mathematical statement in the packet is definitive.
-/
/- Omitted gz86_isomorphism_intersection_count: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.0/classical-rankin-normalization — Classical Rankin normalization
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_rankin_normalization: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-absolute-convergence — Rankin absolute convergence
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
a n,r n stand for positive index n+1; localEuler indexes primes.
-/
/- Omitted gz86_absolute_convergence: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-entire-functional-equation — Completed Rankin functional equation
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_entire_functional_equation: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-height-series-cuspidality — Hecke height-series cuspidality
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_height_series_cuspidality: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.0/classical-relative-field-heights — Relative-field height comparison
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_relative_field_heights: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.3/classical-eigendifferential-period — Eigendifferential period comparison
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_eigendifferential_period: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-disjointness — CM Hecke disjointness criterion
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_disjointness: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.0/classical-cm-action-conventions — CM action convention comparison
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
C is the actual class group. nbar has class n inverse; the ideal orientation
and the full simply transitive Gal-times-Atkin-Lehner action are omitted.
-/
/- Omitted gz86_cm_action_conventions: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.2/classical-local-intersection-height — Local intersection height comparison
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_local_intersection_height: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.0/classical-genus-character-factorization — Genus-character factorization
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_genus_character_factorization: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-unfolding — Classical Rankin unfolding
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_rankin_unfolding: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-trace-adjunction — Classical trace adjunction
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_trace_adjunction: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-mobius-level-decomposition — Möbius level decomposition
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_mobius_level_decomposition: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-kernel-pairing — Rankin kernel pairing
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_rankin_kernel_pairing: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-prime-to-level-detection — Prime-to-level newform detection
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_prime_to_level_detection: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-transformation — Classical Eisenstein transformation
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_eisenstein_transformation: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-trace-coset-classification — Trace coset classification
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
Q is the actual Gamma0(N|D|) coset quotient. The bijection is specified
by gcd(c,D) and cstar*d modulo δ1; those matrix carriers are omitted.
-/
/- Omitted gz86_trace_coset_classification: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-ramified-theta-reindexing — Ramified theta reindexing
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_ramified_theta_reindexing: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-kernel-u-formula — Rankin kernel U formula
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_kernel_u_formula: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-prime-eisenstein-combination — Prime-discriminant Eisenstein formula
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_prime_eisenstein_combination: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-kernel-fourier-expansion — Rankin kernel Fourier expansion
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_kernel_fourier_expansion: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-zero-coefficient — Eisenstein zero coefficient
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_eisenstein_zero_coefficient: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-nonzero-coefficient — Eisenstein nonzero coefficient
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_eisenstein_nonzero_coefficient: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-kernel-meromorphic-continuation — Rankin kernel meromorphic continuation
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
The true conclusion is meromorphic continuation with poles only in the
constant term. Its actual divisor of poles and local uniformity are omitted;
this records the entire nonconstant remainder and agreement on convergence.
-/
/- Omitted gz86_kernel_meromorphic_continuation: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-integral-kernel-values — Integral Rankin kernel values
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_integral_kernel_values: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-central-kernel-holomorphy — Central kernel holomorphy
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_central_kernel_holomorphy: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-coefficient-functional-equation — Kernel coefficient functional equation
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_coefficient_functional_equation: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-reversal — Genus-sign reversal
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_genus_sign_reversal: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-l-functional-equation — Classical L functional equation
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_l_functional_equation: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-central-value-kernel — Classical central-value kernel
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
The packet gives the full Fourier expansion, including the corrected
negative-index σ(-n) in the derivative kernel; that coefficient formula
is separate from this pairing signature.
-/
/- Omitted gz86_central_value_kernel: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-central-derivative-kernel — Classical central-derivative kernel
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
The packet gives the full Fourier expansion, including the corrected
negative-index σ(-n) in the derivative kernel; that coefficient formula
is separate from this pairing signature.
-/
/- Omitted gz86_central_derivative_kernel: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-different-reindexing — Different ideal reindexing
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_different_reindexing: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-sign-multiplicativity — Genus-sign multiplicativity
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_sign_multiplicativity: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sigma-identity — Genus sigma identity
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_genus_sigma_identity: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-logarithmic-prime-decomposition — Logarithmic prime decomposition
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_logarithmic_prime_decomposition: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-prime-coefficient-parity — Logarithmic coefficient parity
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_prime_coefficient_parity: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-single-prime-logarithm — Single-prime logarithm criterion
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
bad is the actual set of vanishing Euler factors, including ramified
genus obstructions, not just the inert divisors of n. The one-factor
coefficient is supplied by logarithmic-prime-decomposition.
-/
/- Omitted gz86_single_prime_logarithm: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.5/classical-weight-two-central-value — Weight-two central-value formula
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_weight_two_central_value: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.5/classical-central-value-endpoints — Central-value endpoint normalization
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
theorem gz86_central_value_endpoints (δ h u t : ℕ) (hu : 0<u) (Rzero rzero : ℚ)
    (hR : Rzero=h/((2 : ℚ)^t*u)) (hr : rzero=1/(2*u)) :
  (2 : ℚ)^t*Rzero=h/u := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.5/classical-genus-sum-filter — Central-value genus-sum filter
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_genus_sum_filter: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-holomorphic-projection — Logarithmic weight-two projection
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
All-cusp logarithmic growth and the invertible cusp system are omitted.
The finite-part Fourier formula is recorded separately in the packet and
the projected-derivative-coefficients signature.
-/
/- Omitted gz86_holomorphic_projection: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-mellin-asymptotics — Eisenstein Mellin asymptotics
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_eisenstein_mellin_asymptotics: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-boundary-eisenstein-cusps — Boundary Eisenstein cusp constants
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_boundary_eisenstein_cusps: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-boundary-eisenstein-orthogonality — Boundary Eisenstein orthogonality
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_boundary_eisenstein_orthogonality: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-cusp-matrix-inverse — Cusp constant matrix inverse
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
The type proof in hd says d i divides N. The packet specifies the
tridiagonal prime-power inverse, including the separate exponent-zero case.
-/
theorem gz86_cusp_matrix_inverse {I : Type*} [Fintype I] [DecidableEq I]
    (N : ℕ) (hN : 0<N) (d : I → N.divisors)
    (hd : Function.Bijective d) :
  Matrix.det (fun i j : I ↦ (Nat.gcd (d j).val (d i).val : ℝ)^2/((d j).val : ℝ)^2)≠0 := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-projection-boundary-coefficients — Projection boundary coefficients
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_projection_boundary_coefficients: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-cusp-constants — Rankin cusp constants
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_rankin_cusp_constants: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-boundary-coefficients — Rankin boundary coefficients
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_rankin_boundary_coefficients: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-mellin-regularization — Rankin Mellin regularization
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_rankin_mellin_regularization: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-projected-derivative-cuspform — Projected Rankin derivative cusp form
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_projected_derivative_cuspform: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.6/classical-projected-derivative-coefficients — Projected Rankin derivative coefficients
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
σneg n denotes σ(-n). The finite part exists by the analytic estimate;
the Filter.lim here uses its punctured real germ, not value at the pole.
-/
/- Omitted gz86_projected_derivative_coefficients: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.3/classical-modular-period-degree — Modular period-degree comparison
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
-/
/- Omitted gz86_modular_period_degree: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.0/classical-twist-real-period — Quadratic-twist real-period comparison
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
The twist period uses omega/sqrt(D), not the minimal Neron differential.
The rational transport scalar must be supplied when changing differentials.
-/
/- Omitted gz86_twist_real_period: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.5/classical-definite-period-announcement — Definite period specialization
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
P,Q are probability periods and alpha is the normalized local-product
form with quaternionic Tamagawa Petersson pairing. No free scalar is chosen.
-/
/- Omitted gz86_definite_period_announcement: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.5/classical-definite-square-class — Definite central-value square class
The named functions, pairings, coefficients and spaces are the actual
source objects. Their modular transformation, level, newness, quadratic
character and growth hypotheses require the MF/CM/TB carriers and are
omitted here. The packet supplies those hypotheses and the full formulas.
These are proposed mathematical signatures, not assertions about arbitrary
functions. No proposition-valued replacement hypotheses are introduced.
M is M_f; normalized L/C equals b x x by the preceding period identity.
-/
theorem gz86_definite_square_class {M V : Type*} [Field M] [AddCommGroup V] [Module M V]
    (b : V →ₗ[M] V →ₗ[M] M) (e x : V) (a : M) (h : x=a • e) :
  b x x=a^2*b e e := by sorry

/-! GrossZagierAndArithmeticHeights:GZ.5/half-weight-waldspurger-value — Half-weight Waldspurger value
b is the d coefficient of the norm-one weight-half Kohnen-plus lift of
parameter r/2. phiNorm is the even level-one Maass Petersson norm; Lhalf
is the finite twisted L-value. Fundamental discriminant, Hecke eigenline,
a(1)=1 and actual Whittaker/Bessel Fourier carriers are omitted. Both
signs of d and both r/2 gamma factors are explicitly retained.
-/
/- Omitted halfWeight_waldspurger: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

/-! GrossZagierAndArithmeticHeights:GZ.7/cm-tensor-stabilizer-height — CM tensor stabilizer height
The true integral diagram is smooth on the coarse model. newAut n is
#Aut(W/pi^(n+1)) minus #Aut(W); ordC is ord(C_x*u_x^k), not ord(C_x).
The actual deformation coordinate, cotangent normalization, tensor and
finite-support hypotheses are omitted. The correction remains at elliptic
points and level primes, as in Conrad Theorem 9.2.
-/
/- Omitted cmTensor_stabilizer_height: The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. See the independent review. -/

end TauCeti.GrossZagier

end NormalizationsAndKernels

noncomputable section HeightAndLogarithmFormulas

open scoped BigOperators TensorProduct

namespace TauCeti.GrossZagier

/-! ## GZ.8 — the χ-isotypic space and the χ-Heegner point -/

section Isotypic

variable {G : Type*} [CommGroup G] {L : Type*} [Field L]
  {V : Type*} [AddCommGroup V] [Module L V] [DistribMulAction G V] [SMulCommClass G L V]

/-- GZ.8/chi-isotypic-mordell-weil-space: `A(χ) = {x | ∀ t, σ_t • x = χ(t)⁻¹ • x}`, the exponent
fixed so that the χ-Heegner point lies in it. In the application `V = A(K^ab)_ℚ ⊗_M L` and `G`
acts through the reciprocity map with the arithmetic Frobenius convention of GZ.0. -/
def chiIsotypic (χ : G →* Lˣ) : Submodule L V where
  carrier := {x | ∀ g : G, g • x = (((χ g)⁻¹ : Lˣ) : L) • x}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

omit [SMulCommClass G L V] in
theorem mem_chiIsotypic_iff (χ : G →* Lˣ) (x : V) :
    x ∈ chiIsotypic χ ↔ ∀ g : G, g • x = (((χ g)⁻¹ : Lˣ) : L) • x :=
  Iff.rfl

/-- The `L`-linear map `x ↦ g • x`. -/
def smulLinear (g : G) : V →ₗ[L] V where
  toFun x := g • x
  map_add' x y := smul_add g x y
  map_smul' c x := smul_comm g c x

/-- `e_χ = |G|⁻¹ Σ_σ χ(σ) • σ`, the projector onto `A(χ)`. -/
def chiProjector [Fintype G] (χ : G →* Lˣ) : V →ₗ[L] V :=
  ((Fintype.card G : L)⁻¹) • ∑ g : G, ((χ g : Lˣ) : L) • smulLinear (L := L) (V := V) g

theorem chiProjector_mem [Fintype G] (hG : (Fintype.card G : L) ≠ 0) (χ : G →* Lˣ) (x : V) :
    chiProjector χ x ∈ chiIsotypic χ := by
  sorry

theorem chiProjector_of_mem [Fintype G] (hG : (Fintype.card G : L) ≠ 0) (χ : G →* Lˣ) {x : V}
    (hx : x ∈ chiIsotypic χ) : chiProjector χ x = x := by
  sorry

/-- `A(1)` is the space of `K`-rational vectors. -/
theorem chiIsotypic_one (x : V) :
    x ∈ chiIsotypic (V := V) (1 : G →* Lˣ) ↔ ∀ g : G, g • x = x := by
  sorry

theorem chiIsotypic_disjoint {χ χ' : G →* Lˣ} (h : χ ≠ χ') :
    chiIsotypic (V := V) χ ⊓ chiIsotypic χ' = ⊥ := by
  sorry

/-- An equivariant linear map preserves the specified character eigenspace. -/
theorem chiIsotypic_map {W : Type*} [AddCommGroup W] [Module L W]
    [DistribMulAction G W] [SMulCommClass G L W] (φ : V →ₗ[L] W)
    (hφ : ∀ (g : G) (x : V), φ (g • x) = g • φ x)
    (χ : G →* Lˣ) {x : V} (hx : x ∈ chiIsotypic χ) :
    φ x ∈ chiIsotypic χ := by
  sorry

/-- `Σ_χ e_χ = 1` when `L` contains the values of all `|G|` characters. -/
theorem sum_chiProjector [Fintype G] (hG : (Fintype.card G : L) ≠ 0) (S : Finset (G →* Lˣ))
    (hS : ∀ χ, χ ∈ S) (hcard : S.card = Fintype.card G) :
    ∑ χ ∈ S, chiProjector (V := V) χ = LinearMap.id := by
  sorry

/-- Unit test: for the trivial character the isotypic space is the fixed space. -/
theorem chiIsotypic_trivial_eq_fixed :
    ((chiIsotypic (V := V) (1 : G →* Lˣ) : Submodule L V) : Set V) = {x | ∀ g : G, g • x = x} := by
  sorry

/-- Unit test: the projectors are orthogonal idempotents. -/
theorem chiProjector_idem [Fintype G] (hG : (Fintype.card G : L) ≠ 0) (χ χ' : G →* Lˣ)
    (h : χ ≠ χ') :
    chiProjector (V := V) χ ∘ₗ chiProjector χ = chiProjector χ ∧
      chiProjector (V := V) χ ∘ₗ chiProjector χ' = 0 := by
  sorry

/-- Unit test (`G = ℤ/2`, `χ(σ) = −1`): a vector negated by `σ` lies in `A(χ)`. -/
theorem chiIsotypic_quadratic_sign (σ : G) (hG : ∀ g : G, g = 1 ∨ g = σ) (χ : G →* Lˣ)
    (hχ : ((χ σ : Lˣ) : L) = -1) (x : V) (hx : σ • x = -x) : x ∈ chiIsotypic χ := by
  sorry

/-- Unit test (non-example): a vector that `σ` neither fixes nor negates lies in neither
eigenspace, so `A(χ)` is not the whole space. -/
theorem chiIsotypic_ne_whole (σ : G) (χ : G →* Lˣ) (hχ : ((χ σ : Lˣ) : L) = -1) (x : V)
    (h1 : σ • x ≠ x) (h2 : σ • x ≠ -x) :
    x ∉ chiIsotypic χ ∧ x ∉ chiIsotypic (1 : G →* Lˣ) := by
  sorry

variable [Fintype G]

/-- GZ.8/chi-heegner-point, finite form: `P⁰_χ(x) = Σ_g χ(g) • (g • x)` (Cai–Shu–Tian §1.2). -/
def heegnerFinite (χ : G →* Lˣ) (x : V) : V :=
  ∑ g : G, ((χ g : Lˣ) : L) • (g • x)

theorem heegnerFinite_smul (χ : G →* Lˣ) (h : G) (x : V) :
    heegnerFinite χ (h • x) = (((χ h)⁻¹ : Lˣ) : L) • heegnerFinite χ x := by
  sorry

theorem heegnerFinite_mem_chiIsotypic (χ : G →* Lˣ) (x : V) :
    heegnerFinite χ x ∈ chiIsotypic χ := by
  sorry

theorem heegnerFinite_one (x : V) :
    heegnerFinite (1 : G →* Lˣ) x = ∑ g : G, g • x := by
  sorry

theorem heegnerFinite_add (χ : G →* Lˣ) (x y : V) :
    heegnerFinite χ (x + y) = heegnerFinite χ x + heegnerFinite χ y := by
  sorry

/-- Scalar linearity, distinct from the group-action formula `heegnerFinite_smul`. -/
theorem heegnerFinite_coeff_smul (χ : G →* Lˣ) (a : L) (x : V) :
    heegnerFinite χ (a • x) = a • heegnerFinite χ x := by
  sorry

theorem heegnerFinite_map {W : Type*} [AddCommGroup W] [Module L W] [DistribMulAction G W]
    [SMulCommClass G L W] (φ : V →ₗ[L] W) (hφ : ∀ (g : G) (x : V), φ (g • x) = g • φ x)
    (χ : G →* Lˣ) (x : V) : φ (heegnerFinite χ x) = heegnerFinite χ (φ x) := by
  sorry

/-- The toric integral of an integrand that factors through the finite quotient `G`, for the
measure of total volume `vol` (= `2 L(1, η)`, erratum-corrected). -/
def heegnerIntegral (vol : L) (χ : G →* Lˣ) (x : V) : V :=
  (vol / Fintype.card G) • heegnerFinite χ x

omit [SMulCommClass G L V] in
theorem heegnerIntegral_eq (vol : L) (χ : G →* Lˣ) (x : V) :
    heegnerIntegral vol χ x = (vol / Fintype.card G) • heegnerFinite χ x :=
  rfl

/-- Gross–Zagier's `c_χ = Σ_σ χ⁻¹(σ) c^σ` is `P⁰_{χ⁻¹}` in this notation. -/
theorem heegnerFinite_inv_eq_gz (χ : G →* Lˣ) (x : V) :
    ∑ g : G, (((χ g)⁻¹ : Lˣ) : L) • (g • x) = heegnerFinite χ⁻¹ x := by
  sorry

/-- Unit test: for the trivial group `P⁰_χ(x) = x`. -/
theorem heegnerFinite_trivial_group [Subsingleton G] (χ : G →* Lˣ) (x : V) :
    heegnerFinite χ x = x := by
  sorry

/-- Unit test: `G = {1, σ}`, `χ(σ) = −1` gives `P⁰_χ(x) = x − σ • x`. -/
theorem heegnerFinite_sign_char (σ : G) (hσ : σ ≠ 1) (hG : ∀ g : G, g = 1 ∨ g = σ)
    (χ : G →* Lˣ) (hχ : ((χ σ : Lˣ) : L) = -1) (x : V) :
    heegnerFinite χ x = x - σ • x := by
  sorry

/-- Unit test (non-example): a `K`-rational vector has no component for a nontrivial character. -/
theorem heegnerFinite_fixed_nontrivial (χ : G →* Lˣ) (hχ : χ ≠ 1) (x : V)
    (hx : ∀ g : G, g • x = x) : heegnerFinite χ x = 0 := by
  sorry

/-- Unit test: for the trivial character the Heegner point is the trace `y_K = Tr_{H/K} P`. -/
theorem heegnerFinite_one_eq_trace (x : V) :
    heegnerFinite (1 : G →* Lˣ) x = Finset.univ.sum fun g : G ↦ g • x := by
  sorry

end Isotypic

/-! ## GZ.8 — the coefficient (L-linear) Néron–Tate pairing -/

section CoeffPairing

variable {M : Type*} [Field M] [Algebra ℚ M]
  {V W : Type*} [AddCommGroup V] [Module M V] [AddCommGroup W] [Module M W]

/-- GZ.8/l-linear-neron-tate-pairing: the unique pairing with values in `ℝ ⊗[ℚ] M`, `M`-linear in
each variable (on `W` through the dual endomorphisms), whose trace is the rational Néron–Tate
pairing `B`. Constructing it needs the nondegeneracy of the trace form, so the body is `sorry`. -/
def coeffPairing (B : V →+ W →+ ℝ) : V →+ W →+ ℝ ⊗[ℚ] M :=
  sorry

theorem trace_coeffPairing [FiniteDimensional ℚ M] (B : V →+ W →+ ℝ)
    (hB : ∀ (m : M) (x : V) (y : W), B (m • x) y = B x (m • y)) (x : V) (y : W) :
    Algebra.trace ℝ (ℝ ⊗[ℚ] M) (coeffPairing B x y) = B x y := by
  sorry

theorem coeffPairing_smul_left [FiniteDimensional ℚ M] (B : V →+ W →+ ℝ)
    (hB : ∀ (m : M) (x : V) (y : W), B (m • x) y = B x (m • y)) (m : M) (x : V) (y : W) :
    coeffPairing B (m • x) y = ((1 : ℝ) ⊗ₜ[ℚ] m) * coeffPairing B x y := by
  sorry

/-- `W` carries the action of `M` by dual endomorphisms `m ↦ m^†`. -/
theorem coeffPairing_smul_right [FiniteDimensional ℚ M] (B : V →+ W →+ ℝ)
    (hB : ∀ (m : M) (x : V) (y : W), B (m • x) y = B x (m • y)) (m : M) (x : V) (y : W) :
    coeffPairing B x (m • y) = ((1 : ℝ) ⊗ₜ[ℚ] m) * coeffPairing B x y := by
  sorry

theorem coeffPairing_galois {Γ : Type*} [Group Γ] [DistribMulAction Γ V] [DistribMulAction Γ W]
    [FiniteDimensional ℚ M] (B : V →+ W →+ ℝ)
    (hB : ∀ (m : M) (x : V) (y : W), B (m • x) y = B x (m • y))
    (hBΓ : ∀ (g : Γ) (x : V) (y : W), B (g • x) (g • y) = B x y)
    (hV : ∀ (g : Γ) (m : M) (x : V), g • m • x = m • g • x)
    (hW : ∀ (g : Γ) (m : M) (y : W), g • m • y = m • g • y) (g : Γ) (x : V) (y : W) :
    coeffPairing (M := M) B (g • x) (g • y) = coeffPairing (M := M) B x y := by
  sorry

theorem coeffPairing_chi_orthogonal {Γ : Type*} [Group Γ] [DistribMulAction Γ V]
    [DistribMulAction Γ W] [FiniteDimensional ℚ M] (B : V →+ W →+ ℝ)
    (hB : ∀ (m : M) (x : V) (y : W), B (m • x) y = B x (m • y))
    (hBΓ : ∀ (g : Γ) (x : V) (y : W), B (g • x) (g • y) = B x y)
    (hV : ∀ (g : Γ) (m : M) (x : V), g • m • x = m • g • x)
    (hW : ∀ (g : Γ) (m : M) (y : W), g • m • y = m • g • y)
    (g : Γ) (a b : M) (x : V) (y : W) (hx : g • x = a • x) (hy : g • y = b • y) (hab : a * b ≠ 1) :
    coeffPairing (M := M) B x y = 0 := by
  sorry

theorem coeffPairing_torsion_left (B : V →+ W →+ ℝ) {x : V} (hx : IsOfFinAddOrder x) (y : W) :
    coeffPairing (M := M) B x y = 0 := by
  sorry

/-- For an elliptic curve (`M = ℚ`) with its principal polarisation the coefficient pairing is
the BSD pairing, the polar form of the canonical height (Tau Ceti's `canonicalHeightQuadratic`;
GZ.0's `bsdHeightPairing`). -/
theorem coeffPairing_elliptic {E : Type*} [AddCommGroup E] [Module ℚ E]
    (Q : QuadraticMap ℤ E ℝ) (B : E →+ E →+ ℝ) (hB : ∀ x y, B x y = QuadraticMap.polar Q x y)
    (x y : E) :
    Algebra.TensorProduct.rid ℚ ℚ ℝ (coeffPairing (M := ℚ) B x y) = QuadraticMap.polar Q x y := by
  sorry

/-- Unit test: for `M = ℚ` the coefficient pairing is the rational pairing. -/
theorem coeffPairing_rat {E F : Type*} [AddCommGroup E] [Module ℚ E] [AddCommGroup F] [Module ℚ F]
    (B : E →+ F →+ ℝ) (x : E) (y : F) :
    coeffPairing (M := ℚ) B x y = B x y ⊗ₜ[ℚ] (1 : ℚ) := by
  sorry

/-- Unit test: in a quadratic field `ℚ(s)`, `s² = 5`, a coefficient pairing `a ⊗ 1 + b ⊗ s` has
trace `2a`, and `⟨s x, y⟩ = 10 b`. -/
theorem coeffPairing_trace_qsqrt5 [FiniteDimensional ℚ M] (hM : Module.finrank ℚ M = 2) (s : M)
    (hs : s ^ 2 = 5) (B : V →+ W →+ ℝ)
    (hB : ∀ (m : M) (x : V) (y : W), B (m • x) y = B x (m • y)) (x : V) (y : W) (a b : ℝ)
    (hxy : coeffPairing B x y = a ⊗ₜ[ℚ] (1 : M) + b ⊗ₜ[ℚ] s) :
    B x y = 2 * a ∧ B (s • x) y = 10 * b := by
  sorry

/-- Unit test: on an elliptic curve the BSD pairing of a point with itself is twice the canonical
height, `⟨P, P⟩ = 2 ĥ(P)` (Tau Ceti's `canonicalHeight`, the `(O)`-normalised height). -/
theorem coeffPairing_eq_bsd {E : Type*} [AddCommGroup E] [Module ℚ E] (Q : QuadraticMap ℤ E ℝ)
    (B : E →+ E →+ ℝ) (hB : ∀ x y, B x y = QuadraticMap.polar Q x y) (x : E) :
    Algebra.TensorProduct.rid ℚ ℚ ℝ (coeffPairing (M := ℚ) B x x) = 2 * Q x := by
  sorry

/-- Unit test (non-example): the rational pairing is not `M`-bilinear: if the coefficient pairing
is `1`, then `⟨x, y⟩ = 2` but `⟨s x, y⟩ = 0`. -/
theorem coeffPairing_not_trace [FiniteDimensional ℚ M] (hM : Module.finrank ℚ M = 2) (s : M)
    (hs : s ^ 2 = 5) (B : V →+ W →+ ℝ)
    (hB : ∀ (m : M) (x : V) (y : W), B (m • x) y = B x (m • y)) (x : V) (y : W)
    (hxy : coeffPairing B x y = (1 : ℝ ⊗[ℚ] M)) :
    B x y = 2 ∧ B (s • x) y = 0 := by
  sorry

end CoeffPairing

/-! ## GZ.8 — the shape of the Yuan–Zhang–Zhang identity -/

section Identity

variable {L : Type*} [Field L] {P : Type*} [AddCommGroup P] [Module L P]
  {Fm : Type*} [AddCommGroup Fm] [Module L Fm]

/-- GZ.8/general-quaternionic-gross-zagier-identity, its linear-algebra core: in a space `S` of
invariant bilinear forms (inside a module `Fm` of forms) of dimension at most one, a nonzero `α` generates, so the height form is
a multiple of `α` and no form is divided by another. The arithmetic identification of the multiple
with `ζ_F(2) L'(1/2, π_A, χ)/(4 L(1, η)² L(1, π_A, ad))` needs L-functions over `K`; it is
omitted. -/
theorem invariant_form_eq_smul (S : Submodule L Fm)
    (hS : Module.finrank L S ≤ 1) [FiniteDimensional L S] (α β : S) (hα : α ≠ 0) :
    ∃ c : L, β = c • α := by
  sorry

/-- GZ.8/vacuous-case: if the space of invariant forms is zero, both sides vanish. -/
theorem invariant_form_eq_zero (S : Submodule L Fm) (hS : S = ⊥) (β : S) :
    β = 0 := by
  sorry

/-- GZ.8/essential-case-root-number: with `ε_v = χ_v(−1)` off `Σ` and `−χ_v(−1)` on `Σ`, and
`∏ χ_v(−1) = 1`, the global sign is `(−1)^{#Σ}`. -/
theorem prod_root_number {ι : Type*} [DecidableEq ι] (T : Finset ι) (Sg : Finset ι)
    (hS : Sg ⊆ T) (ε c : ι → ℤˣ) (hε : ∀ v ∈ T, ε v = if v ∈ Sg then -c v else c v)
    (hc : ∏ v ∈ T, c v = 1) :
    ∏ v ∈ T, ε v = (-1) ^ Sg.card := by
  sorry

/-- GZ.8/nonvanishing-criterion, its formal step: a bilinear form nonzero at `(x, y)` forces
`x ≠ 0`; the Heegner point is nonzero when the right side of the identity is. -/
theorem ne_zero_of_form_ne_zero (β : P →ₗ[L] P →ₗ[L] L) {x y : P} (h : β x y ≠ 0) : x ≠ 0 := by
  sorry

end Identity

/-! ## GZ.8 — admissible orders and test vectors (Cai–Shu–Tian) -/

section TestVector

variable {Bx : Type*} [Group Bx] {L : Type*} [Field L]
  {Vπ : Type*} [AddCommGroup Vπ] [Module L Vπ] [DistribMulAction Bx Vπ] [SMulCommClass Bx L Vπ]

/-- GZ.8/admissible-order-test-vector: admissibility of an order `R` with unit group `U` for
`(π, χ)`, prototyped by the condition `R̂^× ∩ K̂^× = Ô_{c₁}^×` on unit groups (`U ⊓ T = Uc`).
Omitted, because orders of `B_f` and their discriminants are not in the libraries: the
discriminant `N` and the local conditions at `v | (c₁, N)` of Cai–Shu–Tian Definition 1.3. -/
structure TorusUnitIntersection (U T Uc : Subgroup Bx) : Prop where
  inf_torus : U ⊓ T = Uc

/-- `V(π, χ)`: the vectors that are `ω`-eigen under `U` and `χ⁻¹`-eigen under `T₁`
(the product of the `K_v^×`, `v ∈ Σ₁`). -/
def testVectorLine (U : Subgroup Bx) (ω : U →* Lˣ) (T₁ : Subgroup Bx) (χ : T₁ →* Lˣ) :
    Submodule L Vπ where
  carrier := {f | (∀ u : U, (u : Bx) • f = ((ω u : Lˣ) : L) • f) ∧
    ∀ t : T₁, (t : Bx) • f = (((χ t)⁻¹ : Lˣ) : L) • f}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

/-- Membership API for the two eigenconditions; users need not unfold the submodule. -/
theorem mem_testVectorLine_iff (U : Subgroup Bx) (ω : U →* Lˣ)
    (T₁ : Subgroup Bx) (χ : T₁ →* Lˣ) (f : Vπ) :
    f ∈ testVectorLine U ω T₁ χ ↔
      (∀ u : U, (u : Bx) • f = ((ω u : Lˣ) : L) • f) ∧
      ∀ t : T₁, (t : Bx) • f = (((χ t)⁻¹ : Lˣ) : L) • f := by
  sorry

/- Pending arithmetic API: `finrank_testVectorLine` and
`localToric_ne_zero_of_mem_testVectorLine` need an irreducible admissible local representation,
its conductor, a genuinely admissible order and the specified nonzero toric functional with its
root-number condition (CST Proposition 3.7). Arbitrary representations can have a zero or
larger invariant space; an arbitrary bilinear map can be zero. `TorusUnitIntersection` is only
one necessary condition on an admissible order, not that full predicate. -/

/-- The unit-intersection fragment follows from the stated equality. This does not establish
the discriminant and other local conditions for an admissible Eichler order. -/
theorem torusUnitIntersection_of_eq (U T Uc : Subgroup Bx) (h : U ⊓ T = Uc) :
    TorusUnitIntersection U T Uc :=
  ⟨h⟩

/-- Unit test: CST's embedding for `K = ℚ(√−7)`, `N = 11`, `c = 1` sends `(−7 + √−7)/2` to
`!![1, -1; 22, -8]`, which lies in the Eichler order of level 11 (`11 ∣ 22`) and satisfies the
minimal polynomial `X² + 7X + 14` of `(−7 + √−7)/2`. -/
theorem isAdmissibleOrder_eichler_X0 :
    (11 : ℤ) ∣ (!![1, -1; 22, -8] : Matrix (Fin 2) (Fin 2) ℤ) 1 0 ∧
      (!![1, -1; 22, -8] : Matrix (Fin 2) (Fin 2) ℤ) ^ 2 + 7 • !![1, -1; 22, -8] + 14 • 1 = 0 := by
  sorry

/-- Unit test: with trivial `ω` and no `Σ₁`-condition, `V(π, χ)` is the space of `U`-invariants. -/
theorem testVectorLine_unramified (U : Subgroup Bx) (χ : (⊥ : Subgroup Bx) →* Lˣ) (f : Vπ) :
    f ∈ testVectorLine U 1 ⊥ χ ↔ ∀ u : U, (u : Bx) • f = f := by
  sorry

/-- Unit test: a one-dimensional test-vector line makes any two test vectors proportional. -/
theorem testVectorLine_finrank_one (U : Subgroup Bx) (ω : U →* Lˣ) (T₁ : Subgroup Bx)
    (χ : T₁ →* Lˣ) (h : Module.finrank L (testVectorLine (Vπ := Vπ) U ω T₁ χ) = 1) {f g : Vπ}
    (hf : f ∈ testVectorLine U ω T₁ χ) (hg : g ∈ testVectorLine U ω T₁ χ) (h0 : f ≠ 0) :
    ∃ c : L, g = c • f := by
  sorry

/-- Unit test (non-example): a vector fixed by an element `t` of `T₁` with `χ(t) ≠ 1` is not a
test vector, as for the newline at `p | (N, D)` with `χ([𝔭]) = a_p`. -/
theorem newline_not_testVector (U : Subgroup Bx) (ω : U →* Lˣ) (T₁ : Subgroup Bx) (χ : T₁ →* Lˣ)
    (t : T₁) (hχ : χ t ≠ 1) {f : Vπ} (ht : (t : Bx) • f = f) (h0 : f ≠ 0) :
    f ∉ testVectorLine U ω T₁ χ := by
  sorry

end TestVector

/-! ## GZ.9 — the ratio of Petersson norms -/

section Petersson

open UpperHalfPlane MeasureTheory

/-- The weight-two Petersson norm `∫_D |g|² (Im τ)² dμ = ∫_D |g|² dx dy`; it is Tau Ceti's
`UpperHalfPlane.peterssonInner 2 D g g`. -/
def peterssonNorm (D : Set ℍ) (g : ℍ → ℂ) : ℂ :=
  ∫ τ in D, UpperHalfPlane.petersson 2 g g τ

/-- GZ.9/petersson-norm-ratio: `α(f, f_B) = ⟨f, f⟩_{Γ₀(N)} / ⟨f_B, f_B⟩_{Γ₀^B(N⁺)}`, with `D`, `D'`
fundamental domains of `Γ₀(N)` and of the norm-one units of the Eichler order. -/
def peterssonRatio (D D' : Set ℍ) (f fB : ℍ → ℂ) : ℂ :=
  peterssonNorm D f / peterssonNorm D' fB

theorem peterssonRatio_split (D : Set ℍ) (f : ℍ → ℂ) (h : peterssonNorm D f ≠ 0) :
    peterssonRatio D D f f = 1 := by
  sorry

theorem peterssonRatio_smul (D D' : Set ℍ) (f fB : ℍ → ℂ) (u : ℂ) :
    peterssonRatio D D' f (u • fB) = peterssonRatio D D' f fB / (Complex.normSq u : ℂ) := by
  sorry

theorem peterssonRatio_pos (D D' : Set ℍ) (f fB : ℍ → ℂ) (hf : 0 < (peterssonNorm D f).re)
    (hfB : 0 < (peterssonNorm D' fB).re) : 0 < (peterssonRatio D D' f fB).re := by
  sorry

/-- Unit test: `α(f, f) = 1` in the split case. -/
theorem peterssonRatio_self (D : Set ℍ) (f : ℍ → ℂ) (h : peterssonNorm D f ≠ 0) :
    peterssonRatio D D f f = 1 := by
  sorry

/-- Unit test: replacing `f_B` by `2 f_B` divides `α` by 4. -/
theorem peterssonRatio_scale_two (D D' : Set ℍ) (f fB : ℍ → ℂ) :
    peterssonRatio D D' f ((2 : ℂ) • fB) = peterssonRatio D D' f fB / 4 := by
  sorry

/-- Unit test: the numerator is the Petersson norm (Tau Ceti's `peterssonInner 2 D f f`). -/
theorem peterssonRatio_eq_peterssonInner (D D' : Set ℍ) (f fB : ℍ → ℂ)
    (h : peterssonNorm D' fB ≠ 0) :
    peterssonRatio D D' f fB * peterssonNorm D' fB = ∫ τ in D, UpperHalfPlane.petersson 2 f f τ := by
  sorry

/-- Unit test (non-example): for weight two, `|g|²` alone is not invariant — it picks up
`|cz + d|⁴` — so `∫ |g|² dx dy / y²` (JSW's printed normalisation, E3) is not the norm. -/
theorem peterssonRatio_not_dxdy_over_ysq (g : ℍ → ℂ) (τ τ' : ℍ) (c : ℂ) (hc : ‖c‖ ≠ 1)
    (hg : g τ' = c ^ 2 * g τ) (h0 : g τ ≠ 0) : ‖g τ'‖ ^ 2 ≠ ‖g τ‖ ^ 2 := by
  sorry

end Petersson

/-! ## GZ.9 — evaluation fragments; arithmetic BDP signatures pending -/

section BDP

open PowerSeries

variable (R : Type*) [CommRing R] [UniformSpace R]

/- Pending packet APIs: bdpLFunction, bdpLFunction_eval, bdpLFunction_interpolation,
bdpLFunction_eq_of_interpolation, bdpLFunction_eval_one, bdpLFunction_incomplete,
bdpLFunction_period_change and bdpLFunction_eq_sq. These need the specific coefficient DVR
with its complete separated adic topology, the constructed measure, the character branch,
periods and Hecke/newform data. `bdpInterpolatedValue` with body sorry was not a specification
of those values and has been removed. Likewise `hsiehSquareRoot` must be an imported L3h
object, not a private replacement. Density/Weierstrass uniqueness is not valid for an
arbitrary UniformSpace on an abstract DVR. The pending test `bdpLFunction_unique` must use
that actual adic topology and convergence hypotheses. -/

/-- Evaluation at the trivial character reduces to the constant coefficient. This is an
algebraic evaluation test, not a construction of the BDP measure. -/
theorem bdpLFunction_eval_zero [T2Space R] (F : PowerSeries R) :
    PowerSeries.eval₂ (RingHom.id R) 0 F = PowerSeries.constantCoeff F := by
  sorry

/-- Proposed arithmetic test values for 11a1: the independent point counts are still needed
when this is used as a test of a modular-form/elliptic-curve object. -/
theorem bdpLFunction_euler_11a1 :
    (1 + (5 : ℚ) - 1) / 5 = 1 ∧ (1 + (23 : ℚ) - (-1)) / 23 = 25 / 23 := by
  sorry

/-- Only the positive weight/congruence condition. The full interpolation set also needs the
anticyclotomic character, its avatar and the crystalline/conductor conditions. -/
def interpolationWeightCondition (p n : ℕ) : Prop :=
  0 < n ∧ (p - 1) ∣ n

/-- The trivial character has weight zero, so fails this necessary interpolation condition. -/
theorem bdpLFunction_trivial_not_interpolated (p : ℕ) :
    ¬ interpolationWeightCondition p 0 := by
  sorry

-- Example: the trivial-character evaluation of a constant series recovers its value.
example [T2Space R] (a : R) :
    PowerSeries.eval₂ (RingHom.id R) 0 (PowerSeries.C a) = a := by
  sorry

end BDP

/-! ## GZ.9 — Brooks's quaternionic construction -/

section Quaternionic

variable {R : Type*} [CommRing R] {C : Type*} [Fintype C]

/-- GZ.9/quaternionic-bdp-construction (Brooks Proposition 8.9): the value at `χ` is the square of
the `χ⁻¹`-weighted sum over `Cl(O_K)` of the CM values `θ^j f_B^♭(a ⋆ (A, t, ω̂))`. The CM values
come from Serre–Tate expansions on `X_{N⁺,N⁻}`, which the libraries lack; they enter as data. -/
def quaternionicBDP (χinv cmValue : C → R) : R :=
  (∑ a, χinv a * cmValue a) ^ 2

theorem quaternionicBDP_eq_sq_sum (χinv cmValue : C → R) :
    quaternionicBDP χinv cmValue = (∑ a, χinv a * cmValue a) ^ 2 :=
  rfl

/-- Extensionality for the finite-sum fragment, not for a geometric measure. -/
theorem quaternionicBDP_congr (χ₁ χ₂ c₁ c₂ : C → R)
    (hχ : ∀ a, χ₁ a = χ₂ a) (hc : ∀ a, c₁ a = c₂ a) :
    quaternionicBDP χ₁ c₁ = quaternionicBDP χ₂ c₂ := by
  sorry

/-- Brooks Proposition 8.10: congruent CM data give congruent values (continuity). -/
theorem quaternionicBDP_continuous (I : Ideal R) (M : ℕ) (χ₁ χ₂ c₁ c₂ : C → R)
    (hχ : ∀ a, χ₁ a - χ₂ a ∈ I ^ M) (hc : ∀ a, c₁ a - c₂ a ∈ I ^ M) :
    quaternionicBDP χ₁ c₁ - quaternionicBDP χ₂ c₂ ∈ I ^ M := by
  sorry

/-- Changing the Serre–Tate period by `a` multiplies the CM values of weight `w` by `a^w` and the
function by `a^{2w}`. -/
theorem quaternionicBDP_period (a : R) (w : ℕ) (χinv cmValue : C → R) :
    quaternionicBDP χinv (fun c ↦ a ^ w * cmValue c) = a ^ (2 * w) * quaternionicBDP χinv cmValue := by
  sorry

/- Pending `quaternionicBDP_measure`: the CM values must be the Serre–Tate values of
this specific form at the points attached to the evaluating character. With arbitrary CM data,
the omitted original equality would assert that a fixed measure value is both zero and one.
The squared finite sum below tests algebra only; it does not supply the geometric construction,
its continuity across different character weights or its boundedness as a measure. -/

/-- Unit test: class number one leaves one term. -/
theorem quaternionicBDP_sq_sum_one_class [Unique C] (χinv cmValue : C → R) :
    quaternionicBDP χinv cmValue = (χinv default * cmValue default) ^ 2 := by
  sorry

/-- Unit test: the zero form gives zero. -/
theorem quaternionicBDP_zero_form (χinv : C → R) : quaternionicBDP χinv (0 : C → R) = 0 := by
  sorry

/-- Unit test: scaling `f_B` by `c` scales the function by `c²`. -/
theorem quaternionicBDP_scale (c : R) (χinv cmValue : C → R) :
    quaternionicBDP χinv (c • cmValue) = c ^ 2 * quaternionicBDP χinv cmValue := by
  sorry

/-- Unit test (non-example): the value is a square; the unsquared sum is the square-root object. -/
theorem quaternionicBDP_is_square (χinv cmValue : C → R) :
    ∃ s : R, quaternionicBDP χinv cmValue = s ^ 2 :=
  ⟨_, rfl⟩

end Quaternionic

/-! ## GZ.9 — the weight-two formulas -/

section WeightTwo

/-- GZ.9/euler-factor-at-bdp-point: `1 + p − a_p ≠ 0` under the Ramanujan–Hasse bound. -/
theorem euler_factor_ne_zero (p : ℕ) (hp : 2 ≤ p) (a : ℝ) (ha : |a| ≤ 2 * Real.sqrt p) :
    1 + (p : ℝ) - a ≠ 0 := by
  sorry

/-- GZ.9/isogeny-and-differential-compatibility, part (a): a logarithm pulled back along a
homomorphism is the logarithm of the image. Here a logarithm is an additive map to the base and
`hlog` is the defining identity `log_{φ^*ω'} = log_{ω'} ∘ φ`. -/
theorem log_pullback {A A' F : Type*} [AddCommGroup A] [AddCommGroup A'] [AddCommGroup F]
    (φ : A →+ A') (logω' : A' →+ F) (logφω' : A →+ F) (hlog : ∀ x, logφω' x = logω' (φ x)) (x : A) :
    logφω' x = logω' (φ x) :=
  hlog x

/- Pending `bdp_weight_two_formula`: the measure, Euler factor, character values and
logarithms of the Heegner divisors must be attached to the same arithmetic data. Quantifying over
arbitrary E and logs while fixing the measure value would imply 0 = 1. GZ.9 imports GH.1's
Theorem 5.13 and specializes it; it does not reassert that theorem without its hypotheses. -/

/-- The endpoint omitted by the original p ≥ 5 valuation argument: a₅ = −4 gives E₅ = 2. -/
example : (1 + (5 : ℚ) - (-4)) / 5 = 2 := by
  sorry

-- A single CM class with character value 1 and CM value 3 gives the square 9, not 3.
example : quaternionicBDP (fun _ : Unit ↦ (1 : ℚ)) (fun _ ↦ (3 : ℚ)) = 9 := by
  sorry

-- Zero CM data give zero independently of the class-character coefficients.
example {C : Type*} [Fintype C] (χinv : C → ℚ) :
    quaternionicBDP χinv (fun _ ↦ (0 : ℚ)) = 0 := by
  sorry

end WeightTwo

end TauCeti.GrossZagier

end HeightAndLogarithmFormulas
