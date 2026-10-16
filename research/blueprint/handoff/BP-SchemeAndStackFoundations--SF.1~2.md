# Checkpoint: SF.1 revision superseded by its upstream roadmap

Job `BP-SchemeAndStackFoundations--SF.1~2`, issue #9296. Worker: Codex,
session `codex-epJCBn`, 2026-10-16. Continues the ownership checkpoint merged in
[atlas PR #9959](https://github.com/CBirkbeck/tauceti-explorer/pull/9959).

**Blocked by the upstream ownership boundary; the revision is unfinished.**
No mathematical deliverable was changed. The packet remains `partial`, SF.1
coverage remains `partial`, and the independent review remains `needs_changes`.
This checkpoint records why repeating the requested blueprint revision would
violate PROTOCOL.md §15. It does not accept the old plan or certify the upstream
roadmap's mathematics.

This session rechecked the issue after the bot confirmed its claim. The
maintainer's October 13 instruction is still present, with no subsequent
authorization to resume blueprint revisions. The authenticated GitHub API still
reports upstream PR #779 as merged and upstream main at
`4c4f8f52238b8ead04f806021f79201c6d499982`. The supplied read-only checkout
still predates that merge. I read the upstream Layer 1 scope, §§1.1–1.4,
§§1.10–1.11, §1.22 and §1.24, and the corresponding algebraic-space and
continuous-semilinear-action declarations. Those targets remain owned upstream.
This confirms the existing blocker; it provides no authorization to revise
the upstream roadmap or to create a second plan here.

## Claim and authoritative evidence

The issue carried `swarm` and `state:available` when selected and was the first
available issue in the session's explicit priority list. The bot
[confirmed this session's claim](https://github.com/CBirkbeck/tauceti-explorer/issues/9296#issuecomment-6215289188).
However, the issue also has an
[October 13 maintainer instruction](https://github.com/CBirkbeck/tauceti-explorer/issues/9296#issuecomment-6147004968)
that further blueprint rounds are unnecessary because the upstream roadmap is
authoritative. Its available label did not resolve that scope conflict.

GitHub's authenticated API reports that
[TauCetiRoadmap PR #779](https://github.com/TauCetiProject/TauCetiRoadmap/pull/779)
merged on 2026-10-14 at 04:47:45 UTC, with merge commit
`d23fdaf388733bd9bcb0dc9b7963cc336f21461d`.
The upstream main head inspected in this run was
`4c4f8f52238b8ead04f806021f79201c6d499982`.
The supplied read-only roadmap checkout was instead at
`0d144d044dacebca17b654695b6f1ad58f159b27`, dated October 11;
it does not contain the merged SchemeAndStackFoundations directory.
That absence therefore cannot establish that the roadmap is missing upstream.
No checkout was updated, cloned or copied.

I inspected the public upstream README and the corresponding Layer 1 suggested
declarations through the GitHub API. The stable source is
[SchemeAndStackFoundations at the inspected main commit](https://github.com/TauCetiProject/TauCetiRoadmap/tree/4c4f8f52238b8ead04f806021f79201c6d499982/TauCetiRoadmap/SchemeAndStackFoundations).
Its Layer 1 owns the general descent, space, stack, torsor and moduli targets
that this issue asks the atlas to plan again. In particular, the old review's
small-site and QCoh-interface work lies within README §§1.10–1.11 and §1.22;
the Galois-descent interface lies within §1.24. The suggested file already uses
native algebraic-space carriers and a continuous-semilinear-action carrier.
These observations establish ownership, not that every old review obligation
has been discharged.

PROTOCOL.md §15 treats even open upstream roadmap PRs as existing work and
prohibits replanning them here. The issue permits changes only to its atlas
packet, reader, suggested file and this handoff. Its remaining instructions
therefore provide no authorized route to revise the authoritative upstream
roadmap. Opening another blueprint plan would also create a competing owner.

## Preserved work and precise resume point

The existing independent report,
[REV-SchemeAndStackFoundations--SF.1.md](../reviews/REV-SchemeAndStackFoundations--SF.1.md),
is the resume ledger. The packet's `review.checked` retains every verdict and
node identifier. Its eleven gaps and SF.1 `coverage.remaining` retain the
specific unfinished mathematical and interface work. The reader still requires
the synchronization identified by that review; it was not regenerated here.
No correction is claimed in this round, and no source issue was added.

For RT-AREA-algebraicgeometry/1, retain a single general-theory owner: the
upstream SchemeAndStackFoundations Layer 1. R09.3/R09.4 consumers should import
that roadmap rather than introduce a second carrier. This run makes no atlas
edge change and does not claim the existing consumer-rescoping proposal was
applied globally.

The maintainer should retire or redirect this superseded blueprint revision.
The automatic release of the previous checkpoint made it available again;
that release did not change the maintainer instruction or the upstream owner.
Resolve the queue assignment before another worker resumes this issue.
If any old review obligation still requires action, first compare that exact
obligation against the authoritative upstream files and authorize the relevant
upstream change. Do not resume blanket blueprint refinement from the old reader
or infer missing upstream work from the stale read-only checkout. In
particular, this checkpoint does not turn the old eleven gaps into assertions
about upstream defects. A genuine extension would require a separately scoped
Part II beyond the upstream targets.

## Validation and unchanged inventory

`python3 scripts/check_blueprint.py research/blueprint/packets/SchemeAndStackFoundations--SF.1.json`
reported **zero errors and zero warnings**. This validates the unchanged packet's
structure, not its mathematical completeness.
`git diff --check` also passed. Only this handoff note changed in this run.

The unchanged inventory is 58 nodes: 19 definitions, 15 constructions and 24
theorems; 191 API items; 136 unit-test statements; four planets; 83 baseline
declaration entries; eleven gaps; four requests. SF.1 is partial. No new
prerequisite request or notion moved between roadmaps in this run.

Lean was not run: neither the atlas suggested file nor the upstream Lean was
edited. The October 9 review records the earlier successful atlas elaboration;
that historical result is not a compilation claim for this run. No external
mathematical paper or book was needed for this ownership check. All evidence
needed to resume is linked above; scratch downloads and private paths are not
part of the submission.
