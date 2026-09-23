# Handoff: PAPER-BREUIL-ETAL-23

Issue #1241. Agent Claude Code, session cc-442dc5, 23 September 2026. Status: **partial** (first extraction).

## Saved

- `research/blueprint/papers/PAPER-BREUIL-ETAL-23.result.json`. 17 items, all missing, each routed exactly once across three routes (one new, two Part II).
- `research/blueprint/papers/PAPER-BREUIL-ETAL-23.md`. The report.

**Source.**
- arXiv v4 (final version, 112 pages): https://arxiv.org/pdf/2009.03127v4, SHA-256 8f06c68bbb85aa3d13420181197167b3ce9158dc117e96da6299718765f99e7a.
- The Springer PDF of DOI 10.1007/s00222-023-01202-8 returned HTML here.

## Resume

1. **Add items for the remaining numbered statements (v4 numbering).**
   - §2: Definitions 2.3.1, 2.3.3, 2.3.4; Propositions 2.4.2, 2.4.3; Lemmas 2.4.4, 2.4.6.
   - §3: Definitions 3.1.1, 3.1.4, 3.1.6, 3.1.8, 3.2.1, 3.2.4, 3.2.5; Propositions 3.1.5, 3.1.7, 3.1.9, 3.2.7; Lemmas 3.2.3, 3.2.6, 3.2.8, 3.3.1; Corollary 3.2.9.
   - §4: Lemmas 4.1.1, 4.1.2, 4.2.3, 4.2.4, 4.3.2; Propositions 4.2.1, 4.3.1, 4.3.3; Corollary 4.2.6.
   - §5: Lemmas 5.1.2, 5.1.3, 5.3.1, 5.3.2; Proposition 5.3.3; Theorem 5.3.4.
   - §6: Lemmas 6.1.1–6.1.3, 6.2.1, 6.2.3, 6.3.1, 6.3.3–6.3.5, 6.3.7–6.3.9, 6.4.3, 6.4.4; Corollaries 6.1.4, 6.3.13, 6.3.15, 6.4.5; Propositions 6.2.2, 6.2.4, 6.3.10, 6.4.1; Theorem 6.3.11.
   - §7: Lemmas 7.1.1, 7.1.2, 7.1.4, 7.2.1, 7.3.2, 7.4.2; Propositions 7.2.2, 7.3.1, 7.4.1, 7.4.3; Theorem 7.3.3.
   - §8: Lemmas 8.1.2, 8.2.1, 8.2.2, 8.3.1, 8.3.2, 8.3.5, 8.3.6, 8.3.8; Propositions 8.2.3, 8.2.6, 8.3.3, 8.3.7; Corollaries 8.2.4, 8.3.10; Theorems 8.3.4, 8.3.9, 8.3.11, 8.4.3.
2. **Replace paraphrases with exact statements.**
   - Items `generic` and `def-rings` summarise definitions and sections.
   - Item `local-gk` gives Theorem 1.4's introduction form; copy the stronger Theorem 6.4.7.
   - Item `flatness` abbreviates §8.5's notation.
3. **Check library evidence** (Mathlib, Tau Ceti) for the foundational inputs: Iwasawa algebras, GK dimension of modules, Kisin modules.
4. **Read the proofs** for `sourceIssues`.
5. **Coordinate the new route** `ModpRepresentationsOfGL2OverLocalFields` with PAPER-COLMEZ-DOSPINESCU-NIZIOL-23, which proposed the same id.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BREUIL-ETAL-23.result.json` reports ok.
- `python3 research/blueprint/intake.py check-files` on the three files reports no problems.
- Lean: not applicable.
