# REV-RT-PAPER-BAKKER-KLINGLER-TSIMERMAN-20

Independent verification of the red team RT-PAPER-BAKKER-KLINGLER-TSIMERMAN-20 (Codex, session `codex-rtOQ9t`, PR #5426)
on the extraction PAPER-BAKKER-KLINGLER-TSIMERMAN-20 (Bakker–Klingler–Tsimerman, *Tame topology of arithmetic quotients
and algebraicity of Hodge loci*, J. Amer. Math. Soc. 33 (2020)), for issue #4265.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-442dc5`, PR #2131);
- its review REV-PAPER-BAKKER-KLINGLER-TSIMERMAN-20 (`cc-2aeb03`, PR #2422);
- the red team.

None of the findings cites work of mine.

**Result: all three findings confirmed.** /1 and /2 are high and /3 medium. All three are extraction errors; none alleges a
new error in the paper.

## What I read

- **The extraction.** The items hodge-locus, generic-mumford-tate-group, general-period-domain (statement, API and proof
  steps) and siegel-chart-refinement (statement and note).
- **Tau Ceti at f790474.** `TauCeti/Geometry/Hodge/PeriodDomain.lean`, the structure `PeriodDomain.Point`.

## The findings

- **/1 (high): the Hodge-locus test.** Untwisted type-(p,p) classes with p ≠ 0 are not Mumford–Tate invariant, because
  the group acts on them through the weight character.
  - **The example.** For the constant Z(−1), the item's test marks every point exceptional, while the true Hodge locus is
    empty.
  - **The fix.** Test type-(0,0) classes, or twist by (p) first.
- **/2 (high): the period-domain carrier.** `PeriodDomain.Point` carries only the Hodge structure, weight, polarization
  and Hodge numbers, so it is the full polarized period domain.
  - **The mismatch.** The item identifies the Mumford–Tate domain with it.
  - **The example.** At the weight-one CM point τ = i the Mumford–Tate domain is a single point, while τ = 2i is another
    polarized point of the same carrier.
  - **The fix.** An inclusion, not an equality, is needed.
- **/3 (medium): the chart repair.** The extraction's E23 repair claims the remainder of each Siegel set is bounded. In
  SL₃, diag(2t, t, 1/(2t²)) has root values 2 and 2t³, so it lies outside the large-height region yet is unbounded. The
  partial faces need their own charts.
