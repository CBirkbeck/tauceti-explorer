/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These statements suggest Lean forms so contributors and reviewers
converge on names and signatures. This file types the local metric, density, parameter-volume, distribution,
Hessian and function-field-gonality contracts. It is not an exhaustive suggested
file: the packet records the omitted global carrier-dependent signatures.
No record assumes a desired volume or gonality estimate.

The imported Tau Ceti source statements were checked at f790474. The shared
elaboration build has Mathlib 082e2d3, and all 55 transitive Tau Ceti source
imports match f790474. No current upstream build is run here.
-/
import TauCeti.Analysis.Complex.Conformal.Poincare.SchwarzPick
import TauCeti.Analysis.Complex.Conformal.Hyperbolic.ClosedForm
import TauCeti.Analysis.Complex.UpperHalfPlane.DiscCoordinate
import Mathlib.Analysis.Complex.UpperHalfPlane.Measure
import Mathlib.Analysis.SpecialFunctions.PolarCoord
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Inverse
import Mathlib.MeasureTheory.Function.Jacobian
import Mathlib.Analysis.Distribution.Distribution
import Mathlib.Analysis.Normed.Module.Alternating.Basic
import Mathlib.Analysis.Matrix.PosDef
import Mathlib.Data.EReal.Basic
import TauCeti.FieldTheory.FunctionField.RiemannRoch.Genus

noncomputable section
open MeasureTheory Set Filter
open scoped ENNReal ComplexOrder
namespace TauCeti.HyperbolicVolumes

-- HyperbolicCurveVolumesAndGonality:HV.0/curvature-one-distance
noncomputable def distOne (z w : Complex.UnitDisc) : ℝ :=
  2 * dist (Complex.UnitDisc.toPoincare z) (Complex.UnitDisc.toPoincare w)

theorem distOne_nonneg (z w : Complex.UnitDisc) : 0 ≤ distOne z w := by
  sorry

theorem distOne_comm (z w : Complex.UnitDisc) : distOne z w = distOne w z := by
  sorry

theorem distOne_triangle (z w v : Complex.UnitDisc) : distOne z v ≤ distOne z w + distOne w v := by
  sorry

theorem distOne_map_le (F : Complex.UnitDisc → Complex.UnitDisc) (f : ℂ → ℂ) (hf : DifferentiableOn ℂ f (Metric.ball (0 : ℂ) 1)) (hrep : ∀ z : Complex.UnitDisc, (F z : ℂ) = f (z : ℂ)) (z w : Complex.UnitDisc) : distOne (F z) (F w) ≤ distOne z w := by
  sorry

theorem distOne_isometry (F : TauCeti.PoincareDisc → TauCeti.PoincareDisc) (h : Isometry F) (z w : Complex.UnitDisc) : 2 * dist (F (Complex.UnitDisc.toPoincare z)) (F (Complex.UnitDisc.toPoincare w)) = distOne z w := by
  sorry

-- TauCeti.HyperbolicVolumes.distOne_zero
example : distOne 0 0 = 0 := by
  sorry

-- TauCeti.HyperbolicVolumes.distOne_origin
example (z : Complex.UnitDisc) : distOne z 0 = 2 * Real.artanh ‖(z : ℂ)‖ := by
  sorry

-- TauCeti.HyperbolicVolumes.distOne_factor_two
example (z w : Complex.UnitDisc) : distOne z w = 2 * dist (Complex.UnitDisc.toPoincare z) (Complex.UnitDisc.toPoincare w) := by
  sorry


-- HyperbolicCurveVolumesAndGonality:HV.0/cayley-distance
theorem cayley_distOne (a z : UpperHalfPlane) :
    distOne (UpperHalfPlane.discCoordinateEquiv a z) 0 = dist z a := by
  sorry


-- HyperbolicCurveVolumesAndGonality:HV.0/disc-balls
def radialBall (r : ℝ) : Set ℂ := {z | ‖z‖ < Real.tanh (r / 2)}

theorem radialBall_mem (z : ℂ) (r : ℝ) : z ∈ radialBall r ↔ ‖z‖ < Real.tanh (r / 2) := by
  sorry

theorem radialBall_mono {r R : ℝ} (h : r ≤ R) : radialBall r ⊆ radialBall R := by
  sorry

theorem radialBall_subset_disc (r : ℝ) : radialBall r ⊆ Metric.ball (0 : ℂ) 1 := by
  sorry

-- TauCeti.HyperbolicVolumes.radialBall_zero
example : radialBall 0 = ∅ := by
  sorry

-- TauCeti.HyperbolicVolumes.radialBall_metric
example (z : Complex.UnitDisc) (r : ℝ) : (z : ℂ) ∈ radialBall r ↔ distOne z 0 < r := by
  sorry

-- TauCeti.HyperbolicVolumes.radialBall_center
example (r : ℝ) : (0 : ℂ) ∈ radialBall r ↔ 0 < r := by
  sorry


-- HyperbolicCurveVolumesAndGonality:HV.0/disc-area-density
noncomputable def areaDensity (z : ℂ) : ℝ := 4 / (1 - ‖z‖ ^ 2) ^ 2

theorem areaDensity_pos {z : ℂ} (hz : ‖z‖ < 1) : 0 < areaDensity z := by
  sorry

theorem areaDensity_conj (z : ℂ) : areaDensity (star z) = areaDensity z := by
  sorry

theorem areaDensity_moebius (a z : Complex.UnitDisc) : areaDensity (((z : ℂ) - (a : ℂ)) / (1 - star (a : ℂ) * (z : ℂ))) * ‖(1 - ‖(a : ℂ)‖ ^ 2 : ℂ) / (1 - star (a : ℂ) * (z : ℂ)) ^ 2‖ ^ 2 = areaDensity (z : ℂ) := by
  sorry

theorem areaDensity_rotation (u : Circle) (z : ℂ) : areaDensity ((u : ℂ) * z) = areaDensity z := by
  sorry

-- TauCeti.HyperbolicVolumes.areaDensity_origin
example : areaDensity 0 = 4 := by
  sorry

