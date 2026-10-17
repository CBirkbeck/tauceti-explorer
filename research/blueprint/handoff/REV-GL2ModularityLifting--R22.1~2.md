# REV-GL2ModularityLifting--R22.1~2 handoff

Issue #10112; Claude session `claude-gcGM8R`, 17 October 2026. The independent review is complete: the revision `BP-GL2ModularityLifting--R22.1~2` (Codex `codex-qkZIrl`, PR #10148) is **accepted with corrections**, with all eleven stages `planned` and none `closed`. This is not a checkpoint. The report is `research/blueprint/reviews/REV-GL2ModularityLifting--R22.1~2.md`; the packet's `review.checked` gives a verdict for every node examined and for every retired node.

## What changed

- Ten nodes that restated accepted lower-tier owners are retired (`retiredDraftNodes`): KW II §8 and Definition 7.9 go to SerreWeightAndLevelOptimisation R20.6 (TauCetiRoadmap PR #1013 §§6.6–6.11), Lemma 7.10 and CHT Lemma 4.1.1 to ArithmeticGaloisDuality R02.6/R02.4, and KW II Corollary 7.5 with its Hensel root to HilbertModularVarietiesAndShimuraCurves R18.3/tw-localised-control. Their GL2 consumers now cite the owners.
- `theorem-8-2-minimal-modular-lifts` and `quadratic-cyclotomic-irreducibility` stay, as comparisons, because other packets cite them.
- The R22.3 patching nodes, component patching, dyadic faithfulness and full-support modularity now cite the DeformationAndDerivedPatchingAlgebra R03.4–R03.6 Kisin nodes.
- All placeholder hypotheses, acceptance lines, title-copy matches and generic `uses` are replaced from the sources; 69 older stub matches are rewritten as well.
- Locators corrected (CDT, Kisin FM); E12–E18 confirmed; requests and gaps pruned and retargeted; coverage `remaining` lists the higher-tier requests not yet answered here.
- The reader is re-rendered from the packet and escaped for the site renderer (432 spurious emphasis spans before, none after). The suggested file keeps only `pStar` and the oddness bridge.

## For the next jobs

1. **PotentialModularityAndCompatibleSystems R23.1** should redirect `cht-character-extension` to ArithmeticGaloisDuality R02.4/grunwald-wang and `cht-soluble-prescribed-completions` to GL2ModularityLifting R22.1/cht-soluble-prescribed-completions. It should answer its KW II Theorem 8.2 request with SerreWeightAndLevelOptimisation R20.6/kw-minimal-modular-lifts.
2. **Open consumer requests to this roadmap**, recorded in coverage:
   - Böckle's integral comparison (R24.3 → R22.3);
   - minimal integral R = T over F (ClassicalSerreModularity R26.1 → R22.4);
   - Snowden 4.4.2 (R23.1 → R22.5);
   - the BCGP Proposition 10.1.3 odd-prime potentially Barsotti–Tate theorem (ModularityAndLanglandsExtensions → R22.5).

   The package job should answer them or say where they belong.
3. **Upstream note** (packet `upstreamNotes`): ArithmeticGaloisDuality §R02.6.2 (PR #858) states KW II Lemma 7.10 for one place; KW II and SerreWeightAndLevelOptimisation §6.6 need a finite set of places.
4. HeegnerPointEulerSystems HE.0's request note should name SerreWeightAndLevelOptimisation R20.6/quaternionic-level-raising instead of the retired GL2 node.
5. HilbertModularVarietiesAndShimuraCurves R18.6 has no planned node. Seven GL2 nodes reach it through request 1, whose content is expected from R18.3.
6. R32.1/R32.2 still cite the outside-the-94 roadmaps PadicLocalLanglandsForGL2Qp R30.6 and CompletedCohomologyAndLocalGlobalCompatibility R31.5/R31.6; their placement is for the maintainer.

## Checks

The checker with the pinned index reports 0 errors and 0 warnings. `lean-check` exits 0 with two proof-placeholder warnings, and the `run_cmd` audit finds no `sorry` in any statement. An in-memory atlas merge skips no link. All 17 source hashes match the packet, and the eight baseline declarations were read at the pins. Scratch files (source texts, scripts) are disposable; nothing else is needed to continue.
