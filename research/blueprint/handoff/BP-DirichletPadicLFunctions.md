# BP-DirichletPadicLFunctions: Root averages and cancellation of the logarithmic constant

Codex / codex-7e92bd same-worker issue #713 continuation after PR #4712,
merged eca50d5dcbab7b8d02bf83e74e2b5732696b8487 with head
fa524cb587d4cddd6e010a42e2ce3a1fbd6a8170. Original claim 5854790528,
winning bot 5854791937; no additional claim. Review #390 remains unclaimed.

## Delivered and remaining

Six concrete L3 nodes supply the root average and its complementary value, with the exact1/p normalization, actual coefficient-series comparison and cancellation of the logarithm constant. The primitive-root domain proof includes p=2. The generic distribution identity and LAD restriction comparison remain separate owner inputs.

Totals: 491 unchecked nodes (1 definitions, 213 lemmas, 62 constructions, 132 theorems, 83 comparisons), 454 API entries,
780 packet tests (262 on definitions/constructions),
783 typed examples, 24 planets and 469 baseline records.
16 findings, 8 gaps, 4 requests (PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3, LocallyAnalyticDistributions:L1), zero closed stages.
All16 source findings, sourceVersions and all four previous supplier requests remain whole. Confirmed external E44–E48 are retained; no new finding or independent verdict is added.

The actual logarithm values now admit a root-average HasSum, and value-at0 minus that average depends only on the normalized primitive, eliminating every supplied integration constant. Next collapse the finite average to p⁻¹ times the powered logarithm constant using the existing Coleman weight-one distribution relation, then compare with LAD restriction. Importing the current generic Coleman node also reaches open AdicSpacesPartII F1/R2, PadicDifferentialEquationsAndRigidCohomology RD.0/RD.4 and PadicHodgeTheory P7 annulus-foundations requests; those dependencies must be accounted for or supplied by a finer owned input, never silently dropped. LAD distribution-operations currently has a coarse PMIA L0 leaf. Neither route is imported by this finite checkpoint, and no analytic L-value is identified. The existing discAnalytic/R+ comparison request remains open. Retain the smoothed pure-p-power route and E44–E48; odd/dyadic analytic branches, pole/residue analysis and complete source extraction remain open.

## Reading and validation

Read the whole pinned RootsOfUnity.Lemmas module, primitive-root power-surjectivity and coprimality statements, finite-order norm1 and the native finite HasSum operations. The whole native Tau roots-of-unity valuation module was inspected and found to give norm1 rather than the stronger distance from1; it is not imported or newly compiled. Published151–153 was read in the preceding checkpoint. Whole Coleman distribution-relation and weight-one nodes, their exact suggested interfaces, and whole LAD amice-transform, distribution-operations and division-by-x-and-primitives nodes were read. Their dependency graphs were inspected before limiting this checkpoint to the concrete finite average and constant cancellation.

All 485 predecessor nodes, 467 baseline records, 16 findings, requests and sourceVersions remain whole. This checkpoint adds 6 nodes, 15 named suggested declarations and 10 typed examples. The indexed blueprint, four-file intake, whitespace, preservation, API/test parity and versioned-source checks pass. The graph has 682 reachable nodes, 3235 edges and 610 native leaves and is acyclic. Its stage request leaves are PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3, LocallyAnalyticDistributions:L1. The primitive-root domain route reaches native declarations only. The other five new routes retain the existing LAD L1 comparison leaf; the broader generic distribution and restriction graphs are not claimed by this checkpoint.

The full suggested module elaborates with zero errors and 1522 expected placeholder warnings. Source and artifact audits cover 3600 pinned Mathlib modules, 21 pinned Tau Ceti modules and the verified actual 332-node PMIA artifact. The current 369-node PMIA source preserves the compiled 332-node artifact's source in order; no new supplier declaration is called and no compilation against the current supplier revision is claimed. Source, olean and original compiler-log hashes were rechecked. Existing builds only were used.

Eight complete native lemmas check power-difference and inverse-power bounds, the exact primitive-p-root norm identity, the open-disc bound for every root power, finite normalized averaging of HasSum, cancellation of an arbitrary constant, the constant-series HasSum and subtraction to the normalized primitive. The probe elaborates against 2838 pinned Mathlib modules with zero errors, warnings or placeholders. General roadmap declarations remain unchecked.

Exact arithmetic in ramified cyclotomic extensions checks26 root evaluations,71 local logarithm expansions,22 generator-average comparisons, four normalized-complement identities,16 arbitrary-constant cancellations and26 higher-precision comparisons. Two controls detect omitting the1/p normalization. Exact modular arithmetic in (Z/p^20 Z)[X]/Phi_p for p=3,5,7,11, with tame roots split in Q_p and all p-th roots represented in the ramified cyclotomic extension. The conductor2 principal character is deliberately allowed: these finite and local-series statements need no primitivity. Output precision is p^8 with one extra digit for averaging, independently repeated three digits higher. Direct unit logarithms are computed as log(x^(p-1))/(p-1) and compared with the actual constant plus the normalized Taylor series at xi^j-1. A principal-unit argument has valuation at least1/e, e=p-1. Truncation starts at N=max(p^2,2e(r+2)); for n>=N, v_p(n)<=n/(2e), hence floor(n/e)-v_p(n)>=r. Every term division by the p-part of n is checked coefficientwise with guard digits. Finite averages, generator permutations and cancellation of arbitrary added constants are exact modulo the output precision. Missing the1/p average factor is detected. These controls do not prove a general logarithm distribution identity, identify an LAD restriction or establish an analytic L-value. The largest observed discrepancy is 0.

The58-input capture ateca50d5dcbab7b8d02bf83e74e2b5732696b8487 has empty delta. The exact Coleman local logarithm law stays explicit. Only existing pinned artifacts and the verified332-node PMIA artifact are used; no current369-node PMIA, Coleman or additional native Tau-module compilation is claimed.

The publication guard at d2323cdd6fb1598a185bcb00b991d01a02393a17 checks 58 inputs, four
predecessor outputs, unchanged issue text, the original winning claim and
unclaimed review #390.
The58-input capture ateca50d5dcbab7b8d02bf83e74e2b5732696b8487 has empty delta. The exact Coleman local logarithm law stays explicit. Only existing pinned artifacts and the verified332-node PMIA artifact are used; no current369-node PMIA, Coleman or additional native Tau-module compilation is claimed.
Suggested SHA256: `839aa9b726aee663de97b9ee0bd52a8cd911c443c167c9ee8aa459f844d6f5c7`.
Native probe SHA256: `d6cdbe8e81acc9488a7aacfc200bef91a3cf60516caeb78cfa3734ca722c4e83`.

One reusable worktree and one Lean process at a time were used. All compiler
processes have ended. Exactly the four authorized deliverables change.

Retain LogarithmicAverageProbe.lean and its compiler/result/source audit, numerical
control code and results, the full suggested compiler/result/source audit,
artifact hashes, graph/preservation/API receipts, captured inputs and guard,
and exact submitted files with remote receipts. Retire scratch after opening
the PR. No private path or source PDF is published.
