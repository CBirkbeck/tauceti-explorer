# Independent review of Enriques surfaces and integral nonexistence

Accepted as a complete **target-level planning pass**, under PROTOCOL §0. This is not acceptance of mathematical proof closure or a claim that either nonexistence endpoint is formalized. The thirteen recorded gaps include classification exhaustiveness, the three omitted configurations, authorized foundational proof acquisition and precise supplier extensions. All nine layers are planned; none is closed.

Reviewer: Codex, session `codex-ZNqdCO`, job `REV-DESIGN-EnriquesSurfacesAndIntegralNonexistence`, issue #3524, 11 October 2026. The input was authored in another session (`codex-Wh8ysM`). This reviewer did not author it.

| Inventory | Before | Reviewed |
| --- | ---: | ---: |
| Nodes | 101 | 112 |
| Definitions / constructions | 12 / 5 | 12 / 5 |
| Theorems / lemmas | 83 / 1 | 94 / 1 |
| API items | 72 | 80 |
| Discriminating test specifications | 56 | 56 |
| Planets | 33 | 33 |
| Pinned baseline declarations | 10 | 10 |
| Supplier requests / contracts | 11 / 4 | 11 / 5 |
| Gaps | 10 | 13 |
| Source issues independently checked | 13 | 15 |
| Explicit prototype omissions | 98 | 109 |

The packet contains one review verdict for every node: 101 corrected and 11 added. The correction count includes replacing the blanket hypotheses on every original node with its own domain. All implementations remain `unchecked`.

## What changed

**Domains and closure.** Replaced the layer-wide hypotheses that, for example, assumed a surface was already Enriques when defining `IsEnriques`, imposed an integral family on a finite-field count, or imposed candidate-classification gates on elementary incidence enumeration. The definition takes any smooth proper surface over any field. Families retain the flat proper finitely presented algebraic-space scope. Full Picard, constant Num, splitness, classical type, nonexceptionality, field characteristic, fibre multiplicity and classification gates are separately stated wherever needed. Pure matrix and incidence calculations no longer require geometric realizability or the later exclusions.

`E3/finite-field-point-count` now supplies counts for any constant-Num Enriques surface over a finite field, including extensions of that field. `E3/num-over-z` specializes it after proving constancy over the integers. `E4/jacobian-enriques-fibre-counts` and the quasielliptic component calculation use this independent theorem. The count proof also identifies the finite-index descent of numerical divisor classes needed for the cycle-class comparison; trivial numerical Galois action alone is not silently substituted for line bundles over the ground field.

Added finite-field specialization of Picard descent, labelled fibre descent, and the general Enriques `I₀*` exclusion. These apply to elliptic and quasielliptic fibrations. The elliptic Jacobian adapter transfers that exclusion using its local comparison theorem. All later Enriques-only uses, including the multiple-`I₄*` argument, use the general exclusion. Reducible fibres are rational and their smooth rational components split; an irreducible singular component is only asserted to have rational normalization.

**Foundational Enriques steps.** Added the nef primitive-isotropic half-fibre criterion, effective-divisor nef reduction, and the lower bound four for intersections of full fibres of distinct fibrations. The last gives the missing prerequisite in the final simple-`III*` contradiction. Its proof uses the positive-cone equality case, primitive half-fibre classes and rank-two Picard torsion to rule out distinct pencils with intersection zero.

The original broad degree-two reducibility assertion was not justified by the unread Lang theorem. It is now the narrower acquisition contract actually used in E6: preserve the nonzero generic degree-zero class translated by an existing integral two-section, obtaining an integral representative of square zero or −2. The general integral-two-section existence target cites Proposition 4.1 independently and no longer depends on that narrower contract. Both remain honest proof-acquisition obligations. The generic Picard quotient explicitly assumes classicality and retains its separate infinite degree summand.

