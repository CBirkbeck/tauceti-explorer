# RT-AREA-padic-1: fixes

Fixer: Claude Code, session `cc-48533a`, 29 September 2026. Issue #3975, job FIX-RT-AREA-padic-1.

- **Findings.** `RT-AREA-padic-1.result.json`. This job takes /1–/26.
- **Verdicts.** `RT-AREA-padic-1.review.json` confirms all of them. /27–/32 are low severity and belong to no fix job.

This job's only deliverable is this report. The queue gives it no atlas, packet, restructuring or paper file to edit (its `outputs` list contains only this file). Each fix is therefore written as exact edits for whoever owns the file:

- the maintainer, for atlas stage texts, stage edges, the READMEs and paper routes;
- the restructuring job, for RS-05 and RS-20 owners entries and links;
- the blueprint or design job, for packet nodes and Part II briefs.

Where a finding's own fix turned out to be wrong, impossible or already applied on main, the section says so and gives the fix that works.

All checks ran on origin/main at e9e99604 (29 September 2026). Four drafters worked in parallel, one per group of findings, and a fifth pass checked the whole report jointly.

- **Quotes.** Every quoted "current text" was matched against its file.
- **Acyclicity.** Every new stage edge was checked alone and then together with all the others. The check used ten versions of the stage graph:
  - `data/atlas.json` stageEdges alone (1968 stages, 3508 edges);
  - with the links of the 23 accepted restructurings, both as `scripts/restructure.py` applies them and as raw lists;
  - with RS-20's links as edited under /21;
  - with placeholder nodes for the Part II roadmaps not yet in the atlas;
  - with the parent–sub-stage edges that `scripts/theory_graph.py` adds;
  - with the optional edges;
  - the full graph that `scripts/build.py` assembles.

  All versions stay acyclic with every deletion and addition in this report applied at once.
- **Conflicts.** The joint pass found three conflicts between sections. They are resolved in the affected sections (marked "Adjusted by the joint check") and summarised at the end.

## Overview

| Finding | Outcome |
|---|---|
| /1 perfectoidization and J-almost purity | Owner is the PerfectoidQuotients Part II that the BS22 review accepted on 24 September, which replaces the proposed Q5. Its export to P8 is sharpened, P8's text is rewritten, and one sentence is added each to S2 and S4. |
| /2 André's Abhyankar lemma | Owner is BS22 Thm 10.9 with J = (g), in the same Part II. The ANDRE-18-B route 4 and route 1 briefs are reworded so that they no longer rest on the rejected ANDRE-18 route. |
| /3 v-sheaves of pre-adic spaces | New early sub-stage DiamondsAndVStacks:D6:pre-adic (SW §§18.1–18.2), with edges to RF0:integral-Y, RF2:integral-divisors, GS1, L1 and C4. Consumer texts are updated and SW20 items /131–/132 are re-planned. |
| /4 toroidal Hodge–Tate morphism | Owner is S6 (owners entry). T6:comparison is narrowed to finite-level logarithmic content, exported through the existing T6 → S6 edge. |
| /5 tilting through untilts | P1 derives ECD 3.13 from 3.17. The Scholze 2012 deformation nodes become optional. RS-05's P0 narrowing is reworded, and the DD.0 links that exist only for P1's narrowing are deleted. |
| /6 edge Q4 → A3 | Deleted, together with the blueprint node, coverage note and README line that recreate it. D1 loses the 17 ancestors the finding lists. |
| /7 Česnavičius–Scholze Part II | Items /009, /010, /012–/014 and /017–/019 move to a new source route to Q0:integral-algebra (needs a review entry). /037 is marked planned at P7. The P1 import becomes P3, and a replacement brief is given. |
| /8 untilt correspondence owner | RS-20's owner entry (P1) is applied now through text edits to F4 and RF2:untilts, with edges P1 → RF2:untilts and P1 → F4. |
| /9 R5 split | New sub-stage R5:sousperfectoid takes 19 nodes, and the RS-05 links from A3, P6, RF0 and BG0 are re-pointed to it. "C0" is corrected to H0. H0 no longer precedes A3, P6 or D1–D6. |
| /10 Berkovich spectrum | New early sub-stage TB.0:spectrum becomes the single owner, with edge TB.0:spectrum → D5. D5 is narrowed to ECD 13.10–13.13. |
| /11 canonical compactification owner | Owner is C4, which the D5 and C4 texts and the packet already agree with. RS-05's reasons and owners entries are corrected, and effective descent goes to D3. |
| /13 integral diamonds Part II | The make_queue half is already fixed on main (commit 7685a59f). The three route briefs are to import D6:pre-adic, and an id mismatch is flagged. |
| /14 Zavyalov route 4 | Stages become [AdicSpacesPartII:R2]. Item /140 is moved from F0 to R2 for the same reason. |
| /15 A0's analytic locus | Already planned (packet node A0/analytic-locus-restriction). RS-05's A0 entry is amended and one DiamondsAndVStacks request is redirected. |
| /16 Div^1 | The text is replaced by Div^1 = Spd(E)/φ^ℤ on Perf_Fq, with the Ĕ presentation only on Perf_k (FS pp. 56, 61, 164). |
| /17 properness of Div^1 | New stage RF2:div1-properness, fed by RF2:untilts, C4 and S5 and feeding HS0 and VS1. It is not an input of RF2. |
| /18 the [ϖ] = 0 locus | New sub-stage RF0:crystalline-end, feeding VB1, VB3:positive-basic-examples and AI.2:essential-surjectivity. Guo–Reinecke route 6 is retargeted, and an RF0 packet error is corrected. |
| /19 Fargues' equivalence | AI.2 keeps full faithfulness and loses the RF4 edge (ancestors 72 → 24). Essential surjectivity moves to AI.2:essential-surjectivity. |
| /20 B_dR owner | R06.1 owns B_dR⁺(C) for every complete algebraically closed C of mixed characteristic, with edge R06.1 → RF2:untilts. RF2:untilts keeps the relative ring and the equal-characteristic case. |
| /21 FS II.2 order | Two of the finding's five steps are already in RS-20~3. Its step (3) contradicts FS. The fix is an arrangement with no new edges inside VectorBundlesAndIsocrystals, in which the four backward node links run forward. |
| /12 Bhatt–Mathew items in D0 | /58–/61 move to ArcTopologyAndDescent together with their consumers /64–/66, since moving only /58–/61 would close a cycle. |
| /22 Hodge-type Hodge–Tate map | The finding's direction is impossible (it closes the cycle T4 → S1 → S2 → S3 → T4). T2 owns the map on the open tower, S3 the perfectoid and compactified statements. S0 → T2 is added, and four briefs are aligned. |
| /23 BCGP-25 route 23 | The route is re-pointed in place to TC.2 with the two usual/cusp items, and the analytic items move to route 22. |
| /24 primitive comparison | New stages PadicHodgeTheory:P8:primitive (after P8:local-rational, not before as the finding had it) and T6:log-primitive (DLLZ Thm 6.2.1). The stale "no owner" gaps are closed. |
| /25 Caraiani–Scholze route 6 | The route joins the prismatic Dieudonné Part II (SW20 route 1), because the proposed new FiniteFlat stage would be a second owner. |
| /26 Hasse invariant | Owner is R07.2 (Ha = det V*, LF, the BT₁ Hodge–Tate sequence), with edge R07.2 → R15.3. T0 keeps the boundary extension, and briefs and PILLONI-20 items are re-pointed. |

## /1 (high, missing): perfectoidization of integral algebras and J-almost purity

**The finding and the verdict.** P8 and S4 follow Hansen–Johansson §5. Their Lemma 5.10 needs Bhatt–Scholze's perfectoidization of integral algebras (BS22 Thm 1.17(1) = Thm 10.11), and the proof of that theorem uses BS22 §8.2 and §10 (almost mathematics along an arbitrary ideal J, and Thm 10.9). No layer planned any of this, because Q2 and Q4 stop at semiperfectoid rings. The finding proposed a new stage PerfectoidQuotients:Q5. The verifier confirmed the atlas half: "Q2 and Q4 do stop at the semiperfectoid case", and "'J-almost' and 'arbitrary ideal' return 0 files". It did not check the BS22 numbering or the claimed cycles. Main has moved on since then. The BS22 review now accepts a Part II for exactly this material, in place of Q5. So what remains is to connect that Part II to P8 and to correct P8's text.

**Checked.**
- data/atlas.json, Q2: "Apply completed perfection to obtain the universal perfectoidization of 7.3". Q4: "Prove BS22 Theorem 7.4". No stage description contains "J-almost". "Perfectoidization" appears only in E5, E5:cotangent-export, Q2, Q4, P8 and PR.2.
- research/blueprint/papers/PAPER-BHATT-SCHOLZE-22.review.json has verdict "accept" (commit a4607bc0, 24 September), with routes 1–6 all accepted.
  - Route 3 is a part-ii route, parent PerfectoidQuotients, id PerfectoidQuotientsPartIIIntegralPerfectoidization. It carries items /47, /51, /52, /57–/63, which include Cor. 8.11–8.12, Prop. 8.5, Def. 10.1–Lemma 10.5, Def. 10.6, Thm 10.9, Thm 10.11, Lemma 10.12 and Rem. 10.13.
  - Its reason says: "The red team RT-AREA-padic-1 (finding /1) proposed a new stage PerfectoidQuotients:Q5 for the same material; no such stage exists, so a Part II is the protocol's form."
  - Its brief ends: "Export to PrismaticCohomology PR.4 (Theorem 9.1 needs Corollary 8.11, Theorem 11.1 needs Theorem 10.11) and PerfectoidSpaces P8."
- The review also says that edges from Q4 into P0 or P3 would close a cycle. I re-checked this on base. The paths P0 → Q3 → Q4 and P3 → P4 → Q4 exist, and so do P3 → Q0:integral-algebra → PR.0 → PR.1 → PR.2 and Q2 → Q3.
- make_queue.py paper_designs puts every Part II with the same parent into one job: "Every Part II proposal for the same parent, from whichever paper, becomes one job". In research/blueprint/queue.json, the job DESIGN-PerfectoidQuotientsPartII is pending, with roadmapIds ["PerfectoidQuotientsPartII"]. It merges BS22 route 3 with ČS24 route 3 (see /7).
- content/campaign/PerfectoidSpaces/README.md lines 170–184 (the P8 text, identical to the atlas description) are unchanged. They still say "Under Hansen–Johansson §5's invariant affinoid-cover hypothesis", "combine the tower's closed loci with Q4's universal perfectoidization" and "Source: Hansen–Johansson §5 and ECD 5.8".
- research/blueprint/packets/PerfectoidSpaces--P8.json (partial, 24 September) already does the packet-level work:
  - Node P8/integral-extension-of-perfectoid-pair is HJ Lemma 5.10, with the hypothesis "Uses the perfectoidization of integral algebras over perfectoid rings (Bhatt–Scholze Theorem 1.17(1) = Theorem 10.11 …) which no atlas layer owns: recorded as a gap".
  - Node P8/finite-tower-over-perfectoid-tower is HJ Lemma 5.9, with the acceptance test "Hodge-type minimal compactifications finite over Siegel ones (Proposition 5.14)".
  - A gap entry: "Perfectoidization of integral algebras (Bhatt–Scholze Theorem 1.17(1) = 10.11) has no atlas owner … When that roadmap exists, its node for Theorem 10.11 is the prerequisite of the integral-extension lemma."
  - Source han16, "Quotients of adic spaces by finite groups".
  - A restructure note: the hypothesis "is that of Hansen 2016 … Hansen–Johansson … replace it by analytic separation".
- Edges P7 → P8, P8 → S2 and P8 → S4 exist on base.
- Acyclicity (check1.py). The model has a Part II placeholder with imports PR.0, PR.2, Q2, Q3, Q4 and P0, and exports P8 and PR.4. It also has an ArcTopologyAndDescent placeholder that imports SF.0–SF.2, EDC.0, EDC.4, E2, D0, LD.0, K.5, K.6, AdicSpaces Layers 0–1, A0, A1, GS0:Witt-geometry, Q0, Q0:integral-algebra, PR.0 and P1, and that feeds the Part II. This model is acyclic on base, RS and full. It stays acyclic with extra direct edges to S2 and S4. No export (P8, PR.4, S2, S4) reaches any import.

**Fix, as edits.**
1. Do not add a stage Q5. The owner is the accepted BS22 route 3 Part II, which is built by DESIGN-PerfectoidQuotientsPartII. The finding's step "At the BS22 review, route its items /52, /60, /61 to Q5" is already applied on main in this form: route 3 carries those items together with /47, /51, /57–/59, /62 and /63. Owners entry, for the record:
   `{"target": "Perfectoidization of integral algebras over a perfectoid ring and almost purity along an arbitrary ideal (BS22 Prop. 8.5, Cor. 8.11–8.12, Def. 10.1–Lemma 10.5, Def. 10.6, Thm 10.9, Thm 10.11, Lemma 10.12)", "owner": "PerfectoidQuotientsPartII:<the stage the design gives Theorem 10.11>", "formerly": []}`
2. research/blueprint/papers/PAPER-BHATT-SCHOLZE-22.result.json, route 3, brief. Replace "Export to PrismaticCohomology PR.4 (Theorem 9.1 needs Corollary 8.11, Theorem 11.1 needs Theorem 10.11) and PerfectoidSpaces P8." with:
   "Export to PrismaticCohomology PR.4 (Theorem 9.1 needs Corollary 8.11, Theorem 11.1 needs Theorem 10.11) and to PerfectoidSpaces P8, whose node P8/integral-extension-of-perfectoid-pair (Hansen–Johansson Lemma 5.10) records Theorem 10.11 as a gap. PerfectoidShimuraVarieties S2 and S4 receive it through P8 (Hansen–Johansson Lemma 5.9 and Proposition 5.14); do not add separate exports to them."
3. New stage edges when the Part II enters the atlas: from the Part II stage that owns Theorem 10.11 to PerfectoidSpaces:P8, and to PrismaticCohomology:PR.4 as the brief already says. The acyclicity check is above: no path leads from P8 or PR.4 back to any import of the Part II or of the arc roadmap, on base, RS or full. I do not propose the finding's direct edges to S2 and S4. They are implied by P8 → S2 and P8 → S4, and they would also be acyclic.
4. content/campaign/PerfectoidSpaces/README.md, § P8, and the same text in the data/atlas.json description of PerfectoidSpaces:P8:
   - Line 170. Replace "Dependencies: P3–P7, PerfectoidQuotients Q4 and DiamondsAndVStacks D4 for quotient comparison." with "Dependencies: P3–P7, PerfectoidQuotients Q4, the Part II of PerfectoidQuotients for the perfectoidization of integral algebras (Bhatt–Scholze, Prisms, Theorem 10.11), and DiamondsAndVStacks D4 for quotient comparison."
   - Line 171. Replace "Under Hansen–Johansson §5's invariant affinoid-cover hypothesis, construct finite group" with "Under Hansen's invariant affinoid-cover hypothesis, and under Hansen–Johansson's analytic-separation hypothesis, from which they obtain such a cover, construct finite group".
   - After line 182 ("assertion that every algebraic ideal quotient is already complete and perfectoid."), insert: "For towers that are finite, but not closed, over a perfectoid tower (Hansen–Johansson Lemmas 5.9–5.10, used for Hodge-type minimal compactifications in their Proposition 5.14), import the universal perfectoidization of an integral algebra over a perfectoid ring from the Part II of PerfectoidQuotients. Then prove that an integral extension of a perfectoid Huber pair has an affinoid perfectoid diamond. Q4's semiperfectoid theorem covers closed immersions only."
   - Line 184. Replace "Source: Hansen–Johansson §5 and ECD 5.8." with "Sources: Hansen–Johansson §§5.1–5.2; Hansen, Quotients of adic spaces by finite groups; ECD 5.8; Bhatt–Scholze, Prisms, Theorem 10.11 (imported)."
5. content/campaign/PerfectoidShimuraVarieties/README.md, and the matching atlas descriptions:
   - S2, line 57. After "PerfectoidSpaces P8 and PerfectoidQuotients Q4, T2." add "Finite (normalization) maps to the Siegel tower use P8's Hansen–Johansson Lemmas 5.9–5.10, which import Bhatt–Scholze Theorem 10.11."
   - S4, line 77. After "PerfectoidSpaces P8 and PerfectoidQuotients Q4." add "The descent of Hansen–Johansson §5 uses the perfectoidization of integral algebras only through P8's Lemmas 5.9–5.10."
6. The P8 packet needs no change now. Its gap already names this Part II. When DESIGN-PerfectoidQuotientsPartII has given Theorem 10.11 a node id, the next P8 blueprint round should do two things. It should add that id to the prerequisites of P8/integral-extension-of-perfectoid-pair and delete that node's gap hypothesis. It should also delete the packet's first gap entry.

**Not changed / open.**
- I did not open BS22 or Hansen–Johansson. The BS22 locators are those of the accepted extraction (arXiv v4, checked by its review). The HJ locators and excerpts are those of the P8 packet (hj20, arXiv v2, with a recorded sha256).
- The merged design must order its stages; see /7, "Not changed / open".

## /2 (high, missing): André's perfectoid Abhyankar lemma has no owner

**The finding and the verdict.** Two accepted designs use André's perfectoid Abhyankar lemma (André, "Le lemme d'Abhyankar perfectoïde", Théorème 0.3.1): PerfectoidRamification (ANDRE-18-B route 4) and DirectSummandsAndBigCohenMacaulay (ANDRE-18-B route 1). Both import it from the companion extraction PAPER-ANDRE-18, which supplies nothing. The finding proposed giving BS22 Theorem 10.9 with J = (g) an owner (its Q5) and importing it. The alternative it gave was to finish the ANDRE-18 revision. The verifier confirmed this and added that ANDRE-18-B's own accepted review "states the gap itself", and that BHATT-18 route 8 (unreviewed) proposes the same Part II id.

**Checked.**
- PAPER-ANDRE-18.review.json has verdict "revise". Route 2, its PerfectoidRamification Part II, is "reject": "The omnibus Part II mixes genuinely ramified extension with unresolved generic Banach suppliers and potentially duplicated perfectoid results." make_queue.py accepted_routes (lines 390–400) returns [] unless the paper verdict is "accept". queue.json has no revision job for PAPER-ANDRE-18.
- PAPER-ANDRE-18-B.review.json: paper "accept", all seven routes accepted.
  - Route 4 (part-ii, parent PerfectoidSpaces) brief: "Import the companion’s root-algebra, tubular-colimit and ramified Abhyankar results by their extracted ids."
  - Route 1 brief: "Import PerfectoidSpaces P0–P3 and the companion’s shared PerfectoidRamification Part II."
- make_queue groups route 4 by its parent. queue.json has DESIGN-PerfectoidSpacesPartII ("Perfectoid rings and spaces, Part II") pending, together with DESIGN-DirectSummandsAndBigCohenMacaulay.
- Where André's theorem enters:
  - ANDRE-18-B/abhyankar-faithfulness (route 4) reads "In the setting of the companion's Theorem 0.3.1".
  - ANDRE-18-B/abhyankar-mod-p (route 4) has the note "Import the companion's Theorem 0.3.1 … (1) … (2) B°/p^m is almost finite étale over A°/p^m, (3) the trace is almost surjective".
  - The route-1 items almost-pure-finite-basechange, big-cm-existence and weak-functoriality-regular-target depend on abhyankar-mod-p. So DirectSummands uses the lemma only through route 4.
- The ANDRE-18 items for 0.3.1 (/5.2.3-mod-p, /5.3.1-maximal "Theorem 0.3.1(1)", /5.3.1-trace) and for the root algebras and the tubular colimit (/2.9.3-root-algebras, /3.6.1-root-algebra-perfectoid, /2.9.2-tubular-colimit) are all "missing" and are routed by no accepted route.
- PAPER-BHATT-SCHOLZE-22/60 is Theorem 10.9. It is in the accepted route 3 Part II (see /1). Its note says it "improves the perfectoid Abhyankar lemma of André when J = (g) … (Remark 10.10)". The route 3 brief repeats this: "for J = (g) it improves André's perfectoid Abhyankar lemma".
- Only three atlas stage descriptions contain "Abhyankar": IG.5, LPV.5 and Tau Ceti AlgebraicCurves layer 8. All three are the classical tame lemma.
- No paper route other than those of ANDRE-18, ANDRE-18-B and BHATT-18 mentions DirectSummandsAndBigCohenMacaulay or PerfectoidRamification (grep of every result.json), so neither roadmap has a consumer.
- Acyclicity (check2.py). I added two placeholders to the /1 model. PerfectoidRamification imports P0–P3, AdicSpaces Layers 0–5, AdicSpacesPartII:R0, an early DirectSummands stage and the PerfectoidQuotients Part II. A late DirectSummands stage imports R03.1, R03.3, DD.1, P0–P3 and PerfectoidRamification. The graph is acyclic on base, RS and full, with or without a direct edge from the PerfectoidQuotients Part II to DirectSummands.

**Fix, as edits.**
1. Owner. The owner is PAPER-BHATT-SCHOLZE-22/60 (Theorem 10.9, with its Galois form) in the PerfectoidQuotients Part II (BS22 route 3; DESIGN-PerfectoidQuotientsPartII). This replaces the finding's "Q5", which /1 retires. Owners entry:
   `{"target": "The perfectoid Abhyankar lemma (André, Le lemme d'Abhyankar perfectoïde, Théorème 0.3.1), as Bhatt–Scholze Theorem 10.9 with J = (g)", "owner": "PerfectoidQuotientsPartII:<the stage the design gives Theorem 10.9>", "formerly": []}`
2. PAPER-BHATT-SCHOLZE-22.result.json, route 3 brief. After the export sentence (as edited in /1, edit 2), add: "Also export Theorem 10.9 for J = (g), with its Galois form, to the Part II of Perfectoid rings and spaces (PerfectoidRamification; PAPER-ANDRE-18-B route 4, design DESIGN-PerfectoidSpacesPartII). It is the atlas's owner of André's perfectoid Abhyankar lemma (Remark 10.10), because PAPER-ANDRE-18 has no accepted route."
3. PAPER-ANDRE-18-B.result.json, route 4 brief. Replace "Import the companion’s root-algebra, tubular-colimit and ramified Abhyankar results by their extracted ids." with:
   "The companion extraction PAPER-ANDRE-18 has no accepted route (paper verdict 'revise'; its PerfectoidRamification route rejected), so none of its items is an import. Import the perfectoid Abhyankar lemma as Bhatt–Scholze, Prisms and prismatic cohomology, Theorem 10.9 with J = (g), in its Galois form (Remark 10.10; PAPER-BHATT-SCHOLZE-22/60), from the Part II of PerfectoidQuotients (PAPER-BHATT-SCHOLZE-22 route 3). Prove here, as an adapter, the form that abhyankar-faithfulness and abhyankar-mod-p use: the companion's Théorème 0.3.1 (1)–(3) in the almost base (K°[T^(1/p^∞)], T^(1/p^∞)K°°[T^(1/p^∞)]). Until PAPER-ANDRE-18 is revised and accepted, record the root algebras A⟨g^(1/p^∞)⟩ and their perfectoidness (companion Exemples 2.9.3 and §3.6.1) and the uniform colimit of tubular neighbourhoods (companion Proposition 2.9.2) as gaps naming PAPER-ANDRE-18/2.9.3-root-algebras, /3.6.1-root-algebra-perfectoid and /2.9.2-tubular-colimit, not as imports."
4. PAPER-ANDRE-18-B.result.json, route 1 brief. Replace "Import PerfectoidSpaces P0–P3 and the companion’s shared PerfectoidRamification Part II." with "Import PerfectoidSpaces P0–P3 and this paper's Part II of Perfectoid rings and spaces (PerfectoidRamification, route 4). That Part II exports Theorem 3.2.1 (abhyankar-mod-p), which rests on the perfectoid Abhyankar lemma it imports from the Part II of PerfectoidQuotients (Bhatt–Scholze Theorem 10.9)."
5. The stage edges come when the designs exist: from the Part II stage that owns Theorem 10.9 to the PerfectoidRamification stage of abhyankar-faithfulness. They were checked acyclic above. A direct edge to DirectSummands is not needed.
6. Queue, for the maintainer. DESIGN-PerfectoidSpacesPartII is pending and reads the route 4 brief, so edits 3–4 should land before it runs. Adding "after": ["DESIGN-PerfectoidQuotientsPartII"] would let it cite the node id of Theorem 10.9 rather than a roadmap title.

**Not changed / open.**
- I did not check that Theorem 10.9 with J = (g) gives André's 0.3.1 exactly: his almost base (ϖT)^(1/p^∞), his clause (1) (integral closure) and clause (3) (trace), and the choice of ideal (his cover is finite étale over A[1/g], with p already invertible in A). This is why edit 3 makes the passage an explicit adapter. The Remark 10.10 wording is the extraction's quotation.
- The finding's alternative stays open: queue a revision PAPER-ANDRE-18~2 that routes its §2.9, §3.6 and §5 items to an accepted home.
- The review of PAPER-BHATT-18, whose route 8 proposes the same id, should reuse this owner.

## /3 (high, missing): the v-sheaf of a non-analytic pre-adic space has no owner; add D6:pre-adic

**The finding and the verdict.** No stage plans X^♢ for a non-analytic pre-adic space or Huber pair (Scholze–Weinstein, Berkeley Lectures §§18.1–18.2). That includes Spd O_E, Spd O_C, Spd(R,R), Spd(R⁺,R⁺) and the v-sheaves of formal schemes. Yet FS II.1.2, Div^d_𝒴 = (Spd O_E)^d/Σ_d, GS1 and the integral Part II are stated with them. The verifier confirmed both halves. On D6, the non-Tate base is "a distinction to maintain rather than a construction to perform". On L1, it "is an ancestor of none of the four named consumers". The verifier did not check the Scholze–Weinstein quotations. They are now backed by an accepted extraction (see the SW20 bullet below).

**Checked.**
- D6, `content/campaign/DiamondsAndVStacks/README.md` lines 130–149:
  - "Construct `Spd(A,A⁺)` for a Tate `ℤ_p`-pair … Distinguish a Tate pair from an arbitrary formal base such as `(ℤ_p,ℤ_p)`."
  - "Glue these affine objects to define `X^♢` for analytic adic spaces over `ℤ_p`."
- Consumers:
  - RF0:integral-Y (`RelativeFarguesFontaine/README.md` line 36): "Prove II.1.2's untilt functor `𝒴_S^diamond ≅ S × Spd(O_E)`".
  - RF2:integral-divisors (line 65): "Construct `Div^d_𝒴=(Spd O_E)^d/Σ_d`".
  - GS1 (`GeometricSatakeAndFusion/README.md` line 109): "categories over Spd(O_C), Spd(C) and Spd(k̄)".
  - GLX26 item D22: "F_red(Spec R)=F(Spd(R,R))".
- L1 (`AdicCoefficientsAndComparisons/README.md` lines 39–53):
  - It builds "the small v-sheaf of ECD §27 using its adic realization".
  - It builds "marked untilts over `Spa(O,O)` with a morphism of locally ringed spaces to the scheme".
  - L1 has no path to RF0:integral-Y, RF2:integral-divisors, GS0:loop-geometry or GS1, in G_main or in G_rs.
- D6 is already an ancestor of all four consumers, in both graphs:
  - D6 → FarguesFontaineDiamonds:F0 → RF0:integral-Y.
  - D6 → RF2:integral-divisors → GS0:loop-geometry.
  - D6 → VStackSheavesAndLisseCategories:VS0 → GS1.
- New since the red team: PAPER-SCHOLZE-WEINSTEIN-20 (the Berkeley lectures), accepted today in #4606.
  - Item /131 is "Lemma 18.1.1 and Lemma 18.1.2". The first: "For any pre-adic space X over ℤ_p (not necessarily analytic), X^♦ … is a v-sheaf". The second: "Spd 𝒪_C → Spd 𝒪_K is a proper v-cover and Spd 𝒪_C/G_K ≅ Spd 𝒪_K". Locator: Lecture 18, §18.1, p. 161.
  - Item /132 is "Example 18.2.1 and Proposition 18.2.2": "a natural continuous surjection |X^♦| → |X|" (p. 162).
  - The note on /131 agrees with the finding: "the non-analytic (formal and scheme) case of Lecture 18 is planned nowhere".
  - Route 2 sends both items to the Part II DiamondsAndVStacksIntegralPartII. Its brief imports "GeometricSatakeAndFusion GS0:Witt-geometry".
  - GS0:Witt-geometry is downstream of RF0:integral-Y: RF0:integral-Y → GS0:loop-geometry → GS0:Witt-geometry, in G_main.
  - So a Part II owner could not supply Spd O_E to RF0 or RF2 without closing a cycle. The construction must be early, as the finding says, and the two items must move (edit 6).
- Libraries:
  - Tau Ceti f790474 has no Spd, untilt or v-sheaf declaration (git grep of the pinned tree).
  - Tau Ceti's AdicSpaces Layer 3 text says "Define affinoid pre-adic spaces and pre-adic spaces".
  - Mathlib 082e2d3 has `Mathlib/RingTheory/Perfectoid/Untilt.lean`, which contains only the map `untilt : PreTilt O p →* O` (line 49). It has no file for Spd, v-sheaves or diamonds.
- Not checked here: the finding's proof route for Lemma 18.1.1 through ECD 15.1(i). RS-05's D6 entry does keep "ECD 15.1 v-descent of marked untilts".
- Acyclicity. These are the new edges:
  - D6 → D6:pre-adic.
  - Tau Ceti AdicSpaces Layer 3 → D6:pre-adic.
  - D6:pre-adic → RF0:integral-Y, RF2:integral-divisors, GS1, AdicCoefficientsAndComparisons:L1 and DiamondEtaleCohomology:C4.

  None of the targets has a path back to D6:pre-adic, D6 or Layer 3, in G_main or in G_rs. In particular, no path runs from C4 or L1 to D6.

**Fix, as edits.**
1. `content/campaign/DiamondsAndVStacks/README.md`: insert after line 149 (the end of D6), before `## Completion contracts added on 2026-09-15`:

   ```markdown
   <a id="d6-pre-adic"></a>
   <a id="stage-D6:pre-adic"></a>
   ### D6:pre-adic — v-sheaves of pre-adic spaces

   **Inputs:** D6 (`Spd ℤ_p`, marked untilts and their v-descent, `X^♢` of analytic adic spaces), with D2's v-descent of `𝒪⁺` and D4's small v-sheaves and underlying spaces; pre-adic spaces from Tau Ceti AdicSpaces Layer 3.

   For any pre-adic space `X` over `Spa(ℤ_p,ℤ_p)`, not necessarily analytic, define `X^♢` on Perf by sending `S` to the set of untilts `S^♯` of `S` together with a map `S^♯ → X` (Scholze–Weinstein, Berkeley Lectures §18.1). Write `Spd(R,R⁺)` for `Spa(R,R⁺)^♢`; for `(ℤ_p,ℤ_p)` this is D6's `Spd ℤ_p`. Prove Lemma 18.1.1: `X^♢` is a v-sheaf, from D6's v-descent of marked untilts (ECD 15.1) and D2's v-descent of `𝒪⁺`. Prove that on analytic `X` it is D6's `X^♢`, and prove functoriality in `X`.

   Prove Proposition 18.2.2, the natural continuous surjection `|X^♢| → |X|`, with the underlying space of D4; assert smallness of `X^♢` only where the source proves it. Prove the v-cover and quotient parts of Lemma 18.1.2: for `K` complete nonarchimedean with `p` topologically nilpotent and `C` a completed algebraic closure, `Spd 𝒪_C → Spd 𝒪_K` is a v-cover and `Spd 𝒪_C/G_K ≅ Spd 𝒪_K`. Its properness is a test of DiamondEtaleCohomology C4, which owns proper maps of small v-sheaves.

   For a locally noetherian formal scheme, `𝔛^♢` is this functor applied to Huber's adic space of `𝔛` (AdicSpacesPartII R2). Its gluing, full faithfulness on perfect schemes and on normal formal schemes (Berkeley §§18.3–18.4) and specialization belong to the DiamondsAndVStacks Part II, which imports this stage.

   **Tests:** `Spa(ℤ_p,ℤ_p)^♢ = Spd ℤ_p`; `Spd 𝒪_E` and `(Spd 𝒪_E)^d` for RelativeFarguesFontaine RF0–RF2; `Spd 𝒪_C` and `Spd(k̄,k̄)` for GeometricSatakeAndFusion GS1; `Spd(R,R)` for a discrete ring `R`; `Spd(R⁺,R⁺)` for a perfectoid `(R,R⁺)` of characteristic `p`; `Spd(A,A)` for a noetherian adic ring such as `ℤ_p⟦T⟧`; and Example 18.2.1, where for `Spa(𝔽_p[t],𝔽_p[t])` the subfunctor `R ↦ R°° ⊂ R⁺` is open in `|X^♢|` but does not come from an open subscheme.
   ```

2. D6 text (lines 134–135):
   - Current: "Distinguish a Tate pair from an arbitrary formal base such as `(ℤ_p,ℤ_p)`."
   - New: "Distinguish a Tate pair from an arbitrary formal base such as `(ℤ_p,ℤ_p)`; the v-sheaf of a non-Tate pair is D6:pre-adic's."
3. Stage edges to add. D6:pre-adic names its parent, so it is D6's later part and D6's own consumers do not inherit it.
   - D6 → D6:pre-adic.
   - Tau Ceti AdicSpaces Layer 3 → D6:pre-adic.
   - D6:pre-adic → RelativeFarguesFontaine:RF0:integral-Y.
   - D6:pre-adic → RelativeFarguesFontaine:RF2:integral-divisors.
   - D6:pre-adic → GeometricSatakeAndFusion:GS1.
   - D6:pre-adic → AdicCoefficientsAndComparisons:L1.
   - D6:pre-adic → DiamondEtaleCohomology:C4.

   RF2:untilts and GS0:loop-geometry already lie below RF2:integral-divisors, so they need no edge.
