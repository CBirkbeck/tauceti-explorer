# PKG-TropicalAndBerkovichArithmetic — submission handoff

Issue: #10778. Agent: Codex. Session: `codex-Ey3gzr`. Date: 2026-10-20.

The package is complete for independent package review. This is a roadmap,
not a formalization of its targets. No second job was claimed.

## Deliverables and fidelity

The package contains a detailed README, a representative 130-line
`Suggested.lean`, and `metadata.toml` with `topic = "math.NT"`.
The README preserves all 103 accepted targets in eight layers, all 192 named
API entries, all 131 named checks, and all six worked examples. Every one of
the 41 definition/construction targets retains at least three checks.
Each layer also ends with examples and dependencies. Local prerequisite
identifiers became links to the actual mathematical subsections. External
contracts name their suppliers and explain the generality required.

All 22 inherited proof obligations are retained as explicit mathematical
constructions within their consuming targets, with source routes rather than
a separate research-status ledger. Their presence does not assert that their
proofs are formalized or that this packaging run established every omitted
source argument. The table below identifies them for the independent reviewer.
The accepted input packet, reader, suggested file, review and audit are unchanged.

The Lean file uses native `MulRingSeminorm`, a real-bodied dominated subtype,
evaluation, the evaluation topology and the field norm point. It states seven
milestones and proves four discriminating examples. It has no admitted data,
auxiliary theory development, fabricated later-layer carriers or admitted
examples. Later definitions/constructions are named in its closing comment
and specified in full in the README.

## Current ownership and prerequisite checks

Read the current AnalyticToricGeometry and StableReduction READMEs in full,
their representative Lean interfaces, and the AdicSpaces interface. Searched
the current library and all nine roadmaps newer than the atlas snapshot,
including the four additional Completed roadmaps, by mathematical objects and
signatures. The current upstream roadmap commit was
`0d144d044dacebca17b654695b6f1ad58f159b27`; the current Tau Ceti commit was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
The representative Lean baseline remains Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

The following existing work is imported rather than reconstructed:

| Existing owner | Removal or retained adapter |
| --- | --- |
| Mathlib `MulRingSeminorm`, norm seminorm, bounded-map and power-multiplicative contraction interfaces | No replacement seminorm carrier or second power-trick theorem. The dominated subtype and bounded/dominated adapter remain. All 22 cited Mathlib declarations were read at the pin. |
| Current Tau Ceti `ValuationSpectrum.IsAnalyticPoint.exists_coarsenByUnits_mem_spaAnalytic` | Removed rank-one coarsening existence from the owned proof route. Section 0.23 retains uniqueness/maximality, uniform-unit normalization and real-valued/topological comparison. |
| Current Tau Ceti `ValuationSpectrum.spa` and AdicSpaces Layer 2 | Import valuation classes and rational topology; the Banach real spectrum is a different carrier. |
| Current Tau Ceti `ValuationSpectrum.spaSeparationQuotientHomeomorph` | Read its actual statement: it compares Spa with Spa of the ring modulo the closure of zero. It is neither a maximal Hausdorff quotient of adic points nor a substitute for the owned real quotient. |
| Current Tau Ceti `PowerSeries.gaussNorm_mul_of_isRestricted` | Import Gauss multiplicativity. Section 1.1 retains the analytic point, disc and scalar-extension comparison. |
| Current Tau Ceti `exists_isRiemannRochDivisor`; AlgebraicCurves Layer 4 | Import algebraic Riemann–Roch. Section 5.5 owns analytic residue lifting, approximation and separating coordinates. |
| Current Tau Ceti `IsConvexPolyhedron`; AnalyticToricGeometry | Import convex geometry, lattices, cones, fans and toric gluing. Valued initial degenerations and tropical multiplicities remain here. |
| StableReduction Layer 1 | Import the nodal multigraph, component genera and arithmetic-genus formula. Sections 2.16–2.17 add metric thickness and analytic residue comparison. |
| StableReduction Layer 2 | Import proper-flat genus invariance in its locally noetherian range. Section 2.17 explicitly owns the model descent/algebraization needed for rank-one bases. |
| StableReduction Layers 7–9 | Import the DVR compatibility case; retain the genuinely larger rank-one/nonnoetherian analytic semistable theorem. |
| EllipticCurves Layer 4 | Import the algebraic Tate curve. Section 7.1 adds the analytic quotient and skeletal metric. |

