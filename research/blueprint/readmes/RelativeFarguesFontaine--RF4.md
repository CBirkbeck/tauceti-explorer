# Relative Fargues–Fontaine curves, part RF4: patching and modifications

Blueprint for the roadmap `RelativeFarguesFontaine` (*Foundations of adic spaces, Part II: relative Fargues–Fontaine curves and period geometry*, the title RS-20 gives it), job `BP-RelativeFarguesFontaine--RF4` (issue #986). Packet: `research/blueprint/packets/RelativeFarguesFontaine--RF4.json` (`"part": "RF4"`). Suggested Lean file: `research/blueprint/suggested/RelativeFarguesFontaine--RF4.lean`. Handoff: `research/blueprint/handoff/BP-RelativeFarguesFontaine--RF4.md`. The first part, `RF0`–`RF3`, is `BP-RelativeFarguesFontaine--RF0` (issue #985).

**Status: complete (a finished planning pass for review).** 22 nodes (1 comparison, 2 constructions, 4 definitions, 15 theorems), 57 API items, 25 unit tests, 7 planets, 32 baseline declarations, 1 gap, 2 requests, 3 structural notes. All three stages in scope are `planned`.

Pinned baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Purpose and scope

This part plans the two operations the rest of the Fargues–Scholze programme performs on bundles over the relative curve: **patching** a vector bundle along a relative Cartier divisor from a bundle away from the divisor and a lattice over its completed local ring (Beauville–Laszlo gluing), and **modifying** a `G`-bundle at a divisor. Its consumers are the Beauville–Laszlo uniformization `Gr_G → Bun_G` (`BunGAndNewtonStrata:BG2:uniformization`), the loop-group description of the Beilinson–Drinfeld Grassmannian and local Hecke stacks (`GeometricSatakeAndFusion:GS0:loop-geometry`), the Hecke correspondences and local shtuka moduli (`HeckeStacksAndLocalShtukas:HS0`, `HS2`), and the essential surjectivity of Fargues' theorem on Breuil–Kisin–Fargues modules (`AInfCohomology:AI.2`, see the structural notes).

The layers in scope:

- `RF4:vector-bundles` — *Linear patching.* Beauville–Laszlo gluing of finite locally free modules along the Cartier divisors of RF2, with a fully faithful and essentially surjective gluing functor, compatibility with tensor products, duals, exact sequences, base change, coefficient change and several disjoint or colliding legs, and the non-noetherian hypotheses retained (completion is not fpqc).
- `RF4:G-torsors` — *Tannakian transfer.* Narrowed by RS-20: BG0 owns the general equivalence of the geometric, cohomological and Tannakian descriptions of `G`-torsors; this layer transfers the linear gluing to `G`-bundles (with effectivity), proves that meromorphy is tested on one faithful representation and that the gluing commutes with change of structure group, base change and addition of legs, keeps the relative v-descent and étale-local triviality theorem, and constructs the modification of a `G`-bundle by a lattice that GS0, BG2, HS0 and HS2 use.
- `RF4` — the aggregate of the two (RS-20: *keep*, not a third patching construction).

Not in scope, and where it lives: the curves `𝒴_S`, `Y_S`, `X_S`, the divisors `Div^d` and the rings `B^+_{Div^d}`, `B^+_dR` (RF0–RF2); line bundles `O(n)`, the graded ring `P` and `Proj P` (RF3); GAGA and ampleness (`VectorBundlesAndIsocrystals:VB2:ampleness`); the three descriptions of torsors (`BunGAndNewtonStrata:BG0`); the loop groups `L^+G`, `LG`, the Grassmannian `Gr_G = LG/L^+G` and its Schubert cells (`GeometricSatakeAndFusion:GS0`); `Bun_G` and its uniformization (`BunGAndNewtonStrata:BG2`).

## Conventions

- `E` is a nonarchimedean local field with residue field `F_q` and uniformizer `π`. `S = Spa(R, R⁺)` is an affinoid perfectoid space over `F_q` with pseudouniformizer `ϖ`. `𝒴_S = Spa W_{O_E}(R⁺) ∖ V([ϖ])`, `Y_S = 𝒴_S ∖ V(π)`, `X_S = Y_S/φ^ℤ` (RF0, RF1). `𝒳` denotes any of the three.
- A map `S → Div^d_{(−)}` gives a closed Cartier divisor `D = D_S ⊂ 𝒳` with invertible ideal sheaf `I_D` (RF2:integral-divisors). When `D` is affinoid, which holds locally on `S`, `B^+_D(S)` is the ring of global sections of the `I_D`-adic completion of `O_𝒳` along `D` and `B_D(S) = B^+_D(S)[1/I_D]`; these are Fargues–Scholze's `B^+_{Div^d}(S)`, `B_{Div^d}(S)`, and `B^+_dR`, `B_dR` when `d = 1`.
- `E(kD) = E ⊗ I_D^{−k}`. A *lattice* in a finite projective `B_D(S)`-module `N` is a finite projective `B^+_D(S)`-submodule `Ξ` with `Ξ[1/I_D] = N`.
- **Sign.** `O(∞) ≅ O(1)` (the degree-one divisor of a section of `O(1)`), so the lattice `ξ^k B^+_dR ⊂ B_dR` corresponds to `O(−k)`. Fargues–Scholze Proposition III.3.6(ii) shows how easily this sign is lost; unit tests pin it (`GModification.gm_geometric_point`, `modify_gm_degree`).
- `G`-bundles are Tannakian: exact tensor functors `Rep_E G → Bun(𝒳)` for `G` linear algebraic over `E`, or `Rep_{O_E} G` on finite free modules for `G` smooth affine over `O_E`. Over an affine scheme `Spec B`, `Bun` means finite projective `B`-modules.
- Kedlaya–Liu's §8.9 works with `φ^a`-modules over `ℚ_p` (Hypothesis 8.7.1), which is the unramified coefficient field `E = W(F_q)[1/p]`, `q = p^a`. Their `L_X` is the line bundle of the untilt divisor; its slope is `1/a`, not `1` as printed (PAPER-KEDLAYA-LIU-15/E78, already recorded).
- No noetherian hypothesis is made anywhere. `R → R̂` need not be flat, and no descent datum over `R̂ ⊗_R R̂` is ever used.

## Sources

- **`SW20-berkeley`** — Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*. Annals of Mathematics Studies 207; author PDF dated 'March 27, 2020' on every page header. <https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf>. SHA-256 `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc`. Read: 5.2 (Theorem 5.2.8, Lemma 5.2.9 and the remark after it), printed pp. 37-38; 12.4 (Remarks 12.4.4-12.4.5, Proposition 12.4.6 and its proof), printed pp. 105-107; 14.1 (Theorem 14.1.1 and its proof), 14.2 (Theorem 14.2.1, Lemma 14.2.3), 14.3 (Lemma 14.3.1 and the end of the proof of 14.2.1), printed pp. 115-121; 19.1 (Definition 19.1.1, Proposition 19.1.2 and its proof, Remark 19.1.3, Lemmas 19.1.4-19.1.5), printed pp. 169-171; Appendix to Lecture 19, 19.5 (Theorem 19.5.1 with footnote 1, Theorem 19.5.2, Proposition 19.5.3 and proofs), printed pp. 178-181; Read 2026-10-06 by BP-RelativeFarguesFontaine--RF4 (claude-QXE3hL); hash reproduced.
- **`FS-geometrization`** — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*. Author-hosted 356-page PDF (MPIM Bonn); corresponds to arXiv:2102.13459v4 by contents. <https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf>. SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`. Read: III.3, the Beauville-Laszlo uniformization paragraph before Proposition III.3.1, printed pp. 97-98; VI.1, from the definition of the rings B^+_{Div^d} through Definitions VI.1.5-VI.1.8 and Propositions VI.1.7, VI.1.9 with proofs, printed pp. 192-194; Read 2026-10-06 by BP-RelativeFarguesFontaine--RF4; hash reproduced.
- **`KL15-foundations`** — Kiran S. Kedlaya, Ruochuan Liu, *Relative p-adic Hodge theory: foundations*. arXiv:1301.0792v5 (9 May 2015, version to appear in Asterisque 371); the published Asterisque text was not read. <https://arxiv.org/abs/1301.0792v5>. SHA-256 `a6a117423db62aec072442bb15b70e3175bcc3b631bdcd6d74f740e3c6cfd942`. Read: 1.3 (Definitions 1.3.1-1.3.2, Theorems 1.3.4-1.3.5, Proposition 1.3.6, Definition 1.3.7, Lemmas 1.3.8-1.3.9, Corollary 1.3.10 with proofs), pp. 15-19; Remark 2.7.9 (glueing proof of Proposition 1.3.6), p. 58; 8.7 (Hypothesis 8.7.1 to Corollary 8.7.9), pp. 176-178; 8.9 (Hypothesis 8.9.1 to Theorem 8.9.6), pp. 187-188; Read 2026-10-06 by BP-RelativeFarguesFontaine--RF4.
- **`Stacks-BL`** — The Stacks project authors, *The Stacks project, More on Algebra, Section 15.92 The Beauville-Laszlo theorem (tag 0BNI), with Sections 15.9 and 15.11*. Online version, tags 0BNI, 0BNR, 0BNS, 0BNW, 0BP2, 07M7 and 0ALJ, accessed 2026-10-06. <https://stacks.math.columbia.edu/tag/0BNI>. Read: Section 15.92 complete: Lemmas 15.92.1-15.92.4, Remark 15.92.5, glueing pairs, Lemma 15.92.6, Remarks 15.92.7-15.92.8, Example 15.92.9, glueable modules, Lemma 15.92.10, Remark 15.92.11, Example 15.92.12, Lemmas 15.92.13-15.92.15, Theorem 15.92.16, Remark 15.92.17, Lemmas 15.92.18-15.92.19, Remark 15.92.20; Lemma 15.9.14 (tag 07M7) and Lemma 15.11.4 (tag 0ALJ).
- **`CS17-generic`** — Ana Caraiani, Peter Scholze, *On the generic part of the cohomology of compact unitary Shimura varieties*. arXiv:1511.02418v1 (8 November 2015); published in Annals of Mathematics 186 (2017), where Theorem 3.5.1 is on p. 687. <https://arxiv.org/abs/1511.02418v1>. SHA-256 `aa93df3947e57ab78b070a82d638e70c25ae2ae15aeb60346575e74fdf85b349`. Read: 3.5, the paragraph before Theorem 3.5.1, Theorem 3.5.1 and Corollary 3.5.2; Read 2026-10-06.
- **`FF18-courbe`** — Laurent Fargues, Jean-Marc Fontaine, *Courbes et fibres vectoriels en theorie de Hodge p-adique*. Asterisque 406 (2018); author copy courbe.pdf dated 16 avril 2017. <https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf>. SHA-256 `cc159f38a3801c736b71ecea363496abe7706550bfb416600718ee9933922ca3`. Read: 5.3 (Proposition 5.3.1, Corollaire 5.3.2, 5.3.2 and Proposition 5.3.3), pp. 208-209; 5.6.4.2, the definition of a modification of a bundle before Theoreme 5.6.29, p. 238; Read 2026-10-06.
- **`HK-admissible`** — Sean Howe, Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: The bi-analytic Ax-Lindemann theorem*. arXiv:2308.11064v2 (28 February 2025). <https://arxiv.org/abs/2308.11064v2>. SHA-256 `c133b06bec1209a04f84d1c2984b78ce2242ba85fc1b72cf5a662002685cab8a`. Read: 4.3 Modifications, p. 29; Read 2026-10-06.
- **`Kedlaya-Ainf`** — Kiran S. Kedlaya, *Some ring-theoretic properties of A_inf*. arXiv:1602.09016v5 (11 June 2019); published in p-adic Hodge theory, Simons Symposia, Springer 2020 ([Ked20] of Guo-Reinecke; cited by SW20 as [Ked19b, Theorem 3.6], whereas the statements used are Theorems 3.8-3.9 of arXiv v5; the published numbering was not checked). <https://arxiv.org/abs/1602.09016v5>. SHA-256 `ee95ce2f5a96529f77661852046c29aa641803e6df5c5c771bb3484e9a2d3530`. Read: 2 (Hypothesis 2.1, Definition 2.2, Lemma 2.3, Theorem 2.7); 3 (Proposition 3.2, Hypothesis 3.4, Definition 3.5, Proposition 3.6, Theorems 3.8-3.9, Example 3.10, Remark 3.11, Example 3.14); Read 2026-10-06.
- **`GR24-prismatic`** — Haoyang Guo, Emanuel Reinecke, *A prismatic approach to crystalline local systems*. arXiv:2203.09490v3 (27 October 2023); published in Inventiones Mathematicae 236 (2024). <https://arxiv.org/abs/2203.09490v3>. SHA-256 `3c49a5f2aa6023c7b01a5ba83a370ddcb92642f4819f64446b7d93bf01b28d26`. Read: Remark 1.5, p. 4; proof of Theorem 4.15, pp. 43-44; Convention 9.2, Lemma 9.8 and Proposition 9.9 with proof, pp. 80-87; Read 2026-10-06.
- **`GR02-almost`** — Ofer Gabber, Lorenzo Ramero, *Almost ring theory*. arXiv:math/0201175v3, sixth and final release (2002); Fargues-Scholze cite the Springer LNM 1800 (2003) edition as [GR03], whose numbering was not checked. <https://arxiv.org/abs/math/0201175v3>. SHA-256 `c4ab39ad5cd3f95f12a4c2f1f100f0c9f91578c6cbe2085a1962d111df8d7dc8`. Read: Proposition 5.4.21 and Claim 5.4.22, Corollary 5.4.42, Theorem 5.8.14 (statements); Read 2026-10-06.
- **`DM82-tannakian`** — Pierre Deligne, James S. Milne, *Tannakian categories*. Revised version of LNM 900 (1982), dated November 4, 2018, author-hosted. <https://www.jmilne.org/math/xnotes/tc2018.pdf>. SHA-256 `fab326945330dcf45960fdac1eef59fd91465cede4ffbc2fdb7c3cd77b3c3753`. Read: Section 2, Propositions 2.20-2.21 with proofs and footnote 11; Read 2026-10-06.
- **`BMS18-integral`** — Bhargav Bhatt, Matthew Morrow, Peter Scholze, *Integral p-adic Hodge theory*. arXiv:1602.03148v3; published in Publications mathematiques de l'IHES 128 (2018). <https://arxiv.org/abs/1602.03148v3>. SHA-256 `285f7d2088607688365ca92222dcf44c0acd6c4788dd872fe6a6191b9c4e072a`. Read: Theorem 4.28 and Remark 4.29, pp. 42-43; Read 2026-10-06.

All hashes were reproduced on 2026-10-06 where a previous packet recorded them (Berkeley lectures, Fargues–Scholze, Kedlaya–Liu, Gabber–Ramero, BMS1, Fargues–Fontaine).

## What the pinned libraries supply

`data/library-coverage.json` has no reviewed audit entry for this roadmap; the pinned sources were searched directly. Every declaration below was read in its Lean file at the pinned commit.

| declaration | use here |
| --- | --- |
| `mathlib:AdicCompletion` | The I-adic completion of a module; with I = (f) it is the ring R-hat of the Beauville-Laszlo lemma and, for I the divisor ideal on an affinoid chart, the ring B^+_D. |
| `mathlib:AdicCompletion.of` | The canonical map M -> AdicCompletion I M, the first leg of the Beauville-Laszlo square. |
| `mathlib:IsAdicComplete` | I-adic completeness (Hausdorff and precomplete); B^+_D is I_D-adically complete. |
| `mathlib:IsLocalization.Away` | Localization away from one element; the ring R[1/f] of the Beauville-Laszlo square and B_D = B^+_D[1/xi]. |
| `mathlib:Localization.Away` | The concrete localization R[1/f]. |
| `mathlib:nonZeroDivisors` | The submonoid of nonzerodivisors; f in it makes (R, f) a glueing pair. |
| `mathlib:Module.Projective` | Projective modules; finite projective modules are the vector bundles on affine schemes and sheafy affinoids. |
| `mathlib:Module.Finite` | Finitely generated modules; finite glueing data. |
| `mathlib:Module.FinitePresentation` | Finitely presented modules; Kedlaya-Liu Lemma 1.3.9(a) shows the module of sections is finitely presented. |
| `mathlib:Module.Flat` | Flat modules; flat modules are glueable, and flatness is checked on the two pieces (Stacks 15.92.18). |
| `mathlib:Module.FaithfullyFlat` | Faithful flatness; R -> R-hat x R[1/f] need not be flat, which is why Beauville-Laszlo is not fpqc descent. |
| `mathlib:Module.Free` | Free modules; trivial bundles and the field case of the B-pair description. |
| `mathlib:Module.Dual` | The dual module; duals of glueing data and of modifications. |
| `mathlib:Module.Invertible` | Invertible modules (M^dual tensor M = R); the ideal I_D of a closed Cartier divisor is invertible. |
| `mathlib:TensorProduct` | Tensor products of modules; base change of glueing data and tensor products of lattices. |
| `mathlib:LinearEquiv` | Linear isomorphisms; the comparison isomorphisms psi_1, psi_2 and beta of a glueing datum. |
| `mathlib:CommAlgCat.FiniteEtale` | The category of finite etale R-algebras, the FEt(R) of Kedlaya-Liu Corollary 1.3.10. |
| `mathlib:Algebra.Etale` | Etale algebras. |
| `mathlib:Algebra.Smooth` | Smooth algebras; the coordinate ring of a torsor under a smooth group is smooth over the base. |
| `mathlib:Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete` | If A is formally smooth over R and S is I-adically complete, every R-algebra map A -> S/I lifts to A -> S. This is the step 'triviality modulo I_S implies triviality' for torsors over B^+ (FS VI.1.7). |
| `mathlib:HenselianRing` | Henselian pairs; an I-adically complete ring is henselian along I (instance in the same file), the hypothesis of Gabber-Ramero 5.4.21. |
| `mathlib:IsDiscreteValuationRing` | Discrete valuation rings; at a geometric point B^+ is a finite product of complete DVRs with algebraically closed residue field. |
| `mathlib:BDeRhamPlus` | Mathlib's B_dR^+ of an integral perfectoid ring: the ker(theta)-adic completion of W(R-flat)[1/p]; zero if p = 0 in R. The p-typical case of the ring R_2 of Kedlaya-Liu Definition 8.9.4. |
| `mathlib:BDeRham` | Mathlib's B_dR: BDeRhamPlus with the generators of ker(theta) inverted. The p-typical case of R_3. |
| `mathlib:WittVector` | p-typical Witt vectors; A = W(R^+) in Kedlaya's algebraicity theorem. |
| `mathlib:CategoryTheory.Equivalence` | Equivalences of categories: the gluing functors. |
| `mathlib:CategoryTheory.Functor.Monoidal` | Monoidal functors, the form of the exact tensor functors Rep G -> Bun. |
| `mathlib:CategoryTheory.MonoidalCategory` | Monoidal categories. |
| `tauceti:TauCeti.Comodule.IsFaithful` | A comodule (representation) is faithful if its representation morphism to a general linear group is a closed immersion for some finite basis; the faithful V of the meromorphy criterion. |
| `tauceti:TauCeti.Comodule.isFaithful_iff_isClosedImmersion_coordinateGroupSchemeHom` | Faithfulness is independent of the witnessing basis: for any finite basis b, faithful iff the coordinate morphism is a closed immersion. |
| `tauceti:TauCeti.AffineGroupSchemeCat` | Affine group schemes; the structure group G. |
| `tauceti:TauCeti.ReductiveAffineGroupSchemeCat` | Reductive affine group schemes of finite type over a field: the hypothesis on G over E in FS Definitions VI.1.6 and VI.1.8. The O_E-integral reductive case is not in the pinned library. |

Absent at both pins: adic spaces beyond `Spa` of a Huber pair, perfectoid spaces, diamonds, any Beauville–Laszlo statement (a name search for `Laszlo` and `Beauville` finds nothing), exact squares or glueing pairs, and torsors under group schemes over adic spaces. Tau Ceti's Tannaka reconstruction (`TauCeti.Tannaka.*`) is reconstruction over a field; the torsor statements this part needs are BG0's (requested).

## RF4:vector-bundles — linear patching

The layer has three tiers.

**Algebra.** An *exact square* is a commuting square `R → R₁, R₂ → R₁₂` with `0 → R → R₁ ⊕ R₂ → R₁₂ → 0` exact; a *glueing datum* is a triple of modules with identifications over `R₁₂`, and its *module of sections* is the kernel of the difference map (Kedlaya–Liu 1.3.7). If the comparison `M ⊗ R₁ → M₁` is surjective for every finite projective datum and `Spec(R₁ ⊕ R₂) → Spec R` hits every maximal ideal, then finite projective glueing data are effective (1.3.8–1.3.9) and so are finite étale algebras (1.3.10). A *glueing pair* `(R → R', f)` (Stacks 15.92) is the square `R → R', R_f → R'_f` when `R/fⁿ = R'/fⁿ` for all `n`; every nonzerodivisor `f` gives one with `R' = R̂`. The **Beauville–Laszlo theorem** — glueable modules are glueing data, and flatness and finite projectivity are checked on the two pieces — is proved in the Stacks project without any noetherian hypothesis; this is the proof the previous checkpoint lacked.

**The relative curve.** A *modification* of a vector bundle `E'` at `D` is a bundle `E` with an isomorphism off `D` that is meromorphic along `D` in both directions. The central theorem identifies modifications of `E'` with `B^+_D(S)`-lattices in `Ê'_D[1/I_D]`: on an affinoid chart `Spa(A, A⁺)` around `D` with `I_D = ξA` (`ξ` a nonzerodivisor by RF2), `B^+_D(S)` is the `ξ`-adic completion of `A`, Beauville–Laszlo glues `E'(U)[1/ξ]` with the lattice, and the result is glued with `E'` off `D`. This is the stage's gluing functor (a bundle off `D`, a bundle on the formal neighbourhood, an identification on the punctured neighbourhood), formulated through modifications because the punctured formal neighbourhood is not an open subspace. It is an exact tensor equivalence, commutes with base change in `S` and with coefficient change of glueing pairs, splits over disjoint legs, is insensitive to colliding legs, and works along locally finite families of legs.

**The schematic curve.** For an affinoid perfectoid `A` over `ℚ_p`, Kedlaya–Liu show that `Proj(P_R) ∖ Z` is affine (`Z` the untilt divisor), define `B_e(A)`, `B^+_dR(A)`, `B_dR(A)`, compute cohomology of flat quasicoherent sheaves by the two-term B-pair complex, and identify vector bundles with relative B-pairs; Caraiani–Scholze transport this to the adic curve by GAGA.

**Exports to Fargues' theorem.** Pairs `(T, Ξ)` are modifications of the trivial bundle `T ⊗ O_X` (Scholze–Weinstein 12.4.6, 14.1.1), and vector bundles on `Spa W(R⁺) ∖ V(p, [x])` are algebraic (Kedlaya). Both are inputs to the essential surjectivity of Fargues' theorem only: BMS1 Remark 4.29 proves full faithfulness without the curve (RT-AREA-padic-1/19).

**Coverage: `planned`.** Fifteen nodes. Algebra: exact squares and glueing data (KL 1.3.7), finite projective and finite etale glueing (KL 1.3.8-1.3.10), glueing pairs and the Beauville-Laszlo theorem with the Stacks proof (15.92). Curve: modifications at a relative Cartier divisor of any degree, the lattice description (the stage's gluing functor, fully faithful and essentially surjective), exact tensor, base-change and coefficient-change compatibility, disjoint, colliding and locally finite families of legs. Schematic curve: Kedlaya-Liu 8.9 (affine complement, B_e, B^+_dR, B_dR of an affinoid perfectoid base, B-pair cohomology, bundles as relative B-pairs) with Caraiani-Scholze 3.5.1 and Fargues-Fontaine 5.3. Exports to the essential-surjectivity half of Fargues' theorem: Scholze-Weinstein 12.4.6 and 14.1.1 (2)<=>(3), and Kedlaya's algebraicity (Guo-Reinecke item 129). The non-noetherian hypotheses are kept throughout: completion is not fpqc, and the finite projectivity criterion is part of the theorem. The phi-module freeness statements also cited in Guo-Reinecke item 129 (Ivanov Theorem 6.1; Kedlaya-Liu Proposition 3.2.13, Lemma 3.2.6) are statements about Frobenius modules over perfect rings and arc-local products of valuation rings, not about patching; they are not planned here (see restructure).

Refinements still open in this layer (none blocks a target):

- The ramified (W_{O_E}) and equal-characteristic forms of Kedlaya's algebraicity theorem: Kedlaya and Scholze-Weinstein are p-typical, and no source for the general case was read; no node of this packet needs them
- Kedlaya-Liu's B-pair statements (8.9.3-8.9.6) are planned in their unramified setting; the general-E relative gluing is the modification form RF4:vector-bundles/meromorphic-modification-at-a-divisor, and the general-E schematic triple form is not stated in a read source
- When RelativeFarguesFontaine:RF0:crystalline-end is created (RT-AREA-padic-1/18), import its charts into RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles (gap 1)

### `glueing-datum-over-exact-square` — Exact squares of rings and glueing data over them (Kedlaya-Liu 1.3.7)

*definition*, realises `RelativeFarguesFontaine:RF4:vector-bundles`.

**Statement.** An exact square of commutative rings is a commuting square R -> R_1, R -> R_2, R_1 -> R_12, R_2 -> R_12 such that the sequence of R-modules 0 -> R -> R_1 (+) R_2 -> R_12 -> 0, whose last arrow is the difference (r_1, r_2) |-> r_1 - r_2 of the two maps, is exact. A glueing datum over it is a triple of modules M_1, M_2, M_12 over R_1, R_2, R_12 with isomorphisms psi_1 : M_1 (x)_{R_1} R_12 = M_12 and psi_2 : M_2 (x)_{R_2} R_12 = M_12; a morphism of glueing data is a triple of linear maps commuting with psi_1 and psi_2. The datum is finite, resp. finite projective, when M_1, M_2, M_12 are finite, resp. finite projective, over their rings. Its module of sections is M = ker(psi_1 - psi_2 : M_1 (+) M_2 -> M_12), with natural R-linear maps M -> M_i adjoint to M (x)_R R_i -> M_i. Every R-module N gives the glueing datum Can(N) = (N (x) R_1, N (x) R_2, N (x) R_12, can, can). No topology is involved.

**Hypotheses that must be kept.**

- The rings are commutative and the square commutes; nothing is assumed about flatness of R -> R_1 or R -> R_2
- Exactness of 0 -> R -> R_1 (+) R_2 -> R_12 -> 0 is required at all three places; surjectivity on the right is part of the definition
- A glueing datum carries no cocycle over R_1 (x)_R R_1: the square replaces fpqc descent data

**Proof outline.**

1. Kedlaya-Liu Definition 1.3.7 states the definition; the Stacks project's category Glue(R -> R', f) (before Theorem 15.92.16) is the case R_1 = R', R_2 = R_f, R_12 = R'_f.
2. Can is a functor, and the sections functor is right adjoint to it on the level of R-modules: Hom(N, sections(D)) = Hom(Can(N), D).
3. For flat N the sequence 0 -> N -> N (x) R_1 (+) N (x) R_2 -> N (x) R_12 -> 0 is exact (tensor the exact square with N), so sections(Can N) = N.

**Uses.**

- Kedlaya-Liu Remark 2.7.9: the Beauville-Laszlo square R -> R-hat, R[1/t] -> R-hat[1/t] is an exact square, and Proposition 1.3.6 is derived from Lemma 1.3.9 for it.
- Kedlaya-Liu Theorem 8.9.6, proof: vector bundles on Proj(P_R) are glueing data over the square with pieces B_e(A), B^+_dR(A), B_dR(A).
- Scholze-Weinstein Lemma 14.2.3, proof: vector bundles on Spec A_inf minus the closed point are glueing data over A_inf[1/p], A_inf[1/[p-flat]], A_inf[1/p[p-flat]].
- Kedlaya, Some ring-theoretic properties of A_inf, proof of Theorem 3.8: the adic and schematic bundles are compared through fibre products of categories of glueing data over rational coverings.
- RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor: the local step of the relative gluing is a glueing datum over the Beauville-Laszlo square of an affinoid chart around D.

**API.**

| name | role | statement |
| --- | --- | --- |
| `ExactSquare` | data | An exact square: four commutative rings, the four ring maps, commutativity, and exactness of 0 -> R -> R_1 (+) R_2 -> R_12 -> 0. |
| `ExactSquare.exact` | characterisation | An element of R_1 (+) R_2 lies in the image of R iff its two images in R_12 agree, R -> R_1 (+) R_2 is injective, and R_1 (+) R_2 -> R_12 is surjective. |
| `GlueingDatum` | constructor | A glueing datum (M_1, M_2, M_12, psi_1, psi_2) over an exact square, with morphisms the compatible triples of linear maps. |
| `GlueingDatum.sections` | data | The module of sections M = ker(psi_1 - psi_2 : M_1 (+) M_2 -> M_12), an R-module, functorial in the datum. |
| `GlueingDatum.sectionsCompare` | projection | The natural maps M (x)_R R_i -> M_i (i = 1, 2), compatible with psi_1, psi_2 after base change to R_12. |
| `GlueingDatum.can` | functoriality | The functor Can : R-modules -> glueing data, N ∣-> (N (x) R_1, N (x) R_2, N (x) R_12, can, can), with map_id and map_comp. |
| `GlueingDatum.can_sections_adjunction` | universal-property | Hom_R(N, sections(D)) = Hom(Can(N), D) naturally in N and D. |
| `GlueingDatum.sections_can_of_flat` | characterisation | For a flat R-module N the unit N -> sections(Can N) is an isomorphism. |
| `GlueingDatum.tensor` | structure | Tensor product and dual of finite projective glueing data, componentwise, with sections(Can N (x) Can N') compatible with N (x) N' for finite projective N, N'. |
| `GlueingDatum.baseChange` | functoriality | For a map of exact squares (R -> R_1, R_2 -> R_12) -> (R' -> R'_1, R'_2 -> R'_12), base change of glueing data, compatible with Can. |
| `ExactSquare.ofGlueingSquare` | compatibility | Every glueing square of complete Tate rings (AdicSpacesPartII:R3/glueing-square) is an exact square, its finite glueing data are glueing data here, and its module of sections is the module of sections here. |
| `ExactSquare.zariski` | example | For f, g in R generating the unit ideal, R -> R_f, R_g -> R_fg is an exact square. |

**Unit tests.**

- `GlueingDatum.sections_zariski_Z` (computation): For R = Z, f = 2, g = 3, the glueing datum (Z[1/2], Z[1/3], Z[1/6], id, multiplication by 3) has module of sections {(3k, k) : k in Z}, free of rank one with generator (3, 1).
- `GlueingDatum.sections_identitySquare` (degenerate): For the identity square R = R_1 = R_2 = R_12 and a datum (M, M, M, id, id), the module of sections is the diagonal, isomorphic to M.
- `ExactSquare.zariski_sections_can` (compatibility): For the Zariski square of D(f), D(g) with (f, g) = R and any R-module N, sections(Can N) = N; this is gluing of quasicoherent sheaves on Spec R = D(f) u D(g).
- `ExactSquare.not_exact_double_localization` (non-example): For R = k[x] and R_1 = R_2 = R_12 = k[x, 1/x], the square is not exact: the kernel of the difference is the diagonal k[x, 1/x], and sections(Can R) = k[x, 1/x] is not R.

**Acceptance.**

- The Zariski square of D(f), D(g) for comaximal f, g is exact and its glueing data are quasicoherent gluing data
- Every glueing square of complete Tate rings of AdicSpacesPartII:R3/glueing-square is an exact square in this sense, with the same glueing data and module of sections
- The identity square is exact and its glueing data are modules

**Dependencies.** 
Other roadmaps: `AdicSpacesPartII:R3/glueing-square`.
Libraries: `mathlib:TensorProduct`, `mathlib:LinearEquiv`, `mathlib:Module.Flat`, `mathlib:Module.Finite`, `mathlib:Module.Projective`.

**Sources.** KL15-foundations, Definition 1.3.7, p. 17: “be a commuting diagram of ring homomorphisms such that the sequence 0 -> R -> R1 (+) R2 -> R12 -> 0 of R-modules, in which the last nontrivial arrow is the difference between the given homomorphisms, is exact. By a glueing datum over this diagram, we will mean ...” KL15-foundations, Definition 1.3.7, p. 17: “When considering a glueing datum, it is natural to consider the kernel M of the map psi1 - psi2 : M1 (+) M2 -> M12. There are natural maps M -> M1, M -> M2 of R-modules” Stacks-BL, Section 15.92, before Theorem 15.92.16 (tag 0BP2): “We will call an object (M', M_1, alpha_1) of Glue(R -> R', f) a glueing datum. It consists of an R'-module M', an R_f-module M_1, and an isomorphism alpha_1 : (M')_f -> M_1 (x)_R R'.”

Suggested home: `TauCeti/RingTheory/Glueing/ExactSquare`, namespace `TauCeti.ExactSquare`.

### `finite-projective-glueing-over-exact-square` — Finite projective glueing data over an exact square are effective (Kedlaya-Liu 1.3.8-1.3.9)

*theorem*, realises `RelativeFarguesFontaine:RF4:vector-bundles`.

**Statement.** Let R -> R_1, R_2 -> R_12 be an exact square. (i) For a finite glueing datum with module of sections M such that M (x)_R R_1 -> M_1 is surjective: psi_1 - psi_2 : M_1 (+) M_2 -> M_12 is surjective, M (x)_R R_2 -> M_2 is surjective, and a finitely generated submodule M_0 of M already surjects onto M_1 and M_2. (ii) Suppose M (x)_R R_1 -> M_1 is surjective for every finite projective glueing datum. Then for every finite projective glueing datum M is finitely presented and M (x)_R R_i -> M_i is bijective for i = 1, 2. (iii) If moreover the image of Spec(R_1 (+) R_2) -> Spec(R) contains every maximal ideal, M is finite projective; hence Can is an equivalence from finite projective R-modules to finite projective glueing data, with quasi-inverse the module of sections.

**Hypotheses that must be kept.**

- The surjectivity hypothesis of (ii) is for EVERY finite projective glueing datum; it is verified separately in each application (density for complete Tate rings, the Beauville-Laszlo argument for completions)
- The maximal-ideal condition of (iii) cannot be dropped: it is what makes the rank of M locally constant and the Fitting ideal Fitt_n(M) equal to R
- No flatness of R -> R_1 or R -> R_2 is assumed

**Proof outline.**

1. (i) The surjection M (x) R_1 -> M_1 gives a surjection M (x) R_12 -> M_12 and hence the surjectivity of psi_1 - psi_2; an element v of M_2 is reached by correcting with a preimage, and finitely many generators give M_0 (KL Lemma 1.3.8).
2. (ii) Choose a finite free F -> M_0 and compare the exact rows 0 -> N -> F -> M, 0 -> N_i -> F_i -> M_i; the kernels N_i are finite projective and form a glueing datum, so (i) applies to it and a diagram chase gives finite generation, then finite presentation, of M, and the five lemma gives bijectivity of M (x) R_i -> M_i (KL Lemma 1.3.9(a)).
3. (iii) Split by the rank idempotents, compute Fitting ideals: Fitt_i(M) = 0 for i < n because R -> R_1 (+) R_2 is injective, and Fitt_n(M) = R because every maximal ideal comes from a point of Spec(R_1 (+) R_2) where the rank is n (KL Lemma 1.3.9(b)).
4. Full faithfulness of Can on finite projective modules is V1's sections_can_of_flat.

**Acceptance.**

- Recover Zariski gluing of finite projective modules from the square R -> R_f, R_g -> R_fg
- Recover AdicSpacesPartII:R3/glueing-square-finite-projective-descent for a glueing square of complete Tate rings, whose density hypothesis gives the surjectivity of (ii)
- Recover finite projective descent for the Beauville-Laszlo square (RF4:vector-bundles/beauville-laszlo-module-gluing)

**Dependencies.** 
Within this part: `glueing-datum-over-exact-square`.
Libraries: `mathlib:Module.FinitePresentation`, `mathlib:Module.Projective`, `mathlib:Module.Finite`.

**Sources.** KL15-foundations, Lemma 1.3.8, p. 17: “Consider a finite glueing datum for which M (x)R R1 -> M1 is surjective. Then we have the following. (a) The map psi1 - psi2 : M1 (+) M2 -> M12 is surjective. (b) The map M (x)R R2 -> M2 is also surjective. (c) There exists a finitely generated R-submodule M0 of M ...” KL15-foundations, Lemma 1.3.9, p. 18: “Suppose that for every finite projective glueing datum, the map M (x)R R1 -> M1 is surjective. (a) For any finite projective glueing datum, M is a finitely presented R-module and M (x)R R1 -> M1, M (x)R R2 -> M2 are bijective.” KL15-foundations, Lemma 1.3.9(b), p. 18: “Suppose in addition that the image of Spec(R1 (+) R2) -> Spec(R) contains Maxspec(R). Then with notation as in (a), M is a finite projective R-module.”

### `finite-etale-glueing-over-exact-square` — Finite etale algebras glue over an exact square (Kedlaya-Liu 1.3.10)

*theorem*, realises `RelativeFarguesFontaine:RF4:vector-bundles`.

**Statement.** Under the hypotheses of RF4:vector-bundles/finite-projective-glueing-over-exact-square (iii), the base change functor FEt(R) -> FEt(R_1) x_{FEt(R_12)} FEt(R_2) from finite etale R-algebras to compatible pairs of finite etale algebras is an equivalence of categories.

**Hypotheses that must be kept.**

- Same hypotheses as the finite projective glueing theorem: surjectivity for all finite projective glueing data and the maximal-ideal condition
- The algebra structure is glued from the exact sequence 0 -> A -> A_1 (+) A_2 -> A_12 -> 0; etaleness is checked through the trace pairing, not through flat descent

**Proof outline.**

1. View (A_1, A_2, A_12) as a finite projective glueing datum; the module of sections A is finite projective with A (x) R_i = A_i.
2. The multiplications of A_1, A_2, A_12 restrict to A through the exact sequence 0 -> A -> A_1 (+) A_2 -> A_12 -> 0, so A is a finite flat R-algebra.
3. Applying the glueing theorem to the duals gives 0 -> Hom_R(A, R) -> Hom(A_1, R_1) (+) Hom(A_2, R_2) -> Hom(A_12, R_12) -> 0, and the snake lemma shows the trace pairing of A is perfect, so A is finite etale (KL Corollary 1.3.10).

**Acceptance.**

- For the Zariski square this is gluing of finite etale covers
- The trace pairing argument shows that unramifiedness is not checked by a flatness argument

**Dependencies.** 
Within this part: `finite-projective-glueing-over-exact-square`.
Libraries: `mathlib:CommAlgCat.FiniteEtale`, `mathlib:Algebra.Etale`, `mathlib:Module.Dual`.

**Sources.** KL15-foundations, Corollary 1.3.10, p. 19: “Suppose that the hypotheses of Lemma 1.3.9(b) are satisfied. Then the natural functor FEt(R) -> FEt(R1) x_FEt(R12) FEt(R2) is an equivalence of categories.” KL15-foundations, Proof of Corollary 1.3.10, p. 19: “Using (1.3.10.1), (1.3.10.2), and the snake lemma, we see that the the trace pairing on A defines an isomorphism A -> HomR(A, R).”

### `glueing-pair` — Glueing pairs and glueable modules (Stacks 15.92)

*definition*, realises `RelativeFarguesFontaine:RF4:vector-bundles`.

**Statement.** Let R be a ring, f in R, and R -> R' a ring map inducing isomorphisms R/f^n R = R'/f^n R' for all n >= 1 (for example R' = R-hat = lim R/f^n R). (R -> R', f) is a glueing pair if 0 -> R -> R' (+) R_f -> R'_f -> 0 (last arrow the difference) is exact; equivalently R[f^oo] -> R'[f^oo] is bijective, where M[f^oo] is the f-power torsion. (R, f) is a glueing pair if (R -> R-hat, f) is one. An R-module M is glueable for (R -> R', f) if 0 -> M -> (M (x)_R R') (+) M_f -> M (x)_R R'_f -> 0 is exact, equivalently M[f^oo] -> (M (x)_R R')[f^oo] is bijective. A glueing pair is in particular an exact square R -> R', R_f -> R'_f.

**Hypotheses that must be kept.**

- R -> R' must induce R/f^n = R'/f^n for EVERY n, not only n = 1
- If f is a nonzerodivisor of R then (R, f) is a glueing pair; no noetherian hypothesis
- Glueability is a condition on the module; flat modules are glueable, and a non-glueable module exists already for a nonzerodivisor f

**Proof outline.**

1. Lemma 15.92.6: the sequence is always exact on the right; exactness on the left and in the middle are injectivity and surjectivity of R[f^oo] -> R'[f^oo].
2. Remark 15.92.7: for f a nonzerodivisor, f is a nonzerodivisor in R-hat (Stacks Algebra Lemma 10.96.4), so both torsion modules vanish.
3. Lemma 15.92.10 and Remark 15.92.11: the same criterion for modules, and flat modules are glueable.

**Uses.**

- Stacks Theorem 15.92.16: the Beauville-Laszlo equivalence is stated for a glueing pair and glueable modules.
- Scholze-Weinstein Lemma 5.2.9: the case R' = R-hat with f a nonzerodivisor.
- RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor: (A, xi) for an affinoid chart A around D and a local equation xi of D is a glueing pair because xi is a nonzerodivisor (RF2:untilts/closed-cartier-divisor-norm-estimate).

**API.**

| name | role | statement |
| --- | --- | --- |
| `GlueingPair` | data | A ring map R -> R' and f in R with R/f^n = R'/f^n for all n and the exact sequence 0 -> R -> R' (+) R_f -> R'_f -> 0. |
| `GlueingPair.iff_torsion_bijective` | characterisation | (R -> R', f) is a glueing pair iff R[f^oo] -> R'[f^oo] is bijective (Stacks 15.92.6). |
| `GlueingPair.of_nonZeroDivisor` | constructor | If f is a nonzerodivisor of R then (R -> R-hat, f) is a glueing pair (Stacks 15.92.7). |
| `GlueingPair.of_flat` | constructor | If R -> R-hat is flat (for example R noetherian) then (R, f) is a glueing pair (Stacks 15.92.8). |
| `GlueingPair.toExactSquare` | coercion | A glueing pair is an exact square R -> R', R_f -> R'_f (RF4:vector-bundles/glueing-datum-over-exact-square). |
| `GlueingPair.quotient_equiv` | simp | R/f^n R = R-hat/f^n R-hat for every n (Stacks 15.92.1). |
| `GlueingPair.spec_surjective` | other | Spec(R') u Spec(R_f) -> Spec(R) is surjective (Stacks 15.92.3), the maximal-ideal condition of the exact-square glueing theorem. |
| `Glueable` | data | The predicate: 0 -> M -> (M (x) R') (+) M_f -> M (x) R'_f -> 0 is exact. |
| `Glueable.iff_torsion` | characterisation | For a glueing pair, M is glueable iff M[f^oo] -> (M (x) R')[f^oo] is injective (Stacks 15.92.10). |
| `Glueable.of_flat` | constructor | Flat R-modules are glueable (Stacks 15.92.11). |

**Unit tests.**

- `GlueingPair.int_p` (computation): For R = Z and f = p, R-hat = Z_p and 0 -> Z -> Z_p (+) Z[1/p] -> Q_p -> 0 is exact; (Z, p) is a glueing pair.
- `GlueingPair.of_isUnit` (degenerate): If f is a unit then R-hat = 0, R_f = R, the sequence is 0 -> R -> R -> 0 -> 0, every module is glueable and glueing data are R-modules.
- `GlueingPair.noetherian_compat` (compatibility): For R noetherian, Mathlib's AdicCompletion (Ideal.span {f}) R is flat over R, so (R, f) is a glueing pair and every R-module is glueable (Stacks 15.92.8, 15.92.11).
- `GlueingPair.not_stacks_example` (non-example): For R = k[f, T_1, T_2, ...]/(f T_1, f T_2 - T_1, f T_3 - T_2, ...), (R, f) is not a glueing pair: T_1 is f-power torsion and nonzero in R but its image in R-hat is f-divisible, hence zero (Stacks Example 15.92.9).
- `Glueable.not_smooth_germs` (non-example): For R the germs of smooth functions at 0 on the real line and f = x, the module R/phi R with phi = exp(-1/x^2) is not glueable although f is a nonzerodivisor (Stacks Example 15.92.12).

**Acceptance.**

- Check the criterion R[f^oo] -> R'[f^oo] bijective on the two examples of Stacks Example 15.92.9
- Check that a nonzerodivisor gives a glueing pair without any noetherian hypothesis
- Check that the henselization of R along f, which also satisfies R/f^n = R^h/f^n, gives a glueing pair whenever f is a nonzerodivisor of it

**Dependencies.** 
Within this part: `glueing-datum-over-exact-square`.
Libraries: `mathlib:AdicCompletion`, `mathlib:AdicCompletion.of`, `mathlib:IsLocalization.Away`, `mathlib:nonZeroDivisors`, `mathlib:Module.Flat`.

**Sources.** Stacks-BL, Section 15.92, Glueing pairs, before Lemma 15.92.6: “Let R -> R' be a ring map that induces isomorphisms R/f^nR -> R'/f^nR' for n > 0. Consider the sequence 0 -> R -> R' (+) R_f -> R'_f -> 0 ... If this sequence is exact, then we say that (R -> R', f) is a glueing pair.” Stacks-BL, Lemma 15.92.6 (tag 0BNR) and Remark 15.92.7 (tag 0BNS): “In particular, (R -> R', f) is a glueing pair if and only if R[f^oo] -> R'[f^oo] is bijective. ... Suppose that f is a nonzerodivisor. ... Hence (R, f) is a glueing pair.” Stacks-BL, Lemma 15.92.10 (tag 0BNW): “Thus M is glueable for (R -> R', f) if and only if M[f^oo] -> (M (x)_R R')[f^oo] is bijective.”

Suggested home: `TauCeti/RingTheory/Glueing/BeauvilleLaszlo`, namespace `TauCeti.GlueingPair`.

### `beauville-laszlo-module-gluing` — The Beauville-Laszlo theorem for non-noetherian rings

*theorem*, realises `RelativeFarguesFontaine:RF4:vector-bundles`. **Planet: Beauville–Laszlo lemma.**

**Statement.** Let (R -> R', f) be a glueing pair (for instance R' = R-hat, the f-adic completion, with f a nonzerodivisor of R). (a) The functor Can : M |-> (M (x)_R R', M_f, can) is an equivalence from the category of R-modules glueable for (R -> R', f) to the category of glueing data (M', M_1, alpha_1 : (M')_f = M_1 (x)_R R'), with quasi-inverse the module of sections. In particular (Scholze-Weinstein 5.2.9) for f a nonzerodivisor, R-modules M on which f is a nonzerodivisor are equivalent to triples (M_{R-hat}, M_{R[1/f]}, beta) with f a nonzerodivisor on the R-hat-module M_{R-hat} and beta : M_{R-hat}[1/f] = M_{R[1/f]} (x)_R R-hat. (b) An R-module M is flat, resp. finite projective, iff M (x)_R R' and M_f are flat, resp. finite projective; hence every finite projective glueing datum is Can of a finite projective R-module, unique up to unique isomorphism, and R -> R' x R_f is an effective descent morphism for finite projective modules. (c) For a flat M the sequence 0 -> M -> (M (x)_R R_f) (+) (M (x)_R R-hat) -> M (x)_R R-hat_f -> 0 is exact. The statement is not a case of fpqc descent: R -> R-hat need not be flat when R is not noetherian, and no descent datum over R-hat (x)_R R-hat is part of the data.

**Hypotheses that must be kept.**

- f is a nonzerodivisor of R, or more generally (R -> R', f) is a glueing pair; no noetherian, flatness or separatedness hypothesis is needed (Kedlaya-Liu's 't-adically separated' in Proposition 1.3.6 is not used by the Stacks proof)
- In (a) the modules must be glueable; for f a nonzerodivisor every module on which f is a nonzerodivisor is glueable
- The finite projectivity criterion of (b) is part of the theorem and is what makes the gluing of vector bundles possible
- Scholze-Weinstein point out that the statement does NOT follow from fpqc descent, for the two reasons in the statement

**Proof outline.**

1. Surjectivity of d : M' (+) M_1 -> (M')_f for any glueing datum, by writing a target element with a common denominator f^n and splitting coefficients of R' as R + f^n R' (Stacks proof of 15.92.16).
2. With M = ker d, the sequence 0 -> M/M[f^oo] -> M_1 -> (M')_f/M' -> 0 is exact; tensoring with the flat R_f gives M_f = M_1.
3. Tor_1^R(R', Coker(M' -> M'_f)) = 0 (Stacks 15.92.13-15.92.15) keeps that sequence exact after tensoring with R', and the five lemma gives M (x) R' = M'; so Can is essentially surjective and H^0 o Can = id on glueable modules gives full faithfulness.
4. Flatness and finite projectivity descend: Stacks 15.92.18 (Tor computation from the exact square) and 15.92.19 (finite generation from 15.92.4, then finite presentation).
5. Alternatively, for f a nonzerodivisor and finite projective data, Kedlaya-Liu Remark 2.7.9 verifies the surjectivity hypothesis of RF4:vector-bundles/finite-projective-glueing-over-exact-square for the square R -> R-hat, R[1/t] -> R-hat[1/t] using the t-adic density of R[1/t] in R-hat[1/t], and concludes from Lemma 1.3.9.

**Acceptance.**

- Run the gluing for R = A_inf[1/p] and f = xi, where R-hat = B^+_dR(C): a B^+_dR-lattice in T (x) B_dR glues with T (x) A_inf[1/p][1/xi] to a finite projective A_inf[1/p]-module (the step used in SW20 Proposition 12.4.6)
- Exhibit, for a non-noetherian R, a module M with f a nonzerodivisor on M whose completion M (x) R-hat is computed by the gluing although R -> R-hat is not flat
- Verify finite projectivity in both directions of (b)
- Check the necessity of glueability with Stacks Example 15.92.12

**Dependencies.** 
Within this part: `glueing-pair`, `glueing-datum-over-exact-square`, `finite-projective-glueing-over-exact-square`.
Libraries: `mathlib:AdicCompletion`, `mathlib:IsAdicComplete`, `mathlib:IsLocalization.Away`, `mathlib:nonZeroDivisors`, `mathlib:Module.Projective`, `mathlib:Module.Flat`, `mathlib:Module.FinitePresentation`, `mathlib:Module.FaithfullyFlat`.

**Sources.** SW20-berkeley, Lemma 5.2.9, printed p. 38: “Let R be a commutative ring, let f in R be a non-zero-divisor, and let R-hat be the f-adic completion of R. Then the category of R-modules M where f is not a zero-divisor is equivalent to the category of pairs (M_R-hat, M[f^-1], beta) ... M is finite projective if and only if ...” SW20-berkeley, After Lemma 5.2.9, printed p. 38: “This does not follow from fpqc descent because of two subtle points: R -> R-hat might not be flat if R is not noetherian, and also we have not included a descent datum on R-hat (x)_R R-hat.” Stacks-BL, Theorem 15.92.16 (tag 0BP2): “Let (R -> R', f) be a glueing pair. The functor Can : Mod_R -> Glue(R -> R', f) determines an equivalence of the category of R-modules glueable for (R -> R', f) and the category Glue(R -> R', f) of glueing data.” Stacks-BL, Lemma 15.92.19: “Let (R -> R', f) be a glueing pair. Let M be an R-module which is not necessarily glueable for (R -> R', f). Then M is a finite projective R-module if and only if M (x)_R R' is finite projective over R' and M_f is finite projective over R_f.” KL15-foundations, Proposition 1.3.6, pp. 16-17: “(a) For any flat R-module M, the sequence 0 -> M -> (M (x)R R[t^-1]) (+) (M (x)R R-hat) -> M (x)R R-hat[t^-1] -> 0 ... is exact. ... In particular, the morphism R -> R[t^-1] (+) R-hat is an effective descent morphism for the category of finite projective modules over rings.”

### `modification-of-vector-bundles` — Modifications of vector bundles at a relative Cartier divisor

*definition*, realises `RelativeFarguesFontaine:RF4:vector-bundles`.

**Statement.** Conventions of this layer: E is a nonarchimedean local field with residue field F_q and uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR, B_dR when d = 1). Let X-cal be one of Y-curly_S, Y_S, X_S and D a closed Cartier divisor of X-cal attached to a map S -> Div^d_(-), with ideal sheaf I_D and E(kD) = E (x) I_D^(-k). For vector bundles E, E' on X-cal, a modification of E' at D is a pair (E, beta) with beta : E|_{X-cal minus D} = E'|_{X-cal minus D} an isomorphism of vector bundles on the open complement which is meromorphic along D: for some k >= 0, beta extends to a morphism E -> E'(kD) and beta^(-1) extends to a morphism E' -> E(kD) (through the inclusions E' -> E'(kD), E -> E(kD)). Such a k is a bound of the modification. A morphism (E_1, beta_1) -> (E_2, beta_2) is a morphism E_1 -> E_2 whose restriction off D is beta_2^(-1) beta_1; modifications of E' at D form a groupoid Mod_D(E').

**Hypotheses that must be kept.**

- D must be a closed Cartier divisor (I_D invertible); this is what makes O(kD) defined and what makes restriction to the complement injective on sections
- beta must be an isomorphism on all of X-cal minus D, not only near D
- Both beta and beta^(-1) are required to be meromorphic; Fargues-Scholze require one direction for every representation of G, which for GL_n includes the dual representation and so gives the other direction
- The definition is local on S and on X-cal; for d = 0 (D empty) a modification is an isomorphism

**Proof outline.**

1. The definition is Fargues-Scholze's meromorphic modification at D, specialised to GL_n (FS III.3, printed p. 97), and the datum beta of Scholze-Weinstein Theorem 14.1.1(3).
2. Composition and inverses: if beta_1 is bounded by k and beta_2 by l then beta_2 beta_1 is bounded by k + l, and beta^(-1) is a modification of E at D with the same bound.
3. Because I_D is invertible and locally generated by a nonzerodivisor, a morphism of vector bundles is determined by its restriction off D; so morphisms of modifications are unique when they exist, and Mod_D(E') is equivalent to a set.

**Uses.**

- Fargues-Scholze III.3: Gr_G / phi^Z -> Div^1 is the moduli of a modification between the trivial G-bundle and E at D.
- Scholze-Weinstein Theorem 14.1.1, (2) <=> (3): the datum (F', beta) is equivalent to a B^+_dR-lattice by Beauville-Laszlo.
- Howe-Klevdal, Section 4.3: the modification E_L of E by a lattice L on its G(B_dR)-local system.
- RelativeFarguesFontaine:RF4:G-torsors/meromorphic-G-modification: a G-modification is a compatible family of modifications of the vector bundles attached to all representations.
- BunGAndNewtonStrata:BG2:uniformization: the Beauville-Laszlo uniformization modifies a G-bundle at an untilt divisor.

**API.**

| name | role | statement |
| --- | --- | --- |
| `Modification` | data | A modification of E' at D: a vector bundle E with an isomorphism beta : E∣_{X minus D} = E'∣_{X minus D} meromorphic along D in both directions. |
| `Modification.extend` | projection | For a bound k, the unique morphism E -> E'(kD) extending beta, and E' -> E(kD) extending beta^(-1). |
| `Modification.refl` | constructor | (E', id) is a modification of E' at D with bound 0. |
| `Modification.symm` | constructor | (E', beta^(-1)) is a modification of E at D with the same bound. |
| `Modification.trans` | constructor | Modifications bounded by k and l compose to one bounded by k + l. |
| `Modification.tensor` | structure | The tensor product of modifications of E'_1 and E'_2 bounded by k and l is a modification of E'_1 (x) E'_2 bounded by k + l; the dual of a modification bounded by k is bounded by k. |
| `Modification.pullback` | functoriality | For T -> S, pullback of (E, beta) along X-cal_T -> X-cal_S is a modification at D_T; pullback along the identity is the identity and pullbacks compose. |
| `Modification.ext` | extensionality | Two morphisms of modifications are equal iff they agree off D; (E_1, beta_1) = (E_2, beta_2) iff beta_2^(-1) beta_1 extends to an isomorphism E_1 = E_2. |
| `Modification.ofSubbundle` | constructor | An injective morphism E -> E' that is an isomorphism off D and whose image contains E'(-kD) defines a modification bounded by k. |

**Unit tests.**

- `Modification.ideal_inclusion` (computation): The inclusion I_D = O(-D) -> O_X-cal restricts to an isomorphism off D and is a modification of O at D bounded by 1, not bounded by 0.
- `Modification.empty_divisor` (degenerate): For d = 0 (D empty) a modification of E' at D is an isomorphism E = E', and every bound works.
- `Modification.ff_absolute` (compatibility): For S = Spa(C^flat) a geometric point and D = infinity on X_FF, modifications of E' at D are exactly Fargues-Fontaine's modifications of E' supported at {infinity} (5.6.4.2): bundles E with E|_{X minus infinity} = E'|_{X minus infinity}.
- `Modification.not_iso_off_D` (non-example): For a second degree-one divisor D' disjoint from D, the inclusion O -> O(D') is not a modification of O(D') at D: it is not an isomorphism on X-cal minus D.

**Acceptance.**

- The inclusion I_D = O(-D) -> O is a modification of O at D bounded by 1
- For d = 0 the groupoid is the set of bundles isomorphic to E'
- At a geometric point, modifications of E' at the point infinity of X_FF are Fargues-Fontaine's modifications supported at {infinity}

**Dependencies.** 
Earlier layers of this roadmap: `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`, `RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate`, `RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf`, `RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation`.
Other roadmaps: `VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles`, `AdicSpacesPartII:R3/locally-free-sheaf`.
Libraries: `mathlib:Module.Invertible`, `mathlib:Module.Projective`.

**Sources.** FS-geometrization, III.3, printed p. 97: “a modification between E and E' at D is an isomorphism E|_{X_S minus D} -> E'|_{X_S minus D} that is meromorphic along D. The latter means that for any representation in Rep_E(G), the associated isomorphism ... extends to a morphism F -> F'(kD) for k >> 0” SW20-berkeley, Theorem 14.1.1(3), printed p. 115: “Quadruples (F, F', beta, T), where F and F' are vector bundles on the Fargues-Fontaine curve X_FF such that F is trivial, beta : F|_{X_FF minus {oo}} -> F'|_{X_FF minus {oo}} is an isomorphism, and T ...” FF18-courbe, 5.3, before Proposition 5.3.1, p. 208: “La categorie C-hat consiste en la donnee d'un fibre sur U, de fibres sur les disques formels (Spec(O-hat_{X,x_i})) et de donnees de recollement sur les disques formels epointes (Spec(K-hat_{x_i}))”

Suggested home: `TauCeti/AdicSpace/FarguesFontaine/Modification`, namespace `TauCeti.FarguesFontaine.Modification`.

### `meromorphic-modification-at-a-divisor` — Beauville-Laszlo gluing on the relative curve: modifications are B^+-lattices

*theorem*, realises `RelativeFarguesFontaine:RF4:vector-bundles`, `RelativeFarguesFontaine:RF4`. **Planet: Beauville–Laszlo gluing on the curve.**

**Statement.** Conventions of this layer: E is a nonarchimedean local field with residue field F_q and uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR, B_dR when d = 1). Let X-cal be Y-curly_S, Y_S or X_S, D the divisor of a map S -> Div^d_(-), assumed affinoid, and E' a vector bundle on X-cal with completion E'-hat_D = Gamma(D, completion of E' along D), a finite projective B^+_D(S)-module. Then (E, beta) |-> Xi(E, beta) := beta(E-hat_D) is an equivalence from the groupoid Mod_D(E') of modifications of E' at D to the set of B^+_D(S)-lattices in E'-hat_D[1/I_D], i.e. finite projective B^+_D(S)-submodules Xi with Xi[1/I_D] = E'-hat_D[1/I_D]. A modification is bounded by k iff I_D^k E'-hat_D is contained in Xi and Xi in I_D^(-k) E'-hat_D. In particular a vector bundle off D (namely E'), a vector bundle on the formal neighbourhood (Xi) and an isomorphism on the punctured formal neighbourhood (Xi[1/I_D] = E'-hat_D[1/I_D]) determine a vector bundle on X-cal, and the gluing functor is fully faithful and essentially surjective. Locally: on an affinoid chart U = Spa(A, A^+) containing D on which I_D = xi A, B^+_D(S) is the xi-adic completion of A and the statement is RF4:vector-bundles/beauville-laszlo-module-gluing for the glueing pair (A, xi) combined with finite projective A-modules = vector bundles on U.

**Hypotheses that must be kept.**

- D affinoid, which holds locally on S (RF2:integral-divisors/product-equation-and-affineness); the result globalises over S by gluing
- I_D is invertible and locally generated by a nonzerodivisor xi of the chart ring A (RF2:untilts/closed-cartier-divisor-norm-estimate, RF2:integral-divisors/product-equation-and-affineness); this makes (A, xi) a glueing pair
- The charts are sheafy (sousperfectoid) affinoids, so vector bundles on U are finite projective A-modules (AdicSpacesPartII:R3); on X_S the charts come from Y_S through the phi-quotient (RF1)
- The punctured formal neighbourhood is not an open subspace of X-cal; the gluing is formulated through modifications of a given E', which is how Scholze-Weinstein and Fargues-Scholze use it
- The theorem is linear: G-valued and Grassmannian statements are RF4:G-torsors and GeometricSatakeAndFusion:GS0:loop-geometry

**Proof outline.**

1. Localise on S so that D is affinoid and contained in an affinoid chart U = Spa(A, A^+) of X-cal with I_D|_U = xi A, xi a nonzerodivisor of A; then B^+_D(S) = A-hat (the xi-adic completion) because A/xi^n = O(D_n) for every n, and this is independent of U (RF2:integral-divisors/completed-rings-B-plus-and-B).
2. Given a lattice Xi with xi^k E'-hat_D in Xi in xi^(-k) E'-hat_D, let M' = E'(U), a finite projective A-module (AdicSpacesPartII:R3/vector-bundle-global-generation). The glueing datum (M'[1/xi], Xi, can) is finite projective, so the Beauville-Laszlo theorem gives a finite projective A-module M with M[1/xi] = M'[1/xi] and M-hat = Xi; the inclusions xi^k M' in M in xi^(-k) M' hold because they hold after completion and after inverting xi (exactness of 0 -> M -> M[1/xi] (+) M-hat -> M-hat[1/xi] -> 0).
3. The bundle E_U on U attached to M agrees with E' on U minus D through these inclusions (xi is invertible there); glue E_U with E'|_{X-cal minus D} along U minus D (vector bundles form a sheaf: AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing). The result is a modification bounded by k with Xi(E, beta) = Xi.
4. Conversely a modification bounded by k gives xi^k M' in E(U) in xi^(-k) M' and Xi(E, beta) = E(U)-hat is a lattice; morphisms are determined off D (RF4:vector-bundles/modification-of-vector-bundles), giving full faithfulness.
5. This is the argument of Scholze-Weinstein in the proofs of Proposition 19.1.2 and Theorem 14.1.1 and of Howe-Klevdal 4.3 ('Beauville-Laszlo gluing using the equivalence of vector bundles and finite projective modules on affinoids').

**Acceptance.**

- For S a geometric point, d = 1 and E' trivial of rank n, recover the classical bijection between rank-n bundles with a trivialisation off infinity and B^+_dR-lattices in B_dR^n
- Minuscule case: modifications bounded by 1 with I_D E'-hat in Xi in E'-hat correspond to finite projective O(D)-module quotients of E'|_D
- Independence of the chart U and of the local generator xi
- The schematic triple description of RF4:vector-bundles/vector-bundles-as-relative-B-pairs agrees with this one under GAGA

**Dependencies.** 
Within this part: `beauville-laszlo-module-gluing`, `modification-of-vector-bundles`, `glueing-pair`.
Earlier layers of this roadmap: `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`, `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`, `RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate`, `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`.
Other roadmaps: `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`, `AdicSpacesPartII:R3/vector-bundle-global-generation`, `AdicSpacesPartII:R3/locally-free-sheaf`, `VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles`.
Libraries: `mathlib:AdicCompletion`, `mathlib:Module.Projective`, `mathlib:Module.Invertible`.

**Sources.** SW20-berkeley, Proof of Proposition 19.1.2, printed p. 170: “Recall that S-sharp -> S x Spa Z_p x_{Spa C-flat x Spa Z_p} U is a closed Cartier divisor by Proposition 11.3.1. Thus, the identification with G-torsors over this locus follows from the Tannakian formalism and the Beauville-Laszlo lemma, Lemma 5.2.9.” SW20-berkeley, Proof of Theorem 14.1.1, printed p. 116: “Now by the Beauville-Laszlo lemma, Lemma 5.2.9, the datum of F' and beta is equivalent to the datum of a B+dR-lattice in F-hat_oo (x)_{B+dR} BdR = T (x)_Zp BdR.” HK-admissible, Section 4.3, p. 29: “by the Tannakian formalism, we reduce to modifications of vector bundles on FF_S by B+dR-lattices, which can be constructed via the Beauville-Laszlo gluing [45, Lemma 5.2.9] (using the equivalence of vector bundles and finite projective modules on affinoids U in FF_S [45, Theorem 5.2.8]).” FS-geometrization, VI.1, before Definition VI.1.5, printed p. 192: “Assuming that D_S is affinoid, as is the case locally on S, we let B+_{Div^d_Y}(S) ... be (the global sections of) the completion of O_YS along I_S ... In the case of d = 1, those rings are the ones that are usually denoted B+dR, resp. BdR.”

### `gluing-exactness-tensor-and-base-change` — The gluing is an exact tensor equivalence and commutes with base change

*theorem*, realises `RelativeFarguesFontaine:RF4:vector-bundles`, `RelativeFarguesFontaine:RF4`.

**Statement.** Conventions of this layer: E is a nonarchimedean local field with residue field F_q and uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR, B_dR when d = 1). In the setting of RF4:vector-bundles/meromorphic-modification-at-a-divisor: (a) the lattice functor commutes with tensor products, duals and internal Hom: Xi(E_1 (x) E_2) = Xi(E_1) (x) Xi(E_2) inside (E'_1 (x) E'_2)-hat_D[1/I_D] and Xi(E^dual) = Xi(E)^dual; (b) it is exact: a sequence of modifications 0 -> E_1 -> E -> E_2 -> 0 of a short exact sequence 0 -> E'_1 -> E' -> E'_2 -> 0 is exact iff the sequence of lattices 0 -> Xi_1 -> Xi -> Xi_2 -> 0 is exact, and every exact sequence of lattices compatible with the completed sequence of the E' glues to an exact sequence of vector bundles; (c) it commutes with base change: for a map T -> S of affinoid perfectoid spaces with pulled-back divisor D_T, the pullback of (E, beta) corresponds to Xi (x)_{B^+_D(S)} B^+_{D_T}(T), compatibly with composition of base changes; (d) on the algebraic side, for a map of glueing pairs (R, f) -> (R_2, f_2) (a ring map with f |-> f_2 up to a unit), Can and the module of sections commute with base change of finite projective glueing data (coefficient change).

**Hypotheses that must be kept.**

- Bundles and lattices are finite projective; exactness is for sequences of finite projective modules
- Base change uses that B^+_{Div^d} and B_{Div^d} are v-sheaves over Div^d (RF2:integral-divisors/completed-rings-B-plus-and-B), so B^+_D(S) -> B^+_{D_T}(T) is defined
- Coefficient change in (d) requires f_2 to be a nonzerodivisor (or (R_2, f_2) a glueing pair); otherwise the base-changed datum need not glue

**Proof outline.**

1. (a) On a chart U with I_D = xi A, the gluing of RF4:vector-bundles/beauville-laszlo-module-gluing commutes with tensor products and duals of finite projective glueing data, because Can is a tensor functor and the module of sections of a finite projective datum is finite projective with M (x) R' = M' (RF4:vector-bundles/finite-projective-glueing-over-exact-square).
2. (b) Exact sequences of finite projective modules are split, so tensoring with R', R_f, R'_f preserves them; conversely a sequence of A-modules is exact iff it is after (x) A-hat and (x) A[1/xi], by the exact square 0 -> A -> A-hat (+) A[1/xi] -> A-hat[1/xi] -> 0 and the snake lemma. Caraiani-Scholze record this compatibility for Kedlaya-Liu's B-pair equivalence.
3. (c) Pullback of the chart: A -> A_T with xi |-> xi_T a local generator of I_{D_T}, so A-hat (x) ... -> A_T-hat; the gluing of the base change is the base change of the gluing by (d).
4. (d) Base change of the exact square along a map of glueing pairs, and V1's base change API.

**Acceptance.**

- The tensor product of modifications bounded by k and l is bounded by k + l, and the lattice of the determinant is the determinant of the lattice
- Base change to the geometric points of S recovers the fibrewise lattices
- Exactness is asserted only for sequences of lattices, which are finite projective: the sequence 0 -> I_D B^+ -> B^+ -> B^+/I_D -> 0 has a torsion last term and is not the lattice sequence of a short exact sequence of modifications

**Dependencies.** 
Within this part: `meromorphic-modification-at-a-divisor`, `beauville-laszlo-module-gluing`, `finite-projective-glueing-over-exact-square`.
Earlier layers of this roadmap: `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`.
Libraries: `mathlib:TensorProduct`, `mathlib:Module.Dual`, `mathlib:CategoryTheory.Functor.Monoidal`.

**Sources.** CS17-generic, Theorem 3.5.1: “There is an equivalence between the category of vector bundles over X(R-flat) (or over X(R-flat, R-flat+)) and the category of triples (M1, M2, iota) ... This equivalence is compatible with tensor products and short exact sequences.” FS-geometrization, VI.1, before Definition VI.1.5, printed p. 192: “This defines v-sheaves B+_{Div^d} contained in B_{Div^d} over Div^d_(-) in all three cases.” Stacks-BL, Section 15.92, introduction: “In fact, we will establish the Beauville-Laszlo theorem in the more general setting of a ring map R -> R' which induces isomorphisms R/f^nR -> R'/f^nR' for every n > 0 and an isomorphism R[f^oo] -> R'[f^oo]. This is better suited for globalizing”

### `disjoint-and-colliding-legs` — Gluing along several disjoint or colliding legs

*theorem*, realises `RelativeFarguesFontaine:RF4:vector-bundles`, `RelativeFarguesFontaine:RF4`.

**Statement.** Conventions of this layer: E is a nonarchimedean local field with residue field F_q and uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR, B_dR when d = 1). Let D_1, D_2 be divisors attached to S -> Div^{d_1}_(-), S -> Div^{d_2}_(-) and D = D_1 + D_2 the divisor attached to their sum in Div^{d_1 + d_2}, so I_D = I_{D_1} I_{D_2}. (a) Disjoint legs: if D_1 and D_2 are disjoint then B^+_D(S) = B^+_{D_1}(S) x B^+_{D_2}(S) and B_D(S) = B_{D_1}(S) x B_{D_2}(S); a lattice at D is a pair of lattices, and modifications of E' at D are equivalent to pairs consisting of a modification (E_1, beta_1) of E' at D_1 and a modification of E_1 at D_2 (iterated gluing, in either order, canonically independent of the order). (b) Colliding legs: if D = m D_1 (all legs equal, m >= 1) then I_D = I_{D_1}^m, B^+_D(S) = B^+_{D_1}(S) and B_D(S) = B_{D_1}(S), and a modification at D_1 bounded by k is the same as a modification at D bounded by ceiling(k/m). (c) For a locally finite family (D_n) of pairwise disjoint degree-one divisors of Y_S (for instance the Frobenius translates phi^n(D_0), n >= 1, on Y_{[0,oo)}), modifications of E' along the union are equivalent to families of lattices (Xi_n) at each D_n.

**Hypotheses that must be kept.**

- Disjointness in (a) is of the closed subspaces D_1, D_2 of X-cal; then I_{D_1} + I_{D_2} = O and the Chinese remainder theorem applies on affinoid charts
- In (b) the legs may coincide; FS VI.1.2 constructs the degree-d divisor of an ordered tuple by the product equation xi = xi_1 ... xi_d, which is a nonzerodivisor also at coincident legs
- In (c) local finiteness is what lets the gluing be performed chart by chart; the family is infinite in Scholze-Weinstein Proposition 12.4.6

**Proof outline.**

1. (a) On an affinoid chart A containing D with I_{D_i} = xi_i A, the ideals xi_1^n A and xi_2^n A are comaximal for every n, so A/(xi_1 xi_2)^n = A/xi_1^n x A/xi_2^n and the completions split; a lattice at D is then a pair, and RF4:vector-bundles/meromorphic-modification-at-a-divisor glues one factor at a time.
2. (b) For D = m D_1 one has I_D = I_{D_1}^m, so the I_D-adic and I_{D_1}-adic filtrations are cofinal and the completions and their localisations coincide; E -> E'(k D_1) is the same as E -> E'(k' D) for k' = ceiling(k/m), so meromorphy along D and along D_1 are the same condition.
3. (c) Apply the gluing on a cover of Y_S by charts each meeting finitely many D_n, as in the proof of Scholze-Weinstein Proposition 12.4.6 ('We can repeat this at phi^n(x_C) for all n >= 1'), and glue (AdicSpacesPartII:R3).
4. Fargues-Fontaine Proposition 5.3.1 is the absolute case: a bundle on X, finitely many points x_i, completions O-hat_{X,x_i}.

**Acceptance.**

- For S a geometric point and finitely many distinct classical points x_1, ..., x_r of X_FF, recover Fargues-Fontaine Proposition 5.3.1
- For two colliding legs at the same untilt, the Beilinson-Drinfeld ring B^+_{Div^2} at the diagonal is B^+_dR, not B^+_dR x B^+_dR
- The iterated gluing at D_1 then D_2 and at D_2 then D_1 give canonically isomorphic modifications

**Dependencies.** 
Within this part: `meromorphic-modification-at-a-divisor`, `gluing-exactness-tensor-and-base-change`.
Earlier layers of this roadmap: `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`, `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`, `RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf`.
Other roadmaps: `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`.

**Sources.** FS-geometrization, Definition VI.1.6 and the remark after it, printed p. 193: “the functor sending an affinoid perfectoid S -> Div^d_Y ... to the groupoid of pairs of G-bundles E1, E2 over B+_{Div^d}(S) ... together with an isomorphism E1 = E2 over B_{Div^d}(S).” SW20-berkeley, Proof of Proposition 12.4.6, printed pp. 106-107: “we can use Xi to define a vector bundle over Y[0,oo) which is isomorphic to E0 away from xC, and whose completed stalk at xC is given by Xi. We can repeat this at phi^n(xC) for all n >= 1” FF18-courbe, Proposition 5.3.1, p. 209: “Les foncteurs FibX -> C, E |-> (E|U, (E_xi)_{1<=i<=r}, (can_i)_{1<=i<=r}) et FibX -> C-hat, E |-> (E|U, (E-hat_xi)_{1<=i<=r}, (can_i)_{1<=i<=r}) sont des equivalences de categories.”

### `untilt-divisor-complement-affine` — The complement of the untilt divisor in Proj(P_R) is affine (Kedlaya-Liu 8.9.3)

*theorem*, realises `RelativeFarguesFontaine:RF4:vector-bundles`.

**Statement.** Kedlaya-Liu Hypotheses 8.7.1 and 8.9.1: a >= 1 an integer and q = p^a; (A, A^+) a perfectoid adic Banach algebra over Q_p, X = Spa(A, A^+), and (R, R^+) the perfect uniform adic Banach algebra over F_p corresponding to it; P_R = sum_{n >= 0} P_{R,n} the graded ring of phi^a-invariants (H^0 of O(n)), Proj(P_R) the schematic relative curve, FF_R -> Proj(P_R) the comparison morphism (an equivalence on vector bundles, KL 8.7.7), and Z the image of the canonical section Spec(A) -> Proj(P_R) given by the untilt A of R. For S = Spa(R, R^+) over F_q and E = W(F_q)[1/p] this is the schematic curve X_S^alg = Proj(P) of RF3 and the degree-one divisor of the untilt; L_X denotes the line bundle O(Z) (KL Definition 8.8.18, Convention 8.9.2). Then (a) the open subscheme Proj(P_R) minus Z is affine; (b) the closed subscheme Z is a Cartier divisor contained in an open affine subscheme of Proj(P_R).

**Hypotheses that must be kept.**

- The base X = Spa(A, A^+) is affinoid perfectoid over Q_p; the source works with phi^a-modules over Q_p, which is the unramified coefficient field E = W(F_q)[1/p]
- (a) uses that Z is the zero locus of a section t_X of the ample line bundle L_X; Kedlaya-Liu state that L_X is pure of slope 1, and the corrected slope is 1/a (PAPER-KEDLAYA-LIU-15/E78), which does not affect ampleness
- (b) uses an element t_L of P_{L,1} over an auxiliary perfect analytic field L whose Newton polygon avoids slope 1

**Proof outline.**

1. (a) Z is the divisor of the section t_X of L_X. By KL Lemma 8.8.19 the phi^a-module of L_X is M(1) with M globally etale, so L_X is globally ample by KL Corollary 8.8.7 (VectorBundlesAndIsocrystals:VB2:ampleness/globally-etale-positive-ampleness); the nonvanishing locus of a section of a globally ample line bundle is affine (KL Lemma 8.8.8; VectorBundlesAndIsocrystals:VB2:ampleness/ample-section-affineness).
2. (b) Following the proof of KL Proposition 6.2.4 choose t_L in P_{L,1} whose Newton polygon does not have slope 1; then Z is contained in the affine open D_+(t_L), on which Z is cut out by one equation.

**Acceptance.**

- At a geometric point (A = C) recover Fargues-Fontaine: X minus {infinity} = Spec(B_e) with B_e = B[1/t]^{phi = 1} for t in P_1 with V^+(t) = {infinity}
- The open D_+(t_L) of (b) contains Z and is affine, so the completion of Proj(P_R) along Z is an affine formal scheme

**Dependencies.** 
Earlier layers of this roadmap: `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map`, `RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate`, `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`.
Other roadmaps: `VectorBundlesAndIsocrystals:VB2:ampleness/ample-section-affineness`, `VectorBundlesAndIsocrystals:VB2:ampleness/globally-etale-positive-ampleness`, `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`.

**Sources.** KL15-foundations, Lemma 8.9.3, p. 187: “Let Z be the image of the canonical section Spec(A) -> Proj(PR). (a) The open subscheme Proj(PR) - Z of Proj(PR) is affine. (b) The closed subscheme Z of Proj(PR) is a Cartier divisor contained in an open affine subscheme of Proj(PR).” KL15-foundations, Proof of Lemma 8.9.3, p. 187: “Thanks to the interpretation of Z as the divisor of the section tX of the line bundle LX, we may invoke Lemma 8.8.8 to deduce (a). To prove (b), define L as in Remark 8.7.6; it then suffices to exhibit some tL in PL,1 whose support in Proj(PR) is disjoint from Z.”

### `relative-period-rings-Be-BdR` — The relative period rings B_e(A), B^+_dR(A), B_dR(A) (Kedlaya-Liu 8.9.4)

*construction*, realises `RelativeFarguesFontaine:RF4:vector-bundles`.

**Statement.** Kedlaya-Liu Hypotheses 8.7.1 and 8.9.1: a >= 1 an integer and q = p^a; (A, A^+) a perfectoid adic Banach algebra over Q_p, X = Spa(A, A^+), and (R, R^+) the perfect uniform adic Banach algebra over F_p corresponding to it; P_R = sum_{n >= 0} P_{R,n} the graded ring of phi^a-invariants (H^0 of O(n)), Proj(P_R) the schematic relative curve, FF_R -> Proj(P_R) the comparison morphism (an equivalence on vector bundles, KL 8.7.7), and Z the image of the canonical section Spec(A) -> Proj(P_R) given by the untilt A of R. For S = Spa(R, R^+) over F_q and E = W(F_q)[1/p] this is the schematic curve X_S^alg = Proj(P) of RF3 and the degree-one divisor of the untilt; L_X denotes the line bundle O(Z) (KL Definition 8.8.18, Convention 8.9.2). Define R_1 = B_e(A) by Spec(R_1) = Proj(P_R) minus Z (affine by RF4:vector-bundles/untilt-divisor-complement-affine (a)); R_2 = B^+_dR(A) by Spec(R_2) = the completion of Proj(P_R) along Z (affine by (b)); and R_3 = B_dR(A) by Spec(R_3) = Spec(R_1) x_{Proj(P_R)} Spec(R_2). Then R_2 is the ker(theta)-adic completion of R-tilde^{int,1}_R and R_3 = R_2[1/z] for any generator z of ker(theta); R_2 and R_3 are the rings B^+_D(S), B_D(S) of the degree-one untilt divisor D of RF2:untilts, and the triple is a relative version of Fontaine's (B_e, B^+_dR, B_dR).

**Hypotheses that must be kept.**

- Hypotheses of Kedlaya-Liu 8.9.1 (affinoid perfectoid base over Q_p, unramified coefficients)
- R_1 is the ring of the AFFINE scheme Proj(P_R) minus Z; it is not B[1/t]: the phi-invariance is built into P_R
- R_3 = R_2[1/z] is independent of the generator z of ker(theta) because any two differ by a unit of R_2

**Proof outline.**

1. Lemma 8.9.3 makes all three schemes affine; the fibre product of affine schemes over a separated scheme is affine.
2. The identification of R_2 with the ker(theta)-adic completion of R-tilde^{int,1}_R uses that Z = Spec(A) and the completion along Z only sees the rings A/ker(theta)^n (KL Definition 8.9.4).
3. Compatibility with RF2:untilts: both rings are the completion of the structure sheaf along the same Cartier divisor, transported by GAGA (VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence).
4. In the p-typical case, compare R_2 with Mathlib's BDeRhamPlus A^+ p through PadicHodgeTheory:R06.1/bdr-plus-of-perfectoid-affinoid-algebras, which identifies the theta-kernel-adic completions.

**Uses.**

- Kedlaya-Liu Theorem 8.9.6: vector bundles on Proj(P_R) are triples over R_1, R_2 with an isomorphism over R_3, and the B-pair complex over these rings computes cohomology.
- Caraiani-Scholze Theorem 3.5.1 and Corollary 3.5.2: gluing a B^+_dR,R-lattice in B_dR,R^n to the trivial bundle on X(R-flat) minus Z, giving the map from the affine Grassmannian to G-bundles.
- Fargues-Fontaine 8.2.1.1: at a geometric point, X minus {infinity} = Spec(B_e), O-hat_{X,infinity} = B^+_dR, and bundles are pairs (M, N).
- Kedlaya-Liu Definition 9.3.11: the sheafified rings B_{e,X}, B^+_{dR,X}, B_{dR,X} of B-pairs over a general base.

**API.**

| name | role | statement |
| --- | --- | --- |
| `RelativeBe` | data | R_1 = B_e(A) = O(Proj(P_R) minus Z), a Q_p-algebra functorial in (A, A^+). |
| `RelativeBdRPlus` | data | R_2 = B^+_dR(A), the ring of the completion of Proj(P_R) along Z. |
| `RelativeBdR` | data | R_3 = B_dR(A) = O(Spec R_1 x_{Proj} Spec R_2). |
| `RelativeBdR.eq_localization` | characterisation | R_3 = R_2[1/z] for every generator z of ker(theta), and the localisation does not depend on z. |
| `RelativeBdRPlus.equiv_completedRing` | compatibility | R_2 = B^+_D(S) and R_3 = B_D(S) for the degree-one divisor D of the untilt (RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration), compatibly with theta and the I_D-adic filtration. |
| `RelativeBdRPlus.equiv_mathlib` | compatibility | In the p-typical case R_2 is canonically isomorphic to Mathlib's BDeRhamPlus A^+ p and R_3 to BDeRham A^+ p, through PadicHodgeTheory:R06.1/bdr-plus-of-perfectoid-affinoid-algebras. |
| `RelativeBe.restrict` | projection | The restriction maps R_1 -> R_3 and R_2 -> R_3, and the localisation R_2 -> R_3. |
| `RelativeBe.map` | functoriality | A morphism of perfectoid pairs (A, A^+) -> (A', A'^+) induces compatible maps R_i(A) -> R_i(A'), with map_id and map_comp. |
| `RelativeBe.atGeometricPoint` | example | For A = C complete algebraically closed, R_1 = B[1/t]^{phi = 1} = B_e for t in P_1 with V^+(t) = {infinity}. |

**Unit tests.**

- `RelativeBe.fundamental_exact_sequence` (computation): For A = C and a = 1: ker(R_1 (+) R_2 -> R_3) = Q_p and R_1 (+) R_2 -> R_3 is surjective; this is Fontaine's fundamental exact sequence 0 -> Q_p -> B_e -> B_dR/B^+_dR -> 0 (PadicHodgeTheory:R06.1/fundamental-exact-sequence).
- `RelativeBdR.localization_unit_invariant` (degenerate): Replacing the generator z of ker(theta) by uz with u a unit of R_2 gives the same subring R_2[1/z] = R_2[1/(uz)] of R_3.
- `RelativeBdRPlus.mathlib_compat` (compatibility): For (A, A^+) = (C, O_C) with C/Q_p complete algebraically closed, R_2 is isomorphic to BDeRhamPlus O_C p and R_3 to BDeRham O_C p, compatibly with theta.
- `RelativeBe.not_B_invert_t` (non-example): R_1 is not B[1/t]: at A = C the element 1/t of B[1/t] is not phi-invariant (phi(1/t) = p^(-1) t^(-1)), so it does not lie in B_e.

**Acceptance.**

- At A = C: R_1 = B_e = B_crys^{phi = 1}, R_2 = B^+_dR(C), R_3 = B_dR(C), and Fontaine's fundamental exact sequence 0 -> Q_p -> B_e -> B_dR/B^+_dR -> 0 holds
- Changing the generator z of ker(theta) by a unit does not change R_3

**Dependencies.** 
Within this part: `untilt-divisor-complement-affine`.
Earlier layers of this roadmap: `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`, `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`, `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map`.
Other roadmaps: `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`, `PadicHodgeTheory:R06.1/bdr-plus-of-perfectoid-affinoid-algebras`.
Libraries: `mathlib:BDeRhamPlus`, `mathlib:BDeRham`, `mathlib:IsLocalization.Away`, `mathlib:AdicCompletion`.

**Sources.** KL15-foundations, Definition 8.9.4, p. 187: “By Lemma 8.9.3(a), the complement of Z in Proj(PR) is an affine scheme Spec(R1). By Lemma 8.9.3(b), the completion of Proj(PR) along Z is another affine scheme Spec(R2), and Spec(R1) x_Proj(PR) Spec(R2) is yet another affine scheme Spec(R3).” KL15-foundations, Definition 8.9.4, p. 187: “One can also identify R2 with the ker(theta)-adic completion of R-tilde^int,1_R and R3 with R2[z^-1] for some z generating ker(theta).” CS17-generic, Before Theorem 3.5.1: “Then Spec B+dR,R is the completion of X(R-flat) along Z. Moreover, Spec BdR,R can be identified with the fiber product of Spec B+dR,R and the complement of Z over X(R-flat).”

Suggested home: `TauCeti/AdicSpace/FarguesFontaine/BPairs`, namespace `TauCeti.FarguesFontaine.BPair`.

### `B-pair-cohomology` — B-pair cohomology computes quasicoherent cohomology (Kedlaya-Liu 8.9.6(a))

*theorem*, realises `RelativeFarguesFontaine:RF4:vector-bundles`.

**Statement.** Kedlaya-Liu Hypotheses 8.7.1 and 8.9.1: a >= 1 an integer and q = p^a; (A, A^+) a perfectoid adic Banach algebra over Q_p, X = Spa(A, A^+), and (R, R^+) the perfect uniform adic Banach algebra over F_p corresponding to it; P_R = sum_{n >= 0} P_{R,n} the graded ring of phi^a-invariants (H^0 of O(n)), Proj(P_R) the schematic relative curve, FF_R -> Proj(P_R) the comparison morphism (an equivalence on vector bundles, KL 8.7.7), and Z the image of the canonical section Spec(A) -> Proj(P_R) given by the untilt A of R. For S = Spa(R, R^+) over F_q and E = W(F_q)[1/p] this is the schematic curve X_S^alg = Proj(P) of RF3 and the degree-one divisor of the untilt; L_X denotes the line bundle O(Z) (KL Definition 8.8.18, Convention 8.9.2). With R_1, R_2, R_3 as in RF4:vector-bundles/relative-period-rings-Be-BdR, for every flat quasicoherent sheaf V on Proj(P_R) the cohomology of the complex 0 -> Gamma(Spec R_1, V) (+) Gamma(Spec R_2, V) -> Gamma(Spec R_3, V) -> 0, whose arrow is the difference of the two restriction maps, is naturally identified with H^i(Proj(P_R), V) (so H^i = 0 for i >= 2). At a geometric point (Fargues-Fontaine Proposition 5.3.3) for a vector bundle E with M = Gamma(X minus {infinity}, E) and N = E-hat_infinity: H^0(X, E) = M intersect N and H^1(X, E) = N[1/t]/(M + N).

**Hypotheses that must be kept.**

- V flat and quasicoherent; for non-flat V the Beauville-Laszlo sequence need not be exact
- Spec(R_2) -> Proj(P_R) is not known to be flat in general (Kedlaya-Liu Remark 8.9.5), so the statement is not obtained by faithfully flat descent
- Same hypotheses as RF4:vector-bundles/untilt-divisor-complement-affine

**Proof outline.**

1. Cover Proj(P_R) by Spec(R_1) and an affine open Spec(B) containing Z on which Z = V(z) (Lemma 8.9.3(b)); Proj(P_R) is separated, so the Cech complex of this cover computes cohomology of quasicoherent sheaves and cohomology vanishes above degree 1 (KL Remark 8.7.6(b); VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension).
2. On Spec(B), Beauville-Laszlo for the glueing pair (B, z) and the flat module V(B) gives the exact sequence 0 -> V(B) -> V(B)[1/z] (+) V(B)-hat -> V(B)-hat[1/z] -> 0 (RF4:vector-bundles/beauville-laszlo-module-gluing (c)).
3. Combine the two by a diagram chase: Spec(B) minus Z = Spec(B[1/z]) is contained in Spec(R_1), and V(B)-hat = Gamma(Spec R_2, V), V(B)-hat[1/z] = Gamma(Spec R_3, V) (KL: 'This follows from Proposition 1.3.6').

**Acceptance.**

- For V = O and A = C recover H^0(X, O) = Q_p and H^1(X, O) = 0 from Fontaine's fundamental exact sequence
- For V = O(1) at a geometric point recover H^1(X, O(1)) = 0 from B_e^{phi = p}-surjectivity onto B_dR/B^+_dR
- Check that the complex has length two, matching the cohomological dimension one of Proj(P_R)

**Dependencies.** 
Within this part: `relative-period-rings-Be-BdR`, `untilt-divisor-complement-affine`, `beauville-laszlo-module-gluing`.
Other roadmaps: `VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension`.
Libraries: `mathlib:Module.Flat`.

**Sources.** KL15-foundations, Theorem 8.9.6(a), p. 188: “(a) For any flat quasicoherent sheaf V on Proj(PR), the cohomology of the complex 0 -> Gamma(Spec(R1), V) (+) Gamma(Spec(R2), V) -> Gamma(Spec(R3), V) -> 0 where the arrow is given by the difference ... may be naturally identified with H^i(Proj(PR), V).” KL15-foundations, Remark 8.9.5, p. 187: “In general, one might expect the same to hold, but one cannot quite prove it using faithfully flat descent because it is unclear whether Spec(R2) -> Proj(PR) is a flat morphism.” FF18-courbe, Proposition 5.3.3, p. 209: “Il y a des identifications canoniques H0(X, E) = u(M) intersect N ... Plus generalement, RGamma(X, E) est isomorphe au complexe M (+) N -> N (x) K, (x, y) |-> u(x) - y”

### `vector-bundles-as-relative-B-pairs` — Vector bundles on the relative curve are relative B-pairs (Kedlaya-Liu 8.9.6(b),(c))

*theorem*, realises `RelativeFarguesFontaine:RF4:vector-bundles`, `RelativeFarguesFontaine:RF4`. **Planet: Vector bundles as relative B-pairs.**

**Statement.** Kedlaya-Liu Hypotheses 8.7.1 and 8.9.1: a >= 1 an integer and q = p^a; (A, A^+) a perfectoid adic Banach algebra over Q_p, X = Spa(A, A^+), and (R, R^+) the perfect uniform adic Banach algebra over F_p corresponding to it; P_R = sum_{n >= 0} P_{R,n} the graded ring of phi^a-invariants (H^0 of O(n)), Proj(P_R) the schematic relative curve, FF_R -> Proj(P_R) the comparison morphism (an equivalence on vector bundles, KL 8.7.7), and Z the image of the canonical section Spec(A) -> Proj(P_R) given by the untilt A of R. For S = Spa(R, R^+) over F_q and E = W(F_q)[1/p] this is the schematic curve X_S^alg = Proj(P) of RF3 and the degree-one divisor of the untilt; L_X denotes the line bundle O(Z) (KL Definition 8.8.18, Convention 8.9.2). (b) The morphism Spec(R_1 (+) R_2) -> Proj(P_R) is an effective descent morphism for quasicoherent finite locally free sheaves. (c) The category of vector bundles on Proj(P_R) is equivalent to the category of triples (V_1, V_2, iota) with V_1 a finite projective R_1 = B_e(A)-module, V_2 a finite projective R_2 = B^+_dR(A)-module and iota : V_1 (x)_{R_1} R_3 = V_2 (x)_{R_2} R_3 an isomorphism of R_3 = B_dR(A)-modules; the equivalence is compatible with tensor products and short exact sequences. By GAGA the same holds for vector bundles on the adic relative curve FF_R = X_S (Caraiani-Scholze Theorem 3.5.1). At a geometric point S = Spa(C^flat), where B_e is a principal ideal domain, vector bundles on X_FF are triples of finite free modules (Fargues-Fontaine Corollaire 5.3.2) and isomorphism classes of rank-n bundles are GL_n(B_e) \ GL_n(B_dR) / GL_n(B^+_dR).

**Hypotheses that must be kept.**

- Hypotheses of Kedlaya-Liu 8.9.1: affinoid perfectoid base over Q_p and unramified coefficients; the general-E relative version is RF4:vector-bundles/meromorphic-modification-at-a-divisor, formulated through modifications
- The triples are of finite projective modules; finite free in the field case only because Pic(Spec B_e) = 0
- The compatibility with short exact sequences is stated by Caraiani-Scholze for this equivalence

**Proof outline.**

1. (b), (c): Kedlaya-Liu deduce both from Proposition 1.3.6: on an affine open Spec(B) containing Z with Z = V(z), the glueing pair (B, z) glues finite projective B[1/z]- and B-hat-modules; glue the result with V_1 on Spec(R_1) along Spec(B[1/z]) (RF4:vector-bundles/beauville-laszlo-module-gluing, RF4:vector-bundles/untilt-divisor-complement-affine).
2. Transport to FF_R by GAGA (KL Theorem 8.7.7; VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence), as Caraiani-Scholze do.
3. Tensor and exactness compatibility as in RF4:vector-bundles/gluing-exactness-tensor-and-base-change.
4. Field case: B_e is a principal ideal domain (Fargues-Fontaine; VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point), so finite projective B_e-modules are free; choosing bases gives the double coset description (FF Corollaire 5.3.2).

**Acceptance.**

- Gluing a B^+_dR(A)-lattice in B_dR(A)^n to the trivial bundle on Proj(P_R) minus Z gives a vector bundle (the 'in particular' of Caraiani-Scholze 3.5.1)
- At a geometric point the trivial lattice gives O^n and the lattice t^(-1) B^+_dR (+) B^+_dR^(n-1) gives O(1) (+) O^(n-1)
- Rank one at a geometric point: GL_1(B_e) \ B_dR^x / (B^+_dR)^x = Z, the degree

**Dependencies.** 
Within this part: `relative-period-rings-Be-BdR`, `untilt-divisor-complement-affine`, `beauville-laszlo-module-gluing`, `gluing-exactness-tensor-and-base-change`, `meromorphic-modification-at-a-divisor`.
Other roadmaps: `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`, `VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point`.
Libraries: `mathlib:Module.Projective`, `mathlib:Module.Free`, `mathlib:CategoryTheory.Equivalence`.

**Sources.** KL15-foundations, Theorem 8.9.6(b),(c), p. 188: “(b) The morphism Spec(R1 (+) R2) -> Proj(PR) is an effective descent morphism for the category of quasicoherent finite locally free sheaves over schemes ... (c) The category of vector bundles on Proj(PR) is equivalent to the category of triples (V1, V2, iota)” CS17-generic, Theorem 3.5.1: “There is an equivalence between the category of vector bundles over X(R-flat) (or over X(R-flat, R-flat+)) and the category of triples (M1, M2, iota) ... This equivalence is compatible with tensor products and short exact sequences.” FF18-courbe, Corollaire 5.3.2, p. 209: “Supposons U affine et Pic(U) trivial. Soit B = Gamma(U, OX). La categorie des fibres vectoriels sur X est equivalente a celle des triplets (M, N, (ui)) ... En particulier, les classes d'isomorphismes de fibres vectoriels de rang n sur X s'identifient a l'ensemble”

### `lattices-and-modifications-of-trivial-bundles` — Lattices (T, Xi) and modifications of trivial bundles (Scholze-Weinstein 12.4.6, 14.1.1)

*comparison*, realises `RelativeFarguesFontaine:RF4:vector-bundles`, `RelativeFarguesFontaine:RF4`.

**Statement.** Conventions of this layer: E is a nonarchimedean local field with residue field F_q and uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR, B_dR when d = 1). (a) For S affinoid perfectoid with an untilt S^sharp over E, D = S^sharp the degree-one divisor of X_S and T a finite free O_E-module, the gluing of RF4:vector-bundles/meromorphic-modification-at-a-divisor applied to F = T (x)_{O_E} O_{X_S} gives an equivalence between pairs (T, Xi) with Xi a B^+_dR(S^sharp)-lattice in T (x)_{O_E} B_dR(S^sharp) and triples (F, F', beta) with F' a vector bundle on X_S and beta : F|_{X_S minus D} = F'|_{X_S minus D} an isomorphism meromorphic along D (so that (F', beta^(-1)) is a modification of F at D). (b) For S = Spa(C^flat) and E = Q_p, using the locally finite family of disjoint divisors phi^n(x_C), n >= 1, of Y_{[0,oo)}: the pairs (T, Xi) are equivalent to shtukas over Spa(C^flat) with one leg at phi^(-1)(x_C) (Scholze-Weinstein Proposition 12.4.6), and to quadruples (F, F', beta, T) with F trivial and T a Z_p-lattice in H^0(X_FF, F) (Theorem 14.1.1, (2) <=> (3)). (c) Minuscule case (Fargues-Fontaine 8.3.1): lattices with t Xi_0 in Xi in Xi_0, Xi_0 = T (x) B^+_dR, correspond to C-subspaces of T (x) C, i.e. to modifications whose cokernel is killed by t.

**Hypotheses that must be kept.**

- E = Q_p and S a geometric point in (b), as in the source; (a) is the relative statement and needs no more than the linear gluing
- The equivalence of 'F trivial with a Z_p-lattice T in H^0(X_FF, F)' and 'T finite free over Z_p' uses H^0(X_FF, O) = Q_p (VectorBundlesAndIsocrystals:VB1/cohomology-of-twists), not the classification of bundles
- This node is the curve input of the ESSENTIAL SURJECTIVITY of Fargues' theorem (BKF modules <-> (T, Xi)); full faithfulness uses no curve input (BMS1 Remark 4.29), so it is exported to the essential-surjectivity part of AInfCohomology AI.2 only (RT-AREA-padic-1/19)

**Proof outline.**

1. (a) Apply RF4:vector-bundles/meromorphic-modification-at-a-divisor with E' = F: F-hat_D = T (x) B^+_dR(S^sharp), so modifications of F at D are lattices in T (x) B_dR.
2. (b) Scholze-Weinstein, proof of Proposition 12.4.6: from (T, Xi) take the shtuka with no legs T (x) O_{Y[0,oo)}, glue Xi at x_C by Beauville-Laszlo, and repeat at phi^n(x_C) for n >= 1 (RF4:vector-bundles/disjoint-and-colliding-legs (c)) to get a meromorphic Frobenius; conversely Corollary 12.4.1 recovers (T, Xi).
3. (b) Proof of Theorem 14.1.1, (2) <=> (3): 'By Corollary 13.5.5, the datum of a trivial vector bundle F is equivalent to the datum of a finite-dimensional Q_p-vector space; together with T, this data is equivalent to a finite free Z_p-module T. Now by the Beauville-Laszlo lemma, the datum of F' and beta is equivalent to the datum of a B^+_dR-lattice.'
4. (c) A modification with t Xi_0 in Xi in Xi_0 is determined by Xi / t Xi_0, a C-subspace of Xi_0 / t Xi_0 = T (x) C (Fargues-Fontaine 8.3.1).

**Acceptance.**

- p-divisible group range: T (x) B^+_dR in Xi in xi^(-1)(T (x) B^+_dR) (Scholze-Weinstein Theorem 14.1.1, last sentence; Remark 12.4.7)
- Rank one: Xi = xi^k B^+_dR with k in Z gives F' = O(-k), compatible with the sign convention O(infinity) = O(1)
- The functor (T, Xi) |-> (F, F', beta, T) commutes with tensor products and duals (RF4:vector-bundles/gluing-exactness-tensor-and-base-change)

**Dependencies.** 
Within this part: `meromorphic-modification-at-a-divisor`, `disjoint-and-colliding-legs`, `gluing-exactness-tensor-and-base-change`.
Earlier layers of this roadmap: `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`.
Other roadmaps: `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`, `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`.
Libraries: `mathlib:Module.Free`.

**Sources.** SW20-berkeley, Proposition 12.4.6, printed p. 106: “The above functor defines an equivalence between shtukas over Spa C-flat with one leg at phi^-1(xC) and the category of pairs (T, Xi), where T is a finite free Zp-module and Xi in T (x)Zp BdR is a B+dR-lattice.” SW20-berkeley, Proof of Proposition 12.4.6, printed pp. 106-107: “By the Beauville-Laszlo lemma, Lemma 5.2.9, and as xC defines a closed Cartier divisor, we can use Xi to define a vector bundle over Y[0,oo) which is isomorphic to E0 away from xC, and whose completed stalk at xC is given by Xi.” SW20-berkeley, Proof of Theorem 14.1.1, printed p. 116: “Let us explain the equivalence between (2) and (3). By Corollary 13.5.5, the datum of a trivial vector bundle F is equivalent to the datum of a finite-dimensional Qp-vector space; together with T, this data is equivalent to a finite free Zp-module T.” BMS18-integral, Remark 4.29, p. 43: “For the proof of our main theorems, we only need fully faithfulness of the functor M |-> (T, Xi), which is easy to prove directly.”

### `kedlaya-algebraicity-of-punctured-bundles` — Kedlaya's algebraicity of vector bundles on the punctured Witt spectrum

*theorem*, realises `RelativeFarguesFontaine:RF4:vector-bundles`. **Planet: Kedlaya algebraicity of vector bundles.**

**Statement.** Let R be a perfect Tate Huber ring of characteristic p, R^+ a ring of integral elements, x in R a topologically nilpotent unit (so x in R^+), and A = W(R^+) (p-typical Witt vectors). Let X-sch = Spec(A) minus V(p, [x]) and Y-ad = Spa(A, A) minus V(p, [x]), the analytic locus. Then pullback along the morphism of locally ringed spaces Y-ad -> X-sch is an equivalence Vec(X-sch) = Vec(Y-ad) (Kedlaya, Theorem 3.8). If moreover R^+ = o_K for a perfectoid field K of characteristic p, then finite free A-modules, vector bundles on Spa(A, A) and vector bundles on Spa(A, A) minus the closed point are equivalent (Kedlaya Theorem 3.9; Scholze-Weinstein Theorem 14.2.1), and so are vector bundles on Spec(A) minus the closed point (Scholze-Weinstein Lemma 14.2.3). For general R^+ a vector bundle on Spec(A) minus {p = [x] = 0} need not extend to Spec(A) (Kedlaya Example 3.14).

**Hypotheses that must be kept.**

- p-typical: A = W(R^+), coefficient field Q_p, as in the source; the ramified W_{O_E}(R^+) and equal-characteristic versions are proof obligations not covered by a read source
- The adic space Y-ad contains the locus [x] = 0 (the 'crystalline end'), outside Y-curly_S; its rational charts are those of Kedlaya Definition 3.5
- The extension over the closed point in the field case uses that A_inf is a 'two-dimensional regular local ring'-like ring (Kedlaya Hypothesis 2.1); it fails for general R^+

**Proof outline.**

1. Cover Y-ad by the rational subsets U = {|[x]| <= |p| != 0} = Spa(B_1) and V = {|p| <= |[x]| != 0} = Spa(B_2) with intersection Spa(B_12), where B_1 = A_1<[x]/p>, B_2 = A_2<p/[x]>, A_1 = A[1/p], A_2 = A[1/[x]], A_12 = A[1/p[x]] (Kedlaya Definition 3.5).
2. These Huber rings are stably uniform (after completed tensor product with Z_p[p^(1/p^oo)] they become perfectoid and split back by the normalised trace: the sousperfectoid method, AdicSpacesPartII:R5), hence sheafy, and A_2 is uniform (Kedlaya Proposition 3.6).
3. On each sheafy chart, vector bundles are finite projective modules (Kedlaya Proposition 3.2(c); AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing), and the simple Laurent squares are glueing squares (Proposition 3.2(a,b); AdicSpacesPartII:R3/simple-laurent-glueing-square, AdicSpacesPartII:R3/glueing-square-finite-projective-descent).
4. Compare the Zariski cover {Spec A_1, Spec A_2} of X-sch with the adic cover through the exact-square gluing of RF4:vector-bundles/finite-projective-glueing-over-exact-square; in the resulting 2-commutative square every functor but Vec(X-sch) -> Vec(Y-ad) is an equivalence (proof of Kedlaya Theorem 3.8).
5. Field case: Kedlaya Theorem 2.7 (vector bundles on the punctured Spec of A_inf extend uniquely, via the Beauville-Laszlo square of A_inf[1/p] along p) combined with Theorem 3.8; Scholze-Weinstein give the same proof (Lemmas 14.2.3, 14.3.1).

**Acceptance.**

- Field case: every vector bundle on Spa(A_inf) minus {x_k} is free, recovering the input of Breuil-Kisin-Fargues module theory
- Kedlaya Example 3.14: for R^+ the (y, z)-adic completion of the perfection of k[[y, z]] and x = yz, the kernel of (a, b, c) |-> a[y] + b[z] + cp is a bundle on Spec W(R^+) minus the closed point that does not extend
- Compatibility with the Beauville-Laszlo square used in the field case

**Dependencies.** 
Within this part: `finite-projective-glueing-over-exact-square`, `beauville-laszlo-module-gluing`.
Earlier layers of this roadmap: `RelativeFarguesFontaine:RF0:integral-Y/curly-Y-affinoid-definition`, `RelativeFarguesFontaine:RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness`.
Other roadmaps: `AdicSpacesPartII:R3/simple-laurent-glueing-square`, `AdicSpacesPartII:R3/glueing-square-finite-projective-descent`, `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`, `AdicSpacesPartII:R5/sousperfectoid-stably-uniform`, `PerfectoidSpaces:P1/witt-vectors-of-perfect-plus-ring`.
Libraries: `mathlib:WittVector`, `mathlib:Module.Projective`, `mathlib:Module.Free`.

**Sources.** Kedlaya-Ainf, Theorem 3.8: “Put A := W(R+) and let X (resp. Y) be the complement in Spec A (resp. Spa(A, A)) of the closed subspace where p = [x] = 0. Then pullback along the morphism Y -> X of locally ringed spaces defines an equivalence of categories VecX -> VecY.” Kedlaya-Ainf, Theorem 3.9: “Put A := W(oK), X := Spa(A, A), Y := X minus {v0}. Let ModffA be the category of finite free A-modules. Then the categories ModffA, VecX, VecY are equivalent” SW20-berkeley, Theorem 14.2.1, printed p. 116: “(Kedlaya, [Ked19b, Theorem 3.6]). There is an equivalence of categories between: 1. Finite free Ainf-modules, and 2. Vector bundles on Y.” GR24-prismatic, Proof of Theorem 4.15, p. 43: “By the algebraicity of vector bundles on Y from [Ked20, Thm. 3.8], it suffices to build an F-vector bundle on the adic space Y.”

## RF4:G-torsors — Tannakian transfer

RS-20 narrows this layer: the equivalence of geometric étale torsors, étale sheaf torsors and exact tensor functors is BG0's, and is imported (`BunGAndNewtonStrata:BG0/g-torsors-three-descriptions`, with a request for the scheme-theoretic and `O_E`-integral versions). What remains here is everything specific to gluing.

A *modification between `G`-bundles* `P, P'` at `D` is an isomorphism of tensor functors off `D` that is meromorphic on every representation (Fargues–Scholze III.3). The **Tannakian transfer** glues representation by representation: an exact tensor functor of lattices gives, by the linear theorem and its exactness, an exact tensor functor of bundles, i.e. a `G`-bundle; so `G`-modifications of `P'` are `G`-torsors over `Spec B^+_D(S)` identified with `P'` over `Spec B_D(S)` (Scholze–Weinstein 19.1.2, Caraiani–Scholze 3.5.2). Meromorphy needs testing only on a faithful `V` (and its dual), because `V ⊕ V^∨` is a tensor generator (Deligne–Milne 2.20); the gluing commutes with change of structure group (and detects meromorphy along closed immersions, 2.21), with base change and with addition of legs. The **v-descent and local triviality** theorem keeps its source hypotheses: v-descent of torsors on opens of `S ×̇ Spa O_E` (Scholze–Weinstein 19.5.3), v-descent over `B^+_{Div^d}` (Fargues–Scholze VI.1.7), and étale-local triviality over `B^+_{Div^d_𝒴}`, where triviality modulo `I_S` lifts by Mathlib's `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete` and the étale-local step is Gabber–Ramero 5.4.21. The loop-group quotients `L^+G\LG/L^+G` and `LG/L^+G` that Fargues–Scholze deduce are GS0's. Finally the **modification of a `G`-bundle by a lattice** (Howe–Klevdal 4.3) is the construction the consumers use; for the trivial bundle it is the Beauville–Laszlo map on `S`-points.

**Coverage: `planned`.** Seven nodes. Narrowed by the accepted RS-20: BG0 owns the general equivalence of the three descriptions of G-torsors; this layer defines G-modifications, transfers the linear gluing (with effectivity), proves that meromorphy is tested on a faithful representation and that the gluing commutes with change of structure group, base change and addition of legs, keeps the relative v-descent and etale-local triviality over B^+_{Div^d} with its source hypotheses, and constructs the modification of a G-bundle by a lattice exported to GS0:loop-geometry, BG2:uniformization, HS0 and HS2. The loop-group quotient presentations of the Hecke stack and Grassmannian are GS0's. The previous checkpoint's nodes three-notions-of-G-torsor and three-descriptions-of-G-torsors are withdrawn (owner BG0).

Refinements still open in this layer (none blocks a target):

- The numbering of [GR03, Proposition 5.4.21] in the published Springer LNM 1800 edition was not checked; in arXiv v3 the statement with that number is the henselian approximation theorem Fargues-Scholze need, and the published numbering should be confirmed

### `meromorphic-G-modification` — Modifications of G-bundles at a relative Cartier divisor

*definition*, realises `RelativeFarguesFontaine:RF4:G-torsors`.

**Statement.** Conventions of this layer: E is a nonarchimedean local field with residue field F_q and uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR, B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules. The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). Let X-cal be Y_S or X_S, D the divisor of a map S -> Div^d_(-) and P, P' G-bundles on X-cal. A modification between P and P' at D is an isomorphism beta : P|_{X-cal minus D} = P'|_{X-cal minus D} of exact tensor functors on X-cal minus D such that for every V in Rep_E G the induced isomorphism beta_V : P(V)|_{X-cal minus D} = P'(V)|_{X-cal minus D} is meromorphic along D, i.e. extends to a morphism P(V) -> P'(V)(kD) for k >> 0 (Fargues-Scholze III.3). Applying this to V^dual shows that each beta_V is a modification of vector bundles in the sense of RF4:vector-bundles/modification-of-vector-bundles. Modifications between G-bundles at D form a groupoid, and G-modifications of a fixed P' at D form a groupoid Mod^G_D(P').

**Hypotheses that must be kept.**

- G linear algebraic over E for X-cal = Y_S, X_S (on Y-curly_S with G over O_E the integral statements are formulated over the completed rings, see RF4:G-torsors/tannakian-transfer-of-gluing (ii))
- Meromorphy is required for EVERY representation; by RF4:G-torsors/faithful-representation-criterion it suffices to test one faithful representation and its dual
- beta is an isomorphism of tensor functors, so the beta_V are compatible with tensor products, duals and morphisms of representations

**Proof outline.**

1. Fargues-Scholze define the notion in III.3 for D in Div^1; the definition is the same for D of any degree, the meromorphy being along the Cartier divisor D.
2. Scholze-Weinstein Remark 19.1.3: in the Tannakian language a trivialisation off S^sharp is meromorphic iff it is so for the vector bundles of all algebraic representations.
3. Composition, inverse and pullback are inherited representation by representation from the vector-bundle notion.

**Uses.**

- Fargues-Scholze III.3: Gr_G/phi^Z -> Div^1 is the moduli of D, E in Bun_G(X_S) and a modification between the trivial G-bundle and E at D, giving Gr_G -> Bun_G.
- Fargues-Scholze Definition VI.1.6: the local Hecke stack parametrises pairs of G-bundles over B^+_{Div^d} with an isomorphism over B_{Div^d}, the completed form of a modification.
- Caraiani-Scholze Corollary 3.5.2: the G-bundle E(x) of a point x of the B^+_dR-affine Grassmannian.
- BunGAndNewtonStrata:BG2:uniformization: the Beauville-Laszlo morphism Gr_G -> Bun_G is surjective.
- HeckeStacksAndLocalShtukas:HS0: both projections of the Hecke correspondence are G-bundles related by a modification at the legs.

**API.**

| name | role | statement |
| --- | --- | --- |
| `GModification` | data | A modification between G-bundles P and P' at D: an isomorphism of exact tensor functors off D, meromorphic on every representation. |
| `GModification.toModification` | projection | For V in Rep_E G, beta_V is a modification of P'(V) at D (RF4:vector-bundles/modification-of-vector-bundles), natural in V and compatible with tensor products and duals. |
| `GModification.ofGL` | equivalence | For G = GL_n, G-modifications are the modifications of the rank-n vector bundles P(std). |
| `GModification.refl` | constructor | The identity of P is a modification between P and P. |
| `GModification.symm` | constructor | The inverse of a modification is a modification. |
| `GModification.trans` | constructor | The composite of modifications at D is a modification at D. |
| `GModification.pushforward` | functoriality | For rho : G -> H, rho_* beta (precomposition with Res : Rep H -> Rep G) is a modification between rho_* P and rho_* P'. |
| `GModification.pullback` | functoriality | Pullback along T -> S of affinoid perfectoid spaces, with map_id and map_comp. |
| `GModification.ext` | extensionality | Two modifications between P and P' are equal iff they agree on one faithful representation (equivalently off D on all representations). |

**Unit tests.**

- `GModification.gl_eq_modification` (compatibility): For G = GL_n, the map beta |-> beta_std is a bijection from modifications between P and P' at D to modifications of the vector bundles P(std), P'(std) at D.
- `GModification.gm_geometric_point` (computation): For G = G_m, S = Spa(C^flat) and D = infinity, the modifications of the trivial G_m-bundle at D are the line bundles O(-k), k in Z, with the lattice xi^k B^+_dR (xi a uniformiser of B^+_dR).
- `GModification.identity_degenerate` (degenerate): For d = 0 (D empty) a modification between P and P' is an isomorphism of G-bundles P = P'.
- `GModification.not_iso_extension` (non-example): Meromorphy is not extension to an isomorphism over D: for G = G_m the inclusion O(-D) -> O is a modification between O(-D) and O at D, although it does not extend to an isomorphism of G_m-bundles on X-cal.

**Acceptance.**

- For G = GL_n with the standard representation the notion is RF4:vector-bundles/modification-of-vector-bundles
- For G = G_m and S a geometric point, the modifications of the trivial bundle at infinity are the O(-k), k in Z
- Meromorphy is preserved under pushforward along homomorphisms G -> H

**Dependencies.** 
Within this part: `modification-of-vector-bundles`.
Other roadmaps: `BunGAndNewtonStrata:BG0/g-torsors-three-descriptions`.
Libraries: `tauceti:TauCeti.AffineGroupSchemeCat`, `mathlib:CategoryTheory.Functor.Monoidal`.

**Sources.** FS-geometrization, III.3, printed p. 97: “If E, E' in BunG(S) and D in Div1(S), a modification between E and E' at D is an isomorphism E|_{XS minus D} -> E'|_{XS minus D} that is meromorphic along D. The latter means that for any representation in RepE(G), the associated isomorphism ... extends to a morphism F -> F'(kD) for k >> 0” SW20-berkeley, Remark 19.1.3, printed p. 170: “In this language, a trivialization of E|... is meromorphic along S-sharp if and only if this holds true for the corresponding vector bundles associated to all algebraic representations of G.” HK-admissible, Section 4.3, p. 29: “We recall, from the Tannakian perspective, the notion of modifications of G-bundles as in [17, III.3].”

Suggested home: `TauCeti/AdicSpace/FarguesFontaine/GModification`, namespace `TauCeti.FarguesFontaine.GModification`.

### `tannakian-transfer-of-gluing` — Beauville-Laszlo gluing for G-bundles (Tannakian transfer)

*theorem*, realises `RelativeFarguesFontaine:RF4:G-torsors`, `RelativeFarguesFontaine:RF4`. **Planet: Beauville–Laszlo gluing for G-bundles.**

**Statement.** Conventions of this layer: E is a nonarchimedean local field with residue field F_q and uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR, B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules. The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). (i) Let G be a linear algebraic group over E, X-cal = Y_S or X_S, D the affinoid divisor of S -> Div^d_(-), and P' a G-bundle on X-cal with completion P'-hat_D (the exact tensor functor V |-> P'(V)-hat_D to finite projective B^+_D(S)-modules). Then P |-> P-hat_D gives an equivalence between the groupoid of pairs (P, beta), beta a modification between P and P' at D (RF4:G-torsors/meromorphic-G-modification), and the groupoid of pairs (Q, alpha) with Q a G-torsor on Spec B^+_D(S) and alpha : Q|_{Spec B_D(S)} = P'-hat_D|_{Spec B_D(S)}. In particular every such (Q, alpha) is effective. For d = 1, S over Spd E with untilt S^sharp and P' trivial: G-torsors on Spec B^+_dR(R^sharp) with a trivialisation over B_dR(R^sharp) correspond to G-bundles on X_S with a modification of the trivial G-bundle at S^sharp (Fargues-Scholze III.3, Scholze-Weinstein Proposition 19.1.2). (ii) For G smooth affine over O_E and X-cal = Y-curly_S (or an open subset of S x Spa O_E as in Scholze-Weinstein 19.1.2) the same holds, with the O_E-integral Tannakian description of torsors.

**Hypotheses that must be kept.**

- The tensor functors are exact; exactness of the glued functor is what the exactness half of RF4:vector-bundles/gluing-exactness-tensor-and-base-change provides
- Torsors on the affine schemes Spec B^+_D(S), Spec B_D(S) are taken in the Tannakian sense, via the scheme-theoretic three-descriptions theorem (Scholze-Weinstein 19.5.1, Broshi), requested from BG0
- D affinoid, which holds locally on S; the statement globalises by the base-change compatibility
- (ii) uses the O_E-version of BG0's comparison; Fargues-Scholze note that the reference is for Z_p and 'extends verbatim to O_E'

**Proof outline.**

1. For each V in Rep_E G apply RF4:vector-bundles/meromorphic-modification-at-a-divisor to E' = P'(V) and the lattice Q(V) in P'(V)-hat_D[1/I_D] given by alpha: this gives a vector bundle P(V) with a modification beta_V.
2. Functoriality in V and compatibility with tensor products, duals and exact sequences (RF4:vector-bundles/gluing-exactness-tensor-and-base-change) make V |-> P(V) an exact tensor functor, i.e. a G-bundle (BunGAndNewtonStrata:BG0/g-torsors-three-descriptions), and beta a modification between G-bundles.
3. Full faithfulness from full faithfulness of the linear gluing representation by representation.
4. Scholze-Weinstein, proof of 19.1.2: 'the identification with G-torsors over this locus follows from the Tannakian formalism and the Beauville-Laszlo lemma'; Caraiani-Scholze 3.5.2: 'If G = GL_n, this follows from the discussion above. In general, it follows from the Tannakian formalism.'

**Acceptance.**

- For G = GL_n recover RF4:vector-bundles/meromorphic-modification-at-a-divisor
- For P' trivial and d = 1, (Q, alpha) is a point of LG/L^+G before sheafification; its image is the Beauville-Laszlo map on S-points
- The construction is independent of the faithful representation used to bound the modification (RF4:G-torsors/faithful-representation-criterion)

**Dependencies.** 
Within this part: `meromorphic-G-modification`, `meromorphic-modification-at-a-divisor`, `gluing-exactness-tensor-and-base-change`.
Earlier layers of this roadmap: `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`, `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`.
Other roadmaps: `BunGAndNewtonStrata:BG0/g-torsors-three-descriptions`, `BunGAndNewtonStrata:BG0`.
Libraries: `tauceti:TauCeti.AffineGroupSchemeCat`, `mathlib:CategoryTheory.Functor.Monoidal`, `mathlib:CategoryTheory.Equivalence`.

**Sources.** SW20-berkeley, Proposition 19.1.2, printed p. 170: “it is also equivalent to the functor taking any S in Perf with untilt S-sharp over Spa C to the set of G-torsors E_U on S x Spa Zp x_{Spa C-flat x Spa Zp} U together with a trivialization of E|... that is meromorphic along S-sharp” FS-geometrization, III.3, printed pp. 97-98: “Beauville-Laszlo gluing then identifies Gr_G/phi^Z -> Div1 with the moduli of D in Div1(S), E in BunG(XS), and a modification between the trivial G-bundle and E at D, cf. [SW20, Proposition 19.1.2].” CS17-generic, Corollary 3.5.2 and proof: “For any perfectoid affinoid Qp-algebra (R, R+), there is a natural map E : Gr^BdR+_G(R, R+) -> {G-bundles over X(R-flat, R-flat+)}. Proof. If G = GLn, this follows from the discussion above. In general, it follows from the Tannakian formalism.”

### `faithful-representation-criterion` — Meromorphy can be tested on one faithful representation

*theorem*, realises `RelativeFarguesFontaine:RF4:G-torsors`.

**Statement.** Conventions of this layer: E is a nonarchimedean local field with residue field F_q and uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR, B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules. The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). Let G be a linear algebraic group over E and V in Rep_E G faithful. (a) An isomorphism beta : P|_{X-cal minus D} = P'|_{X-cal minus D} of G-bundles is a modification at D iff beta_V is a modification of the vector bundles P(V), P'(V) at D (both beta_V and beta_V^(-1) meromorphic). (b) Consequently the G-gluing of RF4:G-torsors/tannakian-transfer-of-gluing and its bounds may be computed with any faithful representation: if beta_V is bounded by k then for every tensor construction W = V^(x a) (x) (V^dual)^(x b) and every subquotient of a direct sum of such, beta_W is bounded by (a + b) k.

**Hypotheses that must be kept.**

- V faithful: G -> GL(V) a closed immersion (Tau Ceti's TauCeti.Comodule.IsFaithful); a non-faithful V does not suffice
- Both directions of meromorphy are needed for V; equivalently one direction for V and for V^dual
- The subquotient step uses that P and P' are EXACT tensor functors, so subrepresentations go to local direct summands

**Proof outline.**

1. Deligne-Milne Proposition 2.20(b): for G algebraic with faithful V, V (+) V^dual is a tensor generator of Rep_E G, i.e. every W is a subquotient of P(V, V^dual) for a polynomial P with natural coefficients. The general faithful-representation independence is BG0's ('faithful-representation independence'); this node adds the meromorphy statement.
2. Meromorphy with bound k is preserved by tensor products (bounds add), duals, and direct sums (RF4:vector-bundles/modification-of-vector-bundles API).
3. Subobjects: if W in W' then P(W) in P(W') and P'(W) in P'(W') are local direct summands; the extension P(W') -> P'(W')(kD) maps P(W) into P'(W)(kD) because it does so off D and P'(W)(kD) is saturated in P'(W')(kD) (sections are determined off D since I_D is invertible). Quotients similarly.
4. Hence meromorphy on V and V^dual gives meromorphy on every W, which is the definition of a G-modification (Fargues-Scholze III.3).

**Acceptance.**

- For G = GL_n and V the standard representation, (a) is the definition
- For a torus T with faithful character lattice generators, meromorphy on finitely many characters suffices
- A non-faithful V (e.g. the trivial representation) does not detect meromorphy

**Dependencies.** 
Within this part: `meromorphic-G-modification`, `modification-of-vector-bundles`, `gluing-exactness-tensor-and-base-change`.
Other roadmaps: `BunGAndNewtonStrata:BG0`.
Libraries: `tauceti:TauCeti.Comodule.IsFaithful`, `tauceti:TauCeti.Comodule.isFaithful_iff_isClosedImmersion_coordinateGroupSchemeHom`.

**Sources.** DM82-tannakian, Proposition 2.20(b) and its proof: “(b) G is algebraic if and only if Rep_k(G) has a tensor generator X. ... If G is algebraic, then it has a finite-dimensional faithful representation X (see 2.5), and one shows ... that X (+) X^dual is a tensor generator for Rep_k(G).” DM82-tannakian, Footnote 11 to Proposition 2.20: “An object X of Rep_k(G) is a tensor generator if every object of Rep_k(G) is isomorphic to a subquotient of P(X, X^dual) for some P in N[t, s].” FS-geometrization, III.3, printed p. 97: “The latter means that for any representation in RepE(G), the associated isomorphism between vector bundles, F|_{XS minus D} -> F'|_{XS minus D} extends to a morphism F -> F'(kD) for k >> 0 via F' -> F'(kD).”

### `change-of-structure-group` — Gluing commutes with change of structure group

*theorem*, realises `RelativeFarguesFontaine:RF4:G-torsors`.

**Statement.** Conventions of this layer: E is a nonarchimedean local field with residue field F_q and uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR, B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules. The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). Let rho : G -> H be a homomorphism of linear algebraic groups over E (resp. of smooth affine group schemes over O_E). (a) Pushforward rho_* (precomposition with the restriction functor Res_rho : Rep H -> Rep G) carries G-modifications at D to H-modifications at D, and commutes with the gluing of RF4:G-torsors/tannakian-transfer-of-gluing: rho_*(glue(Q, alpha)) = glue(rho_* Q, rho_* alpha), compatibly with composition (rho' rho)_* = rho'_* rho_*. (b) If rho is a closed immersion, an isomorphism of G-bundles off D is meromorphic along D iff its pushforward to H is.

**Hypotheses that must be kept.**

- (a) needs no hypothesis on rho; (b) needs rho a closed immersion (equivalently every G-representation is a subquotient of restrictions of H-representations)
- Extension of structure group of torsors itself is BG0's; this node is its compatibility with gluing and meromorphy

**Proof outline.**

1. (a) For W in Rep H, (rho_* P)(W) = P(Res W); the gluing of RF4:G-torsors/tannakian-transfer-of-gluing is computed representation by representation, so it commutes with precomposition by Res.
2. (b) Deligne-Milne Proposition 2.21(b): rho is a closed immersion iff every object of Rep G is a subquotient of an object Res(W'); meromorphy passes to subquotients as in RF4:G-torsors/faithful-representation-criterion. Equivalently, the restriction of a faithful H-representation is a faithful G-representation.
3. For reductive groups this is the linear-algebra input to Scholze-Weinstein Lemma 19.1.5 (Gr_G -> Gr_H is a closed embedding for a closed embedding G -> H), whose Grassmannian statement is GeometricSatakeAndFusion's.

**Acceptance.**

- G = GL_n -> GL_n x GL_m, g |-> (g, det g): the pushforward of a modification of rank-n bundles is the pair (modification, its determinant)
- For a closed immersion rho the restriction of a faithful H-representation is a faithful G-representation, so (b) also follows from RF4:G-torsors/faithful-representation-criterion

**Dependencies.** 
Within this part: `tannakian-transfer-of-gluing`, `faithful-representation-criterion`, `meromorphic-G-modification`.
Other roadmaps: `BunGAndNewtonStrata:BG0`.
Libraries: `tauceti:TauCeti.Comodule.IsFaithful`.

**Sources.** DM82-tannakian, Proposition 2.21(b): “(b) f is a closed immersion if and only if every object of Rep_k(G) is isomorphic to a subquotient of an object of the form omega^f(X'), X' in ob(Rep_k(G')).” SW20-berkeley, Lemma 19.1.5, printed p. 171: “Let rho : G -> H be a closed embedding of reductive groups over C. Then the induced map GrG -> GrH is a closed embedding.”

### `base-change-and-divisor-compatibility` — G-gluing commutes with base change and with addition of legs

*theorem*, realises `RelativeFarguesFontaine:RF4:G-torsors`.

**Statement.** Conventions of this layer: E is a nonarchimedean local field with residue field F_q and uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR, B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules. The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). (a) For a map f : T -> S of affinoid perfectoid spaces over F_q and D the divisor of S -> Div^d_(-), the G-gluing of RF4:G-torsors/tannakian-transfer-of-gluing commutes with pullback: f^* glue(Q, alpha) = glue(Q (x)_{B^+_D(S)} B^+_{D_T}(T), alpha_T), compatibly with composition of base changes. (b) For D = D_1 + D_2 with D_1, D_2 disjoint, G-torsors on Spec B^+_D(S) with an isomorphism over B_D(S) are pairs of such data at D_1 and D_2, and the gluing at D is the iterated gluing at D_1 and D_2; for colliding legs D = m D_1 the data at D and at D_1 coincide. (c) Consequently the assignment S |-> {(P, beta)} is compatible with the addition maps Div^{d_1} x Div^{d_2} -> Div^{d_1 + d_2}.

**Hypotheses that must be kept.**

- Base change uses that B^+_{Div^d} and B_{Div^d} are v-sheaves over Div^d (RF2:integral-divisors/completed-rings-B-plus-and-B)
- Disjointness is of the closed subspaces D_1, D_2; the product decomposition of the completed rings is RF4:vector-bundles/disjoint-and-colliding-legs

**Proof outline.**

1. (a) Apply RF4:vector-bundles/gluing-exactness-tensor-and-base-change (c) representation by representation.
2. (b) A G-torsor on Spec(B_1 x B_2) is a pair of torsors; combine with RF4:vector-bundles/disjoint-and-colliding-legs (a), (b) representation by representation.
3. (c) The divisor of a sum of legs is the sum of the divisors (FS VI.1.2, product equation), so (b) applies on the locus where the legs are disjoint and the colliding case on the diagonal.

**Acceptance.**

- Pullback to geometric points recovers the fibrewise Beauville-Laszlo modifications of Fargues-Scholze III.3
- On the diagonal of Div^1 x Div^1 the two legs collide and the datum is a single modification at the common leg

**Dependencies.** 
Within this part: `tannakian-transfer-of-gluing`, `gluing-exactness-tensor-and-base-change`, `disjoint-and-colliding-legs`.
Earlier layers of this roadmap: `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`, `RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf`, `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`.

**Sources.** FS-geometrization, VI.1, before Definition VI.1.5, printed p. 192: “This defines v-sheaves B+_{Div^d} contained in B_{Div^d} over Div^d_(-) in all three cases.” FS-geometrization, Definition VI.1.6, printed p. 193: “The local Hecke stack Hck_{G,Div^d_Y} ... is the functor sending an affinoid perfectoid S -> Div^d_Y ... to the groupoid of pairs of G-bundles E1, E2 over B+_{Div^d_Y}(S) ... together with an isomorphism E1 = E2 over B_{Div^d_Y}(S).”

### `v-descent-and-local-triviality` — v-descent of G-torsors and etale-local triviality over the completed divisor rings

*theorem*, realises `RelativeFarguesFontaine:RF4:G-torsors`, `RelativeFarguesFontaine:RF4`. **Planet: v-descent and étale-local triviality.**

**Statement.** Conventions of this layer: E is a nonarchimedean local field with residue field F_q and uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR, B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules. The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). (a) For S in Perf over F_q, U an open subset of S x Spa O_E (for example of Y-curly_S) and G smooth affine over O_E, the functor S' |-> {G-torsors on U x_{S x Spa O_E} (S' x Spa O_E)} is a v-stack on Perf_S (Scholze-Weinstein Proposition 19.5.3; Fargues-Scholze's footnote extends it from Z_p to O_E). (b) For S -> Div^d_(-) with D_S affinoid, vector bundles and G-bundles over B^+_{Div^d}(S) (G reductive over O_E, resp. over E) satisfy v-descent in S, and so do isomorphisms between two of them over B_{Div^d}(S). (c) Every G-bundle over B^+_{Div^d_{Y-curly}}(S), G smooth affine over O_E (in particular reductive), is trivial etale-locally on S. The quotient presentations Hck = L^+G \ LG / L^+G and Gr = LG / L^+G that Fargues-Scholze deduce from (b) and (c) are GeometricSatakeAndFusion:GS0:loop-geometry's and are not planned here.

**Hypotheses that must be kept.**

- G smooth affine for (a) and (c); reductive in Fargues-Scholze's statement of (b)
- (a) uses sousperfectoidness: U x_{Spa Z_p} Spa Z_p[p^(1/p^oo)]^ is perfectoid and U -> it splits as topological modules
- (c) is etale-local on S, not merely v-local; the presentation of Hck is one of ETALE stacks
- The affineness of the target scheme is what makes loop spaces v-sheaves (FS before Definition VI.1.6)

**Proof outline.**

1. (a) Scholze-Weinstein, proof of 19.5.3: by the Tannakian description reduce to GL_n; base change to the perfectoid U' = U x_{Spa Z_p} Spa Z_p[p^(1/p^oo)]^; vector bundles on perfectoid spaces satisfy v-descent (SW Proposition 17.1.8, requested from DiamondsAndVStacks D2); descend back along A -> A' split as topological A-modules (finite projectivity descends, Stacks 08XD).
2. (b) Fargues-Scholze, proof of VI.1.7: vector bundles over B^+_{Div^d} satisfy v-descent, checked modulo powers of I_S where it is Proposition VI.1.4 (RF2:integral-divisors/v-descent-of-bundles-on-the-divisor); by the Tannakian formalism so do G-bundles; an isomorphism over B_{Div^d}(S) is a section of an affine scheme, which again satisfies v-descent.
3. (c) At a geometric point B^+_{Div^d_{Y-curly}}(S) is a finite product of complete discrete valuation rings with algebraically closed residue field, so torsors under smooth G are trivial. In general, triviality modulo I_S implies triviality: the torsor's coordinate ring is smooth over B^+ and B^+ is I_S-adically complete, so a section modulo I_S lifts (Mathlib Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete).
4. (c) Triviality modulo I_S holds etale-locally on S by Gabber-Ramero Proposition 5.4.21 (in arXiv v3: for (R, tI) henselian and X smooth quasi-projective over R[1/t], X(R[1/t]) is dense in X(R^[1/t])), applied to the torsor over the henselian pair; for d = 1 Scholze-Weinstein give an alternative: the reduction to Spec R^sharp is etale-locally trivial and trivialisations lift along B^+_dR/xi^n because H^1_et(S^sharp, O) = 0.

**Acceptance.**

- The presentation obtained by trivialising etale-locally is one of etale stacks, not merely v-stacks
- At a geometric point check triviality directly from the product-of-complete-DVRs description
- Without affineness of Z, L^+Z and LZ need not be v-sheaves; the Tannakian reduction to GL_n is where affineness enters

**Dependencies.** 
Earlier layers of this roadmap: `RelativeFarguesFontaine:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor`, `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`, `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`.
Other roadmaps: `BunGAndNewtonStrata:BG0/g-torsors-three-descriptions`, `BunGAndNewtonStrata:BG0`, `VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology`, `DiamondsAndVStacks:D2/v-descent-of-functions`, `DiamondsAndVStacks:D2/higher-v-acyclicity`, `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`, `AdicSpacesPartII:R5/sousperfectoid-adic-space`, `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`.
Libraries: `mathlib:Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`, `mathlib:Algebra.Smooth`, `mathlib:HenselianRing`, `mathlib:IsDiscreteValuationRing`, `mathlib:IsAdicComplete`, `mathlib:Module.Projective`, `tauceti:TauCeti.ReductiveAffineGroupSchemeCat`.

**Sources.** SW20-berkeley, Proposition 19.5.3 and proof, printed pp. 180-181: “Let S in Perf be a perfectoid space of characteristic p and let U in S x Spa Zp be an open subset. The functor on PerfS sending any S' -> S to the groupoid of G-torsors on U x_{S x Spa Zp} S' x Spa Zp is a v-stack.” FS-geometrization, Proof of Proposition VI.1.7, printed p. 193: “The category of vector bundles over B+_{Div^d} ... satisfies v-descent: It is enough to check this modulo powers of the ideal IS, where the result is Proposition VI.1.4. By the Tannakian formalism, it follows that the category of G-bundles also satisfies v-descent” FS-geometrization, Proof of Proposition VI.1.7, printed p. 193: “Any G-bundle over B+_{Div^d_Y}(S) is etale locally on S trivial. Indeed, if S is a geometric point then B+_{Div^d_Y}(S) is a product of complete discrete valuation rings with algebraically closed residue field, so that all G-torsors are trivial.” FS-geometrization, Proof of Proposition VI.1.7, printed p. 193: “In general, note that triviality of the G-torsor over B+_{Div^d_Y}(S) is implied by triviality modulo IS (as one can always lift sections over nilpotent thickenings). Then the result follows from [GR03, Proposition 5.4.21].” GR02-almost, Proposition 5.4.21 (arXiv v3): “Let t in R be a non-zero-divisor, I in R an ideal, R^ := lim R/t^n I the (t, I)-adic completion of R ... suppose that the pair (R, tI) is henselian. Let X be a smooth quasi-projective R[t^-1]-scheme ... Then the natural map X(R[t^-1]) -> X(R^[t^-1]) has dense image.” SW20-berkeley, Proof of Proposition 19.1.2, printed p. 170: “Any G-torsor E on Spec B+dR(R-sharp) is locally trivial for the etale topology on Spa(R-sharp, R-sharp+). Indeed, its reduction to Spec R-sharp is etale locally trivial ... as H1et(S-sharp, O_S-sharp) = 0, we see that it is trivial.”

### `modification-of-G-bundle-by-lattice` — The modification of a G-bundle by a B^+_dR-lattice

*construction*, realises `RelativeFarguesFontaine:RF4:G-torsors`, `RelativeFarguesFontaine:RF4`. **Planet: Modification of a G-bundle by a lattice.**

**Statement.** Conventions of this layer: E is a nonarchimedean local field with residue field F_q and uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR, B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules. The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). Let S be a perfectoid space over Spd E (untilt S^sharp over E, D = S^sharp the degree-one divisor of X_S), G a linear algebraic group over E, P a G-bundle on X_S and L a G(B^+_dR)-lattice on the G(B_dR)-torsor P|_{B_dR}: a G-torsor Q on Spec B^+_dR(R^sharp), given etale-locally on S, with alpha : Q|_{B_dR} = P-hat_D|_{B_dR}. The modification P_L of P by L is the G-bundle on X_S glued from (P, Q, alpha) by RF4:G-torsors/tannakian-transfer-of-gluing, with its canonical modification P_L|_{X_S minus D} = P|_{X_S minus D}. It is functorial in (P, L), compatible with pullback in S and with pushforward along homomorphisms of groups. For P trivial it is the map E from G-torsors on Spec B^+_dR trivialised over B_dR to G-bundles on X_S of Caraiani-Scholze Corollary 3.5.2 and Fargues-Scholze III.3; identifying its source with Gr_G(S) is GeometricSatakeAndFusion:GS0:loop-geometry's, and the resulting Beauville-Laszlo morphism Gr_G -> Bun_G is exported to BG2:uniformization, HS0 and HS2.

**Hypotheses that must be kept.**

- The lattice is a G(B^+_dR)-lattice, i.e. a G-torsor over B^+_dR, not merely a B^+_dR-lattice in one representation
- L is given etale-locally on S; the construction descends by RF4:G-torsors/v-descent-and-local-triviality
- Degree one here; several or colliding legs are RF4:G-torsors/base-change-and-divisor-compatibility

**Proof outline.**

1. Howe-Klevdal 4.3: completion along I_infinity is an exact tensor functor Vect(FF_S) -> Loc_{B^+_dR}(S); a lattice L on E|_{B_dR} defines E_L by the Tannakian formalism and Beauville-Laszlo gluing.
2. Glue with RF4:G-torsors/tannakian-transfer-of-gluing etale-locally on S where L is a torsor with alpha, and descend by RF4:G-torsors/v-descent-and-local-triviality (a).
3. Functoriality, base change and pushforward from RF4:G-torsors/base-change-and-divisor-compatibility and RF4:G-torsors/change-of-structure-group.

**Uses.**

- Fargues-Scholze Proposition III.3.1: the Beauville-Laszlo morphism Gr_G -> Bun_G is a surjection of pro-etale stacks (BunGAndNewtonStrata:BG2:uniformization).
- Caraiani-Scholze Corollary 3.5.2 and Proposition 3.5.3: the map b(.) : Gr_G(C, O_C) -> B(G), x |-> b(E(x)), and its compatibility with mu.
- Howe-Klevdal, Section 4.3: modifications E_L interpolating the modifications at geometric points.
- HeckeStacksAndLocalShtukas:HS2: local shtuka moduli parametrise modifications of G-bundles at the legs.
- GeometricSatakeAndFusion:GS0:loop-geometry: the torsor-modification description of the Beilinson-Drinfeld Grassmannian is compared with the loop quotient.

**API.**

| name | role | statement |
| --- | --- | --- |
| `modify` | constructor | The G-bundle P_L on X_S attached to a G-bundle P and a G(B^+_dR)-lattice L on P∣_{B_dR}. |
| `modify.modification` | projection | The canonical modification P_L∣_{X_S minus D} = P∣_{X_S minus D}, meromorphic along D. |
| `modify_tautological` | simp | For the tautological lattice L = P-hat_D, P_L = P with the identity modification. |
| `modify_comp` | relation | For L a lattice on P∣_{B_dR} and L' a lattice on P_L∣_{B_dR} = P∣_{B_dR}, (P_L)_{L'} = P_{L'}. |
| `modify.pullback` | functoriality | For T -> S, (P_L)_T = (P_T)_{L_T}; compatible with composition. |
| `modify.pushforward` | functoriality | For rho : G -> H, rho_*(P_L) = (rho_* P)_{rho_* L}. |
| `modify_gl` | compatibility | For G = GL_n, P_L is the bundle glued by RF4:vector-bundles/meromorphic-modification-at-a-divisor from P(std) and the lattice L(std). |
| `modify.characterisation` | characterisation | P_L is the unique G-bundle with a modification to P at D whose completion at D is L (RF4:G-torsors/tannakian-transfer-of-gluing). |

**Unit tests.**

- `modify_gl_compat` (compatibility): For G = GL_n and P trivial, P_L is the rank-n vector bundle obtained by gluing the B^+_dR-lattice L in B_dR^n to the trivial bundle off D, as in Caraiani-Scholze 3.5.1.
- `modify_gm_degree` (computation): For G = G_m, S = Spa(C^flat), P trivial and L = xi^k B^+_dR, P_L = O(-k), of degree -k.
- `modify_tautological_eq` (degenerate): For the tautological lattice L = P-hat_D the modification P_L is P, with the identity modification.
- `modify_SL2_nonlattice` (non-example): For G = SL_2 and P trivial, the B^+_dR-lattice xi B^+_dR (+) B^+_dR of B_dR^2 has determinant lattice xi B^+_dR, so it is not an SL_2(B^+_dR)-lattice of the trivial SL_2-torsor and does not define an SL_2-modification, although it defines a GL_2-modification.

**Acceptance.**

- For G = GL_n the construction is RF4:vector-bundles/meromorphic-modification-at-a-divisor
- Sign convention: for G = G_m and the lattice xi^k B^+_dR the modified bundle is O(-k), as fixed by O(infinity) = O(1)
- Modifying first by L and then by L' (a lattice in P_L|_{B_dR} = P|_{B_dR}) is modifying by L'

**Dependencies.** 
Within this part: `tannakian-transfer-of-gluing`, `v-descent-and-local-triviality`, `base-change-and-divisor-compatibility`, `change-of-structure-group`, `meromorphic-G-modification`.
Earlier layers of this roadmap: `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`.
Other roadmaps: `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`.

**Sources.** HK-admissible, Section 4.3, p. 29: “Moreover, given a lattice L on this G(BdR)-local system, we may form the modification EL of E by L to obtain a new object in BunG(S): by the Tannakian formalism, we reduce to modifications of vector bundles on FFS by B+dR-lattices” CS17-generic, Corollary 3.5.2: “For any perfectoid affinoid Qp-algebra (R, R+), there is a natural map E : Gr^BdR+_G(R, R+) -> {G-bundles over X(R-flat, R-flat+)}.” FS-geometrization, III.3, printed p. 98: “This defines a morphism of v-stacks GrG -> BunG.”

Suggested home: `TauCeti/AdicSpace/FarguesFontaine/GModification`, namespace `TauCeti.FarguesFontaine.GModification`.

## RF4 — the aggregate

**Coverage: `planned`.** Aggregate of RF4:vector-bundles and RF4:G-torsors (RS-20: keep, not a third patching construction). The nodes that realise it are the linear gluing, its compatibilities and exports, the Tannakian transfer, the v-descent theorem and the lattice modification; every child acceptance test is kept in the child nodes, and the linear applications (AI.2 essential surjectivity) are separated from the G-valued ones. The nodes realising it: `meromorphic-modification-at-a-divisor`, `gluing-exactness-tensor-and-base-change`, `disjoint-and-colliding-legs`, `vector-bundles-as-relative-B-pairs`, `lattices-and-modifications-of-trivial-bundles`, `tannakian-transfer-of-gluing`, `v-descent-and-local-triviality`, `modification-of-G-bundle-by-lattice`.

## Dependencies across roadmaps

Upstream (all acyclic with the atlas stage graph and RS-20's links, checked): RF0:integral-Y, RF1, RF2:integral-divisors, RF2:untilts, RF3 of this roadmap; `AdicSpacesPartII:R3` and `R5` (sheafy and sousperfectoid affinoids, Kiehl gluing, glueing squares); `VectorBundlesAndIsocrystals:VB1` and `VB2:ampleness` (bundles on the curve, GAGA, ampleness); `PerfectoidSpaces:P1` (Witt vectors of perfect plus-rings); `PadicHodgeTheory:R06.1` (`B^+_dR` of perfectoid affinoids, its DVR theorem and the fundamental exact sequence); `DiamondsAndVStacks:D2`, `D4` (v-descent of functions, small v-stacks); `BunGAndNewtonStrata:BG0` (torsors). Downstream: `BunGAndNewtonStrata:BG2:uniformization`, `GeometricSatakeAndFusion:GS0:loop-geometry`, `HeckeStacksAndLocalShtukas:HS0`, `HS2`, and the essential-surjectivity part of `AInfCohomology:AI.2`.

## Requests

- **`BunGAndNewtonStrata:BG0`** (needed by `meromorphic-G-modification`, `tannakian-transfer-of-gluing`, `faithful-representation-criterion`, `change-of-structure-group`, `v-descent-and-local-triviality`): Three statements in the generality RF4 uses, beside the node BunGAndNewtonStrata:BG0/g-torsors-three-descriptions (which covers sousperfectoid spaces over E with G reductive over E): (1) the scheme-theoretic three descriptions (Scholze-Weinstein Theorem 19.5.1, Broshi): for G flat affine over O_E or E, smooth for the etale version, and any affine scheme Spec B over it, G-torsors are exact tensor functors Rep G -> finite projective B-modules; RF4 applies this to B = B^+_{Div^d}(S) and B_{Div^d}(S). (2) The O_E-integral adic version (Scholze-Weinstein Theorem 19.5.2 for smooth affine G over O_E on analytic sousperfectoid spaces over O_E; Fargues-Scholze's footnote to III.1.1 'extends verbatim to O_E'), for Y-curly_S and the opens U of S x Spa O_E. (3) Faithful-representation independence and extension of structure group as BG0's stage text states them: for G linear algebraic over E and V faithful, V (+) V^dual is a tensor generator of Rep_E G (Deligne-Milne 2.20(b)), and a homomorphism is a closed immersion iff every G-representation is a subquotient of a restriction (2.21(b)). Also: the node BG0/g-torsors-three-descriptions lists RelativeFarguesFontaine:RF4:G-torsors and RF4:vector-bundles among its prerequisites; RS-20 makes BG0 the supplier of RF4:G-torsors and forbids RF4 -> BG0, so those two prerequisites should be dropped in BG0's next revision.
- **`DiamondsAndVStacks:D2`** (needed by `v-descent-and-local-triviality`): v-descent of vector bundles on perfectoid spaces: S' |-> Vect(S') is a v-stack on Perf (Scholze-Weinstein Proposition 17.1.8; Kedlaya-Liu Theorem 3.5.8 for the analytic topology). D2 plans v-descent of functions and higher v-acyclicity (DiamondsAndVStacks:D2/v-descent-of-functions, D2/higher-v-acyclicity), from which this follows by Scholze-Weinstein's successive-approximation argument, but no node states it. Used in the proof of Scholze-Weinstein 19.5.3 after base change to the perfectoid U x Spa Z_p[p^(1/p^oo)]^.

## Gaps

### The crystalline end of Spa W(R^+) has no owning layer yet

Kedlaya's algebraicity theorem is stated on Spa W(R^+) minus V(p, [x]), whose rational charts Spa(B_1) = {|[x]| <= |p| != 0} and Spa(B_2') meet the locus [x] = 0. RF0:integral-Y removes V([varpi]) and RF0:annuli removes V(pi), so neither constructs these charts or proves their stable uniformity (Kedlaya Proposition 3.6). The confirmed finding RT-AREA-padic-1/18 proposes a new child RelativeFarguesFontaine:RF0:crystalline-end for them (handed to BP-RelativeFarguesFontaine--RF0); it is not yet an atlas stage, so no prerequisite can name it. Until it exists, the chart construction and the sousperfectoid stable-uniformity argument are carried in the proof steps of RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles, resting on AdicSpacesPartII:R5/sousperfectoid-stably-uniform and RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness. NEXT ACTION: once RF0:crystalline-end exists, make it a prerequisite of that node and add the stage edge RF0:crystalline-end -> RF4:vector-bundles (acyclic: RF0:crystalline-end requires only RF0:integral-Y and RF0:annuli).

## Structural notes

- **rescope** (RelativeFarguesFontaine, AInfCohomology). RT-AREA-padic-1/19 (confirmed): the stage edge RF4:vector-bundles -> AInfCohomology:AI.2 serves only the essential surjectivity of Fargues' theorem. Breuil-Kisin-Fargues full faithfulness uses no curve input (BMS1 Remark 4.29, read in this job). In this packet the exports to AI.2 are RF4:vector-bundles/lattices-and-modifications-of-trivial-bundles (Scholze-Weinstein 12.4.6, 14.1.1 (2)<=>(3)) and RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles (Scholze-Weinstein 14.2.1); both are essential-surjectivity inputs. *Proposal:* Apply the fix the RT-AREA-padic-1 fix report gives for /19: split AI.2 into AI.2 (BKF category and full faithfulness, no curve input) and a new stage AInfCohomology:AI.2:essential-surjectivity, and retarget the link RF4:vector-bundles -> AI.2 to RF4:vector-bundles -> AI.2:essential-surjectivity, with the reason 'linear Beauville-Laszlo gluing between pairs (T, Xi) and shtukas with one leg, and Kedlaya's algebraicity, in the essential surjectivity of Fargues' theorem'. RS-20's link and its RF4:vector-bundles reason ('linear supplier to AI.2') change accordingly.
- **rescope** (RelativeFarguesFontaine). RT-AREA-padic-1/18 (confirmed) proposes a child RF0:crystalline-end owning the charts of Spa W_{O_E}(R^+) at [varpi] = 0, the pi-adic sheafiness of W_{O_E}(R^+)[1/pi], and Kedlaya's algebraicity, and its fix report would leave to RF4 'the phi-module freeness parts' of Guo-Reinecke item 129. The stage does not exist yet, and the accepted Guo-Reinecke route 6 names RF4:vector-bundles; this packet plans Kedlaya's algebraicity here as a patching theorem (its proof is gluing of finite projective modules over exact squares and Beauville-Laszlo squares, Kedlaya section 3 'Adic glueing'), and records the missing charts as a gap. *Proposal:* When RF0:crystalline-end is created, it owns the charts Y_{S,[r,oo]}, their rings and their sheafiness; RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles stays the single owner of the algebraicity theorem and imports the charts (edge RF0:crystalline-end -> RF4:vector-bundles), unless the maintainer prefers to move the node into RF0:crystalline-end, in which case AI.2:essential-surjectivity imports it from there; it must not be planned twice. The phi-module freeness statements of item 129 (Ivanov Theorem 6.1; Kedlaya-Liu Proposition 3.2.13 and Lemma 3.2.6, extraction items PAPER-KEDLAYA-LIU-15/124 and /129, both 'missing') are about Frobenius modules over perfect rings, not patching, and should be routed to the owner of Kedlaya-Liu section 3.2 or to the Guo-Reinecke Part II roadmap that uses them.
- **rescope** (RelativeFarguesFontaine, AdicSpacesPartII). Overlap note: AdicSpacesPartII:R3/glueing-square, R3/glueing-square-finite-surjectivity and R3/glueing-square-finite-projective-descent plan the topological case (complete Tate rings, strictness and density) of Kedlaya-Liu's glueing formalism; this packet plans the algebraic exact squares of Kedlaya-Liu 1.3.7-1.3.10, which the Kedlaya-Liu extraction routed to RF4:vector-bundles and which the Beauville-Laszlo square, the Zariski square and the B-pair square need (none of them is a square of complete Tate rings). The node RF4:vector-bundles/glueing-datum-over-exact-square carries the compatibility ExactSquare.ofGlueingSquare. *Proposal:* Keep the algebraic formalism here as its single owner and the topological glueing squares in AdicSpacesPartII:R3 as the special case the API compares with. If the maintainer prefers the most foundational owner (PROTOCOL section 15), move the three algebraic nodes into AdicSpacesPartII:R3 and let RF4:vector-bundles import them; AdicSpacesPartII is upstream of RF4, so the move creates no cycle.

## Mistakes in the sources

No new mistake was found in the passages read. Two known ones bear on this part and are recorded elsewhere: Kedlaya–Liu's slope of `L_X` (PAPER-KEDLAYA-LIU-15/E78; the corrected slope `1/a` does not affect ampleness, which is all Lemma 8.9.3 uses) and their Conjecture 8.8.20(b), which fails for sections with repeated zeros (PAPER-KEDLAYA-LIU-15/E79). Conjecture 8.8.20 is recorded with this layer's sources as a conjecture, not a target: its part (a) for the untilt section is Lemma 8.9.3(a), planned here. Scholze–Weinstein cite Kedlaya's algebraicity as \[Ked19b, Theorem 3.6\], which is Theorem 3.9 in arXiv v5; the published numbering was not checked, so this is not recorded as a mistake.

## Acceptance for the part

- At a geometric point, the gluing recovers the classical description of rank-`n` bundles with a trivialisation off `∞` by `B^+_dR`-lattices, and the double coset `GL_n(B_e)\GL_n(B_dR)/GL_n(B^+_dR)` (Fargues–Fontaine 5.3.2).
- For `G = GL_n` every `G`-statement reduces to the linear one; for `G = G_m` the sign `ξ^k B^+_dR ↦ O(−k)` holds.
- The Beauville–Laszlo theorem is proved for a non-noetherian ring without flatness of the completion, and the finite projectivity criterion is part of it.
- Nothing in this part constructs `Gr_G`, `L^+G`, `LG`, `Bun_G` or the three descriptions of torsors; each is imported or exported to its owner.

