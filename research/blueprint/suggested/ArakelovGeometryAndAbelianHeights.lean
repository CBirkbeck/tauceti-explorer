/-
Blueprint suggestion, not a completed formalization.
Job BP-ArakelovGeometryAndAbelianHeights; issue #674.
AI-assisted author: ChatGPT Pro, session cgpt-20260926-6de2.
Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369.
Not compiled in this worker environment. Proof obligations are intentionally explicit.
Signatures and examples record construction obligations, not completed implementation.

Only the represented rank-one floor of R35.1 is proposed. There are no surrogate
predicates for Hodge metrics, semistable models, Faltings heights or comparisons.
The coordinate-free classification, determinant metrics and base extension are gaps.
-/
import Mathlib.NumberTheory.NumberField.ProductFormula
import Mathlib.NumberTheory.NumberField.FractionalIdeal
import Mathlib.RingTheory.ClassGroup.Basic
import Mathlib.RingTheory.FractionalIdeal.Norm
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Tactic.NormNum

open NumberField
open scoped BigOperators nonZeroDivisors

noncomputable section
namespace TauCeti.Arakelov

variable (K : Type*) [Field K] [NumberField K]

/-- R35.1/hermitian-fractional-ideal. A coordinate presentation, NOT an ordinary ideal class.
`logScale` is the logarithm of a norm scale, not of its square. -/
structure HermitianFractionalIdeal where
  ideal : (FractionalIdeal (𝓞 K)⁰ K)ˣ
  logScale : InfinitePlace K → ℝ

namespace HermitianFractionalIdeal
variable {K}

@[ext] theorem ext {L M : HermitianFractionalIdeal K}
    (hI : L.ideal = M.ideal) (hw : ∀ v, L.logScale v = M.logScale v) : L = M := by
  sorry

theorem ideal_ne_zero (L : HermitianFractionalIdeal K) :
    (L.ideal : FractionalIdeal (𝓞 K)⁰ K) ≠ 0 := by
  sorry

/-- R35.1/fiber-norm. A norm on the one-dimensional complex fiber. -/
def fiberNorm (L : HermitianFractionalIdeal K) (v : InfinitePlace K) (z : ℂ) : ℝ :=
  Real.exp (L.logScale v) * ‖z‖

@[simp] theorem fiberNorm_zero (L : HermitianFractionalIdeal K) (v : InfinitePlace K) :
    L.fiberNorm v 0 = 0 := by sorry

@[simp] theorem fiberNorm_one (L : HermitianFractionalIdeal K) (v : InfinitePlace K) :
    L.fiberNorm v 1 = Real.exp (L.logScale v) := by sorry

theorem fiberNorm_mul (L : HermitianFractionalIdeal K) (v : InfinitePlace K) (a z : ℂ) :
    L.fiberNorm v (a * z) = ‖a‖ * L.fiberNorm v z := by sorry

theorem fiberNorm_pos_iff (L : HermitianFractionalIdeal K) (v : InfinitePlace K) (z : ℂ) :
    0 < L.fiberNorm v z ↔ z ≠ 0 := by sorry

@[simp] theorem fiberNorm_conj (L : HermitianFractionalIdeal K) (v : InfinitePlace K) (z : ℂ) :
    L.fiberNorm v (star z) = L.fiberNorm v z := by sorry

theorem fiberNorm_add_le (L : HermitianFractionalIdeal K) (v : InfinitePlace K) (z t : ℂ) :
    L.fiberNorm v (z + t) ≤ L.fiberNorm v z + L.fiberNorm v t := by sorry

/-- R35.1/trivial-line. -/
def trivial (K : Type*) [Field K] [NumberField K] : HermitianFractionalIdeal K :=
  ⟨1, fun _ => 0⟩

@[simp] theorem trivial_ideal : (trivial K).ideal = 1 := by sorry
@[simp] theorem trivial_logScale (v : InfinitePlace K) : (trivial K).logScale v = 0 := by sorry
@[simp] theorem fiberNorm_trivial (v : InfinitePlace K) (z : ℂ) :
    (trivial K).fiberNorm v z = ‖z‖ := by sorry

