# Completed independent review: EDC.4–EDC.8

Issue #399; job `REV-EtaleDualityAndPerverseSheaves--EDC.4`; reviewer Codex,
session `codex-yrcv77`; date 2026-10-06. This review is finished. Its verdict is
**needs_changes**; the unresolved work belongs to a revision, rather than an
unfinished review checkpoint.

The durable findings are in
`research/blueprint/reviews/REV-EtaleDualityAndPerverseSheaves--EDC.4.md`.
That report checks all 62 nodes, all 11 pinned baseline declarations, all 19
public source PDFs, supplier statements, API/test quality, source issues,
reader agreement, planets and the four handed red-team findings. It records
each changed node and distinguishes source statements from derived arguments.
The packet has the matching independent review object with 62 distinct records:
three verified, three corrected and 56 unverifiable. The source issues have
independent confirmed verdicts. Nothing is claimed formalised.

Clear corrections were made in place in 48 nodes and the suggested file. Three
API items and two counterexample tests were added; no node was added or split.
Five added gaps name the missing targets and consumers. The existing gaps and
requests remain, with geometric-finiteness qualifications. All five stage
coverage entries and the packet status are now partial with explicit remaining
lists. This describes the plan, not the completion status of this review.

The revision should start with the report's numbered signature blockers:
encode the common base/coefficient hypotheses; replace arbitrary-perverse IC
inputs by lisse sheaves and the dimension shift; introduce the chosen ample
class and primitive kernels; state simultaneous decomposition and the full
weight filtration; compare correspondence morphisms, not just supports; scope
proper integration and scheme automorphism order; and strengthen the identified
tests. It also needs the geometric-origin definition, categorical graded
Lefschetz argument, exact stratified specialization and coefficient descent.
Strong scheme-to-diamond pullback duality needs a supplier or a narrower stage
target: ECD §27.4 supplies right-adjoint recovery, which is now distinguished
from that stronger assertion.

The reader document
`research/blueprint/readmes/EtaleDualityAndPerverseSheaves--EDC.4.md` was read
but is outside this review issue's editable deliverables. The report lists its
specific stale passages and line numbers. The revision issue should authorize
that path so all three plan files can be reconciled. The four edge/Part-II
proposals need the orchestrator's normal restructuring workflow; this review
did not alter atlas data or other jobs' deliverables.

Source URLs, SHA-256 hashes, locators and the exact library pins are recorded
in the packet and report, so no scratch files are needed to resume. Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` was read and used for elaboration.
The Tau Ceti manifest at `f790474821cf4256814db967cb154e7af3d0c369` pins that
Mathlib revision. The suggested file imports only Mathlib; no theorem from the
shared build's different Tau Ceti checkout head enters it.

Final validation on 2026-10-06:

- `python3 scripts/check_blueprint.py research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.4.json`: zero errors and zero warnings.
- `lean-check research/blueprint/suggested/EtaleDualityAndPerverseSheaves--EDC.4.lean`: exit 0, only declaration-uses-`sorry` warnings. The final semantic edit, adding triangulatedness before gluing, was included.
- `git diff --check`: passed.
- Review identity coverage is exactly the packet's 62 nodes; all implementation
  statuses remain unchecked; node IDs, source hashes and 19 planet names are
  preserved.

Elaboration checks typing of the admitted forms. It does not resolve the
semantic contradictions recorded in the report, which require a new revision
and independent review before acceptance.
