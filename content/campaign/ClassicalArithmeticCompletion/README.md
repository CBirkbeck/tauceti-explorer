# Classical arithmetic, sequences, polynomials and reciprocity

Revision: 2026-09-15. Curriculum extension with explicit construction targets. These stages must be source-decomposed before proof execution.

## Scope and ownership

Complete the elementary and algebraic entry layer by extending existing APIs. Elementary examples are regression cases; they do not replace general statements.

Subject families: 11A, 11B, 11C, 11R.

Use [the campaign execution protocol](../../campaign-guide/AI_EXECUTION.md). The stages below are mathematical work specifications. Source acquisition, statement checking, proof decomposition, Lean elaboration and proof completion are distinct states.

## Stages

### CA.0 Divisibility and multiplicative arithmetic

**Construct and export.** Audit gcd, Euclidean algorithms, prime factorization, congruences, CRT, valuations, arithmetic functions, Mobius inversion and Dirichlet convolution; prove general finite-sum and multiplicative identities on existing carriers.

**Inputs.** `FoundationsAndLibraryIntegration:LI.0`

**Acceptance.** Unit and zero cases are explicit; instantiate inversion at divisor sums and CRT at noncoprime moduli with its compatibility hypothesis.

**Source route.** Selected sources: LOCAL, SHOUP, KED-CFT. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### CA.1 Residues and reciprocity

**Construct and export.** Integrate finite cyclic groups, power residues, Gauss/Jacobi sums and quadratic reciprocity, then source-scoped higher reciprocity through class field theory. Record residue symbols at 2 and at infinite places.

**Inputs.** `ClassicalArithmeticCompletion:CA.0`, `FoundationsAndLibraryIntegration:LI.4`

**Acceptance.** Reciprocity normalizations agree with LI.4 and finite-field characters; ramified primes are never passed through unramified formulas.

**Source route.** Selected sources: LOCAL, SHOUP, KED-CFT. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### CA.2 Sequences and generating functions

**Construct and export.** Develop recurrences, divisibility sequences, Bernoulli/Euler numbers, binomial identities and rational/formal generating functions. Relate recurrences to companion matrices and eigenvalues without silently extending scalars. Include radix expansions, automatic sequences, Farey sequences and combinatorial number families. Christol-type bridges to algebraic power series over finite fields require their own statement and proof, not a characteristic-zero analogy.

**Inputs.** `ClassicalArithmeticCompletion:CA.0`

**Acceptance.** Prove coefficient identities formally first; analytic specializations require a separate convergence theorem.

**Source route.** Selected sources: LOCAL, SHOUP, KED-CFT. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### CA.3 Polynomial and matrix arithmetic

**Construct and export.** Extend integer-valued polynomials, irreducibility, resultants, discriminants, Smith/Hermite normal forms and rational canonical forms. Feed invariant factors and effective ideal arithmetic into computational and Galois owners.

**Inputs.** `ClassicalArithmeticCompletion:CA.2`, `FoundationsAndLibraryIntegration:LI.1`

**Acceptance.** A normal-form algorithm returns invertible change-of-basis matrices and a reconstruction equation, with termination and divisibility conditions.

**Source route.** Selected sources: LOCAL, SHOUP, KED-CFT. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### CA.4 Classical Diophantine equations

**Construct and export.** Supply Pell equations, sums of squares, elementary descent and source-scoped exponential equations. Route general genus-one/higher-genus solutions to effective Diophantine and rational-point owners, preserving primitive and local-solubility conditions. Include linear Diophantine systems, numerical semigroups/Frobenius numbers and Egyptian-fraction identities with the precise finite or asymptotic claims.

**Inputs.** `ClassicalArithmeticCompletion:CA.1`, `ClassicalArithmeticCompletion:CA.3`

**Acceptance.** Pell solutions are classified through units with positivity conventions; a finite search is complete only after a proven bound.

**Source route.** Selected sources: LOCAL, SHOUP, KED-CFT. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### CA.5 Number-field arithmetic handoff

**Construct and export.** Reuse global/local field owners for integral bases, unit and class groups, relative discriminants, Frobenius and ideal factorization. Connect certified matrix computations to intrinsic arithmetic data.

**Inputs.** `ClassicalArithmeticCompletion:CA.4`

**Acceptance.** Compare computations in quadratic and cyclotomic examples to general theorems and record which invariant is certified.

**Source route.** Selected sources: LOCAL, SHOUP, KED-CFT. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### CA.6 Special algebraic numbers and Mahler measure

**Construct and export.** Construct Mahler measure, house, Pisot/Salem classes and dynamical/height comparisons. Prove selected lower bounds, finiteness statements and multiplicative identities through exact conjugate/root data; general Lehmer-type lower bounds remain conjectural.

**Inputs.** `ClassicalArithmeticCompletion:CA.3`, `ClassicalArithmeticCompletion:CA.5`, `DiophantineApproximationAndTranscendence:DT.0`, `ArithmeticDynamics:DY.1`

**Acceptance.** Distinguish roots of unity, algebraic integers and arbitrary algebraic numbers; certify conjugate moduli before assigning a Pisot or Salem class.

**Source route.** New primary-source acquisition/decomposition task: Mahler measure/Pisot/Salem sources, a selected proven lower-bound theorem, and the exact height comparisons; no general Lehmer conjecture proof.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### CA.7 Integral Galois modules and orders

**Construct and export.** Construct group-ring modules for rings of integers, normal-basis maps, locally free class groups and relative resolvent/discriminant data. Prove tame normal-integral-basis and integral-representation theorems only in their source-scoped base-field cases; import K0 from existing owners.

**Inputs.** `ClassicalArithmeticCompletion:CA.5`, `FoundationsAndLibraryIntegration:LI.3`, `KTheoryLowDegrees:Z.1`

**Acceptance.** A rational normal basis need not be integral; wild ramification is a counterexample gate, and local freeness is separate from global freeness.

**Source route.** New primary-source acquisition/decomposition task: Noether local tame normal-basis theorem, source-qualified global Hilbert-Speiser and Froehlich Galois-module/class-group theorems. Rational normal-basis theory is insufficient.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

## Reference access and completion

See [the extension source register](../../campaign-guide/EXTENSION_SOURCES.md). A catalogue or abstract check does not count as checking a proof. Missing source editions and theorem locators are explicit preparation tasks in the generated work queue.

Before marking this area implemented, every exported object needs its construction and reusable API; every theorem needs a kernel-checked proof and actual consumer instantiation. Record failed hypotheses and conversions explicitly. If a dependency is absent, add a named construction stage and update the graph before using it.
