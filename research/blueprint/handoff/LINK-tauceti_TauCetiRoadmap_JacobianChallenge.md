# Handoff: LINK-tauceti_TauCetiRoadmap_JacobianChallenge

Worker: ChatGPT Pro — cgp-0d677fbc2f21. Issue: #22. Date: 2026-09-16.

## Status

This is a **partial checkpoint**, not a completed catalogue survey and not an independent review. The accompanying links-v1 packet currently has twelve outgoing links with evidence on both sides. No implementation or baseline-declaration claim is made.

Input revision: `088ac3dcfb573a1e875fcea971ce54526bbe74d3`. The subject extract is `research/blueprint/atlas/roadmaps/tauceti_TauCetiRoadmap_JacobianChallenge.json`, blob `fe7c960b0da6ef2b6d1685806e3107e0266b0a44`; its six stage descriptions and the complete JacobianChallenge README were read. The extract has no recorded incident stage edges. Baseline pins read from baseline.json: Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.

Before this checkpoint, main was rechecked at `262dee344399d4123a712655f2be585d7e68720d`. Its single intervening commit changes visualization/classification files, not these input documents, atlas extracts, protocols, link packets or the two authorized output paths. The issue still carries this session's uncontested workflow confirmation (claim comment 5697549504; acceptance 5697551437).

## Source work recorded in the packet

The exact reading boundary for each partner is in `examined`. The verified links cover ModularCurves 0A/1C, AlgebraicCurves Layer 12, AbelianSchemesAndArithmeticModuli A6, SchemeAndStackFoundations SF.3 and AlgebraicModuliForArithmeticGeometry A0-extension. Every evidence item names its owning stage and a document locator.

Do not turn the independent function-field Riemann–Roch proof into a consumer of the scheme-cohomological proof: the actual consumer is AlgebraicCurves 12E's comparison contract, under its explicit smooth/proper/geometrically connected hypothesis. Do not infer arbitrary-base relative elliptic Picard results from a field-level curve Picard construction. Do not substitute the étale cohomology in SF.2 for coherent Serre duality.

All current links are conservatively labelled `inferred`: the exact supply/use is read, but both roadmaps do not explicitly name one another. This follows the stricter wording of PROTOCOL.md §10 rather than upgrading confidence merely because the consumer names its supplier.

## Precise continuation work

1. Finish the arithmetic-consumer pass already identified: GrossZagierAndArithmeticHeights GZ.2/GZ.3, ModularCurvesPartII R14.2/R14.6, NeronModelsAndSemistableAbelianVarieties R11.4, ArakelovGeometryAndAbelianHeights, WeilConjectures, DeligneWeightsAndPurity, WeightsInEtaleCohomology and EtaleDualityAndPerverseSheaves. Read the full stage descriptions and add only exact contracts, not transitive shortcuts.
2. Record field-versus-relative overlaps in the abelian-variety, square/cube and dual/Poincare APIs. A proposal must not reverse a dependency or change an owning roadmap in this job.
3. GZ.3 uses a rational degree-one Hodge class, whereas JacobianChallenge's pointed Abel–Jacobi construction assumes a rational point. Identify the required rationalized Albanese/normalization comparison rather than silently dropping the base-point hypothesis. GZ.3 does not yet receive an unconditional link from Layer F in this packet.
4. Finish catalogue-wide screening: all same-area roadmaps, summaries in neighbouring areas, every upstream Tau Ceti roadmap, and whole-text searches for the subject's inputs/outputs and synonyms. Six `examined` records are not catalogue completion. Preserve `status: partial` until this is finished.
5. Recheck newly submitted link packets and all recorded stage links for duplicates and cycles. The indexed matching packets found in the initial search contain screening-only mentions of this roadmap; this discovery search is not proof that unindexed concurrent submissions are absent.

## Validation

The local checkpoint was parsed successfully with Python's json module. The full local command `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_JacobianChallenge.json` has **not** been run: the local environment has no full atlas snapshot, and direct network download was unavailable. No reduced fixture is being passed off as the full validator.

The actual `scripts/check_links.py` and `.github/workflows/swarm-check.yml` were read at the input revision. The PR workflow invokes the link checker against the full repository and other link packets. Its concrete output must be inspected before reporting success; a workflow badge alone does not establish mathematical correctness or catalogue completeness. At this checkpoint PR validation remains pending.

## File ownership and integration

Only the authorized link packet and this handoff are changed. No git command, default-branch push, queue change, merge, approval, issue closure or done-label action has been performed. Independent review and integration belong to the maintainer/orchestrator. This checkpoint does not release the claim.
