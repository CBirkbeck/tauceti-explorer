# Handoff: PAPER-FARB-KISIN-WOLFSON-24

Claude Code, session `cc-442dc5`, 22 September 2026 (issue #1308).

## Done

The extraction is complete. `scripts/check_paper.py` reports ok, and every missing item is routed exactly once.

**What was read.** arXiv 2110.05534v2, the revised Duke version, was read in full from its TeX source (`thirdessdimduke-revised_v3.tex`) and PDF. The 2021 version on Kisin's page (= v1) was compared at every recorded mistake. The Duke PDF could not be retrieved, so locators and page numbers are those of arXiv v2.

**Deliverables:**

- `research/blueprint/papers/PAPER-FARB-KISIN-WOLFSON-24.result.json`: 143 items (2 library, 40 planned, 101 missing), 13 routes, 13 prerequisites and 18 source issues.
- The report, `research/blueprint/papers/PAPER-FARB-KISIN-WOLFSON-24.md`.

## Judgement calls for the reviewer

**One new roadmap for the essential-dimension argument.** `EssentialDimensionOfCovers` (69 items, area `algebraicgeometry`) owns everything from essential dimension to Theorem 3. That includes the prismatic restriction theorems (Propositions 2.2.3, 2.2.8, 2.2.11, Corollaries 2.2.13 and 2.2.15), which only this argument consumes. A reviewer might instead move those theorems into a Part II of PrismaticCohomology, as "applications to restriction of mod p classes". I kept them in the new roadmap because the atlas has no other consumer, and the PR layers already own every general comparison they use.

**Group cohomology goes to a ProfiniteCohomology Part II, not the new roadmap.** Cohomology rings of elementary abelian and free abelian pro-p groups, the H^2 classification of central extensions and the Heisenberg computations (§3.1) are general. The new roadmap imports them.

**Reused Part II ids.** Three routes attach to Part IIs that earlier extractions proposed, so that the maintainer can merge the design jobs:

- `PrismaticCohomologyPartIIPrismaticDieudonneTheory`, from Anschütz–Le Bras (item /104);
- `ShimuraVarietiesHondaTatePartII`, from the Kisin and Kisin–Pappas extractions;
- `ReductiveGroupsArithmeticPartII`, from the Kisin and Kisin–Madapusi Pera–Shin extractions.

My titles follow the parent's title.

**Statuses to check.**

- Lemma 3.3.3 is marked missing. ShimuraCompactifications C1 plans unipotent radicals, centres and the weight filtration, but not the Dynkin-diagram description through Σ̃ or its identification with the zero-dimensional cusp parabolic. The brief asks the new roadmap to import C1's structure and prove only the identification.
- Prop. 3.3.13 is marked planned in C1–C2, which follow Pink §6. Part (1), the fundamental-group statement, is immediate from the contractibility of X^+ and U(R)Z(C).
- Artin vanishing, invariance under extension of algebraically closed fields, and complex analytic spaces are marked planned through SchemeAndStackFoundations SF.2. SF.2 is the integration owner of the upstream PR196 roadmaps (EtaleBaseChange Layers 4 and 6, ComplexComparison Layer 2).
- Parabolics extending to reductive models are marked planned in Tau Ceti ReductiveGroups Layer 8, whose relative theory over a base is flagged long-horizon.

**Source issues that change statements.** The items use the corrected statements:

- E13: Proposition 3.2.14 needs a dense V′.
- E14: add p > dim + 2 to Proposition 3.2.7, Theorem 3.3.17 and Corollary 3.3.19. Theorem 3's printed bound misses only three-dimensional ball quotients at p = 5.
- E15: add p > max{dim + 1, 3} to Proposition 2.3.10(2) and Corollary 2.3.12.
- E16: the proof of Theorem 3.3.17 applies results stated for complete fans.
- E17: Corollary 3.2.17 is proved for compressions through Stein bases with Ē-coverings. That suffices for Theorem 3.3.17.

Please check each one at its locator. E14 and E15 are arithmetic checks of the hypotheses; E13 has an explicit counterexample.

## Not done

Nothing remains in the extraction. The published Duke version was not compared line by line, because it was not accessible.
