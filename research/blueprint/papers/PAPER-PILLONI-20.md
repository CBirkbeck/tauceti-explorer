# PAPER-PILLONI-20: Pilloni (2020), higher coherent cohomology and p-adic modular forms of singular weights

Vincent Pilloni, *Higher coherent cohomology and p-adic modular forms of singular weights*, Duke Mathematical Journal 169 (2020), no. 9, 1647–1807, [doi:10.1215/00127094-2019-0075](https://doi.org/10.1215/00127094-2019-0075). Earlier versions: HAL hal-01393374 (v1–v3, 2016–2018).

Job PAPER-PILLONI-20 (issue #1326), Claude Code, session cc-72825f.

## The version read

**The author's version.** Pilloni's homepage links `complexhidatheorygsp4.pdf`: 113 pages, dated 17 June 2019, SHA-256 4c05724efeab1dbbb108f980ec9a722127d2a8cd2abf6e8c2a6a2251cf0f9f58. It was read in full.
- It is post-referee: it thanks the referees and records a referee's alternative proof.
- The journal nonetheless records a revision on 15 October 2019, after this version.
- The published Duke text (pp. 1647–1807) is paywalled, and no open copy exists, so it could not be compared.

**All locators in this extraction are pages and statement numbers of the author version.** Whether the journal numbering agrees was not checked.

**The earlier version.** HAL v3 (6 January 2018, 96 pages) was compared with the author version. Their word-level similarity is 0.78, and the author version adds substantial material. It was also consulted at the place of every recorded mistake.

## What the paper proves

**The setting.** Automorphic forms for GSp₄/Q whose archimedean component is a non-degenerate limit of discrete series with Hodge–Tate weights (k+1, k+1, 0, 0), the only case the paper treats (p. 2), live in the coherent cohomology of automorphic vector bundles on Siegel threefolds, in degrees 0 and 1 of Ω^{(k,2)}(−D). Classical Hida theory interpolates only degree 0. The paper builds p-adic families in all degrees: *higher Hida theory* and *higher Coleman theory*.

**Theorem 1.1 (higher Hida theory, pp. 2–3).** There is a perfect complex M of Λ-modules, Λ = Z_p⟦Z_p^×⟧, of amplitude [0, 1], with three properties:
1. M ⊗^L_{Λ,k} Q_p is the U-ordinary part of RΓ(X_{Kli(p)K}, Ω^{(k,2)}(−D) ⊗ Q_p) for all k ≥ 0;
2. H⁰(M ⊗^L_{Λ,k} Q_p/Z_p) is the T-ordinary part of H⁰(X_K, Ω^{(k,2)}(−D) ⊗ Q_p/Z_p) for k > p + 1;
3. both isomorphisms are equivariant for the prime-to-p Hecke algebra.

M is the U-ordinary part of the cohomology of a large sheaf 𝔉^κ ⊗ Ω^{(0,2)}(−D). This sheaf lives on the formal locus 𝔛^{≥1}_{Kli(p)K} where the p-rank is at least 1. Over the pro-étale tower 𝔛^{≥1}_{Kli(p^∞)K} → 𝔛^{≥1}_{Kli(p)K}, which parametrises the one-dimensional multiplicative p-divisible subgroups H∞, the Hodge–Tate map gives a Z_p^×-reduction of ω_{H∞}, and that reduction lets the powers of ω_{H∞} be interpolated. The image of the locus in the minimal compactification is covered by two affines, which is why M has amplitude [0, 1].

**Theorem 1.2 (p. 3; Theorem 15.2.1).** For a non-Eisenstein maximal ideal m, the complex M_m has trivial Euler characteristic. The proof uses Arthur's classification for GSp₄, as announced.

**The main steps.**
- **Part I (§§2–5).** Preliminaries:
  - ordinary projectors on complexes;
  - cohomology of formal and rigid spaces;
  - cohomological correspondences, with trace maps from Grothendieck–Serre duality;
  - automorphic forms, Galois representations and Siegel threefolds.
- **Part II (§§6–11).** Higher Hida theory:
  - the Siegel threefold over Z_p at spherical, Klingen and paramodular level, its compactifications and its Hasse invariants (§6);
  - the Hecke operators T and U, defined integrally through the factorisation diag(p², p, p, 1) = diag(p, p, p, 1)·diag(p, 1, 1, 1) and the paramodular correspondences (§§7, 10);
  - finiteness of the ordinary cohomology (§8);
  - the sheaves 𝔉^κ over the Klingen tower (§9);
  - the perfect complex M with its integral control for k ≫ 0 (§11).
- **Part III (§§12–14).** Higher Coleman theory:
  - an overconvergent complex M†, with U compact on overconvergent cohomology;
  - finite-slope families (§13);
  - classicality of small-slope classes by analytic continuation and gluing (§14, Theorems 14.7.1 and 14.8.1). This gives control over Q_p in all weights.
- **Part IV (§15).** The Euler-characteristic theorem.

**Why it matters.** The paper proposes (pp. 5–6) replacing H⁰(X_K, Ω^{(0,2)}(−D) ⊗ Q_p/Z_p), whose higher-cohomology vanishing is not known (the obstruction in Calegari–Geraghty's conditional theorem), by H⁰(M ⊗ Q_p/Z_p). The paper says this strategy "will be employed in a future joint work with G. Boxer, F. Calegari and T. Gee" (p. 6); Boxer–Calegari–Gee–Pilloni's potential modularity of abelian surfaces (arXiv:1812.09269) builds on this higher Hida theory.

**Later work.** No erratum or correction exists, and no later work reports a mathematical error. Later papers record limitations and extensions:
- **Weights.** Integral control needs large weights, as the paper itself says (p. 4; Remark 7.4.2.2).
- **Families.** The families have one parameter, with one weight component fixed. Boxer–Pilloni (Invent. Math. 2026) extend the modules over the whole weight space.
- **Other cases.** The case r₂ = 0 used by Loeffler–Zerbes rests on a personal communication.
- **Conventions.** Calegari–Geraghty warn that Pilloni's T_{p,1} is their T_{p,2} and vice versa.
- **Arthur.** Theorem 1.2 depends on Arthur's classification for GSp₄.

## What the libraries and the atlas already have

The extraction has 550 items: 6 are in the libraries, 59 are planned in atlas layers, and 485 are missing. Every item was checked against Mathlib 082e2d3 and Tau Ceti f790474, reading the statements in the Lean files, and against the atlas.

**The libraries** have only foundations:
- complete Noetherian local rings and adic completeness (§2's standing ring R and the category Mod^comp(R));
- K-projective complexes and the derived category;
- Artin–Rees;
- pushforward and pullback of sheaves;
- spans, used for correspondences.

Neither library has coherent cohomology of Shimura varieties, formal or rigid Siegel threefolds, Hecke operators at p, Banach sheaves, or anything of p-adic families.

**Planned in the atlas.** The planned items cite 34 roadmaps: 25 atlas roadmaps and 9 Tau Ceti roadmaps. The main owners are:
- *ShimuraCompactifications* (19 references), *PELModuli* (15), *ShimuraData* (6) and *AutomorphicBundles* (6) plan the Siegel threefold at good level: its moduli, integral toroidal and minimal compactifications at hyperspecial level, the Hodge bundle, and the automorphic sheaves as sections.
- *AdicSpacesPartII* (14) plans adic and formal models.
- *LocallyAnalyticDistributions* (7) and *PadicMeasuresIwasawaAlgebras* (5) plan Banach modules, compact operators and weight spaces.
- *DeformationAndDerivedPatchingAlgebra* (12) plans perfect complexes over complete local rings and minimal complexes.
- *PadicFamilies* (3) plans group-independent ordinary projectors (L0a) and eigenvariety gluing (L2a); its Hida and Coleman families are for modular curves and totally real fields, in one degree (L0, L2, L5).
- Smaller contributions (one to four references each) come from the other roadmaps, among them ShimuraVarieties, DerivedDeRhamCohomology, IntegralHeckeAndGaloisDeterminants, AutomorphicFormsOnReductiveGroups, KTheoryLowDegrees, and the Tau Ceti ReductiveGroups and AdicSpaces roadmaps.

**Missing.** No layer plans:
- Hecke operators at p on coherent cohomology in all degrees, or their integral normalisation through parahoric correspondences;
- Siegel threefolds at Klingen, paramodular and Siegel-parahoric level with their local models and integral compactifications;
- the second Hasse invariant and the p-rank-one locus;
- the sheaves 𝔉^κ that interpolate automorphic sheaves along the Klingen tower;
- higher Hida theory, meaning perfect ordinary complexes with control theorems;
- higher Coleman theory, meaning overconvergent coherent cohomology, finite-slope families and classicality in higher degree;
- the Euler-characteristic theorem.

## Routes

The 485 missing items go to 25 routes: one new Part II, five routes that join proposals already made by other extractions, and 19 source routes. Each brief states the final results as printed and then the corrections, with their `sourceIssues` numbers, that the design job must apply. Nothing is claimed to be formalised.

**1. Part II of PadicFamilies: HigherHidaAndColemanTheory, "Hida and Coleman families, period modules, and family L-functions, Part II: higher Hida and higher Coleman theory for coherent cohomology" (271 items).**
- **Scope.** This is the paper's core, planned for the Siegel threefold:
  - degree-0 Siegel Hida theory;
  - the Hecke operators T and U, defined integrally through the paramodular factorisation, with their normalisations and their behaviour on the p-rank strata (§§7, 10);
  - finiteness of the ordinary cohomology (§8);
  - the deep Klingen tower, the Hodge–Tate reduction of ω_{H∞} and the Λ-adic sheaves 𝔉^κ (§9);
  - the perfect complex M with its control theorems (§11, Theorem 1.1);
  - overconvergent cohomology on strict neighbourhoods, with compactness of U (§12);
  - finite-slope families and the spectral variety (§13);
  - classicality of small-slope classes (§14);
  - the Euler-characteristic theorem (§15, Theorem 1.2).
- **Why a Part II.** PadicFamilies plans abstract ordinary projectors (L0a), eigenvariety gluing (L2a), and Hida and Coleman families for modular and Hilbert cohomology, always in one degree. It stops there. The maintainer's brief for DESIGN-BCGP18 asks for higher Coleman theory to be "its own roadmap"; this is it.
- **Why not split.** The route critic advised against splitting higher Hida and higher Coleman theory into two roadmaps. The proof of Theorem 1.1 compares M† with M ⊗ Q_p, and the Klingen U-operator and the p-rank ≥ 1 locus are shared.

**2. Addition to SiegelModularFormsModPn, the Part II of AlgebraicModularFormsAndSerreWeights proposed by PAPER-CALEGARI-GERAGHTY-20 (32 items).**
- **Scope.**
  - the Siegel Hasse invariant and the second Hasse invariant Ha′ with their extension over the boundary;
  - the p-rank strata of the special fibre and the two-affine covering of the p-rank ≥ 1 locus;
  - spherical-level operators at p on the p-rank ≥ 1 locus;
  - Hartogs-type extension for forms modulo pⁿ;
  - canonical lifts of powers of Ha modulo pⁿ, and p-adic Siegel modular forms with their q-expansions.
- **Imported, not owned.** The Hasse invariant of a BT₁ over any F_p-scheme belongs to HodgeTateAndCanonicalSubgroups T0: it is source-routed there, and this roadmap imports it from T0.

**3. Addition to IntegralCoherentHeckeComplexes, the Part II of AutomorphicBundles proposed by PAPER-CALEGARI-GERAGHTY-18 and joined by PAPER-CALEGARI-GERAGHTY-20 (21 items).**
- **Scope.**
  - cohomological correspondences and their action on coherent cohomology;
  - their construction from a fundamental class (§4.3.1), with the trace maps and fundamental classes of Grothendieck–Serre duality imported from AlgebraicModuliForArithmeticGeometry A0-extension, where they are source-routed;
  - Harris's realisation of limit-of-discrete-series forms in coherent cohomology;
  - interior cohomology;
  - vanishing of higher direct images to the minimal compactification;
  - the prime-to-p Hecke action in all degrees, and T_{p,2} and U_{Kli(p),2} with p inverted;
  - the non-Eisenstein statements for m = m_ρ̄ that Theorem 1.2 uses: boundary cohomology is Eisenstein, Corollary 15.2.3.1 and Proposition 15.2.4.1.

**4. Addition to ShimuraVarietiesHondaTatePartII, the Part II of ShimuraVarieties on integral models and reduction proposed by other extractions (7 items).** The integral Siegel threefold at Klingen, paramodular and Siegel-parahoric level at p: its moduli interpretation, local models, regularity, flatness and lci (Proposition 6.1.4.1), and the correspondences between levels.

**5. Addition to GSp4NonregularModularityLifting, the new roadmap proposed by PAPER-CALEGARI-GERAGHTY-20 (4 items).** Galois representations attached to Hecke eigensystems in coherent cohomology of every weight, singular weights included (Theorem 5.3.1, with de Rham-ness at p for classical forms); the two GSp₄ modularity lifting theorems the paper cites, Pilloni 2012 and Calegari–Geraghty's conditional theorem; and the equivalence of non-Eisenstein with m = m_ρ̄. This route imports route 1; route 1 never imports it.

**6. Addition to ShimuraCompactificationsPartIIHodgeTypeIntegralBoundary, the Part II of ShimuraCompactifications proposed by PAPER-FARB-KISIN-WOLFSON-24 and PAPER-MAULIK-SHANKAR-TANG-22 (10 items).** Integral toroidal and minimal compactifications of the Siegel threefold at parahoric level at p:
- boundary charts through 1-motives;
- refinement maps and the extension of p₁ and p₂;
- normality and lci;
- extension of the Klingen subgroup over the boundary;
- the compactified Hecke correspondences over Z_p (Faltings–Chai), including C_{p,2}.

This widens that proposal beyond hyperspecial level.

**Source routes (140 items).** Each reason names the covering phrase of the stage description, what the layer must add for this paper, and the sources to add. The main ones:
- *AdicSpacesPartII* (29): O⁺ and O⁺⁺ cohomology of affinoids and formal models (Bartenwerfer), formal models and Čech comparisons.
- *HodgeTateAndCanonicalSubgroups* (18): the Hodge–Tate map, the Hasse invariant of BT₁ groups, Fargues's degree theory and his isomorphism LF, and (T5) the modified Hodge bundle ω^mod.
- *PadicFamilies* L0a and L2a (18): locally finite operators and ordinary projectors on complexes (L0a), and the spectral variety of a complex with a compact operator, with local constancy of its slope-h Euler characteristic (L2a, §13.1).
- *AlgebraicModuliForArithmeticGeometry* (18): derived categories of quasi-coherent sheaves, upper shriek and Grothendieck–Serre duality with trace maps.
- *FiniteFlatGroupsAndIntegralPadicHodgeTheory* (10): BT₁ groups, multiplicative parts and Dieudonné theory.
- *SmoothRepresentationsOfLocalGroups* (9): Satake, parahoric Hecke algebras and Hecke parameters for GSp₄.
- *AutomorphicFormsOnReductiveGroups* (8): limits of discrete series.
- The remaining 30 items go to twelve smaller routes:
  - ModularityAndLanglandsExtensions (Arthur's classification for GSp₄);
  - AutomorphicGaloisRepresentationsPartII (regular-weight Galois representations);
  - DeformationAndDerivedPatchingAlgebra (minimal complexes);
  - ShimuraCompactifications (compactifications at hyperspecial level);
  - LocallyAnalyticDistributions (compact operators and Coleman's local constancy);
  - IntegralHeckeAndGaloisDeterminants (Hecke polynomials and maximal ideals);
  - ShimuraData, AbelianSchemesAndArithmeticModuli (Serre–Tate), PadicMeasuresIwasawaAlgebras, PerfectoidShimuraVarieties, SchemeAndStackFoundations, ReductiveGroupsPartII.

## Mistakes found in the paper

`sourceIssues` records 175 mistakes: 143 misprints, 11 errors and 21 gaps. Of these, 9 affect a stated result, 18 affect a proof, and 148 affect nothing downstream. No erratum or correction to the paper exists, and no later work reports any of these mistakes. All are recorded against the author version of 17 June 2019. The journal's final revision (15 October 2019) may have corrected some of them, and this could not be checked.

**How they were checked.**
- Eight section readers, eight independent statement checkers and three whole-paper hunts proposed 263 candidates. De-duplication reduced them to 193 distinct ones.
- Every candidate was checked again on the rendered page of the author version, and in HAL v3 at the same place.
- Each error and gap had two independent verifications. Candidates from the hunts had already been checked by a hunt verifier, and got one further verifier who tried to defend the paper and traced the consequences. The others got two: one read the printed text and redid the mathematics, the other tried to defend the paper. Misprints were verified in batches.
- 18 candidates were rejected because the paper is right as printed or under its own conventions.
- On five candidates the two verifiers disagreed. They are recorded at the reach the confirming verifier's argument supports: E1, E2, E86, E106 and E165. On E70 the two verifications disagreed on the kind: a separate reconciliation, with its own check, settled it as an error in the proof.

**Stated results affected.**
- **Theorem 5.1.7.1** (Galois representations, p. 23): item 5 has the wrong power of the cyclotomic character, χ_p^{−λ1−λ2} for χ_p^{λ1+λ2}. As printed it contradicts item 3's Hodge–Tate weights (E27).
- **Theorem 6.1.5.1(2)** (compactifications, p. 29) states π^⋆𝓘 = 𝓘′ for the boundary ideals under a refinement. The correct statement is (Rπ)_⋆𝓘′ = 𝓘 (E40).
- **§6.3.3** (the second Hasse invariant, pp. 31–33): Lemmas 6.3.3.3 and 6.3.3.5 say that V⋆_H, W and the section built from them vanish exactly on "the complement of S′", where the locus of multiplicative rank 0 is meant. As printed the two lemmas are false; Proposition 6.3.3.1 still holds (E43).
- **Lemma 11.1.1.4** (p. 68) holds for n ≥ 1, not n ≥ 0. At n = 0, Tr ∘ i = (p + 1)·Id (E85).
- **Proposition 13.3.3.1** (p. 90): the diagram's bottom arrow should be p^{k+1}U (E119).
- **§14** (pp. 95–100): the statements need r ≥ 0, which §14 never states; only §13.3 does, on p. 88 (E128). Corollary 14.6.1 needs 0 < ε < 1 (E132).
- **Proposition 14.9.1** (p. 102): "positive valuation" means ≥ 0, the French usage (E139). The statement should be restricted to i ∈ {0, 1}, which is all its proof covers (E141).

**Proofs affected; the results are expected to hold.**
- **§§2–3.**
  - §2's standing hypothesis (a complete local ring) is applied to Λ = Z_p⟦Z_p^×⟧, which is only semi-local (E5).
  - Proposition 3.2.1's injectivity argument needs k discretely valued or algebraically closed (E14).
  - Proposition 3.4.1's proof needs the comparison on O⁺⁺/p in degree 0, and a choice of p̲ tied to σ (E16, E17).
- **§§7–11.**
  - Lemmas 7.4.2.3–7.4.2.4 omit the boundary (E58).
  - The affineness step in the proof of Lemma 9.1.1.1 fails for m ≥ 2. Read literally, Z′ is not closed in Z; read as the locus H_{m−1} ⊂ C, the conormal sheaf ℒ is not invertible on it. Taking Z′ to be the locus where also F kills C/H_{m−1} repairs it, and Lemma 9.5.1 in the same way (E70).
  - Lemma 10.3.1 does not justify the lci property (E75).
  - Lemma 11.1.1.4's proof claims that every isogeny in T^{n,m} factors through multiplication by p. That is false: the kernel only contains G[p]^m, and the count of powers of p then needs r ≥ 2 (E84).
  - Theorem 11.3.1: the vanishing input of [50] is applied to the Igusa-type sheaves without checking its hypothesis (E90), and point 2 has no proof (E91).
- **§§12–14.**
  - Lemma 12.9.2.1 does not prove acyclicity on the intersection of its two opens (E106).
  - Proposition 13.3.1.1's proof applies Proposition 14.4.1.1 at a level and cone decomposition it does not cover (E115), and needs two unproved comparisons (E116).
  - Corollary 14.6.2's proof misprints its polynomial Q, and its step "as in the proof of corollary 14.6.1" needs a bound on the coefficients of Q(X)^n that is not given (E134).
  - The last step of Lemma 14.7.1 is not justified (E135).
  - Lemma 14.8.3 uses Lemma 5.1.5.2, whose hypothesis can fail; weakening that hypothesis repairs it (E142).
- **§15.**
  - Proposition 15.1.1 does not show that the Hecke operators commute in D(Λ), or that T_{ℓ,0} is invertible (E147).
  - The proof of Theorem 15.2.1 specialises at a single weight. Weight space has p − 1 connected components, so one weight in each residue class mod p − 1 is needed (E165).

**Errors that affect nothing downstream:**
- the "coherent" kernel in Proposition 3.1.1 (E10);
- the positive system of §5.1.1 (E20);
- the fibre formula before Proposition 13.4.1 (§13.4), which identifies the fibre at (κ, α^{−1}) with the α-eigenspace where the localisation at α^{−1} is meant (E123);
- the definition of the maximal ideal attached to ρ̄ in §15.2 (E150).

**Misprints of note.**
- **Wrong references:** "[69], thm. 9.1" on pp. 94 and 100, which is [70] (Scholze, p-adic Hodge theory for rigid-analytic varieties) (E126).
- **Bibliography:**
  - [6] names "G. Grauert" as a co-author, for U. Güntzer (E167);
  - [56] gives the year 1951, for 1981 (E174);
  - the titles of [1], [35] and [77] are misprinted (E168).
- **Introduction:**
  - it describes T as "the" double coset operator K_p diag(p², p, p, 1)K_p, whereas §7 defines T as a normalised composite of two parahoric double cosets (E1);
  - it omits the standing assumption that K is neat (E2).

## Notes for the reviewer

- **Version.** Every item, locator and mistake refers to the author's version of 17 June 2019. The journal records a revision after it (15 October 2019), and the Duke text is paywalled. A reviewer with access to the published version should check the locators, and the recorded mistakes that affect results, against it.
- **Joined proposals.** Routes 2–6 use the ids, parents and titles of proposals made by other extractions:
  - SiegelModularFormsModPn and GSp4NonregularModularityLifting (PAPER-CALEGARI-GERAGHTY-20);
  - IntegralCoherentHeckeComplexes (PAPER-CALEGARI-GERAGHTY-18 and -20);
  - ShimuraVarietiesHondaTatePartII (PAPER-FARB-KISIN-WOLFSON-24 and others);
  - ShimuraCompactificationsPartIIHodgeTypeIntegralBoundary (PAPER-FARB-KISIN-WOLFSON-24 and PAPER-MAULIK-SHANKAR-TANG-22).

  Each brief lists what this paper adds. The maintainer merges each set of briefs into one design job.
- **Consequences for PAPER-CALEGARI-GERAGHTY-20.** The routing critic for this paper found two corrections to that (merged) extraction, which the same session wrote:
  - Its SiegelModularFormsModPn brief claims the Hasse invariant of a p-divisible group over any F_p-scheme. HodgeTateAndCanonicalSubgroups T0 is the right owner of the Barsotti–Tate Hasse invariant, and SiegelModularFormsModPn should import it.
  - Its interior-cohomology items (Lemma 7.10, the boundary-cohomology vanishing, the exclusion of Arthur types (b)–(f), the case-(a) cuspidality lemma and dim H⁰ = dim H¹) belong in IntegralCoherentHeckeComplexes rather than in GSp4NonregularModularityLifting, so that this paper's routes can import them without a cycle.

  These should be applied when the PAPER-CALEGARI-GERAGHTY-20 review is done or the joined designs are merged.
- **Import directions.**
  - The integral models (route 4) and the integral boundary (route 6) are upstream.
  - IntegralCoherentHeckeComplexes is upstream of routes 1, 2 and 5.
  - The higher Hida and Coleman Part II (route 1) imports routes 2, 3, 4 and 6, and never route 5.
  - GSp4NonregularModularityLifting imports route 1.
- **Arthur.** Theorem 1.2 (= Theorem 15.2.1) uses Arthur's classification for GSp₄, as announced. ModularityAndLanglandsExtensions ML.4 must record its current status.
- **Coordination with DESIGN-BCGP18.** AbelianSurfacesPotentialModularity should import route 1. The maintainer's brief for it asks that higher Coleman theory be "its own roadmap", and route 1 is that roadmap. Boxer–Pilloni's later "Higher Hida theory for Siegel modular forms" (Invent. Math. 2026; queued as its own paper job) extends route 1's families over the whole weight space.

## How this was done

**Reading the paper.** The author version was read in full in eight overlapping section clusters. For each cluster:
- one reader extracted every definition, construction and key result, with its exact statement and locator;
- a second reader checked the statements independently against the page images, correcting 37 statements and proposing 56 missing items;
- a third reader decided library and atlas status, reading the Lean declarations at the pinned commits and the atlas stage descriptions and reviewed decomposition nodes.

Of the 56 proposed items, 11 duplicated items already extracted and 40 were proof steps, remarks with nothing to formalise, or instances of existing items; 5 were kept. A de-duplication pass then removed 49 duplicates across cluster boundaries, leaving 550 items.

**Routing.**
- One router per cluster assigned every missing item to a route. A critic then checked the whole assignment for consistency and PROTOCOL 15. It moved 6 items to other routes, recommended the join to ShimuraCompactificationsPartIIHodgeTypeIntegralBoundary, and advised against splitting route 1.
- One writer per route wrote the briefs. An adversarial checker read each against the page images and the atlas and found 92 problems in the six briefs, and a reviser applied the fixes.
- The 19 source-route reasons were written, checked (14 problems) and revised the same way.
- A second checker then re-checked each revised brief and the source reasons against the page images and the atlas. It proposed 27 further fixes. All were applied except one, which would have given the Iwahori-level strata of Pilloni (2011) to SiegelModularFormsModPn when the other brief's check, which was applied, gives them to ShimuraVarietiesHondaTatePartII.
- Two further checkers read this report and the summary against the paper, the result file and the working data, and their fixes were applied.

**Mistakes, inputs and literature.**
- Mistakes were found and verified as described above: 71 hunt verifications, 84 lens verifications and 16 batches of misprints. The two extra lens verifications were for E161, a gap first verified only in a misprint batch; both confirmed it.
- All 88 references were checked against Crossref and the arXiv API, and against the atlas bibliography, queue and extracted papers. The 34 that the paper uses and the atlas does not yet cover, or names without having read, are listed as prerequisites.
- The later literature was searched for corrections and for the status of the paper's hypotheses. Every source is listed in `readSections`.

**Checks and Lean.**
- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-PILLONI-20.result.json` reports ok.
- `python3 research/blueprint/intake.py check-files` passes on the two deliverables.
- No Lean was written. A paper extraction has no Lean deliverable, and nothing is claimed to be formalised.

## Review checkpoint (REV-PAPER-PILLONI-20, 23 September 2026)

Claude Code, session `cc-7b31c4`, issue #1327, submitted a **partial** review: the structural work is
complete and needs no correction, the source is verified, the mechanical audit of all 175 findings is
done, and 13 of them carry verdicts. The record is
[REV-PAPER-PILLONI-20.md](../reviews/REV-PAPER-PILLONI-20.md).

Complete: the recorded hash of the author's version reproduces byte for byte and all 113 pages were
re-extracted; 550 items with every missing one routed exactly once; all 19 source stage ids, all 59
planned ids and all 19 library declarations check out; all five Part II titles reproduce their
parents' atlas titles exactly, the new roadmap's id is free, and all six route areas are galaxy ids.
For 169 of the 175 findings the quoted text is located automatically at its own locator page; the
other six are diagram labels and symbol-heavy displays that this PDF's text layer does not carry.

**Verdicts.** Thirteen findings are confirmed. Four are settled by the paper contradicting itself —
`E1` (the introduction calls `T` the double-coset operator that §7 says cannot be defined
integrally), `E2` ("an compact open subgroup" where §§5.2.1 and 6.1.1 require *neat*), `E3`
(`⊗^L_{Λ,2}` for weight `(0,2)`, i.e. `k = 0`) and `E7` (a spectral sequence written for `M^•` in a
conclusion about the cone). Three were checked by computation: `E20`'s declared positive system has
two roots with negative `α₁`-coefficient in its own declared base; `E24`'s similitude relation must be
`αδ = βγ` because the torus is `diag(st₁,st₂,st₂^{−1},st₁^{−1})`; and `E27`'s exponent is forced to be
`+λ₁+λ₂` by the theorem's own Hodge–Tate weights. `E4`, `E6`, `E21`, `E23`, `E25` and `E28` are
confirmed verbatim.

The other 162 need verification in substance. The checkpoint sets the order — the 11 errors and 21
gaps first (nine of them reach a stated result), then the misprints in page order, where they cluster
on pp. 20–25, 56–62 and 86–93, and finally the six that need rendered pages. It also records two
cautions: the text layer drops accents and some sub/superscript placement, so a quotation that looks
wrong there is not evidence; and the extraction's scope — author version only, published Duke text
uncompared — must be preserved in every verdict.
