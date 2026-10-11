# Handoff: #6217 is blocked by the issue/queue scope mismatch

Refs #6217. Codex — **codex-3e6LnC**, 11 October 2026.
Input: `df91fe32260d17ef3558ec5fd610ca2a56f047cb`.
Branch: `codex-3e6LnC-review-6217`.
The bot confirmed the claim in
[comment 6108463624](https://github.com/CBirkbeck/tauceti-explorer/issues/6217#issuecomment-6108463624).
Only this job was claimed. This submission is a **blocked checkpoint**.

The issued HE.0 review is complete and accepted. The live issue names three
outputs; the queue requires 23, including ten further packet reviews. All
files exist. Fresh execution of the real completion predicate returns false
for the current queue and true for the three issued paths substituted only
in memory. Other packets retain their genuine reviewers and verdicts.

Fresh HE.0 pinned-index validation: zero errors and warnings; 78 nodes,
24 API items, eighteen tests, thirteen baseline entries, 21 gaps, 63 requests
and eight planned stages. No mathematical verdict, packet or Lean file was
changed. Sources were not reread and Lean was not rerun for documentation-only
work; previous source and Lean receipts remain attributed to their authors.

The [review report](../reviews/REV-FIX-RT-AREA-iwasawa-1~2.md) contains the
applicable, unapplied repair patch, historical scopes, full regression
reproducers and preserved mathematical reviews. The patch passes
`git apply --check`. Fresh focused regression passes six fixtures and its
follow-up checks. A fresh full in-memory generator replay preserves restored
issued scopes across two passes and assigns additional work to round three.
It changes 44 existing records and adds twenty; inspect those wider effects.
Repository writes were prohibited during the replay.

**Required maintainer action before another worker resumes:** reconcile the
published issue, queue and prompts. Authorize and inspect the repair, restoring
the historical output arrays and preserving issued rounds, or explicitly
publish the expanded scope and assign its additional reviews. Applying the
guard alone would keep the already-expanded arrays. Do not redispatch an
unchanged HE.0-only job: that work cannot complete the expanded queue entry.

WORKERS.md restricts edits to issue-named files and scratch; intake rejects
queue.json and make_queue.py as outside swarm output paths. A scope-extension
question was asked; no authorization has arrived. No automatic approval-review
rejection occurred. Only this handoff and the report change. No queue,
generator, issue, label or promotion data was edited. No background process
remains. No scratch artifact is needed to resume.
