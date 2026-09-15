# Exponential sums, decoupling and the circle method

Revision: 2026-09-15. Curriculum extension with explicit construction targets. These stages must be source-decomposed before proof execution.

## Scope and ownership

The circle-method range, local solubility and nonsingularity conditions are theorem data. General Hasse principles cannot be inferred merely from formal singular-series expressions.

Subject families: 11L, 11P, 11D.

Use [the campaign execution protocol](../../campaign-guide/AI_EXECUTION.md). The stages below are mathematical work specifications. Source acquisition, statement checking, proof decomposition, Lean elaboration and proof completion are distinct states.

## Stages

### ES.0 Oscillation and finite sums

**Construct and export.** Develop Weyl differencing, van der Corput, stationary phase and completion of sums; connect to finite-field character-sum producers and explicit derivative/degree bounds.

**Inputs.** `FiniteFieldsAndCharacterSums:FF.2`, `FoundationsAndLibraryIntegration:LI.2`

**Acceptance.** Track summation interval, denominator, coprimality and all implicit constant dependencies.

**Source route.** Selected sources: BDG, KED-ANT, VAUGHAN. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### ES.1 Fourier counting identities

**Construct and export.** Prove exact orthogonality identities translating integral solutions into torus integrals of exponential sums; define major/minor arcs and disjointness/overlap control.

**Inputs.** `ExponentialSumsAndCircleMethod:ES.0`

**Acceptance.** Coefficient extraction agrees with a finite count for small examples and supports weighted/smoothed variants by a stated limiting argument.

**Source route.** Selected sources: BDG, KED-ANT, VAUGHAN. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### ES.2 Mean-value theorems

**Construct and export.** Develop Vinogradov mean values via a selected complete efficient-congruencing or decoupling proof, including the analytic restriction inputs owned here. Handle low degrees separately if the source does.

**Inputs.** `ExponentialSumsAndCircleMethod:ES.1`

**Acceptance.** State J_s,k(X) bounds with epsilon loss and both expected terms; do not cite a degree-greater-than-three source for unproved low-degree cases.

**Source route.** Selected sources: BDG, KED-ANT, VAUGHAN. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### ES.3 Major arcs and local factors

**Construct and export.** Construct singular integrals and p-adic local densities; prove absolute convergence, factorization and positivity under source-scoped nonsingular local solutions.

**Inputs.** `ExponentialSumsAndCircleMethod:ES.2`

**Acceptance.** Positivity is demonstrated at every place, and normalization of Haar measures matches the asymptotic constant.

**Source route.** Selected sources: BDG, KED-ANT, VAUGHAN. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### ES.4 Minor arcs and Diophantine endpoints

**Construct and export.** Combine bounds to prove Waring-type, sums of primes and forms-in-many-variables theorems in their actual variable/degree ranges. Treat each optimized endpoint as a separate source theorem. For sums of primes construct a separate prime-weighted branch using Vaughan or Heath-Brown identities, Type I/II estimates and uniform arithmetic-progression major-arc estimates; the unweighted Vinogradov mean-value theorem does not supply those bounds.

**Inputs.** `ExponentialSumsAndCircleMethod:ES.3`, `AnalyticNumberTheory:AN.3`, `SieveMethodsAndPrimePatterns:SV.2`

**Acceptance.** Record number of variables, degree, dimension of singular locus and error exponent before claiming an asymptotic or Hasse principle.

**Source route.** Selected sources: BDG, KED-ANT, VAUGHAN. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### ES.5 Uniform and geometric applications

**Construct and export.** Add determinant-method and arithmetic-geometric comparison routes for counting rational/integral points, with heights and uniformity parameters explicit; hand off to arithmetic statistics.

**Inputs.** `ExponentialSumsAndCircleMethod:ES.4`

**Acceptance.** The bound states dependence on coefficients, degree and height, and distinguishes a bound from an asymptotic with positive main term.

**Source route.** Selected sources: BDG, KED-ANT, VAUGHAN. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

## Reference access and completion

See [the extension source register](../../campaign-guide/EXTENSION_SOURCES.md). A catalogue or abstract check does not count as checking a proof. Missing source editions and theorem locators are explicit preparation tasks in the generated work queue.

Before marking this area implemented, every exported object needs its construction and reusable API; every theorem needs a kernel-checked proof and actual consumer instantiation. Record failed hypotheses and conversions explicitly. If a dependency is absent, add a named construction stage and update the graph before using it.
