# Ngo Dac (2021): extraction and routing checkpoint

The paper proves all-weight spanning by Thakur's proposed family, all-weight independence for the smaller family whose entries are strictly below q, and the Thakur basis theorem through weight 2q−2. It does **not** prove the later all-weight basis theorem. This extraction is partial because specific external proof inputs and the journal-version comparison remain unresolved, not because the main manuscript was skimmed.

The JSON contains 99 items, including 36 definitions/constructions with 105 proposed API entries and 108 discriminating tests. Every missing item has exactly one route. All implementation statuses remain unchecked.

## Source and reading boundary

The complete source read is [HAL hal-03298790v1](https://hal.science/hal-03298790/document), deposited 24 July 2021, manuscript dated 29 March 2021, 26 printed pages plus a HAL cover. The [Annals article page](https://annals.math.princeton.edu/2021/194-1/p06) identifies the same author, title, abstract and main theorem ranges; the revision date also matches. The published article occupies pages 361–392, but its full text was not obtained. Thus this is not a claim that the manuscript and journal versions are textually identical. Every main-paper locator and E1–E6 finding refers to the HAL version.

The manuscript was read continuously through the introduction, §§2–6 and references. Ambiguous formulas on printed pages 9, 10, 12, 18, 23 and 24 were checked in rendered pages. Source hashes, URLs, access dates and exact external reading limits are in the JSON.

The external reading includes the full lifting proof in [ABP §3](https://arxiv.org/abs/math/0207168), Chang's MZ-property and descent proofs in [§§3–5](https://arxiv.org/abs/1207.2326), and the rational-denominator argument in [CPY Proposition 2.2.1](https://www.math.nthu.edu.tw/~cychang/EulerianJEMS_Corrections1.pdf). Thakur's complete eight-page shuffle article was read together with its [known replacement proof](https://www.sas.rochester.edu/mth/sites/dinesh-thakur/updates.pdf). Selected original power-sum and nonvanishing sections were also read. These selected readings do not amount to complete extractions of those external papers.

## Exact mathematical scope

Write q=p^e≥2, A=F_q[θ], K=F_q(θ), and distinguish the auxiliary variable t from θ. An index is a positive integer tuple. Its coordinates are zero-padded only for comparison, not admitted as zero entries. The MZV sum runs over monic polynomials of strictly decreasing degrees; unlike classical real MZVs, a first entry of 1 is allowed. The empty-index value is 1, while fixed-degree sums are used only for nonempty indices.

At weight w, let I^T_w consist of indices with every entry≤q and last entry<q, I^0_w of indices with every entry<q, and I'_w of indices with no entry divisible by q. The last condition is not “indivisible by p”: when q=4, the entry 2 is allowed. These are index sets; we do not assume their evaluations are injective before proving independence.

| Result | Family | Range |
| --- | --- | --- |
| Theorem A | I^T_w spans Z_w over K | Every w>0 |
| Theorem B | I^0_w is K-independent, hence K̄-independent | Every w>0 |
| Corollary C | I^T_w=I^0_w gives a basis | 1≤w≤q |
| Theorem 6.2 | I'_w is K-independent | q>2, 1≤w≤2q−2 |
| Theorem D | I^T_w is a basis, dim Z_w=d(w) | Every q, 1≤w≤2q−2 |

The counting sequence has d(0)=1, d(w)=2^(w−1) for 1≤w<q, d(q)=2^(q−1)−1, and d(w)=Σ_{i=1}^q d(w−i) for w>q. An explicit bijection I'_w→I^T_w replaces mq+b, 1≤b<q, by m copies of q followed by b. Its inverse parses the unique blocks ending in an entry below q. This avoids conflating cardinality equality with a statement about MZV values.

Theorem B also gives the lower bound by compositions with parts in 1,…,q−1. At q=2 the small-entry family has only the all-ones word; the claimed final basis range is w≤2, handled by Corollary C.

## Spanning proof and reusable relation calculus

The order s≤t means equal weight and comparison of every prefix sum. It is neither lexicographic order nor a depth order alone. The sum a+b used in support bounds is coordinatewise zero-padded addition, not concatenation. The collapse T_i merges the first i entries. These distinctions are tested explicitly in the API.

Chen's equal-degree formula adds correction terms with coefficients
Δ_i(a,b)=(-1)^(a−1) binom(i−1,a−1)+(-1)^(b−1) binom(i−1,b−1)
in F_p, supported on 0<i<a+b and (q−1)|i. A simultaneous fixed/truncated recursion gives finite supports, degree-independent coefficients, weight preservation, dominance bounds and depth bounds. Choosing such a recursion does not assert uniqueness of every formal expansion: the manuscript explicitly leaves that stronger issue open.

A binary relation stores two finitely supported K-coefficient families and an equality at every integer degree, not just nonnegative degrees. Its shifted boundary matters when summing. The fundamental relation is

S_d(q)+(θ^q−θ)S_{d+1}(1,q−1)=0.

The B* operation sums a relation below the cutoff and multiplies by a leading power sum. The C operation multiplies by a truncated sum; its resulting coefficients are in K. BC_q cancels equal-degree terms and leaves a shifted tail controlled by prefix dominance. The extraction includes these objects, their realized equations, their support lemmas and separate acceptance tests.

Propositions 2.12 and 2.13 reduce a first entry exceeding q and a terminal q, respectively. The j=0 branch must sum the binary relation directly; B*_0 is not defined. For termination, the finite fixed-weight composition space matters: a growing initial prefix is ranked within that finite space. Merely saying that a lexicographically increasing variable-length sequence is bounded would not prove termination. The k-admissible theorem is extracted separately; taking k=w produces Theorem A.

The same calculus yields an explicit next-weight relation:

ζ_A(2q−1)+(θ^q−θ)ζ_A(1,2q−2)=0.

In C_(q−1)(R₁), the equal-degree correction cancels the separate (q,q−1) term, and the truncated square reduces to S_<(2q−2). For q>2 both resulting indices lie in I', demonstrating the limitation of Theorem 6.2's family at the next weight. This is not a counterexample to Thakur's distinct proposed basis. Todd's claim that the displayed operation-generated relations exhaust all K-relations is retained as a conjecture, not used as a proof input.

## Independence proof and analytic interfaces

Coefficient twisting fixes t. Inverse twist uses the inverse q-power automorphism of the perfect coefficient field. The effective dual-motive convention is σf=f^(−1)σ; it must be compared with the base roadmap's contravariant Anderson convention rather than silently identified with it. Finite freeness over K̄[σ] and automatic rigid triviality are not part of the manuscript's effective dual-motive definition.

The analytic ring E requires both infinite radius of convergence and a finite extension of K∞ generated by all coefficients. The latter condition is not dispensable. Ω has its first zero at θ^q, not at θ, and Ω(θ)=π̃^(−1). The manuscript's H_s equals the H_{s−1} of the cited interpolation source. The factorial Γ_s likewise uses digits of s−1. These two indexing conventions are independently tested.

The extraction spells out the individual-index difference/period matrices and the merged-prefix matrices. At fixed weight, distinct indices with the same penultimate prefix necessarily have the same last entry, so at most one input index contributes to that terminal prefix. This elementary uniqueness is necessary to make the extension row well-defined.

ABP lifting produces a normalized rational relation row regular at θ. Subtracting its twisted transport gives a relation with zero last coordinate. Maximal prefix weights are eliminated by specializing along the Frobenius orbit and using lower-weight algebraic independence. The empty prefix is treated separately using L(empty)=1. CPY's denominator theorem then clears denominators by a polynomial in F_q[t]. The resulting split period row is Frobenius-fixed; its Tate condition excludes finite-field rational poles, so it is polynomial. Specialization yields K-rational suffix combinations.

For small entries, isolated suffixes become Eulerian and their weights divisible by q−1. Successive tails then force the trailing entries to equal q−1. A maximal common-prefix pair would have two distinct entries in 1,…,q−1 congruent modulo q−1, a contradiction. Chang's actual independence-descent theorem is Theorem 3.4.5, not the proposition number printed in the main manuscript.

For the larger weight range, only (w) and (k,q−1) can remain. The second splitting equation is solved explicitly by a multiple of (δ_2,a_2)=(θ^q−t^q,t^q−t). The interior and endpoint coefficient contradictions are separate items. At the endpoint, substituting θ=t into the final polynomial identity handles also the possibility that its prefactor vanishes; no informal divisibility shortcut is needed.

The unresolved step is precise: the Kuan–Lin θ-degree bound and descent must supply the polynomial coefficient normalization used in those comparisons. The published PDF endpoint returned HTTP 403. A bound on arbitrary rational θ-coefficients does not by itself justify writing the affine or quadratic polynomial forms. This is recorded as G1, not asserted to be an error in Kuan–Lin.

## Ownership and pinned-library evidence

The pinned commits are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Actual statements were read for the three carrier families classified as library:

- RatFunc's infinity valuation and valued completion supply the rational-function completion carrier and the sign convention at infinity.
- PowerSeries.IsRestricted and its subring supply the restricted-series carrier conditional on an existing normed ultrametric coefficient field. They do not supply C∞, Gauss-norm completeness or the ABP entire-function theory.
- SkewPolynomial supplies a generic skew-polynomial carrier and multiplication formula. It does not supply the inverse-q action instance or a pre-existing dual t-motive theory.

Targeted searches found no Carlitz, Thakur, multizeta, dual-t-motive or Anderson–Thakur declarations in either pinned tree. This supports the specialized missing classifications; it is not a substitute for reading a general-purpose theorem before importing it. The reviewed DM.0–DM.8 audit and PS.9 audit were read, as were the complete owner documents and every proposed supplier stage description.

The generic source routes refine DM.0 (Carlitz denominator products), DM.2 (C∞, periods and Ω), DM.4 (the precise dual effective convention), DM.6 (factorials and depth-one power sums) and DM.8 (twists, E, denominator descent, analytic lifting and the ABP proof estimates). The remaining higher-depth items extend **DrinfeldModulesAndTModulesPartII**, reusing exactly the identifier and title already proposed by PAPER-CHANG-CHEN-MISHIBA-23 and PAPER-IM-KIM-LE-ETAL-24. There is no corresponding live roadmap definition or packet in the inspected snapshot, so pending paper proposals are not labelled “planned” atlas stages.

The classical roadmap PeriodsAndSpecialValues:PS.9 supplies orientation, not characteristic-p numerical independence. ABP's Riemann–Roch application must import a verified existing general supplier; G6 prevents accidentally creating another general Riemann–Roch development.

Three neighboring-source URL mismatches were caught during acquisition: arXiv:2007.11060 is not this 2021 paper, arXiv:1207.4736 is not Chang's independence paper, and arXiv:1601.01927 is not CPY. The verified links are the HAL source, arXiv:1207.2326 and arXiv:1411.0124. Other jobs' files were not edited.

## Source findings

The JSON contains ten findings, each with a version, short quotation, correction, argument, reach and correction search:

- E1: the B* derivation sums R(d) where R(j) is intended.
- E2: C-operation output coefficients are labelled F_p instead of K.
- E3: the j=0 reduction branch uses the undefined B*_0.
- E4: the printed ABP theorem omits c≠0. A concrete rank-two counterexample is given using f=Ω^(−1)=(t−θ)Ω, where the exponent denotes inverse twist, not reciprocal. All matrices actually used in the paper satisfy the corrected hypothesis.
- E5–E6: the Chang independence locator and Todd's page range are incorrect.
- E7: Chang's analytic-to-entire argument cites ABP Proposition 3.1.1 instead of Proposition 3.1.3.
- E8: the external Thakur shuffle article assigns the wrong bibliographic pages to his Relations paper.
- E9: the external Thakur higher-depth proof has a **known** erroneous concatenation step; Shuhui Shi's replacement proof is recorded and used.
- E10: the external CPY rational-module proposition prints a polynomial matrix domain; multiplication by 1/t between trivial rationalized modules demonstrates why the domain must be rational.

“New” means no matching correction was located in the documented searches, not a claim of exhaustive novelty. None of these findings has been independently reviewed here, and nothing was sent to authors.

## Remaining work and checks

G1–G8 in the JSON identify exact consumers: Kuan–Lin normalization; Chen's explicit-coefficient proof; the general prime-power greedy valuation theorem; original Anderson–Thakur/Carlitz interpolation; generic nonarchimedean analysis and Lang's isogeny; the Riemann–Roch lattice-count bridge; full constant-level signatures for ABP's auxiliary-function proof; and reconciliation with the published versions. A future worker should resume these leaves rather than reread the complete main paper without using this inventory.

Exact rational-function tests passed for q=2,3,4,5: 336 Chen identities, 32 binary-relation boundary checks, and the counting/block-bijection checks for weights 1–10. F_4 was constructed as F_2[u]/(u²+u+1), not approximated or replaced with arithmetic modulo 4. These are tests of finite cases, not proofs of all-weight identities or independence.

The paper checker passes. Repository intake and unit-test results are recorded in the handoff after execution. No Lean file was compiled or submitted: this paper job authorizes only the JSON, report and handoff, and claims no formalisation.
