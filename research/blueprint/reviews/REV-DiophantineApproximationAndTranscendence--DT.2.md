# Independent review of DT.2 proof inputs

**Job:** `REV-DiophantineApproximationAndTranscendence--DT.2` · **Issue:** #9278 · **Reviewer:** Codex, `codex-zqeh1C` · **Date:** 2026-10-13.

**Verdict: accepted.** This is a complete target-level planning pass, with DT.2 planned, five mathematical gaps and five supplier requests. Acceptance concerns the accuracy and honesty of the plan. It does not assert mathematical closure or formalisation. The planner was `codex-xsVFCL`; this reviewer did not write the original submission.

## Scope and counts

| Item | Result |
| --- | --- |
| Input nodes | 68 checked; 68 marked corrected because every locator/match was rewritten individually |
| Corrections beyond source metadata | 38 nodes |
| Nodes added or removed | 0 |
| Inherited DT.2 targets | All 100 ids checked against the parent; parent unedited |
| Pinned baseline declarations | 19 confirmed; none removed |
| Definitions | 5, with 34 API items and 16 discriminating tests in total |
| API/test additions | 9 API items and 1 dual-metric test |
| Source records | 18, including the planner’s unretrieved Roy–Thunder preview |
| Source issues | Original 6 independently confirmed, descriptions corrected where necessary; 2 added and confirmed |
| Open mathematical gaps / requests | 5 / 5, explicitly retained |
| Suggested file | 204 lines; two light definitions with real bodies; no admitted data |
| Lean check | Elaborated at the pins, exit 0; all 24 warnings are admitted proofs |
| Planets | No additions or changes; the parent’s six named planets retained |

The packet’s top-level review covers every node exactly once. Conditional targets were checked as conditional targets. The reader now carries each corrected statement, hypothesis, dependency, source match, API item, test and acceptance example.

## Mathematical corrections

The exterior determinant bound uses the p vector rows of a p×n matrix. Signed complementary minors prove dual subspace height equality; a real self-dual lattice theorem does not establish the general number-field Siegel determinant input. Compound products in lexicographic order are distinguished from the independently sorted compound minima. The final two largest products, truncation weights and lower factor N^(−npN) are explicit.

The symmetric-power metric now distinguishes tensor coordinates, coordinates in the dual basis and coefficients of the evaluated ordinary polynomial. For degree two, the dual basis vector ε_(1,1) has squared norm 2 and evaluates as 2X₁X₂; the functional for X₁X₂ has squared norm 1/2. Constructors and extensionality are planned, and a fourth test checks this conversion. This repairs the metric, while the corrected absolute-basis proof remains a gap.

Restriction-height estimates quantify over all independent restricted coordinate tuples and keep the strict Q-dependent bound. Quotient weights are defined by a weighted lexicographic basis and triangular elimination, rather than by raw complementary forms. The filtration bound uses the maximum individual form height B, with B≤√n H_L under the normalized hypotheses. The auxiliary polynomial constrains high-weight derivatives and includes the half-rank, degree-separation, field and transformed-height factors. Interval assembly uses half-open intervals.

The Product Theorem input now states positive block dimensions/degrees, characteristic zero, the common-component condition and the exact separation premise. The binary Roth proof includes the strengthened projection-support argument and its direct degree/multiplicity prerequisites. For m=2 the coarse coefficient has ratio 1 at the height boundary. Retaining the earlier m²+log 2 term gives ratio (4+log 2)/8<5/8. For m≥3 the factorial estimate gives ratio≤2m²(8/27)^m<1. Thus the weak height boundary has strict slack for every m≥2; it is not justified by continuity.

The finite-subset transfer uses the source’s optimal-cover witness: maximize the minimum sum of dimensions, then minimize the finite number of optimal covers. Logarithmic norm positivity is independently derived from fixed-field Northcott and rational approximation, with no claim that this is the ESS proof. The full absolute logarithmic sum is 2Ψ. Accordingly the cone choice is q=8n, its rank factor is (16n²+4)^r, and the large-height premise is on the group factor α. Fixed cone/place forms determine the omitted form. The corrected exponent is≤−1/(2n), including equality at n=2.

For small points, the packet proves the conservative specialization ε≤(2nθ)⁻¹ by norm-ball packing with centers represented by actual points of Γ. This supplies the parent theorem because its much smaller conic budget meets that premise. It is explicitly distinguished from AV’s stronger printed Corollary 1.4. The large/small split, enlarged cone count and final ESS/AV comparisons are all in the same height convention. Positive determinant parameters, the noncoset cut’s positive dimension and the refined stabilizer-invariant defining intersection are explicit.

