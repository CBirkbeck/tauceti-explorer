# PAPER-BOXER-PILLONI-26: Boxer and Pilloni (2026), higher Hida theory for Siegel modular forms

George Boxer and Vincent Pilloni, *Higher Hida theory for Siegel modular forms*, Inventiones Mathematicae 244 (2026), no. 1, 45–141, [doi:10.1007/s00222-025-01393-2](https://doi.org/10.1007/s00222-025-01393-2). There is no arXiv version; the authors' version is on Pilloni's homepage and on HAL (hal-05409187).

Job PAPER-BOXER-PILLONI-26 (issue #1199), Claude Code, session cc-72825f.

## The version read

**The authors' version.** Pilloni's homepage links `higherhidaSiegel.pdf`: 65 pages, built on 5 November 2025, SHA-256 af70d084612b1b75761694923ef2395752d23b41e0b8b458910d096df4c8c3c6. It was read in full.
- It was built twelve days before acceptance (17 November 2025) and thanks the referee.
- HAL hal-05409187v1 has the same text page for page.
- The published Springer text is paywalled. Its 34 references and four footnotes, visible on the article page, match this version, including the footnote that first appears in it.

**All locators in this extraction are pages of the authors' version.** Whether the journal's pagination and numbering agree was not checked.

**The earlier preprint.** The version of December 2023 (63 pages; the January 2024 build on Boxer's homepage has the same text) was compared with the authors' version: their word-level similarity is 0.94. The final version corrects several statements of the preprint (Lemmas 2.1.4 and 2.1.13, Theorem 5.5.1, Theorems 6.2.9(3) and 6.2.15(2)) and adds Remark 6.2.18. The preprint was consulted at the place of every recorded mistake.

## What the paper proves

**The setting.** Let G = GSp_{2g}, with Siegel Shimura varieties S_K, toroidal compactifications S^tor_{K,Σ} and automorphic vector bundles ω^κ for κ ∈ X*(T)^{M,+}. Classical Hida theory interpolates p-adically only the degree-0 coherent cohomology H⁰(S^tor, ω^κ), through functions on the ordinary Igusa variety. The paper builds a Hida theory for coherent cohomology in every degree: *higher Hida theory*.

**The Kostant set.** The theories are indexed by the set ^M W of minimal-length representatives of W_M\W (Definition 1.3.1). Each w ∈ ^M W gives support conditions on toroidal compactifications of the ordinary Igusa formal schemes IG_{K^pK_{p,P}}, chosen along the Hecke correspondences of t ∈ T^+(Q_p). The theory attached to w is the ordinary part of the cohomology with these supports. The support condition itself is not canonical, but all suitable choices give the same ordinary part (Remark 1.3.2, §2.11).

**Theorem 1.4.3 (p. 5).** The complexes RΓ_w(K^p, cusp/∅) ∈ D(Z_p[T(Q_p)] ⊗ T^sph) satisfy:
1. they are admissible (Proposition 5.2.7);
2. for g = 1, 2, RΓ_w(K^p, cusp) has amplitude [0, ℓ(w)] and RΓ_w(K^p) has amplitude [ℓ(w), g(g+1)/2] (Proposition 5.6.3; conjectured for all g in Conjecture 5.6.1, and proved for w = Id and w = w_0^M);
3. the same amplitudes hold rationally for all g (Corollary 6.2.17);
4. classicality in regular weight: RHom_{T_{K_p}}(ν, RΓ_w(K^p)) computes the ordinary part of RΓ(S^tor_{K^pK_p}, ω^κ) for κ = −w_{0,M}w(ν + ρ) − ρ, after extending scalars to Q_p(ζ_{p^n}) (Corollary 4.5.5);
5. in any weight, a Cousin spectral sequence computes that ordinary part from the RΓ_w with w ∈ C(κ) (Theorem 4.5.2).

**Families and duality.** Over Λ = Z_p⟦T(Z_p)⟧ the perfect complexes M^•_w and M^•_{w,cusp} interpolate these ordinary parts at every locally algebraic dominant weight (Proposition 1.4.7). Their ordinary Hecke algebras T_w are finite over Λ. Serre duality gives a perfect pairing M^•_w ⊗_Λ M^•_{w_{0,M}ww_0,cusp} → Λ[−d] (Theorem 1.4.8; Theorem 5.5.2 in §5.5). It is Λ-bilinear only after the Λ-structure of the second factor is twisted by the involution t ↦ w_0t^{−1} (sourceIssues E7).

**Higher Coleman theory.** The slope-0 part of higher Coleman theory ([BP21]) is the rational part of higher Hida theory (Theorems 6.2.9 and 6.2.15). The integral lattices this provides prove the slope bounds conjectured in [BP21] (Conjectures 5.9.2 and 6.8.1; Theorem 1.4.10), so the small-slope condition can replace the strongly small one in the classicality and vanishing theorems of [BP21] in the Siegel case.

**An application.** For Γ = {γ ∈ Sp_{2g}(Z), γ ≡ 1 mod N} with p | N, the ordinary part of H^i(Γ, Q_p) vanishes for 0 ≤ i < g(g+1)/2 (Theorem 1.5.1). This is the p-adic counterpart of the expectation that the tempered part of H*(Γ, Q) lies in degrees ≥ g(g+1)/2.

**The main steps.**
- **§2.** An abstract formalism of cohomology with partial support on compactifications of schemes, in the solid quasi-coherent formalism of Clausen–Scholze:
  - cohomological correspondences and dynamic (expanding and contracting) compactifications;
  - ordinary parts, perfect complexes and base change, duality;
  - the spectral sequence of a filtration (the Cousin spectral sequence);
  - compact correspondences, and control theorems for a change of support.
- **§3.** The Siegel Shimura varieties and their Hodge–Tate period map. The ordinary Igusa formal schemes form a tower of smooth formal schemes over the finite-level groups K_{p,P} ⊆ P′(Q_p), with partial toroidal compactifications.
- **§4.** The Siegel variety of deep Iwahori level and its integral models. The Hecke correspondences at p and their dynamics, controlled by Fargues's degree function. An integral cohomological correspondence from the fundamental class of Fakhruddin–Pilloni. Higher Hida cohomology in a fixed weight, and the Cousin complex.
- **§5.** Interpolation over the weight space: admissibility, the control theorem, the ordinary Hecke algebras, duality, and the case of GSp₄.
- **§6.** Overconvergent cohomology with support, integral overconvergent cohomology, and the comparison with higher Coleman theory.

**Relation to Pilloni (2020).** For g = 2 the complex M⁰ → M¹ of [Pil20] (extracted as PAPER-PILLONI-20) interpolated one line of singular weights. The paper states (p. 2) that the higher Hida theories for H⁰ and H¹ extend these modules over the whole weight space. The body develops the theories over the whole weight space but writes no comparison with the complex of [Pil20] (recorded in `sourceIssues`).

## What the libraries and the atlas already have

The extraction has 417 items: 8 are in the libraries, 37 are planned in atlas layers, and 372 are missing. Every item was checked against Mathlib 082e2d3 and Tau Ceti f790474, reading the statements in the Lean files, and against the atlas, including the draft roadmaps in `research/blueprint/roadmaps/`.

**The libraries** have only foundations:
- noetherian affine bases, proper, separated and finite-type morphisms (the standing assumptions of §2 and the notion of a correspondence);
- ideal sheaves and their supports (set-theoretic inclusion of closed subschemes);
- Nakayama's lemma, the structure of artinian rings, and stupid truncations of complexes;
- integral closure along smooth base change (Stacks Tag 03GE).

Neither library has solid quasi-coherent sheaves, cohomology with support on compactifications, Siegel modular varieties at deep level, Igusa varieties, or anything of p-adic families.

**Planned in the atlas.** The planned items are spread over 27 roadmaps. The main owners are:
- the draft SolidAnalyticRings (12 references) and AnalyticStacks (5): solid modules, idempotent algebras and localization triangles, solid tensor products, and finiteness of coherent cohomology;
- PELModuli (8), ShimuraData (7), ShimuraVarieties and ShimuraCompactifications: GSp_{2g}, the Siegel datum and its parabolic, the Siegel moduli space and its smoothness at hyperspecial level, toroidal compactifications;
- PadicMeasuresIwasawaAlgebras (6) and LocallyAnalyticDistributions: Iwasawa algebras, continuous functions and the analytic weight space;
- DeformationAndDerivedPatchingAlgebra (5): pseudo-coherent and perfect complexes and minimal representatives;
- AdicCoefficientsAndComparisons (4): compactifications of schemes and Nagata's theorem;
- PerfectoidShimuraVarieties and HodgeTateAndCanonicalSubgroups: the Hodge–Tate period map and its equivariance;
- ReductiveGroupsPartII and SmoothRepresentationsOfLocalGroups: Iwahori subgroups, the monoid T^+(Q_p), Jacquet modules and spherical Hecke algebras;
- smaller contributions from the Tau Ceti roadmaps (JacobianChallenge, ReductiveGroups, ModularCurves, StableReduction, ProfiniteProPGroups) and from AdicSpacesPartII, CompletedCohomologyPartII, FiniteFlatGroupsAndIntegralPadicHodgeTheory, BunGAndNewtonStrata, VStackSheavesAndLisseCategories, AlgebraicModuliForArithmeticGeometry, AutomorphicFormsOnReductiveGroups and FoundationsAndLibraryIntegration.

**Missing.** No layer plans:
- cohomology with partial support for correspondences on compactifications, with dynamic (expanding and contracting) compactifications and their ordinary parts;
- the Kostant set ^M W for GSp_{2g} with its Bruhat strata on the flag variety, beyond the GSp₄ entries of earlier extractions;
- ordinary Igusa formal schemes of Siegel varieties at finite level, their partial compactifications and their Hecke correspondences (the atlas's Igusa roadmap treats a unitary datum);
- integral models of Siegel varieties at deep Iwahori level with Hecke correspondences at p and their degree dynamics;
- higher Hida theory for GSp_{2g}: admissible complexes, control, the Cousin spectral sequence, families over the whole weight space, ordinary Hecke algebras and duality;
- the comparison with higher Coleman theory and the resulting slope bounds.

## Routes

The 372 missing items go to 22 routes: additions to four proposals made by other extractions, one new Part II, and 17 source routes. Each brief states the final results as printed and then the corrections, with their `sourceIssues` numbers, that the design job must apply. Nothing is claimed to be formalised.

**1. Addition to HigherHidaAndColemanTheory, the Part II of PadicFamilies proposed by PAPER-PILLONI-20: "Hida and Coleman families, period modules, and family L-functions, Part II: higher Hida and higher Coleman theory for coherent cohomology" (247 items).**
- **Scope.** This is the paper's core:
  - the abstract theory of cohomology with partial support for dynamic correspondences on compactifications: ordinary parts, perfect complexes and base change, duality, iterated correspondences, compact correspondences and control theorems for a change of support (§2), as the roadmap's new foundation;
  - the strata and support conditions attached to each w ∈ ^M W (the set itself comes from ShimuraData), ordinarity in weight κ, and the degree dynamics of the Hecke correspondences at deep Iwahori level (§§1.3, 4.1–4.3);
  - higher Hida cohomology in a fixed weight and the Cousin complex (§§4.4–4.5, Theorem 4.5.2);
  - higher Hida complexes over Z_p⟦T(Z_p)⟧: admissibility, the control theorem, ordinary Hecke algebras, Serre duality and the case g = 2 (§5);
  - the comparison with higher Coleman theory, the slope bounds of [BP21] and the vanishing theorem for Sp_{2g}(Z) (§§6, 1.5).
- **Why here.** Pilloni's brief treats GSp₄ along one line of weights and names this paper as the future source that extends the families over the whole weight space. This paper does that for every g, so it joins the same Part II rather than proposing a rival one. The §2 formalism is specific to higher Hida and Coleman theory; its general six-functor inputs go to AnalyticStacks by source.

**2. Addition to IntegralCoherentHeckeComplexes, the Part II of AutomorphicBundles proposed by PAPER-CALEGARI-GERAGHTY-18 and joined by PAPER-CALEGARI-GERAGHTY-20 and PAPER-PILLONI-20 (20 items).** General coherent cohomology of automorphic bundles and of cohomological correspondences, not specific to the higher Hida argument:
- solid cohomological correspondences T : p₂*F → p₁^!F, their restriction to strata and completions (Proposition 2.9.9), coefficient change, Tor-independent base change, twists and the transpose (§§2.6–2.8);
- the torsor M_dR and the integral bundles ω^κ (§4.3.1), Lemma 2.6.11 and Lan's relative vanishing;
- the Hecke action of G(A_f) on the complexes of §1.1, and their automorphic description (Su, Harris).

It brings new imports from AnalyticStacks (AS.0, AS.3), SolidAnalyticRings SA.3, ShimuraData D3, LanglandsParameterStacks LP3 and AdicSpacesPartII R3.

**3. Addition to ShimuraVarietiesHondaTatePartII, the Part II of ShimuraVarieties on integral models and reduction proposed by other extractions (4 items).** De Jong's stacks A_{g,d} with p | d allowed, their type and ordinary loci, normalized integral Siegel models at any level at p (over Z_p and Z_p^cycl), and the Iwahori model of level p^n with its self-dual chain and flag (§§3.4.19–3.4.22, 4.1.1).

**4. Addition to ShimuraCompactificationsPartIIHodgeTypeIntegralBoundary, the Part II of ShimuraCompactifications proposed by PAPER-FARB-KISIN-WOLFSON-24 and joined by PAPER-MAULIK-SHANKAR-TANG-22 and PAPER-PILLONI-20 (2 items).** Toroidal compactifications over Z_p of A_{g,d} with p | d, the normalization models S^tor_{K^pK_p} built from them, and the extension of the Iwahori isogeny chain over the boundary, with the kernels Gr_i quasi-finite and flat (§3.4.23, §4.1.1). It extends to every genus and every level at p the GSp₄ layers that PAPER-PILLONI-20 added to that proposal.

**5. New Part II of IgusaVarietiesAndTorsionConcentration: IgusaVarietiesAndTorsionConcentrationPartIISiegelOrdinary, "Igusa varieties, compactified period fibers and torsion concentration, Part II: ordinary Igusa formal schemes of Siegel varieties" (31 items).**
- **Scope.** The ordinary Igusa tower of GSp_{2g} over Z_p (§3.4):
  - the polarized ordinary p-divisible group and its group J_ord of self-quasi-isogenies;
  - the level groups of P′(Q_p) and their flat closures;
  - the finite-level Igusa formal schemes of Proposition 3.4.9 and the Frobenius-limit construction;
  - their Hecke correspondences and partial toroidal compactifications;
  - the open embeddings into the integral Siegel models (Lemmas 3.4.20, 3.4.24).
- **Why a new Part II.** The parent's Igusa stages (IG.0–IG.3) are restricted to the split unitary datum of Caraiani–Scholze and to central leaves in characteristic p. The Part II proposed by PAPER-CARAIANI-SCHOLZE-17 goes towards compact unitary data. No layer plans the Siegel ordinary tower. It must sit upstream of HigherHidaAndColemanTheory and of SiegelModularFormsModPn, which should import it rather than build its own GSp₄ tower.

**Source routes (68 items).** Each reason names the covering phrase of the stage description, what the layer must add for this paper, and the sources to add. The main ones:
- *AnalyticStacks* (27, draft roadmap): the six-functor inputs of §2 (solid quasi-coherent sheaves, proper and flat base change, localization and supports, the limit and colimit forms of j_! and j_*, the Cousin spectral sequence, comparison with Hartshorne's compact support), mostly in AS.3.
- *ShimuraData* (9): the root datum of GSp_{2g}, its dominant cones and the Kostant set ^M W in GSp_{2g} coordinates (D5); the general Kostant combinatorics (the M-dominant cone as a union of Weyl translates, the involution w ↦ w_{0,M}ww_0) and the Bruhat stratification of P\G with its Schubert varieties (D3).
- *AdicCoefficientsAndComparisons* (4), *SchemeAndStackFoundations* (4), *SolidAnalyticRings* (4, draft): compactifications and strict maps, quotients, solid tensor products.
- The remaining 20 items go to twelve smaller routes: CompletedCohomologyPartII, HodgeTateAndCanonicalSubgroups, AlgebraicModuliForArithmeticGeometry, AutomorphicFormsOnReductiveGroups, DeformationAndDerivedPatchingAlgebra, ShimuraCompactifications, AbelianSchemesAndArithmeticModuli, AdicSpacesPartII, FoundationsAndLibraryIntegration, IntegralHeckeAndGaloisDeterminants, PerfectoidShimuraVarieties and SmoothRepresentationsOfLocalGroups.

## Mistakes found in the paper

`sourceIssues` records 133 mistakes: 91 misprints, 14 errors and 28 gaps. Of these, 14 affect a stated result, 24 affect a proof, and 95 affect nothing downstream. No erratum or correction to the paper exists, and no later work reports any of these mistakes. All are recorded against the authors' version of 5 November 2025. The published text could not be compared. The earlier preprint was consulted at the place of every mistake: 86 of the records say that it has the same text.

**How they were checked.**
- Eight section readers, eight independent statement checkers and three whole-paper hunts proposed 229 candidates. De-duplication reduced them to 157 distinct ones.
- Every candidate was checked again on the rendered page of the authors' version, and in the 2024 preprint at the same place.
- Each error and gap had two independent verifications. Candidates from the hunts had already been checked by a hunt verifier and got one further verifier who tried to defend the paper and traced the consequences; the others got two, one reading the printed text and redoing the mathematics, the other trying to defend the paper. Misprints were verified in batches.
- 8 candidates were rejected because the paper is right as printed or under its own conventions.
- On six candidates the two verifiers disagreed; they are recorded at the reach the confirming verifier's argument supports. Where the two verifications of an accepted mistake disagreed on its kind or reach (nine records), a separate reconciliation with its own check settled it.
- A final pass merged 17 records that described the same slip into the records they duplicate, and added one misprint found by comparing the final version with the preprint (E127).

**Stated results affected.**
- **Theorem 1.3.8** (p. 4): the cohomological degree ℓ(w) does not by itself characterise the limit of discrete series π∞(κ, w); the uniqueness clause must go (E5).
- **Theorem 1.4.8 = Theorem 5.5.2** (Serre duality, pp. 5, 57): the pairing M^•_w ⊗_Λ M^•_{w_{0,M}ww_0,cusp} → Λ[−d] is Λ-bilinear only after twisting the Λ-structure of one factor by the involution induced by t ↦ w_0t^{−1} (E7).
- **Proposition 2.2.10** (p. 14): the indices 1 and 2 on the two middle terms of the second diagram are swapped (E21).
- **Corollary 2.3.14** (p. 17) needs a compatibility of the given maps with O_X̄ → O_X̄(D₊) and O_X̄(−D₋) → O_X̄, which the proof assumes (E25).
- **§2.6.12** (pp. 22–23): the second base change formula needs C, not only X, to be tor-independent from S′ (E35).
- **Proposition 2.9.9** (pp. 28–29) needs p₁ proper (E42). **Lemma 2.10.1(4)** (p. 29) needs 𝓕 bounded below (E45). The standing hypotheses of §2.11 (p. 31) interchange p̄₁ and p̄₂ (E48).
- **The concrete description of ^M W for GSp_{2g}** (p. 34) uses the wrong total order on {1, …, 2g}; the right order is g+1 ≺ … ≺ 2g ≺ 1 ≺ … ≺ g (E53).
- **Proposition 3.4.9(5)** (p. 37) names M_{K_{p,P}} where the image of K_{p,P} in M(Q_p) is meant (E58). **§3.4.19** (p. 40) defines A_{g,δ} by an étale-local condition that must be fppf-local when p divides some δ_i (E63).
- **Proposition 4.1.13(2)** (p. 42): the emptiness criterion holds only on the special fibre (E70), and the open-immersion claim for the final blow-up holds only for k = g − 1, g; for g ≥ 3 and k ≤ g − 2 it can fail (E72).
- **Corollaries 4.5.4 and 4.5.5** (p. 52): κ must range over the M-dominant cone X*(T)^{M,+} (E101).

**Proofs affected; the results are expected to hold.**
- **§2 (the formalism).** Lemma 2.1.6 cites the wrong Stacks tag and needs flattening by blow-up (E12); the proof of Lemma 2.1.34 compactifies X′ and C′ separately and never constructs the maps p̄′₁, p̄′₂ of its diagram, which can fail to exist (E19); Proposition 2.3.13 needs the targets uniformly bounded below (E26); Lemma 2.4.4 is used for limits of colimits it does not cover (E27), and the ordinary part is not functorial in the triangulated setting the paper names, only in the ∞-categorical one its footnote asks for (E28); the last step of Lemma 2.4.6 cites a lemma for bounded complexes (E29); Proposition 2.7.2 needs an extra argument (E36), and Lemma 2.10.1(3) needs U ⊆ Z to hold scheme-theoretically (E43); the proof of Lemma 2.10.2 equates cohomology on the closed set X̄ ∖ D̊′₊ with cohomology on X̄ by equalities that are false as printed, and never gives that set a scheme structure (E46, an error).
- **§4 (deep Iwahori level).** The Cartier divisors of §4.1.8 are defined from kernels that are finite only over the interior (E67); the decomposition in the proof of Proposition 4.2.4 exchanges two subscripts (E75); the proofs of Corollary 4.2.10 and Proposition 4.2.15 assert that p⋆₁H is a BT_n, more than the degree statement they prove and use (E77), and the reduction to codimension 1 in Corollary 4.2.10 does not prove its "Moreover" containment, which Lemma 4.4.2 uses (E81); Lemma 4.3.6 (E86), Corollary 4.4.3 (E93, an error in the first step), Proposition 4.4.5 (E99) and the proof of Theorem 4.5.2 (E100, E102, E103) leave steps unproved, including the vanishing of the ordinary part of the E₁ terms with w ∉ C(κ).
- **§5–6.** Proposition 5.2.3 needs T_w(Z_p) to normalise K_{p,P} (E106); the proof of Proposition 5.6.3 for g = 2 twists along the wrong divisor (E113); Proposition 6.1.7 compares support conditions through their union where their intersection is needed (E115); the proof of Proposition 6.1.11 bounds each set of the intersection but never computes the intersection or proves the reverse inclusion (E119); Corollaries 6.2.10 and 6.2.16 omit the cone argument, the cuspidal analogues of Theorems 6.2.9 and 6.2.15, and the duality argument that the [BP21] conjectures need (E126).

**Errors that affect nothing downstream:** "automorphic" where "cuspidal automorphic" is meant after Theorem 1.3.8 (E6); the relation between p̄₁⋆D and p̄₂⋆D in Example 2.1.21, which is an inequality (E16); the second inequalities of Proposition 6.2.3(2)–(3), which hold only as inclusions of supports (E122).

**Misprints of note.**
- **Introduction:** M_µ is called "the unipotent radical of P_µ" where the Levi is meant (E1).
- **References to [BP21]:** some cite the numbering of the revised Higher Coleman theory rather than arXiv v1 (E114).
- **Theorem 6.2.9:** the proof still ends with "a lattice in the finite slope part", a leftover of the preprint's statement, although the statement now concerns the slope ≤ h part (E127).

## Notes for the reviewer

- **Version.** Every item, locator and mistake refers to the authors' version of 5 November 2025, which HAL reproduces. The published Invent. Math. text is paywalled; its reference list and footnotes match. A reviewer with access to the published version should check the locators, and the recorded mistakes that affect results, against it.
- **Joined proposals.** Routes 1–4 use the ids, parents and titles of proposals made by other extractions:
  - HigherHidaAndColemanTheory (PAPER-PILLONI-20);
  - IntegralCoherentHeckeComplexes (PAPER-CALEGARI-GERAGHTY-18, -20 and PAPER-PILLONI-20);
  - ShimuraVarietiesHondaTatePartII (PAPER-KISIN-MADAPUSIPERA-SHIN-22 and several joiners; this brief uses the title "…, Part II: integral models and reduction" of the PAPER-FARB-KISIN-WOLFSON-24 and PAPER-PILLONI-20 briefs);
  - ShimuraCompactificationsPartIIHodgeTypeIntegralBoundary (PAPER-FARB-KISIN-WOLFSON-24, PAPER-MAULIK-SHANKAR-TANG-22, PAPER-PILLONI-20).

  Each brief lists what this paper adds; the maintainer merges each set of briefs into one design job.
- **Import directions.** ShimuraVarietiesHondaTatePartII and ShimuraCompactificationsPartIIHodgeTypeIntegralBoundary are upstream; the new Igusa Part II imports them and never HigherHidaAndColemanTheory or SiegelModularFormsModPn; IntegralCoherentHeckeComplexes is upstream of HigherHidaAndColemanTheory and imports AnalyticStacks AS.3; HigherHidaAndColemanTheory imports all four. SiegelModularFormsModPn (proposed by PAPER-CALEGARI-GERAGHTY-20; the PAPER-PILLONI-20 brief that joins it plans the ordinary Igusa tower of the Siegel threefold) should import the genus-g ordinary Igusa tower from the new Igusa Part II instead of building its own.
- **Ownership questions for the maintainer.** The general statement that the Kostant representatives W^P form coset representatives now has two pending owners: ShimuraData (through PAPER-CALEGARI-GERAGHTY-20 and this paper) and PotentialAutomorphyInfrastructure (through PAPER-ALLEN-ETAL-23). The source routes widen some stages: AnalyticStacks AS.3 gains supports and the Cousin spectral sequence (its design may want a substage for coherent supports), ShimuraData D3 gains the Bruhat stratification over Z, and SmoothRepresentationsOfLocalGroups SR.2 gains Casselman's canonical lifting.
- **Conjectures.** Conjecture 5.6.1 (integral amplitude for every g and w) and the [BP21] conjectures are recorded as Prop-valued statements; the Siegel cases of [BP21] Conjectures 5.9.2 and 6.8.1 are proved here, with the gaps recorded in E126.
- **Relation to Pilloni (2020).** The introduction says that Pilloni's complex M⁰ → M¹ extends over the whole weight space, but the body writes no comparison; the brief of route 1 states only what is proved and claims no identification with Pilloni's Klingen-level complex, and E2 records the gap.

## How this was done

**Reading the paper.** The authors' version was read in full in eight overlapping section clusters. For each cluster:
- one reader extracted every definition, construction and key result, with its exact statement and locator;
- a second reader checked the statements independently against the page images, correcting 51 statements and proposing 38 missing items;
- a third reader decided library and atlas status, reading the Lean declarations at the pinned commits, the atlas stage descriptions, the draft roadmaps and the reviewed decomposition nodes.

Of the 38 proposed items, 4 duplicated items already extracted and 24 were proof steps, remarks with nothing to formalise, or restatements of existing items; 10 were kept. A de-duplication pass removed 50 duplicates across cluster boundaries (after 12 within clusters), leaving 417 items.

**Routing.**
- One router per cluster assigned every missing item to a route. A critic checked the whole assignment for consistency and PROTOCOL 15, made 13 changes, and confirmed that the new Igusa Part II is needed.
- One writer per route wrote the briefs. An adversarial checker read each against the page images and the atlas and found 63 problems in the five briefs, and a reviser applied the fixes.
- The 17 source-route reasons were written, checked (21 problems) and revised the same way.

**Mistakes, inputs and literature.**
- Mistakes were found and verified as described above: 65 hunt verifications, 91 further independent verifications and 11 batches of misprints, then a consolidation pass with 23 checked rewrites.
- All 34 references were checked against Crossref and the arXiv API, and against the atlas bibliography, queue and extracted papers. The 15 that the paper uses essentially and the atlas does not yet cover, or covers only for another purpose, are listed as prerequisites.
- The later literature was searched for corrections. Every source is listed in `readSections`.

**Checks and Lean.**
- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BOXER-PILLONI-26.result.json` reports ok.
- `python3 research/blueprint/intake.py check-files` passes on the two deliverables.
- No Lean was written. A paper extraction has no Lean deliverable, and nothing is claimed to be formalised.
