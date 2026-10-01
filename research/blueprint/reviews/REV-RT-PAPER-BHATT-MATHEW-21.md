# REV-RT-PAPER-BHATT-MATHEW-21

Independent verification of the red team RT-PAPER-BHATT-MATHEW-21 (Codex, session `codex-rtOQ9t`, PR #5416) on the
extraction PAPER-BHATT-MATHEW-21 (Bhatt–Mathew, *The arc-topology*, Duke Math. J. 170 (2021)), for issue #4187.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-7b31c4`, PR #1926);
- its review REV-PAPER-BHATT-MATHEW-21 (`cc-d67081`, PR #2534);
- the red team.

None of the findings cites work of mine.

**Result: all eight findings confirmed.** /1, /2 and /6 are high. /4 and /7 are medium. /3, /5 and /8 are filed as high;
I would grade them medium.

## What I read

- **The paper.** arXiv 1807.04725v4 (<https://arxiv.org/pdf/1807.04725v4>, 64 pages), the version the extraction read.
  I read:
  - Theorem 1.19 (p. 7);
  - Remark 2.18 and Corollary 2.20 (pp. 13–14);
  - Proposition 3.10 and its proof (pp. 18–19);
  - Remark 3.31 (p. 23);
  - Lemma 4.3 and its proof (pp. 25–26);
  - Warning 4.20 (p. 33);
  - the proof of Theorem 5.6 (p. 40);
  - Notation 5.8 (p. 41);
  - the proof of Theorem 5.17 (p. 45);
  - §6.1 and Example 6.1 (p. 47);
  - the proof of Proposition 6.22 (p. 54);
  - Theorem 7.3 and Remark 7.4 (pp. 56–57).
- **The extraction.** Items /27, /46, /77, /80, /81, /96, /109, /120 and /141, route 1's brief, and E3.
- **The atlas.** The EDC.0 stage text.

## The findings

- **/1 (high): Lemma 4.3.** The lemma lacks the hypothesis ker(V → W) ⊆ p. For V → V/m with p = 0, pW = 0 pulls back
  to m.
- **/2 (high): Remark 3.31.** The negative claim holds only for components of rank ≤ 1. Without the rank bound it
  contradicts the item's own first half.
- **/3 (I would grade it medium): two notes.**
  - **Item /46's note** says inverse-limit stability is "false for v-covers". The paper does not say this.
  - **Item /96's note** implies the v-topology is subcanonical. It is not: Spec k → Spec k[ε]/ε² is a v-cover on which
    h_{A¹} fails to be injective.
- **/4 (medium): item /27.** It keeps Theorem 1.19's smooth disjunct, which E3 already shows is not proved.
- **/5 (I would grade it medium): Example 6.1.**
  - **The hypothesis.** The square (15) is introduced for a noetherian A; item /120 generalises it without justification.
  - **The misprint.** The printed "horizontal" fibres are the vertical localization fibres.
- **/6 (high): Notation 5.8.**
  - **The dropped hypothesis.** Λ is a finite ring in the paper, and item /109 drops this.
  - **The double owner.** Route 1 both imports the constructible categories from EDC.0 and re-routes /109 as a missing
    construction.
- **/7 (medium): proof slips.** I checked two directly:
  - **(a):** the proof of Theorem 5.6 uses functors into FinSet_inj, which excludes the fold map.
  - **(e):** Proposition 3.10's proof says "coproducts" where its statement says "products".
- **/8 (I would grade it medium): missing cited inputs.** No item records [Bha16, Theorem 1.5], [Del77, Cor. 1.11] or
  [Hub96, Cor. 4.2.7], although Theorem 5.17 and Proposition 6.22 use them.
