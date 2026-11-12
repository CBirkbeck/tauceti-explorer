# BP-SchemeAndStackFoundations--SF.4~2: blocked by upstream ownership

Issue: #9299. Worker: Codex, session `codex-UJF1XI`, 19 October 2026.
**Checkpoint only: the blueprint revision remains unfinished.**

## Decision needed before resuming

The maintainer's [16 October instruction](https://github.com/CBirkbeck/tauceti-explorer/issues/9299#issuecomment-6217691180)
prohibits further claims until the upstream owner requests an extension. The
[13 October instruction](https://github.com/CBirkbeck/tauceti-explorer/issues/9299#issuecomment-6147000401)
already assigned further roadmap changes upstream. No subsequent scope assignment
appears in the issue discussion inspected in this session.

The bot nevertheless [confirmed this session's claim](https://github.com/CBirkbeck/tauceti-explorer/issues/9299#issuecomment-6262847291)
for [comment 6262844836](https://github.com/CBirkbeck/tauceti-explorer/issues/9299#issuecomment-6262844836).
I read the issue body before claiming but missed the supersession comments.
The automatic availability label and confirmation do not assign an extension.
This run takes no second job.

WORKERS.md and PROTOCOL.md section 15 prohibit replanning an existing Tau Ceti
roadmap. This issue permits only its historical packet, reader, suggested file
and handoff; it does not assign an upstream amendment or a new Part II.
The blocker is scope, not available time or source access.

The maintainer must choose one concrete outcome: retire this obsolete revision;
assign atlas synchronization, specifying treatment of excluded targets; or assign
a precise Part II with its permitted deliverables. Changes to the authoritative
roadmap require an upstream assignment. Do not resume the old revision merely
because it is labelled available. Repeated automatic checkpoint release has
already reproduced this blocker. This checkpoint is submitted as a draft so
intake leaves that routing decision with the maintainer.

## Ownership evidence checked in this session

The live GitHub API reports [upstream PR 779](https://github.com/TauCetiProject/TauCetiRoadmap/pull/779)
merged on 14 October 2026 at 04:47:45 UTC, at
`d23fdaf388733bd9bcb0dc9b7963cc336f21461d`. The current upstream main inspected
is `69bd802abd021be5efb158896d7c4930bd0775b0`, dated 19 October 2026 at
05:24:57 UTC. Its authoritative files are:

- [SchemeAndStackFoundations README](https://github.com/TauCetiProject/TauCetiRoadmap/blob/69bd802abd021be5efb158896d7c4930bd0775b0/TauCetiRoadmap/SchemeAndStackFoundations/README.md).
- [Suggested.lean](https://github.com/TauCetiProject/TauCetiRoadmap/blob/69bd802abd021be5efb158896d7c4930bd0775b0/TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean).

The introduction, Layer 4 conventions, subsection inventory and relevant scope
passages establish the following ownership boundaries. These observations are
an ownership check, not a mathematical review of upstream or closure of the
historical packet's gaps.

| Historical SF.4 targets | Authoritative upstream scope |
| --- | --- |
| Thickenings, lifting, deformation functors, hulls | Sections 4.1–4.4 |
| Elementary natural tensor-valued obstruction theories | Section 4.5; arbitrary finite-dimensional kernels and hull-relation bounds are excluded |
| Algebra, scheme, line-bundle and node deformations | Section 4.6 |
| Formal spectra, completion and coherent modules | Sections 4.7–4.8 use chosen ideals and level-preserving adic systems; comparison with genuine topologically locally ringed formal schemes and independence of ideals are excluded |
| Formal functions and Stein factorization | Section 4.9 |
| Coherent existence and compatible-morphism algebraization on given proper schemes | Section 4.10; polarized-system algebraization, its category equivalence and effective formal curve deformations are excluded |
| Modifications, strict transforms, flattening and Chow | Sections 4.11–4.12 |
| Regularity, curve normalization, Serre's criterion, Bertini | Section 4.13; normalization uses the generic-point map rather than the identity |
| Hilbert and Quot schemes | Section 4.14; the Grassmannian is imported from ModularCurves 0G |
| Pointed stable moduli, properness, level covers and extension | Section 4.15 |
| Alterations, normal crossings and fibration inputs | Sections 4.16–4.18 |
| Field alteration theorem | Section 4.19; the generically étale choice requires a perfect field |
| Trait geometry and semistable alterations | Section 4.20 |

The supplied read-only roadmap checkout is at
`0d144d044dacebca17b654695b6f1ad58f159b27` and lacks this newer roadmap, so
current upstream files were read through GitHub. I also inspected its nearby
StableReduction and AlgebraicVectorBundles introductions and the current Tau
Ceti model declaration at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Neither shared checkout was modified or built. No primary mathematical source
or private book was needed for this ownership check.

## Preserved mathematical state and resumption worklist

The packet, reader and suggested Lean file are unchanged. Packet status and
SF.4 coverage remain `partial`; the independent `needs_changes` review is
preserved. Inventory: **57 nodes** (17 definitions, 4 constructions, 32 theorems,
3 lemmas, 1 application), **139 API items, 91 unit tests, 6 planets,
79 baseline references, 9 gaps and 10 supplier requests**. No new mathematical
request or implementation claim is made.

The complete historical correction ledger is in
[the independent review](../reviews/REV-SchemeAndStackFoundations--SF.4.md).
Exact affected nodes, hypotheses, sources and outstanding obligations remain
in [the packet](../packets/SchemeAndStackFoundations--SF.4.json), especially its
`gaps`, `requests`, `coverage` and `review` records. Its nine gaps are:

1. Pointed moduli inputs rest on an unread source.
2. Inputs from sibling layers SF.0–SF.3 planned in parallel.
3. Regular local rings are normal domains (absent from Mathlib).
4. Natural obstruction theories and the hull relation bound.
5. Sheaf and continuous cotangent comparisons.
6. Formal schemes, reindexing and algebraization prerequisites.
7. Absolute normalization adapter.
8. Hilbert construction key prerequisites.
9. Stable moduli and extension supplier bridges.

The coverage record also retains all routed-paper and consumer obligations
beyond the original pass, including approximation, toroidal reduction,
low-dimensional resolution, formal-loop gluing, non-Noetherian formal geometry
and additional curve-fibration inputs. These obligations must be routed against
the authoritative upstream scope; they are not implicitly discharged by its
merge. The old reader still needs synchronization with the independent review
if a synchronization job is assigned.

The historical ownership decisions for RT-AREA-algebraicgeometry/16 and
RT-AREA-etale/21 put schematic alterations in SF.4, with L5/RD.5 consuming them;
RT-AREA-algebraicgeometry/17 puts stable pointed moduli here at the foundational
tier, importing StableReduction's object-level families and DVR reduction.
No analytic H1/H5 prerequisite is introduced. Those decisions are preserved,
not re-adjudicated here. Compare them with the upstream ownership before any
new atlas synchronization; do not create a duplicate alteration or moduli carrier.

This consolidated handoff replaces the accumulated repeated blocker reports.
Earlier checkpoint history remains in Git and the issue discussion; no file
from this run's disposable scratch directory is needed to resume.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/SchemeAndStackFoundations--SF.4.json`: zero errors and zero warnings.
- `python3 research/blueprint/intake.py check-files research/blueprint/handoff/BP-SchemeAndStackFoundations--SF.4~2.md`: passed.
- `git diff --check`: passed.
- Lean was not rerun because its file is unchanged. Earlier elaboration reports
  are not a compilation performed by this session.
