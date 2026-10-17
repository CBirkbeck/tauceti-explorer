# Handoff: REV-PKG-ArithmeticStatisticsPartV~adv

Issue #10278; agent Codex; session `codex-5Wt18f`; branch `codex-5Wt18f-review-arithmetic-statistics-v`; 2026-10-17.

The independent review is complete with **needs_changes**. This submission completes the review job; it does not claim the package is accepted or ask another worker to repeat the review. No second issue was claimed. The detailed [review report](../reviews/REV-PKG-ArithmeticStatisticsPartV~adv.md) contains the 111-target adversarial table, convention/denominator audit, 15-source sample, all 21 original support-gap dispositions, source URLs/hashes, pin comparisons, changes and remaining contracts. The [package verdict](../packages/ArithmeticStatisticsPartV/review.json) records the same result.

The package fixes inertia versus decomposition, length-zero tower asymptotics, inverse-degree normalization on relative narrow torsion, the false degree-two monogenic coefficient, supplier anchors, definition Checks and original governing-field locators. It now has direct Jensen rank-law and uniform Vandermonde generator-fibre proof routes. All 111 original target anchors and existing mathematical tests remain. No packet or metadata was changed.

## Resume with the actual gaps

Start at the report's remaining-closure-contract table; it gives exact hypotheses and source locations. The most structural blockers are:

1. The Galois three-eighths theorem needs `simpleGroup_largeProperSubgroup`: finite nonabelian simple S has a proper H with |H|²>|S|. Ellenberg–Venkatesh Remark 2.10, p.734 uses classification. CFSGStatement only defines the proposition and cannot supply its truth. The S₃ application is independently available from cubic counting, so do not make that application depend on a proof of classification.
2. Mixed traces need the exact Alexander–Hirschowitz interpolation input and the characteristic-zero polynomial-map generic finite-fibre/Bézout theorem. Their contracts and exceptions now appear in the README; IG.2 arithmetic Hilbert irreducibility alone supplies neither.
3. Relative 3-torsion propagation needs the corrected cubic-order coefficient identity with |Aut_OF(R)|^-1 and all conductor factors, including wild three. A formula weighted by automorphisms of the generic algebra, or a squarefree-conductor formula, is insufficient.
4. Obtain/prove the original all-order Siegel mean, Wright conductor-series pole/positivity and Baily uniform arbitrary-resolvent-subfamily bound. The report distinguishes public normalization restatements from an original proof. The precise Q₈ odd-discriminant residue transfer, eight-rank governing-field PID certificate, original Blomer/Cremona–Odoni contracts and D₅/F₂₀ quintic o(X) remainders also remain open.

The original public sources for Bruin–Hemenway and the correct Koymans–Milovic Proposition 6.2 were obtained and read: use [134] and [135], not the unrelated −2p paper. Fouvry–Klüners's earlier Pell inequalities were checked in the Annals original, including odd/even height conversion; the later discriminant-ordering claim was not inferred. NSF appendix failure was resolved using the checked arXiv v2 [50], Appendix A.1–A.3, pp.35–37. The public source hashes are in the report; no source passages or private files are carried forward.

## Ownership changes and upstream notes

Removed duplicate squarefree-discriminant maximality from the polynomial target; current Tau Ceti already proves it in the index and order-discriminant modules. Existing `IsMonogenic` is reused, with only statistical predicates new. Removed the general degree≤3 cumulative bound already in AnalyticNumberTheory Part II §5.7; retained the sharper quadratic-only bound. These are subclaim removals, with all original anchors preserved. The report lists the exact declarations.

OperatorTheory/PolarDecomposition supplies finite-dimensional singular systems; IntegralLattices §2G supplies integral Gram reduction, whereas the polynomial-order metric here needs a real-Gram adapter. Reduced multipliers, parity/reduction certificates and order-96 type belong to InductionRestriction Part II RS.1, RS.3 and RS.6.4–6.6. All later-part dependencies remain downstream.

`upstreamNotes`: CFSGStatement's classification proposition is not a proof of classification. No upstream roadmap or current-library file was changed. Pinned elaboration used Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369; duplicate checks used current Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

## Validation

`lean-check` on Suggested.lean exited 0, with exactly 22 sorry warnings and no other warning. The file has two real-bodied definitions, three theorem signatures and nineteen examples; no missing carrier is replaced by sorry data. All seven original packet checks passed with zero errors/warnings. Exact-arithmetic finite checks cover the binary local densities, cubic/discriminant examples, rational exponents and all four piecewise transitions. Intake, local Markdown links, the 350 KB README cap and whitespace checks pass. These are review checks, not formal proofs of the roadmap's milestones. Temporary source downloads and scratch scripts are removed once the pull request is open; nothing needed to resume depends on them.
