# BP-DirichletPadicLFunctions: Robert’s coefficient convergence and moving-input decay

Codex / codex-7e92bd same-worker issue #713 continuation after PR #5354,
merged 2ac06149c8eaec20fd7f49bfcf87cecfb754276c with head a5dd8dee86b02165291464007f86e3d15bff89c8.
Original claim5854790528, winning bot5854791937; no additional claim.
Review #390 remains unclaimed.

## Delivered and remaining

Plans the small-index HasSum/Gamma comparison/continuity, normalized factorial norm, geometric term bound, all-a summability and continuity, all-prime and sharper odd-prime sup bounds, moving-input tail and limiting coefficient telescope.

Totals: 1123 unchecked nodes (2 definitions, 501 lemmas, 112 constructions, 306 theorems, 202 comparisons), 828 API entries,
2182 packet tests (487 on definitions/constructions),
2185 typed examples, 24 planets and 870 baseline records.
20 findings, 18 gaps, 15 requests and zero closed stages.
All20 source findings and five predecessor sourceVersions remain whole. The newly used Robert2000 book adds a sixth published source version. No new finding or review verdict is added.

The coefficient-defined all-a family now agrees with pi^a times the Gamma quotient for a<q and has complete native proofs of summability, continuity, uniform decay and the limiting telescope conditional on the explicitly requested Dwork coefficient bound. Next use finite-field multiplicative orthogonality to identify the limiting residue-class coefficient sum with the source-negative Gauss sum, respecting0≤a<q−1 and the endpoint correction E19. Obtain the actual primitive splitting value and its trace-character/normalized-pi compatibility from RD.6; the bound request is a dependency, not a completed owner theorem. The original Katz/Fermat and Gauss-side Stickelberger route remains open until the alternate proof is fully assembled. E18’s proposed repair remains unproved/unused; E19–E20 await independent review. All18 gaps remain, with15 requests and zero closed stages.

## Reading and validation

Fully reads Robert2000 VII2 pp.385–403, including the complete Artin–Hasse and Dwork proofs and all small-prime checks, together with the precise analytic prerequisite sections listed in its source record. Rereads Robert2001 pp.163–167 for the comparison, telescope and full odd/dyadic norm argument. Reads the entire current RD.6 Dwork node and its API; it supplies no exact native coefficient-bound statement. Full pinned native statements/proofs for all sixteen new baseline records were read. Complete native consumer proofs supply the normalized factorial identity, geometric majorant, all-a summability and continuity, sharp norm bounds and moving-input tail.

All 1112 predecessor nodes, 854 baseline records, 20 findings, requests and sourceVersions remain whole. This checkpoint adds 11 nodes, 11 named suggested declarations and 25 typed examples. The indexed blueprint, four-file intake, whitespace, preservation, API/test parity and versioned-source checks pass. The graph has 1383 reachable nodes, 6536 edges and 1035 native leaves and is acyclic. Its stage request leaves are PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3, LocallyAnalyticDistributions:L1, AdicSpacesPartII:F1, AdicSpacesPartII:R2, PadicDifferentialEquationsAndRigidCohomology:RD.0, PadicDifferentialEquationsAndRigidCohomology:RD.4, PadicHodgeTheory:P7:annulus-foundations, PadicMeasuresIwasawaAlgebras:L2, LocallyAnalyticDistributions:L1, LocallyAnalyticDistributions:L0, LocallyAnalyticDistributions:L0, ColemanIntegration:L0, PadicDifferentialEquationsAndRigidCohomology:RD.6. The first four new nodes use existing native and Gamma/Mahler facts. The seven quantitative consumers reach exactly the new RD.6 stage request. The source owner is not duplicated and its coefficient estimate is not marked discharged. Every other inherited route and all14 older requests remain whole.

**The full current suggested module was NOT COMPILED.** Its real native import requires TauCeti.NumberTheory.ArithmeticFunction.TwistedDivisorSum. No matching existing artifact was found; WORKERS.md prohibits building the native library. Current compiler exit code, error count and warning count are unavailable, not zero. The exact named signatures and native source were reviewed. PR4773 remains the last compiled full predecessor, with zero errors and1,803 expected placeholder warnings; that receipt does not validate this new module.

The current source closure covers 3608 pinned Mathlib modules and 29 pinned Tau Ceti modules. Only 28 Tau module artifacts are available and hash-verified. The 140 available artifact files and the previously compiled332-node PMIA artifact are checked as partial dependencies. The current369-node supplier source preserves the older interface; no current-module compilation against either revision is claimed. Existing builds only were inspected; no setup, update, cache fetch or native build occurred.

The complete probe preserves5354 verbatim and adds32 complete lemmas, including routine binomial, valuation, digit and real-exponent estimates. Eleven suggested declarations and25 typed tests match the promoted nodes. The actual Dwork coefficient bound is explicit; the target summability, continuity and tail conclusions are proved, not assumed. The separate probe compiles against 2981 pinned Mathlib modules and 7 pinned Tau Ceti modules with zero errors, warnings or placeholders. Full suggested module NOT COMPILED because the pinned TwistedDivisorSum artifact is unavailable. Existing PMIA/Teichmuller artifacts remain hash-verified partial dependencies. No native library was built. General roadmap declarations remain unchecked.

Exact arithmetic checks20,000 binary digit inequalities,728 actual coefficient valuation samples,648 factorial ratios,22,032 exponent bounds,2,170 falling-term bounds,270 small-index Gamma comparisons and the strict ternary/range boundaries. Finite samples do not prove Dwork overconvergence. Exact integer digit arithmetic and rational exponents, with formal coefficients computed in Q[pi]/(pi^(p-1)+p) after extracting pi^n. Norm comparisons use exact p-adic valuations; no floating-point radius approximation. The largest observed discrepancy is 0.

All73 captured inputs match5354; four deliverables equal the merged predecessor. Whole713 issue body unchanged. Same-session continuation after actual5354merge; review390 unclaimed.

The publication guard at beab3ec765d09f2abede11e15d1a4c9d910c6f70 checks 73 inputs,
four predecessor outputs, unchanged issue text, the original winning claim
and unclaimed review #390.
Suggested SHA256: `aff5bd5b98c92e5b8e3896efb01c18a4c393f34f58a08485949e61178882d3eb`.
Native probe SHA256: `26958f495210648dbb15f81fdf0c4068a13966090a62da50759225fd43207838`.

One reusable worktree and one Lean process at a time were used. All compiler
processes have ended. Exactly the four authorized deliverables change.

Retain RobertDecayProbe.lean and its compiler/result/source audit, finite
control code and results, the full-module NOT-COMPILED receipt and source
audit, artifact-availability and source-review assessment, dependency and
preservation receipts, captured inputs and guard, and exact submitted files
with remote receipts. These are retained with this PR's local evidence;
scratch is retired after submission. The seven-module Teichmuller reuse receipt and artifact hashes are retained alongside the artifact audit. No private path or source PDF is published.

The separate partial signature file also compiled with zero errors and 3,638 expected placeholder warnings across 3,604 pinned source modules. It includes all 11 new named declarations and 25 tests, and retains the documented 4777–4791 omissions. This is not a full-file compilation. Partial signature SHA256: 77e4cab5ee76414f4bf9793a57eadad838c750f4c8b2b4aa41e84e8d34887b16.
