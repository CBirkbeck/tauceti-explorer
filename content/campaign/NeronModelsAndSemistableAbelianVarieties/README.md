# Roadmap: Néron models and semistable abelian varieties

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

Construct the scheme-theoretic reduction theory required by integral Hecke arguments, local Galois compatibility, small-ramification theorems and Faltings. Equation-level Tate's algorithm and the abstract Néron mapping property are not interchangeable substitutes.

## Existing material and ownership

EllipticCurves owns equation-level reduction, conductors and Tate curves, but explicitly excludes Néron models. StableReduction owns its curve-theoretic results; check its scope before claiming semistable reduction for general abelian varieties. JacobianChallenge/R10 supply abelian varieties, abelian schemes and their Picard theory. R05 supplies formal geometry.

## Conventions

A Néron model is smooth and separated with its extension property against all smooth test schemes in the stated base class. It is generally not proper. The identity component, component group and whole group scheme must be distinguished. A semistable abelian variety has semiabelian identity component in its special fibre.


<a id="r11-1"></a>

## R11.1. Néron models and their uniqueness

**Milestone:** `R11.1`

Construct Néron models of abelian varieties over excellent discrete valuation rings and over the Dedekind bases used here, in particular rings of integers and rings of S-integers of number fields. Prove the local existence/smoothening theorem and the Dedekind local-to-global gluing: extend over a dense open, glue the finitely many remaining local models by the Néron mapping property, and prove the global mapping property and finite-type assertions (Bosch–Lütkebohmert–Raynaud, §§1.2–1.4 and the existence chapters). Prove uniqueness and functorial extension of homomorphisms. Identify the global invariant-differential lattice and its localization at each finite place; this is the lattice consumed by ArakelovGeometryAndAbelianHeights R35.2. Compare good reduction with an abelian-scheme model. Prove the permitted étale/unramified base-change comparisons; arbitrary ramified base change is not asserted.

**Dependencies:** [AbelianSchemesAndArithmeticModuli A1](../AbelianSchemesAndArithmeticModuli/README.md#a1); [AdicSpacesPartII F0](../AdicSpacesPartII/README.md#f0).

<a id="r11-2"></a>

## R11.2. Special fibres and component groups

**Milestone:** `R11.2`

Construct the identity component, toric and abelian parts, character groups and component group. Prove functoriality under isogeny and the exact sequences actually used in modular-curve arguments. Distinguish rational component groups from their geometric points. For elliptic curves compare the scheme data with the existing reduction filtration and Tate algorithm, including the wild primes.

**Dependencies:** R11.1 (preceding layer).

<a id="r11-3"></a>

## R11.3. Semistable reduction and uniformisation

**Milestone:** `R11.3`

Prove semistable reduction for abelian varieties after a finite extension and the monodromy criterion relating it to the Tate-module action. Construct the Raynaud extension and the uniformisation statements used for degenerating Jacobians. Formal analytic constructions consume R05, not an assumed rigid generic fibre. State the necessary polarisation and lattice conditions in the uniformisation theorem.

**Dependencies:** [AbelianSchemesAndArithmeticModuli A3](../AbelianSchemesAndArithmeticModuli/README.md#a3); [NeronModelsAndSemistableAbelianVarieties R11.2](README.md#r11-2).

<a id="r11-4"></a>

## R11.4. Picard schemes of semistable curves

**Milestone:** `R11.4`

Construct the degree-zero Picard and generalised Jacobian of the semistable curves used by R13/R18. Identify the toric character group from the dual graph, prove the monodromy pairing and the component-group description under the exact regularity hypotheses, and relate it to the Néron model. Smooth proper Jacobians are already owned by JacobianChallenge; this is their degeneration theory.

**Dependencies:** R11.3 (preceding layer).

<a id="r11-5"></a>

## R11.5. Tate modules, conductors and local factors

**Milestone:** `R11.5`

Prove Néron–Ogg–Shafarevich and the good/semistable Galois comparisons required here, using R06 for p-adic comparison and R01 for conductors. Establish preservation of good reduction under isogeny. Relate monodromy and component data to the characteristic-zero local Euler polynomial, not merely its semisimplified inertial action.

**Dependencies:** R11.4 (preceding layer); [PadicHodgeTheory R06.6](../PadicHodgeTheory/README.md#r06-6).

<a id="r11-6"></a>

## R11.6. Interfaces for modularity and finiteness

**Milestone:** `R11.6`

Supply the character-group exact sequences and monodromy maps consumed by level lowering, with degeneracy-map functoriality. Supply the semistable and good-reduction facts used by R25 and the isogeny-height analysis of R28. Prove the equation-level/scheme-level comparison for every elliptic invariant used in R29, preserving the existing public definitions.

**Dependencies:** R11.5 (preceding layer).

## Required examples and checks

Compute the Néron model of a good elliptic curve, split and nonsplit multiplicative reduction, and a nodal semistable curve's generalised Jacobian. Verify that the Néron model of a multiplicative elliptic curve is not a proper elliptic scheme.



## References

BLR, FALTINGS_CHAI, GROTHENDIECK_MONODROMY. The bibliography records what was inspected and what remains to be transcribed.


## Implementation handoff: Integral reduction and monodromy

**Stages:** R11.1, R11.3, R11.4, R11.5, R11.6. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

Construct the Néron mapping-property object over a DVR, then glue the arithmetic Dedekind model. Export the invariant differential lattice and its localization, and distinguish this smooth nonproper model from proper semistable compactifications. For a semistable curve construct the dual graph chain complex, toric character lattice and monodromy pairing with its integral cokernel.

**Acceptance and consumer contract.** Verify split and nonsplit multiplicative elliptic examples and a curve with more than one component. Compare component groups over the residue field and its algebraic closure, with Galois action. At ramified field extension compute the change of model instead of applying unramified base change. The resulting Weil–Deligne operator must recover the conductor and local factor used by R19 and R29.

## Source anchors and prototype coverage

- NeronModelsAndSemistableAbelianVarieties source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
