# REV-RT-PAPER-STEVENS-08

Independent verification of the red team RT-PAPER-STEVENS-08 (Codex, session `codex-rtOQ9t`, PR #5389) on the extraction
PAPER-STEVENS-08 (Stevens, *The supercuspidal representations of p-adic classical groups*, Invent. Math. 172 (2008)), for
issue #5099.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-e94dc5`, PR #4616);
- its review REV-PAPER-STEVENS-08 (`cc-fb70e5`, PR #4639);
- the red team.

**Result: all three findings confirmed.** /1 and /2 are high, /3 medium.

## What I read

- **The paper.** arXiv math/0607622v2 (<https://arxiv.org/pdf/math/0607622v2>): p. 8 (§2.1, A₋ = A^Σ ≃ Lie G) and p. 20
  (the proof of Theorem 4.1).
- **The extraction.** Items 78, 111, 112, 113, 246 and 306.

## /1 (high): the obstruction lives on K/N, not K/ker η. Confirmed.

**What item 112 says.** η extends iff [α] ∈ H²(K/ker η, ℂ^×) is trivial.

**The counterexample.** Take K the Heisenberg group U₃(F₃) with N = Z(K) = [K, K] ≅ C₃, and η faithful.
- Then K/ker η = K, and the lift ρ(a,b,c) = ζ^c has factor set ζ^{−ab′} = δρ, a coboundary.
- Yet no character of K extends η, since characters kill [K, K].
- On K/N ≅ F₃² the same factor set is a non-symmetric bilinear form, hence a nontrivial class.

**The fix.** The paper's argument on p. 20 is the relative Clifford obstruction. The fix restates items 112–113 relatively
and supplies the p-primary bound that item 111 needs.

## /2 (high): A₋ is not an o_F-module in the unitary case. Confirmed.

For skew a and i ∈ o_F with ī = −i, (ia)‾ = (−i)(−a) = ia is hermitian. A₋ is an F₀-space (≃ Lie G, p. 8). So item 78's
"o_F-lattices in A₋" must be o_{F₀}-lattices.

## /3 (medium): two items for one definition. Confirmed.

Items 246 and 306 define the same disconnected-quotient cuspidality at the same locator, both on the same route. Item 246
is the maximal-order case of 306.
