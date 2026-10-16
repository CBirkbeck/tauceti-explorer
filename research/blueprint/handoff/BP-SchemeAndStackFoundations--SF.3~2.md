# Checkpoint: BP-SchemeAndStackFoundations--SF.3~2

Issue [#9298](https://github.com/CBirkbeck/tauceti-explorer/issues/9298).

## Continuation: Codex codex-n6YNfF, 16 October 2026

Status: **blocked checkpoint; the revision remains incomplete**. The bot
[confirmed this session's claim](https://github.com/CBirkbeck/tauceti-explorer/issues/9298#issuecomment-6216121571).
Only this issue was claimed. This continuation updates the ownership evidence;
the mathematical deliverables and the independent review remain unchanged.

Current upstream main has advanced to
`a46641603eb2cce60cea86900e44c3a5d856f91f` (16 October 2026, 12:52:21 UTC).
I read Layer 3, sections 3.1–3.8, README lines 4445–4837, and the associated
suggested signatures, lines 1720–1865, at that commit. The authoritative
[README](https://github.com/TauCetiProject/TauCetiRoadmap/blob/a46641603eb2cce60cea86900e44c3a5d856f91f/TauCetiRoadmap/SchemeAndStackFoundations/README.md#layer-3-curves-divisors-and-picard-objects)
and
[Suggested.lean](https://github.com/TauCetiProject/TauCetiRoadmap/blob/a46641603eb2cce60cea86900e44c3a5d856f91f/TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean#L1720)
are unchanged from the preceding checkpoint's upstream commit: GitHub's
comparison lists only issue templates, the repository README and
RestrictedPowerSeries files. PRs 779 and 943 remain merged.

The issue's complete comment history contains no scope decision superseding
the maintainer's [instruction to stop atlas blueprint rounds](https://github.com/CBirkbeck/tauceti-explorer/issues/9298#issuecomment-6147002032).
The current run also expressly prohibits planning anything TauCetiRoadmap
already has, consistent with WORKERS.md and PROTOCOL.md section 15. Thus the
available label and priority assignment do not resolve the ownership conflict.
The supplied read-only roadmap checkout remains at
`0d144d044dacebca17b654695b6f1ad58f159b27`, predating this upstream addition;
the supplied Tau Ceti checkout remains at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No checkout was updated or built.

The packet still contains 26 nodes (five constructions, 17 theorems, one
definition, two comparisons and one lemma), 53 API items, 25 tests, six
planets and 56 baseline declarations. Three gaps and 16 requests remain;
packet status and SF.3 coverage are `partial`. The review requirements and
red-team ownership boundaries below remain obligations, without a new verdict
on upstream or a claim that those gaps are closed.

Validation: the unchanged packet passes `check_blueprint.py` with zero errors
and warnings; `intake.py check-files` on this handoff and `git diff --check`
pass. Lean was not compiled because no Lean declaration changed.

**Resume only after the maintainer reconciles the assignment with its upstream
owner:** retire or supersede this atlas revision, or specify work beyond the
existing roadmap and authorize its deliverables. The four currently allowed
paths contain no upstream file. Another automatic checkpoint release supplies
no new scope. No queue, label, issue state or upstream file was changed by this
worker. All resumption evidence is linked here; no scratch file is required.

## Continuation: Codex codex-GuYWIt, 16 October 2026

Status: **blocked checkpoint; the revision remains incomplete**. This
continuation independently rechecked the scope conflict recorded below.
The bot [confirmed this session's claim](https://github.com/CBirkbeck/tauceti-explorer/issues/9298#issuecomment-6215364189)
after the previous checkpoint had returned the issue to `state:available`.
No second job was claimed.

The maintainer's [instruction stopping further atlas blueprint rounds](https://github.com/CBirkbeck/tauceti-explorer/issues/9298#issuecomment-6147002032)
remains the only human scope instruction in the issue's comments. The
subsequent bot release changes queue availability, without specifying new
mathematical work or editable upstream paths. WORKERS.md and PROTOCOL.md
section 15 independently prohibit replanning an existing Tau Ceti roadmap.
The manager's standing instruction for this run repeats that prohibition.

I checked the supplied read-only roadmap checkout at commit
`0d144d044dacebca17b654695b6f1ad58f159b27`. It does not contain
SchemeAndStackFoundations, so its absence there does not establish that the
roadmap is missing upstream. GitHub main is still
`4c4f8f52238b8ead04f806021f79201c6d499982`. I read Layer 3
(README lines 4445–4837, sections 3.1–3.8) and its suggested signatures
(lines 1720–1865) at that commit directly, and reconfirmed that PRs 779 and
943 are merged. These are the authoritative roadmap files linked below.
The supplied Tau Ceti library is at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; this continuation does not
assert a new library audit or a mathematical review of upstream.

The outstanding review requirements are preserved below. This continuation
changes only this handoff: the packet, reader document, suggested file and
review object remain unchanged. No claim is made that an upstream target
closes an atlas gap, or that a successful schema check resolves the scope
conflict. No new notion or consumer dependency was moved between owners.

Validation for this continuation: the unchanged packet passes
`check_blueprint.py` with zero errors and zero warnings; `intake.py
check-files` on this handoff and `git diff --check` pass. Lean was not
compiled because no Lean declaration changed.

**Resumption requires a maintainer scope decision:** retire or supersede this
atlas revision in the queue, or identify concrete work beyond the existing
upstream roadmap and authorize its deliverable paths. The current issue's
four paths do not include the authoritative upstream files. Releasing this
unchanged assignment again cannot resolve that conflict. All evidence and
remaining requirements needed to resume are in this handoff and its linked
review; no scratch files are required.

## Previous checkpoint: Codex codex-JsrAGL

Worker: Codex, session codex-JsrAGL, 16 October 2026.
Status: **blocked checkpoint; the blueprint revision is not complete**.

## Blocking instruction and upstream ownership

The issue was labelled `swarm`, `state:available`, `focus` and `top` when
selected from the manager's priority list. The claim bot
[confirmed this session's claim](https://github.com/CBirkbeck/tauceti-explorer/issues/9298#issuecomment-6214737087).
On rereading the issue after confirmation, I found the maintainer's
[13 October instruction](https://github.com/CBirkbeck/tauceti-explorer/issues/9298#issuecomment-6147002032)
that further blueprint rounds for this roadmap should stop and that its
upstream README is authoritative. The available label does not resolve that
instruction or authorize duplicating an existing Tau Ceti roadmap.

The upstream situation has advanced beyond that comment:

- [TauCetiRoadmap PR 779](https://github.com/TauCetiProject/TauCetiRoadmap/pull/779)
  merged on 14 October 2026 at 04:47:45 UTC, merge commit
  `d23fdaf388733bd9bcb0dc9b7963cc336f21461d`.
- [TauCetiRoadmap PR 943](https://github.com/TauCetiProject/TauCetiRoadmap/pull/943),
  which adds foundation targets and corrects existing targets of the same
  roadmap, merged on 16 October 2026 at 02:48:52 UTC.
- I read the current Layer 3 and inspected the suggested file at upstream
  main commit `4c4f8f52238b8ead04f806021f79201c6d499982`, dated
  16 October 2026 at 10:10:01 UTC. The authoritative files are its
  [README](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4c4f8f52238b8ead04f806021f79201c6d499982/TauCetiRoadmap/SchemeAndStackFoundations/README.md#layer-3-curves-divisors-and-picard-objects)
  and
  [Suggested.lean](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4c4f8f52238b8ead04f806021f79201c6d499982/TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean).

WORKERS.md and PROTOCOL.md section 15 prohibit replanning Tau Ceti roadmaps.
The run's standing instruction also prohibits planning what upstream already
has. Consequently this submission records the queue conflict, without
rewriting the superseded atlas plan or making an upstream change outside
the issue's deliverables. It is not a mathematical review of upstream.

## Preserved input and unresolved revision requirements

The existing
[review](../reviews/REV-SchemeAndStackFoundations--SF.3.md) and its
[handoff](REV-SchemeAndStackFoundations--SF.3.md) remain the detailed inventory
of the atlas revision's outstanding work. No mathematical correction, API,
test, planet, baseline declaration, request, gap or review verdict was changed
in this run. In particular, none of these requirements is certified as
resolved merely because an upstream roadmap now exists:

1. Packet/API/example agreement and concrete Picard carriers. The current
   upstream ownership is README sections 3.1 and 3.3–3.7, with its own
   division between README targets and suggested signatures.
2. Double-cover norm homotopy fibres, their maps and norm trivializations,
   and the norm-kernel component argument. The corresponding upstream target
   is section 3.7. The review's distinction between the full kernel and its
   identity component remains an obligation in the preserved atlas packet.
3. The all-point Abel derivative and Kähler/residue comparison with current
   Tau Ceti's principal-parts pairing. The corresponding upstream targets
   are sections 3.3 and 3.8. This checkpoint supplies no new proof of them.

The red-team ownership boundaries also remain unchanged: Néron–Severi theory
belongs to AbelianSchemesAndArithmeticModuli A2; general coherent duality is
SF.2; general positivity and Keel theory are SF.5. This run makes no consumer
redirection or move of a notion between roadmaps.

The unchanged packet has 26 nodes (one definition, five constructions,
17 theorems, two comparisons and one lemma), 53 API items, 25 unit tests,
six planets and 56 baseline declarations. It retains three gaps and
16 requests. Its status and SF.3 coverage are both `partial`.

## Validation and resumption

`python3 scripts/check_blueprint.py
research/blueprint/packets/SchemeAndStackFoundations--SF.3.json` reports
zero errors and zero warnings for the unchanged packet. The submission's
file-scope check and whitespace check pass. No Lean file changed, and Lean
was not compiled in this run; the previous review's compilation report
belongs to that review.

The maintainer needs to reconcile issue 9298's available state with the
instruction stopping blueprint revisions and the now-merged upstream owner.
If mathematical changes are wanted, a newly scoped assignment must identify
the authoritative upstream deliverables; this atlas revision's four allowed
paths do not include them. A subsequent worker should start from that scope
decision and the linked upstream commit, rather than repeat this claim and
replan Layer 3. The preserved review remains a source of leads, not an
upstream verdict. No scratch file is needed to resume.

Only this handoff was added. No second job was claimed. No issue was closed,
and no label or upstream pull request was manually changed.
