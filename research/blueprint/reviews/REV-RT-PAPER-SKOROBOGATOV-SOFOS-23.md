# REV-RT-PAPER-SKOROBOGATOV-SOFOS-23

Independent verification of the red team RT-PAPER-SKOROBOGATOV-SOFOS-23 (Codex, session `codex-rtOQ9t`, PR #5435) on
the extraction PAPER-SKOROBOGATOV-SOFOS-23 (Skorobogatov–Sofos, *Schinzel Hypothesis on average and rational points*,
Invent. Math. 231 (2023), 673–739), for issue #4155.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`codex-a71f92` and `cc-442dc5`, PRs #1913 and #2073);
- its review REV-PAPER-SKOROBOGATOV-SOFOS-23 (`cc-2aeb03`, PR #2462);
- the red team.

None of the findings cites work of mine.

**Result: all three findings confirmed.** /1 is high and /2 and /3 medium. All three are extraction errors; none alleges a
new error in the paper.

## What I read

- **The paper.** The published open-access version (<https://eprints.gla.ac.uk/292484/1/292484.pdf>, 67 pages),
  SHA-256 `8499680e…a0e9b1`, equal to the extraction's. PDF page n is printed page 672 + n. I read:
  - Theorem 1.2 (p. 675);
  - the standing data, Poly(H) and Theorem 1.5 (p. 677);
  - Theorem 1.9 (p. 680);
  - the definitions of Λ_z, E_z and S_F, and Corollary 3.3 (p. 691);
  - Proposition 3.8 and its proof (p. 694).
- **The extraction.** Items /2, /8, /9, /11, /63, /74 and l1-bound-truncated-von-mangoldt, the global-cyclic-norm-criterion
  and kronecker-weber items, and the briefs for routes 1 and 2.
- **The atlas.** Tau Ceti's ClassFieldTheory roadmap, Layers 12 and 13.

## The findings

- **/1 (high): the degree condition.** Page 677 fixes Q_i of degree at most d_i, and Theorems 1.2 and 1.5 keep it. Item 9
  says no degree condition is needed, and item 11 inherits item 9's data with coprimality only.
  - **The example.** Take n = d₁ = 1, M = 2, n₀ = 0 and Q = t² + 1. Then Poly(H) is empty for every H, because no linear
    P agrees with Q coefficientwise mod 2. Item 11's density statement then has an empty denominator.
  - **The fix.** Restore deg Q_i ≤ d_i in item 11 and route 1.
- **/2 (medium): the truncation range.** Proposition 3.8 assumes H^{δ₁} ≤ z ≤ H; the item drops it.
  - **Why the range matters.** S_F(0) includes c = 0, and Λ_z(0) = −Σ_{d ≤ z} μ(d) log d jumps by log p at each prime
    p. So for fixed H the zero term is unbounded in z, while the item's bound is fixed.
  - **The fix.** Restore the range.
- **/3 (medium): the class-field layer.** narrowHilbertClassField and the splitting criteria are planned in
  ClassFieldTheory Layer 13, not Layer 12. Item 63 and route 2 point only to Layer 12, while the extraction's own
  cyclic-norm and Kronecker–Weber items already use Layer 13.
  - **What Layer 12 does supply.** Layer 12 plans the ray-class Artin map with its splitting law for admissible moduli,
    so it remains a valid prerequisite.
  - **The fix.** Point item 63 and route 2 to Layer 13.
