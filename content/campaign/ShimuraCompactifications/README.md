# Roadmap: toroidal compactifications and boundary geometry

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

## Purpose and scope

Construct toroidal compactifications of pure Shimura varieties in characteristic zero, with their canonical fields of definition and comparison to the minimal compactification. Construct the integral compactifications required for good-prime PEL and arbitrary-prime Hilbert ordinary-neighbourhood applications. Supply universal semi-abelian boundary charts and the cusp geometry needed for overconvergent forms.

Minimal characteristic-zero compactifications are already owned by V2 and V8. This roadmap does not reconstruct them. It constructs the finer toroidal geometry and the comparison maps. The principal references are Ash–Mumford–Rapoport–Tai, Pink, Faltings–Chai, and Lan's *Arithmetic Compactifications*. Lan's example-based introduction §4 is the scope guide, not a substitute for the proofs in those construction sources.

## Existing suppliers

Consume `AnalyticToricGeometry` for its common cone, character lattice, monoid algebra, affine toric scheme, and finite-fan geometry. Its current scope is **finite regular rational fans**. The arithmetic fans required here are not generally finite. Extend its common fan API as described in the source fan-extension amendment §6; do not introduce a competing `ShimuraFan` carrier with unrelated gluing.

Consume V2/V8, A0–A5, M2–M4, and H2 only for the corresponding integral examples. The generic toroidal construction must not require a universal abelian scheme on every Shimura variety.

## Milestones

<a id="c0"></a>

### C0. Admissible fans and relative torus embeddings

**Dependencies:** the toric supplier and ReductiveGroups parabolics.

Extend the common fan structure to arithmetic-admissible collections: rational polyhedral cones, closure under faces, pairwise intersections, arithmetic group action, finiteness modulo that action, and the support/compatibility conditions at cusps. State local finiteness in the appropriate domain of positivity; do not require a locally finite family of cones in a neighbourhood of the common origin.

Construct common refinements and sufficiently fine smooth/projective refinements. Prove compatibility with rational parabolic inclusions and level changes. Extend affine toric charts from complex coefficients to the base rings used in integral models. Construct torus embeddings relative to a torus torsor by descent. The usual support criterion gives the properness statements under precisely the fan hypotheses established here.

<a id="c1"></a>

### C1. Rational boundary and mixed data

**Dependencies:** C0, D3–D4, V2.

Use V2’s rational boundary components and enrich their existing descriptions with the associated parabolic groups, unipotent radicals, centres, Levi quotients, and positivity cones; do not introduce a second analytic boundary-component definition. Construct the mixed Shimura data appearing at a boundary, with their weight filtration and the necessary mixed Hodge structure. This is the boundary part of mixed Shimura theory, not an assertion that all mixed Shimura varieties have already been formalized.

Prove the boundary component's pure quotient and the torus/abelian torsors that describe its neighbourhood. Establish the incidence and conjugation formulas, cusp labels, and stabilizers. The unipotent radical and its centre are different objects, and their character lattices must not be interchanged.

<a id="c2"></a>

### C2. Toroidal gluing in characteristic zero

**Dependencies:** C1 and complex analytic spaces/analytic gluing; V8 in the appropriate datum class for the canonical model over the reflex field. The complex construction does not wait for general canonical models.

Build the local partial compactifications from relative torus embeddings. Prove their transition and separation properties, form the arithmetic quotient charts, and glue them. Prove normality, properness, and the open immersion of the original Shimura variety. For a neat level and a smooth fan, prove the boundary's normal-crossings description; prove projectivity only for a projective admissible fan.

Construct the map to the minimal compactification and identify the inverse images of boundary strata. Construct the canonical model of the toroidal compactification over the reflex field using the boundary canonical models and descent. These are actual constructions, not unspecified smooth resolutions of the minimal compactification.

<a id="c3"></a>

### C3. Refinements and Hecke maps

**Dependencies:** C2.

For a refinement, construct the proper map of toroidal compactifications and prove the composition and identity laws. For a morphism of data or a Hecke translation, choose compatible source and target fans and construct the extension. Compare different choices through a common refinement. Do not assert that one fixed fan admits every Hecke correspondence.

Prove the structure-sheaf pushforward and the normality statements used to compare sections under refinements. Where higher direct images are required, make their vanishing a separate theorem with the relevant coefficient hypotheses. They do not follow formally from the degree-zero statement.

<a id="c4"></a>

### C4. Degenerations of polarized abelian schemes

**Dependencies:** C0, A2–A5, M1–M3.

