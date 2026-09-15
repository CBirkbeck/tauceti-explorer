# Diophantine approximation and transcendence

Revision: 2026-09-15. Curriculum extension with explicit construction targets. These stages must be source-decomposed before proof execution.

## Scope and ownership

Ineffectivity, algebraicity, logarithm branches and height conventions are mathematical hypotheses. General Schanuel/period conjectures are statements to formalize, not proof tasks to discharge with assumed packages.

Subject families: 11J.

Use [the campaign execution protocol](../../campaign-guide/AI_EXECUTION.md). The stages below are mathematical work specifications. Source acquisition, statement checking, proof decomposition, Lean elaboration and proof completion are distinct states.

## Stages

### DT.0 Heights and approximation constants

**Construct and export.** Define rational/algebraic approximations, irrationality exponents, Weil heights and local absolute values; connect continued fractions and geometry-of-numbers Dirichlet approximation.

**Inputs.** `GeometryOfNumbersAndQuadraticArithmetic:GN.1`, `FoundationsAndLibraryIntegration:LI.4`

**Acceptance.** Height normalization agrees with the product formula and denominator conventions; rational and algebraic inputs are distinguished.

**Source route.** Selected sources: WALDSCHMIDT, SCHMIDT. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### DT.1 Liouville and Roth

**Construct and export.** Prove Liouville bounds, then reproduce a complete source proof of Roth using auxiliary polynomials, index estimates and its inequality chain.

**Inputs.** `DiophantineApproximationAndTranscendence:DT.0`

**Acceptance.** Roth is stated for algebraic irrational numbers and epsilon > 0; its finiteness conclusion does not provide an effective list.

**Source route.** Selected sources: WALDSCHMIDT, SCHMIDT. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### DT.2 Subspace theorem and S-unit equations

**Construct and export.** Develop the archimedean/nonarchimedean subspace theorem in selected formulations, then S-unit and decomposable-form applications with linear-independence and exceptional-subspace hypotheses.

**Inputs.** `DiophantineApproximationAndTranscendence:DT.1`

**Acceptance.** An exceptional finite union of proper subspaces is constructed at the theorem level; finiteness is kept separate from effectiveness.

**Source route.** Selected sources: WALDSCHMIDT, SCHMIDT. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### DT.3 Transcendence and logarithmic forms

**Construct and export.** Build exponential/algebraic independence tools, Lindemann-Weierstrass/Gelfond-Schneider routes and Baker-type explicit lower bounds, with chosen complex or p-adic logarithms.

**Inputs.** `DiophantineApproximationAndTranscendence:DT.0`, `FoundationsAndLibraryIntegration:LI.2`

**Acceptance.** The linear form must be nonzero and the exact degree/height/prime dependence of a bound is recorded before using it in a finite search.

**Source route.** Selected sources: WALDSCHMIDT, SCHMIDT. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### DT.4 Effective applications

**Construct and export.** Transfer logarithmic-form lower bounds to explicit bounds for Thue, Thue-Mahler, S-unit and exponential equations. Prove the height/degree/branch conversion lemmas. Export these bound theorems to EffectiveDiophantineMethods ED.2, which owns lattice reduction and certified residual enumeration.

**Inputs.** `DiophantineApproximationAndTranscendence:DT.3`, `GeometryOfNumbersAndQuadraticArithmetic:GN.5`

**Acceptance.** Every reduction preserves the solution set and the final search region is justified by a proven bound.

**Source route.** Selected sources: WALDSCHMIDT, SCHMIDT. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### DT.5 Further transcendence and unlikely intersections

**Construct and export.** Add Mahler functions, E/G-functions, algebraic independence and source-scoped functional-transcendence applications with explicit differential/difference equations. Coordinate period statements with PS and unlikely intersections with RP.

**Inputs.** `DiophantineApproximationAndTranscendence:DT.4`

**Acceptance.** Each new named theorem requires its complete selected proof source; conjectural transcendence principles stay explicit in conditional statements.

**Source route.** Selected sources: WALDSCHMIDT, SCHMIDT. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

## Reference access and completion

See [the extension source register](../../campaign-guide/EXTENSION_SOURCES.md). A catalogue or abstract check does not count as checking a proof. Missing source editions and theorem locators are explicit preparation tasks in the generated work queue.

Before marking this area implemented, every exported object needs its construction and reusable API; every theorem needs a kernel-checked proof and actual consumer instantiation. Record failed hypotheses and conversions explicitly. If a dependency is absent, add a named construction stage and update the graph before using it.
