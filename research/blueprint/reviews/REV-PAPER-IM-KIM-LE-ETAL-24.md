# REV-PAPER-IM-KIM-LE-ETAL-24 — review of the extraction of Im–Kim–Le–Ngo Dac–Pham, "Zagier–Hoffman's conjectures in positive characteristic"

**Verdict: accept, with corrections made in place.**

- **Reviewer:** Claude Code, session `cc-2aeb03`, 24 September 2026 (issue #1359).
- **Author:** Claude Code, session `cc-7b31c4` (#1939). This reviewer took no part in it.

**What was read.**

- **The paper.** Forum of Mathematics, Pi 12 (2024), e18, doi:10.1017/fmp.2024.18.
  - It was read, as the extraction read it, in arXiv:2205.07165v2, the authors' version with the details of the proofs:
    60 pages, printed page = PDF page. Its source archive (`AMZV_ZagierHoffman_arxiv_v2.tex`) has the hash the extraction
    records.
  - It was read in full, as page images, with the TeX source for formulas, in six ranges:
    - the introduction and §1.1 (pp. 1–8);
    - the rest of §1.1 to §1.3 (pp. 9–17);
    - the rest of §1 (pp. 18–25);
    - §2 and §3 to Lemma 3.3 (pp. 26–34);
    - the rest of §3 and §4 to Proposition 4.5 (pp. 35–45);
    - the rest of §4 and the references (pp. 46–60).
  - Every item was compared with the page. Every claimed mistake was compared with the open-access published version, whose
    numbers are the preprint's shifted by one.
- **Ngo Dac, Ann. of Math. 194 (2021).** Theorems A, B and D were read, for the paper's citations of them.
- **The libraries.** The one library item holds at Mathlib `082e2d3`. The new items are not in Mathlib or Tau Ceti.
- **The atlas.** Every planned stage and route stage was checked in `data/atlas.json`, and so was the Part II candidate
  proposed by PAPER-CHANG-CHEN-MISHIBA-23.

**Checks.**

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-IM-KIM-LE-ETAL-24.result.json` reports `ok`.
- `python3 research/blueprint/intake.py check-files` on the four files: 0 problems.
- **Errata search.** Crossref shows no update, correction or erratum relation for doi:10.1017/fmp.2024.18.

## 1. Items

- **Split (12).** Twelve items bundled several numbered results or parts: items 7, 10, 17, 19, 20, 23, 28, 30, 34, 37, 38
  and 42. Examples: "Lemma 1.5 and Proposition 1.6", "Theorem 3.4 with Remark 3.5", "Propositions 4.11 and 4.12", and all of
  §2.2 in one item. As the protocol requires, each keeps its first result, and the others are items of their own.
- **Corrected fields (78):** 43 locators, 24 statements, 10 names and 1 kind. Every locator lacked its page. Examples:
  - Items 5 and 6 pointed to §1.1.2, which defines only arrays; the polylogarithms and power sums are in §§1.1.3–1.1.4.
  - Item 24 (J_w, J'_w and AS_w) is in §§1.4.1–1.4.2, pp. 24–25, not §1.2.1.
  - Item 30 (Theorem 2.4) stated a conclusion the theorem does not have. The theorem concludes only that f_{t;Q}(θ) ∈ K;
    the difference equations belong to its proof.
  - Items 32 and 34 wrote 𝔏 where the results concern 𝔏𝔦, and item 34 lacked its "in particular" clause.
  - Item 37 lacked part (3).
  - Item 42 misstated Remark 4.12.
  - Item 10 states Ngo Dac's Theorem A in its spanning form, which the proof of Theorem B needs.
- **Removed:** none. Every item is in the paper.
- **Added (57).** They are the split-off results, and the definitions, constructions and cited inputs the proofs use without
  an item:
  - the classical statements of the introduction (Hoffman's conjecture, the Deligne–Goncharov and Terasoma bounds, Brown's
    theorem, the bound for alternating MZVs) and [ND21, Theorem D];
  - the sum of arrays and the elementary power-sum identities;
  - binary relations and the operators B*, C and BC;
  - Proposition 1.6 and Part 2 of Proposition 1.7;
  - AT_w and its cardinality, and the block contraction behind Theorem 1.11;
  - the Tate algebra, Frobenius twisting, rigid analytic trivialisations, Ω and π̃;
  - the Anderson–Thakur polynomials and their degree bound;
  - the dual t-motives and period interpretations of AMZVs and ACMPLs, and Remark 2.5;
  - the cited inputs of Chang, Chang–Papanikolas–Yu and Papanikolas;
  - the AMZV relations and operators of §4.1, and Propositions 4.5–4.7;
  - Harada–Chen's product formula and Carlitz's evaluation of ζ_A(q − 1);
  - Propositions 4.11 and 4.13, and Remarks 4.12 and 4.14.

  Eight are already planned:
  - the classical results at PeriodsAndSpecialValues PS.9;
  - Frobenius twisting, rigid analytic trivialisations and Papanikolas's uniqueness at DrinfeldModulesAndTModules DM.8;
  - Carlitz's evaluation at DM.6.

  Seven proposals that duplicated another were merged into it.

## 2. Statuses

- **Library.** Item 1 holds at the pinned Mathlib.
- **Planned.** Every planned stage exists, and its description covers the item. Item 26 (effective dual t-motives) is now
  planned at DM.8 as well as DM.4: DM.8 builds Papanikolas's category, whose objects are these σ-modules, while DM.4 plans
  the τ-form.

## 3. Routes

Both routes are accepted; `PAPER-IM-KIM-LE-ETAL-24.review.json` gives a reason for each.

- **Title.** The Part II title begins with its parent's exact atlas title. Its id and title match the Part II of
  PAPER-CHANG-CHEN-MISHIBA-23, which proves Theorem B independently.
- **Brief.** The brief now names the confirmed corrections its design must carry.
- **Prerequisites.** The list is rebuilt as 20 entries, one work each, every one checked against Crossref:
  - the bundled Thakur, Anderson–Thakur and Deligne–Goncharov/Terasoma/Brown entries are split;
  - Harada's paper is in Math. Z. 298 (2021), not the Ramanujan Journal;
  - the DOIs given for Todd (2018) and Chen (2015) resolve to other papers, and are corrected with the authors' first
    names (George Todd, Huei-Jeng Chen);
  - four arXiv numbers belong to other papers and are dropped. Among them, 2007.11060 is Green–Ngo Dac, not Ngo Dac's Annals
    paper;
  - Kuan–Lin (2016), quoted as Lemma 3.3, is added.

## 4. Mistakes

**The extraction's one.** E1 is confirmed.

**New: 35 (E2–E36).**

- **How they were checked.** Each claim was checked a second time by an independent verifier:
  - of 39 claims, 38 were confirmed (one reclassified) and 1 rejected;
  - four claims that repeated another are folded into E3, E9 and E10;
  - one more (E32) was found by the reviewer and checked on both papers.
- **Rejected:** a claimed gap in the proof of Theorem B. [ND21, Theorem A] already states that T_w spans Z_w, so no step is
  missing; the paper's paraphrase "sharp upper bound" only undersells it.

The main new ones:

- **E14.** Condition (2.1), imposed on the whole tuple, does not make the series of the sub-tuples converge. The
  counterexample is s = (q−1, q−1), Q = (1, θ^{q+1}), whose second series has terms of norm |θ|^{q^i}. So Ψ_{s,Q} is
  undefined as stated.
  - The claim is inherited from Chang–Papanikolas–Yu.
  - The construction needs the bound for every consecutive sub-tuple, which every application satisfies, so no main
    theorem is affected.
- **E12.** The proof of the strong Brown theorem (Theorem 1.11) asserts that the transition matrix is ±1 on the diagonal and 0
  elsewhere modulo D_1 "from Propositions 1.7 and 1.10", which give neither integrality nor a congruence.
  - Following Proposition 1.9's algorithm literally breaks it (q = 3).
  - The theorem is true: run Proposition 1.7 at every step, with its free character matching the target, and track that the
    coefficients lie in A.
- **E23, E30.** Theorem 3.4 proves uniqueness only for K-relations among the 𝔏𝔦-values. It then applies this to a relation
  among Li-values built from Theorem 1.11, and its "in particular" clause passes from K̄- to K-independence. Both steps need
  the unstated fact that the algebra of §1 preserves characters, or Proposition 2.3.
- **E31.** The proof of Proposition 4.10 takes S_w ⊂ Z_w from Theorem 4.9, which gives only S_w ⊂ AZ_w. The
  trivial-character version of Proposition 1.10 is needed.
- **E33.** Formula (*) in the proof of Proposition 4.11 fails for U = ∅, a case the proof needs. It was checked numerically for
  q = 3, 5, and a corrected relation for U = ∅ holds.
- **E16.** The setup of Theorem 2.4 restricts Q_i to (F_q^×)^{ℓ_i}, which its own applications violate. The setup should read
  K̄[t].
- **E32.** The paper cites [ND21, Theorem B] for dim_K Z_w ≥ d(w) when w ≤ 2q − 2. Ngo Dac's Theorem B gives only
  dim_K Z_w ≥ |T⁰_w|; the introduction rightly cites Theorem D.
- **E6.** Read with the paper's definition of character, Proposition 1.3 shows only that the trivial-character ACMPLs span an
  algebra. This affects nothing.

The rest are misprints, among them:

- the index set AJ_w for AT_w in the proof of Theorem 1.11 (E13);
- characters in the proof of Proposition 1.7 (E9–E11);
- the operator 𝓑 for 𝓑* in five places (E34);
- Todd's page range in the references (E36).

With the corrections, Theorems A and B stand, and every gap is filled with the paper's own tools.

## Questions for the orchestrator

1. **Planning with Chang–Chen–Mishiba.** The two papers prove Theorem B independently and share one Part II candidate. Its
   design should read both briefs. The Part II's dual-t-motive layer should take its objects from DM.8, where Papanikolas's
   category is planned, and not restate them.
