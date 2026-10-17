# Handoff: reconcile #6217 scope before another review

Refs #6217. Job `REV-FIX-RT-AREA-iwasawa-1~2`.
Codex — **codex-xnTg4o**, 17 October 2026.
Branch: `codex-xnTg4o-review-iwasawa-fixes`.
Input: `c844b396e21e1fa45d3ee5127b777294f9deb8eb`.
[Bot confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/6217#issuecomment-6241476191).
This run claimed only this job. Submission: **blocked checkpoint**.

## Done

Reread the live issue after confirmation; read the four applicable findings,
verification and round-two fix report; reproduced the current mismatch with
both the local and fresh live-main queue using the real completion function.
All outputs exist. The queue requires 21 outputs: ten packets and their Lean
files plus the report. The issued review permits only HE.0 and its Lean file
plus the report. Completion is false for the queue and true with the issued
three outputs substituted in memory.

The unchanged HE.0 checker passes with zero errors and warnings: 78 nodes,
24 API items, eighteen tests, thirteen baseline declarations, 21 gaps,
63 requests and eight planned stages. Its accepted fix verdict and attributed
source/Lean receipts are untouched. No fresh mathematical audit or Lean
compilation was performed for this documentation-only checkpoint.

## Exact current extra scope

The queue requires this review's verdict on these **nine additional packets**,
all under `research/blueprint/packets/`, and names their corresponding
`research/blueprint/suggested/*.lean` files as outputs:

- `HeegnerPointEulerSystems--HE.8c.json`
- `HeegnerPointEulerSystems--HE.8.json`
- `GrossZagierAndArithmeticHeights.json`
- `HeightsRationalPointsAndObstructions.json`
- `RankZeroOneBSD--BSD.0.json`
- `HeegnerPointEulerSystems--HE.8b.json`
- `EulerSystemsAndKolyvaginSystems.json`
- `SelmerIwasawaCohomology.json`
- `KatoEulerSystems.json`

These replace the prior handoff's obsolete ten-packet list. The Euler-system
packet still has `needs_changes`; the others have their own accepted reviews.
None has been stamped with an unperformed fix review.

## What must happen next

Reconcile issue #6217, the queue's output arrays and generated instructions
before redispatch. Either restore the issued review's three outputs and
round-two fix's four outputs (historical arrays at `88f9bcd44`) and give the
additional work a subsequent round, or publish and authorize the expanded
scope with the actual fixes to review. Preserving issued rounds in
`fix_rounds` alone cannot undo already-expanded arrays. Its wider scheduling
effects need maintainer inspection.

WORKERS.md restricts edits to issue-named files; current intake also rejects
queue.json and make_queue.py as outside swarm output paths. A scope question
was sent during this run and has not received authorization. This is a scope
blocker, not an automatic approval-review rejection.

The [current report](../reviews/REV-FIX-RT-AREA-iwasawa-1~2.md) contains current
packet reviewer markers and a standalone read-only reproducer. The
[report at 508e89592](https://github.com/CBirkbeck/tauceti-explorer/blob/508e89592/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-1~2.md)
preserves mathematical review arguments, source locators, historical repair
patch and regression experiments. Its packet lists, line numbers and replay
counts are historical, not fresh verification. No deleted scratch artifact
is needed to resume.

Only the report and this handoff change. The packet, suggested file, queue
and generator remain untouched. No background process remains.