The current `NumericalType.intersectionGraph` is a simple graph of distinct
components. It cannot replace the nodal multigraph, since loops and repeated
nodes disappear. No additional overlap was found in the newer roadmaps or
Completed roadmaps searched.

The following supplier extensions still require coordination by their owners;
the README does not pretend their narrower existing statements already supply
them:

- General-K toric embeddings belong to **AnalyticToricGeometry, Part II**.
  Its current algebraic interface is complex based. SF.0 supplies common scheme
  interfaces; this package does not plan toric geometry again.
- SF.5 owns the extension of model specialization and vertical Cartier
  intersection/projection to rank-one models, with multiplicities and residue
  degrees. Its arithmetic-surface comparison is narrower. SF.4 supplies formal
  geometry, not this intersection theorem.
- NeronModelsAndSemistableAbelianVarieties R11.3 must supply the full analytic
  Raynaud cross, valuation map, lattice, polarization and base change. Its
  formal DVR comparison alone is insufficient. The comparison with graph edge
  lengths is an owned theorem here.
- AdicSpacesPartII supplies strict acyclicity and formal generic fibers;
  nonstrict descent and Berkovich comparison remain here. ColemanIntegration
  supplies local primitives/residues, while ED.4 supplies abelian logarithms.

TropicalAndBerkovichArithmetic is not among the 94 entries in the
Caraiani–Newton tier file. The package introduces no dependency on the later
PerfectoidSpaces, DiamondsAndVStacks or ArithmeticDynamics constructions.
Those are downstream consumers. In particular, the dynamical convergence
input belongs to ArithmeticDynamics DY.2; hybrid topology is constructed here
without citing dynamical convergence as a prerequisite. No target was moved
from this package upward or duplicated from those consumers.

## Source verification and corrections to the accepted inputs

Public papers were read at the relevant statements and selected proof bodies.
The original downloaded source versions were checked against the hashes
recorded by the input where those hashes were available. Additional primary
sources were used for the finite graph argument, global path primitives,
analytic approximation and rank-one semistable reduction. Cleared books and
papers were read in place; no copy or source passage was added to the repository.
The README organizes results by the mathematics being built and uses original
wording, not source excerpts or section-by-section summaries.

