# Handoff: REV-FunctionFieldArithmeticPartII--GC.3

Completed independent review of issue #8947 by Codex, session `codex-EAU44Z`,
18 October 2026. This is a completed review, not a checkpoint. The packet is
accepted after in-place corrections; its complete planning pass leaves GC.3
planned with four explicit gaps. All thirteen nodes and twenty-five pinned
baseline declarations were checked. No new node was added. The report records
every correction and all five confirmed source findings.

## Assembly instructions

1. Apply the prerequisite edits in the packet's `restructure` entry to its
   twelve imported parent GC.3 targets. Retire EXTERIOR-COMP as a planning gap;
   replace GC.3 consumers of ST-LISSE/ST-OPS with the narrower recorded gaps.
2. Reuse current Tau Ceti's tensor/exterior comparison in
   `TauCeti/LinearAlgebra/ExteriorPower/Basic.lean` (commit `a91d3aa`,
   lines 170–247). The antisymmetrization node now plans only its compatibility
   with the Koszul action. Private light models in the suggested file are for
   the older atlas pins, not requests to implement duplicate maps.
3. Reuse current ordinary transfer and `groupCohomology.natCard_nsmul_eq_zero`
   in `TauCeti/RepresentationTheory/Homological/GroupCohomology/Corestriction.lean`
   (same commit, lines 153–169 and 430–445). Only invertible-order vanishing is
   additional here. ProfiniteCohomology Layer 3 compares degrees 0–2 and is not
   an all-degree comparison input.
4. Route GC3-STACK-PI1, GC3-COARSE-STALKS and GC3-STACK-PUSHFORWARD to the
   proposed stacks Part II of EtaleDualityAndPerverseSheaves. Merge the first
   with GC.4's lisse-adapter request. The representation dictionary is for
   normal stacks and local systems over finite coefficient extensions.
5. Both stack-operation inputs must include invariance under nilpotent
   thickenings. The full fibres may be nonreduced; residual-gerbe calculations
   concern their reductions. EGC3-5 carries forward the parent's E2 finding.
6. Integrate the actual scheme supplier EtaleCohomologyFoundations, including
   the geometric curve bound, finite coefficient-field extension and
   Frobenius compatibility. Do not replace the stack gaps by quasi-coherent
   exactness or a scheme proper-base-change theorem.
7. The monodromy construction and its multiplicativity avoid stack pushforward.
   The comparison with the parent's pushforward definition remains a target
   depending on GC3-STACK-PUSHFORWARD. Its fibrewise adjunction map is explicitly
   identified. Missing geometric Lean carriers remain GC3-LEAN-CARRIERS.

No review work remains before submission. No changes were made to parent
packets, audit data, upstream roadmaps or the library. The updated packet,
reader, suggested Lean file and independent report are the deliverables.

## Checks

- Packet checker: zero errors, zero warnings.
- Source-issue and source-version validators: no errors for all five findings.
- `lean-check research/blueprint/suggested/FunctionFieldArithmeticPartII--GC.3.lean`:
  exit 0, twenty-five warnings, all for admitted proofs, at Mathlib `082e2d3`
  and Tau Ceti `f790474`. No background compile remains.
- Intake file validation: five files, zero problems. Admitted-data check and
  `git diff --check`: clean.

The sources and upstream commits are recorded in the packet and review report.
No source text or scratch artifact is needed for resumption; scratch can be
deleted after the pull request opens. This run claims no second job.
