# BP-SchemeAndStackFoundations--SF.4~2: upstream-supersession checkpoint

Issue: #9299. Worker: Codex, session `codex-u298Ps`, 16 October 2026.
Continues the blocked checkpoint in [#9962](https://github.com/CBirkbeck/tauceti-explorer/pull/9962),
written by Codex session `codex-jQeXWF`.
**Blocked checkpoint; the requested blueprint revision is not complete.**

The claim bot confirmed this session's claim in
[comment 6215378205](https://github.com/CBirkbeck/tauceti-explorer/issues/9299#issuecomment-6215378205).
The confirmation itself was posted at 12:20:51 UTC. This run holds one confirmed
claim and takes no further job.

## Blocker and evidence

The issue's availability label is inconsistent with the authoritative upstream
roadmap and with the maintainer's
[13 October instruction](https://github.com/CBirkbeck/tauceti-explorer/issues/9299#issuecomment-6147000401).
That instruction says this blueprint round is superseded and further changes belong
in TauCetiRoadmap. Since then,
[TauCetiRoadmap pull request 779](https://github.com/TauCetiProject/TauCetiRoadmap/pull/779)
has merged, at 04:47:45 UTC on 14 October 2026, in commit
`d23fdaf388733bd9bcb0dc9b7963cc336f21461d`.

The upstream main commit inspected in this run is
`4c4f8f52238b8ead04f806021f79201c6d499982`. Its SchemeAndStackFoundations
README also incorporates subsequent changes in
`d2081398eedfbd4153d3067aa98a21b5a5270957` on 16 October. The authoritative
files inspected are:

- [README at the inspected main commit](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4c4f8f52238b8ead04f806021f79201c6d499982/TauCetiRoadmap/SchemeAndStackFoundations/README.md).
- [Suggested.lean at that commit](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4c4f8f52238b8ead04f806021f79201c6d499982/TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean).

The read-only local roadmap checkout inspected has commit
`0d144d044dacebca17b654695b6f1ad58f159b27` and does not contain this newly
merged roadmap. Checking the public upstream files was therefore necessary to
establish its present scope. The local checkout was not modified or built.

WORKERS.md and PROTOCOL.md section 15 prohibit planning an existing Tau Ceti
roadmap again. The permitted deliverables of #9299 are the old atlas packet,
reader, suggested file and this handoff; they do not include the authoritative
upstream files or a new Part II roadmap. Revising the old plan as if it still
owned these targets would reproduce existing work and could restore statements
the upstream roadmap has deliberately narrowed. This is a scope blocker, not a
time or source-access limit.

## Scope comparison establishing the overlap

This is an ownership check, not an independent review of the upstream
mathematics. Section numbers refer to the linked upstream README.

| Requested SF.4 material | Existing upstream location |
| --- | --- |
| Thickenings, scheme lifting criteria and torsors of lifts | Section 4.1 |
| Artinian coefficient categories and deformation functors | Sections 4.2–4.3 |
| Versality, hulls and Schlessinger's theorem | Section 4.4 |
| Natural tensor-valued elementary obstruction theories | Section 4.5 |
| Algebra, smooth-scheme, line-bundle and node deformations | Section 4.6 |
| Adic systems, completion and coherent formal modules | Sections 4.7–4.8 |
| Formal functions and Stein factorization | Section 4.9 |
| Coherent existence and algebraization of compatible morphisms | Section 4.10 |
| Modifications, strict transforms, flattening and Chow's lemma | Sections 4.11–4.12 |
| Regular schemes, function-field normalization of curves, Serre's criterion and Bertini | Section 4.13 |
| Hilbert and Quot schemes | Section 4.14; the Grassmannian is imported from ModularCurves 0G |
| Stable pointed moduli, the stack DVR criterion, level covers and stable extension | Section 4.15 |
| Alterations, normal crossings, nodal-family and fibration inputs | Sections 4.16–4.18 |
| de Jong's field alteration theorem | Section 4.19 |
| Trait geometry, semistable pairs and semistable alterations | Section 4.20 |

In particular, the upstream reader already uses normalization in the function
field rather than normalization of the identity (section 4.13), records tensor
values and naturality for elementary obstruction theories (section 4.5), and
requires transition compatibility when algebraizing morphisms (section 4.10).
Section 4.15 includes pointed stable curves and a properness bridge from stable
reduction to the stack DVR criterion, citing Knudsen II, Corollary 2.6 and
Theorem 2.7, p. 179. These observations establish overlap with the old revision
requests; they do not certify that every old review gap is closed upstream.

The scopes also differ in ways that must not be silently reconciled:

- Sections 4.7 and the opening ownership section restrict formal geometry to
  chosen ideals and level-preserving adic thickening systems. They exclude the
  comparison with topologically locally ringed formal schemes and independence
  of ideals of definition.
- Section 4.10 excludes polarized algebraization of adic systems, the associated
  category equivalence and effective formal deformations of curves.
- Section 4.5 treats elementary small-extension obstruction theories and excludes
  general finite-dimensional kernels and hull-relation bounds.

These are broader targets in the old atlas packet, not evidence that the
existing upstream roadmap should be re-planned. If still wanted, their exact
scope and owner require a new assignment extending the upstream roadmap.

## Preserved state and validation

No mathematical deliverable was changed. The packet remains `partial`, SF.4
coverage remains `partial`, and the existing independent `needs_changes` review
is preserved. It still contains 57 nodes: 17 definitions, 4 constructions,
32 theorems, 3 lemmas and 1 application; 139 API items, 91 unit tests, 6 planets,
79 baseline declarations, 9 gaps and 10 requests. No new node, API item, test,
planet, baseline claim or cross-roadmap request was added. Nothing is claimed
formalized or mathematically closed by this checkpoint.

The previous checkpoint records reading: WORKERS.md, PROTOCOL.md, the expansion
protocol and upstream guide; the full #9299 instructions and its comments; the SF.4 independent review
and packet coverage, requests and gaps; the reviewed SF.4 library audit; the
current tier list; the local StableReduction and AlgebraicVectorBundles
roadmap material; and the authoritative upstream scope and Layer 4 passages
identified above, with its suggested-file declarations. The source-library index
was inspected; no restricted source was needed or copied.

Checks:

- `python3 scripts/check_blueprint.py research/blueprint/packets/SchemeAndStackFoundations--SF.4.json`:
  0 errors and 0 warnings on the unchanged packet.
- `python3 research/blueprint/intake.py check-files research/blueprint/handoff/BP-SchemeAndStackFoundations--SF.4~2.md`:
  0 problems.
- `git diff --check`: passed.
- Lean was not rerun: no Lean file changed. The earlier review reports a pinned
  elaboration, but that is not a compilation performed in this run.

## Where to resume

The maintainer should reconcile #9299's availability with the upstream merge
and its own supersession instruction. Do not automatically resume the old
blueprint revision merely because its packet is still partial.

For an atlas synchronization assignment, import the authoritative Layer 4 and
its supplier boundaries, preserving the explicit upstream exclusions. For an
extension assignment, first specify which of the excluded formal-scheme,
polarized-algebraization or obstruction-theory targets are wanted, and assign
them to a Part II with permission to create its deliverables. Proposed changes
to the existing Tau Ceti roadmap itself belong in TauCetiRoadmap.

The unresolved historical gap list is still in
`research/blueprint/packets/SchemeAndStackFoundations--SF.4.json` and the detailed
correction list in
`research/blueprint/reviews/REV-SchemeAndStackFoundations--SF.4.md`.
This handoff contains all evidence needed for that routing decision; it needs
no file from the disposable scratch directory.

## Supersession recheck in this run

The issue was still labelled `state:available` when this session claimed it.
The bot accepted the claim even though the maintainer's supersession instruction
and the previous blocked checkpoint were both already present. The subsequent
availability label is therefore not evidence that the scope blocker has been
resolved. The current tier document also identifies SchemeAndStackFoundations
as merged upstream.

This session read the worker rules and protocols, the full issue and comments,
the earlier handoff, the independent review, the packet coverage and gap list,
the reviewed SF.4 library audit, the tier document and nearby read-only
StableReduction and AlgebraicVectorBundles roadmap material. The source-library
index was inspected; no restricted source was needed. This session independently
queried the live GitHub API for upstream main and
pull request 779, and read the README and Suggested.lean at the exact main
commit linked above. The API still reports the same merge and main commits.
A browser-rendered pull-request page returned older cached information; the
live API and the files at the exact commit establish the current state.
The Layer 4 scope, sections 4.5, 4.7 and 4.10, and the function-field normalization
signature in section 4.13 confirm the ownership and exclusion boundaries in
this handoff. No source theorem was re-reviewed or new mathematical result
claimed. In particular, the old review's 9 gaps remain historical open work;
the upstream merge is not a proof that they have been discharged.

The authoritative roadmap files are outside this issue's permitted
write scope. Updating only the old packet would neither amend those files nor
resolve the conflict with the supersession instruction. This checkpoint
therefore changes only the handoff. A maintainer routing decision is required
before further mathematical work: retire the superseded blueprint round,
authorize atlas synchronization, or assign a precise Part II. The automatic
checkpoint-release path has already made the same blocked job available again;
repeating that release without a routing decision will reproduce this blocker.
This session does not change issue labels or take a second job.
