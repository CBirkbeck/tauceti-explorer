# Independent review: Artin v-stacks, solid and lisse categories

**Job:** REV-VStackSheavesAndLisseCategories · **Issue:** #499 · **Reviewer:** Codex, session `codex-jDXZfL` · **Date:** 2026-10-07

**Verdict: needs_changes.** This is a completed independent review, not a checkpoint. The source mathematics is largely sound and the clear local corrections are applied, but the packet and its reader contradict the verified RT30 ownership decision. Acceptance is blocked until a revision reconciles that scope and updates the reader. The review does not request implementation of the recorded open interfaces.

The producer was Codex session `codex-5EVU9E`, a different worker. The packet retains `status: complete` as a finished target-level pass, and all six stages remain `planned`, with no stage `closed` and no implementation claim. Honest mathematical/prototype gaps are permissible at this level.

## Counts and scope

| Item | Reviewed result |
| --- | --- |
| Nodes | 78: 55 verified, 17 corrected, 6 unverifiable as to stage ownership/core isolation |
| Node contents changed | 18; one also has an unresolved scope verdict |
| Definition/construction APIs | 31 objects, 182 API entries; no new API names |
| Unit tests | 95, up from 93; two discriminating nonzero tests added |
| Planets | 30, unchanged |
| Baseline declarations | 39 confirmed, 0 removed/replaced |
| New mathematical nodes | 0; all 78 IDs preserved |
| Target coverage | 24 explicit target groups, covering the six stages |
| Integrated decomposition | All 21 earlier node IDs retained |
| Gaps / supplier requests | 17 gaps (two added), 15 precise requests |
| Source issues | All four existing entries confirmed; one new proof gap E5, confirmed |

Every node was checked against its source passage, hypotheses, proof outline and direct inputs; all 31 definition/construction APIs and their tests were examined. The granularity is **target level**: proof interiors are not split into artificial lemma nodes. Each node receives an individual verdict in the packet and in the ledger below.

## Blocking ownership and reader revision

The [RT verifier](../redteam/RT-AREA-geomlanglands.review.json), finding `/30`, explicitly chooses the alternative **rather than** VS0→VS2/VS1→VS2 edges. Keep VII.2.1–VII.2.6 and VII.3 in the generic VS2 core, move Definition VII.2.9 and Theorem VII.2.10 to VS4, and put VII.2.7–VII.2.8 in VS4 or HS1. This protects the generic owner feeding HabiroRings HR.2 from the Artin/ULA/curve ancestor chain.

The current combined `VS2/solid-geometric-base-change-and-drinfeld` includes VII.2.6 together with VII.2.7–VII.2.8. It must be split at that target boundary; the generic geometric-base-change part belongs in VS2. `VS2/solid-partial-support` and `VS2/solid-partial-supported-vanishing` retain exactly the placement the verifier rejects. The packet previously called these new edges the RT30 fix, and the [reader](../readmes/VStackSheavesAndLisseCategories.md), “Scope and ownership”, makes the same claim. That is a verified contradiction, not merely a preferred alternative organization.

A direct-input audit also finds three additional VS2 applications with VS1 dependencies: `completed-ula-solid-duality`, `constructible-and-geometric-langlands-embedding`, and `torsion-solid-comparisons`. Their mathematics and coefficient/Tor hypotheses were checked, but the revision must explicitly isolate their VII.4/VII.5 application branch or reconcile its placement with the generic-core decision. They cannot silently leave an unqualified VS1→VS2 stage dependency while claiming the core is isolated. All six affected nodes are marked `unverifiable` for this scope reason; this does not mean their source theorems could not be read.

Added `G-rt30-scope`, named the required revision in VS2 coverage, corrected the top-level RT30 note, and qualified the pending VS2 subdivision proposal. No target IDs were silently reparented. The reader is **not** an authorized deliverable for this review, so it was left unchanged. A revision must update its scope paragraphs and node sections from the corrected packet, including all 18 local corrections, both new tests, both new gaps, source reviews/E5, the RT29 reflexivity removal and the counts. The original reader reproduced every original node statement, proof step, API/test statement and prerequisite; this was mechanically compared, and its unique stage/scope prose was inspected.

Questions for the orchestrator:

1. Authorize the revision to update the reader together with packet/suggested signatures and implement the already verified RT30 moves; select VS4 or HS1 for VII.2.7–VII.2.8.
2. Decide how the additional VII.4/VII.5 application branch is separated from the generic VS2 core at stage granularity. Preserve the baseline solid owner and HR.2 consumer without importing the full ULA ancestor chain.

## Clear corrections applied

