# PAPER-FARGUES-SCHOLZE-21: Fargues–Scholze, *Geometrization of the local Langlands correspondence*

Laurent Fargues and Peter Scholze, "Geometrization of the local Langlands correspondence", arXiv:2102.13459; published as *Astérisque* 466 (2026), doi:10.24033/ast.1270.
Extraction by Claude Code (session `cc-f805bf`), 29 September 2026, issue #4487.

## What was read

- **The text.** I read the whole of arXiv v4 (27 November 2024; 356 pp.; SHA-256 recorded): Chapters I–X and the bibliography. Quoted formulas were checked on page images.
- **The published version.** The *Astérisque* edition (674 pp.) is paywalled and was not consulted. Locators and findings therefore refer to arXiv v4.
- **Status.** The maintainer allowed checkpoints by chapter. Eleven readers covered every chapter, so the extraction is `complete` in one pass.

## What the paper does

The paper builds, over a p-adic local field E, the geometric Langlands programme on the Fargues–Fontaine curve, and deduces the automorphic-to-Galois direction of local Langlands for every reductive G.

- **The curve (Chapter II).** The relative curves Y_S and X_S; degree-one divisors Div¹ = Spd Ĕ/φ^ℤ; the classification of vector bundles; Banach–Colmez spaces.
- **Bun_G (Chapter III).** The stack Bun_G, the homeomorphism |Bun_G| ≅ B(G), Beauville–Laszlo uniformization, the semistable locus, and the strata [∗/G̃_b].
- **Sheaf theory (Chapters IV, V and VII).**
  - Artin v-stacks and universally locally acyclic sheaves: ULA ⇔ dualizability.
  - The Jacobian criterion, hyperbolic localization and Drinfeld's lemma.
  - D_ét(Bun_G): compact generation, Bernstein–Zelevinsky and Verdier duality.
  - Solid and lisse sheaves, D_■ and D_lis.
- **Geometric Satake (Chapter VI).** Geometric Satake over the curve, for Beilinson–Drinfeld Grassmannians over Div¹. The Tannakian group is identified with the Langlands dual group Ĝ, with its twisted Weil action.
- **L-parameters (Chapter VIII).** The stack Z¹(W_E, Ĝ)/Ĝ of L-parameters: its singularities, coarse moduli space and excursion operators, and integral generation results.
- **The main results (Chapters IX–X).**
  - The Hecke action and excursion operators attach a semisimple L-parameter φ_π to each smooth irreducible π, with its expected properties and compatibility with known cases (Chapter IX).
  - Perf(Z¹/Ĝ) acts spectrally on D_lis(Bun_G) (Chapter X).
  - The categorical local Langlands conjecture is stated, not proved.

## What the atlas already has

The extraction has 834 items: 661 are `planned`, 2 are `library` and 171 are `missing`. The planned items sit in the campaign roadmaps built for this paper:

| Chapter | Owning roadmaps |
|---|---|
| II | RelativeFarguesFontaine, VectorBundlesAndIsocrystals, FarguesFontaineDiamonds |
| III | BunGAndNewtonStrata |
| IV, V, VII | VStackSheavesAndLisseCategories, DiamondsAndVStacks |
| VI | GeometricSatakeAndFusion |
| VIII | LanglandsParameterStacks |
| IX–X | HeckeStacksAndLocalShtukas, ExcursionOperatorsAndSpectralAction |

Many stage descriptions cite FS section numbers directly.

The two library items are Mathlib's Proj construction (its API `AlgebraicGeometry.Proj.awayι` and `AlgebraicGeometry.Proj.isSeparated`) and `exists_open_singleton_of_finite` (Lemma IV.1.24). Nothing else is in Mathlib or Tau Ceti at the pinned commits. Mathlib has condensed sets and modules and a provisional notion of solid module, but no diamonds, v-stacks, Bun_G or Fargues–Fontaine curve.

## Routes

All 171 missing items are proof ingredients or side results whose stage names only the headline. So they go as `source` routes to the roadmaps that own the surrounding mathematics, and the paper becomes those stages' source. As the maintainer's note asks, no Part II is proposed, because every gap lies inside an existing roadmap's direction.

1. **VStackSheavesAndLisseCategories (VS0–VS2, VS4, VS5). 54 items.**
   - **From §IV.1:** Artin v-stack criteria and examples.
   - **From §IV.2:** the ULA calculus, with ULA ⇔ dualizability in the 2-category C_S (IV.2.23) and its consequences, Neeman's lemma, and smoothness of Spd O_E → Spd F_q (IV.2.34, which DiamondSixOperations S5 leaves open).
   - **From §§IV.4–IV.6:** the Quot example, the vanishing of partially compactly supported cohomology (IV.5.3 / Theorem I.5.2), and ULA-preservation under hyperbolic localization (IV.6.14).
   - **From Chapters V and VII:** base-field invariance (V.2.3), derived smooth duality, Rπ^!Λ ≅ Λ, and the Künneth statements (V.7.2–V.7.3, VII.7.10).
