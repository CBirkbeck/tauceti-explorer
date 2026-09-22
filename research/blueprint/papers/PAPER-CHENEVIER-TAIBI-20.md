# PAPER-CHENEVIER-TAIBI-20: Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms

Gaëtan Chenevier and Olivier Taïbi, *Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms*, [Publications mathématiques de l'IHÉS 131 (2020), 261–323](https://doi.org/10.1007/s10240-020-00115-z); arXiv [1907.08783](https://arxiv.org/abs/1907.08783) (v1, the only version).

Extraction by Claude Code, session `cc-d67081`, 22 September 2026 (issue #1452). Status: **complete**. The whole published article was read, and every missing item is routed exactly once. The machine-readable extraction is [PAPER-CHENEVIER-TAIBI-20.result.json](PAPER-CHENEVIER-TAIBI-20.result.json):

- 151 items: 5 library, 12 planned, 134 missing;
- 12 routes: one new roadmap and eleven source routes;
- 28 prerequisite entries;
- 11 source issues.

**Source.** The open-access published PDF from pmihes.centre-mersenne.org (63 pages, SHA-256 `ea90fb0f…cd83ba3de`), read on 2026-09-22. Formulas, tables and every quoted passage were checked on page images.

- **arXiv v1** (20 July 2019, SHA-256 `81b7fe2c…6491742c`) was compared with it. The published version adds Definition 5.3 (so the later statements of §5 are numbered one higher) and two references; the theorems, tables and numbers agree. Every source issue below is in both versions.
- **The authors' companion material** [CT19b] was downloaded from https://otaibi.perso.math.cnrs.fr/levelone/ (a mirror of Chenevier's page): the mass tables, the certificate lists, the computation logs, the PARI worksheets and the code for the explicit formula. It was used to check the paper's numbers (see Checks).
- **Mestre 1986**, §§I.1–I.2 (Numdam), was read for the exact hypotheses of the explicit formula.

The other cited inputs were not read, and each item that rests on one says so. These include Arthur's book, Chenevier–Lannes, Taïbi 2017, Moeglin–Renard, Arancibia–Moeglin–Renard, Böcherer and Rallis. The paper quotes them precisely, and the routing only needs what it quotes.

## What the paper proves

The paper has two aims.

1. **Masses in the trace formula.** Compute the multiplicities of discrete series in the level one automorphic spectrum of the split classical groups over Z. Arthur's L²-Lefschetz trace formula expresses the Euler–Poincaré characteristic EP(G; λ) as a geometric side. The main part of that side, the elliptic term, is a sum Σ_c m_c tr(c | V_λ) over conjugacy classes of finite-order elements. The rational numbers m_c are the *masses*.
2. **Classification.** Classify the level one algebraic cusp forms of PGL_m over Q in motivic weight up to 24.

Both rest on one tool: Weil's explicit formula applied to the Rankin–Selberg L-functions of the set Π_alg of level one algebraic cuspidal representations.

**The positivity criterion (§2).** For a test function F, C^F is the computable part of the explicit formula: a symmetric bilinear form on the real vector space RΠ_alg. When F satisfies the positivity condition (POS), C^F is non-negative on the cone spanned by Π_alg (Proposition 2.2).

To show that no π with a given archimedean parameter U exists, one looks for a combination of π with known forms on which C^F is negative. This reduces to minimising a quadratic form β_Q on a simplex (Proposition 2.5, Lemmas 2.6–2.8, Corollary 2.9), which Algorithms 2.4.4–2.4.5 do. Only the final check is part of a proof: β_Q(t, t) < 0 for the stored vector t, verified in interval arithmetic. The criterion contains Miller's inequality and the Chenevier–Lannes scholia as special cases.

**Classification (§§2.4.6, 4).**
- The method reproves the Chenevier–Lannes classification in motivic weight ≤ 22 without Satake parameters.
- **Theorem 3.** There are exactly 13 forms of motivic weight 23 in which the weight 23/2 has multiplicity one.
- **Proposition 4.1** controls those in which 23/2 has multiplicity > 1: they lie in an explicit list of 181 parameters, with one exceptional parameter U_(1).
- **Theorem 4 (under GRH).** At most one such form exists.
- **Theorem 5.** There are exactly three self-dual regular forms of motivic weight 24, with 7, 8 and 8 weights.
- **§2.4.7.** No self-dual π on PGL_4 has L(π_∞) = 2I_w for odd w ≤ 53, hence S_{(k_1,2)}(Sp_4(Z)) = 0 for k_1 ≤ 54.

**The effortless masses (§§1.4, 3).**
- **Arthur's input.** Arthur's classification, with the Adams–Johnson packets, relates EP(G; λ) to the numbers N⊥(w) of self-dual regular forms with given weights (Key fact 2, after Taïbi 2017).
- **The linear system.** Every weight λ with N⊥(w(λ)) = 0 gives a linear equation for the masses. Enough such λ, found by the explicit formula, determine all the masses (the strategy (P1′)/(P2′)).
- **Fewer classes.** Kronecker's theorem shows that the classes involved are finite-order classes given by products of cyclotomic polynomials (Definition 3.1). For special orthogonal groups a spinor-norm argument removes most of them. Zassenhaus's formula for the spinor norm (Theorem 3.5) gives Proposition 3.7, which defines the smaller set P_1(G) (Definition 3.8, Corollary 3.9, Tables 2–3).
- **Theorem 6.** All masses are computed this way for SO_n (n ≤ 17) and Sp_2n (2n ≤ 14).
- **Theorem 7.** The masses of Sp_16 are computed with the help of Taïbi's direct orbital-integral method.

**Siegel modular forms (§5).** The multiplicity formula becomes fully explicit for the holomorphic modules ρ_k.
- For k_g > g the relevant packets are the Adams–Johnson packets (Key fact 1, formula (5.2.1)).
- For scalar weight k ≤ g, Moeglin–Renard's cases (I), (H1), (H2) give formulas (5.2.3)–(5.2.12).
- **Theorem 1.** An implemented formula computes dim S_k(Sp_2g(Z)) for g ≤ 8 and k_g > g.
- **Theorem 2.** The dimensions for every weight k ≤ 13 are given in Tables 5 and 6.
- **Corollary 1.** S_13(Γ_g) is a line for g = 8, 12, 16, 24 and zero otherwise.
- **Theta series.** Proposition 5.13 and Corollary 5.14 show that these four forms are theta series with harmonic coefficients on Niemeier lattices, with the Leech lattice carrying invariant alternating forms exactly in degrees 8, 12, 16, 24.
- **Eichler's basis problem** holds for k = 4, 8, 12 in all genera (Corollary 5.11).
- **For g ≥ 2k** (Proposition 5.15, Corollary 5.16): dim M_k(Γ_g) is independent of g, and ϑ_g is an isomorphism when 4 | k.

## What the libraries and the atlas already have

Library (read at the pinned commits):
- Kronecker's theorem (`NumberField.Embeddings.pow_eq_one_of_norm_eq_one`);
- cyclotomic polynomials and their values at 1;
- the archimedean Γ-factors, as Deligne's `Complex.Gammaℝ` and `Complex.Gammaℂ` with the duplication formula;
- the groups of R-points of Sp_2g (`Matrix.symplecticGroup`) and of SO(q) over any commutative ring (Tau Ceti);
- Tau Ceti's spinor norm over a field, whose kernel is the image of Spin.

Mathlib also has three partial tools, cited in item notes:
- the level-one dimension formula for SL_2(Z) (used in the SO_3 example);
- the Rayleigh-quotient eigenvector lemma (the first half of Lemma 2.6);
- the digamma function.

Planned in the atlas:
- level one and algebraic weights (AF.2, AF.4);
- Satake parameters (SR.4);
- Rankin–Selberg L-functions with their poles (AL.3);
- Arthur's standard parameter, root numbers, archimedean packets and the multiplicity formula (ModularityAndLanglandsExtensions ML.4, which gives the Arthur–Mok classification its proof-source owners);
- Siegel modular forms as sections of automorphic bundles (AutomorphicBundles B4);
- the finite class sets X_n of even unimodular lattices and Siegel theta series (GN.3, MP.5).

Missing, and not planned anywhere:
- the level one theory of classical groups over Z;
- the explicit-formula classification method and its certificates;
- the mass computation;
- the explicit multiplicity formula for ρ_k;
- Siegel modular forms beyond their definition: the Siegel operator, the dictionary with Π_disc(Sp_2g), Wallach's and Weissauer's theorems;
- theta series of even unimodular lattices as automorphic forms on O_n, with Rallis's relation, Böcherer's criterion and the Leech-lattice forms.

## Routes

**New roadmap: `LevelOneAutomorphicFormsForClassicalGroups`,** "Level one automorphic forms of classical groups over Z and Siegel modular forms" (area: automorphic; 116 items).

Nothing in the atlas goes in this direction, so, as for Lawrence–Venkatesh in the maintainer's guides, the paper gets its own roadmap. The paper is one step of a coherent programme (Chenevier–Lannes, Chenevier–Renard, Taïbi, Chenevier–Taïbi). The roadmap plans that programme's level one mathematics and imports every general input from its owner. Its brief lists seven layers:
1. level one algebraic cusp forms of PGL_m;
2. the Rankin–Selberg explicit formula and the positivity criterion;
3. classification in motivic weight ≤ 24;
4. level one Arthur parameters and the explicit multiplicity formula;
5. masses;
6. Siegel modular forms;
7. theta series of even unimodular lattices.

The brief states the final theorems as the paper does, with the corrections below, and names every imported roadmap.

Two remarks for the design job:
- **One owner for the explicit formula.** The explicit-formula layer should own the Stark–Odlyzko method for Rankin–Selberg L-functions of Π_alg. PAPER-BOXER-CALEGARI-GEE-25 proposes a Part II, LevelOneCuspidalCohomologyGLn, whose Fermigier–Miller vanishing is exactly Miller's theorem here (item `miller-theorem`). If both routes are accepted, the Part II should import it from this roadmap.
- **Certificates.** The roadmap should treat numerical steps as certificates (ComputationalNumberTheory CN.5), not as floating-point runs.

**Sources of existing layers (18 items):**
- **AutomorphicFormsOnReductiveGroups AF.1:** Harish-Chandra's criterion for discrete series, and Langlands' archimedean correspondence for GL_n(R) (Knapp). Both are general real representation theory, used here, by AL.3 and by ML.4.
- **AutomorphicLFunctionsAndLocalFactors AL.1:** the ε-factors of representations of W_R (ε(I_w) = i^{w+1}, in Tate's normalisation). They are the archimedean case of AL.1's local factors.
- **AutomorphicLFunctionsAndLocalFactors AL.3:** Gelbart–Shahidi's boundedness of Λ(s, π × π′) in vertical strips, the last analytic input the explicit formula needs.
- **AnalyticNumberTheory AN.3:** Mestre's general explicit formula, with its exact hypotheses, read in Mestre 1986. The Rankin–Selberg case on Π_alg stays in the new roadmap.
- **AnalyticNumberTheory AN.6:** the hypothesis (GRH) for Λ(s, π × π′), π, π′ ∈ Π_alg, used by Theorem 4, for AN.6's register of conditional hypotheses.
- **AutomorphicSpectralTheory AS.6:** Arthur's L²-Lefschetz formula (Arthur 1989). It is the evaluation of the invariant trace formula at pseudocoefficients of discrete series, a general theorem that the level one mass computation only specialises. ET.1 constructs pseudocoefficients only for unitary groups, so their general construction belongs here as well.
- **ModularityAndLanglandsExtensions ML.4:** Arancibia–Moeglin–Renard (Adams–Johnson packets are Arthur packets, with multiplicity one) and Moeglin–Renard (the packets of Sp_2n(R) containing scalar holomorphic modules). Both are statements about archimedean Arthur packets; their level one specialisations stay in the new roadmap.
- **GeometryOfNumbersAndQuadraticArithmetic GN.2:** five items of general quadratic-form theory that build on Tau Ceti's field-level spinor norm:
  - regular forms over rings;
  - GSpin, Spin and the spinor norm over rings;
  - Zassenhaus's formula;
  - Corollary 3.6;
  - Proposition 3.7.
- **MetaplecticAutomorphicForms MP.3:** Rallis's relation between Satake parameters under the unramified theta correspondence, a statement about local theta modules.
- **ComputationalNumberTheory CN.4:** the certified evaluation of the explicit-formula quantities (digamma values and series with tail bounds), and the exact Fincke–Pohst enumeration with certified rational bounds.
- **ComputationalNumberTheory CN.5:** the certificate lists and mass tables of [CT19b].

## Source issues (`sourceIssues` E1–E11)

The authors' published data and code made most of these checkable, and several were checked against it. None changes a main theorem.

**Two are substantive.**
- **E3 (error).** The normalisation of the quadratic form β_Q in (2.4.4), with the factor 1/m_i, is what the authors' code computes. It does not fit the weights 1/√m used afterwards.
  - The embedding ρ of Corollary 2.9 does not satisfy β_Q ∘ ρ = β_{Q′}, and the equality μ_{Q′} = μ_Q fails: one block of size 2 gives μ_Q = 2μ_{Q′}. The sign equivalence, which is what the algorithm uses, holds.
  - The output inequality C(x, x) ≤ β_Q(t, t) of Algorithm 2.4.5 is false for the element x it defines. It holds with weights t_l/m_l in place of t_l/√m_l.
  - The worker ported the authors' formulas and checked the port against seven of their certificate values. With it, the element displayed in §4.1 has C(x, x) ≈ +0.078 > 0, so it is not a counterexample to Proposition 2.2. The corrected element has C ≈ −0.0198, and the printed −0.0023 matches neither.
  - In §2.4.6 the printed C-values are exactly those of the corrected elements.
  - Every certificate is a negative value of β_Q as printed, so all theorems stand.
- **E6 (gap).** The proof of Proposition 4.1(1) needs the parameter U_(1) = I_1 + I_7 + I_13 + I_17 + I_21 + 2I_23 to lie outside the list V.
  - In the authors' certificate file it is one of the 187 unresolved parameters, hence in V. So the non-self-duality in Proposition 4.1(1) is not proved as written.
  - A single further run closes the gap: Algorithm 2.4.5 with δ = 1, m = 2, which excludes two distinct self-dual forms with this parameter.
  - The worker's floating-point run of that step finds β/F̂(i/4π) ≈ −0.175 at ℓ = 7.75, which is far from zero; it still has to be certified in interval arithmetic.
  - The introduction's counts (182 weights, 183 putative forms) become 181 and at most 182.

**The others:**
- **E1.** |P(Sp_14)/∼| is 1158, not 1157, in Table 2 and twice in §3.3. The worker recounted it, and the authors' mass file has 1158 classes.
- **E2.** Footnote 13 has S_23(SL_2(Z)) for S_24(SL_2(Z)).
- **E4.** §4.1 gives |U_1| = 12230 and, two sentences later, 12293 − 187 = 12106. The authors' log and certificate file have 12293. Recomputing B_∞(U, U)/F̂(i/4π) gives 12217 parameters at ratio ≤ 1, exactly 12230 at ≤ 1.0001 and 12293 at the 1.001 margin their code uses: 12230 is a count at another safety margin.
- **E5.** "The 187 resistant elements of U_2" should be U_1: only 100 of the 187 are in U_2.
- **E7.** The 181 parameters of V have dimensions 10 to 38, not 14 to 42. The element B of V named in the proof of Theorem 4 has dimension 12.
- **E8.** The proof of Theorem 4 has "δ = m = 2" for δ = 0, m = 2.
- **E9.** The proof of Theorem 5 needs Sp_2n for 2n ≤ 14, not 2n ≤ 8: the odd-dimensional orthogonal forms of dimension 11, 13 and 15 correspond to Sp_10, Sp_12 and Sp_14.
- **E10.** The proof of Lemma 4.3 has 15 for 16 elements; the 15 counts pairs.
- **E11.** §2.4.3 cites [CL19, (3) p.127], and §4.3 cites the same estimate at p. 277. Page 127 lies in the book's chapter on theta series.

No erratum was found: arXiv has one version, and neither the journal page nor the authors' pages list one. All eleven are recorded as new.

## Prerequisites not yet covered

The atlas covers none of the following.

- **Chenevier–Lannes's book** (Ergebnisse 69, 2019) is the foundation. It provides:
  - level one forms on O_n and Sp_2g;
  - Arthur's multiplicity formula at level one;
  - the explicit formula and its scholia;
  - Theorems E and F;
  - the degrees of the Niemeier eigenforms.
  Like Pan's first paper in the maintainer's guide for Pan II, it should be covered as the base of the new roadmap.
- **Level one theory:**
  - Taïbi 2017 (Key fact 2 and the analysis of the L²-Lefschetz formula);
  - Chenevier–Renard 2015 (Key fact 1);
  - Taïbi 2019 (standard parameters on the compact inner forms).
- **The trace formula and packets:** Arthur 1989 (the L²-Lefschetz formula), Arancibia–Moeglin–Renard, Moeglin–Renard and Adams–Johnson.
- **Explicit formulas:**
  - Mestre 1986;
  - Chenevier's automorphic Hermite–Minkowski theorem;
  - Miller 2002;
  - Gelbart–Shahidi;
  - the appendix of Moeglin–Waldspurger 1989 on poles;
  - Knapp's survey of the archimedean correspondence.
- **Siegel modular forms and theta series:**
  - Böcherer 1989;
  - Rallis 1982 and 1984, with Moeglin–Waldspurger 1994;
  - Ikeda 2001;
  - Chenevier–Taïbi on weight 13 and the Leech lattice;
  - Weissauer 1983;
  - Freitag 1977 with Resnikoff 1975;
  - Enright–Howe–Wallach;
  - Cléry–van der Geer.
- **Algebra and computation:**
  - Gross–McMullen;
  - Gross's motive of a reductive group;
  - Koike–Terada;
  - Zassenhaus;
  - Fincke–Pohst.

## Checks

All computations were done in the worker's scratch space. None of them is in the repository.

- **Tables 2 and 3.** Recounted from Definition 3.1, Definition 3.8 and the relation ∼. All entries agree except Sp_14 (E1).
- **Remark 3.10.** Against the authors' twenty mass files, exactly six zero-mass classes in P_1 for SO_13 and six for SO_17, and no non-zero mass outside P_1(G), as Corollary 3.9 says.
- **The SO_3 example.** The stated masses solve the displayed linear system and reproduce dim S_{2k+2}(SL_2(Z)) for k < 40.
- **§5.3.1.** The enumeration was redone: 199 parameters and 59 solutions. These come out when the trivial parameter (g = 0) is included and Δ¹_23, Δ²_23 are not distinguished. The 58 solutions with g ≥ 1 are the 29 rows of Table 5 and the 29 rows of Table 6 with k > g.
- **Lemma 4.3.** Recounted: 1260 candidates, all of dimension at most 25.
- **§4 counts.** Checked against the authors' certificate files and log:
  - 12293 = 12106 + 187 for weight 23 with m = 1;
  - 158 and 3 for weight 22;
  - the 181 elements of V and their properties (i)–(iii).
- **The explicit-formula code.** The authors' PARI functions were ported to mpmath. The port reproduces seven certificate values to six digits, the printed values in §2.4.6, and the least eigenvector printed in §4.1.
- **Automated checks.**
  - `python3 scripts/check_paper.py research/blueprint/papers/PAPER-CHENEVIER-TAIBI-20.result.json`: ok.
  - `python3 research/blueprint/intake.py check-files` on the three files: 3 files, 0 problems.
