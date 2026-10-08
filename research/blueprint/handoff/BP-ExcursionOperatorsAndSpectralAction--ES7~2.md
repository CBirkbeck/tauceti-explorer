# Handoff: BP-ExcursionOperatorsAndSpectralAction--ES7~2

Issue: [#6962](https://github.com/CBirkbeck/tauceti-explorer/issues/6962). Worker: Codex, session `codex-qMmOMN`, 2026-10-08. Branch: `codex-qMmOMN-es7-revision`. The bot confirmed the claim at [this comment](https://github.com/CBirkbeck/tauceti-explorer/issues/6962#issuecomment-6060292547).

## Completed revision

This is a complete revision pass, not a checkpoint. All 50 nodes from the preceding independent review are retained with their reviewed ids and parent stages. The historical packet-level `review` object is unchanged; its needs_changes verdict belongs to the previous round. The revision must receive an independent review before promotion. Nothing is claimed implemented.

The reader has been rebuilt from the corrected packet, with authored introductions, pinned notation and the whole declaration inventory: exact statements, node-specific hypotheses, proof routes, direct prerequisites, uses, APIs, tests, source locators, acceptance conditions, supplier requests, gaps and source issues. It contains no Lean code or source excerpts. The source passages formerly included in the packet have been removed or paraphrased, including the quoted explanation inside E1’s historical source-issue verification; its verdict and reviewer attribution remain intact. Source-version identities and earlier reading provenance are preserved.

Counts: 50 nodes (5 definitions, 6 constructions, 30 theorems, 6 lemmas, 3 comparisons), 53 API items, 34 unit tests, 21 planets, 30 baseline declarations, 33 requests, 15 gaps and 11 source issues. Every node retains unchecked implementation status. No stage is closed.

## Response to the preceding review

- The seven D-elliptic cohomology nodes remain in ES7:equal-characteristic, and local-character-identity remains in ES7:function-field-automorphic. The reader uses these corrected ids and ownership. Classical-centre-agreement remains in the concluding ES7 layer.
- GLn-comparison is explicitly characteristic zero, except that its abstract two-leg trace calculation is shared by realizations in both characteristics. The added equal-characteristic-agreement node is included. The final all-field target combines the two halves.
- The SW20 citation is Theorem 24.2.5, pp. 227–228, only for E=ℚ_p. General finite E/ℚ_p uses Corollary 24.3.5, p. 231, for the EL data of the restriction-of-scalars group and D, together with the required comparison to GL_n/E shtukas and all actions. There is no asserted O_E form of 24.2.5.
- Kaletha’s z-embedding supplier is p-adic. The equal-characteristic obstruction is stated precisely for SL_p: a torus-centre embedding with torus quotient cannot have the central-point surjectivity used in the reduction. The cokernel is isomorphic to the indicated fppf cohomology kernel. Connectedness alone is insufficient for the next basic-inner-class step. No claim that every embedding is impossible is made, and the theorem itself is not declared false. GL_n does not require this reduction.
- The reader incorporates the corrected special-module action (units trivial on the base, nontrivial on covers), fixed-global-setup independence, matrix-coefficient selector, Kaiser relation and dual factor, nonempty-level moduli statement, ramified special extension, Res′ coproduct, and transfer with an auxiliary supercuspidal place outside the specified finite S.
- Exact supplier nodes are retained for dual-Levi/Satake, framed fibres, creation/annihilation, correspondence calculus, rigid duality, curve recognition, Brauer–Nesbitt for arbitrary groups, stratum embedding independence and character twisting. The added supplier checks explicitly distinguish stated interfaces from their missing extensions.
- The suggested file preserves the rewritten native signatures and useful elementary algebraic proofs. All 50 node signatures are represented; the definition/construction APIs and named tests are present. DEllipticSheaf.zero and DEllipticSheaf.period are generated structure projections. The obsolete gap title claiming missing signatures has been replaced by the actual obligation to materialize supplier carriers and omitted geometric conditions.

## Additional corrections established in this revision

The coefficient condition is on π₀Z(G), equivalently the torsion in π₁(Ĝ), as in FS IX.5.2, p. 329, and VIII.3.6, p. 288. Misplaced hats in hypotheses were corrected; the original-centre convention of the Lean file and its SL_ℓ coefficient test were retained.

The arbitrary-coefficient reduction needs universal excursion-action base change, including nonflat coefficient maps preserving the square root. The existing ES1 node establishes existence of the action, not this comparison. A precise ES1:spectral-center request and gap/coefficient-base-change now record it. The coefficientReduction signature still states only the separatedness part; its docstring explicitly names the missing base-change theorem.

HS4/levi-compatibility uses the switched Hecke kernel with an opposite-parabolic twist and a compact-support character Rπ_!Λ in B_N. The constant-term proof route now requires comparison of that combined action with FS’s positive twist. Cancelling a degree-zero shift alone does not establish the factorization. This is recorded in gap/HN and in the corresponding suggested theorem’s docstring.

The level action precomposes a right-module trivialization with left multiplication. Its finite group is the τ-fixed group 𝒟_I^×. The additional matrix test uses g=diag(1,2) and x=E₁₂ over 𝔽₃: g is a unit, but xg≠gx, ruling out right multiplication as a right-module map.

E10 and E11 are new source findings and carry no self-verification verdict. In the published Hausberger article, Lemma 10.15’s zero-kernel assertion on p. 1354 fails for the projection V⊕V→V even for the trivial group. The correction uses semisimple-isotypic splitting. In §10.4, p. 1357, the centre and GL_d(K)^0 generate a subgroup of index d, not all GL_d(K); diag(ϖ,1) supplies the rank-two counterexample. The fixed-central-character argument needs finite-index averaging in characteristic zero. These are errors in intermediate proof assertions, and the corrected proof routes are attached to the analytic-HS gap and SR.3 request. Searches of the journal page and public correction listings found no correction on 2026-10-08.

## Confirmed red-team findings

| Finding | Treatment in this revision |
| --- | --- |
| RT-AREA-geomlanglands/2 | ET.6a remains the owner downstream of HS2 and independent classical towers; the SW20 range and EL comparison are corrected everywhere. HS3 supplies cohomological transport. Its unreviewed classical-comparison node overlaps this assignment and needs maintainer reconciliation; no supplier packet was edited. |
| /7 | Stratum-maps directly imports ES1:spectral-center/spectral-to-geometric-center-map. Its same-roadmap stage edge is retained in restructure. The other ES4/ES6 consumers are outside this job. |
| /9 | SR.1 is requested to supply the Λ-linear enhanced Bernstein centre, the pro-p Hecke corner limit and integral ℓ-adic separatedness. ES0’s exact centre-map node is cited. The ordinary CatCenter prototype needs its enhanced-centre comparison. |
| /11 | Basic-case-and-quasisplit-reduction explicitly imports the p-adic z-embedding data, adjoint-isomorphism functoriality, BG1’s basic-inner-class surjectivity and pure inner twisting. Equal characteristic is scoped by E2 and gap/z-embedding rather than asserted from Kaletha. |
| /12 | FA.2/FA.6 and AA.0/AA.1 own generic adeles and Haar infrastructure. This layer plans only D-specific maximal orders, compactness, spectrum, trace, EP tests, selected transfer/globalizations and selectors. AA.1’s number-field restriction is an explicit function-field extension request. |

## Coverage and where follow-up begins

### ExcursionOperatorsAndSpectralAction:ES7

Status: **planned**; 2 nodes, 1 planets.

- equal-transport: Equal-characteristic transport and second operation

### ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison

Status: **planned**; 5 nodes, 3 planets.

- mixed-tower: O_E classical tower diamond comparison

### ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic

Status: **planned**; 23 nodes, 6 planets.

- moduli: D-elliptic moduli proof expansion
- local-geometry: Equal-characteristic formal-module and uniformization proof
- weights: Corrected graded local chain proof closure (Kaiser)
- classical-local: Independent local correspondence and constants
- analytic-HS: Analytic quotient spectral sequence and Ext degeneration
- equal-transport: Equal-characteristic transport and second operation
- prototypes: Materialize supplier carriers and omitted geometric conditions

### ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic

Status: **planned**; 12 nodes, 6 planets.

- orders: Order existence and division compactness proof
- EP: Building EP orbital/character proof sources
- simple-transfer: Simple trace formula and selected transfer proofs
- classical-local: Badulescu’s equal-characteristic local character identity
- prototypes: Materialize supplier carriers and omitted geometric conditions

### ExcursionOperatorsAndSpectralAction:ES7:parabolic

Status: **planned**; 8 nodes, 5 planets.

- normalization: Root/modulus convention comparison
- z-embedding: Equal-characteristic quasi-split reduction; SL_p obstructs the torus-centre surjectivity route, requiring a different argument for non-smooth centres; GL_n does not use this reduction
- HN: Quantitative modification and constant-term closure
- prototypes: Materialize supplier carriers and omitted geometric conditions
- ExcursionOperatorsAndSpectralAction:ES7/gap/coefficient-base-change

These are target-level plans with honest endpoints in baseline declarations, exact supplier nodes, requests or named gaps. Follow-up must close the gaps and materialize the supplier interfaces before any stage can be marked closed. In particular, the all-local-field target still depends on the two equal-characteristic operations and their Satake-normalized transport; a three-action Drinfeld realization alone does not finish it.

### Gap index

- `ExcursionOperatorsAndSpectralAction:ES7/gap/normalization`: Root/modulus convention comparison. Resume at its named consumers and the detailed proof boundary in the packet/reader.
- `ExcursionOperatorsAndSpectralAction:ES7/gap/z-embedding`: Equal-characteristic z-embedding reduction. Resume at its named consumers and the detailed proof boundary in the packet/reader.
- `ExcursionOperatorsAndSpectralAction:ES7/gap/HN`: Quantitative modification and constant-term closure. Resume at its named consumers and the detailed proof boundary in the packet/reader.
- `ExcursionOperatorsAndSpectralAction:ES7/gap/mixed-tower`: O_E classical tower diamond comparison. Resume at its named consumers and the detailed proof boundary in the packet/reader.
- `ExcursionOperatorsAndSpectralAction:ES7/gap/orders`: Order existence and division compactness proof. Resume at its named consumers and the detailed proof boundary in the packet/reader.
- `ExcursionOperatorsAndSpectralAction:ES7/gap/EP`: Building EP orbital/character proof sources. Resume at its named consumers and the detailed proof boundary in the packet/reader.
- `ExcursionOperatorsAndSpectralAction:ES7/gap/simple-transfer`: Simple trace formula and selected transfer proofs. Resume at its named consumers and the detailed proof boundary in the packet/reader.
- `ExcursionOperatorsAndSpectralAction:ES7/gap/moduli`: D-elliptic moduli proof expansion. Resume at its named consumers and the detailed proof boundary in the packet/reader.
- `ExcursionOperatorsAndSpectralAction:ES7/gap/local-geometry`: Equal-characteristic formal-module and uniformization proof. Resume at its named consumers and the detailed proof boundary in the packet/reader.
- `ExcursionOperatorsAndSpectralAction:ES7/gap/weights`: Corrected graded local chain proof closure. Resume at its named consumers and the detailed proof boundary in the packet/reader.
- `ExcursionOperatorsAndSpectralAction:ES7/gap/classical-local`: Independent local correspondence and constants. Resume at its named consumers and the detailed proof boundary in the packet/reader.
- `ExcursionOperatorsAndSpectralAction:ES7/gap/analytic-HS`: Analytic quotient spectral sequence and Ext degeneration. Resume at its named consumers and the detailed proof boundary in the packet/reader.
- `ExcursionOperatorsAndSpectralAction:ES7/gap/equal-transport`: Equal-characteristic transport and second operation. Resume at its named consumers and the detailed proof boundary in the packet/reader.
- `ExcursionOperatorsAndSpectralAction:ES7/gap/prototypes`: Supplier carriers and geometric conditions in prototypes. Resume at its named consumers and the detailed proof boundary in the packet/reader.
- `ExcursionOperatorsAndSpectralAction:ES7/gap/coefficient-base-change`: Universal excursion action under coefficient extension. Resume at its named consumers and the detailed proof boundary in the packet/reader.

### Request index

- `AdelicAlgebraicGroups:AA.1`: Function-field extension of adelic-point/restricted-product and diagonal-embedding comparison for D^×. The existing AA.1/restricted-product-comparison node assumes a NUMBER FIELD and is not an exact function-field supplier; a field-general extension must be proved. RT-AREA-geomlanglands/12.
- `AlgebraicModuliForArithmeticGeometry:R09.2`: Relative Quot/Hom/Isom spaces with fixed Hilbert polynomials for the periodic chain-bundle and Hecke parameter spaces, with the exact projective-base hypotheses.
- `AlgebraicModuliForArithmeticGeometry:R09.4`: Stack/groupoid machinery and explicit algebraic atlases for the chain moduli problem; D-elliptic conditions themselves are constructed only in ES7.
- `AlgebraicModuliForArithmeticGeometry:R09.5`: Quotient by index shift and level rigidification through the supplied presentation, respecting automorphism removal and fine versus coarse representability.
- `AlgebraicModuliForArithmeticGeometry:R09.6`: Formal deformation, completion and algebraization carrier/universal properties. The special O_D-module deformation theorem and D-elliptic uniformization are additional ES7 statements, not inferred from a generic representability slogan.
- `AutomorphicSpectralTheory:AS.0`: Only abstract functional analysis for a unitary action on the compact D central quotient, with discrete Hilbert sum/finite multiplicities and smooth restricted-tensor-product factorization; no number-field automorphic realization is imported.
- `BunGAndNewtonStrata:BG0`: Hecke equivariance of BunGAndNewtonStrata:BG0/pure-inner-twisting (FS Corollary III.4.3, Bun_G ≃ Bun_{G_b} for basic b): the transport of bundles, modifications and bounds is HeckeStacksAndLocalShtukas:HS0/structure-group-and-inner-form; the compatibility of the Hecke functors T_V with the equivalence, which FS assert only in the proof of IX.7.2 (p. 335), is requested here. RT-AREA-geomlanglands/11.
- `BunGAndNewtonStrata:BG1`: Canonical parabolic/Levi and invariants of bμ(π)^N; additionally, for connected Z(G), surjectivity B(G)_bas→H¹(E,G_ad), derived by applying Kottwitz Proposition 10.4 to G→G_ad and proving the identification of basic adjoint classes with inner forms. Proposition 10.4 itself is a central-extension B-map statement. RT-AREA-geomlanglands/11.
- `BunGAndNewtonStrata:BG4`: HN strata and quantitative bounded-modification estimates: for each fixed bounded Hecke type V and b_N increasingly unstable in a fixed canonical parabolic, eventually every self-modification preserves that reduction.
- `DrinfeldModulesAndTModules:DM.7`: The matrix-algebra elliptic-sheaf construction and its chain/moduli conventions, and an explicit Morita interface to the general right-𝒟 formulation. This stage is only the split matrix case; D-division geometry is owned here.
- `EndoscopicTransferAndUnitaryTraceComparison:ET.6`: Independent classical characteristic-zero LLC and local JL for GL_n(E), including Q̄_ℓ coefficient transport, normalized induction and segment compatibility. It is not the supplier of the equal-characteristic D-elliptic route.
- `EndoscopicTransferAndUnitaryTraceComparison:ET.6a`: Two-tower cohomological realization and, downstream of HS2 and the independent classical tower, the tower/Hecke-fibre comparison: SW20 Theorem 24.2.5 for E = ℚ_p; for E ≠ ℚ_p, SW20 Corollary 24.3.5 for the EL data of Res_{E/ℚ_p}GL_n and of D, together with the identification of Res_{E/ℚ_p}GL_n-shtukas with GL_n/E local shtukas, at all levels and compatibly with the GL_n(E), D^× and Weil actions. Export this to ES7:GLn-comparison. No ET.6a→HS2 edge and no reliance on HS2’s examples to prove the classical identity. RT-AREA-geomlanglands/2.
- `EtaleDualityAndPerverseSheaves:EDC.2`: Finite-level étale cohomology of the proper smooth D-elliptic varieties over F̄: finite-dimensionality and proper smooth base change to good places. Poincaré duality is cited from EDC.2:pairings/adic-and-rational-poincare-duality and rigid-analytic compact support from ClassicalAdicEtaleCohomology:H3.
- `ExcursionOperatorsAndSpectralAction:ES6:functoriality`: The p-adic adjoint-isomorphism comparison and full Kaletha Definition 5.1/Fact 5.5 data are supplied by ES6:functoriality/isogenies and ES6:functoriality/z-embedding. The residual request is an equal-characteristic extension when Z(G) is smooth, and a different quasi-split reduction or centre-detection argument when Z(G) is not smooth. The present p-adic node does not supply either; see ES7/gap/z-embedding. No arbitrary-local-field z-embedding is inferred.
- `FunctionFieldArithmetic:FA.2`: Function-field completions, restricted products, diagonal topology, degree lattice and compact degree-zero idele class group. None is redefined here.
- `FunctionFieldArithmetic:FA.4`: Local/global function-field reciprocity and the geometric-Frobenius inversion convention, with central-character/determinant correspondence and finite-order twists.
- `FunctionFieldArithmetic:FA.6`: Function-field adelic central-character quotient, compatible automorphic levels, cuspidal finite-dimensionality and the generic reduction theory used to specialize compactness to PGL₁(D). No AF.2–3 or AS.6 number-field automorphic theorem is used.
- `HeckeStacksAndLocalShtukas:HS2`: For the equal-characteristic consumers, the O_K-formal-module / local-shtuka carrier and deformation interface for K = F_q((t)). The existing HS2 packet nodes (local-shtuka-moduli, hecke-fibre-description) are mixed characteristic; no packet owns equal-characteristic formal O-modules yet, so this request also stands in ES7/gap/local-geometry. ET.6a, not HS2, owns the characteristic-zero classical tower identity.
- `HeckeStacksAndLocalShtukas:HS3`: The Hecke/compact-cohomology and dual-adjunction interface. Existing packet statements are based at Q_p; give the restriction-of-scalars O_E variant for characteristic zero, and the separately proved equal-characteristic variant for the D-elliptic transport. Do not assume a tower identity from the generic HS3 interface.
- `ReductiveGroupsPartII:RG2.0`: Locally compact topologies on rational points and compact open units of integral matrix/maximal-order models.
- `ReductiveGroupsPartII:RG2.2`: The GL_d building, facets, facet normalizers, vertex permutation orientation and Euler-characteristic calculations used by LRS 13.1–13.2.
- `ReductiveGroupsPartII:RG2.3`: Parahoric pointwise fixers and congruence subgroups for building facets; distinguish them from full facet normalizers in the EP sum.
- `ReductiveGroupsPartII:RG2.5`: Pinned dual groups, L-group Levi maps and Galois-equivariant root data; they are additional to the baseline RootPairing type.
- `SchemeAndStackFoundations:SF.0`: The native quasi-coherent/locally free sheaf operations, base change, rank and Frobenius pullback for vector bundles on X×S. Scheme itself already exists at the pins; no second scheme carrier is planned.
- `SchemeAndStackFoundations:SF.3`: Curve divisors, Euler characteristic/Riemann–Roch and line-bundle twists, needed for D-elliptic periodicity and index-shift normalization.
- `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`: The abelian smooth-representation category, invariants under compact open subgroups and admissibility, for the automorphic space of the compact division-algebra quotient.
- `SmoothRepresentationsOfLocalGroups:SR.1`: For Z_ℓ[√q]-algebras Λ with invertible pro-orders, the Λ-linear centre π₀End(id_Dsmooth), its cofinal pro-p corner description lim_K Z(e_KH_Λe_K), and ℓ-adic separatedness for Λ=Z_ℓ[√q]. Also characteristic-zero Bernstein-centre separation by irreducible evaluations. SR.0 supplies the category; SR.3’s complex centre is not the integral construction. RT-AREA-geomlanglands/9.
- `SmoothRepresentationsOfLocalGroups:SR.2`: Smooth/compact induction, correct adjunctions and normalized parabolic induction i_Pτ=Ind_P(δ_P^{1/2}τ), with δ_P(m)=|det Ad(m)|Lie U_P|. Supply the coefficient and contragredient regimes needed here; these conventions belong to SR.2, not SR.1.
- `SmoothRepresentationsOfLocalGroups:SR.3`: Extend the stated complex results through finite coefficient fields to Q̄_ℓ: supercuspidal support and GL_n segment classification, compact matrix coefficients, finite-representation projectivity/injectivity on GL_d(K)^0, local character distributions and the strict unitary-generic Satake bound. Each requires a source-qualified coefficient comparison; complex-only results are not silently applied over Q̄_ℓ. For the fixed-central-character Hom pairing, provide semisimple-block lifting and finite-index averaging for Z(K)·GL_d(K)^0 (index d); the printed zero-kernel and generation assertions are invalid (source issues E10–E11).
- `VStackSheavesAndLisseCategories:VS1`: Six-operation base change and cohomological smoothness for the stratum/constant-term diagram, with the ULA and support hypotheses allowing the indicated shriek maps.
- `VStackSheavesAndLisseCategories:VS4`: Fully faithful embeddings of D(G_b(E),Λ) into D_lis(Bun_G,Λ): the left adjoint to the stratum pullback i_b^* (FS VII.7.2) and the trivial-stratum j_!, in the coefficient range of FS VII.7. The independence of the restricted centre action from the choice of embedding is ES5/stratum-centre-embedding-independence.
- `WeilConjectures:WC.2`: Grothendieck’s functional equation of L-functions of lisse sheaves on a curve over F_q with its ε-factor, used for the pair L-functions of the selected globalizations. The local ε-factor product formula (Laumon) is an additional input recorded in ES7/gap/classical-local.
- `ExcursionOperatorsAndSpectralAction:ES1:spectral-center`: Scalar-extension compatibility of the universal excursion action for every ℤ_ℓ[√q]-algebra Λ, including nonflat Λ and primes dividing |π₀Z(G)|. For Λ→Λ′ and compatible coefficient data, identify the scalar extension of each operator S_D with S_{D⊗ΛΛ′}; carry this through the stratum restriction. This extends the ES0 excursion construction and the ES1 coefficient-condition-free action; the cited ES1 node states existence but does not state this base-change theorem. FS IX.7.2, p. 335, uses it to pass from integral coefficients to arbitrary Λ.

## Maintainer reconciliation

Keep the three same-roadmap stage edges listed in restructure: ES1:spectral-center → ES7:parabolic, ES0:classical-center → ES7:parabolic, and ES7:GLn-comparison → ES7:equal-characteristic. Promotion does not automatically draw these edges.

The retained structural note reports the cross-packet cycle ES6:functoriality → ES7:parabolic → ES6:duality → ES6 → ES6:functoriality, caused by supplier nodes parented at ES6. The local ES7 node graph is acyclic. Resolving that parent-stage cycle and the ET.6a/HS3 comparison overlap requires coordination across packets, outside this revision’s four deliverables.

Other exact scope mismatches remain explicit: BG4’s qualitative boundedness does not supply the quantitative HN theorem, HS2’s present mixed-characteristic examples do not provide the equal-characteristic formal comparison, AA.1 is presently number-field specific, and SR.3’s complex statements need transport through coefficient fields. DM.7’s Morita interface, the pair-local-constant interface and source-qualified simple trace inputs also need their requested extensions.

## Baseline and source checks

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`. All 30 cited declarations and standing parameters were read at the pins; a newer working Tau Ceti checkout was not treated as the pinned baseline. Representation.ind supplies algebraic induction, with an additional smooth compact-induction comparison required. The finite-group character theorem is not used for Weil groups. The five records in the reviewed library audit remain not built. Relevant supplier statements and all stage links in scope were inspected; no separate link-map entry mentions an ES7 stage.

The two upstream roadmaps read for density and conventions were AdicSpaces and RepresentationTheory/InductionRestriction. The private-library index was read; no restricted book was needed or used.

Seven public files were re-downloaded and hashes checked against the packet. Reading in this revision: FS IX.7 in full (pp. 334–338), IX.5.2 (p. 329, including page image), VIII.3.6 (p. 288), IX.6.1 (p. 330), III.4.3 (p. 101); Hausberger order/level definitions (pp. 1291–1293), special formal modules and deformation statements, moduli and Hecke conventions, uniformization (pp. 1321–1323), local correspondences/Res′ (pp. 1333–1338), selected cohomology and spectral-sequence statements (pp. 1338–1342), degeneration/Hom proof (pp. 1352–1357), Appendix A.12 (pp. 1363–1365); LRS images for pp. 290–291, 299, 302, 306 and 314–319; both Kaiser pages in full; Kaletha standing hypothesis (§2, p. 64) and §5.1 (pp. 78–80); Kottwitz 10.4–10.5 (pp. 50–51) and 13.1 (pp. 65–66); SW20 24.2.5 and its proof (pp. 227–228), EL/PEL data and 24.3.5 (pp. 230–231). The earlier wider moduli/Satake readings remain prior-worker or independent-review provenance. Source statements in the repository are paraphrases with locators, never excerpts or section-by-section summaries.

Proof sources still needed include the independent mixed-characteristic tower/classical LLC arguments, equal-characteristic Drinfeld/Genestier and dual formal-module comparisons, Boyer’s local admissibility/genericity inputs, Badulescu’s character theorem, Laumon’s EP proof, Henniart’s numerical and selected-transfer arguments, and the local-constant comparison. None is claimed supplied by this revision.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/ExcursionOperatorsAndSpectralAction--ES7.json`: 0 errors, 0 warnings, five planned stages, zero closed stages.
- The `check` function from `scripts/check_errata.py` applied to the packet’s sourceIssues/sourceVersions in errata-v1 form: 0 errors. E1–E9 retain their prior independent verdicts; E10–E11 await verification.
- `lean-check research/blueprint/suggested/ExcursionOperatorsAndSpectralAction--ES7.lean`: exit 0 at the exact Mathlib pin; only declaration-admission warnings. Memory availability was checked before compiling. The file imports Mathlib only. Tau Ceti citations were separately source-checked at the pin, so this does not claim a compile against newer Tau Ceti declarations.
- Reader consistency: all 50 node statements, all 53 API statements, all 34 test statements, prerequisites, acceptance criteria, coverage, requests, gaps and source issues are represented. Node ids and parent stages agree with the corrected preceding-review packet; its packet-level review object is unchanged. Generated structure projections account for the two API names not spelled out as separate Lean definitions.
- `git diff --check`: clean. Only the four authorized deliverables changed. No source files, excerpts, private absolute paths or build artifacts were added.

The scratch worklist, extracted public source text, images and build logs are disposable and are removed on submission. Everything needed to resume is in the packet, reader, suggested-file docstrings and this handoff. The next process should review this revision or take a separate queued follow-up; this worker takes no second job.
