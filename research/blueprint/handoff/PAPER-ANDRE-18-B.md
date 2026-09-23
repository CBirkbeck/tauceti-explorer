# PAPER-ANDRE-18-B handoff

Codex — codex-a71f92. Issue #2188. Partial first checkpoint, 2026-09-23.

## What is saved

The entire published 23-page article was read, with formula/image checks recorded in the report. The result has 76 items (9 library, 7 planned, 60 missing), five routes, 18 API/use blocks with 54 planning tests, 55 acyclic selected dependency edges, three unreviewed typographical source issues, two held claims and eight explicit coverage gaps G0–G7. Reading is complete; extraction and supplier verification are not.

The source PDF is the journal version, DOI 10.1007/s10240-017-0097-9, arXiv identifier 1609.00345; do not substitute the companion 1609.00320. URL and SHA-256 are recorded in result/source and the report. All locators use printed pages.

The design reuses the companion’s proposed PerfectoidRamification id/title, imports PerfectoidSpaces P0–P2 and DeformationAndDerivedPatchingAlgebra R03.3, and proposes DirectSummandsAndBigCohenMacaulay for the new commutative-algebra direction. It does not edit the companion or any roadmap. The existential cover of PerfectoidQuotients Q3 is not claimed identical to André’s specified normalized Kummer extension.

## Resume here

1. G3: obtain and read Hochster 1973, especially p.30 and the exact unramified complete-local reduction. Split the Artinian retraction-torsor argument into stabilization, compatible choice and passage to the A-linear retraction on finite B.
2. G4: read Hochster 2002 Lemma 5.1 and Bartijn–Strooker 1.7. Specify the bounded module modification with distinguished element, its maps, denominator estimates and algebra colimit; then balancing completion and the two-ring version. The held modification is not a usable definition.
3. G1–G2: compare the companion’s actual published statements, Scholze 6.4/6.7(i), Gabber–Ramero !!, and Berkovich’s flatness input; split the 2.5.2 proof. Use 1.1.1 at the Noetherian finite stages, not with A_∞0° declared Noetherian.
4. G5: finish pure local completion, coefficient enlargement, excellent normalization, product-flatness and the 4.4.2 descent.
5. G6: check Appendix A.3.1 against Hochster 1983 before making it or R→R+ a usable item. E2 only corrects an undefined letter.
6. G0 and G7: complete omitted introductory equivalences/implications, §1.2 Banach lemmas, §2.4 and 2.6 remarks, A.2.1 product statement, and remaining exact pinned supplier claims. No assertion of full coverage or closed proof graph is justified yet.

Preserve stable item ids unless their mathematical meaning changes. Keep partial status until every gap is genuinely discharged. No self-review or self-redteam.

## Upstream shape

Mathlib PR #22909, open at c2ab6bbf5e75dfa6ab145d538e276a883e0af724, proposes Submodule.IsPure; its whole Pure.lean was read. Follow that carrier and add the ordinary-module tensor characterization, instead of introducing a competing carrier. PR #26218, open at a455cf35efd99183700c2401b40cd070ce5f8a33, proposes the finite CM predicates used by R03.3. These are not declarations in the pinned library. Recheck their status before implementation; do not wait for merging.

## Checks

Passed on the working snapshot:

- python3 scripts/check_paper.py research/blueprint/papers/PAPER-ANDRE-18-B.result.json
- python3 -m unittest discover -s tests -p test_check_paper.py — 9 tests
- python3 -m unittest discover -s tests -p test_papers_queue.py — 3 tests
- python3 -m unittest discover -s tests -p test_source_issues.py — 7 tests
- python3 -m unittest discover -s tests -p test_intake.py — 29 tests
- Reproducible standard-library-only script embedded in report: structural checks and 3,646 finite algebra cases (2,269 annihilator, 728 pg, 649 splitting).

No Lean file was authorized, created or compiled. The 54 source-facing tests are mathematical planning contracts, not executable Lean proofs. The finite Python cases do not establish the general theorems.

Submit exactly this handoff, the paper result JSON and its report. Opening the PR ends the claim; do not unclaim a submitted checkpoint.

## Submission-base recheck

All checks above, plus python3 research/blueprint/intake.py check-files on the three deliverables, passed again on fresh main db34d2d4e5cd41614a3c352987d2a2b75c70fd03. Intake reports 3 files and 0 problems. The four binding instruction files, data/atlas.json, data/library-coverage.json and the companion result were unchanged from the working snapshot; no colliding roadmap definition or existing deliverable was present.
