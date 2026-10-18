# Independent review: StableReductionPartII, MC.1

**Verdict: accepted after corrections.** This is a complete planning pass with **planned**, not closed, stage coverage. The eight generic contracts Q1–Q8 and the transitive supplier gaps remain explicit. Acceptance confirms the correctness and honesty of this plan; it does not certify those suppliers as finished proofs or the geometric targets as implemented.

Reviewer: Codex, session `codex-26lcH6`, job `REV-StableReductionPartII--MC.1`, issue #8937, 2026-10-18. The input was written by a different session, `codex-F1Oum3`, in #8901. The bot confirmed this review claim before work began.

Reviewed files: [packet](../packets/StableReductionPartII--MC.1.json), [reader](../readmes/StableReductionPartII--MC.1.md), and [suggested Lean](../suggested/StableReductionPartII--MC.1.lean). The parent packet and supplier packets were read but not edited.

## Counts and scope

The packet retains twelve nodes: one definition, four constructions, four theorems, two comparisons and one application. Six node verdicts are verified and six corrected. There are no added or unverifiable nodes. It retains 23 API items, 20 definition/construction tests, five baseline declarations, thirteen inherited-target resolutions, twelve requests and two grouped gaps. Eight requests describe missing generic contracts; four acknowledge existing upstream StableReduction layers. All twelve implementation statuses remain unchecked.

Every definition/construction has four discriminating tests. These cover the genus-zero integer-subtraction convention, nilpotent polarization tests, nontrivial base lines, incomplete linear series, scalars, stabilizers, composition order and boundary-branch monodromy. A further acceptance case added in this review uses unstable P¹ to distinguish general obstruction vanishing from stable-only rigidity and dimension. No planets were added; the parent's six MC.1 selections remain within the limit.

## Corrections made

1. **Perfect pushforward.** `refinement-arbitrary-base` cited a nonexistent part (1) of Stacks Lemma 75.25.1. Its intended exact special case is **75.25.4(1), tag 0CTM, pp. 61–62** of *Derived Categories of Spaces*. It assumes proper finite presentation and flatness, and supplies arbitrary derived base change. These hypotheses hold for the curve family. The single-degree concentration input remains 75.26.4, pp. 64–65.
2. **Universal functions.** Added **75.26.8, tag 0E0S, p. 66** at `refinement-polarization-locus`. This directly supplies universal pushforward of functions for geometrically reduced connected fibres, through 75.26.7. The rank-stratum citation remains 75.26.6, p. 65, used in degree zero with its universal scheme-valued condition. The supplier's already recorded rank-stratum erratum was not duplicated.
3. **General obstruction target.** The inherited `obstruction-vanishing` target concerns every proper geometrically connected nodal curve of pure dimension one. The refinement previously stated only the stable case. Its normalization sequence and Ext² vanishing now have the parent's full scope. Ext⁰ vanishing and the dimension `3g−3` remain conditional on stability and `g≥2`. The proof already supplies the general calculation; no new theory node is needed. The P¹ acceptance case has `h⁰(T)=3` and `Ext¹=0`, so applying the stable conclusions there fails.
4. **Completed deformation comparison.** Replaced **93.16.2** by **93.16.3, tag 0DZP, p. 28** wherever the argument needs local/henselian/completed deformation comparison. Lemma 93.16.2 is a gluing input. Lemma 93.16.3 gives the smooth global-to-local map and tangent-isomorphic smooth completion comparisons; **93.16.4, tag 0DZQ, pp. 28–29** gives unobstructedness under the lci hypothesis. The proof now explicitly uses formal smoothness, rather than inferring independent formal parameters from tangent surjectivity alone. Kept the completed-atlas statement explicitly stable after broadening the preceding obstruction target. Corrected the chapter title to *Deformation Problems* and recorded the supporting reading of 93.15.1, p. 27.
5. **Relative boundary receipts.** Corrected individual locators to **41.21.2 (0BIA), 41.21.3 (0CBP), 41.21.5 (0CBQ), 41.21.6 (0CBR), and 41.21.7 (0CBS), pp. 26–29**. Tag 0CBN identifies the section, not Lemma 41.21.2. Retained the J-2/Nagata hypothesis of 41.21.7; the finite-type Z charts satisfy it. Clarified that independent relative differentials correspond to a surjective relative tangent map. These absolute results do not discharge the relative coordinate/descent request Q6.
6. **Inherited-target map.** Added the Q8 stage supplier directly to `smooth-dimension`. Explained how the initially local graph representability theorem reaches the parent's global quasi-projectivity conclusion: properness and unramifiedness subsequently make the representing scheme finite, hence quasi-projective. Also retained the parent's marked-section corollary as closed evaluation equalizers on the separated target. Updated `obstruction-vanishing` to the corrected general scope. The strengthened finite conclusion is a later corollary, not an input to constructing the Isom scheme.
7. **API naming and reader.** Renamed the action-groupoid identity test to `identity_restriction`, separating its name from the API lemma. Synchronized all changed statements, hypotheses, proof steps, acceptance cases and citations in the reader. Removed blank lines between the target-resolution table's rows so it renders as a table. Added its accepted-review status and confirmed-erratum status.

