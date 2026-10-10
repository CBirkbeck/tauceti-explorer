# REV-FIX-RT-AREA-padic-1~3 handoff

Codex `codex-tGrBnk`, 10 October 2026; issue #5704; base
`06bdf5afcf3a17691f3047d4244381ff708a77ed`.
Bot confirmation: [claim reply](https://github.com/CBirkbeck/tauceti-explorer/issues/5704#issuecomment-6093131025).
One job claimed; no second job.

## Submission and blocker

Blocked checkpoint, retained as a draft PR for the maintainer. The original
three-packet review is already complete: PerfectoidSpaces P0 needs_changes;
AdicEtaleGeometry and AdicSpacesPartII accepted for their scoped corrections.
No packet verdict, mathematical contract or suggested file changed.

The issue assigns seven outputs covering three packets. The queue requires
47 outputs covering 23 packets. All outputs exist, but the twenty additional
packets have other jobs' review verdicts. Stock completion is true for the
issue scope and false for the queue. Queue/generator edits are outside the
assignment and fail intake's file allowlist. Expanded scope was requested;
no authorization is assumed.

The draft keeps the submission available for the maintainer instead of
triggering another automatic checkpoint merge and release of the same review.
Workers must not change labels, assign this reviewer to other packets, or
repeat the completed mathematical review to address this scope mismatch.

## New evidence and immediate repair

The [review report](../reviews/REV-FIX-RT-AREA-padic-1~3.md) now contains a
self-contained, runnable simulation of the complete generator with every
write disabled. No continuation needs this run's disposable scratch files.

**A queue-only repair is sufficient for this job.** Restore the `outputs`
arrays for both `FIX-RT-AREA-padic-1~3` and `REV-FIX-RT-AREA-padic-1~3` from
historical queue commit `c69e5b6c9`, retaining current runtime metadata. They
have ten author outputs and seven review outputs, respectively. The report
names their exact contents. With those arrays, two full **stock** generator
passes preserve both scopes, and stock completion/transition recognizes the
review as done. Use a maintainer submission route to install that repair,
verify the two job entries/prompts, and run ordinary intake/synchronization.

The broader two-site generator candidate also preserves the scopes across
two full passes, with 5,111 jobs per pass and runtime fields retained for
4,423 existing jobs. However it affects 21 other existing fix scopes compared
with stock. Both approaches create `FIX-RT-AREA-padic-1~4` for remaining owner
work after restoring round three. Published/unpublished scope policy, new
owner allocation and revision limits therefore need a separate maintainer
decision. Do not require that broader policy change to finish this review.
The eight inherited focused regressions still pass for the candidate; they
remain in the report alongside the fuller evidence.

## Verification and preserved mathematics

Fresh stock packet checks: zero errors and warnings for P0 (326 nodes),
AdicEtaleGeometry (153), and AdicSpacesPartII (537). No suggested file changed;
Lean was not rerun. Prior successful native elaborations remain the earlier
workers' evidence, including the qualification that omitted P7 signatures
are not checked by compiling the file.

P0 still needs the root-annihilator/almost-flatness identification, invariance
under almost elements and comparison with the field-base category. Its
Cohen/power-series/quotient/normality/colimit suppliers need precise interfaces
that reuse Mathlib's regular-local predicate. Then both P7 tower results and
faithful negative tests need actual Lean signatures. The older broad P0
baseline/source/dependency/API/test/planet audit remains unfinished.

The maintainer must install the R5 prefix with coverage and outgoing edges,
delete the live Q4-to-A3 input and correct the RS-05 decision record. The
third-round reader synchronization is complete; retain the corrected
stage-zero valuation explanation. The original finding table and
excluded-owner dispositions remain in the report and fixes-3 document.

P0's reader also has inherited verbatim quotations near the P7 contracts.
Its owner must replace them with authored statements and locators under the
standing source rule. That reader is outside this review's deliverables.
This run adds no source passage and modifies no reader.
