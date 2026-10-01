# REV-RT-PAPER-BIJAKOWSKI-PILLONI-STROH-16

Independent verification of the red team RT-PAPER-BIJAKOWSKI-PILLONI-STROH-16 (Codex, session `codex-rtOQ9t`, PR #5381)
on the extraction PAPER-BIJAKOWSKI-PILLONI-STROH-16, for issue #5062.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-fb70e5`, PR #4283);
- its review REV-PAPER-BIJAKOWSKI-PILLONI-STROH-16 (`cc-58621d`, PR #4724);
- the red team.

**Result: all four findings confirmed.** /1 and /2 are high, /3 and /4 medium. None of them affects the classicality
theorem.

## What I read

- **The paper.** Bijakowski–Pilloni–Stroh, *Classicité de formes modulaires surconvergentes*, Annals 183 (2016),
  975–1014, the published PDF from the Annals site
  (<https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p05-p.pdf>), read on 2026-10-01. I read:
  - §1.3 (p. 984);
  - the weight conventions of §4 (p. 994);
  - the proof of Lemma 4.4.3 (p. 1003);
  - Lemma 4.4.5 and Hypothesis 4.5.1 (p. 1004).
- **The extraction.** Items 7, 21, 27 and 28.
- **The atlas.** The node AdicSpacesPartII:R2/fibral-finiteness-criterion in `data/decompositions/AdicSpacesPartII.json`.

## /1 (high, error): P is formally étale only over p-nilpotent bases. Confirmed.

**The source.** On p. 984 the paper says "le théorème de déformation de Serre-Tate implique que le morphisme P est
formellement étale", with no restriction, and item 7 copies it.

**Why it fails.** Over a characteristic-0 field the p-divisible data lift uniquely to dual numbers, but a non-isotrivial
family of elliptic curves does not. For the Legendre family I checked j′(3) = 31360/27 ≠ 0.

**The fix.** Restrict the assertion to p-nilpotent test schemes, and record the omission as a new sourceIssue.

## /2 (high, error): the norm bound needs a sign condition. Confirmed.

**The lemma.** Lemma 4.4.5 assumes only deg L ≥ ν and bounds ‖U_i^bad‖ by p^{… − ν·inf k}, for any dominant κ (§4).

**Why it fails.** Replacing deg L by a lower bound gives an upper bound only when inf k ≥ 0. The red team's weight
(−1, −1) branch gives p^5 against the asserted p^4.

**Where it still holds.** Hypothesis 4.5.1 makes inf k positive in the paper's application, so the paper itself is safe.
Item 28, however, exports the lemma for every κ.

## /3 (medium, error): the product map q is not étale. Confirmed.

On p. 1003 the paper says "p et q sont finis et étales", for q : B_k⁰ → (X_Iw^rig)^k. The source has dimension D and the
target kD, so q cannot be étale for k ≥ 2.

The quasi-compactness conclusion survives with the red team's coordinate-wise repair.

## /4 (medium, duplicate): Proposition 4.1.8 is already planned. Confirmed.

The integrated node AdicSpacesPartII:R2/fibral-finiteness-criterion is Conrad's Theorem A.1.2: a flat map is finite iff
it is quasi-compact, separated, has finite fibres and has locally constant fibre rank.

Proposition 4.1.8 follows from it directly. Its f|_U is étale and quasi-compact with constant fibre rank, and U is then
closed. So item 21 is planned at R2 (and R0), not missing.
