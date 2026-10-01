# BP-DirichletPadicLFunctions: Gamma factorial congruences for the Gross–Koblitz orbit

Codex / codex-7e92bd same-worker issue #713 continuation after PR #5340,
merged 6e6825ad76fdf14b34441151368148c602c204a8 with head 3133f99e8acdcf49ce352e1ef51023a5d22e0225.
Original claim5854790528, winning bot5854791937; no additional claim.
Review #390 remains unclaimed.

## Delivered and remaining

Plans native mod-p Gamma congruence, the negative-factorial identity, rational and carry factorial residues, rational periodicity, cyclic Gamma-product invariance and the inverse factorial product. This proves the Gamma side of the source congruence while keeping the Gauss-side input open.

Totals: 1044 unchecked nodes (2 definitions, 446 lemmas, 104 constructions, 295 theorems, 197 comparisons), 778 API entries,
1998 packet tests (450 on definitions/constructions),
2001 typed examples, 24 planets and 780 baseline records.
18 findings, 18 gaps, 14 requests and zero closed stages.
All18 findings and all four sourceVersions remain whole, including E18 awaiting independent review. No new finding or review verdict is added.

The Gamma side of Gross–Koblitz Lemma2.11(3) is now planned with a complete native proof: the reduced orbit product is the inverse product of the actual digit factorials. This does not prove the Gauss-side leading congruence or identify its π-normalized unit. Next combine the earlier reflection and digit parity for the elementary Jacobi case Lemma2.5. The native finite-field Gauss inverse-character product is available and should be reused once the exact negative Gauss convention, Teichmuller exponent, primitive additive character and compatible π are constructed. The Katz Frobenius limit2.7 and Stickelberger Gauss congruence retain their proof-source and ownership obligations. E18’s distribution repair remains unproved and unused, as do the Ferrero–Greenberg proof and analytic supplier obligations. All18 gaps and14 requests remain; no stage closes.

## Reading and validation

Rereads Gross–Koblitz p.575, the full Gamma-side calculation in Lemma2.11(3), retaining the complete13-page reading and digit conventions. Reads both native residue kernels, maximalIdeal_eq_span_p and the finite product-range successor formulas in full at the pin; all are existing baseline records. The native Gauss inverse-character product and Wilson statements were also read as leads, but neither is used as a new input here. The recurrence-based negative-factorial proof gives the same Gamma congruence without a second Wilson argument.

All 1035 predecessor nodes, 780 baseline records, 18 findings, requests and sourceVersions remain whole. This checkpoint adds 9 nodes, 9 named suggested declarations and 22 typed examples. The indexed blueprint, four-file intake, whitespace, preservation, API/test parity and versioned-source checks pass. The graph has 1304 reachable nodes, 6245 edges and 950 native leaves and is acyclic. Its stage request leaves are PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3, LocallyAnalyticDistributions:L1, AdicSpacesPartII:F1, AdicSpacesPartII:R2, PadicDifferentialEquationsAndRigidCohomology:RD.0, PadicDifferentialEquationsAndRigidCohomology:RD.4, PadicHodgeTheory:P7:annulus-foundations, PadicMeasuresIwasawaAlgebras:L2, LocallyAnalyticDistributions:L1, LocallyAnalyticDistributions:L0, LocallyAnalyticDistributions:L0, ColemanIntegration:L0. All nine new nodes terminate in existing Gamma/arithmetic nodes and native library facts, with no unresolved stage leaves. All14 supplier requests remain whole.

**The full current suggested module was NOT COMPILED.** Its real native import requires TauCeti.NumberTheory.ArithmeticFunction.TwistedDivisorSum. No matching existing artifact was found; WORKERS.md prohibits building the native library. Current compiler exit code, error count and warning count are unavailable, not zero. The exact named signatures and native source were reviewed. PR4773 remains the last compiled full predecessor, with zero errors and1,803 expected placeholder warnings; that receipt does not validate this new module.

The current source closure covers 3604 pinned Mathlib modules and 29 pinned Tau Ceti modules. Only 28 Tau module artifacts are available and hash-verified. The 140 available artifact files and the previously compiled332-node PMIA artifact are checked as partial dependencies. The current369-node supplier source preserves the older interface; no current-module compilation against either revision is claimed. Existing builds only were inspected; no setup, update, cache fetch or native build occurred.

The composite probe preserves the PR5340 native26definitions331lemmas verbatim and adds11 complete lemmas:9 planned results plus routine reduction-one and finite cyclic-product helpers. Its only Gamma inputs are the already established zero value, functional equation and sharp mod-p congruence. Suggested signatures specialize the actual moritaGamma; no target Gauss identity is assumed. The separate probe compiles against 2910 pinned Mathlib modules and 7 pinned Tau Ceti modules with zero errors, warnings or placeholders. No native library is built. Existing PMIA/Teichmuller artifacts remain hash-verified partial dependencies. The full suggested module is NOT COMPILED because pinned TwistedDivisorSum lacks a compatible existing artifact. General roadmap declarations remain unchecked.

Exact rational controls check the negative Gamma factorial identities and their strict-bound failure; finite residue controls check Gamma congruence, rational/carry residues, cyclic products, inverse factorial products and the zero-class endpoint distinction. Exact Python integers and fractions compute the signed Gamma recurrence at positive and negative integers. Finite signed products at independently computed rational representatives modulo p,p²,p³ test the residue formulas and their cyclic products. Factorials and modular inverses are evaluated independently of Gamma. The finite controls are not a replacement for the complete Lean proofs or a formal proof of the separate Gauss congruence. The largest observed discrepancy is 0 in every exact rational or finite-field identity.

Capture at 6e6825ad76fdf14b34441151368148c602c204a8 has zero changes among72 guarded inputs after merged5340, with unchanged issue body and source findings. No supplier, policy or review verdict changed.

The publication guard at cd3af66a901e764266e07f3d5260036a9536dd59 checks 72 inputs,
four predecessor outputs, unchanged issue text, the original winning claim
and unclaimed review #390.
Suggested SHA256: `b5b325894c21380697409b5d94bb6d7353747c1524bc8c9e585cf9c6b1356cce`.
Native probe SHA256: `1cdf06384f4a79e82860741711327fe25c804eba5422202cc78cb38cab6d1361`.

One reusable worktree and one Lean process at a time were used. All compiler
processes have ended. Exactly the four authorized deliverables change.

Retain GrossKoblitzGammaProductsProbe.lean and its compiler/result/source audit, finite
control code and results, the full-module NOT-COMPILED receipt and source
audit, artifact-availability and source-review assessment, dependency and
preservation receipts, captured inputs and guard, and exact submitted files
with remote receipts. These are retained with this PR's local evidence;
scratch is retired after submission. The seven-module Teichmuller reuse receipt and artifact hashes are retained alongside the artifact audit. No private path or source PDF is published.

The separate partial signature file also compiled with zero errors and 3,350 expected placeholder warnings across 3,600 pinned source modules. It includes all 9 new named declarations and 22 tests, and retains the documented 4777–4791 omissions. This is not a full-file compilation. Partial signature SHA256: cd92cba4aaa71aa50e2445a87f624304e8865d5e655e1912349e1fa9f67c5819.
