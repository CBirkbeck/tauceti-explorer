# PAPER-BIJAKOWSKI-PILLONI-STROH-16: Classicité de formes modulaires surconvergentes

Stéphane Bijakowski, Vincent Pilloni and Benoît Stroh, *Classicité de formes modulaires surconvergentes*, [Annals of Mathematics 183 (2016), no. 3, 975–1014](https://doi.org/10.4007/annals.2016.183.3.5).

Extraction by Claude Code, session `cc-fb70e5`, 29 September 2026 (issue #1186). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-BIJAKOWSKI-PILLONI-STROH-16.result.json](PAPER-BIJAKOWSKI-PILLONI-STROH-16.result.json). It has:
- 41 items: 1 library, 8 planned, 32 missing;
- 5 routes: a Part II joined with the pending proposal of PAPER-PILLONI-20, and four sources of existing layers;
- 17 prerequisite entries;
- 7 recorded mistakes: 5 misprints, 1 error and 1 gap.

After the independent review (REV-PAPER-BIJAKOWSKI-PILLONI-STROH-16, research/blueprint/reviews/REV-PAPER-BIJAKOWSKI-PILLONI-STROH-16.md) the extraction has 43 items (1 library, 7 planned, 35 missing), five routes, 19 prerequisite entries and 14 recorded mistakes, all confirmed. The review corrected the extraction in place:
- **Fargues's degree** (item 10) now goes to HodgeTateAndCanonicalSubgroups T0. The accepted extractions of Boxer–Pilloni (2026) and Boxer–Calegari–Gee–Pilloni (2021) already route the degree there, so R07.1 would have been a second owner.
- **The frontier.** Items 34 and 36 (Lan's compactification and Köcher principle at C5) are restated for the normalization model. The identification with the moduli model X_Iw is item 35, now missing and in the Part II, since M4 plans normality only of the normalization. Serre–Tate (item 6) is stated as A4 plans it, and its stack form moved to item 7. Wedhorn's theorem (item 12) keeps only the good-level statement, and Remark 1.5.1's Iwahori-level clauses are item 43.
- **Statuses.** Items 2, 5 and 8 gain M0 or C5. Item 4 is narrowed to what Mathlib states.
- **Routes.** Route 1 gains R0. Lemma 1.1.4 (item 3) moves to PELModuli M0.
- **Two items added:** 42 (the maximum modulus principle) and 43.
- **Seven new mistakes (E8–E14),** including a gap in the continuation over half-open boxes (E12). E6's repair is amended to cover the zero-dimensional cases.
- **Prerequisites.** Bijakowski (ANT 2016), a follow-up the paper does not cite, is removed. Abbes–Mokrane, Bosch and Stroh are added.

Route numbers in the result file differ from the list below: 1 = AdicSpacesPartII, 2 = T0, 3 = PELModuli, 4 = C5, 5 = the Part II.

## Sources read

- **The published version** is freely served by the Annals site. I read all 40 pages (pp. 975–1014), including every proof. Item locators are the journal's pages.
- **Language:** the paper is in French. The items translate its statements.
- **Related preprints:** the authors state that the text rewrites Bijakowski's preprint arXiv 1212.2035. That preprint and his follow-up on μ-ordinary loci (Algebra Number Theory 2016) were identified but not compared.
- **Errata:** the Annals page lists no erratum, and Crossref records no update.
- **Page images:** every mistake was checked on a page image.

## What the paper proves

**Main theorem (Theorem 5.3.1).**
- Setting: X_Iw is a PEL Shimura variety of type (A) or (C) at Iwahori level in p. Here p is unramified, split in F over F0 in type (A), and totally split in the reflex field (Hypothesis 1.1.1).
- Statement: an overconvergent form f of weight κ that is an eigenform of each U_i (one per prime of F0 above p), with eigenvalues α_i ≠ 0, is classical when κ is large against the v(α_i) (Hypothesis 4.5.1).
- Examples: GSp_{2g} over F of degree d with p inert needs inf k_{σ,g} > v(α) + dg(g+1)/2. A unitary group of signature (a, b) needs inf(k_{σ,a} + l_{σ,b}) > v(α) + dab.

**How the proof goes.** It is Buzzard–Kassaei's method in higher rank.
- **Measuring distance.** Fargues's degree of the Iwahori subgroup gives δ : X^rig_Iw → ∏ [0, d_ia_i]. The ordinary-multiplicative tube is δ = max.
- **Dynamics (§3).** U_i never decreases δ_i. It increases δ_i strictly where δ_i is not an integer (Propositions 3.1.1–3.2.1). So f extends to X_Iw(1−) by the functional equation f = α^{−N}U^N f (Proposition 4.2.1).
- **The remaining region.**
  - On the rest, the complement subgroups of type U_i split into good ones (degree < 1, landing in X_Iw(1−)) and bad ones.
  - The space is covered by good sequences of opens that count bad complements (§4.3). The whole iterate U_i^N decomposes on them (Theorem 4.4.1).
  - The bad operators have norm < 1 under the weight–slope hypothesis (Lemma 4.4.5).
  - Kassaei series built from them converge, agree up to u_0^N and glue modulo p^{A_N} (§4.5). This gives f on all of X^rig_Iw.
- **Algebraisation (§5).** Lan's toroidal compactifications at Iwahori level and his Köcher principle extend f to the compactification. Rigid GAGA then makes it classical.

## What the atlas already has

**Library (1 item).** Morita equivalence for matrix algebras: `moritaEquivalenceMatrix`, `IsMoritaEquivalent.matrix`.

**Planned (7 items; corrected by the review).**
- PEL data, the good-prime conditions and the smooth model: PELModuli M0 and M2, with its quasi-projectivity at ShimuraCompactifications C5. The normality of the moduli model X_Iw is not planned: M4 plans normality only of the normalization model, so item 35 is missing.
- Serre–Tate for PEL abelian schemes: AbelianSchemesAndArithmeticModuli A4.
- Automorphic bundles ω^κ and classical forms: AutomorphicBundles B2, B4, with the integral sheaf at C5.
- Rigid GAGA: AdicSpacesPartII R1.

## Routes

1. **Joined Part II `HigherHidaAndColemanTheory`** (25 missing after the review: item 3 moved to PELModuli, and items 35 and 43 joined). Parent: PadicFamilies. It keeps the title, parent and area proposed by PAPER-PILLONI-20 and joined by PAPER-BOXER-CALEGARI-GEE-PILLONI-21 and PAPER-BOXER-PILLONI-26.
   - **What this paper adds:** the degree-0 Coleman theory for PEL types (A) and (C):
     - Barsotti–Tate stacks with Iwahori level, and the degree map and ordinary tube;
     - overconvergent forms, and the U_i with their normalisation;
     - the dynamics, and continuation to X_Iw(1−);
     - the good/bad decomposition, the norm bound and Kassaei series;
     - the formal and rigid Köcher corollaries;
     - Coleman's modular-curve theorem and Theorem 5.3.1.
   - **Why this Part II:** small-slope classicality is Coleman theory for coherent cohomology in degree 0. PadicFamilies stops at modular curves and totally real fields in one degree, and OverconvergentAutomorphicForms builds coefficient sheaves, not classicality.
   - **For the design job:** the brief asks it to compare this with the joined briefs' higher Coleman theory for GSp_{2g}, rather than build two classicality theorems.
2. **Source of AdicSpacesPartII [R0, R2, R3]** (5 missing; R0 and item 42 added by the review). General rigid geometry:
   - Kassaei–Bartenwerfer bounded sections;
   - finite étale images and strict neighbourhoods;
   - the finiteness criterion 4.1.8;
   - the identity principle;
   - the maximum modulus principle (item 42).
3. **Source of HodgeTateAndCanonicalSubgroups [T0]** (1 missing). Fargues's degree and its monotonicity. (Corrected by the review from R07.1: the accepted extractions of Boxer–Pilloni (2026, route 12) and Boxer–Calegari–Gee–Pilloni (2021, route 13) already own the degree at T0.)
4. **Source of PELModuli [M0, M2]** (2 missing). Lemma 1.1.4 and Wedhorn's ordinariness theorem for the good-level model. (Corrected by the review: M0 and Lemma 1.1.4 added; the Iwahori-level clauses are item 43, in the Part II.)
5. **Source of ShimuraCompactifications [C5]** (2 missing). Lan's toroidal compactifications of the Iwahori-level normalization model, and his Köcher principle modulo π^n. (Corrected by the review: stated for the normalization model, since the moduli model X_Iw is item 7, downstream of C5.)

## Source issues (`sourceIssues` E1–E14)

**E6 (gap, the proof of Theorem 5.3.1, p. 1011).**
- When the symmetric space has dimension ≤ 1, the proof cites Coleman and Kassaei, who treat only the modular curve.
- Hypothesis 1.1.1 also allows other cases:
  - Shimura curves of indefinite quaternion algebras (type (C), n = 2);
  - unitary curves;
  - 0-dimensional cases.
- **Repair:** compact curves and the zero-dimensional cases (amended by the review) follow from §4 and GAGA on the proper X_Iw. Non-compact unitary curves need the cusp analysis of Remark 5.3.2.

**E7 (error, affects nothing, §5.2, p. 1010).** "on suppose donc d > 1 ou a_1 > 1 si d = 1" misstates Hypothesis 1.4.2 in type (A).
- U(1, 2) with d = 1 has a symmetric space of dimension 2 although a_1 = 1.
- d = 2 with signatures (1, 1) and (0, 2) gives dimension 1 although d > 1.
- The dimension is Σ a_τb_τ. Proposition 5.2.1 uses the true condition.

**Misprints (affect nothing).**
- E1: ⊕_{i=1}^d for the primes above p should be ⊕_{i=1}^h.
- E2: the type-(C) Barsotti–Tate group has height 2d_ia_i, not 2a_i.
- E3: "1 ⩽ i ⩽ d" for the U_i should be 1 ⩽ i ⩽ h.
- E4: Proposition 4.1.8 says U → Y is open and closed. What is needed is that U → X is.
- E5: "a_1" should be α_1 in Proposition 4.5.8.

**Added by the review (E8–E14).**
- **E12 (gap, affects the proof).** §4.5 claims δ_i^{−1}([d_ia_i − 1 + β_0, d_ia_i]) ∩ W_0 is quasi-compact, so that f is bounded there. The proof of Proposition 4.5.8 applies §4.5 on boxes with half-open sides, where that set is not quasi-compact. The repair is routine: run §4.5 on closed sub-boxes and exhaust.
- **Misprints (affect nothing):**
  - E8: in the proof of Proposition 3.1.2, (G/L, π(H_•)) should be p_2^BT(G, H_•, L);
  - E9: C^rig_{i,a_i} should be C_i^rig (p. 993);
  - E10: the length in Theorem 4.4.1 is off by one;
  - E11: U^bad_{i,j,k_1} should be U^bad_{i,k,k_1} (pp. 1005–1006);
  - E13: index and cross-reference slips on pp. 1006 and 1008;
  - E14: "[Lan16, rem. 13.12]" is Example 13.12 in the version cited.

## Prerequisites not yet covered

Nineteen entries after the review:
- Coleman (Invent. 1996), Kassaei (Duke 2006), Buzzard (JAMS 2003), Pilloni (Duke 2011);
- Fargues (Crelle 2010);
- Kottwitz (JAMS 1992);
- Wedhorn (Ann. ÉNS 1999);
- Lan: the monograph (2013), IMRN 2017 (no. 11, 3237–3280), Forum Sigma 2016, MRL 2016;
- He (Duke 2013), Görtz (Math. Ann. 2001; Adv. Math. 2003);
- Bosch–Lütkebohmert (Math. Ann. 1993);
- Kiehl (Invent. 1967);
- Abbes–Mokrane (Publ. IHÉS 2004), Bosch (PAMQ 2009), Stroh (Bull. SMF 2010), added by the review.

Bijakowski (ANT 2016), a later generalisation that the paper does not cite, was removed by the review.

Every DOI was checked against Crossref.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BIJAKOWSKI-PILLONI-STROH-16.result.json` reports no errors.
- Every planned and route stage id exists in `data/atlas.json`.
- The two Mathlib citations were found in the pinned index at Mathlib 082e2d3, and their statements were read in the Lean file.
