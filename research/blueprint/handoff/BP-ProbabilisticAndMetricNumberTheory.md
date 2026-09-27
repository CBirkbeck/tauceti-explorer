# BP-ProbabilisticAndMetricNumberTheory — handoff

Issue: #1041. Continuation: Codex, session `codex-a71f92`, 2026-09-27.
Status: checkpoint, partial; every node remains unchecked.
Claim 5851486880 was confirmed by the bot in comment 5851487855.
Base inspected: `8f6fe5b8ff79f514c6c42a430b1813e4eae48ea5`.

## Result and preserved work

The packet has 22 nodes: 1 construction, 16 lemmas, 1 comparison, 4 theorems;
7 construction API items, 5 construction tests, 4 planets, 25 pinned baseline
declarations, 6 explicit mathematical gaps and 0 requests. The suggested file
also contains 10 theorem-level finite-pattern examples, for 15 examples total.

All 17 inherited node IDs and mathematical statements from the merged #3088
checkpoint are retained. The construction's API and tests are unchanged. Its
coprime-additivity lemma now lists the existing Nat.Prime.dvd_mul explicitly.
The planning constructor body is now a placeholder, consistently with the issue's
signature-only requirement; its mathematical definition has not changed.

The five added PM.0 nodes are simultaneous-divisibility, divisibility-pattern-formula,
divisibility-pattern-error, complete-period-joint-law and
divisibility-pattern-summed-error. For disjoint finite prime sets S,T they give
the exact signed subset count, an error at most 2^|T|/N from the Bernoulli-product
mass, and exact equality when the prime product divides N. Summing all Boolean
atom errors for a finite prime set P gives at most 3^|P|/N.

The existing empirical measure samples 1,...,N with N=m+1. No new probability
carrier, generic inclusion-exclusion framework, sieve interface or total-variation
definition was introduced. The new exact complete-period law concerns Boolean
divisibility coordinates, not all residue classes. It is not a general Kubilius
comparison or an arithmetic central limit theorem.

## Inputs and source discipline

Read the whole issue after the exact claim confirmation, all inherited deliverables,
the six integrated reviewed PM audit rows and accepted AUDIT-07 review, the complete
campaign document and atlas extract, and every matching link entry. No integrated PM
decomposition exists. Consulted the accepted RS-07 ownership boundary: generic
arithmetic-function/finite-sum infrastructure is imported; arithmetic probability
comparisons remain PM.0. Nearby upstream contract-style documents read during this
work include EffectiveBounds, GlobalNumberFields and ArithmeticDirichletSeries.
The supplier AN.8 packet is absent; none of the finite declarations needs it, so no
fictional supplier dependency or request was added.

Reread the primary author HTML of Tao's 2015 Supplement 4, section 3, first six
paragraphs, on 2026-09-27. Its URL and acquired HTML SHA-256 are in the source ledger.
This is motivation for the finite comparison, not a claim that Tao states the five
new declarations with these constants. Their proofs are explicit auxiliary finite
calculations based on the pinned counting and finite-product identities. No result
from the subsequent rough-number discussion is imported.

Read the actual statements of every added pinned declaration, including the
pairwise-coprime finite lcm/product identity, the lcm divisibility characterization,
powerset cardinality and finite binomial expansion. Generic results already in
Mathlib were not made into new nodes. The older selected library sources and the
complete Tau Ceti empirical-measure file were checked again at their recorded pins.
The original Kubilius monograph, normal-order/limit-law sources and PM.2-PM.5 proof
sources are still outstanding. No source-wide correctness verdict is claimed.

## Checks actually performed

The official blueprint checker with the full pinned declaration index reports
0 errors and 0 warnings. The four deliverables pass the intake path/private-path/
JSON checks. Publication uses a fresh-main content guard, including source/audit/
ownership inputs, supplier packets and all PM-matching link files.

The suggested file compiles under Lean 4.34.0-rc2 against Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`: 22 declaration signatures and 15 example contracts,
37 expected proof-placeholder warnings, no other warnings or errors.
Before using the compiled Mathlib cache, the compilation driver byte-compared
8,482 transitive source files with the pin. The one imported Tau Ceti module was
built from pinned source in scratch space. The inherited file was also compiled
before any changes and had 21 expected placeholder warnings.

A separate scratch Lean file proves six lemmas and ten examples without placeholders
or warnings. The lemmas verify finite prime-product divisibility, empirical event
averaging, the exact divisor count, the simultaneous-prime count, the avoidance
product expansion and the 3^|P| subset sum. The examples prove the incomplete/complete
period values, empty constraints, overlap and composite counterexamples, the
single positive sample, and summed atom error 1/3 at N=5 for primes 2 and 3.
These are proof probes, not a complete formalization of this blueprint.

Independent exact-rational regressions reran 1,000 divisor cases, 25,000 joint-divisor
cases, 1,000 prime-pair cases and 2,680 weighted-moment cases, with 181 complete-period
moment cases. They added 9,720 pattern cases (including 690 complete-period cases)
and 1,920 summed-atom checks for N=1,...,120 and subsets of {2,3,5,7}.
They test the exact signed formula, product-model mass, single-atom error,
normalization and summed bound, using direct counts independently of the formula.

The obsolete environment-verification gap was removed; the six mathematical gaps
remain. Scratch proof files, regressions, build outputs, HTML and extracted source
text are not published. Only the four authorized deliverables belong to the PR.

## Exact continuation

PM.0 remains partial. Acquire the exact Kubilius edition and full relevant proofs.
Decompose general additive/strongly additive interfaces, prime-power/Omega
representations, and the arithmetic counting/CDF/characteristic-function/
weak-convergence dictionary using existing carriers. The finite Boolean atom
law is now present; do not re-plan it. A full residue-class model, higher-moment
bookkeeping and the source-scoped growing-prime range are still missing.
The elementary 3^|P|/N estimate does not supply that general range.

PM.1-PM.5 coverage records are unchanged. PM.1 requires exact normalization,
large-prime removal and a valid moment or triangular-array route; an iid CLT does
not apply directly to the arithmetic indicators. PM.2 needs the Weyl/discrepancy
proofs and precise ES.0 input. PM.3 must retain metric measure, monotonicity and
coprimality hypotheses while reusing Borel-Cantelli/Gallagher. PM.4 needs genuine
pointwise ergodic input, not just mean convergence. PM.5 must preserve correlation
ownership and distinguish conjectures from consequences of random models.

Recheck current main, the live links and supplier packets before claiming any further
closure. This checkpoint changes no PM.1-PM.5 claims and closes no whole stage.
