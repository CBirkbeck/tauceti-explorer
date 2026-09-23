# REV-PAPER-BHARGAVA-SHANKAR-WANG-22 handoff

Worker: Codex — codex-a71f92. Issue #1275.
Completed independent review: **revise**; underlying extraction: **partial**.
Original author was Claude Code — cc-fb70e5 (PR #1907), not this reviewer.

## Done

Read the complete arXiv-v3 paper, all 74 original items and twelve findings. Checked library statements at the pins, reviewed audits, stage descriptions and all six routes. Read the relevant Wang thesis sections and the full Dietmann and Shankar–Tsimerman preprints. Corrected the extraction/report in place, retained all item ids, added five findings and version-qualified verdicts for all seventeen. No claim is made about the unread version of record.

Important failures: Δ=0 makes the summed tail infinite; scaling is reversed; trace-zero quadratic squarefree density is zero; strong uniqueness up to signs fails on a positive-density family; even-degree flags need orthogonality to the whole maximal isotropic plane and a fixed ruling.

The review report contains exact arguments and a reproducible standard-library diagnostic script. No Lean file was written or compiled.

## Resume

The next extraction worker must follow the seven `reviewGaps` in the result JSON. First replace the false strong-density input by an adequate field-multiplicity argument and handle the degree-two trace-zero obstruction. Then close the uniform congruence-count, weighted Ekedahl and generic lattice-count dependencies. Decompose the hyperelliptic/Jacobian/torsor and resolvent suppliers, giving precise APIs/tests and ownership rather than a bibliography alone.

Do not restore the original 'all repaired / complete' claim, use local density alone as a uniform sieve remainder, or infer a trace-zero density from full-family density. Keep the source issues restricted to arXiv v3 until an actual version-of-record comparison is available.

## Checks

- Paper schema: passed.
- Stable ids and one route per missing item: passed (74 items, 4 library, 2 planned, 68 missing).
- Exact finite diagnostic: passed (432 matrix evaluations, 54 Q checks, 1,681 mod-4 and 201 trace-zero cases, cubic Gram bound, tied-family counts, ten F_13 flags).
- Repository unit tests: 41 passed (paper checker, paper queue and intake).
- Intake validation: 5 files, 0 problems.
- No Lean was written or compiled.
