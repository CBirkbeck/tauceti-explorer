# Independent review checkpoint: commutative algebra and derived patching, P7

Reviewer: Codex — codex-6GrZZA. Job `REV-DeformationAndDerivedPatchingAlgebra--P7`, issue #142. Date: 5 October 2026.

**Partial review; no acceptance or needs-changes verdict.** The packet remains a complete *planning pass*, with unfinished mathematical stages. This checkpoint records independently inspected evidence and clear corrections. It does not certify every node. The packet has no final top-level `review`; `reviewCheckpoint.status` is `partial`, so intake must release the review for continuation.

## Inventory and coverage

The checker reports 478 nodes: 11 definitions, 66 constructions, 385 lemmas and 16 theorems. There are 359 API entries, 295 definition/construction test entries, 13 planets, 460 baseline citations, 15 gaps and two requests. Counting tests on all node kinds gives 389 entries, with 374 distinct names; the API has 349 distinct names. These counts describe the packet, not the amount independently verified.

| Stage | Packet coverage |
| --- | --- |
| P7 | partial |
| P8 | not_read |
| P9 | not_read |
| R03.1 | not_read |
| R03.2 | not_read |
| R03.3 | partial |
| R03.4 | partial |
| R03.5 | not_read |

No stage is relabelled. The protocol permits this planning-pass boundary; the review must not reject the packet merely because these stages are open. The remaining work is to establish whether its existing statements, prerequisites, tests and source matches are correct at that boundary.

## Baseline evidence

Mathlib was inspected at `082e2d37e8b0463410cdb532e111cd43d5a66174`. An isolated diagnostic imported the 146 distinct cited Mathlib modules and checked all 449 Mathlib names. It exited successfully with zero errors and zero warnings. A textual declaration screen also found each declaration's leaf name in its cited source module. All 13 recorded `sourceSha256` values agree with those files. These are presence and provenance checks: they do not establish all 449 consumer matches.

The 22 Mathlib references directly used by the five opening R03.4 nodes were additionally inspected as statements, including section parameters. Their names are enumerated in `reviewCheckpoint.sourceFitInspected`. In particular:

- The DVR quotient-length theorem uses module length and covers exponent zero; it does not count elements of a finite residue field.
- `IsAlgClosed.lift` requires torsion-free coefficient actions and algebraicity. Its actual body composes an embedding through fraction fields. The packet correctly applies it to the prime quotient with injective coefficient map, rather than inferring that any map from a domain is injective.
- Integral-closure finiteness carries a finite *separable* fraction-field extension, scalar towers, Noetherianity and integral closedness. The packet retains characteristic zero in its algebraic assembly.
- `RingHom.IsIntegral.isLocalHom` requires an injective map. The packet applies it after passing to the prime quotient, then composes with the local quotient map.

All 11 Tau Ceti citations were read in their three modules at `f790474821cf4256814db967cb154e7af3d0c369`, using the existing Git objects. The two linear-Hom declarations retain the actual signed cochain differential and give the additive comparison. The four direct-sum declarations require the stated component compatibility, injectivity or projection-range hypotheses. The five graded-quotient declarations use the native images of homogeneous pieces and require homogeneity for the internal grading. The packet's consumer statements were screened, but their entire prerequisite chains have not been audited. These source reads must not be converted into 11 finished consumer verdicts.

## Source and mathematical inspection

The public Khare–Wintenberger author PDF, *Serre's modularity conjecture (II)*, was read at Corollary 4.7 and its proof, printed pages 45–46. Both pages were also rendered locally and inspected after the web screenshot requests failed. The source uses non-nilpotence of the coefficient prime to select a generic prime quotient and then a finite coefficient-field extension. The five opening R03.4 nodes give an algebraic refinement of this argument. Their separation of algebraic integral points from local-field topology, fixed residue data and framed lifting is appropriate. Those additional interfaces remain requests and gaps; the reader should not infer that they follow from the five signatures.

