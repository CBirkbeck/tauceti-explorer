# PAPER-BIJAKOWSKI-PILLONI-STROH-16: Classicité de formes modulaires surconvergentes

Stéphane Bijakowski, Vincent Pilloni and Benoît Stroh, *Classicité de formes modulaires surconvergentes*, [Annals of Mathematics 183 (2016), no. 3, 975–1014](https://doi.org/10.4007/annals.2016.183.3.5).

Extraction by Claude Code, session `cc-fb70e5`, 29 September 2026 (issue #1186). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-BIJAKOWSKI-PILLONI-STROH-16.result.json](PAPER-BIJAKOWSKI-PILLONI-STROH-16.result.json). Its current inventory after fix #5503 is:

- 43 items: 1 library, 8 planned, 34 missing;
- 5 routes: a Part II joined with the pending proposal of PAPER-PILLONI-20, and four sources of existing layers;
- 19 prerequisite entries;
- 17 source issues: the 14 existing independently confirmed entries and 3 new findings without self-authored verdicts.

Historically, after the independent review (REV-PAPER-BIJAKOWSKI-PILLONI-STROH-16, research/blueprint/reviews/REV-PAPER-BIJAKOWSKI-PILLONI-STROH-16.md) the extraction had 43 items (1 library, 7 planned, 35 missing), five routes, 19 prerequisite entries and 14 recorded mistakes, all confirmed. The review corrected the extraction in place:
- **Fargues's degree** (item 10) now goes to HodgeTateAndCanonicalSubgroups T0. The accepted extractions of Boxer–Pilloni (2026) and Boxer–Calegari–Gee–Pilloni (2021) already route the degree there, so R07.1 would have been a second owner.
- **The frontier.** Items 34 and 36 (Lan's compactification and Köcher principle at C5) are restated for the normalization model. The identification with the moduli model X_Iw is item 35, now missing and in the Part II, since M4 plans normality only of the normalization. Serre–Tate (item 6) is stated as A4 plans it, and its stack form moved to item 7. Wedhorn's theorem (item 12) keeps only the good-level statement, and Remark 1.5.1's Iwahori-level clauses are item 43.
- **Statuses.** Items 2, 5 and 8 gain M0 or C5. Item 4 is narrowed to what Mathlib states.
- **Routes.** Route 1 gains R0. Lemma 1.1.4 (item 3) moves to PELModuli M0.
- **Two items added:** 42 (the maximum modulus principle) and 43.
- **Seven new mistakes (E8–E14),** including a gap in the continuation over half-open boxes (E12). E6's repair is amended to cover the zero-dimensional cases.
- **Prerequisites.** Bijakowski (ANT 2016), a follow-up the paper does not cite, is removed. Abbes–Mokrane, Bosch and Stroh are added.

Fix #5503 by Codex, `codex-J6LwjP`, 2 October 2026 addresses the four independently confirmed red-team findings. Item /21 now imports the existing Conrad finiteness criterion, giving the current 1 library / 8 planned / 34 missing counts. Items /7 and /28 have the corrected hypotheses, /27 has a replacement proof obligation, and /29 explicitly derives the positivity needed for classicality. The earlier review and its source-issue verdicts are retained.

Route numbers in the result file differ from the list below: 1 = AdicSpacesPartII, 2 = T0, 3 = PELModuli, 4 = C5, 5 = the Part II.

## Sources read

- **Original extraction reading:** the published version is freely served by the Annals site. The original extractor read all 40 pages (pp. 975–1014), including every proof. Item locators are the journal's pages.
- **Language:** the paper is in French. The items translate its statements.
- **Related preprints:** the authors state that the text rewrites Bijakowski's preprint arXiv 1212.2035. That preprint and his follow-up on μ-ordinary loci (Algebra Number Theory 2016) were identified but not compared.
- **Errata:** the Annals page lists no erratum, and Crossref records no update.
- **Original page-image checks:** every original mistake was checked on a page image.
- **Fix reading, 2 October 2026:** targeted published pp. 984,989–990,994–999,1003–1004, with images 984,1003,1004; Katz Theorem 1.2.1 and Lemma 4.1.3; Conrad Appendix A.1 pp. 37–39; Pilloni author PDF pp. 27,29; and the undated Stroh author copy pp. 8,24,25. Exact URLs, hashes and limits are in `sourceVersions`. These readings are not a new full-paper or recursive prerequisite proof audit.

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

**Planned (8 items after fix #5503).**
- PEL data, the good-prime conditions and the smooth model: PELModuli M0 and M2, with its quasi-projectivity at ShimuraCompactifications C5. The normality of the moduli model X_Iw is not planned: M4 plans normality only of the normalization model, so item 35 is missing.
- Serre–Tate for PEL abelian schemes: AbelianSchemesAndArithmeticModuli A4.
- Automorphic bundles ω^κ and classical forms: AutomorphicBundles B2, B4, with the integral sheaf at C5.
- Rigid GAGA: AdicSpacesPartII R1.
- BPS Proposition 4.1.8: the integrated `AdicSpacesPartII:R2/fibral-finiteness-criterion` (Conrad A.1.2), with R0 finite/étale consequences. Item /21 is an application/alternate source, not a new missing theorem. The accepted packet is partial, the node has `implementationStatus: unchecked`, and its formal-model imports remain explicit.

## Routes

1. **Joined Part II `HigherHidaAndColemanTheory`** (25 missing after the review: item 3 moved to PELModuli, and items 35 and 43 joined). Parent: PadicFamilies. It keeps the title, parent and area proposed by PAPER-PILLONI-20 and joined by PAPER-BOXER-CALEGARI-GEE-PILLONI-21 and PAPER-BOXER-PILLONI-26.
   - **What this paper adds:** the degree-0 Coleman theory for PEL types (A) and (C):
     - Barsotti–Tate stacks with Iwahori level, algebraic P and X_Iw, with formal étaleness restricted to p-locally-nilpotent tests or the p-adic formal completion on fixed dimension/signature components; the degree map and ordinary tube;
     - overconvergent forms, and the U_i with their normalisation;
     - the dynamics, and continuation to X_Iw(1−);
     - the good/bad decomposition with /27’s finite-coordinate proof repair; /28’s norm bound with a nonnegative minimum weight; /29’s positivity argument and Kassaei series on E12 closed boxes, then exhaustion;
     - the formal and rigid Köcher corollaries;
     - Coleman's modular-curve theorem and Theorem 5.3.1.
   - **Why this Part II:** small-slope classicality is Coleman theory for coherent cohomology in degree 0. PadicFamilies stops at modular curves and totally real fields in one degree, and OverconvergentAutomorphicForms builds coefficient sheaves, not classicality.
   - **For the design job:** the brief asks it to compare this with the joined briefs' higher Coleman theory for GSp_{2g}, rather than build two classicality theorems.
2. **Source of AdicSpacesPartII [R0, R2, R3]** (4 missing plus the planned /21 application; R0 and item 42 added by the review). General rigid geometry:
   - Kassaei–Bartenwerfer bounded sections;
   - finite étale images and strict neighbourhoods;
   - the already planned Conrad criterion applied to Proposition 4.1.8, retained as an alternate source;
   - the identity principle;
   - the maximum modulus principle (item 42).
3. **Source of HodgeTateAndCanonicalSubgroups [T0]** (1 missing). Fargues's degree and its monotonicity. (Corrected by the review from R07.1: the accepted extractions of Boxer–Pilloni (2026, route 12) and Boxer–Calegari–Gee–Pilloni (2021, route 13) already own the degree at T0.)
4. **Source of PELModuli [M0, M2]** (2 missing). Lemma 1.1.4 and Wedhorn's ordinariness theorem for the good-level model. (Corrected by the review: M0 and Lemma 1.1.4 added; the Iwahori-level clauses are item 43, in the Part II.)
5. **Source of ShimuraCompactifications [C5]** (2 missing). Lan's toroidal compactifications of the Iwahori-level normalization model, and his Köcher principle modulo π^n. (Corrected by the review: stated for the normalization model, since the moduli model X_Iw is item 7, downstream of C5.)

## Corrected design interfaces

**Formal deformation scope (/6–/7).** Keep P as an algebraic map and keep the Iwahori fibre product. Only its restriction to p-locally-nilpotent test schemes is formally étale, by the imported A4 Serre–Tate equivalence, equivalently its p-adic formal completion on fixed dimension/signature components. The API includes compatible lifts with actions, polarization and prime-to-p level. The negative test is characteristic-zero dual numbers: the Legendre curve at t=3+ε changes its j-invariant by `(31360/27)ε` while its étale BT group lifts uniquely. Such a test base is excluded from the restricted theorem, not a counterexample to it.

**Norm and classicality (/28–/30).** Write `c_i=min_j k_{i,j,a_i}` in type C and `min_j(k_{i,j,a_i}+l_{i,j,b_i})` in type A, and `n_i=d_i a_i(a_i+1)/2` or `d_i a_i b_i`. The exported degree-lower-bound lemma requires `c_i≥0` to infer `‖U_i^bad‖≤p^(n_i−ν c_i)` from `deg L≥ν`. For arbitrary dominant weights retain the actual partial degrees/elementary-divisor valuations and signed weight contributions; do not substitute ν against a negative coefficient. The genus-two scalar weight (−1,−1) has a canonical degree-2 complement: the det^(-1) factor and p^(-3) normalization give p^5, while ν=1 predicts p^4. Type A tests the sum of last entries, not separate positivity. In the application, the source normalization supplies `v(α_i)≥0` (p. 994). Hypothesis 4.5.1 yields `c_i>v(α_i)+n_i≥0`. Choose small positive ε so `n_i+v(α_i)−(1−ε)c_i<0`, then use the corrected lemma for contraction. The small-slope classicality theorem is retained. A different normalization must re-establish or assume the valuation input.

**Quasi-compact good/bad decomposition (/27).** On E12 closed degree boxes, use the full distinct-complement tuple cover B_k^rig and its finite étale forgetting map p. Each coordinate quotient q_j is finite: it factors through a finite coordinate-forgetting map to C_i^rig followed by the finite correspondence projection p2. Form `p^(-1)(U) ∩ ⋂_j q_j^(-1)(V_l)`. Its finitely many quasi-compact open factors have quasi-compact intersection because the ambient cover is separated, hence quasi-separated. Proposition 4.1.4 gives a quasi-compact open p-image equal to the bad-count locus. This preserves Lemma 4.4.3 and Theorem 4.4.1. The product map into `(X_Iw^rig)^k` is not assumed étale: for k=2 and genus-two dimension 3, it has a dimension-6 target. Nor is finiteness silently asserted after arbitrary open restriction. Empty and single-coordinate cases and distinct-tuple counting are tests. Exhaust closed boxes to reach E12 half-open boxes.

**Existing finiteness owner (/21).** For f|U, étaleness gives flatness, separation is retained, quasi-compactness follows from the quasi-compact open immersion and finite f, fibres are finite, and constant geometric cardinality gives constant fibre rank. Import Conrad A.1.2 at R2. Then U→X is proper over the separated finite Y-space X and is an open immersion, so U is closed; R0 gives the finite étale complement. Keep existing E4: the needed open-and-closed map is U→X. No second criterion is commissioned.

## Source issues (`sourceIssues` E1–E17)

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

**New in this fix, without self-authored review (E15–E17).**

- **E15, error in the stated formal-étaleness assertion, p. 984:** add the p-locally-nilpotent qualification. The algebraic construction and intended formal use remain.
- **E16, error in the stated norm lemma, p. 1004:** add `c_i≥0` for degree-lower-bound substitution. The explicit negative-weight branch disproves the unrestricted estimate; positivity is discharged in the classicality use.
- **E17, error in the proof helper, p. 1003:** the simultaneous quotient map cannot be étale in positive dimension for k≥2. Replace it by the finite-coordinate/intersection/p-image argument, keeping the theorem.

The bounded correction search on 2 October 2026 checked the Annals page, Crossref, title-specific searches, Stroh and Pilloni publication pages and arXiv:1212.2035’s history. No relevant correction was found. The undated 33-page Stroh copy repeats these claims on pp. 8,24,25 and is not treated as a later corrigendum. New findings concern the exact published PDF; old verdicts are retained without a fresh claim of their proof verification.

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


## Fix validation and limits

The paper, intake, shared source-issue/version and whitespace checks pass. Inventory checks retain all 43 ids, 19 prerequisites and five route owners; all 34 missing items route exactly once. The planned /21 remains in its source route only as an application, with no duplicate missing target. All fourteen prior source-issue records and independent verdicts are unchanged.

Exact finite models check the Legendre first derivative on dual numbers, the negative-weight canonical branch, sign-sensitive degree substitution, strict contraction and coordinate-preimage counting for distinct tuples. These are regression checks, not proofs of the geometric or analytic inputs. The owning design jobs must prove the corrected interfaces. No Lean file is required by this job; no usable existing compiled build at the pinned commits was available, so no Lean compilation was run.

Pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed A4 audit and actual library declarations were read. R0/R2 had no reviewed audit entries, which is not an absence certificate. Generic ring-theoretic formal étaleness in Tau Ceti does not supply PEL Serre–Tate; the existing matrix Morita library item is unchanged. No new carrier or roadmap is introduced. See [the fixes report](../redteam/RT-PAPER-BIJAKOWSKI-PILLONI-STROH-16.fixes.md) for per-finding validation and handoff.
