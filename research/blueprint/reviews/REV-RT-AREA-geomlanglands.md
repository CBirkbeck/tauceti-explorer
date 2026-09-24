# REV-RT-AREA-geomlanglands

Independent verifier: **Claude Code — cc-38267a**, 24 September 2026. Issue #1524 (claim confirmed by the bot, comment 5810292272). I did not write RT-AREA-geomlanglands (Claude Code — cc-39fac3) and took no part in the work it attacks. Atlas revision `3aa56594`. Library pins: Mathlib 082e2d3, Tau Ceti f790474.

**Result: 37 of the 39 findings are confirmed and 2 rejected (/3 and /35).** For many confirmed findings the fix is corrected or narrowed; the corrections are in each reason in `research/blueprint/redteam/RT-AREA-geomlanglands.review.json`, and the fix job should apply those rather than the original fix text.

## Method

- **Split.** Six verifiers split the findings by roadmap: GeometricSatakeAndFusion; HeckeStacksAndLocalShtukas; LanglandsParameterStacks; ExcursionOperatorsAndSpectralAction ES0–ES7; the functoriality, function-field and BunG findings; and VStackSheavesAndLisseCategories.
- **What each did, per finding:**
  - read the stage texts and requires in `data/atlas.json`, the reviewed decompositions, the library coverage, the restructurings and the paper routes;
  - checked whether the claimed-missing object already has an owner through an accepted route or restructuring (the main rejection ground);
  - computed ancestors and descendants over the stage edges, and checked every proposed edge for acyclicity;
  - read the cited pages of Fargues–Scholze (arXiv:2102.13459v4), on rendered images where formulas matter, and of Scholze–Weinstein's Berkeley lectures.
- **Further sources fetched:** Prasad–Yu (math/0405381), Kaletha (1502.00650), Kottwitz (1401.5728), Badulescu–Roche (1302.5289v2) and Ghate–Le–Sheth (2210.07281v4).

## Rejected

- **/3 (missing, high).** The geometric invariant theory it calls unplanned is already planned by accepted routes: BOCKLE-HARRIS-KHARE-ETAL-19 route 2 and LAFFORGUE-18 route 3 (into LP2/LP3), FINTZEN-21 route 4, and LocalGaloisDeformationRingsPartII. A new RG2.6 GIT stage would add another owner. The real issue, where those items land, is covered by /23.
- **/35 (library-claim, low).** Mathlib's 1-categorical CatCenter is already recorded in the library audit, and ES0 plans only the enhanced centre. The proposed comparison π₀End(id) → CatCenter(hC) is in general neither injective nor surjective, so it does not give the enhanced centre what the finding claims.

## Main corrections to confirmed fixes

- **/1.** After reversing fusion and closure, the two-leg convolution geometry of VI.8.1(ii) must move to GS2 as well.
- **/6.** The finding's two fixes conflict; apply the primary one (ES2/ES3 own Chapter X, and LP4 drops its universal-property clause).
- **/7.** One more edge is needed, ES1:spectral-center → ES2.
- **/8.** Q̄_ℓ is uncountable; the gap is only for countable fields of characteristic ℓ, such as F̄_ℓ (Vignéras II.2.8).
- **/10.** The z-extension root stage is right. The accepted GLX26 D13 route cannot own it, because its Part II sits downstream of BG; D13 should import RG2.6.
- **/16.** Prasad–Yu is already routed through the accepted KPZ26 item; widen that item to the full Cor. 1.3 rather than adding a node.
- **/17.** The owner should follow the accepted ZHU-17 route 11: an early abstract MC.6 substage, not a new owner.
- **/19.** HS1 or GS4 owns the Perf closure, not both.
- **/20.** Drop the [Rap18] input. The Huber-versus-diamond RΓ_c comparison needs a request.
- **/23.** Take the GIT inputs from the items already routed, not from /3's RG2.6.
- **/24.** The single owner is the accepted Part II ReductiveGroupsIntegralRepresentationsPartII.
- **/27.** Narrowed: SF.1 → LP1 only.
- **/29.** VII.7.2 belongs in VS4, and there is no lisse reflexivity node.
- **/30.** Move VII.2.7–VII.2.10 into VS4 instead of adding VS1 → VS2, which would put 35 ancestors ahead of RS-05's solid core.
- **/31.** Drop the proposed ClassFieldTheory link, which an accepted link review declined.
- **/32.** BG1 must also be split.
- **/37.** A second misprint in IX.6.2, D_lis(Bun_{G_i}), was found by the verifier.

## Verdicts

| Finding | Kind, severity | Verdict |
|---|---|---|
| 1 | error, high | confirmed |
| 2 | missing, high | confirmed |
| 3 | missing, high | rejected |
| 4 | error, high | confirmed |
| 5 | duplicate, medium | confirmed |
| 6 | duplicate, medium | confirmed |
| 7 | error, medium | confirmed |
| 8 | missing, medium | confirmed |
| 9 | missing, medium | confirmed |
| 10 | missing, medium | confirmed |
| 11 | missing, medium | confirmed |
| 12 | duplicate, medium | confirmed |
| 13 | missing, medium | confirmed |
| 14 | error, medium | confirmed |
| 15 | duplicate, medium | confirmed |
| 16 | missing, medium | confirmed |
| 17 | duplicate, medium | confirmed |
| 18 | missing, medium | confirmed |
| 19 | missing, medium | confirmed |
| 20 | missing, medium | confirmed |
| 21 | error, medium | confirmed |
| 22 | missing, medium | confirmed |
| 23 | error, medium | confirmed |
| 24 | duplicate, medium | confirmed |
| 25 | duplicate, medium | confirmed |
| 26 | duplicate, medium | confirmed |
| 27 | duplicate, medium | confirmed |
| 28 | error, medium | confirmed |
| 29 | missing, medium | confirmed |
| 30 | error, medium | confirmed |
| 31 | missing, medium | confirmed |
| 32 | duplicate, medium | confirmed |
| 33 | error, low | confirmed |
| 34 | duplicate, low | confirmed |
| 35 | library-claim, low | rejected |
| 36 | duplicate, low | confirmed |
| 37 | other, low | confirmed |
| 38 | missing, low | confirmed |
| 39 | other, low | confirmed |

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-AREA-geomlanglands.review.json`: ok.
- Lean: none. This is the verification of a red team.
