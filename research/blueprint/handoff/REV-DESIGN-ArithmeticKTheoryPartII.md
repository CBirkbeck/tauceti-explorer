# REV-DESIGN-ArithmeticKTheoryPartII — completed independent review

Issue [#3497](https://github.com/CBirkbeck/tauceti-explorer/issues/3497). Worker: Codex, session `codex-ceIYIG`, 2026-10-19. The claim bot confirmed this session before work began. This is a completed review, not a checkpoint. The design was by the distinct session `codex-2LdeNX` on #3437.

**Accepted after corrections as a complete planning pass.** All five deliverables were reviewed and the packet, roadmap, reader and suggested Lean file corrected together. The [review report](../reviews/REV-DESIGN-ArithmeticKTheoryPartII.md) contains the evidence, changes, baseline assessment and source-finding table. The packet has the required independent review object with all 42 nodes checked: 22 corrected and 20 verified, none added or unverifiable. Its eight baseline citations are confirmed and none removed. All 19 source findings have individual confirmed verdicts with reasons and qualifications.

The main repairs are the possibly negative Hermitian reciprocity line and explicit stable Bott-linearity; the local place chosen fixed only in H∞; inverse-action native bar formulas and a distinguishing C₃/F₇ test; a nonvacuous continuous sign-module reduction test and exact reduction API; the sign between tangent and dual Hodge Chern characters; and the p-primary class argument for the finite action. All 36 original test kinds and proposed names were brought to protocol form, the same-type CM check sharpened, source locators corrected and all 42 source matches made specific. R4/R12 and their rescope proposals are synchronized. There are now 48 API items, 37 tests and 40 planets across nine layers.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticKTheoryPartII.json`: zero errors, zero warnings.
- `lean-check research/blueprint/suggested/ArithmeticKTheoryPartII.lean`: exit zero at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; only nine admitted-proof warnings. Available memory was 82 GiB. The suggested file is 106 lines, with two light real-bodied definitions, three API statements and eight examples. Both new examples have checked proofs. No high-level theory is claimed formalized.
- Checked JSON, local graph acyclicity, stage coverage, the 36 routed continuation items, 24 supplier requests, test kinds, all source verdicts, synchronized statements, links, allowed paths and whitespace.

Read the published FGV paper in full, pp. 225–319 including Appendix A, using the [version of record](https://link.springer.com/content/pdf/10.1007/s00222-022-01127-8.pdf), SHA-256 `5da9a2b28d13b2b22a262a81650188025020d92238ec2b47404d177ef91d7b4d`. All repository statements are in our own words. No restricted book was used or source passage copied. Secondary sources are retained behind their suppliers' exact contracts, without a claim that their original proofs were independently read.

Checked current TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` read-only, including all nine newer roadmap families. Read the complete GrothendieckEulerForms and AlgebraicVectorBundles README/Suggested pairs and the ProfiniteArithmetic boundary. No duplicate higher symplectic target was located. Generic theories stay with the owners listed in the reader. No other owner's files were edited and no mathematics was moved down from a higher tier.

Nothing remains for this review job. Later work must preserve all nine stages as **planned**, all implementation statuses **unchecked**, the 24 open requests and these exact gaps:

- **G1:** EH.6/G7 and R22 still owe coherent graded ppav realization, including product/Γ/Aut(C)/coefficient/limit compatibility and Moore smashing before completion at p=3. This obligation propagates to the spectrum action and universal extensions.
- **G2:** The Hurewicz endpoint 2p−2 needs a separate argument for the possible delooped P¹ extension. The planned theorem stops at 2p−3; even applications need at most 2p−4.
- **G3:** The equality p=max n_j lacks the integral Chern-character argument. The family theorem uses p>max n_j.

E10 and E12 record proof gaps, not counterexamples. E14 is qualified: Proposition A.2 itself states finite-type assumptions; its unqualified use on the infinite genus union is the issue. No question for the orchestrator blocks acceptance. The report and packet contain everything needed for packaging; no scratch-only material is required.
