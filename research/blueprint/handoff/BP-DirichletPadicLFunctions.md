# BP-DirichletPadicLFunctions: Integral tame values and congruences under coefficient-field extension

Codex / codex-7e92bd same-worker issue #713 continuation after PR #4868,
merged 09d801fd742dcb79be8260e4c4bbf9d3ba8ea437 with head e4d3395afc7351d8ea7e6e86955aec3fdba3da6b.
Original claim5854790528, winning bot5854791937; no additional claim.
Review #390 remains unclaimed.

## Delivered and remaining

Reuses Valuation.HasExtension and its native integer-ring map. One promoted inclusion, three all-integral-test measure comparisons, pointwise integral arithmetic-character transport and reflected evaluated congruences retain exact coefficient rings and divisors, including b=0 and p^r.

Totals: 671 unchecked nodes (1 definitions, 259 lemmas, 71 constructions, 209 theorems, 131 comparisons), 538 API entries,
1143 packet tests (303 on definitions/constructions),
1146 typed examples, 24 planets and 565 baseline records.
16 findings, 15 gaps, 11 requests and zero closed stages.
All16 findings, three source records, sourceVersions, eleven requests and fifteen gaps remain whole. No new source mistake or independent verdict.

The actual tame measure μ and ambient/intrinsic zeta measures now compare on every original-field test, and their integral realizations compare on every original-integer-ring test under the explicit native valuation-extension hypothesis. Arithmetic integral unit characters map pointwise, and evaluated intrinsic congruences are preserved and reflected at the exact image divisor. Next establish descent to the character field with its required algebraic and topological existence hypotheses; the current compatibility theorems do not supply that field or prove finite-dimensionality/completeness. The separate coefficient-field pseudomeasure evaluator remains a PMIA L3 request. Primitive Gauss nonvanishing, primitive-conductor comparisons, analytic branches, logarithmic/degree-zero values, full source extraction and the PMIA L1 completed-algebra comparison remain open.

## Reading and validation

Freshly read complete RJW published143–144 and its coefficient-ring discussion; published129 and145–146 were freshly read in the preceding checkpoint. Read whole existing integral tame constructor and inclusion APIs, intrinsic integral coefficients, arithmetic characters and all-test congruence nodes, and both existing L4 coefficient-change nodes to avoid replanning the native integer map. Read native Valuation.HasExtension with ambient assumptions, its integer algebra instance, value and order comparison, injectivity, Valuation.integer.integers, dvd_iff_le and the norm-valuation definition at the pins.

All 665 predecessor nodes, 565 baseline records, 16 findings, requests and sourceVersions remain whole. This checkpoint adds 6 nodes, 5 named suggested declarations and 10 typed examples. The indexed blueprint, four-file intake, whitespace, preservation, API/test parity and versioned-source checks pass. The graph has 927 reachable nodes, 4628 edges and 743 native leaves and is acyclic. Its stage request leaves are PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3, LocallyAnalyticDistributions:L1, AdicSpacesPartII:F1, AdicSpacesPartII:R2, PadicDifferentialEquationsAndRigidCohomology:RD.0, PadicDifferentialEquationsAndRigidCohomology:RD.4, PadicHodgeTheory:P7:annulus-foundations, PadicMeasuresIwasawaAlgebras:L2, LocallyAnalyticDistributions:L1. All six new routes use existing fine nodes and native declarations, with no new stage-request leaf. Existing whole-packet requests remain open.

**The full current suggested module was NOT COMPILED.** Its real native import requires TauCeti.NumberTheory.ArithmeticFunction.TwistedDivisorSum. No matching existing artifact was found; WORKERS.md prohibits building the native library. Current compiler exit code, error count and warning count are unavailable, not zero. The exact named signatures and native source were reviewed. PR4773 remains the last compiled full predecessor, with zero errors and1,803 expected placeholder warnings; that receipt does not validate this new module.

The current source closure covers 3601 pinned Mathlib modules and 22 pinned Tau Ceti modules. Only 21 Tau module artifacts are available and hash-verified. The105 available artifact files and the previously compiled332-node PMIA artifact are checked as partial dependencies. The current369-node supplier source preserves the older interface; no current-module compilation against either revision is claimed. Existing builds only were inspected; no setup, update, cache fetch or native build occurred.

Seven complete Mathlib-only proofs check continuity of the native integer map, integral divisibility reflection, the included-test square, an all-test comparison of actual native integral measures from their field comparisons and inclusion hypotheses, equality and congruence reflection, and the arithmetic character-value expression. These prove the transport implications, not the unchecked arithmetic constructors. The separate probe compiles against 2807 pinned Mathlib modules and 0 pinned Tau Ceti modules with zero errors, warnings or placeholders. The separate Mathlib-only probe does not import, replace or compile the missing native Tau module. General roadmap declarations remain unchecked.

Exact finite controls pass for24 profiles and48 coefficient maps:384 comparisons for each of μ, ambient ζ and intrinsic ζ,8792 arithmetic values,3456 congruence reflections,576 zero-divisor and576 equality cases,2304 prime-power precision checks and216 D=1 cases. There are615 rational-embedding divisibility checks,180 omitted-test-map negative controls and four controls distinguishing2^r from a ramified uniformizer power. Exact Gaussian-rational finite atomic models with Fraction arithmetic. At inert primes3 and7 use the minimum coefficient valuation; at2 use half the rational valuation of a²+b², the normalized valuation on Q_2(i). Identity/conjugation maps preserve integral weights and tests; rational embeddings are checked separately. These are finite algebraic controls, not constructed complete fields or approximations to the arithmetic tame measures. Four ramified controls distinguish the exact divisor2^r from (1+i)^r. The largest observed discrepancy is 0 in every asserted exact identity.

All66 captured inputs and four predecessor outputs are guarded. The partial signature check appends exactly five declarations and ten examples to the retained4868 prefix; the promoted inclusion signature already occurs once. The prefix continues to omit4777–4791. Full-module compilation remains unavailable because the pinned native TwistedDivisorSum artifact is absent; no library build is performed. The separate partial signature run has2013 expected placeholder warnings and zero errors against3573 pinned modules. Seven complete native proofs compile against2807 Mathlib modules with zero errors, warnings or placeholders. Registry-only refresh at41aae02f4f7e71af9618970b0dcce57888f0872d changes PAPER-LE-LEHUNG-LEVIN-ETAL-23/E124. All16 Dirichlet findings, all other captured mathematical inputs and four predecessor outputs are unchanged. No independent verdict on the unrelated record is claimed.

The publication guard at 3a93019ff0952407d829cb98ac00c9e387959f7e checks 66 inputs,
four predecessor outputs, unchanged issue text, the original winning claim
and unclaimed review #390.
Suggested SHA256: `7f23cd68192d6be1b6494039cf3f1deda3419fb414c03cb8293ac744b4e023cc`.
Native probe SHA256: `869440f6eca6b639151d1dafaf91103c202b5495df0f2be5310ac572cd10da36`.

One reusable worktree and one Lean process at a time were used. All compiler
processes have ended. Exactly the four authorized deliverables change.

Retain IntegralFieldComparisonProbe.lean and its compiler/result/source audit, finite
control code and results, the full-module NOT-COMPILED receipt and source
audit, artifact-availability and source-review assessment, dependency and
preservation receipts, captured inputs and guard, and exact submitted files
with remote receipts. These are retained with this PR's local evidence;
scratch is retired after submission. No private path or source PDF is published.
