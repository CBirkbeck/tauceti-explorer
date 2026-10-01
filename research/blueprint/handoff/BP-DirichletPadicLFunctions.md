# BP-DirichletPadicLFunctions: Robert’s Gauss norm and normalized leading unit

Codex / codex-7e92bd same-worker issue #713 continuation after PR #5357,
merged 769fee5fc313eb6d53acd6dbbb81bf7854a61f2e with head d7795860c03fa9ffa8d668e59a3a7adc484f33d6.
Original claim5854790528, winning bot5854791937; no additional claim.
Review #390 remains unclaimed.

## Delivered and remaining

Plans the root-power norm, right-rotation Gamma residue, actual Gauss norm in both normalizations, unique Z_p unit, explicit power descent, leading residue and corrected unrestricted exponent formula.

Totals: 1140 unchecked nodes (2 definitions, 511 lemmas, 112 constructions, 311 theorems, 204 comparisons), 828 API entries,
2223 packet tests (487 on definitions/constructions),
2226 typed examples, 24 planets and 879 baseline records.
20 findings, 18 gaps, 16 requests and zero closed stages.
All20 findings and six sourceVersions remain whole. No new finding or independent review verdict is added. The corrected modular range is further consumer evidence for the existing E19.

The Robert consumer now gives the exact normalized Gauss norm, unique embedded Z_p unit, its digit-factorial leading residue, and a displayed Q_p preimage of the (p−1)-st power. The norm formula for unrestricted exponents reduces moduloq−1 before taking digits. The two precise native RD.6 coefficient-bound and chosen-root splitting-value interfaces still remain open; no unconditional Dwork or source closure is claimed. Next follow Robert2001 Corollary2 in full: rational Gamma values when the denominator dividesp−1, including the exact field Q(mu_(np), nth-root(−p)), the character-order reduction and extension by the Gamma recurrence. The original Katz/Fermat and external Stickelberger proof-source obligations remain explicit alternatives. E18’s distribution repair remains unproved/unused; E19–E20 await independent review. All18 gaps and16 requests remain, with zero closed stages.

## Reading and validation

Rereads Robert2001 publishedp.168 in full for Theorem4, the unit-valued Gamma norm argument and the corrected Corollary1 range, andp.169 for Corollary2’s complete proof and the chosen-root convention. Rereads Gross–Koblitz1979 p.575 Lemma2.11 and its entire proof, distinguishing its external Stickelberger input from the Robert consequence. Reads the complete pinned finite-unit-product, product-norm and inverse-real-power proofs and rereads the p-adic norm and unit characterizations. Fifteen new complete native lemmas check the consequences and the exact right-rotation factorial residues.

All 1132 predecessor nodes, 876 baseline records, 20 findings, requests and sourceVersions remain whole. This checkpoint adds 8 nodes, 8 named suggested declarations and 20 typed examples. The indexed blueprint, four-file intake, whitespace, preservation, API/test parity and versioned-source checks pass. The graph has 1400 reachable nodes, 6595 edges and 1044 native leaves and is acyclic. Its stage request leaves are PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3, LocallyAnalyticDistributions:L1, AdicSpacesPartII:F1, AdicSpacesPartII:R2, PadicDifferentialEquationsAndRigidCohomology:RD.0, PadicDifferentialEquationsAndRigidCohomology:RD.4, PadicHodgeTheory:P7:annulus-foundations, PadicMeasuresIwasawaAlgebras:L2, LocallyAnalyticDistributions:L1, LocallyAnalyticDistributions:L0, LocallyAnalyticDistributions:L0, ColemanIntegration:L0, PadicDifferentialEquationsAndRigidCohomology:RD.6, PadicDifferentialEquationsAndRigidCohomology:RD.6. The root norm and Gamma residue use only preceding local Gamma nodes and pinned native facts. The six Gauss consumers reach exactly the existing RD.6 requests through the actual Robert comparison. No stage leaf or supplier request is added.

