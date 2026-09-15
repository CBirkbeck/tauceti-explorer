# Modularity, automorphy and Langlands endpoint extensions

Revision: 2026-09-15. Curriculum extension with explicit construction targets. These stages must be source-decomposed before proof execution.

## Scope and ownership

Owns endpoints beyond the original infrastructure. Established theorems keep their source hypotheses; general functoriality, all motives automorphic and unrestricted categorical correspondences are research specifications, not assumed results.

Subject families: 11F, 11G, 11R.

Use [the campaign execution protocol](../../campaign-guide/AI_EXECUTION.md). The stages below are mathematical work specifications. Source acquisition, statement checking, proof decomposition, Lean elaboration and proof completion are distinct states.

## Stages

### ML.0 Endpoint and normalization registry

**Construct and export.** Define a common register of automorphic/Galois objects, coefficient fields, infinity types, local parameters, conductors and normalization conversions. Bind every theorem to a selected source version and exact original stage producers.

**Inputs.** `FoundationsAndLibraryIntegration:LI.4`

**Acceptance.** Each endpoint has an explicit known/conditional/conjectural status and a map to all of its prerequisite constructions.

**Source route.** Selected sources: NEWTON-THORNE, ARTHUR-MOK, EXISTING. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### ML.1 Weight one and broader modularity

**Construct and export.** Organize Deligne-Serre Artin representations, weight-one modularity in proved cases, and modularity over totally real/CM fields with source-scoped restrictions. Separate these from the existing weight-at-least-two cohomological and GL2/Q endpoints.

**Inputs.** `ModularityAndLanglandsExtensions:ML.0`

**Acceptance.** Do not derive weight-one representations from a weight-two Jacobian or claim all elliptic curves over arbitrary number fields are covered.

**Source route.** Selected sources: NEWTON-THORNE, ARTHUR-MOK, EXISTING. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### ML.2 Potential automorphy assembly

**Construct and export.** Apply PotentialAutomorphyInfrastructure with full regularity, polarization, residual-image, local and field-extension hypotheses; track compatible systems and descent. Supply the final theorem independently of a folder merely advertising infrastructure.

**Inputs.** `ModularityAndLanglandsExtensions:ML.1`, `PotentialAutomorphyInfrastructure:PA.5`

**Acceptance.** The output is automorphy after the specified extension; descent to the original field requires its own theorem and hypotheses.

**Source route.** Selected sources: NEWTON-THORNE, ARTHUR-MOK, EXISTING. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### ML.3 Symmetric powers and Sato-Tate

**Construct and export.** Integrate Newton-Thorne source-scoped symmetric-power automorphy, CM/non-CM branches and resulting analytic/equidistribution arguments. Supply nonvanishing/analytic inputs for the Weyl criterion separately.

**Inputs.** `ModularityAndLanglandsExtensions:ML.2`, `AnalyticNumberTheory:AN.4`

**Acceptance.** Record weight, level, field and regularity assumptions per source; potential automorphy alone does not immediately prove a claimed equidistribution theorem.

**Source route.** Selected sources: NEWTON-THORNE, ARTHUR-MOK, EXISTING. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### ML.4 Classical-group classification and trace sources

**Construct and export.** Give Arthur/Mok/KMSW classification inputs explicit proof-source owners: stabilization, transfer, fundamental lemma, packets, multiplicities and local-global compatibilities. Preserve any source-specific conditional hypotheses until the exact missing result and applicable replacement are verified.

**Inputs.** `ModularityAndLanglandsExtensions:ML.0`, `AutomorphicSpectralTheory:AS.6`

**Acceptance.** The symplectic torsion branch has a named source-verification/construction task; it cannot be marked unconditional because a related unitary theorem is available.

**Source route.** Selected sources: NEWTON-THORNE, ARTHUR-MOK, EXISTING. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### ML.5 Known functorial transfers and frontiers

**Construct and export.** Register cyclic base change, automorphic induction and selected tensor/symmetric-power transfers with exact hypotheses; formalize statements and conditional implications for general global/local and categorical Langlands.

**Inputs.** `ModularityAndLanglandsExtensions:ML.3`, `ModularityAndLanglandsExtensions:ML.4`

**Acceptance.** No general correspondence is inferred from semisimple parameterization or a known GLn case; all frontier assumptions remain visible.

**Source route.** Selected sources: NEWTON-THORNE, ARTHUR-MOK, EXISTING. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

## Reference access and completion

See [the extension source register](../../campaign-guide/EXTENSION_SOURCES.md). A catalogue or abstract check does not count as checking a proof. Missing source editions and theorem locators are explicit preparation tasks in the generated work queue.

Before marking this area implemented, every exported object needs its construction and reusable API; every theorem needs a kernel-checked proof and actual consumer instantiation. Record failed hypotheses and conversions explicitly. If a dependency is absent, add a named construction stage and update the graph before using it.
