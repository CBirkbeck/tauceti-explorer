# Independent review: admissible pairs and p-adic Hodge structures

Job `REV-DESIGN-AdmissiblePairsAndPadicHodgeStructures`; issue #3488; reviewer Codex, session `codex-bosL7v`; 19 October 2026. The design was written by another session (`codex-dWoEF5`, #3419).

**Accepted after corrections**, as a complete target-level planning pass with an explicit open proof input. All 13 layers are planned and none is closed. AP6's arbitrary-field de Rham criterion is a recorded gap; downstream theorems inherit it. This verdict asserts neither proof closure nor implementation.

## Counts and coverage

- 78 nodes: 63 corrected, 15 verified, 0 added, 0 unverifiable. A corrected verdict includes exact supplier substitutions or test-kind normalization; the node register below distinguishes the mathematical changes.
- 24 definitions, 10 constructions, 37 theorems, one comparison and six applications. All 34 definitions/constructions have at least three discriminating tests: 136 API statements and 104 tests in total (two new tests).
- Six pinned baseline citations confirmed; none removed or replaced. No new library declaration is claimed.
- 58 planets across 13 layers, at most six in a layer; target-level granularity retained.
- All 191 extraction items remain routed: 145 owned-target routes, 44 imports and two context-only routes. The Liu–Zhu context route now names the remaining criterion rather than claiming a repair from fixed-type geometry. Corrected the subdiamond, period-module, six-operation and relative-curve import owners.
- Original 43 stage-wide requests audited against supplier statements. Thirty-five become exact imports; eight retain only missing extensions. Three new requests concern the full-rank criterion, ordinary Igusa tower and localized-period finite-projective descent. Final total: eleven requests, one explicit gap.
- 48 inherited source findings independently checked: 47 confirmed, E24 rejected. Three additional findings, E49–E51, confirmed. Final total: 50 confirmed and one rejected.

## Mathematical corrections

1. **AP0 proof order and locators.** The proof of HK I Theorem 3.2.6 uses Theorem 3.5.1. The old graph put the dependency in the opposite direction. Specialization now precedes exactness and depends on the goodness definition; the exactness proof cites it. Bilattices are Definition 3.2.1/Lemma 3.2.3, p. 24. The exactness proof is pp. 30–31, not the intervening deformation discussion.
2. **Period local systems and integral loci.** Coefficient local systems are v-local, with the complete Huber hypotheses retained. Analytic vector bundles correspond only to étale-trivializable O-local systems; a Tate-twisted O-local system on a rigid point detects the distinction. Lemma 2.3.2 is about affine finite-type schemes over a p-adic L and a perfectoid point over L, not arbitrary schemes over B_dR+(S). Strongly Zariski closed quotient transitivity uses the actual quotient-ring interface.
3. **Flat-bundle descent.** The residual comparison is M0(E) tensor O ≅ v*E, not merely an equality after pushforward. Local analytic trivializations of E give maps from rigid diamonds to a rigid flag variety; seminormal full faithfulness then descends the filtration. This supplies the missing analytic descent in the essential-image proof. The Faltings extension detects Griffiths transversality.
4. **The AP6 criterion remains open.** HK II Theorem 7.2.3 ranges over arbitrary p-adic fields containing Q_p-breve. Liu–Zhu's cited rigidity results assume a finite extension of Q_p. Resolution fixes singularities, not this field restriction. The old attempt to obtain constant Levi type from a theorem assuming fixed Levi type was circular. The independent full-rank de Rham criterion is specified at `PadicHodgeTheory:P8:local-rational`; only its constant-flat-bundle case is required. The family-type target, coverage and reader now expose that input. No new local arithmetic theorem is asserted proved.
5. **Neutral forms and family frames.** The canonical subgroup's isocrystal functor is globally fixed even for disconnected Y, so b_H exists independently of connectedness. The varying form is its étale H-fibre functor, controlled by ker(H¹(Q_p,H)→H¹(Q_p,G)). Separately, a pointwise Hodge/admissible equivalence is not an unframed equivalence of neutral families: an isocrystal-frame torsor can obstruct the inverse. The API and a new test retain that obstruction.
6. **Product connectedness.** Spelled out the eligibility included in cohomological smoothness. The proof uses degree-zero Verdier duality, shriek base change/projection and smooth twisted pullback. Removed the unsupported connected-exhaustion step and imported S2 for the actual Künneth ingredients.
7. **Localized period modules.** The current RF4 descent node supplies completed positive-ring modules and localized isomorphisms, not effective descent of every localized B_dR-module. Added the exact missing evaluation/effective-descent contract at the RF4 vector-bundle owner; a D1 covering theorem alone does not supply it.
8. **Applications.** The existing Hodge-type perfectoid tower and period map are supplied over C. Finite-level basic uniformization over the unramified field remains its own explicit hypothesis. Ordinary Katz–Igusa formal/generic tower connectedness and full monodromy are requested from the Igusa owner, rather than inferred from a Hodge-type perfectoid tower. Quaternionic uniformization and local EL period comparisons use existing exact nodes.
9. **Synchronization.** Regenerated the reader's target statements, APIs, checks and prerequisite lists from the corrected packet while retaining all worked examples. Corrected the AP6/AP7/AP12 examples. Updated roadmap dependencies, the Igusa owner and the AP6 description. Suggested Lean changes only explain the criterion and frame boundary; no unsupported geometric carrier or data axiom was introduced. Test-kind labels `value` were changed to `computation`.

