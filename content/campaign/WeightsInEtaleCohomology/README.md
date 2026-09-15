# Roadmap: Weights and purity in étale cohomology

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

Preserve the R34 interfaces for finite-field weight and purity results used in
automorphic Galois representations, compatible systems and arithmetic finiteness.
The fully expanded proof owners are now
[DeligneWeightsAndPurity](../DeligneWeightsAndPurity/README.md) (DWP),
[EtaleDualityAndPerverseSheaves](../EtaleDualityAndPerverseSheaves/README.md)
(EDC) and [LefschetzPencilsAndVanishingCycles](../LefschetzPencilsAndVanishingCycles/README.md)
(LPV). This original roadmap is their application/import interface: no original
scope is dropped, and none of the general constructions is implemented twice.

## Existing material and ownership

The seven-roadmap family in #196 owns constructible étale coefficients, base change, compact support, ℓ-adic realisation and the trace formula. Those statements alone do not prove the Weil bounds or the theory of weights. R09 supplies geometric parameter spaces, R10 abelian varieties and R05 the formal geometry needed for the nearby-cycle applications. The new [WeilConjectures](../WeilConjectures/README.md) roadmap assembles rationality, functional equation, integrality/independence of ℓ and RH from the shared owners; it does not supersede their reusable constructions.

## Conventions

Fix a finite field F_q and ℓ≠char(F_q). DWP's geometric-Frobenius convention
assigns E(1) weight −2 and smooth proper H^i weight i; arithmetic Frobenius
is the inverse operator and therefore inverts these eigenvalue absolute values.
Transport to the arithmetic-representation convention explicitly rather than
using the same sign for both. Distinguish a chosen-embedding absolute-value
condition from algebraic purity under all complex embeddings. Purity, mixedness
and geometric/arithmetic semisimplicity are distinct properties.


<a id="r34-1"></a>

## R34.1. Frobenius, algebraicity and weights

**Milestone:** `R34.1`

Import DWP.0's Weil numbers, chosen-embedding versus algebraic weights and
elementary tensor/dual/twist rules. The complex-level upper/lower/pure formalism
is its later DWP.8 extension, not an early assumption. Prove the representation-
convention adapter on the imported Frobenius action. Finite-dimensionality
alone implies neither algebraicity nor purity.

**Dependencies:** DWP.0; the complex-level extension imports DWP.8 only when used.

<a id="r34-2"></a>

## R34.2. Curves and abelian varieties

**Milestone:** `R34.2`

Import DWP.1's curve/abelian Weil bound, using the actual H¹/Jacobian
comparison, AbelianSchemes A6 Rosati positivity and PR196 TraceFormula Layer 8's
fixed-point/Tate-module trace. Retain the curve/Jacobian application and its
normalization checks. This is not a second positivity or curve trace theorem.

**Dependencies:** DWP.1, including its explicit abelian-scheme/Jacobian suppliers.

<a id="r34-3"></a>

## R34.3. Nearby and vanishing cycles

**Milestone:** `R34.3`

Import LPV.0–2's actual nearby/vanishing-cycle functors, inertia/monodromy and
specialization sequence, and LPV.7:semistable-curves for the normalization/node
calculations. Verify their hypotheses and integral/adic compatibility in the
R13/R18 application. This prefix is independent of curve weights and Deligne
purity; LPV's later invariant-cycle/weight applications are not imported here.

**Dependencies:** LPV.0–2 and LPV.7:semistable-curves, not R34.2 or DWP.9.

<a id="r34-4"></a>

## R34.4. Geometric reduction and monodromy

**Milestone:** `R34.4`

Import LPV.3–5's Veronese/Bertini existence, blowup/pencil maps, vanishing-cycle
radical quotient and proved irreducible/open symplectic monodromy. Preserve its
characteristic-2 branch restrictions and finite-extension descent. EDC.2–4
supplies duality, cycle classes and weak Lefschetz. DWP.4 owns the subsequent
dimension/tensor-power purity induction; none of its conclusions is assumed here.

**Dependencies:** LPV.3–5 and their EDC.2–4 suppliers.

<a id="r34-5"></a>

## R34.5. Weil I and the required Weil II results

**Milestone:** `R34.5`

Import DWP.2–4's actual Weil I majoration, pencil rationality and smooth-projective
RH proof; DWP.5–8's full local/mixed-sheaf proof gives Rf! bounds and the
smooth-**proper** lisse purity extension. DWP.9 separately supplies absolute
hard Lefschetz. Generic duality/perversity now comes directly from EDC.0–5,
not from the endoscopic application. EDC.7's later pure-IC/relative-HL/
decomposition theorem consumes DWP.7–9 and is imported only by consumers that
need it; the proof of basic purity does not depend on that suffix. Verify the
R19/Kuga–Sato local system, cohomological shift, weight and Frobenius conventions
against these hypotheses. No assertion of arithmetic semisimplicity follows.

**Dependencies:** DWP.2–9 with the explicit early EDC/LPV stages; EDC.7 is a
separate optional application extension, not a prerequisite of DWP purity.

<a id="r34-6"></a>

## R34.6. Purity applications and comparison

**Milestone:** `R34.6`

Use DWP.10's export contracts in the existing eigenform/Kuga–Sato geometric
realizations to deduce the actual eigenspace purity and coefficient-independent
bounds used by compatible systems and Faltings' finiteness argument. Retain
the geometric construction and idempotent/Hecke compatibility in their existing
owners. State the exact local monodromy-weight theorem needed for any local–global
application; unresolved general weight–monodromy is not an assumption.

**Dependencies:** R34.5 and DWP.10, plus each actual automorphic realization.

## Required examples and checks

Check projective space, a smooth proper curve and its Jacobian, a Tate twist and a nodal semistable degeneration. Verify the eigenvalue convention against the point-count trace formula.



## References

WEIL_CURVES, DELIGNE_WEIL1, DELIGNE_WEIL2, SGA7. The bibliography records what was inspected and what remains to be transcribed.

## Source anchors and prototype coverage

- WeightsInEtaleCohomology source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.

## Completion contracts added on 2026-09-15

**Applies to:** `R34.1`, `R34.3`, `R34.5`, `R34.6`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

For each arithmetic consumer write the actual realization: H^i, its dual, a Hecke eigensummand or a Tate twist. Translate geometric Frobenius to the arithmetic action and compute the resulting weight. For a weight-k modular form distinguish the weight-two Jacobian realization from degree-(k−1) Kuga–Sato/parabolic cohomology; invoke the latter's constructed projector and coefficient field before purity.

### Producer–consumer contract

Return a weight statement for this identified realization, together with any separately proved coefficient compatibility. R34.3's nearby-cycle construction stays independent of purity. ℓ-independence of the full smooth proper characteristic polynomial does not prove compatibility of arbitrarily selected eigensummands.

### Acceptance and source route

A weight-two newform, a higher-weight form, a Tate twist, ordinary versus compact support on G_m, and a nodal curve require explicit convention adapters.

**Source route:** DWP.0/4/7/10; Deligne Bourbaki 355 §3, especially 3.19–3.20; Weil I/II. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
