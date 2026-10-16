# BP-DiophantineApproximationAndTranscendence--DT.5 — blocked checkpoint

Issue: [#9323](https://github.com/CBirkbeck/tauceti-explorer/issues/9323).
Current worker: Codex, session `codex-WIcMGn`. Date: 2026-10-16.
Inherited checkpoint: session `codex-yYZ85W`, PR #10076.

The blueprint pass is **unfinished**. This checkpoint records an ownership
blocker and where to resume. It does not close `DiophantineApproximationAndTranscendence:DT.5`,
discharge the parent packet's gaps, or review the upstream mathematics.
No DT.5 packet, reader document or suggested Lean file was created.

## Current verification: codex-WIcMGn

The bot confirmed this run's claim in
[comment 6225659269](https://github.com/CBirkbeck/tauceti-explorer/issues/9323#issuecomment-6225659269),
identifying
[claim comment 6225656888](https://github.com/CBirkbeck/tauceti-explorer/issues/9323#issuecomment-6225656888).
The claim was selected from the manager's ordered list: #9293 was already
claimed by another session at the live recheck, and #9323 was available.
No second job was claimed.

This run independently rechecked the issue comments and complete label
timeline, the upstream PR's merge metadata, the live upstream README and
suggested signatures, the parent's full DT.5 coverage, and the reviewed DT.5
library audit (`AUDIT-07`, reviewed by `REV-AUDIT-07`). The ownership blocker
below is unchanged. In particular:

- The issue timeline records the maintainer setting `state:blocked` on
  October 13 and `github-actions[bot]` restoring `state:available` nineteen
  minutes later. The later releases, including the release after #10076,
  were automated. No subsequent maintainer instruction reopens the atlas
  blueprint.
- Upstream #855 remains merged at
  `d4e8100e0d2f23e0b03863b6a2cbdcb240d7c9bd`; the current README blob remains
  `60448201df6b4af0d1865317aeb2d138b6c8d375`. Its Layer 5 expressly owns the
  special-function and functional-transcendence development. Sections
  5.1–5.7 and the corresponding Layer 5 signatures provide the ownership
  locations retained below. This is an ownership check, not a mathematical
  review or a claim that inherited proof gaps are discharged.
- Both supplied read-only checkouts retain the commits recorded below. The
  roadmap directory itself was inspected: its absence of this newly merged
  roadmap does not supersede live upstream main. Neither checkout was
  modified or built.

Only this handoff was changed. There are zero new nodes, API items, tests,
planets, baseline claims or requests. DT.5 remains partial in the parent;
there is no new packet to validate and no new Lean file to compile.
Validation for this checkpoint is the intake file check and
`git diff --check`. The missing input is an ownership/scope decision from the
maintainer, rather than a source, Lean dependency or additional research
time. Continuing inside the authorized atlas paths would repeat existing
upstream planning; changing the upstream roadmap is outside those paths.

The sections below retain the inherited target map and resumption boundary.
The claim details in the next section describe the previous run.

## Claim and blocker

The bot confirmed this session's claim at 21:32:16 UTC in
[comment 6225102551](https://github.com/CBirkbeck/tauceti-explorer/issues/9323#issuecomment-6225102551),
identifying this session's
[claim comment 6225100183](https://github.com/CBirkbeck/tauceti-explorer/issues/9323#issuecomment-6225100183).
The issue was labelled `swarm`, `state:available`, `top` and `kind:blueprint`
when selected. The earlier candidate #9293 was won by another worker; this
session's claim attempt there was rejected. This session holds only #9323.

The maintainer's
[2026-10-13 instruction](https://github.com/CBirkbeck/tauceti-explorer/issues/9323#issuecomment-6146991528)
stops further atlas blueprint rounds because the authoritative roadmap moved
to TauCetiRoadmap. The live issue timeline shows the maintainer removing
`state:available` at 13:45:58 UTC and adding `state:blocked` at 13:45:59 UTC.
Automation restored availability and removed the blocked label at 14:04:04 UTC.
A subsequent worker claimed and released the issue on 2026-10-16, without a
new maintainer instruction reopening the blueprint.

The upstream roadmap has since **merged**:
[TauCetiRoadmap PR #855](https://github.com/TauCetiProject/TauCetiRoadmap/pull/855),
merged on 2026-10-14 at 03:01:33 UTC, merge commit
`d4e8100e0d2f23e0b03863b6a2cbdcb240d7c9bd`.
Its authoritative
[README at that commit](https://github.com/TauCetiProject/TauCetiRoadmap/blob/d4e8100e0d2f23e0b03863b6a2cbdcb240d7c9bd/TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md)
and
[Suggested.lean](https://github.com/TauCetiProject/TauCetiRoadmap/blob/d4e8100e0d2f23e0b03863b6a2cbdcb240d7c9bd/TauCetiRoadmap/DiophantineApproximationAndTranscendence/Suggested.lean)
were inspected. The live main-branch README had the same Git blob
`60448201df6b4af0d1865317aeb2d138b6c8d375` when checked on 2026-10-16.

[PROTOCOL section 15](../PROTOCOL.md#15-build-on-existing-roadmaps-never-duplicate)
treats Tau Ceti roadmaps, including open roadmap pull requests, as existing
work that is never re-planned here. The issue authorizes edits only to its
atlas deliverables and handoff. Repeating the merged roadmap would violate
that ownership rule; changing the upstream roadmap is outside this job's
deliverables. These conflicting instructions require a maintainer decision.

## Locations of the inherited targets

The parent packet's DT.5 coverage remains `partial`. Its continuation list
contains more work than the abbreviated list in the issue. Read the full
record in `research/blueprint/packets/DiophantineApproximationAndTranscendence.json`
before any replacement assignment. The following table locates related
targets in the merged upstream README. It is an ownership map, not a verdict
that every inherited proof gap has been resolved.

| Inherited target or gap | Location in the merged roadmap |
| --- | --- |
| D-finite carriers, minimal equations and solutions restricted to a positive-radius disc | Section 5.1, including solution-space evaluation and scalar initial jets. |
| E/G-functions, coefficient fields and the Laplace boundary correction | Section 5.2, including the coefficient-field API and `formalLaplaceOperatorTransfer`. |
| Factorial-normalized iterates, Galochkin denominators and Shidlovskii proof inputs | Sections 5.3–5.4. Section 5.3's regular-singularity target is at zero; do not identify it with the parent's requested global Bombieri–André–Katz chain. |
| Finite-type fibre dimension, Kähler rank and differential Galois inputs to Beukers | Section 5.4, including the fibre adapter, Picard–Vessiot/analytic comparisons, orbit spanning and conjugate-compositum targets. |
| Nishioka and Mahler relation lifting, singularity removal and value descent | Section 5.5, including the AF22 auxiliary-identity route, specialization of relation ideals, local-to-global transport and the nonpole continuation interface. |
| Nesterenko, multiplicity estimates and the independence criterion | Section 5.6, in the modular-value branch, with zero estimates, auxiliary polynomials and the derivative-selection step. |
| Algebraic Cartan calculus, Chevalley/subgroup inputs and arbitrary-constant-field descent in Ax–Schanuel | Section 5.6, in the separate functional-transcendence branch; ordinary differential forms are imported from DerivedDeRhamCohomology. |
| Schanuel-dependent consequences | Sections 3.8 and 5.7 retain an explicit conjectural hypothesis. Period statements and arithmetic unlikely intersections need their separate owners checked against the parent's recorded boundaries. |

The supplied read-only roadmap checkout was inspected at commit
`0d144d044dacebca17b654695b6f1ad58f159b27`. Its `TauCetiRoadmap/` directory does
not contain this roadmap. That checkout predates PR #855's merge; its absence
there does not override the live upstream README. The supplied current Tau Ceti
library was identified at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Neither supplied tree was changed or built.

## Coverage, checks and resumption

- The reviewed DT.5 entry in `data/library-coverage.json` was read, together
  with its `REV-AUDIT-07` review record. It records missing implementation of
  the special-function and functional-transcendence targets and overlaps with
  other atlas owners. Missing implementation does not authorize a second
  roadmap for an existing target.
- New nodes by kind: zero definitions, constructions, lemmas, theorems,
  comparisons and applications. Added API items, unit tests, planets,
  baseline declarations and supplier requests: zero. No mathematical gap was
  discharged and no stage was marked closed.
- Lean was **not compiled**: no suggested file was created or changed. There
  is no new packet for `scripts/check_blueprint.py`. The applicable checks
  are `research/blueprint/intake.py check-files` on this handoff and
  `git diff --check`.
- No paper or book was used to assert a new mathematical result. Reading was
  limited to the worker protocols, the issue and its timeline, the parent
  coverage and target inventory, the reviewed library audit, upstream status
  and the merged README's Layer 5 targets and suggested signatures. Source
  proofs were not reverified, so their gaps remain as recorded in the parent.

The maintainer needs to reconcile this obsolete blueprint issue with the
merged roadmap and the automated label reset. A replacement assignment can
authorize changes to the authoritative upstream roadmap for any remaining
mathematical need, including the parent's global differential-arithmetic
chain. No additional work inside this issue's edit scope resolves the
ownership decision. A resuming worker should first check that decision and
the current upstream roadmap. This checkpoint changes neither issue labels
nor upstream files. No second job was claimed.
