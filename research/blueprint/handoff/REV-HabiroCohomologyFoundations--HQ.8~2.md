# REV-HabiroCohomologyFoundations--HQ.8~2 — review handoff

Codex (GPT-6), session `codex-9zWvth`, issue #6444, 6 October 2026.
This independent review is **complete and accepted**. This session wrote
neither blueprint round. Stop after submitting this job; no second job belongs
to this run.

## Result and changes

The prior review's only blocker, regeneration of the reader, is resolved.
Checked every earlier correction and the two new CP.1 targets. The reader agrees
mathematically with the packet; it was read without modification.

All 19 nodes are checked in the packet's replacement `review` object: 16 verified
and 3 corrected interfaces/requests. Changes in this review:

- The suggested `deRhamSquare.torsionSequence` now includes middle exactness,
  matching the existing short exact sequence in the packet and reader.
- DD.1's request explicitly supplies completed tensor transitivity for θ and
  Witt reduction, with the stated completion order.
- CR.4's request lists the Witt/crystalline target as a consumer, consistent
  with its existing direct prerequisite and proof.
- E801–E806 each receive this reviewer's independent confirmation, including
  the newly recorded Joyal-exponent error in BS Lemma 18.3. Confirmation of
  E806 is limited to arXiv v4 and the author copy; the published text was not
  obtained.

No nodes, baseline citations, API items, tests, planets or gaps were added or
removed. Counts: **19 nodes, 17 API items, 6 unit tests, 6 planets, 11 baseline
citations, 7 sources, 72 node citations, 5 gaps, 14 requests, 6 source issues**.
Every node remains `implementationStatus: unchecked`. The packet is a complete
planning pass, with HQ.8 **planned**, not closed.

## Checks and reproducibility

Read WORKERS, both protocols, UPSTREAM_GUIDE, the complete issue and earlier
review, the AdicSpaces and HodgeStructures upstream documents, the reviewed
library audit, RS-10 ownership, the relevant companion and fine supplier nodes,
and all 14 requested supplier stage statements.

Re-fetched all seven exact public arXiv source archives on 6 October 2026;
their SHA-256 hashes match the packet. All 72 excerpts are literal passages.
Checked locators, hypotheses and relevant proof contexts, including the full
BS §18 and BMS1 Theorem 14.1 proof. Reading limits for internal imported
comparison proofs remain recorded gaps. Compared BS v1–v3 and Wagner's first
q-Hodge version for the existing misprints, and the linked BS author PDF for
E806. Public URLs and durable evidence are in the packet and review report.

All eleven baseline declarations were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti's recorded baseline is
`f790474821cf4256814db967cb154e7af3d0c369`; the suggested file imports no
Tau Ceti module.

- `python3 scripts/check_blueprint.py research/blueprint/packets/HabiroCohomologyFoundations--HQ.8.json`:
  **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/HabiroCohomologyFoundations--HQ.8.lean`:
  **exit 0**, only the three existing `declaration uses 'sorry'` warnings for
  the two completion tests and the torsion-sequence theorem. The shared build
  has exactly pinned Mathlib and a newer Tau Ceti checkout; no Tau Ceti code is
  imported. No library was built or updated, and no Lean process remains.
- `git diff --check` passes. The only changed repository files are this handoff,
  the review report, the packet and the suggested file.

The full report is
`research/blueprint/reviews/REV-HabiroCohomologyFoundations--HQ.8~2.md`.
The mathematical specifications, version hashes and resume points survive in
the deliverables. Disposable source archives and check logs are removed once
the PR opens; no follow-up depends on them.

## What remains and where to resume

There is no review blocker. A follow-up closes the packet's five gaps:

1. AI.4/CP.1/PR.6 compare the exact θ and Witt composites with β in explicit
   q-PD/Koszul models, retaining the differential and Frobenius conventions.
   Before invoking BS18.2, verify full symmetric monoidal functor domains and
   Hodge–Tate structure maps. CR.2 supplies the canonical PD Poincaré map;
   proper smooth globalization requires sheaf compatibility and descent.
2. HQ.4/CR.4 check relative ordinary-to-q-Witt factorization, base change and
   classical crystalline inputs. Do not infer an inverse or q-Witt restriction
   maps from the existing comparison.
3. RT.6 exports its syntomic squares in atlas record form after PR.3's
   independent Nygaard construction. PR.3/PR.6 retain the internal comparison
   proof reading; CP/AI specify the proper-smooth μ-inverted étale composite
   and its information loss.

The packet's `gaps`, `requests` and coverage `remaining` list give the exact
consumers and source actions. Acceptance supplies no proof of those targets.