-- TauCeti.HyperbolicVolumes.areaDensity_half
example : areaDensity (1 / 2 : ℂ) = 64 / 9 := by
  sorry

-- TauCeti.HyperbolicVolumes.areaDensity_not_tau_scale
example : areaDensity 0 ≠ 1 := by
  sorry


-- HyperbolicCurveVolumesAndGonality:HV.0/disc-area-measure
noncomputable def discAreaMeasure : Measure ℂ :=
  (volume.restrict (Metric.ball (0 : ℂ) 1)).withDensity (fun z => ENNReal.ofReal (areaDensity z))

theorem discAreaMeasure_apply (S : Set ℂ) (hS : MeasurableSet S) (hSD : S ⊆ Metric.ball (0 : ℂ) 1) : discAreaMeasure S = ∫⁻ z in S, ENNReal.ofReal (areaDensity z) := by
  sorry

theorem discAreaMeasure_rotation (u : Circle) (S : Set ℂ) (hS : MeasurableSet S) : discAreaMeasure (Set.image (fun z => (u : ℂ) * z) S) = discAreaMeasure S := by
  sorry

theorem discAreaMeasure_finite_subdisc {t : ℝ} (ht : t < 1) : discAreaMeasure (Metric.closedBall (0 : ℂ) t) < ⊤ := by
  sorry

-- TauCeti.HyperbolicVolumes.discAreaMeasure_empty
example : discAreaMeasure ∅ = 0 := by
  sorry

-- TauCeti.HyperbolicVolumes.discAreaMeasure_singleton
example (z : ℂ) : discAreaMeasure {z} = 0 := by
  sorry

-- TauCeti.HyperbolicVolumes.discAreaMeasure_outside
example : discAreaMeasure (Metric.ball (0 : ℂ) 1)ᶜ = 0 := by
  sorry

-- TauCeti.HyperbolicVolumes.discAreaMeasure_half_radius
example : discAreaMeasure (Metric.ball (0 : ℂ) (1 / 2)) =
    ENNReal.ofReal (4 * Real.pi / 3) := by
  sorry


-- HyperbolicCurveVolumesAndGonality:HV.0/area-profile
noncomputable def areaProfile (r : ℝ) : ℝ := 4 * Real.pi * Real.sinh (r / 2) ^ 2

theorem areaProfile_pos {r : ℝ} (hr : 0 < r) : 0 < areaProfile r := by
  sorry

theorem areaProfile_mono : StrictMonoOn areaProfile (Set.Ici 0) := by
  sorry

theorem areaProfile_double (r : ℝ) : areaProfile (2 * r) = 4 * Real.pi * Real.sinh r ^ 2 := by
  sorry

-- TauCeti.HyperbolicVolumes.areaProfile_zero
example : areaProfile 0 = 0 := by
  sorry

-- TauCeti.HyperbolicVolumes.areaProfile_tanh
example (r : ℝ) : areaProfile r = 4 * Real.pi * Real.tanh (r / 2) ^ 2 / (1 - Real.tanh (r / 2) ^ 2) := by
  sorry

-- TauCeti.HyperbolicVolumes.areaProfile_small
example : Filter.Tendsto (fun r : ℝ => areaProfile r / (Real.pi * r ^ 2)) (nhdsWithin 0 ({0}ᶜ)) (nhds 1) := by
  sorry


-- HyperbolicCurveVolumesAndGonality:HV.0/disc-ball-area
theorem disc_ball_area {r : ℝ} (hr : 0 ≤ r) :
    discAreaMeasure (radialBall r) = ENNReal.ofReal (areaProfile r) := by
  sorry


-- HyperbolicCurveVolumesAndGonality:HV.0/scaled-area
noncomputable def scaledArea (lam r : ℝ) : ℝ := lam ^ 2 * areaProfile (r / lam)

theorem scaledArea_unit (r : ℝ) : scaledArea 1 r = areaProfile r := by
  sorry

theorem scaledArea_rescale {lam : ℝ} (hl : 0 < lam) (r : ℝ) : scaledArea lam (lam * r) = lam ^ 2 * areaProfile r := by
  sorry

theorem scaledArea_comp {lam kap : ℝ} (hl : 0 < lam) (hk : 0 < kap) (r : ℝ) : scaledArea (lam * kap) r = lam ^ 2 * scaledArea kap (r / lam) := by
  sorry

-- TauCeti.HyperbolicVolumes.scaledArea_zero
example (lam : ℝ) : scaledArea lam 0 = 0 := by
  sorry

-- TauCeti.HyperbolicVolumes.scaledArea_two
example (r : ℝ) : scaledArea 2 (2 * r) = 4 * areaProfile r := by
  sorry

-- TauCeti.HyperbolicVolumes.scaledArea_wrong_length
example (r : ℝ) (hr : 0 < r) : scaledArea 2 (2 * r) ≠ 2 * areaProfile r := by
  sorry


-- HyperbolicCurveVolumesAndGonality:HV.0/max-product-balls
def productBall {n : ℕ} (x : Fin n → Complex.UnitDisc) (r : ℝ) : Set (Fin n → Complex.UnitDisc) :=
  {y | ∀ i, distOne (x i) (y i) < r}

theorem productBall_mem {n : ℕ} (x y : Fin n → Complex.UnitDisc) (r : ℝ) : y ∈ productBall x r ↔ ∀ i, distOne (x i) (y i) < r := by
  sorry

theorem productBall_mono {n : ℕ} (x : Fin n → Complex.UnitDisc) {r R : ℝ} (h : r ≤ R) : productBall x r ⊆ productBall x R := by
  sorry

theorem productBall_permute {n : ℕ} (e : Equiv.Perm (Fin n)) (x y : Fin n → Complex.UnitDisc) (r : ℝ) : (y ∘ e) ∈ productBall (x ∘ e) r ↔ y ∈ productBall x r := by
  sorry

