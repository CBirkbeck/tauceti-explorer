# Handoff: BP-NeronModelsAndSemistableAbelianVarieties

Refs #960. Worker: Codex — codex-a71f92. Date: 2026-10-04.

## Outcome

Complete target-first planning pass, not mathematical closure or implementation. All six stages are planned and none is source-decomposed or closed. Counts: 78 nodes (4 definitions, 7 constructions, 2 lemmas, 46 theorems, 18 comparisons, 1 application), 110 API items, 33 unit tests, 23 planets, 9 baseline declaration references, 39 explicit gaps, 14 requested supplier stages and one finer Part II node. The job stops below the 300-node budget because every audited target and every one of the nine own-routed paper items has a declaration-level target and an explicit prerequisite/gap path.

The reader gives definitions, hypotheses, proof routes, uses, API, tests, dependencies and acceptance for every declaration. All nodes remain unchecked. No review verdict is written by this worker.

## Scope and continuation

| Stage | Nodes | Coverage |
|---|---:|---|
| R11.1 | 15 | planned, not closed |
| R11.2 | 10 | planned, not closed |
| R11.3 | 12 | planned, not closed |
| R11.4 | 16 | planned, not closed |
| R11.5 | 8 | planned, not closed |
| R11.6 | 17 | planned, not closed |

R11.1 requires the dilatation/smoothening/boundedness/saturation existence proofs, Weil extension, finite-presentation spreading/gluing and relative differential carrier. R11.2 requires non-affine identity/component descent, perfect-field Chevalley comparisons, the elliptic smooth-locus identification and full geometric Tate-resolution dictionary. R11.3 requires the toric/finite torsion and orthogonality proofs, inertial converse, finite-extension valuation handling and formal/rigid effectiveness. R11.4 requires singular Picard representability and regular-model comparison, normalization cohomology, integral Poincaré degeneration/component cokernel and BGW divisor/Brauer/torsor leaves. R11.5 requires the geometry-to-Galois NOS/WD/Euler/residual-invariants comparisons. R11.6 requires exact degeneracy-map kernel/saturation hypotheses, differential pullback/determinant comparisons, compatible-system source proofs, ordinary p-divisible and residual finite-group imports, and the source-qualified Yuan curve/Jacobian criterion.

Resume from the packet coverage lists and its 39 named gaps, not by relabelling planned stages closed. The packet records neededBy on every gap. Its omission ledger follows transitive imports and gaps for every missing signature. The source-proof leaves need independent source decomposition before implementation.

## Confirmed finding RT-AREA-algebraicgeometry/21

Handled by R11.2 minimal-regular-smooth-locus, kodaira-geometric-configurations, kodaira-component-groups and wild-kodaira-comparison. The geometric target distinguishes I0 (smooth genus one), I1 (rational nodal), II (rational cuspidal), I2 double intersections, III tangency and IV concurrent components, then states affine D/E configurations and their multiplicities. It compares the actual configuration and component count with the imported algorithm, not only numerical type. SR4 resolution/intersection, SR5 regular/minimal model and SR6 numerical-type comparison are explicit prerequisites; EC4 supplies the equation-level algorithm. Ogg uses geometric irreducible-component count, not component-group order. Wild residue primes retain Swan/discriminant corrections; tame table formulas are not universal.

The dictionary here is for a pointed elliptic curve, matching BLR §1.5 and the equation-level upstream object. Unpointed genus-one/multiple-fibre, quasi-elliptic and rational-surface generalizations stay in Part II. This boundary is explicit, not a claim to classify those additional models. The bad upstream EC4→SR5 geometry-assignment reason is reported in upstreamNotes, never edited.

## Routed source items and ownership

