# Roadmap: Siegel and PEL moduli problems

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

## Purpose and scope

Construct PEL moduli problems from integral and rational linear algebra, their representing algebraic spaces, their generic-fibre Shimura interpretations, and their good-prime integral geometry. Recover Siegel moduli, elliptic modular curves, and the geometric Hilbert moduli problems. This supplies concrete families and integral geometry without redefining a general Shimura variety to be a PEL moduli space.

Lan's *Arithmetic Compactifications*, Chapters 1–2, is the principal construction reference. His example-based introduction §§5.1.1–5.1.3 fixes the distinction between integral and rational data, good primes, disconnected groups, and extra components. Hida's lectures §§5–6 give a complementary account. The Hilbert-specific arbitrary-prime models have their own owner H2; they are not covered by a false good-reduction theorem here.

## Inputs and conventions

Consume A0–A5 for representability tools and abelian schemes, and D0–D4 for groups, Hodge cocharacters, and data. The comparison with complex Shimura varieties uses V0–V3 only. The canonicity theorem M4 uses the subsequent V4–V6, with the order specified in the family dependency table.

An integral PEL datum includes an order `𝒪` in a finite-dimensional semisimple `ℚ`-algebra, a positive involution, a finite lattice, a nondegenerate alternating pairing with its Tate twist, and a compatible complex structure satisfying positivity. The rational similitude group is derived from the tensor/pairing conditions. Connectedness and the Shimura axioms are proved when true, not inserted into the definition of all PEL input.

## Milestones

<a id="m0"></a>

### M0. Linear algebra and reflex field

**Dependencies:** A2–A3, D1–D4.

Define integral, rational, and p-integral PEL data separately, with the restriction and rationalization maps. Construct the similitude group and its representation, dual lattice, discriminant/bad-prime set, and real signature data. Relate the positivity condition to the associated Hodge structure. Define the determinant condition by the characteristic polynomials of the action on the chosen Hodge subspace, and prove its equivalence with the representation-theoretic condition over a splitting field.

Construct the field of definition of this determinant condition. In the cases yielding a Shimura datum, identify it with D3's reflex field. Avoid assuming that a trace identity alone over arbitrary characteristic determines a representation: the moduli condition is the full polynomial identity over the specified base.

<a id="m1"></a>

### M1. The moduli functors and descent

**Dependencies:** M0 and A0–A3.

Define the fibre categories of polarized abelian schemes with endomorphisms, Rosati compatibility, determinant condition, and level structure. Use the étale sheaf of trivializations of the prime-to-p Tate module when defining a prime-to-p level orbit. Over characteristic zero define the all-primes adelic variant; over a p-integral base allow only the prime-to-p quasi-isogenies specified by the source.

Define the isomorphism, rational quasi-isogeny, and prime-to-p quasi-isogeny moduli problems as distinct functors. Prove their comparison, including changes of lattice and polarization type. Establish effective descent for objects and morphisms. The set of objectwise isomorphism classes is not assumed to be a sheaf without proof.

For principal level prime to the residue characteristics, express the pairing constraint with its multiplier/trivialization. At non-self-dual lattice levels that multiplier may not be determined by the torsion basis; do not discard it from the datum.

<a id="m2"></a>

### M2. Representability and smoothness at good level

**Dependencies:** M1 and A0/A4.

Verify the representability criterion: algebraic diagonal/Isom functors, finite presentation, limit compatibility, deformation and obstruction spaces, effectivity, and openness of the relevant conditions. Prove that a sufficiently rigidifying prime-to-p level eliminates automorphisms. Construct the resulting algebraic space and its universal abelian scheme; retain the stack formulation for levels with stabilizers.

For a good rational prime require explicitly the unramified order condition, invertibility of the lattice discriminant/polarization defect, the source's p=2 exclusion for quaternionic factors, and no nontrivial level at p. Prove the smoothness theorem from the deformation calculation. These assumptions are not interchangeable with “p is large”. Prove the relative dimension formula and base change at the permitted bases.

Quasi-projectivity and scheme representability of all these integral algebraic spaces are proved by the compactification step C5. M2 does not assume that conclusion. This keeps the algebraic-space route independent of an unbuilt GIT theorem.

<a id="m3"></a>

### M3. Complex and generic-fibre comparison

**Dependencies:** M2, A5, V1–V3.

