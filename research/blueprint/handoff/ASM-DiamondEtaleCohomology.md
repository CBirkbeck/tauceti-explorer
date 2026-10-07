# ASM-DiamondEtaleCohomology handoff

## Status and provenance

Assembly complete for issue #224, subject to independent review and the existing source and supplier gaps. Agent: ChatGPT GPT-6 Astra Pro. Session: `chatgpt-5c67bc37a117`. Date: 7 October 2026. The claim bot confirmed this session before work began. The output is a research plan and suggested signatures; no implementation or mathematical closure is claimed.

The inputs are the accepted C0–C7 and C8–C9 packets, both part readers and suggested files, both independent review reports, the reviewed Diamond library audit and its review, the pinned baseline, the accepted RS-05 record, the atlas extract, and the actual neighbouring link maps. The upstream AdicSpaces and DGAInfinity readers informed the introduction and organization. This is assembly of accepted source work, not a fresh independent verification of every cited paper. All accepted source-version records, eleven source-issue records and inherited source warnings are preserved.

## Deliverables and intake scope

The complete reader is `research/blueprint/readmes/DiamondEtaleCohomology.md`; the complete suggested file is `research/blueprint/suggested/DiamondEtaleCohomology.lean`. Both listed part packets are edited solely for the reconciliation described below. This note is the fifth changed file.

Issue #224's full instructions explicitly require fixing clear references in the listed part packets and explicitly permit both packet paths. Its concise deliverable list and `research/blueprint/queue.json` currently list only the reader, suggested file and handoff. The current intake's `own_files` function takes that narrower queue list, so automatic intake may leave this five-file submission to the maintainer. The PR flags this configuration mismatch; the assembly does not edit the queue, intake code, issue labels or review verdicts.

## Reader assembled and synchronized

The reader has one introduction, conventions, source register and layer overview, followed by C0 through C9 in order. It contains every one of the accepted **184 nodes, 256 API items and 176 tests**, including their statements, hypotheses, proof outlines, precise prerequisites and acceptance conditions. It collects 25 outstanding requests, 12 accepted gaps and 39 baseline declaration records. A field-by-field check found no missing mathematical field. Literal source-verification excerpts are not repeated throughout the reader; their source IDs, locators and authored explanations are retained, and the packets retain the verification excerpts.

The part readers lagged their accepted packets. Synchronization includes C0's higher-v-cohomology E46 gap and its propagation, the repaired canonical-compactification annulus argument, the distinct non-noetherian perfect-constructibility E11 gap, the perfect-local-system spreading step, higher-rank geometric stalks, the noetherian qualification on stalk/Tor-amplitude characterizations, the quasiseparated converse in the proper-colimit criterion, and the unique-lift partial-properness condition. C8 incorporates the reviewed Temkin comparisons, spectral-norm correction, locally spatial point-cd scope, residue/tame/Sylow arguments, extra tests, E2 and DGAInfinity contracts, source versions and revised gaps. These are accepted corrections imported into the new reader, not newly altered theorem statements.

The introduction distinguishes geometric transcendence degree, independent degree and modified degree; local finiteness from a uniform bound; commutative coefficients in general compactness from prime-to-p hypotheses in its geometric applications; and ordinary derived categories from their enhanced and completed suppliers. A single bound quantifies over all sheaves and all qc separated étale test objects. The boundary table preserves the actual profinite Sylow/pro-p links and the deliberate classical-local-field/general-valued-field overlap.

## Cross-part reconciliation

Fifteen C8/C9 consumer nodes replace broad same-roadmap prerequisites with exact accepted node IDs. C0/C1 supply the étale basis, stalks, acyclicity, continuity and base change; C2 supplies its named left-completion comparison; C3 supplies tensor and internal Hom; C5 supplies étale extension by zero and support triangles; C7 supplies the constructibility, filtration and restricted-compactness results. The complete graph has **184 nodes, 535 internal edges and 44 cross-part edges**, with no cycle and no unresolved same-roadmap node ID.

C7's two filtration nodes use the early C8 point-quotient, specialization-stabilizer and point-sheaf-equivalence nodes. Those depend on C0 and the geometry/profinite suppliers, not on C7. The later C8 constructible-support argument then uses C7. The introduction makes this declaration order explicit; collapsing all of C8 into one stage vertex would introduce a spurious cycle.

Two accepted identifiers remain compatible exports with one proof owner:

- `C8/strictly-disconnected-acyclic` imports `C0/std-etale-acyclic`; its direct-image consumer now references C0 directly. C0's acceptance text records the ownership and stable export.
- `C9/bounded-filtered-compactness` specializes `C7/perfect-constructible-restricted-compactness` through `C7/perfect-constructible-over-field`, with the same common lower bound.

Only these two proof outlines change. No packet theorem statement, hypothesis, API item, test, source record, baseline claim or review verdict changes. The proof-outline changes identify accepted imports instead of duplicating proofs. No changed mathematical assertion requires a new source correction; the reconciled references and newly written Lean signatures still need the normal assembly review.

The C8 request list decreases from 21 to 16: broad same-roadmap requests are replaced by their actual suppliers, leaving one precise C7 request to promote `IsPerfectLocalSystem.dualizable` from an API item to a named prerequisite lemma. The corresponding existing finite-window/generation gap explicitly records this granularity obligation. The D5 localization request is narrowed because C0 supplies cohomological continuity once D5 supplies the geometric localization. Both parts' source gaps remain visible, and no coverage stage is newly declared closed.

## Suggested Lean assembly

There is one standard note, one block of **71 unique individual imports**, one common namespace convention and one noncomputable section. All **749 original named declarations** survive. The final file has **768 named declarations and 159 examples** across 6,099 lines. Seventeen previously omitted C8/C9 node signatures can now use the shared C0–C7 carriers; 32 whole-node omissions remain explicit. Object-wise Postnikov convergence is labelled partial: essential surjectivity onto compatible Postnikov towers remains the E2 category-level request. Enhanced comparisons and coherent cutoff interfaces also remain partial.

