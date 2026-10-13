# BP-DeformationAndDerivedPatchingAlgebra — handoff

Worker: **Codex — codex-Hq4gV1**. Issue: **#9405**. Branch: **codex-Hq4gV1-9405**. Completed 13 October 2026.

## Result

The whole-roadmap pass is complete at target level under PROTOCOL §0. All nine stages are planned; none is claimed closed or implemented. The packet has 129 new nodes: 28 definitions, 12 constructions and 89 theorems, with 212 API contracts, 134 unit-test specifications and 35 selected planets. The existing reserved Hilbert–Samuel definition is imported from the accepted P7 packet; its own-word reader contract adds 10 outlined API entries and 14 acceptance tests to the document, without creating a second node.

The reader is 5,440 lines and includes hypotheses, source theorem/section/page locators, prerequisites, proof routes, Checks, API and tests, plus worked normalization, balance, codimension, derived-augmentation and six-variable component examples. Its source ledger routes all 181 incoming identities from 22 papers. Eighteen useful integrated decomposition IDs are preserved. The bibliography identifies 38 sources and their inspected versions; the source-issue record has 20 scoped findings. There are no copied source passages.

## Deliverables

- [Packet](../packets/DeformationAndDerivedPatchingAlgebra.json).
- [Reader](../readmes/DeformationAndDerivedPatchingAlgebra.md).
- [Suggested Lean](../suggested/DeformationAndDerivedPatchingAlgebra.lean).

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/DeformationAndDerivedPatchingAlgebra.json --index <verified-index> --json`: exit 0, zero errors and zero warnings. The temporary five-column index contains only the 17 exact declarations whose statements were read and whose names resolved in the pinned Lean audit. It is not a new declaration inventory. The permanent baseline ledger is in the packet and reader.
- `lean-check research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra.lean`: exit 0, only 14 `sorry` warnings. Seven real-bodied light definitions, 13 milestone statements and five examples, 184 lines; no heavy carrier construction and no placeholder data definition.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra.lean`: exit 0.
- Separate baseline Lean audit: all 17 exact baseline names resolved, exit 0. Source-issue/version checks pass as part of packet validation.

Pinned Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`; pinned Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`. The suggested file SHA-256 is `8f18555cc5d8140afe9c3f852419ea7a179e057dabdc55a8ee72d5b29412b935`.

## Ownership and current upstream

Current TauCetiRoadmap main was inspected read-only at commit `0d144d044dacebca17b654695b6f1ad58f159b27`, separately from the atlas snapshot; current Tau Ceti was inspected at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The nine newer roadmaps and relevant completed roadmaps were surveyed. AlgebraicVectorBundles already owns finite locally free bundles and L0C determinants: this packet imports that interface and plans only the finite-free-resolution trivialization adapter needed by SGA 2 XI 3.15. GrothendieckEulerForms supplies finite-support Euler theory. ModularCurves supplies the cited moduli regularity. No upstream source tree was edited or built.

**Reserved-key conflict resolved by reuse.** Issue #9405 asks for `DeformationAndDerivedPatchingAlgebra:key/hilbert-samuel-multiplicity`. The accepted `DeformationAndDerivedPatchingAlgebra--P7.json` already defines exactly that ID, including its intrinsic/ambient normalization and sample API. A duplicate in this new packet fails the checker. WORKERS requires existing plans to be imported, and the issue permits edits only to its four deliverables. Therefore the prerequisite graph cites the existing reserved ID and `existingContracts` records its own-word reader specification, with m-primary ideal hypotheses. No accepted legacy packet is edited. The maintainer may move authority into the whole-roadmap packet in a later authorized consolidation; such a move must remove the old definition in the same change. The optional scope clarification for that move had no reply, so no move was made. This pass does not claim that a new reserved definition was needed.

The two pre-existing R03.1 IDs for flat completion and adic Hom are likewise imported, with new names only for the additional comparison targets. The eighteen integrated decomposition IDs are retained. RS-08 separates affine ring duality in R03.3 from coherent geometric duality in SchemeAndStackFoundations SF.2. The elementary coefficient-dual interface moves down from CoherentCohomologyAndDualityII to P7: the higher roadmap must import it. No upward supplier reference is introduced.