Construct semi-abelian schemes, their character groups, extensions of abelian schemes by tori, biextensions, and the degeneration data associated with a cusp. Prove the polarized degeneration/1-motive construction and its algebraization/effectivity theorem. Establish the formal local description of the universal degeneration, the extension of endomorphism structures, and the comparison of level structures across a boundary chart.

Import the dimension-one generalized elliptic curves and Tate n-gons from ModularCurvesPartII R13.1–R13.3; compare the higher-dimensional degeneration construction with those objects. Compare the Tate curve and its invariant relative differential `du/u` for the multiplicative fibre coordinate u, its torsion, and the behavior of its base parameter q under isogeny. Keep `dq/q`, a logarithmic differential on the base, distinct; their relation belongs to the Kodaira–Spencer comparison, not an identification of the two differential sheaves. At p-power level the cusp map can ramify; it is not an étale torsor merely because its restriction away from the cusps is one.

<a id="c5"></a>

### C5. Integral PEL compactifications

**Dependencies:** C3–C4 and M2–M4.

Construct the integral toroidal algebraic spaces with their universal semi-abelian extensions, by gluing the degeneration charts. Prove their formal completion descriptions and properness. Establish the Hodge-line positivity and graded-section finite-generation statements that yield the integral minimal compactification, then its projectivity. Deduce the scheme/quasi-projectivity result for the open PEL moduli algebraic space from M2.

For higher p-level normalizations, prove the precise chart and finiteness properties used by the perfectoid-tower argument; do not extend smoothness automatically. Keep the good-prime assumptions on the input PEL datum. This milestone does not claim all-prime integral canonical models for every Hodge- or abelian-type datum. Export the good-base quasi-projective arithmetic moduli realization and Hodge line to ArakelovGeometryAndAbelianHeights R35.5 and FaltingsFinitenessAndIsogenyTheorems R28.1; their bad-prime correction bounds are not consequences of smoothness here. Lan revised-book Corollary 7.2.3.10 is the precise quasi-projectivity endpoint, not an assumption at M2.

<a id="c6"></a>

### C6. Hilbert and modular specializations

**Dependencies:** C4–C5 and H1–H4; for ramified Hilbert models use H2 and its own local model, not the good-prime hypothesis of C5.

Construct the Hilbert toroidal and minimal models used around the ordinary locus, with their cusp lattice, positivity cone, and unit quotient. Prove compatibility of `G*` polarization quotients with these compactifications and their formal neighbourhoods. Identify the semi-abelian extensions and Hasse ideals used in T3–T5.

For `F=ℚ`, compare the generic-fibre toroidal/minimal curve with ModularCurvesPartII R13.4a/R13.4b. Its comparison with PR81 Layer 10 is restricted to prime N≥5 diamond quotients with H≤(Z/N)×/{±1}; general full and composite levels use the new construction. For `g>1`, prove the precise Koecher extension theorem needed for Hilbert sections. Cusp forms are still distinguished by their boundary ideal; Koecher does not make vanishing at the boundary automatic.

## Completion conditions

The construction is independent of choices in the correct sense: refinement maps and canonical comparison isomorphisms, not literal equality of all compactifications. General boundary charts do not assume PEL type. Integral and ramified Hilbert conclusions are stated on their proved models/loci. The completed cusp charts are available as explicit rings and maps for perfectoidization and q-expansion arguments.


## Implementation handoff: Boundary charts and integral compactifications

**Stages:** C0, C2, C3, C4, C5, C6. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

For every cusp label construct the lattice, cone, arithmetic stabilizer and relative torus-torsor chart; prove the overlap maps and formal completions. A Hecke extension carries compatible source/target fans, while independence is mediated by refinements. Integral C5 consumes the proved good-prime moduli model and establishes properness and the positivity/finite-generation route to the minimal model.

**Acceptance and consumer contract.** Compute the elliptic Tate q-chart and separate du/u from dq/q. Test a nontrivial fan refinement and a p-level ramified cusp map. Prove the exact pushforward and higher-direct-image statements for each coefficient sheaf used by B3; degree-zero equality alone does not provide cohomology invariance. Keep general characteristic-zero, good-prime PEL and ramified-Hilbert outputs in distinct theorem statements.

## Source anchors and prototype coverage

- ShimuraCompactifications source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.

<a id="stage-C2.general"></a>

## C2.general. General-data completion interface

**Dependencies:** C2 and ShimuraVarieties V8.general.

Perform the toroidal gluing and descent of C2 for general data using its general canonical model; preserve rational boundary components and cusp stabilizers.

<a id="stage-C3.general"></a>

## C3.general. General-data completion interface

**Dependencies:** C3 and C2.general.

Extend the level/refinement/Hecke and boundary comparison maps to those general-data toroidal models; no all-prime integral statement is added.
