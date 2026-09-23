# PAPER-GAN-SAVIN-23: Howe duality and dichotomy for exceptional theta correspondences

Wee Teck Gan and Gordan Savin, *Howe duality and dichotomy for exceptional theta correspondences*, [Inventiones Mathematicae 232 (2023), no. 1, 1–78](https://doi.org/10.1007/s00222-022-01165-2); arXiv [2102.00372](https://arxiv.org/abs/2102.00372) (v1).

Extraction by Claude Code, session `cc-d67081`, 22 September 2026 (issue #1250). Status: **complete**. Every missing item is routed exactly once. The machine-readable extraction is [PAPER-GAN-SAVIN-23.result.json](PAPER-GAN-SAVIN-23.result.json):

- 87 items: 1 in the libraries, 2 planned, 84 missing;
- 4 routes: one new roadmap and three source routes;
- 28 prerequisite entries;
- 22 source issues.

**Source.** arXiv v1 (31 January 2021, 56 pages, SHA-256 `8b3b6702…08c6e5`) was read in full on 2026-09-22, and the misprints were checked on page images. It is the only arXiv version.

- **The published version is closed access** (confirmed on the Springer page, in OpenAlex and in Semantic Scholar) and was not read. Its abstract is identical to v1's. It was received in September 2021, seven months after v1, and accepted a year later, so it may differ: it runs to 78 journal pages, and the 2023 sequel cites "[GS, §3.5]" for the discussion of L-packets that is §3.4 in v1. **All locators are to arXiv v1.**
- **The sequel**, Gan–Savin, *The local Langlands conjecture for G_2* (Forum of Mathematics Pi 11 (2023), open access; arXiv:2209.07346v2), was read where it summarizes this paper, and searched for corrections. It records none.

The cited inputs were not read; each item that rests on one says so.

## What the paper proves

**The setting.** Over a p-adic field F, the three exceptional dual pairs

- PD^× × G_2 ⊂ E_6^D (D a cubic division algebra),
- (PGL_3 ⋊ Z/2Z) × G_2 ⊂ E_6 ⋊ Z/2Z,
- G_2 × PGSp_6 ⊂ E_7,

all have G_2 as one member, and the centralizer of G_2 is Aut(J) for a Freudenthal–Jordan algebra J of rank 3. Restricting the minimal representation of the exceptional group gives a theta correspondence, with big theta lifts Θ(π) and their cosocles θ(π).

**The results.**

- **Theorem 1.1 (dichotomy).** Every π ∈ Irr(G_2) has nonzero theta lift to exactly one of PD^× and PGSp_6.
- **Theorem 1.2 (Howe duality).** Θ(π) has finite length, θ(π) is irreducible or zero, and the three correspondences are injective on the representations that participate. If p ≠ 3, every representation of PD^× participates.
- **Theorem 1.3.** The correspondences preserve temperedness; every discrete series representation of G_2 lifts to a discrete series representation of exactly one of the three groups; they are functorial on non-tempered representations.
- The lifts of all non-supercuspidal representations are computed (Theorems 8.2, 8.5, 14.1, 15.1–15.3, Proposition 15.6, Corollary 15.7).

**The method: ping-pong with periods.** There is no doubling see-saw for exceptional pairs. Instead:

1. **A see-saw.** G_2 ⊂ Spin_8^E and H_{J,E} = Aut(i : E → J) ⊂ H_J = Aut(J), for a cubic étale algebra E, give Hom_{H_{J,E}}(Θ(π), C) ≅ Hom_{G_2}(R_J(E), π), where R_J(E) sits inside a degenerate principal series I_E(s) of Spin_8^E.
2. **Mackey theory.** The restriction of I_E(s) to G_2 has a five-step filtration whose bottom piece is ind_N^{G_2} ψ̄_E; the other pieces are killed by an exponent argument, so Hom_{G_2}(I_E(1/2), π) is the degenerate Fourier coefficient of π.
3. **A cycle of periods.** These identifications close a chain
   ψ_E-coefficient of π ⊆ ψ_E-coefficient of Θ(τ) ≅ H_{J,E}-period of τ ⊆ H_{J,E}-period of Θ(π^∨) ≅ Hom(R_J(E), π^∨),
   and the ends have the same dimension. Finite-dimensionality turns the chain into equalities, which gives both the dichotomy and multiplicity one (§6). The same game with Whittaker and Shalika periods settles the generic case for PGSp_6 (§§11–12).
4. **Jacquet modules.** The non-tempered and noncuspidal parts are handled by explicit filtrations of the Jacquet modules of the minimal representations (§§13–14).

## What the libraries and the atlas already have

**The libraries.** Tau Ceti has the split octonions at the pinned commit f790474 — `TauCeti.Octonion` as Zorn vector matrices, with conjugation, trace, the multiplicative norm, the alternative and Moufang laws, and the 7-dimensional imaginary part — the one library item. It also has the split Albert algebra H_3(O), which this paper does not use, and some derivation lemmas. Mathlib names `LieAlgebra.g₂` as a Serre-construction quotient with no structure theorems.

**The atlas plans a little.**

- Smooth representation theory: induction and Jacquet functors (SR.2), second adjointness (SR.2a), the Bernstein decomposition and temperedness criteria (SR.3).
- The local Langlands correspondence for GL_n (ET.6).
- Tau Ceti's roadmaps plan the split octonions and Der(O) ≅ g_2 over a characteristic-0 field, explicit E_6 and E_7 (LieHighestWeight, Layer 8), triality for Spin_8 (SpinRepresentations, Layer 8) and the split Chevalley groups (Reductive algebraic groups, Layer 9).

**Nothing plans the subject.** There is no layer for minimal representations, exceptional dual pairs, the group G_2 = Aut(O) over a p-adic field, or the representation theory of p-adic G_2, PGSp_6 or PD^×. Searches for "minimal representation", "GSp_4", "Tadić", "degenerate Whittaker" and "wave-front" return nothing.

## Routes

**1. A new roadmap: `ExceptionalThetaCorrespondencesForG2` (78 items).** Title: "Exceptional theta correspondences for G_2: minimal representations, Howe duality and theta dichotomy"; area `representations`.

The brief sets out ten layers: octonions and G_2; the representation theory of p-adic G_2 (Muić, and degenerate Whittaker models); Freudenthal–Jordan algebras, g_J and the dual pairs; minimal representations and their Jacquet modules; the degenerate principal series of Spin_8^E; the dichotomy; each of the three correspondences in turn; the representations of PGSp_6 and the periods of §11; and Howe duality for G_2 × PGSp_6.

It is a new roadmap rather than a Part II because none of the three nearest roadmaps goes in this direction:

- MetaplecticAutomorphicForms builds Weil representations and classical theta modules, not minimal representations of exceptional groups;
- SmoothRepresentationsOfLocalGroups is the general theory, and classifies no group's representations;
- Tau Ceti's LieHighestWeight, Layer 8, builds the exceptional Lie algebras over a characteristic-0 field, and is a Tau Ceti roadmap, extended only by a Part II.

The brief imports all three, and asks that the roadmap be designed so that the queued PAPER-GAN-SAVIN-23-B (the local Langlands correspondence for G_2, which builds on this paper) can extend it.

**2. Source of MP.3 (4 items).** The classical theta inputs: the Weil representations of S̃L_2 and their lifts to O_3; Howe duality for classical and similitude pairs; the similitude correspondence for GL_2 × GSO_4 (Lemma 13.2, proved here); the minimal representation of SO_2n as a theta lift from SL_2. PAPER-GAN-ICHINO-18 routed classical Howe duality to MP.3 as well.

**3. Source of SR.3 (1 item).** Two facts used without reference: for groups with compact centre, cuspidal parts of smooth representations are semisimple; and discrete series are projective in the tempered category.

**4. Source of ML.4 (1 item).** The local Langlands correspondence for GSp_4 (Gan–Takeda), used for the reducibility points of P_1.

## Source issues (`sourceIssues` E1–E22)

All are recorded against arXiv v1, since the published version could not be read.

**Fifteen misprints.** Wrong index or name (E1, E2, E14, E15, E16, E17), a wrong induced representation in Muić's Proposition 3.1(iii) (E3), τ for the involution ι (E4), Spin_4^E for Spin_8^E in the see-saw diagram (E5), a repeated part label (E6), wrong cross-references (E7, E11, E18), "nondegenerate" for "degenerate" (E8), and the volume of Gan–Gurevich in the bibliography, 170 for 128 (E19). E3, E5, E9 and E17 were checked on page images.

**One error (E9).** In §9 the "Weyl-invariant quadratic form" q = s_1² + s_2² + s_3³ − ¼(s_1+s_2+s_3)² is written for the character coordinates (s_1, s_2, s_3) whose Weyl action the paper has just given. It is not invariant there: for the stated reflection r_3(s) = (s_1+s_2+s_3, −s_3, −s_2), q(r_3s) − q(s) = (5/4)((s_1+s_2+s_3)² − s_1²). The invariant form on characters is s_1² + s_2² + s_3² + (s_1+s_2+s_3)², with simple roots (0,1,−1), (1,−1,0), (−1,1,1). The printed form, with s_3² for s_3³, is the invariant form on the dual space of cocharacters, where the printed roots (0,1,−1), (1,−1,0), (0,2,2) are the images of the simple roots. Everything was checked in exact arithmetic. Nothing later uses q, and the positive-chamber criterion that follows is correct.

**Six gaps.** Steps asserted without proof:

- **E20. Proposition 5.4**, the Mackey filtration of I_E(s) restricted to G_2, called "a key technical result" and stated with no proof. It carries Proposition 5.5, Lemma 6.4 and the dichotomy theorem.
- **E10. Π_{N_2,ψ_2}** (§11.4), stated with neither proof nor reference. It carries Proposition 11.7, Lemma 12.1 and Theorem 12.4.
- **E21. Lemmas 8.1 and 8.3**, "basic computations" and "a standard computation", with no proof. They carry Theorem 8.5 and Proposition 8.4.
- **E13. Proposition 13.6**, the Jacquet module along P_1, stated by analogy with Savin–Woodbury: "this case is not in the literature; however, it is similar to".
- **E12.** The cases of Lemma 13.8 for P_123, P_13, P_1 and P_3, and the non-top pieces in §14.3, both "left to the reader".
- **E22. Theorems 15.2 and 15.3**, the explicit lifts, asserted after a list of the four facts used.

Since the published version is 22 journal pages longer than v1 and was refereed for a year, some of these may have been written out there; that could not be checked.

## Prerequisites not yet covered

**Minimal representations and the dual pairs:** Gan–Savin 2005 (definitions and properties), Magaard–Savin, Gross–Savin, Gan–Savin 1999 and 2004, Savin 1999, Savin–Weissman, Savin–Woodbury, Gan–Savin's twisted Bhargava cubes, Knus–Merkurjev–Rost–Tignol, and Gan–Savin's triality Spin_8 paper (the published form of the 2015 preprint behind Proposition 5.2).

**Representations of the groups involved:** Muić (G_2), Tadić (Sp_6), Gan–Takeda (GSp_4), Shahidi (reducibility from L-functions), Gan–Gurevich (S̃L_2 × G_2), Prasad (GL_3 restricted to GL_2), Meyer (the tempered category), and Lonka–Tandon on torus-fixed vectors in PD^×, for which no DOI or arXiv record was found.

**Degenerate Whittaker models and wave-front sets:** Mœglin–Waldspurger, Varma, Huang–Magaard–Savin, Loke–Savin.

**Classical theta:** Mœglin–Vignéras–Waldspurger, Kudla, Roberts, Yamana.

**Context:** Gan's exceptional Howe correspondences over finite fields, and Harris–Khare–Thorne.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-GAN-SAVIN-23.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the three files: 3 files, 0 problems.
- Every library declaration cited was read at the pinned commits: Mathlib 082e2d3 and Tau Ceti f790474.
- Every prerequisite DOI was resolved on Crossref; the Tadić link was checked on Numdam.
- The quadratic form of E9 and the Cartan matrix of the corrected roots were verified in exact arithmetic; the Dynkin and dimension counts of §4.1 were checked by hand.

## Review (REV-PAPER-GAN-SAVIN-23, 23 September 2026)

The review, by Claude Code (session cc-39fac3), accepted the extraction and its four routes, including the new roadmap, after corrections made in place. The full record is `research/blueprint/reviews/REV-PAPER-GAN-SAVIN-23.md`. The published version is closed access, so arXiv v1 remains the source.

- **Statements and locators:** 29 statements and 6 locators corrected.
- **Repairs:** both of the extraction's repairs are sound.
- **New items:** 20 (1 planned, 19 missing). The new roadmap's brief has a corrections paragraph that turns the unproved steps into layer obligations.
- **Source issues:** E1–E22 are confirmed, and the reach of the unproved steps E10, E12, E13 and E20–E22 is sharpened. E23–E52 are new:
  - Proposition 10.4 is applied to a non-generic τ that Shahidi's method does not cover (E42);
  - the genericity clause of Theorems 8.2(i)/8.5(iii) fails for nontempered generic τ (E30);
  - §8.1 omits the trivial representation (E29);
  - the quotients in Propositions 3.1(iii)/3.2(iii) are J_Q(1, ·);
  - the rest are smaller gaps, errors and 19 misprints.
