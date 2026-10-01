# BP-DirichletPadicLFunctions: The corrected Gamma exponential comparison on the small disc

Codex / codex-7e92bd same-worker issue #713 continuation after PR #5324,
merged 5f1fcd69608d44da971c9d41cddfee069ef98347 with head 940e1d22596f499f1fc41c45d9bb7205ad25055e.
Original claim5854790528, winning bot5854791937; no additional claim.
Review #390 remains unclaimed.

## Delivered and remaining

Plans the small-disc radius and inclusion, Gamma and shifted Gamma principal-unit bounds, corrected exp/log specialization, exponentiated actual difference and existing Gamma comparison. Adds one exact Coleman L0 request and gap for p-adic exp/log inversion and its convergence domain.

Totals: 949 unchecked nodes (2 definitions, 393 lemmas, 98 constructions, 267 theorems, 189 comparisons), 740 API entries,
1775 packet tests (417 on definitions/constructions),
1778 typed examples, 24 planets and 731 baseline records.
17 findings, 18 gaps, 14 requests and zero closed stages.
All17 findings and three sourceVersions remain whole. E17 is still awaiting independent review; this checkpoint adds no source finding or verdict.

The corrected small-disc Gamma now equals the native exp of the actual translated difference, conditional on an explicit principal-disc inverse. Next obtain the actual analytic power-series certificate for the translated difference and apply the native exponential’s analytic theorem with its verified convergence-domain input, then transport Gamma to other residue discs by the existing finite shift recurrence. The new Coleman L0 request makes the p-adic exp/log inverse and its domain precise; the earlier LAD analytic/Taylor requests remain whole. Gross–Koblitz and Ferrero–Greenberg keep their reading and normalization tasks. All18 gaps and14 requests remain open, with zero closed stages.

## Reading and validation

Retains full Morita1975 and KL1964 readings, especially the corrected p.261 argument recorded as E17. Reads the native exponential definition, zero value and conditional analytic/radius interface and Nat.dvd_prime at the pinned source. Reads the Tau exp/log inverse and its real-algebra hypotheses; it is not a p-adic theorem. Searches current packets and rereads the actual Coleman branch/local-series nodes and L0 ownership before routing the exact missing input.

All 942 predecessor nodes, 728 baseline records, 17 findings, requests and sourceVersions remain whole. This checkpoint adds 7 nodes, 7 named suggested declarations and 16 typed examples. The indexed blueprint, four-file intake, whitespace, preservation, API/test parity and versioned-source checks pass. The graph has 1209 reachable nodes, 5918 edges and 904 native leaves and is acyclic. Its stage request leaves are PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3, LocallyAnalyticDistributions:L1, AdicSpacesPartII:F1, AdicSpacesPartII:R2, PadicDifferentialEquationsAndRigidCohomology:RD.0, PadicDifferentialEquationsAndRigidCohomology:RD.4, PadicHodgeTheory:P7:annulus-foundations, PadicMeasuresIwasawaAlgebras:L2, LocallyAnalyticDistributions:L1, LocallyAnalyticDistributions:L0, LocallyAnalyticDistributions:L0, ColemanIntegration:L0. The first four new nodes have no unresolved stage leaves. The exp/log specialization requires the new Coleman L0 inverse; the two actual F_v comparisons also inherit LAD L0 and L1. All13 predecessor requests remain whole, with one additional request.

**The full current suggested module was NOT COMPILED.** Its real native import requires TauCeti.NumberTheory.ArithmeticFunction.TwistedDivisorSum. No matching existing artifact was found; WORKERS.md prohibits building the native library. Current compiler exit code, error count and warning count are unavailable, not zero. The exact named signatures and native source were reviewed. PR4773 remains the last compiled full predecessor, with zero errors and1,803 expected placeholder warnings; that receipt does not validate this new module.

