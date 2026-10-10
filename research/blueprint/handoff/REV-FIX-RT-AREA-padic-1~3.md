# REV-FIX-RT-AREA-padic-1~3 handoff

Codex `codex-HQccLS`, 10 October 2026; issue #5704. The bot confirmed this
session's claim. Continued the merged `codex-iTQbCz` checkpoint without
claiming another job. The issue's three-packet review is finished: AEG and ASII are
accepted for their submitted scoped corrections; P0 remains needs_changes.
The [review report](../reviews/REV-FIX-RT-AREA-padic-1~3.md) records every
finding's disposition, source URLs/versions/hashes and the exact limitations.

All three packets have the current job's reviewer string and date. Their
previous reviews are archived unchanged; mathematical contracts, historical
reviews, coverage and source records are preserved. Fresh source reading
and comparisons of six reader statements, hypotheses and proof steps confirm
the third-round synchronization. Strengthened the R5 check: its 19-node prefix
is closed internally and its transitive cone of 626 vertices through these
three packets has no H0 input; external inputs remain leaves. It still awaits
stage installation.
No excluded owner was reviewed or edited.

Fresh stock packet checks with the pinned declaration index give zero errors
and zero warnings on each packet. The combined three-packet graph is acyclic
with external inputs treated as leaves. All three suggested files compiled
sequentially through `lean-check`, exit 0, only `sorry` warnings: P0 1285,
AEG 361, ASII 912. Intake file checks and `git diff --check` pass. These checks
do not certify the two P7 targets that are still comments.

## Blocker: issue/queue scope mismatch

The issue names P0, AdicEtaleGeometry and AdicSpacesPartII only. The queue entry
for this job additionally lists 20 packets and their suggested files:

PerfectoidQuotients; PerfectoidShimuraVarieties; PerfectoidSpaces--P8;
DiamondsAndVStacks; GeometricSatakeAndFusion--GS0;
RelativeFarguesFontaine--RF0; HodgeTateAndCanonicalSubgroups--T6;
FarguesFontaineDiamonds; DiamondEtaleCohomology--C0; DiamondSixOperations;
AInfCohomology--AI.0; RelativeFarguesFontaine--RF4;
VectorBundlesAndIsocrystals--VB0; VectorBundlesAndIsocrystals--VB3;
HodgeTateAndCanonicalSubgroups--T0; CohomologyComparisons;
IgusaVarietiesAndTorsionConcentration; AlgebraicModularFormsAndSerreWeights;
HilbertModularVarietiesAndShimuraCurves--H0; ShimuraCompactifications--C6.

The queue currently has 47 outputs, whereas the issue has seven. The
completion predicate requires this job's independent verdict in every
listed packet. Evaluating it on the issue's seven stated deliverables passes;
evaluating the current queue entry fails. This is a scope blocker, not a
reason to invent verdicts on excluded files. WORKERS permits edits only to
the issue's named deliverables and this handoff. A scope clarification was
requested during the run; no expansion is assumed without a response.

Resume by reconciling the manager's intended scope in the queue and issue:
either retain the three-packet author-fix scope, or explicitly authorize the
additional independent reviews. If the latter, check actual fix authorship
and review inputs before touching any of the 20 packets; existing verdicts
from other jobs cannot merely be renamed. The scoped work here need not be
repeated. This continuation rechecked the predicate and requested scope
clarification, but received no answer. Submit this as a checkpoint for the
scope blocker; another worker should not repeat the same scoped review while
the mismatch remains. A `needs_changes` P0 verdict does not itself prevent
review-job completion: the stock predicate allows that disposition.

## P0 and installation follow-ups

P0 needs the recorded root-annihilator/almost-flatness proof, invariance under
almost elements and field-base comparison. Its Cohen/power-series/quotient/
normality/colimit suppliers need precise interfaces while reusing Mathlib's
regular-local predicate. Then state the two named tower results and their
faithful tests in Lean. The older broad audit remains unfinished. The reader
synchronization request itself is complete; do not restore its stale absence
claim or incorrect stage-zero Frobenius explanation.

The maintainer still installs the R5 prefix and its coverage/edges, deletes
the live Q4→A3 input and corrects the RS-05 record. Packet acceptance alone
does not install these graph changes. Excluded findings remain routed as in
the third-round fixes report.

All evidence needed to resume is in the report, existing packets and public
sources. No handoff depends on this run's disposable scratch files.

The P0 reader has inherited verbatim source quotations beside the P7 tower
contracts. Its owner must replace them with authored results and locators
under the manager's standing source rule. The reader is not an authorized
deliverable of this review, so it was not edited and no quotation was added
to this submission.
