# DESIGN-BCGP25 — Modularity of abelian surfaces (AbelianSurfacesModularity)

Agent: Claude (Opus 5.5), session `claude-CyimJQ`. Issue #906. Branch `claude-CyimJQ-design-bcgp25`.
This is a complete target-level design pass, ready for independent review. It claims no closure and no implementation.

## Deliverables

- `research/blueprint/roadmaps/AbelianSurfacesModularity.json`: the roadmap definition, area `langlands` (as the issue's instructions fix), no parent, nine stages AM.0–AM.8. Each stage's `requires` is generated from its nodes' direct prerequisites.
- `research/blueprint/packets/AbelianSurfacesModularity.json`: 46 nodes (4 definitions, 3 constructions, 37 theorems, 2 applications), 49 API items, 31 unit tests, 23 planets (at most 4 per layer), 12 baseline declarations read at the pins, 21 supplier requests, 6 gaps, 3 new source findings and 3 restructuring proposals. `scripts/check_blueprint.py` with the pinned index reports 0 errors and 0 warnings. All nine stages are `planned` and none is closed. Every `implementationStatus` is `unchecked`.
- `research/blueprint/readmes/AbelianSurfacesModularity.md`: the reader document. It has an introduction (the 2–3 switch), conventions, the source edition, a corrections table keyed to the extraction's E-numbers, the baseline, the supplier contracts (imported nodes and requests), one section per node (statement, hypotheses, proof, uses, API, unit tests, acceptance, prerequisites, locator), per-layer dependencies, gaps, restructuring and order of work. The node sections are generated from the packet, so the two agree, and packet text is escaped for `src/markdown.js` (including `|` in table cells).
- `research/blueprint/suggested/AbelianSurfacesModularity.lean`: a compact companion in the 2026-10-12 shape, 219 lines. It contains the form J of §1.8.7, the explicit images under ι : S₆ ≅ Sp₄(F₂) (Lemma 8.1.3, Lemma 8.2.4, Remark 5.2.8), the oddness criterion, S₅(b) and A₅(b), ordinary Weil quartics, and a few identities of §§9–10. The S₆/Sp₄(F₂) facts are proved by `decide`. The statement of ι, the counts 16 and 40 and one root example are `sorry`. **Compiled** with `lean-check` at Mathlib 082e2d3 / Tau Ceti f790474, with `sorry` warnings only; `scripts/check_sorry_data.py` is clean. The main theorems need carriers that are not at the pins (Galois representations of abelian surfaces, GSp₄ automorphic representations, P(ρ̄)), so they are README targets only. Packet API names for those carriers therefore have no Lean declaration. Statable unit tests appear as `example`s whose docstrings carry the packet's test names.

## Brief followed

The issue's brief (DESIGN-BCGP25: cover the paper completely, build on DESIGN-BCGP18 and the ACC⁺ infrastructure) was merged with the accepted route of the reviewed extraction `PAPER-BOXER-CALEGARI-GEE-PILLONI-25`. That route has 84 items and a brief fixing the layers: the S₆–Sp₄(F₂) dictionary and the A₅(b) seed, the local geometry at 2 and 3, the odd-theta moduli, approximation outside thin sets, the 2–3 switch, and the complements. By that route this roadmap owns §6.4, §§8–10, Theorems A and B and Definition 1.8.25. BCGP25 §§2–7 belong to other roadmaps (listed in the reader under "Not planned here").

Items the route assigns here but which accepted packets already plan are **imported, not re-planned**. They are: P(ρ̄), M^w_2(ρ̄) and Lemma 9.3.7 with its seeds (AbelianSurfacesPotentialModularity AP.7, as the BCGP18 design claimed); Definition 9.1.7 and Lemma 9.1.8 (NeronModelsAndSemistableAbelianVarieties R11.6); §8.1.1, Lemma 9.3.4, Remark 9.3.5 and Lemma 10.3.1 (AbelianSchemesAndArithmeticModuli A3, A4); the Galois types (AP.6/galois-types); Lemmas 10.2.3–10.2.4 (ArithmeticGaloisRepresentations R01.5, EndoscopicTransfer ET.7a); and Lemma 10.4.1 (ModularityAndLanglandsExtensions ML.0).

### Item map (route items → nodes)

| Item | Name in the extraction | Node(s) |
| --- | --- | --- |
| 1.8.25-modular | Isobaric modularity of an abelian surface | AM.0/isobaric-modularity |
| Theorem-A-cuspidality | Modularity theorem for abelian surfaces over Q | AM.7/theorem-a |
| Theorem-A-analytic | Holomorphic L-function and functional equation | AM.7/theorem-a, AM.0/modular-of-gsp4 |
| Theorem-B | Quintic genus-two modularity theorem | AM.7/theorem-b |
| 5.2.8-S6 | Strong involutions under Sp4(F2)=S6 | AM.2/strong-odd-involutions |
| 6.4.1 | Regular semisimple classes at three | AM.1/regular-semisimple-classes |
| 6.4.3 | Fifteen allowed residual-three groups | AM.1/allowed-images |
| 6.4.5 | Failure of GL4 adequacy for the symplectic-three image | AM.1/symplectic-three-not-adequate |
| 8.1-even-quotient | Even-subset symplectic representation | AM.2/s6-sp4-identification |
| 8.1-S6-isomorphism | Exceptional symplectic permutation isomorphism | AM.2/s6-sp4-identification |
| 8.1-S5b | Weierstrass stabilizer subgroup | AM.2/s6-sp4-identification |
| 8.1-Weierstrass | Rational Weierstrass point criterion | AM.2/weierstrass-criterion |
| 8.1.2 | Four-dimensional A5 module | AM.2/a5-modular-representations |
| 8.1.3 | Explicit symplectic basis certificate | AM.2/s6-sp4-identification |
| 8.2.1-simples | Simple A5 modules in characteristic two | AM.2/a5-modular-representations |
| 8.2.1-tensor | Tensor and symmetric-cube identifications | AM.2/a5-modular-representations |
| 8.2.1-projective | Defect-zero A5 block | AM.2/a5-modular-representations |
| 8.2.1-regular | Order-five residual regularity | AM.2/a5-modular-representations |
| 8.2.6 | Characteristic-two symmetric-square sequence | AM.2/a5-near-adequate |
| 8.2.7 | Frobenius twist inside the symmetric square | AM.2/a5-near-adequate |
| 8.2.8 | Socle of the A5 endomorphism module | AM.2/a5-near-adequate |
| 8.2.9 | Weak adequacy of the A5 module | AM.2/a5-near-adequate |
| 8.2.2 | Near adequacy of A5 | AM.2/a5-near-adequate |
| 8.2.3 | A5 is not adequate in the stronger sense | AM.2/a5-near-adequate |
| 8.2.4 | Strong oddness of nontrivial A5 involutions | AM.2/strong-odd-involutions |
| 8.2.5 | CM persistence of the residual A5 hypotheses | AM.2/a5-residual-hypotheses |
| 8.3-Artin-seed | Odd two-dimensional Artin seed | AM.3/residual-a5-automorphy |
| 8.3-Hida-seed | Regular ordinary symmetric-cube seed | AM.3/residual-a5-automorphy |
| 8.3.1 | Solvable residual A5 automorphy | AM.3/residual-a5-automorphy |
| 8.3.2 | Residually A5 ordinary abelian-surface modularity | AM.3/two-adic-modularity |
| 9.1.2 | Distinguished ordinary abelian surface | AM.0/p-distinguished |
| 9.1.3 | Projective Frobenius-three class certificate | AM.1/outer-classes, AM.1/frobenius-class-at-two |
| 9.1.4-examples | Three good ordinary local-two Jacobians | AM.4/local-two-examples |
| 9.1.4-types | Residual types of the three examples | AM.4/local-two-examples |
| 9.1.6-enumeration | Genus-two enumeration over F2 | AM.4/genus-two-curves-over-F2 |
| 9.1.6-Weierstrass | Good ordinary local-two Weierstrass restriction | AM.4/genus-two-curves-over-F2 |
| 9.1.8 | Ordinary local-two Weierstrass image | imported NeronModelsAndSemistableAbelianVarieties:R11.6/ordinary-residual-point-export; group part AM.2/siegel-parabolic-two-group |
| 9.2.1-P | Twisted level-three odd-theta moduli | imported AbelianSurfacesPotentialModularity:AP.7/odd-theta-cover (request AP.7) |
| 9.2.1-M | Marked-Weierstrass Jacobian locus | imported AP.7/odd-theta-cover (request AP.7) |
| 9.2.1-rational | Rationality of the twisted odd-theta cover | imported AP.7/odd-theta-cover |
| 9.2.3-semistable | Local-two semistable realization criterion | AM.4/local-two-realization |
| 9.2.3-good | Local-two good realization criterion | AM.4/local-two-realization |
| 9.2.4 | Ordinary surface Weil polynomial | AM.4/ordinary-weil-quartic |
| 9.2.5-quartics | Ordinary Weil quartics at two | AM.4/weil-quartics-at-two |
| 9.2.6 | Good-reduction exclusions with a Weierstrass point | AM.4/good-reduction-exclusions (a) |
| 9.2.7 | Excluded projective types force good reduction | AM.4/good-reduction-exclusions (b) |
| 9.2.8-products | Three elementary local-two products | AM.4/product-and-twist-constructions |
| 9.2.11 | Two quartics excluded by local-two image | AM.4/good-reduction-exclusions (c) |
| 9.2.12 | Three-torsion rigidity for the6H isogeny class | AM.4/good-reduction-exclusions (d) |
| 9.2.13-corrected | Toric reduction in the2C and6G cases | AM.4/toric-reduction-cases |
| 9.2.14 | Order-four twist realizing2C | AM.4/product-and-twist-constructions |
| 9.2.16-parametrization | Explicit6G level-three specialization | AM.4/six-g-construction |
| 9.2.17 | Small6G toric example | AM.4/six-g-construction |
| 9.2.19 | Exclusion of good ordinary2D | AM.4/good-reduction-exclusions (e) |
| 9.3.1-enumeration | Genus-two enumeration over F3 | AM.5/genus-two-curves-over-F3 |
| 9.3.1-scalar | Scalar étale Frobenius for ordinary F3 Jacobians | AM.5/genus-two-curves-over-F3 |
| 9.3.1-quartics | Ordinary Weil quartics at three | AM.5/genus-two-curves-over-F3 |
| 9.3.6 | Local-three realization from an ordinary special fibre | imported AP.7/local-three-seeds |
| 9.3.7-nonscalar | Nonscalar local-three seed curves | imported AP.7/local-three-seeds |
| 9.3.7-scalar | Scalar local-three product seed | imported AP.7/local-three-seeds |
| 9.3.7 | Ordinary local-three realization | imported AP.7/local-three-seeds |
| 9.3.8 | Product fibre can force bad curve reduction | AM.5/product-fibre-remark |
| 9.4.1-corrected | Weak approximation outside a thin set | AM.6/thin-set-approximation |
| 9.4.2-local | Local-two Jacobian equivalence | AM.6/local-two-equivalence |
| 9.4.2-global | Global2–3 switch | AM.6/two-three-switch |
| 9.4-thin-avoidance | Full residual image by rational approximation | AM.6/two-three-switch |
| 9.5.1 | Modularity transfer between ordinary surfaces | AM.7/three-adic-transfer |
| 9.5.2 | Fifteen-image abelian-surface modularity | AM.7/fifteen-image-modularity |
| 9.5.3 | Good-reduction genus-two modularity | AM.7/good-reduction-curves |
| 9.5.4 | Quintic genus-two modularity | AM.7/theorem-b |
| 9.5.5 | Bad-at-two abelian-surface modularity | AM.7/bad-at-two |
| 10.1-coefficient-density | Positive coefficient-family proportion | AM.8/density-of-applicability |
| 10.1-database | Frozen database application certificate | AM.8/lmfdb-applicability |
| 10.2-Galois-type | Abelian-surface Galois type | imported AbelianSurfacesPotentialModularity:AP.6/galois-types |
| 10.2.1 | Automorphy for thirty-two Galois types | AM.8/small-sato-tate-automorphy |
| 10.2.5 | Odd potentially abelian symplectic automorphy | AM.8/potentially-abelian-automorphy |
| 10.2-reducible-types | Reducible compatible-system cases | AM.8/small-sato-tate-automorphy |
| 10.3.5-rational-model | Rational sextic parameter space for fixed mod2 image | AM.8/mod-two-parameter-space |
| 10.3.6-three-table | Nontrivial Frobenius partitions at three | AM.8/mod-two-realization |
| 10.3.6-triple-transposition | Weil-restriction seed for three transpositions | AM.8/mod-two-realization (gap) |
| 10.3.6-two-seeds | Three ordinary étale-two special fibres | AM.8/mod-two-realization |
| 10.3.6 | Global ordinary mod2 realization target | AM.8/mod-two-realization |
| 10.3.8 | Identity Frobenius obstruction to the local seed | AM.8/frobenius-three-obstruction |
| 10.3.9 | Ordinary mod2 modularity target | AM.8/mod-two-modularity |

## Findings for the maintainer

1. **The lifting theorem has no owner yet.** Theorem 7.5.11 / Proposition 7.5.10, which both the 2-adic step (AM.3) and the 3-adic step (AM.7/three-adic-transfer) apply, belongs to the new roadmap GSp4NonregularModularityLifting. Its design job (DESIGN-GSp4NonregularModularityLifting) is pending. The request is parked at AbelianSurfacesPotentialModularity:AP.5, and Remark 1.8.20 is parked at AP.0. Re-point both when that roadmap has stage ids (restructure entry 2). Through it the endpoint also rests on Theorem 4.12.4, which the HigherHidaAndColemanTheory design does not plan (it plans Boxer–Pilloni over Q, not BCGP25 §4), and on Theorems 5.7.14 and 6.3.4 (OrdinaryAutomorphicFormsAndModularityLiftingPartII, undesigned).
2. **Inputs that no packet plans.** Near adequacy (Definition 5.3.3), White's GSp₄-reasonableness and integral enormity (Definition 7.1.1, Corollary 7.1.4) are routed to GlobalGaloisDeformations, which is a Tau Ceti roadmap pull request (#920) that does not contain them. They need a GlobalGaloisDeformations Part II, and the requests sit at its stages G7 and R04.5. Zarhin's End = Z theorem is requested at FaltingsFinitenessAndIsogenyTheorems R28.4, whose OpenImageTheorems Part II is undesigned. Kisin's local constancy is requested at NeronModels R11.6. The dyadic Hida step from parallel weight one is requested at OrdinaryAutomorphicForms R21.2, whose node covers only p ≥ 5. Strong oddness for general GSp_{2n} (Lemma 5.2.7) is requested at PotentialAutomorphyInfrastructurePartII PL.4.
3. **Duplicate design job.** DESIGN-AbelianSurfacesModularity (issue #3473) writes the same four files as this job. Like #3472 for DESIGN-BCGP18, it should be closed as a duplicate (restructure entry 3).
4. **Supplier nodes to update.** NeronModelsAndSemistableAbelianVarieties:R11.6/ordinary-residual-point-export records its finite-group input (S₅(b) against the order-48 Siegel parabolic) as imported; that input is now AM.2/siegel-parabolic-two-group. AbelianSurfacesPotentialModularity:AP.7/fixed-three-torsion can cite AM.6/ordinary-at-three-points (Remark 9.4.4) over Q. AP.7/odd-theta-cover should state explicitly the smoothness of P(ρ̄), the open dense Torelli immersion of M^w_2(ρ̄) and the geometric connectedness of the S₆-cover (request at AP.7). The BCGP18 revision DESIGN-AbelianSurfacesPotentialModularity~2 is pending; if it renames AP.0/AP.6/AP.7 nodes, the imports here must follow.
5. **New source findings** (packet `sourceIssues`, all "affects nothing"): E1, where Lemma 9.1.6(3) leaves implicit the unramified quadratic twist needed to match ρ̄ rather than its twist; and E2, where the two matrices displayed in the proof of Lemma 9.3.7 (p. 203) are, in the convention of Lemma 8.1.3, the images of the inverse permutations (12)(354) and (164352). Verified by computing the action on the sum-zero quotient of F₂⁶, which reproduces Lemma 8.1.3, Lemma 8.2.4 and Remark 5.2.8 exactly. The conjugacy-class claims are unaffected. E3: Lemma 6.4.1 writes PSp₄(F₃) where the images of similitude −1 lie in PGSp₄(F₃) ∖ PSp₄(F₃). Also, the extraction's E028 places its misprint in the caption of Table 6.4.4, but the caption is correct and the misprint is in the first line of the proof of Lemma 6.4.3 (p. 150); the errata reviewer may want to move the locator.
6. **Conditional status.** Every main theorem is conditional on Arthur's classification for GSp₄ through the twisted weighted fundamental lemma (ML.0/arthur-dependency-gate). It also rests on the finite Magma computations of §§6.4, 9 and 10, which are not reproduced independently (gap: certificates). Two independent partial certificates were computed in this pass: the matrices of ι, and the counts of ordinary Weil quartics, 16 at p = 2 (matching Table 9.2.5 row by row) and 40 at p = 3.

## Gaps (as in the packet)

1. Theorem 7.5.11 and its inputs (GSp4NonregularModularityLifting, Theorem 4.12.4, Theorems 5.7.14 and 6.3.4, the obligations PO-analytic, PO-Sen and PO-patching).
2. Arthur's classification for GSp₄ (carried hypothesis).
3. Finite certificates (Table 6.4.4, Lemmas 9.1.3, 9.1.4, 9.1.6, 9.3.1, §9.2.16/9.2.17, the tables of Lemma 10.3.6, the LMFDB counts).
4. The corrected local seed at 3 for the partition [2,2,2] in Lemma 10.3.6 (E053; PO-local-three).
5. The dyadic polarized lifting in Lemmas 10.3.1/10.3.6 (E050, E051; PO-dyadic-polarization).
6. The unplanned suppliers listed in finding 2.

## Checks run

- `scripts/check_blueprint.py` with the pinned index: 0 errors, 0 warnings. The errata checker passes on the packet's `sourceIssues` in an `errata-v1` wrapper, and `scripts/check_sorry_data.py` passes on the Lean file.
- `lean-check` on the suggested file: it elaborates with `sorry` warnings only. The S₆/Sp₄(F₂) facts are checked by `decide`.
- An automatic locator check found every cited label on its cited pages.
- Independent computations: the action of S₆ on the sum-zero quotient of F₂⁶, which reproduces Lemma 8.1.3, Lemma 8.2.4 and Remark 5.2.8 and gives E2; and the ordinary Weil quartics, 16 at p = 2 and 40 at p = 3.
- Table 6.4.4 was read on the page image, which settles which condition each excluded subgroup fails.
- A Sonnet subagent cross-checked all 46 node statements against the cited pages. Its real findings were corrected: four Jacobian-free classes in Table 9.3.3, the wording of Theorem 8.3.2(3), the image hypothesis of Theorem B, the three extra LMFDB curves, the locator of E028, the thin-set exponents of E046, and E3. Its other findings are corrections already tagged.

## Sources read

- BCGP25, arXiv:2502.20645v1 (SHA-256 51d7eacc…5da4e95c, matching the extraction), read 2026-10-18: §1.1, §1.6, §1.8 (pp. 2–17), §5.2.4–§5.3 (pp. 118–120), §6.4 (pp. 149–151), the statements of §7.5 (pp. 174–179), and §§8–10 in full (pp. 179–222). Every node locator was checked automatically against the cited pages (labels found; two proof-continuation pages correct as cited).
- No other source was read; the theorems cited inside proof steps (Zarhin 2000, Serre 2000, Kisin 1999, Pilloni–Stroh, Kim–Shahidi, Calegari–Chidambaram–Roberts, Fité–Kedlaya–Rotger–Sutherland, Serre's *Topics in Galois Theory*) are named as BCGP25 cites them and are owned by the suppliers requested.

## What a follow-up does

All nine stages are planned. The review should check the statements against BCGP25, the imports against their nodes, and the corrections against the extraction's findings. After acceptance the open work is on the supplier side: the GSp4NonregularModularityLifting design (then re-point the AP.5/AP.0 requests), the GlobalGaloisDeformations Part II, the open-image Part II, and the certificates and the two local repairs of §10.3. No per-stage follow-up of this roadmap is needed at target level.
