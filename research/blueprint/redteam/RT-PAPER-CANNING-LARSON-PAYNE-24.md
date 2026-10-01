# Red team: Canning–Larson–Payne (2024)

**Complete — five findings, awaiting independent verification.** Codex, session `codex-rtOQ9t`; issue [#4218](https://github.com/CBirkbeck/tauceti-explorer/issues/4218); audit base `fe341890101f6517ad1b1f434125f32b3c3dbd4a`.

The extraction broadly covers the paper, but its genus-seven construction needs a real descent/rigidification repair. It also introduces two false formulas/requirements and has unreliable prerequisite bindings. A second source problem is a missing stabilizer factor in the final genus-two representation calculation. None of these findings asserts that the paper’s final cohomology theorems are false.

| Finding | Severity | Required correction |
| --- | --- | --- |
| /1 | High | Separate Spin half-spin bundles, projective actions and effective quotient stacks; expose the missing descent proof. |
| /2 | High | Use codimension in the degree-2i cycle map, or degree 2d−2i for dimension-i cycles. |
| /3 | High | Properness belongs to the compactified moduli stack; the smooth open locus is not generally proper. |
| /4 | Medium | Replace unrelated/conflated references with the actual CKgP, local-system, twisted-coefficient and computation sources. |
| /5 | Medium | Induce from S10×S2 with sign⊠trivial, not from S10 alone. |

## Texts and scope

Read all 31 pages of the [version of record](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S2050508624000246) (Forum of Mathematics, Pi 12, **e23**, DOI [10.1017/fmp.2024.24](https://doi.org/10.1017/fmp.2024.24)), including references, and compared the [arXiv v3](https://arxiv.org/pdf/2307.08830v3) TeX at the findings. The source archive hash is `7828f493e9e3f26f141687381b26e379d8d5f56319351a525d4d34ed6b8bd391`, matching the extraction. The two PDF hashes are recorded in `sourceVersions`; Cambridge watermarks its downloads. All accesses were on 2026-10-01.

Read all 93 item records, all four routes and 17 prerequisite records, the reader, acceptance review and existing source issue. Published pp.20,25–27,29 were also inspected visually to distinguish group subscripts, graphs and pairing entries from extraction artifacts. The original 1995 Mukai paper was not obtained, and the Bergström–Faber software output was not rerun. The group obstruction below is a direct calculation against the CLP construction; it is not an allegation about unread wording in Mukai.

## Findings

### 1. Spinor descent and ineffective central stabilizers

**Where:** research/blueprint/papers/PAPER-CANNING-LARSON-PAYNE-24.result.json, item /60 and its consumers /61–65, routes[0]; corresponding Mukai discussion in the reader.

The extracted Mukai construction requires a rank-16 half-spin vector bundle on BSO_10 and identifies the SO_10 quotient of the smooth linear-section locus with the moduli stack. The half-spin representation does not descend to SO_10, and the displayed quotient retains ineffective central stabilizers. These are obstructions to the stated stack and bundle constructions, not simply alternative names for the same group.

**Evidence.** CLP, published p. 20, §5.3.2–3, (5.10)–(5.13) and Lemma 5.13, explicitly uses the “spinor representation of SO10”; arXiv v3 TeX lines 1057–1111 has the same construction. In the Clifford model the element −1 in ker(Spin_10→SO_10) acts by −Id on S+, so S+ cannot be an SO_10 representation. Peter Woit, The Spinor Representation, p. 1 (https://www.math.columbia.edu/~woit/LieGroups-2012/spinors.pdf), distinguishes the linear Spin representations from projective SO representations. The obstruction is also visible in the pinned Tau Ceti algebra homomorphism TauCeti.spinPlusAction: scalars act as scalars. Projectivizing eliminates this sign but does not give the asserted vector bundle. Moreover, the central −I_10 in SO_10 acts trivially on the projective spinor variety and the Grassmannian of linear sections. Thus the SO quotient has an ineffective μ_2 in its inertia; its natural map to the curve moduli is not fully faithful. Replacing SO by Spin alone leaves μ_4 acting trivially on the projective data. These observations do not disprove the final CKgP or cohomology theorems.

**Fix.** Record a source error/proof gap against published §5.3.2–3 and the matching v3 text, with sourceVersions and correction-search provenance. Replace the unconditional /60 construction by a precise corrected presentation or an explicit unresolved proof dependency. Distinguish a Spin/GSpin lift supporting an actual half-spin bundle from the effective projective group and the required central rigidification. Prove the gerbe/rigidification comparisons and descent or character twists for S+, L_i, Q_n and the claimed Hodge-bundle identification before using /61–65. A bare SO→Spin text substitution is insufficient. Import stack/rigidification machinery from R09.4/R09.5 and reuse TauCeti.spinPlusSubrep, spinPlusAction and finrank_spinPlus at the pin; do not reconstruct these representation primitives. Add checks that −1 acts as −Id on S+, that projective central inertia is removed, and that any bundle claimed to descend has trivial inertia action. Keep the final theorem as a target with this proof gap exposed until repaired.

### 2. Cycle-class grading

**Where:** research/blueprint/papers/PAPER-CANNING-LARSON-PAYNE-24.result.json, item /13; routes[2] (MC.2 source route).

The formula cl:A_i(X)→W_{2i}H^{2i}(X) confuses dimension-graded Chow homology with codimension-graded Chow cohomology. It sends a point on a surface to degree zero rather than degree four and cannot satisfy the stated proper-pushforward compatibility.

**Evidence.** CLP Lemma 4.3, published pp. 11–12, uses the ungraded sum ⊕_i A_i(X)→⊕_k W_kH^k(X), not the extracted graded formula; v3 TeX line 660 agrees. The proof fixes d=dim X and tracks cohomological degrees under correspondences. For X=P²_C, i=0 and the inclusion j:Spec C→P², the proper cycle pushforward j_*1 is a point in A_0(P²), while its cohomological class j_*1 lies in H^4(P²). Equivalently A_i(X)=A^{d−i}(X) for smooth pure-dimensional X. This error was introduced by the extraction, not by the displayed statement of Lemma 4.3.

**Fix.** Use rational coefficients as in the paper. State cl:A^i(X)_Q→W_{2i}H^{2i}(X,Q), or, retaining dimension grading on a pure d-dimensional smooth X, cl:A_i(X)_Q→W_{2d−2i}H^{2d−2i}(X,Q). State the Tate twists separately when expressing this as a Hodge/Galois morphism. Keep the ungraded surjectivity conclusion of /44. Add P² tests: fundamental class, line and point land in cohomological degrees 0, 2 and 4 respectively; the point test must commute with proper pushforward from Spec C. Apply the same normalization to the MC.2 import and reader explanation.

### 3. Properness of the open moduli stack

**Where:** research/blueprint/papers/PAPER-CANNING-LARSON-PAYNE-24.result.json, routes[0].brief, first construction paragraph.

The new-roadmap brief asks for both M_{g,n} and M̄_{g,n} to be smooth proper Deligne–Mumford stacks. The open moduli stack M_{g,n} is not proper in general. This contradicts the correct distinction in item /2 and would require building a false prerequisite.

**Evidence.** The brief says “the moduli stacks M_{g,n} and M̄_{g,n} as smooth proper Deligne–Mumford stacks”. CLP §4, especially published pp. 11–12, explicitly needs a statement for smooth nonproper X and applies it to the open M_{g,n}. A concrete counterexample is M_{0,4}≅P¹−{0,1,∞}, whereas M̄_{0,4}≅P¹. The four marked points (0,1,∞,t) over C((t)) have cross-ratio t, whose specialization 0 leaves the smooth four-distinct-point locus; the stable limit lies in the boundary.

**Fix.** Require M̄_{g,n} to be smooth proper DM and M_{g,n} to be its smooth open substack, retaining the stability condition 2g−2+n>0. Keep compactification, boundary and ordinary versus compactly supported/Borel–Moore theories distinct throughout the route. Use M_{0,4} and M̄_{0,4} as a properness/valuative-criterion regression example. Do not alter the correct item /2 or infer properness of the open locus from that of its compactification.

### 4. Incorrect prerequisite bindings

**Where:** research/blueprint/papers/PAPER-CANNING-LARSON-PAYNE-24.result.json, prerequisites (one-based entries 4,7,9,10,15,16), source.venue, and reader prerequisite paragraph.

Several prerequisite identifiers point to unrelated papers or conflate distinct sources. In particular, three arXiv links lead to fluid simulations, GRB jets and polyadic sets. The CKgP and genus-two proof inputs therefore cannot be recovered from the stated bindings, and the twisted-coefficient paper is attributed to the wrong authors.

**Evidence.** Primary arXiv records accessed 2026-10-01: 1310.3859 is Gabbasov et al., Numerical simulations of the Kelvin–Helmholtz instability with the Gadget-2 SPH code; 1408.4509 is Leng–Giannios, Testing the neutrino annihilation model for launching GRB jets; 2110.11061 is Reggio, Polyadic Sets and Homomorphism Counting. CLP bibliography [5] is Canning–Larson, On the Chow and cohomology rings of moduli spaces of stable curves (arXiv:2208.02357), whose Theorem 1.4 and Lemma 10.5 supply the cited base cases and pushforward criterion; 2110.01059 is a different Hurwitz-space paper. CLP [30] is Petersen–Tavakol–Yin, Tautological classes with twisted coefficients (arXiv:1705.08875); its §§3.2,5.1,5.2.2 were checked. The two Petersen inputs are separately listed as [27] and [28], and Totaro [34] is The motive of a classifying space (arXiv:1407.1366). The Bergström–Faber paper [3] is arXiv:2207.05130, while the software supporting (7.1) is the separate reference [2]. Crossref identifies Mukai I as DOI 10.2307/2375032. The published CLP title page says volume 12, e23, not e22.

**Fix.** Replace the bindings with: (4) Canning–Larson arXiv:2208.02357, retaining 2110.01059 only for a separately identified Hurwitz input; (7) Petersen, Pacific J. Math. 275 (2015), 39–61, DOI 10.2140/pjm.2015.275.39, and the separate compact-type genus-two paper arXiv:1310.7369; (9) Dan Petersen, Mehdi Tavakol and Qizheng Yin, arXiv:1705.08875; (10) Mukai, Curves and symmetric spaces I, DOI 10.2307/2375032, distinguishing part II; (15) Totaro arXiv:1407.1366; (16) Bergström–Faber arXiv:2207.05130 plus the software reference https://github.com/jonasbergstroem/Cohomology-of-moduli-spaces-of-curves for the computation. Give each the actual theorem/section used. Pin the software/data or explicitly retain reproducibility as a gap; do not cite the unrelated 2110 paper. Correct Petersen–Tommasi to Orsola Tommasi where appropriate, Kresch to Andrew Kresch, and e22 to e23. No roadmap ownership change is required.

### 5. Missing S2 stabilizer in Lemma 7.3

**Where:** research/blueprint/papers/PAPER-CANNING-LARSON-PAYNE-24.result.json, sourceIssues and item /75 (Lemma 7.3); reader discussion of the 891-graph calculation.

The extraction misses an incorrect induction subgroup in the representation calculation used to finish Lemma 7.3. The printed Ind_{S10}^{S12}(sgn) has dimension 132, so it cannot equal the stated sum of dimensions 11 and 55. The intended 66-symbol representation requires the S2 stabilizer of the unordered pair.

**Evidence.** CLP published p. 27, last representation paragraph in the proof of Lemma 7.3, prints Ind_{S10}^{S12}(V_{1^10})=V_{2,1^10}⊕V_{3,1^9}; v3 TeX line 1368 agrees. The left dimension is [S12:S10]=132; the right is 11+55=66 (also checked by the hook-length formula). Figure 2 and the displayed definition of M_ij make the pair {i,j} unordered. Permutations of the other ten labels act by sign on the ω decoration, and exchange of i,j fixes the symbol. Thus the appropriate source is S10×S2 with representation sgn⊠1, whose induced dimension is 12!/(10!2!)=66. Pieri gives the stated two summands.

**Fix.** Add a sourceIssues misprint against published p. 27 and matching v3 text: replace the induction expression by Ind_{S10×S2}^{S12}(sgn⊠1). Record sourceVersions and the search for an existing correction, and carry the corrected representation into /75’s proof input and reader. Add the 66 versus 132 dimension test, the two stabilizer actions and the 11+55 decomposition; then preserve the paper’s 891−55=836 argument. This correction repairs the displayed intermediate formula, not a claimed counterexample to Lemma 7.3.

## Why changing the group name is insufficient

Over C, the Clifford scalar −1 is the kernel of Spin(10)→SO(10), and its action on either half-spin module is scalar −1. This proves the failure of linear descent without a classification of every representation. The projective action exists, but a projective representation does not define a vector bundle on BSO(10).

The next central scalar, lifting −I in SO(10), acts trivially on the projectivized half-spin module and hence on linear sections. The proposed SO quotient therefore remembers automorphisms that induce the identity on its curve. Replacing SO by Spin increases this ineffective kernel. A corrected proof needs an effective quotient or a gerbe plus rigidification, as well as a comparison for rational Chow groups/CKgP and an audit of every tautological bundle. It must not identify a scalar-weighted universal subbundle with a Hodge bundle pulled back from a base on which that scalar acts trivially. These are the exact additional proof obligations for the fixer; this audit does not pretend to have supplied the repaired proof.

## Source-error discipline

Existing E1 (the inequality in §6.2) is correct and retained. Findings /1 and /5 should become additional `sourceIssues` after independent verification, with the published and v3 versions recorded. For /1 the effect is on the genus-seven proof and the stated intermediate stack/bundle construction. For /5 the missing S2 factor is a misprint with an explicit correction; the 836-dimensional conclusion is preserved.

On 2026-10-01 the correction search covered the Cambridge article record, the published PDF, the arXiv version history/latest v3, [Sam Payne’s publication list](https://web.ma.utexas.edu/users/sampayne/publications.html) and title/author searches for corrections involving spin and induction. No applicable correction was located. This records the search boundary rather than asserting that no correction exists anywhere. Nothing was sent to authors.

## Prerequisite repair ledger

Numbers below are one-based positions in the extraction’s `prerequisites` array.

| Entry | Actual source / separation |
| --- | --- |
| 4 | [Canning–Larson, On the Chow and cohomology rings of moduli spaces of stable curves](https://arxiv.org/abs/2208.02357), Theorem 1.4 and Lemma 10.5. The linked low-degree Hurwitz paper is different. |
| 7 | [Petersen, Cohomology of local systems on the moduli of principally polarized abelian surfaces](https://msp.org/pjm/2015/275-1/p03.xhtml), and separately [the compact-type genus-two paper](https://arxiv.org/abs/1310.7369). |
| 9 | [Petersen–Tavakol–Yin, Tautological classes with twisted coefficients](https://arxiv.org/abs/1705.08875), especially §§3.2,5.1,5.2.2. |
| 10 | [Mukai, Curves and symmetric spaces I](https://doi.org/10.2307/2375032); part II is a different paper. |
| 15 | [Totaro, The motive of a classifying space](https://arxiv.org/abs/1407.1366). |
| 16 | [Bergström–Faber, Cohomology of moduli spaces via a result of Chenevier and Lannes](https://arxiv.org/abs/2207.05130), separated from the [computation repository](https://github.com/jonasbergstroem/Cohomology-of-moduli-spaces-of-curves). |

The mismatches were checked at primary records: [1310.3859](https://arxiv.org/abs/1310.3859), [1408.4509](https://arxiv.org/abs/1408.4509), and [2110.11061](https://arxiv.org/abs/2110.11061). Fixing the URLs alone is insufficient where two inputs have been conflated. The software’s exact revision/output remains a reproducibility requirement.

Selected prerequisite reads were Canning–Larson pp.4,36 and Petersen–Tavakol–Yin v2 pp.10–11,18–20. PDF SHA256 values: `f27d56e942d3e7f50b4eb43458d1c68883d4f1a6491d124769e1a808f43f2fb7` and `315617f4038591c58032ac2ebb89260f3fa75926a3737c9519e1e533a8f1d6ec`. [Woit’s spinor notes](https://www.math.columbia.edu/~woit/LieGroups-2012/spinors.pdf), pp.1–2, have SHA256 `44864d49cddf6d189d96b1ff34c2ead6cf148d866c65b7314bba06465204458a`. No full audit of these prerequisite papers is claimed.

## Library reuse and ownership

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, read the declarations `ModularForm`, `CuspForm`, `SlashInvariantForm`, and `Module.Grassmannian`. The first three support /92’s analytic carriers; they do not prove the cusp-form/moduli-cohomology comparison. The Grassmannian carrier parametrizes quotients, and the file’s TODOs explicitly include representability and relative sheaf Grassmannians. It does not discharge the stack-bundle construction.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, read `TauCeti.spinPlusAction`, `TauCeti.spinPlusSubrep`, `TauCeti.finrank_spinPlus`, `TauCeti.Hodge.HodgeStructureOn` and `TauCeti.Hodge.MixedHodgeStructure`. In `RepresentationTheory/Spin/HalfSpin.lean`, `spinPlusAction` is an algebra homomorphism from the even Clifford algebra to endomorphisms, while `spinPlusSubrep` is a subrepresentation of `spinRep`. `Dimension.lean` proves dimension 2^(dim W−1), giving 16 for dim W=5. These are reusable pieces of the corrected construction, not a vector bundle on BSO(10) or a stack-equivalence theorem.

Full pinned-tree searches for the geometric outputs found no existing Chow-ring/CKgP, curve-moduli or Mukai theorem. The existing pure/mixed Hodge structures are imported primitives, so this is not a claim that the libraries contain no Hodge theory. Reviewed coverage SF.2, SF.5, R09.1 and R19.1 was read; MC.2 has no audit entry. All eight stage IDs directly cited by item statuses/source routes resolve. R09.4, R09.5, MC.0 and DWP.9 were also read. The current R09.1 supplier split imports the relative Grassmannian/Proj prefix from upstream roadmaps. General stack, cycle, realization and stable-curve work should retain those owners.

The current atlas, packets and roadmap proposals were searched for the proposed tautological/CKgP/Mukai direction; no duplicate owner was established. No edits to upstream roadmaps, campaign content or library coverage are proposed.

## Coverage and verification

The audit traced the finite-generation and filling arguments; genus-one and genus-two inputs; the six CKgP permanence cases; all tetragonal splitting strata; the marked Mukai model; the even-homology bounds; explicit graph bases and the pairing table; and the degree 15 boundary complex and Hodge/Galois comparison. The homology-versus-cohomology distinction in Theorem 1.5(3), the g≥2 restriction on the degree 15 statement, and the conjectural status of Conjectures 1.8/7.12 are retained.

There are 88 missing items, four planned items and one library item. Every missing item is routed exactly once. Fresh assembly contains 2907 stages and 8322 stage edges, with 76 external/proxy edges; the induced graph on known stage IDs is acyclic. There is no supplied item-level dependency graph to certify.

Independent integer calculations confirm the counts 891,264,429,6006, the half-spin dimension 16, the induction dimensions 132/66 and Specht dimensions 11/55. The dimension check directly discriminates the two induction formulas; it is not a reproduction of the full pairing calculation. The other counterexamples are the P² point pushforward and the four-point cross-ratio degeneration.

Validation: `scripts/check_redteam.py`, blueprint `intake.py check-files`, the unchanged target’s `scripts/check_paper.py`, and `git diff --check`. No Lean file is a deliverable, and no Lean/Lake build, cache download or language server was started.
