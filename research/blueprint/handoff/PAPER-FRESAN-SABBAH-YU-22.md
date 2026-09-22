# Handoff: PAPER-FRESAN-SABBAH-YU-22

Claude Code, session `cc-442dc5`, 22 September 2026 (issue #1316). This completes the checkpoint of session `cc-7b31c4`.

## Done

The extraction is complete (`status: complete`). `scripts/check_paper.py` reports ok, `intake.py check-files` reports no problems, and every missing item is routed exactly once.

**Deliverables:**

- `research/blueprint/papers/PAPER-FRESAN-SABBAH-YU-22.result.json`: 92 items (2 library, 10 planned, 80 missing), six routes, 36 prerequisites, 7 source issues, and the four checkpoint gaps closed with resolutions.
- The report, `research/blueprint/papers/PAPER-FRESAN-SABBAH-YU-22.md`, which lists every change made to the checkpoint.

**What was read.** arXiv v5 (the authors' final published version), at proof level throughout:

- the checkpoint read §1, §2.1 and §3.1;
- this session read §§2.2–2.3, 3.2, 4, 5 and A.1–A.7, and re-read §§2.1 and 3.1.

The Duke text is by subscription and was not read. Locators give arXiv v5 page numbers, pinned from the compiled PDF.

**How the four gaps were closed:**

- **G-PROOFS-4-5.** Twenty-seven new items (66–92) name the inputs of §§2–5. Eleven existing items were restated exactly.
- **G-APPENDIX-PROOFS.** The scope of Saito's theory that `MixedHodgeModulesAndIrregularHodgeTheory` must build is fixed in item 11 and in that route's brief.
- **G-SOURCE-ISSUES.** Seven misprints, E1–E7, are recorded.
- **G-LIBRARY.** Tau Ceti f790474 has mixed Hodge structures, so item 2 became `library`. Nothing else is in either library.

## Judgement calls for the reviewer

**Two new source routes:**

- LefschetzPencilsAndVanishingCycles LPV.2 takes Illusie's non-ordinary quadratic singularity, item 78, which the paper needs at p = 2.
- ArithmeticGaloisRepresentations R01.2 takes Lemma 5.40, item 89, split out of the checkpoint's item 59.
- Each route also lists one planned item: 77 and 88.

**General theorems kept with the application.** Items 87 (Serre's gamma factor), 91 (Serre's semisimplification theorem) and 92 (T. Saito's sign theorem) are routed to `KloostermanMomentsAndPotentialAutomorphy`, their only consumer here.

**Weil's bound for Kloosterman sums (item 66)** is marked planned in FF.2.

**Corrections to the checkpoint:**

- Item 14's description of EMHS was false and was replaced.
- Several locators cited nonexistent §§5.5–5.7; they now cite §§5.1.x and 5.3.x.
- Item 43 cited (3.4) for 𝑴_k, which is (3.1).
- Item 16 cited A.4, which should be A.3.
- Item 47 wrote j_{0!} for j_{0!*}.

## Leads not recorded as source issues

**Typographic slips:**

- parentheses in the proofs of Proposition 2.4 and Theorem A.24(1);
- "≤ im(β)^{G,χ}" for "≤ dim im(β)^{G,χ}" in the proof of Theorem 5.17;
- M₁^H for M^H in the proof of Corollary A.31.

**Imprecise wording:**

- Remark 5.28 calls the even-k Hodge polygons "strictly above" n(n−1), although Figure 1 shows that they touch it at the intermediate vertices.
- §5.3.1 calls det(ρ) "the non-trivial character" of Q_p(√±k!!), which can be locally trivial.

**Not verified:** the Picard–Lefschetz sign (−1)^{k/2} in the proof of Theorem 5.17 was not checked against the conventions of SGA 7; LPV.2 plans that sign table.

## Not done

Nothing remains in the extraction.
