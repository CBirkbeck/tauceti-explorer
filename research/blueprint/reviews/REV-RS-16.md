# REV-RS-16 — review of the RS-16 restructuring (Iwasawa algebras, p-adic measures and the main conjecture)

**Verdict: accepted, with one correction made in place.** Reviewer: Claude Code, session `cc-442dc5`, 23 September 2026. The proposal was written by Codex, session `codex-c83e7a`. This reviewer took no part in it.

**What was read.**
- `RS-16.json`: four members (ColemanPowerSeries, IntegralIwasawaTheory, LocallyAnalyticDistributions, PadicMeasuresIwasawaAlgebras), no anchors, and 32 evidence records (16 unordered pairs).
- The proposal `RS-16.result.json` (38 layer entries, 116 links before correction, 23 owners) and its report `RS-16.md`.
- The PadicMeasuresIwasawaAlgebras introduction, and the original texts of L0a, L4, L5 and L6 against their entries.
- The Tau Ceti supplier layers the proposal leans on:
  - ProfiniteProPGroups Layer 9, including its section "The completed group algebra of the orientation image";
  - StableReduction Layer 1, which develops Fitting ideals for the singular locus.
- The pinned Mathlib (`082e2d3`) for the imports L4 relies on:
  - `Mathlib/RingTheory/PowerSeries/WeierstrassPreparation.lean` (Weierstrass division and preparation);
  - the `IsNoetherianRing` instance for (Mv)power series in `MvPowerSeries/Equiv.lean`;
  - `UniqueFactorizationMonoid R⟦X⟧` for a principal ideal domain R, in `PowerSeries/Ideal.lean:202`.

  Neither pinned library has a Fitting-ideal declaration.