1. **`VS0/enhanced-smooth-descent`**: Added the direct smooth twisted-pullback input used to normalize atlas descent; it supplies the dualizing twist rather than assuming ordinary pullback descent suffices.
2. **`VS0/shriek-pullback-for-smooth-stacky-maps`**: Added Remark IV.1.16 for the asserted left adjoint; eligibility and normalized dualizing twists are retained.
3. **`VS0/partial-compact-support`**: Made the prime-to-p torsion coefficient hypothesis explicit and added a nonzero proper-band section test. The three original tests alone would also pass for the identically zero functor; the new test uses an explicitly proper graph, not an assertion that every point graph is proper.
4. **`VS2/solid-partial-support`**: Added a nonzero proper-band section test for the solid functors, retaining the proper X and finite-dimension hypotheses of VII.2.9. This repairs the tests, but not the RT30 stage assignment.
5. **`VS1/ula-descent-and-smooth-locality`**: Removed the advanced IV.2.26 tensor-composition assertion from this basic locality node; it is already owned by ula-relative-adjoints-and-calculus. Keeping it here would conceal the dualizability input and create a proof cycle when that input is made explicit.
6. **`VS1/perfect-rhom-and-la-characterisation`**: Restricted the forward tensor-Hom assertion to ULA, as in Proposition IV.2.19. The LA converse with overconvergence and a local uniform cohomological-dimension bound remains distinct.
7. **`VS1/ula-dualizability-criterion`**: Added the direct IV.2.15/IV.2.19 Hom/duality input and corrected IV.2.24 from corollary to proposition. The basic locality node has been narrowed first, so this closes the proof without a cycle.
8. **`VS1/formal-smoothness`**: Specified that the étale neighbourhood covers the entire prescribed closed subspace and that the lift agrees on its pullback, making the IV.3.1 quantifiers explicit.
9. **`VS1/formal-smoothness-calculus`**: Corrected the descent reference IV.3.7 to Corollary IV.3.6 and restricted the étale-locality observation to maps of locally spatial diamonds. IV.3.7 concerns Bun_G, so it is not this general calculus input.
10. **`VS1/kernel-correspondence-category`**: Made the prime-to-p torsion convention explicit in the relative correspondence category, whose kernel operations use the torsion six-functor formalism.
11. **`VS1/section-functor-and-positive-tangent`**: Restricted the projective embedding hypothesis to the source: locally on S, one fixed closed embedding into an open projective space. Replaced the unsupported infinitesimal-deformation identification by the candidate cohomology and actual normal-cone fibre construction; IV.4 explicitly warns that a direct infinitesimal interpretation is unavailable.
12. **`VS1/jacobian-criterion`**: Aligned the first proof step with the corrected section-space embedding hypothesis; the quantitative Frobenius/normal-cone estimates remain explicit in G-jacobian.
13. **`VS1/geometric-divisor-finite-etale`**: Removed the unrelated SW16.3.3/16.3.6 connected-fibre product argument. The needed input is exactly SW16.3.2, reduced to the existing VB2 finite-étale constant-algebra theorem (SW13.5.7), as RT31 verifies.
14. **`VS2/condensed-cohomology`**: Specified the augmentation and degree range in the norm-controlled primitive assertion. Without the augmented term, degree-zero cocycles do not all have primitives; the statement now matches CS Theorem 3.3.
15. **`VS2/condensed-epis-and-colimits`**: Filled the missing choice of a common factorization stage in PQ Appendix A.5. The printed proof writes T→X_i×X_i without making that choice, and asserts a quasicompact colimit inclusion without justification; evaluation on compact profinites and filtered finite products repair the argument.
16. **`VS4/contractibility-of-connected-banach-colmez-torsors`**: Removed the improper use of proper-smooth Poincaré duality for nonproper BC fibres. Named relative homology and the nonproper VII.5.2 comparison instead, and exposed the integral unit-homology detection/completion argument as G-bc-unit-homology. Testing arbitrary rational solid objects only modulo ℓ would not suffice.
17. **`VS4/compact-generation-and-compact-objects`**: Added the actual torsion IV.5.3 input used in Lemma VII.7.5 and separated that proof from the solid VII.2.10 input to the stratum adjoint.
18. **`VS5/lisse-verdier-exchange`**: Removed the additional lisse reflexivity criterion and its unproved localization outline. The named target is the VII.7.7 exchange; RT29 excludes a new reflexivity node because FS omits that proof. Torsion V.6.2 reflexivity remains in its own node.

The correction to the BC torsor proof adds `G-bc-unit-homology` and a VS4 coverage entry. Torsion V.2.1 full faithfulness is source-supported. For the solid unit assertion in VII.7.1, the nonproper VII.5.2 comparison needs the integral cone/detection/completion interface written out before extension of coefficients; neither proper VII.3.5 nor mod-ℓ testing of arbitrary rational solid objects supplies it. This is an honest target-level proof-interface gap, not a false completed proof.

Only the omitted-signature comment blocks changed in the Lean file. The four actual condensed prototypes are unchanged. The revised comments reproduce the corrected contracts, direct inputs, API/test statements and gap references exactly.

## Public source versions and depth

