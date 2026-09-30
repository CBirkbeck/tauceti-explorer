# RT-PAPER-SCHOLZE-12: red team of the extraction of Scholze, *Perfectoid spaces*

Red team: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #4604).

**Target.** `PAPER-SCHOLZE-12` extracts P. Scholze, *Perfectoid spaces*, [Publ. Math. IHÉS 116 (2012), 245–313](https://doi.org/10.1007/s10240-012-0042-x), arXiv:1111.4914. The extraction has:

- 153 items: 13 library, 112 planned, 28 missing;
- 6 routes: four source routes, of which the review rejected route 3, and two Part IIs;
- 11 source issues, E1–E11.

**Who did what.**

- Claude Code `cc-39fac3` wrote the extraction (issue #4544, PR #4556).
- Claude Code `cc-fb70e5` wrote the review `REV-PAPER-SCHOLZE-12` (PR #4572).
- I did neither. The string `cc-f805bf` occurs in none of the four target files.

**Disclosure.**

- This session wrote **PAPER-SCHOLZE-13**. No finding touches it.
- This session reviewed **PAPER-KEDLAYA-LIU-15** (PR #4673). Finding 3 cites its accepted item 249 as evidence that item 23 is planned.
- This session reviewed **PAPER-SCHOLZE-17** (PR #4688) and **PAPER-FARGUES-FONTAINE-18** (PR #4683). No finding relies on either.
- This session red-teamed **ANDRE-18-B** (PR #4735). Its confirmed finding /1 showed that source routes into finished blueprints are never applied. **Finding 4** is the same defect for different items of a different extraction. It is recorded because it recurs here; it does not repeat /1's items.
- This session red-teamed **BMS18** (PR #4748). No finding relies on it.
- **Finding 1** extends the confirmed RT-AREA-algebraicgeometry/34, which I did not write. That finding covered BKV's toric Part II. This one covers S12's route 5, which the pending design job actually carries, and the Deligne-weights parent.

**Result: 12 findings: 2 high, 5 medium, 5 low.** The machine-readable file is [RT-PAPER-SCHOLZE-12.result.json](RT-PAPER-SCHOLZE-12.result.json).

- **Where the work is sound.**
  - All 153 statements match the published text, with the recorded misprints corrected.
  - The 79 library citations exist at the pins.
  - All eleven source issues check out, and I agree with the review's 9 confirmations and 2 rejections.
  - No published erratum exists, and I found no new mistake.
  - P0–P3 and P7 plan almost everything in §§3–7, mostly in greater generality than the paper.
  - The route order has no cycle.
- **Where it breaks.**
  - *Queue mechanics.* The two Part IIs collide with Part IIs that accepted restructurings already created. Route 5's coalescence with BKV does not happen. Source routes into finished blueprints are never applied.
  - *Statuses.* Item 23 is planned but marked missing. Items 37, 106, 15 and 29 are marked planned but are not.
  - *Owners.* Route 5 re-plans P2's approximation induction. Route 6 would own the weight–monodromy predicate and leaves Huber's 1998 theorem without an owner.

## Source

| Text | Where | SHA-256 |
| --- | --- | --- |
| Published article, Publ. Math. IHÉS 116 (2012), 69 pp. | [Centre Mersenne PDF](https://pmihes.centre-mersenne.org/item/10.1007/s10240-012-0042-x.pdf) | `7e7f7a3b…f7814a` (matches) |
| arXiv v1 (21 November 2011), the only version | [arxiv.org/pdf/1111.4914v1](https://arxiv.org/pdf/1111.4914v1) | `065441a8…18e7b` (matches) |

- **Fetched:** both on 30 September 2026.
- **Reading.** I read the whole published text myself. Pages 284 and 307 were checked on rendered images.
- **Help.** Three sub-agents did (a) the library check, (b) the check of the 112 planned statuses against packets and stage texts, and (c) the routes and queue mechanics. I re-checked every finding at its evidence.
- **Errata.** None is known:
  - The [author's papers page](https://people.mpim-bonn.mpg.de/scholze/papers.html) lists an erratum only for *p-adic Hodge theory for rigid-analytic varieties*.
  - Crossref records no update for the DOI.
  - The later work that follows Theorem 9.6 names no error in it: arXiv:2303.05610, Binda–Kato–Vezzani arXiv:2207.00369, Saito's notes and Scholze's CDM survey.
- **A candidate mistake I rejected.** Theorem 9.4 is stated for X proper smooth over C ∖ {x}, while the proof of 9.6 applies it to an alteration Z′ with bad reduction at several places. This is not a gap. The curve C need not be proper, and Deligne's Weil II (1.8.1)–(1.8.4) ([Numdam](http://www.numdam.org/item/PMIHES_1980__52__137_0.pdf)) works over any open U₀ = X₀ − S₀.

## High

### 1. Routes 5 and 6 each create a second Part II of an already-extended parent

- **Kind:** duplicate.
- **Where:** research/blueprint/papers/PAPER-SCHOLZE-12.result.json: route 5 (part-ii, parent tauceti:TauCetiRoadmap/AnalyticToricGeometry, 'Analytic toric geometry, Part II: nonarchimedean models and perfectoid approximation') and route 6 (part-ii, parent DeligneWeightsAndPurity, 'Deligne weights, purity and the Weil bounds, Part II: the ℓ-adic weight–monodromy conjecture for toric complete intersections'); review.json route verdicts 5, 6; queue jobs DESIGN-AnalyticToricGeometryPartII (#4583) and DESIGN-DeligneWeightsAndPurityPartII (#4584)

**What is wrong.**

Both part-ii routes give a parent a second Part II. Accepted restructurings have already made an existing roadmap the Part II of each parent. RS-32 extends tauceti:TauCetiRoadmap/AnalyticToricGeometry by ShimuraCompactifications, titled 'Analytic toric geometry, Part II: arithmetic toroidal compactifications'. RS-17 extends DeligneWeightsAndPurity by WeightsInEtaleCohomology, titled 'Deligne weights, purity and the Weil bounds, Part II: Arithmetic cohomology and eigenform applications'. make_queue is meant to switch to a Part III when the parent already has a Part II, but it tests for the id '<base>PartII'. The two existing Part IIs keep their own ids, so the test misses both. The queue therefore holds two pending design jobs, both open as issues and titled '…, Part II'. Each would create a sibling of the existing Part II under the same designation. The toric one would also plan toric schemes over base rings a second time: ShimuraCompactifications C0 keeps 'extension of affine toric charts to the required base rings' (route 5's own brief imports C0/relative-torus-embedding and C0/relative-face-open). Neither the route nor the review mentions RS-32 or RS-17. For the toric parent, the confirmed finding RT-AREA-algebraicgeometry/34 already recorded the clash for the BKV proposal. That finding did not cover this extraction's route or the Deligne-weights parent, and BKV's routes are now not accepted, so route 5 is the proposal the pending job actually carries.

**Evidence.**

research/blueprint/restructure/RS-32.result.json line 5: roadmaps.ShimuraCompactifications {"action": "extend", "extends": "tauceti:TauCetiRoadmap/AnalyticToricGeometry", "title": "Analytic toric geometry, Part II: arithmetic toroidal compactifications"}; REV-RS-32.md: 'Verdict: accepted after corrections'. research/blueprint/restructure/RS-17.result.json line 13: roadmaps.WeightsInEtaleCohomology {"action": "extend", "extends": "DeligneWeightsAndPurity", "title": "Deligne weights, purity and the Weil bounds, Part II: Arithmetic cohomology and eigenform applications"}; REV-RS-17.md: 'Verdict: accepted, with two corrections made in place'. research/blueprint/make_queue.py lines 434–437: 'part, rid, built = "Part II", base + "PartII", "" / if rid in roadmaps: part, rid = "Part III", base + "PartIII"'. research/blueprint/queue.json line 16376 'DESIGN-AnalyticToricGeometryPartII' (pending, name 'Analytic toric geometry, Part II') and line 16419 'DESIGN-DeligneWeightsAndPurityPartII' (pending); issues #4583 and #4584 are open, and each body says 'The roadmap is "… , Part II" … The paper extractions propose 1 continuation', the continuation being PAPER-SCHOLZE-12's route. RT-AREA-algebraicgeometry/34 (confirmed): 'Toric schemes X(Σ) … are planned twice, as two different Part IIs of AnalyticToricGeometry.'

**Fix.**

In PAPER-SCHOLZE-12.result.json, retitle route 5 'Analytic toric geometry, Part III: nonarchimedean models and perfectoid approximation', with ShimuraCompactifications (the Part II) as its first prerequisite. Its leaf (1) imports ShimuraCompactifications:C0's toric schemes over base rings and adds only what C0 lacks: fan gluing over a nonarchimedean field and its valuation ring, formal completion and adic and perfectoid toric spaces. Retitle route 6 'Deligne weights, purity and the Weil bounds, Part III: …', with WeightsInEtaleCohomology as its first prerequisite, and have its brief say where R34.6 stops. Maintainer: in make_queue.paper_designs, treat a parent as already having a Part II when an accepted RS result extends it (roadmaps[*].extends == parent), not only when '<base>PartII' exists. Hold issues #4583 and #4584 until the queue is regenerated.

### 4. Propositions 2.27 and 2.29 are routed to a finished blueprint and stay planned nowhere

- **Kind:** missing.
- **Where:** research/blueprint/papers/PAPER-SCHOLZE-12.result.json: route 4 (source, AdicEtaleGeometry:A1) with items PAPER-SCHOLZE-12/31 (Proposition 2.27) and PAPER-SCHOLZE-12/33 (Proposition 2.29); review.json route 4 verdict

**What is wrong.**

Items 31 and 33 are routed to a layer whose blueprint is finished and accepted, so after the route is applied they are still planned nowhere. Item 31 is Proposition 2.27, points of Spa(R, R⁺) ↔ maps to complete affinoid fields with dense image. Item 33 is Proposition 2.29: x ≻ y iff K ≅ L and L⁺ ⊂ K⁺, and the generalisations of y form a chain of length the rank. A source route is applied only by appending the paper to the roadmap's blueprint prompt. BP-AdicEtaleGeometry is done, and REV-AdicEtaleGeometry is done with A1 at coverage source_decomposed. Nothing re-runs a finished blueprint for an added source; the SRC-* jobs only re-pin bibliography. Both statements lie on the paper's path: Proposition 2.27 is how Corollary 6.7(iii) proves surjectivity and how Theorem 7.9 localises at points, and Proposition 2.29 is used for tilde-limits (Proposition 7.16). A1 is also a doubtful owner. Its stage is about étale and finite étale sites; the field pairs it insists on are for geometric points. These are point-set facts about Spa, Huber 1996 (1.1.6)–(1.1.10). The AdicSpacesPartII packet already asks the anchor's Layer 5 for 'the completed residue affinoid field κ(y) … with its canonical morphism', and builds κ(y) and Spa κ(y) → Y in R0/fibre-over-point. Disclosure: this is the defect of RT-PAPER-ANDRE-18-B/1 (confirmed), filed by this session for another paper's source routes into finished PerfectoidSpaces and AdicSpacesPartII blueprints. It is repeated here only because a different extraction repeats it for different items.

**Evidence.**

research/blueprint/make_queue.py lines 912–914: 'if route["route"] == "source": ADDED_SOURCES.setdefault(route["roadmap"], []).append(…)', used only at line 1018 'add_blueprint(rid, …, extra=added_sources(rid), …)'. research/blueprint/queue.json line 21287: BP-AdicEtaleGeometry state done; REV-AdicEtaleGeometry done; research/blueprint/packets/AdicEtaleGeometry.json coverage for AdicEtaleGeometry:A1: status 'source_decomposed'. research/blueprint/make_source_jobs.py docstring: 'Re-pin roadmap citations from books nobody can open onto sources anyone can read.' A search of all packets and decompositions for Proposition 2.27/2.29 content (affinoid-field bijection with dense image; specialisation as inclusion of valuation rings; chain of generalisations of length the rank) finds only AdicSpacesPartII:R0/fibre-over-point (κ(y), 'the image of k(p(z)) is dense in k(z)') and ClassicalAdicEtaleCohomology:H2 nodes for Spa(C, C⁺) only. Paper p. 263: 'Proposition 2.27. — … The points of Spa(R, R⁺) are in bijection with maps (R, R⁺) → (K, K⁺) to complete affinoid fields (K, K⁺) such that the quotient field of the image of R in K is dense.' 'Proposition 2.29 … x ≻ y if and only if K ≅ L as topological R-algebras and L⁺ ⊂ K⁺ … a totally ordered chain of length exactly the rank'.

**Fix.**

Re-route items 31 and 33 to AdicSpacesPartII:R0, next to R0/fibre-over-point and the κ(y) request to the anchor. Because BP-AdicSpacesPartII is also done, the route must be carried out by a packet amendment, not by an added source. Maintainer: open a targeted amendment job, or have the fix job add two R0 nodes, one for points of Spa as maps to complete affinoid fields with dense image and one for specialisation as inclusion of valuation rings with the chain of generalisations. Maintainer: until make_queue can apply source routes to finished blueprints, reviewers should reject source routes of missing items into layers whose blueprint job is done.

## Medium

### 2. The routes cross-reference roadmap ids and a BKV coalescence the queue never creates

- **Kind:** error.
- **Where:** research/blueprint/papers/PAPER-SCHOLZE-12.result.json: route 5 (roadmap AnalyticToricGeometryNonarchimedeanPartII; brief 'This route coalesces with AnalyticToricGeometryNonarchimedeanPartII as proposed by PAPER-BINDA-KATO-VEZZANI-25'; exports to DeligneWeightsPartIIWeightMonodromy, MotivesRigidAnalyticPartII, PadicWeightMonodromyPartII) and route 6 (roadmap DeligneWeightsPartIIWeightMonodromy; imports AnalyticToricGeometryNonarchimedeanPartII); review.json route 5 verdict

**What is wrong.**

The routes cross-reference roadmap ids that the queue never creates, and route 5 bases its design on a coalescence that does not happen. First, paper_designs groups part-ii routes by parent only and names the roadmap '<base>PartII'. The design jobs are therefore AnalyticToricGeometryPartII and DeligneWeightsAndPurityPartII (or Part III ids after finding 1), so route 6's import of 'AnalyticToricGeometryNonarchimedeanPartII' and route 5's export to 'DeligneWeightsPartIIWeightMonodromy' name nothing. Second, the review of PAPER-BINDA-KATO-VEZZANI-25 has verdict 'revise', and accepted_routes drops all its routes. So BKV's Part II, MotivesRigidAnalyticPartII and PadicWeightMonodromyPartII are not queued, and the design job carries route 5 alone ('1 continuation'). Route 5's brief still relies on BKV's material ('BKV gap G12', 'BKV's O(2,0) and nonreduced-equation tests', exports 'as BKV proposed'), but the design prompt quotes only the opening of this brief and never points to the BKV result file. The review accepted the coalescence with the words 'BKV route 14 has the same id, title, parent and area', which the queue does not use.

**Evidence.**

research/blueprint/make_queue.py line 423: 'key = ("part-ii", route["parent"]) if route["route"] == "part-ii" else ("new", route["roadmap"])' and line 434 'rid = base + "PartII"'. research/blueprint/papers/PAPER-BINDA-KATO-VEZZANI-25.review.json: "verdict": "revise". Issue #4583 body: 'The paper extractions propose 1 continuation in this direction', listing only 'Analytic toric geometry, Part II: nonarchimedean models and perfectoid approximation, from Scholze, "Perfectoid spaces" … (16 items)'. Route 6 brief: 'Imports: … AnalyticToricGeometryNonarchimedeanPartII'. Route 5 brief: 'Exports: π, Proposition 8.6 and Corollary 8.8 to DeligneWeightsPartIIWeightMonodromy (ℓ-adic) and, as BKV proposed, to MotivesRigidAnalyticPartII and PadicWeightMonodromyPartII.'

**Fix.**

In routes 5 and 6, name each other by title and by the ids the queue generates (see finding 1), not by the chosen ids. In route 5, delete the exports to MotivesRigidAnalyticPartII and PadicWeightMonodromyPartII. Replace 'This route coalesces with …' by a sentence saying that BKV's toric proposal is under revision and should import this roadmap when resubmitted. Where the brief relies on BKV (gap G12, the O(2,0) and nonreduced-equation tests), state the content in the brief itself and give the file path research/blueprint/papers/PAPER-BINDA-KATO-VEZZANI-25.result.json.

### 3. Item 23 (maps into an affinoid adic space) is planned at AdicEtaleGeometry:A1, not missing

- **Kind:** error.
- **Where:** research/blueprint/papers/PAPER-SCHOLZE-12.result.json: item PAPER-SCHOLZE-12/23 (status missing) and route 2 (source, AdicSpacesPartII R0–R2, reason 'One recalled result has no owner'); review.json route 2 reason ('Neither Foundations of adic spaces Layer 5 nor the AdicSpacesPartII packet states it')

**What is wrong.**

Item 23 is Proposition 2.19, maps into an affinoid adic space: Hom(Y, Spa(R, R⁺)) = Hom((R̂, R̂⁺), (𝒪_Y(Y), 𝒪_Y⁺(Y))) for sheafy (R, R⁺), Huber 1994 Proposition 2.1(ii). It is planned, not missing. The accepted AdicEtaleGeometry packet states it as node A1/maps-from-adic-spaces-to-yoneda-affinoids, for every complete Huber pair, and says that for sheafy pairs it is Huber 1994 Proposition 2.1(ii). The accepted extraction PAPER-KEDLAYA-LIU-15 marks the same statement (item 249) planned by AdicEtaleGeometry:A1. The AdicSpacesPartII packet uses the statement as an imported proof step in R0/affinoid-fibre-product ('imported from the anchor's Layer 5'), and several packets request it from Tau Ceti AdicSpaces Layer 5. The PerfectoidSpaces P2 API plans the perfectoid case as PerfectoidSpace.spaHomEquiv. Routing item 23 as new R0 material would give it a second owner. The review's reason is half wrong: Layer 5 indeed does not state it, but the AdicSpacesPartII packet does use it, as an import.

**Evidence.**

research/blueprint/packets/AdicEtaleGeometry.json line 8777, node AdicEtaleGeometry:A1/maps-from-adic-spaces-to-yoneda-affinoids: 'For every (A, A⁺) ∈ CAff, sheafy or not, there is a bijection, natural in X and (A, A⁺), between morphisms X^Y → Spa^Y(A, A⁺) … and morphisms of pairs (A, A⁺) → (O_X(X), O_X⁺(X)) … For (A, A⁺) sheafy and X^Y replaced by X, this is Huber 1994, Proposition 2.1(ii).' The packet's review list marks it 'verified'. research/blueprint/packets/AdicSpacesPartII.json line 7717 (R0/affinoid-fibre-product proof step): 'morphisms X → Spa R correspond bijectively and naturally to morphisms of pairs (R, R⁺) → (O_X(X), O_X⁺(X)) (Huber 1994 Proposition 2.1(ii), Wedhorn Proposition 8.25; imported from the anchor's Layer 5)'. PAPER-KEDLAYA-LIU-15 item 249: 'For each adic space X, the global sections functor induces a bijection between morphisms X → Spa~(A, A⁺) … and morphisms A → O_X(X) …', status planned, planned ['AdicEtaleGeometry:A1']. Paper p. 258, Proposition 2.19 [20, Proposition 2.1(ii)]: 'Hom(Y, X) = Hom((R̂, R̂⁺), (O_Y(Y), O_Y⁺(Y)))'.

**Fix.**

Set item 23 to planned, planned ['AdicEtaleGeometry:A1'], with a note naming node AdicEtaleGeometry:A1/maps-from-adic-spaces-to-yoneda-affinoids (general pairs; the sheafy case through A1/adic-spaces-in-yoneda-adic-spaces). Note also that the Tau Ceti anchor's Layer 5 is asked for the same statement, so that one of the two supplies it. Remove item 23 from route 2, and rewrite route 2's reason so that it names only planned items 25 and 26. In the review file, correct the route 2 reason.

### 5. Items 37 (deeply ramified fields) and 106 (Proposition 7.7) are not planned by P3

- **Kind:** error.
- **Where:** research/blueprint/papers/PAPER-SCHOLZE-12.result.json: items PAPER-SCHOLZE-12/37 (Remark 3.3, status planned at PerfectoidSpaces:P3) and PAPER-SCHOLZE-12/106 (Proposition 7.7, status planned at PerfectoidSpaces:P3); route 1 reason ('plans every item of §§3–7'); PAPER-SCHOLZE-12.md summary

**What is wrong.**

Two items of §§3–7 are marked planned at P3, but the P3 nodes exclude them. Item 37 is Remark 3.3: a perfectoid field is deeply ramified, and a complete deeply ramified field of rank one is perfectoid (Gabber–Ramero Proposition 6.6.6). The item's note says P3/finite-extensions-of-perfectoid-fields 'records Gabber–Ramero Propositions 6.3.6, 6.6.2 and 6.6.6 as its inputs'. The node says the opposite: the ramification-theoretic proof 'is not the route planned here'. 'Deeply ramified' occurs in no packet or stage text. Item 106 is Proposition 7.7: in characteristic p, an étale map of perfectoid spaces is locally U = U₀ ×_{V₀} V for an étale map of affinoid noetherian adic spaces. The P3 node that mentions it says it 'is not needed', and no node states it. Route 1's reason, 'plans every item of §§3–7', is therefore false, and so is the report's '90-odd items are planned by P0–P3, P5 and P7'. Both are proved in the paper, and 7.7 is used for Corollary 7.8.

**Evidence.**

research/blueprint/packets/PerfectoidSpaces--P0.json line 19498, node PerfectoidSpaces:P3/finite-extensions-of-perfectoid-fields, hypothesis: 'An alternative, ramification-theoretic proof (Gabber–Ramero Propositions 6.6.2 and 6.6.6: L°a/K°a étale for deeply ramified K; 6.3.6: finite projectivity) is not the route planned here.' Line 20875, node PerfectoidSpaces:P3/strongly-finite-etale-maps-are-affinoid-over-affinoids: 'Scholze 2012 Proposition 7.7 (in characteristic p, étale maps are locally base changes of étale maps of noetherian affinoid adic spaces) is not needed for this.' Item 37 note: 'the P3 node PerfectoidSpaces:P3/finite-extensions-of-perfectoid-fields records Gabber–Ramero Propositions 6.3.6, 6.6.2 and 6.6.6 as its inputs for that proof.' Paper p. 264, Remark 3.3: 'Proposition 6.6.6 of [15] says that a perfectoid field K is deeply ramified, and conversely, a complete deeply ramified field with valuation of rank 1 is a perfectoid field.' Paper p. 299, Proposition 7.7, and Corollary 7.8's proof: 'The first part follows directly from the previous proposition and the result for locally noetherian adic spaces'.

**Fix.**

Set items 37 and 106 to missing and route them to a source route for PerfectoidSpaces P3. Because BP-PerfectoidSpaces--P0 is done, make this a packet amendment adding two P3 nodes: 'perfectoid = complete deeply ramified of rank one' (with Gabber–Ramero §6.6 as a prerequisite) and 'étale maps in characteristic p descend locally to noetherian adic spaces'. Alternatively, record in the notes that the packet deliberately omits them and that no consumer needs them; Corollary 7.8 is P3/etale-morphisms-composition-base-change-open, whose proof must then not cite 7.7. Delete 'plans every item of §§3–7' from route 1's reason and correct the report.

### 6. Route 5 re-plans the approximation induction that P2 already plans

- **Kind:** duplicate.
- **Where:** research/blueprint/papers/PAPER-SCHOLZE-12.result.json: route 5 brief, leaf (5) ('the homogeneous approximation lemma for R_D, proved by the explicit induction of Lemma 6.5: steps c ↦ c + a …'); item PAPER-SCHOLZE-12/133

**What is wrong.**

Route 5 asks the new toric roadmap to reprove the approximation induction of Lemma 6.5. PerfectoidSpaces P2 already plans that induction, for the homogeneous graded perfected Tate algebra over any perfectoid Tate base. The paper itself says 'the analogue of Lemma 6.5 holds true for R, with the same proof'. What Proposition 8.7 needs beyond the P2 node is the same statement for the graded ring R_D, the completed direct sum of H⁰(X^perf, 𝒪(jD)) over j ∈ ℤ[1/p], in place of the polynomial ring. That is a generalisation of the P2 node, not new mathematics for a toric roadmap. Planning the induction a second time violates PROTOCOL §15 (plan a general notion once, in its owner). Leaf (1) also rebuilds Gordan finite generation and fan gluing. It asks for no compatibility with the complex construction of Tau Ceti Analytic toric geometry Layer 0 (§15, last bullet).

**Evidence.**

research/blueprint/packets/PerfectoidSpaces--P0.json line 14218, node PerfectoidSpaces:P2/approximation-on-perfectoid-polydisc: 'Let R₀ be a perfectoid Tate ring … P = R₀⟨T₀^{1/p^∞}, …, T_n^{1/p^∞}⟩ … graded by total degree in T with values in Z[1/p]_{≥0} … Let f ∈ P° be homogeneous of degree d. Then for every rational c ≥ 0 and every ε ∈ Z[1/p] with 0 < ε < 1 there is g ∈ P♭° homogeneous of degree d such that … |f(x) − g♯(x)| ≤ |ϖ^{1−ε}(x)| · max(|f(x)|, |ϖ^c(x)|).' Paper p. 306, proof of Proposition 8.7: 'Now the analogue of Lemma 6.5 holds true for R, with the same proof.' Route 5 brief leaf (5): 'the homogeneous approximation lemma for R_D, proved by the explicit induction of Lemma 6.5: steps c ↦ c + a with 0 < a < ε in ℤ[1/p], the shrinking error ε(c), … and the correction g_{c′} = g_c + Σ_i …'.

**Fix.**

Rewrite leaf (5) of route 5's brief. It should import PerfectoidSpaces:P2/approximation-on-perfectoid-polydisc and ask PerfectoidSpaces, through a requests entry, to state that node for ℤ[1/p]-graded perfectoid algebras whose graded pieces are Banach spaces with orthonormal bases of characters (the perfected monoid algebras of rational cones). The toric roadmap then keeps only the identification of R_D with such an algebra and its tilt. In leaf (1), add a comparison with the complex toric scheme of Analytic toric geometry Layer 0 for the base ring ℂ.

### 7. Route 6 would own the weight–monodromy predicate that other layers already use

- **Kind:** duplicate.
- **Where:** research/blueprint/papers/PAPER-SCHOLZE-12.result.json: item PAPER-SCHOLZE-12/140 (status missing) and route 6 brief ('Define first … the predicate "V satisfies weight-monodromy of weight i"'); review.json notes ('no stage text or packet API defines it, so the Part II should state it in that form too')

**What is wrong.**

Route 6 would make a leaf roadmap own the weight–monodromy predicate. That roadmap depends on PerfectoidSpaces and on toric geometry. The predicate is a basic notion that other layers already use. For a Weil–Deligne representation, 'gr^N_j is pure of weight w + j' is the Taylor–Yoshida purity in PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates ('strictly pure'). The monodromy-weight purity of AutomorphicGaloisRepresentations:R19.3/strict-compatibility-and-the-monodromy-weight-purity spells it out eigenvalue by eigenvalue. WeightsInEtaleCohomology R34.6 asks to 'State the exact local monodromy-weight theorem needed'. The review noticed that R24.5 and AG2.6 use it, but left the definition in the Part II. Either the consumers import a heavy downstream roadmap for a definition, or the predicate is defined two or three times. The definitional half of item 140 belongs with the monodromy filtration and the Weil-number weights, which are LPV.1 and DWP.0/DWP.5. Only the conjecture for a variety, and Scholze's case of it, belong to the Part II.

**Evidence.**

research/blueprint/packets/PotentialModularityAndCompatibleSystems--R24.3.json line 1614, node R24.5/compatible-system-predicates: 'strictly compatible if for each finite v there is a Weil–Deligne representation WD_v(ℛ) … strictly pure if strictly compatible with each WD_v(ℛ) pure of weight w'. research/blueprint/packets/AutomorphicGaloisRepresentations.json line 1861, node R19.3/strict-compatibility-and-the-monodromy-weight-purity: 'the monodromy filtrations of the Weil-Deligne representations … are pure of weight w-1; concretely, for any lifting F of the geometric Frobenius, an eigenvalue alpha of 'rho(F) has weight w-1 if N = 0 …'. research/blueprint/atlas/roadmaps/WeightsInEtaleCohomology.json, R34.6: 'State the exact local monodromy-weight theorem needed for any local–global application; unresolved general weight–monodromy is not an assumption.' Paper p. 308, Conjecture 9.3; p. 250, the monodromy filtration and Conjecture 1.14.

**Fix.**

Split item 140 into (a), the definition, 'a Frobenius-semisimple Weil–Deligne representation (or ℓ-adic representation of G_k) satisfies weight–monodromy of weight i', and (b), the conjecture for H^i of a proper smooth variety. Mark (a) missing but route it to the owner of the monodromy filtration, LefschetzPencilsAndVanishingCycles LPV.1 or DeligneWeightsAndPurity DWP.5, as a request or packet amendment. Record in its note that R19.3, R24.5 and R34.6 should import it. Keep (b) and the theorem items in route 6, and change route 6's brief from 'Define first …' to 'Import the predicate from …'.

## Low

### 8. Items 68, 69 and 72 cite stages that do not plan them

- **Kind:** error.
- **Where:** research/blueprint/papers/PAPER-SCHOLZE-12.result.json: items PAPER-SCHOLZE-12/68 and /69 (planned ['SchemeAndStackFoundations:SF.4', 'DerivedDeRhamCohomology:DD.0']) and PAPER-SCHOLZE-12/72 (planned ['PerfectoidSpaces:P1'])

**What is wrong.**

The planned owners cited for the deformation theory of Theorems 5.11–5.12 and of Remark 5.15 do not plan it. Theorems 5.11 and 5.12 are Illusie's obstruction theory for flat square-zero deformations (Ext², torsor Ext¹, automorphisms Ext⁰) and for lifting morphisms. SF.4 is 'infinitesimal lifting and obstruction complexes; formal schemes, algebraization, semistable reduction and alterations', with no cotangent-complex obstruction. DD.0's stage text builds L_{B/A} but states neither obstruction; the PerfectoidSpaces packet has an open request to DD.0 for exactly these. The nodes that do plan them are P0/almost-deformation-theory and P0/almost-morphism-lifting. Both work over any basic setup, so the setup with m = V gives Illusie's classical case. Item 72, the almost cotangent complex, is P0/almost-cotangent-complex, not P1.

**Evidence.**

research/blueprint/atlas/roadmaps/SchemeAndStackFoundations.json, SF.4: 'Develop infinitesimal lifting and obstruction complexes; formal schemes, algebraization, semistable reduction and alterations.' research/blueprint/packets/PerfectoidSpaces--P0.json requests, supplier DerivedDeRhamCohomology:DD.0: '(f) the obstruction theory for flat square-zero deformations of a flat algebra (obstruction in Ext², torsor under Ext¹, automorphisms Ext⁰; Illusie III.2.1.2.3) and for lifting morphisms (obstruction in Ext¹, torsor under Ext⁰; Illusie III.2.2.2)'. Same file line 6784, P0/almost-deformation-theory: 'Let S be a basic setup … ω(B̃, f₀) = 0 iff there is a flat deformation of C₀ over B …'; line 6854, P0/almost-morphism-lifting: 'the obstruction to lifting f₀ lies in Ext¹(L^a_{C₀/B₀}, C₀′ ⊗ I) and lifts form a torsor under Hom(L^a_{C₀/B₀}, C₀′ ⊗ I)'; line 6306, P0/almost-cotangent-complex. Paper p. 277, Theorems 5.11–5.12; p. 278, Remark 5.15.

**Fix.**

Items 68 and 69: planned ['PerfectoidSpaces:P0', 'DerivedDeRhamCohomology:DD.0'], with notes naming P0/almost-deformation-theory and P0/almost-morphism-lifting (the classical case is the basic setup m = V) and the open P0 request (f) to DD.0; drop SF.4. Item 72: planned ['PerfectoidSpaces:P0'], naming P0/almost-cotangent-complex and P0/almost-cotangent-comparison-classical.

### 9. Items 15 and 29 are marked planned but no layer states them

- **Kind:** error.
- **Where:** research/blueprint/papers/PAPER-SCHOLZE-12.result.json: items PAPER-SCHOLZE-12/15 (Proposition 2.11, planned at tauceti:TauCetiRoadmap/AdicSpaces Layer 3) and PAPER-SCHOLZE-12/29 (Proposition 2.25, planned at PerfectoidSpaces:P2 and AdicSpaces Layer 3)

**What is wrong.**

Two §2 items are marked planned, but no layer or node states them. Item 15 is Spa(R̂, R̂⁺) ≅ Spa(R, R⁺), identifying rational subsets (Huber [19, 3.9], Wedhorn 7.48). The item's own note says AdicSpaces Layer 3 'needs' it, and the atlas treats it as an open request: the PerfectoidSpaces packet says the anchor's Layer 2 'references but does not list [it] as a target (requests.json)'. Item 29 is Proposition 2.25, for any affinoid k-algebra: the ϖ-adic completion of 𝒪⁺_{X,x} equals that of k(x)⁺, because the kernel of 𝒪⁺_{X,x} → k(x)⁺ is ϖ-divisible. P2/completed-residue-fields covers only perfectoid pairs and states a different identity (k(x)^⁺ as the completion of the image of the stalk). AdicSpaces Layer 3.3 plans stalks but not this.

**Evidence.**

research/blueprint/packets/PerfectoidSpaces--P0.json line 25843: 'The completion step is imported: Spa(Â, Â⁺) → Spa(A, A⁺) is a homeomorphism matching rational subsets (Wedhorn 7.48, Huber 1993, 3.9), which the anchor's Layer 2 references but does not list as a target (requests.json).' Item 15 note: 'Not in Tau Ceti at the pin (Wedhorn Proposition 7.48). AdicSpaces Layer 3 needs it'. P2/completed-residue-fields: 'Let (R, R⁺) be a perfectoid Tate pair … Explicitly, k(x)^⁺ is the ϖ-adic completion of the image in k(x) of colim_{U ∋ x} O_X⁺(U)'. Paper p. 262–263, Proposition 2.25 and proof: 'It is enough to note that kernel of the map O⁺_{X,x} → k(x)⁺, which is also the kernel of the map O_{X,x} → k(x), is ϖ-divisible.'

**Fix.**

Item 15: keep it planned at the anchor only if the note says it is the open request to AdicSpaces Layer 2 recorded in the PerfectoidSpaces and AdicSpacesPartII packets. Otherwise mark it missing with that request as its owner. Item 29: mark it missing and add it to the AdicSpacesPartII R0 amendment of finding 4, next to κ(y), since it is a general statement about stalks of Spa of a Tate pair.

### 10. Theorem 2.24's global comparison has two unlinked owners

- **Kind:** duplicate.
- **Where:** research/blueprint/papers/PAPER-SCHOLZE-12.result.json: item PAPER-SCHOLZE-12/28 (planned at TropicalAndBerkovichArithmetic:TB.0) and item PAPER-SCHOLZE-12/27 (planned at ClassicalAdicEtaleCohomology:H3 by the review, route 3 rejected)

**What is wrong.**

Item 28 is Theorem 2.24's second part, for an arbitrary taut adic space locally of finite type: X_Berk is the set of rank-one points of X^ad, and the retraction is the maximal Hausdorff quotient. ClassicalAdicEtaleCohomology:H3/berkovich-taut-comparison (a) states exactly this. The item cites only TB.0, whose text is the strictly affinoid comparison, so the global statement now has two unlinked candidate owners. The review moved item 27 to the same H3 node. That node is titled 'Taut adic curves over Spa(C, O_C) and Berkovich curves', its stage is about curves, it 'is used only with k = C algebraically closed and X a smooth adic curve', and its packet review (REV-ClassicalAdicEtaleCohomology--H0) is pending. If that review narrows the node to curves, items 27 and 28 lose their owner.

**Evidence.**

research/blueprint/packets/ClassicalAdicEtaleCohomology--H0.json line 17397, node H3/berkovich-taut-comparison: '(a) Huber's functor gives an equivalence between Hausdorff strictly k-analytic Berkovich spaces and taut adic spaces locally of finite type over Spa(k, k°) … under it X^Berk is identified with the set of rank-one points of X^ad and the continuous retraction |X^ad| → |X^Berk| is the maximal Hausdorff quotient … The node is used only with k = C algebraically closed and X a smooth adic curve'. Packet status 'partial'; queue REV-ClassicalAdicEtaleCohomology--H0 not done. research/blueprint/atlas/roadmaps/TropicalAndBerkovichArithmetic.json TB.0: 'Compare a strictly affinoid algebra with its Huber adic spectrum by rank-one points/maximal generalizations'. Paper p. 262, Theorem 2.24.

**Fix.**

Item 28: planned ['ClassicalAdicEtaleCohomology:H3', 'TropicalAndBerkovichArithmetic:TB.0'], with a note that H3/berkovich-taut-comparison (a) owns the global statement and TB.0 the affinoid case. Record a link from H3 (a) to TB.0, so that the global statement is proved from the affinoid one rather than twice. Items 27 and 28: add a note that their status depends on REV-ClassicalAdicEtaleCohomology--H0 keeping (a) in the generality of arbitrary k and arbitrary taut spaces.

### 11. Huber's 1998 neighbourhood theorem (item 146) has no committed owner

- **Kind:** other.
- **Where:** research/blueprint/papers/PAPER-SCHOLZE-12.result.json: item PAPER-SCHOLZE-12/146 (Huber 1998, Theorem 3.6(a); route 6) and route 6 brief ('Prove or import Huber's theorem [Hub98, Theorem 3.6(a)]')

**What is wrong.**

Huber's theorem is that a closed subvariety's analytification has an open neighbourhood with the same torsion étale cohomology. It is a general theorem of étale cohomology of adic spaces, not part of weight–monodromy. Route 6 leaves it undecided ('Prove or import') and names no roadmap to import it from, so the design job can neither import it nor know that it owns it. Other accepted work also needs it: BKV's motivic argument cites the same theorem (arXiv:2207.00369, Remark 4.3, 'contrary to Huber's result [Hub98a, Theorem 3.6]'). ClassicalAdicEtaleCohomology H5, which already owns Huber's comparison theorems (item 147), is the natural owner.

**Evidence.**

Paper p. 309: 'By Theorem 3.6(a) of [21], there is some open neighborhood Ỹ of Y^ad_K in X^ad_{Σ,K} such that Ỹ_{C_p} and Y^ad_{C_p} have the same Z/ℓZ-cohomology.' Item 146 note: 'no stage plans it (ClassicalAdicEtaleCohomology H5 plans other Huber comparison and continuity results). Routed to the weight-monodromy Part II'. Route 6 brief: 'Prove or import Huber's theorem [Hub98, Theorem 3.6(a)]'. A search of all packets and stage texts for 'finiteness result for direct image', 'Hub98' and tubular or small-neighbourhood cohomology statements finds nothing else.

**Fix.**

Decide the owner. Either route item 146 as a source route to ClassicalAdicEtaleCohomology H5 (a packet amendment, since that blueprint is in review), with route 6 importing it; or keep it in route 6 and change the brief to 'Prove here Huber's theorem … in the generality of Hub98 Theorem 3.6(a)', stating its hypotheses.

### 12. Three library notes are inexact

- **Kind:** library-claim.
- **Where:** research/blueprint/papers/PAPER-SCHOLZE-12.result.json: notes of items PAPER-SCHOLZE-12/80, /39 and /20

**What is wrong.**

Three library notes are inexact at the pinned commits. (a) Item 80's note says Tau Ceti 'proves uniqueness and completeness of the module topology on finite modules over a complete Hausdorff noetherian Tate ring (OpenMapping.lean:306), which does not cover perfectoid rings'. The theorem has no noetherian hypothesis, and it assumes completeness of M rather than proving it. It applies to finite modules over any complete Tate ring with countably generated uniformity, perfectoid ones included. What it does not give is the paper's 'if A is complete and M is projective, then M is complete'. (b) Item 39's note says the tilt's valuation is planned. Mathlib already has a rank-one valuation PreTilt.val on K♭°; what is missing is its extension to Tilt and |x|♭ = |x♯|. (c) Item 20's note omits the transfer theorem IsStrictlyTopologicallyFiniteType.isStronglyNoetherian, which reduces 'tft ⇒ strongly noetherian' to k being strongly noetherian.

**Evidence.**

Tau Ceti f790474, TauCeti/RingTheory/Huber/OpenMapping.lean lines 266–268: 'variable {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [CompleteSpace A] [(𝓤 A).IsCountablyGenerated] [NonarchimedeanRing A] [IsTateRing A] {M : Type*} … [CompleteSpace M] [(𝓤 M).IsCountablyGenerated] [T0Space M] [Module A M] [ContinuousSMul A M] [Module.Finite A M]', line 306: 'theorem IsTateRing.isModuleTopology : IsModuleTopology A M'; its docstring: '`A` is **not** asked to be noetherian'. Mathlib 082e2d3, Mathlib/RingTheory/Perfection.lean line 790: 'noncomputable def PreTilt.val : Valuation (PreTilt O p) ℝ≥0'. Tau Ceti f790474, TauCeti/RingTheory/Huber/TopologicallyFiniteType.lean line 250: 'IsStrictlyTopologicallyFiniteType.isStronglyNoetherian … : IsStronglyNoetherian B' (with [IsStronglyNoetherian A]).

**Fix.**

Item 80 note: 'Tau Ceti's TauCeti.Huber.IsTateRing.isModuleTopology (OpenMapping.lean:306): a finite module over a complete first-countable Tate ring that is already complete and metrisable carries the module topology; completeness of a finite projective module (Remark 5.24) is not proved.' Item 39 note: cite mathlib:PreTilt.val and say that the extension to Tilt and the comparison with ♯ are planned by P1/tilt-of-perfectoid-field. Item 20 note: cite tauceti:TauCeti.Huber.IsStrictlyTopologicallyFiniteType.isStronglyNoetherian as the reduction to BGR 5.2.6.

## What I checked

- Authorship: the extraction is by Claude Code cc-39fac3 (PR #4556, issue #4544) and the review REV-PAPER-SCHOLZE-12 by Claude Code cc-fb70e5 (PR #4572). The string cc-f805bf occurs in none of PAPER-SCHOLZE-12.result.json, .md, .review.json or REV-PAPER-SCHOLZE-12.md.
- Source versions: published PDF https://pmihes.centre-mersenne.org/item/10.1007/s10240-012-0042-x.pdf (69 pp.) and arXiv v1 https://arxiv.org/pdf/1111.4914v1, both fetched 30 September 2026. Their SHA-256 hashes match the recorded ones (7e7f7a3b…f7814a, 065441a8…18e7b). The arXiv API lists only v1; /abs/1111.4914v2 returns 404.
- Errata search, 30 September 2026: the author's papers page https://people.mpim-bonn.mpg.de/scholze/papers.html lists an erratum only for 'p-adic Hodge theory for rigid-analytic varieties', none for Perfectoid spaces. Crossref for doi:10.1007/s10240-012-0042-x has no update-to or relation. Later literature that re-proves or extends Theorem 9.6 names no error in it: Scholze's CDM survey https://www.math.uni-bonn.de/people/scholze/CDM.pdf, T. Saito's talk notes https://www.ms.u-tokyo.ac.jp/~t-saito/talk/perf.pdf, arXiv:2303.05610 (abelian varieties) and Binda–Kato–Vezzani arXiv:2207.00369. BKV's Remark 4.3 notes only that their motivic variant needs smoothness, which Huber's theorem does not.
- The whole published text read, pp. 245–313, with pdftotext. Page images rendered for p. 284 (Theorem 6.3(iii) reads 'The presheaves O_X, O_{X♭} are sheaves'; item 96 agrees) and p. 307 (Proposition 9.1 'exp(Nt_ℓ(g))' and 'NΦ = qΦN'; E1 and item 138 checked).
- All 153 item statements compared with the paper text: §§1–2 items 1–33, §§3–5 items 34–81, §§6–7 items 82–117, §§8–9 items 118–153. Spot checks: item 51 'p ≠ 2' (for p = 2 we have p^{1/2} ∈ K and L = K); the monodromy-filtration formula of item 139 on a Jordan block of size 2; items 142–143 against the paper's Theorem 9.4 and Lemma 9.5.
- Every source issue E1–E11 checked at its locator, together with the review's verdicts: 9 confirmed and E5, E9 rejected. I agree with every verdict. E9's rejection argument (restrict Theorem 8.5(iii) for the complete fan of ℙ¹ to 𝔸¹, which φ preserves) was checked for the inverse-limit topology.
- Missed-mistake hunt in §9. (a) The Frobenius–N relation NΦ = qΦN was verified from ΦσΦ⁻¹ acting on t_ℓ by χ(Φ) = q⁻¹. (b) The proof of Lemma 9.9 was checked: both top-degree groups are one-dimensional, and a zero map would force the restriction of c_1(L)^{dim Y} to Z′ to vanish. (c) The direct-summand step from Poincaré duality and cup-product compatibility was checked. (d) I tested whether Theorem 9.4 ('proper smooth scheme over C ∖ {x}') is narrower than the use made of it for Z′, which has bad reduction at several places. It is not: Deligne's Weil II (1.8.1)–(1.8.4) (http://www.numdam.org/item/PMIHES_1980__52__137_0.pdf, read 30 September 2026) is for an open U₀ = X₀ − S₀ of a curve that need not be proper, so one takes C = U ∪ {x}. No finding. (e) Corollary 8.8's dimension and nonemptiness argument and the choice of Z geometrically irreducible over a global field (F_q(t^{1/p^n})) were checked. No new mistake was found.
- All 79 library declarations cited by items were opened at Mathlib 082e2d3 and Tau Ceti f790474. All exist with matching statements, except the note inaccuracies of finding 12. The checks include spectralSpace_spa_of_pairOfDefinition (any subring Aplus, stronger than the paper), spa_eq_empty_iff_subsingleton_quotient_closure_zero, isUnit_iff_forall_mem_spa_notMem_supp, mem_iff_forall_vle_one, IsStronglyNoetherian (R̂⟨T₁..Tₙ⟩ noetherian for all n), rationalSubset_insert_of_forall_vle, ContinuousLinearMap.isOpenMap, Fan and IsToricCone (Fan allows the empty fan; the paper says nonempty, which is harmless), PreTilt.untilt, WittVector.fontaineTheta and Specializes.
- Missing and planned items searched for in both libraries under several naming conventions: perfectoid, tilt, almost, Spa completion, maps into affinoids, affinoid fields, specialisation, toric schemes, weight-monodromy, tame character, quasi-unipotence and cup products on sites. grep -ril perfectoid over Tau Ceti f790474 returns nothing, and Mathlib's perfectoid material is Perfection.lean and RingTheory/Perfectoid/{Untilt,FontaineTheta,BDeRham}. No item marked missing is in either library.
- Every planned item (112) read against its cited stage text or packet node: PerfectoidSpaces--P0.json (P0–P7, 324 nodes) and --P8.json, AdicSpacesPartII, AdicEtaleGeometry, ClassicalAdicEtaleCohomology--H0, DeligneWeightsAndPurity--DWP.0, LefschetzPencilsAndVanishingCycles--LPV.0, ShimuraCompactifications--C0, TropicalAndBerkovichArithmetic, the atlas extracts for SF.2/SF.4/SF.5, DD.0, TB.0, H5, L5, EDC.2/EDC.3, R01.2, R34.6, and content/tau-ceti/AdicSpaces/README.md Layers 2–5. These are consistent, apart from findings 5, 8, 9 and 10: P0 almost mathematics over an abstract basic setup (items 44–57, including Theorems 4.11, 4.16, 4.17), P1 over perfectoid Tate rings (items 34–36, 38–40, 58–66, 70, 71, 73–77), P2 (items 82–99), P3 (items 1–3, 5, 41–43, 78, 79, 81, 100–105, 107–112), P7 (items 113–117), R1/R2 (items 25, 26), D0 (item 13), and items 131, 132, 136, 139, 142, 143, 147, 148, 153.
- Every node id cited in item notes exists in research/blueprint/packets. Every missing item was searched for across all packets, data/decompositions and research/blueprint/roadmaps; only item 23 turned out to be planned (finding 3). Item 140 is partly defined elsewhere (finding 7).
- Routes. Queue mechanics were read in research/blueprint/make_queue.py (paper_designs, added_sources) and research/blueprint/queue.json, along with the job states of the target blueprints and the open design issues #4583 and #4584. Accepted restructurings RS-17 and RS-32 were read with their reviews. Other part-ii routes on the same parents were checked: BKV routes 13–16 and CADORET-HUI-TAMAGAWA-17 route 4 are not accepted. Every stage and node id named in the briefs of routes 5 and 6 exists (DWP.0/4/5/7, LPV.1, R01.2, LocalFieldsRamification Layer 4, H0, H5, L5, EDC.2:pairings, EDC.3, SF.2, SF.5, AdicSpacesPartII F0/R0–R2, P1–P3, P7, A1, C0/relative-torus-embedding, C0/relative-face-open). The route order has no cycle: 9,510 stage edges plus link edges; no ancestor of the imports is R24.5, AG2.6, R34.6 or DWP.8–9, and nothing imports the new roadmaps.
- Other extractions of perfectoid material compared: KEDLAYA-LIU-15, SCHOLZE-17, ANDRE-18-B, BHATT-MORROW-SCHOLZE-18, FARGUES-FONTAINE-18, SCHOLZE-13 and BINDA-KATO-VEZZANI-25. Almost purity, tilde-limits and tilting route consistently to P3/P7, and KL15's item 249 supports finding 3. Red-team files RT-PAPER-ANDRE-18-B, RT-PAPER-BHATT-MORROW-SCHOLZE-18 and RT-AREA-algebraicgeometry were read for overlap. Findings 1 and 4 say what they extend.
- The review's in-place changes (commit 7d47ba0d) were checked. The six items it moved to planned exist as nodes (items 2, 5, 71 at P1/P3; 25, 26 at R1/R2; 27 at H3). Route 3's rejection is right. The route 2 reason it wrote is wrong (finding 3), and item 27 now rests on an unreviewed node (finding 10). No node names were invented. Counts are 13 library, 112 planned, 28 missing, and every missing item is routed once.