Construct the uniformization morphism with its family and level data. At this stage the generic-fibre moduli object is an algebraic space. Extend analytification to the étale presentations from A0, apply V3 to quasi-projective scheme charts of an étale atlas, and descend the resulting algebraic maps. Prove that the analytic component isomorphism algebraizes, using the étale/local-isomorphism comparison and descent. This proves scheme/quasi-projectivity for the relevant characteristic-zero pieces without using the later integral compactification C5. Determine its image in the PEL moduli space by the rational isomorphism class of the relevant polarized representation. Prove an open-and-closed Shimura component comparison, and the full disjoint-union statement where multiple rational forms occur.

Do not state that the entire PEL moduli space is one `Sh_K(G,X)` for every datum. The locally isomorphic adelic data can arise from different rational forms. Describe these forms by the relevant pointed-set obstruction ker¹(Q,G)=ker(H¹(Q,G)→∏_v H¹(Q_v,G)), with the fixed PEL tensor and positivity class retained. Prove the actual indexing/comparison theorem and its nonempty classes; triviality and a single Shimura component require the applicable Hasse principle, not a blanket assumption for every type A/C/D datum. Prove a single-variety identification only after the required Hasse-principle/component calculation. Likewise, the type-D similitude group can be disconnected; passing to its identity component must be accompanied by an actual comparison of the moduli problem.

<a id="m4"></a>

### M4. Canonical models and integral level changes

**Dependencies:** M3 and V4–V6.

Prove compatibility of the moduli Galois action with CM reciprocity and identify the appropriate generic-fibre pieces with the canonical models. Compare these identifications with changes of level, isogenies, and morphisms of PEL data.

At arbitrary higher p-level, define the normal integral model by normalization of the chosen good-level model in the generic-fibre cover, where that construction is used. Prove finiteness, normality, and flatness under their actual hypotheses. Do not assert smoothness, a fine moduli interpretation, or a universal abelian scheme on such a normalization without a separate theorem. These normalizations supply finite-level models for perfectoid constructions, not a blanket integral canonical-model theorem.

<a id="m5"></a>

### M5. Required examples

**Dependencies:** M0–M4 and the relevant example interfaces.

Construct Siegel moduli for every dimension and the genus-one comparison with #81, including its determinant/Weil-pairing convention. Construct the trace-pairing PEL datum for a totally real field and a polarization module; hand its Hilbert moduli problem to H1–H2. Construct a unitary PEL example over a CM field with specified signatures, verifying positivity, reflex field, dimension, and the good-prime conditions. Include at least one non-principal polarization type.

## Completion conditions

Each moduli space is constructed from a functor and a universal property, and every generic-fibre comparison respects universal objects and level correspondences. Bad-prime normalization models are named separately from smooth moduli models. PEL is an example class inside the general theory, not a restriction on its foundational definition.

<a id="m6"></a>

## M6. Arithmetic moduli and source R10.3/R10.6

Construct the moduli stack at arbitrary level and the fine scheme/algebraic space at each proved rigidifying level, with the universal abelian scheme and its Hodge line. Compare isomorphism classes with rational moduli points using the descent obstruction; existence of a rational coarse point alone does not construct a rational family. Export this comparison to height finiteness and give explicit nonempty Siegel and unitary examples with a nonprincipal polarization. Real-multiplication twists and their local points are H6 of HilbertModularVarietiesAndShimuraCurves.

**Dependencies:** M1; M2; AbelianSchemesAndArithmeticModuli A6. Scheme/quasi-projective realizations over integral bases additionally use ShimuraCompactifications C5; the descent obstruction and level-forgetting comparisons themselves are constructed on M2's algebraic spaces first. Export the rational-family/isomorphism-class comparison to FaltingsFinitenessAndIsogenyTheorems R28.1 and the universal Hodge line to ArakelovGeometryAndAbelianHeights R35.5.


## Implementation handoff: Moduli family versus parameter geometry

**Stages:** M1, M2, M3, M4, M6. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

A representability output consists of the actual fibre groupoid, its representing algebraic space or rigidified fine scheme, and the universal abelian family. M2 proves smoothness of the parameter space over the specified good base from the obstruction calculation. Smoothness/flatness of the universal abelian family over that parameter space does not prove flatness of the parameter space over the arithmetic base.

**Acceptance and consumer contract.** For higher-p-level normalization retain the separate normality/flatness proof and do not transfer the universal family without descent. Test a nonprincipal polarization and a type-D component obstruction. M3 records which rational PEL classes occur, and M6 distinguishes a rational coarse point from an object defined over that field. Arithmetic-point consumers must receive the latter.

## Source anchors and prototype coverage

- PELModuli source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
