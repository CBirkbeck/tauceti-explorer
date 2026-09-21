# PAPER-CIUBOTARU-HARRIS-26 — checkpoint handoff

Worker: ChatGPT (GPT-6 Astra Pro), session `c0-5fbc06`. Issue: #1057.
Date: 2026-09-21. Status: **partial**, not a completed extraction of the published revision.

## Work saved

The accompanying result and report extract the public author version, arXiv:2311.15300v1 (26 November 2023), distinguish existing suppliers from additional mathematical targets, and preserve the restrictions on the generic and nongeneric conclusions. Read the report before using the proposed routes: they are checkpoint proposals, not accepted ownership decisions or formalization claims.

The main existing proposed owners consulted are `GlobalShtukasAndFunctionFieldLanglands`, `SmoothRepresentationsOfLocalGroups`, and `DeligneWeightsAndPurity`. The old identifier `SmoothRepresentations` still occurs in historical comparison files; it is not the current owner. The upstream LieHighestWeight and ReductiveGroups material is imported, not replanned. The reviewed REV-AUDIT-20 report was read as a fallback when the large combined library-coverage file could not be retrieved. Mathlib's `IsSl2Triple` statement was independently read at the required full pin.

## Resume here

1. Obtain the final Annals text (204 (2026), no. 2, 545–601, DOI 10.4007/annals.2026.204.2.3) or the authors' matching accepted manuscript. The publisher records a revision of 8 October 2025, whereas the accessible arXiv v1 is dated 2023. Matching title and abstract do not establish that the versions agree. Compare theorem numbering, hypotheses and proofs, then record the actual downloaded file's SHA-256. The web reader exposed the v1 PDF, but neither container network requests nor the download tool supplied its bytes; no PDF hash has been invented.
2. Finish a declaration-by-declaration audit at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed audit is evidence about its own scope, not an exhaustive fresh search of both libraries. In particular, recheck the generic Lie-theoretic and filtration targets before accepting the proposed Part II ownership.
3. Read the primary proof inputs, not just Ciubotaru–Harris's citations: Gan–Harris–Sawin on pure discrete-series parameters; the Barbasch/Ciubotaru classification papers, including the nonsplit transfer; Kazhdan–Lusztig and Reeder; Collingwood–McGovern and Carter; and Xue's precise quotient-parametrization theorem. The report records the theorem contracts and the currently unread proof interiors.
4. Complete the remaining low-level case computations and certify the appendix tables from explicit root/weight data. Tables 2–4 are not supplied here as verified computation certificates. Independently check the exceptional-group separating characters and the reduction from E8 to Levi subalgebras. Do not infer equality of nilpotent classes from equality of positive Satake parts without an explicit theorem that supplies that implication.
5. Run the repository-wide `scripts/check_paper.py` on the result against the complete current atlas and review any CI feedback. Locally reported bounded checks, when present, are not a substitute for this full check. No Lean file is required by this paper job, and none was compiled.

## Specific traps to retain

* Mathlib's `IsSl2Triple h e f` includes `h != 0`; the paper also needs the zero nilpotent orbit. Give the zero case its own constructor/comparison rather than asserting definitional equality.
* The generic theorem excludes the odd-dimensional quasi-split unitary case at the distinguished generic place. The nongeneric results are stated at split places and require an actual compatible global parameter (or the explicitly conjectural discrete-spectrum extension).
* The introduction calls an input “Conjecture 9.3”; in v1, (9.3) is a displayed decomposition and the corresponding numbered conjecture is 9.5. Preserve the mathematical hypotheses, not this unstable label.
* “Geometric” in Definition 2.5 includes algebraicity and all complex embeddings. The real half-integral test in Section 6 does not by itself imply those arithmetic properties of the compact factor.
* Aubert–Zelevinsky preserves the semisimple parameter in Proposition 4.5. It does not preserve the full Weil–Deligne monodromy operator.
* The source has apparent transcription errors: the parity of j in the Sp-case proof after Theorem 8.5 conflicts with the theorem statement, and several Section 10.2 comparisons print n_v on both sides of a strict inequality. They require a computation/source check, not silent promotion to verified statements.
* Appendix tables are labelled Fil_i, but their non-monotone rows describe weight multiplicities rather than dimensions of an increasing filtration. An implementation must give the associated-graded/cumulative-filtration conversion explicitly.
* Property A is a lexicographic alternative, not an equality theorem. Remark 10.8 supplies a two-dimensional counterexample to the stronger assertion.

## Submission discipline

This is a checkpoint for #1057: use `Refs #1057`, not `Closes #1057`. Do not merge, change labels, or review this worker's own submission. A later worker should preserve useful item IDs, repair/refine the contracts, and set `complete` only after resolving the version, coverage, ownership and verification obligations above.
