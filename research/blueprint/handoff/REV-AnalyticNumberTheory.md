# REV-AnalyticNumberTheory handoff

Issue #9404 completed by Codex, session codex-MFZ11h, 14 October 2026. Verdict: accepted. One job was claimed and reviewed; no second job is taken.

The packet has 239 targets: 221 verified, 15 corrected and 3 added. It records 230 confirmed baseline declarations, 263 proof ingredients, 317 API items, 261 tests, 41 planets, 52 requests, 58 honest gaps and 51 independently confirmed source findings. The reader carries the full specification. The suggested file is 429 lines and elaborates at the pins with only 51 `sorry` warnings.

Read [the review report](../reviews/REV-AnalyticNumberTheory.md) for the complete correction inventory and validation. The packet's per-target verdicts and source/version receipts are the durable review evidence; scratch downloads and logs are not needed by the next worker.

## Integration work for owners

- Later SieveMethodsAndPrimePatterns targets should import `AnalyticNumberTheory:AN.5/plan/shiu-short-interval-bound` and `AnalyticNumberTheory:AN.5/plan/mangoldt-short-window-bound`. AN must not depend upward on SV.1 for these inputs.
- Later ProbabilisticAndMetricNumberTheory moment targets should import `AnalyticNumberTheory:AN.5/plan/zeta-moment-constants`. AN must not depend upward on PM.5 for its normalization.
- The new constants depend on `AnalyticNumberTheory:AN.7/plan/barnes-g-function`. Preserve this acyclic build dependency even though the layer numbering goes backwards.
- Barnes recurrence is meromorphic globally; its pointwise equation using Mathlib's totalized Gamma excludes nonpositive integers. The origin logarithmic-derivative API is given separately.
- E50 records Shiu's finite-sum/Euler-product inequality. E51–E52 record Kedlaya's trivial-zero sign and residue-denominator slips. The explicit-formula target already used the correct terms.
- Arithmetic-scheme Chebotarev still needs the proposed Chebotarev Part II. The maintainer and AC.4 owner must still resolve the analytic link according to AC.4's chosen proof route. This review does not alter either supplier.

## Remaining mathematical work

The accepted plan retains its 58 explicit gaps and 52 precise requests. Source statements quoted from unread external proofs remain proof-acquisition gaps. Do not interpret acceptance as closure of those proofs or a formalized roadmap. The AN.8 readings of Wright and Datskovsky–Wright are complete at the attached locators; their externally quoted local distribution/reduction results and the quantitative entire-order estimate remain open. The primary second/fourth-moment proofs and Shiu's quoted sieve proof also remain open.

No private source was used. Current TauCetiRoadmap and Tau Ceti were read-only, at the commits recorded in the report. Neither upstream checkout was built or edited. Only this issue's four deliverables and this handoff changed. Temporary baseline checks were removed from the suggested file. No background process remains.

Resume with packaging from the accepted packet, subject to the usual upstream-tier rules. The final PR URL is recorded by the worker in the job's PR file.
