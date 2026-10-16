# Checkpoint: SR.4–SR.6 revision blocked by upstream ownership

Issue #9313; job `BP-SmoothRepresentationsOfLocalGroups--SR.4~2`; Codex,
session `codex-g0EsK3`; 16 October 2026. **Blocked checkpoint; the revision
is unfinished.** No second issue was claimed.

The bot confirmed this session's claim in
[comment 6214769366](https://github.com/CBirkbeck/tauceti-explorer/issues/9313#issuecomment-6214769366).
The issue had `state:available`, but its
[maintainer instruction of 13 October](https://github.com/CBirkbeck/tauceti-explorer/issues/9313#issuecomment-6146993445)
already stopped further atlas blueprint rounds because the upstream README is
authoritative. The label and that instruction conflict. This checkpoint
records the blocker rather than repeating an upstream roadmap.

## Evidence and scope

[WORKERS.md](../WORKERS.md), “Never duplicate what TauCetiRoadmap already has”,
and [PROTOCOL.md §15](../PROTOCOL.md#15-build-on-existing-roadmaps-never-duplicate)
prohibit replanning Tau Ceti roadmaps, including tracked open pull requests.
The user also explicitly prohibited planning existing upstream work.

[TauCetiRoadmap PR #793](https://github.com/TauCetiProject/TauCetiRoadmap/pull/793)
was merged into the bundle branch on 14 October 2026 at 19:12:18 UTC, with
merge commit `10432b146c0828ab379e76f9c630a76578b98430`.
[PR #785](https://github.com/TauCetiProject/TauCetiRoadmap/pull/785) now carries
the smooth-representation folder. Its head when checked was
`b853d91ae766c28b7360b4c8ddb5af7db85bda46`; it was open, not merged into
main. This agrees with the explorer's `upstream/tauceti_status.json` entry.

Read the authoritative
[README at that head](https://github.com/TauCetiProject/TauCetiRoadmap/blob/b853d91ae766c28b7360b4c8ddb5af7db85bda46/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md)
before any continuation. Its “Scope and ownership” and SR.4–SR.6 sections
already assign the targets this issue asks the atlas to revise:

| Section | Existing upstream ownership |
| --- | --- |
| SR.4.1–SR.4.5 | Satake transforms, spherical parameters, GL_n, unitary groups, GSp_4 and derived comparisons. |
| SR.5.1–SR.5.3 | Derivatives, integral blocks, Whittaker projectives and families, coefficient changes and local blocks. |
| SR.6.1–SR.6.5 | Finite-wild parameters, invariant-quotient finiteness, excursion algebra, center images and stable operators. |

The current upstream boundary also differs materially from the inherited
packet: it excludes the geometric Hecke action and the general reductive
integral finiteness/second-adjointness applications that require that action,
while SR.5.2 owns the GL_n integral second adjointness supplied by types and
projectives. Replaying the old revision instructions without a new scope
decision would ignore that boundary.

## Changes and remaining work

Only packet progress metadata and this handoff changed. The packet is
`partial`, and all three coverage records are `partial`, with an explicit
ownership blocker prepended to their inherited remaining work. This prevents
the old packet's `complete` flag from making this unfinished revision count
as a completed submission merely because its new handoff exists.

The 70 node IDs, statements, APIs, tests, source records, requests, gaps and
`needs_changes` review are preserved. The reader and suggested Lean file are
unchanged. No mathematical correction, closure claim, source verification or
implementation claim is made by this session.

The inherited inventory is 11 definitions, 6 constructions, 47 theorems,
5 comparisons and 1 application; 55 API items; 51 unit tests; 14 planets;
14 baseline declarations; 13 gaps and 17 requests. None was added or resolved.
SR.4, SR.5 and SR.6 remain incomplete in this revision.

The maintainer must reconcile #9313's availability with the recorded stop
instruction. Any continuing roadmap changes belong in #785 under that
instruction. If atlas work is explicitly reauthorized, first reconcile its
scope with the upstream README, then use
[the existing review](../reviews/REV-SmoothRepresentationsOfLocalGroups--SR.4.md)
and the preserved remaining-work lists to identify the outstanding tasks.
This checkpoint does not authorize a fresh atlas revision or alter upstream.

## Validation and provenance

- `python3 scripts/check_blueprint.py research/blueprint/packets/SmoothRepresentationsOfLocalGroups--SR.4.json`:
  0 errors and 0 warnings before and after the metadata edit.
- The submission file check and `git diff --check` passed.
- The suggested Lean file was **not compiled in this session**; it was not
  edited. No Lean process was started.
- Read the worker/protocol instructions, issue and claim comments, existing
  review, upstream status record, and authoritative upstream README sections
  identified above. GitHub PR metadata was checked live. No primary
  mathematical source or baseline declaration was newly audited; inherited
  source reads and compilation evidence are not this session's work.

All resumption evidence is linked here; no scratch file is needed.
