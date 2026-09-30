# RT-PAPER-ANDRE-18-B: red team of the André direct-summand extraction

Red team: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #4332).

**Target.** `PAPER-ANDRE-18-B` extracts Y. André, *La conjecture du facteur direct*, [Publ. Math. IHÉS 127 (2018), 71–93](https://doi.org/10.1007/s10240-017-0097-9).

**Who did what.**
- The extraction was written by ChatGPT `cgpt-20260923-4c72a9`, Codex `codex-hjdg0j` and Claude Code `cc-7b31c4` (issue #2188; PRs #2210–#2266).
- Claude Code `cc-442dc5` and `cc-fb70e5` added proof checks, recorded in item notes.
- `REV-PAPER-ANDRE-18-B` was written by Codex `codex-c83e7a` (PR #2430), which accepted all seven routes after in-place corrections.
- I did none of this. The string `cc-f805bf` occurs in none of the four target files and in none of the commits that touch them.

**Disclosure.** This session reviewed PAPER-KEDLAYA-LIU-15 (PR #4673) and PAPER-SCHOLZE-17 (PR #4688), and red-teamed PAPER-CESNAVICIUS-21 (PR #4713).
- Finding 1 mentions KEDLAYA-LIU-15's accepted route to AdicSpacesPartII R0/R3 only as corroboration. Its evidence is the AdicSpacesPartII packet itself.
- Finding 3 names the Scheme-foundations Part II design (#3361), which also receives a CESNAVICIUS-21 route. It does not rest on my red team of that paper.
- Nothing here depends on SCHOLZE-17.

**Result: six findings.** One is high, three medium and two low. The machine-readable file is [RT-PAPER-ANDRE-18-B.result.json](RT-PAPER-ANDRE-18-B.result.json).

- **Where the work is sound.**
  - The 191 items follow the published text closely, and their locators use the published pagination.
  - The 23 library claims hold at the pins.
  - All 25 source-issue verdicts check out, including the counterexamples of E4, E5, E20, E21 and E25.
- **Where it breaks.** Ownership:
  - three source routes feed blueprints that were finished without the material;
  - several companion imports have no owner;
  - big Cohen–Macaulay predicates are planned twice;
  - the equal-characteristic existence theorem that Theorem 0.7.1 needs has no item.

## Source

| Text | Where | SHA-256 |
| --- | --- | --- |
| Published, Publ. Math. IHÉS 127 (2018), 23 pp. | [Numdam](https://www.numdam.org/item/10.1007/s10240-017-0097-9.pdf), fetched 30 September 2026 | `34da107d…d47053` (matches the extraction) |
| arXiv 1609.00345 | [arXiv](https://arxiv.org/abs/1609.00345) | only v1 exists; listing checked, not re-read |

- **How I read it.** I read the whole paper in French from the published PDF. I rendered pp. 82, 86 and 92 at 300 dpi to settle symbols:
  - 𝔨 in Corollary 2.6.1;
  - the ≠ and ⊄ of Lemma 4.1.3;
  - "(π) ∩ A = pgA ⊄ p²A" in §4.2;
  - the A.4 sentence behind E10.
- **Errata.** Crossref has no correction or update relation for the DOI, and I found no erratum.

## Findings

### 1. Three source routes feed blueprints finished without the material (high, error)

**What goes wrong.** Routes 2, 3 and 6 are `source` routes into PerfectoidSpaces P0/P1/P2 and AdicSpacesPartII R0.
- A source route only reaches blueprint jobs generated after it is accepted (`make_queue.py`, lines 910–914).
- Both blueprints were queued before this paper's review merged on 23 September: issue #973 on 21 September and #670 on 16 September.
- Both are now accepted: PerfectoidSpaces P0–P7 on 26 September, AdicSpacesPartII on 28 September.
- Neither mentions the paper.

**What is left unplanned.**
- **Appendix A.4 (route 2).** Almost-pure module maps, their test through M_!, Lemma A.4.1 (almost lifting, almost-zero Ext class), almost-pure algebra maps through ( )_!! and left factors.
  - Section 3.3 needs these: "Le corollaire 3.2.2 joint au lemme A.4.1 implique que e ⊗ 1 est annulé par g^{1/p^∞}K°°_∞" (p. 84).
  - The P0 packet has almost modules, adjoints, change of basic setup and !!-faithful flatness, but no almost purity: 0 hits for "almost pure", "presque" or "Ext^1".
- **Section 1.2 (route 6).** B{f/λ} = B⟨U⟩/(λU − f), formulas (1)–(6), the λU − f non-zero-divisor lemma, the ϖ-adic topology of B≤1, and invariance §1.2.3.
  - These are the analytic input of formulas (13), (14) and (17) in the proof of Theorem 2.5.2.
  - The AdicSpacesPartII packet has the Tate-ring norm, the spectral seminorm and the uniformity criterion, which do cover `uniform-banach-algebra`. It has nothing on Weierstrass unit balls: 0 hits for "λU" or "B_{≤1}".
  - Route 6's reason cites "the companion PAPER-ANDRE-18 ownership … at R0". REV-PAPER-ANDRE-18 rejected that very route 89 minutes later: "R0's admissible geometric morphism/tensor-product contract does not own a generic norm-comparison package".
- **Coordinate tower (route 3).** Perfectoidness of the coordinate tower Â_∞0 and of Â_∞0⟨T^{1/p^∞}⟩ has no node.
- **Cyclotomic field (route 3).** `cyclotomic-perfectoid-field` is planned only for ℚ_p^cycl, but André needs Frac W(k) for any perfect k, and W(k^{1/p^∞}) in §4.2.

**Fix.**
- Move the six A.4 items into route 1 (DirectSummandsAndBigCohenMacaulay), importing the P0 nodes.
- Move the six Weierstrass items and `coordinate-tower-perfectoid` into route 4 (the pending Part II of Perfectoid rings and spaces), as a first layer on uniform Banach algebras and Weierstrass localisation. That layer imports AdicSpacesPartII R0/tate-ring-norm, R0/spectral-seminorm and R3/uniform-iff-power-bound.
- Mark `uniform-banach-algebra` planned at those nodes.
- Generalise, or re-plan, the cyclotomic field.
- Delete routes 2, 3 and 6. Alternatively, the maintainer reopens the two blueprint jobs.

### 2. Further companion imports have no owner (medium, missing)

**What is already covered.** RT-AREA-padic-1/2, confirmed, found that André's perfectoid Abhyankar lemma has no owner, because PAPER-ANDRE-18 has verdict `revise` and its Part II route was rejected. Its fix:
- imports Bhatt–Scholze Theorem 10.9;
- records companion items /2.9.3-root-algebras, /3.6.1 and /2.9.2 as gaps.

That fix is not yet applied to this file.

**What it leaves open.** Three imports this paper actually uses:
- **/2.9.3-root-as-colimit** (Corollaire 2.9.3). This is all of Lemma 2.5.1: "c'est un cas particulier de [1, cor. 2.9.3]".
- **/3.2.3-standard-examples.** A⟨T^{1/p^∞}⟩ is perfectoid (p. 79).
- **/4.2.2-integral-closure** (Lemma 4.2.3). It builds δ : D → D′ for Theorem 4.4.2 (p. 88).

**Fix.** Plan these three in the Part II of route 4, and replace the items' `imports` with dependencies on the new nodes.

### 3. Big Cohen–Macaulay predicates are planned twice (medium, duplicate)

**The two plans.**
- Route 1 plans big CM and balanced big CM *algebras* (Definition 4.1.1).
- PAPER-BHATT-ETAL-23 route 10 plans big and balanced big CM *modules* and splinters in the Scheme-foundations Part II (#3361): "Build big/balanced/cohomological CM predicates". It was accepted five minutes after this review.

A splinter is exactly what the direct summand theorem says regular rings are. Neither side mentions the other.

**Fix.** Make DirectSummandsAndBigCohenMacaulay the owner of the module-level predicates and of splinters, with the algebra forms derived from them, and have BHATT-ETAL-23 import them.

### 4. Equal-characteristic existence of big CM algebras has no item (medium, missing)

**Where it is used.** Theorem 0.7.1 is stated for every Noetherian local ring, but André proves only the mixed case: "Le cas où B contient un corps étant déjà connu". Section 4.3 uses "[17] en égale caractéristique".

**Why the mixed case needs it too.** The extraction's own reduction `big-cm-reductions` (1) can land in characteristic p. For example, B = ℤ_p[[x]]/(px) has the one-dimensional quotient B/(p) = F_p[[x]].

**What the extraction has.** The theorem appears only as an unread prerequisite (Hochster–Huneke 1995).

**Also.** `direct-summand` does not depend on the equal-characteristic splitting items `frobenius-direct-summand-char-p` and `invertible-degree-retraction`, which it needs.

**Fix.**
- Add an item for equal-characteristic existence, citing Hochster–Huneke 1992 and the reduction to characteristic p, routed to route 1.
- Add the missing dependencies.

### 5. Step (a) of Theorem 2.5.2 is asserted without an argument, and is unnecessary (low, other)

**The gap.** André deduces flatness over the non-affinoid ring A_j0 = A°_j0[1/p] from flatness over closed polydiscs (Berkovich 2.2.4), but gives no argument for the passage. The extraction reproduces this in `generic-fibre-flat`, on top of an unread Berkovich.

**Why it is unnecessary.** Let C = A°_j0⟨T^{1/p^j},U⟩/(ϖ_ik U − f_ik).
1. C is ϖ_j-torsion-free. The §1.2.1 computation uses only that f_ik acts isometrically.
2. C is ϖ_j-adically complete, as a quotient of a Noetherian complete ring.
3. C/ϖ_j is free over A°_j0/ϖ_j, by step (b).
4. The local criterion over the nilpotent ideal gives flatness of each C/ϖ_j^n over A°_j0/ϖ_j^n.
5. Stacks Lemma 15.28.4 then gives flatness of C over A°_j0.

**Fix.** Record the gap as E26 (affects nothing), and replace the fibre criterion in the spine by this generic adapter.

### 6. Corollary 2.6.1 is narrowed to finite indices (low, error)

**The narrowing.** The paper says "Pour tout (j, k)", and §2.2 allows ∞ in either index. The proof's content is that A°_∞0 → A°_∞∞ is pure. The item states only finite (j, k) and has no item for the infinite case.

**Fix.** Restate the item for all indices in ℕ ∪ {∞}, with the proof spine through A°_∞0 → A°_∞∞.

## What I checked, in brief

- **Items.** All 191 against the published page, with the main arguments re-derived:
  - 0.1.1, 0.7.1, 0.7.2 (with E20's example), 4.4.2 and the descent argument;
  - 4.1.3, 3.3 (why m ≥ 2), 2.6.1, 1.1.1–1.1.2;
  - the reduction items, the §4.4(2) example, the §1.2 formulas;
  - the §0.3 trace argument. There, "radical ⇒ not in (T)" is valid because radical ideals of a perfect ring are perfect.
- **Library claims.** Every library declaration, opened at Mathlib 082e2d3 and Tau Ceti f790474 (file:line in the result file). I also searched the index for the missing statuses: purity, complete integral closure, flat products (Tau Ceti's are finite only), coherence, Tor colimits and coefficient rings. None becomes a library item.
- **Planned statuses and routes.**
  - Stage texts: P0–P2, R0/R3, R03.1/R03.3, TB.0, Tau Ceti AdicSpaces Layers 0/3/4, and RS-05's keeps.
  - The accepted PerfectoidSpaces and AdicSpacesPartII packets, and the Deformation packets and decomposition. Routes 5 and 7 are still pending in the P7 job, so they are not reported.
  - The routing code, queue states and design issues #3479, #3480 and #3361.
  - The companion extraction and its review, and RT-AREA-padic-1 with its fixes.
  - Other extractions: BHATT-18 (same new roadmap, consistent), BHATT-ETAL-23, HACON-WITASZEK-23, KEDLAYA-LIU-15, SCHOLZE-12, SCHOLZE-17, BHATT-MATHEW-21, CESNAVICIUS-21, and the PerfectoidQuotients:Q3 André flatness lemma. The last is a different, existential statement.
- **Source issues.** All 25 were checked at their locators. The rejections of E13, E14, E17, E18 and E23 are sound.
- **Review changes.** The items the review added or corrected were checked, and no errors were found in them.
