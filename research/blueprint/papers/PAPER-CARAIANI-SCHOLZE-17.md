# PAPER-CARAIANI-SCHOLZE-17: On the generic part of the cohomology of compact unitary Shimura varieties

Ana Caraiani and Peter Scholze, *On the generic part of the cohomology of compact unitary Shimura varieties*, [Annals of Mathematics (2) 186 (2017), no. 3, 649–766](https://doi.org/10.4007/annals.2017.186.3.1); arXiv [1511.02418](https://arxiv.org/abs/1511.02418).

Extraction by Claude Code, session `cc-39fac3`, 23 September 2026 (issue #1161). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-CARAIANI-SCHOLZE-17.result.json](PAPER-CARAIANI-SCHOLZE-17.result.json). It has:
- 124 items: 1 library, 50 planned, 73 missing;
- 6 routes: one new Part II and five sources of existing layers;
- 13 prerequisite entries;
- 13 recorded misprints.

## Sources read

- **The published version**, read in full. It is the Annals PDF (118 pages, pp. 649–766), which is free on the journal site. Item locators are journal pages.
- **arXiv:** 1511.02418 has only v1 (November 2015), from before refereeing. It was used to check the bibliography and to see which recorded misprints it already contains.
- **Errata:** the Annals page lists no erratum, and Crossref records no update.
- **Page images:** all thirteen misprints were checked on the page images.

## What the paper proves

**Main theorem (Theorem 1.1, precisely Theorem 6.3.1).**
- The setting is a compact unitary Shimura variety: Kottwitz's simple ones, or unitary groups quasi-split at every finite place.
- Take m a system of Hecke eigenvalues in H^i(S_K, F_ℓ). Then:
  - there is a Galois representation ρ_m with the expected Frobenius characteristic polynomials;
  - if ρ_m is unramified and *decomposed generic* above some prime p that splits in F, then H^i(S_K, F_ℓ)_m vanishes outside the middle degree.
- Decomposed generic means Frobenius eigenvalue ratios avoid 1 and q.
- So the Z_ℓ-cohomology localized at m is torsion-free and concentrated in the middle degree.

**The strategy: work at an auxiliary prime p ≠ ℓ through the Hodge–Tate period map π_HT : S_{K^p} → Fℓ_{G,µ}.**
- **§2** refines π_HT for Hodge-type data:
  - it lands in the flag variety of G;
  - automorphic vector bundles are pullbacks along it.
- **§3** stratifies Fℓ_{G,µ} by B(G, µ^{-1}):
  - a point modifies the trivial G-bundle on the Fargues–Fontaine curve at ∞, using the isomorphism of Fℓ_{G,µ} with a minuscule Schubert cell of the B_dR^+-Grassmannian;
  - the strata are locally closed, with the basic one open and the µ-ordinary one closed.
- **§4** identifies the fibres of π_HT over the b-stratum with perfect Igusa varieties (Theorem 4.4.4). It uses:
  - Rapoport–Zink spaces of PEL type at infinite level;
  - Chai–Oort's internal Hom p-divisible groups;
  - a product formula.
- **§5** computes the alternating Igusa cohomology with Shin's stable trace formula and base change. For b not µ-ordinary, generic principal series are killed by the Langlands–Jacquet map (Theorem 5.5.7).
- **§6** shows that the nearby cycles of Rπ_HT*F_ℓ are perverse (Proposition 6.1.3). So on a minimal nonzero stratum Igusa cohomology is concentrated in one degree (Corollary 6.1.4), and genericity forces that stratum to be µ-ordinary.

## What the atlas already has

The atlas's **IgusaVarietiesAndTorsionConcentration** roadmap implements this method for the *non-compact* sequel (Caraiani–Scholze 2024, issue #1075).
- It restricts its geometry to that paper's quasi-split U(n, n) datum.
- It already names this paper's §4 as a source.

**Planned (50 items).**
- Hodge-type period map: PerfectoidShimuraVarieties S1–S3; HodgeTateAndCanonicalSubgroups T1–T2; AutomorphicBundles B1–B2.
- Scholze's relative de Rham comparison: PadicHodgeTheory P8.
- B(G), κ, ν and Fargues' classification: BunGAndNewtonStrata BG0–BG2.
- The Fargues–Fontaine curve and bundles:
  - Tau Ceti adic-spaces Layer 6;
  - RelativeFarguesFontaine RF0–RF4;
  - VectorBundlesAndIsocrystals VB0–VB4.
- The B_dR^+-Grassmannian and Schubert cells: GeometricSatakeAndFusion GS0.
- Shin's Igusa trace formula, base change and inner-form transfer: EndoscopicTransferAndUnitaryTraceComparison ET.0–ET.7b.
- Galois representations: AutomorphicGaloisRepresentationsPartII AG2.
- Nearby cycles: LefschetzPencilsAndVanishingCycles LPV.6; ClassicalAdicEtaleCohomology H1.
- The PEL moduli: PELModuli M1–M2.

**Library (1 item).** Mathlib's `WittVector.Isocrystal` is Definition 3.1.1, and `WittVector.isocrystal_classification` covers the rank-one case of Dieudonné–Manin.

## Routes

1. **New Part II `IgusaVarietiesAndTorsionConcentrationPartIICompactUnitary`** (22 missing).
   - Title: "Igusa varieties, compactified period fibers and torsion concentration, Part II: compact unitary Shimura varieties". Parent: IgusaVarietiesAndTorsionConcentration. Area: `langlands`.
   - **Contents,** the compact endgame:
     - the unitary setup;
     - Shin's formula for inner forms of arbitrary signature (Corollary 5.2.5, Theorem 5.3.2);
     - the genericity obstruction (Lemmas 5.4.3, 5.5.1, 5.5.8; Corollary 5.5.2; Theorems 5.5.4, 5.5.7; Corollary 5.5.5);
     - Kottwitz's simple Shimura varieties (Proposition 5.6.1, Corollaries 5.6.2–5.6.3);
     - Lemma 6.2.2;
     - Theorem 6.3.1 and Theorem 1.1.
   - **Why a Part II:** the parent's layers assert nothing for compact data of arbitrary signature, and the compact theorem needs new layers in its direction.
2. **Source of IgusaVarietiesAndTorsionConcentration [IG.0, IG.1, IG.3, IG.4]** (35 missing). The general compact PEL (A)/(C) form of the parent's geometry:
   - Chai–Oort internal Hom;
   - Rapoport–Zink spaces of PEL type at infinite level, with the local period map to Fℓ^b;
   - Aut_G(X̃_b) and the dimension of Fℓ^b;
   - Igusa varieties, the product formula and Theorem 4.4.4;
   - equivariant sites, Proposition 6.1.3 and Corollary 6.1.4.

   Routing these here keeps one owner for the Igusa geometry.
3. **Source of BunGAndNewtonStrata [BG2, BG3]** (7 missing).
   - The Newton stratification of the flag variety (Definition 3.5.6, Proposition 3.5.7, Corollary 3.5.9 = Theorem 1.11).
   - Newton above Hodge for modifications and the Kottwitz invariant −µ♭ (Lemmas 3.5.4–3.5.5, Proposition 3.5.3).
   - Rapoport's Remark 3.5.8.
4. **Source of GeometricSatakeAndFusion [GS0:Schubert-smoothness]** (3 missing). For minuscule µ the Bialynicki-Birula map is an isomorphism Gr_{G,µ} ≅ Fℓ_{G,µ} (Theorem 3.4.5, Lemmas 3.4.4, 3.4.6).
5. **Source of PadicHodgeTheory [P8]** (2 missing). The relative Hodge–Tate filtration of a proper smooth family in every degree (Corollary 2.2.4, Proposition 2.2.5).
6. **Source of HodgeTateAndCanonicalSubgroups [T0, T2]** (4 missing). Scholze–Weinstein's theory:
   - universal covers of p-divisible groups;
   - the (T, W) classification over O_C, with the quasi-logarithm;
   - p-divisible groups over O_C/p as bundles with slopes in [0, 1].

## Source issues (`sourceIssues` E1–E13, all misprints)

None affects a stated result. E1–E3 and E5–E8 are already in arXiv v1; E10–E12 are in text added in revision.

- **E1** (proof of Lemma 2.3.5, p. 671): "Fl^std_{G,µ} ≃ G/P_µ" and "pullback from Fl_{G,µ}" should be G/P^std_µ and Fl^std_{G,µ}.
- **E2** (proof of Proposition 3.5.7, p. 690): "using Corollary 3.3.4" should be Theorem 3.3.4.
- **E3** (p. 692): D(G)[1/p] is an isocrystal "as defined in Section 4"; the definition is Definition 3.1.1.
- **E4** (p. 692): C has "ring of integers O_C/p"; it should be O_C.
- **E5** (Definition 4.2.1, p. 697): "O_{Ĕ_0}-algebra" should be O_Ĕ.
- **E6** (p. 702): "by Theorem 3.5.9" should be Corollary 3.5.9.
- **E7** (proof of Proposition 4.2.23, p. 713): "pick any rank 1 point y ∈ Fℓ_{G,µ}" should be y ∈ Fℓ^b_{G,µ}.
- **E8** (p. 732): ellipticity is printed as "(Z(Ĥ)^Γ)° ⊂ Z(G)"; it should be Z(Ĝ).
- **E9** (p. 736): "the Hecke character ψ" should be ϖ. v1's name survived the revision's renaming here.
- **E10** (Theorem 5.5.4, p. 744): r_i should take values in GL_{n_i}, not GL_n.
- **E11** (pp. 744–745): F_0 is never defined. A^×_{F_0} and Spl_{F_0/Q} should be A_K^× and Spl_{K/Q}.
- **E12** (p. 745 and Theorem 6.3.1, p. 757): the Hecke operators T_{i,v} at q are printed inside groups with factors Z_p^×, Q_p^×; they should be Z_q^×, Q_q^×.
- **E13** (References, p. 765): the entry [Sch15b] is a verbatim copy of [Sch15a] ("On torsion").
  - The citations [Sch15b, §2, Props 2.8, 2.9, 2.12, Cor. 2.5] in §6.1 are to Scholze's "On the p-adic cohomology of the Lubin–Tate tower" (Ann. Sci. ÉNS 2018).
  - arXiv v1 cites that paper there.

## Prerequisites not yet covered

Thirteen entries:
- Scholze, "On torsion" (Ann. of Math. 2015) and the Lubin–Tate tower paper (Ann. Sci. ÉNS 2018);
- Scholze–Weinstein (CJM 2013);
- Shin (Duke 2009, JIMJ 2010, Ann. of Math. 2011);
- Mantovan (Duke 2005);
- Kedlaya–Liu (Astérisque 371);
- Fargues (Compositio 2020);
- Hamacher (Duke 2015);
- Oort–Zink (Doc. Math. 2002);
- Caraiani (Duke 2012);
- Chenevier–Harris (CJM 2013).

Every DOI was checked against Crossref.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-CARAIANI-SCHOLZE-17.result.json` reports no errors.
- Every planned and route stage id exists in `data/atlas.json`, and the Part II parent is an atlas roadmap.
