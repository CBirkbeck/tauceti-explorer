# PAPER-YANG-ZHAO-25 — non-acyclicity classes and characteristic-class comparison

Partial research checkpoint by Codex, session `codex-a71f92`, for issue #1218. This is a paper extraction, not an implementation or a closed blueprint.

## Result and reading boundary

The extraction records 114 interfaces: 4 baseline items, 8 planned interfaces and 102 missing items, with 230 acyclic dependency edges. Its 45 definitions/constructions carry 135 API entries and 135 mathematical specification tests. Every missing item has exactly one route. Eleven explicit gaps prevent a completion claim.

The entire [arXiv v4](https://arxiv.org/pdf/2209.11086v4), including all proofs and references on pp.1–51, was read. The authors label it their final version but explicitly warn that its numbering differs from the journal. The [journal record](https://link.springer.com/article/10.1007/s00222-025-01319-y) establishes Inventiones 240 (2025), 123–191; the full subscription text was not obtained. Locators below therefore name arXiv v4, not unverified journal pages.

The author's [alternative fibration proof](https://yelmath.github.io/PFF.pdf) was read visually in full: eleven image pages, printed 31–41. It replaces the longer difference-of-prisms argument with a nine-diagram identity. The author calls it an alternative proof, not an erratum. The extraction retains both proofs and records their different numbering. Selected Hansen–Scholze, Umezaki–Yang–Zhao and Saito passages were also read; their exact scopes and SHA-256 hashes are in `sourceLedger`. Selected Lu–Zheng and Laumon readings from the immediately preceding Abe audit are reused with their original limited scope.

## What is proved, and what is not

For a Noetherian base and the paper's torsion Noetherian coefficients, the central diagram is Z→X→Y→S. Write U=X\Z, K_X/Y=f!Λ, and K_X/Y/S for the explicit diagonal-transversality defect. Three conditions must not be conflated:

- C1 makes K_Y/S locally constant and gives its specified inverse through diagonal evaluation.
- C2 is the pair H0(Z,K_Z/Y)=H1(Z,K_Z/Y)=0.
- C3 says F is ULA over S and ULA over Y on U.

Under C1 and C3 the tilded non-acyclicity class has coefficients K_X/Y/S. Only with C2 is it transported to the untilded class with coefficients K_X/S. The fibration theorem identifies C_X/S with the diagonal action on the uniquely extended C_X/Y plus the image of this particular supported class. Merely showing that the difference restricts to zero on U does not identify the supported lift: the localization exact sequence need not make that lift unique.

For smooth g:Y→S of relative dimension r, the diagonal action is cap product with c_r(f*Ω_Y/S^∨). This top-Chern factor is not an identity map.

Over a perfect field of characteristic p>0 with finite local coefficients of residue characteristic ℓ≠p, the main local theorem is

`C^{x}_X/Y/k(F) = −dimtot RΦ_x(F,f)`

for separated finite-type f:X→Y to a smooth curve, ULA off the single closed point x. X need not be smooth. Total dimension is the alternating rank-plus-Swan invariant, after the appropriate derived coefficient reduction. The origin skyscraper has Φ=Λ[1], hence total dimension −1 and class +1. This test catches the wrong Fourier/vanishing-cycle sign.

The finite-set formula and cohomological Grothendieck–Ogg–Shafarevich formula follow. Proper pushforward gives the conductor formula without assuming smooth X, flat f or projectivity. For a positive-dimensional bad fiber, its source tilded class need not have an untilded counterpart. The target curve's support-vanishing is what permits the inverse comparison after pushforward.

The final comparison cl(cc_X(F))=C_X/k(F) is proved for **smooth quasi-projective X**. It does not prove the embeddable-singular Conjecture 6.12. The source also leaves the supported Bloch localized-Chern identity and the general non-isolated cotangent/non-acyclicity comparison conjectural. Only their explicitly stated weaker global or finite-support consequences are extracted as theorems.

## Proof decomposition

| Items | Work isolated |
| --- | --- |
| L01–L04, B01–B07 | Existing quasicategory/derived/K0 carriers; actual coefficient, ULA and relative-duality extensions |
| T01–T20 | Exchange morphism, transversality, composition/pullback/pushforward, diagonal purity, defect functor |
| C01–C21 | Correspondences, characteristic classes, support extension, base change, blowup and specialization |
| N01–N15 | Defect coefficient object; the two non-acyclicity classes and their separate functoriality hypotheses |
| S01–S17 | Stable coherent lifts, difference prisms, correspondence cube, both fibration proofs |
| A01–A14 | Fourier deformation, absolute-integral-closure extension, Milnor/GOS/conductor formulas |
| M01–M16 | Positive-characteristic micro-support, characteristic cycles, Chow induction and final comparison |

The original proof constructs a coherent cube by unstraightening the sheaf-valued correspondence functor. Its exchange map is characterized by cocartesian and locally cartesian lifts. Passing to cofibers then preserves the needed higher coherence. The final prism comparison explicitly matches the restriction homotopy β and acyclicity homotopy γ.

The alternative proof gives a reusable lemma in a stable infinity-category: from a nine diagram and three compatible maps out of A, vanishing of Hom(A,K00) and Hom(A,ΣK00) identifies the middle map as the sum of the two unique lifts. In the geometric application, A=Λ and K00=τ*K_Z/Y; C2 supplies exactly those two vanishings. The alternative still needs the coherent exchange cube. Neither proof can be supplied by ordinary triangulated K0 or by arbitrary choices of cones.

The local Milnor proof deforms by the Artin–Schreier kernel, passes to a finite parameter cover with a ULA extension, and compares the 0 and infinity fibers. The latter is supported on the isolated point; local Fourier theory identifies its alternating dimension. The proof needs descent of both the complex and its prescribed identification on the open chart. A nontrivial additive character is not automatically available in every finite local coefficient ring: for example F3 has no nontrivial character into F2×. The required coefficient extension/descent remains an explicit gap.

## Ownership and library evidence

The pinned commits remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The cited declarations were read in those source trees. Mathlib supplies the quasicategory horn-filling predicate and ordinary derived localization. Tau Ceti supplies generic triangulated K0, its triangle relation and shift signs. None constructs a stable infinity-category, étale ULA complex or non-acyclicity class.

Reviewed AUDIT-22 establishes the missing stable/enhanced machinery in EnhancedDerivedSheaves. AUDIT-18 distinguishes partial ordinary inputs from the absent ctf/support/Gysin/cycle/trace constructions. AUDIT-19 does not turn ordinary trait nearby cycles into a general-base Fourier theorem. Full nearby upstream GrothendieckEulerForms and CharacterTheory documents were read in the preceding, directly shared Abe investigation; this work imports their carriers instead of planning them again.

There are five routes:

1. **EnhancedDerivedSheaves** receives the generic cofiber-lifting, difference-square and nine-diagram constructions inside E0/E1/E3/E5:abstract.
2. **EtaleDualityAndPerverseSheaves** receives only the already scoped field support, semipurity, ordinary Chow/Gysin and smooth-center blowup interfaces.
3. **EtaleDualityAndPerverseSheavesPartIIRelativeTraces** reuses the pending ID from PAPER-ABE-25. It extends that relative-trace prefix with generalized transversality, the supported defect and coherent fibration/Milnor/conductor proofs.
4. **LefschetzPencilsAndVanishingCyclesPartIIGeneralBasesFourier** also reuses the Abe proposal: the shared exponential deformation and ULA extension are built once.
5. **EtaleDualityAndPerverseSheavesPartIIMicrolocal** reuses the Shende–Tsimerman proposal. Its brief already requires a separately sourced positive-characteristic branch. This extraction supplies that branch's Saito comparison target, not a deduction from complex conormal topology.

Pending proposals are **missing**, not accepted planned stages. No guessed stage IDs or retired suppliers are used.

The item-level dependency graph is important: early ULA/transversality and independent microlocal definitions precede Fourier/Milnor; the final Saito comparison is later. The weak localized-Chern conductor comparison consumes the early Chern construction, not the late Saito theorem. Replacing these prefix contracts by mutually dependent whole-roadmap imports would introduce a false cycle.

## Source issues and independent checks

Seven version-specific findings are recorded in `sourceIssues`, without independent-review verdicts:

| Finding | Locator in arXiv v4 | Disposition |
| --- | --- | --- |
| E1 | p.8, §2.3(3) | δ!G must remain δ!G in the description of the left vertical arrow; the printed Λ is a slip |
| E2 | p.16, §3.6 | A correspondence from G to F uses D(G), not D(F), in both tensor descriptions |
| E3 | p.21, Lemma 3.14 proof | The evaluation description omits the G factor and uses the wrong relative dualizing base |
| E4 | p.27, Proposition 4.14 | The target vanishing uses Y, not undefined Y'; spell out the target inverse comparison |
| E5 | p.28, Proposition 4.15 | The composable base map is e0 f', not f'e0 |
| E6 | p.50, Theorem 6.13 proof | A finite étale pushforward is not generally a constant direct sum |
| E7 | p.15, Lemma 3.2 | The specialization F=Λ requires Λ to lie in the ULA domain |

E1–E6 were checked against page images. E7 follows from the stated domain and was checked in the continuous text reading. The coefficient-rank convention for nonlocal rings is also made explicit, rather than silently treated as a single integer.

For E6, take k=F2, k'=F4 and Λ=F3. Frobenius on σ*Λ swaps two basis vectors; on Λ² it is identity. Their traces are 0 and 2, and their invariant spaces have dimensions 1 and 2. The printed sheaf isomorphism is therefore false. The needed class equality is repairable: projection gives F⊗σ*Λ, cohomological classes obey the rank-twist lemma, and characteristic cycles obey rank twisting by étale-local trivialization and additivity. Division by the degree occurs after applying cl into Λ-cohomology, not in the integral Chow group. This corrects a proof step; it is not evidence against the final theorem.

The correction search covered the journal page, arXiv history, current and older author pages, the complete alternative proof, and title searches with correction/erratum. No matching correction was found. “New” records that search outcome only; the full journal-version comparison is still open. Nothing was sent to authors.

## Why this remains partial

The full main text is read, but source closure is not achieved. The highest-value next step is obtaining the final Umezaki–Yang–Zhao journal statements. Its inspected arXiv v4 good-pencil lemma assumes projectivity, and its Chow induction proposition requires smooth properly transversal fibers on the divisor of the rational differential. Those exact conditions must be reconciled with the quasi-projective reduction cited in Yang–Zhao's final proof. No disagreement between versions is invented and no false-theorem claim is made from the older preprint alone.

Other remaining leaves include the actual enhanced correspondence realization, purity domains, Hansen–Scholze's full extension proof, Ψ-goodness, additive-character descent, Beilinson/Saito existence and integrality, and Bloch's localized Chern construction. The JSON gaps identify their consuming items. Some foundational interfaces must still be expanded against supplier blueprint nodes; this checkpoint does not claim every generic six-operation leaf has been decomposed.

## Validation

The handoff records the executed checks. The 135 specification tests are not Lean results. No suggested Lean file is part of this paper issue's authorized deliverables, and no Lean compilation or formalization is claimed.
