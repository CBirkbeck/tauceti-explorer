# REV-PAPER-HEUER-25: review of the extraction of Heuer, *A p-adic Simpson correspondence for smooth proper rigid varieties*

**Verdict: accept, after corrections made in place.**

- **Routes.** All six are accepted: the four submitted and two added. Routes 1, 3 and 4 are corrected in place:
  - routes 1 and 3 had clauses needing layers built after them;
  - route 4 held Higgs bundles, which an accepted Part II already owns, and cited a rejected Liu–Zhu route.
- **Mistakes.** All four recorded mistakes are confirmed, including the gap E4 in Lemma 5.7 for p ≥ 3. The review adds nine misprints (E5–E13).
- **Items.** Five items are added and twelve corrected. The result has 48 items: 40 missing, 7 planned, 1 library.
- **Version.** The extraction read the published open-access text. Springer served this review only a JavaScript challenge, so the review read arXiv 2307.01303v3 (21 January 2025, three days before acceptance), by statement number. `sourceVersions` records that, and E5–E13 are scoped to v3.

Reviewer: Claude Code, session `cc-58621d`, 30 September 2026 (issue #1221). Extraction under review: Claude Code `cc-fb70e5` (issue #1220, PR #4343). At review it had 43 items (38 missing, 4 planned, 1 library), four routes and four `sourceIssues`, with status `complete`. `cc-58621d` appears nowhere in its files.

Sources:

- **Preprint.** arXiv 2307.01303v3, 34 pages, SHA-256 `df8caac5…8943`. Statements were located by number.
- **Version of record.** Invent. Math. 240 (2025) 261–312, doi:10.1007/s00222-025-01321-4. It is open access, but this review could not open it (Springer served a JavaScript challenge), so the journal's page numbers were not rechecked.
- **Cited works.** Scholze's survey (arXiv 1303.5948) and Perfectoid spaces (arXiv 1111.4914) were read for the citation findings.
- **Libraries and atlas.** Mathlib 082e2d37 and Tau Ceti f790474, and the atlas as `scripts/build.py` assembles it at `3a19e32b`.

Method:
- Three read-only readers checked the items:
  - items 1–16: definitions and imported inputs;
  - items 17–33: §§2–3;
  - items 34–43: §§4–5.
- A fourth reader checked the routes and the other fields.
- I rechecked every finding and each graph and precedent claim before applying a fix, and recomputed E4.

## 1. Items

**Added.**

| Item | Status | Use |
|---|---|---|
| 44. Pro-étale base change π_{Y*}B = B(X) ⊗ O_{Y_proét} | missing, route 1 (P8) | split from item 10: a pro-étale statement, downstream of AdicSpacesPartII R3 |
| 45. The étale site of a rigid space and of its diamond | planned, DiamondsAndVStacks D6 | proofs of Theorems 2.4(3) and 3.2 ([38, Lemma 15.6]) |
| 46. Continuous group cohomology on a toric chart | missing, route 4 | the Koszul comparison in Lemma 5.7 |
| 47. Almost purity | planned, PerfectoidSpaces P3 | proof of Proposition 2.9(i) |
| 48. Pro-étale cohomology of pulled-back étale sheaves | planned, ClassicalAdicEtaleCohomology H0 | Lemma 2.8, following PAPER-SCHOLZE-13's classification |

**Status changes.**
- **Item 7, the Faltings extension, is now planned at PadicHodgeTheory P8:local-rational.** Its node `poincare-lemma-and-faltings-extension` states it for X smooth over a discretely valued field, the setting of Remark 2.17. The remark's duality with the class of L_𝕏 moved to item 21, where L_𝕏 is defined.
- **Item 12, rigid proper base change, is now missing.** DiamondEtaleCohomology C5 plans proper base change only "when f is quasi-pro-étale or the coefficient ring has a prime-to-p annihilator". Heuer applies Bhatt–Hansen's theorem with p-power coefficients (R^2π′_*μ_p in Corollary 2.19). It joins route 6.
- **Item 1's planned list.** AInfCohomology AI.3, which builds the sheaves only on generic fibres of smooth formal schemes, is replaced by P8:local-rational. That stage plans O, O^+ and Ô on X_proét and the affinoid perfectoid basis.

**Corrected statements.**
- **6.** The finiteness of H^1_ét(X′, μ_p) is used for the spectral variety X′, which is proper but may be singular. The cited [37, Thm. 3.17] covers any proper X, and the item now says so. The lift-induced Hodge–Tate decomposition is dropped (route 1).
- **10.** Keeps the coherent formula only (see item 44).
- **11.** Gains §2.3's standing hypotheses: X quasi-compact and smooth, and B coherent on X_an.
- **17, 29.** Gain their sections' standing hypotheses: X proper for Definition 2.2; B an O_X-torsion-free coherent algebra on smooth proper X for §3.2.
- **37.** Lemma 4.6's convergence condition and the factor x in the Δ-action.
- **42.** Keeps the sheaf-level C^•_Higgs separate from the global RΓ_Higgs.
- **35.** A note that the toric chart is already the setting of a P8 node.

## 2. Statuses

- **Library.** Item 14's `ContinuousLinearMap.isOpenMap` exists at the pin and covers the use.
- **Planned.**
  - Item 9 is planned at AdicSpacesPartII R3.
  - Item 13 is planned at ClassicalAdicEtaleCohomology H0.
  - Items 1 and 7 are corrected as above, and items 45, 47 and 48 are added.
- **Missing.**
  - No layer plans a p-adic Simpson correspondence, Higgs–Tate torsors, rigidified Picard functors, the exponential of rigid groups, Rodríguez Camargo's canonical Higgs field, or p-torsion proper base change for rigid spaces.
  - Mathlib and Tau Ceti have none of them.

## 3. Routes

1. **PadicHodgeTheory P8: accept as corrected.**
   - P8 owns R^nν_*Ô and the primitive comparison, following PAPER-ZAVYALOV-25's accepted route 7.
   - The lift-induced decomposition and the Faltings duality needed route 4's lifts and torsor, which are built on top of P8, so they left the route.
   - The route now holds items 6 and 44.
2. **DiamondsAndVStacks D2: accept.** Kedlaya–Liu's descent of vector bundles extends D2's v-descent. The v-site is to be read as perfectoid spaces over X, since the diamond X^◇ is D6's and D6 requires D2.
3. **AdicSpacesPartII R2–R3: accept as corrected.** The pro-étale clause of item 10 needed layers downstream of R3 (R3 → A1 → R4) and is now item 44. Item 11 is an R3 statement using R2's formal models.
4. **PadicHodgeTheory Part II: accept as corrected.**
   - Nothing in the atlas plans the correspondence, and it joins the other accepted PadicHodgeTheory Part II proposals in one design.
   - Item 3 moved out: twisted Higgs bundles, including the p-adic Ω^1(−1) case, belong to PAPER-LIU-ZHU-17's accepted HodgeStructuresPartII.
   - The reason and brief no longer credit Liu–Zhu's functor to T6:comparison. That route was rejected, and T6:comparison plans logarithmic Riemann–Hilbert.
   - The brief states Theorem 5.5 at sheaf level (Rν_*V = C^•_Higgs(E, θ) in D(X_ét)) and Proposition 5.3 exactly, and names its imports by title.
5. **HodgeStructuresPartII (added): accept.** Its parent, id, title and area are PAPER-LIU-ZHU-17's accepted route 14. Item 3 joins that design, and route 4 imports it.
6. **ClassicalAdicEtaleCohomology mod-p Part II (added): accept.** Its parent, id, title and area are PAPER-ZAVYALOV-25's accepted route 1, the Part II for p-torsion étale cohomology of rigid spaces. Item 12 joins it.

Coverage: every missing item is routed exactly once, and no planned item is routed.

## 4. Source findings

**E1–E4 are confirmed**, in arXiv v3.
- **E1.** v3's reference [7] is Bosch–Lütkebohmert, *Formal and rigid geometry II*, a paper on flattening, and *Néron Models* is not in the bibliography.
- **E2** and **E3** are index slips.
- **E4** is the substantive one, recomputed here.
  - §3.3 defines exp on the open disc p^α m_K with α = 1/(p − 1). The proof of Lemma 5.7 works in O_U⟨p^{−α}∂⟩, which is the closed disc.
  - In y = p^{−α}∂ the coefficient of y^n in exp(∂) has valuation s_p(n)/(p − 1), which equals 1/(p − 1) at every n = p^k. So exp(∂_i) is not in the Tate algebra.
  - log(1 + T)/T has a unit coefficient at z^{p−1} (with T = p^α z) and vanishes at ζ_p − 1.
  - For p = 2, α = 2 and the argument works.
  - Any radius |p|^β with β > 1/(p − 1) repairs it, and Theorem 5.5 stands.

**E5–E13 are new** misprints, checked in arXiv v3 and not compared with the published text. None affects the mathematics.

| id | where | finding |
|---|---|---|
| E5 | §1.2, before (1) | the lift-induced decomposition is credited to [37, Thm. 3.20], which gives only the Hodge–Tate spectral sequence |
| E6 | proof of Proposition 2.9(i) | almost purity cited as [35, Thm. 5.2], the tilting equivalence; it is Theorem 7.9 |
| E7 | proof of Theorem 3.2, after (8) | torsors under H^1(X′, μ_{p^n}) for H^1(X′, μ_p) |
| E8 | proof of Lemma 2.21 | an unnamed map called "h" |
| E9 | after Corollary 2.11 | "short exact" for the left-exact sequences the corollary gives |
| E10 | Theorem 4.4 | the sentence describes LS_f⁻¹, not LS_f |
| E11 | Lemma 4.6 | the factor x dropped from the Δ-action |
| E12 | proof of Proposition 4.13 | a sign: HTlog(A ⊗ L^{−1}) = HTlog(A) − HTlog(L) |
| E13 | proof of Theorem 5.1 | τ_{B_v} for τ_{B_V} |

## 5. Other fields

- **`sourceVersions`** gains the arXiv v3 entry the review read. The published entry stays, so `collation.py` still classifies the paper as read in its published version.
- **`summary`** is updated with the new routes and the thirteen mistakes.
- **Prerequisites.** Three entries that the atlas already covers are removed: Scholze, *Perfectoid spaces* (PAPER-SCHOLZE-12); Scholze, *p-adic Hodge theory for rigid-analytic varieties* (PAPER-SCHOLZE-13); and Liu–Zhu (PAPER-LIU-ZHU-17). PROTOCOL §16 limits prerequisites to papers the atlas does not yet cover. The other fifteen resolve.
- **PAPER-HEUER-25.md.**
  - It gains a post-review summary and a note on route numbering.
  - It no longer credits Liu–Zhu's functor to T6:comparison.
  - It no longer cites Liu–Zhu as the Faltings-extension precedent.

## 6. Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-HEUER-25.result.json`: ok.
- `source_issues.check_issues` and `check_errata.versions_checked`: no errors.
- **Intake file validation** on the four deliverables: 0 problems.

Pre-review inputs at `3a19e32be7fece74538ba85dfc1c5d803e8110d5` (SHA-256):

| Input | SHA-256 |
| --- | --- |
| PAPER-HEUER-25.result.json | `b9ea85d0c1734ad76b9f04f125f573d14de83020b43dc7c46714a08c0999e3f3` |
| PAPER-HEUER-25.md | `b6ccd18e145b60ea69349651aef6555d1c369a527856e8f0f01516061bc5aa52` |
| data/atlas.json | `62ab6c2ccb94ee9c4d99813da02b69656941721d30fc29384e2b7e6e86361c56` |

No Lean file is a deliverable, and no Lean was run.
