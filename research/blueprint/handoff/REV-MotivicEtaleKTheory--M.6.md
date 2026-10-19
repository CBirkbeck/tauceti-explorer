# REV-MotivicEtaleKTheory--M.6 handoff

Completed independent review of BP-MotivicEtaleKTheory--M.6, issue #10794, by Codex session `codex-PqsrIq`, 2026-10-19. The original author session was `codex-QL5yGt`. Verdict **accepted after correction**, with M.6 coverage **planned** and every implementation status unchecked. This is a complete review, not a checkpoint.

## Delivered

- Corrected the packet, reader and suggested Lean file; added the review report and seven per-node corrected verdicts.
- Made the relative cycle map's rational characteristic-summand projector explicit, and separated graded structure-sheaf classes from pure-weight lifts. The P² hyperplane check rules out the unprojected map.
- Corrected the general product proof to use the universal tensor identity and Riou's several-operand motivic-target uniqueness, retaining the coherent-model obligation.
- Corrected the source labels/roles and made the last-entry Milnor/cubical-localization residue sign conversion explicit.
- Added existing M.4 diagonal-Milnor and M.6b rational-splitting prerequisites, Whitney/universal-characterization API items, and a separate coefficient-recurrence API name. No nodes or layers were added.
- Confirmed source finding E-M6-1 and added E-M6-2 for the Whitney localization/polynomial displays in Weibel’s recorded author copy. The bundle typo was previously recorded as K3BlochGroups/E31. Published correction status is unestablished because the linked errata PDF was inaccessible. Added source/version and review metadata.
- Rechecked all five source hashes, every node locator, all three pinned baseline declarations, supplier scopes and the current upstream boundary. Sources and calculations are described in original prose only.

## Validation

Packet checker: **0 errors, 0 warnings**. Totals: **7 nodes, 15 API items, 11 tests, 4 new planets + 2 imported = 6 in M.6, 3 gaps, 4 requests**. Reader synchronization, source-issue/version schema, local links, allowed paths and whitespace checked.

`lean-check research/blueprint/suggested/MotivicEtaleKTheory--M.6.lean`: **exit 0**, **2 warnings**, both named theorem uses of `sorry`; one real-bodied scalar and two proved symbol-normalization examples. Memory available beforehand: **76 GiB**. Compilation pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No build/update/cache command or language server was used.

## Remaining supplier work

1. **G1, M.6a/M.6b:** provide the full augmentation-, transition- and normalized-layer-compatible FS/Levine filtered comparison; its edge inverse must retain the rational projector. The gamma-filtration comparison also needs this adapter to transport the Levine/FS inclusion into the chosen tower. Keep the existing simultaneous-moving/product/Adams coherence obligation.
2. **G2, K.2/S.6:** identify universal motivic evaluation on actual plus/Q K-models through derived sections, ordered relative fibres, localization and continuity to essentially smooth curve local rings. K-endomorphism uniqueness alone does not supply motivic-target uniqueness.
3. **G3, SF.5:** prove the supported leading Chern formula on the relative cube with specified face nullhomotopies. The named Gillet 1981/Gillet–Soulé 1987 leads remain unread proof boundaries. Ordinary Chow identities after forgetting support do not discharge this.

Resume from the packet's four precise requests and [review report](../reviews/REV-MotivicEtaleKTheory--M.6.md), not from a second tower or spectrum construction. Keep the perfect-field/smooth quasi-projective scope, relative characteristic-summand convention, six-planet limit and degree-zero S.7 ownership. Arithmetic-base or general supported gamma bounds require their own source-scoped suppliers. The strongest actual edge/universal-character theorem stays in the reader until its carriers are available at the pins.
