# Completed independent package review

Job: `REV-PKG-ClassicalSerreModularity~2`, issue #7922. Agent: Codex (GPT-6), session `codex-EV6NdF`. Branch: `codex-EV6NdF-review-serre-package`. Date: 2026-10-09.

The package is **accepted** after a source-faithful correction. All six issue checks pass. This is a completed review, not a checkpoint. The earlier missing APIs, incomplete tests, omitted signatures and replacement newform carrier have been resolved by the revision and independently checked here.

## Work completed

- Read all 81 accepted target nodes, the complete reader and Lean file, the prior review, revision handoff, scoped library audit and relevant supplier contracts. Independently checked all 38 API entries and 32 labelled examples against active Lean commands and mathematical statements.
- Corrected `classical_auxiliary_characteristic` to require `s.HasWeight 2`. KW I Theorem 5.1(2), p. 9, supplies a weight-two system even when the starting residual Serre weight exceeds two; §8.4, p. 17, uses that system. The README and source note now make this distinction explicit.
- Wrote the independent report and replaced review.json with `accepted`, reviewer `independent-review-REV-PKG-ClassicalSerreModularity~2`.
- Read current upstream roadmaps and library sources without building there. The upstream audit ended at `618e0b30d21791d6a492ce88ba8602745697b21a`; the current Tau Ceti checkout was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No duplicate target or owner transfer was introduced.
- Compared delicate statements with public primary versions of Khare, KW I, Böckle, BM, Savitt, DP, Rosser–Schoenfeld, Ribet, BCDT, KW Annals and Serre. The report records editions, locators, source receipts and access limits. No private book was needed and no source passage was copied into a deliverable.

## Checks and durable receipts

- Final `lean-check research/blueprint/packages/ClassicalSerreModularity/Suggested.lean`: exit 0; zero errors; 234 warnings, all `declaration uses sorry`; no other warnings. The file imports the pinned Tau Ceti Newform structure.
- Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
- Final Suggested.lean SHA-256: `d63b4718fb7e80936c0abb940c3df6890cc381deb97a8805b1c2afcaea9fc03e`.
- All three accepted input packets pass `scripts/check_blueprint.py` with zero errors and zero warnings. All 81 targets have distinct README entries; all 38 API entries and 32 test labels have the required content.
- Independent finite auxiliary-prime computation: all 2,422 prime rows pass, including 251 → 263 and 21,589 → 21,599. The report distinguishes this review computation from a formal proof.
- README: 177,526 bytes. Metadata: exactly `topic = "math.NT"` and a newline. Package process-language and bookkeeping-reference checks pass. Submission file validation and `git diff --check` pass.

## Remaining work and resumption

No work remains for this job after submission. The report and package are the durable result; compiler logs, public PDFs, extracted texts and the worklist are disposable scratch and are removed after the PR opens. Nothing a subsequent worker needs depends on them.

Two inherited obligations retain their owners: the imaginary-quadratic ordinary lifting extension in OrdinaryAutomorphicFormsAndModularityLifting R21.5, and the globalisation independence examination in GL2ModularityLifting R32.6. The accepted package explicitly states those requirements; this review neither edits those roadmaps nor certifies their conclusions. General irregular systems remain owned by ML.1. The maintainer's normal package intake is the next step, with no second job claimed in this run.
