# Geometry of numbers, quadratic forms and homogeneous arithmetic

Revision: 2026-09-15. Curriculum extension with explicit construction targets. These stages must be source-decomposed before proof execution.

## Scope and ownership

Reuse QuadraticFormInvariants, GlobalQuadraticForms and AdelicAlgebraicGroups. General homogeneous-dynamics theorems are separate substantial source developments, not corollaries of Minkowski.

Subject families: 11E, 11H.

Use [the campaign execution protocol](../../campaign-guide/AI_EXECUTION.md). The stages below are mathematical work specifications. Source acquisition, statement checking, proof decomposition, Lean elaboration and proof completion are distinct states.

## Stages

### GN.0 Lattices and covolumes

**Construct and export.** Use discrete cocompact lattices in real finite-dimensional spaces, fundamental domains, covolumes and change of basis; handle complex embeddings through real dimensions.

**Inputs.** `FoundationsAndLibraryIntegration:LI.1`, `FoundationsAndLibraryIntegration:LI.2`

**Acceptance.** Covolumes transform by the absolute determinant, including the number-field embedding factors.

**Source route.** Selected sources: MILNE-ANT, VOIGHT, MARGULIS. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### GN.1 Convex-body and successive-minima theorems

**Construct and export.** Prove Blichfeldt and Minkowski first/second theorems with measurable convex symmetric bodies and boundary conventions; obtain ideal-class and unit applications via existing number-field owners.

**Inputs.** `GeometryOfNumbersAndQuadraticArithmetic:GN.0`

**Acceptance.** Check dimension zero, non-full-rank lattices and equality/boundary hypotheses; export actual inequalities and existence witnesses.

**Source route.** Selected sources: MILNE-ANT, VOIGHT, MARGULIS. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### GN.2 Quadratic and hermitian local-global theory

**Construct and export.** Integrate Witt groups, discriminants, Clifford/Hasse invariants, local classification and Hasse-Minkowski; add integral lattices, genera, spinor genera and quaternionic/hermitian variants with characteristic restrictions.

**Inputs.** `GeometryOfNumbersAndQuadraticArithmetic:GN.1`, `FoundationsAndLibraryIntegration:LI.4`

**Acceptance.** Keep rational equivalence, integral isometry and genus distinct; verify dyadic and real-place invariants and the product formula.

**Source route.** Selected sources: MILNE-ANT, VOIGHT, MARGULIS. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### GN.3 Reduction, mass and theta series

**Construct and export.** Construct reduction domains and arithmetic quotients, local representation densities, mass formulas and theta-series interfaces. Specify Haar measures and finite stabilizer weights before a numerical mass identity.

**Inputs.** `GeometryOfNumbersAndQuadraticArithmetic:GN.2`

**Acceptance.** A genus mass is a weighted class sum, and its equality to an Euler product uses proved convergence and local normalizations.

**Source route.** Selected sources: MILNE-ANT, VOIGHT, MARGULIS. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### GN.4 Lattice points and homogeneous dynamics

**Construct and export.** Develop lattice-point estimates and equidistribution; separately schedule ergodic/mixing, unipotent-flow and nondivergence proofs needed for Oppenheim/Duke-type arithmetic applications. Include packing/covering and nonconvex star-body problems, transference and Siegel mean-value formulas with their actual covolume/integrability assumptions; connect lattice codes through FF.4.

**Inputs.** `GeometryOfNumbersAndQuadraticArithmetic:GN.3`

**Acceptance.** Name the exact acting group, quotient, measure and irrationality assumptions; quantitative error terms require their own spectral or dynamical estimates.

**Source route.** Selected sources: MILNE-ANT, VOIGHT, MARGULIS. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### GN.5 Certified reductions and applications

**Construct and export.** Supply LLL-style reduction and number-field/arithmetic-group consumers with exact change-of-basis certificates; relate lattice bounds to heights, counts and local representation tests.

**Inputs.** `GeometryOfNumbersAndQuadraticArithmetic:GN.0`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1`, `ClassicalArithmeticCompletion:CA.3`

**Acceptance.** A short-vector output is checked in the original lattice and its proven approximation factor; floating-point output alone is not a proof.

**Source route.** Selected sources: MILNE-ANT, VOIGHT, MARGULIS. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### GN.6 Hermitian K-theory and Grothendieck-Witt groups

**Construct and export.** Construct exact categories with duality, symmetric/alternating forms, Grothendieck-Witt and Witt groups, higher hermitian K spaces, localization and source-scoped periodicity. Reuse stable/exact K-theory and prove comparison/forgetful/hyperbolic maps; retain invertibility-of-two and regularity restrictions.

**Inputs.** `GeometryOfNumbersAndQuadraticArithmetic:GN.2`, `FoundationsAndLibraryIntegration:LI.3`, `GeneralAlgebraicKTheory:K.4:construction`, `GeneralAlgebraicKTheory:K.6`

**Acceptance.** Recover degree-zero forms and the hyperbolic/forgetful relations. Do not substitute ordinary K groups for hermitian K groups or omit the dyadic case restrictions.

**Source route.** New primary-source acquisition/decomposition task: Schlichting Hermitian K-theory of exact categories, and arXiv:1209.0848 for derived/Karoubi variants. State exact duality and invertibility-of-two hypotheses. K.6 is required only by the selected full nonconnective/localization subbranch, not the degree-zero start.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

## Reference access and completion

See [the extension source register](../../campaign-guide/EXTENSION_SOURCES.md). A catalogue or abstract check does not count as checking a proof. Missing source editions and theorem locators are explicit preparation tasks in the generated work queue.

Before marking this area implemented, every exported object needs its construction and reusable API; every theorem needs a kernel-checked proof and actual consumer instantiation. Record failed hypotheses and conversions explicitly. If a dependency is absent, add a named construction stage and update the graph before using it.