Fresh independent downloads reproduced all five SHA-256 hashes already recorded in `sourceVersions`. Findings are scoped to those bytes; no identity with another edition is assumed.

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf); author copy. SHA-256: `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
- [Lectures on Condensed Mathematics](https://people.mpim-bonn.mpg.de/scholze/Condensed.pdf); author copy. SHA-256: `d422561285f3025a53ee71a497d350fc89afaefe28053de78e2255b2d521c69d`.
- [Berkeley Lectures on p-adic Geometry](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf); author copy. SHA-256: `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc`.
- [Modularity theorems for abelian surfaces](https://math.uchicago.edu/~fcale/papers/Modular.pdf); author copy. SHA-256: `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c`.
- [On local Galois deformation rings: generalised reductive groups](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2D7C5400C4BA7789C0E1CFF008D12E60/S2050508626100304a.pdf/div-class-title-on-local-galois-deformation-rings-generalised-reductive-groups-div.pdf); published. SHA-256: `b18abe909131d28524f7a326834e5656d10063039a92f54e627d7cb899350d93`.

Passages independently examined:

- **FS author copy, 356 pages:** IV.1–IV.7 and V.1–V.7, statements and relevant proof interiors; VII.1–VII.7, including the full solid structure/comparison arguments, properness distinctions, lisse adjoints and stratum/duality proofs. Also II.1.14 (Gauss inertia), III.5.1 (chart source) and IX.2.1–IX.2.3 (coefficient-change export).
- **Condensed notes, 78 pages:** Theorems 3.2–3.3; Lecture IV 4.3, 4.5, 4.8 and Appendix 4.10–4.17; Lectures V–VII (Nöbeling/free objects, solidification, tensor/Hom and analytic-ring criterion), with the relevant Lecture VIII discussion. Uniform finite Breen multiplicities are not replaced by an arbitrary free resolution.
- **SW, author PDF dated 27 March 2020:** Theorem 13.5.7 and Lemma 16.3.2; also 16.3.3–16.3.6 to check whether the larger product theorem was needed. It is not an input to the present geometric-divisor node.
- **BCGP, author v1 copy, 230 pages:** §2.2.1 (topological E-solid structure) and §2.4.1, especially examples (2) and (3) (Z-solid analytification and formal complement).
- **PQ, published 96-page Cambridge PDF:** all of Appendix A.1–A.8, definitions and proofs. The published A.5 proof has an additional missing compact-stage choice, recorded as E5.

The locator/excerpt checks use the particular numbered source statements rather than accepting a chapter title as evidence for stronger hypotheses. The local corrections above identify mismatches. Proof inputs supplied by other roadmap owners were read as statements or precise stage briefs, rather than inferred from similarly named layers.

## Source issues

All five entries have the required `review` object, reviewer `REV-VStackSheavesAndLisseCategories`, verdict `confirmed`, and an independent reason:

| Issue | Locator | Independent result |
| --- | --- | --- |
| E1 | Published Appendix A, Lemma A.8 proof, p.91 | Confirmed at the published A.8 proof: the list of r equations has simultaneous values in A^r, not A. Arbitrary closed ideals also require the compact intersection argument, which the packet now states; no finite defining-ideal assumption is smuggled in. |
| E2 | 356-page author copy, Proposition VII.7.10, p.276 | Confirmed at VII.7.10: the displayed functor, hypotheses and preceding paragraph are D_lis. The isolated D_et compactness sentence is a notation slip; it cannot supply the Q_ell target otherwise. |
| E3 | Published Appendix A.1, p.90; inherited PAPER-PASKUNAS-QUAST-26/E10 | Confirmed independently against the published A.1 sentence and the registered PAPER-PASKUNAS-QUAST-26/E10 counterexample. A constant two-element accessible functor fails both the empty-cover singleton and the binary disjoint-union product condition. Representable affine Hom repairs the applications. |
| E4 | 356-page author copy, Remark IV.1.10, p.110 | Confirmed at IV.1.10: the distribution obstruction applies to infinite compact open subgroups. The closed infinite discrete subgroup π^Z⊂E× has an étale point atlas, whose base change is a disjoint union of identities, so the finite-only parenthesis is false. |
| E5 | Published Appendix A, Lemma A.5 proof, p.90 | Confirmed at the printed A.5 diagram: no map T→X_i×X_i has yet been chosen and quasicompactness of the colimit inclusion is asserted without an argument. Compact profinite evaluation plus filtered finite products supplies a suitable common i; monomorphy then makes the diagonal pullback Cartesian. This repairs the proof without changing its theorem. |

E3 is the registered `PAPER-PASKUNAS-QUAST-26/E10` accessible-functor error; its registry status is awaiting review, so that registry was not treated as an independent acceptance. The counterexample was checked directly. E5 is new to this packet and carries `addedBy: REV-VStackSheavesAndLisseCategories`; it affects the proof, not the validity of the theorem.

Correction searches were bounded: exact-title/numbered-passage erratum searches, the author publication pages, current author PDFs, [FS arXiv metadata](https://arxiv.org/abs/2102.13459), [PQ arXiv metadata](https://arxiv.org/abs/2404.14622), and [Quast’s publication page](https://julianquast.de/). No separate correction for these precise findings was identified in the checked material. This is not a proof that no correction exists, and an unrelated Paškūnas paper’s corrigendum was not confused with PQ26.

## Pinned baseline: all 39 citations confirmed

Actual declaration statements were opened at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, using the exact Git objects, across 32 module files. Each entry exists under its cited name and provides the claimed ambient object or theorem in the stated range. No citation was removed or replaced.

The main limitations were checked rather than assumed away: `IsSolid` is only the correct finite-type integer-algebra predicate; `profiniteSolid` and its natural map do not prove solidity; `DerivedCategory` and ordinary rigidity are not enhanced ∞-categories/ULA; finite modules are not perfect complexes; `Representation` is not a smooth locally profinite representation category. Tau Ceti’s Huber pair/Spa and discrete topological smooth carrier are only foundations.

| Declaration | Pinned module | Confirmed contribution / limit |
| --- | --- | --- |
| `mathlib:Condensed` | `Mathlib/Condensed/Basic.lean` | Condensed objects of a category, the ambient setting of VS2. The pinned library already has them, so this packet plans solidity and not the condensed formalism. |
| `mathlib:CondensedMod` | `Mathlib/Condensed/Module.lean` | Condensed R-modules. Solid abelian groups are a full subcategory of these, so this is the carrier VS2's definition restricts. |
| `mathlib:CondensedMod.IsSolid` | `Mathlib/Condensed/Solid.lean` | Existing Hom-inversion predicate; reused only over integers and finite-type integer algebras. The general-ring correction is a new node, as required by the pinned docstring. |
| `mathlib:Condensed.profiniteSolid` | `Mathlib/Condensed/Solid.lean` | The functor sending a profinite set S to R[S]^solid, defined as the right Kan extension of the free functor on finite sets along FintypeCat.toProfinite. This is Z[S]_solid of Definition 5.1 (i), so the construction the roadmap asks for is already pinned. |
| `mathlib:Condensed.profiniteSolidification` | `Mathlib/Condensed/Solid.lean` | The natural transformation R[S] -> R[S]^solid. The universal property VS2 has to construct is the statement that mapping out of it is bijective, which is exactly how the pinned predicate is phrased. |
| `mathlib:Condensed.profiniteFree` | `Mathlib/Condensed/Solid.lean` | The free condensed R-module on a profinite set, the source of the solidification map. |
| `mathlib:Profinite` | `Mathlib/Topology/Category/Profinite/Basic.lean` | Profinite sets, over which solidity is tested and out of which the free solid modules are built. |
| `mathlib:CompHaus` | `Mathlib/Topology/Category/CompHaus/Basic.lean` | Compact Hausdorff spaces, the site underlying the condensed formalism. |
| `mathlib:CategoryTheory.Functor.rightKanExtension` | `Mathlib/CategoryTheory/Functor/KanExtension/Basic.lean` | Right Kan extensions, the mechanism by which the pinned library defines the solid free functor; the structure theorem of VS2 is about what that extension is. |
| `mathlib:CategoryTheory.Abelian` | `Mathlib/CategoryTheory/Abelian/Basic.lean` | Abelian categories. Theorem 5.8 (i) asserts that the solid objects form an abelian subcategory closed under limits, colimits and extensions, so this is the structure being claimed. |
| `mathlib:CategoryTheory.Sheaf` | `Mathlib/CategoryTheory/Sites/Sheaf.lean` | Sheaves on a site, the carrier for the pro-etale and v-sheaves of every layer of this roadmap. |
| `mathlib:CategoryTheory.GrothendieckTopology` | `Mathlib/CategoryTheory/Sites/Grothendieck.lean` | Grothendieck topologies, in which the v-topology and the quasi-pro-etale topology are expressed. |
| `mathlib:DerivedCategory` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` | Ordinary localization of cochain complexes of an abelian category with HasDerivedCategory. Does not supply the stable infinity enhancement; EDS owns that. |
| `mathlib:CategoryTheory.Pretriangulated` | `Mathlib/CategoryTheory/Triangulated/Pretriangulated.lean` | Pretriangulated categories, the level at which the localization triangles and the semiorthogonal decompositions of VS3 and VS4 are stated. |
| `mathlib:CategoryTheory.Adjunction` | `Mathlib/CategoryTheory/Adjunction/Basic.lean` | Adjunctions. The shriek pullback's left adjoint, the solidification, the lisse right adjoint and f_sharp are all adjunctions. |
| `mathlib:CategoryTheory.MonoidalCategory` | `Mathlib/CategoryTheory/Monoidal/Category.lean` | Monoidal categories, in which the solid and lisse tensor products are stated. |
| `mathlib:CategoryTheory.LeftRigidCategory` | `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean` | Ordinary monoidal left rigidity only. Does not provide adjoints of kernels in a 2-category or the ULA criterion. |
| `mathlib:CategoryTheory.Equivalence` | `Mathlib/CategoryTheory/Equivalence.lean` | Equivalences of categories, the form taken by the classifying-stack theorem, the stratum comparisons and the lisse comparisons. |
| `mathlib:CategoryTheory.Functor.Faithful` | `Mathlib/CategoryTheory/Functor/FullyFaithful.lean` | Injectivity of maps on Hom sets only; full faithfulness also needs Full or FullyFaithful. |
| `mathlib:CategoryTheory.Limits.limit` | `Mathlib/CategoryTheory/Limits/HasLimits.lean` | Limits, used for the fibre products of VS0 and for the cofiltered limits defining j_sharp. |
| `mathlib:CategoryTheory.Limits.HasFiniteLimits` | `Mathlib/CategoryTheory/Limits/Shapes/FiniteLimits.lean` | Finite limits, the shape of the fibre-product stability statement of VS0. |
| `mathlib:CategoryTheory.Comma` | `Mathlib/CategoryTheory/Comma/Basic.lean` | Comma categories, the pinned form of the slice categories over which the shriek pullback's compatible system is indexed. |
| `mathlib:CategoryTheory.Idempotents.Karoubi` | `Mathlib/CategoryTheory/Idempotents/Karoubi.lean` | Ordinary idempotent envelope. Enhanced stable idempotent completion is imported from EDS. |
| `mathlib:Representation` | `Mathlib/RepresentationTheory/Basic.lean` | Representations of a group on a module. The classifying-stack theorem identifies sheaves with smooth representations, and the smooth category itself is owned by SmoothRepresentationsOfLocalGroups. |
| `mathlib:Module.Finite` | `Mathlib/RingTheory/Finiteness/Defs.lean` | Finite generation of an ordinary module only; does not assert perfection of a derived complex. |
| `tauceti:TauCeti.Huber.Pair` | `TauCeti/RingTheory/Huber/Pair.lean` | Huber pairs, the affinoid input to adic spaces and hence to the perfectoid spaces the charts of this roadmap are built from. |
| `tauceti:TauCeti.ValuationSpectrum.spa` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean` | Subset of valuation classes satisfying continuity and boundedness on a subring. This declaration alone is not an adic space or strict localization. |
| `tauceti:TauCeti.IsSmoothDiscrete` | `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean` | Smoothness of a discrete topological representation, already in Tau Ceti. The accepted restructuring RS-05 says of this layer that the pinned smooth-discrete continuity already exists and is not the Bun_G equivalence; this citation records exactly that boundary. |
| `tauceti:TauCeti.SmoothDiscreteTopRep` | `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean` | Existing category of discrete continuous smooth topological representations; enhancement, exactness and compact induction are imported from SR. |
| `mathlib:CondensedSet.fullyFaithfulCompactlyGeneratedToCondensedSet` | `Mathlib/Condensed/TopCatAdjunction.lean` | Fully faithful realization of compactly generated topological spaces as condensed sets; used in the quasi-separated compact-Hausdorff comparisons. |
| `mathlib:CategoryTheory.ObjectProperty.FullSubcategory` | `Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean` | Full subcategory with actual ambient objects and a membership proof. |
| `mathlib:CategoryTheory.ObjectProperty.ι` | `Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean` | Fully faithful inclusion of an object-property full subcategory. |
| `mathlib:ModuleCat.restrictScalars` | `Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean` | Functor on ordinary modules along a ring homomorphism, preserving the finite limits needed for sheaf composition. |
| `mathlib:CategoryTheory.sheafCompose` | `Mathlib/CategoryTheory/Sites/Whiskering.lean` | Postcomposition on sheaves under HasSheafCompose; restriction of scalars satisfies this because it preserves limits. |
| `mathlib:CondensedAb` | `Mathlib/Condensed/Module.lean` | Condensed modules over the universe-lifted integers, an actual abelian carrier for solid integer prototypes. |
| `mathlib:LocallyConstant.freeOfProfinite` | `Mathlib/Topology/Category/Profinite/Nobeling/Induction.lean` | Nöbeling’s theorem: Module.Free ℤ (LocallyConstant S ℤ) for every profinite S. Continuous integer-valued maps are locally constant because ℤ is discrete. This already supplies the freeness input of Condensed Theorem 5.4. |
| `mathlib:CondensedSet` | `Mathlib/Condensed/Basic.lean` | Type (u+1)-valued coherent sheaves on CompHaus at universe u. This pyknotic carrier requires a cutoff comparison with the source regular-cardinal convention, not an automatic identification. |
| `mathlib:profiniteToCondensed` | `Mathlib/Condensed/Functors.lean` | The actual profinite-to-condensed sheaf realization and its Profinite.toCondensed object alias. |
| `mathlib:TopCat.toCondensedSet` | `Mathlib/Condensed/TopComparison.lean` | Continuous-map sheaf realization of a (u+1)-small topological space; used for the infinite discrete condensed-set test. |

## Closure, owners, requests and audited coverage

Read all six stage entries of reviewed `AUDIT-21` in `data/library-coverage.json`. VS2’s ordinary condensed objects/free objects/maps and predicate are reused, while their missing solid category and derived structures are planned. Nöbeling is explicitly imported. Algebraic formal smoothness/Jacobian theorems in Mathlib are not the perfectoid lifting and BC section criterion here. Existing Tau Ceti continuous discrete carriers are extended through SR rather than duplicated.

The equal-characteristic GlobalShtukas GS.4 Drinfeld application is an outgoing parallel consumer, not a second construction of the present divisor/Weil theorem. Accepted RS-05 ownership keeps BG chart/stratum geometry and SR representations outside the VS foundational construction. Actual VB finite-étale constant algebras and BC slope resolutions, BG3/BG4 geometry, SR.0/SR.2 representation interfaces, EDS enhancement/descent/adjunctions and L0 coefficient-limit statements were read. All 67 concrete supplier references in the original graph were located and their statements examined; stage-only references were checked against the stage briefs or exact requests. The added smooth twisted-pullback and torsion partial-vanishing inputs were checked too.

The 15 requests name exact consumers and missing interfaces. They cover SR abelian/derived smooth categories and compact inductions (with BZ as a requested extension), RF generic/integral divisors and relative curve, R5 continuous differentials/normal cones, EDS categorical tensor, H1 formal-adic comparison, SA.2–SA.4 analytic measures/coefficient structures, AS.2–AS.3 AnSpec/gluing, and the existing ClassFieldTheory Weil group. A request is not an assertion that the current supplier packet has already proved it. G-cutoffs, G-breen, G-topology, G-neeman, G-jacobian, G-algebraic-ula, G-haar, G-smooth-duality and G-perfect-descent remain honest interfaces.

All 21 integrated node IDs survive, and every recorded target group has realizing nodes. This satisfies planned coverage at target level; it does not close any stage. RT30 placement remains a separate acceptance blocker.

## Confirmed red-team findings

| Finding | Packet and reader result |
| --- | --- |
| RT18 | Correct external proposal: EDC.5 supplies perversity/recollement, L1/L3 feed GS1, and no unnamed VS3 lisse input is imposed on torsion GS2/GS3. External atlas edges were not edited. |
| RT28 | VS3’s actual adic prerequisites use L0; L1/L3 comparisons go to their characteristic-p GS consumers, L4–L6 remain at EDC.6. VS1’s separate analytification comparison has its own H5 input. |
| RT29 | Named VII.7.6 BZ, VII.7.7 exchange, VII.7.8 definition, VII.7.9 admissibility and VII.7.10 Künneth are present. VII.7.2 remains VS4 with a solid-vanishing chain; VS5→existing HS1 nodes is proposed. Removed the extra lisse-reflexivity continuation, whose proof FS omits and the verifier explicitly declines. Reader must reflect the correction. |
| RT30 | Unresolved: the original packet/reader choose the rejected edges instead of the verified generic-core alternative. Corrected the packet’s claim and recorded the exact required moves; no unauthorized reader/atlas edits. |
| RT31 | Imports the actual VB2 finite-étale constant-algebra node (SW13.5.7), uses SW16.3.2, and keeps Weil data with its existing owner. Removed the unrelated SW16.3.3/16.3.6 product argument. The ClassFieldTheory dependency is independently justified by the actual Weil-object use. |

## API, tests, planets and suggested signatures

All definitions/constructions provide at least three tests and a usable API with constructors, data/extensionality, relevant universal/characterizing maps, functoriality and compatibility. The two partial-support constructions originally had only zero/empty/cofinal or vanishing tests: an identically zero functor would pass. The added proper-band graph tests give output Λ≠0 under explicitly stated proper-support hypotheses. They test actual supported inputs, not the exterior-product class covered by the vanishing theorem.

The 30 planets are key source definitions, constructions and named results. No auxiliary API/test names became planets and no private paths were introduced.

The suggested file elaborates **four typed condensed cores**: SolidAb, ordinary solidification, corrected polynomial-restriction solidity and condensed QCQS. The other geometric/enhanced signatures are explicitly omitted, with contracts and named carrier gaps in a ledger. It introduces no opaque propositions or structures with assumed theorem fields to manufacture compilation. There are 34 proof placeholders and 12 typed example tests; the remaining planned tests are honest omitted examples. Compilation is typing evidence, not evidence that any mathematical proof was completed.

All 78 ledger blocks were mechanically checked against the revised packet for declaration, contract, direct prerequisites, API names/statements, test names/statements and applicable gaps. The typed core stayed unchanged.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/VStackSheavesAndLisseCategories.json`: 0 errors, 0 warnings; 78 nodes, 182 API entries, 95 tests, 30 planets, 39 baselines, 17 gaps and 15 requests.
- `lean-check research/blueprint/suggested/VStackSheavesAndLisseCategories.lean`: exit 0; exactly 34 warnings, all declaration uses `sorry`, no other warning or error. Available memory exceeded the required 20 GB; no language server or library build was started.
- Exact baseline declarations inspected via Git at both recorded pins. The shared build has the exact Mathlib pin and newer Tau Ceti `cf386627e9176a3827c1a5fe804989fd94a4d216`; this suggested file imports only Mathlib, so no newer Tau Ceti declaration participates in elaboration. No claim is made that the shared Tau Ceti checkout is the pin.
- JSON/ledger consistency, original ID retention, all baseline entries unchanged, reader comparison, and `git diff --check` checked.

