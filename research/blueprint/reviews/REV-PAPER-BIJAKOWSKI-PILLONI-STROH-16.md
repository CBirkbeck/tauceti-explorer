# REV-PAPER-BIJAKOWSKI-PILLONI-STROH-16: review of the extraction of Bijakowski–Pilloni–Stroh, *Classicité de formes modulaires surconvergentes*

**Verdict: accept, after corrections made in place.**

- **Routes.** All five are accepted, and four are corrected in place:
  - Fargues's degree moves from R07.1 to HodgeTateAndCanonicalSubgroups T0, where two accepted extractions already own it.
  - Three items routed to C5 and M2 needed the Iwahori-level moduli model X_Iw of item 7, which is routed downstream to the Part II. They are restated or split.
- **Mistakes.** All seven recorded mistakes are confirmed, and E6's repair is extended to the zero-dimensional cases. The review adds seven more (E8–E14). One of them, E12, is a gap in the proof: the continuation over boxes with half-open sides.
- **Items.** Two are added and nineteen corrected. The result has 43 items: 35 missing, 7 planned, 1 library.

Reviewer: Claude Code, session `cc-58621d`, 30 September 2026 (issue #1187). Extraction under review: Claude Code `cc-fb70e5` (issue #1186, PR #4283). At review it had:
- 41 items (32 missing, 8 planned, 1 library);
- five routes;
- seven `sourceIssues`;
- status `complete`.

`cc-58621d` appears nowhere in its files.

Sources:

- **Version of record.** Ann. of Math. 183 (2016) 975–1014, the Annals' free PDF, SHA-256 `13c159cd…1d92c` (the recorded hash). All 40 pages were read, on page images wherever an index, a formula or a reference mattered (pp. 979–994, 997, 1000, 1001, 1004–1006 and 1008–1012).
- **Cited works.**
  - SGA 1 (arXiv math/0206203), Exposé V 3.5, for E4.
  - Lan, Forum Math. Sigma 4 (2016) e1 (open access, doi:10.1017/fms.2015.31), for E14.
  - Johansson (arXiv 1208.1034v2), Theorem 33, for E6.
- **Errata.** Crossref (no update-to relation and no work declaring an update) and the Annals article page (no erratum), both on 30 September 2026.
- **Libraries and atlas.** Mathlib 082e2d37 and Tau Ceti f790474, and the atlas as `scripts/build.py` assembles it.

Method:
- Four read-only readers checked the items and mistakes, one per part of the paper:
  - the introduction and §1;
  - §§2–3;
  - §4;
  - §5 and the bibliography.
- A fifth checked statuses, routes and precedents.
- I rechecked every finding before applying it: E6 and E7 against §1.1, E12 and E10 in the text of pp. 998–1009, E14 in Lan's published paper, and each route claim against the layer texts and the accepted extractions it cites.

## 1. Items

**Added.**

| Item | Status | Use |
|---|---|---|
| 42. Maximum modulus principle for rigid spaces | missing, route 1 (AdicSpacesPartII) | proof of Proposition 3.2.1: the increase of δ_i is uniform on quasi-compact opens |
| 43. Remark 1.5.1: ordinary loci at Iwahori level | missing, route 5 (Part II) | split from item 12, because it needs X_Iw (item 7); the density claim is asserted without proof ("On peut montrer") |

**Corrected statements.**
- **1:** keeps the type (A) signature identity apart from the type (C) definition of a, and adds the integral data O_B and U.
- **3:** Remark 1.1.3's convention, since the other choice of σ swaps (a_τ, b_τ). The lemma is type (A) only.
- **4:** narrowed to the Morita equivalence for M_n(R), which is what Mathlib states. The product step moved to the note.
- **6:** Serre–Tate for PEL abelian schemes, as A4 plans it. The formal étaleness of P needs the stacks of item 7, so it moved to item 7.
- **10:** adds additivity in short exact sequences, used on p. 992.
- **11:**
  - adds the hypothesis dim G = fl that "ordinary-multiplicative" needs (p. 987);
  - adds the analytic nature of δ: |δ_L| = p^{−deg L} ([Pil11, §2.2.2]), quasi-compact level sets, and δ_i∘p₂ − δ_i∘p₁ as a valuation.
- **12:** Wedhorn's theorem for the good-level model only.
- **14, 15:** the correspondences are defined over K and are finite étale there. C_i^rig is defined, and U acts on O_K̄-points through schematic closure.
- **19:** the Banach norm and the operator norm of a correspondence, which Lemma 4.4.5 bounds.
- **28:** defines L = F_i^±·L₀ (Remark 4.3.4).
- **29:** the weight coordinates of p. 994: k_{i,j,a_i} and l_{i,j,b_i} are the smallest entries.
- **33, 40:** pointers to E12.
- **34, 36:** restated for the normalization model (see route 4).
- **35:** the normality of the moduli model, now missing (see §2).
- **37:** names the formal completions.

Notes were added to 13, 16 and 39, naming the nearest atlas layers so that the design reuses them:
- OverconvergentAutomorphicForms O3/O8 for 13;
- O6 for 16;
- PadicFamilies L2 for 39.

**Checked and right as extracted.**
- Items 16–18, 20–27, 30–32, 38 and 41.
- Item 41's two special cases agree with Hypothesis 4.5.1 at h = 1.
- No other definition or theorem on the way to Theorem 5.3.1 lacks an item. The readers' further candidates are all folded into existing items:
  - the auxiliary moduli B_k of Lemma 4.3.6;
  - the pointwise form of the Kassaei series;
  - schematic closure.

## 2. Statuses

- **Library (item 4).** `moritaEquivalenceMatrix` and `IsMoritaEquivalent.matrix` (Mathlib `RingTheory/Morita/Matrix.lean:205, 218`) state M ↦ E₁₁M exactly. The item now says only that.
- **Planned.** Each layer's text was read.
  - **1, 9, 38:** right as extracted.
  - **2:** gains M0.
  - **5:** gains C5, because M2 says: "Quasi-projectivity and scheme representability of all these integral algebraic spaces are proved by the compactification step C5."
  - **8:** gains C5 for the integral sheaf, as in Pilloni (2020), Boxer–Calegari–Gee–Pilloni (2021) and Calegari–Geraghty (2020).
  - **6:** now states what A4 plans.
- **Item 35 was wrongly planned.** M4 plans normality of the normalization model only: "Do not assert smoothness, a fine moduli interpretation, or a universal abelian scheme on such a normalization without a separate theorem." The moduli model's normality rests on PEL local models ([He13], or [Str10] with Görtz's flatness), which no layer plans. It is missing, in the Part II with item 7, as the accepted extractions of Pilloni (2020) and Boxer–Calegari–Gee–Pilloni (2021) keep Iwahori local-model geometry in their Part IIs.
- **Missing.** Searched the atlas and packets for Barsotti–Tate stacks, Iwahori-level PEL models, degree maps, Kassaei series, good/bad decompositions and PEL classicality. Nothing owns them.
  - HilbertModularVarietiesAndShimuraCurves H4 builds Iwahori level for Hilbert varieties only.
  - OverconvergentAutomorphicForms O8 excludes classicality.
  - No layer names the rigid maximum principle.

