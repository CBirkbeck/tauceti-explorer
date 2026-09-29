# Fargues–Fontaine, *Courbes et fibrés vectoriels en théorie de Hodge p-adique*: extraction and routing

Job PAPER-FARGUES-FONTAINE-18. Claude Code, session `cc-48533a`, 29 September 2026. The machine-readable extraction is `PAPER-FARGUES-FONTAINE-18.result.json`:

- 1109 items: 181 planned, 15 library, 913 missing (after the independent review; the extraction had 1106 items: 244 planned, 15 library, 847 missing);
- 9 routes;
- 11 prerequisite papers;
- 220 source issues (186 from the extraction, 34 added by the review).

**Version read.** The authors' copy `courbe.pdf`, dated 16 avril 2017, from the link in `papers.json`. It has Colmez's Préface (pp. 1–50) and Chapters 1–11 with the bibliography (pp. 51–389). Its SHA-256 is `cc159f38…922ca3`. The Astérisque 406 edition (2018, doi:10.24033/ast.1056) was not compared with it. Locators are the statement numbers and printed pages of the authors' copy.

**How it was read.** Nine readers read the whole book in parallel, one block each: the Préface, Chapter 1, Chapters 2–3, 4, 5, 6–7, 8–9, 10, and 11 with the bibliography. For the Préface, only statements that the chapters do not also state became items; its restatements of chapter results were matched to those results. The drafts were then merged:

- **Duplicates removed.** Twenty-two items were dropped. They were chapter results restated as black boxes in later chapters, for example Théorèmes 5.6.26, 5.6.29 and 9.3.1, or Propositions 7.1.1 and 7.1.2. Some were outside results listed twice, such as Dieudonné–Manin, the Lubin–Tate law and Colmez's category BC.
- **Library citations checked.** Every citation was checked against the declaration index at the pins. Three statuses were corrected:
  - Mathlib's Fontaine θ and its surjectivity cover only E = Q_p, so §2.1.2 and Proposition 2.1.10 are *planned* in RelativeFarguesFontaine RF2:untilts, not library.
  - Mathlib's Weierstrass preparation assumes the ring is complete for its maximal ideal. O_F is not, so that item is *missing*.
- **Planned stages checked.** Every planned stage exists in `data/atlas.json`.
- **Quotes and errors checked.** Every quoted passage was compared with the text. The errors claimed in stated results and the principal gaps were checked again against the book. These include Théorème 6.4.4, §6.1.3, §7.5, Lemme 5.6.14, Exemple 5.5.2.6, Proposition 4.6.14, Exemple 4.6.10, Lemme 3.4.5, Lemme 11.2.10, the H¹(O(d)) formulas and the definition of B_e.
- **DOIs checked.** The prerequisites' DOIs were confirmed on Crossref.

One recorded misprint was withdrawn because it depended on a superscript that the text layer does not show.

The extraction is complete, so no handoff is needed.

## What the book proves

E is a local field with residue field F_q, and F is a perfectoid field of characteristic p.

- **Chapters 1–3.** The theory of holomorphic functions of the variable π:
  - the rings B^b, B_I, B and B⁺ with Gauss norms and Newton polygons;
  - primitive elements and Weierstrass factorisation;
  - the points of Y and their Lubin–Tate parametrisation;
  - principality of the B_I, and divisors;
  - Galois descent from F̂̄ to a perfect F: points, residue fields, invariants.
- **Chapter 4.** The Banach spaces B^{φ^h=π^d} as periods of π-divisible O-modules, the universal cover X(G), and formal and spectral E-vector spaces.
- **Chapter 5.** Abstract curves, Harder–Narasimhan categories, Riemann spheres and generalised Riemann spheres. Classification criteria: Théorème 5.6.26 and Théorème 5.6.29, which works by degree-one modifications.
- **Chapters 6–7.** For F algebraically closed:
  - P = ⊕ B^{φ=π^d} is graded-factorial (Théorème 6.2.1);
  - the fundamental exact sequence holds (Théorème 6.4.1);
  - X = Proj(P) is a complete curve with B_e a principal ideal domain (Théorème 6.5.2).

  For F perfect, X_F is a complete curve and B_{F,e} is Dedekind with class group Hom(G_F, E^×) (Théorème 7.3.3, Propositions 7.2.1 and 7.2.4).
