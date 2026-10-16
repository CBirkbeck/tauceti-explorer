# BP-ReductiveGroupsPartII~2: blocked ownership checkpoint

## Latest dispatch: codex-cXs3jp, 2026-10-16

This remains a **blocked checkpoint**, not a completed revision. Codex session
`codex-cXs3jp` selected #9312 as the first available eligible issue in the
manager's supplied priority list. The bot
[confirmed this session's claim](https://github.com/CBirkbeck/tauceti-explorer/issues/9312#issuecomment-6214411798).
The previous checkpoint's merger made the issue available again without
resolving the maintainer's
[instruction of 2026-10-13](https://github.com/CBirkbeck/tauceti-explorer/issues/9312#issuecomment-6146995072):
the upstream README is authoritative and roadmap changes belong on upstream
PR #785. No subsequent issue comment rescinds that instruction or assigns a
successor extension. The manager must reconcile this dispatch conflict before
another mathematical revision can proceed.

The following evidence was checked afresh in this session:

- Read the worker rules, blueprint protocol, expansion protocol, upstream
  guide, full issue and all its comments, previous checkpoint, independent
  review, and the packet's summary, gaps, coverage and node inventory.
- Read the supplied ReductiveGroups and ReductiveGroupsPartII introductions,
  scope and supplier boundaries, and the Part II suggested file's opening
  declarations. The read-only integration checkout remains at
  `0d144d044dacebca17b654695b6f1ad58f159b27`.
- Queried [upstream PR #785](https://github.com/TauCetiProject/TauCetiRoadmap/pull/785)
  through the GitHub API: it is open and draft, now at head
  `b853d91ae766c28b7360b4c8ddb5af7db85bda46`. This is newer than the public
  head recorded in the previous checkpoint below. Retrieved only its two
  individual ReductiveGroupsPartII files, into scratch, and inspected the
  README's Scope and ownership section, lines 29–123. Both the supplied
  checkout and the current public README assign the seven requested layers
  to this existing upstream roadmap. The public README still has exact
  italicized parenthesized identifiers for 166 of the atlas packet's 180
  nodes. This is an overlap check, not a mathematical review of those targets.
- The current public
  [README](https://github.com/TauCetiProject/TauCetiRoadmap/blob/b853d91ae766c28b7360b4c8ddb5af7db85bda46/TauCetiRoadmap/ReductiveGroupsPartII/README.md)
  has 7,286 lines and SHA-256
  `e13ec5ade6a7855e55e0da59d06ca68711d3a093f0b1b6cc7520e3dc57c009b4`.
  Its
  [Suggested.lean](https://github.com/TauCetiProject/TauCetiRoadmap/blob/b853d91ae766c28b7360b4c8ddb5af7db85bda46/TauCetiRoadmap/ReductiveGroupsPartII/Suggested.lean)
  has 1,607 lines and SHA-256
  `26c61b5ea8d9e393e1c25e9adb5e96924e9b61d3671d9df4ae71dad281484f2b`.
  These hashes identify the inspected public files, not the supplied checkout.
- Read the current Tau Ceti `AlgHom.mapValue`, `mapValue_apply`,
  `mapValue_id`, `mapValue_injective` and `mapValue_comp` statements in
  `TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean`. They provide
  postcomposition on convolution points and its functor laws. This limited
  inspection supplies no new claim about the packet's pinned library audit.

Only this handoff changed. The packet, reader and suggested file retain their
previous state; no upstream roadmap was edited or reviewed. The packet checker
passed again with **zero errors and zero warnings**. The inherited inventory
remains 180 nodes (23 definitions, 36 constructions, 110 theorems,
2 comparisons, 9 applications), 368 API items, 249 tests, 38 planets,
62 baseline declarations, 17 requests and 5 gaps. Packet status is `partial`;
RG2.0, RG2.0a, RG2.1, RG2.2, RG2.3, RG2.4 and RG2.5 are all `partial`.
Lean was not compiled in this session because no Lean changed. No background
build or language server was started, and no source passage was copied.

Resume only after the manager has reconciled availability with the maintainer
instruction, or assigned an extension owner and permitted files. The earlier
resume instructions below retain the unresolved mathematical work. Releasing
another identical checkpoint to the available queue does not resolve this
blocker. This session takes no second job.

## Previous checkpoint: codex-EKNrjE

Codex, session `codex-EKNrjE`, 2026-10-16. Refs #9312.

This is a blocked checkpoint, not a completed revision. No mathematical target
has been added, accepted, or promoted. The packet remains `partial`, with its
existing `needs_changes` review and all seven coverage records `partial`.

## Why this revision cannot proceed in its assigned scope

The issue had `state:available` when selected from the manager's priority list.
The claim bot confirmed this session's claim in
[its reply](https://github.com/CBirkbeck/tauceti-explorer/issues/9312#issuecomment-6211540407).
However, the issue also has a
[maintainer instruction dated 2026-10-13](https://github.com/CBirkbeck/tauceti-explorer/issues/9312#issuecomment-6146995072)
directing further work to the authoritative upstream roadmap pull request and
saying that further atlas blueprint rounds are unnecessary. The available label
does not resolve this scope conflict.

The prior independent review,
`research/blueprint/reviews/REV-ReductiveGroupsPartII.md`, identifies the same
ownership blocker. WORKERS.md and PROTOCOL.md section 15 prohibit planning or
reviewing existing Tau Ceti roadmap work in this job. The supplied read-only
TauCetiRoadmap checkout already contains `ReductiveGroupsPartII/README.md` and
`ReductiveGroupsPartII/Suggested.lean`, including all seven assigned layers.
Revising the existing atlas packet into another plan for those layers would
repeat that work. Assigning its additional clauses to a successor roadmap
requires a roadmap identity, stage assignments and supplier links outside this
issue's permitted files; the prior reviewer explicitly left that decision to
the manager.

## Evidence checked in this run

- Read WORKERS.md, PROTOCOL.md, UPSTREAM_GUIDE.md, the expansion protocol, the
  full issue and its comments, the prior review, and the packet's review,
  coverage and gaps.
- Inspected the scope and supplier conventions of the supplied upstream
  ReductiveGroups and ReductiveGroupsPartII READMEs and their suggested files.
  The supplied checkout's commit is
  `0d144d044dacebca17b654695b6f1ad58f159b27`. This identifies the supplied
  integration checkout; it is not asserted to be a commit resolvable in the
  public upstream repository.
- Independently fetched the two individual files at the current public
  [upstream PR #785](https://github.com/TauCetiProject/TauCetiRoadmap/pull/785)
  head `b88426d23c8ffe5ad7cb032955c7fa44f320ac89`. The PR was open and ready
  for review when checked. Its
  [README](https://github.com/TauCetiProject/TauCetiRoadmap/blob/b88426d23c8ffe5ad7cb032955c7fa44f320ac89/TauCetiRoadmap/ReductiveGroupsPartII/README.md)
  and
  [suggested file](https://github.com/TauCetiProject/TauCetiRoadmap/blob/b88426d23c8ffe5ad7cb032955c7fa44f320ac89/TauCetiRoadmap/ReductiveGroupsPartII/Suggested.lean)
  differ from the supplied checkout; no interchangeability of those versions
  is assumed. Both versions contain all seven layer headings and exact
  parenthesized target identifiers for 166 of the packet's 180 nodes. Identifier
  agreement establishes overlap, not equivalence of every hypothesis or clause.
- The public README's Scope and ownership section, lines 29–123, expressly
  distinguishes its retained targets from such additions as R-smooth torus
  criteria, non-affine restriction of scalars and more general fixer immersions.
  Those boundaries do not authorize assigning the additions to a new owner in
  this job. The prior review's table of fourteen targets without an exact
  identifier remains a routing lead, not a verified successor plan.
- Read the existing convolution-group and value-algebra functoriality
  declarations in the current Tau Ceti library's
  `TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean`. No new library audit or
  mathematical source verification is claimed.

For reproducibility, the fetched public README has 7,237 lines and SHA-256
`01738a5325dd3bc797ee3916c85a2b87f029532ced30e6fe662b6b78de816fa6`;
the public suggested file has 1,596 lines and SHA-256
`dfbd4ddeee1d8a4f97395b459c247908ec21fd4cfec204ddc4cc07d3eb97440c`.
Only this handoff is submitted; fetched files remain scratch material.

## State preserved and validation

The packet, reader and suggested file were left unchanged. The inherited packet
has 180 nodes: 23 definitions, 36 constructions, 110 theorems, 2 comparisons and
9 applications; 368 API items; 249 tests; 38 planets; 62 baseline declarations;
17 supplier requests; and 5 recorded gaps. These are inherited inventory counts,
not a new correctness certification. RG2.0, RG2.0a, RG2.1, RG2.2, RG2.3, RG2.4
and RG2.5 all remain `partial`; none is closed or planned.

`python3 scripts/check_blueprint.py research/blueprint/packets/ReductiveGroupsPartII.json`
passed with zero errors and zero warnings. Lean was not run in this session:
there is no changed Lean file. The previous review records successful
elaboration; that is historical evidence, not a compilation result of this run.
No build, language server or background process was started.

RT-AREA-algebraicgeometry/11 retains the previous review's disposition: affine
finite-presentation Weil restriction is imported from ModularCurves 0F, and
any extension must retain that compatibility. This run makes no mathematical
change to that disposition and introduces no new request or source issue.

## Manager action and exact resume point

Reconcile #9312's availability with the existing maintainer instruction before
dispatching another worker. Work on the existing roadmap goes through upstream
PR #785. If additional atlas planning is intended, first assign a separate
extension owner and authorize its deliverables and dependency boundary.

After such an assignment, start from the prior review's fourteen-target routing
table and seven stage-specific `remaining` lists, compare each retained clause
with the then-current upstream README, import covered targets, and verify only
the genuinely additional mathematics against its sources. Preserve stable IDs
for retained work as the authorized routing permits. The four mathematical gaps
besides ownership are the étale local-homeomorphism input, tensor splitting over
a general splitting field, gluing the locally free determinant norm, and
non-affine lft Weil restriction for full torus Néron models. The reader also
still needs the eight corrections listed in the prior review if it is retained
for that authorized extension. No source passage or new source issue has been
checked in this run. A renewed source pass and pinned Lean check belong to that
newly scoped work.

This session claimed no second issue. Do not interpret this checkpoint as
resolving the ownership gap or completing the requested revision.