| Source | Verification performed in this run |
| --- | --- |
| Berkovich (1990) | In-place reading of Theorem 1.2.1, Corollary 1.2.4, Theorem 1.3.1 and Proposition 1.3.5/Corollary 1.3.6, printed pp. 13–16. |
| Temkin | Spectrum, norm conventions, affinoid domains and strictification/acyclicity locators, especially §§2.1–2.2 and §§3.2–3.3. |
| Scholze, Berkovich Motives | General Banach, spectral, idempotent and Gelfand targets in §2, including the direct idempotent proof. |
| BPR structure, arXiv v1 | Skeleton, retraction, refinement, semistable existence and slope-formula locators and proof routes. The published offprint returned HTTP 403; published-page collation is inherited from the accepted inputs, not independently claimed here. |
| BPR tropicalization, arXiv v3 | Relative multiplicity, finite-map and separating-function arguments in §5 and pushforward in §7. |
| Bosch–Lütkebohmert (1985) | Original freely readable GDZ scan: Corollary 3.8 pp. 364–365; genus formula 4.6 pp. 367–368; §6 exceptions p. 371, Lemmas 6.1–6.2 and Proposition 6.3 pp. 372–373; Theorem 7.1 and its proof through p. 378, including Lemmas 7.2–7.3 and Proposition 7.4. Also read the finite-extension descent statements 1.3–1.4, p. 352. |
| Poineau–Turchetti | Point/path/annulus locators and §II.2 genus/triangulation statements; Schottky/Mumford statements; full coordinate-approximation argument of Theorem II.4.3 and Lemmas II.4.4–II.4.6, pp. 57–61. |
| Baker–Norine; Gathmann–Kerber | Finite graph reduced divisors and order/rank argument, §§2–3 pp. 8–16 of the former; metric approximation and rank comparison, Lemma 2.3 through Proposition 3.1 of the latter. |
| Baker; Amini–Baker; Baker–Faber | Specialization, metrized-complex conventions and Appendix A finite testing; metric Jacobian/length-pairing locators. |
| Gubler; Sturmfels–Tevelev | Dimension/initial-degeneration and local-star locators, valued balancing/pushforward ranges and direction of the lattice index. |
| Fresnel–Matignon | Théorème 1, §1.4, pp. 165–168 and Théorème 4, §2.4, pp. 182–184, including their proof routes and regularity hypotheses. |
| Chambert–Loir; Yuan | Model measures, tensor exponents, positivity/weak-limit hypotheses; Yuan Appendix A.4–A.5 and the unit-edge normalization, especially pp. 114–118. |
| Favre–Rivera-Letelier; DKY | Kernel/self-energy and Laplacian normalization; DKY published §2.7 and its cross-energy error; the FRL corrigendum concerns quantitative bounds, not the interior Laplacian sign. |
| Boucksom–Jonsson | Hybrid central norm and model limit; also checked the published Appendix A.4–A.6, pp. 136–137. |
| Kedlaya–Liu I/II | In-place reading of the cited norm-sensitive hierarchy, rational localization and real-quotient statements, and the relevant errata appendix. |
| Zavyalov; Huber | Appendix A comparison and boundary distinctions; in-place Huber (1996) Proposition 8.3.1/Remark 8.3.2 pp. 422–425, Theorem 8.3.5 pp. 428–429, Lemma 5.6.8(i) pp. 313–314. Huber (1994) Proposition 4.5(iv) is verified through Zavyalov's precise citation, not an independent reading of its original proof. |
| CDN | Appendix A.2 normal-flat model/component-point direction; the converse gluing remains an explicit owned construction. |
| Baker–Rabinoff | §2.7/Theorem 2.9, Proposition 4.7 and its proof, and §6 through Corollary 6.8: analytic/tropical Abel–Jacobi compatibility and the induced homology proof of the pairing comparison. |
| Berkovich, Integration (2004); KRZB | Theorems 1.6.1–1.6.2 pp. 22–23 and 9.1.1 pp. 136–138; KRZB branch, residue and tropical-correction locators, including the codimension calculation. |

Additional discrepancies were corrected only in the package, as the issue
forbids changing the accepted inputs:

1. The input's Gathmann–Kerber “Theorem 1.2” is actually Remark 1.2, not
   the metric-graph Riemann–Roch locator.
   Definitions 1.1, 1.3–1.4 and Proposition 3.1 supply the relevant references.
2. Amini–Baker A.4 is a theorem. Reduced-divisor uniqueness fixes the graph
   part and component divisor classes, not every representative divisor.
3. Zavyalov A.6 is a definition followed by discussion. Huber 5.6.8(i) compares
   tautness; it is not the boundary theorem. The latter distinctions are
   Zavyalov A.8/A.11. Huber 8.3.5 is the subsequent sheaf comparison.
4. An isometric Gelfand representation includes the zero ring, but attainment
   of a spectral maximum requires a nonzero ring. Unit detection still includes
   the zero ring. The Lean unit theorem consequently uses `‖1‖ ≤ 1`, rather
   than a `NormOneClass` hypothesis that would exclude the zero ring.
