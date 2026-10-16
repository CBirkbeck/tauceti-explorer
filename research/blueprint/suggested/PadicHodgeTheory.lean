/-
P-adic Hodge theory and geometric comparison: suggested statements.

The full roadmap ../readmes/PadicHodgeTheory.md is definitive: it gives every
target, hypothesis, proof route, source locator, Check, API and definition test.
This file suggests names and signatures on carriers available at the pins.
It contains eight light definitions with real bodies, nineteen theorem
statements and nineteen examples. Theorems with sorry are proposed statements.

Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174
Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369

The coefficient formulas use functions, genuine discrete convolution and the
existing radius-one two-sided restricted-series carrier. thetaDR is evaluation
at level one followed by the map induced by theta[1/p] on its kernel quotient.
Completeness and nonunit instances are explicit hypotheses where required.
The Kummer/Tate definitions are coordinate operations on matrices and fields;
their identities specialize to period normal forms at K = Q_p. For larger K,
Frobenius is semilinear over K0 and only its f-th iterate is linear.
Analytic rings, continuous cohomology, Galois representations, period sheaves
and admissible-module categories remain the full reader targets until their
actual carriers exist. No construction here stands in for one of those.
-/

import Mathlib.Topology.Algebra.InfiniteSum.DiscreteConvolution
import Mathlib.Topology.MetricSpace.Ultra.Basic
import Mathlib.Analysis.Normed.Field.Basic
import Mathlib.NumberTheory.Padics.Complex
import Mathlib.RingTheory.Perfectoid.BDeRham
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import TauCeti.RingTheory.Huber.Restricted.TwoSidedSeries.Convolution
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic

noncomputable section

open Filter Matrix
open scoped Topology DiscreteConvolution

namespace TauCeti.PadicHodge

section AnalyticCoefficients

variable {K : Type*} [NormedField K]

/-- The coefficient convergence condition for analytic Laurent series on I. -/
def laurentConvergesOn (I : Set ℝ) (a : ℤ → K) : Prop :=
  ∀ ρ ∈ I, Tendsto (fun n : ℤ => ‖a n‖ * ρ ^ n) cofinite (𝓝 0)

/-- The real Gauss supremum; its norm properties require convergence and ρ > 0. -/
def gaussNorm (ρ : ℝ) (a : ℤ → K) : ℝ := ⨆ n : ℤ, ‖a n‖ * ρ ^ n

/-- Annulus-foundations/gauss-norm: Cauchy's coefficient bound. -/
theorem norm_coeff_mul_le_gaussNorm {I : Set ℝ} {a : ℤ → K}
    (ha : laurentConvergesOn I a) {ρ : ℝ} (hρ : 0 < ρ) (hρI : ρ ∈ I) (n : ℤ) :
    ‖a n‖ * ρ ^ n ≤ gaussNorm ρ a := by
  sorry

/-- Annulus-foundations/gauss-norm: definiteness on convergent coefficients. -/
theorem gaussNorm_eq_zero_iff {I : Set ℝ} {a : ℤ → K}
    (ha : laurentConvergesOn I a) {ρ : ℝ} (hρ : 0 < ρ) (hρI : ρ ∈ I) :
    gaussNorm ρ a = 0 ↔ a = 0 := by
  sorry

/-- Compatibility with the existing two-sided restricted-series submodule at radius one. -/
theorem laurentConvergesOn_singleton_one (a : ℤ → K) :
    laurentConvergesOn {1} a ↔ a ∈ TauCeti.Huber.twoSidedRestrictedSubmodule K K := by
  sorry

/-- Test: finite Laurent support converges on every set of positive radii. -/
example (I : Set ℝ) (m : ℤ) (c : K) :
    laurentConvergesOn I (fun n => if n = m then c else 0) := by
  sorry

/-- Test: geometric series converges strictly inside the unit circle. -/
example {ρ : ℝ} (hρ : 0 < ρ) (hρ1 : ρ < 1) :
    laurentConvergesOn {ρ} (fun n : ℤ => if 0 ≤ n then (1 : K) else 0) := by
  sorry

/-- Test: the same coefficients fail the unit-circle convergence condition. -/
example : ¬ laurentConvergesOn {1} (fun n : ℤ => if 0 ≤ n then (1 : K) else 0) := by
  sorry

