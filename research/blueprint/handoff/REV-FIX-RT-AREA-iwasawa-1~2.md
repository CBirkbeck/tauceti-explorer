# Handoff: #6217 completion blocked by issue/queue scope mismatch

Codex — **codex-QVUktl**, 10 October 2026.
Branch: `codex-QVUktl-review-6217`.
Input commit: `a3279f24dc57c6b98c8594d730aea3d20385470d`.
Claim confirmed in [comment 6100519267](https://github.com/CBirkbeck/tauceti-explorer/issues/6217#issuecomment-6100519267).
**Blocked checkpoint.** This session claimed only #6217.

The issue's HE.0 mathematical fix review is accepted and unchanged. Completion
remains false because the issue names one packet and three outputs while the
queue requires eleven packets and 23 outputs. Ten extra packets retain other
jobs' reviewer markers. No new mathematical verdict was added.

The [review report](../reviews/REV-FIX-RT-AREA-iwasawa-1~2.md) preserves the
exact guard, historical four/three output lists and two self-contained
regression scripts. Restore only `outputs` of `FIX-RT-AREA-iwasawa-1~2` and
`REV-FIX-RT-AREA-iwasawa-1~2` from `88f9bcd44` (PR #6753), preserving all
other fields, then apply the guard in `make_queue.py::fix_rounds`. The live
PR's four-file list and canonical merge commit
`05036608ddb23c6603c1d2721487d87027616106` confirm that original scope.
The guard alone would preserve the already incorrect expanded output lists.

Fresh checks reproduce the seven passing focused cases and the full generator
replay. Restoring the output lists makes the actual completion predicate true.
Two full generations preserve round two's four/three outputs and assign thirty/
seventeen to round three. The broader in-memory comparison changes 36 jobs,
adds twenty and removes none. Inspect that routing before publishing new rounds.
No generator, queue, prompt, synchronization or promotion output was written.

WORKERS.md restricts edits to issue-named files, and `intake.file_problems`
rejects the two repair paths. Scope expansion and a maintainer-handled PR were
requested and remain pending. The maintainer must apply the repair or expand
and reconcile the live issue's scope. Do not replace other packets' reviewer
markers, alter intake, or repeat the HE.0 review to force completion.

HE.0 validation: zero errors and warnings; 78 nodes, 24 API items, eighteen
tests, 21 gaps and 63 requests. Its Lean file is unchanged, SHA-256
`9e4fa52693e51e06ea4f6147f430ddf021a845d22b892bec0e8524f478dc546b`.
Lean was not rerun; the preserved prior receipt reports exit 0 with 114
warnings, all admissions. No Lean process remains. All resumption instructions
are in the report, so no scratch artifact is needed.
