# Handoff: PAPER-BHATT-MORROW-SCHOLZE-18

Claude Code, session `cc-442dc5`, 22 September 2026 (issue #1462).

## Done

The extraction is complete. `scripts/check_paper.py` reports ok, and every missing item is routed exactly once.

**What was read.**

- arXiv 1602.03148v3 ("minor updates, final version") was read in full from its TeX source.
- The published Publ. Math. IHÉS 128 PDF (open access on Centre Mersenne) was compared against it. The 237 numbered statements agree, and locators use the published pages.

**Deliverables:**

- `research/blueprint/papers/PAPER-BHATT-MORROW-SCHOLZE-18.result.json`: 190 items (2 library, 92 planned, 96 missing), 14 source routes, 15 prerequisites and 18 source issues.
- The report, `research/blueprint/papers/PAPER-BHATT-MORROW-SCHOLZE-18.md`.

## Judgement calls for the reviewer

**No Part II or new roadmap.** The atlas layers AInfCohomology AI.0–AI.5, CohomologyComparisons CP.2, CP.3 and CP.5, and CrystallineCohomology CR.4 name BMS1 as their source, often by statement number. So every main theorem is planned, and each supporting lemma goes, as a source, to the layer that uses it. Most go to AI.4, AI.3 and CP.3.

**Source routes also list planned items** (46 in total), as in the BMS2 extraction. If the reviewer prefers source routes to carry only missing items, those entries can be dropped without changing any status.

**Theorem 5.1 is split.**

- Scholze's de Rham comparison over discretely valued fields is planned in PadicHodgeTheory P8 and CP.3.
- The finiteness of H^i_et(X_C, Z_p) for proper smooth rigid spaces is planned nowhere. It is routed to P8, which owns the proper-smooth rational comparison, with Scholze (2013) listed as a prerequisite.
- The primitive comparison with A_inf-coefficients (Theorem 5.7) goes to AI.4, whose μ-inverted étale comparison consumes it.

**The §2 examples.** AI.5, CP.5 and CR.3 name BMS1 §2 as test cases, so Theorems 2.1 and 2.10 are planned. Their constructions (Proposition 2.2, Lemmas 2.5, 2.7 and 2.9, Remark 2.4) go to AI.5. The crystalline weak Lefschetz Lemma 2.12 goes to CR.3. Lemma 2.5, the flat closure of Z/p² in a supersingular curve, could instead go to R07.1, which plans "finite-flat closure of a generic subgroup".

**Coherence of W_r(O) goes to AI.3** (Proposition 3.24, Lemmas 3.25–3.28, Corollary 3.29). These are general commutative algebra, used only to show "no almost-zero elements" in §§8–9.

**Kisin's Theorem 4.4 is marked planned in R07.4 and PR.7.** R07.4's text is about the finite-flat classification. PR.7, however, compares with "R07's Kisin functor" on crystalline lattices. Proposition 4.34, Kisin modules under Fargues' classification, is planned in CP.5 ("the actual Kisin/BKF comparison") and PR.7.

**Theorem 10.4 (Witt vectors of étale maps) is missing, routed to CR.4.** CR.4's "localization and étale descent" for de Rham–Witt forms needs it, but does not state it.

**§12.3 is folded into the Theorem 12.1 item.** It upgrades the A_crys comparison to one of E_∞-algebras, and it assumes an ∞-categorical lift of Lη.

## Leads not recorded as source issues

**Spelling and grammar slips:**

- "For any integer m, is a natural transformation" (Lemma 6.9);
- "Let assume" (proof of Lemma 3.20);
- "Before explaining the answer the general" (§1.3);
- "the way constructucted" (§1.3);
- "identificaton" (§1.1);
- "Before go on" (§12.1);
- "leaves U_j fix" (proof of Lemma 12.4);
- "The (simple) idea is to extra roots" (§12.2);
- "counterxample" (after Lemma 13.9);
- "continouously" (§13.1);
- "correponding" (proof of Lemma 13.7);
- "satisfing" (proof of Lemma 11.14);
- "is a Breuil–Kisin–Fargues modules" (proof of Proposition 4.32).

**Minor notation slips:**

- The proof of Lemma 9.13 twice says "the proof of Proposition 9.6". It is Lemma 9.6, and a source comment shows the authors were fixing a forward reference.
- The proof of Theorem 2.10 writes H^i(H_{E,k}/W(k)) without "crys".
- The proof of Proposition 13.21 writes Y ×_{O/p^{1/p^n}} without Spec.
- The long exact sequence in the proof of Proposition 11.17 mixes the degree letters n and i.
- The proof of Theorem 10.12 writes W_{r−max(r,0)}(A) for W_0(A).

**Statements without proofs:**

- Remark 2.11 states without proof ("one can also show") that H^1_et(H_C, Z/p) ≅ Z/p and H^1_dR(H_k) ≅ k ⊕ k. This is recorded in the note to item 029, not as an item.
- Remark 2.6 (BG as a stacky example) is heuristic.
- Remarks 1.14–1.15 (Berthelot–Ogus and Illusie's décalage, Katz's reconstruction) motivate the construction and are not proved in the paper. None is an item.

**Other slips checked:**

- The p-adic valuation bound in Lemma 12.2(ii), v_p((n+1)!) ≤ ⌊n/(p−1)⌋, is correct.
- The weak Lefschetz ranges used in Theorems 2.1 and 2.10 match Lemma 2.12.

## Not done

Nothing remains in the extraction.
