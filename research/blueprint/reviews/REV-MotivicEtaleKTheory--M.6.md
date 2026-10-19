# Independent review: motivic spectral sequence and rational weights, M.6

**Accepted after correction**, 2026-10-19. Reviewer: Codex, session `codex-PqsrIq`, independent of the original BP session `codex-QL5yGt`. Refs #10794.

This accepts the target-level plan. M.6 remains **planned**, with G1–G3 and all implementation statuses unchecked. The inherited filtered-model comparison and the supported relative character proof are not certified complete by this review.

| Item | Result |
| --- | --- |
| Nodes | 7 corrected; none added or removed |
| Kinds | 1 construction, 1 definition, 3 theorems, 2 comparisons |
| API | 15 items, previously 12 |
| Definition/construction tests | 11, unchanged; both objects have at least three |
| Planets | 4 new plus 2 imported M.6 planets, total 6 |
| Baseline | All 3 citations confirmed; none removed or replaced |
| Sources / findings | 5 sources; 2 findings independently confirmed |
| Gaps / requests | 3 / 4, retained explicitly |
| Packet validation | 0 errors, 0 warnings |
| Suggested Lean | Elaborates; 2 `sorry` warnings, 2 proved examples |

## Corrections and node verdicts

The packet contains a separate checked verdict for every node. Its reader and suggested-file catalogue agree with these corrections.

1. **Universal motivic Chern classes.** Checked the actual universal projective-bundle construction, higher evaluation and smooth perfect-field hypotheses in Weibel V.11.3–11.11, pp.452–459, and Riou Theorem 6.2.1.2, pp.31–32. Added M.4/nesterenko-suslin-totaro as the existing supplier of the Milnor/motivic diagonal used in the symbol test. Added Whitney and universal-characterization API items. The total Chern series has constant term 1; the separate auxiliary convention `c_{0,0}=rank` must not be substituted into Whitney. The relative derived evaluation remains G2. Corrected the source Whitney displays as recorded in E-M6-2 below.
2. **Normalized higher character.** Verified the positive-degree coefficient, its distinction from the degree-zero Newton formula, and the bound `j≤d+m` from cycle dimension. Riou 6.2.2.3 is a **Remark**, not a lemma. Split cancellation and recurrence into the two API names actually used in Lean. Kept all six mathematical tests in the reader.
3. **Products and Adams compatibility.** Weibel V.11.3, pp.452–453, explicitly prints the diagonal graded-ring product case. It does not by itself state the arbitrary-weight higher formula attributed to it. The corrected route lifts the universal tensor/Newton identity through Riou's several-operand motivic-target uniqueness (paragraph preceding Proposition 6.2.2.1, p.32), then evaluates on the smash of the two spheres. Weibel V.11.5(4), p.454, supplies the universal tensor rule; Levine Theorem 5.2, pp.313–316, supplies the higher Chow product sign. The actual K-model adapter remains G2. Adams compatibility implies off-weight vanishing, but does not fix an edge isomorphism's scalar by itself.
4. **Gamma/homotopy-coniveau comparison.** Checked Levine's relative K₀ surjection, Lemma 13.3, pp.60–61, the moving proof of Theorem 13.10/Corollary 13.11, pp.65–68, and the finite-filtration argument in Lemma 14.6/Theorem 14.7, pp.71–74. Corrected **Theorem** 14.5. Retained the explicit field adaptation using the semilocal Grassmannian argument on p.66 and coprime-degree transfers; the printed one-dimensional-base corollary is not silently cited as a field theorem. The full weighted gamma filtration is bounded by its inclusion in the finite homotopy-coniveau filtration, not by operationwise gamma vanishing. The generic supported K₀ weight computation avoids assuming the higher gamma comparison being proved. Added the direct M.6a/global-model-comparison prerequisite: transporting Levine/FS images into the chosen tower also requires G1, and is not established by equality of pages.
5. **Relative cycle normalization.** Corrected the missing projector in the concrete cycle map. Levine Lemma 2.1 and the construction preceding Lemma 2.2, pp.258–261, use rational generalized characteristic summands; Lemma 2.2 and proof, pp.261–265, retain that projection. After comparison with Kₘ, the imported finite rational splitting identifies the genuine Adams weight. Theorem 3.3, pp.279–283, proves Zariski Mayer–Vietoris descent, rather than the asserted good-position independence. Added the existing rational-motivic-degeneration supplier. On P², for `u=[O(1)]−1` and a hyperplane D, `[O_D]=u−u²` has character `h−h²/2`; its weight-one projection is `u−u²/2`, with character `h`. This explicit check detects an unprojected cycle inverse. The supported relative composite is still conditional on G2–G3.
6. **Edge comparison.** Retained the projector in the requested support-level edge-inverse adapter. Distinguished `[O_Z]` modulo the next filtration from its pure-weight lift `pr_j[O_Z]`. Corrected Levine's coniveau source to **Theorem** 11.3.2 and **Remark** 11.3.4, pp.63–64. Theorem 6.4.2, pp.35–37, fixes generic length-one cycle normalization, but does not by itself discharge the filtered FS/Levine adapter G1.
7. **Localization and residue.** Checked localization before purity, the codimension-one weight drop, and the trivial normal line of the local curve point. Added the direct M.4 diagonal-Milnor supplier and the sign conversion: with M.4's ordered cubical differential, localization is `(-1)^(n−1)` times the imported last-entry Milnor residue. Thus a uniformizer first gives positive residue, including `δ{π,u}=ū`; the T.3 last-entry tame convention instead gives `∂^last{π,u}=ū⁻¹`. This resolves the convention boundary explicitly. Corrected the projection-formula locator to Theorem 5.2(b). The general normal-bundle Todd restriction remains in force.

