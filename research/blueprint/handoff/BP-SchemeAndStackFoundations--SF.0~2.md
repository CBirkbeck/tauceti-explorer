# BP-SchemeAndStackFoundations--SF.0~2: upstream ownership checkpoint

Codex, session `codex-wbDnMI`, 16 October 2026. Issue [#9295](https://github.com/CBirkbeck/tauceti-explorer/issues/9295).

**Checkpoint; revision blocked by upstream ownership.** The bot confirmed this
session's claim on 16 October. The issue was available, but its requested
blueprint revision has been superseded by a merged Tau Ceti roadmap. This note
records the obstruction; it does not complete or approve the mathematical
revision. No second issue was claimed.

## Authoritative upstream work

[TauCetiRoadmap PR #779](https://github.com/TauCetiProject/TauCetiRoadmap/pull/779)
merged on 14 October 2026 at 04:47:45 UTC, with merge commit
`d23fdaf388733bd9bcb0dc9b7963cc336f21461d`. It added the README,
Suggested.lean and metadata for `TauCetiRoadmap/SchemeAndStackFoundations/`.
Its Layer 0 is the schemes-and-morphisms direction assigned to this issue.

The current upstream files were separately inspected at main commit
`93d118965b336f893fdec7922b54ce0061b42854`, rather than assuming the merge
version was still current:

- [README, scope and ownership](https://github.com/TauCetiProject/TauCetiRoadmap/blob/93d118965b336f893fdec7922b54ce0061b42854/TauCetiRoadmap/SchemeAndStackFoundations/README.md#scope-and-ownership).
- [README, Layer 0](https://github.com/TauCetiProject/TauCetiRoadmap/blob/93d118965b336f893fdec7922b54ce0061b42854/TauCetiRoadmap/SchemeAndStackFoundations/README.md#layer-0-schemes-and-morphisms).
- [Suggested.lean](https://github.com/TauCetiProject/TauCetiRoadmap/blob/93d118965b336f893fdec7922b54ce0061b42854/TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean).

Both the README and Suggested.lean have changed since the merge. The supplied
read-only roadmap checkout is at `0d144d044dacebca17b654695b6f1ad58f159b27`
and does not contain this directory; its absence there is not evidence that
the roadmap remains unplanned. Individual upstream files and GitHub merge
metadata establish the current owner. No repository was cloned or copied,
and neither shared checkout was modified or built.

The maintainer's [13 October comment on this issue](https://github.com/CBirkbeck/tauceti-explorer/issues/9295#issuecomment-6147006432)
already directed changes to the upstream roadmap instead of additional atlas
blueprint rounds. The subsequent merge strengthens that boundary.
[WORKERS.md](../WORKERS.md) and [PROTOCOL.md section 15](../PROTOCOL.md#15-build-on-existing-roadmaps-never-duplicate)
prohibit replanning existing Tau Ceti roadmaps. Applying the old review's
requested development here would create a competing specification.

## Preserved mathematical state

The packet, reader and suggested file are unchanged. In particular, the
independent `needs_changes` verdict remains in place, packet status is
`partial`, and `SchemeAndStackFoundations:SF.0` coverage remains `partial`.
Nothing is newly closed, planned or claimed implemented by this checkpoint.

The preserved inventory is 139 nodes: 26 definitions, 26 constructions,
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
- No source book was needed. No external mathematical passage or upstream
  file was copied into the repository. All evidence needed to understand this
  checkpoint is linked above; no scratch file is needed to resume.

The maintainer should reconcile the stale atlas job with the merged upstream
owner before another blueprint revision is attempted. Any mathematical
correction belongs against the current upstream roadmap, with a separately
specified scope. Changes to the base packet, its assembly, queue state or
upstream repository are outside this issue's permitted deliverables. This
session neither changes those files nor changes issue labels or closes the
issue. The outstanding atlas review has not been completed.
