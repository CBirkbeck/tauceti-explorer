# REV-AdelicAlgebraicGroups~2 — completed

Issue #6985; Claude session `claude-lIANgp`; branch `claude-lIANgp-rev-adelic-r2`; 8 October 2026. This independent review of BP-AdelicAlgebraicGroups~2 is complete, not a checkpoint.

**Verdict: accepted.** All 262 input nodes were reviewed; two were added, giving 264. Verdicts: 119 verified, 143 corrected, 2 added, none unverifiable. Every round-1 correction is made, and the reduction-theory cycles are gone. The corrections made here:
- the vacuous boilerplate hypotheses and acceptance checks of the round-2 nodes;
- the strong-approximation proof, rerouted through Kneser–Tits at isotropic places plus weak approximation (RT-AREA-automorphic-1/7);
- a false step in the real Siegel covering, and Orr's reduction to a ℚ-split torus;
- left/right conventions in the closed-orbit estimates;
- locators, prerequisites, hypotheses and non-discriminating tests.

A new gap records real reduction theory for reductive and disconnected groups. A dangling AF.1 request that would close a stage cycle is removed. Source issues E1–E11 are confirmed, and E12 (Arthur §5, p. 25, the sign of the Haar factor) is added.

**Validation:**
- `check_blueprint.py` (with the pinned index): 0 errors, 0 warnings.
- `lean-check` of the suggested file with the pinned Tau Ceti f790474 closure inlined in scratch (103 modules): 0 errors and no warnings other than "declaration uses `sorry`" in the suggested part. The 9 merge-artefact errors are inside inlined Tau Ceti proofs.
- All 19 source hashes match the packet.
- The reader was regenerated from the corrected packet.

**Open items for the orchestrator** (details in `research/blueprint/reviews/REV-AdelicAlgebraicGroups~2.md`):
- ShimuraData:D5 still plans its own neatness nodes, which AA.4 owns;
- three AA.4 lemmas are now off the strong-approximation path and could be dropped later;
- E11's `known` field.

No further work is required on this review; nothing the next worker needs is left in scratch. This run claimed one job only.