Norm-form reduction separates the empty solution set and uses a finitely generated ℤ-submodule M. The homogeneous finite-rank unit argument requires characteristic zero. The block algebra includes the empty index case, where its scalar map need not be injective. Its universal-property and extensionality API, unit criterion and suggested examples are aligned.

The recurrence perturbation input uses homogeneous projective height h_proj, distinct from h(1:x) on the torus. Its proper relative cover is restricted to q≥3. For q=2, positive h_proj gives no solution under the perturbation factor, and the height-zero case can require the entire relation hyperplane. Degree lowering retains t≥3, 0<ℏ≤1 and E=16t²(a+1)/ℏ. Conjugate selection concerns the ratios selected by the determinant pattern and requires k,n≥2, T≥4. One-root and one-form cases are separate. The dependence and powered-height corrections to AV Proposition 2.5 are retained. The weaker explicit degree-height estimate includes the still-open low-degree comparisons.

## Sources and independent error verdicts

Every node has an individual match explaining whether the source supplies the statement, merely motivates an independent derivation, or quotes an input that remains open. Public primary texts were read at the locators now recorded. Formula images were checked where extraction lost inequality signs or tensor coefficients. Schmidt 2000 Lemma 1, p. 613, has the correct printed ≥; an extraction artifact is not reported as a source error.

