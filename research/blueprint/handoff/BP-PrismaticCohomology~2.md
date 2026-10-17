# BP-PrismaticCohomology~2 — blocked checkpoint

Issue #10119; Codex, session codex-Y4fDUa; 2026-10-17. Claim confirmed by the swarm bot on claim comment 6232005651. This is an unfinished revision checkpoint, not a completed blueprint or an independent review. No second job was claimed.

The required whole-roadmap serialization conflicts with the checker and the issue's file scope. The blocking condition is reproducible and needs an orchestrator decision; another worker with the same four-file scope cannot resolve it. The packet remains `partial`, with all nine stages partial. Its old `review` object records the previous seven-node version's needs-changes verdict; `revisionCheckpoint.reviewBoundary` identifies that boundary explicitly.

## Blocker and reproduction

WORKERS.md, “Doing the work”, says: **“Edit only the files the issue names, plus your own scratch space.”** Issue #10119 names only the top packet, reader, suggested file and this handoff. The retained PR.0 and PR.8 packets and the checker are outside that scope.

The previous review requires serializing the retained 290 + 79 nodes in the top packet, preserving their IDs, together with the seven earlier additional nodes (and now the new envelope target). `scripts/check_blueprint.py` builds its world from the retained part packets before the top packet. Its `check` function rejects any node whose ID is already owned by another blueprint file of this roadmap. A minimal scratch reproduction concatenated the two parts' `nodes` arrays with the original top array and ran the unmodified checker on a scratch file named `PrismaticCohomology.json`:

- 282 duplicate-ID errors against `PrismaticCohomology--PR.0.json`;
- 79 duplicate-ID errors against `PrismaticCohomology--PR.8.json`;
- total **361**. Eight other retained IDs resolve first to integrated decomposition nodes and escape that particular check.

For example: `node PrismaticCohomology:PR.0/delta-addition-correction also appears in PrismaticCohomology--PR.0.json`.

This is separate from the metadata-merging work: unioning baseline declarations and sources does not remove those 361 errors. The importer does not expand `imports`, while `merge_blueprints` does already merge serialized nodes by ID, allowing a later top packet to supersede promoted part versions. Renaming the retained targets would instead duplicate mathematical notions and lose canonical identities. No checker context was altered, no IDs were renamed, and no out-of-scope file was edited.

**Required decision:** arrange an explicit assembly/part lifecycle in the checker and promotion workflow, or authorize archiving the superseded research part packets with their historical review/provenance retained in the top packet. Submission checks reject file deletions and intake checks enforce each job's deliverables, so merely permitting a `git rm` is insufficient; update the job/tooling scope or use an authorized non-deleting archive representation. No such scope extension was received before this checkpoint. The retained promoted data must not be edited by the worker.

## Work saved

Added `PR.0/general-prismatic-envelope`, for a **bounded orientable** base prism and arbitrary delta-pair kernel. It states the prism-valued universal property and supplies five API entries, four tests, exact consumers and source locators. It has no additional planet; the inherited six-per-layer choices are untouched. General existence is kept distinct from complete flatness and bounded output, which require the regular-envelope hypotheses.

The source construction uses delta-adjunction of divided generators, universal torsion removal in delta-rings and iterated derived completion. A single quotient/completion is insufficient. The transfinite realization, smallness and terminal discreteness remain an explicit proof gap; the notes themselves label their argument a sketch. This checkpoint does not promote that sketch to a completed proof.

Freshly read:

- Bhatt, *Lecture V: The prismatic site*, §1 p.1 and Lemma 5.1 with proof sketch p.6. The author PDF fixes a bounded orientable base.
- Koshikawa, *Logarithmic prismatic cohomology I*, arXiv:2007.14037v3, Propositions 3.1–3.2 p.13, footnote 8 pp.13–14, Propositions 3.6–3.7 with their setup and proofs p.15. Proposition 3.1 states the stronger orientable-base range; Proposition 3.2 adds regular-kernel hypotheses; associated log prisms require bounded envelopes.

Public URLs, SHA-256 hashes and this exact reading scope are in the top packet and reader references. No PDF, source passage or excerpt field is committed. Current TauCetiRoadmap and Tau Ceti were read only; the prismatic-envelope target was not found there. The reviewed AUDIT-38 prismatic entries and integrated library coverage were checked: ordinary completion, Witt vectors and divided powers are inputs, not general prismatic envelopes.

R6 rows 5 and 31 now identify this bounded-base candidate precisely. The retained prelog-envelope statement permits an unbounded orientable base, which is a separate range obligation; the A_inf-based initial-prism construction has a bounded base but still needs its QRSP regular-presentation argument for the regular-envelope comparison. No retained part prerequisites or supplier requests have been withdrawn. The reader and suggested-file omissions list match these boundaries.

## Continuation after the scope decision

1. Consolidate both parts and the top nodes into one effective graph, preserving all 369 inherited IDs, 54 planet records, baseline/source metadata, 91 sourceIssue verdicts, gaps and exact requests. Preserve historical reviews separately; do not claim a new reading of all inherited sources. Remove every excerpt field from the assembled packet.
2. Reconcile the general-envelope transfinite proof and unbounded-base range, and the QRSP regular-presentation reduction. The new bounded-base target is a precise starting point, not closure of all log-envelope consumers.
3. Complete or precisely delimit formal QCoh: bounded prism completion equivalence, completed scalar change/colimits and formal pushforward. BL §3.3 uses complete modules; BL Corollary 3.2.9 makes charts flat under transversality, not for every bounded prism.
4. Reconcile framed q-consumers: topology, quotient completeness, A_inf (p,ξ) versus (p,q−1), infinite-coordinate summability and extra-direction naturality. Retain the QW.6 request until the actual consumer range is covered. Finite pointwise operators alone do not solve infinite convergence.
5. Apply only justified R1–R7 changes to effective node prerequisites, requests and reader. Retain trace-square, syntomic/derived-de-Rham and Fargues–Fontaine classification/GAGA/construction-matching gaps. AdicSpaces supplies only its stated adic-curve construction. Do not use higher/out-of-order roadmaps as silently available proofs.
6. Run the checker and Lean; submit a complete pass only when the effective artifact satisfies the review. This checkpoint does not change atlas data or complete the job.

## Validation of the saved checkpoint

- `python3 scripts/check_blueprint.py research/blueprint/packets/PrismaticCohomology.json`: **0 errors, 0 warnings**; 8 nodes, 39 API items, 20 tests, 8 gaps, 8 requests, no stage claimed planned/closed.
- `lean-check research/blueprint/suggested/PrismaticCohomology.lean`: **exit 0**, 22 warnings, all uses of `sorry`; no other warning/error. Memory was checked first (96 GiB available). The added envelope stays in the README because its carriers are absent at the pins; Lean changes are documentation only.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/PrismaticCohomology.lean`: pass. The file has 256 lines.
- `git diff --check`: pass. Only this issue's four deliverables are changed.

The scratch directory is disposable and is removed after opening the PR. Everything needed to reproduce the blocker, reacquire the sources and continue is recorded here or in the packet; no scratch file is required.
