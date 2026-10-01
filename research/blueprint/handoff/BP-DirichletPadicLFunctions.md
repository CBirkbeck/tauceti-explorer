# BP-DirichletPadicLFunctions: Kubert internal quotient and admissible-level transport

Codex / codex-7e92bd same-worker issue #713 continuation after PR #5437,
merged 8df986b60a573fb47a05af1af9dbf52c182074a0 with head 36d83b32ae9af223cf527838dfe6bb3713a3cb5a.
Original claim5854790528, winning bot5854791937; no additional claim.
Review #390 remains unclaimed.

## Delivered and remaining

Plans the actual inclusion-fiber equivalence, weighted relator transport, native internal quotient map with point-label and functor laws, transitivity of admissibility, source-set inclusion, source-span transport and the lower-generation induction interface.

Totals: 1535 unchecked nodes (21 definitions, 827 lemmas, 136 constructions, 344 theorems, 207 comparisons), 1058 API entries,
2864 packet tests (630 on definitions/constructions),
2867 typed examples, 24 planets and 1055 baseline records.
26 findings, 18 gaps, 16 requests and zero closed stages.
All 26 source findings and seven source versions remain whole; no new finding or independent review verdict is added. The source lower-level induction is stated as transport through an actual quotient homomorphism, without an unproved injectivity assertion.

The actual full-fiber equivalence and weighted relator identity now construct internal quotient maps along all positive level divisors, with point-label, identity and composition laws. Admissibility is transitive, the actual source sets are monotone along admissible levels, and lower-level generation transports into the larger source span. Next prove Lemma 1.12 through its precise primitive fibers and then induct on exceptional primary coordinates to establish composite-level Proposition 1.9. The separate Cartan or rational-model rank lower bound remains necessary for freeness and internal/global relation equality; no injectivity of the internal level map is asserted. Preserve finite parity ranks and Tate conventions; all Gamma, Coleman/LAD, Katz/Fermat, external [K-L], unidentified [L], Stickelberger, Ferrero–Greenberg and RD.6 boundaries remain, including the p=3, 2/13 nonintegral-mean witness. All 18 gaps and 16 requests remain; zero stages close.

## Reading and validation

Kubert 182–185 supplies the exact internal-relation input condition, source union and lower admissible-level induction step. The full 179–202 body was previously read; 184–185 was reread for this continuation. Native quotient-map construction and evaluation, free abelian identity/composition, divisor coprimality and quotient multiplication were read at the pinned sources. The level-map divisibility binder is explicit so it survives replacing proof bodies by suggested placeholders.

All 1521 predecessor nodes, 1051 baseline records, 26 findings, requests and sourceVersions remain whole. This checkpoint adds 14 nodes, 14 named suggested declarations and 21 typed examples. The indexed blueprint, four-file intake, whitespace, preservation, API/test parity and versioned-source checks pass. The graph has 1795 reachable nodes, 7868 edges and 1218 native leaves and is acyclic. Its stage request leaves are PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3, LocallyAnalyticDistributions:L1, AdicSpacesPartII:F1, AdicSpacesPartII:R2, PadicDifferentialEquationsAndRigidCohomology:RD.0, PadicDifferentialEquationsAndRigidCohomology:RD.4, PadicHodgeTheory:P7:annulus-foundations, PadicMeasuresIwasawaAlgebras:L2, LocallyAnalyticDistributions:L1, LocallyAnalyticDistributions:L0, LocallyAnalyticDistributions:L0, ColemanIntegration:L0, PadicDifferentialEquationsAndRigidCohomology:RD.6, PadicDifferentialEquationsAndRigidCohomology:RD.6. Every new route terminates in native subgroup, finite-sum, coprimality, free-abelian or quotient APIs and the previously established exact-level interfaces. No new supplier-stage leaf or duplicated owner is introduced.