/-- Test gaussNorm.test_one_add_T. -/
example {ρ : ℝ} (hρ : 0 < ρ) :
    gaussNorm ρ (fun n : ℤ => if n = 0 ∨ n = 1 then (1 : K) else 0) = max 1 ρ := by
  sorry

/-- Test gaussNorm.test_constant. -/
example {ρ : ℝ} (hρ : 0 < ρ) (c : K) :
    gaussNorm ρ (fun n : ℤ => if n = 0 then c else 0) = ‖c‖ := by
  sorry

/-- Test gaussNorm.test_not_pointwise: vanishing at T = c does not kill the norm. -/
example (c : K) (hc : c ≠ 0) :
    gaussNorm ‖c‖ (fun n : ℤ => if n = 0 then c else if n = 1 then -1 else 0) = ‖c‖ := by
  sorry

variable [CompleteSpace K] [IsUltrametricDist K]

/-- Annulus-foundations/multiplication: convergence of the genuine discrete convolution. -/
theorem laurentConvergesOn_convolution {I : Set ℝ} (hI : ∀ ρ ∈ I, 0 < ρ)
    {a b : ℤ → K} (ha : laurentConvergesOn I a) (hb : laurentConvergesOn I b) :
    laurentConvergesOn I (a ⋆ᵣ₊ b) := by
  sorry

/-- Annulus-foundations/gauss-norm-multiplicative. -/
theorem gaussNorm_convolution {I : Set ℝ} {a b : ℤ → K}
    (ha : laurentConvergesOn I a) (hb : laurentConvergesOn I b)
    {ρ : ℝ} (hρ : 0 < ρ) (hρI : ρ ∈ I) :
    gaussNorm ρ (a ⋆ᵣ₊ b) = gaussNorm ρ a * gaussNorm ρ b := by
  sorry

end AnalyticCoefficients

section GeometricPeriodRing

variable (p : ℕ) [Fact p.Prime]

/-- R06.1/cp-integers-p-adically-complete, nonunit assertion. -/
theorem cpIntegers_p_not_unit : ¬ IsUnit (p : PadicComplexInt p) := by
  sorry

/-- R06.1/cp-integers-p-adically-complete, completeness assertion. -/
theorem cpIntegers_complete :
    IsAdicComplete (Ideal.span {(p : PadicComplexInt p)}) (PadicComplexInt p) := by
  sorry

/-- R06.1/cp-integers-p-adically-complete, Frobenius assertion. -/
theorem cpIntegers_frobenius_surjective : Function.Surjective
    (fun x : (PadicComplexInt p) ⧸ Ideal.span {(p : PadicComplexInt p)} => x ^ p) := by
  sorry

-- Instances are explicit hypotheses here: no instance is manufactured with a sorry body.
variable [Fact (¬ IsUnit (p : PadicComplexInt p))]
    [IsAdicComplete (Ideal.span {(p : PadicComplexInt p)}) (PadicComplexInt p)]

/-- R06.1/bdr-plus-complete-dvr at C_p, on Mathlib's actual period-ring carrier.
The reader states the full theorem for arbitrary algebraically closed complete C. -/
theorem bdrPlus_complete_dvr :
    ∃ h : IsDomain (BDeRhamPlus (PadicComplexInt p) p),
      @IsDiscreteValuationRing (BDeRhamPlus (PadicComplexInt p) p) inferInstance h := by
  sorry

/-- R06.1/de-rham-period-ring, `thetaDR`: θ_dR is evaluation at level one followed by the map
that θ[1/p] induces on the quotient by its kernel. Its target `Localization.Away p` of 𝓞_ℂ_[p]
is ℂ_[p]; the identification is not restated here. -/
def thetaDR : BDeRhamPlus (PadicComplexInt p) p →+* Localization.Away (p : PadicComplexInt p) :=
  (RingHom.kerLift (fontaineThetaInvertP (PadicComplexInt p) p)).comp
    (AdicCompletion.evalOneₐ (RingHom.ker (fontaineThetaInvertP (PadicComplexInt p) p))).toRingHom

/-- R06.1/de-rham-period-ring, `thetaDR_coe`: θ_dR extends θ[1/p]. -/
theorem thetaDR_coe
    (x : Localization.Away (p : WittVector p (PreTilt (PadicComplexInt p) p))) :
    thetaDR p (AdicCompletion.of (RingHom.ker (fontaineThetaInvertP (PadicComplexInt p) p)) _ x) =
      fontaineThetaInvertP (PadicComplexInt p) p x := by
  sorry

