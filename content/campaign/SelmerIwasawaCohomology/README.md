# Selmer groups, continuous integral cohomology, and Iwasawa cohomology

Selmer conditions and mapping fibres, Iwasawa complexes, and specialization/control.

## Canonical ownership and interfaces

- [ArithmeticGaloisDuality](../ArithmeticGaloisDuality/README.md) is the sole owner of continuous compact/discrete coefficient comparison, derived limits, full Hochschild–Serre, Tate twists, global duality and compact support. This roadmap imports those actual complexes for Selmer mapping fibres, Iwasawa complexes and family control.
- The generic continuous/duality layers precede PadicHodgeTheory regulator applications. Hodge local conditions are a later layer here, preventing a Selmer/regulator dependency cycle.

**Campaign dependencies:** [PadicMeasuresIwasawaAlgebras](../PadicMeasuresIwasawaAlgebras/README.md), [ArithmeticGaloisDuality](../ArithmeticGaloisDuality/README.md), [PadicHodgeTheory](../PadicHodgeTheory/README.md) for L4 only.

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

## Scope and existing boundary

The existing ProfiniteCohomology roadmap explicitly excludes non-discrete coefficient theorems and Iwasawa limits. It therefore supplies finite/discrete cohomology, Kummer theory, cup products, restriction, corestriction and Shapiro, **not this roadmap's conclusion**. Extend its canonical cohomology carrier rather than defining a third incompatible theory.

Work over a number field F, a finite set S containing p and all ramification, a finite extension K/Q_p with integers O, a finite free O-lattice T with continuous Galois action, V=T[1/p], and A=V/T. The discrete module A and compact module T have different topologies and different limiting operations.

**Dependencies:** R01, ProfiniteCohomology, ClassFieldTheory, LocalFieldsRamification, GlobalNumberFields and the homological algebra already in Mathlib. Local p-adic Hodge conditions are a higher layer consuming R09.L0–L2; the core of R09 depends only on the earlier layers here, so the module split below is mandatory.

## L0. Integral and rational continuous cohomology

Import compact continuous cochains and their derived-limit comparison, lim^1 sequence, discrete comparison, full Hochschild–Serre with edge maps, continuous cup products, twists, duals, corestriction, finite/infinite Shapiro and projection formulas from ArithmeticGaloisDuality R02. Do not reimplement these general theorems here. Record which ordinary inverse-limit hypotheses hold for each tower used below.

Specialize the imported integral Kummer comparison to prove the tower-compatible identification

    H^1(F,Z_p(1)) ≃ lim_m F^×/(F^×)^(p^m),

with the correct cohomological hypotheses and topologies. For number-field units, S-units and local multiplicative groups prove separately when this completion agrees with a tensor-product expression. The unrestricted global group F^× is not finitely generated; do not replace its completion by an algebraic tensor product without a theorem.

## L1. Local and global duality

Import local invariant/Tate pairings, Euler-characteristic formulas, compact support with modified real-place terms at p=2, Poitou–Tate, finiteness and cohomological-dimension theorems from ArithmeticGaloisDuality R02. Prove the annihilator and saturation properties of the particular Selmer local conditions below, and calculate their unramified/bad-prime comparison terms. These are applications of the general duality theorem, not a second proof owner.

The supplier proves perfectness, not merely the existence of a pairing. Here the remaining proof obligation is identifying the actual annihilator of each chosen local condition and the resulting Selmer-complex duality map.

## L2. Selmer structures and duals

Define local conditions as submodules or maps of complexes on the actual cohomology groups. Define unramified, strict, relaxed and Greenberg conditions separately. Finite Bloch–Kato conditions are added in L4 after R09 supplies the period rings; they are not an input to the earlier cohomology construction. Greenberg's filtration is stable under a **decomposition group at p**, not generally the global Galois group. Saturation and the passage from V to T and A are separate lemmas.

For a finite extension F'/F define the Selmer group as the kernel of the global-to-local quotient map, with semilocal direct sums over all places above each v. Define its compact Pontryagin dual with the contragredient group action and prove the involution convention. Construct the Selmer complex as an actual mapping fibre and prove its cohomology gives the classical group under the stated H^0 conditions. Prove changes of local conditions, primitive/imprimitive exact sequences and lattice-change formulas.

## L3. Iwasawa cohomology and control

For a specified Z_p^d-extension F_infty/F construct H^i_Iw(F,T) using corestriction and identify it with cohomology of the induced completed-group-ring representation, with the inverse Galois action precisely specified. Prove continuous completed actions, finite generation, base change, duality and the specialization spectral sequences. Torsion of a global H^2 or a Selmer dual is **not** a default theorem for every T.

Prove control statements with explicit kernels/cokernels expressed through H^0, inertia and local quotient terms. For finite-slope or exceptional-zero situations retain the correction complexes. Establish the determinant-line formulation for perfect Iwasawa complexes and its relation to characteristic ideals using R01.L5. Infinite-level local conditions are defined by the appropriate limits, not by treating F_infty as a locally compact local field.

## L4. Arithmetic examples and conjectures

Recover R06's class-group and p-ramified modules from the Selmer groups of Tate twists, including the even-positive/odd-negative restrictions in RJW §13.5. Prove the plus/minus, Tate-dual and involution comparisons instead of suppressing them in the notation.

Once R09 supplies period rings, define and compare finite Bloch–Kato and ordinary local conditions, including exceptional factors rather than a universal equality. Define the Hodge/gamma-factor notion of criticality on explicit realization data; use the already available HodgeStructures carrier for the archimedean linear algebra, not for p-adic periods.

State RJW Conjecture 13.21 and its hypotheses on criticality, ordinary filtration, predicted corank and analytic L-function. No theorem asserting existence of a p-adic L-function for every motive is introduced. The rank-zero determinant statement and positive-rank leading-term statements are distinct propositions.

**Acceptance:** RJW §10.5's cohomological reinterpretation and §13.5; comparison with R06's exact sequence; lattice and local-condition changes; proof-level control with error terms; determinant/characteristic-ideal comparison under explicit perfectness and torsion hypotheses.

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
| `L2` | Define the cone of global plus local-condition cochains mapping to local cochains; calculate its H0/H1 exact fragment before identifying H1 with the displayed kernel. |
| `L3` | Construct finite-level specialization from the inverse-corestriction complex and its derived tensor product; write control kernels/cokernels as actual inertia/invariant modules. |
| `L4` | Compare Greenberg and Bloch–Kato conditions only after calculating the exceptional local subquotient. Keep compact T and discrete V/T propagation and orthogonal duals separate. |

**Producer–consumer handoff.** Kato, Heegner, signed and BSD consumers must select the same local condition and lattice or apply a proved change-of-condition triangle.

**Acceptance.** Test a bad Tamagawa prime and a specialization with nonzero H0/Tor. A rank calculation alone cannot eliminate either correction.

**Source-readiness boundary.** Source-qualified family control and weak-Leopoldt/torsion inputs are individually unresolved until proved.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
