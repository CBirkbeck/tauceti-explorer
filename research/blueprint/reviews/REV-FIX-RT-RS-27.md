# REV-FIX-RT-RS-27

**Verdict: accepted after corrections.** Issue [#5554](https://github.com/CBirkbeck/tauceti-explorer/issues/5554). Reviewer: Codex, session `codex-rtOQ9t`, 2 October 2026. Reviewed Claude Code session `cc-c2c06b`'s `FIX-RT-RS-27`, submitted in [#5573](https://github.com/CBirkbeck/tauceti-explorer/pull/5573), against base `3b72f74`.

This review follows `REV-RS-27` and the independent verification in `RT-RS-27.review.json`. **Independence disclosure:** this session wrote the original `RT-RS-27` report (#5312); `codex-J6LwjP` independently verified it (#5320). This session did not write the fixes reviewed here. #5554 explicitly requires independence from `FIX-RT-RS-27`, which was claimed and submitted by `cc-c2c06b`. Acceptance concerns these fixes and their ownership/forwarding contracts, not a new independent verification of this session's original findings or a completed blueprint.

## Scope checked

Read all four finding records, including their evidence and proposed fixes, all four verifier reasons, the full fixes report, all nine current layer decisions, all 38 links and all 27 pre-review owner records. Read the earlier `REV-RS-27` report and its recorded corrections; its review object is retained in the proposal's new `reviewHistory`.

Read the affected AM R09.3–R09.6/A0-extension contracts, the AbelianSchemes A0–A4 and A6 boundaries, PEL M1/M2/M6, generalised-elliptic R13.1/R13.2/R13.4a, Hilbert H1 and the C3 packet's actual coherent-descent request. Checked SF.1 and D0 against their documents and the accepted RS-25/RS-05 contracts. Fresh anchor reading was limited to the relevant Modular curves 0E–0G, 1E, 4A, 7B–7D blocks and Stable reduction Layer 2. This is not a fresh full-cover review of both long anchor documents or all receiving blueprints.

Read the actual Mathlib definitions at `082e2d37e8b0463410cdb532e111cd43d5a66174`, rather than the advanced shared working checkout. Tau Ceti's baseline remains `f790474821cf4256814db967cb154e7af3d0c369`. The changed R09.3/R09.4/R09.6 reviewed library-coverage entries were checked. No new exhaustive library-absence claim is made.

## Findings

### RT-RS-27/1 — accepted, with the coherent setting clarified

R09.3 now explicitly owns the effective fpqc descent equivalence for quasi-coherent modules on schemes, including full faithfulness, effectivity and pullback/base-change/tensor coherence. The source is [Stacks 023T](https://stacks.math.columbia.edu/tag/023T), freshly read on 2 October 2026. It applies to an fpqc covering of an arbitrary scheme; this general module statement needs no Noetherian hypothesis. It is distinct from representing a sheaf of sets as an algebraic space.

At the pin, `comonadicExtendScalars` in `Mathlib/Algebra/Category/ModuleCat/Descent.lean:59` takes a faithfully flat ring homomorphism of commutative rings and produces `ComonadicLeftAdjoint (extendScalars f)`. The file explicitly leaves the effective-descent corollary for the module pseudofunctor as a TODO. The fix correctly uses comonadicity as an affine input, not the completed scheme/algebraic-space theorem.

C3 still requests effective coherent descent through étale presentations for proper algebraic spaces. Its proper-GAGA nodes concern proper complex schemes locally of finite type, and hence the locally Noetherian setting. I made that hypothesis explicit in the coherent algebraic-space clause of `R09.3.keeps`; the unrestricted quasi-coherent fpqc theorem is retained separately. The finite-type, finitely presented, coherent and finite-locally-free subclasses still require the hypotheses of their individual results, with no claim that arbitrary base change preserves every coherent object.

The module-descent owner is R09.3, with the already existing R09.3 → C3 forwarding edge. SF.1's accepted contract does not explicitly export this module equivalence. The anchor imports retain their own scheme/object classes; neither is substituted for general module descent.

### RT-RS-27/2 — accepted after one residual producer obligation was repaired

The fix correctly removes specific generalised-elliptic and polarized-abelian moduli constructions from the upstream general criteria:

| Application | Owner after its objects |
|---|---|
| Generalised-elliptic stack algebraicity and auxiliary level | ModularCurvesPartII R13.2, after R13.1 |
| Generalised-elliptic coarse spaces | ModularCurvesPartII R13.4a |
| Descent/stack condition for full PEL data | PELModuli M1, after abelian schemes, polarizations and torsion |
| PEL algebraicity, Artin-hypothesis verification and auxiliary-level rigidification | PELModuli M2 |
| PEL coarse spaces at non-rigidifying level | PELModuli M6 |
| Hilbert–Blumenthal representability verification | HilbertModularVarietiesAndShimuraCurves H1 |

The verifier's correction is retained: abelian schemes are A1, polarizations A2, torsion/pairings A3 and deformation A4; PEL level data and rigidification are M1/M2. R09.4/R09.5 keep the conditional general criteria and the existing elliptic-anchor comparisons. A0-extension no longer owns verification in every PEL application. The downstream coarse-space and auxiliary-level owner records are explicit forwarding contracts; M6/R13.2's future blueprints must state those applications fully.

**Correction in this review.** The fix report acknowledged that R09.3 still promised descent of polarizations of abelian schemes before those objects and their duals exist. I resolved it using the same object-before-application boundary. R09.3 retains general descent of projective schemes equipped with a relatively ample invertible sheaf and the general scheme/module/morphism descent interface. A new owner record assigns the abelian-specific application to **A2**, using its relative dual and base-change laws after A1. A polarization morphism `A → A∨` is distinguished from a globally chosen ample line bundle. M1 continues to own descent of full PEL data.

The existing R09.3 → A0 → A2 path carries the general input. No backward A2 → R09.3 edge is introduced. A6 receives A2's earlier abelian-specific results and R09.3's general Weil-restriction theorem; it does not import the later M1 to obtain them. The retained Weil restriction is an algebraic space under the finite-locally-free hypothesis ([Stacks 05YF](https://stacks.math.columbia.edu/tag/05YF)), with the functor/sheaf-level base-change identity of [05YC](https://stacks.math.columbia.edu/tag/05YC). Scheme representability and preservation of properness remain separate claims.

Graph negative controls reproduce cycles for R13.1 → R09.4, A1 → R09.4 and A2 → R09.3. Those imports are absent from the proposal.

### RT-RS-27/3 — accepted

A0-extension is the single owner of the selected Artin representability criterion, with limit preservation, representable diagonal, deformation and obstruction theory, openness of versality and algebraisation. R09.6 imports it as a conditional theorem and retains its versal/completed-local-ring comparisons. A0-extension is in `suppliedBy`, and its explicit forward link to R09.6 is present and acyclic.

The two preserved formal-geometry edges are **AdicSpacesPartII F0 → R09.6 and R3 → R09.6**. This is the direction in the current graph and the fourth repair link's explanation. The fixes report's phrase “AdicSpacesPartII F0 and R3 imports of R09.6” reverses that direction if read literally. No reverse import was added or inferred here. Modular curves 7B/7D supply their elliptic deformation comparisons, not the general Artin criterion. There is no whole-layer R09.6 → A0-extension back edge or mutual import.

### RT-RS-27/4 — accepted, with stale ownership prose corrected

The current proposal imports general algebraic-space/diagonal/atlas foundations from **SchemeAndStackFoundations SF.1**, matching accepted RS-25, and ordinary site-level prestack/stackification/groupoid constructions from **DiamondsAndVStacks D0**, matching accepted RS-05. The three explicit imports SF.1 → R09.3, SF.1 → R09.4 and D0 → R09.4 land in the assembled graph, jointly with the Artin import, without a cycle.

At the pin, `CategoryTheory.Pseudofunctor.IsStack` in `Mathlib/CategoryTheory/Sites/Descent/IsStack.lean:49` extends `IsPrestack` with essential surjectivity on covering sieves. `isEquivalence_toDescentData` exposes the resulting equivalence. The proposed missing stackification and algebraicity statements extend this carrier; the fix does not invent a replacement stack definition.

R09.3 keeps its module descent, additional quotient comparisons, general polarized-projective-object descent and algebraic-space Weil restriction on the imported carrier. R09.4 keeps arithmetic instances, algebraic-stack properties, conditional criteria and the elliptic comparison. I corrected the stale sentence in R09.3's `reason` that still said it kept “the general algebraic-space theory,” and the corresponding old forwarding explanation for MC 1E → R09.4. Their statements now agree with `keeps` and the owner records. SF.1 and D0 themselves are unchanged.

## Other correction and preservation

The roadmap reason said seven layers were narrowed; the proposal actually narrows eight (R09.1–R09.6, R09.7a and A0-extension) and keeps R09.7. Corrected the count.

All nine action decisions and their `suppliedBy` arrays, all 38 edge endpoints and all 27 pre-review owner records are unchanged. One A2 owner record was appended, giving **28 owners**. The earlier independent review, including its three forwarding corrections, is preserved verbatim in `reviewHistory`; the current `review` names `independent-review-REV-FIX-RT-RS-27`. No Tau Ceti layer or roadmap is changed, no upstream-to-upstream link is added and no atlas file is edited or promoted by this worker.

## Checks

- `scripts/check_restructure.py research/blueprint/restructure/RS-27.result.json`: **ok** after corrections.
- Read-only fresh `build.assemble(require_distances=False)` produced **2,956 stage records and 8,634 edges**. Overlaying RS-27 adds the four repair links: **8,638 edges**, acyclic over **2,581 edge-endpoint vertices**. Isolated stage records are not counted as edge endpoints.
- The union with every currently proposed restructuring/link edge remains acyclic: **8,882 edges, 2,650 endpoint vertices**. This structural check does not accept the other proposals' mathematics.
- All application owners are reachable from their general suppliers. R09.3 → C3 and the existing R09.3 → A0 → A2 forwarding are present; F0/R3 → R09.6 are preserved. Three synthetic backward-import controls each close the expected cycle.
- The only skipped RS-27 links are the existing MC 0G → MordellLawrenceVenkatesh LV.3/LV.7 links, whose stages are absent from the assembled atlas. They remain explicit deferred links, not claimed as installed.
- Preservation and deliverable-path checks, intake validation and `git diff --check` passed. No packet, suggested Lean file or link-map file is a deliverable of this review; their checkers are not substituted for the restructuring checker.
- No Lean compilation, library build, cache download or language server was run. There is no Lean deliverable.

Public Stacks 023T, 05YC and 05YF were opened at their stable URLs on 2 October 2026. Remaining theorem-specific hypotheses, source-proof decomposition and application proofs belong to the receiving blueprints. The earlier report's opposite R09.6 → A0-extension suggestion is superseded by the accepted forward import; it must not be restored.
