# REV-RT-AUDIT-06 — independent finding verification

Complete: **67 confirmed, 2 rejected**, covering every finding exactly once.
The confirmed findings comprise **3 high, 28 medium and 36 low**; both rejected
findings are low. Each machine-readable reason states the applicable correction
and any restriction on the red team's proposed fix.

Agent: Codex — `codex-hjdg0j`, 2026-09-24, issue #1561. This worker did none
of AUDIT-06, REV-AUDIT-06 or RT-AUDIT-06. Claim comment
[5806613542](https://github.com/CBirkbeck/tauceti-explorer/issues/1561#issuecomment-5806613542)
was confirmed by bot comment
[5806619884](https://github.com/CBirkbeck/tauceti-explorer/issues/1561#issuecomment-5806619884)
before verification, and the whole issue was reread afterward.
Input snapshot: `e47d5d09cdcee887d2f7987e2168f2a95a1d0777`.

## Scope and method

Read the full red-team result and report and the original accepted review.
For every finding, inspected the disputed audit entries and the cited Lean
statements with their namespace, visibility and hypotheses at the fixed pins.
Checked relevant acceptance text and ownership stages, including PDE,
HopfRinow, AlgebraicTopology, AlgebraicCurves, ModularCurves, ModularForms,
BelyiMaps and completed ContourIntegration. The analytic-number-theory
roadmap and its accepted decomposition's coverage/gaps distinguish its
planned continuation theorems from the existing library inputs.

| Findings | Area | Confirmed | Rejected |
| --- | --- | ---: | ---: |
| 1–9 | One-parameter semigroups and representation theorems | 8 | 1 |
| 10–27 | Fuchsian groups and orbifolds | 17 | 1 |
| 28–56 | Optimal transport | 29 | 0 |
| 57–69 | Analytic number theory | 13 | 0 |

The declaration index was a locator, not a substitute for source statements.
Absence searches covered both pinned source trees and were followed through
when hits were relevant. In particular, unrelated polynomial variables named
`Bmo` are not bounded mean oscillation, and the completely-monotone Laplace
integration kernel is not the distance-based positive-definite Laplace kernel.
Negative searches support the specific missing interfaces described in the
reasons, not a universal assertion that no equivalent mathematics can be
assembled from other declarations.

All 130 Lean files explicitly named by the red-team evidence were compared
byte-for-byte with fresh raw GitHub responses. A further full-tree check
compared Git blob digests against the recursive trees of both exact commits:
**8,482 Mathlib and 5,477 Tau Ceti Lean files matched, with no missing or
changed files**. This also verifies the supplemental context files used to
correct the proposed fixes. This is source verification, not a new Lean build.

## Rejected findings

**3 — multiplication example.** The accepted audit already says that its
multiplier is bounded and continuous, with a nonnegative multiplier for the
contraction example. The roadmap requires a multiplication-semigroup example;
it does not require that example to have an unbounded generator. The general
unbounded-generator API and the bounded example are compatible. The proposed
new acceptance obligation is unsupported.

**27 — faithful-action line number.** The proposed correction is wrong at the
pin. In [PSLAction.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Complex/UpperHalfPlane/PSLAction.lean#L189),
the documentation occupies lines 187–188; the faithful-action instance starts
at **189** and its first field at 190. The accepted review's correction to
189 is already right. The red team's quotation is shifted by one line.

## Corrections the fixer must preserve

Confirmation means that the audit has a defect worth fixing; it does not
approve every sentence of the proposed replacement. The per-finding JSON
reasons are the detailed instructions. The following prevent the main
corrections from introducing new gaps or overstating existing APIs.

- **4–8, 44–45:** credit Mathlib's RKHS and arbitrary-index `Matrix.PosSemidef`
  predicate alongside Tau Ceti's Kolmogorov/Gaussian material. The missing
  explicit Gaussian representing measure and the BCR/Bernstein acceptance
  dictionary still prevent the two affected semigroup acceptance layers from
  being fully built. Existing time-axis finite-difference results are useful
  inputs, not that complete dictionary. Keep the Bernstein endpoint regularity
  convention correct. Coordinate all additions with the five-citation cap.
- **10–15, 18–20:** covolume's default value without a fundamental domain does
  not establish cofiniteness. Distinguish strict translation width from the
  full cusp stabilizer and GL results from the PSL orientation-preserving
  setting. Quotient topology and local analytic order are real partial
  suppliers. Neither a bare equivalence with disc coordinates nor the
  topological power covering supplies the required holomorphic chart. Triangle
  matrix representations alone do not prove discreteness or faithfulness.
- **28–32, 39–40:** retain the real-cost versus extended-cost boundary, the
  finite-domain/extended-valued Fenchel distinction, the weighted Sobolev
  integration-by-parts issue, the Borel restriction needed for Lusin–Souslin,
  and the padding/countable-family inputs needed for a chain projective limit.
- **42:** `C([0,T], X)` already has the Borel/evaluation infrastructure. For a
  complete separable metric target it also has an inferred **PolishSpace**
  instance: metric structure on a compact-domain continuous-map space,
  completeness, second countability, and the generic completely-metrizable
  Polish instance compose. A missing declaration literally named
  `PolishSpace C(X,Y)` is not a missing instance. For a topologically Polish
  target, choose the compatible complete metric as usual. Do not copy the
  proposed new Polishness gap. The specific uniformization and dynamic-plan
  statements still require work.
- **43, 52–54:** BV variation measures use right-limit representatives in the
  complete normed setting; this does not build the general metric Skorokhod
  theory. The shared metric length/geodesic predicates exist. Arc-length
  parameterization is variation-based, while the cited AC differentiability
  theorem is real-valued. The Jacobian supplier needs injectivity of the
  gradient, and the Hilbert energy identity needs its stated differentiability
  and integrability. Algebraic covariance identities and weak convergence of
  empirical measures do not prove transport optimality or barycenter
  convergence. Use the full `TauCeti.Probability` namespace for the empirical
  measure theorem.
- **46–47:** record the explicit BMO/VMO, Schauder and heat-flow consumption
  boundaries. Linear variable-coefficient estimates and nonlinear
  Monge–Ampère section estimates are distinct. OT explicitly assigns local
  VMO construction to itself; this finding does not authorize silently moving
  that ownership to PDE.
- **48–50, 55–56:** the transport liminf/recovery specialization of variational
  convergence exists, including convergence after refining filters; do not
  promise convergence of an arbitrary entire family of minimizers. Private
  `RealPlans` compactness/nonemptiness lemmas are not public API. An independent
  transport matrix does not establish support-constrained feasibility. Apply
  the three absent/partial calibration fixes to their actual target statements,
  and replace copied sublayer/summary claims without adding another false
  “only” assertion.
- **57–59:** replace private Perron citations with the public contour machinery.
  The private rectangle Cauchy–Goursat identity itself is general in its
  holomorphic integrand; only the two quoted bounds are Perron-specific. A
  rectangle contour needs an open neighborhood containing its boundary and
  the finite singular-set/winding setup. Mathlib's restricted-von-Mangoldt
  boundary remainder matches the smoothed Wiener–Ikehara hypotheses, with
  nonzero modulus and invertible residue class. Unsmoothing, coefficient
  adapters and prime-power/counting transfers remain work.
- **60–65:** the progression divergence has weight `log p / p`. Ideal weights
  supply the initial Euler products, not a formal general Hecke-character
  theory; unitary weights justify the `Re s > 1` region. The Galois-character
  product removes all extension-ramified factors, so it is a partial Artin
  product. The residue-class boundary function is a combination of character
  logarithmic derivatives, not generally one `-L'/L`. Correct the convergence
  citation to **Estimates.lean:476**. Natural and Dirichlet density are distinct;
  a holomorphic logarithm requires the branch theorem's simply connected
  absolute-convergence region.
- **67–69:** the closed-half-plane result concludes continuity using an M-test;
  retain its related fit. Cite the actual Dirichlet-character Euler product and
  ideal-counting asymptotic. Add the divisor floor-sum identities while keeping
  the missing hyperbola/error-term work explicit; the auxiliary convolution
  theorem starts at **Misc.lean:420**, not 418. The Lerch identity needs the
  factor `z = exp(2πia)`, first on the convergence domain and then for compatible
  continuations. Do not assert it at totalized pole values.

The normalization in finding 69 is independently checked against
[NIST DLMF 25.14.1](https://dlmf.nist.gov/25.14#E1) and
[25.14.3](https://dlmf.nist.gov/25.14#E3), accessed 2026-09-24.
The series reindexing gives `expZeta a s = z · Φ(z,s,1)` on `Re s > 1`.

## Sources and reproducibility

All library links below use the full pins, not current main:
[Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib)
and
[Tau Ceti f790474821cf4256814db967cb154e7af3d0c369](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369/TauCeti).
The JSON reasons give statement locators and hypotheses. The appendix records
public URLs for the red team's 130 explicit source files; additional
instance/normalization sources used in this review follow it.

<details>
<summary>Pinned source-file index</summary>

- [Mathlib/Analysis/Analytic/Order.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Analytic/Order.lean)
- [Mathlib/Analysis/Calculus/InverseFunctionTheorem/Deriv.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Calculus/InverseFunctionTheorem/Deriv.lean)
- [Mathlib/Analysis/Complex/CauchyIntegral.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Complex/CauchyIntegral.lean)
- [Mathlib/Analysis/Complex/CoveringMap.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Complex/CoveringMap.lean)
- [Mathlib/Analysis/Complex/Periodic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Complex/Periodic.lean)
- [Mathlib/Analysis/Complex/UpperHalfPlane/Metric.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Complex/UpperHalfPlane/Metric.lean)
- [Mathlib/Analysis/ConstantSpeed.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/ConstantSpeed.lean)
- [Mathlib/Analysis/Convex/Approximation.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Convex/Approximation.lean)
- [Mathlib/Analysis/Convex/DoublyStochasticMatrix.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Convex/DoublyStochasticMatrix.lean)
- [Mathlib/Analysis/Convex/Function.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Convex/Function.lean)
- [Mathlib/Analysis/InnerProductSpace/Reproducing.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/InnerProductSpace/Reproducing.lean)
- [Mathlib/Analysis/Meromorphic/Divisor.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Meromorphic/Divisor.lean)
- [Mathlib/Analysis/Meromorphic/Order.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Meromorphic/Order.lean)
- [Mathlib/Geometry/Manifold/Riemannian/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Geometry/Manifold/Riemannian/Basic.lean)
- [Mathlib/Geometry/Manifold/VectorBundle/Riemannian.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Geometry/Manifold/VectorBundle/Riemannian.lean)
- [Mathlib/InformationTheory/KullbackLeibler/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/InformationTheory/KullbackLeibler/Basic.lean)
- [Mathlib/LinearAlgebra/Matrix/PosDef.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/PosDef.lean)
- [Mathlib/LinearAlgebra/Projectivization/Action.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Projectivization/Action.lean)
- [Mathlib/MeasureTheory/Constructions/BorelSpace/ContinuousMap.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Constructions/BorelSpace/ContinuousMap.lean)
- [Mathlib/MeasureTheory/Constructions/Polish/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Constructions/Polish/Basic.lean)
- [Mathlib/MeasureTheory/Covering/Vitali.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Covering/Vitali.lean)
- [Mathlib/MeasureTheory/Function/AbsolutelyContinuous.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Function/AbsolutelyContinuous.lean)
- [Mathlib/MeasureTheory/Function/Jacobian.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Function/Jacobian.lean)
- [Mathlib/MeasureTheory/Group/FundamentalDomain.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Group/FundamentalDomain.lean)
- [Mathlib/MeasureTheory/Measure/CharacteristicFunction/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Measure/CharacteristicFunction/Basic.lean)
- [Mathlib/MeasureTheory/Measure/LevyConvergence.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Measure/LevyConvergence.lean)
- [Mathlib/MeasureTheory/Measure/LevyProkhorovMetric.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Measure/LevyProkhorovMetric.lean)
- [Mathlib/MeasureTheory/Measure/Prokhorov.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Measure/Prokhorov.lean)
- [Mathlib/MeasureTheory/VectorMeasure/BoundedVariation.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/VectorMeasure/BoundedVariation.lean)
- [Mathlib/NumberTheory/ArithmeticFunction/Misc.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ArithmeticFunction/Misc.lean)
- [Mathlib/NumberTheory/EulerProduct/DirichletLSeries.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/EulerProduct/DirichletLSeries.lean)
- [Mathlib/NumberTheory/LSeries/HurwitzZeta.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/HurwitzZeta.lean)
- [Mathlib/NumberTheory/LSeries/HurwitzZetaEven.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/HurwitzZetaEven.lean)
- [Mathlib/NumberTheory/LSeries/PrimesInAP.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/PrimesInAP.lean)
- [Mathlib/NumberTheory/LSeries/ZetaZeros.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/ZetaZeros.lean)
- [Mathlib/NumberTheory/ModularForms/ArithmeticSubgroups.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/ArithmeticSubgroups.lean)
- [Mathlib/NumberTheory/ModularForms/Cusps.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Cusps.lean)
- [Mathlib/NumberTheory/NumberField/DedekindZeta.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/DedekindZeta.lean)
- [Mathlib/NumberTheory/NumberField/Ideal/Asymptotics.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Ideal/Asymptotics.lean)
- [Mathlib/NumberTheory/SumPrimeReciprocals.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/SumPrimeReciprocals.lean)
- [Mathlib/Probability/BrownianMotion/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Probability/BrownianMotion/Basic.lean)
- [Mathlib/Probability/Decision/BayesEstimator.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Probability/Decision/BayesEstimator.lean)
- [Mathlib/Probability/Distributions/Gaussian/Multivariate.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Probability/Distributions/Gaussian/Multivariate.lean)
- [Mathlib/Topology/Algebra/ConstMulAction.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/ConstMulAction.lean)
- [Mathlib/Topology/Compactification/OnePoint/ProjectiveLine.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Compactification/OnePoint/ProjectiveLine.lean)
- [Mathlib/Topology/ContinuousMap/SecondCountableSpace.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/ContinuousMap/SecondCountableSpace.lean)
- [Mathlib/Topology/EMetricSpace/BoundedVariation.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/EMetricSpace/BoundedVariation.lean)
- [Mathlib/Topology/EMetricSpace/VariationOnFromTo.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/EMetricSpace/VariationOnFromTo.lean)
- [Mathlib/Topology/MetricSpace/GromovHausdorff.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/MetricSpace/GromovHausdorff.lean)
- [Mathlib/Topology/MetricSpace/HausdorffDimension.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/MetricSpace/HausdorffDimension.lean)
- [Mathlib/Topology/Semicontinuity/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Semicontinuity/Basic.lean)
- [Mathlib/Topology/UniformSpace/CompactConvergence.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/UniformSpace/CompactConvergence.lean)
- [Mathlib/Topology/UniformSpace/UniformApproximation.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/UniformSpace/UniformApproximation.lean)
- [TauCeti/Analysis/Analytic/Order.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Analytic/Order.lean)
- [TauCeti/Analysis/Bochner/BochnerTheorem.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Bochner/BochnerTheorem.lean)
- [TauCeti/Analysis/Bochner/Fourier/Convention.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Bochner/Fourier/Convention.lean)
- [TauCeti/Analysis/Bochner/Gaussian/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Bochner/Gaussian/Basic.lean)
- [TauCeti/Analysis/Calculus/Morse/GradientFlow.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Calculus/Morse/GradientFlow.lean)
- [TauCeti/Analysis/CompletelyMonotone/Composition.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/CompletelyMonotone/Composition.lean)
- [TauCeti/Analysis/Complex/Fuchsian/ProperAction.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Complex/Fuchsian/ProperAction.lean)
- [TauCeti/Analysis/Complex/Periodic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Complex/Periodic.lean)
- [TauCeti/Analysis/Complex/RootsOfUnityQuotient.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Complex/RootsOfUnityQuotient.lean)
- [TauCeti/Analysis/Complex/UpperHalfPlane/DiscCoordinate.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Complex/UpperHalfPlane/DiscCoordinate.lean)
- [TauCeti/Analysis/Complex/UpperHalfPlane/PSLAction.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Complex/UpperHalfPlane/PSLAction.lean)
- [TauCeti/Analysis/Complex/UpperHalfPlane/ProperAction.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Complex/UpperHalfPlane/ProperAction.lean)
- [TauCeti/Analysis/Complex/UpperHalfPlane/Rho.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Complex/UpperHalfPlane/Rho.lean)
- [TauCeti/Analysis/Contour/Argument/Cycle.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Contour/Argument/Cycle.lean)
- [TauCeti/Analysis/Contour/Residue/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Contour/Residue/Basic.lean)
- [TauCeti/Analysis/Contour/Residue/Cycle.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Contour/Residue/Cycle.lean)
- [TauCeti/Analysis/Contour/Residue/LogDeriv.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Contour/Residue/LogDeriv.lean)
- [TauCeti/Analysis/Contour/StarConvex.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Contour/StarConvex.lean)
- [TauCeti/Analysis/Matrix/GeometricMean.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Matrix/GeometricMean.lean)
- [TauCeti/Analysis/Normed/Module/Complexification.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Normed/Module/Complexification.lean)
- [TauCeti/Analysis/Normed/Operator/Resolvent/Analytic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Normed/Operator/Resolvent/Analytic.lean)
- [TauCeti/Analysis/PositiveDefinite/Function/Kernel.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/PositiveDefinite/Function/Kernel.lean)
- [TauCeti/Analysis/PositiveDefinite/Kernel/Kolmogorov.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/PositiveDefinite/Kernel/Kolmogorov.lean)
- [TauCeti/Analysis/PositiveDefinite/SemigroupGroup/FourierLaplace/Uniqueness.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/PositiveDefinite/SemigroupGroup/FourierLaplace/Uniqueness.lean)
- [TauCeti/Analysis/PositiveDefinite/SemigroupGroup/Time/Axis.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/PositiveDefinite/SemigroupGroup/Time/Axis.lean)
- [TauCeti/Analysis/Semigroups/Complexification.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Semigroups/Complexification.lean)
- [TauCeti/Analysis/Semigroups/Generator/ComplexLinear.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Semigroups/Generator/ComplexLinear.lean)
- [TauCeti/Analysis/Semigroups/Multiplication.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Semigroups/Multiplication.lean)
- [TauCeti/Analysis/Semigroups/Resolvent/PowerBounds.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Semigroups/Resolvent/PowerBounds.lean)
- [TauCeti/Analysis/Sobolev/RellichKondrachov.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Sobolev/RellichKondrachov.lean)
- [TauCeti/Analysis/Sobolev/W1p/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Sobolev/W1p/Basic.lean)
- [TauCeti/Analysis/Sobolev/WeakDeriv.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Sobolev/WeakDeriv.lean)
- [TauCeti/Combinatorics/PermutationTriple/GeometryType.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Combinatorics/PermutationTriple/GeometryType.lean)
- [TauCeti/Geometry/Manifold/Riemannian/Geodesic/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Basic.lean)
- [TauCeti/LinearAlgebra/Matrix/PosSemidef.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/Matrix/PosSemidef.lean)
- [TauCeti/MeasureTheory/MeasurableSpace/Analytic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/MeasureTheory/MeasurableSpace/Analytic.lean)
- [TauCeti/MeasureTheory/Measure/LowerSemicontinuousLintegral.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/MeasureTheory/Measure/LowerSemicontinuousLintegral.lean)
- [TauCeti/MeasureTheory/Measure/Prokhorov.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/MeasureTheory/Measure/Prokhorov.lean)
- [TauCeti/MeasureTheory/Measure/UnitIntervalMap.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/MeasureTheory/Measure/UnitIntervalMap.lean)
- [TauCeti/MeasureTheory/OptimalTransport/CTransform/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/MeasureTheory/OptimalTransport/CTransform/Basic.lean)
- [TauCeti/MeasureTheory/OptimalTransport/CTransform/CyclicalMonotonicity.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/MeasureTheory/OptimalTransport/CTransform/CyclicalMonotonicity.lean)
- [TauCeti/MeasureTheory/OptimalTransport/Chain.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/MeasureTheory/OptimalTransport/Chain.lean)
- [TauCeti/MeasureTheory/OptimalTransport/Cost/BoundedBelow.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/MeasureTheory/OptimalTransport/Cost/BoundedBelow.lean)
- [TauCeti/MeasureTheory/OptimalTransport/Existence.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/MeasureTheory/OptimalTransport/Existence.lean)
- [TauCeti/MeasureTheory/OptimalTransport/Finite/Duality.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/MeasureTheory/OptimalTransport/Finite/Duality.lean)
- [TauCeti/MeasureTheory/OptimalTransport/Finite/TransportMatrix.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/MeasureTheory/OptimalTransport/Finite/TransportMatrix.lean)
- [TauCeti/MeasureTheory/OptimalTransport/Monge.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/MeasureTheory/OptimalTransport/Monge.lean)
- [TauCeti/MeasureTheory/OptimalTransport/Stability.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/MeasureTheory/OptimalTransport/Stability.lean)
- [TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Basic.lean)
- [TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Quantile.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Quantile.lean)
- [TauCeti/NumberTheory/AbelSummation.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/AbelSummation.lean)
- [TauCeti/NumberTheory/ArithmeticDirichletSeries/AbelSummation.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ArithmeticDirichletSeries/AbelSummation.lean)
- [TauCeti/NumberTheory/ArithmeticDirichletSeries/Estimates.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ArithmeticDirichletSeries/Estimates.lean)
- [TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.lean)
- [TauCeti/NumberTheory/ArithmeticDirichletSeries/NaturalDensity.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ArithmeticDirichletSeries/NaturalDensity.lean)
- [TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/Basic.lean)
- [TauCeti/NumberTheory/ArithmeticDirichletSeries/Weight.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ArithmeticDirichletSeries/Weight.lean)
- [TauCeti/NumberTheory/Chebotarev/GaloisCharacter/Weight.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/Chebotarev/GaloisCharacter/Weight.lean)
- [TauCeti/NumberTheory/Chebotarev/RamifiedPrimes.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/Chebotarev/RamifiedPrimes.lean)
- [TauCeti/NumberTheory/LSeries/Continuity.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LSeries/Continuity.lean)
- [TauCeti/NumberTheory/LSeries/WienerIkehara/BoundaryGrowth.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LSeries/WienerIkehara/BoundaryGrowth.lean)
- [TauCeti/NumberTheory/Modular.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/Modular.lean)
- [TauCeti/NumberTheory/Modular/Stabilizer.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/Modular/Stabilizer.lean)
- [TauCeti/NumberTheory/ModularForms/Norm/Cusps.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Norm/Cusps.lean)
- [TauCeti/NumberTheory/ModularForms/Norm/Trace.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Norm/Trace.lean)
- [TauCeti/NumberTheory/ModularForms/Order/AtCusp.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Order/AtCusp.lean)
- [TauCeti/NumberTheory/ModularForms/Order/SubgroupOrbits.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Order/SubgroupOrbits.lean)
- [TauCeti/NumberTheory/ModularForms/QExpansion/BigO.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/QExpansion/BigO.lean)
- [TauCeti/NumberTheory/ModularForms/QExpansion/Order.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/QExpansion/Order.lean)
- [TauCeti/NumberTheory/NumberField/Global/RayClass/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/Global/RayClass/Basic.lean)
- [TauCeti/Probability/Distributions/Exponential.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Probability/Distributions/Exponential.lean)
- [TauCeti/Probability/Exchangeability/ConditionallyIID/WeakConvergence.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Probability/Exchangeability/ConditionallyIID/WeakConvergence.lean)
- [TauCeti/Probability/HasLaw.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Probability/HasLaw.lean)
- [TauCeti/Probability/Quantile.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Probability/Quantile.lean)
- [TauCeti/Topology/Algebra/Matrix/ProjectiveSpecialLinearGroup.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/Algebra/Matrix/ProjectiveSpecialLinearGroup.lean)
- [TauCeti/Topology/MetricSpace/Length.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/MetricSpace/Length.lean)
- [TauCeti/Topology/Semicontinuity/Approximation.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/Semicontinuity/Approximation.lean)

</details>

Supplemental declarations used to narrow the fixes:

- [Mathlib/Topology/ContinuousMap/Compact.lean:85](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/ContinuousMap/Compact.lean#L85)
- [Mathlib/Topology/MetricSpace/Polish.lean:65](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/MetricSpace/Polish.lean#L65)
- [Mathlib/Topology/Metrizable/CompletelyMetrizable.lean:172](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Metrizable/CompletelyMetrizable.lean#L172)
- [Mathlib/Topology/Bases.lean:915](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Bases.lean#L915)
- [Mathlib/Analysis/Convex/Birkhoff.lean:166](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Convex/Birkhoff.lean#L166)
- [TauCeti/Analysis/PositiveDefinite/SemigroupGroup/Time/Axis.lean:155](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/PositiveDefinite/SemigroupGroup/Time/Axis.lean#L155)
- [TauCeti/NumberTheory/Chebotarev/GaloisCharacter/Weight.lean:237](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/Chebotarev/GaloisCharacter/Weight.lean#L237)
- [TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Logarithm/VonMangoldtCoeff.lean:118](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Logarithm/VonMangoldtCoeff.lean#L118)

## Validation and limits

The result/review checker and intake `check-files` pass. All 69 finding IDs
are present once in source order. Only this report and the corresponding
review JSON are changed. Publication checks their exact two-file scope and
compares the reviewed inputs with the publication base.

No Lean file was changed or compiled; no new formalization is claimed. This
is complete verification of the 69 submitted findings, not a new certification
of every unaffected audit entry, every red-team clean claim, or the unread
primary-source proofs recorded in the earlier analytic-number-theory
extraction. The later fix job must use the confirmed reasons, including the
restrictions above, when editing the audit.
