import Mathlib.Analysis.Analytic.Inverse
import Mathlib.Analysis.Complex.Basic
import Mathlib.Topology.OpenPartialHomeomorph.Basic

/-!
# R09.7d: compactification source charts

This file is not the roadmap and is not exhaustive. The accompanying README is
definitive. These statements suggest native Lean forms so contributors and
reviewers can agree on signatures. They claim no implementation.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174,
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

WORKERS' current shape rule puts heavy geometric constructions in the README.
In particular, there is no admitted scheme analytification or chart data type
here. The conditional lift below uses actual native maps. Its image equality
and open-embedding assumptions are outputs still to establish geometrically.
It states the topological consequence only; complex analyticity is a README
obligation. The examples state coordinate consequences, not the complete
geometric fixtures.

README inventory (one application and one construction node):

* smooth-complex-points: smoothComplexPoints.points,
  smoothComplexPoints.affineChart, smoothComplexPoints.independent,
  smoothComplexPoints.map, smoothComplexPoints.openImmersion,
  smoothComplexPoints.etaleCoordinates, smoothComplexPoints.zeroSet.
  These apply the single smooth realization already owned by ComplexComparison
  PR196 Layers 0–2, integrated through the A0-extension request. Its native
  scheme-point manifold instantiation is unavailable at the pins; it is not
  reconstructed here. All seven compatibility clauses remain in the README.
  SmoothComplexPointsChecks.point, SmoothComplexPointsChecks.principalOpen,
  SmoothComplexPointsChecks.etaleSheets, SmoothComplexPointsChecks.scalarStructure
  are full scheme/manifold fixtures there; no coordinate example below claims
  to instantiate them.
* borel-source-charts: borelSourceCharts.algebraicModel,
  borelSourceCharts.fullChart, borelSourceCharts.boundary,
  borelSourceCharts.liftSquare, borelSourceCharts.restrict,
  borelSourceCharts.relabel, borelSourceCharts.coverAndPullback.
  Their full signatures need
  the preceding instantiation and imported labelled SNC chart. The theorem
  borelSourceCharts_liftSquare_of_openEmbedding is only the conditional native
  topological part of liftSquare. All seven geometric clauses remain required.
  BorelSourceChecks.point and BorelSourceChecks.torusCorner have coordinate
  consequences below; BorelSourceChecks.projectiveInterior,
  BorelSourceChecks.affineLineInfinity and BorelSourceChecks.preservedOpen,
  and the geometric
  parts of point and torusCorner, remain README fixtures.

The imported PR196 realization, R09.7/snc-compactification and
R09.7/analytic-polydisc targets keep their existing owners. No second
analytification or inverse-function theorem is defined here.
-/

open Set Topology

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.R097d

/-- The conditional topological part of the lift square. In the application,
`P` is the punctured part of the target polydisc, `e` is the full chart and `j`
is the analytic map of the prescribed algebraic open immersion. The exact
image equality is essential. This statement does not construct that geometry.
-/
theorem borelSourceCharts_liftSquare_of_openEmbedding
    {U X : Type*} [TopologicalSpace U] [TopologicalSpace X] {n : ℕ}
    (j : U → X) (hj : IsOpenEmbedding j)
    (e : OpenPartialHomeomorph X (Fin n → ℂ))
    (P : Set (Fin n → ℂ)) (hP : P ⊆ e.target)
    (himage : e.symm '' P = e.source ∩ Set.range j) :
    ∃! ell : P → U,
      Continuous ell ∧
      (∀ z : P, j (ell z) = e.symm (z : Fin n → ℂ)) ∧
      Set.range ell = j ⁻¹' e.source := by
  sorry

/-- Native coordinate part of BorelSourceChecks.point. An empty coordinate
product is a singleton, and has no coordinate hyperplane to remove. The
identification with the over-C points of Spec C is a separate README check.
-/
example :
    Set.pi (Set.univ : Set (Fin 0))
        (fun _ => Metric.ball (0 : ℂ) 1) =
      ({0} : Set (Fin 0 → ℂ)) := by
  sorry

/-- The single boundary-coordinate model. The strict norm inequality must be
retained, along with the nonvanishing condition.
-/
example (rho : ℝ) :
    Metric.ball (0 : ℂ) rho \ {0} =
      {z : ℂ | ‖z‖ < rho ∧ z ≠ 0} := by
  sorry

/-- Coordinate part of BorelSourceChecks.torusCorner: remove the union of
axes, hence require both coordinates to be nonzero.
-/
example (rho₁ rho₂ : ℝ) :
    (Metric.ball (0 : ℂ) rho₁ ×ˢ Metric.ball (0 : ℂ) rho₂) \
        {z : ℂ × ℂ | z.1 = 0 ∨ z.2 = 0} =
      {z : ℂ × ℂ |
        ‖z.1‖ < rho₁ ∧ ‖z.2‖ < rho₂ ∧ z.1 ≠ 0 ∧ z.2 ≠ 0} := by
  sorry

/-- A concrete discriminator for the tempting but incorrect removal of only
the origin. This assertion concerns the actual axes in the native product.
-/
example :
    (0, (1 / 2 : ℂ)) ∈
        ((Metric.ball (0 : ℂ) 1 ×ˢ Metric.ball (0 : ℂ) 1) \
          {(0, 0)}) ∧
      (0, (1 / 2 : ℂ)) ∉
        ((Metric.ball (0 : ℂ) 1 ×ˢ Metric.ball (0 : ℂ) 1) \
          {z : ℂ × ℂ | z.1 = 0 ∨ z.2 = 0}) := by
  sorry

/-- Consume the native analytic inverse theorem with its actual invertible
linear-term hypothesis. No inverse result is replanned by this example.
-/
example (e : OpenPartialHomeomorph ℂ ℂ) {a : ℂ}
    (ha : a ∈ e.source) {p : FormalMultilinearSeries ℂ ℂ ℂ}
    (hp : HasFPowerSeriesAt e p a) (i : ℂ ≃L[ℂ] ℂ)
    (hlin : p 1 = (continuousMultilinearCurryFin1 ℂ ℂ ℂ).symm i) :
    AnalyticAt ℂ e.symm (e a) := by
  exact (e.hasFPowerSeriesAt_symm ha hp hlin).analyticAt

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.R097d
