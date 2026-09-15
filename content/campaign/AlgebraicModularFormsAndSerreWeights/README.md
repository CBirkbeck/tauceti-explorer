# Roadmap: Algebraic modular forms, reduction and Serre weights

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

Construct modular forms over coefficient rings and in characteristic p, relate them to the existing analytic forms, and define the classical Serre weight from local Galois data. The weight function must not be defined as the least weight in which the representation happens to be modular.

## Existing material and ownership

Analytic modular forms, their Hecke action, newforms and coefficient fields remain with ModularForms. R12–R14 provide compactified algebraic curves, Hodge bundles and correspondences. R07 supplies the integral local Galois calculations. R19 constructs the Galois representations attached to eigenforms; this roadmap does not assume that construction when defining geometric modular forms or the local weight recipe.

## Conventions

Define weight-k forms as sections of the appropriate power of the Hodge bundle, and cusp forms by the cusp divisor, on a fine cover or stack with correct descent. Do not assume the Hodge bundle descends to the coarse curve in every weight. Distinguish classical weight k≥2 from Katz weight one. For p>2 a cyclotomic twist can put the Serre weight in [2,p+1]; the untwisted representation need not have weight in that interval.


<a id="r15-1"></a>

## R15.1. Geometric forms and comparison

**Milestone:** `R15.1`

Construct the Hodge bundle, cusp ideal/divisor, geometric forms and their base change. Prove agreement with analytic forms over C by R12 and GAGA. Establish the coefficient-field and integral q-expansion comparisons using the actual moduli family. Treat small levels via descent from a rigidified cover or the stack, with stabilisers visible.

**Dependencies:** [ModularCurvesPartII R12.6](../ModularCurvesPartII/README.md#r12-6); [ModularCurvesPartII R13.4](../ModularCurvesPartII/README.md#r13-4); [ModularCurvesPartII R14.3](../ModularCurvesPartII/README.md#r14-3).

<a id="r15-2"></a>

## R15.2. q-expansion and integral Hecke theory

**Milestone:** `R15.2`

Prove the q-expansion principle at all cusps needed to detect a section, its integral version and the finite-generation/base-change statements for spaces of forms. Define Hecke actions from R14 and compare their coefficient formulas with the analytic owner. Prove the algebraic-integrality and reduction statements needed for eigenvalues. Keep arbitrary reduction of characteristic-zero forms separate from lifting a characteristic-p eigenform.

**Dependencies:** R15.1 (preceding layer).

<a id="r15-3"></a>

## R15.3. Characteristic-p operations

**Milestone:** `R15.3`

Construct the Hasse invariant, Frobenius/Verschiebung and theta operator with their q-expansion formulas and Hecke compatibilities. Prove filtration and weight-change results, including the exact hypotheses on p and level. Construct the Igusa-curve interpretation when used. The cases p=2 and p=3 are explicit, not inferred from formulas requiring division by p−1 or by 6.

**Dependencies:** R15.2 (preceding layer).

<a id="r15-4"></a>

## R15.4. Serre's local weight recipe

**Milestone:** `R15.4`

Transcribe and prove the well-definedness of Serre's full piecewise recipe from SERRE87, with the EDIXHOVEN92 comparison: irreducible local inertia, reducible local representations, scalar and extension-sensitive cases, twisting and determinant parity. Store the full local representation/extension class where the weight requires it. Prove invariance under coefficient extension and isomorphism. For p=2 prove that the classical weight is 2 exactly in the finite-flat case and 4 otherwise. Construct the full explicit local case table and prove the named comparisons; a weight chosen by a modularity-existence property is not this recipe.

**Dependencies:** [AlgebraicModularFormsAndSerreWeights R15.3](README.md#r15-3); [FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5](../FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md#r07-5).

<a id="r15-5"></a>

## R15.5. Eigenforms and characteristic-zero lifting

**Milestone:** `R15.5`

Prove the Deligne–Serre eigenvalue-lifting lemma for a finite Hecke algebra and its application to the relevant modular-form modules. Establish the passage from a mod-p eigensystem at controlled weight and level to a characteristic-zero normalised eigenform where the lifting theorem's hypotheses hold. Include special low weights and the possible need for a weight change; not every Katz weight-one eigenform has a weight-one characteristic-zero lift.

**Dependencies:** R15.4 (preceding layer).

<a id="r15-6"></a>

## R15.6. Definitions used in the Serre statement

**Milestone:** `R15.6`

Define residual modularity using a coefficient field, a prime over p, an eigenform and an isomorphism with its residual semisimplification, once R19 supplies the representation. State the classical weight-and-level target using N(rho-bar) and k(rho-bar). Prove the elementary character/determinant congruence and finite-flat weight-two consequences of the local recipe. Actual optimisation of the weight and level of a modular representation belongs to R20 and the exceptional dyadic completion to R27.

**Dependencies:** R15.5 (preceding layer); [AutomorphicGaloisRepresentations R19.1](../AutomorphicGaloisRepresentations/README.md#r19-1).

## Required examples and checks

Check the Hasse invariant's q-expansion, theta on a known form, the determinant parity rule, and a cyclotomic twist whose untwisted Serre weight lies outside [2,p+1]. Include two local extensions with the same inertial semisimplification but different extension-sensitive behaviour.



## References

KATZ73, SERRE87, EDIXHOVEN92, DELIGNE_SERRE74. The bibliography records what was inspected and what remains to be transcribed.


## Implementation handoff: Local weight decision table

**Stages:** R15.1, R15.3, R15.4, R15.5, R15.6. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

Implement the source weight recipe as an exhaustive table indexed by residual characteristic, local reducibility, tame inertia characters, scalar case and extension class. Every row specifies the resulting classical weight and its determinant parity, plus the R07 theorem establishing the local interpretation. The table must be total on the intended representations; an absent row is an open implementation subtask.

**Acceptance and consumer contract.** Run two extension classes with equal semisimplified inertia through the table, and test characteristic two finite-flat and non-finite-flat branches. Geometric sections must descend with their stabilizer action; q-expansion detection must cover the required cusps. The Deligne–Serre lift exports its actual weight/level and coefficient prime, including any weight change, before R15.6 constructs residual modularity.

## Source anchors and prototype coverage

- AlgebraicModularFormsAndSerreWeights source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
