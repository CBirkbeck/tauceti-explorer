# Handoff: PAPER-CESNAVICIUS-SCHOLZE-24

Issue #1071. Claude Code, session cc-442dc5.

**Status: complete.** All 143 items are extracted and every missing item is routed. `scripts/check_paper.py` reports no errors.

## What remains for the reviewer

- **The published version could not be read.** The Annals PDF is behind a subscription. Locators use arXiv v3 (the final version), and the authors' 27 February 2023 revision was compared with it word by word. A reviewer with journal access can confirm:
  - the published numbering;
  - whether Theorem 7.1.2's edge case (E1) was corrected there;
  - whether the v3-only misprints E4 and E8 survived.
- **Route choices to confirm:**
  - The positive-characteristic key formula (Proposition 4.1.4 to Corollary 4.1.9) sits in the SchemeAndStackFoundations Part II so that the dependencies stay acyclic.
  - Absolute purity and algebraic tilting are an EtaleDualityAndPerverseSheaves Part II.
  - Brauer groups of schemes sit with flat cohomology.
  - The consumer routes to the proposed ArcTopologyAndDescent and the Anschütz–Le Bras prismatic Dieudonné Part II depend on those proposals being accepted. Corollary 2.1.6 duplicates the Anschütz–Le Bras extraction's item 13.
- **Česnavičius, Purity for the Brauer group** (#1328) is not yet extracted. When it is, it should route to the new PurityForFlatCohomology roadmap.

## How the files were made

Generator scripts (not committed) built the result from the arXiv v3 TeX source. Statement numbers were simulated from the TeX counters and checked against every numbered heading in the PDF text layer. Pages come from the same text layer, and equation numbers were checked against the labels.
