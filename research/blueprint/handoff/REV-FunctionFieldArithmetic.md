# REV-FunctionFieldArithmetic handoff

Codex session `codex-JiJULy`; issue [#409](https://github.com/CBirkbeck/tauceti-explorer/issues/409); branch `codex-JiJULy-review-function-field-arithmetic`; 11 October 2026. **The independent review is complete, verdict needs_changes. This is not a checkpoint.** The reviewed blueprint was written by the different session `codex-Mp7Yro` for #732.

## Done

Read and checked all 48 targets, 28 final pinned baseline declarations, 16 public source versions, API/tests, planets, all 29 supplier requests, the reviewed library audit, current read-only upstream/native inventory and four handed confirmed ownership findings. Corrected the packet and suggested file, with 26 nodes verified and 22 corrected. No node was added. All five source findings are independently confirmed. The detailed [review report](../reviews/REV-FunctionFieldArithmetic.md) and packet retain the corrections, exact public URLs, versions, hashes, source locators and audit conclusions.

Final inventory: 48 nodes; 64 API entries; 63 tests; 175 proposed Lean names; 28 baseline receipts; 31 planets; 29 requests; **5 gaps**. All eight stages remain planned, all implementations unchecked. The additional gap is TORSION-DETERMINANT. The other four boundaries are unchanged in substance.

Checks: packet checker **0 errors, 0 warnings**; suggested file elaborates with `lean-check` at the pinned baseline, **exit 0 with only `sorry` warnings**; temporary declaration checks resolved all 175 proposed and 28 baseline names, and were removed. Independent finite-field enumeration reproduces the elliptic and ASW counts/polynomials specified in the report. No source copy, source passage, temporary Lean inventory or local machine path is needed by the next worker.

## Reader synchronization required before acceptance

The definitive `research/blueprint/readmes/FunctionFieldArithmetic.md` is outside #409's deliverables and was not edited. Its false pairing and invalid conductor group still contradict the corrected packet. Queue an authorized reader-sync revision and use the packet as the corrected specification. Search anchors and approximate input lines:

- Baseline table near line 42 and FA.6 direct inputs near 984: replace `mathlib:AlgHom.convGroup` with `tauceti:TauCeti.AlgHom.instGroup`. The native module is `TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean`; arbitrary commutative value algebras need no bialgebra structure. Use the packet's corrected reductive-group module receipt and Laurent-series comparison wording where listed.
- Schmid–Witt statement near 638: fixed n≥1 pairs Q_n with F×/(F×)^(p^n), not the whole pro-p completion. Retain the uniformizer^p control and distinguish infinite-length topologies. Near 649 use Kosters–Wan Theorem 3.4 p.8, Remark 4.1 pp.14–15, Proposition 4.2 p.15, Theorem 4.7 pp.18–19.
- Ray-character certificate near 1346: U_v^(0)=O_v×; for r≥1 use 1+P_v^r. Degree one is valuation +1 and Yu −1. Preserve the separate finite degree quotient and constant character.
- Torsion trace inputs near 913 and request near 1484: EDC.8 is only the registered import receipt for the actual TraceFormula owner. Remove DWP.1 here, add TORSION-DETERMINANT, and retain the finite-coefficient counterexample in the proof boundary. No characteristic-zero lift is assumed.
- Semisimple determination near 957 and weights request near 1494–1500: use DWP.0, only for the characteristic-zero Brauer–Nesbitt enhancement; remove torsion-trace from that request's consumers.
- Yoshida locator near 627: replace “Corollary 5.16(iv)” by §5.3(iv), pp.425–428; Theorem 6.15 pp.432–433. Remove duplicated SR.4 prerequisite near 1098.
- Synchronize the other corrected individual source receipts and compound citations; the packet's per-node review records all 22 corrected nodes. Keep FYZ degree/measure/rank conventions, finite constants, coefficient flatness and all five named boundaries. The reader's four ownership summaries already have the right direction.

## Maintainer-only supplier and routing follow-up

The packet records upstream TraceFormula [PR #196](https://github.com/TauCetiProject/TauCetiRoadmap/pull/196), checked head `4bd72379658126cbe9be935656396f0c9dac4de0`. Its finite-coefficient trace/perfect determinants are reused, but Layers 14–15 supply the sheaf L-function determinant theorem for characteristic-zero adic coefficients. Forward `request-torsion-trace` for the finite coefficient-field Euler-product determinant enhancement. Do not construct ordinary trace again in EDC.8. The atlas currently lacks registered layer IDs for this upstream PR, hence the explicit EDC.8 import receipt plus upstream note.

The existing ownership follow-ups remain: FF.3 supplies general counts; GS geometry points to ET.2b and FA arithmetic to ET.3; the Bhargava–Shankar–Taniguchi degree-one route and AUDIT-01 point to FA.5; ES7 imports FA arithmetic and AA.0 topology while retaining its own spectral/trace targets. No target was moved to a higher roadmap or duplicated, and no upstream, reader, routing or other worker's file was changed here.

Resume with the authorized reader-sync revision, then independent acceptance checking. Do not redo this review or treat explicit proof/Lean boundaries as implemented results. All useful findings survive in repository deliverables; nothing requires this session's scratch directory.