**Checks run.**
- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-16.result.json` reports `ok` before and after the correction.
- **Coverage.** All 38 member stages have entries (17 narrow, 21 keep). Every one of the 16 evidence pairs shares an owner entry.
- **Forwarding (§15).** For every narrowed layer, supplier and atlas consumer, a link from the supplier to the consumer was looked for. 21 were missing before the correction; §4 explains them.
- **Application.** `apply_restructurings` with the twelve accepted proposals applied first. After the correction all 136 links resolve, all 108 new edges apply, and none is skipped for a cycle. No link ends at a stage an accepted proposal drops.

## 1. Duplication

The family shares one algebra and has distinct local and global theorems.
- **PadicMeasuresIwasawaAlgebras** owns measures, completed group algebras, Weierstrass and characteristic-ideal theory, determinant lines, and Gorenstein coefficient orders.
- **ColemanPowerSeries** keeps the local norm tower and the Coleman map.
- **IntegralIwasawaTheory** keeps the global class and unit arithmetic and the main conjecture proofs.
- **LocallyAnalyticDistributions** keeps the unbounded, locally analytic theory.

Each flagged pair has a named owner.

**The two Tau Ceti suppliers are real owners.**
- **ProfiniteProPGroups Layer 9** constructs Λ = ℤ_p[[Γ]] with its procyclic and dyadic coordinates. It proves the linear case of Weierstrass division ((T − c) ∣ ψ iff ψ(c) = 0), which it states is "the special case of Weierstrass division that Labute uses"; general Weierstrass preparation is explicitly not its target. The general case is in the pinned Mathlib, as L4's keeps say.
- **StableReduction Layer 1** develops "Kähler differentials and Fitting ideals far enough to form the relative singular closed subscheme". With no Fitting ideals in either pinned library, it is the only planned owner of the finite-presentation Fitting carrier, and L4, L6, I.6 and IHG.6 now import it.

**Consistency with other proposals.**
- RS-18 agrees that SchemeKTheoryOperations S.1 owns general perfect complexes.
- RS-24 (accepted) agrees that IntegralHeckeAndGaloisDeterminants IHG.6 owns the integral Ribet theorem.

## 2. Nothing lost

**The narrowings checked.**
- **L4** keeps continuity of division, regular local dimension two, elementary modules and pseudo-isomorphism, characteristic ideals, μ and λ with a general uniformizer, character components and multivariable divisors. It imports only what Mathlib and the two Tau Ceti layers really contain.
- **L5** keeps determinant lines, compact-limit exactness, topological Nakayama and the specialization comparisons. It imports perfect complexes from S.1, and P7's specialization results only in their complete local range.
- **L6** keeps the Gorenstein-order theory and the exterior bidual, and imports only the basic Fitting carrier.
- **L0a** keeps the character functor and the universal character. It relocates only the action on locally analytic coefficient families to LocallyAnalyticDistributions L4.

## 3. Extension, anchors, format

- **The extension.** PadicMeasuresIwasawaAlgebras becomes "Profinite and pro-p groups, Part II: p-adic measures and Iwasawa algebras". The Tau Ceti base title is "Profinite and pro-p groups", and the member's own introduction reads "Analytic and algebraic Part II of ProfiniteProPGroups". It starts where Layer 9's special completed group algebra stops.
- **Anchors.** The family has none, and no Tau Ceti layer is changed.
- **Format.** The JSON follows PROTOCOL §15.

## 4. Correction made

§15 requires that every layer that relied on a narrowed layer get a link from each new supplier. 21 such links were missing. Twenty were added to `links`, each with the reason "Protocol 15 forwarding …". They are:

- StableReduction Layer 1 → ColemanPowerSeries L1, EulerSystemsCyclotomicMainConjecture L3, IntegralIwasawaTheory KU-iwasawamodules, IntegralIwasawaTheory L2 and PadicMeasuresIwasawaAlgebras L5. These forward the narrowed L4.
- ProfiniteProPGroups Layer 9 → AutomorphicCongruences L0, ColemanPowerSeries L1, EulerSystemsCyclotomicMainConjecture L3, IntegralIwasawaTheory L2, PadicMeasuresIwasawaAlgebras L5 and L6. These also forward L4.
- DeformationAndDerivedPatchingAlgebra P7 → ColemanPowerSeries L3, IntegralIwasawaTheory L1 and SelmerIwasawaCohomology L0. These forward L5.
- StableReduction Layer 1 → EulerSystemsAndKolyvaginSystems ES.6, forwarding L6.
- PadicMeasuresIwasawaAlgebras L4 → ColemanPowerSeries L2, forwarding CPS L1.
- PadicMeasuresIwasawaAlgebras L2 → ColemanPowerSeries L3, forwarding CPS L2.
- PadicMeasuresIwasawaAlgebras L5 → NoncommutativeAndEquivariantIwasawa NE.4, forwarding I.4.
- PadicMeasuresIwasawaAlgebras L5 → EulerSystemsCyclotomicMainConjecture L3 and SelmerIwasawaCohomology L4, forwarding IIT L1.

None of the twenty closes a cycle.

**The one link not added.** LocallyAnalyticDistributions L4 → L3, which forwarding the narrowed L0a would require, was deliberately left out.
- The proposal's own reason says: "suppliedBy records relocation, not a prerequisite from L4 back to this early layer … scalar Mellin evaluation in LAD L3 needs only the retained character."
- The atlas edge LAD L3 → L4 exists, so the link would close a cycle.

## Questions for the orchestrator

1. **The §15 forwarding rule versus relocation.** Should the forwarding rule allow relocations like L0a's, where the supplier is downstream of the consumer? §15 as written requires the link, and here it cannot be added without a cycle. The proposal's reasoning is sound, so the review accepted it.
2. **Some forwarded links are coarse.** Examples are ProfiniteProPGroups Layer 9 → AutomorphicCongruences L0 and StableReduction Layer 1 → ColemanPowerSeries L1. They carry the whole Tau Ceti layer into consumers that need only the Λ coordinates or the Fitting carrier. The consumers' blueprints should cite the specific declarations.