## Individual node ledger

The machine-readable ledger is the packet’s `review.checked`. The entries below give the same verdict and reason.

### `VS0/artin-v-stack-definition` — verified

IV.1.1–IV.1.8: smallness, representable locally spatial diagonal and separated smooth surjective atlas are retained; the stack itself is not assumed quasiseparated. API covers charts, equivalences and refinements; BG is an application, not a duplicate geometry owner.

### `VS0/enhanced-smooth-descent` — corrected

Added the direct smooth twisted-pullback input used to normalize atlas descent; it supplies the dualizing twist rather than assuming ordinary pullback descent suffices.

### `VS0/partial-compact-support` — corrected

Made the prime-to-p torsion coefficient hypothesis explicit and added a nonzero proper-band section test. The three original tests alone would also pass for the identically zero functor; the new test uses an explicitly proper graph, not an assertion that every point graph is proper.

### `VS0/partial-compactly-supported-vanishing` — verified

IV.5.3: verified the annular trace/continuity proof and the exterior-pullback scope. The statement does not say every sheaf has zero support cohomology. The partially proper finite-dimensional hypotheses and torsion coefficients are essential.

### `VS0/point-to-classifying-stack-not-smooth` — verified

IV.1.9–IV.1.11 and supplier S5 distributions/S4 étale smoothness: the infinite compact-open obstruction is valid; the infinite discrete exception corrects the printed finite-only claim. E4 has the explicit closed π^Z counterexample.

