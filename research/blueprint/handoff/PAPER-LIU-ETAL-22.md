# Handoff: PAPER-LIU-ETAL-22

Issue #1280. Claude Code, session `cc-2aeb03`, 23 September 2026. Status: **complete**. This continues the checkpoints merged
in #2181, #2205, #2218, #2224, #2236 and #2239.

## Done

- **`research/blueprint/papers/PAPER-LIU-ETAL-22.result.json`** contains:
  - 739 items: 12 library, 32 planned, 695 missing;
  - the checkpoint's 21 routes;
  - 18 prerequisites;
  - 126 `sourceIssues` (75 misprints, 30 gaps, 21 errors).
- **`research/blueprint/papers/PAPER-LIU-ETAL-22.md`**: the report.

**What was read.** The whole published article (journal pp. 107–375) was read on rendered page images, statements and
proofs, in eleven page ranges. arXiv v1–v3 were compared at every mistake. The companion papers [51] and [47] were read where
the paper cites them.

**What was checked.**

- The earlier findings E1–E16 were re-checked on the page image.
- 40 claims were checked a second time, independently: every error and every mistake reaching a proof or a stated result.
  One was rejected and two were merged into E9 and E10. E1, E2 and E23 had two further checks, one of them arguing the
  authors' side.
- The Appendix B identities were recomputed for small rank.
- The finite-group and Galois counterexamples were recomputed by machine: for E1, E21, E32 and E9.

## What changed from the checkpoints

- **Items.**
  - Every item id is kept except `Z08`, which cites a 2025 survey. Each item is restated from the page image, and bundled
    results are split.
  - `S23`, `S24` and `localization-selmer` now hold the paper's Lemma 2.6.4 and Propositions 2.6.6 and 2.6.7. The
    corrected statements stored there before move to `S23-formula`, `S24-conditional` and `S25-onesided`.
  - The other corrected-statement items (`S23-*`, `S24-*`, `S25-*`) are carried over with their fields, because the
    re-check found them correct.
- **Open questions settled.** The checkpoint's open questions are answered:
  - **E1:** real, and an error.
  - **U1:** the ℙ¹-bundle of Lemma 5.11.3 is not trivial (E74).
  - **U2:** the arrows after Notation 5.10.13 are printed in the wrong direction, a misprint (E71).
  - **E8:** an error in Lemma 5.9.3(6).
  - **E13:** repaired by the intertwining composite.
- **Top-level fields.** The four `continuation*` records and `openInvestigations` are removed as superseded. `coverage`,
  `validation` and `readLedger` are rewritten.

## For the reviewer

- **E1 cluster and §8.** Read the source issues E1, E2, E23 and E102 together. Lemma 2.6.4 is false for [F:F⁺] = 2; the
  §8 proofs have a gap in the base-change case. No main theorem is shown false. Two independent checks agree on this.
- **Unconditional theorems (E30).** They depend on the unpublished Kisin–Shin–Zhu [37]: Proposition 3.2.11 defers N ⩾ 3
  with F⁺ ≠ ℚ to it.
- **Shared ids.** The Part II ids UnitaryRapoportZinkSpacesAndRSZModels and PolarizedAutomorphyLifting, and the new id
  GanGrossPrasadConjecturesForClassicalGroups, are shared with other extractions named in their briefs. The design jobs
  should read those together.
- **Corrected-statement items.** They are routed with ES.1/ES.4 and have "not in the paper" locators. Accept them as
  corrected statements, or ask for them to move into the source issues' corrections.

## Checks

- `python3 scripts/check_paper.py` reports ok.
- `python3 research/blueprint/intake.py check-files` on the three files reports 0 problems.
- Lean: none.
