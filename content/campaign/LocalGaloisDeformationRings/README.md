# Roadmap: Local Galois deformation rings and their components

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

Construct the local deformation rings used by KW/Kisin, with genuine moduli meanings and the geometric properties required by patching. Rings with the right generic points are not interchangeable unless their integral structure and comparison have been proved.

## Existing material and ownership

Consume R01 representations/Weil–Deligne parameters, R03 coefficient algebra, R05 formal geometry and R06–R07 local p-adic Hodge theory. R04 owns global deformation rings. The local ring-theoretic and geometric results here are additional work, not already supplied by AdicSpaces.

## Conventions

Parameters include coefficient DVR, residual representation, determinant, framing, Hodge type and inertial type. Specify whether a ring is the entire framed ring, a quotient, its p-torsion-free quotient or its reduced generic fibre. The phrase “potentially Barsotti–Tate type” includes actual nonemptiness and determinant compatibility conditions.


<a id="r08-1"></a>

## R08.1. Unrestricted local rings

**Milestone:** `R08.1`

Prove framed local representability and the tangent/obstruction description. Compute the effect of fixing the determinant and forgetting a framing. Treat archimedean deformation rings at p=2 explicitly. Relate a local deformation ring over O to residue-field extension and to restrictions of global universal representations.

**Dependencies:** [ArithmeticGaloisRepresentations R01.1](../ArithmeticGaloisRepresentations/README.md#r01-1); [DeformationAndDerivedPatchingAlgebra R03.1](../DeformationAndDerivedPatchingAlgebra/README.md#r03-1); [DeformationAndDerivedPatchingAlgebra R03.2](../DeformationAndDerivedPatchingAlgebra/README.md#r03-2).

<a id="r08-2"></a>

## R08.2. Places away from p

**Milestone:** `R08.2`

Construct unramified, fixed inertial-type, Steinberg and minimally ramified deformation conditions used by the sources. Prove their representability or the existence of the intended quotient, and calculate dimensions, smoothness and irreducible components with each residual hypothesis visible. A special/Steinberg condition includes monodromy; it is not synonymous with a scalar inertial semisimplification.

**Dependencies:** R08.1 (preceding layer).

<a id="r08-3"></a>

## R08.3. Potentially semistable deformation spaces

**Milestone:** `R08.3`

Use the period-functor and formal-geometry theory to construct Kisin's potentially semistable deformation rings with fixed Hodge and inertial type. Prove the characterisation of characteristic-zero points, p-torsion-freeness/reducedness where asserted, generic dimension and the required smoothness results. Include compatibility with finite coefficient extension. Nonemptiness is proved for the particular local types requested by R24, not assumed universally.

**Dependencies:** [AdicSpacesPartII F0](../AdicSpacesPartII/README.md#f0); [FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4](../FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md#r07-4); [LocalGaloisDeformationRings R08.2](README.md#r08-2); [PadicHodgeTheory R06.3](../PadicHodgeTheory/README.md#r06-3).

<a id="r08-4"></a>

## R08.4. Finite-flat and Barsotti–Tate components

**Milestone:** `R08.4`

Construct bounded-height lattice moduli and their proper maps to deformation spaces. Prove the connectedness and component comparisons used in Kisin's finite-flat modularity arguments, separately in the ordinary and nonordinary cases. Show precisely which components are met by a chosen modular point. The proof must include the image of the lattice moduli; connectedness of the source alone is insufficient.

**Dependencies:** [FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4](../FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md#r07-4); [LocalGaloisDeformationRings R08.3](README.md#r08-3).

<a id="r08-5"></a>

## R08.5. Dyadic and endpoint cases

**Milestone:** `R08.5`

Supply the real-place, local-at-2 and twisting calculations required by KW II and Kisin's 2-adic Barsotti–Tate theorem. Supply the crystalline endpoint-weight calculations used in KW I Theorem 4.1, including the cases not covered by the elementary Fontaine–Laffaille interval. Do not use the direct-sum splitting End=k⊕ad⁰ at p=2 or a trace pairing that is degenerate there.

**Dependencies:** R08.4 (preceding layer).

<a id="r08-6"></a>

## R08.6. Local deformation statements for the global arguments

**Milestone:** `R08.6`

Export each source local condition with its ring, dimension, nonemptiness, tangent condition and component relation. Produce separate entries for KW I Theorem 5.1's lift types, for the good-dihedral auxiliary type, for the dyadic weight-two transition and for the modern general de Rham lifting applications. General de Rham lifting is R32; its analytic representation theory is not silently assumed as part of this classical local-ring construction.

**Dependencies:** R08.5 (preceding layer).

## Required examples and checks

Compare unramified and Steinberg lifts of the same residual representation when both exist. Check ordinary/nonordinary Barsotti–Tate behaviour and a dyadic example. A request for an incompatible determinant/type must return a proved emptiness statement, not an inhabited deformation ring.



## References

KISIN08, KISIN09F, KISIN2, KW2, SAVITT05. The bibliography records what was inspected and what remains to be transcribed.

<a id="l7"></a>

## L7. Local models and arbitrary dimension

Construct bounded-height Frobenius-stable lattice moduli inside the projective Grassmannians of AlgebraicModuliForArithmeticGeometry R09.1. Prove the height equations, representability, projectivity, universal lattice, map to the appropriate framed deformation ring and the precise image on the generic fibre. This is the sole owner of source R05.5–R05.6. Component matching requires the image statement and cannot follow from connectedness of the source alone.

For every finite rank n and finite extension K/Q_p construct fixed labeled Hodge-type and inertial-type potentially semistable deformation rings, retaining the coefficient field, framing and determinant/multiplier constraints. Prove the characteristic-zero point criterion, allowed reduced/flat quotient properties and the Kisin dimension formula in its hypotheses. A nonempty type is never assumed for arbitrary data. Construct Fontaine–Laffaille deformation conditions in the proven unramified small-weight range, with filtration ranks and compatible determinant, and calculate their tangent spaces and formal smoothness where valid.

Construct ordinary deformation functors with a full invariant flag and specified graded characters; separate the flag-bearing functor from its image after forgetting the flag. Prove representability, dimension and component maps under the source genericity/distinguishedness assumptions. Give semistable, Steinberg and minimally ramified analogues away from p for rank n, preserving the nilpotent monodromy operator. Export the precise local comparisons and component support input used in ACC+ §6.2 to GlobalGaloisDeformations G7 and DeformationAndDerivedPatchingAlgebra P9. Small-prime rank-two R08.4–R08.6 remains an additional specialized theorem family.

<a id="l8"></a>

## L8. Ordinary flags versus determinant ordinary conditions

Implement the distinction in ACC+ §6.2.6: the ordinary flag scheme over the framed deformation ring and the image ring of its proper pushforward are one construction; the determinant-ordinary quotient defined by the full characteristic-polynomial identities and ordered products (ρ(g₁)−χ₁(g₁))⋯(ρ(g_n)−χ_n(g_n))=0 is another. Construct the universal character coefficient rings including their chosen torsion components. Prove the precise comparison only under the published hypotheses and at the indicated integral/reduced/characteristic-zero level. Equality of characteristic polynomials alone does not provide a full invariant flag over every nonreduced coefficient ring.


## Implementation handoff: Integral rings, images and flags

**Stages:** R08.2, R08.3, R08.4, R08.5, L7, L8. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

Each local condition exports a quotient map from the framed universal ring and a functorial point criterion at the level where it is valid: Artinian integral points, reduced generic fibre, or characteristic-zero points. Construct bounded-height lattice/flag moduli and the proper map before proving image and component theorems. Keep determinant ordinary identities and flag-bearing ordinary deformations separate.

**Acceptance and consumer contract.** Use one residual representation admitting both unramified and Steinberg lifts to check the monodromy condition. Test empty determinant/type combinations and ordinary flags over a nonreduced coefficient ring. A characteristic-zero point criterion does not determine the integral quotient; record the flat/reduced closure construction and its base-change proof. Every dimension formula retains framing and fixed/variable determinant choices.

## Source anchors and prototype coverage

- LocalGaloisDeformationRings source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
