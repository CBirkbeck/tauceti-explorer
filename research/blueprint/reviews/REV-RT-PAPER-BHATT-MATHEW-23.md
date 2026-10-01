# REV-RT-PAPER-BHATT-MATHEW-23

Independent verification of the red team RT-PAPER-BHATT-MATHEW-23 (Codex, session `codex-rtOQ9t`, PR #5402) on the
extraction PAPER-BHATT-MATHEW-23 (Bhatt–Mathew, *Syntomic complexes and p-adic étale Tate twists*, Forum Math. Pi 11
(2023), e1), for issue #4219.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-442dc5`, PR #1980);
- its review REV-PAPER-BHATT-MATHEW-23 (`cc-7b31c4`, PR #2488);
- the red team.

**Disclosure.** /1's fix keeps PrismaticCohomology PR.4/PR.5 as the owner. My red team RT-PAPER-BHATT-SCHOLZE-22 (PR
#5391) reported a dependency cycle at PR.4. Neither verdict here depends on it.

**Result: both findings confirmed.** /1 is high and /2 medium. For /2 I give a sharper fix.

## What I read

- **The paper.** arXiv:2202.04818v2 (<https://arxiv.org/pdf/2202.04818v2>), SHA-256 `12eb19e4…0955`, equal to the red
  team's. I read:
  - Examples 1.2 and 1.5 (p. 2);
  - Proposition 5.6 and its proof (p. 24).

  The published text has the same statements on published pp. 2 and 23.
- **The extraction.** Item /006; the unit tests in the briefs of routes 1 and 2, and the rest of those briefs.

## /1 (high): Z/p(1) over Z_p is not the étale μ_p. Confirmed.

**The brief's test.** Route 1's test reads "A = Z_p: F-smooth, with Z/p(1) = μ_p". As an identity in D((Spec Z_p)_et),
it equates Z/p(1) with the étale μ_p in degree 0.

**What the paper says.** Example 1.5 gives Z/p^n(1) as the derived fppf-to-étale pushforward of μ_{p^n}, that is,
fib(p^n : G_m → G_m). Item /006 already says so. Example 1.2 identifies Z/p^n(1) with the étale μ_{p^n} only over
X[1/p].

**The stalk check.** Take R, the strict henselization of Z_3, unramified with residue field F̄_3. A cube root u of 4
satisfies u ≡ 1 mod 3, and then u³ ≡ 1 mod 9. Since 4 ≢ 1 mod 9, the element 4 is not a cube. So H^1(Z/3(1)) ≠ 0 at the
closed geometric point, where the étale μ_3 has none.

**The fix.** The red team's fix (H^0 = μ_p, H^1 = coker(p), restriction to Q_p) is right.

## /2 (medium): the domain of the symbol test. Confirmed, with a sharper fix.

**What needs units.** Bloch–Kato's symbols, and those in the paper's Proposition 5.6, need unit entries.

**Only t is an obstruction.**
- **1 + pt is harmless.** It is ≡ 1 mod p, so it is a unit in every henselian local ring at a point of the special
  fibre. Its generic zero at t = −1/p has closure Spec Q_p, which misses the special fibre.
- **t is the problem.** It vanishes along t = 0, which meets the special fibre.

**The fix.** The domain should be Spec Z_p[t, t^{−1}] (or its p-henselization). Inverting 1 + pt as well is harmless but
unnecessary. The identity ρ_1(t dlog t) = {1 + pt, t} agrees with Bloch–Kato (4.3) for π = p.