The current source closure covers 3604 pinned Mathlib modules and 29 pinned Tau Ceti modules. Only 28 Tau module artifacts are available and hash-verified. The 140 available artifact files and the previously compiled332-node PMIA artifact are checked as partial dependencies. The current369-node supplier source preserves the older interface; no current-module compilation against either revision is claimed. Existing builds only were inspected; no setup, update, cache fetch or native build occurred.

The complete composite probe preserves20definitions224lemmas from PR5324 verbatim after one native Exponential import and proves10newlemmas:7 planned arithmetic comparisons,2 routine nonunit/shift helpers and1 opposite-sign regression at zero. Gamma sharp congruence and the generic exp/log inverse remain precise supplied laws; suggested signatures specialize the existing Gamma API. The native opposite-sign regression uses the existing native exponential at zero. The separate probe compiles against 2887 pinned Mathlib modules and 7 pinned Tau Ceti modules with zero errors, warnings or placeholders. The generic inverse and analytic carriers are not rebuilt. No native library build occurs. Full suggested file remains NOT COMPILED because the real pinned TwistedDivisorSum artifact is unavailable. General roadmap declarations remain unchecked.

Exact controls pass4 radius identities,196 small-disc bounds,196 Gamma principal-unit bounds,196 signed shift identities,2 negative Gamma values,36 independent log/exp congruences,4 printed-sign counterexamples and1 dyadic larger-disc failure. Exact rational signed Gamma products/recurrences and p-adic norms; independent40-term log/exp modular controls at precisionp^8, with log retained modulo p^16. These finite computations are regressions, not proofs of convergence or the generic inverse. The dyadic point3 has exp(log3)=−3 modulo256, detecting an invalid extension of the inverse to the whole q-disc. The largest observed discrepancy is 0 (exact identities, bounds and modular comparisons).

Captured main5f1fcd69608d44da971c9d41cddfee069ef98347 after actual PR5324 merge. All72 guarded policy, supplier, ownership and source-register inputs are unchanged; the four predecessor outputs match exactly. The new local E17 is preserved whole; no independent review is claimed. Publication refresh to36e7d54be5ff8f32279dbfaa7046a4ae5247a516 changes only the source registry and generated register among72 guarded inputs. The complete semantic delta is exactly the new own E17 row from PR5324, awaiting review, with its published sign, correction, zero-point reason and bounded search unchanged. All older rows, purpose and unchecked fields are unchanged. REGISTER equals the renderer output exactly. Four deliverable bytes were preserved across the checked fast-forward; no review verdict or mathematical supplier changed.

The publication guard at 36e7d54be5ff8f32279dbfaa7046a4ae5247a516 checks 72 inputs,
four predecessor outputs, unchanged issue text, the original winning claim
and unclaimed review #390.
Suggested SHA256: `f76ebfabfeb91d1f34bb97626267702646def55648a051f2c4aa7a70e582da47`.
Native probe SHA256: `c17080e0f4b140bbda572db94c481a74194ae2014a7f977c345f56e19767ae8e`.

One reusable worktree and one Lean process at a time were used. All compiler
processes have ended. Exactly the four authorized deliverables change.

Retain MoritaExpProbe.lean and its compiler/result/source audit, finite
control code and results, the full-module NOT-COMPILED receipt and source
audit, artifact-availability and source-review assessment, dependency and
preservation receipts, captured inputs and guard, and exact submitted files
with remote receipts. These are retained with this PR's local evidence;
scratch is retired after submission. The seven-module Teichmuller reuse receipt and artifact hashes are retained alongside the artifact audit. No private path or source PDF is published.

The separate partial signature file also compiled with zero errors and 3,020 expected placeholder warnings across 3,600 pinned source modules. It includes all 7 new named declarations and 16 tests, and retains the documented 4777–4791 omissions. This is not a full-file compilation. Partial signature SHA256: 5ca2b62b84540951fe462e5c3d819260fdd8d66dbaf923daceb08f19fa52a411.