/-- R35.1/tensor-product. The comparison with tensor products of modules is NOT assumed. -/
def tensor (L M : HermitianFractionalIdeal K) : HermitianFractionalIdeal K :=
  ⟨L.ideal * M.ideal, fun v => L.logScale v + M.logScale v⟩

@[simp] theorem tensor_ideal (L M : HermitianFractionalIdeal K) :
    (tensor L M).ideal = L.ideal * M.ideal := by sorry
@[simp] theorem tensor_logScale (L M : HermitianFractionalIdeal K) (v : InfinitePlace K) :
    (tensor L M).logScale v = L.logScale v + M.logScale v := by sorry

theorem tensor_assoc (L M P : HermitianFractionalIdeal K) :
    tensor (tensor L M) P = tensor L (tensor M P) := by sorry

theorem tensor_comm (L M : HermitianFractionalIdeal K) : tensor L M = tensor M L := by sorry

@[simp] theorem tensor_trivial (L : HermitianFractionalIdeal K) : tensor L (trivial K) = L := by
  sorry

/-- R35.1/dual-line. -/
def dual (L : HermitianFractionalIdeal K) : HermitianFractionalIdeal K :=
  ⟨L.ideal⁻¹, fun v => -L.logScale v⟩

@[simp] theorem dual_ideal (L : HermitianFractionalIdeal K) : (dual L).ideal = L.ideal⁻¹ := by
  sorry
@[simp] theorem dual_logScale (L : HermitianFractionalIdeal K) (v : InfinitePlace K) :
    (dual L).logScale v = -L.logScale v := by sorry
@[simp] theorem dual_dual (L : HermitianFractionalIdeal K) : dual (dual L) = L := by sorry
@[simp] theorem tensor_dual (L : HermitianFractionalIdeal K) :
    tensor L (dual L) = trivial K := by sorry

/-- R35.1/metric-twist. Multiply all norm scales by exp(c). -/
def twist (L : HermitianFractionalIdeal K) (c : ℝ) : HermitianFractionalIdeal K :=
  ⟨L.ideal, fun v => L.logScale v + c⟩

@[simp] theorem twist_ideal (L : HermitianFractionalIdeal K) (c : ℝ) :
    (twist L c).ideal = L.ideal := by sorry
@[simp] theorem twist_zero (L : HermitianFractionalIdeal K) : twist L 0 = L := by sorry

theorem twist_twist (L : HermitianFractionalIdeal K) (a b : ℝ) :
    twist (twist L a) b = twist L (a + b) := by sorry

theorem fiberNorm_twist (L : HermitianFractionalIdeal K) (c : ℝ)
    (v : InfinitePlace K) (z : ℂ) :
    (twist L c).fiberNorm v z = Real.exp c * L.fiberNorm v z := by sorry

/-- R35.1/arithmetic-degree. The sign and complex-place multiplicity are essential. -/
def degree (L : HermitianFractionalIdeal K) : ℝ :=
  -Real.log (FractionalIdeal.absNorm (L.ideal : FractionalIdeal (𝓞 K)⁰ K) : ℝ) -
    ∑ v : InfinitePlace K, (v.mult : ℝ) * L.logScale v

theorem degree_formula (L : HermitianFractionalIdeal K) :
    degree L = -Real.log (FractionalIdeal.absNorm
      (L.ideal : FractionalIdeal (𝓞 K)⁰ K) : ℝ) -
        ∑ v : InfinitePlace K, (v.mult : ℝ) * L.logScale v := by sorry

@[simp] theorem degree_trivial : degree (trivial K) = 0 := by sorry

theorem degree_zeroScale (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) :
    degree (⟨I, fun _ => 0⟩ : HermitianFractionalIdeal K) =
      -Real.log (FractionalIdeal.absNorm (I : FractionalIdeal (𝓞 K)⁰ K) : ℝ) := by sorry

