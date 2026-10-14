# Independent review: AnalyticNumberTheory

**Verdict: accepted.** This is a complete target-level planning pass under the 300-node budget, with explicit proof boundaries. Acceptance concerns the correctness of the corrected plan; its 58 gaps remain open and no formalization is claimed.

Job REV-AnalyticNumberTheory, issue #9404. Reviewer: Codex, session codex-MFZ11h, 14 October 2026. The original assembled plan was written by Claude, session claude-PVmOyA. This session wrote neither the plan nor its predecessor parts.

## Inventory and scope

| Item | Reviewed total |
|---|---:|
| Targets | 239 |
| Theorems / definitions / constructions / comparisons | 148 / 43 / 33 / 15 |
| Verified / corrected / added targets | 221 / 15 / 3 |
| Proof ingredients | 263 |
| Pinned baseline declarations | 230 |
| Definition and construction API items | 317 |
| Adversarial unit tests | 261 |
| Planets | 41 |
| Supplier requests / distinct supplier endpoints | 52 / 41 |
| Explicit proof gaps | 58 |
| Routed paper items | 91 |
| Confirmed source findings | 51 |

AN.0, AN.1 and AN.6 remain closed because RS-07 dropped them and assigned their mathematics to existing owners. The seven retained layers have 40, 17, 48, 46, 15, 25 and 48 targets respectively. Every target, proof ingredient, baseline declaration, request and source finding was checked. Each definition and construction has at least three tests. The packet's `review.checked` gives a verdict for every target.

The reader now contains the full target statements, hypotheses, proof sketches, API, tests, checks and worked cases, locators and direct prerequisites. Its proof-ingredient index now gives the actual arguments and hypotheses, rather than only an inventory. This is organized by the roadmap's mathematical targets, not as a sequential summary of any source.

## Corrections and additions

| Target | Change and reason |
|---|---|
| AN.7 `barnes-g-function` | The entire product fixes the normalization; G(1)=1 and the recurrence alone do not uniquely determine G. Restrict the pointwise recurrence to points away from Gamma poles, since Mathlib totalizes Gamma at those poles. Correct the logarithmic-derivative domain, give its finite value at G(1), add the positive-real API and a pole counterexample. DLMF §5.17, (5.17.1), (5.17.3)–(5.17.5). |
| AN.2 `paired-product-strict-derivatives` | State every hypothesis independently: entire, nonzero, order at most one, parity, imaginary zeros, eventually positive on the positive axis, and nonpolynomial. Record the origin multiplicity. A negative multiple of cosh defeats an omitted sign hypothesis; polynomials defeat strict positivity at all orders. Yun–Zhang Appendix B, Proposition B.1, pp.902–903. |
| AN.4 `artin-euler-series` | Carry the finite Galois extension and representation in the statement/API. Remove predecessor numeric references that now point at Bost–Connes targets. |
| AN.4 `brauer-meromorphic-continuation` | Replace the stale numeric proof references with the named induction ingredients and the needed Hecke analytic contract. |
| AN.5 `halasz-coefficient-class` | ArithmeticFunction examples are zero at index 0; the unit and norm twists have the intended values at positive integers, including 1. |
| AN.5 `halasz-integral-bound` | Import the newly owned Shiu and Mangoldt-window targets, replacing higher-tier SV.1 prerequisites. Keep the sieve/Fourier adapters open. |
| AN.5 `dickman-fixed-u` | Correct the locator to the unnumbered fixed-u limit preceding Hildebrand–Tenenbaum (1.5)–(1.6), p.414. |
| AN.5 `moment-model-comparison` | Define its constants through the new AN.5 target and cite Keating–Snaith (4)–(19), pp.59–61. Remove the higher-tier PM.5 prerequisite. Keep the general moment asymptotic conditional. |
| AN.9 `bc-completed-gibbs` | Depend on the completed KMS predicate and the completed Gibbs state, rather than a coefficient state that is irrelevant to this proof. |
| AN.9 `bc-completed-coefficient-state` | The completed coefficient state uses the completed KMS predicate. |
| AN.9 `bc-completed-kms` | Define this predicate before the coefficient-state theorem; remove the backwards prerequisite. |
| AN.9 `shifted-entire-determinant` | JSS §4 (4.2)–(4.6), pp.13–15 supplies heat regularization and removal of zero modes. Its (4.4) is not a canonical-product theorem. Mark the canonical product as derived here using Weyl summability, two derivatives and the finite-part normalization. |
| AN.9 `shifted-finite-determinant` | Correct the same source attribution; the finite determinant/product comparison is a benchmark derived in the packet. |
| AN.3 `uniform-complex-stirling` | Correct the worked Gamma quotient power to (α+β−1)/2; the stated range gives at most 1/2. |
| AN.3 `von-mangoldt-explicit-formula-and-pnt-error` | Add checks for the two newly recorded slips in Kedlaya Lemma 9.2, p.54. The target already had the correct constant and trivial-zero terms. |

