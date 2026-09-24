# REV-RT-LINK-tauceti_TauCetiRoadmap_EllipticCurves — verification of the red-team findings on the EllipticCurves link map

**Verdict: both findings confirmed; their fixes are right as stated.**

- **Verifier:** Claude Code, session `cc-2aeb03`, 24 September 2026 (issue #1740).
- **Independence:** this verifier took no part in any of the three jobs:
  - the red team, RT-LINK-tauceti_TauCetiRoadmap_EllipticCurves (Codex, `codex-c83e7a`, #2602);
  - the link map, LINK-tauceti_TauCetiRoadmap_EllipticCurves;
  - its review, REV-LINK-tauceti_TauCetiRoadmap_EllipticCurves.
- **What was checked:** the link map `research/blueprint/links/tauceti_TauCetiRoadmap_EllipticCurves.json` at `main` (its
  `links`, `overlaps`, `examined` and `review`), the stage descriptions in `data/atlas.json`, and every other file in
  `research/blueprint/links/`.

`python3 scripts/check_redteam.py` reports `ok` on the review file.

## /1 (missing, medium): confirmed

The two layers construct the same object:

- **TB.7.** TropicalAndBerkovichArithmetic:TB.7 says: "Construct Tate uniformization and the Schottky/Mumford-curve quotient in
  its totally degenerate range; record descent and the period lattice". Its acceptance compares, for a Tate elliptic curve, "the
  q-period, skeleton length and logarithm branch".
- **Layer 4.** EllipticCurves Layer 4 constructs the Tate curve E_q over a complete rank-one valued field. Its uniformisation is
  "pinned as the point-level, Galois-equivariant statement … no rigid-space quotient is in scope: for each finite extension
  L/K … a group isomorphism L^× / q^ℤ ≅ E_q(L)".

So both layers build the Tate curve and its uniformization: Layer 4 on points, TB.7 as an analytic quotient.

The link map records none of this:

- none of its ten overlaps names TB.7;
- its only link to that roadmap is Layer 4 → TB.6 (`links[66]`);
- no other link file mentions the pair;
- its screening note for TropicalAndBerkovichArithmetic says the Tate curve "appears only in TB.2, TB.5 and TB.7 acceptance
  tests", which is false for TB.7.

Medium severity fits: without an overlap record, the two constructions can be built without the comparison that relates them.

The fix is right as stated:

- record a `keep` overlap between Layer 4 and TB.7;
- keep TB.7's analytic quotient, Schottky/Mumford, descent and integration work;
- ask for the comparison of E_q, the q-parameter and the point uniformization in their common scope;
- add no dependency edge until a supplier contract is fixed;
- correct the screening note.

## /2 (other, low): confirmed

Three screening notes contradict the final links:

- **EffectiveDiophantineMethods.** It says "No stage uses or develops an Elliptic curves object", but Layer 7 → ED.3 and
  Layer 6 → ED.3 are links (`links[73]`, `[74]`).
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory.** It says the same, but Layer 2 → R07.5 and Layer 4 → R07.5 are links
  (`[63]`, `[64]`).
- **RankZeroOneBSD.** It says BSD.6a is not linked separately, but `[69]` and `[77]` target BSD.6a.

All six links were added by the link map's review. Each of these notes carries a `reviewNote` saying the review "added the
evidenced handoffs recorded in review.added". That explains the discrepancy but leaves the notes' own statements false as
written. The finding is presentational, so low severity is right, and it does not become a fix job. Its fix (restate the
three notes, keep the links, add no BSD.7a edge) is right.
