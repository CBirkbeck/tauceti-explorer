# BP-DirichletPadicLFunctions: Uniform translated series and the continuous mean difference

Codex / codex-7e92bd same-worker issue #713 continuation after PR #5293,
merged c96606986f38fd29ddc2c848c40f8e9b4740c2ca with head 75ac393afcaef110a5cf40d63e82912e4ef3e48e.
Original claim5854790528, winning bot5854791937; no additional claim.
Review #390 remains unclaimed.

## Delivered and remaining

Plans the coefficient embedding isometry, actual limiting coefficient bound, uniform/continuous series, sharp ultrametric tail estimate, ordinary difference function, positive-exponent formula, continuity, norm bound and comparison with the actual finite mean differences.

Totals: 903 unchecked nodes (2 definitions, 370 lemmas, 98 constructions, 255 theorems, 178 comparisons), 740 API entries,
1669 packet tests (417 on definitions/constructions),
1672 typed examples, 24 planets and 721 baseline records.
16 findings, 17 gaps, 13 requests and zero closed stages.
All16 own source findings, sources and sourceVersions remain whole. The newly read unrelated awaiting-review registry entry is not promoted to an independent verdict.

The translated coefficient series now has native uniform convergence, continuity and a quantitative ultrametric tail bound on the entire closed shift disc. The actual difference function has zero/constant/linear/geometric normalization, its positive-power series and norm bound, and is identified with the limit of the real finite mean differences. The actual LAD analytic carrier, larger-radius derivative compatibility and coefficient convergence witnesses remain open. Next establish the finite integer boundary identity and its logarithmic/Gamma comparison on pℤ_p at odd p and8ℤ₂; analyticity is not inferred from continuity. Gross–Koblitz and Ferrero–Greenberg retain the recorded source-reading and normalization work. All17 gaps and13 requests remain open.

## Reading and validation

Retains the full Morita1975/KL1964 readings and the immediately preceding direct reread of Morita pp.258–260. Reads the native isometry criterion/continuity, uniform-series and continuousOn_tsum statements and proofs, full product-to-sum tail generators with their topological-group hypotheses, and the existing norm/ geometric-series controls.

All 893 predecessor nodes, 715 baseline records, 16 findings, requests and sourceVersions remain whole. This checkpoint adds 10 nodes, 15 named suggested declarations and 20 typed examples. The indexed blueprint, four-file intake, whitespace, preservation, API/test parity and versioned-source checks pass. The graph has 1163 reachable nodes, 5770 edges and 894 native leaves and is acyclic. Its stage request leaves are PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3, LocallyAnalyticDistributions:L1, AdicSpacesPartII:F1, AdicSpacesPartII:R2, PadicDifferentialEquationsAndRigidCohomology:RD.0, PadicDifferentialEquationsAndRigidCohomology:RD.4, PadicHodgeTheory:P7:annulus-foundations, PadicMeasuresIwasawaAlgebras:L2, LocallyAnalyticDistributions:L1, LocallyAnalyticDistributions:L0, LocallyAnalyticDistributions:L0. The embedding criterion routes directly to native Mathlib. The remaining nine application nodes inherit the existing LAD L0 leaf through the source coefficient-limit inputs; existing precise requests remain whole, with no new owner or cycle.

**The full current suggested module was NOT COMPILED.** Its real native import requires TauCeti.NumberTheory.ArithmeticFunction.TwistedDivisorSum. No matching existing artifact was found; WORKERS.md prohibits building the native library. Current compiler exit code, error count and warning count are unavailable, not zero. The exact named signatures and native source were reviewed. PR4773 remains the last compiled full predecessor, with zero errors and1,803 expected placeholder warnings; that receipt does not validate this new module.

The current source closure covers 3604 pinned Mathlib modules and 29 pinned Tau Ceti modules. Only 28 Tau module artifacts are available and hash-verified. The 140 available artifact files and the previously compiled332-node PMIA artifact are checked as partial dependencies. The current369-node supplier source preserves the older interface; no current-module compilation against either revision is claimed. Existing builds only were inspected; no setup, update, cache fetch or native build occurred.