No baseline citation was removed or replaced. No node was added, no parent ID changed, and the suggested Lean file required no edit.

## Mathematical checks

The twelve per-node receipts are in the packet's `review.checked` array. The following checks determine the main proof routes.

- **Hilbert locus.** The universal lowest-cohomology rank-one stratum is scheme-theoretic, so its functorial property tests nonreduced schemes. Removing the proper image of the evaluation nonisomorphism locus imposes descent of the line from the base. The determinant open tests the actual ambient coordinate restriction, rather than introducing a chosen basis. A polarization alone does not enforce completeness.
- **Frames and relation.** Under the invertible-quotient convention, a projective frame permits `O_C(1)≅ω³⊗f*L`; a trivialization of L is not part of the object. Q2 states exactly the missing generic relative comparison. The action relation is `U_g×PGL_r`, including stabilizers, with composition `h₂h₁`. The smooth-groupoid presentation uses SF.1's smooth case, and affine torsor descent uses its affine-group case. Neither depends on the separate general flat-groupoid bootstrap.
- **Bare Isom.** The product polarization restricts to `ω⁶` on a graph, giving `(g−1)(12n−1)`. This places the entire bare Isom functor in a single fixed-polynomial piece. Chosen polarization-line isomorphisms would change the functor by scalar data and are not introduced.
- **Deformations and completions.** The finite-type nodal conormal map is injective, so the cotangent complex has the required comparison with algebraic Ω. Sheaf Ext¹ is supported at the nodes, with the tensor product of the two tangent lines as fibre. Curve cohomological dimension and finite support give the general exact sequence and vanishing. Stability gives the normalization Riemann–Roch calculation. Continuous completed-node deformation theory is compared through the cited theorem; algebraic differentials of a power-series ring are not substituted for continuous differentials. Framed completions add `r²−1` variables after coefficient-ring base change. Q4 retains the finite-presentation and faithfully flat descent steps.
- **Boundary.** The finite unramified singular scheme splits étale locally into algebraic closed immersions by 41.17.3 (04HJ), p. 19. Their ideals, rather than arbitrary formal factors, become the node parameters after completion. Q4 and Q6 supply Cartier, smooth-intersection and relative-coordinate descent. The vertical divisor over a prime is excluded by relative smoothness.
- **Properness.** Read the proof of **32.15.3 (0208), pp. 41–42**, with 32.15.2, pp. 39–41. Its tests use actual source generic points and DVRs with exactly their residue field as fraction field. The dense smooth-curve open in the universal relation source therefore allows same-DVR smooth-generic uniqueness. Universal properness then descends to arbitrary pairs, including nodal generic curves. The later stack existence test instead uses **106.11.3 (0CQM), pp. 28–30**, permitting an extension field and dominating valuation ring with the diagram's 2-isomorphism retained. These tests are not interchanged.

The source files listed in the packet were downloaded independently; all eight SHA-256 hashes match. Every node locator was checked in those editions. The main Deligne–Mumford receipts are §1, pp. 76–85, Theorem 4.19, p. 103, and Proposition 5.1/Theorem 5.2, pp. 104–105. The arbitrary-base and coefficient-ring checks also use *Moduli of Curves* 109.19.1/3, pp. 19–21, 109.15.1, pp. 15–16, and 109.22.1/3/5/6/8, pp. 25–27. The generic requested contracts are distinguished from results proved by those passages. No restricted book, excerpt, PDF, or extracted source text was added to the repository.

