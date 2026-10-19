# Independent design review: the local Langlands correspondence for G₂

**Verdict: accepted after correction.** Reviewer: Codex, session `codex-zHQh1d`, job `REV-DESIGN-LocalLanglandsCorrespondenceForG2`, issue #3563, 19 October 2026. This session did not write the design under review.

Acceptance concerns the correctness and completeness of this target-level planning pass. It does not certify proofs of the mathematical targets. All eleven layers remain **planned**, none is closed, and every node retains `implementationStatus: unchecked`. The fifteen recorded gaps and seventeen supplier requests are substantive requirements for subsequent work.

## Inventory and scope of the check

| Item | Received | Reviewed result |
|---|---:|---:|
| Nodes | 79 | 80 |
| Definitions / constructions / theorems | 7 / 12 / 60 | 7 / 12 / 61 |
| Definition/construction API statements | 71 | 80 |
| Discriminating checks | 58 | 59 |
| Planets | 50 | 50 |
| Baseline declarations | 4 | 4 confirmed |
| Explicit gaps | 14 | 15 |
| Supplier requests | 17 | 17 |
| Source findings | 21 | 23: 22 confirmed, 1 rejected |
| Routed input items | 75 | 75 accounted for |

Every original node was checked: statement, hypotheses, proof route, source locator and match, direct dependencies, acceptance criteria, and any API, tests and planet. The packet has one checked verdict for each of its eighty resulting nodes: seventy-nine corrected and one added. All original source matches were boilerplate; each now explains the particular result supported and, where necessary, distinguishes the target from its unfilled proof contract. No source passage or source excerpt is retained.

All eight recorded public source files were read at the relevant locators and their SHA-256 hashes independently matched. The checks used the published Gan–Savin, Chenevier and Kret–Shin papers; the specified GF, CG, HKT and HD arXiv versions; and Shin's recorded author copy. A theorem number in a later publication was not silently substituted for the preprint actually read. In particular, the nontempered theta citation now points to HD Lemmas 13.4 and 13.8, PDF pp. 42 and 47, and Theorem 15.1(v), p. 52; §3.5 of that version concerns Fourier coefficients instead.

## Mathematical corrections

### Kret–Shin: reject the proposed cuspidality objection

Source finding E19 missed **Kret–Shin Proposition 13.1(4)**, PDF pp. 60–61, journal pp. 134–135. Under (St), (L-coh) and (spin-REG), it proves irreducibility of the spin Galois representation. The actual globalization on Gan–Savin p. 38 has these additional hypotheses; its argument is not based on regularity alone.

The added key-theorem node `LG.5/ks-spin-irreducibility` states precisely the central-trivial rank-three specialization. The proof of Proposition 13.1 excludes the proper projected monodromy groups G₂ and principal PGL₂: their eight-dimensional spin restrictions have repeated zero weights, respectively from `1⊕7` and `Sym⁶⊕1`. The remaining full Spin₇ monodromy acts irreducibly on spin.

For the discrete-heart globalization, one must still establish algebraicity and the right shifts for the isobaric GL₈ summands, construct their Galois representations and compare their direct sum with the spin representation. Irreducibility then forces a single summand. This supports the special cuspidality deduction and rejects E19. The general global spin transfer remains isobaric, including the exceptional G₂ `1⊞7` situation. The Kret–Shin proof-ownership and local-compatibility gate remains explicit; no existing AG2 endpoint was credited with this stronger theorem.

### Shin: supply the missing weight selection

The relevant density statement is **Corollary 4.12**, author PDF p. 24, with Definition 3.5, p. 14; Theorem 5.8, pp. 26–27, alone concludes only discrete series at infinity.

At each real place choose the dominant C₃ weight `λ_t=t(8,4,2)`, with positive integer t. Its sum is even, so it is in the PGSp₆ root lattice. Adding `ρ=(3,2,1)` gives `h=(8t+3,4t+2,2t+1)`. The inequalities `h₁>h₂+h₃` and `h₂>h₃>0` distinguish all eight half-signed sums: the largest nonzero coordinate of a difference dominates the remaining coordinates. Meanwhile all positive-root pairings tend to infinity. The common central shift used for cohomological normalization does not change these distinctions.

This supplies the spin-regular sequence needed in the density proof. E20 is confirmed as an omitted refinement, now supplied in the proof sketch, rather than evidence of a false globalization conclusion. Density proof ownership, the finite positive-mass atoms, packet substitution and the global quadratic correction remain supplier obligations. The packet and reader no longer list the elementary weight-cone choice itself as unresolved.

### Multiplicity-sensitive spectral definitions

Gan–Savin §10.2, p. 28, defines the period spectrum by an orthogonal complement and derives nonzero period for copies contained in it. The previous API promoted that implication to an iff for arbitrary embedded copies. That converse can fail when isomorphic copies occur with multiplicity.

The corrected API specifies the zero-period closed spectral span, its orthogonal complement, projection and quotient property. A new multiplicity-two test distinguishes the diagonal selected copy from an arbitrary nonzero-period copy. The generic cuspidal spectrum likewise specifies the selected multiplicity subspace and retains its actual automorphic multiplicities; it no longer invokes an unprovided general multiplicity-one assertion. Its third test now distinguishes a selected diagonal copy from an excluded anti-diagonal zero-Whittaker copy.