### `VS0/shriek-pullback-for-smooth-stacky-maps` — corrected

Added Remark IV.1.16 for the asserted left adjoint; eligibility and normalized dualizing twists are retained.

### `VS0/stability-under-fibre-products-and-representable-maps` — verified

IV.1.8: pullback of atlases and representability of diagonals prove the stability statements; the smooth-local comparison retains separation and the constructed-operation class.

### `VS1/braden-theorem` — verified

IV.6.3 and IV.6.9: checked the affine-coordinate reduction, partial-support vanishing and monodromic induction. The local compactifiable result has its bounded-below qualification, whereas the global proper finite-dimensional result does not.

### `VS1/divisor-weil-map` — verified

IV.7 preamble and II.1.14: checked the W_E action τ∘Frob^(−deg τ) and quotient presentation. RF2 owns divisors; the existing ClassFieldTheory layer 9 owns Weil data. API/tests retain the sign and do not substitute a profinite π1.

### `VS1/drinfeld-local-systems` — verified

IV.7.2–IV.7.3: finite-étale comparison gives locally constant perfect complexes and the finite-I version. This is distinguished from essential surjectivity for all étale complexes or an unrestricted product π1 assertion.

### `VS1/drinfeld-pullback` — verified

IV.7.1: checked full faithfulness by geometric base-change invariance and the conditional essential-surjectivity statement; iteration gives finite I. Suppliers provide the actual divisor/Weil and finite-étale input.

