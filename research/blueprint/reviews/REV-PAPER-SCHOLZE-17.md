# REV-PAPER-SCHOLZE-17: review of the extraction of Scholze, *Étale cohomology of diamonds*

**Verdict: accept.** Five routes are accepted: route 2 as it stands, and routes 1, 3, 4 and 5 as corrected. The review adds a sixth source route, to AdicSpacesPartII R2, and accepts it. The extraction was corrected in place:
- 5 statuses changed (missing → planned);
- 2 items added (618 and 619);
- 16 statements, 7 locators, 8 names and 96 notes corrected;
- 4 planned lists shortened and 3 library lists extended;
- items moved between routes.

All 73 recorded source issues are confirmed, eight with a field corrected. Twenty-eight new ones, E74–E101, are added:
- 5 affect a stated result (E74, E83, E94, E99, E100);
- 6 are gaps in proofs;
- 2 are errors that affect nothing;
- 15 are misprints that affect nothing.

Reviewer: Claude Code, session `cc-f805bf`, 29 September 2026. Extraction under review: Claude Code session `cc-48533a`.
- It had 617 items (19 library, 575 planned, 23 missing), 5 routes and 73 `sourceIssues`, with status `complete`.
- `cc-f805bf` appears nowhere in its files.

Source:
- **Text read.** arXiv:1709.07343v4, https://arxiv.org/pdf/1709.07343v4, fetched 29 September 2026.
  - SHA-256 `78ca42bba46f1d43c894b0dbfdfb41105efab4959ba5ba6e32e1e5cf7ef33efc`, as recorded.
  - 168 pages. The printed page equals the PDF page.
- **Versions.** The arXiv listing has v1 (21 September 2017), v2 (26 February 2021), v3 (27 January 2022) and v4 (14 April 2026, "168 pages, final version to appear in Asterisque"). There is no v5.
  - v1–v3 were compared with v4 by text diff. Scholze's v3 → v4 changes correct the proofs of Lemmas 11.21 and 12.16 and of Proposition 18.7(i). They add "quasiseparated" to Definition 22.13 and Propositions 22.14–22.15, and change dim.trg f to dim.trg g in Theorem 1.9(iii) and Proposition 23.16(i).
  - None of these changes touches a recorded issue.
  - 71 of the 73 issues are word for word in v3. E32's sentence is new in v4: it belongs to the argument that replaced v3's flawed step.
- **Published version.** Not yet out.
  - Scholze's page (https://people.mpim-bonn.mpg.de/scholze/papers.html) says "to appear in Asterisque". Its PDF has the v4 text.
  - The SMF Astérisque pages list no volume with the paper.
  - zbMATH lists only the preprint. v4's bibliography calls Fargues–Scholze "this Astérisque volume", and zbMATH places Fargues–Scholze in Astérisque 466.
  - Every finding is therefore scoped to arXiv v4, as `sourceVersions` says.
- **Corrections in print.** None found. Scholze's page links no erratum for this paper.
  - The review searched Fargues–Scholze (arXiv:2102.13459v4, all 144 citations), Gulotta–Hansen–Weinstein (arXiv:2202.12467), Mann (arXiv:2206.02022 and arXiv:2209.08135), and Scholze's six-functor lecture notes.
  - It also searched Hansen–Kaletha–Weinstein, Hansen–Scholze, Anschütz–Le Bras, Heuer, Zavyalov, Bhatt–Hansen and Gleason, as well as MathOverflow and the web.
  - None corrects a statement of the paper.

## 1. Items

**What was read.**
- Six parallel section passes read the whole paper: §§1–6, 7–10, 11–13, 14–17, 18–21, and 22–27 with the references.
- Each pass checked every item against the text layer, and every formula that mattered on 300-dpi page images. Every source issue was checked on the page image.
- I read myself, on the text and the page images:
  - the statements behind every new mistake in a stated result: Theorem 1.8 (p. 5), the warning before Proposition 8.3 (p. 41), Theorem 19.2 (p. 108), Proposition 22.15 with Definition 22.13 (pp. 135–136), Propositions 24.2–24.3 (pp. 153, 155);
  - Remark 25.6 (p. 161) and Proposition 13.13 (p. 81);
  - E14 (Lemma 7.2), E57 (Proposition 20.14) and E60 (Theorem 19.5(ii), pp. 111–112).

