# Handoff — REV-IntegralIwasawaTheory--L1

Codex, session `codex-GTfSbx`, 19 October 2026. Issue #10784. **Complete independent review; accepted after correction.** Input author: Claude `claude-r4P7El`, #10925.

Deliverables are the review report, corrected L1 packet/reader and this note. The suggested Lean file was checked and is unchanged. No parent packet, atlas data, upstream roadmap or library was edited.

The packet has 27 targets, including the new dyadic relative-to-full μ theorem, four definitions, 27 API entries, 19 tests, fourteen baseline declarations and ten supplier requests. Four layers remain planned; none is claimed implemented or closed. Both former L4 source gaps have sourced resolutions. The report explains the cutoff, cycle, twist, Coleman-coordinate, Greither-module, ramified-content, conductor and dyadic-dual corrections.

Assembly must apply `refinementEdges` with the explicit `removeInputs` and `replaceAllPrerequisites` semantics before checking cycles. In particular remove the Bernoulli-obstruction/digit prerequisites of Ferrero–Washington before deriving the legacy obstruction from it. `inheritedTargets.newNodes` lists relevant refinements only; adding every such item as a prerequisite reintroduces cycles. The reader carries the replacement proofs. Apply the two L4 planet replacements; resulting planet counts are 4/5/2/6 for L1/L2/L3/L4.

Two supplier details require attention when those owners are assembled:

- **I.6** must expose the exact ordinary relative class-number formula, with Hasse index at most 2, roots-of-unity factor and wide class norm convention. Its current modified-class equality up to a power of 2 does not determine the dyadic valuation. The packet has a precise request, sources and consumer. Washington 1978 §2 p. 88 and Ferrero 1978 §1.1 p. 10 supply the formula; keep this with I.6 rather than creating another owner.
- **I.2/L1** still records the real-sign limitation for dyadic versions of the RJW sequences. The odd-prime sequences are planned as stated. The dyadic Ferrero–Washington proof uses the separate norm-kernel/rank route and does not assume an exact minus projector.

The exact all-prime principal residue imports `DirichletPadicLFunctions:L3/rjw2-principal-residue`. Existing generic compact-module, procyclic and completed-group-algebra work stays imported. Current PMIA main checked at `c785fa3b983754f0dbcc49492d92fd770e3adba6`; the library baseline remains Mathlib `082e2d3` / Tau Ceti `f790474`. See the packet for source versions, hashes and all locators. Public scans were read in place; no source text is needed from scratch. E94 was independently confirmed.

Validation: packet checker 0 errors/0 warnings; assembled dependency traversal 2,095 exact nodes and no cycles; all new-node statements/proof steps/API/tests present in reader; final planet limits and minimum definition tests checked; `git diff --check` passes. `lean-check` returned 0 with thirteen sorry-only warnings for the unchanged 118-line suggested file. No build or language server ran. Scratch source downloads and temporary scripts are disposable after submission; this note and the review preserve the needed results.

No second job was taken. Resume with the normal parent assembly and supplier coordination, not another review of the original defects.
