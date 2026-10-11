# Independent review of topology fix round 4

Refs #6521. Codex (GPT-6), session `codex-igEEJo`, 11 October 2026,
branch `codex-igEEJo-review-topology`.
The bot confirmed [claim 6104841327](https://github.com/CBirkbeck/tauceti-explorer/issues/6521#issuecomment-6104841327).
This worker wrote none of the original plans or fixes and claimed only this job.

## Verdict

Polylogarithms is **accepted for /7's ownership and geometric-import fix**.
HabiroNahmSeries is **accepted for /11's six export contracts**.
QSeriesPartitionsAndMockModularForms remains **needs_changes**: /13's scalar
ownership correction is sound, but the full negative review and the reader's
multiplier mismatch remain. These are bounded fix verdicts, not statements
that every node in the packets is closed or proved.

All three top-level reviews now name this session. Each complete predecessor
review object is appended unchanged to `reviewHistory`, including the chain
containing the newer full q-series review by `codex-jnfi6H` (#6469).
No mathematical payload, gap, request, coverage entry or suggested signature
changed. The source objects contain no `excerpt` fields.

This is a **scope-blocked checkpoint**. All seven live-issue outputs exist and
satisfy the completion predicate. The actual eleven-output queue job requires
reviews of two additional packets which the issue forbids this worker to edit.
Their concrete updates were prepared and authorization requested; no answer
has arrived. The unmodified completion predicate still returns false. A
negative mathematical verdict is a permitted completed review outcome; it is
the file-scope discrepancy that prevents this job finishing.

## What was independently checked

Read every one of the 27 assigned claims, verifier reasons and
[round-four dispositions](../redteam/RT-AREA-topology.fixes-4.md). Inspected the
three supplier packets, exact export-node contracts, prerequisites, definition
APIs/tests and suggested signatures. Read the relevant parts of the current
GeometricTopology, DifferentialGeometry, AlgebraicTopology and HeegaardFloer
roadmaps, and the pinned and current library declarations described below.
The public-source reads are bounded to the cited contracts. Earlier full
proof/source audits remain separately attributed in the review histories.

### /7: a shared volume theorem requires a shared ordered carrier

Zagier's *The Dilogarithm Function*, I.3 equations (3),(5), printed p. 11,
and I.4 equations (7)-(9), pp. 13-14, support the P.2 choice of tetrahedron
formula and distinguish it from the manifold-level sum. Neumann v2 §3,
pp. 420-421, uses another ordered cross-ratio. For the same ordered quadruple,
the packet conventions are

`rP = (a-c)(b-d)/((a-d)(b-c))` and
`rQ = (c-b)(d-a)/((c-a)(d-b))`.

They satisfy `rQ = 1/rP`; swapping the first two vertices in rP also gives rQ.
The exact tuple `(0,1,-i,2)` gives `(1+i)/4` and `2-2i`. The Bloch-Wigner
inverse law therefore gives opposite nonzero signs. A rational tuple with
real cross-ratios cannot test this sign, since both D-values vanish. A vertex
transposition already reverses the signed geometric orientation; any further
minus must follow from an explicit carrier/orientation comparison.

The base P.2 node correctly imports GeometricTopology layers 7/8 and owns the
ideal-tetrahedron identity. Its early geometry requests are retained. The P.2
part retains the canonical ideal-region, signed integral and Borel calibration
obligations (two gaps, three requests). A formal angle calculation does not
construct that region. QT.5 imports the identity in its prose but its
`volume-and-chern-simons` node lacks the direct prerequisite
`Polylogarithms:P.2/hyperbolic-volume`. Adding that edge is the prepared clear
correction. G4/G5 must still retain the ordered geometric/manifold-incidence
comparison and the extended lift. Ordinary Bloch/Suslin descent supplies no
preferred extended lift. Neumann v2 Theorem 2.6, p. 420, uses `i Vol - CS`;
the differing GZ complex-volume convention needs the recorded normalization
comparison. The prepared bounded QT verdict is **needs_changes**.

### /11: formal contraction is not analytic asymptotics

The six named exports are HB.4 `euler-maclaurin-with-remainder`,
`formal-gaussian-integration`, `radial-asymptotic-expansion`; HB.8
`fgi-collection`, `identification-theorem`; and HB.9 `module-membership`.
The export node retains the input and non-consequence contracts:

- GSWZ v2 §2.5 equations (110)-(111), printed p. 28, gives a formal Gaussian
  operator with symmetric invertible Hessian over a rational coefficient
  algebra and a completion allowing cubic terms divided by h. It requires
  coefficientwise well-definedness, not a positive measure. The elaborating
  polynomial prototype is narrower than that completed target.
- GZ v1 Theorem 3.1 and equations (13)-(21), pp. 4-6, gives analytic radial
  asymptotics for positive-definite Nahm data, with odd root order coprime to
  the denominators, branches and all-orders remainder. The figure-eight
  matrix `[[1,1],[1,1]]` has determinant zero and kills `(1,-1)`, so it does
  not meet these analytic hypotheses. Its formal route needs its own
  invertible Hessian at the chosen non-real solution.
- GSWZ v2 Theorem 5, p. 14, §1.8, pp. 15-17, and Theorem 8, pp. 35-36,
  require nondegenerate algebraic data, the discriminant/coefficient extension,
  admissible root orders and the Laurent-then-power-series interpretation.
  Preserve the packet's coefficient-transfer, Kummer and integral-gluing
  qualifications. The Neumann-Zagier dictionary requires the stated integral
  unimodular B; no general existence theorem or topological invariance follows
  from the matrix recipe or module membership.

Those restrictions are present. All 22 gaps and nine requests remain. The
assigned export/ownership fix is accepted.

### /13: scalar defects and knot laws retain different contracts

Zagier's *Quantum modular forms*, printed p. 2 and Examples 3-5, pp. 10-12,
supports QM.5 as the scalar weak quantum-modular owner. Its knot example has
a discontinuous cocycle, so the name alone does not establish that predicate.
The eight QM.5 exports leave knot matrix/asymptotic laws and color/orientation
comparisons to QT.7. Root-of-unity termination, formal Habiro evaluation and
an analytic radial limit are distinct; the last requires a theorem.
Lawrence-Zagier §3 Theorems 1-2 and its periodic mean-zero proposition,
pp. 98-99, provides the cited WRT radial/formal comparison in its specific
normalization; §4, pp. 103-104, is only a sketch of the Eichler comparison.
The general multiplier and finite-Weil obligations remain.

Rendered Topology pp. 958-959 were read because text extraction corrupts its
formulas. Zagier's §6 theorem, equations (38)-(39), fixes the principal S law
and the T normalization. The packet's lower-boundary convention extends
inverse eta with a minus when `c=0,d<0`. At `-I`, its weight-3/2 factor is i
and `epsilon(-I)=-i`, whose product is 1. Naive inverse eta gives product -1.
The reader's `QM.5/kontsevich-quantum-modular` theorem and ambient hypotheses
still say inverse eta without that general cut correction. Synchronize these
statements on a separately authorized reader path. The identity-normalized
cocycle condition in the packet is also necessary: a zero multiplicative
factor would otherwise break inverses and generator reduction.

Retain the complete full `independent-review-REV-QSeriesPartitionsAndMockModularForms~2`
negative review, including its no-ghost, arbitrary-ring alternation,
invariant-form, general Serre/radical, quantitative Stirling and exact supplier
obligations. All 24 gaps and 27 requests remain. The verdict stays needs_changes.

## All assigned findings

“Handoff accepted” means the fix correctly routes a missing contract; it does
not assert that the contract is implemented. Upstream notes are for the
maintainer. Current suppliers supersede stale absence claims where indicated.

| Finding | Verdict and reason |
|---|---|
| /1 | Handoff accepted. Import GT layers 1/4/5 and pinned framed diagram types; retain geometric realization, tangles, linking and stronger surgery-calculus extensions. |
| /2 | Handoff accepted. Habiro v1 §9.2 Theorem 9.4, p. 34, and §10 Theorems 10.1-10.2, p. 35, use admissible algebraically split ±1-framed links and Hoste moves; arbitrary Kirby moves leave that class. |
| /3 | Handoff accepted. Import braided/rigid/Hopf foundations; the h-adic ribbon algebra, even integral completion, bottom tangles, P/completion/pairing and twist theorem remain named quantum inputs. |
| /4 | Handoff accepted. General simple Lie type requires its quantum groups and exact root exclusions, or explicit rank-one scope. |
| /5 | Handoff accepted with current-library correction. GT owns Jones; current Markov/Jones trace already exists. Retain variable, framing, mirror, color and root-normalization comparison under G3. |
| /6 | Handoff accepted. P.1/P.2 supply analytic/regulator input; K3 V.3/V.4/V.6 supply groups, Suslin and certified classes. V.5/QT.0 are not automatic inputs. |
| /7 | Supplier accepted. QT needs the missing direct volume edge and ordered carrier/orientation/incidence comparison; preserve G4/G5. |
| /8 | Handoff accepted. Cusped finite-volume geometry, completeness, ideal face pairings and rigidity need the early geometry prefix plus a scoped extension beyond closed-manifold Mostow. |
| /9 | Handoff accepted. Extended relations, flattenings, Rogers descent and the actual complex-volume normalization remain required; ordinary descent gives no canonical extended lift. |
| /10 | Handoff accepted. Preserve the NZ/unimodular-integral dictionary, root-refined series, coefficient extension and separate invariance obligations under G6. |
| /11 | Supplier accepted. Six exact exports preserve formal, analytic and arithmetic restrictions; QT owns the geometric/topological identification. |
| /12 | Handoff accepted. Normalize the color/root Kashaev evaluation and cyclotomic lift; distinguish general conjectures from each sourced proved knot/limit case. |
| /13 | Scalar ownership accepted; QSeries needs_changes. Preserve the full negative review and synchronize the reader's multiplier. Knot laws remain QT's. |
| /14 | Handoff accepted. Faddeev/AK kernels need contours, domains, convergence, distribution contractions and 2-3 analysis under G7; formal pentagon has one toolkit owner. |
| /15 | Handoff accepted. General resurgence is excluded; explicit knot asymptotics retain their conjectural status and G8 phase obligations. |
| /16 | Handoff accepted. The named Wheeler/MMR/relative-Habiro follow-up imports Alexander and HR.1. Bouis-Gazda remains excluded. |
| /23 | Upstream note accepted. Relative homotopy is defined for arbitrary based pairs, with low-degree pointed-set/group carriers; NDR belongs to comparison hypotheses. Current AT stage 8 still restricts the definition. |
| /24 | Upstream note accepted. Spectral objects/pages alone do not supply filtered-chain convergence, edge maps and naturality with explicit filtration hypotheses. |
| /26 | Upstream note accepted. CW approximation/compression, weak-equivalence homology invariance and degree-one Hurewicz need named suppliers. |
| /29 | Upstream note accepted. Internal/external AT dependency records require maintainer coordination, including restructuring-dependent directions. |
| /33 | Upstream note accepted. Import existing absolute induced maps and basepoint transport; AT extends the relative theory. Pinned statements are checked below. |
| /81 | Upstream note accepted with owner correction. Current DG 5.5 owns abstract corner boundaries/faces. GT owns handles/gluing/rounding and the remaining ball/face comparisons. |
| /82 | Upstream note accepted with owner correction. DG 3.3 owns finite-dimensional connected boundaryless homogeneity. Support-sensitive ambient isotopy extension and gluing transport remain separate. |
| /87 | Upstream note accepted. Import a single surface/mapping-class supplier, boundary connected sum and an actual triangulation or Morse existence theorem for Heegaard splittings. |
| /91 | Upstream note accepted. Maintainer resolves misplaced unlocks and dependency records. GT layer 7 already imports Riemannian volume/Hopf-Rinow. |
| /103 | Upstream note accepted with owner correction. DG layers 0-2/5 already own forms, d, orientations and Stokes; preserve C1 compact support and outward-first boundary orientation. |
| /105 | Upstream note accepted. HF needs the triple 4-manifold, Spin-c/handles/intersection/signature and absolute rational grading contracts; d retains rational-homology-sphere hypotheses. |

## Baseline and current suppliers

Read AUDIT-30 P.2, AUDIT-14 HB.4/HB.8/HB.10 and AUDIT-15 QM.5 in the reviewed
library coverage. At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
statement reads confirmed `AnalyticOnNhd`, `Matrix.PosDef`, `SpectralObject`
and `HasSpectralSequence`. The last is a page-successor condition, not a
filtered-homology convergence theorem. At Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, Git-object reads confirmed:

- `FramedOrientedPDCode` retains component orientation and Seifert-relative
  integer framings, including crossing-free components.
- `TemperleyLieb.jones` is the braid representation with loop value
  `-(a^2+a^-2)`; the baseline declaration alone is not the normalization
  dictionary for a colored invariant.
- `multivariateGaussian_eq_withDensity` requires `S.PosDef`. Its analytic
  density is not the formal operator and does not apply to singular covariance.
- `HomotopyGroup.map` and `mapHom` provide based functorial maps; `mapHom`
  requires a nonempty index set. `homotopyGroupMulEquivOfPath` provides
  basepoint change along an actual path, again in positive dimension.

Current read-only roadmaps were inspected at
`070dc2becd74419e76303ede84b465ed4a69461f`; Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Current
`MarkovBraid.jonesTrace` includes writhe correction, Markov move invariance
and a one-strand value equal to the loop value. Import it before proving the
consumer normalization. Current `UpperHalfSpace.riemannianMetric` and
`isPretransitive_isom` provide metric/homogeneity; the module leaves completeness
and curvature -1 open. `riemannianVolume` supplies the chart-glued measure on
a finite-dimensional C1 Borel/Lindelof manifold with continuous Riemannian
metric. A targeted search of the current geometry tree found no ideal-boundary
or tetrahedron-volume comparison declaration. Keep that narrower missing
contract, rather than replanning the metric/measure.

DG's existing forms/d, abstract corner boundaries, boundaryless homogeneity and
Stokes were checked in its README and relevant suggested signatures. Stokes
retains smooth half-space geometry, C1 compactly supported forms and outward-first
boundary orientation. These are existing owners. No upstream file was edited
and no Lake command ran in the read-only environment.

## Source locators and provenance

Public PDFs retrieved on 11 October 2026; only the bounded portions used above
were read. All conclusions are stated in this worker's words.

| Source/version | Locators used |
|---|---|
| [Zagier, The Dilogarithm Function](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf) | I.3 equations (3),(5), p. 11; I.4 equations (7)-(9), pp. 13-14. |
| [Neumann, Extended Bloch group, v2](https://arxiv.org/pdf/math/0307092v2) | Theorem 2.6 and §3, pp. 420-421. |
| [Garoufalidis-Zagier, Nahm asymptotics, v1](https://arxiv.org/pdf/1812.07690v1) | Theorem 3.1, equations (13)-(21), pp. 4-6. |
| [Garoufalidis-Scholze-Wheeler-Zagier, Habiro ring, v2](https://arxiv.org/pdf/2412.04241v2) | Theorem 5, p. 14; §1.8, pp. 15-17; §2.5 equations (110)-(111), p. 28; Theorem 8, pp. 35-36. |
| [Zagier, Quantum modular forms](https://people.mpim-bonn.mpg.de/zagier/files/qmf/fulltext.pdf) | p. 2; Examples 3-5, pp. 10-12. |
| [Habiro, Unified WRT invariant, v1](https://arxiv.org/pdf/math/0605314v1) | §9.2 Theorem 9.4, p. 34; §10 Theorems 10.1-10.2, p. 35. |
| [Zagier, Strange identity, Topology](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1016/S0040-9383%2800%2900005-7/fulltext.pdf) | §6 theorem, equations (38)-(39), pp. 958-959; rendered pages read. |
| [Lawrence-Zagier, Quantum invariants](https://people.mpim-bonn.mpg.de/zagier/files/ajm/3-1/fulltext.pdf) | §3 Theorems 1-2 and proposition, pp. 98-99; §4, pp. 103-104. |

The retrieved PDFs match the eight source hashes recorded by the predecessor
report. This matching provenance does not substitute for the fresh statement
reads or discharge the inherited full proof audits.

## Validation and resumption

Fresh checks of all five packets give zero errors/warnings. Inventories are
Polylogarithms 75 nodes/19 gaps/21 requests; Habiro 109/22/9; QSeries 537/24/27;
QT 106/8/19; P.2 14/2/3. Fresh serial `lean-check` runs on the three issue-listed
suggested files exit 0 with 462/441/1491 `sorry` warnings respectively and no
other diagnostics. Memory availability exceeded 20 GB. These are elaborated
signatures, not proofs. Exact rational/complex arithmetic checked the reciprocal
cross-ratios and vertex swap, singular figure-eight matrix, central multiplier
products, covariance entry -1/3 and the scaled Taylor coefficients
`1, 23/24, 1681/1152, 257543/82944`.

Parsed comparisons with the review base confirm that only reviews/history
changed, every predecessor object is retained exactly, and all mathematical
payloads are unchanged. Suggested file hashes remain
`bd1ce87ec38e2bf3d9f83ed1dfb09c3b7c6850167a8737bb303a2bf430125aad`,
`e8e75371bea31ad9ac787aafd2c2fc195c2d25dee6f2aa14d5b069065394d04b`,
and `27f0445d4c487dcf3eda3753c342129ef89abd40a428f6f3b6f3518a744b19bf`.
No assigned link map or restructuring result needs a checker.

The actual queue completion test is false; restricting an in-memory copy of
its outputs to the seven live-issue paths gives true. All eleven files exist;
only the two extra packet review IDs prevent completion. The referenced prompt
is absent. [WORKERS.md](../WORKERS.md) requires: “Edit only the files the issue
names, plus your own scratch space.” The submitting/stopping rules allow this
job's handoff. Explicit authorization was requested for the two prepared
packet updates and remains unanswered.

After authorization or repair of the issue scope, preserve each full prior
review and record this job's bounded verdict on `Polylogarithms--P.2.json`
(accepted for /7, keeping two gaps/three requests) and
`ArithmeticQuantumTopology.json` (add the missing direct P.2 volume prerequisite;
needs_changes for G4/G5, keeping eight gaps/nineteen requests). A negative
review can finish without proving the outstanding mathematics. Run the actual
`issues.deliverables_complete` predicate and packet/path checks after those
edits. The [handoff](../handoff/REV-FIX-RT-AREA-topology~4.md) includes exact
resumption steps; scratch is not needed for continuation.