**The full current suggested module was NOT COMPILED.** Its real native import requires TauCeti.NumberTheory.ArithmeticFunction.TwistedDivisorSum. No matching existing artifact was found; WORKERS.md prohibits building the native library. Current compiler exit code, error count and warning count are unavailable, not zero. The exact named signatures and native source were reviewed. PR4773 remains the last compiled full predecessor, with zero errors and1,803 expected placeholder warnings; that receipt does not validate this new module.

The current source closure covers 3608 pinned Mathlib modules and 29 pinned Tau Ceti modules. Only 28 Tau module artifacts are available and hash-verified. The 140 available artifact files and the previously compiled332-node PMIA artifact are checked as partial dependencies. The current369-node supplier source preserves the older interface; no current-module compilation against either revision is claimed. Existing builds only were inspected; no setup, update, cache fetch or native build occurred.

The complete probe retains #5437 verbatim and adds two concrete constructions and 12 complete lemmas. Totals are 77 definitions and 933 lemmas, with zero placeholders. All 14 suggested declarations and 21 typed tests retain exact internal quotients, whole fibers, weights and divisibility/admissibility assumptions. No quotient injectivity is assumed. The separate probe compiles against 2982 pinned Mathlib modules and 7 pinned Tau Ceti modules with zero errors, warnings or placeholders. Full suggested module NOT COMPILED because the pinned TwistedDivisorSum artifact remains unavailable. Existing PMIA/Teichmuller artifacts remain hash-verified partial dependencies; no native library was built. General roadmap declarations remain unchecked.

Independent exact controls cover 168 level pairs in dimensions one and two through level 24, 25,920 complete fibers, 77,760 weighted-relator identities at weights zero, one and two, 260 admissible chains, 4,808 actual source inclusions, 5,200 pointwise identity maps and 8,050 point-inclusion compositions. Two counterexamples reject dropping the degree-divisibility or admissibility hypotheses. Independent exact rational level enumeration and sparse integer free-abelian relation vectors, for dimensions one and two and levels through 24. Complete fibers and weighted relators at weights zero, one and two are compared before quotienting. Admissible source sets are computed independently from exact point orders and actual CRT primary projections. These controls are not Lean proof certificates and establish no quotient injectivity, rank or freeness. The largest observed discrepancy is 0.

All 76 captured inputs remain byte-identical after actual merge of #5437. The issue body and original winning claim, blocked unclaimed review #390, policies, reviewed library audit, owner interfaces and exact four predecessor outputs remain guarded. The level map uses existing native subgroup inclusions, free abelian maps and quotient descent; no generic quotient or coprimality theory is duplicated and no supplier request is added.

The publication guard at a97a6a4a90d113e32c44e3170064aefed84548c1 checks 76 inputs,
four predecessor outputs, unchanged issue text, the original winning claim
and unclaimed review #390.
Suggested SHA256: `01477cdd57357f9879a43313aabdcb4a72a834eabca1ecd355cf313f5effcfb4`.
Native probe SHA256: `7efdf0ad997da793440271e3c6739e80c79d75f2a923e6ee88d4e296342365b1`.

One reusable worktree and one Lean process at a time were used. All compiler
processes have ended. Exactly the four authorized deliverables change.

Retain KubertAdmissibleTransportProbe.lean and its compiler/result/source audit, finite
control code and results, the full-module NOT-COMPILED receipt and source
audit, artifact-availability and source-review assessment, dependency and
preservation receipts, captured inputs and guard, and exact submitted files
with remote receipts. These are retained with this PR's local evidence;
scratch is retired after submission. The seven-module Teichmuller reuse receipt and artifact hashes are retained alongside the artifact audit. No private path or source PDF is published.

The separate partial signature file also compiled with zero errors and 4,749 expected placeholder warnings across 3,604 pinned source modules. It includes all 14 new named declarations and 21 tests, and retains the documented 4777–4791 omissions. This is not a full-file compilation. Partial signature SHA256: 2103b63c784289f4b76cdd39168fb424bdef6f8ddc218dc9d7e0b0d427646a80.