## Coverage

| Stage | New nodes | Coverage | Remaining |
|---|---:|---|---|
| R03.1 | 15 | planned | Supplier contract: EnhancedDerivedSheaves:E1/enhanced-derived-category |
| R03.2 | 7 | planned | Complete obstruction-space relation bound; Supplier contract: DerivedDeRhamCohomology:DD.0/cotangent-complex |
| R03.3 | 49 | planned | Full mixed-characteristic multiplicity-one proof; Stable Ext injectivity used by Lescot’s criterion; Supplier contract: EnhancedDerivedSheaves:E1/enhanced-derived-category; Supplier contract: DerivedDeRhamCohomology:DD.1/koszul-complex; Supplier contract: DerivedDeRhamCohomology:DD.1/derived-completion; Supplier contract: SchemeAndStackFoundations:SF.0; Supplier contract: SchemeAndStackFoundations:SF.3; Supplier contract: SchemeAndStackFoundations:SF.4; Supplier contract: PadicMeasuresIwasawaAlgebras:L1; Supplier contract: PadicMeasuresIwasawaAlgebras:L6; Supplier contract: tauceti:TauCetiRoadmap/GrothendieckEulerForms#layer-5-finite-support-euler-characteristics-and-ext-euler-descent; Supplier contract: tauceti:TauCetiRoadmap/ModularCurves#4d-regularity-of-a-moduli-problem; Supplier contract: EnhancedDerivedSheaves:E1/derived-internal-hom |
| R03.4 | 8 | planned | Supplier contract: SchemeAndStackFoundations:SF.0 |
| R03.5 | 7 | planned | Pointed cotangent inverse-limit comparison; Supplier contract: EnhancedDerivedSheaves:E1/enhanced-derived-category; Supplier contract: PadicMeasuresIwasawaAlgebras:L1; Supplier contract: EnhancedDerivedSheaves:E1/presentability-and-derived-tensor |
| R03.6 | 13 | planned | Primary connectedness proof; Supplier contract: SchemeAndStackFoundations:SF.0; Supplier contract: SchemeAndStackFoundations:SF.3; Supplier contract: SchemeAndStackFoundations:SF.5 |
| P7 | 16 | planned | Supplier contract: EnhancedDerivedSheaves:E1/enhanced-derived-category; Supplier contract: EnhancedDerivedSheaves:E1/derived-presentability; Supplier contract: DerivedDeRhamCohomology:DD.1/derived-completion; Supplier contract: PadicMeasuresIwasawaAlgebras:L0; Supplier contract: SchemeAndStackFoundations:SF.2; Supplier contract: EnhancedDerivedSheaves:E1/derived-internal-hom; Supplier contract: EnhancedDerivedSheaves:E1/presentability-and-derived-tensor |
| P8 | 7 | planned | Whole-ring finite coefficient map in IKM24; Supplier contract: PadicMeasuresIwasawaAlgebras:L1; Supplier contract: EnhancedDerivedSheaves:E1/derived-internal-hom; Supplier contract: EnhancedDerivedSheaves:E1/presentability-and-derived-tensor |
| P9 | 7 | planned | Supplier contract: EnhancedDerivedSheaves:E1/enhanced-derived-category; Supplier contract: tauceti:TauCetiRoadmap/GrothendieckEulerForms#layer-5-finite-support-euler-characteristics-and-ext-euler-descent; Supplier contract: EnhancedDerivedSheaves:E1/derived-internal-hom; Supplier contract: EnhancedDerivedSheaves:E1/presentability-and-derived-tensor |

## Follow-up proof/source refinements

