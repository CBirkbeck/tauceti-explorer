# ASM-HodgeTateAndCanonicalSubgroups — handoff

Claude (Opus 5.5), session `claude-fAsYHI`, 14 October 2026. Refs #240; the bot confirmed the claim. This is the complete assembly, not a checkpoint. Nothing is claimed to be implemented.

## Starting point

The roadmap has three accepted packets: the T0–T5 part (`--T0`, accepted by REV-…--T0~2), the T6 part (`--T6`, accepted by REV-…--T6~2) and the whole-roadmap packet (`HodgeTateAndCanonicalSubgroups.json`, accepted by REV-HodgeTateAndCanonicalSubgroups on 14 October). The whole-roadmap job had already written a joined reader and suggested file at this job's paths, but it left the parts unchanged and defined the effective plan as overlays in its field `assembly`:
- replacement prerequisite lists for 52 imported targets;
- field corrections for 6 targets;
- one outgoing target, `T5/aip-hodge-tate-comparison`;
- withdrawn and narrowed requests.

Its reader reproduced the two part readers in their own formats, with "assembly notes" and a separate table of overrides. Both it and its review asked for the overlays to be materialized in the parts. Until that happens, the atlas merge (which concatenates nodes) keeps the retired T5 target and its O5 link.

## What this assembly did

**1. Part packets: the effective plan is materialized** (deliverables `--T0.json`, `--T6.json`). Each part records what changed in a new top-level field `assemblyMaterialization`.
- Prerequisites: every imported target's list is replaced by `assembly.importedPrerequisites`. That is 30 lists in T0–T5 and 22 in T6, and covers the cross-part references: the T6 requests to T1/T2 become exact T1/T2 node citations.
- The six `assembly.importedNodeCorrections` are applied field by field: T2/open-tower-hodge-tate-map, T2/hodge-tate-flag-point, T0/fargues-degree, T0/fargues-hodge-tate-cokernel, T5/modified-plus-sheaf and T0/semi-abelian-hasse-invariant.
- `T5/aip-hodge-tate-comparison` is removed from the T0–T5 part. No other packet cites it. Its planet is carried by `T5/aip-torsor-hodge-tate-comparison` in the whole-roadmap packet. T4/hodge-tate-coordinate's `uses` entry is repointed to that node.
- Requests and gaps are replaced by the whole-roadmap packet's effective entries for each part (field `fromPart`):
  - T0–T5: 18 → 15 requests. A3, O5 and O6 are withdrawn; the rest are narrowed to their remaining items. Gaps go 13 → 12: "Effective integral coefficient descent and finite-level AIP restrictions" served only the retired target.
  - T6: 12 → 10 requests (the T1/T2 self-requests are withdrawn); 11 gaps.
- Routing text in T0–T5:
  - The RT /22 and dependency-line restructure entries now say that the edge runs T2 → PerfectoidShimuraVarieties S0 (the tower moved down), not S0 → T2.
  - The three ownership decisions of the whole-roadmap packet (tower → T2, BHW Theorem 7.14 → O5, semi-abelian Verschiebung determinant → C4) are added to `owners`.
  - The routing ledger's O0 → T5 entry names the torsor comparison.
  - The open-tower gap names the T2 tower targets instead of S0.
- Notation in T6: the source id `BP` is renamed `BPC25` in nodes, source issues, restructure, owners and summary. `BP` and the T0–T5 part's `BPC25` have the same SHA-256, and `BP26` is a different Boxer–Pilloni paper, so a bare "BP" was ambiguous in one document. Review records keep their wording. `scripts/errata.py` still resolves the citation; I ran it and then restored its outputs.
- Upstream drift: TauCetiRoadmap now has a `ReductiveGroupsPartII` (local structure and arithmetic models). The T0–T5 part's proposed owner "ReductiveGroups, Part II" for filtered-Tannakian reconstruction is relabelled as a distinct proposed extension. The same is done in its owners and restructure entries and in gap 6. ReductiveGroupsPartII does not contain filtered fibre functors; I checked its README.

