# Independent review of topology fix round 4

Refs #6521. Codex (GPT-6), session `codex-yMAXQs`, 11 October 2026,
branch `codex-yMAXQs-review-topology-6521`.
The bot confirmed [claim 6105773577](https://github.com/CBirkbeck/tauceti-explorer/issues/6521#issuecomment-6105773577).
This session claimed only this job and did not write the plans or fixes being
reviewed. The complete previous reviews by codex-b5jo9O are preserved in the
three listed packets' `reviewHistory`.

## Verdict and completion boundary

Accept Polylogarithms for finding /7's assignment of the tetrahedron formula
and its explicit geometric inputs. Accept HabiroNahmSeries for /11's six
export contracts. QSeriesPartitionsAndMockModularForms retains
**needs_changes**: /13's scalar ownership correction is sound, but its reader
still disagrees with the packet's multiplier convention. Its earlier full
negative review remains applicable and attributed. These verdicts assess the
assigned fixes; none claims closure or formalization of an entire blueprint.

This submission is a **scope-blocked checkpoint**. The live issue lists seven
outputs, including three packets. The queue job lists eleven outputs,
including five packets. Every output exists, and all three listed packets
have this job's reviewer ID. The unchanged completion predicate returns false
because the two other packets still carry their own earlier review IDs.
An allowed negative mathematical verdict can finish a review; it is the file
scope, rather than the negative verdicts, that blocks completion here.

[WORKERS.md](../WORKERS.md) says: “Edit only the files the issue names, plus
your own scratch space.” Concrete updates to the two omitted packet paths
were prepared in scratch and authorization requested. No answer has arrived.
Neither those packets nor the queue or completion code was changed. The
[handoff](../handoff/REV-FIX-RT-AREA-topology~4.md) gives the two exact changes
needed to finish without repeating this audit.

## Independent assessment

Read all 27 assigned findings, the corresponding verifier reasons and the
[round-four fix report](../redteam/RT-AREA-topology.fixes-4.md). Checked the
listed packets' supplier prerequisites, export contracts, relevant definition
APIs and tests, and the corresponding suggested signatures. Read the two
current upstream README documents for AlgebraicTopology and
DifferentialGeometry in full, and the relevant GeometricTopology sections.
The source reads below cover the contracts at issue. They do not replace the
separately attributed full proof and source audits in the packet histories.

### /7: ordered tetrahedra and the volume supplier

Zagier, *The Dilogarithm Function*, I.3 equations (3),(5), printed p. 11,
and I.4 equations (7)-(9), pp. 13-14, supports P.2's tetrahedron formula.
Neumann v2 §3, pp. 420-421, uses a different ordered coordinate. With the
packets' conventions on the same tuple,

`rP(a,b,c,d) = (a-c)(b-d)/((a-d)(b-c))`,

`rQ(a,b,c,d) = (c-b)(d-a)/((c-a)(d-b))`.

Exact rational-complex arithmetic verifies `rQ = 1/rP` and
`rP(b,a,c,d) = rQ(a,b,c,d)` for all 24 orders of `(0,1,-i,2)`.
In that order the values are `(1+i)/4` and `2-2i`. They are nonreal, so
Bloch-Wigner inversion detects opposite nonzero signs. A real-coordinate
test would miss this issue because its D-values vanish. Swapping two
vertices also reverses signed geometric orientation. A further minus sign
needs an actual carrier and orientation comparison.

The base P.2 volume node explicitly imports GeometricTopology layers 7/8.
The P.2 part still records the canonical ideal-region, signed integration and
map-level Borel normalization obligations (two gaps and three requests).
Its angle-sector calculation is useful analytic work, but does not construct
the geometric region. The current library's metric and measure are partial
suppliers for that task.

QT.5's `volume-and-chern-simons` text imports the tetrahedron identity, but
its direct prerequisites omit `Polylogarithms:P.2/hyperbolic-volume`.
Adding that prerequisite is a clear prepared correction on a packet path
omitted from the live issue. The QT verdict should remain needs_changes:
G4/G5 retain ordered carrier, incidence and geometric/manifold comparison
obligations. An ordinary Bloch class or a Suslin lift does not supply a
preferred extended lift. Neumann v2 Theorem 2.6, printed p. 420, gives
`R lambda = i Vol - CS` modulo the stated period lattice. Comparison with
QT's recorded `i Vol + CS` convention needs the recorded normalization; at
compatible representatives the corresponding expression is `-conj(R lambda)`.

### /11: six exports with distinct hypotheses

The exact exports are HB.4 `euler-maclaurin-with-remainder`,
`formal-gaussian-integration`, `radial-asymptotic-expansion`; HB.8
`fgi-collection`, `identification-theorem`; and HB.9 `module-membership`.
Their contracts preserve three different uses of a Gaussian calculation:

- GSWZ v2 §2.5, equations (110)-(111), printed p. 28, defines the formal
  differential operator. The target requires a symmetric invertible Hessian
  over a rational coefficient algebra and the completion permitting cubic
  terms divided by h. Coefficientwise finiteness must be proved. The real
  polynomial prototype at h=1 is narrower; it provides no completed-domain
  construction. The mixed second moment for `[[2,1],[1,2]]` is `-h/3`,
  checked directly by its inverse matrix.
- GZ v1 Theorem 3.1 and equations (13)-(21), pp. 4-6, concerns analytic
  radial asymptotics for positive-definite Nahm data, with odd admissible
  root order, denominator coprimality, branch choices and an all-orders
  remainder. The matrix `[[1,1],[1,1]]` is singular and kills `(1,-1)`.
  Thus the figure-eight example cannot import this analytic theorem; its
  formal expansion needs its own invertible Hessian at the chosen solution.
- GSWZ v2 Theorems 3/5, p. 14, §1.8, pp. 15-17, and Theorem 8, pp. 35-36,
  supply formal identification and arithmetic membership. The packet retains
  auxiliary root-order coprimality and the Laurent-in-x, power-series-in-t
  interpretation, nondegeneracy, coefficient extension, discriminant square
  root, excluded primes, Kummer choices and integral gluing. The NZ-to-Nahm
  recipe retains its integral unimodular B hypothesis. A matrix recipe or
  membership theorem does not prove knot presentation invariance.

All six exports and their non-consequence clauses are present. Corrected one
source locator on `HB.8/identification-theorem`: Theorem 3, equation (38), is
on printed p. 14 of arXiv v2, rather than p. 13. The rendered page confirms
that location. The bounded fix is accepted; all 22 gaps and nine requests remain.

### /13: scalar modular defects and the reader discrepancy

Zagier, *Quantum modular forms*, printed p. 2 and Examples 3-5, pp. 10-12,
supports QM.5's scalar weak predicate and the shared examples. Example 5's
knot defect is discontinuous; the term quantum modular cannot establish the
packet's real-analytic scalar predicate for it. The eight export contracts
correctly leave knot matrix and asymptotic laws to QT.7. QT also retains
color, orientation, root and normalization comparisons. Termination at a
root of unity, formal Habiro evaluation and an analytic radial limit require
different arguments. Lawrence-Zagier §3 Theorems 1-2 and its periodic
mean-zero proposition, pp. 98-99, supplies the specified WRT and formal
comparison; §4, pp. 103-104, sketches the Eichler comparison. General
multiplier and finite-Weil obligations are still recorded.

Read the rendered pages of Zagier's Topology §6, pp. 958-959, because text
extraction damages its formulas. Equations (38)-(39) specify the T and
principal S laws. The packet and suggested signature include the additional
sign at `c=0,d<0` needed for their lower-boundary branch. At `-I`, the
weight-3/2 boundary factor is `i`, the corrected multiplier is `-i`, and their
product is 1. Naive inverse eta gives product -1. The reader at
`QM.5/kontsevich-quantum-modular`, theorem and ambient hypotheses (lines
9069/9071 in this checkout), still describes the full multiplier as inverse
eta. Synchronize those statements on an authorized reader path.

The scalar cocycle condition also needs its existing identity normalization.
Otherwise a zero factor satisfies an unnormalized cocycle but cannot justify
inverses or reduction to generators. The checked Lean signature includes
`epsilon(1)=1` and the pole exclusions.

Keep the complete negative full review of
`REV-QSeriesPartitionsAndMockModularForms~2` by codex-jnfi6H (#6469), including
no-ghost, arbitrary-ring alternation, invariant-form, general Serre/radical,
quantitative Stirling and exact supplier obligations. The full history and
all 24 gaps and 27 requests are unchanged. The verdict remains needs_changes.

## Dispositions of all 27 findings

An accepted handoff means that its owner and missing contract are routed
correctly. It does not establish the missing theorem. Upstream dispositions
are maintainer notes; existing current owners take precedence over stale
absence claims in the atlas snapshot.

| Finding | Disposition |
|---|---|
| /1 | Accept handoff: use GT 1/4/5 and pinned framed diagram data; retain realization, tangles, linking and stronger surgery-calculus obligations. |
| /2 | Accept handoff: Habiro v1 §9.2 Theorem 9.4, p. 34, and §10 Theorems 10.1-10.2, p. 35, need admissible algebraically split ±1-framed links and Hoste moves. Arbitrary Kirby moves do not preserve this class. |
| /3 | Accept handoff: import braided/rigid/Hopf foundations; the h-adic ribbon algebra, even integral completion, bottom tangles, pairing and twisting result remain named quantum inputs. |
| /4 | Accept handoff: general Lie type needs its quantum-group and root-exclusion contracts; a rank-one theorem must be scoped explicitly. |
| /5 | Accept with current-library correction: the Jones/Markov trace already exists. Import it; retain variable, framing, mirror, color and root comparisons under G3. |
| /6 | Accept handoff: P.1/P.2 provide the analytic and regulator side; K3 V.3/V.4/V.6 provide the groups, Suslin maps and certified classes. V.5 and QT.0 are not automatic prerequisites. |
| /7 | Accept the supplier fix. QT still needs the direct volume edge and the ordered carrier/incidence/orientation comparison; retain G4/G5. |
| /8 | Accept handoff: cusped finite-volume geometry, completeness, ideal face pairings and rigidity require the early geometric interface and a scoped extension beyond closed Mostow. |
| /9 | Accept handoff: extended relations, flattenings, Rogers descent and complex-volume normalization remain explicit. Ordinary descent supplies no preferred extended lift. |
| /10 | Accept handoff: retain the integral/unimodular NZ dictionary, root-refined series, coefficient extensions and separate invariance proofs under G6. |
| /11 | Accept the six supplier exports, with formal, analytic and arithmetic hypotheses preserved; QT owns geometric and topological identification. |
| /12 | Accept handoff: color/root-normalized Kashaev evaluation and the cyclotomic lift need comparisons. Each proved knot/limit case stays distinct from a general conjecture. |
| /13 | Accept scalar ownership; retain QSeries needs_changes and its full negative review. Synchronize the reader multiplier separately. |
| /14 | Accept handoff: Faddeev/AK kernels require contours, domains, convergence, distribution contractions and 2-3 analysis under G7. The formal pentagon has one toolkit owner. |
| /15 | Accept handoff: explicit knot asymptotics keep their sourced or conjectural scope and G8 phase obligations; general resurgence is excluded. |
| /16 | Accept the named Wheeler/MMR/relative-Habiro follow-up, using Alexander and HR.1. Bouis-Gazda remains excluded. |
| /23 | Accept upstream note: define relative homotopy for arbitrary based pairs with the correct low-degree carriers; NDR is a comparison hypothesis. Current AT stage 8 still restricts the definition. |
| /24 | Accept upstream note: spectral-object/page APIs do not provide filtered-chain convergence, edge maps or naturality without the stated filtration hypotheses. |
| /26 | Accept upstream note: name suppliers for CW approximation/compression, weak-equivalence homology invariance and degree-one Hurewicz. |
| /29 | Accept upstream note: the maintainer coordinates internal/external AT dependencies and the directions dependent on restructuring. |
| /33 | Accept upstream note: import the existing absolute induced maps and path-based basepoint change; AT supplies the relative extension. |
| /81 | Accept with current-owner correction: DG 5.5 owns abstract corner boundaries and faces. GT retains handles, gluing, rounding and ball/face comparisons. |
| /82 | Accept with current-owner correction: DG 3.3 owns finite-dimensional connected boundaryless homogeneity. Ambient isotopy extension with support control and transport of gluings remain separate. |
| /87 | Accept upstream note: use one surface/mapping-class owner, boundary connected sum and an actual triangulation or Morse supplier for existence of Heegaard splittings. |
| /91 | Accept upstream note: the maintainer resolves misplaced unlocks and dependency records. Current GT 7 already imports the Riemannian measure and Hopf-Rinow connection. |
| /103 | Accept with current-owner correction: DG 0-2/5 owns forms, exterior derivative, orientation and Stokes. Preserve regularity, compact support and outward-first boundary signs. |
| /105 | Accept upstream note: HF needs its triple 4-manifold, Spin-c, handles, intersection/signature and absolute rational grading inputs. The correction term retains rational-homology-sphere hypotheses. |

## Library and upstream evidence

Read the reviewed coverage entries AUDIT-30 P.2, AUDIT-14 HB.4/HB.8/HB.10 and
AUDIT-15 QM.5. Fresh Git-object statement reads at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` checked:

- `AnalyticOnNhd` in `Mathlib/Analysis/Analytic/Basic.lean:120`: analyticity
  in a neighborhood of each point of the set.
- `Matrix.PosDef` in `Mathlib/LinearAlgebra/Matrix/PosDef.lean:161`: Hermitian
  and strictly positive quadratic form on nonzero vectors.
- `Abelian.SpectralObject` in `Mathlib/Algebra/Homology/SpectralObject/Basic.lean:41`
  and `HasSpectralSequence` in `SpectralObject/HasSpectralSequence.lean:303`:
  long-exact spectral data and the page-successor condition, without the
  filtered-homology convergence claim.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, fresh statement reads
checked `FramedOrientedPDCode` in `KnotTheory/PDCode/Basic.lean:129`
(component orientations, Seifert-relative integer framings and crossing-free
components); `TemperleyLieb.jones` in `KnotTheory/TemperleyLieb.lean:107`
(braid representation, loop value `-(a^2+a^-2)`);
`multivariateGaussian_eq_withDensity` in
`Probability/Distributions/Gaussian/Density.lean:166` (positive-definite S);
`HomotopyGroup.map` and `mapHom` in
`Topology/Homotopy/HomotopyGroup/Map.lean:119,222` (based map, with nonempty
index for the group homomorphism); and `homotopyGroupMulEquivOfPath` in
`HomotopyGroup/BasepointChange.lean:424` (an actual path and nonempty index).
The pinned `Geometry/Manifold/TwoForm.lean:60` provides a smooth alternating
two-form without manifold closedness.

Current upstream checks use roadmap commit
`070dc2becd74419e76303ede84b465ed4a69461f` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The library now has
`MarkovBraid.jonesTrace`, its Markov-equivalence theorem and one-strand value
in `KnotTheory/TemperleyLieb.lean:224,288,352`: the unknot value is the loop
value, so the consumer still needs its normalization comparison.
`UpperHalfSpace.riemannianMetric` and `isPretransitive_isom` supply the metric
and homogeneity; the file explicitly leaves curvature -1 and completeness
unproved. `riemannianVolume` in
`Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:76` supplies the
chart-glued measure under finite dimension, C1, Borel/Lindelof and continuous
metric hypotheses. A targeted search of the current geometry tree found no
ideal-boundary/tetrahedron-volume comparison. This supports the narrower
missing interface, not a plan to rebuild the metric or measure.

Current DG's README and relevant `Suggested.lean` contracts identify the
existing owners for forms/d, abstract corner boundary, connected boundaryless
homogeneity and Stokes. The Stokes signature retains a smooth half-space
manifold, C1 compactly supported form and outward-first boundary orientation.
The general corners extension uses the abstract face boundary. These existing
suppliers must be imported. The upstream checkout was read only; no Lake
command ran there.

## Sources and reproducibility

The following public PDFs were downloaded on 11 October 2026. Only the
specified portions were used, with all conclusions written in this worker's
words. No source passage or PDF was placed in the repository.

| Source/version | Read locators |
|---|---|
| [Zagier, The Dilogarithm Function](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf) | I.3 (3),(5), p. 11; I.4 (7)-(9), pp. 13-14. |
| [Neumann, Extended Bloch group, v2](https://arxiv.org/pdf/math/0307092v2) | Theorem 2.6 and §3, pp. 420-421. |
| [Garoufalidis-Zagier, Nahm asymptotics, v1](https://arxiv.org/pdf/1812.07690v1) | The analytic datum, pp. 2-3; Theorem 3.1 and (13)-(21), pp. 4-6. |
| [Garoufalidis-Scholze-Wheeler-Zagier, Habiro ring, v2](https://arxiv.org/pdf/2412.04241v2) | Theorems 3/5, p. 14; §1.8, pp. 15-17; §2.5 (110)-(111), p. 28; Theorem 8, pp. 35-36. |
| [Zagier, Quantum modular forms](https://people.mpim-bonn.mpg.de/zagier/files/qmf/fulltext.pdf) | Definition, p. 2; Examples 3-5, pp. 10-12. |
| [Habiro, Unified WRT invariant, v1](https://arxiv.org/pdf/math/0605314v1) | §9.2 Theorem 9.4, p. 34; §10 Theorems 10.1-10.2, p. 35. |
| [Zagier, Strange identity](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1016/S0040-9383%2800%2900005-7/fulltext.pdf) | Rendered §6 theorem and (38)-(39), pp. 958-959. |
| [Lawrence-Zagier, Quantum invariants](https://people.mpim-bonn.mpg.de/zagier/files/ajm/3-1/fulltext.pdf) | §3 Theorems 1-2/proposition, pp. 98-99; §4, pp. 103-104. |

SHA-256 values of these downloads, in the same order:

- dilog: `05079cf525c6ba0f0d00b5c0d948bad202d291bc4910149d5d4abbab0515e7a0`
- neumann: `de2f7ddec49b2ce6ccafd5a9a0be350972ffcf2014a6a3601a6d650df0018650`
- gz: `c8e810047d40b52ffc139553e8c9833853675f139070f3d1d4cf365267ae5b66`
- gswz: `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9`
- qmf: `2ee0a69a2ffdd0f7611178fb79a15b5c130f324623640ed7557920435284f0bf`
- habiro: `5fb8b89b432401ea28d10e34d348c5cdebe43cf3ddb95c0475aaee869fa276fc`
- strange: `b95519fb3cb8cd36097988af2ec37549a8b7bdef03f6909dcad6c50a2b06815e`
- lz: `10bbd2821a7f0897230687fde5e16322be58e8a6c3ea5f47d6de4cad180fd543`

## Checks and remaining action

Fresh packet checks return zero errors and zero warnings for all five packets.
Inventories remain Polylogarithms 75 nodes/19 gaps/21 requests, Habiro
109/22/9, QSeries 537/24/27, P.2 part 14/2/3 and QT 106/8/19.
Fresh serial `lean-check` runs on the three issue-listed suggested files
exit 0, with 462, 441 and 1491 admitted-declaration warnings respectively and
no other diagnostics. Available memory exceeded 20 GB. Their signatures were
elaborated against the pinned Mathlib; this is not proof completion or a new
Tau Ceti baseline build. Suggested files are unchanged.

Exact arithmetic checked all 24 cross-ratio orders, the singular figure-eight
matrix, the mixed Gaussian moment and both central multiplier products.
No previous Taylor-coefficient computation was repeated or reattributed.
Semantic comparison against the base confirms the three top-level reviews,
their history appends and the single Habiro source-locator correction. Every
statement, hypothesis, proof outline, prerequisite, API, test, source issue,
gap, request and coverage entry is identical.
The edited source objects contain no `excerpt` keys.
The five edited files pass `intake.py check-files` with zero problems, and
`git diff --check` passes.

A read-only in-memory check supplying only the two prepared packet objects
returns true with all eleven queue outputs retained. It writes no packet and
changes no predicate. The real completion predicate remains false. The only
outstanding completion action is authorization for the P.2 part and QT packet
paths omitted from the issue, followed by their bounded verdicts and the
direct volume prerequisite.
The handoff gives the exact scope and preserves the mathematical qualifications.
