# PKG-ModularityAndLanglandsExtensions~3 — blocked checkpoint

Issue: [#10226](https://github.com/CBirkbeck/tauceti-explorer/issues/10226). Worker: Codex, session `codex-fvRiwR`, 2026-10-17. Branch: `codex-fvRiwR-modularity-package`. The bot confirmed claim comment [6238498097](https://github.com/CBirkbeck/tauceti-explorer/issues/10226#issuecomment-6238498097).

**Incomplete: do not approve this package or forward it upstream.** This checkpoint repairs the small-prime modular-witness contract and supplies a primary cuspidality proof. It does not resolve all R1–R8 in the [independent round-2 report](../reviews/REV-PKG-ModularityAndLanglandsExtensions~2.md). That report and `review.json` remain unchanged. The accepted packet still has fourteen gaps, sixty-one requests, six planned stages and zero closed stages.

## Structural blocker and required next action

R1 persists at input commit `09227575a`. Independent filename searches in the blueprint roadmap, packet, package and reader directories, campaign documents, current upstream roadmaps, Completed roadmaps and current Tau Ceti library found no supplying files for:

- `SymmetricPowersByAnalyticContinuation`
- `SymmetricPowersByUnitaryLevelRaising`
- `SymmetricPowerAutomorphyLifting`
- `SymmetricPowersByTensorFunctorialityLifting`
- `PotentialAutomorphyDworkMotivesPartII`
- `OpenImageTheoremsForAbelianVarieties`

For a minimal reproducible example, the accepted packet's node `ModularityAndLanglandsExtensions:ML.3/eigenvariety-propagation` has `ownership.mode = "import-contract"`, `proposedOwner = "SymmetricPowersByAnalyticContinuation"`, export `TauCeti.SymmetricPower.automorphic_of_same_component`, and status `requested; no designed stage id is claimed`. Its proof plan explicitly assigns the construction to that supplier. Its empty prerequisite list is not proof closure. Replacing this import by a local method development would contradict that ownership instruction; inventing a layer id would disguise the absent plan.

The issue permits only the three existing package files and this handoff, and expressly forbids changing the packet. The maintainer must establish the supplying plans/exports and their upstream order, or authorize a corrected ownership plan. Another package-only revision cannot repair this ownership problem.

An existing coordination point is `DESIGN-ModularityAndLanglandsExtensionsPartII` in `queue.json`: priority 1, state `pending`, with four proposed design/packet/reader/suggested outputs. None of those outputs exists in this checkout. This entry does **not** establish any of the six owners above, and a Part II depending on ML cannot automatically become ML's own prerequisite. Resolve the split and dependency direction before scheduling another package revision. Preserve the downward moves to AutomorphicGaloisRepresentationsPartII and TorsionCohomologyInfrastructure in the order file. ML is tier 26; the new ordinary-witness import below is tier 20, and GL2ModularityLifting is tier 21.

`PotentialAutomorphyInfrastructurePartII` already exists and is not one of the six absences. Its placement, and those of MetaplecticAutomorphicForms and ExcursionOperatorsAndSpectralAction outside the 94-roadmap order, remain separate questions.

## Repairs made within scope

Only the package README and this handoff change. Suggested.lean, metadata, review.json, packet, reader document and all suppliers are untouched.

1. **R6, ordinary witness and Kisin hypotheses.** The R22.5 import now spells out strong residual modularity from Kisin (3.5.4): parallel weight two, residual agreement, no special local component above p, matching potential ordinarity, and the lift's potentially Barsotti–Tate type and cyclotomic-times-finite determinant. It identifies the kernel in the exceptional p=5 condition as the **projective** kernel.
2. **R6, use the available witness supplier.** Added the actual lower-tier import OrdinaryAutomorphicFormsAndModularityLifting R21.6, §§6.10–6.11. Its small-prime refinement matches BCGP Proposition 10.1.3's modular residual representation, unramified p, cyclotomic irreducibility and specified inertia extension. The p=5 representation is already GL₂(𝔽₅)-valued, meeting the revised BLGG exceptional-image hypothesis. Distinguished the revised author text from arXiv v1, which excludes the needed case. Retained the potentially crystalline weight-zero construction and local-component descent needed to exclude special witnesses; ordinary weight two alone would be insufficient.
3. **R6, consumer comparisons and Checks.** In §1.3 the ordinary subcase keeps its added inertia hypothesis, separately from the broader residual-modularity statement and Snowden's arbitrary lifting problems. Matched dualization, chosen ordinary quotient, determinant and potentially Barsotti–Tate component. For the surjective GL₂(𝔽₅) case, 2I has trivial projective image and determinant 4, so the projective kernel does not fix the cyclotomic field. The nonordinary residue-field restriction is vacuous for the selected everywhere-ordinary lift. Added Checks for full versus cyclotomic projective image, reversed dual filtration, nonordinary components and an ordinary special local representation. These are conditional consumer comparisons, not a new supplier development or a claim that every Snowden local type is modular.
4. **Primary cuspidality proof, §1.14.** Added Kim–Shahidi's separate Duke 2002 source, the normalized A₃/A₄ twists, character-self-twist criteria, octahedral ranks 2+3, exact proof locators and discriminating Checks. Kept the pole-detection, generic GSp₄ and analytic comparisons as required supplying mathematics. This does not certify Kim 2003's existence proof or Henniart 2009's all-place comparison.

No input target, API name, existing Check, hypothesis or distinct source locator was removed. A repeated identical BCGP citation in §1.3 was consolidated when adding the primary BLGG and Kisin locators.

## Primary sources read for these changes

All descriptions are in our own words; no source files or passages are committed. The following public texts can be fetched again without the disposable scratch directory.

| Source and reading | SHA-256 |
|---|---|
| [BCGP v3](https://arxiv.org/pdf/1812.09269v3), Proposition 10.1.3 and proof, pp. 265–267, especially nonsolvable p=5 and the distinction between residual modularity and its ordinary weight-two witness | `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed` |
| [Revised BLGG13 author text](https://www.ma.imperial.ac.uk/~tsg/Index_files/ordinaryHMFpostBLGGTversion.pdf), Theorem A, PDF p. 1; weight-zero convention and adequacy, p. 2; Theorem 2.1.2/proof pp. 3–4; Theorem 3.2.1/proof and exceptional descent check pp. 4–5 | `c6374b5ba7af1fda3b1840e6bb33715b58740501e3fe93679b7f06ea79f785e6` |
| [BLGG arXiv v1](https://arxiv.org/pdf/1205.4491v1), Theorem A p. 1 and §2 pp. 2–3: older exceptional-image exclusion; do not substitute this version | `cce437b227af8513133b44a7e3b5ee500c8a2a19ed7235a6adad4e4d1a69c8c0` |
| [Kisin, published text](https://annals.math.princeton.edu/wp-content/uploads/annals-v170-n3-p03-p.pdf), (3.5.4) and Theorem (3.5.5), pp. 1169–1172 including proof; definition/theorem pp. 1169–1170 also read visually because text extraction mangles symbols | `076f8bb6ec683633f7742d27504b97f5feaef2ddbae2bc5dc4325eb8386f4ee7` |
| [Pilloni–Stroh author text](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Artinfinal.pdf), §2.1 Lemmas 2.1.1–2.1.2 and Proposition 2.1.3 with proofs, pp. 9–10: PSL₂ hypothesis, solvable extension, ordinary elliptic witness and 3–5 argument | `8a730612cb2aff7d334187174d1e7688dbc118d8394f2d37681aaf597952735f` |
| [Kim–Shahidi, Cuspidality](https://www.math.purdue.edu/~shahidi/articles/Kim%20%26%20Shahidi%20%5B2002%2C%2021pp%5D---Cuspidality%20of%20symmetric%20powers%20with%20applications.pdf), §§1–3.3 pp. 177–186, especially Proposition 3.3.6, Theorem 3.3.7 and Proposition 3.3.8 with proofs, pp. 183–186 | `5bee9dac23e27b9ecf80abee102910675e9b8c668b6c054a467c8c5a94ff1fd0` |

Kim's AMS 2003 route refused access. The Henniart journal contents page was accessible but its full-text link led to institutional login, not the paper. Khare's author page only supplied the later KW papers. No completed primary-proof verification of these outstanding sources is claimed; no unauthorized book copy was used. The general exterior-square analytic theorem and corrected Khare 1997/1999, BHR Proposition 5.3.7, Henniart 2009, Kim 2003/2004 and all-place induction obligations of R8 remain.

## Remaining repairs

- **R1:** resolve the six real owners and upstream ordering as above before package closure.
- **R2:** coefficient-prime semistability and regular ordinary filtration of Dwork, with subquotient, lattice and global-semisimplification transport. Resume the report's §§2.3–2.5, 2.26, 2.29 and 2.32–2.33; the two Qian thesis remarks distinguish, rather than provide, the missing comparisons.
- **R3–R5:** retain the report's exact local-connects, potentially semistable and general-field lifting extensions; analytic/Harder/weight-one comparisons; archimedean Howe and GRS; full stabilization/intertwining, AJ carrier/character maps and FS stable categorical comparison. The real partial exports identified by the report remain available. TWFL and nongeneric hypotheses remain explicit.
- **R6:** the small-prime witness is now mapped with its local and exceptional conditions. Check the consumed potentially crystalline/non-special and component refinements when integrating R21.6/R22.5; the headline ordinary-lift theorem alone is not that export. Separately, the required regular pure Patrikis–Taylor constituent-system theorem over one common avoidance extension is still missing from PMCS's extremely regular BLGGT export. A reducible sum remains isobaric rather than cuspidal.
- **R7:** the reviewed two-Steinberg-place repair is unchanged and still conditional on simultaneous local prescriptions and strict ramified compatibility. Do not reopen the one-place argument or allege an error in FKP.
- **R8:** resume the outstanding primary proofs above; the new cuspidality proof only closes its own assertion.

## Library boundary and validation

Read the binding protocols and the two full current style models RepresentationTheory/ClassicalGroups and RepresentationTheory/CompactGroups, including their Suggested files. Read the library audit's relevant overlaps: weight-one/Deligne–Serre, rank-two base change and monomial/soluble Artin inputs. There is no audit layer keyed to this roadmap. These existing supplier boundaries are preserved.

Read-only current upstream commit: `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti commit: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Mathematical-object searches across the current roadmaps, Completed roadmaps and library found no eigencurve/eigenvariety/Dwork or specified symmetric-power automorphy exports. The polyhedral finite-group and representation-theory hits are not the automorphic comparisons added here. No current-library target was re-planned, no foundational carrier was introduced, and no Lake command ran in those checkouts.

- `lean-check research/blueprint/packages/ModularityAndLanglandsExtensions/Suggested.lean`: exit 0; 22 warnings, all `declaration uses sorry`; no error or other warning. One elaboration, 78 GB available beforehand. Suggested.lean remains 230 lines. Shared Mathlib pin `082e2d37e8b0463410cdb532e111cd43d5a66174`, configured Tau Ceti build pin `f790474821cf4256814db967cb154e7af3d0c369`.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/ModularityAndLanglandsExtensions/Suggested.lean`: exit 0.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ModularityAndLanglandsExtensions.json`: exit 0, zero errors/warnings, 142 nodes. Its successful structural check does not close the fourteen gaps.
- README inventory: 207 unique explicit anchors, 911 internal links, zero broken links; all prior anchors and 121 numbered target headings retained. All 151 names in the packet's `api` fields are present, and no API name from the input README was removed. There are 36 Checks blocks, up from 34.
- `python3 research/blueprint/intake.py check-files` on the two changed deliverables: two files, zero problems. `git diff --check`: clean.
- Direct finite computation: GL₂(𝔽₅) has 480 matrices, SL₂(𝔽₅) has 120, their projective images have 120 and 60 elements, and 2I is projectively trivial with determinant 4. This checks the finite witness, not the lifting theorem.
- Metadata remains `topic = "math.NT"`; `review.json` remains `needs_changes`.

## Submission handling

Submit as a **draft checkpoint**. `issues.py::deliverables_complete` has no package-specific incomplete-state branch: once the three pre-existing files and this handoff exist, it falls through to `True`. Therefore a normal ready PR could be misclassified as a completed package despite this explicit blocked status. `intake.py::auto_refusals` and its draft handling leave the draft for the maintainer. No pipeline files were changed. Maintainer intervention is needed to integrate this checkpoint while preserving the unfinished job and resolving ownership; merely making it ready does not repair the classifier or the mathematics.

This is the only job claimed by this session. The handoff contains the durable evidence; scratch sources and logs are disposable after opening the PR.
