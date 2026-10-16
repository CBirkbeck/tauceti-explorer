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
