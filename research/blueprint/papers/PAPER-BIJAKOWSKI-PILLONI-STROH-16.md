# PAPER-BIJAKOWSKI-PILLONI-STROH-16: Classicité de formes modulaires surconvergentes

Stéphane Bijakowski, Vincent Pilloni and Benoît Stroh, *Classicité de formes modulaires surconvergentes*, [Annals of Mathematics 183 (2016), no. 3, 975–1014](https://doi.org/10.4007/annals.2016.183.3.5).

Extraction by Claude Code, session `cc-fb70e5`, 29 September 2026 (issue #1186). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-BIJAKOWSKI-PILLONI-STROH-16.result.json](PAPER-BIJAKOWSKI-PILLONI-STROH-16.result.json). It has:
- 41 items: 1 library, 8 planned, 32 missing;
- 5 routes: a Part II joined with the pending proposal of PAPER-PILLONI-20, and four sources of existing layers;
- 17 prerequisite entries;
- 7 recorded mistakes: 5 misprints, 1 error and 1 gap.

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

**Planned (8 items).**
- PEL data, the good-prime conditions, the smooth model, and the normality of the Iwahori model: PELModuli M0, M2, M4.
- Serre–Tate: AbelianSchemesAndArithmeticModuli A4.
- Automorphic bundles ω^κ and classical forms: AutomorphicBundles B2, B4.
- Rigid GAGA: AdicSpacesPartII R1.

## Routes

1. **Joined Part II `HigherHidaAndColemanTheory`** (24 missing). Parent: PadicFamilies. It keeps the title, parent and area proposed by PAPER-PILLONI-20 and joined by PAPER-BOXER-CALEGARI-GEE-PILLONI-21 and PAPER-BOXER-PILLONI-26.
   - **What this paper adds:** the degree-0 Coleman theory for PEL types (A) and (C):
     - Barsotti–Tate stacks with Iwahori level, and the degree map and ordinary tube;
     - overconvergent forms, and the U_i with their normalisation;
     - the dynamics, and continuation to X_Iw(1−);
     - the good/bad decomposition, the norm bound and Kassaei series;
     - the formal and rigid Köcher corollaries;
     - Coleman's modular-curve theorem and Theorem 5.3.1.
   - **Why this Part II:** small-slope classicality is Coleman theory for coherent cohomology in degree 0. PadicFamilies stops at modular curves and totally real fields in one degree, and OverconvergentAutomorphicForms builds coefficient sheaves, not classicality.
   - **For the design job:** the brief asks it to compare this with the joined briefs' higher Coleman theory for GSp_{2g}, rather than build two classicality theorems.
2. **Source of AdicSpacesPartII [R2, R3]** (4 missing). General rigid geometry:
   - Kassaei–Bartenwerfer bounded sections;
   - finite étale images and strict neighbourhoods;
   - the finiteness criterion 4.1.8;
   - the identity principle.
3. **Source of FiniteFlatGroupsAndIntegralPadicHodgeTheory [R07.1]** (1 missing). Fargues's degree and its monotonicity.
4. **Source of PELModuli [M2]** (1 missing). Wedhorn's ordinariness theorem.
5. **Source of ShimuraCompactifications [C5]** (2 missing). Lan's Iwahori-level toroidal compactifications, and his Köcher principle modulo π^n.

## Source issues (`sourceIssues` E1–E7)

**E6 (gap, the proof of Theorem 5.3.1, p. 1011).**
- When the symmetric space has dimension ≤ 1, the proof cites Coleman and Kassaei, who treat only the modular curve.
- Hypothesis 1.1.1 also allows other cases:
  - Shimura curves of indefinite quaternion algebras (type (C), n = 2);
  - unitary curves;
  - 0-dimensional cases.
- **Repair:** compact curves follow from §4 and GAGA on the proper X_Iw. Non-compact unitary curves need the cusp analysis of Remark 5.3.2.

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

## Prerequisites not yet covered

Seventeen entries:
- Coleman (Invent. 1996), Kassaei (Duke 2006), Buzzard (JAMS 2003), Pilloni (Duke 2011);
- Fargues (Crelle 2010);
- Kottwitz (JAMS 1992);
- Wedhorn (Ann. ÉNS 1999);
- Lan: the monograph (2013), IMRN 2017, Forum Sigma 2016, MRL 2016;
- He (Duke 2013), Görtz (Math. Ann. 2001; Adv. Math. 2003);
- Bosch–Lütkebohmert (Math. Ann. 1993);
- Kiehl (Invent. 1967);
- Bijakowski (ANT 2016).

Every DOI was checked against Crossref.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BIJAKOWSKI-PILLONI-STROH-16.result.json` reports no errors.
- Every planned and route stage id exists in `data/atlas.json`.
- The two Mathlib citations were found in the pinned index at Mathlib 082e2d3, and their statements were read in the Lean file.
