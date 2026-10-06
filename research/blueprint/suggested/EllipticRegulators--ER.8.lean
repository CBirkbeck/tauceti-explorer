import Mathlib.LinearAlgebra.BilinearForm.Basic
import Mathlib.GroupTheory.FreeAbelianGroup
import Mathlib.Basic.Real.Basic
import Mathlib.AlgebraicGeometry.EllipticCurve.DivisionPolynomial.Basic
import TauCeti.AlgebraicGeometry.EllipticCurve.Affine.FunctionField.GenericPoint
import TauCeti.AlgebraicGeometry.EllipticCurve.Affine.FunctionField.TorsionDivisor

/-!
This file is not the roadmap and is not exhaustive. The accompanying roadmap document is
definitive. These statements suggest Lean forms so contributors and reviewers converge on
names and signatures. Every new proof is a planning placeholder.

Scope: EllipticRegulators ER.8, continuing the accepted parent packet. General K-theory,
Coleman integration, syntomic/étale regulators, CM uniformisation and refined p-adic
distributions are imported from their owners. They are not defined here.

The scalar and rational-scalar predicate below are algebraic coordinate calculations.
The quadratic symbol below really uses the existing elliptic function field and the free
abelian group before the imported symbol quotient. Finite residue-table tests evaluate
that raw representative; they do not postulate a tame map on all K₂. The geometric
comparison and certificate signatures that cannot yet be stated are identified at the end.
-/

noncomputable section

namespace TauCeti.EllipticRegulator.ER8

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

section Quadratic

open WeierstrassCurve WeierstrassCurve.Affine
open TauCeti.AlgebraicGeometry

variable (K : Type*) [Field K] [CharZero K]

/-- The explicit curve data of ER.8/quadratic-corrected-symbol. -/
def curve36 : WeierstrassCurve K := ⟨0,0,0,0,1⟩

instance curve36_isElliptic : (curve36 K).IsElliptic := by sorry

abbrev FF36 := (curve36 K).toAffine.FunctionField

variable {K}

def quadraticEll (zeta : K) : FF36 K :=
  (curve36 K).toAffine.genericY -
    2 * algebraMap K (FF36 K) (zeta ^ 2) * (curve36 K).toAffine.genericX + 1

def quadraticSecant (zeta : K) : FF36 K :=
  (curve36 K).toAffine.genericY -
    algebraMap K (FF36 K) (zeta ^ 2) * (curve36 K).toAffine.genericX - 1

def quadraticEllUnit (zeta : K) (_hzeta : zeta ^ 2 + zeta + 1 = 0) : (FF36 K)ˣ := by sorry

theorem quadraticEllUnit_val (zeta : K) (hzeta : zeta ^ 2 + zeta + 1 = 0) :
    (quadraticEllUnit zeta hzeta).val = quadraticEll zeta := by sorry

def quadraticXUnit : (FF36 K)ˣ := by sorry

theorem quadraticXUnit_val : (quadraticXUnit (K := K)).val =
    (curve36 K).toAffine.genericX := by sorry

def quadraticFunctionT (zeta : K) (_hzeta : zeta ^ 2 + zeta + 1 = 0) : (FF36 K)ˣ := by sorry

def quadraticFunctionA : (FF36 K)ˣ := by sorry

def quadraticFunctionB : (FF36 K)ˣ := by sorry

theorem quadraticFunctionT_val (zeta : K) (hzeta : zeta ^ 2 + zeta + 1 = 0) :
    (quadraticFunctionT zeta hzeta).val =
      (quadraticEll zeta)^2 * (quadraticSecant zeta)^2 /
        ((algebraMap K (FF36 K) (zeta^2) * (curve36 K).toAffine.genericX)^2 *
          (algebraMap K (FF36 K) (zeta^2) * (curve36 K).toAffine.genericX + 1)) := by sorry

theorem quadraticFunctionA_val : (quadraticFunctionA (K := K)).val =
    ((curve36 K).toAffine.genericY - 1)^2 := by sorry

theorem quadraticFunctionB_val : (quadraticFunctionB (K := K)).val =
    ((curve36 K).toAffine.genericY + 1)^2 := by sorry

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

end TauCeti.EllipticRegulator.ER8