-- TauCeti.HyperbolicVolumes.productBall_empty
example (x : Fin 0 → Complex.UnitDisc) (r : ℝ) : productBall x r = Set.univ := by
  sorry

-- TauCeti.HyperbolicVolumes.productBall_center
example {n : ℕ} (hn : 0 < n) (x : Fin n → Complex.UnitDisc) (r : ℝ) : x ∈ productBall x r ↔ 0 < r := by
  sorry

-- TauCeti.HyperbolicVolumes.productBall_max
example (z w : Fin 2 → Complex.UnitDisc) (r : ℝ) : w ∈ productBall z r ↔ distOne (z 0) (w 0) < r ∧ distOne (z 1) (w 1) < r := by
  sorry


-- HyperbolicCurveVolumesAndGonality:HV.0/lens-radius
noncomputable def lensRadius (R : ℝ) : ℝ := 2 * Real.artanh (Real.sqrt (Real.tanh (R / 2)))

theorem lensRadius_pos {R : ℝ} (hR : 0 < R) : 0 < lensRadius R := by
  sorry

theorem lensRadius_mono : StrictMonoOn lensRadius (Set.Ioi 0) := by
  sorry

theorem lensRadius_cosh {R : ℝ} (hR : 0 ≤ R) : Real.cosh (lensRadius R) = Real.exp R := by
  sorry

-- TauCeti.HyperbolicVolumes.lensRadius_zero
example : lensRadius 0 = 0 := by
  sorry

-- TauCeti.HyperbolicVolumes.lensRadius_exceeds_R
example (R : ℝ) (hR : 0 < R) : R < lensRadius R := by
  sorry

-- TauCeti.HyperbolicVolumes.lensRadius_limit
example : Filter.Tendsto (fun R : ℝ => lensRadius R - R) Filter.atTop (nhds (Real.log 2)) := by
  sorry


-- HyperbolicCurveVolumesAndGonality:HV.0/normalized-lens
theorem normalized_lens (p q u : Complex.UnitDisc) (a R : ℝ)
    (ha : 0 ≤ a) (ha1 : a < 1) (hp : (p : ℂ) = (a : ℂ))
    (hq : (q : ℂ) = -(a : ℂ)) (hR : 0 < R)
    (hup : distOne u p < distOne p 0 + R)
    (huq : distOne u q < distOne p 0 + R) : distOne u 0 < lensRadius R := by
  sorry


-- HyperbolicCurveVolumesAndGonality:HV.1/diagonal-mu
noncomputable def diagonalMu (z w : ℂ) : ℝ := Real.tanh (TauCeti.hyperbolicDist z w / 2) ^ 2

theorem diagonalMu_range {z w : ℂ} (hz : ‖z‖ < 1) (hw : ‖w‖ < 1) : 0 ≤ diagonalMu z w ∧ diagonalMu z w < 1 := by
  sorry

theorem diagonalMu_eq_zero {z w : ℂ} (hz : ‖z‖ < 1) (hw : ‖w‖ < 1) : diagonalMu z w = 0 ↔ z = w := by
  sorry

theorem diagonalMu_moebius (a z w : Complex.UnitDisc) : diagonalMu (((z : ℂ) - (a : ℂ)) / (1 - star (a : ℂ) * (z : ℂ))) (((w : ℂ) - (a : ℂ)) / (1 - star (a : ℂ) * (w : ℂ))) = diagonalMu (z : ℂ) (w : ℂ) := by
  sorry

theorem diagonalMu_invariant (A : ℂ → ℂ) (hA : ∀ z w, TauCeti.hyperbolicDist (A z) (A w) = TauCeti.hyperbolicDist z w) (z w : ℂ) : diagonalMu (A z) (A w) = diagonalMu z w := by
  sorry

-- TauCeti.HyperbolicVolumes.diagonalMu_self
example (z : ℂ) : diagonalMu z z = 0 := by
  sorry

-- TauCeti.HyperbolicVolumes.diagonalMu_antigraph
example (z : ℂ) (hz : ‖z‖ < 1) : diagonalMu z (-z) = ‖z‖ ^ 2 := by
  sorry

-- TauCeti.HyperbolicVolumes.diagonalMu_not_chi
example (z : ℂ) (hz : ‖z‖ < 1) (h0 : z ≠ 0) : diagonalMu z 0 < ‖z‖ ^ 2 := by
  sorry


-- HyperbolicCurveVolumesAndGonality:HV.1/diagonal-chi
noncomputable def diagonalChi (z w : ℂ) : ℝ := TauCeti.pseudoHyperbolicExpr z w ^ 2

theorem diagonalChi_formula (z w : ℂ) : diagonalChi z w = ‖(z - w) / (1 - star w * z)‖ ^ 2 := by
  sorry

theorem diagonalChi_distance {z w : ℂ} (hz : ‖z‖ < 1) (hw : ‖w‖ < 1) : diagonalChi z w = Real.tanh (TauCeti.hyperbolicDist z w) ^ 2 := by
  sorry

theorem diagonalChi_moebius (a z w : Complex.UnitDisc) : diagonalChi (((z : ℂ) - (a : ℂ)) / (1 - star (a : ℂ) * (z : ℂ))) (((w : ℂ) - (a : ℂ)) / (1 - star (a : ℂ) * (w : ℂ))) = diagonalChi (z : ℂ) (w : ℂ) := by
  sorry

theorem diagonalChi_range {z w : ℂ} (hz : ‖z‖ < 1) (hw : ‖w‖ < 1) : 0 ≤ diagonalChi z w ∧ diagonalChi z w < 1 := by
  sorry

-- TauCeti.HyperbolicVolumes.diagonalChi_self
example (z : ℂ) : diagonalChi z z = 0 := by
  sorry

-- TauCeti.HyperbolicVolumes.diagonalChi_origin
example (z : ℂ) : diagonalChi z 0 = ‖z‖ ^ 2 := by
  sorry

-- TauCeti.HyperbolicVolumes.diagonalChi_antigraph
example (z : ℂ) (hz : ‖z‖ < 1) : diagonalChi z (-z) = 4 * ‖z‖ ^ 2 / (1 + ‖z‖ ^ 2) ^ 2 := by
  sorry