5. The finite power map has degree and expansion `|n|` for `n ≠ 0`.
   The case `n = 0` is contracted; `n = -2` has degree two. Replacing q by qⁿ
   in the Tate calibration requires an integer `n ≥ 1`.
6. Valence two is not enough to suppress a vertex on a single self-loop.
   The operation needs two distinct incident edges and retains the one-vertex
   Tate circle. This agrees with the exceptions in Bosch–Lütkebohmert §6.
7. StableReduction's genus theorem is locally noetherian. The package's
   rank-one application explicitly requires model descent/algebraization.
8. The current Spa separation-quotient theorem concerns the separated ring,
   as described above; it does not discharge the adic-point quotient target.
9. Yuan's unit-edge formula does not by itself handle arbitrary real lengths
   by a single rescaling. The package owns the conductance/network derivation.
10. Baker–Rabinoff's pairing comparison is proved via the Abel–Jacobi square
    and homology, not by assuming an unspecified analytic monodromy theorem.
    The source route now locates Proposition 4.7 and §6, pp. 10–11, 14–16.
11. The Mumford converse now specifies the actual normalized-coordinate
    approximation and degree-one proof, rather than an unnamed Runge input.

All 13 existing source-convention findings remain as mathematical safeguards:
specified norms versus topology; evaluation on every algebra element; typed
annular collars and connected neighborhoods; subdivision as a union;
self-energy versus cross-energy; codimension rather than dimension;
target/image lattice index; norm control for the characteristic-p uniform-unit
converse; the central value `r^ord`; complex Hahn coefficients; the reversed
Laurent coefficient `a₋₁`; and the interior Laplacian sign. Nothing asserts a
new errata job or changes the shared source ledger.

## Where the 22 inherited proof obligations live

These are requirements of the eventual formalization, retained in full in the
README. Source matching and the stated routes are not Lean proof closure.

| Consuming target | Owned construction or supplier boundary |
| --- | --- |
| 0.20 Analytic sheaf | Faithful strictification, completed base change and Čech descent for arbitrary radii. |
| 0.25 Global adic comparison | Overlap/morphism gluing, tautness and quotient topology, with corrected Huber inputs. |
| 2.15 Rank-one semistable reduction | Formal genus reduction, nodal charts, finite-extension descent and algebraization. |
| 2.8 Continuous retraction | Star neighborhoods controlling all residual-ball directions and the homotopy time parameter. |
| 2.20 Noncompact triangulations | Locally finite converse formal gluing, constants and nonsplit node invariants. |
| 3.5 Graph Riemann–Roch | Finite reduced-divisor/rank theorem, discrete-to-metric comparison and simultaneous rational approximation. |
| 3.4 Graph Jacobian | Finite-model exactness, subdivision pairings and the direct limit. |
| 3.9 Metrized-complex Riemann–Roch | Reduced divisors, precise uniqueness and Appendix A continuity/finite testing. |
| 4.4 Initial degenerations | Valued Gröbner control, dimension and descent outside the value group. |
| 4.6 Weighted tropical cycles | Initial-of-initial comparison, multiplicity invariance, local balancing and cycle pushforward. |
| 6.2 Model measures | SF.5 rank-one specialization/projection; general Radon limits by nets or descent beyond sequential hypotheses. |
| 6.6 Graph Green functions | Arbitrary-real-length network equations, mass normalization and derivative/variation-controlled approximation. |
| 6.5 Hsia potentials | Continuous-potential positivity in the cited range and the additional general-field measure/approximation extension. |
| 7.2 Schottky data | Figure theorem and the normalized-coordinate construction for the Mumford converse. |
| 7.4 Analytic Jacobian periods | Full analytic R11.3 cross, then the owned Abel–Jacobi/homology pairing comparison. |
| 7.5 BC path integral | Global primitive sheaf, interval torsor, homotopy and concatenation. |
| 7.6 Annular residues and periods | Component residue theorem, harmonic graph cochain and global valuation factorization. |
| 0.29 Idempotents and clopens | Laurent equalizer/closed ideal and Newton lifting. |
| 0.27 Hybrid analytic space | General Banach-base analytification and the SNC inverse-limit construction. |
| 2.23 Genus-zero contractions | Formal rank-one tail/bridge contraction with puncture and loop exclusions. |
| 4.8 Relative multiplicity | Canonical reduction degree versus initial generic length, retaining inseparability. |
| 5.5 Separating functions | Residue lifting, regular meromorphic approximation and rational sublevel domains. |

