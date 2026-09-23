# REV-RS-22 — review of the RS-22 restructuring (Shtukas and Langlands over function fields)

**Verdict: accepted, with no corrections.** Reviewer: Claude Code, session `cc-442dc5`, 23 September 2026. The proposal was written by Codex, session `codex-c83e7a`. This reviewer took no part in it.

**What was read.**
- `RS-22.json`: two members, no anchors, and eight directed leads (four pairs).
- The proposal `RS-22.result.json` and its report `RS-22.md`.
- Both member documents with all thirteen layer descriptions: GlobalShtukasAndFunctionFieldLanglands GS.0–GS.7 and HeckeStacksAndLocalShtukas HS0–HS4.
- Every stage the proposal links to: FunctionFieldArithmetic FA.4 and FA.6, EtaleDualityAndPerverseSheaves EDC.5, SchemeAndStackFoundations SF.1, VStackSheavesAndLisseCategories VS1, ExcursionOperatorsAndSpectralAction ES7:equal-characteristic, ES1:finite-ramification and ES6:functoriality, GeometricSatakeAndFusion GS0–GS4, and Tau Ceti ClassFieldTheory Layer 9.
- The other restructuring proposals that touch these layers: RS-05, RS-17, RS-20, RS-21 and RS-25. All of them only add incoming links.

**Checks run.**
- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-22.result.json` reports `ok`.
- A reachability check on `data/atlas.json` stage edges plus the proposed links.

## 1. Duplication

The four flagged pairs are analogous constructions on different curves, not one theorem planned twice.
- **GS.1 / HS0.** GS.1 builds Beilinson–Drinfeld Grassmannians and bounded Hecke stacks over powers of a curve over a finite field, and proves the classical equal-characteristic geometric Satake. HS0 builds Hecke correspondences of bundles on the relative Fargues–Fontaine curve.
- **GS.2 / HS0 and GS.2 / HS2.** A global shtuka adds the Frobenius identification to successive modifications over the global curve. HS2's local shtukas are framed fibres of HS0's correspondence over E_b and E_b′. They are different moduli problems.
- **GS.4 / HS1.** GS.4 proves the classical Drinfeld lemma (V. Lafforgue, Lemma 8.2) and a global Galois product action. HS1 imports the divisor version of Drinfeld's lemma (Fargues–Scholze IV.7, planned in VS1) for a local Weil action.

So an empty `owners` list is right.

**Satake.** The reviewer also checked whether GS.1's classical Satake is planned elsewhere. GeometricSatakeAndFusion is the Fargues–Scholze Satake over the Fargues–Fontaine curve. Its GS4:classical-Satake-comparison is only a Frobenius-trace comparison with spherical functions, so GS.1 is the sole owner of the classical Mirković–Vilonen/Lafforgue Satake on a global curve.

## 2. Nothing lost

Every layer is kept, so no target moves and no consumer changes. The external consumers of HS1–HS4 (ES0, ES1:finite-ramification, ES6:functoriality, ES7:parabolic, ES7:GLn-comparison, ES7:equal-characteristic, and ET.6a) are untouched. GS.0–GS.7 have no external consumers.

## 3. Links

All thirteen endpoints exist in the atlas.

**Nine are new edges.**
- **FA.6 → GS.3:** the cusp-form space in the no-leg comparison.
- **FA.4 → GS.5 and GS.6:** the rank-one reciprocity checks that both layers' acceptance criteria require.
- **EDC.5 → GS.3:** scheme intersection complexes.
- **SF.1 → GS.2:** descent and representability.
- **HS2, HS3 and ES7:equal-characteristic → GS.7:** the local endpoints of the local–global comparison.
- **Tau Ceti ClassFieldTheory Layer 9 → HS1:** the local Weil group.

**Four restate existing edges:** VS1 → HS1, GS3:fusion → HS4, HS4 → ES1:finite-ramification and HS4 → ES6:functoriality.

**Acyclicity.** No new edge closes a cycle. GS.7 has no consumers, and nothing downstream of GS.2–GS.6 leaves GlobalShtukas.

## 4. Anchors, extensions and format

- There are no anchors, no Tau Ceti roadmap changes, and no roadmap is extended.
- The retitling of HeckeStacksAndLocalShtukas to "Hecke correspondences on the Fargues–Fontaine curve and local shtuka cohomology" clarifies that HS0's "global" means the Fargues–Fontaine curve. `scripts/restructure.py` applies titles for `keep` actions.
- The JSON follows PROTOCOL §15.

## Questions for the orchestrator

1. **A counting discrepancy in the report.** `RS-22.md` counts "Tau Ceti ClassFieldTheory Layer 9 → HS1" among the existing handoffs and so reports eight new edges. In `data/atlas.json` that edge does not exist yet, so there are nine new edges. The JSON is unaffected.
2. **A cross-family lead.** The author notes that EndoscopicTransferAndUnitaryTraceComparison ET.2b asks for ordinary global G-bundle and affine-Grassmannian geometry. That geometry is GS.0/GS.1's. It is outside this family, but a later restructuring or ET.2b's blueprint should import GS.0/GS.1 rather than plan it again.
3. **A title for the blueprint.** HS0's stage title, "Global and local Hecke stacks", would read better as "Hecke stacks on the Fargues–Fontaine curve and their local models", consistent with the new roadmap title. This is left to the blueprint, since the proposal changes no stage titles.
4. **A prose/graph mismatch the author flagged.** ES7:equal-characteristic and ET.6a both describe "transporting" their realizations to HS3, while the graph has HS3 as their input. This is a prose/granularity issue in those consumers' documents, not a cycle introduced by RS-22. It should be settled in their blueprints.