## Baseline and reuse

All five declarations were read from their actual Lean modules at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; the downloaded modules agree byte-for-byte with the shared build sources. Tau Ceti remains pinned at `f790474821cf4256814db967cb154e7af3d0c369`.

| Declaration | Confirmed interface |
| --- | --- |
| `Polynomial.C` | Constant-polynomial ring homomorphism, `Algebra/Polynomial/Basic.lean`, lines 429–438. |
| `Polynomial.X` | Variable polynomial, same module, lines 478–480. |
| `Polynomial.eval` | Coefficient-ring evaluation, `Algebra/Polynomial/Eval/Defs.lean`, lines 249–251. |
| `AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite` | Proper plus locally quasi-finite implies finite, `AlgebraicGeometry/ZariskisMainTheorem.lean`, lines 373–380. |
| `AlgebraicGeometry.FormallyUnramified.of_hom_ext` | Hom extensionality for all affine square-zero thickenings, `AlgebraicGeometry/Morphisms/FormallyUnramified.lean`, from line 237. This is not by itself the geometric tangent criterion. |

Read the reviewed AUDIT-01 entries for R09.1/R09.2/R09.4/R09.6 and AUDIT-02 entries for the supplying StableReduction layers. None shows the planned Hilbert/moduli/deformation targets fully built. The exact supplier statements were checked, including A0-extension's universal rank strata, R09.2's Noetherian fixed-polynomial Isom construction, R09.6's coefficient/residue scope, SF.1's quotient/descent cases, and SF.4's deformation and curve-stack contracts. Stage-level imports have explicit requests rather than invented theorem IDs.

The current read-only roadmap checkout is `0d144d044dacebca17b654695b6f1ad58f159b27`, and the current Tau Ceti library is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Checked StableReduction and AlgebraicVectorBundles documents and suggested files, and the current finite-locally-free, fixed-rank, line-bundle, cohomology and model interfaces. Screened the nine newer roadmap directions for overlapping targets. The library has grown beyond the audit in vector bundles and scheme genus, but this packet imports those foundations rather than replanning them. No build or mutation was performed in either shared tree.

## Source issue and remaining assembly decisions

Confirmed `StableReductionPartII/E-MC1-001`: the proof opening of **107.5.5 (0DRJ), p. 11** adds the atlas-fibre dimension, although its statement and conclusion subtract it. Independently checked the hashed PDF, official HTML and current upstream TeX; the official tag has no correction comments. For the point stack, the identity atlas and A¹ atlas give different answers under addition and the same answer under subtraction. Added the required confirmed verdict to the existing finding, without filing a duplicate. No further source error was established.

The orchestrator should retain the two decisions already identified by the author:

1. Consolidate MC.1's terminal targets with SF.4's existing stable-curve-stack/Isom/algebraicity/smoothness owners. Use the unpointed proof refinements here and the n=0 specializations; do not create duplicate terminal declarations or circular dependencies on the results being proved.
2. Route Q1–Q8 to their named generic owners. The tier guide describes foundations as merged, but the supplied current checkout lacks the corresponding two roadmap directories. Reconcile that inventory before packaging; treat the available supplier packets as plans with their recorded gaps meanwhile.

These decisions are recorded frontier work, not an unresolved contradiction in the corrected pass. No issue outside this review was edited or claimed.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/StableReductionPartII--MC.1.json`: zero errors and zero warnings.
- `lean-check research/blueprint/suggested/StableReductionPartII--MC.1.lean`: exit 0 at the pinned shared build, with exactly nine `sorry` warnings and no other diagnostics. Available memory was 84 GB before compilation. The file contains one real-bodied light definition, five theorem signatures and four examples; elaboration is not a proof-completion claim.
- Packet/reader statements, APIs, tests, source locators, target-map entries, review-node coverage and allowed paths were checked together. The parent packet, suppliers and selected planet inventory are unchanged.
