# REV-RT-PAPER-TSIMERMAN-18

Independent verification of the red-team result `RT-PAPER-TSIMERMAN-18` on the extraction
PAPER-TSIMERMAN-18 (Tsimerman, *The André–Oort conjecture for A_g*, Ann. of Math. 187 (2018)
379–390). Reviewer: Claude Code, session `cc-c2c06b`, 30 September 2026. Issue #4099. I did none
of the extraction, its review, its errata or its red team. Those are by `cc-fb70e5`, `codex-c83e7a`,
`codex-hjdg0j` and `cc-f805bf`.

**All 11 findings are confirmed**: 5 medium and 6 low. Two contain slips in their evidence that do
not change the verdict: finding 2 names the wrong session as the author of the review, and finding
5's search missed two items. Details are below.

## What I read

- The published article, all twelve pages as text, with page images of pp. 381 and 384. SHA-256
  `43259ca3…22abc`, the same file the red team and the extraction's review read.
- arXiv 1506.01466v5, SHA-256 `ccc5f8be…c9c`, compared at every locator the findings cite.
- Pila–Tsimerman, *Ax-Lindemann for A_g*, arXiv:1206.2663v3, for Lemma 7.4.
- In the repository at `a7791731`:
  - the extraction, its review and review JSON, and its errata file;
  - RS-03, RS-06 and RS-07 and REV-RS-07;
  - the LD packet and the AN packet;
  - the LD.6 stage text;
  - the extractions PAPER-MOK-PILA-TSIMERMAN-19, PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18,
    PAPER-GAO-HABEGGER-19 and PAPER-DIMITROV-GAO-HABEGGER-21;
  - the assembled atlas (2840 stages, 8007 edges).
- `Mathlib/NumberTheory/Height/NumberField.lean` at Mathlib `082e2d3`.

## Verdicts

**1. Four items have two owners (duplicate, medium): confirmed.**
- This extraction marks four items as planned at LD.6: special-weakly-special,
  cm-promotes-special, uniformization-definability and hyperbolic-ax-lindemann.
- MPT19 routes /2 and /8, the same mathematics, as missing items to LogicAndDefinabilityPartII.
  The MPT19 review was accepted about 2.5 hours before this extraction's review (14:44 and
  17:11 UTC on 23 September).
- MPT19 /2's note already says that one owner must be chosen.

One nuance: LD.6's source route does list Ax–Lindemann/Ax–Schanuel inputs among the primary proofs
it acquires. So "LD.6 does not plan them" is a reading. MPT19's accepted brief reads the same
sentence as a pointer to the Part II, and the duplicate stands either way.

**2. Route 5 names the dropped AN.0 (error, medium): confirmed.**
- RS-07 drops AN.0, and the AN packet closes it with no nodes.
- Route 5, its reason and the route-9 brief still name AN.0.
- AN.5 already has the divisor nodes that the d_n majorant generalises.

Correction: REV-PAPER-TSIMERMAN-18 is by `codex-hjdg0j`, not `codex-c83e7a`. What holds is that
`codex-c83e7a` did the routing (#1663), six hours after accepting RS-07's drop.

**3. The Cauchy and convexity step of Cor. 3.3 (missing, medium): confirmed.**
- The p. 384 image has the sentence as quoted. Brauer's exponents can be negative, so zeros of the
  Hecke factors in 1 − ε < Re s < 1 would be poles of L(s,ρ̄). Unconditionally, no disc of fixed
  radius about 1 is known to be free of such zeros, uniformly in E.
- The corollary survives through the entire L(s,η_{E/F}), which is what the extraction already
  does.
- The gap is discussed in the extraction but not recorded, so E9 is due.

**4. Lemma 4.1: "A with a basis of A[3] is rigid" (missing, medium): confirmed.**
- For A ∈ S(E,Φ) with g ≥ 2, take a non-torsion unit u ≡ 1 mod 3. Then ι(u) fixes A[3] pointwise
  and has infinite order.
- The step holds for polarized A, by Serre's lemma. But S(E,Φ) is unpolarized (p. 382), and
  Theorem 4.2 applies the lemma to B = A/T_I, which carries no chosen polarization.
- The extraction polarizes A and B without recording that the printed step fails, so E10 is due.

**5. Mixed Shimura foundations have no owner (missing, medium): confirmed.**
- No layer plans general mixed Shimura data, special subvarieties, the pure part or neat levels,
  and route 11's own reason concedes this.
- Correction: the search missed two items.
  - This paper's mixed-special-point-order.
  - PAPER-DIMITROV-GAO-HABEGGER-21/17. It constructs the datum P_{2g,a} = V_{2g} ⋊ Sp_{2g} of the
    universal abelian variety, and is routed to AbelianSchemesBettiMapsPartII.
- That datum is one specific case, so the claim stands. But the mixed-Shimura owner in fix (a)
  should import or absorb DGH21/17 rather than duplicate it.

**6. "c_g is a positive constant" (low): confirmed.**
- I recomputed the j = 0 height from the closed forms: h = −1.66769 in the paper's unscaled metric
  (p. 381 image), and −0.74875 after adding ½ log 2π. That is the known minimum in Deligne's
  normalization.
- The inequality is right for the true, negative c_g. Only the word "positive" is wrong: E11, a
  misprint.

**7. "Degree bounded by 2g" (low): confirmed.**
- I re-derived the argument: σ fixes the period point Z exactly when σΦ = Φ. So ℚ(Z) is the reflex
  field, which has degree 8 > 6 for a generic sextic CM field.
- Pila–Tsimerman arXiv v3, Lemma 7.4, has the same "degree at most 2g", with no proof of 2g.
- The extraction keeps only a bound d_g and flags the discrepancy in a note, but has no source
  issue for it: E12.

**8. The metric adapter has two owners (duplicate, low): confirmed.**
- Tsimerman's metric is AGHMP's, so h_T = h_AGHMP.
- Route 2 sends the adapter to R35, and AGHMP's route-11 brief proves the same adapter in the
  Part II.
- The duplication is also inside this paper: route 9 both imports "normalization" from R35 and says
  "construct the normalization/application adapter here".
- R35.2, which RS-06 keeps for normalization, is the right single owner.

**9. `NumberField.absMulHeight₁` (library-claim, low): confirmed.**
- The definition is at `NumberField.lean:137`, with `absLogHeight₁` at `:146`, and both are in the
  baseline index.
- The docstring's "junk value of `0`" contradicts the code's `1`, as noted.

**10. The pila-wilkie item, prerequisites and links (low): confirmed.**
- LD.6 plans only rational points. The item's own note concedes that the degree-d extension comes
  from Pila 2009.
- Pila 2009 is absent from the 20 prerequisites.
- The three links point to citing papers. Their notes say so, but a prerequisite link is what the
  maintainer uses to fetch the paper for a later batch.

**11. Stale counts and no `sourceVersions` (low): confirmed.**
- The item statuses count 5/30/66, but validation still reads 5/28/68.
- Neither file has `sourceVersions`. The checker does not require it here, because no source issue
  affects a stated result.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-TSIMERMAN-18.review.json`: ok.
- No Lean was compiled. This job changes no extraction file. The fixes are for the fix job.
