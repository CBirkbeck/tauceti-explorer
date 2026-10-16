# Independent review: R09.7d

Accepted after correction as a **complete target-level planning pass**. R09.7d remains **planned**, and both implementation statuses remain **unchecked**. Reviewer: Codex, session `codex-OaVgRf`, issue #9916, job `REV-AlgebraicModuliForArithmeticGeometry--R09.7d`, 2026-10-16. The input was written by the independent session `codex-YhNZtu` in #9912.

The corrected [packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7d.json) contains **two nodes, both corrected: one application and one construction**. No node was added or left unverifiable. There are **14 interface clauses and nine geometric test groups**: seven clauses/four checks on the imported realization, and seven clauses/five checks on the lift construction. The checker counts only the latter seven/five because the former node is now an application. Nine pinned baseline references are confirmed; none was removed or replaced. There is **one new planet**, **two explicit supplier requests**, no recorded mathematical gap and no source-issue finding. Four existing R09.7d planets owned by R09.7a remain, so the combined layer has five.

## Corrections

1. **Remove duplicate analytification ownership.** [ComplexComparison PR196](https://github.com/TauCetiProject/TauCetiRoadmap/pull/196), at unchanged head `4bd72379658126cbe9be935656396f0c9dac4de0`, already owns the complex-point topology, scheme analytification, smooth complex-manifold specialization, open-immersion comparison and étale local biholomorphisms. Its [standing conventions and Layers 0–2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4bd72379658126cbe9be935656396f0c9dac4de0/TauCetiRoadmap/CohomologicalPointCounting/ComplexComparison/README.md) explicitly include the smooth case. Its Suggested.lean was also read; these remain targets, not implementations. The accepted ComplexComparisonPartII packet imports that same supplier. PR853's attribution to Part II C−1.1 does not justify constructing another smooth functor here.

   Converted `smooth-complex-points` from a construction to an **application**, retaining its identifier and useful coordinate compatibility requirements and tests. Removed its duplicate planet. Replaced the proposed downward ownership move by a precise A0-extension integration request identifying PR196's path, layers, head and required outputs. No exact atlas layer anchor exists for that upstream subroadmap, so no fictitious baseline declaration was added. The read A0-extension `space-analytification` node extends a scheme input to spaces; it does not supply this missing integration. The lift's proof, imports, coverage, upstream notes, reader and Lean inventory now use the single shared realization. These changes supersede the original author's handoff instructions to construct or move that realization.

2. **Distinguish closed and locally closed affine presentations.** Restricted the polynomial-zero-locus clause of `smoothComplexPoints.affineChart` to a **closed** affine embedding. A locally closed presentation must retain its open nonvanishing conditions. For example, the usual inclusion of G_m into A¹ has image C minus zero, which is not a polynomial zero locus in C. The existing principal-open test discriminates this error. Synchronized the packet and reader.

3. **Update bookkeeping and the compact-file boundary.** Recorded the additional upstream inspection, changed the node/planet/request counts and follow-up instructions, and clarified the suggested file's application inventory. Executable Lean statements were unchanged. No other packet, roadmap, library or atlas file was edited.

## Sources independently checked

All four PDFs were fetched independently; their SHA256 hashes agree with the packet. The following locators were read, including the imported compactification contracts. No source passage is reproduced and no restricted book is required.

| Source and locators | What was checked |
| --- | --- |
| Serre, [GAGA](https://www.numdam.org/item/AIF_1956__6__1_0.pdf), §1 nos. 1–2, 4, pp. 3–6; §2 no. 5, Lemma 1 and Proposition 2, pp. 7–9; no. 6, pp. 9–11 | Affine analytic topology, regular maps and overlap gluing support the imported smooth realization. Its point carrier must be over C. Completion and local-ring comparison are beyond the zero-set argument required here. |
| Bierstone–Milman, [published article](https://mahalex.net/teaching/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), p. 213; Theorem 1.10, pp. 216–217; Remark 1.18, p. 225; (3.1), Definition 3.2, Lemma 3.3 and §3.5, pp. 231–233 | The smooth Jacobian presentation and rational regular coordinate functions justify the coordinate compatibility argument. The finite smooth exceptional collection and principalization conventions support the imported strict boundary. |
| Same article, Theorem 11.14, pp. 290–291; Theorem 12.2, p. 292; Theorem 13.2 and following comparison, pp. 297–298 | The imported resolution/principalization route preserves the prescribed smooth open. Projectivity also requires projective closure and projective blowups; it is not inferred from properness. |
| Deligne, [Théorie de Hodge II](https://www.numdam.org/item/PMIHES_1971__40__5_0.pdf), (3.1.2), p. 31; proof of (3.1.9), pp. 33–34; (3.2.1), pp. 34–35 | Local full/punctured polydisc pairs and the quasi-projective alternative support the claimed input. The projective completion with smooth boundary components is the relevant alternative; arbitrary separated compactification is not needed. |
| Same article, (4.4.3), p. 51 | Essential surjectivity cites Borel, so the abelian-family comparison is not an independent shortcut to the consuming extension theorem. |
| Bakker–Klingler–Tsimerman, [arXiv v2](https://arxiv.org/pdf/1810.04801v2), §4.1, p. 13, local pair and (4.1), corresponding to published p. 928 | The period-map restriction uses the stated local source pair. Finite refinements, buffering and definability remain consuming adaptations; pointwise charts alone assert no finite subcover. No global definability result is imported. |

`sourceIssues` is empty. These checks disclosed no additional error in the cited source passages. Findings against other source passages in supplier packets retain their own reviews; this verdict does not reclassify those findings.

## Baseline and current-library checks

Every listed statement was independently read at Mathlib commit `082e2d37e8b0463410cdb532e111cd43d5a66174`. The recorded Tau Ceti pin is `f790474821cf4256814db967cb154e7af3d0c369`; the suggested file imports only Mathlib.

| Declaration | Actual contract checked at the pin |
| --- | --- |
| `AlgebraicGeometry.Scheme.Hom.IsOver`, `AlgebraicGeometry/Over.lean` | The structure-map equation for a morphism over a named base, not an arbitrary Spec C map. |
| `ChartedSpaceCore.toChartedSpace`, `Geometry/Manifold/ChartedSpace.lean` | Constructs the native charted space on the atlas-generated topology; analytic compatibility remains a separate obligation. |
| `IsManifold`, `Geometry/Manifold/IsManifold/Basic.lean` | Compatibility with the differentiability groupoid, including analytic regularity over the complex model. It does not itself assert Hausdorffness or second countability. |
| `AnalyticAt.hasStrictFDerivAt`, `Analysis/Calculus/FDeriv/Analytic.lean` | Gives the strict Fréchet derivative of an analytic map; invertibility is additional. |
| `HasStrictFDerivAt.toOpenPartialHomeomorph`, `Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean` | Requires a complete source and an invertible continuous linear strict derivative; retains the actual forward function. |
| `OpenPartialHomeomorph.hasFPowerSeriesAt_symm`, `Analysis/Analytic/Inverse.lean` | Gives an inverse power series at the image of a point in the source when the linear coefficient equals the specified continuous linear equivalence. |
| `Topology.IsOpenEmbedding`, `Topology/Defs/Induced.lean` | Embedding, injectivity, induced topology and open range, sufficient for the conditional topological lift. |
| `Set.pi`, `Data/Set/Operations.lean` | Native product of sets indexed by the specified index set, including the empty product. |
| `Metric.ball`, `Topology/MetricSpace/Pseudo/Defs.lean` | The strict metric-ball inequality; at zero in C this is the required strict norm inequality. |

The reviewed AUDIT-01 R09.7d verdict is “not built”; adic polydiscs have a different carrier. Accepted RS-27 leaves R09.7d intact and assigns general blowups to StableReduction Layer 4. Current TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were inspected read-only. AlgebraicVectorBundles and StableReduction README/Suggested files were checked, with focused reading of their algebraic/analytic ownership boundaries and general blowup contract. All nine roadmaps newer than the atlas snapshot were screened. AnalyticToricGeometry remains toric and chartwise; RealAlgebraicGeometry Layer 7 already owns the analytic inversion/parameter toolkit. Current native manifold gluing is existing infrastructure, not a new target here. None licenses a second scheme analytification alongside PR196.

## Closure, API and tests

The four accepted R09.7 suppliers were read at their statements: `regular-coordinates`, `snc-boundary`, `snc-compactification` and `analytic-polydisc`. Their reachable node graph has 42 nodes and no node cycle; terminal stage references are A0-extension, R09.1, SF.0 and SF.3, with the owner packet's precise requests retained. Those references are requested inputs, not completed implementations. The new A0-extension request identifies the existing upstream scheme carrier without importing the higher-tier coherent-comparison roadmap. R09.1's exact closure node is still absent. The stage scope and ShimuraVarieties V3/PELModuli M3 consumer contracts were checked. No Borel, polarized-family algebraization or aggregate R09.7 node is used as a prerequisite of itself.

For the lift, the imported chart identifies the complement with the punctured polydisc. Restrict its inverse and compose with the inverse of the prescribed open immersion onto its image. This gives both analytic directions and the exact image; injectivity proves uniqueness and the commuting square. The same square proves compatibility under shrinking and permutations. Nonincident components are avoided, and labels denote globally smooth distinct germs. Positive radii, dimension zero, the empty boundary and a specified k-to-C embedding where needed are retained. The two nodes have appropriate target-level size; no auxiliary proof lemmas need separate nodes.

All 14 interface clauses and nine test groups were checked. The imported-interface tests reject a wrong point carrier, a topology losing principal opens, a global inverse for z² on G_m, and unbased scalar conjugation. The lift tests distinguish the singleton zero-dimensional product from the empty set, the projective interior from a punctured chart, t=1/w from an arbitrary parametrization, and deletion of both coordinate axes from deletion of only their intersection. The nodal-cubic test is correct: x=q²−1 and y=q(q²−1) identify its normalization with P¹, with the node above q=±1 and no smooth point of the prescribed open lost. At the torus point (0,1), the translated ordinary-coordinate radius is chosen below one. The construction has seven API clauses and five discriminating tests, exceeding the required minimum of three.

## Validation and handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/AlgebraicModuliForArithmeticGeometry--R09.7d.json`: zero errors, zero warnings.
- `lean-check` at the pinned Mathlib: successful elaboration; five declaration-uses-sorry warnings and no other warnings or errors. The executable signatures are unchanged by review. The file is compact, with no admitted data definition or fabricated carrier.
- Reader/node statements, API/test names, review verdicts, counts, allowed deliverables, admitted-data scan and whitespace checks were checked.

Elaboration checks the conditional native topological lift, coordinate examples and use of the native inverse theorem. It does not instantiate scheme analytification, prove the admitted statements or establish the full analytic lift. The README remains authoritative for the geometric requirements.

No revision round is needed. Assembly must reconcile **R09.1 projective closure** and **A0-extension's integration of PR196**, replace PR853's stale attribution, and preserve the single shared carrier. Subsequent formalization must instantiate that interface and the full lift and geometric fixtures. These are explicit supplier/implementation obligations, not reasons to duplicate existing work. This review completes only #9916; no second job is taken.
