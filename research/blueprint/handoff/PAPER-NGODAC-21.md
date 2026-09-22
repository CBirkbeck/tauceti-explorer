# PAPER-NGODAC-21 handoff

Agent: Codex — codex-c83e7a. Issue: #1111. Continuation of checkpoint PR #1971 by codex-a71f92. Status: **partial**.

## Completed in this continuation

- Reread the entire 26-page HAL manuscript and references. Reused the previous public PDF only after verifying SHA-256 f6bf74f188aad7602293e47b2c963243a036649cb591a4dc7ca13556e90d971d. Fresh HAL responses were HTML challenges, and Annals PDF endpoints returned 404. Journal comparison remains open.
- Discharged the exact G1 consumer with a descending t-coefficient proof of integral monic Frobenius descent, an explicit theta-degree bound, and monic quotient descent. These justify the affine/quadratic coefficient forms without additional denominator scaling. Kuan–Lin’s original paper remains unread; no claim is made about its full theorem.
- Removed the unnecessary degree-descent dependency from the second-row classification, proving the F_q[t] multiplier directly by evaluation at the q finite-field roots.
- Discharged G2 for the actual F_q[θ] product by an explicit two-pole partial-fraction proof, monic-pair reindexing and pinned Mathlib FiniteField.sum_pow_units. The proof covers all exponents, prime powers and integer degree cutoffs. Chen’s original article remains unread.
- Located and read the pinned high-degree Riemann–Roch theorem with its exact constant-field hypothesis. Narrowed G6 to ABP’s norm/divisor and constant-field bridge; Riemann–Roch itself is not missing.
- Preserved all 99 prior items, ten source issues and six routes. Added seven theorem items, giving 106 items: five library, two planned and 99 missing. All 99 missing items are routed exactly once. The 36 definitions/constructions retain 105 API entries and 108 tests. G1/G2 resolutions are recorded; six gaps remain.

## Resume here

1. **G4, interpolation:** obtain Anderson–Thakur 1990 and close integrality, growth, normalization and interpolation, including the one-place H-index shift. Close Carlitz’s generating-function input for small power sums. This is a productive next source leaf, unlike retrying G1/G2 as opaque citations.
2. **G3, nonvanishing:** read Sheats’s prime-power carry-free optimum proof and the bridge to reciprocal-sum valuations. The previous Thakur reads and correction notes are preserved.
3. **G6, ABP count:** use `TauCeti.Divisor.dim_eq_degree_add_one_sub_genus_of_two_mul_genus_sub_one_le_degree`; it assumes `IsFunctionField k F` and `IsIntegrallyClosedIn k F`. Identify the norm ball with L(nD∞), account for k₀/F_q, and verify [k₀:F_q]deg D∞=[L₀:K]. Do not rebuild the existing theorem or assume constants are unchanged.
4. **G5/G7, ABP analysis:** close the exact analytic suppliers and Lang’s isogeny; split §§3.4.2–3.4.5 into constant-level auxiliary inequalities. Prior external reading boundaries are inherited, not claimed newly repeated here.
5. **G8, versions:** obtain the actual 32-page Annals article and reconcile E1–E6 and page locators. E7–E10 concern external versions. All ten findings await independent review. This continuation added no source-error allegation and performs no independent review of them.

The final theorem ranges remain unchanged: spanning at every weight, all-weight independence of entries<q, and the Thakur basis theorem only through 2q−2. Do not attribute the later all-weight result to this paper. Reuse DrinfeldModulesAndTModulesPartII with its existing proposal identifier. Generic scalar Frobenius lemmas are sourced to DM.8 and imported by Part II.

## Checks

The previous 336 rational Chen identities, 32 shifted-boundary identities and q=2,3,4,5 counting/bijection tests were rerun and passed. New exact diagnostics: 900 integer partial-fraction identities; 800 finite-field inverse-power sums; 3,584 finite-extension descent cases and one degree-zero counterexample; 17 nonzero-f coefficient obstructions including characteristic two; 51,968 degree inequalities. The endpoint permits a homogeneous family with f=0, so the diagnostic correctly checks that f≠0 is impossible rather than demanding a zero kernel.

Current schema and intake checks passed (3 files, 0 problems), as did the 260-edge dependency DAG, definition API/uses/tests, source-issue preservation, exact-once routing and 480 input-hash checks. All 480 ownership inputs are pinned to commit 40e5dc275e2a7371c78a76f4147886f49776d1b4.

No Lean file was compiled or submitted. These are source-grounded plans and proof outlines, with no formalisation claim.
