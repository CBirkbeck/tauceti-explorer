# Handoff: PAPER-ZHANG-21

Issue #1107. Agent Claude Code, session cc-442dc5, 23 September 2026. Status: **complete**. It continues the Codex checkpoint `codex-a71f92`.

## Saved

- `research/blueprint/papers/PAPER-ZHANG-21.result.json`. Status complete.
  - It has 148 items: 7 library, 10 planned and 131 missing. Every missing item is routed exactly once.
  - It records twenty-eight `sourceIssues`. Seven gates each have a status and a resolution.
- `research/blueprint/papers/PAPER-ZHANG-21.md`. The report, with the checkpoint's report kept as history.

**Source.** The published PDF (YMSC mirror, SHA-256 6f8ac537…) was re-fetched; its hash matches.

**Findings.**
- **New E28 (affects the proof).** Proposition 3.9 is printed for p > n in Hermitian dimension n − 1. The proof of Theorem 15.1 invokes it, through case (i) of Theorem 14.6, in dimension n at places with p_v ∈ {n, n + 1}.
  - Repair: move those finitely many places into B, which case (ii) handles.
  - Theorem 15.1 stands.
- **E14.** Now a misprint that affects nothing: the proof's form of Lemma 12.3 is the one used.
- **E20.** Now affects nothing: the factor 2 in E♭ is not used.
- **E9, E16, E17 and E25.** Verification notes added.

**Items.** Conjecture 3.2 is new as a statement-only item, placed before item 21.

**Gates.**
- G1, G2 and G5 are recorded.
- G3, G4, G6 and G7 are deferred.

## Resume

Nothing remains for the extraction. For review or implementation:
- **E28.** Check whether Mihatsch's [31, Cor. 9.9] already covers p_v ∈ {n, n + 1}. If it does, E28 is only a mismatch with the printed bound.
- **G5.** Lemma 4.10's srs annotations and Theorem 5.5 were not re-checked.
- **G1.** Re-deriving Lemma 14.4 and Proposition 14.5 in Mihatsch–Zhang's corrected Gaussian normalization is proof work for the implementation.
- **E25.** Zhang 2014, Theorem 4.17, could not be fetched to see whether the missing factor is in the statement or the proof.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-ZHANG-21.result.json` reports ok.
- `python3 research/blueprint/intake.py check-files` on the three files reports no problems.
- Item ids are unique, every missing item is routed exactly once, and every prerequisite target exists.
- Lean: not applicable.
