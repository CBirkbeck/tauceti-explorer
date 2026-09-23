# PAPER-ALLEN-ETAL-23: Potential automorphy over CM fields

Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne, *Potential automorphy over CM fields*, [Annals of Mathematics (2) 197 (2023), no. 3, 897–1113](https://doi.org/10.4007/annals.2023.197.3.2); arXiv [1812.09999](https://arxiv.org/abs/1812.09999).

Extraction by Claude Code, session `cc-39fac3`, 23 September 2026 (issue #1093). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-ALLEN-ETAL-23.result.json](PAPER-ALLEN-ETAL-23.result.json). It has:
- 330 items: 1 library, 251 planned, 78 missing;
- 13 routes: one Part II and twelve sources of existing layers;
- 16 prerequisite entries;
- 108 recorded mistakes (87 misprints, 13 gaps, 8 errors).

## Sources read

- **The published version**, read in full. It is the Annals PDF that Frank Calegari posts on his page (217 pp., pp. 897–1113). Item locators, statement numbers and page numbers are the published ones.
- **arXiv v2** (16 June 2022, the accepted version). Its TeX was read alongside for exact formulas.
  - Its content matches print up to copy-editing, but the **numbering does not**. From §2.2 on, print numbers statements and displays in one counter: v2 Lemma 2.2.3 is published Lemma 2.2.4, and v2 Lemma 6.2.25 is published 6.2.26.
  - Several atlas extractions cite ACC+ by v2 numbers: PAPER-CALEGARI-GERAGHTY-18 and PAPER-BOXER-CALEGARI-GEE-ETAL-25 write "Lemma 6.2.25" for the published 6.2.26.
- **Errata:** the Annals page lists no erratum, and Crossref records no update or correction.
- **Method:** the reading was split into seven section blocks. Each block has a coverage table that maps every numbered statement and numbered paragraph to an item.
- **Page images:** every recorded mistake was checked on the published page images.

## What the paper proves

**Automorphy lifting theorems (§6.1).** These are the first unconditional automorphy lifting theorems for n-dimensional Galois representations of a CM (or totally real) field F with no self-duality condition. In both, ρ̄ is absolutely irreducible and decomposed generic, ρ̄(G_{F(ζ_p)}) is enormous, some σ ∉ G_{F(ζ_p)} has ρ̄(σ) scalar, and ρ̄ ≅ r̄_ι(π) for a cuspidal π of the matching type.
- **Theorem 6.1.1 (Fontaine–Laffaille case):** ρ is crystalline with p unramified in F and p > n², and π has weights in the Fontaine–Laffaille range.
- **Theorem 6.1.2 (ordinary case):** ρ is ordinary with regular weights, p > n, and π is ι-ordinary.

**Applications (§7).**
- Theorem 7.1.11: rank-2 compatible systems with Hodge–Tate numbers {0, 1}, and their symmetric powers, are potentially automorphic.
- Theorem 1.0.1: elliptic curves over CM fields are potentially modular and satisfy Sato–Tate.
- Theorem 1.0.2 (= Corollary 7.1.15): the Ramanujan conjecture holds for weight-0 cuspidal representations of GL_2 over CM fields.

**The route.** The input is Scholze's torsion theorem: its Galois representations ρ_𝔪 valued in Hecke algebras of the cohomology of X_K. The paper proves the local–global compatibility these need at every place.
- **§2** sets up the machinery on the quasi-split unitary group U(n, n) and its Siegel parabolic:
  - Hecke algebras on complexes;
  - Hecke operators at split places, including pro-ℓ-Iwahori and parahoric level (§2.2.5);
  - duality and twisting;
  - the boundary cohomology, whose GL_n part is a direct summand after localizing (Theorems 2.4.2 and 2.4.8).
- **§3, ℓ ≠ p:** P_{v,σ}(X) is the ramified Hecke polynomial at v. Up to a nilpotent ideal, the characteristic polynomial of σ ∈ W_{F_v} under ρ_𝔪 is P_{v,σ}(X) (Theorem 3.1.1). The proof passes to the boundary of the unitary Shimura variety and uses resultant arguments (Proposition 3.2.2).
- **§4, ℓ = p, Fontaine–Laffaille case:**
  - Caraiani–Scholze's generic vanishing puts the localized cohomology of the unitary Shimura variety in the middle degree (Theorem 4.3.3).
  - Degree shifting with CTG weights (Definition 4.3.5, Proposition 4.4.6) moves Galois representations from the boundary into that middle degree, where they are crystalline (Theorem 4.5.1).
- **§5, ℓ = p, ordinary case:** the same argument in Hida theory.
  - Ordinary parts of parabolic inductions are computed in characteristic p (§5.3).
  - A torus trick reaches every degree (Lemmas 5.4.14–5.4.16).
- **§6, patching:**
  - deformation theory: ordinary and Fontaine–Laffaille rings, level-raising rings, Taylor–Wiles primes under enormous image;
  - a derived Ihara avoidance (§6.3), which replaces the unproved vanishing of mod-p cohomology outside a range;
  - ultrapatching of complexes (§6.4);
  - the two proofs, each ending with a soluble base change (§§6.5–6.6).
- **§7:**
  - compatible systems and their residual images;
  - potential automorphy of symplectic residual representations (Proposition 7.2.3), after BLGGT;
  - the elliptic-curve symmetric-power seed (Corollary 7.2.4);
  - the main proof, which switches between two primes l_1 and l_2.

## What the atlas already has

**PotentialAutomorphyInfrastructure (PA.0–PA.5) is built from this paper.** Its source-to-owner matrix assigns each section to a supplier, and with those suppliers it plans 251 of the 330 items:
- §2: ArithmeticLocallySymmetricSpaces ALS.0–ALS.6, IntegralHeckeAndGaloisDeterminants IHG.2–IHG.5, TorsionCohomologyInfrastructure TC.3–TC.4, AutomorphicGaloisRepresentationsPartII AG2.*.
- §4.3: IgusaVarietiesAndTorsionConcentration IG.7, the Caraiani–Scholze input.
- §§4–5: PA.1 and PA.2, with PadicFamilies L0a, SmoothRepresentationsOfLocalGroups, CompletedCohomologyPartII and FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3.
- §6.2: LocalGaloisDeformationRings L7, L8, R08.*; GlobalGaloisDeformations G7, G8, R04.*; ArithmeticGaloisRepresentations G7 (enormous image, which names ACC+ Definition 6.2.29).
- §§6.3–6.4: DeformationAndDerivedPatchingAlgebra P7–P9 (its reviewed decomposition has explicit ACC+ §6.3 and §6.4 nodes), PA.3 and PA.4.
- §7: ModularityAndLanglandsExtensions ML.2 and ML.3, and PotentialModularityAndCompatibleSystems R24.5.

**Library (1 item).** CM fields: Mathlib's `NumberField.IsCMField` (the totally imaginary case) and `NumberField.IsTotallyReal`. The paper's notion is their disjunction.

**Routing calls I made.**
- Scholze's torsion Galois representations (Theorems 2.3.5 and 2.3.7) are marked planned at TC.3, TC.4 and IHG.5, as PAPER-BOXER-CALEGARI-GEE-ETAL-25 marks them. TorsionCohomologyInfrastructure's summary says it does not require the final theorem. PAPER-IYENGAR-KHARE-MANNING-24 and PAPER-CALEGARI-GERAGHTY-18 treated similar statements as missing, so the reviewer should settle which is right.
- Theorem 2.4.10(1) is planned at AS.5 and ALS.5. Its localized part (2), and Theorem 2.4.11, are routed below.

## Routes

1. **New Part II `IntegralHeckeAndGaloisDeterminantsPartIIRamifiedLocalGlobal`** (18 missing).
   - Title: "Integral Hecke actions, determinants and interpolation, Part II: ramified Hecke operators and local–global compatibility away from p". Parent: IntegralHeckeAndGaloisDeterminants. Area: `langlands`.
   - **Contents:**
     - the ramified Hecke operators of §2.2.5: pro-ℓ-Iwahori operators, parahoric levels, the resultant, Propositions 2.2.9, 2.2.14, 2.2.18 and 2.2.19, Lemmas 2.2.10 and 2.2.13, Corollary 2.2.15;
     - the ℓ ≠ p argument of §3: Theorem 3.1.1, Proposition 3.1.2, Lemma 3.2.1 with its decomposed level, Proposition 3.2.2, Corollary 3.2.3, and the boundary determinant D′.
   - **Why a Part II:** IHG plans determinants only through unramified Frobenius. IHG.3 is explicitly the spherical normalization. PA's owner matrix sends §3 to IHG and to AG2, but AG2.5 is characteristic zero.
2. **Source of PotentialAutomorphyInfrastructure [PA.0–PA.5]** (25 missing).
   - The lifting theorems themselves: Theorems 6.1.1 and 6.1.2, Corollary 6.5.5 and Theorem 6.6.2, and their deductions by soluble base change, to PA.3. No stage states an automorphy lifting theorem; PAPER-QIAN-23 routed Theorem 6.1.2 to PA.3.
   - Lemma 4.2.2(1), the cohomology of U(O_K), to PA.0.
   - Kostant representatives, CTG weights, the decomposed-generic twist and Lemma 4.5.2, to PA.1.
   - The torus trick (A_K, Lemmas 5.4.14(2)–(4), 5.4.15, 5.4.16) and Corollary 5.5.2, to PA.2.
   - The auxiliary places v_0 and v′_0, to PA.4.
   - The base-change fields E, and Lemmas 7.1.1–7.1.3 on rank-2 compatible systems (as PAPER-BOXER-CALEGARI-GEE-ETAL-25 routed them), to PA.5.
3. **Source of IntegralHeckeAndGaloisDeterminants [IHG.5]** (2 missing): Definition 2.3.6 (Galois-type and non-Eisenstein ideals) and the behaviour of ρ̄_𝔪 under duality and twisting.
4. **Source of ArithmeticLocallySymmetricSpaces [ALS.0, ALS.3, ALS.5]** (7 missing):
   - twisting by characters (§2.2.20, Proposition 2.2.23, Corollary 2.2.24);
   - the non-Eisenstein localizations of the Franke comparison (Theorems 2.4.10(2) and 2.4.11);
   - the neatness criterion of Lemma 6.5.2.
5. **Source of SmoothRepresentationsOfLocalGroups [SR.1]** (2 missing): the Bushnell–Kutzko cover lemmas 2.1.12–2.1.13.
6. **Source of AutomorphicGaloisRepresentationsPartII [AG2.0, AG2.7]** (2 missing):
   - Lemma 4.3.2 (infinitely many decomposed generic primes);
   - the crystalline character ψ of Theorem 4.5.1's proof.
7. **Source of ArithmeticGaloisRepresentations [R01.4, G7]** (8 missing):
   - the residual-image lemmas: Lemmas 7.1.4–7.1.7 and 7.1.8(2), as PAPER-QIAN-23 routed them;
   - totally odd characters.
8. **Source of FiniteFlatGroupsAndIntegralPadicHodgeTheory [R07.5]** (3 missing):
   - Lemma 7.1.8(1), inertial types of crystalline lattices with Hodge–Tate numbers {0, 1};
   - the peu ramifié classes of §7.2.1 and Lemma 7.2.2.
9. **Source of PotentialModularityAndCompatibleSystems [R24.5:operations]** (1 missing): purity of rank-one and induced systems.
10. **Source of ModularityAndLanglandsExtensions [ML.0, ML.2, ML.3]** (7 missing):
    - to ML.0: archimedean normalizations, and L-functions of compatible systems with their comparison to automorphic L-functions;
    - to ML.2: Proposition 7.2.3 and Assumption 7.2.6;
    - to ML.3: Corollary 7.2.4 and Corollary 7.1.13(1).
11. **Source of AutomorphicLFunctionsAndLocalFactors [AL.3]** (1 missing): the Jacquet–Shalika bound.
12. **Source of ArithmeticGaloisDuality [R02.2, R02.4]** (1 missing): the square root of a character after a totally real base change, in the proof of Theorem 7.1.11.
13. **Source of HilbertModularVarietiesAndShimuraCurves [H6]** (1 missing): the moduli spaces Y_i and X_i of elliptic curves with prescribed torsion, and their local points.

## Source issues (`sourceIssues` E1–E108)

108 mistakes are recorded: 87 misprints, 13 gaps and 8 errors. Each was checked on the published page images and re-derived from the paper's own definitions. About twenty-five further candidates were rejected, or left out as unconfirmed.
- **Introduced in print:** E69, E70 and E108. Everything else is also in arXiv v2.
- **Effect on results:** none of the mistakes affects the paper's main theorems as intended. Some stated lemmas are false as printed or need an extra hypothesis, but in each case every use in the paper satisfies it.

**Errors.**
- **E100, Lemma 7.1.8(2) is false for l = 2.** The proof of part (1) explicitly allows l = 2.
  - Counterexample: T_2 of the elliptic curve 37a1. Q(E[2]) contains Q(√37), which is unramified at 2.
  - The failing step: A_3 ⊲ GL_2(F_2) is neither central nor contains SL_2.
  - Every use in the paper has l ≥ 7.
- **E60 and E62, Lemma 5.4.8 and Proposition 5.4.13.**
  - For n = 1 they fail: their weights are never CTG.
  - Their CTG check tests the wrong combination of weights. For n ≥ 3 it does not imply CTG; entries 0, 1, 3, 10, 11, 13 are a counterexample.
  - The conclusion holds for n ≥ 2 by the repaired argument.
- **E35, criterion (4.3.7) in the proof of Lemma 4.3.6 has "−" where "+" is needed.** There is a counterexample with n = 1 and [F⁺ : Q] = 2. With "+" the lemma stands.
- **E39, Proposition 4.4.6(c) is false in the degenerate case A(K, λ, q, m) = 0.** Every application has A ≠ 0.
- **E49, the weight λ′ in the second case of Theorem 4.5.1 ignores the Hodge–Tate weights of ψ at the other p-adic places.** Only λ′ above v̄ is used afterwards.
- **E5 and E11:** a nilpotence exponent that fails for n = 1, and root formulas in the proof of Proposition 2.2.14. Neither affects anything.

**Gaps.**
- **E106, Assumption 7.2.6.** The choice of auxiliary primes l_1, l_2 omits two things the proof needs:
  - p > n² for Theorem 6.1.1, with n = m_i + 1 (for m_i = 3, the printed bound allows p = 11 or 13 < 16);
  - crystallinity of r_{i,λ_i} at l_2.

  Both hold on a density-one set of primes, so the choice is still possible.
- **E105:** Corollary 7.2.4 asserts its conclusion under a weaker disjointness hypothesis than the Proposition 7.2.3 it is derived from. The main proof uses the weaker form.
- **Hypotheses omitted from stated results:**
  - E23: Theorem 2.4.11 needs F to contain an imaginary quadratic field.
  - E33: Proposition 4.3.4 omits a hypothesis of Theorem 4.2.1.
  - E58: the surjectivity claimed in Theorem 5.4.3 is not established. Its only consumer, Proposition 5.4.18, can be repaired.
- **Other gaps:**
  - E25: Lemma 3.2.1's level K̃ ∩ G = K.
  - E65: Lemma 5.4.16 omits the level at p.
  - E67: the base change in Corollary 5.5.2 is not shown to keep decomposed genericity.
  - E74: the proof of Lemma 6.2.27 needs flatness it does not have.
  - E90: Proposition 6.5.13's local base change is proved only at almost all places.
  - E91: the example choice of E_b, E_c does not split the auxiliary primes.
  - E92: the case v | p of Theorem 6.1.1's final sentence is not treated.
  - E98: Lemma 7.1.5's witness prime needs p ≠ l.

**Misprints worth knowing.**
- **Introduced in print:**
  - E70: Lemma 6.2.9 reads "Let R̃ be a finite R-algebra", which asserts nothing.
  - E69: two bibliography entries are labelled [CS19], Calegari–Specter and Caraiani–Scholze.
  - E108: "Shalika, Shalika" appears in both Jacquet–Shalika entries.
- **Formulas and conventions:**
  - E88: g is printed as qn − n[F⁺ : Q] three times; it should be qn − n²[F⁺ : Q].
  - E16: (2.4.3) omits the twist ε^{1−2n}.
  - E102: Corollary 7.1.16's functional equation pairs the duals with the reflection 1 + m + m′ − s; it should be 1 − s.
  - E97: Lemma 7.1.4 prints GL_2 for GL_n.
  - E3: rec_ℝ and rec_ℂ are interchanged in §1.2.
  - E6, E7, E8, E10: exponents and signs in the Hecke polynomials of §2.2.5.
- **Cross-references:** E85 "Proposition 6.2.32" should be Proposition 6.2.33(3). E75 "[CG18, §9.2]" should be the published §9.4.

Items use the corrected statements.

## Prerequisites not yet covered

Sixteen entries:
- Scholze, "On torsion" (Ann. of Math. 2015);
- Clozel–Harris–Taylor and Taylor (Publ. IHÉS 2008);
- Barnet-Lamb–Gee–Geraghty–Taylor (Ann. of Math. 2014);
- Khare–Thorne (Amer. J. Math. 2017);
- Newton–Thorne (Forum Math. Sigma 2016);
- Geraghty (Math. Ann. 2019);
- Harris–Lan–Taylor–Thorne (Res. Math. Sci. 2016);
- Varma (Forum Math. Sigma 2024);
- Emerton's ordinary parts I–II (Astérisque 331);
- Hauseux (JIMJ 2016);
- Gee–Newton (JIMJ 2022);
- Chenevier (LMS LN 414);
- Bushnell–Kutzko (Proc. LMS 1998);
- Franke (Ann. ÉNS 1998);
- Jacquet–Shalika (Amer. J. Math. 1981).

Every DOI was checked against Crossref. Emerton's Astérisque papers have no DOI, so their entry links to MathSciNet.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-ALLEN-ETAL-23.result.json` reports no errors.
- `python3 research/blueprint/intake.py check-files` reports no problems.
- Every planned and route stage id exists in `data/atlas.json`. The Part II parent is an atlas roadmap, its title begins with the parent's title, and its area `langlands` is a galaxy id.