## Sources and source findings

Both Howe–Klevdal arXiv-v2 PDFs match the recorded SHA-256 values. Every node's cited statement/proof and every inherited finding locator was checked. Scholze Theorem 7.6 and Definition 8.3/Theorem 8.4, and Liu–Zhu Theorems 1.3/3.9 were read at the required comparison boundaries. Bhatt–Hansen Definition 2.5, p. 7, confirms the weakly Shilov correction. V1 Lemma 4.1.1, p. 20, was downloaded and compared with v2's basic-stratum replacement.

The published Part I PDF was served. Selected passages were collated at pp. 1004, 1006, 1008 and 1014; this is not a full journal-text collation. The Part II DOI and author SharedIt route failed to supply article text (the latter returned an empty HTTP 202 response); its findings remain scoped to arXiv v2, whose numbering differs from the journal. The author publication page and a search for errata/corrigenda yielded no separate correction for the new Part I formulas. No source passage is reproduced in the deliverables.

- **E24 rejected:** HK II p. 23 already defines M0 from the trivial filtration. The inherited entry identifies no error; it is retained with a rejecting verdict and provenance.
- **Inherited descriptions corrected:** E3 actually prints G(O); E12 is a field/local-system font slip before the correctly graded definition; E17 concerns covering indices; E18 loses the tilt in the completion formula, not the theta display; E25 concerns the v-stack theorem number; E38 concerns étale rather than isocrystal forms; E42 concerns geometric irreducibility and smooth-source use; E44 invokes unassumed algebraic closedness where infinite residue suffices. E13 now records the unresolved field-scope criterion honestly. Every finding has its own reason in `sourceIssues`.
- **E49 added:** the p-adic branch of Lemma 4.3.2 and §4.4 has inconsistent slope signs. Use slope −w/2 for the modified weight-w bundle, Hom(O(−w/2),E_w) tensor D_w/2 over its endomorphism algebra, and weight=2·Newton. Q_p(−1) rules out the printed realization. The unified real branch keeps its own convention.
- **E50 added:** the weight-w summand in the proof of Theorem 5.1.6 is W_w/2, as the Tate pair Q_p(1) shows.
- **E51 added:** in Lemma 4.3.1 the modification cokernel for M1⊆M2 is M2/M1. The next lemma already uses that order.