theorem degree_constantScale (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) (c : ℝ) :
    degree (⟨I, fun _ => c⟩ : HermitianFractionalIdeal K) =
      -Real.log (FractionalIdeal.absNorm (I : FractionalIdeal (𝓞 K)⁰ K) : ℝ) -
        (Module.finrank ℚ K : ℝ) * c := by sorry

/-- R35.1/normalized-degree. This does NOT assert field-extension compatibility. -/
def normalizedDegree (L : HermitianFractionalIdeal K) : ℝ :=
  degree L / (Module.finrank ℚ K : ℝ)

theorem normalizedDegree_formula (L : HermitianFractionalIdeal K) :
    normalizedDegree L = degree L / (Module.finrank ℚ K : ℝ) := by sorry

theorem degree_eq_degreeField_mul_normalized (L : HermitianFractionalIdeal K) :
    degree L = (Module.finrank ℚ K : ℝ) * normalizedDegree L := by sorry

@[simp] theorem normalizedDegree_trivial : normalizedDegree (trivial K) = 0 := by sorry

/-- R35.1/change-of-frame. Coordinate x maps to a*x. The new scale has MINUS log(v(a)).
Use the existing principal-ideal homomorphism. This is D-(a) in Schoof's notation. -/
def reframe (L : HermitianFractionalIdeal K) (a : Kˣ) : HermitianFractionalIdeal K :=
  ⟨toPrincipalIdeal (𝓞 K) K a * L.ideal,
    fun v => L.logScale v - Real.log (v (a : K))⟩

@[simp] theorem reframe_ideal (L : HermitianFractionalIdeal K) (a : Kˣ) :
    (reframe L a).ideal = toPrincipalIdeal (𝓞 K) K a * L.ideal := by sorry
@[simp] theorem reframe_logScale (L : HermitianFractionalIdeal K) (a : Kˣ)
    (v : InfinitePlace K) :
    (reframe L a).logScale v = L.logScale v - Real.log (v (a : K)) := by sorry
@[simp] theorem reframe_one (L : HermitianFractionalIdeal K) : reframe L 1 = L := by sorry

theorem reframe_reframe (L : HermitianFractionalIdeal K) (a b : Kˣ) :
    reframe (reframe L a) b = reframe L (b * a) := by sorry

@[simp] theorem reframe_inverse (L : HermitianFractionalIdeal K) (a : Kˣ) :
    reframe (reframe L a) a⁻¹ = L := by sorry

/-- R35.1/frame-norm. Fiberwise isometry, including the zero coordinate. -/
theorem fiberNorm_reframe (L : HermitianFractionalIdeal K) (a : Kˣ)
    (v : InfinitePlace K) (z : ℂ) :
    (reframe L a).fiberNorm v (v.embedding (a : K) * z) = L.fiberNorm v z := by sorry

/-- R35.1/frame-linear-equivalence. An actual map between actual lattice modules.
The proof must show membership in aI, including for a which is not integral. -/
def frameLinearEquiv (L : HermitianFractionalIdeal K) (a : Kˣ) :
    L.ideal.val ≃ₗ[𝓞 K] (reframe L a).ideal.val := by
  sorry

theorem coe_frameLinearEquiv (L : HermitianFractionalIdeal K) (a : Kˣ) (x : L.ideal.val) :
    (frameLinearEquiv L a x : K) = (a : K) * (x : K) := by sorry

theorem coe_frameLinearEquiv_symm (L : HermitianFractionalIdeal K) (a : Kˣ)
    (x : (reframe L a).ideal.val) :
    ((frameLinearEquiv L a).symm x : K) = ((a⁻¹ : Kˣ) : K) * (x : K) := by sorry

theorem frameLinearEquiv_norm (L : HermitianFractionalIdeal K) (a : Kˣ)
    (v : InfinitePlace K) (x : L.ideal.val) :
    (reframe L a).fiberNorm v (v.embedding (frameLinearEquiv L a x : K)) =
      L.fiberNorm v (v.embedding (x : K)) := by sorry