- PAPER-YUAN-26/76: stable-family-picard.
- PAPER-YUAN-26/141: yuan-full-level-extension.
- PAPER-YUAN-ZHANG-18/neron-model: marked-model, differential-lattice, isogeny-differential-export.
- PAPER-CALEGARI-GERAGHTY-20/conductor-of-A-p-equals-conductor-of-A: residual-conductor-components.
- PAPER-BHARGAVA-GROSS-WANG-17/22: bgw-nodal-pinch, bgw-generalized-jacobian, bgw-brauer-descent.
- PAPER-BHARGAVA-GROSS-WANG-17/24: bgw-two-torsion, bgw-odd-factor-torsors, bgw-boundary-cup-product.
- PAPER-BOXER-CALEGARI-GEE-PILLONI-21/30: strict-compatible-system-export.
- PAPER-BOXER-CALEGARI-GEE-PILLONI-25/9.1.7: semistable-ordinary-adapter, ordinary-isotropic-filtration, ordinary-residual-point-export.
- PAPER-BOXER-CALEGARI-GEE-PILLONI-25/9.2.2: unramified-three-torsion-at-two.

The BCGP strict-compatible-system node exports the actual theorem for 0≤i≤2dim A, purity weight i and WD compatibility including places above the coefficient prime. It records the exterior-power reduction, Noot 2013/2017, Saito/BLGGT base-change and Raynaud purity route. The unread Noot/Saito/BLGGT proofs are named gaps, not reconstructed from the proposition statement. BCGP25 ordinarity is that of the abelian quotient and allows pure toric reduction; the saturated rank-two isotropic lattice uses the toric Tate submodule in that case. Its mod-3 unramified-at-2 statement yields semistability, not good reduction; Tate q=2^3 is the test. CG residual conductors use the dual geometric component-group order. BGW uses a quadratic étale algebra, finite étale two-torsion and unordered Galois-stable factorizations; rational Picard classes are not automatically rational line bundles. Yuan stable-family Picard/Hodge does not assume regular total space.

## Import register

- AbelianSchemesAndArithmeticModuli:A1: Group objects in Over S, products, smoothness and pointed rigidity for abelian schemes; the abelian variety/scheme carrier and its base change, without any Néron existence theorem.
- tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv: The existing equation-level minimal Weierstrass models, TateReductionSymbol, Tate algorithm at all residue characteristics, E1 formal filtration, E0 reduction subgroup, c_p, Ogg exponent and Tate-curve point uniformisation; retain splitness and wild corrections. This packet owns only comparisons with schemes.
- tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models: Regular/minimal proper models of positive-genus curves over the relevant DVRs; for the present target retain a generic elliptic origin. No geometric Kodaira classification is requested from this stage.
- ArithmeticGaloisRepresentations:R01.6: Actual inverse-limit Tate modules of abelian varieties, their finite free rank, continuous Galois action, integral Weil pairing with dual and Tate twist, isogeny compatibility and identification with residual torsion. Do not supply good/semistable geometric reduction by definition.
- ArithmeticGaloisRepresentations:R01.2: Quasi-unipotence for continuous ell-adic representations with ell different from residue characteristic, tame characters, the actual Weil–Deligne pair and its Frobenius conventions.
- AdicSpacesPartII:F0: Formal completion, smooth/étale lifting, formal coherent sheaves, proper formal GAGA with its ample hypotheses, and comparisons with analytification; no rigid quotient by a lattice is assumed.
- tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme: Relative Picard fppf sheafification, rigidification and the smooth proper Jacobian carrier with generic base change. The singular semistable identity component and Néron comparison are not assumed.
- tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs: Normalization of nodal curves, branches and the actual dual multigraph including loops/multiple edges, with integral incidence, homology and Betti number. A simple numerical intersection graph is not sufficient.
- tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion: The numerical Pic(T), weighted intersection matrix, degree map and degree-zero torsion, with the comparison to line bundles on actual regular models. No generic graph/numerical Picard group is rebuilt.
- PadicHodgeTheory:R06.6: Good-reduction crystalline and semistable-reduction semistable comparisons for Tate modules over p-adic fields, with integral/rational distinctions, dual conventions and functorial comparison of monodromy.
- ArithmeticGaloisRepresentations:R01.3: Artin/Swan conductor with the actual inertia and monodromy terms, reduction inequalities and the elliptic conductor/Ogg comparison including wild residue primes 2 and 3.
- tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction: Curve semistable reduction and the source-qualified semistable curve/Jacobian criterion, with all field/valuation hypotheses of Deligne–Mumford 2.4. This is the existing curve theorem, not a new abelian semistability construction.
- AbelianSchemesAndArithmeticModuli:A3: Finite flat abelian torsion and isogenies, dual isogeny and Weil pairing with Cartier duality and Tate twist, with invertibility hypotheses; no Néron-model exactness is assumed.
- tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces: Blowup charts, strict transforms, exceptional curves, normalized resolution and intersection multiplicities on actual arithmetic surfaces; these construct the minimal-model geometric configuration without redoing the generic blowup theory.