### `VS1/formal-smoothness` — corrected

Specified that the étale neighbourhood covers the entire prescribed closed subspace and that the lift agrees on its pullback, making the IV.3.1 quantifiers explicit.

### `VS1/formal-smoothness-calculus` — corrected

Corrected the descent reference IV.3.7 to Corollary IV.3.6 and restricted the étale-locality observation to maps of locally spatial diamonds. IV.3.7 concerns Bun_G, so it is not this general calculus input.

### `VS1/geometric-divisor-finite-etale` — corrected

Removed the unrelated SW16.3.3/16.3.6 connected-fibre product argument. The needed input is exactly SW16.3.2, reduced to the existing VB2 finite-étale constant-algebra theorem (SW13.5.7), as RT31 verifies.

### `VS1/hyperbolic-base-change-duality-and-ula` — verified

IV.6.6–IV.6.8: checked the mates, inverse-action Verdier comparison and ULA reduction. Exceptional base pullback and supported base pushforward retain the compactifiable finite-dimensional hypotheses.

### `VS1/hyperbolic-localization` — verified

IV.6.1–IV.6.2: attractor/repeller representability, correspondence directions L+=p+!q+* and L−=p−*q−!, and comparison are correct. API/tests include fixed, attracting and repelling cases and retain the action-extension hypothesis.

### `VS1/jacobian-criterion` — corrected

Aligned the first proof step with the corrected section-space embedding hypothesis; the quantitative Frobenius/normal-cone estimates remain explicit in G-jacobian.

### `VS1/kernel-correspondence-category` — corrected

Made the prime-to-p torsion convention explicit in the relative correspondence category, whose kernel operations use the torsion six-functor formalism.

### `VS1/perfect-local-systems` — verified

IV.2.7–IV.2.10: v-local perfect complexes coincide with tensor-dualizable objects, with étale locality only on spatial diamonds. API/tests distinguish perfect complexes from complexes with finite cohomology in every degree.

### `VS1/perfect-rhom-and-la-characterisation` — corrected

Restricted the forward tensor-Hom assertion to ULA, as in Proposition IV.2.19. The LA converse with overconvergence and a local uniform cohomological-dimension bound remains distinct.

### `VS1/section-functor-and-positive-tangent` — corrected

Restricted the projective embedding hypothesis to the source: locally on S, one fixed closed embedding into an open projective space. Replaced the unsupported infinitesimal-deformation identification by the candidate cohomology and actual normal-cone fibre construction; IV.4 explicitly warns that a direct infinitesimal interpretation is unavailable.

### `VS1/smooth-spd-oe` — verified

IV.2.34: the formal-disc comparison includes the special fibre and yields F_ell(1)[2]. The supplier request explicitly distinguishes integral Spd O_E from the generic Tate-pair constructor.

### `VS1/smooth-ula-criterion` — verified

IV.2.28–IV.2.30: checked cancellation of the smooth dualizing twist and the converse with ULA unit plus invertible exceptional dual. This is not the ordinary monoidal tensor-rigidity criterion alone.

### `VS1/ula-analytification` — verified

IV.2.32–IV.2.33: algebraic/analytic comparison is limited to separated locally finite-type maps and bounded constructible prime-to-p complexes. The relative-kernel algebraic criterion is explicitly requested/gapped rather than supplied by an ordinary ULA definition.

### `VS1/ula-definition-with-constructibility` — verified

IV.2.1–IV.2.3: both specialization cohomology and perfect direct-image constructibility are present, with eligible maps and universal locally spatial base change. Tests catch omission of the constructibility clause and the difference between LA and ULA.

### `VS1/ula-descent-and-smooth-locality` — corrected

Removed the advanced IV.2.26 tensor-composition assertion from this basic locality node; it is already owned by ula-relative-adjoints-and-calculus. Keeping it here would conceal the dualizability input and create a proof cycle when that input is made explicit.

### `VS1/ula-dualizability-criterion` — corrected

Added the direct IV.2.15/IV.2.19 Hom/duality input and corrected IV.2.24 from corollary to proposition. The basic locality node has been narrowed first, so this closes the proof without a cycle.

### `VS1/ula-for-artin-v-stacks` — verified

IV.2.27–IV.2.28: eligibility of the composed smooth chart is explicit, and common refinements plus smooth descent prove independence. The statement does not extend unconstructed exceptional operations to arbitrary Artin maps.

### `VS1/ula-relative-adjoints-and-calculus` — verified

IV.2.24–IV.2.26, IV.2.31: checked properness of the target for kernel adjoints, relative duals, tensor composition, retracts and proper quasi-pro-étale detection. This is the correct advanced owner after narrowing basic locality.

### `VS2/affine-condensed-points` — verified

PQ Appendix A.1/A.8: representable Hom preserves sheaf products/equalizers; accessibility is asserted in the finite-presentation range. Tests include the constant-two-element counterexample, so the known accessible-functor error E3 is not reproduced.

### `VS2/breen-deligne-resolution` — verified

CS 4.10–4.17: finite sums of finite powers, universal integer-matrix differentials and functorial scalar homotopies are retained. G-breen honestly requests the uniform stable-range Eilenberg–Mac Lane homology input instead of assuming an arbitrary free resolution suffices.

### `VS2/closed-affine-points-quasicompact` — verified

PQ A.8: verified finite-dimensional affine ambient space, quasi-separated coefficients, the corrected multi-equation target A^r, and compact intersections for arbitrary defining ideals. Tests distinguish a finite equation list from arbitrary closed immersions.

### `VS2/completed-ula-solid-duality` — unverifiable

