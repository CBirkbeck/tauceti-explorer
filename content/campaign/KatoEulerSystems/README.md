# Kato classes and explicit reciprocity for modular forms

Siegel-unit zeta classes, reciprocity and the arithmetic bound.

## Canonical ownership and interfaces

- All generic K₂ operations and étale/syntomic regulators are imported from K2SymbolsBrauer, MotivicEtaleKTheory and PadicHodgeRegulators. Kato's application includes its actual geometric moment/pushforward maps and integrality factors.
- Generic Euler/Kolyvagin-system descent and inequalities are instantiated from [EulerSystemsAndKolyvaginSystems](../EulerSystemsAndKolyvaginSystems/README.md) after proving every image, cartesian-local-condition and integrality hypothesis. The cyclotomic-units construction in EulerSystemsCyclotomicMainConjecture is a separate client, not the owner of this general descent. Rankin–Eisenstein classes are separate constructions in AutomorphicCongruences.

**Campaign dependencies:** [K2SymbolsBrauer](../K2SymbolsBrauer/README.md), [MotivicEtaleKTheory](../MotivicEtaleKTheory/README.md), [PadicHodgeRegulators](../PadicHodgeRegulators/README.md), [SelmerIwasawaCohomology](../SelmerIwasawaCohomology/README.md), [ModularSymbolsPadicLFunctions](../ModularSymbolsPadicLFunctions/README.md), [ArithmeticGaloisRepresentations](../ArithmeticGaloisRepresentations/README.md), [EulerSystemsAndKolyvaginSystems](../EulerSystemsAndKolyvaginSystems/README.md).

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

## Scope

Construct Kato's Euler system from modular-curve geometry and prove the explicit reciprocity law, covering RJW Theorems B.2–B.3 and the arithmetic half of B.4. The Euler-system classes are not defined by demanding that their regulator equal the analytic L-function. This roadmap proves their existence and that equality.

**Dependencies:** R07–R11 and the actual arithmetic modular curves. Use Kato’s 2004 Astérisque paper as the primary proof source. The mathematical objects in the milestones below must be constructed before their explicit reciprocity and divisibility theorems are proved; the Appendix B sketch is not a substitute for those constructions.

## L0. Siegel units

Define Siegel functions analytically, prove their product/q-expansion, transformation, divisor and integrality properties, and descend the appropriate powers to units on the algebraic modular curve. Construct auxiliary-parameter-normalized Siegel units and prove their distribution and norm relations under degeneracy maps. Prove independence of the auxiliary choices after multiplication by the explicitly named Euler/smoothing factors. Include arithmetic descent and Galois action.

## L1. Symbols and regulators

Import symbols, localization, tame residues, transfers and higher-K comparison from [K2SymbolsBrauer](../K2SymbolsBrauer/README.md) and [SchemeKTheoryOperations](../SchemeKTheoryOperations/README.md). Import étale Chern classes/syntomic comparison from [MotivicEtaleKTheory](../MotivicEtaleKTheory/README.md) and [PadicHodgeRegulators](../PadicHodgeRegulators/README.md). Apply these to Siegel units, construct the geometric pushforward/moment maps into the modular local system, and prove symbol-to-Kummer cup, denominator, Hecke and norm formulas in this geometry.

## L2. Global zeta classes

Apply these regulators to the actual pairs of Siegel units on modular curves at varying level. Use Hochschild–Serre, the local-system moment maps and Hecke projectors to obtain classes in H^1 of the Galois representation attached to f. Prove moment compatibility in the weight, descent in the auxiliary conductor, the p-direction norm relation and the away-from-p Euler relation. All duals and Tate twists are specified by the regulator's source degree.

Construct the integral version for the chosen lattice, proving where it belongs integrally and where an auxiliary factor is required. Construct the rational universal class before projecting to the form, and prove compatibility with coefficient change and the Hecke algebra. The notation z_Kato(f) denotes this constructed object, not an unspecified Euler system whose existence was assumed.

## L3. Explicit reciprocity

