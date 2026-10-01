# BP-DirichletPadicLFunctions: Kubert prime-root partition and internal fiber sum

Codex / codex-7e92bd same-worker issue #713 continuation after PR #5440,
merged 6784b4d05106dfee290a13f28041055f7cdc3946 with head 07f27fd5e92e435edae4c4b3a0d72a8de0b43b86.
Original claim5854790528, winning bot5854791937; no additional claim.
Review #390 remains unclaimed.

## Delivered and remaining

Plans coprime scalar bijectivity on actual level kernels, uniqueness and primitiveness of the lower root, the two-order root classification and disjoint strata, actual complement equivalence with point-value API, complete root-sum and cardinality identities, and the split internal quotient relation.

Totals: 1549 unchecked nodes (21 definitions, 840 lemmas, 137 constructions, 344 theorems, 207 comparisons), 1063 API entries,
2884 packet tests (634 on definitions/constructions),
2887 typed examples, 24 planets and 1059 baseline records.
26 findings, 18 gaps, 16 requests and zero closed stages.
All 26 source findings and seven source versions remain whole; no new finding or independent review verdict is added. The source prime-root partition is now proved, while the distinct higher-power image identification and final label elimination remain explicit.

The prime-root partition underlying Kubert Lemma 1.12 is now explicit: coprime multiplication has a unique primitive lower-level root, every remaining prime root has exact order pM, and the actual complement equivalence yields the full finite-sum and internal quotient identities. Next identify the source higher-power image Y_p with that primitive pM-root fiber, prove all complete lifting fibers avoid the omitted point where required, and use the two valid distribution relations to recover its label. Then perform induction on exceptional primary coordinates and prime factors for composite-level Proposition 1.9. The independent Cartan or rational-model rank lower bound is still required for freeness and internal/global relation equality. Preserve finite parity ranks and Tate conventions; all Gamma, Coleman/LAD, Katz/Fermat, external [K-L], unidentified [L], Stickelberger, Ferrero–Greenberg and RD.6 boundaries remain, including the p=3, 2/13 nonintegral-mean witness. All 18 gaps and 16 requests remain; zero stages close.

## Reading and validation

Kubert 185 Lemma 1.12 and its displayed prime-root relation were reread against the already-read full article. The lower primitive root and complete higher primitive part are derived rather than assumed. Native coprime inverse-exponent and order formulas, divisor-coprimality, prime-order cases, finite-sum partition, subsingleton evaluation and natural cardinality were read at the pinned sources. The additive-monoid sum theorem retains the weakest codomain needed.

All 1535 predecessor nodes, 1055 baseline records, 26 findings, requests and sourceVersions remain whole. This checkpoint adds 14 nodes, 14 named suggested declarations and 20 typed examples. The indexed blueprint, four-file intake, whitespace, preservation, API/test parity and versioned-source checks pass. The graph has 1809 reachable nodes, 7908 edges and 1222 native leaves and is acyclic. Its stage request leaves are PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3, LocallyAnalyticDistributions:L1, AdicSpacesPartII:F1, AdicSpacesPartII:R2, PadicDifferentialEquationsAndRigidCohomology:RD.0, PadicDifferentialEquationsAndRigidCohomology:RD.4, PadicHodgeTheory:P7:annulus-foundations, PadicMeasuresIwasawaAlgebras:L2, LocallyAnalyticDistributions:L1, LocallyAnalyticDistributions:L0, LocallyAnalyticDistributions:L0, ColemanIntegration:L0, PadicDifferentialEquationsAndRigidCohomology:RD.6, PadicDifferentialEquationsAndRigidCohomology:RD.6. Every new route terminates in native order, coprimality, finite-sum, subgroup or quotient APIs and the previously established exact-level interfaces. No new supplier-stage leaf or duplicated owner is introduced.

