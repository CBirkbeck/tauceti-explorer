# Handoff: independent review of R09.7a–d

**Complete.** Job REV-AlgebraicModuliForArithmeticGeometry--R09.7a, issue **#347**, reviewed by **Codex — codex-Ra1y4s**, 2026-10-11. The input worker was codex-dtTm52 (#673, PR #8683), so this is independent. The bot confirmed this session's claim. The submission branch is `codex-Ra1y4s-review-347`; no second job is taken.

## Accepted deliverables

- [Review report](../reviews/REV-AlgebraicModuliForArithmeticGeometry--R09.7a.md).
- [Corrected packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7a.json), with accepted independent verdicts for all eleven nodes: six verified, five corrected, none added or unverifiable.
- [Corrected suggested file](../suggested/AlgebraicModuliForArithmeticGeometry--R09.7a.lean).

The complete target-level pass imports exactly forty accepted core owners. Its four stages remain planned, every implementation unchecked. Counts: 32 API items, 25 test groups, nine planets, ten confirmed pinned declarations, seven supplier requests, no unresolved contradiction. The eight definition/construction targets each have at least three discriminating tests. No new roadmap or higher-tier dependency was introduced.

Corrections: finite-type quasi-coherent centres on arbitrary schemes; projection-compatible and nested native restrictions; controlled-transform uniqueness; coordinate-permissible embedded centres; finite-normalization import from the existing SF.0/nagata-normalization-finite node; identity-chart map/unit signatures and actual chart non-example; a cubic-cover normalization test surviving boundary refinement; and E1903's independent confirmed verdict with its existing correction identified.

E1903 remains scoped to Landesman–Litt arXiv:2205.15352v4, proof of Lemma 8.3.3, author pp.40–41. It is already corrected on [Daniel Litt's author-hosted page](https://www.daniellitt.com/published-paper-reviews.html), P04 erratum item 11 (published p.868). The page describes AI-assisted provenance and Litt's erratum review/editing. The journal full text was not inspected. The stronger independent example is `z³=xy`: after `x=u, y=uv`, normalization has the singular third-Veronese ring `C[a³,a²b,ab²,b³]`, of dimension two and cotangent dimension four at its vertex. Resolution preserving the cover and the full-chart monomial-meridian formula supply the repair.

## Validation

`scripts/check_blueprint.py`: zero errors and warnings. Embedded `check_errata.check`, using the roadmap identifier and an errata envelope, also has zero errors. The standalone errata CLI is for separate errata files, not a blueprint packet. Exact core-import coverage, all review verdicts and identifiers, API/test-name coverage, intake file checks and whitespace checks passed.

`lean-check` elaborated the corrected file at Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**: exit zero, **127 sorry warnings**, no errors or other warnings. No mathematical proof is claimed complete. Available memory exceeded 20 GB; one compile ran at a time and no process remains running.

Five public PDF hashes matched the packet. The six original source families, ten baseline statements, supplier statements, library audit, red-team finding 13 and current upstream were read. Current roadmap commit **070dc2becd74419e76303ede84b465ed4a69461f** and library commit **a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039** were inspected read-only. Current ordinary-blowup, effective-Cartier and toric boundary APIs retain their owners. No source passages or restricted books were added to the repository.

## Where to resume

No further review work is required for #347. Route the seven explicit supplier contracts before implementation/packaging relies on their full interfaces. Keep effective scheme realization, complex finite étale covers, coarse comparison and projectivity separate; no stack/coarse fundamental-group equivalence is asserted.

The reader was inspected but is not an editable deliverable of this issue. An authorized assembly/package worker must update [the supplemental reader](../readmes/AlgebraicModuliForArithmeticGeometry--R09.7a.md) from the accepted packet:

1. Use finite-type quasi-coherent centre ideals on arbitrary schemes and include permissible embedded centres.
2. Replace the A0 finite-normalization prerequisite/request by SF.0/nagata-normalization-finite and its remaining open-cover/localization comparisons; change the request count from eight to seven. Preserve the separate aggregate A0 analytification bridge.
3. Add the cubic normalization test, increase the test-group count from 24 to 25, and strengthen the identity/punctured-unit chart examples.
4. Replace E1903's unsuccessful-search/new-finding paragraph with the existing author-hosted erratum and independent confirmation.
5. Preserve all prototype refinements and synchronize the core reader using its earlier accepted review report. Import the forty accepted core owners; do not use the duplicate draft in PR #8005.

The [review report](../reviews/REV-AlgebraicModuliForArithmeticGeometry--R09.7a.md) contains all mathematical arguments, source URLs and locators needed to continue. Scratch downloads/logs can be deleted after submission; nothing needed by the next worker depends on them. No upstream file, campaign file or another job's deliverable was edited.
