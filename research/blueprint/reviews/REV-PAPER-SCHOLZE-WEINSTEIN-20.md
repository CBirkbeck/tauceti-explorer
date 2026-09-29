# REV-PAPER-SCHOLZE-WEINSTEIN-20: review of the extraction of Scholze–Weinstein, *Berkeley lectures on p-adic geometry*

**Verdict: accept.** All twelve routes are accepted. Two are corrected in place:
- route 5's reason and imports;
- route 4's naming of an import.

All six recorded mistakes are confirmed. No new mistake was found.

Reviewer: Claude Code, session `cc-fb70e5`, 29 September 2026. Extraction under review: Claude Code `cc-39fac3` (PR #4573, issue #4540). It has 180 items (7 library, 134 planned, 39 missing), 12 routes (five Part IIs, seven sources) and 6 `sourceIssues`, with status `complete`. `cc-fb70e5` appears nowhere in its files.

Source: the author copy on [Scholze's page](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf) (print-ready files, 260 pages). Its SHA-256 `22550517…bffc` matches the recorded hash. Printed page = PDF page − 10. Like the extraction, I could not open the publisher's pages.

## 1. Items: complete

- **Coverage.** A script read the book's numbered statement headers: 451 of them, of every kind (Theorem, Proposition, Lemma, Corollary, Definition, Remark, Example and the rest). Every one is cited directly by the locator or name of some item.
- **Statements.** I compared these items with the text and they match: the statements at the six source issues, Theorem 21.2.2, and Definitions 20.4.1–20.5.3.
- **Not read.** I did not reread the whole book. I read the statements, the pages at every source issue, and the passages the routes quote.

## 2. Statuses: all hold

**Library.** All 21 cited declarations are in the pinned index. I opened three, and each provides its item:
- `AdicCompletion.pow_smul_top_eq_ker_eval` and `AdicCompletion.isAdicComplete` (Completeness.lean:154 and :184, both assuming `I.FG`): together they give M̂/I^nM̂ = M/I^nM and completeness, as Lemma 2.1.1 states.
- `TauCeti.Huber.PadicInt.not_isTateRing`.

**Planned.** The notes cite 115 packet node names, and all of them exist.

**Missing.**
- **By number.** For the 39 missing items, no packet node on main cites their statement numbers.
- **By topic.** I searched every packet's statements for p-divisible groups over O_C, Breuil–Kisin–Fargues modules, A_crys Dieudonné theory, Rapoport–Zink spaces, local models, Banach–Colmez spaces, seminormality, perfect schemes, integral Robba rings and admissible loci. I found no node that states any of them. The nearest are CohomologyComparisons' BKF lattice-recovery node and VectorBundlesAndIsocrystals' Fargues–Scholze Banach–Colmez nodes, and neither states the book's results.

## 3. Routes: all twelve accepted

**Part IIs (routes 1–5).** Each joins a candidate of the same id, and each candidate's original route was accepted on review. DESIGN jobs are pending for all five parents.

| Route | Part II id | Original route (accepted) | Why no layer owns it |
|---|---|---|---|
| 1 | PrismaticCohomologyPartIIPrismaticDieudonneTheory | Anschütz–Le Bras route 1; also Česnavičius–Scholze route 6 | AI.2 stops at Fargues' equivalence of BKF modules with (T, Ξ); R07.2 does Dieudonné theory over perfect fields |
| 2 | DiamondsAndVStacksIntegralPartII | Kisin–Pappas–Zhou route 6, whose item I01 is Proposition 18.4.1 | D6 glues X^♦ only for analytic spaces, "not full faithfulness of the functor on all analytic adic spaces" |
| 3 | GeometricSatakeLocalModelsPartII | Kisin–Pappas route 7 | GS0 builds Gr_{𝒢,Spd ℤ_p} from Lecture 21 but has no local models |
| 4 | HeckeStacksAndLocalShtukasIntegralPartII | Kisin–Pappas–Zhou route 7 | HS2 only asks to "match the Hecke-fibre description with known local Shimura moduli in examples" |
| 5 | ClassicalAdicEtaleCohomologyPartIIModPPoincareDuality | Zavyalov route 1 | the relative finiteness Theorem 10.5.1 has no owner |

Every import the briefs name exists in the atlas, including ReductiveGroupsPartII, PELModuli, PerfectoidQuotients Q0:integral-algebra and GS0:Witt-geometry.

**Two corrections.**
- **Route 5.** The reason said that finiteness of mod-p cohomology of proper smooth rigid spaces is planned nowhere. The absolute case is routed to PadicHodgeTheory P8 by accepted routes: PAPER-ZAVYALOV-25 route 7, PAPER-BHATT-MORROW-SCHOLZE-18 route 14 and PAPER-SCHOLZE-13 route 1. The Zavyalov candidate imports it from P8. The reason now says that only the relative version is unowned, and the brief imports P8 for the absolute case.
- **Route 4.** Its brief imported "the prismatic Dieudonné Part II" without an id. The brief now names it: PrismaticCohomologyPartIIPrismaticDieudonneTheory, route 1.

**Sources taking missing items (routes 6–8).**
- **Route 6.** VB3 owns Banach–Colmez spaces, and VB4 the slope-zero equivalence, whose integral forms and the simple connectivity of X_FF extend it.
- **Route 7.** RF0:integral-Y owns the sheafy charts of 𝒴 = Spa A_inf ∖ V([ϖ]).
- **Route 8.** HS2 owns the local shtuka moduli, and with them the lattice functors Latt and Rapoport's criterion.

**Sources naming planned items only (routes 9–12)**, which §16 allows:
- AI.2;
- PerfectoidSpaces P0–P6;
- DiamondsAndVStacks D0–D6;
- FarguesFontaineDiamonds F0, F1, F4.

## 4. Mistakes in the book: 6 of 6 confirmed

Each was read at its page:
- **E1** (p. 100): "i = dim_C H − 1".
  - **Redone.** A rational line W gives H = {W}, which has dimension 0, and the group μ_{p^∞} ⊕ (ℚ_p/ℤ_p)^{h−1}, so i = 1.
  - A line W in no rational hyperplane gives H = P^{h−1} and special fibre G_h, so i = h.
  - Hence i = dim_C H + 1. The printed formula gives −1 and h − 2.
- **E2** (p. 112): "by Proposition 13.2.1". The book's 13.2.1 is a theorem. The equality of sections is Proposition 13.3.2 (p. 110).
- **E3** (p. 123): "Proposition 14.4.3" for Theorem 14.4.3 (p. 121).
- **E4** (p. 193): "Theorem 14.2.3" for Lemma 14.2.3 (p. 117).
- **E5** (p. 149): I_U for I_V in Definition 17.1.1.
- **E6** (pp. 187, 190): indices run to n in Definitions 20.4.2, 20.4.4 and 20.5.3, where Definitions 20.4.1 and 20.5.1 have m untilts.

## 5. Checks

- **Prerequisites.** The ten DOIs resolve on Crossref to the stated titles, and arXiv:1711.06903 is Lourenço's paper.
- **Checker.** `scripts/check_paper.py` passes on the corrected extraction.
- **Changes.** They are:
  - route 5's reason and brief;
  - route 4's brief;
  - the six `review` verdicts;
  - a section "Corrections by the independent review" in the report.
