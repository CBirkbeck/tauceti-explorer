# Sieve methods, prime gaps and prime patterns

Revision: 2026-09-15. Curriculum extension with explicit construction targets. These stages must be source-decomposed before proof execution.

## Scope and ownership

Kedlaya Chapters 20-21 are explicitly incomplete, so the Maynard original is a separate proof source for the bounded-gap endpoint. General prime-tuples conjectures are frontier statements.

Subject families: 11N, 11P.

Use [the campaign execution protocol](../../campaign-guide/AI_EXECUTION.md). The stages below are mathematical work specifications. Source acquisition, statement checking, proof decomposition, Lean elaboration and proof completion are distinct states.

## Stages

### SV.0 Sieve data and local densities

**Construct and export.** Define sequences, sifted sets, multiplicative local densities, remainder sums, sieve dimension and level of distribution. Prove inclusion-exclusion and elementary upper/lower bounds.

**Inputs.** `AnalyticNumberTheory:AN.0`

**Acceptance.** Check excluded residue classes, support of weights and exact dependence of error on the level.

**Source route.** KED-ANT Chapter 11

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### SV.1 Brun and Selberg sieves

**Construct and export.** Implement combinatorial and quadratic-form weight constructions, fundamental-lemma estimates in their proved ranges, and upper-bound sieve applications. Reuse the existing Mathlib SelbergSieve carrier after inspecting types.

**Inputs.** `SieveMethodsAndPrimePatterns:SV.0`

**Acceptance.** Positivity and optimization of weights are proved; parity limitations are not hidden by an unsupported lower bound for primes.

**Source route.** KED-ANT Chapters 12-14

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### SV.2 Large sieve and bilinear sums

**Construct and export.** Prove additive and multiplicative large-sieve inequalities, duality, primitive-character reduction, and bilinear decompositions such as Vaughan identities.

**Inputs.** `SieveMethodsAndPrimePatterns:SV.1`, `AnalyticNumberTheory:AN.3`

**Acceptance.** Orthogonality uses the correct character family; diagonal and principal-character terms remain visible.

**Source route.** KED-ANT Chapters 15-16 and Chapter 18 for Vaughan identity

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### SV.3 Average distribution of primes

**Construct and export.** Derive Bombieri-Vinogradov from the selected large-sieve/zero-density route, with its quantifiers in A, B, x and Q. Treat stronger distribution assumptions as explicit conditions.

**Inputs.** `SieveMethodsAndPrimePatterns:SV.2`

**Acceptance.** Test the boundary Q <= x^(1/2)/(log x)^B and retain the weighted sum over moduli and maximum over reduced residues.

**Source route.** KED-ANT Chapters 17-18

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### SV.4 Bounded gaps and clusters

**Construct and export.** Construct multidimensional sieve weights, asymptotic quadratic forms and the positivity argument in Maynard. Supply a finite admissible tuple and the analytic estimates yielding a finite bound on repeated prime gaps.

**Inputs.** `SieveMethodsAndPrimePatterns:SV.3`

**Acceptance.** The output is an explicit or existential finite bound supported by the source; it is not the twin-prime conjecture.

**Source route.** Maynard original paper; KED-ANT Chapters 20-21 only outline

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### SV.5 Almost primes and advanced sieves

**Construct and export.** Add beta/weighted sieves, Chen-type and affine-sieve routes as separate developments with their own bilinear, parity-breaking and expansion inputs. Transfer only the exact almost-prime conclusion proved.

**Inputs.** `SieveMethodsAndPrimePatterns:SV.4`

**Acceptance.** State the number of prime factors, multiplicity convention, orbit hypotheses and excluded local obstructions in each application.

**Source route.** Select original Chen/beta/affine sieve papers, no proof-source substitution

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

## Reference access and completion

See [the extension source register](../../campaign-guide/EXTENSION_SOURCES.md). A catalogue or abstract check does not count as checking a proof. Missing source editions and theorem locators are explicit preparation tasks in the generated work queue.

Before marking this area implemented, every exported object needs its construction and reusable API; every theorem needs a kernel-checked proof and actual consumer instantiation. Record failed hypotheses and conversions explicitly. If a dependency is absent, add a named construction stage and update the graph before using it.
