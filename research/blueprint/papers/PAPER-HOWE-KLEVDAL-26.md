# PAPER-HOWE-KLEVDAL-26: extraction and routing

Issue #1195. Claude Code, session cc-442dc5. The extraction is complete. Implementation and proof closure are not claimed.

Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, Invent. Math. 244 (2026), no. 2, 455–530 (doi 10.1007/s00222-025-01400-6; arXiv 2308.11064).

The result has **180 items**:

- 2 library items: Tau Ceti's Tannakian reconstruction of an affine group, and Mathlib's Baire category theorem;
- 21 planned items: the reductive and foundational inputs, which the atlas plans in its p-adic geometry roadmaps;
- 157 missing items, routed as follows:
  - 139 to **one new roadmap**, *Admissible pairs, p-adic Hodge structures and the bi-analytic Ax–Lindemann theorem* (`AdmissiblePairsAndPadicHodgeStructures`, area `padic`);
  - 4 to a **Part II of the Tau Ceti roadmap Reductive algebraic groups**;
  - 7 to a **Part II of AdicSpacesPartII**;
  - 7 as **sources** of existing layers: D6, P8, BG1, HS2 and LD.6.

Fourteen mistakes are recorded under `sourceIssues`: twelve misprints, one gap, and v1's incorrect Lemma 4.1.1, which v2 already corrects.

## What the paper proves

Part I built two categories over an algebraically closed C/Q_p:

- **admissible pairs:** isocrystals with a B_dR^+-lattice whose modified bundle on the Fargues–Fontaine curve is semistable of slope 0;
- **p-adic Hodge structures.**

Basic admissible pairs and p-adic Hodge structures are equivalent Tannakian categories, and Part I proved a transcendence characterization of CM points.

Part II studies **moduli**. Let G/Q_p be any connected linear algebraic group, possibly non-reductive, and b ∈ G(Q̆_p).

1. **Relative lattices and filtrations.** Over a diamond, a bilatticed G(B_dR)-local system is good of type [μ] exactly when either trace filtration is a filtered G(O)-local system (Theorem 3.2.1). On a smooth rigid variety, Scholze's functor M identifies Griffiths-transversal filtered flat bundles with the latticed B_dR^+-local systems of constant type (Theorem 3.3.1).
2. **Non-reductive foundations.**
   - The basic strata of Bun_G are classifying stacks [∗/G_b(Q_p)], pulled back from the Levi quotient (Theorem 4.2.2).
   - The B_dR^+-affine Grassmannian is separated, partially proper and ind-(locally spatial) (Theorem 5.0.4). Schubert cells are cut out inside the preimage of the Levi cell by a specialization condition (Proposition 5.2.1).
   - Maps from seminormal rigid varieties see only the Schubert cell, and are exactly the Griffiths-transversal filtrations.
   - BB is an isomorphism exactly when the weights on Lie G are at most 1.
   - For G = G_a the Grassmannian is enormous but has only one rigid point (Example 5.0.5).
3. **Moduli.**
   - X_[μ] is the moduli of p-adic Hodge structures (Section 6). Gr_[μ]^{b-adm} is the moduli of b-rigidified neutral admissible pairs, which form a neutral Tannakian category (Theorem 7.1.2).
   - The admissible loci are open, non-empty exactly when [b] ∈ B(G, [μ^{-1}]), and geometrically connected (Propositions 7.3.3 and 7.3.4).
   - Neutral G-admissible pairs on geometrically connected rigid varieties have a type (Theorem 7.2.3).
4. **Hodge and Hodge–Tate loci of tensors** are closed, and Zariski closed on rigid bases. Hence the special subdiamonds Gr_H^{b_H-adm} are closed even for non-reductive H (Proposition 7.5.2), although Gr_H → Gr_G need not be closed (Remark 7.5.3, Example 7.5.10).
5. **Infinite level.**
   - M_b is the moduli of modifications E_b ⇢ E_triv, with étale and de Rham lattice period maps, which are torsors.
   - It has three notions of special subvariety: Hodge, Hodge–Tate and special. They differ for non-reductive H (Example 8.4.4).
   - Basic duality M_b ≅ M_{b^{-1}} exchanges everything (Theorem 8.5.1).