The precise finite pinching prerequisite is NeronModelsAndSemistableAbelianVarietiesPartII:G.0/global-existence. Its statement was read: closed immersion, finite branch map and affine-neighborhood condition give the scheme pushout, cartesian square and complement isomorphism. The node exists in the research packet but is not yet an atlas-rendered stage/planet. The prospective assembly therefore cannot render that individual fine-supplier link yet; it has no missing mathematical endpoint. Its coarse G.0→R11.4 direction was screened for backward reachability. This caveat is separate from build success and from supplier acceptance.

The integrated R01.6 Faltings node is number-field-specific and explicitly exports proofs to R28; it is not used as a general local Tate-module carrier. Broad R01.2/R01.3 requests retain the portions not supplied by their existing fine decompositions. No whole-C4 or backward modularity/finiteness dependency is added; the early abstract semi-abelian prefix is G-semiabelian-prefix. Upstream objects are imported, not replanned.

## Baseline and validation

Planning base: aac2a86cbba555f9d0b1301d837f684afa1e16ed. Checked publication base: 6378682c6c5c0b8d11054f4a8cdad54555b7139f. The relevant governance, own audit/atlas/restructure inputs, own deliverables and Part II supplier packet were unchanged between them. The shared worktree remained read-only and clean. Branch and commit publication use the GitHub API only.

Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174. Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369. Declaration index SHA-256: 86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. The index was a search aid; the nine cited statements were read in their source files at the pin. The reviewed six own AUDIT-10 coverage entries, accepted RS-25 ownership entries/touching links and exact-endpoint research links were read before planning. Two upstream documents read for style/interfaces: JacobianChallenge and HodgeStructures.

The pinned Tau Ceti source was inspected, including its existing abelian-variety substrate. There is no existing full Tau Ceti build at that exact pin on this machine, so no whole-Tau-Ceti compile is claimed. The executable prefix imports only individually compiled modules from the existing exact pinned Mathlib build. No package download, Lake setup/cache/build or language server was used.

Actual repository packet checker: zero errors and zero warnings. SHA-256 of scripts/check_blueprint.py: fec911c86c77bae602d6b4c0dd2d342b1b86aa2360b5795edcaa2e21d25ad5b9. Own prerequisite DAG: 78 nodes. Custom coarse backward-request screen: empty. The actual scripts/build.py assemble(require_distances=False) was run read-only on existing promoted inputs with only this proposed packet added in memory. It produced 78 declarations and 23 planets, zero skipped links and no missing endpoints. No review status, public promotion or application data was fabricated. scripts/build.py SHA-256: e1bda81d79beb2e3a056ca5d72862334ef3ad2d65c09fdd491b0bf4684c3c187; scripts/blueprints.py SHA-256: 87271b45cb0ebe052734befe0f22636d0a7f6ae5e4344a56b72eb03827182eb1. The assembly read 636 immutable files; that count is an execution read count, not a source-research claim.

## Exact Lean result and omissions

The published suggested file elaborated serially with the pinned Lean 4.34.0-rc2, commit 6a10ac8c22beadecabdbb0919c2b50214762f91d, using one thread, an 8192MiB compiler limit and a 1200-second timeout. Available RAM immediately before this run: 35GiB (guard threshold 20GiB). Peak compiler RSS: 3309064KiB; elapsed wrapper time 1.66 seconds. Exit zero, zero errors and 54 warnings, all admission warnings. The native declarations and all 40 native API names resolve by exact qualified-name checks; there are 12 native test examples. No implementation is claimed.

