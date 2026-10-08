# REV-RefinedTraceMethods--RT.1~2 handoff

Issue #7086. Codex, session `codex-MWgof6`, 8 October 2026. This is a completed
independent review of revision #7004, written by another session. It is not a
checkpoint. The packet's verdict is **needs_changes**.

## What is complete

All 153 nodes have individual source, hypothesis, proof-route, prerequisite,
API, test and suggested-signature review notes: 113 verified, 37 corrected and
three unverifiable. Thirty-eight existing nodes were corrected across the packet
and suggested file; one of those still has an unresolved supplier. No node was
added or removed. The report records every correction and the disposition of
previous review requests R1–R16.

The reader now contains the complete corrected stage-organized inventory,
including the revision's added definitions. It agrees with the packet's
statements, hypotheses, proof routes, sources, API, tests, acceptance criteria,
review notes, supplier requests and gaps. All implementation statuses remain
unchecked. All eight scoped stages are planned at target level; none is closed.

The corrected inventory has 372 API items, 251 unit tests, 29 planets, 24 pinned
baseline declarations, 43 exact supplier requests, four recorded gaps and five
ordering/ownership proposals. Three API items and two requests were added. The
review read every cited baseline declaration at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, together with the reviewed coverage
audit and the relevant upstream DGAInfinity and InductionRestriction documents.
No baseline reference was removed. The coproduct totalizer's scope was qualified.
Direct external supplier declarations were read against their statements and
hypotheses, including the finer RT.6 inputs added to the graded Beilinson node.

All 34 public sources were read in the relevant numbered ranges. There are 35
version records because published Nikolaus–Scholze and its arXiv text are
distinct. Both hashes were checked; published NS, SHA-256
`8b1856fa8faefa3efebd64580249aa6fbc0c918f69820bba01410ab0ef1eb8ef`, is the
primary read. No restricted book was needed. No source file or source prose
passage is submitted.

All 16 source issues have independent verdicts: 15 confirmed and E5 rejected.
AMMN's narrower Theorem 6.22 does not contradict its stated theorem, and 6.23 is
a corollary, whose reference was corrected. New E16 records the missing lax
qualification in Antieau–Riggenbach v1, Proposition 2.67, p. 18: at n=1 the Tate
functor is zero and cannot preserve the nonzero monoidal unit; its proof provides
a lax structure. The corresponding roadmap statement already uses lax
monoidality. All ten handed red-team findings were checked; finding /46 retains
the foundation-ordering objection below. E14 remains a source
hypothesis-definition/proof gap, without a claimed counterexample.

## What requires a revision

The three unverifiable nodes are:

- `RefinedTraceMethods:RT.3/cyclotomic-trace`;
- `RefinedTraceMethods:RT.3/trace-uniqueness-multiplicative`;
- the categorical trace comparison in
  `RefinedTraceMethods:RT.2/thh-bimodule-coefficients`.

They import the whole RT.5 stage, while RT.5 already requires RT.3. The packet
records precise motives/corepresentability, tensor/Day-convolution and
compact-preserving categorical trace requests and proposes an early foundation
split. The proposal has not supplied actual acyclic declarations. The existing
RT.5 `localizing-motives` node was read: its relative accessible/finitary
construction and pending tensor audit do not resolve early placement, the
requested comparison without a filtered-colimit axiom, or all categorical trace
data. Its own packet has a needs_changes review.

Resume by resolving this ordering with the orchestrator and the RT.5 owner:
establish an early foundation before RT.2/RT.3, replace the three stage imports
with its actual declaration IDs and check their hypotheses. Keep the later RT.5
computations downstream of RT.3 and RT.4:topological. A direct trace construction
is another possible route only with a sourced, noncircular proof plan. Do not
change the verdict merely because a split proposal exists.

The other gaps and exact requests are honest conditional target-level planning
boundaries, not demands to implement the library before accepting a plan. In
particular, preserve the light solid spectral foundation and Wagner proof-sketch
boundaries. Retain the new H.6 image-of-j convention request and HQ.3 finite
q-twist/q-Witt interface request. For graded Beilinson, the existing RT.6 motivic,
cyclic/de Rham, syntomic graded, characteristic-p TC sheaf and trace flat-descent
inputs precede the desired comparison. Its downstream AMMN filtered interface
imports RT.3b and cannot be its supplier. The remaining general-site descent,
polynomial left-Kan-extension and factorization through uncompleted derived
de Rham input is requested explicitly, following AMMN v2, Theorem 5.1(2), p. 25
and its proof on pp. 34–35, and Construction 6.16/Theorem 6.17, pp. 44–45.
Every changed formula or convention is in the report, reader
and packet; no scratch file is needed to resume.

## Validation

- `python3 scripts/check_blueprint.py
  research/blueprint/packets/RefinedTraceMethods--RT.1.json`: zero errors and zero
  warnings.
- Shared source-issue and version validators (`source_issues.check_issues` and
  `check_errata.versions_checked`): zero errors. The packet remains blueprint-v1;
  it is not an errata result file.
- Inventory and reader checks: unchanged 153 declaration IDs, one review verdict
  per node, an acyclic internal declaration graph, every scoped stage realized,
  all packet statements/API/test statements present in the reader, at least three
  tests per definition/construction, and planet bounds satisfied. This does not
  certify the unresolved external RT.5 ordering.
- Temporary `#check` commands inside the roadmap namespace resolved all 372
  distinct API names, including generated projections and instances. They were
  removed before submission.
- `lean-check research/blueprint/suggested/RefinedTraceMethods--RT.1.lean`:
  final file elaborated successfully at the shared pinned Mathlib build, with
  zero errors and only 1,848 `declaration uses sorry` warnings. The only later
  Lean edit clarified an ordinary-cyclic-homology comment. Every mathematical
  proof remains a placeholder; elaboration is a signature check.
- `git diff --check`: passed.
- `python3 research/blueprint/intake.py check-files` on the five deliverables:
  five files, zero problems.

Only the four issue deliverables and this handoff are submitted. No upstream
roadmap, peer packet, atlas data or promotion file was edited. After opening this
job's PR, this session stops without claiming another issue.