-- HyperbolicCurveVolumesAndGonality:HV.1/chi-mu-relation
theorem chi_mu_relation {z w : ℂ} (hz : ‖z‖ < 1) (hw : ‖w‖ < 1) :
    diagonalChi z w = 4 * diagonalMu z w / (1 + diagonalMu z w) ^ 2 ∧
    1 - diagonalChi z w = (1 - diagonalMu z w) ^ 2 / (1 + diagonalMu z w) ^ 2 := by
  sorry


-- HyperbolicCurveVolumesAndGonality:HV.1/conjugate-psi
noncomputable def conjugatePsi (z w : ℂ) : ℝ := diagonalChi z (star w)

theorem conjugatePsi_formula (z w : ℂ) : conjugatePsi z w = ‖(star w - z) / (1 - z * w)‖ ^ 2 := by
  sorry

theorem conjugatePsi_zero {z w : ℂ} (hz : ‖z‖ < 1) (hw : ‖w‖ < 1) : conjugatePsi z w = 0 ↔ w = star z := by
  sorry

theorem conjugatePsi_invariant (A : ℂ → ℂ) (hA : ∀ z w, diagonalChi (A z) (A w) = diagonalChi z w) (z w : ℂ) : conjugatePsi (A z) (star (A (star w))) = conjugatePsi z w := by
  sorry

-- TauCeti.HyperbolicVolumes.conjugatePsi_graph
example (z : ℂ) : conjugatePsi z (star z) = 0 := by
  sorry

-- TauCeti.HyperbolicVolumes.conjugatePsi_origin
example (w : ℂ) : conjugatePsi 0 w = ‖w‖ ^ 2 := by
  sorry

-- TauCeti.HyperbolicVolumes.conjugatePsi_not_diagonal
example (z : ℂ) (hz : ‖z‖ < 1) (him : z.im ≠ 0) : 0 < conjugatePsi z z := by
  sorry


-- HyperbolicCurveVolumesAndGonality:HV.1/conjugate-tangent
theorem conjugate_tangent_not_complex :
    ∃ v : ℂ × ℂ, v.2 = star v.1 ∧ (Complex.I * v.2) ≠ star (Complex.I * v.1) := by
  sorry


-- HyperbolicCurveVolumesAndGonality:HV.1/diagonal-positive-profile
noncomputable def diagonalAreaPotential (z w : ℂ) : ℝ := -8 * Real.pi * Real.log (1 - diagonalMu z w)

theorem diagonalAreaPotential_nonneg {z w : ℂ} (hz : ‖z‖ < 1) (hw : ‖w‖ < 1) : 0 ≤ diagonalAreaPotential z w := by
  sorry

theorem diagonalAreaPotential_formula (z w : ℂ) : diagonalAreaPotential z w = -8 * Real.pi * Real.log (1 - diagonalMu z w) := by
  sorry

theorem diagonalAreaPotential_invariant (A : ℂ → ℂ) (hA : ∀ z w, diagonalMu (A z) (A w) = diagonalMu z w) (z w : ℂ) : diagonalAreaPotential (A z) (A w) = diagonalAreaPotential z w := by
  sorry

-- TauCeti.HyperbolicVolumes.diagonalAreaPotential_self
example (z : ℂ) : diagonalAreaPotential z z = 0 := by
  sorry

-- TauCeti.HyperbolicVolumes.diagonalAreaPotential_antigraph
example (z : ℂ) (hz : ‖z‖ < 1) : diagonalAreaPotential z (-z) = -8 * Real.pi * Real.log (1 - ‖z‖ ^ 2) := by
  sorry

-- TauCeti.HyperbolicVolumes.diagonalAreaPotential_positive
example (z : ℂ) (hz : ‖z‖ < 1) (h0 : z ≠ 0) : 0 < diagonalAreaPotential z 0 := by
  sorry


-- HyperbolicCurveVolumesAndGonality:HV.1/relative-log-profile
noncomputable def relativeLogProfile (s : ℝ) : ℝ := Real.log (4 * Real.exp s / (1 - Real.exp s) ^ 2)

theorem relativeLogProfile_expand {s : ℝ} (hs : s < 0) : relativeLogProfile s = Real.log 4 + s - 2 * Real.log (1 - Real.exp s) := by
  sorry

theorem relativeLogProfile_deriv {s : ℝ} (hs : s < 0) : HasDerivAt relativeLogProfile ((1 + Real.exp s) / (1 - Real.exp s)) s := by
  sorry

theorem relativeLogProfile_chi {z w : ℂ} (hz : ‖z‖ < 1) (hw : ‖w‖ < 1) (hne : z ≠ w) : relativeLogProfile (Real.log (diagonalMu z w)) = Real.log (diagonalChi z w / (1 - diagonalChi z w)) := by
  sorry

-- TauCeti.HyperbolicVolumes.relativeLogProfile_slope
example (r : ℝ) (hr : 0 < r) : HasDerivAt relativeLogProfile (Real.cosh r) (Real.log (Real.tanh (r / 2) ^ 2)) := by
  sorry

-- TauCeti.HyperbolicVolumes.relativeLogProfile_value
example : relativeLogProfile (Real.log (1 / 4)) = Real.log (16 / 9) := by
  sorry

-- TauCeti.HyperbolicVolumes.relativeLogProfile_injective
example : StrictMonoOn relativeLogProfile (Set.Iio 0) := by
  sorry


-- HyperbolicCurveVolumesAndGonality:HV.1/conjugate-f-profile
noncomputable def conjugateAreaProfile (s : ℝ) : ℝ := -Real.log (1 - s)

theorem conjugateAreaProfile_nonneg {s : ℝ} (hs : 0 ≤ s) (hs1 : s < 1) : 0 ≤ conjugateAreaProfile s := by
  sorry

theorem conjugateAreaProfile_deriv {s : ℝ} (hs : s < 1) : HasDerivAt conjugateAreaProfile (1 / (1 - s)) s := by
  sorry

