# REV-PAPER-DISEGNI-22 handoff

Status: **complete independent review**, not a review checkpoint. Overall verdict: **revise**; input extraction remains **partial**.

Codex — codex-a71f92, 24 September 2026. Refs #1261. Input was authored by Claude Code cc-7b31c4 in PR #2177; reviewer did not author the input. Bot claim confirmation: comment 5804851257.

## Delivered

- Checked all 153 items, all nine routes, both briefs, seventeen prerequisites and six original source findings against the complete public v4 source.
- Read the published correction completely, collated the author manuscript at finding locators, and checked specified supplier passages. Original subscription journal full text was unavailable.
- Corrected clear errors in place; 153 stable items now have 0 library / 17 planned / 136 missing statuses. All missing items have exactly one provisional route.
- Accepted corrected local source route 9 only; rejected routes 1–8 pending precise scope, owners, hypotheses and proof/API closure.
- Recorded 23 source verdicts: 22 confirmed (three known author corrections, nineteen additional findings) and E6 rejected. No author notification.
- Added twelve targeted API/test outlines, explicit unresolved gaps, updated bibliography and a complete human change log.

## Validation executed

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-DISEGNI-22.result.json`: pass.
- Item/route/source inventory: 153 unique items, 136 missing each routed once, 23 source verdicts, nine route verdicts: pass.
- Elementary scratch regression witnesses for the Q₃ matrix identity, odd-Pfaffian mixed coefficient, lattice denominator, rank, sign and Tor degree: pass. Counterexamples and formulas are reproduced in the review/result; the scratch script is not a deliverable.
- `python3 -m unittest tests.test_check_paper tests.test_source_issues tests.test_check_errata tests.test_errata tests.test_papers_queue tests.test_intake`: 55 tests pass.
- Five authorized deliverables passed the intake file check with zero problems.
- Fresh-main preflight at `5c28e9baff4a34747237a32c32023b6dc4ad4dbc` (tree `f9432000a02b03ddf1112a31aa04dfc0d5acf24e`) compared 302 relevant input/instruction/owner/audit/checker files against the reviewed snapshot: no changes.
- No Lean file was requested or compiled. No claim of formalization.

## Where revision resumes

Follow the six result gaps and the review's item-level change log. Split bundled statements; extract exact external theorem hypotheses; resolve shared Azumaya/cochain/Pfaffian ownership; repair and prove the odd Pfaffian construction, nonsplit matrix computation and height-transport compatibility; complete APIs/tests and corrected endpoint briefs. Treat the companion Selmer proposal as unreviewed, not an available import. Use only corrected route 9 as a blueprint source.

Only the four issue deliverables and this handoff are published. No atlas, other job, library, downloaded PDF or scratch file is changed.
