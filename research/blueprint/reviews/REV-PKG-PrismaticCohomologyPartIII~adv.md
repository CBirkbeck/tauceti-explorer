# Independent package review: PrismaticCohomologyPartIII

Reviewer: Codex — codex-4nDh4M. Job: REV-PKG-PrismaticCohomologyPartIII~adv, issue #10236. Date: 2026-10-17.

Verdict: **accepted with the repairs in this change**. The package is ready for the maintainer's draft upstream PR. This is a review of a roadmap, not a claim that its prismatic mathematics is formalized. I did not write the package under review; its split arrived in #10228.

## Scope, form and plan coverage

I read the complete README and Suggested.lean, WORKERS.md, PACKAGE_REVIEW.md, PROTOCOL §§5, 13, 20, the expansion protocol and UPSTREAM_GUIDE.md. I compared the exemplar PadicMeasuresIwasawaAlgebras package and the current AdicSpaces and LocalGaloisGroups roadmaps; AlgebraicVectorBundles supplied an additional ownership comparison. The README retains the split's Layers 6–7, exact hypotheses, API lists, checks and worked examples. Its large size reflects those interfaces; none was deleted to shorten it. Suggested.lean remains far below 5,000 lines and contains no carrier construction or sorry'd data.

There is no packet named PrismaticCohomologyPartIII*.json in this clone. The applicable original target lists are PrismaticCohomology--PR.0.json and PrismaticCohomology.json: the former's PR.4 targets correspond to physical Layer 6, and its PR.7 targets to Layer 7. The original packet's PR.6 is q-de Rham, not physical Layer 6. I checked the 33 PR.4 targets and 26 PR.7 targets against §§6.1–6.33 and §§7.1–7.26 respectively. None is lost; the scalar-extension and crystalline-logarithm targets occupy §§6.21–6.23. The later packet's Beilinson and curve inputs have explicit local construction targets in §7.0. The auxiliary local interfaces in §§6.0–6.0b, 6.31, 7.0 and 7.0b address the old packet's named prerequisites rather than assuming those gaps away.

Parts I–II supply the prism/site, derived and Nygaard machinery. I checked the linked sections, including Part I §2.29: its complete finite-projective descent does not already supply the punctured almost-perfect descent of §7.2. The curve-modification comparison depends on §7.17's construction, not §7.22's equivalence; the trace square depends on the separately supplied absolute and relative trace comparisons, not RefinedTraceMethods. PadicHodgeTheory and Part IV occur as consumers only. The inherited packet gaps remain historical packet records; this package review does not edit or silently certify other packages.

## Repairs

