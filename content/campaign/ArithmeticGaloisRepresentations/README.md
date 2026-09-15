# Roadmap: Arithmetic Galois representations and conductors

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

Develop the common representation theory used by every modularity statement in this family. The output must describe actual continuous representations of absolute Galois groups, not lists of Frobenius traces with unspecified realisability. Work over number fields and their completions wherever the arguments permit; specialise oddness and the final residual theorem to the appropriate real places.

## Existing material and ownership

Consume the Krull topology and separable-closure API from Mathlib, ramification groups from LocalFieldsRamification, local Weil groups and reciprocity from ClassFieldTheory, and Chebotarev from its existing owner. Finite-group representations, induction and projective representations belong to RepresentationTheory. EllipticCurves supplies equation-level torsion and pairings; the scheme comparison is owned by ModularCurves #81 and AlgebraicCurves. This roadmap owns the arithmetic comparisons and conductor theory for representations, not a second local-field library.

## Conventions

A coefficient field is finite over Q_p, with its valuation topology, or finite of characteristic p with the discrete topology. A lattice is a Galois-stable finite free module spanning the representation. Arithmetic Frobenius acts on the residue field by x ↦ x^q. The global convention is HT(χ_p)=+1; any cohomological dual or Tate twist must be stated. At p=2, det(c)=-1 does not require the image of complex conjugation to be nontrivial.


<a id="r01-1"></a>

## R01.1. Continuous representations and integral models

**Milestone:** `R01.1`

Construct continuous representations on finite projective coefficient modules, with finite-dimensional field and finite-free local-ring specializations, in arbitrary finite rank n. For field coefficients construct invariant lattices using compactness. Prove descent of a continuous representation into GL₂(overline F_p), with discrete target, to a finite coefficient field. Relate finite Galois factorisation to continuity for finite coefficients. Define reduction followed by semisimplification and prove independence of lattice by characteristic polynomials and the characteristic-p Brauer–Nesbitt theorem. Include restriction, induction, duals, twists and coefficient extension, with topology on every map.

**Dependencies:** the existing mathematical suppliers identified in the ownership section.

<a id="r01-2"></a>

## R01.2. Decomposition groups, inertia and Weil–Deligne representations

**Milestone:** `R01.2`

Use a place or an embedding into a local separable closure to obtain restriction; prove invariance under changing that choice. Construct tame characters and fundamental characters of levels one and two. For ℓ different from the residue characteristic, prove quasi-unipotence and construct the monodromy operator and Weil–Deligne representation, including independence of the tame character. Distinguish the full object, its semisimplification, and its Frobenius semisimplification. With arithmetic Frobenius the relation is r(F)Nr(F)⁻¹=qN; do not copy a geometric-Frobenius formula unchanged.

**Dependencies:** R01.1 (preceding layer).

<a id="r01-3"></a>

## R01.3. Artin and Swan conductors

**Milestone:** `R01.3`

Define conductors using the ramification filtration, prove independence of the finite quotient and auxiliary choices, integrality, and induction and twist formulas under their stated hypotheses. For an ℓ-adic representation include the monodromy term; for a residual representation use its actual finite inertia action. Define N(rho-bar) as the prime-to-p conductor. Prove that reduction cannot increase the conductor at a prime different from p, and give the precise comparison with the conductor of an elliptic curve. Wild contributions at 2 and 3 are not omitted.

**Dependencies:** R01.2 (preceding layer).

<a id="r01-4"></a>

## R01.4. Residual images and oddness

**Milestone:** `R01.4`

Prove the finite-subgroup facts of GL₂/PGL₂ used in the source arguments, including dihedral and exceptional images, normal subgroups, and behaviour under restriction to cyclotomic fields. Consume the general finite-group classification results where present; construct each application with the coefficient field visible. For odd p prove that an odd, irreducible two-dimensional representation over a finite field is absolutely irreducible. Isolate characteristic two, where the distinct-eigenvalue proof at infinity is unavailable. Define bad-dihedral representations in the precise source sense.

