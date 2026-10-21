# BP-ReductiveGroupsPartII~2: blocked ownership checkpoint

Codex session `codex-lWhJtL`, 21 October 2026. This is a **blocked checkpoint**;
the blueprint revision is unfinished. This note consolidates the previous
handoffs and preserves their actionable resume information.

## Claim and dispatch

Selected #9312, the first available issue on the assigned priority list;
#9215 and #10898 were blocked. The claim bot
[confirmed this session's claim](https://github.com/CBirkbeck/tauceti-explorer/issues/9312#issuecomment-6309579683)
in response to claim comment 6309577616.
The current dispatch explicitly authorized selecting this issue, despite the
older instruction against reclaiming it. It did not supply a distinct extension
scope or change the rule against duplicating existing Tau Ceti roadmaps.
No second issue was claimed.

## Blocking condition

The maintainer's
[upstream-only instruction](https://github.com/CBirkbeck/tauceti-explorer/issues/9312#issuecomment-6146995072)
and subsequent
[manager explanation](https://github.com/CBirkbeck/tauceti-explorer/issues/9312#issuecomment-6217692728)
identify this revision as superseded by TauCetiRoadmap PR #785. The latter
requires an upstream-owner request before an atlas extension is assigned.
The issue history through this session's claim confirmation contains no such
request or replacement scope. Asked the dispatcher in this session for a
distinct extension, its permitted deliverables, or an explicit instruction to work on the upstream
PR. No answer had arrived when this checkpoint was prepared. The missing
assignment, rather than elapsed run time, prevents the mathematical revision.

[PR #785](https://github.com/TauCetiProject/TauCetiRoadmap/pull/785) remains open
and ready for review at head `0d37c3f452ad9769ad7bfc257b5f283091814d85`.
Read the current
[README introduction and ownership boundaries, lines 1–150](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d37c3f452ad9769ad7bfc257b5f283091814d85/TauCetiRoadmap/ReductiveGroupsPartII/README.md#L1).
All seven assigned RG2 layers have that existing owner. Its exclusions identify
possible additions, including R-smoothness, the non-affine lft restriction of
scalars needed there, and more general fixer immersions. Those exclusions do
not assign an atlas extension. This was an ownership check, not a mathematical
review of upstream work.

WORKERS and PROTOCOL §15 prohibit planning those existing targets again.
The revision issue permits only the packet, reader, suggested file and this
handoff; it supplies no replacement roadmap identity or authority to change
routing files. Repeating the same dispatch cannot resolve that missing scope.

## Checks and preserved state

Read the worker rules, both protocols, upstream guidance, claimed issue,
maintainer and bot comments, independent review, inherited handoffs, packet
review, seven coverage lists and five gaps. Consulted accepted RS-31 and the
reviewed library audit's overlap records. The latter has no direct RG2 audit
records; its R09.3, ShimuraData D0 and integral-dual-group records identify the
Weil-restriction and dual-group ownership relevant here.

The supplied read-only roadmap checkout is at
`0d144d044dacebca17b654695b6f1ad58f159b27`. Read the introductions of
ReductiveGroups and OrthogonalSpinGroups, ReductiveGroups' suggested-file
opening, and the current Tau Ceti affine-group-scheme category source opening.
Part II is not present in that main checkout; its ownership section was read
directly at PR #785's head above. Neither supplied tree was edited or built.
No new pinned-library audit or mathematical-source verification is claimed. No cleared book was needed for
this ownership check.

Only this handoff changes. The packet, reader and suggested file retain their
inherited state:

| Item | Inventory |
|---|---:|
| Definitions | 23 |
| Constructions | 36 |
| Theorems | 110 |
| Comparisons | 2 |
| Applications | 9 |
| Total nodes | 180 |
| API items | 368 |
| Unit tests | 249 |
| Planets | 38 |
| Baseline declarations | 62 |
| Supplier requests | 17 |
| Gaps | 5 |

Packet status and RG2.0, RG2.0a, RG2.1, RG2.2, RG2.3, RG2.4 and RG2.5 remain
`partial`; the review remains `needs_changes`. No stage is closed or planned.
These are inventory counts, not a new correctness certification.

`python3 scripts/check_blueprint.py research/blueprint/packets/ReductiveGroupsPartII.json`
reports **zero errors and zero warnings**. Lean was not run because its file is
unchanged. The independent review records successful elaboration with admitted
proof warnings; that is historical evidence, not a compilation in this session.
No build, language server or background process was started. No suspicious
external instruction was encountered.

RT-AREA-algebraicgeometry/11 retains the independent review's disposition:
ModularCurves 0F supplies affine finite-presentation Weil restriction and the
plan retains the Yoneda compatibility import. This checkpoint makes no new
correctness claim, supplier request or source issue.

## Required manager action and resume point

Before dispatching this revision again, reconcile its availability with the
existing upstream owner. Existing-target changes belong on PR #785. For atlas
work beyond that owner, supply the upstream-owner request, extension identity,
stage boundaries, supplier links and permitted deliverables. A priority list
alone does not identify that additional mathematics. The `state:available`
label allowed selection but supplies no mathematical extension scope; repeated
handoff-only checkpoints have left this same condition unresolved.

Once that scope is assigned, resume at the independent review's fourteen-target
routing table and seven stage-specific coverage lists. Compare every retained
clause with the then-current upstream README, import the shared targets and
verify only the additional scope against its sources. Preserve stable node ids
where the assignment permits, the review object and its eight repairs. The
reader still needs those repairs if it is retained in the new scope.

The four mathematical gaps besides ownership are:

- the precise étale local-homeomorphism input for the smooth-open-map proof;
- primitive-element tensor presentation and CRT over a general splitting field;
- local trivialization, determinant invariance, gluing and base change for the
  finite locally free norm;
- non-affine lft Weil restriction, fixed-point and component interfaces for the
  full torus Néron-model application.

Renew the source and supplier checks for the assigned additions, synchronize the
reader, and run `lean-check` for any changed suggested file. None of those
mathematical gaps was resolved by this checkpoint.
