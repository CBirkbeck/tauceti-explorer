# REV-RT-PAPER-HARPAZ-WITTENBERG-23 — verification of the red-team findings on PAPER-HARPAZ-WITTENBERG-23

**Verdict: the one finding is confirmed, with a corrected fix.**

- **Verifier:** Claude Code, session `cc-2aeb03`, 24 September 2026 (issue #1894).
- **Independence:** this verifier took no part in any of the three jobs:
  - the red team, RT-PAPER-HARPAZ-WITTENBERG-23 (Claude Code, `cc-d67081`, #2581);
  - the extraction, PAPER-HARPAZ-WITTENBERG-23 (Codex, #1644 and #1664);
  - its review, REV-PAPER-HARPAZ-WITTENBERG-23 (Claude Code, `cc-fb70e5`, #1762).

**What was checked.**

- **The records.** Both paper records at `main`:
  - `PAPER-HARPAZ-WITTENBERG-23.result.json`: item 39 and route 8;
  - `PAPER-HARPAZ-WITTENBERG-20.result.json`: items 81 and 101, and route 13.
- **The sources.** Both papers, fetched on 24 September 2026 from the authors' pages:
  - Harpaz–Wittenberg, "The Massey vanishing conjecture for number fields", Duke Math. J. 172 (2023):
    `https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf`, SHA-256 `d95100eb…`, the hash the red team recorded;
  - Harpaz–Wittenberg, "Zéro-cycles sur les espaces homogènes et problème de Galois inverse", J. Amer. Math. Soc. 33 (2020):
    `https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf`, SHA-256 `2e425ee6…`.
- **The pages.** The passages at the two locators, HW23 §3 p. 8 and HW20 §5.2 p. 18.

`python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-HARPAZ-WITTENBERG-23.review.json` reports `ok`.

## RT-PAPER-HARPAZ-WITTENBERG-23/1 (duplicate, medium): confirmed

**The claim holds.** HW23/39 and HW20/81 have the same name, "Picard group of a finite-stabilizer homogeneous space", and
the same content. Both are `missing`. Both are routed `part-ii` to the candidate HeightsRationalPointsPartIIHomogeneousMassey,
under HeightsRationalPointsAndObstructions (HW23 route 8, HW20 route 13).

**The source settles which is the owner.** On p. 8, HW23 only recalls the statement: the Cartier dual Hom(H^ab, k̄*) =
Hom(H^ab, μ∞) "is canonically isomorphic to Pic(V_k̄) as a Γ_k-module (see [HW20, §5])". It then uses the statement for
the exact sequence (3.1). HW20 proves it in §5.2 (p. 18), from Rosenlicht's lemma, Kummer theory and Pic(G_k̄) = 0. So
HW23/39 is a cited input, and HW20's route reason applies to it: "do not create another copy of … finite-stabilizer
Picard/Brauer interfaces". Without a recorded identification, the design job for the shared candidate would plan this
statement twice. Medium severity is right.

**The fix needs one change.** The finding proposes dropping HW23/39 from HW23's route. That cannot be done as stated:

- the paper uses the item (§3, (3.1)), so the extraction must keep it;
- §16 requires every missing item to be routed exactly once.

The finding also refers to a "coalescence block" for items. The records have none: the only such block in the repository,
in PAPER-LIU-ETAL-22, identifies routes, not items.

The right fix follows these records' own practice for the supersolvable theorem, which HW20/101 keeps with the note "This is
the same HW20 input already requested by PAPER-HARPAZ-WITTENBERG-23; the shared candidate owner below receives the proof
once". So:

1. Keep HW23/39 on its route.
2. Add to its note: "This is [HW20, §5] = PAPER-HARPAZ-WITTENBERG-20/81, cited, not proved, in this paper (§3 p. 8). The
   shared candidate HeightsRationalPointsPartIIHomogeneousMassey builds it once, from HW20; this item is its consumer."
3. Add the matching sentence to HW20/81's note, naming HW23/39 as the consumer.
4. Fold the μ∞ form into HW20/81's statement if wanted.
5. Optionally, make HW23/39 a theorem, as HW20/81 is.

## For the orchestrator

The confirmed finding is medium severity, so it becomes FIX-RT-PAPER-HARPAZ-WITTENBERG-23. The fixer should apply the fix
above, not the finding's "drop from the route", which would break §16's routing rule.