**Coverage.**
- Every numbered Definition, Lemma, Proposition, Theorem, Corollary and Construction falls under some item.
- The uncovered numbered pieces are remarks or questions that nothing later uses: Remarks 7.21, 9.10, 16.2, 18.5, 19.3, 20.2, 21.12, 23.5 and 23.9, Questions 21.4 and 24.7, and Convention 22.1. Remark 16.2 is wrong as printed (E91).
- Two items were added:
  - **618 (the localization Y_y, proof of Lemma 11.21; also Lemmas 11.31, 12.16 and §20).** The intersection of the quasicompact opens containing y, with its spreading-out property. D5's nodes use it as a proof step, but nothing states it. It is missing and goes to route 1 (D5).
  - **619 (proof of Proposition 14.8).** Pro(Y_ét,qc,sep) → Y_qproét is fully faithful onto a basis, with ν^*F(Ỹ) = colim F(Ỹ_j). Proposition 14.9, Theorem 14.12 and Proposition 16.6 reuse it by name. It is planned at C0 ("Prove 14.4–14.11").

**Statements corrected (16).**
- **Hypotheses.**
  - Item 28 (Remark 3.2): the second sentence keeps the standing hypothesis ϖ^p | p, without which ℚ_p is a counterexample.
  - Item 145: "X → ∗ quasicompact ⇒ X quasicompact" needs ∗ to be covered by a quasicompact object (E83).
  - Item 182 (the X/φ^ℤ example): X is nonempty.
  - Item 530: Proposition 22.15 needs Ỹ quasiseparated (E99).
  - Item 568: Proposition 24.3 needs Λ ℓ-power torsion (E100).
  - Item 579: Remark 25.6's example needs K not discretely valued (E101).
- **Scope.**
  - Item 113: the extractor's "(more generally an affinoid perfectoid X)" is not the paper's.
  - Item 391: the symmetric monoidal structure is an unproved remark after Lemma 17.7, not part of it.
- **Transcription.**
  - Item 329 (Proposition 14.3): ȳ for the geometric point, which the text layer lost.
  - Items 318–324: the Berkovich space is |X|^B, not |X|_B.

**Locators (7).** Item 197 (Propositions 11.26 and 12.20, used in Lemma 11.27), 304 (p. 74), 401 (also used in Theorem 19.2), 543 and 552–554 (the statement of 23.12 begins on p. 146).

**Notes (96).**
- Fifty-two notes said DiamondEtaleCohomology has nodes only for C8; its packet covers C8–C9.
- Items 74, 612 and 613 cited packet nodes that do not exist: PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed and the ClassicalAdicEtaleCohomology H5 nodes. The stage texts still plan the items.
- Items 144, 306 and 316 said no node names the result, but a node does.
- Other notes gained cross-references to the new issues.

## 2. Statuses

**Library citations.** All 19 items were checked, and every cited declaration was opened at Mathlib 082e2d3 and Tau Ceti f790474. Each provides its item. Three are worth a comment:
- **154 (descent data).** Mathlib's `DescentData` is for families of maps, which is equivalent to the (s, α) form when fibre products exist, as the note says.
- **408 (θ).** `fontaineTheta` needs S♯⁺ p-adically complete, which holds since p ∈ ϖ♯S♯⁺.
- **475 (Krasner).** It needs a nontrivially normed field, which the paper's fields are.

Library lists were extended for items 26 (`IsPowerBounded.of_isTopologicallyNilpotent`), 154 (`isEquivalence_toDescentData`) and 471 (`Specialization`).

