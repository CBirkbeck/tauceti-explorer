# BP-ClassicalAdicEtaleCohomology--H3 handoff

Issue #6948; agent Codex; session codex-Kea314. This is a complete target-level planning pass for H3, building on the accepted H0 packet. It is ready for independent review. The mathematical stage is planned and not closed. No second job was claimed.

## Deliverables and counts

- [Packet](../packets/ClassicalAdicEtaleCohomology--H3.json): status complete; exact scope ClassicalAdicEtaleCohomology:H3; part H3.
- [Reader](../readmes/ClassicalAdicEtaleCohomology--H3.md): conventions, target architecture, every new declaration, API, test, supplier request and gap.
- [Suggested Lean](../suggested/ClassicalAdicEtaleCohomology--H3.lean): actual Mathlib finite assembly and quotient-descent forms, plus the complete analytic declaration inventory.
- 24 new nodes: 14 theorems, 3 comparisons, 5 constructions and 2 applications.
- 26 API items, 20 unit tests, 6 cited baseline declarations.
- Zero new planets; all six accepted H3 planets retained. The combined stage has six planets.
- 12 gaps, 13 requests and 7 source correction candidates.
- All 67 inherited H3 IDs are cited in the coverage register. No old node ID is redefined or old deliverable edited. Every implementation status remains unchecked.

The packet stops below the node budget because every stage target is planned. Explicit gaps do not mean the pass is a checkpoint; they are the proof obligations and supplier extensions that prevent the stage from being closed.

## What this pass supplies

The additions separate proper–étale exchange from arbitrary proper base change, state all-positive-n proper exchange and projection formula, isolate non-algebraizable closed pseudo-fibre vanishing and the non-locally-finite-type compactification dimension input, and give the public unbounded-support comparison in its prime-to-residue range.

The public affinoid curve route passes through the henselian rank-two boundary, the complete localization sequence, secondary degrees, reciprocity and quotient descent. It constructs a surjective residue trace when n is invertible in C. Its comparison with the algebraic trace is recorded with the unread intermediate proof inputs. The actual secondary degree has the sign giving degree −1 to the disc parameter.

The full arbitrary-plus-ring curve target is kept separate. New contracts expose top trace constancy and the required higher-rank effacement, with a gap for source scope and proof. The all-G open-coefficient application covers the input to ECD Proposition 23.10(iii), extending bounded-above duality through homotopy colimits and derived mapping complexes. A finite-field local-system application states the finite perfect pairing on quasi-compact curves.

The public general-analytic trace route uses the analytic Kummer first Chern class, projective-line normalization, iterated affine-space traces, coordinate independence and top support Čech descent. It works with n invertible in O and arbitrary analytic bases; it does not prove nonproper residue-p duality or invertibility of arbitrary residue-p base change. No analytic lci cycle-class, blow-up or diamond six-operations theory is invented as an input.

Continuation records distinguish alternative proof routes from new prerequisites of unchanged imported declarations. In particular, the new trace comparison cannot become a prerequisite of the old trace while simultaneously importing its normalization. The accepted conditional trace-isomorphism input also retains its original dependency graph. The full connected rank-one trace-isomorphism proof beyond the verified special cases is included in the trace gap before any higher-rank transport is claimed.

## Exact completion work

1. **Global universal-compactification proof.** Huber 5.1.5–5.1.6 and 5.1.14 are not available in a cleared source. LRZ A.0.3 supplies the affinoid maximal-plus-ring case, and Zavyalov 9.1 states the global application. Prove gluing over compactified intersections using separatedness and tautness, quasi-compact properness, and transcendence-dimension preservation; a diamond compactification theorem cannot close the classical proof.

2. **Non-algebraizable proper closed-fibre vanishing.** The all-torsion vanishing in Huber 4.4.3 is used with the same mathematical content by the public proof of Zavyalov 9.3, but that proof is not reproduced. H1 transfer covers algebraizable formal models and does not establish the theorem for arbitrary proper analytic adic spaces. Verify/prove it without importing diamond proper base change.

3. **Higher-rank and compactification cohomological dimension.** Huber 5.3.11 and 5.5.8 remain proof obligations, including the non-locally-finite-type compactification and pseudo-adic boundary. An absolute bound on a rank-one finite-type affinoid is insufficient even for the inherited general rank-one support proof. LRZ 6.1.2 verifies the constant smooth output; Zavyalov 9.1 verifies the proper-amplitude use, but neither re-proves the bound.

