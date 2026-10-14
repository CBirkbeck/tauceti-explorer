# Handoff: DESIGN-FGFO (FreeGroupsFirstOrderTheory, issue #9801)

Worker: Claude (session claude-n3h6OP), 2026-10-14.

## Deliverables

- `research/blueprint/roadmaps/FreeGroupsFirstOrderTheory.json`: the new roadmap. It has area `grouptheory`, parent `FreeGroupsAndLimitGroups`, and seven layers FO1–FO7 with the maintainer's keys and titles. Each stage description keeps the maintainer's milestone text and adds the planned targets.
- `research/blueprint/packets/FreeGroupsFirstOrderTheory.json`: 65 nodes, status `complete`.
  - Node kinds: 19 definitions, 11 constructions, 35 theorems.
  - 172 API items, 123 unit tests, 36 planets (at most 6 per layer).
  - 36 baseline declarations, 6 gaps, 1 request, 9 sourceIssues, 1 restructure note.
  - `python3 scripts/check_blueprint.py … --index <pinned declaration index>` reports 0 errors and 0 warnings.
  - A separate script checked that every node-level dependency respects the stage `requires` lists, and that the stage graph is acyclic.
- `research/blueprint/readmes/FreeGroupsFirstOrderTheory.md`: the reader document, about 37,000 words.
  - The introduction is written by hand: summary, scope and ownership, conventions, exact supplier contracts (Mathlib declarations and every FreeGroupsAndLimitGroups node consumed), how to read the build, proof route and alternatives, and worked examples.
  - Each node is rendered in the standard per-node format.
  - Gaps, requests, mistakes in the sources, structure and references follow.
- `research/blueprint/suggested/FreeGroupsFirstOrderTheory.lean`: written in the 2026-10-12 shape.
  - Real-bodied light definitions only: `groupLang` restated verbatim from FG3; the classes `IsForallExists`, `IsExistsForall`, `IsBoolCombAE` and `IsExistsForallExists`; `EquivOver`, `HasAEQE` and `HasAEQEOver`; the closed surface groups as `PresentedGroup`s.
  - Theorems statable at the pins: AE-QE over F(A), the outer induction, elementary equivalence, the elementary embedding F_k ≤ F_ℓ, surface groups, negative controls and Lyndon's theorem.
  - Discriminating examples.
  - **Compiled**: `lean-check` exits 0, and its only warnings are `declaration uses 'sorry'`.

## How the job was read

- **"Not routed in as an oracle".** The instructions' sentence about FG10/FG11 endpoints and an excluded decidability theorem is the parent roadmap's template. I read it as follows: the decidability of Th(F) is the FO7 target, and it is never a prerequisite of any node. The ∀∃ decider (FO5) is proved, not assumed. The effective bound N(K, H) (FO5/effective-bound) uses only the ∀∃ decider.
- **Route.** The plan follows Kharlampovich–Myasnikov, in the corrected form of QE-FREE (arXiv:1207.1900v4, 2019) and HYP (arXiv:1303.0760v8, 2016), with IFT §7.6 for the parametrization theorem. Sela's route (SELA-VI, SELA-ICM) is recorded in node notes. The uniform coefficient-free elimination, Sacerdote's ∀∃ rank independence and the elementary embedding follow SELA-VI's argument, because the readable KM texts do not spell it out (gap). The tower classification uses the corrected statement of Louder–Perin–Sklinos (LPS Theorem 3.6).
- **Layer order** (recorded in `restructure`).
  - The dependencies force the build order FO1 → FO2 → FO4 → FO3 → FO5 → FO6 → FO7.
  - Configuration groups (FO3) are made of algebraic, non-MAX-equivalent solutions (FO4).
  - The computation of N(K, H) needs the ∀∃ decider, so it sits in FO5 rather than FO4.
  - The fundamental-sequence infrastructure (strict and well-aligned sequences, canonical NTQ systems, the canonical embedding tree, sequences modulo subgroups, sufficient splittings) is in FO2, beside the parametrization theorem, as HYP §3 groups it.
  - If the atlas prefers keys in build order, FO3 and FO4 can be swapped.