/-- Elementwise formulation avoids an unmentioned transport of the codomain. -/
theorem frameLinearEquiv_one (L : HermitianFractionalIdeal K) (x : L.ideal.val) :
    (frameLinearEquiv L 1 x : K) = (x : K) := by sorry

/-- R35.1/tensor-norm. -/
theorem fiberNorm_tensor (L M : HermitianFractionalIdeal K) (v : InfinitePlace K) (z t : ℂ) :
    (tensor L M).fiberNorm v (z * t) = L.fiberNorm v z * M.fiberNorm v t := by sorry

/-- R35.1/degree-tensor. -/
theorem degree_tensor (L M : HermitianFractionalIdeal K) :
    degree (tensor L M) = degree L + degree M := by sorry

/-- R35.1/degree-dual. -/
theorem degree_dual (L : HermitianFractionalIdeal K) : degree (dual L) = -degree L := by sorry

/-- R35.1/degree-twist. -/
theorem degree_twist (L : HermitianFractionalIdeal K) (c : ℝ) :
    degree (twist L c) = degree L - (Module.finrank ℚ K : ℝ) * c := by sorry

/-- R35.1/degree-frame-invariance.
Apply FractionalIdeal.absNorm_span_singleton and InfinitePlace.prod_eq_abs_norm.
There is no new product-formula target. -/
theorem degree_reframe (L : HermitianFractionalIdeal K) (a : Kˣ) :
    degree (reframe L a) = degree L := by sorry

/-- R35.1/degree-zero-normalization. PLUS degree/d is the norm-twist parameter. -/
def normalize (L : HermitianFractionalIdeal K) : HermitianFractionalIdeal K :=
  twist L (normalizedDegree L)

@[simp] theorem normalize_ideal (L : HermitianFractionalIdeal K) :
    (normalize L).ideal = L.ideal := by sorry
@[simp] theorem degree_normalize (L : HermitianFractionalIdeal K) : degree (normalize L) = 0 := by
  sorry
@[simp] theorem normalize_normalize (L : HermitianFractionalIdeal K) :
    normalize (normalize L) = normalize L := by sorry

theorem normalize_of_degree_eq_zero (L : HermitianFractionalIdeal K) (h : degree L = 0) :
    normalize L = L := by sorry

/-- R35.1/frame-setoid. The relation has an actual scalar witness and full metric formula. -/
def frameSetoid (K : Type*) [Field K] [NumberField K] : Setoid (HermitianFractionalIdeal K) where
  r L M := ∃ a : Kˣ, reframe L a = M
  iseqv := by sorry

theorem frameSetoid_iff (L M : HermitianFractionalIdeal K) :
    (frameSetoid K).Rel L M ↔ ∃ a : Kˣ,
      M.ideal = toPrincipalIdeal (𝓞 K) K a * L.ideal ∧
      ∀ v, M.logScale v = L.logScale v - Real.log (v (a : K)) := by sorry

theorem frameSetoid_refl (L : HermitianFractionalIdeal K) : (frameSetoid K).Rel L L := by sorry

theorem frameSetoid_symm (L M : HermitianFractionalIdeal K)
    (h : (frameSetoid K).Rel L M) : (frameSetoid K).Rel M L := by sorry

