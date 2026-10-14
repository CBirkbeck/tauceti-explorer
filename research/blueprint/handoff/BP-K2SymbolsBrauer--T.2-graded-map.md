# Handoff: BP-K2SymbolsBrauer--T.2-graded-map

Issue **#9309**; **Codex — codex-XACoi9**; 14 October 2026.
Branch: `codex-XACoi9-k2-graded-map`. This is a completed target-level planning
pass, ready for independent review, not a checkpoint or a formalization.

## Deliverables and scope

Only `K2SymbolsBrauer:T.2:graded-map` is in scope. The packet is **complete**
and that stage is **planned**. The parent packet is unchanged. It already
contains the graded construction and its degree-three component; this pass
imports both by id instead of redeclaring them. The one new node is a
**comparison**, `K2SymbolsBrauer:T.2/graded-map-degree-two-identification`,
promoting the existing degree-two API statement to an explicit map equality.

The `importedTargets` entries record the expanded contracts for the reused
nodes: **11 API items and 8 unit tests** for the existing construction, plus
the ordered degree-three export. These are refinements of existing targets,
not new construction nodes. The checker counts the one local comparison;
it therefore reports zero local definition/construction API items or tests.
The reader document carries all these contracts, proofs, hypotheses, locators
and worked checks. There are **12 baseline declaration citations** and no new
planets; the existing **Milnor to Quillen graded map** planet is retained.

## What is established and what remains

Every scoped target has a precise statement and a prerequisite chain terminating
in inspected libraries, existing target nodes, supplier requests or the four
recorded proof boundaries. The source-reading part of the parent's
`G-product-symbol` is resolved: Weibel IV.1.10–1.10.1 and Loday's actual
Proposition 2.2.3 proof were read. The result specifies the product on unit
classes and exposes the connecting-map inverse in Loday's convention.
Reading this proof does not establish a comparison with the K.7 packet's
actual biexact product model.

The stage is not closed. Its exact boundaries are:

1. **G-graded-quotient, inherited:** T.2:symbols owns the homogeneous Steinberg
   quotient, degree decomposition, graded universal property and field-map
   action. The pinned tensor and ring quotient interfaces supply ungraded
   extension/descent, not that whole interface.
2. **G-Matsumoto, inherited:** the imported Matsumoto node leaves the converse
   normal-form/presentation proof open. This pass uses that node without
   reconstructing its field-symbol theory. Its unread proof source is not a
   new source-reading gap about the graded map.
3. **G-cover-Hurewicz, inherited:** T.1's chosen natural classical-to-Quillen
   K₂ equivalence needs the natural BE-plus cover and oriented Hurewicz
   interface. A precise request goes to **StableHomotopyKTheory H.3**.
4. **G-product-symbol, refined:** **GeneralAlgebraicKTheory K.7** must compare
   its actual tensor pairing with the plus-model product, compute the unit
   symbol, and match the sign to the chosen T.1 comparison. Its existing
   abstract pairing node does not state that equality.

There are **two requests**, to K.7 and H.3, recorded in the packet rather than
posted as separate issues. Their statements specify the natural maps and
orientation. The test at t=0 on the classical preimage of
\(\Phi_2\{2,t\}\) in \(\mathbb Q(t)\) gives 2 under this roadmap's tame
convention; negating the comparison or reversing the product gives 1/2.
The test is external to construction and introduces no incoming T.3 edge.
Independent review must verify these source/model contracts and the retained
boundaries. The following assembly should keep the existing target ids and
use the continuation's reader/API refinements; it must not silently erase the
parent's gaps merely because this planning pass is complete.

## Confirmed finding RT-AREA-ktheory-2/20

**Handled.** The only producer of the degree-three map is the imported
`K2SymbolsBrauer:T.2/graded-map-degree-three`. An outgoing stage link exports
it to **K3BlochGroups V.2**, with the ordered triple-symbol formula.
V.2 retains the actual decomposable image, indecomposable cokernel, quotient
maps, exactness and injectivity. It is not a prerequisite of the graded
construction. The current K3BlochGroups parent packet already imports this
stage in its degree-three node; no other packet or atlas data is edited.

## Baseline and duplication audit

Read the reviewed **AUDIT-29 / REV-AUDIT-29** entry in
`data/library-coverage.json`: the graded map is not built, and V.2's map is
the degree-three specialization of this owner's construction. Inspected the
pinned TensorAlgebra and RingQuot declarations and the existing finite-vector-
space `SplitK0.finrankEquiv`/`finrankEquiv_of` statements. No tensor algebra
universal property or finite-dimensional Grothendieck-group computation is
planned anew.

Also searched the current read-only Tau Ceti library and current upstream
roadmap Lean sources, including the roadmaps absent from the atlas snapshot.
Read the current AlgebraicTopology and SemisimpleAlgebras reader documents
for style and interfaces. No existing Milnor ring, higher Quillen product map
or duplicate target was found. The current-library inspection is recorded
separately from the pinned baseline; none of its newer results is treated as
available at the pins. Screened the link files mentioning this roadmap and
read the scoped stage edges; none supplies the missing product comparison.

## Sources and source correction

- **Weibel, author-hosted combined K-book draft, 29 August 2013**, checksum
  `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.
  Read III.5.12–5.12.2, III.6.1 and 6.3, III.7.1, IV.1.7–1.8,
  IV.1.10–1.10.1, Exercises IV.1.8–1.9 and 1.12, and VI.4.3.2,
  VI.5.2.1 and 5.3 at the locators recorded in the packet. The degree-three
  arithmetic/injectivity statements serve external checks, not proof inputs.
- **Loday, published 1976 paper**, NUMDAM scan, DOI 10.24033/asens.1312,
  checksum `e1b3377fc93ba9b41456b8ace9e7d50d80e930e74dd92b6d23bd3f7bde78264e`.
  Read §2.1 and §2.2 through the proof of Proposition 2.2.3, including the
  rendered printed p.337 to verify the inverse in the product formula.

No source passage is copied into the deliverables. No restricted book copy
was obtained or used. The imported Matsumoto proof remains with its existing
owner; no reading of Milnor's book is claimed. No additional source needed
to state the graded-map target is unavailable.

Source finding **E-tensor-product-rank** records the m+n/mn rank misprint in
Weibel's combined author draft, III.5.12 and 5.12.1, printed p.227 / PDF p.235,
verified on the rendered page. It is scoped to that version, not asserted
against the published book. The linked author errata URL returned HTTP 404
on both hostnames; no accessible matching correction was established.
The correction affects no intended result. A reviewer should verify the
version-scoped finding and retain the corrected product-rank matrices.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/K2SymbolsBrauer--T.2-graded-map.json`:
  **0 errors, 0 warnings**.
- `python3 research/blueprint/intake.py check-files` on the four deliverables:
  **4 files, 0 problems**.
- `lean-check research/blueprint/suggested/K2SymbolsBrauer--T.2-graded-map.lean`:
  **elaborated at Mathlib 082e2d3 / Tau Ceti f790474**, exit 0, with only
  six expected `declaration uses sorry` warnings. Available memory was over
  100 GB before checking. No builds, updates, cache downloads or language
  servers were started.

The suggested file follows the fixed streamlined shape: no data definitions,
no invented K-theory carriers, two statable baseline milestones and four
examples. The full Milnor/Quillen API and arithmetic checks are README targets
because their carriers are absent at the pins. The generic ungraded descent
statement is not a substitute for the missing graded or higher K-theory
comparison.