Native prefix: the fully quantified smooth-test Néron mapping property; marked smooth separated quasi-compact model; actual morphism-valued extension and compatible unique isomorphism; and the weaker étale-test model. Their types use actual Scheme/Over objects, pullback morphisms and native Smooth/Etale/IsSeparated/QuasiCompact. The mapping predicate and model carrier axiom audits contain propext, Classical.choice and Quot.sound, but not sorryAx; extension and unique_iso contain sorryAx as expected.

Exactly 71 advanced node signatures, including their 70 API items and 21 tests, are omitted because the required carriers/hypotheses cannot yet be expressed in the native prefix. The packet, reader and suggested file enumerate every exact omitted node/declaration/API/example name and its transitive inputs. These comments are not executable signatures, and a successful compile says nothing about those 71 mathematical targets. There are no raw proposition-valued conclusion fields or admitted proposition-valued predicate bodies.

Suggested source SHA-256: 46d250ae66b86822368a17a990cd43ec6d680f567b7b3537e60d0c7fb4b0cd09. Sanitized full compiler-diagnostic digest (metadata only, reproducible checking uses the public suggested file): 07988c976bf4cf2ed1833020101d8aa0968770470e50fc67304e82398fdca3ae. No source PDFs, images, extracted texts or machine paths are published. Scratch occupied about 132MiB, below 1GB; all owned processes finished.

## Primary-source reading receipts

The packet sourceVersions list records 13 primary documents and their exact reading boundaries. Only Conrad’s 35-page notes and Raynaud’s 25-page paper were read in full; other entries are the selected passages listed below. BLR Chapters 3–6/9, Tate §7 resolution/algorithm proofs, SGA7 IX §§9–10 proof details and the rest of §11.6, the source references cited by Raynaud, and Noot/Saito/BLGGT proof leaves remain explicitly unread. No imported extraction archive is claimed as own reading.

