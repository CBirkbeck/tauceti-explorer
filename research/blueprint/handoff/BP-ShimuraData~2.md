# BP-ShimuraData~2 — revision handoff

Issue [#7009](https://github.com/CBirkbeck/tauceti-explorer/issues/7009). Agent: Codex (GPT-6), session **codex-HpHgRn**. The bot confirmed this session's claim. This run completes one planning revision of D0–D5, for independent review.

The deliverables are the [packet](../packets/ShimuraData.json), [reader](../readmes/ShimuraData.md) and [suggested file](../suggested/ShimuraData.lean). The binding previous report is [REV-ShimuraData](../reviews/REV-ShimuraData.md). The packet's historical `review` object is preserved exactly, including its `needs_changes` status and all individual verdicts. This author has not accepted their own work; the next independent reviewer decides whether the revisions meet the findings.

## Completion and counts

The packet has status **complete** as a planning pass. D0, D1, D2, D3, D4 and D5 are each **planned**; **none is closed**. Every implementation status remains **unchecked**. There are 122 nodes: 19 definitions, 25 constructions, 52 lemmas and 26 theorems; 140 definition/construction API items plus two categorical comparison APIs; 132 proposed unit tests; 27 planets; 34 baseline citations; 26 exact supplier requests; and ten explicit gaps. A complete planning pass with these requested leaves does not assert a complete proof or implementation.

All 118 inherited node IDs, including the three review-added lemma nodes, are retained. No inherited baseline citation, planet or source-issue verdict was removed. The revised reader now includes the reviewer-added MT connectedness/reductivity and real-orbit component lemmas, all 16 corrected source issues, the accepted ownership changes, the APIs and tests, and the precise open leaves. Its layer register agrees with the packet.

Four additional declaration-sized nodes expose objects that the repaired comparison and variation APIs need:

- D1/graded-hodge-category: finite graded real Hodge objects, real-linear bidegree-preserving morphisms, category laws and extensionality.
- D1/graded-hodge-of-representation: assembling the whole finite real weight grading from an actual finite real Deligne-torus comodule.
- D3/variation-morphism: local-system morphisms preserving the holomorphic filtration and commuting with connection, with identity, zero, composition and extensionality.
- D3/rational-polarized-variation: the rational local system, real filtered flat bundle, natural scalar-extension comparison and parallel full Hodge–Riemann form retained by rationalization.

These contribute 18 definition/construction APIs and 12 tests. The categorical equivalence also adds the two named morphism/naturality interfaces. The existing pure Hodge operations and comodule category, tensor and dual are reused.

## Response to the 48 signature/test findings

These are author revisions corresponding to the historical `unverifiable` entries, not replacement review verdicts. Each row names the inherited node suffixes whose objects, conclusions or tests changed.

| Stage and affected nodes | Revision |
| --- | --- |
| D1: hodge-decomposition-of-representation; conjugation-pieces | The input is a real finite comodule with the supplier's split Hopf algebra and scalar-extension comparison. Conjugation of the coaction combines coefficient conjugation and the character swap; piece conjugation follows from that equation. Tests use specified trivial, norm and standard real comodules and their actual weight spaces. |
| D1: representation-of-hodge; comparison-roundtrip; representation-hodge-equivalence | The inverse returns a real comodule including counit and coassociativity. The forward map assembles all real weights. The two functors act on real-linear Hodge/comodule morphisms; the equivalence has unit, counit and triangle compatibility. Round trips compare the real coaction and the complete grading, rather than only native pure decomposition. The pure equivalence remains an input. |
| D1: tensor-comparison; dual-comparison; tate-comparison | Conclusions are isomorphisms comparing the representation tensor/dual/norm twist with the graded Hodge operations. The representation tensor and dual are the pinned finite-comodule operations. |
| D1: rational-weight-criterion | The iff now compares rational cocharacter descent with a rational internal weight grading whose scalar extension is the actual real grading. It does not assume the grading and merely return coverage. |
| D1: elliptic-homology-object | The conclusion compares the supplier's geometric elliptic homology Hodge comodule with the explicit homology action. Matrix eigenvectors remain auxiliary calculations. The H0 geometric comparison is an exact request. |
| D1: mumford-tate-group; hodge-generic | MT is specified by the sum/supremum of rational defining Hopf ideals on which the algebraic h vanishes; its quotient is a rational algebraic subgroup. Genericity tests concern actual elliptic and product rational Hodge objects, including a non-generic square and a transcendental parameter. The elliptic MT classification is independently requested from H0/H1, without a CM.0 cycle. |
| D2: tangent-quotient | The result identifies the quotient of the actual Lie algebra by the stabilizer Lie algebra with the homogeneous orbit tangent, and includes the orbit differential comparison. |
| D2: adjoint-bracket | Degree addition is derived from torus equivariance of the bracket and the character actions, rather than supplied as a grading-closure hypothesis. |
| D2: hodge-integrability; hermitian-domain-components | Results construct an actual complex manifold with the Hodge tangent J, then identify each of finitely many components with a bounded symmetric domain. The domain carrier includes openness, connectedness, boundedness and holomorphic involutive symmetries with differential minus identity. Analytic quotient, Cartan and faithful tangent comparisons are explicitly omitted supplier conditions. |
| D2: unique-complex-structure | The criterion uses holomorphy of the faithful Hodge period map for both atlases and concludes holomorphy of the identity comparison. It does not assume equality of the tangent operators as its premise. |
| D3: variation; flat-bundle-local | The construction gives the flat holomorphic bundle, local flat frames, compatible holomorphic transitions/transport, connection, finite holomorphic subbundle filtration and actual Griffiths condition. The nonhorizontal rank-four weight-three example rejects the variation predicate through its failed filtered derivative. |
| D3: polarized-integral-variation | Finite free integral local systems, the real filtered flat bundle and fiberwise native polarizations are retained. Rationalization returns the complete rational polarized variation, including its local system, filtration, comparison and parallel form. Tests check Tate, scaling by two and nontrivial cusp monodromy; a negative form is rejected by positivity. Natural scalar-extension and sheaf comparison conditions remain explicitly omitted. |
| D3: homogeneous-variation; homogeneous-horizontal | Fiber Hodge structures are those of the actual representation restricted along h at each domain point. Tensor and pullback statements compare full variations; transversality uses SV1 and the equivariant representation differential. |
| D3: filtration-parabolic; compact-dual | The Lie stabilizer preserves each actual filtration subspace; its Levi is the grading/cocharacter centralizer. The compact dual uses the corresponding group quotient, scheme and tangent carriers. The genus-two test is the dimension-three isotropic Lagrangian Grassmannian with its actual symplectic stabilizer. |
| D3: borel-tangent; borel-injective; borel-embedding | The map is the actual faithful representation's period map. The results derive the tangent isomorphism, injectivity and holomorphic open embedding. These conclusions are no longer input hypotheses. Faithfulness, SV1 and central weight remain the complete statement's requirements. |
| D3: reflex-field | The construction is the fixed field of the Galois stabilizer of the geometric cocharacter conjugacy class. GL2, imaginary-quadratic CM and product tests refer to these classes. No rational representative or rational parabolic point is inferred. |
| D4: datum-morphism | A contravariant rational coordinate Hopf map produces its real-point map through the point dictionary. Algebraicity is built into the object; the tests include projection, a torus norm and rejection of an irrational-power continuous point homomorphism. |
| D4: central-isogeny-lift | The fixed isogeny is rational algebraic, geometrically surjective and has finite central kernel. A supplied algebraic lift of the chosen S-map gives the lifted full-orbit datum, the adjoint comparison and uniqueness for that fixed lift problem. No unconditional existence is asserted. |
| D4: special-pair; special-point; special-image | A pair uses an actual rational algebraic torus, closed rational coordinate immersion and algebraic S-factorization. Image preservation takes the rational scheme-theoretic torus image. Tests use the actual GL2 elliptic points at i and at sqrt(2)+i; their distinction depends on the separately requested Hodge-endomorphism classification. |
| D4: hodge-type | The witness is a rational closed datum immersion into a specified Siegel model. The weight theorem concludes rational descent of the weight cocharacter, rather than just centrality. Tests instantiate Siegel, GL2 and Hilbert G-star. |
| D4: abelian-type; preabelian-type; type-implications | Witnesses compare chosen connected domains of canonical rational adjoint groups. They do not require a map between full real orbits. Abelian type adds a canonical derived central isogeny and its commuting quotient square. The counterexample tests conjugation by diag(2,1) against a fixed identity derived map. Real quadratic Hilbert G and G-star test their different full-orbit component counts (four and two). |
| D5: effective-free | Neatness of every rational element is an input; torsion-freeness of the effective group is not. The algebraic real quotient, faithful representations and tensor-generation/eigenvalue comparison transfer neatness, after which finite effective stabilizers are trivial. Discreteness and properness remain the explicit analytic qualification. |
| D5: cm-torus | The supplier CM type uses an actual finite CM field and one choice from each canonical conjugate embedding pair. Its cocharacter is one on the chosen embeddings and zero on their conjugates. Reflex stabilization tests the type's actual Galois action. The rank-two example is the specified field Q(i), not an arbitrary CM field with an assumed reflex result. |
| D5: gl2-datum; gl2-types | The rational coordinate algebra is the pinned GL2 algebra, with the explicit real homology action. APIs identify its two half-plane components, rational reflex field, projective-line compact dual and actual adjoint comodule ranks. Genus one is compared with the actual Siegel datum. |
| D5: siegel-datum; siegel-lie-types; siegel-reflex-dual | The model is the rational symplectic similitude datum with the explicit real homology action. Its domain is the symmetric-matrix positive/negative imaginary half-spaces. The actual adjoint comodule has dimensions g(g+1)/2, g²+1, g(g+1)/2; its cocharacter/reflex and isotropic compact dual are tied to this model. |
| D5: hilbert-datum; hilbert-star-datum | Both models use an actual finite totally real field and its embeddings, affine restriction coordinate suppliers and explicit componentwise h. Geometry gives all 2^d components for G and two common-sign components for G-star. Tests use Q and the specified field Q(sqrt(2)); reflex and compact-dual APIs concern those data. Nonaffine compact-dual representability remains a gap. |
| D5: hilbert-trace-embedding | The output is the faithful rational closed datum immersion G-star into GSp of rank 2d. The trace-pairing identity and faithful linear action remain auxiliary results. In a rational symplectic basis h maps to a real conjugate of the standard Siegel h, as full-orbit compatibility requires. |
| D5: gsp4-compact-cartan | The construction is now the actual positive-scalar times two-rotation real matrix subgroup, isomorphic to positive real units times U(1)². The parity character lattice is a separate object; its character descent test rejects a coordinate character failing parity. The complex exponential and extra kernel coset are retained. |

## Corrections retained and independently rechecked in this run

The review's three new lemma nodes remain: D1/mumford-tate-connected, D1/mumford-tate-reductive and D2/orbit-finite-components. Connectedness is separated from reductivity, polarizability remains essential, and the domain theorem depends on the finite-component lemma. Finite-dimensionality and the real weight grading's constructor/extensionality API are retained. The MT weight conclusion concerns the image of the weight, including the trivial image for a trivial object. The MT ideal order is reversed correctly: subgroup intersection corresponds to a sum of defining ideals.

Other retained mathematical corrections include the general SV1 input for Cartan involution; compact real factors allowed under rational SV3; Borel's SV1/central-weight qualification; uniqueness of a lift through a fixed central isogeny; the finite joint adjoint/abelian kernel; reflex flag descent to an E-model with complex base-change comparison and no asserted E-point; scheme closure statements as underlying-locus unions; representation independence over subfields of C; principal congruence inputs from D5/AA.3 rather than downstream V0; and local generated-products neatness for every element of the level, certified at one place.

All 16 source issues retain their independent `confirmed` verdicts. The corrected formulas and printed locators were checked against the exact-hash source copies listed in the reader:

| Issue | Retained correction |
| --- | --- |
| E1 | M-mu is the centralizing Levi, not the unipotent radical. |
| E2 | Minimal left representatives test positive Levi roots. |
| E3 | BP inverse-index inequalities use the cyclic order g+1,…,2g,1,…,g, including the genus-two counterexample. |
| E4 | The p.60 error is the words “Schubert cell” for closed varieties; the printed closure formulas already use X correctly. |
| E5 | The second diagonal character exponent in CG is b. |
| E6 | The a,b swap is the Levi longest element; the full longest negates both and changes the similitude coordinate. |
| E7 | Kh is positive scalars times U(2); negative orthogonal similitudes do not commute with J. |
| E8 | The actual printed transposition is K1,infinity instead of Kinfinity,1. |
| E9 | The exponential kernel includes the extra (pi,pi;pi i) coset. |
| E10 | The fixed angular/scalar coordinates satisfy a+b=c mod 2; the abstract rank-three lattice is still isomorphic to Z³. |
| E11 | The printed positive system is valid, but its declared simple pair/coroot is incompatible. The lower Borel uses simples e2−e1 and −2e2+e3, coroots f2−f1 and −f2, and rho (−2,−1;0). BP has a different compact order. |
| E12 | The identity in the rank-four homology action is I4. |
| E13 | The LieGSp equation has the differential similitude term; its middle dimension is g²+1. |
| E14 | The homology inverse-diagonal weight acts by t inverse. |
| E15 | Products and inverses of eigenvalues must satisfy the local bound before excluding generated torsion. |
| E16 | The parabolic PW stabilizes W, as its line/plane examples require. |

No new independent source-issue verdict or author corrigendum is claimed. The existing correction-search records and credits remain intact. Deligne's scan was read visually at printed pp.251–256 and 265–267 because the text extraction did not provide those pages.

## Supplier ownership and the handed-on red-team finding

Accepted RS-04, RS-23 and RS-31 ownership is preserved. RG2.0a owns the Deligne torus and affine restriction of scalars; native Hodge H0/H1 own pure structures and polarizations; native R1 owns finite comodules, tensor/dual and effective descent; R7/R9 own absolute root/Weyl and integral flag geometry; RG2.5 supplies symplectic dualization. D5 constructs the rational Hilbert G/G-star data and trace immersion. CM.0 is imported only at D5; it consumes D3, so it is not used backward to discharge D1/D4 elliptic tests. D5 requests component freeness conditional on discrete effective image; ShimuraVarieties V0 remains downstream and proves general arithmetic discreteness and existence of neat levels.

RT-AREA-algebraicgeometry/27 is handled within this job by the existing exact H0→D1 and H1→D3 supplier requests, direct node prerequisites and synchronized reader. The packet's inherited `upstreamNotes` is preserved: installing native outgoing Hodge stage edges, and the Selmer L4, Compactifications C1 and AbelianSchemes A5 consumer edges, remains maintainer/native link-map work. This run does not claim those effective atlas edges have been installed.

The packet retains 26 requests, with the exact needed statements and consuming node IDs. The reader's supplier-request register reproduces them. No other roadmap or published atlas file is changed. In particular AF.1, LF0 and affine restriction of scalars are not credited with analytic quotient charts, the cyclotomic valuation identity or nonaffine restriction of projective space.

## Open proof leaves and where to resume

A follow-up must restore the explicitly omitted supplier conditions on these objects and prove the corresponding interfaces. The complete node statements, hypotheses and proof steps in the packet are binding. The suggested forms omit missing conditions honestly; they are not unconditional implementation theorems.

1. **Effective comodule descent is requested, not closed** — The pinned torus descent descends the Hopf algebra, not arbitrary representations. R1 must supply its effective comodule descent with real-carrier and scalar-extension uniqueness; no equivalence proof is claimed without it.

2. **Holomorphic flat bundles and connections from local systems** — The pinned fundamental-groupoid local coefficient system supplies monodromy/transport. It does not provide L⊗O_B, holomorphic subbundles, Ω¹, or a flat connection. The variation node plans their use; a general complex analytic bundle/connection supplier is still missing. Required result: local trivializations glue the flat holomorphic bundle, pullback commutes, and filtered derivative is well defined.

3. **Complex analytic quotient input** — Milne Theorem1.21 cites Wolf1984 Theorem8.7.9, not read here. The exact complex quotient/integrability theorem is requested at LieGroups layer4; no proof from real smooth Frobenius is asserted. LieGroups layer8 states a Borel flag quotient, which does not by itself supply arbitrary parabolic quotient charts or the holomorphic open real orbit used by the compact dual and Borel embedding. Those precise stronger extensions remain requests, not library coverage.

4. **Integral flag geometry supplier exceeds field Bruhat theorem** — RG layer7 is over a field. RG layer9 must supply integral parabolic quotients, Schubert flatness and base-change-compatible opposite incidence. BP and BP21 cite [BL03] I Lemma1 for incidence; that proof has not been read. The exact requested incidence theorem is a leaf, not an unproved claim of library coverage.

5. **Reflex parabolic-type descent representability** — Need the representability and descent of the parabolic-type functor requested from R7, with descent compatible with the μ conjugacy class. General SGA3 representability proof has not been read. No E-point, E-rational μ, or E-rational parabolic is inferred.

6. **Mumford–Tate and genericity proof inputs** — The Hopf-ideal sum and the native finite-comodule carriers are available. Finite-type rational subgroup representability and its comparison with the MT quotient remain R0/R3 inputs; polarizable semisimplicity and the faithful representation criterion remain H1/R6 inputs. The exact independent elliptic classification is: MT(H¹(Eτ,ℚ)) is the two-dimensional CM torus for a rational imaginary-quadratic relation for τ, and GL₂ otherwise. H0/H1 must supply the rational Hodge-endomorphism calculation and geometric H₁/H¹ comparison; D1/D4 cannot import all of later CM.0, since CM.0 consumes D3. Masser–Zannier states full-GSp genericity but does not prove these classification inputs.

7. **Suggested signatures omit unavailable conditions explicitly** — The suggested signatures now retain the actual planned conclusions and mathematical objects. Supplier stubs use existing Hopf/comodule, local-system, manifold, scheme and group carriers. Explicit omitted hypotheses still must be restored before implementation: RG2.0a split real descent compatibility; faithful tensor generation; real algebraic point and homogeneous quotient charts; SV1–SV3 and faithful period-map/tangent identifications; flat sheaf/bundle gluing and natural integral/rational scalar-extension comparisons; rational Hodge weight/polarization and elliptic MT classification; central/derived/adjoint comparison diagrams; projective parabolic representability and effective reflex descent; integral Coxeter/Schubert incidence; adelic/eigenvalue comparisons and compact Cartan complexification/exponential. These are conditions on the specified objects, never arbitrary proposition fields or substitutions for the conclusion. The full complete statements remain in each node; no Lean elaboration or supplier closure is claimed.

8. **Real analytic point and homogeneous quotient bridge** — AF.1 states (g,K)-modules/globalizations/relative cohomology, not the requested real analytic point charts and Lie/orbit differential theorem. Native LieGroups layer2 states the closed subgroup theorem, not all quotient charts. The precise extra theorem needed is: smooth real points of a connected reductive algebraic group, closed centralizer quotient charts, tangent exact sequence and agreement with the topology in a faithful representation. This is an extension request to the real Lie/point suppliers; no existing implementation or source proof is asserted.

9. **Hilbert compact dual requires nonaffine geometry** — RG2.0a explicitly supplies affine Weil restriction, so it does not supply ResF/ℚℙ¹. Construct the projective compact dual as the R7 parabolic-type variety and apply D3 reflex-flag descent; after a splitting extension it is the product of d copies of ℙ¹. A scheme/functor identification with the nonaffine Weil restriction requires a separate representability/comparison input. Neither affine Weil restriction nor a set-level product proves this identification.

10. **Cyclotomic valuation comparison exceeds LF0 statement** — The native LF0 text provides local fields, finite extensions and normalized valuations, but does not state the cyclotomic identity requested here. Supply v(ζ_{l^r}−1)=1/(l^{r−1}(l−1)) with v(l)=1 and nontrivial prime-to-l torsion reduction in the local algebraic closure. This is an explicit extension request to LocalFieldsRamification; the proof has not been independently sourced here.

Additionally the coverage records keep the exact real algebraic component-finiteness extension at RG2.0 and the AA.3 rational adelic lattice comparison for principal GL2 levels visible. The unresolved fundamental proofs are Wolf 1984 Theorem 8.7.9, BL03 I Lemma 1, general SGA3 parabolic-type representability, the independent elliptic Hodge-endomorphism/MT classification, and the normalized cyclotomic valuation identity. Their current source citations are leads or requested leaves, not a claim that these proofs were read.

The next step is independent revision review: check the replacement signatures, the actual-object acceptance examples and their agreement with the packet, then decide the new verdict. In particular inspect the graded functor laws/coaction round trips; natural scalar-extension and connection comparisons in polarized variations; connected adjoint/derived compatibility; and actual cocharacter, domain and reflex comparisons for the named examples. Proof work proceeds through the named suppliers rather than replacing unavailable objects with abstract subgroup images or pointwise identities.

## Sources and baseline inspected

This run rechecked the eleven source versions whose public URLs, read locators and SHA-256 hashes are recorded in the reader and packet: Milne 2017; Deligne 1979; BP's 2025 higher Hida author copy; BP21 arXiv v1; the CG publisher-typeset advance-publication copy; Pilloni's 2019 author copy; and the published BKT, Benoist, BCGP, Masser–Zannier and Hansen–Johansson copies. Source-copy pagination remains distinguished from final journal pagination. The read passages cover the routed in-scope definitions and examples, and the sixteen retained corrections. Unread foundational leaves are listed above.

The reviewed D0–D5 library audit, native ReductiveGroups and HodgeStructures documents, and the touching LieGroups link were read. Each added carrier citation was inspected at Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** or Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**, including the declaration's actual hypotheses. The nine added citations expose Comodule, FGComoduleCat and its morphism/isomorphism/tensor/dual operations, Hopf-ideal supremum, the finite-type GL coordinate Hopf algebra and native polarization. They supply the carrier or operation only, not the subsequent Shimura comparison theorem. The 25 inherited citations remain.

## Validation and Lean status

- Packet checker, using the repository's pinned declaration index: **0 errors, 0 warnings**.
- Source-issue/version validation through an `errata-v1` wrapper of the current packet: **passed**.
- Structural synchronization: all 122 node names and 142 API names occur in the suggested file and reader; all 132 test labels occur as named comments on Lean examples and in the reader; every definition/construction has at least three tests; inherited node IDs, review object and 16 confirmed source verdicts are preserved. This verifies name coverage, not elaboration or mathematical validity.
- Every individual imported module's source path exists at its pinned commit. Source PDF hashes match the packet's version ledger.
- Deliverable scope and whitespace checks: **passed**. Only the four issue-authorized files are submitted.
- **The Lean file was not compiled.** Available memory exceeded 20 GB, but no existing shared build had both required commits. The default shared build has the required Mathlib pin and a different Tau Ceti revision. WORKERS forbids creating/updating/building a project. No Lean invocation, language server, library build or cache download was started.

All work needed to understand or continue this revision is in these deliverables and the previous independent report. The source ledger, corrected statements and exact supplier leaves are durable; no scratch file is needed by the next worker.
