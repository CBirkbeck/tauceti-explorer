# Independent review of Drinfeld modules and t-modules, Part II

Accepted on 19 October 2026 by Codex, session `codex-GTDhJk`, for issue #3519 and job `REV-DESIGN-DrinfeldModulesAndTModulesPartII`. This session did not write the design under review. Acceptance is of a finished target-level planning pass under PROTOCOL §0; the three explicit gaps remain. Nothing is claimed formalised.

The review checked every node's statement, hypotheses, source match, proof sketch, prerequisites and acceptance conditions. It checked all APIs and unit tests, every baseline declaration at the recorded pin, all imported parent suppliers, stage coverage, and the suggested Lean file. Corrections are applied to the packet and reader, with the layer descriptions and Lean comments reconciled where needed.

## Counts and coverage

| Item | Result |
| --- | --- |
| Layers | Six, MZ.0–MZ.5; all planned, none closed |
| Nodes | 68: 14 definitions, 7 constructions, 47 theorems |
| Node verdicts | 51 verified, 17 corrected, none unverifiable |
| Added or removed nodes | None; proof repairs fit the target-level nodes |
| API items / unit tests | 131 / 85; every definition and construction has at least three discriminating tests |
| Planets | 24; mathematical objects and named results, with their packet targets retained |
| Baseline citations | Ten confirmed; none removed or replaced |
| Prerequisite edges | 13 baseline, 200 within the packet, 44 to 17 distinct parent nodes |
| Sources / source findings | 14 sources; 23 findings, all independently confirmed |
| Gaps / requests | Three / zero |

MZ.0 has 14 nodes, MZ.1 eight, MZ.2 thirteen, MZ.3 twelve, MZ.4 seven and MZ.5 fourteen. Each layer target is represented. Remaining proof refinements are appropriate to target granularity, rather than missing lemma nodes. The three recorded gaps terminate the affected prerequisite chains and prevent calling those stages closed.

## Corrections applied

Node names below omit `DrinfeldModulesAndTModulesPartII:`. The packet's `review.checked` gives a verdict and explanation for all 68 nodes, including those unchanged.

