# BP-ProbabilisticAndMetricNumberTheory — handoff

Issue: #1041. Agent: GPT-6 Astra Pro.
Session and branch: `astra-20260926-pm-83c1`.
Status: **checkpoint, partial**; no implementation claim.

## Saved work

The three companion files contain 17 nodes: 1 construction, 13 lemmas, 1 comparison
and 2 theorems. The construction has 7 separately represented API declarations and
5 regression-test contracts; the packet has 3 planets, 17 pinned baseline declarations,
7 explicit gaps and no unresolved supplier requests. All six stages remain in scope;
PM.0 is partial and PM.1–PM.5 have source-reading work explicitly outstanding.

The mathematical contribution is a finite weighted prime-truncation API, exact divisor
and lcm joint probabilities, signed remainder bounds, first-moment centering error,
and a second-moment comparison with error 2*(sum |a(p)|)^2/N. Complete prime periods
have exact first and second moments. Empirical centering, diagonal pair terms, zero
extension and the difference between omega and Omega are kept explicit.

Pinned Tau Ceti already has the empirical-measure carrier, integration formula and
finite uniform-index comparison in `TauCeti/Probability/Process/EmpiricalMeasure.lean`.
Use it; do not build another uniform arithmetic probability measure. Mathlib already
has `Nat.card_multiples`; the new node is its probability consequence, not a duplicate
counting theorem. The constructor is in the existing `ArithmeticFunction` carrier.

## Inputs and provenance

Read WORKERS, BROWSER_AGENTS, PROTOCOL, expansion/PROTOCOL and UPSTREAM_GUIDE;
the issue and confirmed claim; the full campaign README and atlas extract; the relevant
AUDIT-07 result and accepted REV-AUDIT-07 review; and relevant passages of the upstream
ArithmeticDirichletSeries and Exchangeability READMEs. The RS-07 report was consulted
for dropped AN foundations and supplier ownership, not as permission to modify that work.

Every declaration listed under baseline was read at its pin. The source ledger gives
the file ranges and public URLs. The primary explanatory text inspected was the first
six paragraphs of Tao's Supplement 4, Section 3. The displayed quantitative moment
bound is a fully explained auxiliary calculation, not a misattributed Kubilius theorem.
The named Kubilius/Kuipers/Duffin source routes and PM.4–PM.5 proofs remain unread.

The giant integrated library-coverage blob was not returned by the file reader. The
reviewed source audit was used instead. Original packet and handoff paths did not
exist when work began. No app/data/queue/other-packet file is part of this submission.

## Checks actually performed

Local JSON parsing, required fields, valid node/source/baseline endpoints, seven API
node references and the intra-packet DAG passed. This was a local structural check,
not the official repository-wide checker. All excerpts are at most 300 characters.

Exact-rational Python checks passed for N=1,...,40: 1,000 divisor cases and 25,000
pairs of positive divisors up to 25; 1,000 pairs from primes 2,3,5,7,11; and 2,680
weighted moment cases with P in empty,{2},{2,3},{2,3,5},{2,5,7} and every weight in
{-2,0,3}. These include 181 complete-period cases. They test exact formulae, the signed
remainder, both moment error bounds and the exact-period equalities. They do not prove
the universal results. The N=5 weighted example was checked separately: mean 7/5,
model mean 2 and centered second moment 9/5.

Lean is unavailable in the execution environment. The suggested file was **not compiled**;
proof placeholders and example statements are not passed Lean tests. The complete local
repository, global declaration index and checker world were unavailable, so
`python3 scripts/check_blueprint.py research/blueprint/packets/ProbabilisticAndMetricNumberTheory.json`
was **not run locally**. The PR's official intake/CI result must be checked before any
claim that this gate passed. No global ownership or cycle audit is claimed from the
small local graph.

## Next work

First run the official checker in the full repository and elaborate the suggested
signatures against the pins; resolve any reported namespace, coercion or measurable
instance issues without weakening the mathematical statements. Recheck the live
atlas links and supplier packets before extending ownership. This packet has no
cross-roadmap theorem dependency that purports to resolve an unread supplier.

Continue PM.0 with exact-source general additive/strongly additive interfaces, the
prime-power/Omega branch and the arithmetic counting/CDF/weak-convergence dictionary.
The empirical, characteristic-function and moment carriers already exist. Prove the
complete finite joint Bernoulli comparison and the required growing-prime range;
first and second moments alone do not establish it. Acquire and read the actual
Kubilius edition and full theorem proofs before claiming that route decomposed.

Then expand PM.1 with exact Mertens normalization, a valid moment-convergence or
triangular-array route and the large-prime tail. The finite 2 L^2/N estimate in this
checkpoint does not close that argument. For PM.2–PM.5 follow the six-stage coverage
ledger: exact source statements, genuine supplier contracts and no conversion of
heuristic models or conjectures into proved results.