VII.5.2–VII.5.4: checked both solid duals, bounded Tor amplitude, properness in the second comparison, and reversed 2-morphisms. Its actual VS1 ULA inputs remain in VS2 and need reconciliation with the generic-core isolation chosen by RT30. Mathematics checked; stage ownership/core isolation remains unresolved. See G-rt30-scope.

### `VS2/condensed-cohomology` — corrected

Specified the augmentation and degree range in the norm-controlled primitive assertion. Without the augmented term, degree-zero cocycles do not all have primitives; the statement now matches CS Theorem 3.3.

### `VS2/condensed-epis-and-colimits` — corrected

Filled the missing choice of a common factorization stage in PQ Appendix A.5. The printed proof writes T→X_i×X_i without making that choice, and asserts a quasicompact colimit inclusion without justification; evaluation on compact profinites and filtered finite products repair the argument.

### `VS2/condensed-lca-rhom` — verified

CS 4.3,4.5,4.8: checked the Breen spectral-sequence/topological cohomology proofs and shifts. These are condensed internal derived Hom results, not Hom of abstract groups; compact groups into real coefficients vanish.

### `VS2/constructible-and-geometric-langlands-embedding` — unverifiable

VII.5.1(b),VII.5.3–VII.5.5: checked double-duality, compact-image/Ind range, separated finite-type charts and finite-Tor torsion qualification. Its direct VS1 analytification input must be isolated or explicitly reconciled with the RT30 generic-core scope. Mathematics checked; stage ownership/core isolation remains unresolved. See G-rt30-scope.

### `VS2/derived-solid-tensor` — verified

CS 6.1–6.3: checked closed symmetric monoidal solidification and the derived tensor of integer products. The source uses the solid category and its reflection, not the ambient condensed tensor; API/tests include unit and product compatibility.

### `VS2/general-ring-solidity` — verified

Pinned IsSolid docstring and CS Lecture VII: every Z[X]→R restriction is tested, agreeing with the finite-type predicate only in the justified range. The suggested predicate uses the actual restrictScalars and sheafCompose, and tests include the naive-general-R non-example.

### `VS2/nonarchimedean-solid-coefficients` — verified

BCGP 2.2.1 and CS Lecture VII: E has its nonarchimedean topology and analytic measures E⊗solid Z[S]_solid; it is not silently discrete. SA.4 supplies the analytic coefficient category; Banach/Smith theory remains a consumer.

### `VS2/principal-localization-and-formal-complement` — verified

BCGP 2.4.1 examples (2)–(3): checked the analytic proper localization, derived inverse-limit criterion and discrete coefficient convention; derived f-completion is the complement, including the SL2 example.

### `VS2/proper-smooth-solid-poincare` — verified

VII.3.2–VII.3.5: all sum, dimension, projection and homology comparisons require proper representable spatial finite-dimensional smooth f. The diagonal object and inverse exceptional twist are correct; the theorem is not exported to nonproper BC maps.

### `VS2/qcqs-condensed-sets` — verified

PQ A.1–A.4: definitions use profinite test objects and a quasicompact diagonal on actual CondensedSet. The suggested version uses epimorphisms and categorical pullbacks; tests include nonquasicompact infinite discrete sets.

### `VS2/relative-solid-homology` — verified

VII.3.1: pullback preserves limits at adequate cutoffs, so f♯ exists for every small-v-stack map; projection and arbitrary base change follow by mates. API/tests distinguish this left adjoint from eligible torsion lower shriek.

### `VS2/solid-abelian-groups` — verified

CS 5.8 and 6.1: full subcategory reuses the pinned integer IsSolid predicate; abelian, limit/colimit and extension structure is new. Suggested signatures use actual ObjectProperty.FullSubcategory and short exact sequences; no second solidity predicate is introduced.

### `VS2/solid-four-operations` — verified

VII.2.1–VII.2.5: tensor is solidified, internal Hom is solid, and arbitrary solid base change is retained. Compatible cutoffs are explicit. Properness alone is not used to infer a pushforward projection formula.

### `VS2/solid-free-structure` — verified

CS 5.4–5.8: Nöbeling is imported from the pinned freeOfProfinite theorem, while solidity and hypercover exactness are new. Existing profiniteSolid/free/maps are reused and finite-set compatibility is tested.

### `VS2/solid-geometric-base-change-and-drinfeld` — unverifiable

VII.2.6–VII.2.8: all three geometric field-extension cases and Drinfeld full faithfulness are supported by the source; however the generic VII.2.6 and the VS1-dependent VII.2.7–VII.2.8 must be separated under RT30. Mathematics checked; stage ownership/core isolation remains unresolved. See G-rt30-scope.

### `VS2/solid-partial-support` — unverifiable

VII.2.9: construction and proper finite-dimensional scope checked; the nonzero test was added. RT30 explicitly places this target in VS4, whereas its current ID, parent stage and reader still put it in VS2. Mathematics checked; stage ownership/core isolation remains unresolved. See G-rt30-scope.

### `VS2/solid-partial-supported-vanishing` — unverifiable

VII.2.10: checked reduction to torsion IV.5.3; the alternative bounded-below or cohomologically smooth hypotheses are correctly retained. RT30 explicitly places this target in VS4, not VS2. Mathematics checked; stage ownership/core isolation remains unresolved. See G-rt30-scope.

### `VS2/solid-sheaf-structure-and-completion` — verified

VII.1.10–VII.1.18: checked finitely presented=Pro(constructible torsion), Ind presentation, vanishing higher inverse limits and the derived fully faithful solid subcategory. Cutoff presentability is kept separate from unrestricted global presentability.

### `VS2/solid-sheaves-on-v-stacks` — verified

VII.1.1–VII.1.9: j♯ generators, Hom-extension criterion and spatial-chart descent are correct; Λ means solid underlying Zhat^p-modules, not naive arbitrary-Λ solidity. Cutoff comparisons remain explicit gaps.

### `VS2/solidification` — verified

CS 6.1–6.2: ordinary reflection and derived left adjoint are distinguished; derived solidification need not stay in degree zero. The actual suggested adjunction, unit, counit and free-object comparison have meaningful categorical types.

### `VS2/torsion-solid-comparisons` — unverifiable

VII.4.1–VII.4.3: checked naive versus contravariant embeddings, overconvergence, finite Tor amplitude and bounded-below/finite-dimensional pushforward conditions. The bundled ULA-Hom input from VS1 needs explicit reconciliation with generic-core isolation, not an unqualified VS1→VS2 stage edge. Mathematics checked; stage ownership/core isolation remains unresolved. See G-rt30-scope.

