# Roadmap: Faltings finiteness, semisimplicity and isogeny theorems

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

Prove the abelian-variety finiteness and Tate-module comparison results needed to pass from equality of modular and elliptic Galois representations to an actual modular parametrisation. They also give a direct residual-irreducibility argument for all elliptic curves over Q, including CM curves.

## Existing material and ownership

JacobianChallenge/R10 own abelian varieties and polarised moduli; R11 owns Néron/semistable models; R35 owns the Arakelov/Faltings-height construction and comparison ingredients. ArithmeticHeights #287 supplies absolute heights and Northcott, not Faltings' arithmetic boundedness theorem. R01/R06 provide Tate modules and local comparison, and R34 the finite-field weight bounds needed in the chosen finiteness proof.

## Conventions

Fix the number field and dimension in finiteness statements, and the polarisation degree where the source requires it. Distinguish isomorphism, isogeny and polarised isomorphism. State Tate-module Hom comparison rationally and integrally as separate results; derive only the integral form actually justified by the proof.


<a id="r28-1"></a>

## R28.1. Height finiteness on arithmetic moduli

**Milestone:** `R28.1`

Use R35's geometric height comparison and the existing Northcott theorem to prove finiteness for polarised abelian varieties of bounded height with the required fixed parameters. Prove the descent and level-structure arguments needed to convert moduli points into isomorphism classes. Use Zarhin's trick or the appropriate polarisation argument to remove unnecessary polarisation restrictions, with a proof of the resulting finiteness transfer. When finiteness transfer uses lattices over an order in a semisimple Q-algebra, prove the needed Jordan–Zassenhaus finite-lattice theorem or identify its current general algebra owner; it is not implicit in Northcott.

**Dependencies:** [AbelianSchemesAndArithmeticModuli A6](../AbelianSchemesAndArithmeticModuli/README.md#a6); [ArakelovGeometryAndAbelianHeights R35.6](../ArakelovGeometryAndAbelianHeights/README.md#r35-6); [NeronModelsAndSemistableAbelianVarieties R11.6](../NeronModelsAndSemistableAbelianVarieties/README.md#r11-6); [PELModuli M6](../PELModuli/README.md#m6).

<a id="r28-2"></a>

## R28.2. Isogeny-height estimates and boundedness

**Milestone:** `R28.2`

Prove the Faltings isogeny-height estimates and the key boundedness result in the isogeny class, using the integral differential/p-divisible-group calculations supplied by R35/R07 and the source's arithmetic argument. Include the treatment of primes dividing the isogeny degree. Northcott alone is not this result: its input height bound must be proved here.

**Dependencies:** R28.1 (preceding layer).

<a id="r28-3"></a>

## R28.3. Finiteness within an isogeny class

**Milestone:** `R28.3`

Deduce finiteness of the relevant isomorphism classes within an isogeny class from the height bound and Layer 1. State the field-of-definition restriction on the isogenies. Prove the companion finiteness statements for products and polarisations needed in the Tate-module argument. Keep this result independent of modularity or a modular parametrisation.

Use the corrected stationarity assertion in Faltings' 1984 erratum, not the original Satz 2: the sequence h(A_n) is eventually stationary. The closure group schemes form the required ell-divisible group only after passing to a sufficiently large index m; construct that tail and apply the argument to A_m. Do not assert stationarity starting at A_0 or that the original closure tower is already ell-divisible.

**Dependencies:** R28.2 (preceding layer).

<a id="r28-4"></a>

## R28.4. Semisimplicity and the Tate isogeny theorem

**Milestone:** `R28.4`

Derive semisimplicity of V_ℓ(A) and the comparison Hom_F(A,B)⊗Q_ℓ ≅ Hom_{G_F}(V_ℓ(A),V_ℓ(B)) using the finite-isogeny-class argument, graph constructions and endomorphism algebra. Prove the injectivity and surjectivity, not just equality of dimensions. Establish the isogeny criterion when the rational Tate modules are isomorphic.

**Dependencies:** [ArithmeticGaloisRepresentations R01.6](../ArithmeticGaloisRepresentations/README.md#r01-6); [FaltingsFinitenessAndIsogenyTheorems R28.3](README.md#r28-3); [PadicHodgeTheory R06.6](../PadicHodgeTheory/README.md#r06-6); [WeightsInEtaleCohomology R34.2](../WeightsInEtaleCohomology/README.md#r34-2). Only the curve/abelian finite-field weight bounds are needed here, not the full mixed Weil-II/decomposition chain.

<a id="r28-5"></a>

## R28.5. Shafarevich finiteness

**Milestone:** `R28.5`

Prove finiteness of abelian varieties of fixed dimension over F with good reduction outside a fixed finite set, following the exact source route from the preceding theorems and arithmetic bounds. Supply the finite Frobenius-data or moduli boundedness argument rather than claiming that good reduction automatically bounds a naive projective height. Treat the polarisation and semistable-extension reductions explicitly.

**Dependencies:** R28.4 (preceding layer).

<a id="r28-6"></a>

## R28.6. Interfaces for elliptic curves and automorphic cohomology

**Milestone:** `R28.6`

Export semisimplicity, the rational Hom comparison, isogeny detection and finite Q-isogeny-class results against the existing abelian/elliptic curve types. Prove the finite-generation and rank-one Hom consequence when End_Q(E)=Z. R29 uses this to show only finitely many rational prime-degree isogenies without requiring the full Serre open-image theorem or excluding CM curves.

**Dependencies:** R28.5 (preceding layer).

## Required examples and checks

Check a product A×B, an isogenous pair of elliptic curves and a CM elliptic curve over Q whose full geometric endomorphism ring is larger than its rational endomorphism ring. Verify that Frobenius matching produces an isogeny only after invoking the proved Tate-module Hom theorem.



## References

FALTINGS83, FALTINGS_CHAI, ZARHIN. The bibliography records what was inspected and what remains to be transcribed.


## Implementation handoff: Arithmetic boundedness and the Hom map

**Stages:** R28.1, R28.2, R28.3, R28.4, R28.5. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

Keep a proof dependency table separating bounded-height Northcott, isogeny-class height bounds, finite isogeny classes, semisimplicity/Hom comparison and Shafarevich finiteness. Include descent from level moduli points, the polarization-removal construction and finite-lattice classification where used. The 1984 corrected closure tower starts only after its proved stationary tail.

**Acceptance and consumer contract.** Construct the natural Hom tensor map, prove injectivity and surjectivity, and then derive isogeny detection; dimensional equality is not a substitute. Test products and a CM curve over Q to distinguish rational from geometric endomorphisms. R28.5 must supply an actual arithmetic boundedness or finite-Frobenius argument with fixed field/dimension/bad set; it cannot assume that good reduction bounds height.

## Source anchors and prototype coverage

- FaltingsFinitenessAndIsogenyTheorems source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
