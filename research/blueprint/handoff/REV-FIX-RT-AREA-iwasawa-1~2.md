# Handoff: #6217 scope mismatch and tested repair

Codex — **codex-02oLnD**, 10 October 2026.
Branch: `codex-02oLnD-review-6217`; input commit `0339ede22bf7a801e863028435d340d6ab2c0f03`.
Claim confirmed in [comment 6101137109](https://github.com/CBirkbeck/tauceti-explorer/issues/6217#issuecomment-6101137109).
**Blocked checkpoint.** This session claimed only #6217.

The issue-named HE.0 mathematical review is already accepted, with its original
source-reading attribution preserved. No packet or Lean file changed. Completion
is blocked because the issue names one packet and three outputs while the queue
requires eleven packets and 23 outputs. The ten extra packets carry other jobs'
reviewer markers. The actual completion predicate is false now and true with only
the historical output lists restored in memory.

The [review report](../reviews/REV-FIX-RT-AREA-iwasawa-1~2.md) contains the exact
completed-round guard, the two historical output lists and self-contained focused
and full-generator regression scripts. Restore only `outputs` for
`FIX-RT-AREA-iwasawa-1~2` and `REV-FIX-RT-AREA-iwasawa-1~2` from `88f9bcd44`, then
apply the guard in `make_queue.py::fix_rounds`. Preserve every other job field.
[PR #6753](https://github.com/CBirkbeck/tauceti-explorer/pull/6753), merge commit
`05036608ddb23c6603c1d2721487d87027616106`, independently confirms the four-file
historical fix scope. The prepared two-file patch is 5,821 bytes and passes
`git apply --check`. No scratch file is needed to reproduce it.

Seven focused regression cases pass. Full generation in memory keeps round two's
four/three fix/review outputs, routes thirty/seventeen to round three and preserves
both across a second generation. Against the original generator, 36 job entries
change, twenty appear and none disappear. Inspect that routing before publishing
new rounds; it was not written, synchronized or promoted in this continuation.

WORKERS.md limits edits to issue-named files; the issue does not name the generator
or queue. Intake's file rules reject both repair paths. Scope expansion and a
maintainer-handled PR were requested and remain pending. The next useful action is
the maintainer's administrative repair or explicit authorization to apply it.
Do not alter intake or issue labels, or replace the ten other reviewers' markers
to satisfy completion. Repeating the accepted mathematical review cannot repair
the queue.

HE.0 checker: zero errors and warnings; 78 nodes, 24 API items, eighteen tests,
21 gaps, 63 requests. Suggested SHA-256:
`9e4fa52693e51e06ea4f6147f430ddf021a845d22b892bec0e8524f478dc546b`.
Lean was not rerun; prior successful pinned receipts remain attributed in the
report. No Lean process was started, no source was fetched, and no cleared source
was copied.
