# Handoff: #6217 remains blocked by completed-round scope expansion

Codex — **codex-EDD1Xo**, 10 October 2026.
Branch: `codex-EDD1Xo-review-6217`.
Input commit: `a88313a4145831859fa4e61e0761d3f0ac86bc2c`.
Claim confirmed in [comment 6100074571](https://github.com/CBirkbeck/tauceti-explorer/issues/6217#issuecomment-6100074571).

**Blocked checkpoint.** This run claimed only #6217. The HE.0 mathematical
fix review is already accepted by this review job; no new mathematical review
or source reading is claimed. The issue authorizes three outputs, while the
queue requires 23. All files exist, but ten additional packets have other
jobs' verdicts. The actual completion predicate is false for that queue scope
and true for the issue's historical scope.

## What this run added

The [report](../reviews/REV-FIX-RT-AREA-iwasawa-1~2.md) now includes a standalone
focused regression script using the actual `fix_rounds` AST. It verifies the
original bug, completed-round preservation, routing of new work, stability
through a second generation, continued expansion of unfinished rounds, genuine
send-back dependencies, and preservation of historical rejection dependencies.
All cases pass. The full-generator replay was independently rerun: old guard
27/15 round-two outputs; repaired guard four/three, then 30/17 for round three;
the second repaired generation is stable. Its wider effect remains 36 existing
jobs changed, twenty added and none removed, all in memory.

A minimal 5,821-byte patch was prepared in scratch: the generator guard and only
the two historical output lists, with original queue formatting preserved. The
report contains the exact repair and both reproducible scripts, so nothing in
scratch is required to resume. Restoring those lists makes the real completion
predicate true without changing any packet's review attribution.

## Resume here: maintainer scope repair

1. Restore only `outputs` of `FIX-RT-AREA-iwasawa-1~2` and
   `REV-FIX-RT-AREA-iwasawa-1~2` from `88f9bcd44` (PR #6753). Preserve states
   and other fields. The report gives the exact four/three lists.
2. Apply the report's guard change in `make_queue.py::fix_rounds`: preserve a
   following completed historical round when new blueprints arrive. The guard
   alone would freeze the already incorrect forty-output scope.
3. Verify completion and two regeneration passes. Inspect new routing and the
   shared guard's wider effect. Other corrupted historical rounds need their
   own actual submission scopes recovered, not arbitrary reductions.
4. Publish matching issue instructions for additional fix/review rounds. Round
   three receives newly available work; it does not belong to this review.

Do not repeat the HE.0 mathematical review or replace ten other review markers.
No worker-only deliverable edit resolves this administrative mismatch.

## Authority and validation

Scope expansion for the concrete repair was requested during this run but had
not arrived at submission. [WORKERS.md](../WORKERS.md) limits edits to
issue-named files. `intake.py::file_problems` also excludes generator and queue
paths, so applying the repair needs maintainer handling; no allowlist bypass or
out-of-scope submission was attempted. This checkpoint edits only report/handoff.

Fresh HE.0 packet validation: zero errors and warnings (78 nodes, 24 API items,
eighteen tests, 21 gaps, 63 requests). The packet and suggested file are unchanged.
Suggested SHA-256:
`9e4fa52693e51e06ea4f6147f430ddf021a845d22b892bec0e8524f478dc546b`.
No Lean process started; the report preserves the earlier successful exact-pin
`lean-check` receipt (exit 0, 114 warnings, all `sorry`) and its attribution.
No public source was downloaded and no cleared source was read or copied.
Scratch can be removed after opening the PR: every needed repair and regression
instruction is in the report.
