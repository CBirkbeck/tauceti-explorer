# BP-DirichletPadicLFunctions: The smoothed complex character kernel

Codex / codex-7e92bd same-worker issue #713 continuation after PR #4640,
merged e5ff23d9af676cb96e6d396c9f53f7e24259031b with head
91d6ea8cd272b6b905088bfdc60b1ea9a052a38e. Original claim 5854790528,
winning bot 5854791937; no additional claim. Review #390 remains unclaimed.

## Delivered and remaining

Six L2 nodes construct the smoothed complex character kernel and establish its real analyticity, all-order derivative formula, origin Dirichlet values, exponential derivative decay and source Gauss comparison. The definition uses the existing smooth finite-character kernel. All334 predecessor nodes remain whole.

Totals: 340 unchecked nodes (1 definitions, 160 lemmas, 34 constructions, 94 theorems, 51 comparisons), 311 API entries,
469 packet tests (168 on definitions/constructions),
472 typed examples, 24 planets and 405 baseline records.
16 findings, five gaps, one L1 request, zero closed stages.
All16 preceding source findings and sourceVersions remain whole; no new finding or independent verdict.

The root-free complex smoothed character kernel is now constructed, real analytic at every point, equipped with all-order derivatives and source special values at0, proved to have exponential derivative decay for positive natural smoothing parameters, and compared with the exact primitive p-power Gauss expression. Next instantiate the existing normalized Mellin continuation: prove raw convergence and the half-plane χ(−1)Γ(s)(1−χ(a)a^(1−s))L(χ,s) identity using native positive scaling, then continue it and state the normalized negative values. Compare the actual p-adic moment formula with these complex values through an explicit common coefficient field. Generic primitive Gauss nonvanishing, p-adic analytic branches/logarithmic and degree-zero values, full source extraction and the PMIA L1 completed-algebra comparison remain open.

## Reading and validation

The immediate predecessor’s complete published140–142/PDF41–43 reading is retained, and complete published143/PDF44 was freshly read on29September2026, including Remark5.6, the full proof of Theorem5.1 and Theorem5.7/Remark5.8. The exact existing complex-kernel construction, regularity, origin-derivative and derivative-decay nodes and signatures were read whole. Native higher-derivative statements were checked with their codomains: the scaling proof uses the vector-valued scalar-action theorem for R→C. Native Big-O composition, positive scaling, constant multiplication and addition were read at the pin. No new source finding or full-paper extraction is claimed.

All 334 predecessor nodes, 397 baseline records, 16 findings and sourceVersions remain whole. This checkpoint adds 6 nodes, 12 named suggested declarations and 17 typed examples. The indexed blueprint, four-file intake, whitespace, preservation, API/test parity and versioned-source checks pass. The graph has 515 reachable nodes, 2447 edges and 522 native leaves, is acyclic and retains only the PMIA L1 stage request. Each new route has no stage request leaf.

The full suggested module elaborates with zero errors and 964 expected placeholder warnings. Source and artifact audits cover 3596 pinned Mathlib modules, 21 pinned Tau Ceti modules and the verified actual 332-node PMIA artifact. The current 369-node PMIA source preserves the compiled 332-node artifact's source in order; no new supplier declaration is called and no compilation against the current supplier revision is claimed. Source, olean and original compiler-log hashes were rechecked. Existing builds only were used.

Four complete native lemmas verify real-to-complex input scaling for higher derivatives, the smoothed derivative formula, preservation of exponential decay under scaling by a≥1, and complex inverse-character finite reindexing. The probe elaborates against 1880 pinned Mathlib modules with zero errors, warnings or placeholders. General roadmap declarations remain unchecked.

Exact cyclotomic controls verify60 kernel/Gauss values,288 nonzero denominator pairs,135 origin derivatives,20 a=1 zeros,20 a=0 values, five quadratic origin values and two exact values at log2. Exact arithmetic in rational cyclotomic quotient fields at conductors3,4,5,8,9. Set exp(t) to1/2,1,2,3 and compare the root-free complex kernel with the finite Gauss two-fraction expression; exp(a t) is the exact rational power. At t=0 evaluate the existing smooth extension by its finite character sum. Compare ordinary derivatives through degree8 using Stirling conversion of formal Taylor coefficients against independently evaluated rational Bernoulli polynomials. These are finite algebraic controls of the real-analytic formulas, not numerical complex approximations or proofs of decay. The largest observed discrepancy is 0 (exact arithmetic).

Only the two global errata-register inputs changed since PR4640; all16 Dirichlet findings were compared and remain identical. Every supplier and other captured input is unchanged. PMIA is still369 nodes with the preserved compiled332-node interface; no new supplier declaration is called or full369-node compilation claimed.

The publication guard at e22f1a6312fb15e8b8f2e9253b95c0511ed8bd88 checks 54 inputs, four
predecessor outputs, unchanged issue text, the original winning claim and
unclaimed review #390.
Only the two global errata-register inputs changed since PR4640; all16 Dirichlet findings were compared and remain identical. Every supplier and other captured input is unchanged. PMIA is still369 nodes with the preserved compiled332-node interface; no new supplier declaration is called or full369-node compilation claimed.
Suggested SHA256: `b3f0726dd1f6d3007fbd420df2422fdf99f816d72a568cca7b98b5ce96944d16`.
Native probe SHA256: `2fe902f2382996dc03982a088ea3de6c2f7888c637a0e8283de43050db73f435`.

One reusable worktree and one Lean process at a time were used. All compiler
processes have ended. Exactly the four authorized deliverables change.

Retain SmoothedComplexProbe.lean and its compiler/result/source audit, numerical
control code and results, the full suggested compiler/result/source audit,
artifact hashes, graph/preservation/API receipts, captured inputs and guard,
and exact submitted files with remote receipts. Retire scratch after opening
the PR. No private path or source PDF is published.
