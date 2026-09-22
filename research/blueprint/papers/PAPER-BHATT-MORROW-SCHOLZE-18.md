# PAPER-BHATT-MORROW-SCHOLZE-18: extraction and routing

Issue #1462. Claude Code, session cc-442dc5. The extraction is complete. Implementation and proof closure are not claimed.

Bhargav Bhatt, Matthew Morrow and Peter Scholze, *Integral p-adic Hodge theory*, Publ. Math. IHÉS 128 (2018), 219–397 (doi 10.1007/s10240-019-00102-z; arXiv 1602.03148).

The result has **190 items: 2 library, 92 planned and 96 missing**. The atlas was designed around this paper, so it becomes a **source of existing layers**; no new roadmap or Part II is proposed. Fourteen source routes take the 96 missing items, and also list 46 planned items for which BMS1 is the main source.

Eighteen misprints are recorded under `sourceIssues`, all present in the published version. No error or gap was found.

## What the paper proves

**A_inf-cohomology (Theorems 1.8 and 1.10).** Let 𝔛 be a smooth formal scheme over O_C with generic fibre X.

- AΩ_𝔛 := Lη_μ(Rν_*A_inf,X) ∈ D(𝔛_Zar) (Definition 9.1). Here ν : X_proet → 𝔛_Zar and μ = [ε] − 1.
- It specializes, as sheaves and compatibly with products, to:
  - the de Rham–Witt complex of the special fibre (after ⊗̂W(k));
  - the de Rham complex (after θ);
  - crystalline cohomology of 𝔛_{O/p} over A_crys (Theorem 12.1);
  - Rν_*A_inf,X, after inverting μ.
- For 𝔛 proper, RΓ_{A_inf}(𝔛) = RΓ(𝔛, AΩ_𝔛) is a perfect A_inf-complex with a Frobenius. Its cohomology groups are Breuil–Kisin–Fargues modules, and it specializes to:
  - crystalline cohomology of 𝔛_k;
  - de Rham cohomology;
  - crystalline cohomology over A_crys;
  - étale cohomology of X after inverting μ.

**How AΩ is computed.**

- **The décalage Lη (§6).** Lη_f kills f-torsion in cohomology. Modulo f it is the Bockstein complex (Proposition 6.12), and it turns certain almost quasi-isomorphisms into honest ones (Lemmas 8.11 and 9.12). This is the "key lemma" (Lemma 1.16, Proposition 9.14): Faltings' almost purity becomes an exact computation.
- **Locally (Theorem 1.17, Lemma 9.6).** For a framed small affine, AΩ is the q-de Rham complex, with q = [ε].
- **The Hodge–Tate specialization (Theorem 8.3).** It gives H^i(Ω̃) ≅ Ω^i{−i}, a mixed-characteristic Cartier isomorphism.
- **The Witt-vector specializations (§§10–11).** Along θ̃_r they are the relative de Rham–Witt complexes of Langer–Zink. The proof builds an F-V-procomplex out of Lη_μD.

**Arithmetic consequences.**

- **Theorem 1.1.** Take a proper smooth formal scheme over O_K, with K discretely valued with perfect residue field. Then:
  - H^i_et ⊗ B_crys ≅ H^i_crys ⊗ B_crys;
  - the length of the crystalline torsion mod p^n bounds the étale torsion, so dim H^i_dR(𝔛_k) ≥ dim H^i_et(𝔛_C, F_p);
  - if H^i_crys and H^{i+1}_crys are torsion-free, H^i_crys is recovered from the Galois lattice through Kisin's Breuil–Kisin module.
- **Over C (Theorems 1.4 and 14.5).** The same recovery goes through Fargues' classification of finite free BKF modules.
- **Theorem 1.7.** A new B_dR^+-cohomology of proper smooth rigid spaces over C deforms de Rham cohomology. It is finite free and compares with étale cohomology after inverting ξ. Consequences:
  - the Hodge–Tate spectral sequence degenerates;
  - the Hodge–de Rham spectral sequence degenerates, via a spreading-out argument proved in §13.2.
- **Sharpness (§2).** Two examples show the torsion inequality is sharp:
  - a surface over Z_2 with torsion-free étale but torsion crystalline H^2;
  - a surface whose étale torsion Z/p^2 degenerates to k ⊕ k in crystalline cohomology.

## Sources inspected

