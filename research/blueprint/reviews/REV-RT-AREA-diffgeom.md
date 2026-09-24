# REV-RT-AREA-diffgeom

Independent verifier: Codex — codex-a71f92. Date: 2026-09-24.
Input author: Claude Code — cc-39fac3. I did not write the red-team findings.
Snapshot: `6f022a705b7a4f467452f1ace30df07e1f9d94f4`.
Scope: all 16 findings; review only, with no upstream or atlas mutations.

## Verdict

14 confirmed, with the qualifications and corrected fixes in the companion JSON;
2 rejected: /8 (already-applied coverage/status overlay) and /16 (duplication
not established). The high/medium findings /1–7 have substantive corrections;
their confirmed status is not permission to apply the original fixes verbatim.

The principal distinctions are:

- A missing named proof step is not a false Hopf–Rinow theorem.
- A smooth local flow at one model-space point is not a smooth maximal flow
  on an open joint manifold domain.
- Historical upstream roadmap prose, accepted target coverage, and effective
  atlas stage status are different objects.
- A consumer interface gap is not evidence that a general theorem is the
  only possible proof route, or that two specialized constructions duplicate
  one another.

## Public sources independently checked

All URLs below were accessed on 2026-09-24. These are public copies of the
primary books, not summaries. I did not authenticate the original report's
nonpublic do Carmo locators and do not rely on them for confirmation.

