# Handoff: independent Part I package review

Job `REV-PKG-DeformationAndDerivedPatchingAlgebra~adv`, issue [#10067](https://github.com/CBirkbeck/tauceti-explorer/issues/10067). Codex session `codex-0y686h`, 2026-10-16. This session claimed exactly one job. It independently reviewed the package written by session `codex-JCneCV` (#10011 / PR #10021).

**Complete review; verdict `needs_changes`.** Applied the feasible corrections and submitted the review, rather than handing back an unreviewed package. This is not a checkpoint. The detailed report is [REV-PKG-DeformationAndDerivedPatchingAlgebra~adv.md](../reviews/REV-PKG-DeformationAndDerivedPatchingAlgebra~adv.md); it contains the complete 88-row adversarial pass, all ten author-flagged interface audits, reproducible random source sample, current ownership comparisons, all 19 Lean signature checks and public source hashes. No source files or passages are included.

## Applied corrections and ownership changes

- Fixed unrestricted descent of generating regular sequences to Noetherian local maps; added the nonprincipal invertible Dedekind-ideal counterexample.
- Added full-finite-socle obstruction data and naturality, regular-local maximal-depth freeness before AB, explicit Cohen truncated lifting including torsion targets, the CI parafactorial theorem, patched cotangent image proof leaves, finite capped connectedness proof, derived right-edge naturality and finite-action canonical-duality comparison.
- Verified the arithmetic diagonal proof and restricted its scope; added an inseparable-field failure of an unrestricted version.
- Deleted owned depth and Matlis targets and generic perfectness/amplitude/interval, tensor/Hom, quotient-tower/Milnor/completion and perfect-system effectivity targets. DerivedModuleAlgebra owns those contracts. SchemeAndStackFoundations owns affine normalized duality. Part II owns Rees modules, Čech, CM/local-cohomology and noncomplete finite-module local duality; ArithmeticGaloisDuality owns the complete-local bounded-complex theorem. Existing current-library syntomic charts remain imports. All removals and exact retained variants are listed in the report.
- Original §3.7 (Matlis) was deleted. Original §§3.8–3.16 become §§3.7–3.15, giving 87 numbered subsections. Source theorem numbers were checked separately from these internal renumberings.
- Kept the new actual minimal-chain, tower-action, finite derived-Hom, noncomplete bounded-complex and formal-presentation comparisons. Arbitrary cofiltered inverse-limit exactness has a Matlis/filtered-colimit proof using complete Noetherian coefficients, without a finite-residue hypothesis.
- Removed the Lean depth, Matlis and PerfectInterval declarations, replaced the concentration hypotheses by a native bounded finite-projective representative, and added real matrix proofs for the signed cone comparison and its unsigned failure. Final file: 503 lines, 10 definitions, 3 native abbreviations, 19 theorems, 43 examples.

No higher-tier consumer needs to supply missing native module algebra. Completed-cohomology and geometric applications consume the actual comparison variants retained here. Part II's foundational inputs do not depend back on Part I; do not reinstate duplicate K0/K3 targets here. The topological-basis extension over arbitrary complete Noetherian local coefficients stays in §7.5, beyond the completed-free DVR supplier.

## Exact remaining work

1. §4.5: formulate and prove the desired arbitrary-complete-DVR diagonal extension with correct residue-field and separability hypotheses. The current verified statement is the arithmetic one; Cohen-map existence alone does not give the diagonal isomorphism.
2. §3.2: read Martsinkovsky Theorem 6, J. Pure Appl. Algebra 110 (1996), 9–13, or supply an independent stable-cohomology proof input for the Avramov–Iyengar/Lescot comparison. The Avramov–Iyengar reduction itself was checked.
3. §3.13 (original §3.14): source and read the formally-unmixed mixed-characteristic multiplicity-one converse. Stone Theorem 16's displayed field-containing proof does not cover it.
4. §8.6: obtain/read the 2022 Calegari–Geraghty correction, Invent. Math. 227, 855–856, DOI `10.1007/s00222-021-01095-5`; compare its corrected ranges and quotient actions with the explicit input datum. Only metadata and the original Theorem 6.3 construction were verified.

These four gaps are marked in the README and in review.json. The source manifest and all durable findings are in the report; the disposable scratch directory is not needed by another worker. Sources restricted by the maintainer's library index were read only there, without copying files or passages.

## Validation

- Final `lean-check` exited 0, with `declaration uses sorry` as its only warning. Available memory was checked before compiling. No build or lake command ran in either current read-only checkout.
- `python3 research/blueprint/intake.py check-files` on the changed README, Suggested.lean, review.json, review report and this handoff: **5 files, 0 problems**, exit 0.
- `git diff --check`: exit 0.

Metadata is unchanged (`topic = "math.AC"`). Only this package's deliverables, its review and this handoff are changed. The branch begins `codex-0y686h`; submission uses `Refs #10067`. Stop after its PR and submission-check inspection; do not claim another issue.
