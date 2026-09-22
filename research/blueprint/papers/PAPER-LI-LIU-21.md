# PAPER-LI-LIU-21: Chow groups and L-derivatives of automorphic motives for unitary groups

Chao Li and Yifeng Liu, *Chow groups and L-derivatives of automorphic motives for unitary groups*, [Ann. of Math. (2) 194 (2021), 817–901](https://doi.org/10.4007/annals.2021.194.3.6); arXiv [2006.06139](https://arxiv.org/abs/2006.06139).

Extraction by Claude Code, session `cc-fb70e5`, 22 September 2026 (issue #1115). Status: **complete**. The whole paper was read and every missing item is routed once. The machine-readable extraction is [PAPER-LI-LIU-21.result.json](PAPER-LI-LIU-21.result.json): 81 items (14 planned, 67 missing), 7 routes, 21 prerequisite entries and 9 recorded source issues.

**Source.** The typeset Annals PDF is paywalled, so two versions were read in full on 2026-09-22.
- **The authors' final version**, [AIPF.pdf](https://www.math.columbia.edu/~chaoli/AIPF.pdf) on Chao Li's homepage: dated 20 October 2021, 67 pages, SHA-256 `6ef2d63ea2cf55d8a2648f71ed7ac84e4d32f77e9e7eaeb62b47e584e4e5e566`. It post-dates the journal revision (received 18 June 2020, revised 13 July 2021, accepted 30 June 2021, online 2 November 2021) and matches the published bibliographic data. Locators are its pages.
- **arXiv v5** (10 April 2021, "revised after referee reports"), SHA-256 `b3705e15817c142a2319660f12b07bf3871e13389d6d5557397c776809cec289`. It was compared line by line with the final version: 173 passages differ. Three are substantive (E1, E2 and E9 below); the rest are wording, citation updates and a reformulation of Conjecture 1.1 with a coherent hermitian space over E.

## What the paper proves

**Setting.** E/F is a CM extension with F ≠ Q, no ramified places (V^ram_F = ∅) and every 2-adic place split. π is a cuspidal automorphic representation of the quasi-split U(r, r). Its archimedean components are holomorphic discrete series of Harish-Chandra parameter {(1 − n)/2, …, (n − 1)/2} (n = 2r). At split places it is a principal series, and at inert places unramified or almost unramified. The set S_π of almost unramified places has odd size, so the root number is −1 and the hermitian space V_π given by theta dichotomy is incoherent. X_L are the unitary Shimura varieties of the nearby spaces, of dimension n − 1 over E.

**Main theorems.**
- **Theorem 1.5.** Assume Hypothesis 6.6 (the Galois action on the π-part of middle cohomology is ρ^c_{Π_j}). If L′(1/2, π) ≠ 0, the π-localized Chow group colim (CH^r(X_{L_R L^R})^0)_{𝔪^R_π} is nonzero; special cycles already witness this.
- **Theorem 1.7.** Assume also Hypothesis 4.5 (modularity of Kudla's generating functions). Then the normalized Beilinson–Bloch height of arithmetic theta lifts equals (L′(1/2, π)/b_{2r}(0))·C_r^{[F:Q]}·Π_v Z^♮_{π_v,V_v}, the arithmetic inner product formula conjectured by Liu in 2011. Also, Hom(π̃^∞, colim CH^r(X_L)^0) ≠ 0.
- **Corollary 1.9** gives the explicit value for new vectors, with sign (−1)^r. Under Beilinson's positivity conjecture this would give L′(1/2, π) ≥ 0.

**Strategy.** Choose Hecke operators s outside 𝔪^R_π that are *ℓ-tempered*: they kill H^{2r} of a regular model. Then the heights of s^*Z_T(φ) are defined and decompose into local indices (Appendix B). These indices are matched with Fourier coefficients of E′(0, g, Φ) place by place.
- **Split places (§7).** The indices vanish, by disjointness on Drinfeld-level models 𝒳_m and the vanishing Lemma 7.3 (Newton strata and Caraiani–Scholze). Lemma 7.3 needs π_u to be a tempered principal series.
- **Inert places with self-dual level (§8).** Li–Zhang's local Kudla–Rapoport identity on the smooth models.
- **Almost self-dual places (§9).** Li–Zhang Theorem 10.5.1 on strictly semistable models. A correction term from a coherent Eisenstein series appears; its doubling integral later vanishes by the Rallis inner product formula.
- **Archimedean places (§10).** Kudla–Millson Green currents and Liu's comparison, after averaging against a cusp form. This avoids holomorphic projection.

The doubling method (§3) supplies the analytic side:
- Proposition 3.7 is the doubling integral of E′ with explicit local factors.
- Proposition 3.13 produces test functions with regular support and nonzero local zeta integrals, from the Fourier-support Lemmas A.1–A.2.

## What the atlas already has

- **Library.** Nothing. Mathlib 082e2d3 and Tau Ceti f790474 have no Chow groups, Weil representations, Shimura varieties, Green currents, cycle class maps or K-theory with supports; name searches for each found nothing. For the Fourier transform the reviewed audit counts only a partial start in AL.0 (Mathlib's generic `Fourier.fourierIntegral`, with no p-adic theorems).
- **Planned** (14 items):
  - AutomorphicLFunctionsAndLocalFactors AL.0: local Fourier transforms and self-dual measures.
  - MetaplecticAutomorphicForms MP.2–MP.3: the Weil representation of unitary dual pairs.
  - AutomorphicPadicLFunctions L4: the doubling embedding, Siegel Eisenstein series and local doubling zeta integrals. L4 is written for the Eischen–Harris–Li–Skinner setting; the brief asks the design job to check it covers U(r, r) × U(r, r) ⊆ U(2r, 2r).
  - ModularityAndLanglandsExtensions ML.4: Arthur's multiplicity formula (KMSW, Mok).
  - AutomorphicGaloisRepresentationsPartII AG2.2/AG2.5: the Galois representations ρ_{Π_j} and their purity.
  - ShimuraVarieties V1/V6: the unitary Shimura varieties.
  - Cohomology:
    - EtaleDualityAndPerverseSheaves EDC.3: cycle classes with support;
    - ArithmeticGaloisDuality R02.2: Hochschild–Serre;
    - WeightsInEtaleCohomology R34.5: weights;
    - LefschetzPencilsAndVanishingCycles LPV.7: the weight spectral sequence of a strictly semistable model.
  - K-theory: SchemeKTheoryOperations S.6–S.7 (Gillet–Soulé K-groups with supports) and MotivicEtaleKTheory M.8 (Gillet's Chern classes).
  - IgusaVarietiesAndTorsionConcentration IG.1, IG.4, IG.5: Igusa varieties, and the Caraiani–Scholze concentration and trace results.
- **Not in the atlas.**
  - Beilinson's ℓ-adic height pairing and local indices for higher-codimension cycles.
  - Kudla's generating functions in Chow groups and arithmetic theta lifting.
  - The doubling integral of E′ and Liu's nonsingular expansions.
  - The integral models and uniformization at unitary places.
  - Absolute purity: EDC.2 explicitly excludes Gabber's theorem.

## Routes

1. **Part II of GrossZagierAndArithmeticHeights: `UnitaryArithmeticInnerProductFormula`** (50 items). This is the candidate proposed by PAPER-LI-LIU-22. It takes:
   - the conjecture and main results;
   - the running notation;
   - the doubling side: the doubling L-function, Proposition 3.7 (with the final constant), the Siegel–Weil measure, Proposition 3.10, Proposition 3.13 and Lemmas A.1–A.2;
   - Lemma 3.15 and Remark 3.16;
   - special cycles, generating functions, Hypothesis 4.5 and arithmetic theta lifting;
   - Beilinson's height pairing with all of Appendix B;
   - admissible sextuples, Hypothesis 6.6, the tempering Propositions 6.9–6.10 and the normalized height;
   - the local-index Propositions 7.1, 8.1, 9.1 and 10.1, with Lemmas 8.3 and 9.2;
   - Green currents and the Kudla–Millson comparison;
   - Lemma 11.1.

   The brief makes this paper the main line of the Part II and the sequel its extension. Beilinson's local indices (Appendix B) are planned there as a general tool, since this is their first consumer. The generic-fibre special cycles sit here, as in PAPER-LI-LIU-22; their integral models go to route 3.
2. **Part II of PELModuli: `UnitaryRapoportZinkSpacesAndRSZModels`** (7 items), the PAPER-LI-ZHANG-22-B candidate:
   - the moduli interpretation of X′_L;
   - the change of complex embedding;
   - admissible CM types and 𝒴;
   - the Drinfeld-level models 𝒳_m;
   - the smooth and strictly semistable inert models, with the special-fibre decomposition Y° ∪ Y•;
   - the uniformization (8.2).
3. **Part II of GrossZagierAndArithmeticHeights: `UnitaryKudlaRapoportCycles`** (4 items), the PAPER-LI-ZHANG-22-B candidate:
   - the moduli description of special cycles (Lemma 5.4);
   - integral special cycles with their K-theory classes and uniformization (8.3);
   - the two Li–Zhang identities used in §§8–9.
4. **Source of MetaplecticAutomorphicForms MP.3** (2 items). Proposition 3.6 (doubling multiplicity one and theta dichotomy), and the Hecke compatibility of the local theta correspondence at almost unramified and split places.
5. **Source of IgusaVarietiesAndTorsionConcentration IG.5/IG.7** (2 items). The Newton strata of 𝒳_m ⊗ k and Lemma 7.3, whose generalization PAPER-LI-LIU-22 routes to the same stages.
6. **Source of SchemeAndStackFoundations SF.2** (1 item). Absolute purity, where PAPER-CESNAVICIUS-19 routes its absolute-purity input.
7. **Source of MotivesAndAlgebraicCycles MC.7** (1 item). The equivariant Beilinson–Bloch conjecture (1.1) and Beilinson's positivity conjecture, for MC.7's register of cycle conjectures.

## Source issues (`sourceIssues` E1–E9)

**Corrected in the final version, still in arXiv v5.**
- **E1** (error, affects a stated result).
  - **The problem.** v5 prints C_r = (−1)^r 2^{r(r−1)} π^{r²}Γ(1)⋯Γ(r)/(Γ(r+1)⋯Γ(2r)), from an archimedean zeta integral (−1)^r π^{r²}⋯ attributed to Harris–Li–Sun and Garrett.
  - **The correction.** The final version uses Eischen–Liu: Z(0) = (−1)^r 2^{−2r²}·2^{r²−r}π^{r²}⋯, hence C_r = (−1)^r 2^{−2r}π^{r²}⋯. The sequel also uses 2^{−2r}.
  - **Check.** Rederived: ⟨φ^0, φ^0⟩ = 2^{−2r²} for the self-dual measure, and the normalization L(1/2, π_v)/b_{2r,v}(0) contributes 2^{r²−r}.
  - **Reach.** It changes Theorem 1.7(1), Proposition 3.7, Lemma 11.1(2) and Corollary 1.9 by 2^{r(r+1)[F:Q]}.
- **E2** (gap, affects the proof).
  - **The problem.** In the v5 proof of Proposition 10.1, η is an arbitrary current with dd^c η = δ(Z_{T₂})^c, from the ∂∂̄-lemma. It is then wedged with the singular Green current of Z_{T₁} and integrated by parts, which is not defined in general.
  - **The correction.** The final version takes η = −g^♥_{T₂}(…)^c and notes that η + g^KM_{T₂} is smooth.
- **E9** (citation gap, affects the proof). v5's Lemma B.8 cites Gillet's Prop. 2.35, which covers only Z₁ = Z₂. The final version adds footnote 22 explaining that the proof extends.

**New.**
- **E3** (gap, affects a stated result).
  - **The problem.** Proposition 9.1 computes the local index at an almost self-dual place by Li–Zhang Theorem 10.5.1. Li–Zhang say that theorem "is conditional on Conjecture 10.4.1", a Kudla–Rapoport conjecture on the auxiliary space Ñ¹_n "which from now on we assume to hold". This holds in both their arXiv v3 and their final version.
  - **Reach.** |S_π| is odd, so every application of Theorems 1.5 and 1.7 and Corollary 1.9 passes through such a place. Li–Liu state no such hypothesis, and the sequel (Prop. 4.27(2)) inherits the same dependence.
  - **Repair.** Li–Rapoport–Zhang, arXiv:2404.02214 (to appear in Crelle), Theorem 14.6.2, prove the structure result "conjectured by Kudla and Rapoport, … see also [LZ, Conj. 10.4.1]". That should make the theorems unconditional (apart from Hypotheses 4.5 and 6.6). Whether it gives every part used in Li–Zhang §10.5, in particular the blow-up description, was not checked line by line.
- **E4** (misprint). Proof of Lemma 7.3: "d = n − j = 2r − 1 − j" should read d = n − 1 − j.
- **E5** (misprints). V^m or V for V^r in the proof of Lemma 5.4, in Lemma 6.4(1), and in the proofs of Propositions 8.1 and 9.1.
- **E6** (misprints). Proposition B.10 has supp(c_i) for supp(c₁). Corollary B.15 has H^{2d}(𝒳, Q_ℓ(d)) for H^{2r}(𝒳, Q_ℓ(r)), three times.
- **E7** (misprint). Proof of Lemma A.2: after summing over i the region still carries the index i. It should be the union A^m_0 × B^m_{−2N} × B^{n−2m}_{−N}.
- **E8** (misprint). Proof of Theorem 1.5: the reduction "R_π ⊆ R ⊆ V^fin_F" should read R ⊆ V^spl_F, as §11 assumes.

**Also checked and correct:**
- The sign (−1)^r and the positivity of C_r^{[F:Q]} in Corollary 1.9.
- The agreement of (9.2) with (9.3) and with Li–Zhang Remark 10.5.4. Here q_u in log q_u/(q_u^r − 1) is the residue cardinality of E_u, and q in (q + 1)/(q^{2r} − 1) is that of F; the text layer loses the underline on u̲.
- The exponent bookkeeping in Lemmas A.1–A.2.
- The induction m_j = m_{j+1} + 2 in Proposition B.14.

**Not the paper's errors.** Footnote 20 corrects a sign in Liu 2011 Theorem 4.20: the constant is Π γ^{2n}_{V_v} = 1, not Π γ_{V_v} = −1, which Garcia–Sankaran reprove by another method. Crossref records no correction notice or update relation for the Annals article.

## Prerequisites not yet covered

- Li–Zhang 2022 (extracted as PAPER-LI-ZHANG-22-B), Li–Rapoport–Zhang 2024 and the sequel Li–Liu 2022 (extracted as PAPER-LI-LIU-22).
- Liu 2011 (both parts) and Liu 2022, and Rapoport–Smithling–Zhang 2020.
- Liu–Tian–Xiao–Zhang–Zhu, and Kaletha–Minguez–Shin–White with Mok.
- Caraiani 2012, Caraiani–Scholze 2017 and Harris–Taylor 2001.
- Yamana 2014, Eischen–Liu, and Gan–Ichino, Gan–Takeda and Kudla–Sweet.
- Beĭlinson 1987, Gillet–Soulé 1987 with Gillet 1981, and Fujiwara 2002.
- Kudla–Millson and Millson.
- Howard 2012, Agranovsky–Narayanan 2004 and Ramakrishnan.

Links and reasons are in the JSON.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-LI-LIU-21.result.json`: ok.
- Every missing item appears in exactly one route, and no route takes a planned item.
- The 24 cited stages and parents were checked against `data/atlas.json`, all accepted restructures in `data/restructure/` and `data/roadmap-retirements.json`: none is restructured or retired. Library verdicts come from `data/library-coverage.json`.
- The three Part II ids are those in the merged PAPER-LI-ZHANG-22-B and PAPER-LI-LIU-22 routes, with identical titles and parents.
- Bibliographic data follow the paper's reference list. The Annals DOI and the LTXZZ volume and pages were confirmed on Crossref.
- No Lean was written or compiled; none is a deliverable of this job.