- **"Projective images"** (FO3) is interpreted as the images of a subgroup along the levels of a (block-)NTQ tower, whose collapse drives the 'easy cases' of the ∀∃-tree (QE-FREE pp. 13–17). The maintainer's term does not occur in the texts read.

## What is closed and what remains

- FO1 is closed.
- FO2–FO7 are planned. Their `remaining` lists name exactly what is open:
  1. **KM06 not read.** Elsevier refuses automated access, and no author copy was found on the Stevens pages. Every node citing KM06 cites it through QE-FREE, HYP and KM-RESPONSE. The next worker with access should read §§5.3–5.4, 7, 11–12, Theorem 11, Theorem 41 and Lemmas 23, 27, 28, and check FO2/sufficient-splitting, FO4/algebraic-solution-bound, FO3/tight-envelope-reorganization, FO5/ae-tree-finite and FO6/true-level-two.
  2. **Level-2 termination.** QE-FREE §5.4 is explicitly a sketch, and SELA-REPORT contests the corresponding part of KM06 (items 26–56). Nodes: FO6/true-level-two and FO3/tight-envelope-reorganization.
  3. **General levels m ≥ 3** are "similar" in QE-FREE p. 37 (FO6/true-all-levels).
  4. **Exact definition of 'sufficient splitting'** (KM06 §5.4).
  5. **Rank independence in KM's route** (FO5/ae-rank-independence, FO7/uniform-qe, FO7/elementary-embedding). The plan uses SELA-VI pp. 3–7.
  6. **Perin's corrected retraction argument** for the "only if" direction of the classification (FO7/tower-classification).
- **Request** to FreeGroupsAndLimitGroups:FG8: limit groups without ℤ² are hyperbolic. It is needed by FO7/necessary-conditions.
- **sourceIssues.**
  - E1–E7 and E9 are corrections of KM06 that the authors themselves acknowledged: HYP Remark 1, QE-FREE footnote 3 and Definition 4, and KM-RESPONSE. They are scoped to those descriptions, since KM06 was not read.
  - E8 is Sela's original classification (SELA-VI Theorem 7 / ICM Theorem 6), corrected by LPS. The non-orientable genus-3 surface group is a counterexample to the original statement.

## For the reviewer

Points worth checking first:

- the free lifting theorem and its use for positive sentences (FO1/positive-sentences avoids the constants of the single-equation encoding on purpose);
- the decision of formula-solution existence through FG10/equations-over-limit-groups, which needs inequations handled through the Hom-diagram (FO5/ae-tree, proof step 3);
- the outer induction (FO6/qe-procedure), which turns ∃Y(∀∃ ∧ ∃∀) into an ∃∀∃-formula by renaming bound variables apart;
- the surface-group bound χ ≤ −2: orientable genus ≥ 2, non-orientable genus ≥ 4, and genus 3 is a negative control.

## Sources

Read on 2026-10-14; URLs and SHA-256 hashes are in the packet:

- QE-FREE, arXiv:1207.1900v4, read in full;
- HYP, arXiv:1303.0760v8, §§1, 3–6;
- IFT, arXiv:math/0312509v2, §§2.3, 3.1, 4.4, 7.6;
- ERA98 (EMIS TeX);
- SELA-VI, the author's copy, pp. 1–10, read as page images because the fonts do not extract;
- SELA-ICM, arXiv:math/0304209;
- SELA-REPORT, arXiv:1401.5711, the introduction and items 1–5 and 57;
- KM-RESPONSE, arXiv:1402.0482v3, in full;
- LPS, arXiv:1208.2858, §3 and Proposition 4.6.

Not read:

- KM06 (J. Algebra 302);
- Sela's Diophantine geometry V₁/V₂ (the author's PDFs do not extract text; only the statements quoted in SELA-VI were used);
- Sacerdote 1973 (the AMS site refused automated access);
- Perin 2011 and its correction.

No source from the maintainer's private library was needed.
