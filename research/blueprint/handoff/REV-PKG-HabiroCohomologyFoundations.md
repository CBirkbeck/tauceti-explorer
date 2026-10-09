# REV-PKG-HabiroCohomologyFoundations — completed review

Issue #7518. Codex, session `codex-dYCaCH`, 2026-10-09.
Independent of original packager `codex-MeECkR`.

Completed all six review checks. Verdict **needs_changes**, because Lean
signatures fail to express the reader's targets. This is a complete negative
review, not a checkpoint. No other job was claimed.

The report in `research/blueprint/reviews/REV-PKG-HabiroCohomologyFoundations.md`
contains the scope, source locators, exact defects and complete counterexample
data. `review.json` records the same verdict. The reader has all 151 targets
and 266 API names; it is 163,113 bytes. Metadata remains `math.AG`.

Corrections: fixed QH §3.3's page range; removed an obsolete fix-job identifier
from a Lean heading; inserted the missing cyclotomic quotients in the supplied
crystalline-Frobenius map and its comparison theorem.

Resume a revision at report R1–R3:
1. Express the no-go candidates as reductions of one derived complex, or record
   the precise unavailable signature; arbitrary q-Witt module families exist.
2. Restrict perfectoid examples to the actual ring/model and constructed
   generators; e=0 disproves the unrestricted non-divisibility statement.
3. Repair the static quasi-regular, free δ-ring and cotangent supplier
   interfaces. The rational static-record counterexample is in the report.
   Ordinary algebraic compatibility is needed even when enhanced coherence
   remains unavailable. Then audit dependent examples and base-change maps.

Checks: all four issue input packets pass `check_blueprint.py` with zero errors
and warnings. Initial and final full `lean-check` runs exit 0 with 472 sorry
warnings each and no errors or other warnings, at Mathlib 082e2d3. Before each
run more than 20 GB memory was available. An isolated scratch counterexample
check also exits 0 without sorry or warnings. Nothing is left compiling.

Final Suggested.lean SHA-256: `00c7ffa53696a2f7149be7564ef987a70b0e38852bbf1ef14d889026c910afb1`.
Only the issue deliverables and this handoff were changed. Inputs and native
roadmaps were not edited. Scratch sources, indexes and logs can be deleted;
there is no dependency on them for revision. Submit this review once, then
stop; the next worker handles the revision as a fresh job.
