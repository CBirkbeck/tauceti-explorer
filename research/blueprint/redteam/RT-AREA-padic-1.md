# RT-AREA-padic-1

Red team of part 1 of 3 of the area **p-adic Hodge theory and p-adic geometry**, issue #1511. By Claude Code, session `cc-38267a`, 24 September 2026. This session wrote or reviewed none of the part's roadmaps, restructurings or routed papers.

The part's roadmaps are AdicEtaleGeometry, AdicSpacesPartII, DiamondsAndVStacks, FarguesFontaineDiamonds, HodgeTateAndCanonicalSubgroups, PerfectoidQuotients, PerfectoidSpaces and RelativeFarguesFontaine: 63 stages, with 32 routed papers. The other parts' roadmaps were read for cross-part duplication.

**32 findings: 4 high, 22 medium, 6 low.** Each has its evidence and a fix a worker can apply in `RT-AREA-padic-1.result.json`.

## How it was checked

- **Split.** Four checkers took one group each: perfectoid spaces and quotients; adic étale geometry, AdicSpacesPartII and diamonds; the two Fargues–Fontaine roadmaps; and Hodge–Tate theory.
- **What each read.** Every stage, the reviewed decompositions, the restructurings (accepted ones as decisions), the routed papers with their reviews, the cross-part stage texts and the cited sources. Each also searched the pinned libraries.
- **My re-checks.** I re-checked the structural claims myself: the Q4 → A3 edge, the missing BS22 review, the perfectoidization stages, and the primitive-comparison routes.
- **Two disagreements between checkers, settled at the sources:**
  - Q4 → A3. The proof of ECD 6.4(iv) works in characteristic p and does not use ECD 5.8 or BS22 7.4, so the edge is unnecessary.
  - The primitive comparison. It is owned by P8 through accepted routes, so it is not wholly missing. But P8 sits downstream of CP.3, so the fix needs an early stage rather than an edge from P8 (P8 → CP.3 would close a cycle).

## Findings

### 1. missing, high

**Where:** PerfectoidSpaces:P8; PerfectoidShimuraVarieties:S4 (and S2); PerfectoidQuotients:Q4; PAPER-BHATT-SCHOLZE-22 routes 2–3 (unreviewed)

P8 and S4 follow Hansen–Johansson §5, whose descent argument needs Bhatt–Scholze's theorem that every integral algebra over a perfectoid ring has a universal perfectoidization (BS22 Thm 1.17(1) = Thm 10.11). Its proof uses BS22 §8.2 (the arc-sheaf description of perfectoidization) and §§10.1–10.2 (almost mathematics for an arbitrary ideal J and J-almost purity 10.9). No layer plans these: Q2 and Q4 stop at semiperfectoid quotients (BS22 7.3–7.4). The only proposal, the unreviewed BS22 extraction, routes them into Q2/Q4 and P0/P3, which is impossible without cycles.

**Fix:** Add a late stage PerfectoidQuotients:Q5 'Perfectoidization of integral algebras and J-almost purity' (BS22 §8.2 Cor. 8.11–8.14, §10.1 Def. 10.1–Lemma 10.5, §10.2 Thms 10.9, 10.11 and Lemma 10.12), requiring Q3, Q4, PR.2 and the arc-topology roadmap (BS22 8.10, already routed there). Add edges Q5→P8, Q5→S4, Q5→S2 (acyclic). Rewrite P8's Hodge-type paragraph to follow HJ Lemmas 5.9–5.10, and add Hansen, 'Quotients of adic spaces' (HJ Thm 5.8 uses it) to P8's sources. At the BS22 review, route its items /52, /60, /61 to Q5.

### 2. missing, high

**Where:** Part II PerfectoidRamification (ANDRE-18-B route 4, accepted); Part II DirectSummandsAndBigCohenMacaulay (ANDRE-18-B route 1, accepted)

André's perfectoid Abhyankar lemma ('Le lemme d'Abhyankar perfectoïde', Théorème 0.3.1) is used by two accepted designs but planned nowhere. The accepted PerfectoidRamification brief is only an increment on the ANDRE-18 design, and ANDRE-18's route 2 was rejected with paper verdict 'revise', so make_queue applies none of ANDRE-18's routes.

**Fix:** Give BS22 Theorem 10.9 with J = (g) an owner, the Q5 stage of the perfectoidization finding, and make PerfectoidRamification and DirectSummandsAndBigCohenMacaulay import it. Reword the ANDRE-18-B route 4 brief so that it does not rest on a rejected route. Alternatively, finish the ANDRE-18 revision and accept its Abhyankar items as their own Part II scope before DESIGN-PerfectoidRamification runs.

### 3. missing, high

