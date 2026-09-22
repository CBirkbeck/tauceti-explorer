# Handoff: PAPER-BHATT-MORROW-SCHOLZE-19

Claude Code, session `cc-442dc5`, 22 September 2026 (issue #1458).

## Done

The extraction is complete. `scripts/check_paper.py` reports ok, and every missing item is routed exactly once.

**What was read.**

- arXiv 1802.03261v2 ("final version") was read in full from its TeX source.
- The published Publ. Math. IHÉS 129 PDF (open access on Centre Mersenne) was compared against it. Statement numbering agrees throughout, and locators use the published pages.

**Deliverables:**

- `research/blueprint/papers/PAPER-BHATT-MORROW-SCHOLZE-19.result.json`: 114 items (1 library, 56 planned, 57 missing), 13 routes, 13 prerequisites and 12 source issues.
- The report, `research/blueprint/papers/PAPER-BHATT-MORROW-SCHOLZE-19.md`.

## Judgement calls for the reviewer

**No Part II or new roadmap.** RefinedTraceMethods RT.6 already names BMS2 as the source of its THH/TC^-/TP computation and motivic filtration. PR.3 and PR.4, DD.0 and DD.5, and AI.7 name BMS2 for the Nygaard, syntomic, quasisyntomic and Breuil–Kisin material. So the main theorems are marked planned, and the supporting lemmas go to those layers as sources.

Source routes also list the planned items for which BMS2 is the main source (RT.6: 27, PR.4: 3, DD.5: 5, AI.7: 1). If the reviewer prefers source routes to carry only missing items, those entries can be dropped without changing any status.

**Planned via later papers.**

- Theorem 1.8 (Δ̂ ≃ AΩ) and Theorem 1.10 (crystalline) are marked planned in RT.6's trace-to-prismatic comparison, together with PR.6's AΩ ≃ φ^*Δ and Bhatt–Scholze's crystalline comparison. BMS2's own proofs (almost mathematics, Lη, proj-quasisyntomic left Kan extension, the F_p[Q_p/Z_p] computation) are routed to RT.6 as sources, not dropped.
- Conjecture 7.18 is marked planned in PR.4, because Bhatt–Scholze prove it; earlier extractions record it as planned.

**K-theoretic items go to RT.6**, following the Bhatt–Mathew extraction. These are Z_p(0), Z_p(1) and K_* of quasiregular semiperfect rings. Their one external input, the Clausen–Mathew–Morrow comparison K ≃ τ_{≥0}TC, goes to the henselian-pairs Part II that the Clausen–Mathew–Morrow extraction proposes.

**The Nygaard filtration on de Rham–Witt (§8.1) goes to CR.4, not PR.3.** It is a statement about Illusie's complex for smooth algebras, and CR.4 owns that complex and its Lη_p characterization. PR.3 owns the prismatic Nygaard filtration, which item 078 (A_crys(S)) connects to.

**Bökstedt periodicity is marked planned in L.5**, which proves "the calculation of THH/TR/TC for perfect fields". Nothing in the atlas names Bökstedt explicitly.

## Leads not recorded as source issues

- "quasiregular semiperfetoid" (proof of Proposition 11.15) is a spelling slip.
- The proof of Lemma 10.7 says "(i) and (ii)" for parts (1) and (2).
- Remark 1.13 (filtrations on TR^r) and Remark 1.16 (Schneider–Sato and Hesselholt–Madsen expectations) are not proved in the paper. They are not items.
- Question 8.16 (Drinfeld) is recorded inside item 083.

## Not done

Nothing remains in the extraction.