## Adversarial mathematics pass

Checked the defining hypotheses, map directions, signs, normalizations and
denominators throughout all eight layers. Important witnesses and resulting
changes are recorded here; the README retains the discriminating checks.

| Statements/conventions | Instances and outcome |
| --- | --- |
| Spectrum, compactness, nonemptiness, units and Gelfand representation | Zero ring, product of two real fields, nilpotents, field inverses and incomplete carriers. Separated compactness needs no nonemptiness; maximum attainment does. Corrected the zero-ring unit signature. |
| Rank-one quotient and uniform units | Fixed normalization, trivially normed fields, irrationally scaled product factors and the weighted characteristic-p Laurent field. Added no false converse from topology or a uniform unit to a bounded scalar structure. |
| Discs, annuli and descent | Radius zero, open/closed ends, inverse coordinate and scalar extension. Natural-log length is positive for `0 < r < R`; a virtual annulus retains geometric component and folding data. |
| Semistable skeleta | Good-reduction point, rational tails/bridges, a single Tate loop, punctured rays and `uv = πⁿ`. Added the distinct-edge guard; imported graphs retain all nodes and loops. |
| Divisors, Laplacians and ranks | Interval `f(s)=s`, a tree, a circle and a positive-genus component with point graph. `Δf=δ_L−δ_0`; graph genus alone cannot replace residue-curve rank. Loops need subdivision for the finite-testing criterion. |
| Tropical cycles and faithfulness | Power maps `n=0, -2, p`, nonreduced initial schemes, collapsed cells, coprime coordinate slopes and globally overlapping edges. Degree is absolute, includes inseparability, and faithfulness includes global injectivity. |
| Measures, potentials and heights | Tensor exponent, component multiplicity, bridge resistance infinity, loop resistance zero, genus zero exclusion, unequal real lengths and signed atomic differences. Self-energy is positive; cross-energy can be negative. Circle Green curvature is `δ_0−ds/L`; rigidification and mean-zero normalization are distinct. |
| Tate, Schottky and integration | `0 < |q| < 1`, excluded `q=1`, positive powers of q, strict disc pairing, good reduction, `dT/T`, coordinate inversion and a valence-d star. BC period is `Log q`; the abelian correction cancels a q-shift. Natural-log lengths remain distinct from Cp coefficients; the agreement bound is codimension at most `d−1`. |

## Validation and next action

- `lean-check research/blueprint/packages/TropicalAndBerkovichArithmetic/Suggested.lean`
  exited 0 against the shared pinned build. The final file produced exactly
  seven `declaration uses sorry` warnings and no other warnings or errors.
  All four examples are proved. Available memory was above the required
  20 GB before compilation; no private build or language server was started.
- `python3 scripts/check_blueprint.py research/blueprint/packets/TropicalAndBerkovichArithmetic.json`:
  0 errors, 0 warnings. The packet was not edited.
- Coverage and shape checks: all 103 targets, 192 API names and 131 check
  names present in their corresponding subsections; all 41 definition/
  construction targets have at least three checks; all eight layers end in
  examples and dependencies; no broken local heading links; every target
  has prerequisites and a page-level source locator.
- `python3 research/blueprint/intake.py check-files` on all four deliverables:
  4 files, 0 problems. Whitespace check: clean.

The next action is independent package review, especially the explicitly
scoped original-source verification limits and the supplier extensions above.
No unfinished packaging edits or scratch-only information are required to
resume. No suspicious instruction embedded in untrusted material was acted
upon or observed during this run.
