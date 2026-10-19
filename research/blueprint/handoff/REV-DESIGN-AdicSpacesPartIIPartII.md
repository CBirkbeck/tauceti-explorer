# Handoff: REV-DESIGN-AdicSpacesPartIIPartII

Issue #3487; Codex session `codex-otRdSZ`; 19 October 2026. This is a completed independent review of Claude's design, not a checkpoint. The corrected packet is accepted. No implementation or closed stage is claimed.

## Completed work

Reviewed every original target, all 46 original pinned baseline declarations, the direct supplier statements, sources, API, tests, planets, suggested Lean file and reader. The report in `research/blueprint/reviews/REV-DESIGN-AdicSpacesPartIIPartII.md` records the corrections and source locations. The packet's review matrix covers all 43 resulting nodes: 12 verified, 30 corrected and one added. There are 110 API items, 70 unit tests, 18 planets and 45 retained baseline declarations. All 15 definitions/constructions have at least three tests. Seven stages are planned; none is closed. PROTOCOL §0 permits recorded gaps at the ends of a planned stage's prerequisite chains.

Added `RZ.1/riemann-extension`, with the precise arbitrary-field statement from Conrad 2010, Theorem 2.1.1, p. 4. Moved `RZ.5/affinoid-localization-regular` to `RZ.0/affinoid-localization-regular`, before its consumers. Updated all internal references and stage ownership. No other roadmap was edited.

Replaced the invalid connectedness-after-algebraic-closure argument by extension of idempotents over the original field. Corrected local/global branch comparisons, nonreduced normalization and resolution conventions, scalar-restriction claims for analytic manifolds, and the quotient-point lifting argument. Removed the same-field analytic identity theorem from the subfield theorem's baseline. Poineau's strict Laurent-domain argument closes the original G2 reading gap. Source issue verdicts are three confirmed (E2, E5, E6) and three rejected (E1, E3, E4); see the report and packet for evidence and version limits.

The read-only current Tau Ceti library already constructs the one-variable centred Gauss point. Reuse it; the multivariable closure target here is additional. Current TauCetiRoadmap has no `RigidAnalyticGeometry` directory. The phantom supplier was replaced by actual parent-roadmap nodes. Current-library and roadmap commit hashes are recorded in the packet. No upstream checkout was modified or built.

## Remaining mathematical work

- **G1:** Read Bartenwerfer's original Riemann-extension proof. Conrad's exact statement has been inspected, and its ownership and consumers are explicit.
- **G3:** Read/decompose the Bierstone–Milman regular-functoriality and Temkin quasi-excellent-scheme proofs, including the regularity input for completed ground-field extension. The proposed transfer to AlgebraicModuliForArithmeticGeometry Part II needs a maintainer decision. Keep these theorem targets here until an actual supplier exists; the current variety-resolution supplier is weaker.
- **G4 / Q1:** Extend the parent ordinary-affinoid excellence input to imperfect characteristic p. The existing parent theorem is characteristic zero only. This request is not about characteristic-p dagger excellence.
- **G5 / Q2:** Supply the formal-model localization-after-admissible-blow-up theorem used by Bhatt–Hansen Proposition 2.9 (Bosch, Theorem 8.4.3). Inspect Berkovich Proposition 2.4.4 for the Banach Shilov-boundary comparison. The precise Bhatt–Hansen statements and Poineau residue-transcendence argument have been read.
- Supply the existing precise ReductiveGroups smooth quotient/torsor request for the orbit-map application. Quotient points need not lift over the original field; the corrected proof uses faithfully flat extension and descent.

Future admissible-pairs work should import rigid analytic points and proper-image Zariski closedness from their lower owners here. The parent's component comparison under analytification is a later consumer of the component construction, not a prerequisite for constructing components. These coordination questions remain in the packet and report; no ownership proposal was applied outside this job.

## Validation and resumption

`python3 scripts/check_blueprint.py research/blueprint/packets/AdicSpacesPartIIPartII.json` reports zero errors and zero warnings with the pinned declaration index. `lean-check research/blueprint/suggested/AdicSpacesPartIIPartII.lean` exits zero with 14 admitted-proof warnings and no other diagnostics. The Lean file contains only statements and light definitions over available carriers; the constant-rank conclusion now requires centred charts and a nonvacuous normal form. Memory available before elaboration exceeded 20 GB.

The reader contains the corrected statements, hypotheses, proofs, prerequisites, API, tests, Checks, examples and source locators. JSON validity, exact node-review coverage, definition/construction test counts, submission file scope and whitespace were checked. Public source URLs and inspected page/theorem locations are retained in the committed packet, reader and report. The cleared Schneider book was read in place; no book file or passage is included. No scratch file is needed to resume the explicit follow-up work above.