1. **Finite E-height:** §7.25 previously tried to make both a Frobenius matrix and its inverse integral by multiplying the forward Frobenius by E^h. That is false for the line with Frobenius E. The repaired argument clears the two forward matrices with the same h, bounds the inverses' denominators separately, and cancels the common factor in both Hom equations. A finite-height map need not have integral inverse. The rank-one counterexample and its integer-lattice analogue are now checks and Lean examples.
2. **Weight zero:** the Layer 6 examples now distinguish O_C from F_p. On F_p the zero differential gives H⁰=H¹=Z_p. A blanket assertion that every perfectoid value is Z_p in degree zero was false.
3. **Supplier overlap:** the finite-height coefficient rings, Fontaine equivalence and all-weight Kisin lattice functor are already supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.4.1–5, 11, 14, 16. Their general construction and full faithfulness are imports in Scope. §7.24 now targets the comparison with prismatic evaluation and its crystal-induced uniformizer compatibility. Its integral restriction assertion follows from the supplied rational theorem and preservation of the given lattice.
4. **Dependency order:** §7.23 no longer needs the later §7.25 dictionary. Common rescaling extends effective full faithfulness to arbitrary E-poles directly; §7.25 can then compare realizations. This avoids a circular proof route.
5. **Variance and action:** §7.11 distinguishes the final object of the site from the initial object of the prism-ring-map diagram used for evaluation. The uniformizer comparison carries the action induced by the crystal, rather than inventing a coefficient-only G_K-action on a Kisin module. The three-factor Galois product now has a computed noncommuting-permutation witness.
6. **Rational chart:** the polynomial presentation for A⟨d/p⟩ is explicitly transversal. For d=p over Z_p, the quotient by p(x−1) has extra p-torsion and cannot be identified with Z_p[p/p]. The chart over Z_p[[u]], d=u−p, computes φ(x)=p^(p−1)(x+1)^p−1, which is −1 modulo p; it is not coordinatewise x↦x^p. Both failures have checks and Lean witnesses.
7. **Internal grading:** §6.31 now distinguishes the integral grading on finite absolute-prismatic Nygaard quotients (AMMN Proposition 5.41) from the potentially fractional grading on Nygaard associated pieces of Hodge–Tate cohomology (BM Remark 3.10 and Proposition 3.12). The latter has a weight 1/p component. A dyadic fractional-weight check prevents conflation.
8. **Definition tests and conventions:** added computed free/zero/base-change/dual/morphism tests for the crystal operations; added explicit cone degrees, the φ−can sign change, and the internal-weight API checks. Earlier tests, hypotheses and source qualifiers remain.
9. **Current-library boundary and presentation:** Scope explicitly credits Tau Ceti's existing Fargues–Fontaine adic quotient/window declarations. Schematic Proj, GAGA and the filtered prismatic modification remain the new targets. Removed irrelevant inherited descriptions in the library table and source-error/process narration from the mathematical roadmap. Corrected the BMS §7.4 and BS formula (9.3) pages and expanded the FCRYS Theorem 7.2 proof locator to pp.28–31.

## Current upstream and library audit

I searched by mathematical objects as well as names in the current upstream roadmaps, all Completed roadmaps and the current Tau Ceti library, without building there. The inspected upstream checkout was commit 0d144d044dacebca17b654695b6f1ad58f159b27; Tau Ceti was a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The search included the nine roadmaps newer than the atlas snapshot and the four named Completed roadmaps. I also read data/library-coverage.json; it has no independent Part III layer audit to substitute for this inspection.

Current `TauCeti.AlgebraicGeometry.AdicSpace.FarguesFontaine` modules `Y`, `Window`, `Quotient` already provide `spaY`, `frobeniusHomeomorph`, `windowU`, `windowV`, `spaX`, `quotientMap` and their open-window/quotient properties. These are now explicitly deferred in Scope. AlgebraicVectorBundles already owns the affine finite-projective/sheaf equivalence and duality. No new general vector-bundle or adic-quotient target is kept. FiniteFlatGroups already owns the all-weight lattice functor; the duplicated promise in §7.24 has been replaced by its prismatic comparison. No prismatic/syntomic comparison, prismatic F-crystal category, or crystalline-lattice equivalence was found in the current library or Completed roadmaps.

At the required pins, I checked the actual existing declarations for Witt carriers/Frobenius, tensor and localization, finite/projective modules, mapping cones, derived categories, units, Picard groups and power series. These are ingredients, not the missing enhanced sites, completions or period comparison carriers. Suggested.lean imports Mathlib only because its retained signatures use no Tau Ceti declaration; it does not manufacture those missing carriers.

## Adversarial pass

Each row covers the statements and named API in the indicated subsection, including the proof route's claimed interface. Tests below are mathematical computations and boundary checks; they are not a substitute for the cited general proofs. Unrelated parameters such as q or a noncompact group are not inserted into statements that have neither parameter. Unless a repair is specified, the stated hypotheses and conclusion are retained.

