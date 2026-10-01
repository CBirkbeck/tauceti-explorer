# BP-DirichletPadicLFunctions: Gross–Koblitz multiplication by a direct Gamma and Euler proof

Codex / codex-7e92bd same-worker issue #713 continuation after PR #5374,
merged 277bbb1c4618d25f73d6d8596e00630b1039fe00 with head ccb28a44be4909ebb31a16254d9f6446fae9158c.
Original claim5854790528, winning bot5854791937; no additional claim.
Review #390 remains unclaimed.

## Delivered and remaining

Plans the exact natural Gamma product, orbit/residue count balance, prime-power count divisibility, finite-precision and exact power identities, the unit root and Teichmuller identification, and the literal source multiplication theorem.

Totals: 1187 unchecked nodes (3 definitions, 538 lemmas, 112 constructions, 327 theorems, 207 comparisons), 839 API entries,
2341 packet tests (492 on definitions/constructions),
2344 typed examples, 24 planets and 902 baseline records.
20 findings, 18 gaps, 16 requests and zero closed stages.
All20 source findings and six sourceVersions remain whole. No new finding or independent review verdict is added. The source theorem is odd-prime; the binary specialization is explicitly a consequence of the complete direct proof. E18 remains open and unused.

The literal Gamma multiplication formula and its root-of-unity step now have a complete direct Gamma/Euler native proof, including the binary specialization through admissible cofinal precisions. Next establish the exact common-period logarithmic distribution and its relation to the varying least periods, correctingE18 without using its printed product. Then continue the original Katz/Fermat and external Stickelberger source alternatives, and the remaining Ferrero–Greenberg/L3 source coverage. Both exact RD.6 Dwork interfaces remain open; the direct multiplication proof does not discharge them or claim the original finite-order Hecke-character proof has been read. All18 gaps and16 requests remain; zero stages close.

## Reading and validation

Rereads Gross–Koblitz1979 published575–576 in full, including the root-of-unity inference, period comparison, congruence(3.2), and the separate logarithmic distributionE18. Reads pinned native Euler/totient powers, unit-product coercion, divisibility cancellation, quotient transitions/extensionality and core successor-division proofs in full. The direct proof below follows Gamma recurrence through finite precision and derives the source theorem independently of the still unread original Hecke-character proof route.

All 1174 predecessor nodes, 900 baseline records, 20 findings, requests and sourceVersions remain whole. This checkpoint adds 13 nodes, 13 named suggested declarations and 29 typed examples. The indexed blueprint, four-file intake, whitespace, preservation, API/test parity and versioned-source checks pass. The graph has 1447 reachable nodes, 6776 edges and 1067 native leaves and is acyclic. Its stage request leaves are PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3, LocallyAnalyticDistributions:L1, AdicSpacesPartII:F1, AdicSpacesPartII:R2, PadicDifferentialEquationsAndRigidCohomology:RD.0, PadicDifferentialEquationsAndRigidCohomology:RD.4, PadicHodgeTheory:P7:annulus-foundations, PadicMeasuresIwasawaAlgebras:L2, LocallyAnalyticDistributions:L1, LocallyAnalyticDistributions:L0, LocallyAnalyticDistributions:L0, ColemanIntegration:L0, PadicDifferentialEquationsAndRigidCohomology:RD.6, PadicDifferentialEquationsAndRigidCohomology:RD.6. All thirteen new routes terminate in preceding local Gamma/digit/Teichmuller nodes and pinned native facts. No new route reaches a stage request, and no supplier request is added.

**The full current suggested module was NOT COMPILED.** Its real native import requires TauCeti.NumberTheory.ArithmeticFunction.TwistedDivisorSum. No matching existing artifact was found; WORKERS.md prohibits building the native library. Current compiler exit code, error count and warning count are unavailable, not zero. The exact named signatures and native source were reviewed. PR4773 remains the last compiled full predecessor, with zero errors and1,803 expected placeholder warnings; that receipt does not validate this new module.

The current source closure covers 3608 pinned Mathlib modules and 29 pinned Tau Ceti modules. Only 28 Tau module artifacts are available and hash-verified. The 140 available artifact files and the previously compiled332-node PMIA artifact are checked as partial dependencies. The current369-node supplier source preserves the older interface; no current-module compilation against either revision is claimed. Existing builds only were inspected; no setup, update, cache fetch or native build occurred.

The complete probe preserves5374 verbatim and adds22 complete lemmas with no new private mathematical definition, totaling35definitions and597lemmas. Thirteen suggested declarations and29 typed tests match the promoted nodes; arithmetic, quotient and coercion helpers remain complete in the native evidence. The separate probe compiles against 2981 pinned Mathlib modules and 7 pinned Tau Ceti modules with zero errors, warnings or placeholders. Full suggested module NOT COMPILED because the pinned TwistedDivisorSum artifact remains unavailable. Existing PMIA/Teichmuller artifacts are hash-verified partial dependencies; no native library was built. General roadmap declarations remain unchecked.

Exact controls check804 count recurrences and804 balances,1,634 rational carry steps,652 each rational/residue/count-divisibility cases,114,720 natural Gamma products and4,780 each finite orbit, Euler, root-power and Teichmuller identities. Incomplete-orbit and binary precision2 counterexamples are retained. Exact natural counts and rational orbit arithmetic check the count/divisibility argument. Buffered integer Gamma approximants modulo prime powers check natural and orbit product identities, Euler powers, root-of-unity powers and Teichmuller residues, including binary admissible precisions and the zero orbit. These finite controls complement the complete native proof; they do not certify a p-adic limit. The largest observed discrepancy is 0 (exact arithmetic).

All73 captured inputs are unchanged from5374; exact predecessor outputs and the whole issue text remain preserved. Policy, owner interfaces, source versions and reviewed library audit remain at the captured blobs.

The publication guard at d3817ffdba2ddf27dcfce8db450a751b61af77e4 checks 73 inputs,
four predecessor outputs, unchanged issue text, the original winning claim
and unclaimed review #390.
Suggested SHA256: `7f654aad7910c2b79e9b171b3bda2f2d2611d5ce0d0ea21d6ed98fc3fec5b1a1`.
Native probe SHA256: `1a832fedd8dfd500895293b333fd0147eaf9cda35af0702b4acb7833cfb3c67f`.

One reusable worktree and one Lean process at a time were used. All compiler
processes have ended. Exactly the four authorized deliverables change.

Retain GrossKoblitzRootUnityProbe.lean and its compiler/result/source audit, finite
control code and results, the full-module NOT-COMPILED receipt and source
audit, artifact-availability and source-review assessment, dependency and
preservation receipts, captured inputs and guard, and exact submitted files
with remote receipts. These are retained with this PR's local evidence;
scratch is retired after submission. The seven-module Teichmuller reuse receipt and artifact hashes are retained alongside the artifact audit. No private path or source PDF is published.

The separate partial signature file also compiled with zero errors and 3,864 expected placeholder warnings across 3,604 pinned source modules. It includes all 13 new named declarations and 29 tests, and retains the documented 4777–4791 omissions. This is not a full-file compilation. Partial signature SHA256: 4f777a7417776bf451f6422ca5668376c617dbcc490c6065a73592a4b9d7034e.
