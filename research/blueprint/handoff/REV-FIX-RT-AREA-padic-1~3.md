# REV-FIX-RT-AREA-padic-1~3 handoff

## Current checkpoint: scope reconciliation required

Codex `codex-I2abtS`, 10 October 2026; issue #5704; base `91df8604a`.
Claim confirmed by the bot. Continued this one job only. The preceding
three-packet review is finished; its verdicts and mathematical evidence are
preserved. No new mathematical verdict or Lean compilation is claimed.

This continuation identifies additional evidence for the scope blocker:
at author merge `c69e5b6c9` (#6883), the fix has 10 outputs with three packets
and the review has seven outputs with three packets. The current fix has
78 outputs with 23 packets; the review has 47 outputs with 23 packets.
The report explains the generator paths that can broaden later rounds while
preserving their runtime state. The precise first broadening invocation is
not established.

The stock completion predicate returns false for the current queue and true
for a copy whose outputs match the issue. No file was modified to obtain
either result. Three fresh packet checks report zero errors and zero warnings
with the configured declaration index present. Lean was not rerun because no
suggested declaration changed and the preceding checkpoint already records
successful elaboration. Only this handoff and the review report changed.
Intake checks report two files and zero problems; `git diff --check` passes.

### Concrete maintainer action

Reconcile the queue, generator and issue before assigning another continuation.
For the original scoped review, the exact output list is:

- `research/blueprint/reviews/REV-FIX-RT-AREA-padic-1~3.md`
- `research/blueprint/packets/PerfectoidSpaces--P0.json`
- `research/blueprint/packets/AdicEtaleGeometry.json`
- `research/blueprint/packets/AdicSpacesPartII.json`
- `research/blueprint/suggested/PerfectoidSpaces--P0.lean`
- `research/blueprint/suggested/AdicEtaleGeometry.lean`
- `research/blueprint/suggested/AdicSpacesPartII.lean`

Preserve the author round's original three-packet scope too: its ten outputs
are the fixes-3 report plus the packet, reader and suggested file for each of
these three owners. `make_queue.py`'s `fix_rounds` derives review outputs from
the fix outputs, and its later-round selection can recompute old outputs when
new blueprints become available or an earlier review sends work back. Its
final queue merge does not retain historical outputs. A manual queue edit
alone therefore needs a regeneration check. This run does not authorize or
apply a generator change.

If the intended scope is instead the additional 20 packets, update the issue
explicitly and allocate their actual owner-fix and independent-review work.
Do not rename other jobs' verdicts. The preceding handoff below lists those
owners and the remaining mathematical work.

The scope question remains unanswered at submission. No additional review is
assumed authorized. This checkpoint should lead to metadata reconciliation;
another worker should not repeat the completed scoped review. All diagnostic
evidence is in the committed report and repository history. Nothing needed
for continuation depends on disposable scratch files.

## Previous continuation (preserved)

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
