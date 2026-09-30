# BP-DirichletPadicLFunctions: Taylor quotient limits and the nonnegative integer derivative formula

Codex / codex-7e92bd same-worker issue #713 continuation after PR #5302,
merged d4e09e2adf85149059a266f98e831d0a8a145f7e with head 0ef361f1a545865c796669e05f45d5be5543b939.
Original claim5854790528, winning bot5854791937; no additional claim.
Review #390 remains unclaimed.

## Delivered and remaining

Plans exact quadratic remainder and norm, normalized quotient error, closed-radius levels, point and angular-sample quotient limits, natural-shift norm, derivative boundary value and the nonnegative integer formula for F_v.

Totals: 918 unchecked nodes (2 definitions, 377 lemmas, 98 constructions, 260 theorems, 181 comparisons), 740 API entries,
1703 packet tests (417 on definitions/constructions),
1706 typed examples, 24 planets and 723 baseline records.
16 findings, 17 gaps, 13 requests and zero closed stages.
All16 own findings, sources and sourceVersions remain whole; no new source correction or independent review verdict is claimed.

The actual Taylor remainder now gives the normalized quotient limit, and the existing difference function satisfies Morita’s finite inverse-twisted derivative formula at every nonnegative integer multiple of lcm(f,q), under the retained actual analytic inputs. The separate quotient-limit assumption is discharged. The owned analytic carrier, derivative compatibility and coefficient-limit inputs remain open; next supply the negative oriented branch and the logarithmic/Gamma comparison on pℤ_p at odd p and8ℤ₂. Analyticity is not inferred from continuity. Gross–Koblitz and Ferrero–Greenberg retain the recorded source-reading and normalization work. All17 gaps and13 requests remain open.

## Reading and validation

Retains the full Morita1975/KL1964 readings and Morita pp.259–260 for the derivative quotient and Theorem2. Reads native squeeze_zero and the full multiplicative-to-additive norm-convergence criterion; reuses the already read pinned tail-splitting and ultrametric sum generators.

All 909 predecessor nodes, 722 baseline records, 16 findings, requests and sourceVersions remain whole. This checkpoint adds 9 nodes, 9 named suggested declarations and 20 typed examples. The indexed blueprint, four-file intake, whitespace, preservation, API/test parity and versioned-source checks pass. The graph has 1178 reachable nodes, 5811 edges and 896 native leaves and is acyclic. Its stage request leaves are PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3, LocallyAnalyticDistributions:L1, AdicSpacesPartII:F1, AdicSpacesPartII:R2, PadicDifferentialEquationsAndRigidCohomology:RD.0, PadicDifferentialEquationsAndRigidCohomology:RD.4, PadicHodgeTheory:P7:annulus-foundations, PadicMeasuresIwasawaAlgebras:L2, LocallyAnalyticDistributions:L1, LocallyAnalyticDistributions:L0, LocallyAnalyticDistributions:L0. The first eight conditional Taylor/arithmetic nodes terminate in native declarations and prior exact nodes. The final existing-F_v application inherits only the established LAD L0 stage leaf through its actual analytic mean-limit input. Existing precise requests remain whole.

**The full current suggested module was NOT COMPILED.** Its real native import requires TauCeti.NumberTheory.ArithmeticFunction.TwistedDivisorSum. No matching existing artifact was found; WORKERS.md prohibits building the native library. Current compiler exit code, error count and warning count are unavailable, not zero. The exact named signatures and native source were reviewed. PR4773 remains the last compiled full predecessor, with zero errors and1,803 expected placeholder warnings; that receipt does not validate this new module.

The current source closure covers 3604 pinned Mathlib modules and 29 pinned Tau Ceti modules. Only 28 Tau module artifacts are available and hash-verified. The 140 available artifact files and the previously compiled332-node PMIA artifact are checked as partial dependencies. The current369-node supplier source preserves the older interface; no current-module compilation against either revision is claimed. Existing builds only were inspected; no setup, update, cache fetch or native build occurred.

