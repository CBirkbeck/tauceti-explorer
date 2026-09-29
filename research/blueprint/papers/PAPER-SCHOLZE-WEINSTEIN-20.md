# PAPER-SCHOLZE-WEINSTEIN-20: Berkeley lectures on p-adic geometry

Peter Scholze and Jared Weinstein, *Berkeley lectures on p-adic geometry*, Annals of Mathematics Studies 207, Princeton University Press, 2020, [doi:10.1515/9780691202150](https://doi.org/10.1515/9780691202150); zbMATH [1475.14002](https://zbmath.org/?q=an:1475.14002); author's copy on [Scholze's page](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf).

Extraction by Claude Code, session `cc-39fac3`, 29 September 2026 (issue #4540). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-SCHOLZE-WEINSTEIN-20.result.json](PAPER-SCHOLZE-WEINSTEIN-20.result.json). It has:
- 180 items: 7 library, 134 planned, 39 missing;
- 12 routes: five Part IIs, each joining a pending candidate of the same id, and seven sources of existing layers (three of them take missing items, four name planned items only);
- 10 prerequisite entries;
- 6 recorded mistakes, all misprints that affect nothing.

## Sources read

- **The author's copy**, read in full: the print-ready files dated 27 March 2020, 260 pages. The copyright page says Princeton University Press printed the book from the authors' print-ready files, and the files carry the book's pagination (printed page = PDF page − 10). All locators are printed pages.
- **The printed book** was not compared: the publisher's pages returned a bot challenge. The findings are scoped to the print-ready text.
- There is no arXiv version. The 2014 course notes predate the book and were not read.

## What the book proves

**The goal.** For a smooth group scheme 𝒢 over ℤ_p with reductive generic fibre G, an element b ∈ G(L) and cocharacters μ_1, …, μ_m, the lectures build the moduli space of mixed-characteristic local shtukas Sht_{𝒢,b,{μ_i}}. They prove:
- it is a locally spatial diamond (Theorem 23.1.4);
- it has étale period maps to twisted Beilinson–Drinfeld Grassmannians, and a tower in the level (Corollary 23.5.3);
- with one minuscule leg it gives a local Shimura variety (Definition 24.1.3);
- for EL/PEL data it is the generic fibre of a Rapoport–Zink space (Theorem 24.2.5, Corollary 24.3.5);
- it has an integral model M^int_{(𝒢,b,μ)}, identified with Rapoport–Zink formal schemes (Theorem 25.1.2). This proves the conjectures of Rapoport–Zink (2017) and Kudla–Rapoport–Zink on Drinfeld's moduli problem (Theorems 25.4.1, 25.5.2).

**The route.**
1. **Adic spaces** (Lectures 2–5). Huber rings, Spa, rational localization, sheafiness criteria, pre-adic spaces, analytic points, pushouts, stably uniform rings, and Cartier divisors.
2. **Perfectoid spaces** (Lectures 6–7). Tilting and untilts, sousperfectoid rings, almost purity and the étale site.
3. **Diamonds** (Lectures 8–10). Pro-étale maps, descent, Spd ℚ_p and X ↦ X^♦. The appendix proves that R^if_*𝔽_p is a local system for proper smooth rigid maps.
4. **Shtukas with one leg** (Lectures 11–14). The space S ×̇ Spa ℤ_p; shtukas with one leg as Breuil–Kisin–Fargues modules and as pairs (T, Ξ) (Fargues); Kedlaya's extension of bundles from 𝒴 to Spec A_inf; the Fargues–Fontaine curve; p-divisible groups over 𝒪_C (Scholze–Weinstein Theorems A and B, Fargues).
5. **Banach–Colmez spaces and Drinfeld's lemma** (Lectures 15–16). Banach–Colmez spaces and Le Bras's theorem; π_1((Spd ℚ_p)^n/p.Fr.) = G_{ℚ_p}^n.
6. **The v-topology** (Lecture 17). Small, spatial and proper v-sheaves. The appendix gives Dieudonné theory over integral perfectoid rings.
7. **Perfect and formal schemes** (Lecture 18). v-sheaves of perfect and formal schemes and full faithfulness.
8. **Affine Grassmannians** (Lectures 19–21). The B_dR⁺-affine Grassmannian, its Schubert varieties and Demazure resolutions; Beilinson–Drinfeld families over Spd ℚ_p, Spd ℤ_p and their powers; the Witt vector affine Grassmannian; ind-properness via Anschütz; the conjecture on local models (Conjecture 21.4.1) and the Rapoport–Zink local models.
9. **Bundles and G-torsors on the relative curve** (Lecture 22). Kedlaya–Liu semicontinuity; the étale locus; B(G) and Fargues' classification.

## What the atlas already has

Most of the book is planned, and several packets already cite it node by node.

**Lectures 2–5.**
- **Library.** Tau Ceti's adic library (`TauCeti/RingTheory/Huber`, `TauCeti/AlgebraicGeometry/AdicSpace`, read at f790474) proves:
  - Huber and Tate rings, pairs of definition, bounded and power-bounded elements, rings of integral elements;
  - Spa and its spectrality, Cont(A) spectral;
  - rational subsets and their intersections, analytic points;
  - the structure presheaf's limit presentation, the rational-localization homeomorphism;
  - the open mapping theorem over Tate rings.
- **Mathlib** has spectral spaces and adic completion along finitely generated ideals (Lemma 2.1.1).
- **Planned.** The rest is the Tau Ceti AdicSpaces roadmap (Layers 0–5), AdicSpacesPartII (R0, R2, R3, R5) and AdicEtaleGeometry A1. A1's nodes cite Definitions 3.1.11, 3.2.1, 3.4.1 and the appendix to Lecture 3.

**Lectures 6–8.** PerfectoidSpaces P0–P6, whose packets cite most statements here as nodes.

**Lectures 8–10 and 17.**
- DiamondsAndVStacks D0–D6, DiamondEtaleCohomology C0/C4, and AdicEtaleGeometry A4 (whose nodes are taken from Lemma 10.1.6).
- ClassicalAdicEtaleCohomology H2 for points and affinoid fields.

**Lectures 11–15.**
- **The curve.** RelativeFarguesFontaine RF0–RF4 and FarguesFontaineDiamonds F0/F1/F4 cover S ×̇ Spa ℤ_p, untilts as closed Cartier divisors and the relative curve and its diamond. The Tau Ceti AdicSpaces Layer 6 is the adic curve.
- **Bundles.** VectorBundlesAndIsocrystals VB0–VB4 cover classification, GAGA, Kedlaya–Liu semicontinuity, slope-zero bundles and Banach–Colmez spaces.
- **Fargues' equivalence.** AInfCohomology AI.2 plans it explicitly, for finite free Breuil–Kisin–Fargues modules and pairs (T, Ξ). The shtuka categories of Theorem 14.1.1, and the steps of its proof (Proposition 12.3.5, Theorem 13.2.1, Kedlaya's Theorem 14.2.1), are part of that plan.
- **Hodge–Tate sequence.** HodgeTateAndCanonicalSubgroups T0/T2 give the Hodge–Tate sequence of Theorem 12.1.1.
- **The appendix to Lecture 14** is AInfCohomology AI.4–AI.5 and CohomologyComparisons CP.1–CP.3.

**Lecture 16.**
- Drinfeld's lemma for schemes is GlobalShtukasAndFunctionFieldLanglands GS.4.
- The diamond version is VStackSheavesAndLisseCategories VS1.

**Lectures 19–21 (up to local models).**
- GeometricSatakeAndFusion GS0. GS0:Witt-geometry already says it proves 'the integral family and bounded properness using Berkeley §§19.2–19.3, §§20.3–20.5 and Lecture 21'.
- The G-torsor appendix is RF4:G-torsors and BunGAndNewtonStrata BG0.

**Lectures 22–24.**
- VB1/VB4 and BunGAndNewtonStrata BG0–BG2.
- HeckeStacksAndLocalShtukas HS0/HS2, whose packet node local-shtuka-moduli cites Definition 23.1.1 and Theorem 23.1.4.

## Routes

**Five Part IIs.** Each joins a pending candidate with the same parent, id and title. make_queue folds every Part II of a parent into one design job, so these items reach the design jobs that are already pending.

1. **PrismaticCohomology, Part II: prismatic Dieudonné theory** (8 items).
   - The candidate: Anschütz–Le Bras's classification of p-divisible groups over quasi-syntomic rings; continued by Česnavičius–Scholze and Farb–Kisin–Wolfson.
   - The Berkeley items:
     - Dieudonné theory over integral perfectoid rings (Theorem 17.5.2);
     - p-divisible groups over 𝒪_C as minuscule BKF modules (Theorem 14.4.1);
     - Scholze–Weinstein's Theorem B, the (T, W) classification (Theorem 12.1.5);
     - Theorem A over 𝒪_C/p and over perfectoid R⁺/ϖ (Theorems 14.4.2, 15.2.3);
     - the crystalline comparison (Theorem 14.4.3) with its proof through Faltings' comparison and formal abelian varieties.
   - Why here: AI.2 plans BKF modules but no layer classifies p-divisible groups over these bases, and this candidate is exactly that classification in greater generality.
2. **DiamondsAndVStacks, Part II: recovery of integral models** (6 items).
   - The candidate comes from Kisin–Pappas–Zhou and Gleason–Lim–Xu. It already lists Proposition 18.4.1 as item I01 and asks for it 'with Scholze–Weinstein's own hypotheses'.
   - The Berkeley items: all of Lecture 18 (v-sheaves of pre-adic spaces, perfect-scheme and formal-scheme full faithfulness, Lourenço's theorem), plus the generic-fibre inputs from Lecture 10 (universal homeomorphisms, seminormal rigid spaces).
3. **GeometricSatakeAndFusion, Part II: integral local models** (5 items).
   - The candidate comes from Kisin–Pappas, Kisin–Zhou, Kisin–Pappas–Zhou, Gleason–Lim–Xu and Le–Le Hung–Levin–Morra. It plans the later proofs of Conjecture 21.4.1.
   - The Berkeley items: the conjecture itself; its dévissage (Propositions 21.4.3, 21.5.1); the Rapoport–Zink lattice chains and naive local models; the RZ17 and KRZ local-model theorems.
4. **HeckeStacksAndLocalShtukas, Part II: integral parahoric models and crystalline diagrams** (9 items).
   - The candidate comes from Kisin–Pappas–Zhou, van Hoften, Zhu and Gleason–Lim–Xu; the last plans 'the open-closed RZ comparison'.
   - The Berkeley items: Rapoport–Zink spaces for GL_n and EL/PEL data; Scholze–Weinstein's identification of their generic fibres with shtuka spaces; the integral models M^int and their comparison with RZ formal schemes; tori and non-parahoric groups; the RZ17 and KRZ theorems.
   - Why here: HS2 explicitly leaves the Rapoport–Zink comparison as a check in examples.
5. **ClassicalAdicEtaleCohomology, Part II: mod-p Poincaré duality** (3 items).
   - The candidate comes from Zavyalov and consumes the finiteness of mod-p cohomology of proper smooth rigid spaces.
   - The Berkeley items: the appendix to Lecture 10, i.e. relative finiteness, R^if_*𝔽_p a local system, by almost coherence over strictly totally disconnected bases.

**Three sources of existing layers taking missing items.**

6. **VectorBundlesAndIsocrystals VB3 and VB4.**
   - VB3: Colmez's category of Banach–Colmez spaces and Le Bras's theorem. The pending VB Part II of Colmez–Nizioł already assumes the parent has Le Bras's equivalence.
   - VB4: the integral slope-zero equivalences (Theorem 12.3.4, Propositions 22.3.2 and 22.6.1) and the simple connectivity of X_FF (Theorem 13.5.7).
7. **RelativeFarguesFontaine RF0:integral-Y.** The whole analytic locus of Spa A_inf is an adic space (Proposition 13.1.1), with Kedlaya's strong noetherianity and PID results.
8. **HeckeStacksAndLocalShtukas HS0 and HS2.**
   - Missing items: the lattice functors Latt with their admissible loci (Corollary 22.3.3, Theorem 22.6.2) and Rapoport's non-emptiness criterion b ∈ B(G, μ^{-1}) (Proposition 24.1.2).
   - Planned items named for convenience: those of Lectures 23–24.

**Four sources naming planned items only.** AInfCohomology AI.2, PerfectoidSpaces, DiamondsAndVStacks and FarguesFontaineDiamonds. They give the design and blueprint jobs the book's statements with printed locators; the maintainer's note names the last three.

## Mistakes recorded

No erratum is listed on the author's page or in the Crossref records. The publisher's page could not be reached. All six findings are misprints and affect nothing.
- **E1.** Example 12.1.6 sets i = dim_C H − 1. Its own consequences (a rational line gives μ_{p^∞} ⊕ (ℚ_p/ℤ_p)^{h−1}; W ∈ Ω^h gives special fibre G_h) need i = dim H + 1 for the projective subspace H.
- **E2.** p. 112 cites a nonexistent 'Proposition 13.2.1' for B^{φ=p^n} = (B⁺)^{φ=p^n}; this is Proposition 13.3.2.
- **E3.** The appendix to Lecture 14 announces 'Proposition 14.4.3' for Theorem 14.4.3.
- **E4.** Theorem 21.2.2 cites 'Theorem 14.2.3' for Lemma 14.2.3.
- **E5.** Definition 17.1.1 names the finite index set I_V and then uses I_U.
- **E6.** Definitions 20.4.2, 20.4.4 and 20.5.3 run indices to n for m legs.

**Checked and not a mistake.** The conclusion of Lemma 2.1.1 looks missing from the text at the page break, but the lemma sits in a footnote that continues on p. 8.

**A correction of another paper, in print here.** Remark 10.5.7 corrects Scholze, *On the p-adic cohomology of the Lubin–Tate tower* (Ann. Sci. ÉNS 51, 2018), Lemma 8.8: the map there only factors over an almost finitely presented module, and Corollary 8.9 is unaffected. This belongs in that paper's errata record when it is extracted. The Part II brief for route 5 carries it.

## Prerequisite papers not yet in the atlas

- **Scholze–Weinstein, *Moduli of p-divisible groups*** (Cambridge J. Math. 1, 2013): [doi:10.4310/CJM.2013.v1.n2.a1](https://doi.org/10.4310/CJM.2013.v1.n2.a1). Needed for Theorems A and B and the Rapoport–Zink generic fibres.
- **Rapoport–Zink, *Period spaces for p-divisible groups*** (Annals of Math. Studies 141, 1996): [doi:10.1515/9781400882601](https://doi.org/10.1515/9781400882601).
- **Rapoport–Zink, *On the Drinfeld moduli problem of p-divisible groups*** (Cambridge J. Math. 5, 2017): [doi:10.4310/CJM.2017.v5.n2.a2](https://doi.org/10.4310/CJM.2017.v5.n2.a2).
- **Kudla–Rapoport–Zink, *On the p-adic uniformization of unitary Shimura curves*** (Mém. SMF, 2024): [doi:10.24033/msmf.183mrsktz](https://doi.org/10.24033/msmf.183mrsktz).
- **Le Bras, *Espaces de Banach–Colmez et faisceaux cohérents sur la courbe de Fargues–Fontaine*** (Duke 167, 2018): [doi:10.1215/00127094-2018-0034](https://doi.org/10.1215/00127094-2018-0034).
- **Kedlaya, *Noetherian properties of Fargues–Fontaine curves*** (IMRN 2016): [doi:10.1093/imrn/rnv227](https://doi.org/10.1093/imrn/rnv227).
- **Kedlaya, *Some ring-theoretic properties of A_inf*** (Simons Symposia, 2020): [doi:10.1007/978-3-030-43844-9_4](https://doi.org/10.1007/978-3-030-43844-9_4).
- **Anschütz, *Extending torsors on the punctured Spec(A_inf)*** (Crelle 783, 2022): [doi:10.1515/crelle-2021-0077](https://doi.org/10.1515/crelle-2021-0077).
- **Lourenço, *The Riemannian Hebbarkeitssätze for pseudorigid spaces***: [arXiv:1711.06903](https://arxiv.org/abs/1711.06903).
- **Faltings, *Integral crystalline cohomology over very ramified valuation rings*** (JAMS 12, 1999): [doi:10.1090/S0894-0347-99-00273-8](https://doi.org/10.1090/S0894-0347-99-00273-8).

**Already covered.** The other main inputs are already in the atlas or queued as paper jobs:
- Scholze's *Étale cohomology of diamonds*;
- Kedlaya–Liu (PAPER-KEDLAYA-LIU-15);
- Fargues–Fontaine (PAPER-FARGUES-FONTAINE-18);
- Bhatt–Morrow–Scholze;
- Bhatt–Scholze (Witt vector affine Grassmannian);
- Zhu (PAPER-ZHU-17);
- Caraiani–Scholze (PAPER-CARAIANI-SCHOLZE-17);
- Scholze 2013 (PAPER-SCHOLZE-13).

## Corrections by the independent review

REV-PAPER-SCHOLZE-WEINSTEIN-20 (Claude Code, session `cc-fb70e5`, 29 September 2026) made these changes:

- **Route 5.** The reason no longer says the finiteness of mod-p cohomology is planned nowhere. The absolute case, Scholze's primitive comparison, is routed to PadicHodgeTheory P8 by accepted extractions (PAPER-ZAVYALOV-25 route 7, PAPER-BHATT-MORROW-SCHOLZE-18 route 14, PAPER-SCHOLZE-13 route 1). The route is still needed: only the relative version, Theorem 10.5.1, has no owner. The brief now imports P8 for the absolute case, as the Zavyalov candidate already does.
- **Route 4.** The brief names the prismatic Dieudonné Part II it imports by its id.
- **Mistakes.** All six source issues are confirmed.