- **Chapter 8.** The classification of bundles when F is algebraically closed (Théorème 8.2.10), proved twice: by the Gross–Hopkins and Drinfeld period maps (§8.3), and by Banach–Colmez spaces (§8.4). Also bundles on X_Ē (Théorème 8.5.1) and the simple connectedness of X_Ē (Théorème 8.6.1).
- **Chapter 9.** Equivariant bundles and Galois descent. The Harder–Narasimhan filtration splits and the classification holds over any perfect F (Théorèmes 9.4.1 and 9.4.3), and π₁(X_{F,Ē}) = Gal(F̄|F) (Théorème 9.5.1).
- **Chapter 10.** G_K-equivariant bundles and B-pairs:
  - "faiblement admissible implique admissible" (Théorème 10.5.7);
  - de Rham implies potentially log-crystalline (Théorème 10.6.10).
- **Chapter 11.** φ-modules over B⁺, B⁺_ρ, B, E^† and the Robba ring, GAGA after Kedlaya–Liu, and Berger's theorem (Théorème 11.5.1).

The Préface tells how the curve was found. It also surveys the methods the curve replaced: Colmez's skew field 𝒞 and his Banach spaces of finite dimension, Fontaine's almost C-representations, Kedlaya's slope theory, and Berger's (φ,Γ)-modules.

## What the atlas already has

The atlas builds the curve by Fargues–Scholze's relative, adic route:

- RelativeFarguesFontaine RF0–RF4;
- VectorBundlesAndIsocrystals VB0–VB4;
- FarguesFontaineDiamonds F0–F5.

The 244 planned items are spread as follows:

| Roadmap | Planned items |
|---|---|
| VectorBundlesAndIsocrystals | 98 |
| PadicHodgeTheory | 69 |
| RelativeFarguesFontaine | 54 |
| PadicDifferentialEquationsAndRigidCohomology | 53 |
| PerfectoidSpaces | 22 |

Some items name more than one roadmap, so the counts overlap. The rest are in PhiGammaModulesAndIwasawaCohomology, AdicSpacesPartII, the Tau Ceti roadmaps and a few others.

What the atlas plans, by topic:

- **Constructions.** Ramified Witt vectors, the rings and Frobenius, untilts and B⁺_dR, the graded algebra and Proj.
- **Bundle theory.** The Harder–Narasimhan formalism for bundles on the curve, the classification at geometric points (Théorème 8.2.10(1), (2a), (3), (4)), and H⁰, H¹ of O(d).
- **Hodge-theoretic endpoints.** Weak admissibility and admissibility in R06.2, and the monodromy theorem in R06.3.
- **Kedlaya's analytic framework.** Robba rings and slope filtrations in RD.0–RD.2.

Fifteen items are in the libraries:

- **Tau Ceti.** Divisors on schemes, which cover §5.1's curves:
  - `SchemeWeilDivisor` and its degree;
  - O_X(D);
  - the principal divisor map;
  - `OrderSystem.IsWeightedDegreeZero` for complete curves.
- **Mathlib:**
  - the tilt valuation and Kummer theory;
  - `LinearMap.det_restrictScalars`;
  - unique factorisation;
  - roots over algebraically closed fields;
  - split finite étale algebras;
  - the open mapping theorem;
  - Morita equivalence;
  - the inverse function theorem as Lemme 11.2.11 uses it;
  - Jensen's formula.

The 847 missing items are the book's own method, which is not the atlas's. They fall under four headings:

1. the function theory of the variable π, and the schematic curve over a perfect field that is not algebraically closed;
2. an abstract bundle theory, with the classification over such fields and the φ-module descriptions;
3. the periods of p-divisible groups;
4. p-adic Hodge theory read on equivariant bundles.

