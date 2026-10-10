# REV-FIX-RT-AREA-padic-1~3 handoff

Codex `codex-0zxhBp`, 10 October 2026; issue #5704; base
`8a53daaaae8b929368fd89963c6b220443fcb164`. Bot confirmation: comment
6092606975. One job claimed; no second job.

## Current blocker verification

Fresh stock completion checks are true for the live issue's seven paths and
false for the queue's 47. All 47 files exist; the failure comes from the 20
additional packets' different reviewers. Intake uses the queue job after
merge, so a PR description cannot override this result. Queue and generator
paths are outside both the issue's scope and intake's allowlist.

Fresh stock packet checks pass with zero errors/warnings (326, 153 and 537
nodes). No packet or suggested file changed; Lean was not rerun. No new
mathematical or source-audit verdict is claimed. Scope reconciliation was
requested; no response or authorization has been received.

This submission is a blocked checkpoint. The manager should keep #5704 out
of available selection until the scope is reconciled, because automatic
checkpoint intake releases this same blocked assignment again. Workers must
not change labels or repeat the completed mathematical review. The next
useful action is the maintainer repair described below.

## Done and preserved

The issue's original three-packet review was completed by the preceding
workers: PerfectoidSpaces P0 needs_changes; AdicEtaleGeometry and
AdicSpacesPartII accepted for their scoped corrections. Their current verdicts,
review histories, source evidence and mathematical qualifications are unchanged.
The [review report](../reviews/REV-FIX-RT-AREA-padic-1~3.md) preserves their work
and retains the preceding run's complete, runnable regression fixture.

Fresh stock packet checks report zero errors and zero warnings for all three
issue-named packets. No suggested file changed; Lean was not rerun. Earlier
successful sequential `lean-check` results remain the preceding sessions'
evidence, not fresh evidence from this run. Only the report and this handoff
changed. No new mathematical verdict or source audit is claimed.

## Blocker and required next action

The issue authorizes seven deliverables, while the queue requires 47, including
20 additional packets. The stock completion predicate is true for the issue's
original scope and false for the current queue. An honest needs_changes review
counts as a completed review; P0's verdict is not the blocker.

At author merge `c69e5b6c9` (#6883), the fix had ten outputs covering three
packets, and its review had seven outputs covering those same packets. The
current fix has 78 outputs covering 23 packets. Historical output lists can be
read directly from that commit; no continuation needs this run's scratch files.

WORKERS.md says to edit only the issue's named files and the handoff. Queue,
generator, tests and prompts are outside scope, and intake excludes generator
and queue paths from its allowlist. A scope question was sent this run. No
response or repair authorization is assumed. This is a blocked checkpoint.
The next action belongs to a maintainer scope repair or an explicitly
expanded assignment with an appropriate submission route. Another worker
should not repeat the completed three-packet review while this mismatch remains.

Restore these exact seven review deliverables:

- `research/blueprint/reviews/REV-FIX-RT-AREA-padic-1~3.md`
- `research/blueprint/packets/PerfectoidSpaces--P0.json`
- `research/blueprint/packets/AdicEtaleGeometry.json`
- `research/blueprint/packets/AdicSpacesPartII.json`
- `research/blueprint/suggested/PerfectoidSpaces--P0.lean`
- `research/blueprint/suggested/AdicEtaleGeometry.lean`
- `research/blueprint/suggested/AdicSpacesPartII.lean`

Restore the author round's ten deliverables too: its fixes-3 report and the
packet, reader and suggested file of each of these same three owners. A review
scope edit alone will be undone when regeneration derives it from the expanded
author scope. Preserve historical runtime state and independent-review history;
do not rename the twenty excluded packets' reviewers to satisfy the predicate.

## New regression evidence

The preceding later-round candidate leaves a second mutation path open: an
existing first round retains its original outputs only when its state is done.
Both a claimed first round (external) and a pending first round expand when a
new owner becomes available. The report's two-site candidate preserves existing
first-round outputs and unconditionally reuses existing later rounds. It also
prevents a send-back from rewriting an existing later round's `after`.

Eight read-only AST fixtures pass for that candidate: claimed/pending/finished
first rounds; a later round with a new owner; an existing later round with a
send-back; new-round creation for a new owner and for a send-back; and an
existing third round. The fixture checks author/reviewer prompt and path
agreement and the relevant prerequisites. The stock function fails four
expectations; the previous later-round-only candidate fails two.

The runnable fixture and exact candidate changes are in the review report.
The preceding session tested them in memory; they are not applied to the
repository and do not certify full regeneration. A maintainer must decide how unpublished pending jobs are
identified before permitting their scope to change; pending state alone does
not establish that an issue was never published.

Repair acceptance conditions:

1. Restore the original author/review scopes from the historical queue.
2. Preserve already published first and later assignments as owners become
   available or previous reviews send work back.
3. Retain correct creation and prerequisites of genuinely new rounds; allocate
   additional owner work through explicitly scoped jobs.
4. Regenerate twice and verify stable scopes, consistent prompts, preserved
   runtime state, and the completed-review predicate for #5704.
5. Check intake/issue synchronization through a maintainer-approved route.

## Preserved mathematical follow-ups

P0 still needs its root-annihilator/almost-flatness proof, invariance under
almost elements and comparison with the field-base category. Its Cohen,
power-series, quotient, normality and colimit suppliers need precise interfaces,
reusing Mathlib's regular-local predicate. Then state the two P7 tower results
and faithful tests as actual Lean signatures. Its older broad audit remains
unfinished. The third-round reader synchronization itself is complete; do not
restore stale absence claims or the incorrect stage-zero Frobenius explanation.

The maintainer still needs to install the R5 prefix and coverage/edges, delete
the live Q4 to A3 input, and correct the RS-05 record. Packet acceptance alone
does not install those graph changes. The report and fixes-3 document retain
every original finding's disposition and excluded-owner handoff.

The excluded packet owners in the broadened queue are:
PerfectoidQuotients; PerfectoidShimuraVarieties; PerfectoidSpaces--P8;
DiamondsAndVStacks; GeometricSatakeAndFusion--GS0;
RelativeFarguesFontaine--RF0; HodgeTateAndCanonicalSubgroups--T6;
FarguesFontaineDiamonds; DiamondEtaleCohomology--C0; DiamondSixOperations;
AInfCohomology--AI.0; RelativeFarguesFontaine--RF4;
VectorBundlesAndIsocrystals--VB0; VectorBundlesAndIsocrystals--VB3;
HodgeTateAndCanonicalSubgroups--T0; CohomologyComparisons;
IgusaVarietiesAndTorsionConcentration; AlgebraicModularFormsAndSerreWeights;
HilbertModularVarietiesAndShimuraCurves--H0; ShimuraCompactifications--C6.
No excluded owner was edited or reviewed by this continuation.

P0's reader has inherited verbatim source quotations near its P7 contracts.
Its owner must replace them with authored statements and locators under the
standing source rule. The reader is outside this review's authorized files;
this run adds no source quotation and makes no reader edit.