- **Full mixed-characteristic multiplicity-one proof.** The equicharacteristic proof of Nagata’s multiplicity-one criterion was read in Stone Theorem 16. The general formally unmixed mixed-characteristic case remains a proof-source refinement; no uncleared copy of Nagata’s book was used. Targets: `DeformationAndDerivedPatchingAlgebra:R03.3/multiplicity-one-regularity`.
- **Complete obstruction-space relation bound.** The abstract hull and complete obstruction setup is planned. A primary proof of the minimal relation bound using the complete obstruction space is still needed; arithmetic dual-Selmer identification belongs to the Galois consumer. Targets: `DeformationAndDerivedPatchingAlgebra:R03.2/presentation-relations-and-dual-selmer-bound`.
- **Stable Ext injectivity used by Lescot’s criterion.** AI13 Theorem 2.1 supplies the criterion and its proof reduces nonregularity to the stable-Ext injectivity theorem of Martsinkovsky cited there as [11, Theorem 6]. That primary proof was not read in this run; preserve this exact proof dependency. Targets: `DeformationAndDerivedPatchingAlgebra:R03.3/lescot-regularity-criterion`.
- **Primary connectedness proof.** Tho15 Proposition 1.8 supplies the quoted bound through Brodmann–Rung [BR86, Theorem 2.4], whose proof was not read. The capped connectedness convention also requires explicit comparison in the irreducible case. Targets: `DeformationAndDerivedPatchingAlgebra:R03.6/connectedness-after-relations`.
- **Pointed cotangent inverse-limit comparison.** BCGP25 Lemma 7.2.2 is used after finite open truncation. The target retains uniform finite cotangent generation and an explicit limit comparison as hypotheses; an arithmetic application must supply those inputs rather than inferring them from the module rank alone. Targets: `DeformationAndDerivedPatchingAlgebra:R03.5/uniform-cotangent-annihilator`.
- **Whole-ring finite coefficient map in IKM24.** The unconditional clause asserting R∞ finite over S∞ in IKM24 Theorem 10.6 is not certified here. The finite action image suffices for concentration and duality; whole-ring finiteness is a separate conditional R03.4 parameter-quotient target. Targets: `DeformationAndDerivedPatchingAlgebra:P8/patched-ring-action-and-common-coefficient-map`, `DeformationAndDerivedPatchingAlgebra:P8/patched-perfect-complexes-in-a-range-of-degrees`, `DeformationAndDerivedPatchingAlgebra:P8/patching-commutes-with-duality`.

## Supplier contracts

The packet records seventeen requests with exact interfaces and affected nodes. These end in lower-tier or current-upstream owners; none certifies a missing supplier implementation. Review the request contracts in the packet before packaging.

