# REV-RT-PAPER-CHENEVIER-TAIBI-20

Independent verification of the red team RT-PAPER-CHENEVIER-TAIBI-20 (Codex, session `codex-rtOQ9t`, PR #5432) on the
extraction PAPER-CHENEVIER-TAIBI-20 (Chenevier–Taïbi, *Discrete series multiplicities for classical groups over Z and
level 1 algebraic cusp forms*, Publ. Math. IHÉS 131 (2020)), for issue #4299.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-d67081`, PR #1923);
- its review REV-PAPER-CHENEVIER-TAIBI-20 (`cc-7b31c4`, PR #2424);
- the red team.

**Disclosure.** /12 cites the accepted owner decision of RS-07. This session wrote that restructuring's fix review,
REV-FIX-RT-RS-07 (PR #5284).

**Result: all twelve findings confirmed.**
- **High:** /1–/7. /8 is also filed as high; I would grade it medium.
- **Medium:** /9–/12.

## What I read

- **The paper.** The published open-access PDF (<https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf>),
  SHA-256 `ea90fb0f…a3de`, equal to the extraction's. I read pp. 264–266, 268, 270–271, 274–276, 278, 302, 309 and 312,
  with page images of pp. 275, 276 and 278.
- **The extraction.** The items theorem-3, W-m-regular, regular-w-unique-G, explicit-formula-forms, C-F-and-POS,
  quadratic-problem, holomorphic-lowest-weight, theta-series-properties, split-classical-groups, so3-example and
  section-5-3-1, and the routes.
- **Tau Ceti at f790474.** The `Symplectic` group scheme, `pointsMulEquiv` and the smoothness instance.
- **RS-07.** `data/restructure/RS-07.result.json`, its owner rows for AN.6 and AN.3.

## The high findings

- **/1: Theorem 3's uniqueness clause.** The theorem lists two PGL₂ representations with the same weights, then says all
  are determined by their weights.
- **/2: the regularity definition.** The oriented exception i = j − 1 = m/2 under "for all i ≠ j" excludes every double
  zero.
- **/3: the inverse of the w(λ) map.** (1, −1) ∈ W₂ is regular but not a w(λ), since SO₃ gives only half-integral weights.
- **/4: the explicit formula.** The extraction drops B_f's ℜ and conjugate, integrates J_F against F(t) instead of F̂(t),
  and states POS without the real part, against pp. 275–276.
- **/5: the quadratic problem.** ε takes values in {±1, ±i} (p. 274). With unrestricted U_i ∈ K_∞, β_Q can have nonreal
  entries, as for U = (1, ε).
- **/6: the eigenvalue criterion.** "Distinct iff k_g > g" (p. 302) fails at g = 1, k = (0).
- **/7: the theta lift relation.** The printed g₀ relation on p. 312 forces g = g₀ by dimension, while Lemma 5.8 covers
  g > g₀.

## The other findings

- **/8 (filed high; I would grade it medium): the library status.** split-classical-groups cites only point groups,
  while Tau Ceti already has the smooth Sp scheme over every ring. The split SO model over Z is not in the library.
- **/9 (medium): a misprint on p. 271.** The printed denominator sin(2π/i) fails at k = 0.
- **/10 (medium): a misprint on p. 270.** The printed "non-negative integers" is refuted by ζ(2).
- **/11 (medium): the counts on p. 309.** The counts 199/59 and the item's note disagree on what is counted. I did not
  rerun the enumeration.
- **/12 (medium): the GRH owner.** RS-07 drops AN.6 and gives RH/GRH to AN.3.
