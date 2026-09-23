# Handoff: PAPER-LE-LEHUNG-LEVIN-ETAL-20

Issue #1402. Claude Code, session `cc-2aeb03`, 23 September 2026. Status: **complete**. This continues the Codex checkpoints #2197 (session codex-hjdg0j) and #2212 (session codex-c83e7a).

## Done

- **`research/blueprint/papers/PAPER-LE-LEHUNG-LEVIN-ETAL-20.result.json`** contains:
  - 593 items: 6 library, 25 planned, 562 missing;
  - the checkpoint's seven routes;
  - 28 prerequisites;
  - 132 `sourceIssues`.
- **`research/blueprint/papers/PAPER-LE-LEHUNG-LEVIN-ETAL-20.md`**: the report.

**What was read.** The whole published version (pp. 1–135) was read on rendered page images, statements and proofs. arXiv 1608.06570 v1–v4 were consulted at every recorded mistake.

**What was checked.**

- Tables 1–6 and the computations of §§2.3, 3.6, 4.2 and 5.1 were recomputed by script, using Singular for the ideals.
- The 19 new errors, and new mistakes reaching a proof or a stated result, were checked a second time, independently: 13 confirmed, 6 rejected and dropped.
- The checkpoints' E01–E18 were re-checked on the page image.

## What changed from the checkpoints

- **Items.**
  - Every checkpoint item id is kept, restated from the page and split where it bundled several results. Their `dependsOn`, `proofOutline`, `api` and `unitTests` fields are carried over unchanged.
  - The checkpoint's gap list (G01–G09) is closed: every definition and result it named is now an item, from §2's combinatorics to §5.3's global setup and the cited inputs of §§4.2 and 6.0.2.
- **Library claims.** Those for L01, L04 and L05 are withdrawn; the items state the paper's GL₃ root datum, affine Weyl groups and finite abelian category, which the libraries do not have. Mathlib's `minimalPrimes` is added.
- **Routes.** The same seven. The two Part II briefs are rewritten around the exact final theorems, with the verified corrections (depth hypotheses, Proposition 4.2.9, the genericity of the auxiliary types in §5.1, the missing proof of Theorem 5.3.1).
- **Other fields.** The `gaps` field is removed and the prerequisites are rebuilt, one per paper with its DOI.

## For the reviewer

- **The report's "Judgement calls" section** lists the routing choices and the six rejected gap claims.
- **E101–E125** are the authors' corrections to LLHLM18 printed in §6. They are kept as the checkpoint recorded them, but concern LLHLM18, not this paper.
- **The two Part II ids are shared** with PAPER-LE-LEHUNG-LEVIN-ETAL-23. The design jobs should read both extractions together.

## Checks

- `python3 scripts/check_paper.py` reports ok.
- `python3 research/blueprint/intake.py check-files` on the three files reports 0 problems.
- Lean: none.
