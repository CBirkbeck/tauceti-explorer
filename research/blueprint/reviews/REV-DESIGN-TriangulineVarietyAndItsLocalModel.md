# Independent review: the trianguline variety and its local model

Job `REV-DESIGN-TriangulineVarietyAndItsLocalModel` (issue #3622), reviewing `DESIGN-TriangulineVarietyAndItsLocalModel` (Codex, session `codex-tBO8y2`, PR #10589). Reviewer: Claude (Claude Code, session `claude-xkyyFs`), 19 October 2026. Verdict: **accepted**, with the corrections below made in place.

## Counts

| | Before | After |
| --- | --- | --- |
| Nodes | 100 | 101 (one added) |
| Definitions / constructions | 20 / 11 | 20 / 12 |
| API items | 118 | 123 |
| Unit tests on definitions and constructions | 96 | 100 |
| Planets | 63 | 64 |
| Baseline declarations | 7 | 7 (all confirmed) |
| Requests / gaps | 9 / 2 | 9 / 2 (R6 and R8 restated) |
| Source issues | 16 | 20 (E1–E16 confirmed, E17–E20 added) |

Node verdicts in the packet's `review.checked`: 83 verified, 17 corrected, 1 added. All thirteen layers stay `planned`; none is closed while G1, G2 and R1–R9 are open.

## What was checked

- **Sources.** All eight sources were fetched; their SHA-256 hashes match the packet. Every node was read at its locator: BHS19 §§3.1–4.3 and the introductory example on p. 305; BHS17 Theorem 2.6 and its proof; BHSsmooth17 §2.2–§2.4 (Lemmas 2.2–2.4, Corollary 2.5, Lemma 2.10, Proposition 2.12); Ding25 §§2.1–2.4; NT21 §2.3.1, Proposition 2.15 and Remark 2.16; Colmez08 Lemma 3.2, Definitions 3.4 and 4.1 and Proposition 4.3; DLB17 Lemma 6.3, in both the arXiv version and the published Annals text; Ding19 Appendix A. Statements keep the sources' hypotheses. The dimension formulas were rechecked by hand: the BHS fibre dimensions, Ding's Ext dimensions, the parabolic quotient dimensions and the partial de Rham dimensions. All small-case unit tests were also recomputed.
- **Baseline.** All seven Mathlib declarations were read at 082e2d3: `LinearMap.prod`, `LinearMap.range`, `LinearMap.ker`, `LinearMap.finrank_range_add_finrank_ker`, `Submodule.finrank_sup_add_finrank_inf_eq`, `AdicCompletion` and `Module.length`. Each exists under that name and supplies what its citing node uses.
- **Suppliers.** Every cross-roadmap prerequisite node was read, 65 in total after the corrections. These come from PadicHodgeTheory P7/R06.3, PhiGammaModulesAndIwasawaCohomology PG.2/PG.3/PG.7, SpringerResolutionAndCharacteristicCycles, LocalGaloisDeformationRings R08.1/R08.3, DeformationAndDerivedPatchingAlgebra and AdicSpacesPartII. Two citations did not supply what was needed; they are corrected below. The rest do.
- **Ownership.** No other roadmap plans the trianguline variety or its local model: not TauCetiRoadmap main at 69bd802 (19 October), and no atlas packet. PadicLocalLanglandsForGL2Qp R30.1 plans two-dimensional trianguline representations for GL₂(Q_p), and this roadmap does not redefine them. LocalGaloisDeformationRings R08.1 owns the deformation rings of crystabelline (φ,Γ)-modules, which Layer D imports rather than rebuilds. PadicHodgeParametersInLocallyAnalyticRepresentations (accepted) consumes Layers H, D, P and I through its contracts TR1–TR5; the mapping is now recorded as a consumer contract.
- **Suggested file.** It now imports individual Mathlib modules instead of `import Mathlib` (PROTOCOL §13). `lean-check` at Mathlib 082e2d3 / Tau Ceti f790474 elaborates it, and its only warnings are the 16 admitted proofs. `scripts/check_sorry_data.py` passes. The two native adapters, `MatchedRelation.range` and `NumericalNoncritical.nativeBounds`, match their packet API items and tests.
- `python3 scripts/check_blueprint.py` with the pinned declaration index: 0 errors, 0 warnings. The reader was regenerated from the packet with a renderer that reproduces all 100 original node sections byte for byte.

## Corrections made in place

1. **`T/period-functor`.** The node required the localized module to have an R_{A,K}-free stable lattice. BHS19 Lemma 3.3.5(ii) proves W_dR(M) finite free for every object, from any stable R_K-lattice. The extra hypothesis would leave the period map undefined on part of X_M. Removed, in the stage description as well.
2. **`T/torsion-cohomology`.** BHS19 Lemma 3.3.3 is for field-valued characters. The Artinian statement now goes through the residual character by dévissage. The converse of the isomorphism criterion cites `PG.7/rank-one-characters`.
3. **`M/relative-representability`.** Added the T₀ⁿ hypothesis under which BHS19 Lemma 3.5.3 is proved; the finiteness of the tangent spaces needs it.
4. **`V/regular-locus-geometry`.** The node cited `LocalGaloisDeformationRings:R08.1/phi-gamma-module-deformation-rings`, whose hypotheses restrict it to Ding's crystabelline objects. That citation is replaced, and the proof follows BHS17 Theorem 2.6. The steps are now: the S_n moduli (R5); global triangulation for equidimensionality; uniqueness of lifted triangulations of regular parameter, which is `N/strict-uniqueness` and `N/ordered-representability` (BHS T_regⁿ lies inside the NT-regular locus); and constructibility for openness, added to R8.
5. **`V/local-identification`.** It cited `R08.1/local-forget-framing`, a theorem about Schur residual representations. Replaced by `DeformationAndDerivedPatchingAlgebra:R03.2/formally-smooth-hull-framing`, which is the fact actually used.
6. **`G/large-gap-saturation`.** BHSsmooth17 Lemma 2.10 is false as printed when [K:Q_p]≥2 (new E17, with a counterexample). The node had silently assumed strictly decreasing weights. The statement now carries the dominance hypothesis explicitly, and E17 records it. Its only consumer, `G/accumulation-theorem`, uses strictly dominant weights and is unaffected.
7. **Added `G/refined-crystalline-space`.** The sufficiency half of BHS19 Theorem 4.2.3 rests on the refined crystalline deformation space of BHSsmooth17 §2.2: reducedness (Lemma 2.2), the smooth dense loci (Lemma 2.4), the smooth Hodge-flag map to G/B and the closed immersion (2.9). No node planned it. The new node has its uses, five API items, four tests and a planet. `G/companion-criterion` now depends on it.
8. **`N/rank-two-nontrianguline`.** The node claimed that D_rig(V) has no φ-eigenvector, and requested finite-dimensionality of φ-eigenspaces (R6) to prove it. Neither DLB17 nor Colmez states this. DLB17's argument needs only that the kernel of P(∇) is finite-dimensional and stable under φ and Γ, plus Colmez's saturation lemma. The theorem is restated in that form, its planet renamed, and Colmez08 added as its source. R6 is narrowed to the saturation lemma (Colmez Lemma 3.2), and `N/polynomial-connection-kernel` now uses Γ-stability. The gap in DLB17's own proof is E18.
9. **Locators.** Several BHS19 locators cited subsections such as "§3.1.2–3.1.3" and "§3.4.1–3.4.2", which the paper does not have. These and several page ranges were corrected: A/period-deformation, T/generic-parameters, T/localized-triangulation, T/torsion-cohomology, C/cohomology-comparison, C/rank-one-comparison, M/component-normality, Y/rank-two-fibres, I/partial-refinement-generation.
10. **Source matches.** In 103 of 105 source entries, the `match` repeated the node statement. Every match was rewritten in my own words to say what the locator states and how it supports the node.
11. **Unit-test kinds.** All 98 tests had kind `unit`, which is not one of the five protocol kinds (PROTOCOL §12). Each was given its proper kind: computation, degenerate, compatibility, characterisation or non-example.
12. **Requests.** R8 now also asks for the constructibility facts that BHS17 uses (Hellmann–Schraen, Lemmas 2.13–2.14), and lists V/regular-locus-geometry among its consumers. The R9 wording now matches the restated N layer.
13. **Roadmap definition.** The descriptions of stages T, M, G and N follow the corrected statements. V now requires N, and G requires Springer F.

## Mistakes in the sources

- **E1–E16 confirmed** at their locators. Each entry carries the review's verdict and reason. E7 is reclassified from error to misprint affecting nothing: the definition just before the faulty "equivalently" sentence is correct.
- **E17, new (BHSsmooth17 Lemma 2.10, error).** The lemma omits the hypothesis that the weight k is dominant. Counterexample: K unramified of degree 2, n=2, r crystalline generic noncritical, Hodge–Tate weights {0,2} at both embeddings, v_p(φ₁)=−3 and v_p(φ₂)=−1. The anti-dominant companion point lies on X_tri (BHS19 Theorem 4.2.3 with w_x=1) and satisfies (2.12), since −2>−3 at both embeddings. It is not saturated. The arXiv version (there numbered Lemma 3.12) has the same statement. The applications use strictly dominant weights and are unaffected.
- **E18, new (DLB17 Lemma 6.3, gap).** The proof uses a φ-eigenvector where a common (φ,Γ)-eigenvector is needed. The published text has the same proof. The fix is two lines and the lemma is true.
- **E19, new (BHSsmooth17, proof of Lemma 2.10, misprint).** The slope inequality has the wrong direction, and the index range in the induction is off by one.
- **E20, new (Ding25, p. 14, misprint).** "D_{1,σ}=T_σ(D₁)" needs the ambient cutoff h_{τ,n}, not D₁'s own lowest weight. The packet already used the ambient cutoff.

No published erratum was found for any of these. The searches are listed in `searched`.

## Questions for the orchestrator

1. **R7 and the rigid character space of K×.** PadicMeasuresIwasawaAlgebras went upstream on 14 October 2026. Its Layer 3a explicitly builds nothing rigid and treats only ℤ_pˣ, yet R7 and several other accepted packets still cite the atlas stage `PadicMeasuresIwasawaAlgebras:L0a` for rigid character spaces. The general-K rigid spaces T=Hom(K×,G_m) and W need an owner. LocallyAnalyticDistributions L3 builds rigid character spaces of compact commutative groups and is the natural home for W.
2. **Layer order.** V/regular-locus-geometry now uses the first four nodes of Layer N, which is presented last. The graph is acyclic, but a `restructure` entry proposes presenting those nodes before Layer V.
3. **G1 and G2** remain the packaging blockers recorded by the design. The Artinian almost de Rham interface is routed to PadicHodgeTheory Part II, via design issue #3426 and the BHS19 route to PadicHodgeTheoryPartIIEquivariantBundlesOnTheCurve. The locally analytic constituents go to LocallyAnalyticRepresentationsOfLocalGroups (#3411). The supplier ids should be assigned when those roadmaps are designed.
4. PadicHodgeParametersInLocallyAnalyticRepresentations can now point its G-TR gap at the node ids listed in the new consumer contract.
