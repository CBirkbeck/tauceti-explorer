# RT-LINK-tauceti_TauCetiRoadmap_EllipticCurves: fixes

Fixer: Claude Code, session `cc-39fac3`, 29 September 2026 (issue #3991).
- Findings: `RT-LINK-tauceti_TauCetiRoadmap_EllipticCurves.result.json`.
- Verdicts: `.review.json`.
- Two findings, both confirmed.

The only edited deliverable is `research/blueprint/links/tauceti_TauCetiRoadmap_EllipticCurves.json`. No link was added, removed or changed; the packet still has 82 links. The Layer 4 anchor is unchanged, and the historical `review` and `reviewNote` texts are untouched.

## /1 (medium, missing): the TB.7 Tate-uniformization overlap is recorded

**Checked at `origin/main`.**
- **TB.7** (content/campaign/TropicalAndBerkovichArithmetic/README.md, lines 81–89). Its construction and export "Construct Tate uniformization and the Schottky/Mumford-curve quotient in its totally degenerate range; record descent and the period lattice", and its acceptance compares "the q-period, skeleton length and logarithm branch" for a Tate elliptic curve.
- **Elliptic curves Layer 4** (content/tau-ceti/EllipticCurves/README.md, lines 836–852). It constructs E_q from q-series defined over ℤ⟦q⟧, with the uniformization pinned as the point-level, Galois-equivariant isomorphism L^× / q^ℤ ≅ E_q(L) for finite extensions L/K, and no rigid-space quotient in scope.
- **The link map.** None of its ten overlaps named TB.7. Its only link to the roadmap is Layer 4 → TB.6.

**Changes.**
- **An eleventh overlap, recommendation `keep`,** with stages Layer 4 and `TropicalAndBerkovichArithmetic:TB.7`. As the finding and the review ask:
  - its `detail` records the two constructions at their different levels;
  - its `proposal` keeps both. Layer 4 is the immutable anchor owning the equation-level curve and point uniformization. TB.7 keeps its analytic quotient, the Schottky/Mumford generalization, descent, period lattice, skeleton and integration work;
  - it requires one comparison in the common scope: TB.7's Tate curve and q-parameter against Layer 4's E_q and q, and, on finite extensions, the induced point-uniformization map against L^× / q^ℤ ≅ E_q(L), including the kernel q^ℤ and the Galois action;
  - it forbids replacing the analytic theorem by the point-set isomorphism or asserting any further direction.

  No dependency edge is added. The proposal says Layer 4 → TB.7 can be added once TB.7's blueprint fixes the supplier contract, which the finding makes optional.
- **The `examined` note for TropicalAndBerkovichArithmetic** no longer says the Tate curve appears "only in … acceptance tests" and that no stage develops an Elliptic curves object. It now describes TB.7's construction, the new keep overlap, and the TB.6 measure edge.
- **The `summary`** notes the eleventh overlap.

## /2 (low, other): the three stale screening notes are rewritten

Each note's false sentence is replaced by the final accepted decision, citing the review-added links, which already exist.

| `examined` entry | Old sentence | New wording |
|---|---|---|
| EffectiveDiophantineMethods | "the elliptic rank computation is an acceptance test only. No stage uses or develops an Elliptic curves object." | ED.3's elliptic acceptance case imports Layer 7's descent sequence and Layer 6's point group and bound (links Layer 7 → ED.3, Layer 6 → ED.3), while ED.3 still certifies local images, index and saturation; no stage develops an Elliptic curves object |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | "No stage uses or develops an Elliptic curves object." | R07.5 uses Layer 2's generic-fibre torsion/Galois carrier and Layer 4's good ordinary/supersingular reduction predicates (links Layer 2 → R07.5, Layer 4 → R07.5), with finite-flat criteria still R07 work |
| RankZeroOneBSD | "BSD.6a and BSD.7a … are not linked separately" | BSD.6a is linked from Layer 5 (twists) and Layer 4.5a (global semistability) |

For RankZeroOneBSD, BSD.7a has no link, and none is inferred from the old note, as the review requires.

Each rewritten note ends with a pointer to this correction. The read-scope sentences and `reviewNote`s are kept.

## Checks

- `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_EllipticCurves.json`: 0 errors, 0 warnings (82 links, 11 overlaps, 218 examined).
- `python3 research/blueprint/intake.py check-files` on both deliverables: 0 problems.
- The unit suite passes.
