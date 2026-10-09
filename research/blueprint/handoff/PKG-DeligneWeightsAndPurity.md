# PKG-DeligneWeightsAndPurity — completed package

Issue: [#7463](https://github.com/CBirkbeck/tauceti-explorer/issues/7463). Agent: Codex (GPT-6), session `codex-1F3p6q`. Date: 2026-10-09.

The package is complete for independent review. It adds the [roadmap README](../packages/DeligneWeightsAndPurity/README.md), [Suggested.lean](../packages/DeligneWeightsAndPurity/Suggested.lean) and [metadata](../packages/DeligneWeightsAndPurity/metadata.toml). Only these files and this handoff change. The input packets, assembled reader, assembled suggested file and atlas data are unchanged.

## Inputs and traceability

The mathematical source of truth is the current accepted [DWP.0 packet](../packets/DeligneWeightsAndPurity--DWP.0.json), reviewed by `independent-review-REV-DeligneWeightsAndPurity--DWP.0~2` on 2026-10-08, and the accepted [DWP.7 packet](../packets/DeligneWeightsAndPurity--DWP.7.json), reviewed by `independent-review-REV-DeligneWeightsAndPurity--DWP.7` on 2026-10-06. The earlier assembly handoff records an older DWP.0 review state; that historical state does not replace the current accepted verdict. The [assembled reader](../readmes/DeligneWeightsAndPurity.md) and [assembled Lean file](../suggested/DeligneWeightsAndPurity.lean) were also inspected.

The package follows PROTOCOL §20 and UPSTREAM_GUIDE. The upstream HodgeStructures and JacobianChallenge READMEs were read in full for their mathematical target/API style. The README has 199,179 UTF-8 bytes, below even a decimal 200 KB limit. It contains all 135 targets, 177 API items and 94 definition tests, with the full namespaces stated once in the introduction. Source locators retain theorem, section and page references. Direct prerequisites resolve through numbered target links, 41 pinned library declarations and 69 exact external declaration/layer identifiers. All 45 supplier contracts retain their consuming target links.

Target order within each layer is the order of the current accepted packets. The following ranges give a stable mapping without requiring a separate manifest:

| Layer | README sections | Targets |
| --- | --- | --- |
| DWP.0 | 0.1–0.18 | 18 |
| DWP.1 | 1.1–1.9 | 9 |
| DWP.2 | 2.1–2.11 | 11 |
| DWP.3 | 3.1–3.11 | 11 |
| DWP.4 | 4.1–4.3 | 3 |
| DWP.5 | 5.1–5.19 | 19 |
| DWP.6 | 6.1–6.5 | 5 |
| DWP.7 | 7.1–7.15 | 15 |
| DWP.8 | 8.1–8.24 | 24 |
| DWP.9 | 9.1–9.13 | 13 |
| DWP.10 | 10.1–10.7 | 7 |

The introductory dependency explanation distinguishes the DWP.5 coefficient prefix from its later local/analytic branch, so reading the numerical layer order does not introduce a DWP.2↔DWP.5 cycle. It also preserves the separate smooth-projective and sharp curve-coefficient purity arguments, absolute versus relative Lefschetz ownership, and the specific Jacobian, modular-family, compact-measure and normal-scheme curve-reduction Part II imports.

## Validation

- `lean-check research/blueprint/packages/DeligneWeightsAndPurity/Suggested.lean` exited successfully: **0 errors, 122 warnings, all declaration uses `sorry`, and no other warnings**. Available memory was above 20 GB before the single compile. No compiler or language server was left running.
- The Lean declaration body, after removing comments, imports and whitespace, equals the assembled input declaration body. The file has one standard header and one block of 33 distinct Mathlib imports. It imports only Mathlib; the cited Tau Ceti Clifford theorem is an inspected proof supplier, not an imported implementation.
- `python3 scripts/check_blueprint.py research/blueprint/packets/DeligneWeightsAndPurity--DWP.0.json`: **0 errors, 0 warnings**, with 83 targets, 81 API items, 44 tests, 28 requests and the two already recorded gaps.
- `python3 scripts/check_blueprint.py research/blueprint/packets/DeligneWeightsAndPurity--DWP.7.json`: **0 errors, 0 warnings**, with 52 targets, 96 API items, 50 tests and 17 requests.
- Structural comparison checked every target section, every API/test name in its own target, every source locator, the library/external input indexes, unique anchors and all local fragment links. Metadata parses as the single line `topic = "math.AG"`. The README contains no programme-process records or private paths.
- `git diff --cached --check` passed. The staged path set is exactly the four issue deliverables, on the session branch, with no unstaged tracked edits.
- The reviewed DWP library audit and the statements of all 41 distinct baseline declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

All eight cited public source files were checked against the source hashes in the accepted packets. Selected mathematical source passages were inspected rather than treating the existing assembly as a source audit: Weil I §§1, 3, 6–7; Weil II §§2.2, 3.2–3.5, 4.1 and 6.2; Milne II.1.1–1.3 and III.9.6; Yu Proposition 6.1.1 and its proof; Deligne (1968) 1.5–1.6; Bergström–Faber–Payne Proposition 4.2; and the public SGA 7 XXI 5.2.1–5.2.2 proof. These checks support the target formulations; this package job does not replace the independent target-level reviews. No source files or verbatim source passages are included in the repository.

The README retains the already accepted corrections to the compact norm-character weight sign, the Sato–Tate density and point-count sign, and the normal-crossings orientation line. It keeps the Newton-couple normalization `v(q)=1`, the Tate/shift conventions, arithmetic model witnesses, and both support bounds for complex hard Lefschetz. No new mistake requiring a packet amendment was identified.

## Formalization limits and where to resume

Elaboration verifies the supplied signatures and numerical cores; it does not prove the `sorry` targets or construct the unavailable geometric objects. The two recorded DWP.0 obligations remain visible: extending a complex isomorphism over a prescribed base embedding needs an algebra-compatible extension theorem, and the geometric/analytic signatures require actual supplier carriers. A bare ring equivalence does not discharge the first obligation.

The suggested file therefore preserves the input's named documentary inventories for schemes, constructible adic and Weil coefficient categories, closed stalks, compact-support cohomology, vanishing cycles and algebraic-by-discrete monodromy/compact comparison. Such entries are not claimed as elaborated geometric signatures. No arbitrary proposition parameter or fabricated cohomology field replaces a missing carrier. The numerical Frobenius-module, valuation, subgroup and graded-linear-algebra signatures are the representative Lean forms that elaborate.

There is no package work left for a successor to finish. Independent package review should compare the numbered ranges above with the two current accepted packets and rerun `lean-check` on the package file. Later formalization must discharge the explicit imported interfaces in their owning roadmaps and the prescribed-base extension obligation; those tasks are not certified complete by this package.
