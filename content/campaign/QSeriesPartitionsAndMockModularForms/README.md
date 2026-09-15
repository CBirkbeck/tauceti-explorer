# q-series, partitions, Jacobi and mock modular forms

Revision: 2026-09-15. Curriculum extension with explicit construction targets. These stages must be source-decomposed before proof execution.

## Scope and ownership

Formal q-series and analytic modular forms are related by proved convergence maps. Mock, harmonic Maass, Jacobi and classical modular forms have distinct transformation/growth laws.

Subject families: 11B, 11F, 11P.

Use [the campaign execution protocol](../../campaign-guide/AI_EXECUTION.md). The stages below are mathematical work specifications. Source acquisition, statement checking, proof decomposition, Lean elaboration and proof completion are distinct states.

## Stages

### QM.0 Formal q-series and partitions

**Construct and export.** Build partition functions, generating products, q-binomial identities and congruences in formal power-series rings. Prove coefficientwise finiteness of infinite products and specialization maps.

**Inputs.** `ClassicalArithmeticCompletion:CA.2`

**Acceptance.** A formal identity does not imply a boundary/root-of-unity analytic value; evaluations require separate convergence or completion theorems.

**Source route.** Selected sources: ZWEGERS, ANDREWS, LOCAL. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### QM.1 Theta, eta and Jacobi forms

**Construct and export.** Construct theta/eta functions and Jacobi forms with multiplier systems, weights and indices; connect to existing ModularForms and MetaplecticAutomorphicForms owners.

**Inputs.** `QSeriesPartitionsAndMockModularForms:QM.0`, `FoundationsAndLibraryIntegration:LI.4`, `MetaplecticAutomorphicForms:MP.7`, `MetaplecticAutomorphicForms:MP.8`

**Acceptance.** Branch choices and half-integral multipliers match the metaplectic convention; cusp behavior is verified at every cusp.

**Source route.** Selected sources: ZWEGERS, ANDREWS, LOCAL. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### QM.2 Partition asymptotics and exact formulas

**Construct and export.** Develop Hardy-Ramanujan/Rademacher routes including Kloosterman sums, Bessel functions and convergence of the exact series; retain effective error terms.

**Inputs.** `QSeriesPartitionsAndMockModularForms:QM.1`, `ExponentialSumsAndCircleMethod:ES.3`

**Acceptance.** The exact formula proves integrality/equality via the source argument and distinguishes truncated approximations from the infinite identity.

**Source route.** Selected sources: ZWEGERS, ANDREWS, LOCAL. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### QM.3 Harmonic Maass forms

**Construct and export.** Define the weight Laplacian, growth conditions, holomorphic/nonholomorphic Fourier parts and the xi operator; construct Poincare series and pairing/exact-sequence interfaces.

**Inputs.** `QSeriesPartitionsAndMockModularForms:QM.2`

**Acceptance.** Operator normalizations, shadow weights and growth spaces are explicit; kernels and images are stated in the correct spaces.

**Source route.** New primary-proof acquisition: Bruinier-Funke harmonic weak Maass forms, xi operator and duality/exact-sequence theorem, with weight and growth hypotheses. Zwegers thesis alone is not the general theory.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### QM.4 Mock modular completions

**Construct and export.** Implement a selected complete Zwegers construction: indefinite theta/Appell-Lerch expressions, correction terms, transformation laws and shadows.

**Inputs.** `QSeriesPartitionsAndMockModularForms:QM.3`

**Acceptance.** A mock series is accompanied by its completion and transformation proof; equality of a few coefficients is insufficient.

**Source route.** Selected sources: ZWEGERS, ANDREWS, LOCAL. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### QM.5 Arithmetic and quantum connections

**Construct and export.** Develop source-scoped partition congruences, traces/special values and quantum modular examples, linking Habiro and ArithmeticQuantumTopology through exact radial-limit statements. QT.4 supplies the actual unified invariant and HC.3/HC.4 its evaluation/Taylor framework; prove any radial-limit comparison separately with its analytic hypotheses.

**Inputs.** `QSeriesPartitionsAndMockModularForms:QM.4`, `ArithmeticQuantumTopology:QT.4`, `HabiroCyclotomicCompletions:HC.3`, `HabiroCyclotomicCompletions:HC.4`

**Acceptance.** Root-of-unity limits, Eichler integrals and formal evaluations remain distinct until an explicit comparison proves agreement.

**Source route.** Selected sources: ZWEGERS, ANDREWS, LOCAL. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### QM.6 Moonshine and representation-theoretic arithmetic

**Construct and export.** Construct the selected vertex-operator/algebraic representation inputs, graded traces, modular transformation laws and genus-zero statements for a precise proven moonshine example. Reuse finite-group and modular-function owners; attach the complete original moonshine proof chain as independent construction work.

**Inputs.** `QSeriesPartitionsAndMockModularForms:QM.1`, `FoundationsAndLibraryIntegration:LI.3`, `ModularCurvesPartII:R12.3`, `UPSTREAM:RepresentationTheory`

**Acceptance.** A coefficient pattern is evidence to investigate, not a group representation or modularity theorem. Generalized moonshine variants retain their exact proof status and hypotheses.

**Source route.** New primary-source acquisition/decomposition task: Frenkel-Lepowsky-Meurman moonshine module; no-ghost theorem; Borcherds Monster Lie algebra/denominator identity and monstrous moonshine proof. The VOA/Monster/no-ghost inputs are owned constructions within this stage, not supplied by generic LI.3.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

## Reference access and completion

See [the extension source register](../../campaign-guide/EXTENSION_SOURCES.md). A catalogue or abstract check does not count as checking a proof. Missing source editions and theorem locators are explicit preparation tasks in the generated work queue.

Before marking this area implemented, every exported object needs its construction and reusable API; every theorem needs a kernel-checked proof and actual consumer instantiation. Record failed hypotheses and conversions explicitly. If a dependency is absent, add a named construction stage and update the graph before using it.