| Statements / definitions / conventions | Instances and computed boundary | Result / change |
| --- | --- | --- |
| Conventions; supplier contracts; §7.0a | p=2; ramified π²=2; k=F_p and algebraic closure of F_p; twists 0, ±1 | Retain arbitrary perfect residue field, shifted embedding and HT(χ)=+1; never replace π by p. Supplier objects remain imports. |
| §6.0 continuity, excision, reduction Čech | Zero ring; a unit; identity map; μ₂ over Z₂; square-zero derived reduction | Zero square and identity square work; animated Tor and Laurent units are necessary. |
| §6.0a specialization / Spec–Spa | B=O_C gives Z/p^n; pB=0 gives empty generic site; nonconstant finite local system | Retain bounded geometric specialization, general affine comparison and monodromy. |
| §6.0b generic v-cover / lisse descent | Characteristic p empty fibre; root cover; nonzero closed valuation fibre; finite étale cocycle | Flatness argument uses the valuation ring and local boundedness, not arbitrary p-regular bases. |
| §6.1 FrobeniusModule, fixedPoints, map, localization, reduction, triangle, amplitude | φ=0 gives zero; φ=id gives M⊕M[−1]; F₂ has H¹=F₂; degree-zero cone has terms −1,0; φ=2, can=1 sends 1 to +1 | Added shift/sign witnesses. Restriction of scalars precedes subtraction; localization needs σ(t) invertible. |
| §6.2 completed colimits | t=0 reduces to identity completion; t a unit forces complete object zero; φ(t)=t^p at p=2 | Retain derived completion and semilinearity; no ordinary uncompleted-colimit assertion. |
| §6.3 Artin–Schreier–Witt / tilting | n=1; perfectoid field; characteristic p gives both generic rings zero; pseudouniformizer torsion disappears | Integral-perfectoid range retained; scheme cohomology and Tate comparison distinguished. |
| §6.4 arbitrary formal comparison | Singular affine; characteristic p; n=0 gives zero coefficients; smooth specialization | Retain derived Δ for singular X and bounded hypothesis for geometric Rμ_*. |
| §6.5 coefficients / products / Z_p | n=1→0; multiplication by p; inverse limit of finite levels | Derived completion follows Laurent inversion; Milnor lim¹ not dropped. |
| §6.6 smooth global comparison | Empty X; affine smooth chart; dimension zero; qcqs gluing | Smoothness identifies site Δ, qcqs permits global localization. |
| §6.7 cohomological dimension | Empty generic fibre; perfectoid field; arbitrary constructible extension | Bound is for scheme F_p-sheaves, not every adic sheaf or ℓ≠p. |
| §6.8 syntomic datum, fibre, finite levels, maps, cup product | Weight 0 over F_p has two Z_p groups; negative weight contracts; n=1 has proper Nygaard source; r=0 gives zero | Keep adapted twist generator and distinction from an endomorphism. Cone sign pinned in §6.1. |
| §6.9 animated / absolute / formal syntomic definitions | Polynomial affine; mod-p derived square-zero extension; empty formal scheme; identity cover | Keep left Kan extension, completion and sheafification in their stated order. |
| §6.10 rank-one units, Tate module, logarithm | Unit 1 maps to 0; compatible roots of unity; multiplication becomes addition; arbitrary units excluded | Domain and additive target retained; integer scalar check in Lean. |
| §6.11 deep Nygaard contraction | i=0; first level above i; p=2 | Divisibility is applied in the stated range modulo p; no division by zero or arbitrary p-torsion cancellation. |
| §6.12 filtered colimits | Finite coefficient r=0,1,2; identity diagram; nontrivial infinite filtered union | Finite coefficients retained; no ordinary-colimit claim for inverse-limit Z_p cohomology. |
| §6.13 logarithmic de Rham–Witt fixed points | Degree 0; finite Witt lengths 1,2; smooth field | Frobenius is divided in the appropriate Nygaard degree; logarithmic, not all, forms are fixed. |
| §6.14 surjectivity on completed A_crys | i=0; deep levels; characteristic-two root covers | Assertion is local on the stated site; not surjectivity on an arbitrary original ring. |
| §6.15 quasiregular semiperfect syntomic | Perfect F_p; nontrivial semiperfect quotient; weight 0 vs positive weight | Retain sheaf/single-ring distinction and crystalline filtration. |
| §6.16 log de Rham–Witt comparison | Perfect field, i=0 and i>0; smooth torus; Witt length 1 | Degree −i and pro-étale Z_p coefficients retained; finite level descends étale. |
| §6.17 upper truncation | i=0; smooth formal point; i=1 torus | Vanishing is a sheaf bound, not global vanishing of all higher cohomology. |
| §6.18 condition (As) | j=0; i=j; p=2; finite coefficient n=1 | Retain nonzerodivisor and semilinear hypotheses of the Lη argument. |
| §6.19 Lη fixed points | i=0; degree i boundary; µ-torsion in excluded H⁰ | Truncation ≤i and torsion-free H⁰ are essential. |
| §6.20 nearby cycles | i=0 constant sheaf; i=1 Kummer on torus; degree i+1 | Keep truncation, not untruncated equivalence. |
| §6.21 perfected base | Already perfect prism; smooth point; n=1 | Relative cohomology after the prescribed scalar extension, not before it. |
| §6.22 crystalline logarithm exact sequence | R perfect gives J=0; i=1; p=2 | Teichmüller logarithm domain retained; not a logarithm of arbitrary units. |
| §6.23 crystalline c₁ fibre | Trivial line bundle; nonzero Picard class; weight 1 | Completed G_m complex retains higher cohomology; no Picard-only replacement. |
| §6.24 low weights | n<0 gives zero; F_p weight 0 has H¹; weight 1 retains Brauer contribution | Full G_m formulation retained; removed source-error narration. |
| §6.25 comparison without localization | Perfectoid F_p and O_C; finite coefficients | Closed-fibre and generic-fibre values distinguished; do not invert an ideal silently. |
| §6.26 perfectoid Tate twists | n=0 versus n=1; O_C versus characteristic p | Correct closed/open branch retained; positive twists vanish on perfect characteristic-p fields. |
| §6.27 Picard p-divisibility | Field Pic=0; integral perfectoid Pic; localization | Both Picard groups, not higher G_m cohomology, are asserted uniquely p-divisible. |
| §6.28 syntomic sheaf discreteness | F_p has nonzero section H¹; QRSP root cover kills cokernel locally | Discrete and p-torsion-free as a sheaf; not every section complex. |
| §6.29 comparison morphism | n=0; finite coefficients; non-smooth input | Morphism and equivalence ranges kept distinct; erroneous broad interpretations excluded. |
| §6.30 scheme syntomic gluing / products | Empty scheme; characteristic-p affine; p-invertible scheme; overlap cover | Gluing retains generic µ-twists and completed formal part, rather than p-completing away the generic part. |
| §6.31 connectivity, rigidity, top cohomology, continuity, internalWeight | i=0; strictly henselian point; F_p[[x]] and x-adic tower; A⊕N with N of weight 1; p=2 | Added API tests and integral-vs-fractional grading distinction; Frobenius multiplies internal weight by p. |
| §6.32 failure of untruncated comparison | Z_p and weight 0; generic Galois cohomology | Counterexample retained; syntomic is not generic étale cohomology in all degrees. |
| §6.33 / Layer 6 examples | O_C; F_p; formal torus; finite levels and n→n−1 maps | Corrected overbroad weight-zero example; preserve Kummer direction and finite-level compatibility. |
| §7.0 trace/prismatic coefficients and TC | Perfectoid B; B=F_p with π₀TC=π₋₁TC=Z_p; zero ring; weight 1 | Filtered identification preserves twists and Frobenius; added sign witness via target negation. |
| §7.0 HH, HC, HC⁻, HP, norm and rational trace square | Base Z; R=F_p; R=0; n=0; p=2 | HC sits in nonnegative even degrees; cofibre is Σ²HC. Infinite circle limits precede inversion of p. |
| §7.0 χ_n / prismatic Beilinson square | n=0 has zero Hodge quotient; n=1 quotient R[1/p]; O_C and n>0 | Keep p-torsion-free qsyn input; eigenspace inclusion/scalar nonzero only for n>0. |
| §7.0 curve, GAGA, Robba, modification, slopes | Rank 0; φ=1 line; φ=p and jump 1 gives degree 0; degrees ±1 sum not semistable; nonzero-slope line | Keep degree t_H−t_N, opposite Robba sign; schematic/GAGA adapter distinct from supplied adic quotient. |
| §7.0b Galois product, Witt and Laurent comparisons | Identity g; finite quotient H; three factors; gh≠hg in S₃; almost-zero cone modulo p^n | Added explicit product-order witness; only Laurent completed comparison is exact. |
| §7.1 crystal / base change / Hom / unit / tensor / dual / pullback / Iso | Rank 0,1,2; Z→F₂; coordinate pairing 0 and 1; multiplication by 2; incompatible transition square | Added discriminating operation tests. A/I is not an integral vector-bundle crystal. |
| §7.2 integral and punctured complete descent | J=0 and unit ideal give zero category; Z_p,(p) gives Perf(Q_p); Z_p→F_p has Tor₁ | Punctured completion is a separate target; complete flatness cannot be omitted. |
| §7.3 qsyn crystal equivalence | QRSP affine; identity Čech nerve; completed coefficient variants | Retain qsyn hypothesis and enhanced limit for perfect complexes. |
| §7.4 IsAwayIdeal, OverPrism, Hom, effectivity, base change and dual | Principal d; unit line; Frobenius d vs d⁻¹; rank 0; zero map on nonzero localization | Invertible linearization and integral forward map distinguished; dual scalar is inverse. |
| §7.5 SiteData, global F-crystal, evaluation, pullback, tensor and twist | Unit; rank 0; twists ±1 tensor to unit; underlying identity between Frobenii 1,d fails | Added Hom and inverse-twist tests; arbitrary formal definition vs bounded twist use retained. |
| §7.6 Laurent category / base change | d inverted before completion; rank 0 and 1; coefficient Frobenius | Frobenius becomes invertible on completed Laurent coefficients; integral poles not forgotten before passage. |
| §7.7 Riemann–Hilbert / completed perfection | S=F₂; nonreduced S; t=0; t unit | Arbitrary F_p-algebra retained; perfect-complex and finite-local-system hearts agree. |
| §7.8 Laurent crystals / local systems | Empty generic fibre; constant Z_p; nontrivial finite étale monodromy | Retain integral coefficients and continuous action; no constant-sheaf shortcut. |
| §7.9 étale realization | Zero crystal; unit; twists ±1; proper smooth H²(P¹) | Covariant realization and Tate signs preserved. |
| §7.10 crystalline / de Rham realization | Unit; rank-one twist; ramified O_K; special fibre | Filtration uses Frobenius-twisted K embedding; evaluations are on the actual comparison sites. |
| §7.11 QRSP evaluation and faithfulness | Initial prism diagram; zero and unit module; reduction mod p | Clarified opposite-site variance; p-torsion-free faithfulness is not mod-p fullness. |
| §7.12 Breuil–Kisin / A_inf covers | K unramified; π²=2 at p=2; u maps to [π♭]^p; first Čech overlap | Shifted embedding retained; ramified scalar check prevents π=p substitution. |
| §7.13 BKF comparison | Rank 0; unit; rank-one B_dR⁺ lattice t^n | Classification is supplied; pair retains integral Tate lattice, not Q_p alone. |
| §7.14 crystallinity | Unit; twists ±1; arbitrary perfect residue field | D_crys rank equality uses period comparison with correct W(k) embedding. |
| §7.15 full faithfulness | Zero maps; multiplication by p; inverse 1/p on rational line | Integral Hom cannot be replaced by rational Hom. |
| §7.16 rational / period sheaves and maps | d=p nontransversal presentation; d=u−p; p=2, x=0; B_dR⁺ DVR vs field | Scoped presentation and added computed φ(x); θ-kernel/completion remain distinct. |
| §7.17 filtered-module crystal construction | Rank 0; unit line; jump 1 lattice t⁻¹; non-weakly-admissible D | Construction allows general filtered D; weak admissibility enters later, not assumed to define it. |
| §7.18 analytic continuation | n=0; n=1; zero section; negative twist transported separately | Uniform denominator and eigenvalue range retained; no inverse of a zero scalar. |
| §7.19 boundary descent | Identity datum; rank 0; nontrivial cocycle and inverse | Both datum and inverse extend; cocycle follows by injectivity on full nerve. |
| §7.20 weakly admissible extension | Unit and zero module; degree-zero unstable sum excluded | Uses subobject inequalities; existence does not imply uniqueness of arbitrary integral extension. |
| §7.21 latticeFCrystal and uniqueness | Zero lattice; Z_p(n); multiplication by p; ramified finite-order character excluded | Integral descent recovers specified lattice, not just its rationalization. |
| §7.22 crystalline-lattice equivalence | Unit, zero, twists, tensor and dual; k algebraically closed | Arbitrary perfect k and finite free integral representations retained; no torsion/derived equivalence. |
| §7.23 Breuil–Kisin realization | E-pole line; common E^h on source and target; zero module | Removed forward cycle; arbitrary-pole variant follows effective supplier by cancellation. |
| §7.24 prismatic / Kisin functor comparison | Unit, dual, all-weight twists; different uniformizers | General Kisin functor is imported; only prismatic identification and crystal-induced action are new. |
| §7.25 Kisin dictionary | E map with E⁻¹ nonintegral; common rescaling; Z⊂Q, 2 and 1/2; effective vs positive Tate weight | Corrected false inverse-integrality argument; preserves Hom groups and finite cokernel height. |
| §7.26 torsion counterexample | p=2 gives twist p−1=1; odd p gives mod-p cyclotomic^(p−1)=1 | Nontrivial integral prism ideal modulo p persists; no torsion full-faithfulness claim. |
| Layer 7 worked examples and dependencies | Rank 0/1; H²(P¹); cyclotomic twist; shifted Kisin embedding | Consistent with the above conventions; consumers never become suppliers. |

