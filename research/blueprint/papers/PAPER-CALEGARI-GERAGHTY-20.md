# PAPER-CALEGARI-GERAGHTY-20: Calegari–Geraghty (2020), minimal modularity lifting for nonregular symplectic representations

Frank Calegari and David Geraghty, *Minimal modularity lifting for nonregular symplectic representations*, with an appendix by Frank Calegari, David Geraghty and Michael Harris, Duke Mathematical Journal 169 (2020), no. 5, 801–896, [doi:10.1215/00127094-2019-0044](https://doi.org/10.1215/00127094-2019-0044). Preprints: arXiv:1907.08691 (main text) and arXiv:1907.08694 (appendix, "Bloch–Kato conjectures for automorphic motives").

Job PAPER-CALEGARI-GERAGHTY-20 (issue #1324), Claude Code, session cc-72825f.

## The version read

**The published article.** Calegari's research page links Duke's typeset advance-publication version, `papers/Siegel.pdf`: 96 pages, created 19 February 2020, the day after the article first appeared on Project Euclid. Its SHA-256 is fff305877c7e6b9d32ca9a8b4a56f7f3b343695fc737184d1a3a1b78f195cfa5. The copy is paginated 1–96, and its page n is page 800 + n of the journal. The paper was read in full from this copy. **Every locator gives published pages (801–896), or arXiv pages labelled as such.** Quotations in `printed`, and some `reason` fields, keep the copy's own page numbers (add 800). A reader using the author's copy subtracts 800. The bibliography's back-references ("(6, 40, 54, 55)") use the copy's own page numbers and are quoted as printed.

**The preprints.**
- arXiv:1907.08691v1 (19 July 2019, 60 pages) is the only version of the main text. A word-level comparison with the published main text gives a similarity of 0.89. The differences found are layout and copy-editing, plus one changed citation: [27], Flander's thesis, where v1 cited unpublished work of Ghitza.
- arXiv:1907.08694v1 (10 pages) is the only version of the appendix.
- The verifiers consulted both preprints at the place of each recorded mistake and say in the entry whether the preprint has the same text.

## What the paper proves

**The setting.** Take an ordinary representation r: G_Q → GSp₄(Q̄_p) with Hodge–Tate weights [0, 0, j−1, j−1]. Such representations should come from Siegel modular forms of weight (j, 2): holomorphic limits of discrete series, which occur in the coherent cohomology of Siegel threefolds but not in their Betti cohomology. As for weight-one modular forms, the Hecke modules live in two degrees, coherent H⁰ and H¹ (defect l₀ = 1). The Taylor–Wiles method alone does not apply, and the paper applies the method of Calegari–Geraghty, *Modularity lifting beyond the Taylor–Wiles method* (Invent. Math. 2018; PAPER-CALEGARI-GERAGHTY-18).

**The main results.**
- Theorem 1.1 (p. 802) is a modularity theorem: under conditions (1)–(5), with p − 1 > j ≥ 4, r is modular, i.e. L(r, s) is the spinor L-function of a cuspidal Siegel eigenform of weight (j, 2).
- Theorem 1.2 (p. 803) and its precise form, Theorem 9.1 (pp. 878–879): minimal R = T and freeness for the ordinary (α,β)-part of H⁰(Y₁(N), ω(j,2) ⊗ K/O)^∨.
  - Theorem 9.1 is stated for weight (a, 2) with p − 1 > a ≥ 2. Its hypothesis (6) asks for the vanishing of the localised H² of ω(a,2)(−∞) at Taylor–Wiles levels.
  - For a ≥ 4 that vanishing follows from Lan–Suh (Theorem 5.1; Remark 7.8).
  - For a = 2, the case of abelian surfaces, it is open (Assumption 7.7). §1.2 (p. 804) expects only the weaker vanishing of the localised interior H², and does not prove that this suffices (E5). §1.3 and Calegari's ICM 2022 survey say the vanishing conjecture "remains unresolved".
  - So in weight (2, 2) the theorem is conditional.

**The main steps.**
- **§§3–4.** Balanced modules and patching, quoted from CG18, and GSp₄-valued deformation theory: minimal and ordinary conditions, the types of Assumption 4.3, Taylor–Wiles primes after Pilloni and Genestier–Tilouine, and tangent spaces (Proposition 4.9).
- **§5.** Siegel threefolds and their automorphic bundles ω(a,b):
  - vanishing theorems (Theorem 5.1 and Corollary 5.8, from Lan–Suh);
  - Harris's description of coherent cohomology by (𝔭⁻,K)-cohomology (Theorem 5.2);
  - which (limits of) discrete series contribute (Theorems 5.5–5.6);
  - Hecke operators and the Hecke algebras (Definition 5.13).
- **§6.** Galois representations over the torsion Hecke algebras:
  - multiplication by Hasse-invariant powers (§6.1) moves torsion classes to regular weight;
  - there Galois representations are known (Weissauer, Taylor, Laumon; Mok; Sorensen for local–global compatibility), and Theorem 6.13 glues them;
  - Theorem 6.17 gives the minimal deformation over the Hecke algebra in the non-regular weight (a, 2), which needs local–global compatibility at p for torsion classes.
- **§7.** The Taylor–Wiles levels and the balanced property of the localised H⁰ (Theorem 7.11). The proof uses Arthur's classification of the discrete spectrum of GSp₄, which §1.4 notes was conditional at submission; Gee–Taïbi (2019) is cited for its status.
- **§8.** The local–global compatibility at p needed by Theorem 6.17 is proved "by hand" from q-expansions: Theorem 8.13, a "tripling" at spherical level (Remark 8.18). The inputs are:
  - formal Hecke operators at p on Siegel q-expansions (§§8.2–8.4);
  - theta operators and their injectivity (Theorems 8.10–8.11, after Yamauchi);
  - a combinatorial analysis with binary quadratic forms (§§8.7–8.9, Theorem 8.22, Proposition 8.25).
- **§9.** Patching (Proposition 3.3 = CG18 Proposition 2.3) gives Theorem 9.1.

**The appendix (Calegari–Geraghty–Harris).** It deduces cases of the Bloch–Kato conjecture for adjoint motives from R = T = O:
- Theorem A.1 (p. 881): H¹_f(Q, asp⁰(r) ⊗ Q_p/Z_p) = 0 for a semistable modular abelian surface A/Q with End(A) = Z and a density-one set of ordinary, p-distinguished primes p. It uses Theorem 9.1 in weight (2, 2). For p large, Lemmas A.5–A.6 are meant to supply its vanishing hypothesis, but as printed they treat the canonical ω², not ω(2,2)(−∞) (E150).
- Theorem A.2 (pp. 881–882): the vanishing of H¹_f(F, ad⁰(r) ⊗ K/O) for regular algebraic cuspidal π of GL(n) over a CM field F. It is conditional on all of CG18's Conjecture B except part (4), and follows from CG18 Theorems 5.16 and 6.4.

**Later work.** No erratum or correction exists, and no later work reports a mathematical error.
- Boxer–Calegari–Gee–Pilloni (arXiv:1812.09269), building on Pilloni's higher Hida theory (Duke 2020), avoid the weight (2, 2) vanishing conjecture. BCGP note that it "was not established in weight 2" here, and Pilloni writes that "nobody has been able to establish this vanishing for the moment".
- BCGP describe the paper's q-expansion argument as "labyrinthian" and replace it with a geometric doubling argument at Klingen level. The paper itself notes (p. 805) that neither result implies the other.

## What the libraries and the atlas already have

The extraction has 397 items: 5 are in the libraries, 78 are planned in atlas layers, and 314 are missing. Every item was checked against Mathlib 082e2d3 and Tau Ceti f790474, reading the statements in the Lean files, and against the atlas at tauceti-explorer 06abef0. The atlas data are unchanged at the current main, 3c646c7.

**The libraries** have only small general facts:
- symmetric and determinant powers of the standard representation, and their functoriality in the monoid M₂(Z) (the weight representation U of §8 and its extension ρ);
- socles and essential submodules, used to reduce injectivity to the residue field;
- discriminants of binary quadratic forms and Legendre symbols;
- Hensel's lemma.

Neither library has GSp₄ as a similitude group scheme, Siegel modular varieties, automorphic bundles, coherent cohomology of Shimura varieties, Galois deformation rings or anything specific to the paper. Mathlib has only the matrix group Sp_{2n}, and Tau Ceti only the Sp_{2m} group scheme.

**Planned in the atlas.** The planned items are spread over about forty roadmaps. The main owners are:
- *AutomorphicBundles* (16 references), *ShimuraCompactifications* (11), *PELModuli* (9) and *ShimuraData* (16) plan the Siegel threefold itself. They cover:
  - its moduli problem and integral toroidal compactifications;
  - the automorphic bundles ω(a,b) and their canonical and subcanonical extensions;
  - the Siegel datum, its Hodge cocharacter, K_∞, the compact dual and the K^h-weights;
  - classical Siegel forms. Their spinor L-function is planned at AutomorphicLFunctionsAndLocalFactors AL.4, with SmoothRepresentationsOfLocalGroups SR.4.

  For automorphic bundles these layers go no further than spaces of sections. None of them has higher coherent cohomology with torsion coefficients.
- *DeformationAndDerivedPatchingAlgebra* (9) plans the commutative algebra of §3. The defect, balanced modules and Proposition 3.3 (CG18 Proposition 2.3) are the reviewed node R03.5/balanced-modules-and-module-patching, which PAPER-CALEGARI-GERAGHTY-18 also cites. Minimal resolutions are in P7/R03.3, and CG18 Theorem 6.4 in R03.6.
- The Tau Ceti roadmaps *ReductiveGroups*, *ClassFieldTheory*, *RepresentationTheory* and *Chebotarev* (about twenty references between them) plan the structure theory of GSp₄, local Tate duality, highest weights and Chebotarev density.
- *ArithmeticGaloisRepresentations*, *ArithmeticGaloisDuality*, *GlobalGaloisDeformations* and *LocalGaloisDeformationRings* plan the generic Galois-cohomology inputs: Selmer groups, the Greenberg–Wiles formula, tensor induction, enormous image and formally smooth local deformation rings. *FiniteFlatGroupsAndIntegralPadicHodgeTheory* (5) plans the finite flat Ext groups.
- *PeriodsAndSpecialValues* (7), *SelmerIwasawaCohomology* and *MotivesAndAlgebraicCycles* plan the Bloch–Kato and Deligne conjectures and the adjoint motive of the appendix.
- *ModularityAndLanglandsExtensions* (6) and *AutomorphicGaloisRepresentationsPartII* (5) plan weight-one modularity and Deligne–Serre, potential modularity of symmetric powers, the automorphy conjecture for motives, weakly compatible systems and HLTT. ML.4 plans Arthur/Mok classification inputs only in general; the GSp₄ instances are missing and source-routed there.

**Missing.** No layer plans:
- GSp₄-valued (or general Ĝ-valued) deformation problems over totally real fields;
- Galois representations attached to Siegel modular forms, or local–global compatibility for them;
- coherent cohomology of Siegel threefolds with torsion coefficients: vanishing theorems, Harris's comparison, and Hecke operators in all degrees;
- Siegel modular forms modulo pⁿ: q-expansions with torsion coefficients, the genus-two Hasse invariant, and theta operators;
- torsion Hecke algebras in non-regular weight with their Galois representations;
- the balanced property and patching for GSp₄;
- Serre's open-image theorems;
- vanishing of adjoint Selmer groups from R = T.

## Routes

The 314 missing items go to 27 routes: one new roadmap, six Part IIs and 20 source routes. Each brief states the final theorems as printed and then the corrections, with their `sourceIssues` numbers, that the design job must apply. Nothing is claimed to be formalised.

**1. New: GSp4NonregularModularityLifting, "Minimal modularity lifting for GSp₄ in non-regular weight" (102 items).**
- **Scope.** This is the paper's own argument:
  - Theorems 9.1, 1.2 and 1.1;
  - the Siegel-threefold Hecke algebras and ordinary idempotents;
  - weight shifting by Hasse powers;
  - Galois representations over torsion Hecke algebras (Theorems 6.13 and 6.17);
  - the Taylor–Wiles levels and the balanced property (§7);
  - the q-expansion proof of local–global compatibility at p (Theorem 8.13 and §§8.5–8.9);
  - patching (§9).
- **Why a new roadmap.** No roadmap goes in this direction. GL2ModularityLifting and OrdinaryAutomorphicFormsAndModularityLifting are GL₂-type in defect 0. PotentialAutomorphyInfrastructure treats GL_n with complexes. The maintainer's own guide already sends the closest relative, Boxer–Calegari–Gee–Pilloni's potential modularity of abelian surfaces, to a new roadmap (DESIGN-BCGP18, AbelianSurfacesPotentialModularity). That design should import this one.
- **Conditions carried as named hypotheses.**
  - Assumption 7.7 is open in weight (2, 2), so every weight-(2, 2) output is conditional.
  - Everything from Lemma 6.9 on depends on Arthur's classification for GSp₄, whose status ModularityAndLanglandsExtensions ML.4 must record.

**2. Part II of AlgebraicModularFormsAndSerreWeights: SiegelModularFormsModPn, "… Siegel modular forms of genus two modulo p^n" (50 items).**
- **Scope.** This is the genus-two analogue of R15.2–R15.3, with O/ϖⁿ and K/O coefficients:
  - q-expansions and the q-expansion principle;
  - Fourier coefficients and the action of GL₂;
  - the Hasse invariant and multiplication by its powers and lifts;
  - the operators at p on q-expansions (Lemmas 8.3–8.8 and 8.12);
  - theta operators and their injectivity (Proposition 8.9, Theorems 8.10–8.11);
  - formal Siegel modular forms and binary quadratic forms (§8.7).
- **Why a Part II.** AlgebraicModularFormsAndSerreWeights plans exactly these objects, but for modular curves only. AutomorphicBundles B5 plans q-expansions only at modular and Hilbert cusps, with Fourier–Jacobi expansions at higher boundary strata, and no layer plans the characteristic-p operations (Hasse invariant, operators at p, theta).

**3. Addition to IntegralCoherentHeckeComplexes, the Part II of AutomorphicBundles proposed by PAPER-CALEGARI-GERAGHTY-18 (37 items).**
- **Scope.** This paper needs, in that proposal's direction:
  - Lan–Suh vanishing for torsion automorphic sheaves (Theorem 5.1, Corollary 5.8);
  - Harris's description of coherent cohomology by (𝔭⁻,K)-cohomology (Theorem 5.2) and its cuspidal, L² and tempered subspaces;
  - the contributions of discrete series and their limits (Theorems 5.5–5.6);
  - the Harris–Zucker boundary spectral sequence;
  - Hecke operators T_{x,i} and S_x on coherent cohomology with torsion coefficients (the brief takes the Siegel threefold as the acceptance example throughout);
  - Serre duality with Hecke twist, coherent homology and Hochschild–Serre.
- **Why a joined proposal.** A second Part II of AutomorphicBundles in the same direction would give these objects two owners (PROTOCOL 15). The route therefore uses the same id, parent and title as the CG18 proposal, and its brief lists this paper's additions layer by layer. The maintainer merges the two design jobs, as already happens for other Part IIs proposed by several papers.
- **Archimedean inputs** (Blasius–Harris–Ramakrishnan, Mirković, Harris's Theorem 3.4) are routed to AutomorphicFormsOnReductiveGroups AF.1/AF.4, and imported from there.

**4. Part II of SelmerIwasawaCohomology: AdjointSelmerGroupsFromModularityLifting, "… adjoint Bloch–Kato Selmer groups from modularity lifting" (18 items).**
- **Scope.** The appendix as a unit:
  - Theorems A.1 and A.2;
  - Lemmas A.3–A.8, with the large-p vanishing, density and linear-relation arguments;
  - the weight-one example.
- **Imported, not owned.** The generic steps are routed to their owners and imported: R = T = O implies Selmer vanishing (GlobalGaloisDeformations R04.3), and descent along extensions (SelmerIwasawaCohomology L2/L4).
- **Why here.** SelmerIwasawaCohomology owns Selmer structures and the Bloch–Kato local conditions, but plans no vanishing theorem for adjoint Selmer groups.

**5. Part II of FaltingsFinitenessAndIsogenyTheorems: OpenImageTheoremsForAbelianVarieties (2 items).**
- **Scope.** Serre's open-image theorems:
  - surjectivity of ρ̄_{E,p} for p ≫ 0 for non-CM elliptic curves (used in Remark 4.12);
  - image GSp₄(Z_ℓ) for ℓ ≫ 0 for abelian surfaces with End_Q̄(A) = Z (Serre's letter to Vignéras, used in Lemmas A.7–A.8).
- **Why a Part II.** No layer owns these theorems. FaltingsFinitenessAndIsogenyTheorems R28.6 says in so many words that it works "without requiring the full Serre open-image theorem". ArithmeticGaloisRepresentations R01.4 and G7 hold only group-theoretic criteria, and putting Faltings-dependent theorems there would pull those shallow layers into the Faltings chain.

**6. Addition to AutomorphyLiftingBeyondTaylorWiles, the Part II of PotentialAutomorphyInfrastructure proposed by PAPER-CALEGARI-GERAGHTY-18 (5 items).**
- **Scope.** These are the appendix's restatements of CG18's conditional GL_n machinery:
  - Conjecture B, split into its five parts;
  - the Betti Hecke algebra of CG18 Definition 9.1, with r̄_m and m;
  - the Taylor–Wiles-level comparison;
  - CG18 Theorem 5.16.
- **Why joined.** They join CG18's proposal under the same id so that they have one owner. The appendix's own Lemma A.3 and Theorem A.4, which replace Conjecture B(4), stay in route 4.

**7. Addition to GL2ModularityLiftingDefectOne, the Part II of GL2ModularityLifting proposed by PAPER-CALEGARI-GERAGHTY-18 (1 item).** Lemma 8.14 is the weight-one GL₂ model of Theorem 8.13, and it belongs with CG18's weight-one doubling rather than in a GSp₄ roadmap.

**Source routes (99 items).** Each reason names the covering phrase of the stage description, what the layer must add for this paper, and the sources to add. The main ones:
- *GlobalGaloisDeformations* G7, R04.3, R04.4 (16 items) and *LocalGaloisDeformationRings* L7, R08.2 (9). The GSp_{2g}-valued deformation problems over totally real fields with fixed multiplier: minimal and ordinary conditions, Taylor–Wiles sets, tangent spaces and Proposition 4.9, following PAPER-BOXER-CALEGARI-GEE-25's precedent for G-valued problems.
- *ArithmeticGaloisRepresentations* G7, R01.1, R01.2, R01.4, R01.5 (13). Similitude groups, oddness, adjoint representations, big-image conditions (Assumption 4.1, Example 4.11), coefficient descent, and Carayol's uniqueness of lifts.
- *AutomorphicGaloisRepresentationsPartII* AG2.2, AG2.5, AG2.6 (10). The Galois representations of regular-weight Siegel eigenforms (Weissauer, Taylor, Laumon, Mok's Theorem 3.5) through the transfer to GL₄, with Sorensen's local–global compatibility and the symplectic sign. ModularityAndLanglandsExtensions ML.4 supplies the transfer, packets and local Langlands for GSp₄.
- *ShimuraData* D5 (9) and *AutomorphicFormsOnReductiveGroups* AF.1, AF.3, AF.4 (13). The explicit Siegel datum (roots, Kostant representatives, Weyl chambers, compact dual), discrete series and their limits, and (𝔮,K)-cohomology.
- *ShimuraCompactifications* C3–C5 (5). Independence of the toroidal compactification, the Koecher principle with torsion coefficients, Kodaira–Spencer, the Taylor–Wiles covers and the §A.3.2 set-up.
- *ModularityAndLanglandsExtensions* ML.0, ML.4 (4). Arthur's classification for GSp₄, with Gee–Taïbi as its proof source, and the conjectural weight-(2, 2) endpoint.
- Twelve smaller routes, to SmoothRepresentationsOfLocalGroups, IntegralHeckeAndGaloisDeterminants, ArithmeticLocallySymmetricSpaces, AutomorphicSpectralTheory, SelmerIwasawaCohomology, DeformationAndDerivedPatchingAlgebra, AutomorphicLFunctionsAndLocalFactors, NeronModelsAndSemistableAbelianVarieties, GL2AutomorphicRepresentationsAndTransfer, AlgebraicModularFormsAndSerreWeights, SerreWeightAndLevelOptimisation and ClassicalArithmeticCompletion.

## Mistakes found in the paper

`sourceIssues` records 155 mistakes: 98 misprints, 28 errors and 29 gaps. Of these, 11 affect a stated result, 25 affect a proof, and 119 affect nothing downstream. No erratum or correction to the paper or its appendix exists, and no later work reports any of these mistakes.

**How they were checked.**
- Eight section readers, eight independent statement checkers and three whole-paper hunts proposed 259 candidates. De-duplication reduced them to 179 distinct ones.
- Every candidate was checked again on the rendered page of the published version, and in the arXiv preprint at the same place.
- Each error and gap had two independent verifiers: one read the printed text and redid the mathematics, the other tried to defend the paper and traced the consequences. Misprints were verified in batches, one verifier each.
- 24 candidates were rejected because the paper is right as printed or under its own conventions. For example, Remark 4.12 prints "isogenous (over K̄)", and the bar is lost only in the extracted text. Likewise, Remark 8.2's standing assumption excludes the weight (3, 2) that one candidate raised against Theorem 8.13.
- On six candidates the two verifiers disagreed. All six are recorded as gaps, at the reach the defending verifier's argument supports: E51, E77, E99, E122, E125 and E132.
- One further misprint, the citation "Pilloni [56]" on p. 860 for [58], was found while the prerequisites were being checked. It was verified on the page and recorded last, as E156.

**Stated results affected.**
- **The introduction's theorems.**
  - Theorem 1.2 as printed is not what Theorem 9.1 proves. It uses all forms on the open variety rather than cusp forms (E1). It also lacks two hypotheses Theorem 9.1 uses: ν(r̄) = ε̄^{1−j} on all of G_Q, and absolute irreducibility (E4).
  - Theorem 1.1 has no written deduction from Theorem 9.1. Its hypothesis (5) uses an undefined N(r̄), and its conclusion L(r, s) = L(F, s) needs local–global compatibility at S(r̄) and at p in non-regular weight, which the paper does not supply (E3).
- **§5.** The displayed condition in Theorem 5.5 is misprinted, "μ = (a−1, b−2; c) ∉ C_i" for "(a−1, b−2; c) ∉ C_i" (E38).
- **§6.**
  - The ordinary idempotents e_β and e_{α,β}, as printed, project onto the summand where both shifted operators are invertible. That summand is disjoint from (not complementary to) the intended one, where both are topologically nilpotent (E59).
  - The coefficients claimed in Theorem 6.13(3) are not shown to lie in the Hecke algebra (E61).
- **§7.**
  - Assumption 7.1 needs the further condition α_xβ_x ≠ γ_xδ_x, which Genestier–Tilouine state (E67).
  - The "explicit inverse" d_Q^{−1}tr in Theorem 7.3 is not the inverse of pr_Q∘i (E72).
- **§8.**
  - Theorem 8.10 fails for k = p − 1 (E94).
  - The formula for θ₁ in Proposition 8.9(2) has a spurious factor det(Q) (E95).
  - Proposition 8.9 and Theorems 8.10–8.11 hold for coefficients killed by p, not over O/ϖ^m in general (E96).

**Proofs affected; the results are expected to hold.**
- **§§4–5.**
  - The proof of Example 4.11 uses an element c·(g,h) that is not in r̄(G_{Q(ζ_{p^m})}); a correct element exists (E28).
  - At type-U1 primes the paramodular level K_x = K(x) is not contained in GSp4(Z_x), S(x) should be P(x), and Y_K is then a moduli space of (1, ∏x)-polarized abelian surfaces, not a principally polarized one (E33).
  - The proof that 𝒱_σ ≅ 𝒱_{σ⊗ν} (p. 826) asserts a G(Q)-equivariant isomorphism that does not exist. The displayed map is equivariant only for Sp₄, and the isomorphism on Y(C) needs a twist by sgn ν and |ν|_f (E36).
- **§6.**
  - Lemma 6.2(2) needs a separate argument in weight (3, 3) (E53).
  - The auxiliary prime q must be at least 3 for K to be neat (E57).
  - Multiplication by A^s must be followed by the β-idempotent, as the paper itself does in Theorems 6.17 and 8.13 (E60).
  - The proof of Theorem 6.13(4) checks Definition 4.6(2)–(5) for the untwisted r_{f_i}, which fail 4.6(5) at some x ∈ Q. The check must be redone after twisting by ψ^{−1} (E62).
  - Reducedness of the Hecke algebra is used without proof (E63).
  - The Katz eigenform of Definition 6.15 must be cuspidal, or a lemma supplied (E65).
- **§7.**
  - The maximal ideal m of Theorem 7.2 must contain ⟨u⟩ − 1 (E74).
  - Lemma 7.5 needs multiplication by h̃^s to be injective on H⁰ of the non-ordinary loci S and S₀(Q) (E77).
  - Theorem 7.11 is stated with Assumption 7.7 for X_Δ(Q), but its proof uses it for X_0(Q) (E79). The corresponding check in step (c) of the proof of Theorem 9.1 is left implicit (E132, which affects nothing).
- **§8.** The q-expansion argument has several gaps and slips, each repairable from identities the paper states:
  - E98, in the proof of Theorem 8.11;
  - E107, in Lemma 8.15, where "lifting to characteristic 0" does not justify the ordinarity step;
  - E112, in Lemma 8.17(2);
  - E114 and E115, in the proof of Theorem 8.22;
  - E121 and E122, in the case σ = (2, 2), where F − X₂F is not in M and Theorem 8.22(2) as stated cannot use Lemma 8.15;
  - E125, in Proposition 8.25: once E95 is corrected, the coefficients with p | d(Q) no longer vanish automatically.
- **§9.** The patching step needs the (α,β)-summand of the Taylor–Wiles-level module to be balanced. Theorem 7.11 proves this only for the whole module, and the paper gives no argument for the summand (E131). This is the most consequential gap for the main theorem. The verifiers found two possible repairs, neither in the paper.
- **The appendix.**
  - Theorem A.4 needs r̄ absolutely irreducible (E140).
  - The Hochschild–Serre steps of Theorem A.4 and Lemma A.6 must use a p-power subcover (E142).
  - Lemma A.6 needs the vanishing of both H² and H³ (E145).
  - The proof of Theorem A.1 needs the vanishing for the subcanonical ω(2,2)(−∞), while Lemma A.6 gives it for the canonical ω² (E150).

**Errors that affect nothing downstream.** These include:
- §2's description of K^h (E11), of the kernel of exp on 𝔥_C (E14), and the claim that the positive system is "forced" (E16);
- ad(r̄) = ad⁰(r̄) ⊕ ν, where the trivial representation is meant (E18);
- the description of H¹(G_x, ad⁰ r̄) at Taylor–Wiles primes (E22);
- the eigenvalue claim in Example 4.11(1) (E29);
- the order-4 unipotent classes in S₆ and the explicit genus-two example of §5.4 (E44, E46);
- the division by p^{k+j−6} in §5.5's key property (E52);
- the parenthetical justification in Lemma 7.4 (E75, E76);
- the q-expansion principle of Theorem 8.1, which needs a cusp on each geometric component (E85);
- the valuation claim in §8.5 (E100);
- the shape of r_{Q_N}(σ) in the proof of Theorem 9.1 (E129);
- the class-group parenthetical of §A.2 (E138).

**Misprints of note.**
- Wrong references:
  - "the main theorem of [6]" for [7, Theorem 1.2] (E56);
  - "[75, Theorem 3.20]" for Yamauchi's Theorem 4.9 in the cited version (E97);
  - "Pilloni [56]" for [58] (E156);
  - "[16, Section 9.2]" for §9.4 in Theorem A.2 (E133).
- The bibliography gives the page range 137–151 for Goldring–Koskivirta [33], which is 887–984 (E154). Entry [38], Harris–Lan–Taylor–Thorne, cited only in the appendix, gives a working title (E155).

## Notes for the reviewer

- **Joined proposals.** Routes 3, 6 and 7 use the ids, parents and titles of Part IIs that PAPER-CALEGARI-GERAGHTY-18 proposes: IntegralCoherentHeckeComplexes, AutomorphyLiftingBeyondTaylorWiles and GL2ModularityLiftingDefectOne. Each brief says what this paper adds. `make_queue.py` does not merge design jobs that come from different papers, so if both extractions are accepted, the maintainer should merge each pair of briefs into one design job. Other Part IIs proposed by several papers already need the same merge.
- **Coordination with DESIGN-BCGP18.** AbelianSurfacesPotentialModularity, the maintainer's new roadmap for Boxer–Calegari–Gee–Pilloni, is still pending. It should import GSp4NonregularModularityLifting. Two dependencies run the other way:
  - Lemma A.6 and layer 6 of route 1 use BCGP Proposition 7.9.8 (the Taylor–Wiles comparison in all degrees). Route 1's brief names it and marks DESIGN-BCGP18 as its eventual owner.
  - BCGP's geometric doubling is an alternative to this paper's §8. The paper itself says (p. 805) that neither result implies the other.
- **Another Part II of the same parent.** PAPER-TSIMERMAN-18 proposes a different Part II of FaltingsFinitenessAndIsogenyTheorems, on quantitative isogeny estimates. Its direction differs from route 5 (Serre's open-image theorems), so the two do not overlap.
- **Conditional results.**
  - Assumption 7.7 is open in weight (2, 2), so every weight-(2, 2) output, Theorem A.1 included, is conditional on it or on the appendix's large-p substitute (with E150).
  - Arthur's classification for GSp₄ enters from Lemma 6.9 on. ModularityAndLanglandsExtensions ML.4 must record its current status.
  - Theorem 1.1 should be registered, at ML.1 or ML.5, only in the corrected form of E3, never as printed.
- **Status doubts.** A few items are marked missing although a planned layer comes close:
  - the GSp_{2g} ordinary condition (LocalGaloisDeformationRings L7 plans the GL_n version with a full invariant flag);
  - the (α,β)-part and its Hecke algebra (PadicFamilies L0a plans the limit projector for any operator).

  Their notes name these layers. A reviewer who prefers "planned" for these can change the status without touching the routes.
- **Text-layer artefacts.** The extracted text drops decorations: the bar in Remark 4.12's "over K̄", the subscript in "the O-rank of M_Δ" on p. 853, and primes such as μ′. Every recorded mistake was settled on the rendered page. One brief re-checker proposed a "correction" of Remark 4.12 from the text layer; it was rejected against the page image.
- **E124 withdrawn.** E124 recorded the first display of the proof of Proposition 8.25 (p. 876) as a misprint for omitting a factor det(Q), on the authority of Proposition 8.9(2). That factor is itself the error recorded in E95 (and relied on in E125), so the display is right as printed and E124 was removed in a correction after the merge. The other numbers are unchanged, so the list skips E124.
- **E156** was found outside the mistake pipeline, while the prerequisites were being checked. It was verified on the rendered p. 860, and it is recorded last so that the other numbers, already cited in items and briefs, did not change.

## How this was done

**Reading the paper.** The published article was read in full in eight overlapping section clusters. For each cluster:
- one reader extracted every definition, construction and key result, with its exact statement and locator;
- a second reader checked the statements independently against the page images, correcting 61 statements and proposing 48 missing items;
- a third reader decided library and atlas status, reading the Lean declarations at the pinned commits and the atlas stage descriptions and reviewed decomposition nodes.

Proposed items that were proof steps were dropped, and 13 were kept. A de-duplication pass then removed 72 duplicates across cluster boundaries in 60 groups, leaving 397 items.

**Routing.**
- One router per cluster assigned every missing item to a route, and a critic then checked the whole assignment for consistency and PROTOCOL 15. It corrected 15 assignments and proposed the open-image Part II.
- One writer per route wrote the briefs. An adversarial checker read each against the paper and the atlas, and a reviser applied the fixes. A second checker re-checked each revision, and its remaining fixes were applied except one, which the page image refuted.
- The 20 source-route reasons were written, checked (21 problems) and revised the same way.

**Mistakes, inputs and literature.**
- Mistakes were found and verified as described above: 88 lens verifications and 15 batches of misprints.
- All 75 references were checked against Crossref and the arXiv API, and against the atlas bibliography, queue and extracted papers. The 38 that the paper uses essentially and the atlas does not yet cover are listed as prerequisites.
- The later literature was searched for corrections and for the status of the paper's hypotheses. Every source is listed in `readSections`.

**Checks and Lean.**
- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-CALEGARI-GERAGHTY-20.result.json` reports ok.
- `python3 research/blueprint/intake.py check-files` passes on the two deliverables.
- No Lean was written. A paper extraction has no Lean deliverable, and nothing is claimed to be formalised.

