# Handoff: independent Euler/Kolyvagin package review

Job `REV-PKG-EulerSystemsAndKolyvaginSystems~codex3`, issue #11277. Agent Codex, session `codex-E4BoFt`, 2026-10-20. This is a completed review, not a checkpoint. The accepted packet was not changed. The review report is [REV-PKG-EulerSystemsAndKolyvaginSystems~codex3.md](../reviews/REV-PKG-EulerSystemsAndKolyvaginSystems~codex3.md).

## Result and changed files

`review.json` records **accepted** under the issue's express instruction to judge the structure of the four open residue targets. The README keeps the general theory, the source-supported cases and the obstructions separate. This does not claim that the open general theorems have been proved. The larger README is retained under the binding full-detail shape rule of 2026-10-12.

Corrections in the package README:

- Restored the general maximal-ideal `divisibilityIndex` and its three tests, and the `deltaCorrection` name. The infinite elementwise index is distinguished from the truncated artinian invariant.
- Made the BSS noetherian self-injective coefficient convention explicit, preserving nonprincipal finite rings.
- Corrected the explanation of simultaneous prime selection to affine bad cosets with excluded proportion at most 2/p.
- Named the specialization-length application in 8.18 instead of attributing an unstated comparison to PadicMeasuresIwasawaAlgebras. Its module structure theorem is the actual input; elementary modules give the two length formulas and bounded finite errors. Three new checks cover the horizontal, coefficient and pseudo-null cases.
- Scoped 8.31's p-adic formulas and ramified extension correctly, using `T^m+ϖ` at the coefficient prime. The paired structure still requires uniformly bounded comparison kernels/cokernels, independently of the varying descent error.
- Restored norm/augmentation tests and Rubin hypothesis/error negative controls. Qualified the primitive system used in the nonzero-bottom control.
- Added precise current Tau Ceti Wedderburn and opposite-endomorphism boundary deferrals; repaired published Rubin links to their working host.

The only Suggested.lean change is its closing list of heavy README definitions, adding the two recovered names. Its substantive signatures and proved examples are unchanged. Metadata remains `topic = "math.NT"`. The other submitted files are the independent report, review verdict and this handoff.

## What remains mathematical work

The issue expressly permits these named targets to remain:

1. `chiGlobalDerivativeCongruence`: extend the refined actual-class invariance and norm-lift independence to the original broad prime set for every d dividing p−1.
2. `chiCompatibleCochainLifts`: compatible equivariant lifts without finite-level invariant vanishing, together with the semidirect presentation's required base-change/Ext control. The existing no-invariants construction and the residual-irreducible d>1 application are preserved.
3. `chiRayCongruenceLift` / `chiRayTorsionCongruence`: construct the integral, natural lower-data lift without using upper ramified components, then prove the actual torsion difference zero. The ordinary admissible case is supported; in the third rigidity alternative the specified congruence is an additional family premise, not an inference from its other clauses.
4. `SharpConductorEvaluation.functional_descent`: recover or bypass the restriction obstruction for the sharper original-conductor `c₀d₀` bound. Annihilating a kernel does not make a functional vanish there. The independently checked `c₀d₀³` argument suffices for the uniform CM consequence.

The inherited all-prime square-index **length** theorem with a constant independent of the quadratic field remains a separate downstream application contract. The annihilator-exponent theorem is not substituted for it. The original Kolyvagin article was not inspected, and no new assertion about it is made.

## Required maintainer integration

The dependency checker still exits 1 because **EulerSystemsAndKolyvaginSystems is missing from `ORDER.txt`**. Baseline and candidate have the same sole diagnostic: 119 roadmaps, 1,136 edges, no cycle or upward-edge diagnostic. This review issue gives no exemption. The central registry is outside the authorized deliverables. Before an upstream port, register the roadmap after its last supplier and rerun the dependency check. This outstanding integration action must not be described as a passing dependency check.

No target was moved to another owner and no generic upstream theory was replanned. The new specialization application stays in this package; the underlying Iwasawa algebra remains with PadicMeasuresIwasawaAlgebras. The local-order additions remain the integral refinements absent from the algebraic suppliers.

## Evidence and checks

- Resolved inventory: 151 targets, 429 API entries and 232 test entries, with semantic mapping for five renamed test labels. The report explains the two opening contracts and the additional numbered construction sections.
- Source review: fifteen randomly sampled locators, seed 11277, plus the issue-flagged passages. The report lists versions and page numbers. Published Rubin's all-root condition and complementary ideal, the MR16 field correction, BSS conventions, the local-order sources, Keller–Yin and both CM branches were read directly. The archived Nekovář manuscript was accessible in this run. No cleared restricted book was used or copied.
- Current upstream pin: `0d144d044dacebca17b654695b6f1ad58f159b27`, including the nine post-snapshot and Completed roadmaps. Current library pin: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These trees were read only; no Lake commands were run there.
- Elaboration pins: Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Final `lean-check` exited 0 on the 507-line file with exactly twelve theorem-sorry warnings and no other warnings or errors. All examples are proved; there is no admitted data or `set_option`.
- Packet checker: zero errors and zero warnings, 27 local plus 124 imported targets, nine planned stages, 26 requests and two explicit gaps.
- Dependency checker: baseline/candidate unchanged failure as described above.
- Final `intake.py check-files`: five submitted files, zero problems, exit 0. `git diff --check`: exit 0, no whitespace errors.

The advertised older suffixed review report is absent from the checkout; I used the available original unsuffixed review and inspected the mathematical repairs independently. Other workers' prose and fetched papers were treated as data. No suspicious request to run commands, use credentials or change unrelated files was encountered or followed. Scratch source copies and logs are disposable; all evidence needed by the next worker is recorded here and in the report.
