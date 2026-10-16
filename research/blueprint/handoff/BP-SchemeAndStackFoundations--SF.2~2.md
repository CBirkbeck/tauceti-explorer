# BP-SchemeAndStackFoundations--SF.2~2: blocked checkpoint

Codex, session `codex-GfBCDE`, 2026-10-16. Refs #9297.

## Blocker and claim

The manager's [supersession instruction](https://github.com/CBirkbeck/tauceti-explorer/issues/9297#issuecomment-6217689380)
explicitly prohibits further claims until the upstream owner requests an
extension. The earlier [maintainer instruction](https://github.com/CBirkbeck/tauceti-explorer/issues/9297#issuecomment-6147003570)
also directs changes to the authoritative upstream roadmap. The automated
`state:available` label conflicts with these instructions.

This session read the issue body before claiming but missed those comments.
That was a selection error. The bot confirmed the claim in
[comment 6224302051](https://github.com/CBirkbeck/tauceti-explorer/issues/9297#issuecomment-6224302051).
The run requires a checkpoint when blocked and prohibits claiming a second
job. This submission records that stop; it does not complete the revision.

## Ownership evidence checked this run

Fresh GitHub API reads confirm that the original roadmap
[TauCetiRoadmap #779](https://github.com/TauCetiProject/TauCetiRoadmap/pull/779)
merged at `2026-10-14T04:47:45Z`, commit
`d23fdaf388733bd9bcb0dc9b7963cc336f21461d`. Its étale-invariance and
scheme-Frobenius follow-up
[#943](https://github.com/TauCetiProject/TauCetiRoadmap/pull/943)
merged at `2026-10-16T02:48:52Z`, commit
`d2081398eedfbd4153d3067aa98a21b5a5270957`.

The current upstream
[README](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md)
is blob `2c1ac67cd7089b29de2c3a24ad3999eb35fe04a5`; its
[Suggested.lean](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean)
is blob `98d33af8657ee848f176ba05b2a2037d8f1bfaf6`. Their relevant Layer 2
interfaces were inspected. This job's sites and cohomology scope is owned
there, including Nisnevich foundations (§§2.12–2.14), derived quasi-coherent
categories and coherent duality (§§2.18–2.21), scheme Brauer groups and the
Azumaya splitting-gerbe class (§2.22), and semilinear equivariant cohomology
(§2.23). The abelian-boundary scope restriction in §2.4 does not itself
authorize an extension. Under WORKERS.md and PROTOCOL.md §15 these targets
cannot be re-planned here. This is an ownership check, not an upstream
correctness review or a claim of formalisation.

The supplied read-only roadmap checkout lacks this directory, so current
GitHub main supplied the ownership evidence. The current Tau Ceti
scheme-module cohomology source was also inspected. Neither shared checkout
was changed or built. No mathematical source passages were copied into the
repository.

## Mathematical state retained

Only this handoff changes; repeated earlier claim audits have been
consolidated here and remain available in Git history. The packet, reader,
suggested file and independent review retain their received contents:

- Packet status: `partial`; `SchemeAndStackFoundations:SF.2` coverage: `partial`.
- 85 nodes: 7 definitions, 17 constructions, 49 theorems, 5 lemmas, 7 comparisons.
- 160 API items; 87 definition/construction unit tests and one theorem test.
- 3 packet planets; 89 baseline declarations; 11 gaps; 9 supplier requests.

The outstanding mathematical work remains specified by the packet's
`coverage.remaining`, `gaps` and `review`, together with
[the independent review](../reviews/REV-SchemeAndStackFoundations--SF.2.md).
In particular, the review's gerbe-classification bridge and suggested
carrier/API/test corrections have not been discharged. No new supplier
request or ownership move is made.

Validation this run:

- `python3 scripts/check_blueprint.py research/blueprint/packets/SchemeAndStackFoundations--SF.2.json`:
  **0 errors, 0 warnings**.
- `git diff --check`: passed.
- The suggested Lean file was not changed or compiled; this checkpoint edits
  the handoff only.

## Maintainer action before resumption

Reconcile the queue entry with the supersession instruction. Mathematical
work can resume only with an explicitly specified extension beyond the
upstream roadmap, or with concrete changes routed to its upstream owner.
Returning the label to `state:available` supplies no such scope.

This checkpoint is submitted as a **draft pull request**. WORKERS.md's
submission rules and `research/blueprint/intake.py` leave drafts for the
maintainer, while the submission workflow marks the associated issue
`state:submitted`. This avoids automatically merging another blocked
checkpoint and releasing the same superseded job for another worker.
The maintainer should resolve the ownership/queue conflict before deciding
its disposition. No second issue was claimed. No scratch material is needed
to understand or resume from this handoff.