Shared spellings now refer to the same constructions: `qpPull/qpPullD`, `qpPush/qpPushD`, `vPush/vPushD`, their adjunction, `etPushDer/etPushD`, `etPullDer/etPullD`, `IsSurjectiveMap/IsVCover`, and `IsQuasiProEtaleMap/IsQproetV`. `etToQp`, `vToEtPush`, `rGamma`, the two constant-sheaf spellings and the object part of `vHom` compose or reuse the common functors. The continuous-sheaf interface restores actual topological-ring and continuous-module hypotheses; canonical-compactification factorization and its map restore separatedness. These corrections align signatures with the accepted mathematics. The additional compactness helper uses the pinned additive coyoneda functor and literal coproduct preservation, with no invented compact-object class or arbitrary proposition field.

All 256 API names and 176 test names occur, including explicit omission notes. This is not a claim of 432 executable signatures. Nineteen APIs remain comment-only and 22 packet tests remain omitted for missing geometric interfaces, as in the reviewed inputs. There are 154 represented packet tests, four original supplementary examples and one additional zero-object compactness check. The untyped completed residue fields, profinite quotient and continuous-cohomology dictionary, cohomological-dimension/inertia interfaces, quasi-augmentation coefficient maps and analytic residue-field constructions stay recorded as omissions.

## Validation and its limits

Command run on both final edited packets:

```sh
python3 scripts/check_blueprint.py research/blueprint/packets/DiamondEtaleCohomology--C0.json research/blueprint/packets/DiamondEtaleCohomology--C8.json --json
```

Both report zero errors and zero packet warnings. The browser-agent workspace used the exact atlas index and actual fetched supplier packets. The checker issued its global warning that no declaration index was installed, so baseline references were checked for form only. The repository CI must perform its normal pinned-index check. No missing local file was treated as a missing mathematical supplier. No new baseline claim was added to either packet.

