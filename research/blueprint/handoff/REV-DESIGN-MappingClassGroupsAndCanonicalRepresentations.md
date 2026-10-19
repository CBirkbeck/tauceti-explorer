# Handoff: REV-DESIGN-MappingClassGroupsAndCanonicalRepresentations

Refs #3568. Claude (Opus 5.5), session claude-TIybcS, 19 October 2026. The claim (comment 6257225731) was confirmed by the bot. This is a complete review, not a checkpoint.

## Done

The design pass of DESIGN-MappingClassGroupsAndCanonicalRepresentations (Codex, codex-ERjKj9) was reviewed and **accepted after corrections**. The verdict is in the packet's `review` object. The full account is in [the review report](../reviews/REV-DESIGN-MappingClassGroupsAndCanonicalRepresentations.md). In brief:

- **Duplicates removed.** Three nodes duplicated accepted owners and were removed in their favour: HodgeStructuresPartII:H.5/versal-unitary-rigidity, InverseGaloisAndArithmeticFundamentalGroups:IG.1/arithmetic-representation and IG.5/versal-phi-cover-families.
- **Exact supplier nodes cited.** Stage citations fell from 99 to 43. The plan now cites the accepted nodes of HodgeStructuresPartII H.1/H.2/H.4/H.5, InverseGalois IG.1/IG.3/IG.5, AlgebraicModuli R09.7a, DiamondsAndVStacks D0 and LV.5.
- **Unowned routed items added.** Three routed items that no roadmap plans became nodes here: Teichmüller uniformization, the Aramayona–Souto multitwist theorem and Nielsen generation.
- **Statements corrected.** The killing lemma is now pointed, integral PVHS is read in the O_K sense, rigidity comes before integrality in the corrected order, and the Jordan citation rests on its recorded gap.
- **Checks, sources and API.** All placeholder acceptance checks were replaced and every source description rewritten. Seven API items were added.
- **Requests, gaps and source issues.** Requests and gaps were rebuilt. All eleven source issues are confirmed, cross-referenced to the P04 author erratum and to the extraction errata, and three new ones were added.
- **Other files.** Roadmap stage descriptions and `requires` lists were updated, and the reader regenerated from the corrected packet.

## Validation

- `python3 scripts/check_blueprint.py` on the packet, with `TAUCETI_BASELINE` set to the pinned declaration index: 0 errors, 0 warnings.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 0 problems.
- `lean-check` on the unchanged suggested file: exit 0, only the ten sorry warnings. `scripts/check_sorry_data.py` passes.
- Baseline declarations were read in the pinned Mathlib 082e2d3 and Tau Ceti f790474 trees.
- Sources were re-fetched; all hashes match.

## Open, for the orchestrator or later jobs

These are the six questions at the end of the report:

1. The owner of LL24 §3 (GlobalGaloisDeformations R04.1–R04.2 by route, or DeformationAndDerivedPatchingAlgebra R03.2 by request).
2. The future topology owner of the three nodes added here.
3. The H.5/versal-unitary-rigidity wording.
4. The `known` fields of extraction errata that the P04 erratum corrects.
5. The relative Ehresmann theorem in ComplexComparisonPartII's DifferentialGeometry request.
6. A stabilizer-refinement API item for IG.5/versal-phi-cover-families.

The Farb–Margalit *Primer* locators for Teichmüller's theorem are unverified, because the authors' host could not be reached. A later source job should read Chapters 10–12 there.

No scratch file is needed to resume.
