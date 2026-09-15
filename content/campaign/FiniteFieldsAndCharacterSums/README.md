# Finite fields, character sums, finite rings and coding interfaces

Revision: 2026-09-15. Curriculum extension with explicit construction targets. These stages must be source-decomposed before proof execution.

## Scope and ownership

Finite-field algorithms, finite commutative-ring structure and arithmetic applications use the same field carriers as cohomology and local arithmetic. Weil bounds require nondegeneracy hypotheses.

Subject families: 11T, 11L.

Use [the campaign execution protocol](../../campaign-guide/AI_EXECUTION.md). The stages below are mathematical work specifications. Source acquisition, statement checking, proof decomposition, Lean elaboration and proof completion are distinct states.

## Stages

### FF.0 Finite-field constructions

**Construct and export.** Build certified presentations, Frobenius, subfields, trace, norm, normal bases and tensor decompositions; reuse existing finite-field classification and cardinality results.

**Inputs.** `ClassicalArithmeticCompletion:CA.3`

**Acceptance.** Field isomorphisms include inverse maps; the absolute and relative Frobenius exponents and trace targets are explicit.

**Source route.** Selected sources: SHOUP, DELIGNE. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### FF.1 Characters and elementary sums

**Construct and export.** Construct additive and multiplicative characters, orthogonality, Gauss and Jacobi sums and their norm/product identities; extend zero values consistently.

**Inputs.** `FiniteFieldsAndCharacterSums:FF.0`

**Acceptance.** The trivial-character case is separated and every sum has its exact domain and normalization.

**Source route.** Selected sources: SHOUP, DELIGNE. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### FF.2 Weil and Deligne bounds

**Construct and export.** State polynomial/rational exponential-sum bounds via curves and l-adic trace functions. Require the relevant nontriviality, conductor and purity conditions; import actual cohomological estimates from WeilConjectures and DeligneWeightsAndPurity. For general trace functions isolate geometric invariant contributions in top compact-support cohomology and subtract the resulting main term before a square-root error estimate; do not treat H_c^2 as automatically zero.

**Inputs.** `FiniteFieldsAndCharacterSums:FF.1`, `WeilConjectures:WC.3`, `DeligneWeightsAndPurity:DWP.7`

**Acceptance.** Artin-Schreier-trivial functions and multiplicative perfect powers are tested as degenerate cases rather than receiving a false square-root bound.

**Source route.** Selected sources: SHOUP, DELIGNE. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### FF.3 Factorization and point counting

**Construct and export.** Prove finite-field polynomial factorization, Hensel interfaces and certified point-counting algorithms, with bit-operation and randomness models stated separately.

**Inputs.** `FiniteFieldsAndCharacterSums:FF.2`

**Acceptance.** Factor products and irreducibility witnesses are checked; a point count agrees with the trace convention and a provable error bound.

**Source route.** Selected sources: SHOUP, DELIGNE. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### FF.4 Finite rings, sequences and codes

**Construct and export.** Develop Galois rings, additive polynomials, permutation polynomials and sequence correlation; connect evaluation/residue codes to existing AlgebraicCodingTheory and AlgebraicCurves. Add finite upper half-plane/homogeneous-space constructions and finite harmonic-analysis interfaces with chosen group actions and measures.

**Inputs.** `FiniteFieldsAndCharacterSums:FF.3`, `SchemeAndStackFoundations:SF.3`

**Acceptance.** Encoding maps, dimension and distance bounds are proved; BCH/Reed-Solomon examples include field-size and length restrictions.

**Source route.** Selected sources: SHOUP, DELIGNE. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### FF.5 Arithmetic applications

**Construct and export.** Provide character-sum, finite-ring and algorithm certificates to exponential sums, local-density and computational owners; distinguish mathematical correctness from cryptographic hardness hypotheses.

**Inputs.** `FiniteFieldsAndCharacterSums:FF.4`

**Acceptance.** Consumers instantiate the exact conductor/degree constants and cannot infer security from finite-field correctness.

**Source route.** Selected sources: SHOUP, DELIGNE. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

## Reference access and completion

See [the extension source register](../../campaign-guide/EXTENSION_SOURCES.md). A catalogue or abstract check does not count as checking a proof. Missing source editions and theorem locators are explicit preparation tasks in the generated work queue.

Before marking this area implemented, every exported object needs its construction and reusable API; every theorem needs a kernel-checked proof and actual consumer instantiation. Record failed hypotheses and conversions explicitly. If a dependency is absent, add a named construction stage and update the graph before using it.