4. Consumer texts:
   - `RelativeFarguesFontaine/README.md` line 36.
     - Current: "Prove II.1.2's untilt functor `𝒴_S^diamond ≅ S × Spd(O_E)`."
     - New: "Prove II.1.2's untilt functor `𝒴_S^diamond ≅ S × Spd(O_E)`, with `Spd(O_E)` from DiamondsAndVStacks D6:pre-adic."
   - Same file, line 37.
     - Current: "This prefix requires P1–P4, AdicSpacesPartII R0–R3/R5 and A3,"
     - New: "This prefix requires P1–P4, AdicSpacesPartII R0–R3 and R5:sousperfectoid, A3 and DiamondsAndVStacks D6:pre-adic,". The R5:sousperfectoid part is /9's.
   - Same file, line 65.
     - Current: "Construct `Div^d_𝒴=(Spd O_E)^d/Σ_d`, with the quotient understood as a v-sheaf,"
     - New: "Construct `Div^d_𝒴=(Spd O_E)^d/Σ_d`, with `Spd O_E` from DiamondsAndVStacks D6:pre-adic and the quotient understood as a v-sheaf,"
   - `GeometricSatakeAndFusion/README.md` line 109.
     - Current: "categories over Spd(O_C), Spd(C) and Spd(k̄), after choosing the split integral model."
     - New: "categories over Spd(O_C), Spd(C) and Spd(k̄) (Spd(O_C) and Spd(k̄) = Spd(k̄,k̄) from DiamondsAndVStacks D6:pre-adic), after choosing the split integral model."
   - `AdicCoefficientsAndComparisons/README.md`: after line 53, add: "The v-sheaf of the adic realization, and `Spd(O,O)`, are DiamondsAndVStacks D6:pre-adic's `X^♢` of a pre-adic space. Import them. This stage glues along affine covers, constructs the site comparisons and the relative representability of 27.5, and provides the comparison maps between the two integral conventions."
   - `DiamondEtaleCohomology/README.md`: after line 87 (end of C4), add this line:

     ```markdown
     **Test:** `Spd 𝒪_C → Spd 𝒪_K` is proper (Scholze–Weinstein, Berkeley Lectures, Lemma 18.1.2), for the v-sheaves of DiamondsAndVStacks D6:pre-adic.
     ```
5. Roadmap introduction, line 9.
   - Current: "This component constructs the geometry of ECD §§2, 4, 7–13 and 15."
   - New: "This component constructs the geometry of ECD §§2, 4, 7–13 and 15, and in D6:pre-adic the v-sheaves of pre-adic spaces of Scholze–Weinstein, Berkeley Lectures §§18.1–18.2."
6. `research/blueprint/papers/PAPER-SCHOLZE-WEINSTEIN-20.result.json`. Apply only after the atlas has D6:pre-adic, because `check_paper.py` rejects unknown stages.
   - Route 2: remove `PAPER-SCHOLZE-WEINSTEIN-20/131` and `/132` from `items`. The brief edits are under /13, edit 2.
   - Route 11 (source, DiamondsAndVStacks): add `DiamondsAndVStacks:D6:pre-adic` to `stages` and `/131` and `/132` to `items`. Append to its reason: "Lemmas 18.1.1–18.1.2 and Proposition 18.2.2 are D6:pre-adic's."
   - Items /131 and /132: set `status` to `planned` and `planned` to `["DiamondsAndVStacks:D6:pre-adic"]`.
   - New note for /131: "Planned in DiamondsAndVStacks D6:pre-adic, which RelativeFarguesFontaine RF0–RF2 and GeometricSatakeAndFusion GS1 import. The properness in Lemma 18.1.2 is a test of DiamondEtaleCohomology C4."
   - New note for /132: "Planned in D6:pre-adic, with Lemma 18.1.1."
7. Owners entry, for the record the maintainer uses. No accepted restructuring covers L1 and D6 together.

   ```json
   {"target": "The v-sheaf X^♢ of a pre-adic space over Spa ℤ_p, including Spd of non-analytic Huber pairs (Berkeley §§18.1–18.2)", "owner": "DiamondsAndVStacks:D6:pre-adic", "formerly": ["AdicCoefficientsAndComparisons:L1"]}
   ```

**Not changed / open.**
- Full faithfulness stays with the Part II (SW 10.2.3, 18.3.1 and 18.4.1; KPZ26 I01).
- PrismaticCohomology:PR.8 (README line 257) constructs "the log-diamond generic fiber" of a pre-adic generic fibre that "need not be sheafy". It has no D6 ancestor at all.
  - An edge D6:pre-adic → PR.8 is acyclic (checked).
  - PR.8 belongs to another part of this area, so the edge is left to the maintainer.
- BP-DiamondsAndVStacks (pending) adds D6:pre-adic nodes to the packet. Its D6 nodes stop at Tate pairs, for example `D6/spd-of-a-tate-pair`.
- With a sub-stage, `theory_graph.py` treats D6 as an aggregate with no weight of its own. That already happens to RF0, AI.0 and GS0.

## /4 (high, duplicate): The general toroidal Hodge–Tate map is planned in both T6:comparison and S6

**The finding and the verdict.** T6:comparison ends by applying its comparison "to the toroidal tower in diamonds, giving the general Hodge–Tate map and coefficient pullback statement of Boxer–Pilloni Theorem 4.4.40". PerfectoidShimuraVarieties:S6 plans the same theorem: "construct the Hodge–Tate map from the toroidal tower diamond and the canonical Levi-torsor pullback isomorphism via Boxer–Pilloni Theorem 4.4.40". The verifier confirmed the duplicate and refined it: "S6's dependencies include T6, so this is not two independent owners but S6 importing T6 and then re-planning its result." It asked for the fix to read "S6 consumes T6:comparison's Hodge-Tate map", and for "the RS-05 observation" to be "checked against that framing". I follow that framing. The split runs along the existing edge T6 → S6: T6:comparison supplies the finite-level logarithmic comparison, and S6 consumes it. The RS-05 check decides which side of that edge the map on the limit tower belongs to. RS-05, S0.general and the PerfectoidShimuraVarieties introduction all put it in S6. So what S6 consumes from T6:comparison is the finite-level Hodge–Tate filtration and Levi-torsor identification. S6 keeps the passage to the toroidal tower diamond, and T6:comparison drops its last two sentences.

**Checked.**
- The texts, in content/campaign/HodgeTateAndCanonicalSubgroups/README.md line 121 and content/campaign/PerfectoidShimuraVarieties/README.md line 101, match data/atlas.json.
- Edges on stageEdges:
  - T6:comparison → T6 → S6.
  - T6:comparison's only successor is T6, and T6's only successor is S6.
  - S6's predecessors are B3.general, T6, S0.general, S4 and C3.general.
  - So narrowing T6:comparison removes nothing that another stage imports.
- RS-05 (review status "accepted", 2026-09-23):
  - Its layer entry for S6 says "keep … Retain general toroidal diamond Hodge-Tate morphisms and their logarithmic comparison input". This names T6's part as an input.
  - Its entry for S0.general says "It adds neither perfectoid representability nor a Hodge-Tate map before S6".
  - Its family has 9 roadmaps, none of them HodgeTateAndCanonicalSubgroups, and 62 owners entries, none about a Hodge–Tate map.
- Other stage and README texts:
  - The atlas text of S0.general says "This suffix does not claim general perfectoid representability or an HT map; S6 adds the logarithmic period-map theorem."
  - The PerfectoidShimuraVarieties README says "T6 is required only for S6's general logarithmic statement" and "S6 must supply the separate construction".
  - OverconvergentAutomorphicForms:O8 says "General toroidal diamond coefficients can be constructed through S6".
- Boxer–Pilloni, arXiv:2110.10251v1, pp. 77–78, read in the local reference copy (…/revised_campaign/references/text/SS_BoxerPilloni.txt). The finite-level content and the limit map separate cleanly:
  - 4.4.38 works on S^tor_{K,Σ} at finite level: "Wp ⊗Qp OBdR,log = WdR ⊗ OBdR,log", which is "a consequence of [DLLZ19], thm. 5.3.1".
  - After Remark 4.4.39, the text defines the Hodge–Tate filtration from the two lattices, the torsor P_HT and the identification M_HT = M_dR. It adds: "This implies that M_HT is already defined on the étale site."
  - Only then does it form the limit: "We can consider the inverse limit in the category of diamonds S^{tor,♦}_{K^p,Σ} = lim_{K_p} S^{tor,♦}_{K^pK_p,Σ}".
  - Theorem 4.4.40: the torsor "is trivial over S^{tor,♦}_{K^p,Σ}, and we therefore obtain a morphism π^tor_HT : S^{tor,♦}_{K^p,Σ} → FL_{G,µ}", together with the pullback statement.
- The literal reading of the verifier's wording (T6:comparison owns the map on the limit) would need a new edge S0.general → T6:comparison. That edge is acyclic (checked), but it contradicts RS-05 and the text of S0.general, so I do not propose it.
- On stageEdges, T6:comparison has no PerfectoidShimuraVarieties ancestor. After the edge S0 → T2 of /22, it gains S0 through T2, but still not S0.general or C3.general's toroidal tower.
- No edge is added or deleted by this fix.

**Fix, as edits.**
1. Owners entry. Record it in RT-AREA-padic-1.fixes.md. If the maintainer wants it in a restructuring file, RS-05.result.json is the one whose family contains S6.
   {"target": "General-datum Hodge–Tate map π^tor_HT : S^{tor,♦}_{K^p,Σ} → FL_{G,µ} on the toroidal tower diamond: triviality of the pro-Kummer-étale G^c(Q_p)-torsor on the limit, and the pullback of G^{c,an}/U_{P_µ} to M_HT = M_dR (Boxer–Pilloni Theorem 4.4.40)", "owner": "PerfectoidShimuraVarieties:S6", "formerly": ["HodgeTateAndCanonicalSubgroups:T6:comparison"]}
2. Layer entry, for the record, in RS format:
   {"HodgeTateAndCanonicalSubgroups:T6:comparison": {"action": "narrow", "keeps": "Logarithmic structural de Rham period sheaves, the logarithmic Poincaré lemma, logarithmic Riemann–Hilbert, the comparison W_p ⊗ OB_dR,log ≅ W_dR ⊗ OB_dR,log with regularity, boundary extension and arithmetic rigidity, and, at each finite level S^tor_{K,Σ}, the Hodge–Tate filtration, its tensor and Hecke compatibility, the torsor P_HT and the identification M_HT = M_dR (Boxer–Pilloni 4.4.38, Remark 4.4.39 and the text before Theorem 4.4.40).", "suppliedBy": ["PerfectoidShimuraVarieties:S6"], "reason": "RT-AREA-padic-1/4: the map on the toroidal tower diamond is S6's (RS-05 layers[S6], S0.general). S6, the only consumer of T6, imports the finite-level package through T6 → S6."}}
3. content/campaign/HodgeTateAndCanonicalSubgroups/README.md, T6:comparison, line 121.
   - Replace: "Derive the Hodge–Tate filtration from the two de Rham lattices, prove its tensor compatibility, and obtain the canonical Levi-torsor identification. Apply this to the toroidal tower in diamonds, giving the general Hodge–Tate map and coefficient pullback statement of Boxer–Pilloni Theorem 4.4.40. This is not an assertion that every such diamond is a perfectoid space, or that the map automatically factors through every minimal compactification."
   - With: "At each finite level S^tor_{K,Σ}, derive the Hodge–Tate filtration on W_p ⊗ Ô from the two B_dR^+-lattices W_p ⊗ B^+_{dR,log} and (W_dR ⊗ OB^+_{dR,log})^{∇=0}. Prove its tensor and Hecke compatibility. Construct the reduction P_HT of the pro-Kummer-étale torsor and the identification M_HT = M_dR of Levi torsors, which descends M_HT to the étale site (Boxer–Pilloni 4.4.38, Remark 4.4.39 and the text before Theorem 4.4.40). Export this finite-level package to PerfectoidShimuraVarieties S6. The toroidal tower diamond, the triviality of the torsor on it, the map π^tor_HT and its pullback statement (Boxer–Pilloni Theorem 4.4.40) belong to S6 and are not constructed here."
4. Same file, line 13 (Purpose and scope); make the same change to the roadmap's "summary" in data/atlas.json.
   - Replace: "T6 supplies the logarithmic period-sheaf comparison for general canonical automorphic local systems, and therefore the general toroidal tower's Hodge–Tate morphism."
   - With: "T6 supplies the finite-level logarithmic period-sheaf comparison for general canonical automorphic local systems; PerfectoidShimuraVarieties S6 uses it to construct the general toroidal tower's Hodge–Tate morphism."
5. Same file, line 15.
   - Replace: "and the general comparison in Boxer–Pilloni §§4.4.38–4.4.40, based on Diao–Lan–Liu–Zhu."
   - With: "and the finite-level general comparison in Boxer–Pilloni 4.4.38–4.4.39 and the text before Theorem 4.4.40, based on Diao–Lan–Liu–Zhu (Theorem 4.4.40 itself is PerfectoidShimuraVarieties S6)."
6. content/campaign/PerfectoidShimuraVarieties/README.md, S6, line 101.
   - Replace the first sentence: `For an arbitrary datum, construct the Hodge–Tate map from the **toroidal tower diamond** and the canonical Levi-torsor pullback isomorphism via Boxer–Pilloni Theorem 4.4.40.`
   - With: "For an arbitrary datum, form the toroidal tower diamond S^{tor,♦}_{K^p,Σ} = lim_{K_p} S^{tor,♦}_{K^pK_p,Σ}, prove that the pro-Kummer-étale torsor is trivial on it, and construct the Hodge–Tate map π^tor_HT to FL_{G,µ} with the canonical Levi-torsor pullback isomorphism (Boxer–Pilloni Theorem 4.4.40). Import the finite-level Hodge–Tate filtration and the identification M_HT = M_dR from HodgeTateAndCanonicalSubgroups T6:comparison; do not construct them again."

**Not changed / open.**
- T6:comparison's dependency "DiamondsAndVStacks D4/D6" (edges D4 → T6:comparison and D6 → T6:comparison) was there for the limit diamond. After the narrowing, the stage forms no diamond. The maintainer may drop these edges. I left them, because I did not check whether the DLLZ comparison uses D4/D6 elsewhere.
- The T6 parent paragraph changes in /24 (a new middle stage).

## /5 (medium, other): P1's tilting equivalence should come from the untilt classification, not from almost deformation theory

**The finding and the verdict.** The accepted PerfectoidSpaces decomposition proves the tilting equivalence by Scholze 2012's field-only route, through the almost cotangent complex and almost deformation theory (nodes P1/cotangent-complex-vanishing-mod-varpi and P1/deformation-lifting-of-perfectoid-mod-varpi-algebras). RS-05 therefore makes P0 build an almost cotangent/deformation extension. P1 already plans the untilt classification (ECD 3.14–3.17), and that classification gives the tilting equivalence over any perfectoid Tate ring. The verifier confirmed this "as an observation, with the recommended action narrowed": "do not delete planned work on this review's strength. Mark the two Scholze 2012 deformation nodes as an optional alternative route and drop the corresponding obligation from RS-05's P0 narrowing". The edits below follow that narrowing.

**Checked.**
- P1 stage text (data/atlas.json; content/campaign/PerfectoidSpaces/README.md): "Prove classification of marked untilts by primitive degree-one ideals, including the converse construction with its topology and plus ring (ECD 3.14–3.17)" and "Construct the equivalence of perfectoid algebras over a fixed perfectoid ring and over its tilt, with unit, counit and naturality."
- data/decompositions/PerfectoidSpaces.json. Node P1/tilting-equivalence-and-explicit-tilt has the hypothesis "Sch12 proves the equivalence over a perfectoid base field K; the Tate-ring version (ECD 3.13) is not proved in either source read here and is a recorded boundary", and quotes ECD: "In [Sch12], these are only proved over a perfectoid field, but the proof works in general." Node P1/untilts-classified-by-primitive-ideals: "Only the direction (S, S^+) ↦ (S♭, S♭+, ker θ) is supported by the proofs read". The gap "Almost deformation theory and cotangent-complex inputs cited from Gabber-Ramero (book numbering)" lists only the two deformation nodes under neededBy and says "the almost-context versions (GR §2.5, §3.2) have no supplier stage".
- In that file's links, the two deformation nodes feed only P1/tilting-equivalence-and-explicit-tilt. DD.0 feeds P1/cotangent-complex-vanishing-mod-varpi.
- Scholze–Weinstein, Berkeley Lectures (local text of the 27 March 2020 copy), Theorem 6.2.7, p. 45: "Let R be a perfectoid ring with tilt R♭. Then there is an equivalence of categories between perfectoid R-algebras and perfectoid R♭-algebras". Next: "Let us describe the inverse functor in Theorem 6.2.7, along the lines of Fontaine's Bourbaki talk". Then, on p. 47: "From here, one gets the following theorem, which implies Theorem 6.2.7. Theorem 6.2.11 ([KL15], [Fon13])".
- PAPER-KEDLAYA-LIU-15.result.json at origin/main (extraction complete, not yet reviewed), item /156: "Theorem 3.6.5, pp. 88–89 … The algebras need not lie over a perfectoid field". It is planned in PerfectoidSpaces:P1. I did not read the KL15 proof.
- RS-05.result.json (accepted). The P0 `keeps` reads: "Add the almost-context cotangent/deformation extension required by the accepted P1 nodes, using DD.0 classical cotangent theory and comparing ordinary and almost constructions." DD.0 is in the `suppliedBy` of both P0 and P1. RS-05 has 22 links from DD.0, and their reasons sort them into four groups. Eight exist only because P1 was narrowed: DD.0 → P7, S5, D6, F1, O0, Q0, Q0:integral-algebra and RF0:integral-Y. Nine are P0's own link and its forwarding: DD.0 → P0, R5, D2, D3, T1, Q3, P1, P2 and P3; the links to P1, P2 and P3 also carry a P1 reason. DD.0 → R06.1 has a P1-forwarding reason and an independent one. Four are independent of both narrowings: DD.0 → E5:cotangent-export, Q2, PR.2 and PR.8.
- None of these RS-05 DD.0 links is in stageEdges at origin/main. DD.0's out-edges there go only to CR.2, DD.2, DD.5, E5:cotangent-export, R07.6, LP1, Q0:animated-application and PR.0. So the fix deletes RS-05 links that have not been integrated yet, and no atlas edge.
- P0's own node P0/finite-etale-lifting-along-complete-flat-almost-algebras (Sch12 Thm 4.17) is proved via "GR 5.3.27 … reduced via GR 3.2.28(ii) (lifting along nilpotent thickenings)". GR 3.2.28 sits in GR §3.2, the almost deformation theory. I did not check whether its proof uses the almost cotangent complex.
- New node links (edit 3) were checked on the decomposition's link graph. They close no cycle. There is no new stage edge.

**Fix, as edits.**
1. data/decompositions/PerfectoidSpaces.json, node PerfectoidSpaces:P1/tilting-equivalence-and-explicit-tilt.
   a. Replace the hypothesis "Sch12 proves the equivalence over a perfectoid base field K; the Tate-ring version (ECD 3.13) is not proved in either source read here and is a recorded boundary." with: "Over a general perfectoid Tate ring R, the equivalence (ECD 3.13; SW20 Theorem 6.2.7) is derived from the untilt classification (ECD 3.17 = SW20 Theorem 6.2.11; SW20 p. 47: 'From here, one gets the following theorem, which implies Theorem 6.2.7'). Sch12's proof over a perfectoid field K, through P1/cotangent-complex-vanishing-mod-varpi and P1/deformation-lifting-of-perfectoid-mod-varpi-algebras, is an optional alternative route and is not required. The converse direction of ECD 3.17 is still an open source gap (KL15 Theorem 3.6.5, not read)."
   b. Insert as the first proof step: "General base (ECD 3.13 from 3.17). Let J = ker(θ_R) ⊂ W(R♭+). It is generated by a primitive degree-one ξ = p + [ϖ♭]α (P1/fontaine-theta-and-primitive-kernel). For a perfectoid R♭-algebra (T, T+), the image of ξ in W(T+) has the same form. So J·W(T+) is primitive of degree one, and P1/untilts-classified-by-primitive-ideals gives the untilt T♯ = W(T+)[1/[ϖ♭]]/J·W(T+) with T♯+ = W(T+)/J·W(T+). It is an R-algebra through R+ = W(R♭+)/J. Conversely, for a perfectoid R-algebra S, the image of ξ lies in ker θ_S and is primitive of degree one. It therefore generates ker θ_S by the argument of P1/fontaine-theta-and-primitive-kernel (W(S♭+)/(ξ, [ϖ♭]) = W(S♭+)/(p, [ϖ♭]) = S♭+/ϖ♭ = S+/ϖ). Unit, counit and naturality are those of the equivalence of 3.17, restricted to triples over (R♭, R♭+, J)."
   c. Leave the existing field-case steps (Prop. 5.17, Remarks 5.18–5.19, Lemma 5.21) unchanged.
2. Same file, nodes PerfectoidSpaces:P1/cotangent-complex-vanishing-mod-varpi and PerfectoidSpaces:P1/deformation-lifting-of-perfectoid-mod-varpi-algebras. Add as the first hypothesis of each: "OPTIONAL ALTERNATIVE ROUTE (Sch12, perfectoid base field only). No other node requires this node: the tilting equivalence is derived from P1/untilts-classified-by-primitive-ideals. Keep the node and its sources, but do not schedule it as a prerequisite." Keep ids, statements, proofs and sources.
3. Same file, links.
   a. Add {"source": "PerfectoidSpaces:P1/untilts-classified-by-primitive-ideals", "target": "PerfectoidSpaces:P1/tilting-equivalence-and-explicit-tilt", "reason": "ECD 3.13 over a general perfectoid Tate ring follows from 3.17 by untilting T as W(T+)[1/[ϖ♭]]/J·W(T+) with J = ker θ_R (SW20 Theorem 6.2.7 from 6.2.11).", "sources": [{"sourceId": "ecd-2026", "locator": "Section 3, Theorems 3.13 and 3.17, pp. 17–18"}]}.
   b. Add {"source": "PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel", "target": "PerfectoidSpaces:P1/tilting-equivalence-and-explicit-tilt", "reason": "J = ker θ_R is primitive of degree one, and a primitive degree-one element of ker θ_S generates it."}.
   c. In the link P1/deformation-lifting-of-perfectoid-mod-varpi-algebras → P1/tilting-equivalence-and-explicit-tilt, begin the reason with "Optional alternative route (field case only): ".
4. Same file, gaps and coverage.
   a. At the end of the detail of the gap "Almost deformation theory and cotangent-complex inputs cited from Gabber-Ramero (book numbering)", add: "Off the critical path since FIX-RT-AREA-padic-1: both nodes are an optional alternative route for P1."
   b. At the end of the detail of the gap "Tilting equivalence and untilt classification over general perfectoid Tate rings", add: "The tilting equivalence now reduces to the untilt classification (SW20 Theorem 6.2.7 from 6.2.11). What remains open is the converse direction of ECD 3.17 (KL15 Theorem 3.6.5, routed to P1 by PAPER-KEDLAYA-LIU-15 item /156)."
   c. In the coverage of PerfectoidSpaces:P1, replace the second `remaining` item. Its current text begins "Almost-context deformation theory (GR Propositions 3.2.9, 3.2.16) and the almost cotangent-complex triangle". The new text is: "Almost-context deformation theory (GR Propositions 3.2.9, 3.2.16) and the almost cotangent-complex triangle: needed only by the optional Sch12 field route; read as statements only."
5. research/blueprint/restructure/RS-05.result.json. RS-05 is accepted, so the maintainer applies these as a correction.
   a. layers["PerfectoidSpaces:P0"].keeps: replace "Add the almost-context cotangent/deformation extension required by the accepted P1 nodes, using DD.0 classical cotangent theory and comparing ordinary and almost constructions." with "P1 no longer requires an almost cotangent/deformation extension. Its tilting equivalence follows from the untilt classification, and Scholze 2012's almost deformation proof is an optional alternative. Build the almost-context cotangent/deformation extension (GR §§2.5, 3.2), from DD.0's classical cotangent theory, only if P0's own finite-étale lifting theorem (Sch12 Thm 4.17 via GR 5.3.27 and 3.2.28(ii)) needs it. P0's blueprint decides this."
   b. layers["PerfectoidSpaces:P0"].reason: replace "P0 owns the generic almost extension, a recorded gap in the accepted packet, not an assumed theorem" with "P0 owns the generic almost extension if it is built; it is a recorded gap in the accepted packet, not an assumed theorem".
   c. layers["PerfectoidSpaces:P1"]: remove "DerivedDeRhamCohomology:DD.0" from suppliedBy. In its reason, delete "DD.0 classical cotangent theory and ", so that the reason reads "… the characteristic-p field/A_inf example; pinned Fontaine primitives are imports, not the general untilt classification."
   d. links: delete the eight DD.0 links whose only reason is the P1 narrowing. They are DD.0 → PerfectoidSpaces:P7, DiamondSixOperations:S5, DiamondsAndVStacks:D6, FarguesFontaineDiamonds:F1, OverconvergentAutomorphicForms:O0, PerfectoidQuotients:Q0, PerfectoidQuotients:Q0:integral-algebra and RelativeFarguesFontaine:RF0:integral-Y.
   e. In the link DD.0 → PerfectoidSpaces:P1, delete every sentence of the reason except "Direct component import after narrowing PerfectoidSpaces:P0; retain its application edge and apply only the supplier component/hypotheses this consumer uses." The deleted sentences are P1's own cotangent import and "Preserve the accepted decomposition supplier at stage level", which lapses because the supplied node is now optional. In the links DD.0 → PerfectoidSpaces:P2, DD.0 → PerfectoidSpaces:P3 and DD.0 → PadicHodgeTheory:R06.1, delete the sentence "Direct component import after narrowing PerfectoidSpaces:P1; retain its application edge and apply only the supplier component/hypotheses this consumer uses." Each of these links keeps its other reason.
   f. Keep, pending P0's decision in 5a, the link DD.0 → PerfectoidSpaces:P0 and its eight forwarding links: DD.0 → AdicSpacesPartII:R5, DiamondsAndVStacks:D2, DiamondsAndVStacks:D3, HodgeTateAndCanonicalSubgroups:T1, PerfectoidQuotients:Q3, PerfectoidSpaces:P1, PerfectoidSpaces:P2 and PerfectoidSpaces:P3. If P0's blueprint finds that finite-étale lifting needs no almost cotangent complex, delete these nine links as well. DD.0 → R06.1 stays in any case, on its independent reason.
   g. Leave the owners unchanged. "Almost algebra over a general admissible idempotent ideal, including almost cotangent/deformation extension → P0" still names the owner if the extension is built. "Classical full cotangent complex → DD.0" is not affected. The links DD.0 → Q2, E5:cotangent-export, PR.2 and PR.8 have their own reasons and stay.
6. content/campaign/PerfectoidSpaces/README.md, §P1, and the P1 description in data/atlas.json and the PerfectoidSpaces extract. Replace "Construct the equivalence of perfectoid algebras over a fixed perfectoid ring and over its tilt, with unit, counit and naturality." with "Construct the equivalence of perfectoid algebras over a fixed perfectoid ring R and over its tilt, with unit, counit and naturality, as a corollary of the untilt classification: a perfectoid R♭-algebra T untilts to W(T⁺)[1/[ϖ]]/J·W(T⁺) with J = ker θ_R (ECD 3.13 from 3.17; SW20 Theorem 6.2.7 from 6.2.11). Scholze 2012's almost cotangent-complex proof over a perfectoid field is an optional alternative, not a prerequisite."

**Adjusted by the joint check (C2).** Two new stages proposed elsewhere in this report consume P0: R5:sousperfectoid (/9) and PadicHodgeTheory:P8:primitive (/24). If P0's blueprint keeps the almost cotangent extension, add DD.0 → R5:sousperfectoid and DD.0 → P8:primitive to the forwarding set of edit f (both acyclic); if it does not, add neither.

**Not changed / open.**
- The two deformation nodes are kept, as the verifier asks.
- The converse direction of ECD 3.17 is still not proved in any source the decomposition read. KL15 Theorem 3.6.5 is the proof. Its locator is confirmed by the KL15 extraction, but I did not read the proof.
- Whether P0's finite-étale lifting needs GR's almost cotangent complex (edits 5a and 5f) is left to P0's blueprint job. The finding calls this "a separate question".
- The RS-05.md tables should be brought into line with edit 5 when the maintainer applies it.

## /6 (medium, error): the stage edge Q4 → A3

**The finding and the verdict.** A3 lists Q4 among its inputs. But the proof A3 implements (ECD Prop. 6.4(iv)) works in characteristic p through Huber 1.7.1, Kedlaya–Liu pseudocoherence and FS IV.4.19, and it does not use ECD 5.8 or BS22 7.4. The single edge makes derived prismatic cohomology an ancestor of every diamond. The verifier confirmed the mismatch between the edge and the stated route, "not the mathematical necessity", because it did not open ECD. The accepted AdicEtaleGeometry blueprint, reviewed after the red team, settles the mathematical half: its A3 decomposition uses nothing from Q4. But one of its nodes cites Q4 and recreates the edge, so that node must change as well.

**Checked.**
- data/atlas.json: A3.requires is [A2, Q4, P5]; the stageEdges entry Q4 → A3 exists; Q4.consumers is [A3, S2, S4, P8, PR.4]. content/campaign/AdicEtaleGeometry/README.md line 102: "**Inputs:** P2–P5 and Q4, plus A0–A2."
- The roadmap-level edge PerfectoidQuotients → AdicEtaleGeometry ("stage_supported", stageCount 1) rests on this one stage edge.
- RS-05 (accepted) narrows A3 with suppliedBy [P5, R0, R5], and none of its 454 links is Q4 → A3. The link P3 → A3 is an RS-05 link ("Direct component import after narrowing PerfectoidSpaces:P5"). It is not in base.
- The accepted A3 blueprint is in research/blueprint/packets/AdicEtaleGeometry.json, with an identical promoted copy in data/blueprints/AdicEtaleGeometry.json. Its review is dated 28 September with status "accepted".
  - The A3 coverage note: "PerfectoidQuotients Q4 (ECD 5.8) is not needed by this route; its relation to the A3 closed immersions is recorded in A3/zariski-closed-immersion-ecd-comparison."
  - Node A3/affinoid-etale-finite-stage-6-4-iv quotes ECD p. 28: "For essential surjectivity, we can work in characteristic p, where it follows from [Hub96, Proposition 1.7.1] …". Its prerequisites are P5, P2, P3 and A3 nodes only.
  - The closed embedding is built in A3 itself (A3/affinoid-etale-zariski-closed-embedding, with its own A3/fs-iv-4-19-zariski-closed-char-p).
  - Of 153 nodes, only A3/zariski-closed-immersion-ecd-comparison has a PerfectoidQuotients prerequisite ("PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed"). No node uses it, so it is a leaf. Its part (c) says: "the proof of AdicEtaleGeometry:A3/affinoid-etale-finite-stage-6-4-iv does not use (b)".
- In the full build, the edge Q4 → A3 carries exactly that node's evidence ("Comparison of the Zariski closed immersions of A3 … uses PerfectoidQuotients:Q4/zariski-…"). scripts/blueprints.py merge_blueprints adds an edge for every cross-roadmap node prerequisite. So deleting the README edge alone would not remove it.
- Effect of the deletion. With the RS links, D1 loses exactly the 17 ancestors the finding lists: PR.0–PR.2, Q0, Q0:animated-application, Q0:integral-algebra, Q1–Q4, CR.0–CR.2, DD.1, DD.2, DD.5 and E4. The full build gives the same 17. Q4 is then no ancestor of D1 in any of the three graphs.
- After the deletion, A3 still has P2, P3, P4 and P5 as ancestors on base (P4 → P5 → A3, P3 → P5 → A3). So the finding's optional new edge P4 → A3 is not needed.
- research/blueprint/suggested/AdicEtaleGeometry.lean lines 4945–4950 name the Q4 node as a supplier in a comment.

**Fix, as edits.**
1. data/atlas.json:
   - Delete the stageEdges entry `{"source": "PerfectoidQuotients:Q4", "target": "AdicEtaleGeometry:A3"}`.
   - Remove "PerfectoidQuotients:Q4" from AdicEtaleGeometry:A3.requires and "AdicEtaleGeometry:A3" from PerfectoidQuotients:Q4.consumers.
   - The roadmap edge PerfectoidQuotients → AdicEtaleGeometry disappears with it; refresh_roadmap_links recomputes it. AdicEtaleGeometry.prerequisites and PerfectoidQuotients.consumers lose each other.
2. content/campaign/AdicEtaleGeometry/README.md line 102, and the same line in the atlas description of A3. Replace "**Inputs:** P2–P5 and Q4, plus A0–A2." with "**Inputs:** P2–P5, plus A0–A2. ECD Theorem 5.8 (PerfectoidQuotients Q4) is not an input: the closed immersions used here are built directly into the sousperfectoid ball, and the transfer between characteristics is made on étale categories (P3, P5)."
3. research/blueprint/packets/AdicEtaleGeometry.json and data/blueprints/AdicEtaleGeometry.json, node AdicEtaleGeometry:A3/zariski-closed-immersion-ecd-comparison:
   - title: "The Zariski closed immersions of A3 are strongly Zariski closed (ECD Definition 5.7)".
   - statement: keep the text up to the end of (a), "… in particular g^perf is a Zariski closed immersion (ECD 5.7(i))." Delete (b). Replace (c) with "(b) Boundary: the proof of AdicEtaleGeometry:A3/affinoid-etale-finite-stage-6-4-iv does not use ECD Theorem 5.8 (Zariski closed implies strongly Zariski closed), which PerfectoidQuotients Q4 owns — the closed immersions it needs are into the sousperfectoid ball B^N_X and are constructed as quotient mappings (A3/affinoid-etale-zariski-closed-embedding), and the transfer between characteristics is done on étale categories (A3/tilting-affinoid-etale-and-limits), not on Zariski closed immersions."
   - hypotheses: replace with ["(A, A⁺) perfectoid of characteristic p"].
   - proofSteps: delete the second step, "(b) is the cited Q4 node (ECD 5.8).".
   - prerequisites: delete "PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed".
   - sources: delete the ECD Theorem 5.8 entry ("§5, Theorem 5.8, p. 25") and keep the Definition 5.7(ii) entry.
4. The same two files, the coverage record of AdicEtaleGeometry:A3. Replace "PerfectoidQuotients Q4 (ECD 5.8) is not needed by this route; its relation to the A3 closed immersions is recorded in A3/zariski-closed-immersion-ecd-comparison." with "PerfectoidQuotients Q4 (ECD 5.8) is not needed by this route and is not imported; A3/zariski-closed-immersion-ecd-comparison shows that the A3 closed immersions are strongly Zariski closed directly."
5. research/blueprint/suggested/AdicEtaleGeometry.lean, the comment under line 4945 ("/-! ## AdicEtaleGeometry:A3/zariski-closed-immersion-ecd-comparison (comparison) -/"). Replace lines 4949–4950, "--   PerfectoidSpaces:P1, PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-" and "--   closed). The affinoid condition is `Huber.Pair.Hom.IsQuotientMapping`.", with the single line "--   PerfectoidSpaces:P1). The affinoid condition is `Huber.Pair.Hom.IsQuotientMapping`."
6. Keep P3 → A3 (an RS-05 link, and also a blueprint edge from A3/tilting-affinoid-etale-and-limits). Add no P4 → A3. Q4 remains an input of P8, S2, S4 and PR.4 only.

A deletion cannot close a cycle. After edits 1–4, the full build has no edge Q4 → A3 left.