Additional reads at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` checked `Mathlib/CategoryTheory/Preadditive/Yoneda/Basic.lean`, `Mathlib/Topology/Algebra/Module/Basic.lean`, `Mathlib/CategoryTheory/Triangulated/Generators.lean`, and the `Mathlib/Data/ZMod/Basic.lean` header/imports. They confirm the actual additive-Hom and topological-module APIs used by the new signatures; the triangulated generators file does not itself supply the requested compact-object generation theorem. Tau Ceti remains pinned at `f790474821cf4256814db967cb154e7af3d0c369`.

Static checks found no duplicate imports or named declarations, lost original names, unbalanced comments/delimiters/scopes, `axiom` declarations or proposition-valued sorry placeholders. Reader checks verified all 184 nodes and their mathematical fields, ten layer headings and one opening title. Packet comparisons verified unchanged review objects and mathematical statements/hypotheses/API/tests/source/baseline records. All five submission paths and their text were checked for JSON validity and private paths.

**The assembled Lean file was not compiled.** No pinned build is installed, and `free -g` reported 9 GB available, below WORKERS.md's 20 GB threshold. No Lake project, cache, build, language server or background Lean process was started. The earlier part-review compilation results do not establish elaboration of this assembled file.

## Remaining work and where to resume

Review the unified introduction, the fifteen exact-reference lists, the two compatibility exports, the shared Lean interfaces and the seventeen added C8/C9 signatures. Elaborate the assembled suggested file only in an existing pinned build with sufficient memory. Resume mathematical closure from the twelve explicit packet gaps and the supplier requests below; neither assembly nor lexical checking discharges them. In particular retain E46, the general-coefficient E11 issue, E2's category-level completion and C7's dualizability-API promotion. Preserve the distinction between a gap affecting a whole multi-clause node and the special cases that already have accepted proofs.

The seven inherited restructuring proposals and all twenty-five current requests are collected verbatim in content below, with no new verdict. The C0 acyclicity proposal is implemented at the level of one proof owner and redirected consumers while retaining C8's stable ID for accepted incoming references. Atlas-level edits and the RS-05 ownership correction remain with the maintainer. The accepted review's optional promotion of representable-v-stack topological dimension to a definition/API, and explicit C8 references when C7's representation API is promoted, remain future granularity work.

Scratch verification can be reproduced by checking the final deliverables and the accepted input files; no private workspace path or scratch dependency is needed to resume.

## Collected restructuring proposals

### C0 proposal 1

**action:** rescope

**roadmaps:** `DiamondEtaleCohomology`, `DiamondsAndVStacks`, `DiamondSixOperations`

**detail:** RT-AREA-padic-1/11. Accepted RS-05 lists the owner of 'Diamond canonical compactification geometry' as DiamondsAndVStacks:D5 (formerly C4 and S0), but D5's text does not contain ECD §18, its reason in RS-05 is shifted by one layer, and C4 keeps the construction in its text. The DiamondsAndVStacks packet treats ECD Proposition 18.6 as C4's (its D3 coverage), and DiamondSixOperations:S0 requests §18 from C4.

**proposal:** Correct the RS-05 owner entry to owner DiamondEtaleCohomology:C4 (formerly DiamondsAndVStacks:D5 and DiamondSixOperations:S0) for ECD §18 (proper and partially proper maps, valuative criteria, the envelope Ȳ, the canonical compactification and its universal property, Corollary 18.8, Propositions 18.9–18.10). Rewrite the D5 keep reason to D5's text (ECD §§11–13: spatial diamonds, relative representability, maximal Hausdorff quotients) and the D2 keep reason so that effective descent (ECD 9.2–9.11) is D3's, as D3's text says. Keep the RS-05 link D5 → C4 for the spatial geometry C4 uses, and the C4 → S0/S1 links. This packet plans §18 in C4 accordingly.

### C0 proposal 2

**action:** rescope

**roadmaps:** `DiamondEtaleCohomology`

**detail:** DiamondEtaleCohomology:C8/strictly-disconnected-acyclic (C8 part) states the étale acyclicity of strictly totally disconnected spaces with prerequisite the stage C0. The same statement is ECD §14 material, used in the proof of Proposition 14.10, and is planned here as DiamondEtaleCohomology:C0/std-etale-acyclic.

**proposal:** At assembly, retire C8/strictly-disconnected-acyclic in favour of C0/std-etale-acyclic and point its consumers (C8/qpetale-direct-image) at the C0 node; one owner, no change of mathematics.

### C0 proposal 3

**action:** rescope

**roadmaps:** `DiamondEtaleCohomology`

**detail:** C1's text asks for Theorem 16.1 'and its corollaries' while forbidding the use of the étale subcategory D_ét defined after 14.12. Corollaries 16.5 and 16.8 are statements about membership in D_ét of small v-stacks, so they are planned in C2 (nodes qproet-pushforward-etale, qcqs-pushforward-preserves-etale) right after Definition 14.13; Corollaries 16.4 and 16.9 are planned in C1 for complexes on the quasi-pro-étale site with étale cohomology sheaves, which C2 identifies with D_ét.

**proposal:** Add one sentence to C1 and C2: 'Corollaries 16.5 and 16.8, which concern D_ét of small v-stacks, are proved in C2 after Definition 14.13; C1 states 16.4 and 16.9 for complexes whose cohomology sheaves come from the étale site.'

### C0 proposal 4

**action:** rescope

**roadmaps:** `DiamondEtaleCohomology`, `PrismaticCohomology`

**detail:** PrismaticCohomology--PR.8 requests from C0 the completed structure sheaves Ô_Y, Ô⁺_Y on Y_qproét (Mann–Werner) and quasi-pro-étale descent with Z_p coefficients. A diamond has no structure sheaf; Ô_Y exists only after choosing an untilt (Y over Spd Z_p with Y^♯), which is not in ECD §14 or in C0's text.

**proposal:** Route the completed structure sheaves of untilted diamonds to the layer that owns untilts and relative period sheaves (for example a DiamondsAndVStacks D6 continuation or the PrismaticCohomology layer itself); C0 supplies the site Y_qproét, its repleteness and the comparisons of this packet.

### C0 proposal 5

**action:** rescope

**roadmaps:** `DiamondEtaleCohomology`, `SchemeAndStackFoundations`

**detail:** Stage C5 lists the external marker UPSTREAM:ECD:SCH_BC (proper base change for schemes) among its requires. This packet supplies it through SchemeAndStackFoundations:SF.2, whose text owns proper and smooth base change, via its request and via ClassicalAdicEtaleCohomology:H1:valuation-exports/proper-nearby-cycle-cohomology.

**proposal:** Replace UPSTREAM:ECD:SCH_BC in C5's requires by SchemeAndStackFoundations:SF.2 (proper base change for torsion sheaves, SGA 4 XII 5.1, Stacks 095T; étale topos of a limit, SGA 4 VII 5.7).

### C0 proposal 6

**action:** rescope

**roadmaps:** `DiamondEtaleCohomology`

**detail:** Stage C7 requires C3, DiamondsAndVStacks:D5 and EnhancedDerivedSheaves:E1, but its nodes use étale extension by zero (ECD 19.1, C5/etale-extension-by-zero, open-support-triangle, extension-by-zero-base-change) throughout §20; C5 does not depend on C7, so there is no cycle.

**proposal:** Add DiamondEtaleCohomology:C5 to the requires of DiamondEtaleCohomology:C7.

### C8 proposal 1

**title:** Adic spaces, Part II: general analytic valuative partial properness

**reason:** CS17 Remark4.2.20 is used in general analytic scope, whereas AdicEtaleGeometry:A2’s read contract specifies noetherian analytic scope. Extend the existing AdicSpacesPartII direction with the general valuative predicate, rank-one specialization and comparison, rather than constructing an incompatible partial-properness predicate inside C8.

**supplier:** AdicSpacesPartII:R0

**consumer:** DiamondEtaleCohomology:C8

## Collected outstanding requests

### C0 request 1: `DiamondsAndVStacks:D0`

Limits of fibred coherent topoi and their cohomology (SGA 4 VI 8.2–8.3 and 8.7.7): for a cofiltered system of coherent topoi with coherent transition morphisms and an abelian sheaf (resp. a sheaf of groups, of sets) pulled back from one stage, H^j of the limit topos is the colimit of the H^j of the stages (all j, resp. j ≤ 1, resp. j = 0); together with the coherent-topos notion (algebraic topos with qcqs final object) and SGA 4 VI 1.3, 1.17, 2.2, 2.6, 2.8 for categories of small sheaves. The same contract is already requested by ClassicalAdicEtaleCohomology--H0 and PerfectoidSpaces--P0. Also Deligne's theorem (SGA 4 VI 9.0): a locally coherent topos has enough points, used to apply EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi to Y_v,κ. Also: for a cofiltered system of spectral spaces T_i with limit T, Sh(T) = lim Sh(T_i), and every constructible sheaf on T is pulled back from some T_i (SGA 4 VI 8, IX 2.7), used for Lemma 19.4.

**Needed by:**

- `DiamondEtaleCohomology:C0/etale-cohomology-continuity`
- `DiamondEtaleCohomology:C0/algebraic-topoi`
- `DiamondEtaleCohomology:C0/perfectoid-bases-and-coherent-subsites`
- `DiamondEtaleCohomology:C5/zariski-riemann-acyclicity`
- `DiamondEtaleCohomology:C3/pullback`

### C0 request 2: `DiamondsAndVStacks:D3`

ECD Lemma 9.5 as a node of its own: for C algebraically closed nonarchimedean with open bounded valuation subring C⁺, a rational open V of a finite-dimensional perfectoid ball over Spa(C, C⁺) with V → Spa(C, C⁺) surjective has a section Spa(C, C⁺) → V; and its consequence over a strictly totally disconnected base X: a rational open of a perfectoid ball over X that is a v-cover of X splits. At present the statement is a side clause of descended-subsets-are-cut-out-by-functions and its formal-scheme proof is a recorded D3 gap.

**Needed by:**

- `DiamondEtaleCohomology:C0/v-pullback-higher-vanishing`

### C0 request 3: `DiamondsAndVStacks:D3`

ECD Propositions 10.9 and 10.10 for maps of v-stacks: f is separated iff it is 0-truncated, quasiseparated and (K, K⁺)-lifts along Spa(K, O_K) ⊂ Spa(K, K⁺) are unique for perfectoid fields K; and for separated f and a perfectoid Tate pair (R, R⁺), a map Spa(R, R⁺) → Y′ over Y is determined by its restriction to Spa(R, R°). Only the perfectoid-space cases exist (PerfectoidSpaces:P4/valuative-criterion-separatedness, P4/separated-unique-extension-from-rank-one-locus).

**Needed by:**

- `DiamondEtaleCohomology:C4/valuative-criterion-proper`
- `DiamondEtaleCohomology:C4/partially-proper-map`
- `DiamondEtaleCohomology:C4/compactification-of-separated-sheaf`
- `DiamondEtaleCohomology:C4/canonical-compactification`

### C0 request 4: `DiamondsAndVStacks:D5`

Converse of ECD 11.20, without spectrality: for a small v-sheaf Y, a surjection X → Y from a totally disconnected perfectoid space, and a subset T ⊂ |Y| whose preimage T_X ⊂ |X| is pro-constructible and generalizing (for example T closed with generalizing preimage), Y_T := Y ×_{|Y|} T is a sub-v-sheaf with Y_T ×_Y X = X_{T_X} (ECD 7.6, 10.5), Y_T → Y is a quasicompact injection and |Y_T| = T. If Y is spatial (resp. a locally spatial diamond and T quasicompact), Y_T is spatial (resp. a spatial diamond). A qcqs v-sheaf need not have spectral |Y| (|T̲| = T for compact Hausdorff T), so the statement may not presume it.

**Needed by:**

- `DiamondEtaleCohomology:C4/valuative-criterion-proper`
- `DiamondEtaleCohomology:C4/tautness-criterion`

### C0 request 5: `DiamondsAndVStacks:D5`

Localization Y_y of a spatial diamond at a point y (the limit of its quasicompact open neighbourhoods; |Y_y| is the chain of generalizations of y) and a quasi-pro-étale surjection Spa(C, C⁺) → Y_y with C algebraically closed. This joins the two D5 requests of DiamondEtaleCohomology--C8 for the field-point presentation.

**Needed by:**

- `DiamondEtaleCohomology:C7/constructible-filtration`
- `DiamondEtaleCohomology:C7/perfect-constructible-filtration`

### C0 request 6: `DiamondsAndVStacks:D5`

For a locally compact Hausdorff space T, the v-sheaf T̲ : X ↦ C(|X|, T) is a small v-sheaf with |T̲| = T, T ↦ T̲ is fully faithful, T̲ is the filtered colimit of K̲ over compact K ⊂ T along closed immersions, and for maps T′ → T and X → T̲ with X perfectoid, |T̲′ ×_T̲ X| = T′ ×_T |X|. DiamondsAndVStacks:D4/compact-hausdorff-diamonds covers compact Hausdorff spaces relative to Spa(K, O_K) only.

**Needed by:**

- `DiamondEtaleCohomology:C4/locally-compact-hausdorff-proper`

### C0 request 7: `EnhancedDerivedSheaves:E2`

Module-coefficient versions of E2/left-completion, E2/replete-postnikov-unit and -counit, E2/inverse-limit-amplitude and E2/unbounded-hypercover-descent: for sheaves of O-modules on a replete ringed topos (in particular the constant ring Λ), D(X, O) is left-complete, R lim of a sequence of module sheaves has amplitude [0, 1], and pullback along a hypercover identifies D(X, O) with the cartesian objects. The current nodes are stated for abelian sheaves.

**Needed by:**

- `DiamondEtaleCohomology:C0/left-completeness`
- `DiamondEtaleCohomology:C2/v-hyperdescent`
- `DiamondEtaleCohomology:C3/qcqs-base-change-finite-cd`
- `DiamondEtaleCohomology:C5/compactification-hypercover`

### C0 request 8: `EnhancedDerivedSheaves:E3`

HTT 5.5.3.12–5.5.3.13: a small limit of presentable ∞-categories along colimit-preserving functors, computed in Cat_∞, is presentable and the projections preserve colimits; and HTT 5.5.2.2: a functor C^op → S on a presentable ∞-category is representable iff it preserves small limits. EnhancedDerivedSheaves:E5:presentability/presentable-categories gives only the definition.

**Needed by:**

- `DiamondEtaleCohomology:C2/enhanced-etale-category`
- `DiamondEtaleCohomology:C3/internal-hom`

### C0 request 9: `SchemeAndStackFoundations:SF.2`

The étale topos of a cofiltered limit of qcqs schemes with affine transition maps is the limit of the étale topoi, with étale cohomology the colimit (SGA 4 VII 5.7–5.8), and the proper base change theorem for torsion coefficients on which ClassicalAdicEtaleCohomology:H1:valuation-exports/proper-nearby-cycle-cohomology rests (also listed as UPSTREAM:ECD:SCH_BC in the stage's requires).

**Needed by:**

- `DiamondEtaleCohomology:C5/zariski-riemann-acyclicity`

### C8 request 1: `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-0-discrete-modules-and-continuous-sections`

Discrete continuous module dictionary, including invariants, morphisms and exactness, on the canonical TopRep carrier. The equivalence of diamond sheaves with this category is proved in C8.

**Needed by:**

- `DiamondEtaleCohomology:C8/point-sheaf-equivalence`

### C8 request 2: `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`

All-degree cohomology of discrete profinite modules on continuousCohomology, its comparison with the continuous Čech/cochain model, finite-quotient and coefficient filtered-colimits, coefficient naturality and dimension shifting.

**Needed by:**

- `DiamondEtaleCohomology:C8/point-cohomology`
- `DiamondEtaleCohomology:C8/closed-point-cohomology`
- `DiamondEtaleCohomology:C8/extension-cd-bound`
- `DiamondEtaleCohomology:C8/prime-to-p-wild-removal`
- `DiamondEtaleCohomology:C8/residue-cd-bound`

### C8 request 3: `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`

ENat-valued cd_ℓ on all discrete ℓ-primary torsion modules, its vanishing characterization, invariance under continuous group isomorphism, and monotonicity for closed subgroups.

**Needed by:**

- `DiamondEtaleCohomology:C8/point-cd`
- `DiamondEtaleCohomology:C8/closed-point-bound`
- `DiamondEtaleCohomology:C8/extension-cd-bound`
- `DiamondEtaleCohomology:C8/prime-to-p-wild-removal`
- `DiamondEtaleCohomology:C8/residue-cd-bound`
- `DiamondEtaleCohomology:C8/tame-cd-bound`

### C8 request 4: `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-2-profinite-sylow-theory`

Existence of pro-ℓ Sylow subgroups and their use inside a procyclic profinite group; retain the continuous subgroup topology.

**Needed by:**

- `DiamondEtaleCohomology:C8/wild-automorphism`

### C8 request 5: `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation`

The finite-quotient characterization of pro-p and its closed-subgroup/quotient stability; exclude continuous homomorphisms from a pro-ℓ group to discrete p-torsion groups for distinct primes.

**Needed by:**

- `DiamondEtaleCohomology:C8/wild-automorphism`
- `DiamondEtaleCohomology:C8/wild-kernel-pro-p`
- `DiamondEtaleCohomology:C8/prime-to-p-wild-removal`

### C8 request 6: `ArithmeticGaloisDuality:R02.1`

As assigned by accepted RS-05, supply the all-degree continuous Hochschild–Serre sequence for a closed normal profinite subgroup and discrete torsion coefficients, converging to the canonical upstream carrier, with edge maps.

**Needed by:**

- `DiamondEtaleCohomology:C8/extension-cd-bound`
- `DiamondEtaleCohomology:C8/prime-to-p-wild-removal`

### C8 request 7: `ArithmeticGaloisDuality:R02.2`

As assigned by accepted RS-05, supply the discrete/compact coefficient comparison and the convergence/edge-map compatibility needed when specializing Hochschild–Serre to discrete ℓ-primary torsion modules. No compact-coefficient limit interchange without its convergence hypotheses.

**Needed by:**

- `DiamondEtaleCohomology:C8/extension-cd-bound`

### C8 request 8: `tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf`

The actual adic carrier, local stalks, residue-field valuations and valuation-compatible maps. Completing and algebraically closing those fields, with compatible embeddings, remains a separate C8 proof obligation.

**Needed by:**

- `DiamondEtaleCohomology:C8/analytic-dim-trg`

### C8 request 9: `AdicEtaleGeometry:A2`

Comparison with the valuative partial-properness criterion of CS17 Remark4.2.20 and rank-one generalizations. CS17 allows general analytic partially proper adic spaces, beyond the supplier’s explicit noetherian scope; the extension of the geometric supplier is recorded in restructure and remains unresolved.

**Needed by:**

- `DiamondEtaleCohomology:C8/partially-proper-closure-dimension`
- `DiamondEtaleCohomology:C8/partially-proper-dimension`
- `DiamondEtaleCohomology:C8/partially-proper-fibre-dimension`

### C8 request 10: `DiamondsAndVStacks:D5`

Localization of a spatial diamond at a point, its chain of generalizations, and the quasi-pro-étale field-point presentation, with compatibility with the inverse system of quasicompact open neighbourhoods. C0/etale-cohomology-continuity supplies the cohomology-continuity statement once this geometric localization is supplied. Existing D5 presentation/permanence nodes do not supply the complete geometric localization contract.

**Needed by:**

- `DiamondEtaleCohomology:C8/local-stalk-bound`

### C8 request 11: `EnhancedDerivedSheaves:E2`

Object-wise Postnikov convergence under one finite bound on a covering basis is planned as E2/postnikov-finite-cohomological-dimension (site-level Stacks 0D6P) and the uniform truncation window as E2/postnikov-uniform-window; C9 cites both at node level. Still requested from the stage: category-level left completeness of D(Y_ét,Λ) under the same uniform bound (every compatible Postnikov tower is the tower of its derived limit), and generic cosimplicial section complexes, normalization and comparison with sheaf cohomology once C8 proves its quasi-augmented descent theorem. An ordinary Cartesian hypercover theorem does not establish that theorem.

**Needed by:**

- `DiamondEtaleCohomology:C9/left-completeness`
- `DiamondEtaleCohomology:C9/global-sections-coproducts`
- `DiamondEtaleCohomology:C9/etale-generators-detect-zero`
- `DiamondEtaleCohomology:C8/chain-cohomology-comparison`

### C8 request 12: `EnhancedDerivedSheaves:E3`

Identify preservation of coproducts by exact derived Hom with the enhanced compactness criterion (an exact functor between the relevant stable cocomplete categories that preserves coproducts preserves all small colimits), and supply the cutoff comparisons for the set of test objects when the cutoff is enlarged. The thick-closure description of compact objects is outside E3's stated scope and is imported from Tau Ceti DGAInfinity Layer 6.

**Needed by:**

- `DiamondEtaleCohomology:C9/etale-constant-compact`
- `DiamondEtaleCohomology:C9/compact-generators`

### C8 request 13: `DiamondsAndVStacks:D5`

Quasi-pro-étale algebraically closed field-point presentations through a given diamond point; localization and preservation of fibre specialization chains. Supply the field-point evaluation in Remark 21.8 and the one-point/local presentation used in 21.9/21.15. The general universally-open presentation node does not alone specify this exact contract.

**Needed by:**

- `DiamondEtaleCohomology:C8/diamond-dim-trg`
- `DiamondEtaleCohomology:C8/point-quotient`
- `DiamondEtaleCohomology:C8/specialization-stabilizers`
- `DiamondEtaleCohomology:C8/topological-dimension-field-tests`

### C8 request 14: `tauceti:TauCetiRoadmap/DGAInfinity#layer-6-quasi-equivalence-derived-morita-theory-and-compact-generators`

