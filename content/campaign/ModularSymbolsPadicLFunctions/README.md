# modular symbols and analytic p-adic L-functions of modular forms

Modular-symbol Part II of ModularForms.

## Canonical ownership and interfaces

- Generic arithmetic quotient/cohomological Hecke operations and modular curve geometry are supplied by campaign owners. The rational/integral symbol comparison and period-normalized distribution construction remain here.
- The noncritical construction precedes PadicFamilies; the critical layer consumes its eigencurve/secondary eigensymbol construction. These milestone dependencies are explicit and do not require a critical theory to construct the eigencurve.

**Campaign dependencies:** [PadicMeasuresIwasawaAlgebras](../PadicMeasuresIwasawaAlgebras/README.md), [LocallyAnalyticDistributions](../LocallyAnalyticDistributions/README.md), [DirichletPadicLFunctions](../DirichletPadicLFunctions/README.md), [PadicFamilies](../PadicFamilies/README.md).

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

## Scope and dependencies

Construct analytic p-adic L-functions for normalized cuspidal eigenforms of arbitrary integral weight w≥2 and nebentypus, with an explicit p-refinement. Include ordinary, noncritical finite-slope and the established critical-slope constructions. The starting form can have p in its level; the good-prime p-stabilization comparison is a separate result.

Depend on R01–R03 and the existing ModularForms, FuchsianOrbifolds and algebraic-topology roadmaps. The existing classical ModularForms roadmap owns the forms, Hecke action, newform decomposition and complex L-function. Its level-one period-polynomial work does not supply the entire rational/integral modular-symbol theory at arbitrary level.

## L0. Modular symbols and Hecke actions

Define the degree-zero divisor module on P^1(Q) and modular symbols with values in an honest representation of the relevant matrix semigroup. Construct compactly supported/parabolic cohomology, Manin symbols, boundary maps, presentations and Hecke actions, and prove the comparisons. Include determinant factors, left/right actions, diamond operators, nebentypus and the involution at infinity.

Prove the Eichler–Shimura period maps at general level, their rational structures, Hecke equivariance, injectivity and eigenspace dimensions. At small levels handle elliptic stabilizers by torsion-free auxiliary level and descent; no division by their order is integral without justification. Provide functorial comparison with the analytic modular-curve carrier.

## L1. Periods and critical values

For a fixed normalized newform construct its coefficient field and the plus/minus eigenspaces over that field. Define period **lines** first. A scalar Omega_f^+ or Omega_f^− is obtained after choosing a basis; changing the basis changes normalized values by the corresponding scalar. Construct saturated integral modular-symbol lattices and canonical integral period choices up to O^× where the relevant multiplicity-one hypotheses hold.

Prove the Mellin formula expressing the integrals of f against polynomial differentials in terms of L(f,chi,j+1) for 0≤j≤w−2. Prove algebraicity of the period-normalized values, with the sign selected by parity. Every comparison must distinguish the twist by chi from the twist by chi^−1, the chosen Gauss sum, orientation of the path and whether (2 pi i)^(j+1) is absorbed into the normalization.

The reference-normalized interpolation comparison is **RJW B.1, after the character/period dictionary has been proved**: for the p-level eigenform of weight k+2,

    integral chi(x)x^j dL_p(f)
      = −alpha^(−n) (1−chi(p)p^j/alpha)
        G(chi) j! p^(nj)/(2 pi i)^(j+1)
        * L(f,chi,j+1)/Omega_f^sign.

Here the meaning of the twisted L-function and period is the one established by the period calculation, not guessed from the symbol `chi`. The primary theorem is the formula derived from the actual symbol and the shared classical L-function; if its dictionary exposes a printed normalization discrepancy in B.1, record the corrected comparison explicitly rather than demanding a false literal equality. The n=0 formula and the distinction between the L-function of a p-stabilized form and that of the original newform must be separately checked; converting to the good-prime newform introduces the second familiar Euler factor. The public API also exports the formula in the shared classical L-function convention.

## L2. Refinements and small slope

At p not dividing the original level construct the p-stabilizations for a nonzero root alpha of X^2−a_p X+epsilon(p)p^(w−1). Prove their Up eigenvalue, coefficient formula and Euler-factor change. At p dividing the level use the actual Up eigenvalue. A refinement includes a chosen root/eigenline; it is not determined by the underlying form alone.

Define distribution-valued symbols and their specialization to polynomial-valued symbols. Use R02's compact operators and filtration estimates to prove the small-slope control theorem for h=v_p(alpha)<w−1. Construct the unique eigenlift, evaluate on the divisor {infinity}−{0}, restrict to units, and prove the distribution relation, growth of order h, interpolation formula and uniqueness.

For h=0 prove boundedness. To claim an **integral** measure, use the integral lattice and period theorem from L1; boundedness alone gives coefficients in O[[G]][1/p], not necessarily O[[G]]. This distinction is required by R16.

## L3. Critical slope

Prove the theta exact sequence and distinguish slope w−1, theta-criticality and criticality of the refinement. Implement Pollack–Stevens' construction under its non-theta-critical hypothesis. For the Bellaiche construction include the relevant eigencurve/local-algebra conditions, generalized eigenspaces and secondary L-functions; use R13's finite-slope eigenvariety layer. Its analytic foundations and small-slope theory precede R13, so this is a higher module, not a cycle.

At a theta-critical point ordinary interpolation values may all vanish while the distribution does not. Prove the correct replacement for uniqueness and the dependence on eigenvectors/periods; do not extend B.1's strict inequality theorem by continuity. Compare the critical constructions with the arithmetic one only through a proved reciprocity/family theorem, not by values which no longer determine the distribution.

## L4. Examples and coefficient changes

Construct weight-two examples, tame character twists, both refinements at a good supersingular prime and the ordinary case. Prove functoriality under coefficient embeddings, primitive/imprimitive level changes and the matching of local Euler factors. R09/R12 supply the de Rham arithmetic construction relevant to alpha=0; no finite-slope modular-symbol theorem is used in that case.

**Acceptance:** Theorem B.1 with rationality, growth and exact periods; the established critical-slope cases with their actual hypotheses; the first and second Euler-factor comparison; integral period/measure tests; no assumption of the modularity theorem is needed to start with a modular form.

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
| `L0` | Build arbitrary-level compact/parabolic cohomology and its cusp boundary, with elliptic-stabilizer descent. Weight w uses polynomial degree w−2; it does not use a higher-weight abelian quotient of a Jacobian. |
| `L1` | Fix an integral period line up to O-units when that theorem is available; compare character inverse, Gauss sum, path orientation and p-stabilized versus primitive complex L-function. |
| `L3` | At critical slope use the theta exact sequence and the source local algebra/generalized eigenspace; do not identify distributions from vanishing interpolation values alone. |

**Producer–consumer handoff.** Kato L3 consumes the exact period and growth dictionary; ModularIwasawaMainConjectures L0 consumes the integral lattice and both Euler-factor corrections.

**Acceptance.** Compare n=0 with positive conductor, both roots at a supersingular prime, and a theta-critical distribution with insufficient determining moments.

**Source-readiness boundary.** RJW B.1 source character/period convention and both Euler factors must be fully transcribed before a final theorem signature.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
