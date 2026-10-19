# Independent review of topology fix round 4

Refs #6521. Codex, session `codex-waB1gJ`, 19 October 2026;
branch `codex-waB1gJ-review-topology-fixes`, input commit
`02e5b6234120d209864ffe0796ba11042c07d8bd`.
The bot confirmed the [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6521#issuecomment-6256730699).
This session authored neither the fixes nor their plans and took only this job.

**Checkpoint: the live issue's edit scope does not cover the queue's required
outputs.** The bounded supplier verdicts are accepted for Polylogarithms /7
and HabiroNahmSeries /11, and needs_changes for QSeries /13. Its reader still
contradicts the corrected packet and Lean multiplier. All seven queue packets
pass validation; all seven suggested files elaborate. These results do not
establish mathematical closure or replace the separately attributed whole-plan
audits. This review follows the 18 October codex-sP1hgJ checkpoint
([PR #10426](https://github.com/CBirkbeck/tauceti-explorer/pull/10426)).
Each issue-listed packet preserves its complete predecessor review once in
`reviewHistory` and records this session's bounded verdict.

## Scope and completion

Re-read the live issue after the bot confirmed the claim. Both its deliverable
list and full instructions authorize three packets and three suggested files,
plus this report. The current queue requires seven of each plus the report:
**15 outputs**. These four packet/suggested pairs are absent from the issue:

| Packet | Existing whole-plan review | Bounded review still to record |
|---|---|---|
| Polylogarithms--P.2 | REV-Polylogarithms--P.2 | /7; accept the owner split with geometric/calibration gaps |
| ArithmeticQuantumTopology | REV-ArithmeticQuantumTopology~2 | /1–/16; needs_changes for the missing direct supplier input and the G4/G5 geometric/comparison obligations |
| HabiroNahmSeries--HB.4 | REV-HabiroNahmSeries--HB.4 | /11; accept the qualified analytic export, retaining arithmetic gaps |
| HabiroNahmSeries--HB.10 | REV-HabiroNahmSeries--HB.10 | /11; accept the qualified formal/coefficient export, retaining gluing and cohomology gaps |

[WORKERS.md, Doing the work](../WORKERS.md) says “Edit only the files the issue
names, plus your own scratch space.” Requested authorization for these eight
paths and the two reader paths identified below; no answer arrived. Their
canonical contents remain unchanged. The mandatory handoff is authorized by
WORKERS' stopping rule and PROTOCOL §8.

Ran the actual unchanged `issues.deliverables_complete(job)`: **false**.
The four omitted packets still name their own whole-plan review jobs instead
of this fix review. The predicate accepts a completed negative verdict;
`needs_changes` is not the completion blocker. Do not delete queue outputs,
change the predicate or alter issue labels to conceal this discrepancy.
The [handoff](../handoff/REV-FIX-RT-AREA-topology~4.md) contains an unapplied,
59-line patch for the three concrete excluded-path corrections and the exact
four bounded review dispositions. Its patch passes `git apply --check`.
This checkpoint includes mathematical-contract clarifications and diagnostics
in the authorized files; it is not another metadata-only refresh.

## Assigned findings

Read all 27 assigned claims and verifier reasons, the
[fix report](../redteam/RT-AREA-topology.fixes-4.md), the predecessor review,
the affected supplier statements, prerequisites, APIs, tests and suggested
signatures. A handoff acceptance below means that the fix correctly assigns
an outstanding obligation; it does not claim the obligation is implemented.

| Finding | Verdict and reason |
|---|---|
| /1 | Accept handoff. Import GT 1/4/5 and existing framed presentations; the tangle, realization and surgery-calculus extensions remain named obligations. Arithmetic foundations do not replace geometric inputs. |
| /2 | Accept handoff. Admissible surgery presentations require the refined Hoste-move theorem, or an explicitly chosen RT-plus-rigidity route. Ordinary Kirby moves leave the admissible class. |
| /3 | Accept handoff. Import braiding, rigidity and Hopf foundations; the h-adic ribbon algebra, even integral form, completions, bottom tangles and twist still need their own targets. |
| /4 | Accept handoff. A rank-one quantum-group construction does not provide general Lie type. Keep the root-order restrictions and general-type supplier explicit. |
| /5 | Accept handoff. Import GT's Jones polynomial and prove the color/variable/framing/unknot comparison. A representation alone does not select the required invariant normalization. |
| /6 | Accept allocation. P.1/P.2 and V.3/V.4/V.6 supply the dilogarithm, groups and regulator comparisons. QT.0 or V.5 needs a stated use before becoming a premise. |
| /7 | Accept supplier fix. P.2 owns the tetrahedron formula over GT 7/8 foundations, while QT.5 assembles manifold volume. QT.5 still lacks the direct formula prerequisite. Retain the canonical-region, signed-integration and calibration gaps. |
| /8 | Accept handoff. Early ideal-boundary geometry and finite-volume cusped-manifold theory need explicit extensions. Closed-manifold Mostow and abstract triangulability do not supply them. |
| /9 | Accept handoff. Flattenings, extended lifts, Rogers descent and Chern–Simons period/sign comparisons remain separate targets. An ordinary Bloch element does not choose the extended lift. |
| /10 | Accept handoff. NZ data, perturbative series and their invariance precede the conditional NZ-to-Nahm application. Preserve the unimodular integral-B hypothesis; it is not a general existence theorem. |
| /11 | Accept supplier fix after clarification. The six exports separate completed formal integration, positive-definite radial asymptotics, formal identification and restricted module membership. Made the polynomial analytic comparison explicitly positive definite and distinguished precision from covariance normalization; added the negative-precision test. All follow-up qualifications remain inputs. |
| /12 | Accept handoff. Fix the color and root normalization, compare the original Kashaev definition and source each proved case. Keep unrestricted volume/modularity statements conjectural. |
| /13 | Needs changes. The definition and eight scalar exports have the correct owner, but the reader's general multiplier contradicts its packet and Lean. Added the central-element acceptance check and two Lean examples for the corrected and naive multipliers. Knot cocycles retain their distinct regularity and matrix/asymptotic laws. |
| /14 | Accept handoff. One formal-pentagon owner is consistent with a separately sourced analytic Faddeev/state-integral construction. Contours, convergence and 2–3 invariance do not follow from the formal identity. |
| /15 | Accept handoff. Resurgence requires named analytic carriers and exact conjectures, or explicit exclusion from the targets. A phase ledger does not prove summability. |
| /16 | Accept handoff. The two-variable Jones, MMR/Alexander and relative-Habiro comparisons remain sourced follow-ups with the specified prerequisites and Bouis–Gazda exclusion. |
| /23 | Accept maintainer note. Relative homotopy exists for arbitrary based pairs. Current AT Suggested.lean already states that generality; NDR/cofibration belongs in comparison theorems. |
| /24 | Accept maintainer note. A chain-level spectral-sequence supplier must include convergence, edge maps and naturality. Existing spectral objects do not discharge that contract. |
| /26 | Accept maintainer note. CW approximation, compression, weak-equivalence invariance and degree-one Hurewicz are actual proof inputs. Choose the classical or simplicial route explicitly. |
| /29 | Accept coordination. Reconcile dependencies upstream and regenerate extracts. Proposed restructuring edges are conditional until accepted. |
| /33 | Accept maintainer note. Import the existing absolute homotopy-map and basepoint APIs, extending them to pairs rather than duplicating the absolute owner. |
| /81 | Accept maintainer note. DG supplies the abstract boundary/faces. Balls, corner products, rounding, collars and gluing require the stronger named geometric interfaces; a subset boundary loses face multiplicity. |
| /82 | Accept maintainer note with current owner correction. DG 3.3 already supplies finite-dimensional connected boundaryless homogeneity. Supported isotopy extension and transport of gluings remain stronger requests. |
| /87 | Accept maintainer note. Select a surface/mapping-class supplier and a triangulation or Morse route to Heegaard existence. Boundary connected sum needs an explicit input. |
| /91 | Accept coordination with current owners. GT 7 consumes Hopf–Rinow's connection and Tau Ceti's Riemannian measure. Dependency reconciliation does not license duplicate constructions. |
| /103 | Accept maintainer note with current owner correction. DG now owns manifold forms, exterior derivative, orientation and Stokes. Floer applications import the actual regularity, support and boundary-sign hypotheses. |
| /105 | Accept maintainer note. Four-dimensional handles, Spin-c, intersection/signature and absolute rational grading require suppliers. Correction terms retain rational-homology-sphere scope. |

## Source comparisons and distinguishing checks

All source descriptions are in this reviewer's own words. Public sources were
accessed on 18–19 October 2026; no downloaded file, source passage or source's
section-by-section summary is committed.

For /7, [Zagier, The Dilogarithm Function](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf),
I.3 equation (5), p.11, and I.4 equations (7)–(9), pp.13–14, distinguish
an alternating ordered cross-ratio value from ordinary unsigned volume.
The packet explicitly fixes its own ordering and positive-orientation
convention; its odd-permutation and regular-tetrahedron checks detect a sign
mistake. GT 7/8 provides the metric/measure and model foundations. The P.2
part's analytic angle-volume target does not construct a measurable ideal
region, its signed decomposition or its change-of-model comparison. Those
requests and the map-level Borel calibration remain open.

For /11, read [GSWZ v2](https://arxiv.org/pdf/2412.04241v2), Theorems 3/5
and equation (38), p.14; §1.8 pp.16–17; Definition 2.11 and (117)–(119),
pp.29–30; (126), p.31; and Theorem 8, pp.35–36. The six HB exports retain:

- Euler–Maclaurin's derivative/decay and uniform-remainder conditions.
- A symmetric invertible formal Hessian over a rational algebra and the
  completion that makes coefficientwise Gaussian integration meaningful.
- Positive-definite analytic Nahm data for radial asymptotics, odd coprime
  orders, chosen roots and a strong all-orders remainder.
- The t-deformed solution, regularized factors and residue periodicity in
  the FGI collection; Laurent coefficients in x before t-completion and the
  coprime auxiliary-order restriction in its defined refined input.
- A nondegenerate solution, discriminant coefficient extension, specified
  index and orders prime to Delta in module membership.

[GZ v1](https://arxiv.org/pdf/1812.07690v1), datum pp.2–3 and Theorem 3.1
pp.5–6, confirms the analytic hypotheses. Its printed formula is not an
unqualified replacement for the packet's corrected prefactors and remainder.
The matrix with all four entries 1 annihilates `(1,-1)` and fails positive
definiteness; a chosen invertible formal Hessian remains a different condition.
The second, fourth, odd and off-diagonal Gaussian moment tests distinguish
normalization and covariance mistakes.

The parent export now explicitly imports HB.8's refined-Gaussian comparison
and uniform-t-regularity gaps and HB.9's Kummer/gluing obligations. HB.4 also
retains coefficientwise Kummer descent and rational-data normalization gaps.
HB.10 retains finite étale scalar change, a specified K3 lift, the tame-kernel
prime input, global-line extension and the naive-to-algebraic cohomology
comparison. Restricted formal membership gives neither a global generator
nor a geometric cohomology class. These are qualified exports, not completed
proofs. The HB reader's introduction locator for Theorem 3 is still p.13;
the actual equation (38) is on **printed p.14**.

For /13, read [Zagier, Quantum modular forms](https://people.mpim-bonn.mpg.de/zagier/files/qmf/fulltext.pdf),
the definition p.2 and Examples 3–5 pp.10–12;
[Lawrence–Zagier](https://people.mpim-bonn.mpg.de/zagier/files/ajm/3-1/fulltext.pdf),
Theorems 1–2 and the mean-zero periodic proposition pp.98–99; and the rendered
[Strange identity](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1016/S0040-9383%2800%2900005-7/fulltext.pdf),
§6 equations (38)–(39), p.958. Formal root evaluation requires an analytic
comparison before it becomes a radial-limit theorem. Example 5's knot
cocycle does not satisfy the real-analytic scalar definition used by the
shared examples. QT.7 owns the knot normalization and matrix/asymptotic laws.

The multiplier discrepancy is independently visible in the actual light Lean
definitions. At `gamma=-I`, `c=0,d=-1`, the lower-boundary definition gives
`j_(3/2)=exp(-3*pi*i/2)=i`. The eta multiplier is `-i`, whose inverse is `i`.
The reader's unmodified inverse therefore gives total slash factor `-1`.
The packet/Lean correction takes **minus** that inverse, giving epsilon `-i`
and total factor `1`. In general use inverse eta for `c != 0` or `d > 0`,
and its negative for `c=0,d<0`. This is a derivation from the chosen branch,
not a formula attributed verbatim to either source. The negative control is now in the packet acceptance checks and suggested
file. Updating the reader statement and ambient hypotheses remains blocked
by its excluded path; the handoff contains the exact patch.
Preserve the independent whole-plan objections in
REV-QSeriesPartitionsAndMockModularForms~2 (#6469).

For /2, [Habiro v1](https://arxiv.org/pdf/math/0605314v1), Theorem 9.4 p.34
and Theorems 10.1–10.2 p.35, gives the exact admissible-link/Hoste route.
Its statement is narrower than invariance under arbitrary Kirby moves.

## Library owners, validation and changes

Read current AT, DG and the relevant GT 7/8 contracts in the supplied read-only
checkout. Roadmap HEAD: `0d144d044dacebca17b654695b6f1ad58f159b27`;
current Tau Ceti HEAD: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
The baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
Read the reviewed library-coverage entries for P.2, HB.4, HB.10 and QM.5.
Re-read Tau Ceti's Gaussian density and withDensity theorem at the exact pin:
the latter assumes positive-definite covariance. Read pinned Mathlib's
`trapezoidal_error` definition and `trapezoidal_error_le`: the quantity is
signed, while the theorem bounds its absolute value under differentiability,
second-derivative bound and positive subdivision count. Neither supplies
formal completion or an all-orders Euler–Maclaurin theorem. No new baseline
claim or mathematical node was added.

The parent formal-Gaussian statement previously described the polynomial
expectation comparison without restating the positivity carried by its linked
moment theorem. Made that restriction explicit in the statement and test.
The proof route now distinguishes precision Lambda from covariance Lambda^-1:
the integral has factor `(2*pi)^(N/2) det(Lambda)^(-1/2)`, whereas its normalized
density has factor `(2*pi)^(-N/2) det(Lambda)^(1/2)`. Added the diagnostic
`<x^2>_{-1}=-1` at h=1. The real kernel is then `exp(x^2/2)`, which is not
integrable, so no analytic comparison can be inferred. The existing Lean
`integral_mul_gaussian` already assumes `Lambda.PosDef`; its signature is
unchanged. The HB reader still has the old wording and should be synchronized
with this clarification as well as its page correction.

For the proposed QT formula edge, traversed the known node-prerequisite graph
(37,080 distinct node IDs). The P.2 supplier reaches 30 references and no path
back to the QT volume node. Its direct geometric inputs remain GT 7/8 stages.
This check establishes no new geometry theorem; it checks the concrete
node-edge addition in the handoff.

Fresh validation of canonical files:

| Packet / suggested file | Nodes | Gaps | Requests | Lean sorry warnings |
|---|---:|---:|---:|---:|
| Polylogarithms | 75 | 19 | 21 | 462 |
| HabiroNahmSeries | 109 | 22 | 9 | 442 |
| QSeriesPartitionsAndMockModularForms | 537 | 24 | 27 | 1493 |
| Polylogarithms--P.2 | 14 | 2 | 3 | 52 |
| ArithmeticQuantumTopology | 106 | 8 | 19 | 65 |
| HabiroNahmSeries--HB.4 | 13 | 3 | 1 | 31 |
| HabiroNahmSeries--HB.10 | 14 | 5 | 3 | 28 |

Every packet passes `scripts/check_blueprint.py` with **zero errors and
warnings**, including the declaration index. Every suggested file exits 0
through serial `lean-check`, with only the listed admitted-declaration
warnings. Memory was checked before each compile. The build's Mathlib HEAD
is the exact pin; these seven files import only Mathlib, so no Tau Ceti build
revision is inferred from elaboration. No compiler remains running. No Lake
command ran in the read-only trees, and no language server was started.
There are no link-map or restructuring-proposal deliverables to validate.

Changes are limited to this report, its handoff, the three authorized packet
review/history objects, the parent HB formal-Gaussian node, the QSeries
Kontsevich acceptance check, and their three new suggested examples. Each
complete predecessor review is preserved once. The parent HB unit-test count
increases from 125 to 126; the new QSeries acceptance check is attached to an
existing theorem. All other mathematical JSON payloads, nodes, gaps, requests,
coverage, source findings and prior audits are unchanged. No excerpt keys were
introduced. Five suggested files and all pre-existing Lean declarations are
unchanged. The omitted canonical files, queue, completion code, upstream
sources and generated atlas outputs remain unchanged. Intake file checks and
`git diff --check` pass. Completion requires the explicit scope reconciliation
in the handoff, not more repeated checking of unchanged files.
