# Handoff: independent review of AutomorphicFormsOnReductiveGroups, revision 2

**This review job is complete; the packet verdict is `needs_changes`.** Issue #6989,
job `REV-AutomorphicFormsOnReductiveGroups~2`, Codex session `codex-ULSv2d`,
8 October 2026. This session did none of the original or revision-2 planning.
This submission is a completed negative review, not a checkpoint of an unfinished
review. No second job was claimed.

## Durable results

- [The review report](../reviews/REV-AutomorphicFormsOnReductiveGroups~2.md)
  contains all counts, corrections, the six assigned red-team checks, the
  baseline and supplier inventories, a checked ledger for all 100 nodes and the
  exact missing-name inventory. The packet has the same 100 `review.checked`
  entries: 77 verified, 23 corrected. No node was added or deleted.
- The corrected packet and reader have 100 nodes, 310 API entries, 209 specified
  tests, 30 planets, 56 baseline declarations, 43 requests and 23 gaps. All seven
  stages remain planned; none is closed. Every implementation status remains
  unchecked.
- All eighteen source findings carry this review's attribution: seventeen
  confirmed, E8 rejected. E16 adds the compact-type projector normalization/dual
  character correction; E17 adds the compact Cartan basis correction; E18 adds
  Knapp's epsilon-factor product typo. E14 also records the repeated product
  assertion in Getz §3.4. The false genus-two equal-length counterexample is
  removed from E8's active reasoning and correction.
- The baseline Lie equivalence's defining module is corrected to
  `TauCeti/Geometry/Lie/Tangent/LieEquiv.lean`. All 56 statements were read at
  Mathlib `082e2d3` and Tau Ceti `f790474`. The reviewed seven-stage library audit
  and all supplier contracts were checked. Exact missing exports remain
  requests; no unaccepted supplier is counted as closed.
- Mathematical corrections cover normalized SL₂ reducibility, irreducible
  automorphic-subquotient admissibility, full-K centre stability, algebraic
  q-expansion coefficients, unitary/cuspidal conventions, purity and rationality
  normalization, central-character modular-form compactness/overlap, product
  factor extraction and inaccurate source locators. The report records the
  precise evidence and affected nodes.
- The suggested file now includes actual compact-Cartan 2×2 matrices, their
  bracket signature and two examples distinguishing the circle generator from
  the split diagonal. The GL₂ dictionary explicitly uses that basis as a direct
  prerequisite. Its two-ray SO(2) carrier does not claim an O(2) extension or an
  integrated classification.
- The previous narrow fix review is preserved in `reviewHistory`. No promoted,
  atlas, supplier, consumer or upstream roadmap file is edited.

## What the next revision must do

The blocker is PROTOCOL §13 correspondence, not honest open mathematical proof
gaps. The suggested file represents 43 of 100 main names, 201 of 310 API
occurrences and 104 of 209 attached named examples. There are **256 distinct
omitted names across 82 nodes**. The report gives the durable list; the packet's
`suggestedOmissions` and reader give every required mathematical statement,
native input and supplier owner. Bare comment mentions are not declarations.

Supply faithful signatures for those contracts. Preserve the distinct generic
helper names and actual carrier equations. Do not insert arbitrary proposition
fields, arbitrary equivalences or dummy declarations to match a count. Do not
delete legitimate roadmap targets to make the omission list smaller.

Also reconcile partial contracts for already-present names: normalized
induction's compact-picture equivalence is currently linear and assumes
bijectivity rather than proving the canonical Fréchet comparison; the long-exact
node still lacks its Ext/cup/restriction parts; constant-term rational-normalizer
invariance and a conditional fibre formula do not give every parabolic
preservation/transitivity statement. Integrated classification, the O(2)
extension, native arithmetic maps, global lattices and geometric coefficient
provenance remain exact supplier/interface obligations. The report's three
revision requirements separate these from proof closure.

Retain all clear corrections and source-finding verdicts. The added direct-
product gap requires finite-type slices/coefficient functionals to extract
automorphic factor constituents from a subquotient; evaluating the other factor
at the identity alone is insufficient. The central-character branch uses
compactness modulo the full real centre, so real-quadratic G_m satisfies it;
ordinary Gross finiteness retains its stronger discrete-centre hypotheses.

Unapplied AF.1/AA prefix and AF.4/ALS local/application splits remain for
maintainer integration. Original-proof refinements for Harish-Chandra,
classification, relative Ext, BHR/Clozel and the arithmetic suppliers remain
explicit gaps. No new source purchase is requested by this review.

## Sources and checks

The source URLs, versions, hashes and theorem/section/page locators are in the
packet and report. Public PDFs were checked against their recorded hashes;
Goldring–Koskivirta was checked in the rendered publisher text. Flath
pp.179–183, Borel–Jacquet pp.189–202 and Langlands pp.203–207 were read in place
in the maintainer-cleared library. No private file, passage or page image was
copied. All repository text states results in our own words.

Completed validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicFormsOnReductiveGroups.json`:
  zero errors and zero warnings.
- `lean-check research/blueprint/suggested/AutomorphicFormsOnReductiveGroups.lean`:
  exit zero, 499 warnings for admitted proofs and no other warnings or errors.
  The original unmodified file also elaborated. More than 20 GB was available
  before the final compile; no Lean language server, Lake build/update or cache
  command was run.
- `git diff --check`: clean. Reader API/test names and corrected strings were
  checked for synchronization. The absence inventory was compared with actual
  namespace-qualified declarations, generated projections, named instances and
  attached example statements.

The shared compiler supplies pinned Mathlib, not pinned Tau Ceti modules.
Tau Ceti claims were checked in source; compilation here does not establish the
missing local Tau Ceti import/adapters. No other library installation was made.

Only the four issue deliverables and this mandatory handoff are submitted.
The PR uses `Refs #6989`. Submission CI will be inspected after opening it;
scratch sources, images, audit scripts and logs are deleted after submission.
All material a later revision needs is in these five deliverables.
