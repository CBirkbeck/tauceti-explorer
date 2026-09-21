# REV-RS-20 — independent review of Fargues–Fontaine ownership

**Verdict: needs_changes.** This is a completed independent restructuring review, not a claim that the mathematical blueprint or its proofs are complete.

Reviewer: ChatGPT Pro, session `cg-6b83f1`; review key `independent-review-REV-RS-20`. Date: 2026-09-21. Refs #839. The proposal was written by session `gpt-20260921-c74f2a`; I did not write it. This session's own RS-12 and RS-25 proposals are not reviewed here.

The two extensions of AdicSpaces are sensible, and the important integral/generic distinction survives. I applied seven specific amendments to the proposal, retained both roadmap identities and all seventeen stage IDs, and found one blocking construction-order problem: **RF3's global map to Proj needs a global-section covering argument which is not supplied before RF3.** Its proposed general supplier is downstream. This is not fixed by adding the reverse stage edge.

## 1. The blocking RF3/positive-twist boundary

The inherited node `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map` separates a purported assumption-free global map from the generation theorem. Its local formula is correct: a homogeneous section `g` trivializes a power of the line bundle on its nonvanishing locus, giving a map to the corresponding affine chart of Proj. But these maps glue initially on

`U = union of X_g, over all positive-degree homogeneous global sections g`,

not automatically on all of `X`. One must prove `U = X`. Quasicompactness gives a finite subcover only after a cover has been established. Nor is the degree-one tautological twist of an arbitrary graded ring automatically invertible with the asserted pullback.

This is visible in the actual source context. Fargues–Scholze, Proposition II.2.7, printed pp. 66–67, assumes sufficiently positive global generation and higher-cohomology vanishing. The paragraph adjoining the proof uses those hypotheses to obtain the finite cover and tautological line bundle. The proof's informal comment about a formal construction cannot be extracted as an unconditional global theorem. Stacks [27.14, tag 01NJ](https://stacks.math.columbia.edu/tag/01NJ) explicitly gives the morphism on `U`; [27.10, tag 01MM](https://stacks.math.columbia.edu/tag/01MM) explains the twist issue.