/-- R06.1/de-rham-period-ring, `thetaDR_surjective`. -/
theorem thetaDR_surjective : Function.Surjective (thetaDR p) := by
  sorry

/-- Test thetaDR_teichmuller: θ_dR([x]) = x^♯ for x in the tilt. -/
example (x : PreTilt (PadicComplexInt p) p) :
    thetaDR p (AdicCompletion.of (RingHom.ker (fontaineThetaInvertP (PadicComplexInt p) p)) _
      (algebraMap (WittVector p (PreTilt (PadicComplexInt p) p)) _ (WittVector.teichmuller p x))) =
      algebraMap (PadicComplexInt p) (Localization.Away (p : PadicComplexInt p))
        (PreTilt.untilt x) := by
  sorry

end GeometricPeriodRing

-- P7: the ramified field-of-norms carriers, Sen module, D_dif and B-pair category
-- are README constructions. Their proofs cannot be stated by replacing them
-- with arbitrary vector spaces, formal LaurentSeries or unstructured functions.
-- P8: corrected structural period sheaves, primitive comparisons, local systems
-- and the pro-etale Poincare lemma require the requested sites and sheaf carriers.
-- R06.2--R06.4: period functors, weak admissibility, Colmez--Fontaine, the
-- monodromy bridge, Weil--Deligne recipe and ordinary criteria remain full reader
-- targets until the Galois and filtered-module carriers exist at the pins.

/-! R06.6/kummer-representation: the coordinate matrix of the imported action. -/

/-- Coordinates of an extension action with character `a` and cocycle value `c`. -/
def kummerMatrix {R : Type*} [CommRing R] (a c : R) : Matrix (Fin 2) (Fin 2) R :=
  !![a, c; 0, 1]

/-- The cocycle equation is precisely this multiplication formula. -/
theorem kummerMatrix_mul {R : Type*} [CommRing R] (a c b d : R) :
    kummerMatrix a c * kummerMatrix b d = kummerMatrix (a * b) (c + a * d) := by
  sorry

/-- The determinant realizes the cyclotomic character when `a = χ_p(g)`. -/
theorem kummerMatrix_det {R : Type*} [CommRing R] (a c : R) :
    (kummerMatrix a c).det = a := by
  sorry

/-- Changing the cocycle by a coboundary is a unipotent change of basis. -/
theorem kummerMatrix_coboundary {R : Type*} [CommRing R] (a c b : R) :
    kummerMatrix 1 (-b) * kummerMatrix a c * kummerMatrix 1 b =
      kummerMatrix a (c + (a - 1) * b) := by
  sorry

/-- Test `kummerMatrix_identity`: the identity has zero cocycle. -/
example {R : Type*} [CommRing R] : kummerMatrix (1 : R) 0 = 1 := by
  sorry

/-- Test `kummerMatrix_split`: the zero cocycle is diagonal. -/
example {R : Type*} [CommRing R] (a : R) :
    kummerMatrix a 0 = !![a, 0; 0, 1] := by
  rfl

/-- Test `kummerMatrix_subline`: the character subline and trivial quotient. -/
example {R : Type*} [CommRing R] (a c : R) :
    kummerMatrix a c 0 0 = a ∧ kummerMatrix a c 1 0 = 0 ∧
      kummerMatrix a c 1 1 = 1 := by
  simp [kummerMatrix]

/-- Test `kummerMatrix_cocycle`: the character acts on the second cocycle term. -/
example : kummerMatrix (2 : ℚ) 3 * kummerMatrix 5 7 = kummerMatrix 10 17 := by
  sorry

/-- Test `kummerMatrix_rootChange`: the coboundary has the prescribed sign. -/
example : kummerMatrix (1 : ℚ) (-5) * kummerMatrix 2 3 * kummerMatrix 1 5 =
    kummerMatrix 2 8 := by
  sorry

/-! R06.6/tate-curve-l-invariant and tate-curve-filtered-phi-n-module.
The coordinate pair is `(v_p(q), log_K(q))`, with `log_K(p) = 0`.
The module-level L-invariant is defined in the reader on the existing R06.2
admissible carrier; this quotient is only its coordinate formula for `v ≠ 0`.
-/

/-- The coordinate formula for the normalized Tate L-invariant. -/
noncomputable def tateLInvariant {R : Type*} [Field R] (v ell : R) : R := ell / v

