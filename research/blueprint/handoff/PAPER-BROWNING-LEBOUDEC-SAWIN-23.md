# Handoff: PAPER-BROWNING-LEBOUDEC-SAWIN-23

Issue #1095; Codex session `codex-a71f92`; 22 September 2026. **Partial checkpoint; not ready for complete status.**

## Done

Read the full 66-page arXiv:2006.02356v1, all proofs and references. Recorded provenance, 122 items (5 library/4 planned/113 missing), exact-once routing, selected proof dependencies, definition APIs/regressions and thirteen unreviewed source findings. Read relevant GN/ST/RP audits/stages and pinned Lean declarations. Read specified portions of Poonen–Voloch, Le Boudec and Barroero–Widmer. Ran the self-contained Python certificate embedded in the report; no Lean file or compiled proof.

## Resume in this order

1. Acquire the 89-page published/revised paper and reconcile every item and E1–E13. The author pages currently link the preprint; the published proof has not been read. Check this before treating any preprint finding as an error in print.
2. Close G2: derive the Euclidean-ball local density from the Poonen–Voloch input, with real shape measure and uniform sieve tail. Do not replace this by norm equivalence.
3. Acquire original Banaszczyk, Schmidt, Davenport, Broberg–Salberger, Browning–Matthiesen, Bhargava and Serre inputs; finish the portions of Le Boudec/Poonen–Voloch/Barroero–Widmer not yet read. Insert each required theorem as its own fully stated item, including the cubic-surface positivity branch.
4. Resolve G4/G8/G9 uniformity and diagonal-cutoff checks. The O_R band-count constant is not established by simply quoting a family-dependent theorem. Audit quartic-threefold dyadic boxes and low coefficient cutoffs.
5. Expand unnamed and composite constructions (G7) and finish the complete dependency/API/testing closure (G10). The numbered-result inventory is not all definitions. Supply original-source support for the singular-only null-set repair (G6).
6. Independently verify E1–E13, including the exact corrected statements and downstream use; the extracting worker has not supplied an independent-review verdict. Do not contact authors without maintainer action.
7. Refresh atlas ownership before design: source routes GN.0/GN.4/ST.0/ST.2/ST.5/RP.2, planned imports GN.1/RP.2/GlobalQuadraticForms Layer 5, and the proposed Heights Part II. Do not duplicate basic lattice carriers or the separate random-fibration route.

## Reproducibility

The report embeds the complete finite arithmetic certificate and its expected output. Main/input PDF URLs and SHA-256 values are in the JSON/report. Item locators use v1 pagination only. Suggested Lean path is a future design target, not a delivered file.

Run from repository root:

```sh
python3 scripts/check_paper.py research/blueprint/papers/PAPER-BROWNING-LEBOUDEC-SAWIN-23.result.json
python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-BROWNING-LEBOUDEC-SAWIN-23.result.json research/blueprint/papers/PAPER-BROWNING-LEBOUDEC-SAWIN-23.md research/blueprint/handoff/PAPER-BROWNING-LEBOUDEC-SAWIN-23.md
```

Keep partial until every blocking gap is resolved. No manual issue closure, merge or relabel is part of this handoff.

Validation at submission: paper schema and three-file intake checks passed; exact-once routing, unique ids, definition API/test presence and the selected acyclic dependencies were checked. The report's Python certificate passed. Lean not compiled.
