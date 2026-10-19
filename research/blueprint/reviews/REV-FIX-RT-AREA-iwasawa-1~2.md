# Review #6217: scope drift reproduced at current main

Refs #6217. Job `REV-FIX-RT-AREA-iwasawa-1~2`.
Codex — **codex-mFu2rq**, 19 October 2026. Input commit `2432b6dd277d7824449e26d8e7815aaef5ac2cb4`.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/6217#issuecomment-6258801622)
confirms this session's claim comment 6258799959. This session wrote none of the fixes.

**Blocked checkpoint.** The published issue assigns the HE.0 packet, its
suggested file and this report. Its independent mathematical review is
already accepted. The generated queue now assigns **12 packets and 25
outputs**, compared with ten packets and 21 outputs in the previous
checkpoint. A new mathematical audit of the unchanged HE.0 fixes would not
resolve this mismatch. No new verdict or mathematical correction is claimed.

The scope restriction is explicit: [WORKERS.md](../WORKERS.md), “Doing the
work”, says “Edit only the files the issue names, plus your own scratch
space.” The queue and generator are outside that assignment and intake's
allowed output paths. I requested authorization to apply the existing
concrete repair through the session's clarification interface. No reply
had arrived when preparing this checkpoint; the repair remains unapplied.
This is a file-scope blocker, not an automatic approval-review rejection.

## Mathematical work preserved

The packet's attributed review of findings /2, /8, /9 and /10 remains
accepted. The level-raising, period/transfer, open-image and self-dual
Kolyvagin-system contracts retain their explicit supplier boundaries.
The accepted planning pass has 78 nodes, 21 gaps, 63 requests and eight
planned stages; implementation status remains unchecked.

The [previous report](https://github.com/CBirkbeck/tauceti-explorer/blob/a5059ebb8/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-1~2.md)
and the [mathematical review](https://github.com/CBirkbeck/tauceti-explorer/blob/508e89592/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-1~2.md)
preserve the earlier reviewers' source evidence and attribution. This
session did not repeat their primary-source audit or replace their review.

## Fresh checks and new evidence

- The assigned packet passes `scripts/check_blueprint.py` with **zero
  errors and warnings**: 78 nodes, 24 API items, 18 tests, 13 baseline
  declarations and eight planned stages.
- `issues.deliverables_complete` returns **false** for the current queue
  record and **true** for an in-memory copy limited to the published three
  outputs. No queue or job state was changed to obtain either result.
- The existing red-team queue, issue and follow-up tests run **59 tests**,
  with one skipped and no failures. Temporary test directories stayed in
  scratch.
- No Lean file changed. This session did not rerun Lean. The preceding
  checkpoint records exit 0 and 114 admission warnings on the same file;
  that is historical evidence, not a fresh compilation claim.

The two additional packet assignments since the preceding checkpoint are
`ModularIwasawaMainConjectures.json` and `AutomorphicPadicLFunctions.json`.
All eleven additional packets currently required by the queue are:

- `HeegnerPointEulerSystems--HE.8c.json`
- `HeegnerPointEulerSystems--HE.8.json`
- `GrossZagierAndArithmeticHeights.json`
- `HeightsRationalPointsAndObstructions.json`
- `ModularIwasawaMainConjectures.json`
- `RankZeroOneBSD--BSD.0.json`
- `HeegnerPointEulerSystems--HE.8b.json`
- `AutomorphicPadicLFunctions.json`
- `EulerSystemsAndKolyvaginSystems.json`
- `SelmerIwasawaCohomology.json`
- `KatoEulerSystems.json`

## Full generator replay

I reran the actual generator twice against this input tree, with only the
two historical output arrays restored in memory from commit `88f9bcd44`.
One run used the current selector and the other used the one-line candidate.
The generator's final dry-run return exposed its merged jobs and prompts;
queue reads were intercepted, directory creation suppressed, repository
writes prohibited and the lock redirected to scratch. No generated output
was installed.

| Replay | Generated jobs | Fix-round-two outputs | Review-round-two outputs |
| --- | ---: | ---: | ---: |
| Current selector, restored arrays | 6,318 | 31 | 17 |
| Candidate selector, restored arrays | 6,340 | 4 | 3 |

Thus restoring the queue alone is still undone by regeneration. Relative
to the unmodified-selector replay, the candidate changes 48 existing
records, all exclusively in their output arrays, adds 22 and removes none.
Assertions verify that all 48 candidate arrays equal their input arrays:
the two restored assignments and the other 46 already issued assignments.
The affected rounds retain their states and other metadata. Each new review
follows its new fix and lists that fix under `independentOf`.

The additions are the same eleven fix/review pairs recorded in the
preceding checkpoint: automorphic-1 round 7; combinatorics, etale,
geomlanglands, iwasawa-1, ktheory-1 and ktheory-2 round 3; langlands-1 round
3; langlands-2 round 5; padic-1 and padic-2 round 5.

This validates the proposed scheduling behavior. It gives no mathematical
verdict on the additional assignments. The whole regenerated queue must
not replace the checked-in queue as part of this narrow repair.

## Resume condition

The [handoff](../handoff/REV-FIX-RT-AREA-iwasawa-1~2.md) contains a refreshed
patch against this input commit. Unlike the previous patch, it also removes
the two newly accumulated packet assignments from round two. It changes
only the two output arrays and the selector; no state or review verdict.

The maintainer must authorize the scope extension and apply/review that
patch through maintainer intake, or publish an expanded mathematical
assignment naming the additional fixes. Then reconcile the issue and queue.
Another review of HE.0 cannot finish the current expanded record. No
background process or disposable scratch artifact is needed to resume.