## Baseline and ownership

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` were checked by reading the full cited declarations at those commits. The baseline contains:

- `mathlib:WittVector.Isocrystal`: A module over Frac(W(k)) with a Frobenius-semilinear automorphism; higher-dimensional classification is not supplied.
- `mathlib:WittVector.StandardOneDimIsocrystal`: The actual rank-one carrier with Frobenius p^m times coefficient Frobenius.
- `mathlib:WittVector.isocrystal_classification`: Rank-one classification over an algebraically closed characteristic-p field, under finrank=1; not full Dieudonné–Manin.
- `tauceti:TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`: The natural group-functor isomorphism reconstructing a Hopf algebra’s points from its representation fibre functor, with the prescribed universe lift; not the abstract neutral-Tannakian equivalence.
- `mathlib:dense_iInter_of_isOpen`: A countable intersection of dense open sets in a Baire space is dense; use the existing complete-pseudometrizable Baire instance from Topology/Baire/CompleteMetrizable.lean.
- `mathlib:nonempty_interior_of_iUnion_of_closed`: A countable closed cover of a nonempty Baire space has a member with nonempty interior.

The reviewed library audit was read. Current TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were inspected read-only, including the roadmaps that postdate the atlas snapshot. AdicSpaces and AlgebraicVectorBundles supply their existing foundations. ReductiveGroups already supplies representations/comodules, faithful embeddings, Lie and quotient theory, reductive quotient affineness and parabolic Levi decomposition. Requests now identify only the additional countable Chevalley-line, adjoint-kernel/orbit, observable-embedding and arbitrary-group equivariant Mostow interfaces. Existing AI.2 BKF targets remain imported; the rational rigidified modification equivalence is its extension, not a competing category here. No upstream file was edited and no target was moved upward.

## Questions and follow-up for the orchestrator

Route the explicit P8 full-rank criterion gap to its existing local rational owner, independently of AP6. Its statement must cover complete discretely valued fields with perfect residue, particularly extensions of Q_p-breve; a finite-Q_p rigidity theorem or fixed-type Grassmannian theorem does not suffice. The remaining ten supplier extensions are enumerated with exact consumers in `requests`; preserve their ownership. The four current ReductiveGroups extension contracts refine existing layers and must not generate duplicate base theory. No additional claim was taken in this review.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/AdmissiblePairsAndPadicHodgeStructures.json`: 0 errors, 0 warnings.
- `lean-check research/blueprint/suggested/AdmissiblePairsAndPadicHodgeStructures.lean`: exit 0 at the pins, only the 13 expected theorem/example `sorry` warnings; 187 lines, one real-bodied light definition, seven theorem signatures and six examples. No data definition uses `sorry`.
- Submission-path/JSON check: six files, zero problems. Source-finding schema/version checks, source-verdict completeness, target/reader synchronization and planet bounds: passed. `check_sorry_data.py` and `git diff --check`: passed.

## Node register

Each source locator appears on its node and in the reader. The following records the independent mathematical check, including the nature of every correction.