theorem conjugateAreaProfile_tanh (r : ℝ) : conjugateAreaProfile (Real.tanh r ^ 2) = 2 * Real.log (Real.cosh r) := by
  sorry

-- TauCeti.HyperbolicVolumes.conjugateAreaProfile_zero
example : conjugateAreaProfile 0 = 0 := by
  sorry

-- TauCeti.HyperbolicVolumes.conjugateAreaProfile_half
example : conjugateAreaProfile (1 / 2) = Real.log 2 := by
  sorry

-- TauCeti.HyperbolicVolumes.conjugateAreaProfile_blowup
example : Filter.Tendsto conjugateAreaProfile (nhdsWithin 1 (Set.Iio 1)) Filter.atTop := by
  sorry


-- HyperbolicCurveVolumesAndGonality:HV.1/conjugate-g-profile
noncomputable def conjugatePositiveProfile (t : ℝ) : ℝ := 2 * Real.arcsin (Real.sqrt (1 - Real.exp (-t)))

theorem conjugatePositiveProfile_comp {s : ℝ} (hs : 0 ≤ s) (hs1 : s < 1) : conjugatePositiveProfile (conjugateAreaProfile s) = 2 * Real.arcsin (Real.sqrt s) := by
  sorry

theorem conjugatePositiveProfile_deriv {t : ℝ} (ht : 0 < t) : HasDerivAt conjugatePositiveProfile (1 / Real.sqrt (Real.exp t - 1)) t := by
  sorry

theorem conjugatePositiveProfile_mono : StrictMonoOn conjugatePositiveProfile (Set.Ici 0) := by
  sorry

-- TauCeti.HyperbolicVolumes.conjugatePositiveProfile_zero
example : conjugatePositiveProfile 0 = 0 := by
  sorry

-- TauCeti.HyperbolicVolumes.conjugatePositiveProfile_log_two
example : conjugatePositiveProfile (Real.log 2) = Real.pi / 2 := by
  sorry

-- TauCeti.HyperbolicVolumes.conjugatePositiveProfile_slope
example (r : ℝ) (hr : 0 < r) : HasDerivAt conjugatePositiveProfile (1 / Real.sinh r) (2 * Real.log (Real.cosh r)) := by
  sorry


-- HyperbolicCurveVolumesAndGonality:HV.2/parameter-area-density
noncomputable def parameterDensity {n : ℕ} (f : Fin n → ℂ → ℂ) (t : ℂ) : ℝ :=
  ∑ i, areaDensity (f i t) * ‖deriv (f i) t‖ ^ 2

theorem parameterDensity_nonneg {n : ℕ} (f : Fin n → ℂ → ℂ) (t : ℂ) : 0 ≤ parameterDensity f t := by
  sorry

theorem parameterDensity_ext {n : ℕ} (f g : Fin n → ℂ → ℂ) (h : ∀ i, f i = g i) : parameterDensity f = parameterDensity g := by
  sorry

theorem parameterDensity_constant {n : ℕ} (c : Fin n → ℂ) (t : ℂ) : parameterDensity (fun i _ => c i) t = 0 := by
  sorry

theorem parameterDensity_reparam {n : ℕ} (f : Fin n → ℂ → ℂ) (h : ℂ → ℂ) (t : ℂ) (hh : DifferentiableAt ℂ h t) (hf : ∀ i, DifferentiableAt ℂ (f i) (h t)) : parameterDensity (fun i => f i ∘ h) t = parameterDensity f (h t) * ‖deriv h t‖ ^ 2 := by
  sorry

-- TauCeti.HyperbolicVolumes.parameterDensity_fibre
example (c t : ℂ) : parameterDensity ![fun z => z, fun _ => c] t = areaDensity t := by
  sorry

-- TauCeti.HyperbolicVolumes.parameterDensity_antigraph
example (t : ℂ) : parameterDensity ![fun z => z, fun z => -z] t = 2 * areaDensity t := by
  sorry

-- TauCeti.HyperbolicVolumes.parameterDensity_cusp_constant
example (c t : ℂ) : ‖deriv (fun _ : ℂ => c) t‖ ^ 2 = 0 := by
  sorry


-- HyperbolicCurveVolumesAndGonality:HV.2/parameter-volume
noncomputable def parameterVolume {n : ℕ} (f : Fin n → ℂ → ℂ) (U : Set ℂ) : ℝ≥0∞ :=
  ∫⁻ t in U, ENNReal.ofReal (parameterDensity f t)

theorem parameterVolume_mono {n : ℕ} (f : Fin n → ℂ → ℂ) {U W : Set ℂ} (h : U ⊆ W) : parameterVolume f U ≤ parameterVolume f W := by
  sorry

theorem parameterVolume_ext {n : ℕ} (f g : Fin n → ℂ → ℂ) (U : Set ℂ) (h : ∀ t ∈ U, parameterDensity f t = parameterDensity g t) : parameterVolume f U = parameterVolume g U := by
  sorry

theorem parameterVolume_reparam {n : ℕ} (f : Fin n → ℂ → ℂ) (h : ℂ → ℂ) (U : Set ℂ) (hU : IsOpen U) (hh : DifferentiableOn ℂ h U) (hinj : Set.InjOn h U) (hf : ∀ i, DifferentiableOn ℂ (f i) (Set.image h U)) : parameterVolume (fun i => f i ∘ h) U = parameterVolume f (Set.image h U) := by
  sorry

theorem parameterVolume_weight {n : ℕ} (f : Fin n → ℂ → ℂ) (U : Set ℂ) (m : ℕ) : (∫⁻ t in U, (m : ℝ≥0∞) * ENNReal.ofReal (parameterDensity f t)) = (m : ℝ≥0∞) * parameterVolume f U := by
  sorry

-- TauCeti.HyperbolicVolumes.parameterVolume_empty
example {n : ℕ} (f : Fin n → ℂ → ℂ) : parameterVolume f ∅ = 0 := by
  sorry

