# REV-RT-PAPER-HACON-WITASZEK-23

Independent verification of the red team RT-PAPER-HACON-WITASZEK-23 (Codex, session `codex-rtOQ9t`, PR #5412) on the
extraction PAPER-HACON-WITASZEK-23 (Hacon–Witaszek, *On the relative minimal model program for fourfolds in positive and
mixed characteristic*, Forum Math. Pi 11 (2023), e10), for issue #4223.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-442dc5`, PR #2130);
- its review REV-PAPER-HACON-WITASZEK-23 (`cc-7b31c4`, PR #2502);
- the red team.

None of the findings cites work of mine.

**Result: both findings confirmed, both medium.** /2 is confirmed for two of its three parts. Its third part, Claim 6.8, is
not a slip.

## What I read

- **The paper.** The published open-access PDF (<https://doi.org/10.1017/fmp.2023.6>, 35 pages; printed page = PDF
  page). I read:
  - p. 12 (proof of Proposition 2.15);
  - p. 19 (proof of Corollary 4.7);
  - p. 26 (Proposition 5.8 and its proof);
  - pp. 29–30 (Claim 6.8 and its proof, with the page image of the last paragraph).
- **The extraction.** The items embedded-to-birational, echoes, witt-fourfold and partial-terminalization, and E1–E11.

## /1 (medium): Proposition 5.8's proof. Confirmed.

**The target problem.** The proof's "corresponding morphism f′ : X′ → Y" maps a projective X′ to a quasi-projective Y.
With X = P¹ and Y = A¹, every regular projective modification of P¹ is P¹, and P¹ → A¹ is constant, so the step cannot
work as written.

**The hypothesis transfer.** The proof then applies Conjecture 5.7 on X′, although it is assumed only for X and its
subschemes.

**The fix.** Compactify Y, restrict to the preimage of Y, and supply or assume the transfer. The fix is right, and the
proposition's conclusion is not refuted.

## /2 (medium): three proof slips. Confirmed for two.

- **(a) p. 12.** "Blowups at strict transforms of C" is empty after the first blowup. AHK07's Example 1.4 iterates through
  E₁ ∩ B̃ᵢ.
- **(b) p. 19.** The maps f_S and f_{S^ν} are written to X, but the identity R^i f_*(u_*WO_S) = R^i(f_S)_*WO_S and the
  relative vanishing live over Z.
- **(c) p. 30. Not a slip.** The paper proves 𝒴 terminal via log discrepancies of (𝒳, 0), and this is valid. Because
  K_𝒴 + Δ_𝒴 = φ*K_𝒳 with Δ_𝒴 ≥ 0 by (4), A_{(𝒴,0)}(E) ≥ A_{(𝒳,0)}(E) = A_{(𝒳,X)}(E) + mult_E X > 1. The step uses (4)
  tacitly; a proof note suffices, and no sourceIssue should be recorded.