**Not changed / open.**
- The comparison with Fargues–Scholze Definition IV.4.20 on perfectoid targets, which part (b) mentioned, is Q4's business. If wanted, it goes into the PerfectoidQuotients packet (BP-PerfectoidQuotients, pending) as a remark on Q4/zariski-closed-subsets-are-strongly-zariski-closed, with no A3 prerequisite.
- The packet edits change an accepted, promoted blueprint. The maintainer decides whether they need a review note.

## /7 (medium, duplicate): the Česnavičius–Scholze Part II re-plans Q0, Q4 and P7 material

**The finding and the verdict.** The accepted Part II PerfectoidQuotientsIntegralPerfectoidPartII (ČS24 route 3) plans statements that other accepted routes already send to Q0:integral-algebra and P7. It also plans statements that Q4 needs, although a Part II lies after Q4. It also imports Scholze's Theorem 3.7 from P1, where P3 owns it. The verifier confirmed this, citing the extraction's own notes, for example on item /012: "one home should be chosen". I follow the finding with one addition, item /009, and one change of mechanism: /037 is marked planned rather than moved. The reasons are given below.

**Checked.**
- PAPER-CESNAVICIUS-SCHOLZE-24.result.json, route 3: 16 items (/009–/014, /016–/020, /031, /032, /034, /036, /037). Its brief imports "PerfectoidSpaces P1 (Scholze's rank-one tilting, Theorem 3.7)". Item /016's note says "planned at PerfectoidSpaces P1".
- Scholze 2012 Theorem 3.7, with Proposition 3.8, is node P3/finite-extensions-of-perfectoid-fields. This holds both in data/decompositions/PerfectoidSpaces.json and in the P0–P7 packet (research/blueprint/packets/PerfectoidSpaces--P0.json).
- Items /010 and /018 are inputs of Q4. The decomposition node PerfectoidQuotients:Q4/surjectivity-of-perfectoidization (data/decompositions/PerfectoidQuotients.json) says: "Uses that perfectoid rings are reduced and that the p-completion of R/(f^{1/p^∞}) is perfectoid (asserted)". /010 is "perfectoid rings are reduced"; /018 is "the ϖ-adic completion of A/(S) is perfectoid". The PerfectoidQuotients README also has "For the principal-ideal step adjoin a compatible root tower", which is /017(a) and /018.
- Q0:integral-algebra precedes Q4 and Q3 on base (Q0:integral-algebra → Q0 → Q1 → Q2 → Q3/Q4). A Part II starts after its parent (PROTOCOL §15), so Q4 cannot import from it.
- Overlaps with accepted routes (both papers have paper verdict "accept"):
  - /012 against ANSCHUTZ-LEBRAS-23/13. AL23/13 is in AL23 route 3, a source route to Q0:integral-algebra: "Let R be a perfectoid ring and let R → R′ be p-completely étale. Then R′ is perfectoid." The /012 note wrongly places AL23/13 "in its proposed prismatic Dieudonné Part II".
  - /010, /013 and /014 against CESNAVICIUS-19 route 7 (source to Q0:integral-algebra): perfectoid-reduced ("Every p-torsion-free perfectoid ring of Definition 4.2 is reduced"), integral-frob-inject and completion-perfectoid (Lemma 4.7). These are special cases (p-torsion-free, (ϖ^p) = (p)) of the ČS24 statements.
  - /037 against CESNAVICIUS-19 route 16 (source to P7): residue-tower (Lemma 5.1) and perfectoid-tower (Lemma 5.2). The /037 note says "Restates Česnavičius, Purity for the Brauer group, Lemmas 5.1 and 5.2".
- /009 (2.1.2) is in neither of the finding's lists. /010 ("A/(ϖ^{1/p^∞}) ≅ (A/ϖ)^red is a perfect 𝔽_p-algebra") and /013 ("lim A[1/ϖ] ≅ A^♭[1/ϖ^♭] compatibly with lim A ≅ A^♭") are stated through the 2.1.2 identities ("the p-power map A/ϖ → A/ϖ^p is bijective", "A^♭/(ϖ^♭)^p ≅ A/ϖ^p"). So /009 must move with them, or Q0:integral-algebra would depend on the Part II. The items carry no dependency fields; this reading comes from the statements.
- Neither packet has nodes for these yet. The PerfectoidQuotients packet (partial) has no reducedness or ind-étale nodes. The P0–P7 packet cites no Česnavičius source at all, so CESNAVICIUS-19 route 16 has not yet reached a P7 node.
- make_queue merges ČS24 route 3 and BS22 route 3 into DESIGN-PerfectoidQuotientsPartII (see /1).
- make_queue.accepted_routes applies only route numbers that the paper's review lists with verdict "accept".
- Acyclicity (check3.py). I gave the Part II the new imports P3 and P7 (in place of P1), together with Q0, Q0:integral-algebra, Q3, PR.0 and AdicSpaces Layer 1, and the BS22 exports P8 and PR.4. It is acyclic on base, RS and full when the SchemeAndStackFoundations Part II import is limited to that Part II's early stage. Moving items into existing stages adds no stage edge.

**Fix, as edits.** All in research/blueprint/papers/PAPER-CESNAVICIUS-SCHOLZE-24.result.json unless stated otherwise.
1. Route 3, items. Replace the list with ["PAPER-CESNAVICIUS-SCHOLZE-24/011", "PAPER-CESNAVICIUS-SCHOLZE-24/016", "PAPER-CESNAVICIUS-SCHOLZE-24/020", "PAPER-CESNAVICIUS-SCHOLZE-24/031", "PAPER-CESNAVICIUS-SCHOLZE-24/032", "PAPER-CESNAVICIUS-SCHOLZE-24/034", "PAPER-CESNAVICIUS-SCHOLZE-24/036"]. These are fibre products (2.1.4), valuation-ring tilting (2.1.9), 2.1.12, 2.3.1, 2.3.2, the ind-syntomic André lemma (2.3.4) and semiperfectoid covers (2.3.7). The finding's "2.1.12 … and /020" names one item twice.
2. Add route 8:
   ```json
   {"route": "source", "roadmap": "PerfectoidQuotients", "stages": ["PerfectoidQuotients:Q0:integral-algebra"],
    "items": ["PAPER-CESNAVICIUS-SCHOLZE-24/009", "PAPER-CESNAVICIUS-SCHOLZE-24/010", "PAPER-CESNAVICIUS-SCHOLZE-24/012", "PAPER-CESNAVICIUS-SCHOLZE-24/013", "PAPER-CESNAVICIUS-SCHOLZE-24/014", "PAPER-CESNAVICIUS-SCHOLZE-24/017", "PAPER-CESNAVICIUS-SCHOLZE-24/018", "PAPER-CESNAVICIUS-SCHOLZE-24/019"],
    "reason": "Moved from route 3 by the fix of RT-AREA-padic-1 finding /7. Q0:integral-algebra constructs integral perfectoid rings for all of PerfectoidQuotients, and Q4 needs two of these statements before any Part II exists: the decomposition node Q4/surjectivity-of-perfectoidization uses that perfectoid rings are reduced (item 010) and that the completion of R/(f^{1/p^∞}) is perfectoid (item 018). Items 010, 012, 013 and 014 are the general forms of statements accepted routes already send to this stage: PAPER-CESNAVICIUS-19/perfectoid-reduced, /integral-frob-inject and /completion-perfectoid (route 7; p-torsion-free, (ϖ^p) = (p)) and PAPER-ANSCHUTZ-LEBRAS-23/13 (route 3; p-completely étale). Plan each once, in the general form stated here, with those items as special cases. Item 009 (the identities of 2.1.2) goes with them because items 010 and 013 are stated through it. A node whose proof needs PrismaticCohomology PR.0 (the perfect-prism correspondence) goes in Q0:animated-application, which imports PR.0 and also precedes Q2–Q4."}
   ```
3. Item /037. Set "status": "planned" and "planned": ["PerfectoidSpaces:P7"]. Replace the note with: "Restates Česnavičius, Purity for the Brauer group, Lemmas 5.1 and 5.2 (PAPER-CESNAVICIUS-19/residue-tower and /perfectoid-tower), which the accepted PAPER-CESNAVICIUS-19 route 16 sends to PerfectoidSpaces P7. This paper adds the explicit presentation R ≅ W(k)⟦x_1, …, x_d⟧/(p − f) with f = x_1 or f ∈ (p, x_1, …, x_d)²; the ⟦x^{1/p^∞}⟧ notation is the colimit of the finite levels without further completion (1.4.1)." Marking it planned, rather than adding a new source route, keeps every item routed once and needs no new review entry.
4. Item /016, note. Replace "planned at PerfectoidSpaces P1" with "planned at PerfectoidSpaces P3 (node P3/finite-extensions-of-perfectoid-fields, with Proposition 3.8)".
5. Item /012, note. Replace "The Anschütz–Le Bras extraction records the same statement (its item 13) in its proposed prismatic Dieudonné Part II; one home should be chosen." with "PAPER-ANSCHUTZ-LEBRAS-23/13 (p-completely étale algebras) is routed to Q0:integral-algebra by that paper's accepted route 3; this item goes there too (route 8), as the one statement in this more general form (ind-étale, ϖ-adic completion)."
6. Route 3, brief. Replace it in full with:
   "Extend Perfectoid quotients and their prismatic prerequisites (PerfectoidQuotients), whose Q0 constructs integral perfectoid rings with A_inf and θ and whose Q3 proves André's flatness lemma (Bhatt–Scholze 7.14), with the structure theory of integral perfectoid rings used by Česnavičius–Scholze, Purity for flat cohomology, Sections 2.1 and 2.3, beyond what Q0 plans. Final theorems: Theorem 2.3.4, the ind-syntomic André lemma (a faithfully flat, ind-syntomic, ϖ-Henselian A-algebra A' with perfectoid completion and a ϖ-divisible ideal I' with A'/I' faithfully flat, in which every monic polynomial has a root with compatible p-power roots modulo I'), Corollary 2.3.7 (semiperfectoid covers of p-Zariski rings), Proposition 2.1.4 (fibre products), the valuation-ring part of Proposition 2.1.9, and Proposition 2.1.12. Layers: fibre products, tilting of valuation rings, torsion-free covers, the approximation Lemma 2.3.1 and the nilpotence Lemma 2.3.2, and the André lemma. Imports: PerfectoidQuotients Q0:integral-algebra for the identities 2.1.2, the canonical decomposition and reducedness 2.1.3, Corollary 2.1.6, p-integral closedness 2.1.7, Proposition 2.1.8 and Proposition 2.1.11 (this extraction's route 8); Q3; PrismaticCohomology PR.0 (perfect prisms and the tilting equivalence); PerfectoidSpaces P3 (Scholze, Perfectoid spaces, Theorem 3.7 and Proposition 3.8, node P3/finite-extensions-of-perfectoid-fields); PerfectoidSpaces P7 for the perfectoid towers over complete regular local rings (Lemma 3.1.1); Tau Ceti's adic-spaces roadmap for continuous valuations; the ind-syntomic maps of this extraction's SchemeAndStackFoundations Part II, from its early stage only; and Mathlib's PreTilt and WittVector.fontaineTheta. This Part II is designed together with the Bhatt–Scholze Part II of PerfectoidQuotients, which exports to PrismaticCohomology PR.4; the later stages of the SchemeAndStackFoundations Part II import prismatic Dieudonné theory and through it PR.4, so the stage importing them must not precede the stages exporting to PR.4. Tests: O_C, the completion of ℤ_p[p^{1/p^∞}], a perfect 𝔽_p-algebra, O_C/(p^{1/p^∞}), a product of perfectoid valuation rings, and W(k)⟦x^{1/p^∞}⟧/(p − f) in both the ramified and unramified cases."
7. research/blueprint/papers/PAPER-CESNAVICIUS-SCHOLZE-24.review.json, for the maintainer: add `{"route": 8, "verdict": "accept", "reason": "Added by the fix of RT-AREA-padic-1 finding /7 (confirmed in RT-AREA-padic-1.review.json): moved from route 3 because Q4 needs items 010 and 018 and the others generalise items that accepted routes already send to Q0:integral-algebra."}`. Without it, make_queue.accepted_routes does not apply route 8.

**Not changed / open.**
- The merged design must order its stages. The model with one Part II node that both imports the whole SchemeAndStackFoundations Part II (whose brief imports PrismaticCohomologyPartIIPrismaticDieudonneTheory, whose brief imports PR.4) and exports to PR.4 is cyclic on base, RS and full. Keeping the two papers' stages apart, or importing only the early stage, is acyclic (check3.py). Edit 6 states the constraint for DESIGN-PerfectoidQuotientsPartII.
- The next P7 round of the P0–P7 packet (BP-PerfectoidSpaces--P0, review "needs_changes") should add CESNAVICIUS-19 route 16's Lemmas 5.1–5.2, which it has not yet done. The next BP-PerfectoidQuotients round should plan the route 8 items and the special cases in CESNAVICIUS-19 route 7 and AL23 route 3 as single nodes.
- I did not open ČS24. I have not checked that the proof of 2.1.3 avoids 2.1.4 (/011 stays in the Part II, as the finding says), or which proofs in 2.1.11 use perfect prisms (edit 2 places those in Q0:animated-application). The review record's "16 items" for route 3, the report PAPER-CESNAVICIUS-SCHOLZE-24.md and the generated data/items files are left to the maintainer's pipeline.

## /8 (medium, duplicate): the untilt / primitive-ideal correspondence is planned twice; apply RS-20's P1 owner entry now

**The finding and the verdict.** Two stages plan the marked-untilt / primitive θ-kernel correspondence: PerfectoidSpaces:P1 and RelativeFarguesFontaine:RF2:untilts. FarguesFontaineDiamonds:F4 uses it as well. RS-05 makes P1 the owner only against D6 and S5. RS-20 has the owner entry that settles the question, but RS-20 is needs_changes because of an unrelated RF3 blocker. The verifier confirmed: "Both stages plan the same two objects", and RS-05's entry "scopes P1's ownership only against D6 and S5, leaving RF2 unaddressed".

**Checked.**
- P1: "Construct Fontaine's θ, its surjectivity, and the principal non-zero-divisor description of its kernel. Prove classification of marked untilts by primitive degree-one ideals". RF2:untilts (README l. 84): "Construct marked untilts over E, the primitive kernel of theta, and its divisor on Y_S and X_S." F4 (content/campaign/FarguesFontaineDiamonds/README.md l. 139): "For an untilt, construct the map to `Y_F` and the local equation given by the primitive kernel of `θ`."
- The same theorem appears as two nodes: PerfectoidSpaces:P1/untilts-classified-by-primitive-ideals (ECD 3.17) and RelativeFarguesFontaine:RF2:untilts/primitive-untilt-correspondence (SW20 6.2.9–6.2.11).
- RS-05 owner: "General perfectoid tilting and marked-untilt theory" → P1, formerly [D6, S5]. RS-20 owner: "P-typical marked-untilt and primitive degree-one Witt-ideal correspondence" → P1, formerly [F4, RF2:untilts].
- RS-20 also records the matching narrowing. F4: "Import P1 only for the p-typical marked-untilt/primitive-ideal carrier and algebraic correspondence". RF2:untilts: "Import P1 for the p-typical perfectoid correspondence … Here prove the remaining E-linear comparison with marked generic untilts rather than assume it". It has the links P1 → F4 and P1 → RF2:untilts.
- The RS-20 review is needs_changes. REV-RS-20~2 raises only the RF3 blocker and "Preserved … all targets". RS-20~3 (commit cd6987eb, 29 September; REV-RS-20~3 pending in queue.json) answers that blocker and leaves this owner entry unchanged.
- P1 is already an ancestor of both consumers (P1 → P2 → RF2:untilts; P1 → Q0 → F4), so the new edges only record the import. Acyclicity: adding P1 → RF2:untilts and P1 → F4 closes no cycle on stageEdges at origin/main, on stageEdges plus the links of every accepted RS, or with RS-20's links added.

**Fix, as edits.**
1. Owners: decide now, independently of RF3, the RS-20 entry verbatim: {"target": "P-typical marked-untilt and primitive degree-one Witt-ideal correspondence", "owner": "PerfectoidSpaces:P1", "formerly": ["FarguesFontaineDiamonds:F4", "RelativeFarguesFontaine:RF2:untilts"]}. RS-20.result.json already contains it, so a later acceptance of RS-20 changes nothing. If RS-20 is rejected instead, this entry still stands through the edits below.
2. data/atlas.json stageEdges (and the RelativeFarguesFontaine and FarguesFontaineDiamonds extracts): add {"source": "PerfectoidSpaces:P1", "target": "RelativeFarguesFontaine:RF2:untilts"} and {"source": "PerfectoidSpaces:P1", "target": "FarguesFontaineDiamonds:F4"}. Add P1 to both stages' `requires`.
3. content/campaign/RelativeFarguesFontaine/README.md, §RF2:untilts, and the RF2 and RF2:untilts descriptions in the atlas. Replace "Construct marked untilts over E, the primitive kernel of theta, and its divisor on Y_S and X_S." with "Import from PerfectoidSpaces P1 the p-typical correspondence between marked untilts and primitive degree-one ideals (ECD 3.14–3.17). Here prove only its E-linear comparison with marked untilts over E, using the degree-one presentation R♯+ = W_OE(R+)/ξ, ξ = π − a[ϖ], from RF2:integral-divisors, and construct the divisor on Y_S and X_S."
4. content/campaign/FarguesFontaineDiamonds/README.md, §F4, and the F4 description in the atlas. Replace "For an untilt, construct the map to `Y_F` and the local equation given by the primitive kernel of `θ`." with "For an untilt, construct the map to `Y_F` and the local equation given by the primitive kernel of `θ`, importing the kernel and the untilt/primitive-ideal correspondence from PerfectoidSpaces P1."
5. data/decompositions/RelativeFarguesFontaine.json, node RelativeFarguesFontaine:RF2:untilts/primitive-untilt-correspondence.
   a. Add as the first hypothesis: "The p-typical statement is owned by PerfectoidSpaces:P1 (node P1/untilts-classified-by-primitive-ideals) and is imported, not re-proved. This node keeps its id as a reference to it and proves only the E-linear comparison with marked generic untilts (RS-20~3)."
   b. Add the link {"source": "PerfectoidSpaces:P1/untilts-classified-by-primitive-ideals", "target": "RelativeFarguesFontaine:RF2:untilts/primitive-untilt-correspondence", "reason": "Imported p-typical correspondence."}.
6. data/decompositions/PerfectoidSpaces.json, node P1/untilts-classified-by-primitive-ideals: add to `sources` the SW20 Definition 6.2.9, Lemma 6.2.10 and Theorem 6.2.11 excerpts (printed pp. 46–47) that the RF2 node already quotes. SW20 also writes out the proof that θ is surjective and that the constructed ξ generates the kernel.

**Not changed / open.**
- The E-linear comparison and the divisor constructions stay in RF2:untilts. F4 keeps its fixed-field analytic closed-image theorem (the RS-20 owner "Fixed-Q_p-field Shilov/norm estimate … → F4").

## /9 (medium, error): split R5 so that classical étale cohomology is not upstream of the diamonds

**The finding and the verdict.** R5 bundles two things in one stage:
- the early sousperfectoid class, which is all that A3 uses;
- family coefficient sheaves, whose input is ClassicalAdicEtaleCohomology:H0.

RS-05's stage-level links therefore put H0 above A3, P6 and D1–D6. R5's text also cites a nonexistent "ClassicalAdicEtaleCohomology C0". The verifier confirmed all of this. It also asked that the dangling C0 be swept, since it appears in HodgeTateAndCanonicalSubgroups:T1 too (low finding /32).

**Checked.**
- R5 (`AdicSpacesPartII/README.md` lines 75–81):
  - "Construct the sousperfectoid class … together with completed coefficient sheaves and torsor descent".
  - The dependency line has "[ClassicalAdicEtaleCohomology C0]", while `requires` has H0.
  - T1's line 47 in `HodgeTateAndCanonicalSubgroups/README.md` has the same C0.
- RS-05 links (with the reasons they give):
  - R5 → A3: "Only the EARLY R5 ambient class is imported".
  - R5 → P6: "Direct component import after narrowing AdicEtaleGeometry:A3".
  - R5 → RF0:integral-Y.
  - R5 → RF0:annuli: "sousperfectoid closure".
  - R5 → BG0: "early sousperfectoid ambient spaces".
  - R5 → P9.
  - Into R5 come DD.0, D0 and E1, besides R0, R3 and Tau Ceti Layers 0, 3, 4 and 5.
- H0 before the split:
  - In G_main, H0 reaches RF0:integral-Y through the stage edge R5 → RF0:integral-Y, and through it RF0:annuli and BG0. It reaches none of A3, P6 or D1–D6.
  - In G_rs, H0 also reaches A3 (H0 → R5 → A3), P6 (H0 → R5 → P6) and D1–D6 (for example H0 → R5 → P6 → D1).
- The accepted AdicSpacesPartII packet (REV-AdicSpacesPartII, 28 September) postdates the finding. It has 42 R5 nodes. I computed the prerequisite closure of the sousperfectoid and product nodes inside R5. It has 19 nodes:
  - `sousperfectoid-ring`, `split-injection-completed-base-change`, `sousperfectoid-uniform`, `sousperfectoid-rational-localisation`, `sousperfectoid-finite-etale`, `sousperfectoid-finite-etale-descent`, `sousperfectoid-rings`, `sousperfectoid-annulus`, `sousperfectoid-p-adic-field`, `sousperfectoid-stably-uniform`, `sousperfectoid-sheafy`, `sousperfectoid-adic-space`, `sousperfectoid-etale-stability`, `sousperfectoid-stably-adic`, `sousperfectoid-etale-base-change`, `perfectoid-times-polydisc`, `perfectoid-times-smooth-fibre-product`, `stable-basis-covering-reduction` and `stable-basis-etale-vector-bundles`.
  - Their external prerequisites are only R0, R3, AdicEtaleGeometry A1, P1–P3, Mathlib and Tau Ceti Huber and ValuationSpectrum declarations (Layers 0–5).
  - The other 23 R5 nodes carry H0 (`perfectoid-times-smooth-tilde-limit` and `tilde-limit-base-change`), D0 (`coefficient-sheaf-tate-acyclicity`) and F0.
- Correction to the finding. R5:sousperfectoid also needs R3 and A1, not only "Layers 0–5, R0 and P0–P3". The finding named 2 nodes; the packet now has 19.
- Consumers of R5 nodes across the packets:
  - A3's eight nodes use only nodes from the 19-node set. Examples are A3/tubular-neighbourhood, A3/jacobian-criterion-char-p and A3/affinoid-etale-zariski-closed-embedding.
  - P9's nodes use R5, `perfectoid-times-smooth-fibre-product` and `sousperfectoid-rings`.
  - RF0:integral-Y/gluing-for-general-base names R5 only for gluing.
- After the split, H0 reaches none of A3, P6, D1–D6, RF0:integral-Y, RF0:annuli, BG0 or R5:sousperfectoid, in either graph.
- Acyclicity. These are the new edges:
  - Into R5:sousperfectoid: from R0, R3, A1, P0, P3 and Tau Ceti Layers 0, 3, 4 and 5.
  - Out of R5:sousperfectoid: to R5, A3, P6, RF0:integral-Y, RF0:annuli, BG0 and P9.

  With the edges of edit 3 deleted, none of the targets reaches back to R5:sousperfectoid or to its inputs, in G_main or in G_rs. P1 and P2 are ancestors of P3 (P1 → P2 → P3), so they need no edge.

**Fix, as edits.**
1. `content/campaign/AdicSpacesPartII/README.md`. Replace lines 75–81 (R5) with the following. The anchor `r5` and the id R5 stay.

   ```markdown
   ### R5. Families of coefficients over sousperfectoid products

   **Dependencies:** [AdicSpacesPartII R5:sousperfectoid](README.md#r5-sousperfectoid); [AdicEtaleGeometry A1](../AdicEtaleGeometry/README.md); [AdicSpacesPartII R3](README.md#r3); [ClassicalAdicEtaleCohomology H0](../ClassicalAdicEtaleCohomology/README.md); [PerfectoidSpaces P0](../PerfectoidSpaces/README.md); [PerfectoidSpaces P3](../PerfectoidSpaces/README.md).

   On the products `X_∞×_L U` of R5:sousperfectoid, construct completed coefficient sheaves and prove that products with a smooth space preserve tilde-limits, using H0's tilde-limit criterion. Establish the sheaf base-change and equalizer results needed to define and descend families of automorphic coefficients. Prove local compatibility of rational and integral sheaves where used. Arbitrary nonflat base change for global sections is not an automatic consequence. Continuous profinite-torsor descent of modules is PerfectoidSpaces P9's.
   ```

   Then insert after it, before `## Completion conditions`:

   ```markdown
   <a id="r5-sousperfectoid"></a>
   <a id="stage-R5:sousperfectoid"></a>
   #### R5:sousperfectoid — Sousperfectoid spaces and perfectoid-times-smooth products

   **Dependencies:** anchor AdicSpaces Layers 0–5; [AdicSpacesPartII R0](README.md#r0); [AdicSpacesPartII R3](README.md#r3); [AdicEtaleGeometry A1](../AdicEtaleGeometry/README.md); [PerfectoidSpaces P0](../PerfectoidSpaces/README.md); [PerfectoidSpaces P3](../PerfectoidSpaces/README.md).

   Construct the sousperfectoid class and its usable local affinoid descriptions, following the sources used by BHW for products with weight spaces: stability under rational localisation, finite étale extensions and Tate algebras, stable uniformity and sheafiness, sousperfectoid adic spaces and étale spaces over them. Prove the existence and sheaf properties of `X_∞×_L U` for a perfectoid `X_∞` and a smooth rigid-analytic parameter space `U` over a perfectoid extension `L′/L`, and of the product with a polydisc. Do not assert that such a product is perfectoid merely because one factor is. This prefix uses no classical étale cohomology and no coefficient sheaves; AdicEtaleGeometry A3, PerfectoidSpaces P6, RelativeFarguesFontaine RF0:integral-Y and RF0:annuli, and BunGAndNewtonStrata BG0 import only it.
   ```

2. Stage edges.
   - Add: R0, R3, AdicEtaleGeometry:A1, PerfectoidSpaces:P0, PerfectoidSpaces:P3 → R5:sousperfectoid.
   - Add: R5:sousperfectoid → R5.
   - Delete: R5 → RelativeFarguesFontaine:RF0:integral-Y.
   - Add in its place: R5:sousperfectoid → RF0:integral-Y. The README line 37 change is under /3, edit 4.
   - R5's own edges stay: A1, R3, H0, P0, P3 → R5, and R5 → OverconvergentAutomorphicForms:O0 and P9.
3. `research/blueprint/restructure/RS-05.result.json`. Apply after the atlas has the sub-stage, because `check_restructure.py` requires atlas layers.
   - Links to delete (source → target):
     - R5 → AdicEtaleGeometry:A3
     - R5 → PerfectoidSpaces:P6
     - R5 → RelativeFarguesFontaine:RF0:integral-Y
     - R5 → RelativeFarguesFontaine:RF0:annuli
     - R5 → BunGAndNewtonStrata:BG0
   - Links to add. Each keeps the reason of the link it replaces and appends "(only the sousperfectoid prefix R5:sousperfectoid)":
     - `AdicSpacesPartII:R5:sousperfectoid` → each of those five targets.
     - `AdicSpacesPartII:R5:sousperfectoid` → `PerfectoidSpaces:P9`, reason "P9/weight-extension-of-function-descent uses R5/perfectoid-times-smooth-fibre-product and R5/sousperfectoid-rings."
     - `AdicSpacesPartII:R5:sousperfectoid` → `AdicSpacesPartII:R5`, reason "The coefficient sheaves and tilde-limit statements are built on the sousperfectoid products."
     - The four Tau Ceti links into R5 (Layers 0, 3, 4 and 5) are copied with target R5:sousperfectoid.
     - The link R0 → R5 is copied with target R5:sousperfectoid.
   - Layer entry for R5:
     - `keeps` becomes: "Completed coefficient algebras and sheaves over the products of R5:sousperfectoid (CHJ §6), tilde-limits of products (BHW Corollary 3.5), rational/integral base change and local equalizers. Continuous profinite-torsor descent of modules is exported by later P9."
     - `suppliedBy` becomes `["AdicSpacesPartII:R5:sousperfectoid", "PerfectoidSpaces:P9"]`.
     - `reason` becomes: "R5:sousperfectoid supplies the early ambient product theory to A3, P6, RF0 and BG0; R5 keeps the family coefficients, the only part that needs H0, D0, E1 or DD.0. No P9-to-R5 backedge."
   - Owners. Replace `{"target": "Early sousperfectoid product and coefficient-sheaf theory", "owner": "AdicSpacesPartII:R5", "formerly": ["AdicEtaleGeometry:A3", "PerfectoidSpaces:P9"]}` with:

     ```json
     {"target": "Sousperfectoid rings and spaces, and perfectoid-times-smooth and perfectoid-times-polydisc products", "owner": "AdicSpacesPartII:R5:sousperfectoid", "formerly": ["AdicEtaleGeometry:A3", "PerfectoidSpaces:P9"]}
     {"target": "Completed coefficient algebras and sheaves over sousperfectoid products, tilde-limits of products, rational/integral base change and local equalizers", "owner": "AdicSpacesPartII:R5", "formerly": ["PerfectoidSpaces:P9"]}
     ```

4. `research/blueprint/packets/AdicSpacesPartII.json`: in the 19 nodes listed above, set `parentStageId` and `realises` to `AdicSpacesPartII:R5:sousperfectoid`. Node ids stay, so the A3 and P9 references stay valid; `check_blueprint.py` only requires the `AdicSpacesPartII:` prefix. Add a coverage entry for R5:sousperfectoid with status `source_decomposed`.
5. Sweep the dangling citation. In `AdicSpacesPartII/README.md` line 77 (now inside edit 1) and in `HodgeTateAndCanonicalSubgroups/README.md` line 47, replace "[ClassicalAdicEtaleCohomology C0]" with "[ClassicalAdicEtaleCohomology H0]". Both stages' `requires` already name H0. The T1 half is also low finding /32's fix.

**Adjusted by the joint check (C2).** In edit text giving R5's new reason, read "the only part that needs H0, D0 or E1" (not "… or DD.0"): the link DD.0 → R5 is one of RS-05's P0 forwarding links and is decided under /5. If P0 keeps its almost cotangent extension, add DD.0 → R5:sousperfectoid to that forwarding set (acyclic); otherwise add nothing.

**Not changed / open.** R5 keeps its H0, D0, E1 and DD.0 inputs, which only the families part uses. The RS-05.md exception table rows for R5 remain true, since each says the consumer uses "the retained early formal/product prefix". The same aggregate-weight note as in /3 applies to R5.

## /10 (medium, duplicate): one owner for the Berkovich spectrum; TB.0:spectrum supplies D5

**The finding and the verdict.** Two stages plan the Berkovich spectrum M(R) and the theorem that |Spa(A,A⁺)| → M(A) is the maximal Hausdorff quotient:
- D5, for affinoid perfectoid spaces (ECD 13.7–13.11);
- TB.0, for Banach and strictly affinoid algebras.

No edge or restructuring joins them. The verifier confirmed this on the two stage texts.

**Checked.**
- The two stage texts:
  - D5 (`DiamondsAndVStacks/README.md` lines 121–123): "Construct the Berkovich/maximal-Hausdorff quotient functor".
  - TB.0 (`TropicalAndBerkovichArithmetic/README.md` lines 11–19): "Construct the Berkovich spectrum of a Banach algebra from bounded multiplicative seminorms … Compare a strictly affinoid algebra with its Huber adic spectrum … proving continuity and the correct quotient topology".
  - No D stage reaches a TB stage, and no TB stage reaches a D stage, in G_rs.
  - No accepted restructuring mentions TB.0 as an owner or layer. RS-25 has only links into TB.2 and TB.4.
- Packets written after the finding:
  - TropicalAndBerkovichArithmetic packet ("Plan Berkovich spectra", 27 September; BP and REV pending):
    - It has 11 TB.0 nodes, `TB.0/spectrum` … `TB.0/field-spectrum-singleton`. Their only prerequisites are Mathlib (`MulRingSeminorm` and topology lemmas). An example is "M(A) is the subtype of native MulRingSeminorm A consisting of p with p(a) ≤ ‖a‖".
    - Its gap "adic-comparison" leaves open "the actual normalized rank-one map … continuity and quotient topology".
  - DiamondsAndVStacks packet: node `D5/berkovich-quotient` states ECD 13.7–13.11, from "multiplicative bounded nonarchimedean seminorms on R with |varpi| = 1/2" to the functor on small v-sheaves.
- Sources for the general comparison:
  - PAPER-KEDLAYA-LIU-15, read at origin/main; its review, REV-PAPER-KEDLAYA-LIU-15, is pending. Item /66 (§2.4, Definitions 2.4.6 and 2.4.8, pp. 40–41): "if A has a uniform unit z … a continuous retraction Spa(A, A^+) → M(A), a quotient map exhibiting M(A) as the maximal Hausdorff quotient".
  - Item /57: a Banach algebra over an analytic field has a uniform unit.
  - Route 4 sends these items to TB.0.
  - I did not read Kedlaya–Liu. I also did not check that every affinoid perfectoid ring has a uniform unit, so ECD Proposition 13.9 is kept as a second named case.
- Libraries: Mathlib 082e2d3 has `structure MulRingSeminorm` (`Mathlib/Analysis/Normed/Unbundled/RingSeminorm.lean:62`) and `def T2Quotient` (`Mathlib/Topology/Separation/Hausdorff.lean:413`). Tau Ceti f790474 has no Berkovich or seminorm-spectrum declaration.
- Acyclicity. The new edges are:
  - FoundationsAndLibraryIntegration:LI.0 → TB.0:spectrum.
  - Tau Ceti AdicSpaces Layer 2 → TB.0:spectrum.
  - TB.0:spectrum → TB.0.
  - TB.0:spectrum → DiamondsAndVStacks:D5.

  None of the targets reaches back to TB.0:spectrum, LI.0 or Layer 2, in G_main or in G_rs.