theorem frameSetoid_trans (L M P : HermitianFractionalIdeal K)
    (h : (frameSetoid K).Rel L M) (h' : (frameSetoid K).Rel M P) :
    (frameSetoid K).Rel L P := by sorry

end HermitianFractionalIdeal

/-- R35.1/hermitian-ideal-class. No equivalence with all metrized sheaves is asserted. -/
def HermitianIdealClass (K : Type*) [Field K] [NumberField K] :=
  Quotient (HermitianFractionalIdeal.frameSetoid K)

namespace HermitianIdealClass
open HermitianFractionalIdeal
variable {K}

def classOf (L : HermitianFractionalIdeal K) : HermitianIdealClass K := Quotient.mk _ L

theorem classOf_eq_iff (L M : HermitianFractionalIdeal K) :
    classOf L = classOf M ↔ (frameSetoid K).Rel L M := by sorry

@[elab_as_elim] theorem class_induction {P : HermitianIdealClass K → Prop}
    (h : ∀ L, P (classOf L)) (x : HermitianIdealClass K) : P x := by sorry

@[simp] theorem classOf_reframe (L : HermitianFractionalIdeal K) (a : Kˣ) :
    classOf (reframe L a) = classOf L := by sorry

/-- R35.1/class-degree. Lift an actual numerical function, with its invariance obligation. -/
def classDegree : HermitianIdealClass K → ℝ :=
  Quotient.lift degree (by sorry)

@[simp] theorem classDegree_classOf (L : HermitianFractionalIdeal K) :
    classDegree (classOf L) = degree L := by sorry

theorem classDegree_div_finrank (L : HermitianFractionalIdeal K) :
    classDegree (classOf L) / (Module.finrank ℚ K : ℝ) = normalizedDegree L := by sorry

theorem classDegree_unique (f : HermitianIdealClass K → ℝ)
    (h : ∀ L, f (classOf L) = degree L) : f = classDegree := by sorry

/-- R35.1/forget-metric. Reuse the ordinary class group rather than reconstruct it. -/
def forgetMetric : HermitianIdealClass K → ClassGroup (𝓞 K) :=
  Quotient.lift (fun L => ClassGroup.mk K L.ideal) (by sorry)

@[simp] theorem forgetMetric_classOf (L : HermitianFractionalIdeal K) :
    forgetMetric (classOf L) = ClassGroup.mk K L.ideal := by sorry

@[simp] theorem forgetMetric_twist (L : HermitianFractionalIdeal K) (c : ℝ) :
    forgetMetric (classOf (twist L c)) = forgetMetric (classOf L) := by sorry

@[simp] theorem forgetMetric_trivial : forgetMetric (classOf (trivial K)) = 1 := by sorry

/-- R35.1/metric-distinction. The metric cannot be erased by the class construction. -/
theorem uniformMetrics_eq_iff (c e : ℝ) :
    classOf (twist (trivial K) c) = classOf (twist (trivial K) e) ↔ c = e := by sorry

theorem forgetMetric_not_injective : ¬Function.Injective (forgetMetric (K := K)) := by sorry

end HermitianIdealClass

/-! Proposed unit tests. These are theorem obligations, not reports of executed tests.
Some are shared between a constructor and its consumer. Numeric checks in the handoff
are independent arithmetic checks and do not substitute for these Lean proofs. -/
namespace Tests
open HermitianFractionalIdeal HermitianIdealClass
variable {K}

-- Representation: unitPresentation, sameIdealDifferentMetric, zeroIdealExcluded.
example : (trivial K).ideal = 1 := by sorry
example (c : ℝ) (hc : c ≠ 0) :
    (⟨1, fun _ => c⟩ : HermitianFractionalIdeal K) ≠ trivial K := by sorry
example (L : HermitianFractionalIdeal K) : (L.ideal : FractionalIdeal (𝓞 K)⁰ K) ≠ 0 := by sorry

-- Fiber norms: trivialFiber, scaleTwo, complexPlaceNoExtraWeight.
example (v : InfinitePlace K) (z : ℂ) : (trivial K).fiberNorm v z = ‖z‖ := by sorry
example (v : InfinitePlace K) :
    (⟨1, fun _ => Real.log 2⟩ : HermitianFractionalIdeal K).fiberNorm v 1 = 2 := by sorry
example (v : InfinitePlace K) (_hv : v.IsComplex) : (trivial K).fiberNorm v 1 = 1 := by sorry

-- Trivial object: unitVector, zeroVector, trivialNotScaled.
example (v : InfinitePlace K) : (trivial K).fiberNorm v 1 = 1 := by sorry
example (v : InfinitePlace K) : (trivial K).fiberNorm v 0 = 0 := by sorry
example : trivial K ≠ (⟨1, fun _ => Real.log 2⟩ : HermitianFractionalIdeal K) := by sorry

-- Tensor: tensorUnit, addLogScales, principalIdealProduct.
example (L : HermitianFractionalIdeal K) : tensor L (trivial K) = L := by sorry
example (c e : ℝ) : tensor (twist (trivial K) c) (twist (trivial K) e) =
    twist (trivial K) (c + e) := by sorry
example (a b : Kˣ) :
    (tensor (⟨toPrincipalIdeal (𝓞 K) K a, fun _ => 0⟩ : HermitianFractionalIdeal K)
      ⟨toPrincipalIdeal (𝓞 K) K b, fun _ => 0⟩).ideal =
        toPrincipalIdeal (𝓞 K) K (a * b) := by sorry

-- Dual: dualUnit, dualScaleTwo, dualEvaluation.
example : dual (trivial K) = trivial K := by sorry
example (v : InfinitePlace K) : (dual (twist (trivial K) (Real.log 2))).fiberNorm v 1 =
    (1 / 2 : ℝ) := by sorry
example (L : HermitianFractionalIdeal K) (v : InfinitePlace K) (z : ℂ) (hz : z ≠ 0) :
    L.fiberNorm v z * (dual L).fiberNorm v z⁻¹ = 1 := by sorry

-- Twists: identityTwist, metricDoubles, notIdealScaling.
example (L : HermitianFractionalIdeal K) : twist L 0 = L := by sorry
example (L : HermitianFractionalIdeal K) (v : InfinitePlace K) (z : ℂ) :
    (twist L (Real.log 2)).fiberNorm v z = 2 * L.fiberNorm v z := by sorry
example (L : HermitianFractionalIdeal K) (c : ℝ) : (twist L c).ideal = L.ideal := by sorry

-- Arithmetic degree: rationalTwoIdeal, unitScaleTwo, complexWeightTwo.
-- toPrincipalIdeal is an existing library map. This uses the actual ring of integers of Q.
example : degree (⟨toPrincipalIdeal (𝓞 ℚ) ℚ (Units.mk0 2 (by norm_num)), fun _ => 0⟩ :
    HermitianFractionalIdeal ℚ) = -Real.log 2 := by sorry
example : degree (twist (trivial ℚ) (Real.log 2)) = -Real.log 2 := by sorry
example (hcard : Fintype.card (InfinitePlace K) = 1) (hmult : ∀ v : InfinitePlace K, v.mult = 2) :
    degree (twist (trivial K) (Real.log 2)) = -2 * Real.log 2 := by sorry

-- Normalized degree: degreeOne, imaginaryQuadraticScaling, uniformMetricNormalization.
example (L : HermitianFractionalIdeal ℚ) : normalizedDegree L = degree L := by sorry
example (_hcard : Fintype.card (InfinitePlace K) = 1)
    (_hmult : ∀ v : InfinitePlace K, v.mult = 2) :
    normalizedDegree (twist (trivial K) (Real.log 2)) = -Real.log 2 := by sorry
example (c : ℝ) : normalizedDegree (twist (trivial K) c) = -c := by sorry

-- Reframing: rationalReframeTwo, negativeOneFrame, wrongSignRejected.
example : reframe (trivial ℚ) (Units.mk0 2 (by norm_num)) =
    (⟨toPrincipalIdeal (𝓞 ℚ) ℚ (Units.mk0 2 (by norm_num)), fun _ => -Real.log 2⟩ :
      HermitianFractionalIdeal ℚ) := by sorry
example (L : HermitianFractionalIdeal K) : reframe L (-1) = L := by sorry
example : degree (⟨toPrincipalIdeal (𝓞 ℚ) ℚ (Units.mk0 2 (by norm_num)),
    fun _ => Real.log 2⟩ : HermitianFractionalIdeal ℚ) = -2 * Real.log 2 := by sorry

-- Integral change of coordinate: nonIntegralScalar, inverseMap, twoFrameNorm.
example (L : HermitianFractionalIdeal ℚ) (x : L.ideal.val) :
    (frameLinearEquiv L (Units.mk0 (1/2) (by norm_num)) x : ℚ) = (1/2) * (x : ℚ) := by sorry
example (L : HermitianFractionalIdeal K) (a : Kˣ) (x : L.ideal.val) :
    (frameLinearEquiv L a).symm (frameLinearEquiv L a x) = x := by sorry
example (v : InfinitePlace ℚ) :
    (reframe (trivial ℚ) (Units.mk0 2 (by norm_num))).fiberNorm v 2 = 1 := by sorry

-- Normalization: alreadyDegreeZero, idealOnlyNormalization, normalizationQTwo.
example (L : HermitianFractionalIdeal K) (h : degree L = 0) : normalize L = L := by sorry
example (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) (v : InfinitePlace K) :
    (normalize (⟨I, fun _ => 0⟩ : HermitianFractionalIdeal K)).logScale v =
      -Real.log (FractionalIdeal.absNorm (I : FractionalIdeal (𝓞 K)⁰ K) : ℝ) /
        (Module.finrank ℚ K : ℝ) := by sorry
example : normalize (⟨toPrincipalIdeal (𝓞 ℚ) ℚ (Units.mk0 2 (by norm_num)), fun _ => 0⟩ :
    HermitianFractionalIdeal ℚ) = reframe (trivial ℚ) (Units.mk0 2 (by norm_num)) := by sorry

-- Setoid: rationalCoordinateChange, differentOrdinaryClasses, nonzeroUniformTwist.
example : (frameSetoid ℚ).Rel (trivial ℚ)
    (reframe (trivial ℚ) (Units.mk0 2 (by norm_num))) := by sorry
example (L M : HermitianFractionalIdeal K) (h : ClassGroup.mk K L.ideal ≠ ClassGroup.mk K M.ideal) :
    ¬(frameSetoid K).Rel L M := by sorry
example (c : ℝ) (hc : c ≠ 0) : ¬(frameSetoid K).Rel (trivial K) (twist (trivial K) c) := by sorry

-- Classes: classReframeTwo, metricIsNotForgotten, surjectiveRepresentatives.
example : classOf (trivial ℚ) =
    classOf (reframe (trivial ℚ) (Units.mk0 2 (by norm_num))) := by sorry
example : classOf (trivial K) ≠ classOf (twist (trivial K) 1) := by sorry
example (x : HermitianIdealClass K) : ∃ L, classOf L = x := by sorry

-- Descended degree: degreeTrivialClass, reframedClassDegree, twistedClassDegree.
example : classDegree (classOf (trivial K)) = 0 := by sorry
example : classDegree (classOf (reframe (trivial ℚ) (Units.mk0 2 (by norm_num)))) = 0 := by sorry
example (c : ℝ) : classDegree (classOf (twist (trivial K) c)) =
    -(Module.finrank ℚ K : ℝ) * c := by sorry

-- Forgetful map: principalMapsToUnit, reframeWellDefined, scaledTrivialSameImage.
example (a : Kˣ) (w : InfinitePlace K → ℝ) :
    forgetMetric (classOf (⟨toPrincipalIdeal (𝓞 K) K a, w⟩ : HermitianFractionalIdeal K)) = 1 := by
  sorry
example (L : HermitianFractionalIdeal K) (a : Kˣ) :
    forgetMetric (classOf (reframe L a)) = forgetMetric (classOf L) := by sorry
example : forgetMetric (classOf (trivial K)) = forgetMetric (classOf (twist (trivial K) 1)) ∧
    classOf (trivial K) ≠ classOf (twist (trivial K) 1) := by sorry

end Tests
end TauCeti.Arakelov
