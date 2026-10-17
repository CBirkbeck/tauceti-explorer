# Handoff: independent review of PrismaticCohomologyPartII

Job #3593; Codex session `codex-9W82Rn`; 2026-10-17.

## Done

This is a completed independent review, with verdict **needs_changes**, rather than an unfinished review checkpoint. The original design was by another worker. Read all 82 original nodes, their source locators and supplier statements, and all 19 original baseline declarations at the prescribed pins. The only explicitly unread source is Lau08's unrestricted theorem and proof. The public source URLs, reading record and version hashes are in the packet and reader. No source passages were reproduced.

Corrected the mathematical conventions, API and tests in place; removed the parent-owned coefficient-comparison duplicate; added the lower-owned Hodge–Tate sequence and general-base formal p-divisible-group definition. The final packet has 83 nodes, 116 API entries, 67 tests, 27 planets, eight planned layers and fifteen explicit gaps. Every retained or added node has a review entry: 51 corrected, 29 verified, two added, one unverifiable. The report gives the changed-field ledger and five independently checked source issues.

The reader is rendered from the corrected packet and includes every target, hypothesis, proof route, API, test, locator and gap. The 122-line suggested Lean file now contains only light definitions over existing carriers, two projective-lifting milestones and two examples. It elaborated at Mathlib 082e2d3, exit 0, with four warnings, all for admitted proofs. The packet checker reports zero errors and zero warnings. No assertion of mathematical closure or formalization is made.

## What remains and where to resume

Start with `research/blueprint/reviews/REV-DESIGN-PrismaticCohomologyPartII.md`, then the packet's `review.checked`, `gaps`, `requests` and `sourceIssues`.

The acceptance blocker is `PD.7/zink-lau-classification`: obtain a public or cleared copy of Lau08, read its unrestricted proof, and establish the deformation-level identification of its dualized BT construction with the particular prismatic display functor Z_R. The 2025 Anschütz–Le Bras erratum preserves the classification but withdraws the printed prismatic nilpotence argument. Perfect-field agreement and Hodge filtrations alone do not prove this identification. The theorem itself is not being rejected.

The other fourteen gaps have exact consumers in the packet: rigid/period-image inputs; isotriviality and Oort; higher-dimensional Breuil–Kisin comparison; relative ringed sites and derived internal Ext; compatible infinite-root covers and inverse limits; Witt-vector v-descent; the p=2 abelian lift; mixed-characteristic crystalline coefficients; characteristic-p connection; full BT-stack presentation; integral perfectoid v-site; nonnoetherian formal effectivity; and Hodge–Tate exactness beyond the dlog construction. These are recorded obligations, not supplied proofs. A later revision should retain the corrected statements and resolve each through an exact allowed supplier or an explicit proof plan.

## Ownership moves and upstream notes

- Parent `PrismaticCohomology:PR.7/quasisyntomic-crystal-comparison` owns the coefficient/crystal equivalence. The removed `PD.1/opris-vector-bundles` must not be recreated.
- `PrismaticCohomologyPartII:PD.3/p-divisible-hodge-tate-sequence` now owns the map and sequence needed in tier 13. Later `HodgeTateAndCanonicalSubgroups` T0/T2 should import this node; their files were not changed.
- General Witt frames, all-window displays and the general-base formal carrier are owned here. Later `PELModuli` M2 should import them rather than supply an upward/cross-bundle prerequisite.
- Removed the out-of-order GeometricSatakeAndFusion citation for Witt-vector v-descent; that result remains an explicit obligation here.
- Import only AInf's BKF carrier/linear algebra; its admissible-prismatic dictionary would be circular. The packet's upstream notes also flag the parent ringed-morphism wording and the narrower R07 hypotheses.
- Current upstream was checked at TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Reuse existing small-site internal Hom, pinned Mathlib module-sheaf pullback/adjunction, Witt algebra and principal-adic projective lifting within their actual hypotheses. Gap 5 asks for relative-site instances and derived compatibilities, not these generic constructions again.

No other roadmap files were edited. No scratch files are needed to resume: all substantive findings and source/version locators are in these deliverables.
