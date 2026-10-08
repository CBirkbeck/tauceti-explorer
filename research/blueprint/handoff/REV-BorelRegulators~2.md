# Handoff: REV-BorelRegulators~2

**Issue:** #7028 · **Agent:** Codex · **Session:** `codex-2cuTvQ` · **Date:** 2026-10-08 · **Status:** finished independent review, accepted.

The four issue deliverables are complete: the [review report](../reviews/REV-BorelRegulators~2.md), [packet](../packets/BorelRegulators.json), [reader](../readmes/BorelRegulators.md) and [suggested file](../suggested/BorelRegulators.lean). This is an acceptance of a complete target-level planning pass, with seven planned stages and every implementation unchecked. It is not a checkpoint. I did none of the plan or revision being reviewed.

All 56 nodes were reviewed: 41 verified and 15 corrected, none added or unverifiable. All 37 pinned baseline citations are confirmed and retained. The packet has 106 API items and 59 tests on definitions/constructions (111/64 including the rank theorem), 32 planets, 17 requests and eight explicit gaps. All eight assigned confirmed red-team findings and the previous review’s corrections are accounted for in the report. E1/E2/E3 have this review’s confirmed verdicts; the Weibel findings remain limited to the public author PDFs.

Corrections concern right arithmetic modules/opposite-ring notation, distinct building edges and torsion-free test scope, the split central quotient in GL duality, the open real subgroup for van Est and component descent, a directly defined SL Hopf product, the missing lifted-cover/deck-action contract, positive real cutoffs and inverted Siegel coordinates, the Bott pairing, cyclotomic irreducibility prerequisites, compact-dual coordinates, the Bloch–Wigner scalar and the E2 localization argument. The reader and mathematical signature register agree with all packet statements, hypotheses, proof steps, acceptance criteria, APIs and tests. Three tests were added; no node or baseline citation was added or removed.

Validation:

- Packet checker: zero errors and warnings.
- Source-issue and source-version validators: no errors; all twelve public PDF hashes match the packet.
- `lean-check research/blueprint/suggested/BorelRegulators.lean`: exit zero at the pinned Mathlib, 97 expected `sorry` warnings and no other diagnostics. Subsequent edits affect mathematical comments only. Unavailable higher arithmetic carriers remain commented signatures; no placeholder carrier is introduced.
- All-node reader/register synchronization and internal DAG checks pass; all declarations remain unchecked and all stages remain planned. `git diff --check` is clean.

The follow-up work is already in the packet: route H.3’s lifted universal-cover/deck-action request and Chebotarev Layer 7’s auxiliary-prime/full-degree import, plus the refined AA/ALS/AF/RT interfaces. Determine the exact Bloch–Wigner real scalar, including its Tate π conversion, before consumers use it; rationality in the chosen coordinates is not asserted. Read and decompose the remaining Matsushima/Kaneyuki–Nagano, Weil and Bloch inputs when permitted copies become available. The six existing structure proposals retain the R.5/R.6 split and the early/late M.8 distinction. No files outside this job’s deliverables were edited; no atlas promotion was performed.

The report, packet and handoff contain everything needed by the next worker. Temporary papers, extracted text and local scripts are disposable and are not handoff dependencies. This run claims no second job.