**Fix, as edits.**
1. `content/campaign/TropicalAndBerkovichArithmetic/README.md`: insert after line 19 (the end of TB.0), before `### TB.1.`:

   ```markdown
   <a id="tb-0-spectrum"></a>
   <a id="stage-TB.0:spectrum"></a>
   #### TB.0:spectrum — The Berkovich spectrum and the maximal Hausdorff quotient

   **Inputs:** `FoundationsAndLibraryIntegration:LI.0`; Tau Ceti AdicSpaces Layer 2 (`Spa(A,A⁺)`, rational subsets, analytic points).

   **Construction and export:** For a normed commutative ring `A`, construct `M(A)`, the bounded multiplicative seminorms on Mathlib's `MulRingSeminorm`, with the topology of pointwise convergence; prove it compact Hausdorff, functorial for bounded ring maps, unchanged by completion, and a point for a normed field. For a complete Tate ring use the norm given by a ring of definition and a pseudouniformizer, and prove independence of these choices. For a complete Tate Huber pair `(A,A⁺)` construct the map `|Spa(A,A⁺)| → M(A)` to the rank-one generalization and prove that it is a continuous quotient map exhibiting `M(A)` as the maximal Hausdorff quotient (compared with Mathlib's `T2Quotient`); the section back into `|Spa(A,A⁺)|` need not be continuous. State this theorem for the pairs a read source covers: Banach rings with a uniform unit (Kedlaya–Liu, Relative p-adic Hodge theory: Foundations, §2.4), which include strictly affinoid algebras, and affinoid perfectoid pairs (ECD Definition 13.7, Proposition 13.9). This stage is the single owner of both; D5 and TB.0 import them.

   **Acceptance:** the spectrum of a complete nonarchimedean field is a point; the closed disc has its Gauss point; the perfectoid closed unit disc gives the Berkovich disc; a higher-rank point of `Spa` maps to its rank-one generalization.
   ```

2. TB.0 text (line 13 and line 15):
   - Inputs, current: "`FoundationsAndLibraryIntegration:LI.0`, `AdicSpacesPartII:R2`."
   - Inputs, new: "`TropicalAndBerkovichArithmetic:TB.0:spectrum`, `FoundationsAndLibraryIntegration:LI.0`, `AdicSpacesPartII:R2`."
   - Construction, current: "Construct the Berkovich spectrum of a Banach algebra from bounded multiplicative seminorms, its topology and completed residue fields, then glue affinoids into analytic spaces. Compare a strictly affinoid algebra with its Huber adic spectrum by rank-one points/maximal generalizations under the precise hypotheses, proving continuity and the correct quotient topology."
   - Construction, new: "Import the Berkovich spectrum and its affinoid comparison with Huber's spectrum from TB.0:spectrum. Construct completed residue fields, then glue affinoids into analytic spaces, and extend the rank-one comparison with Huber's adic spaces to the glued spaces under the precise hypotheses."
   - The sentence "Preserve integral-subring and higher-rank information …" stays.
3. D5 text, `DiamondsAndVStacks/README.md` lines 121–123.
   - Current: "Construct the Berkovich/maximal-Hausdorff quotient functor and the proper-zero-dimensional compact-Hausdorff examples needed later."
   - New: "Import the Berkovich space of an affinoid perfectoid space and its maximal-Hausdorff property (ECD 13.7–13.9) from TropicalAndBerkovichArithmetic TB.0:spectrum. Extend it to the colimit-preserving functor on small v-sheaves (ECD 13.10) with the qcqs maximal-Hausdorff statement (13.11), prove 13.12–13.13, and construct the proper-zero-dimensional compact-Hausdorff examples needed later."
   - The next sentence, on the maximal-point inclusion, stays.
4. Stage edges to add:
   - `FoundationsAndLibraryIntegration:LI.0` → TB.0:spectrum.
   - Tau Ceti AdicSpaces Layer 2 → TB.0:spectrum.
   - TB.0:spectrum → TB.0.
   - TB.0:spectrum → DiamondsAndVStacks:D5.
5. Restructuring record. It can go into RS-05, which already names owners outside its nine roadmaps (for example `ArithmeticGaloisDuality:R02.1`), or into a new restructuring for the pair.
   - Owners:

     ```json
     {"target": "Berkovich spectrum M(R) of bounded multiplicative seminorms, and |Spa(A,A⁺)| → M(A) as maximal Hausdorff quotient", "owner": "TropicalAndBerkovichArithmetic:TB.0:spectrum", "formerly": ["DiamondsAndVStacks:D5", "TropicalAndBerkovichArithmetic:TB.0"]}
     ```

   - Link: `{"source": "TropicalAndBerkovichArithmetic:TB.0:spectrum", "target": "DiamondsAndVStacks:D5", "reason": "D5 imports the affinoid Berkovich space and its maximal-Hausdorff property (ECD 13.7–13.9) and extends them to small v-sheaves."}`
   - RS-05 layer D5 changes from `keep` to the following. It also carries /11's correction.

     ```json
     {"action": "narrow", "keeps": "Spatial and locally spatial diamonds and spatial v-sheaves with their permanence (ECD 11.17–11.31, 12.12–12.17), the spatial v-sheaf criterion (12.18–12.21), representability in diamonds and in locally spatial diamonds (13.1–13.6), the extension of the Berkovich quotient to small v-sheaves and its qcqs maximal-Hausdorff statement (13.10–13.11), and 13.12–13.13 with 13.13 proved from D0.", "suppliedBy": ["TropicalAndBerkovichArithmetic:TB.0:spectrum"], "reason": "TB.0:spectrum owns the affinoid Berkovich spectrum and its maximal-Hausdorff property. Properness, partial properness and the canonical compactification (ECD §18) are DiamondEtaleCohomology C4's, as D5's own text says; C4, S0 and S1 consume D5's spatial and representability geometry."}
     ```

6. Routes and items:
   - PAPER-SCHOLZE-26 route 2: `stages` becomes `["TropicalAndBerkovichArithmetic:TB.0:spectrum", "TropicalAndBerkovichArithmetic:TB.1"]`, and item /4's `planned` becomes `["TropicalAndBerkovichArithmetic:TB.0:spectrum"]`. Its items are the Banach-ring toolkit /1, /3, /4, /5 and /8, plus /6 for TB.1.
   - PAPER-KEDLAYA-LIU-15, for its pending review: route 4 `stages` becomes `["TropicalAndBerkovichArithmetic:TB.0:spectrum", "TropicalAndBerkovichArithmetic:TB.0"]`. The §§2.3–2.4 items belong to the first stage and the Chapter 8 items /250–/252 to the second. Items /53 and /56 are planned in TB.0:spectrum.
   - ZAVYALOV-25 route 6 (Huber's comparison for glued spaces) and DEMARCO-KRIEGER-YE-20 route 2 stay.
7. Packets:
   - In the TropicalAndBerkovichArithmetic packet (BP pending), re-parent the 11 TB.0 nodes to TB.0:spectrum, and close the gap "adic-comparison" with a TB.0:spectrum node for the maximal-Hausdorff theorem.
   - In the DiamondsAndVStacks packet (BP pending), `D5/berkovich-quotient` imports that node for the affinoid statement and keeps 13.10–13.11.

**Not changed / open.** It is not claimed here that the maximal-Hausdorff theorem holds for every complete Tate pair. It is stated for the two cases a read source covers. The aggregate-weight note of /3 applies to TB.0.

## /11 (medium, error): the canonical compactification's owner is C4, not D5; D2's and D3's keep reasons are corrected

**The finding and the verdict.**
- RS-05's owner entry "Diamond canonical compactification geometry" names D5.
- D5's text refers the canonical compactification to C4.
- C4 still constructs it, and RS-05 keeps C4 unchanged.
- The same shift in RS-05's DiamondsAndVStacks reasons gives effective descent (ECD 9.2–9.11, D3's text) to D2.

The verifier confirmed all three records: "the decision record points at D5 while D5 points at C4, which does the work". The finding says the fix must choose one of two options. This section chooses C4 as owner. It needs no stage text change.

**Checked.**
- The three records:
  - D5 (line 126–127): "Canonical compactifications in C4 are not assumed to remain spatial".
  - C4 (`DiamondEtaleCohomology/README.md` lines 75–87): "Build ECD §18 on D5's small-v-stack geometry. Define properness, prove the valuative criteria, and construct the partially proper envelope/canonical compactification with its universal property".
  - S0: "Prove ECD 22.3 using C4's canonical compactification".
- RS-05 layer keeps:
  - D5: "Retain separatedness, specialization, partially proper/proper maps, canonical compactification and all diamond geometric criteria".
  - C4: "Retain the cohomology of canonical compactifications … D5 supplies compactification geometry".
  - D2: "… subcanonicity, structure-sheaf vanishing and effective descent with almost/inverse-limit proofs".
  - D3: "Retain diamond quotients, independence, locally representable morphisms …". Diamond quotients and independence of the atlas are D4's text: "Define a diamond by a pro-étale sheaf quotient `U/R` … independence of atlas/refinement".
  - The D3 README text (lines 74–83) is ECD 9.2–9.11 and §10.
- RS-05 links: D5 → C4 and D5 → S0 have "Import the canonical owner of Diamond canonical compactification geometry". C4 → S0 has "Import the canonical owner of Cohomology of canonical compactifications".
- RS-05.md rows 76 ("D5 owns the compactification object") and 84 ("D5 geometric compactification is a supplier to S0").
- The overlap evidence behind these rows, `RS-05.json`, has two notes:
  - C4/D5: "the spatiality predicate and the maximal-Hausdorff quotient are used in both".
  - S0/D5: "the representability notions defined here".

  So the shared object is D5's spatial geometry, not the compactification. The C0/D3 note says: "The section lemma for balls is cited there as 'whose ownership is D3'".
- The DiamondsAndVStacks packet (24 September, after RS-05) already follows D5's text:
  - D3 coverage: "ECD Lemma 9.9's compactification is stated as a special case of the canonical compactification of ECD Proposition 18.6, which belongs to DiamondEtaleCohomology:C4".
  - D5 has no compactification node.
- No edge changes. D5 → C4, D5 → S0 and C4 → S0 all stay.

**Fix, as edits.**

All edits are in `RS-05.result.json` and `RS-05.md`.

1. Owners. Replace `{"target": "Diamond canonical compactification geometry", "owner": "DiamondsAndVStacks:D5", "formerly": ["DiamondEtaleCohomology:C4", "DiamondSixOperations:S0"]}` with:

   ```json
   {"target": "Properness, partial properness, valuative criteria and the canonical compactification of small v-stacks (ECD §18)", "owner": "DiamondEtaleCohomology:C4", "formerly": ["DiamondsAndVStacks:D5", "DiamondSixOperations:S0"]}
   {"target": "Spatiality, representability in locally spatial diamonds and the maximal-Hausdorff quotient, as used by C4 and S0", "owner": "DiamondsAndVStacks:D5", "formerly": ["DiamondEtaleCohomology:C4", "DiamondSixOperations:S0"]}
   ```

   Replace `{"target": "Perf pro-etale/v-sites and effective descent", "owner": "DiamondsAndVStacks:D2", "formerly": ["DiamondEtaleCohomology:C0", "DiamondsAndVStacks:D6"]}` with:

   ```json
   {"target": "Perf pro-étale and v-sites, structure-sheaf descent and v-acyclicity (ECD §8)", "owner": "DiamondsAndVStacks:D2", "formerly": ["DiamondEtaleCohomology:C0", "DiamondsAndVStacks:D6"]}
   {"target": "Effective v-descent of perfectoid spaces and the section lemma for balls (ECD 9.2–9.11)", "owner": "DiamondsAndVStacks:D3", "formerly": ["DiamondEtaleCohomology:C0"]}
   ```

2. Layer reasons (all stay `keep`, except D5):
   - D5: the entry given under /10, edit 5. If /10 is not applied, keep D5 as `keep` with the reason "Retain spatial and locally spatial diamonds and their permanence, the spatial v-sheaf criterion, representability and the maximal-Hausdorff quotient (ECD 11.17–11.31, 12.12–12.21, §13, with 13.13 proved from D0). Properness, partial properness and the canonical compactification (ECD §18) are C4's; C4, S0 and S1 consume D5's geometry."
   - D2: "Retain the big and small pro-étale sites and the v-site on characteristic-p Perf with the qc covering condition, cutoff independence (ECD 8.2), 𝒪 and 𝒪⁺ as sheaves, v-descent of functions, subcanonicity and higher (almost) v-acyclicity on affinoid perfectoids (ECD 8.3–8.8). Effective descent (ECD 9.2–9.11) is D3's. A1 analytic pro-etale covers have a different definition and correction history."
   - D3: "Retain fully faithful descent of morphisms and effective descent in its three scopes (ECD 9.2–9.11, with the section lemma for balls and descent of the integral subring), and étale, finite étale and quasi-pro-étale morphisms of stacks, immersions, separatedness, 0-truncatedness and locally profinite torsors (ECD §10); ordinary adic properness is only an input for later comparisons."
   - D4: "Retain diamonds as pro-étale quotients U/R with independence of the atlas and the quasi-pro-étale atlas characterization, and small v-sheaves and groupoid-valued small v-stacks, size/cutoff independence, atlases, 2-fiber products and local representability. Ordinary stackification comes from D0; Artin eligibility is added in VS0."
   - C4: "Retain properness, the valuative criteria and the canonical compactification of ECD §18 with its cohomology and the actual comparison maps; D5 supplies spatial, representability and maximal-Hausdorff geometry, while S0/S1 use the theorem for compact support."
   - S0: "Retain eligible compactifiable morphisms and refinements using D5 representability, C4's canonical compactification and comparison, and C8 finite dim.trg; these are the input conditions for the next operation."
3. Link reasons:
   - D5 → C4: "C4 builds ECD §18 on D5's spatial geometry, representability and maximal-Hausdorff quotient."
   - D5 → S0: "S0's eligible class uses D5's representability in locally spatial diamonds."
   - C4 → S0: "Import the canonical owner of the canonical compactification and of its cohomology."
4. `RS-05.md`:
   - Row 76 becomes: "| 76 | C.C4 / D.D5 | C4 owns properness and the canonical compactification (ECD §18) and proves its cohomological behavior; D5 supplies the spatial, representability and maximal-Hausdorff geometry it is built on. |"
   - Row 84 becomes: "| 84 | Six.S0 / D.D5 | D5 supplies S0's representability in locally spatial diamonds; the compactification S0 uses is C4's. |"

**Not changed / open.** The stage texts of D2, D3, D5, C4 and S0 already agree with this choice, so they stay. The other option, moving ECD §18 into D5, would be contrary to all three texts and to the packet. RT-RS-05 (pending) will see these RS-05 changes.

## /12 (medium, error): Bhatt–Mathew ∞-sheaf items routed to the 1-categorical D0

**The finding and the verdict.** BM21 route 2 sends items /58–/61 to DiamondsAndVStacks:D0. These items are ∞-categorical: sheaves valued in an ∞-category C on a profinite set, stalks at ultrafilters, and detection of equivalences for compactly generated C. D0 is 1-categorical, and it precedes the enhanced-sheaf stages (D0 → E1, D0 → E2). The finding proposed re-routing them to E1/E2 or to the arc-topology roadmap, or restating them in 1-categorical form. The verifier confirmed: "The items are unambiguously infinity-categorical and the target stage is not." The finding's arc option does not work as stated, because the consumers of these items sit in LD.0, which the arc roadmap imports. The fix therefore moves the consumers too.

**Checked.**
- PAPER-BHATT-MATHEW-21.result.json, route 2 (source to D0, accepted): items /38, /40, /41, /43, /58, /59, /60, /61.
  - /58: "restriction identifies the ∞-category of C-valued sheaves on X with the ∞-category of functors B^op → C".
  - /61: "For C compactly generated and a map η : f → g of sheaves in Fun(P(T)^op, C), η is an equivalence if and only if η_U … is an equivalence for every ultrafilter U"; its note says "The detection principle behind Corollaries 3.18 and 3.19".
- Where those corollaries sit: /65 (Cor. 3.18, "Let C be compactly generated and presentable …") and /66 (Cor. 3.19, "F : Ring_R → S", valued in spaces) are in route 3, a source route to LogicAndDefinabilityInNumberTheory:LD.0. So is /64 (Construction 3.17, "a sheaf on P(T) whose stalk at U is F(∏_U A_t)"), which uses /59 and /60. /69 and /70 (Lemmas 3.24–3.25, detection of universal descent) are in route 1 (ArcTopologyAndDescent).
- The route 1 brief imports "spectral spaces, the constructible topology and profinite techniques from … D0", "hypercompleteness from … E2" and "ultraproducts and Łoś's theorem from … LD.0". It lists among its own scope "detection of descent by ultraproducts and by aic valuation rings".
- data/atlas.json: D0 is "Spectral topology, ordinary sites, and size", with "These ordinary foundations … do not presuppose the enhanced diamond étale category". E1.requires is [D0, E0] and E2.requires is [D0, E1]. LD.0 requires only LI.0 and is "Languages and interpretations" (first-order logic and Łoś).
- There is no path between D0, E1 or E2 and LD.0 in either direction, on base, RS or full. So the present routing already hides an unrecorded dependency from D0 to LD.0, through /61 and then /65.
- Neither the DiamondsAndVStacks packet nor the LogicAndDefinabilityInNumberTheory packet has a node for /58–/61 or /64–/66. No file other than the BM21 extraction and the generated data/items/29.json cites these items. DESIGN-ArcTopologyAndDescent is pending.
- Acyclicity (check12.py), using the arc placeholder of /1:
  - Arc as briefed is acyclic.
  - Moving only /58–/61 to Arc, with /64–/66 left in LD.0, needs an edge Arc → LD.0 against LD.0 → Arc. That is a cycle on base, RS and full.
  - The E-stage option needs an edge E1 → LD.0 or E2 → LD.0. Either is acyclic on all three graphs.

**Fix, as edits.** All in research/blueprint/papers/PAPER-BHATT-MATHEW-21.result.json.
1. Route 2, items. Replace the list with ["PAPER-BHATT-MATHEW-21/38", "PAPER-BHATT-MATHEW-21/40", "PAPER-BHATT-MATHEW-21/41", "PAPER-BHATT-MATHEW-21/43"].
2. Route 2, reason. Replace it with: "D0 extends the spectral-space API with constructible and pro-constructible subsets, spectral maps, limits and quotient criteria, and supplies profinite decompositions and the Stone–Čech argument. The paper's submersions and spectral submersions, the constructible criterion and their stability under cofiltered limits are general facts of that kind, not facts about the arc-topology; the paper is a good source for them and the new roadmap should import them. The ∞-categorical statements of §3.1 on sheaves on a profinite set and stalks at ultrafilters (items 58–61) went to route 1 (fix of RT-AREA-padic-1 finding /12): D0 is 1-categorical and precedes EnhancedDerivedSheaves E1 and E2."
3. Route 3, items. Replace the list with ["PAPER-BHATT-MATHEW-21/62", "PAPER-BHATT-MATHEW-21/63", "PAPER-BHATT-MATHEW-21/72"].
4. Route 3, reason. Replace it with: "LD.0 constructs ultraproducts and proves Łoś's transfer theorem. Section 3.2 of the paper is ultraproducts of rings: their definition as a filtered colimit, their geometric description as the localisation of a product along a point of βT, and the fact that an ultraproduct of absolutely integrally closed valuation rings is one again (a transfer statement). These belong in LD.0's direction. The ∞-categorical consequences — ultraproducts as stalks of a sheaf on P(T) and the detection of equivalences and of truncatedness on ultraproducts (items 64–66) — use Lemma 3.14 and went to route 1 with it (fix of RT-AREA-padic-1 finding /12): the arc roadmap imports LD.0, so they cannot stay here."
5. Route 1, items. Append "PAPER-BHATT-MATHEW-21/58", "/59", "/60", "/61", "/64", "/65" and "/66", written as full ids (122 items become 129).
6. Route 1, brief. Replace "the ∞-categorical descent formalism — finitary functors, universal F-descent and its sorites, targets compactly generated by cotruncated objects, and detection of descent by ultraproducts and by aic valuation rings;" with "the ∞-categorical descent formalism — finitary functors, universal F-descent and its sorites, targets compactly generated by cotruncated objects, sheaves on a profinite set and on the power set of a set with their stalks at ultrafilters and the detection of equivalences on those stalks (Proposition 3.10, Definition 3.11, Construction 3.13, Lemma 3.14), ultraproducts as stalks and the detection of equivalences and of truncatedness on ultraproducts (Construction 3.17, Corollaries 3.18–3.19), and detection of descent by ultraproducts and by aic valuation rings;"

No stage edge changes. The arc roadmap's brief already imports D0, E2 and LD.0, and the moved items only need those. No review entry changes either, because no route is added.

**Not changed / open.**
- The finding's option of restating the items in 1-categorical form in D0 does not serve the consumers: /65 needs a compactly generated presentable C and /66 needs spaces.
- The E-stage alternative (/58–/61 in E1 or E2, plus an edge from there to LD.0) is acyclic. But it would put ∞-categorical statements into the model-theory stage LD.0, and E1 as written models module sheaves (dg nerves of K-injectives), not sheaves valued in a general C. I recommend the arc roadmap. If another consumer of C-valued profinite sheaves appears, the maintainer can move /58–/61 to EnhancedDerivedSheaves then.
- RS-05 narrows D0: "Spectral, patch and pro-constructible calculus" is owned by Tau Ceti AdicSpaces Layer 1 ("formerly": D0). The kept items /38–/43 must import that calculus rather than re-plan it. For example, /41's proof uses the constructible-topology quotient property. This is outside the finding.

## /13 (medium, other): the integral Part II briefs are merged by the queue on main; they must import D6:pre-adic

**The finding and the verdict.** The finding said that one Part II id, DiamondsAndVStacksIntegralPartII, carries two titles and two briefs (KPZ26 route 6 and GLX26 route 9). It said `make_queue.py` wrote one prompt per job id, so GLX's 13 accepted items would drop out. The verifier confirmed this and added a second colliding id, HeckeStacksAndLocalShtukasIntegralPartII, which comes from the same two papers.