/-- The Frobenius matrix in the covariant Tate normal form. -/
noncomputable def tatePhiMatrix {R : Type*} [Field R] (r : R) :
    Matrix (Fin 2) (Fin 2) R := !![r⁻¹, 0; 0, 1]

/-- The monodromy matrix with `N(y) = v x`. -/
def tateMonodromyMatrix {R : Type*} [CommRing R] (v : R) :
    Matrix (Fin 2) (Fin 2) R := !![0, v; 0, 0]

/-- The generator `y + ell x` of the filtration line. -/
def tateFiltrationVector {R : Type*} [CommRing R] (ell : R) : Fin 2 → R := ![ell, 1]

/-- A common nonzero scaling preserves the invariant. -/
theorem tateLInvariant_scale {R : Type*} [Field R] (v ell c : R)
    (hv : v ≠ 0) (hc : c ≠ 0) :
    tateLInvariant (c * v) (c * ell) = tateLInvariant v ell := by
  sorry

/-- A changed logarithm branch shifts the invariant by its value on `p`. -/
theorem tateLInvariant_branch {R : Type*} [Field R] (v ell b : R) (hv : v ≠ 0) :
    tateLInvariant v (ell + b * v) = tateLInvariant v ell + b := by
  sorry

/-- Isomorphisms of the unframed normal forms are classified by the ratio. -/
theorem tateNormalForm_iso {R : Type*} [Field R] (v ell v' ell' : R)
    (hv : v ≠ 0) (hv' : v' ≠ 0) :
    (∃ a b : R, a ≠ 0 ∧ b ≠ 0 ∧ v * a = b * v' ∧ ell * a = b * ell') ↔
      tateLInvariant v ell = tateLInvariant v' ell' := by
  sorry

/-- The orientation of the period Frobenius–monodromy relation. -/
theorem tateMonodromy_frobenius {R : Type*} [Field R] (r v : R) (hr : r ≠ 0) :
    tateMonodromyMatrix v * tatePhiMatrix r =
      r • (tatePhiMatrix r * tateMonodromyMatrix v) := by
  sorry

/-- Arithmetic Weil–Deligne Frobenius is the inverse of period Frobenius. -/
theorem tateMonodromy_arithmeticFrobenius {R : Type*} [Field R] (r v : R)
    (hr : r ≠ 0) :
    !![r, 0; 0, 1] * tateMonodromyMatrix v =
      r • (tateMonodromyMatrix v * !![r, 0; 0, 1]) := by
  sorry

/-- Test `tateLInvariant_uniformizer`: zero logarithm gives zero invariant. -/
example {R : Type*} [Field R] : tateLInvariant (1 : R) 0 = 0 := by
  simp [tateLInvariant]

/-- Test `tateLInvariant_raw_log`: the invariant is unchanged by a Tate isogeny. -/
example : tateLInvariant (1 : ℚ) 2 = tateLInvariant 2 4 := by
  sorry

/-- Test `tateLInvariant_branch_test`: a branch shift adds its value on `p`. -/
example : tateLInvariant (2 : ℚ) (4 + 3 * 2) = tateLInvariant 2 4 + 3 := by
  sorry

/-- Test `tateFiltrationVector_second`: the line is transverse to `ker N`. -/
example {R : Type*} [CommRing R] (ell : R) :
    tateFiltrationVector ell 0 = ell ∧ tateFiltrationVector ell 1 = 1 := by
  simp [tateFiltrationVector]

/-- Test `tateMonodromy_square`: nilpotent does not mean zero. -/
example : tateMonodromyMatrix (1 : ℚ) * tateMonodromyMatrix 1 = 0 ∧
    tateMonodromyMatrix (1 : ℚ) ≠ 0 := by
  sorry

/-- Test `tatePhiMatrix_det`: covariant Frobenius has reciprocal determinant. -/
example {R : Type*} [Field R] (r : R) : (tatePhiMatrix r).det = r⁻¹ := by
  sorry

/-- Test `tateMonodromy_orientation`: the transposed operator fails the relation. -/
example : (!![(0 : ℚ), 0; 1, 0] * tatePhiMatrix (3 : ℚ)) ≠
    (3 : ℚ) • (tatePhiMatrix (3 : ℚ) * !![(0 : ℚ), 0; 1, 0]) := by
  sorry

end TauCeti.PadicHodge
