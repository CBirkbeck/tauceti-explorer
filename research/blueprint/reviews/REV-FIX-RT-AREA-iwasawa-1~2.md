# Review #6217: tested scheduling repair awaiting a scope decision

Refs #6217. Job `REV-FIX-RT-AREA-iwasawa-1~2`.
Codex — **codex-O9Ld0I**, 19 October 2026.
Input commit: `76759b9a5dfee0c94b309d597c4515bc9a0bdd65`.
[The bot confirmed this claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6217#issuecomment-6257699351),
identifying claim comment 6257698088. This session authored none of the fixes.

**Blocked checkpoint.** The published assignment permits one packet, whose
fix review is already accepted. The completion rule requires this job's
verdict on ten packets. This session prepared and tested a concrete repair
in scratch, including a full queue-generator replay and its wider scheduling
effects. It has not applied that repair: neither the queue nor its generator
is an issue deliverable. A scope decision was requested; none had arrived
when this checkpoint was prepared.

No mathematical statement, review marker, Lean signature or scheduling file
changes. The packet's existing acceptance and source receipts retain their
original attribution. This report does not certify the nine additional packets.

## Current assignment and completion evidence

I reread the full live issue after the claim confirmation. Its three outputs
remain this report, `packets/HeegnerPointEulerSystems--HE.0.json` and
`suggested/HeegnerPointEulerSystems--HE.0.lean`, relative to
`research/blueprint/`.

The local queue and a fresh read of main agree on both affected output arrays:

| Record | Queue outputs | Originally issued outputs |
| --- | ---: | ---: |
| `FIX-RT-AREA-iwasawa-1~2` | 35 | 4 |
| `REV-FIX-RT-AREA-iwasawa-1~2` | 21 | 3 |

All 21 review outputs exist. The actual `issues.deliverables_complete`
returns **false** for the current review record and **true** for an in-memory
copy restricted to the three issue-named paths. Restoring a review marker on
HE.0 cannot address the other nine required markers. The original four/three
output arrays can be recovered exactly from queue commit `88f9bcd44`.

## Existing mathematical verdict and fresh checks

The accepted HE.0 fix review covers these four findings. These are the
preserved historical outcomes, not new source verifications by this session:

| Finding | Existing verdict and its limit |
| --- | --- |
| /2, level raising | Accepted: the exact-level raising theorem has an explicit supplier request; rational Jacquet–Langlands and integral transports have separate contracts. |
| /8, Zhang inputs | Accepted: exact rank-zero, period and transfer contracts, with the HE.6z split proposed to separate Zhang's branch from clean descent. |
| /9, open images | Accepted: HE.7 retains the Heegner application and imports the general image theory from its designated Part II owner. |
| /10, Howard systems | Accepted: ES.5 owns the self-dual hypotheses and DVR bound, ES.8 the Λ-adic result, and the primitivity equality has its additional hypotheses and supplier contract. |

The complete source arguments and receipts remain in the
[mathematical report at commit 508e89592](https://github.com/CBirkbeck/tauceti-explorer/blob/508e89592/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-1~2.md),
the packet's attributed review/history and source-issue records, and
[the second-round fixes](https://github.com/CBirkbeck/tauceti-explorer/pull/6753).
The [preceding checkpoint report](https://github.com/CBirkbeck/tauceti-explorer/blob/76759b9a5dfee0c94b309d597c4515bc9a0bdd65/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-1~2.md)
preserves the intervening sessions' attribution and administrative checks.
Primary mathematical sources were not reread in this session.

Fresh validation of the unchanged assigned packet:

- `python3 scripts/check_blueprint.py research/blueprint/packets/HeegnerPointEulerSystems--HE.0.json`:
  zero errors and warnings; 78 nodes, 24 API items, 18 tests, 13 baseline
  declarations, 21 gaps, 63 requests, eight planned stages.
- The packet's source issues pass `source_issues.check_issues` with its
  roadmap id, and `check_errata.versions_checked` reports no errors. The
  standalone errata-file CLI is not a packet validator.
- After checking memory availability, `lean-check` on the issue's suggested
  file exits **0**, with **114** warnings, all `declaration uses sorry`.
  No other warnings or errors occur. This fresh elaboration does not prove
  its admitted statements or close the packet's gaps.

## Concrete repair, tested without changing the repository

The repair candidate has two parts:

1. Restore only the two affected queue records' `outputs` arrays from commit
   `88f9bcd44`. The fix then has its report, HE.0 packet, reader and suggested
   file; the review has its report, HE.0 packet and suggested file. Do not
   replace the whole historical queue or change job states.
2. In `make_queue.py`, inside `fix_rounds`, replace:

   ```python
   made = previous_jobs.get(following) if following in states and not (missing or sent_back) else None
   ```

   with:

   ```python
   made = previous_jobs.get(following)
   ```

The current condition reconstructs an existing round when new blueprints
appear or its predecessor was sent back. This expands its scope after its
issue was published. Selecting the existing round preserves its output list;
the loop still discovers a subsequent round for the missing work.

### Full generator replay

I executed `make_queue.main` twice against the actual repository inputs and
an in-memory queue with the two restored arrays: once with the current
selector, once with the candidate selector. All repository writes and
`mkdir` calls were intercepted, and the queue lock was redirected to scratch.
The dry-run return was instrumented to expose the actual generated `merged`
queue and prompts. Source discovery, templates, routing, dependencies and
state preservation ran normally. This goes beyond the preceding checkpoint's
isolated `fix_rounds` experiment.

| Replay | Generated jobs | Fix-round-two outputs | Review-round-two outputs |
| --- | ---: | ---: | ---: |
| Current selector, restored input arrays | 6,230 | 31 | 17 |
| Candidate selector, restored input arrays | 6,252 | 4 | 3 |

Assertions verified exact equality of the candidate's two output arrays with
the issued historical arrays. The current selector again discards those
arrays; restoring only `queue.json` is therefore insufficient.

The candidate generates `FIX-RT-AREA-iwasawa-1~3` after round two, with 34
outputs, and its independent review with 19 outputs. This new round includes
HE.0 as well as additional inputs returned by current source discovery; it
is not a claim that it is the issue's present nine-extra-packet assignment.
The maintainer must review and publish the newly generated instructions.

The selector change also affects **48 existing generated records** (24
fix/review pairs) and adds **22 jobs** (11 fix/review pairs), relative to the
unmodified-selector replay. It removes no job. Those wider effects were
measured, not applied or approved. Neither replay's entire generated queue
should replace main merely to repair this issue.

I also loaded the candidate module in memory and ran `test_redteam_queue`,
`test_issues` and `test_followups`: **59 tests run, one skipped, no failures**.
These existing tests and the generator assertions support scope preservation;
they do not certify the mathematical correctness of the generated work or all
interactions of the wider queue.

## Required maintainer action

[WORKERS.md](../WORKERS.md), “Doing the work”, says: “Edit only the files the
issue names, plus your own scratch space.” Neither `queue.json` nor
`make_queue.py` is named. The intake's `file_problems` also categorizes these
as outside swarm output paths. This is an existing scope restriction, not an
automatic approval-review rejection. No expanded scope or repair permission
was inferred from elapsed time.

Before redispatch, authorize and apply a scheduling repair with the wider
round effects reviewed, then reconcile published issue instructions with the
resulting queue. Alternatively publish an expanded mathematical review
assignment that identifies the additional fixes to review. Until then,
repeating the accepted HE.0 review cannot complete this queue record.

The scratch replay files are disposable. The exact array provenance,
selector edit, test modules, instrumentation and measured limits above are
sufficient to reproduce the candidate; no source text or scratch artifact
needs to be retained. No process is left running.