**Where:** DiamondsAndVStacks:D6; consumers RelativeFarguesFontaine:RF0:integral-Y, RF2:integral-divisors, GeometricSatakeAndFusion:GS0:loop-geometry, GS1; Part II DiamondsAndVStacksIntegralPartII (KISIN-PAPPAS-ZHOU-26 route 6, GLEASON-LIM-XU-26 route 9)

No layer plans the v-sheaf X^♢ of a non-analytic pre-adic space or Huber pair (Scholze–Weinstein, Berkeley Lectures §§18.1–18.2): Spd O_E, Spd O_C, Spd(R,R), Spd(R⁺,R⁺) and the v-sheaves of formal schemes. D6 builds only Spd ℤ_p, Spd(A,A⁺) for Tate pairs, and X^♢ for analytic spaces. AdicCoefficientsAndComparisons:L1 builds only v-sheaves of schemes and is not an ancestor of the consumers. Neither library has any of it. Consumer statements cannot be formulated without it: FS II.1.2, the definition Div^d_𝒴 = (Spd O_E)^d/Σ_d, GS1's categories over Spd(O_C), and the integral Part II briefs.

**Fix:** Add a DiamondsAndVStacks sub-stage D6:pre-adic with the construction of SW §§18.1–18.2: X^♢ for any pre-adic space over Spa ℤ_p, Lemma 18.1.1 (via ECD 15.1(i) and D2's v-descent of O⁺), Prop. 18.2.2 and Lemma 18.1.2. Tests: Spd O_E, (Spd O_E)^d, Spd O_C, Spd(R,R), Spd(R⁺,R⁺) and Spf; comparison maps with L1's integral conventions. D6 is already an ancestor of RF0:integral-Y, RF2:integral-divisors, GS0 and GS1, so no new atlas edge is needed. The RF nodes name it as their supplier, and the DiamondsAndVStacksIntegralPartII brief imports it.

### 4. duplicate, high

**Where:** HodgeTateAndCanonicalSubgroups:T6:comparison vs PerfectoidShimuraVarieties:S6

The general Hodge–Tate morphism on the toroidal tower diamond, with its Levi-torsor pullback (Boxer–Pilloni, Higher Coleman theory, Thm 4.4.40), is planned in two layers. No accepted restructuring assigns an owner: RS-05 keeps S6, but HodgeTateAndCanonicalSubgroups is not in its family and none of its owners entries covers this theorem.

**Fix:** Add an owners entry {target 'General-datum toroidal-tower π^tor_HT and Levi-torsor pullback (BP Thm 4.4.40)', owner PerfectoidShimuraVarieties:S6, formerly [HodgeTateAndCanonicalSubgroups:T6:comparison]}. Narrow T6:comparison, the T6 parent text and the roadmap summary to the finite-level logarithmic content (log period sheaves, log Poincaré lemma, log Riemann–Hilbert, W_p⊗OB_dR,log ≅ W_dR⊗OB_dR,log, the HT filtration and M_HT = M_dR at finite level, BP 4.4.38–4.4.39), exported to S6 through the existing T6→S6 edge.

### 5. other, medium

**Where:** PerfectoidSpaces:P1 nodes P1/cotangent-complex-vanishing-mod-varpi and P1/deformation-lifting-of-perfectoid-mod-varpi-algebras; RS-05 narrowing of P0

The accepted decomposition proves the tilting equivalence by Scholze 2012's field-only route: the almost cotangent complex and Gabber–Ramero almost deformation theory. RS-05 therefore makes P0 build the almost cotangent/deformation extension. That work is unnecessary. P1 already plans ECD 3.14–3.17, the classification of untilts with its converse construction, and in the literature this implies the tilting equivalence (ECD 3.13) directly in the general Tate-ring setting P1 demands, with no cotangent complex. Scholze 2012's route proves only the field case, which is the gap the decomposition records.

**Fix:** In P1, derive ECD 3.13 as a corollary of 3.17 (untilt a perfectoid R♭-algebra T as W(T⁺)/J·W(T⁺)[1/[ϖ]] with J = ker θ_R). Drop the two Scholze 2012 deformation nodes or mark them optional alternatives. Remove from RS-05's P0 narrowing the almost-context cotangent/deformation extension and the DD.0 → P0/P1/P2/P3/P7 links added only for it, keeping any almost-étale lifting that P0 or P3 need for their own results as a separate question for P3.

### 6. error, medium

**Where:** Stage edge PerfectoidQuotients:Q4 → AdicEtaleGeometry:A3

A3 lists Q4 among its inputs, but the proof A3 implements (ECD Prop. 6.4(iv)) works in characteristic p. It uses Huber 1.7.1, Kedlaya–Liu's pseudocoherent sheaves and FS IV.4.19, which concerns Zariski-closed immersions of sousperfectoid spaces in FS's surjectivity sense. It does not use ECD 5.8 or BS22 7.4 (prismatic perfectoidization), and the transfer by tilting concerns the étale map, which P3 supplies. The single edge makes derived prismatic cohomology an ancestor of every diamond: with the accepted RS links applied, deleting it removes 17 stages from D1's ancestry (PR.0–PR.2, the seven Q stages, CR.0–CR.2, DD.1, DD.2, DD.5, E4).

**Fix:** Delete Q4 → A3 and remove Q4 from A3's Inputs line. If a characteristic-p Zariski-closed statement is needed, have P4 prove it elementarily (torsion paper Lemma II.2.5, extended to perfectoid Tate rings of characteristic p) and add P4 → A3. Keep P3 → A3 for the tilting transfer. Q4 then remains an input only of P8, S2, S4 and PR.4.

### 7. duplicate, medium

**Where:** Part II PerfectoidQuotientsIntegralPerfectoidPartII (CESNAVICIUS-SCHOLZE-24 route 3, accepted) vs PerfectoidQuotients:Q0:integral-algebra, PerfectoidSpaces:P7 and Q4

The Part II plans, as missing, statements that earlier accepted routes already assigned to existing layers, or that Q4's own proof needs before any Part II can exist. No restructuring covers this. It also imports Scholze's rank-one tilting from the wrong stage.

**Fix:** Move ČS24/010, /012, /013, /014, /017, /018 and /019 into Q0:integral-algebra, so that Q4 imports them, and /037 into P7. The Part II keeps the ind-syntomic André lemma (2.3.4 with 2.3.1–2.3.2), fibre products (2.1.4), valuation-ring tilting (2.1.9), 2.1.12, semiperfectoid covers (2.3.7) and /020. Change the P1 import to P3.

### 8. duplicate, medium

**Where:** PerfectoidSpaces:P1 vs RelativeFarguesFontaine:RF2:untilts (and FarguesFontaineDiamonds:F4)

The marked-untilt / primitive-θ-kernel correspondence is planned in P1 and again in RF2:untilts. RS-05's owner entry makes P1 the owner only against D6 and S5. The RS-20 owner entry that would resolve it is not a decision, because RS-20 is needs_changes over an unrelated RF3 issue.

**Fix:** Apply that single RS-20 owner entry independently of RF3: RF2:untilts and F4 import P1 for the p-typical correspondence and add only the E-linear and divisor statements, with edge P1 → RF2:untilts.

### 9. error, medium

**Where:** AdicSpacesPartII:R5; RS-05 links R5 → AdicEtaleGeometry:A3 and R5 → PerfectoidSpaces:P6

R5 is a single stage bundling the early sousperfectoid class, which is all A3 uses, with family coefficient sheaves, whose input is ClassicalAdicEtaleCohomology:H0. RS-05's stage-level links therefore put H0 (classical étale sheaves, D⁺, constructibility) upstream of A3, P6, D1–D6 and everything diamond-based, although none of them uses H0. The path H0 → R5 → P6 → D1 exists only through the RS links, and R5's text cites a nonexistent 'ClassicalAdicEtaleCohomology C0'.

**Fix:** Split R5 into R5:sousperfectoid (nodes R5/sousperfectoid-rings and R5/perfectoid-times-smooth-fibre-product; inputs Tau Ceti AdicSpaces Layers 0–5, R0 and P0–P3 only) and R5 (families and coefficient sheaves, keeping H0, R3, E1, DD.0). Re-point the RS-05 links R5 → A3, RF0:integral-Y, RF0:annuli and BG0 to R5:sousperfectoid, drop R5 → P6, and correct 'C0' to H0.

### 10. duplicate, medium

**Where:** DiamondsAndVStacks:D5 vs TropicalAndBerkovichArithmetic:TB.0

Two layers plan the Berkovich spectrum M(R) of bounded multiplicative seminorms and the theorem that |Spa(A,A⁺)| → M(A) is the maximal Hausdorff quotient: D5 for affinoid perfectoid spaces (ECD 13.7–13.11) and TB.0 for Banach and strictly affinoid algebras. There is no edge between them and no restructuring covers the pair.

**Fix:** Make an early TB.0:spectrum (inputs LI.0 and Tau Ceti AdicSpaces Layer 2 only) the single owner of M(R) for Banach and complete Tate rings and of the maximal-Hausdorff theorem for complete Tate Huber pairs, built on MulRingSeminorm and T2Quotient. Narrow D5 to ECD 13.10–13.13, the extension to small v-sheaves, and add TB.0:spectrum → D5 (acyclic).

### 11. error, medium

**Where:** RS-05 owners entry 'Diamond canonical compactification geometry' → DiamondsAndVStacks:D5; RS-05 layers D5, D2, DiamondEtaleCohomology:C4, DiamondSixOperations:S0

RS-05 assigns the canonical compactification (ECD §18) to D5. But D5's text disclaims it, and C4 is kept unchanged with the construction still in its text. The decision is implemented nowhere. DiamondsAndVStacks has no decomposition yet, so its blueprint will follow RS-05's D5 reason while C4 also builds the object, which duplicates it. The same off-by-one shift in RS-05's DiamondsAndVStacks reasons gives effective descent (ECD 9.2–9.11, D3's text) to D2.