## Routes

Four missing directions are proposed as Part II's. Smaller groups of items go as sources to existing layers.

1. **Source: RelativeFarguesFontaine RF0** (24 items). This is §1.2, ramified Witt vectors for every O_E-algebra:
   - Dwork's criterion, F and V_π;
   - comparison and base change under change of E;
   - the Q-twisted functor;
   - the Lubin–Tate Teichmüller lifts [x]_Q that Chapter 2 uses to write primitive elements.

   RF0 constructs W_OE(R) for perfect R and is the layer these belong in.
2. **Part II of RelativeFarguesFontaine: holomorphic functions of the variable π and the schematic curve over a perfect field** (315 items). This takes Chapters 1–3, 6 and 7, §§11.2.1–11.2.4, and the Préface's points about B_e and the points of X. No layer proves the zeros-of-functions theory. FarguesFontaineDiamonds F4 says it does not classify closed points for non-algebraically-closed F, and VB2:ampleness covers the schematic curve only at geometric points.
3. **Part II of VectorBundlesAndIsocrystals** (244 items after the review). It joins the existing VectorBundlesAndIsocrystalsPartII proposal from Colmez–Nizioł, under that proposal's exact title. It covers:
   - the abstract Harder–Narasimhan and classification theory of Chapter 5;
   - the Banach–Colmez proof and X_Ē in Chapter 8;
   - Chapter 9's classification and π₁ over any perfect F, which VB0 explicitly leaves out;
   - the φ-module descriptions of Chapter 11;
   - Colmez's Espaces de Banach de Dimension finie and Fontaine's almost C-representations, as the Préface presents them.
4. **Part II of FiniteFlatGroupsAndIntegralPadicHodgeTheory: π-divisible O-modules, universal covers and period maps** (160 items). It covers:
   - Chapter 4;
   - the Gross–Hopkins and Drinfeld theorems of §8.1;
   - the Rapoport–Zink period map and minuscule modifications of §8.3, which give the first proof of the classification;
   - Harder–Narasimhan filtrations of finite flat group schemes;
   - the Lubin–Tate formal groups used in Chapters 1–2.

   R07.2 stops at Dieudonné theory over perfect fields. The brief imports the Lubin–Tate Part II and the prismatic Dieudonné Part II already proposed, rather than duplicating them.
5. **Part II of PadicHodgeTheory: G_K-equivariant bundles on the curve** (104 items). This is all of Chapter 10, Berger's Théorème 11.5.1, and the Préface's B-pairs and Lie-type extensions. PadicHodgeTheory plans both end theorems by the Colmez–Fontaine and Berger routes. The Part II gives the curve's proofs and must show they agree.
6. **Source: PadicDifferentialEquationsAndRigidCohomology RD.0 and RD.1** (9 items):
   - Lazard's closed ideals;
   - the closed ideals of the Robba ring;
   - Kedlaya's comparisons of φ-modules over E^†, ℰ and R.
7. **Source: PadicHodgeTheory R06.1–R06.3** (12 items). These are the classical proof ingredients for results those layers own:
   - Sen's theorem, for R06.1;
   - Colmez–Fontaine's neighbouring representations and Berger's ∆(D), for R06.2;
   - Berger's monodromy for non-étale (φ,Γ)-modules, for R06.3.
