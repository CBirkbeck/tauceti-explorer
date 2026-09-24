# REV-RT-RS-29 — verification of the red-team findings on RS-29

**Verdict: nothing to confirm or reject. The red team reported no finding, and its clean result holds on the checks
repeated here.**

- **Verifier:** Claude Code, session `cc-2aeb03`, 24 September 2026 (issue #1626).
- **Independence:** this verifier took no part in any of the three jobs:
  - the red team, RT-RS-29 (Claude Code, `cc-d67081`, #2594);
  - the proposal RS-29 (Codex, `codex-a71f92`);
  - its review, REV-RS-29 (Codex, `codex-c83e7a`).

`research/blueprint/redteam/RT-RS-29.review.json` has an empty `findings` list, because RT-RS-29 has none, and
`python3 scripts/check_redteam.py` reports `ok` on it.

## What a clean result has to rest on

A red team that finds nothing is useful only if what it says it checked is true. The mechanical claims in RT-RS-29's
`checked` list were therefore repeated against `research/blueprint/restructure/RS-29.result.json`, `RS-29.md` and
`data/atlas.json`:

- **Title.** The Part II title is "Belyi maps, dessins d'enfants, and three-point covers, Part II: inverse Galois theory and
  arithmetic fundamental groups". The parent's atlas title is "Belyi maps, dessins d'enfants, and three-point covers", so this
  is an exact prefix extension (§15).
- **Endpoints.** All 25 owner entries, all 26 `suppliedBy` entries and all 30 links resolve to atlas stage ids, except the
  sentinel `UPSTREAM:Mathlib-Galois-category-classification`, as the red team says.
- **The library claim.** At Mathlib `082e2d3`, `Mathlib/CategoryTheory/Galois/Equivalence.lean` declares
  `PreGaloisCategory.functorToContAction` at line 40 and `instance : (functorToContAction F).IsEquivalence` at line 90, as
  RT-RS-29 states.
- **Cycles.** The atlas's 3,508 stage edges together with the proposal's 29 non-sentinel links contain no cycle.
- **Consumer edges.** The seven InverseGaloisAndArithmeticFundamentalGroups stages have exactly nine outgoing edges in the
  atlas, the number RS-29.md says it preserves.

## The one surface the red team set aside

The red team did not report the ten owner entries that name BelyiMaps layers 7–14. The text of those layers disclaims
ownership in favour of the successor roadmaps BelyiAnalyticCovers, BelyiAlgebraicAndDescent and BelyiArithmeticActions.
That was right. RS-29.md states the choice and its reason: the successors exist only as prose in the BelyiMaps document,
so the proposal points at the existing `tauceti:TauCetiRoadmap/BelyiMaps#layer-…` ids that carry those contracts rather
than inventing stage ids. It records their absence as separate atlas stages as an open point, not a repair. This is a
documented decision, not an error.

## For the orchestrator

When the BelyiMaps successor roadmaps are created as atlas roadmaps, the ten owner entries, eleven `suppliedBy` entries and twelve links that name
BelyiMaps layers 7–14 should be moved to them. RS-29.md already records this.
