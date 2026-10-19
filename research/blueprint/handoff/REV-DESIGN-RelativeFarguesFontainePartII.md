# REV-DESIGN-RelativeFarguesFontainePartII — completed independent review

Worker: Codex, session `codex-0pVXh0`. Issue: [#5052](https://github.com/CBirkbeck/tauceti-explorer/issues/5052). Claim confirmed on 19 October 2026 at 10:48:06 UTC. Branch: `codex-0pVXh0-review-relative-fargues-fontaine-ii`. The design author was the independent session `codex-NqetLM` (#4971). This finishes the review; it is not a checkpoint. This process claims no second job.

## Result and deliverables

The packet is accepted as a complete target-level pass: 109 verdicts, 72 verified and 37 corrected, no added or unverifiable nodes. The review report records every changed node and every metadata change. The packet, reader and roadmap definition are synchronized. The suggested Lean file was read and successfully compiled without modification. Changed files are the packet, reader, roadmap definition, review report and this handoff.

The inventory is 69 theorem, 15 definition, 9 construction, 13 comparison and 3 application nodes; 97 API entries; 73 definition tests; 44 planets; 15 confirmed baseline declarations; and all 348 routed item ids. All twelve stages remain planned and all implementation statuses unchecked. The actual order is HF0–HF7, HF9–HF10, HF8, HF11.

## Resume from the accepted documents

No unfinished review task remains. Future mathematical work starts with the exact `gaps` and `requests` records in the packet and their matching reader sections:

- Seven gaps: G-MATRIX, G-GENERATORS, G-BOUNDARY, G-HOMOGENEITY, G-EQUALCHAR, G-COORDINATE and the new G-RADIUS. G-RADIUS supplies descent on arbitrary compact intervals, including irrational singleton radii and included irrational endpoints; a contained value-group exhaustion cannot establish it.
- Five open supplier extensions: R-TATE, R-CRYS, R-LT, R-KT and R-BC. R-TATE now includes filtered principal-unit estimates for normalized generators and quantitative arbitrary-radius control.
- Two provided interfaces: R-CONVEX from OptimalTransport Layer 5 and new R-ADIC from AdicSpaces Layer 6. They are excluded from transitive unresolved-input inventories. HF0 and HF3 therefore have empty `openInputs`; neither was promoted to closed.

Keep the interval site's finite compact-refinement condition and its new adjacent half-open non-cover test. Keep both the integral interpolation ideal gA and its B extension (FF17 Theorem 6.4.4, p. 254). The positive eigenspace comparison with the boundary quotient is algebraic: a Banach topology is transported, not inherited. Projectivity after G-GENERATORS follows by lifting the identity through exact sections of coherent Hom systems; do not assert that compact classical points cover all maximal ideals.

HF1 crystalline saturation now uses the pinned `WittVector.Isocrystal` with a separate finite-dimensionality hypothesis over arbitrary perfect k contained in O_F. The previous VB0 supplier fixed a narrower coefficient field. All 14 original baseline declarations remain confirmed; one existing Mathlib declaration was added, not a new isocrystal target. HF8 rank-one reconstruction imports the actual VB1 annular Frobenius-descent and VB2 geometric classification interfaces.

## Sources, pins and ownership

The authoritative locators, source fingerprints and access dates are in the packet and reader. Public sources only: Fargues–Fontaine's author PDF dated 16 April 2017, Kedlaya–Temkin v6 dated 29 March 2016, Berger's published Remark 1.1.3 (p. 96), and Schneider–Teitelbaum's public arXiv §3 (pp. 7–11). No restricted book was used. All text is in original words; no source file or passage is needed for handoff.

There are 51 confirmed author-copy source findings: 44 original, five additional inherited extraction findings (E28/E38/E39/E58/E195), and two review findings (E221 interval covers, E222 characteristic-p radicial tower). E55 is an omitted proof calculation, not a false theorem. The published Astérisque volume was not collated and no allegation about its text is made. Errata queries and the author's publications page yielded no located correction for the two review findings.

Pins checked directly: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current ownership checked read-only at TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the nine newer roadmap families absent from the atlas snapshot.

Current Tau Ceti already has the affine correspondence `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.finiteProjectiveEquiv`, and Q_p `TauCeti.FarguesFontaine.spaY`/`spaX`, open quotient and wandering windows for arbitrary perfect F. The quotient module leaves sheaf/chart identifications for further work. Import these objects; HF8 adds reconstruction from the schematic functions and norms. Generic convex, Fréchet–Stein, Proj, finite-group quotient, and geometric bundle theory stay with their existing owners. No supplier or upstream files were edited and no target was moved from a higher-tier roadmap.

## Validation

The packet checker with the pinned declaration index reports **0 errors, 0 warnings**. The unchanged 137-line suggested file elaborates via `lean-check` with exactly ten intended proof-placeholder warnings and no other warnings or errors. It states two available-carrier milestones and eight examples; no data are supplied by unproved placeholders. File-scope/JSON checks, target/API/test/routing/verdict consistency checks and `git diff --check` pass. No library build or language server was started, and no compiler remains running.

The review report and submitted files contain everything needed for later work. Scratch retrievals, scripts and compiler logs are disposable and are deleted after the pull request opens. No automatic or manual promotion is performed by this worker.
