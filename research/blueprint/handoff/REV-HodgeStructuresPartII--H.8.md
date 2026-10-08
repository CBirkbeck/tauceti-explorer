# Handoff: REV-HodgeStructuresPartII--H.8

Completed independent review of [issue #7065](https://github.com/CBirkbeck/tauceti-explorer/issues/7065), by Claude, session `claude-0sqSw0`, on 8 October 2026. Input: `BP-HodgeStructuresPartII--H.8`, issue #6947, pull request #7357, written by another worker (Codex, session `codex-0rtX9j`). This is a finished review, not a checkpoint.

## What is done

The [review report](../reviews/REV-HodgeStructuresPartII--H.8.md) accepts the plan and gives a verdict for each of the 31 nodes (11 verified, 20 corrected, none added), for the three source issues and for the 25 baseline declarations. The [packet](../packets/HodgeStructuresPartII--H.8.json), [reader](../readmes/HodgeStructuresPartII--H.8.md) and [suggested file](../suggested/HodgeStructuresPartII--H.8.lean) agree on 31 nodes, 32 API items, 26 tests and six planets. Every implementation status is unchecked, and no node id changed.

The corrections that change mathematics or dependencies, all described in the report:

- `vanishing-real-green` takes an ambient class and applies the criterion to its vanishing component, as the source's proof needs (new source issue E-H8-3).
- `real-green-open-cone` holds for every admissible neighbourhood and keeps the transported class twisted-invariant.
- `griffiths-derivative` is a complex statement; `voisin-kernel-cone` now depends on it.
- The request to `ComplexComparisonPartII:C1` no longer asks for the Hodge decomposition; that engine is an open gap of H.2 and is named in G1.
- `normal-boundary-factorization` names its connecting map and no longer cites the Lefschetz (1,1) register.
- `orthogonal-constant-splitting` rests on a Mathlib theorem for a nondegenerate restriction; `vanishing-rank-criterion` no longer depends on a global node.
- `affine-cw-bound` cites Tau Ceti's existing Morse declarations and the upstream Morse homology lane; only the handle theorem stays in G3.
- The real Lefschetz (1,1) request to MC.7 is stated exactly and names the catalogue items already routed there.
- Locators in Benoist 2018, Benoist 2019 and the Voisin preprint.

## Checks and limits

- `python3 scripts/check_blueprint.py research/blueprint/packets/HodgeStructuresPartII--H.8.json`, with and without the pinned declaration index: 0 errors, 0 warnings.
- `python3 research/blueprint/intake.py check-files` on the five files: 0 problems.
- Names: every suggested declaration, API item and test of the packet occurs in the suggested file and in the reader.
- Lean: the suggested file imports two Tau Ceti Hodge modules, and the shared build at the pins has no compiled `TauCeti.Geometry`, so `lean-check` on the file stops at its first import. Two substitutes were run with `lean-check` at the pinned Mathlib. The Mathlib-only part of the file, with the file's own Mathlib imports, elaborates with proof placeholders as its only warnings. The whole body, placed after a scratch prelude that restates the pinned signatures of the nine Tau Ceti declarations it uses or rests on, also elaborates with proof placeholders as its only warnings. The second run found and fixed one ill-typed test. The file as it stands in the repository has not been elaborated as a whole. No build, cache fetch or language server was started.
- Sources: the five PDFs of the plan were downloaded again and match the recorded hashes; Benoist–Wittenberg (arXiv:1801.00872) was added for one statement. The reading boundaries are in the report. The estimates of §2 of the Voisin preprint were not rechecked line by line (gap G4), and the published Voisin chapter was not obtained.
- Nothing in scratch is needed by a later worker.

## What remains and where to resume

No review work remains. Later work starts from the packet's five gaps and eleven requests:

1. **G1.** Global typing of the common variation (ShimuraData:D3, H.2, H.3), and the cohomological Hodge-decomposition engine, which no atlas stage states (H.2 records the same gap).
2. **G2.** Coherent deformation, normal and extension comparisons from SF.2, SF.4, SF.5.
3. **G3.** The fixed-set theorem for a finite group of diffeomorphisms and the handle-to-CW theorem for a proper Morse function (the proposed Geometric topology Part II, or the upstream Morse lane for the second), and the adapters from a smooth complex variety to an oriented manifold.
4. **G4.** The general inputs of Voisin's proof, and a collation of the preprint with the published chapter.
5. **G5.** A node of MotivesAndAlgebraicCycles:MC.7 for the real Lefschetz (1,1) theorem.

When those suppliers exist, replace the ledger at the end of the suggested file by typed statements and elaborate the whole file at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The report ends with five questions for the orchestrator.
