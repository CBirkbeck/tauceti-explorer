# REV-FIX-RT-AREA-algebraicgeometry~2 — blocked checkpoint

Codex, session `codex-2UUiVM`, 10 October 2026. Issue [#5702](https://github.com/CBirkbeck/tauceti-explorer/issues/5702). This follows checkpoints #8057 and #8118. One job was claimed and no second job was taken.

## Resolve scope before continuing

The issue's deliverables and full instructions name five packet/suggested-file pairs: MotivesAndAlgebraicCycles, AlgebraicModuliForArithmeticGeometry--A0-extension, SchemeAndStackFoundations, AnabelianGeometryAndNonabelianChabauty and NeronModelsAndSemistableAbelianVarieties. WORKERS.md says “Edit only the files the issue names, plus your own scratch space.” I requested authorization for all eleven queue-listed pairs; no authorization has arrived.

The queue's extra six pairs are PELModuli, ShimuraCompactifications--C0, ShimuraVarieties--V0, AdicCoefficientsAndComparisons, GrossZagierAndArithmeticHeights--GZ.0 and ShimuraData. Its generated prompt is absent. `issues.deliverables_complete` requires this job's review marker in every queue-listed packet; completion remains false. Update both the issue's deliverables and full instructions to authorize all eleven, or reconcile the queue to the intended five-pair scope. Repeating the five accepted dispositions will not resolve this block.

## Changes and validation completed

The five authorized area-fix dispositions were independently rechecked. Prior reviews are preserved in history; inherited full-plan gaps remain. The Néron suggested count description now includes positive indices, matching the packet. Its packet and suggested cyclic-group formula also require positive index for I_n. Three Tate source-match records now identify the supporting geometric rows and preserve resolution/actual-model/completion proof gaps.

All five packets pass the pinned checker with zero errors/warnings. All five suggested files elaborate through sequential lean-check with only sorry warnings. The Néron edits affect comments/descriptions, and its packet checker passed again afterward. The six extra packets pass their checker read-only and retain their preceding reviewers. ShimuraData was freshly compiled read-only and fails. No background process or scratch file is needed to resume.

The report gives every high/medium disposition, selected pinned and current upstream interface checks, and public source locators/hashes. No source excerpt, restricted book, atlas edge, new mathematical node or supplier implementation was added.

## Six-pair continuation if authorized

AdicCoefficientsAndComparisons's rescope proposal and G-owners gap still imply that removing SF.4→SF.5 suffices to permit MC.4→SF.4. Correct both to match the SchemeAndStackFoundations gap/proposal/finding record. After removing that edge and the five Néron/StableReduction forwarding edges, this path remains:

```text
SF.4 → DerivedDeRhamCohomology:DD.5 → PerfectoidQuotients:Q3 → Q4
 → AdicEtaleGeometry:A3 → RelativeFarguesFontaine:RF0:integral-Y
 → VectorBundlesAndIsocrystals:VB0 → AbelianSchemesAndArithmeticModuli:A4
 → PELModuli:M2 → M6 → StableReductionPartII:MC.4
```

Keep SF.4 as the schematic alteration owner. MC.4 needs the pointed cover for every genus and n≥3 in de Jong §2.24, beyond its current unpointed range. Attach the cover request to alteration nodes and split/reroute formal/cohomological consumers before approving a whole-stage import. RD.5's L5 request needs retargeting by its own job. The Adic reader is outside even the queue's deliverables.

Reproduce the graph with scripts.build.assemble(require_distances=False), stage requires and research roadmap definitions. Remove SF.4→SF.5 and R11.1/R11.3/StableReduction7/8/9→SF.5. Together, SF.3/R09.1→SF.5, SF.4→L5/RD.5, MC.2→SF.4 and R11.1/R11.3/R11.4/Jacobian-D→StableReduction7 remain acyclic. MC.4→SF.4 creates a cycle. These are tested proposals, not installed edges; broader unreviewed packet dependencies still require node-level analysis.

ShimuraData's fresh pinned Lean check exits 1, with 66 error locations including the error-limit diagnostic and three non-sorry warnings. Start with native Hodge.Conjugation being applied as a function at lines 186/210/218, the gradedRealHodge carrier mismatch at line 285, and the GL parser collision at line 363. Warnings concern SRep universes at line 176 and class-valued representationOfHodge/Supplier.realHodgeComodule at lines 261/440. Preserve actual Hodge/comodule carriers when repairing. A completed review may record needs_changes with precise defects; never hide them with placeholders. The other five extra suggested files compiled in #8118, not freshly in this run.

Read-only consumer evidence retains C0's nilpotent-preserving carrier requests in PEL/compactifications/varieties; Hodge L0/L1 requests in ShimuraData and L2 in compactifications; StableReduction 1/4/5/7 requests in GZ.2; and the arbitrary-ring finite-fan toric owner in C0. PR279 remains open/unmerged on 10 October with head `581f66fed0f12fe49b8f5dd96aa18d3e435c190a`. These checks are not full independent blueprint acceptance verdicts. Several additional packets have negative full-plan reviews; preserve their objections when judging the area fixes.

Continue carrying geometric Hodge and arbitrary-pair/constant-coefficient/relative analytic comparisons, the Tate-pair homology computation, Motives reader reconciliation, Néron Kodaira-resolution proof and excellent-DVR criterion hypotheses. Import current upstream RG2.0a and AlgebraicVectorBundles interfaces rather than re-planning them. Never run Lake in the read-only upstream checkout.
