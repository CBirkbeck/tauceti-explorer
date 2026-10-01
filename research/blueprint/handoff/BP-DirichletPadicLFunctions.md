# BP-DirichletPadicLFunctions: Robert’s continuous factorial quotient and fixed-point product

Codex / codex-7e92bd same-worker issue #713 continuation after PR #5349,
merged d1aa436f3437fdf65662af5182a2a4d7ee516877 with head 2ea885261c8234e4a6b3ac2bd947b7ea73bb9d56.
Original claim5854790528, winning bot5854791937; no additional claim.
Review #390 remains unclaimed.

## Delivered and remaining

Plans the all-integer negative Gamma identity, its finite telescope, the finite valuation tail and source exponent, two concrete constructions with eleven API lemmas, and the pi/fixed-point product comparisons.

Totals: 1096 unchecked nodes (2 definitions, 482 lemmas, 111 constructions, 302 theorems, 199 comparisons), 824 API entries,
2118 packet tests (482 on definitions/constructions),
2121 typed examples, 24 planets and 825 baseline records.
20 findings, 18 gaps, 14 requests and zero closed stages.
All20 source findings and all five sourceVersions remain whole. No new finding or review verdict is added.

Robert’s actual continuous factorial quotient and its fixed-point Gamma product are now planned with complete native proofs. Next decompose the Mahler coefficient identity in Section3, including the actual formal-series coefficients of Theta_q(T)=exp(pi(T−T^q)), the finite-difference/exponential-generating-function comparison, and the exact coefficient extraction. Then prove the Section4 finite telescoping and norm-decay steps on Z_p. Reuse the existing RD.6/dwork-isocrystal owner for coefficient overconvergence and primitive trace-character values, with the inverse Frobenius-sign convention checked; read the primary proofs and request missing precise consumer APIs rather than duplicating that theory. The original Katz/Fermat and Gauss-side Stickelberger inputs remain unresolved until the alternate Gauss proof is complete. The E18 repair is unproved and unused; E19–E20 await independent review. All 18 gaps and 14 supplier requests remain; no stage closes.

## Reading and validation

Rereads Robert2001 pp.158–161 in full page images, including the factorial telescope, dyadic sign, G_a definition, reflection simplification, pi exponent and fixed-point product. Reads six new native baseline declarations and their proofs at the pin. The same negative-Gamma product is now derived directly from the already established recurrence, uniformly for every prime. Existing Morita Gamma, native factorial valuations, finite-range reflection, geometric sums, rational points and density are reused.

All 1087 predecessor nodes, 819 baseline records, 20 findings, requests and sourceVersions remain whole. This checkpoint adds 9 nodes, 20 named suggested declarations and 30 typed examples. The indexed blueprint, four-file intake, whitespace, preservation, API/test parity and versioned-source checks pass. The graph has 1356 reachable nodes, 6417 edges and 994 native leaves and is acyclic. Its stage request leaves are PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3, LocallyAnalyticDistributions:L1, AdicSpacesPartII:F1, AdicSpacesPartII:R2, PadicDifferentialEquationsAndRigidCohomology:RD.0, PadicDifferentialEquationsAndRigidCohomology:RD.4, PadicHodgeTheory:P7:annulus-foundations, PadicMeasuresIwasawaAlgebras:L2, LocallyAnalyticDistributions:L1, LocallyAnalyticDistributions:L0, LocallyAnalyticDistributions:L0, ColemanIntegration:L0. Every new route terminates in existing Gamma/arithmetic nodes and pinned native library facts. There are no new unresolved stage leaves; all14 supplier requests remain whole.

**The full current suggested module was NOT COMPILED.** Its real native import requires TauCeti.NumberTheory.ArithmeticFunction.TwistedDivisorSum. No matching existing artifact was found; WORKERS.md prohibits building the native library. Current compiler exit code, error count and warning count are unavailable, not zero. The exact named signatures and native source were reviewed. PR4773 remains the last compiled full predecessor, with zero errors and1,803 expected placeholder warnings; that receipt does not validate this new module.

The current source closure covers 3608 pinned Mathlib modules and 29 pinned Tau Ceti modules. Only 28 Tau module artifacts are available and hash-verified. The 140 available artifact files and the previously compiled332-node PMIA artifact are checked as partial dependencies. The current369-node supplier source preserves the older interface; no current-module compilation against either revision is claimed. Existing builds only were inspected; no setup, update, cache fetch or native build occurred.

The complete probe preserves PR5349 verbatim and adds two definitions and21 complete lemmas, including three routine arithmetic helpers. It takes only existing Gamma laws; suggested declarations specialize the actual moritaGamma. No target factorial interpolation, Gauss identity or Dwork estimate is assumed. The separate probe compiles against 2927 pinned Mathlib modules and 7 pinned Tau Ceti modules with zero errors, warnings or placeholders. Existing PMIA/Teichmuller artifacts remain hash-verified partial dependencies. Full suggested module NOT COMPILED: pinned TwistedDivisorSum has no compatible existing artifact. No native library was built. General roadmap declarations remain unchecked.

Exact rational and integer controls check the negative Gamma identity, finite telescope, valuation tail, source exponent, affine paths, factorial samples, dyadic signs, fixed-point rotations and the source range/endpoint boundaries. Exact integer and rational arithmetic; no floating-point tolerances. The largest observed discrepancy is 0.

Capture at d5e45b9a547c535f9a44ff02bc677d807ab65bd4 after merged5349 has two changed guarded inputs: the source-issue registry and generated errata register add exactly E19–E20 from that checkpoint as awaiting independent review. The complete semantic diff was read; there is no new mathematical correction, changed owner or review verdict. The other71 guarded inputs and all four predecessor deliverables are unchanged; the whole issue is unchanged and review390 remains unclaimed.

The publication guard at d5e45b9a547c535f9a44ff02bc677d807ab65bd4 checks 73 inputs,
four predecessor outputs, unchanged issue text, the original winning claim
and unclaimed review #390.
Suggested SHA256: `fac75ff7d467754b980a3666b33bd330170e766eae0cf4b10fac8b473832f68a`.
Native probe SHA256: `a787f8ddba8a169a658e8ba14dff26e399950d4d133d274de4cce988509f189a`.

One reusable worktree and one Lean process at a time were used. All compiler
processes have ended. Exactly the four authorized deliverables change.

Retain RobertFactorialProbe.lean and its compiler/result/source audit, finite
control code and results, the full-module NOT-COMPILED receipt and source
audit, artifact-availability and source-review assessment, dependency and
preservation receipts, captured inputs and guard, and exact submitted files
with remote receipts. These are retained with this PR's local evidence;
scratch is retired after submission. The seven-module Teichmuller reuse receipt and artifact hashes are retained alongside the artifact audit. No private path or source PDF is published.

The separate partial signature file also compiled with zero errors and 3,543 expected placeholder warnings across 3,604 pinned source modules. It includes all 20 new named declarations and 30 tests, and retains the documented 4777–4791 omissions. This is not a full-file compilation. Partial signature SHA256: 53a1424524fefdec8f1ea6f2338cfe566dcbc12a6f2aab3c1a7a525a50d663e6.
