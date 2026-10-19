# DESIGN-HeckeStacksAndLocalShtukasPartII

Issue #3408. Worker: Codex, session codex-p6Tdfh. Complete target-level planning pass; ready for independent review. No independent review or implementation is claimed.

## Delivered

The four requested files define the new langlands roadmap, its HSD0–HSD8 target graph, reader and compact suggested file. The coherent direction is affine Deligne–Lusztig nonemptiness and dimensions, including Zhu’s spherical calculation and He’s cordial reduction. The packet contains 49 targets: 9 definitions, 8 constructions and 32 theorems; 86 API entries, 70 mathematical definition/construction tests, 25 planets and 5 verified pinned declaration citations. All 9 stages are planned; none is closed. There are 8 explicit scope/proof gaps and 13 supplier requests.

All twelve issue routes and all 262 routed items are retained in `routeCoverage` and the reader inventory. The 53 He21 and 16 Zhu17 dimension items have individual target/supplier mappings. The independent routes receive proposals for three owners: HeckeStacksAndLocalShtukasComponentsPartII (Kisin17, van Hoften24 and GLX26 component/rational-stratum items), HeckeStacksAndLocalShtukasIntegralPartII (five overlapping integral routes), and HeckeStacksAndLocalShtukasKottwitzPartII (HKW22 and Hansen26). These are proposals, not newly adopted suppliers. The extraction’s AffineDeligneLusztig candidate is an alias for this dimension roadmap.

## Existing ownership

The library audit, related packets and links were read before planning. Pinned declarations were read at TauCeti f790474821cf4256814db967cb154e7af3d0c369 and Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Searches also covered current TauCeti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 and current upstream roadmaps 0d144d044dacebca17b654695b6f1ad58f159b27, including the newer roadmap directions absent from the atlas snapshot.

Current ReductiveGroupsPartII already promises the normal form, η, translation lengths and cordiality of x t^λ. In particular, its README translation-length-formula, lines 5367–5384, includes cordiality although the older atlas node does not. This packet imports the exact node and records the newer promise in `upstreamNotes`; it owns the distinct generic Newton-class identification. A maintainer should reconcile that promise’s geometric dictionary without adding another cordial translation theorem.

BG0/BG1 owns B(G), κ, Newton points, split-rank defect and the ordered norm/centralizer identities. GS owns perfect flag/Grassmannian carriers and generic convolution. HS2’s generic local-shtuka diamonds do not supply classical or integral special-fibre geometry. Generic dominance subtraction, Demazure/Red-Min and cocenter algebra belong to proposed extensions of the root-data and smooth-representation directions, not to new carriers here. No definitions were moved out of an existing owner.

## Follow-up work

Independent review should start with the target graph, the exact source versions and the scope gates. Its mathematical follow-ups are:

- **G1:** Root-data supplier extension: normalized integral dominance subtraction, Demazure/support, parabolic normal forms, twisted extended-affine Red-Min and straight–finite-parabolic decomposition. For the basic seed also audit the twisted-Coxeter-to-basic minimal reduction cited as He–Yang, Theorem 1.1, in He14 Proposition 11.7.
- **G2:** Compatible bounded finite-type/perfect models, invariance under perfection/universal homeomorphisms, and generic-point fibre estimates. Do not assume global quasi-compactness or finitely many ADLV components.
- **G3:** Generic twisted affine-Hecke cocenter, basis, positivity, class polynomials and the nonzero twisted-Coxeter coefficient; SR.1’s current Hecke-algebra promise is narrower.
- **G4:** Teichmüller chart morphisms, unipotent/Lie and twisted Lang-map geometry, the perfect trace input, and geometric convolution fibre bounds. A point bijection does not supply dimension.
- **G5:** Extend the verified geometric sources to general σ, ramified/mixed-characteristic flag data and the full virtual upper bound; spherical perfect geometry alone is insufficient.
- **G6:** Generic superbasic definition, anisotropic-centralizer criterion, type-A restriction-of-scalars classification and GL lift. CKV’s proof still invokes Tits’s anisotropic-group classification.
- **G7:** Non-shrunken basic seed, corrected twisted cocenter induction, original-lattice/component descent and integral κ. An auxiliary γ may lie only in P∨; the reduced a t^γ is not asserted shrunken. Preserve the characteristic restriction in the GHN erratum.
- **G8:** Strong topological purity, Newton-poset length and the cell/ADLV dimension comparison used in MV20. Abstract B(G) classification/order does not supply those geometric facts.

The 13 precise requests identify current coordination stages in RootSystems, RG2.3, BG1, GS0:Witt-geometry/GS1/GS2:correspondences, SF.0/SF.1/SF.2 and SR.1. They explicitly distinguish an existing import from a requested scope extension. No request was posted as a separate issue and no supplier file was edited. The proposed component, integral and trace owners need separate design jobs if the maintainer adopts the split.

## Sources and corrections

The reader and packet give URLs, hashes, versions and exact reading sections for fourteen sources: He21, Zhu17, He14, He’s Hecke-algebra survey, Görtz–He, Milićević–Viehmann, GHN and its official erratum, GHKR, Viehmann’s superbasic calculation, Hamacher, CKV, Viehmann’s level-one truncations and He–Nie. Public primary texts were used; no book or restricted source was needed or copied. The remaining unverified sources/proofs are identified in G1/G3/G6/G7/G8: notably Tits, the full cocenter basis proof, He–Yang, the later He–Zhou–Zhu Proposition 3.4.2, and the purity/poset-length references of MV20.

Fourteen source findings are recorded in original wording with locators. Earlier extraction findings are credited, not claimed as new discoveries. These include nonemptiness and exact-stratum qualifications in Zhu, inverse Frobenius embedding indexing, He’s P-alcove conjugator, coroot/nonnegative-cone slips, bounded fibre-dimension and lattice proof gates, the non-shrunken seed citation, the He14 twisted induction slips, both official GHN corrections, Hamacher’s dropped fibre term and the direction of Zhu’s equivariance-forgetting arrow. No reviewer verdict was copied onto this packet’s findings.

## Validation

- `scripts/check_blueprint.py` with the pinned declaration index: **0 errors, 0 warnings**. All nine stages planned, all own prerequisite chains acyclic, every definition/construction with API, uses and at least three tests, and at most six planets per layer.
- `lean-check` on the suggested file: **compiled successfully**, only declaration-level `sorry` warnings. The file has 87 lines, two real-bodied elementary definitions, five theorem statements and five examples. No data definition has a placeholder body. Geometric statements remain reader targets because their carriers do not exist at the pins.
- JSON, roadmap schema, source-version fields, item-map completeness, packet/reader agreement and allowed deliverable paths were checked before submission.

The first Lean check found a missing decidability instance in an example’s conditional expression; the example now states the equivalent membership biconditional. The successful rerun has no other warning class. No Lean process or language server remains running. Scratch files are disposable; all information needed to resume is in these deliverables.