8. **Source: VectorBundlesAndIsocrystals VB3 and VB3:general-BC** (4 items; replaced by the independent review). Colmez's Dimension (dim, ht) and the abelian category BC. The extraction's route here, to FarguesFontaineDiamonds F1 and F3, was rejected: F1 is for E = Q_p only and F3 computes no π₁. Its items went to route 1 (the diamond identity, with RF1) and route 3 (Weinstein's π₁ computations).
9. **Source: PhiGammaModulesAndIwasawaCohomology PG.0 and PG.2** (2 items). The field of norms of the Kummer tower, and Cherbonnier–Colmez decompletion.

Each Part II brief states its final theorems in the book's numbering, the coverage in order, the imports by title and id, the corrections to carry and the tests.

## Source issues

There are 186 source issues: 140 misprints, 32 errors and 14 gaps. Of these, 30 affect a stated result and 26 affect a proof. None was already recorded in the atlas, which has no source issues for this book. Neither Fargues's publications page nor the SMF page of the Astérisque edition lists an erratum. Issue numbers by block:

| Block | Issues |
|---|---|
| Préface | E1–E24 |
| Chapter 1 | E25–E50 |
| Chapters 2–3 | E51–E72 |
| Chapter 4 | E73–E97 |
| Chapter 5 | E98–E123 |
| Chapters 6–7 | E124–E136 |
| Chapters 8–9 | E137–E154 |
| Chapter 10 | E155–E171 |
| Chapter 11 | E172–E186 |

**Stated results that need a correction** (the main ones):

- **E127, Théorème 6.4.4.** The ideal is generated by φ(Π⁻(a₁)⋯Π⁻(a_d)), not by Π⁻(a₁)⋯Π⁻(a_d). For E = Q_p and y = ker θ, the printed generator [ε^{1/p}] − 1 is not even in the ideal; Fontaine's generator is [ε] − 1.
- **E128, §6.1.3.** As printed, the line L_{π_E',π_E} is {0} for general uniformizers. u must be taken in W_{O_E'}, as in Proposition 4.1.8.
- **E114, Lemme 5.6.14.** det(f_*E) ≅ det(f_* det E) fails in rank ≥ 2 unless det(f_*O_X) is trivial; the formula needs a factor det(f_*O_X)^{⊗(rk E − 1)}. Proposition 5.6.15 survives, because that factor has degree 0.
- **E109, Exemple 5.5.2.6.** With deg = length(coker Φ), a generic isomorphism *lowers* the degree by (deg σ − 1)·length(coker u), so the Harder–Narasimhan axiom fails. The degree must be −length(coker Φ).
- **E105 and E106, §5.5.** Théorème 5.5.3 plots (deg, rg) for (rg, deg). Définition 5.5.5 omits X′ ≠ X, so as printed nothing is stable.
- **E140 and E141, §8.2.** The formulas for H¹(X, O(d)), d < 0, print t^d for t^{−d}.
- **E153, Théorème 9.4.3.** The bijection needs the ρ_i to be non-zero.
- **Chapter 4:**
  - E87: bounded subsets of M(A) are only relatively compact (Proposition 4.6.14(1)).
  - E94: the valuation formula of Exemple 4.6.10 fails, for example at (α, β) = (1/p, 1 − 1/p).
  - E93: Définition 4.6.22's growth condition is vacuous on N[1/p]^d.
  - E75, E82 and E95: indexing and sign slips in L_{d,h}, Exemple 4.5.8 and the logarithm of X(Ĝ_m).
- **Chapter 1.** E42, E43 and E45 in §1.7: the completion is (π,T)-adic, not π-adic; the norms of Lemme 1.7.2 agree only up to the power r; and the range after Proposition 1.7.3 is too large for q ≥ 3.
- **Chapter 10:**
  - E159: Proposition 10.2.7 is claimed for every compact I, but the map to B_dR needs I to meet the Frobenius orbit of y_∞.
  - E167 and E168: in §10.6.5.3 and Proposition 10.6.18(2), H¹ should read H¹_g. The printed statement is false for h ≥ 2.
- **Chapter 11.** E180: Lemme 11.2.10 is false as stated (counterexample Z = diag(T, T⁻¹) over E⟨T^{±1}⟩). The tangent-map hypothesis that its application satisfies must be added.
- **Préface:**
  - E2: the degree is defined as t_N − t_H, the opposite of the chapters' convention.
  - E6: Exemple 2.23(ii) needs log[(1+p)^♭].
  - E15: Remarque 2.38(i) needs ⊕_{λ≤μ}.
  - E18: the Newton-polygon normalisation of Théorème 3.1 fails for ramified E.
  - E21: Théorème 3.11(v).
  - E8: Proposition 2.28(i) is missing the sign (−1)^i.

**Errors and gaps in proofs:**

- **Chapter 2 gaps:**
  - E55: the case p = 2 of Proposition 2.2.6 is left as an exercise.
  - E57: the second proof of Proposition 2.2.15 fails for q = 2.
  - E64: Proposition 2.3.19 is not proved.
- **Chapters 2–3 errors:**
  - E63: the inequality in the proof of Proposition 2.3.16 is false.
  - E71: Lemme 3.4.5 uses |z_i| = ‖y‖^d where |z_i| = ‖y‖, which spoils the estimate's uniformity.
- **Chapter 5 gaps:**
  - E99: the proof of Lemme 5.2.4 stops after "Si".
  - E101: the case split in Lemme 5.2.8 is incomplete.
  - E117 and E119: Propositions 5.6.23(2) and (4) apply the coprime case to numbers that need not be coprime.
  - E123: the proof of Théorème 5.6.29 needs a suitable choice of embedding.
- **Chapters 5 and 7 errors:**
  - E121: Proposition 5.6.25 assumes the standard Galois action on GL_a.
  - E134: §7.5 uses B_{E′} = B_E ⊗_E E′, which is false for unramified E′; §1.6.2 has ⊗_{E′₀}.
- **Chapter 9 gap.** E154: in Théorèmes 9.3.4 and 9.4.1, Proposition 7.1.2 is applied beyond its statement.
- **Chapter 10:**
  - E156: Proposition 10.1.1 misses unramified characters of infinite order.
  - E171: Hyodo's alternative argument in §10.6.5.4 fails (counterexample over Q_p(√p)).
- **Chapter 11:**
  - E175 and E176: the proofs of Lemme 11.1.6 and Théorème 11.1.8 assume F_{q^h} ⊂ k_F.
  - E181: Proposition 11.2.12 chooses a neighbourhood before the matrix it depends on.

The 124 misprints that affect nothing are index, sign and reference slips. Among them are the wrong reference [14] for [15] (Drinfeld), and B_e = B[1/t]^{φ=π} for φ = Id (§9.1.1). Each is listed with its correction.

## Prerequisite papers not yet covered by the atlas

1. Colmez, *Espaces de Banach de dimension finie* (J. Inst. Math. Jussieu 2002), doi:10.1017/S1474748002000099.
2. Colmez, *Espaces vectoriels de dimension finie et représentations de de Rham* (Astérisque 319, 2008).
3. Fontaine, *Groupes p-divisibles sur les corps locaux* (Astérisque 47–48, 1977).
4. Gross–Hopkins, *Equivariant vector bundles on the Lubin–Tate moduli space* (Contemp. Math. 158, 1994), doi:10.1090/conm/158/01453.
5. Drinfeld, *Coverings of p-adic symmetric domains* (Funct. Anal. Appl. 1976), doi:10.1007/BF01077936.
6. Lazard, *Les zéros des fonctions analytiques d'une variable sur un corps valué complet* (Publ. IHÉS 1962), doi:10.1007/BF02684326.
7. Kedlaya, *Slope filtrations revisited* (Doc. Math. 2005), doi:10.4171/dm/197.
8. Berger, *Construction de (φ,Γ)-modules : représentations p-adiques et B-paires* (Algebra Number Theory 2008), doi:10.2140/ant.2008.2.91.
9. Fargues, *La filtration de Harder–Narasimhan des schémas en groupes finis et plats* (J. reine angew. Math. 2010), doi:10.1515/crelle.2010.058.
10. André, *Slope filtrations* (Confluentes Math. 2009), doi:10.1142/S179374420900002X.
11. Hartl–Pink, *Vector bundles with a Frobenius structure on the punctured unit disc* (Compos. Math. 2004), doi:10.1112/S0010437X03000216.

Kedlaya–Liu is already in `papers.json`. The DOIs were confirmed on Crossref. None of these papers was read for this job.

## Corrections by the independent review

REV-PAPER-FARGUES-FONTAINE-18 (Claude Code, session `cc-f805bf`, 29 September 2026) made these changes. The reasons are in `research/blueprint/reviews/REV-PAPER-FARGUES-FONTAINE-18.md`.

- **Source issues.**
  - A `review` verdict on each of E1–E186. All are confirmed except E64: Proposition 2.3.19 is openly left as an exercise and its proof is routine.
  - Sixteen entries had a field corrected: E2, E5, E12, E25, E46, E57, E67, E88, E96, E109, E127, E138, E148, E164, E179 and E183.
- **New issues E187–E220.** Eight affect a stated result:
  - E187: Préface §2.5.2, I′ = ((p−1)/p)I;
  - E193: Lemme 1.6.8 at ρ = 0;
  - E198: Théorèmes 2.5.1(2) and 3.5.1(2), where the isomorphism is |Y_{I∖{0}}| ⥲ Spm(B_I);
  - E199: Proposition 3.1.7, where L|F need not be Galois;
  - E211: Théorème 6.4.4 needs the orbit hypothesis of 6.4.1;
  - E215: Proposition 10.6.18(1) needs k_K algebraically closed;
  - E218: Proposition 11.2.24 is false, since completion φ-Mod_{E^†} → φ-Mod_ℰ is not fully faithful;
  - E219: Lemme 11.2.25 is false for a non-bijective φ.

  The other 26 are misprints that affect nothing.
- **Items.**
  - New items 1107 (Préface Théorème 3.16, planned at RF0:annuli), 1108 (Remarque 1.4.4) and 1109 (Exemples 2.3.7 and 2.3.10).
  - 44 statements, 4 locators and many notes corrected, notably items 67, 114, 209–219, 332, 333, 377, 493, 500, 523, 534, 611, 612, 633, 675, 705, 878, 902, 1062, 1087 and 1089, which now carry corrected statements.
- **Statuses.**
  - 65 planned items became missing, because the cited layer plans only a special case: 59, 68–71, 78, 80, 196, 201, 222, 223, 225, 230, 265, 270, 312, 333, 371, 452, 498, 510, 590, 592–595, 597, 599–603, 606, 608, 610, 619, 641, 647–652, 661, 774, 882, 903, 923, 924, 934, 964, 966, 979, 995, 998, 1000, 1019, 1052, 1054, 1059, 1065, 1067, 1071, 1088 and 1100.
  - Item 707 became planned (VB2:ampleness).
  - Items 392, 574, 607 and 883 had their planned lists corrected.
- **Routes.**
  - Route 1 gained RF1 and item 94.
  - Route 2 gained Chapter 4.1 (405–415), items 1108–1109 and the status-corrected items of Chapters 1–3 and 11, and lost 707. Its brief now names imports by title and id, adds Tau Ceti Foundations of adic spaces Layer 6 and P7:annulus-foundations, and fixes the hypotheses of 3.5.1, 6.2.7 and 6.4.1.
  - Route 3 takes the byte-identical title of the accepted VectorBundlesAndIsocrystalsPartII. It gained the Chapter 5 status corrections, 1019, 1085, 1086, 1099, 1100, 96 and 97, and lost 27, 28, 837 and 838.
  - Route 4 lost 405–415 and gained 452, 498, 510 and 774. Its brief names one owner of the universal cover and the import directions.
  - Route 5 gained the Chapter 10 status corrections and 1103. Its brief exports B-pairs and asks for one owner, with AdmissiblePairsAndPadicHodgeStructures, of lattices versus filtrations.
  - Route 6 gained 59 and 1088, and lost 1085, 1086 and 1099.
  - Route 8 (FarguesFontaineDiamonds F1/F3) was rejected and replaced by a VB3 and VB3:general-BC source route for 27, 28, 837 and 838.
  - Route 9 lost 1103 and gained 78 and 80.
- **Summary.** Updated with the new counts and the main findings.