Compute the de Rham regulator by the explicit Eisenstein/modular-symbol pairing and the corresponding complex L-values. Establish the exact comparison of differential, Betti period, Gauss sum and Up normalization with R10. Localize at p, apply R09's vector regulator, and project using the chosen refinement and differential.

For noncritical finite slope, prove equality with R10's analytic distribution by the exact interpolation and growth uniqueness theorem. In critical cases use the stronger comparison/family theorem needed there; do not reuse the failed noncritical uniqueness argument. In bad-reduction/infinite-slope cases formulate the comparison on the domain supplied by the de Rham regulator theorem.

The endpoint is the properly normalized version of

    L_p^an(f,alpha) = projection_alpha(L_(V_f)(loc_p z_Kato(f))).

The primary normalization may use V_f^*(1) rather than V_f. Prove that dictionary; do not choose a representation convention merely because both sides have dimension two.

## L4. Nonvanishing and the Euler-system divisibility

Prove the analytic twist-nonvanishing theorem required to show the localized/global class is nonzero, including the cyclotomic-family theorem used in Kato's argument. Apply the generic bounds in EulerSystemsAndKolyvaginSystems, including its descent and integral finite-error analysis, after verifying the representation-theoretic and local hypotheses for these actual classes. Keep rational and integral statements separate, including possible powers of p in the latter when the large-image hypothesis is unavailable. Do not rebuild abstract Kolyvagin derivative operators or generic Selmer bounds inside this arithmetic construction.

Deduce the standard cohomological divisibility and the ordinary Selmer divisibility through R07's exact sequences and R09's local image theorem. This is one direction of the main conjecture; it is not declared to imply the opposite direction.

**Acceptance:** actual global classes satisfying every Euler relation; exact integral auxiliary factors; explicit reciprocity with the scalar analytic construction; nonvanishing and the precise characteristic-ideal divisibility under verified hypotheses. The reversed divisibility is supplied by R15/R16.

## Shared conventions and sources

The programme conventions, dependency contracts, and source register are part of this specification. References such as RJW, Rubin, SU, and FW denote the precise sources and versions listed there. The mathematical milestones above, not a source-code inventory, define completion.

## Public API and review contract

Every construction supplies extensionality, constructor/eliminator lemmas, identity/composition, equivalence invariance and scalar-extension or base-change compatibility wherever defined. Quotients have universal properties and map-level comparison theorems. Finiteness, flatness, admissibility, convergence, perfectness and integral-lattice hypotheses are stated and proved in each unconditional application.

A completed target includes the intrinsic construction, its working API, the stated comparisons and the worked tests above. Matching abstract groups with different maps, rational substitutes for integral statements, or an expected equality stored in an unconstrained structure do not discharge the contract. Check current Mathlib/Tau Ceti APIs before selecting names. Suggested signatures involving unavailable higher objects remain explicit comments; no stand-in theorem asserts their conclusions.

## Sources and evidence

The source register and machine-readable references fix source versions and download checks. Source theorem numbers refer to those versions. A bibliographic citation does not claim the result is formalized.

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `L1` | Prove moment/pushforward maps from the actual modular-unit symbol and its étale Chern class, including torsion and smoothing denominators. |
| `L2` | Identify the Hochschild–Serre edge-map summand with the selected modular representation, dual and Tate twist; prove integral lattice landing separately from rational eigenprojection. |
| `L3` | Compare the vector regulator and scalar modular-symbol distribution through a specific differential/eigenline and the growth-uniqueness theorem only in its noncritical range. |

**Producer–consumer handoff.** ModularIwasawaMainConjectures receives a precisely oriented divisibility from L4; AutomorphicCongruences constructs the independent reverse direction.

**Acceptance.** Test an auxiliary parameter change, conductor norm square and weight-two specialization. No equality is obtained by defining the class from its L-value.

**Source-readiness boundary.** Kato original integral zeta-class and reciprocity proof interiors remain to be transcribed; critical/infinite-slope domains need separate theorem checks.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
