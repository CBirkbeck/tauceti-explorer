# Roadmap: Galois representations attached to modular and Hilbert modular forms

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

Construct the Galois representations used to define modularity and the representations over localised Hecke algebras used to prove R=T. Prove local–global compatibility in the strength needed by the lifting arguments, not just equality of unramified traces.

## Existing material and ownership

R14/R15 supply curves, Hecke cohomology and algebraic forms; R18 the Hilbert/quaternionic geometries; R16/R17 transfer; #196 the general étale constructions; R34 weights/purity; R06 p-adic comparison. R01 owns representation recognition and determinant laws. R28 supplies general abelian-variety semisimplicity/isogeny results when the selected geometric construction invokes them. The modern completed-cohomology correspondence is R31, not assumed here.

## Conventions

For a normalised weight-k newform use the arithmetic representation with characteristic polynomial X²−a_ℓX+ε(ℓ)ℓ^{k−1} at good arithmetic Frobenius. If cohomology gives a dual or twist, identify it explicitly. A residual representation means lattice reduction followed by semisimplification; a family over a nonreduced Hecke algebra requires more than pointwise specialisations.


<a id="r19-1"></a>

## R19.1. Classical Galois representations

**Milestone:** `R19.1`

Construct the weight-two representation from Jacobian cohomology and the higher-weight representation from symmetric-power cohomology or Kuga–Sato varieties. Prove the existence of the required projector and the two-dimensional eigenspace, including coefficient fields and integral lattices. Prove the unramified characteristic polynomial by the geometric Eichler–Shimura relation. Construct the weight-one Artin representation in the Deligne–Serre setting needed for auxiliary arguments.

