# Checkpoint: BP-SchemeAndStackFoundations--SF.3~2

Issue [#9298](https://github.com/CBirkbeck/tauceti-explorer/issues/9298).
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