**The full current suggested module was NOT COMPILED.** Its real native import requires TauCeti.NumberTheory.ArithmeticFunction.TwistedDivisorSum. No matching existing artifact was found; WORKERS.md prohibits building the native library. Current compiler exit code, error count and warning count are unavailable, not zero. The exact named signatures and native source were reviewed. PR4773 remains the last compiled full predecessor, with zero errors and1,803 expected placeholder warnings; that receipt does not validate this new module.

The current source closure covers 3608 pinned Mathlib modules and 29 pinned Tau Ceti modules. Only 28 Tau module artifacts are available and hash-verified. The 140 available artifact files and the previously compiled332-node PMIA artifact are checked as partial dependencies. The current369-node supplier source preserves the older interface; no current-module compilation against either revision is claimed. Existing builds only were inspected; no setup, update, cache fetch or native build occurred.

The complete probe retains #5440 verbatim and adds one concrete equivalence and 13 complete lemmas. Totals are 78 definitions and 946 lemmas with zero placeholders. All 14 suggested declarations and 20 typed tests preserve exact orders, prime/coprime hypotheses and complete actual fibers. Finite-sum transport works in every additive commutative monoid; the quotient specialization keeps its actual preimage certificate. The separate probe compiles against 2982 pinned Mathlib modules and 7 pinned Tau Ceti modules with zero errors, warnings or placeholders. Full suggested module NOT COMPILED because the pinned TwistedDivisorSum artifact remains unavailable. Existing PMIA/Teichmuller artifacts remain hash-verified partial dependencies; no native library was built. General roadmap declarations remain unchecked.

Independent exact controls cover 64 prime/base-level/dimension combinations, 2,572 primitive base points and complete fibers, 34,012 roots, 2,572 unique lower roots and complement bijections, 2,572 exact integer sum and cardinality identities, six unit-base fibers and 64 coprime scalar permutations. Explicit examples reject composite-degree classification and omission of coprimality. Independent exact rational enumeration in dimensions one and two, primes 2,3,5 and coprime lower levels through 16. Actual root orders, the unique lower-level root, point-preserving complement bijections, free-abelian integer sum identities and cardinality identities are checked before quotienting. Finite controls are not Lean certificates. The largest observed discrepancy is 0.

All 76 captured inputs remain byte-identical after actual merge of #5440. The issue body and original winning claim, blocked unclaimed review #390, policies, reviewed library audit, ownership interfaces and exact four predecessor outputs remain guarded. The proof reuses native element orders, level kernels, coprimality and finite sums; it adds the actual source root partition and no generic replacement carrier or supplier request.

The publication guard at 922d4b9cac90c9a35f63f11fba577fb274426035 checks 76 inputs,
four predecessor outputs, unchanged issue text, the original winning claim
and unclaimed review #390.
Suggested SHA256: `e6f2f587f01d750010328630644ed61b01c0936ed7a9b489ee95051a1bc3bc97`.
Native probe SHA256: `39dfd265364c94eae7b36df14532def0a56808b002dd9ac417220c5f2ae1ef1d`.

One reusable worktree and one Lean process at a time were used. All compiler
processes have ended. Exactly the four authorized deliverables change.

Retain KubertPrimeFiberSplittingProbe.lean and its compiler/result/source audit, finite
control code and results, the full-module NOT-COMPILED receipt and source
audit, artifact-availability and source-review assessment, dependency and
preservation receipts, captured inputs and guard, and exact submitted files
with remote receipts. These are retained with this PR's local evidence;
scratch is retired after submission. The seven-module Teichmuller reuse receipt and artifact hashes are retained alongside the artifact audit. No private path or source PDF is published.

The separate partial signature file also compiled with zero errors and 4,783 expected placeholder warnings across 3,604 pinned source modules. It includes all 14 new named declarations and 20 tests, and retains the documented 4777–4791 omissions. This is not a full-file compilation. Partial signature SHA256: 763c11194a0aad4c0ad55e1814addbc67ad47e1797c8b1e0a4a366463d2f6841.
