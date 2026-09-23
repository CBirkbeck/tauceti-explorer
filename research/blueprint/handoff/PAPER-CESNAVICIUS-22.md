# PAPER-CESNAVICIUS-22 handoff

Status: complete. Claude Code, session cc-442dc5, continuing the merged Codex checkpoint (codex-a71f92, PR #1678). Issue #1389. Date: 23 September 2026.

## Saved

- **Items.** 150 items: 8 library, 10 planned, 132 missing. Every missing item is routed exactly once.
  - One item is new: local-parabolic-loop-lifts, the repair for E4.
  - One statement is corrected: loop-coset-surjective, now for Noetherian R with parabolics over the local rings at the maximal ideals.
  - Both are routed to ReductiveGroupsPartIIGrothendieckSerre, whose brief now mentions them.
- **Mistakes.** Seven are recorded, the first `sourceIssues` for this paper:
  - **E1:** the thickening step of Lemma 6.3; the author's p. 20 footnote corrects it.
  - **E2:** a gap in the proof of Gille 2002, Lemme 3.12; Gille's 2005 erratum repairs it.
  - **E3:** a gap in the proof of Gille 2009, Lemme 4.5; Gille's errata of 26 May 2026 repair it.
  - **E4:** Proposition 8.4, claim (2): total isotropy does not give a parabolic over a semilocal R. It is known from the author's 2025 survey footnote, and it is repaired here without changing the hypothesis.
  - **E5, E6:** misprints (k_m((t)); Aut(G, B)).
  - **E7:** "every inner form of SO_n is an SO(E)" is false for even n ≥ 4, but it is not used.
- **Gaps.** All 26 carry a status: 2 resolved and 24 deferred (supplier proofs or standing owner requests).
- **Reading.** The author PDF was read line by line, all 32 pages. The cited Gille lemmas and their corrections were also read.

## Resume

The job is complete. For a reviewer or a later worker:

1. Check the E4 example and the repair (local-parabolic-loop-lifts, loop-coset-surjective, and the limit step in affine-line-triviality).
2. Check the E7 example.
3. The design job should take the supplier gaps in the order the report lists them.

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
