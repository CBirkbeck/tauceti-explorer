# RT-PAPER-PAN-26: red team of the extraction of Lue Pan, *On locally analytic vectors of the completed cohomology of modular curves II*

Red team: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #4320).

**Target.** `PAPER-PAN-26` extracts L. Pan, *On locally analytic vectors of the completed cohomology of modular curves II*, [Ann. of Math. 203 (2026), 121–281](https://doi.org/10.4007/annals.2026.203.1.3), read in arXiv:2209.06366v1. The extraction has:

- 273 items: 267 missing, 6 planned, none library;
- 10 routes: a Part II (`LocallyAnalyticCompletedCohomology`, parent CompletedCohomologyAndLocalGlobalCompatibility) and nine source routes;
- 3 source issues, E1–E3.

**Who did what.**

- Claude Code `cc-fb70e5` wrote the extraction (issue #2168, PR #2223).
- Claude Code `cc-7b31c4` wrote `REV-PAPER-PAN-26` (issue #2169, PR #2369). It accepted all ten routes and E1–E3, fixed the Part II title's en dash and item /553's page.
- I did neither. The string `cc-f805bf` occurs in none of the four target files.

**Disclosure.**

- This session filed **RT-PAPER-BREUIL-HELLMANN-SCHRAEN-19** (PR #4759).
  - Its /17 recorded that make_queue merges BHS19's route 3 with Pan's Part II. **Finding 1** extends it: DESIGN-PAN plans Pan's Part II a second time. It does not repeat /17.
  - Its /3 said almost de Rham items belong in a PadicHodgeTheory Part II. **Finding 3** applies that to Pan's items, which /3 did not examine.
  - Its /5 said completed cohomology is owned by CompletedCohomologyPartII CC.2/CC.5/CC.8. Pan's items cite that correctly, so there is no finding here.
- This session reviewed **PAPER-FARGUES-FONTAINE-18** (PR #4683). Finding 3 cites its accepted route 5 as the existing PadicHodgeTheory Part II.
- This session reviewed **PAPER-SCHOLZE-17** (PR #4688). No finding touches it.

**Result: 14 findings: 1 high, 8 medium, 5 low.** The machine-readable file is [RT-PAPER-PAN-26.result.json](RT-PAPER-PAN-26.result.json).

- **Where the work is sound.**
  - Every numbered result has an item, and the locators are nearly all right.
  - E1–E3 are correct. E1 and E2 were checked on page images.
  - The main theorem (/2) is stated exactly.
  - Completed cohomology is owned correctly.
  - The route order has no cycle.
- **Where it breaks.**
  - *Queue mechanics.* The Part II is designed twice.
  - *Owners.* Six of the nine source routes name layers that do not plan what is sent to them. Some of that material is already planned elsewhere, in the atlas or by accepted extractions.
  - *Imported inputs.* The theorems the proofs import, above all Pan I, have no items.
  - *Hypotheses and misprints.* A few items copy misprints or drop hypotheses. One copied misprint, in Prop. 6.1.20, empties the item.

## Source

| Text | Where | SHA-256 |
| --- | --- | --- |
| arXiv v1 (14 September 2022), 127 pp., the only version | [arxiv.org/pdf/2209.06366v1](https://arxiv.org/pdf/2209.06366v1) | `0873b61a…1027b31b4` (matches) |
| Published article, Ann. of Math. 203(1) 121–281 | [doi:10.4007/annals.2026.203.1.3](https://doi.org/10.4007/annals.2026.203.1.3) (landing page only) | not obtained (paywalled) |

- Both were fetched on 30 September 2026.
- **Later versions and errata.**
  - The arXiv API lists only v1, and `/abs/2209.06366v2` returns 404.
  - The Project Euclid page gives *Received 12 October 2022, Revised 4 November 2024, Accepted 22 November 2024*.
  - Crossref lists no update or relation for the DOI.
  - The published text was revised after v1 and could not be read. The source-mistake findings (10, 12) therefore say the published version may already correct them.
- **How I read it.**
  - Six parallel readers covered every line of v1: §§1–3, §4, §§5.1–5.4, §§5.5–5.6, §6, and §7 with the bibliography.
  - I re-checked every quoted passage myself. Pages 8, 24, 35, 38, 42, 61, 67, 80–82, 91, 117 and 124 were checked on rendered images.

## The main theorem, for the record

- Theorem 1.1.2 = 7.1.2 holds for any prime p.
- E/Q_p is finite.
- ρ : G_Q → GL₂(E) is continuous and absolutely irreducible, and it occurs in H̃¹(K^p, E).
- ρ|G_{Q_p} is de Rham with Hodge–Tate weights 0 and k > 0.
- There is no p ≥ 5 condition, no residual hypothesis, and nothing about irregular weights (0, 0).
- Item /2 is exact.
- Colmez's correspondence and Paškūnas's work are not used in the proof. Emerton's local–global compatibility appears only in Remarks 7.3.6–7.3.11.

## High

### 1. Pan II is designed twice: DESIGN-PAN and the grouped Part II job

- **Kind:** duplicate.
- **Where:** research/blueprint/papers/PAPER-PAN-26.result.json: route 1 (part-ii, parent CompletedCohomologyAndLocalGlobalCompatibility, roadmap LocallyAnalyticCompletedCohomology, 206 items); research/blueprint/make_queue.py paper_designs; research/blueprint/queue.json jobs DESIGN-PAN and DESIGN-CompletedCohomologyAndLocalGlobalCompatibilityPartII.

**What is wrong.**

Route 1 plans Pan II's mathematics a second time. Its reason says it is 'carried here, to the same roadmap id and with the same parent', LocallyAnalyticCompletedCohomology, so that it lands in DESIGN-PAN. The queue generator does not do that. paper_designs groups Part II proposals by parent only, so route 1 becomes part of a separate job, DESIGN-CompletedCohomologyAndLocalGlobalCompatibilityPartII. That job would create a roadmap CompletedCohomologyAndLocalGlobalCompatibilityPartII from five accepted proposals: Pan route 1 (206 items), BHS19 route 3, Ding 25 route 4, Newton–Thorne 21 route 4 and Böckle–Iyengar–Paškūnas 23 route 7. At the same time, DESIGN-PAN (roadmap LocallyAnalyticCompletedCohomology) is pending with PAN_BRIEF. That brief asks for 'every main theorem' of Pan II, and of Pan I as its foundation, to be covered completely, and it never mentions this extraction. Both jobs are pending in queue.json. Two roadmaps would therefore plan the same material: the horizontal Cartan action and the O^la weight sheaves, the operators d, d-bar and I_k, their comparison with the Fontaine operator, and the spectral decomposition and classicality. Their titles are almost identical: 'Completed cohomology and p-adic local–global compatibility over Q, Part II' and the same with ': locally analytic vectors'. This is the duplication that PROTOCOL §15 forbids. The review accepted route 1 on the strength of the same-roadmap-id reasoning. Disclosure: RT-PAPER-BREUIL-HELLMANN-SCHRAEN-19/17, filed by this session, already recorded that make_queue merges BHS19 route 3 with Pan's Part II. It did not notice that DESIGN-PAN plans Pan's Part II separately. This finding adds that point and does not repeat /17.

**Evidence.**

research/blueprint/make_queue.py (at origin/main debb44ce): line 416 docstring 'Every Part II proposal for the same parent, from whichever paper, becomes one job planning a single "<parent>, Part II"'; line 423 'key = ("part-ii", route["parent"]) if route["route"] == "part-ii" else ("new", route["roadmap"])'; line 434 'part, rid, built = "Part II", base + "PartII", ""'; line 922 '("DESIGN-PAN", "LocallyAnalyticCompletedCohomology", "langlands", PAN_BRIEF, None)'; line 925 'designs += [d for d in paper_designs(calls, roadmaps) if d[0] not in {x[0] for x in designs}]', which deduplicates by job id only, and the ids differ. PAN_BRIEF (line 373): 'Cover both papers completely, every definition and key theorem they use or prove. The roadmap is "Completed cohomology and p-adic local–global compatibility over Q, Part II: locally analytic vectors"'. research/blueprint/queue.json: 'DESIGN-PAN' state pending, roadmapIds ['LocallyAnalyticCompletedCohomology']; 'DESIGN-CompletedCohomologyAndLocalGlobalCompatibilityPartII' state pending, name 'Completed cohomology and p-adic local–global compatibility over Q, Part II'. The accepted part-ii routes with parent CompletedCohomologyAndLocalGlobalCompatibility are PAPER-PAN-26 route 1, PAPER-BREUIL-HELLMANN-SCHRAEN-19 route 3, PAPER-DING-25 route 4, PAPER-NEWTON-THORNE-21 route 4 and PAPER-BOCKLE-IYENGAR-PASKUNAS-23 route 7. Route 1 reason: 'the items are carried here, to the same roadmap id and with the same parent, rather than to a new target … When DESIGN-PAN has run, a reviewer should re-express this route as a source route naming that roadmap's layers.'

**Fix.**

Maintainer: make the queue send Pan's route 1 to DESIGN-PAN and not to the grouped job. For example, when a part-ii route's roadmap id equals a hand-coded design's roadmap (LocallyAnalyticCompletedCohomology), add its brief and items to that design's prompt and leave it out of paper_designs. Give DESIGN-PAN's prompt the pointer to research/blueprint/papers/PAPER-PAN-26.result.json, route 1, so that its 206 items and the three source issues are used. Remove Pan from DESIGN-CompletedCohomologyAndLocalGlobalCompatibilityPartII, which keeps the BHS19, Ding, Newton–Thorne and BIP proposals; see RT-PAPER-BREUIL-HELLMANN-SCHRAEN-19/17 on whether those belong under this parent. In the extraction, add to route 1's reason that the route is meant for DESIGN-PAN and not for a grouped Part II of the parent.

## Medium

### 2. Section 2 goes to LocallyAnalyticDistributions, which does not plan locally analytic vectors of representations

- **Kind:** error.
- **Where:** research/blueprint/papers/PAPER-PAN-26.result.json: route 2 (source, LocallyAnalyticDistributions L0–L2), items /100–/116; route 9 item /357.

**What is wrong.**

Route 2 sends §2 of the paper to LocallyAnalyticDistributions L0–L2, which plan none of it. §2 covers locally analytic vectors of representations of p-adic Lie groups on Banach and Hausdorff LB-spaces: G_n-analytic vectors, V^la as an LB-space, Prop. 2.1.5, compact-type criteria, the derived functors R^i LA and LA-acyclicity. L0 constructs Banach spaces of locally analytic functions on a compact X and the topology on C^la(X,K). L1 is Amice's transform on Z_p. L2 is admissible growth of distributions. None of the three has a group representation, its analytic vectors, LB-space representations or derived locally analytic vectors. The atlas owner of this theory is the new roadmap LocallyAnalyticRepresentationsOfLocalGroups, created by the accepted routes PAPER-DING-25 route 1 and PAPER-DOSPINESCU-LEBRAS-17 route 3. Its design job is pending. The DLB17 brief puts there the density of locally analytic vectors in admissible Banach representations and representations of compact type. Route 9 has a similar gap. Item /357 is the locally analytic induction from B to GL_2(Q_p), and route 9 sends it to SmoothRepresentationsOfLocalGroups SR.2, although the route's reason admits 'the locally analytic version, which the layer does not plan'. Locally analytic induction also belongs with LocallyAnalyticRepresentationsOfLocalGroups; Ding's brief puts Emerton's closed induction I_{P^-}^G there.

**Evidence.**

Paper §2.1.1–2.1.6, pp. 11–13: 'The subspace of locally analytic vectors in V is defined as the inductive limit lim V^{G_n−an} and will be denoted by V^la. This is a Hausdorff LB-space' (p. 13). Atlas extract research/blueprint/atlas/roadmaps/LocallyAnalyticDistributions.json: L0 'Construct the Banach spaces of functions analytic on every residue ball of a fixed radius, with their Gauss norms … Define the locally convex inductive-limit topology on C^la(X,K). Construct its continuous dual'; L1 'Prove RJW Theorem 3.43: the Amice transform identifies distributions on Z_p with power series'; L2 'Define order-h admissibility by explicit norm estimates'. PAPER-DOSPINESCU-LEBRAS-17 route 3 (accepted), brief: 'the distribution algebra D(H), Fréchet–Stein algebras and coadmissible modules … and the density of locally analytic vectors in admissible Banach representations … for a locally analytic representation W of compact type'. PAPER-DING-25 route 1 (accepted) brief: 'construct Emerton's locally analytic Jacquet functor J_B and the closed induction I_{P^-}^G'. SmoothRepresentationsOfLocalGroups SR.2: 'Construct smooth induction from closed subgroups and compact induction'. Route 9 reason: 'the locally analytic version, which the layer does not plan'.

**Fix.**

Re-route items /100–/116 to LocallyAnalyticRepresentationsOfLocalGroups. Because it is not yet registered, add them as a 'new' route with roadmap id LocallyAnalyticRepresentationsOfLocalGroups and title 'Locally analytic representations of p-adic reductive groups', exactly as Ding and DLB17 do, so that make_queue merges them into that design. The brief should ask for locally analytic vectors in Banach and Hausdorff LB representations, Prop. 2.1.5, the compact-type criteria (Prop. 2.2.3, Cor. 2.2.4, Lemma 2.2.5) and R^i LA with (strong) LA-acyclicity (Prop. 2.3.6). Move item /357 to the same route and keep /356 on route 9. Drop route 2, or keep it only for /107 (compactness of restriction between Tate algebras) if L0's packet wants it.

### 3. Fontaine's almost de Rham theory is a source route to R06.1, which does not plan it

- **Kind:** error.
- **Where:** research/blueprint/papers/PAPER-PAN-26.result.json: route 5 (source, PadicHodgeTheory R06.1), items /20, /451–/465.

**What is wrong.**

Route 5 is a source route for material that, by the route's own reason, no layer plans: Fontaine's classification of almost de Rham B_dR^+/(t^k)-representations in Banach and LB form, the decompletion propositions, Definitions 6.1.9 and 6.1.13 (the Fontaine operator), and Theorem 6.1.16 (N_W = 0 if and only if V is de Rham). R06.1 constructs the period rings B_dR^+, B_dR, B_cris and B_st and their properties. It has no representation category, no Sen theory and no Fontaine operator. PROTOCOL §16 uses 'source' when 'it belongs inside existing layers'. Material that 'needs new layers in the direction of an existing roadmap' is a part-ii route. The accepted routes already have a PadicHodgeTheory Part II job, DESIGN-PadicHodgeTheoryPartII (pending), fed by PAPER-FARGUES-FONTAINE-18 route 5. That route carries Rep_{B_dR}(G_K) (its item 941) and de Rham equivariant bundles. As a source route, Pan's classification would instead go to R06.1's blueprint as an extra instruction to a stage that does not plan it. That leaves it without a named owner and puts it beside the Part II that owns B_dR-representations. Disclosure: RT-PAPER-BREUIL-HELLMANN-SCHRAEN-19/3, filed by this session, made the same point for BHS19's almost de Rham items, which were sent to P7. It proposed a PadicHodgeTheory Part II merged with Fargues–Fontaine route 5. This finding applies that point to Pan's items, which were not examined there.

**Evidence.**

Route 5 reason: 'What this paper adds, and what no layer of the atlas currently plans, is Fontaine's classification of almost de Rham B_dR-representations in the generality the applications need'. PadicHodgeTheory R06.1 (atlas extract): 'Construct B_dR^+, its filtration and B_dR, B_cris^+, B_cris and B_st from those same objects. Prove the topological, Galois, Frobenius, filtration and monodromy properties'. PROTOCOL.md §16: '`source`: it belongs inside existing layers of a proposed roadmap … `part-ii`: it needs new layers in the direction of an existing roadmap'. PAPER-FARGUES-FONTAINE-18 route 5 (part-ii, parent PadicHodgeTheory, accepted), item 941 'No 10.4.1: B_dR-representations and the adjunction with Vect_K'. queue.json: DESIGN-PadicHodgeTheoryPartII pending. Paper p. 90, Theorem 6.1.16 (Fontaine): the Fontaine operator vanishes if and only if V is de Rham.

**Fix.**

Replace route 5 with a part-ii route whose parent is PadicHodgeTheory, title 'P-adic Hodge theory and geometric comparison, Part II: …', and items /20 and /451–/465. make_queue will merge it with the Fargues–Fontaine and Heuer PadicHodgeTheory Part II proposals. Its brief should ask for Fontaine's almost de Rham theory ([Fon04]: B_pdR, D_pdR, the operator ν), its Banach and LB generalisations (Props. 6.1.5, 6.1.8, 6.1.18, 6.1.20), the Fontaine operator of a Hodge–Tate B_dR^+/(t^{k+1})-module of weights 0, k, and Theorem 6.1.16. Route 1's brief should then import these from that Part II.

### 4. The log period sheaf and log Poincaré lemma are planned at T6, not missing for CP.3

- **Kind:** error.
- **Where:** research/blueprint/papers/PAPER-PAN-26.result.json: items /493, /494 (status missing, route 6 to CohomologyComparisons CP.3/CP.0).

**What is wrong.**

Items /493 and /494 are already planned in the atlas and have the wrong owner. /493 is the structural de Rham period sheaf OB^+_dR of Diao–Lan–Liu–Zhu evaluated on the pro-Kummer-étale cover given by the log structure at the cusps. /494 is its logarithmic connection, the Poincaré lemma sequence and the log Faltings extension. Both are planned by HodgeTateAndCanonicalSubgroups T6:log-sites and T6:comparison, and the non-log versions by PadicHodgeTheory P8:local-rational. Route 6 marks them missing and sends them to CP.3, the canonical B_dR^+ deformation of de Rham cohomology of a proper smooth X, and to CP.0, the normalisation dictionary. Neither stage constructs period sheaves. P8's text says explicitly that the log Kummer extension is T6's. Routing them as missing material to CP.3 invites a second construction of the log period sheaf.

**Evidence.**

HodgeTateAndCanonicalSubgroups T6:log-sites (atlas extract): 'construct the associated fine saturated log adic space, its Kummer-étale site, and the pro-Kummer-étale site of Diao–Lan–Liu–Zhu'; T6:comparison: 'On the sites constructed in T6:log-sites, construct the logarithmic structural de Rham period sheaves, their connections and filtrations, and prove the logarithmic Poincaré lemma'. PadicHodgeTheory P8:local-rational: 'Construct the rational structural B_dR and crystalline/semistable period sheaves … Prove rational local acyclicity, filtration strictness and the relative Poincaré lemma … That roadmap [HodgeTateAndCanonicalSubgroups] owns the logarithmic Kummer-site extension'. CohomologyComparisons CP.3: 'For a proper smooth adic space X/C construct the canonical B_dR^+-valued deformation of de Rham cohomology'. Item /493 locator: 'the constructions are [DLLZ18, section 2.2, Definition 2.2.10, Proposition 2.3.15]'; item /494: 'the connection is [DLLZ18, 2.2.15]'; paper §6.3.5–6.3.6, pp. 99–100.

**Fix.**

Mark /493 and /494 planned at HodgeTateAndCanonicalSubgroups:T6:log-sites and HodgeTateAndCanonicalSubgroups:T6:comparison (with PadicHodgeTheory:P8:local-rational for the non-log input). Remove them from route 6 and, if wanted, name them in a source route to HodgeTateAndCanonicalSubgroups for T6. In route 6's reason, drop 'the structural de Rham period sheaf with its log connection, the Poincare lemma sequence and the log Faltings extension'. Route 6 keeps /495, /496 and /545–/547. Since these are statements about modular curves at infinite level, they could equally go to the Part II.

### 5. Route 7: finiteness is RD.5, log-rigid cohomology is unplanned, and the Drinfeld tower belongs elsewhere

- **Kind:** error.
- **Where:** research/blueprint/papers/PAPER-PAN-26.result.json: route 7 (source, PadicDifferentialEquationsAndRigidCohomology RD.4) and its reason; item /354 (planned RD.4); items /433, /437.

**What is wrong.**

Route 7 has two errors. (a) Its reason says 'RD.4 constructs rigid cohomology with compact support and its finiteness', and item /354 (Prop. 5.1.7, finite-dimensionality of H^1_rig(Ig(K^pΓ(p^n)), Sym^k)) is marked planned at RD.4. But RD.4 explicitly leaves finiteness out, and finiteness is RD.5, whose packet has Kedlaya's finiteness theorems. Pan's proof also uses the log-rigid cohomology of an overconvergent logarithmic F-isocrystal on the compactified Igusa curves. Neither RD.4 nor RD.5 plans log-rigid cohomology or its comparison with rigid cohomology of the open Igusa curve. That comparison, or Coleman's dimension count, is an unplanned input. (b) Items /433 and /437 are Definition 5.6.5 and §5.6.9: compactly supported de Rham cohomology of the height-zero Drinfeld tower. This is the de Rham cohomology of a characteristic-zero rigid-analytic Stein space, not rigid cohomology of a variety over F_p. RD.4 plans the latter only. The accepted PAPER-COLMEZ-DOSPINESCU-NIZIOL-20-B route 1 sends this very object to the new roadmap ProetaleCohomologyOfPAdicCurvesAndTowers (design pending): its items 4.1-thm-4-1 and 5.3-thm-5-8, the compactly supported de Rham cohomology of the two towers and its decomposition. Pan §5.6.9 cites exactly that source ([CDN20, §4.3, §4.3.2]).

**Evidence.**

PadicDifferentialEquationsAndRigidCohomology RD.4 (atlas extract): 'Construct the overconvergent de Rham complex on frames … Separate geometric construction from finite-dimensionality: a named finite-dimensional output type cannot replace the finiteness proof'; the next stage is RD.5 'Finiteness, duality and Kunneth', whose packet nodes include 'finiteness-of-rigid-cohomology | Finite dimensionality of rigid cohomology with coefficients (Kedlaya, Theorem 1.2.1)' and 'finiteness-of-compactly-supported-rigid-cohomology'. No node of the 304-node packet has log-rigid cohomology. Paper p. 54, proof of Prop. 5.1.7: '(Sym^k D, ∇_k) defines an overconvergent logarithmic F-isocrystal on the special fiber of X_{K^pΓ(p^n),c} (a union of Igusa curves) and H^1_rig(Ig(K^pΓ(p^n)), Sym^k) is simply its log-rigid cohomology … The claim here follows from the general finiteness result on rigid cohomology.' Paper p. 82, §5.6.9: 'it's easy to see that the cohomology group H^1(j_!π_{Dr,n*}O) agrees with the H^1_c(M^{(0)}_{Dr,n}, O) introduced in [CDN20, §4.3.2]'. PAPER-COLMEZ-DOSPINESCU-NIZIOL-20-B (accepted) route 1 ProetaleCohomologyOfPAdicCurvesAndTowers includes 5.3-thm-5-8 'H^1_{dR,c}(M^ϖ_∞) = ⊕ JL_1(M) ⊗ WD_1(M) ⊗ LL_1(M)^∨' and 4.1-thm-4-1 (the two towers have the same compactly supported de Rham cohomology).

**Fix.**

Change /354's planned stage to PadicDifferentialEquationsAndRigidCohomology:RD.5. Record in its note that the log-rigid/rigid comparison (or Coleman's [Col96, §8], [Col97, Thm 2.1] computation) is an input nothing plans, and add it to route 1's brief as something the Part II proves or imports. Move /433 and /437 to a 'new' route with roadmap ProetaleCohomologyOfPAdicCurvesAndTowers, as CDN20-B route 1 does, or mark them planned there once that roadmap is registered. Correct route 7's reason: RD.4 does not include finiteness. Route 7 keeps /353 at RD.4, or goes to RD.5 if it keeps /354.

### 6. Route 10: R15.2 and R15.5 plan neither Gauss–Manin/Kodaira–Spencer/θ nor overconvergent forms

- **Kind:** error.
- **Where:** research/blueprint/papers/PAPER-PAN-26.result.json: route 10 (source, AlgebraicModularFormsAndSerreWeights R15.2, R15.5), items /300, /326, and the route's reason.

**What is wrong.**

Route 10's reason says the de Rham bundle of the universal elliptic curve (Gauss–Manin connection, Hodge filtration, Kodaira–Spencer isomorphism), the order-(k+1) operator θ_{k+1} built from them, and overconvergent and classical forms on strict neighbourhoods of the canonical locus 'are classical objects which those layers plan'. They do not. R15.2 is the q-expansion principle and integral Hecke theory. R15.5 is Deligne–Serre eigenvalue lifting. Their packet nodes have none of these objects. R15.3 has only the characteristic-p theta operator. Of what the route needs, AbelianSchemesAndArithmeticModuli A4 plans the relative H^1_dR, its Hodge exact sequence and the Gauss–Manin connection. The Kodaira–Spencer isomorphism for the modular curve with log poles at the cusps, the characteristic-zero θ_{k+1}, and overconvergent modular forms at infinite tame level are planned by no stage. So the source route puts them in a roadmap whose layers cannot hold them.

**Evidence.**

AlgebraicModularFormsAndSerreWeights R15.2 (atlas extract): 'Prove the q-expansion principle at all cusps … Define Hecke actions from R14'; R15.5: 'Prove the Deligne–Serre eigenvalue-lifting lemma'; its packet nodes for R15.2 are q-expansion principle, base change, integral Hecke operators and generation of the Hecke algebra, and for R15.5 Deligne–Serre lemmas. R15.3: 'Construct the Hasse invariant, Frobenius/Verschiebung and theta operator with their q-expansion formulas' (characteristic p). AbelianSchemesAndArithmeticModuli A4: 'Construct relative H¹_dR, its Hodge exact sequence, Gauss–Manin connection, cup-product pairing, and base change'. Paper §4.1.2, p. 34: 'The Kodaira-Spencer isomorphism implies that the composite map Fil^1 Sym^k D → Sym^k D ⊗ Ω^1_X(C) → (Sym^k D/Fil^k) ⊗ Ω^1_X(C) is an isomorphism'; item /326: 'M-dagger_k(K^p) is the colimit over n of the sections of omega^k on a strict neighbourhood of the canonical locus'.

**Fix.**

Mark the de Rham bundle, its Hodge filtration and Gauss–Manin connection in /300 planned at AbelianSchemesAndArithmeticModuli:A4 (split /300 if needed). Move the Kodaira–Spencer isomorphism with log poles, θ'_{k+1} and θ_{k+1} (the rest of /300), and /326, to route 1, and have the Part II brief construct them. Alternatively, send /326 to OverconvergentAutomorphicForms as a source for its elliptic instance (O8), if that layer's review agrees. Drop route 10, or correct its reason.

### 8. The imported theorems have no items: Pan I, Emerton's local–global compatibility, LXZ12/Colmez, Breuil's Σ(2, L)

- **Kind:** missing.
- **Where:** research/blueprint/papers/PAPER-PAN-26.result.json: items (none) for the external theorems the proofs import; prerequisites entry for [Pan22]; route 1 brief ('What to import').

**What is wrong.**

The extraction gives no item to the external theorems the paper's proofs rest on. They appear only inside other items' locators and notes, so no planned or missing status records them and no owner is named. The main ones:
(i) Pan I [Pan22]. Thm 4.2.7 / Cor. 4.2.8: n^o acts trivially on O^la, and θ_h encodes the infinitesimal character (p. 17). Cor. 4.4.3 / Thm 4.4.6: H^i(Fℓ, O_{K^p}) is completed cohomology and commutes with la vectors (pp. 28–30). Thm 4.3.9: the power-series expansion (pp. 19–21, 59, 64). Cor. 5.1.3 and Thm 5.1.8. Thm 4.2.2: Faltings's extension as a twist of the Hodge–Tate sequence (p. 111). Prop. 6.1.5: the infinitesimal character (p. 120).
(ii) Emerton's local–global compatibility, invoked via [Pan22, Cor. 6.3.6] in Remarks 7.3.6, 7.3.9 and 7.3.11.
(iii) The locally analytic vectors of Π(V) in the semistable non-crystalline case ([LXZ12], [Col14], conjectured in [Eme06a, Conj. 6.7.7]) and Breuil's Σ(2, L) ([Bre04]), both used in Remark 7.3.11.
(iv) [Sch13, Prop. 7.9], used on pp. 103 and 106.
Pan I has no extraction: papers.json batch 2 leaves it out as 'the foundation of DESIGN-PAN'. Finding 1 means route 1's items feed the grouped job, so these inputs reach no design job as items. Route 1's 'What to import' also leaves out CompletedCohomologyAndLocalGlobalCompatibility R31.4 (Emerton's local–global compatibility) and PadicLocalLanglandsForGL2Qp. The special case and the comparisons with the Breuil–Strauch and Berger–Breuil–Emerton conjectures (items /8, /11, /552, /554, /556) need both. PAN_BRIEF does list 'P-adic local Langlands for GL₂(Q_p)'.

**Evidence.**

Paper p. 17: 'By [Pan22, Theorem 4.2.7] … n^o acts trivially on O^la_{K^p}'; p. 123, Remark 7.3.6 and p. 124, Remarks 7.3.9 and 7.3.11: 'If ρ|G_{Q_p} is absolutely irreducible, then Emerton's local-global compatibility result implies that H̃^1(K^p,C)[λτ]^la_0 ≅ (π^{p,∞})^{K^p} ⊗̂_E Π(ρ|G_{Q_p})^la. A description of Π(ρ|G_{Q_p})^la was conjectured by Emerton [Eme06a, Conjecture 6.7.7] and proved in [LXZ12, Col14]' (pp. 124–125); p. 125: 'Fil^2 ker I^1_0[λ̃τ] is essentially (π^{p,∞})^{K^p} ⊗̂_E Σ(2, L), where Σ(2, L) was introduced in [Bre04]'. CompletedCohomologyAndLocalGlobalCompatibility R31.4 (atlas extract): 'Prove the source theorem identifying the local p-adic representation attached to the Galois representation inside completed cohomology … Emerton's unpublished 2011 manuscript, Theorem 1.2.1'. research/blueprint/papers/papers.json batch note: 'Pan's first paper (the foundation of DESIGN-PAN)' is 'not queued'. A keyword search over all atlas stage descriptions and paper extractions finds no owner for Breuil's Σ(k, L) or for [LXZ12].

**Fix.**

Add imported-result items: one per key [Pan22] theorem listed above (status missing, route 1, locator e.g. 'p. 17, citing [Pan22, Theorem 4.2.7]'); Emerton's local–global compatibility ([Eme11, Thm 1.2.1] via [Pan22, Cor. 6.3.6], status planned at CompletedCohomologyAndLocalGlobalCompatibility:R31.4 with its hypotheses); [LXZ12]/[Col14] and Breuil's Σ(2, L) (missing, route 1, or a PadicLocalLanglandsForGL2Qp Part II if the maintainer prefers); and [Sch13, Prop. 7.9] (planned at PadicHodgeTheory:P8). Add CompletedCohomologyAndLocalGlobalCompatibility R31.4 and PadicLocalLanglandsForGL2Qp to route 1's 'What to import', for the special case and the comparisons of Remarks 7.3.6–7.3.11 only.

### 9. The special-case and Berger–Breuil–Emerton items drop hypotheses and overstate what is proved

- **Kind:** error.
- **Where:** research/blueprint/papers/PAPER-PAN-26.result.json: items /554, /556, /12, /552; gaps[0].

**What is wrong.**

Four items in the special-case and comparison group misstate hypotheses or status.
(a) /554 (Remark 7.3.9) ends 'Hence the principal series description becomes the statement of the Berger-Breuil-Emerton conjecture'. The paper makes that identification only 'if we further assume ρ|G_{Q_p} is absolutely irreducible', and only through Emerton's local–global compatibility. The item drops both.
(b) /556's note, and gaps[0], say the special case 'is settled … by importing the p-adic local Langlands correspondence'. The paper only claims and sketches it ('We claim that it is actually an equality … it can be shown that …'), for k = 1 and under ρ|G_{Q_p} absolutely irreducible.
(c) /12's statement, 'When pi_p is special the paper obtains a slightly weaker result', is not a statement. Its locator copies the paper's wrong pointer to Remark 7.3.10; the special case is Remark 7.3.11.
(d) /552 (Remark 7.3.6) omits the remark's second half: via Emerton's local–global compatibility and [DLB17, Théorème 1.4], Theorem 7.3.2 becomes the Breuil–Strauch isomorphism, 'ρ|G_{Q_p} is absolutely irreducible as π_p is supercuspidal'.
In a blueprint these items would make the Berger–Breuil–Emerton and special-case statements look unconditional and proved.

**Evidence.**

Paper p. 124, Remark 7.3.9: 'If we further assume ρ|G_{Q_p} is absolutely irreducible, then Emerton's local-global compatibility result implies that Π(ρ|G_{Q_p})^la ⊗̂_E C ≅ Ind_B^{GL_2(Q_p)} D_cris(ρ|G_{Q_p})/π_p'. p. 124, Remark 7.3.11: 'Again let me assume k = 1 for simplicity … If ρ|G_{Q_p} is absolutely irreducible, then Emerton's local-global compatibility result implies'; p. 125: 'We claim that it is actually an equality: a careful analysis using Serre duality shows … On the other hand, it can be shown that gr^3 ker I^1_0[λ̃τ] essentially agrees with'. p. 5, Remark 1.1.12: 'We have a slightly weaker result when π_p is special. See Remark 7.3.10.' p. 124: 'Remark 7.3.11. Finally we remark on the case when π_p is special.' p. 123, Remark 7.3.6: 'ρ|G_{Q_p} is absolutely irreducible as π_p is supercuspidal'.

**Fix.**

/554: add 'if moreover ρ|G_{Q_p} is absolutely irreducible, Emerton's local–global compatibility identifies the left side with Π(ρ|G_{Q_p})^la ⊗̂ C, and the isomorphism becomes the (dual) Berger–Breuil–Emerton conjecture [BB10, Conj. 5.3.7]'. /556 and gaps[0]: say the equality in the special case is claimed with a sketch, for k = 1, assuming ρ|G_{Q_p} absolutely irreducible, and is not proved in the paper. /12: state 'for π_p special (k = 1), Theorem 5.5.4 gives a three-step filtration on ker I^1_0[λ̃]; the paper does not prove that the eigenspace equals the generalised eigenspace (see /556)', with locator 'Remark 1.1.12, p. 5 (which points to Remark 7.3.10; the case is Remark 7.3.11, pp. 124–125)'. /552: add the Breuil–Strauch half with its inputs.

### 10. Item /465 copies a misprint that makes Prop. 6.1.20 and Cor. 6.1.21 vacuous

- **Kind:** error.
- **Where:** research/blueprint/papers/PAPER-PAN-26.result.json: item /465 (Proposition 6.1.20 and Corollary 6.1.21); sourceIssues (not recorded).

**What is wrong.**

Item /465 copies a misprint that empties the result. Prop. 6.1.20 and Cor. 6.1.21 are stated for 'B_dR^+/(t^k)-linear' maps between 'B_dR^+/(t^k)-modules' that are 'Hodge-Tate of weights 0, k'. The Fontaine operator of such a module is N_W : W_{0,0} → W_{k,−k}, where W_{k,−k} is a summand of W_k = t^kW/t^{k+1}W (§6.1.19, p. 91). For a B_dR^+/(t^k)-module, W_k = 0. Read as printed, every Fontaine operator in Cor. 6.1.21 is zero and the statement says nothing. The surrounding text works throughout with B_dR^+/(t^{k+1}): §6.1.12 'Let W be a flat Banach B_dR^+/(t^{k+1})-module', §6.1.17, §6.1.19, and the application in §6.2.14 to B^{+,la,χ̃_k}_{dR,k+1}. So t^k is a misprint for t^{k+1}. The extraction does not record it, and item /465 copies it. This is the step that carries the Fontaine operator through the Čech complexes in the proof of Theorem 6.2.6, so the item matters.

**Evidence.**

Paper p. 91 (checked on the page image): 'Similarly, let W_i = t^iW/t^{i+1}W … N_W : W_{0,0} → W_{k,−k} = W_{0,−k}(k) … Proposition 6.1.20. Let f : X → Y be a continuous B^+_dR/(t^k)-linear, G_K-equivariant maps between Hausdorff flat LB B^+_dR/(t^k)-modules'; p. 88, §6.1.12: 'Let W be a flat Banach B^+_dR/(t^{k+1})-module'; p. 90, §6.1.17 uses '/(t^{k+1})-modules W^j'. Item /465: 'Let f : X -> Y be a continuous B^+_dR/(t^k)-linear G_K-equivariant map'.

**Fix.**

In /465 replace B^+_dR/(t^k) by B^+_dR/(t^{k+1}) (twice), and note the correction. Add a sourceIssues entry: kind misprint; locator 'Proposition 6.1.20, p. 91 (arXiv v1)'; printed as quoted; correction t^{k+1}; reason as above; affects 'a stated result' (vacuous as printed; the intended statement is used in §6.2); known 'new', noting that the published text was not obtainable.

## Low

### 7. The Lubin–Tate and Drinfeld towers and their duality are planned at ET.6a

- **Kind:** error.
- **Where:** research/blueprint/papers/PAPER-PAN-26.result.json: items /361, /363, /381, /382, /383 (status missing, route 4 to EndoscopicTransferAndUnitaryTraceComparison ET.6a/ET.6).

**What is wrong.**

Five items are marked missing although ET.6a plans them, and accepted extractions mark the same objects planned. The five are: the Lubin–Tate tower with its Gross–Hopkins period map, the Drinfeld tower, both at infinite level with their Hodge–Tate period maps, and Scholze–Weinstein duality (Theorem 5.3.4). ET.6a says to construct the Lubin–Tate tower with its GL_n(E), D^× and W_E actions, the Drinfeld tower with its period morphisms, and 'the infinite-level moduli description and duality isomorphism', naming Scholze–Weinstein §§6–7 as the route. That is the content of Pan's items 361, 363, 381, 382 and 383 for n = 2, E = Q_p. PAPER-COLMEZ-DOSPINESCU-NIZIOL-20-B marks the towers, the Gross–Hopkins map and the isomorphism of the completed towers planned at ET.6a (items in-two-towers, in-gross-hopkins). PAPER-COLMEZ-DOSPINESCU-NIZIOL-23 does the same for the perfectoid towers (in-perfectoid-tower). ET.6a's ℓ-adic coefficients concern its cohomological half, not the geometry. What ET.6a lacks is Pan's own content: the Kodaira–Spencer isomorphism on the tower (/362), the quaternionic action on the sheaves (/368), and the exchange of differential operators. So the status should be split. It should not all be 'missing'.

**Evidence.**

EndoscopicTransferAndUnitaryTraceComparison ET.6a (atlas extract): 'construct the Lubin–Tate tower with its GL_n(E), D× and W_E actions, D/E the division algebra of invariant 1/n. Construct the Drinfeld tower and its level maps, period morphisms, compact-support complexes and commuting actions … Prove the infinite-level moduli description and duality isomorphism … The new source Scholze–Weinstein §§6–7 supplies the moduli/duality proof route'. PAPER-COLMEZ-DOSPINESCU-NIZIOL-20-B item in-two-towers (planned ET.6a): 'The Lubin–Tate tower … with its GL_2(F), D^* and W_F actions and its period morphisms; the Drinfeld tower with its level maps; and the isomorphism of the completed towers L̂T_∞ ≅ M̂_∞ as perfectoid spaces'. Pan items /383 'quoted from Scholze-Weinstein, Proposition 7.2.2 and Theorem 7.2.3', /363 'quoted from Scholze-Weinstein, Theorem 6.3.4', /382 'quoted from Scholze-Weinstein, Theorem 6.5.4'.

**Fix.**

Mark /361, /363, /381, /382 and /383 planned at EndoscopicTransferAndUnitaryTraceComparison:ET.6a. Keep route 4 as a source route naming them, which PROTOCOL §16 allows for planned items, and keep /362 and /368 missing on it. Drop ET.6 from route 4's stages: it is the classical local Langlands correspondence, which none of the seven items uses.

### 11. Smaller statement and locator slips

- **Kind:** error.
- **Where:** research/blueprint/papers/PAPER-PAN-26.result.json: items /1, /7, /202, /551, /554 (statements and locators).

**What is wrong.**

Smaller statement and locator slips:
(a) /1 adds a hypothesis. It fixes 'a neat open compact subgroup K^p', while pp. 2 and 115 take any open compact K^p. The paper's standing assumption is stronger than neat and appears only on p. 17: K^p inside the level-N subgroup, N ≥ 3 prime to p. Theorems 1.1.2 and 7.1.2 are stated without it.
(b) /7 (Theorem 1.1.7) says 'a GL_2(Q_p)-equivariant isomorphism'. The theorem states GL_2(Q_p)^o-equivariance. The upgrade to GL_2(Q_p) is Remark 7.3.3, as /7's own locator says.
(c) /202 says 'The second isomorphism is proved in Lemma 3.2.8'. Lemma 3.2.8 is the fixed-weight statement. The isomorphism claimed in §3.1.2 is Remark 3.2.9, 'which was claimed in 3.1.2' (p. 21).
(d) /551 cites pp. 122–123, but Theorem 7.3.2 and Remarks 7.3.3–7.3.5 are all on p. 122; p. 123 begins with Remark 7.3.6.
(e) /554 cites pp. 123–124, but Remark 7.3.9 is wholly on p. 124.

**Evidence.**

Paper p. 2: 'Let K^p = ∏_{l≠p} K_l be an open compact subgroup of GL_2(A^p_f)'; p. 17: 'Fix an open compact subgroup K^p … contained in the level-N-subgroup … for some N ≥ 3 prime to p throughout this paper'; p. 4, Theorem 1.1.7: 'a GL_2(Q_p)^o-equivariant isomorphism … This isomorphism can be upgraded to a GL_2(Q_p)-equivariant isomorphism, cf. Remark 7.3.3'; p. 21: 'then one has the natural isomorphism ω^{k,la} ≅ ω^{k,sm} ⊗ O^la, which was claimed in 3.1.2' (Remark 3.2.9); p. 122 carries Theorem 7.3.2 through Remark 7.3.5, p. 123 opens with 'Remark 7.3.6', and p. 124 carries 'Remark 7.3.9'.

**Fix.**

/1: replace 'a neat open compact subgroup' by 'an open compact subgroup' and add 'from §3 on, K^p is contained in the level-N subgroup for some N ≥ 3 prime to p (p. 17)'. /7: 'a GL_2(Q_p)^o-equivariant isomorphism, which upgrades to GL_2(Q_p)-equivariance (Remark 7.3.3)'. /202: 'proved in Remark 3.2.9 (with Lemma 3.2.8 for fixed weight)'. /551: 'p. 122'. /554: 'p. 124'.

### 12. Sixteen unrecorded misprints, eleven of them copied into items

- **Kind:** error.
- **Where:** research/blueprint/papers/PAPER-PAN-26.result.json: sourceIssues (E1–E3 only); items /9, /12, /28, /214, /216, /301, /311, /324, /450, /543, /550, /555.

**What is wrong.**

Sixteen further misprints and slips in arXiv v1 are not recorded. I checked each on the page or its image. Eleven items copy them, and /12 copies a wrong cross-reference. None changes a main theorem. The list:
(1) p. 4, §1.1.9: 'Γ(p^n) = 1 + p^n Z_p ⊆ GL_2(Z_p)' should be 1 + p^nM_2(Z_p), as on p. 116. Copied by /9.
(2) p. 5, Remark 1.1.12: 'See Remark 7.3.10' should be 7.3.11. Copied by /12's locator.
(3) p. 8, §1.2.9: 'I_{k−1} = d̄'^{k+1}∘d^{k+1}' should be d̄'^k∘d^k. The same page has I_0 = d̄'^1∘d^1, and §6.3.1 has 'I_{k−1} … the composite d̄'_k∘d_k'. Copied by /28.
(4) p. 8, §1.2.11: 'the first claim follows' should be 'the second claim' (ker d̄^1 = O^sm).
(5) p. 23, proof of Cor. 3.2.13: the cover '{U_2, U'_1∩U'_2} of U_2' should be 'of U'_2', since U'_1∩U'_2 is not contained in U_2 = {|x| ≥ 1}. Copied by /214.
(6) p. 24, §3.3.2: 'Z_p = (Z/pZ)^× × (1 + 2pZ_p)' should have Z_p^× on the left. Even then the decomposition fails for p = 2: (Z/2)^× is trivial and Z_2^× = {±1} × (1 + 4Z_2). The paper puts no condition on p. Only the projection to 1 + 2pZ_p is used, which is harmless. Copied by /216.
(7) p. 35, §4.1.3: '∧²D^sm_{K^p} is isomorphic to O^la_{K^p}' should be O^sm_{K^p}, as on p. 42: '∧²D^sm_{K^p} ≅ O^sm_{K^p} (non-canonically)'. Copied by /301.
(8) p. 38, §4.2.3: 'replaced by gr^1 D = ∧²D ⊗ ω^{−1}' should be gr^0 D. On p. 34, Fil^1 D = ω and gr^0 D = ∧²D ⊗ ω^{−1}. Copied by /311.
(9) p. 41, Remark 4.3.2: 'in the next section' should be Section 6. Section 5 is the spectral decomposition.
(10) p. 42, proof of Lemma 4.4.2: 'ker(d̄^{k+1} ⊗ 1) ≅ Sym^k V(k) ⊗ ω^{k+2,la,χ} ⊗ …' should be ω^{k+2,sm}. The next line reduces to H^1(Fℓ, ω^{k+2,sm}) = 0. Copied by /324.
(11) p. 81, Lemma 5.6.6: the statement twists by ε_p^{−k}, the Galois character, where its proof has ε'_p^{−k}, the GL_2(Q_p)-character.
(12) p. 82, Theorem 5.6.7: the proof removes 'Sym^k V · ε'_p^{−k}' from every term of (5.6.1). The two middle terms of (5.6.1) carry the global ε^{−k} (p. 80, Lemma 5.6.4), so a twist ε^{−k}ε'^k_p is left on them. It is non-trivial on GL_2(A^p_f) and G_Q, and the displayed sequence drops it.
(13) p. 84: '[ε] − 1 generates the kernel of θ : A_inf[1/p] → C' is false. The kernel is generated by ξ = ([ε] − 1)/([ε^{1/p}] − 1), and [ε^{1/p}] − 1 maps to 0 in W(k̄)[1/p], so it is not a unit. The statement holds in B^+_dR, where θ([ε^{1/p}] − 1) = ζ_p − 1 ≠ 0, and only that is used. /450 states it without saying which ring.
(14) p. 117, §7.1.4: the characteristic polynomial 'X^2 − l^{−1}T_l + l^{−1}S_l' lacks the X in the middle term. The paper's own twist 'Frob_l^2 − T_l Frob_l + lS_l = 0' confirms it. Copied by /543.
(15) p. 121, §7.3.1: 'We have just shown that M_{k+2}(K^p) ⊗ D_0^{−1}[λτ] ≠ 0' should be M_{k+1}. p. 118 shows 'M_{k+1}(K^p) ⊗ E[λ'] … ≠ 0', matching 'weight k+1'. Copied by /550.
(16) p. 124, Remark 7.3.10: 'ℍ^1(DR_k)[λτ]/Fil^1' should be DR_{k−1}, as in Remark 1.1.13 on p. 5. Copied by /555.

**Evidence.**

Checked in the arXiv v1 text layer and, for (1), (3), (7), (8), (10), (11), (12), (14) and (16), on rendered page images: p. 4 'Let Γ(p^n) = 1 + p^n Z_p ⊆ GL_2(Z_p) be the principal congruence subgroup'; p. 8 'I_0 = d̄'^1∘d^1 … a standard BGG construction allows us to define I_{k−1} = d̄'^{k+1}∘d^{k+1} : O^{la,(1−k,0)} → O^{la,(1,−k)}(k)' and 'Since ker d̄^1 is GL_2(Q_p)-invariant, the first claim follows'; p. 23 'by applying Proposition 3.2.11 to the cover {U_2, U'_1 ∩ U'_2} of U_2'; p. 24 'There is a natural decomposition Z_p = (Z/pZ)^× × (1 + 2pZ_p)'; p. 35 'We note that ∧²D^sm_{K^p} is isomorphic to O^la_{K^p}'; p. 34 'ω = Fil^1 D ⊂ D → … gr^0 D ⊗ Ω^1_X(C) = ∧²D ⊗ ω^{−1} ⊗ Ω^1_X(C)'; p. 38 'the ω^{−1} in (3.1.1) should be replaced by gr^1 D = ∧²D ⊗_{O_X} ω^{−1}'; p. 41 'We will give a p-adic Hodge-theoretic interpretation of I_k in the next section'; p. 42 'ker(d̄^{k+1} ⊗ 1) ≅ Sym^k V(k) ⊗_{Q_p} ω^{k+2,la,χ}_{K^p} ⊗ (∧²D^sm)^{−k−1}. … it is enough to prove H^1(Fℓ, ω^{k+2,sm}_{K^p}) = 0'; p. 80 '(5.6.1) 0 → ker SS^k → ℍ^1(D^k) ⊗ Sym^k D · ε^{−k} → ker ORD^k → coker SS^k → 0' and 'Lemma 5.6.4. ker ORD^k ≅ Sym^k V ⊗ Ind H^1_rig(Ig(K^p), Sym^k) · ε^{−k}'; p. 81 'ker SS^k ≅ (…)^{O^×_{D_p}} ⊗ Sym^k V · ε_p^{−k}' and, in the proof, '· ε'_p^{−k}'; p. 82 'remove ⊗ Sym^k V · ε'_p^{−k} in every term'; p. 11 'ε'_p := ε|_{Q_p^×}'; p. 84 'It is well-known that [ε] − 1 generates the kernel of θ : A_inf[1/p] → C'; p. 117 'the characteristic polynomial of D_S(Frob_l) is X^2 − l^{−1}T_l + l^{−1}S_l … Frob_l^2 − T_l Frob_l + lS_l = 0'; p. 118 'M_{k+1}(K^p) ⊗ E[λ'] = M_{k+1} · D_0^{−1}[λ] ≠ 0'; p. 121 'We have just shown that M_{k+2}(K^p) ⊗ D_0^{−1}[λτ] ≠ 0'; p. 124 'H̃^1(K^p,C)[λτ]^la_0 ≅ ℍ^1(DR_k)[λτ]/Fil^1'; p. 5 'H^1(DR_{k−1})[λ]/Fil^1 H^1(DR_{k−1})[λ]'.

**Fix.**

Add sourceIssues E4 onward for (1)–(16): kind 'misprint' for all except (13) ('error', affects nothing) and (12) ('error', affects 'a stated result', the displayed form of Theorem 5.6.7). Use the locators above, with known 'new' and searched as for E1–E3. The published version (revised November 2024, 161 pages) may already correct them and was not obtainable. Correct the copying items: /9 (1 + p^nM_2(Z_p)), /12 (locator), /28 (d̄'_k∘d_k), /214 (of U'_2), /216 (Z_p^× = μ_{p−1} × (1 + pZ_p) for p odd, with p = 2 flagged), /301 (O^sm), /311 (gr^0 D), /324 (ω^{k+2,sm}), /450 (the kernel of θ on B^+_dR is generated by [ε] − 1, and on A_inf by ξ), /543 (X^2 − l^{−1}T_l X + l^{−1}S_l), /550 (M_{k+1}) and /555 (DR_{k−1}).

### 13. Mathlib already has compact operators and B_dR^+

- **Kind:** library-claim.
- **Where:** research/blueprint/papers/PAPER-PAN-26.result.json: items /106 (compact operators, status missing) and /450 (B^+_dR, status planned).

**What is wrong.**

Mathlib at 082e2d3 already has parts of two items, and the extraction cites no library declaration anywhere. /106 defines a compact operator between Q_p-Banach spaces (the closure of the image of the unit ball is compact), states the bounded-set characterisation, and says compact operators are continuous and stable under composition with continuous maps. All of this is in Mathlib for topological modules over a nontrivially normed field. Only the mod p^n finiteness criterion is not. /450 constructs A_inf = W(O_C^♭), Fontaine's θ and B^+_dR as the completion of A_inf[1/p] along ker θ. Mathlib has θ with its Teichmüller formula and surjectivity, and defines BDeRhamPlus and BDeRham exactly this way. It does not have the DVR property, the filtration, t or the Galois action, which its TODO lists.

**Evidence.**

Mathlib 082e2d3: Mathlib/Analysis/Normed/Operator/Compact/Basic.lean:71 'def IsCompactOperator … ∃ K, IsCompact K ∧ f ⁻¹' K ∈ (𝓝 0 : Filter M₁)', :189 'theorem isCompactOperator_iff_isCompact_closure_image_ball', :151 'theorem IsCompactOperator.isCompact_closure_image_of_bounded', :276 'IsCompactOperator.comp_clm', :290 'IsCompactOperator.clm_comp', :364 'IsCompactOperator.continuous'. Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:165 'def fontaineTheta : 𝕎 R♭ →+* R', :182 'fontaineTheta_teichmuller', :195 'surjective_fontaineTheta'; Mathlib/RingTheory/Perfectoid/BDeRham.lean:77 'def BDeRhamPlus : Type u := AdicCompletion (RingHom.ker (fontaineThetaInvertP R p)) (Localization.Away (p : 𝕎 R♭))', :90 'def BDeRham', with TODO '2. Show that B_dR^+ is a discrete valuation ring. 3. Show that ker θ is principal'.

**Fix.**

/106: status library for the definition and its properties, citing mathlib:IsCompactOperator, mathlib:isCompactOperator_iff_isCompact_closure_image_ball, mathlib:IsCompactOperator.isCompact_closure_image_of_bounded, mathlib:IsCompactOperator.comp_clm, mathlib:IsCompactOperator.clm_comp and mathlib:IsCompactOperator.continuous. Split off the finiteness criterion modulo p^k Y°/p^{k+n} Y° as a missing item on route 2's replacement (finding 2). /450: keep planned at R06.1 and AI.0, but add library [mathlib:fontaineTheta, mathlib:fontaineTheta_teichmuller, mathlib:surjective_fontaineTheta, mathlib:BDeRhamPlus, mathlib:BDeRham] with a note that the DVR property, the filtration, t and the Galois action are not in the library.

### 14. Theorem 1.1.2 is not related to R31.6's plan for Emerton's result

- **Kind:** other.
- **Where:** research/blueprint/papers/PAPER-PAN-26.result.json: item /2 (Theorem 1.1.2), items /3–/4, route 1 brief.

**What is wrong.**

The extraction does not relate Theorem 1.1.2 to the atlas's existing plan for Emerton's result. CompletedCohomologyAndLocalGlobalCompatibility R31.6 plans Emerton's Theorems 1.2.3–1.2.4 and 'the Fontaine–Mazur consequence', under p > 2, residual absolute irreducibility on G_{Q(ζ_p)} and the local exclusions of R31.4. Theorem 1.1.2 proves the classicality step of that argument for every p, with no residual or local hypothesis on ρ beyond absolute irreducibility, and without p-adic local Langlands. Remark 1.1.3 says Emerton had it 'at least in the generic cases'. Neither /2 nor route 1's brief mentions R31.6. So the Part II will not record that it strengthens and supersedes a step R31.6 plans. Nor will R31.6's consumers, R32 via R31.6, learn that a proof exists which needs no R30 input. This is a missing cross-reference, not a duplicate: the proofs are different. For the record, the paper treats only regular weights: Hodge–Tate weights 0, k with k > 0, §7 'Regular de Rham representations'. The extraction is right not to claim anything for Hodge–Tate weights 0, 0.

**Evidence.**

CompletedCohomologyAndLocalGlobalCompatibility R31.6 (atlas extract): 'In particular Emerton Theorems 1.2.3–1.2.4 assume p>2, residual absolute irreducibility after restriction to G_Q(ζ_p), and both local exclusions from R31.4. The Fontaine–Mazur consequence also requires de Rham local behaviour with distinct Hodge–Tate weights'. Paper p. 2, Theorem 1.1.2: 'Let E be a finite extension of Q_p and ρ : G_Q → GL_2(E) be a two-dimensional continuous absolutely irreducible representation … (2) ρ|G_{Q_p} is de Rham of Hodge-Tate weights 0, k for some integer k > 0'; p. 3, Remark 1.1.3: 'This result was first obtained by Matthew Emerton in his famous work [Eme11] (at least in the generic cases) … we do not need the p-adic local Langlands correspondence for GL2(Qp) in our argument'.

**Fix.**

Add to /2's note: 'The classicality step of Emerton's Fontaine–Mazur argument planned at CompletedCohomologyAndLocalGlobalCompatibility:R31.6 (there under p > 2 and residual hypotheses); this theorem holds for all p without them and without R30.' Add to route 1's brief that the Part II exports Theorem 1.1.2 as an alternative to that step, and records the comparison with R31.6's statement.

## What was checked

- Independence. PAPER-PAN-26 was written by Claude Code session cc-fb70e5 (issue #2168, commit 55c00e2d, PR #2223; the provenance line of the .md). REV-PAPER-PAN-26 was written by session cc-7b31c4 (issue #2169, commit 32743342, PR #2369; the review report's header). git log shows only those two commits on the four target files. The string cc-f805bf occurs in none of result.json, .md, review.json or the review report.
- Disclosure. This session filed RT-PAPER-BREUIL-HELLMANN-SCHRAEN-19 (PR #4759). Its /17 (make_queue merges BHS19 route 3 with Pan's Part II) is extended, not repeated, by finding 1. Its /3 (almost de Rham items belong in a PadicHodgeTheory Part II) is applied to Pan's items in finding 3. Its /5 (completed cohomology is owned by CompletedCohomologyPartII CC.2/CC.5/CC.8, not R31.2) was re-checked here: Pan's items /1, /540 and /543 cite CC and R31.1/R31.3 correctly, so there is no finding. This session also reviewed PAPER-FARGUES-FONTAINE-18 (PR #4683), whose accepted route 5 finding 3 cites, and PAPER-SCHOLZE-17 (PR #4688), which no finding touches.
- Sources. arXiv:2209.06366v1 was re-downloaded on 30 September 2026; sha256 0873b61a…1027b31b4 matches the record. The arXiv API lists only v1, and /abs/2209.06366v2 returns 404. The Project Euclid landing page for doi:10.4007/annals.2026.203.1.3 (Ann. Math. 203(1) 121–281, MR 5008553) gives 'Received: 12 October 2022, Revised: 4 November 2024, Accepted: 22 November 2024'. The full text is paywalled and was not obtained. Crossref lists no update-to, updated-by or relation. Every finding is therefore against v1, and source-mistake findings say that the published text may differ.
- Reading. Six parallel readers read every line of v1: pp. 1–33, 33–51, 51–73, 73–83, 83–115 and 115–127 with the bibliography. Each compared every item in its range for statement, hypotheses and locator, listed numbered results and imports without items, and hunted for slips. I personally re-checked every passage a finding quotes, in the text layer and, for pp. 8, 24, 35, 38, 42, 61, 67, 80, 81, 82, 91, 117 and 124, on rendered page images.
- Coverage of numbered results. Every numbered Definition, Lemma, Proposition, Theorem, Corollary and substantive Remark in §§1–7 has an item, sometimes bundled (for example 5.3.20–5.3.21, 6.1.20–6.1.21, 6.5.4–6.5.5). The omissions are imported external theorems (finding 8).
- Main theorem hypotheses. Theorem 1.1.2 = 7.1.2 (pp. 2, 116): any prime p, E/Q_p finite, ρ continuous and absolutely irreducible, Hom_{E[G_Q]}(ρ, H̃^1(K^p,E)) ≠ 0, ρ|G_{Q_p} de Rham of Hodge–Tate weights 0 and k > 0. There is no p ≥ 5 condition, no residual hypothesis and no irregular-weight statement: weights (0, 0) are never treated, and §7 is titled 'Regular de Rham representations'. Item /2 matches exactly. Colmez's correspondence and Paškūnas's work are not used in the proof. Emerton's local–global compatibility appears only in Remarks 7.3.6–7.3.11 (finding 9).
- Source issues. E1 (p. 65, c_{i,j,k} for d_{i,j,k}) and E2 (p. 67, d̄^{k+1}_LT for d̄^{k+1}_Dr in Theorem 5.3.17(1)) were confirmed on page images. For E2, Theorem 5.2.16(1) on p. 61 says d̄_LT is O^sm_LT-linear, and an explicit s shows d̄_LT is not even O_Ω-linear, so the literal reading is false. E3 (footnote 3, p. 58) was confirmed. Missed mistakes are in findings 10 and 12.
- Statuses and owners: layers read in full. CompletedCohomologyAndLocalGlobalCompatibility R31.1–R31.6 with its stage edges. CompletedCohomologyPartII CC.0, CC.2, CC.3, CC.5 and CC.8. PerfectoidShimuraVarieties S3 and S5 with the roadmap summary. HodgeTateAndCanonicalSubgroups T0–T6, T6:log-sites and T6:comparison. PadicHodgeTheory R06.1, P8 and P8:local-rational. CohomologyComparisons CP.0 and CP.3. EndoscopicTransferAndUnitaryTraceComparison ET.6 and ET.6a. PadicDifferentialEquationsAndRigidCohomology RD.4 and RD.5, with all RD.4 and RD.5 nodes and keyword searches over its 304-node packet. GL2AutomorphicRepresentationsAndTransfer R16.3, R17.1 and R17.3. SmoothRepresentationsOfLocalGroups SR.2. AlgebraicModularFormsAndSerreWeights R15.2, R15.3 and R15.5 with their packet nodes. AbelianSchemesAndArithmeticModuli A4. LocallyAnalyticDistributions L0–L4 with its packet's stage counts. OverconvergentAutomorphicForms O0–O8. PadicLocalLanglandsForGL2Qp R30.1–R30.6. GL2ModularityLifting R32.4.
- Planned items. Of the six planned items, /1, /540 (CC and R31.1), /543 (R31.3 and CC.8) and /200 (S3, S5 and T2) hold in the paper's generality. /354 is planned at the wrong stage (finding 5). /450 holds, but is partly library (finding 13).
- Other extractions compared. PAPER-DING-25: routes 1 and 4 and the brief of route 1. PAPER-DOSPINESCU-LEBRAS-17: routes 1–3. PAPER-COLMEZ-DOSPINESCU-NIZIOL-20, -20-B, -21 and -23: routes, and the items on the two towers and on compactly supported de Rham cohomology. PAPER-SCHOLZE-15: items 55, 59, 64, 66, 67 and 69 on the Hodge–Tate period map, consistent with Pan /200 and /204. PAPER-FARGUES-FONTAINE-18 route 5 and item 941. PAPER-LIU-ZHU-17. PAPER-CARAIANI-SCHOLZE-17. PAPER-HEUER-25. PAPER-BOCKLE-IYENGAR-PASKUNAS-23. PAPER-PASKUNAS-QUAST-26. PAPER-BREUIL-HELLMANN-SCHRAEN-19. PAPER-SCHOLZE-WEINSTEIN-20. Pan I is not extracted.
- Queue and routing mechanics. research/blueprint/make_queue.py: PAN_BRIEF, paper_designs and the design list, lines 373–434 and 922–925. research/blueprint/queue.json: DESIGN-PAN, DESIGN-CompletedCohomologyAndLocalGlobalCompatibilityPartII, DESIGN-PadicHodgeTheoryPartII, DESIGN-LocallyAnalyticRepresentationsOfLocalGroups and DESIGN-ProetaleCohomologyOfPAdicCurvesAndTowers, all pending. research/blueprint/papers/papers.json: the PAPER-PAN-26 note, and the batch-2 note that Pan I is not queued.
- Cycles. The stage graph was built from the requires and stageEdges of every atlas extract (4,163 edges) plus the accepted links in research/blueprint/links (716). No stage named by any route, planned status or proposed fix lies downstream of R31.1–R31.6, apart from R31.3 of the parent itself. The Part II after R31 importing them is acyclic, and so are the re-routings proposed here.
- Libraries. Mathlib 082e2d3 and Tau Ceti f790474 were searched via declarations.tsv (316,811 declarations) for compact operators, B_dR, Fontaine's θ, A_inf, perfectoid and tilt, Hodge–Tate, Sen, locally analytic, LB-spaces, completed cohomology, Lubin–Tate, Drinfeld, Igusa, theta operators, Gauss–Manin, Kodaira–Spencer and rigid cohomology. Declarations were read in Mathlib/Analysis/Normed/Operator/Compact/Basic.lean, Mathlib/RingTheory/Perfectoid/BDeRham.lean and FontaineTheta.lean (finding 13). Tau Ceti has only unrelated IsCompactOperator applications (Fredholm, PDE) and nothing for the other topics.
- The review. Its two edits were checked. The Part II title prefix now equals the parent's atlas title. Item /553's p. 124 is correct: Theorem 7.3.7 and Remark 7.3.8 are both on p. 124. Neither edit introduced an error. The review's route verdicts are addressed by findings 1–7.