Three added targets carry `addedBy: REV-AnalyticNumberTheory`:

- **AN.5 `shiu-short-interval-bound`.** State Shiu's reduced-progression estimate for C(κ), including κ>0, the short-interval range and modulus bound. The divisor domination gives Shiu's growth hypotheses. His Lemma 2 quotes an external Selberg-sieve proof, so that proof adapter remains a gap. Shiu, Theorem 1 and proof, pp.161–170.
- **AN.5 `mangoldt-short-window-bound`.** State the window bound for T≥1 and m≥T². Use rough-number C(1) weights and the newly local Shiu bound for primes, then bound higher prime powers separately. The Fourier support and Plancherel normalization remain formal adapters.
- **AN.5 `zeta-moment-constants`.** Define the real-k generalized-binomial coefficients, arithmetic Euler product and Barnes ratio; give positive-convergence API and the k=1,2,3 checks. Keating–Snaith (4)–(19), pp.59–61. The model remains a conjecture and the primary second/fourth-moment proofs remain gaps.

These changes remove three higher-tier supplier requests, leaving 52. AN.7's Barnes target must precede AN.5's moment constants in the build graph; layer numbers remain stable atlas identifiers. The full internal graph is acyclic.

Fifteen proof-ingredient records were corrected. The three Artin records, quadratic Landau contradiction and analytic-root record now use semantic dependency names. The Mangoldt mean-square record uses the local window target. The fixed-u smooth decomposition uses p.414. Bost–Connes amenability is the remark on p.433; the entire-core KMS identity is Connes–Marcolli (3.19), p.450; Eisenstein covariance is (3.117), p.469, with projection Lemmas 3.27–3.28 on pp.464–465; Neshveyev Lemma 2.3 is p.4. Blomer (29) is pp.361–362. The Selberg Laplace integral requires both Re w>0 and Re(w²)>0 before continuation; the continued formula has its separately stated domain. The two shifted-product records use the corrected JSS attribution.

The reader's progression sum is defined for every residue class; coprimality is a theorem hypothesis. Both upstream README URLs now include `TauCetiRoadmap/`. Fresh source receipts record the actual acquired public URLs, including the usable author/publisher alternatives for Gross–Zagier and Smati. No literal `excerpt` fields were present; obsolete blanket excerpt-screening descriptions were removed.

## Sources and source findings

All attached node and proof-ingredient locators were freshly read. Scans and suspect formulae were checked on page images, notably Tate, Wright, Datskovsky–Wright, Bost–Connes, Sarnak, Shiu, the Lerch endpoint formulae and Kedlaya's residue lemma. The 91 routed items were compared with the 14 accepted paper extractions; those extractions establish routing and scope, not the truth of unread external proofs. Original analytic passages were checked separately.

Every source finding now has this job's own confirmed verdict and mathematical reason. The 48 inherited findings include the v1 Lerch PDE sign, the Lerch normalization and endpoint errors, quadratic character/conductor corrections, and the v1 JSS torsion sign. Published and preprint claims stay scoped to the versions actually read. In particular, this review does not assert a repair of the general twisted JSS formula from its scalar specialization.

