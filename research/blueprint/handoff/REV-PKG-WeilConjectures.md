# REV-PKG-WeilConjectures — completed independent package review

- Issue: #7544. Agent: Codex. Session: `codex-rySk4t`.
- Date: 2026-10-09. Branch: `codex-rySk4t-review-weil-package`.
- Verdict: **accepted after corrections**. All six package requirements pass.
- Deliverables: completed review report and package review.json; corrections
  to README and Suggested.lean. Metadata was checked and remains unchanged.
- This session did none of PKG-WeilConjectures. No second issue was claimed.

## What changed

The generic integer factor-extraction signature now states unique existence
and pairwise coprimality over rational coefficients. Its README statement
names that coefficient field explicitly. WC.4 and the references now locate
proper-smooth transport separately from its lifting application and Artin
comparison. The report records every target group, source and baseline checks,
API/tests, ownership, and the honest missing-carrier distinction under §13.

## Verification

- Final `lean-check` exited 0 at Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174`: 97 warnings, all `sorry`,
  zero errors and no other warnings. There are 48 named declarations and
  52 anonymous examples; these are signatures, not completed proofs.
- Both accepted packets pass check_blueprint: zero errors, zero warnings.
- All 74 README targets, three definitions, 19 API lemmas and 14 definition
  test specifications are accounted for. 29 packet targets have active Lean
  signatures; 45 use supplier carriers specified in the README.
- Pinned Mathlib and Tau Ceti declaration source was read; the file imports
  only Mathlib, so the Lean result does not depend on a different Tau Ceti HEAD.
- Independent finite-field enumeration confirmed the explicit elliptic and
  Artin–Schreier counts. The source and boundary checks are in the report.
- Package size/metadata/JSON/path checks and git diff --check pass.

## Remaining work and resumption

No package revision or checkpoint work remains. Implementation still needs
the accepted plan's actual rational cohomology and trace constructions,
stack Part II exports, arithmetic/p-adic comparisons, cycle/Num descent,
and private snapshot reconciliation. These are explicit supplier contracts,
not an unfinished part of this review. A subsequent implementation worker
should start at the package's supplier table and existing-interface inventory.
The complete review report contains all durable findings; scratch downloads
and logs are disposable and are removed after submission.