- [arXiv 1602.03148v3](https://arxiv.org/abs/1602.03148v3) (15 January 2019, 124 pages, "minor updates, final version"; v1 9 February 2016, v2 7 September 2018).
  - PDF SHA-256 `285f7d20…9c4e072a`; TeX source SHA-256 `ff989b40…fc262b5aa4`.
  - The full TeX source `integralpadicHodge.tex` (5932 lines) and the bibliography were read.
- The published article, [Publ. Math. IHÉS 128 (2018), 219–397](https://pmihes.centre-mersenne.org/articles/10.1007/s10240-019-00102-z/), open access on Centre Mersenne (PDF SHA-256 `a924d36c…2052702bb`).
  - All 237 numbered statements agree with arXiv v3 in number and kind.
  - Each recorded misprint was checked in both.
  - **Locators give the published page numbers.**
- Crossref lists no correction or update, a Crossref search found none, and the Centre Mersenne listing of volume 128 has no erratum.

All sources were accessed on 22 September 2026.

## Mistakes found (`sourceIssues`)

All eighteen are misprints whose meaning is clear from the context. None affects a result.

| Id | Where | Printed | Correct reading |
| --- | --- | --- | --- |
| E1 | after Theorem 4.4, p. 265 | "s ∈ Spec R is the closed point" | Spec 𝔖 |
| E2 | proof of Lemma 4.8, p. 268 | "a principal fraction field J" | principal fractional ideal J |
| E3 | proof of Prop. 4.32, p. 281 | φ^*N[1/f(E)], ξ̃ := f(E), with f never defined | image of E under the map 𝔖 → A_inf of §4.4 |
| E4 | after Def. 7.1, p. 298 | Koszul complex computes M ⊗^L Z "up to a shift by \|I\|" | shift by d |
| E5 | Remark 7.4, p. 299 | "mapping this into M" | into N |
| E6 | Remark 7.8, p. 302 | E_1 = Lη_{q−1}E_1 | E_1 = Lη_{q−1}E_2 |
| E7 | proof of Lemma 7.9, p. 303 (twice) | (dx, dy + (−1)^n gy) | (dx, dy + (−1)^n gx) |
| E8 | proof of Prop. 9.14, p. 331 | "By Theorem 9.4 (iii)" (the statement being proved) | Theorem 9.4 (ii), i.e. Corollary 9.11 |
| E9 | proof of Lemma 10.8, p. 337 | "p nilpotent in S or S F-finite" | R |
| E10 | §10.4, p. 339 | partition (I_0, …, I_d); Case 2 "j = ρ + 1" | (I_0, …, I_n); j = ρ_1 + 1 |
| E11 | §11.1, pp. 343–346 | "if A is 2-adic", W_rΩ_{B/A}, W_{r+1}(A)-algebras | S (the base in §11 is S) |
| E12 | Prop. 11.5(v), p. 347 | "for all x ∈ B" | b ∈ B |
| E13 | proof of Prop. 11.5(iii), p. 348 | d(R(α)) = 0 ∈ (η_{φ(μ)}D)^{n+1}/ξ̃_r | (η_μD)^{n+1}/ξ̃_r |
| E14 | proof of Lemma 11.16, p. 354 | "Tor-independent from W_r(O) over W_r(k)" | from W_r(k) over W_r(O) |
| E15 | proof of Cor. 12.7, p. 364 | g_u = log(μ)∂/∂log(x_u), log(μ) = μv | log([ε]) (Lemmas 12.2(iii), 12.6) |
| E16 | proof of Lemma 12.8, p. 365 | "A_crys is the p-adic completion of the PD envelope of A_0 → A_0/ξ_0" | A_{0,crys} |
| E17 | proof of Prop. 13.15, p. 382 | "(i) and (ii) are clear", "the proof of (iii)" (two-part statement) | "(i) is clear", "the proof of (ii)" |
| E18 | proof of Theorem 14.1, p. 390 | H^•(AΩ_r ⊗̂ φ^r(A_crys^{(m)})/ξ̃_r); A_crys{(m)} | AΩ_R; A_crys^{(m)} |

Some slips were noted but not recorded as source issues. They are listed in the handoff note.

## What the atlas and the libraries already have

**Library (2 items).** Both are in Mathlib at 082e2d3:

- A_inf(S) = W(S^♭): `PreTilt` and `WittVector`, with no named A_inf;
- Fontaine's θ: `WittVector.fontaineTheta`, `fontaineTheta_teichmuller` and `surjective_fontaineTheta`.

Neither library has:

- perfectoid rings, θ_r or A_crys;
- Lη, or Koszul complexes of commuting endomorphisms (Mathlib's `groupCohomology` uses standard cochains);
- BKF modules or the pro-étale site;
- de Rham–Witt complexes or coherent rings.

**Planned (92 items).** Most layers cite BMS1 by section, and several cite it by statement number.

| Topic | Planned in |
| --- | --- |
| A_inf, θ, θ̃, μ, ξ, the BK and BKF twists, O{1} | AInfCohomology AI.0 ("Sources: BMS1 §3") |
| Lη: definition, cohomology, monoidality, composition, Bockstein, flat base change, Lemmas 6.19–6.20; Koszul calculations | AInfCohomology AI.1 ("Sources: BMS1 §§6–7") |
| BKF modules, torsion decomposition, étale and crystalline realizations, Fargues' theorem | AInfCohomology AI.2 ("BMS1 Definition 4.22, Lemmas 4.26–27, Theorem 4.28") |
| Period sheaves, toric cover, AΩ, the key lemma, q-de Rham identification, Frobenius | AInfCohomology AI.3 ("BMS1 §§7–9"), with PrismaticCohomology PR.6 for q-de Rham |
| Hodge–Tate, de Rham–Witt, de Rham, A_crys and μ-inverted specializations | AInfCohomology AI.4 ("BMS1 §§8, 10–12 and Theorem 1.10") |
| RΓ_{A_inf}, its BKF cohomology and specializations; the linear algebra of torsion; the §2 examples | AInfCohomology AI.5 ("BMS1 §§4, 14"), CohomologyComparisons CP.1 |
| Theorem 1.1(i) | CohomologyComparisons CP.2 ("BMS1 §§12–14, Theorem 1.1(i)"), with Proposition 13.21 |
| B_dR^+-cohomology and its comparison, finite freeness, Hodge–Tate degeneration | CohomologyComparisons CP.3 ("BMS1 Theorem 1.7/§13") |
| Torsion inequalities, the mod p de Rham bound, lattice recovery | CohomologyComparisons CP.5 |
| Langer–Zink F-V-procomplexes and the relative de Rham–Witt complex | CrystallineCohomology CR.4 ("BMS1 §§10–11") |
| A_crys, B_crys, B_dR | CrystallineCohomology CR.0, PadicHodgeTheory R06.1 |
| Perfectoid rings and their Tate versions | PerfectoidQuotients Q0:integral-algebra, PerfectoidSpaces P1 |
| Breuil–Kisin modules and Kisin's functor | FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4, PrismaticCohomology PR.7 |
| Pro-étale site | AdicEtaleGeometry A1 |
| Scholze's de Rham comparison and the OB_dR^+ Poincaré lemma | PadicHodgeTheory P8, P8:local-rational |
| Derived completeness on replete topoi | DerivedDeRhamCohomology DD.1, EnhancedDerivedSheaves E2 |

Classification is consistent with earlier extractions:

- Lη, lax monoidal, is planned in AI.1 (BMS2/042).
- AΩ is planned in AI.3 and AI.7 (BS22/94).
- The q-de Rham comparison is planned in PR.6 and AI.3 (BS22/83).
- BKF modules and Fargues' theorem are planned in AI.0 and AI.2 (Guo–Reinecke/024).
- Breuil–Kisin modules are planned in R07.4 and AI.7 (BMS2/001).

## Routes

All routes are source routes. Each route lists its missing items first, then the planned items BMS1 is the main source for.

1. **AInfCohomology AI.4** (24 missing, 7 planned). The steps of the specialization proofs:
   - the primitive comparison with A_inf-coefficients (Theorem 5.7);
   - τ^{≤1}Ω̃ as the shifted cotangent complex and the lifting obstruction (Proposition 8.15, Remark 8.4, Lemma 8.16, Proposition 8.17);
   - Künneth and monoidality (Proposition 8.14, Lemmas 9.16 and 9.18);
   - all of §11: the F-V-procomplexes from Lη_μD, the torus computation, the Cartier step and the junk-torsion interpretation;
   - all of §12: elements of A_crys, the Taylor formula, the all-units Lie-algebra argument, A_crys^{(m)} and Proposition 12.9.
2. **AInfCohomology AI.3** (15 missing, 5 planned). The ingredients of the key lemma:
   - coherence of W_r(O) and the absence of almost-zero elements (Proposition 3.24, Lemmas 3.25–3.28, Corollary 3.29);
   - the period sheaves on affinoid perfectoids (Lemma 5.6);
   - the toric computations (Proposition 8.9, Lemmas 8.10, 9.7 and 9.13);
   - the Lη criterion over A_inf (Lemma 9.12), étale base change (Lemma 9.9) and the sheaf-limit lemma;
   - Remark 7.8, which shows AΩ is not a commutative dga.
3. **CohomologyComparisons CP.3** (10 missing, 6 planned). The supporting lemmas of §13:
   - rigid geometry over B_dR^+/ξ^n;
   - noetherian approximation of very small affinoids;
   - the B_dR^+-lift and the structure of D_Σ(R), and independence of Σ;
   - the spreading-out results (Proposition 13.15, Corollary 13.16) behind finite freeness and degeneration.
4. **AInfCohomology AI.5** (9 missing, 4 planned). The specialization lemmas behind Corollaries 4.15, 4.17 and 4.20, and the constructions behind the §2 examples, which AI.5 names as tests:
   - the 3-fold D;
   - the degenerating finite flat group scheme and the approximation P/G of BG;
   - Remark 2.4 (A_inf-cohomology is not a functor of the special fibre).
5. **CrystallineCohomology CR.4** (8 missing, 2 planned). Witt-ideal lemmas, étale base change for Witt vectors (Theorem 10.4), quotients, the integral part of the torus (Theorem 10.13), Witt vectors of polynomial rings (Lemma 9.8) and base change along perfectoid rings (Proposition 10.14).
6. **AInfCohomology AI.0** (7 missing). The Witt-vector level of §3:
   - A_inf(S) = lim_F W_r(S);
   - θ_r and θ̃_r, their R/F/V compatibilities and their kernels ξ_r and ξ̃_r;
   - Tor-independence and the ideals of W_r(S) cut out by V^j(1);
   - ker θ_∞ = (μ).
7. **AInfCohomology AI.1** (7 missing, 11 planned). K-flat resolutions, Lη over a valuation ring, the comparison maps between Lη and the identity, completed direct sums, and the dga structure and cohomology of Koszul complexes.
8. **AInfCohomology AI.2** (6 missing, 5 planned). Commutative algebra over A_inf (§4.2), including Kedlaya's triviality of vector bundles on the punctured spectrum.
9. **Smaller source routes:**
   - **AInfCohomology AI.7** (3 missing): flatness of 𝔖 → A_inf, base change of Breuil–Kisin to BKF modules, the twist compatibility.
   - **CohomologyComparisons CP.5** (2 missing, 5 planned): torsion-freeness of H^i_crys is equivalent to that of H^i_dR (Remarks 4.21, 14.4, 14.7), and the Enriques-surface application (Remark 1.2).
   - **PerfectoidQuotients Q0:integral-algebra** (2 missing, 1 planned): Lemma 3.9 (Frobenius surjectivity, via Davis–Kedlaya) and Lemma 3.14 (cotangent complex).
   - **CrystallineCohomology CR.3** (1 missing): the crystalline weak Lefschetz theorem (Lemma 2.12).
   - **FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4** (1 missing): the structure theorem for Breuil–Kisin modules (Proposition 4.3).
   - **PadicHodgeTheory P8** (1 missing): Scholze's finiteness of H^i_et(X_C, Z_p) for proper smooth rigid spaces, cited in Theorem 5.1.

Nothing in BMS1 lies outside the directions of existing layers, so no Part II or new roadmap is proposed.

## Prerequisites

Papers BMS1 builds on that the atlas does not yet cover:

- Scholze, *p-adic Hodge theory for rigid-analytic varieties* (2013) and its corrigendum (2016).
- Kisin, *Crystalline representations and F-crystals* (2006).
- Fargues, *Quelques résultats et conjectures concernant la courbe* (2015).
- Scholze–Weinstein, *Berkeley lectures on p-adic geometry* (2020).
- Davis–Kedlaya (2014) and Kedlaya (2013), on Witt vectors.
- Borger (2011) and van der Kallen (1986), on étale maps and Witt vectors.
- Elkik (1973).
- Illusie (1979), for the crystalline cohomology of Enriques surfaces.
- Lang (1983) and Liedtke (2015), on lifting Enriques surfaces.
- Poonen (2004) and Gabber (2001), on Bertini theorems over finite fields.

The DOIs were checked against Crossref.
