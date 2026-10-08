# Independent review: Hecke correspondences and local shtuka cohomology, round 2

**Accepted as a complete target-level pass.** Job `REV-HeckeStacksAndLocalShtukas~2`, issue #7057. Reviewer: Codex, session `codex-6cfI1Y`, 8 October 2026. I did neither blueprint round and did not rely on the prior review's verdict for the mathematical checks.

The prior review requested regeneration of the reader from its corrected packet. Revision round 2 supplied that reader and reconciled several suppliers. I checked the revision and all the mathematics again: the 51 statements and hypotheses, their proofs and direct prerequisites, all API items and tests, the eight pinned declarations, the library audit, requests, gaps, source issues, planets and the seven assigned red-team findings. This review accepts the resulting plan, with its open inputs recorded explicitly. It does not close a layer or claim an implementation.

| Item | Result |
| --- | --- |
| Nodes | 51: 18 theorems, 17 constructions, 13 comparisons, 2 definitions, 1 application |
| Per-node verdicts | 45 verified, 6 corrected, 0 added, 0 unverifiable |
| API and mathematical tests | 215 API items; 94 tests on all 19 definitions/constructions, at least three each |
| Planets | 22; HS0 4, HS1 5, HS2 6, HS3 5, HS4 2 |
| Baseline citations | All 8 confirmed; none removed or replaced |
| Supplier requests | 22; one repointed, one extended |
| Gaps | 9; the previous 8 retained and one supplier normalization gap added |
| Coverage | Five stages planned, zero closed; all implementations unchecked |
| Source issues | All 46 independently confirmed; none added or rejected |

## Corrections made in this review

1. **Failure of étaleness requires a point.** `HS2/one-leg-period-map` had asserted that the infinite-level rational torsor is not étale whenever dim G is positive. This needs a nonempty admissible locus. For G_m, μ=1 and b=p, κ(b)=1 differs from −μ, so both admissible locus and torsor are empty and the morphism is étale. I added nonemptiness, added this acceptance test, and changed the Lean omission comment. The finite-level étale and infinite-level pro-étale statements of SW 23.3.3–23.4, pp.220–221, are unaffected.
2. **Integral highest-weight ownership.** The request used by the lisse-preservation and continuous-Weil-descent nodes was addressed to `LanglandsParameterStacks:LP3`. That roadmap instead routes integral highest-weight theory to the continuation `ReductiveGroupsIntegralRepresentationsPartII`. The catalogue routes `PAPER-KISIN-PAPPAS-18` and `PAPER-KISIN-PAPPAS-ZHOU-26` register that direction against Tau Ceti's existing ReductiveGroups layer 9. I repointed the request and both prerequisites to that registered parent pending the continuation's design, and updated proof steps, coverage, reader boundaries and the Lean interface comment. The parent is expressly not claimed to prove the requested extension. The two requirements remain separate: all-prime exterior-product thick generation for FS IX.2.1, and a possibly infinite left resolution with finitely many weights for IX.2.3, pp.322–323. Neither requires the good-prime parameter-stack hypotheses or a restriction on the finite group Q.
3. **Conflicting Beauville–Laszlo supplier signs.** GS0 fixes the orbit of μ(ξ), whereas three BG2 exports give its gluing map the opposite κ sign and inverse Newton bound. On G_m, ξB⁺_dR is the ideal lattice, giving O(−1)=E_π and κ=+1 (FS II.2.3, pp.60–61; III.2, pp.90–91; VI.2.4, p.199; SW 19.4.2, pp.176–177). I removed five citations of those conflicting exports from three consumers (`structure-group-and-inner-form`, `nonemptiness-and-period-connectedness`, `adjoint-period-and-tower-comparison`) and replaced them with three references to the existing BG2 uniformization stage request. Its extension precisely requests corrected κ=+μ♯, image B(G,μ), minuscule equality, and the inverse-orientation dictionary. Each proof now records the gate, and the ninth gap makes it visible in coverage and the reader. This packet continues to use κ(E₁)=κ(E₂)+μ♯ and nonempty trivial-first shtukas exactly for b∈B(G,μ⁻¹). No foreign packet was edited and no contradictory export remains imported as a proof of those facts.
4. **Library audit description.** `TauCeti.IsSmoothDiscrete` and `TauCeti.SmoothDiscreteTopRep` at the Tau Ceti pin permit a topological coefficient ring with continuous scalar action on the discrete module. The previous assessment said they were available only for a discrete coefficient ring. I corrected the packet and reader description. This supplies the ordinary representation carrier; it still supplies none of the derived smooth category, compact induction or admissibility planned here.

I also replaced the previous review metadata with this review's 51 checked entries and fresh verdicts on every source issue; recorded independent PDF version/hash checks; restated seven `printed` formula-only entries and four source-style corrections in prose; and synchronized the reader with every changed statement, proof, acceptance condition, prerequisite, request and gap. No node identifier, API name, test name, planet, mathematical source version, baseline declaration or implementation status changed. The GLX reading list now correctly calls 6.4 a proposition, and the E17 reason describes its base-change comparison without quoting the source formula. No source excerpt was added. All repository prose describing the mathematics is in our own words with source locators.

## Sources and provenance

