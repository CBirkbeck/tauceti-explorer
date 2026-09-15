# Probabilistic, metric and ergodic number theory

Revision: 2026-09-15. Curriculum extension with explicit construction targets. These stages must be source-decomposed before proof execution.

## Scope and ownership

Almost-everywhere assertions, averages over integers, and statements about every real number remain distinct. Specify the probability space and measure before every distribution theorem.

Subject families: 11K, 11N, 11J.

Use [the campaign execution protocol](../../campaign-guide/AI_EXECUTION.md). The stages below are mathematical work specifications. Source acquisition, statement checking, proof decomposition, Lean elaboration and proof completion are distinct states.

## Stages

### PM.0 Arithmetic probability spaces

**Construct and export.** Define uniform integers up to x, additive/multiplicative random variables, moments and characteristic functions; connect counting limits to weak convergence.

**Inputs.** `AnalyticNumberTheory:AN.0`

**Acceptance.** The ambient sample space and truncation change with x in a documented way; independence is proved or replaced by an explicit comparison.

**Source route.** Selected sources: KUBILIUS, KUIPERS, DUFFIN. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### PM.1 Normal order and limit laws

**Construct and export.** Prove Turan-Kubilius and source-scoped Hardy-Ramanujan/Erdos-Kac theorems through moment or characteristic-function estimates.

**Inputs.** `ProbabilisticAndMetricNumberTheory:PM.0`

**Acceptance.** Centering and variance are derived and the error for large primes is controlled.

**Source route.** Selected sources: KUBILIUS, KUIPERS, DUFFIN. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### PM.2 Uniform distribution and discrepancy

**Construct and export.** Develop Weyl criterion, equidistribution of polynomial sequences, discrepancy inequalities and applications to fractional parts and digit expansions.

**Inputs.** `ProbabilisticAndMetricNumberTheory:PM.1`, `ExponentialSumsAndCircleMethod:ES.0`

**Acceptance.** Irrational-coefficient hypotheses and interval endpoint conventions are explicit; test rational sequences as counterexamples.

**Source route.** Selected sources: KUBILIUS, KUIPERS, DUFFIN. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### PM.3 Metric Diophantine approximation

**Construct and export.** Construct limsup sets, Borel-Cantelli arguments and source-scoped Khintchine/Duffin-Schaeffer-type theorems, including monotonicity or coprimality weights where appropriate.

**Inputs.** `ProbabilisticAndMetricNumberTheory:PM.2`

**Acceptance.** Separate convergence from divergence halves and state Lebesgue/Hausdorff measures; retain exceptional null sets.

**Source route.** Selected sources: KUBILIUS, KUIPERS, DUFFIN. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### PM.4 Continued fractions and ergodic methods

**Construct and export.** Construct Gauss map, invariant measure, ergodicity/mixing and metric continued-fraction statistics; extend to homogeneous dynamics through GN.4.

**Inputs.** `ProbabilisticAndMetricNumberTheory:PM.3`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4`

**Acceptance.** Prove invariance and integrability before applying ergodic theorems; pointwise claims are almost everywhere unless proved for the specific point.

**Source route.** New primary-proof acquisition: Gauss-map invariant measure, ergodicity and metric continued-fraction theorems, then the selected homogeneous-dynamics sources. The other source routes do not supply these proofs.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### PM.5 Correlations and conjectural models

**Construct and export.** Organize short-interval distribution, multiplicative-function correlations and random models using exact known theorem ranges. Keep Chowla/Sarnak-type general statements in the conjecture register.

**Inputs.** `ProbabilisticAndMetricNumberTheory:PM.4`

**Acceptance.** A heuristic random model is never used as a proven joint distribution for arithmetic functions.

**Source route.** New primary-proof acquisition: source-scoped modern multiplicative-function short-interval and correlation papers, with exact averaging and exceptional-set restrictions; general Chowla/Sarnak statements remain frontier targets.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

## Reference access and completion

See [the extension source register](../../campaign-guide/EXTENSION_SOURCES.md). A catalogue or abstract check does not count as checking a proof. Missing source editions and theorem locators are explicit preparation tasks in the generated work queue.

Before marking this area implemented, every exported object needs its construction and reusable API; every theorem needs a kernel-checked proof and actual consumer instantiation. Record failed hypotheses and conversions explicitly. If a dependency is absent, add a named construction stage and update the graph before using it.
