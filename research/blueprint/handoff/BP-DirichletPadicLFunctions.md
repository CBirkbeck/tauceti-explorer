# BP-DirichletPadicLFunctions: Cyclic digits and the Gross–Koblitz fractional-part exponent

Codex / codex-7e92bd same-worker issue #713 continuation after PR #5339,
merged 4ce1e7fbd81ead490aa9d6266b246747dc879428 with head b58657f1c257f07388d39b29298ff0a10485dede.
Original claim5854790528, winning bot5854791937; no additional claim.
Review #390 remains unclaimed.

## Delivered and remaining

Plans the exact finite Frobenius orbit, Euclidean carry, chosen-period sum, reversed native digit reconstruction, native positive fractional-part comparison and unique p-adic rational representatives. The source units digit and nonzero-class restrictions are explicit.

Totals: 1035 unchecked nodes (2 definitions, 439 lemmas, 104 constructions, 293 theorems, 197 comparisons), 778 API entries,
1976 packet tests (450 on definitions/constructions),
1979 typed examples, 24 planets and 780 baseline records.
18 findings, 18 gaps, 14 requests and zero closed stages.
All18 source findings and all four sourceVersions remain whole, including E18 awaiting independent review. No new finding or review verdict is added.

The actual cyclic numerators and Euclidean carries now reconstruct the integer numerator in native base-p digits, give the positive fractional-part exponent, and identify the positive p-adic reflection residues with the preceding carry. This supplies the arithmetic content of Gross–Koblitz Lemmas2.4 and2.11(1), including exact zero exclusions, leading zeros and the source z_f units digit. Next combine reflection with the digit parity to prove the source elementary Jacobi case Lemma2.5, and identify the mod-p Gamma factorial product used in Lemma2.11(3). The exact negative Gauss-sum convention, fixed additive character and compatible π, Katz’s Fermat-curve Frobenius limit2.7, and Stickelberger’s leading Gauss congruence still require their mathematical constructions and proof-source/owner work. E18’s period-weighted distribution repair remains unproved and unused. Ferrero–Greenberg’s proof and all analytic supplier requirements remain open. All18 gaps and14 requests remain; no stage closes.

## Reading and validation

Rereads the complete proof of Gross–Koblitz Lemma2.4 on published572–573 and Lemma2.11 on575 from the retained published scan. The complete paper reading from5339 remains current. Reads native interval reduction and its equality characterization, native little-endian digit evaluation, congruence multiplication, coprimality and positive-power statements in full at the pin. Bounded public searches for Gross–Koblitz on Lean Zulip/Mathlib and cyclic-digit PRs located no matching implementation lead; unrelated results were not used. The pinned declarations are the actual design baseline. The source Katz and Stickelberger citations remain proof-source obligations.

All 1015 predecessor nodes, 772 baseline records, 18 findings, requests and sourceVersions remain whole. This checkpoint adds 20 nodes, 22 named suggested declarations and 41 typed examples. The indexed blueprint, four-file intake, whitespace, preservation, API/test parity and versioned-source checks pass. The graph has 1295 reachable nodes, 6214 edges and 950 native leaves and is acyclic. Its stage request leaves are PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3, LocallyAnalyticDistributions:L1, AdicSpacesPartII:F1, AdicSpacesPartII:R2, PadicDifferentialEquationsAndRigidCohomology:RD.0, PadicDifferentialEquationsAndRigidCohomology:RD.4, PadicHodgeTheory:P7:annulus-foundations, PadicMeasuresIwasawaAlgebras:L2, LocallyAnalyticDistributions:L1, LocallyAnalyticDistributions:L0, LocallyAnalyticDistributions:L0, ColemanIntegration:L0. All twenty new nodes have no unresolved stage leaves. They use existing positive-residue nodes and native arithmetic; all14 supplier requests remain whole.

