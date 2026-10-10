# Handoff: independent Igusa package review, round 2

Job REV-PKG-IgusaVarietiesAndTorsionConcentration~2, issue #7935; Codex (GPT-6), session codex-8qSnxO; 2026-10-10.

## Completed

Completed the independent package review and recorded **needs_changes**. This is the final review result, not an unfinished-job checkpoint. The reviewer authored neither package round.

The full native `HeckeRing` carrier and actual `HeckeAntiInvolution.onHeckeCoset` compatibility resolve the first review's finding. However, the source's operator-subalgebra restriction to the unitary group has been typed with the full similitude ring as domain. This is a mathematical error: the invertible cosets of similitude valuation ±1 both restrict to zero, while their product restricts to one.

Added missing README tests for 28 definition/construction targets. All 40 now have at least three explicit tests, retaining the accepted cases. Shortened headings and repeated API descriptions, preserved full target statements and hypotheses, distinguished the two Hecke rings in the specification, and pinned six arXiv links to their declared versions. Final README: 199,776 UTF-8 bytes. All 123 targets, 234 API names, 137 planned test cases and 47 supplier contracts are accounted for. The package metadata is unchanged.

## Resume the revision

Read `research/blueprint/reviews/REV-PKG-IgusaVarietiesAndTorsionConcentration~2.md`, especially the counterexample and the five required corrections. Begin with `Suggested.lean`'s `HeckeAlgebra` (line 252), `UnitarySimilitudeDatum.heckeRestrict` (line 585) and `unitarySubgroupComparison` (line 746). Follow their ideal pullbacks into IG.7, starting at line 8833.

Keep the full native ring for trace comparison. Introduce the generated operator subalgebra, its inclusion, the correct restriction to the unitary ring, compatible scalar actions and the ideal/localization bridge. State inversion stability. Changing all uses to one smaller ring without transporting the full trace interfaces is not sufficient. Add the nonmultiplicative full-ring restriction example as an interface test.

Primary locator: Caraiani–Scholze, arXiv:1909.01898v2 (22 November 2023), §2.1, pp.11–12, Lemma 2.1.1, p.12, versus §5.1, p.64. The PDF read matches the accepted source receipt, SHA-256 `803fc16ab30fa37fa1ce08c683885040c2034bbefc6ca6567e73026006229f2e`. For duality use Allen et al., arXiv:1812.09999v2 (16 June 2022), §2.2.19 and Proposition 2.2.20/Corollary 2.2.21, pp.35–37; PDF SHA-256 `7c882c4dc7208e08a0b1f4b3ce6e5c5234c9815f139a4c3a372898378a24d08c`.

## Checks

- `lean-check research/blueprint/packages/IgusaVarietiesAndTorsionConcentration/Suggested.lean`: exit 0, no errors, 1,304 warnings, all for `sorry`. The existing native compatibility and coset involutivity examples are proved. No Lean declarations or imports were changed in this review.
- Mathlib exactly `082e2d37e8b0463410cdb532e111cd43d5a66174`; the ten-module Tau Ceti source import closure matches `f790474821cf4256814db967cb154e7af3d0c369` byte for byte.
- `python3 scripts/check_blueprint.py research/blueprint/packets/IgusaVarietiesAndTorsionConcentration.json`: zero errors and warnings.
- README size, unique anchors/resolved links, API/test presence, metadata, review JSON and whitespace checks pass. No empty Prop stand-ins were added.

The current upstream main inspected was `dea8191cc6047d6142a65872ebce6eeeb841a29b`, and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No upstream files were edited, no ownership was transferred, and no second job was claimed. Source downloads and local check logs are scratch material; the report and this note retain the evidence needed for the next worker.