For a pretriangulated DG category whose derived category is generated, through vanishing of all shifted Homs, by a set S of compact objects, every compact object lies in the triangulated envelope of S (Mathlib ObjectProperty.triangEnvelope: shifts, finite sums, extensions, retracts), with Layer 5's identification of compact objects and the thick closure. Applied to the DG model of D(Y_ét,Λ) from EnhancedDerivedSheaves E1, with S the objects j!Λ. Triangulated form: Stacks 13.37.3–13.37.4.

**Needed by:**

- `DiamondEtaleCohomology:C9/compact-implies-perfect-constructible`

### C8 request 15: `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-6-cohomological-dimension-of-pro-p-groups`

cd_ℓ G = cd_ℓ G_ℓ for an ℓ-Sylow subgroup G_ℓ of a profinite group (cd_p_eq_of_isProPSylow), used to reduce the cohomological dimension of compact subgroups of (A_f^p)^r and of absolute Galois groups to their pro-ℓ Sylow subgroups.

**Needed by:**

- `DiamondEtaleCohomology:C8/tame-cd-bound`
- `DiamondEtaleCohomology:C8/residue-cd-bound`

### C8 request 16: `DiamondEtaleCohomology:C7`

Promote the already planned IsPerfectLocalSystem.dualizable API item of C7/perfect-local-system to a named prerequisite lemma, as PROTOCOL §4 requires: for a commutative coefficient ring Λ and a locally spatial diamond U, every étale locally constant complex L with perfect values is dualizable, with dual RHom_Λ(L,Λ_U), and RHom_Λ(L,A) ≃ L^∨ ⊗^L_Λ A naturally in A. The carrier and proof outline already appear in C7/perfect-local-system; this is an API-granularity task, not a new assertion or an unresolved mathematical theorem.