6. **The bi-analytic Ax–Lindemann theorem (Theorem 9.1.3; Theorem A in the minuscule case).** Let b be basic. The Hodge–Tate analytic Zariski closure of an irreducible Hodge analytic set is a Hodge–Tate special subvariety, and symmetrically. So the closed bi-analytic sets are exactly the special subvarieties. Theorem B is the "sideways" version for any neutral admissible pair over a rigid variety: the Hodge–Tate image is Zariski dense.
   - The proof reduces to the motivic Galois group.
   - It finds Hodge-generic classical points by a Baire-category argument (Proposition 9.3.4, Lemmas 9.3.5 and 9.3.1).
   - It uses Part I's openness of Galois images to make the Hodge–Tate differential surjective, which forces the weights to be at least −1.
7. **Section 10.**
   - It defines variations of p-adic Hodge structure and the crystalline cover S̃^cris of a de Rham torsor.
   - It shows by the Katz–Igusa tower that S̃^cris need not be rigid.
   - It deduces bi-analytic Ax–Lindemann theorems on basic loci of Hodge-type Shimura varieties (granting their uniformization) and on products of Shimura curves, and compares the latter with Chambert-Loir–Loeser's bi-algebraic theorem.

## Sources inspected

- **[arXiv 2308.11064v2](https://arxiv.org/abs/2308.11064v2)** (28 February 2025), read in full as PDF (68 pages, SHA-256 `c133b06b…ab8a`) together with its TeX source (SHA-256 `c62b5f52…b17a`). **Locators give v2 numbering and pages.**
  - v2's comment: "minor corrections and expanded proofs", a new Section 10, and a rewritten Section 4 "to remove an incorrect statement (Lemma 4.1.1 of v1); the main results are unaffected".
  - v1's Lemma 4.1.1 was also read (arXiv v1 PDF, SHA-256 `62b77e53…40bb`). v2 replaces it with Theorem 4.2.2, which proves the Levi comparison only on basic strata. See E14.
- **The published article could not be read.**
  - Springer's page and the authors' view-only link (https://rdcu.be/eVqUN) both answer automated access with a bot challenge.
  - Crossref gives received 13 September 2023, accepted 14 December 2025, online 19 December 2025, with no correction relation.
  - The first author's homepage (https://seanpkh.github.io/) says the published theorem numbering differs from arXiv "due to journal conventions" and that arXiv will be updated. A reviewer with journal access may add published locators.
- **Part I (arXiv 2308.11065v2 TeX source, SHA-256 `c9c3bd64…8475`)** was read for the statements Part II cites. Part II's TeX includes Part I's label file, so the Part I numbers in the items are the ones Part II's cross-references resolve to.

All sources were accessed on 22–23 September 2026.

## Mistakes found (`sourceIssues`)

**Misprints (E1–E12), each with reach "nothing":**

- **E1 (p. 5).** "V ∩ C" should be V ∩ U in the definition of the rigid Zariski topology.
- **E2 (proof of Lemma 3.1.2, p. 22).** "ξ^i L_2 ∩ t L_1" should be ξ^i L_2 ∩ ξ L_1.
- **E3 (Section 3.2, p. 22).** "Bilatticed G(O)-local system" should be G(B_dR).
- **E4 (Section 3.2 and Theorem 3.2.1, p. 22).** "Spd(L[ν])" and "Spd(L[μ])" should be L([ν]) and L([μ]).
- **E5 and E6 (Definitions 7.1.1 and 7.2.1).** Geometric points map to "X" and "S"; both should be Y.
- **E7 (Proposition 7.3.3).** The rigid analytic point is claimed for Gr_[μ], which trivially has one. The proof and its use in Remark 6.2.2 concern the admissible locus Gr_[μ]^{b-adm}.
- **E8 (p. 52).** "g ∈ Q̆_p" should be g ∈ G(Q̆_p).
- **E9 (p. 52) and E10 (Remark 6.2.2).** "Q_p([μ_H])" and "Q_p([μ])" should be Q̆_p([μ_H]) and Q̆_p([μ]).
- **E11 (proof of Theorem 9.1.3, p. 57).** "K'_b = H(Q_p) × 𝔍 ∩ K_b" should be K'_b = H_{b_H}(Q_p) × 𝔍 ∩ K_b. The second tower of M_{b_H,[μ_H]} is indexed by compact opens of H_{b_H}(Q_p), not H(Q_p).
- **E12 (Section 10.1).** "L ⊗ B_dR^+", with L the p-adic field, should be 𝕃 ⊗ B_dR^+. This is visible in the TeX source.

**A gap (E13, reach "the proof"):**

- **What is missing.** Theorem 7.2.3 is stated for geometrically connected seminormal rigid varieties. Its proof applies Scholze's de Rham local systems and Liu–Zhu's rigidity, both of which are results about smooth varieties.
- **The repair uses tools the paper already has.** Run the argument on a resolution, as in the proof of Theorem 5.0.4(4). The type is then constant on each irreducible component, and connectedness makes it constant.
- **Why it matters.** The theorem is applied to singular bases in Lemma 7.5.1(2) and Theorem B.

**An error in v1, already corrected in v2 (E14, reach "a stated result"):**

- **What v1 claimed.** Lemma 4.1.1 of v1 says every G-bundle is pro-étale locally isomorphic to the push-out of its Levi part, and v1 deduces from it that B(G) ≅ Bun_G(C)/≅ for all G.
- **Why it is false.** For the Borel of GL_2, the non-split extension O(1/2) of O(1) by O has Levi part O ⊕ O(1). The lifting torsor has H^1 of O(−1), which Fargues–Scholze II.2.5(ii) does not kill.
- **The correction.** v2 removes the lemma (its arXiv comment says so). Theorem 4.2.2 proves the comparison only on basic strata, which is all the paper uses.

**Checked and found correct:**

- the lattice computations of Examples 3.1.1 and 7.5.10: both bases, the type {1, −1} versus {0, 0}, and the (t, 1, t^{-1}) cell;
- the weights (0, 0, 0, 1, 1, −2) in Example 8.4.4, and the Kottwitz condition 1 + 1 − 2 = 0 there;
- the reduction of Proposition 7.3.4 to U(B_dR^+/Fil^m);
- the Chevalley and Baire arguments of Proposition 9.3.4 and Lemma 9.3.5;
- the Čerednik–Drinfeld conventions of Section 10.2 (D split at ∞ and ramified at p; B definite and split at p).

**Noted but not recorded:** the finite stratification in the proof of Theorem 9.1.3 needs Y to be quasi-compact. It suffices to work near the compact orbit K_0·y, and Baire would also handle countably many strata.

## What the atlas and the libraries already have

**Libraries.**

- Tau Ceti has Tannakian reconstruction of an affine group from its comodules: `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` and `TauCeti.Tannaka.fgPointTensorIsoEquiv` (item 015).
- Mathlib has the Baire category theorem: `BaireSpace.of_completelyPseudoMetrizable` and `nonempty_interior_of_iUnion_of_closed` (item 164).
- Tau Ceti's dynamic parabolic subgroups (`TauCeti.Cocharacter`) and Huber rings are related but give no item.
- Nothing else in the paper is in either library.

**The atlas plans the reductive and foundational inputs (21 items):**

- **Diamonds:** DiamondsAndVStacks D1, D2, D4–D6 (items 023–025).
- **Period sheaves and descent:** B_dR^+ at RelativeFarguesFontaine RF2:untilts (032); descent of B_dR^+-modules at GS0:loop-geometry (033); OB_dR at PadicHodgeTheory P8:local-rational (038).
- **Isocrystals and bundles:** VectorBundlesAndIsocrystals VB0, VB1, VB2:ampleness and VB4, including slope-zero bundles as local systems (068, 076, 111).
- **Modifications:** RF4 (079).
- **Schubert geometry and smoothness:** the Bruhat order, Schubert cells and their smoothness at GeometricSatakeAndFusion GS0 (092, 122); cohomological smoothness and Künneth at DiamondSixOperations S2–S4 (124).
- **Liu–Zhu rigidity:** HodgeTateAndCanonicalSubgroups T6:comparison, which says it owns the Diao–Lan–Liu–Zhu rigidity statements (114).
- **Algebraic groups and topology:** Tannakian reconstruction at MotivesAndAlgebraicCycles MC.6 (016); tori at BunGAndNewtonStrata BG1 (137); Matsushima at Tau Ceti ReductiveGroups Layer 3 (021); topologies on rational points at ReductiveGroupsPartII RG2.0 (022).
- **Rigid geometry:** Zariski closed sets and proper images at AdicSpacesPartII R3 (030).
- **Section 10 examples:** Čerednik–Drinfeld uniformization at HilbertModularVarietiesAndShimuraCurves R18.5 (170); perfectoid towers and Hodge–Tate maps at ET.6a and PerfectoidShimuraVarieties S2–S3 (172).

**The atlas has none of the paper's own theory:**

- admissible pairs or p-adic Hodge structures as Tannakian categories, over a point (Part I) or in families;
- local Shimura varieties or Bun_G strata for non-reductive groups;
- the B_dR^+-Grassmannian of a non-reductive group;
- Hodge or Hodge–Tate loci, or special subvarieties of local Shimura varieties;
- p-adic functional transcendence.

Kottwitz's set B(G, μ), admissible loci, Scholze's functor M, and seminormal full faithfulness of diamondification are not planned either. Nor are Chevalley's stabilizer theorem, observable subgroups, Mostow's Levi decomposition, or rigid-analytic resolution, irreducible components and weakly Shilov points.

## Routes

1. **New roadmap: "Admissible pairs, p-adic Hodge structures and the bi-analytic Ax–Lindemann theorem"** (139 items).
   - **Final theorems:** Theorem 9.1.3, Theorems A and B, and the exported Theorems 3.2.1, 3.3.1, 4.2.2, 5.0.4, 7.1.2, 7.2.3 and 8.5.1.
   - **Part I first.** Part I (items 001–014) is covered first as the foundation, like Pan's first paper in DESIGN-PAN.
   - **Layers, in the paper's order:** relative lattices, non-reductive G-bundles and Grassmannians, p-adic Hodge structures, admissible pairs, infinite level, Ax–Lindemann, and applications.
   - **Tests:** G_a, tori, the Borel of GL_2, GL_3 and GL_4 parabolics, the mirabolic of Res GL_2, Lubin–Tate special points, and the Serre–Tate counterexample.
   - **Why new.** HeckeStacksAndLocalShtukas HS2 plans local shtuka moduli of reductive groups, aimed at Fargues–Scholze cohomology. PadicHodgeTheory plans period rings, Galois representations and comparison. LogicAndDefinabilityInNumberTheory (and the pending Mok–Pila–Tsimerman Part II) plans complex, o-minimal functional transcendence. None goes towards a Tannakian theory of admissible pairs with special subvarieties and p-adic Ax–Lindemann, and a Part II of any of them would mix directions.
2. **Part II of the Tau Ceti Reductive algebraic groups: "stabilizers of lines, observable subgroups and Levi decompositions"** (4 items, 017–020).
   - **Contents:** Mostow's Levi decomposition; Z(G) = ker Ad; Chevalley's theorem with Borel's countable family; and observable subgroups with quasi-affine quotients, with G embedded as an observable subgroup of GL_n × G_m.
   - **Why a Part II.** The Tau Ceti roadmap stops at parabolic Levi decompositions, fppf quotients and Matsushima. These facts are general, so they go to their owner, and a Tau Ceti roadmap is extended by a Part II.
3. **Part II of AdicSpacesPartII: "rigid-analytic Zariski geometry, classical points and resolution"** (7 items: 028 and 174–179).
   - **Contents:** classical points; Conrad's nowhere-density lemma; Bhatt–Hansen's weakly Shilov points; Temkin's resolution of rigid varieties; stratification by smooth subvarieties; the p-adic constant rank theorem; and Gauss points of discs.
   - **Why a Part II.** AdicSpacesPartII stops at coherent sheaves (R3), and AlgebraicModuliForArithmeticGeometry R09.7 restricts resolution to varieties.
4. **Source routes to existing layers:**
   - **DiamondsAndVStacks D6** (item 026): Scholze–Weinstein Proposition 10.2.3, full faithfulness on seminormal rigid varieties. D6 says explicitly that it does not prove full faithfulness in general.
   - **PadicHodgeTheory P8** (039–040): Scholze's functor M and de Rham local systems (§§7–8 of the paper whose §6 P8 already uses), and the comparison of B_dR^+-local systems on the pro-étale site and on the diamond.
   - **BunGAndNewtonStrata BG1** (180): Kottwitz's B(G, μ) and its basic element, next to the Kottwitz and Newton maps BG1 constructs.
   - **HeckeStacksAndLocalShtukas HS2** (119, 121): for reductive G, the non-emptiness criterion (Caraiani–Scholze Proposition 3.5.3, Rapoport–Viehmann Proposition 3.1) and the connectedness of admissible loci (Gleason–Lourenço), as basic properties of local shtuka moduli.
   - **LogicAndDefinabilityInNumberTheory LD.6** (049): Klingler–Ullmo–Yafaev's hyperbolic Ax–Lindemann theorem, quoted for comparison. LD.6 names Ax–Lindemann among its functional-transcendence inputs.

## Judgement calls for the reviewer

- **Non-reductive Bun_G and Grassmannians stay in the new roadmap** (items 069–093) rather than going to Part IIs of BunGAndNewtonStrata and GeometricSatakeAndFusion. This programme is their only consumer, and they are proved from the reductive owners along the Levi decomposition, which the brief imports. A reviewer applying §15 strictly may split them off.
- **Part I is covered by the new roadmap rather than a separate one.** Part I is not in `papers.json`, and it is listed as the first prerequisite.
- **Liu–Zhu rigidity is marked `planned` at T6:comparison.** T6 claims the Diao–Lan–Liu–Zhu rigidity statements, and the Liu–Zhu extraction routes the same theorem there. If a reviewer reads T6 as covering only the logarithmic setting, it should be a source route to P8 instead.
- **Klingler–Ullmo–Yafaev (item 049)** is a comparison theorem, not used in the proofs. It is routed to LD.6. If the Mok–Pila–Tsimerman extraction's proposed Part II is accepted, it should move there.
- **Section 10's Hodge-type application (item 169)** is recorded with its hypothesis: the uniformization of basic loci from Daniels–van Hoften–Kim–Zhang, which the atlas does not plan and which is listed as a prerequisite.
- **Two small Part IIs** (4 and 7 items) are proposed rather than folding general facts about algebraic groups and rigid geometry into the p-adic roadmap.

## Prerequisites not yet covered by the atlas

These are listed in the result with links:

- **By the authors:**
  - Howe–Klevdal Part I (Algebra Number Theory 20 (2026); arXiv:2308.11065);
  - Part III (arXiv:2603.22610).
- **Local Shimura varieties and period domains:**
  - Rapoport–Viehmann (Münster J. Math. 2014);
  - Gleason–Lourenço (arXiv:2210.08625).
- **Diamonds and six functors:**
  - Mann–Werner (IMRN 2023);
  - Hansen (Tunis. J. Math. 2021).
- **Rigid geometry:**
  - Temkin (Duke 2012);
  - Bhatt–Hansen (Compositio 2022);
  - Conrad (Ann. Inst. Fourier 1999).
- **Algebraic groups:** Thắng–Bắc on observable groups (Illinois J. Math. 2005).
- **Bi-algebraic geometry and functional transcendence:**
  - Klingler–Ullmo–Yafaev (Publ. IHÉS 2016, and the 2018 survey);
  - Chambert-Loir–Loeser (ANT 2017);
  - Bakker–Tsimerman (Invent. Math. 2019).
- **Uniformization:** Daniels–van Hoften–Kim–Zhang (arXiv:2408.01348).