- [Lee, Introduction to Riemannian Manifolds, second edition](https://lps.elte.hu/gomori/spacetime-geometry/readings/%28Graduate%20texts%20in%20mathematics%20176%29%20Lee%2C%20John%20M%20-%20Introduction%20to%20Riemannian%20manifolds%20%28Corrected%20version%20of%20second%20edition%29-Springer%20Nature%20%282018%29.pdf):
  Lemma 6.2 (pp. 153–154), Gauss lemma Theorem 6.9 (pp. 159–160),
  Lemma 6.14 and Theorem 6.15 (pp. 163–166), Lemma 6.18 (pp. 167–169),
  and Theorem 6.19 / Corollaries 6.20–6.22 (pp. 169–172).
  The proof of Lemma 6.18 explicitly needs the no-corner step in the
  normal-sphere continuation. The preliminary symmetry identity is used in
  Gauss's lemma. The discussion of isometry groups on p. 13 distinguishes
  the general Lie-group theorem from the definition of smooth isometry.
- [Lee, Introduction to Smooth Manifolds, second edition](https://julianchaidez.net/materials/reu/lee_smooth_manifolds.pdf):
  Proposition 3.18 (pp. 66–67), including the total-space separation argument,
  and Theorem 9.12 (pp. 212–215), including the construction of the maximal
  smooth flow domain.
- [Author's IRM corrections, July 25, 2026](https://sites.math.washington.edu/~lee/Books/RM/errata.pdf):
  the pp. 164–165 corrections matter to /1. Use the corrected radius
  expression and keep the whole curve segment in the relevant normal ball.
  These are already-published corrections, not newly discovered source errors.

## Pinned library checks

I read the cited declarations with their enclosing variables, namespaces,
regularity assumptions and interval conventions at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Paths here are relative to the
respective library root. The decisive statement inventory is:

| Findings | Statements checked |
| --- | --- |
| /1–5 | TauCeti/Analysis/ODE/InitialCondition.lean:164; TauCeti/Geometry/Manifold/LocalDiffeomorph.lean:206; IntegralCurve/Maximal.lean:104,194,248; Riemannian/Geodesic/Basic.lean:106,142; Geodesic/Maximal.lean:109,127,149,191,199,215,270. Mathlib/Geometry/Manifold/IntegralCurve/ExistUnique.lean:189,227,239,253; Mathlib/Analysis/ODE/ExistUnique.lean:113,167,193; Mathlib/Topology/FiberBundle/Basic.lean:288. |
| /3, /7 | TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/AlongCurve/Basic.lean:106,127,175,206,273,299,334; AlongCurve/Pullback.lean:283,346; AlongCurve/Metric.lean:349; TauCeti/Geometry/Manifold/ContMDiff/Prod.lean:45 (a near match, not the symmetry lemma). |
| /6 | Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/Metric.lean:155; LeviCivita.lean:201,255,359,408. TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Basic.lean:350,363,391; Regularity.lean:256,273,292. |
| /7, /9, /11 | TauCeti/Geometry/Manifold/Riemannian/Geodesic/Spray.lean:107,162,270,282; Smoothness.lean:79; ConstantSpeed.lean:97; IntegralCurve/Extension.lean:109,135,162,185; IntegralCurve/Maximal.lean:264,296,328. |
| /8 | TauCeti/Geometry/Manifold/Riemannian/ArcLength.lean:70; EVariationComparison.lean:302,318; TauCeti/Geometry/Manifold/PiecewisePath.lean:65; Riemannian/PiecewisePath.lean:85; EDistComparison.lean:159,197; Restriction.lean:289; Convex.lean:150; Distance.lean:152,250,257. Mathlib/Geometry/Manifold/Riemannian/PathELength.lean:105,138. |
| /9 | Mathlib/Topology/VectorBundle/Riemannian.lean:223,328; Mathlib/Geometry/Manifold/Riemannian/Basic.lean:242; Mathlib/Topology/MetricSpace/ProperSpace.lean:84. |
| /10, /12 | TauCeti/Topology/MetricSpace/Length.lean:159,172,223,290,301; TauCeti/Geometry/Manifold/Riemannian/EVariationComparison.lean:302; Distance.lean:77 and the finite-distance/ordinary-metric sections; Mathlib/Geometry/Manifold/Riemannian/Basic.lean:81; PathELength.lean:250. |
| /13, /16 | Mathlib/Geometry/Manifold/IntegralCurve/Basic.lean:66,72,77; Mathlib/Analysis/ODE/Basic.lean:54; Mathlib/Analysis/Complex/UpperHalfPlane/Metric.lean:252; TauCeti/Topology/MetricSpace/Length.lean:223,290. |

The interval-aware uniqueness claim requires a new chartwise bridge, not a
direct application of a normed-space theorem to a manifold. Smoothness and
finite-dimensionality assumptions remain explicit. The Levi-Civita uniqueness
statement is about differentiable fields; it is not unrestricted extensional
equality on arbitrary functions.

Independent searches included the declaration index and both source trees
for exponential domains/maps, normal neighbourhoods, Gauss/first variation,
two-parameter symmetry, Riemannian isometries, manifold flows and endpoint
uniqueness. A whole-tree multiline search for T2Space near TotalSpace or
TangentBundle found the extra hypothesis in Geodesic/Maximal, not an instance.
Near matches (product-model equivalence, fibrewise T2Space, model-space flows)
were opened rather than counted as full implementations. Negative searches
are bounded to these pinned trees; no claim is made about later revisions.

## Roadmap and integration checks

I read the full HopfRinow README and all five stage descriptions and accepted
coverage layers, the input JSON/report, and the relevant consumer text in
GeometricTopology L7/L8, OptimalTransport L7/L8, FuchsianOrbifolds L2,
LieGroups L4 and its accepted link map, and HeegaardFloer's gradient-flow
inventory. The stage/consumer checks use the same snapshot as the review.

I also read `scripts/library_coverage.py`, the status-loading portion of
`scripts/theory_graph.py`, and the coverage/link-loading portion of
`scripts/build.py`. A read-only reproduction using
`theory_graph.stage_statuses` and `decompositions.merge_links` with the
accepted `data/links` packets returned:

| HopfRinow layer | Effective status |
| --- | --- |
| 0 | complete |
| 1 | in_progress |
| 2 | planned |
| 3 | in_progress |
| 4 | in_progress |

It also returned the reviewed H1 → LieGroups L0 inverse-function edge.
Accordingly /8 is rejected, /14 retains only the five genuinely absent
consumer edges, and /6–7 must not overwrite valid status/coverage overlays.

For /15, the fix is a shared-isometry import and an explicit proof route for
the maximal model groups, not an unconditional demand for general
Myers–Steenrod. For /16, a full hyperbolic line and a normalized finite metric
segment are different interfaces. Useful future specialization does not
establish a duplicated generic definition.

## Applying the confirmed findings

These are upstream Tau Ceti roadmaps. Follow PROTOCOL §15: send maintainers
precise notes and route genuinely new general work through the owner/Part II
mechanism. Do not rewrite the upstream roadmap as a new atlas plan.

The JSON gives the corrected fix for every confirmation. In particular:

- /1–3 expose the missing intermediate theorem interfaces without pretending
  that their ingredients are unavailable.
- /4–5 supply separation and endpoint bridges with their actual hypotheses.
- /6–7 remove stale library-absence claims but leave genuinely missing flow
  and exponential constructions open.
- /9–12 distinguish reusable generic results, generalizations, and
  automatically derivable connectedness from full Hopf–Rinow implementation.
- /14–15 use the reviewed link workflow and preserve existing accepted edges.

## Validation and limits

Both deliverables pass `scripts/check_redteam.py` and the scoped
`research/blueprint/intake.py check-files` submission check. Every input
finding has exactly one verdict. No Lean file is required or changed, and no
Lean elaboration was run; statement/source verification is not a compilation
claim. No source theorem or proposed missing lemma is claimed formalized by
this review.
