# REV-RT-PAPER-GAN-SAVIN-23-B

Independent verification of the red team RT-PAPER-GAN-SAVIN-23-B (Codex, session `codex-rtOQ9t`, PR #5494) on the
extraction PAPER-GAN-SAVIN-23-B (Gan and Savin, *The local Langlands conjecture for G₂*, Forum Math. Pi 11 (2023),
e28), for issue #4231.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-39fac3`, PR #2036);
- its review REV-PAPER-GAN-SAVIN-23-B (`cc-d67081`, PR #2487);
- the red team.

None of the findings cites work of mine. Earlier today I verified the red team on the companion paper,
PAPER-GAN-SAVIN-23 (#5585). That is a different extraction, and none of its findings is reused here.

**Result: all three findings confirmed, all high.** /1 is an overgeneralisation by the extraction. /2 and /3 are errors
in the published paper. None affects the LLC for G₂ itself.

## What I read

- **The published paper.** The open-access Cambridge PDF (<https://doi.org/10.1017/fmp.2023.27>), 42 pages, downloaded
  on 1 October 2026. Cambridge stamps each download, so the hash differs from the red team's, but the pages match. I
  read:
  - p. 2 (the general LLC);
  - p. 4 (Main Theorem (vi)–(vii)), on the page image;
  - p. 8 (Theorem 2.1 and Proposition 2.3), on the page image;
  - p. 22 (§7(c));
  - pp. 29–33 (Appendix B, Propositions 11.3 and 11.6, Corollary 11.7), with p. 33 on the page image.
- **The companion.** arXiv:2102.00372v1: Proposition 3.1(ii) (p. 9), Theorem 8.5 and its proof (pp. 27–28), and Theorem
  15.2 (pp. 52–53).
- **The extraction.** Items 1, 9, 64, 117 and 118, and the exceptional-theta route brief.

## The findings

- **/1 (high): packets of a general split group are not parametrised by all of Irr(S_φ).** The paper uses the
  unquotiented S_φ only for G₂, whose dual has trivial centre, and quotients by Z(Spin₇) for PGSp₆.
  - **The counterexample works.** For PGL₃ and φ = Sym², Z_{SL₃}(φ) = μ₃, but the split-form packet is {St}.
- **/2 (high): Main Theorem (vi)'s middle codomain is too small.** π_gen[1] = θ(St⁺) is a generic discrete series. Its
  discrete lift goes to PGL₃ ⋊ Z/2Z, so by Proposition 2.3 its PGSp₆ lift is not discrete series. Companion Theorem
  15.2(iii) identifies that lift as I₃(St)_gen, which is tempered. Proposition 5.2 covers only the ◇ locus.
- **/3 (high): Proposition 11.6 gives Fell-closure membership, not a subsequence.**
  - **The counterexample works.** With π₁ = St and π_n = 1 for n ≥ 2, St is weakly contained in the sum, yet every
    subsequence is eventually trivial. St is isolated (Proposition 11.3), so no subsequence converges to it.
  - **What still holds.** Corollary 11.7 survives the corrected statement.