**Exceptionality and lifting.** Added the exact special-double-fibre characterization of exceptionality and the implication from extra-special affine E₈ to exceptional, using [ESB21, Theorem 4.2 and Corollary 4.3, pp. 13–14](https://arxiv.org/pdf/math/0405510v2). This closes the previously unnamed implication used by the nonexceptional partner argument and the characteristic-two part of the arbitrary-characteristic restricted-configuration argument. The simple quasielliptic restriction cites Proposition 3.16 and its proof, pp. 12–13. The general partner theorem retains its authorized older-proof acquisition gap; its characteristic-independent statement is [MMV22, Theorem 1.2 and Remark 1.5, p. 2](https://arxiv.org/pdf/2201.05481v1).

Added tangent cohomology and a separate supersingular nonlifting target. The latter applies the Pic⁰=α₂ obstruction of [DI21, Proposition 4.2 and Theorem 4.3, pp. 15–17](https://www.math.uni-duesseldorf.de/~schroeer/publications_pdf/DeligneIllusie_2021.pdf). It cannot be replaced by the exceptional-classical differential criterion, whose canonical bundle has exact order two. `E8/w2-lifting-criterion` now specifies the supersingular, exceptional-classical and unobstructed branches; miniversal deformation also directly depends on the tangent calculation.

**Supplier ownership.** Read the actual current upstream contracts at roadmap commit `c251d2e42c66f14c279d1e5c2708c5a91d8c8aec` and current Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, independently of the pinned baseline.

- IntegralLattices Layer 6A owns indefinite even-unimodular uniqueness. Added its import-registration contract and gap because the atlas exposes only the built Completed layers 1–5. No second classifier is planned here; the geometric Num comparison remains local.
- JacobianChallenge Layer D v1 requires a smooth pointed curve; unpointed/Pic¹ work is v2. Layer E concerns abelian varieties. Removed its prerequisites from surface Picard representability, surface line-bundle descent, the unpointed/quasielliptic Jacobian constructor and generic restriction quotient. Its reusable smooth pointed interface remains requested for geometric Mordell–Weil work. The proposed genus-one supplier explicitly owns the missing unpointed and nonsmooth extensions.
- AlgebraicVectorBundles owns invertible-sheaf tensor and relative-Spec foundations, rather than a general surface Picard-group theorem. Corrected the import description and consumer to the canonical rank-two algebra. Current native CartierDivisor/Picard objects are not asserted to be in the older pin.
- A0-extension needs an explicit proper-flat surface Picard representability/base-change/flatness extension. E2 proves the Enriques improvement to a scheme. SF.2 supplies fppf Leray, Kummer, Cartier-dual torsor correspondence, cohomological Brauer and cycle-class interfaces, rather than representing arbitrary surface Picard functors.
- LocalFieldsRamification supplies Q₂ unit filtration and the unramified quadratic model. The four global twists come instead from the elementary units of Z[1/2] and Kummer. Replaced every request's generic placeholder by its exact mathematical interface, including SF.4/R07.1 nonlifting boundaries and the Weil trace/Tate-twist convention.

**Local models and sources.** Corrected the numerical-Picard supplier/gap that contradicted the existing local-projectivity proof. In the section case, the section splits the Picard obstruction: the theorem needs no additional H²(R,G_m)=0 assumption. The separate arbitrary-affine descent package retains cohomological Brauer vanishing. Checked [Stacks §99.11, Lemma 99.11.4](https://stacks.math.columbia.edu/tag/0D24) and the closed-fibre ample-locus statement [Lemma 74.13.2](https://stacks.math.columbia.edu/tag/0D3D), together with the cited Henselian section tags.

Replaced the erroneous Fontaine pp. 514–515 citation by [the public author preprint 91-02, Theorem 1 and Remark (a), printed p. 3, PDF p. 4](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf). Read its statement and local-model hypothesis, not its full proof. Its proper smooth scheme-model hypothesis is satisfied by the project's stronger projective local models. The general Hodge-number obstruction remains supplier work.

**API, tests and prototype.** Added the defining conjunction API, half-fibre extensionality and doubled-divisor simplification, the two-section intersection characterization, conductrix uniqueness, biconductrix simplification, family isomorphism transport and the exact split-plus-étale-plus-constant-Num converse. All seventeen definition/construction nodes retain at least three discriminating tests. Their statements were checked against the relevant uses; geometric tests are specifications, not executed Lean examples. The 33 planets remain key definitions, constructions or central theorems, rather than proof cases. Regenerated all 109 geometric omission records and the suggested-file inventory. Proved both finite Gram symmetries and both basis-pairing equalities using the native API; the remaining placeholders are honest future proofs.

## Added nodes

| Node suffix | Why needed; source |
| --- | --- |
| E1/nef-half-fibre | Linear-system criterion; MMV22 Lemma 2.1, p. 3 |
| E1/nef-reduction | Effectivity/reflection step in fibration existence; MMV22 Lemma 2.3, p. 4 |
| E1/distinct-fibration-intersection | Full-fibre minimum four; derived from primitive nef classes, applied in SCH23-author p. 47 |
| E1/exceptional-fibration-characterization | Exact special double IV*/III*/II* criterion; ESB21 Theorem 4.2, pp. 13–14 |
| E1/extra-special-is-exceptional | Partner exception implication; ESB21 Corollary 4.3, p. 14 |
| E2/finite-field-descent-specialization | Pic(k) and cohomological Brauer vanish; SCH23-author Proposition 3.1 / Theorem 5.6 |
| E2/genus-one-fibre-descent | Rational reducible fibres and split graphs; SCH23-author Theorem 2.1 / Proposition 3.1, pp. 8–11 |
| E2/no-i0-star | Four rational attachments on P¹(F₂) impossible; SCH23-author Proposition 3.2, p. 11 |
| E3/finite-field-point-count | Removes the Z-family domain from the count; SCH23-author Proposition 7.1 / Corollaries 7.2–7.3, pp. 20–21 |
| E8/tangent-cohomology | Explicit deformation dimensions; DI21 Proposition 7.1, p. 23; ESB21 Proposition 2.8(6), pp. 6–7 |
| E8/supersingular-nonlifting | Distinct Pic⁰=α₂ obstruction; DI21 Theorem 4.3, pp. 16–17 |

All carry `addedBy` with this review job. The packet's per-node table records the corrected fields and relevant open proof obligations.

## Pinned baseline and validation

All ten citations were checked from their exact pinned Git objects: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Full statements and constraints were read, and the relevant source files match the shared compiler build byte for byte. No baseline citation was removed or renamed.

| Declaration | Module / line | Convention or required adapter |
| --- | --- | --- |
| Pi.basisFun | Mathlib/LinearAlgebra/StdBasis, 122 | Finite coordinate basis |
| bijective_algebraMap_int_of_finite_of_unramified | Mathlib/NumberTheory/NumberField/ExistsRamified, 58 | Module-finite, unramified, faithful domain; finite-étale decomposition adapter is requested |
| hensels_lemma | Mathlib/NumberTheory/Padics/Hensel, 461 | Strict norm(F(a)) < norm(F′(a))²; dyadic 1 mod 8 satisfies the square-root specialization |
| TauCeti.IntegralLattice | IntegralLattice/Basic, 61 | Full integral lattice in rational space; not a private numerical lattice type |
| d8PlusLattice | RootLattice/D8Plus/Basic, 164 | Positive E₈; geometric comparison negates the form |
| discriminantQuadraticMap | Discriminant/Quadratic, 122 | Requires evenness, half-norm in Q/Z |
| evenIntermediateCarrierOrderIsoIsotropicSubgroup | Overlattice/Isotropic, 343 | Even carriers correspond to quadratic-isotropic, not merely bilinear-isotropic subgroups |
| hyperbolicPlane | IntegralLattice/Examples, 81 | Diagonal zero, off-diagonal one |
| integralForm_ofGramMatrix_apply | IntegralLattice/Basic, 285 | Native carrier basis recovers Gram entries |
| ofGramMatrix | IntegralLattice/Basic, 251 | Symmetric integer Gram matrix on a finite rational basis; no nondegeneracy requirement in constructor |

The reviewed library-coverage entries for Completed/IntegralLattices layers 1–5 were read. Built discriminant and overlattice theory is reused; only these two concrete configurations and their geometric comparison are targets.

Validation on 11 October 2026:

- `python3 scripts/check_blueprint.py research/blueprint/packets/EnriquesSurfacesAndIntegralNonexistence.json`: **0 errors, 0 warnings**, all nine layers planned.
- `lean-check research/blueprint/suggested/EnriquesSurfacesAndIntegralNonexistence.lean`: exit 0, **eleven permitted proof-placeholder warnings**, no other warnings or errors, at the pinned build.
- Independent exact rational Gaussian elimination: both determinants −4, even diagonals, rank eight modulo two (hence Smith factors 1⁸,2,2), and the inverse coefficients giving square 2n.
- Exhaustive nonnegative weighted-degree-two enumeration: D̃₈ has fifteen vectors / six orbits under eight automorphisms; Ẽ₇ has six / four under two. The inverse-matrix half-norm test selects exactly {0,7}, {0,8}, {1,7}, {1,8}. Dyadic representatives give all eight valuation-parity/odd-unit-residue pairs. These arithmetic checks prove neither geometric realization nor the rational-Jacobian list's exhaustiveness.

All thirteen inherited source issues are confirmed at the pinned public author locators with independent reasons. E6 imports the canonical three-model finding with its attribution; no exhaustive search or full published-version inspection was claimed by this reviewer. Added two DI21 misprints at p. 23: χ(Θ) is −10, and the canonical-cover invariants belong to X rather than Y. Neither changes the intended theorem statements. Sources are paraphrased with numbered locators; no passages or uncleared books were copied.

## Orchestrator actions and reader synchronization

The reader file was **not an authorized deliverable** of this issue. It still contains the older contracts. Before packaging, synchronize it from the reviewed packet, specifically:

1. Replace every target's blanket hypothesis paragraph with its reviewed `hypotheses`, including the classical generic-Picard condition and the independent arithmetic domains.
2. Insert all eleven added targets in their E1/E2/E3/E8 layers, with their proof contracts and source locators; replace the narrower degree-two contract and its changed existence dependency.
3. Update the finite-field count and quasielliptic/I₀* edges, the partner/exceptionality argument and the three lifting branches. Preserve all fourteen candidates, their E_n/Ĩ_n conventions, and both explicit classification gates on every later certified-table use.
4. Replace the four upstream import descriptions and all supplier requests/contracts; record the unregistered IntegralLattices Layer 6A import, general surface-Picard extension, and foundational source-acquisition gap.
5. Remove the claim that local projectivity with a section needs Brauer vanishing. Use the Fontaine preprint's exact edition/locator, the new source-issue verdicts, eighty API items, and 109 honest prototype omissions. Carry the revised gap lists and the compiled prototype status.

The maintainer should assign concrete layer ids to the proposed numerical-Picard, genus-one, K3 and Fontaine suppliers and the current IntegralLattices import. The surface Picard extension must be assigned within A0-extension's direction. Acquire authorized proofs for the foundational Enriques, partner and coset-preserving reducibility targets. Keep /247 completeness and /246 exclusions as separate mathematical obligations; the former's model evidence does not prove the latter. The full reader synchronization is necessary for a reviewable upstream package; this acceptance authorizes the blueprint planning result, not a package with the stale reader.
