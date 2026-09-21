# Independent review: Spin-representation links

**Accepted with two added links.** Reviewer: `independent-review-REV-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_SpinRepresentations`, Codex — `codex-c83e7a`, 2026-09-21. Refs #134.

The author was ChatGPT Pro — `cgp-797896f1d145`, on [issue #67](https://github.com/CBirkbeck/tauceti-explorer/issues/67), submitted in [#529](https://github.com/CBirkbeck/tauceti-explorer/pull/529). The orchestrator subsequently marked the original screen complete. This reviewer did not write it.

The revised [packet](../links/tauceti_TauCetiRoadmap_RepresentationTheory_SpinRepresentations.json) contains **20 links: 18 incoming, two outgoing; six overlaps; 217 examined partners**. None of the original 18 links or six overlaps was removed. Both additions carry the required `addedBy` marker. Acceptance concerns these delimited roadmap contracts, not proof completion, availability of every library declaration, or authorization to rewrite an upstream roadmap.

## What was checked

Read the complete Spin README and all ten stage descriptions, all nineteen other original endpoint-stage descriptions, the full original packet and handoff, and the relevant conventions/acceptance passages supporting the overlap judgments. Checked all original 38 excerpts against the actual source documents and their line locators. After adding two links, all 42 excerpts and locators pass the same raw-substring check.

The independent completeness check searched stage titles/descriptions across 218 roadmaps and 2,007 stages, including the six new roadmap definitions. It specifically followed the inputs/outputs of Spin layers 0, 2, 3, 4, 7, 8 and 9. Candidate stages were read in full. The six new summaries were read and their stages searched; LV.3's Lagrangian/universal-cover match was read and rejected as a different period-map construction. Historical `provenance` and `coverage` remain the original author's record; `reviewSpotCheck` distinguishes this review's scope.

No Spin-owned stage record occurs in the current `data/library-coverage.json`. This link review makes no declaration-level availability claim and plans no new library construction. References below are roadmap contracts; the named baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Link judgments

Numbers 1–18 follow the original packet order; 19–20 are additions. Each row was checked for supply, use, direction, hypotheses and verbatim evidence.

| Links | Judgment |
| --- | --- |
| 1: QFI 1 → Spin 2 | Cartan–Dieudonné supplies reflection factorization for regular finite-dimensional forms with 2 invertible. Complex normalization of vectors remains Spin work. |
| 2: QFI 1 → Spin 4 | Witt decomposition/maximal-isotropic dimension is a valid partial input. It does not alone show that the complex anisotropic remainder has dimension at most one. |
| 3: GlobalQuadraticForms 1 → Spin 1 | Complex classification by rank supplies normal forms, without importing global arithmetic classification. |
| 4: Spin 0 → QFI 5 | Clifford dimension supplies finite-dimensionality only. General-field central simplicity and Brauer classes remain QFI. |
| 5: ClassicalGroups 0 → Spin 6 | Standard SL/Sp modules are the comparison representations. Clifford identifications and both group-image inclusions remain required. |
| 6: ClassicalGroups 1 → Spin 5 | Exterior powers supply the tensor-built fundamental modules. Half-spin does not thereby descend to SO. |
| 7–8: RootSystems 6 → Spin 5,8 | The integral B/D datum and numbering are supplied, with valid rank ranges. This does not supply the still-requested D4 order-three automorphism. |
| 9–11: HighestWeight 3,4,6 → Spin 5 | Borel/highest-weight vocabulary, Lie-module classification and formal characters have the correct direction. Concrete Cartan identification and group differentiation remain separate. |
| 12: HighestWeight 1 → Spin 9 | Root spaces supply the dimension decomposition. Rank identification and exact-division bookkeeping remain Spin obligations. |
| 13: HighestWeight 6 → Spin 9 | The generic single-weight/isotypic toolkit applies after the Clifford-specific highest-weight computation. Left multiplication is essential; the commutator action is different. |
| 14: HighestWeight 9 → Spin 9 | The reductive gl_n/Pieri interface retains its central weight, trace form and semisimple-central-action hypotheses. The CAR example is not used to prove the generic theorem. |
| 15: HighestWeight 8 → Spin 8 | Split octonion multiplication/norm supplies the triality-form object over C; invariance and module identifications remain Spin. |
| 16: ReductiveGroups 9 → Spin 8 | Pinned-group lifting applies after a pinning-compatible Clifford/Chevalley identification. Diagram symmetry alone is insufficient. |
| 17: UniversalCovers 0 → Spin 7 | Universal-cover construction/lifting supplies the comparison interface. Covering, local hypotheses, connectedness and simple connectedness of compact Spin still need proof, with the stated rank restrictions. |
| 18: Spin 2 → GN.2 | General-field spinor-norm exactness is relevant to spinor genera. Integral, local and adelic orbit theory remains GN.2. |
| 19: QFI 0 → Spin 2, added | Imports the multiplicative square-class quotient and its additive-carrier dictionary used as the general-field spinor-norm codomain. It does not import the spinor norm itself. |
| 20: GlobalQuadraticForms 1 → Spin 4, added | Makes complex normal-form reduction a direct input to the maximal-isotropic/Fock construction, alongside QFI 1. Spin 4 precedes the matrix-algebra theorem of Spin 1, so that aggregate theorem cannot supply this preliminary step. |

No new link is inferred merely from the phrases “Clifford”, “Spin”, “PBW” or “Bott”. Finite-group Clifford theory, Turaev's Spin-c structures, PBW for enveloping algebras, and topological K-theory periodicity are different contracts. SemisimpleAlgebras' Wedderburn/density results are not used backwards to prove the explicit Fock matrix-unit construction. A homological Serre spectral sequence does not supply the missing compact-Spin homotopy induction.

The spot check also found links already owned by other packets: RootSystems 5 → Spin 5; LieGroups 1 → Spin 3; LieGroups 3 → Spin 3. Their endpoint descriptions were read. They are not duplicated here. The LieGroups links correctly require smooth real carriers and a further complex-linearity comparison; they do not remove the existing unresolved group/Lie interface.

## Overlap judgments

All six recommendations remain justified within their stated scope:

1. **Keep** QFI's general-field Clifford/Brauer theory and Spin's explicit split Fock matrix models, with comparisons on their common specialization.
2. **Rescope the interface request** for classical/Spin branching. The first Lie-level B-to-D restriction does not supply both parity steps of group branching, subgroup embeddings or normalized GT bases.
3. **Separate generic tools from their application** in the HighestWeight/Spin CAR interface. Keep HighestWeight 9 → Spin 9; a reverse edge between the same coarse stages would be cyclic.
4. **Delimit integral and complex triality.** ReductiveGroups owns pinned lifting and integral carriers; Spin must prove the Clifford/Chevalley comparison and trilinear consequences.
5. **Keep** integral CFSG carriers separate from complex irreducibility. Scheme-level faithfulness in positive characteristic is not established by a complex dimension count or by one half-spin module.
6. **Coordinate the D4 combinatorial interface.** CFSG fixes `(0 2 3)` with central index 1, whereas Spin asks RootSystems for the symmetry. The shared request must preserve that numbering and include extension to the integral datum. Do not add the whole finite-field Steinberg stage as a prerequisite of complex triality.

These are interface proposals for orchestration; none changes an immutable Tau Ceti anchor in this submission. The weight-lattice ownership conflict, group/Lie comparison, integral specialization, complete spin branching and compact-topology proof gap remain explicitly unresolved. They do not invalidate the narrower outputs claimed by the accepted arrows.

## Validation and delivery

At main `0b4d12a9cea2a318f9b758bda9a9555ed61c021b`:

- `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_SpinRepresentations.json`: **0 errors, 0 warnings**, including cycle checks against atlas edges and all other link packets.
- `python3 research/blueprint/intake.py check-files research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_SpinRepresentations.json research/blueprint/reviews/REV-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_SpinRepresentations.md`: passed.
- Scratch checks confirmed all 42 raw quotes/locators, unique examined entries covering all 217 partners, original link/overlap preservation, and no duplicated arrow in the atlas or another packet. The remote tree inventory confirmed that all current link packets and new roadmap files were included.

No Lean file is requested or changed; Lean was not run. Only the packet and this report are submitted.

The issue's full instructions require in-place packet corrections and the review object, while the queue lists only this Markdown report. Please reconcile the intake file-ownership metadata and process/rerun intake as needed. The worker has not changed the queue or merged anything. Subsequent integration should preserve every qualified interface above and the packet's seven unresolved-interface records.
