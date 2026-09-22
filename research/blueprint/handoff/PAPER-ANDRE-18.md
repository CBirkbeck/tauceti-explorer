# Handoff: PAPER-ANDRE-18 — closed

Opened by GPT-6 Astra Pro, session `g6ap-0921-andre-7c4e`, 21 September 2026 (first checkpoint, PR #1638); continued by ChatGPT Pro, session `cgp-0922-b7d49a`, 22 September 2026 (second checkpoint, PR #1807). **Closed** by Claude Code, session `cc-fb70e5`, 22 September 2026. Issue #1464. Status of the extraction: **complete**. Nothing is outstanding for a further worker; this file is kept because a submission never deletes a file, and it is superseded by the report, [PAPER-ANDRE-18.md](../papers/PAPER-ANDRE-18.md).

## The second checkpoint's six resume items, and what became of them

1. **"Independently review E1 and audit later uses of the stronger uniqueness claim."** Done. E1 is confirmed — the counterexample on C_p is correct, and the same assertion and proof are in arXiv v1, so it was not introduced in production. The audit: the assertion occurs on pp. 13, 22 and 41 and is used once, in the proof of Lemme 2.4.1(2), where it is repairable by the paper's own part (3) via the characteristic polynomial and [6, 3.1.2 prop. 1]; at p. 41 the valid justification is given alongside. No main theorem is affected.
2. **"Continue the remaining §2 extraction … read/extract §§3.1–3.4 completely … finish §3.9, §4.1, §4.2 examples and §5.4."** Done: 114 new items covering §§2.1–2.9, 3.1–3.4, 3.6–3.9, 4.1 and 5.4. The JSON holds 199 items, 126 of them missing and each routed exactly once.
3. **"Split the inherited multi-assertion §1 packages."** Not done, and recorded as the gap `foundational-granularity`. Those items are `planned` against PerfectoidSpaces:P0, so nothing is unrouted; splitting them is design-job work.
4. **"Finish the reviewed library audit … resolve the four norm-comparison owners."** The ten Mathlib declarations were re-checked at the pin and all exist. The four comparison lemmas and the §2.2.4 diagnostic are now routed as a source route to `AdicSpacesPartII:R0`, with the reasoning recorded in the route and in the gap `topological-algebra-ownership` — not privately inside PerfectoidRamification, which is what this checkpoint asked to avoid.
5. **"Screen the original prerequisite candidates and remaining bibliography."** Done: the empty `prerequisites` array now has 22 entries, weighted by a citation pass over the text and with DOIs verified through Crossref.
6. **"Complete main-source provenance with actual PDF bytes/SHA-256."** Done: the published Numdam PDF was downloaded and hashed (`087521436778eed5…`, 70 pp.), and arXiv v1 as well; they are not the same text.

## Added beyond the resume list

Ten further source issues, each verified in the published text by the closing worker and on rendered page images where a glyph or exponent decides the matter — among them a sign error in an exponent in Exemple 3.4.2 that removes the contradiction the argument needs, a false bound in the proof of Lemme 2.6.3, a Boolean-algebra presentation that collapses as printed, and a systematic double numbering under which 44 numbers denote both a paragraph and a statement. A second routing defect was also corrected: the Part II route carried `area: cohomology`, the atlas *group* of PerfectoidSpaces rather than a galaxy id.

## Checks at closing

`scripts/check_paper.py`: ok, with `"status": "complete"`, which enforces exactly-once routing of every missing item. `research/blueprint/intake.py check-files` on the deliverable paths: 0 problems. No Lean file was compiled; none belongs to a paper issue.
