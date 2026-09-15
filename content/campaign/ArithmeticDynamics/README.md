# Arithmetic dynamics

## Scope and ownership

Construct arithmetic properties of iterated morphisms and selected rational maps using the existing height and local analytic theories. Begin with polarized morphisms of projective varieties; indeterminacy, nonpolarized maps and function-field isotriviality require separate theorems.

## Execution status

Curriculum and construction specification. Stages are not proof-ready: pin the source edition, inspect the complete proof, match supplier declarations, and transcribe the lemma tree with exact hypotheses and locators. A source-access or decomposition task is part of the plan; no completed theorem is claimed. Preserve mathematical frontier statements as conjectures.

## Source register

- [Call–Silverman, Canonical heights on varieties with morphisms (1993), §1–§2](https://www.numdam.org/item/CM_1993__89_2_163_0.pdf). **Evidence:** Theorem 1.1, Proposition 1.2 and Corollary 1.1.1 inspected; other proof interiors not audited.
- [Silverman, The Arithmetic of Dynamical Systems, author bibliography](https://www.math.brown.edu/johsilve/). **Evidence:** Source family selected; book chapters/errata required before local-dynamics and moduli tickets.
- [Silverman, Arithmetic dynamics survey (2022)](https://www.math.brown.edu/johsilve/). **Evidence:** Coverage guide only; each additional equidistribution/arboreal theorem requires its primary proof.

<a id="dy-0"></a>
## DY.0. Iteration, periodicity and dynamical moduli

**Dependencies:** `SchemeAndStackFoundations:SF.0`; `FoundationsAndLibraryIntegration:LI.4`.

**Construction:** Construct iteration of morphisms, orbit maps, periodic/preperiodic points and conjugacy under automorphisms. For P¹ specify rational functions by homogeneous coprime forms and define degree/resultant and good reduction.

**Acceptance:** Compare conjugate maps and a map whose displayed resultant vanishes at a bad prime. Iterate equality is equality of morphisms, not only a sample of points.

<a id="dy-1"></a>
## DY.1. Canonical heights of polarized morphisms

**Dependencies:** `ArithmeticDynamics:DY.0`; `HeightsRationalPointsAndObstructions:RP.0`.

**Construction:** Given f*L ≅ L^d with L ample and d>1 over a number field, construct the limit d^(-n)h_L(f^n(P)), prove its error bound and functional equation, and establish uniqueness. Derive preperiodicity from zero canonical height using Northcott.

**Acceptance:** Use the power map on P¹ and multiplication on an abelian variety. Remove ampleness only in a separately stated theorem; the zero-height criterion does not automatically survive.

<a id="dy-2"></a>
## DY.2. Local dynamics and reduction

**Dependencies:** `ArithmeticDynamics:DY.1`; `TropicalAndBerkovichArithmetic:TB.0`.

**Construction:** Construct nonarchimedean local heights and escape rates, good reduction and reduction of cycles. Consume TropicalAndBerkovichArithmetic TB.0 for the actual Berkovich analytic carrier over the selected complete rank-one nonarchimedean field. State algebraic closure, reduction and semistability assumptions separately in each local theorem; the dynamical maps are constructed on that carrier.

**Acceptance:** Compute a good-reduction polynomial and a bad-reduction rational map, retaining residue characteristic in multiplier/cycle formulas. Classical p-adic points alone do not supply a compact analytic dynamical space.

<a id="dy-3"></a>
## DY.3. Periodic-point equations and finite bounds

**Dependencies:** `ArithmeticDynamics:DY.1`; `EffectiveDiophantineMethods:ED.0`.

**Construction:** Construct dynatomic polynomials/schemes with the distinction between formal and exact period, multiplier conditions and multiplicities. Prove finite bounded-degree preperiodic sets for a fixed polarized morphism, and implement certified enumeration when effective height bounds are supplied.

**Acceptance:** Handle a root with lower exact period but nontrivial dynatomic multiplicity. Uniform boundedness across all maps of fixed degree remains a separate conjecture.

<a id="dy-4"></a>
## DY.4. Equidistribution and small points

**Dependencies:** `ArithmeticDynamics:DY.2`; `HeightsRationalPointsAndObstructions:RP.0`; `TropicalAndBerkovichArithmetic:TB.6`.

**Construction:** Select a primary equidistribution theorem for semipositive adelic metrized line bundles, then consume TropicalAndBerkovichArithmetic TB.6 model metrics, semipositive approximation and local measures, verifying total mass equals the stated intersection degree. Construct the dynamical energy and generic small-point hypotheses on those analytic/height objects. Prove the dynamical application to a specified polarized system.

**Acceptance:** A sequence contained in a proper exceptional subvariety is not generic. Full primary proof and measure foundations must be decomposed; the canonical-height limit alone proves no equidistribution.

<a id="dy-5"></a>
## DY.5. Arboreal Galois representations

**Dependencies:** `ArithmeticDynamics:DY.0`; `InverseGaloisAndArithmeticFundamentalGroups:IG.0`; `EffectiveDiophantineMethods:ED.0`.

**Construction:** Construct the rooted preimage tree of a point avoiding critical orbit collisions and the continuous Galois action on its finite levels and inverse limit. Prove selected image/index statements using explicit ramification and irreducibility hypotheses.

**Acceptance:** A worked quadratic polynomial checks every level claimed. Surjectivity for all maps and all levels is not inferred from a few finite computations.

<a id="dy-6"></a>
## DY.6. Families, unlikely intersections and frontiers

**Dependencies:** `ArithmeticDynamics:DY.3`; `ArithmeticDynamics:DY.4`; `ArithmeticDynamics:DY.5`.

**Construction:** Construct family specialization maps and compare canonical heights under the hypotheses of the selected variation theorem. State proven dynamical Mordell–Lang or unlikely-intersection cases as separate source-bound endpoints.

**Acceptance:** Supply complete power-map and elliptic/Lattès examples. General dynamical Lehmer, uniform boundedness and unrestricted dynamical Mordell–Lang remain conjectural; no theorem may consume them without an explicit conditional parameter.

## Completion contract

Each construction returns actual mathematical objects and maps on the canonical suppliers. Finish source decomposition, then definitions, theorems, naturality/comparison lemmas and the worked acceptance examples. Every algorithm also proves soundness, completeness under its stated hypotheses, and precision/termination where promised. An absent source lemma stays an explicit open subtask; it is never replaced by an opaque assumption.