### Full Weil–Deligne conjugacy and dependency closure

CG Lemma 3.10 and Proposition 3.12, PDF pp. 9–11, provide the compact/semisimple conjugacy input. Density of a compact form and character comparison alone do not justify pointwise conjugacy for every nonsemisimple element of the algebraic SL₂ factor. The full GS Lemma 12.2 target is preserved, but its commuting-unipotent extension is now an explicit fifteenth gap. No false counterexample to that lemma is asserted.

Every supplier request is now a direct prerequisite of each listed consumer; previously some requests appeared only in prose. The analytic gamma input is also a direct prerequisite of gamma compatibility. Sixteen direct edges were added to existing nodes, in addition to the new theorem’s three dependencies. The exact Arthur/Xu, Rankin–Selberg and isolation supplier statements were read; weaker tempered-dual isolation and almost-everywhere Galois matching were not treated as their stronger requested extensions. Local parameters assigned by Arthur are distinguished from global Arthur A-parameters. Irrelevant local-WD boilerplate was removed from global spectral/construction hypotheses.

## Source-finding verdicts

The packet records a reason and this review's job id on every finding.

- **E1–E18 confirmed**, with the original mathematical scope retained. In particular E1 is the separate selfdual S₃ enhancement gap; E16 is the incorrect discrete PGSp₆ intermediate codomain, witnessed by the generic subregular member and its proper Siegel-induced partner in HD Theorems 8.5 and 15.2; E17 is the invalid increasing-index subsequence claim, repaired by Fell closure and isolation; E18 is the uncontrolled additional finite-place factor in the gamma comparison.
- **E19 rejected** for the full-hypothesis irreducibility reason above.
- **E20–E21 confirmed as omissions**, not counterexamples to the conclusions. E21 retains the proper-Levi, lower-tower twist and packet-fibre calculations as explicit targets.
- **E22 added and confirmed**, scoped to the HKT v3 proof of Lemma 4.6, PDF p. 21: a nonzero complex spinor need not be nonisotropic. Complete reducibility supplies a nondegenerate fixed subspace and hence the nonisotropic spinor required for the G₂ stabilizer argument. This does not change the lemma's statement and makes no claim about the later published proof.
- **E23 added and confirmed**, scoped to Shin's author PDF: the proof of Theorem 5.8, p. 27, labels item 4.12 a proposition although it is a corollary on p. 24. This also explains the inherited packet label.

The correction searches are recorded with their bounded scope. The review makes no claim that no later correction exists.

## Baseline, ownership and presentation

All four baseline references were confirmed at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; none was removed or replaced:

| Declaration | Source read | What it actually supplies |
|---|---|---|
| `Matrix.diagonal` | `Mathlib/Data/Matrix/Diagonal.lean`, lines 50–51 | The diagonal matrix over a type with zero. |
| `Matrix.charpoly` | `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`, lines 134–135 | The characteristic polynomial for finite square matrices over a commutative ring. |
| `Matrix.charpoly_diagonal` | Same module, line 152 | The product of the diagonal linear factors. |
| `spinGroup` | `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean`, lines 293–300 | The existing Clifford submonoid, without exceptional parameter or pinned-group comparisons. |

The formal Tau Ceti baseline remains `f790474821cf4256814db967cb154e7af3d0c369`. Current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` were separately inspected. OrthogonalSpinGroups and SpinRepresentations were read alongside the relevant ReductiveGroups and ClassFieldTheory layers. Existing D₄ triality, the G₂ short-root integral toral-closure carrier, Clifford representations and spinor norms remain imported work. Their comparison with the particular octonion and central-quotient models remains required. No upstream files were edited or existing foundation replanned.

The reviewed library audit entries AL.3–AL.4 (AUDIT-14) and MP.3 (AUDIT-15) were checked. Their limited matrix and coinvariant support is reused; a missing audit entry for the new roadmap is not treated as proof of absence.

The API now includes the four matrix milestones already in the suggested file, quotient factorization for weak classes, parameter-map extensionality, and spectral projection properties. All nineteen definitions/constructions have at least three discriminating checks. The fifty existing planets remain mathematical targets, with at most six per layer. The roadmap stage summaries and stage-level dependencies were regenerated from the corrected nodes. The reader includes every hypothesis, API, Check, source match, gap, request, finding verdict and routed input assignment.

## Validation and remaining routing decisions

- `python3 scripts/check_blueprint.py research/blueprint/packets/LocalLanglandsCorrespondenceForG2.json`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/LocalLanglandsCorrespondenceForG2.lean`: **exit 0**, at the pinned Mathlib commit, only twelve declaration-uses-`sorry` warnings. The file has four real-bodied light definitions, five theorem signatures and seven examples; the added `(a,b)=(2,3)` example distinguishes the reciprocal weights. No heavy carrier or sorry-valued data definition was introduced.
- JSON, reader/packet synchronization, requested-consumer edges, planet counts and submission-path checks pass.

No further change is required for this review. The orchestrator still needs to route the existing proof gates: addressable exceptional-theta contracts, classical Rallis/tower ownership, the GSpin/G₂ descent proofs, density proof ownership, the selfdual enhancement and club-spin bridge, the extra-place gamma comparison, proper-Levi/lower-tower calculations, and the two full-WD/weak-discreteness comparisons. These remain explicitly in the accepted plan and do not become claims of completed mathematics.
