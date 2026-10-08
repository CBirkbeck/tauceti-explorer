# REV-SpecialValuesBirchTate~2 — completed independent review

Issue [#7094](https://github.com/CBirkbeck/tauceti-explorer/issues/7094). Worker: Codex — `codex-Bb98NE`. Date: 2026-10-08. Claim [6052124165](https://github.com/CBirkbeck/tauceti-explorer/issues/7094#issuecomment-6052124165), confirmed by [6052125905](https://github.com/CBirkbeck/tauceti-explorer/issues/7094#issuecomment-6052125905).

The review is **complete and accepted after clear corrections**, with no checkpoint needed. The [independent report](../reviews/REV-SpecialValuesBirchTate~2.md) explains all corrections and gives every node’s verdict. The [packet](../packets/SpecialValuesBirchTate.json), [definitive reader](../readmes/SpecialValuesBirchTate.md) and [suggested file](../suggested/SpecialValuesBirchTate.lean) agree. Earlier top-level and source review verdicts are retained in packet `reviewHistory`; the original independent report and revision handoff are untouched.

## Completed checks and corrections

- Independently checked all 51 inherited nodes and three promoted API lemmas: **41 verified, 10 corrected, 3 added, 0 unverifiable**. Final kinds: 6 definitions, 17 lemmas, 25 theorems, 2 applications, 4 comparisons. Retained 25 API items, 23 tests and 15 planets.
- Read every one of the **78 baseline statements in 50 modules** at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, including namespace/section assumptions. Every citation is confirmed; none was added, removed or replaced.
- Fresh public-source downloads match all eight current packet hashes. Exact passages, URLs and dates are in `sources.readSections` and `sourceVersions`; the report gives theorem, section and printed page locators. Seven source findings are independently confirmed under this job. The edited documents describe errors in our own words, with no copied source passage.
- Read all direct foreign fine statements, stage contracts and requests. Both RT-AREA-ktheory-1/10 and /11 preserve N.3/N.4 finiteness/W₂ and N.8 independent quadratic ownership. I.9/I.10 and M.8 retain their comparison ownership.
- Added consumed API nodes `B.1/birch-tate-iff-mul`, `B.1/formula-implies-zeta-nonzero` and `B.8/h-invariant-primary-valuation`, marked with this job’s `addedBy`. Added N.5 directly to the weight-two Lichtenbaum API and N.4 to the final higher Euler-characteristic rewrite.
- Corrected old-to-new generator transport and its pole-clearing unit; distinguished Kolster’s covariant dual action from ordinary contragredient twists in the L2 request and suggested comments.
- Replaced the S-integer K₂ source anchor with K-book V.6.8, p. 412, and improved explanatory source matches. Synchronized reader sections, direct dependencies, tests, counts, source findings and compilation provenance.
- Bounded structural traversal: **636 fine nodes, 3,084 distinct edges, 645 baseline leaves, 97 catalogue stage endpoints**, with no missing IDs, conflicting reachable IDs, empty statements or cycles. Four legacy GeneralAlgebraicKTheory nodes use their integrated decomposition and incoming links. This does not certify all foreign proofs, all foreign baseline leaves or aggregate-stage acyclicity.

## Validation and limits

`python3 scripts/check_blueprint.py research/blueprint/packets/SpecialValuesBirchTate.json --json` reports **zero errors and zero warnings**. The existing declaration index is present and contains all 78 citations; independent statement reads separately establish their suitability.

`lean-check research/blueprint/suggested/SpecialValuesBirchTate.lean` completed with **exit 0 and exactly three `sorry` warnings** in the existing shared build at the pinned Mathlib commit. Before the run, `free -g` showed 103 GB available. It checks the 16 active imports, two named declarations and seven examples. The higher K/cohomology/Iwasawa/motivic interfaces remain commented prototypes; the run does not elaborate those interfaces or build the three cited Tau Ceti modules. No build, update, cache fetch or language server was started.

Reader/packet correspondence and `git diff --check` pass. All implementation statuses remain unchecked. Acceptance is of the complete target-level pass, with eight planned stages and zero closed stages.

## Remaining owner work

This review has no unfinished work. Downstream implementation must retain the four named gaps:

1. K2SymbolsBrauer T.5: the independent upper bound for K₂(ℤ).
2. ArithmeticKTheory N.8: independent quadratic generation and its tame-kernel certificate upper bound.
3. B.5 supplier chain: the integral arbitrary-ramification comparison, exact inverse second-kind substitution in Greither’s variable, norm-kernel/quotient maps with finite defects, and the exceptional χ=ω export.
4. IntegralIwasawaTheory I.10: actual modern finite-specialization diagram entries (a),(b),(f),(i), including order-two, real-place, finite and Tor contributions.

All seventeen exact requests remain, with owners and consumers in the packet. M.8/PS.3 must fix actual integral motivic lattices/regulators, M.7 the higher real-place maps, and PS.4–PS.5/K.5 the determinant/relative-K statement infrastructure. The general motivic and ETNC assertions remain conjecture predicates. None of these obligations is discharged by a numerical check or characteristic-ideal equality.

The public source URLs, exact pins and repository inputs suffice to reproduce this review; no scratch file is needed. This worker submits one PR for #7094, deletes its scratch directory after submission, and stops without claiming another job. Workers do not promote, merge, close or relabel anything manually.