4. **Boundary geometry and closed-point topos proofs.** LRZ 4.2.4–4.2.5 refer to Huber’s 2001 curve paper for boundary rank/curve-like field facts, and B.2.1 refers to Huber 2.3.10 for the full topos equivalence. Their statements were read in the public paper, but the cited proofs were not read. Obtain a permitted proof source and close the R0/H1 requests; do not substitute an unhenseled residue field.

5. **Algebraic normalization of the boundary trace.** Theorem 5.4.2 and the final reduction via 5.6.13 were read, but the intermediate disc and pointed-semistable calculations in LRZ §§5.5–5.6 have not all been inspected. Read and verify Theorem 5.5.19, the relevant line-bundle calculations, and Lemmas 5.6.8–5.6.12; match the H1/R2 transfer and finite-flat comparison hypotheses. This is a proof-verification gap, not an asserted flaw in the paper.

6. **Arbitrary-plus-ring top curve trace constancy.** The required contract in plus-ring-top-trace-constancy is not proved by the public sources read. ECD 24.1 confirms the ball input and cites Huber 7.2.2; the general curve scope and proof must be checked. The inherited smooth-model transfer proves balls, unit circles and P¹, with open discs by exhaustion, and does not cover positive-width annuli. This includes proof of the general connected rank-one trace isomorphism before transporting it across higher-rank specializations; it is not already supplied for every curve by the smooth-model cases.

7. **Higher-rank effacement and full curve duality.** Verify the exact intermediate neighborhood hypotheses in Huber’s proof of 7.5.3 and establish the sufficient effacement contract written here. Then extend the inherited injective-resolution/generator proof to arbitrary C⁺, arbitrary G∈D⁻ and F∈D⁺, with naturality of the actual trace-induced transformation. Duality is unproved even for the relative ball at C⁺≠O_C. ECD’s diamond conclusion and a previously assumed exceptional right adjoint are inadmissible proofs.

8. **Arbitrary-sheaf field-pair invariance.** H2’s j!M affinoid invariance and Čech extension do not establish Huber 4.3.2 for arbitrary sheaves needed by proper base change. Close the H2 request with a valid dévissage and comparison-map identification. Keep n invertible in C⁺; LRZ 6.3.3 prevents the residue-p arbitrary-sheaf strengthening.

9. **Non-quasi-compact support with general coefficients.** Zavyalov 9.4 gives the public unbounded comparison and exhaustion route for Z/n with n invertible in O⁺. Huber §§5.3–5.4 are still needed to prove filtered-colimit and composition assertions for arbitrary coefficient rings Λ and non-quasi-compact partially proper sources. The new comparison does not erase that inherited gap.

10. **Berkovich étale supplier and comparison proofs.** Retain the inherited need for Huber 8.3.1, 8.3.5–8.3.6 and preservation of overconvergence in 8.2.3–8.2.4. Public restatements do not contain those proofs. TropicalAndBerkovichArithmetic:TB.0 owns geometric spaces but does not plan the Berkovich étale support, trace and duality theory used by the inherited interfaces; the Part II ownership proposal must be resolved. The new analytic trace supplies an alternative construction, not the inherited Berkovich comparison or its coherences.

11. **Relative integral trace comparison and surjectivity.** The integral map is already constructed in the accepted packet. The relative inverse-limit identification and preservation of surjectivity need the exact E2 inputs and pro-étale repleteness. The absolute rigid result does not by itself prove relative base-change naturality or the Guo–Reinecke normalization export.

12. **Coherent support transport and unbounded gluing.** The E1 generic proper/étale gluing fragment and tensor/internal-Hom transfer remain supplier proof tasks. H3 must prove base-change coherence of its Berkovich support comparison α_f itself; only the generic derived coherence belongs to E1. Check the all-G open-coefficient equivalence on mapping complexes before using any downstream Yoneda mate identification.

Resolve these at target-level granularity. For an unread theorem, first obtain a source permitted by the library index, verify its full hypotheses and proof, and only then replace the gap with its actual chain. The sufficient effacement node is not a quotation of a verified book lemma. Do not narrow duality to the ball, to C⁺ = O_C, to locally constant coefficients, or to G supported on the open; those restrictions miss the issue's consumer.

## Requested supplier extensions

1. **AdicEtaleGeometry:A2.** Extend the relative transcendence-dimension API from locally finite type to +weakly finite type maps and proper universal compactifications; give dim.tr fᶜ=dim.tr f as the H3 application of geometry, dim.tr f=d for smooth equidimensional f, and the zero dimension of canonical completed algebraic-closure field-pair stalk maps. Topological rank-one fibre dimension alone does not cover a non-locally-finite-type compactification.