| Source | SHA-256 | Own reading |
|---|---|---|
| [CONRAD-SR](https://math.stanford.edu/~conrad/DarmonCM/2011Notes/SemistableReduction.pdf) | bfbad9fc883b2a6ac6e5f842abc664c2ebc84c348b9d80fa4ca6313b37e28173 | Entire 35-page notes, including references; p.18 formula checked on page image |
| [BLR-CH1](https://math.arizona.edu/~cais/scans/BLR-Neron_Models/neron1.pdf) | 32baed54631829b55af3c9e883db41cbde8820fcd1e75cfaccd75584be7149b6 | Cover, introduction printed pp.2–6; §§1.1–1.4 printed pp.7–20; §1.5 printed pp.20–23. Selected images only; existence/Picard chapters not read |
| [SGA7](https://library.slmath.org/nonmsri/sga/sga/pdf/sga7-1.pdf) | 17286b0f0bec451068e0a5fa2c39e93de28e7c1ecee6739487cfac11c03c8dab | Introduction and §§1.0–1.4, printed pp.314–324 (PDF319–329); §10.3 base-change formula and Theorem10.4, printed pp.443–444 (PDF448–449); Theorem11.5 and start §11.6, printed pp.455–456 (PDF460–461); Theorem12.1, printed pp.465–467 (PDF470–472); §§12.3.5–12.5, printed pp.471–475 (PDF476–480); Locator probes at PDF440,450,490 are not claims of reading their surrounding sections |
| [RAYNAUD94](https://www.numdam.org/item/AST_1994__223__295_0.pdf) | b0cf9b1a112beb11937a5efb36e40c19a6b819d53fcd28325fb465352d460a45 | Entire 25-page article, definitions, §§4.1–4.7 and references; cited Bosch–Lütkebohmert papers not independently read |
| [YUAN-ARXIV](https://arxiv.org/pdf/2108.05625v4) | a4e4c3d79e0912b62961a4b45b08e1e5c6957b0b64af7da74647c8ff9361e11e | §3.1.3 and Lemma3.4 pp.43–44; Lemma4.9 proof p.76. Not the August2024 author manuscript or the final journal version |
| [YZ](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf) | 29dfd5f19dec401116f1eaf0305305acf5f2fc68aa3c90d4eb6e5222de50d507 | §1.1 pp.534–535; §2.3 Theorem2.7 proof pp.549–550, compared to author erratum introduction |
| [YZ-ERR](https://web.math.princeton.edu/~shouwu/publications/Erratum5.pdf) | 18b46acd0f6be352d4bc5b4d7797650be3e228712e13de94bbb45ec25b576c91 | Introduction and Theorem1 opening pp.1–2. Not collated against Annals198(2023)867–878 |
| [CG](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf) | fff305877c7e6b9d32ca9a8b4a56f7f3b343695fc737184d1a3a1b78f195cfa5 | Lemma A.7 and its conductor proof, author-copy p.89 / typeset p.889. Not byte-collated with publisher PDF |
| [BGW](https://arxiv.org/pdf/1310.7692v2) | 8833a226eea99eab7e48b90de7d747fa535eafe032d5c62fd50812d38ad4c4f2 | Introduction; §3 pp.9–11, generalized Jacobian, Proposition22 and boundary/cup-product paragraph. Not journal collation |
| [BCGP21](https://arxiv.org/pdf/1812.09269v3) | 7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed | Proposition2.8.1 and Definition2.8.2, p.36; compared with published pp.194–195 |
| [BCGP21-PUBLISHED](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf) | b4cc8b016615bcaf4b92bdf826ec1e285f6aca842ebd9f13712e1c498f8454af | Proposition2.8.1, its proof and Definition2.8.2/Remark2.8.3, pp.194–195; p.194 checked on page image |
| [BCGP25](https://arxiv.org/pdf/2502.20645v1) | 51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c | Definition9.1.7, Lemma9.1.8 with full proof and Definition9.2.1/Lemma9.2.2, pp.190–192; p.191 checked on page image |
| [TATE](https://wstein.org/Tables/antwerp/tate/tate.pdf) | 8650805838f84ad1bc9afa169b1797bd345fb7d9ea4628cdf995c83a10aaccfc | §§4–6, printed pp.41–46 (PDF9–14). The §7 algorithm proof pp.47–52 is not read/decomposed here |

The attempted Yuan author manuscript URL refused access; the selected arXiv v4 passages were used and no final 2026 journal/author-copy collation is claimed. BCGP21 published pp.194–195 were successfully fetched and personally collated with arXiv v3; the published page image confirms the dim X slip. BCGP25 remains explicitly arXiv v1; the history listed only v1 during the bounded correction search. CG is an author-hosted typeset copy, not publisher byte collation. YZ uses selected 2018 journal pages and the December 2022 author erratum opening, not a claimed own reading of the final 2023 erratum.

Five source issues are recorded for independent review: Conrad’s swapped corank coefficients; BCGP25’s missing toric Tate subscript; Yuan’s stray X for C; BCGP21’s dim X for dim A in both inspected versions; and the known withdrawn YZ exact-Néron-functor step. The inherited extraction identifiers are retained where applicable, with own version scope distinguished. Bounded searches finding no correction are not novelty/priority proofs.

## Public deliverable fingerprints

- research/blueprint/packets/NeronModelsAndSemistableAbelianVarieties.json: SHA-256 7cf692627a8e30145f026c61c466d60155b161137eb3c2966226428380c8f2de.
- research/blueprint/readmes/NeronModelsAndSemistableAbelianVarieties.md: SHA-256 7e174f3a26bad9ab37af9b71d1e741eb3fabd739d6d22a7d6903ea9f22e378d9.
- research/blueprint/suggested/NeronModelsAndSemistableAbelianVarieties.lean: SHA-256 46d250ae66b86822368a17a990cd43ec6d680f567b7b3537e60d0c7fb4b0cd09.

The handoff itself is authenticated by its Git blob in the PR; no recursive self-digest is asserted. Reviewers should verify the nine baseline statements, all source corrections, exact supplier hypotheses and the six gap lists, then continue source-proof closure without duplicating the owning roadmaps.