**Fix:** Either correct the owner to DiamondEtaleCohomology:C4 (formerly D5 and S0) and rewrite the D5 and D2 keep reasons to match their texts (D5 = ECD §§11–13; effective descent = D3), or narrow C4 to cohomology and extend D5 with ECD §18. The proposal must pick one.

### 12. error, medium

**Where:** BHATT-MATHEW-21 route 2 (accepted) → DiamondsAndVStacks:D0, items /58–/61

Items /58–/61 are ∞-categorical sheaf statements, and D0 is strictly 1-categorical. D0 precedes the enhanced-sheaf owner (atlas edges D0 → E1 and D0 → E2), so it cannot import E1's model without a cycle and would have to build a second ∞-sheaf model.

**Fix:** Re-route /58–/61 to EnhancedDerivedSheaves (E1/E2, with E0's quasicategory operations) or to the arc-topology roadmap; keep only the spectral-space items /38–/43 in D0, or restate /58–/61 there in 1-categorical form.

### 13. other, medium

**Where:** Part II DiamondsAndVStacksIntegralPartII (KISIN-PAPPAS-ZHOU-26 route 6, GLEASON-LIM-XU-26 route 9, both accepted)

One Part II id carries two titles and two briefs. make_queue.py writes one prompt per job id, and KISIN-PAPPAS-ZHOU-26 comes later in papers.json (#143 against #77). So its 2-item brief wins, and Gleason–Lim–Xu's 13 accepted items drop out of the design job: reduction, formally adic morphisms, specializing v-sheaves, the specialization map, kimberlites, tubes, and Gleason 4.53/4.55.

**Fix:** Write one merged brief under one title (GLX's items plus KPZ's explicit targets: SW 18.4.1 with its hypotheses, the v-sheaf of a flat closure, gap E34) on one route, or have make_queue.py merge briefs sharing an id. The merged brief imports D6:pre-adic.

### 14. error, medium

**Where:** ZAVYALOV-25 route 4 (accepted 2026-09-23) → AdicSpacesPartII:R2 and F0

All seven items concern admissible formal O_K-schemes with K algebraically closed, which are non-noetherian (BLR Thm 2.7.1, B.2–B.15, Elkik over O_K). RS-05 narrowed F0 to noetherian Spf and explicitly kept these objects in R2. The route's review justified F0 with the very paragraph RS-05 removed.

**Fix:** Set route 4's stages to [AdicSpacesPartII:R2] only.

### 15. missing, medium

**Where:** AdicEtaleGeometry:A0 as narrowed by RS-05 (suppliedBy AdicSpacesPartII:R0)

RS-05 dropped A0's paragraph on the global analytic locus, analytic adic spaces over Spa(ℤ_p,ℤ_p) and Tate charts on non-Tate (Witt) inputs, and named no supplier that plans it. Tau Ceti AdicSpaces Layer 2.3 owns only the affinoid Spa(A,A⁺)^a, and R0's keeps do not contain it. D6 (ECD Def. 15.5), A4 and RF0:integral-Y are stated on analytic adic spaces or analytic opens of Witt Huber pairs.

**Fix:** Restore to A0's keeps, or add to R0: X^a ⊂ X as an open adic subspace independent of the chart; morphisms into analytic spaces are adic; the full subcategory of analytic adic spaces over Spa ℤ_p; Tate charts on the analytic locus of non-Tate pairs (the Witt rings of RF0). Import Tau Ceti Layer 2.3.

### 16. error, medium

**Where:** RelativeFarguesFontaine:RF2:untilts (and parent RF2, README §RF2)

The stage defines the wrong object as Div^1. Over Perf_Fq, Div^1 = Spd(E)/φ^ℤ (FS Def. II.1.19). The formula Spd(Ĕ)/φ^ℤ holds only after restricting to Perf_k with k = F̄_q: over Perf_Fq, Spd Ĕ = Spd E × Spd F̄_q, and φ moves only the F̄_q-structure. The text contradicts FarguesFontaineDiamonds F4 and its own reviewed node.

**Fix:** In RF2:untilts, RF2 and the README, write: 'Define Div^1 = Spd(E)/φ^ℤ on Perf_Fq (FS II.1.19), and prove its presentation Spd(Ĕ)/φ^ℤ after restriction to Perf_k, k = F̄_q (FS p. 61).' This is independent of the RF3 blocker in RS-20 and can be applied now.

### 17. error, medium

**Where:** RelativeFarguesFontaine:RF2:untilts, node div1-moduli-and-properness — missing prerequisites

The node proves FS II.1.21 (Div^1 → * is proper, representable in spatial diamonds and cohomologically smooth). That proof needs ECD Prop. 24.5 and the valuative criterion ECD 18.3, which the atlas plans only in DiamondSixOperations:S5 and DiamondEtaleCohomology:C4. RF2:untilts has no ancestor in either. Adding those edges would put RF3, RF4, VB1, BG0 and everything below behind the six-functor formalism. Every actual consumer of II.1.21 (HS0, HS1, VS1, VB3:general-BC) already descends from S5 and C4.

**Fix:** Keep only the definition of Div^1 and the degree-1 divisor description in RF2:untilts. Move the properness/smoothness statement to a stage after C4 and S5: VectorBundlesAndIsocrystals:VB3:general-BC already owns FS II.3.7, of which Div^1 = (BC(O(1))∖0)/E^× is a case by II.2.4, or else to a new RF2 child with edges C4, S5 → child → HS0, HS1, VS1. Do not add C4 or S5 → RF2:untilts.

### 18. missing, medium

**Where:** RelativeFarguesFontaine:RF0 (period domains); GUO-REINECKE-24 route 6; nodes VB1/cohomology-of-twists and VB3:positive-basic-examples/lubin-tate-universal-cover

No layer plans the part of Spa W_{O_E}(R⁺) where [ϖ] = 0: the locus 𝒴_{[0,∞]} = Spa W(R⁺) ∖ V(π,[ϖ]), its affinoids Y_{S,[r,∞]} and rings B_{R,[r,∞]}, sheafiness of W_{O_E}(R⁺)[1/π] with the π-adic topology, and Kedlaya's adic-to-scheme equivalence for vector bundles there. Consumers include FS II.2.5 (planned as a VB1 node), FS II.2.2 in the p-adic case (VB3), the accepted GUO-REINECKE-24 route 6, and AInfCohomology AI.2. The libraries have none of this.

**Fix:** Add an RF0 child (e.g. RF0:crystalline-end) constructing 𝒴_{[0,∞]}, Y_{S,[r,∞]}, B_{R,[r,∞]}, the π-adic sheafiness of W_{O_E}(R⁺)[1/π] with FS's two short exact sequences (p. 63), Kedlaya Thm 3.8 and SW20 Prop. 14.2.6. Add edges from it to VB1, VB3:positive-basic-examples and AI.2's essential-surjectivity part. Retarget GUO-REINECKE-24 route 6 and the GR Part II import to it.

### 19. error, medium

**Where:** AInfCohomology:AI.2 (consumer of RelativeFarguesFontaine:RF4:vector-bundles)

AI.2 plans Fargues' equivalence ('Construct both directions') from BMS1 Thm 4.28 and its proof. But BMS1 proves only full faithfulness (Remark 4.29) and defers essential surjectivity to Scholze–Weinstein, whose proof (SW20 Thm 14.1.1) uses the classification of vector bundles, GAGA for the curve and Kedlaya on Y, none of which AI.2 has. Conversely, full faithfulness, which is all BMS's main theorems need, uses no curve input. Yet the edge RF4:vector-bundles → AI.2 raises AI.2's ancestor count from 24 to 72, putting diamonds, FarguesFontaineDiamonds F0–F3, RF0–RF2 and AdicSpacesPartII in front of AI.5, PR.7 and 194 descendants.

**Fix:** Split AI.2 into (a) the BKF category and full faithfulness (BMS1 Lemmas 3.23, 4.26, Remark 4.29), with no Fargues–Fontaine-curve input, dropping RF4:vector-bundles → (a); and (b) essential surjectivity, sourced to SW20 Thm 14.1.1 and §§14.2–14.3, with edges from VB2:classification, VB2:ampleness, RF4:vector-bundles and the new RF0 crystalline-end child. Retarget AI.5 to (a) and other consumers by what they use.

### 20. duplicate, medium

**Where:** PadicHodgeTheory:R06.1 vs RelativeFarguesFontaine:RF2:untilts (node BdR-completion-and-filtration)

B_dR⁺ and B_dR, with the theorem that B_dR⁺(C) is a complete DVR with residue field C, are planned twice, with no edge or comparison between the two, and consumers cite different owners. RS-01 made R06.1 the owner of the rational period rings without considering RF2:untilts; RS-20 asks only for comparison with the Mathlib carriers.

**Fix:** R06.1 owns B_dR⁺(C) for arbitrary complete algebraically closed C over E (on Mathlib BDeRhamPlus), including the complete-DVR/residue-field theorem. Add R06.1 → RF2:untilts. RF2:untilts keeps only the relative completion B⁺_{Div^1}(S), its I_S-adic filtration and the identification at geometric points with R06.1's ring. Align the HOWE-KLEVDAL-26 brief.

### 21. other, medium

**Where:** RS-20 blocker (RF3) together with the VectorBundlesAndIsocrystals ordering gaps

RS-20's open blocker (RF3's global map X_S → Proj P needs the covering by non-vanishing loci of positive-degree sections, FS II.2.6, which sits in the later VB2:ampleness) is solvable, but not inside RF3 alone. It is one instance of a single order inversion in the FS II.2 chain across RF3, VB1, VB2:ampleness and VB3:positive-basic-examples. At a geometric point the covering is elementary, while for affinoid S it needs II.2.6. Degree (II.2.10) needs II.2.9, which sits in VB2:ampleness, so VB1's degree node already depends on a stage downstream of VB1.

**Fix:** Adopt REV-RS-20~2's option 2 in this acyclic form: (1) RF3: O(n), the graded ring P and chart maps on D₊(g) only; (2) an early VB1 part: II.2.1 descent, the isocrystal functor, II.2.5 cohomology of O(λ), co-located with VB3's II.2.2–II.2.4; (3) a geometric-point stage: classical points (II.1.11, II.1.22), X_C → X_C^alg, II.2.9 and II.2.10; (4) VB2:ampleness: II.2.6, the global map for affinoid S, II.2.7; (5) VB2:classification.

### 22. duplicate, medium

**Where:** HodgeTateAndCanonicalSubgroups:T2 vs PerfectoidShimuraVarieties:S3 (and the HigherHidaAndColemanTheory and PAN-26 briefs)

The Hodge-type Hodge–Tate period map is planned twice, together with its main properties: the map on the tower, Hecke equivariance, the Levi-torsor pullback, the elliptic 𝒪(1) formula and the Hilbert restriction-of-scalars identification. RS-05 kept S3 without considering T2, and briefs of the same Part II name different owners. T2 also builds a map 'on a tower' without an edge from the tower's construction.

**Fix:** Add an owners entry {target 'Hodge-type π_HT on the tower: equivariance, Levi-torsor/automorphic-bundle pullback, elliptic π_HT*𝒪(1)=ω and Hilbert Res_{O_F/Z}P¹ identification', owner PerfectoidShimuraVarieties:S3, formerly [HodgeTateAndCanonicalSubgroups:T2]}. Narrow T2 to the finite-level HT exact sequence, the HT parabolic reduction and its comparison with the de Rham torsor, and the PEL and Hodge-tensor flag conditions. Align the four briefs on the single owner.

### 23. error, medium

**Where:** PAPER-BOXER-CALEGARI-GEE-PILLONI-25 route 23 (source → HodgeTateAndCanonicalSubgroups T4, T5, T6; items 4.4.1-usual, 4.4.1-cusp, 4.4.1-analytic-usual, 4.4.1-analytic-cusp)

Four statements comparing completed cohomology with coherent cohomology on the infinite-level toroidal tower are routed to layers that plan none of them: T4 is the BHW period estimates, T5 Igusa torsors and ω^int, T6 log sites and log Riemann–Hilbert. All four items are 'missing' with no planned layer, yet the review accepted them as 'the paper's uses of that layer rather than new theory'.

**Fix:** Remove the four items from route 23. Route 4.4.1-usual and 4.4.1-cusp to TorsionCohomologyInfrastructure:TC.2 (Hodge-type toroidal rational form), and 4.4.1-analytic-usual/-cusp to BCGP-25 route 22 (HigherHidaAndColemanTheory), which already holds VB_Σ and the Sen items. Both import the logarithmic primitive comparison of the next finding.

### 24. missing, medium

**Where:** Scholze's primitive comparison theorem and its logarithmic version: owner PadicHodgeTheory:P8 (via accepted source routes); consumers CohomologyComparisons:CP.3, TorsionCohomologyInfrastructure:TC.2, IgusaVarietiesAndTorsionConcentration:IG.3, BCGP-25 Thm 4.4.1, HodgeTateAndCanonicalSubgroups:T6

Scholze's primitive comparison theorem for proper smooth adic spaces over C (Scholze 2013 Thm 5.1, with Thm 4.9 and Lemma 4.12) is assigned to PadicHodgeTheory:P8 only through accepted source routes (ZAVYALOV-25 route 7; BHATT-MORROW-SCHOLZE-18 for the finiteness theorem). Neither P8's stage text nor the PadicHodgeTheory decomposition records this; the decomposition says 'no owner stage was identified', and CohomologyComparisons' decomposition lists 'Scholze Theorem 5.1 owner' as open. CP.3 reaches only the prefix P8:local-rational, not P8. The logarithmic (Kummer-étale) version (Diao–Lan–Liu–Zhu, Thm 6.2.1), which BCGP-25 Thm 4.4.1 uses, is planned nowhere, and T6:log-sites takes only DLLZ's site.

**Fix:** Do not simply add P8 → CP.3: CP.3 is already an ancestor of P8, so that edge would close a cycle. Instead, split the primitive comparison into an early stage PadicHodgeTheory:P8:primitive before P8:local-rational, owning Scholze 2013 Thm 4.9, Lemma 4.12, Thm 5.1 and the finiteness corollaries (with the items routed to P8 by ZAVYALOV-25 route 7 and BHATT-MORROW-SCHOLZE-18). Its inputs (PerfectoidSpaces P2/P3, AdicEtaleGeometry A1, AdicSpacesPartII R3, ClassicalAdicEtaleCohomology H0) are already ancestors of P8:local-rational. Add edges P8:primitive → P8:local-rational, CohomologyComparisons:CP.3, TorsionCohomologyInfrastructure:TC.2 and IgusaVarietiesAndTorsionConcentration:IG.3, and close the two stale 'no owner' gaps. Add HodgeTateAndCanonicalSubgroups:T6:log-primitive (DLLZ Thm 6.2.1 with its finiteness/vanishing corollaries) between T6:log-sites and T6:comparison, importing P8, and export it to TC.2 and the HigherHidaAndColemanTheory design.

### 25. error, medium

**Where:** PAPER-CARAIANI-SCHOLZE-17 route 6 (items 52, 53, 143 → HodgeTateAndCanonicalSubgroups:T2); consumer EndoscopicTransferAndUnitaryTraceComparison:ET.6a

Local Scholze–Weinstein results were routed into T2, which sits downstream of AutomorphicBundles B0–B2 and ShimuraVarieties V0–V8: Thm 5.1.4 (p-divisible groups over O_C/p and bundles on X_{C♭}), Thm B/5.2.1 (p-divisible groups over O_C ↔ pairs (T,W)) and Prop. 5.1.6. The same paper routed their companions (SW Thm A, universal covers) to FiniteFlat R07.1/R07.2. T2 lacks the imports the route requires, and ET.6a, which the extraction identifies as resting on this classification, has no edge to T2.

**Fix:** Move items 52, 53 and 143 to a new FiniteFlatGroupsAndIntegralPadicHodgeTheory stage after R07.2 importing VB1, VB2:ampleness and VB2:classification, with edges to T2, IG.3 and ET.6a (checked acyclic); T2 keeps the global HT sequence and torsors. Minimum repair if the route stands: add VB1, VB2:ampleness, VB2:classification → T2 and T2 → ET.6a.

### 26. duplicate, medium

**Where:** HodgeTateAndCanonicalSubgroups:T0 (via PAPER-PILLONI-20 route 8) vs HilbertModularVarietiesAndShimuraCurves:H2 (also AlgebraicModularFormsAndSerreWeights:R15.3, ShimuraCompactifications:C6)

Paper routes made T0 the owner of the Hasse invariant Ha(G) = det V* of a BT_1 over any F_p-scheme, and of Fargues' LF. Yet H2 constructs the Hilbert instance and R15.3 the elliptic one. T0 is an ancestor of none of H2, C6, R15.3 or IG.2, and T0 sits downstream of ShimuraCompactifications:C4, so those stages cannot import it. No accepted restructuring decides this, and one brief cites three owners for the same invariant.

**Fix:** Own Ha(G) = det V*, LF and the BT_1 Hodge–Tate sequence in FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2, which already plans Frobenius/Verschiebung and is upstream of H2, C6, IG.2 and T0. T0 keeps only the semi-abelian/boundary extension. H2 builds its Hasse ideal from the imported Ha, and R15.3 proves compatibility of its elliptic Ha (add edge R07.2 → R15.3). Add the owners entry and re-point the four briefs.

### 27. other, low

**Where:** PAPER-BHATT-18 route 9 (unreviewed, Part II RegularRingSplittings) vs PAPER-ANDRE-18-B route 1 (accepted, DirectSummandsAndBigCohenMacaulay)

The direct summand theorem is proposed as the main theorem of two roadmaps. BHATT-18 is unreviewed, so this is not yet accepted duplication, but its review should resolve it.

**Fix:** For REV-PAPER-BHATT-18: mark BHATT-18/direct-summand as planned in DirectSummandsAndBigCohenMacaulay and make it a source route there; restrict RegularRingSplittings to Bhatt's derived splitting theorem (Thms 1.2, 6.1), importing the direct-summand roadmap's purity/retraction prefix and P7's towers.

### 28. error, low

**Where:** PerfectoidSpaces:P7 and its decomposition gap 'Frobenius-controlled towers'

P7's source for the Frobenius-lift perfectoid criterion, 'torsion paper II.1–II.2' (the gap says 'Lemma II.2.1 / Cor. II.2.3 range'), points to the wrong sections, 'Constructing formal models from affinoid covers' and 'Closed Embeddings of perfectoid spaces'. The argument is in §III.2.3, with tilde-limit uniqueness from Scholze–Weinstein, Moduli of p-divisible groups §2.4.

**Fix:** Replace the P7 locator with 'torsion paper §III.2.3, Def. III.2.18 – Cor. III.2.19; Scholze–Weinstein (Moduli of p-divisible groups) Def. 2.4.1, Prop. 2.4.2 and 2.4.5', and correct the decomposition gap.

### 29. library-claim, low

**Where:** data/decompositions/AdicSpacesPartII.json: coverage for R3; nodes R3/stably-uniform-sheafy and R3/tate-kiehl-affinoid

The accepted packet (2026-09-16) predates RS-05 and the pin. Its R3 coverage asserts that Tau Ceti has no adic-space primitives, which is false at f790474. It still plans Buzzard–Verberkmoes, and the Tate half of Tate–Kiehl, as R3 theorems, although RS-05 assigns them to Tau Ceti AdicSpaces Layer 4.

**Fix:** Correct the coverage note, and mark the two nodes as imports of Tau Ceti Layers 4.1/4.2; R3 keeps Kiehl and KL 2.8.12.

### 30. error, low

**Where:** FarguesFontaineDiamonds:F0 and the roadmap record

F0 is literally 'Reuse the actual adic objects' of Tau Ceti AdicSpaces Layer 6, but it has no stage edge from Layer 6, even after RS-05; its only upstream is an unresolved sentinel. The roadmap's prerequisites do not list tauceti:TauCetiRoadmap/AdicSpaces, although PROTOCOL §15 makes a Part II's base its first prerequisite.

**Fix:** Add tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve → FarguesFontaineDiamonds:F0, resolve or retire the UPSTREAM:ECD:FF_ADIC sentinel, and put tauceti:TauCetiRoadmap/AdicSpaces first in the prerequisites.

### 31. error, low

**Where:** Stage edge RelativeFarguesFontaine:RF0:integral-Y → VectorBundlesAndIsocrystals:VB0

VB0 (isocrystals and Dieudonné–Manin, semilinear algebra) needs only W_{O_E}(F̄_q) from RF0's raw ramified-Witt construction. The atlas cannot point at that construction, because the RF0 aggregate depends on its own children, so VB0 is wired to the integral period space and inherits P1–P4, AdicSpacesPartII R0–R3/R5 and A3. The same unaddressable prefix is the target of the ZHU-17/3 and BHATT-SCHOLZE-17/15 routes, whose consumer is GS0:Witt-geometry.

**Fix:** Split node RF0/ramified-witt-universal-property into its own stage (e.g. RF0:ramified-Witt) with inputs LocalFieldsRamification and Mathlib WittVector only, add edges from it to RF0:integral-Y, VB0 and GS0:Witt-geometry, delete RF0:integral-Y → VB0, and retarget the ZHU-17/3 and BHATT-SCHOLZE-17/15 routes.

### 32. error, low

**Where:** HodgeTateAndCanonicalSubgroups:T1 (README dependencies line)

T1's dependency text links 'ClassicalAdicEtaleCohomology C0', which does not exist; the stage edge is to H0.

**Fix:** Replace 'C0' by 'H0' and give the link its anchor.

## What held

- **Single owners.** Almost purity (P3), perfect prisms = perfectoid rings (PR.0), André's flatness lemma (Q3), the Kedlaya–Liu tilde-limits, torsor descent and sheafiness splits, the canonical subgroups (T3) and the Fargues–Fontaine classification (VB2:classification) each have one owner, or were resolved by an accepted restructuring.
- **Numbering.** The BHW canonical-subgroup bounds in T3/T4 match BHW v4. The ECD numbering in the D-stages matches v4.
- **Libraries.** No target marked missing is in either pinned library.
- **Cycles.** None, with or without the accepted restructurings' links.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-AREA-padic-1.result.json`: ok.
- Lean: none. An area red team has no Lean deliverable.