The complete composite probe preserves19 definitions and163 lemmas from PR5293, adds an explicit native FunctionSeries import and proves1 actual function definition and16 lemmas. Two native helper lemmas supply routine coefficient norm and summability steps; the fifteen suggested named declarations comprise the ten new nodes and five function APIs. The separate probe compiles against 2826 pinned Mathlib modules and 7 pinned Tau Ceti modules with zero errors, warnings or placeholders. The separate complete probe retains the explicit PMIA integer-ring equivalence and seven verified existing Teichmuller artifacts. It constructs no analytic carrier and rebuilds no native module. The full suggested file remains NOT COMPILED because its pinned TwistedDivisorSum artifact is missing. General roadmap declarations remain unchecked.

Exact rational checks pass50 embedding-distance cases,42 coefficient bounds,330 polynomial tails,60 zero-term-removal identities,70 difference norm bounds,100 geometric tails and40 actual linear-mean differences, including zero/negative/boundary shifts and cutoffN=0. Exact rational tests at p=2,3 on the closed shift disc, including positive/negative boundary, zero, interior and q/5 shifts. Six finitely supported coefficient families have C=R=1 and verify all tail cutoffs through two beyond their degree. Geometric closed forms independently check ten tail cutoffs including N=0. The actual angular finite mean of A(u)=u is unchanged by these shifts at four depths. These controls check formulas and normalization; uniform convergence and continuity are established in the complete native probe. The largest observed discrepancy is 0 (all exact identities and inequalities).

Post-merge capture ed5dbe0e3ffbfbc83fe8b250553caa54d0abdd63 changes four tracked inputs; all complete diffs were read. The registry adds only awaiting-review ArithmeticStatistics/E675, concerning the independent-pair probability proof in Higher Rédei reciprocity AppendixA: the identity is retained while an invariant weighted average replaces the incomplete partition argument (m=1 gives1/6 versus1/3). Its register rendering agrees. No Dirichlet source finding changes. AlgebraicCodingTheory changes only accepted review/history metadata, retaining its rootless-rank24 ownership gap. Chebotarev CH-L16 clarifies the surrounding Theorem5.2 prime-selection proof and the detection condition ζ∉F̃(ζ+ζ^-1), keeping the extra w₂(F) coprimality assumption separate; its pairs and other links remain unchanged. Neither adjustment supplies a new Dirichlet dependency. These are read input records, not independently verified source corrections. Policies, upstream analytic suppliers and native baseline remain unchanged. Publication refresh reads the full registry/register change to EllipticRegulators/E7: the explanation now keeps the Lecture10 finite Fourier transform normalization C^(-2), equal to C^(-1) times the corrected Lecture11 transform, rather than the formerly conflated C^(-1) sum. The recorded sign correction, status and all other fields are unchanged. This is an input-record correction, not a fresh independent source verification. Own Dirichlet findings, analytic suppliers, policies and proof sources are unchanged.

The publication guard at 0b4172110f86a14331ddf065536514089abfc957 checks 72 inputs,
four predecessor outputs, unchanged issue text, the original winning claim
and unclaimed review #390.
Suggested SHA256: `82ea3247d6010b0f70a9d36c86e929e4d78af117a2504075bed02d7e163d2a39`.
Native probe SHA256: `5c03e192eeebea21d13b0c39699a36b169581419d8b4ed3f3439a32768cb9bb5`.

One reusable worktree and one Lean process at a time were used. All compiler
processes have ended. Exactly the four authorized deliverables change.

Retain MoritaShiftContinuityProbe.lean and its compiler/result/source audit, finite
control code and results, the full-module NOT-COMPILED receipt and source
audit, artifact-availability and source-review assessment, dependency and
preservation receipts, captured inputs and guard, and exact submitted files
with remote receipts. These are retained with this PR's local evidence;
scratch is retired after submission. The seven-module Teichmuller reuse receipt and artifact hashes are retained alongside the artifact audit. No private path or source PDF is published.

The separate partial signature file also compiled with zero errors and 2,868 expected placeholder warnings across 3,600 pinned source modules. It includes all 15 new named declarations and 20 tests, and retains the documented 4777–4791 omissions. This is not a full-file compilation. Partial signature SHA256: c4285e2da7cc2989ff20129c81f2b9f8211f0ea2477ffefb1b3787de0adec11b.
