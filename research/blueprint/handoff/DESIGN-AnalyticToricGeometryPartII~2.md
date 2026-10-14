# Analytic toric geometry, Part II — revision round 2

Issue [#8920](https://github.com/CBirkbeck/tauceti-explorer/issues/8920), job `DESIGN-AnalyticToricGeometryPartII~2`. Worker: Codex (GPT-6), session `codex-17drGS`, 2026-10-14. The claim was confirmed by the swarm bot. This is the revision of the design in #4583 following the independent review in #4591; this worker has not reviewed or accepted its own revision.

The reader now agrees with the corrected packet. All 29 node objects, including their identifiers, mathematical statements, sources, APIs, tests and implementation statuses, are unchanged from the independently corrected input. The historical `review` object remains byte-for-byte equivalent as JSON: its `needs_changes` verdict is for the next independent reviewer to replace. The packet's author status is `complete`.

## Changes in this round

The reader has been synchronised with every correction, rather than just the two endpoint paragraphs. The audit checked every target statement, hypothesis, proof step, input, acceptance check, source locator and source match, all 61 API items, all 39 tests, all recorded uses and all eight supplier contracts. The roadmap introduction and layer descriptions agree with it. Each layer now also lists its dependencies explicitly.

The scientific checks retained all twelve corrections made by the independent reviewer:

| Correction | Evidence and consequence |
|---|---|
| Native ray divisors and field-fibre hypotheses | Scholze Definition/Proposition 8.4, p. 304; C0's arbitrary-ring chart node does not itself establish normal geometrically integral fibres or distinct codimension-one boundary primes. The expanded C0 request stays. |
| Arbitrary-ring sections and native divisorial sheaves | The free monomial basis supports tensor base change with nilpotents allowed. The pinned native sheaf requires integrality, local noetherianity and codimension-one stalk DVR instances, which remain explicit. |
| Unit models and their plus ring | Scholze §8, p. 304; multiplicative coefficient Gauss norm identifies the power-bounded integral subring. Unit disc and full affine-line analytification remain distinct; completeness, rather than projectivity, gives the proper comparison. |
| Perfected sections and graded algebra | Scholze Proposition 8.7, p. 306; multiplication is convolution. Disjoint weights 0 and 1 multiply to weight 1, and degrees 1 and −1 multiply to degree zero. The reader carries the convergent coefficient formula and norm bounds. |
| Projection line tests | Scholze Theorem 1.13 and discussion, pp. 249–250, and Theorem 8.5, p. 305. Residue-two mixed characteristic gives the [1:1:0] obstruction; an equal-characteristic ring identification is the additive control. |
| Projection cohomology imports | Scholze Proposition 8.6, p. 305, using the §7 torsion continuity result. H0 supplies ordinary cohomology; the cup-product export remains requested. Invertibility is not identity, as the projective-line top-degree control shows. |
| Nonzero dense-field approximation | Scholze Lemma 6.5 and Remark 6.6, pp. 288–290, and Proposition 8.7, p. 306. A finer threshold at the Gauss point forces the initial approximation to be nonzero; truncation preserves a chosen coefficient. Denominator clearing yields a section of O(p^N D), incorporating the previously confirmed extraction correction E11. |
| Balancing, wall sign and displacement | Fulton–Sturmfels Proposition 1.1, p. 4; Proposition 1.4/Theorem 2.1, p. 6; Corollary 2.4, p. 7; Proposition 3.1, p. 10; Theorem 3.2, p. 11, proof pp. 12–13. Divisor equation weights are the negatives of section-generator weights. Displacement occurs in the quotient by the output cone. |
| Positive degree and excess intersections | Scholze Corollary 8.8, p. 307, with the precise SF.0/SF.5 imports. Refined support forces nonemptiness even for the new equations with excess intersection. Positive degree supplies no connectedness conclusion. |
| Closed model versus geometric reduction | Scholze Corollary 8.8, p. 307; Stacks Varieties §33.6, Lemmas 33.6.3–33.6.4, tags 020I and 035X. Equations retain a model over the dense subfield. Reduction after imperfect base change need not descend as a reduced scheme. The x^p−t example tests this distinction, not density. |

The nonprojective complete regular fan agrees with Fujino–Sato Example 4.1, pp. 7–8, including all seven rays and ten maximal cones. It continues to distinguish completeness from projectivity before NT.6.

## Suggested Lean: current shape and exact limits

WORKERS.md's 2026-10-12 submission shape requires light real-bodied definitions on existing carriers and representative statements, with heavy geometric constructions remaining reader targets. The inherited file predates that rule. It contained admitted data maps and equivalences, and statements about arbitrary spaces, cohomology maps and degrees whose required toric hypotheses appeared only in comments. Those signatures have been removed, while their full targets, API and checks remain in the reader and packet.

The revised file is 273 lines, with 7 named theorems and 21 examples. Every data definition has a real body. Admissions in the two submodule definitions and the continuous projection are proof fields only. The coefficient-linear `toricPowerMap` now has a real body using `AddMonoidAlgebra.mapDomainAlgHom` and `nsmulAddMonoidHom`.

| Layer | What the Lean file actually states | Full reader targets requiring geometric inputs |
|---|---|---|
| NT.0 | Native Finsupp ray-point map and injectivity; based character inequalities and principal translation; the support-constrained native monoid-algebra submodule and its product. | Toric boundary identification, global sheaf comparison, tensor base-change equivalence, invariant representatives, divisor-class presentation and integral Cartier sheaves. `cartierIntegralModel` is absent from Lean. |
| NT.1 | Coefficient-linear character power, its monomial formula, identity and fixed coefficients. | `unitToricSpace` with its completed base change and fixtures; `toricAnalytificationComparison`. |
| NT.2 | Discrete p-local weight coefficient carrier and its c₀ specialisation; real divisor cone; finite-monomial controls for convolution and grading. | `perfectoidToricSpace`; completed convolution operations and sheaf identifications; `gradedDivisorAlgebra`, homogeneous Banach structure, general degree-zero statement and tilt. No pointwise multiplication is presented as convolution. |
| NT.3 | Genuine topological tower carrier, zeroth projection through an actual homeomorphism, tower preimage formula and multiplicative/mixed-characteristic/equal-characteristic coordinate controls. | `toricTiltingComparison`, `toricTildeLimit`, `toricTopologicalLimit`, toric-coordinate and stratum identifications, `toricEtaleComparison`, `toricOpenTopos` and `affineLineSharpComparison`. The projection homeomorphism is an input, not an assertion for arbitrary spaces. |
| NT.4 | The torsion coordinate control with p=2, ℓ=3: multiplication is bijective and is not identity. | `toricPowerCohomology` and `toricProjectionCohomology` on the actual identified étale cohomology groups and pullbacks. |
| NT.5 | Compactness of the complement plus nested closed bounds yields a neighbourhood bound; nonzero c₀ coefficients admit nonzero finite-support approximation over a dense subfield. | Constructible/analytic section-domain identification, homogeneous sharp estimate, geometric denominator clearing and `toricHypersurfaceApproximation`. Neither retained theorem asserts the full geometry. |
| NT.6 | Finite integral balancing kernel and projective-line/product/unbalanced examples. | Native-fan extraction and operational Chow comparison, `toricFanDisplacementProduct`, `toricIntersectionDegree` and `toricCompleteIntersectionApproximation`. No positive-degree assertion is made for an arbitrary integer. |

Ten packet target names are retained in Lean as the explicitly limited components listed here. Nineteen are reader-only. Every removed API and test remains mathematically stated in the reader. In particular, no signature promises a reduced scheme over an imperfect dense subfield. The pinned build lacks the geometric carriers; compilation cannot certify those reader targets or prove the admitted statements.

## Ownership, sources and reproducibility

Read the current parent AnalyticToricGeometry README and Suggested.lean, and current AdicSpaces README and its representative signatures. The current parent and library already supply dual semigroups, Gordan finite generation, ordinary face localizations and the complex fan scheme: they are imported, never replanned. C0 owns the arbitrary-ring scheme family. Current `TauCeti.AdicSpace` and its native open restriction in `PreAdicSpace/Adic.lean` are retained as reuse instructions, not reported as missing current-main mathematics.

The read-only snapshots were TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searched the nine roadmaps newer than the atlas snapshot and the current library for the target notions; none supplies these nonarchimedean toric targets. OperatorTheory has no Suggested.lean in that checkout. No ownership move or new roadmap is proposed. The accepted RS-32 boundary and the existing target IDs are preserved. The atlas's historical Layer 0 stage ID remains the import identifier; the live parent now titles that layer “the algebraic supplier”.

Read the reviewed parent/C0 library coverage and the actual relevant C0, R2, P2/P3/P7, A1, H0 and SF.0/SF.5 node statements. Their narrower statements have not been silently substituted for the eight explicit requests. The original eight baseline citations were rechecked at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, including the native divisorial sheaf's surrounding instance hypotheses.

All three primary PDFs were independently downloaded from the public URLs in the packet; their SHA-256 hashes match the existing source records. The cited Scholze statements, §8 and the approximation induction, Fulton–Sturmfels balancing/product arguments, and Fujino–Sato fan were read. The Stacks reducedness statements were checked online. Access records now say 2026-10-14. No source is missing for this revision. No private book was needed, and no source file, passage or extracted text has been committed. `sourceIssues` remains empty: E11 is an existing confirmed correction, and no new source error is asserted.

## Validation and remaining work

- `python3 scripts/check_blueprint.py research/blueprint/packets/AnalyticToricGeometryPartII.json`: **0 errors, 0 warnings**.
- `python3 research/blueprint/intake.py check-files` on all five deliverables: **0 problems**.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/AnalyticToricGeometryPartII.lean`: **passes**.
- `lean-check research/blueprint/suggested/AnalyticToricGeometryPartII.lean`: **exit 0, 31 declaration-uses-sorry warnings, no other warnings or errors**.
- Field-by-field reader audit: all targets, hypotheses, proof steps, prerequisites, API items, tests, uses, acceptance checks, source locators/matches and supplier contracts agree with the packet. All node objects and the historical review object agree with the input. `git diff --check` passes.

| Count | Result |
|---|---:|
| Nodes | 29: 10 construction, 2 definition, 16 theorem, 1 application |
| API items / discriminating tests | 61 / 39 |
| Planets / baseline declarations | 28 / 8 |
| Gaps / supplier requests | 0 / 8 |
| Coverage | NT.0–NT.6 all planned; none closed |

No mathematical target is dropped and no implementation is claimed: every `implementationStatus` is still `unchecked`. Closure remains exactly the supplier and signature-carrier work described in the packet's stage-by-stage `remaining` lists. The eight requests are to the parent Layer 0, C0, P2, SF.0, SF.2, SF.5, H5 and H0; none is declared discharged. The next independent reviewer should verify the reader synchronisation and the narrowed Lean statements, then replace the historical verdict. Packaging follows that acceptance. This run completes only #8920 and takes no second job.
