# BP-SchemeAndStackFoundations--SF.0~2: upstream ownership checkpoint

## Current run: codex-FU436l, 16 October 2026

**Checkpoint; blocked by the existing upstream owner and the maintainer's scope
instruction.** The bot confirmed [this session's claim](https://github.com/CBirkbeck/tauceti-explorer/issues/9295#issuecomment-6220960175)
at 17:23:55 UTC. Issue #9295 was the first eligible available issue in the
manager's ordered list. Only this job was claimed. This run continues the
checkpoint merged in [#10002](https://github.com/CBirkbeck/tauceti-explorer/pull/10002).

Fresh authenticated GitHub API reads confirm that upstream
[PR #779](https://github.com/TauCetiProject/TauCetiRoadmap/pull/779)
merged on 14 October 2026 at 04:47:45 UTC, at
`d23fdaf388733bd9bcb0dc9b7963cc336f21461d`. Upstream main has advanced to
`f6780b173b0ee486636c58667d191d4814a77f90` (16 October, 16:39:28 UTC).
I fetched the individual README and Suggested.lean at that exact commit and
read the scope/ownership and Layer 0 interfaces:

- [README: scope and ownership](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f6780b173b0ee486636c58667d191d4814a77f90/TauCetiRoadmap/SchemeAndStackFoundations/README.md#scope-and-ownership).
- [README: Layer 0](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f6780b173b0ee486636c58667d191d4814a77f90/TauCetiRoadmap/SchemeAndStackFoundations/README.md#layer-0-schemes-and-morphisms).
- [Suggested.lean: imports and Layer 0](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f6780b173b0ee486636c58667d191d4814a77f90/TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean).

These files retain the schemes-and-morphisms scope assigned to this issue and
import AlgebraicVectorBundles' carriers. The supplied read-only roadmap tree
remains at `0d144d044dacebca17b654695b6f1ad58f159b27`, without this new
directory. I also read the supplied AlgebraicVectorBundles and ModularCurves
scope statements, the reviewed SF.0 library audit, and the current Tau Ceti
relative-Spec functor and affine-comparison declarations. The Tau Ceti tree
remains at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These current-library
reads establish ownership context; they add no baseline claim at the packet's
historical pins. No shared checkout was modified or built.

The [maintainer's 13 October instruction](https://github.com/CBirkbeck/tauceti-explorer/issues/9295#issuecomment-6147006432)
still directs roadmap changes upstream and says further atlas blueprint
rounds are unnecessary. I re-read every issue comment; none withdraws that
instruction. The automated availability reset after #10002 does not resolve
this scope conflict. WORKERS.md and PROTOCOL.md section 15 forbid replanning
an existing Tau Ceti roadmap. Completing the historical revision here would
produce a competing specification. Changing the queue or upstream roadmap is
outside this issue's permitted deliverables.

Only this handoff changes. The packet remains `partial`, SF.0 coverage remains
`partial`, and the independent review remains `needs_changes`. The preserved
inventory is 139 nodes (26 definitions, 26 constructions, 75 theorems, six
comparisons, three lemmas and three applications), 383 definition/construction
API items, 226 definition/construction unit tests, six planets, 492 baseline
declarations, six gaps and 11 requests. This run adds no mathematical nodes,
API, tests, planets, source issues or ownership transfers. The six unresolved
review groups and the existing handling of `RT-AREA-algebraicgeometry/11`
remain recorded below; their repair is not certified by this checkpoint.

Validation: `check_blueprint.py` reports zero errors and zero warnings on the
unchanged packet. The changed handoff passes `intake.py check-files`. No Lean
file changed or was compiled. No source passage or external source file was
copied into the repository. No scratch file is needed to resume.

**Resumption requires a maintainer disposition of the stale atlas assignment.**
This is the seventh submission of the same ownership blocker, following
#9894, #9951, #9972, #9988, #9995 and #10002. A mathematical follow-up must
start from the current upstream specification with a separately authorized
scope. The historical review remains unapproved. This run stops after its
checkpoint pull request and claims no second job.

## Previous checkpoint and preserved mathematical state

Codex, session `codex-unDNnV`, 16 October 2026. Issue [#9295](https://github.com/CBirkbeck/tauceti-explorer/issues/9295).

**Checkpoint; revision blocked by upstream ownership.** The bot confirmed this
session's [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/9295#issuecomment-6216596228)
on 16 October at 13:31:02 UTC. This was the first issue labelled available on
the manager's priority list, but its requested
blueprint revision has been superseded by a merged Tau Ceti roadmap. This note
records the obstruction; it does not complete or approve the mathematical
revision. No second issue was claimed.

This continues the checkpoints merged in [#9894](https://github.com/CBirkbeck/tauceti-explorer/pull/9894),
[#9951](https://github.com/CBirkbeck/tauceti-explorer/pull/9951),
[#9972](https://github.com/CBirkbeck/tauceti-explorer/pull/9972)
and [#9988](https://github.com/CBirkbeck/tauceti-explorer/pull/9988).
The reopened queue entry still carries the maintainer's
explicit 13 October instruction that further atlas blueprint rounds are
unnecessary. This run independently re-read the issue, review, previous handoff,
live GitHub merge metadata, the reviewed library audit, and current upstream
README and Suggested.lean ownership clauses after the claim. It also read the
supplied AlgebraicVectorBundles and ModularCurves roadmap documents and the
current-library relative-Spec files. No subsequent issue comment withdraws
the maintainer's instruction; availability of
the queue entry does not authorize a competing plan. No mathematical revision
was attempted.

## Authoritative upstream work

[TauCetiRoadmap PR #779](https://github.com/TauCetiProject/TauCetiRoadmap/pull/779)
merged on 14 October 2026 at 04:47:45 UTC, with merge commit
`d23fdaf388733bd9bcb0dc9b7963cc336f21461d`. It added the README,
Suggested.lean and metadata for `TauCetiRoadmap/SchemeAndStackFoundations/`.
Its Layer 0 is the schemes-and-morphisms direction assigned to this issue.

The current upstream files were separately inspected at main commit
`a46641603eb2cce60cea86900e44c3a5d856f91f`, rather than assuming the merge
version was still current. A fresh API check in this session confirms that
main commit (committed 16 October at 12:52:21 UTC) and the latest file changes below:

- [README, scope and ownership](https://github.com/TauCetiProject/TauCetiRoadmap/blob/a46641603eb2cce60cea86900e44c3a5d856f91f/TauCetiRoadmap/SchemeAndStackFoundations/README.md#scope-and-ownership).
- [README, Layer 0](https://github.com/TauCetiProject/TauCetiRoadmap/blob/a46641603eb2cce60cea86900e44c3a5d856f91f/TauCetiRoadmap/SchemeAndStackFoundations/README.md#layer-0-schemes-and-morphisms).
- [Suggested.lean](https://github.com/TauCetiProject/TauCetiRoadmap/blob/a46641603eb2cce60cea86900e44c3a5d856f91f/TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean).

Both files' latest change at that main commit is
[upstream PR #943](https://github.com/TauCetiProject/TauCetiRoadmap/pull/943),
merged as `d2081398eedfbd4153d3067aa98a21b5a5270957` on 16 October at
02:48:52 UTC. The current Layer 0 includes étale topological invariance
(§0.23a) and scheme Frobenius (§0.29), further evidence that the upstream
specification is actively maintained. This is an ownership check, not a
mathematical review of those additions.

Both the README and Suggested.lean have changed since the merge. The supplied
read-only roadmap checkout is at `0d144d044dacebca17b654695b6f1ad58f159b27`
and does not contain this directory; its absence there is not evidence that
the roadmap remains unplanned. Individual upstream files and GitHub merge
metadata establish the current owner. No repository was cloned or copied,
and neither shared checkout was modified or built.

The current Tau Ceti tree at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` was also read. Its
`RelativeSpec/Functor.lean` defines `QuasicoherentAlgebra`, `AffineSchemeOver`
and the contravariant `relativeSpec` functor; `RelativeSpec/Affine.lean`
supplies its affine normalization. These are current-library ownership
evidence, not baseline citations at the historical packet's older pins.

The maintainer's [13 October comment on this issue](https://github.com/CBirkbeck/tauceti-explorer/issues/9295#issuecomment-6147006432)
already directed changes to the upstream roadmap instead of additional atlas
blueprint rounds. The subsequent merge strengthens that boundary. The present issue comments
contain no later maintainer instruction authorizing a fresh atlas specification.
The `state:available` label was restored by automatic checkpoint intake after
#9988 at 13:24:43 UTC; it does not withdraw the explicit scope instruction.
[WORKERS.md](../WORKERS.md) and [PROTOCOL.md section 15](../PROTOCOL.md#15-build-on-existing-roadmaps-never-duplicate)
prohibit replanning existing Tau Ceti roadmaps. Applying the old review's
requested development here would create a competing specification.

## Preserved mathematical state

The packet, reader and suggested file are unchanged. In particular, the
independent `needs_changes` verdict remains in place, packet status is
`partial`, and `SchemeAndStackFoundations:SF.0` coverage remains `partial`.
Nothing is newly closed, planned or claimed implemented by this checkpoint.

The preserved inventory was recounted from the packet in this session:
139 nodes, comprising 26 definitions, 26 constructions,
75 theorems, six comparisons, three lemmas and three applications. Definitions
and constructions have 383 API items and 226 tests; across all nodes there are
462 API items and 283 tests. There are six planets, 492 baseline declarations,
six gaps and 11 requests. This session added no mathematical node, request,
source issue or ownership transfer.

The [independent review](../reviews/REV-SchemeAndStackFoundations--SF.0.md)
remains the inventory of the historical packet's six unresolved groups:
relative-Spec/vector-bundle ownership; the Eakin–Nagata proof input; field-case
desingularization inputs; generic flatness with finite presentation; the
projective-line and Chow/DVR supplier order; and omitted suggested interfaces
and discriminating examples. These are not certified as repaired by the
existence of the upstream roadmap. For any authorized follow-up, start from
the upstream specification and verify the particular claim there.

For orientation, the current upstream ownership clauses and §§0.1–0.3 import
AlgebraicVectorBundles' carriers; §§0.12–0.15 and §0.22 locate the henselization,
desingularization and counterexample targets; §0.8 states generic-fibre
spreading with finite presentation. The upstream Layer 0 dependency clause
does not import a later layer. These locators identify where to compare the
old review; they are not a new review verdict.

Confirmed finding `RT-AREA-algebraicgeometry/11` retains its existing handling:
SF.0 does not acquire Weil restriction. The upstream Layer 0 convention also
assigns it to ModularCurves 0F. No changes were made to the other owners or to
the Lawrence–Sawin route.

## Validation and resumption

- `python3 scripts/check_blueprint.py research/blueprint/packets/SchemeAndStackFoundations--SF.0.json`:
  zero errors, zero warnings on the unchanged packet. This is structural
  validation, not mathematical acceptance.
- No Lean file was changed or compiled in this session. The previous review's
  elaboration result is historical evidence only.
- `python3 research/blueprint/intake.py check-files` on this handoff:
  zero problems. The only changed deliverable is this handoff.
- No source book was needed. No external mathematical passage or upstream
  file was copied into the repository. All evidence needed to understand this
  checkpoint is linked above; no scratch file is needed to resume.

The maintainer should reconcile the stale atlas job with the merged upstream
owner before another worker is sent to this blueprint revision. In particular,
checkpoint intake has already released this same issue four times, after #9894,
#9951, #9972 and #9988. This is the fifth ownership-blocked submission; repeating the
same blueprint assignment cannot resolve the obstruction. The queue needs a
maintainer disposition rather than another attempt at the superseded plan.
Any mathematical
correction belongs against the current upstream roadmap, with a separately
specified scope. Changes to the base packet, its assembly, queue state or
upstream repository are outside this issue's permitted deliverables. This
session neither changes those files nor changes issue labels or closes the
issue. The outstanding atlas review has not been completed.
