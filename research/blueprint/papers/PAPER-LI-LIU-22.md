# PAPER-LI-LIU-22: Chow groups and L-derivatives of automorphic motives for unitary groups, II

Chao Li and Yifeng Liu, *Chow groups and L-derivatives of automorphic motives for unitary groups, II*, [Forum Math. Pi 10 (2022), e5](https://doi.org/10.1017/fmp.2022.2); arXiv [2101.09485](https://arxiv.org/abs/2101.09485).

Extraction by Claude Code, session `cc-fb70e5`, 22 September 2026 (issue #1384). Status: **complete**. The whole paper was read and every missing item is routed once. The machine-readable extraction is [PAPER-LI-LIU-22.result.json](PAPER-LI-LIU-22.result.json): 84 items (3 planned, 81 missing), 6 routes, 18 prerequisite entries and 3 recorded source issues.

**Source.** The published open-access PDF from Cambridge Core (71 pages), SHA-256 `0661582ac905525b5d3c73f9b4de798b5eb43fafb4b5f51c3879071d859b1fc0`, read in full on 2026-09-22.

- The article was received on 12 April 2021, revised on 15 December 2021 and accepted on 12 January 2022.
- arXiv v2 (10 April 2021, comment "revised in accordance with [LL]") predates the journal revision, so the published version was used.
- Locators are journal pages.

## What the paper proves

**Setting.** E/F is a CM extension with F ≠ Q, and π is a cuspidal automorphic representation of the quasi-split U(r, r) over F. Its archimedean components are holomorphic discrete series with Harish-Chandra parameter {(1 − n)/2, …, (n − 1)/2}. X_L is the unitary Shimura variety of a totally positive definite incoherent hermitian space V of rank n = 2r, of dimension n − 1.

**Main theorems.** The paper removes two restrictions of Li–Liu, Ann. of Math. 194 (2021) (LL21): E/F may now ramify, and π may have arbitrary components at split places.
- **Theorem 1.4 (Chow-group nonvanishing).** Suppose r[F:Q] + |S_π| is odd (so the global root number is −1). If L′(½, π) ≠ 0, then the π-localized Chow group colim (CH^r(X_L)^0)_𝔪 is nonzero. This does not need the modularity of generating functions.
- **Theorem 1.5 (arithmetic inner product formula).** Assume Hypothesis 4.11 (modularity of Kudla's generating functions) and LL21 Hypothesis 6.6. Then the normalized Beilinson–Bloch height of two arithmetic theta lifts equals L′(½, π)/b_{2r}(0) times C_r^{[F:Q]} times a product of normalized local doubling zeta integrals. This is Liu's Conjecture 3.11 of 2011.
- **Corollary 1.7.** For new vectors, the height equals (−1)^r L′(½, π)/b_{2r}(0) |C_r|^{[F:Q]} times an explicit product over the inert places in S_π.
- **Example 1.10.** Symmetric powers Sym^{2r−1} of elliptic curves now qualify.
- **Remarks 4.32–4.33.** When S_π = ∅, LL21 Hypothesis 6.6 is not needed. F = Q remains out of reach.

**New local inputs.**
1. **Ramified places: Theorem 2.7.** The Kudla–Rapoport-type identity Int(𝐋) = ∂Den(𝐋) holds on the exotic smooth relative Rapoport–Zink space N of signature (n − 1, 1) over a ramified E/F, for p odd and n even.
   - The proof follows Li–Zhang: induction on val(L♭) over lattices of rank n − 1, comparing horizontal and vertical parts.
   - The ramified analytic vertical part is handled directly (Proposition 2.22), with a parity-constrained lattice parametrization (Lemma 2.24).
   - The geometric side uses Wu's Bruhat–Tits stratification by orthogonal Deligne–Lusztig varieties, which is where the reduction ends at n = 4.
   - Howard's linear invariance (§2.4) computes the n = 4 case: deg ω = q − 1 on each component of a Deligne–Lusztig curve (Lemma 2.42), and Lemma 2.55.
   - r = 1 is Keating's formula (Proposition 2.44).
2. **Absolute versus relative spaces (§2.8).** A display-theoretic comparison identifies the absolute and relative spaces when F/Q_p is unramified (Proposition 2.62, Corollaries 2.65–2.66), so the relative theorem applies to the RSZ integral models.
3. **Split places: Theorem 4.21.** H^{2r}(X_m, Q_ℓ(r))_𝔪 = 0 for the Drinfeld-level integral models X_m.
   - The proof runs through the Newton strata of the special fibre and their Drinfeld-kernel refinements Y^[M]_m.
   - Proposition 4.25 shows the localized cohomology of each closed stratum is concentrated in the middle degree. It uses Mantovan's smoothness, the Caraiani–Scholze Igusa trace formula with endoscopy, and an alternating Steinberg sum (Lemma 4.24).
   - This replaces the restriction on π_u in LL21 Proposition 7.1 (Proposition 4.20).

**Doubling side (§3).** At ramified places, with the special maximal compact subgroup, the spherical doubling zeta integral is L_σ(s + ½)/b_{2r}(s) (Proposition 3.6), the doubling factors are L = L_σ and ε = 1 (Proposition 3.7), and the theta lift of a tempered spherical π is π^σ_V (Proposition 3.9).

**Assembly.** Local indices at split, inert, ramified and archimedean places (Propositions 4.20, 4.27, 4.28, 4.31) are matched with the terms 𝔈_{T₁,T₂} of the derivative of an incoherent Eisenstein series. Proposition 4.9 is the doubling identity for that derivative.

## What the atlas already has

- **Library.** Nothing.
  - Mathlib and Tau Ceti have no hermitian lattices over local fields.
  - They have no Rapoport–Zink spaces, unitary Shimura varieties or Deligne–Lusztig varieties.
  - They have no Weil representation, smooth representations or Beilinson–Bloch heights.
  - The reviewed library audit (`data/library-coverage.json`) marks GN.3, MP.2, MP.3, R34.5, the PELModuli layers and GZ.2–GZ.9 not built.
- **Planned.**
  - GeometryOfNumbersAndQuadraticArithmetic GN.2 (quadratic and hermitian local theory): normal bases and fundamental invariants of hermitian lattices over a ramified extension (Definitions 2.10–2.11, Lemma 2.12, via Jacobowitz).
  - IgusaVarietiesAndTorsionConcentration IG.5 (rational Igusa trace comparison): Caraiani–Scholze Lemma 5.5.1, the alternating Q_ℓ-representation of Igusa cohomology.
  - WeightsInEtaleCohomology R34.5: Deligne's purity for proper smooth varieties.
- **Deliberately not credited.**
  - SmoothRepresentationsOfLocalGroups SR.4 plans the Satake isomorphism for unramified groups with hyperspecial level only. Remark 3.1 (spherical Hecke algebras of ramified U(r, r) at a special maximal compact subgroup) is outside it, so it is routed as missing.
  - AutomorphicSpectralTheory AS.1–AS.2 treat Eisenstein series from cuspidal data only, not the Siegel degenerate principal series needed here.

## Routes

1. **Part II of PELModuli: `UnitaryRapoportZinkSpacesAndRSZModels`** (11 items). This reuses the candidate proposed by PAPER-LI-ZHANG-22-B. It takes:
   - the exotic categories Exo_{(n−1,1)}, Exo_{(n,0)} and the relative space N;
   - the absolute categories Exo^Φ and the display comparison of §2.8 (Proposition 2.62, Corollaries 2.65–2.66);
   - V♥ and admissible CM types, and the auxiliary CM moduli Y;
   - the models X_m (RSZ20 Theorem 4.5) and X_L̃ (RSZ20 Theorem 4.7);
   - the uniformization isomorphism of Proposition 4.30.

   Everything here is moduli-theoretic, as in the LZ22 brief, so the Part II stays independent of the cycle roadmaps.
2. **Part II of GrossZagierAndArithmeticHeights: `UnitaryKudlaRapoportCycles`** (25 items). This also reuses a PAPER-LI-ZHANG-22-B candidate, now with its ramified analogue. It takes:
   - the special divisors, Int(𝐋) and Theorem 2.7;
   - the analytic horizontal and vertical parts (Definition 2.20, Lemma 2.24, Proposition 2.22) and the Whittaker comparison of Remark 2.18;
   - Wu's stratification, the Lusztig ²D_n cycle lemma, linear invariance, the line bundle ω, the relative Cartier property and Lemma 2.42;
   - r = 1 (Proposition 2.44, Corollary 2.46);
   - the K-theoretic horizontal and vertical parts, the cancellation law, Lemmas 2.49 and 2.53–2.56, and Proposition 2.51;
   - N^Φ(x) = N(x^rel).
3. **New Part II of GrossZagierAndArithmeticHeights: `UnitaryArithmeticInnerProductFormula`** (26 items, area `arithmeticgeometry`).
   - **Local.** Ramified spherical Hecke algebras and principal series; the doubling zeta integral and Propositions 3.6–3.7.
   - **Global setup.** The global notation, assumptions and Propositions 4.8–4.9; Liu's Eisenstein expansions.
   - **Cycles and heights.** Kudla generating functions, Hypothesis 4.11 as an explicit hypothesis, arithmetic theta lifting, Beilinson's height pairing, admissible sextuples and the normalized height.
   - **Local indices.** Propositions 4.20, 4.27, 4.28, 4.31 and (4.9).
   - **Main results.** Theorems 1.4 and 1.5, Corollary 1.7, Example 1.10 and Remarks 4.32–4.33.

   GZ plans rank-one height identities on Shimura curves (GZ.1, GZ.5–GZ.8). Nothing in the atlas plans heights of arithmetic theta lifts on higher-dimensional unitary Shimura varieties, or the doubling method at ramified places. This Part II imports the two unitary Part IIs above rather than duplicating them.

   The brief asks that the pending extraction of LL21 (#1115) route into the same Part II. No existing candidate fits: `UnitaryKudlaRapoportCycles` is the local and global special-cycle theory, whose brief stops at the arithmetic Siegel–Weil formula.
4. **Source of GeometryOfNumbersAndQuadraticArithmetic GN.3** (9 items). Ramified hermitian local densities:
   - Den(M, L) against H_s, and the Cho–Yamauchi-type formula (Lemma 2.15);
   - the normalized Siegel series and the lattice-count formulas (2.3)–(2.4);
   - Lemma 2.23 (invariants from minors, type change), Lemma 2.25, the r = 1 count of Lemma 2.43, and the special lattices and valuation reduction (Lemmas 2.57–2.58).
5. **Source of MetaplecticAutomorphicForms MP.2 and MP.3** (4 items):
   - the Fourier transform over a ramified extension;
   - the Schrödinger model for G_r × U(V);
   - the spherical module (Proposition 3.4);
   - theta lifts of tempered spherical representations (Proposition 3.9).
6. **Source of IgusaVarietiesAndTorsionConcentration IG.5 and IG.7** (6 items):
   - Newton strata and their Drinfeld-kernel refinements;
   - the parabolic counting lemmas and the Steinberg alternating sum;
   - Mantovan's smoothness of closed strata;
   - Proposition 4.25 and Theorem 4.21, localized vanishing of middle cohomology.

## Source issues (`sourceIssues` E1–E3)

All three are misprints; each affects nothing. Each was confirmed in the PDF text layer.

- **E1.** In the proof of Proposition 2.44, (2.17) and the next display print (b₂ − l)q^j. There is no l; it should be (b₂ − j)q^j, as in Lemma 2.43, whose overlattice count 1 + q + ⋯ + q^j + (b₂ − j)q^j was rederived.
- **E2.**
  - The proof of Lemma 2.56 defines θ by "θ(x_i) = 1"; it should be θ(x_i) = x_i, the unitary reflection negating x_n.
  - The proof of Lemma 2.58 twice writes u^{e_i−1}O_F, where e_i is a basis vector; it should be u^{a_i−1}O_F.
- **E3.**
  - Lemma 2.15's summation range is typeset "L′ ⊆ L′vee". The PDF span is the italic letters 𝑣𝑒𝑒 in font NewTXMI5, so \vee came out as text. It should read L′ ⊆ L′^∨.
  - The proof of Lemma 4.24 introduces "σ(i)" for the sequence indexed by h; it should be σ(h).

**Also checked and correct:**
- The finite-field isometry count (2.2) behind Lemma 2.15, and the lattice-count formulas (2.3)–(2.4).
- Remark 2.18's normalization.
- The initial case of Lemma 2.25.
- Lemma 2.42: −q(q + 1) + (q² + 1) = 1 − q, so deg ω = q − 1.
- Lemma 2.43's count.
- Lemma 2.55's function −q(1 + q)1_Λ + Σ1_{Λ′} and its Fourier transform: values q − 1, −1, 0, 0, with q² + 1 type-2 lattices over Λ.
- The zeta-factor cancellation in Proposition 3.6.
- The telescoping in Lemma 4.24.
- The sign (−1)^r of Corollary 1.7, against Proposition 4.9 and the parity of r[F:Q] + |S_π|.

The paper itself corrects KR14 Prop. 10.1: L_{r,r} should be H_r (footnote 10). Crossref records no correction notice or update relation for the Forum Math. Pi article.

## Prerequisites not yet covered

- Li–Liu 2021 (its own job, #1115) and Li–Zhang 2022 (extracted as PAPER-LI-ZHANG-22-B).
- Rapoport–Smithling–Zhang 2017 and 2020, and Wu 2016.
- Howard 2012 and 2019, and Cho–Yamauchi 2020.
- Caraiani–Scholze 2017 (its own job), Mantovan 2008, Harris–Taylor 2001 and Taylor–Yoshida 2007.
- Yamana 2014, Liu 2011 (both parts), 2021 and 2022, Gelbart–Piatetski-Shapiro–Rallis and Gan–Ichino.
- Mihatsch 2022, Ahsendorf–Cheng–Zink 2016, Vollaard 2007, Lusztig 1976 and Gillet–Soulé 1987.

Links and reasons are in the JSON. Bibliographic data follow the paper's reference list.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-LI-LIU-22.result.json`: ok.
- Every missing item appears in exactly one route, and no route takes a planned item.
- Stage ids were checked against `data/atlas.json`, the accepted restructures and `data/roadmap-retirements.json`. RS-07, RS-30, RS-31 and RS-32 touch the owning roadmaps, either by narrowing other stages or, in RS-31, by adding supplier links into SR.4. None changes the scope of a cited stage, and none of the cited stages is retired.
- The two reused Part II ids come from the merged PAPER-LI-ZHANG-22-B routes. `UnitaryArithmeticInnerProductFormula` occurs in no other extraction.
- No Lean was written or compiled; none is a deliverable of this job.