2. **AdicSpacesPartII:R0.** Build on R0/affinoid-noether-normalisation: for smooth affinoid C-curves its finite map to D¹ is flat. Supply boundary geometry in LRZ 4.2.1–4.2.5: finite discrete rank-two boundary meeting every component, exact inverse-image boundary and finite compactified map, curve-like henselized boundary fields, their defectlessness and secondary residue field, the greatest value γ₀<1 and #v(T)=−1 for the disc, and #v_K(N_L/K u)=#v_L(u). These geometric/valuation extensions belong to AdicSpaces, Part II, not a duplicate valuation theory in H3.

3. **AdicSpacesPartII:R0.** Supply étale coordinate neighborhoods for smooth maps over arbitrary locally noetherian analytic bases, including higher-rank field pairs, with the differential criterion used for mixed coordinate systems in LRZ 6.1.10. The existing smooth-toric-chart has a rigid rank-one base and does not supply this scope. Also supply projective-line geometry over these bases and its O(1), compatible with relative analytification.

4. **AdicSpacesPartII:R2.** For a smooth affinoid C-curve, supply embedding into a smooth proper algebraizable C-curve and the semistable formal O_C-models and pointed reductions used in LRZ 4.1.6, 5.5–5.6. The existing formal/rigid properness comparison is retained; semistable curve models over nondiscrete O_C are an extension, not the discrete-dagger F1 theorem.

5. **AdicSpacesPartII:R3.** Use R3/locally-free-sheaf and its coherent tensor/pullback API for line bundles and O(1). Supply the line-bundle/G_m-torsor equivalence, compatible with the analytic étale site. This request concerns the carrier and torsor comparison; H3 owns the Kummer first Chern class and trace normalization, and R3’s finite algebra trace is not a cohomological curve trace.

6. **ClassicalAdicEtaleCohomology:H0.** Supply the additional analytic sheaf lemmas: (a) equality of maps F→G is detected on rank-one stalks if the codomain G alone is overconvergent (LRZ 6.1.5); the existing maximal-stalk node requires both sheaves overconvergent; (b) for a dense quasi-compact pro-open j and overconvergent complex F, F→Rj*j*F is an equivalence (Zavyalov 10.3), with the corrected plus-ring inclusion; (c) Rᑫp_*Λ is overconvergent for the proper projective-line morphism over arbitrary analytic bases, as used in LRZ 3.2.2; (d) exact étale slice base change and the resolution of module sheaves by colimits of j!Λ generators for arbitrary n; (e) the support Čech spectral sequence used in LRZ 6.1.3, compatible with infinite-cover exhaustion. Existing H0/cech-to-derived-comparison is ordinary cohomology, so (e) requires its support extension.

7. **ClassicalAdicEtaleCohomology:H1:henselian.** Extend the pro-special constant-cohomology comparison to the closed-point étale-topos equivalence (X,{x})_ét≃(Spec k(x)ʰ)_ét≃(Spec completed k(x)ʰ)_ét used in LRZ B.2.1. Prove functoriality for finite boundary maps, norm comparison on Kummer cohomology, and the affinoid-curve comparison with the algebraized finite-type C-curve needed for vanishing above degree one. Henselization is required before completion.

8. **ClassicalAdicEtaleCohomology:H1.** Supply algebraic–analytic cohomology comparison for P¹_C and compact-support comparison for A²_C with n invertible in C, including residue-p n in mixed characteristic and compatibility with Chern classes and the GL₂(C) action. The inherited H3 algebraic-curve comparison covers curves; the A² comparison used in LRZ 6.1.6 needs the higher-dimensional henselian/proper comparison plus H3 support localization.

9. **ClassicalAdicEtaleCohomology:H2.** For a surjective extension Spa(C′,C′⁺)→Spa(C,C⁺), prove cohomological invariance for arbitrary étale Z/n-module sheaves on proper spaces and their pseudo-adic fibres, n invertible in C⁺. Existing H2/invariance-for-affinoids-of-finite-type supplies j!M on finite-type affinoids; provide the sheaf dévissage and the exact base-change-map identification, as required by Huber 4.3.2 and Zavyalov Lemma 9.1(3).

10. **SchemeAndStackFoundations:SF.2.** Supply Hilbert 90/Kummer over the henselized boundary fields, with cohomological dimension ≤1 for the curve-like fields in LRZ Lemma 5.1.4; give the hypotheses and valuation input rather than applying a bound for an arbitrary field. Also supply Artin vanishing above degree one for torsion étale cohomology on smooth affine curves over algebraically closed C with torsion order invertible in C. The analytic-to-algebraic comparison belongs to H1, and affinoid Noether normalization to R0.

