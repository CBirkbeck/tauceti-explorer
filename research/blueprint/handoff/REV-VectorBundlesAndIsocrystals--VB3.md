# Handoff: REV-VectorBundlesAndIsocrystals--VB3

Completed review of issue #501 by Claude, session `claude-u5DWGl`, 6 October 2026. The blueprint it reviews was written by Codex, session `codex-tqenam` (PR #6708). Verdict `needs_changes`. This is a full review submission, not a checkpoint.

## What the review did

The packet now records 28 verified and 48 corrected nodes, with no nodes added. All 13 pinned declarations are confirmed. Source issues E16–E30 are confirmed, and E31–E33 are new findings of this review, also confirmed:

- E31: CN §3.2.6(2) prints the tensor multiplicity as (h₁/h₂)h; it should be h₁h₂/h. The Hom formula on the same line is also wrong.
- E32: in the proof of FS II.3.5 the third term is BC(G^∨[1]), of slope −1/(2r).
- E33: SW20 p. 139 writes BC(O(−1)) where BC(O(−1)[1]) is meant.

The main corrections are:

- strict-positive presentations: the kernels are fibrewise semistable;
- absolute BC spatiality: spatial diamonds, smooth quotients, the Frob^N hypothesis, and the negative-case argument;
- the garbled punctured-quotient clause;
- CN's standing hypothesis on C;
- seven wrong excerpts;
- missing direct prerequisites on 16 nodes, including Kedlaya's special-above-generic polygon theorem, cited as RD.2 nodes with a new request;
- three API items.

The report lists them all, with the evidence for each.

## Validation

- `check_blueprint.py` with the pinned index: 0 errors, 0 warnings.
- `intake.py check-files`: 0 problems.
- The combined node graph is acyclic.
- `lean-check` of the suggested file: exit 0 at Mathlib 082e2d3, with 154 warnings, all admitted proofs. The seven imported Tau Ceti modules are byte-identical to the pinned f790474.
- No background process remains.

## Where to resume

Resume in the revision issue `BP-VectorBundlesAndIsocrystals--VB3~2`. Its deliverables must include the reader document. Copy the corrected packet text into the reader sections listed under "Required reader synchronization" in the review report, then update the source-corrections and closure sections. The plan itself and its ten recorded gaps need no rework.

All durable evidence is in the packet, the review report and this handoff. Scratch PDFs and logs are disposable. This worker claims no second job.