-- TauCeti.HyperbolicVolumes.parameterVolume_constant
example {n : ℕ} (c : Fin n → ℂ) (U : Set ℂ) : parameterVolume (fun i _ => c i) U = 0 := by
  sorry

-- TauCeti.HyperbolicVolumes.parameterVolume_zero_dimension
example (f : Fin 0 → ℂ → ℂ) (U : Set ℂ) : parameterVolume f U = 0 := by
  sorry

-- TauCeti.HyperbolicVolumes.parameterVolume_fibre_half
example : parameterVolume ![fun z => z, fun _ => (0 : ℂ)]
    (Metric.ball (0 : ℂ) (1 / 2)) = ENNReal.ofReal (4 * Real.pi / 3) := by
  sorry


-- HyperbolicCurveVolumesAndGonality:HV.2/fibre-volume
theorem fibre_volume (c : ℂ) (hc : ‖c‖ < 1) {r : ℝ} (hr : 0 ≤ r) :
    parameterVolume ![fun z => z, fun _ => c] (radialBall r) = ENNReal.ofReal (areaProfile r) := by
  sorry


-- HyperbolicCurveVolumesAndGonality:HV.2/antigraph-volume
theorem antigraph_volume {r : ℝ} (hr : 0 ≤ r) :
    parameterVolume ![fun z => z, fun z => -z] (radialBall r) = ENNReal.ofReal (2 * areaProfile r) := by
  sorry


-- HyperbolicCurveVolumesAndGonality:HV.2/power-parameter-volume
theorem power_parameter_volume (d : ℕ) (hd : 0 < d) (c : ℂ) (hc : ‖c‖ < 1)
    (s : ℝ) (hs : 0 ≤ s) (hs1 : s < 1) :
    parameterVolume ![fun z => z ^ d, fun _ => c] (Metric.ball (0 : ℂ) s) =
      ENNReal.ofReal ((d : ℝ) * 4 * Real.pi * s ^ (2 * d) / (1 - s ^ (2 * d))) := by
  sorry


/- Local coefficient models reuse Mathlib's LF topology. These are chart
specializations of HV.3, not replacement manifold form bundles. The global
change-of-chart, restriction and pushforward signatures still require the
current DifferentialGeometry carriers and are recorded as incomplete. -/
abbrev ChartTestForm (n k : ℕ) (Ω : TopologicalSpace.Opens (Fin n → ℂ)) :=
  TestFunction Ω ((Fin n → ℂ) [⋀^(Fin k)]→L[ℝ] ℝ) ⊤

-- Bound the degree so Nat subtraction cannot turn an out-of-range current
-- into a scalar distribution. Global differentiation also needs zero degrees
-- outside this interval, including the derivative of a top-degree current.
abbrev ChartCurrent (n : ℕ) (q : Fin (2 * n + 1))
    (Ω : TopologicalSpace.Opens (Fin n → ℂ)) :=
  ChartTestForm n (2 * n - q.val) Ω →L[ℝ] ℝ

theorem testForm_ext {n k : ℕ} {Ω : TopologicalSpace.Opens (Fin n → ℂ)}
    (α β : ChartTestForm n k Ω) (h : ∀ x, α x = β x) : α = β := by
  sorry

theorem testForm_continuous_dual {n k : ℕ}
    {Ω : TopologicalSpace.Opens (Fin n → ℂ)}
    (T : ChartTestForm n k Ω →ₗ[ℝ] ℝ) :
    Continuous T ↔ ∀ (K : TopologicalSpace.Compacts (Fin n → ℂ))
      (hK : (K : Set (Fin n → ℂ)) ⊆ Ω),
      Continuous (T ∘ TestFunction.ofSupportedIn hK) := by
  sorry

theorem current_ext {n : ℕ} {q : Fin (2 * n + 1)}
    {Ω : TopologicalSpace.Opens (Fin n → ℂ)}
    (T S : ChartCurrent n q Ω) (h : ∀ α, T α = S α) : T = S := by
  sorry

-- The scalar distribution is the oriented complex-line top-degree current.
-- This is the actual baseline Dirac evaluation, not a field postulating mass.
-- TauCeti.HyperbolicVolumes.current_dirac
example {Ω : TopologicalSpace.Opens ℂ} (z : ℂ)
    (φ : TestFunction Ω ℝ ⊤) :
    (Distribution.delta z : Distribution Ω ℝ ⊤) φ = φ z := by
  sorry

-- HV.3/ddc, in one complex chart. Two minus signs from distributional
-- differentiation give the positive-coordinate Laplacian/(4π).
noncomputable def ddcChart {Ω : TopologicalSpace.Opens ℂ}
    (T : Distribution Ω ℝ ⊤) : Distribution Ω ℝ ⊤ :=
  (1 / (4 * Real.pi)) •
    ((Distribution.lineDerivCLM (n := ⊤) (k := ⊤) (1 : ℂ))
      ((Distribution.lineDerivCLM (n := ⊤) (k := ⊤) (1 : ℂ)) T) +
     (Distribution.lineDerivCLM (n := ⊤) (k := ⊤) Complex.I)
      ((Distribution.lineDerivCLM (n := ⊤) (k := ⊤) Complex.I) T))

theorem ddc_linear {Ω : TopologicalSpace.Opens ℂ}
    (a b : ℝ) (T S : Distribution Ω ℝ ⊤) :
    ddcChart (a • T + b • S) = a • ddcChart T + b • ddcChart S := by
  sorry

-- TauCeti.HyperbolicVolumes.ddc_constant
example {Ω : TopologicalSpace.Opens ℂ} (c : ℝ) :
    ddcChart (Distribution.ofFun Ω (fun _ : ℂ => c) volume ⊤) = 0 := by
  sorry

-- TauCeti.HyperbolicVolumes.ddc_normSquare
example {Ω : TopologicalSpace.Opens ℂ} :
    ddcChart (Distribution.ofFun Ω (fun z : ℂ => ‖z‖ ^ 2) volume ⊤) =
      Distribution.ofFun Ω (fun _ : ℂ => 1 / Real.pi) volume ⊤ := by
  sorry

