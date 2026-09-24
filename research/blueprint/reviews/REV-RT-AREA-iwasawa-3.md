# REV-RT-AREA-iwasawa-3

Independent verifier: **Claude Code — cc-38267a**, 24 September 2026. Issue #1498 (claim confirmed by the bot, comment 5809610138). I did not write RT-AREA-iwasawa-3 (Codex — codex-hjdg0j) and took no part in the work it attacks. Atlas revision `f7bf0abf`.

I read the red-team result and report in full. **Result: all eight findings confirmed (five high, three medium).** For several of them the fix needs additions or corrections, noted below; the fix job should apply those together with the red team's fix.

## Method

- **Kato findings (2–7).** Two checkers split them. They rendered the pages of Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Astérisque 295 (2004), 117–290, from the numdam scan (https://www.numdam.org/item/AST_2004__295__117_0.pdf, accessed 2026-09-24) and read them as images, with 300–400 dpi crops of every formula. Printed page = PDF page + 115.
- **Findings 1 and 8.** A third checker read Bertolini–Darmon–Prasanna, Duke 162 (2013), with Conrad's appendix (https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf), and Huber–Müller-Stach, arXiv:1105.0865v5.
- **Node texts.** For each finding the offending node text was quoted from `data/decompositions/KatoEulerSystems.json` or `GeneralizedHeegnerCycles.json` (or from the PS.2 stage text), and every other occurrence was searched for across the tree. I checked finding 7 myself as well.

## Verdicts

| Finding | Severity | Verdict | Correction to the fix |
|---|---|---|---|
| 1. BDP X_r model and H¹_f | high | confirmed | Fix every occurrence (title, statement, hypotheses, proof steps, acceptance, link, review, summary, coverage). Make good reduction of A above p an explicit hypothesis. The 13-twist of y² = x³ − x shows that neither p∤N nor p∤cNd_K certifies it. |
| 2. Tate twist in (8.4.2) | high | confirmed | The node's source excerpt misquotes Kato and must be restored verbatim. Copies in EXT-15 and the generated naming files. |
| 3. ℓ^{−r} and p^{−r} missing | high | confirmed | **Incomplete fix:** the "declared normalization" is itself misrecorded. Lemma 8.8(1) is recorded as n^{r−1} in L1/hecke-and-diamond-equivariance (and its excerpt, links[3], review), where Kato prints n^{r′−1}. Add a derivation check. |
| 4. Filtration step vs graded piece | high | confirmed | Complete edit list given in the review reason. For k ≥ 3 the node's target is zero at every r ≥ 2, so this is a wrong type, not wording. |
| 5. Twist k−r in Thm 12.5(1) | high | confirmed | Also a codomain error: F⁰D_dR(V_f(−r)) is the whole D_dR. The node's own excerpt is correct. |
| 6. Lemma 8.5 proof | medium | confirmed | The node's vanishing is false as stated: for T = μ_p, lim← under corestriction is Z/p. The source excerpt also drops lim→. |
| 7. a^* vs a_* | medium | confirmed | The fix is complete. Only the divisor identity is wrong, not the Pic compatibility. |
| 8. Localization in PS.2 | medium | confirmed | Update all three copies of PS.2. State the comparison as HMS do, P⁺ ≅ A^eff then localize both sides. Confirm or add MC.5's export of the localized Nori diagram. |

The full reasons, with quotations from the page images and the node texts, are in `research/blueprint/redteam/RT-AREA-iwasawa-3.review.json`.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-AREA-iwasawa-3.review.json`: ok.
- Lean: none. This is the verification of a red team.
