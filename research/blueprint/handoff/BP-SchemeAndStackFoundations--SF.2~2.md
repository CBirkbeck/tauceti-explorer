# BP-SchemeAndStackFoundations--SF.2~2: blocked checkpoint

Codex, session `codex-Csq2qp`, 2026-10-16. Refs #9297.

The bot confirmed this session's claim on [issue #9297](https://github.com/CBirkbeck/tauceti-explorer/issues/9297#issuecomment-6214795689). This is a blocked checkpoint, not a completed blueprint revision. No mathematical deliverable was revised.

The issue's availability conflicts with its explicit [maintainer instruction of 2026-10-13](https://github.com/CBirkbeck/tauceti-explorer/issues/9297#issuecomment-6147003570): blueprint rounds here are no longer needed because the upstream roadmap is authoritative. WORKERS.md and PROTOCOL.md section 15 prohibit re-planning a Tau Ceti roadmap, including an open upstream roadmap pull request. The previous claimant also documented this conflict before releasing the issue. This session posted its claim before inspecting the full comment history; that selection error does not authorize the prohibited revision.

The upstream status was independently checked through GitHub on 2026-10-16:

- [TauCetiRoadmap #779](https://github.com/TauCetiProject/TauCetiRoadmap/pull/779), the SchemeAndStackFoundations roadmap, merged on 2026-10-14 at 04:47:45 UTC, merge commit `d23fdaf388733bd9bcb0dc9b7963cc336f21461d`.
- [TauCetiRoadmap #943](https://github.com/TauCetiProject/TauCetiRoadmap/pull/943), its étale-invariance and scheme-Frobenius follow-up, merged on 2026-10-16 at 02:48:52 UTC, merge commit `d2081398eedfbd4153d3067aa98a21b5a5270957`.
- `research/blueprint/upstream/tauceti_status.json` records the roadmap at `stage: main`; its 2026-10-16 merge timestamp and `d208139` refer to the follow-up, rather than the original #779 merge. The local read-only roadmap directory did not contain SchemeAndStackFoundations, so GitHub supplied the current merge evidence. No shared checkout was updated or built.

The existing SF.2 packet, reader, suggested file and review object are preserved. The independent review's mathematical revision requests have not been discharged; this checkpoint makes no acceptance or closure claim. The packet still has status `partial`, SF.2 coverage `partial`, 85 nodes (7 definitions, 17 constructions, 49 theorems, 5 lemmas, 7 comparisons), 160 API items, 87 unit tests, 3 planets, 89 baseline declarations, 11 gaps and 9 requests. No new cross-roadmap request or ownership move was made.

Validation: `python3 scripts/check_blueprint.py research/blueprint/packets/SchemeAndStackFoundations--SF.2.json` reported 0 errors and 0 warnings. The suggested Lean file was not changed or compiled in this session. No mathematical source was newly read, fetched or copied; the checkpoint concerns ownership and queue eligibility only.

The maintainer needs to retire or otherwise reconcile this stale blueprint job with the authoritative upstream roadmap. A worker must not resume the old SF.2 revision merely because the availability label returns. Any distinct extension needs an explicitly authorized scope beyond the existing roadmap, following PROTOCOL.md section 15. This session stops after submitting this checkpoint and does not claim a second issue.


## Claim audit — Codex session codex-3uNB8M, 2026-10-16

This session resumes the same blocked job, issue #9297. The bot confirmed the
claim in [comment 6215299931](https://github.com/CBirkbeck/tauceti-explorer/issues/9297#issuecomment-6215299931).
The session did not inspect the maintainer's blocking comment before posting
its claim. That was a selection error; the availability label does not override
the explicit block or authorize re-planning existing Tau Ceti work.

The blocker above persists. A fresh GitHub API check confirms that
[TauCetiRoadmap #779](https://github.com/TauCetiProject/TauCetiRoadmap/pull/779)
merged on 2026-10-14 at 04:47:45 UTC, commit
`d23fdaf388733bd9bcb0dc9b7963cc336f21461d`, and
[follow-up #943](https://github.com/TauCetiProject/TauCetiRoadmap/pull/943)
merged on 2026-10-16 at 02:48:52 UTC, commit
`d2081398eedfbd4153d3067aa98a21b5a5270957`. The maintainer's
[2026-10-13 instruction](https://github.com/CBirkbeck/tauceti-explorer/issues/9297#issuecomment-6147003570)
says that further blueprint rounds here are not needed. WORKERS.md and
PROTOCOL.md section 15 require importing existing Tau Ceti roadmaps.

Only this handoff note changed. The packet, reader, suggested file and review
object are preserved; none of the review's outstanding mathematical requests
is claimed discharged. The counts and partial coverage recorded above are
unchanged. This is a blocked checkpoint, not a completed revision. No Lean
compilation is appropriate for this documentation-only change. The packet
checker and whitespace validation are rerun for this checkpoint.

Resume only after the maintainer reconciles this stale job with upstream or
authorizes a distinct extension with an explicit scope beyond that roadmap.
Do not repeat this checkpoint solely because automation returns the issue to
`state:available`. No second job is claimed in this run.


## Claim audit — Codex session codex-aKKn9C, 2026-10-16

The bot confirmed this session's claim in
[comment 6216075646](https://github.com/CBirkbeck/tauceti-explorer/issues/9297#issuecomment-6216075646).
I posted the claim before reading the full comment history and the existing
handoff. That selection error does not authorize the blocked blueprint work.
This is a blocked checkpoint required by this run's stopping instructions;
it does not complete the revision or discharge any mathematical review request.

The blocker is unchanged. The maintainer's
[explicit instruction](https://github.com/CBirkbeck/tauceti-explorer/issues/9297#issuecomment-6147003570)
says further blueprint rounds are unnecessary and changes belong upstream.
Fresh GitHub API reads confirm that
[TauCetiRoadmap #779](https://github.com/TauCetiProject/TauCetiRoadmap/pull/779)
merged on 2026-10-14 at 04:47:45 UTC, commit
`d23fdaf388733bd9bcb0dc9b7963cc336f21461d`, and
[follow-up #943](https://github.com/TauCetiProject/TauCetiRoadmap/pull/943)
merged on 2026-10-16 at 02:48:52 UTC, commit
`d2081398eedfbd4153d3067aa98a21b5a5270957`.
The roadmap's `stage: main` record in
`research/blueprint/upstream/tauceti_status.json` agrees. WORKERS.md and
PROTOCOL.md section 15 prohibit re-planning existing Tau Ceti roadmaps.

Only this handoff note changed. The packet, reader, suggested Lean file and
review object remain as received. No Lean compilation was needed or performed.
Validation: the existing packet checker reports zero errors and zero warnings;
`git diff --check` passes. No second issue was claimed.

The next selection must inspect the maintainer's blocking comment before
claiming. The automatic return to `state:available` does not establish
eligibility. The maintainer needs to reconcile the queue with upstream;
resumption requires a distinct authorized scope beyond the existing roadmap.

## Blocked run — Codex session codex-CMCCUW, 2026-10-16

The bot confirmed this session's claim in
[comment 6216694875](https://github.com/CBirkbeck/tauceti-explorer/issues/9297#issuecomment-6216694875).
The claim preceded inspection of the blocking comment and this handoff; that
was a selection error. The run's instructions require a handoff checkpoint
when blocked and prohibit claiming a second job. This submission records that
stop; it does not renew authorization for the blueprint revision.

Fresh GitHub API reads confirm that [upstream #779](https://github.com/TauCetiProject/TauCetiRoadmap/pull/779)
and [follow-up #943](https://github.com/TauCetiProject/TauCetiRoadmap/pull/943)
are merged, at the timestamps and commits recorded above. The upstream README
and Suggested.lean are present on main. The supplied read-only checkout lacks
this roadmap directory, so it cannot establish its absence from upstream.
The maintainer's [blocking instruction](https://github.com/CBirkbeck/tauceti-explorer/issues/9297#issuecomment-6147003570)
still applies under WORKERS.md and PROTOCOL.md section 15. Reconcile this job's
queue eligibility with that instruction before another claim; repeated
checkpoints do not advance the mathematics.

Only this handoff changed. The 85 nodes, 160 API items, 87 tests, three planets,
89 baseline declarations, 11 gaps and nine requests remain as received. Packet
and SF.2 coverage remain partial; no review request is discharged and no new
supplier request or ownership move is made. The packet checker reports zero
errors and zero warnings, and whitespace validation passes. The suggested Lean
file was neither changed nor compiled. No mathematical source was newly read
or copied. Resume only with a maintainer-authorized scope beyond the existing
upstream roadmap. No second issue was claimed.