**The full current suggested module was NOT COMPILED.** Its real native import requires TauCeti.NumberTheory.ArithmeticFunction.TwistedDivisorSum. No matching existing artifact was found; WORKERS.md prohibits building the native library. Current compiler exit code, error count and warning count are unavailable, not zero. The exact named signatures and native source were reviewed. PR4773 remains the last compiled full predecessor, with zero errors and1,803 expected placeholder warnings; that receipt does not validate this new module.

The current source closure covers 3608 pinned Mathlib modules and 29 pinned Tau Ceti modules. Only 28 Tau module artifacts are available and hash-verified. The 140 available artifact files and the previously compiled332-node PMIA artifact are checked as partial dependencies. The current369-node supplier source preserves the older interface; no current-module compilation against either revision is claimed. Existing builds only were inspected; no setup, update, cache fetch or native build occurred.

The complete probe preserves5357 verbatim and adds15 complete lemmas, with no new private definition. The actual character consequences compose the preceding fully typed conditional Gauss/Gamma theorem; complete helper proofs verify field embeddings, unit uniqueness, exact norms and residue products. Eight suggested declarations and20 typed tests match the promoted nodes. The separate probe compiles against 2981 pinned Mathlib modules and 7 pinned Tau Ceti modules with zero errors, warnings or placeholders. Full suggested module NOT COMPILED because the pinned TwistedDivisorSum artifact remains unavailable. Existing PMIA/Teichmuller artifacts remain hash-verified partial dependencies; no native library was built. General roadmap declarations remain unchecked.

Exact finite controls evaluate276 prime-field Gauss sums modulo p^5, check their valuations and leading residues, and check948 right-rotation Gamma factorial residues and normalized exponents. Eight endpoint controls detect the raw-digit range error, and seven odd-prime sign controls distinguish positive from source-negative leading residues. Exact modular controls, not certified p-adic convergence or unconditional Dwork theorems. Prime Gauss sums are evaluated in the finite cyclotomic quotient modulo p^5 with actual Teichmuller approximants; below the precision cutoff the coefficient valuation and leading residue are checked directly. Gamma controls use integer approximants and the prior precision-one congruence, not floating-point values. The largest observed discrepancy is 0 (exact integer and rational comparisons).

All73 captured inputs remain unchanged from5357; predecessor outputs and the whole issue text are preserved. The owner, policies, source versions and library audit remain at the reviewed blobs.

The publication guard at 68e9767769931ea32270c06e419b657f8c4b9926 checks 73 inputs,
four predecessor outputs, unchanged issue text, the original winning claim
and unclaimed review #390.
Suggested SHA256: `9f523936ba9e17ef628a5dd8d0e1a3e5047e1400d3612802b7313dedcb81c8bb`.
Native probe SHA256: `74f7ff8f6986ad3f8badfa300bed87522ef9d1bdd29fe5b9b63544b66247de09`.

One reusable worktree and one Lean process at a time were used. All compiler
processes have ended. Exactly the four authorized deliverables change.

Retain RobertValuesProbe.lean and its compiler/result/source audit, finite
control code and results, the full-module NOT-COMPILED receipt and source
audit, artifact-availability and source-review assessment, dependency and
preservation receipts, captured inputs and guard, and exact submitted files
with remote receipts. These are retained with this PR's local evidence;
scratch is retired after submission. The seven-module Teichmuller reuse receipt and artifact hashes are retained alongside the artifact audit. No private path or source PDF is published.

The separate partial signature file also compiled with zero errors and 3,696 expected placeholder warnings across 3,604 pinned source modules. It includes all 8 new named declarations and 20 tests, and retains the documented 4777–4791 omissions. This is not a full-file compilation. Partial signature SHA256: 8f80270847e1d17befdf7f6e995af34c95d3d7f4a1c2a7b382e6af4f9a106402.
