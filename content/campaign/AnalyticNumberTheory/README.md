# Analytic number theory, zeta functions and prime distribution

Revision: 2026-09-15. Curriculum extension with explicit construction targets. These stages must be source-decomposed before proof execution.

## Scope and ownership

Reuse ArithmeticDirichletSeries and Chebotarev where exact interfaces exist. Distinguish unconditional analytic theorems from RH/GRH, Artin holomorphy, Selberg-class conjectures and uniformity assumptions.

Subject families: 11M, 11N.

Use [the campaign execution protocol](../../campaign-guide/AI_EXECUTION.md). The stages below are mathematical work specifications. Source acquisition, statement checking, proof decomposition, Lean elaboration and proof completion are distinct states.

## Stages

### AN.0 Dirichlet series and summation

**Construct and export.** Develop arithmetic functions, absolute convergence, Euler products, partial summation, Mellin transforms and Perron inversion with explicit truncation errors. Match the existing Dirichlet-series carrier and normalization.

**Inputs.** `ClassicalArithmeticCompletion:CA.0`, `FoundationsAndLibraryIntegration:LI.2`

**Acceptance.** Termwise differentiation, interchange of limits and Euler products each carry convergence proofs.

**Source route.** KED-ANT Chapters 1-2 and 9 for Perron/truncation

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### AN.1 Zeta and Dirichlet L-functions

**Construct and export.** Construct continuation and functional equations, gamma factors, completed functions, trivial zeros, poles and nonvanishing at one for nontrivial Dirichlet characters.

**Inputs.** `AnalyticNumberTheory:AN.0`, `FiniteFieldsAndCharacterSums:FF.1`

**Acceptance.** Principal and imprimitive characters retain their missing Euler factors; functional equations include conductor, Gauss sum and parity.

**Source route.** KED-ANT Chapters 3, 5-6

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### AN.2 Prime number theorems

**Construct and export.** Prove zero-free line/region and Tauberian or contour arguments giving PNT and PNT in fixed arithmetic progressions; track Chebyshev functions and conversion to prime counts.

**Inputs.** `AnalyticNumberTheory:AN.1`

**Acceptance.** The AP statement requires coprime residue class and specifies whether modulus is fixed; ineffective constants and possible exceptional zeros are labelled.

**Source route.** KED-ANT Chapters 1, 4, 7, 10

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### AN.3 Explicit formulas and density estimates

**Construct and export.** Build zero-counting formulas, explicit formulas, zero-density and mean-value estimates with test-function hypotheses and error terms. Add short-interval and arithmetic-progression applications only within their proved ranges.

**Inputs.** `AnalyticNumberTheory:AN.2`

**Acceptance.** A contour shift accounts for poles, trivial zeros and horizontal integrals; no GRH estimate is imported into an unconditional theorem.

**Source route.** KED-ANT Chapters 8-10 for explicit formulas; separate primary zero-density and mean-value sources required

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### AN.4 Hecke, Dedekind and Artin analytic interfaces

**Construct and export.** Connect number-field ideal counting, Hecke characters and completed L-functions to the analytic class-number formula and Chebotarev. Meromorphic continuation via induction is distinguished from Artin holomorphy.

**Inputs.** `AnalyticNumberTheory:AN.3`, `FoundationsAndLibraryIntegration:LI.4`

**Acceptance.** Verify real/complex gamma factors, residue constants and ramified Euler factors against reciprocity/Frobenius conventions.

**Source route.** KED-CFT Sections 2.4, 6; LI.4 original analytic references

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### AN.5 Multiplicative functions and value distribution

**Construct and export.** Develop mean values, Halasz-type results, pretentious distances, smooth numbers, divisor problems and moments of zeta/L-functions in separately sourced ranges. Define random-matrix and correlation predictions as conjectural models. Add Beurling generalized integers/primes only with their axioms and growth assumptions, and separate them from the ordinary-prime theorems.

**Inputs.** `AnalyticNumberTheory:AN.4`

**Acceptance.** Uniformity in function, height and conductor is explicit; averaging weights and exceptional sets cannot be suppressed.