-- HV.3/poincare-lelong. The locally integrable representative may be assigned
-- any finite value at zero. The EReal psh representative instead takes −∞.
theorem poincare_lelong_chart {Ω : TopologicalSpace.Opens ℂ}
    (h0 : (0 : ℂ) ∈ Ω) :
    ddcChart (Distribution.ofFun Ω (fun z : ℂ => Real.log (‖z‖ ^ 2)) volume ⊤) =
      (Distribution.delta (0 : ℂ) : Distribution Ω ℝ ⊤) := by
  sorry

-- TauCeti.HyperbolicVolumes.ddc_log_power
example {Ω : TopologicalSpace.Opens ℂ} (e : ℕ) :
    ddcChart (Distribution.ofFun Ω
      (fun z : ℂ => Real.log (‖z ^ e‖ ^ 2)) volume ⊤) =
      (e : ℝ) • (Distribution.delta (0 : ℂ) : Distribution Ω ℝ ⊤) := by
  sorry

noncomputable def extendedDiagonalLog (z w : ℂ) : EReal :=
  if z = w then ⊥ else (Real.log (diagonalMu z w) : EReal)

theorem extendedDiagonalLog_self (z : ℂ) : extendedDiagonalLog z z = ⊥ := by
  sorry

-- HV.1/mu-log-singularity: the leading coefficient is positive in the disc.
-- This asymptotic supplies the bounded logarithmic correction used by HV.4.
theorem mu_log_singularity (z : ℂ) (hz : ‖z‖ < 1) :
    Tendsto (fun w : ℂ => diagonalMu z w / ‖z - w‖ ^ 2)
      (nhdsWithin z ({z}ᶜ)) (nhds (1 / (4 * (1 - ‖z‖ ^ 2) ^ 2))) := by
  sorry

noncomputable def secondRealDerivative (u : (ℂ × ℂ) → ℝ)
    (p v w : ℂ × ℂ) : ℝ := (fderiv ℝ (fderiv ℝ u) p v) w

def coordinateDirection (j : Fin 2) : ℂ × ℂ :=
  if j = 0 then (1, 0) else (0, 1)

-- Coefficients of ∂∂bar u, with scalar-valued u and the real second derivative.
noncomputable def complexHessian (u : (ℂ × ℂ) → ℝ) (p : ℂ × ℂ) :
    Matrix (Fin 2) (Fin 2) ℂ := fun j k =>
  let v := coordinateDirection j
  let w := coordinateDirection k
  (1 / 4 : ℂ) *
    ((secondRealDerivative u p v w : ℂ) +
     (secondRealDerivative u p (Complex.I • v) (Complex.I • w) : ℂ) +
     Complex.I * ((secondRealDerivative u p v (Complex.I • w) : ℂ) -
       (secondRealDerivative u p (Complex.I • v) w : ℂ)))

-- HV.3/diagonal-hessian. At (0,w), t = sqrt(1−|w|²).
theorem diagonal_log_hessian (w : ℂ) (hw : ‖w‖ < 1) (h0 : w ≠ 0) :
    complexHessian (fun p => Real.log (diagonalMu p.1 p.2)) (0, w) =
      let t := Real.sqrt (1 - ‖w‖ ^ 2)
      (1 / (2 * t ^ 3) : ℂ) •
        ((!![t ^ 4, t ^ 2; t ^ 2, 1] : Matrix (Fin 2) (Fin 2) ℝ).map Complex.ofReal) := by
  sorry

theorem diagonal_area_hessian (w : ℂ) (hw : ‖w‖ < 1) :
    complexHessian (fun p => diagonalAreaPotential p.1 p.2) (0, w) =
      let t := Real.sqrt (1 - ‖w‖ ^ 2)
      (2 * Real.pi : ℂ) •
        ((!![2 - t, -(1 / t); -(1 / t), (2 - t) / t ^ 4] :
          Matrix (Fin 2) (Fin 2) ℝ).map Complex.ofReal) := by
  sorry

theorem diagonal_area_hessian_positive (w : ℂ) (hw : ‖w‖ < 1) :
    let t := Real.sqrt (1 - ‖w‖ ^ 2)
    ( (!![2 - t, -(1 / t); -(1 / t), (2 - t) / t ^ 4] :
      Matrix (Fin 2) (Fin 2) ℂ)).PosSemidef ∧
    ( (!![t, 1 / t; 1 / t, 1 / t ^ 3] :
      Matrix (Fin 2) (Fin 2) ℂ)).PosSemidef := by
  sorry

theorem diagonalMu_smooth_formula (z w : ℂ) (hz : ‖z‖ < 1) (hw : ‖w‖ < 1) :
    diagonalMu z w = diagonalChi z w /
      (1 + Real.sqrt (1 - diagonalChi z w)) ^ 2 := by
  sorry

-- HV.4/diagonal-tube: explicit metric definitions, before quotient descent.
def diagonalTube {X : Type*} [PseudoMetricSpace X] (r : ℝ) : Set (X × X) :=
  {p | dist p.1 p.2 < 2 * r}

def doubleDiagonalTube {X : Type*} [PseudoMetricSpace X] (r : ℝ) :
    Set ((X × X) × (X × X)) :=
  {p | (p.1.1, p.2.1) ∈ diagonalTube r ∧ (p.1.2, p.2.2) ∈ diagonalTube r}

theorem diagonalTube_mem {X : Type*} [PseudoMetricSpace X] (x y : X) (r : ℝ) :
    (x, y) ∈ diagonalTube r ↔ dist x y < 2 * r := by
  sorry

theorem diagonalTube_mono {X : Type*} [PseudoMetricSpace X] {r R : ℝ}
    (h : r ≤ R) : diagonalTube (X := X) r ⊆ diagonalTube R := by
  sorry

