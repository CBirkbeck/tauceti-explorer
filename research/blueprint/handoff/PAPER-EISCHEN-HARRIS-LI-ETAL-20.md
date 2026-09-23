# Handoff: PAPER-EISCHEN-HARRIS-LI-ETAL-20

Issue #1400. Claude Code, session `cc-2aeb03`, 23 September 2026. Status: **complete**. This continues the first extraction by session `cc-d67081`, whose checkpoint was merged in #2156.

## Done

- **`research/blueprint/papers/PAPER-EISCHEN-HARRIS-LI-ETAL-20.result.json`** contains:
  - 458 items: 1 library, 417 planned, 40 missing;
  - one Part II route, which takes all 40 missing items;
  - 40 prerequisites;
  - 160 `sourceIssues`: 101 misprints, 27 errors and 32 gaps.
- **`research/blueprint/papers/PAPER-EISCHEN-HARRIS-LI-ETAL-20.md`**: the report.

**What was read.** The whole of arXiv v5 was read on rendered page images, statements and proofs, and arXiv v1–v4 were consulted at every recorded mistake. The published PDF could not be retrieved (www.cambridge.org returned 404 or HTML on 23 September 2026), so all locators are to v5.

**How the mistakes were checked.** 61 of the recorded mistakes are errors, or reach a proof or a stated result. Each of these was checked a second time, independently, at its locator: 52 were confirmed, 8 reclassified and 1 rejected (the rejected one was dropped).

## What changed from the first extraction

- Every item now has its exact statement, and multi-part results are split.
- Pure notation and three conjectural expectations are not items. The report lists them.
- **The route.** It now uses the roadmap id `AutomorphicLFunctionsAndLocalFactorsPartIIDoubling`, the Part II that PAPER-CAI-FRIEDBERG-KAPLAN-24 already proposes for the generalized doubling method. The first extraction proposed a second Part II of the same roadmap, which would plan the doubling method twice. The brief asks for one roadmap covering both papers.
- **Moved to planned at L4.** The Siegel–Weil sections at p, the (anti-)ordinary test vectors and the local factor at p are now planned at AutomorphicPadicLFunctions L4. L4 asks for "ramified and p-adic local calculations", and three other extractions read it the same way.

## For the reviewer

The report's "Judgement calls" section lists the choices a reviewer may revisit. Two findings go beyond this file:

- **L4 is too large for one layer.** It carries 341 items of this paper, so its blueprint job will need to divide it.
- **An overlap with Li–Liu.** PAPER-LI-LIU-22 routes the unitary doubling zeta integrals to a different Part II (`UnitaryArithmeticInnerProductFormula`). The maintainer should reconcile that route with this one.

**The most consequential mistake is sourceIssues E52.** The section at p is evaluated in the wrong coordinates, so Theorem 4.3.10 computes the zeta integral of a translate of the section the paper defines. Whether this affects the Main Theorem depends on which section the Eisenstein measure of [Eis15] uses. Checking that would need a reading of Eischen's paper, which is outside this job.

## Checks

- `python3 scripts/check_paper.py` reports ok.
- `python3 research/blueprint/intake.py check-files` on the three files reports 0 problems.
- Lean: none.
