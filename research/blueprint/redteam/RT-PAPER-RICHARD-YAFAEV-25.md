# RT-PAPER-RICHARD-YAFAEV-25

Red team of the extraction PAPER-RICHARD-YAFAEV-25: Richard and Yafaev, *Generalised
André–Pink–Zannier conjecture for Shimura varieties of abelian type*, Publ. Math. IHÉS 141 (2025)
249–331. The red team is Claude Code, session `cc-c2c06b`, 30 September 2026, issue #4289. The
extraction is by `cc-fb70e5` and its review by `cc-7b31c4`. I did neither.

**Result: 2 findings, 1 medium and 1 low.** Both come from restructurings that were accepted hours
before the review, which did not apply them.

## Findings

**1. Route 1 puts quantitative Masser–Wüstholz results in a qualitative layer. (error, medium)**
- Route 1 sends two uniform refinements of Faltings' theorems to R28.4:
  - item 11, Masser–Wüstholz's refinements of the Tate conjecture (for ℓ > M′, 𝔽_ℓ[U′(ℓ)] is
    semisimple with the expected commutant, uniformly in U′);
  - item 12, the paper's Theorem 4.7 and Proposition 4.8 (uniform integral index bounds over fields
    of finite type).
- RS-06, accepted at 13:29 UTC on 23 September, narrowed R28.4 to Faltings' qualitative Satz 3/4.
- Tsimerman's route 10, accepted at 17:11, created the Faltings Part II "Quantitative isogeny
  estimates" precisely because R28 is qualitative. That Part II decomposes Masser–Wüstholz's isogeny
  estimates, which these refinements rest on.
- As routed, the base layer R28.4 would need its own Part II's theorem.

**Fix.** Coalesce items 11 and 12 into FaltingsFinitenessAndIsogenyTheoremsPartII, and have route 4
import Theorem 4.7 from it.

**2. Route 3 sends flatness criteria over ℤ̄_p to a layer that no longer plans them. (error, low)**
- Route 3 sends Propositions 7.13–7.15 to SF.0. They are flatness, lifting and integrality criteria
  for schemes of finite presentation over the non-noetherian ℤ̄_p.
- RS-25, accepted at 13:09 the same day, narrowed SF.0 to library reuse plus relative Spec and Proj.
  Even before that, SF.0 only stated flatness as a property of named morphisms.
- No stage plans these criteria. Their only consumer is the p-adic Kempf–Ness theorem, which route
  4's Part II owns.

**Fix.** Move item 35 into route 4.

## What held

**RG2.4.** RS-31 narrowed it, but it still keeps the Cartan decomposition, so item 28 stands.

**Route 2.** It goes to R01.6, which is unchanged.

**Route 4.**
- Its title matches the parent's current title, "Complex Shimura varieties and canonical models".
- Its id is used by no other extraction.
- Nothing in the atlas plans Hecke-orbit heights, the uniform integral Tate hypothesis or p-adic
  geometric invariant theory, so the route duplicates nothing.

**Library.** The Goursat citation holds, and neither library has Nori theory, Serre's complete
reducibility, Kempf–Ness or the ℤ̄_p criteria.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-RICHARD-YAFAEV-25.result.json`: ok.
- No Lean was compiled.
