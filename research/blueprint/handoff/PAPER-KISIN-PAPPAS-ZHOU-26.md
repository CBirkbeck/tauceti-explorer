# Handoff: PAPER-KISIN-PAPPAS-ZHOU-26

Issue #1342. Agent Claude Code, session cc-442dc5, 23 September 2026. Status: **complete**. It continues the Codex checkpoint `codex-c83e7a`.

## Saved

- `research/blueprint/papers/PAPER-KISIN-PAPPAS-ZHOU-26.result.json`. Status complete.
  - It has 205 items: 14 library, 13 planned and 178 missing. Every missing item is routed exactly once.
  - It records fourteen `sourceIssues`, E1–E14. The checkpoint recorded none.
- `research/blueprint/papers/PAPER-KISIN-PAPPAS-ZHOU-26.md`. The report, with the checkpoint's report kept as history.

**Source.**
- The publisher's PDF returned HTML here.
- The published text was read from the Cambridge repository copy: 89 pages, SHA-256 b3e4bf8b…, recorded in `sourceArchives` as `cam-repository`.
- arXiv v3 was compared with it; its SHA-256 (d0834555…) matches the checkpoint.

**Findings.**
- E1–E7 are the paper's own printed corrections: [KP18] Lemmas 3.1.9 and 3.1.12, 3.2.12 and the results that depend on it, Theorem 4.2.7, Lemma 3.1.17, Lemma 4.6.13 and Corollary 4.6.15, and 4.6.21; and [P23] §4.5 and §8. They keep `known` values that name this paper.
- E8: Remark 4.1.5(2)'s surface is reducible, so it is not normal.
- E9: the adjacent-weight criterion of §4.2.9 fails in characteristic p, so the proof of Proposition 4.2.10(2) is incomplete. Theorem 4.2.3 stands, because only minuscule pairs are needed.
- E10–E14 are misprints: weight notation, the B/D coordinates, the D^H sign, the sign in Corollary 4.2.19, and the garbled sentence in Lemma 7.2.8.

**Items.**
- F34 (Lemma 5.1.11) and S43 (Lemma 7.2.5) are new.
- The introduction forms of Theorem 1.1.1, Corollary 1.1.2 and Theorem 1.2.3 are mapped to S32–S35, S37 and R30.
- R12's locator is now Proposition 4.2.10(2).

**Gaps.** G-roots, G-reps and G-global are recorded. The other eleven are deferred as cited suppliers or design work.

## Resume

Nothing remains for the extraction. For review or implementation:
- **E9.** Whether Proposition 4.2.10(2) holds in characteristic p for arbitrary λ ≼ μ is open. The bound over minuscule pairs is proved, and it suffices for Theorem 4.2.3.
- **Deferred gaps.** Each names the cited suppliers still to be extracted.
- **Owner reconciliation.** The checkpoint's note on the overlapping root-system owners (HE21 and KZ25) still applies.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-KISIN-PAPPAS-ZHOU-26.result.json` reports ok.
- `python3 research/blueprint/intake.py check-files` on the three files reports no problems.
- Item ids are unique, every missing item is routed exactly once, and every prerequisite target exists.
- Lean: not applicable.
