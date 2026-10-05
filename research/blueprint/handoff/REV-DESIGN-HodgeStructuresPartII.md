# Review checkpoint handoff — REV-DESIGN-HodgeStructuresPartII

Issue #3548. Codex session `codex-BjAqvx`, 2026-10-05.
Continuation of the `codex-tUuT7s` checkpoint merged in PR #6156.

This submission is a checkpoint, not a finished review. The packet deliberately
has no top-level `review` object. Its existing planning `status: complete`
describes the author's budgeted planning pass, not independent acceptance.
Do not promote it from this checkpoint. Version-specific source-issue verdicts
are not a whole-packet review.

## Saved work

- The review report records this session's 65-node inspection, mathematical
  checks and boundaries, every correction, 107 new native statement receipts,
  source versions and the remaining review. The predecessor report is kept
  below it as clearly labelled historical evidence.
- This session inspected indices 47–111, from `H.0/determinant-coordinate`
  through `H.0/affine-ordered-iterate-base-change-one-zero-iff`. Together with
  the predecessor's 47 nodes, the inspected prefix contains 112 of 569 nodes.
  These are conditional checks, not final verified verdicts.
- The packet now records 122 independently inspected baseline statements:
  15 by the predecessor and 107 by this session. `LinearMap.mul'` is the one
  newly cited entry, increasing the total to 280. None was removed.
- Replaced the tautological ordered-iterate chart test with an actual change
  θ→2θ over Q, f=3 id and u=2 id, preserving horizontality and nonzero iterates.
- Strengthened the characteristic-two symmetric-projection node's actual
  suggested theorem to a concrete integrable field on the monomial basis of
  F₂[x,y]/(x²,y²), nonzero ordered square, zero symmetric image and exact bound
  3. Added concrete fixture definitions, the direct native multiplication and
  square/iterate prerequisites, and the corresponding proof step. Proofs are
  still admitted plans. No generic carrier or declaration node was added.
- Corrected nine test-kind metadata values, including selected tests outside
  the inspected prefix, and nine Heuer Remark 4.2 page locators. Metadata edits
  at indices 148, 268 and 305 do not imply those nodes were fully reviewed.
- Retrieved published EG20 bytes with the exact expected hash and confirmed
  its inherited p.108 notation finding. The earlier HTTP 403 record is now
  explicitly historical. Added and independently confirmed the missing e_i
  index in published Heuer Remark 4.9 and arXiv v3, with a bounded correction
  search. The previous confirmed Stacks historical finding is preserved.
- The reserved node `HodgeStructuresPartII:key/higgs-parameter-connections`
  still occurs once. Its arbitrary differential-site generality, predecessor
  finite-local-rank correction, sample API/tests and planet are preserved.
  No declaration nodes were added/deleted, and all remain unchecked.

## Resume here

1. Read the current report and its archived predecessor before any verdict.
   Resume at array index **112** (the 113th node),
   `HodgeStructuresPartII:H.0/affine-tensor-power-base-change`. There are
   **457 remaining nodes**, ending at
   `HodgeStructuresPartII:H.0/dual-three-step--triple-flat-iff`.
   The node order is unchanged. Read all statements, hypotheses, proof steps,
   prerequisite supplier statements, sources, APIs, tests and actual suggested
   signatures. Several prefix API entries refer to these later suppliers;
   their existence or historical proof receipt does not finish this review.
2. Audit the **158 baseline entries** without an `independentCheck.by` equal
   to `REV-DESIGN-HodgeStructuresPartII`. The 122 existing receipts identify
   their session and exact pin. Reading a declaration for the inspected
   prefix does not certify every uninspected consumer that cites it.
3. Resolve **CR.1 generality**: its comparison concerns suitable crystalline
   lifts and quasi-nilpotent connections; the requested carrier is ordinary
   integrable connections on an arbitrary specified differential site.
   Find an exact general supplier or reconcile ownership/scope. Preserve the
   reserved key's generality; do not add crystalline quasi-nilpotence to it.
4. Resolve **E1 global interfaces**: actual underived tensor/exterior/dual,
   restrictions, equality detection and effective descent declarations are
   still needed. The suggested file's 35-node global omission ledger remains.
   Affine prototypes do not discharge it. Preserve all supplier requests.
5. Resolve **finite Rees**: DD.1's broad Rees wording does not verify the exact
   finite split module-sheaf contract, local freeness and both fibers. Read a
   primary construction and exact supplier. LZ Theorem 2.1/Remark 1.10 do not
   support the two Rees nodes; the prior gap remains open.
6. Complete the new-roadmap definition and layer/supplier/duplication review,
   routed-source inventory, unvisited source records, cross-packet statements,
   remaining API/tests and planet checks. Parent Hodge L0–L3 and relevant E1/D3
   reviewed audit rows were read for ownership; this was not a fresh proof
   audit of their implementation. H.0 remains partial; H.1–H.8 remain not_read.
   Honest remaining stage lists are allowed by section 0 and are not by
   themselves grounds to reject a completed budgeted planning pass.
7. All three current source findings have version-specific verdicts. Their
   evidence scopes differ: EG published p.108, Heuer published p.301 plus v3,
   and the predecessor's already-fixed historical Stacks patch. Do not turn
   these into whole-source or whole-packet acceptance. The packet records the
   exact bounded correction search for the new Heuer finding.
8. The issue does not list the reader document as editable. An authorized
   assembly/follow-up must synchronize both checkpoints' corrections with
   `research/blueprint/readmes/HodgeStructuresPartII.md`. It was not edited.
9. Add a top-level final `review` object only after completing the whole
   review, with justified per-node verdicts and every baseline confirmed.
   Do not infer proofs from successful elaboration of admitted statements.

## Validation receipt

`python3 scripts/check_blueprint.py research/blueprint/packets/HodgeStructuresPartII.json`
passes with **0 errors, 0 warnings**. Counts: 569 nodes, 540 API entries,
491 tests, six planets, 280 baseline entries, five requests and 13 gaps.
Every node retains `implementationStatus: unchecked`.

The exact full edited suggested file was elaborated with `lean-check` in the
existing shared build at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`: **exit 0, no errors, 948 warnings,
all `declaration uses sorry`**. Final Lean SHA-256:
`96c8174ef8f9ebbe6511d8810f4d796910a9373e8e6e8c9bf712ce685f4acea1`.
It imports only Mathlib, so no Tau Ceti code is loaded. The two Tau Ceti
augmentation statements were read at source pin
`f790474821cf4256814db967cb154e7af3d0c369` instead. No language server,
library build, project setup or cache download was started; the compile
finished. Native fixture bodies elaborate, while the theorem bodies remain
admitted plans. No formalisation or global sheaf closure is claimed.

The incoming base was `bc9f347fa6f5969919e5f0294eb19ab1512594b4`. Incoming packet
SHA-256: `a7214b7d83f265b211c8ad880cf0d6857be4ac00effacfdfde3ed01abd9c203f`;
incoming Lean SHA-256:
`d277c7cfbb26062a1c72834b95983d8b7477c52a6cf294e36de71d4b958764bf`.

All required public source URLs, exact hashes, mathematical evidence and
resume boundaries are in the report and packet. Nothing needed by the next
worker depends on disposable scratch, which is deleted after submission.