theorem doubleDiagonalTube_mem {X : Type*} [PseudoMetricSpace X]
    (p : (X × X) × (X × X)) (r : ℝ) :
    p ∈ doubleDiagonalTube r ↔ dist p.1.1 p.2.1 < 2 * r ∧
      dist p.1.2 p.2.2 < 2 * r := by
  sorry

-- TauCeti.HyperbolicVolumes.diagonalTube_empty
example {X : Type*} [PseudoMetricSpace X] : diagonalTube (X := X) 0 = ∅ := by
  sorry

-- TauCeti.HyperbolicVolumes.doubleDiagonalTube_max
example {X : Type*} [PseudoMetricSpace X] (p : (X × X) × (X × X)) (r : ℝ)
    (h : 2 * r ≤ dist p.1.1 p.2.1) : p ∉ doubleDiagonalTube r := by
  sorry

-- TauCeti.HyperbolicVolumes.doubleDiagonalTube_diagonal
example {X : Type*} [PseudoMetricSpace X] (a b : X) (r : ℝ) (hr : 0 < r) :
    ((a, b), (a, b)) ∈ doubleDiagonalTube r := by
  sorry

-- TauCeti.HyperbolicVolumes.doubleDiagonalTube_wrong_pairing
example {X : Type*} [PseudoMetricSpace X] (a b : X) (r : ℝ)
    (h : 2 * r ≤ dist a b) : ((a, a), (b, b)) ∉ doubleDiagonalTube r := by
  sorry

-- distOne is twice the imported PoincareDisc distance (curvature −4).
-- Complex.UnitDisc itself carries the Euclidean subtype metric.
-- TauCeti.HyperbolicVolumes.diagonalTube_antigraph
example (z w : Complex.UnitDisc) (hw : (w : ℂ) = -(z : ℂ)) (r : ℝ) :
    distOne z w < 2 * r ↔ distOne z 0 < r := by
  sorry

-- HV.2/cusp-pullback: a constant q=0 coordinate is defined separately.
noncomputable def cuspPullbackDensity (q : ℂ → ℂ) (z : ℂ) : ℝ :=
  if q z = 0 then 0 else
    ‖deriv q z‖ ^ 2 / (‖q z‖ ^ 2 * Real.log ‖q z‖ ^ 2)

theorem cusp_pullback_constant (z : ℂ) :
    cuspPullbackDensity (fun _ => 0) z = 0 := by
  sorry

theorem cusp_pullback_power (e : ℕ) (he : 0 < e) (z : ℂ) (hz : z ≠ 0)
    (hz1 : ‖z‖ < 1) :
    cuspPullbackDensity (fun t => t ^ e) z =
      1 / (‖z‖ ^ 2 * Real.log ‖z‖ ^ 2) := by
  sorry

theorem cusp_pullback_power_mass (e : ℕ) (he : 0 < e) (s : ℝ)
    (hs : 0 < s) (hs1 : s < 1) :
    (∫⁻ z in Metric.ball (0 : ℂ) s,
      ENNReal.ofReal (cuspPullbackDensity (fun t => t ^ e) z)) =
      ENNReal.ofReal (-2 * Real.pi / Real.log s) := by
  sorry

/- HV.6/gonality uses the actual function-field carrier at the pin. The
curve/model equality and base-change signatures still need AlgebraicCurves
Layer 12. No abstract Curve record assumes any gonality conclusion. -/
noncomputable def rationalSubfieldDegrees (k F : Type*) [Field k] [Field F]
    [Algebra k F] : Set ℕ :=
  {d | 0 < d ∧ ∃ φ : RatFunc k →ₐ[k] F,
    letI : Algebra (RatFunc k) F := φ.toRingHom.toAlgebra
    FiniteDimensional (RatFunc k) F ∧ Module.finrank (RatFunc k) F = d}

noncomputable def gonality (k F : Type*) [Field k] [Field F] [Algebra k F] : ℕ :=
  sInf (rationalSubfieldDegrees k F)

theorem gonality_pos (k F : Type*) [Field k] [Field F] [Algebra k F]
    (hF : TauCeti.IsFunctionField k F) : 0 < gonality k F := by
  sorry

theorem gonality_attained (k F : Type*) [Field k] [Field F] [Algebra k F]
    (hF : TauCeti.IsFunctionField k F) : gonality k F ∈ rationalSubfieldDegrees k F := by
  sorry

theorem gonality_le_degree (k F : Type*) [Field k] [Field F] [Algebra k F]
    (d : ℕ) (h : d ∈ rationalSubfieldDegrees k F) : gonality k F ≤ d := by
  sorry

theorem gonality_iso (k F G : Type*) [Field k] [Field F] [Field G]
    [Algebra k F] [Algebra k G] (e : F ≃ₐ[k] G) : gonality k F = gonality k G := by
  sorry

-- TauCeti.HyperbolicVolumes.gonality_projectiveLine
example (k : Type*) [Field k] : gonality k (RatFunc k) = 1 := by
  sorry

-- TauCeti.HyperbolicVolumes.gonality_genusOne
example (k F : Type*) [Field k] [IsAlgClosed k] [Field F] [Algebra k F]
    (hF : TauCeti.IsFunctionField k F) (hg : TauCeti.genus k F = 1) :
    gonality k F = 2 := by
  sorry

-- TauCeti.HyperbolicVolumes.gonality_conic_nonexample
-- For a nonsplit conic the curve/function-field dictionary supplies hnonrat.
example (k F : Type*) [Field k] [Field F] [Algebra k F]
    (hF : TauCeti.IsFunctionField k F)
    (hnonrat : ¬ Nonempty (F ≃ₐ[k] RatFunc k)) : gonality k F ≠ 1 := by
  sorry

-- HV.6/riemann-roch-bound in the existing function-field vocabulary.
theorem gonality_riemann_roch_bound (k F : Type*) [Field k] [IsAlgClosed k]
    [Field F] [Algebra k F] (hF : TauCeti.IsFunctionField k F) :
    gonality k F ≤ TauCeti.genus k F + 1 := by
  sorry

end TauCeti.HyperbolicVolumes