## Source verification

No locator was marked unverified in the incoming package. I generated a reproducible random sample with seed 10236 from the numbered subsections having a displayed citation paragraph. Its 15 members are below; I read the cited statements in the source PDFs and checked their hypotheses as well as page numbers. In §7.7 the first parenthesized paragraph is a numbered assertion; its actual source paragraph, Proposition 3.4/3.6, was used. Additional targeted checks follow the table. Source wording is not reproduced here.

| Sample subsection | Checked source and pages | Finding |
| --- | --- | --- |
| 6.2 | BS22 Lemma 9.2, p.71 | Completed-colimit and derived fixed-point claims agree. |
| 6.0b | ECD Proposition 15.4/Lemma 15.6, pp.90–91; FCRYS Example 3.5/Corollaries 3.7–3.8, pp.10–11; BMS Lemma 4.7, p.19 | Spatial/étale carrier, lisse comparison and complete-flat input have distinct roles. |
| 7.20 | FCRYS §6.4, pp.26–27 | Integral extension follows weak admissibility and bundle matching; no uniqueness claimed. |
| 7.25 | FCRYS Remark 7.11, p.33, Introduction §1.2, pp.3–4 | Two realization functors compare after restriction; arbitrary rescaling needs separate inverse-denominator bound. |
| 6.22 | BL Theorem 7.1.1, p.167 | Exact Teichmüller-log sequence has the stated restricted domain. |
| 6.27 | BS22 Corollary 9.7, p.76 | Both integral and generic Picard groups are uniquely p-divisible. |
| 7.5 | FCRYS Definition 4.1/Remark 4.2/Example 4.5, pp.12–13; Introduction footnote, p.2 | Example 4.5 starts on p.12 and its completed construction continues on p.13; no torsion classification. |
| 7.9 | FCRYS Construction 4.8/Example 4.9, p.13 | Covariant realization preserves the Tate twist. |
| 7.21 | FCRYS §6.4, pp.26–27 | Bounded descent is upgraded to the chosen integral lattice. |
| 6.17 | BMS Proposition 10.5 and preceding computation, p.76 | Sheaf truncation, with subsequent Lη hypotheses, is the statement used. |
| 7.19 | FCRYS Lemma 6.9, pp.24–25, Proposition 6.10, pp.25–26 | Boundary extension is of maps and inverses, with cocycle retained. |
| 7.3 | FCRYS Definition 2.9/Proposition 2.13, p.7, Proposition 2.14, p.8 | Qsyn hypothesis and completed coefficient variants match. |
| 7.7 | FCRYS Proposition 3.4, p.9, Proposition 3.6, p.10 | Arbitrary F_p-algebras and completed-perfection range match. |
| 6.26 | BS22 Theorem 9.4, pp.73–75, Remark 9.5, p.75 | Positive twists, weight zero and special/generic branches are different. |
| 6.8 | BMS §7.4, p.50, Theorem 1.12/Remark 1.14, pp.6–7; BS22 (9.3), p.73, §14, p.97; BL Example 7.4.3, p.178 | Corrected missing/ambiguous page assignments; signs compared by target negation. |

