# Euler systems and the unconditional cyclotomic main conjecture

Cyclotomic and abelian arithmetic applications of the shared Euler-system theory.

## Canonical ownership and interfaces

- [EulerSystemsAndKolyvaginSystems](../EulerSystemsAndKolyvaginSystems/README.md) now owns generic norm relations, Kolyvagin derivatives, auxiliary-prime selection, finite/singular maps and bounds. This roadmap retains their cyclotomic verification, unit-index arithmetic, and the unconditional cyclotomic/abelian main-conjecture proof. Kato and Heegner applications import the same general theory without depending on this cyclotomic endpoint.
- IntegralIwasawaTheory supplies early cyclotomic arithmetic; only its later classical-comparison layer consumes this endpoint. The modern totally real determinant proof remains independent in that owner.

**Campaign dependencies:** [PadicMeasuresIwasawaAlgebras](../PadicMeasuresIwasawaAlgebras/README.md), [DirichletPadicLFunctions](../DirichletPadicLFunctions/README.md), [ColemanPowerSeries](../ColemanPowerSeries/README.md), [IntegralIwasawaTheory](../IntegralIwasawaTheory/README.md), [SelmerIwasawaCohomology](../SelmerIwasawaCohomology/README.md).

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

## Scope

Apply the general rank-one Euler-system bound and prove the cyclotomic main conjecture without Vandiver. The route of record is Kolyvagin–Rubin: cyclotomic units, derivative classes, global duality, characteristic-ideal divisibility and the index/class-number argument. This reuses the notes' local theory and the new shared ES.0–ES.8 machinery. The p=2 and general abelian extension is a separate integral layer following Greither, not the odd-prime proof with `p≠2` deleted.

**Dependencies:** R01, R03–R04, R06–R07, ClassFieldTheory, and **Chebotarev** for the simultaneous prime-selection lemmas. This last dependency is essential and cannot be replaced by the existence of one unspecified auxiliary prime.

## L0. Euler systems and their normalization

Import ES.2's actual Euler-system carrier, field/conductor equivalence, twisting, smoothing and coefficient maps. Specialize to the cyclotomic directed family and prove its dictionary with Rubin's Tate-dual Euler-polynomial and arithmetic-Frobenius convention. Verify every field/tower hypothesis here; the generic construction is not repeated.

Construct the cyclotomic example from actual norm-compatible cyclotomic p-units and their smoothed units using R04/R06, and apply the Kummer map. Prove both the p-power norm relation and the auxiliary-prime Euler-factor relation. The notes' displayed choice c_m=(xi_m^−1−1)/(xi_m−1)=−xi_m^−1 is torsion; it is not the nontrivial system used in this proof. Give the comparison with c(a) and the smoothing divisor from R03.

## L1. Finite-level descent

Import ES.1/ES.3's ray-class, derivative, descent and finite–singular APIs. Prove the cyclotomic extensions and unit classes meet their hypotheses, identify the local Kummer conditions, and compute the resulting derivative classes. Track the local conditions on both the original and the derived classes.

Apply ES.1's simultaneous Chebotarev and independence lemmas in the explicit cyclotomic representation fields. Apply ES.4's Poitou–Tate descent bound to the actual class-group/Selmer comparison. The conclusion controls length, not merely exponent.

The imported error-tolerant theorem is Rubin II.2.2 as specified in ES.4: p>2, residual irreducibility, and a tau fixing the designated roots of unity, unit roots and K(1), with rank-one coinvariants. Verify these hypotheses for the present cyclotomic twist. Retain the two cohomological error lengths n_W and n_W^*; prove their vanishing in every specialization that claims an error-free bound. Prove the localized class is nonzero and has the required local conditions before concluding torsion/finiteness.

## L2. Iwasawa divisibility

Import the inverse-limit and multivariable bounds of Rubin II.3 from ES.8. Prove its no-completely-split-finite-prime hypothesis for the chosen cyclotomic extension and verify the control maps. Use the explicit cyclotomic class index to obtain characteristic-ideal divisibility. Keep pseudo-null terms separate from finite terms in several variables.

For cyclotomic units prove Rubin III.2.7:

    char(Y_infty^chi) divides char(E_infty^chi/C_infty,chi),

for the nontrivial even components covered there, with all coefficient and character conventions fixed. When a character is trivial on decomposition at p, carry the augmentation corrections through the local sequence and prove their removal; the argument is not the finite-level theorem assuming chi(p)≠1. Use the abelian Leopoldt theorem from R06, not a new assumption.

## L3. Equality and the unconditional notes endpoint

Prove equality in the preceding divisibility by the cyclotomic-unit index/class-number argument of Rubin III.2.8 and Lang's appendix. The proof must include the product-over-characters calculation, coefficient valuations, finite-layer error terms and their stabilization. Equality of total cardinalities alone does not give equality of individual components without the already proved componentwise divisibilities.

Treat the trivial character component and pole/augmentation factor separately. Combine the exact sequence

    0 → E^+/C^+ → U^+/C^+ → X^+ → Y^+ → 0

with char(E^+/C^+)=char(Y^+) and R04's local-unit theorem. Deduce finite generation and torsion of X^+ and

    char_(Z_p[[G^+]])(X_infty^+) = I(G^+) zeta_p

for every **odd** prime p. This is the unconditional Theorem 13.8; Theorem 13.11's stronger cyclic-module isomorphism is not asserted without Vandiver. Prove all equivalent even-character, odd-character/class-group and Tate-twisted Selmer formulations.

## L4. Abelian fields and p=2

Formalize Greither §§2–3: semilocal units over an abelian field with conductor prime to p; character functors and their bounded errors when the finite group order is divisible by p; circular units; the local-unit characteristic computation; the Euler-system inequality; Kummer duality; and the analytic class-number equality. Prove the conductor-reduction steps rather than imposing prime-to-p degree everywhere.

The target is Greither Theorem 3.2 and its p-ramified formulation, with its **one-half normalization** and its exceptional trivial/Teichmuller terms. In particular, include the case p=2 integrally. Do not claim that the odd-prime plus/minus splitting is exact over Z_2 or that its idempotents exist. Compare this normalization with R03's branch functions only after proving the factor-of-two and twist dictionary. Use the independent Ferrero–Washington input where the primary proof does so; do not derive that input using this same main conjecture.

**Acceptance:** complete arithmetic verification of the imported ES.0–ES.8 bounds; unconditional RJW Theorem 13.8; a separate Vandiver isomorphism comparison; Greither's abelian/p=2 theorem; explicit local Euler-factor and denominator accounting. No `MainConjecture` hypothesis occurs in the proof of a main-conjecture endpoint.

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
| `L0` | Construct a smoothed non-torsion unit family with both tower and auxiliary-prime norm relations, then prove its Kummer class matches the source Euler polynomial. |
| `L2` | Translate the class-group/Selmer dual with its involution and augmentation correction before orienting the Euler-system divisibility. |
| `L4` | Build the integral finite-character functors and bounded errors in Greither before comparing the one-half normalization. Keep Ferrero–Washington independent of the main conjecture being proved. |

**Producer–consumer handoff.** IntegralIwasawaTheory imports this abelian cyclotomic endpoint only after early unit/index arithmetic; general totally-real determinant arguments remain independent.

**Acceptance.** Test a trivial character, a character trivial on decomposition at p, and p=2 where averaging by (1±c)/2 is unavailable.

**Source-readiness boundary.** The independent characterwise index equality and full Greither dyadic proof require source decomposition.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
