# BP-DirichletPadicLFunctions: The conditional principal residue limit

Codex / codex-7e92bd same-worker issue #713 continuation after PR #4786,
merged 07ad1a2f86eaf97317dde916b649ec126c252efe with head 3964a5b3fca20ff4b4064368f5a81f776d187bf1.
Original claim5854790528, winning bot5854791937; no additional claim.
Review #390 remains unclaimed.

## Delivered and remaining

Four L3 nodes isolate the actual arithmetic step of the principal residue calculation. They retain the supplied family, its continuity and denominator derivative, and compute the punctured limit and coordinate change without constructing another character space or claiming a meromorphic pole.

Totals: 602 unchecked nodes (1 definitions, 238 lemmas, 69 constructions, 180 theorems, 114 comparisons), 517 API entries,
975 packet tests (295 on definitions/constructions),
978 typed examples, 24 planets and 528 baseline records.
16 findings, 15 gaps, 11 requests and zero closed stages.
All16 source findings, sourceVersions and eleven requests remain whole; all fifteen gaps remain open. No new finding, supplier existence result, family construction or independent verdict is claimed.

The principal arithmetic quotient now has a conditional punctured limit1−p⁻¹, eventual admissibility, a continuous-extension obstruction and reciprocal coordinate change, for an explicitly supplied family with the required C(U,Q_p)-continuity and derivative. Constructing that family and proving its derivative remain with PMIA L0a and LAD L3; their current packets have no finer nodes for them. The analytic ζ branch, canonical evaluator comparison and meromorphic pole order remain open. The seven inherited mass-comparison stage leaves, all eleven requests and fifteen gaps remain; no stage closes. Generalized Eisenstein constants, tame distribution-to-L-value identification, full source extraction and availability of the missing pinned TwistedDivisorSum artifact remain separate work.

## Reading and validation

Reread whole published153–158, including equations7-1 through7-3, the binomial denominator calculation and the final mass substitution. Read the whole PMIA L0a atlas stage and its not_read coverage, and LAD L3 coverage confirming ownership and missing canonical family/derivative decomposition. Read native AbstractMeasure definition and functional equivalence, derivative-as-slope theorem over nontrivially normed fields, eventual nonvanishing, division limits, chain rule, Hausdorff uniqueness and the scalar power rule. Existing Dirichlet/Coleman/PMIA library audits and the complete mass comparison were read in4786.

All 598 predecessor nodes, 523 baseline records, 16 findings, requests and sourceVersions remain whole. This checkpoint adds 4 nodes, 4 named suggested declarations and 12 typed examples. The indexed blueprint, four-file intake, whitespace, preservation, API/test parity and versioned-source checks pass. The graph has 858 reachable nodes, 4150 edges and 707 native leaves and is acyclic. Its stage request leaves are PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3, LocallyAnalyticDistributions:L1, AdicSpacesPartII:F1, AdicSpacesPartII:R2, PadicDifferentialEquationsAndRigidCohomology:RD.0, PadicDifferentialEquationsAndRigidCohomology:RD.4, PadicHodgeTheory:P7:annulus-foundations, PadicMeasuresIwasawaAlgebras:L2, LocallyAnalyticDistributions:L1. The numerator-continuity node has no stage leaves. The three limit consumers inherit exactly the seven existing analytic leaves of the mass comparison. The existence of the canonical family is not an input supplied by these conditional theorems; it remains an explicit L3 boundary with its PMIA/LAD ownership stated.

**The full current suggested module was NOT COMPILED.** Its real native import requires TauCeti.NumberTheory.ArithmeticFunction.TwistedDivisorSum. No matching existing artifact was found; WORKERS.md prohibits building the native library. Current compiler exit code, error count and warning count are unavailable, not zero. The exact named signatures and native source were reviewed. PR4773 remains the last compiled full predecessor, with zero errors and1,803 expected placeholder warnings; that receipt does not validate this new module.

The current source closure covers 3601 pinned Mathlib modules and 22 pinned Tau Ceti modules. Only 21 Tau module artifacts are available and hash-verified. The105 available artifact files and the previously compiled332-node PMIA artifact are checked as partial dependencies. The current369-node supplier source preserves the older interface; no current-module compilation against either revision is claimed. Existing builds only were inspected; no setup, update, cache fetch or native build occurred.

Ten complete native lemmas check the actual AbstractMeasure functional on continuous test families, central mass substitution, denominator slope and eventual nonvanishing, quotient limit, signed arithmetic normalization, derivative-based coordinate change, absence of any continuous extension, the critical quadratic derivative and reciprocal scalar factor. The separate probe compiles against 2868 pinned Mathlib modules and 0 pinned Tau Ceti modules with zero errors, warnings or placeholders. The separate Mathlib-only probe does not import, replace or compile the missing native Tau module. General roadmap declarations remain unchecked.

Exact rational controls cover192 polynomial profiles and960 sampled points with nonconstant numerators, quadratic denominator perturbations and four coordinate derivatives. All960 exact remainder identities hold;96 cases detect multiplication by the coordinate derivative instead of division, and four detect the wrong denominator sign. No profile is asserted to be a continuous character or actual measure family. Exact rational polynomial numerator/denominator profiles with M=−(1−p^(-1))L, denominator derivative−L, and linear coordinate derivative c. These profiles test scalar normalization and the reciprocal coordinate factor; they are not asserted to arise from measures or continuous characters. At sampled t=p^m the regularized quotient error agrees with its exact rational remainder formula. Infinite limit and continuous-extension claims are checked separately by complete native proofs under their explicit hypotheses. The largest observed discrepancy is 0 in every exact identity; sampled p-adic error valuations are at least m−6.

The66-input capture has an empty predecessor delta and includes PMIA/LAD owner atlas stages and packets. The predecessor Lean body is preserved whole. The complete native probe uses only existing pinned Mathlib artifacts; the full suggested module remains uncompiled because native TwistedDivisorSum has no compatible existing artifact. A separate signature-only check of the exact4773 body plus the four new statements and twelve examples elaborates with zero errors and1819 expected placeholder warnings, using3573 audited source modules. It excludes the later4777/4780/4786 additions and does not validate the current full module. Explicit section-variable types and explicit ContinuousMonoidHom.toContinuousMap projection avoid notation-precheck errors.

The publication guard at 5a85ea2ff2792d81f15cd4edc6d528c16bf12673 checks 66 inputs,
four predecessor outputs, unchanged issue text, the original winning claim
and unclaimed review #390.
Suggested SHA256: `41094b9ec7daf61b6a063d543c82f70ec617e3ddcd1b11274e288cd80f83f6ca`.
Native probe SHA256: `17d5d364e266cfea1fd86dc9bde6ddc61798095d0c11ef00733cd44f210e7c48`.

One reusable worktree and one Lean process at a time were used. All compiler
processes have ended. Exactly the four authorized deliverables change.

Retain PrincipalResidueProbe.lean and its compiler/result/source audit, finite
control code and results, the full-module NOT-COMPILED receipt and source
audit, artifact-availability and source-review assessment, dependency and
preservation receipts, captured inputs and guard, and exact submitted files
with remote receipts. These are retained with this PR's local evidence;
scratch is retired after submission. No private path or source PDF is published.
