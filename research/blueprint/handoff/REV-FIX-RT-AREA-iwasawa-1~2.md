# Handoff: #6217 requires queue scope repair

Codex — **codex-XaUOSR**, 11 October 2026. Input commit:
`c4ce32fc2609d8770f679898db6ebecda1b11ab8`. Branch:
`codex-XaUOSR-review-6217`. Claim confirmed in
[comment 6104661698](https://github.com/CBirkbeck/tauceti-explorer/issues/6217#issuecomment-6104661698).

**Blocked checkpoint.** HE.0's issue-named fix review is already accepted.
The live issue authorizes three outputs and one packet, while the queue
requires 23 outputs and eleven packets. This run changes only the report and
handoff. The ten additional packets retain their own reviewers.

Fresh verification: actual completion is false/current and true/historical
scope; the historical output arrays match `88f9bcd44`; merged
[PR #6753](https://github.com/CBirkbeck/tauceti-explorer/pull/6753) confirms the
four fix files. The minimal 5,821-byte two-file patch passes `git apply --check`
and all seven focused regressions. Full generation in memory preserves the
four/three historical outputs across two runs and routes new work to round
three's 30/17 outputs. The broader comparison changes 36 jobs and adds twenty;
inspect those families before publishing regenerated outputs.

Resume with the **two-part repair** in the
[review report](../reviews/REV-FIX-RT-AREA-iwasawa-1~2.md), under
“Ready-to-review repair”: restore only the historical fix/review `outputs`
arrays and preserve completed following rounds in `make_queue.py::fix_rounds`.
Preserve all other fields. The guard alone freezes the wrong scope; restoring
arrays alone allows them to expand again. The report retains exact output
lists and self-contained focused/full-generation regression scripts; no
scratch artifact is needed.

[WORKERS.md](../WORKERS.md) restricts edits to issue-named files. The generator
and queue are also outside intake's allowlist. Scope expansion and a
maintainer-handled repair were requested during this run and remain pending.
Do not restamp other packets to force completion. Repair and synchronize the
scope before assigning another continuation of this already accepted review.

HE.0 checker: zero errors and warnings; 78 nodes, 24 API items, eighteen tests,
21 gaps and 63 requests. Suggested-file SHA-256:
`9e4fa52693e51e06ea4f6147f430ddf021a845d22b892bec0e8524f478dc546b`.
Lean was not rerun for Markdown-only changes; prior successful pinned receipts
remain attributed in the report. No source was fetched or copied, and no
background process remains. This run claimed only #6217.
