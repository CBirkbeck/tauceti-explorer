# Blocked checkpoint: SF.1 already has an upstream owner

Job `BP-SchemeAndStackFoundations--SF.1~2`, issue #9296; Codex session
`codex-h4IgYc`, 2026-10-19. The bot
[confirmed this session’s claim](https://github.com/CBirkbeck/tauceti-explorer/issues/9296#issuecomment-6265076732)
at 10:26:09 UTC.
This run claimed no second job. **The blueprint revision remains unfinished.**
This note consolidates the previous ownership checkpoints; their history remains
in Git and the issue discussion.

## Blocking instruction and resume condition

The [maintainer’s instruction of 2026-10-13](https://github.com/CBirkbeck/tauceti-explorer/issues/9296#issuecomment-6147004968)
stops further atlas blueprint rounds: the upstream roadmap is authoritative and
changes belong there. This run read that comment through the live GitHub API,
read the issue discussion, and fetched the issue again after the bot confirmed
its claim. The issue body was unchanged. No subsequent comment supplies a new
mathematical scope. The automatic release after a checkpoint does not change
that instruction. WORKERS.md and PROTOCOL.md §15 also prohibit replanning
existing upstream work. The run instructions require a checkpoint when blocked.

**Resume condition:** the maintainer must retire or redirect this queue assignment.
Any proposed correction needs comparison with the authoritative upstream contract
and an assignment in its owning repository. A genuine extension needs an explicit
Part II scope. Another availability label alone supplies neither. Workers must
not change labels, close issues or edit the queue themselves.

The queue still advertised this issue as the sole available `top` assignment
when this run selected it. That conflicts with the maintainer's explicit stop
instruction. Read that instruction before any subsequent claim; another worker
cannot resolve the ownership conflict by repeating the revision or this check.

## Ownership evidence checked in this run

The authenticated GitHub API confirms that
[upstream PR #779](https://github.com/TauCetiProject/TauCetiRoadmap/pull/779)
merged on 2026-10-14 at 04:47:45 UTC, merge commit
`d23fdaf388733bd9bcb0dc9b7963cc336f21461d`.
At this run's ownership check, upstream main is
`69bd802abd021be5efb158896d7c4930bd0775b0`, dated
2026-10-19 05:24:57 UTC.

I read the ownership statement, Layer 1 scope and §§1.1–1.5 of the
[authoritative README](https://github.com/TauCetiProject/TauCetiRoadmap/blob/69bd802abd021be5efb158896d7c4930bd0775b0/TauCetiRoadmap/SchemeAndStackFoundations/README.md#layer-1-descent-algebraic-spaces-and-stacks).
They explicitly own quasi-coherent descent, algebraic spaces and their category,
quotients, sites, stacks, moduli spaces and Galois gerbs. I also read the native
algebraic-space predicates, full-subcategory carrier, fibre-product interface and
continuous semilinear descent statements in the
[upstream suggested file](https://github.com/TauCetiProject/TauCetiRoadmap/blob/69bd802abd021be5efb158896d7c4930bd0775b0/TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean).
These establish ownership only; they do not review upstream mathematics or
certify implementations. The old atlas gaps are not thereby upstream defects.
For RT-AREA-algebraicgeometry/1, the general theory retains one upstream owner;
R09.3/R09.4 remain consumers. No consumer edges or supplier requests change here.

The supplied read-only roadmap tree remains at pre-merge commit
`0d144d044dacebca17b654695b6f1ad58f159b27`; its absence of this roadmap cannot
establish missing upstream work. The supplied Tau Ceti tree remains at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Neither tree was modified.
No Lake command, Lean process, mathematical source download or library build
was needed for this ownership check.

## Preserved work and validation

Only this handoff changes. The packet, reader and suggested file retain their
existing content. The independent review remains `needs_changes`; the packet
and SF.1 coverage remain `partial`. This checkpoint does not claim the
requested mathematical revision is complete.

`python3 scripts/check_blueprint.py research/blueprint/packets/SchemeAndStackFoundations--SF.1.json`
reports zero errors and zero warnings. The preserved inventory is 58 nodes
(19 definitions, 15 constructions, 24 theorems), 191 API items, 136 unit tests,
four planets, 83 baseline declaration entries, eleven gaps and four requests.
Lean was not run because no Lean changed. The submission also passes the
intake file check and `git diff --check`.

The exact unfinished mathematical ledger remains in the packet’s `gaps` and
coverage `remaining` lists and
[the independent review](../reviews/REV-SchemeAndStackFoundations--SF.1.md).
It includes reader/signature disagreements, geometric input constructions,
size bounds and infinite-Galois comparison obligations. Those are historical
atlas obligations, not authorization to re-plan the upstream roadmap. Preserve
the existing node ids and review object if the maintainer supplies an applicable
new scope. All continuation evidence is linked here; no scratch file is needed.

The older [draft checkpoint #9996](https://github.com/CBirkbeck/tauceti-explorer/pull/9996)
also remains open. This run does not replace it or change its state. The
release after [checkpoint #10677](https://github.com/CBirkbeck/tauceti-explorer/pull/10677)
(merged 2026-10-19 at 10:19:48 UTC) supplied no new scope or reversal of the
maintainer’s instruction. All non-bot comments were checked; the only
maintainer direction beyond claim-management comments remains the stop above.

## This checkpoint

Session `codex-h4IgYc` changes only this handoff to persist its confirmed claim
and current ownership check. Submission uses branch
`codex-h4IgYc-sf1-checkpoint`. The mathematical deliverables remain unfinished
for the reason above. The maintainer must retire or redirect #9296 before
mathematical revision resumes; repeating this ownership check cannot supply
the missing assignment.