**Needed by:**

- `DiamondEtaleCohomology:C9/perfect-local-system-compact`

## Preserved gap inventory

### C0: Vanishing of R^iλ_Y∗λ_Y^∗F for i ≥ 2 (ECD Proposition 14.7, PAPER-SCHOLZE-17/E46)

**neededBy:** 

- `DiamondEtaleCohomology:C0/v-pullback-higher-vanishing`
- `DiamondEtaleCohomology:C0/bounded-below-comparison`
- `DiamondEtaleCohomology:C0/unbounded-comparison-std`
- `DiamondEtaleCohomology:C2/v-local-etaleness`
- `DiamondEtaleCohomology:C2/left-completion-comparison`
- `DiamondEtaleCohomology:C2/etale-coreflection-bounded-formula`

**detail:** ECD represents a minimal nonzero class α ∈ H^i(X_v, λ^∗F) by a Čech cocycle on fibre powers of an affinoid perfectoid v-cover X′ → X. For i ≥ 2 this needs the vanishing of the intermediate v-cohomology of the fibre powers of X′, which the source does not establish (minimality gives vanishing only on strictly totally disconnected spaces, and Proposition 14.8 only identifies those groups with étale cohomology). The case i = 1, hence the statement for sheaves of groups and the quasi-pro-étale comparison, is complete. Repair routes: (a) choose X′ so that the relevant étale groups of its fibre powers vanish; (b) a hypercover version of the approximation-and-splitting step, which needs an input not in ECD: compatibility of λ∘_X with the finite limits forming the matching objects of a strictly totally disconnected v-hypercover, or a hypercover for which λ∘_X(X_•) is a quasi-pro-étale hypercover of X. Lemma 14.5(ii) alone does not suffice, since (cosk_1 X_•)_2 is a limit over X_0 ×_X X_0, which is not strictly totally disconnected (over X = Spa(C, O_C), X_0 = Spa(C_0, O_{C_0}), λ∘(X_2) → (cosk_1 λ∘X_•)_2 can fail to be surjective). The v-part of the bounded-below comparison (14.10) in degrees ≥ 2 depends on this gap.

