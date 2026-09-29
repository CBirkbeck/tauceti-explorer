# PAPER-SCHOLZE-13: Scholze, *p-adic Hodge theory for rigid-analytic varieties*

Peter Scholze, "p-adic Hodge theory for rigid-analytic varieties", *Forum of Mathematics, Pi* 1 (2013), e1, 77 pp., doi:10.1017/fmp.2013.1. Corrigendum: *Forum of Mathematics, Pi* 4 (2016), e6, doi:10.1017/fmp.2016.4.
Extraction by Claude Code (session `cc-f805bf`), 29 September 2026, issue #4548.

## What was read

- **The article.** I read the whole published article, pp. 1–77 (Cambridge Core open access). Every formula quoted in an item was checked on page images.
- **The corrigendum.** I read the whole four-page corrigendum. Its corrections are applied to the items.
- **The preprint.** A word-level comparison of the published text with arXiv:1205.3463v2 (3 November 2012) found only copyediting and an expanded introductory overview; no statement changed. (The independent review adds one numbering difference: the published version inserts Lemma 5.8, on completely continuous maps, so published 5.9–5.12 are arXiv v2's 5.8–5.11. Blueprint packets cite the arXiv numbers.)
- **Hash.** Cambridge stamps every download, so `sourceVersions` records the SHA-256 of the text with the stamp lines removed, together with the arXiv file hash.

## What the paper proves

**§§3–4: the site and its structure sheaves.**
- **The pro-étale site.** For a locally noetherian adic space X over Spa(ℚ_p, ℤ_p), §3 builds the pro-étale site X_proét from pro-objects of X_ét. It proves the site's coherence and slice properties and its comparison with X_ét.
- **Structure sheaves.** §4 puts the structure sheaves O_X⁺, Ô_X⁺ and Ô_X on X_proét. Over a perfectoid base field, affinoid perfectoid objects form a basis (Proposition 4.8, using Colmez), and Ô_X⁺ is almost acyclic on them (Lemma 4.10).
- **K(π,1).** Connected affinoids are K(π,1) for p-torsion coefficients (Theorems 1.2 and 4.9).

**§§2 and 5: primitive comparison and finiteness.**
- **Almost modules.** §2 develops a theory of almost finitely generated 𝒪-modules, measured by elementary-divisor invariants.
- **Theorem 5.1.** From §2 and the K(π,1) property, a Cartan–Serre-type argument proves the primitive comparison theorem: H^i(X_ét, 𝕃) ⊗ 𝒪_K^a/p ≅ H^i(X_ét, 𝕃 ⊗ 𝒪_X^{+a}/p), for X proper smooth over an algebraically closed complete K and 𝕃 an F_p-local system.
- **Finiteness.** The same theorem gives finiteness and vanishing above 2 dim X of the étale cohomology of proper smooth rigid spaces (Theorems 1.1 and 1.3). Corollary 5.12 is the relative version.

**§6: period sheaves.**
- The sheaves are A_inf, B_inf, B⁺_dR, B_dR and the structural 𝒪B⁺_dR, 𝒪B_dR.
- 𝒪B⁺_dR is defined as the corrigendum corrects it. The Poincaré lemma (Corollary 6.13) and the structure of 𝒪B_dR over small affinoids (Proposition 6.10) are proved.

**§7: filtered modules with connection.** There is a fully faithful functor from filtered modules with integrable connection to B⁺_dR-local systems (Theorems 7.2 and 7.6). The section also defines de Rham lisse ℤ_p-sheaves.

**§8: comparison theorems.**
- **Theorem 8.4.** For proper smooth X over a discretely valued k and a de Rham lisse ℤ_p-sheaf 𝕃, it gives three results:
  - the B_dR-comparison;
  - degeneration of the Hodge–de Rham spectral sequence;
  - the Hodge–Tate decomposition H^i(X_k̄, 𝕃) ⊗ k̄̂ ≅ ⊕_j H^{i−j,j}_Hodge ⊗ k̄̂(−j).

  This answers Tate's question for rigid spaces (Corollary 1.8).
- **Theorem 8.8.** A relative version.

**§9: miscellany.** Relative GAGA over an affinoid base (Köpf), and finiteness facts about affinoid algebras.

## What the atlas already has

The atlas was designed from this paper. The layers that cite it or its corrigendum already plan its headline results:
- **PadicHodgeTheory P8 and its early cut P8:local-rational.** The period sheaves, local acyclicity, the Poincaré lemma, and "the proper-smooth comparison with connection". Theorems 7.11, 8.4(b–d) and 8.8 are recorded as planned there. CohomologyComparisons CP.3 plans the constant-coefficient case.
- **AdicEtaleGeometry A1 and DiamondsAndVStacks D0.** The corrected pro-étale covers and the site axioms.
- **PerfectoidSpaces P0 and P1.** The almost category, and θ with its kernel.

Of 254 items, 58 were marked `planned` and 5 are in Mathlib (after the independent review: 168 planned, 81 missing; see the last section). The Mathlib items are the ring-level period rings (`WittVector.fontaineTheta`, `BDeRhamPlus`, `BDeRham`) and Bézout ideals of valuation rings. The remaining 191 are `missing`. Tau Ceti's adic-space library has no perfectoid or pro-étale material at the pinned commit that states any of them.

## Routes

The 191 items marked missing are the steps between the layers' headline targets; the independent review found 110 of them already planned by blueprint packets, and moved 19 integral statements to a fifth route. All of them go to existing layers as sources, and no new roadmap or Part II is proposed.

1. **PadicHodgeTheory (P8, P8:local-rational). 93 items.** They are:
   - the K(π,1) theorems (1.2, 4.9) and Lemma 4.12;
   - the primitive comparison and finiteness theorems with the whole Cartan–Serre argument (1.1, 1.3, 5.1–5.12);
   - the sheaf-level facts of §6;
   - the §7 functor and de Rham lisse sheaves;
   - the remaining parts of §8, notably the B⁺_dR comparison 8.4(a) and the lisse Ẑ_p-sheaves of Definition 8.1 and Proposition 8.2.

   Accepted extractions sent the same material here: PAPER-ZAVYALOV-25 and PAPER-BHATT-MORROW-SCHOLZE-18 (the primitive comparison and finiteness) and PAPER-CARAIANI-SCHOLZE-17 (the §7 functor); PAPER-HEUER-25's route is awaiting review. So this paper should be P8's principal source. The route's reason suggests that the P8 planning job split its proper-comparison suffix into three stages: primitive comparison and finiteness, the §7 functor, and the §8 comparisons.
2. **PerfectoidSpaces (P0, P2, P6). 60 items.**
   - The §2 theory of almost finitely generated modules (≈_ε, γ_M, almost finitely presented modules), which extends P0.
   - The §4 structure sheaves on X_proét, affinoid perfectoid objects, the perfectoid torus, the basis results and almost acyclicity, which belong to P2 and P6.
3. **AdicEtaleGeometry (A1). 32 items.** The construction steps of the pro-étale site in §3, which A1 plans only as "the pro-étale extension" with the corrected covers. The items are recorded with the corrected covers, and without the withdrawn Proposition 3.8 and last sentence of Proposition 3.13.
4. **AdicSpacesPartII (R1, R3). 6 items.**
   - Köpf's relative GAGA over an affinoid base (Theorem 9.1), which extends R1's analytification over a field.
   - Étale acyclicity and base change of coherent sheaves (Proposition 9.2).
   - Topological finite generation of R° (Theorem 9.4).

## Mistakes in the paper (`sourceIssues`)

Thirty-four candidates were checked by an independent reader at 300 dpi. Twenty-one findings are recorded, and eleven candidates were rejected.

**Already corrected in the 2016 corrigendum (E3–E8, E14).** Items use the corrected statements.
- **Proposition 3.7(i) is false.** It claims that an open surjection of profinite sets splits. The corrigendum replaces it by a transfinite variant.
- **The covers in Definitions 3.3, 3.4 and 3.9 are restricted.** They become transfinite towers of pullbacks of finite étale surjections.
- **Corollary 3.8 and the last sentence of Proposition 3.13 are withdrawn.**
- **The definition of 𝒪B⁺_dR is wrong.** The corrigendum corrects Definition 6.8(iii) and strengthens Proposition 6.10.

**New error (E13).** Remark 6.20 prints R^{i}ν_*Ô_X(j) = Ω^i log χ for i = j + 1. It should be Ω^j log χ. For j = 0, Proposition 6.16(ii) gives R¹ν_*Ô_X = O_X log χ, not Ω¹ log χ. The arXiv text has the same slip. The remark is not used later.

**New misprints (13).**
- "finitely [many] elements" (p. 11), and γ₁ for γ_{M₁} (p. 16);
- (i_x^*ℱ)(S) for (i_x^*ℱ)(S̃), and a doubled "Proposition" (§3);
- an index i for j (proof of Lemma 3.18), and f for y (proof of Lemma 6.3);
- "This proposition" for "This corollary" (after Corollary 6.6), and the proof of Corollary 6.19 printed after Remark 6.20;
- "extension of K" for "extension of ℚ_p" (proof of Corollary 5.12), and O_k- for W(κ)-algebras (Lemma 6.11);
- "proposition" for "theorem" (proof of Theorem 7.6);
- the superfluous properness in Definition 8.3, which Theorem 8.8(ii) applies on non-proper bases;
- 𝒪⟨T⟩ for 𝒪_K⟨T⟩ (Theorem 9.4).

**Rejected (11).** These were terse but correct steps, conventions, or duplicates of the 𝒪B⁺_dR correction. They include the Ext computation of Lemma 7.10, where 𝒪_X = ν^{-1}𝒪_{X_ét} makes the abelian adjunction sufficient, and the deliberate identification R^i f_ét* = R^i f_proét* on p. 74.

## Prerequisites the atlas does not cover

- **Faltings, *Almost étale extensions* (2002).** Almost purity, and the comparison method that §2 formalizes.
- **Gabber–Ramero, *Almost Ring Theory* (2003).** The almost-module theory §2 uses.
- **Huber's book (1996).** The étale site of adic spaces, proper base change, and the comparison theorem.
- **Kiehl (1967).** Coherent finiteness for proper rigid spaces.
- **Brinon (2008).** Relative period rings, and the corrected 𝒪B⁺_dR recipe.
- **Andreatta–Iovita (2013).** The model for the de Rham comparison.
- **Colmez (2002).** Sympathetic algebras.
- **Tate (1967).** Galois cohomology of ℂ_p(i).
- **Köpf (1974).** Relative GAGA over affinoids.

Scholze's *Perfectoid spaces* is already PAPER-SCHOLZE-12 in the batch list.

## Corrections by the independent review

REV-PAPER-SCHOLZE-13 (Claude Code, session `cc-fb70e5`, 29 September 2026) made these changes:

- **110 items are now planned.** Blueprint packets merged before this extraction state them node by node, citing this paper:
  - `PadicHodgeTheory--P7.json` for §§6–8 and Theorem 4.9, in stages P8 and P8:local-rational, with R06.1 for the period rings;
  - `AdicEtaleGeometry.json` (A1) for §3's pro-étale site, with `ClassicalAdicEtaleCohomology--H0.json` (H0) for Proposition 3.7(iii), Lemma 3.16, Corollary 3.17 and the Tate twist;
  - `PerfectoidSpaces--P0.json`, P6 for Definition 4.3(i), Example 4.4 and Lemmas 4.5(i) and 4.6, and P0 for Definition 2.3 and Lemma 2.13;
  - `AdicSpacesPartII.json`, R3 for Theorem 9.1 and Proposition 9.2(ii), and R0 for locally noetherian adic spaces.

  Each note names the node. The counts are now 5 library, 168 planned, 81 missing.
- **Route 5 is new**, a source route to AInfCohomology AI.3. It takes 19 integral statements: Lemmas 3.18, 4.2(iii), 4.10 and 5.5, the tilted sheaf of Lemma 5.11, the basis results 4.7 and 4.8, Û, and the integral cases of Theorem 6.5 and Corollary 6.6. The PadicHodgeTheory packet requests exactly these from AI.3, and AI.3 owns the completed integral structure sheaf, its tilt and A_inf,X. They are removed from routes 1–3, and route 2's stages are now P0 and P6.
- **Route reasons.** The reasons of routes 1–4 are rewritten to say what the packets already plan.
- **Numbering.** `source.readSections` records the §5 renumbering.
- **Mistakes.** All 21 source issues are confirmed on review.
