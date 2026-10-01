# BP-DirichletPadicLFunctions: Actual characters for the elementary Gross–Koblitz pair

Codex / codex-7e92bd same-worker issue #713 continuation after PR #5343,
merged e9cb0d2143a2c2b2787d9b1f2fc36b7f01b8342f with head 38ec7468201f404b68593cafaacfcc87ca148f6a.
Original claim5854790528, winning bot5854791937; no additional claim.
Review #390 remains unclaimed.

## Delivered and remaining

Plans two native character compositions, their exponent and trace APIs, and the elementary source Gauss/Gamma comparison with nontriviality, primitivity and normalization derived from the constructions.

Totals: 1063 unchecked nodes (2 definitions, 459 lemmas, 106 constructions, 298 theorems, 198 comparisons), 795 API entries,
2047 packet tests (458 on definitions/constructions),
2050 typed examples, 24 planets and 800 baseline records.
18 findings, 18 gaps, 14 requests and zero closed stages.
All18 findings and all four sourceVersions remain whole, including E18 awaiting independent review. No new finding or review verdict is added.

The source inverse-Teichmuller and chosen-root trace characters are now constructed using native APIs, with their exponent algebra, nontriviality, primitivity and negative-one normalization proved. The elementary Jacobi comparison now uses the actual complementary source characters without abstract character hypotheses. Next construct and normalize the compatibleπ in a suitable local coefficient field, with π^(p−1)=−p and π≡ζ−1 modulo(ζ−1)². The full formula still needs the Katz/Fermat Frobenius limit2.7 and the Gauss-side Stickelberger leading congruence; the Gamma-side factorial product alone does not supply them. Read the exact primary proof sources and route any missing interfaces by ownership. E18’s repair remains unproved/unused and the Ferrero–Greenberg proof and analytic supplier obligations remain. All18 gaps and14 requests remain; no stage closes.

## Reading and validation

Uses the complete prior Gross–Koblitz source reading and its fixed conventions, and rereads the full pinned local-field Teichmuller module. Reads native unit-character extension and coefficient composition, finite-field power criterion, chosen-root additive character, trace pairing, trace-on-scalars and primitivity proofs. Twelve new native baseline records are added. A bounded public Mathlib/Lean-Zulip search yielded no relevant lead; unrelated search results are not mathematical inputs and no absence claim is made.

All 1050 predecessor nodes, 788 baseline records, 18 findings, requests and sourceVersions remain whole. This checkpoint adds 13 nodes, 20 named suggested declarations and 28 typed examples. The indexed blueprint, four-file intake, whitespace, preservation, API/test parity and versioned-source checks pass. The graph has 1323 reachable nodes, 6316 edges and 970 native leaves and is acyclic. Its stage request leaves are PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3, LocallyAnalyticDistributions:L1, AdicSpacesPartII:F1, AdicSpacesPartII:R2, PadicDifferentialEquationsAndRigidCohomology:RD.0, PadicDifferentialEquationsAndRigidCohomology:RD.4, PadicHodgeTheory:P7:annulus-foundations, PadicMeasuresIwasawaAlgebras:L2, LocallyAnalyticDistributions:L1, LocallyAnalyticDistributions:L0, LocallyAnalyticDistributions:L0, ColemanIntegration:L0. All13 new nodes terminate in the existing Gamma/arithmetic chain or native library facts, with no new unresolved stage leaves. Choice of the explicit coefficient field/root and the compatibleπ boundary remain stated; all14 supplier requests remain whole.

**The full current suggested module was NOT COMPILED.** Its real native import requires TauCeti.NumberTheory.ArithmeticFunction.TwistedDivisorSum. No matching existing artifact was found; WORKERS.md prohibits building the native library. Current compiler exit code, error count and warning count are unavailable, not zero. The exact named signatures and native source were reviewed. PR4773 remains the last compiled full predecessor, with zero errors and1,803 expected placeholder warnings; that receipt does not validate this new module.

The current source closure covers 3604 pinned Mathlib modules and 29 pinned Tau Ceti modules. Only 28 Tau module artifacts are available and hash-verified. The 140 available artifact files and the previously compiled332-node PMIA artifact are checked as partial dependencies. The current369-node supplier source preserves the older interface; no current-module compilation against either revision is claimed. Existing builds only were inspected; no setup, update, cache fetch or native build occurred.

The complete native probe preserves5343 verbatim and adds two definitions and17 lemmas, including one routine Teichmuller negative-one helper. Actual native local-field, character and trace structures are used; no new carrier or assumed target identity is introduced. Suggested definitions bind all required native instances explicitly, and Gamma signatures specialize moritaGamma. The separate probe compiles against 2910 pinned Mathlib modules and 7 pinned Tau Ceti modules with zero errors, warnings or placeholders. No native library is built. Existing PMIA/Teichmuller artifacts remain hash-verified partial dependencies. The full suggested module is NOT COMPILED because pinned TwistedDivisorSum lacks a compatible existing artifact. General roadmap declarations remain unchecked.

Exact controls evaluate actual inverse powers and trace characters over F2,F3,F5,F7,F9,F27, Teichmuller lifts modulo three p-powers, and750 literal complementary negative Gauss pairs by integer cyclotomic reduction. The F27 case detects that a primitive trace character can have value1 at1. Exact finite fields use Fp, F9=F3[u]/(u²+1) and F27=F3[u]/(u³−u−1). The explicit primitive generator enumerates every nonzero element. Trace is computed by the Frobenius sum. Teichmuller lifts in the corresponding polynomial rings modulo p,p²,p³ are computed by repeated q-powers, then checked for reduction, torsion and multiplicativity. Characters use inverse powers and the actual trace; source Gauss pairs use complementary exponents and exact cyclotomic polynomial reduction. All computations use integers. These bounded examples do not construct a general unramified extension or the compatible π. The largest observed discrepancy is 0 in every exact finite-ring or polynomial-remainder identity.

Capture at e9cb0d2143a2c2b2787d9b1f2fc36b7f01b8342f has zero changes among72 guarded inputs after merged5343; whole issue body unchanged. No policy, supplier, source finding or review verdict changed.

The publication guard at 63a6be4f8292f2aaa42380b8e1c0cf8b822192cd checks 72 inputs,
four predecessor outputs, unchanged issue text, the original winning claim
and unclaimed review #390.
Suggested SHA256: `c22a3c00e2a91abc66456030afa74223494ae134ca025b63c2ea6badb0d15303`.
Native probe SHA256: `6592c1384baecfa282d2b18d450cef4752ba79b31a573852534c928c8c7c1e56`.

One reusable worktree and one Lean process at a time were used. All compiler
processes have ended. Exactly the four authorized deliverables change.

Retain GrossKoblitzCharactersProbe.lean and its compiler/result/source audit, finite
control code and results, the full-module NOT-COMPILED receipt and source
audit, artifact-availability and source-review assessment, dependency and
preservation receipts, captured inputs and guard, and exact submitted files
with remote receipts. These are retained with this PR's local evidence;
scratch is retired after submission. The seven-module Teichmuller reuse receipt and artifact hashes are retained alongside the artifact audit. No private path or source PDF is published.

The separate partial signature file also compiled with zero errors and 3,425 expected placeholder warnings across 3,600 pinned source modules. It includes all 20 new named declarations and 28 tests, and retains the documented 4777–4791 omissions. This is not a full-file compilation. Partial signature SHA256: 767e4418e8c2aa10ab4f48977368b41e1915cfbe25b85cbc4cefdd0157807186.
