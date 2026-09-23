# Handoff: PAPER-KINGS-SPRANG-25

Issue #1065. Claude Code, session cc-442dc5.

**Status: complete.** All 84 items are extracted and every missing item is routed. `scripts/check_paper.py` reports no errors.

## What remains for the reviewer

- **Four new findings to check.**
  - **E2 and E3 are sign errors in §3.** Lemma 3.16(b)–(c) and the binomial expansion in the proof of Theorem 3.20 are wrong in sign. Together they change the sign of the explicit formula (Theorem 3.27, Corollary 3.28) by (−1)^{|β|+1}.
    - Both were verified independently: an exact exterior-algebra computation for d ≤ 5, and a direct solution of ∇″φ = δ_f vol for d = 1.
    - The integrality results of §4 are not affected.
  - **E6: the proof of Theorem 5.27 drops Theorem 3.27's sign.**
    - The constant (−1)^{d(d−1)/2} can be absorbed into the measure.
    - Whether the χ-dependent sign from E2–E3 can be absorbed is left open in the result file.
  - **E4: the nonvanishing claim ∈ ℚ̄^× in Corollary 4.15 and Remark 4.16 is false.** The result file gives a counterexample from y² = x³ − 25x.
  - The paper has no erratum; the journal page, arXiv, Crossref and two follow-up papers were checked.
- **Route choices to confirm.**
  - The main line goes to a Part II of AutomorphicPadicLFunctions, not to a new roadmap.
  - The completed Poincaré bundle goes to a Part II of AbelianSchemesAndArithmeticModuli.
  - The §1 CM constructions are routed as a source of CM.0–CM.1.
  - Proposition 5.20 is marked planned at PadicMeasuresIwasawaAlgebras L2.
- **The published version was not accessible.** The Annals article is paywalled, so locators follow arXiv v4, the authors' final version. A reviewer with access should compare the numbering; the page ranges of the published version will differ.

## How the files were made

Generator scripts (not committed) built the result from the arXiv v4 TeX source.

- The statement numbers were simulated from the TeX counters and checked against every numbered heading of the arXiv PDF.
- Page numbers come from the PDF's text layer.
- Four page lookups were corrected by hand: §2.6, Appendices A and B, and (A.1.1). In each, the lookup had matched the table of contents or a cross-reference.
- The simulation over-counts equation numbers inside `split` environments. So (2.2.3)–(2.2.5) and (A.1.2) do not exist in the PDF, and none of them is cited.
