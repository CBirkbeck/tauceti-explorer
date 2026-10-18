# Handoff: reconcile #6217 before redispatch

Refs #6217. Job `REV-FIX-RT-AREA-iwasawa-1~2`.
Codex — **codex-Qlg6kx**, 18 October 2026.
Branch: `codex-Qlg6kx-review-iwasawa-fixes`.
Input: `663b4462fd0c660392965ef07632adc8164990de`.
[Bot confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/6217#issuecomment-6256246938).
This run holds only this job's confirmed claim. Submission: **blocked checkpoint**.

The published assignment permits the HE.0 packet, its suggested file and the
review report. That fix review is already accepted. Both local and fresh
live-main queue entries require 21 outputs: ten packets, their suggested files
and the report. All outputs exist. Fresh execution of the actual completion
function returns false for that entry and true with just the three issued
paths substituted in memory. The previous checkpoint's blocker persists.

The nine additional packets are:

- `HeegnerPointEulerSystems--HE.8c.json`
- `HeegnerPointEulerSystems--HE.8.json`
- `GrossZagierAndArithmeticHeights.json`
- `HeightsRationalPointsAndObstructions.json`
- `RankZeroOneBSD--BSD.0.json`
- `HeegnerPointEulerSystems--HE.8b.json`
- `EulerSystemsAndKolyvaginSystems.json`
- `SelmerIwasawaCohomology.json`
- `KatoEulerSystems.json`

They retain their own independent reviewers. The Kato marker now names
`independent-review-REV-FIX-RT-AREA-iwasawa-3~4` and is accepted; this supersedes
the historical report's Kato row. The Euler-system packet still has
`needs_changes`. No unperformed fix review has been stamped onto any packet.

I reread the issued instructions, prior handoff/report, the four applicable
confirmed findings and verifier decisions, and the round-two fix report.
The unchanged HE.0 checker passes with zero errors and warnings: 78 nodes,
24 API items, 18 tests, 13 baseline declarations, 21 gaps, 63 requests and
eight planned stages. Primary sources were not reread and Lean was not rerun
for this documentation-only checkpoint. Existing mathematical and compilation
receipts keep their original attribution.

A scope question was submitted to the user. Until answered, WORKERS.md's
issue-path restriction remains in force. Fresh checks also show that intake
rejects queue.json and make_queue.py as outside swarm output paths. This is
an assignment conflict, not an automatic approval-review rejection.

Resume after one consistent assignment is published:

1. Restore the issued review's three outputs and round-two fix's four outputs,
   preserve issued rounds in the generator, and assign additional work to a
   distinct subsequent round; or
2. Authorize the expanded scope and identify the actual fixes to review in
   each additional packet.

The generator's conditional preservation of existing rounds remains at
`fix_rounds`; preserving already-expanded arrays alone cannot repair the
current scope. The [report](../reviews/REV-FIX-RT-AREA-iwasawa-1~2.md) retains the
prior detailed diagnosis and standalone read-only reproducer, with a fresh
18 October section. Historical mathematical arguments and repair experiments
remain linked there. No scratch artifact is needed to resume.

Only this handoff and the report change. No mathematical verdict, Lean file,
queue, generator, application code or promoted data changes. No process is
left running. This run will stop after opening its checkpoint pull request.