The complete composite probe preserves20 definitions and188 lemmas from PR5302 verbatim and proves9 additional lemmas. Its Taylor HasSum and actual derivative bounds produce the quotient Tendsto witnesses, which then feed the already proved finite boundary identity and existing F_v limit. The separate probe compiles against 2826 pinned Mathlib modules and 7 pinned Tau Ceti modules with zero errors, warnings or placeholders. The separate probe uses the explicit PMIA integer-ring equivalence and seven verified existing Teichmuller artifacts. No native module is rebuilt and no new analytic carrier is introduced. Full suggested file remains NOT COMPILED because its pinned TwistedDivisorSum artifact is unavailable. General roadmap declarations remain unchecked.

Exact rational controls pass1620 remainder identities,1620 remainder bounds,1620 normalized quotient bounds,36 level bounds,1260 actual angular sample quotients,540 finite derivative boundary comparisons and10 quadratic coefficient formulas, with positive and negative unit increments. Exact rational controls for actual polynomials x^k, k0–4, their divided derivatives, p2/3, six original levels and three depths. Unit increments1,−1,5 and three principal-disc centers verify the quadratic remainder and normalized quotient bounds with B=R=1. Actual angular sample quotients and finite derivative boundary sums satisfy the same ultrametric error bound. Exact quadratic finite coefficient formulas independently explain v=(-1/6,0,1/2) at p2 and(-1/3,0,2/3) at p3; their finite support gives F(z)=(1−1/p)z². The largest observed discrepancy is 0 (all exact identities and inequalities).

Post-merge capture 5f376c099bfc9f34533dca273bc8c902fd2a5cd0 preserves all72 captured inputs and the complete issue body. Policies, own16 source findings, the complete registry, analytic supplier packets, baseline and ownership links are unchanged from the predecessor capture. No fresh source finding or independent review verdict is claimed. Publication refresh reads the full ClassicalArithmeticCompletion/E507 registry change: the independent REV-FIX-RT-PAPER-GHOSH-SARNAK-22 review confirms the exceptional Markoff-orbit inequality correction, giving h_M(k)≥h⁺_M(k)+1 for exceptional k≥5. The review records the large-coordinate argument, k=5 counterexample and finite regressions, scoped to the cited preprint passages, without a published-text or blanket version claim. The register moves that unchanged finding into confirmed and adjusts counts. This records the external review verdict, not an independent source verification by this worker. Own findings, analytic suppliers, policies and proof sources are unchanged.

The publication guard at 931ca7c3d48d9943ec6d3bbc2777b5a829c44ce3 checks 72 inputs,
four predecessor outputs, unchanged issue text, the original winning claim
and unclaimed review #390.
Suggested SHA256: `909abce96cbc0dcaef212b8ea57f34f1baef38fe47b0c8f846df40617f26fa36`.
Native probe SHA256: `5b3c60255b84b400982e7934c7e0867bd0501a84a9690bfeaef4a72a9145ba78`.

One reusable worktree and one Lean process at a time were used. All compiler
processes have ended. Exactly the four authorized deliverables change.

Retain MoritaQuotientProbe.lean and its compiler/result/source audit, finite
control code and results, the full-module NOT-COMPILED receipt and source
audit, artifact-availability and source-review assessment, dependency and
preservation receipts, captured inputs and guard, and exact submitted files
with remote receipts. These are retained with this PR's local evidence;
scratch is retired after submission. The seven-module Teichmuller reuse receipt and artifact hashes are retained alongside the artifact audit. No private path or source PDF is published.

The separate partial signature file also compiled with zero errors and 2,917 expected placeholder warnings across 3,600 pinned source modules. It includes all 9 new named declarations and 20 tests, and retains the documented 4777–4791 omissions. This is not a full-file compilation. Partial signature SHA256: d3db181fd3187c373920c9b87f4db536cc318afdd884296403626cc32c245980.
