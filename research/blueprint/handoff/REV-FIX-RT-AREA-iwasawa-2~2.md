# REV-FIX-RT-AREA-iwasawa-2~2 — blocked checkpoint

Codex, session `codex-pQ6N1v`, 10 October 2026. Refs #6219.
[Confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6097730847).
Base `5cf3e3cc49802c9c4f3b0beee2e565dc34fc91b1` includes the full L3-2
review that merged during this run. One job claimed; no second job.

The [report](../reviews/REV-FIX-RT-AREA-iwasawa-2~2.md) records six bounded
finding verdicts, fresh public-source reads, pinned/current native contracts,
validation and the exact two uninstalled review records. Installed this
session's authorized L3 `accepted` and PMIA `needs_changes` receipts, archiving
both prior complete objects unchanged. No packet mathematics or Lean file
was changed. PMIA's negative review is complete; it does not cause the intake
scope failure. All gaps, requests, source issues and coverage remain unchanged.

## Correct scope before redispatch

The unchanged queue requires receipts in two packets the live issue omits.
[WORKERS.md](../WORKERS.md) says: “Edit only the files the issue names, plus your
own scratch space.” Explicit scope clarification was requested and has not
arrived. The real `issues.deliverables_complete(job)` is False. Replacing only
these two packets with the validated scratch proposals makes it True.
Do not change the queue, or repeatedly redispatch this unchanged issue.
Authorize these paths or correct the live issue's file list first:

1. `research/blueprint/packets/DirichletPadicLFunctions--L3-2.json`.
   Preserve the concurrently merged full review
   `independent-review-REV-DirichletPadicLFunctions--L3-2`, all 79 checked entries
   and its mathematical/Lean corrections. Archive the entire then-current
   top review unchanged before installing the report's bounded fix receipt,
   reviewer `independent-review-REV-FIX-RT-AREA-iwasawa-2~2`, with continuing
   reviewer attribution/date. The old E34 error is already repaired upstream;
   expand the Zhao antidifference locator's E37 to
   `DirichletPadicLFunctions/E37` if still needed. Keep the strict endpoint,
   normalization/uniqueness probe, differentiation probe and quartic test.
   Preserve all five gaps, eight requests and the source issue. Do not restore
   an older packet snapshot over this concurrent review.
2. `research/blueprint/packets/PadicHodgeRegulators--D.1.json`.
   Archive its entire current
   `independent-review-REV-PadicHodgeRegulators--D.1~2` review unchanged,
   including all 72 checked entries. Install the report's bounded fix receipt
   for the four D.2 consumers. Preserve seventeen source issues, nine gaps,
   twenty requests and eight planned stages. Do not imply a fresh complete
   regulator audit or construction of the proposed CS.0–CS.3 producers.
3. Run the four packet checkers and `intake.py check-files` for changed paths.
   Load this job from the unchanged queue, import `issues.py`, and require
   `deliverables_complete(job)` on the real checkout to be True before calling
   the job complete. No additional Lean edit is needed for these receipts.

All four packets and both proposals pass the checker with zero errors.
L3 has 26 inherited short-API warnings; the others have none. Sequential
`lean-check`: updated L3-2 has 111, D.1 307 and PMIA 1,075 proof-placeholder
warnings only. L3 stops at its unavailable repository-local `research` import
in the isolated shared build, before its body. No compile remains running.
Scratch is removed after PR opening; all resumption information is in the
report and this note. Packet prose should use “proof-placeholder warnings”.

## Separate PMIA revision

Retain `needs_changes`. Current Tau Ceti already supplies the four generic
higher-Fitting nodes and generic stable transpose comparison enumerated in
the report. Migrate those five nodes together with direct consumers, both
StableReduction requests, L4 comparison, reader and suggested interfaces.
Keep matrix/kernel and finite-projective scalar/range adapters, order
computations, and nonflat/deficient-relation/rank/nontriviality controls.
The reader is outside this review's live scope, so partial migration here
would leave inconsistent deliverables. No mathematical ownership moved.
