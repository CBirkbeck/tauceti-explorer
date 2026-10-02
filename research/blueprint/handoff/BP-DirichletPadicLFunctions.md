# BP-DirichletPadicLFunctions: Actual rational primitive fibers and Cartan coordinates

Codex / codex-7e92bd same-worker issue #713 continuation after PR #5767,
merged bb091c2002fb6a0f6682f89092fe08aa2fb4c5ff with head 598b5b4e70e76628a9a9e218d7aa9ad92a53fec8.
Original claim5854790528, winning bot5854791937; no additional claim.
Review #390 remains unclaimed.

## Delivered and remaining

Plans actual rational primitive-fiber sums, exact coefficients, nonvanishing, zero/primitive cases, support, mass and equivariance, with the original Cartan coefficient comparison and norm compatibility.

Totals: 2039 unchecked nodes (22 definitions, 1221 lemmas, 230 constructions, 359 theorems, 207 comparisons), 1435 API entries,
3623 packet tests (961 on definitions/constructions),
3626 typed examples, 24 planets and 1239 baseline records.
27 findings, 18 gaps, 16 requests and zero closed stages.
All26earlier source findings and seven source versions remain whole. NewE27 records the sum/product misprint in published4.5, with the correct product already printed in the same proof and the companion paper1.9. The companion published version is recorded for that scoped correction check only. No independent review verdict or stage closure is added.

The actual primitive-fiber factor s(X_N(a)) now has a complete source-coordinate construction, coefficients, nonvanishing, support/cardinality and equivariance, plus its actual degree-one Cartan group-ring comparison and norm compatibility. The raw factor is not an ordinary distribution. The full rational model requires the product of local factors; printed4.5 has a sum, while its following proof and the published companion formula1.9 use the product, recorded asE27. Construct those actual local coset factors and prove the corrected rational distribution and rational-span arguments next. Source freeness, lower rank, internal-to-global injection, character components, general-degree Cartan coordinates and unramified-ring identification remain open.

## Reading and validation

Kubert193–200 was reread in text, with formula4.5 and the proofs on194,198–199 checked visually. Equations4.1–4.4 and the primitive-sum compatibility step195 are matched on actual native carriers. Existing primitive transfer, order and coefficient-equivalence interfaces were reused. For the sum/product correction alone, Kubert’s published companion paper203–224 was fetched and its rational-model section204–207 read, with formula1.9 on206 visually checked. No later theorem from that companion paper is adopted or claimed fully extracted.

All 2021 predecessor nodes, 1236 baseline records, 26 findings, requests and sourceVersions remain whole. This checkpoint adds 18 nodes, 18 named suggested declarations and 23 typed examples. The indexed blueprint, four-file intake, whitespace, preservation, API/test parity and versioned-source checks pass. The graph has 2301 reachable nodes, 9394 edges and 1407 native leaves and is acyclic. Its stage request leaves are PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3, LocallyAnalyticDistributions:L1, AdicSpacesPartII:F1, AdicSpacesPartII:R2, PadicDifferentialEquationsAndRigidCohomology:RD.0, PadicDifferentialEquationsAndRigidCohomology:RD.4, PadicHodgeTheory:P7:annulus-foundations, PadicMeasuresIwasawaAlgebras:L2, LocallyAnalyticDistributions:L1, LocallyAnalyticDistributions:L0, LocallyAnalyticDistributions:L0, ColemanIntegration:L0, PadicDifferentialEquationsAndRigidCohomology:RD.6, PadicDifferentialEquationsAndRigidCohomology:RD.6. Every new route ends in the original actual torus levels, positive point orders, established primitive lifting and full transfer maps, actual degree-one Cartan coefficient equivalences, or checked native finite-coefficient interfaces. No assumed torsor, full rational distribution, rank or freeness package is introduced.

**The full current suggested module was NOT COMPILED.** Its real native import requires TauCeti.NumberTheory.ArithmeticFunction.TwistedDivisorSum. No matching existing artifact was found; WORKERS.md prohibits building the native library. Current compiler exit code, error count and warning count are unavailable, not zero. The exact named signatures and native source were reviewed. PR4773 remains the last compiled full predecessor, with zero errors and1,803 expected placeholder warnings; that receipt does not validate this new module.

