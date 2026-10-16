# REV-DiamondEtaleCohomology — handoff

Issue #9921. Claude, session claude-fp7JM9, 16 October 2026. The review is complete: `research/blueprint/packets/DiamondEtaleCohomology.json` carries `review.status = accepted`, with reviewer `independent-review-REV-DiamondEtaleCohomology`. The full report is `research/blueprint/reviews/REV-DiamondEtaleCohomology.md`.

## What changed

- **Packet.**
  - Fifteen same-id refinement records; four came from the plan, and I corrected two of those.
  - Requests 25 → 21. Five were withdrawn because accepted supplier nodes or pinned Tau Ceti declarations already state them. One E3 request and three D5 requests were narrowed, and a ProfiniteCohomology Layer 1 request was added.
  - Five baseline declarations added; a `Stacks` source entry (Tag 0BC7) added.
  - Imports pinned by SHA-256.
  - Locators corrected, glued digits fixed, and a review object recording all 186 effective nodes.
- **Reader.** Regenerated from the corrected packet, then escaped for `src/markdown.js`.
- **Suggested Lean file.** Unchanged; it elaborates (six proof-placeholder warnings only).

## Supplier ids now cited instead of requests

- `EnhancedDerivedSheaves:E3/presentable-category-limits`, `E3/representability`, `E3/exact-coproducts-colimits`
- `ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence`
- `DiamondsAndVStacks:D5/localization-at-a-point`
- `DeformationAndDerivedPatchingAlgebra:P7/finite-perfect-hom-filtered-colimit`, `P7/p7ii-derived-extension`, `P7/p7ii-extension-preserves-perfect`
- Pinned `TauCeti.exists_isProPSylow`, `TauCeti.IsProPSylow.not_dvd_index`, `TauCeti.IsProPSylow.isProP`

If any of these supplier nodes is renamed or retired, the matching refinement must follow it.

## Still open

These are not blockers of this review:

- **Gaps.** G1–G11 as recorded in the packet.
- **Upstream copy.** Carry the refinements, the 21 requests and the two new lemmas into the accepted package and TauCetiRoadmap PR #922. The package still cites SchemeKTheoryOperations:S.1, R02.1, ProfiniteProPGroups Layers 2–3 and the bare E3 contracts.
- **Promotion.** Promotion does not apply `nodeRefinements`.
- **Generic matches.** 265 imported source entries have generic match sentences.
- **RS-05.** The RS-05 owner entry for ECD §18 still names D5 and needs the maintainer.
- **Tier order.** AdicCoefficientsAndComparisons (tier 10) cites DiamondEtaleCohomology C0/C2/C3/C6 upward. It does not restate them, so there is no duplication, but the upstream order or bundling needs the orchestrator.
