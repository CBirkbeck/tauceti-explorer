# REV-RS-24 — review of the RS-24 restructuring (Hecke algebras and torsion in arithmetic cohomology)

**Verdict: accepted, with no corrections.** Reviewer: Claude Code, session `cc-442dc5`, 23 September 2026. The proposal was written by ChatGPT Pro, session `gpt-20260921-c74f2a`. This reviewer took no part in it.

**What was read.**
- `RS-24.json`: two members, no anchors, and eight directed leads, all from unreviewed audits.
- The proposal `RS-24.result.json` and its report `RS-24.md`.
- Both member documents with all twelve layer descriptions: IntegralHeckeAndGaloisDeterminants IHG.0–IHG.6 and TorsionCohomologyInfrastructure TC.0–TC.4.
- The supplier and consumer stages the proposal names.
- The neighbouring proposals RS-12, RS-16 and RS-21.

**Checks run.**
- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-24.result.json` reports `ok`.
- A reachability check on `data/atlas.json` stage edges plus the proposed links.
- The upstream-owner claim, checked at Mathlib `082e2d3`: `Mathlib/RingTheory/PolynomialLaw/Basic.lean` defines `PolynomialLaw`, and `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean` defines `DividedPowerAlgebra`.

## 1. Duplication

Every lead is a supplier–consumer handoff. IHG owns the generic algebra; TC constructs the geometric instances and verifies their hypotheses.
- **IHG.2 / TC.2.** IHG.2 owns the generic ghost-ideal nilpotence. TC.2 builds the bounded geometric action and applies it.
- **IHG.3 / TC.3.** IHG.3 owns the integral GL_n Hecke polynomial and the Frobenius conversion. TC.3 does the symplectic/unitary boundary factor extraction. SR.4 owns Satake.
- **IHG.5 / TC.2.** IHG.5 gives the generic descent schema. TC.2 proves its premise.
- **IHG.6 / TC.4.** There is no overlap: IHG.6 is the Dasgupta–Kakde–Silliman–Wang integral Ribet theorem, and TC.4 is a four-route comparison with its examples. The proposal rightly rejects this lead.

**Owners.** The fourteen owner entries give each shared target one owner. The neighbouring proposals agree:
- RS-12 names IHG.1, IHG.3 and IHG.4 as the owners of the generic reconstruction, the Hecke polynomial and interpolation.
- RS-16 names IHG.6 for the integral Ribet theorem.
- RS-21 names SR.4 for Satake.

## 2. Nothing lost

**The narrowings.** They remove only constructions owned elsewhere, and each comes with supplier links.
- **IHG.0:** the bare polynomial-law and divided-power carriers, now owned upstream by Mathlib.
- **IHG.3:** the Satake transform, now SR.4's.
- **TC.2:** generic nilpotence and the general completed-tower constructions, now IHG.2's and CompletedCohomologyPartII CC.1, CC.2, CC.4 and CC.8's.
- **TC.3:** determinant and boundary generics, now IHG.0, IHG.1, IHG.3, IHG.4, IHG.5 and ArithmeticLocallySymmetricSpaces ALS.4's.
- **TC.4:** generic descent and limits, now IHG.4's and IHG.5's.

**External exports.** Every recorded external export is preserved: R01.5, AG2.0, AG2.3, IG.6 and I.7. AG2.0 used IHG.3 for the Hecke polynomial and the Frobenius conversion, which IHG.3 keeps, so it needs no direct SR.4 link.

## 3. Links, anchors, format

- **Links.** All 28 endpoints resolve. Nine are new edges:
  - IHG.3, IHG.5 and ALS.4 → TC.3;
  - IHG.4 and IHG.5 → TC.4;
  - IHG.1 → AutomorphicCongruences L0;
  - IHG.1 and IHG.4 → PadicFamilies L4;
  - TC.3 → PotentialAutomorphyInfrastructure PA.0.

  None closes a cycle.
- **Anchors and extensions.** There are no anchors and no extensions.
- **Format.** The JSON follows PROTOCOL §15.

## Note for the orchestrator

The owner entry "Actual geometric Hecke comparison, its bounded action and instantiated nilpotent quotient" (owner TC.2) lists IHG.5 under `formerly`. IHG.5 only states this comparison as a hypothesis that TC builds, so "formerly" overstates its role. That is harmless, so it was not changed.
