# Independent review of topology fix round 4

Refs #6521. Codex (GPT-6), session `codex-ZF9PrD`, 11 October 2026;
branch `codex-ZF9PrD-review-topology`. The bot confirmed
[claim 6104618034](https://github.com/CBirkbeck/tauceti-explorer/issues/6521#issuecomment-6104618034).
This session wrote none of the original plans or round-four fixes and claimed
only this job.

## Verdict and scope

The three issue-listed reviews are now independently dated and attributed to
this session. Polylogarithms and HabiroNahmSeries are **accepted for the
assigned ownership/export fixes**. QSeriesPartitionsAndMockModularForms is
**needs_changes**: its scalar ownership correction is sound, but the newer
full negative review and a reader synchronization obligation remain. Every
complete predecessor review object is preserved exactly in `reviewHistory`.
No mathematical payload or suggested file changed.

**This submission is a scope-blocked checkpoint.** The live issue authorizes
three packets, their suggested files and this report. The queue requires two
more packet reviews, on paths the issue omits. The two additional bounded
verdicts are ready, but authorization has not arrived. The real completion
checker returns false. A negative mathematical verdict is an allowed completed
review outcome; the scope discrepancy is what prevents this job finishing.

Read all 27 assigned claims, verifier reasons and
[round-four dispositions](../redteam/RT-AREA-topology.fixes-4.md), including
consumer handoffs and upstream notes. Independently inspected the changed
supplier interfaces, their prerequisites, APIs/tests and suggested signatures.
The checks below are a bounded review of those fixes, not a fresh proof audit
of every unchanged node in five packets. Earlier full reviews, including the
P.2, QT and q-series source-issue ledgers, remain separately attributed.

## Supplier contracts and remaining consumer work

### /7: tetrahedron volume and the ordered sign

P.2 is the single owner of the ideal-tetrahedron formula. The base packet's
volume node explicitly imports current GeometricTopology layers 7 and 8.
Zagier's *The Dilogarithm Function*, I.3 equations (3),(5), printed p. 11,
and I.4 equations (7)-(9), pp. 13-14, distinguish the Bloch-Wigner function,
Lobachevsky angles and the volume comparison. Neumann v2 §3, pp. 420-421,
uses a different ordered cross-ratio convention. These are compatible only
through a stated comparison of actual carriers and their orientations.

For a fixed ordered quadruple `(a,b,c,d)`, the supplier convention is
`rP = (a-c)(b-d)/((a-d)(b-c))`, normalized by `(infinity,0,1,z)`;
the QT convention is `rQ = (c-b)(d-a)/((c-a)(d-b))`, normalized by
`(0,infinity,1,z)`. Cancellation gives `rQ = 1/rP`; interchanging the first
two vertices also gives `rQ`. The exact non-real example `(0,1,-i,2)` yields
`rP = (1+i)/4` and `rQ = 2-2i`. Positivity in the upper half-plane and
`D(1/z) = -D(z)` give opposite nonzero Bloch-Wigner signs. The real example
`(2,3,5,7)` gives `6/5` and `5/6`, but both have D-value zero and cannot detect
the orientation error. A vertex transposition already reverses signed volume;
an additional minus needs its own justification.

The current P.2 part records the canonical ideal-region and signed-integral
obligations rather than claiming them proved. Preserve its two gaps and three
requests, including the Borel-map calibration. QT.5's
`volume-and-chern-simons` prose imports the tetrahedron formula but omits the
exact prerequisite `Polylogarithms:P.2/hyperbolic-volume`. That direct edge
is clearly fixable once the QT packet path is authorized. Its geometric
carrier, ordered orientation and manifold-incidence comparison remains a
separate requirement under G4/G5. Ordinary Bloch/Suslin descent supplies no
canonical extended lift. Neumann's regulator convention `i Vol - CS` and the
GZ convention `i Vol + CS` also need the stated `-conjugate` comparison.
The bounded QT verdict is therefore needs_changes, retaining its full prior
review, all eight gaps and nineteen requests.

### /11: formal, analytic and arithmetic exports

The six exported nodes are HB.4 `euler-maclaurin-with-remainder`,
`formal-gaussian-integration`, `radial-asymptotic-expansion`; HB.8
`fgi-collection`, `identification-theorem`; and HB.9 `module-membership`.
Their use contracts distinguish three inputs:

- Formal Gaussian contraction uses an invertible symmetric Hessian and a
  Q-algebra completed coefficient ring. GSWZ v2 §2.5 equations (110)-(111),
  printed p. 28, uses the completed ring allowing cubic terms divided by h;
  it is not a measure integral and needs no positive-definiteness. The
  elaborating HB.4 polynomial prototype is narrower than that full target.
- Analytic radial asymptotics retain the positive-definite Nahm datum and
  Hessian, odd root order coprime to the denominators, chosen branches and
  all-orders remainder control of GZ v1 Theorem 3.1 and equations (13)-(21),
  printed pp. 4-6. The figure-eight matrix `[[1,1],[1,1]]` annihilates
  `(1,-1)` and has determinant zero, so cannot instantiate that theorem.
- Arithmetic identification and module membership retain the symmetric
  integral matrix, nondegenerate algebraic solution, discriminant exclusions,
  coefficient transfer and the signed Kummer/integral-gluing qualifications
  of GSWZ v2 Theorem 5, p. 14, §1.8, pp. 16-17, and Theorem 8, pp. 35-36.
  The QT Neumann-Zagier dictionary and topological invariance are separate
  consumer obligations. A formal identification does not establish them.

The packet records these limits in its export/non-consequence interface.
All 22 gaps and nine requests remain. The assigned single-owner/export fix is
accepted; no full-packet closure or formalization is asserted.

### /13: scalar quantum modular forms and knot laws

QM.5 owns the scalar weak quantum-modular definition and additive period
cocycle. QT.7 owns knot matrix-valued and asymptotic laws. Zagier's *Quantum
modular forms*, printed p. 2 and Examples 3-5, pp. 10-12, explicitly
separates these kinds of examples. The eight exported QM.5 nodes retain that
boundary. Root-of-unity finite evaluation, a formal Habiro expansion and an
analytic radial limit are distinct contracts; the latter requires a theorem.
The trefoil connection retains color and orientation normalization.

The scalar generator-reduction node includes `epsilon(1)=1` and a
multiplicative factor J. Without identity normalization a zero J satisfies
multiplicativity but invalidates inverses and generator reduction. For the
Kontsevich function, Zagier's Topology §6 theorem, printed pp. 958-959,
fixes the S/T laws. The packet extends the inverse-eta values by a minus
for `c=0,d<0`. At `-I`, the principal argument of `-1` is pi, the
weight-3/2 boundary factor is i, and `epsilon(-I)=-i`, so their product is 1.
Naive inverse eta instead gives product -1. The reader's Kontsevich theorem
and ambient hypotheses still state inverse eta without that general cut sign;
they need synchronization on a separately authorized reader path.

Zagier's Topology equation (24) and Theorem 3, printed p. 952, use scaled
Taylor coefficients: the first four are `1`, `23/24`, `1681/1152`,
`257543/82944` in `exp(-t/24) F(exp(-t))`. Rendered pages were read because
the text extraction corrupts mathematical symbols. Lawrence-Zagier §3,
Theorems 1-2 and the periodic mean-zero proposition, pp. 98-99, supplies the
WRT radial and formal comparisons; §4, pp. 103-104, sketches the Eichler
boundary comparison. These reads do not discharge the recorded general
multiplier/finite-Weil gaps or the full proof audit.

Retain the entire newer `independent-review-REV-QSeriesPartitionsAndMockModularForms~2`
review by session `codex-jnfi6H`, issue #6469. Its no-ghost, arbitrary-ring
alternation, invariant-form, general Serre/radical, quantitative Stirling and
exact supplier obligations remain. The top-level verdict stays needs_changes,
with all 24 gaps and 27 requests preserved.

## Every assigned finding

“Handoff accepted” below means that the fix correctly identifies the missing
consumer contract or upstream action; it does not mean that mathematics has
been implemented. Findings /7, /11 and /13 have the detailed checks above.

| Finding | Verdict and reason |
|---|---|
| /1 | Handoff accepted. GeometricTopology owns link presentations, equivalence and surgery. QT imports them; G1 retains geometric realization and the stronger Kirby inputs. |
| /2 | Handoff accepted. Habiro v1 §9.2 Theorem 9.4, p. 34, and §10 Theorems 10.1-10.2, p. 35, use algebraically split, ±1-framed admissible presentations and Hoste moves. Arbitrary Kirby moves leave that class. |
| /3 | Handoff accepted. The h-adic ribbon algebra, completed even form, bottom tangles, completed colors and twist theorem are quantum inputs; existing braided/rigid/Hopf foundations are imported. |
| /4 | Handoff accepted. General simple-Lie-type quantum groups and the exact admissible-root restrictions cannot be obtained from the rank-one plan. |
| /5 | Handoff accepted with current-library correction. Import GT's Jones owner and the current Markov/Jones trace APIs below; retain variable, mirror, framing, color and root comparison under G3. |
| /6 | Handoff accepted. P.1/P.2 supply analytic/regulator input; K3BlochGroups V.3/V.4/V.6 supply the algebraic classes and lift fibre. V.5 is not the supplier. |
| /7 | Supplier ownership accepted. QT still needs the exact P.2 volume edge and carrier/order/orientation comparison. Preserve G4/G5. |
| /8 | Handoff accepted. Cusped finite-volume geometry, ideal face pairings, completeness, appropriate triangulation/flattening refinements and rigidity exceed closed-manifold Mostow. Preserve G4. |
| /9 | Handoff accepted. The extended group, transfer/cut cover, Rogers map and strong-flattening paths remain required. Suslin descent gives no preferred extended lift. Preserve G5. |
| /10 | Handoff accepted. The NZ datum, unimodular B/integral parity dictionary, root-refined DG series, invariance and coefficient normalization have separate inputs; preserve G6 and HB.8/HB.9 imports. |
| /11 | Supplier accepted. The six exports preserve formal, analytic and arithmetic restrictions and leave topological identification to QT. |
| /12 | Handoff accepted. State normalized color/root Kashaev evaluation, the cyclotomic lift, general conjectures and separately proved cases with their distinct status. |
| /13 | Scalar ownership accepted; QSeries needs_changes. Preserve the newer full negative review and repair the reader's cut-sign statement on an authorized path. Knot matrix laws remain QT's. |
| /14 | Handoff accepted. Faddeev/AK kernels, contours, domains, distribution contractions and tails remain under G7; the generic formal pentagon has one toolkit owner. |
| /15 | Handoff accepted. General resurgence is excluded from this scope; explicit knot coefficient asymptotics retain their conjectural status and G8 phase obligation. |
| /16 | Handoff accepted. The Wheeler/MMR/relative-Habiro continuation is a named QT follow-up importing Alexander and HabiroRings HR.1; Bouis-Gazda is excluded. |
| /23 | Upstream note accepted. Relative groups are defined on arbitrary based pairs; NDR/CW hypotheses belong to comparison theorems. |
| /24 | Upstream note accepted. A spectral object does not supply filtered-chain convergence, edge maps and naturality. The generic supplier needs explicit filtration hypotheses. |
| /26 | Upstream note accepted. CW approximation/compression, weak-equivalence homology invariance and degree-one Hurewicz require precise suppliers. |
| /29 | Upstream note accepted. Internal/external topology dependency records need maintainer coordination; this review edits no atlas edges. |
| /33 | Upstream note accepted. UniversalCovers/current library own absolute higher-homotopy functoriality and basepoint change; relative comparisons belong to AlgebraicTopology. |
| /81 | Upstream note accepted with owner update. DifferentialGeometry 5.5 already owns abstract corner boundary and face orientations. GT owns handles/gluing/rounding and remaining ball/face comparisons. |
| /82 | Upstream note accepted with owner update. DifferentialGeometry 3.3 already owns finite-dimensional connected boundaryless homogeneity. Support-sensitive ambient isotopy extension and gluing transport remain separate. |
| /87 | Upstream note accepted. Surface classification/mapping classes and an actual Morse or triangulation existence theorem must supply Heegaard splittings; boundary sums need their contract. |
| /91 | Upstream note accepted. Misplaced targets and dependency records need upstream correction. GT layer 7 already imports Riemannian volume and Hopf-Rinow. |
| /103 | Upstream note accepted with owner update. DifferentialGeometry 0-2 and 5 already own forms, d, pullback, orientations and Stokes. Keep C1/compact-support/outward-first hypotheses. |
| /105 | Upstream note accepted. HF needs the triple 4-manifold, Spin-c/handles/intersection/signature and absolute rational grading contracts. Correction terms retain rational-homology-sphere hypotheses. |

## Pinned baseline and current upstream

Read the reviewed library audit entries AUDIT-30 P.2, AUDIT-14 HB.4/HB.8/HB.10
and AUDIT-15 QM.5. Their claims refer to the recorded baseline. At Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, fresh statement reads confirmed
`AnalyticOnNhd` (analytic near each point) and `Matrix.PosDef` (Hermitian and
strictly positive on every nonzero vector). At Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, fresh reads confirmed
`FramedOrientedPDCode`, `TemperleyLieb.jones` and
`multivariateGaussian_eq_withDensity`. The last requires positive-definite
covariance and does not supply the formal operator or a singular density law.

The corresponding shared-build files were compared with Git objects at the
pin; all three match byte for byte. SHA-256 values are:

| Pinned module | SHA-256 |
|---|---|
| `TauCeti/KnotTheory/PDCode/Basic.lean` | `7edf13fc20675b037376d618868a34b45196004278a86128c510091bd7335293` |
| `TauCeti/KnotTheory/TemperleyLieb.lean` | `4c382e028224bce7029878c70f66defb89e8fbb2cc3f483b41ad902a7b25f775` |
| `TauCeti/Probability/Distributions/Gaussian/Density.lean` | `be6d918b1053cce31fcc66339c114323ee1bb71165232ef9fa3b3f6d26ab5c05` |

The build's Mathlib Git HEAD is the pin above. Current read-only upstream
roadmaps were read at `070dc2becd74419e76303ede84b465ed4a69461f`, including
GeometricTopology and DifferentialGeometry with relevant suggested signatures.
DifferentialGeometry's existing owners are recorded in /81, /82 and /103,
not proposed anew. Its Stokes interface uses an oriented smooth half-space
manifold, compactly supported C1 forms and outward-first boundary orientation.

Current Tau Ceti reads at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`
materially narrow two inherited absence claims:

- `TauCeti.MarkovBraid.jonesTrace` already combines the Markov trace with
  writhe correction, at loop value `-(a^2+a^-2)`, with one-strand value that
  loop value. `jonesTrace_conj`, `jonesTrace_stabilize`,
  `jonesTrace_stabilizeInv` and `TauCeti.MarkovEquiv.jonesTrace_eq` supply
  Markov invariance; `jonesTrace_sigma_pow_three` computes the trefoil.
  Import these and prove the consumer normalization dictionary. The current
  library has more than the braid representation recorded in the old audit.
- `TauCeti.UpperHalfSpace.riemannianMetric` and `isPretransitive_isom`
  provide the analytic height-scaled metric and transitive isometries; the
  module explicitly leaves completeness and curvature -1 unproved.
  `TauCeti.riemannianVolume` supplies the chart-glued measure for a
  finite-dimensional C1 manifold with Borel structure, LindelofSpace and a
  continuous Riemannian metric. No ideal-boundary/tetrahedron comparison
  declaration was found in the current geometry tree. Preserve the narrower
  missing canonical-region and signed-integral interface.

These corrections belong in the next authorized consumer edit. Nothing in the
read-only environment was edited, and no Lake command ran there.

## Public-source provenance

All eight PDFs below were retrieved on 11 October 2026. The bounded source
portions cited above were freshly read; their full contents were not audited.
Statements here are our own mathematical conclusions with locators, not source
passages or a section-by-section extraction. Earlier Milnor/Goncharov and full
Lawrence-Zagier proof audits remain inherited, separately attributed evidence.

| Public source/version | SHA-256 of retrieved PDF |
|---|---|
| [Zagier, The Dilogarithm Function](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf) | `05079cf525c6ba0f0d00b5c0d948bad202d291bc4910149d5d4abbab0515e7a0` |
| [Neumann, Extended Bloch group and the Cheeger-Chern-Simons class, v2](https://arxiv.org/pdf/math/0307092v2) | `de2f7ddec49b2ce6ccafd5a9a0be350972ffcf2014a6a3601a6d650df0018650` |
| [Garoufalidis-Zagier, Asymptotics of Nahm sums at roots of unity, v1](https://arxiv.org/pdf/1812.07690v1) | `c8e810047d40b52ffc139553e8c9833853675f139070f3d1d4cf365267ae5b66` |
| [Garoufalidis-Scholze-Wheeler-Zagier, The Habiro ring of a number field, v2](https://arxiv.org/pdf/2412.04241v2) | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |
| [Zagier, Quantum modular forms](https://people.mpim-bonn.mpg.de/zagier/files/qmf/fulltext.pdf) | `2ee0a69a2ffdd0f7611178fb79a15b5c130f324623640ed7557920435284f0bf` |
| [Habiro, A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres, v1](https://arxiv.org/pdf/math/0605314v1) | `5fb8b89b432401ea28d10e34d348c5cdebe43cf3ddb95c0475aaee869fa276fc` |
| [Zagier, Vassiliev invariants and a strange identity related to the Dedekind eta-function](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1016/S0040-9383%2800%2900005-7/fulltext.pdf) | `b95519fb3cb8cd36097988af2ec37549a8b7bdef03f6909dcad6c50a2b06815e` |
| [Lawrence-Zagier, Modular forms and quantum invariants of 3-manifolds](https://people.mpim-bonn.mpg.de/zagier/files/ajm/3-1/fulltext.pdf) | `10bbd2821a7f0897230687fde5e16322be58e8a6c3ea5f47d6de4cad180fd543` |

## Fresh validation

All five fresh packet checks pass with zero errors and warnings:

| Packet | Nodes | Gaps | Requests |
|---|---:|---:|---:|
| Polylogarithms | 75 | 19 | 21 |
| HabiroNahmSeries | 109 | 22 | 9 |
| QSeriesPartitionsAndMockModularForms | 537 | 24 | 27 |
| ArithmeticQuantumTopology | 106 | 8 | 19 |
| Polylogarithms--P.2 | 14 | 2 | 3 |

Fresh serial `lean-check` runs on the three issue-listed files exit 0, with
462, 441 and 1491 `sorry` warnings respectively, and no other diagnostics.
Memory availability exceeded 20 GB before elaboration. None of these
signatures changed; elaboration does not prove admitted statements.

| Suggested file | SHA-256 |
|---|---|
| `Polylogarithms.lean` | `bd1ce87ec38e2bf3d9f83ed1dfb09c3b7c6850167a8737bb303a2bf430125aad` |
| `HabiroNahmSeries.lean` | `e8e75371bea31ad9ac787aafd2c2fc195c2d25dee6f2aa14d5b069065394d04b` |
| `QSeriesPartitionsAndMockModularForms.lean` | `27f0445d4c487dcf3eda3753c342129ef89abd40a428f6f3b6f3518a744b19bf` |

Exact rational/complex arithmetic verified the cross-ratios, first-vertex
swap, scaled Taylor coefficients, singular matrix/null vector and central
multiplier products stated above. Parsed comparisons with the review base
verify that only top-level reviews/history changed in the three packets and
that every predecessor object is retained exactly. No link map or restructure
proposal is an assigned output, so their checkers do not apply.

Final intake path check: five files, zero problems. `git diff --check` passes.

## Scope blocker and exact resumption

The live issue was reread after claim and before submission. It lists seven
outputs, while `queue.json` lists eleven. The queue's referenced prompt is
absent. [WORKERS.md](../WORKERS.md) requires: “Edit only the files the issue
names, plus your own scratch space.” Its submitting/stopping rules additionally
allow this job's handoff note. Authorization was requested for the two extra
packet paths after preparing concrete changes; no answer has arrived.

| Completion check using unmodified `issues.deliverables_complete` | Result |
|---|---|
| Actual eleven-output queue job | false |
| In-memory copy restricted to seven issue-listed outputs | true |
| Actual job with only two proposed review objects supplied in memory | true |

All eleven outputs exist. The extra packet reviews name
`independent-review-REV-Polylogarithms--P.2` and
`independent-review-REV-ArithmeticQuantumTopology~2`; this job requires
`independent-review-REV-FIX-RT-AREA-topology~4` on each packet. The negative
QSeries verdict is accepted by that completion test. Neither the real queue,
completion code nor either extra packet was changed in the experiment.

The real result can be reproduced without a write:

```python
import importlib.util
import json
from pathlib import Path

spec = importlib.util.spec_from_file_location(
    "blueprint_issues", "research/blueprint/issues.py")
issues = importlib.util.module_from_spec(spec)
spec.loader.exec_module(issues)
queue = json.loads(Path("research/blueprint/queue.json").read_text())
job = next(j for j in queue["jobs"]
           if j["id"] == "REV-FIX-RT-AREA-topology~4")
print(issues.deliverables_complete(job))
for output in job["outputs"]:
    path = Path(output)
    if path.parent.name == "packets":
        review = json.loads(path.read_text())["review"]
        print(output, review["status"], review["reviewer"])
```

After explicit authorization or issue-scope repair, preserve each full old
review in `reviewHistory` and record the bounded findings above:

- `packets/Polylogarithms--P.2.json`: accepted for /7's ownership/import fix;
  preserve both gaps, three requests and the carrier/calibration obligations.
- `packets/ArithmeticQuantumTopology.json`: add the missing direct
  `Polylogarithms:P.2/hyperbolic-volume` prerequisite to
  `QT.5/volume-and-chern-simons`, then needs_changes for the geometric
  carrier/order/orientation/incidence comparison. Preserve G4/G5, all eight
  gaps, nineteen requests and the full prior review. Carry the current-library
  corrections into the separately authorized consumer update.

Use this review job's reviewer ID and the actual review date. The proposed
negative verdict is a completed review outcome; no proof, additional Lean
edit or reader edit is required merely to finish the completion test. The
QSeries reader synchronization needs its own authorized path. The
[handoff](../handoff/REV-FIX-RT-AREA-topology~4.md) contains the resumption
steps; no scratch file is needed by the next worker.