The union of the three packets is now exactly the accepted effective plan, with no overlay needed:
- 137 targets, 411 API items, 224 definition tests and 37 planets;
- 42 baseline declarations, 25 requests and 23 gaps;
- every effective prerequisite list and corrected field equals the overlay, the graph is acyclic, and every node prerequisite resolves (scratch check).

**Re-review needed.** I changed reviewed part packets, but every change of mathematical content applies what REV-HodgeTateAndCanonicalSubgroups accepted. The other edits are the rename, the routing wording and the ReductiveGroups label. Review verdicts are unchanged. The live atlas copies of the parts stay at their reviewed versions until a new accepted review. A short re-review of the two parts would let promotion drop the retired T5 target and its stale O5 link. It should confirm that the parts equal `assembly` applied to the reviewed bytes, plus the edits above.

**2. Reader** (`readmes/HodgeTateAndCanonicalSubgroups.md`, rewritten as one document, about 98,000 words). It opens with:
- purpose, scope, boundaries and the place in the upstream order, stated without process language;
- the general conventions, followed by the T0–T5 quantitative contracts and the logarithmic conventions (formerly Appendices A/B);
- one consolidated source list: 20 documents with SHA-256 and the sections read, plus the further versions consulted;
- the 42 pinned declarations and a single library-audit paragraph.

Every one of the 137 targets is then rendered in one uniform format from the materialized packets, with internal links. The T6 parts' grouping into sub-sections is kept. The back matter has the effective requests and gaps, all ownership decisions and restructure proposals, the red-team findings, the maintainer-source coverage table, the routing ledgers, and one source-issue ledger grouped by source.

What was removed:
- the "assembly note" paragraphs, the override table and Appendix C (the retired target);
- the empty "The accepted part summarises the layer as follows:" lines;
- the duplicated RT-AREA-padic-1/23 restructure entry: both parts record it, and the reader shows the T6 part's fuller one.

Checks: all 766 internal links resolve, and every packet node field appears in the reader.

**3. Suggested Lean file**: unchanged. It was already the joined file in the 2026-10-12 shape: one standard note, one import block, and the 708 effective planned names, all present in its index. The retired target's name is not among them. `lean-check` at Mathlib 082e2d37e8 / Tau Ceti f790474 exits 0, and its only warnings are the four `declaration uses sorry` warnings. `scripts/check_sorry_data.py` passes.

## Restructure proposals and requests, collected

Restructure proposals (all are in the reader, under "Ownership and proposed restructuring"):
- Whole-roadmap packet:
  - rescope: the tower moves down to T2, with edge T2 → PerfectoidShimuraVarieties S0;
  - rescope: BHW Theorem 7.14 → OverconvergentAutomorphicForms O5;
  - rescope: the semi-abelian Verschiebung determinant → ShimuraCompactifications C4;
  - split: sub-layer T2:tower.
- T0–T5 part:
  - rescope RT /22: T2 owns the open-tower map, S3 its perfectoid incarnation;
  - rescope RT /26: BT₁ Hasse theory and Lemma 6.3.4.1 → R07.2;
  - rescope RT /25: the Scholze–Weinstein classification goes to a proposed FiniteFlat stage after R07.2;
  - rescope RT /23: BCGP-25 Theorem 4.4.1 → TC.2 and HigherHida;
  - rescope: dependency lines;
  - split: T0:local / T0:boundary;
  - rescope: a filtered-Tannakian extension of ReductiveGroups.
- T6 part:
  - rescope RT /4: Theorem 4.4.40 → PerfectoidShimuraVarieties S6;
  - split RT /24: P8:primitive and T6:log-primitive;
  - rescope RT /23 (same as above);
  - split: PerfectoidSpaces Part II (Banach decompletion) and ArithmeticLocallySymmetricSpaces Part II (rigidity);
  - rescope: T6 dependency lines.

