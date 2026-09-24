# REV-PAPER-DOSPINESCU-LEBRAS-17 — review of the extraction of Dospinescu–Le Bras, "Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique"

**Verdict: accept, with corrections made in place.**

- **Reviewer:** Claude Code, session `cc-2aeb03`, 23–24 September 2026 (issue #1160).
- **Author:** Claude Code, session `cc-39fac3` (#2093). This reviewer took no part in it.

**What was read.**

- **The paper.** Ann. of Math. 186 (2017), 321–411, doi:10.4007/annals.2017.186.2.1. It was read, as the extraction read it,
  in arXiv:1509.00606v2, the authors' final version ("Final version, to appear in the Annals of Math"): 76 pages, in French,
  with a SHA-256 matching the extraction's record. It was read in full, as page images, in six ranges:
  - §§1–2 (pp. 1–14);
  - §§3–4 (pp. 14–24);
  - §§5–6 (pp. 24–35);
  - §§7–8 (pp. 35–44);
  - §§9–10 (pp. 44–57);
  - §§11–13 and the references (pp. 57–76).

  Every item was compared with the page. Colmez's Astérisque 330 memoir and Kedlaya–Pottharst–Xiao were consulted where
  recorded mistakes concern them.
- **The libraries.** The extraction has no library items, and the new items are not in Mathlib 082e2d3 or Tau Ceti f790474.
- **The atlas.** Every planned stage and route stage was checked in `data/atlas.json`, and so were the candidate roadmaps
  the routes coalesce with.

**Checks.**

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-DOSPINESCU-LEBRAS-17.result.json` reports `ok`.
- `python3 research/blueprint/intake.py check-files` on the four files: 0 problems.
- **Errata search.** Crossref shows no update, correction or erratum relation for doi:10.4007/annals.2017.186.2.1.

## 1. Items

- **Split (36).** Thirty-six items bundled several numbered results (for example "Lemmes 4.6–4.7", "Proposition 9.10 and
  Lemme 9.11") or a result with its unnumbered setup. As the protocol requires, each keeps its first result, and the others
  are items of their own.
- **Corrected fields (122):** 52 statements, 36 locators, 30 names and 4 kinds; two notes gained a correction. Examples:
  - Theorems 1.4 and 1.9 (items 83, 86) now carry the paper's standing hypotheses.
  - Proposition 7.7 b) states the corrected orthogonal, tN^+_dif,n(V) (E19).
  - Items 17–19 are split into Proposition 3.6, Remarque 3.7 and Lemmes 4.4–4.7, each with its own statement.
- **Removed:** none. Every item is in the paper.
- **Added (88).** They are the results split off above, and definitions, constructions and cited inputs the proofs use
  without an item. Examples:
  - the ρ-isotypic parts, the quaternion algebra D and the notation of §2;
  - the Stein cover U_i of Σ_n;
  - the Shimura curve Sh_K and the uniformization spectral sequence (2)–(3);
  - the Hecke algebras, the residual representation and Lemmes 5.6 and 5.8 of §5;
  - the connection ∇, Berger's models and the identifications (5) of §6;
  - Colmez's sheaf on P¹(Q_p), the LP spaces and Théorème 7.11 of §7;
  - Théorème 8.1 and Proposition 8.4 b);
  - Corollaire 9.3, Lemmes 9.5, 9.8 and 9.11, and Propositions 9.14–9.15 of §9;
  - Propositions 10.8 and 10.10, Kohlhaase's projectivity and the coadmissibility of O(Σ_n) in §10;
  - Proposition 11.1, Lemmes 11.4, 11.5 and 11.8, and Remarques 11.11, 12.1 and 12.3;
  - the lemmas of §13;
  - the cited inputs: Elkik, Schneider–Stuhler, Strauch with Fargues–Genestier–Lafforgue, Berger–Breuil, Kedlaya–Pottharst–Xiao,
    Emerton and Dospinescu's thesis.

  Four are already supplied:
  - the Shimura curve at HilbertModularVarietiesAndShimuraCurves R18.1;
  - the vanishing Jacquet module of a supercuspidal at SmoothRepresentationsOfLocalGroups SR.3;
  - D_rig(V) at PhiGammaModulesAndIwasawaCohomology PG.2;
  - Colmez's sheaf at PadicLocalLanglandsForGL2Qp R30.3.

## 2. Statuses

- **Library.** No item is in the libraries at the pinned commits.
- **Planned.** Every planned stage exists, and its description covers the item.

## 3. Routes

All nine routes are accepted; `PAPER-DOSPINESCU-LEBRAS-17.review.json` gives a reason for each, based on each route's recorded
reason.

- **Titles.** The Part II title begins with its parent's exact atlas title. The three new routes use the same ids and titles
  as the candidates other papers propose.
- **Briefs.** Routes 1–3 now name the confirmed corrections their designs must carry.
- **Source routes.** The items of routes 5 and 7 carry E2 and E24.
- **Prerequisites.** The 13 entries were checked against Crossref. Seven cited works that the proofs use as black boxes are
  added, each with a DOI or stable link and the place of use:
  - Colmez's Astérisque 330 memoir, on which §§7–8 rest;
  - Berger–Breuil;
  - Kedlaya–Pottharst–Xiao;
  - Schneider–Stuhler;
  - Strauch;
  - Fargues–Genestier–Lafforgue;
  - Dospinescu's thesis.

## 4. Mistakes

**The extraction's five.** All are confirmed. E2 is revised, as the independent check upheld: η̄_p is a condition on the Galois
character attached to χ. Read as a condition on the local component of χ, it is off by the infinity type.

**New: 37 (E6–E42).**

- **How they were checked.** Each claim was checked a second time by an independent verifier. Of 40 claims, 34 were confirmed,
  5 reclassified and 1 rejected. Two were found twice and are one entry each (E7, E9).
- **Rejected:** "C^α" on p. 18, which is the paper's multi-index notation.

The main new ones:

- **E9.** Théorème 1.10 is false as printed. Two readers found it independently, and two verifiers confirmed it under the
  paper's conventions (Σ_0 is two copies of Ω swapped by ϖ_D, and O(Ω) sits diagonally, footnote 16).
  - The counterexample: the locally constant function equal to 1 on one copy and −1 on the other is infinitely primitivable
    but not in O(Ω).
  - The proof applies Théorème 1.2 to one-dimensional ρ_i, which it does not cover.
  - The theorem holds with the conclusion f ∈ H^0_dR(Σ_n)·O(Ω). Nothing else in the paper uses it.
- **E40.** Even corrected, Théorème 1.10 needs Théorème 1.2 for nontrivial central character, which Remarque 1.3(a) only
  asserts.
- **E19.** Proposition 7.7 b) is false for k ≥ 2. The orthogonal is tN^+_dif,n(V), and Colmez's normalization differs by
  t^{k−1}. Every use has k = 1.
- **Gaps reaching a proof:**
  - E12: Lemme 3.3, dividing by P′(f), repaired by the open mapping theorem;
  - E16: Théorème 5.1, the unramified twist ξ from Théorème 5.5 (also p. 24), repaired by a global twist of finite order;
  - E22: Théorème 8.3, injectivity of Res_{Z_p};
  - E24: Proposition 8.4 a), whose cited generation holds only over the Robba ring of Γ;
  - E27: Théorème 9.7, the right inverse;
  - E38: Proposition 11.10, which needs the fixed radius of p. 59;
  - E41: Remarque 11.13, which needs a third quaternionic form;
  - E7: the uniqueness in Théorème 1.7 = 9.9, never proved.
- **E30.** Coadmissibility is shown for O(Σ_n)^ρ, not for all of O(Σ_n). §12.2 uses only the ρ-part.
- **Errors that affect nothing:**
  - E11: Frommer's constant is c_h = h − 1 + O(1), not c_h > p^{h−1};
  - E14: the spectral sequence of Théorème 4.1 is for Γ_i/p^N Z.

The rest are misprints, among them E34, where LC is printed for LP on pp. 58–63, which would make those spaces zero.

With the corrections, Théorèmes 1.2, 1.4 and 1.7 stand.

## Questions for the orchestrator

1. **Reach of the uniqueness gap (E7).** The two verifiers differed on its reach: "the proof" (uniqueness follows after §11)
   or "a stated result" (it cannot be proved from §9 alone). Both agree it is true and unused, and it is recorded as "the
   proof".
2. **A route title.** Boxer–Calegari–Gee–Pilloni (2025) give ProetaleCohomologyOfPAdicCurvesAndTowers the title "Pro-étale
   cohomology of p-adic curves and towers". This paper and Colmez–Dospinescu–Nizioł use "… and of the Drinfeld tower". One
   title should be chosen.