**The full current suggested module was NOT COMPILED.** Its real native import requires TauCeti.NumberTheory.ArithmeticFunction.TwistedDivisorSum. No matching existing artifact was found; WORKERS.md prohibits building the native library. Current compiler exit code, error count and warning count are unavailable, not zero. The exact named signatures and native source were reviewed. PR4773 remains the last compiled full predecessor, with zero errors and1,803 expected placeholder warnings; that receipt does not validate this new module.

The current source closure covers 3604 pinned Mathlib modules and 29 pinned Tau Ceti modules. Only 28 Tau module artifacts are available and hash-verified. The 140 available artifact files and the previously compiled332-node PMIA artifact are checked as partial dependencies. The current369-node supplier source preserves the older interface; no current-module compilation against either revision is claimed. Existing builds only were inspected; no setup, update, cache fetch or native build occurred.

The composite probe preserves the PR5339 native24definitions311lemmas verbatim and adds two actual arithmetic definitions and20 complete lemmas, including the two routine positive-denominator/coprimality helpers. It uses existing native toIocMod and Nat.ofDigits. No Gamma, Gauss formula or analytic comparison is assumed. The separate probe compiles against 2910 pinned Mathlib modules and 7 pinned Tau Ceti modules with zero errors, warnings or placeholders. No native library is built. Existing PMIA/Teichmuller artifacts remain hash-verified partial dependencies. The full suggested module is NOT COMPILED because pinned TwistedDivisorSum lacks a compatible existing artifact. General roadmap declarations remain unchecked.

Exact finite controls check orbit bounds and periods, quotient-remainder recurrences, rational positive fractional parts, exponent sums, reversed digit reconstruction, units digits and p-adic rational residues; zero-class and wrong-order counterexamples are retained. Exact Python integers and Fraction arithmetic only. Tests use the literal modular orbit, Euclidean quotients and positive fractional part; a separate repeated-division algorithm checks native little-endian digit order with zero padding. Modular inverses at three precisions check the actual rational representatives and reflection residues. Finite controls support the complete Lean proofs and are not a formal proof for arbitrary p-adic limits. The largest observed discrepancy is 0 in every exact rational and finite-ring identity.

Capture at 285d741d94572947b02d3ceec150204ea9fd4370 changes only the source registry and its rendered register among72 guarded inputs after merged5339. The complete semantic delta is the own E18 row from that PR, exactly matching its published text, correction boundary, counterexamples and searches, awaiting independent review. All older rows and other fields remain unchanged; the Markdown register equals its renderer output. No supplier, policy, issue text or review verdict changes.

The publication guard at 285d741d94572947b02d3ceec150204ea9fd4370 checks 72 inputs,
four predecessor outputs, unchanged issue text, the original winning claim
and unclaimed review #390.
Suggested SHA256: `689c434e34eb3c602d1090dad2355a9db214c34665a4c652573a4277f1e28c8d`.
Native probe SHA256: `d6a148ef110ec463ce7da6dfd950aaa9f4ab840dd0009c9726d1721f0bd30f17`.

One reusable worktree and one Lean process at a time were used. All compiler
processes have ended. Exactly the four authorized deliverables change.

Retain GrossKoblitzDigitsProbe.lean and its compiler/result/source audit, finite
control code and results, the full-module NOT-COMPILED receipt and source
audit, artifact-availability and source-review assessment, dependency and
preservation receipts, captured inputs and guard, and exact submitted files
with remote receipts. These are retained with this PR's local evidence;
scratch is retired after submission. The seven-module Teichmuller reuse receipt and artifact hashes are retained alongside the artifact audit. No private path or source PDF is published.

The separate partial signature file also compiled with zero errors and 3,319 expected placeholder warnings across 3,600 pinned source modules. It includes all 22 new named declarations and 41 tests, and retains the documented 4777–4791 omissions. This is not a full-file compilation. Partial signature SHA256: 2cb3968de8587f48572d0aaf7c81e8249e067f9610c54f43f57ec8f0747c5f28.
