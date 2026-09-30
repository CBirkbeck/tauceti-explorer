# PAPER-SCHOLZE-12: Perfectoid spaces

Peter Scholze, *Perfectoid spaces*, [Publications mathématiques de l'IHÉS 116 (2012), 245–313](https://doi.org/10.1007/s10240-012-0042-x); arXiv [1111.4914](https://arxiv.org/abs/1111.4914).

Extraction by Claude Code, session `cc-39fac3`, 29 September 2026 (issue #4544). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-SCHOLZE-12.result.json](PAPER-SCHOLZE-12.result.json). It has:
- 154 items: 13 library, 112 planned, 29 missing (after the independent review and the fix of its red team; the extraction had 153 items, 106 planned and 34 missing);
- 7 routes: five sources of existing layers and two Part IIs, each a continuation beside a parent's existing Part II;
- 15 prerequisite entries;
- 11 recorded mistakes (8 misprints, 3 gaps), four of them already in the atlas; the review confirmed 9 and rejected E5 and E9.

## Sources read

- **The published version**, read in full: the open-access PDF on Centre Mersenne, 69 pages. All locators are its printed pages 245–313.
- **arXiv v1** (21 November 2011, the only arXiv version), with its TeX source for checking formulas. The copy on the author's page is the same text.
- **Differences.** A word-level comparison shows that the published version adds several things to v1:
  - Remark 1.11, on Faltings's almost purity theorem. The later statements of §1 are renumbered: v1's 1.11–1.15 are published 1.12–1.16.
  - A sentence in Definition 2.6 and a paragraph on general plus rings.
  - A proof sketch for Theorem 2.22.
  - Details in the proofs of Lemma 5.21 and Propositions 6.14 and 7.16.
  - The reduction to G_K at the start of the proof of Theorem 9.6.
  - Lemma 9.8, on cup products. v1's Lemma 9.8 is therefore published Lemma 9.9.
- **Errata.** None found. The journal page lists no erratum; the author's page lists one only for *p-adic Hodge theory for rigid-analytic varieties*.

## What the paper proves

**Perfectoid algebras and tilting (§§3–5).**
- A perfectoid field is complete, of residue characteristic p, with a nondiscrete rank-one valuation and Frobenius surjective on K°/p.
- Its tilt K♭ = lim_{x↦x^p} K is perfectoid of characteristic p, with a multiplicative map x ↦ x♯ to K.
- For perfectoid K-algebras (Banach, R° open and bounded, Frobenius surjective on R°/ϖ) the **tilting equivalence** K-Perf ≅ K♭-Perf passes through almost mathematics. The chain is K-Perf ≅ K°a-Perf ≅ (K°a/ϖ)-Perf = (K♭°a/ϖ♭)-Perf, and the lifting step uses vanishing of the almost cotangent complex of a perfectoid K°a/ϖ-algebra (Theorem 5.10).
- Finite extensions of a perfectoid field are perfectoid, and tilting is a degree-preserving equivalence between them (Theorem 3.7). This recovers Fontaine–Wintenberger.

**Perfectoid spaces (§6).** For a perfectoid affinoid (R, R⁺), Spa(R, R⁺) ≅ Spa(R♭, R♭⁺), identifying rational subsets (Theorem 6.3).
- The key step is an explicit **approximation lemma**: every f is approximated by some g♯ away from its small values (Lemma 6.5).
- Rational localisations are perfectoid, with the expected tilts.
- 𝒪_X is a sheaf and H^i(X, 𝒪⁺) is almost zero. The proof reduces to Tate's acyclicity for p-finite algebras in characteristic p.
- Perfectoid spaces glue, tilt and have fibre products.

**Étale topology (§7).**
- The almost purity theorem: finite étale covers of a perfectoid algebra are perfectoid with almost finite étale integral closure (Theorem 7.9).
- X_ét ≅ X♭_ét (Theorem 7.12).
- Almost acyclicity of 𝒪° on X_ét.
- Huber-style comparison of étale topoi for tilde-limits X ∼ lim X_i (Theorem 7.17).

**Toric varieties (§8).**
- The perfectoid toric space X^perf_Σ tilts to itself and is ∼ lim_φ X^ad_Σ. Hence |X^ad_{Σ,K♭}| and its étale topos are inverse limits along the p-power map (Theorem 8.5), and π induces isomorphisms on torsion cohomology for proper smooth X_Σ (Proposition 8.6).
- A graded version of the approximation lemma approximates a hypersurface, and then a set-theoretic complete intersection, by a tilted subvariety inside the preimage of any small neighbourhood (Proposition 8.7, Corollary 8.8).

**The weight-monodromy conjecture (§9).** Deligne's conjecture holds for geometrically connected proper smooth varieties over a p-adic field that are set-theoretic complete intersections in projective smooth toric varieties (Theorem 9.6). The proof:
1. Base change to K, the completion of k(ϖ^{1/p^∞}).
2. Identify G_K with the Galois group of 𝔽_q((t)).
3. Use Huber's theorem that a small neighbourhood Ỹ has the cohomology of Y.
4. Approximate Y by a tilted Z, and take an alteration Z′.
5. Build a G-equivariant map H^i(Y) → H^i(Z′), compatible with cup products and an isomorphism in top degree.
6. Poincaré duality makes H^i(Y) a direct summand of H^i(Z′), and Deligne's equal-characteristic theorem applies to Z′.

## What the atlas already has

**PerfectoidSpaces is built on this paper.** Its reviewed decomposition (`data/decompositions/PerfectoidSpaces.json`, 33 nodes, accepted by REVIEW-EXT-03) extracts §§3–7 node by node into P0–P3, P5 and P7. Every item of those sections is **planned**, citing the stage that owns its node:
- almost mathematics: P0;
- perfectoid fields, algebras, tilting and the cotangent complex vanishing: P1;
- the analytic topology and sheaf theorem: P2;
- almost purity and the étale site: P3;
- tilde-limits: P7.

**§2 recalls Huber's theory.** Much of it is **library**, in Tau Ceti's adic-space development:
- Huber and Tate rings, bounded and power-bounded elements, and the Tate algebra;
- Spa and rational subsets;
- spectrality and the rational basis;
- the emptiness, unit and plus-ring criteria (Proposition 2.12).

The rest is **planned** by the Tau Ceti roadmap Foundations of adic spaces:
- invariance of Spa under completion, rational localisation and its plus ring, and 𝒪_X with its stalks: Layer 3;
- Huber's sheaf theorem: Layer 4;
- adic spaces: Layers 3.4 and 5.

The comparison of adic spectra with Berkovich spectra by rank-one points is TropicalAndBerkovichArithmetic TB.0.

**Mathlib has pieces of the tilt**:
- `PreTilt`, `Tilt`, and `PreTilt.untilt` as the sharp map;
- Fontaine's θ, `WittVector.fontaineTheta`, with surjectivity;
- Krasner's lemma, Serre quotients of abelian categories, and Banach's open mapping theorem.

**Tau Ceti's toric library** has the cones and fans of Definition 8.2 (`TauCeti.Toric.IsToricCone`, `TauCeti.Toric.Fan`), but no toric schemes.

**§9's standard inputs are planned:**
- t_ℓ: Local fields and ramification Layer 4, and LPV.1;
- quasi-unipotence, N and the monodromy filtration: LPV.1 and ArithmeticGaloisRepresentations R01.2;
- Deligne's equal-characteristic theorem and the linear-algebra Lemma 9.5 (Weil II 1.8.4): DeligneWeightsAndPurity DWP.5 with DWP.7;
- Huber's algebraic/adic comparison theorem: ClassicalAdicEtaleCohomology H5;
- de Jong's alterations: AdicCoefficientsAndComparisons L5;
- Poincaré duality and Chern classes: EtaleDualityAndPerverseSheaves EDC.2 and EDC.3;
- proper base change and topological invariance of the étale site: SchemeAndStackFoundations SF.2.

## Routes

1. **Source of PerfectoidSpaces P1 and P3** (3 items, all planned by the PerfectoidSpaces packet; see the review's corrections). Three statements fall outside the decomposition's nodes but inside its layers:
   - Remark 5.14, that W(R) is the unique flat p-adically complete lift of a perfect 𝔽_p-algebra (P1);
   - the invariance of absolute Galois groups under completion and perfection, which Theorem 1.1 and the proof of Theorem 9.6 use silently (P3);
   - Remark 1.11, recovering Faltings's form of almost purity from Theorem 7.9 (P3).
2. **Source of AdicSpacesPartII R0–R2** (1 missing and 2 planned, after the review). AdicSpacesPartII is the declared successor of the Tau Ceti adic-space roadmap for morphisms, analytification and formal models. It gets three recalled results; its packet already plans the second and third:
   - the universal property of maps into an affinoid adic space (Proposition 2.19);
   - Huber's equivalence between quasiseparated rigid-analytic varieties and adic spaces locally of finite type (Theorem 2.21);
   - the specialisation map and X ≅ lim_𝔛 𝔛 over formal models (Theorem 2.22). AdicEtaleGeometry A2 already warns that a Raynaud equivalence must not be assumed; this makes it a task.
3. **Source of TropicalAndBerkovichArithmetic TB.0** (1 missing). Tautness and the global equivalence between Hausdorff strictly analytic Berkovich spaces and taut adic spaces of locally finite type (Theorem 2.24). TB.0 already plans the affinoid comparison. The review rejected this route: ClassicalAdicEtaleCohomology H3 plans the item.
4. **Source of AdicSpacesPartII R0** (2 missing; retargeted from AdicEtaleGeometry A1 by the red-team fix). The description of points of Spa as maps to complete affinoid fields (Proposition 2.27) and of specialisation by inclusion of valuation rings (Proposition 2.29). These are point-set facts about Spa, and R0's nodes already cite them from Huber without stating them; A1 concerns étale sites.
   - The AdicSpacesPartII blueprint was finished and promoted before this extraction, and a source route does not re-run it. The route records the owner only: the two items become planned only after a packet amendment adds R0 nodes.
5. **Part II `AnalyticToricGeometryNonarchimedeanPartII`** (16 missing), designed by the queue as `AnalyticToricGeometryPartII`.
   - The parent already has a Part II: the accepted RS-32 makes ShimuraCompactifications "Analytic toric geometry, Part II: arithmetic toroidal compactifications". This route builds beside it, imports its C0 toric charts over base rings, and plans only what C0 lacks. Part II or Part III is the maintainer's choice.
   - PAPER-BINDA-KATO-VEZZANI-25 proposed a toric Part II with the same title. That extraction is under revision, so nothing coalesces; its resubmission should import this roadmap. The brief states the construction leaves its review found missing (gap G12) and BKV's tests itself.
   - The brief states Theorem 8.5, Proposition 8.6, Proposition 8.7 and Corollary 8.8, and lays out the eight construction steps. The approximation lemma for the graded ring of a toric divisor is imported from PerfectoidSpaces P2, which is asked to state it for perfected monoid algebras of rational cones.
   - It also covers Theorem 1.5 for the affine line.
   - The upstream Tau Ceti roadmap builds only complex toric manifolds, so this extends it rather than re-planning it.
6. **Part II `DeligneWeightsPartIIWeightMonodromy`** of Deligne weights, purity and the Weil bounds (9 missing): the ℓ-adic weight-monodromy theorem for toric complete intersections (Theorem 9.6), with its specific inputs:
   - the conjecture for a variety, and the stability of the weight-monodromy predicate, which it imports from DWP.5 (route 7);
   - the tilting identification of Galois groups compatibly with weights and N;
   - Huber's neighbourhood theorem [Hub98, 3.6(a)];
   - the equivariant comparison map;
   - cup products under morphisms of sites (Lemma 9.8);
   - the top-degree isomorphism;
   - the direct-summand argument.

   DWP.5 states that its local weight theory is not the mixed-characteristic conjecture, and WeightsInEtaleCohomology R34.6 forbids assuming it. So this is a continuation of DWP, not a new roadmap. The accepted RS-17 already makes WeightsInEtaleCohomology the Part II of DWP; this route builds beside it, and R34.6 may consume Theorem 9.6. The queue designs it as `DeligneWeightsAndPurityPartII`. It imports the toric approximation from route 5. BKV's p-adic (Hyodo–Kato) analogue is a different statement, in an extraction under revision.
7. **Source of DeligneWeightsAndPurity DWP.5** (1 missing), added by the red-team fix. Weight–monodromy purity of a Weil–Deligne or local Galois representation (item 154, the definitional half of Conjecture 9.3). DWP.5 owns the weights of the monodromy graded pieces, and several layers use the predicate without defining it: R24.5, R19.3, AG2.5, AG2.6 and R34.6.
   - The extraction's review has no verdict for this route, so the queue does not apply it until the next review of the extraction accepts it.

## Mistakes recorded

1. Proposition 9.1 prints ρ(σ) = exp(N t_ℓ(**g**)) for exp(N t_ℓ(σ)) (E1).
2. Lemma 7.3(i), (iii) print the surjectivity for |X ×_Z Y| → |X| ×_{|Z|} |Y| instead of X ×_Y Z (E2, already in the atlas as PerfectoidSpaces/E22). Lemma 7.3(iii) also writes "over k" for "over K" (E3).
3. The proof of Lemma 6.13(iv) says "zero" for "empty" (E4, already PerfectoidSpaces/E14).
4. Two gaps already recorded in the atlas:
   - Theorem 1.1 silently passes from ℚ_p(p^{1/p^∞}) and 𝔽_p((t)) to their completions (E5, PerfectoidSpaces/E23; both rejected on review, since the reduction is standard);
   - "the rest is easy" in Theorem 4.17 hides an almost-Nakayama argument (E6, PerfectoidSpaces/E4).
5. The published proof sketch of Theorem 2.22 writes Spa(R[1/p], R) where k may have characteristic p, so R[1/ϖ] is meant (E7).
6. Lemma 9.5 uses an integer i it never introduces (E8).
7. Theorem 1.5 is stated for the affine line but only the unit-disc case is proved, in Theorem 8.5(iii) (E9, a gap with a routine fix). The review rejected E9: Theorem 8.5(iii) for the complete fan of ℙ¹, restricted to 𝔸¹, is Theorem 1.5.
8. The proof of Proposition 5.23 takes a "finitely generated R°-subalgebra" where a finite R°-module is needed for integrality and boundedness (E10).
9. The proof of Proposition 8.7 calls a section of 𝒪(p^N D) a "regular function" (E11).

**A note for the reviewer on PerfectoidSpaces/E13.** The atlas's PerfectoidSpaces/E13 calls "(i) S⁺ = S° ⊂ S is open and bounded" in Proposition 6.10 a misprint. It is not one: Definition 2.6(iii) defines "topologically finite type" to include R⁺ = R°, so the printed statement is correct. That finding should be rejected when its packet is reviewed.

## Prerequisite papers not yet in the atlas

The following papers are not yet in the atlas's paper batches:
- Gabber–Ramero, *Almost ring theory*: the book whose numbering Sch12 cites; the decomposition used arXiv statements only.
- Huber's two Math. Z. papers (1993, 1994), his 1996 book and his 1998 finiteness paper, the last for Theorem 3.6(a).
- Faltings's almost purity papers.
- Fontaine–Wintenberger.
- Illusie, *Complexe cotangent et déformations*, and *Autour du théorème de monodromie locale*.
- de Jong, *Smoothness, semi-stability and alterations*.
- Bosch–Lütkebohmert, BGR, Tate, Berkovich, and Hochster.

Kedlaya–Liu and Deligne's *Weil II*, which the paper also uses, are already in batch 5.

## Corrections by the independent review

REV-PAPER-SCHOLZE-12 (Claude Code, session `cc-fb70e5`, 29 September 2026) made these changes:

- **Six items are now planned.** Blueprint packets on main already plan them. The extraction checked the stage texts and the 33-node decomposition, which the 324-node PerfectoidSpaces packet has replaced.
  - Item 2 (Galois groups under completion and perfection): PerfectoidSpaces:P3, node P3/fontaine-wintenberger.
  - Item 5 (Remark 1.11, Faltings's almost purity): PerfectoidSpaces:P3, an acceptance criterion of P3/almost-purity-theorem.
  - Item 71 (Remark 5.14, W(R) as the unique deformation): PerfectoidSpaces:P1, an acceptance criterion of P1/cotangent-complex-vanishing-mod-varpi.
  - Item 25 (Huber's rigid–adic comparison): AdicSpacesPartII:R1, nodes R1/rigid-adic-comparison-functor, R1/rigid-adic-quasi-separated-equivalence and R1/rigid-adic-topos-equivalence.
  - Item 26 (formal models and X ≅ lim 𝔛): AdicSpacesPartII:R2, nodes R2/specialisation-map (v) and R2/raynaud-theorem (e).
  - Item 27 (taut spaces and Berkovich spaces): ClassicalAdicEtaleCohomology:H3, nodes H3/taut-spaces-and-morphisms and H3/berkovich-taut-comparison (a).
- **Routes.**
  - Route 3 is rejected: its only item is planned by H3.
  - Routes 1 and 2 remain source routes. They now name planned items as well as, for route 2, the missing item 23. Their reasons are rewritten.
- **Briefs.**
  - Route 5 now imports affine toric charts over base rings and their face open immersions from ShimuraCompactifications C0, and obtains Theorem 1.5 from Theorem 8.5(iii) for ℙ¹.
  - Route 6 now says the Galois-group invariance is planned in P3.
- **Notes.** Items 4, 120 and 145 have updated notes.
- **Mistakes.** Every source issue has a review verdict. E5 and E9 are rejected; the other nine are confirmed.

## Fixes after the red team

FIX-RT-PAPER-SCHOLZE-12 (Claude Code, session `cc-f805bf`, 30 September 2026) applied the confirmed high and medium findings of RT-PAPER-SCHOLZE-12, as corrected by the independent verifier. Details: `research/blueprint/redteam/RT-PAPER-SCHOLZE-12.fixes.md`.

- **/1.** The two Part II routes now name the parents' existing Part IIs, ShimuraCompactifications (RS-32) and WeightsInEtaleCohomology (RS-17), and plan beside them. Each keeps its parent as first prerequisite.
- **/2.** Routes 5 and 6 name each other by title and by the ids the queue generates. The BKV coalescence is withdrawn, BKV's gap and tests are stated in the brief, and the motives export points at the queued MotivesAndAlgebraicCyclesPartII.
- **/4.** Route 4 now takes items 31 and 33 to AdicSpacesPartII R0 instead of AdicEtaleGeometry A1. Planning them needs a packet amendment.
- **/6.** Route 5 imports the approximation lemma from PerfectoidSpaces P2, and its toric schemes over ℂ must agree with Analytic toric geometry Layer 0.
- **/7.** Item 140 is split. The predicate for a representation is the new item 154, routed to DWP.5 by the new route 7, which awaits a review verdict. Route 6 imports it.
