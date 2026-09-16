# Handoff: semisimple-algebra links

Worker: **ChatGPT Pro — cgp-7cf7c77d34d7** (GPT-6 Astra Pro).
Job: `LINK-tauceti_TauCetiRoadmap_RepresentationTheory_SemisimpleAlgebras`.
Issue: https://github.com/CBirkbeck/tauceti-explorer/issues/66.
Claim: comment `5696708150`; workflow ownership confirmation `5696709650` explicitly names this session. Ownership and the unchanged issue instructions were rechecked before submission. No competing submission was found.

Status: **catalogue screen complete; submitted for independent review, not integrated or approved**. In `links-v1`, `complete` describes the screen, not the correctness or implementation of the input roadmaps. The five input clarifications below remain for the roadmap owners.

## Submission summary

Six outgoing links, no incoming links: the block/simple-module dictionary supplies CharacterTheory and QuiverRepresentations; tensor central simplicity, the Brauer group, finite separable splitting, and the linear Skolem–Noether automorphism corollary supply QuadraticFormInvariants. The CharacterTheory edge is a proposed indexing-reuse route, not a prerequisite for its direct use of Wedderburn existence. The Skolem–Noether edge requires the explicit coefficient-untwisting clarification below.

Three overlaps: rescope the shared finite-dimensional radical package with QuiverRepresentations; expose a semisimple image-bicommutant theorem before connecting SchurWeyl; keep the algebraic and cohomological real Brauer calculations with distinct owners, comparing their carriers and normalizations. No whole-roadmap merger is recommended. Do not import the entire algebraic Brauer roadmap into ClassFieldTheory, or create a back-edge from the comparison to its own Brauer-group supplier.

The screen covers all 212 atlas roadmaps, including all 60 upstream documents at summary/candidate-screen level, plus the newly submitted MordellLawrenceVenkatesh roadmap. A negative entry means no justified new link in this search, not proof of absence.

## Files and revisions

Only these two repository files are supplied:

- `research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_SemisimpleAlgebras.json`
- `research/blueprint/handoff/LINK-tauceti_TauCetiRoadmap_RepresentationTheory_SemisimpleAlgebras.md`

The original reading snapshot was `49f74b4d2bace99a76ceff4ac2199a3384c83c57`. The submission was refreshed and validated against `b82b494ac1b384423eacc1276c6716f15e186b6d`; the atlas and existing roadmap texts are byte-identical between these revisions. The updated browser instructions and protocol were read. The new status field, current validator, two other link packets and new roadmap were included in the final checks.

The full snapshots were obtained through the authorized GitHub Pages artifact-download action, because direct connector reads of the 14 MB atlas failed. No git command was run.

| Snapshot | Workflow run | Artifact | ZIP SHA-256 |
| --- | --- | --- | --- |
| Initial | 35090562755 | 10443549849 | `e30e6a9df1ec5d56b3ba218bb3b53e7acacf30dfce9de711c62e9af629c27b82` |
| Refreshed | 35092670298 | 10443974393 | `948e8c35e3db2354b3abec24525c55a8287f216094a393739b0865c152e52d5c` |

Both artifact hashes were checked after download. The atlas Git blob is `37f2add06983c206067d1104e0f40a839cc3961a`; its SHA-256 is `62ab6c2ccb94ee9c4d99813da02b69656941721d30fc29384e2b7e6e86361c56`. The final validator Git blob is `88135efe5a74ef82e088f3fa3189893e27a7867a`. The final protocol Git blob is `41099c03ea64d701d05b1277a83141ef9d4868db`.

Pins read from `research/blueprint/baseline.json`:

- Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.
- Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.

**No declaration-availability claim is made at either pin.** Library names inside quotations are evidence of what the roadmap says, not independently verified Lean declarations. No Lean implementation or formalisation result is supplied.

## Reading and evidence

