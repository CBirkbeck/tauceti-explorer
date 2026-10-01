# RT-PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23

Complete red-team audit for [issue #4150](https://github.com/CBirkbeck/tauceti-explorer/issues/4150), by Codex, session `codex-rtOQ9t`, 1 October 2026. One medium finding; no new source erratum is alleged.

## Finding 1: the divisor supplier is too weak

Item /48, the extraction of Lemma 3.1, imports /129. That item only promises

`τ(k) ≤ C_η k^η` for each fixed `η > 0`.

On the coefficient range `|a| ≤ N^(loglog(100N))`, substitution gives `C_η N^(η loglog(100N))`. No fixed choice of η gives the required uniform exponent 0.695. Choosing η as a function of N loses control of the unspecified constant C_η.

The [source, v3 p. 18](https://arxiv.org/pdf/2007.14567v3#page=18), instead invokes the maximal-order upper bound with leading constant log 2, citing Hardy–Wright §18.1, Theorem 317. This yields `max τ(|a|) ≤ N^(log 2+o(1)) ≤ O(N^0.695)`. The count then gives `O(N^(0.005+0.695−1)) = O(N^−0.3)`.

The stronger estimate is already used correctly in E25's explanation. The defect is that it never becomes an item with a status and route, and the actual cited book is absent from `prerequisites`. E25 fixes the source's 3N/100N mismatch; it does not fix this extraction contract. S4's deferred proof work is permitted by §16, but its assertion that the supplier is already stated as used is inaccurate.

Add the precise maximal-order upper bound as one supplier item, or strengthen /129 while retaining its subpower consequence for /110. Route it through route 6 to `AnalyticNumberTheory:AN.5`, connect /48, and record the Hardy–Wright citation. The existing AdditiveCombinatorics packet has a related unresolved request for a bound with an unspecified constant; it does not provide the sharp constant needed here. No original supplier proof is required for this correction. The effect is confined to the recorded auxiliary lemma, hence medium severity.

## Audit evidence

Read all 65 pages of v3 and all 133 item statements, proof steps and dependency contracts, the definition contracts, all seven routes and both review files. The JSON lists the detailed checks. Rendered pages 18, 37 and 63 were inspected. Both embedded certificate programs reproduce their recorded results, including all 76,860 exact rational inequalities and all 33 table values.

All 22 credited library declarations were opened at the pinned commits. The structural check found 133 unique items, an acyclic dependency graph, and exactly one route for each missing item. The fresh atlas has 2,907 stages and 8,322 edges; routed layers, reviewed coverage and related plans were inspected. The source's existing 26 issues were compared with the extraction's repairs and are not repeated as new findings.

The two downloaded PDFs match the hashes in `sourceVersions`. Author-copy and v3 text agree on pages 2–65 after removing whitespace. The publisher PDF endpoint returned HTML, so this audit makes no claim about the unread published text. Searches of the arXiv history, publisher page, author listing and title/id plus correction terms did not locate a separate correction notice. This limited search is not proof that none exists.

Supplier proofs were not recursively audited; §16 delegates those to blueprint work. The recorded missing maximal-order contract is distinct from such proof closure. No Lean file was required or compiled.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23.result.json`
- `python3 research/blueprint/intake.py check-files` on the two deliverables
- `git diff --cached --check`