### `VS2/z-solid-analytification` — verified

BCGP 2.4.1 and SA/AS ownership: the discrete A category uses underlying-integer solidity and imports AnSpec/gluing. It is not identified without proof with A-solid coefficients; the light/regular-cutoff interface is an honest gap.

### `VS3/lisse-adjoints-and-operations` — verified

VII.6.1–VII.6.2: the coreflection is glued at cutoffs; kernel detection uses the smooth chart generators. Internal Hom and pushforward are lisse projections of solid operations, and global solid presentability is not assumed.

### `VS3/lisse-category-definition` — verified

VII.6.1: verified the relative-discrete Z_ell-algebra convention and the stable sum-closed smooth-generator class. The source of a representable smooth map need not be an absolute diamond. Tests separate lisse from locally constant perfect objects.

### `VS3/lisse-coefficient-change` — verified

VII.6 coefficient discussion: actual relative-discrete solid extension sends generators to generators. Mod-ell detection is restricted to derived-complete objects; the rational category is constructed rather than asserted detectable by zero torsion reductions.

### `VS3/lisse-comparisons` — verified

VII.6.3–VII.6.6: geometric-point and torsion naive-image comparisons are correctly qualified, with bounded-cohomological-dimension basis for equality. Relative-discrete scalar extension and rational localization are kept distinct.

### `VS3/lisse-point-semiorthogonal-decomposition` — verified

VII.6.7: retained a closed geometric point presented by the specified cofiltered qcqs neighbourhoods with F_ell cohomology. The localization is not claimed for every arbitrary solid stratification.

### `VS4/classifying-stack-equivalence` — verified

V.1.1–V.1.5: continuous torsor descent for locally pro-p H and prime-to-p torsion gives smooth representations. SR owns the abelian/enhanced representation category, invariants and smooth dual, not ordinary abstract Rep.

### `VS4/compact-generation-and-compact-objects` — corrected

Added the actual torsion IV.5.3 input used in Lemma VII.7.5 and separated that proof from the solid VII.2.10 input to the stratum adjoint.

### `VS4/contractibility-of-connected-banach-colmez-torsors` — corrected

Removed the improper use of proper-smooth Poincaré duality for nonproper BC fibres. Named relative homology and the nonproper VII.5.2 comparison instead, and exposed the integral unit-homology detection/completion argument as G-bc-unit-homology. Testing arbitrary rational solid objects only modulo ℓ would not suffice.

### `VS4/hn-localization-and-geometric-invariance` — verified

V.2.2–V.2.3 and VII.7.1–VII.7.3: finite HN decompositions on qc opens are extended by justified exhaustion. Torsion locally closed invariance and lisse open invariance are not conflated; no infinite direct product is asserted.

### `VS4/lisse-stratum-left-adjoint` — verified

VII.7.2: L_b=π_b♯q_b* is fully faithful via the BG4 chart, connected-kernel equivalence and the solid partial-vanishing input. The unit is in the correct direction; this remains a VS4 target as RT29 requires.

### `VS4/strata-are-classifying-stacks` — verified

V.2.2 and VII.7.1: BG3 supplies the split classifying-stack geometry including its positive BC kernel; VS proves the sheaf equivalence rather than discarding that kernel. SR categories and their derived extension are explicit suppliers.

### `VS4/strict-locality-of-the-chart` — verified

V.3.1–V.3.2, V.4.2–V.4.3: checked absolute punctured-chart dimension, boundary gluing and exact pro-p invariants. The Spa C base-change is not incorrectly assumed quasicompact; formal-adic comparison is requested in its exact I-adic scope.

### `VS5/bernstein-zelevinsky-duality` — verified

V.5.1–V.5.3: compact representability, involution and basic-stratum smooth BZ comparison use chart compact generators and the homology pairing. SR derived duality is requested rather than assumed available in SR.2.

### `VS5/duality-and-admissibility-coefficient-change` — verified

VII.7.9 and IX.2.1–IX.2.3: checked derived coefficient extension, compact BZ compatibility and ULA internal-dual comparison; perfect descent is restricted/requested in its valid range. Existing HS1 nodes are the consumers.

### `VS5/lisse-bernstein-zelevinsky-duality` — verified

VII.7.6: the pairing is solid homology on compact lisse objects, with integral/rational coefficients and open support. It follows from the actual lisse compact generators and stratum adjunction, not torsion substitution.

### `VS5/lisse-kunneth` — verified

VII.7.10: verified compact exterior generators and Hom tensor comparison in the lisse category. E2 corrects the isolated D_et notation; the statement includes Q_ell and the existing coefficient conventions.

### `VS5/lisse-ula-definition` — verified

VII.7.8: the explicit diagonal lisse-Hom criterion is for Bun_G→*, not an unsupported general notion of lisse ULA. API/tests include perfect scalar, inadmissible regular representation and rational coefficient cases.

### `VS5/lisse-ula-equals-admissibility` — verified

VII.7.9: admissibility is perfection of the full derived K-invariants for every open pro-p K on every stratum over Λ_disc, not merely finite cohomology in each degree. The criterion includes integral/rational relative-discrete coefficients.

### `VS5/lisse-verdier-exchange` — corrected

Removed the additional lisse reflexivity criterion and its unproved localization outline. The named target is the VII.7.7 exchange; RT29 excludes a new reflexivity node because FS omits that proof. Torsion V.6.2 reflexivity remains in its own node.

### `VS5/torsion-bun-homology-and-haar-dualizing` — verified

V.3.1–V.3.5: the normalized smooth-stack left adjoint is canonical; global trivialization depends on the chosen Haar measures. G-haar exposes that construction and no arbitrary stacky eligible lower-shriek extension is inferred.

### `VS5/torsion-kunneth` — verified

V.7.1–V.7.2: compact exterior generators and Hom tensor comparison identify the presentable categorical tensor product, not a Cartesian product; EDS owns the required enhanced tensor input.

### `VS5/ula-equals-admissibility` — verified

V.7.3: checked the relative diagonal criterion and stratum reduction to perfect derived pro-p invariants. Bounded Tor amplitude is retained in perfection; this is the torsion statement separate from VII.7.9.

### `VS5/verdier-biduality-and-reflexivity` — verified

V.6.1–V.6.3: checked the open exchange and the torsion biduality localization argument. Reflexivity is that of the full K-invariants complex, not pointwise finite-dimensional cohomology; no reflexivity assumption is needed for exchange.