Requests (25), by supplier:
- From T0–T5:
  - FiniteFlatGroupsAndIntegralPadicHodgeTheory: R07.1, R07.2, R07.6;
  - AbelianSchemesAndArithmeticModuli: A2, A4;
  - PadicHodgeTheory P8;
  - ShimuraCompactifications: C4, C5;
  - HilbertModularVarietiesAndShimuraCurves: H2, H4;
  - PerfectoidSpaces P9;
  - NeronModelsAndSemistableAbelianVarieties R11.3;
  - AutomorphicBundles B1;
  - AlgebraicModuliForArithmeticGeometry R09.1;
  - AdicSpacesPartII R2.
- From T6:
  - AdicSpacesPartII: R0, R3;
  - CrystallineCohomology CR.5:log-algebra;
  - ClassicalAdicEtaleCohomology H0;
  - EnhancedDerivedSheaves: E1, E2;
  - PadicHodgeTheory: P8, P8:local-rational;
  - ArithmeticLocallySymmetricSpaces ALS.1;
  - ShimuraVarieties V8.general.

Each request is stated exactly, with its consumers, in the reader.

## For the maintainer and the next jobs

1. **Package.** With this assembly done, PKG-HodgeTateAndCanonicalSubgroups can be queued. The package worker can read the effective plan directly: it is the union of the three packets, or this reader. The `assembly` field of the whole-roadmap packet is now redundant with the parts, since applying it again changes nothing. Its `imports` SHA-256 pins and its `meaning` text describe the parts' bytes before this job. That packet was not a deliverable here, so it is unchanged.
2. **Whole-roadmap packet, at its next revision.**
   - In `maintainerSources`, two `plannedAt` ids read `HodgeTateAndCanonicalSubgroups:TorsionCohomologyInfrastructure:TC.2` (items BCGP-25 4.4.1-usual/-cusp). They should be `TorsionCohomologyInfrastructure:TC.2`. The reader shows the corrected id.
   - Its copy of the open-tower gap still says "S0's existing limit v-sheaf".
3. **Source-issue ids.** HodgeTateAndCanonicalSubgroups/E14–E26 exist in both parts with different content. I did not renumber them, because the errata register, the whole-roadmap packet's `inheritedSourceIssues` and the review provenance use them. The reader labels each finding with its source. Renumbering the T6 part's E14–E26 to E32–E44 is a clean follow-up if wanted.
4. **Still open from the whole-roadmap pass** (unchanged by this job):
   - PerfectoidShimuraVarieties: retire S0/p-level-tower, S0/tower-right-action and S0/infinite-level-diamond, and repoint them to the T2 ids.
   - OverconvergentAutomorphicForms O5/geometric-aip-comparison: import T5/aip-torsor-hodge-tate-comparison.
   - ShimuraCompactifications C6/hilbert-hasse-boundary-comparison and C6/hilbert-boundary-ordinary: cite C4 instead of T0.
   - Caraiani–Scholze items 52, 53, 143 have no owner inside the upstream order.
   - TC.2 and HigherHida have no node for BCGP-25 Theorem 4.4.1.
   - R07.2 has no node for PIL20 Lemma 6.3.4.1.
   - PerfectoidSpaces--P0 and ShimuraData D3 are cited while their reviews say `needs_changes`.
5. **ReductiveGroups.** The proposed filtered-Tannakian owner needs a name distinct from TauCetiRoadmap ReductiveGroupsPartII (see above).

## Checks run

- `python3 scripts/check_blueprint.py` on `--T0.json`, `--T6.json` and the whole-roadmap packet: 0 errors, 0 warnings each, with the pinned declaration index.
- Effective-union check (scratch script): 137 unique targets equal to the review's checked ids; overlays equal; prerequisites resolve; acyclic; counts 411/224/37.
- Reader: 766 internal links resolve; no local paths; generated from the packets plus hand-written front and back matter.
- `lean-check research/blueprint/suggested/HodgeTateAndCanonicalSubgroups.lean`: exit 0, four `sorry` warnings only. `scripts/check_sorry_data.py`: passes.
- `python3 scripts/errata.py` runs with the renamed source id. Its outputs were restored, since they are not deliverables.
- `python3 research/blueprint/intake.py check-files` on the deliverables: 0 problems.

No source was newly read for this job, and no restricted book was used.