### C0: v-descent of perfect-constructibility for non-noetherian Λ (ECD Proposition 20.13, DiamondEtaleCohomology/E11)

**neededBy:** 

- `DiamondEtaleCohomology:C7/perfect-constructible-v-descent`
- `DiamondEtaleCohomology:C7/perfect-constructible-filtration`
- `DiamondEtaleCohomology:C7/perfect-constructible-limit-equivalence`
- `DiamondEtaleCohomology:C7/perfect-constructible-ring-colimit`

**detail:** ECD reduces 20.13 to an affinoid pro-étale cover by replacing Ỹ with Y ×_{|Y|} |Ỹ|, which is not affinoid pro-étale in general (Corollary 7.22 needs |Ỹ| → |Y| ×_{π0} π0 Ỹ to be an embedding; it fails for Y = Spa(C, O_C), Ỹ = Spa(C′, C′⁺) of rank 2), and the final 'is already an isomorphism there' needs the comparison cone to vanish on all of |Ỹ_j|. For noetherian Λ the packet proves 20.13 from 20.5 and 20.12. For general commutative Λ the missing input is descent of perfect-constructibility along X̃ → λ°_X(X̃) for strictly totally disconnected X̃ → X (a homeomorphism on π0, surjective and monotone on each component chain); after it ECD's argument applies to the affinoid pro-étale λ°_X(X̃). The E61 repair of 20.16 (i) ⇒ (ii) ends with this v-descent, so the general-Λ case of 20.15–20.16 depends on it.

