# Blocked checkpoint: SF.1 already has an upstream owner

Job `BP-SchemeAndStackFoundations--SF.1~2`, issue #9296; Codex session
`codex-R2OA2e`, 2026-10-19. The bot
[confirmed this session’s claim](https://github.com/CBirkbeck/tauceti-explorer/issues/9296#issuecomment-6262867747).
This run claimed no second job. **The blueprint revision remains unfinished.**
This note consolidates the previous ownership checkpoints; their history remains
in Git and the issue discussion.

## Blocking instruction and resume condition

The full issue body and all comments returned by the live issue query were read;
the issue was re-read after the bot confirmed this claim. The
[maintainer’s instruction of 2026-10-13](https://github.com/CBirkbeck/tauceti-explorer/issues/9296#issuecomment-6147004968)
stops further atlas blueprint rounds: the upstream roadmap is authoritative and
changes belong there. No subsequent comment supplies a new mathematical scope.
The automatic release after a checkpoint does not change that instruction.
WORKERS.md and PROTOCOL.md §15 also require importing existing upstream work.
The run instructions require a checkpoint when blocked, so this submission
records the obstruction rather than duplicating the upstream plan.

**Resume condition:** the maintainer must retire or redirect this queue assignment.
Any proposed correction needs comparison with the authoritative upstream contract
and an assignment in its owning repository. A genuine extension needs an explicit
Part II scope. Another availability label alone supplies neither. Workers must
not change labels, close issues or edit the queue themselves.

## Ownership evidence checked in this run

The authenticated GitHub API confirms that
[upstream PR #779](https://github.com/TauCetiProject/TauCetiRoadmap/pull/779)
merged on 2026-10-14 at 04:47:45 UTC, merge commit
`d23fdaf388733bd9bcb0dc9b7963cc336f21461d`.
The upstream main inspected here is
`69bd802abd021be5efb158896d7c4930bd0775b0`, dated 2026-10-19
05:24:57 UTC. The cached browser PR page still showed an open PR; the live
API and files at this main commit establish the merged status.

I read the [Layer 1 scope and relevant README contracts](https://github.com/TauCetiProject/TauCetiRoadmap/blob/69bd802abd021be5efb158896d7c4930bd0775b0/TauCetiRoadmap/SchemeAndStackFoundations/README.md#layer-1-descent-algebraic-spaces-and-stacks)
and [corresponding suggested declarations](https://github.com/TauCetiProject/TauCetiRoadmap/blob/69bd802abd021be5efb158896d7c4930bd0775b0/TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean):

- §§1.1–1.4 own quasi-coherent descent and algebraic spaces, their predicates
  and category. The suggested file contains native predicates and the full
  subcategory of algebraic spaces.
- §1.10 owns the enlarged small étale site, comparison with its scheme
  subsite, and the ringed-topos interface for arbitrary space morphisms.
- §1.22 owns the quasi-coherent right adjoint and its flat-test comparison,
  distinguishing it from unrestricted big-site direct image.
- §1.24 owns continuous semilinear Galois descent. The suggested carrier
  explicitly requires open stabilizers, and its theorem states an equivariant
  scalar-extension isomorphism.

These checks establish ownership only. They do not review upstream mathematics,
certify implementations or identify the old atlas gaps as upstream defects.
For RT-AREA-algebraicgeometry/1, the general theory retains one upstream owner;
R09.3/R09.4 remain consumers. No consumer edges or supplier requests change here.

The supplied read-only roadmap checkout is at the pre-merge commit
`0d144d044dacebca17b654695b6f1ad58f159b27` and lacks this roadmap. Its absence
there cannot establish missing upstream work. The supplied Tau Ceti checkout
is at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; I read its finite-Galois spanning and injectivity
interfaces without changing it. Neither
checkout was modified; no Lake command or Lean process was started. No
mathematical paper or book was needed for this ownership check.

## Preserved work and validation

Only this handoff changes. The packet, definitive reader and suggested file
retain their existing content. The independent review remains `needs_changes`;
the packet and SF.1 coverage remain `partial`. This checkpoint does not claim
the requested mathematical revision is complete.

`python3 scripts/check_blueprint.py research/blueprint/packets/SchemeAndStackFoundations--SF.1.json`
reports zero errors and zero warnings. The preserved inventory is 58 nodes
(19 definitions, 15 constructions, 24 theorems), 191 API items, 136 unit tests,
four planets, 83 baseline declaration entries, eleven gaps and four requests.
Lean was not run because no Lean changed. The submission also passes the
intake file check and `git diff --check`.

This session rechecked the live upstream API and read the Layer 1 scope,
§§1.1–1.4, §1.10, §1.22 and §1.24 and their available suggested forms at the
commit above. The reviewed SF.1 library audit and the current finite-Galois
spanning/injectivity source statements were also read. No baseline claim or
mathematical target was added. The release after checkpoint #10623 supplied no
new scope or reversal of the maintainer’s instruction. The older
[draft checkpoint #9996](https://github.com/CBirkbeck/tauceti-explorer/pull/9996)
also remains open; this run does not replace it or change its state. The supplied
roadmap tree remains at its pre-merge commit, so the live upstream files are necessary to resolve ownership. The
assignment still needs maintainer disposition before mathematical work resumes.

The exact unfinished mathematical ledger remains in the packet’s `gaps` and
coverage `remaining` lists and
[the independent review](../reviews/REV-SchemeAndStackFoundations--SF.1.md).
It includes the reader/signature disagreements, geometric input constructions,
size bounds and infinite-Galois comparison obligations. Those are historical
atlas obligations, not authorization to re-plan the upstream roadmap. Preserve
the existing node ids and review object if the maintainer supplies an applicable
new scope. All continuation evidence is linked here; no scratch file is needed.

## This checkpoint

Session `codex-R2OA2e` changes only this handoff to persist its claim and current
ownership check. The run explicitly requires a checkpoint when blocked; the
mathematical deliverables remain unfinished for the reason above. Submission
uses branch `codex-R2OA2e-sf1-checkpoint`. No second issue was claimed. The
maintainer must retire or redirect #9296 before another mathematical revision:
repeating this ownership check cannot supply the missing assignment.