| Node | Correction and evidence |
| --- | --- |
| MZ.0/power-sum | Complete the empty truncated sum convention for every integer degree, and restrict the formula involving ℓ_d to nonnegative d. Include a negative-degree test. This makes the domain total and retains the depth-one factorisation at d = 0; compare Ngo Dac §2.1, pp. 5–6, and CCM Definition 2.2.2, pp. 7–8. |
| MZ.0/multiple-zeta-value | Add the parent's DM.6/small-power-sum and DM.2/carlitz-exponential inputs used for ζ_A(1) = log_C(1). |
| MZ.0/weight-spaces | Replace the insufficient argument using the period alone by ρζ_A(1), where ρ^(q−1) = −θ. For q > 2 its fractional valuation excludes membership in K_∞. Add the nonvanishing and period suppliers. |
| MZ.0/eulerian | Use the explicit union of finite constant-field Laurent series fields inside C_∞. Do not identify it with all Laurent series over the algebraic closure of the constants. The integer-valuation obstruction remains valid; compare CCM Lemma 5.1.1, pp. 22–24. |
| MZ.1/realisation-maps | Give the empty truncation its value for every integer degree, consistently with MZ.0. The difference-of-truncations identity remains restricted to positive-depth indices. |
| MZ.1/power-sum-products | Cite and use Thakur's corrected simultaneous induction: prove the mixed-degree case before the equal-degree case at each depth. Read the author's updates, entry 36, pp. 7–8; credit Shuhui Shi. Add source finding E23. |
| MZ.3/deformation-entire | Under Chang's whole-tuple decay condition, prove convergence of initial sub-tuples by shifting their indices and appending fixed indices. Apply the parent's entire-solution theorem to the first column. Retain the termwise bound for arbitrary consecutive sub-tuples; compare Chang Lemma 5.3.1, pp. 14–15. |
| MZ.3/index-dual-motive | Restore the factor t − θ in the lower-left entry of the depth-one acceptance matrix, as required by its Frobenius equation. |
| MZ.3/mz-property | Make the same depth-one correction in the MZ-property witness; compare Chang Definition 3.4.1, pp. 8–9. |
| MZ.3/mz-property-values | Prove the assertion on Chang's larger domain through the first-column construction, rather than requiring convergence of every tail in the full period matrix. Correct the weight-(q−1) witness subdiagonal. Compare Chang Lemmas 5.3.1 and 5.3.5 and Proposition 5.4.1, pp. 14–16. |
| MZ.3/eulerian-tails | Collect repeated indices and discard zero coefficients before claiming an isolated tail is nonzero. State the factorial-weighted MZV suffix combination. Suffix independence is needed to infer its nonvanishing; compare Ngo Dac §5, pp. 20–21, and IKLNDP Theorem 2.4, pp. 21–25. |
| MZ.4/solution-space-dimension | Record the actual 2ℓ − m unknown count in the local-ring argument; CCM Theorem 4.3.5, pp. 17–20. Add source finding E22. |
| MZ.4/twisted-system-solutions | Make the reduced support an explicit hypothesis. Polynomial solutions on an arbitrary chosen support are rationally proportional when they exist; their localised span has dimension at most one. Do not assert existence on every support or describe polynomial solutions as a vector space over the rational function field. Compare the proof of IKLNDP Theorem 3.4, pp. 37–42. |
| MZ.4/two-row-system | Add the endpoint check q = 3, w = 4, a_1 = t³ − t, a_2 = δ_2 = 0, δ_1 = (t − θ)^6. This is a nonzero solution. The packet's endpoint family was already right; correct the contradictory layer description. Compare Ngo Dac (6.3)–(6.4), pp. 23–24. |
| MZ.5/q-indivisible-independence | Supply strong induction for both prefix and suffix independence before applying the Eulerian suffix argument. This justifies nonzero suffix combinations and the reduction to the two-row system; Ngo Dac Theorem 6.2, pp. 23–24. |
| MZ.5/acmpl-period-relations | Induct on the full lower-weight normalised-period relations theorem, including its constant term, to obtain both suffix-character and suffix-weight restrictions. Embed supports in one finite ambient family before using proportionality. Construct the relation with nonzero constant term before excluding homogeneous relations. Compare IKLNDP Theorem 3.4, pp. 36–42. |
| MZ.5/amzv-small-weight-bounds | Replace the unspecified computation by the support reductions and bounded-degree coefficient comparisons in the companion Note, §§5.1–5.8, pp. 15–29. Add character splitting, monic descent, the degree bound and the two-row system as direct suppliers. Keep the stated range at w ≤ 3q − 3. |

The layer descriptions also now require every argument to be nonzero for polylogarithm nonvanishing (Chang Remark 5.1.5, p. 13). The strong Brown matrix is square on AT rows and columns, of size t(w), with diagonal entries ±1 modulo D_1; its left-side AS contractions can repeat. It is not a rectangular transition matrix between index families of different cardinalities (IKLNDP Theorem 1.11 and proof, pp. 18–20). The Frobenius prefix system sums immediate children, and IND° includes the condition that no entry is divisible by q (CCM Definition 4.3.1, pp. 15–16).

The reader retains the full statements, hypotheses, proof sketches, APIs, tests, acceptance checks, locators and dependencies. The suggested file's comments distinguish its nonalternating prototypes from the array prototypes and explain the analytic and solution-space boundaries. No heavy carrier or construction has been introduced into Lean.

## Sources and source findings

All source descriptions are in our own words. The packet identifies exact editions, URLs, read sections and PDF hashes. Fourteen sources were consulted, including the added author corrections list; there are 17 version/access records, counting two Cambridge published comparisons and the Annals landing-page access limitation.