- `EnhancedDerivedSheaves:E1/enhanced-derived-category`: Enhanced derived categories of modules (the point-site case), K-injective and K-flat models, derived tensor/Hom with their natural coherence, truncations, filtered homotopy colimits, and the ordinary Mathlib derived-category comparison. No new abstract derived operation is defined here.
- `EnhancedDerivedSheaves:E1/derived-presentability`: The enhanced module-derived category is presentable and has countable homotopy colimits. Use its telescope splitting of idempotents; a split summand of a bounded object is bounded. Merely constructing Idem(C) does not show that C itself is idempotent complete.
- `DerivedDeRhamCohomology:DD.1/koszul-complex`: Koszul complexes of finite lists with tensor, dual, filtration, homology and regular-sequence acyclicity APIs. The finite-list carrier is imported; regular-sequence and parameter Euler comparisons are the local adapters planned here.
- `DerivedDeRhamCohomology:DD.1/derived-completion`: Derived adic completion as an enhanced functor, its localization/limit description and its Noetherian finite-cohomology comparison. This packet proves only the finite-perfect coefficient adapters.
- `SchemeAndStackFoundations:SF.0`: Affine/finite type schemes, components, localization and flat base change, with their Noetherian dimension and point APIs. For finite locally free sheaves use the current AlgebraicVectorBundles L0C carriers and determinant line; expose short-exact-sequence determinant comparison to the R03.3 adapter, without rebuilding these objects.
- `SchemeAndStackFoundations:SF.3`: Punctured-spectrum Picard theory and Grothendieck parafactoriality for local complete intersections of dimension at least four; reuse the current AlgebraicVectorBundles determinant theory.
- `SchemeAndStackFoundations:SF.4`: Generic geometric lci and syntomic definitions, local finite-presentation and flat base-change interfaces. Ring dualizing complexes are owned here in R03.3; geometric coherent duality is reserved to SchemeAndStackFoundations:SF.2, not this stage.
- `SchemeAndStackFoundations:SF.5`: Generic cycles of coherent modules, top-dimensional lengths, cycle additivity, flat pullback and Cartier-divisor specialization. R03.6 supplies only complete-local patching adapters and multiplicity comparisons.
- `PadicMeasuresIwasawaAlgebras:L0`: Completed direct sums/topological bases of complete flat coefficient modules, compact finite-quotient maps, and coefficient duals; algebraic arbitrary-module Matlis duality remains here.
- `PadicMeasuresIwasawaAlgebras:L1`: Completed group algebras O[[Z_p^q]], their finite quotient group algebras and augmentation maps. Ring-theoretic CI and patching are supplied here.
- `PadicMeasuresIwasawaAlgebras:L6`: Finite flat O-order dual Hom_O(A,O), its Artinian self-injectivity and Gorenstein equivalences. R03.3 identifies that existing dual with the canonical module without rebuilding finite-order duality.
- `tauceti:TauCetiRoadmap/GrothendieckEulerForms#layer-5-finite-support-euler-characteristics-and-ext-euler-descent`: Euler characteristics for bounded finite-length cohomology, additivity across distinguished triangles and descent to the existing Grothendieck group; R03.3/R03.6 add local multiplicity and derived-action formulas.
- `tauceti:TauCetiRoadmap/ModularCurves#4d-regularity-of-a-moduli-problem`: Existing regular-local completion/dimension comparisons, excellent regular-locus openness and finite-map miracle-flatness/descent. General finite modules and flat local maps are extensions in R03.3, not new copies of these targets.
- `DerivedDeRhamCohomology:DD.0/cotangent-complex`: Full cotangent complex, derivation interpretation and transitivity for square-zero extensions, providing the obstruction-theory interface; the naive H1Cotangent carrier is insufficient.
- `SchemeAndStackFoundations:SF.2`: For quasi-compact quasi-separated Noetherian schemes, D_qc filtered colimits, finite perfect approximation and global sections commuting with uniformly bounded-below filtered colimits. The affine pseudo-coherent Hom theorem is the P7 adapter.
- `EnhancedDerivedSheaves:E1/derived-internal-hom`: Enhanced module-derived RHom and K-injective models, with tensor–Hom adjunction and functorial base-change comparison maps; no strict chain action is inferred from a map to a derived endomorphism ring.
- `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`: K-flat derived tensor and coherent scalar extension for modules, its cohomological truncation spectral sequence, and comparison with ordinary tensor for bounded projective models.

## Source discipline and review focus

Cleared library PDFs were read in place only. Their metadata and hashes are retained; no files or passages were copied. Public versions are identified by URL, edition, inspected page range and hash in the packet. The source-issue search is bounded and scoped to the actual version read. In particular, the Calegari–Geraghty 2022 correction metadata was accessible but the subscription body was not read here: correction-item evidence from earlier independent reviews is explicitly inherited. The 2024 Böckle–Iyengar–Paškūnas corrigendum was read and concerns affiliation only. No unseen publisher version is treated as checked.

Review should check the distinction between cohomology and Tor amplitude; nonzero hypotheses in depth/codimension bounds; commutative finite derived actions and isolated idempotent blocks; fixed ultrafilter/coefficient map in duality; full maximal-adic open quotients when weight variables remain; and the finite action-image replacement for the uncertified whole-ring finiteness claim in IKM24. The twenty findings are in own words in the reader and packet, with inherited confirmation distinguished from this job’s upcoming independent review.

## Resume

No continuation is needed for the target-level planning pass. The next action is an independent blueprint review of these four deliverables; it must be by another agent. After acceptance, the six refinements and seventeen supplier contracts guide the follow-up jobs and dependency closure. Packaging must preserve the short native-carrier suggested-file shape and the current upstream imports. The worker stops after opening and checking this one pull request. All information needed to resume is in these deliverables; temporary scripts, downloads and logs can be deleted.
