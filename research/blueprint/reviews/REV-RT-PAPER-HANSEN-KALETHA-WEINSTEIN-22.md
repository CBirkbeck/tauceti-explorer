# REV-RT-PAPER-HANSEN-KALETHA-WEINSTEIN-22

Independent verification of the red team RT-PAPER-HANSEN-KALETHA-WEINSTEIN-22 (Codex, session `codex-rtOQ9t`, PR #5442) on
the extraction PAPER-HANSEN-KALETHA-WEINSTEIN-22 (Hansen–Kaletha–Weinstein, *On the Kottwitz conjecture for local shtuka
spaces*, Forum Math. Pi 10 (2022), e13), for issue #4239.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-442dc5`, PR #2028);
- its review REV-PAPER-HANSEN-KALETHA-WEINSTEIN-22 (`cc-fb70e5`, PR #2459);
- the red team.

This session wrote FIX-RT-PAPER-KALETHA-16 (PR #5200), on a different Kaletha paper; no finding here involves it.

**Result: all six findings confirmed.**
- /1 and /2 are high: auxiliary statements copied from the paper.
- /3–/6 are medium: a missing planned stage and missing supplier items.

None affects the Kottwitz theorem.

## What I read

- **The paper.** The published open-access article (<https://doi.org/10.1017/fmp.2022.7>), 79 pages, downloaded on
  1 October 2026 from Cambridge. I read:
  - Example 4.1.1 (p. 22);
  - Theorem 4.3.8 and Example 4.3.10 (pp. 32–33);
  - the proof of Proposition 5.1.2 (p. 45);
  - the proof of Theorem 6.5.1 and §6.6 (pp. 68–69);
  - Appendix C.2 (p. 76).
- **The atlas.** The stages AdicCoefficientsAndComparisons L1–L3.
- **The extraction.** Items /005, /059, /072, /079, /123, /124 and /127, the route briefs, and sourceIssues.

## The high findings

- **/1: Example 4.1.1.** "The morphisms [S/G] → [S/H] correspond to S-homomorphisms G → H" is false for a general diamond
  S.
  - **The example.** Over Spd ℚ_p, take G = 1 and H = ℤ/2. The unramified quadratic torsor gives a map B1 → BH that no
    homomorphism induces.
  - **The fix.** Describe maps by H-torsors with a commuting G-action.
- **/2: Example 4.3.10.** Theorem 4.3.8 requires p, q proper, but the example assumes only that X is proper, and /059
  allows an arbitrary correspondence.
  - **The example.** For Y a countable disjoint union of points, the trace section 1 is not compactly supported, so the
    integral is undefined.
  - **The fix.** Add properness of Y → S.

## The medium findings

- **/3: the comparison stage.** /072's comparison theorem (full faithfulness, compatibility with Rf_!) belongs to
  AdicCoefficientsAndComparisons L3, which proves ECD 27.1–27.3. Only L1 and L2 are cited.
- **/4: the Fargues–Scholze inputs.** FS Proposition I.9.1, FS Theorem I.9.6(viii) and the commutation of Hecke and
  excursion operators are used on pp. 68–69, but no item states them.
- **/5: Dat's classification.** Langlands triples, ν-temperedness and Dat's classification ([Dat05, Theorem 3.11]) are
  defined and used on p. 76, but no item records them.
- **/6: the Tits fixed-point result.** [Tit79, 3.6.1], which places a fixed point in the apartment of T, is used on p. 45
  without an item. [BT84, 4.6.28] and [BT72, 7.4.10] are used in the same argument.
