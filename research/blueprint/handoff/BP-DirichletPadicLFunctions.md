# BP-DirichletPadicLFunctions: The source-normalized Gross–Koblitz pi

Codex / codex-7e92bd same-worker issue #713 continuation after PR #5345,
merged 4a95796199907a1eac6621cc147fc37f8c114b47 with head 5a61ea0a7978b618d47a8d9a97145ef2afc6a3cc.
Original claim5854790528, winning bot5854791937; no additional claim.
Review #390 remains unclaimed.

## Delivered and remaining

Plans the cyclotomic unit product and normalized integral and field pi, with actual native Hensel proofs, power/congruence/uniqueness APIs, ring-map compatibility and an exact ternary example.

Totals: 1083 unchecked nodes (2 definitions, 474 lemmas, 109 constructions, 300 theorems, 198 comparisons), 813 API entries,
2078 packet tests (467 on definitions/constructions),
2081 typed examples, 24 planets and 815 baseline records.
18 findings, 18 gaps, 14 requests and zero closed stages.
All18 findings and all four sourceVersions remain whole, including E18 awaiting independent review. No new finding or review verdict is added.

The source-compatible pi is now constructed and uniquely normalized in the integral domain and in a native local coefficient field containing the chosen primitive root. The field formulation has an integral congruence witness and agrees with the integral construction. Next resolve the actual proof inputs for the full Gauss formula: read the cited Katz/Fermat Frobenius limit2.7 and the Gauss-side Stickelberger leading congruence, or a complete accessible primary proof that supplies precisely those interfaces. The Gamma-side factorial product and elementary Jacobi pair do not supply those inputs. Identifying the source cyclotomic completion and its uniformizer assertion is distinct from the arbitrary-local-field normalization proved here; reuse native local-field theory. E18’s repair remains unproved/unused, and the Ferrero–Greenberg proof and analytic supplier obligations remain. All18 gaps and14 requests remain; no stage closes.

## Reading and validation

Rereads Gross–Koblitz p.570 from the retained complete13-page source reading and fixes both defining conditions ofpi. Reads the full pinned native local-field Henselian and roots-of-unity modules, the Henselian class, geometric-sum and unit-cancellation proofs, Wilson and factorial product, quotient kernel, primitive-root product and injective-map APIs. Fifteen new native baseline records are added. Bounded public Mathlib/Lean-community searches returned unrelated results; no search result is used as a mathematical input or as evidence of global absence.

All 1063 predecessor nodes, 800 baseline records, 18 findings, requests and sourceVersions remain whole. This checkpoint adds 20 nodes, 23 named suggested declarations and 31 typed examples. The indexed blueprint, four-file intake, whitespace, preservation, API/test parity and versioned-source checks pass. The graph has 1343 reachable nodes, 6375 edges and 984 native leaves and is acyclic. Its stage request leaves are PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3, LocallyAnalyticDistributions:L1, AdicSpacesPartII:F1, AdicSpacesPartII:R2, PadicDifferentialEquationsAndRigidCohomology:RD.0, PadicDifferentialEquationsAndRigidCohomology:RD.4, PadicHodgeTheory:P7:annulus-foundations, PadicMeasuresIwasawaAlgebras:L2, LocallyAnalyticDistributions:L1, LocallyAnalyticDistributions:L0, LocallyAnalyticDistributions:L0, ColemanIntegration:L0. All20 new nodes terminate in preceding pi nodes and pinned native library facts, with no new unresolved stage leaves or new supplier request. Native Henselian and local-field theory is reused. All14 existing supplier requests remain whole.

**The full current suggested module was NOT COMPILED.** Its real native import requires TauCeti.NumberTheory.ArithmeticFunction.TwistedDivisorSum. No matching existing artifact was found; WORKERS.md prohibits building the native library. Current compiler exit code, error count and warning count are unavailable, not zero. The exact named signatures and native source were reviewed. PR4773 remains the last compiled full predecessor, with zero errors and1,803 expected placeholder warnings; that receipt does not validate this new module.

The current source closure covers 3608 pinned Mathlib modules and 29 pinned Tau Ceti modules. Only 28 Tau module artifacts are available and hash-verified. The 140 available artifact files and the previously compiled332-node PMIA artifact are checked as partial dependencies. The current369-node supplier source preserves the older interface; no current-module compilation against either revision is claimed. Existing builds only were inspected; no setup, update, cache fetch or native build occurred.

The complete native probe preserves5345 verbatim and adds three definitions and26 lemmas, including nine routine Hensel, residue, factorial and Wilson helpers. It uses existing native carriers and proves both defining conditions without assuming the target normalization. Suggested definitions explicitly retain all required native instances. The separate probe compiles against 2916 pinned Mathlib modules and 7 pinned Tau Ceti modules with zero errors, warnings or placeholders. No native library is built. Existing PMIA/Teichmuller artifacts remain hash-verified partial dependencies. The full suggested module is NOT COMPILED because pinned TwistedDivisorSum lacks a compatible existing artifact. General roadmap declarations remain unchecked.

Exact cyclotomic quotient controls cover16 prime/precision pairs, the opposite-root sign, four ternary formulas,36 precision-reduction comparisons and three exhaustive simple-root checks. They also exhibit multiple normalized pi roots in finite zero-divisor quotients, explaining why the domain hypothesis is retained. Exact integer polynomial reduction modulo Phi_p(1+t) and p^r for p=3,5,7,11 and r=1,2,3,4; checked Newton inverses, power/congruence identities, precision-reduction compatibility, and exhaustive simple-root enumeration in three small finite quotients. These finite quotients have zero divisors and do not certify the domain-only pi uniqueness theorem. The largest observed discrepancy is 0.

Capture at d0d3b4f921ac65dd24100723078f958710dd7ce7 has zero changes among72 guarded inputs after merged5345; whole issue body unchanged. No policy, supplier, source finding or review verdict changed.

The publication guard at 020fe5c3c4c0f0f5455a456dd3be09429ed3e33b checks 72 inputs,
four predecessor outputs, unchanged issue text, the original winning claim
and unclaimed review #390.
Suggested SHA256: `27b0e02967a054a36724172eb4440c0fe369d00fb81fafa014b39483b6cc1ba3`.
Native probe SHA256: `0323468e88c73d768401214ea22f88fc7a52686e02f9dff9a75e64d850b34050`.

One reusable worktree and one Lean process at a time were used. All compiler
processes have ended. Exactly the four authorized deliverables change.

Retain GrossKoblitzPiProbe.lean and its compiler/result/source audit, finite
control code and results, the full-module NOT-COMPILED receipt and source
audit, artifact-availability and source-review assessment, dependency and
preservation receipts, captured inputs and guard, and exact submitted files
with remote receipts. These are retained with this PR's local evidence;
scratch is retired after submission. The seven-module Teichmuller reuse receipt and artifact hashes are retained alongside the artifact audit. No private path or source PDF is published.

The separate partial signature file also compiled with zero errors and 3,479 expected placeholder warnings across 3,604 pinned source modules. It includes all 23 new named declarations and 31 tests, and retains the documented 4777–4791 omissions. This is not a full-file compilation. Partial signature SHA256: ca14c04c14ca928eb97aa1f96cded85930f4e86c877afefcf9a19abe5961ca1e.
