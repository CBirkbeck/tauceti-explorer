# REV-RS-17 — review of the RS-17 restructuring (Étale weights, purity and the Weil conjectures)

**Verdict: accepted, with two corrections made in place.** Reviewer: Claude Code, session `cc-442dc5`, 23 September 2026. The proposal was written by Codex, session `codex-a71f92`. This reviewer took no part in it. The reviewer did review the neighbouring RS-19 (REV-RS-19), which is why the RS-19 interaction below was checked first.

**What was read.**
- `RS-17.json`: four members, no anchors, and 68 evidence records (34 unordered pairs).
- The proposal `RS-17.result.json` (37 layer entries, 300 links after correction, 44 owners) and its report `RS-17.md`.
- The four member stage lists and descriptions: DeligneWeightsAndPurity DWP.0–DWP.10, LefschetzPencilsAndVanishingCycles LPV.0–LPV.7 with both LPV.7 children, WeightsInEtaleCohomology R34.1–R34.6, and WeilConjectures WC.0–WC.7 with both WC.5 children.
  - Read in full against their `keeps`: DWP.1, DWP.10, LPV.6, LPV.7, LPV.7:semistable-curves, WC.5 and WC.7.
  - Read in its hard-Lefschetz passages: DWP.9.
- The outside layers that owner entries name under `formerly`:
  - EtaleDualityAndPerverseSheaves EDC.7 (relative hard Lefschetz);
  - FiniteFieldsAndCharacterSums FF.2;
  - ArithmeticGaloisRepresentations R01.3 and R01.6;
  - the accepted proposals in `data/restructure/`, especially RS-19.