The main proof checks used Ngo Dac's [HAL manuscript](https://hal.science/hal-03298790v1/document), §§2–6, pp. 5–24; [Chang–Chen–Mishiba v2](https://arxiv.org/pdf/2205.09929v2), §§2–5 and Appendix A; [Im–Kim–Le–Ngo Dac–Pham v2](https://arxiv.org/pdf/2205.07165v2), §§1–4; and their [companion Note v3](https://hal.science/hal-04240841v3/document), especially §§4–5, pp. 12–29. Chang's [2014 preprint](https://arxiv.org/pdf/1207.2326), §§3–5, supplies the descent and first-column MZ-property arguments. ABP Theorem 3.1.1 and Proposition 3.1.3, pp. 7–10, and Papanikolas §4.1.6, p. 22, were checked against the imported interfaces. The remaining cited primary papers were read at their node locators, rather than used as substitutes for missing proofs.

All 21 original source findings were independently checked and confirmed. E22 is the matrix-size slip in CCM's proof of Theorem 4.3.5, point (iii), p. 18: its two blocks have ℓ − m and ℓ entries, so the size is 2ℓ − m. The displayed example on p. 19 has size 12 when ℓ = 7 and m = 2, rather than 10. E23 records the known faulty equality in Thakur's Theorem 3 proof, p. 1979, and the replacement induction in his [updates](https://www.sas.rochester.edu/mth/sites/dinesh-thakur/updates.pdf), entry 36, pp. 7–8, credited there to Shuhui Shi. Neither finding changes the intended end theorem.

The published Cambridge PDFs were obtained for the CCM and IKLNDP comparisons. CCM's published formula (2.5) fixes the divisibility-index slip E3, so its `known` field now says so. The published Remark 1.6 retains E13's field-subscript slip; the published Corollary 1.8, p. 4, retains E14's algebraic-closure span with dimension over the smaller field, also checked visually. Published IKLNDP condition (3.1), p. 21, retains the whole-tuple condition relevant to E8; the corrected plan uses the stronger condition for a full tail matrix and the first column for Chang's general-point result.

The Annals publication page for Ngo Dac was accessible, but its PDF did not serve readable text in this review. ND21 findings therefore remain explicitly about the HAL manuscript, without attributing the same typesetting to the published paper. The packet records this limit. Searches for existing corrections are recorded per finding; E23 is known, and E3 is corrected in the version of record.

## Baseline, ownership and closure

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, the actual source statements confirm `Composition`, `Polynomial`, `Polynomial.Monic`, `RatFunc`, `RatFunc.inftyValuation`, `RatFunc.CompletionAtInfty`, `Submodule.span`, `Nat.choose`, `FiniteField.sum_pow_units` and `Finsupp`. None was removed. The last theorem uses a natural exponent; its `provides` field now explicitly explains that inversion on the finite unit group handles the negative powers used here. Tau Ceti's recorded pin is `f790474821cf4256814db967cb154e7af3d0c369`.

All 17 distinct parent suppliers were read against their 44 uses, including the signed Carlitz products, π̃ = 1/Ω(θ) normalisation, exponential/logarithm, small power sums, entire-solution criterion, ABP determinant hypothesis and splitting/descent interfaces. The corrected matrices respect those conventions. The reviewed Drinfeld library audit (AUDIT-20), current Tau Ceti function-field library, and current upstream ArithmeticDirichletSeries and AlgebraicCurves documents and suggested files were checked for ownership. No duplicate target or ownership move was found; no new request is needed.

The three gaps are retained precisely:

1. General-q power-sum degree monotonicity, needed for nonvanishing outside the small-exponent range. The CMPL route to the end theorems does not use it.
2. The proof of Anderson–Thakur interpolation, needed by the general MZV period route. Its statement was checked in Chang Theorem 5.5.1, p. 18, but the original interpolation proof was not reread. The gap no longer makes an unsupported claim that the sources are unavailable.
3. v-adic MZVs and the Chang–Mishiba homomorphism, needed only by the v-adic upper-bound corollary.

The orchestrator should retain these as follow-up inputs rather than interpret acceptance as closing them. There is no other unresolved question or contradiction, no source excerpt to preserve, no owner change, and no added node to route.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/DrinfeldModulesAndTModulesPartII.json`: zero errors and zero warnings.
- Intake file checks on the six deliverables, `scripts/check_sorry_data.py`, source-version validation, reader synchronisation assertions and `git diff --check`: passed.
- `lean-check research/blueprint/suggested/DrinfeldModulesAndTModulesPartII.lean`: exit 0 at the pinned shared build, 59 warnings, all for `sorry`; no errors or other warnings. The file has 607 lines and no sorry-bodied data definition.

The review is complete. The handoff records the remaining mathematical gaps and the packaging boundary; it is not a checkpoint.
