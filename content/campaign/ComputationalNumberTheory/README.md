# Certified computational number theory and arithmetic data

Revision: 2026-09-15. Curriculum extension with explicit construction targets. These stages must be source-decomposed before proof execution.

## Scope and ownership

Algorithms export mathematical certificates and correctness/termination theorems. Experimental data, conditional complexity bounds and numerical guesses have distinct statuses.

Subject families: 11Y, 11C, 11T.

Use [the campaign execution protocol](../../campaign-guide/AI_EXECUTION.md). The stages below are mathematical work specifications. Source acquisition, statement checking, proof decomposition, Lean elaboration and proof completion are distinct states.

## Stages

### CN.0 Representations and complexity

**Construct and export.** Specify exact integers/rationals, algebraic numbers, finite fields, ideals, lattices and p-adic approximations. Fix bit complexity, randomness and precision models; use canonical mathematical carriers with separate computable presentations.

**Inputs.** `ClassicalArithmeticCompletion:CA.3`

**Acceptance.** Conversions commute with ring/field operations and carry equality/embedding proofs; random algorithms state success and error guarantees.

**Source route.** Selected sources: SHOUP, LOCAL. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### CN.1 Primality and factorization

**Construct and export.** Implement primality certificates and source-scoped deterministic/probabilistic tests; factor integers and polynomials using checked factors and irreducibility proofs.

**Inputs.** `ComputationalNumberTheory:CN.0`, `FiniteFieldsAndCharacterSums:FF.3`

**Acceptance.** A factorization output multiplies to the original input; probable prime and proven prime are separate result types.

**Source route.** Selected sources: SHOUP, LOCAL. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### CN.2 Number fields and local fields

**Construct and export.** Certify integral bases, orders, ideal decomposition, unit/class groups and local expansions. State conditional running-time assumptions and independent stopping certificates.

**Inputs.** `ComputationalNumberTheory:CN.1`, `FoundationsAndLibraryIntegration:LI.4`

**Acceptance.** A list of units generates the claimed full group only after an index bound/certificate; class-group completeness is not inferred from found relations alone.

**Source route.** Selected sources: SHOUP, LOCAL. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### CN.3 Curves and modular forms

**Construct and export.** Provide exact modular symbols, Hecke matrices, q-expansions, point counts, isogenies and descent computations through existing owners. Prove Sturm-style truncation bounds before declaring forms equal.

**Inputs.** `ComputationalNumberTheory:CN.2`, `SchemeAndStackFoundations:SF.3`, `ModularCurvesPartII:R14.1`, `ModularCurvesPartII:R12.5`, `UPSTREAM:ModularForms-finite-index-subgroups`

**Acceptance.** Each output links to an intrinsic object; level, weight and character and bad-prime corrections are checked.

**Source route.** Selected sources: SHOUP, LOCAL. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### CN.4 Validated real and p-adic numerics

**Construct and export.** Construct interval/ball arithmetic, precision propagation, certified roots, L-value approximations and analytic continuation where required. Relate numerical error to the target mathematical theorem.

**Inputs.** `ComputationalNumberTheory:CN.0`, `AnalyticNumberTheory:AN.4`

**Acceptance.** A sign, zero, rank or nonvanishing claim uses an enclosing interval excluding the wrong value; numerical near-equality is not an exact identity.

**Source route.** Selected sources: SHOUP, LOCAL. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### CN.5 Data and reproducibility

**Construct and export.** Define certificate schemas for databases, explicit examples and algorithm benchmarks; pin inputs, software and arithmetic conventions. Check certificates in Lean and report algorithm versus verification cost.

**Inputs.** `ComputationalNumberTheory:CN.4`

**Acceptance.** An LMFDB label or CAS result supplies data to verify, not a theorem; every dataset-derived claim includes a reproducible certificate.

**Source route.** Selected sources: SHOUP, LOCAL. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

## Reference access and completion

See [the extension source register](../../campaign-guide/EXTENSION_SOURCES.md). A catalogue or abstract check does not count as checking a proof. Missing source editions and theorem locators are explicit preparation tasks in the generated work queue.

Before marking this area implemented, every exported object needs its construction and reusable API; every theorem needs a kernel-checked proof and actual consumer instantiation. Record failed hypotheses and conversions explicitly. If a dependency is absent, add a named construction stage and update the graph before using it.
