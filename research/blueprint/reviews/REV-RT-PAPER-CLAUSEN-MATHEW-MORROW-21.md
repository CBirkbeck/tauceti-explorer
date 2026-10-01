# REV-RT-PAPER-CLAUSEN-MATHEW-MORROW-21

Independent verification of the red team RT-PAPER-CLAUSEN-MATHEW-MORROW-21 (Codex, session `codex-rtOQ9t`, PR #5463) on
the extraction PAPER-CLAUSEN-MATHEW-MORROW-21 (Clausen–Mathew–Morrow, *K-theory and topological cyclic homology of
henselian pairs*, J. Amer. Math. Soc. 34 (2021)), for issue #4263.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-442dc5`, PR #1985);
- its review REV-PAPER-CLAUSEN-MATHEW-MORROW-21 (`cc-7b31c4`, PR #2413);
- the later edit to it by FIX-RT-PAPER-NIKOLAUS-SCHOLZE-18 (`cc-f805bf`, PR #5208);
- the red team.

None of the findings cites work of mine.

**Result: all four findings confirmed.**
- /1 is high.
- /2 and /3 are medium.
- /4 is filed as medium; I would grade it low.

None affects the paper's theorems.

## What I read

- **The paper.** arXiv 1803.10897v2 (<https://arxiv.org/pdf/1803.10897v2>), the version the extraction read. I read:
  - pp. 42–44 (Definitions 5.11–5.14, Theorem 5.21 and its proof);
  - p. 49 (Corollary 5.33 and its proof);
  - p. 55 ((26)–(27) and Proposition 6.12), as a page image.
- **The pinned Mathlib** (082e2d3). I read:
  - `Algebra/Algebra/NonUnitalHom.lean`;
  - `Algebra/Algebra/Unitization.lean`.
- **The extraction.** Items 038, 091, 099 and 121.

## The findings

- **/1 (high): the de Rham–Witt quotient.** (26)–(27) and items 099 and 121 write W_rΩ^m/dV^{r−1}Ω^m. Since d raises degree,
  this must be W_rΩ^m/dV^{r−1}Ω^{m−1}, as the r = 1 case Ω^m/dΩ^{m−1} on the same page shows.
- **/2 (medium): nonunital algebras.** Mathlib already has `NonUnitalAlgHom`, `Unitization`, `fstHom`,
  `inrNonUnitalAlgHom` and the universal property `Unitization.lift`. Item 038 should be split into these library parts
  and the missing categorical and henselian parts.
- **/3 (medium): Definition 5.14.** The "equivalently" (each π_n-tower nilpotent) needs a uniform lower bound. The tower
  ⊕_{j≥i} Σ^{−j}HF_p is nilpotent degree by degree but not after truncation.
- **/4 (I would grade it low): two proof slips.** One is an integral equality where Theorem 4.36 gives only a mod-p
  equivalence (p. 44). The other calls ℤ → ℤ/p-type maps isomorphisms (p. 49). The stated theorems are unaffected.