**Dependencies:** [ArithmeticGaloisRepresentations R01.1](README.md#r01-1); [ArithmeticGaloisRepresentations R01.2](README.md#r01-2).

<a id="r01-5"></a>

## R01.5. Recognition by Frobenius polynomials

**Milestone:** `R01.5`

Prove Chebotarev recognition for semisimple continuous characteristic-zero and residual representations, after putting both into a common coefficient field. Use characteristic polynomials, not traces alone in small characteristic. Prove coefficient descent where a trace-and-determinant system is defined over a subfield and the descent obstruction vanishes; do not claim every such system descends without that hypothesis. Consume the arbitrary-degree multiplicative polynomial laws, Cayley–Hamilton algebras and representation theorem of IntegralHeckeAndGaloisDeterminants; supply the arithmetic continuity, Frobenius density and coefficient-descent comparison. Its rank-two trace/determinant specialization is the same object used here.

**Dependencies:** [ArithmeticGaloisRepresentations R01.1](README.md#r01-1); [ArithmeticGaloisRepresentations R01.2](README.md#r01-2); [IntegralHeckeAndGaloisDeterminants IHG.1](../IntegralHeckeAndGaloisDeterminants/README.md).

<a id="r01-6"></a>

## R01.6. Tate modules of elliptic curves and abelian varieties

**Milestone:** `R01.6`

Construct the inverse-limit Tate module from finite torsion and compare its residual representation with the existing pointwise action. Prove rank, continuity, Weil-pairing determinant, oddness over Q, and the good-reduction Frobenius polynomial. Prove compatibility with scheme isogenies. The finite-flat and crystalline statements are later outputs of R07 and R06, not consequences of the definition of a Tate module. Supply the conductor comparison and the local Euler-polynomial interface consumed by R29.

**Dependencies:** [AbelianSchemesAndArithmeticModuli A3](../AbelianSchemesAndArithmeticModuli/README.md#a3); [ArithmeticGaloisRepresentations R01.1](README.md#r01-1).

## Required examples and checks

Test χ_p, an unramified character, a split Tate curve, a supersingular good-reduction elliptic curve, and a CM elliptic curve over Q. Check both Frobenius conventions on a finite field and show that a trace-only residual recognition statement is not used at p=2.



## References

SERRE87, KW1, KW2, DELIGNE73. The bibliography records what was inspected and what remains to be transcribed.

<a id="g7"></a>

## G7. Dimension-general arithmetic API

Use finite projective coefficient modules with continuous actions as the common carrier; retain chosen bases only in framed coordinates. Construct exterior and symmetric powers, tensor induction and restriction of scalars with continuity and characteristic-polynomial identities. Define polarizations rᶜ ≅ r∨⊗μ for CM fields using an actual pairing and multiplier; prove its symmetry sign, determinant constraints and behavior under twisting/extension. Oddness for polarized dimension n is specified by the sign at each real place and is not reduced to the rank-two determinant test.

Prove dimension-general residual-image criteria needed for Taylor–Wiles primes: adequacy and the particular strengthened image conditions are explicit cohomological/invariant-subspace statements with separate verification lemmas. In particular ACC+ Definition 6.2.29 calls an absolutely irreducible subgroup H enormous when it has no nontrivial p-power quotient, H⁰(H,ad⁰)=H¹(H,ad⁰)=0, and for every simple H-submodule W of ad⁰ some regular semisimple h has W^h nonzero. Prove coefficient-extension invariance as in Lemma 6.2.30. This is not merely a synonym for adequacy; the ACC+ auxiliary-prime construction consumes enormous image after cyclotomic restriction. Construct the adjoint and trace-zero adjoint representations; when p divides n the scalar/traceless decomposition and nondegenerate trace pairing require correction, and the displayed enormous condition cannot hold because ad⁰ contains scalars. Keep the full End module, quotient-by-scalars module and trace kernel distinct. Transfer polynomial-law data to an actual representation only through IntegralHeckeAndGaloisDeterminants and its stated hypotheses. GL₂ exceptional-image and oddness calculations remain the rank-two specialization R01.4.


## Implementation handoff: Arithmetic normalization and recognition

**Stages:** R01.2, R01.3, R01.5, R01.6, G7. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

Construct the restriction maps from a chosen decomposition group and prove conjugacy independence. Record the arithmetic Frobenius action on cyclotomic characters, the corresponding inverse action on geometric cohomology, and the conversion to Weil–Deligne data. For an abelian variety of dimension g, the rational Tate module has rank 2g; rank two for a modular quotient requires its coefficient-field component.

**Acceptance and consumer contract.** Use a Steinberg example to distinguish the Weil semisimplification from the monodromy operator, and compare conductors including Swan terms. Recognition consumes all characteristic-polynomial coefficients after a common coefficient extension. Record the descent obstruction and test a scalar residual representation where a trace-only reconstruction would lose information. The enormous-image verification used by G7 remains a separate group-cohomology computation.

## Source anchors and prototype coverage

- ArithmeticGaloisRepresentations source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