**Source route.** Select complete mean-value sources; KED-ANT alone insufficient

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### AN.6 Analytic consumers and scope

**Construct and export.** Export zero-free/density/explicit-formula contracts to sieves, arithmetic statistics and automorphic L-functions. Maintain a statement register for RH, GRH, prime tuples and general functorial analytic continuation.

**Inputs.** `AnalyticNumberTheory:AN.5`

**Acceptance.** Every downstream estimate cites the exact theorem and constants or dependencies; a conditional statement exposes its hypothesis in its type.

**Source route.** Stage contracts AN.0-5; source-specific downstream estimates

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### AN.7 Hurwitz, Lerch and parameter-dependent zeta functions

**Construct and export.** Construct Hurwitz and Lerch zeta functions and their continuation, parameter singularities, functional relations and special values. State branches and domains; connect cyclotomic/Dirichlet specializations by explicit identities.

**Inputs.** `AnalyticNumberTheory:AN.1`

**Acceptance.** Check the pole at s=1 for Hurwitz zeta and the z=1 Lerch degeneration separately from generic Lerch parameters, together with forbidden parameter values and branch cuts. Continue identities only on their specified domains.

**Source route.** New primary-source acquisition/decomposition task: complete Hurwitz/Lerch continuation and functional-relation sources with parameter/branch cases. Kedlaya zeta notes alone do not establish this whole parameter-dependent family.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### AN.8 Several-variable and prehomogeneous zeta functions

**Construct and export.** Build selected multiple Dirichlet series, prehomogeneous vector-space zeta integrals and local densities, with orbit decomposition, Poisson summation and functional equations in exact proved cases. Import Igusa/motivic local methods via LD.3 and match coefficient/local-factor conventions.

**Inputs.** `AnalyticNumberTheory:AN.4`, `LogicAndDefinabilityInNumberTheory:LD.3`, `AutomorphicLFunctionsAndLocalFactors:AL.0`, `AdelicAlgebraicGroups:AA.2`

**Acceptance.** Multiple zeta values belong to PS and are not identified with all multivariate Dirichlet series. Record convergence tubes, singular hyperplanes and matrix-valued functional equations.

**Source route.** New primary-source acquisition/decomposition task: Sato-Shintani prehomogeneous-vector-space zeta and a separately selected multiple-Dirichlet-series source, with local and global functional-equation proofs.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### AN.9 Spectral zeta and arithmetic noncommutative systems

**Construct and export.** Construct selected Selberg/spectral zeta functions, regularized determinants and trace-formula comparisons on the exact compact or finite-volume quotient hypotheses. Register arithmetic noncommutative systems such as Bost-Connes separately, with algebra, dynamics, KMS states and arithmetic symmetry action from complete sources.

**Inputs.** `AnalyticNumberTheory:AN.7`, `AnalyticNumberTheory:AN.8`, `AutomorphicSpectralTheory:AS.4`, `AutomorphicSpectralTheory:AS.6`, `ArithmeticLocallySymmetricSpaces:ALS.0`, `FoundationsAndLibraryIntegration:LI.2`

**Acceptance.** Distinguish spectral RH analogues from Riemann RH and keep continuous spectrum/cusp corrections. A partition-function identity with zeta is not a proof of a zero-location conjecture.

**Source route.** New primary-source acquisition/decomposition task: a complete Selberg-zeta/regularized-determinant proof in the selected quotient setting; separately Bost-Connes Hecke Algebras, Type III Factors and Phase Transitions with C*-algebra/KMS constructions. No Riemann hypothesis consequence.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

## Reference access and completion

See [the extension source register](../../campaign-guide/EXTENSION_SOURCES.md). A catalogue or abstract check does not count as checking a proof. Missing source editions and theorem locators are explicit preparation tasks in the generated work queue.

Before marking this area implemented, every exported object needs its construction and reusable API; every theorem needs a kernel-checked proof and actual consumer instantiation. Record failed hypotheses and conversions explicitly. If a dependency is absent, add a named construction stage and update the graph before using it.
