# BP-DirichletPadicLFunctions: Explicit logarithmic divided coefficients and inverse-power means

Codex / codex-7e92bd same-worker issue #713 continuation after PR #5330,
merged 3546f088be0434b1a51ec06be4b10277db32a089 with head 529a4cd9f717b16873031017f96b817e1bea62df.
Original claim5854790528, winning bot5854791937; no additional claim.
Review #390 remains unclaimed.

## Delivered and remaining

Promotes four existing coordinate/character APIs without duplicating their suggested declarations; defines the explicit logarithmic divided-coefficient family with seven-item API; plans its higher formula, derivative recurrence and factorial normalization, actual mean scalar extraction, inverse-power finite comparison and both limit implications.

Totals: 977 unchecked nodes (2 definitions, 403 lemmas, 101 constructions, 276 theorems, 195 comparisons), 758 API entries,
1845 packet tests (434 on definitions/constructions),
1848 typed examples, 24 planets and 747 baseline records.
17 findings, 18 gaps, 14 requests and zero closed stages.
All17 source findings and three sourceVersions remain whole; E17 remains awaiting independent review. No new source finding or verdict is added.

The actual logarithmic primitive now has explicit divided-derivative coefficients, their recurrence and factorial normalization, with finite angular-twist cancellation and exact inverse-power limit comparisons. Next substitute this family into the existing Gamma logarithmic series, identify its first and second derivatives and prove the source’s larger convergence-radius assertion with its precise analytic inputs. Gross–Koblitz and Ferrero–Greenberg remain targets. All14 requests and18 gaps remain open, all implementation statuses unchecked, zero closed stages.

## Reading and validation

Retains complete Morita1975 and KL1964 readings; the p.261 Remark’s displayed logarithmic coefficients are read with the prior Section2 angular/mean conventions. The source’s factorial denominator and inverse torsion exponent are explicit. Reads pinned hasDerivAt_zpow including its strict-derivative proof and ambient hypotheses; rereads constant-multiplication derivatives, factorial successor, constant-multiplication Tendsto and Hausdorff limit uniqueness. Prior owned logarithm and analytic inputs are retained.

All 965 predecessor nodes, 746 baseline records, 17 findings, requests and sourceVersions remain whole. This checkpoint adds 12 nodes, 12 named suggested declarations and 27 typed examples. The indexed blueprint, four-file intake, whitespace, preservation, API/test parity and versioned-source checks pass. The graph has 1237 reachable nodes, 6013 edges and 919 native leaves and is acyclic. Its stage request leaves are PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3, LocallyAnalyticDistributions:L1, AdicSpacesPartII:F1, AdicSpacesPartII:R2, PadicDifferentialEquationsAndRigidCohomology:RD.0, PadicDifferentialEquationsAndRigidCohomology:RD.4, PadicHodgeTheory:P7:annulus-foundations, PadicMeasuresIwasawaAlgebras:L2, LocallyAnalyticDistributions:L1, LocallyAnalyticDistributions:L0, LocallyAnalyticDistributions:L0, ColemanIntegration:L0. Only the divided-derivative recurrence inherits an unresolved stage leaf, LAD L1 through the existing fine Coleman logarithm-derivative input. The promoted coordinate and finite/conditional limit nodes have no unresolved stage leaves. All14 requests remain whole.

**The full current suggested module was NOT COMPILED.** Its real native import requires TauCeti.NumberTheory.ArithmeticFunction.TwistedDivisorSum. No matching existing artifact was found; WORKERS.md prohibits building the native library. Current compiler exit code, error count and warning count are unavailable, not zero. The exact named signatures and native source were reviewed. PR4773 remains the last compiled full predecessor, with zero errors and1,803 expected placeholder warnings; that receipt does not validate this new module.

The current source closure covers 3604 pinned Mathlib modules and 29 pinned Tau Ceti modules. Only 28 Tau module artifacts are available and hash-verified. The 140 available artifact files and the previously compiled332-node PMIA artifact are checked as partial dependencies. The current369-node supplier source preserves the older interface; no current-module compilation against either revision is claimed. Existing builds only were inspected; no setup, update, cache fetch or native build occurred.

The complete composite probe preserves PR5330’s22definitions256lemmas verbatim after adding the native Deriv.ZPow import, and adds1definition12lemmas. Eleven new lemmas supply planned API/results and one elementary field-cancellation helper supports the actual finite-sum comparison. The four promoted coordinate APIs already have complete proofs in the preserved prefix and existing suggested signatures; no second definition or alternate coordinate is introduced. The separate probe compiles against 2896 pinned Mathlib modules and 7 pinned Tau Ceti modules with zero errors, warnings or placeholders. Derivative statements assume the local logarithm derivative at a nonzero point; actual coefficient convergence remains a supplied Tendsto witness. Full suggested file remains NOT COMPILED because the pinned TwistedDivisorSum artifact is unavailable. The separate native proof and partial-signature receipts do not close that gap. General roadmap declarations remain unchecked.

Exact controls pass315 formal primitive coefficients,56 divided-derivative recurrences,56 factorial normalizations,1750 angular factorizations,1750 twist cancellations,56 finite coefficient means,56 inverse rescalings and5 low-order or negative controls. Exact rational formal expansion of (u+h)(L+log(1+h/u)−1), monomial differentiation, factorial arithmetic and the actual dyadic/ternary rational torsion coordinates. Finite checks do not certify convergence or limits; the separate complete native Lean probe checks the derivative and limit implications. The largest observed discrepancy is 0.

The capture at 36c1cc2d7d99f156185c6bc2e07c8bafebc4f3e3 has zero changes among72 tracked inputs and an unchanged issue body after merged PR5330. The new dependency routes preserve the same owned log/analytic interfaces and source-register findings.

The publication guard at 14543fb7efa6ae297590da5637d2b6bf88baea2b checks 72 inputs,
four predecessor outputs, unchanged issue text, the original winning claim
and unclaimed review #390.
Suggested SHA256: `41ec3016e2831d452bf1562d35d544229da77fe6db3b1557951e3968553090d3`.
Native probe SHA256: `ac7e59c44978b7504cee3dde93d5246d698e9ee7a226c30b47d1d8013b292c53`.

One reusable worktree and one Lean process at a time were used. All compiler
processes have ended. Exactly the four authorized deliverables change.

Retain MoritaLogCoefficientsProbe.lean and its compiler/result/source audit, finite
control code and results, the full-module NOT-COMPILED receipt and source
audit, artifact-availability and source-review assessment, dependency and
preservation receipts, captured inputs and guard, and exact submitted files
with remote receipts. These are retained with this PR's local evidence;
scratch is retired after submission. The seven-module Teichmuller reuse receipt and artifact hashes are retained alongside the artifact audit. No private path or source PDF is published.

The separate partial signature file also compiled with zero errors and 3,123 expected placeholder warnings across 3,600 pinned source modules. It includes all 12 new named declarations and 27 tests, and retains the documented 4777–4791 omissions. This is not a full-file compilation. Partial signature SHA256: 394513cfe24537eec2e0dc02f22b3614ee6ed89f88ac068b7b8fe3c3010557da.
