# Bakker–Klingler–Tsimerman: tame arithmetic quotients and Hodge loci

Partial continuation by Codex, session `codex-a71f92`, 23 September 2026. Refs #1422.
Builds on Codex `codex-c83e7a` (PR #1670) and Claude Code `cc-fb70e5` (PR #1840).

The extraction now contains **124 items: 12 library imports, 12 existing plans and 100 missing items**, with exactly one route per missing item. Its 44 definitions/constructions have 132 API contracts and 134 proposed tests; the dependency graph has 234 edges. The standard `tests` field now carries the tests and API roles use the protocol vocabulary; the old `unitTests` field is retained for compatibility, not counted twice. These are planning contracts, not implemented Lean declarations.

This continuation supplies explicit proofs for fixed-basis off-diagonal transfer, finite-permutation reducedness, properness of a finite Siegel relation, and buffered analytic transition graphs. It also obtains the published paper and expands the unreviewed source-issue ledger from seven to 29 entries. The extraction remains partial: original reduction and Hodge-analytic inputs, finite chart refinement, finite boundary/level adapters and definable algebraization are not closed.

## Sources and attribution

The complete [published JAMS paper](https://par.nsf.gov/servlets/purl/10200187), printed pages 917–939, was read, including the references. Published page images 921, 923, 926–928, 930–933 and 935 were inspected for symbols and formulas. The [author copy](https://benjamin-bakker.github.io/DefArith.pdf) was compared at the main statements and recorded findings. This resolves the missing-published-copy gate G1; it is not a claim of exhaustive glyph-by-glyph editorial collation.

The entire four-page [official erratum](https://benjamin-bakker.github.io/DefArithErr.pdf), DOI 10.1090/jams/1025, was reread. Bakker's and Tsimerman's author pages and the [arXiv version listing](https://arxiv.org/abs/1810.04801) were checked for corrections; the latest listed version is v2, dated 22 June 2020. No author was contacted. Every newly recorded finding is provisional pending independent review.

The earlier contributors' source work is preserved and attributed, not represented as a new full reread: the complete author paper and Orr–Schnell correction; BGST author pages 13–15, including Proposition 28.1's proof; Schmid printed pages 230, 232–233, 244–245; selected Kashiwara pages 863–866 and 870–875, with remaining OCR/image gaps; and selected arXiv v2 passages. Exact URLs, SHA-256 hashes, dates and read extents are in `provenance`. A bibliography entry is not a completed prerequisite extraction.

## Corrected scope and existing owners

A general arithmetic quotient Γ\G/M retains a chosen maximal compact K containing M. Siegel comparisons use the same K. A morphism [h′] ↦ [φ(h′)g] has rational φ, compatible levels and stabilizers, φ(K′) contained in gKg⁻¹, and the target Cartan involution preserving the image Lie algebra. Definability is a theorem, not part of the definition. General fixed-quotient K-independence and unrestricted morphism functoriality are not asserted.

Orr–Schnell containment retains the Cartan condition; BGST Proposition 28.1 retains its forward-containment hypothesis for rational pullback. Hodge morphisms have canonical compatible compact data. The symmetric-space specialization does not make the general quotient K-independent.

Pinned baselines remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All ten previously imported signatures were checked at those pins. The two new library items import `TauCeti.cholesky`/`TauCeti.cholesky_mul_transpose` and `Matrix.inv_def`. Cholesky factorization belongs to existing upstream work, not to a new reduction-theory construction.

The full upstream HodgeStructures and UniversalCovers documents were read, with selected current owner descriptions and available reviewed audit entries. LD.0/LD.6 have descriptions but no reviewed audit entries in this snapshot; absence of an audit is not evidence that a library construction exists. A name search is likewise only negative evidence, not a proof of mathematical absence.

| Owner | Exact consuming boundary |
| --- | --- |
| AdelicAlgebraicGroups AA.3 | Rational reduction, fixed-K Siegel sets, corrected containment/pullback, reduced forms and quantitative basis adapters |
| LogicAndDefinabilityInNumberTheory LD.0/LD.6 | Tame structures, finite atlases, buffered analytic corners, rough functions, repaired curve test and definable Chow |
| ShimuraData D3 | The already planned general polarized-variation definition |
| ShimuraVarieties V3 | Borel algebraicity, including this alternative proof once its target comparison is certified |
| AlgebraicModuliForArithmeticGeometry R09.7d | Smooth normal-crossing compactifications |
| ComplexComparisonPartII C0/C4 | Analytic images and analytic/algebraic graph comparison, not nonproper definable Chow |
| ArithmeticLocallySymmetricSpaces, Part II | General compact-stabilizer quotients and fixed-K tame structures, specializing to ALS.2 when M=K |
| Upstream HodgeStructures, Part II | Non-Hermitian period geometry, degeneration, period maps and exceptional Hodge loci |

The proposed IDs remain `ArithmeticQuotientDefinability` and `DegeneratingHodgeStructures`. Current roadmap/packet/decomposition/reserved-ID screening found no competing accepted roadmap with these IDs. Benoist and Gao–Habegger paper briefs already reference the shared Hodge successor and remain coordinated consumers/additional tranches, not new generic owners. Upstream LieGroups Layer 9 supplies Cartan/Iwasawa decompositions. Existing Hodge carriers, the single mixed-Hodge Deligne decomposition and period-domain points are imported; none is mistaken for simultaneous Kashiwara splittings or a period-domain manifold.

## Quantitative basis-transfer proof

Let B be the Gram matrix in a fixed reduced basis e′, d_k=B_kk, and suppose ∏d_k≤D det B. Cholesky gives Hadamard's inequality for B and each principal minor. The diagonal cofactor formula then gives

`(B⁻¹)_kk = det(B with row/column k removed)/det B ≤ D/d_k.`

Applying positivity to a−tB⁻¹e_k and minimizing in t yields
`aᵀBa ≥ a_k² d_k/D`.
The empty principal minor in rank one has determinant 1.

Write a second fixed basis as e_i=∑_a A_ai e′_a. Set k_i=max support(A_·i), m_i=|A_(k_i),i| and L_i=∑_a|A_ai|. If B is (e′,C′)-reduced with C′≥1, ordering and its all-pairs off-diagonal bound give
`|b(e_i,e_j)| ≤ C′² d_(k_i) L_i L_j`.
The coordinate estimate gives
`b(e_i,e_i) ≥ m_i² d_(k_i)/C′`.
Thus the explicit transfer bound is

`|b(e_i,e_j)| ≤ C′³ L_i L_j / m_i² · b(e_i,e_i).`

This unordered bound does not need determinant control in the new basis. If additionally ∏b(e_i,e_i)≤C det(b in e), sort the diagonal lengths and choose C″ strictly larger than 1, C and all the displayed constants. All three strict reducedness inequalities follow, including ties. Only finitely many permutations occur. This resolves the quantitative portion of G5 and preserves E3's reversed-basis counterexample.

## Other proof repairs and their limits

For finitely many closed semialgebraic pieces C_i with finite overlap witnesses, the orbit relation is a finite union of graphs of group elements restricted to closed sets C_i∩γ⁻¹C_j. Each coordinate projection over a compact set has compact inverse image. The relation is therefore closed, semialgebraic and proper. This proves the finite-relation step; it does **not** turn entire Siegel images into injective coordinate charts. The finite local refinement remains G2.

For analytic corners, choose smaller semialgebraic boxes with closures compactly contained in larger analytic charts. The matching graph in the product of the two closures is compact by Hausdorffness. Finitely many neighborhoods of analytic transition extensions cover it; restricting those extensions to compact boxes gives a finite union of R_an-definable graphs. The same argument for mixed pairs of buffered covers proves independence. Arbitrary bounded nonbuffered analytic charts need not be globally subanalytic: F(x)=x+(x²/4)sin(1/x) on (0,1) is an increasing analytic diffeomorphism to a bounded interval, but F−id has infinitely many isolated zeros.

The earlier widened-sector repair of Lemma 4.5 remains. Its finite difference must use the sign (−1)^(r−i). If the y₁ powers lie in −L,…,0, L+1 distinct positive integral slopes give an invertible Vandermonde matrix in their reciprocals. This corrects an extraction-level interpolation slip and the source sign slip E22. The application still needs independently verified bounded-real-width uniformity in the Schmid/CKS/Kashiwara estimates; citing the target Theorem 1.5 would be circular.

Preserve nonzero vectors in two-sided monomial comparisons, the centered-weight shift, the library's conjugate-first metric convention, and the parity B(v,u)=(−1)^k conjugate(B(u,v)). Positive Hodge norms are not the possibly indefinite/skew-Hermitian polarization pairing. A faithful adjoint/central-cover representation adapter is still required. The exceptional Hodge locus is a countable union of individually algebraic proper special pullbacks, not an asserted definable whole union.

## Source findings awaiting independent review

All locators below are printed JAMS pages. Detailed checks, corrections and prior-correction searches are in `sourceIssues`. E1–E7 keep their stable IDs; E5–E7 are already corrected in the official erratum. No entry has an independent-review verdict.

| IDs | Pages | Finding |
| --- | --- | --- |
| E1–E4 | 928–930, 933–934 | Whole-polydisk overstatement; curve substitutions leave the original strip; basis transfer needs finite permutations; boundary dimension is n−1 |
| E5–E7 | 919, 924, 932 | Official corrections: K-dependence, Cartan-compatible morphisms, rational rather than real Siegel pullback |
| E8 | 923 | M-invariant polynomials on the orbit representation can identify distinct right M-cosets; retain the second quotient proof |
| E9–E11 | 921, 923 | Relation lies in G×G, action formula is left multiplication, and the horizontal bound uses R rather than an unbound C |
| E12–E16 | 929, 931, 933–934 | Misnumbered references to quotient definability, Lemma 4.7 and the period-map theorem |
| E17 | 935–936 | Analytic transition argument needs buffered charts; the compact-graph repair is supplied |
| E18 | 927 | Conjugation by arbitrary real g need not preserve rationality; use right translation with transported compact data |
| E19 | 928 | Product decomposition of a group does not split an arbitrary compact stabilizer |
| E20–E22 | 930–931 | Nonzero-vector hypotheses, odd-weight skew-Hermitian parity, and finite-difference sign |
| E23–E26 | 926, 932–933, 935 | Finite chart refinement gap, undefined F_i, reversed mixed-chart composition, and notation b/n and H_Q/V_Q |
| E27 | 920, 928 | Adjoint Mumford–Tate presentation need not act on the original fibre |
| E28 | 933–934 | Exceptional target locus must exclude the identity/generic special image |
| E29 | 933 | General singular-source Borel statement needs an adapter before using the displayed smooth-source proof |

For E8 take W=Sym₂(R)⊕R, v=(I,1), G=SL₂(R), M=SO₂(R). Its line stabilizer is M. With g=diag(2,1/2) and k the quarter-turn in M, invariant polynomials agree on g·v and kg·v, whereas their symmetric matrices differ, so gM≠kgM.

For E19 take PSL₂×PSL₂, projection to the first factor, product arithmetic level and diagonal SO₂ stabilizer. The original quotient has dimension 5; the displayed product using stabilizer intersections has dimension 6. Finite-index arithmetic changes cannot remove that discrepancy. Neither example refutes the corrected main quotient theorem.

## Validation and resumption

`check_paper.py` passes. Exact rational diagnostics cover 300 positive-definite matrices and fixed-basis transfers in ranks 1–4, empty minors, seven signed finite differences, seven inverse-power Vandermonde matrices, and the SL₂ and odd-weight examples. The custom structural audit checks the 124-node acyclic graph, API/test coverage, all 100 missing-item routes and absence of self-assigned review verdicts. These are diagnostics and proposed tests, not formal proofs.

The final submission checks also run intake on exactly the three deliverables, the paper/errata/source-issue checker tests, and a fresh-main ownership/concurrency check. No Lean file is part of this job and no Lean compilation is claimed.

G1 and G4 are resolved at their stated scope. G2, G3, the remaining boundary/level portion of G5, and G6 stay open. The handoff identifies the next original sources and adapters. Do not mark this partial checkpoint complete merely because its local checks pass.
