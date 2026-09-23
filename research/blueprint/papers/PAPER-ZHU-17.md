# Zhu (2017): affine Grassmannians and the geometric Satake in mixed characteristic, extraction and routing

Issue [#1151](https://github.com/CBirkbeck/tauceti-explorer/issues/1151). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged Codex checkpoints, whose report follows below as history.
- **The paper.** X. Zhu, *Affine Grassmannians and the geometric Satake in mixed characteristic*, Ann. of Math. 185 (2017), 403–492.
  - The published PDF was re-fetched; its SHA-256 (5d50b415…) matches the checkpoint.
- **Items.** The result has **221 items: 25 library, 45 planned and 151 missing**. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** Thirty-four are recorded under `sourceIssues`.

## This continuation (cc-442dc5)

**Items.**
- New items: Proposition 1.20, Lemma 2.31, and Conjectures III and IV (statement only).
- Theorems 0.1 and 0.2 and Proposition 0.4 restate body results; the corresponding items (Theorem 1.4, Theorem A.29 and Proposition 3.11) now name them.
- Two Appendix B locators are corrected (Proposition B.1, Lemma B.10).

**Reclassified to affect nothing.**
- **Twenty misprints.** The checkpoint had marked seventeen of them (E2, E4–E8, E11, E12, E14, E16, E22, E23, E28, E29, E31–E33) as affecting the proof. In each the intended form is fixed by the surrounding types and conventions.
- **E15.** Koszul sign written with ±1 parities.
- **E19.**
  - The problem: Theorems 0.5 and 3.1 omit "nonempty".
  - Why it is harmless: Rapoport's conjecture, as formulated in GHKR06, is a statement about nonempty X_μ(b), and the proof treats that case.
- **E30.** An index range.

**New finding.**
- **E34.** Appendix B says "Proofs are generally omitted in this section". Its propositions and lemmas are therefore unproven in the paper. Only remarks in §1 refer to Appendix B, so the main theorems are unaffected.

**Unchanged.**
- **A.3 statements (E24–E27).** False in their stated generality; these affect a stated result.
- **Proof errors.** E20 (the fixed-λ estimate in Proposition 3.3) and E21 (the framing in §3.2).
- **E1.** The arXiv-revised A.29 argument; `known` names the revision.

**Gaps.**
- Q-closure, Q-coefficients, Q-ADLV and Q-RZ are recorded as findings.
- The others are deferred as cited suppliers' proofs, the separate BS17 job, or review.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once, and the mistakes are recorded.

## Mistakes found (`sourceIssues`)

- **E1** (error; affects the proof), arXivv2 AppendixA, PropositionA.28 PDF47–48; revisedv3 A.29 PDF53–54; publishedpp476–477. *Printed:* The older quotient argument lacks the flatness justification needed for the perfect torsor. *Correction:* Use the revised finite-flat groupoid argument and Ferrand flatness descent A.31.
- **E2** (misprint; affects nothing), p412, coweight order. *Printed:* positive roots *Correction:* Use positive coroots in the coweight dominance order.
- **E3** (misprint; affects nothing), p413, end proof1.1. *Printed:* L_pZ and L_pA^n *Correction:* Use LZ and LA^n in the punctured perfect-loop argument.
- **E4** (misprint; affects nothing), p417, proof1.5. *Printed:* (1/p)β⁻¹:pE2→E1 *Correction:* Use β⁻¹ restricted to pE2, equivalently pβ⁻¹:E2→E1.
- **E5** (misprint; affects nothing), p417, proof1.5. *Printed:* E1/E2 equals the indicated cokernel *Correction:* Use E2/E1.
- **E6** (misprint; affects nothing), p421, proof1.10. *Printed:* γ=ε_A α⁻¹ ε⁻¹ *Correction:* Use γ=ε_A⁻¹ α⁻¹ ε with the displayed types.
- **E7** (misprint; affects nothing), p422, proof1.14. *Printed:* Gr(i,E0/p), in the relative construction *Correction:* Use Gr(i,E/p) at the varying lattice E.
- **E8** (misprint; affects nothing), p424, proof1.17. *Printed:* Reverse chain with the original μ_i* indexing and incompatible displayed arrows *Correction:* Reverse the positions as μ_(N+1−i)* and orient maps F_i→F_(i−1) when F0=E.
- **E9** (misprint; affects nothing), p424, proof1.17. *Printed:* reference(1.4.2) *Correction:* Use(1.3.3).
- **E10** (misprint; affects nothing), p429,(1.4.4). *Printed:* g t^μ *Correction:* Use gϖ^μ.
- **E11** (misprint; affects nothing), p436, proof2.9. *Printed:* Open-orbit H_c degree ⟨2ρ,λ⟩ *Correction:* For unshifted constant coefficients on S_λ∩Gr_μ use degree ⟨2ρ,λ+μ⟩.
- **E12** (misprint; affects nothing), p436, filtration display. *Printed:* Fil_≥μ with S_<λ on its right side *Correction:* Use the same weight index throughout the filtration definition.
- **E13** (misprint; affects the proof), p437, proof2.12. *Printed:* s_(1+θ), where θ was a coroot *Correction:* Use the affine root with linear part dual to θ, with the wall sign fixed by the adjacent parahorics.
- **E14** (misprint; affects nothing), p440, proof2.17. *Printed:* Convolution product written as the coefficient sheaf on the twisted source *Correction:* Use the twisted external product before applying m_!.
- **E15** (error; affects nothing), p448,(2.4.4). *Printed:* (-1)^(p(A1)p(A2)), with p valued in {+1,−1} *Correction:* Use additive ε(A)=(1−p(A))/2 and exponent ε(A1)ε(A2).
- **E16** (misprint; affects nothing), p451,§2.4.4. *Printed:* C_μ=IC_μ[+⟨2ρ,μ⟩] *Correction:* For the unshifted IC complex used by the KL stalk formula, set C_μ=IC_μ[−⟨2ρ,μ⟩].
- **E17** (misprint; affects nothing), p452, comparison map domain. *Printed:* The source of γ is printed without its opposite-space qualifier *Correction:* Retain the opposite Grassmannian in the domain specified by the preceding construction.
- **E18** (misprint; affects the proof), p453, provenance of2.35. *Printed:* The equal-characteristic analogue of Lemma2.32 *Correction:* The LY argument uses the full intersection-cohomology sign theorem, corresponding to Proposition2.30; published LY§4.3–4.4 and§7.4.
- **E19** (error; affects nothing), Theorems0.5 and3.1, pp407,455. *Printed:* Dimension formula with no nonemptiness qualification *Correction:* Require X_≤μ(b) nonempty, or state the empty case separately.
- **E20** (error; affects the proof), pp459–460, proofProposition3.3. *Printed:* Fixed-λ semismall estimate used over the closed union X_≤λ *Correction:* Apply the estimate over each exact X_ν, then maximize over ν≤λ. Verify nonempty full-dimensional top-stratum input for equality.
- **E21** (error; affects the proof), p461, simultaneous choice of b and standard Hodge filtration. *Printed:* The chosen framing is asserted to realize both fixed b and the fixed standard μ-filtration from double-coset membership alone *Correction:* Choose an adapted representative, or transport μ and the filtration with the frame.
- **E22** (misprint; affects nothing), p463, proofProposition3.11. *Printed:* A quasi-isogeny X→X0 followed by D(ι):D(X)→D(X0) *Correction:* Use ι:X0→X, as in the moduli definition.
- **E23** (misprint; affects nothing), p468, proofA.9. *Printed:* E=E_perf and φ:E→Y *Correction:* Use E=(E′)_perf and the torsor projection φ:E→X.
- **E24** (error; affects a stated result), PropositionA.32, p477. *Printed:* A closed point x of X over a general perfect field k supplies the stated orbit map from H *Correction:* Require x∈X(k), or first base change to κ(x).
- **E25** (error; affects a stated result), p478,A.3.1. *Printed:* IC restricts on the smooth locus to Q̄_ℓ[2d](d) *Correction:* Use the perverse normalization Q̄_ℓ[d], optionally with a separately chosen half Tate twist.
- **E26** (error; affects a stated result), pp479–480,A.3.3. *Printed:* Top compact cohomology of an irreducible k-space is canonically one copy of Q̄_ℓ *Correction:* Require geometric irreducibility for a scalar trace; otherwise use the geometric-component space.
- **E27** (error; affects a stated result), p480,A.3.3, model independence. *Printed:* Any morphism of d-dimensional irreducible finite-type spaces induces a canonical trace-compatible isomorphism on top H_c *Correction:* Replace this with the correct functoriality including properness/degree and specified model orientations; an independent normalization proof remains open.
- **E28** (misprint; affects nothing), p480,A.3.4. *Printed:* Function on X(F_q), followed by x∈X(F_(q^r)) *Correction:* Fix r and use the corresponding Frobenius^r stalk trace on X(F_(q^r)), or set r=1 throughout.
- **E29** (misprint; affects nothing), p482,A.3.5 andB.1. *Printed:* php; filtration of E/E0 *Correction:* Use pfp; use E0/E for the positive colength quotient.
- **E30** (misprint; affects nothing), p485,LemmaB.7. *Printed:* i=1,…,h *Correction:* Use i=0,…,h−1.
- **E31** (misprint; affects nothing), p485, proofB.8. *Printed:* D(X0)≅W(k)^n *Correction:* Use D(X0)_τ0≅W(k)^n.
- **E32** (misprint; affects nothing), p488, determinant unit inB.11. *Printed:* p²[λ] in the normalization following [λ]detX=p² *Correction:* Use p²[λ]⁻¹.
- **E33** (misprint; affects nothing), p488, matrix factorization inB.11. *Printed:* g̃=X̃Ã⁻¹ *Correction:* Use g̃=Ã⁻¹X̃ when X̃=Ãg̃.
- **E34** (gap; affects a stated result), Published version, Appendix B opening, p.484. *Printed:* Proofs are generally omitted in this section. *Correction:* Treat Proposition B.1, Proposition B.2, Lemma B.4, Lemmas B.7–B.11 and Proposition B.8 as stated without proof. Supply proofs, or import them where later work gives them (Bhatt–Scholze 2017 for the determinant line of Conjectures I and II).

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **Q-closure** (recorded). The omitted Appendix B proofs are recorded as E34. Splitting bundled interfaces further is design work.
- **Q-models** (deferred). Yanagihara, Conrad, Keel–Mori and Ferrand are cited suppliers; the A.29 revision is E1.
- **Q-geometry** (deferred). Katz, BD, PR and Alper inputs are cited suppliers.
- **Q-coefficients** (recorded). The A.3 normalization problems are E24–E27. BBD, Braden and hyperbolic localization are cited suppliers.
- **Q-generators** (deferred). NP01 and Zhu16 are cited suppliers.
- **Q-KL** (deferred). KL, LV and Lusztig–Kato are cited suppliers; LY is cited for the sign theorem (E18).
- **Q-tannaka** (deferred). Tannakian reconstruction is a cited supplier.
- **Q-ADLV** (recorded). The fixed-λ estimate is E20. GHKR06, Hamacher, CKV and Viehmann are cited suppliers.
- **Q-RZ** (recorded). The framing is E21 and the arrow is E22; the omitted B.7–B.9 computations are E34. Lau, Kim and Howard–Pappas are cited suppliers.
- **Q-det** (deferred). The determinant line is Bhatt–Scholze 2017, a separate paper job; Conjectures III and IV are statement-only items.
- **Q-source** (deferred). Independent review of the findings is the review pipeline's job.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result. Item ids are unique, every missing item is routed exactly once, and every prerequisite target exists. No Lean deliverable is part of a paper job.

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or *open*, or gives the earlier classification of the findings reclassified here, this continuation supersedes it.

## PAPER-ZHU-17 — published-source extraction and routing checkpoint

Xinwen Zhu proves the representability and ind-properness of mixed-characteristic affine Grassmannians on perfect residue algebras, the rational geometric Satake equivalence, an affine Deligne–Lusztig dimension formula and a perfected-special-fibre comparison with unramified Hodge-type Rapoport–Zink spaces. Appendix A develops the perfect-space foundations and coefficient conventions. Appendix B records determinant and deperfection questions, an isogeny-chain interpretation of resolution models, and an explicit rank-two singular chart.

This is a **partial checkpoint**, not a completed recursive extraction. All 90 pages of the published article were read, including both appendices and the bibliography. The principal constructions and named results are indexed below, but several entries still bundle proof lemmas, original cited sources remain unread, and Appendix B explicitly omits substantial proofs. The gap register identifies those obligations. Nothing here asserts that the geometry or its suggested APIs has been formalized.

The primary source is the [published Annals article](https://annals.math.princeton.edu/2017/185-2/p02), DOI 10.4007/annals.2017.185.2.2, pp. 403–492. The actual published PDF was obtained and hashed. The arXiv v2 and v3 passages were read only for the recorded comparisons, not as substitutes for a complete collation. The published Lusztig–Yun paper was read at the explicitly listed pages; its full twisted-Hecke setup is still a prerequisite.

### Proof structure and ownership

The original representability proof produces **perfect algebraic spaces**, then ind-properness. Its finite-jet matrix quotient uses the corrected Appendix A free-action theorem. The older arXiv argument did not justify the flatness needed for the quotient torsor; v3 explicitly records that repair and the publication includes the finite-flat groupoid and Ferrand descent steps. These are shared perfect-geometry foundations. They must not be replaced by the later Bhatt–Scholze projectivity theorem when reconstructing Zhu’s original argument.

General perfect spaces and finite-type models stay in SchemeAndStackFoundations. Perfect torsors and quotients use its stack/site layers. RelativeFarguesFontaine RF0 supplies ramified Witt coefficients; ReductiveGroupsPartII supplies local groups, parahorics and actual cocharacter lattices; GS0:Witt-geometry supplies lattices, relative-position bounds, Demazure towers and the bounded Grassmannian geometry. The already extracted Bhatt–Scholze theorem resolves Conjectures I and II, with its own remaining proof gates. It does not identify all canonical orbit-field models or fill B.7–B.9 automatically.

The rational Satake proof has a specific acyclic order. Minimal minuscule/quasi-minuscule objects and their explicit resolutions give concentration and perversity. The geometric PRV result then gives idempotent generation. General convolution perversity follows, and **general semismallness is deduced afterward**. Reversing those two steps would make the proof circular. Semi-infinite orbit dimensions use the classical algebraic Satake transform and Lusztig–Kato coefficients, whose owner is SmoothRepresentationsOfLocalGroups SR.4; the later geometric trace comparison is not an input.

The common Satake category, convolution and rational dual-group outputs remain in GS1/GS2/GS4. The one new candidate, **GeometricSatakeAndFusionPartIIRationalGelfandProof**, contains the separate symmetry argument. It constructs the equivariant cohomology bimodule, proves the two coefficient-ring actions agree, compares opposite Grassmannian categories at finite levels, and uses pinned opposition plus the restricted twisted KL identity. It imports the existing early category/convolution contracts, never GS3:fusion or the mixed equivalence it is proving. It exports symmetry to the existing rational endpoint. The eventual design must preserve this early/late distinction even though a coarse roadmap graph would show edges in both directions.

The numerical identity is proved through **equal-characteristic** geometric Satake. Its owner is GlobalShtukasAndFunctionFieldLanglands GS.1. In the published Lusztig–Yun source, Theorem 7.3(2), Lemma 7.2 and §7.4 correspond to Zhu’s cited 6.3/6.2 numbering. The theorem applies to specific longest finite-parabolic double-coset representatives and a specified twisted involution, not arbitrary KL polynomial pairs. RootSystemsPartIIDominanceAndDemazure supplies the indexing adapters, and SmoothRepresentationsPartIIParahoricCenters supplies the shared generic Hecke algebra and its twisted module extension. The mixed-characteristic stalk/trace realization remains an explicit proof gate.

The coefficient foundations also have an order. EDC.5 owns early perversity and intermediate extension; EDC.7 owns later rational pure decomposition. The existing CohomologicalPointCounting family supplies ordinary constructible coefficients, compact support, normalized systems and Frobenius trace. This extraction adds perfect-model and equivariant comparisons rather than rebuilding those upstream constructions. MC.6 owns abstract neutral Tannakian reconstruction. The pinned Tau Ceti theorem starts with a known Hopf algebra and cannot substitute for that construction.

The ADLV route reuses HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig. It splits the basic-Levi, superbasic, adjoint and restriction-of-scalars reductions, the ordered Frobenius norm, and the dimension comparisons. The theorem is stated for **nonempty** spaces. Semismall fibre estimates are applied on exact endpoint strata, followed by a maximum over the closed bound; the top-stratum lower bound still needs its nonemptiness and dimension proof. BunGAndNewtonStrata remains the owner of Newton, Kottwitz and centralizer invariants.

The Hodge RZ comparison reuses the existing integral local-shtuka and finite-flat tensor continuations. It requires p>2, unramified data, the specified minuscule weights and contravariant Dieudonné conventions. The exact adapted filtration cannot be inferred just from double-coset membership. Equality on geometric points is promoted to equality of reduced perfect closed subspaces only after checking the finite-presentation and embedding hypotheses. The separate Appendix B chain model retains k=F̄_p, the degree-2h coefficient extension, all four isogeny conditions and the τ0 component of the Dieudonné module.

### Normalization and small-case audit

The result records the known quotient-proof repair and new candidates for independent source review. Three particularly consequential conventions are kept visible. First, IC is normalized by [dimension], while the unshifted complex used in the KL formula is IC[−dimension]; the smooth dualizing complex is a different object. Second, the component sign p(A)∈{±1} must be converted to additive parity ε(A) before it appears in a Koszul exponent. The printed multiplicative-sign exponent gives −1 even for the tensor unit. Third, top compact cohomology is a geometric-component space. A scalar trace needs geometric irreducibility, and an arbitrary map of same-dimensional spaces does not induce a trace-preserving isomorphism.

The last point is an unresolved orientation/model gate, not a replacement theorem invented by this extraction. Spec F_(q²) has two geometric components. A constant map P1→P1 kills H², and a degree-two map multiplies it by two. Frobenius pullback scales the Chern class of O(1) by p. Thus A.3’s model-independence argument needs precise dualizing and orientation comparisons before its cycle classes can be used without qualification.

The explicit B.11 matrix check is independent of typography. For an odd prime p, take A=[[p,−1],[0,p]], g=[[1,0],[1,1]] and X=Ag. Then A⁻¹X=g is integral, whereas XA⁻¹ has entry −1/p². The correct factorization order is therefore essential. The finite-coordinate open condition is satisfied by the displayed X0 and X1. The exact arithmetic diagnostics record this and the determinant-unit inverse, IC shifts, parity, torus emptiness, Hodge framing, tower indices and ordered norm telescoping. These computations test formulas and boundary cases; they do not compile or prove the full geometric theorems.

Several apparent problems were rejected during inspection. The closure bar in (3.1.1) is present in the published PDF. Multiplicative {±1} parity notation itself is intentional; the error is its use as a Koszul exponent. The paper explicitly suppresses Tate twists in one quasi-minuscule calculation. The separate negative-step determinant convention is not automatically an error. The parenthetical motives claim and possible ramified extension remain unsupported remarks here, and no claim is made about the present-day status of Conjecture III.

The result contains **217 items**: 25 library imports, 45 planned items and 147 missing items. There are 18 routes, 71 definitions/constructions, 213 API statements and 213 mathematical acceptance specifications. All 33 source findings await independent review.

### Route briefs and destinations

#### 1. SchemeAndStackFoundations

Owner `SchemeAndStackFoundations`; `source` route; 41 items.

General perfect spaces, pfp models, Frobenius approximation and perfect morphism properties belong to the common foundation, already used by BS17 and HE21. GS consumes them.

Stages: `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.4`.

Imports: Pinned Scheme/PerfectClosure, SF.1 torsor descent, HE21/133–134 and BS17 general models.

Suggested future module: `TauCeti/AlgebraicGeometry/Perfect/Models.lean`.

#### 2. SchemeAndStackFoundations

Owner `SchemeAndStackFoundations`; `source` route; 10 items.

Own perfect-site torsors, groupoids and the revised free-action quotient theorem once, including A.30–A.31 flatness. The fpqc site is not a new h/v site.

Stages: `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.2`.

Imports: SF.0 perfect models, Pinned finite-subcomodule theorem, Keel–Mori/Conrad and Ferrand source gates.

Suggested future module: `TauCeti/AlgebraicGeometry/Perfect/Quotient.lean`.

#### 3. RelativeFarguesFontaine

Owner `RelativeFarguesFontaine`; `source` route; 1 items.

Reuse the ramified Witt coefficient owner. Zhu’s loop functors are consumers, not another coefficient-ring theory.

Stages: `RelativeFarguesFontaine:RF0`.

Imports: Pinned WittVector and TruncatedWittVector.

Suggested future module: `TauCeti/Algebra/PeriodRing/RamifiedWitt.lean`.

#### 4. ReductiveGroupsPartII

Owner `ReductiveGroupsPartII`; `source` route; 4 items.

Reuse integral representations, Weil restriction, buildings, parahorics, Cartan/Iwahori–Weyl data and the dual datum. Separate ramified integral restriction from reductivity.

Stages: `ReductiveGroupsPartII:RG2.0a`, `ReductiveGroupsPartII:RG2.1`, `ReductiveGroupsPartII:RG2.2`, `ReductiveGroupsPartII:RG2.3`, `ReductiveGroupsPartII:RG2.4`, `ReductiveGroupsPartII:RG2.5`.

Imports: Upstream root-system/Coxeter roadmap and pinned root carriers, SF.0/SF.1.

Suggested future module: `TauCeti/AlgebraicGeometry/ReductiveGroup/LocalFlagData.lean`.

#### 5. BunGAndNewtonStrata

Owner `BunGAndNewtonStrata`; `source` route; 2 items.

The existing G-isocrystal/Kottwitz owner supplies ν, κ, J_b and component comparisons; ADLV only adds its geometric application.

Stages: `BunGAndNewtonStrata:BG0`, `BunGAndNewtonStrata:BG1`.

Imports: VectorBundlesAndIsocrystals:VB0, RG2 local groups, GS0 Witt geometry.

Suggested future module: `TauCeti/AlgebraicGeometry/Isocrystal/KottwitzComponents.lean`.

#### 6. GeometricSatakeAndFusion

Owner `GeometricSatakeAndFusion`; `source` route; 43 items.

Add Zhu’s original perfect algebraic-space construction, relative positions, resolutions and explicit deperfections to the existing GS0 owner. Import later BS determinant/projectivity as a separate theorem, not an original-proof input.

Stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Imports: SF.0/SF.1 perfect geometry, RF0 coefficients, RG2 parahorics, EDC coefficient comparisons.

Suggested future module: `TauCeti/AlgebraicGeometry/AffineGrassmannian/Witt/Geometry.lean`.

#### 7. EtaleDualityAndPerverseSheaves

Owner `EtaleDualityAndPerverseSheaves`; `source` route; 14 items.

Extend the shared ordinary coefficient/duality/perverse theory to perfect models and finite-level equivariance. Import ConstructibleEtale, EtaleBaseChange, CompactSupport, EllAdicRealization and TraceFormula unchanged. EDC.5 is early perversity; EDC.7 is later rational decomposition. The A.3 orientation problem remains a proof gate.

Stages: `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.1:adjoint`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`, `EtaleDualityAndPerverseSheaves:EDC.3`, `EtaleDualityAndPerverseSheaves:EDC.4`, `EtaleDualityAndPerverseSheaves:EDC.5`, `EtaleDualityAndPerverseSheaves:EDC.6`, `EtaleDualityAndPerverseSheaves:EDC.7`.

Imports: CohomologicalPointCounting upstream family, EnhancedDerivedSheaves:E0/E1/E2, SF.0 perfect models, DeligneWeightsAndPurity for pure decomposition.

Suggested future module: `TauCeti/AlgebraicGeometry/Etale/PerfectEquivariant.lean`.

#### 8. GeometricSatakeAndFusion

Owner `GeometricSatakeAndFusion`; `source` route; 25 items.

Reuse the common rational category, convolution, weight and dual-group interfaces. Add Zhu’s rational special-fibre source without replacing GS3:fusion or inferring integral/multi-leg statements. Its independent Gelfand continuation supplies a separate symmetry proof to the rational endpoint.

Stages: `GeometricSatakeAndFusion:GS1`, `GeometricSatakeAndFusion:GS2:correspondences`, `GeometricSatakeAndFusion:GS2:Satake-closure`, `GeometricSatakeAndFusion:GS4:rational-reductivity`, `GeometricSatakeAndFusion:GS4:integral-dual-group`.

Imports: GS0:Witt-geometry, EDC.5/7, SR.4 classical Satake, MC.6 abstract reconstruction, Gelfand continuation for Zhu’s proof route.

Suggested future module: `TauCeti/RepresentationTheory/Satake/WittRational.lean`.

#### 9. SmoothRepresentationsOfLocalGroups

Owner `SmoothRepresentationsOfLocalGroups`; `source` route; 1 items.

The classical algebraic Satake transform precedes the geometric proof and already has an owner. The later GS4 trace comparison is a consumer, not an input.

Stages: `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.4`.

Imports: RG2.4 Cartan data, Existing Haar and Hecke carriers.

Suggested future module: `TauCeti/RepresentationTheory/Smooth/ClassicalSatake.lean`.

#### 10. GlobalShtukasAndFunctionFieldLanglands

Owner `GlobalShtukasAndFunctionFieldLanglands`; `source` route; 2 items.

The equal-characteristic geometric Satake theorem and its opposition-sign specialization feed the LY numerical identity independently of mixed Satake.

Stages: `GlobalShtukasAndFunctionFieldLanglands:GS.1`.

Imports: Equal-characteristic Grassmannian/fusion proof, EDC coefficients, MC.6 abstract reconstruction.

Suggested future module: `TauCeti/RepresentationTheory/Satake/EqualCharacteristicOpposition.lean`.

#### 11. MotivesAndAlgebraicCycles

Owner `MotivesAndAlgebraicCycles`; `source` route; 1 items.

The neutral reconstruction theorem already has this common owner. Extract its abstract early supplier independently of later motivic period applications; GS imports it. No reviewed MC.6 audit entry exists in this snapshot, so the pinned known-Hopf theorem is the only credited implementation.

Stages: `MotivesAndAlgebraicCycles:MC.6`.

Imports: Pinned known-Hopf Tannaka comparison, Abstract rigid symmetric categories and exact fibre functors.

Suggested future module: `TauCeti/CategoryTheory/Tannakian/NeutralReconstruction.lean`.

#### 12. SchemeKTheoryOperations

Owner `SchemeKTheoryOperations`; `source` route; 1 items.

Reuse the supported-complex/localization and quasi-isogeny comparison owner identified in BS17; import the exact category and K-spectrum machinery from the existing K-theory roadmaps.

Stages: `SchemeKTheoryOperations:S.3`.

Imports: KTheoryLowDegrees:Z.3, GeneralAlgebraicKTheory:K.2:plus, BS17 support determinant source route.

Suggested future module: `TauCeti/AlgebraicGeometry/KTheory/QuasiIsogeny.lean`.

#### 13. Root systems, Weyl groups, and the Cartan-Killing classification, Part II: dominant subtraction and Demazure reduction

Owner `RootSystemsPartIIDominanceAndDemazure`; `part-ii` route; 1 items.

Reuse the existing candidate identifier and shared supplier; this is an additional source, not a second roadmap.

Import root systems, Weyl groups, and the Cartan-Killing classification (tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems), the existing weight-lattice interfaces from representations of semisimple Lie algebras, highest weight theory, and the Weyl formulas (tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight), and local relative/affine root adapters from ReductiveGroupsPartII RG2.1/RG2.4. Do not re-plan any upstream layer; reconcile their conflicting prose about lattice ownership by using the existing pinned root-datum carrier. Construct only the missing parabolic-representative/support adapters and Demazure product, with maximum characterization, simple recursion, associativity, monotonicity, support union and ordinary-product comparison. Prove the HN14 reduction-to-minimal-length theorem for affine twisted conjugacy. For an explicit full coweight lattice prove nonemptiness, lower-directedness and leastness of the dominant subtraction feasible set; export Prop.5.1, Cor.5.3 and the exact identity (λ−domλ1)−domλ2=λ−dom(λ1+λ2). Supply ρ∨_J and η∨_J on this full lattice, the root-sign/length lemmas used in (5.1)–(5.4), the minuscule exception and the 2ρ∨ bound. Do not identify the full lattice with the cocharacters of every G; G1 must be settled by an explicit comparison. Test A1 parity in P∨/Q∨, singular A2 representatives, s*s=s, diagram automorphisms, non-simply-laced dual root data and strict versus weak dominance. Every definition needs APIs and genuine unit examples. Suggested future Lean home: TauCeti/GroupTheory/Coxeter/Demazure.lean and TauCeti/LinearAlgebra/RootSystem/DominantSubtraction.lean; no Lean implementation is supplied in this paper job. Follow-up: add finite and parabolic twisted Coxeter elements, their ellipticity and HY12's finite-Coxeter-part reduction theorem, preserving P∨ versus actual cocharacters and τ-saturated support. The shared generic Hecke/cocenter carrier belongs to SmoothRepresentationsPartIIParahoricCenters, not a second algebra here. Consolidate the overlapping RootSystemsDominancePartII candidate from PAPER-KISIN-ZHOU-25 into this already reused identifier, as also requested by PAPER-KISIN-PAPPAS-ZHOU-26; retain their stable item ids and separate Stembridge/Frobenius-orbit obligations. The ²A2 regression /127 is mandatory: normalized subtraction and γ live in P∨ and cannot always be lifted to the original lattice. No such lift is a target. Additional Zhu17 scope: Add only the extended-affine/length-zero opposition adapters and longest finite-parabolic double-coset indexing used by Zhu2.35. Ordinary Coxeter/Bruhat theory stays upstream. The generic Hecke algebra and twisted KL module belong to SmoothRepresentationsPartIIParahoricCenters. Test A1, non-simply-laced root/coroot conversion, ω*=ω⁻¹ and exclusion of arbitrary double-coset elements.

Imports: .

Suggested future module: `TauCeti/GroupTheory/Coxeter/TwistedDoubleCoset.lean`.

#### 14. Smooth representations of local groups, Part II: parahoric centers

Owner `SmoothRepresentationsPartIIParahoricCenters`; `part-ii` route; 3 items.

Reuse the existing candidate identifier and shared supplier; this is an additional source, not a second roadmap.

Extend the existing candidate SmoothRepresentationsPartIIParahoricCenters from PAPER-KISIN-PAPPAS-18, preserving its parahoric-center and Bernstein-function targets. Import Smooth representations of local groups (SmoothRepresentationsOfLocalGroups SR.1) for actual convolution algebras and ReductiveGroupsPartII RG2.4 for Iwahori–Weyl data; import RootSystemsPartIIDominanceAndDemazure for Demazure multiplication, RedMin and HY12 finite-Coxeter reduction. Add an early equal-parameter generic affine-Hecke algebra over Z[v,v^-1], its basis, Ω action and diagram automorphisms. Prove the twisted cocenter basis theorem, nonnegative class-polynomial recursion and positive product coefficients. A cocenter is a module quotient, not the center and not generally an algebra quotient. Prove He14 Proposition11.6 with full δ-support, μ≠0 and the corrected outside-parabolic descent, and derive a nonzero coefficient in a basic class for a t^γ with γ≠0 dominant and full δ-support, without a shrunken condition. HN14's based-ring/trace independence proof and twisted-component passage must be decomposed, not postulated. The ADLV roadmap owns dimension=degree and all geometry/characteristic transfer. Test rank-one quadratic normalization, all A2 products/associativity, diagram-twisted support and zero μ as a rejected input. Share the generic Iwahori presentation with the existing Bernstein-center lane through explicit specialization; do not make later Shimura trace formulas a prerequisite. Suggested future Lean modules: TauCeti/RepresentationTheory/Hecke/{GenericAffine,TwistedCocenter,ClassPolynomial}.lean. No Lean implementation is supplied here. Additional Zhu17 scope: Extend the already shared equal-parameter generic Hecke algebra by ordinary and Lusztig–Vogan twisted KL bases/modules. Prove Lusztig–Kato in the exact classical Satake normalization and the restricted identity P^(σ,⋄)_(x,y)(q)=P_(x,y)(−q) for the longest double-coset elements of Zhu2.35, using LY13 published7.3(2)/7.4 and independent equal-characteristic geometric Satake (GlobalShtukasAndFunctionFieldLanglands GS.1). Import RootSystemsPartIIDominanceAndDemazure for indexing. Never use mixed Satake to prove this numerical input. Distinguish the twisted module, cocenter and center; test A1 normalization and reject unrestricted polynomial identities.

Imports: .

Suggested future module: `TauCeti/RepresentationTheory/Hecke/TwistedKL.lean`.

#### 15. Hecke correspondences and local shtuka cohomology, Part II: cordial elements and affine Deligne–Lusztig dimensions

Owner `HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig`; `part-ii` route; 13 items.

Reuse the existing candidate identifier and shared supplier; this is an additional source, not a second roadmap.

Import Hecke correspondences and local shtuka cohomology (HeckeStacksAndLocalShtukas, HS0/HS2), geometric Satake over the Fargues–Fontaine curve (GeometricSatakeAndFusion GS0:loop-geometry/GS0:Witt-geometry), Bun_G and Newton strata (BunGAndNewtonStrata BG0/BG1), ReductiveGroupsPartII RG2.1–RG2.4, SchemeAndStackFoundations SF.0 and the proposed RootSystemsPartIIDominanceAndDemazure. Keep classical equal-characteristic ADLV schemes and mixed-characteristic perfect ADLV spaces separate from local shtuka diamonds; an actual comparison is needed where used. Construct X_w(b), η_σ, virtual dimension, reduction relations, generic Newton classes, cordiality, double-flat coweights and Levi alcoves. Cover split parts of Theorems2.1/3.1/3.2, Proposition3.3, MV cordial saturation with a known nonempty lower endpoint, and Theorem4.2: x t^λ is cordial with [b_xtλ]=[t^λ]. Prove the precise two-correspondence Theorem5.5, retaining every lattice, finite-type and perfection hypothesis. Final targets: for simple quasi-split G, shrunken w, λ_w^♦−ν_b strictly positive on every simple coroot and (λ_w^{♭♭})^♦≥ν_b, X_w(b) is nonempty exactly when κ(b)=κ(w) and supp_σ(η_σ(w))=S, and then dim=(ℓw+ℓη_σ(w)−def_G(b))/2−〈ν_b,ρ〉. Also prove Cor.6.4 with λ_w^♦≥ν_b+2ρ∨ and the separate shrunken hypothesis. Gate execution on G1–G3: auxiliary/adjoint lattice realization, bounded/perfect fiber-dimension comparison, and the /120–122 basic-seed proof and transport (the explicit A2 example shows it need not be shrunken). Preserve the tame/good-characteristic restrictions of cited inputs until broader transport is proved. Use the corrected (J,x,σ) in §6.2, all overbars in §4.3, and the GHN erratum. Add basic/minuscule/wall/σ-twisted/rank-one and nonbasic-Levi tests; never infer all classes below the maximal Newton point from saturation alone. Suggested future Lean home: TauCeti/AlgebraicGeometry/AffineDeligneLusztig/{Basic,Reduction,Cordial,Dimension}.lean. This checkpoint is a design brief, not a verified proof closure or a Lean implementation. Follow-up: for γ≠0 use He14 Proposition11.6 with J=S, Proposition11.7 and its class-polynomial nonemptiness criterion, not its shrunken Theorem11.4. For γ=0 use the finite reductive quotient and Lang. Import generic cocenters/class polynomials from SmoothRepresentationsPartIIParahoricCenters and finite-Coxeter reduction from RootSystemsPartIIDominanceAndDemazure. The corrected twisted induction, HN cocenter proof, general datum/characteristic transfer and finite-parahoric Lang comparison remain explicit gates. G2 is now a local finite-type argument /123–126, not an assumption that the full ADLV has finitely many components. State Theorem5.5 in the working adjoint/full-coweight carrier. Theorem6.1 for the original group needs a proved componentwise descent, not integral lifting of γ. Use /130–134 for the fibre-dimension and compatible-perfection inputs; the explicit cartesian squares are /125. Additional Zhu17 scope: Add Zhu’s unramified affine-Grassmannian dimension theorem for NONEMPTY X_≤μ(b): dim=⟨ρ,μ−ν_b⟩−def_G(b)/2. Import BunGAndNewtonStrata BG0/BG1 and GeometricSatakeAndFusion GS0/GS2 for perfect geometry and convolution semismallness. Split basic-Levi, superbasic, adjoint and Res GL_n reductions; construct ordered Frobenius norms and iterated ADLVs. Apply fibre estimates on exact endpoint strata and justify top-stratum nonemptiness/full dimension separately. Read GHKR, Hamacher, CKV and Viehmann original proof inputs. Tests include torus Kottwitz mismatch, d=1 norm, noncommuting d=2 norm and defect rank conventions.

Imports: .

Suggested future module: `TauCeti/AlgebraicGeometry/AffineDeligneLusztig/Dimension.lean`.

#### 16. Finite flat groups and integral p-adic Hodge theory, Part II: tensors and adapted deformations

Owner `FiniteFlatGroupsWithTensorsPartII`; `part-ii` route; 2 items.

Reuse the existing candidate identifier and shared supplier; this is an additional source, not a second roadmap.

Reuse the KPZ26/KP18 tensor-display candidate. Import finite flat groups and integral p-adic Hodge theory (FiniteFlatGroupsAndIntegralPadicHodgeTheory), p-adic Hodge theory (PadicHodgeTheory), crystalline cohomology (CrystallineCohomology), SF.1 descent and RG2 integral reductive groups. Add the hyperspecial height-one Breuil–Kisin specialization as an explicit interface, not a duplicate classification. Build the integral tensor frame, adapted-lift predicate, formally smooth R_G and relative period comparison before Kisin1.1.13/1.1.19. End with Kisin1.2.18–1.2.19 lattice specialization, κ preservation and quotient compatibility, and1.4.6 integral connection along frame families. Apply E.1–E.4 to Kisin2010: Frobenius conjugation stability of Lie(H), delete1.5.3, use Lie(G), and identify the horizontal Fil0 locus with the adapted completion. Retain the linear dual/Cartier dual Tate twist and inverse filtration. Break relative comparison, connection convergence and adapted factorization into declaration-sized proofs. Test Gm lattice p, zero modules and wrong E² height. Do not use the false integral representative g0∈G(OL) in the printed proof. Additional Zhu17 scope: Add Gabber’s perfect-ring contravariant Dieudonné equivalence in the precise scope needed by Zhu3.11, including finite projectivity, integral F,V, minuscule quotient and functorial quasi-isogenies. An adapted Hodge frame must be constructed; double-coset membership alone is insufficient. Preserve p>2 for the Hodge RZ application and use the dual/filtration convention already required by this candidate. Tests include étale/multiplicative height-one groups and the GL2 swapped-filtration diagnostic.

Imports: FiniteFlatGroupsAndIntegralPadicHodgeTheory, PadicHodgeTheory, CrystallineCohomology, SchemeAndStackFoundations:SF.1, ReductiveGroupsPartII.

Suggested future module: `TauCeti/AlgebraicGeometry/Dieudonne/PerfectTensor.lean`.

#### 17. Hecke stacks and local shtukas, Part II: integral parahoric models and crystalline diagrams

Owner `HeckeStacksAndLocalShtukasIntegralPartII`; `part-ii` route; 10 items.

Reuse the existing candidate identifier and shared supplier; this is an additional source, not a second roadmap.

Reuse the KPZ26 integral continuation after Hecke stacks and local shtukas (HeckeStacksAndLocalShtukas). Import Scheme, stack, cohomology and intersection foundations (SchemeAndStackFoundations SF.0/SF.1), Witt flag geometry (GeometricSatakeAndFusion GS0:Witt-geometry), local reductive groups (ReductiveGroupsPartII), and isocrystals (BunGAndNewtonStrata BG0/BG1). Construct perfect local Hecke and shtuka stacks, their height bounds, reductive and higher restricted quotients, and the actual Iwahori truncation correspondence. Prove van Hoften2.3.4 Cartesian as a two-fiber square via equal-band gerbes,2.3.9 weak smoothness with the extra kernel gerbe, and2.4.6 Newton quotient [underline J_b(Qp)\X] on the pro-etale site. Keep the locally profinite topology; do not replace it by a discrete constant group. Prove the canonical special-fiber comparison with PR/DvHKZ, then compare Hoff and SYZ normalizations using explicit Frobenius and frame-change formulas. The crystalline global local-model diagram is a consumer of the tensor-display and tangent compatibility theorem, never its proof. Tests cover nontrivial stabilizers, zero-rank torus, cofinal truncations, the omitted kernel gerbe, and noncommutative sigma-conjugacy transport. Additional Zhu17 scope: Add the unramified Hodge-type RZ representability and canonical perfected-special-fibre ADLV comparison of Zhu3.10–3.12, importing the finite-flat tensor supplier and the shared ADLV dimension owner. For p>2 and nonempty moduli, deduce the dimension formula without a ramified extension. Add the OE-linear chain moduli M_(N,h) over F̄_p with all four conditions, projective bundle tower for0≤i<h, canonical resolution-model comparison using D(X0)_τ0, and exact Hodge determinant exponents −p^i. Fill omitted proofs of B.7–B.9; the canonical weakly normal orbit model and arbitrary projective deperfection are different contracts.

Imports: HeckeStacksAndLocalShtukas, SchemeAndStackFoundations, GeometricSatakeAndFusion, ReductiveGroupsPartII, BunGAndNewtonStrata, FiniteFlatGroupsWithTensorsPartII, GeometricSatakeLocalModelsPartII.

Suggested future module: `TauCeti/AlgebraicGeometry/RapoportZink/PerfectComparison.lean`.

#### 18. Geometric Satake and fusion, Part II: the rational Gelfand symmetry proof

Owner `GeometricSatakeAndFusionPartIIRationalGelfandProof`; `part-ii` route; 18 items.

GS3:fusion explicitly retains the FS fusion proof. Zhu’s finite-level opposite-quotient, equivariant-bimodule and twisted-KL proof is a distinct substantial argument, while the category, convolution, weight and reconstruction outputs remain shared with GS2/GS4.

Extend Geometric Satake and fusion (GeometricSatakeAndFusion) with Zhu17’s rational one-leg alternative proof, not a second category or dual-group owner. Import common Witt geometry GS0, the early rational perverse/convolution interface GS1/GS2, and Étale duality, cycle classes and perverse sheaves (EtaleDualityAndPerverseSheaves EDC.0/5/7). Construct the two R_G actions on equivariant cohomology, prove the tensor-over-R_G comparison and equality of the actions using minimal generators, and obtain monoidal H* by augmentation. Construct the opposite category and finite-level IC equivalence without assuming its projection perfectly smooth. Construct pinned opposition, open-normalized IC maps and the chosen square-root phase. Import the restricted Lusztig–Yun identity from SmoothRepresentationsPartIIParahoricCenters, proved using GlobalShtukasAndFunctionFieldLanglands GS.1 equal-characteristic Satake; import indexing from RootSystemsPartIIDominanceAndDemazure. Prove the mixed IC dimension/trace realization, involution stalk signs, costalk-duality shifts and orbit-filtration argument giving Θ=(-1)^j on IH^(2j). Correct the unshifted IC and additive Koszul conventions, prove that c induces the ordinary flip under H*, and reflect symmetry/hexagon by faithfulness. Export this independent symmetry to the existing GS4 rational equivalence. GS3:fusion, GS4 reconstruction and the mixed equivalence are not prerequisites of this proof. The coarse roadmap cycle must be resolved by these explicit early/late contracts. Test the unit, two odd components, a torus, a rank-one quasi-minuscule resolution, an involution with maximal trace, and a nontrivial boundary stalk. Keep Q̄_ℓ, ℓ≠p, component parity, half-Tate choices and square-root independence explicit. No integral, ramified extension or multi-leg coherence theorem is inferred.

Imports: GeometricSatakeAndFusion:GS0:Witt-geometry and the early rational GS1/GS2 interfaces only, EtaleDualityAndPerverseSheaves:EDC.5/EDC.7, GlobalShtukasAndFunctionFieldLanglands:GS.1 independent equal-characteristic proof, SmoothRepresentationsPartIIParahoricCenters: shared twisted KL candidate, RootSystemsPartIIDominanceAndDemazure: indexing adapters.

Suggested future module: `TauCeti/RepresentationTheory/Satake/Witt/GelfandSymmetry.lean`.

### Item inventory

Each statement below has its prerequisites, API and tests in the companion JSON. The inventory retains the source’s actual version and the corrected conventions above. Missing and planned entries are specifications, not implementation claims.

#### L01 — Witt-vector coefficient carrier

**definition; library**. Source: §0.5, §§1–2 and Appendices A–B: imported algebraic or categorical carrier.

The pinned p-typical Witt-vector carrier is defined for a commutative coefficient ring. Perfect characteristic-p hypotheses are imposed separately for p-torsionfreeness and the geometry used here.

Pinned imports: `mathlib:WittVector`.

API: Reuse WittVector.mk on a coefficient sequence. Equality follows from equality of every coefficient. The map to L preserves the existing ring operations.

Acceptance cases: Equal coefficient sequences give equal vectors. Over F_p the fraction field specializes to Q_p after the standard comparison. Witt addition in positive coordinates is not coordinatewise addition in general.

#### L06 — Connected reductive group predicate

**definition; library**. Source: §0.5, §§1–2 and Appendices A–B: imported algebraic or categorical carrier.

Reuse the finite-type commutative Hopf-algebra property expressing smoothness, geometric connectedness and trivial geometric connected normal smooth unipotent subgroups.

Pinned imports: `tauceti:TauCeti.reductiveCommHopfAlgProperty`, `tauceti:TauCeti.reductiveCommHopfAlgProperty_iff`.

API: Reuse the geometric normal-unipotent-subgroup characterization. Transport the predicate through permitted field extensions. Transport reductivity under Hopf-algebra isomorphisms.

Acceptance cases: G_m is reductive. GL_n is reductive in characteristic zero. The additive group is not reductive.

#### L07 — Algebraic torus predicate

**definition; library**. Source: §0.5, §§1–2 and Appendices A–B: imported algebraic or categorical carrier.

A finite-type affine group over a field is a torus when its coordinate Hopf algebra becomes that of a finite-rank split torus after extension to an algebraic closure.

Pinned imports: `tauceti:TauCeti.torusCommHopfAlgProperty`, `tauceti:TauCeti.torusCommHopfAlgProperty_iff`.

API: A geometric split-torus isomorphism proves the predicate. The geometric fiber has the specified finite rank. Transport the torus predicate along an isomorphism.

Acceptance cases: G_m is rank one. A norm-one quadratic torus need not be split. G_a is not a torus.

#### L08 — Geometric character lattice

**definition; library**. Source: §0.5, §§1–2 and Appendices A–B: imported algebraic or categorical carrier.

Use the additive group of group-like elements of the geometrically extended coordinate Hopf algebra, with its absolute Galois action. For a torus this is X*(T).

Pinned imports: `tauceti:TauCeti.CommHopfAlgCat.additiveCharacterGroup`, `tauceti:TauCeti.CommHopfAlgCat.geometricCharacterGroup`.

API: Expose the action inherited from geometric scalar extension. Identify a character with a group-scheme map to G_m. Addition of characters corresponds to multiplication of their values.

Acceptance cases: X*(G_m) is Z. Conjugation acts by minus one on a real norm-one torus. The trivial torus has zero character group.

#### L09 — Cocharacter lattice and pairing

**definition; library**. Source: §0.5, §§1–2 and Appendices A–B: imported algebraic or categorical carrier.

For a torus use geometric group-scheme morphisms G_m to T, their integral-dual comparison to X*(T), and the evaluation pairing. Its Galois action is contragredient.

Pinned imports: `tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.cocharacterLattice`, `tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.cocharacterLatticeLinearEquivDual`, `tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.characterCocharacterPairing`.

API: Use the integral-dual linear equivalence. Evaluate a character on a cocharacter as an integer exponent. The dual action evaluates against the inverse Galois action on characters.

Acceptance cases: For G_m, exponents a and b pair to ab. The zero cocharacter pairs to zero. Simultaneous sign reversal on a norm-one torus preserves the pairing.

#### L10 — Perfect character-cocharacter pairing

**theorem; library**. Source: §0.5, §§1–2 and Appendices A–B: imported algebraic or categorical carrier.

For a torus over a field, its integral character-cocharacter pairing is perfect.

Pinned imports: `tauceti:TauCeti.TorusCommHopfAlgCat.instCharacterCocharacterPairingIsPerfPair`.

Reuse the cited pinned declaration in its stated scope. Any application adapter beyond that statement must be proved separately and is not baseline evidence.

#### L16 — Finite free cocharacter lattice

**theorem; library**. Source: §0.5, §§1–2 and Appendices A–B: imported algebraic or categorical carrier.

For a torus over a field its integral cocharacter module is finite free.

Pinned imports: `tauceti:TauCeti.TorusCommHopfAlgCat.cocharacterLattice_module_free`, `tauceti:TauCeti.TorusCommHopfAlgCat.cocharacterLattice_module_finite`.

Reuse the cited pinned declaration in its stated scope. Any application adapter beyond that statement must be proved separately and is not baseline evidence.

#### L17 — Galois invariance of the pairing

**theorem; library**. Source: §0.5, §§1–2 and Appendices A–B: imported algebraic or categorical carrier.

For a multiplicative-type group, simultaneously applying a Galois automorphism to character and cocharacter leaves their integral pairing unchanged.

Pinned imports: `tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.characterCocharacterPairing_galois_invariant`.

Reuse the cited pinned declaration in its stated scope. Any application adapter beyond that statement must be proved separately and is not baseline evidence.

#### L23 — Perfect coefficient-ring predicate

**construction; library**. Source: §0.5, §§1–2 and Appendices A–B: imported algebraic or categorical carrier.

For a commutative ring R of characteristic p, PerfectRing R p asserts that x↦x^p is bijective. The pinned predicate is more general and needs only a power operation; its characteristic-p ring use is the present specialization.

Pinned imports: `mathlib:PerfectRing`.

API: Supply injectivity and surjectivity of the p-power map. Every element has a unique pth root. Ring maps between perfect characteristic-p rings commute with inverse Frobenius.

Acceptance cases: A finite field is perfect. The zero ring has a bijective power map. Fp[t] is not perfect since t has no polynomial pth root.

#### L30 — Truncated Witt-vector carrier

**construction; library**. Source: §0.5, §§1–2 and Appendices A–B: imported algebraic or categorical carrier.

For prime p use W_n(R)=TruncatedWittVector p n R, with its established Witt operations; the underlying type is Fin n→R.

Pinned imports: `mathlib:TruncatedWittVector`.

API: Construct from n coefficients. Equality is coefficientwise. Truncate full Witt vectors and compose finite truncations.

Acceptance cases: W_1(F_p)=F_p. W_0(R) has one element. Coordinatewise multiplication is not the Witt product in general.

#### L31 — Direct-limit perfect closure

**construction; library**. Source: §0.5, §§1–2 and Appendices A–B: imported algebraic or categorical carrier.

For a commutative characteristic-p ring, p prime, PerfectClosure R p is the quotient of pairs (n,x) by (n,x)~(n+1,x^p). This is the affine coordinate-ring construction used for scheme perfection.

Pinned imports: `mathlib:PerfectClosure`.

API: Construct the class of (n,x). The successor Frobenius relation identifies (n+1,x^p) with (n,x). Use its existing perfect-closure maps when forming affine geometric adapters.

Acceptance cases: The class of x^(1/p) has pth power x. PerfectClosure F_p p is F_p. Mathlib Perfection R p is an inverse limit of rings and cannot replace this direct limit for arbitrary R.

#### L32 — Ordinary categorical core

**construction; library**. Source: §0.5, §§1–2 and Appendices A–B: imported algebraic or categorical carrier.

Core C retains objects and only isomorphisms, with composition and inverse inherited from C.

Pinned imports: `mathlib:CategoryTheory.Core`.

API: Construct Core objects and morphisms from isomorphisms. CoreHom is the isomorphism type in C. Include Core C faithfully into C and transport functors.

Acceptance cases: Core of a discrete category remains discrete. Core of the terminal category is terminal. The zero map of a nonzero module is excluded.

#### L35 — Symmetric monoidal category predicate

**construction; library**. Source: §0.5, §§1–2 and Appendices A–B: imported algebraic or categorical carrier.

A symmetric category is a braided monoidal category whose double braiding is the identity.

Pinned imports: `mathlib:CategoryTheory.SymmetricCategory`.

API: Supply a monoidal category and symmetric braiding. Double braiding is identity for every pair of objects. A symmetric monoidal functor must preserve this braiding.

Acceptance cases: Swapping two one-dimensional summands twice is identity. The tensor unit has its standard symmetry. Self-braiding need not be identity; BS Definition12.1 imposes an additional condition.

#### L36 — Ordinary unbounded derived category

**construction; library**. Source: §0.5, §§1–2 and Appendices A–B: imported algebraic or categorical carrier.

For an abelian category C with a chosen localization, DerivedCategory C is the category of integer cochain complexes localized at quasi-isomorphisms.

Pinned imports: `mathlib:DerivedCategory`.

API: Choose HasDerivedCategory.standard in the required universe. Q sends quasi-isomorphisms to isomorphisms. Compare enhanced derived functors to this ordinary localization.

Acceptance cases: An acyclic complex maps to zero. The zero abelian category has a zero derived category. Its ordinary categorical nerve does not supply the stable enhancement.

#### L37 — Tor bifunctor

**construction; library**. Source: §0.5, §§1–2 and Appendices A–B: imported algebraic or categorical carrier.

In an abelian monoidal preadditive category with projective resolutions, Tor C n left-derives tensoring in the second factor; higher Tor vanishes for projective second argument.

Pinned imports: `mathlib:CategoryTheory.Tor`, `mathlib:CategoryTheory.isZero_Tor_succ_of_projective`.

API: Apply the left-derived tensor functor in degree n. For projective Y, Tor_(n+1)(X,Y)=0. Use its bifunctorial maps on both arguments.

Acceptance cases: Tor_1(R,R)=0. Tensor with the zero object gives zero. The existing Tor functor alone does not prove Tor vanishing for perfect-ring diagrams.

#### L38 — Invertible module predicate

**construction; library**. Source: §0.5, §§1–2 and Appendices A–B: imported algebraic or categorical carrier.

Module.Invertible R M asserts that evaluation M dual tensor M→R is bijective.

Pinned imports: `mathlib:Module.Invertible`.

API: Provide bijective evaluation. Identify the evaluation map with a linear equivalence. Transport through module isomorphisms and tensor products.

Acceptance cases: R is invertible over itself. A nonzero rank-two free module over a field is not invertible. Invertibility is not the same as an arbitrary finite projective module.

#### L39 — Invertible sheaf category

**construction; library**. Source: §0.5, §§1–2 and Appendices A–B: imported algebraic or categorical carrier.

Use Tau Ceti’s full category InvertibleSheaf X of invertible O_X-modules. Its morphisms include noninvertible maps; Pic(X) takes its core.

Pinned imports: `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`.

API: Form an invertible sheaf from the existing local rank-one condition. Its underlying object is an O_X-module. Use the existing trivial sheaf and sheaf morphisms before passing to the core.

Acceptance cases: O_X is an invertible sheaf. On the empty scheme the local condition is vacuous. This full category is not a groupoid: zero endomorphisms remain.

#### L40 — Finite projective splitting

**theorem; library**. Source: §0.5, §§1–2 and Appendices A–B: imported algebraic or categorical carrier.

For a finite projective module over a semiring there are maps R^n→M→R^n with surjective first map, injective second map and composite id_M.

Pinned imports: `mathlib:Module.Finite.exists_comp_eq_id_of_projective`.

Use the pinned finite-generator surjection and projective lifting property.

#### L41 — Exact category of finite projective modules

**construction; library**. Source: §0.5, §§1–2 and Appendices A–B: imported algebraic or categorical carrier.

Tau Ceti equips the full finite-projective module category with the exact structure induced from modules; it equals the split exact structure.

Pinned imports: `tauceti:TauCeti.finiteProjectiveModulesExactStructure`, `tauceti:TauCeti.finiteProjectiveModulesExactStructure_eq_split`.

API: Use finiteProjectiveModulesExactStructure. Its conflations are precisely ambient short exact sequences. Compare it to the split structure before group completion.

Acceptance cases: A split sequence P→P⊕Q→Q is a conflation. The zero projective is allowed. Nonsplit exact structures on other categories cannot be discarded.

#### L42 — Scheme carrier

**construction; library**. Source: §0.5, §§1–2 and Appendices A–B: imported algebraic or categorical carrier.

A scheme is a locally ringed space locally isomorphic to Spec of a commutative ring; morphisms are locally ringed-space morphisms.

Pinned imports: `mathlib:AlgebraicGeometry.Scheme`.

API: Reuse Scheme and Scheme.Hom. Affine neighborhoods identify the structure sheaf. Use existing fibre products and morphism properties.

Acceptance cases: Spec F_p is a scheme. The empty scheme is allowed. A sheaf-valued lattice functor is not a scheme without representability.

#### L43 — Fppf topology on schemes

**construction; library**. Source: §0.5, §§1–2 and Appendices A–B: imported algebraic or categorical carrier.

Use the Grothendieck topology generated by jointly surjective flat locally finitely presented families.

Pinned imports: `mathlib:AlgebraicGeometry.Scheme.fppfTopology`.

API: Form covering families through fppfPrecoverage. Each arrow is flat and locally of finite presentation. Base change and compose coverings using the existing instances.

Acceptance cases: A surjective finite etale map gives a cover. An identity is a cover. A proper nonflat cover need not be fppf.

#### L44 — Idempotent-completion carrier

**definition; library**. Source: Lemma2.16; categorical input.

For a category C, Karoubi C consists of pairs (X,e) with e:X→X and e²=e.

Pinned imports: `mathlib:CategoryTheory.Idempotents.Karoubi`.

API: Package an object and idempotent in the pinned Karoubi carrier. Morphisms satisfy the two idempotent compatibility conditions. Extend a functor to the envelopes and retain identity/composition.

Acceptance cases: Projection onto the first factor of V⊕W gives the V summand. The identity idempotent recovers X. A nonidempotent endomorphism is not a Karoubi object.

#### L45 — Abstract t-structure carrier

**definition; library**. Source: AppendixA.3.1.

For a pretriangulated category with additive integer shifts, a t-structure supplies degree bounds, orthogonality and truncation triangles.

Pinned imports: `mathlib:CategoryTheory.Triangulated.TStructure`.

API: Use the pinned degree-bound predicates and truncation-triangle fields. Read shifted bounds with n+a=n_old rather than reversing cohomological shifts. Transport along a triangulated equivalence.

Acceptance cases: The usual derived-module truncations give a t-structure. The zero category satisfies the bounds uniquely. A dimension predicate without truncation existence is not a t-structure.

#### L46 — Finite subcomodule containing a finite subspace

**theorem; library**. Source: LemmaA.28, local finiteness input.

Over a field k, for a coalgebra C and a C-comodule M, every finite-dimensional k-subspace P lies in a finite-dimensional subcomodule.

Pinned imports: `tauceti:TauCeti.Subcomodule.exists_finite_subcomodule_of_fg`.

Apply the pinned finite-subcomodule theorem; every k-vector space is free. Translate a left coaction to the pinned right-coaction convention by symmetry.

#### L47 — Tannaka comparison for a known Hopf algebra

**theorem; library**. Source: §2.5, narrower existing reconstruction input.

For a field k and commutative Hopf k-algebra H, its group-valued functor of points is naturally isomorphic, with the specified universe lift, to the tensor-automorphism functor of the finite-comodule scalar-extension fibre functor.

Pinned imports: `tauceti:TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`.

Use the pinned natural isomorphism. It begins with H and does not construct a Hopf algebra from an arbitrary neutral Tannakian category.

#### A01 — Fpqc space

**definition; missing**. Source: A.1.1, (A.1.1).

Over a field k, a k-space is a set-valued fpqc sheaf on affine k-schemes: finite disjoint unions map to products and faithfully flat ring maps give the usual equalizer.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `L42`, `L43`.

API: Form the fpqc sheaf on affine tests. Express descent as F(R)=Eq(F(R′)⇉F(R′⊗R R′)). Extend uniquely to schemes by affine descent.

Acceptance cases: An affine scheme has its usual functor of points. The empty affine scheme maps to a singleton. A presheaf failing faithful-flat descent is not a k-space.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A02 — Algebraic space and representable morphism

**definition; missing**. Source: A.1.1–A.1.2.

An algebraic space is an étale sheaf with schematic diagonal and an étale surjective scheme atlas. Quasi-separatedness is not imposed here. A map of spaces is representable if its affine-test pullbacks are algebraic spaces.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `A01`.

API: Construct the sheaf from an étale equivalence relation and atlas. Test representability after affine base change. Prove representability and diagonal properties survive base change.

Acceptance cases: Every scheme is an algebraic space. A point has identity atlas. A stack with nontrivial inertia is not a set-valued algebraic space.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A03 — Algebraic spaces are fpqc sheaves

**theorem; missing**. Source: A.1.1, Gabber, Stacks03W8.

Every algebraic space over k is an fpqc sheaf.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `A02`.

Import Gabber descent, with the paper’s non-quasi-separated convention checked in the original source.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A04 — Fpqc effective epimorphisms

**theorem; missing**. Source: A.1.2, (A.1.2).

For an fpqc representable U→X and a k-space F, Hom(X,F) is the equalizer of Hom(U,F)⇉Hom(U×_XU,F).

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `A01`, `A02`.

Use the proof at this locator, retaining the displayed hypotheses. The original-source and declaration-sized closure obligations remain explicit in the gap register.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A05 — Perfect algebraic space

**definition; planned**. Source: A.1.2.

Over a perfect field k of characteristic p>0, a perfect algebraic space has invertible absolute Frobenius. Relative Frobenius and the Frobenius-twisted k-structure are used for k-linear maps.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Planned stages: `SchemeAndStackFoundations:SF.0`.

Prerequisites: `L23`, `A02`.

API: Package the algebraic space with invertible Frobenius. Identify affine examples with perfect coefficient rings. Base change through the Frobenius twist, keeping the k-structure explicit.

Acceptance cases: Spec(k[t^(1/p^∞)]) is perfect. A perfect field gives a perfect point. A nonreduced dual-number scheme is not perfect.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A06 — Étale relative Frobenius

**theorem; planned**. Source: LemmaA.2.

If X→Y is étale between characteristic-p algebraic spaces, X→X×_(Y,Frob)Y is an isomorphism.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Planned stages: `SchemeAndStackFoundations:SF.0`.

Prerequisites: `A02`.

Prove on schemes by radicial étale surjectivity, then descend through an étale atlas.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A07 — Perfection functor

**construction; planned**. Source: CorollaryA.3, (A.1.3).

Perfection X^perf is the inverse Frobenius limit, interpreted with k-twists. It is right adjoint to inclusion of perfect algebraic spaces; on affine rings it is the direct-limit perfect closure.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Planned stages: `SchemeAndStackFoundations:SF.0`.

Prerequisites: `A05`, `A06`, `L31`.

API: Construct the inverse-limit algebraic space and its projection ε. Prove Hom(Y,X^perf)=Hom(Y,X) for perfect Y. Construct functoriality and the canonical idempotence isomorphism.

Acceptance cases: Perfection of Spec(k[t]) is Spec(k[t^(1/p^∞)]). A perfect X has ε an isomorphism. Perfection erases nilpotents, so ε need not be an isomorphism.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A08 — Perfection universal homeomorphism

**theorem; planned**. Source: RemarkA.4.

The projection X^perf→X is a universal homeomorphism.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Planned stages: `SchemeAndStackFoundations:SF.0`.

Prerequisites: `A07`.

Use the proof at this locator, retaining the displayed hypotheses. The original-source and declaration-sized closure obligations remain explicit in the gap register.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A09 — Étale site invariance

**theorem; planned**. Source: PropositionA.5.

Perfection induces an equivalence of small étale sites and topoi, U↦U^perf≅U×_X X^perf.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Planned stages: `SchemeAndStackFoundations:SF.0`.

Prerequisites: `A06`, `A08`.

Apply topological invariance on schemes, then descent for algebraic-space étale objects.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A100 — Perfection detects quasi-compactness

**theorem; planned**. Source: LemmaA.7(1)–(7).

For a morphism f of characteristic-p algebraic spaces, f has quasi-compactness if and only if f^perf has it.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Planned stages: `SchemeAndStackFoundations:SF.0`.

Prerequisites: `A07`, `A08`.

Use universal-homeomorphism topology, then the separate diagonal, affine-limit and integral-polynomial arguments as applicable.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A101 — Perfection detects quasi-separatedness

**theorem; planned**. Source: LemmaA.7(1)–(7).

For a morphism f of characteristic-p algebraic spaces, f has quasi-separatedness if and only if f^perf has it.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Planned stages: `SchemeAndStackFoundations:SF.0`.

Prerequisites: `A07`, `A08`.

Use universal-homeomorphism topology, then the separate diagonal, affine-limit and integral-polynomial arguments as applicable.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A102 — Perfection detects being a homeomorphism

**theorem; planned**. Source: LemmaA.7(1)–(7).

For a morphism f of characteristic-p algebraic spaces, f has being a homeomorphism if and only if f^perf has it.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Planned stages: `SchemeAndStackFoundations:SF.0`.

Prerequisites: `A07`, `A08`.

Use universal-homeomorphism topology, then the separate diagonal, affine-limit and integral-polynomial arguments as applicable.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A103 — Perfection detects being a universal homeomorphism

**theorem; planned**. Source: LemmaA.7(1)–(7).

For a morphism f of characteristic-p algebraic spaces, f has being a universal homeomorphism if and only if f^perf has it.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Planned stages: `SchemeAndStackFoundations:SF.0`.

Prerequisites: `A07`, `A08`.

Use universal-homeomorphism topology, then the separate diagonal, affine-limit and integral-polynomial arguments as applicable.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A104 — Perfection detects being closed

**theorem; planned**. Source: LemmaA.7(1)–(7).

For a morphism f of characteristic-p algebraic spaces, f has being closed if and only if f^perf has it.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Planned stages: `SchemeAndStackFoundations:SF.0`.

Prerequisites: `A07`, `A08`.

Use universal-homeomorphism topology, then the separate diagonal, affine-limit and integral-polynomial arguments as applicable.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A105 — Perfection detects being universally closed

**theorem; planned**. Source: LemmaA.7(1)–(7).

For a morphism f of characteristic-p algebraic spaces, f has being universally closed if and only if f^perf has it.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Planned stages: `SchemeAndStackFoundations:SF.0`.

Prerequisites: `A07`, `A08`.

Use universal-homeomorphism topology, then the separate diagonal, affine-limit and integral-polynomial arguments as applicable.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A106 — Perfection detects separatedness

**theorem; planned**. Source: LemmaA.7(1)–(7).

For a morphism f of characteristic-p algebraic spaces, f has separatedness if and only if f^perf has it.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Planned stages: `SchemeAndStackFoundations:SF.0`.

Prerequisites: `A07`, `A08`.

Use universal-homeomorphism topology, then the separate diagonal, affine-limit and integral-polynomial arguments as applicable.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A107 — Perfection detects affineness

**theorem; planned**. Source: LemmaA.7(1)–(7).

For a morphism f of characteristic-p algebraic spaces, f has affineness if and only if f^perf has it.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Planned stages: `SchemeAndStackFoundations:SF.0`.

Prerequisites: `A07`, `A08`.

Use universal-homeomorphism topology, then the separate diagonal, affine-limit and integral-polynomial arguments as applicable.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A108 — Perfection detects integrality

**theorem; planned**. Source: LemmaA.7(1)–(7).

For a morphism f of characteristic-p algebraic spaces, f has integrality if and only if f^perf has it.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Planned stages: `SchemeAndStackFoundations:SF.0`.

Prerequisites: `A07`, `A08`.

Use universal-homeomorphism topology, then the separate diagonal, affine-limit and integral-polynomial arguments as applicable.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A110 — Perfection preserves étaleness

**theorem; planned**. Source: LemmaA.7(8)–(10).

If f has étaleness, its perfection has étaleness. Reflection of this property is not asserted.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Planned stages: `SchemeAndStackFoundations:SF.0`.

Prerequisites: `A06`, `A07`.

For flatness reduce to a perfect base, express Frobenius transitions through the base automorphism, and use filtered-colimit flatness.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A111 — Perfection preserves flatness

**theorem; planned**. Source: LemmaA.7(8)–(10).

If f has flatness, its perfection has flatness. Reflection of this property is not asserted.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Planned stages: `SchemeAndStackFoundations:SF.0`.

Prerequisites: `A06`, `A07`.

For flatness reduce to a perfect base, express Frobenius transitions through the base automorphism, and use filtered-colimit flatness.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A112 — Perfection preserves faithful flatness

**theorem; planned**. Source: LemmaA.7(8)–(10).

If f has faithful flatness, its perfection has faithful flatness. Reflection of this property is not asserted.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Planned stages: `SchemeAndStackFoundations:SF.0`.

Prerequisites: `A06`, `A07`.

For flatness reduce to a perfect base, express Frobenius transitions through the base automorphism, and use filtered-colimit flatness.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A113 — Perfection preserves being fpqc

**theorem; planned**. Source: LemmaA.7(8)–(10).

If f has being fpqc, its perfection has being fpqc. Reflection of this property is not asserted.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Planned stages: `SchemeAndStackFoundations:SF.0`.

Prerequisites: `A06`, `A07`.

For flatness reduce to a perfect base, express Frobenius transitions through the base automorphism, and use filtered-colimit flatness.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A12 — Perfection and affine inverse limits

**theorem; planned**. Source: A.1.2, (A.1.4).

For a projective system of algebraic spaces with affine transition maps, its inverse limit exists as an algebraic space and perfection commutes with that limit.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Planned stages: `SchemeAndStackFoundations:SF.0`.

Prerequisites: `A07`.

Use the proof at this locator, retaining the displayed hypotheses. The original-source and declaration-sized closure obligations remain explicit in the gap register.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A13 — Affine-group torsor and contracted product

**definition; missing**. Source: A.1.3, (A.1.5).

For an affine group H, an H-torsor E→X is fpqc and satisfies E×H≅E×_X E. For an H-space T define E×^H T as the fpqc quotient of E×T by the diagonal action.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `A01`, `A02`.

API: Construct the torsor and diagonal contracted product. Identify its pullback under a trivialization with U×T. Transport through base change and change of structure group.

Acceptance cases: The trivial torsor gives X×T. Contracting a torsor with H gives back E. A merely surjective orbit map without the torsor identity is insufficient.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A14 — Perfect torsor total space

**theorem; missing**. Source: LemmaA.8.

If H is perfect affine and X perfect algebraic, every fpqc H-torsor over X is a perfect algebraic space, affine over X.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `A07`, `A13`, `A112`.

Use the proof at this locator, retaining the displayed hypotheses. The original-source and declaration-sized closure obligations remain explicit in the gap register.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A15 — Smooth-group torsor perfection equivalence

**theorem; missing**. Source: LemmaA.9.

For a smooth affine k-group H′ and H=(H′)^perf, H′-torsors and H-torsors on a perfect algebraic space X are equivalent by perfection and pushout along H→H′.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `A06`, `A13`, `A14`.

Trivialize H′-torsors étale locally and factor their cocycles through H.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A16 — Algebraicity of contracted products

**theorem; missing**. Source: A.1.3 after(A.1.5).

If H is affine finite type, X and T algebraic spaces and E an H-torsor, E×^H T is algebraic. The analogous assertion holds in the perfect category for affine pfp H.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `A13`, `A27`.

Use fppf descent in the finite-type case and perfected smooth models for the perfect case.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A17 — Perfect-site space and ind-perfect algebraic space

**definition; missing**. Source: DefinitionA.10 andA.1.4.

A perfect k-space is an fpqc sheaf on perfect affine k-schemes. An ind-perfect algebraic space is such a sheaf presented by a filtered union of perfect algebraic spaces with closed transition maps.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `A01`, `A05`.

API: Restrict fpqc sheaves to perfect tests and form the stated closed filtered presentation. Compare affine-test values with a represented perfect space. Construct maps compatible with the filtered closed presentations.

Acceptance cases: A constant one-stage perfect scheme is ind-perfect. The discrete coweight union of points is ind-perfect. An arbitrary presheaf or arbitrary transition system is not covered by this definition.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A18 — Perfecting flat groupoid quotients

**theorem; missing**. Source: LemmaA.11.

For a flat groupoid V⇉U of algebraic spaces, the quotient stack of its perfection and [U/V] have equivalent groupoids of R-points for every perfect k-algebra R.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `A112`, `A17`.

Perfect a faithfully flat lift and its cocycle; prove both object and morphism descent.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A19 — Perfect-test full faithfulness

**theorem; missing**. Source: LemmaA.12.

The functor from perfect algebraic spaces to perfect fpqc spaces is fully faithful.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `A04`, `A06`, `A17`.

Compute morphisms from perfect affine étale atlases and their overlaps.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A20 — Perfect finite-presentation conditions

**definition; planned**. Source: DefinitionA.13.

Locally perfectly finite type means an étale affine atlas by perfections of finite-type k-affines. Perfectly finite type adds quasi-compactness; pfp adds quasi-separatedness. A model is a finite-presentation algebraic space X′ with X≅(X′)^perf.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Planned stages: `SchemeAndStackFoundations:SF.0`.

Prerequisites: `A07`, `A17`.

API: Build the local atlas and record qc and qs independently. Distinguish pfp from ordinary finite presentation. Transport models and pfp structures through étale localizations.

Acceptance cases: Perfect affine space is pfp. A finite set of perfect points is pfp. An infinite disjoint union of points is not quasi-compact and hence not pfp.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A21 — Weakly normal model with prescribed generic fields

**construction; planned**. Source: PropositionA.15, (A.2.1)–(A.2.2).

For pfp perfect X, choose finitely generated k-subfields K_i of each generic residue field whose perfections give that field. The corresponding weakly normal finite-presentation model is unique with these identifications.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Planned stages: `SchemeAndStackFoundations:SF.0`.

Prerequisites: `A20`.

API: Construct sections whose generic values lie in the prescribed K_i. Prove weak normality and the universal pushout property with the generic fields. Descend the construction along étale presentations.

Acceptance cases: For perfected affine line and K=k(t), recover affine line. For a perfect point with chosen finite-type field, recover that field spectrum. Changing K to k(t^p) changes the marked model map; forgetting generic identifications loses uniqueness.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A22 — Pfp perfect universal homeomorphism rigidity

**theorem; missing**. Source: CorollaryA.16.

A separated universal homeomorphism between pfp perfect algebraic spaces is an isomorphism.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `A21`.

Choose common generic fields and reduce to a finite birational universal homeomorphism of weakly normal models.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A23 — Morphisms descend to finite models

**theorem; planned**. Source: PropositionA.17.

Every morphism between pfp perfect algebraic spaces is the perfection of a morphism of finite-presentation models, after sufficiently many Frobenius twists of a model.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Planned stages: `SchemeAndStackFoundations:SF.0`.

Prerequisites: `A20`, `A21`.

Use the finite-presentation limit criterion; keep the twist in the k-structure.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A24 — Perfectly proper morphism

**definition; missing**. Source: DefinitionA.18.

A morphism of pfp perfect algebraic spaces is perfectly proper if separated and universally closed.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `A20`.

API: Package separatedness and universal closedness. Characterize it by properness of every finite-presentation model. Prove stability under composition and base change in the pfp category.

Acceptance cases: Perfect projective space is perfectly proper. The identity is perfectly proper. Perfect affine line over a point is not perfectly proper.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A25 — Proper models characterize perfect properness

**theorem; missing**. Source: LemmaA.19.

For f between pfp perfect spaces, f is perfectly proper if and only if any/every finite-presentation model f′ is proper.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `A23`, `A24`.

Use the proof at this locator, retaining the displayed hypotheses. The original-source and declaration-sized closure obligations remain explicit in the gap register.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A26 — Perfect valuation criterion

**theorem; missing**. Source: PropositionA.20.

A map between pfp perfect algebraic spaces is perfectly proper exactly when its existence-and-uniqueness valuative criterion holds for all perfect valuation rings over k.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `A24`, `A25`.

Perfect valuations dominate perfect local subrings of perfect fields; supply existence and uniqueness, not just existence.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A261 — Connected proper fibres and functions

**theorem; missing**. Source: LemmaA.21.

For a surjective perfectly proper f between pfp perfect algebraic spaces with geometrically connected fibres, O_Y→f_*O_X is an isomorphism. Here the connected-fibre convention includes nonemptiness.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `A22`, `A25`.

Use a finite-type Stein factor and perfect its finite universal homeomorphism.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A262 — Vector bundles descend to models

**theorem; missing**. Source: LemmaA.22.

A finite-rank vector bundle on a pfp perfect algebraic space descends to a finite-presentation model after a Frobenius twist.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `A09`, `A23`, `L40`.

Descend a finite étale trivializing atlas, finitely many GL_r cocycles and their finitely many cocycle equations.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A263 — Relative Grassmann representability

**theorem; missing**. Source: CorollaryA.23.

For a rank-n bundle E on pfp perfect X and 0≤i≤n, the functor of locally free rank-i quotients of E is represented by a perfect algebraic space perfectly proper over X.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `A262`, `A25`.

Perfect the ordinary relative Grassmann scheme of a descended bundle; do not identify its quotient convention with Mathlib subspace Grassmannians without dualization.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A264 — Picard group of perfect projective space

**theorem; missing**. Source: RemarkA.24.

For n≥1, Pic((P^n_k)^perf)=Z[1/p], with distinguished O(1) and (Frob^-1)^*O(1)=O(1/p). For n=0 the Picard group is zero.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `A262`.

Pass Pic(P^n)=Z through Frobenius pullback, multiplication by p; retain n≥1.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A265 — Perfect smoothness

**definition; missing**. Source: DefinitionA.25.

A map f:X→Y of pfp perfect algebraic spaces is perfectly smooth at x if étale charts factor it as an étale map to V×(A^n)^perf followed by projection.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `A20`, `A06`.

API: Construct the étale chart factorization at the specified point. Track the local relative dimension n. Prove stability under base change and composition.

Acceptance cases: Projection Y×A^n_perf→Y is perfectly smooth. An étale morphism has relative dimension zero. A perfect node over k is not perfectly smooth at its singular point.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A266 — Dense perfectly smooth locus

**theorem; missing**. Source: AfterDefinitionA.25.

Every pfp perfect algebraic space over perfect k has a dense open perfectly smooth subspace.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `A21`, `A265`.

Take the dense smooth locus of a reduced finite-type model.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A267 — Smooth models of perfect groups

**theorem; missing**. Source: LemmaA.26.

Every pfp perfect group scheme over perfect k is the perfection of a smooth finite-type algebraic group.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `A20`.

Descend the group law as in Serre60, then take the reduced group model over the perfect field.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A27 — Perfect affine torsors are étale locally trivial

**theorem; missing**. Source: CorollaryA.27.

Every torsor under an affine pfp perfect k-group on a perfect algebraic space is étale locally trivial.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `A15`, `A267`.

Use the proof at this locator, retaining the displayed hypotheses. The original-source and declaration-sized closure obligations remain explicit in the gap register.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A28 — Affine perfect actions descend

**theorem; missing**. Source: LemmaA.28.

An action of an affine pfp perfect group H on an affine pfp perfect scheme X descends to an action of a smooth affine finite-type group H′ on an affine finite-type X′.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `L46`, `A267`.

Choose finite algebra generators, contain them in a finite subcomodule, generate an invariant finite-type algebra, then descend its representation to a finite group model.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A29 — Free perfect affine action quotient

**theorem; missing**. Source: TheoremA.29.

For affine pfp perfect H acting freely on affine pfp perfect X, the fpqc quotient X/H is a pfp perfect algebraic space.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `A28`, `A27`, `A18`, `A30`.

Use the revised proof: étale-local finite-flat scheme cover of the finite-type quotient stack, perfect its groupoid to an equivalence relation, apply A.30. Old coarse-space argument alone did not establish faithful flatness.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A291 — Separated free-action quotient

**theorem; missing**. Source: TheoremA.29, second assertion.

Under A.29, if (act,pr2):H×X→X×X is a closed immersion, X/H is separated.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `A29`.

Descend the closed diagonal through the torsor.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A30 — Finite-flat groupoid perfect quotient

**theorem; missing**. Source: TheoremA.30.

Let V⇉U be an equivalence relation of pfp perfect schemes arising by perfection from a finite locally free groupoid V′⇉U′ of quasiprojective k-schemes. Then U/V is represented by a pfp perfect scheme.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `A22`, `A31`.

Reduce to affines, let C=Eq(A⇉B), prove V≅U×_(Spec C^perf)U, and use A.31 to prove A^perf faithfully flat over C^perf.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A31 — Ferrand flatness descent over perfect rings

**theorem; missing**. Source: LemmaA.31.

Let R→S be an injective integral map of perfect rings that is the perfection of a finite ring map. For any R-module M, if M⊗_R S is S-flat, then M is R-flat.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `L23`.

After finite-free splitting of monic equations, use the finitely many radical ideals J_k covering Spec R with intersection zero and flatness of M/J_k M. Close the cited Stacks0531/0532/0522 descent details.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### A32 — Perfect-group orbit is locally closed

**theorem; missing**. Source: PropositionA.32, rational-point qualification.

For connected affine pfp perfect H acting on separated pfp perfect X and a k-rational point x, H/H_x→X is a locally closed immersion. A general geometric point is treated after its residue-field base change.

AppendixA works over a perfect field of characteristic p. Algebraic spaces are not automatically quasi-separated; pfp explicitly includes the finiteness and separation conditions in its definition. Rational-point and geometric-component assumptions are not replaced by closed-point or irreducible assumptions.

Prerequisites: `A23`, `A22`, `A29`.

Find an open finite locus by Zariski main theorem on a model, spread it by translations, then apply perfect universal-homeomorphism rigidity.

Open gates: `Q-closure`, `Q-models`, `Q-source`.

#### G01 — Ramified Witt coefficients

**definition; planned**. Source: §0.5,§1.1.

Fix a complete mixed-characteristic DVR O with uniformizer ϖ, residue perfect k and Cohen map W(k)→O. Put W_O(R)=W(R)⊗_(W(k))O for perfect k-algebras R, with its ϖ-adic topology.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Planned stages: `RelativeFarguesFontaine:RF0`.

Prerequisites: `L01`.

API: Construct the coefficient algebra and finite quotients. Identify reduction modulo ϖ with R and prove ϖ-torsionfreeness. Transport perfect k-algebra maps continuously.

Acceptance cases: For O=W(k), obtain W(R). For R=k, recover O. W(R)/p need not equal R without the perfectness hypotheses used here.

Open gates: `Q-closure`, `Q-source`.

#### G02 — Greenberg jets and perfect loops

**definition; planned**. Source: §1.1.

For an affine O-scheme X define L_p^hX(R)=X(W_O(R)/ϖ^h), L_p^+X as the inverse limit; on perfect R define L^hX and L^+X by perfection. For affine F-schemes define LX(R)=X(W_O(R)[1/ϖ]).

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Planned stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `G01`, `A07`, `A12`.

API: Represent finite Greenberg jets by Witt-coordinate equations. Compare L^+X with the inverse limit of perfected finite jets. Preserve open immersions and coefficient-compatible maps.

Acceptance cases: Jets of affine one-space have h Witt coordinates before perfection. Jets of a point remain a point. Zero-extending Teichmüller coordinates is not a ring homomorphism.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G03 — Representability of punctured loops

**theorem; planned**. Source: Proposition1.1.

For affine finite-type F-scheme X, LX is represented by an ind-perfect scheme.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Planned stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `G02`.

Bound denominators of affine coordinates, write Witt polynomial equations, and use perfect roots to realize a filtered union of affine perfect schemes.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G04 — Integral loops as a closed subfunctor

**theorem; missing**. Source: Lemma1.2.

For affine finite-type O-scheme X, L^+X→LX_F is closed; loop functors preserve closed immersions in the stated affine setting.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G03`.

Use vanishing of negative Witt coefficients and then defining equations of X.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G05 — Congruence subgroups through dilatation

**construction; missing**. Source: §1.1.

For smooth affine G/O, G^(h) is the iterated dilatation at the identity, with L^+G^(h)=ker(L^+G→L^hG) on perfect tests.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G02`.

API: Construct the successive dilatations. Identify the perfected positive-loop kernel. Relate successive congruence quotients to additive Lie-algebra groups.

Acceptance cases: For G_a, the kernel is ϖ^hW_O(R). At level zero the whole positive loop group occurs. The unperfected Greenberg kernel cannot be substituted without a comparison.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G06 — Witt affine Grassmannian

**definition; planned**. Source: §1.1.

For smooth affine G/O, Gr_G is the fpqc sheaf quotient LG/L^+G on perfect k-algebras.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Planned stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `G03`, `G05`, `A03`.

API: Form the sheaf quotient of the right positive-loop action. Identify R-points with G-torsors on W_O(R) trivialized after ϖ-inversion. Construct base change, group morphism and left-loop action maps.

Acceptance cases: For G_m over an algebraically closed field the points are integers. The standard torsor gives the neutral lattice. Pointwise cosets on arbitrary R need not already be the fpqc quotient.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G07 — Integral torsor description

**theorem; missing**. Source: Lemma1.3.

The quotient Gr_G classifies G-torsors on W_O(R) with a generic trivialization, functorially on perfect R.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G06`, `A14`.

Use smooth torsor lifting from the henselian pair, fpqc trivialization and effective descent of the frame torsor.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G08 — Witt lattices and relative position

**definition; planned**. Source: §1.2.

A lattice is a finite projective W_O(R)-module with a trivialization after ϖ-inversion. Over a perfect field an isogeny has dominant elementary-divisor coweight Inv(β); for families use geometric residue points.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Planned stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `G01`, `G07`.

API: Associate elementary divisors to a field-valued isogeny. Detect boundedness by the dominance order on the actual cocharacter lattice. Transport under residue-field extension and duality, reversing and negating the coweight.

Acceptance cases: diag(ϖ²,ϖ) has dominant position (2,1). An isomorphism has position zero. Equal determinant valuation alone does not determine relative position.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G09 — Minuscule lattice quotient criterion

**theorem; missing**. Source: Lemma1.5.

For ω_i=(1^i,0^(n−i)), Inv(E1→E2)=ω_i iff ϖE2⊂E1⊂E2 and E2/E1 is projective over R of rank i, under the perfect-base finite-projective hypotheses.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G08`.

Detect integrality fibrewise, use reducedness and constant-rank finite presentation, and lift projectivity over the complete Witt ring. Correct the inverse-map scalar and quotient orientation in sourceIssues.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G10 — Closed relative-position bounds

**theorem; missing**. Source: Lemma1.6.

For lattice isogenies over perfect R the locus Inv≤μ is closed and the exact-position locus is open in it.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G08`.

Apply exterior-power bounds and the cited Katz specialization theorem; retain determinant component equality.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G11 — Separated lattice quotient

**theorem; missing**. Source: Lemma1.7.

The diagonal of the lattice Grassmannian is a closed immersion.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G10`.

Equality of lattices is the simultaneous integral inclusion condition.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G12 — Cartan orbit classification

**theorem; planned**. Source: Lemma1.8 and§1.4.

Over algebraically closed k, L^+G-orbits for split reductive G on Gr_G are indexed by dominant coweights.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Planned stages: `ReductiveGroupsPartII:RG2.4`.

Prerequisites: `G08`.

Use Cartan decomposition over the complete DVR; import the actual lattice and root datum from RG2.4.

Open gates: `Q-closure`, `Q-geometry`, `Q-source`.

#### G13 — Bounded matrix presentation

**construction; missing**. Source: Lemma1.9.

For GL_n and N≥0 let V_N={(A,t):t det A=ϖ^N}; Gr_N is its perfected positive-loop quotient by GL_n, classifying nonnegative lattices of total colength N.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G08`, `G11`.

API: Construct the matrix-and-inverse-unit presentation. Prove the GL_n action is free on perfect tests and identify the quotient. Compare increasing denominator/colength bounds with all of Gr_GL_n.

Acceptance cases: N=0 gives the standard lattice quotient. For n=1 there is one colength-N lattice over a field. A matrix with det zero cannot occur even if all low determinant coordinates vanish.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G14 — Finite-jet stabilizer presentation

**construction; missing**. Source: Lemmas1.10–1.11.

For h>N, V′_(N,h) imposes determinant coordinates 0 through N−1 zero and the Nth invertible; J consists of pairs (A,γ) with Aγ=A modulo ϖ^h. Gr_(N,h) is the level-h lattice-frame torsor.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G13`, `G05`.

API: Define the finite-jet determinant open and stabilizer scheme. Choose a set-theoretic Witt-coordinate lift and identify Gr_(N,h) with J noncanonically. Show the quotient is independent of the chosen lift.

Acceptance cases: For n=1,h=N+1 the residual stabilizer is read from ϖ^N(γ−1)=0. At N=0, invertibility forces γ=1. The range h≤N cannot use the same distinguished determinant coordinate.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G15 — Bounded Grassmannian algebraic space

**theorem; planned**. Source: Proposition1.12.

Gr_N is a separated pfp perfect algebraic space.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Planned stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `G14`, `A29`, `G11`.

Take the free finite-dimensional perfect-group quotient, using the revised A.29 proof, and descend the closed diagonal.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G16 — Demazure lattice-chain space

**construction; planned**. Source: §1.3.

For a sequence of minuscule or dual-minuscule positions μ•, Gr_(μ•) classifies successive lattice modifications of those positions with a fixed initial lattice.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Planned stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `G09`, `A263`.

API: Construct the iterated relative Grassmannian functor. Identify each successive quotient bundle and its rank. Compose chains and map to their endpoint, with reversed dual-chain compatibility.

Acceptance cases: One ω_i step is the perfection of Gr(i,n). An empty chain is a point. A general nonminuscule step is not automatically a Grassmann bundle.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G17 — Projective quotient lifting

**theorem; missing**. Source: Lemma1.14.

For a minuscule lattice inclusion E′⊂E, the kernel of E′/ϖ→E/ϖ is projective over R and E′ remains finite projective over W_O(R).

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G09`.

Compute Tor1 of the ϖ-killed projective quotient and lift a projective splitting through the complete coefficient ring.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G18 — Proper Demazure tower

**theorem; planned**. Source: Proposition1.13.

The minuscule/dual-minuscule chain space is a perfectly proper perfect scheme, given by an iterated Grassmann bundle.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Planned stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `G16`, `G17`, `A24`.

Induct on the chain using the universal crystal quotient and relative Grassmann representability.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G19 — First two one-step towers

**theorem; missing**. Source: Lemma1.15.

For ω1 chains of lengths one and two, the resolution is respectively perfected P^(n−1) and the specified projective bundle P(Ω_(P^(n−1))⊕O), with the paper’s quotient convention.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G17`, `G18`.

Compute the universal first modification and its reduction; distinguish a chosen model from a canonical compatible ind-model.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G20 — Proper convolution and scheme fibres

**theorem; missing**. Source: Corollary1.17.

The endpoint map from a minuscule chain to the appropriate bounded Grassmannian is perfectly proper; its fibres are perfect schemes.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G18`, `G15`, `G10`.

Express a fibre as a closed zero-position locus in the correctly reversed dual-modification tower.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G21 — Open isomorphism of the full ω1 resolution

**theorem; missing**. Source: Proposition1.18, first assertion.

The length-N ω1-chain resolution of Gr_N is an isomorphism over Gr_(Nω1).

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G20`.

The cyclic quotient on the open orbit has a unique full chain of successive length-one quotients.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G22 — Connected boundary fibres

**theorem; missing**. Source: Proposition1.18, remaining assertions.

The full ω1-chain resolution is surjective, with geometrically connected fibres; over the boundary of Gr_(Nω1), fibres have positive dimension.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G20`, `G21`.

Induct through projective first/last-step choices. The final-step rank equals the number of positive elementary divisors; make all intermediate admissibility inequalities explicit.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G23 — Irreducibility and properness of bounds

**theorem; missing**. Source: Corollary1.19.

Gr_N is irreducible and perfectly proper.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G18`, `G22`.

Descend properness and irreducibility along the surjective Demazure map.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G24 — Grassmannian embedding comparison

**theorem; missing**. Source: §1.4.1.

A closed embedding G→GL_n with quasi-affine respectively affine quotient induces a locally closed respectively closed immersion of Grassmannians.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G06`.

Use the integral faithful representation and torsor reduction-of-structure-group argument. Original BD/PR/Alper statements remain source gates.

Open gates: `Q-closure`, `Q-geometry`, `Q-source`.

#### G25 — Weil-restriction comparison

**theorem; planned**. Source: §1.4.1.

For a finite extension of coefficient DVRs, the loop and Grassmannian functors of restriction of scalars agree with the corresponding coefficient-extension functors.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Planned stages: `ReductiveGroupsPartII:RG2.0a`.

Prerequisites: `G01`, `G06`.

Apply the defining functorial property of Weil restriction. A ramified integral restriction need not be reductive; use the parahoric argument separately.

Open gates: `Q-closure`, `Q-geometry`, `Q-source`.

#### G26 — Iwahori–Weyl and parahoric flag data

**definition; planned**. Source: §1.4.2.

For a reductive generic fibre choose an apartment and alcove, its Iwahori I, connected Néron torus model and W̃=N(F)/T(O); affine simple reflections and length use that choice.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Planned stages: `ReductiveGroupsPartII:RG2.2`, `ReductiveGroupsPartII:RG2.3`, `ReductiveGroupsPartII:RG2.4`.

Prerequisites: `G05`.

API: Construct the chosen alcove, parahorics and normalizer quotient. Compare W̃ with the affine Weyl subgroup and length-zero component group. Transport conjugate alcove choices with their resulting flag functors.

Acceptance cases: For split SL2 the affine Weyl group is infinite dihedral. For a torus there are no affine reflections. Replacing the actual cocharacter lattice by the full coweight lattice changes components.

Open gates: `Q-closure`, `Q-geometry`, `Q-source`.

#### G27 — Affine flag Schubert cells

**theorem; missing**. Source: §1.4.2.

Iwahori orbits in the perfect affine flag variety are perfected affine spaces of dimension ℓ(w). A simple parahoric quotient is perfected P1.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G26`, `G02`.

Use root subgroup coordinates for a reduced expression and the rank-one parahoric quotient.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G28 — Affine flag Demazure resolution

**theorem; missing**. Source: §1.4.2.

A reduced word gives a perfectly proper iterated P1-bundle onto the Schubert closure, with connected fibres.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G27`, `G20`.

Iterate the simple parahoric correspondence and prove the open-cell isomorphism and fibre connectedness.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G29 — Ind-properness theorem

**theorem; planned**. Source: Theorem1.4.

For smooth affine G/O the Grassmannian is a separated ind-pfp perfect algebraic space; for reductive G it is ind-perfectly proper.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Planned stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `G15`, `G24`, `G25`, `G28`.

Combine faithful representations with the parahoric flag covering argument; do not use later BS projectivity as an input.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G30 — Kottwitz connected components

**theorem; missing**. Source: Proposition1.21.

Over algebraically closed residue field, π0(LG)≅π0(Gr_G)≅π1(G)_Γ under the Kottwitz map.

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Prerequisites: `G26`, `G28`.

Reduce by a z-extension to a torus and simply connected derived group; use connected affine Schubert towers and the original torus Kottwitz theorem.

Open gates: `Q-closure`, `Q-ADLV`, `Q-source`.

#### G31 — General reductive position bounds

**theorem; missing**. Source: Lemma1.22.

For reductive G, relative position ≤μ defines a closed subspace in any family of modifications.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G24`, `G10`, `G12`.

Use a finite family of representation weights to detect the dominance inequalities.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G32 — Orbit dimension and finite model

**theorem; missing**. Source: Corollary1.23.

For split reductive G and dominant μ, Gr_μ is perfectly smooth with a smooth quasiprojective finite-type model, of dimension ⟨2ρ,μ⟩; its closure has the same dimension and is perfectly proper.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G29`, `G31`, `A32`, `G12`.

Compute the finite-jet stabilizer and its root subgroup codimensions, then apply the rational orbit theorem.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G33 — Orbit projection to the partial flag

**theorem; missing**. Source: §1.4.3 andLemma1.24.

Gr_μ maps to the special-fibre partial flag Ḡ/P_μ with perfected affine fibres; for minuscule μ this is an isomorphism.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G32`, `G26`.

Reduce the stabilizer modulo ϖ and identify its unipotent congruence quotient. A loop-rotation section is not supplied.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### G34 — Component parity

**definition; missing**. Source: Lemma1.25 and§2.4.

The parity sign on π1(G)_Γ is p(μ)=(-1)^⟨2ρ,μ⟩; the additive degree ε(μ)=(1−p(μ))/2 lies in Z/2.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G30`, `G32`.

API: Descend the sign through the coroot lattice. Relate cohomological parity to ε and keep p as a multiplicative sign. Add component degrees under convolution.

Acceptance cases: A coroot has even pairing with 2ρ. The neutral component has ε=0 and p=+1. Using p itself as the exponent in a Koszul rule makes the unit sign negative.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### E01 — Constructible coefficients on perfect spaces

**definition; missing**. Source: AppendixA.3.1.

For separated pfp perfect k-spaces and ℓ invertible in k, define D_c^b(X,Q̄_ℓ) through finite-type models and the étale-topos equivalence; use coherent finite-level coefficient systems.

Separate ordinary finite-type algebraic spaces from their pfp perfections. ℓ is invertible in the base; normalized rational coefficients, separatedness/compactifiability and purity are retained where used. The six operations and trace on ordinary models are imported from their existing owners.

Prerequisites: `A09`, `A23`, `L36`.

API: Construct the model comparison equivalence with Q̄_ℓ coefficients. Show Frobenius-twisted refinements give compatible equivalences. Transport pullback and proper-support pushforward through common models.

Acceptance cases: For a perfect point recover bounded finite-dimensional coefficient complexes. A universal homeomorphism induces an étale equivalence. An ordinary derived-category carrier alone does not provide constructible ℓ-adic coefficients.

Open gates: `Q-closure`, `Q-coefficients`, `Q-source`.

#### E02 — Six operations on perfect pfp spaces

**theorem; missing**. Source: A.3.1; §2.1–2.2.

The six operations, base change and projection formula on compatible finite-type models descend to separated pfp perfect spaces.

Separate ordinary finite-type algebraic spaces from their pfp perfections. ℓ is invertible in the base; normalized rational coefficients, separatedness/compactifiability and purity are retained where used. The six operations and trace on ordinary models are imported from their existing owners.

Prerequisites: `E01`, `A23`.

Use common Frobenius refinements and the ordinary constructible six-functor coherences.

Open gates: `Q-closure`, `Q-coefficients`, `Q-source`.

#### E03 — Verdier biduality

**theorem; missing**. Source: A.3.1; §2.1–2.2.

Constructible bounded complexes on the stated perfect spaces admit Verdier duality and biduality, with D_Y f_!≅f_*D_X.

Separate ordinary finite-type algebraic spaces from their pfp perfections. ℓ is invertible in the base; normalized rational coefficients, separatedness/compactifiability and purity are retained where used. The six operations and trace on ordinary models are imported from their existing owners.

Prerequisites: `E02`.

Transport the model dualizing complex and biduality through the equivalences, tracking its orientation.

Open gates: `Q-closure`, `Q-coefficients`, `Q-source`.

#### E04 — Perverse t-structure

**theorem; missing**. Source: A.3.1; §2.1–2.2.

The middle-perverse conditions defined by geometric-point stalk/costalk dimension bounds form a t-structure on D_c^b of a pfp perfect space.

Separate ordinary finite-type algebraic spaces from their pfp perfections. ℓ is invertible in the base; normalized rational coefficients, separatedness/compactifiability and purity are retained where used. The six operations and trace on ordinary models are imported from their existing owners.

Prerequisites: `E01`, `L45`.

Use the model t-structure and unchanged dimensions under perfection.

Open gates: `Q-closure`, `Q-coefficients`, `Q-source`.

#### E06 — Decomposition theorem

**theorem; missing**. Source: A.3.1; §2.1–2.2.

A proper map of the finite-type models in use decomposes a pure shifted intersection complex into semisimple perverse summands after passing to Q̄_ℓ.

Separate ordinary finite-type algebraic spaces from their pfp perfections. ℓ is invertible in the base; normalized rational coefficients, separatedness/compactifiability and purity are retained where used. The six operations and trace on ordinary models are imported from their existing owners.

Prerequisites: `E02`, `E05`.

Import the ordinary decomposition theorem with its purity hypotheses, then transport to perfect models.

Open gates: `Q-closure`, `Q-coefficients`, `Q-source`.

#### E09 — Hyperbolic localization

**theorem; missing**. Source: A.3.1; §2.1–2.2.

For a compatible G_m action on a finite-type model, Braden’s attracting and repelling functors agree with the prescribed compact/ordinary support conventions.

Separate ordinary finite-type algebraic spaces from their pfp perfections. ℓ is invertible in the base; normalized rational coefficients, separatedness/compactifiability and purity are retained where used. The six operations and trace on ordinary models are imported from their existing owners.

Prerequisites: `E02`.

Read and instantiate the original Braden/DG theorem, including the algebraic-space/model passage; this remains a source gate.

Open gates: `Q-closure`, `Q-coefficients`, `Q-source`.

#### E05 — Middle intersection complex

**definition; missing**. Source: A.3.1 and§2.1.

For a geometrically irreducible pfp perfect space X of dimension d with a smooth dense open j:U→X, IC_X=j_!*Q̄_ℓ[d]; a Tate half-normalization requires a separate choice.

Separate ordinary finite-type algebraic spaces from their pfp perfections. ℓ is invertible in the base; normalized rational coefficients, separatedness/compactifiability and purity are retained where used. The six operations and trace on ordinary models are imported from their existing owners.

Prerequisites: `E04`, `E03`.

API: Form the perverse intermediate extension. Characterize it by no boundary subobject or quotient and its restriction Q̄_ℓ[d]. Compare dense smooth opens and model changes.

Acceptance cases: On a smooth curve IC=Q̄_ℓ[1]. For a point IC=Q̄_ℓ. Q̄_ℓ[2d](d) is the smooth dualizing complex, not this perverse normalization.

Open gates: `Q-closure`, `Q-coefficients`, `Q-source`.

#### E07 — Fundamental classes and top components

**construction; missing**. Source: A.3.3.

Use the dualizing complex to define Borel–Moore homology; after fixing geometric components and trace orientations, top compact cohomology has a basis indexed by top-dimensional geometric irreducible components, with Tate twists retained.

Separate ordinary finite-type algebraic spaces from their pfp perfections. ℓ is invertible in the base; normalized rational coefficients, separatedness/compactifiability and purity are retained where used. The six operations and trace on ordinary models are imported from their existing owners.

Prerequisites: `E02`, `E03`.

API: Construct classes from smooth dense opens with their purity orientation. Identify top cohomology componentwise, not by an unconditional scalar trace. Prove proper pushforward with degrees and smooth pullback with dimension shifts.

Acceptance cases: A geometrically irreducible proper curve has one top component. Spec F_(q²) has two geometric components after base change to F̄_q. A degree-two map P1→P1 multiplies H² by two and is not trace-identity under naive pullback.

Open gates: `Q-closure`, `Q-coefficients`, `Q-source`.

#### E08 — Frobenius trace function

**construction; missing**. Source: A.3.4.

For a Weil complex on a separated pfp perfect X/F_q, transport the existing finite-type Frobenius trace function through a model: at x∈X(F_(q^r)), take the alternating trace of Frobenius^r. The imported proper-support trace theorem identifies f_! with fibrewise summation.

Separate ordinary finite-type algebraic spaces from their pfp perfections. ℓ is invertible in the base; normalized rational coefficients, separatedness/compactifiability and purity are retained where used. The six operations and trace on ordinary models are imported from their existing owners.

Prerequisites: `E01`, `E02`.

API: Construct the function at a specified extension degree r. Prove additivity, shifts and Tate-twist factors. Compare f_! with summing over rational points of each fibre.

Acceptance cases: Q̄_ℓ on a point gives trace one. A shift by one negates the trace. Using Frobenius instead of Frobenius^r at an F_(q^r)-point changes the function.

Open gates: `Q-closure`, `Q-coefficients`, `Q-source`.

#### E10 — Finite-level equivariant coefficients

**definition; missing**. Source: A.3.5.

For perfect affine H acting on X through a pfp quotient with finite-codimensional pro-unipotent kernel, define equivariant perverse sheaves and cohomology through that quotient.

Separate ordinary finite-type algebraic spaces from their pfp perfections. ℓ is invertible in the base; normalized rational coefficients, separatedness/compactifiability and purity are retained where used. The six operations and trace on ordinary models are imported from their existing owners.

Prerequisites: `E01`, `G05`.

API: Construct descent data satisfying the cocycle identity. Compare quotients by smaller normal pro-unipotent kernels. Pull back equivariant complexes along equivariant maps.

Acceptance cases: For trivial H recover ordinary coefficients. A trivial connected kernel leaves equivariant perverse sheaves unchanged. A trivial reductive kernel can change equivariant cohomology, unlike a unipotent kernel.

Open gates: `Q-closure`, `Q-coefficients`, `Q-source`.

#### E11 — Equivariant torsor descent

**theorem; missing**. Source: A.3.5.

For a free normal subgroup K⊂H with represented quotient, equivariant perverse sheaves descend along the K-torsor with the required relative-dimension shift.

Separate ordinary finite-type algebraic spaces from their pfp perfections. ℓ is invertible in the base; normalized rational coefficients, separatedness/compactifiability and purity are retained where used. The six operations and trace on ordinary models are imported from their existing owners.

Prerequisites: `E10`, `A14`, `A29`.

Use smooth descent on finite models; retain normality and the shifted perverse convention.

Open gates: `Q-closure`, `Q-coefficients`, `Q-source`.

#### E12 — Trivial connected and unipotent kernels

**theorem; missing**. Source: A.3.5.

A connected trivially acting kernel does not change equivariant perverse sheaves; if it is unipotent it also does not change equivariant cohomology.

Separate ordinary finite-type algebraic spaces from their pfp perfections. ℓ is invertible in the base; normalized rational coefficients, separatedness/compactifiability and purity are retained where used. The six operations and trace on ordinary models are imported from their existing owners.

Prerequisites: `E10`, `E11`.

Use connectedness for descent data and contractibility of the unipotent classifying space for cohomology.

Open gates: `Q-closure`, `Q-coefficients`, `Q-source`.

#### E13 — Equivariant coefficient ring

**construction; missing**. Source: A.3.2,A.3.5.

For connected affine H with reductive quotient G, R_H=H*(BH,Q̄_ℓ)≅R_G; for reductive G it is the Weyl-invariant symmetric algebra on torus characters with generators in degree two.

Separate ordinary finite-type algebraic spaces from their pfp perfections. ℓ is invertible in the base; normalized rational coefficients, separatedness/compactifiability and purity are retained where used. The six operations and trace on ordinary models are imported from their existing owners.

Prerequisites: `E10`, `G26`, `E14`.

API: Construct classifying-space cohomology using finite-dimensional Stiefel approximations. Identify restriction R_G→R_T with the Weyl invariants. Relate characters, Chern classes and parabolic restriction.

Acceptance cases: For G_m obtain Q̄_ℓ[c] with degree c=2. For a connected unipotent group obtain Q̄_ℓ. Disconnected groups cannot use the connected reductive-quotient formula without extra component data.

Open gates: `Q-closure`, `Q-coefficients`, `Q-source`.

#### S01 — Semisimple Satake category

**definition; planned**. Source: §2.1.

Over algebraically closed k, Sat_G is the filtered category of L^+G-equivariant perverse Q̄_ℓ sheaves supported on bounded closed unions of Gr_G orbits.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Planned stages: `GeometricSatakeAndFusion:GS2:correspondences`.

Prerequisites: `G29`, `E04`, `E10`.

API: Construct the bounded equivariant categories and closed-extension transition functors. Identify simple objects IC_μ using connected orbit stabilizers. Extend scalars and transport compatible integral group isomorphisms.

Acceptance cases: For a torus obtain finite-support coweight-graded vector spaces. IC_0 is the tensor-unit candidate. A local system with arbitrary disconnected stabilizer monodromy is not covered by the connected-stabilizer classification.

Open gates: `Q-closure`, `Q-coefficients`, `Q-generators`, `Q-tannaka`, `Q-source`.

#### S02 — Satake semisimplicity

**theorem; missing**. Source: Proposition2.1.

Sat_G is semisimple with simple objects IC_μ indexed by dominant coweights.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `S01`, `G28`, `E06`, `G34`.

Use parity from affine pavings of the Demazure resolutions and component parity to rule out extensions.

Open gates: `Q-closure`, `Q-coefficients`, `Q-generators`, `Q-tannaka`, `Q-source`.

#### S03 — Twisted convolution product

**construction; planned**. Source: §2.1.

The twisted product Gr_G×̃Gr_G=LG×^(L^+G)Gr_G carries endpoint multiplication m; bounded factors carry descended external products A1⊠̃A2 and convolution m_!(A1⊠̃A2).

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Planned stages: `GeometricSatakeAndFusion:GS2:correspondences`.

Prerequisites: `G06`, `A16`, `E11`.

API: Construct the contracted product and descend the external coefficient complex. Compare the full twisted space with endpoint pairs, retaining bounded twisted incidence conditions. Construct associativity through the three-step quotient diagram.

Acceptance cases: Convolution with IC_0 leaves the other factor unchanged. For a torus the support weights add. A bounded twisted product generally is not a product of its bounded factors.

Open gates: `Q-closure`, `Q-coefficients`, `Q-generators`, `Q-tannaka`, `Q-source`.

#### S04 — Semi-infinite orbit and weight functor

**definition; missing**. Source: §2.2.

For a chosen Borel T⊂B with unipotent U, S_λ=LU·ϖ^λ is the semi-infinite orbit. Set CT_λ(A)=H_c^⟨2ρ,λ⟩(S_λ,A) after the concentration theorem.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `G06`, `G26`, `E02`.

API: Construct the locally closed orbit using a quasi-affine U quotient and the attracting action. Compare opposite repellers and the coweight-indexed support filtration. Transport by torus characters and Levi restriction.

Acceptance cases: For a torus S_λ is one point. The zero sheaf has every weight space zero. An arbitrary cohomological degree does not define the concentrated weight functor.

Open gates: `Q-closure`, `Q-coefficients`, `Q-generators`, `Q-tannaka`, `Q-source`.

#### S05 — Semi-infinite closure order

**theorem; missing**. Source: Lemma2.5.

The closure of S_λ is the union of S_ν with ν≤λ in the appropriate coroot order.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `S04`.

Use the cited geometric argument from Zhu16,5.3.6. The equal-characteristic rank-one proof is explicitly unavailable unchanged here.

Open gates: `Q-closure`, `Q-coefficients`, `Q-generators`, `Q-tannaka`, `Q-source`.

#### S06 — Semi-infinite product coordinates

**theorem; missing**. Source: Lemma2.6 and(2.2.1).

The full twisted LU-orbit product has an explicit ordinary-product description with partial-sum indices; the intersections with bounded Schubert factors remain twisted incidence spaces.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `S03`, `S04`.

Write successive unipotent factors and translate by the intermediate coweights. Do not extend the splitting to bounded intersections.

Open gates: `Q-closure`, `Q-coefficients`, `Q-generators`, `Q-tannaka`, `Q-source`.

#### S07 — MV intersection dimension

**theorem; missing**. Source: Theorem2.8.

Whenever S_λ∩Gr_μ is nonempty, its dimension is ⟨ρ,λ+μ⟩; its maximal-dimensional components are counted by the λ-weight multiplicity in the dual highest-weight representation V_μ.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `S04`, `H01`, `H02`, `E08`.

Spread out to finite fields, use the normalized classical Satake transform and Lusztig–Kato formula, then compare leading point counts; retain the cited equidimensionality input.

Open gates: `Q-closure`, `Q-coefficients`, `Q-generators`, `Q-tannaka`, `Q-source`.

#### Q01 — Quasi-minuscule parahoric resolution

**construction; missing**. Source: Lemma2.12 and(2.2.8–11).

For the dominant short coroot θ, take the parahorics Q_r along the segment rθ for r=0,1/4,1/2,3/4,1. Their contracted quotient gives a P1-bundle resolution of Gr_θ∪Gr_0.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G26`, `G27`.

API: Construct each Q_r by root-valuation inequalities and the adjacent intersections. Identify the P1 bundle and its exceptional flag divisor. Compute the negative Bruhat cells meeting the zero semi-infinite fibre.

Acceptance cases: In rank one the exceptional locus is a point. The open orbit maps isomorphically under the resolution. The affine reflection must use a root functional; a coroot alone cannot index its wall.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### Q02 — Minuscule and quasi-minuscule weight concentration

**theorem; missing**. Source: Proposition2.11.

For a minimal nonzero dominant coweight μ, H_c^i(S_λ,IC_μ)=0 unless i=⟨2ρ,λ⟩.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `Q01`, `G33`, `E06`, `S07`.

Use flag Bruhat cells in the minuscule case; in the quasi-minuscule case compute the resolution summand and cancel flag cohomology using NP01,§8.

Open gates: `Q-closure`, `Q-coefficients`, `Q-generators`, `Q-tannaka`, `Q-source`.

#### Q03 — Zero quasi-minuscule multiplicity

**theorem; missing**. Source: Proof Proposition2.11.

The zero weight in the quasi-minuscule intersection complex has dimension equal to the number of short simple coroots in the specified orbit; its cycle classes come from the negative cells indexed by those coroots.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `Q01`, `E07`, `E06`.

Separate the exceptional flag summand from the pushforward of the P1 resolution and perform the two cohomology range calculations.

Open gates: `Q-closure`, `Q-coefficients`, `Q-generators`, `Q-tannaka`, `Q-source`.

#### Q04 — Minimal convolution dimension bound

**theorem; missing**. Source: Proposition2.14.

For a sequence of minimal nonzero dominant coweights, the convolution fibres over Gr_λ have dimension at most ⟨ρ,Σμ_i−λ⟩.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `Q01`, `Q02`, `S06`.

Induct using the explicit minuscule/quasi-minuscule fibres and the bounded incidence decomposition.

Open gates: `Q-closure`, `Q-coefficients`, `Q-generators`, `Q-tannaka`, `Q-source`.

#### Q05 — Minimal convolution is perverse

**theorem; missing**. Source: Corollary2.15.

Convolution of the minimal IC objects is perverse.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `Q04`, `E06`, `S03`.

Apply the dimension bounds and Verdier duality to the proper convolution map. This precedes the general semismallness theorem.

Open gates: `Q-closure`, `Q-coefficients`, `Q-generators`, `Q-tannaka`, `Q-source`.

#### Q06 — Generation by minimal objects

**theorem; missing**. Source: Lemma2.16.

Sat_G is the idempotent completion of the additive monoidal subcategory generated by the minimal nonzero IC objects (and component/unit objects as required).

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `Q05`, `S02`, `L44`.

Use the geometric PRV result NP01,9.6 to realize every IC as a direct summand; spell out central torus/component handling in the closure work.

Open gates: `Q-closure`, `Q-coefficients`, `Q-generators`, `Q-tannaka`, `Q-source`.

#### Q07 — Concentration for minimal products

**theorem; missing**. Source: Lemma2.17.

For a convolution of minimal IC objects, semi-infinite compact cohomology is concentrated in the total weight degree.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `Q02`, `Q05`, `S06`, `E11`.

Choose finite unipotent jet levels with last level zero, descend the twisted external product, and apply compact Künneth with the 2dimU·Σr_i shifts.

Open gates: `Q-closure`, `Q-coefficients`, `Q-generators`, `Q-tannaka`, `Q-source`.

#### S08 — General convolution perversity

**theorem; planned**. Source: Proposition2.2.

Convolution preserves Sat_G.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Planned stages: `GeometricSatakeAndFusion:GS2:Satake-closure`.

Prerequisites: `Q05`, `Q06`.

Extend from the generators through direct sums and idempotent summands.

Open gates: `Q-closure`, `Q-coefficients`, `Q-generators`, `Q-tannaka`, `Q-source`.

#### S09 — General convolution semismallness

**theorem; missing**. Source: Corollary2.3.

For dominant μ• and λ, every nonempty fibre of the bounded convolution over Gr_λ has dimension at most ⟨ρ,Σμ_i−λ⟩.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `S08`, `E07`.

Read the largest possible compact-cohomology degree of the fibre from perversity; this direction avoids using general semismallness to prove perversity.

Open gates: `Q-closure`, `Q-coefficients`, `Q-generators`, `Q-tannaka`, `Q-source`.

#### S10 — Convolution multiplicity cycles

**theorem; missing**. Source: Corollary2.4.

The multiplicity of IC_λ in IC_μ1⋆…⋆IC_μn is the top compact cohomology of the appropriate open-stratum convolution fibre, with basis its maximal components.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `S09`, `S02`, `E07`.

Restrict the semisimple perverse pushforward to Gr_λ and use the top-degree component theorem.

Open gates: `Q-closure`, `Q-coefficients`, `Q-generators`, `Q-tannaka`, `Q-source`.

#### S11 — Weight concentration for all Satake objects

**theorem; missing**. Source: Theorem2.7.

For every A∈Sat_G, H_c^i(S_λ,A) vanishes unless i=⟨2ρ,λ⟩.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `Q07`, `Q06`.

Pass the concentration statement through direct summands.

Open gates: `Q-closure`, `Q-coefficients`, `Q-generators`, `Q-tannaka`, `Q-source`.

#### S12 — Weight cycle basis

**theorem; missing**. Source: Lemma2.9.

For IC_μ, CT_λ is the component space of S_λ∩Gr_μ; the unshifted open-orbit compact degree is ⟨2ρ,λ+μ⟩.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `S11`, `S07`, `E07`.

Use the IC shift d_μ and discard boundary strata by the dimension bound.

Open gates: `Q-closure`, `Q-coefficients`, `Q-generators`, `Q-tannaka`, `Q-source`.

#### S13 — Total weights equal ordinary cohomology

**theorem; missing**. Source: Corollary2.10.

The direct sum of CT_λ(A) identifies canonically with H*(Gr_G,A); these functors are exact and the total functor is faithful.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `S11`, `E09`, `S05`.

Use opposite support filtrations and hyperbolic localization to split the filtration canonically.

Open gates: `Q-closure`, `Q-coefficients`, `Q-generators`, `Q-tannaka`, `Q-source`.

#### S14 — Equivariant cohomology bimodule

**construction; missing**. Source: §2.3.

For A∈Sat_G, finite-jet torsor presentations give H*_(L+G)(A) commuting left and right R_G actions, independent of the sufficiently deep congruence level.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `E13`, `E10`, `G05`.

API: Construct both coefficient-ring actions from the two frame torsors. Compare levels through pro-unipotent kernels. Attach the tensor-over-R_G map to convolution.

Acceptance cases: For IC_0 the bimodule is R_G. For a minuscule orbit compute the parabolic invariant ring. Two commuting actions need not be equal without Lemma2.19.

Open gates: `Q-closure`, `Q-coefficients`, `Q-KL`, `Q-source`.

#### S15 — Equivariant Künneth for convolution

**theorem; missing**. Source: Lemma2.18.

H_eq*(A⋆B)≅H_eq*(A)⊗_(R_G)H_eq*(B), compatibly with associativity and both outer actions.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `S14`, `S03`, `E11`.

Use the finite-level torsor square and equivariant Künneth, retaining graded/projectivity hypotheses.

Open gates: `Q-closure`, `Q-coefficients`, `Q-KL`, `Q-source`.

#### S16 — Equality of the two R_G actions

**theorem; missing**. Source: Lemma2.19.

The two coefficient-ring actions on H_eq*(A) agree for every Satake object A.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `S15`, `Q06`, `Q01`, `E13`.

Check minuscule parabolic invariants and the quasi-minuscule resolution bimodule, then extend through tensor products and summands.

Open gates: `Q-closure`, `Q-coefficients`, `Q-KL`, `Q-source`.

#### S17 — Monoidal ordinary cohomology

**theorem; missing**. Source: Corollary2.20.

Equivariant cohomology is finite projective over R_G and augmentation R_G→Q̄_ℓ yields a monoidal structure on H*:Sat_G→Vect_(Q̄_ℓ).

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `S15`, `S16`, `S13`.

Use equivariant formality and augmentation; verify the threefold associativity diagram.

Open gates: `Q-closure`, `Q-coefficients`, `Q-KL`, `Q-source`.

#### H01 — Normalized classical Satake transform

**theorem; planned**. Source: Theorem2.8 proof.

For the split unramified group and hyperspecial K, the spherical convolution algebra maps isomorphically to Weyl-invariant functions on the dual torus by the normalized constant term, with Haar vol(U(O))=1 and the specified q^⟨ρ,λ⟩ factor.

Planned stages: `SmoothRepresentationsOfLocalGroups:SR.4`.

Prerequisites: `G12`, `G26`.

Import the algebraic Satake theorem from SR.4 before either geometric Satake proof.

Open gates: `Q-closure`, `Q-source`.

#### H02 — Lusztig–Kato weight formula

**theorem; missing**. Source: Theorem2.8 proof, formula(2.2.4).

The spherical basis and the irreducible dual-group characters are related by the normalized inverse-q intersection/KL polynomials used in the point-count expansion of S_λ∩Gr_μ.

Prerequisites: `H01`.

Read Lusztig83 and Kato82 in their exact normalizations and separate the coefficient identity from its mixed-characteristic geometric realization.

Open gates: `Q-closure`, `Q-KL`, `Q-source`.

#### H03 — Affine Hecke and twisted involution module

**definition; missing**. Source: §2.4.4.

For an affine Coxeter system (W_a,S), involutive diagram automorphism ⋄ and the specified equal-parameter ring, use its generic Hecke algebra, ordinary KL basis and the Lusztig–Vogan module on ⋄-twisted involutions.

Prerequisites: `G26`.

API: Import the shared generic Hecke presentation and construct the twisted module with its bar involution. Define ordinary and twisted KL polynomials by triangularity and bar invariance with explicit q/v conversion. Transport diagram automorphisms and the length-zero conjugation defining ⋄.

Acceptance cases: At x=y both normalized KL polynomials are one. For A1 check the quadratic relation and bar involution directly. Twisted involutions are not all elements, and their module is not an algebra quotient.

Open gates: `Q-closure`, `Q-KL`, `Q-source`.

#### H04 — Longest double-coset involution indexing

**construction; missing**. Source: §2.4.4.

Write W̃=W_a⋊Ω; for ω∈Ω with ω*=ω⁻¹ put ⋄=Ad(ω)∘*. The elements indexing the theorem are longest representatives of (W_J,W_(J^⋄)) double cosets that are ⋄-twisted involutions.

Prerequisites: `G26`, `H03`.

API: Construct the twisted automorphism and its order-two proof. Identify the finite-parabolic longest double-coset representatives. Compare the coweight indexing with the corresponding Schubert stalks.

Acceptance cases: The identity component uses ω=1. A rank-one finite parabolic has a unique longest element. An arbitrary pair of affine Weyl elements is outside Theorem2.35’s restricted identity.

Open gates: `Q-closure`, `Q-KL`, `Q-source`.

#### H05 — Equal-characteristic geometric Satake input

**theorem; planned**. Source: Theorem2.35 proof, LY13 input.

For a reductive group over the equal-characteristic algebraically closed base, the classical geometric Satake theorem gives the normalized symmetric tensor equivalence and its cohomology fibre functor.

Planned stages: `GlobalShtukasAndFunctionFieldLanglands:GS.1`.

Prerequisites: `G26`.

Import GlobalShtukasAndFunctionFieldLanglands GS.1 and its MV source; this input must be proved independently of mixed-characteristic Satake.

Open gates: `Q-closure`, `Q-KL`, `Q-source`.

#### H06 — Equal-characteristic opposition sign

**theorem; missing**. Source: LY13 published§4.3–4.4 and§7.4.

In the equal-characteristic setting, the normalized opposition acts by (−1)^j on IH^(2j) of a Schubert variety, with the corresponding normalized stalk sign.

Prerequisites: `H05`.

The tensor automorphism is conjugation by a lift of (−1)^ρ; determine it on H² and then on graded weight spaces. Retain the IC-dimension normalization when passing to stalks.

Open gates: `Q-closure`, `Q-KL`, `Q-source`.

#### H07 — Lusztig–Yun twisted polynomial identity

**theorem; missing**. Source: Theorem2.35; LY13 publishedTheorem7.3(2), proof§7.4.

For exactly the longest double-coset elements and twisted automorphism of H04, P^(σ,⋄)_(x,y)(q)=P_(x,y)(−q).

Prerequisites: `H03`, `H04`, `H06`.

Use the equal-characteristic IC trace realization and opposition sign. Zhu’s cited Theorem6.3/Lemma6.2 correspond to published7.3/7.2; this is a locator translation, not a new theorem.

Open gates: `Q-closure`, `Q-KL`, `Q-source`.

#### H08 — Mixed-characteristic KL stalk realization

**theorem; missing**. Source: §2.4.4, KL79/80 andLV12 input.

Ordinary and twisted KL polynomials in H03 realize dimensions and involution traces of normalized even IC stalks of the mixed-characteristic affine flag Schubert spaces at the specified strata.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `H03`, `G27`, `E05`, `E08`.

Rebuild the finite-level geometric recursion and its twisted trace realization; the mixed-characteristic extension is an explicit proof gate, not supplied by quoting equal-characteristic Satake.

Open gates: `Q-closure`, `Q-coefficients`, `Q-KL`, `Q-source`.

#### O01 — Opposite Grassmannian category

**construction; missing**. Source: §2.4.1.

The opposite quotient Gr_G^op=L^+G\LG has its finite-level equivariant IC category and convolution; inversion reverses ordered modifications.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `G06`, `S03`, `E11`.

API: Construct opposite finite quotients and their common torsor correspondence. Identify the pulled-back IC objects by the finite-level argument. Build the equivalence Id′ and its monoidal structure.

Acceptance cases: The neutral orbit corresponds to itself. For a torus inversion sends λ to −λ before opposition is applied. Perfect smoothness of the opposite projection is not established and cannot justify perverse pullback.

Open gates: `Q-closure`, `Q-coefficients`, `Q-KL`, `Q-source`.

#### O02 — Finite-level opposite IC comparison

**theorem; missing**. Source: Lemmas2.23–2.24.

The two finite-level pullbacks of each IC_μ agree with the indicated shifts, giving a monoidal equivalence between Satake and opposite Satake.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `O01`, `Q01`, `Q06`.

First prove the comparison on minuscule/quasi-minuscule resolutions, then on products and summands; do not assume the opposite projection smooth.

Open gates: `Q-closure`, `Q-coefficients`, `Q-KL`, `Q-source`.

#### O03 — Canonical opposite stalk and costalk maps

**theorem; missing**. Source: Corollary2.26.

The opposite equivalence gives compatible maps on normalized stalks and costalks; the latter is constructed using i!C=D_S i*D_XC with all shifts and twists.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `O02`, `E03`.

Use the common finite-level torsor diagram and Verdier duality. Avoid inferring a shift by moving a bracket through an unspecified dual symbol.

Open gates: `Q-closure`, `Q-coefficients`, `Q-KL`, `Q-source`.

#### O04 — Pinned opposition anti-involution

**construction; missing**. Source: §2.4.2.

Let θ′ be the pinned automorphism acting as −w0 on coweights and let θ=θ′∘inverse. It is an anti-involution of LG, inducing an order-reversing tensor pullback to the opposite category.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `G26`, `O01`.

API: Construct the pinned group automorphism and compose with inversion. Prove θ²=id and θ(gh)=θ(h)θ(g). Compare its action on coweight strata and reversed convolution.

Acceptance cases: On the torus the combined map acts through w0. The unit modification is fixed. Group inversion alone is not a homomorphism in a noncommutative group.

Open gates: `Q-closure`, `Q-coefficients`, `Q-KL`, `Q-source`.

#### O05 — Normalized IC involution

**construction; missing**. Source: §2.4.2.

Choose a square root i of −1 in Q̄_ℓ. Normalize N_μ:θ*IC_μ≅IC_μ by the identity on the open stratum and use the source phase M_μ=(−1)^−⟨ρ,μ⟩N_μ, interpreted via i.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `O04`, `E05`, `G34`.

API: Construct the unique open-normalized simple-object isomorphism. Separate the N involution from its degree-dependent M phase. Extend through semisimple sums and compare changes of the chosen square root.

Acceptance cases: For μ=0 the phase is one. For dimension d_μ the phase is i^(−d_μ). Discarding the phase changes the ordinary versus graded flip.

Open gates: `Q-closure`, `Q-coefficients`, `Q-KL`, `Q-source`.

#### O06 — Monoidal opposite cohomology comparison

**theorem; missing**. Source: Lemma2.27.

The comparison γ:H*≅H*Id′ respects the tensor structures from equivariant bimodules.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `O02`, `S17`.

Compare both ring actions on the common torsor cohomology before augmentation.

Open gates: `Q-closure`, `Q-coefficients`, `Q-KL`, `Q-source`.

#### O07 — Reversal comparison on cohomology

**theorem; missing**. Source: Lemma2.28.

The map δ:H*≅H*θ* is compatible with reversed ordered tensor products and the graded interchange signs.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `O04`, `S17`.

Apply the anti-involution to the finite-level convolution correspondence and its Künneth map.

Open gates: `Q-closure`, `Q-coefficients`, `Q-KL`, `Q-source`.

#### O08 — Open-orbit opposition sign

**theorem; missing**. Source: Lemma2.32.

On the even cohomology of Gr_μ, the normalized open-orbit involution acts as (−1)^j in degree 2j.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `G33`, `E13`, `O04`.

Reduce to the partial flag; its cohomology is generated by degree-two character Chern classes, on which opposition acts by −1.

Open gates: `Q-closure`, `Q-coefficients`, `Q-KL`, `Q-source`.

#### O09 — Stalk opposition sign

**theorem; missing**. Source: Lemma2.34.

On each normalized IC stalk even-degree part, the involution acts by the scalar (−1)^j.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `H07`, `H08`, `O03`.

The polynomial identity equates its trace with (−1)^j times dimension. Since the operator squares to one over characteristic zero, this forces the scalar action.

Open gates: `Q-closure`, `Q-coefficients`, `Q-KL`, `Q-source`.

#### O10 — Global intersection-cohomology sign

**theorem; missing**. Source: Proposition2.30.

On IH^(2j)(Gr_≤μ), Θ_μ acts by (−1)^j.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `O08`, `O09`, `O03`.

Filter by finite orbit strata; compute each graded piece with costalk duality and parity. The involution is semisimple, so the scalar on each graded piece is the scalar on the total.

Open gates: `Q-closure`, `Q-coefficients`, `Q-KL`, `Q-source`.

#### O11 — Graded cohomology phase

**theorem; missing**. Source: Proposition2.29.

The normalized natural transformation Θ on H^j(A) is multiplication by i^j with the source’s chosen phase convention.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `O05`, `O10`.

Translate the unshifted IH degree through IC_μ[difference] and the M_μ phase; check negative degrees as well as positive.

Open gates: `Q-closure`, `Q-coefficients`, `Q-KL`, `Q-source`.

#### O12 — Rational commutativity constraint

**construction; missing**. Source: Theorem2.21 and(2.4.4).

The opposite equivalence, θ and the normalized maps define c′_(A,B). For component-homogeneous A,B put c_(A,B)=(-1)^(ε(A)ε(B))c′_(A,B), using additive parity ε.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `O05`, `O06`, `O07`, `O11`, `G34`.

API: Construct the reversed-convolution isomorphism from the three natural transformations. Show its normalized cohomology is the ordinary vector-space flip. Extend by component decompositions and prove independence of i.

Acceptance cases: c_(1,A) is the unit constraint. For two odd components the Koszul correction is −1. Substituting the multiplicative signs p(A),p(B) in the exponent gives a false negative unit sign.

Open gates: `Q-closure`, `Q-coefficients`, `Q-KL`, `Q-source`.

#### O13 — Symmetry and hexagon

**theorem; missing**. Source: Corollary2.22.

The corrected commutativity constraint is symmetric and satisfies the unit and hexagon axioms.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `O12`, `S13`, `L35`.

Apply faithful monoidal H*; its images are the ordinary flip and the usual vector-space coherence diagrams.

Open gates: `Q-closure`, `Q-coefficients`, `Q-KL`, `Q-source`.

#### T01 — Neutral Tannakian reconstruction

**construction; planned**. Source: §2.5, MV07§7 input.

For a Q̄_ℓ-linear abelian rigid symmetric tensor category with an exact faithful fibre functor and scalar endomorphisms of the unit, construct its tensor-automorphism affine group scheme and the representation equivalence.

Planned stages: `MotivesAndAlgebraicCycles:MC.6`.

Prerequisites: `L47`.

API: Construct the coend/Hopf algebra from the category and fibre functor. Identify its points with tensor automorphisms, reusing the pinned known-Hopf comparison afterward. Prove reconstruction and naturality for tensor functors.

Acceptance cases: Finite representations of G_m reconstruct G_m. The category of finite vector spaces reconstructs the trivial group. A faithful nonexact functor does not satisfy the reconstruction hypotheses.

Open gates: `Q-closure`, `Q-tannaka`, `Q-source`.

#### T02 — Satake rigidity and neutral structure

**theorem; missing**. Source: §2.5.

With the symmetry above, Sat_G and H* form a neutral Tannakian category; duals use Verdier duality and inversion with the fixed coefficient convention.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `S02`, `S13`, `S17`, `O13`, `E03`.

Prove the evaluation/coevaluation identities following MV07§7; a tensor category is not rigid by definition.

Open gates: `Q-closure`, `Q-coefficients`, `Q-generators`, `Q-tannaka`, `Q-source`.

#### T03 — Rational Tannakian reductivity

**theorem; planned**. Source: §2.5.

The reconstructed Satake group is connected reductive over Q̄_ℓ.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Planned stages: `GeometricSatakeAndFusion:GS4:rational-reductivity`.

Prerequisites: `T01`, `T02`, `S02`.

Use semisimplicity for pro-reductivity, finite tensor generation for finite type, and the source’s connectedness argument.

Open gates: `Q-closure`, `Q-coefficients`, `Q-generators`, `Q-tannaka`, `Q-source`.

#### T04 — Torus Satake equivalence

**theorem; missing**. Source: §2.5.

For a torus T, Sat_T with convolution is the category of finite-support X_*(T)-graded finite-dimensional vector spaces and reconstructs the dual torus.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `S01`, `S03`, `T01`.

Identify the discrete components and addition law. Retain any Galois descent as a separate comparison.

Open gates: `Q-closure`, `Q-coefficients`, `Q-generators`, `Q-tannaka`, `Q-source`.

#### T05 — Tensor constant term

**theorem; missing**. Source: Lemma2.36.

The total weight functor CT from Sat_G to Sat_T is a tensor functor, compatibly with its identification with H*.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `S13`, `S17`, `T04`.

Use local equivariant localization as in Zhu16,5.3.14; do not insert the mixed fusion theorem as a prerequisite.

Open gates: `Q-closure`, `Q-coefficients`, `Q-generators`, `Q-tannaka`, `Q-source`.

#### T06 — Dual root datum identification

**theorem; planned**. Source: §2.5.

The weight torus is maximal in the Satake group, its weight filtration determines a Borel, and its based root datum is dual to that of G.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Planned stages: `GeometricSatakeAndFusion:GS4:integral-dual-group`.

Prerequisites: `T03`, `T05`, `G26`.

Use rank-one Levi calculations and the highest-weight classification; import the dual-group carrier from RG2.5.

Open gates: `Q-closure`, `Q-coefficients`, `Q-generators`, `Q-tannaka`, `Q-source`.

#### T07 — Mixed-characteristic rational geometric Satake

**theorem; missing**. Source: Theorem0.3 and§2.5.

For the reductive O-group over algebraically closed residue field, Sat_G is equivalent as a symmetric monoidal Q̄_ℓ-linear category to finite-dimensional representations of the dual group, with H* the forgetful fibre functor.

Section2 uses algebraically closed k, reductive G/O, coefficients Q̄_ℓ with ℓ≠p, bounded supports and sufficiently deep finite-jet equivariance. IC is perverse-normalized by [d]; half Tate twists and the square root of −1 are explicit choices. No integral/mod-ℓ semisimplicity is claimed.

Prerequisites: `T01`, `T02`, `T06`.

Combine the independent symmetry, reconstruction and root-datum comparison. This is the rational one-leg theorem, not the integral multi-leg FS theorem.

Open gates: `Q-closure`, `Q-coefficients`, `Q-generators`, `Q-tannaka`, `Q-source`.

#### D01 — Closed and exact affine Deligne–Lusztig spaces

**definition; missing**. Source: §3.1,(3.1.1–2).

For unramified reductive G, b∈G(L), dominant μ and Frobenius σ, let X_≤μ(b)={gK:Inv(g⁻¹bσ(g))≤μ}; X_μ(b) is its exact-position stratum. These are perfect locally closed/closed subspaces of Gr_G with the inherited bounded presentations.

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Prerequisites: `G31`, `G06`.

API: Form the relative-position pullback along the Frobenius graph. Separate the closed bound from its exact open stratum. Transport by σ-conjugating b and by compatible coefficient extension.

Acceptance cases: For G_m, X_μ(b) is empty if v(b)≠μ. For μ=0,b=1 the fixed-point condition remains. The closure bar in the published(3.1.1) is present; replacing it by a single double coset changes the definition.

Open gates: `Q-closure`, `Q-ADLV`, `Q-source`.

#### D02 — Newton point and defect

**definition; planned**. Source: Theorem3.1 and§3.1.

For b∈G(L), retain its dominant Newton point ν_b, Kottwitz invariant and σ-centralizer J_b; def_G(b)=rk_F(G)−rk_F(J_b).

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Planned stages: `BunGAndNewtonStrata:BG0`, `BunGAndNewtonStrata:BG1`.

Prerequisites: `G26`, `G30`.

API: Construct J_b by the equation g⁻¹bσ(g)=b. Compare Newton and Kottwitz invariants under σ-conjugacy. Compute defect under adjoint, Levi and restriction-of-scalars reductions.

Acceptance cases: For a split torus the defect is zero. For a basic GL_n isocrystal of slope a/n with coprime a,n, J_b has F-split rank one. The absolute rank of an inner form does not replace its F-split rank in the defect.

Open gates: `Q-closure`, `Q-ADLV`, `Q-source`.

#### D03 — Basic-Levi reduction

**theorem; missing**. Source: Theorem3.1 proof, GHKR06/Ham15a.

The ADLV dimension problem reduces from b to a basic class in the Levi centralizing ν_b, with the corresponding root/weight correction and nonemptiness constraints.

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Prerequisites: `D01`, `D02`.

Read the original reduction and prove the exact dimension comparison; do not assume dimensions are unchanged by the Levi passage.

Open gates: `Q-closure`, `Q-ADLV`, `Q-source`.

#### D04 — Superbasic adjoint reduction

**theorem; missing**. Source: Theorem3.1 proof, CKV classification.

The basic dimension problem reduces through adjoint simple factors to the superbasic case, whose relevant factors are restrictions of scalars of PGL_n.

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Prerequisites: `D03`, `D02`.

Separate central isogeny, product and superbasic-support reductions and their component conditions; the original classification remains a proof gate.

Open gates: `Q-closure`, `Q-ADLV`, `Q-source`.

#### D05 — Equal-characteristic comparison for the basic model

**theorem; missing**. Source: Proof Theorem3.1.

The finite-type model used in the superbasic reduction admits the stated equal-characteristic comparison, sufficient for the point-count/dimension argument; the comparison used here is not asserted an isomorphism of group schemes.

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Prerequisites: `D04`, `G19`, `E08`.

Use the explicit low-stage geometry and the Lefschetz calculation on compatible perfect finite-type models; close the cited GHKR/Viehmann proof inputs.

Open gates: `Q-closure`, `Q-ADLV`, `Q-source`.

#### D06 — Iterated affine Deligne–Lusztig space

**construction; missing**. Source: Definition3.4.

For a coweight sequence μ•, pull the convolution correspondence (pr1,m) back along the graph of bσ to obtain X_(μ•)(b), equivalently a cyclic chain of bounded modifications.

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Prerequisites: `D01`, `S03`.

API: Construct the graph pullback with its chain description. Stratify the endpoint position by exact dominant λ≤Σμ_i. Compare its map to X_≤Σμ_i(b) with convolution fibres.

Acceptance cases: A one-term sequence recovers X_≤μ(b). A sequence of zero positions imposes the Frobenius fixed chain. A fixed-λ fibre bound is not uniform over all smaller endpoint strata.

Open gates: `Q-closure`, `Q-ADLV`, `Q-source`.

#### D07 — Ordered Frobenius norm

**construction; missing**. Source: Lemma3.6.

For unramified E/F of degree d and b=(b0,…,b_(d−1)) in the split factors of Res_(E/F)H, set Nm(b)=b0σ(b1)…σ^(d−1)(b_(d−1)).

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Prerequisites: `D02`, `G25`.

API: Construct the ordered product with the chosen embedding cycle. Show σ-conjugacy maps to σ^d-conjugacy by telescoping. Compare changing the initial embedding by the specified cyclic conjugation.

Acceptance cases: For d=1 the norm is b0. For a torus the product commutes but the Frobenius powers remain. In a noncommutative group the reversed product need not represent the same framed norm.

Open gates: `Q-closure`, `Q-ADLV`, `Q-source`.

#### D08 — Restriction-of-scalars iterated comparison

**theorem; missing**. Source: Proposition3.5.

The ADLV for Res_(E/F)GL_n identifies with the iterated ADLV for GL_n over E, with ordered norm and the σ-twisted coweight sequence.

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Prerequisites: `D06`, `D07`.

Solve the chain equations successively and verify the final equation has σ^d and the ordered norm.

Open gates: `Q-closure`, `Q-ADLV`, `Q-source`.

#### D09 — Norm Newton pairing

**theorem; missing**. Source: Lemma3.7, pairing assertion.

Under D08 the sum of root pairings and the Newton pairing transform as in Lemma3.7, with all d factors and σ-twisted coweights included.

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Prerequisites: `D08`, `D02`.

Compare the d embeddings and the dth iterate of Frobenius on the isocrystal.

Open gates: `Q-closure`, `Q-ADLV`, `Q-source`.

#### D10 — Norm defect comparison

**theorem; missing**. Source: Lemma3.7, centralizer/defect assertion.

The σ-centralizer under restriction of scalars identifies with the restriction of the σ^d-centralizer of Nm(b), and the corresponding defects agree.

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Prerequisites: `D08`, `D02`.

Solve the centralizer equations from the initial component and compare F-split ranks.

Open gates: `Q-closure`, `Q-ADLV`, `Q-source`.

#### D11 — Stratified semismall upper bound

**theorem; missing**. Source: Proposition3.3 proof pp459–460.

For each exact endpoint stratum X_λ(b), the inverse image in the iterated ADLV has dimension at most dim X_λ(b)+⟨ρ,Σμ_i−λ⟩. Taking the maximum over the finite λ set gives the upper bound over X_≤Σμ_i(b).

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Prerequisites: `D06`, `S09`.

Apply semismallness only on its exact orbit stratum and use the dimension-of-fibres theorem on finite-type models.

Open gates: `Q-closure`, `Q-ADLV`, `Q-source`.

#### D12 — Top-stratum lower bound

**theorem; missing**. Source: Proposition3.3 proof.

When the exact top ADLV stratum is nonempty with the required full dimension, its inverse image under convolution gives the matching lower dimension bound; verify this condition in the superbasic GL_n argument.

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Prerequisites: `D11`, `G21`.

Use the open-position convolution fibre of the computed dimension and the cited superbasic dimension theorem; this nonempty top-stratum input must be closed explicitly.

Open gates: `Q-closure`, `Q-ADLV`, `Q-source`.

#### D13 — Superbasic restriction-of-scalars dimension

**theorem; missing**. Source: Proposition3.3.

For the nonempty ADLV of Res_(E/F)GL_n in the superbasic case, dim X_≤μ(b)=⟨ρ,μ−ν_b⟩−def_G(b)/2.

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Prerequisites: `D08`, `D09`, `D10`, `D11`, `D12`.

Combine the norm comparison, exact-stratum bounds and the original superbasic GL_n dimension calculation.

Open gates: `Q-closure`, `Q-ADLV`, `Q-source`.

#### D14 — Affine Deligne–Lusztig dimension theorem

**theorem; missing**. Source: Theorems0.5 and3.1.

For unramified reductive G and nonempty X_≤μ(b), dim X_≤μ(b)=⟨ρ,μ−ν_b⟩−def_G(b)/2.

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Prerequisites: `D03`, `D04`, `D05`, `D13`.

Combine the reductions. The nonempty qualification is essential; no empty-set dimension convention turns the torus mismatch into the printed finite value.

Open gates: `Q-closure`, `Q-ADLV`, `Q-source`.

#### R01 — Contravariant Dieudonné module over perfect rings

**definition; missing**. Source: §3.2, proofProposition3.11.

For a p-divisible group over perfect k-algebra R, its contravariant Dieudonné module is finite projective over W(R), with semilinear F,V and FV=VF=p, in the scope of Gabber’s equivalence used by Zhu.

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Prerequisites: `G01`, `G09`.

API: Apply the perfect-ring classification with its exact finiteness hypotheses. Recover the group from the Dieudonné module and integral F,V conditions. Transport quasi-isogenies contravariantly and preserve base change.

Acceptance cases: The étale height-one group and μ_(p∞) have opposite F/V slopes. The zero p-divisible group gives the zero module. A quasi-isogeny X0→X induces D(X)→D(X0), not a covariant map.

Open gates: `Q-closure`, `Q-RZ`, `Q-source`.

#### R02 — Hodge-type framed datum

**construction; missing**. Source: §3.2 p461.

Fix p>2, unramified G/Z_p, minuscule μ and a faithful lattice representation with μ-weights 0,1 and tensor stabilizer G. Choose b and a Dieudonné framing whose Hodge filtration is adapted to that μ-convention.

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Prerequisites: `R01`, `D02`.

API: Construct the tensor frame and the two-step filtration. Express the F,V conditions and the adapted-frame constraint. Transport b, tensors and filtration together under change of frame.

Acceptance cases: For GL2 with b=diag(1,p), im(V mod p) is the second coordinate. For weight zero the Hodge filtration has the corresponding zero rank. Membership in G(W)p^μG(W) alone does not make a fixed frame’s filtration equal the standard μ-filtration.

Open gates: `Q-closure`, `Q-RZ`, `Q-source`.

#### R03 — Hodge-type Rapoport–Zink moduli

**definition; missing**. Source: Definition3.8.

On the specified formally smooth nilpotent W-bases, classify deformations X of the framing p-divisible group, a quasi-isogeny X0→X on the special fibre and filtered crystalline Tate tensors whose isomorphism functor is a G-torsor.

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Prerequisites: `R02`, `A14`.

API: Construct the deformation groupoid and tensor conditions. Compare its GL realization with the ambient RZ functor. Transport a faithful tensor presentation using the cited independence theorem.

Acceptance cases: For G=GL_n and no extra tensors recover the EL deformation problem. The framed group with identity quasi-isogeny is a base object when admissible. Arbitrary crystalline tensors without a G-torsor and filtration condition do not define this Hodge-type functor.

Open gates: `Q-closure`, `Q-RZ`, `Q-det`, `Q-source`.

#### R04 — Hodge-type RZ representability

**theorem; missing**. Source: Theorem3.10, Kim/Howard–Pappas.

For the unramified Hodge-type datum with p>2, the functor is represented by a closed formally smooth RZ formal subscheme with the stated k-point ADLV identification.

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Prerequisites: `R03`.

Read the cited representability and embedding-independence theorems; preserve the allowed base category and the p>2 hypothesis.

Open gates: `Q-closure`, `Q-RZ`, `Q-det`, `Q-source`.

#### R05 — GL perfect RZ comparison

**theorem; missing**. Source: Proposition3.11, GL case.

For GL_n, the perfected reduced special fibre of the RZ space identifies functorially with X_≤μ(b).

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Prerequisites: `R01`, `R04`, `G09`, `D01`.

Translate a minuscule lattice into integral F and V=pF⁻¹, recover the p-divisible group through the perfect-ring equivalence, and check the quasi-isogeny direction.

Open gates: `Q-closure`, `Q-RZ`, `Q-det`, `Q-source`.

#### R06 — Hodge perfect RZ comparison

**theorem; missing**. Source: Proposition3.11.

For the stated Hodge-type datum, the perfected reduced RZ special fibre is canonically isomorphic to X_≤μ(b).

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Prerequisites: `R05`, `R04`.

Realize both sides as reduced perfect closed subspaces of the GL object and compare algebraically closed points using finite-presentation bounds; prove this closed-subspace criterion explicitly.

Open gates: `Q-closure`, `Q-RZ`, `Q-det`, `Q-source`.

#### R07 — Hodge RZ dimension

**theorem; missing**. Source: Corollary3.12.

For a nonempty Hodge-type RZ space under these hypotheses, its reduced special-fibre dimension is ⟨ρ,μ−ν_b⟩−def_G(b)/2.

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Prerequisites: `R06`, `D14`, `A23`.

Perfection preserves dimension, so apply the ADLV dimension theorem. No ramified or p=2 extension is asserted.

Open gates: `Q-closure`, `Q-RZ`, `Q-det`, `Q-source`.

#### B01 — Determinant line on a modification chain

**construction; planned**. Source: AppendixB.1.

For a positive minuscule step E′⊂E put L(E′,E)=det_R(E/E′); for the paper’s negative step use its separately specified quotient convention. Tensor the step lines to obtain L̃_det on the positive full-chain resolution.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Planned stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `G16`, `L38`, `L39`.

API: Construct each finite-projective quotient determinant and the tensor product along a chain. Compare refinements of a positive filtration through exact determinant identities. Transport the line and its frame-change isomorphisms under base change.

Acceptance cases: A single ω1 modification gives O(1) with the quotient convention. An empty chain gives the trivial line. A chosen negative-step line is not automatically the inverse of the positive definition unless that comparison is proved.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### B02 — Ordinary cohomology injectivity for the resolution

**theorem; missing**. Source: LemmaB.1, first assertion.

For the full length-N GL_n resolution π:Gr̃_N→Gr_N, π*:H*(Gr_N,k̄,Q̄_ℓ)→H*(Gr̃_N,k̄,Q̄_ℓ) is injective.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G22`, `E06`.

Supply the ordinary-cohomology argument of PropositionB.1, whose proof is omitted. A decomposition-theorem IC summand by itself does not identify ordinary cohomology with IC cohomology; close this distinction before claiming the result.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### B03 — Descended first Chern class

**theorem; missing**. Source: LemmaB.1, second assertion.

The first Chern class of L̃_det lies in the image of pullback from the bounded Grassmannian, in the stated rational coefficient cohomology.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `B01`, `B02`, `E13`, `E14`.

Compute its class on the convolution resolution using Satake and the normalized cohomology maps; this does not itself descend a line bundle.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### B04 — Basepoint freeness implies determinant descent

**theorem; missing**. Source: PropositionB.2.

If Γ(Gr̃_N,L̃_det) is basepoint free, then the unique line L_det on Gr_N pulling back to L̃_det exists, and is given by π_*L̃_det.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `B01`, `B03`, `G22`, `A261`.

Use B.1 to show the globally generated line has zero degree on each fibre curve; the induced projective morphism is constant on the connected fibres. Prove the required contraction and pushforward-is-a-line step. Passing from semiampleness of a model to this basepoint-free condition requires the positive-characteristic/Frobenius argument and is not the literal statement of B.2.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### B05 — Determinant descent and projectivity resolved later

**theorem; planned**. Source: AppendixB footnote andConjecturesI–II.

ConjecturesI andII of this paper are proved by Bhatt–Scholze17: the determinant line descends and gives projective deperfections of the bounded Witt Grassmannian.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Planned stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `B01`.

Import the existing PAPER-BHATT-SCHOLZE-17 extraction and its GS0 source route. This later theorem is not an input to Zhu’s original ind-properness or symmetry proofs.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### B06 — Exact quasi-isogeny category

**construction; missing**. Source: RemarkB.3.

Use the exact category of triples (M,N,β) of finite projective W(R)-modules with β:M[1/p]≅N[1/p], with the specified degreewise exact sequences. Its K-theory is the object of RemarkB.3’s determinant question.

Prerequisites: `L41`, `G08`.

API: Construct the triple category and exact sequences. Compare its relative/support K-theory with the finite-length quotient description when β is integral. Transport triples and exact sequences along perfect-ring base change.

Acceptance cases: An identity isogeny has zero relative class. Multiplication by p on rank one gives the residue-field support class. A virtual rank equality does not supply a coherent determinant functor.

Open gates: `Q-closure`, `Q-det`, `Q-source`.

#### B07 — Canonical weakly normal orbit model

**construction; missing**. Source: AppendixB.2.

Choose the smooth finite-type orbit model Gr′_μ from its finite-jet quotient. Its function fields specify via A.15 a weakly normal proper model Gr′_≤μ of the perfect closure.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G32`, `A21`.

API: Construct the model from the prescribed orbit function fields. Identify its perfection and dense open orbit model. Compare model changes after a finite Frobenius twist.

Acceptance cases: For minuscule μ the model is the flag variety. For μ=0 the model is a point. Separate canonical models for nested bounds need not have closed-immersion transition maps.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### B08 — Truncated determinant complete intersection

**theorem; missing**. Source: LemmaB.4, first assertion.

For h>N, V′_(N,h) has dimension n²h−N and is a local complete intersection, being cut out by the first N determinant coordinates on the indicated open affine space.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G14`.

Compute fibre dimensions of the stabilizer presentation to obtain the expected codimension, then apply the complete-intersection criterion.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### B09 — Normality of the determinant model

**theorem; missing**. Source: LemmaB.4, second assertion.

The scheme V′_(N,h) is normal.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `B08`, `G22`.

Check the tangent dimension at diag(p^N,1,…,1), translate by left/right jet actions, show the remaining locus has codimension at least two, and apply Serre R1+S2.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### B10 — Canonical models need twisted transition maps

**theorem; missing**. Source: RemarkB.6.

For λ<μ, the perfect closed inclusion Gr_≤λ→Gr_≤μ descends after a Frobenius twist of the chosen source model, but that descended map need not be a closed immersion.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `B07`, `A23`.

Apply finite-model descent and retain its actual morphism property. This does not prove that no compatible ind-model of any kind exists.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### B11 — OE-linear isogeny-chain moduli

**definition; missing**. Source: AppendixB.2 p485.

Over k=F̄_p fix h≥N, the unramified E/Q_p of degree 2h with embeddings τ_i=σ^iτ_0, and X0 of height 2hn, dimension hn and signature (0^h,n^h). M_(N,h) classifies OE-linear isogeny chains X0→…→XN: Xi has signature (1^i,0^(h−i),n^(h−i),(n−1)^i); degφ_i=p^(2i−1); dφ_i vanishes on τ_0,…,τ_(h−1), and the dual differential vanishes on τ_h,…,τ_(2h−1).

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Prerequisites: `R01`, `R03`.

API: Construct the chain functor with all four signature/degree/differential conditions. Prove the kernels lie in p-torsion and identify the universal extension bundle. Truncate chains and compare the τ-component Dieudonné maps after perfection.

Acceptance cases: N=0 gives the framed base point. For N=1 the parameter is P^(n−1). Omitting the differential conditions can give extra components and varying dimensions.

Open gates: `Q-closure`, `Q-RZ`, `Q-det`, `Q-source`.

#### B12 — Projective tower of isogeny chains

**theorem; missing**. Source: LemmaB.7.

For 0≤i<h, M_(i+1,h)=P(E_i) over M_(i,h), where E_i is the rank-n τ0 component of the dual Lie algebra of the universal vector extension. Consequently M_(N,h) is smooth projective.

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Prerequisites: `B11`.

Identify the allowed next kernel with a quotient line of E_i; prove all four conditions in both directions. The printed i=1,…,h misses the initial stage and overruns the range.

Open gates: `Q-closure`, `Q-RZ`, `Q-det`, `Q-source`.

#### B13 — Canonical resolution model comparison

**theorem; missing**. Source: PropositionB.8.

After choosing D(X0)_τ0≅W(k)^n, the canonical weakly normal model of the full length-N resolution is isomorphic to M_(N,h).

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Prerequisites: `B12`, `R05`, `A21`, `A22`, `B07`.

First compare perfections by the τ0 Dieudonné chain, then identify the dense cyclic-kernel open; use the resulting birational universal homeomorphism and normality. Fill the explicitly omitted details.

Open gates: `Q-closure`, `Q-RZ`, `Q-det`, `Q-source`.

#### B14 — Hodge determinant on the chain model

**construction; missing**. Source: AppendixB.2 p486.

On M_(N,h), put ω_(XN,τj)=det((Lie XN)^*_(τj)) and L̃′_det=⊗_(i=1)^N ω_(XN,τ_(−i))^(−p^i).

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Prerequisites: `B11`, `L39`.

API: Construct each τ-component determinant and the displayed tensor power. Compare the line with its Frobenius pullbacks and the universal Dieudonné quotients. Transport along chain-moduli base change.

Acceptance cases: N=0 gives O. For N=1 the exponent is −p on the τ_(−1) Hodge line. Replacing p^i by i loses the Frobenius scaling.

Open gates: `Q-closure`, `Q-RZ`, `Q-det`, `Q-source`.

#### B15 — Hodge-line comparison

**theorem; missing**. Source: LemmaB.9.

Under the perfection isomorphism of B.8, L̃_det is the pullback of L̃′_det on M_(N,h).

Section3 uses unramified reductive data and Frobenius over the completed maximal unramified coefficient field. Dimension equalities require nonempty spaces. Hodge RZ uses p>2, μ with representation weights0,1 and contravariant Dieudonné conventions. AppendixB.2 separately has k=F̄_p and h≥N.

Prerequisites: `B13`, `B14`, `B01`.

Compute the successive Dieudonné quotient determinants and the τ-shift/Frobenius exponents. The proof is omitted in the paper and remains an explicit gap.

Open gates: `Q-closure`, `Q-RZ`, `Q-det`, `Q-source`.

#### B16 — Rank-two quadratic-cone chart

**construction; missing**. Source: AppendixB.3.

For p>2 let U=Spec k[x,y,z]/(x²−yz). On perfect tests form A=[[p+[x],−[y]],[[z],p−[x]]], with det A=p², and map its lattice to Gr_2 for GL2.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G13`, `G14`.

API: Construct the Witt matrix from cone coordinates. Verify det A=p² using multiplicativity and [−1]=−1. Compare the chart with the finite-jet quotient and change of frame.

Acceptance cases: At x=y=z=0 obtain p times the identity. At x=0,y=1,z=0 obtain [[p,−1],[0,p]]. At p=2 the displayed Teichmüller sign identity cannot be used unchanged.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### B17 — Rank-two resolution model

**theorem; missing**. Source: AppendixB.3 p486.

The length-two GL2 resolution is the perfection of P(O(1)⊕O(−1)) over P1, with a noncanonical splitting of the underlying rank-two extension.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `G19`.

Split 0→O(1)→E/p→O(−1)→0 by the vanishing of H1(O(2)); the splitting is not canonical.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### B18 — Finite Witt matrix factorization

**theorem; missing**. Source: LemmaB.11.

On the specified open finite-Witt matrix locus in LemmaB.11, every matrix X factors uniquely as X=A g with A from the cone chart and g invertible, with the determinant-normalizing unit taken in the correct inverse convention.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `B16`, `G14`.

Use the first-coordinate open conditions and the adjugate formulas. Solve g=A⁻¹X, not XA⁻¹; the noncommuting matrix diagnostic exposes the printed order error.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### B19 — Open cone chart and scheme representability

**theorem; missing**. Source: PropositionB.10.

U_perf embeds as an open subspace in Gr_2 for GL2,p>2. Together with the smooth open orbit it covers Gr_2, so this bounded perfect algebraic space is a scheme.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `B18`, `G32`.

Descend the finite-level factorization through the frame quotient and check the two opens cover.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### B20 — Rank-two determinant extension

**theorem; missing**. Source: AppendixB.3 final paragraph.

In this rank-two length-two example, the determinant line extends from the smooth open orbit by the indicated j_* construction and agrees on the cone chart.

Use a complete mixed-characteristic DVR O with chosen uniformizer and perfect residue field k, perfect k-algebra tests, and the indicated smooth affine integral group. Assertions involving an orbit classification or split root data have algebraically closed k and the stated reductive hypotheses. The explicit B.3 chart assumes p>2.

Prerequisites: `B19`, `B01`.

Check invertibility of the extension locally at the cone singularity and compare the resolution pullback; do not generalize j_* invertibility to arbitrary normal spaces.

Open gates: `Q-closure`, `Q-models`, `Q-geometry`, `Q-generators`, `Q-det`, `Q-source`.

#### E14 — Chern classes on perfect spaces

**construction; missing**. Source: A.3.2 andRemarkA.33.

For a vector bundle E on a pfp perfect space, construct c_i(E) from the Kummer first Chern class and the projective-bundle relation, then pass to normalized rational coefficients.

Separate ordinary finite-type algebraic spaces from their pfp perfections. ℓ is invertible in the base; normalized rational coefficients, separatedness/compactifiability and purity are retained where used. The six operations and trace on ordinary models are imported from their existing owners.

Prerequisites: `A262`, `A263`, `L39`, `E01`.

API: Construct c1 from the Kummer boundary and c_i from the tautological projective-bundle relation. Compare with a finite-type bundle model under its specified pullback. Prove Whitney sum, base-change and character-torsor compatibility.

Acceptance cases: For a line L, c1(L^m)=m c1(L). The trivial bundle has all positive Chern classes zero. Frobenius pullback scales c1 by p, so model change must retain the line identification.

Open gates: `Q-closure`, `Q-coefficients`, `Q-source`.

### Source findings awaiting independent review

These findings concern the published article except the explicitly identified known arXiv repair. All are awaiting independent verification; none is an author-endorsed erratum.

#### E1 — error

arXivv2 AppendixA, PropositionA.28 PDF47–48; revisedv3 A.29 PDF53–54; publishedpp476–477. Affects: **the proof**.

Printed: “The older quotient argument lacks the flatness justification needed for the perfect torsor.”.

Correction: Use the revised finite-flat groupoid argument and Ferrand flatness descent A.31.

Reason: A coarse quotient alone does not prove the quotient projection faithfully flat. The revised proof supplies that step.

Existing correction: Known: arXivv3 history explicitly records the A.29 gap repair; published proof contains A.30–A.31. Earlier and revised passages were read..

#### E2 — misprint

p412, coweight order. Affects: **the proof**.

Printed: “positive roots”.

Correction: Use positive coroots in the coweight dominance order.

Reason: The order is on X_*(T); roots belong to the dual character space.

Existing correction: new.

#### E3 — misprint

p413, end proof1.1. Affects: **nothing**.

Printed: “L_pZ and L_pA^n”.

Correction: Use LZ and LA^n in the punctured perfect-loop argument.

Reason: L_p was not the punctured functor defined there; the displayed construction is on perfect tests.

Existing correction: new.

#### E4 — misprint

p417, proof1.5. Affects: **the proof**.

Printed: “(1/p)β⁻¹:pE2→E1”.

Correction: Use β⁻¹ restricted to pE2, equivalently pβ⁻¹:E2→E1.

Reason: For β=p on a rank-one Witt module, (1/p)β⁻¹(p)=1/p is not integral.

Existing correction: new.

#### E5 — misprint

p417, proof1.5. Affects: **the proof**.

Printed: “E1/E2 equals the indicated cokernel”.

Correction: Use E2/E1.

Reason: The established inclusion is E1⊂E2 and the cokernel has that orientation.

Existing correction: new.

#### E6 — misprint

p421, proof1.10. Affects: **the proof**.

Printed: “γ=ε_A α⁻¹ ε⁻¹”.

Correction: Use γ=ε_A⁻¹ α⁻¹ ε with the displayed types.

Reason: Here ε_A:E0→E_A, α:E_A→E and ε:E0→E; only the corrected order defines E0→E0.

Existing correction: new.

#### E7 — misprint

p422, proof1.14. Affects: **the proof**.

Printed: “Gr(i,E0/p), in the relative construction”.

Correction: Use Gr(i,E/p) at the varying lattice E.

Reason: The next modification is parametrized by the current universal crystal quotient, not the fixed initial lattice.

Existing correction: new.

#### E8 — misprint

p424, proof1.17. Affects: **the proof**.

Printed: “Reverse chain with the original μ_i* indexing and incompatible displayed arrows”.

Correction: Reverse the positions as μ_(N+1−i)* and orient maps F_i→F_(i−1) when F0=E.

Reason: The fibre construction composes F_N→F0; reversing a chain must also reverse its ordered sequence of positions.

Existing correction: new.

#### E9 — misprint

p424, proof1.17. Affects: **nothing**.

Printed: “reference(1.4.2)”.

Correction: Use(1.3.3).

Reason: The referenced chain construction is the earlier equation in§1.3, not the later§1.4.2.

Existing correction: new.

#### E10 — misprint

p429,(1.4.4). Affects: **nothing**.

Printed: “g t^μ”.

Correction: Use gϖ^μ.

Reason: The mixed-characteristic uniformizer throughout this orbit formula is ϖ.

Existing correction: new.

#### E11 — misprint

p436, proof2.9. Affects: **the proof**.

Printed: “Open-orbit H_c degree ⟨2ρ,λ⟩”.

Correction: For unshifted constant coefficients on S_λ∩Gr_μ use degree ⟨2ρ,λ+μ⟩.

Reason: IC_μ restricts to Q̄_ℓ[d_μ], so its degree-⟨2ρ,λ⟩ cohomology is unshifted degree ⟨2ρ,λ⟩+d_μ.

Existing correction: new.

#### E12 — misprint

p436, filtration display. Affects: **the proof**.

Printed: “Fil_≥μ with S_<λ on its right side”.

Correction: Use the same weight index throughout the filtration definition.

Reason: The right-hand cutoff must agree with the left-hand named filtration step.

Existing correction: new.

#### E13 — misprint

p437, proof2.12. Affects: **the proof**.

Printed: “s_(1+θ), where θ was a coroot”.

Correction: Use the affine root with linear part dual to θ, with the wall sign fixed by the adjacent parahorics.

Reason: An affine reflection is indexed by an affine root functional. The precise plus/minus representative remains a root-convention check, not an asserted new wall choice.

Existing correction: new.

#### E14 — misprint

p440, proof2.17. Affects: **the proof**.

Printed: “Convolution product written as the coefficient sheaf on the twisted source”.

Correction: Use the twisted external product before applying m_!.

Reason: Convolution lives on the target Grassmannian; the Künneth calculation uses the descended external product on the source.

Existing correction: new.

#### E15 — error

p448,(2.4.4). Affects: **a stated result**.

Printed: “(-1)^(p(A1)p(A2)), with p valued in {+1,−1}”.

Correction: Use additive ε(A)=(1−p(A))/2 and exponent ε(A1)ε(A2).

Reason: The printed exponent is always ±1, so its sign is always −1, even for the tensor unit.

Existing correction: new.

#### E16 — misprint

p451,§2.4.4. Affects: **the proof**.

Printed: “C_μ=IC_μ[+⟨2ρ,μ⟩]”.

Correction: For the unshifted IC complex used by the KL stalk formula, set C_μ=IC_μ[−⟨2ρ,μ⟩].

Reason: The perverse IC already restricts to Q̄_ℓ[d_μ]. The printed shift doubles it; the negative shift makes the restriction degree zero. arXivv3 retains the same sign.

Existing correction: new.

#### E17 — misprint

p452, comparison map domain. Affects: **nothing**.

Printed: “The source of γ is printed without its opposite-space qualifier”.

Correction: Retain the opposite Grassmannian in the domain specified by the preceding construction.

Reason: The natural transformation compares two distinct quotient presentations; its source must match that type.

Existing correction: new.

#### E18 — misprint

p453, provenance of2.35. Affects: **the proof**.

Printed: “The equal-characteristic analogue of Lemma2.32”.

Correction: The LY argument uses the full intersection-cohomology sign theorem, corresponding to Proposition2.30; published LY§4.3–4.4 and§7.4.

Reason: The open-orbit Chern-class calculation alone does not prove the IC stalk sign. Published LY Theorem7.3(2)/Lemma7.2 translate Zhu’s6.3/6.2 locators; that numbering difference itself is not asserted an error.

Existing correction: new.

#### E19 — error

Theorems0.5 and3.1, pp407,455. Affects: **a stated result**.

Printed: “Dimension formula with no nonemptiness qualification”.

Correction: Require X_≤μ(b) nonempty, or state the empty case separately.

Reason: For G_m with v(b)≠μ the space is empty by the Kottwitz condition, while the printed right side is zero.

Existing correction: new.

#### E20 — error

pp459–460, proofProposition3.3. Affects: **the proof**.

Printed: “Fixed-λ semismall estimate used over the closed union X_≤λ”.

Correction: Apply the estimate over each exact X_ν, then maximize over ν≤λ. Verify nonempty full-dimensional top-stratum input for equality.

Reason: The fibre bound depends on the exact endpoint coweight. Smaller strata can have larger convolution fibres. This is a repair obligation in the proof, not a counterexample to the qualified dimension theorem.

Existing correction: new.

#### E21 — error

p461, simultaneous choice of b and standard Hodge filtration. Affects: **the proof**.

Printed: “The chosen framing is asserted to realize both fixed b and the fixed standard μ-filtration from double-coset membership alone”.

Correction: Choose an adapted representative, or transport μ and the filtration with the frame.

Reason: For GL2, μ(t)=diag(t,1) and b=diag(1,p), V=pF⁻¹ has mod-p image span(e2), whereas the chosen μ weight-one line is span(e1). The same double coset does not fix the framed filtration.

Existing correction: new.

#### E22 — misprint

p463, proofProposition3.11. Affects: **the proof**.

Printed: “A quasi-isogeny X→X0 followed by D(ι):D(X)→D(X0)”.

Correction: Use ι:X0→X, as in the moduli definition.

Reason: The Dieudonné functor is contravariant; the displayed module arrow has exactly this corrected group arrow.

Existing correction: new.

#### E23 — misprint

p468, proofA.9. Affects: **the proof**.

Printed: “E=E_perf and φ:E→Y”.

Correction: Use E=(E′)_perf and the torsor projection φ:E→X.

Reason: E′ is the finite model being perfected, and X is the stated base; Y is not the target defined there.

Existing correction: new.

#### E24 — error

PropositionA.32, p477. Affects: **a stated result**.

Printed: “A closed point x of X over a general perfect field k supplies the stated orbit map from H”.

Correction: Require x∈X(k), or first base change to κ(x).

Reason: The trivial connected group over F_q acting on Spec F_(q²) gives a closed point but no F_q-morphism Spec F_q→Spec F_(q²).

Existing correction: new.

#### E25 — error

p478,A.3.1. Affects: **a stated result**.

Printed: “IC restricts on the smooth locus to Q̄_ℓ[2d](d)”.

Correction: Use the perverse normalization Q̄_ℓ[d], optionally with a separately chosen half Tate twist.

Reason: On a smooth curve the printed complex is the dualizing complex, whereas the middle-perverse constant sheaf is Q̄_ℓ[1].

Existing correction: new.

#### E26 — error

pp479–480,A.3.3. Affects: **a stated result**.

Printed: “Top compact cohomology of an irreducible k-space is canonically one copy of Q̄_ℓ”.

Correction: Require geometric irreducibility for a scalar trace; otherwise use the geometric-component space.

Reason: Spec F_(q²) is irreducible over F_q but becomes two points over F̄_q, so H_c^0 has rank two.

Existing correction: new.

#### E27 — error

p480,A.3.3, model independence. Affects: **a stated result**.

Printed: “Any morphism of d-dimensional irreducible finite-type spaces induces a canonical trace-compatible isomorphism on top H_c”.

Correction: Replace this with the correct functoriality including properness/degree and specified model orientations; an independent normalization proof remains open.

Reason: A constant map P1→P1 kills H², and a degree-two map multiplies it by two. Even Frobenius pulls O(1) to O(p), so arbitrary model-change pullback is not naively trace preserving.

Existing correction: new.

#### E28 — misprint

p480,A.3.4. Affects: **the proof**.

Printed: “Function on X(F_q), followed by x∈X(F_(q^r))”.

Correction: Fix r and use the corresponding Frobenius^r stalk trace on X(F_(q^r)), or set r=1 throughout.

Reason: The domain and residue-field Frobenius must be indexed consistently.

Existing correction: new.

#### E29 — misprint

p482,A.3.5 andB.1. Affects: **the proof**.

Printed: “php; filtration of E/E0”.

Correction: Use pfp; use E0/E for the positive colength quotient.

Reason: The finiteness abbreviation is pfp, and the inclusion in B.1 is E⊂E0.

Existing correction: new.

#### E30 — misprint

p485,LemmaB.7. Affects: **a stated result**.

Printed: “i=1,…,h”.

Correction: Use i=0,…,h−1.

Reason: The initial projective-space step is M_(1,h)→M_(0,h), and M_(h+1,h) lies beyond the declared range.

Existing correction: new.

#### E31 — misprint

p485, proofB.8. Affects: **the proof**.

Printed: “D(X0)≅W(k)^n”.

Correction: Use D(X0)_τ0≅W(k)^n.

Reason: The full Dieudonné module has rank 2hn; each embedding component has rank n.

Existing correction: new.

#### E32 — misprint

p488, determinant unit inB.11. Affects: **the proof**.

Printed: “p²[λ] in the normalization following [λ]detX=p²”.

Correction: Use p²[λ]⁻¹.

Reason: Solving the defining equation for detX requires the inverse; for p=5 and unit2, 25·2 and 25·3 differ modulo125.

Existing correction: new.

#### E33 — misprint

p488, matrix factorization inB.11. Affects: **the proof**.

Printed: “g̃=X̃Ã⁻¹”.

Correction: Use g̃=Ã⁻¹X̃ when X̃=Ãg̃.

Reason: For A=[[p,−1],[0,p]], g=[[1,0],[1,1]], X=Ag, the corrected product is integral g while XA⁻¹ contains −1/p².

Existing correction: new.

Searches on22September2026 examined the Annals record, arXiv version history, author/profile pages and targeted correction queries. The arXiv A.29 repair is explicit. No separate Zhu corrigendum was found; inaccessible author pages and limited searching prevent an exhaustive absence claim. The Richarz erratum found during the search concerns a different paper. Exact search scope is retained with every JSON entry.

### Historical questions and remarks

- **ConjectureIII**: The canonical weakly normal orbit-field model Gr′_≤μ is normal and Cohen–Macaulay. Historical conjecture as stated in2017; present-day status not established in this extraction.

- **ConjectureIV**: The line ⊗ω_(XN,τ_(−i))^(−p^i) on M_(N,h) is semiample. Historical formulation; relate to BS17 only after proving the exact B.9 model-line comparison.

- **RemarkB.5**: The parenthetical comparison of motives of mixed/equal-characteristic models. Not inferred from the geometric Satake equivalence; motive category and independent comparison proof remain unspecified.

- **Remark2.37**: Possible ramified extension of the rational Satake construction. Remark about an extension, not a theorem proved here.

### Remaining closure work

- **Q-closure**: All90 published pages have been read, but this is not recursive declaration-sized closure. Split every remaining bundled theorem/API, close the precise original-source lemmas, and fill all omitted AppendixB proofs. Suggested APIs/tests are mathematical acceptance specifications, not Lean declarations.

- **Q-models**: Close Yanagihara weak normality, finite-model/Frobenius approximation, Conrad/Keel–Mori quotient charts and Ferrand flatness descent at their original locators. Preserve the revised A.29 proof; prove all exact quotient and rational-orbit hypotheses.

- **Q-geometry**: Read Katz specialization, integral faithful representations and BD/PR/Alper comparison, parahoric root coordinates, Kottwitz components and the quasi-minuscule resolution originals. Decompose the connected-fibre induction and all normality/codimension computations.

- **Q-coefficients**: Close BBD decomposition/purity, Braden/DG hyperbolic localization, equivariant finite-level descent and common model comparisons. Repair A.3 scalar trace and model orientations with a coherent dualizing construction. A finite-type Frobenius map cannot be assumed to preserve the naive fundamental trace.

- **Q-generators**: Read NP01§§8–9 and Zhu16,5.3.6/5.3.14 in full at the used locators; prove quasi-minuscule cohomology cancellation, geometric PRV and central-component generation. Keep general perversity before general semismallness.

- **Q-KL**: Read the uninspected LY§2–3 setup and all KL/LV/Lusztig–Kato original proofs. LY publishedPDF1–3,12–16,27–29 were read; other pages were not. Decompose mixed-characteristic trace realization, extended-affine indexing, involution-filtration semisimplicity and costalk shifts. Inspect possible secondary-source slips before recording any as established.

- **Q-tannaka**: Close abstract MC.6 coend reconstruction, Satake rigidity, finite tensor generation/connectedness and rank-one dual root-data comparison. Known-Hopf Tannaka at the pin does not construct a Hopf algebra from Sat_G.

- **Q-ADLV**: Read GHKR06, Hamacher15a, CKV and Viehmann06 reductions completely. Prove exact-stratum upper bounds and top-stratum nonemptiness/full dimension, norm pairing and defect identities, and the equal-characteristic model comparison.

- **Q-RZ**: Read Gabber/Lau perfect-ring classification and Kim/Howard–Pappas representability and embedding independence. Prove adapted filtration, contravariant tensor maps and equality of reduced perfect closed subspaces from geometric points within finite-presentation bounds. Fill B.7–B.9’s omitted component and Frobenius determinant calculations.

- **Q-det**: Reconcile B.1–B.3 with the existing BS17 support determinant and projectivity proof. Ordinary-cohomology injectivity is not supplied merely by an IC direct summand. Prove basepoint-free descent and the precise canonical-model line formula; keep historical conjecture III and the motives parenthetical outside proved outputs.

- **Q-source**: Independently verify all sourceIssues, including normalization and framing candidates. Rendered inspection was performed at the recorded25 primary pages; arXiv earlier versions and LY were read only at the listed passages. No author endorsement or independent review is claimed.

### Prerequisite reading register

- **Ngô–Polo, Résolutions de Demazure affines et formule de Casselman–Shalika** — Zhu bibliography[NP01]. Quasi-minuscule cancellation§8 and geometric PRV§9.6; original proof closure remains.

- **Mirković–Vilonen, Geometric Langlands duality and representations of algebraic groups over commutative rings** — Zhu bibliography[MV07]. Equal-characteristic Satake and§7 rigidity/reconstruction/root comparison; not a mixed-symmetry input.

- **Lusztig–Yun, A(-q)-analogue of weight multiplicities** — https://math.mit.edu/~zyun/Minusq_published.pdf. PublishedTheorem7.3(2), Lemma7.2 and§7.4 translate Zhu’s prepublication locators. ReadScope above is limited.

- **Kazhdan–Lusztig79/80; Lusztig–Vogan12; Lusztig83; Kato82** — Zhu bibliography[KL79],[KL80],[LV12],[Lus83],[Kat82]. Ordinary/twisted KL geometric recursion and classical Satake weight formula; original normalization proofs remain.

- **Zhu, An introduction to affine Grassmannians and the geometric Satake equivalence** — Zhu bibliography[Zhu16]. 5.3.6 semi-infinite closure and5.3.14 local tensor constant term; original source closure remains.

- **Braden; Drinfeld–Gaitsgory, On a theorem of Braden** — Zhu bibliography[DG14]. Hyperbolic localization and algebraic-space/model passage, with all support conventions.

- **Görtz–Haines–Kottwitz–Reuman; Hamacher; Chen–Kisin–Viehmann; Viehmann** — Zhu bibliography[GHKR06],[Ham15a],[CKV],[Vie06]. ADLV basic-Levi/superbasic reductions, component constraints and GL_n dimension inputs.

- **Kim; Howard–Pappas; Gabber/Lau** — Zhu bibliography[Kim13],[HP],[Lau13]. Hodge-type RZ representability, independence and perfect-ring contravariant Dieudonné equivalence.

- **Keel–Mori; Conrad; Ferrand; Yanagihara** — Zhu AppendixA references and correctedA.29–A.31 proof. Quotient existence, finite-flat covers, flatness descent and weakly normal models; full original proofs remain.

- **BBD; SGA4; Serre; Katz** — Zhu AppendixA.3 and§1 references. Constructible coefficients, rational decomposition, characteristic classes and bounded-position specialization.

- **Bhatt–Scholze, Projectivity of the Witt vector affine Grassmannian** — https://doi.org/10.1007/s00222-016-0710-4. Existing PAPER-BHATT-SCHOLZE-17 extraction supplies the later resolution of ConjecturesI/II; retain its explicit remaining proof gates.

### Provenance and validation

- **zhu17**: All90 PDF pages read, including introduction, §§1–3, AppendicesA–B and bibliography. Rendered and inspected printedpages412,413,417,421,422,424,429,436,437,440,448,451,453,455,459,461,463,468,478,479,480,482,483,485,488. SHA256 `5d50b415048f3a5ad14bccf1c8da83fc5a680fcf13b60911ca269daa474431a7`.
- **arxiv-v3**: PDF24,33,36,53–54 read for normalization and quotient-proof comparison; not the complete63-page version. SHA256 `2c23e397d21e84812daec2c637e2a763eec54ef0d784748eb74e3b2093de1e5b`.
- **arxiv-v2**: PDF42–43,47–48 read for earlier appendix statements and quotient-proof comparison; not the complete56-page version. SHA256 `6127701f61e6d97d05d7fe8133ceff98ae1755b715f6387c903c9bf83ee58c00`.
- **lusztig-yun-13**: PublishedPDF1–3,12–16,27–29 read: theorem statements, equal-characteristic sign proof, published7.3(2)/7.4 and references. Other pages, including the full twisted-Hecke setup, not read. SHA256 `5278b09a5c65c6481f41206f00df4fe1829d7545a687b6b0972e978ce2db4c49`.

The manifest records 402 verified repository blobs at `313b2edd3fdd78a865185b56a45417de4e22c972`. All pinned declaration imports retain module, statement span and SHA256. MC.6 has no reviewed audit entry in this snapshot. The relevant GS, EDC, BG and equal-characteristic stage/audit scopes were inspected. Search absence is not a universal absence proof.

The dependency graph has unique ids, resolved internal prerequisites and no cycles. Every missing/planned item is routed exactly once. Every definition/construction has at least three API statements and three acceptance cases. Source, repository-input and pinned-module digests were checked.

- **Noncommuting Witt chart factorization**: Five odd primes: X=Ag recovers integral g by A⁻¹X; XA⁻¹ contains −1/p². The displayed integral matrices have X0=[[-1,−1],[0,0]] and X1=[[1,0],[1,1]], satisfying the relevant first-coordinate open condition.

- **Determinant-normalizing unit**: For four primes and every nonzero residue unit, λ detX=p² forces detX=p² λ⁻¹ modulo p³; p=5,u=2 rejects the printed inverse convention.

- **Additive Koszul parity**: All four parity pairs checked; the printed multiplicative-sign exponent gives −1 even at the unit, whereas ε_A ε_B gives the correct unit and odd/odd signs.

- **IC and weight degree shifts**: For dimensions0–9 and21 weight degrees, C=IC[−d] restricts in degree0 and H_c^w(IC) has unshifted degree w+d. The smooth-curve IC[1] and dualizing[2](1) are distinct.

- **Involution trace forces scalar**: 66 eigenvalue-multiplicity cases verify that an involution with trace ±dimension has only that sign as eigenvalue. The characteristic-zero diagonalization theorem remains a proof obligation.

- **Minuscule inverse and Hodge frame**: At three primes, β=p makes β⁻¹(p) integral and (1/p)β⁻¹(p) nonintegral. For b=diag(1,p), V=diag(p,1) has mod-p image e2, distinct from the fixed μ(t)=diag(t,1) weight-one line.

- **Torus nonemptiness**: 49 valuation/coweight pairs: the torus ADLV condition is v(b)=μ. Since rho and defect vanish, the unqualified dimension formula would assign zero even to every mismatched empty space.

- **Isogeny-chain indexing and rank**: Tower ranges0≤i<h include the initial step and stop at h for eight h values. Forty rank cases distinguish full Dieudonné rank2hn from one τ-component rank n.

- **Ordered norm telescoping**: 81 pairs of unipotent frame changes verify the two-factor norm telescoping law with identity coefficient automorphism. This is an order diagnostic, not a proof of the Frobenius-semilinear theorem.

- **Top trace counterexamples**: The geometric component count of Spec F_(q²) is two. Constant and degree2/3/5 maps of P1 have top pullback multipliers0/2/3/5, refuting the asserted arbitrary-morphism trace identity; the geometric pullback-degree theorem is a separate imported proof.

- **Scope and provenance**: 217 unique acyclic items; 33 pinned declaration references; 402 repository blobs; 4 source digests. Every missing/planned item routed once and every definition/construction has APIs, tests and use sites. No self-review verdict.

The paper schema and intake deliverable-path checks pass. No Lean file was written or compiled; the issue authorizes only the result, report and handoff. Suggested module paths are future design destinations.
