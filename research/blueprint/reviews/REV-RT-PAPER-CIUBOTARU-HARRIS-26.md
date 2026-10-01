# REV-RT-PAPER-CIUBOTARU-HARRIS-26

Independent verification of the red team RT-PAPER-CIUBOTARU-HARRIS-26 (Codex, session `codex-rtOQ9t`, PR #5372) on the
extraction PAPER-CIUBOTARU-HARRIS-26, for issue #5053.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`c0-5fbc06`, `cc-39fac3`, PR #4363);
- its errata (`cc-fb70e5`, PR #1824);
- its review REV-PAPER-CIUBOTARU-HARRIS-26 (`cc-58621d`, PR #4732);
- the red team.

**Result: both findings confirmed.** /1 is high and /2 is medium. Neither claims a global counterexample.

## What I read

- **The paper.** Ciubotaru–Harris, arXiv 2311.15300v1 (<https://arxiv.org/pdf/2311.15300v1>), SHA-256
  `7261083b…c103`, equal to the red team's. I read:
  - Definition 2.5 (p. 7, geometric parameters);
  - §8.1–8.2 with (8.1), Theorem 8.3, Definition 8.4 and Theorem 8.5 (pp. 27–28);
  - the proof of Theorem 8.5 (p. 29) and Remark 8.7 (p. 30).
- **The extraction.**
  - Items: extraneous-exceptional and galois-discrete-series.
  - Source issue: E11.
  - Routes: the briefs of routes 2 and 3 and the item lists of all four.

## /1 (high, error): no extraneous points for G2. Confirmed.

**The point.** E11's G2 parameter is s = s_c s_ν with (aα₁ + bα₂)(s) = (−1)^a q^{b/2} and ν = ½ω₂. I recomputed the
positive-root values: −1, q^{1/2}, −q^{1/2}, q^{1/2}, −q^{1/2}, −q.

**Why L(s) is unitary.**
- **Irreducible:** none of the root values is q^{±1}, and none becomes so along s_c s_{tν} for t ∈ [0, 1], so the
  principal series is irreducible on the whole path.
- **Hermitian:** w₀ = −1 sends s to s_c q^{−ν}, which is the conjugate-inverse of s.
- **Unitary at the start:** at t = 0 the representation is unitarily induced.

So L(s) is unitary.

**Why ℜ(s) is extraneous.**
- **Generic:** g∨_q = 0, so L(s) is generic and s ∈ CS(G2, 0). Its central point is 1, while ℜ(s) = ½ω₂.
- **Geometric:** the weights of a faithful representation are integral root combinations, so s is geometric in the sense
  of Definition 2.5.
- **Connected centre:** G2 has trivial centre.

So ℜ(s) is an extraneous point for G2, against the item's "none in G2" (Remark 8.7).

**Where the proof breaks.** The proof of Theorem 8.5 fails at "Applying Theorem 6.14 to z(O∨)", which treats ℜ(s) as a
real unitary parameter. This is E11's gap carried into Theorem 8.5, which E11's locators do not list.

## /2 (medium, missing): arithmetic suppliers for Theorem 4.2. Confirmed.

galois-discrete-series sits on the local route 2. Its note relies on [GHS] with Beuzart-Plessis's globalization and the
§3.1 cusp coefficients. Route 2's brief imports only local suppliers.

The related arithmetic items are on route 3, which itself consumes UnitarySpherical, so a back-import would loop. The
fix moves the item to the early arithmetic part of route 3, or names a separate earlier supplier.
