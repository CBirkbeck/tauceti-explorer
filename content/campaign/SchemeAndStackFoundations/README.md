# Scheme, stack, cohomology and intersection foundations

Revision: 2026-09-15. Curriculum extension with explicit construction targets. These stages must be source-decomposed before proof execution.

## Scope and ownership

Build or reuse general foundations before arithmetic specialization. Adopt the existing curve, moduli, derived-sheaf and duality owners by exact theorem interfaces; no assumption of general resolution in positive characteristic.

Subject families: 14A, 14C, 14D, 14F.

Use [the campaign execution protocol](../../campaign-guide/AI_EXECUTION.md). The stages below are mathematical work specifications. Source acquisition, statement checking, proof decomposition, Lean elaboration and proof completion are distinct states.

## Stages

### SF.0 Schemes and morphisms

**Construct and export.** Construct schemes, quasi-coherent modules and relative Spec/Proj, affine gluing and fiber products. State flat, smooth, etale, proper, separated and finite-presentation hypotheses as properties of named morphisms.

**Inputs.** `FoundationsAndLibraryIntegration:LI.1`

**Acceptance.** Base-change diagrams identify every arrow; a flat universal family cannot establish flatness of its parameter scheme.

**Source route.** Stacks chapters on schemes/morphisms, stable tags required

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### SF.1 Descent and algebraic spaces/stacks

**Construct and export.** Prove effective fpqc/fppf descent for the required objects, algebraic-space quotients, representable diagonals and atlas independence. Separate a moduli functor from a stack and a coarse space from a fine moduli object.

**Inputs.** `SchemeAndStackFoundations:SF.0`, `FoundationsAndLibraryIntegration:LI.3`

**Acceptance.** A quotient consumer receives the universal property and stabilizer conditions; representability and properness are separate proofs.

**Source route.** Stacks descent/algebraic spaces/stacks; Poonen Chapters 3-5

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### SF.2 Sites and scheme cohomology

**Construct and export.** Own Zariski, etale, fppf and pro-etale site comparisons at the appropriate coefficient level; construct sheaf cohomology, localization, proper/smooth base change and compact support. Integrate CohomologicalPointCounting suppliers and EtaleDualityAndPerverseSheaves rather than inventing a parallel six-operations API.

**Inputs.** `SchemeAndStackFoundations:SF.1`

**Acceptance.** Specify torsion order invertible on the base where required, and distinguish torsion, l-adic and rational coefficients in every export.

**Source route.** Stacks etale cohomology; pinned CohomologicalPointCounting

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### SF.3 Curves, divisors and Picard objects

**Construct and export.** Integrate AlgebraicCurves and JacobianChallenge: divisors, line bundles, Riemann-Roch, Serre duality, genus, Picard schemes and Jacobians. Record connectedness, smoothness, projectivity and base-point hypotheses for Abel-Jacobi constructions.

**Inputs.** `SchemeAndStackFoundations:SF.2`

**Acceptance.** Check genus zero and one, extension of scalars, degree zero, and identification of the Jacobian Tate module with degree-one etale cohomology under the chosen dual conventions.

**Source route.** Pinned AlgebraicCurves/JacobianChallenge and their original sources

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### SF.4 Deformations, models and birational geometry

**Construct and export.** Develop infinitesimal lifting and obstruction complexes; formal schemes, algebraization, semistable reduction and alterations. Route Neron models and stable reduction through existing owners. Resolution is a theorem only in a named proved setting; alterations and modifications keep their distinct outputs.

**Inputs.** `SchemeAndStackFoundations:SF.3`

**Acceptance.** An algebraized object comes with a comparison to its completion; a model records its base, generic fiber and allowable base extension.

**Source route.** Stacks deformation/formal geometry and named reduction sources

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### SF.5 Intersection theory and Riemann-Roch

**Construct and export.** Construct Chow groups, rational equivalence, proper pushforward, flat/lci pullback, refined Gysin maps, Chern classes and intersection products. Prove source-scoped Grothendieck-Riemann-Roch and the Hodge index theorem for smooth projective surfaces; supply the product-of-curves intersection route to Weil bounds. Name surface Riemann-Roch, adjunction and the graph/diagonal intersection lemmas as intermediate constructions in the product-of-curves proof.

**Inputs.** `SchemeAndStackFoundations:SF.4`

**Acceptance.** Check projection and excess-intersection formulas, integrality versus rational coefficients, and the graph-of-Frobenius intersection computation before using a surface proof of RH for curves.

**Source route.** Fulton Intersection Theory and Hodge index original sources; full source acquisition required

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### SF.6 Arithmetic cohomology handoffs

**Construct and export.** Produce exact interface comparisons to crystalline/prismatic, analytic and l-adic owners, retaining topology, completion, properness, smoothness and coefficient restrictions. Integrate cycle classes and traces with intersection pairings.

**Inputs.** `SchemeAndStackFoundations:SF.5`

**Acceptance.** A comparison is a constructed natural map with stated isomorphism conditions and compatibility diagrams, not a common dimension count.

**Source route.** Existing crystalline/prismatic/etale comparison source contracts

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

## Reference access and completion

See [the extension source register](../../campaign-guide/EXTENSION_SOURCES.md). A catalogue or abstract check does not count as checking a proof. Missing source editions and theorem locators are explicit preparation tasks in the generated work queue.

Before marking this area implemented, every exported object needs its construction and reusable API; every theorem needs a kernel-checked proof and actual consumer instantiation. Record failed hypotheses and conversions explicitly. If a dependency is absent, add a named construction stage and update the graph before using it.