**Dependencies:** [AlgebraicModularFormsAndSerreWeights R15.5](../AlgebraicModularFormsAndSerreWeights/README.md#r15-5); [ArithmeticGaloisRepresentations R01.1](../ArithmeticGaloisRepresentations/README.md#r01-1); [GL2AutomorphicRepresentationsAndTransfer R16.6](../GL2AutomorphicRepresentationsAndTransfer/README.md#r16-6); [ModularCurvesPartII R14.3](../ModularCurvesPartII/README.md#r14-3); [WeightsInEtaleCohomology R34.5](../WeightsInEtaleCohomology/README.md#r34-5).

<a id="r19-2"></a>

## R19.2. Hilbert and quaternionic Galois representations

**Milestone:** `R19.2`

Construct the representations attached to the cohomological Hilbert forms used by KW, through the appropriate Shimura-curve or higher-dimensional cohomological realisation and transfer. Handle the parity and auxiliary-place cases explicitly, including descent from auxiliary totally real fields where the source uses it. Prove uniqueness, continuity, determinants, oddness and the required irreducibility, rather than putting them into a bundled automorphic datum.

**Dependencies:** [AutomorphicGaloisRepresentations R19.1](README.md#r19-1); [GL2AutomorphicRepresentationsAndTransfer R17.3](../GL2AutomorphicRepresentationsAndTransfer/README.md#r17-3); [HilbertModularVarietiesAndShimuraCurves R18.4](../HilbertModularVarietiesAndShimuraCurves/README.md#r18-4).

<a id="r19-3"></a>

## R19.3. Purity and compatible systems

**Milestone:** `R19.3`

Use the weight theorem R34 to prove purity and the coefficient-independent Frobenius polynomials. Construct the compatible family for a fixed eigenform with the precise local statements at all primes where the source proves them. A weak compatible system, an almost strictly compatible system and a strictly compatible system have different definitions; this distinction must survive into R24.

**Dependencies:** R19.2 (preceding layer).

<a id="r19-4"></a>

## R19.4. Local–global compatibility away from p

**Milestone:** `R19.4`

Prove compatibility of Frobenius-semisimple Weil–Deligne representations with local Langlands, including monodromy and the special/Steinberg case. Deduce conductor equality and the bad Euler factors. A match of semisimplified inertia or unramified traces alone is insufficient. Carry the archimedean and automorphic normalisation conventions through the comparison.

**Dependencies:** R19.3 (preceding layer).

<a id="r19-5"></a>

## R19.5. Compatibility at the coefficient prime

**Milestone:** `R19.5`

Use R06 and the geometry to prove the de Rham/crystalline/potentially semistable statements, Hodge weights and inertial-type comparisons available for these representations. Include the cases required for Barsotti–Tate, ordinary and endpoint-weight lifting. State residual irreducibility or other hypotheses needed by the published local-parameter theorem, and do not promote an almost strict system to a strict one.

**Dependencies:** [AutomorphicGaloisRepresentations R19.4](README.md#r19-4); [HilbertModularVarietiesAndShimuraCurves R18.5](../HilbertModularVarietiesAndShimuraCurves/README.md#r18-5); [PadicHodgeTheory R06.5](../PadicHodgeTheory/README.md#r06-5).

<a id="r19-6"></a>

## R19.6. Representations over Hecke algebras

**Milestone:** `R19.6`

Construct the determinant law from Hecke operators and Frobenius polynomials, then prove representability by a continuous representation over the localised completed Hecke algebra under absolute residual irreducibility. Prove compatibility with specialisation and the determinant, local type and ramification conditions needed for the map from a universal deformation ring. Include nilpotent structure and the distinction between reduced characteristic-zero specialisations and the whole integral Hecke algebra. For weight-two f only, prove V_ℓ(A_f) ≅ ⨁_{λ|ℓ} ρ_{f,λ} as Q_ℓ-representations with K_f-action, using restriction of scalars on each K_{f,λ}-summand. In particular its total Q_ℓ-dimension is 2[K_f:Q], while each λ-component has dimension two over K_{f,λ}. R29 uses the rational-coefficient case K_f=Q. Higher weights retain R19.1's symmetric-power/parabolic cohomology realization and acquire no abelian quotient from this statement.

**Dependencies:** R19.5 (preceding layer).

## Required examples and checks

Check a weight-two rational newform and its A_f, a higher-weight form, and a Hilbert parallel-weight-two form. Verify a Steinberg local factor and that a Hecke-algebra representation has the promised universal specialisations.



## References

DELIGNE69, DELIGNE_SERRE74, CARAYOL86, T_SAITO, KW2. The bibliography records what was inspected and what remains to be transcribed.

## Shared modular Iwasawa interfaces

This owns p-adic L-functions ModularGaloisRepresentations L3–L4 together with the arithmetic realization portions of L1–L2. Its curve, symmetric-power coefficient system and Betti/de Rham/étale period structures are ModularCurvesPartII; its period rings and comparisons are PadicHodgeTheory. Construct the eigenspace projector and stable lattice independently of desired Euler factors, then prove the characteristic-polynomial identity from the geometric correspondence.

For ordinary eigenforms prove the invariant filtration, exact graded characters, integral saturation and compatibility with the chosen refinement. For good nonordinary forms identify D_cris and the Wach-module Frobenius matrix with PadicHodgeTheory P7 and the roots used in signed regulators, retaining repeated-root and coefficient-extension hypotheses. Match all realizations with modular-symbol rational structures and period lines. Do not normalize a period by asserting that an unspecified lattice makes it integral.

General polynomial-law and Cayley–Hamilton theory is IntegralHeckeAndGaloisDeterminants; R19.6 constructs its geometric Hecke-law instance and proves local conditions. Dimension-n torsion eigensystems are assembled by TorsionCohomologyInfrastructure, not inferred by repeating the rank-two Jacobian argument.


## Implementation handoff: Geometric realization and coefficient-field components

**Stages:** R19.1, R19.2, R19.3, R19.4, R19.5, R19.6. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

R19.1 first constructs a fine-level universal elliptic family and the Sym^{k−2} local system, its parabolic cohomology and Hecke correspondence action. The coefficient-field eigenspace, arithmetic dual/twist and stable lattice are constructed after rational realization. In weight two compare the λ-component of R14.5’s Jacobian quotient; higher weights retain the cohomological construction.

**Acceptance and consumer contract.** Check a weight-two coefficient field of degree greater than one, a higher-weight form and a weight-one Deligne–Serre case as three distinct routes. Away from p compare full Frobenius-semisimple Weil–Deligne data including N; at p retain the source’s extra hypotheses. Over an integral Hecke algebra prove the polynomial law and absolute-residual-irreducibility reconstruction before asserting an actual family.

## Source anchors and prototype coverage

- AutomorphicGaloisRepresentations source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
