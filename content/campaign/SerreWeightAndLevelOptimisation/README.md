# Roadmap: Weight and level optimisation of residual modular representations

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

Prove the passage from a modular residual representation to the classical Serre weight and prime-to-p Artin level in every nonexceptional case needed by the induction, and identify explicitly the dyadic case completed by KW itself. Neither general Ribet level lowering nor Serre's weight theorem is supplied by the Frey-specific FLT argument.

## Existing material and ownership

Consume R15's explicit local weight recipe and characteristic-p forms, R14's integral Ihara and Hecke cohomology, R13's bad models, R11's character groups, R18's quaternionic geometry, and R19's Galois representations. Analytic newform decomposition remains ModularForms. Global residual modularity is not a hypothesis to be proved here: this roadmap starts from a particular modular residual representation.

## Conventions

Keep the residual characteristic p separate from a prime q removed from the level. Track conductor exponent, local extension class, determinant and nebentypus, not just sets of ramified primes. Results labelled “optimisation” must state which local or image cases are covered. The p=2 scalar decomposition-group case noted in KW I is not silently included in a pre-KW theorem.


<a id="r20-1"></a>

## R20.1. Level-changing algebra and cohomology

**Milestone:** `R20.1`

Construct the old/new exact sequences and congruence modules from the actual integral Hecke modules. Prove localisation, saturation and passage between characteristic-zero and residual eigensystems with controlled level. Record exactly how a Hecke eigensystem survives when a prime is removed and how a chosen characteristic-zero lift is recovered.

**Dependencies:** [FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6](../FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md#r07-6); [NeronModelsAndSemistableAbelianVarieties R11.6](../NeronModelsAndSemistableAbelianVarieties/README.md#r11-6); [ModularCurvesPartII R13.6](../ModularCurvesPartII/README.md#r13-6); [ModularCurvesPartII R14.6](../ModularCurvesPartII/README.md#r14-6); [AlgebraicModularFormsAndSerreWeights R15.6](../AlgebraicModularFormsAndSerreWeights/README.md#r15-6); [GL2AutomorphicRepresentationsAndTransfer R17.6](../GL2AutomorphicRepresentationsAndTransfer/README.md#r17-6); [HilbertModularVarietiesAndShimuraCurves R18.6](../HilbertModularVarietiesAndShimuraCurves/README.md#r18-6); [AutomorphicGaloisRepresentations R19.6](../AutomorphicGaloisRepresentations/README.md#r19-6).

<a id="r20-2"></a>

## R20.2. Lowering level away from p

**Milestone:** `R20.2`

Prove Mazur's principle and the Ribet/Diamond level-lowering statements, including ramified and higher-exponent cases that are actually required for arbitrary Artin conductor. Use the bad-fibre geometry and character-group maps, not only a congruence of Frobenius traces. Verify irreducibility, q mod p restrictions, exceptional cases and coefficient fields for each theorem. Iteration must reach the prime-to-p Artin conductor rather than merely its radical.

**Dependencies:** R20.1 (preceding layer).

<a id="r20-3"></a>

## R20.3. Weight optimisation at p

**Milestone:** `R20.3`

Prove the Edixhoven/Serre weight theorem with its characteristic-p operations, local finite-flat/extension calculations and geometric interpretation. Include the reducible and irreducible local cases and all low-characteristic corrections that belong to the chosen theorem. State the exact conclusion at weight p+1 and the effect of twisting. An inertial semisimplification does not determine every required extension-sensitive case.

**Dependencies:** R20.2 (preceding layer).

<a id="r20-4"></a>

## R20.4. Coefficient-prime level and character

**Milestone:** `R20.4`

Prove removal of unwanted p-power level in the ranges used, including the finite-flat weight-two consequence for p≥5. Control the nebentypus and its lift; a character congruent to 1 need not be trivial when its order is divisible by p. Prove the character specialisation statement after excluding those primes, as needed in R29's infinitely-many-primes deduction.

**Dependencies:** R20.3 (preceding layer).

<a id="r20-5"></a>

## R20.5. Combined classical optimisation and exceptions

**Milestone:** `R20.5`

For p=2 explicitly construct the Buzzard, *On level-lowering for mod 2 representations*, Math. Res. Lett. 7 (2000), 95–110 Theorem 2.8 branch with its non-Q(i)-induced hypothesis, then the separate Q(i)-induced analysis of §3. Compare with Wiese's assigned weight-one theorem and KW I's precise exceptions; an odd-prime Diamond optimization statement does not supply these dyadic cases.

Combine the previous theorems into an exact list of weak-to-classical-strong implications. Enumerate the remaining p=2 scalar local case identified by KW I §1 and identify its supplier as R27's weight-two theorem. Do not claim this layer proves the general Katz weight-one refinement. A consumer must choose an entry whose hypotheses it has proved, rather than invoke an all-purpose “strong Serre” abbreviation.

**Dependencies:** R20.4 (preceding layer).

<a id="r20-6"></a>

## R20.6. Exports for Serre and elliptic curves

**Milestone:** `R20.6`

Prove the bounded-level, weight-two and trivial-character consequence used by R29 at sufficiently large good p. Supply the optimisation inputs used inside KW and the modern qualitative proof without importing their final Serre theorem. Provide the case table showing how R27 supplies the dyadic completion and hence yields the full classical strong conclusion. This table is a proof dependency, not an unproved assertion that every case is already handled here.

**Dependencies:** R20.5 (preceding layer).

## Required examples and checks

Check a residual representation with conductor exponent greater than one, a finite-flat weight-two elliptic representation at p≥5, and a low-characteristic exceptional case. A test must distinguish a Frey-level-lowering theorem from the general statement.



## References

SERRE87, EDIXHOVEN92, RIBET90, DIAMOND_OPT, KW1, WIESE04. The bibliography records what was inspected and what remains to be transcribed.


## Implementation handoff: Complete local optimization dispatch

**Stages:** R20.1, R20.2, R20.3, R20.4, R20.5, R20.6. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

For each removed prime record its conductor exponent, local residual representation including extension class, q mod p, available bad model and precise Ihara/Mazur-principle input. Each row returns an actual eigensystem with a named level/weight change and determinant character, not merely an existence proposition about modularity.

**Acceptance and consumer contract.** The dispatch table includes higher prime-power conductor, p=2 scalar decomposition group, Q(i)-induced and noninduced branches, and endpoint weight p+1. A missing dyadic row points to ClassicalSerreModularity R27.4 and is excluded from the optimizer used inside the induction. Character triviality requires injective reduction on its finite order, with the exceptional coefficient primes named.

## Source anchors and prototype coverage

- SerreWeightAndLevelOptimisation source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