2. **BunGAndNewtonStrata (BG0–BG3). 30 items.**
   - The G-isocrystal stack, pro-étale torsor triviality, and Rapoport–Richartz local constancy of κ.
   - Borovoi's second proof via B_ab(G) = π₁(G)_Γ, and Viehmann's homeomorphism (Conjecture III.2.15).
   - The affine Grassmannian lemmas (III.3.2–III.3.6), which BG2:uniformization's v-surjectivity needs.
   - Inner twisting, Bun_G ≃ Bun_{G_b} for basic b, split HN moduli, G̃_b, and π₀(Bun_G).
3. **VectorBundlesAndIsocrystals (VB2, VB3). 28 items.**
   - The Harder–Narasimhan filtration under change of C and E, and the contracting-action lemma.
   - (BC(𝒪(1)) ∖ {0})/E^× ≅ Div¹.
   - The family presentations and vanishing results of §II.3, punctured and projectivized absolute Banach–Colmez spaces, and the examples BC(𝒪(−1)[1]) and BC(𝒪(−2)[1]).
4. **RelativeFarguesFontaine (RF0–RF2). 21 items.**
   - Classical points and the local-PID structure of the absolute curves (II.1.6–II.1.12, II.1.22; Theorem II.0.1).
   - The topology of |X_S| → |S|.
   - Fargues' description of Div¹, and Div¹ proper and smooth (II.1.21).
5. **LanglandsParameterStacks (LP0, LP1, LP3, LP4). 18 items.**
   - **§VIII.2, almost none of which the atlas plans:** local duality and the cotangent complex, Weil–Deligne parameters with Zhu's comparison, and Hochschild cohomology with singular support (Gulliksen; Arinkin–Gaitsgory). Also Proposition VIII.2.11, nilpotence of singular support.
   - **§VIII.5:** Proposition VIII.5.19 (π₁ of fixed points) and its remarks.
   - **Problem I.11.1.**

   These refine the stack LP1 constructs, so they belong in LP rather than in a Part II.
6. **GeometricSatakeAndFusion (GS0–GS2, GS4:integral-dual-group). 14 items.**
   - The ULA and semicontinuity lemmas of §§VI.1–VI.6, and the Bruhat order on W̃.
   - Lemma VI.7.3.
   - The dual-group identification lemmas VI.11.2–VI.11.4, including Prasad–Yu.
7. **ExcursionOperatorsAndSpectralAction (ES2–ES5). 6 items.**
   - The Whittaker sheaf, elliptic parameters and Remark X.1.5.
   - The paper's conjectures, recorded as statements, not targets: independence of ℓ (I.9.5), Haines' conjecture, and categorical local Langlands (I.10.2).

## Mistakes (`sourceIssues`, arXiv v4)

Seventy-two candidates were each checked at 300 dpi by one of two independent readers. Seventy are recorded and two were rejected. None is a mathematical error in a main theorem. Items use the corrected statements.

**Findings that bear on a statement.**
- **E3 and E57: a missing quotient.** Theorem I.8.2 and Theorem VIII.0.2 print Ind Perf(Z¹(W_E/P, Ĝ)) without the quotient by Ĝ. Theorem VIII.5.1 has it; without it the statement is false.
- **E5: a missing hypothesis.** Theorem I.10.1 omits the "idempotent-complete" hypothesis on C that Theorem X.0.1 has. It is needed, because Perf(Z¹/Ĝ) is generated under retracts.
- **E58: "exponent" means degree.** Proposition VIII.2.11(ii) says "exponent" where it means the degree of a basic invariant. With the standard meaning of exponent, (ii) no longer implies that ℓ is very good: for G₂, q = 5 and ℓ = 3, (ii) holds but ℓ = 3 is bad.
- **E60: "regular semisimple" should be "semisimple".** The remark after Theorem VIII.5.15 speaks of centralizers of "regular semisimple" elements. As printed the remark is trivial, and the proof line is false in general; the theorem is unaffected.
- **E13: an index in a proof.** In the proof of Proposition II.3.2, "m = dr" should be "m = d".

**Misprints.** The rest are index, letter and word slips, for example:
- X^*(T) for X_*(T) in Chapter III;
- "Iwahori" for "Iwasawa" (proof of VI.3.1);
- the reversed inclusion P_a ⊃ B (proof of VI.11.1);
- D_ét for D_lis (VII.7.10);
- the doubled 𝒵^geom(G₁) in IX.6.2.

## Prerequisites the atlas does not cover

- **Arinkin–Gaitsgory (2015).** Singular support.
- **Dat–Helm–Kurinczuk–Moss.** Moduli of Langlands parameters.
- **Mirković–Vilonen (2007).** Classical geometric Satake.
- **Kottwitz (1985, 1997).** B(G).
- **Fargues (2020) and Anschütz (2019).** G-bundles on the curve.
- **Genestier–Lafforgue (2017).** Equal-characteristic local parametrization.
- **Helm–Moss (2018).** The integral Bernstein centre for GL_n.

Scholze's *Perfectoid spaces* and *Étale cohomology of diamonds*, the Berkeley lectures, Fargues–Fontaine, Kedlaya–Liu, Zhu, Bhatt–Scholze, Lafforgue, Hansen and Hansen–Kaletha–Weinstein are already in the batch list.