The entire SemisimpleAlgebras and CharacterTheory documents were read. Every root-stage description, every link endpoint description, and every overlap endpoint description was read in full. All 212 atlas summaries and catalogue-wide searches over titles, stage descriptions and roadmap text were used for breadth; 103 atlas roadmaps had keyword hits. Their matching contexts were screened. The per-roadmap `examined` notes distinguish that screening from full stage reading.

Search families include semisimple, Wedderburn, Schur, isotypic, Jacobson, semiprimary, simple modules, minimal left ideals, primitive idempotents, central simple/division algebras, Skolem–Noether, density/bicommutants, Brauer, Azumaya, splitting fields, Morita, matrix blocks, Clifford and quaternion terminology. The fresh Lawrence–Venkatesh document and its LV.0, LV.1 and LV.4 descriptions were examined: semilinear centralizer bounds and Brauer–Nesbitt do not supply the root's central-simple-algebra results.

Primary documentary locators for the submitted pairs, all at the stated revisions:

| Document under `content/tau-ceti/` | Passages used | Git blob |
| --- | --- | --- |
| `RepresentationTheory/SemisimpleAlgebras/README.md` | Standing conventions; Layers 0, 1, 1.5, 2, 3, 4, 5, 6 | `b3c2cd79ce71390845b96e353ae3871ef1768aea` |
| `RepresentationTheory/CharacterTheory/README.md` | Layer 2 and its indexing-bridge paragraph | `d3ff27de283532af3a7fc4bd142a9f9e108b12f0` |
| `RepresentationTheory/QuiverRepresentations/README.md` | Layer 3, radical quotient and basic-algebra structure | `35743b00b30bfc550d6820cfd1da8533b191bfc8` |
| `QuadraticFormInvariants/README.md` | Layer 2 exclusions; Layer 5 dependency list; 7B construction and contracts | `2c864e6a950cf35ad944e0c7f583d68609ab018a` |
| `RepresentationTheory/SchurWeyl/README.md` | Layers 8 and 9, tensor centralizers and diagram algebras | `c9f1134c62149df359500b5f40e9aa40fd4e6926` |
| `ClassFieldTheory/README.md` | Layers 5, 6 and 10, cohomological Brauer carriers and real invariant | `279f7362ddec72bd3d5e0d55d037a82f46debf3d` |

There are twelve evidence quotations, two per link. Each is a literal substring of its exact stage description, not merely a match somewhere in the owner document. Stage identifiers are preserved. Sublayer 7B has its own atlas identifier and is used rather than the entire Layer 7. The indexing substep inside CharacterTheory Layer 2 has no separate stage record, so the parent stage is used with a narrowed reason.

The existing link packets for StandardDistributions and UniversalCovers were checked for duplicate endpoints and included in the graph validation. Neither conflicts with these proposed edges. No new edge is duplicated in the 3,508 atlas stage edges.

## Root-stage inputs and outputs

Layer 0 starts with the Jacobson/Artinian substrate and packages finite-dimensional radical nilpotence, the radical quotient and the radical-zero criterion. The optional left-right semiprimary cleanup is not a prerequisite for all later work.

Layer 1 starts with simple left modules and develops Schur and isotypic interfaces. Its first index concerns simple submodules of the regular module. Layer 1.5 proves that every simple module over a semisimple ring occurs as a minimal left ideal, connecting all simple-module classes to the block index and primitive idempotents.

Layer 2 combines Wedderburn existence with that dictionary to compare arbitrary chosen presentations with intrinsic division-ring and multiplicity invariants. The division ring attached to a simple left module is the opposite of its endomorphism ring. The finite-dimensional and split dimension formulas are separate specializations.

Layer 3 is density for a simple module finite over its commuting division ring; faithfulness supplies injectivity. It does not state the semisimple image-bicommutant result that Schur–Weyl needs.

Layer 4 concerns finite-dimensional central simple algebras over a field: matrix decomposition over a central division algebra, square dimension and degree, tensor central simplicity, and the tensor-with-opposite endomorphism description. Its proof order needs the scalar-extension lemma identified in G3.