**Checks run.**
- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-17.result.json` reports `ok` before and after the corrections.
- **Coverage of the evidence.** Every one of the 34 evidence pairs has an owner entry containing both layers (as owner or under `formerly`).
- **Forwarding (§15).** For every narrowed layer, every supplier in `suppliedBy` and every atlas consumer of that layer, the proposal has a link from the supplier to the consumer, or the edge already exists. Nothing is missing.
- **Application.** `apply_restructurings` on `data/atlas.json`, with the twelve accepted proposals applied first. No RS-17 link is skipped for a cycle. The 25 skipped links all have `UPSTREAM:CohomologicalPointCounting:…` sources, which the checker allows as external contracts and `restructure.py` does not draw.
- **Links to dropped stages.** Only two RS-17 links end at a stage that an accepted proposal drops: EDC.5 and EDC.6 into ET.2a:duality-perversity, which RS-19 drops. These are the subject of correction 1.

## 1. Duplication

The family is one proof spine with three consumers of it.
- **DWP** owns the weight theory: Weil numbers (DWP.0), the curve/abelian estimate (DWP.1), Weil I (DWP.2–4), Weil II (DWP.5–8), absolute hard Lefschetz (DWP.9) and generic arithmetic transport (DWP.10).
- **LPV** owns the geometry that the weight proofs consume: trait cycles, pencils, open symplectic monodromy, perverse nearby cycles, and the semistable and invariant-cycle branches.
- **WC** owns the zeta assembly, factor extraction, point-count inequalities and worked realizations.
- **R34** is the arithmetic-realization sequel.

Each of the 34 flagged pairs is settled by a named owner. The owners also agree with the neighbouring proposals:
- **Hard Lefschetz.** DWP.9 owns absolute hard Lefschetz, formerly EDC.7. EDC.7's own text plans only *relative* hard Lefschetz for projective f and says DWP.9 "is not a dependency" of it. RS-19 (accepted) names EDC.7 owner of the relative theorem. The edge DWP.9 → EDC.7 already exists.
- **LPV.6.** It owns the IG.4 filtered-colimit support extension, exactly as in RS-19's LPV.6 owner entry.
- **R11.4.** It owns the generalized Jacobian and monodromy pairing, as in RS-25 (REV-RS-25).
- **SF.5.** It owns the surface intersection route, as in RS-25 and RS-18.
- **FF.2.** Its text already imports DWP.7 and WC.3, so naming DWP.7 its owner changes nothing there.

## 2. Nothing lost

All 37 stages survive: 28 are narrowed and 9 kept.

**The narrowings checked in full.**
- **DWP.10.** It keeps the Hecke-subquotient transport, the ℓ-compatibility separation and the whole weight-facing acceptance suite. Its point-count inequalities move to WC.5, which already stated them.
- **WC.5.** It keeps the higher-dimensional estimates and the recurrence. It imports the curve bound from DWP.1 and the elliptic bound from EllipticCurves Layer 3, and its converse finite-spectrum lemma now sits in its own child WC.5:power-sum-converse.
- **WC.7.** It keeps every worked realization.
- **LPV.6, LPV.7 and LPV.7:semistable-curves.** They keep their actual constructions and import the geometry (StableReduction Layer 1, R11.4, EDC.5).
- **DWP.1.** Its narrowed text dropped two small original targets, the H⁰/H² weights of curves and compatibility under finite base extension. Nothing else owns them, so they are restored (correction 2).

**Consumers.** The forwarding check above finds no consumer of a narrowed layer without a link from each new supplier.

## 3. Extension, anchors and format

- **The extension.** WeightsInEtaleCohomology `extend`s DeligneWeightsAndPurity with the title "Deligne weights, purity and the Weil bounds, Part II: Arithmetic cohomology and eigenform applications". DWP's atlas title is exactly "Deligne weights, purity and the Weil bounds". The Part II starts where DWP's generic theory stops, at actual arithmetic realization. Its adapter prefixes R34.1–R34.4 depend deliberately on early DWP and LPV exports, so that the Faltings and semistable-curve applications do not wait for Weil II. That is a continuation in scope, not a gap or an overlap.
- **Anchors.** The family has no anchors. Tau Ceti suppliers appear only as link sources and owners, and are not changed.
- **Format.** The JSON follows PROTOCOL §15, including the `UPSTREAM:` contracts that the checker allows.

## 4. Corrections made

Both are in `research/blueprint/restructure/RS-17.result.json`.

1. **Two links removed.** EDC.5 → ET.2a:duality-perversity and EDC.6 → ET.2a:duality-perversity.
   - **Why they were there.** They forwarded LPV.6's narrowing to a consumer.
   - **Why they go.** RS-19, now accepted and in `data/restructure/`, drops that consumer and splices it into ET.5. `restructure.py` keeps a dropped stage and only hides it, so the links would have attached evidence to edges into a hidden stage.
   - **Nothing is lost.** RS-17 already contains the replacement links EDC.5, EDC.6, LPV.6 → ET.5.
2. **`layers[DWP.1].keeps`.** It now also retains "the H0 and H2 weights of curves and the compatibility of all these statements under finite base extension". These are targets of the original DWP.1 that no other layer owns.

## Questions for the orchestrator

1. **Upstream contracts are invisible in the atlas.** 25 links have `UPSTREAM:CohomologicalPointCounting:…` sources (TraceFormula 8, 13 and 14, FrobeniusGeometry, EllAdicRealization, EtaleBaseChange, ComplexComparison). `restructure.py` records them as skipped, so the atlas will not show that WC.0–WC.7, DWP.1–DWP.5, SF.3, R01.6 and FA.5 import PR196. If the map should show them, these layers need stage ids in the atlas.
2. **Forwarding makes some edges coarse.** An example is WC.3 → EDC.7, forwarded because DWP.7 was narrowed with WC.3 as a supplier. The proposal labels such links as inherited. The consumer blueprints should keep only the ones they use.
3. **Owner entries name outside layers under `formerly`.** Some entries list layers that this family cannot narrow: FF.2, RD.7, ClassicalAdicEtaleCohomology H1:valuation-nearby-cycles, ModularCurvesPartII R13.6, IG.4, SF.3, R01.6 and FA.5. Where those layers' own texts still plan the same object, their families' restructurings or blueprints should defer to the owner named here. For FF.2 and FA.5 the texts already import it.