| Node | Verdict | Check or correction |
| --- | --- | --- |
| `bilattice` | corrected | Corrected the two-lattice locator to Definition 3.2.1/Lemma 3.2.3. Rank-one trace jumps and ramification scaling agree with the definition; imported period-ring nodes explicitly. |
| `good_point` | corrected | Goodness retains a cocharacter splitting of both lattices and its G-structure. The additive extension tests failure of tensor-exact traces; normalized test-kind labels. |
| `specialization` | corrected | Theorem 3.5.1 precedes the exactness criterion in its proof dependency: removed the reverse dependency and used goodness directly. |
| `good_exact` | corrected | The proof of Theorem 3.2.6 uses specialization after a split filtered fibre functor. Corrected the proof locator and prerequisite direction. |
| `lattice_recovery` | corrected | The adjoint upper bound and G_a counterexample match Proposition 3.1.7/Example 3.1.10; replaced period-ring stage requests by exact imports. |
| `g_isocrystal` | corrected | Separated HK I §2.2.3 from HK II §4.1 locators; the non-reductive basicness condition is centrality in G, beyond basicness in its Levi. |
| `levi_B` | corrected | Corrected HK I pages to 14–15; Levi classification of B(G) does not classify all non-reductive G-bundles. |
| `sigma_centralizer` | corrected | The exact tensor-Isom and reconstruction inputs supply the twisted group. The basic inner form retains Int(b) after coefficient Frobenius. |
| `bun_linear` | corrected | Imported the existing reductive v-stack, gluing and vector-bundle nodes. The owned extension is from reductive to connected linear groups. |
| `basic_strata` | corrected | Theorem 4.2.2 is used only on basic strata, with unipotent cohomology vanishing at slope zero; exact supplier nodes replace broad stages. |
| `basic_twisting` | corrected | The inverse isocrystal is for the inner-twisted Frobenius; the lattice and rational group are both changed. Tests and imports retain this order. |
| `point_hs` | corrected | The pure weight-w modification has slope −w/2. Finite graded sums are allowed, and the Tate and mixed-weight checks distinguish purity. |
| `point_adm` | corrected | Slope-zero semistability, rather than degree alone, defines admissibility; the two realizations use actual relative patching and classification inputs. |
| `point_tannakian` | corrected | The fixed-weight proof needs the p-adic negative bundle slope and the quotient M2/M1. Added source findings for those formulas and exact reconstruction inputs. |
| `basic_equivalence` | corrected | The theorem has no numbered part (3). Corrected its locator and documented the printed W_-w/2 sign slip; the target's weight=2·Newton was already correct. |
| `point_groups` | corrected | Corrected the source description of the isocrystal realization to Hom(O(−w/2),E_w) tensor D_w/2 over its actual endomorphism algebra. Generated-subcategory reduction remains a precise request. |
| `point_invariants` | corrected | Prescribed invariants keep central basicness and good-type restrictions; exact B(G) and reductive nonemptiness inputs are imported. |
| `bkf_comparison` | verified | The comparison is with rational rigidified modifications, retaining the slope-grading splitting and both realizations. Its existing AI.2 imports plus explicit extension are appropriate. |
| `good_reduction` | corrected | Corrected definition/theorem pages to 43–45; filtration-defined lattices are stronger than flags and give the stated additive counterexample. |
| `crystalline_realization` | corrected | Added the existing perfect-residue period-functor node; the target retains the strict-field crystalline comparison hypotheses. |
| `open_galois_image` | corrected | Imported the perfect-residue interface and retained the full strict-field openness extension. Passing to the completed maximal unramified field supplies the later inertia orbit. |
| `cm_transcendence` | verified | The two rational lattice structures and the basic/slope-graded distinction match Theorem B, Proposition 5.7.1 and Theorem 6.3.2; analyticity of a flag alone is insufficient. |
| `rigid_subdiamond` | corrected | Corrected pages to 15–16 and explicitly imported locally closed generalizing subdiamonds. Closed rigid-analytic and Zariski-closed image claims retain seminormality. |
| `coefficient_local_system` | corrected | Corrected v-local coefficient scope, complete Huber assumptions and the analytic-bundle criterion. Added the Tate-twisted O-local-system non-example on a rigid point. Imported positive-period descent and requested its localized-module extension. |
| `integrality` | corrected | Restored the affine finite-type L-scheme and p-adic-field hypotheses of Lemma 2.3.2; strongly closed quotient transitivity uses the precise completed quotient nodes. |
| `relative_bilattice` | corrected | Both trace filtrations use the same invertible period ideal. The jumping-type disc is not a filtered local system by direct summands; exact period-ring inputs retained. |
| `relative_good` | verified | The relative tensor-exactness criterion is v-local and geometric-fibrewise. It does not assume that arbitrary families have constant type. |
| `flat_bundles` | corrected | Strengthened residual recovery to M0(E) tensor O = pullback E, with connection recovered by pushforward. This justifies the analytic trivializations used for flag descent. |
| `flat_essential_image` | corrected | Supplied the missing analytic descent argument using local analytic trivializations of E and seminormal full faithfulness, with the Faltings extension enforcing transversality. |
| `grassmannian` | corrected | The non-reductive extension imports the existing reductive Grassmannian, preserves fpqc sheafification and distinguishes many geometric G_a points from its single rigid-source image. |
| `subgroup_gr` | verified | The observable/affine quotient hypotheses are retained. A subgroup map is not declared closed solely because it is a group embedding. |
| `grass_geometry` | corrected | The geometric and relative-position assertions use the exact reductive Schubert, bundle and rigid-source inputs; the non-reductive extension remains owned here. |
| `faithful_cutout` | corrected | Finite tensor conditions for a closed faithful representation detect the G-lattice condition; exact tensor gluing inputs supply the ambient comparison. |
| `rigid_cells` | corrected | Theorem 5.0.4(4) keeps its fixed Levi-type hypothesis. Resolution and seminormal descent do not establish that hypothesis; AP6 now records the separate criterion. |
| `bb_bound` | verified | The upper adjoint bound alone characterizes the first BB isomorphism. The inverse type uses the opposite bound; the non-reductive example separates them. |
| `family_adm` | corrected | The fixed W is global even on a disconnected base. Exact relative slope-zero and HN inputs replace the old broad supplier request. |
| `family_tannakian` | corrected | Family abelianness requires relative constant-slope kernels, beyond pointwise abelianness; imported the relevant family and connectedness-recognition inputs. |
| `family_groups` | corrected | Corrected the connectedness issue to the étale fibre form. The H-isocrystal and b_H are already global; a nontrivial H^1 kernel detects nonneutral disconnected components. |
| `family_type` | corrected | Removed the circular fixed-type argument. The arbitrary-field full-rank de Rham criterion is an explicit independent P8 request and gap; the target is justified as a source theorem conditional on that input. |
| `admissible_locus` | corrected | The neutral b-rigidified functor is represented by the stated admissible open. Its type, reflex field and slope-zero realization remain part of the specification. |
| `admissible_nonempty` | corrected | Imported the existing reductive nonemptiness, rigid-point and period-connectedness nodes. The non-reductive extension retains its projected B(G,[mu^-1]) condition. |
| `product_connected` | corrected | Made cohomological-smoothness eligibility explicit and replaced the unsupported connected exhaustion by the source's duality/Künneth argument. S2 supplies base change and projection, S3 duality. |
| `admissible_connected` | corrected | The non-reductive argument uses a connected cohomologically smooth truncated-loop factor and the reductive admissible locus, with nonemptiness already established. |
| `family_hs` | corrected | Replaced an overstrong family equivalence by a framed compatibility. A global isocrystal-frame torsor obstructs the neutral admissible inverse; added a discriminating check. |
| `family_hs_tannakian` | corrected | Relative constant-slope local triviality supplies locally free kernels/cokernels. Abstract reconstruction is imported after abelianness is established. |
| `hs_domain` | corrected | The open fixed-type Hodge domain uses a central weight homomorphism and the opposite Grassmannian convention. Its connectedness is deferred to the separate duality consequence. |
| `ht_line` | corrected | The inclusion uses Fil^n B_dR for every integer, including fractional ideals for negative n; rank-one tests distinguish the exponent direction. |
| `ht_rigid_closed` | corrected | The seminormal case needs closed analytic flag incidence via rigid-source geometry or resolution; exact diamond full faithfulness inputs are now named. |
| `special_hs` | corrected | Central basic Newton and rank-one purity place a Chevalley line in one even weight. The target retains this restriction before applying Hodge–Tate incidence. |
| `hodge_line` | corrected | The line is a rank-one sub-isocrystal with its own slope and Tate normalization. Ambient admissibility does not automatically make it an admissible subobject. |
| `admissible_functoriality` | corrected | Transport keeps the embedding, b_H and sigma-conjugating element, and respects lattice and étale realization. A bare subgroup without this datum does not define the map. |
| `subgroup_admissible` | corrected | The neutral tensor-Isom form is an open-and-closed piece of the full line locus; exact generated-subcategory and H^1-form inputs are retained. |
| `special_admissible` | corrected | The adjoint lower bound, connected component and fixed subgroup type define the special locus. Tests separate Hodge specialness from its opposite condition. |
| `torus_lubin_tate` | corrected | Torus components are indexed over the correct composite reflex field or Galois orbits; the height-two tower comparison is imported from exact EL nodes. |
| `boundary_examples` | verified | Checked the distinct b=diag(p,1) and b=diag(1,p) Borel calculations and the GL_3 Levi-type jump. Ambient and subgroup admissibility are not conflated. |
| `infinite_moduli` | corrected | Both global frames are part of the infinite-level object, beyond a neutral family. Exact tensor gluing supplies modifications and their base change. |
| `period_torsors` | corrected | The two frame torsors have different rational groups G(Q_p) and G_b(Q_p). The unramified field and both comparison lattices are retained. |
| `infinite_functoriality` | corrected | The subgroup morphism includes the sigma-conjugating element, acts on both frames, and respects the two period projections. |
| `infinite_special` | corrected | Hodge, Hodge–Tate and two-sided specialness use the corresponding one-sided adjoint inequalities and the specified connected component. |
| `special_equivalence` | verified | Minuscule ambient type gives both subgroup bounds; a general non-reductive subgroup can satisfy only one, as the cubic mirabolic example demonstrates. |
| `basic_duality` | verified | Theorem 8.5.1 exchanges modifications and the inner form together. It is applied only for basic b; no pre-assumed Hodge-domain connectedness is used. |
| `hs_domain_connected` | verified | The proof derives Hodge-domain connectedness from basic duality and the admissible-domain theorem, preserving the intended noncircular order. |
| `exceptional` | verified | The generic-point criterion and the one-way subfamily implication are correct; the disconnected two-CM-point example rules out the source's unrestricted converse. |
| `exceptional_countable` | corrected | The countable regular-representation exhaustion and compact line incidence images, rather than countability of all individual lines, yield the countable closed union. |
| `generic_density` | corrected | Corrected the Gauss-lemma locator and imported exact weakly Shilov, infinite-residue Gauss, resolution and Baire inputs. An irreducible source is resolved over its finite constant field. |
| `analytic_closures` | corrected | The empty family has intersection equal to the whole ambient space; arbitrary topology-closure and finite-union axioms are not added. Exact level-topology inputs retained. |
| `special_analytic_closed` | verified | Basicness and the appropriate one-sided special bound supply the relevant finite-level rigid closed condition; the opposite-side assertion uses basic duality. |
| `component_closure` | verified | The conjugated inner-form subgroup gives the Hodge–Tate level. With nonempty containing family the selected special component lies in every defining target. |
| `orbit_submersion` | corrected | The open Galois orbit is translated to a smooth maximal-rank stratum before constant rank and the subfield identity theorem are applied; exact analytic supplier nodes retained. |
| `ax_lindemann` | verified | The source theorem retains the empty-intersection alternative and the irreducible analytic-source hypotheses. Its generic-point and type uses inherit the explicit AP6 input. |
| `minuscule_ax_lindemann` | verified | Minuscule type makes both analytic towers rigid and all three special notions agree. The conclusion concerns the stated irreducible analytic subsets and their opposite closures. |
| `period_image_density` | corrected | Theorem B's orbit argument works directly in the flag target without basic duality. It retains the family/type theorem input and imports the exact constant-rank geometry. |
| `nonbasic_counterexample` | verified | The ordinary Serre–Tate Borel datum has constant Hodge–Tate flag, so a proper torus lift cannot be isolated by that period image. The b-diagonal agrees with this example. |
| `variation` | corrected | Variations allow étale monodromy and are separate from neutral families. M0 forgets the filtration of the associated flat bundle, and exact comparison inputs are imported. |
| `crystalline_cover` | corrected | The fixed basic stratum yields a G_b(Q_p)-frame torsor and a K-level period map. No general rigid representability or potentially-unramified theorem is asserted. |
| `igusa_boundary` | corrected | Replaced the unrelated perfectoid Shimura input with an exact ordinary Katz–Igusa formal/generic tower and full monodromy extension at IG.1; the frame-cover obstruction is conditional on that input. |
| `basic_shimura` | corrected | Retained basic uniformization as an explicit hypothesis over the unramified base and restricted the supplied infinite perfectoid tower assertion to C; added its actual period-map node. |
| `shimura_products` | corrected | The arithmetic diagonal quotient and component stabilizers are retained. The perfectoid tower comparison is over C and uses exact quaternionic uniformization/period inputs. |
