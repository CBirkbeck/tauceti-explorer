# PAPER-SCHOLZE-15: On torsion in the cohomology of locally symmetric varieties

Peter Scholze, *On torsion in the cohomology of locally symmetric varieties*, [Annals of Mathematics 182 (2015), 945–1066](https://doi.org/10.4007/annals.2015.182.3.3); arXiv [1306.2070](https://arxiv.org/abs/1306.2070); zbMATH [1345.14031](https://zbmath.org/?q=an:1345.14031).

Extraction by Claude Code, session `cc-39fac3`, 29 September 2026 (issue #4502). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-SCHOLZE-15.result.json](PAPER-SCHOLZE-15.result.json). It has:
- 127 items: 119 planned, 8 missing, none in the Mathlib or Tau Ceti baselines (114 extracted, 13 added by the review);
- 8 routes: the original 5 (route 3 corrected by the review to carry item 80 only), a Part II join (route 6, item 81) and two source routes for items the review added (routes 7–8);
- 5 prerequisite entries;
- 46 recorded mistakes: the 11 of the extraction, all confirmed by the review, and 35 found by the review (26 misprints, 4 errors, 5 gaps).

## Sources read

- **The published version**, read in full: the Annals PDF, 122 pages (received 29 June 2013, revised 6 January 2015). All locators are its printed pages 945–1066 with the published numbering.
- **arXiv v2** (2 June 2015, "final version"), with its TeX source, used to check formulas and the bibliography.
- **Differences.** A word-level comparison of v2 with the published text finds no mathematical change. The differences are:
  - layout: v2's chapters II–V are sections 2–5, so Remark II.2.4 becomes Remark 2.2.4, and so on;
  - footnotes moved between pages, and a few connecting phrases;
  - the typeset bibliography, with Zbl and DOI links.
- arXiv v1 (9 June 2013) was not read.

## What the paper proves

**The main theorem (Theorem 5.4.1).** Let F be totally real or CM, K ⊂ GL_n(𝔸_{F,f}) a level and ξ an algebraic coefficient system. The Hecke algebra acting on H^i(X_K, ℳ_ξ/p^m), the cohomology of the locally symmetric space of GL_n/F, carries an n-dimensional continuous Galois determinant of G_{F,S}:
- it exists modulo a nilpotent ideal I with I^N = 0;
- N depends only on [F:ℚ] and n;
- Frobenius at v has the Hecke polynomial P_v(X) as its characteristic polynomial.

**Consequences.**
- **Mod p Galois representations** for every Hecke eigensystem in torsion cohomology (Theorem 1.0.3 = Corollary 5.4.3). This proves, for these fields, Conjecture 1.0.2, which the paper attributes to suggestions of Ash.
- **Hecke-algebra-valued representations** at non-Eisenstein maximal ideals (Corollary 5.4.4). Remark 5.4.5 notes that this gives Calegari–Geraghty's Conjecture B up to a nilpotent ideal.
- **A new proof of the Harris–Lan–Taylor–Thorne theorem** (Corollary 5.4.2 = Theorem 1.0.4).

**What is conditional.** The symplectic (totally real) branch assumes Arthur's endoscopic classification. By Shin's base change (Remark 5.4.6), everything is unconditional when F is CM, contains an imaginary quadratic field, and S is pulled back from ℚ.

**The route has four stages.**

1. **§2, perfectoid tools.**
   - Formal models glued from affinoid covers with compatible sections (Lemma 2.1.1).
   - Zariski and strongly Zariski closed embeddings of affinoid perfectoid spaces.
   - A Riemann Hebbarkeitssatz for bounded functions on perfectoid spaces: Proposition 2.3.2, and good triples (Definition 2.3.8), which lift along finite covers and limits.
2. **§3, the perfectoid Siegel space.**
   - Canonical subgroups with explicit constants, via Illusie's deformation theory.
   - The Hasse domains 𝔛*(ε) and the canonical Frobenius lifts.
   - The anticanonical tower at Γ_0(p^∞) level. It is perfectoid, tilts to a perfection, and its boundary is strongly Zariski closed.
   - Tate's normalized traces, and a Hartogs principle at infinite level.
   - Passage to Γ_1(p^∞) and Γ(p^∞) level by tilting and the Hebbarkeitssatz.
   - A covering of the whole tower by GSp_{2g}(ℚ_p)-translates of the anticanonical neighbourhood.
   - The Hodge–Tate period map π_HT to the flag variety. It is equivariant, commutes with prime-to-p Hecke operators, satisfies ω ≅ π_HT*ω_Fl, and has affinoid perfectoid preimages of the standard affinoids Fl_J (Theorem 3.3.18).
3. **§4, from Siegel to Hodge type, and completed cohomology.**
   - Hodge type follows by Zariski closed embeddings (Theorem 4.1.1).
   - Compactly supported completed cohomology modulo p^n is almost the cohomology of the sheaf of infinite-level cusp forms ℐ^+/p^n (Theorem 4.2.1).
   - Hence completed cohomology vanishes above the middle degree (Corollary 4.2.2), and the Calegari–Emerton codimension bounds hold (Corollary 4.2.3).
   - Hecke eigenvalues in completed cohomology are p-adically interpolated by classical cusp forms (Theorem 4.3.1).
4. **§5, Galois representations for GL_n.**
   - Classical holomorphic cusp forms on Sp_{2n} or U(n,n) of weight k have Galois representations, through Arthur/Mok transfer and the conjugate self-dual case (§5.1). Interpolation turns these into determinants on completed and torsion cohomology.
   - GL_n appears in the Borel–Serre boundary of X_K for Sp_{2n}/U(n,n) as the Siegel Levi. This gives a (2n+1)- or 2n-dimensional determinant for GL_n (Corollary 5.2.7).
   - A twisting argument separates the n-dimensional factor, modulo a larger nilpotent ideal ("divide and conquer", §5.3). It uses auxiliary characters of ℓ-power order and a universal twisted determinant over A[T^{±1}].

## What the atlas already has

The campaign roadmaps were designed around this paper, and nearly every statement has an owner.

**§2.**
- The formal-model lemma is AdicSpacesPartII R2 together with TorsionCohomologyInfrastructure TC.0. TC's source table assigns §2.1 to AdicSpacesPartII.
- Zariski closed embeddings are PerfectoidSpaces P4 and P8. Their packets transcribe Definition 2.2.1 through Lemma 2.2.9 node by node from arXiv v2.
- The corrected Remark 2.2.4 (every Zariski closed subset is strongly Zariski closed) is PerfectoidQuotients Q4.
- The Hebbarkeitssatz and good triples are TC.0, which plans "the exact extension theorem needed for bounded functions across the chosen boundary".
- The trace pairings are AdicSpacesPartII R3 and PerfectoidSpaces P3.

**§3.**
- Canonical subgroups are HodgeTateAndCanonicalSubgroups T3 (Corollary 3.2.6, Definition 3.2.7, Proposition 3.2.8). Frobenius lifts and anticanonical loci are T3/T4.
- The Hasse domains 𝔛*(ε) are R2's nodes section-domain-formal-model and hasse-domain; the latter cites this definition.
- The anticanonical tower, its compactification and the covering are PerfectoidShimuraVarieties S1, "The Siegel construction". Tilde-limits and Frobenius-controlled towers are PerfectoidSpaces P7, whose nodes are taken from the proof of Corollary 3.2.19.
- The Hodge–Tate map is T0/T2 and S3. Its integral comparison with ω is TC.1.

**§4.**
- Hodge type is S2/S3. P8's node closed-loci-in-towers is Theorem 4.1.1(i)–(ii).
- CompletedCohomologyPartII has two decomposition nodes built from this paper: CC.8's "scholze-4-2-convention-and-the-perfectoid-comparison" (Theorem 4.2.1) and CC.7's "boundary-long-exact-sequences-and-the-borel-serre-tower" (Corollaries 4.2.2–4.2.3).
- The interpolation theorem is TC.1/TC.2 with IntegralHeckeAndGaloisDeterminants IHG.2.

**§5.**
- **Arthur/Mok transfer** (Theorem 5.1.2) is ModularityAndLanglandsExtensions ML.4, with its conditional hypotheses, and EndoscopicTransferAndUnitaryTraceComparison ET.7a for the unitary base change at split and unramified places.
- **Galois representations for conjugate self-dual Π** are AutomorphicGaloisRepresentationsPartII AG2.2–AG2.3. HLTT is AG2.4.
- **Satake normalizations** are IHG.3.
- **Determinants.** Definition 5.1.8 is IHG.0 (its packet is built from Chenevier). The Hecke-valued determinants on cusp forms are IHG.4.
- **Borel–Serre boundary, Levi strata and boundary Hecke actions** are ArithmeticLocallySymmetricSpaces ALS.0–ALS.4.
- **The boundary Satake identities and the whole of §5.3** are TC.3, which plans "the abstract factor-separation lemma using actual auxiliary characters … including the case of nilpotent coefficient quotients".
- **Theorem 5.4.1 and Corollaries 5.4.3–5.4.4** are TC.2–TC.4 with IHG.5 (nilpotent descent) and IHG.1 (reconstruction).

**A tension on Theorem 5.4.1.** TorsionCohomologyInfrastructure's summary says its target is "a reusable library underlying [the] argument, not an additional requirement to formalize its final Galois-representation theorem". Three accepted extractions nevertheless mark this theorem as planned by TC.2–TC.4 and IHG.5 where they cite it:
- PAPER-ALLEN-ETAL-23 /69 and /72;
- PAPER-CARAIANI-NEWTON-23/thm-2-1-24;
- PAPER-CARAIANI-SCHOLZE-24/2.

TC's own source table assigns §5.4 to TC.4 ("compatibility checks and reusable specialization infrastructure"), and IHG.5 plans "theorem schemas which take an actual geometric Hecke comparison with a quantified nilpotent error ideal and produce the determinant". I followed the accepted extractions and read the summary as a statement of scope, not a disclaimer that no layer builds the theorem. If a reviewer reads it the other way, Theorem 5.4.1, its corollaries and Theorem 1.0.3 become missing, and the natural route is a Part II of TorsionCohomologyInfrastructure that states them.

**The proof of Theorem 5.4.1 has one step the paper leaves as "an easy exercise".** Expressing the boundary cohomology of GL_n through smaller GL_{n′} and inducting on n. The TC.3 design will have to write this out.

## Routes

1. **Source of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6: Illusie's theorem (Theorem 3.2.1).**
   - What it is: the obstruction class in Ext^1(H, K ⊗^𝕃 J) for lifting a morphism of flat commutative group schemes over a square-zero thickening, and its functoriality.
   - Why here: R07.6 plans "the deformation-theoretic tangent and obstruction calculations" for finite flat groups and already imports cotangent complexes from DerivedDeRhamCohomology DD.0–DD.1. This theorem is such a calculation.
   - Alternative: Remark 3.2.3 shows the canonical-subgroup application could avoid it, using deformation of rings (DD.0), at the price of worse constants.
2. **Source of HodgeTateAndCanonicalSubgroups T0, T2, T3 and T4: the Siegel Hasse invariant and the lifting lemma.**
   - The gap: T3's text is written for the Hilbert case. It takes its Hasse neighbourhoods from R2, H2 and C6, and none of these constructs the Hasse invariant of a g-dimensional abelian scheme. R2's hasse-domain node says Ha is "supplied by the moduli roadmaps", and for Siegel none does.
   - Missing items taken by this route:
     - the Hasse invariant from Verschiebung, Lemma 3.2.5 and its extension to X*;
     - the lifting Corollary 3.2.2;
     - Lemma 3.3.2 on Ha at boundary points.
   - Planned items the paper is the natural source for: Corollary 3.2.6, Definition 3.2.7, Proposition 3.2.8, Theorem 3.2.15, Proposition 3.3.1 and Lemma 3.3.4, all with Scholze's explicit constants (ε < 1/2, p^{1−ε}).
3. **Source of AutomorphicFormsOnReductiveGroups AF.4 and AF.5: the archimedean input to §5.1.**
   - Missing items: Proposition 5.1.1 (the holomorphic discrete series π_k of Sp_{2n}(ℝ) and U(n,n) with minimal K-type χ^k, and its infinitesimal character), and the identification of weight-k holomorphic cusp forms with cuspidal π with π_∞ ≅ π_k (Hecke-semisimple by the Petersson product).
   - Why here: AF.4 owns infinitesimal characters and cohomological representations, and AF.5 the cusp-form dictionary. AF.5 plans it only for GL_1 and GL_2/ℚ, and ET.1 only unitary pseudocoefficients.
4. **Source of PerfectoidShimuraVarieties S0–S3 (planned items only).** The roadmap names "Scholze's construction for Siegel/Hodge type" as its source but has no packet. §§3.2–3.3 and 4.1 are that construction, statement by statement.
5. **Source of TorsionCohomologyInfrastructure TC.0–TC.4 (planned items only).** The roadmap maps the paper's sections to its layers in prose. The route supplies the statements with published locators and the corrections below.

No Part II or new roadmap is proposed. The paper's reusable theory is exactly what the campaign's torsion roadmaps were built to hold, as the maintainer's note anticipated.

## Mistakes recorded

No erratum exists. I looked in four places:
- the Annals article page;
- the Crossref record;
- the author's papers page, which lists an erratum only for a different paper;
- arXiv v2, which is the published text.

**Already found by atlas packets.** All five were checked against the published text and still stand.
- **E1 (error).** Remark 2.2.4 says R → S need not be surjective for a Zariski closed subset. It always is: Bhatt–Scholze, *Prisms*, Theorem 7.4 and Remark 7.5; *Étale cohomology of diamonds*, Theorem 5.8. Recorded in the atlas as PerfectoidSpaces/E26 and E17.
- **E2 (error).** Definition 2.2.6 omits that S^+ is the integral closure of the image of R^+. The "of course" sentence after it then fails. A counterexample is given in the file: R^+ the integral closure of 𝒪_K + R°°, S = R, S^+ = R°. Recorded as PerfectoidSpaces/E27 and E18. The paper only uses the notion with S^+ = S°, where the images are Zariski closed.
- **E3 (misprint).** After Lemma 3.2.13, 𝔛*(ε) → 𝔛* is called an admissible blow-up. It is only an open chart of one. Recorded as AdicSpacesPartII/E13.
- **E6 (misprint).** The proof of Theorem 4.1.1 writes G(𝔸_f^p) for G′(𝔸_f^p). Recorded as PerfectoidSpaces/E22.
- **E7 (gap).** Theorem 4.1.1(i) for Hodge type is "easy to deduce", but the comparison of the infinite-level plus ring with the finite-level rings R^+_{J,K_p} is not argued. Recorded as PerfectoidSpaces/E23; P8's closed-loci-in-towers node supplies the argument.

**New, all misprints that affect nothing.**
- **E4.** The Frobenius lift F̃_𝔛 is "finite locally free of degree g(g+1)/2"; the degree is p^{g(g+1)/2}. Corollary 3.2.23 normalizes the traces by exactly that power.
- **E5.** Theorem 3.2.15(iii) calls the weak canonical subgroup of 𝔄(ε)[p] "of level p"; it has level 1, as the proof says.
- **E8.** Theorem 5.1.2 has two slips:
  - the last exponent is printed (ℓ_i − i)/2 for (ℓ_i − 1)/2;
  - the L-parameter of Π_{iv} is printed as landing in ᴸGL_h rather than ᴸGL_{n_i}.
- **E9.** Lemma 5.2.2 writes X^P_{X_P} → X^M_{X_P^M} for X^P_{K_P} → X^M_{K_P^M}.
- **E10.** On p. 1041, the section of X^P_{K^P} → X^M_{K^M} is written X^M_{K^M} → K^P_{K^P}.
- **E11.** Corollary 5.4.4's displayed identity has σ_ψ where σ_𝔪 is meant.

The items use the corrected statements.

## Prerequisite papers not yet in the atlas

- **Illusie, *Complexe cotangent et déformations II*** (LNM 283, 1972), Chapter VII: [doi:10.1007/BFb0059575](https://doi.org/10.1007/BFb0059575). Needed for Theorem 3.2.1.
- **Fargues–Genestier–Lafforgue, *L'isomorphisme entre les tours de Lubin–Tate et de Drinfeld*** (Progress in Math. 262, 2008): [doi:10.1007/978-3-7643-8456-2](https://doi.org/10.1007/978-3-7643-8456-2). Fargues' Théorème II.1.1 gives the integral bound in Theorem 3.3.18(vi).
- **Shin's appendix to Goldring** (Compositio 150, 2014): [doi:10.1112/S0010437X13007355](https://doi.org/10.1112/S0010437X13007355). Morel's book (Annals of Math. Studies 173): [doi:10.1515/9781400835393](https://doi.org/10.1515/9781400835393). These are the two sources for the unconditional range in Remark 5.4.6.
- **Caraiani–Le Hung** (Compositio 152, 2016): [doi:10.1112/S0010437X16007016](https://doi.org/10.1112/S0010437X16007016). Cited for the boundary step in the proof of Theorem 5.4.1.

The other inputs are already sources of atlas layers:
- Arthur's and Mok's classifications (ML.4);
- Chenevier's determinants (the IHG packet);
- HLTT (AG2);
- Calegari–Emerton (CompletedCohomologyPartII);
- Kedlaya–Liu and Scholze–Weinstein (the perfectoid packets);
- Bosch–Lütkebohmert and de Jong–van der Put (AdicSpacesPartII);
- Venjakob (NoncommutativeAndEquivariantIwasawa).

## Corrections made in review

The independent review REV-PAPER-SCHOLZE-15 (Claude Code, session `cc-48533a`, issue #4504) corrected this extraction in place. Its report is `research/blueprint/reviews/REV-PAPER-SCHOLZE-15.md`, and the verdicts are in `PAPER-SCHOLZE-15.review.json`. In brief:

- **Item corrections (64).** Locators (off-by-one subsection numbers in §3.2, and pages) and statements. Among the statements:
  - item /39: the Frobenius lifts are finite étale only after inverting p;
  - items /66, /70 and /78: Theorem 3.3.18(i), Theorem 4.1.1(i) and Lemma 4.3.3 are proved only for the 2^g Lagrangian charts Fl_J;
  - item /26: the level Γ₀(p^m) uses the similitude factor;
  - item /103: G is the finite group Gal(F̃/F);
  - items /108–/113: they need K ⊂ ∏_v GL_n(𝒪_{F_v}) and ℤ̄_p coefficients.

  Status corrections: items /5, /11, /55, /74, /84 and /85.
- **Items added (13, /115–/127).** Eleven are planned. Two are missing and routed: the compactly supported primitive comparison theorem (route 7, PadicHodgeTheory P8) and Clozel's cohomological realisation (route 8, ArithmeticLocallySymmetricSpaces ALS.5).
- **Routes.** Route 3 now carries only item 80, to AF.1/AF.4. Item 81 joins the Part II IntegralCoherentHeckeComplexes (route 6). Route 2's reason is corrected: the Hasse invariant belongs in T0.
- **Mistakes.** E1–E11 are confirmed, with rewordings of E2, E4 and E7. E12–E46 are new. The main ones:
  - E16: GSp_{2g}(ℤ_p) permutes only the Lagrangian Fl_J;
  - E17: the formula of Corollary 3.2.6;
  - E19: the level Γ₀(p^m) should use the similitude factor;
  - E37: Corollary 5.1.11 needs its weight condition;
  - E44–E45: two slips in the proof of Corollary 5.4.2.

