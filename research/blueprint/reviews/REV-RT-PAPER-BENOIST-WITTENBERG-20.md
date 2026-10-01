# REV-RT-PAPER-BENOIST-WITTENBERG-20

Independent verification of the red team RT-PAPER-BENOIST-WITTENBERG-20 (Codex, session `codex-rtOQ9t`, PR #5443) on the
extraction PAPER-BENOIST-WITTENBERG-20 (Benoist–Wittenberg, *On the integral Hodge conjecture for real varieties, I*,
Invent. Math. 222 (2020), 1–77), for issue #4171.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`codex-a71f92`, `cc-7b31c4`, `codex-c83e7a` and `cc-442dc5`, PRs #1675, #1975, #2020 and #2121);
- its review REV-PAPER-BENOIST-WITTENBERG-20 (`cc-fb70e5`, PR #2563);
- the red team.

None of the findings cites work of mine.

**Result: all three findings confirmed.**
- /1 and /2 are high.
- /3 is medium.

None affects the paper's theorems.

## What I read

- **The paper.** The author-hosted published PDF (<https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf>),
  77 pages, SHA-256 `daeb43ec…72a46a9`, equal to the extraction's. I read:
  - §1.1.4 with (1.16) (p. 14);
  - the end of §1.2.6 with (1.35) (p. 19, also as a page image);
  - Lemma 3.7, (3.6) and Sublemma 3.8 (pp. 50–51).
- **The extraction.** The items geyer, semialg-duality, real-push-coordinates, phi-genus and pic-descent-parity, and
  sourceIssue E5.

## The findings

- **/1 (high): Geyer's lemma.** Lemma 3.7 concerns Pic(B)[2∞] → Pic(B_C)^G[2∞]; the item states it for
  Pic(B_C)^G[2∞] → Br(R).
  - **Why the item is wrong.** By (3.6), the source's map is surjective exactly when the item's arrow vanishes on
    2-primary torsion. So the item's criterion is reversed: its arrow is surjective in odd genus.
  - **The example.** The anisotropic conic (genus 0) has Pic(B_C)[2∞] = 0, which cannot map onto Br(ℝ) = F₂.
  - **What to recheck.** /phi-genus, against the corrected arrow.
- **/2 (high): semi-algebraic duality.** (1.16) claims a perfect pairing for any locally constant sheaf of finite exponent;
  the item copies this.
  - **The example.** On a point, G = ⊕_ℕ F₂ breaks biduality: G → Hom(∏F₂, ℚ/ℤ) is not onto.
  - **What the supplier assumes.** The red team reports that SGA 4 XVIII §3.2.6 assumes constructible coefficients; I
    did not re-read SGA 4. The paper's own uses have finite stalks.
  - **The fix.** Restrict the item to finite stalks and record a source issue.
- **/3 (medium): E5's exponent.** p. 19 prints f_*: H^p(X(R)) → H^{p+c}(X(R)). The domain is the misprint E5 records, but
  the target degree p + c is right, as /real-push-coordinates says. E5's correction "H^(p−c)" introduced a wrong sign and
  should be changed to H^(p+c).