Layer 5 supplies conjugacy for embeddings from a finite-dimensional central simple source into a finite-dimensional central simple target, and centralizer theorems for a central simple subalgebra. The matrix-algebra automorphism case is sufficient for the proposed 7B use, after the semilinear correction. No theorem about arbitrary noncentral separable subfield embeddings is inferred.

Layer 6 supplies the group law on Brauer classes, unique division representatives, scalar-extension homomorphisms, splitting fields, finite separable splitting and index. Its real example additionally needs the Hamilton/Frobenius inputs in G5.

## Input clarifications and owner requests

**G1 — acting-algebra linearity.** Layer 1 prints `End_k(S)` in the scalar Schur conclusion. The conclusion needs endomorphisms linear for the acting algebra, with the finite-dimensionality and algebraic-closure hypotheses retained. For example, the simple module k² over M₂(k) has k-linear endomorphism algebra M₂(k), not k.

**G2 — opposite-ring convention.** Reconcile the division ring appearing in the Layer 3 matrix formulation with the standing left-module/opposite-endomorphism convention and the intrinsic invariant in Layer 2. Do not silently identify a division ring with its opposite.

**G3 — scalar extension before degree.** The Layer 4 square-dimension argument needs preservation of central simplicity under field extension. This is explicitly an output in Layer 6. Expose the required lemma earlier, before invoking splitting over an algebraic closure. Acyclicity of the recorded atlas edges does not certify this prose-level order.

**G4 — semilinear descent.** QuadraticFormInvariants 7B says a sigma-semilinear automorphism of Mₙ(L) becomes inner. Inner automorphisms fix scalar matrices, so this is not literally correct. Let e_sigma be entrywise sigma. Apply Skolem–Noether to the L-linear automorphism tau_sigma composed with e_sigma inverse. Then tau_sigma = Int(g_sigma) composed with e_sigma, and the scalar defect is g_sigma sigma(g_tau) g_(sigma tau) inverse. This correction is necessary for the submitted Layer 5 edge; the larger noncentral-source version of Skolem–Noether is not needed here.

**G5 — real Brauer endpoint.** The root's real example asks for Hamilton centrality/division and the classification of real central division algebras. No exact independent supplier for the latter was identified in the search. Frobenius–Schur indicators are not that classification theorem. A cohomological alternative must compare the carriers and separate this example from the earlier Brauer infrastructure to avoid a cycle through 7B.

The two rescoping requests are concrete: retain one finite-dimensional radical convenience API rather than duplicate it in QuiverRepresentations; add a separately stated semisimple image-bicommutant theorem before claiming a SchurWeyl dependency. Quiver idempotent lifting and projective covers remain with QuiverRepresentations. Tensor-action image identification remains with SchurWeyl. Reduced norms, SK1, arithmetic reciprocity, scheme Brauer evaluation and geometric endomorphism semisimplicity are not supplied merely by sharing vocabulary with this roadmap.

These are recorded in the packet and handoff because their source files are outside this job's write permissions. They have not been silently repaired in someone else's roadmap.

## Validation

Executed in the refreshed snapshot:

```text
python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_SemisimpleAlgebras.json
status: complete
links: 6
overlaps: 3
examined: 213
0 error(s), 0 warning(s)
exit status: 0
```

Supplemental assertions passed: 213 unique known roadmap identifiers; twelve literal stage-description quotations; both evidence endpoints present; no duplicate link in the atlas or other packets; all overlap identifiers known; only the authorized deliverable paths; no private filesystem paths in the packet. The earlier validator also passed before the refresh.

These are structural, provenance and text-match checks, not proof of mathematical correctness. No independent review has been performed. The reviewer should check all six directions, the restricted CharacterTheory reuse route, the corrected semilinear use, the three ownership proposals, and the five input clarifications. The protocol's reviewer-independence requirement still applies. Integration and state transitions belong to the maintainer/orchestrator; this worker does not merge, approve, close, mark done or release a submitted claim.
