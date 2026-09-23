# Review: PAPER-YUN-ZHANG-19 (Yun–Zhang, Shtukas and the Taylor expansion of L-functions (II))

Job `REV-PAPER-YUN-ZHANG-19` (issue #1134), by Claude Code, session `cc-39fac3`, 23 September 2026. The extraction was written by session `cc-442dc5` and Codex session `a71f92`. **Verdict: accept**, after the corrections below, which were made in place. All nine routes are accepted.

## What was read

- **The published version**, Ann. of Math. 189 (2019), 393–526, in the authors' published-layout PDF (135 pp., SHA-256 700e0b09…). This is the version the extraction read, and it was read in full again.
- **Method:**
  - Four checkers split the paper (§§1–2 and §4; §3; §§5–6; §7 and Appendix A). Each compared every item with the text, listed uncovered results and recorded mistakes checked on page images.
  - I checked every library citation at the pinned commits, every stage id, and the three Part II titles. The shtuka Part II is shared, with the same title, with PAPER-YUN-ZHANG-17 and PAPER-FENG-YUN-ZHANG-24.

## Changes made to the extraction

- **Statements:** 69 corrected, mostly missing hypotheses, explicit bounds in place of "sufficiently large", and vague pointers. The note of each says what changed.
- **Locators:** 58 corrected.
- **Library citations (items 1–7):** all exist at the pinned commits. They include Tau Ceti's `IsFunctionField`, `Divisor` and its degree lemmas, Mathlib's `quadraticChar` lemmas, `CategoryTheory.Ind` with `Ind.yoneda`, and `exteriorPower.finrank_eq`.
- **Statuses:**
  - **116:** planned (SF.5) → missing. It covers Chow groups of DM stacks and the Octahedron Lemma.
  - **120:** planned (EDC.8) → missing. It is Lefschetz for proper maps of DM stacks.
  - These coincide with PAPER-YUN-ZHANG-17/34 and /35, which are routed by unreviewed routes; cite those as owners.
  - **11:** keeps its planned status, but only its purity half is planned. The small-map criterion is not.
- **The extraction's own repairs:**
  - Items 36, 41, 52, 60, 63, 65, 66, 68, 93, 117, 118, 125, 135, 136, 150, 160 and 176 are **sound**.
  - Item 70's added gloss is **unsound**.
  - The repair of Theorem 7.5 (E28) needs a further step: after restricting to H^{Σ∪R}, e_π can pick up eigenspaces that agree with π away from R.
- **New items (50):**
  - 32 missing to ShtukaSpecialCyclesAndHigherSiegelWeil;
  - 7 missing to the GlobalShtukas source route;
  - 7 missing to RamifiedGeometricClassFieldTheory;
  - 3 missing to the GZ.5 source route;
  - 1 planned: unramified and Steinberg Whittaker newvectors (R16.2, AL.1).
- **Brief:** the ShtukaSpecialCycles brief now lists the corrections below.
- **Summary:** a closing paragraph records the counts after the review.

## Mistakes in the paper (`sourceIssues`, E1–E71)

- **E1–E37**, the extraction's, are all confirmed on page images. Some needed changes:
  - E10 is reclassified from gap to error: "Sht = ⋃_{κ} ≤κSht" is false when r < #Σ∞.
  - E17 becomes a misprint that affects nothing.
  - E25 now affects nothing: it is a transcription slip, correct in YZ17 §8.1.1.
  - E6 depends on an unstated convention for the coweights μ_i = ±1.
  - E20's extra bound is unnecessary.
  - E22 fails only for empty N_d.
  - E23 (Lemma 6.4) is false as printed.
- **E38–E71** are new.
  - **Errors or gaps in stated results:**
    - Remark 4.5 is false when Σ∞ = ∅: for r = 2 and μ = (1, 1), Definition 4.4 gives nothing.
    - (5.5) is not an open embedding when R ≠ ∅.
    - The map S′∞ → S∞ in (3.17) is canonical only when each point of Σ∞ has one preimage.
  - **Gaps in proofs:**
    - Applying Theorem 2.2 / Lemma 2.3 in (7.10): h□ at R is not left Iwahori-invariant. This is repairable through Lemma 2.6.
    - The twist in the proof of Lemma 3.6 has swapped indices; it fails once d_x ≥ 3.
    - The smoothness claim in Proposition 7.1(2) needs d′ ≥ 2g′ − 1.
  - **The rest are misprints.** Among them are two references to a nonexistent "Lemma 3.19(3)".
- **Effect:** none of these overturns the main theorem.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-YUN-ZHANG-19.result.json` reports no errors.
- `python3 research/blueprint/intake.py check-files` reports no problems.
- Every missing item is routed exactly once. Source routes also list the planned items they source, as the extraction did.
- Every stage id exists in the atlas.
