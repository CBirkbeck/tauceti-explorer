# REV-PAPER-LIU-ZHU-17 — independent review

Reviewer: **Codex — codex-hjdg0j**, 26 September 2026. [Refs #1303](https://github.com/CBirkbeck/tauceti-explorer/issues/1303).

**Verdict: revise.** Accept routes 2–7, 10–11 and 13–15. Reject routes 1, 8, 9 and 12. The corrected extraction is partial: 129 items, comprising 16 library, 15 planned and 98 missing items. The earlier completion claim did not close the proof suppliers already listed as gaps.

This reviewer did not write or complete the extraction. Its recorded workers are codex-c83e7a and cc-442dc5. Earlier review files were not used as evidence; only the earlier closed PR's administrative history was checked for independence.

## Evidence and boundaries

All 35 pages of the final Liu–Zhu arXiv v3 were read independently. All 129 JSON item objects, every route, prerequisite and recorded source issue were checked. The human item register was matched to 816 already-read JSON clauses; this is a consistency check, not a second source reading. All 29 cited declarations were opened at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369, including their surrounding hypotheses; their complete statement ranges and blob hashes are in `independentReviewAudit.pinReads`.

| Source | Independent read (PDF pages, one-based) | SHA-256 |
|---|---|---|
| [LiuZhu17](https://arxiv.org/pdf/1602.06282v3) | 1–35 (whole paper) | `8b11e55bffbfb1835a6da8975272670c9465601c08640e06f3a566a459a1da79` |
| [Conrad](https://math.stanford.edu/~conrad/papers/locchar.pdf) | 35, 36 | `782fe71a3c7f26ccd67943d468f73540d384e2de5d474bf8369475b8b631d9bd` |
| [ScholzeErratum](https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf) | 1, 2, 3 | `3cfa56b9e3875c04240d97739dccd58091e41f714c101d5470b95172f73cb235` |
| [BergerColmez](https://www.numdam.org/item/AST_2008__319__303_0.pdf) | 8, 9, 10, 11, 13 | `f3343b4a612c4a8961bbda5a8b4ffb5b99fb52789c30f3cf3379b4780b533b86` |
| [KL2v1](https://arxiv.org/pdf/1602.06899v1) | 109, 110, 111, 112, 113, 131, 132, 133, 134, 135 | `288a26ff42fe45039a6c14dff1dbdeda05fb4ea0a7b232468ac63cb71e448471` |
| [KL2v3](https://arxiv.org/pdf/1602.06899v3) | 125, 126, 127, 128, 148, 149, 150, 151, 152 | `97383900492daf1c6778959c37e993f67dd5ad379ac03c31049b870382e5d42c` |

Berger–Colmez PDF pages 8–11,13 are printed pages 309–312,314; TS3 was also visually inspected. Conrad pages 35–36 contain the full B.4 proof. Scholze's three-page erratum was read in full and its corrected structural-period construction used. The KL2 comparison is deliberately limited to the finite-projective/decompleting and toric passages listed above. It does not review all pseudocoherent revisions or the supplier's proof interiors.

The [Caltech submitted manuscript](https://authors.library.caltech.edu/records/7hy40-ybp47/files/1602.06282.pdf?download=1) is byte-identical to v3. The [publisher record](https://link.springer.com/article/10.1007/s00222-016-0671-7) was checked, but its PDF endpoint served HTML. No published-text finding is asserted. The arXiv version history, available author links and title-plus-erratum/correction searches did not identify an applicable correction. This is not a proof of novelty. `sourceVersions` records the actual texts read.

The full upstream AdicSpaces README was read for this review. The upstream HodgeStructures README had been read in full by this worker in the immediately preceding Charles review and was reused only for ownership scope. The full PhiGammaModulesAndIwasawaCohomology, AdelicAlgebraicGroups and ReductiveGroupsPartII owner documents and both pending HodgeStructuresPartII briefs were checked. Every cited stage description was read, together with the adjacent R09.7, CP.3, AI.3, Perfectoid P8 and RD.0 boundaries. The current reviewed coverage entries consulted were AUDIT-01 SF.4; AUDIT-02 R02.1/R02.2; AUDIT-09 IG.0/IG.1; AUDIT-11 V4/V7/V8; AUDIT-20 BG0/BG2:uniformization; AUDIT-22 E2; AUDIT-26 L0. Some restructured stages have no reviewed coverage row; absence was not treated as positive evidence.

## Material extraction corrections

**A09, Lemma 3.11.** The paper compares

`H^i(Γ, RH^[a,b](L)(X_K) ⊗_A B) → H^i(Γ, RH^[a,b](f*L)(Y_K))`.

The original extraction instead moved the tensor outside cohomology for every finite period window. Those are different claims for nonflat maps. On p.26, the paper first chooses a common stabilized window whose H0 and H1 are already locally free; only there can A08 move tensor outside. A09 and A10 now preserve that order. The two-term complex `[Q[x] --x→ Q[x]]` explains the obstruction: H0 is zero before base change, but becomes Q after x=0 because H1 was not flat. This example diagnoses the omitted hypothesis; it does not refute the actual lemma.

**A08 and split clauses.** Flat short exact sequences stay exact under tensor; they need not split. The proof outline now uses exactness or Tor. A07V now uses procyclic cohomological amplitude and rational finite descent, including p=2, instead of a copied local-freeness argument. The already-separated tensor/unit/duality, cohomology, canonical-model/special-point, and torus-closure clauses have matching names and proof outlines.

**G01 and G21.** The mixed algebraic/rigid resolution aggregate is no longer credited wholly to SF.4. R09.7 supplies characteristic-zero algebraic resolution and qualified SNC compactification; the rigid analytic supplier and component argument remain missing. The generic Tannakian item is narrowed to the connected reductive analytic torsor theorem actually needed, with representability and local triviality left as proof obligations. It no longer depends on the special construction of G^c; that substitution belongs to its application.

**G12 and G12C.** Almost-everywhere unramifiedness uses global reciprocity and local units away from p. Potential crystallinity instead uses the algebraic character on open p-adic units and Conrad B.4(i), allowing an unramified factor. The copied proof outlines are separated accordingly.

## Route decisions

Acceptance below means the stated owner/design contract is suitable to build on. It does not certify that its future blueprint or recursively cited proofs have been completed. The rejected aggregates need changed contracts before activation.

### 1. PadicHodgeTheory — reject

The early period-ring and P8:local-rational destinations are appropriate for their local inputs, but this route also puts G23, a late comparison illustration depending on A15, into that early cut. G23 is not an exact theorem statement and its CM/moduli/Fermat suppliers remain unextracted. Separate that application, naming the later P8/CP comparison and moduli/motivic suppliers before accepting the whole route.

### 2. AdicEtaleGeometry — accept

A1/A2 cover the corrected analytic sites, finite-descent basis, coefficient systems and ringed pullback. Ordinary finite étale geometry and analytic differentials are imported from AdicSpacesPartII; no second carrier or generic derived-cohomology theory is introduced.

### 3. AdicSpacesPartII — accept

R0/R3 provide the analytic chart, finite-projective gluing and coherent-module setting. P18 is a source for the characteristic-zero analytic connection-to-local-freeness extension of that coherent API, with generic connection algebra imported from CR.1.

### 4. EnhancedDerivedSheaves — accept

E2 is the shared cohomological-limit/descent owner. P12 is explicitly local on coherent slices and keeps the Mittag–Leffler hypotheses; it does not assert repleteness or global quasi-compactness for every X.

### 5. DerivedDeRhamCohomology — accept

DD.1 is the shared Koszul/completion and Tor-controlled base-change owner. Use the commuting-endomorphism construction generally enough for the toric cochains. Corrected A08 asserts tensor exactness, not splitting of arbitrary flat extensions.

### 6. ArithmeticGaloisDuality — accept

R02.1/R02.2 are the topological-coefficient and continuous-descent extension. P17 and A02–A04 preserve topology, corrected generator quantifiers, bounded inverse estimates and rational finite descent at p=2. The existing continuousCohomology carrier and algebraic normalized trace are reused, not redefined.

### 7. CrystallineCohomology — accept

CR.1 owns the generic connection algebra underlying its crystalline specialization. H01 is an early ringed-differential-site interface; no equivalence of all integrable connections with quasi-nilpotent crystals is claimed.

### 8. HodgeTateAndCanonicalSubgroups — reject

The ordinary prefix of T6:comparison is the correct direction and does not require a competing RH roadmap. However, this route combines the precise Simpson/RH theorems with G08’s unqualified abelian Fontaine–Mazur supplier, the unresolved singular analytic resolution in A15/G01, and the unsplit ordinary/logarithmic/automorphic dependency boundary. A09 is corrected in place, but the route still needs exact external theorem contracts and an explicit early-prefix versus late-application import schedule before it is a buildable unit. G07 remains only a conjecture specification.

### 9. SchemeAndStackFoundations — reject

SF.4 does not own all of G01. Characteristic-zero algebraic resolution and the qualified SNC compactification already belong to AlgebraicModuliForArithmeticGeometry:R09.7; spreading belongs to model foundations. Rigid analytic resolution with component propagation is a distinct supplier whose statement is still missing. G01 is corrected from planned to missing as an aggregate; split and reroute its components.

### 10. InverseGaloisAndArithmeticFundamentalGroups — accept

IG.0/IG.1 are the finite-cover, arithmetic-inertia and specialization owners for G02–G04. Use the full finite étale algebra or monodromy components, retain tame/purity hypotheses and exclude p as well as divisors of |GL_n(Fp)|. No duplicate local-field ramification theory is planned.

### 11. ShimuraVarieties — accept

V4 supplies torus models/reflex reciprocity, V7 the actual all-datum canonical model, and V8 the tower. G17S is separately the special-point supply. The chosen geometric Artin normalization is compared with the arithmetic supplier, not silently equated.

### 12. ReductiveGroupsPartII — reject

RG2.0a constructs Weil restriction and RG2.5 integral dual groups. Neither names the real-split anisotropic central quotient together with the arithmetic adelic-closure/unit-lattice theorem. Use the existing ReductiveGroups torus/quotient carrier and identify a qualified extension; AdelicAlgebraicGroups AA.1–AA.3 supplies the arithmetic topology/reduction inputs. Do not create another quotient owner merely from the broad roadmap title.

### 13. BunGAndNewtonStrata — accept

BG0 supplies analytic torsor/Tannakian reconstruction in the connected reductive case now stated in G21; BG2:uniformization supplies the pointwise B(G^c) classification application. Keep BG0’s generic theorem before G20 and G22; the latter consumes the RH torsor and RF4/VB classification. This does not supply a lift to B(G).

### 14. HodgeStructuresPartII — accept

Reuse the existing HodgeStructuresPartII candidate and its two source briefs. Its shared early Higgs/parameter-connection algebra is independent of the complex comparison and the p-adic consumers; the parent already owns the fiberwise Hodge and period-domain-point algebra.

### 15. PhiGammaModulesPartIIGeometricTowers — accept

The parent explicitly excludes geometric multivariable towers; PG.7’s arithmetic affinoid-family theorem is different. The continuation gives an exact Lemma2.14 endpoint and the needed strict theta/cochain/descent intermediates. Reuse AI.3’s overlapping geometric toric-cover construction and the parent annulus carriers. The independently compared KL2 v1/v3 finite-projective passages retain this endpoint; unread supplier interiors remain explicit design work.


The required dependency direction is: shared algebra and sites → geometric tower descent and continuous cohomology → ordinary Simpson/RH → de Rham rigidity → global/Shimura applications. HodgeStructuresPartII's early Higgs/parameter-connection API must be available independently of its complex comparison. BG0's generic torsor theorem precedes the RH application; the late BG2 classification consumes it. Early P8:local-rational must not consume the later proper comparison. These cuts are requirements on future scheduling; the item-DAG check does not prove a global atlas DAG.

## Missing-item and overlap search

Every missing item, including reclassified G01, assigned an independent keyword profile across both pinned Lean trees, current owner documents, registered roadmaps, packets and paper candidates. Relevant positive hits were inspected: BDeRham supplies only the underlying carrier; algebraic normalizedTrace lacks bounded cyclotomic completion; IsKrasner is a field lemma, not finite Shilov-boundary descent; topological LocalCoefficientSystem is not a p-adic analytic étale local system; finite-group Tannaka and Hopf-comodule reconstruction do not give the analytic torsor theorem. The newly reclassified G01 was also searched: the pinned spreading lemma extends a stalk morphism under finite-type/germ-injectivity hypotheses, not resolution of singularities or the arithmetic spreading package. No claim of machine-proved absence.

Checked PG.7 versus geometric toric towers; the HodgeStructuresPartII/Cartier-flow boundary; Guo–Reinecke crystalline/prismatic local systems; the integral prismatic RH candidate; Howe–Klevdal admissible pairs; Pan locally analytic completed cohomology; Betts–Stix period pairs. None supplies the whole ordinary Liu–Zhu theorem or geometric decompletion endpoint as an existing stage.

| Search profile | Items | Library files / atlas files matched |
|---|---|---|
| resolution | G01 | 1 / 101 |
| local_system | P03, G02 | 1 / 144 |
| perfectoid | P07, T18 | 15 / 176 |
| period_sheaf | P09, P10, P11, T03, T23, R01, R02, R03, R04, R05, R06, R07, R08 | 1 / 142 |
| etale_descent | P13, P14, P15 | 5 / 70 |
| connections | P18, H01, H02, H03, R16 | 3 / 48 |
| toric_tower | T02, T04, T05, T06, T07, T08 | 0 / 13 |
| simpson | T01, T09, T10, T11, T12, T13, T14, T15, T16, T17, T19, T20, T21, T24, T25, T26, T27, T11C, T16V, T21D, T25H | 11 / 49 |
| riemann_hilbert | R09, R10, R11, R12, R13, R14, R15, R10V, A16R | 0 / 18 |
| tate_sen | A02, A03, A04 | 6 / 22 |
| arithmetic_realization | A01, A05, A06, A07, A09, A10, A11, A12, A13, A14, A15, A16, A07V, G05, G06 | 1 / 102 |
| flat_base_change | A08 | 67 / 289 |
| ramification | G03, G04 | 180 / 435 |
| fontaine_mazur | G07, G08 | 0 / 13 |
| torus_reciprocity | G11, G12, G12C, G13 | 0 / 77 |
| central_quotient | G14, G15, G15C | 49 / 119 |
| shimura_stalk | G18, G19, G20 | 0 / 18 |
| tannakian | G21, G22 | 33 / 139 |
| illustrations | G23 | 1 / 125 |

All 98 missing items are covered by these profiles, including reclassified G01. Counts describe keyword matches, not implementations. The positive hits were inspected at their actual scope. PG.7's arithmetic affinoid-family result is not the geometric multivariable toric theorem. AI.3's overlapping geometric cover must be imported. The Guo–Reinecke crystalline/prismatic local-system candidate and the integral prismatic RH candidate have different coefficient and comparison contracts; their presence does not supply the ordinary Liu–Zhu functor automatically. HodgeStructuresPartII is reused as an existing candidate rather than proposed twice.

## Source findings

All twelve inherited findings are confirmed with scope corrections to E08 and E11. E13–E15 are added. Confirmations apply only to the fully read arXiv v3. E06 and E13 concern proof assertions, and E10 concerns an ancillary lift; none is stated as a counterexample to a main rigidity theorem.

### E01 — misprint, confirmed

arXiv1602.06282v3; Lemma2.10 proof,PDF13

Confirmed in the proof on p13. For r=0 the printed sum is empty; V is the correct primitive. The general telescoping formula and 25 independent rational polynomial identities verify the r+1 endpoint.

**Repair:** Use the upper bound r+1 under the printed assumption (γ−1)^(r+1)w=0.

### E02 — misprint, confirmed

arXiv1602.06282v3; θ display after(2.13),PDF14

Confirmed at the p14 theta display. The Ainf(U) map lands in the completed ring of U, not U_j. The corrected structural construction in Scholze’s three-page erratum was independently read.

**Repair:** The target is hatO_X+(U), or R+ for the completed affinoid perfectoid U, with [1/p] giving R in the later completed formula.

### E03 — misprint, confirmed

arXiv1602.06282v3; Last display and sentence,PDF15

Confirmed on p15. In the closed embedding with n=2,m=1, the second source coordinate must vanish; the printed i>n rule cannot do this.

**Repair:** For n source variables and m target variables, use i≤min(m,n); in a closed embedding kill V_i for m<i≤n. For a smooth projection m≥n retain all source variables.

### E04 — misprint, confirmed

arXiv1602.06282v3; Lemma3.1,PDF20

Confirmed on p20. Cohomological degree and truncation length must be independent: at i=0 the printed quotient is zero, whereas the subsequent induction concerns every positive truncation.

**Repair:** Separate q, the cohomological degree, from n≥1, the truncation index. State H^q of BdR+/t^n as sections for q=0 and0 for q>0.

### E05 — misprint, confirmed

arXiv1602.06282v3; Theorem3.8(iv) statement,PDF23 and proof,PDF24; Lemma3.11,PDF27

Confirmed in the p23 theorem statement and p27 lemma. A local system on X pulls back along Y→X. The locator is corrected to distinguish the p23 statement from the p24 proof.

**Repair:** Use f:Y→X, so A→B and pullback of L to Y agree with every subsequent formula.

### E06 — error, confirmed

arXiv1602.06282v3; Lemma3.10 statement and proof,PDF25; repeated in Lemma3.11,PDF27

Confirmed in arXiv v3 only. For p=3 and χ(γ)=1+3^(m+1), a nonzero class from k_(m+1)/k_m is fixed. The independently inspected Berger–Colmez TS3 page has n(γ)≤n. A generator at a stable level supplies the intended scalar inverse; the finite-module Neumann argument remains a proof obligation.

**Repair:** For the cohomology proof select a generator of Gal(k∞/k_m), with v_p(χ(γ)−1)=m after stable indexing. The scalar Tate–Sen inverse bound applies when n(γ)≤m; retain the additional small-action requirement in the finite-module perturbation argument. Do not quantify over all deeper elements.

### E07 — misprint, confirmed

arXiv1602.06282v3; Proposition4.1 proof,PDF29

Confirmed only as the fraction-field/connectedness slip. A constant rank-one F3 system has a two-component frame torsor. It is still a valid GL1(F3)-torsor; the finding does not deny its specified torsor action.

**Repair:** Use normalization in the total finite étale algebra of the frame torsor, or work with each connected component and its actual monodromy subgroup.

### E08 — misprint, confirmed

arXiv1602.06282v3; Congruence-level paragraph,PDF33

Confirmed narrowly as the preposition misprint “of” versus “in”. The source does not explicitly claim a neighborhood basis, and no false basis theorem is attributed to it.

**Repair:** Replace “of G(Qp)” by “in G(Qp)”: these are open normal congruence kernels in K_p, sufficient for the associated finite sheaves. No identity-basis assertion is needed.

### E09 — misprint, confirmed

arXiv1602.06282v3; Example4.7,PDF33

Confirmed in Example4.7. The rational Betti local system is singular homology; its de Rham realization is a vector bundle, not that rational locally constant carrier.

**Repair:** The Betti local system is first singular homology with Q coefficients; de Rham homology is its vector-bundle comparison realization after the appropriate scalar extension.

### E10 — gap, confirmed

arXiv1602.06282v3; Remark4.1(iii),PDF34

Confirmed as the unprovided lift in the ancillary remark. The preceding functor is on Rep(G^c), so it supplies G^c structure. A B(G) output needs additional G-level data. This does not refute Theorem1.2.

**Repair:** The tensor construction explicitly available in the preceding paragraph yields a class in B(G^c_Qp). To assert a class in B(G_Qp), supply a G-level lift and prove its existence/choice properties, or assume G=G^c.

### E11 — misprint, confirmed

arXiv1602.06282v3; First paragraph,PDF31

Confirmed narrowly as a map-label slip in the first p31 sentence. The preceding full reciprocity map already provides the construction, and the paragraph explicitly reuses notation.

**Repair:** Restrict the full inverse-limit map r(μ), then use that its image is in K/(K∩closure). Reserve r(μ)_K in(4.3) for the finite quotient map, or explicitly redefine the notation.

### E12 — gap, confirmed

arXiv1602.06282v3; Proposition4.1 proof,choice of N onPDF29 and tame-inertia deduction onPDF30

Confirmed for the rank-one case: p−1 does not exclude p, while |GL1(Z/p²)|=p(p−1). Enlarging the spreading integer by p repairs the tame argument without changing the almost-everywhere conclusion.

**Repair:** Also require p to divide N before asserting that every surviving residue characteristic is prime to |GL_n(Z/p^m)|. Enlarge N by p; this is harmless to the almost-everywhere conclusion.

### E13 — error, confirmed

arXiv1602.06282v3; Lemma4.4 proof,PDF31, local multiplicative-group display

Independently checked against the downloaded preprint, with the mathematical certificate stated above. No claim about the published text.

**Repair:** Use the formula on an open subgroup of local units/inertia, with the chosen Artin normalization. Apply Conrad B.4(i); retain the possible unramified factor in a chosen Lubin–Tate description.

Take T=Gm, F=Q, μ=id, K=∏_ℓ Z_ℓ× and ρ(z)=z². The rational closure intersection in K is {±1}, which ρ kills, and F_K=Q. A continuous one-dimensional Qp representation of the compact Galois group has valuation-zero image. At a local uniformizer p, the displayed algebraic formula gives p² of valuation 2 (or −2 with inverse convention), so it cannot hold on all Qp×. Its restriction to units is the input needed for potential crystallinity. The conclusion of Lemma4.4 is not refuted.

### E14 — misprint, confirmed

arXiv1602.06282v3; §3.1 final paragraph,PDF20, finite quotient sheaf formulas

Independently checked against the downloaded preprint, with the mathematical certificate stated above. No claim about the published text.

**Repair:** Use B_dR^+/t^i, as in the preceding definition and Lemma3.1, in both finite-quotient formulas.

For i≥1, t is invertible in B_dR, so B_dR/(t^i)=0. The intended first quotient is B_dR^+/(t)=K, and the paragraph uses these nonzero truncations to construct the plus sheaf.

### E15 — misprint, confirmed

arXiv1602.06282v3; §3.1 final paragraph,PDF20, analytic-to-étale comparison morphism

Independently checked against the downloaded preprint, with the mathematical certificate stated above. No claim about the published text.

**Repair:** Use λ:(X_K)_et→(X_K)_an for the period-base sheaves just constructed.

The preceding sheaves are defined on (X_K)_et, and Proposition3.3 and Corollary3.4 use the analytic and étale sites of X_K. The displayed X-sites would not give that restriction functor without an additional base-change operation.


Two qualifications prevent overstatement. In E08, “system” does not assert a neighborhood basis; only the printed preposition is corrected. In E11, “still denoted” explicitly announces notation reuse; the full reciprocity map exists, so this is a map-label slip. The frame cover in E07 remains a valid GL torsor despite being disconnected.

Conrad B.4(ii) is not accused of omitting an unramified twist: products of Lubin–Tate characters may use different uniformizers. Its unit criterion B.4(i), which is all the application needs, is retained. Likewise, the generic t-connection requires the conventional division by t, already stated in the extraction; and P12 already works locally on coherent slices. These are not additional source findings.

## Complete change log

- `L40` (statement): Disambiguate the order of the split maps.
- `A08` (proofSteps): Flat exact sequences need not split; use their tensor exactness.
- `A09` (statement, prerequisites, proofSteps): Restore the actual statement of Lemma 3.11: tensoring stays inside cohomology.
- `A10` (prerequisites, proofSteps): Separate the all-window coefficient comparison from flat base change for stabilized windows.
- `A07V` (prerequisites, proofSteps): Use the cohomological amplitude argument rather than the copied local-freeness proof.
- `G01` (status, note): SF.4 does not provide the entire mixed algebraic/rigid-resolution aggregate.
- `G12` (name, prerequisites, proofSteps): Replace the copied potential-crystallinity proof by the unramifiedness proof.
- `G12C` (proofSteps): Only the inertial/open-unit formula is used; keep the unramified factor.
- `G13` (proofSteps): Make the unit criterion and harmless unramified ambiguity explicit.
- `G21` (statement, prerequisites, proofSteps): Use the connected reductive analytic case actually consumed; remove the spurious dependency on the special central quotient.
- `T11` (name, proofSteps): Synchronize the already split clauses, names and proof outlines.
- `T11C` (name, proofSteps): Synchronize the already split clauses, names and proof outlines.
- `T21` (name, proofSteps): Synchronize the already split clauses, names and proof outlines.
- `T21D` (name, proofSteps): Synchronize the already split clauses, names and proof outlines.
- `R10` (name, proofSteps): Synchronize the already split clauses, names and proof outlines.
- `A16` (name, proofSteps): Synchronize the already split clauses, names and proof outlines.
- `G17` (name, proofSteps): Synchronize the already split clauses, names and proof outlines.
- `G17S` (name, proofSteps): Synchronize the already split clauses, names and proof outlines.
- `G15` (name, proofSteps): Synchronize the already split clauses, names and proof outlines.
- `G15C` (name, proofSteps): Synchronize the already split clauses, names and proof outlines.
- `T25` (name, proofSteps): Synchronize the already split clauses, names and proof outlines.
- `T25H` (name, proofSteps): Synchronize the already split clauses, names and proof outlines.
- `G10,G11 and split clauses` (sources): Synchronize child source locators with the corrected item locators.
- `baseline reductive predicate` (statementRead, lastLine): Restore the truncated consequent I = augmentation in the recorded declaration statement.

In addition to these local item changes, every source finding now has its independent verdict and version boundary; E13–E15 and `sourceVersions` are added; route 15 explicitly imports AI.3 and records the bounded KL2 collation; all fifteen routes have decisions; status, summary, gap dispositions and validation reflect this review. The baseline reductive predicate transcript now includes its previously omitted consequent. The human extraction report is synchronized with the corrected register rather than retaining its superseded completion claim.

## Validation and remaining work

The repository checker passed. Independent structure checks verified 129 unique IDs, 98 missing items routed exactly once and searched independently, 15 route decisions, 15 source verdicts, all 29 cited declaration ranges, and API/tests/uses for all 50 definition/construction items. All 50 recorded use targets resolve. The explicit item graph has 261 edges and is acyclic. These mechanical checks do not establish mathematical truth or recursive closure.

Forty-five bounded diagnostics passed: 25 exact rational binomial-polynomial identities, the r=0 counterexample, nine cyclotomic-level integer witnesses, four rank-one GL orders, the disconnected-product example, two uniformizer valuation checks, parameter rescaling, and the two algebraic certificates for nonflat base change and the period quotient. The last two are mathematical arguments recorded by the script; the cyclotomic degree theorem and analytic cohomology are not proved by these computations. No Lean file is required by this review and none was compiled.

Main was refreshed at `563a8bb8a5c82e708e729b904dc9f99947565221`. The original extraction and report were unchanged; the current stage/owner and relevant competing packet changes were checked. The new source-version requirement was applied. Only the four deliverables authorized by #1303 are changed.

The next extraction pass must split G01 and repair routes 1, 8, 9 and 12, give exact declarations and hypotheses for G08/G21 and the CM/Fermat illustrations, and close the supplier work below. Do not turn a source citation or once-only routing into a proof of closure.

- **GAP01 (unavailable):** All35 pages of final arXivv3 were read; Caltech submitted copy has identical bytes. Bibliography/title/abstract match the published53-page article, but the full version of record was not obtained. Compare theorem statements, proofs and E01–E12 against the published text before claiming published-source coverage. Unresolved at independent review; preserve the original remaining-work statement. Deferral alone is not closure.
- **GAP02 (open):** T04–T06,R04,A05,A11,G01,G08,G21 and related external interfaces still combine several declarations. Fully split the original-source definitions, hypotheses and proof DAG. All current missing contracts are routed, but this is not complete mathematical closure. Unresolved at independent review; preserve the original remaining-work statement. Deferral alone is not closure.
- **GAP03 (open):** KL2v1 PDF109–113 and131–135 were read, not the full170-page supplier. Read the general perfect/imperfect ring definitions, topological tensor and analytic-cochain prerequisites; compare to the current version. Read KL1 Theorems2.6.5(a),9.2.15 and their descent/acyclicity dependencies. No v1-to-current equivalence is assumed. Independent review compared the finite-projective/decompleting passages with KL2v3 (PDF125–128,148–152); this bounded comparison is done. The original ring definitions, analytic cohomology and other proof interiors remain open. Unresolved at independent review; preserve the original remaining-work statement. Deferral alone is not closure.
- **GAP04 (open):** BC printed309–312 and314 were read; TS3 inequality was visually confirmed. Finish the norm-controlled tensor perturbation and Neumann inverse for arbitrary finite affinoid modules, the procyclic Banach cohomology comparison, finite rational descent and completed/algebraic tensor comparison. Check all A08–A11 flatness and period-window induction details. A09 now keeps tensor inside cohomology for arbitrary finite windows. A10 uses flatness only for a common stabilized window; this repairs the extracted statement but does not supply the remaining Banach quotient proof. Unresolved at independent review; preserve the original remaining-work statement. Deferral alone is not closure.
- **GAP05 (open):** Read the exact Krasner/Shilov/Ax–Sen–Tate suppliers, Kiehl/finite-projective descent and coherent-connection local freeness. Pin a suitable rigid resolution theorem and write the component-incidence propagation argument for connected singular spaces; a resolution need not be connected. Unresolved at independent review; preserve the original remaining-work statement. Deferral alone is not closure.
- **GAP06 (open):** Close purity and tame-specialization along vertical divisors, arithmetic section avoidance and the disconnected frame-cover normalization. Read torus unit-lattice/discreteness, all-datum canonical models, special-point density and Tannakian analytic reconstruction. ConradB4(i) was read in full, but its p-divisible/Lubin–Tate inputs and CM/Shioda–Katsura alternatives remain recursive suppliers. Unresolved at independent review; preserve the original remaining-work statement. Deferral alone is not closure.
- **GAP07 (resolved for arXiv v3):** Independently review E01–E12, especially the explicit cyclotomic counterexample E06 and the ancillary G versus G^c lifting gap E10. Verify publication status and preserve the bounded errata search. No main rigidity theorem is claimed refuted. This independent review checked all original findings and added E13–E15. Published collation remains GAP01.
- **GAP08 (downstream):** No Lean file was supplied or compiled for this paper issue. Candidates are proposed directions, not existing stages. Produce declaration signatures, source-qualified proofs, meaningful tests and planets in the later design; numerical and schema checks are not formalization. A paper review has no Lean deliverable. No compilation was attempted or claimed. This is not itself a mathematical closure defect.
