# Complex multiplication and explicit reciprocity

## Scope and ownership

Reuse ShimuraVarieties V5 for the general CM theorem, AbelianSchemesAndArithmeticModuli for its geometric carriers, and the existing class-field-theory reciprocity maps. This continuation constructs explicit class fields, CM characters and computations; it is not a second canonical-model proof or a solution of Hilbert’s twelfth problem for all number fields.

## Execution status

Curriculum and construction specification. Stages are not proof-ready: pin the source edition, inspect the complete proof, match supplier declarations, and transcribe the lemma tree with exact hypotheses and locators. A source-access or decomposition task is part of the plan; no completed theorem is claimed. Preserve mathematical frontier statements as conjectures.

## Source register

- [Milne, Complex Multiplication, v0.10 (2020), §§1–4 and §§7–10](https://www.jmilne.org/math/CourseNotes/CM.pdf). **Evidence:** Contents and §9.3/9.17/9.19 inspected; complete proof leaves not transcribed.
- [Milne, The fundamental theorem of complex multiplication (2007), author source](https://www.jmilne.org/math/xnotes/). **Evidence:** Source selection; exact article and theorem proof must be registered before execution.
- [Silverman, Advanced Topics in the Arithmetic of Elliptic Curves, Chapter II](https://www.math.brown.edu/johsilve/ATAECHome.html). **Evidence:** Author contents inspected; full chapter and errata still required for explicit elliptic formulas.

<a id="cm-0"></a>
## CM.0. CM types, orders and norm maps

**Dependencies:** `FoundationsAndLibraryIntegration:LI.4`; `ShimuraData:D3`; `AbelianSchemesAndArithmeticModuli:A6`.

**Construction:** Construct orders in CM fields, proper invertible ideals, CM types and reflex norms on the existing torus/idele objects. Distinguish an order’s ideal class group from the maximal order’s class group. Prove conjugation and change-of-type formulas.

**Acceptance:** Compute a nonmaximal imaginary quadratic order and a non-Galois CM type; preserve conductor restrictions in ideal operations.

<a id="cm-1"></a>
## CM.1. Elliptic CM and ideal actions

**Dependencies:** `ComplexMultiplicationAndExplicitReciprocity:CM.0`; `AbelianSchemesAndArithmeticModuli:A5`.

**Construction:** Construct the elliptic curve associated to a complex ideal lattice and its order action. Identify isomorphism classes through proper ideal classes, with automorphism factors for j=0 and 1728. Prove that the resulting analytic quotient matches the existing elliptic scheme.

**Acceptance:** Compute the action of an invertible prime ideal and its isogeny degree; compare analytic and algebraic endomorphisms.

<a id="cm-2"></a>
## CM.2. The common general CM reciprocity theorem

**Dependencies:** `ComplexMultiplicationAndExplicitReciprocity:CM.0`; `ShimuraVarieties:V5`.

**Construction:** Import ShimuraVarieties V5’s constructed CM reciprocity and compare it with the type/reflex norm API of CM.0. Prove the actual ideal, idele and torsion-level dictionaries with the same Artin convention. Expose base field, CM endomorphism field and reflex field separately.

**Acceptance:** Verify the action on torsion and polarizations in a dimension-two example. This stage cannot become a prerequisite of V5.

<a id="cm-3"></a>
## CM.3. Class polynomials and ring class fields

**Dependencies:** `ComplexMultiplicationAndExplicitReciprocity:CM.1`; `ComplexMultiplicationAndExplicitReciprocity:CM.2`; `ModularCurvesPartII:R12.6`.

**Construction:** Construct the finite product of j-values over proper ideal classes, prove algebraic integrality and Galois equivariance, and identify the associated ring class field over the imaginary quadratic field. Develop ray-class variants using level functions with their exact admissibility conditions.

**Acceptance:** For a small discriminant certify the class polynomial, splitting field over the CM field, and prime-ideal Frobenius action. Numeric approximation alone cannot certify coefficients.

<a id="cm-4"></a>
## CM.4. CM Hecke characters and Galois realizations

**Dependencies:** `ComplexMultiplicationAndExplicitReciprocity:CM.2`; `ArithmeticGaloisRepresentations:R01.6`; `AutomorphicGaloisRepresentations:R19.3`.

**Construction:** Construct algebraic Hecke characters attached to CM abelian varieties with endomorphisms defined over the stated field. Prove infinity type, finite conductor and Frobenius identities; compare their one-dimensional coefficient components with the Tate module.

**Acceptance:** Check both split and inert good primes of a CM elliptic curve and distinguish its rank-two Q_l representation from rank-one CM components.

<a id="cm-5"></a>
## CM.5. Reduction, isogenies and certified computation

**Dependencies:** `ComplexMultiplicationAndExplicitReciprocity:CM.3`; `ComplexMultiplicationAndExplicitReciprocity:CM.4`; `NeronModelsAndSemistableAbelianVarieties:R11.5`.

**Construction:** Instantiate the Shimura–Taniyama formula for reductions and isogeny graphs with the exact good-prime assumptions. Implement complex or CRT class-polynomial computations with proved height/precision bounds, and retain endomorphism-ring verification as a separate certificate.

**Acceptance:** A returned polynomial has an exact coefficient/error certificate and a verified ideal-class action. Supersingular reduction cannot be treated as ordinary by changing the coefficient field.

<a id="cm-6"></a>
## CM.6. Reciprocity exports and limits

**Dependencies:** `ComplexMultiplicationAndExplicitReciprocity:CM.5`.

**Construction:** Export ring/ray class fields, torsion fields, Hecke characters and ideal-action theorems to Heegner-point, Euler-system and modular-function applications through existing carriers. Document which level functions generate the asserted field.

**Acceptance:** Provide a complete elliptic ring-class example and a higher-dimensional reflex-field example; general explicit class fields outside proved CM cases remain separately labelled research problems.

## Completion contract

Each construction returns actual mathematical objects and maps on the canonical suppliers. Finish source decomposition, then definitions, theorems, naturality/comparison lemmas and the worked acceptance examples. Every algorithm also proves soundness, completeness under its stated hypotheses, and precision/termination where promised. An absent source lemma stays an explicit open subtask; it is never replaced by an opaque assumption.