### C8: Characteristic-independent completion argument

**detail:** Conrad's coefficient/root-approximation proof has been read and works in every characteristic for the closure of a dense algebraically closed subfield. The norm on the finite splitting extension is Mathlib's spectralNorm.normedField, restricting to the original norm by spectralNorm_extends (both read at the pinned commit), so no separate valued-extension construction is needed. What remains is the adapted root-approximation lemma itself. The pinned IsAlgClosed.of_denseRange requires CharZero and cannot be cited in characteristic p.

**neededBy:** 

- `DiamondEtaleCohomology:C8/finite-topological-generators`

### C8: Universe bounds, valued amalgamation and point choices

**detail:** Prove finite extension-witness size reduction using the read D0 completion-cardinality bound; construct compatible complete algebraically closed valued amalgams for the two modified21.3 inequalities; prove independence of completed residue-field closures and of quasi-pro-étale point representatives; prove cutoff independence for representable v-stack tests. Split these into individual lemmas before closure. No universal monotonicity answer to Question21.4 is assumed.

**neededBy:** 

- `DiamondEtaleCohomology:C8/modified-topological-trdeg`
- `DiamondEtaleCohomology:C8/modified-trdeg-tower`
- `DiamondEtaleCohomology:C8/modified-trdeg-base-change`
- `DiamondEtaleCohomology:C8/analytic-dim-trg`
- `DiamondEtaleCohomology:C8/diamond-dim-trg`

### C8: Huber valuative dimension and completion lemmas

**detail:** Read Huber1.8.5(i), prove the chain/rational-value-group estimate, and separately prove the completion/algebraic-closure comparisons and their compatibility with maps on the existing adic carrier. General analytic completed residue fields must be constructed from the upstream stalkwise fields; A0 tensor products do not supply them.

**neededBy:** 

- `DiamondEtaleCohomology:C8/analytic-dimension-bound`
- `DiamondEtaleCohomology:C8/analytic-dim-trg`

### C8: Temkin primitive perturbation source boundary

**detail:** Temkin §§2–3 and ECD's finite-degree paragraph were read. Temkin's independent degree and his comparison theorem are explicit nodes (topological-independence-degree, independent-le-generating-degree), through which finite intermediate-degree monotonicity and finite modified/original equality are proved. Temkin Theorem 3.1.9 uses Lemma 3.1.6, imported from Temkin 2010 Lemma 6.3.2, whose primitive-field perturbation proof has not been read. Refine that input before claiming source closure; retain the distinction between independent and generating degree for infinite extensions.

**neededBy:** 

- `DiamondEtaleCohomology:C8/independent-le-generating-degree`
- `DiamondEtaleCohomology:C8/topological-trdeg-finite-monotonicity`
- `DiamondEtaleCohomology:C8/modified-trdeg-finite-equality`

### C8: Wild, residue and tame proof interiors

**detail:** In 21.17 justify the topology and compactness of the procyclic closure and split the leading-term residue homomorphism computation. For 21.16 prove the infinite-Galois identification; for the residue bound, the criterion that Brauer vanishing for all finite separable extensions gives cd_ℓ≤1 (Serre, Galois Cohomology, II.3.1), which has not been read, while Tsen's theorem is read in Stacks 03RD/03RF; the tame character topology and finite-adele identification; and the cohomological bound on its compact lattices. These are owned field/Kummer arguments, not supplied by a bare five-term sequence or discrete local-field inertia.

**neededBy:** 

- `DiamondEtaleCohomology:C8/wild-automorphism`
- `DiamondEtaleCohomology:C8/residue-galois-identification`
- `DiamondEtaleCohomology:C8/residue-cd-bound`
- `DiamondEtaleCohomology:C8/tame-character-embedding`
- `DiamondEtaleCohomology:C8/tame-cd-bound`

### C8: Valuation rank and completion comparisons

**detail:** The polynomial leading-term proof is now explicit in valuation-transcendence-bound. Refine residue independence, rational value-group independence, cardinal-to-ENat conversion, algebraic-extension torsion and completion immediacy. Bourbaki VI.10.3 Corollary 1 has not been read; no claim of an independently closed library proof is made.

**neededBy:** 

- `DiamondEtaleCohomology:C8/valuation-transcendence-bound`

### C8: Scheiderer quasi-augmented descent proof

**detail:** The1992 article, DOI10.1016/0022-4049(92)90062-K, was located on its open-archive publisher page, but the PDF endpoint returned403. The author bibliography has no PDF link. Read §§2–4, especially Remark2.5, Theorem4.1 and Corollary4.6. Construct the quasi-augmentation adjunction and prove descent with the precise hypotheses; then separate normalization into a named lemma. KST Lemma6.6 supplies the specialization-chain and normalized-support argument only. Stacks0A3G proves the desired bound by another method and does not close this required source route.

**neededBy:** 

- `DiamondEtaleCohomology:C8/specialization-chain-space`
- `DiamondEtaleCohomology:C8/chain-cohomology-comparison`
- `DiamondEtaleCohomology:C8/spectral-cohomological-bound`