11. **EtaleDualityAndPerverseSheaves:EDC.2.** Supply the scheme P¹ cohomology decomposition with its c₁(O(1)) generator and Tate convention, and compatibility of the scheme first Chern class and curve trace with analytification through the supplied site comparison. Existing EDC.2 curve/affine trace and effacement nodes are imported directly, not reconstructed.

12. **EnhancedDerivedSheaves:E1.** Supply the coherent proper/étale gluing fragment used in Zavyalov Theorem 9.4: from proper pushforwards and exact étale ! with exchange, base change, projection formula and descent, construct the corresponding support functors on locally +weakly finite type maps with composition and agreement on D⁺. Do not assume exceptional right adjoints, diamond duality, or the result of the H3 instance. Also give support-mate pasting, tensor/internal-Hom coherence, and mapping-complex conversion of first-argument homotopy colimits to homotopy limits, with the ordinary/enhanced comparison.

13. **EnhancedDerivedSheaves:E2.** Retain the accepted integral request: for smooth proper rigid f and the epimorphic top finite-level systems, identify R²ᵈf_proét,*Ẑ_p(d) with lim_r ν*R²ᵈf_*Z/pʳ(d), give the next-degree vanishing and inverse-limit lifting that proves integral trace surjectivity. This is not needed for the finite-coefficient curve input to ECD 24.1.

These are packet requests, not external messages or newly opened issues. No supplier packet was edited. R0/R2/R3 additions belong to AdicSpaces, Part II. The Berkovich cohomological owner is a Part II proposal because TB.0 supplies geometry alone. Generic enhanced gluing and coherence belong to E1; the analytic support instance and coherence of its actual comparison belong to H3. The requested H2→H3 dependency is only for arbitrary-sheaf prime-to-residue proper base change.

## Sources and read boundary

All recorded mathematics is paraphrased, with theorem, section and page locators. No source passages, private files, PDF or source-text extraction are in the deliverables. The allowed-reference index was read. Huber 1996 and Faltings–Chai are not cleared there; no copy of either was used. Huber theorem numbers in the packet are indirect locators from the public sources.

