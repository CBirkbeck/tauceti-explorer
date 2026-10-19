# Independent scope-blocked continuation: codex-ilSIEy

Refs #6521. Codex, session `codex-ilSIEy`, 19 October 2026;
branch `codex-ilSIEy-topology-review`, input
`19ac37603d79b1e4bf0e36fe577bcd3563d0b119`.
The bot [confirmed this claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6521#issuecomment-6259350556).
This reviewer did not author the fixes. No second job was claimed.

**Blocked checkpoint; no new mathematical correction.** Re-read all 27 assigned
findings, their verifier dispositions, the round-four fix report and the affected
parent contracts. Fresh public-source checks support the existing qualified
/7, /11 and /13 dispositions below. In particular, GZ Theorem 3.1, pp.5–6
requires positive-definite analytic data; GSWZ v2 Theorem 5, p.14 and Theorem 8,
pp.35–36 impose separate formal/arithmetic hypotheses. The all-ones figure-eight
matrix has a nontrivial kernel and cannot instantiate the former theorem.
Zagier's quantum-modular definition, p.2 and Examples 3–5, pp.10–12 keep the
scalar analytic examples separate from discontinuous knot cocycles. The
corrected Kontsevich factor argument below agrees with the inspected pinned
eta-nonvanishing and denominator-cocycle declarations. Its excluded reader
still gives the naive inverse multiplier, so /13 remains needs_changes.

Re-read the live issue after the claim. It still names only three parent pairs;
the queue still requires seven. Executed the unchanged
`issues.deliverables_complete` function: **false**, with precisely the four
excluded packet reviewer identities listed in the handoff. WORKERS.md's explicit
file restriction prevents supplying those verdicts. Requested scope clarification;
none received before submission. No excluded file, review metadata, queue entry,
predicate or label was changed. The inherited report and reviews retain their
authorship; repeating their metadata would not resolve this blocker.

Fresh checks: all three permitted parent packets pass `check_blueprint.py` with
the pinned declaration index, zero errors/warnings. No Lean file changed and no
Lean compilation was repeated; earlier compilation results below are inherited.
Current owner checks still support the AT README/signature mismatch and reuse
of DG's existing foundations. The [handoff](../handoff/REV-FIX-RT-AREA-topology~4.md)
gives the scope repair, four prepared dispositions and unapplied corrections.

## Preserved preceding report (codex-iuSTeN and earlier)

# Independent continuation: topology fix round 4

Refs #6521. Codex, session `codex-iuSTeN`, 19 October 2026,
branch `codex-iuSTeN-review-topology`.
The bot [confirmed this claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6521#issuecomment-6258675587).
This reviewer authored neither the original fixes nor their preceding audits.

**Blocked checkpoint.** The live issue authorizes three parent packet/suggested
pairs and this report; the unchanged queue requires four further pairs. The
four excluded packet reviews still identify their whole-plan reviewers, so the
actual completion predicate is false. The issue's explicit file restriction
prevents recording this job's verdicts there without authorization. Requested
permission for the four packet paths while continuing the authorized review;
no authorization has arrived. No excluded path, queue entry or predicate was
changed. The excluded readers remain separately assigned follow-ups.

The inherited 27 finding dispositions below remain applicable: /13 needs
changes in the reader; the other findings accept qualified supplier/routing
repairs or identify remaining maintainer action. This does not accept all of
ArithmeticQuantumTopology's geometric/comparison obligations or certify its
whole plan. The four prepared packet dispositions and scope-reconciliation
instructions are retained in the [handoff](../handoff/REV-FIX-RT-AREA-topology~4.md).
Earlier reviews, source checks and Lean results below retain their original
authorship; they are not presented as new experiments by this session.

## New correction: a complete factor-cocycle proof outline

The authorized QSeries Kontsevich node previously explained the negative-real
cut sign, then invoked an unspecified integral weight shift by two. Replace
that step with the following argument, and add direct prerequisites for the
eta transformation law, nonvanishing and denominator cocycle. The statement,
Lean signature and analytic gaps are unchanged.

Write D_gamma(z)=cz+d and v_gamma=v_eta(gamma), with principal powers.
On the upper half-plane, the eta law and nonvanishing make
A_gamma(z)=v_gamma^(-1) D_gamma(z)^(-1/2) a multiplicative factor: it is
eta(z)/eta(gamma z). Squaring the eta transformation law shows that v_gamma^2
is a character, because the square of the principal square root is D_gamma
and D itself satisfies the denominator cocycle.

For lower-half-plane w, conjugating A_gamma(conj(w)) gives
s_gamma v_gamma D_gamma(w)^(-1/2). Here s_gamma=-1 precisely when c=0,d<0,
and is 1 otherwise. The eta multiplier has norm one; conjugation of the
principal half power fails only on the negative-real cut. Multiply this
conjugated factor by the character v_gamma^(-2) and the integral-weight
factor D_gamma(w)^(-1). The result is

    s_gamma v_gamma^(-1) D_gamma(w)^(-3/2).

Each factor satisfies the multiplicative law, so the product does too. Taking
lower boundary limits away from intermediate and product poles proves the
corrected QuantumCocycleCondition. At -I its constant multiplier is -i and
its boundary power is i, giving total factor 1. This is an argument for the
factor's consistency for every matrix, beyond the inherited finite diagnostic;
it does not establish the analytic transformation law of the Kontsevich
function. It is a proof sketch for later formalization, not a newly compiled
Lean theorem. Preserve the packet's analytic and multiplier-extension gaps.

The inputs are the packet's QM.1/eta-transformation-law and unit eta-multiplier
contract, with pinned Mathlib's ModularForm.eta_ne_zero (nonvanishing on the
upper half-plane) and UpperHalfPlane.denom_cocycle (non-real argument).
Their source declarations were inspected at the audited Mathlib pin. The
lower-half-plane denominator never vanishes, so the conjugation and division
steps apply throughout that domain.

## Validation in this session

The three authorized parent packets pass check_blueprint.py with the supplied
pinned declaration index: zero errors and warnings. No nodes, gaps or requests
were removed. The QSeries preceding bounded review is preserved once in
reviewHistory before recording this continuation. The inherited separate
whole-plan audits are not replaced by a whole-plan acceptance. Current-run
Lean results: all three authorized suggested files elaborate successfully,
with only admitted-declaration warnings (Polylogarithms 462, HabiroNahmSeries
442, QSeries 1491). They were checked serially through lean-check with more
than 20 GB available before each run. No Lean file changed. Intake checks
pass for all three changed paths, and git diff --check passes. No compiler
or language server remains running.

## Preserved preceding report (codex-YFJHa3)

The following report, including its source comparisons, finite experiments
and compilation table, is preserved as preceding work. References to “this
run” below mean codex-YFJHa3, not codex-iuSTeN.

# Independent review of topology fix round 4

Refs #6521. Codex, session `codex-YFJHa3`, 19 October 2026;
branch `codex-YFJHa3-review-topology-fixes`, input commit
`dfa7cb015f9004325762f89eafc1eec20f6c93f9`.
The bot confirmed the [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6521#issuecomment-6256990517).
This reviewer authored neither the fixes nor their plans and claimed no second job.

**Blocked checkpoint: the issue authorizes three packet pairs, while its queue
entry requires seven.** The bounded verdicts remain accepted for Polylogarithms
/7 and HabiroNahmSeries /11, and needs_changes for QSeries /13. The latter's
reader still contradicts its corrected multiplier. The actual completion
predicate remains false because four required packet review objects are outside
the live issue's edit scope. A negative mathematical verdict is permitted by
that predicate and is not the blocker.

This continuation adds substantive verification: the two QSeries central-element
examples now have proofs from the actual boundary-factor definition, without
`sorry`; an exact finite cocycle calculation distinguishes the corrected and
naive multipliers; and the upstream /23 disposition now explicitly records the
remaining disagreement between AT's README and suggested signatures. Earlier
whole-plan audits and all outstanding mathematical gaps remain in force.

## Scope and independence

Read the live issue and comments again after the claim. Its seven outputs are
this report and the three parent packet/suggested pairs. The queue has fifteen
outputs, adding these four pairs:

| Packet | Bounded disposition prepared, but not recorded in its excluded review object |
|---|---|
| Polylogarithms--P.2 | Accept /7 with its ideal-region, signed-integration and calibration qualifications; retain the separate 14-node whole-plan audit, 2 gaps and 3 requests. |
| ArithmeticQuantumTopology | Needs_changes for /1–/16's geometric/comparison obligations, particularly G4/G5; add the direct P.2 formula prerequisite. Preserve the separate accepted 106-node audit, 8 gaps and 19 requests. |
| HabiroNahmSeries--HB.4 | Accept qualified /11 with positivity, odd coprime orders, branch and strong-remainder conditions; retain coefficientwise Kummer/rational-data gaps, the 13-node audit, 3 gaps and 1 request. |
| HabiroNahmSeries--HB.10 | Accept qualified /11 with finite-etale scalar change, the specified K3 lift, tame primes, restricted roots and HB.9 gluing inputs; retain the global-line/cohomology gaps, 14-node audit, 5 gaps and 3 requests. |

[WORKERS.md, Doing the work](../WORKERS.md) says “Edit only the files the issue
names, plus your own scratch space.” Requested explicit authorization for these
eight omitted paths and the two reader corrections; none arrived during this
run. No excluded canonical path was edited. The readers are also absent from
the queue, so merely granting worker permission would not make them valid
submission paths under the current intake: either reconcile the deliverable
scope or leave those reader corrections as a separately assigned follow-up.
A bounded needs_changes review can complete without repairing an excluded
reader. Do not alter queue outputs, predicates or labels to simulate completion.

The [handoff](../handoff/REV-FIX-RT-AREA-topology~4.md) retains the exact unapplied
correction patch and four review dispositions. This run updates only authorized
parent review objects, this report, its mandatory handoff and the QSeries
suggested diagnostics. Each complete preceding review is archived once in
reviewHistory. The former whole-plan checks are preserved, not attributed to
this bounded continuation.

## Assigned findings

Read all 27 assigned claims, evidence, proposed fixes and verifier reasons,
the [round-four fix report](../redteam/RT-AREA-topology.fixes-4.md), the preceding
review and the affected supplier statements, prerequisites, APIs and diagnostics.
Acceptance of a routing decision does not certify implementation of its target
or a new whole-plan audit of the consumer.

| Finding | Verdict and reason |
|---|---|
| /1 | Accept routing. QT imports the framed-link and manifold owners; the tangle-category, realization and surgery-calculus extensions are additional work, rather than arithmetic-foundation imports. |
| /2 | Accept routing. Invariance on admissible surgery presentations uses Hoste moves and the twisting theorem. Arbitrary Kirby moves do not preserve this domain; the alternative RT route must be chosen explicitly. |
| /3 | Accept routing. Existing braided/rigid/Hopf APIs are inputs. Completed ribbon algebras, integral forms, bottom-tangle invariants, the pairing and twist are separate constructions. |
| /4 | Accept routing. General simple Lie type needs general quantum groups and the sourced root-order restrictions. Rank-one data cannot discharge this target. |
| /5 | Accept routing. The comparison with the existing Jones owner must fix variables, color, framing and unknot normalization. A braid representation alone is insufficient. |
| /6 | Accept supplier allocation. P.1/P.2 provide the dilogarithm/regulator, and V.3/V.4/V.6 provide the algebraic interfaces. Extra QT.0/V.5 inputs require a stated use. |
| /7 | Accept the supplier repair. P.2 alone owns the oriented tetrahedron formula, with GT 7/8 inputs and explicit ideal-region/integration/calibration gaps. QT.5 still needs its direct formula prerequisite. |
| /8 | Accept routing with qualifications. Ideal-boundary geometry must precede P.2; finite-volume cusped manifolds and triangulations are further inputs for QT.5. Closed-manifold rigidity does not provide them. |
| /9 | Accept routing. The extended Bloch lift, flattenings, Rogers descent and complex-volume period/sign comparison remain distinct obligations; an ordinary Bloch class supplies no canonical lift. |
| /10 | Accept the conditional bridge. NZ data and perturbative-series invariance must precede the Nahm application. Preserve the unimodular integral-B assumption rather than claiming such data always exist. |
| /11 | Accept the qualified supplier boundary. The six exports distinguish algebraic Gaussian integration, positive-definite radial analysis, formal identification and restricted module membership; none asserts knot invariance. |
| /12 | Accept routing. Fix the Kashaev color/root normalization and compare its original definition. Each proved knot case needs its actual hypotheses; unrestricted volume/modularity statements remain conjectures. |
| /13 | Needs changes in the reader. QM.5 owns the scalar definition/examples, but its reader still asserts a global inverse eta multiplier. The packet and Lean use the necessary branch correction. This run proves both central-element diagnostics from the boundary-factor definition. |
| /14 | Accept routing. The common formal pentagon and the analytic Faddeev/state-integral theory have separate contracts. Contours, convergence and the analytic 2–3 move do not follow from a formal identity. |
| /15 | Accept routing. Resurgence targets require specified analytic objects and exact conjectures, or an explicit scope exclusion. The example ledger alone cannot state a summability theorem. |
| /16 | Accept routing. The two-variable Jones/MMR and relative-Habiro follow-ups need their named suppliers and sources. Preserve the Bouis–Gazda exclusion. |
| /23 | Accept the remaining maintainer action. Current AT Suggested.lean defines relative groups for arbitrary based pairs, but README Stage 8.1 still restricts them to NDR/cofibrations. Reconcile that text; retain NDR conditions on comparison theorems that use them. |
| /24 | Accept the supplier request. A chain-level spectral sequence needs convergence, edge maps and naturality, beyond the baseline spectral-object construction. |
| /26 | Accept routing. CW approximation/compression, weak-equivalence invariance and degree-one Hurewicz must be available along the selected classical or simplicial proof route. |
| /29 | Accept coordination. Upstream dependency corrections require regeneration of the extract. Pending restructuring edges remain conditional until accepted. |
| /33 | Accept the ownership correction. Extend the existing absolute homotopy-map/basepoint API to pairs, without rebuilding its absolute owner. |
| /81 | Accept with the current supplier. DG 5.5 owns abstract boundary/faces. Ball structures, corner products, rounding, collars and gluing still need the stronger geometric contracts; subset boundary loses face multiplicity. |
| /82 | Accept with the current supplier. DG 3.3 already plans homogeneity for connected finite-dimensional boundaryless manifolds. Supported isotopy extension and its gluing comparison are stronger requests. |
| /87 | Accept coordination. A single surface/mapping-class supplier and an explicit triangulation or Morse route must support Heegaard existence; boundary connected sum also needs an input. |
| /91 | Accept coordination with current owners. GT 7 consumes the connection from HopfRinow and the existing Riemannian measure. Reconcile dependencies without allocating those constructions again. |
| /103 | Accept with updated ownership. DG already plans manifold forms, exterior derivative, orientation and Stokes. Floer consumers must import their regularity, support and boundary-sign hypotheses. |
| /105 | Accept routing. Four-dimensional handles, Spin-c, intersection/signature and absolute rational grading require named suppliers. Correction terms keep rational-homology-sphere scope. |

## Source comparisons

Source descriptions below are in this reviewer's own words. Read the relevant
pages of seven public PDFs on 19 October 2026, including the rendered
Topology theorem on pp.958–959. No source passages or downloaded sources are
committed. These checks establish the assigned supplier/routing boundaries;
they do not claim a full re-audit of all sources in the consumer roadmap.

For /7, [Zagier, The Dilogarithm Function](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf),
I.3 equation (5), p.11, and I.4 equations (7)–(9), pp.13–14, give the ordered
cross-ratio and oriented tetrahedron/manifold formulas. Odd permutations change
the sign; ordinary unsigned volume cannot satisfy that rule. The parent P.2
node fixes its own ordering and orientation and carries the geometric requests.
The part's Milnor-angle target is analytic: it does not itself construct the
measurable ideal region, signed integration or model/metric comparison. Retain
those gaps and the map-level regulator calibration. Traversing the current
node-prerequisite graph (37,754 distinct node IDs), the supplier has 30 reachable
references and no path back to QT.5's volume node, so the proposed direct edge
has no reverse path in that graph. This establishes no geometric theorem.

For /11, [GSWZ v2](https://arxiv.org/pdf/2412.04241v2), Theorem 3 equation (38)
and Theorem 5, printed p.14; §1.8 pp.16–17; equations (110)–(111), p.28;
Definition 2.11 and equations (117)–(119), pp.29–30; equation (126), p.31;
and Theorem 8 pp.35–36, separate the formal bracket, its t-deformed collection,
identification and restricted-root module membership. Theorem 8's refined
input inherits the coprime auxiliary-order restriction from (126), and its
Laurent coefficients in x precede t-completion. Theorem 5 requires a chosen
nondegenerate solution, discriminant coefficient extension, Bloch index and
orders prime to Delta. It does not give an arbitrary geometric cohomology class.
The HB reader's introduction locator remains p.13 and needs correction to
printed p.14 for equation (38).

[GZ v1](https://arxiv.org/pdf/1812.07690v1), the datum pp.2–3, equations
(13)–(14) p.4 and Theorem 3.1 pp.5–6, require positive-definite analytic Nahm
data, odd coprime radial orders and specified roots. Retain the packet's
corrections to prefactors and the cancellation-safe remainder; do not replace
them by an unqualified transcription of the printed formula. The all-ones
2-by-2 matrix kills (1,-1), so the analytic theorem cannot be applied to it.
Formal integration instead permits a symmetric invertible precision over a
rational algebra. For real positive-definite precision Lambda, the integral
factor is (2*pi)^(N/2) det(Lambda)^(-1/2), while the normalized density factor
is (2*pi)^(-N/2) det(Lambda)^(1/2). The negative-precision moment separates
this formal construction from a nonexistent real Gaussian integral. HB.8's
prefactor/uniform-t-regularity gaps and HB.9's Kummer/gluing obligations remain
in the parent export; HB.4 and HB.10 retain their further arithmetic and
comparison gaps. No new HB mathematical correction was established in this run.

For /13, [Zagier, Quantum modular forms](https://people.mpim-bonn.mpg.de/zagier/files/qmf/fulltext.pdf),
definition p.2 and Examples 3–5 pp.10–12, distinguishes the scalar real-analytic
condition from Example 5's discontinuous knot cocycle.
[Lawrence–Zagier](https://people.mpim-bonn.mpg.de/zagier/files/ajm/3-1/fulltext.pdf),
Theorems 1–2 and the periodic mean-zero proposition pp.98–99, supplies an
analytic radial/asymptotic comparison, beyond formal root evaluation.
[Zagier, Strange identity](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1016/S0040-9383%2800%2900005-7/fulltext.pdf),
§6, equations (38)–(39) and the theorem pp.958–959, supplies the scalar
transformation law and smooth period function. Its indication of proof does
not discharge the packet's independent analytic and multiplier-extension gaps.
QT.7 retains knot normalization, matrix/asymptotic laws and their own regularity.

At gamma=-I, the actual lower-boundary definition has j_(3/2)=i. The ordinary
eta multiplier is -i; its naive inverse is i, giving total factor -1. The
corrected epsilon is -i and gives 1. This run replaces both corresponding
admitted Lean examples with proofs using a private branch-value lemma, directly
from boundaryFactor and the pinned complex-exponential identities. It does not
use the admitted quantum-modularity or eta-multiplier theorems to prove these
branch diagnostics. It also does not prove the full multiplier-system theorem.

As an independent finite check, enumerated every determinant-one integer matrix
with entries in [-3,3] (116 matrices), every ordered pair, and x=n/3 for
-6 <= n <= 6, omitting intermediate/product poles. Used rational Dedekind sums
for eta's phase, rational branch phases modulo 2 and exact denominator products,
without floating-point tolerances. All 162,340 admissible cases satisfy the
corrected factor law; the naive inverse fails 23,072. One failure has
(g,h,x)=(((-3,-2),(-1,-1)),((-1,-3),(0,-1)),-2), with phase discrepancy 1
modulo 2. This finite calculation is a distinguishing diagnostic, not a general
proof. The reader still requires the piecewise correction: inverse eta for
c != 0 or d > 0, minus inverse eta for c=0,d<0.

For /2, [Habiro v1](https://arxiv.org/pdf/math/0605314v1), Theorem 9.4 p.34
and Theorems 10.1–10.2 p.35, confirms the twisting/Hoste route on admissible
presentations. The alternative route in §11.4 consumes the RT invariants.
Neither justifies invariance under arbitrary Kirby moves within this domain.

## Current owners and validation

Read the reviewed library-coverage entries for P.2, HB.4, HB.10 and QM.5, and
the relevant current AT, DG and GT contracts in the supplied read-only checkout.
Roadmap HEAD is `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti
HEAD is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Audit pins remain Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

In particular, current AT README Stage 8.1 lines 385–387 still imposes the
unnecessary NDR restriction, whereas Suggested.lean's relativeHomotopyGroup
(lines 341–343) and induced/boundary/basepoint maps take arbitrary BasedTopPair.
The preceding report mentioned only the signature generality; /23's README
reconciliation remains outstanding. Current DG 3.3 supplies finite-dimensional
boundaryless homogeneity; layers 1–2 and 5 supply forms/orientation/Stokes,
including the abstract-boundary convention for corners in 5.5. These are
existing plans to consume, not new atlas roadmaps to create. GT 7 imports the
connection and Riemannian-measure foundations. No upstream tree was edited or
used as a Lake build.

Fresh canonical-file results:

| Packet / suggested file | Nodes | Gaps | Requests | Lean sorry warnings |
|---|---:|---:|---:|---:|
| Polylogarithms | 75 | 19 | 21 | 462 |
| HabiroNahmSeries | 109 | 22 | 9 | 442 |
| QSeriesPartitionsAndMockModularForms | 537 | 24 | 27 | 1491 |
| Polylogarithms--P.2 | 14 | 2 | 3 | 52 |
| ArithmeticQuantumTopology | 106 | 8 | 19 | 65 |
| HabiroNahmSeries--HB.4 | 13 | 3 | 1 | 31 |
| HabiroNahmSeries--HB.10 | 14 | 5 | 3 | 28 |

All seven packet checks report zero errors/warnings, including their declaration
index checks. All seven suggested files elaborate serially through lean-check;
only the listed admitted-declaration warnings remain. Checked memory before
each compile and verified the build's exact Mathlib pin. All seven files import
only Mathlib, so no Tau Ceti build revision is inferred from elaboration. The
isolated branch-diagnostic prototype also elaborates without warnings. No
compiler remains running, and no language server was started.

No nodes, gaps, requests, mathematical JSON statements or earlier audits were
removed or rewritten. No excerpt keys were introduced. Intake file checks and
git diff --check pass. The four omitted review objects still prevent completion;
reconcile that scope before assigning this job again. Do not repeat a metadata-only
checkpoint or treat more validation of unchanged files as resolving the blocker.