The review could not retrieve the planner’s HAL AV2009 copy. It read the complete [36-page Basel author proof](https://edoc.unibas.ch/server/api/core/bitstreams/c591a881-406c-49dd-ad51-24bfb5b80bb9/content), dated 27 August 2009, and changed every AV2009 locator and hash accordingly. Historical HAL provenance remains separate. The original Roy–Thunder paper and rotation counterexample were checked, but the planner’s 1999 preview was not independently retrieved; no full erratum proof is claimed read.

| Issue | Independent result |
| --- | --- |
| E-DT2-1 | Confirmed: normalized zero-sum weights need not lie in the asserted cube; the simplex repair is scoped to ε≤1/10. |
| E-DT2-2 | Confirmed: ESS (11.19) substitutes a smaller perturbation coefficient than its hypothesis permits; the repaired AV route supplies the parent result. |
| E-DT2-3 | Confirmed: unweighted symmetric-power coefficients are not unitary invariant; the dual conversion was corrected. |
| E-DT2-4 | Confirmed: AV Proposition 2.5 needs dependent evaluated values. |
| E-DT2-5 | Confirmed: its non-torsion alternative bounds h(β^m), not h(β). |
| E-DT2-6 | Confirmed, with description corrected: the original already quantifies over all parameter sequences; the false implication is `(**)′ ⇒ (*)′`. Remark A of the erratum appends annihilator parameters to preserve Proposition 2 and Corollary 3. |
| E-DT2-7 | Added and confirmed: ESS (9.6), p. 828, omits the factor two in the full logarithmic error sum. |
| E-DT2-8 | Added and confirmed: AV Lemma 2.2, p. 390, has a false binary height-zero boundary for a proper cover inside its relation hyperplane. |

All descriptions are paraphrases; there are no source excerpts. The new findings retain their version scope and correction-search records in the packet.

## Baseline and supplier audit

All 19 names and active hypotheses were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Their individual independent confirmations record the important restrictions: fixed-field Northcott, degree-weighted height, integral ideal norm, reduced ordinary-unit coordinates, one-sided native recurrences, and the S-valuation kernel versus fullness. None was removed. API names for the two real-bodied definitions now match the suggested file.

The reviewed library audit and the current upstream tree were checked. Current GlobalNumberFields and Completed/EffectiveBounds were read with their relevant suggested statements; NumberFieldArithmetic’s class-group scope and the nine post-snapshot roadmaps were checked for duplication. The current pins are recorded in packet provenance. Existing places, ordinary units, class-group finiteness, Gram determinants and fixed-field counting are imports.

Generic intersection and Chow contracts now go to SF.5, without invented node ids in an unread supplier stage. The principal-power and finite-index S-valuation adapter belongs to current GlobalNumberFields Layer 2, using the native finite class group; GN.4 homogeneous dynamics is not its supplier. GN.1 receives the precise adelic upper-product and ball-section requests, which extend its real-lattice contracts. The generic Koszul request remains in SF.2. Higher-tier Heights/Arakelov contracts are not used to conceal an input.

## Validation and remaining work

`python3 scripts/check_blueprint.py research/blueprint/packets/DiophantineApproximationAndTranscendence--DT.2.json` reports 0 errors and 0 warnings. `lean-check research/blueprint/suggested/DiophantineApproximationAndTranscendence--DT.2.lean` exits 0; only admitted-proof warnings remain. These examples are proposed, admitted statements, not executable proofs of the roadmap.

Independent scratch checks compare every packet statement, hypothesis, proof step, acceptance example, source locator/match, API name and test against the reader; check all internal anchors and the 100 inherited target ids; confirm the two data definitions have real bodies; and check the metric counterexamples, exact cone exponent, Roth coefficient margins and numerical edge cases n=2,…,100, with ranks 0,1,2,10,100. The proof sketches also state the monotone bounds; finite numeric sampling is not used as their proof. Git whitespace and deliverable-scope checks pass.

No unresolved contradiction remains. The five precise gaps remain in the packet, reader and coverage remaining list: corrected absolute Siegel bases, arbitrary continued-value completion classification, arithmetic Bézout in the stated metric, explicit short-prime estimates, and the external inputs/low-degree checks for the explicit non-torsion bound. Resolve these and the five requested contracts in follow-up work before marking DT.2 closed. Assembly should preserve the parent’s 100 ids and use the corrected interfaces and height conventions. No additional decision from the orchestrator is needed to accept this review.

## Per-node change record

All nodes have a corrected locator and a non-generic source match. The following records further changes and the mathematical check for each node; the packet also has one independent verdict per id.

| Input | Changed fields beyond sources | Independent check/correction |
| --- | --- | --- |
| `dt2-place-normalization` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-exterior-local-norm` | statement | Corrected matrix orientation and the Lemma 17.1 locator. |
| `dt2-subspace-duality` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-subspace-intersection` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-plucker-northcott` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-rational-covolume` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-s-unit-log-lattice` | proofSteps, prerequisites | Moved the principal-power adapter to the existing number-field owner and made discreteness explicit. |
| `dt2-absolute-rescaling` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-roy-symmetric-metric` | statement, proofSteps, acceptance, api, tests | Distinguished the dual basis from ordinary polynomial coefficients; added constructor, extensionality and a dual-coordinate test. |
| `dt2-absolute-minkowski-reduction` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. Verified as a conditional planned target with the declared gap retained. |
| `dt2-minima-galois` | statement, proofSteps | Replaced the unsupported comparison of two form systems with the actual Lemmas 9.3–9.4 product and gap bounds. |
| `dt2-restriction-height` | statement, proofSteps | Added the full semistable quantitative-gap hypotheses, restricted-minor estimates and strict height conclusion. |
| `dt2-minima-local-bases` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-coefficient-approximation` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-davenport-flag` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-compound-minima` | statement, proofSteps, prerequisites | Separated lexicographic compound coordinates from sorted minimum products and included the compound-infima comparison. |
| `dt2-siegel-kernel` | prerequisites | Removed real self-dual-lattice imports that do not supply the number-field kernel identity; used Plücker duality explicitly. |
| `dt2-auxiliary-count` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-weight-net-repair` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-auxiliary-existence` | statement, proofSteps | Corrected high-weight vanishing and stated the half-rank, derivative and coefficient bounds. |
| `dt2-semistable-product-contradiction` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-weight-restriction-quotient` | statement, proofSteps | Stated restriction and quotient for arbitrary K-defined subspaces and distinguished the last exceptional flag member. |
| `dt2-semistable-minima-asymptotics` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-flag-height-bound` | statement, proofSteps, acceptance | Replaced determinant family height by maximum individual form height and corrected its test. |
| `dt2-quotient-interval-transfer` | statement | Corrected the complementary mean, form count, threshold and page references. |
| `dt2-interval-assembly` | statement | Preserved the half-open interval convention. |
| `dt2-multiprojective-degree` | prerequisites | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-index-multiplicity` | statement, proofSteps, prerequisites | Replaced the qualitative multiplicity claim by the exact normal-direction estimate. |
| `dt2-cycle-height` | proofSteps, prerequisites, api | Qualified the source match and added a Chow-representative constructor and invariance interface. Verified as a conditional planned target with the declared gap retained. |
| `dt2-arithmetic-intersection` | hypotheses, prerequisites | Made all Product Theorem hypotheses explicit. Verified as a conditional planned target with the declared gap retained. |
| `dt2-sharp-roth-boundary` | proofSteps, acceptance, prerequisites | Supplied the binary projection-support argument and its direct prerequisites. At the weak height boundary, kept the earlier m²+log 2 coefficient for m=2; for m≥3 checked the factorial margin. Both comparisons are strict. |
| `dt2-grid-roth-assembly` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-ratio-rank-exact` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-merged-nondegeneracy` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-unit-count-induction` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-progression-fibres` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-simple-zero-assembly` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-finite-field-cover-transfer` | statement, proofSteps | Replaced the vague dimension-pattern argument by the finite optimal-cover proof. |
| `dt2-symmetric-log-seminorm` | library, api | Independently verified the logarithmic seminorm identities and aligned the API names with the suggested declarations. |
| `dt2-log-norm-positivity` | Source metadata only | Identified Northcott plus simultaneous approximation as the independent replacement for the source Dobrowolski argument. |
| `dt2-cone-cover` | statement, proofSteps, prerequisites | Repaired the factor-two discrepancy using q=8n and the height-scaled covering domain. |
| `dt2-large-unit-height` | statement, proofSteps, acceptance | Used fixed predicted cone maxima, h(α), q=8n, and separate weight centering. |
| `dt2-toric-complexity` | proofSteps, prerequisites, api | Added witness, extensionality and scalar-extension APIs for the defining complexities. |
| `dt2-hilbert-multiplicity-bounds` | statement, prerequisites | Corrected the description of the invalid regularity implication and positive fat-point parameters. |
| `dt2-interpolation-determinant` | hypotheses | Made determinant parameters explicit and corrected its source pages. |
| `dt2-toric-translate-degree` | proofSteps, prerequisites | Used the refined defining intersection needed to retain isolated components. |
| `dt2-small-point-cut` | hypotheses | Restricted the noncoset cut to positive-dimensional V and corrected proof locators. Verified as a conditional planned target with the declared gap retained. |
| `dt2-small-point-degree-budget` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-small-unit-packing` | statement, proofSteps | Derived a conservative packing specialization with centers in Γ; the stronger noise premise suffices for the parent target. |
| `dt2-perturbation-cover` | proofSteps | Corrected the large/small split and propagated the larger cone count. |
| `dt2-refined-unit-counts` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-block-constant-algebra` | statement, acceptance, library, api | Handled the empty index set and aligned the light-definition API with the suggested file. |
| `dt2-norm-fixed-ideal` | statement | Separated the empty solution set before asserting an integral fixed norm. |
| `dt2-unit-linear-cosets` | hypotheses | Added characteristic zero and made the finite-rank argument a derived result rather than an incorrectly attributed theorem. |
| `dt2-norm-galois-descent` | Source metadata only | Corrected the associated-algebra locator and supplied its derived Galois-descent match. |
| `dt2-norm-finiteness-assembly` | statement | Specified that M is a finitely generated ℤ-submodule. |
| `dt2-polynomial-exponential-bridge` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-rational-perturbation` | statement, proofSteps, acceptance | Restricted the relative hyperplane cover to q≥3 and treated the false binary weak boundary separately. |
| `dt2-recurrence-degree-lowering` | statement, hypotheses, proofSteps | Restored the a+1 parameter, height range, and correct finite central-interval bound. |
| `dt2-recurrence-splitting` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-recurrence-conjugate-selection` | hypotheses, proofSteps | Restored the selected-ratio, branching, n≥2 and T≥4 restrictions. Verified as a conditional planned target with the declared gap retained. |
| `dt2-recurrence-class-modulus` | statement, proofSteps | Added the empty one-root case and the separate one-form count. |
| `dt2-finite-progression-obstruction` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-recurrence-refined-count` | prerequisites | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-height-zero-torsion` | Source metadata only | Corrected the source page and distinguished the native Northcott proof from the motivating source. |
| `dt2-finite-difference-basis` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. |
| `dt2-continued-place-completion` | Source metadata only | Statement, hypotheses and proof dependencies verified; source locator and individual match made precise. Verified as a conditional planned target with the declared gap retained. |
| `dt2-explicit-degree-height` | proofSteps | Made the low-degree verification needed for the weaker uniform bound explicit. Verified as a conditional planned target with the declared gap retained. |