## 3. Routes

Numbered as in the result file.

1. **AdicSpacesPartII [R0, R2, R3]: accept, corrected.** R0 (finite and étale maps) is added, as in Pilloni (2020, route 7), and item 42 joins.
2. **HodgeTateAndCanonicalSubgroups [T0]: accept, re-routed from R07.1.** Boxer–Pilloni (2026, route 12) and Boxer–Calegari–Gee–Pilloni (2021, route 13), both accepted, already send Fargues's degree to T0. T0's text builds on R07.1–R07.2 without "a second p-divisible group". A route to R07.1 would have made a second owner.
3. **PELModuli [M0, M2]: accept, corrected.** Wedhorn's theorem stays at M2 for the good-level model. Lemma 1.1.4, PEL linear algebra, joins from the Part II with M0. Remark 1.5.1's Iwahori-level clauses are item 43, in the Part II.
4. **ShimuraCompactifications [C5]: accept, corrected.** As submitted, items 34 and 36 needed the moduli model X_Iw, which is item 7 in the Part II, downstream of C5. The paper builds X^S_Iw from a normalization in an auxiliary Siegel variety and uses the normality of X_Iw only to identify the two (p. 1009). So 34 and 36 are stated for the normalization model, and item 35 makes the identification in the Part II. The precedents for Köcher at C3–C5 are accepted: Pilloni (2020), Boxer–Calegari–Gee–Pilloni (2021) and Calegari–Geraghty (2020).
5. **Part II HigherHidaAndColemanTheory: accept, corrected.**
   - It coalesces: parent PadicFamilies, id, title and area are identical to the accepted routes of Pilloni (2020), Boxer–Calegari–Gee–Pilloni (2021) and Boxer–Pilloni (2026).
   - Nothing in the atlas owns PEL classicality.
   - The brief now states Hypothesis 4.5.1 with its indices, imports T0, R0–R3 and M0, and asks for E12's exhaustion step.
   - Items 35 and 43 join, and item 3 leaves.

Every missing item is routed exactly once (35 of 35), and every stage exists.

## 4. Mistakes in the paper

