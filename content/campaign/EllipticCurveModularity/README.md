# Roadmap: Modularity and modular parametrisations of elliptic curves over Q

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

Deduce modularity of every elliptic curve over Q from full Serre modularity, including the exact conductor, Galois representation comparison, modular quotient and a nonconstant parametrisation X₀(N_E)→E. No semistability or non-CM hypothesis is imposed.

## Existing material and ownership

Use the existing WeierstrassCurve and IsElliptic predicate and its conductor/point-count definitions from EllipticCurves. The scheme comparison comes from #81/AlgebraicCurves. R27 supplies full Serre, R28 Faltings' finiteness/isogeny theorem, R19 automorphic Galois representations and R14 modular quotients/cusps. Classical L-functions and newforms remain ModularForms.

## Conventions

Distinguish modularity by good Frobenius coefficients, equality of all local L-factors, an isomorphism of rational Tate modules and a modular parametrisation. Prove their relations rather than defining them as equivalent. The main witness is a normalised weight-two newform with rational coefficients, trivial nebentypus and exact level N_E.


<a id="r29-1"></a>

## R29.1. Rational endomorphisms and residual irreducibility

**Milestone:** `R29.1`

Prove End_Q(E)=Z: in characteristic zero the derivative on the rational invariant differential is injective on the endomorphism algebra, whose rational scalar values force the conclusion. This includes CM curves over Q; it does not assert End_Qbar(E)=Z. Faltings gives finitely many Q-isomorphism classes in the Q-isogeny class. For each representative E′, Hom_Q(E,E′) is free of rank one, so map degrees are d·n². Hence only finitely many prime degrees occur. A reducible E[p] gives a rational cyclic p-isogeny; therefore E[p] is F_p-irreducible for all but finitely many p. For odd p, use oddness to obtain absolute irreducibility.

**Dependencies:** [ArithmeticGaloisRepresentations R01.6](../ArithmeticGaloisRepresentations/README.md#r01-6); [FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6](../FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md#r07-6); [ModularCurvesPartII R14.6](../ModularCurvesPartII/README.md#r14-6); [AutomorphicGaloisRepresentations R19.6](../AutomorphicGaloisRepresentations/README.md#r19-6); [SerreWeightAndLevelOptimisation R20.6](../SerreWeightAndLevelOptimisation/README.md#r20-6); [ClassicalSerreModularity R27.6](../ClassicalSerreModularity/README.md#r27-6); [FaltingsFinitenessAndIsogenyTheorems R28.6](../FaltingsFinitenessAndIsogenyTheorems/README.md#r28-6).

<a id="r29-2"></a>

## R29.2. Residual Serre witnesses at bounded level

**Milestone:** `R29.2`

For infinitely many good primes p≥5 apply the strong Serre theorem to E[p]. Prove finite flatness gives weight two and its prime-to-p conductor divides the fixed N_E. The resulting newform therefore has weight two and level dividing N_E. Exclude the finitely many primes dividing φ(N_E) to make reduction injective on the possible nebentypus roots of unity; determinant compatibility then gives trivial nebentypus. Record all coefficient fields and primes above p.

**Dependencies:** R29.1 (preceding layer).

<a id="r29-3"></a>

## R29.3. A fixed newform and exact coefficients

**Milestone:** `R29.3`

Use finite-dimensional newform theory to prove that only finitely many normalised newforms of weight two and level dividing N_E can occur, including their coefficient embeddings. Choose one occurring for infinitely many distinct rational primes. At a fixed good ℓ, a_ℓ(f)−a_ℓ(E) is an algebraic integer in primes over infinitely many p; its nonzero integer norm could not have infinitely many prime divisors. Conclude exact equality for every good ℓ. Prove rationality of the full coefficient field via Galois conjugation and strong multiplicity one, including the bad coefficients.

**Dependencies:** R29.2 (preceding layer).

<a id="r29-4"></a>

## R29.4. Galois comparison and exact conductor

**Milestone:** `R29.4`

Compare V_r(E) and the representation of f at an auxiliary good r using Chebotarev, characteristic polynomials and semisimplicity. Use full local–global compatibility, including monodromy, to identify conductors at the bad primes. Deduce that the primitive level of f equals N_E, not merely divides it. Prove equality of bad local Euler factors and the Tate-module comparisons for all auxiliary primes.

**Dependencies:** R29.3 (preceding layer).

<a id="r29-5"></a>

## R29.5. The modular quotient and parametrisation

**Milestone:** `R29.5`

Apply the weight-two, trivial-nebentypus quotient theorem ModularCurvesPartII R14.5 to the primitive newform established in R29.3–R29.4, obtaining A_f as a quotient of J₀(N_E). Rational coefficients give K_f=Q and dim A_f=1; the higher-weight cohomological construction is not an input to this quotient theorem. Use R19's Tate-module identification and R28's isogeny theorem to obtain an isogeny A_f→E over Q. Compose the rational-cusp-normalised Abel–Jacobi map, the quotient map and this isogeny. Prove the composite is nonconstant using generation of the Jacobian by the curve, and that the chosen cusp maps to the identity. Equality of L-series is not used as the definition of this map.

**Dependencies:** R29.4 (preceding layer).

<a id="r29-6"></a>

## R29.6. Final theorem and analytic consequences

**Milestone:** `R29.6`

State the unconditional theorem on the existing elliptic-curve type, with a weight-two rational newform of exact conductor and a nonconstant Q-morphism X₀(N_E)→E. Prove the equivalence with the Frobenius-coefficient formulation in the chosen convention. Transfer the analytic continuation and functional equation from ModularForms after proving equality of every local factor. Do not claim the Birch–Swinnerton-Dyer conjecture or a rank formula as a consequence.

**Dependencies:** R29.5 (preceding layer).

## Required examples and checks

Include a nonsemistable curve, a CM curve over Q, and a curve admitting a rational prime-degree isogeny. Check that the excluded residual primes are finite and depend on E, while the theorem itself has no good-reduction or large-prime hypothesis.



## References

KW1, FALTINGS83, SHIMURA71. The bibliography records what was inspected and what remains to be transcribed.


## Implementation handoff: From infinitely many congruences to a morphism

**Stages:** R29.1, R29.2, R29.3, R29.4, R29.5, R29.6. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

The finite exceptional-prime set must be constructed as the union of bad reduction, residual reducibility, small primes and character-order primes. R29.3 fixes one weight-two newform and one number field before using nonzero algebraic-integer norms to turn infinitely many congruences into coefficient equalities. R29.4 compares full local parameters to recover the exact conductor.

**Acceptance and consumer contract.** R29.5 applies the weight-two R14.5 quotient with K_f=Q, then the actual Faltings Hom isomorphism to obtain a rational isogeny. Prove the cusp-normalized composite nonconstant by its induced Jacobian map. Acceptance includes a CM curve with End_Q(E)=Z and a nonsemistable curve; prove all bad Euler-factor equalities before transferring the completed L-function equation.

## Source anchors and prototype coverage

- EllipticCurveModularity source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