- **Bogdan Zavyalov: Some foundational results in adic geometry.** [arXiv:2409.15516v2, 17 July 2025](https://arxiv.org/pdf/2409.15516v2). Access date 2026-10-09; SHA-256 `ace033dcedc5b0d494e9194bbc1d7c8577fd621180f45692630a6f03e567502d`. Read: §9, pp. 22–30, including all proofs; §10, Lemma 10.3 and proof, pp. 31–32.

- **Shizhang Li, Emanuel Reinecke and Bogdan Zavyalov: Relative Poincaré duality in nonarchimedean geometry.** [arXiv:2410.08200v1, 10 October 2024](https://arxiv.org/pdf/2410.08200v1). Access date 2026-10-09; SHA-256 `dd6ff5ffd9bdc522e4d719ae4d248097e4916642b8ed8b8c905ac300bc391767`. Read: Theorem 1.2.1, pp. 3–4; §2.2, Definition 2.2.8, Warning 2.2.9 and Lemma 2.2.10, pp. 11–12; §§4.1–4.2, pp. 29–33; §§5.1–5.2, pp. 42–48, first reciprocity proof; §5.4, Theorem 5.4.2 and Corollary 5.4.3, p. 53; final reduction in §5.6, p. 66; intermediate §§5.5–5.6 proofs not fully inspected; §6.1, pp. 66–74, complete construction proof; §6.2, Lemmas 6.2.1–6.2.3 and proofs, pp. 74–76; §6.3, Example 6.3.3, pp. 79–80; Appendix A, pp. 122–123; Appendix B.1–B.2, pp. 123–124; Variant 3.1.8 through Proposition 3.2.2 and its proof, pp. 22–23; adjacent displayed definitions read for type checking; Remark 5.1.14 and the statement of Lemma 5.5.21, pp. 45, 60–61; counterexamples only, full §5.5 proof not claimed read.

- **Peter Scholze: Étale cohomology of diamonds.** [arXiv:1709.07343v4, 14 April 2026](https://arxiv.org/pdf/1709.07343v4). Access date 2026-10-09; SHA-256 `78ca42bba46f1d43c894b0dbfdfb41105efab4959ba5ba6e32e1e5cf7ef33efc`. Read: Lemma 9.5 and proof, pp. 46–47; Proposition 23.10 and proof, pp. 145–146; Theorem 24.1 and proof, pp. 152–153.

For LRZ Theorem 5.4.2, the theorem, étale corollary and final proof via Theorem 5.6.13 were read, but all intermediate arguments in §§5.5–5.6 were not inspected. This exact boundary is retained as a verification gap. Statements of the residue-p examples were read without claiming their full technical proofs. The book arguments behind higher-rank cohomological dimension, full compactification, closed-fibre vanishing, trace constancy and duality remain unverified. The inherited Berkovich and relative integral proofs retain the accepted gaps.

The author versions checked for correction candidates are:

- [Zavyalov-Foundations-v2 author PDF](https://bogdanzavyalov.com/refs/papers/foundations.pdf), read 2026-10-09, SHA-256 `8d1cc309613e67f7f0f031dcf5f844b5129cca93a00471517b8e1bd693a75aa3`. Check current author version for the two local proof slips; main node locators use arXiv v2.
- [Li-Reinecke-Zavyalov-v1 author PDF](https://bogdanzavyalov.com/refs/papers/relativeduality.pdf), read 2026-10-09, SHA-256 `8bde2e7d8e26eb1da9adcdf85671b3d1eb65d3410f42d12484ca905255343c04`. Check current author version for the five local type/label slips; main node locators use arXiv v1.

No public correction was located for the seven local candidates. The packet gives the printed issue in paraphrase, the proposed correction and its type or hypothesis check. The reader repeats those checks. Independent verification is required before treating them as established errata. The corrections concern the plus-ring containment direction, bounded-below truncation wording, the closed-point topos target, a coordinate-counit label, the degree of the line-bundle class, the pre-adjunction Chern-class target and the coefficient of the support Čech abutment.

## Baseline and Lean status

Required pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

The reviewed H3 library audit was read before planning. All six cited Mathlib statements were read at the exact pin: LinearMap.lsum and lsum_piSingle in LinearAlgebra/Pi, Submodule.liftQ and liftQ_mkQ in LinearAlgebra/Quotient/Basic, and Submodule.mkQ and mkQ_surjective in LinearAlgebra/Quotient/Defs. Their scope is finite linear assembly and quotient descent. The pinned Tau Ceti source tree was searched broadly for analytic étale cohomology, proper support, universal compactification, traces and Poincaré duality; the existing Spa and valuation foundations do not provide those functors. The individual Spa.HuberPair import was checked at the Tau Ceti pin.

**The suggested file was not compiled.** Existing shared builds were inspected; none was found at both pins. The available shared source has the exact Mathlib commit but Tau Ceti `cf386627e9176a3827c1a5fe804989fd94a4d216`. A matching Mathlib alone does not authorize compiling against a different Tau Ceti build. No Lake project was created, no build or library download was run, and no Lean language server was started. When an existing build at both pins is available, use lean-check for the file, subject to the shared memory limit.

The executable linear prototypes are in a distinct LinearBoundaryPrototype namespace. Their modules are actual Mathlib types, not fake cohomology objects. Every unavailable analytic constructor, theorem, API item and unit test is named in the following inventory with its mathematical statement and supplier prerequisites. No missing hypothesis is represented by an arbitrary proposition-valued field. The inventory is not an elaboration claim.

## Validation and review focus

- Blueprint checker: zero errors and zero warnings; complete packet, one planned stage and no closed stage.
- Submission path, JSON and private-path checks: zero problems across the four deliverables.
- Declaration inventory: every new packet name, API name and test name appears in both reader and suggested file.
- Coverage register: all 67 inherited H3 IDs and 24 new IDs included; IDs do not collide with the accepted packet.
- Dependency graph: no cycle through a new declaration, including imported packet nodes. Alternative proof routes are not added as dependency edges. Review the explicit H2 stage request before integrating it.
- Git whitespace check passed; only the issue's four permitted paths changed.

The independent reviewer should inspect the full arbitrary-C⁺ trace and effacement scope, distinguish a trace theorem from full duality, check derived-limit handling in the all-G application, confirm proper–étale exchange uses all-positive-n closed-fibre vanishing rather than arbitrary residue-p base change, and check source correction candidates against the pinned PDFs. The proof-verification gaps are explicit mathematical work, not claims of flaws in the sources.

Scratch notes and downloaded public texts are disposable. Everything needed to resume is in the packet, this note, the reader and the source URLs/hashes above. No work depends on a scratch filename. Do not claim another job for this session.