**E1–E7: all confirmed.**
- **E1, E3.** d is printed for h, twice on p. 984 and twice on p. 994. These are the only such slips; every other d counts the real embeddings of F0.
- **E2.** The type (C) height is 2d_ia_i. It follows from BT^{f,pol}_l having height 2lf, and from counting heights in A[π_i^∞].
- **E4.** SGA 1 V 3.5, applied to U → X, makes U open and closed in X. It is a proposition there, not the printed "coro.".
- **E5.** The paper prints a₁ where α₁ is meant.
- **E6 (gap).** Two data satisfying Hypothesis 1.1.1 give compact curves that are not modular curves:
  - an indefinite quaternion division algebra over Q with p ∤ disc(B) (type (C), n = 2) gives compact Shimura curves;
  - d = 2 with signatures (1, 1) and (0, 2) over a split p gives compact unitary curves.

  Definite signatures give points, where "donc a le demi-plan de Poincaré" is itself false. [Col96] and [Kas06] treat modular curves only. [Joh13, Thm 33(b)] gives quaternionic curves over Q only the classicality of the eigenvalue system, so it does not close the gap. The repair is extended to the zero-dimensional cases, which are proper.
- **E7 (error, affects nothing).** The dimension is Σ a_τb_τ in type (A) and d·a(a+1)/2 in type (C).
  - The reformulation "d > 1 ou a₁ > 1" is right in type (C) only.
  - A further counterexample: d = 1 with the definite signature (2, 0) has a₁ = 2 but a point as symmetric space.
  - In type (A), a₁ even depends on how π₁^± are labelled.

**Added by this review, each checked on the page image:**
- **E8 (misprint).** In the proof of Proposition 3.1.2 (p. 992), (G/L, π(H_•)) should be p₂^BT(G, H_•, L). For k > l, π(H_k) = G[p]/L on the generic fibre, which is no flag.
- **E9 (misprint).** C^rig_{i,a_i} should be C_i^rig (p. 993).
- **E10 (misprint).** Theorem 4.4.1 (p. 1000) says "de longueur L(N)" and "0 ≤ k ≤ L(N) − 1". The proof uses V_{L+1} = ∅ with a decomposition on every k ∈ S_N, S₁ = {0, …, N_max}, so the length is off by one.
- **E11 (misprint).** In Definition 4.5.2 and the lines around it (pp. 1005–1006), the first bad operator is U^bad_{i,k,k₁}, as in Theorem 4.4.1, not U^bad_{i,j,k₁}.
- **E12 (gap, affects the proof).**
  - §4.5 takes "I_j un intervalle" and asserts that δ_i^{−1}([d_ia_i − 1 + β₀, d_ia_i]) ∩ W₀ is quasi-compact, so that f is bounded by some M (p. 1006).
  - The proof of Proposition 4.5.8 applies §4.5 with sides ]d_ja_j − 1, d_ja_j] (p. 1009). That set is then an increasing union of quasi-compact opens and is not quasi-compact, and U_γ is not quasi-compact either, as Definition 4.3.2 requires.
  - The repair is routine: closed sub-boxes, then an admissible exhaustion, using |δ_L| = p^{−deg L}.
- **E13 (misprint).** Index and cross-reference slips in the proofs of Lemma 4.5.3 and Proposition 4.5.7 (pp. 1006, 1008):
  - U^good_{p,i_k};
  - f_{N,i};
  - h₂'s index sets;
  - "lemme 4.1.2" for Proposition 4.1.2.
- **E14 (misprint).** "[Lan16, rem. 13.12]" (p. 1009) is Example 13.12 in the published version the bibliography cites.

**Not recorded**, as trivial: "cas cas" (p. 975), "quadruplets" (p. 985), b ∈ B for the Borel B_M (p. 986), Spec(F_p) for the residue field of O (p. 987), an unbalanced parenthesis in Corollary 3.2.2, Remark 2.3.2's formula holding only for i ≠ j, the X^S_Iw / X̄^S_Iw notation in §5, and the Zbl number printed for [Gör03].

## 5. Prerequisites

- **Checked on Crossref.** All seventeen DOIs resolve and match.
- **Lan's IMRN paper** is completed to 2017, no. 11, 3237–3280 (zbMATH 1405.14124). Its theorem numbers come from the 2015 preprint the paper cites.
- **Removed:** Bijakowski (ANT 2016). It is a later generalisation, and the paper does not cite it.
- **Added:** Abbes–Mokrane (Publ. IHÉS 2004, Lemma A.1.1), Bosch (PAMQ 2009, openness of flat maps) and Stroh (Bull. SMF 2010, Prop. 3.1.7.1).
- **Not added:** Berthelot's 1996 preprint, the source of the identity principle, has no working public link. It stays cited in item 22.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BIJAKOWSKI-PILLONI-STROH-16.result.json` reports ok.
- The errata checks (`versions_checked`, `check_issues`) report nothing. `collation.provenance` gives `published`.
- `python3 research/blueprint/intake.py check-files` on the four files reports no problems.
- The source PDF's SHA-256 matches the recorded hash.
- Lean: none.