**Planned items.** Five status passes checked all 575 planned items, not a sample, against the cited stage descriptions and packet nodes.
- The diamond layers were written from this paper and cite its statement numbers ("Prove 23.4–23.7", "Prove all three cases of Theorem 19.5", "Prove Theorem 25.1 for X separated and ℓ-cohomologically smooth over Spa(C,O_C) … bounded constructible F_ℓ coefficients").
- The passes compared the numbering with v4 and found it matches. The one naming slip is C1's "Lemmas 16.2–16.5", where 16.2 is a remark.
- No planned item is planned only in a special case.
- I rechecked Theorem 8.7 against D2 ("Prove that 𝒪 and 𝒪⁺ are sheaves … prove v-descent of functions and subcanonicity"), Theorem 19.5 (C6), Proposition 24.5 (S5) and Theorem 25.1 (S6).
- Weakest plans, accepted:
  - 247 (κ-small diamonds) and 196 (w-localization), which the nodes presuppose;
  - 478 (Temkin's theorem), which rests on a packet gap that commits to "Extract that restricted theorem";
  - 487, planned at stage level.

**Planned lists shortened (4).** In each case a layer that consumes the item was listed as planning it:
- 193 (P9 builds towers from G̲-torsors; D3 plans Definition 10.12);
- 334 and 366 (ClassicalAdicEtaleCohomology H2 supplies inputs to 14.6 and 16.1);
- 505 (ArithmeticGaloisDuality R02.1 is "Topological coefficients and inverse limits"; C8/extension-cd-bound plans the inequality).

**Missing → planned (5), each checked by me at the cited stage or node:**
- **210, lifting special-fibre points to O_C-points.** AdicSpacesPartII:R2/specialisation-map (iii): "for X admissible over O_K … every closed point of X_s is the image of a classical point". With K = C algebraically closed, this is the item.
- **406, HTT 5.5.2.2.** EnhancedDerivedSheaves:E5:presentability/presentable-categories: "A functor F : C -> S^op out of a presentable C is representable if and only if it preserves colimits".
- **441, proper base change for schemes.** SchemeAndStackFoundations:SF.2: "construct sheaf cohomology, localization, proper/smooth base change and compact support". The extraction's route 5 quoted this text, while the item's note said "No atlas stage owns scheme-theoretic proper base change".
- **598, SGA 4 VI 5.2.** DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites: "for every qcqs object X and every i the natural map colim_j H^i(X, F_j) -> H^i(X, colim_j F_j) is an isomorphism", on algebraic sites.
- **604, Fargues–Scholze IV.3.** VStackSheavesAndLisseCategories:VS1: "Construct formal smoothness and the Jacobian criterion of IV.3–IV.4".

**Kept missing.** Item 464 (Proposition 20.14). The §§18–21 pass proposed "planned" because C9 says "prove 20.10 and 20.17 and their prerequisites". No layer names 20.14, and C7 needs it before C9, so it stays missing in route 2.

**Missing items searched.** The routes pass searched `declarations.tsv`, the Mathlib and Tau Ceti sources at the pins, every stage description, packet node, campaign and Tau Ceti README, new roadmap, and accepted brief for the other 18. Nothing provides or plans them.
- Mathlib has only compact Hausdorff versions of 197.
- Mathlib has only the directed-poset step of 304.
- Tau Ceti has flasque acyclicity but not 394.

**Counts after the review.** 619 items: 19 library, 581 planned, 19 missing.

## 3. Routes

A script checked, and `check_paper.py` confirms, that:
- every missing item is in exactly one route;
- routes name planned items only as sources;
- all 13 named stages exist, in proposed (campaign) roadmaps.

No Tau Ceti roadmap is re-planned, and no Part II or new roadmap is needed.

1. **DiamondsAndVStacks, source: accepted as corrected.**
   - D0 owns 197, 304, 394 and 397, and names 598 as planned.
   - D5 was added for item 618.
   - The three inputs to Lemma 9.5 left, because the DiamondsAndVStacks packet itself says they are "not planned in this packet":
     - 208 went to SF.2;
     - 209 went to AdicSpacesPartII R2;
     - 210 is planned at R2.
   - D3 and D4 were dropped, since no item was left in them.
2. **DiamondEtaleCohomology C2, C3, C4, C7, source: accepted.** These are diamond-specific statements (381, 387, 411, 464), and their layers own the sections they come from.
3. **DiamondSixOperations S4–S6, source: accepted as corrected.**
   - 604 left the route (planned at VS1).
   - The reason no longer claims that S4 and S6 mention Remarks 23.14 and 25.5.
4. **EnhancedDerivedSheaves E3, E5:presentability, source: accepted as corrected.**
   - 406 is planned.
   - HTT 5.5.3.12–13 (407, 611) and Neeman's criterion (603) are missing. The HabiroRings packet independently records 5.5.3.13 as unowned.
5. **SchemeAndStackFoundations SF.2, source: accepted as corrected.**
   - 441 is planned there.
   - 614 (invariance under algebraically closed field extension) and 208 (fppf refinement) belong to the layer that owns scheme étale cohomology and the fppf/étale comparisons.
   - WeilConjectures, EtaleDualityAndPerverseSheaves and LefschetzPencilsAndVanishingCycles consume SF.2 rather than own base change.
6. **AdicSpacesPartII R2, source (new): accepted.**
   - R2 owns formal schemes over valuation rings: AdicEtaleGeometry A2 defers formal schemes to it.
   - Its node flat-tft-is-tfp is stated for rank one, with hypotheses noting "Fujiwara–Kato: any height". Lemma 9.5 needs any height, so R2's blueprint must state it there.

## 4. Mistakes in the paper: 73 of 73 confirmed, 28 added

**Recorded issues.**
- Every entry was checked at its locator on the page image, and every counterexample was rebuilt:
  - E1/E2: Spec of a DVR;
  - E4: 𝔽_p + tK° in 𝔽_{p²}((t^{1/p^∞}));
  - E14: the two-point discrete space, where Γ(X, ∗ ⊔ ∗) has four elements;
  - E31: the perfectoid closed disc, whose |Z|^B is not a point;
  - E33/E34: a valuation with value group ⊕ℚ, whose top point is not open;
  - E60: the annulus Y′_n → Spa(C′, C′⁺) is not proper when C′⁺ ≠ O_{C′}, while Theorem 19.2 assumes f proper.
- Field corrections:
  - E5 (the finite-product counterexample of atlas PerfectoidSpaces/E40);
  - E12 (completions of rings of integral elements *are* integrally closed; the source just does not argue it);
  - E27 (printed G̲);
  - E32 (the sentence is new in v4);
  - E43;
  - E46 ("in general not" strictly totally disconnected);
  - E50 (p^{n−1} = n also for n = 1);
  - E63 (the slip recurs twice in the proof).
- Eight `known` fields now name the atlas packet, because PerfectoidSpaces--P0 and --P8 both use the ids E1–E34 for different findings.
- **E57** (Proposition 20.14 stated over F_ℓ with A ∈ D_ét(Y, Λ)): the section pass proposed "affects nothing", since the printed proof works for any Λ. I kept "a stated result": the printed statement does not typecheck for Λ ≠ F_ℓ, and E66 and E68 are classified the same way.

**New mistakes in stated results (5), each checked by me on the page image:**
- **E74 (Theorem 1.8(iii), p. 5; misprint).** Printed: "For all A ∈ D_ét(X, Λ), B ∈ D_ét(Y, Λ), one has Rf_!(A ⊗ f^*B) ≅ Rf_!A ⊗ B" with f : Y → X. Then Rf_!A and f^*B are undefined; A lies on Y and B on X, as in 22.23.
- **E83 (warning before Proposition 8.3, p. 41; error).** "X → ∗ being quasicompact implies that X is quasicompact … by choosing any quasicompact object Y ∈ T, and the corresponding cover X × Y → X".
  - X × Y → X is a cover only if Y → ∗ is surjective.
  - In the algebraic topos of small sheaves on X_proét with X = ⊔_ℕ Spa(C, O_C), the final object is X. So X → ∗ is the identity, which is quasicompact, but X is not quasicompact.
  - The claim holds for sheaves on Perfd, the case the paper uses.
- **E94 (Theorem 19.2, third paragraph, p. 108; gap).** The unbounded case is stated with only "Rf_* has finite cohomological dimension". Its proof reduces to the D⁺ case, which is proved only when "f is quasi-pro-étale or nΛ = 0 for some n prime to p". The extraction's item 435 had noticed this tacitly; it is now recorded.
- **E99 (Proposition 22.15, p. 136; misprint).** "Let g : Ỹ → Y be any map of locally spatial diamonds". Rf̃_! is defined by Definition 22.13 only for maps of quasiseparated locally spatial diamonds; v4 added "quasiseparated" for f but not for g.
- **E100 (Propositions 24.2–24.3, pp. 153, 155; misprint).** Λ is never specified. The Λ-valued Haar measure of volume 1 on K, of pro-order prime to ℓ, and the reduction to F_ℓ both need Λ ℓ-power torsion, as in Theorem 1.10 and Proposition 23.12.

**New gaps in proofs (6).**
- **E78: Proposition 3.5, the fractional-exponent step Φ^{−k}(R₀) ⊂ ϖ^{−n}R₀ (atlas PerfectoidSpaces/E7).** It is separate from E4. For R₀ = 𝔽_p + tK°, one has t^{−1/p} ∉ t^{−1}R₀. The integral-exponent repair works.
- **E81: Proposition 6.4(iv), the perturbation argument, which is only sketched (atlas AdicEtaleGeometry/E15).**
- **E84: Lemma 9.4, where Lemma 9.5 is applied on the perfectoid ball.**
- **E85: Lemma 9.5, where Spf O⁺(V) is asserted to be topologically of finite type over C⁺ without argument.**
- **E88: Proposition 13.13, p. 81.** "As open and closed neighborhoods of y are cofinal": for Y the perfectoid closed disc, |Y| is connected (its ring is a domain), so |Y|^B is connected with at least two points, and the only clopen neighbourhood is everything. I checked the page and the example. The conclusion is not shown false; the packet node D5/reduction-to-spatial-and-hausdorff-cohomology repeats the step.
- **E95: the proof of Theorem 19.2 cites Proposition 17.6 (which needs nΛ = 0) in the quasi-pro-étale case.** Corollary 16.8(i) repairs it.

**New errors that affect nothing (2).**
- **E91 (Remark 16.2).** "λ_X∘(X̃) = X" needs X̃ → X surjective. It fails for Spa(C, O_C) → Spa(C, C⁺) with C⁺ ≠ O_C.
- **E101 (Remark 25.6, p. 161).** "Λ = O_K with K spherically complete and M = k": for K = ℚ_p, RHom_{ℤ_p}(𝔽_p, ℤ_p) = 𝔽_p[−1] ≠ 0. The example needs K not discretely valued, and O_K is anyway not killed by any n.

**New misprints that affect nothing (15).**
- E75: Theorem 1.8 is for v-stacks, but 22.23 is stated for v-sheaves.
- E76: Theorems 1.12 and 25.1 never introduce f.
- E77: Lemma 1.18.
- E79 (atlas PerfectoidSpaces/E25).
- E80 (atlas PerfectoidSpaces/E39).
- E82 (atlas PerfectoidSpaces/E38).
- E86, E87: §13 proofs.
- E89: 14.7.
- E90: Lemma 15.1 cites Theorem 8.7 for Proposition 8.8.
- E92: (f∘g)^* ≃ f^*∘g^*.
- E93.
- E96, E97: 21.16.
- E98: 22.5.

Each was checked on the page image by its section pass.

**Not recorded.**
- Atlas PerfectoidSpaces/E12 (packet P0; the citations at Theorems 3.12, 3.18 and 3.24 do not cover p neither 0 nor invertible), E28 (P0) and E19 (P8; the scope of [KL15, 3.6.9(c)] and the comparison with [Sch15, II.2.6]). Settling them needs [KL15], [KL16] and [Sch15], which the review did not open. PAPER-SCHOLZE-17.md's claim that all atlas findings were cross-referenced is qualified accordingly.
- Atlas PerfectoidSpaces/E31 and E37 were rejected by their own review. E6 was rejected too.
- Pure grammar slips: "cf. cf.", "disconnceted", "with κ is as in", "giving rise an open".

## 5. Corrections made

They are listed in "Corrections by the independent review" at the end of `PAPER-SCHOLZE-17.md`. In `PAPER-SCHOLZE-17.result.json` the review made these changes:
- review verdicts on E1–E73, with the field corrections above;
- new issues E74–E101;
- items 618–619;
- the five status changes and four planned-list and three library-list changes;
- the statement, locator, name and note corrections;
- the route items, stages and reasons of routes 1, 3, 4 and 5, and the new route 6;
- the prerequisites: Huber 1993 removed (already a source of the ClassicalAdicEtaleCohomology H0 packet), and SGA 4 Exposé VI (doi:10.1007/BFb0061319) added;
- the summary.

Every substitution was applied by one script, which asserted that each matched exactly once. The only exception is the notation change |X|_B → |X|^B, which was replace-all within items 318–324.

**For the maintainer.**
- PerfectoidSpaces--P0 and PerfectoidSpaces--P8 both use the source-issue ids PerfectoidSpaces/E1–E34 for different findings, and `data/source-issues.json` lists both. Bare citations are ambiguous.
- Some packets cite PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed and ClassicalAdicEtaleCohomology H5 nodes that do not exist.
- Node DiamondsAndVStacks:D6/etale-site-comparison still says the sites are "defined as in Huber"; v4 cites [KL15, Definition 8.2.19].
- Node DiamondsAndVStacks:D5/reduction-to-spatial-and-hausdorff-cohomology repeats the unsupported step of E88.
- Items 407 and 611 (HTT 5.5.3.12 and 5.5.3.13) should be planned together in EnhancedDerivedSheaves.

## 6. Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-SCHOLZE-17.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the four changed files: 0 problems.
- A local check confirms that every missing item is in exactly one route, and that every routed item is missing or planned.

## What I could not read

- **The Astérisque version,** which has not appeared. Every finding is scoped to arXiv v4.
- **The paper's external sources.** SGA 4, [Gro68], Raynaud–Gruson, HTT, Neeman, [KL15], [KL16], [Sch15], Huber's book, Temkin, Scheiderer and Fargues–Scholze were not opened for the statements the paper cites. Their statements were taken as the paper reproduces them, except where an atlas node already states them.