The current source closure covers 3915 pinned Mathlib modules and 32 pinned Tau Ceti modules. Only 31 Tau module artifacts are available and hash-verified. The 152 available artifact files and the previously compiled332-node PMIA artifact are checked as partial dependencies. The current369-node supplier source preserves the older interface; no current-module compilation against either revision is claimed. Existing builds only were inspected; no setup, update, cache fetch or native build occurred.

The complete native probe retains5767 verbatim and adds two constructions and sixteen complete lemmas. Totals are172definitions and1,342lemmas with no placeholders. The public append has18named declarations and23typed examples, all new mathematical bodies placeholders. No new native import or library build occurs. The separate probe compiles against 3282 pinned Mathlib modules and 10 pinned Tau Ceti modules with zero errors, warnings or placeholders. The separate probe uses existing pinned native periodicity, low-degree Tate and Teichmuller artifacts, with ten Tau modules in its source closure. It does not import or compile the unavailable TwistedDivisorSum module; the full-file boundary remains unchanged. General roadmap declarations remain unchecked.

Exact controls verify666nonempty cyclic primitive fibers through level36,650rank-two torus fibers through level12,14,254transition coefficients and9,519unit-equivariance cases. Separate finite corrected-product controls verify1,196distribution relations and4,286norm coefficients through level24, and distinguish product from printed sum at levels1,6,30. Those finite full-model controls do not claim a general native full-model proof. Exact rational arithmetic on actual cyclic point groups through level36 and rank-two tori through level12 checks every primitive fiber, its nonemptiness, zero and primitive cases, unit equivariance and divisor transitions. A separate finite implementation of the corrected rational-model product checks every internal distribution relation and group-ring norm through level24. It also distinguishes the printed sum from the intended product at levels1,6,30. These finite product controls support the source correction only; no general corrected rational-distribution, lower-rank or source-freeness theorem is claimed by the current native probe. The largest observed discrepancy is 0.

All79captured inputs, four actually merged predecessor outputs and the whole issue body are unchanged. The original primitive-fiber source, existing native coefficient and order interfaces, and the scoped published companion product restatement were read. One source correctionE27 is recorded with the correct published product as known support; no independent review verdict is adopted.

The publication guard at 8777e5075c0c03f8ba0f8f2c2177e9f2e060ae3a checks 79 inputs,
four predecessor outputs, unchanged issue text, the original winning claim
and unclaimed review #390.
Suggested SHA256: `b1401e8c78a4d9114ad9f03cfb53d7ef2084d3e403fd718f0d8020288f20ce0b`.
Native probe SHA256: `c1d49b232d099e7bc1af89a8b4206958c45ecbbc4a76b650df330ddfd96777e3`.

One reusable worktree and one Lean process at a time were used. All compiler
processes have ended. Exactly the four authorized deliverables change.

Retain KubertSinnottLatticeProbe.lean and its compiler/result/source audit, finite
control code and results, the full-module NOT-COMPILED receipt and source
audit, artifact-availability and source-review assessment, dependency and
preservation receipts, captured inputs and guard, and exact submitted files
with remote receipts. These are retained with this PR's local evidence;
scratch is retired after submission. The seven-module Teichmuller, existing low-degree Tate and archived periodicity/invariants reuse receipts and artifact hashes are retained alongside the artifact audit. The two periodicity/invariants modules have no retained original compiler logs; their pinned source, archive provenance and fresh probe compatibility are recorded without an empty-log claim. No private path or source PDF is published.

The separate partial signature file also compiled with zero errors and 6,010 expected placeholder warnings across 3,914 pinned source modules. It includes all 18 new named declarations and 23 tests, and retains the documented 4777–4791 omissions. This is not a full-file compilation. Partial signature SHA256: c06d77f7252de7bbb83baafe39ef662467f7f62aaceea42412ee1b541e7e611a.
