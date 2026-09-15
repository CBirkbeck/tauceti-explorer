# Additive combinatorics, higher Fourier analysis and primes

Revision: 2026-09-15. Curriculum extension with explicit construction targets. These stages must be source-decomposed before proof execution.

## Scope and ownership

Owns additive and higher-order Fourier methods. Nilsequence/inverse-theorem and transference engines are constructed before prime-pattern applications; no prime-tuples conjecture is assumed silently.

Subject families: 11B, 11P.

Use [the campaign execution protocol](../../campaign-guide/AI_EXECUTION.md). The stages below are mathematical work specifications. Source acquisition, statement checking, proof decomposition, Lean elaboration and proof completion are distinct states.

## Stages

### AC.0 Sumsets and energy

**Construct and export.** Build sumsets, additive energy, convolution and Fourier analysis on finite abelian groups; prove basic Plunnecke/Ruzsa and energy inequalities with cardinality assumptions.

**Inputs.** `ClassicalArithmeticCompletion:CA.2`, `FoundationsAndLibraryIntegration:LI.2`

**Acceptance.** Empty sets, torsion and normalization of counting measure are explicit.

**Source route.** Selected sources: GREEN-TAO, TAO-VU. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### AC.1 Structure and randomness

**Construct and export.** Prove Balog-Szemeredi-Gowers and source-scoped Freiman-type inverse results; define Bohr sets, regularity and density increments with quantitative losses.

**Inputs.** `AdditiveCombinatorics:AC.0`

**Acceptance.** Specify ambient group, torsion restrictions and dependence on doubling constants.

**Source route.** Selected sources: GREEN-TAO, TAO-VU. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### AC.2 Progressions and removal

**Construct and export.** Formalize Roth/Szemeredi and arithmetic removal through one selected complete proof route; include ergodic/combinatorial infrastructure as owned prerequisites.

**Inputs.** `AdditiveCombinatorics:AC.1`

**Acceptance.** The theorem quantifies progression length and density; finite quantitative and infinite positive-density forms are connected by a proved correspondence.

**Source route.** Selected sources: GREEN-TAO, TAO-VU. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### AC.3 Gowers norms and nilsequences

**Construct and export.** Construct Gowers uniformity norms, generalized von Neumann estimates, inverse theorems in their proved settings and nilmanifold/nilsequence complexity.

**Inputs.** `AdditiveCombinatorics:AC.2`

**Acceptance.** Characteristic restrictions and complexity bounds are retained; an inverse theorem over finite fields is not reused over cyclic groups without a bridge.

**Source route.** Green-Tao-Ziegler inverse theorem arXiv:1009.3998 plus April 2024 erratum; full proof and corrected nilsequence argument required. The announcement alone is insufficient.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### AC.4 Transference to primes

**Construct and export.** Construct pseudorandom majorants, dense-model and relative counting theorems, then implement the Green-Tao prime-progression proof.

**Inputs.** `AdditiveCombinatorics:AC.3`, `SieveMethodsAndPrimePatterns:SV.3`

**Acceptance.** Every linear-forms/correlation condition is proved for the chosen majorant; sparse primes do not directly satisfy a positive-density hypothesis.

**Source route.** Selected sources: GREEN-TAO, TAO-VU. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### AC.5 Linear patterns and multiplicative orthogonality

**Construct and export.** Add finite-complexity systems of linear equations in primes and Mobius/nilsequence orthogonality via their separate source proofs. State local factors and exclude proportional degeneracies.

**Inputs.** `AdditiveCombinatorics:AC.4`

**Acceptance.** Admissibility and finite complexity are checked at the use site; polynomial and unrestricted prime patterns remain separately scoped targets.

**Source route.** New primary-proof acquisition: Green-Tao Mobius-nilsequence orthogonality and Linear equations in primes, with exact complexity/correlation hypotheses; Green-Tao 2008 prime progressions alone is insufficient.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

## Reference access and completion

See [the extension source register](../../campaign-guide/EXTENSION_SOURCES.md). A catalogue or abstract check does not count as checking a proof. Missing source editions and theorem locators are explicit preparation tasks in the generated work queue.

Before marking this area implemented, every exported object needs its construction and reusable API; every theorem needs a kernel-checked proof and actual consumer instantiation. Record failed hypotheses and conversions explicitly. If a dependency is absent, add a named construction stage and update the graph before using it.