## Sources, baseline and ownership

Independently retrieved all five public sources. Their SHA-256 values match the packet. Read every node locator, including the proofs used in its route; Theorem 3.4 of Levine 1994 was checked through its statement and initial proof on pp.283–284, with the missing universal supported comparison still recorded as G3. Gillet 1981 and Gillet–Soulé 1987 remain source leads, not verified proofs. No source passage is reproduced in the deliverables and no `excerpt` fields remain.

All three baseline declarations were read in `Mathlib/Data/Nat/Factorial/Basic.lean` at `082e2d37e8b0463410cdb532e111cd43d5a66174`: `Nat.factorial` has the required recursive clauses, `Nat.factorial_succ` supplies the recurrence, and `Nat.factorial_ne_zero` supplies the natural nonvanishing needed after coercion to Q. There are no additional assumptions to supply. Tau Ceti's pinned categorical exact K₀ is not a higher scheme K-spectrum or a motivic cohomology carrier.

Read the reviewed library audit for M.6/M.6a/M.6b and the actual supplier statements in M.1, M.5d and S.6/S.7, plus the K.2 and SF.5 stage contracts. The current accepted M.5d review is `REV-MotivicEtaleKTheory--M.5d~2`; its node IDs, tower, convergence and rational projectors are imported unchanged. No new tower, spectral sequence or ordinary gamma/Chow construction is introduced. The new symbol-test references name the existing M.4 diagonal theorem.

Checked current read-only TauCetiRoadmap main at `0d144d044dacebca17b654695b6f1ad58f159b27`, including AlgebraicVectorBundles' L0 definitions and successor boundaries and JacobianChallenge's A–E inventory and suggested file. Checked the current Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Vector-bundle and Picard foundations remain imported. These upstream sources do not supply the higher-K/motivic carriers needed to state the headline comparison at the compilation pins.

## Source findings

**E-M6-1 confirmed for the August 29, 2013 author copy.** Visually checked Weibel VI.4.3, printed p.481/PDF p.489: the degree-three étale Chern composite has a negative-two coefficient there. V.11.13 gives positive two, and V.11.12(4) identifies its reduction with the étale classes; two diagonal product coefficients also give positive two. The exponent conclusion is unaffected. Added the finding's `source`, independent verdict and explicit `sourceVersions` record.

Rechecked the author's errata link on the Rutgers hosts and targeted search results. Direct requests returned 404; the search engine exposes an indexed errata snippet, which is insufficient to establish whether this sign already has a published correction. Novelty remains unestablished, and the finding is scoped to the recorded author copy.

**E-M6-2 confirmed and added.** In the Whitney proof of V.11.11, printed p.459/PDF p.467, the localization Gysin source must be P(F′), rather than P(F″); codimension n″ gives the already correct weight n′. The open term still uses P(F″). This bundle typo was previously recorded as K3BlochGroups/E31 and is cross-referenced rather than presented as a new discovery. Also restored the omitted ξ powers in the displayed Chern polynomials: for rank r use `C_E(T)=Σ_i(-1)^i c_i(E)T^(r−i)`, with `c_0=1`. The initial monic relation on the page gives the same homogeneous convention, and the intended factorization is `C_F=C_F′C_F″`. Both display defects were checked on the rendered page. Targeted errata searches found no accessible correction; their status in published errata remains unestablished. The corrected universal-Chern proof and reader use these formulas.

## Checks and orchestrator handoff

`python3 scripts/check_blueprint.py research/blueprint/packets/MotivicEtaleKTheory--M.6.json --json` reports **0 errors, 0 warnings** with the available pinned declaration index. The source-issue/version schema, reader/packet synchronization, local links and whitespace were checked as well.

`lean-check research/blueprint/suggested/MotivicEtaleKTheory--M.6.lean` exited **0** at the pinned Mathlib, with exactly **2 warnings**, both uses of `sorry` in named theorem targets. Before compilation, **76 GiB** were available. The file now uses `import Mathlib`, one real-bodied normalization scalar and two proved examples detecting the double- and triple-symbol factors; all seven admitted examples were removed. Its headline comparison remains a reader target until the actual carriers exist, following the carrier boundary of the current JacobianChallenge precedent. No arbitrary stand-in maps or groups were introduced to manufacture a headline signature.

No question blocks acceptance of this plan. The orchestrator should retain G1–G3 as supplier refinements: the augmentation/layer-compatible filtered zigzag with projected edge inverse; coherent universal evaluation on relative diagrams; and supported relative Chern normalization with face nullhomotopies. Package work must preserve those boundaries and must not call M.6 closed. See the [handoff](../handoff/REV-MotivicEtaleKTheory--M.6.md).