A concrete regression case prevents this mistake. On `X = P^1_k`, with `L = O(-1)`, every positive tensor power has zero global sections, while `H^0(O_X) = k`. Hence the section ring is concentrated in degree zero, its Proj is empty, and the nonempty `X` has no morphism to it. The cohomology calculation is Stacks [30.8.1, tag 01XS](https://stacks.math.columbia.edu/tag/01XS). This counterexample refutes the extracted no-hypothesis construction, **not** the Fargues–Fontaine algebraization theorem under its actual hypotheses.

The atlas has both `RF3 -> VB1` and `RF3 -> VB2:ampleness`; VB2:ampleness also requires VB1. Thus importing the complete VB2:ampleness stage back into RF3 creates a cycle. Before acceptance, choose an exact acyclic design: either give the needed covering/twist lemma an early owner and source proof which does not use the global map, or separate RF3's early line-bundle/graded-ring/chart-map portion from the global-map comparison after positive generation. In either design, retain the complete global-map target and transport its consumers. Do not merely weaken the goal to a partially defined map and count the old target as delivered.

The proposal now records this obligation explicitly rather than approving it. I have not invented a proof or an unregistered supplier. This is why the overall verdict remains `needs_changes` after the clear corrections below.

## 2. Amendments applied to the proposal

### A. A missing relative quotient input

Added `RelativeFarguesFontaine:RF1 -> RelativeFarguesFontaine:RF2:integral-divisors`. This stage covers Cartier-divisor realization and completions on all three of the integral period space, generic period domain, and quotient curve. Fargues–Scholze VI.1.2, printed p. 191, obtains the quotient-curve case through the Frobenius quotient. VI.1.4 also uses this reduction. The original full graph plus proposal had no RF1-to-integral-divisors path. The fixed-field F2 quotient and an abstract quotient formalism do not supply the actual relative quotient. The added edge is acyclic.

### B. The integral chart coordinate was inverted

The inherited `RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness` proof step has `t_1^sharp = [varpi]/pi`. In the `n = 1` chart of FS II.1.1, printed p. 48, the equation is **`t_1^sharp = pi/[varpi]`**. This matters: the chart inverts `[varpi]` and retains `pi = 0`. The corrected coordinate is defined, and becomes zero, on that fibre; the reciprocal is not defined there. The proposal now requires the correction when the inherited node is reconciled. Neither its ID nor its remaining proof obligations is discarded.

### C. Existing de Rham carriers must be reused

Fresh pinned-source inspection contradicts one claim in the author's report. `Mathlib/RingTheory/Perfectoid/BDeRham.lean` already defines both `BDeRhamPlus` and **`BDeRham`**. The former completes the localization of Witt vectors along the kernel of `fontaineThetaInvertP`; the latter localizes it at the images of generators of that kernel. There is no `FontaineThetaKer` declaration in that file.

The proposal now explicitly requires reuse or canonical comparison in the matching mixed-characteristic p-typical specialization. This is a positive carrier fact, not a theorem that the kernel is principal or that the resulting ring has all the desired geometric properties. Extending theta, proving the DVR theorem, the relative filtration, and all topology/plus-ring comparisons remain real work. When `p = 0` in the input the absolute definitions give the zero ring; they do not replace the retained integral characteristic-p period ring. The original author's report is left unchanged as provenance; this review supersedes its baseline statement.

I also checked that `WittVector.isAdicCompleteIdealSpanP` proves p-adic completeness under perfectness and characteristic-p hypotheses, not completeness of the two-generator Huber topology. `WittVector.lift` in `Truncated.lean` is the inverse-limit universal property for compatible maps into truncated Witt vectors, not the strict-lift theorem. The author's warning about that latter mismatch is correct.

### D. Collision is not an ordered-leg splitting obstruction

The inherited `RF2:integral-divisors/div-d-moduli-v-sheaf` acceptance text asks for a splitting cover needed for a doubled leg. A **specified** double divisor `2D` already has the ordered presentation `(D,D)`. Its equation `xi^2` tests multiplicity and nonreduced structure, not a necessary failure of global splitting. A genuine ordering/descent test must use suitable unsplit unordered data. The general v-sheaf quotient and invertible-ideal descent in FS VI.1.1–VI.1.2 remain necessary; the amendment does not identify sheaf quotients with pointwise orbit sets.

Useful complementary tests are the nonzero nilpotent in `k[[t]]/(t^2)` and the equivalence of the `t`-adic and `t^2`-adic completion systems by cofinality. The completion carrier alone does not remember the divisor's multiplicity. Preserve that multiplicity in the ideal/degree data.

### E. Use the existing raw coefficient node, not an aggregate

The raw coefficient theorem is already identified as `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`. I made that exact reference explicit in the integral-Y contract. The completed RF0 stage depends on its children; it is not their input. This does not require moving the raw node: declaration prerequisites need not inherit every completion prerequisite of its parent stage. Do not blindly collapse that distinction when checking the refined graph. The strict-lift proof itself is still an honestly recorded source obligation.

### F. Separate rank-one descent from the full isocrystal functor

The inherited `RF3/isocrystal-line-bundles-and-sign` node includes the full arbitrary-rank exact tensor functor from isocrystals to bundles, whereas the VB1 description explicitly constructs that same functor. This overlap was absent from the original ownership list.

RF3 now retains direct rank-one Frobenius descent, integer `O(n)`, their tensor/dual/divisor API and the eigenvalue normalization. VB1 is the unique owner of the general exact tensor functor and rational-slope comparison; it proves agreement with that earlier rank-one construction. The source distinction is FS II.2, printed p. 58. Keep the inherited node's identity as a reference while the orchestrator splits its proof payload; do not delete the general theory.

Added idempotent VB1 forwarding directives to BG0, VS1 and VB2:ampleness, all already valid native dependencies. VB1 itself receives its own general construction, so no self-edge is added. `suppliedBy` here names the owner of the removed general subproblem; it does **not** request the completed VB1 stage as a prerequisite for RF3's retained rank-one definition. That reverse edge would be circular.

### G. Gate the global Proj claim

RF3 retains the full map target, but its contract now states the covering and tautological-twist obligations from section 1. Those are not silently replaced with a dimension count or a claim of formal automatic gluing. The unresolved owner/proof split is explicitly reflected in the top-level negative review verdict.

## 3. All twenty-four family evidence rows

Numbers below follow `RS-20.json.evidence` in its original order. A reverse row is not independent evidence. A6 denotes the unchanged AdicSpaces Layer 6.

| Rows | Comparison | Review result |
| --- | --- | --- |
| 1, 13 | F0 / RF0 | Fixed-field Witt/Huber objects belong to A6; general coefficients remain RF0. |
| 2, 16 | F0 / integral-Y | Reject the claimed identity: the integral space retains `V(pi)`, while the fixed generic space removes it. |
| 3 | F0 / A6 | Exact import of the fixed adic construction; F0 keeps diamondification interfaces. |
| 4, 17 | F1 / integral-Y | Different products, over `Spd(Q_p)` and `Spd(O_E)`; comparison only after generic restriction. |
| 5 | F1 / A6 | Witt input is not the marked-untilt functor-of-points theorem; keep F1's new comparison. |
| 6, 19 | F2 / RF1 | Fixed diamond quotient versus its relative extension; keep both with exact specialization. |
| 7, 8 | F2 / A6 | A6 owns the adic quotient; F2 owns the generator-sensitive effective diamond relation. |
| 9, 20 | F3 / RF1 | D6 owns the general site theorem; F3 and RF1 prove their different instances and cocycles. |
| 10, 22 | F4 / integral-divisors | Import the fixed-field analytic seed, not an unjustified all-E/all-base theorem. |
| 11, 23 | F4 / untilts | Preserve the limited fixed-field comparison and the additional relative/ramified work. |
| 12, 24 | F4 / RF3 | Actual divisor data supply a line bundle; they do not automatically supply all graded-ring or global-map facts. |
| 14 | RF0 / A6 | The all-E strict-lift extension retains its full generality and compares to the fixed case. |
| 15 | annuli / A6 | Fixed strong noetherianness cannot be transported to arbitrary relative rings. |
| 18 | integral-Y / A6 | The common coefficient specialization is imported; the retained special fibre is new. |
| 21 | RF1 / A6 | Fixed quotient specialization is an input, not a replacement of relative quotient/sheaf/base-change proofs. |

No anchor document or anchor stage is changed. Both extension titles use the anchor title followed by Part II. Their introductions must continue to specify the fixed-Q_p-field endpoint of the base rather than suggesting that it already contains relative integral geometry or diamonds.

## 4. Target and consumer conservation

All seventeen stage IDs remain. The original nine narrowed scopes retain their substantive content: F0, F2, F3 and F4 keep their comparison APIs; RF0 and its annuli keep general coefficients/topology; RF1 keeps the relative quotient; untilts keeps the generic interpretation; G-torsors keeps concrete Tannakian patching. RF3 is the tenth narrowed scope after removing duplicate ownership of the general isocrystal functor. Its complete global-map goal is retained but not approved as closed.

F1 and F5 stay distinct early and late branches. Integral-Y retains charts, plus rings, root extension, sheafiness, the integral product and gluing. Integral-divisors retains every degree, ordered equations, unordered ideal descent, collisions, local affineness, vector-bundle descent, thickenings and completions, now with its actual relative quotient input. The RF2 and RF4 aggregates add no independent construction. Linear patching remains independent of the completed G-torsor or Grassmannian developments.

The original 24-node ledger is preserved as a ledger of mathematical targets, **not** as an instruction to preserve known false sentences. Specifically reconcile the chart reciprocal, double-leg test, RF3 general-functor payload and global-map proof. The original move of the all-base closed-Cartier proof before degree-d products remains necessary. Keep the finite-projective versus G-valued/Grassmannian portions of the patching nodes separate. No underlying decomposition file is edited by this review.

All 21 native external exports are retained individually in the proposal:

| Producers | External consumer | Count |
| --- | --- | --- |
| RF4:vector-bundles | AInfCohomology:AI.2 | 1 |
| RF0, RF1, RF2, RF3 | BunGAndNewtonStrata:BG0 | 4 |
| RF4:G-torsors | BunGAndNewtonStrata:BG2:uniformization | 1 |
| integral-Y, integral-divisors, untilts, RF4:G-torsors | GeometricSatakeAndFusion:GS0:loop-geometry | 4 |
| integral-divisors, untilts, RF4:G-torsors | HeckeStacksAndLocalShtukas:HS0 | 3 |
| RF4:G-torsors | HeckeStacksAndLocalShtukas:HS2 | 1 |
| RF2, RF3 | VStackSheavesAndLisseCategories:VS1 | 2 |
| integral-Y | VectorBundlesAndIsocrystals:VB0 | 1 |
| RF1, untilts, RF3 | VectorBundlesAndIsocrystals:VB1 | 3 |
| RF3 | VectorBundlesAndIsocrystals:VB2:ampleness | 1 |

The recipient descriptions were read, including the linear finite-free BKF requirement, torsor-recognition versus uniformization, integral versus generic group models, local shtuka bounds, and the later cohomological section functors. Preserve all original atlas edges: the proposal's links are additive/idempotent directives, not a replacement graph.

## 5. Actual checks and source scope

The mathematical snapshot is the repository Pages artifact at commit `7de7e5d38cea81cf2d4a14c25ad69e93e203f494`, run `35617180571`, artifact `10646855192`. GitHub comparison against claim-time main `5d7402a7a8967258682d6f55d8bb3c448066842e` showed only queue-generation/issue-mapping and an unrelated naming result changed. No reviewed mathematical input changed in that comparison.

Read both complete member documents, the complete AdicSpaces anchor, all member stage descriptions, the family evidence, the author's report, the 24-node inherited decomposition and its gaps, and the relevant supplier/consumer descriptions. Inspected all seven pending link-map entries touching the family. The reviewed coverage file still lists AUDIT-37 and AUDIT-39 as pending and contains no reviewed member-stage verdicts. Their separate result files were used only as leads. This review does not promote their broad absence claims into verified implementation statements.

Fresh primary checks used the [Fargues–Scholze author PDF](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf): II.1.1–II.1.4 (printed pp. 47–50), II.1.15–II.1.21 (pp. 54–56), the isocrystal normalization (p. 58), the Perf_k comparison (p. 61), II.2.7 (pp. 66–67), and VI.1.1–VI.1.4 plus divisor completions (pp. 190–192). Formula pages were inspected visually, not inferred from corrupted extracted fractions. The Stacks pages cited above were read as HTML. Access date: 2026-09-21. No fresh PDF byte hash was computed.

Pinned library reads use Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`: `RingTheory/Perfectoid/BDeRham.lean`, `RingTheory/WittVector/Complete.lean`, and `RingTheory/WittVector/Truncated.lean` lines 412–470. Tau Ceti's planning baseline remains `f790474821cf4256814db967cb154e7af3d0c369`; no fresh exhaustive Tau Ceti declaration audit is claimed.

Input blob checks:

| Input | Git blob |
| --- | --- |
| FarguesFontaineDiamonds README | `ee998d430c485522dcb6de5a415545566ead0110` |
| RelativeFarguesFontaine README | `22728183aab6d9a584abafd2ea807a9ab9f6e2c5` |
| AdicSpaces README | `a2b9e3da3abd1baa92cc317afe4fd7612c3f3b97` |
| Inherited RelativeFarguesFontaine decomposition | `ce1bc300f98ebfe64eeec12eae154049cd98b0f0` |
| Original RS-20 report | `0a0843005fe8d572821e51eba4d8916b2da075f1` |
| Reviewed library coverage | `5e708cfc74a51b10e62149113872fe4e00eb5846` |

Validation actually run:

- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-20.result.json`: **ok**.
- All 17 member stages, 16 unique ownership scopes and 79 unique non-self links have known endpoints; no anchor layer is edited.
- All 21 external exports and 43 non-self supplier-to-original-consumer forwarding checks pass. The three new VB1 directives retain existing inputs; only the quotient-to-integral-divisors link is new to the native atlas among the four additions made by this review.
- Full native graph: 1,968 stage records and 3,508 unique edges. With the proposal and upstream sentinel vertices: 2,019 vertices, 3,551 edges, acyclic. There are 43 proposed edges not already native.
- The union with all 713 pending link-map rows is also acyclic. This tests link maps, not the automatic composition of every unaccepted restructuring proposal.
- Negative path tests retain the early/late boundaries: F5 does not precede integral-Y; neither G-torsor patching nor loop geometry feeds its own prerequisites; untilts does not precede integral-divisors; the completed RF0 aggregate does not precede its integral child.
- Adding the tempting `VB2:ampleness -> RF3` edge creates a cycle, as expected.

These are real schema/graph checks, not a certificate that a local formula defines a global map. No Lean file belongs to this review and **Lean was not run**. No git commands, manual merge, issue closure, label changes, implementation claims or atlas promotion were performed.

## 6. Handoff

The review is complete with a negative verdict. Do not apply RS-20 as accepted until the RF3 covering/twist dependency and its exact owner are resolved. Retain the clear amendments already made and all 17 stages. The author/orchestrator must reconcile the specified inherited node payloads, then test the refined dependencies, not merely the coarse stage DAG, and recheck against current main.

The known Far20b degree-characterization input, the full Beauville–Laszlo/effectivity proof, the sousperfectoid and vector-bundle descent sources, and the Gabber–Ramero edition/numbering mismatch remain open source obligations. This review does not assert that they have been fully transcribed. They are distinct from the newly identified Proj construction-order blocker.