Targeted checks beyond the random sample: BS22 Theorem 9.1 (pp.71–73), Lemma 9.6 (p.76), Theorem 11.1 (p.85), Theorem 14.1 and Lemmas 14.4–14.5 (pp.97–100); BL Propositions 7.2.15 and 7.4.6 (pp.174–175, 178–179), Theorems 7.5.6 and 8.1.9/Corollary 8.1.10 (pp.184–185, 191); BMS Theorem 8.17, Corollary 8.21 and Lemma 10.8 (pp.62–64, 66, 77–78); FCRYS Proposition 2.7 (p.6), Lemma 4.11 (p.14), Theorem 5.6/Remark 5.8 (pp.17–18), Construction 6.5/Lemma 6.7/Proposition 6.8 (pp.20–23), Theorems 7.2 and 7.9/Corollary 7.10/Remark 7.12 (pp.28–33); AMMN Theorems 5.1–5.2, Construction 5.40/Proposition 5.41/Corollary 5.43, Theorem 6.17/Propositions 6.18 and 6.21 (pp.25, 37–39, 44–46); BM Construction 3.9/Remark 3.10/Proposition 3.12 (pp.11–12); CS Theorem 5.3.5 and Lemma 5.4.2 (pp.59–61, 63–66); ECD Proposition 8.8 (p.43); Mathew Definition 7.1, Proposition 7.7, Theorem 7.8 (pp.27–28); FF Theorems 6.5.2 and 11.3.1, Propositions 10.5.3–10.5.6 (printed pp.204–206, 330–332, 289–290).