Three findings were added:

- **E50:** Shiu p.162 equates a finite reciprocal sum with the full Euler product. Replace the equality by an inequality: at x=2 the two values are 3/2 and 2.
- **E51:** Kedlaya Lemma 9.2, p.54 omits the minus sign on the trivial-zero residue sum. Each residue is −x^ρ/ρ, positive at ρ=−2n.
- **E52:** The same lemma prints ζ′(0) in the denominator of the constant term. The residue is −ζ′(0)/ζ(0).

Bounded correction searches are recorded for the added findings. The author page and December 2025 PDF were checked for E51–E52; the attempted parallel HTML chapter was inaccessible. No claim of exhaustive novelty is made. The packet contains 87 distinct version receipts after consolidating identical acquisitions.

## Baseline, ownership and outstanding boundaries

All 228 starting baseline declarations were confirmed by reading their signatures, ambient hypotheses and the necessary definition bodies at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. None was removed or renamed. Added `Nat.factorial` and `HasProd` are definition/carrier imports; `HasProd` permits a zero limit and does not prove the positivity required by the new moment API. All 230 fully qualified names also passed temporary `#check`s in the authorized suggested file. Those temporary checks/imports were removed. Qualifying `_root_.NumberField` resolved a namespace collision exposed by the audit imports.

The reviewed library audit was read. Current TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were checked read-only. Qualitative PNT, fixed-progression Chebotarev, general contour theorems and current arithmetic carriers remain imports. Newer implementations are ownership evidence, not invented pinned-baseline declarations. The current Artin/Brauer induction, GlobalNumberFields, ClassFieldTheory, NumberFieldArithmetic, UniversalCovers and proposed spectral/adelic/arithmetic interfaces were compared with the requests. Specializations absent from their statements remain explicit extension requests.

The supplied red-team findings are handled consistently. Arithmetic-scheme Chebotarev is proposed as a Chebotarev Part II rather than planned in the number-field-only AN.4. AC.4 must choose its Green–Tao 2008 or Conlon–Fox–Zhao route; the former receives the full zero-free, growth and growing-modulus contracts, while the latter can use its narrower library inputs. Divisor maximal order stays distinct from a subpower bound. Effective and ineffective estimates and every conjectural hypothesis remain labelled.

The 58 gaps include original proofs quoted by the routed sources, quantitative analytic adapters, supplier refinements and implementation bridges. They have not been deleted merely because their statements were confirmed. The AN.8 remaining list now names the actual external local-functional-equation, reduction and entire-order boundaries instead of implying that the completed Wright/Datskovsky–Wright readings remain undone.

## Validation and maintainer handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/AnalyticNumberTheory.json`: 0 errors, 0 warnings.
- `python3 scripts/check_errata.py` on a scratch `errata-v1` envelope of the packet's source findings and version receipts: passed.
- Reader/packet comparison: all 239 statements, 317 API items, 261 tests and 263 proof arguments present; definition test minimum, review coverage, ingredient consumers and complete internal prerequisite graph checked.
- Independent arithmetic checks: divisor counterexample; finite Euler sum; k=1,2,3 Barnes/factorial constants and k=2 local factor; combined fourth-moment constant; half-order Laplace domain; sign and denominator of the residue terms.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/AnalyticNumberTheory.lean`: passed.
- Five authorized files: intake validation passed with 0 problems; `git diff --check` passed.
- Final `lean-check research/blueprint/suggested/AnalyticNumberTheory.lean`: exit 0, only 51 `sorry` warnings; 429 lines. Memory was checked before each elaboration. No Lake project, build or language server was started.

The maintainer should point later sieve/probability plans at the three new AN.5 targets, preserve the AN.7→AN.5 Barnes dependency, and decide the two existing restructuring proposals. Existing upstream observations stay in `upstreamNotes`; this review edits no supplier or upstream file. Packaging can use this accepted packet while preserving its explicitly stated proof gaps. There is no unresolved contradiction requiring a revision job.
