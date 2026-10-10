# Handoff: issue #6217 needs the tested queue-scope repair

Codex — **codex-kahzso**, 10 October 2026.
Branch: `codex-kahzso-review-6217`.
Input commit: `0d2178b78bf6a3deea5f4c16c2165442659a2a38`.
Claim confirmed in [comment 6099857101](https://github.com/CBirkbeck/tauceti-explorer/issues/6217#issuecomment-6099857101).

**Blocked checkpoint.** No second job was claimed. The issue-named HE.0 fix
review is already accepted; its packet, reader and suggested file are unchanged.
The live issue authorizes three outputs, while the checked-in queue requires
23. All files exist, but ten additional packets carry other review jobs'
verdicts. The real completion predicate is false for the queue job and true
for the issue's historical three-output scope.

Do not repeat the HE.0 mathematical review. Do not stamp the ten extra packets
without independently reviewing them. The prior mathematical-review verdicts,
source hashes and locators are preserved in the
[report](../reviews/REV-FIX-RT-AREA-iwasawa-1~2.md) and packet. This continuation
adds an executable, self-contained repair replay to the report, so no scratch
file is needed by the next worker.

## Concrete repair ready for the maintainer

1. Apply the report's three-line change to `make_queue.py::fix_rounds`: reuse a
   following round's historical job when its state is `done`, even when new
   blueprints have arrived. Keep the existing no-new-work branch as well.
2. Restore only the `outputs` lists of `FIX-RT-AREA-iwasawa-1~2` and
   `REV-FIX-RT-AREA-iwasawa-1~2` from commit `88f9bcd44`, the merge of PR #6753.
   The report includes both exact lists: four fix outputs, three review outputs.
   Preserve the current job states and other fields. Changing the guard alone
   preserves the already corrupted forty-output fix scope.
3. Check regeneration twice. With the present full-generator inputs, round two
   retains four/three outputs and round three receives thirty/seventeen.
   The isolated round-function replay using the expanded queue's blueprint list
   yields forty/twenty-three for round three instead. These are different input
   routings; do not hand-copy the isolated counts into the queue.
4. Inspect the broader regeneration. The shared guard changes 36 existing jobs
   and adds twenty entries (ten fix/review pairs), with no job removed. Other
   already corrupted historical scopes may also need recovery from their actual
   submissions. Publish matching issue bodies for any new fix/review rounds.
5. Verify this job's completion predicate after restoring its scope. Existing
   HE.0 review attribution already satisfies it. Newly routed work belongs to
   a separate round and is not done by this review.

## Evidence added in this run

The full-generator replay executes the actual routing and generation in memory,
with writes refused and its lock redirected into scratch. Original guard:
round two expands to 27 fix and fifteen review outputs. Repaired guard: round
two stays at four/three, and round three gets thirty/seventeen. The repaired
output lists are stable through a second complete generation.

The isolated replay executes the actual nested function. Original guard:
forty/twenty-three in round two; repaired guard: four/three in round two and
forty/twenty-three in round three. Its second generation is stable. A genuine
round-two `needs_changes` review still makes round three depend on that review;
newly available work alone makes it depend on the completed fix.

Fresh HE.0 checker run against the pinned declaration index: zero errors and
warnings (78 nodes, 24 API items, eighteen tests, 21 gaps and 63 requests).
No mathematical/source review is claimed for this administrative continuation.
No source file was fetched or reread. No Lean process was started. The unchanged
suggested-file hash is
`9e4fa52693e51e06ea4f6147f430ddf021a845d22b892bec0e8524f478dc546b`;
the report preserves the previous successful `lean-check` run (exit 0, 114
warnings, all `sorry`) and its attribution.

## Required authority

[WORKERS.md](../WORKERS.md) limits edits to issue-named files. The generator,
queue and regression tests are outside this issue's scope. Scope expansion
was requested and has not arrived. This submission changes only the report
and this handoff.

`intake.py::file_problems` also rejects generator and queue files as outside
swarm output paths. Apply the repair through a maintainer-handled change;
do not weaken intake or enlarge job outputs to bypass its checks. This
checkpoint's two Markdown files are allowed. The extra packet reviews remain
untouched. Scratch can be deleted once the pull request opens: the report
contains the patch, exact restoration lists, full replay and historical receipts.
