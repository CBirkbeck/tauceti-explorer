# REV-RT-PAPER-GAN-SAVIN-23

Independent verification of the red team RT-PAPER-GAN-SAVIN-23 (Codex, session `codex-rtOQ9t`, PR #5492) on the
extraction PAPER-GAN-SAVIN-23 (Gan and Savin, *Howe duality and dichotomy for exceptional theta correspondences*,
Invent. Math. 232 (2023), 1–78), for issue #4151.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-d67081`, PR #1947);
- its review REV-PAPER-GAN-SAVIN-23 (`cc-39fac3`, PR #2570);
- the red team.

None of the findings cites work of mine.

**Result: all three findings confirmed, all high.** /1 and /2 are inherited from arXiv v1. /3 is an error in an item that
the extraction's review added. None affects the paper's main Howe duality and dichotomy theorems.

## What I read

- **The paper.** arXiv:2102.00372v1 (<https://arxiv.org/pdf/2102.00372v1>), 56 pages, SHA-256 `8b3b6702…08c6e5`, the
  same file as the red team's. I read:
  - Proposition 3.1 (pp. 8–9);
  - Theorem 6.1 (p. 19);
  - Propositions 6.6–6.7 and Corollary 6.8 (p. 22);
  - Proposition 7.1 and Theorem 7.2 (p. 23);
  - Lemma 11.4 and its proof (p. 36).

  I checked pp. 22, 23 and 36 on the page images. I did not read the published version.
- **The extraction.** Items `cor-6-8`, `lemma-11-4` and `rev-langlands-classification-and-harish-chandra`, and the
  source record.

## The findings

- **/1 (high): Corollary 6.8 needs a nonzero lift.** The corollary's θ_J(π) can be 0, and its last step uses
  Proposition 6.6, which needs a nonzero Θ_J(τ).
  - **The counterexample works.** π_deg[1] = Θ(1) and π_sc[χ] = Θ(χ) are tempered, nongeneric and not isomorphic, by
    Propositions 3.1(iii) and 7.1. They have nonzero lifts to PD×. By Theorem 6.1 both therefore have zero lift to
    PGSp₆, so the printed implication would identify them.
- **/2 (high): root exchange needs the factor ψ_Y(y)⁻¹.** The statement of Lemma 11.4 omits it, but the proof's
  intertwiner contains ψ̄_Y(y).
  - **I checked the counterexample by hand.** The Schrödinger-type model is a representation, ℓ = evaluation at 0 is
    ψ_X-equivariant, and the unweighted integral ∫ f is translation-invariant.
  - **Without the weight it is not even well defined.** The unweighted integrand also depends on the coset
    representative.
- **/3 (high): "tempered iff P = G" fails for groups with split centre.** For GL₁, |·|_F is a Langlands quotient with
  P = G that is not unitary, so not tempered. The correct criterion is P = G and ν = 0, or "iff P = G" under a
  unitary-central-character or anisotropic-centre assumption. Gan–Savin use the classification only for G₂, so this is
  not an error of the paper.
