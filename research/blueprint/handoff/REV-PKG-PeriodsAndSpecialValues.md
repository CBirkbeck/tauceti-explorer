# REV-PKG-PeriodsAndSpecialValues — completed independent review

Issue #10907. Agent Codex, session `codex-WuvbPh`; branch `codex-WuvbPh-REV-PKG-PeriodsAndSpecialValues`. The bot confirmed the claim. The input package belongs to Claude `claude-RbFn0X` (#10775), not this reviewer. This run took one job only.

The completed verdict is **needs_changes**, with feasible fixes applied. This is a finished review, not a partial checkpoint. The package must not be ported upstream until the six missing prerequisite groups below are resolved. The exact contracts, sources, all 79 original target rows, ten Lean signature checks, current-library audit and PDF hashes are in [the review report](../reviews/REV-PKG-PeriodsAndSpecialValues.md).

## Delivered

- Package README: corrected the elliptic inverse and cycle-index direction, extended relative boundary and its finite-prime domain, conductor/discriminant assembly, actual supplier ownership, generic K3 complement, local modular Schwarzian target, stuffle carrier, zero-sensitive 2-adic criterion, definition checks, doubled oval-period quadrature budget and source locators.
- Suggested.lean: real-bodied `ellipticComparisonMatrix` with two proved examples; `quinticBoundaryPairing` distinguishes the boundary matrix from the full flat pairing; numerical weight-span statement includes `Module.Finite`. Heavy carriers remain README targets in the closing comment.
- Removed duplicate PS.3.4 (Borel and restricted CM regulator specializations), owned by BorelRegulators R.7/EllipticRegulators ER.5. Qualifications remain in prerequisites and boundaries. There are 78 retained targets. No other target was removed or moved to a supplier; no supplier or packet was edited.
- Added the review report and `review.json` with the completed `needs_changes` verdict. `metadata.toml` remains unchanged (`math.NT`).

## Where the revision must resume

1. PS.0.5: own and plan the proper elliptic second-kind class, explicit homology basis and integration specialization absent from C5.
2. PS.2.1: own the arbitrary-pair de Rham–Betti comparison with integration, boundary and product compatibility absent from C5.
3. PS.3.1/PS.5.1: supply the noncommutative virtual determinant category on perfect complexes and finite-prime gluing (BF §§2.1–2.5, pp. 504–509; §§2.8–2.9, pp. 516–517). GeneralAlgebraicKTheory's relative groups alone do not supply them.
4. PS.6.6–PS.6.7: supply relevant Rankin Galois systems, strong coefficient fields, full admissibility, diagonal Abel–Jacobi class and complete LTXZZ theorem routes. AL.3 and local Selmer conditions do not construct them.
5. PS.8.4: source and plan the geometric theorem that integral K3 cohomology is torsion-free/even/unimodular of signature (3,19), before using abstract IntegralLattices 5H/6A.
6. PS.8.17: source and decompose Dwork–crystalline Frobenius comparison, semistable/log boundary comparison and the integral lattice/torsion-freeness/change of basis. SS/SH and the general CR/RD contracts do not prove the family-specific inputs.

Also preserve R11's named inherited `G-strict-compatibility` obligation. It is not a nonexistent all-degree export: `strict-compatible-system-export` already exists. The checked tier file does not assign PeriodsAndSpecialValues a tier, so upstream tier eligibility must not be inferred from that omission. No higher-roadmap ownership move was made in this review.

## Validation

- Final `lean-check` on the 639-line Suggested.lean: exit 0; 44 warnings, all `declaration uses 'sorry'`, no other warnings/errors. Existing shared build: Mathlib `082e2d37e8`, Tau Ceti `f790474`. The final Lean code was not changed after this successful run.
- `scripts/check_sorry_data.py`: exit 0.
- All three unchanged input packets (`PeriodsAndSpecialValues.json`, `PeriodsAndSpecialValues--PS.0.json`, `PeriodsAndSpecialValues--PS.8.json`) passed `scripts/check_blueprint.py` with zero errors and zero warnings.
- Independent exact-rational checks passed for monodromy, operator pullback, hypergeometric/mirror series and modular polynomial through degree eight, quintic matrix identities in 45 parameter triples, Dwork coefficients/valuation bound for four primes and n<160, Zagier coefficients, Hoffman counts through weight 15, and inverse/heap direction witnesses. The report distinguishes these finite checks from proofs.
- `research/blueprint/intake.py check-files` on all five changed deliverables: zero problems. `git diff --check`: clean.

The current roadmap and library snapshots and public-source versions/hashes are recorded in the report. Source PDFs and scratch calculations are not committed. Scratch is deleted after the PR opens, as WORKERS requires. No Lean process or language server remains running.