### C8: CS17 valuation-space comparison in general analytic scope

**detail:** Read and prove the Zariski–Riemann description of a rank-one closure and its transcendence-degree dimension formula, and establish the supplier’s partial-properness criterion beyond noetherian analytic spaces. The generic algebraic tower equality is already in the pinned library; only its ENat/infinite-rank conversion and geometric application are new.

**neededBy:** 

- `DiamondEtaleCohomology:C8/partially-proper-closure-dimension`
- `DiamondEtaleCohomology:C8/partially-proper-dimension`
- `DiamondEtaleCohomology:C8/partially-proper-fibre-dimension`

### C8: Finite-window and generation interfaces

**detail:** Object-wise Postnikov convergence and the uniform window are cited from the E2 nodes; the category-level left completion and the coproduct argument remain open requests to E2, the cutoff comparison to E3, and the thick-closure description of compact objects to Tau Ceti DGAInfinity Layer 6. For detect-zero spell out the stalk/derived-section argument using the uniform bound; do not use a cohomology presheaf as though it were already a sheaf. The C7 perfect-local-system carrier and its dualizability API are available, but the API item must be promoted to a named prerequisite lemma before C9/perfect-local-system-compact can cite it; the residual C7 request records this exact granularity obligation.

**neededBy:** 

- `DiamondEtaleCohomology:C9/left-completeness`
- `DiamondEtaleCohomology:C9/global-sections-coproducts`
- `DiamondEtaleCohomology:C9/etale-generators-detect-zero`
- `DiamondEtaleCohomology:C9/compact-generators`
- `DiamondEtaleCohomology:C9/compact-implies-perfect-constructible`
- `DiamondEtaleCohomology:C9/perfect-local-system-compact`

### C8: Suggested signatures remain incomplete

**detail:** The suggested file states all signatures/API/tests representable with the pinned topology and normed-field carriers, including the modified invariant with genuine extension data. Analytic, diamond, site and enhanced-category declarations need the absent owning supplier types; these conditions are omitted under PROTOCOL §13, with a per-node inventory. Group cohomological dimension and the tame character/value-group topology likewise need their imported interfaces. No arbitrary proposition field or assumed theorem package fills these omissions.

**neededBy:** 

- `DiamondEtaleCohomology:C8/analytic-dim-trg`
- `DiamondEtaleCohomology:C8/analytic-dimension-bound`
- `DiamondEtaleCohomology:C8/diamond-dim-trg`
- `DiamondEtaleCohomology:C8/diamond-dim-base-change`
- `DiamondEtaleCohomology:C8/diamond-dim-composition`
- `DiamondEtaleCohomology:C8/locally-finite-dim-trg`
- `DiamondEtaleCohomology:C8/strictly-disconnected-acyclic`
- `DiamondEtaleCohomology:C8/qpetale-direct-image`
- `DiamondEtaleCohomology:C8/injection-direct-image`
- `DiamondEtaleCohomology:C8/point-quotient`
- `DiamondEtaleCohomology:C8/point-quotient-unique`
- `DiamondEtaleCohomology:C8/point-sheaf-equivalence`
- `DiamondEtaleCohomology:C8/point-cohomology`
- `DiamondEtaleCohomology:C8/point-cd`
- `DiamondEtaleCohomology:C8/specialization-stabilizers`
- `DiamondEtaleCohomology:C8/closed-point-cohomology`
- `DiamondEtaleCohomology:C8/closed-point-bound`
- `DiamondEtaleCohomology:C8/extension-cd-bound`
- `DiamondEtaleCohomology:C8/prime-to-p-wild-removal`
- `DiamondEtaleCohomology:C8/residue-galois-identification`
- `DiamondEtaleCohomology:C8/residue-cd-bound`
- `DiamondEtaleCohomology:C8/tame-character-embedding`
- `DiamondEtaleCohomology:C8/tame-cd-bound`
- `DiamondEtaleCohomology:C8/valuation-transcendence-bound`
- `DiamondEtaleCohomology:C8/point-cd-geometric-bound`
- `DiamondEtaleCohomology:C8/chain-cohomology-comparison`
- `DiamondEtaleCohomology:C8/spectral-cohomological-bound`
- `DiamondEtaleCohomology:C8/boundary-dimension-drop`
- `DiamondEtaleCohomology:C8/constructible-support-reduction`
- `DiamondEtaleCohomology:C8/local-stalk-bound`
- `DiamondEtaleCohomology:C8/spatial-cohomological-bound`
- `DiamondEtaleCohomology:C8/partially-proper-closure-dimension`
- `DiamondEtaleCohomology:C8/partially-proper-dimension`
- `DiamondEtaleCohomology:C8/partially-proper-fibre-dimension`
- `DiamondEtaleCohomology:C9/bounded-filtered-compactness`
- `DiamondEtaleCohomology:C9/uniform-test-bound`
- `DiamondEtaleCohomology:C9/left-completeness`
- `DiamondEtaleCohomology:C9/ordinary-derived-comparison`
- `DiamondEtaleCohomology:C9/global-sections-coproducts`
- `DiamondEtaleCohomology:C9/etale-constant-compact`
- `DiamondEtaleCohomology:C9/etale-generators-detect-zero`
- `DiamondEtaleCohomology:C9/compact-generators`
- `DiamondEtaleCohomology:C9/compact-implies-perfect-constructible`
- `DiamondEtaleCohomology:C9/perfect-local-system-compact`
- `DiamondEtaleCohomology:C9/perfect-constructible-implies-compact`
- `DiamondEtaleCohomology:C9/compact-iff-perfect-constructible`
- `DiamondEtaleCohomology:C9/finite-field-compact-objects`
- `DiamondEtaleCohomology:C8/topological-dimension-field-tests`
- `DiamondEtaleCohomology:C9/compact-generation-from-dimension-bounds`
