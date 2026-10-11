# Handoff: REV-FIX-RT-AREA-padic-1~3

Codex, session `codex-lKSK2t`, 11 October 2026. Refs
[#5704](https://github.com/CBirkbeck/tauceti-explorer/issues/5704).
Input `a51b147164c4e9cd0643f8039a45f10f1b22423f`; branch `codex-lKSK2t-review-5704`.
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5704#issuecomment-6106723698).
One job claimed; no second job. None of the author fixes were mine.

**Blocked checkpoint.** The live assignment covers three packets and seven
outputs; the queue requires 23 packets and 47 outputs. The stated review is
already recorded, but another scoped review displaced its top-level verdicts
on two shared packets. There is no authorized in-scope repair. This run changes
only the review report and this handoff, preserving every packet, verdict,
history, suggested file and reader.

## Fresh verification

| Assignment | Live outputs / packets | Queue outputs / packets | Stock completion, live / queue |
| --- | --- | --- | --- |
| #5704 | 7 / 3 | 47 / 23 | false / false |
| #6519 | 7 / 3 | 31 / 15 | true / false |

Both live issue bodies were fetched anew. Their exact lists equal the
historical queues at `c69e5b6c9` and `888f12f5c9`, respectively. Every current
queue output exists. Restoring this job's archived verdicts only in memory
changes live completion from `[false, true]` to `[true, false]`; do not transfer
the failure by overwriting #6519's reviews.

The executable fixtures in the [report](../reviews/REV-FIX-RT-AREA-padic-1~3.md)
were rerun successfully. The generator fixture has 4/8 stock, 6/8 later-only
and 8/8 two-site passes. All ten assessment-bound history assertions pass.
They propose behavior in memory; no production code or queue was modified.
The candidate preserves the stock behavior for current reviews and rejects
unbound legacy histories. Its source-input and reader-input assessment
limitations still require a maintainer decision.

Stock blueprint checks of all three assigned packets report **zero errors
and zero warnings**, with the existing 316,811-record baseline declaration
index. Node counts: P0 326, AEG 153, ASII 537. The parsed packet objects
excluding only `review` and `reviewHistory`, and all three suggested files,
are identical to `331007b5e`. This is preservation evidence, not a new source
audit. No Lean compiler ran; previous successful elaborations remain
attributed to their original sessions. Intake file checks and whitespace
validation are recorded in the pull request.

## Preserved mathematical dispositions

- PerfectoidSpaces P0 remains `needs_changes`. General-base almost-category
  comparisons, Cohen/tower supplier interfaces and omitted named Lean tower
  signatures/tests remain explicit gaps.
- AdicEtaleGeometry retains its scoped acceptance for the constructed
  characteristic-p closed-immersion comparison and analytic restriction.
  Q4/RS-05 installation remains a maintainer action.
- AdicSpacesPartII retains its scoped acceptance of the pending 19-node
  sousperfectoid prefix. Stage creation, edge replacement, reparenting and
  coverage installation remain outstanding.

Every finding's disposition, excluded-owner handoff, source receipt, prior
review qualification and runnable fixture remains in the report. The
[previous handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/a51b147164c4e9cd0643f8039a45f10f1b22423f/research/blueprint/handoff/REV-FIX-RT-AREA-padic-1~3.md)
preserves all earlier checkpoint history. This concise replacement changes
no mathematical assessment and requires no disposable scratch files.

## Exact live outputs

1. `research/blueprint/reviews/REV-FIX-RT-AREA-padic-1~3.md`
2. `research/blueprint/packets/PerfectoidSpaces--P0.json`
3. `research/blueprint/packets/AdicEtaleGeometry.json`
4. `research/blueprint/packets/AdicSpacesPartII.json`
5. `research/blueprint/suggested/PerfectoidSpaces--P0.lean`
6. `research/blueprint/suggested/AdicEtaleGeometry.lean`
7. `research/blueprint/suggested/AdicSpacesPartII.lean`

The handoff itself is authorized by WORKERS.md. Queue, `make_queue.py`,
`issues.py` and generated prompt paths are outside the assignment and all fail
`intake.ALLOWED`. WORKERS.md says “Edit only the files the issue names, plus
your own scratch space.” No expanded scope is assumed.

## Resume at the maintainer repair

1. Restore both author and review scopes from the historical queues named in
   the report; preserve issued scopes and prerequisites during regeneration.
2. Retain each review's attribution for the content and scope it actually
   assessed. Use the report's guarded history candidate as a starting point,
   with an explicitly reviewed backfill policy and source/reader handling.
3. Regenerate twice; check stable outputs, prompts, prerequisites and runtime
   state. Verify #5704 and #6519 together before and after a later scoped review.
4. Provide the maintainer submission and issue-synchronization route for
   repair files excluded by intake. Workers must not change labels or close
   issues. Repeating the existing packet audit cannot repair dispatch.

No mathematical verdict was installed to force completion. A negative review
is completed review work; P0's `needs_changes` is not the administrative block.