Huber Corollary 3.2.2 and Theorem 3.2.9 (printed pp.174, 180) were read only in the maintainer-cleared local book. No book file or passage is included in this submission. These chartwise comparison results support the separate pre-adic adapter; they are not represented as a ready-made theorem about every bounded formal scheme.

Public PDFs accessed on 2026-10-17 (SHA-256 identifies the version read, including the unversioned author-hosted and Mathew PDFs):

| Source | URL | SHA-256 |
| --- | --- | --- |
| bs22 | [PDF](https://arxiv.org/pdf/1905.08229v4) | `1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a` |
| fcrys | [PDF](https://arxiv.org/pdf/2106.14735v2) | `4cbfb297a15347c978f590cfc7b7dab3ab771509c588dc8fd928cff8b067ff59` |
| bl22 | [PDF](https://arxiv.org/pdf/2201.06120v1) | `0b1beeb20c29424ed8e330c14a66b36c0edcc84255edf5caa0ff9e235139a269` |
| bms2 | [PDF](https://arxiv.org/pdf/1802.03261v2) | `b2338ef19714f39aeac2aaaa4e8d6bd708020815016bbe5541a74e4db3594038` |
| bm23 | [PDF](https://arxiv.org/pdf/2202.04818v2) | `12eb19e417531addbcf70d85facf33b1649ba5d8845c31ade9128c6000032955` |
| ammn | [PDF](https://arxiv.org/pdf/2003.12541v2) | `2a0224b2e8b7c5f19f326886b130f8be0158ba4cb602ba7eb5821990ca22b3fd` |
| cs | [PDF](https://arxiv.org/pdf/1912.10932v3) | `2f9d3ee868c244a7ddd6579a5dafed10a7ac9eb8b2ffe840db9f2bc115cd6ed4` |
| ecd | [PDF](https://arxiv.org/pdf/1709.07343v4) | `78ca42bba46f1d43c894b0dbfdfb41105efab4959ba5ba6e32e1e5cf7ef33efc` |
| ff | [PDF](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf) | `8c020573d3dce341088ea7e83fe1063b410686c08e3a144fa3c0de634667cc79` |
| mathew | [PDF](https://arxiv.org/pdf/1912.10968) | `d93b37226d0c4af6ee7e63165d833181914696d4af69383032aa4148c0b3a690` |

## Lean signature audit and validation

The final file has 22 proved `example`s, no definitions, axioms, `sorry`, `True` placeholders, or development chains. The heavy definition families are retained by name and subsection in its closing comment and in full in the README. These examples verify accessible conventions and negative controls; they do not encode the end equivalence using fake site or period-ring carriers.

Ten signature comparisons against the README:

| Lean example | README counterpart | Scope / hypotheses checked |
| --- | --- | --- |
| Zero-Frobenius kernel | §6.1 zero-map check | Arbitrary additive commutative group; no field assumption. |
| Prime-field Frobenius | §§6.1, 6.24 | Prime p via `Fact p.Prime`; not an arbitrary modulus. |
| F₂ Artin–Schreier cokernel | §6.1 / Layer 6 examples | Finite field, discrete degree-zero coefficient; proves failure of surjectivity. |
| φ−can scalar sign | §§6.1, 7.0 | Integer map with φ=2 and can=1; p=2 does not erase integral sign. |
| Mapping cone support | §6.1 cone-degree check | Both complexes zero away from degree 0; `mappingCone` has support −1,0, not fibre support. |
| Common Frobenius rescaling | §7.25 | Nonzero scalar and domain assumption provide cancellation; free-module matrix argument remains README mathematics. |
| Nonintegral inverse | §§7.4, 7.25 | Z-lattice inside Q; does not claim 2 is a unit in Z. |
| Curve degree sign | §7.0 filtered bundle checks | Integer t_H−t_N scalar computations; no field-as-DVR substitution. |
| Rational chart failure | §7.16 | ZMod 2 witnesses lack of implication p(x−1)=0 ⇒ x=1; the general chart is explicitly transversal. |
| Galois multiplication order | §7.0b three-factor check | Explicit permutations on three elements distinguish gh from hg; neither a commutative nor trivial group can test this. |

Additional examples pin target negation, integral and fractional internal weights, rank-zero normalization, dual inverse, the chart Frobenius value and the ramified dyadic uniformizer witness. The last uses a real scalar satisfying π²=2 only to disprove π=2; it is not presented as a formal construction of O_K.

Validation completed:

- `lean-check research/blueprint/packages/PrismaticCohomologyPartIII/Suggested.lean`: exit 0, no warnings, against Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and the shared pinned Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 environment. Memory was checked before compilation; no Lake build, update, cache download or language server was started.
- `python3 scripts/check_blueprint.py research/blueprint/packets/PrismaticCohomology--PR.0.json`: 290 nodes, 0 errors, 0 warnings. Existing 25 named gaps are historical input records; the checker is structural.
- `python3 scripts/check_blueprint.py research/blueprint/packets/PrismaticCohomology.json`: 13 nodes, 0 errors, 0 warnings; five named input gaps remain in that unmodified packet.
- Package relative Markdown links and explicit/generated anchors checked: no unresolved target.
- `python3 research/blueprint/intake.py check-files` on the submission files: 0 problems.
- `git diff --check`: clean.

No remaining package defect is deferred by this verdict. The maintainer's independent mathematical gate and upstream port are still separate steps. No source files, packet changes, consumer edits or library developments are submitted.