**Checked.**
- The make_queue half is already fixed on main. Commit 7685a59f (28 September, after the red team of 24 September) is "Queue: one design job per Part II parent".
  - `paper_designs` (`make_queue.py` lines 413–448) groups by `("part-ii", route["parent"])` (line 423). It writes one brief per parent, listing every proposal with an excerpt and "Full brief and items: research/blueprint/papers/<paper>.result.json".
  - I ran `paper_designs` on the accepted routes. DESIGN-DiamondsAndVStacksPartII receives three proposals: GLX26 (13 items, papers.json #77), KPZ26 (2 items, #143) and SW20 route 2 (6 items, #232).
  - The job is titled from the parent, "Pro-étale descent, diamonds and small v-stacks, Part II". So nothing drops out and the two route titles no longer compete.
  - `queue.json` at origin/main has DESIGN-DiamondsAndVStacksPartII in state pending.
- The briefs that remain to change:
  - KPZ26 route 6: "Import Pro-étale descent, diamonds and small v-stacks (DiamondsAndVStacks D6) for the analytic diamond and site comparison, together with the perfectoid and v-descent foundations it names."
  - GLX26 route 9: "Import Pro-etale descent, diamonds and small v-stacks (DiamondsAndVStacks D3–D6), SchemeAndStackFoundations SF.0 and the existing analytic/perfectoid foundations."
  - SW20 route 2 has "Also cover: X^♦ is a v-sheaf for every pre-adic space over ℤ_p, not only analytic ones (Lemma 18.1.1); …" and "Imports: DiamondsAndVStacks D0–D6 (diamonds, v-sheaves, X^♦ for analytic adic spaces, underlying spaces), …". /3 shows that this part must be D6:pre-adic's.
- Ids: the design job writes `DiamondsAndVStacksPartII.json`, but these name "DiamondsAndVStacksIntegralPartII":
  - the `roadmap` fields of GLX26 route 9, KPZ26 route 6 and SW20 route 2;
  - the briefs of GLX26 routes 9–11, KPZ26 route 7 and SW20 routes 3–4;
  - the notes of SW20 items /69, /131, /133 and /134.
- The Hecke id is merged the same way, into DESIGN-HeckeStacksAndLocalShtukasPartII. It has 12 proposals in three directions: integral models, affine Deligne–Lusztig varieties, and Kottwitz.

**Fix, as edits.**
1. `make_queue.py`: no edit. The merge the finding asked for is on main (7685a59f).
2. Brief edits, so that the merged job imports D6:pre-adic. Apply after /3's stage exists.
   - PAPER-KISIN-PAPPAS-ZHOU-26 route 6, first sentence becomes: "Import Pro-étale descent, diamonds and small v-stacks (DiamondsAndVStacks D6) for the analytic diamond and site comparison, and D6:pre-adic for Spd O_E and the v-sheaves of non-analytic (formal and scheme) models, together with the perfectoid and v-descent foundations it names."
   - PAPER-GLEASON-LIM-XU-26 route 9. The sentence above becomes: "Import Pro-étale descent, diamonds and small v-stacks (DiamondsAndVStacks D3–D6, and D6:pre-adic for Spd(R,R) in the reduction F_red(Spec R) = F(Spd(R,R))), SchemeAndStackFoundations SF.0 and the existing analytic/perfectoid foundations."
   - PAPER-SCHOLZE-WEINSTEIN-20 route 2:
     - Replace the whole sentence "Also cover: X^♦ is a v-sheaf for every pre-adic space over ℤ_p, not only analytic ones (Lemma 18.1.1); Spd 𝒪_C/G_K ≅ Spd 𝒪_K via a proper v-cover (Lemma 18.1.2); the continuous surjection |X^♦| → |X| and the example of Spa(𝔽_p[t], 𝔽_p[t]) whose open R°° ⊂ R⁺ does not come from a subscheme (Proposition 18.2.2, Example 18.2.1)." with "Import X^♦ for every pre-adic space over ℤ_p (Lemmas 18.1.1–18.1.2, Proposition 18.2.2, Example 18.2.1) from DiamondsAndVStacks D6:pre-adic, which RelativeFarguesFontaine and GeometricSatakeAndFusion also use; this roadmap proves the full-faithfulness results on it."
     - In "Imports:", replace "DiamondsAndVStacks D0–D6 (diamonds, v-sheaves, X^♦ for analytic adic spaces, underlying spaces)" with "DiamondsAndVStacks D0–D6 and D6:pre-adic (diamonds, v-sheaves, X^♦ for analytic adic spaces and for pre-adic spaces, underlying spaces)".
     - Replace the reason's first clause, "DiamondsAndVStacks D6 constructs X^♦ only for analytic adic spaces and compares topology and étale sites; nothing plans v-sheaves of perfect or formal schemes or the full-faithfulness results", with "DiamondsAndVStacks D6 and D6:pre-adic construct X^♦; nothing plans the full-faithfulness results".
     - The item moves are /3, edit 6.
3. No title edit is needed, because the job's title comes from the parent.

**Not changed / open.**
- Id mismatch. Every Part II id in the routes differs from the id the design job writes (<parent>PartII); this is general, not specific to this Part II. The simplest single fix is in `paper_designs`: add to the Part II brief "The proposals' own ids all denote this roadmap, <rid>". That is the maintainer's code change. The alternative is to replace the id in the places listed above.
- Hecke. The merged job's instruction is "if they split into independent directions, plan the first here and record a restructure proposal for the rest". The first proposal in papers.json order is ZHU-17 route 15, which is on affine Deligne–Lusztig varieties. So the integral direction may not be the one planned first. Five proposals are affected: KPZ26 route 7, GLX26 route 11, VANHOFTEN-24 route 7, ZHU-17 route 17 and SW20 route 4. This is left to the maintainer.

## /14 (medium, error): Zavyalov route 4 belongs to R2 only

**The finding and the verdict.** ZAVYALOV-25 route 4 was accepted on 23 September. It sends seven items on admissible formal O_K-schemes to AdicSpacesPartII:R2 and F0. But RS-05 narrowed F0 to noetherian Spf and kept these objects in R2. The review justified F0 with "the very paragraph RS-05 removed". The verifier confirmed the scope conflict from RS-05's R2 entry. It did not check that all seven items are non-noetherian. The fix below does not rely on that.

**Checked.**
- Route 4:
  - Its stages are `["AdicSpacesPartII:R2", "AdicSpacesPartII:F0"]`.
  - Its items are /41 and /141–/146.
  - Its reason includes "F0 the formal geometry compared with generic fibres (properness and separatedness via models, algebraization)".
  - The review reason: "F0 proves 'properness, separatedness and smoothness comparisons with formal models', which is where Lemma B.1 (Lütkebohmert–Temkin), the Reduced Fibre Theorem and Elkik's algebraization belong".
- That quotation is from F0's second paragraph (`AdicSpacesPartII/README.md`, F0): "Prove properness, separatedness and smoothness comparisons with formal models and finite-type analytification". RS-05's F0 keeps says: "Noetherian Spf … proper formal GAGA/algebraization … The analytic paragraph becomes a forward reference to R0-R3".
- RS-05 on R2 and F0:
  - R2 keeps: "Explicitly retain type-(S) formal schemes and Conrad FS_C over nondiscrete valuation rings … F0 noetherian models do not replace them".
  - The owners entry "Type-(S)/admissible formal models, generic fibers and formal/analytic geometry" names R2.
- All seven items concern admissible formal O_K-models and their generic fibres.
  - /41 (BLR, Theorem 2.7.1) and /144 (Theorem B.9) say "For K algebraically closed", so their O_K is not noetherian.
  - The rest are about "flat topologically finite type A over O_K" and admissible models.
  - So they are R2's by the owners entry, whatever the noetherianity of the other five.
- The accepted AdicSpacesPartII packet (28 September) plans admissible formal O_K-schemes in R2 (`R2/admissible-formal-scheme`). It also plans Huber 1.3.18's comparisons there (`R2/formal-model-separatedness`, `R2/formal-rigid-properness-comparison`). No F0 node covers these items.
- Same defect, not named by the finding. Item /140, Lemma B.1 (Lütkebohmert–Temkin: "f is separated (resp. proper) if and only if f_K is so"), has `planned: ["AdicSpacesPartII:F0"]`. Its note is "F0 plans the properness, separatedness and smoothness comparisons with formal models", which is the removed paragraph. The two R2 nodes above state it.

**Fix, as edits.**

The edits are in `research/blueprint/papers/PAPER-ZAVYALOV-25.result.json` and `PAPER-ZAVYALOV-25.md`.

1. Route 4 `stages` becomes `["AdicSpacesPartII:R2"]`.
2. Route 4 reason.
   - Current: "R2 plans admissible formal schemes, admissible blow-ups and the generic-fibre functor, and F0 the formal geometry compared with generic fibres (properness and separatedness via models, algebraization)."
   - New: "R2 plans admissible formal schemes, admissible blow-ups and the generic-fibre functor over rank-one valuation rings, and RS-05 keeps admissible models over nondiscrete valuation rings there ('F0 noetherian models do not replace them')."
   - The rest of the reason stays.
3. Item /140:
   - `planned` becomes `["AdicSpacesPartII:R2"]`.
   - New note: "Planned in R2 (AdicSpacesPartII:R2/formal-model-separatedness and R2/formal-rigid-properness-comparison, Huber 1996 Remark 1.3.18); RS-05 removed F0's analytic comparison paragraph."
4. `PAPER-ZAVYALOV-25.md`, lines 70 and 103.
   - Line 70: "Lütkebohmert–Temkin (Lemma B.1): AdicSpacesPartII F0." becomes "… AdicSpacesPartII R2."
   - Line 103: "Source of AdicSpacesPartII [R2, F0]" becomes "Source of AdicSpacesPartII [R2]".

**Not changed / open.** The review file keeps its accepted verdict for route 4. The route stays accepted with a narrower stage list, and make_queue reads only the verdict. The noetherianity of items /141–/143, /145 and /146 was not checked, and the fix does not need it.

## /15 (medium, missing): A0's analytic-locus paragraph is already planned in the A0 packet; RS-05's record must say so

**The finding and the verdict.** RS-05 narrowed A0 to "Supplier-contract comparison …". The keeps drop A0's paragraph on the global analytic locus, analytic adic spaces over Spa(ℤ_p,ℤ_p) and Tate charts on non-Tate (Witt) inputs. No supplier is named for it. Tau Ceti Layer 2.3 has only the affinoid locus. The verifier confirmed that the paragraph is absent from the keeps and that no supplier is named.

**Checked.**
- A0's text still has the paragraph (`AdicEtaleGeometry/README.md` lines 36–38): "Construct the analytic locus and morphism restriction interfaces … Preserve non-Tate Huber pairs such as Witt rings at the input, using Tate charts on their analytic loci."
- RS-05 A0 keeps and R0 keeps contain none of it.
- Tau Ceti Layer 2.3 text: "define the analytic locus `Spa(A,A⁺)^a` … Prove that the analytic locus is open and is covered by rational subsets whose coordinate rings are Tate". In Tau Ceti f790474, `def spaAnalytic` is at `AlgebraicGeometry/AdicSpace/Spa/Analytic.lean:80` (affinoid). No global `analyticLocus` exists (git grep).
- Already applied in the plan. The accepted AdicEtaleGeometry packet (REV-AdicEtaleGeometry, 28 September) has node `AdicEtaleGeometry:A0/analytic-locus-restriction`: "The analytic locus X_a of an adic space: open adic subspace, Tate charts, and restriction of adic morphisms". It covers every item of the finding's fix:
  - X_a is an open adic subspace;
  - "every morphism from an adic space to an analytic adic space is adic";
  - restriction and the universal property;
  - acceptance: "the analytic adic spaces over Spa ℤ_p used in ECD §15 form a full subcategory";
  - "non-Tate Huber pairs such as Witt vector rings and A_inf are allowed at the input".
  - It imports Tau Ceti `spaAnalytic` and `spaAnalytic_eq_biUnion_rationalSubset`, and R0's `adic-morphism` and `adic-iff-analytic-locus`.
  - A0's coverage note says "every clause of the stage text has a node".
- What remains is the record. RS-05's A0 entry, which the atlas shows as A0's narrowing, omits the paragraph. It names only R0 as supplier.
- The DiamondsAndVStacks packet asks A2 for "Analytic adic spaces over Z_p as the source category of the diamond functor". Per the node's own `uses` entry, that is now A0's node.
- A0 is already an ancestor of the consumers, in both graphs:
  - A0 → A1 → A4 → D6 (in G_rs also A0 → P2 → D6);
  - A0 → P2 → RF0:integral-Y.
- Acyclicity. The only new edge is Tau Ceti Layer 2 → A0. Layer 2 has no incoming edge in either graph, so it cannot close a cycle.

**Fix, as edits.**

The edits are in `RS-05.result.json`, plus one request in the DiamondsAndVStacks packet.

1. RS-05 layer A0, `keeps`: append "Also retain the analytic locus X_a of an adic space as an open adic subspace with its Tate charts on non-Tate inputs (Witt vectors, A_inf), the restriction of adic morphisms to analytic loci, and the full subcategory of analytic adic spaces over Spa(ℤ_p,ℤ_p) (node A0/analytic-locus-restriction); the affinoid analytic locus is Tau Ceti AdicSpaces Layer 2.3's and adic morphisms are R0's."
2. RS-05 layer A0, `suppliedBy`: add `"tauceti:TauCetiRoadmap/AdicSpaces#layer-2-affinoid-spectra-and-rational-subsets"`. Append to its reason: "A0's analytic-locus paragraph has no other owner and stays here."
3. RS-05 link: `{"source": "tauceti:TauCetiRoadmap/AdicSpaces#layer-2-affinoid-spectra-and-rational-subsets", "target": "AdicEtaleGeometry:A0", "reason": "A0/analytic-locus-restriction imports the affinoid analytic locus Spa(A,A⁺)^a, its openness and its cover by rational subsets with Tate coordinate rings (Layer 2.3)."}`
4. DiamondsAndVStacks packet (BP-DiamondsAndVStacks, pending): in the request to `AdicEtaleGeometry:A2` for "Analytic adic spaces over Z_p as the source category of the diamond functor", name `AdicEtaleGeometry:A0` for the analytic locus and the category. A2 stays the supplier for separatedness and the valuative criteria.

**Not changed / open.** A0's stage text stays; it already has the paragraph. No R0 change: R0's packet nodes (`adic-morphism`, `adic-iff-analytic-locus`, `spa-comap-analytic-locus`) are A0's inputs, not a second copy.

## /16 (medium, error): RF2 defines Div^1 on Perf_Fq with Ĕ where FS use E

**The finding and the verdict.** RF2:untilts, the RF2 aggregate and the README say "Define Div^1 using the unramified coefficient base Spd(E-breve)/phi^Z over Perf_Fq". Over Perf_Fq, however, Div^1 = Spd(E)/φ^ℤ (FS Def. II.1.19). The Ĕ presentation holds only on Perf_k with k = F̄_q. The verifier confirmed this as an internal contradiction with F4 ("F4 uses the field E itself and RF2 its unramified completion, over the same base; both cannot be right"). It concluded "RF2 is the side to correct", and asked that someone with the paper confirm Def. II.1.19. I did (below).

**Checked.**
- content/campaign/RelativeFarguesFontaine/README.md l. 87–88: "Define Div^1 using the unramified coefficient base Spd(E-breve)/phi^Z over Perf_Fq." The same sentence is in the atlas descriptions of RelativeFarguesFontaine:RF2 and RF2:untilts and in the RelativeFarguesFontaine extract.
- Fargues–Scholze, local text of the author PDF. P. 56: "In particular, we see that the moduli space Div1 of degree 1 closed Cartier divisors is given by Div1 = Spd(E)/φZ", in a setting where "we write ∗ for the v-sheaf taking any S ∈ Perf Fq to a point". P. 61: "In particular, if one works on Perf k, then Div1 = Spd Ĕ/φZ". P. 164 (§IV.7): "In this section, we work on Perf k where k = F̄q … Div1 = Spd Ĕ/φZ, where φ acts on Spd Ĕ = Spd k ×Spd Fq Spd E via the second factor."
- F4: "Keep distinct the moduli functor `Div¹ = Spd ℚ_p/φ^ℤ`". The reviewed node RF2:untilts/div1-moduli-and-properness is already right: "Div^1 = Spd(E)/phi^Z", with the hypothesis "over Perf_k with k algebraically closed, Spd(E) is replaced by Spd(E-breve)".
- RS-20 already has the fix (RF2:untilts `keeps`, unchanged by RS-20~3): "Over Perf_Fq the moduli formula is Spd(E)/phi^Z; Spd(breve E)/phi^Z is its separately proved Perf_k presentation for k = algebraic closure of F_q, not an unqualified replacement." It has not reached the README or the atlas because RS-20 is not accepted.
- The finding's gloss, that over Perf_Fq "φ moves only the F̄_q-structure", is not FS's wording. FS p. 164 has φ acting "via the second factor" of Spd k ×_{Spd F_q} Spd E. The gloss is not needed, and the replacement text does not use it.
- No edges change.

**Fix, as edits.**
1. content/campaign/RelativeFarguesFontaine/README.md, §RF2:untilts, and the descriptions of RelativeFarguesFontaine:RF2 and RelativeFarguesFontaine:RF2:untilts in data/atlas.json and research/blueprint/atlas/roadmaps/RelativeFarguesFontaine.json. Replace "Define Div^1 using the unramified coefficient base Spd(E-breve)/phi^Z over Perf_Fq." with "Define Div^1 = Spd(E)/phi^Z on Perf_Fq (FS Definition II.1.19, p. 56). Prove its presentation Div^1 = Spd(E-breve)/phi^Z after restriction to Perf_k, k = algebraic closure of F_q (FS p. 61; p. 164)." This can be applied now, independently of RS-20's RF3 blocker.

**Not changed / open.**
- Three items of the not-yet-reviewed PAPER-FARGUES-SCHOLZE-21.result.json quote the old sentence in their notes: c1-diamond-functor-and-Div1, c2a-def-II.1.19-degree-one-divisor and c4b-Div1-def. The reviewer of that extraction should refresh the quotations.

## /17 (medium, error): Div^1 properness sits in RF2:untilts without its six-functor inputs; move it to a new RF2 child after C4 and S5

**The finding and the verdict.** Node RF2:untilts/div1-moduli-and-properness proves FS II.1.21: Div^1 → ∗ is proper, representable in spatial diamonds and cohomologically smooth. That proof needs ECD 24.5 (planned in DiamondSixOperations:S5) and ECD 18.3 (planned in DiamondEtaleCohomology:C4). Neither stage is an ancestor of RF2:untilts. Adding them as prerequisites would put RF3, RF4, VB1, BG0 and everything below them behind the six-functor formalism. The verifier confirmed that "Neither … S5 … nor … C4 … is an ancestor of RF2:untilts".

**Checked.**
- Node statement: "The map Div^1 -> * is proper, representable in spatial diamonds, and cohomologically smooth". Its hypotheses: "Cohomological smoothness of Spd(E) -> * is quoted from ECD Proposition 24.5" and "Properness is obtained from the valuative criterion of ECD Proposition 18.3".
- FS p. 56 (local text), proof of II.1.21: "Spd(E) → ∗ is representable in locally spatial diamonds and cohomologically smooth by [Sch17a, Proposition 24.5] … Then being proper follows from the valuative criterion [Sch17a, Proposition 18.3]". Also: "In particular, the map |XS| = |Div1 × S| −→ |S| is open and closed."
- S5: "Deduce 24.5 for `Spd ℚ_p → *`". C4: "Build ECD §18 on D5's small-v-stack geometry. Define properness, prove the valuative criteria".
- Graph at origin/main. RF2:untilts has 65 ancestors, none in DiamondSixOperations or DiamondEtaleCohomology. D5 is among them. HS0, VS1 and VB3:general-BC each have S5 and C4 as ancestors, and HS1 descends from HS0 and VS1. RF3, RF4:vector-bundles, VB1, BG0 and GS0:loop-geometry have neither S5 nor C4 as an ancestor.
- RS-20 RF2:untilts `keeps`: "Retain … source-qualified Div^1 properness/smoothness obligations". RS-20.md, row for div1-moduli-and-properness: "Late geometric properties need their own proved inputs."
- VB3:general-BC/absolute-BC-spatiality (FS II.3.6–II.3.7) has the hypothesis "One works on Perf_k with k algebraically closed". II.1.21 is stated over ∗ = Spd(F_q).
- PAPER-FARGUES-SCHOLZE-21 (no review yet) has the items c2a-prop-II.1.21-Div1-proper-smooth and c2a-fact-XS-to-S-open-closed, both with status missing.
- Choice of home. The finding offers VB3:general-BC or a new RF2 child; I take the child. First, FS prove II.1.21 directly, from ECD 24.5, ECD 18.3 and the qcqs map |X_S| → |S|, with no bundle theory. Second, II.3.7 in VB3:general-BC is stated on Perf_k, so deriving Div^1 → Spd(F_q) from it needs an extra descent step, and it would make II.1.21 wait for the classification (VB3:general-BC requires VB2:classification). Third, the graph cost is one stage: HS0 goes from 155 to 156 ancestors and VS1 from 141 to 142.
- Acyclicity: the new edges below close no cycle on stageEdges, on stageEdges plus all accepted RS links, or with RS-20's links added.

**Fix, as edits.**
1. New atlas stage.
   - id "RelativeFarguesFontaine:RF2:div1-properness"; owner "RelativeFarguesFontaine"; key "RF2:div1-properness"; title "Properness and smoothness of Div^1".
   - description: "### RF2:div1-properness — Properness and smoothness of Div^1\n\nProve FS Proposition II.1.21: Div^1 = Spd(E)/phi^Z → * = Spd(F_q) is proper, representable in spatial diamonds and cohomologically smooth. Import from DiamondSixOperations S5 (ECD Proposition 24.5) that Spd(Q_p) → * is representable in locally spatial diamonds and cohomologically smooth. Deduce the case of E finite over Q_p, and treat equal characteristic as in that proof. Use |Spd(E)/phi^Z × S| = |X_S| → |S| (RF1) for spatial representability, and the valuative criterion of DiamondEtaleCohomology C4 (ECD Proposition 18.3) for properness. Deduce that |X_S| → |S| is open and closed. The definition of Div^1 and its description by degree-one divisors stay in RF2:untilts. This stage is not an input of the RF2 aggregate, RF3, RF4, VB1 or BG0."
   - requires: ["RelativeFarguesFontaine:RF2:untilts", "DiamondEtaleCohomology:C4", "DiamondSixOperations:S5"]. RF1 and D5 are already ancestors through RF2:untilts.
   - consumers: ["HeckeStacksAndLocalShtukas:HS0", "VStackSheavesAndLisseCategories:VS1"]. HS1 descends from both, so it needs no direct edge.
   - stageEdges: add RF2:untilts → RF2:div1-properness, C4 → RF2:div1-properness, S5 → RF2:div1-properness, RF2:div1-properness → HS0 and RF2:div1-properness → VS1. Do not add C4 → RF2:untilts, S5 → RF2:untilts or RF2:div1-properness → RF2.
   - README: insert the section after §RF2:untilts, with anchors `<a id="rf2-div1-properness"></a>` and `<a id="stage-RF2:div1-properness"></a>`.
2. README §RF2:untilts and the atlas descriptions, after the corrected Div^1 sentence of /16: add "Its properness, spatial representability and cohomological smoothness over * (FS II.1.21) are proved in RF2:div1-properness, after C4 and S5."
3. data/decompositions/RelativeFarguesFontaine.json (and the matching node in research/blueprint/packets/RelativeFarguesFontaine--RF0.json with its README).
   a. Node RF2:untilts/div1-moduli-and-properness keeps its id and parent. Change the title to "Div^1 = Spd E/phi^Z: degree-one divisors". Delete from its statement the sentence "The map Div^1 -> * is proper, representable in spatial diamonds, and cohomologically smooth." Delete the two hypotheses that quote ECD 24.5 and 18.3, the last two proof steps (spatial representability, properness and smoothness) and the II.1.21 source excerpt.
   b. New node "RelativeFarguesFontaine:RF2:div1-properness/div1-proper-smooth" (kind theorem, parent RF2:div1-properness). Its statement is the deleted sentence plus "; hence |X_S| → |S| is open and closed". It takes the two ECD hypotheses and the two proof steps moved from 3a, plus the hypothesis "S5 supplies ECD 24.5, C4 supplies ECD 18.3, and RF1 supplies |X_S| → |S| qcqs for qcqs S". Its source is the FS II.1.21 excerpt (printed p. 56).
   c. Links: add div1-moduli-and-properness → div1-proper-smooth and RelativeFarguesFontaine:RF1/diamond-formula-and-map-to-base → div1-proper-smooth.
4. RS-20.result.json (under revision). In layers["RelativeFarguesFontaine:RF2:untilts"].keeps, replace "Retain divisor addition, disjointness/collision compatibility and source-qualified Div^1 properness/smoothness obligations." with "Retain divisor addition and disjointness/collision compatibility. The Div^1 properness/smoothness obligation (FS II.1.21) moves to the new stage RF2:div1-properness, after DiamondEtaleCohomology:C4 and DiamondSixOperations:S5."
5. PAPER-FARGUES-SCHOLZE-21.result.json, when reviewed: set items c2a-prop-II.1.21-Div1-proper-smooth and c2a-fact-XS-to-S-open-closed to status planned, with planned ["RelativeFarguesFontaine:RF2:div1-properness"].

**Adjusted by the joint check (C3).** Also add the stage edge RelativeFarguesFontaine:RF2 → RelativeFarguesFontaine:RF2:div1-properness, so that the sub-stage names its parent. Without it, scripts/theory_graph.py (lines 62–72) makes RF2 require the new sub-stage, and C4, S5 and H0 would become ancestors of RF2, BG0 and GS0:loop-geometry, which this fix and /9 exclude. With the edge the graph stays acyclic and none of H0, C4, S5 reaches RF2, BG0 or GS0:loop-geometry.

**Not changed / open.**
- GS0:loop-geometry uses Div^1 for its leg divisors, but its text does not use properness of Div^1 over ∗, so it gets no edge. If its blueprint needs II.1.21, it must import the new stage, which puts C4 and S5 in front of it.
- VB3:general-BC keeps II.3.6–II.3.7. The node's acceptance test "(BC(O(1)) minus zero)/E^times = Div^1" stays as a consistency check.
- Outside my findings, a sibling gap: II.2.5 (i) and (iii) cite ECD 23.13 and 24.2 (node VB1/cohomology-of-twists), yet neither VB1 nor VB3:positive-basic-examples descends from DiamondSixOperations or DiamondEtaleCohomology. The VB blueprint job should settle those inputs (see /21).

## /18 (medium, missing): no layer plans the locus [ϖ] = 0 of Spa W_OE(R⁺); add RF0:crystalline-end

**The finding and the verdict.** No stage constructs the part of Spa W_OE(R⁺) where [ϖ] = 0. That part consists of the charts Y_{S,[r,∞]}, their rings B_{R,[r,∞]}, the π-adic sheafiness of W_OE(R⁺)[1/π] with FS's two exact sequences, and Kedlaya's adic-to-scheme equivalence for bundles on Spa W(R⁺) ∖ V(π,[ϖ]). Yet FS II.2.2 and II.2.5, the accepted GUO-REINECKE-24 route 6 and the essential surjectivity of AI.2 (see /19) use it. The verifier confirmed the structural half: RF0:integral-Y removes V([ϖ]) "outright" and RF0:annuli removes V(π), "so neither node constructs the part of Spa W_{O_E}(R+) where [varpi] = 0". The verifier did not re-check the FS details. I checked them in the local text.

**Checked.**
- RF0:integral-Y: "construct `𝒴_S = Spa(W_OE(R+)) \ V([varpi])`". RF0:annuli: "construct `Y_S = 𝒴_S \ V(pi)`". Node RF0:annuli/radius-function-and-rational-annuli: "For a rational interval I = [a,b] contained in (0,infty)".
- Tau Ceti AdicSpaces Layer 6 (§6.3): "the endpoint cases `I = [0,r]` and `[r,∞]` are not known to be strongly noetherian, which is why `I` is restricted to closed intervals inside `(0,∞)` above".
- FS, local text, proof of II.2.5, pp. 62–63: "BR,[1,∞] = O(YS,[1,∞])", "YS,[1,∞] = {|[ϖ]| ≤ |π| ≠ 0} ⊂ Spa WOE(R+)", "(We warn the reader that YS,[0,1] and YS,[1,∞] are not contained in YS …)", and "0 → WOE(R+)[1/π] → BR,[1,∞] ⊕ BR,[0,q][1/π] → BR,[1,q] → 0 (obtained from sheafyness of WOE(R+)[1/π] when endowed with the π-adic topology on WOE(R+))", with the analogous sequence for [0,1] and [1,1]. Proof of II.2.2 (p. 60): "as in the proof of Proposition II.2.5 below, one can rewrite H0(XS, OXS(1)) as BR,[1,∞]^{φ=π}".
- Consumer nodes in data/decompositions/VectorBundlesAndIsocrystals.json. VB1/cohomology-of-twists has "a part in [varpi]B_{R,[1,infty]}" and "the two short exact sequences involving W_{O_E}(R^+)[1/pi]". VB3:positive-basic-examples/lubin-tate-universal-cover rewrites H^0(X_S, O(1)) through B_{R,[1,infty]}.
- SW20, local text. Prop. 13.1.1 (p. 108): "The space Y is an adic space … We apply a similar strategy to the rational subsets Y[r,∞] for r > 0". Theorem 14.2.1 (Kedlaya, p. 116): finite free A_inf-modules are equivalent to vector bundles on Y. Prop. 14.2.6 (p. 119): "the category of vector bundles on Spec W(K+)\{p = [ϖ] = 0} is equivalent to the category of finite free W(K+)-modules".
- GUO-REINECKE-24 item /129 (status missing): "vector bundles on the adic space Spa(W(R⁺), W(R⁺)) ∖ V(p, [ϖ]) are equivalent to vector bundles on the scheme Spec W(R⁺) ∖ V(p, [ϖ])", citing [Ked20, Thm 3.8]. Route 6 (source; stages RF0:integral-Y and RF4:vector-bundles) was accepted with the reason "a statement about the integral period space", but RF0:integral-Y removes V([ϖ]). The route 1 brief imports "RelativeFarguesFontaine RF0/RF4 (Kedlaya algebraization, Beauville–Laszlo)".
- A related error in the RF0 inputs. Proof step 3 of the node RF0:annuli/radius-function-and-rational-annuli, in data/decompositions/RelativeFarguesFontaine.json, research/blueprint/packets/RelativeFarguesFontaine--RF0.json and research/blueprint/readmes/RelativeFarguesFontaine--RF0.md, says that Y_{S,[0,1]} and Y_{S,[1,infty]} "lie in Y-curly_S but not in Y_S". FS says only "not contained in YS". Y_{S,[1,∞]} contains points with [ϖ] = 0, so it is not in 𝒴_S either.
- The finding's locator Kedlaya arXiv:1602.09016v5 Thm 3.8 was not checked. It is cited as Guo–Reinecke cite it.
- Acyclicity: the edges below, together with those of /19, close no cycle on stageEdges, on stageEdges plus all accepted RS links, or with RS-20's links added.

**Fix, as edits.**
1. New atlas stage.
   - id "RelativeFarguesFontaine:RF0:crystalline-end"; owner "RelativeFarguesFontaine"; key "RF0:crystalline-end"; title "The crystalline end [varpi] = 0".
   - description: "### RF0:crystalline-end — The crystalline end [varpi] = 0\n\nFor S = Spa(R,R+) affinoid perfectoid over F_q with pseudouniformizer varpi, construct the rational subsets Y_{S,[r,∞]} = {|[varpi]| ≤ |pi|^r ≠ 0} of Spa W_OE(R+) for rational r > 0, with rings B_{R,[r,∞]} = O(Y_{S,[r,∞]}) and plus rings, and the open 𝒴_S ∪ Y_{S,[1,∞]} = Spa W_OE(R+) \ V(pi,[varpi]). These charts contain the locus [varpi] = 0 and are contained in neither 𝒴_S nor Y_S (FS p. 62). Prove that they are adic spaces by the sousperfectoid chart method of RF0:integral-Y (SW20 Proposition 13.1.1 for S = Spa C♭, E = Q_p); the anchor's strong-noetherian theorem does not cover these endpoint intervals (AdicSpaces Layer 6, Kedlaya's Remarks 4.12/4.14). Prove sheafiness of W_OE(R+)[1/pi] with the pi-adic topology on W_OE(R+), and the exact sequences 0 → W_OE(R+)[1/pi] → B_{R,[1,∞]} ⊕ B_{R,[0,q]}[1/pi] → B_{R,[1,q]} → 0 and 0 → W_OE(R+)[1/pi] → B_{R,[1,∞]} ⊕ B_{R,[0,1]}[1/pi] → B_{R,[1,1]} → 0 (FS proof of II.2.5, p. 63). Prove Kedlaya's algebraization: vector bundles on the adic space and on the scheme Spec W_OE(R+) \ V(pi,[varpi]) are equivalent ([Ked20, Theorem 3.8], as cited by Guo–Reinecke), and for a perfectoid field K, vector bundles on Spec W(K+) \ {p = [varpi] = 0} are finite free (SW20 Proposition 14.2.6). Where the source is p-typical, the ramified and equal-characteristic cases are proof obligations here."
   - requires: ["RelativeFarguesFontaine:RF0:integral-Y", "RelativeFarguesFontaine:RF0:annuli"].
   - consumers: ["RelativeFarguesFontaine:RF0", "VectorBundlesAndIsocrystals:VB1", "VectorBundlesAndIsocrystals:VB3:positive-basic-examples", "AInfCohomology:AI.2:essential-surjectivity"]. The last is the new stage of /19.
   - stageEdges: add RF0:integral-Y → RF0:crystalline-end, RF0:annuli → RF0:crystalline-end, RF0:crystalline-end → RF0, RF0:crystalline-end → VB1, RF0:crystalline-end → VB3:positive-basic-examples and RF0:crystalline-end → AI.2:essential-surjectivity. The edge into the aggregate RF0 keeps "RF0 as an aggregate is complete only after those children" true. The only stage it reaches that way is BG0, whose added ancestors are this stage and ancestors it already has.
   - README: insert after §RF0:annuli, with anchors `<a id="rf0-crystalline-end"></a>` and `<a id="stage-RF0:crystalline-end"></a>`.
2. Node RF0:annuli/radius-function-and-rational-annuli, in data/decompositions/RelativeFarguesFontaine.json, research/blueprint/packets/RelativeFarguesFontaine--RF0.json and research/blueprint/readmes/RelativeFarguesFontaine--RF0.md. Replace proof step 3, "Fargues-Scholze record the warning that the half-open charts Y_{S,[0,1]} and Y_{S,[1,infty]} used in the cohomology computations lie in Y-curly_S but not in Y_S.", with "Fargues-Scholze record the warning that the half-open charts Y_{S,[0,1]} and Y_{S,[1,infty]} used in the cohomology computations are not contained in Y_S. Y_{S,[0,1]} = {|pi| <= |[varpi]| != 0} lies in Y-curly_S. Y_{S,[1,infty]} = {|[varpi]| <= |pi| != 0} contains the locus [varpi] = 0 and lies in neither; it is constructed in RF0:crystalline-end."
3. RS-20.result.json (under revision). In layers["RelativeFarguesFontaine:RF0"].keeps, replace "before the integral-Y/annuli children; RF0 as an aggregate is complete only after those children" with "before the integral-Y, annuli and crystalline-end children; RF0 as an aggregate is complete only after those children".
4. research/blueprint/papers/PAPER-GUO-REINECKE-24.result.json.
   a. routes[5] (route 6): change "stages" from ["RelativeFarguesFontaine:RF0:integral-Y", "RelativeFarguesFontaine:RF4:vector-bundles"] to ["RelativeFarguesFontaine:RF0:crystalline-end", "RelativeFarguesFontaine:RF4:vector-bundles"]. In its reason, replace "belong with RF0's integral period space 𝒴" with "belong with RF0:crystalline-end, which constructs Spa W(R⁺) ∖ V(p,[ϖ]) including the locus [ϖ] = 0 that RF0:integral-Y removes,". RF4 stays for the φ-module freeness parts of item /129 (Ivanov, Kedlaya–Liu).
   b. routes[0] (route 1) brief: replace "RelativeFarguesFontaine RF0/RF4 (Kedlaya algebraization, Beauville–Laszlo)" with "RelativeFarguesFontaine RF0:crystalline-end (Kedlaya algebraization on Spa W(R⁺) ∖ V(p,[ϖ])) and RF4:vector-bundles (Beauville–Laszlo)".
   c. The route 6 review reason ("a statement about the integral period space") should be re-recorded when the route change is applied.
5. The consumers' texts are in /21, edits 2 and 5: VB1 uses the φ − π^n analysis on B_{R,[1,∞]}, and VB3:positive-basic-examples uses H^0(X_S, O(1)) = B_{R,[1,∞]}^{φ=π}.

**Not changed / open.**
- The ramified and equal-characteristic forms of Kedlaya's algebraization have no source read here. They are stated as proof obligations.
- The RF0 blueprint packet should add coverage for RF0:crystalline-end (status not_read), with the locators above: FS pp. 62–63; SW20 Prop. 13.1.1, Thm 14.2.1 and Prop. 14.2.6; [Ked20, Thm 3.8].

## /19 (medium, error): AI.2 takes the Fargues–Fontaine curve as input only for essential surjectivity; split AI.2

**The finding and the verdict.** AI.2 plans Fargues' equivalence in both directions from BMS1 Thm 4.28 "and its proof". BMS1 proves only full faithfulness (Remark 4.29) and refers to Scholze–Weinstein for the rest. Essential surjectivity needs the classification of bundles, GAGA and Kedlaya's theorem on Y. The edge RF4:vector-bundles → AI.2 raises AI.2's ancestor count from 24 to 72. The verifier confirmed "Every number in this finding checks out, and the ancestor arithmetic is exact", but did not verify the BMS1 or SW20 statements. I checked them in the local texts.

**Checked.**
- AI.2 (content/campaign/AInfCohomology/README.md l. 102–114): "Prove Fargues' equivalence for \*\*finite free\*\* BKF modules … Construct both directions, full faithfulness and tensor/Tate-twist compatibility using the analytic annulus/patching arguments of BMS1 §4" and "Source: BMS1 Definition 4.22, Lemmas 4.26–27, Theorem 4.28 and its proof." It requires AI.0, P7:annulus-foundations, R06.1 and RF4:vector-bundles. Its consumers are AI.5 and PR.7.
- BMS1, local text of arXiv:1602.03148v3. Before Theorem 4.28 (p. 42): "The main theorem about Breuil–Kisin–Fargues modules is Fargues' classification; we refer to [61] for a proof." Remark 4.29 (p. 43): "For the proof of our main theorems, we only need fully faithfulness of the functor M ↦ (T, Ξ), which is easy to prove directly. Indeed, faithfulness follows directly from Lemma 4.26". Its proof ends "But now N = ∩ φ^{-r}(µ)^{-1}N by Lemma 3.23". Lemma 4.6 (Kedlaya): "all vector bundles on U are free", where U = Spec A_inf ∖ {s}. It is used in Proposition 4.13, the structure of BKF-type modules.
- SW20, local text, proof of Theorem 14.1.1 (p. 116): "The equivalence between (1) and (2) is Theorem 12.4.6"; "By Corollary 13.5.5, the datum of a trivial vector bundle F is equivalent to …"; "by the Beauville–Laszlo lemma"; "by Theorem 13.5.6" (GAGA for the curve); "By Theorem 14.2.1 below, categories (4) and (5) are equivalent." Corollary 13.5.5's proof: "all vector bundles on XFF that are semistable of slope 0 are trivial, which follows from the classification of vector bundles". Lecture 13, which proves (1)↔(4), uses Kedlaya's classification of φ-modules (Theorem 13.4.1) and Prop. 13.1.1, which shows that Y, including its charts Y[r,∞], is an adic space. For Theorem 14.2.1 and Prop. 14.2.6, see /18.
- Bhatt–Scholze, Prismatic F-crystals (local text), p. 15, after Theorem 5.2 (Fargues): "For an elementary proof of full faithfulness (which is the only part we use), we refer to [BMS18, Remark 4.29]. For the essential surjectivity, see [SW18, Lecture XIV]." PR.7 takes its sources from that paper ("BS F-crystals §§5–7, Theorem 5.6").
- AI.5's text uses the BKF category ("the latter satisfy the BKF conditions"), not essential surjectivity.
- Ancestor counts on stageEdges at origin/main (script): AI.2 has 72 ancestors with RF4:vector-bundles → AI.2 and 24 without; AI.5 goes from 77 to 32 and PR.7 from 92 to 61. AI.2 has 194 descendants. No VectorBundlesAndIsocrystals stage is an ancestor of AI.2.
- RS-20 (under revision) has the link RF4:vector-bundles → AI.2 ("Linear Beauville-Laszlo gluing for the stated Breuil-Kisin-Fargues lattice comparison"). Its RF4:vector-bundles `keep` says "This remains the linear supplier to AInfCohomology AI.2".
- data/decompositions/AInfCohomology.json has no AI.2 nodes (coverage "not_read").
- Acyclicity: deleting RF4:vector-bundles → AI.2 and adding the edges below, together with those of /18, closes no cycle on stageEdges, on stageEdges plus all accepted RS links, or with RS-20's links added.

**Fix, as edits.**
1. AI.2 keeps its id and becomes part (a): the BKF category and full faithfulness.
   a. README §AI.2 and the atlas description. Replace the paragraph from "Prove Fargues' equivalence for \*\*finite free\*\* BKF modules" to "Do not extend the finite-free classification to every finitely presented torsion BKF object." with: "Construct the functor M ↦ (T, Xi) from finite free BKF modules over algebraically closed C to pairs (T, Xi). Here T = (M ⊗ W(C♭))^{phi=1} is finite free over Z_p and Xi is a B_dR^+-lattice in T ⊗ B_dR. Prove tensor/Tate-twist compatibility, and prove that the functor is fully faithful (BMS1 Lemma 4.26, Lemma 3.23, Remark 4.29). This part uses no Fargues–Fontaine curve input. Essential surjectivity (Fargues' theorem) is AI.2:essential-surjectivity. Do not extend the finite-free classification to every finitely presented torsion BKF object."
   b. Replace "Source: BMS1 Definition 4.22, Lemmas 4.26–27, Theorem 4.28 and its proof." with "Sources: BMS1 Definition 4.22, Lemma 4.6, Proposition 4.13, Lemmas 3.23 and 4.26–4.27, Theorem 4.28 (statement) and Remark 4.29; Bhatt–Scholze, Prismatic F-crystals, Theorem 5.2 and the remark after it."
   c. stageEdges: delete {"source": "RelativeFarguesFontaine:RF4:vector-bundles", "target": "AInfCohomology:AI.2"}. AI.2's requires become ["AInfCohomology:AI.0", "PadicHodgeTheory:P7:annulus-foundations", "PadicHodgeTheory:R06.1"].
2. New atlas stage, part (b).
   - id "AInfCohomology:AI.2:essential-surjectivity"; owner "AInfCohomology"; key "AI.2:essential-surjectivity"; title "Fargues' theorem: essential surjectivity".
   - description: "### AI.2:essential-surjectivity — Fargues' theorem: essential surjectivity\n\nProve that every pair (T, Xi) comes from a finite free BKF module, so that AI.2's functor is an equivalence (BMS1 Theorem 4.28; proof in SW20 Theorem 14.1.1 and §§14.2–14.3). Follow SW20. Pairs (T, Xi) correspond to shtukas with one leg by Beauville–Laszlo (Proposition 12.4.6; RF4:vector-bundles). Such a shtuka extends over the crystalline end by the classification of vector bundles (Lecture 13, Corollary 13.5.5; VB2:classification) and GAGA (Theorem 13.5.6; VB2:ampleness). Vector bundles on Y = Spa A_inf \ {x_k} correspond to finite free A_inf-modules (Kedlaya; SW20 Theorem 14.2.1 and Proposition 14.2.6; RF0:crystalline-end). Keep the Galois action for descent from a discretely valued field. Acceptance: the p-divisible-group range T ⊗ B_dR^+ ⊂ Xi ⊂ ξ^{-1}(T ⊗ B_dR^+)."
   - requires: ["AInfCohomology:AI.2", "VectorBundlesAndIsocrystals:VB2:classification", "VectorBundlesAndIsocrystals:VB2:ampleness", "RelativeFarguesFontaine:RF4:vector-bundles", "RelativeFarguesFontaine:RF0:crystalline-end"]. VB2:ampleness is already an ancestor through VB2:classification. The direct edge records the GAGA import.
   - consumers: none in the atlas today.
   - stageEdges: add the five edges into the new stage. README: insert after §AI.2, with anchor `<a id="stage-AI.2:essential-surjectivity"></a>`.
3. Consumers. AI.5 stays on AI.2, since it needs the BKF category and, per BMS1 Remark 4.29, only full faithfulness. PR.7 stays on AI.2, since Bhatt–Scholze use "full faithfulness (which is the only part we use)". So the finding's "Retarget AI.5 to (a)" holds already with this naming, and no consumer moves to (b).
4. RS-20.result.json (under revision). Retarget the link RF4:vector-bundles → AI.2 to target "AInfCohomology:AI.2:essential-surjectivity", with the reason "Linear Beauville–Laszlo gluing between pairs (T, Xi) and shtukas with one leg in the essential surjectivity of Fargues' theorem (SW20 Proposition 12.4.6); full faithfulness in AI.2 needs no curve input." In layers["RelativeFarguesFontaine:RF4:vector-bundles"].reason, replace "This remains the linear supplier to AInfCohomology AI.2" with "This remains the linear supplier to AInfCohomology AI.2:essential-surjectivity".

**Adjusted by the joint check (C1).** AI.2:essential-surjectivity does have a consumer: the prismatic Dieudonné Part II (PAPER-SCHOLZE-WEINSTEIN-20 route 1, accepted), whose final theorems (2) and (3) use Fargues' equivalence with (T, Ξ). In edit 2, name it as a consumer. In route 1's brief, replace "AInfCohomology AI.2 (Breuil–Kisin–Fargues modules and Fargues' equivalence with (T, Ξ))" with "AInfCohomology AI.2 (Breuil–Kisin–Fargues modules and full faithfulness) and AI.2:essential-surjectivity (Fargues' equivalence with (T, Ξ))". Once the new stages exist, re-point SW20 route 9's items /88 (Prop. 12.4.6) and /98 (Thm 14.1.1) to AI.2:essential-surjectivity, keeping RF4:vector-bundles where an item already names it, and re-point /99's Kedlaya extension (Thm 14.2.1, Prop. 14.2.6) and route 7's /89 (the [ϖ] = 0 charts of Prop. 13.1.1) to RF0:crystalline-end. The edge AI.2:essential-surjectivity → the Part II is acyclic.

**Not changed / open.**
- AI.2 keeps its edges from P7:annulus-foundations and R06.1. Whether full faithfulness needs P7:annulus-foundations is for the AI.2 blueprint to settle.
- SW20 Lecture 13 also uses Theorem 13.2.1 ([FF18, Théorème 11.1.9, Corollaire 11.1.13]), which compares φ-modules over Y[r,∞) with bundles on the curve. The AI.2:essential-surjectivity blueprint should name the owner of that theorem.
- The GUO-REINECKE-24 route 1 brief imports "AInfCohomology AI.0–AI.5: BKF modules, Fargues' theorem". If Guo–Reinecke use essential surjectivity (not checked here), the design job should also import AI.2:essential-surjectivity.

## /20 (medium, duplicate): B_dR⁺(C) and its DVR theorem are planned in both R06.1 and RF2:untilts

**The finding and the verdict.** R06.1 and RF2:untilts both plan B_dR⁺ and B_dR, and the theorem that B_dR⁺(C) is a complete DVR with residue field C. No edge or comparison connects the two stages, and different consumers cite different owners. The verifier confirmed: "Both stages construct the same rings and there is no edge between them."

**Checked.**
- R06.1 (content/campaign/PadicHodgeTheory/README.md l. 28): "Import C_p and its tilt from PerfectoidSpaces … Construct B_dR^+, its filtration and B_dR, B_cris^+, B_cris and B_st from those same objects."
- The R06.1 nodes in research/blueprint/packets/PadicHodgeTheory--P7.json. R06.1/bdr-plus-complete-dvr: "B_dR^+ is a complete discrete valuation ring with residue field C (via θ_dR), and every generator of ker θ_Q (e.g. ξ) is a uniformiser". R06.1/de-rham-period-ring: "Put B_dR^+ := BDeRhamPlus O_C p … The construction depends only on the valued field C". But R06.1/cp-integers-p-adically-complete fixes "C = ℂ_[p] = completion of Q̄_p". So R06.1 plans the DVR theorem, but only for C_p.
- RF2:untilts (README l. 90–93): "Construct completion along a divisor, B_dR^+ and its localization B_dR … At a geometric untilt identify the complete discrete valuation ring and its residue field." Node RF2:untilts/BdR-completion-and-filtration: "At a geometric untilt the ring B^+_dR is a complete discrete valuation ring whose residue field is the untilt". It quotes FS p. 196: "B⁺_{Div¹_𝒴} = B⁺_dR(C♯) … for the usual definition of B⁺_dR and B_dR (relative to O_E). Recall that B⁺_dR(C♯) is a complete discrete valuation ring with residue field C♯".
- RS-01 owner (accepted): "Rational period-ring constructions, … reusing the existing BDeRhamPlus/BDeRham carriers …" → R06.1, formerly [CP.0]. RS-01's family does not include RelativeFarguesFontaine.
- RS-20 RF2:untilts `keeps` (under revision): "prove the generic d = 1 B_dR^+/B_dR, residue, filtration and graded-line comparisons, including the geometric DVR specialization" and "These absolute carriers are zero when p = 0 in the input".
- AI.0: "B_dR^+ is the kernel-adic completion after p-inversion supplied by PadicHodgeTheory". HOWE-KLEVDAL-26 route 1 brief: "FarguesFontaineDiamonds and RelativeFarguesFontaine RF2:untilts, RF4 (B_dR^+, B_dR, modifications)". Its design job DESIGN-AdmissiblePairsAndPadicHodgeStructures is pending in queue.json at origin/main.
- There is no path between R06.1 and RF2:untilts in either direction, on stageEdges or with all accepted RS links. Adding R06.1 → RF2:untilts closes no cycle on any of the three graphs. It raises RF2:untilts's ancestors from 65 to 69. The additions are AI.0, AI.0:integral, ArithmeticGaloisRepresentations:R01.1 (which has no ancestors) and R06.1. RF2:untilts and 58 of its descendants gain these four.

**Fix, as edits.**
1. content/campaign/PadicHodgeTheory/README.md §R06.1 and the R06.1 atlas description.
   a. Replace "Import C_p and its tilt from PerfectoidSpaces," with "Import C_p, and more generally any complete algebraically closed nonarchimedean field C of mixed characteristic (0, p), and its tilt from PerfectoidSpaces,".
   b. After "Construct B_dR^+, its filtration and B_dR, B_cris^+, B_cris and B_st from those same objects.", add: "For every such C, prove that B_dR^+(C) = BDeRhamPlus O_C p is a complete discrete valuation ring with residue field C, with any generator of ker θ as uniformizer, and that B_dR(C) is its fraction field. This stage owns that theorem for all such C. RelativeFarguesFontaine RF2:untilts imports it at geometric points."
2. research/blueprint/packets/PadicHodgeTheory--P7.json, nodes R06.1/de-rham-period-ring, R06.1/bdr-plus-complete-dvr and R06.1/explicit-generator-of-ker-theta. Replace "O_C = 𝓞_ℂ_[p]" with "O_C the valuation ring of a complete algebraically closed nonarchimedean field C of mixed characteristic (0, p)". Add the hypothesis: "For general C, O_C is p-adically complete and Frobenius is surjective on O_C/p because C is complete and algebraically closed, so the Mathlib carriers apply. The instance C = ℂ_[p] (R06.1/cp-integers-p-adically-complete) is the one used for Galois-theoretic statements. For ξ, choose p♭ with (p♭)♯ = p."
3. RF2:untilts, in the README and the RF2 and RF2:untilts atlas descriptions. Replace "At a geometric untilt identify the complete discrete valuation ring and its residue field." with "At a geometric point S = Spa(C, C+) with untilt C♯ over E, identify the degree-one completed ring with B_dR^+(C♯) (FS p. 196). For E of mixed characteristic, import B_dR^+(C♯), B_dR(C♯) and the complete-DVR/residue-field theorem from PadicHodgeTheory R06.1, and prove the comparison with the O_E-relative construction. For E of equal characteristic, prove the DVR statement here."
4. data/decompositions/RelativeFarguesFontaine.json, node RF2:untilts/BdR-completion-and-filtration.
   a. Replace the last sentence of the statement, "At a geometric untilt the ring B^+_dR is a complete discrete valuation ring whose residue field is the untilt.", with "At a geometric point with untilt C♯, B^+_{Div^1}(S) = B^+_dR(C♯) (FS p. 196). In mixed characteristic, B^+_dR(C♯) and its complete-DVR/residue-field theorem are imported from PadicHodgeTheory:R06.1/bdr-plus-complete-dvr. In equal characteristic they are proved here."
   b. Add the link {"source": "PadicHodgeTheory:R06.1/bdr-plus-complete-dvr", "target": "RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration", "reason": "Absolute B_dR^+(C♯) and its DVR theorem, identified with the degree-one completed ring at geometric points."}.
5. data/atlas.json stageEdges: add {"source": "PadicHodgeTheory:R06.1", "target": "RelativeFarguesFontaine:RF2:untilts"}, and add R06.1 to RF2:untilts's requires.
6. RS-20.result.json (under revision; its family contains RF2:untilts, and RS-01's does not).
   a. owners, add: {"target": "B_dR^+(C) and B_dR(C) for complete algebraically closed C of mixed characteristic (0,p), on the Mathlib BDeRhamPlus/BDeRham carriers, with the theorem that B_dR^+(C) is a complete discrete valuation ring with residue field C", "owner": "PadicHodgeTheory:R06.1", "formerly": ["RelativeFarguesFontaine:RF2:untilts"]}.
   b. layers["RelativeFarguesFontaine:RF2:untilts"]: add "PadicHodgeTheory:R06.1" to suppliedBy. In keeps, replace "including the geometric DVR specialization" with "including the identification with B_dR^+(C♯) at geometric points, importing R06.1's complete-DVR theorem in mixed characteristic and proving it here only in equal characteristic".
   c. links, add: {"source": "PadicHodgeTheory:R06.1", "target": "RelativeFarguesFontaine:RF2:untilts", "reason": "Absolute B_dR^+(C), B_dR(C) and the complete-DVR theorem at geometric points of mixed characteristic."}.
   d. The existing RS-20 owner "Generic degree-one de Rham interpretation, filtration/graded lines and the Perf_Fq versus Perf_k Div^1 comparison → RF2:untilts" stays.
7. research/blueprint/papers/PAPER-HOWE-KLEVDAL-26.result.json, routes[0].brief. Replace "FarguesFontaineDiamonds and RelativeFarguesFontaine RF2:untilts, RF4 (B_dR^+, B_dR, modifications)" with "PadicHodgeTheory R06.1 (B_dR^+(C), B_dR(C) and the complete-DVR theorem); FarguesFontaineDiamonds and RelativeFarguesFontaine RF2:untilts (the relative degree-one ring B^+_{Div^1}(S), its filtration and its identification with R06.1's ring at geometric points) and RF4 (modifications)". Apply this before DESIGN-AdmissiblePairsAndPadicHodgeStructures runs.

**Not changed / open.**
- The finding gives R06.1 the ring "for arbitrary complete algebraically closed C over E". I limit this to mixed characteristic (0, p). The Mathlib carriers invert p and are zero when p = 0 (RS-20), so the equal-characteristic case stays with RF2:untilts.
- B_cris, B_st and the rest of R06.1 are unchanged.

## /21 (medium, other): the FS II.2 order across RF3, VB1, VB2 and VB3 — RS-20~3 settles RF3; the VB inversions are fixed by moving nodes, not by reversing edges

**The finding and the verdict.** RS-20's open blocker concerns RF3's global map X_S → Proj P, which needs the covering by the loci D(g) that FS proves only in II.2.6 (VB2:ampleness). The finding shows this is one instance of an order inversion that runs through the FS II.2 chain across RF3, VB1, VB2:ampleness and VB3:positive-basic-examples, and it proposes a five-step order. The verifier confirmed the blocker and the ordering problem. It added that the split "is a proposal the fix job should evaluate on its own merits, and my verdict should not be read as endorsing that particular arrangement".

My evaluation. Steps (1) and (4) are already done in RS-20~3. Step (3) contradicts the source, because II.2.10 needs GAGA. Step (2) is right in substance, but II.2.5 has to be split for the order to hold. Reversing the three atlas edges, as the VB packets suggest, would create 2-cycles. The arrangement below uses only existing edges and moves nodes.

**Checked.**
- REV-RS-20~2 §1 gives the second option: "Split the early rank-one/graded-ring/chart-map construction from the later global-map comparison, and place the latter after a proved positive-generation input."
- RS-20~3 (commit cd6987eb, 29 September; REV-RS-20~3 pending) takes that option. RF3 `keeps` has "the chartwise construction of FS II.2.7's proof … These glue to a morphism U -> Proj(P) on the open U = union of the D(g). RF3 does not assert U = X_S". The VB2:ampleness entry reads: "Its first theorem is global generation … On that cover this stage then glues RF3's chart maps to the morphism f … Only after that does it prove the GAGA comparison it already owns." A new owner entry gives the global morphism and twists to VB2:ampleness. These are the finding's steps (1) and (4).
- FS, local text, p. 68. II.2.9's proof uses the Lubin–Tate sequence "0 → OXC → OXC(1) → OC♯ → 0" and "D+(g) for any g ∈ H0(XC, OXC(1)) that does not vanish at x". II.2.10's proof reads "By Proposition II.2.9, any line bundle becomes trivial after removing one closed point x ∈ XC^alg. As the local rings of XC^alg are discrete valuation rings, this implies that any line bundle is of the form OXC(n[x])". That passage moves line bundles from X_C to X_C^alg, which is the GAGA equivalence II.2.7. The reviewed decomposition records the node link VB2:ampleness/gaga-equivalence → VB2:ampleness/schematic-curve-at-a-geometric-point. So the finding's step (3), which puts II.2.9–II.2.10 before VB2:ampleness, runs against the source.
- The three atlas edges are each source-supported, so none can simply be reversed. VB1 → VB2:ampleness: II.2.6 concerns "any vector bundle E on XS", the bundles of VB1, and RS-20~3 relies on this edge. VB2:ampleness → VB2:classification: the proof of II.2.14 says "by Theorem II.2.6 some such d exists" (p. 70). VB1 → VB3:positive-basic-examples: the proof of II.2.2 (p. 60) uses the rewriting "as in the proof of Proposition II.2.5 below". The restructure notes of research/blueprint/packets/VectorBundlesAndIsocrystals--VB0.json and --VB3.json ask a link job to reverse all three edges. That would create 2-cycles unless the nodes are also split.
- II.2.5's mutual reference comes apart once it is split. Its φ − π^n part (pp. 62–63) uses no Lubin–Tate input. Its Banach–Colmez parts use II.2.2 ("BC(O(1)) ≅ Spd Fq[[x^{1/p^∞}]]") and II.2.3 ("By Proposition II.2.3, for any n ∈ Z, we get an exact sequence").
- Who uses degree and the HN formalism outside VB2:classification's descendants? No one. VB3:projectivized-properness (II.2.16) uses "Theorem II.2.6" and "Proposition II.2.5 (iii)" only (FS p. 72). BG0's text mentions no degree, slope or HN. VB4, VB3:general-BC and VS1 descend from VB2:classification.
- An incidental locator slip: VB3:positive-basic-examples says "FS II.2.1's Lubin–Tate calculation", but II.2.1 is v-descent ("is a v-sheaf of complexes", FS p. 57). The Lubin–Tate computation is II.2.2.
- Node-level check (decomposition links against stage reachability on stageEdges at origin/main). Before the change, 4 node links run against the stage order: the decomposition gap's three, plus fundamental-exact-sequence → schematic-curve. After the moves below, none do. The moves add no VB-internal stage edge. The only new VB edges are RF0:crystalline-end → VB1 and → VB3:positive-basic-examples from /18, which are acyclic.

**Fix, as edits.** The resulting order is: RF3 (chart maps on U) → VB1 (bundles, descent, isocrystal functor, H^0/H^1, the φ − π^n analysis) → VB3:positive-basic-examples (II.2.2–II.2.4, then the Banach–Colmez statements of II.2.5) and VB2:ampleness (II.2.6, global map, II.2.7) → VB2:classification (classical points, II.2.9, II.2.10–II.2.12, then II.2.13–II.2.15).
1. RF3 and the global map. Nothing beyond RS-20~3. When REV-RS-20~3 accepts it, the finding's steps (1) and (4) are in place.
2. content/campaign/VectorBundlesAndIsocrystals/README.md §VB1 and the atlas description.
   a. Delete "Build degree, rank, slope, saturated subbundles and semistability, including exact-sequence degree additivity and the behavior of torsion quotients."
   b. Replace "Compute O(n) sections and first cohomology with actual Frobenius maps and signs." with "Compute O(n) sections and first cohomology with actual Frobenius maps and signs. For n > 0, prove the phi − pi^n analysis of the proof of FS II.2.5: surjectivity of phi − pi^n : B_{R,[1,q]} → B_{R,[1,1]}, hence H^1(X_S, O(n)) = 0 for affinoid S, and the quasi-isomorphism with [B_{R,[1,∞]} → B_{R,[1,∞]}], so that H^0(X_S, O(n)) = B_{R,[1,∞]}^{phi = pi^n}. Use RF0:crystalline-end for these rings. The Banach–Colmez statements of II.2.5 are proved in VB3:positive-basic-examples, and degree, slope and the Harder–Narasimhan formalism in VB2:classification."
3. §VB2:ampleness and its atlas description.
   a. Delete "For S a geometric perfectoid point, prove regular noetherian dimension-one structure of the schematic curve, its local principal-ideal properties and the closed-point description under the source's hypotheses."
   b. Replace "Compare bundles and cohomology on X_S and the Proj curve built in RF3." with "Glue RF3's chart maps to the global map X_S → Proj P after global generation, construct the tautological twists, and compare bundles and cohomology on X_S and Proj P (FS II.2.6, II.2.7), as RS-20~3 assigns. The structure of X_C^alg at a geometric point (FS II.2.9) is proved in VB2:classification."
4. §VB2:classification and its atlas description. Insert before "Prove that every bundle at a geometric point is a direct sum": "At a geometric point S = Spa C, first prove the classical-point description (FS II.1.11, II.1.12, II.1.22). Then, from VB2:ampleness's map X_C → X_C^alg with GAGA and from the exact sequence 0 → O → O(1) → O_{C♯} → 0 of VB3:positive-basic-examples, prove that X_C^alg is a connected regular noetherian scheme of dimension one whose complement of any closed point is the spectrum of a principal ideal domain (FS II.2.9). Then prove Pic(X_C) = Z (II.2.10), and build degree, rank, slope, saturated subbundles and semistability, including exact-sequence degree additivity, the behaviour of torsion quotients and the Harder–Narasimhan formalism (II.2.11, II.2.12)."
5. §VB3:positive-basic-examples and its atlas description.
   a. Replace "Use FS II.2.1's Lubin–Tate calculation" with "Use FS II.2.2's Lubin–Tate calculation".
   b. After "Negative H^1 spaces have their separate construction.", add: "After FS II.2.2–II.2.4, prove the Banach–Colmez statements of FS II.2.5: (i) negative slopes, (ii) slope zero, the representability part of (iii), and (iv). Import VB1's phi − pi^n analysis and H^1 vanishing."
6. data/decompositions/VectorBundlesAndIsocrystals.json, together with the same nodes in research/blueprint/packets/VectorBundlesAndIsocrystals--VB0.json and --VB3.json and their readmes. Node ids stay, as references, following the RS-20~3 convention.
   a. Node VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism: set parentStageId to "VectorBundlesAndIsocrystals:VB2:classification".
   b. Node VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point: set parentStageId to "VectorBundlesAndIsocrystals:VB2:classification".
   c. Node VectorBundlesAndIsocrystals:VB1/cohomology-of-twists: narrow the statement to "For n > 0 and S affinoid, phi − pi^n : B_{R,[1,q]} → B_{R,[1,1]} is surjective, so H^1(X_S, O(n)) = 0, and [B_{R,[1,∞]} → B_{R,[1,∞]}] → [B_{R,[1,q]} → B_{R,[1,1]}] is a quasi-isomorphism, so H^0(X_S, O(n)) = B_{R,[1,∞]}^{phi = pi^n}." Keep proof steps 1–3 and the pp. 62–63 sources. Move everything else to the new node 6d.
   d. New node "VectorBundlesAndIsocrystals:VB3:positive-basic-examples/banach-colmez-spaces-of-twists" (kind theorem). It carries the former parts (i), (ii), the representability clause of (iii), and (iv) of VB1/cohomology-of-twists, with their hypotheses (including the unread ECD 23.13 and 24.2), proof steps 4–7 and the II.2.5 statement source.
   e. Links. Delete VB3:positive-basic-examples/lubin-tate-universal-cover → VB1/cohomology-of-twists. Add VB1/cohomology-of-twists → VB3:positive-basic-examples/lubin-tate-universal-cover, with the reason "FS p. 60: 'as in the proof of Proposition II.2.5 below, one can rewrite H0(XS, OXS(1)) as BR,[1,∞]^{φ=π}'". Add lubin-tate-universal-cover → banach-colmez-spaces-of-twists, fundamental-exact-sequence → banach-colmez-spaces-of-twists and VB1/cohomology-of-twists → banach-colmez-spaces-of-twists. Change the source of VB1/cohomology-of-twists → VB2:classification/key-extension-lemma to banach-colmez-spaces-of-twists, because that link uses part (i). Keep VB1/cohomology-of-twists → VB2:classification/dieudonne-manin-classification-of-bundles for its step (a), and add banach-colmez-spaces-of-twists → dieudonne-manin-classification-of-bundles for its steps (b) and (c), which use part (ii).
   f. The gap "Atlas substage order is the reverse of the source's proof order …": replace the paragraph from "CONSEQUENCE AND DECISION NEEDED." onwards with "RESOLVED by option (ii), re-parenting and splitting nodes (FIX-RT-AREA-padic-1 /21). Degree/HN and II.2.9 move to VB2:classification, after VB2:ampleness's GAGA. II.2.5 is split: the phi − pi^n part stays in VB1 and the Banach–Colmez part follows II.2.2–II.2.4 in VB3:positive-basic-examples. Option (iii), reversing the stage edges, is rejected: each of the three edges is also source-supported (II.2.6 uses VB1's bundles; II.2.14 uses II.2.6; II.2.2 uses the II.2.5 rewriting), so reversal gives 2-cycles. All node links now run forward on existing stage edges."
   g. In the two packets, mark the `restructure` entries of kind "reorder-links" as superseded by 6f.
7. Stage edges: none added or removed inside VectorBundlesAndIsocrystals. The only new VB edges are those of /18.

**Not changed / open.**
- The not-yet-reviewed PAPER-FARGUES-SCHOLZE-21 items c2a-prop-II.2.5-ii-slope-zero, c2a-prop-II.2.5-iii-positive and c2a-prop-II.2.5-iv-perfectoid-ball list VB3:general-BC among their planned stages. Their reviewer should point the Banach–Colmez parts to VB3:positive-basic-examples.
- The six-functor inputs of II.2.5 (i) and (iii) (ECD 23.13, 24.2) are not ancestors of VB3:positive-basic-examples. This is the sibling gap noted under /17. The VB blueprint job should either add those inputs or move the smoothness clauses later.
- This arrangement answers the verifier's request to evaluate the split on its merits. Its design choices (steps (2), (3) and (5) placed in the existing stages VB1, VB3:positive-basic-examples and VB2:classification) still need the review of the VB blueprint job or the next RS-20 review.

## /22 (medium, duplicate): The Hodge-type Hodge–Tate period map is planned in both T2 and S3

**The finding and the verdict.** T2 and S3 both plan the Hodge-type period map and its main properties: the map on the tower, Hecke equivariance, the Levi-torsor pullback, the elliptic 𝒪(1) formula and the Hilbert restriction-of-scalars formula. The briefs name different owners, and T2 builds a map "on a tower" with no edge from the tower's construction. The verifier confirmed this and applied "the same refinement as finding /4": "S3's dependencies include T2, so this is S3 importing T2 and re-planning its result rather than two independent owners, and the fix should be framed as 'S3 consumes T2'."

The finding's own fix goes the other way: owner S3, with T2 narrowed to finite level. That fix is impossible. T4 plans the Hilbert period-map inclusions and sits upstream of S3, and the edge S3 → T4 that T4 would then need closes a cycle. So I follow the verifier. T2 owns the map on the open tower with its properties. S3 consumes it and keeps what needs the perfectoid space or the compactification.

**Checked.**
- The two stage texts:
  - T2, lines 57–61: "Construct the universal flag-valued map on a tower where the Tate module is trivialized. The map is constructed before asserting perfectoid representability of that tower; S identifies the representing space. Check the elliptic `𝒪(1)` formula and the Hilbert restriction-of-scalars formula".
  - S3, PerfectoidShimuraVarieties README lines 69–71: "Construct the Hodge–Tate period map on the open perfectoid tower. Prove its equivariance, functoriality under datum morphisms, and pullback identification of the Levi torsor …" and "Identify the elliptic map with the quotient-line construction and `π_HT*𝒪(1)=ω`. Identify the Hilbert map with the restriction-of-scalars flag variety".
  - Atlas edges: T2 → S2, T2 → S3, T2 → IG.3.
- Two stages use the map before S1–S3 exist:
  - T4: "Define the balls about the integral points of the restriction-of-scalars flag variety and prove the quantitative period-map inclusions", and "Prove the canonical and anticanonical image inclusions with those bounds" (BHW Proposition 5.18).
  - T5: "Prove the comparison of this torsor with the Hodge–Tate trivialization on the anticanonical tower."
  - Atlas paths: T2 → T3 → T4 → T5, and T4 → S1 → S2 → S3.
- Cycle check (Python, stageEdges). Adding S3 → T4 gives the cycle T4 → S1 → S2 → S3 → T4. So S3 cannot supply T4, and the owner of the open-tower map must lie upstream of T4. T2 does.
- RS-05 (accepted), layers[S3]: "Retain Hodge-type perfectoid/period-map theorem, compactifications, Hecke equivariance and automorphic bundle pullback with exact hypotheses." RS-05's family contains no HodgeTateAndCanonicalSubgroups roadmap, and its report lists no T2 pair. Under this fix, S3 still keeps the perfectoid period-map theorem and the compactifications. It proves equivariance and the bundle pullback for the compactified extension, and imports the open-tower versions from T2. This is the verifier's "S3 consumes T2".
- The tower edge:
  - No PerfectoidShimuraVarieties stage is an ancestor of T2 (checked).
  - S0 plans "Construct the p-level inverse systems … Form the inverse limits as v-sheaves/diamonds".
  - The new edge S0 → T2 is acyclic: there is no path from T2 to S0, on stageEdges or with the accepted RS links.
  - Mutual roadmap-level dependence is common in the atlas (68 roadmap pairs have stage edges both ways), so HodgeTate ↔ PerfectoidShimuraVarieties is not an exception.
- Consumers of S3: S5, TC.1, O8 and IG.3. T2 is already an ancestor of each of them, and T2 → IG.3 is a direct edge. Under §15, the direct links T2 → S5, T2 → TC.1 and T2 → O8 are acyclic (checked).
- Briefs:
  - BCGP-25 route 22: "Hodge–Tate period maps (HodgeTateAndCanonicalSubgroups)".
  - PAN-26 route 1: "PerfectoidShimuraVarieties and HodgeTateAndCanonicalSubgroups for the perfectoid tower, the Hodge-Tate period map and the Hodge-Tate exact sequence".
  - BP-26 route 1: "Shimura towers and perfectoid representability (PerfectoidShimuraVarieties) S1, S3", used for π_{HT,K_{p,n}} on S^tor.
  - BCGP-21 route 2: "Scholze's 𝔛^{*−HT} (PerfectoidShimuraVarieties S1, S3)".
  - The last two import the compactified map, which S3 keeps.
- TorsionCohomologyInfrastructure's source row "§3.3; §4.1 | PerfectoidShimuraVarieties; AutomorphicBundles | Hodge–Tate period map, equivariance and pullback of automorphic bundles" is Scholze's compactified map. S3 keeps it, and TC.1 → S3 stays.

**Fix, as edits.**
1. Owners entry:
   {"target": "Hodge-type Hodge–Tate period map on the open p-level tower (a map from the limit v-sheaf of PerfectoidShimuraVarieties S0, constructed before perfectoid representability): its G(Q_p)- and prime-to-p Hecke equivariance, the pullback of the tautological Levi torsor to the Hodge–Tate and de Rham Levi torsors and their automorphic bundles, the elliptic formula π_HT^*𝒪(1)=ω, and the Hilbert Res_{O_F/Z} flag-variety identification without assuming F splits", "owner": "HodgeTateAndCanonicalSubgroups:T2", "formerly": ["PerfectoidShimuraVarieties:S3"]}
2. Layer entry, for the record, in RS format:
   {"PerfectoidShimuraVarieties:S3": {"action": "narrow", "keeps": "The perfectoid incarnation of T2's open-tower map on the tower S2 represents; functoriality under datum morphisms through S2's Hodge-type embeddings; the extension to the compactifications in the source's Hodge-type form, with its equivariance and automorphic-bundle pullback; persistence of the elliptic and Hilbert identifications on the compactified towers, and the Hilbert factors after an explicit splitting extension; the compatible functions used by O.", "suppliedBy": ["HodgeTateAndCanonicalSubgroups:T2"], "reason": "RT-AREA-padic-1/22: T4 and T5 use the open-tower map upstream of S1–S3, so it must be T2's; S3 → T4 would close T4 → S1 → S2 → S3 → T4."}}
3. content/campaign/HodgeTateAndCanonicalSubgroups/README.md, T2, line 57.
   - Replace: `**Dependencies:** T0–T1, A4, B0–B2.`
   - With: `**Dependencies:** T0–T1, A4, B0–B2, and PerfectoidShimuraVarieties S0 for the p-level tower and its limit v-sheaf.`
4. Same file, T2, line 61.
   - Replace: "Construct the universal flag-valued map on a tower where the Tate module is trivialized. The map is constructed before asserting perfectoid representability of that tower; S identifies the representing space. Check the elliptic `𝒪(1)` formula and the Hilbert restriction-of-scalars formula without assuming that F splits in the coefficient field."
   - With: "Construct the universal flag-valued map on the p-level tower of PerfectoidShimuraVarieties S0, as a map from its limit v-sheaf, where the Tate module is trivialized. Prove its equivariance for G(Q_p) and for prime-to-p Hecke correspondences. Identify the pullback of the tautological Levi torsor with the Hodge–Tate Levi torsor, hence with the de Rham torsor and its associated automorphic bundles. The map is constructed before asserting perfectoid representability of that tower; PerfectoidShimuraVarieties S3 identifies the representing perfectoid space and extends the map to compactifications. Prove the elliptic formula `π_HT*𝒪(1)=ω` and the Hilbert restriction-of-scalars formula without assuming that F splits in the coefficient field. This stage owns the map on the open tower; T4 and T5 use it before S1–S3."
5. content/campaign/PerfectoidShimuraVarieties/README.md, S3, line 69.
   - Replace: "Construct the Hodge–Tate period map on the open perfectoid tower. Prove its equivariance, functoriality under datum morphisms, and pullback identification of the Levi torsor and its associated algebraic automorphic bundles. Construct the extension to the compactification in the precise Hodge-type form provided by the source, distinguishing auxiliary normalized compactifications from the canonical minimal one."
   - With: "Import the Hodge–Tate period map on the open tower, with its equivariance and its Levi-torsor and automorphic-bundle pullback, from HodgeTateAndCanonicalSubgroups T2; do not construct it again. Prove that on the open perfectoid tower of S2 it is a morphism of adic spaces from the representing perfectoid space. Prove functoriality under datum morphisms through S2's Hodge-type embeddings. Construct the extension to the compactification in the precise Hodge-type form provided by the source, distinguishing auxiliary normalized compactifications from the canonical minimal one, and prove equivariance and the automorphic-bundle pullback for this extension."
6. Same file, S3, line 71.
   - Replace: "Identify the elliptic map with the quotient-line construction and `π_HT*𝒪(1)=ω`. Identify the Hilbert map with the restriction-of-scalars flag variety, and its factors after an explicitly stated splitting extension."
   - With: "Import T2's elliptic formula `π_HT*𝒪(1)=ω` and its Hilbert restriction-of-scalars identification, and prove that they persist on the compactified perfectoid towers. Record the Hilbert factors after an explicitly stated splitting extension."
   - The sentence after it ("This theorem supplies the compatible functions used by O; …") stays.
7. New stage edges in data/atlas.json stageEdges:
   - {"source": "PerfectoidShimuraVarieties:S0", "target": "HodgeTateAndCanonicalSubgroups:T2"}. No path from T2 back to S0; checked on stageEdges at origin/main and with the accepted RS links.
   - The §15 forwarding links from the new supplier to S3's other consumers: {"source": "HodgeTateAndCanonicalSubgroups:T2", "target": "PerfectoidShimuraVarieties:S5"}, {"source": "HodgeTateAndCanonicalSubgroups:T2", "target": "TorsionCohomologyInfrastructure:TC.1"} and {"source": "HodgeTateAndCanonicalSubgroups:T2", "target": "OverconvergentAutomorphicForms:O8"}. These are already transitive, so they are acyclic.
   - HodgeTateAndCanonicalSubgroups's roadmap "prerequisites" gains PerfectoidShimuraVarieties.
8. research/blueprint/papers/PAPER-BOXER-CALEGARI-GEE-PILLONI-25.result.json, routes[21] (route 22) "brief", and the same brief in PAPER-BOXER-CALEGARI-GEE-PILLONI-25.md line 191.
   - Replace: "Hodge–Tate period maps (HodgeTateAndCanonicalSubgroups)"
   - With: "Hodge–Tate period maps (HodgeTateAndCanonicalSubgroups T2 on the open Hodge-type tower; PerfectoidShimuraVarieties S3 for their extension to the compactifications and S6 for the general toroidal tower diamond)"
9. research/blueprint/papers/PAPER-PAN-26.result.json, routes[0] (route 1) "brief".
   - Replace: "PerfectoidShimuraVarieties and HodgeTateAndCanonicalSubgroups for the perfectoid tower, the Hodge-Tate period map and the Hodge-Tate exact sequence"
   - With: "PerfectoidShimuraVarieties S3 and S5 for the perfectoid modular tower and the extension of the Hodge-Tate period map to its compactification, and HodgeTateAndCanonicalSubgroups T2 for the Hodge-Tate period map on the open tower, π_HT^*𝒪(1)=ω and the Hodge-Tate exact sequence"
   - The phrase does not occur in PAPER-PAN-26.md.

**Not changed / open.**
- The BP-26 route 1 and BCGP-21 route 2 briefs already import the compactified map from S1/S3, which S3 keeps, so they need no change. The /26 edits change other clauses of these two briefs.
- T0's "finite-level Hodge–Tate map using Cartier duality" is a different object: the map of p-divisible groups. BCGP-21 route 2 imports it as "(T0, T5)". It is unchanged.
- I did not re-check BHW Proposition 5.18 itself. The dependence of T4 on the period map is taken from T4's text.

## /23 (medium, error): BCGP-25 route 23 sends the four Theorem 4.4.1 comparisons to stages that plan none of them

**The finding and the verdict.** PAPER-BOXER-CALEGARI-GEE-PILLONI-25 route 23 sends items 4.4.1-usual, 4.4.1-cusp, 4.4.1-analytic-usual and 4.4.1-analytic-cusp to T4, T5 and T6. None of those stages plans completed cohomology or a primitive comparison. The verifier checked each stage: "none of T4, T5 or T6 mentions completed cohomology or a primitive comparison anywhere in its description". I apply the finding's fix with one change of form. Route 23 is re-pointed in place rather than emptied: check_paper.py rejects a route with no items ("names the items it takes"), and deleting the route would renumber routes 24–35 in the review.

**Checked.**
- Route 23 (routes[22]) holds exactly these four items. Its stages are T4, T5 and T6, and its reason is "Own period-map and logarithmic Hodge–Tate comparison inputs; the higher Coleman/Sen application is a separate consumer." The review of route 23 says "the items routed here are the paper's uses of that layer rather than new theory".
- BCGP-25, arXiv:2502.20645v1, p. 72, read in a local copy of the arXiv text (…/scratch-archive/2026-09-27/…/cit/2502.20645v1.txt):
  - Theorem 4.4.1 displays the four identities.
  - Its proof: "The first part is immediate from [DLLZ23, Thm. 6.2.1], by passing to the limit as in the proof of [Sch15, Thm. 4.2.1]. The second part is [RC22, Thm. 6.2.6]."
  - [DLLZ23] is "Logarithmic adic spaces: some foundational results", and [RC22] is Rodríguez Camargo, "Locally analytic completed cohomology".
  - Remark 4.4.2: "the statements regarding completed cohomology (before taking locally analytic vectors) are a consequence of Scholze's primitive comparison theorem; see e.g. [Sch15, Thm. 4.2.1]".
- The owner of the Scholze 2015 comparison:
  - Scholze 2015, Theorem 4.2.1 (local copy scholze-torsion.txt): "There is a natural isomorphism of almost-O_C-modules H̃^i_{c,K^p}(Z/p^nZ) ⊗ O_C^a/p^n ≅ H^i(X^*_{K^p}, I^{+a}/p^n)".
  - TorsionCohomologyInfrastructure's source table gives §4.2 to "CompletedCohomologyPartII:CC.1/CC.2/CC.4/CC.8; TC.2".
  - TC.2 plans "the cohomological comparison diagram between finite-level torsion classes, completed cohomology, Čech cohomology on perfectoid charts".
  - No CompletedCohomologyPartII stage (CC.0–CC.8) mentions perfectoid charts, O^+ or almost mathematics.
- Route 22 (part-ii HigherHidaAndColemanTheory, accepted) holds 4.5-VB ("Derived Hodge–Tate coefficient functor") and the Sen items (4.5.20-9, 4.5.23, 4.7.1-Sen, 4.7.2-Sen, …). The analytic items are stated through the same VB_Σ(F).
- check_paper.py accepts the new route 23: a source route needs items and layers of its roadmap, TorsionCohomologyInfrastructure is a proposed campaign roadmap, and TC.2 is one of its layers.
- The edges P8:primitive → TC.2 and T6:log-primitive → TC.2 come from /24 and are acyclic.

**Fix, as edits.**
1. PAPER-BOXER-CALEGARI-GEE-PILLONI-25.result.json, routes[22] (route 23). Replace the whole object with:
   {"route": "source", "roadmap": "TorsionCohomologyInfrastructure", "stages": ["TorsionCohomologyInfrastructure:TC.2"], "reason": "TC.2 owns the comparison between completed cohomology and the cohomology of the integral structure sheaf on perfectoid towers (Scholze 2015 Theorem 4.2.1; TC source row §4.2). The first part of Theorem 4.4.1 is its Hodge-type toroidal rational form: 'immediate from [DLLZ23, Thm. 6.2.1], by passing to the limit as in the proof of [Sch15, Thm. 4.2.1]'. TC.2 imports the logarithmic primitive comparison from HodgeTateAndCanonicalSubgroups T6:log-primitive. Re-pointed from T4, T5, T6 by FIX-RT-AREA-padic-1 (RT-AREA-padic-1/23); the locally analytic part moved to route 22.", "items": ["PAPER-BOXER-CALEGARI-GEE-PILLONI-25/4.4.1-usual", "PAPER-BOXER-CALEGARI-GEE-PILLONI-25/4.4.1-cusp"]}
2. Same file, routes[21] (route 22).
   - Append to "items": "PAPER-BOXER-CALEGARI-GEE-PILLONI-25/4.4.1-analytic-usual" and "PAPER-BOXER-CALEGARI-GEE-PILLONI-25/4.4.1-analytic-cusp".
   - Append to "brief" (and to the same brief in the .md, line 191): " Theorem 4.4.1's locally analytic part (items 4.4.1-analytic-usual and 4.4.1-analytic-cusp; the proof cites [RC22, Thm. 6.2.6]) is planned here, next to VB_Σ (4.5-VB) and the Sen items. It imports the non-analytic part (4.4.1-usual, 4.4.1-cusp) from TorsionCohomologyInfrastructure TC.2 and the logarithmic primitive comparison (Diao–Lan–Liu–Zhu Theorem 6.2.1) from HodgeTateAndCanonicalSubgroups T6:log-primitive."
3. PAPER-BOXER-CALEGARI-GEE-PILLONI-25.review.json.
   - Route 23: replace the reason with "Re-pointed by FIX-RT-AREA-padic-1 (RT-AREA-padic-1/23). T4, T5 and T6 plan none of the four Theorem 4.4.1 comparisons. The two non-analytic ones go to TC.2, which owns the completed-cohomology comparison on perfectoid towers; the two locally analytic ones move to route 22." Keep the verdict "accept". A reviewer should re-read it.
   - Route 22: append " Two locally analytic items of Theorem 4.4.1 added by FIX-RT-AREA-padic-1 (RT-AREA-padic-1/23)."
4. PAPER-BOXER-CALEGARI-GEE-PILLONI-25.md, line 125.
   - Replace: "| HodgeTateAndCanonicalSubgroups | T4, T5, T6 | Own period-map and logarithmic Hodge–Tate comparison inputs; the higher Coleman/Sen application is a separate consumer. |"
   - With: "| TorsionCohomologyInfrastructure | TC.2 | Hodge-type toroidal rational form of the completed-cohomology comparison (Theorem 4.4.1, first part), from the logarithmic primitive comparison of HodgeTateAndCanonicalSubgroups T6:log-primitive. The locally analytic part is in the HigherHidaAndColemanTheory route. |"
5. content/campaign/TorsionCohomologyInfrastructure/README.md, TC.2. Append to the paragraph that ends "there is no requirement that CC be constructed from this completed comparison." (line 42):
   "TC.2 also proves the Hodge-type toroidal rational form used by Boxer–Calegari–Gee–Pilloni 2025, Theorem 4.4.1 (first part). For a Hodge-type datum with neat tame level K^p and compatible toroidal cone decompositions, RΓ(Sh^tor_{K^p}, Q_p) ⊗ C_p ≅ RΓ_an(Sh^tor_{K^p}, 𝒪) and RΓ_c(Sh_{K^p}, Q_p) ⊗ C_p ≅ RΓ_an(Sh^tor_{K^p}, I), with I the boundary ideal. The proof passes to the limit over p-levels as in the torsion comparison above, from the logarithmic primitive comparison of HodgeTateAndCanonicalSubgroups T6:log-primitive; Scholze's primitive comparison comes from PadicHodgeTheory P8:primitive. Invert p only after the integral almost comparison."

**Not changed / open.**
- The four items keep status "missing". A source route may carry missing items, and the TC.2 text in edit 5 now plans the first two.
- BCGP identifies completed cohomology with pro-Kummer-étale cohomology of Sh^tor "Using comparison theorems in [Hub96, page 30] and [RC22, Cor. 6.1.7]". The G(Q_p)-action also changes the cone data. Both are for the TC.2 blueprint. [RC22] is not an atlas source yet, so the maintainer may add it to a paper batch.
- The Hodge-type infinite-level toroidal object that TC.2 needs comes through TC.1 → S3 (S3's compactification extension). I did not check that S3's text covers toroidal rather than only minimal compactifications at infinite level.

## /24 (medium, missing): Scholze's primitive comparison has no stage that plans it, and its logarithmic version is planned nowhere

**The finding and the verdict.** Scholze's primitive comparison theorem (Scholze 2013, Theorem 5.1, with Theorem 4.9 and Lemma 4.12) reaches PadicHodgeTheory:P8 only through accepted source routes. No stage text plans it, and two decompositions record it as ownerless. P8 cannot feed CP.3, because CP.3 is an ancestor of P8. The logarithmic version (Diao–Lan–Liu–Zhu, Theorem 6.2.1), which BCGP-25 Theorem 4.4.1 uses, is planned nowhere.

The verifier confirmed this. It noted "Not verified by me: the Scholze 2013 theorem numbering (Thm 5.1, Thm 4.9, Lemma 4.12) and the logarithmic variant's content." I verified both in local copies of the papers. I apply the finding's fix, with these corrections:
- (a) P8:primitive must come after P8:local-rational, not before, because Scholze's §5 uses the toric charts of his Lemma 5.2, which P8:local-rational plans.
- (b) AdicSpacesPartII R3 is not an ancestor of P8:local-rational, contrary to the finding.
- (c) AI.4 and T6:comparison are also consumers.
- (d) PAPER-SCHOLZE-13 route 1 is a third accepted route to P8, and the PadicHodgeTheory P7 packet proposed a different owner (CP.3:primitive). I keep P8:primitive and say why.

**Checked.**
- Accepted routes to P8:
  - PAPER-SCHOLZE-13 route 1 (stages P8, P8:local-rational). Its reason: "What remains missing is the primitive comparison and finiteness theorem with its proof (Theorems 1.1, 1.3 and 5.1, Lemmas 5.3–5.9, Corollary 5.12, Lemma 4.12) … Accepted extractions route the primitive comparison and finiteness to P8".
  - PAPER-ZAVYALOV-25 route 7, item /116 "Scholze's primitive comparison theorem and finiteness". Its reason: "The paper consumes three more theorems of the same paper of Scholze: the primitive comparison, …".
  - PAPER-BHATT-MORROW-SCHOLZE-18 route 14, item /085 "Theorem 5.1 (Scholze): finiteness of p-adic étale cohomology of proper smooth rigid spaces". This is BMS1's numbering of Scholze's Theorem 1.1.
  - PAPER-HEUER-25 route 1 has no review file.
- Where the atlas records it as ownerless:
  - P8's text never mentions the primitive comparison.
  - The P7 packet (research/blueprint/packets/PadicHodgeTheory--P7.json) has the gap "No atlas owner for Scholze's primitive comparison theorem (Sch13 §5)".
  - The same packet has a request to CP.3 whose part (b) is "The primitive comparison theorem Sch13 Theorem 5.1 …", and coverage[P8].remaining says "The primitive comparison theorem (Sch13 Theorem 5.1, Corollary 5.11) has no owner stage".
  - Its restructure entry "Owner of Scholze's primitive comparison theorem (Sch13 §5)" proposes "a new early CohomologyComparisons sub-stage 'CP.3:primitive' … with consumers CP.3, AI.4 and PadicHodgeTheory P8".
  - data/decompositions/PadicHodgeTheory.json, coverage[P8:local-rational].remaining: "Theorem 4.9 … and Lemma 4.12 … belong to the primitive comparison theorem (Theorem 5.1), which is outside this sub-stage; no owner stage was identified."
- The CohomologyComparisons gap:
  - It appears in the packet and in data/decompositions: "Scholze's de Rham comparison (Theorem 5.1, [58]) has no verified supplier in the CP graph".
  - Its "Theorem 5.1" is BMS1's numbering: the finiteness and de Rham comparison of [58] = Scholze 2013.
  - It ends: "Next action: decide whether CP.3 absorbs [58, §8] (with P8:local-rational supplying the Poincaré lemma) or a separate upstream owner is created, and check acyclicity."
- Theorem numbers, from the local copy SS_ScholzePadicHodge.txt and the SCHOLZE-13 extraction of the published version:
  - Theorem 1.1 (finiteness), Theorem 4.9 (affinoid K(π,1)), Lemma 4.12, Theorem 5.1 (finiteness, primitive comparison and vanishing above 2 dim X) and Theorem 8.4 agree in both.
  - The relative form is Corollary 5.11 in the local copy and in the P7 packet, and Corollary 5.12 in the extraction.
  - The §5 lemma numbers also differ between versions. The stage text below uses the extraction's numbers.
- Diao–Lan–Liu–Zhu, "Logarithmic adic spaces: some foundational results", arXiv:1912.09836v2, local copy SS_DLLZ_LogAdic.txt:
  - §6.2 "Primitive comparison theorem … generalizing the strategy in [Sch13a, Sec. 5]".
  - Theorem 6.2.1 (quoted in the stage text below), Corollary 6.2.3, Proposition 6.1.1, Lemma 6.2.4 and Corollary 6.3.4.
- Diao–Lan–Liu–Zhu, "Logarithmic Riemann–Hilbert correspondences", arXiv:1803.05786v4, local copy, Lemma 3.6.1: "The proof is the same as [Sch13, Thm. 8.4], with the input [Sch13, Thm. 5.1] there replaced with [DLLZ, Thm. 6.2.1]." So T6:comparison, which owns logarithmic Riemann–Hilbert, consumes the logarithmic primitive comparison.
- Consumers:
  - IG.3: "the precise primitive comparison".
  - AI.4, through PAPER-BHATT-MORROW-SCHOLZE-18 route 5 (accepted), item /092 "Theorem 5.7: the primitive comparison with A_inf-coefficients". Its note: "Cited from the proof of Scholze (2013), Theorem 8.4 … It feeds the étale specializations …, which AI.4 plans".
  - TC.2 and BCGP-25 Theorem 4.4.1 (see /23).
  - The P8 nodes P8/etale-to-bdr-plus-comparison-for-lisse-sheaves and P8/relative-bdr-plus-local-system-comparison.
- Why P8:local-rational comes first:
  - Lemma 5.2 (toric charts) is planned at P8:local-rational, in the node P8:local-rational/toric-charts-for-smooth-spaces. The SCHOLZE-13 item s5-lem5.2 has status "planned" at P8:local-rational.
  - The P7 packet says "Sch13 Lemma 5.2 (toric charts) stays in P8:local-rational".
  - The SCHOLZE-13 note on Lemma 5.3 says "then Lemma 5.2", so §5 uses it.
  - P8:local-rational never uses §5. Its text says it constructs "only the rational relative period sheaves, local acyclicity, strictness and local Poincaré lemma".
  - The finding's direction (P8:primitive → P8:local-rational), together with this input, would be a 2-cycle (checked).
- Inputs of P8:primitive:
  - AI.3: SCHOLZE-13 route 5 (accepted) sends Lemmas 3.18, 4.2(iii), 4.10, 5.5 and 5.11 there.
  - PerfectoidSpaces P0: route 2 says "§2's rank-one almost-module theory … belongs in P0"; §5 uses Lemma 2.12.
  - PerfectoidSpaces P3 (almost purity).
  - PerfectoidSpaces P7: the Theorem 4.9 node cites "PerfectoidSpaces P7/tilde-limits-and-etale-topos-comparison".
  - AdicEtaleGeometry A1–A2 and ClassicalAdicEtaleCohomology H0.
  - All of these except P7 are ancestors of P8:local-rational. P7 and R3 are not; R3 is an ancestor of CP.3.
- Ancestry and cycles:
  - CP.3 → P8 is a direct edge, so P8 → CP.3 would close a cycle (checked).
  - P8 is an ancestor of TC.2, IG.3 and T6:comparison, but not of CP.3.
  - The accepted RS-01 link CP.3 → CP.2, plus the atlas edge CP.2 → CP.5, carry CP.3's comparison to the CP.2 and CP.5 nodes named in the CP gap.
- Acyclicity: all 18 edges in edit 2 together add no cycle on stageEdges at origin/main, nor with the accepted RS links, nor together with the new edges of /22 and /26.

**Fix, as edits.**
1. content/campaign/PadicHodgeTheory/README.md. Insert a new sub-stage after the P8:local-rational section, before "### Corrected structural period-sheaf construction":

   ```markdown
   <a id="p8-primitive"></a>
   <a id="stage-P8:primitive"></a>

   ### P8:primitive. Primitive comparison and finiteness

   **Dependencies:** P8:local-rational (the local toric charts of Scholze's Lemma 5.2 and the pro-étale structure sheaves); AInfCohomology AI.3 (Ô_X^+, its tilt, and Scholze's Lemmas 3.18, 4.10, 5.5 and 5.11 in his generality); PerfectoidSpaces P0 (almost mathematics, including Scholze's §2 and Lemma 2.12), P3 (almost purity and étale tilting) and P7 (tilde-limits and their étale topoi); AdicEtaleGeometry A1–A2; ClassicalAdicEtaleCohomology H0; AdicSpacesPartII R3. No CohomologyComparisons CP.3/CP.4 input: CP.3 consumes this stage.

   Let K be an algebraically closed complete extension of Q_p with an open and bounded valuation subring K⁺, let X be a proper smooth adic space over Spa(K, K⁺), and let 𝕃 be an F_p-local system on X_ét. Prove Scholze's primitive comparison theorem (Scholze 2013, Theorem 5.1). H^i(X_ét, 𝕃) is a finite-dimensional F_p-vector space. There is an isomorphism of almost K⁺-modules H^i(X_ét, 𝕃) ⊗ K^{+a}/p ≅ H^i(X_ét, 𝕃 ⊗ O_X^{+a}/p). And H^i(X_ét, 𝕃) = 0 for i > 2 dim X.

   Prove the inputs in the source's order (numbering of the published version, as in PAPER-SCHOLZE-13):
   - connected affinoid noetherian adic spaces are K(π,1) for p-torsion coefficients (Theorem 4.9);
   - on affinoid perfectoid U, H^i(U, 𝕃 ⊗ O_X^+/p) is almost zero for i > 0 and almost finitely generated projective for i = 0, compatibly with base change (Lemma 4.12);
   - nested affinoid covers, images in spectral sequences, the toric computation, completely continuous maps, and almost finiteness and vanishing (Lemmas 5.3–5.9);
   - the tilted-sheaf and Artin–Schreier argument of the proof of Theorem 5.1.

   Prove the relative form for a proper smooth morphism f: X → Y of locally noetherian adic spaces over Spa(Q_p, Z_p): (R^i f_{ét*}𝕃) ⊗ O_Y^{+a}/p ≅ R^i f_{ét*}(𝕃 ⊗ O_X^{+a}/p), with the almost setting relative to O_Y^+. This is Corollary 5.12 in the published version; the arXiv version and the P7 packet number it Corollary 5.11. Deduce the finiteness of H^i_ét(X_C, Z_p) for proper smooth rigid X over a discretely valued K (Theorem 1.1, recalled as BMS1 Theorem 5.1).

   This stage is the one owner of these statements. It exports them to:
   - CohomologyComparisons CP.3 (the constant-coefficient de Rham comparison);
   - AInfCohomology AI.4 (BMS1 Theorem 5.7, the A_inf form);
   - the proper comparison suffix of P8 (Theorems 8.4 and 8.8 with lisse coefficients);
   - HodgeTateAndCanonicalSubgroups T6:log-primitive;
   - TorsionCohomologyInfrastructure TC.2;
   - IgusaVarietiesAndTorsionConcentration IG.3.

   Scholze's §§6–8 period-sheaf comparisons are not proved here.
   ```
2. New stage edges in data/atlas.json stageEdges (the build creates the stage PadicHodgeTheory:P8:primitive, owner PadicHodgeTheory, key "P8:primitive", from the anchor):
   - in: P8:local-rational, AInfCohomology:AI.3, PerfectoidSpaces:P0, PerfectoidSpaces:P3, PerfectoidSpaces:P7, AdicEtaleGeometry:A1, AdicEtaleGeometry:A2, ClassicalAdicEtaleCohomology:H0, AdicSpacesPartII:R3 → PadicHodgeTheory:P8:primitive;
   - out: PadicHodgeTheory:P8:primitive → PadicHodgeTheory:P8, CohomologyComparisons:CP.3, AInfCohomology:AI.4, TorsionCohomologyInfrastructure:TC.2, IgusaVarietiesAndTorsionConcentration:IG.3, HodgeTateAndCanonicalSubgroups:T6:log-primitive;
   - HodgeTateAndCanonicalSubgroups:T6:log-sites → HodgeTateAndCanonicalSubgroups:T6:log-primitive;
   - HodgeTateAndCanonicalSubgroups:T6:log-primitive → HodgeTateAndCanonicalSubgroups:T6:comparison and TorsionCohomologyInfrastructure:TC.2.
   - Checked: no cycle (see Checked).
3. content/campaign/HodgeTateAndCanonicalSubgroups/README.md. Insert a new sub-stage after the T6:log-sites section, before `<a id="t6-comparison"></a>`:

   ```markdown
   <a id="t6-log-primitive"></a>
   <a id="stage-T6:log-primitive"></a>

   #### T6:log-primitive. Logarithmic primitive comparison

   **Dependencies:** T6:log-sites (Kummer-étale and pro-Kummer-étale sites, log affinoid perfectoid objects over toric charts, completed structure sheaves); PadicHodgeTheory P8:primitive. No T1, T2, P8 period-sheaf or CohomologyComparisons CP.3 input.

   Let (k, k⁺) be an affinoid field with k algebraically closed of characteristic zero, let X be a proper log smooth fs log adic space over Spa(k, k⁺), and let 𝕃 be an F_p-local system on X_két. Prove the primitive comparison theorem of Diao–Lan–Liu–Zhu (Logarithmic adic spaces, Theorem 6.2.1):
   - H^i(X_két, 𝕃 ⊗ O_X^+/p) is almost finitely generated over k⁺, and almost zero for i ≫ 0;
   - there is a canonical almost isomorphism H^i(X_két, 𝕃) ⊗ k⁺/p → H^i(X_két, 𝕃 ⊗ O_X^+/p);
   - hence H^i(X_két, 𝕃) is finite-dimensional and vanishes for i ≫ 0, and for i > 2 dim X when the log structure comes from a normal crossings divisor.

   Prove its local inputs on toric charts (Proposition 6.1.1) and the nested covers (Lemma 6.2.4), following Scholze's §5 as imported from P8:primitive. Deduce the finiteness for a smooth rigid variety that is Zariski open in a proper one (Corollary 6.2.3). Deduce the comparison H^i(U_ét, L) ≅ H^i(X_két, L) ≅ H^i(X_prokét, L̂) of finite Z_p-modules (Corollary 6.3.4).

   Export these to:
   - T6:comparison (the logarithmic comparison of cohomology, Logarithmic Riemann–Hilbert Lemma 3.6.1);
   - TorsionCohomologyInfrastructure TC.2;
   - the HigherHidaAndColemanTheory design (Boxer–Calegari–Gee–Pilloni 2025 Theorem 4.4.1).
   ```
4. Same file.
   - Line 99: replace "T6 has an early site-construction prefix and a later period-comparison suffix. The prefix does not depend on T1, P8, or any geometric p-adic comparison theorem." with "T6 has an early site-construction prefix, a logarithmic primitive-comparison stage and a later period-comparison suffix. The prefix does not depend on T1, P8, or any geometric p-adic comparison theorem. The middle stage imports only PadicHodgeTheory P8:primitive."
   - Line 117: replace `**Dependencies:** T6:log-sites, T1–T2,` with `**Dependencies:** T6:log-sites, T6:log-primitive, T1–T2,`. The rest of the line is unchanged.
   - Line 130: replace `**Stages:** T0, T2, T3, T4, T5, T6:log-sites, T6:comparison.` with `**Stages:** T0, T2, T3, T4, T5, T6:log-sites, T6:log-primitive, T6:comparison.`
5. content/campaign/CohomologyComparisons/README.md, CP.3. After the first paragraph, which ends "A free B_dR^+-lattice chosen arbitrarily inside étale cohomology is not this construction." (wrapped over two lines), add: "Import Scholze's primitive comparison and finiteness theorems (Scholze 2013, Theorems 5.1 and 1.1) from PadicHodgeTheory P8:primitive. They are inputs of this comparison, not its consequences."
6. content/campaign/AInfCohomology/README.md, AI.4. After the sentence "After mu-inversion prove the étale comparison with the actual p-adic cohomology of the generic fiber, including derived p-completion where used." (wrapped over two lines), add: "The A_inf primitive comparison it uses (BMS1 Theorem 5.7, routed here by PAPER-BHATT-MORROW-SCHOLZE-18 route 5) imports Scholze's primitive comparison from PadicHodgeTheory P8:primitive."
7. content/campaign/IgusaVarietiesAndTorsionConcentration/README.md, IG.3.
   - Replace: "use connected Stein fibers and the precise primitive comparison, not a false"
   - With: "use connected Stein fibers and the precise primitive comparison (PadicHodgeTheory P8:primitive), not a false"
8. research/blueprint/packets/PadicHodgeTheory--P7.json.
   - (a) Node "PadicHodgeTheory:P8/affinoid-k-pi-one-for-p-torsion" (Theorem 4.9): set "parentStageId" and "realises" to "PadicHodgeTheory:P8:primitive". Keep the id if the packet checker allows a prefix different from the parent; otherwise rename it to "PadicHodgeTheory:P8:primitive/affinoid-k-pi-one-for-p-torsion" and update the prerequisites that cite it.
   - (b) Gap "No atlas owner for Scholze's primitive comparison theorem (Sch13 §5)": replace its detail with "Owner: PadicHodgeTheory:P8:primitive (FIX-RT-AREA-padic-1, RT-AREA-padic-1/24). Next action: the node-level decomposition of Sch13 §5 there."
   - (c) The CP.3 request: delete part (b) from "need", and set "neededBy" to ["PadicHodgeTheory:P8/proper-smooth-de-rham-comparison-application"]. The nodes P8/etale-to-bdr-plus-comparison-for-lisse-sheaves and P8/relative-bdr-plus-local-system-comparison take the P8:primitive nodes as prerequisites instead.
   - (d) Restructure entry "Owner of Scholze's primitive comparison theorem (Sch13 §5)": replace its proposal with "Decided by FIX-RT-AREA-padic-1: a new PadicHodgeTheory sub-stage P8:primitive, after P8:local-rational and before CP.3, AI.4 and P8, rather than CP.3:primitive. Three accepted routes (PAPER-SCHOLZE-13 route 1, PAPER-ZAVYALOV-25 route 7, PAPER-BHATT-MORROW-SCHOLZE-18 route 14) assign it to PadicHodgeTheory P8, and §5 uses Lemma 5.2 of P8:local-rational."
   - (e) coverage[P8].remaining: replace "The primitive comparison theorem (Sch13 Theorem 5.1, Corollary 5.11) has no owner stage; requested from CohomologyComparisons CP.3 pending the restructure decision." with "The primitive comparison theorem (Sch13 Theorem 5.1, Corollary 5.11) is owned by the sub-stage P8:primitive (FIX-RT-AREA-padic-1/24); its nodes are to be written there."
9. data/decompositions/PadicHodgeTheory.json, coverage[P8:local-rational].remaining. Replace "; no owner stage was identified." with "; owner: PadicHodgeTheory:P8:primitive (FIX-RT-AREA-padic-1/24)."
10. research/blueprint/packets/CohomologyComparisons.json and data/decompositions/CohomologyComparisons.json, the gap "Scholze's de Rham comparison (Theorem 5.1, [58]) has no verified supplier in the CP graph".
    - Replace "Next action: decide whether CP.3 absorbs [58, §8] (with P8:local-rational supplying the Poincaré lemma) or a separate upstream owner is created, and check acyclicity."
    - With "Resolved by FIX-RT-AREA-padic-1 (RT-AREA-padic-1/24). CP.3 absorbs [58, §8] for constant coefficients, as its text already says. P8:local-rational supplies the Poincaré lemma, and the new PadicHodgeTheory:P8:primitive supplies the finiteness and primitive comparison ([58] Theorems 1.1 and 5.1) through the edge P8:primitive → CP.3 (acyclic). CP.2 and CP.5 reach it through CP.3 (accepted RS-01 link CP.3 → CP.2, and CP.2 → CP.5)."
    - In the decomposition's review summary, remove "Scholze Theorem 5.1 owner" from the list after "Open".
11. Routes. Apply these only after P8:primitive is in the atlas, because check_paper.py rejects unknown stage ids.
    - PAPER-SCHOLZE-13.result.json, routes[0].stages: add "PadicHodgeTheory:P8:primitive". Append to its reason: " The primitive comparison and finiteness theorem with its proof (Theorems 1.1, 1.3, 4.9 and 5.1, Lemma 4.12, Lemmas 5.3–5.9, Corollary 5.12) belong to the sub-stage P8:primitive (FIX-RT-AREA-padic-1/24)."
    - Same file: for items s4-thm4.9-affinoid-K-pi-1 and s1-thm1.2-affinoid-kpi1, change "planned" from ["PadicHodgeTheory:P8"] to ["PadicHodgeTheory:P8:primitive"].
    - PAPER-ZAVYALOV-25.result.json, routes[6].stages: add "PadicHodgeTheory:P8:primitive".
    - PAPER-BHATT-MORROW-SCHOLZE-18.result.json, routes[13].stages: replace ["PadicHodgeTheory:P8"] with ["PadicHodgeTheory:P8:primitive"]. Append to its reason: " Re-pointed to the sub-stage P8:primitive, which owns Scholze's finiteness theorem (FIX-RT-AREA-padic-1/24)."
12. Owners entry:
    {"target": "Scholze's primitive comparison theorem and finiteness for proper smooth adic spaces over an algebraically closed field (Scholze 2013 Theorems 1.1, 4.9 and 5.1, Lemma 4.12, the §5 lemmas and the relative Corollary 5.12/5.11)", "owner": "PadicHodgeTheory:P8:primitive", "formerly": ["PadicHodgeTheory:P8"]}
    - P8 held it only through routes. The P7 packet had also requested it from CP.3, which never planned it.
    - No owners entry is needed for the logarithmic version, because nothing planned it before.

**Not changed / open.**
- The relative form needs Huber's proper base change for stalks (the SCHOLZE-13 note cites "[9, Proposition 2.6.1]"). No ClassicalAdicEtaleCohomology stage text names it. I added no edge; the P8:primitive blueprint must request it.
- AdicSpacesPartII R3 is kept as an input, as the finding proposed. Possible uses are the de Jong–van der Put dimension bound in Lemma 5.9 and Kiehl-style finiteness. I did not identify an R3 node that supplies either.
- PAPER-ZAVYALOV-25/117 (Scholze's Corollary 3.17) is planned at H0: the SCHOLZE-13 route 3 reason says "ClassicalAdicEtaleCohomology H0 has Proposition 3.7(iii), Lemma 3.16 and Corollary 3.17". So P8:primitive imports it from H0, and ZAV/117 could be marked planned there. Its route is outside this finding.
- IG.3's toroidal-to-minimal argument may need the logarithmic version as well. I did not check this against Caraiani–Scholze's non-compact paper.
- DLLZ Corollary 6.3.4 uses their purity theorem (Theorem 4.6.1). I did not check whether T6:log-sites plans purity. If it does not, T6:log-primitive should plan it or drop Corollary 6.3.4.
- The edge to AI.4 rests on PAPER-BHATT-MORROW-SCHOLZE-18/092's note. I did not open BMS1.

## /25 (medium, error): Local Scholze–Weinstein theorems routed into the global stage T2

**The finding and the verdict.** PAPER-CARAIANI-SCHOLZE-17 route 6 sends three local Scholze–Weinstein statements to HodgeTateAndCanonicalSubgroups:T2. They are [SW13, Thm 5.1.4] (item 52, the paper's Theorem 4.1.4), [SW13, Thm B = Thm 5.2.1] with the quasi-logarithm (item 53), and [SW13, Prop. 5.1.6] (item 143). T2 sits downstream of the global Shimura construction. It lacks the VectorBundles imports the route itself demands, and ET.6a, which rests on the classification, has no edge from T2. The verifier confirmed the ancestry: "T2 has 176 ancestors, and AutomorphicBundles B0, B1 and B2 and ShimuraVarieties V0, V4 and V8 are all among them". The finding's own fix, a new FiniteFlat stage after R07.2, is not right as written. Scholze–Weinstein Theorem B already has an accepted owner elsewhere (see Checked), and a new FiniteFlat stage would be a second owner. The correct fix is to join that owner.

**Checked.**
- CS17 route 6 (accepted): stages ["HodgeTateAndCanonicalSubgroups:T2"], items /52, /53, /143. Its reason says "T2 must import VectorBundlesAndIsocrystals VB1, VB2:ampleness and VB2:classification … and IG.0 and IG.1 must import T2 if they use these statements". Review route 6: "Accepted."
- Item /52 note: "Parts (1) and (2) are [SW13, Thm 5.1.4]"; "A source route adds it to T2". Item /53 note: "The item belongs in T2, where the Hodge–Tate filtration W is built". Item /143 note: "A source route adds it to T2 with Theorem 4.1.4 and the classification by pairs (T, W)". Item /138 note: "through [SW13, Thm 5.1.4], Theorem 4.1.4 (HodgeTateAndCanonicalSubgroups T2)".
- CS17 route 7 (accepted) sends the companions to FiniteFlat R07.1/R07.2: universal covers (/49), Proposition 4.1.2 (/50), [SW13, Thm A] over f-semiperfect rings (/138), rigidity (/139) and Berthelot (/142).
- Already owned elsewhere. PAPER-SCHOLZE-WEINSTEIN-20 route 1 (part-ii, roadmap "PrismaticCohomologyPartIIPrismaticDieudonneTheory", parent "PrismaticCohomology", area "cohomology") routes SW-20/82 there. SW-20/82 is "Theorem 12.1.5 (Scholze–Weinstein, Theorem B) … p-divisible groups over 𝒪_C are pairs (T, W)". The same route sends /101 ("Theorem 14.4.2 (Scholze–Weinstein, Theorem A): p-divisible groups over 𝒪_C/p and A_crys-modules") and /110 (Theorem A over perfectoid pairs, with universal covers). The SW-20 review accepts route 1: "joining that Part II is right". DESIGN-PrismaticCohomologyPartII is "state": "pending" in queue.json. make_queue.py folds every part-ii route of one parent into that one design job ("Every Part II proposal for the same parent, from whichever paper, becomes one job"). So a second route with the same id adds to the job and replaces nothing.
- No atlas stage plans [SW13, Thm 5.1.4], Theorem B or Prop. 5.1.6. I searched all 1968 stage descriptions for "Scholze–Weinstein", "pairs (T", "O_C/p", "p-divisible group over O_C", "5.1.4" and "5.2.1". The only hits are AI.2 (Fargues' (T, Ξ), a different statement) and ET.6/ET.6a (they cite "Scholze–Weinstein §§6–7"). The FiniteFlat packet has no node mentioning Scholze, semiperfect rings, O_C/p or universal covers.
- Stage ids exist: VectorBundlesAndIsocrystals:VB1, :VB2:ampleness and :VB2:classification.
- Ancestry on stageEdges at origin/main: T2 has 176 ancestors, including B0, B1, B2, V0, V4 and V8. None of VB1, VB2:ampleness or VB2:classification is an ancestor of T2. The finding says "T2's only VectorBundles ancestor is VB0". That holds only once the accepted restructurings' links are added: with them, VB0 is T2's only VectorBundles ancestor; on stageEdges alone T2 has none. T2 is not an ancestor of ET.6/ET.6a, and ET.6a already has VB2:classification as an ancestor. T2 → IG.3 is a direct edge.
- Consumers. IG.3: "For a geometric flag point x=Spa(C,O_C)→Fl, identify its polarized p-divisible group over O_C and special fiber X". The CS17 report puts "everything that needs generic fibres, infinite level or the period map in IG.3". That covers Theorem 4.2.4, Proposition 4.2.14, Lemma 4.2.18 and Lemma 4.3.20, which use /53 and /143. ET.6a: "The new source Scholze–Weinstein §§6–7 supplies the moduli/duality proof route".
- Acyclicity (Python, on data/atlas.json stageEdges, and again with the links of all 23 accepted restructurings). I modelled the Part II stage as a virtual node. Its predecessors were VB1, VB2:ampleness, VB2:classification, R07.1, R07.2, AI.2, AI.4, AI.5, CR.7, D2, GS0:Witt-geometry, A3, A4, T0, T2, Q0:integral-algebra and PR.0–PR.8, which covers the SW-20 route 1 imports plus mine. Its successors were IG.0, IG.1, IG.3 and ET.6a. Result: no cycle in either graph. The finding's minimum repair (VB1, VB2:ampleness, VB2:classification → T2; T2 → ET.6a) and its proposed FiniteFlat stage (R07.2 and the three VB stages → new stage → T2, IG.3, ET.6a) are also acyclic in both graphs.

**Fix, as edits.**
1. research/blueprint/papers/PAPER-CARAIANI-SCHOLZE-17.result.json, routes[5] (route 6). Replace the route object in place. Keeping position 6 keeps later route numbers and the review's route entries valid. New object:
   {"route": "part-ii", "parent": "PrismaticCohomology", "roadmap": "PrismaticCohomologyPartIIPrismaticDieudonneTheory", "title": "Prismatic cohomology: relative, absolute, Nygaard and log variants, Part II: prismatic Dieudonné theory", "area": "cohomology", "items": ["PAPER-CARAIANI-SCHOLZE-17/52", "PAPER-CARAIANI-SCHOLZE-17/53", "PAPER-CARAIANI-SCHOLZE-17/143"], "brief": B, "reason": R}
   B = "Coalesces with the candidate of the same id proposed by PAPER-ANSCHUTZ-LEBRAS-23 and continued by PAPER-SCHOLZE-WEINSTEIN-20 route 1, which already brings Scholze–Weinstein's Theorem B (Berkeley Theorem 12.1.5) and Theorem A (Berkeley Theorems 14.4.2 and 15.2.3) here. Caraiani–Scholze (Annals 186, 2017) uses three statements of [SW13, §5] that the Berkeley route does not list. Add them as that paper states them. (1) Theorem 4.1.4 = [SW13, Thm 5.1.4] with GAGA: every p-divisible group over O_C/p is quasi-isogenous to H ×_{F̄_p} O_C/p for some H over F̄_p; G ↦ E(G) is fully faithful from p-divisible groups over O_C/p up to isogeny to vector bundles on the schematic curve X_{C♭}, with essential image the bundles all of whose slopes lie between 0 and 1; and for G over F̄_p the bundle 𝓔(G) on the adic curve corresponds to E(G ×_{F̄_p} O_C/p) (item 52). (2) [SW13, Thm B = Thm 5.2.1]: the same theorem as PAPER-SCHOLZE-WEINSTEIN-20/82, together with the quasi-logarithm qlog_{X_b} of [SW13, §3] and the identification of the image of T_pG ⊗ C under it with (Lie G^∨)^∨ ⊗ C (item 53). (3) [SW13, Prop. 5.1.6]: for G over O_C and V = T_pG ⊗ Q_p, the modification of V ⊗ O_{X_{C♭}} at ∞ by the lattice Ξ with Ξ/(V ⊗ B^+_dR) = Lie G ⊗ C is E(G ×_{O_C} O_C/p) (item 143). Imports these items add: VectorBundlesAndIsocrystals VB1 (the isocrystal-to-bundle functor), VB2:ampleness (the schematic curve and its comparison with the adic curve) and VB2:classification (slopes); FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 (universal covers, PAPER-CARAIANI-SCHOLZE-17 route 7) and R07.2 (Dieudonné theory up to isogeny over f-semiperfect rings, item 138). Consumers: the stage proving (1)–(3) gets links to IgusaVarietiesAndTorsionConcentration IG.3, which identifies 'its polarized p-divisible group over O_C' at a flag point and takes Caraiani–Scholze Theorem 4.2.4, Proposition 4.2.14, Lemma 4.2.18 and Lemma 4.3.20 by route 2, and to EndoscopicTransferAndUnitaryTraceComparison ET.6a (the Scholze–Weinstein §§6–7 towers). FIX-RT-AREA-padic-1 checked these links acyclic together with the imports named here and in PAPER-SCHOLZE-WEINSTEIN-20 route 1."
   R = "Scholze–Weinstein's Theorem 5.1.4, Theorem B and Proposition 5.1.6 are local statements about p-divisible groups over O_C/p and O_C. PAPER-SCHOLZE-WEINSTEIN-20 route 1 (accepted) already makes this Part II the owner of Theorem B and of Theorem A. As a source route to HodgeTateAndCanonicalSubgroups T2, they planned Theorem B twice. They also put local mathematics downstream of AutomorphicBundles B0–B2 and ShimuraVarieties V0–V8. Re-routed by FIX-RT-AREA-padic-1 (RT-AREA-padic-1/25)."
2. Same file, item notes.
   - /52: replace "HodgeTateAndCanonicalSubgroups T2 plans to 'Prove the displayed Hodge–Tate exact sequence and its relative form on the pro-étale site' but does not plan this theorem. A source route adds it to T2, together with the classification of p-divisible groups over O_C by pairs (T, W). T2 must then import VectorBundlesAndIsocrystals VB1 ('Construct the isocrystal-to-bundle functor'), VB2:ampleness (the schematic curve and its comparison with the adic one) and VB2:classification (slopes)." with "No stage plans it. Route 6 sends it, with the classification of p-divisible groups over O_C by pairs (T, W), to the prismatic Dieudonné Part II (PrismaticCohomologyPartIIPrismaticDieudonneTheory). PAPER-SCHOLZE-WEINSTEIN-20 route 1 already makes that Part II the owner of Scholze–Weinstein's Theorems A and B. The Part II imports VectorBundlesAndIsocrystals VB1 ('Construct the isocrystal-to-bundle functor'), VB2:ampleness (the schematic curve and its comparison with the adic one) and VB2:classification (slopes) for it."
   - /53: replace "The item belongs in T2, where the Hodge–Tate filtration W is built. It uses the universal cover of Definition 4.1.1 and Proposition 4.1.2. That cover sits beside the Tate module of FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1 and reaches T2 through T1, T0 and AbelianSchemesAndArithmeticModuli A3–A4." with "The classification is PAPER-SCHOLZE-WEINSTEIN-20/82 (Berkeley Theorem 12.1.5), which that paper routes to the prismatic Dieudonné Part II. Route 6 sends this item there too, so the theorem has one owner, and that stage links to IG.3 and ET.6a. It uses the universal cover of Definition 4.1.1 and Proposition 4.1.2, which route 7 places in FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1; the Part II imports R07.1."
   - /143: replace "A source route adds it to T2 with Theorem 4.1.4 and the classification by pairs (T, W)." with "Route 6 sends it to the prismatic Dieudonné Part II, with Theorem 4.1.4 and the classification by pairs (T, W)."
   - /138: replace "and, through [SW13, Thm 5.1.4], Theorem 4.1.4 (HodgeTateAndCanonicalSubgroups T2)" with "and, through [SW13, Thm 5.1.4], Theorem 4.1.4 (the prismatic Dieudonné Part II, route 6)".
3. research/blueprint/papers/PAPER-CARAIANI-SCHOLZE-17.review.json, routes entry 6: append to the reason: " Superseded by FIX-RT-AREA-padic-1 (RT-AREA-padic-1/25): route 6 is now a part-ii join of PrismaticCohomologyPartIIPrismaticDieudonneTheory, the owner of Scholze–Weinstein Theorem B under PAPER-SCHOLZE-WEINSTEIN-20 route 1." A reviewer should re-accept the new route.
4. research/blueprint/papers/PAPER-CARAIANI-SCHOLZE-17.md.
   - Line 72: replace "| 6. source | `HodgeTateAndCanonicalSubgroups` — T2 | 3 |" with "| 6. part-ii | `PrismaticCohomologyPartIIPrismaticDieudonneTheory` (join; see PAPER-SCHOLZE-WEINSTEIN-20 route 1) | 3 |".
   - Line 91: replace "p-divisible groups over O_C to HodgeTateAndCanonicalSubgroups T2 and FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1–R07.2" with "universal covers and Dieudonné theory to FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1–R07.2, and Scholze–Weinstein's p-divisible groups over O_C/p and O_C (§5 of their paper) to the prismatic Dieudonné Part II (route 6)".
5. Owners entry, for the restructuring that the Part II's design review produces. The owner id is the Part II stage that proves the classification; DESIGN-PrismaticCohomologyPartII assigns it:
   {"target": "Scholze–Weinstein classification of p-divisible groups over O_C by pairs (T, W) ([SW13, Thm B = Thm 5.2.1]; Berkeley Thm 12.1.5), with [SW13, Thm 5.1.4] (p-divisible groups over O_C/p up to isogeny = bundles on X_{C♭} with slopes in [0, 1]) and [SW13, Prop. 5.1.6]", "owner": "<PrismaticCohomologyPartII classification stage>", "formerly": ["HodgeTateAndCanonicalSubgroups:T2"]}
6. No atlas edge is added now: the Part II has no stage ids yet. The links to IG.3 and ET.6a are in the brief of edit 1, and the design job creates them. The BOXER-PILLONI-26 route 5 brief wrongly puts "universal covers and their representability (PAPER-CARAIANI-SCHOLZE-17's source route)" at T0 and T2; /26 edit 8 corrects that clause.

**Adjusted by the joint check (C1).** The Part II this fix routes into imports Fargues' equivalence with (T, Ξ), which /19 moves from AI.2 to AI.2:essential-surjectivity. The import in the route brief below should name AI.2 for full faithfulness and AI.2:essential-surjectivity for Fargues' equivalence; see the adjustment under /19.

**Not changed / open.**
- T2's stage text never named these items, so it needs no edit. It keeps the Hodge–Tate sequence, the parabolic reduction and the torsors.
- The Part II may still sit downstream of T2. The SW-20 route 1 brief imports "HodgeTateAndCanonicalSubgroups T0/T2 (the Hodge–Tate map and sequence of Theorem 12.1.1)", i.e. Fargues' Hodge–Tate sequence for p-divisible groups over O_C (SW-20/81, "planned" T0 and T2). While that import stands, the classification stays downstream of C4 through T0 and of B0–B2/V0–V8 through T2. There is no cycle (checked above). A local owner for that sequence would remove the dependence. One option is to place it beside the packet node FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/hodge-tate-p-divisible, which is Tate's case over a DVR ("Tate's Hodge–Tate decomposition for p-divisible groups"). That is a decision for DESIGN-PrismaticCohomologyPartII or the maintainer; this fix does not make it.
- A related duplicate outside this finding: [SW13, Thm A] is route-assigned twice. CS17 route 7 widens R07.2 with it over f-semiperfect rings (/138). SW-20 route 1 sends its O_C/p and perfectoid-pair cases to the Part II (/101, /110). The universal cover likewise goes to R07.1 (CS17 /49, /139) and to the Part II (SW-20 /110). The maintainer should choose one owner for each. R07.2 is upstream of both IG.0 and the Part II, whose brief already imports "R07.1–R07.2".
- Not verified: the SW13 theorem numbering (5.1.4, 5.1.6, 5.2.1, Thm A, Thm B). I used it as quoted in the CS17 and SW-20 extractions and did not open SW13.

## /26 (medium, duplicate): The Hasse invariant of a BT_1 is owned by T0 through a route, while H2 and R15.3 build instances T0 cannot supply

**The finding and the verdict.** PAPER-PILLONI-20 route 8 (accepted) makes HodgeTateAndCanonicalSubgroups:T0 the owner of Ha(G) = det V^⋆ for a BT_1 over any F_p-scheme, of Fargues's LF and of the BT_1 Hodge–Tate sequence. Meanwhile H2 constructs the Hilbert Hasse ideal and R15.3 the elliptic Hasse invariant. T0 is an ancestor of neither, and it sits downstream of ShimuraCompactifications:C4. The verifier confirmed this and added that it is subtler than the other duplicates: "T0's own text never mentions the Hasse invariant … So the general invariant is route-assigned to a stage that does not name it while two stages construct instances of it." I apply the finding's fix: R07.2 owns the BT_1 material, T0 keeps the extension over degeneration charts, H2 and R15.3 import, and the briefs are re-pointed. One correction: an edge from T0 to H2, C6, R15.3 or IG.2 would not close a cycle. The objection to such an edge is layering, not a cycle.

**Checked.**
- PILLONI-20 route 8 (accepted; review: "The route asks T0 for the Hasse invariant and Fargues's LF in the generality the paper uses"). Its reason reads "T0 (… 'Construct the relevant Hodge ideal, invariant under duality where used' …) gets, for a BT_1 G over any F_p-scheme: Ha(G) = det V^⋆ …; Fargues's LF …; quasi-polarizations and LF∘λ^⋆ = id (p. 30); 0 → Ker F → G → ω_{G^D} → ω_{G^D}^{(p)} (p. 32); Lemma 6.3.4.1 (p. 34)" and "SiegelModularFormsModPn imports Ha from T0". Items of this BT_1 group: classical-hasse-invariant-BT1 ("§6.3 and §6.3.1, p. 30"; note "planned nowhere"), fargues-isomorphism-LF (Prop. 6.3.1.1), quasi-polarization-BT1, LF-inverse-to-quasi-polarization-pullback (Lemma 6.3.1.1), hodge-tate-exact-sequence-BT1 ("§6.3.3, proof of Lemma 6.3.3.2, p. 32") and normalized-pullback-multiplicative-type-isogeny (Lemma 6.3.4.1). All are "missing".
- PILLONI-20 route 11 (accepted) already widens R07.2 to BT_1s over F_p-schemes. Its reason: "R07.2 … must add, beyond perfect fields, smoothness of the stack of quasi-polarized BT_1s with dense ordinary locus (p. 30) and, for a BT_1 over an F_p-scheme, the crystalline Dieudonné module with its Hodge filtration and the exact sequence of complexes linking the Hasse–Witt maps of G and G^D". The stack item is the input to the proof of Lemma 6.3.1.1.
- Stage texts in content/campaign/*/README.md, which match data/atlas.json.
  - T0 (line 39): "Construct the relevant Hodge ideal, invariant under duality where used."
  - R07.2 (line 40): "Include Frobenius/Verschiebung, dimensions, heights, slopes and the ordinary/supersingular cases."
  - H2 (line 64): "Construct its Hasse ideal … Prove independence of a local lift of the Hasse invariant".
  - R15.3 (line 48): "Construct the Hasse invariant, Frobenius/Verschiebung and theta operator".
  - C6 (line 91): "Identify the semi-abelian extensions and Hasse ideals used in T3–T5."
  - IG.2: "construct Ekedahl–Oort/G-zip strata and their Hasse sections; prove affineness for the minimal strata via their ample Hasse invariant".
- Accepted restructurings. RS-02 narrows R07.2 and keeps "the actual Dieudonne module/crystal … fixing covariance, F/V". It gives elliptic F/V to Tau Ceti Modular curves 7E ("Elliptic Frobenius/Verschiebung and ordinary/supersingular height-one/two cases"), and its links include R07.2 → T0, R07.2 → T2 and R07.2 → H2. RS-06 narrows R15.3 to "Construct the Hasse invariant, theta … using the existing elliptic Frobenius/Verschiebung maps", with the owners entry "Hasse/theta operations on forms … owner R15.3". No accepted restructuring assigns the general BT_1 Hasse invariant; a search of all RS results for "Hasse" found none. RS-32 (accepted) keeps C6's "Hasse ideals". RS-23, which keeps H2's "Hasse ideals", is not accepted. No Tau Ceti roadmap stage defines the Hasse invariant of a BT_1 or of an elliptic curve. The only "Hasse invariant" hits are in the quadratic-form roadmaps.
- Ancestry (stageEdges, and again with the accepted RS links). T0's predecessors are exactly A4, R2 and C4, so C4 → T0 is a direct edge. R07.2 is an ancestor of T0, H2, C6 and IG.2 (path R07.2 → A4 → H2 → C6; R07.2 → IG.0 → IG.1 → IG.2). R07.2 is not an ancestor of R15.3. T0 is an ancestor of none of H2, C6, R15.3 or IG.2. T0 has 79 ancestors and R07.2 has 12.
- Correction to the finding. The finding says those stages "cannot import it". But none of H2, C6, R15.3 or IG.2 is an ancestor of T0, so adding T0 → H2, C6, R15.3 or IG.2 is acyclic in both graphs (checked). The real objection is layering. C4 is not an ancestor of H2 or R15.3. An edge from T0 would make H2's arbitrary-prime integral model and R15.3's genus-one theory wait on C4 and T0's 79 ancestors, for a statement about BT_1s over F_p-schemes that needs neither.
- New edge R07.2 → R15.3 (not in stageEdges, not in any accepted RS link): no path from R15.3 back to R07.2; no cycle on stageEdges at origin/main, nor with the links of the 23 accepted restructurings.
- Briefs that name an owner for the Hasse invariant. I found more than the finding's four:
  - PILLONI-20 route 1 brief; route 2 brief (four places) and reason; route 4 reason; route 5 brief; route 8 reason.
  - BOXER-PILLONI-26 route 1 brief (two places) and reason; route 5 brief.
  - BOXER-CALEGARI-GEE-PILLONI-21 route 2 brief and reason. The reason cites "Hasse invariants (HodgeTateAndCanonicalSubgroups T0 and SiegelModularFormsModPn)". The brief also imports "the elliptic Hasse invariant of … R15.3" and "H1–H2, for … Y_{H,1} and its Hasse ideal"; these are the three owners the finding counts.
  - CALEGARI-GERAGHTY-20 route 2 brief ("Owns h∈H^0(B,ω^{p−1}) for p-divisible groups over any F_p-scheme B").
  - PAPER-PILLONI-20.md lines 113, 140 and 223.

**Fix, as edits.**
1. Owners entry (RS format). Record it with the accepted RS-02 family (FiniteFlat and AbelianSchemes), or in the next restructuring of that family:
   {"target": "Hasse invariant Ha(G) = det V^⋆ ∈ H^0(S, (det ω_G)^{p−1}) of a BT_1 G over any F_p-scheme S; Fargues's isomorphism LF: (det ω_G)^{p−1} ≅ (det ω_{G^D})^{p−1} with LF(Ha(G)) = Ha(G^D); quasi-polarized BT_1s and LF∘λ^⋆ = id; the BT_1 Hodge–Tate sequence 0 → Ker F → G → ω_{G^D} → ω^{(p)}_{G^D}; the normalized pullback λ̃^⋆ for isogenies of multiplicative Barsotti–Tate groups", "owner": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2", "formerly": ["HodgeTateAndCanonicalSubgroups:T0"]}
   H2, R15.3, C6 and SiegelModularFormsModPn keep their instance-level constructions, which import this.
2. content/campaign/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md, R07.2 (line 40). After "Include Frobenius/Verschiebung, dimensions, heights, slopes and the ordinary/supersingular cases." insert: "For a truncated Barsotti–Tate group G of level 1 over any F_p-scheme S, construct the Hasse–Witt map V^⋆: ω_G → ω_G^{(p)} and the Hasse invariant Ha(G) = det V^⋆ ∈ H^0(S, (det ω_G)^{p−1}). Prove Fargues's isomorphism LF: (det ω_G)^{p−1} ≅ (det ω_{G^D})^{p−1} with LF(Ha(G)) = Ha(G^D), and LF∘λ^⋆ = id for a quasi-polarization λ (Pilloni 2020, §6.3.1; Fargues, Ann. ENS 44, 2011, §2.2.3). Prove the BT_1 Hodge–Tate sequence 0 → Ker F → G → ω_{G^D} → ω^{(p)}_{G^D} (Fargues 2011, §2.1.2). Construct the normalized pullback λ̃^⋆ with λ̃^⋆Ha(G') = Ha(G) for an isogeny of multiplicative Barsotti–Tate groups (Pilloni 2020, Lemma 6.3.4.1, with PAPER-PILLONI-20 sourceIssues E47). This is the one owner of the Hasse invariant; the elliptic, Hilbert and Siegel Hasse invariants are its instances." This stays within RS-02's keeps, which retain general F/V in R07.2 and give only the elliptic F/V to 7E.
3. content/campaign/HodgeTateAndCanonicalSubgroups/README.md, T0.
   - Line 37: replace "**Dependencies:** A3–A4, formal schemes R2, and C4 for the degeneration charts." with "**Dependencies:** A3–A4, formal schemes R2, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 for the Hasse invariant and LF, and C4 for the degeneration charts." The edge R07.2 → T0 is already an accepted RS-02 link, so no new atlas edge is needed.
   - Line 39: replace "Construct the relevant Hodge ideal, invariant under duality where used." with "Construct the relevant Hodge ideal from the Hasse invariant Ha = det V^⋆ of R07.2; where duality is used, its invariance is Fargues's LF(Ha(G)) = Ha(G^D), proved in R07.2. Do not define a second Hasse invariant." The next sentence, "Extend the local construction to semi-abelian degeneration charts …", stays. It is the boundary extension T0 keeps. PILLONI-20 route 2 reads it the same way ("instantiate T0's Ha, which T0 extends to semi-abelian degeneration charts"). PILLONI-20 route 8 and CALEGARI-GERAGHTY-20 route 2 read "Hodge ideal" as built from Ha; I did not check this against BHW.
4. content/campaign/HilbertModularVarietiesAndShimuraCurves/README.md, H2.
   - Line 60: replace "**Dependencies:** H1, A4, M2, and normalizations from M4." with "**Dependencies:** H1, A4, M2, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 for the Hasse invariant, and normalizations from M4." The edge R07.2 → H2 is already an accepted RS-02 link.
   - Line 64: replace "Construct its Hasse ideal and its formal blow-up/thickening models." with "Construct its Hasse ideal as the ideal locally generated by lifts of the Hasse invariant Ha(A[p]) = det V^⋆ of R07.2 on the universal abelian scheme, and its formal blow-up/thickening models; do not define a second Hasse invariant."
5. content/campaign/AlgebraicModularFormsAndSerreWeights/README.md, R15.3.
   - After line 48's first sentence ("Construct the Hasse invariant, Frobenius/Verschiebung and theta operator with their q-expansion formulas and Hecke compatibilities.") insert: "Prove that this Hasse invariant is the instance Ha(E[p]) = det V^⋆ of the BT_1 Hasse invariant imported from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2, on the universal elliptic curve; do not construct a second general Hasse invariant." RS-06 keeps R15.3's construction of the Hasse invariant as a form, so the edit adds a comparison and removes nothing.
   - Line 50: replace "**Dependencies:** R15.2 (preceding layer)." with "**Dependencies:** R15.2 (preceding layer); FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 (Hasse invariant of a BT_1)."
   - New atlas stage edge FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2 → AlgebraicModularFormsAndSerreWeights:R15.3. Acyclic: no path from R15.3 back to R07.2; checked on stageEdges at origin/main and with the accepted RS links.
6. content/campaign/ShimuraCompactifications/README.md, C6 (line 91). Replace "Identify the semi-abelian extensions and Hasse ideals used in T3–T5." with "Identify the semi-abelian extensions, and the Hasse ideals used in T3–T5 as those of H2 (built from the Hasse invariant of R07.2) on these models." No new edge: R07.2 → A4 → H2 → C6 already exists.
7. research/blueprint/papers/PAPER-PILLONI-20.result.json.
   - Move six items from route 8 (routes[7]) to route 11 (routes[10], FiniteFlat R07.1/R07.2): PAPER-PILLONI-20/classical-hasse-invariant-BT1, /fargues-isomorphism-LF, /quasi-polarization-BT1, /LF-inverse-to-quasi-polarization-pullback, /hodge-tate-exact-sequence-BT1 and /normalized-pullback-multiplicative-type-isogeny. Route 8 keeps its other 12 items: the Fargues-degree items, HT over O_K, HT over the toroidal boundary, and the T5 items.
   - Route 8 reason: replace from "gets, for a BT_1 G over any F_p-scheme:" through "SiegelModularFormsModPn imports Ha from T0, not the reverse as PAPER-CALEGARI-GERAGHTY-20 proposed, and keeps Ha′." with "extends the Hasse invariant of a BT_1, which it imports from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 (route 11), over the semi-abelian degeneration charts; it does not own Ha, LF or the BT_1 Hodge–Tate sequence (FIX-RT-AREA-padic-1/26)."
   - Route 11 reason: after "the exact sequence of complexes linking the Hasse–Witt maps of G and G^D (pp. 31–32)" insert "; and, for a BT_1 G over any F_p-scheme, Ha(G) = det V^⋆ ∈ H⁰(S, (det ω_G)^{p−1}), Fargues's LF with LF(Ha(G)) = Ha(G^D), quasi-polarizations and LF∘λ^⋆ = id (p. 30), 0 → Ker F → G → ω_{G^D} → ω_{G^D}^{(p)} (p. 32) and Lemma 6.3.4.1 (p. 34, with E47), moved from route 8 by FIX-RT-AREA-padic-1".
   - Route 2 brief: replace "- HodgeTateAndCanonicalSubgroups T0 owns Ha = det V⋆ for a BT₁ over any F_p-scheme, LF (Prop. 6.3.1.1), Lemma 6.3.1.1 and Lemma 6.3.4.1 (E47)." with "- FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 owns Ha = det V⋆ for a BT₁ over any F_p-scheme, LF (Prop. 6.3.1.1), Lemma 6.3.1.1 and Lemma 6.3.4.1 (E47); HodgeTateAndCanonicalSubgroups T0 extends Ha over semi-abelian degeneration charts."
   - Route 2 brief: replace "- CG20's H2 comparison (the Hasse ideal of HilbertModularVarietiesAndShimuraCurves H2 is locally generated by lifts of h) stays here, stated for the Ha imported from T0." with "- CG20's H2 comparison is dropped: H2 now defines its Hasse ideal by lifts of the Ha of R07.2 (FIX-RT-AREA-padic-1/26)."
   - Route 2 brief: replace "instantiate T0's Ha, which T0 extends to semi-abelian degeneration charts, for G and G′." with "instantiate R07.2's Ha, with T0's extension over semi-abelian degeneration charts, for G and G′."
   - Route 2 brief: replace "(HodgeTateAndCanonicalSubgroups) T0: Ha, LF, Lemmas 6.3.1.1 and 6.3.4.1. CG20 had T0 as a consumer; it is now upstream." with "(FiniteFlatGroupsAndIntegralPadicHodgeTheory) R07.2: Ha, LF, Lemmas 6.3.1.1 and 6.3.4.1; (HodgeTateAndCanonicalSubgroups) T0: the extension of Ha over semi-abelian degeneration charts. CG20 had T0 as a consumer; both are now upstream."
   - Route 2 reason: replace "- HodgeTateAndCanonicalSubgroups T0 owns Ha of a general BT₁, which goes there by source route. It has no genus-two strata." with "- FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 owns Ha of a general BT₁ (source route 11). It has no genus-two strata."
   - Route 1 brief: replace "(HodgeTateAndCanonicalSubgroups) T0 (Ha of a BT_1, degrees), T5." with "(HodgeTateAndCanonicalSubgroups) T0 (degrees), T5; Finite flat group schemes and integral p-adic Hodge theory (FiniteFlatGroupsAndIntegralPadicHodgeTheory) R07.2 (Ha of a BT_1)."
   - Route 4 reason: replace "The Hasse invariants and p-rank strata go to SiegelModularFormsModPn and HodgeTateAndCanonicalSubgroups T0." with "The Hasse invariant of a BT_1 goes to FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2; Ha′ and the p-rank strata go to SiegelModularFormsModPn."
   - Route 5 brief: replace "(HodgeTateAndCanonicalSubgroups) T0 (Ha of a BT₁), for [63]." with "(FiniteFlatGroupsAndIntegralPadicHodgeTheory) R07.2 (Ha of a BT₁), for [63]."
8. research/blueprint/papers/PAPER-BOXER-PILLONI-26.result.json.
   - Route 1 brief: replace "Ha is imported from HodgeTateAndCanonicalSubgroups T0, which owns the Hasse invariant of a BT_1 over any F_p-scheme." with "Ha is imported from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2, which owns the Hasse invariant of a BT_1 over any F_p-scheme."
   - Route 1 brief, imports list: replace "; the Hasse invariant of a BT_1, for layer I)" with ")", and add "; Finite flat group schemes and integral p-adic Hodge theory (FiniteFlatGroupsAndIntegralPadicHodgeTheory) R07.2 (the Hasse invariant of a BT_1, for layer I)" after the existing "(FiniteFlatGroupsAndIntegralPadicHodgeTheory) R07.1".
   - Route 1 reason: replace "- the Hasse invariant (HodgeTateAndCanonicalSubgroups T0);" with "- the Hasse invariant (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2);".
   - Route 5 brief: replace "(HodgeTateAndCanonicalSubgroups) T0 and T2: universal covers and their representability (PAPER-CARAIANI-SCHOLZE-17's source route); at T0 also the Hasse invariant of a BT_1 (PAPER-PILLONI-20's source route), whose invertibility locus is the ordinary locus. The Hasse invariant is taken from T0, never from SiegelModularFormsModPn." with "(FiniteFlatGroupsAndIntegralPadicHodgeTheory) R07.1: universal covers and their representability (PAPER-CARAIANI-SCHOLZE-17 route 7); R07.2: the Hasse invariant of a BT_1 (PAPER-PILLONI-20 route 11), whose invertibility locus is the ordinary locus. The Hasse invariant is taken from R07.2, never from SiegelModularFormsModPn." This also corrects the universal-cover clause (see /25): CS17 route 7 routes universal covers to R07.1, not T0/T2. T2 no longer takes Scholze–Weinstein's classification.
9. research/blueprint/papers/PAPER-BOXER-CALEGARI-GEE-PILLONI-21.result.json, route 2.
   - Brief: replace "  - Ha of a BT_1 (HodgeTateAndCanonicalSubgroups T0);" with "  - Ha of a BT_1 (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2);".
   - Reason: replace "- Hasse invariants (HodgeTateAndCanonicalSubgroups T0 and SiegelModularFormsModPn);" with "- Hasse invariants (Ha of a BT_1 from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2; Ha′ from SiegelModularFormsModPn; the elliptic and Hilbert instances from R15.3 and H2, which import R07.2);".
   - The brief's imports of "the elliptic Hasse invariant of AlgebraicModularFormsAndSerreWeights R15.3" and of "H1–H2, for the Hilbert–Blumenthal variety Y_{H,1} and its Hasse ideal" stay. They are now instances of one owner.
10. research/blueprint/papers/PAPER-CALEGARI-GERAGHTY-20.result.json, route 2 brief. Replace "Owns h∈H^0(B,ω^{p−1}) for p-divisible groups over any F_p-scheme B, from Verschiebung (R07.2), extended over the boundary (R15.3 is genus one). T0 (not upstream) should take h from here for its Hodge ideal; H2 is upstream (via C6 → B3), so prove its Hasse ideal is locally generated by lifts of h." with "Imports h = Ha = det V^⋆ ∈ H^0(B,ω^{p−1}) for p-divisible groups over any F_p-scheme B from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2, and its extension over the boundary charts from HodgeTateAndCanonicalSubgroups T0 (R15.3 is genus one). H2 defines its Hasse ideal by lifts of the same Ha."
11. research/blueprint/papers/PAPER-PILLONI-20.md.
    - Line 113: replace "belongs to HodgeTateAndCanonicalSubgroups T0: it is source-routed there, and this roadmap imports it from T0." with "belongs to FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2: it is source-routed there (route 11), and this roadmap imports it from R07.2."
    - Line 140: replace "- *HodgeTateAndCanonicalSubgroups* (18): the Hodge–Tate map, the Hasse invariant of BT₁ groups, Fargues's degree theory and his isomorphism LF, and (T5) the modified Hodge bundle ω^mod." with "- *HodgeTateAndCanonicalSubgroups* (12): the Hodge–Tate map, Fargues's degree theory, and (T5) the modified Hodge bundle ω^mod."
    - Line 143: replace "- *FiniteFlatGroupsAndIntegralPadicHodgeTheory* (10): BT₁ groups, multiplicative parts and Dieudonné theory." with "- *FiniteFlatGroupsAndIntegralPadicHodgeTheory* (16): BT₁ groups, multiplicative parts, Dieudonné theory, and the Hasse invariant of BT₁ groups with Fargues's isomorphism LF."
    - Line 223: replace "HodgeTateAndCanonicalSubgroups T0 is the right owner of the Barsotti–Tate Hasse invariant" with "FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 is the right owner of the Barsotti–Tate Hasse invariant (FIX-RT-AREA-padic-1/26; formerly T0)".
12. research/blueprint/papers/PAPER-PILLONI-20.review.json, route 8 and route 11 entries: append " Six BT_1 Hasse-invariant items moved from route 8 to route 11 by FIX-RT-AREA-padic-1 (RT-AREA-padic-1/26)."

**Not changed / open.**
- IG.2's "Hasse sections" of Ekedahl–Oort/G-zip strata and its "ample Hasse invariant" are generalized Hasse invariants of G-zip strata, not Ha(G) = det V^⋆. They are left in IG.2. On the ordinary stratum they should agree with R07.2's Ha. IG.2 already has R07.2 as an ancestor, so a compatibility sentence could be added without a new edge.
- Two boundary extensions of Ha remain. T0 extends Ha over semi-abelian degeneration charts in general, and C6 identifies the Hilbert Hasse ideals on its toroidal models. The edge T0 → C6 is acyclic (checked) but would make C6 wait on T0. Whether C6 should import T0's extension, or T0 should cite C6's Hilbert case, is left to the maintainer.
- PILLONI-20 route 8's Fargues-degree items and its Hodge–Tate items over O_K are also local, over O_K. The finding does not cover them, so they stay in T0. T3's canonical subgroups consume them, and T0 → T1 → T2 → T3 already holds. Moving them to R07.1/R07.2 would be a separate decision.
- Not verified: Fargues 2011's section numbers (§2.1.2, §2.2.3). I used them as the PILLONI-20 extraction cites them.

## Cross-finding adjustments (joint check)

The joint pass read all sections together and compiled every stage-graph change. There are eight new stages, 61 edge additions (60 distinct) and three deletions, together with 14 added and 13 deleted RS-05 links. It found no cycle. It found three conflicts, resolved as follows in the sections above.

- **C1 (/19 and /25).** Splitting AI.2 moves Fargues' equivalence with (T, Ξ) to AI.2:essential-surjectivity. The prismatic Dieudonné Part II that /25 routes into imports that equivalence from AI.2. So:
  - The Part II is named as a consumer of AI.2:essential-surjectivity.
  - Its import is split between AI.2 (full faithfulness) and AI.2:essential-surjectivity.
  - SW20's routes 9 and 7 are re-pointed to the new stages for Thm 14.1.1, Prop. 12.4.6, Thm 14.2.1 and Prop. 14.2.6, and for the [ϖ] = 0 charts.
- **C2 (/5 and /9).** RS-05's link DD.0 → R5 is a P0 forwarding link, decided under /5. R5's new reason therefore names only H0, D0 and E1. If P0 keeps its almost cotangent extension, the forwarding set also gains DD.0 → R5:sousperfectoid and DD.0 → P8:primitive.
- **C3 (/17).** The new sub-stage RF2:div1-properness gets the edge RF2 → RF2:div1-properness. Otherwise `scripts/theory_graph.py` would make RF2 require it, and H0, C4 and S5 would become ancestors of RF2, BG0 and GS0:loop-geometry.

Stage names that recur across roadmaps are written with their roadmap wherever they could be confused:

- "P8" is PerfectoidSpaces:P8 in /1 and PadicHodgeTheory:P8 in /24.
- RS-05 has layers S0, S3, S5 and S6 in both DiamondSixOperations and PerfectoidShimuraVarieties; the sections say which roadmap each one is.

## Order of application

1. Atlas and README edits first. The checkers `check_restructure.py` and `check_paper.py` reject stage ids that are not yet in `data/atlas.json`.
2. Then the RS-05 and RS-20 entries.
3. Then the paper routes and their review entries. make_queue applies a route only when its review accepts it; /7's new route 8 needs one.
4. Then packet and decomposition notes.

For the Kedlaya–Liu extraction, /10 edits route 4. The extraction's checkpoint 3 (PR #4634) extends that route without renumbering it, so the edit applies to either version.
