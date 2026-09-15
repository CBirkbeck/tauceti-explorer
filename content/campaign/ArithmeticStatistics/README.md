# Arithmetic statistics, counting fields and Selmer distributions

Revision: 2026-09-15. Curriculum extension with explicit construction targets. These stages must be source-decomposed before proof execution.

## Scope and ownership

Count a precisely specified family ordered by a named height/discriminant. Cohen-Lenstra, Malle and general rank-distribution predictions remain conjectural unless a source-qualified case is proved.

Subject families: 11R, 11G, 11N.

Use [the campaign execution protocol](../../campaign-guide/AI_EXECUTION.md). The stages below are mathematical work specifications. Source acquisition, statement checking, proof decomposition, Lean elaboration and proof completion are distinct states.

## Stages

### ST.0 Families, heights and measures

**Construct and export.** Define arithmetic families, equivalence relations, height/discriminant orderings, local conditions and weighted versus unweighted counts. Prove finiteness at bounded height before forming asymptotic densities.

**Inputs.** `FoundationsAndLibraryIntegration:LI.4`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1`

**Acceptance.** Isomorphism multiplicity and stabilizer weights are explicit; changing height changes the theorem until a comparison is proved.

**Source route.** Selected sources: BHARGAVA-SHANKAR, COHEN-LENSTRA. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### ST.1 Parametrizations by orbits

**Construct and export.** Develop integral invariant theory and source-scoped orbit parametrizations for number rings and genus-one models, including nonmaximal, reducible and degenerate loci.

**Inputs.** `ArithmeticStatistics:ST.0`, `ClassicalArithmeticCompletion:CA.3`

**Acceptance.** An orbit-to-object bijection has proved inverse and stabilizer identification, and records all local/maximality restrictions.

**Source route.** Selected sources: BHARGAVA-SHANKAR, COHEN-LENSTRA. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### ST.2 Geometry of numbers and uniformity

**Construct and export.** Count lattice points in fundamental domains, bound cusp/reducible contributions, and prove uniform tail estimates needed to impose infinitely many local conditions.

**Inputs.** `ArithmeticStatistics:ST.1`, `SieveMethodsAndPrimePatterns:SV.2`

**Acceptance.** An interchange of sieve limits and height limits requires a uniform tail theorem, not pointwise density estimates.

**Source route.** Selected sources: BHARGAVA-SHANKAR, COHEN-LENSTRA. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### ST.3 Fields and class groups

**Construct and export.** Prove selected counting and class-group moment/distribution theorems by discriminant and signature; organize known low-degree cases independently of general conjectures.

**Inputs.** `ArithmeticStatistics:ST.2`

**Acceptance.** The count fixes field degree, Galois group and automorphism weights; a heuristic moment is not substituted for a proven limit.

**Source route.** Selected sources: BHARGAVA-SHANKAR, COHEN-LENSTRA. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### ST.4 Selmer groups and rank bounds

**Construct and export.** Implement a selected complete Bhargava-Shankar orbit-counting/Selmer proof and its rank consequence. Import actual descent exact sequences and local-solubility parametrization.

**Inputs.** `ArithmeticStatistics:ST.3`, `SchemeAndStackFoundations:SF.3`, `HeightsRationalPointsAndObstructions:RP.1`

**Acceptance.** Average Selmer size bounds ranks via a proved inequality; Selmer rank is not equal to Mordell-Weil rank without controlling Sha.

**Source route.** Selected sources: BHARGAVA-SHANKAR, COHEN-LENSTRA. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### ST.5 Beyond first moments

**Construct and export.** Add source-scoped higher moments, local statistics, random-matrix distributions and function-field analogues; record established asymptotics versus models.

**Inputs.** `ArithmeticStatistics:ST.4`

**Acceptance.** Convergence modes, error bounds, local exclusions and the measure on the limiting space are explicit.

**Source route.** Selected sources: BHARGAVA-SHANKAR, COHEN-LENSTRA. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

## Reference access and completion

See [the extension source register](../../campaign-guide/EXTENSION_SOURCES.md). A catalogue or abstract check does not count as checking a proof. Missing source editions and theorem locators are explicit preparation tasks in the generated work queue.

Before marking this area implemented, every exported object needs its construction and reusable API; every theorem needs a kernel-checked proof and actual consumer instantiation. Record failed hypotheses and conversions explicitly. If a dependency is absent, add a named construction stage and update the graph before using it.
