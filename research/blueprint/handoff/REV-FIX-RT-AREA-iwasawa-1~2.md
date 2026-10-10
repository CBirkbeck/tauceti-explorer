# Handoff: #6217 requires the maintainer's scope repair

Codex — **codex-WkYQFI**, 10 October 2026.
Branch: `codex-WkYQFI-review-6217`; input commit `42753a9914d3dc0181628bb0a763841593e2ea97`.
Claim confirmed in [comment 6102998908](https://github.com/CBirkbeck/tauceti-explorer/issues/6217#issuecomment-6102998908).
**Blocked checkpoint.** This session claimed only #6217.

The issue-named HE.0 fix review is already accepted. The live issue permits
three outputs and one packet; the queue requires 23 outputs and eleven packets.
The other ten packets retain their own reviewers, including ES.0's
`needs_changes` verdict. No mathematical verdict, packet or suggested file
changed in this continuation.

The [review report](../reviews/REV-FIX-RT-AREA-iwasawa-1~2.md) preserves the
exact guard, output lists and self-contained regression scripts. Restore
**only the two historical output lists** for `FIX-RT-AREA-iwasawa-1~2` and its
review from `88f9bcd44`, and apply the completed-round guard in
`make_queue.py::fix_rounds`. Preserve all other queue fields. Merged
[PR #6753](https://github.com/CBirkbeck/tauceti-explorer/pull/6753) confirms the
historical four-file fix scope. Both repairs are necessary: the lists alone
would expand again, and the guard alone would freeze the incorrect scope.

Fresh actual completion checks return false for the current job and true
with its historical scope restored in memory. A reconstructed 5,821-byte
two-file patch passes `git apply --check`; its SHA-256 is
`23b235ebc48255971f32f6ffcb9d40f1b579622cbec25fee06f2859a6d79aa70`.
All seven focused regression cases pass. Full generation in memory preserves
round two's 4/3 fix/review outputs, assigns 30/17 to round three and keeps
both rounds stable across another generation. The broader comparison changes
36 jobs and adds twenty; inspect their routing before publishing new rounds.
Nothing was generated on disk, synchronized or promoted.

[WORKERS.md](../WORKERS.md) limits edits to issue-named files. The two repair
paths are also outside intake's allowlist. Scope approval for the concrete
repair and maintainer handling was requested and remains pending. The next
action is that repair and synchronization, rather than another HE.0 review
or replacement of other reviewers' markers. Until then, the existing accepted
review cannot complete this queue entry.

HE.0 checker: zero errors and warnings; 78 nodes, 24 API items, eighteen tests,
21 gaps and 63 requests. Suggested SHA-256:
`9e4fa52693e51e06ea4f6147f430ddf021a845d22b892bec0e8524f478dc546b`.
Lean was not rerun for these Markdown changes; earlier successful pinned
receipts remain attributed in the report. No Lean process was started and
no source was fetched or copied. Only the report and this handoff change;
both remain usable without any scratch artifact.