I re-fetched the following public PDFs into disposable scratch space. All eight SHA-256 values exactly reproduce the packet's recorded versions. The source records retain the revision's reading provenance and additionally identify this independent check. I checked each node and each source issue at its locator; the review is scoped to these copies, rather than to an unread book printing or later edition.

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf) — `FS-geometrization`. Author-hosted 356-page file, the text of arXiv:2102.13459v4 (27 November 2024); PDF page = printed page. The published version, Astérisque 466 (2026), was not read. SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
- [Berkeley Lectures on p-adic Geometry](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf) — `SW20-berkeley`. Print-ready file dated 27 March 2020 (printed page = PDF page − 10). The published volume, Annals of Mathematics Studies 207 (2020), was not collated. SHA-256 `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc`.
- [Admissible pairs and p-adic Hodge structures II: The bi-analytic Ax-Lindemann theorem](https://arxiv.org/pdf/2308.11064v2) — `HK23v2`. arXiv:2308.11064v2, 28 February 2025. Locators refer to this version, not the published Inventiones pagination. SHA-256 `c133b06bec1209a04f84d1c2984b78ce2242ba85fc1b72cf5a662002685cab8a`.
- [On the connectedness of p-adic period domains](https://arxiv.org/pdf/2210.08625v2) — `GL22v2`. arXiv:2210.08625v2, 28 December 2022; corrected Lemma 3.3. SHA-256 `24342df8b2c221481c50147299cb63a4b5b60c45d808e4c50e8c89daf4f66946`.
- [The connected components of affine Deligne–Lusztig varieties](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf) — `GLX26-published`. Inventiones mathematicae 243 (2026), 805–861; DOI 10.1007/s00222-025-01386-1, CC BY 4.0. Published PDF byte-pinned below. SHA-256 `c40fe1fc5e0941812cf3aca5ba77c471ee49122c63ed7b0d864d322136031485`.
- [Finiteness for Hecke algebras of p-adic groups](https://arxiv.org/pdf/2203.04929v2) — `DHKM22`. arXiv:2203.04929v2, 22 April 2022 (16 pages). Locators refer to this version; the published article (Journal of the American Mathematical Society 37 (2024)) was not read. SHA-256 `921286bd623e9c1d9d954ea7e9a461ebb837b6c4446ab4c69a3fcb619cdf803b`.
- [Geometric Eisenstein series I: finiteness theorems](https://arxiv.org/pdf/2409.07363v1) — `HHS24`. arXiv:2409.07363v1, 11 September 2024 (64 pages). Locators refer to this version. SHA-256 `490a28590d6870119cfa0e57966e59a4e80d52ee744d3c0cf1c88181a2132e51`.
- [Dualizing complexes on the moduli of parabolic bundles](https://arxiv.org/pdf/2401.06342v4) — `HI24v4`. arXiv:2401.06342v4, 7 May 2025 (47 pages). Locators refer to this version. SHA-256 `216227b4f53c46d7365d990ee2ba4039532b0f159c9b202f3667a1cc286449b3`.

For FS, printed and PDF pages agree in the author-hosted 356-page copy. In the 260-page Berkeley PDF, printed page n corresponds to PDF page n+10 when PDF pages are numbered from one. GLX locators use the journal's printed pages 805–861. The arXiv locators use the identified versions' printed page numbering. Restricted library books were unnecessary.

The governing convention was recomputed rather than chosen to match a printed sign: a Grassmannian point fixes the first lattice relative to the second; κ(E_b) is minus the first Chern class. The packet's G_m, determinant, Lubin–Tate, nonbasic GL₂, torus-to-trivial-group and non-pro-p-level examples agree with that convention. The GL/GLX/Howe–Klevdal nodes give their inverse-orientation dictionary explicitly.

## Pinned baseline and audit

Every declaration below was read in its module at the exact pinned commit, not inferred from its name or the current library HEAD. No baseline declaration was removed, replaced or added.

| Declaration | Module and declaration line | What it supplies here |
| --- | --- | --- |
| `CategoryTheory.Adjunction` | Mathlib `CategoryTheory/Adjunction/Basic.lean`, 108 | Unit, counit and both triangles for the stated ordinary adjunctions |
| `CategoryTheory.ExactPairing` | Mathlib `CategoryTheory/Monoidal/Rigid/Basic.lean`, 77 | Coevaluation 1→X⊗Y, evaluation Y⊗X→1 and both triangles; the suggested file proves forward transport by a monoidal functor |
| `CategoryTheory.Functor.Monoidal` | Mathlib `CategoryTheory/Monoidal/Functor.lean`, 389 | Mutually inverse lax/oplax tensor and unit structures |
| `CategoryTheory.MonoidalCategory` | Mathlib `CategoryTheory/Monoidal/Category.lean`, 162 | The ordinary tensor category and its coherence, without the enhanced structure |
| `Condensed` | Mathlib `Condensed/Basic.lean`, 44 | Sheaves on CompHaus for the coherent topology |
| `CondensedMod` | Mathlib `Condensed/Module.lean`, 40 | Condensed modules; it does not itself supply solid or relatively discrete complexes |
| `WittVector.Isocrystal` | Mathlib `RingTheory/WittVector/Isocrystal.lean`, 113 | Fraction-Witt-module Frobenius-semilinear automorphism; finite dimensionality is an additional condition |
| `TauCeti.AffineGroupSchemeCat` | Tau Ceti `AlgebraicGeometry/AffineGroupScheme/Basic.lean`, 55 | Affine group objects over Spec S; smoothness, connected fibres and reductive generic fibre are extra hypotheses |

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The two smooth-discrete representation declarations were also read at the Tau Ceti pin in `RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean`.

I read the 21 target rows of reviewed AUDIT-21 in `data/library-coverage.json`. Their absent/partial distinctions are respected: condensed modules, ordinary tensor algebra, isocrystals, affine group schemes and pro-p group theory are imported, while their derived/geometric extensions remain planned. The global function-field Hecke construction has a different curve and base, stated in the reader's boundary. The classical towers are imported from ET.6a/Igusa owners; the unresolved general Rapoport–Zink comparison is a gap and rescope proposal, not a second construction of their towers.

## Dependencies, coverage, API and suggested file

I read every direct supplier node's statement, hypotheses and prerequisites, and compared each requested extension with the supplying layer. The final packet has 172 distinct foreign references: supplier nodes, stages and the eight baseline declarations. Requested stage references are explicitly conditional and do not certify closure. Before correction, traversal from this packet reached 1,893 nodes across the local blueprint/integrated graph with no cycles; the corrected traversal reaches 1,890 nodes and remains acyclic. The checker also verifies the internal DAG, identifier resolution and realized stage ids. The mathematical audit, rather than graph reachability, found the conflicting BG2 sign imports.

All stage targets are represented at target-level density: HS0 has 6 nodes, HS1 10, HS2 18, HS3 10 and HS4 7. The stable identifier `HS0/demazure-generators-of-ULA-kernels` correctly belongs to HS1. Proofs keep the general-field construction separate from Q_p rigid/crystalline comparisons. Non-minuscule component transitivity, general compact-ρ level-colimit compactness, nonbasic source geometry, classical/diamond compact support and the classical EL/PEL inputs remain visible as gaps. The packet is `complete` under the pass criterion, and no row is `closed`.

All 19 definitions/constructions have APIs and at least three mathematical tests. The 94 tests distinguish actual mistakes: trivial versus torsorial frames; source/target signs; arbitrary versus normal levels; μ versus ≤μ; unit/no-leg and torus behaviour; mixed versus minuscule bounds; basic versus nonbasic duality; and failure of compactness at ℓ-torsion levels. The additional empty-locus check is an acceptance condition on a theorem, so it does not change the 94-test count.

I read the suggested Lean declarations and tests against the packet, and checked presence of all 215 API names and 94 named examples. It is a signature proposal with imported owner interfaces, not a formalization of these results. Its primitive `MorphismProperty`, `ObjectProperty` and `Set` stand-ins name their owners and define the scope of the prototype. I accept these as placeholders for imported definitions; a missing condition of this roadmap is not hidden in a Prop-valued field or a `def _ : Prop := sorry`. Clauses beyond the prototype interfaces remain expressly marked `Omitted`, including the group-dimension/nonétaleness clause. The two ordinary pairing triangles and their adjunction construction use the actual pinned categorical operations. Elaborating this file does not close any of the packet's gaps.

The reader's introduction, boundaries and conventions were checked against the packet. After corrections, a projection comparison checked 2,298 statement/hypothesis/proof/API/test/acceptance/prerequisite/request/gap/restructure/source-issue fields, normalizing only Markdown escapes and paragraph whitespace, with zero mismatches. This resolves the prior review's reader objection and prevents the corrections here from leaving another lagging document.

## Assigned red-team findings

| Finding | Disposition |
| --- | --- |
| RT-AREA-geomlanglands/2 | Classical towers and their comparison have separate owners; the general EL/PEL comparison remains the recorded gap/rescope to IntegralPartII. HS3 does not claim ET.6a supplies all Rapoport–Zink cases. |
| /13 | General allowed Λ, compact lisse Hecke operators, duality and ULA are retained. The supplied VS5 statements and extensions use FS VII.7, pp.272–276, rather than replacing the claim by torsion étale sheaves. |
| /19 | Enhanced perfect-complex/tensor closure and both all-prime representation-theory reductions are stated precisely. This review additionally repairs the highest-weight request's owner. The integral tensor-generator defect is still recorded as E45. |
| /20 | Minuscule Grassmannian/flag comparison and Huber compact support have their required hypotheses, shifts and explicit remaining comparison input. Pro-p compactness is not promoted to every compact-open subgroup. |
| /21 | The Demazure/lisse-preservation node has parent HS1; its stable HS0 identifier is intentionally retained for consumers. |
| /22 | The moduli construction from SW is Q_p-only. General E has its own node with an explicit relative-curve/lattice construction and the RF/GS prerequisites. |
| /29 | The lisse/solid coefficient scope of duality and ULA is preserved. Ordinary torsion-étale formulas are used only under their stated torsion hypotheses; supplier extensions are requested. |

## Per-node review

The table below records the independent check of every final node. Full identifiers and the same verdicts are in the packet's `review.checked`. A verified node can depend on an explicitly recorded open input; its verdict concerns the correctness and honesty of that target-level plan.

| Node | Verdict | Check |
| --- | --- | --- |
| `HS0/global-hecke-correspondence` | verified | FS I.2 p.16, VI.1 pp.190–194, VI.9 pp.226–229 and IX.2 pp.321–322: verified the finite-leg prestack, local meromorphy, the target including legs, and repetition along arbitrary maps. The empty-leg, torus and determinant tests distinguish the conventions. |
| `HS0/descent-and-bounded-fibres` | verified | FS VI.1.7, VI.2.3–VI.2.7 pp.193–201 and VI.8.4 pp.224–225, with SW 19.5.3 pp.180–181: verified descent and étale-local bounded Grassmannian fibres. Properness is restricted to bounded representable maps; minuscule and non-minuscule examples have the stated dimensions. |
| `HS0/chains-and-composition` | verified | SW 20.3–20.4 pp.183–189 and FS VI.9–VI.12 pp.226–237: verified ordered chains, disjoint-leg composition, collision convolution and associativity. The middle bundle remains necessary at a collision. |
| `HS0/twisted-period-grassmannian` | verified | SW 23.4.1–23.4.4 pp.221–222 and FS IX.3 pp.325–326: verified the b-dependent local charts and their transition by b·σ(b)⋯σ^{m−1}(b), rather than an unsupported globally b-independent identification. Collision and torus tests retain this dependence. |
| `HS0/structure-group-and-inner-form` | corrected | FS III.2–III.3 pp.90–100, VI.2.4 p.199, IX.6–IX.7 pp.330–338 and SW 23.3.2 p.219: recomputed κ(E₁)−κ(E₂)=μ♯ from ξB⁺_dR ↦ O(−1). Replaced the conflicting BG2 sign export by its correction request and recorded a gap; inner-form and central-twist APIs otherwise verified. |
| `HS1/satake-kernel-and-solid-monoidal-functor` | verified | FS VI.9–VI.12 pp.226–239 and IX.2 pp.321–322: verified local/global Satake kernels, dualization order and the minuscule shift −d with half twist −d/2. Finite projective coefficients and local relative duality are retained. |
| `HS1/hecke-operator-via-relative-homology` | verified | FS IX.2 pp.321–323, VII.7 pp.274–276: verified p₂♮(p₁* A ⊗ S′_V), its adjunction, linearity and minuscule cohomology normalization. Relative homology is not silently identified with lower shriek outside the eligible comparison. |
| `HS0/demazure-generators-of-ULA-kernels` | corrected | FS IX.2.1 pp.322–323, VI.8.4 pp.224–225 and GS0/GS1 supplier statements: verified Demazure reduction and its geometric dimension bound. Moved the all-prime integral highest-weight request from LP3 to the registered ReductiveGroups parent pending IntegralRepresentationsPartII design. The stable HS0 slug already has the correct HS1 parent. |
| `HS1/properties-and-weil-equivariance` | verified | FS IX.2.2–IX.2.4 pp.323–324 and VII.7.6–VII.7.10 pp.272–276: verified exactness, lisse compactness, both adjunctions and continuous Weil action. Coefficient rings remain arbitrary allowed Λ, with no good-prime hypothesis; supplier extensions are explicit. |
| `HS1/ula-preservation` | verified | FS IX.2.2 p.323 and VII.7.10 p.276: verified ULA preservation by the properly supported kernel and relatively discrete trace; the nonbasic torus-stratum example is not wrongly promoted to ULA. |
| `HS1/duality-exchange` | verified | FS IX.2.2 p.323 and VII.7.6–VII.7.9 pp.272–275: recomputed Bernstein–Zelevinsky and naive duality using their respective adjunctions and swap/dual kernel. The statement is lisse/solid rather than limited to torsion étale coefficients. |
| `HS1/condensed-enrichment` | verified | FS IX.1.1–IX.1.2 pp.317–321: verified scalar completion of enriched mapping complexes, relatively discrete endomorphisms of compact objects, and the condensed functor category. Pinned Condensed and CondensedMod provide carriers only. |
| `HS1/continuous-weil-descent` | corrected | FS IX.2.3 p.323 and VII.2.6(ii) pp.255–256: verified Drinfeld pullback and fully faithful essential image after bounded-weight exterior-product resolution. Corrected the owner of that unresolved all-prime representation-theory extension; the required geometric-base-change supplier is already cited. |
| `HS1/coefficient-base-change` | verified | FS IX.2.4 p.324 and VII.2 pp.256–257: verified the extension and restriction comparison maps and the condensed action. The supplier request distinguishes construction of a restriction comparison from proving that it is invertible. |
| `HS2/local-shtuka-moduli` | verified | SW 22.4 pp.209–211 and 23.1.1–23.1.3 pp.216–217: verified Q_p restriction, smooth connected integral model, Frobenius direction, framings and σ-conjugation ybσ(y)⁻¹. General local fields are deferred to their own node. |
| `HS2/framed-bundle-fibres` | verified | FS III.2–III.5 pp.87–106 and IX.3 p.325: verified framed fibres over two bundles, automorphism actions and the empty/unit fibre. The nonbasic automorphism group retains its unipotent part. |
| `HS2/lattice-extension-functor` | verified | SW 22.3–22.6 pp.209–214: verified lattice extension, geometric triviality, the open admissible locus and the pro-étale rational torsor. Existence of an integral lattice is local on the base; vanishing Newton point alone does not replace vanishing κ for a torus. |
| `HS2/hecke-fibre-description` | verified | SW 23.3.1–23.3.2 pp.218–219: verified quadruples and the inverse construction by periodic meromorphic gluing, with the required lattice and framing. The untilt is over the completed reflex-field base, and the inner-form duality reverses μ. |
| `HS2/one-leg-period-map` | corrected | SW 23.3.3–23.3.4 p.220 and 23.4 p.221: verified the finite-level étale period map and infinite-level pro-étale torsor. Added nonemptiness of the admissible locus to the failure-of-étaleness assertion; G_m, μ=1, b=p gives the empty étale counterexample. Added that acceptance check and synchronized the Lean omission comment. |
| `HS2/levels-and-tower-limit` | verified | SW 23.4–23.5 pp.221–224: verified compact-open quotients, finite étale transitions, infinite-level limit and commuting J_b/Q_p actions. The coset-fibre and non-normal-level tests distinguish quotients from a group-valued substitute. |
| `HS2/multi-leg-period-and-representability` | verified | SW 23.4.2–23.5.3 pp.222–224: verified the multi-leg period map and local representability through Frobenius-translated diagonal charts. The proof uses the b-dependent twisted charts, and does not rely on the disputed independence remark. |
| `HS2/no-legs-and-basic-duality` | verified | SW 23.2.1–23.2.2 pp.217–218 and 23.3.2 p.219: verified the no-leg extension and the basic inner-form tower duality, including inverted bound, group actions and the necessary completed reflex field. |
| `HS2/general-local-field` | verified | FS IX.3 pp.325–327, RF0/RF2/RF4 and GS0 supplier statements: verified the explicit construction over a general local field from curve modifications and lattice torsors. It is a derived construction in this packet, not a claim that the Q_p-only SW theorem supplies it. |
| `HS2/minuscule-rigidification` | verified | SW 24.1.2–24.1.3 pp.225–226, 19.4.2 pp.176–177 and 20.2.3 p.185: verified minuscule flag geometry, finite-level rigidification, dimension and partial properness. The needed adic geometry and Schubert-smoothness results remain precise requests. |
| `HS2/nonemptiness-and-period-connectedness` | corrected | GL Theorem 3.1 pp.9–10 and GLX Theorem 3.11 pp.827–828: verified nonemptiness in B(G,μ⁻¹), connectedness and density with the inverse-orientation dictionary. Replaced the three conflicting BG2 imports by the signed correction request; the topological/dimension inputs remain recorded gaps. |
| `HS2/component-transitivity-source-gate` | verified | GLX Lemma 3.2 p.820, Theorem 3.9 pp.825–826 and Proposition 3.12 p.828: verified the compact-group component quotient and the finite-level open-component argument. Z acting on Z_p refutes the locally profinite-group version; non-minuscule transitivity remains conditional on the explicit gap. |
| `HS2/classical-period-points` | verified | HK 7.3.3 pp.43–44 and GLX 3.9 pp.825–826: verified classical admissible points, weak admissibility and the rigid local system, with Q_p and minuscule hypotheses. The weakly admissible nonemptiness input remains a gap, and μ is translated from HK orientation. |
| `HS2/adjoint-period-and-tower-comparison` | corrected | GLX Propositions 6.6–6.7 pp.849–851: verified the adjoint comparison after completed reflex-field base change and with the central Kottwitz condition. Replaced the conflicting sign export by the BG2 correction request; the torus-to-trivial-group example detects the missing base change. |
| `HS2/torus-products-and-determinant` | verified | GLX Proposition 6.4 pp.848–849 and Propositions 6.6–6.7 pp.849–851: verified torus torsors, product decomposition and determinant on components. The GLX orientation is explicitly translated to Berkeley μ⁻¹, including its Weil descent. |
| `HS3/compact-support-at-levels` | verified | FS IX.3.2 pp.325–327: verified the finite-level relative-homology object and the colimit along pullbacks, with coefficient completion specified before taking limits. No compactness is asserted for arbitrary compact-open level. |
| `HS3/satake-coefficients-and-partial-frobenius` | verified | FS IX.3 pp.325–327 and VI.9–VI.12 pp.226–239: verified pulled-back Satake coefficients, partial Frobenius and the condensed Weil action. The ULA coefficient identification includes the flat/perverse condition rather than asserting it for every ULA complex. |
| `HS3/hecke-cohomology-comparison` | verified | FS IX.3.2 pp.325–327: verified fibre/base-change comparison with i_b* T_W(j♮ c-Ind_K Λ), and its J_b, level and Weil actions. Nonbasic source strata are handled by the separate left-adjoint construction. |
| `HS3/huber-cohomology-comparison` | verified | FS VII.5.2 p.265 and IX.3.1 pp.324–325, with SW 24.1 pp.225–226: verified the minuscule shift [-d](-d/2) against Huber compact support. The classical/diamond comparison and duality input remain an explicit gap, not an assumed comparison for all coefficients. |
| `HS3/compactness-of-shtuka-cohomology` | verified | FS IX.3.1–IX.3.2 pp.324–327 and DHKM Theorem 1.1/Corollary 1.4 pp.1–2: verified pro-p compactness and the finite-generation bridge. The bound is B(G,μ⁻¹); finite ℓ-group derived invariants give the stated counterexample at non-pro-p level. |
| `HS3/general-bound-compactness` | verified | FS IX.3.2 pp.325–327: verified general-bound compactness from compact induction, compact Hecke operators and stratum restriction. The Frobenius-diagonal charts are used locally and do not invoke an unsupported global trivialization. |
| `HS3/admissibility-duality-and-adjunction` | verified | FS IX.3.2 pp.325–327, HHS 1.3.1 p.6 and 7.1.4 pp.60–61, HI 4.1 p.24: verified perfect pro-p invariants and both duality adjunctions. Nonbasic Verdier duality includes modulus and shift. Level-colimit compactness for general compact ρ remains a gap; the HHS torsion/Q̄_ℓ finite-length cases are scoped exactly. |
| `HS3/level-trace-and-pullback` | verified | FS IX.3 pp.325–327 and SW 23.4 p.222: verified trace and pullback at finite étale levels, tr∘pull=[K:K′], normal-level averaging and conjugation. Division by the index is justified by pro-p level and ℓ≠p. |
| `HS3/classical-comparison` | verified | SW Theorem 24.2.5 pp.227–228 and Corollary 24.3.5 pp.230–231: verified the minuscule EL/PEL comparison, its completed reflex base, two actions and Weil descent. The construction of general Rapoport–Zink spaces and its p-adic Hodge inputs are explicit gaps routed to IntegralPartII; general E is not silently deduced from Q_p. |
| `HS4/monoidal-and-finite-set-functoriality` | verified | FS IX.2 p.322 and IX.4 pp.327–328, with GS3 fusion: verified monoidality, arbitrary finite-set restriction, composition, fusion and insertion of trivial legs. Tensor functor coherence is an enhanced supplier input, not merely a functor-law test. |
| `HS4/creation-annihilation-and-triangles` | verified | FS IX.4 pp.327–328 and VIII.4 pp.290–291: verified coevaluation/evaluation order, both triangle identities, diagonal Weil invariance and trace. The suggested file transports ExactPairing forward and proves the ordinary categorical triangles; the torus excursion test uses the pinned class-field normalization. |
| `HS4/isogeny-product-and-weil-restriction-diagrams` | verified | FS IX.6.1 pp.330–331: verified the G′→G direction, dual restriction, Cartesian comparisons and relative-homology kernel formula for adjoint isomorphisms. Generic morphisms retain only the stated diagram identities, with central-character tests. |
| `HS4/product-hecke-diagram` | verified | FS IX.6.2 p.331 and VII.7.10 p.276: verified product kernels and operators, the two Bun factors and compact exterior products. The corrected source diagram uses G₂ in its second centre factor. |
| `HS4/weil-restriction-hecke-diagram` | verified | FS IX.6.3 pp.331–332: verified finite separable Weil restriction, the closed immersion, finite étale projection and induced representation. The Satake induction/half-twist compatibility and ramified bundle comparison remain precise supplier requests; the excursion-algebra cofinality defect is not concealed. |
| `HS4/levi-compatibility` | verified | FS IX.7.2 pp.335–337, VI.7.13 p.223 and HI 4.4–4.7 pp.25–26: verified the parabolic correspondence, switched orientation, constant-term shift and cyclotomic twist. The source calculation is restricted to eligible torsion coefficients and unstable strata; stacky shriek and the modulus character are stated explicitly. |
| `HS4/continuous-tensor-generator-export` | verified | FS IX.2.2–IX.2.4 pp.323–324 and IX.5.1 p.328: verified continuity and exterior/tensor compatibility as exports to the excursion owner. The integral tensor-generator argument is explicitly not established; the GL₂ mod-2 determinant counterexample supports source issue E45. |
| `HS2/admissible-period-torsor` | verified | SW 23.3.3 p.220, 23.4 p.221 and FS Theorem III.2.4 pp.91–92: verified the universal admissible rational torsor, frame interpretation, quotient by K, pullback square and group action. The torus/nontrivial-monodromy tests distinguish a torsor from a chosen trivialization. |
| `HS0/bounded-hecke-substacks` | verified | FS VI.2.6–VI.2.7 pp.200–201 and VI.8.4 pp.224–225: verified bounded Hecke substacks, collision sum of bounds, v-descent and proper projections. Nonsplit bounds use Γ-orbits and dominance; arbitrary repetition need not preserve a split tuple verbatim. |
| `HS1/monoidality-of-hecke-operators` | verified | FS IX.2 pp.321–323 and VI.9–VI.12 pp.226–239: verified convolution of the relative-dual solid kernels and the monoidal unit/operator isomorphisms. Perfect-support and enhanced colimit-preserving tensor inputs are cited precisely; ExactPairing supplies ordinary triangular algebra only. |
| `HS2/structure-map-compactifiable` | verified | FS IX.3.2 p.326, SW 23.5.2 p.223 and III.5 pp.102–106: verified compactifiability, representability and finite dim.trg at compact-open level. The nonbasic Mod/K partial-properness/Banach–Colmez argument is recorded as a geometric gap, not reduced to discreteness of J_b(E). |
| `HS2/weil-descent-datum` | verified | SW 23.1/23.4 pp.216–222 and GLX 3.5 pp.822–823: independently derived ψ_Gr=b_f·ψ_can and its iterates bσ(b)⋯σ^{n−1}(b) from b·φ* h=h. The b=1, central and torus tests fix the direction and inverse-action convention. |
| `HS3/hecke-operators-between-strata` | verified | FS IX.3 p.325, III.5 pp.102–106 and IX.7 pp.335–337: verified i_b* T_V L_{b′}, with L_{b′} left adjoint to restriction. The nonbasic source is not replaced by ordinary i_!; geometric compact support there remains a gap. Basic inner-form, unit, torus and Huber tests match the source/target signs. |

## Source-issue review

Every E1–E46 entry has a new `review` naming this job, a `confirmed` verdict and an independently written mathematical reason at its existing locator. I confirmed errors as errors and proof gaps as gaps: E2 and E38 do not disprove the asserted comparison, E22 does not supply an unproved general compactness theorem, E45 does not import characteristic-zero semisimplicity into integral coefficients, and E46 does not dispute the final parameter-compatibility theorem. The source versions and printed locators, including known atlas finding ids, are unchanged. No new source error was inferred from the empty-locus defect, which arose in this packet's extrapolation rather than the quoted theorem.

| Entry | Verdict | Source locator |
| --- | --- | --- |
| `E1` | confirmed | FS-geometrization: Chapter III, §III.3, Proposition III.3.6(ii), p. 100, and item (ii) of the non-split case on the same page (author-hosted 356-page copy) |
| `E2` | confirmed | SW20-berkeley: Lecture 23, Remark 23.4.3 and the proof of Proposition 23.4.2, p. 222 (print-ready copy of 27 March 2020) |
| `E3` | confirmed | SW20-berkeley: Lecture 23, Proposition 23.4.2 (p. 222) and Definition 23.5.1 (p. 223) (print-ready copy of 27 March 2020) |
| `E4` | confirmed | FS-geometrization: Chapter IX, introduction, p. 317, and §IX.2, pp. 321–322 (author-hosted 356-page copy) |
| `E5` | confirmed | FS-geometrization: Chapter VI, §VI.2, Definition VI.2.6, p. 200 |
| `E6` | confirmed | SW20-berkeley: Lecture 20, Definition 20.4.2 and Definition 20.4.4, p. 187 |
| `E7` | confirmed | FS-geometrization: Chapter III, §III.3, p. 100, non-split case, item (i) |
| `E8` | confirmed | FS-geometrization: Chapter VII, §VII.7, Proposition VII.7.9, p. 275 |
| `E9` | confirmed | FS-geometrization: Chapter VII, §VII.7, Proposition VII.7.10, p. 276 |
| `E10` | confirmed | FS-geometrization: Chapter IX, §IX.2, proof of Theorem IX.2.2, last sentence, p. 323 (author-hosted 356-page file) |
| `E11` | confirmed | SW20-berkeley: Lecture 22, §22.4, p. 210 (paragraph after Definition 22.4.1), and Lecture 23, Remark 23.1.3, p. 217; print-ready file of 27 March 2020 |
| `E12` | confirmed | SW20-berkeley: Lecture 23, proof of Proposition 23.3.1, p. 218; print-ready file of 27 March 2020 |
| `E13` | confirmed | SW20-berkeley: Lecture 23, Proposition 23.3.1 (first bullet), p. 218, and the description of Sht_{G,b,µ,∞}, p. 219; print-ready file of 27 March 2020 |
| `E14` | confirmed | SW20-berkeley: Lecture 23, §23.1, the two displays of the second paragraph, p. 216, and Definition 23.1.1, third bullet, p. 217 (the first display is printed in both places); print-ready file of 27 March 2020 |
| `E15` | confirmed | SW20-berkeley: Lecture 23, §23.4, first display, p. 221; print-ready file of 27 March 2020 |
| `E16` | confirmed | SW20-berkeley: Lecture 23, proof of Proposition 23.2.1, p. 218; print-ready file of 27 March 2020 |
| `E17` | confirmed | GLX26-published: Proposition 6.6(1), (6.4), p. 849, and Step 1 of its proof, p. 850 (published version) |
| `E18` | confirmed | GLX26-published: Lemma 3.2, p. 820, and the proof of Proposition 3.12, p. 828 (published version) |
| `E19` | confirmed | HK23v2: Proposition 7.3.3, p. 43 (arXiv v2) |
| `E20` | confirmed | GL22v2: Proof of Theorem 3.2, p. 10 (arXiv v2) |
| `E21` | confirmed | FS-geometrization: Chapter IX, §IX.3, Proposition IX.3.2, p. 326; the same omission in Chapter I, §I.7, Corollary I.7.3, pp. 31–32, and in the sentence after the proof of Theorem IX.3.1, p. 325 (author-hosted 356-page copy) |
| `E22` | confirmed | FS-geometrization: Chapter IX, §IX.3, Proposition IX.3.2, last sentence, and the end of its proof, pp. 326–327; the same sentence in Corollary I.7.3, p. 32 |
| `E23` | confirmed | FS-geometrization: Chapter IX, §IX.3, the two sentences after Theorem IX.3.1, p. 324 |
| `E24` | confirmed | FS-geometrization: Chapter IX, §IX.3, first paragraph and proof of Theorem IX.3.1, p. 324; compare §IX.7.2, proof of Corollary IX.7.3, p. 337, and §IX.7.3, proof of Theorem IX.7.4, p. 338 |
| `E25` | confirmed | FS-geometrization: Chapter IX, §IX.3, displayed chain of isomorphisms on p. 325, second line |
| `E26` | confirmed | FS-geometrization: Chapter IX, §IX.3, proof of Proposition IX.3.2, p. 326 |
| `E27` | confirmed | FS-geometrization: Chapter IX, §IX.3, first line of p. 326; the same in Chapter I, §I.7, p. 31 |
| `E28` | confirmed | SW20-berkeley: Lecture 24, proof of Theorem 24.2.5, pp. 227 and 228 (two displays) |
| `E29` | confirmed | SW20-berkeley: Lecture 24, §24.3, footnote 1, p. 230 |
| `E30` | confirmed | SW20-berkeley: Lecture 24, proof of Corollary 24.3.5, p. 231, first sentence |
| `E31` | confirmed | FS-geometrization: Chapter IX, §IX.6.1, proof of Theorem IX.6.1, p. 331 |
| `E32` | confirmed | FS-geometrization: Chapter IX, §IX.6.1, Theorem IX.6.1, p. 330, the diagram |
| `E33` | confirmed | FS-geometrization: Chapter IX, §IX.6.1, proof of Theorem IX.6.1, p. 330 |
| `E34` | confirmed | FS-geometrization: Chapter IX, §IX.6.1, proof of Theorem IX.6.1, p. 331, sentence after the displayed computation |
| `E35` | confirmed | FS-geometrization: Chapter IX, §IX.6.2, Proposition IX.6.2, p. 331, top row of the diagram |
| `E36` | confirmed | FS-geometrization: Chapter IX, §IX.6.2, Proposition IX.6.2, second paragraph, p. 331 |
| `E37` | confirmed | FS-geometrization: Chapter IX, §IX.6.3, proof of Proposition IX.6.3, p. 332 |
| `E38` | confirmed | FS-geometrization: Chapter IX, §IX.6.3, proof of Proposition IX.6.3, p. 332, second half |
| `E39` | confirmed | FS-geometrization: Chapter IX, §IX.7.1, p. 334, the formula for Z¹(W_E, Ĝ_b) → Z¹(W_E, Ĝ) |
| `E40` | confirmed | FS-geometrization: Chapter IX, §IX.7.1, proof of Theorem IX.7.2, pp. 335–336 |
| `E41` | confirmed | FS-geometrization: Chapter VIII, §VIII.4, first line of p. 291 |
| `E42` | confirmed | SW20-berkeley: Lecture 23, §23.3, the two paragraphs before the display of the period morphism, p. 220 (lines 1, 4 and 11 of the page); print-ready file of 27 March 2020 |
| `E43` | confirmed | GL22v2: Section 3, the sentence after (3.1) and the definition of d^M_{μ,b} before Theorem 3.2, p. 10 (arXiv v2) |
| `E44` | confirmed | SW20-berkeley: Lecture 24, §24.3, paragraph before Definition 24.3.2, p. 230 (print-ready copy of 27 March 2020) |
| `E45` | confirmed | FS-geometrization: Chapter IX, §IX.5, proof of Proposition IX.5.1, p. 328 |
| `E46` | confirmed | FS-geometrization: Chapter IX, §IX.7.1, proof of Theorem IX.7.2, pp. 336–337 |

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/HeckeStacksAndLocalShtukas.json`: 0 errors, 0 warnings, with the available declaration index. Baseline statements were independently read at the pins as well.
- `lean-check research/blueprint/suggested/HeckeStacksAndLocalShtukas.lean`: exit 0 at the pinned Mathlib. All 999 warnings are `declaration uses sorry`; there are no errors or other warning kinds. Available memory was above 20 GB before elaboration, and only one check was run at a time.
- Reader projection comparison: 2,298 fields, zero mismatches. No internal or reachable cross-packet dependency cycles found.
- Every definition/construction has at least three tests; every API name and named test occurs in the suggested file; source PDF hashes match all eight records; `git diff --check` passes.

## Questions and follow-up for the orchestrator

These do not block acceptance of the completed pass and are not extra jobs claimed by this worker.

1. Queue the BG2 uniformization sign reconciliation. The exact three affected exports and required inverse-orientation dictionary are in the extended request and ninth gap; this review edits no foreign packet.
2. Carry the two all-prime representation-theory requirements into the design of `ReductiveGroupsIntegralRepresentationsPartII`. The registered Tau Ceti parent is a routing anchor, not a theorem proving those extensions.
3. Preserve the existing rescope proposals and eight prior gaps when scheduling lemma-level work, especially classical EL/PEL comparison, Huber/diamond compact support, non-minuscule component openness and compactness for general compact ρ.
4. Publish the synchronized reader together with the corrected packet if intake accepts this review. No manual promotion or atlas-data edit was performed here.