Stacks tags [00NI](https://stacks.math.columbia.edu/tag/00NI), [0ECF](https://stacks.math.columbia.edu/tag/0ECF) and [00NQ](https://stacks.math.columbia.edu/tag/00NQ) were inspected for catenarity, its local dimension-function characterization and the regular-local regular-sequence assertion. The existing regular-local-domain gap remains. The source confirms the regular-sequence statement; that is not a verification of every step of the packet's alternate induction proof.

The cumulative convention in [00K4](https://stacks.math.columbia.edu/tag/00K4) uses the quotient by the power with exponent one above the natural index. Its zero-polynomial/support-bottom distinction was inspected alongside the packet's general multiplicity definition. The reserved multiplicity node occurs once and is general in finite modules and ideals of definition. Completion, associativity, the parameter-ideal criterion, the Nagata comparison and the plane-curve sample API still require their full review, including agreement with the maintained key-definition entry. The separate coherent-duality ownership audit is unfinished.

The immutable formal-curve handoff at commit `eb645dc85df65608c56fafc4d9ed0e71ab0ca3ce` was read through its finite-jet and tangent-cone argument. This reading is a lead for the 108 nodes citing it; those 108 nodes do not yet have independent source/closure verdicts.

## Confirmed source issue

`DeformationAndDerivedPatchingAlgebra/E3` is confirmed against [Remark 43.15.6](https://stacks.math.columbia.edu/tag/0AZU) and Definition 10.59.1. Over the rational field, with zero ideal and zero module, the quotient has length zero, whereas the ideal plus the module annihilator is the whole ring, not an ideal of definition. The stated equivalence needs the boundary excluded as the packet explains. The novelty search was not repeated, and this checkpoint does not claim a newly discovered published error. Fresh source-version URLs, dates and hashes accompany the scoped verdict.

The current summary and coverage mistakenly referred to E1. They now refer to the actual retained issue E3. The reader and earlier planning handoff retain the stale label; they are outside #142's edit allowlist and need an authorized document correction.

## Corrections in this checkpoint

1. Normalized 13 baseline `module` values from import notation to their existing repository-relative `sourceFile` paths. No citation was removed or replaced; the exact names still resolve.
2. Changed three catenary test kinds from the unsupported value `example` to `characterisation`. Added the four packet test names beside their existing anonymous examples; their propositions are unchanged.
3. Added the missing suggested signature for the existing `regular-local-cohen-macaulay` node and recorded its declaration name. It concerns a list generating the maximal ideal whose length equals ring dimension, and asserts regularity of that list. No node was added, and the domain gap was preserved.
4. Corrected the suggested file's conflicting claims that no Tau module was imported and that a historical receipt covered the complete current file. Its opening note now identifies the definitive roadmap and the current compiler boundary.
5. Added the scoped E3 review, fresh source-version records and partial review metadata. Corrected the two current E1 cross-references described above.

## Lean checks and continuation gate

The complete suggested file was attempted with `lean-check`. It stopped at the unavailable compiled object for `TauCeti.RingTheory.GradedAlgebra.Homogeneous.Quotient`. The source exists at the pin, but the shared Tau build is at `cf386627e9176a3827c1a5fe804989fd94a4d216`; it is not an exact Tau-pin compilation receipt. No library was built or updated.

An isolated 1,123-line Mathlib-only prefix, ending before the positivity-continuation comment and removing only the two Tau imports, elaborated after the signature correction: zero errors and 113 admitted-proof warnings. No Tau declaration was replaced. This checks the prefix's signatures and examples only. It does not establish their admitted mathematics or the rest of the suggested file.

`python3 scripts/check_blueprint.py research/blueprint/packets/DeformationAndDerivedPatchingAlgebra--P7.json` reports zero errors and zero warnings. All 478 implementation statuses remain `unchecked`.

Resume using the handoff for this review job. Finish the node-by-node source and dependency audit, the remaining baseline statement/use matches, API/test correspondence, cross-roadmap ownership, planets and key-definition sample API. Only then add the protocol's final `review` object. This checkpoint supplies no promotion authorization.
