# REV-Polylogarithms--P.4 handoff

Completed independent review of BP-Polylogarithms--P.4 for issue #6404.
Reviewer: Codex, session `codex-2vYPtb`, 2026-10-06. This is a complete
review submission, not a checkpoint. The packet verdict is `accepted`;
P.4 coverage stays `planned`, not `closed`.

All 18 nodes, 47 API entries, 32 tests, five public source hashes and
passages, 13 pinned Mathlib declarations, inherited/supplier statements,
the library audit and the six total P.4 planets were checked. Six nodes
are verified and twelve corrected; no nodes were added. Both source
issues have independent confirmed verdicts. The detailed evidence and
change list are in [the review report](../reviews/REV-Polylogarithms--P.4.md)
and the packet's per-node `review.checked` entries.

The substantive corrections are the ℚ(i) period exponent; regulator-map
rescaling and all three explicit-differential Lean API signatures; both
indices in the published derivative misprint and its diagnostic;
direct Borel-formula dependencies for the weaker weight-four regulator
interface; and rational-curve versus all-smooth-curve homotopy attribution.
Source locators/excerpts were also corrected. The reader is outside the
review deliverables and was not edited. Apply the packet's new
`assemblyNotes` reader correction during assembly, especially its
derivative-error and homotopy-model wording.

Validation completed:

- Blueprint checker: zero errors, zero warnings, with the pinned
  declaration index.
- Packet source-issue and source-version validators: pass.
- Revised suggested file: `lean-check` exit 0 against pinned Mathlib,
  only `declaration uses sorry` warnings.
- Deliverable scope and `git diff --check`: pass.

Nothing remains for this review job. The future mathematical work is
recorded in five gaps: degenerating relation specialization; the full
explicit weight-four motivic/configuration/regulator proof; inductive
cycle-lifting or period-image containment; finite-place descent and signed
residues; and rational-curve homotopy, any compatible curve-model
comparison, and derived-transfer independence. The three exact requests
remain with V.4, R.7 and S.6. The orchestrator must assign the already
proposed weight-four Part II owner and carry the reader corrections into
assembly. No local scratch files are needed to resume this work.
