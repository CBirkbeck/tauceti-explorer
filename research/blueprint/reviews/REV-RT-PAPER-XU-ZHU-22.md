# Independent verification of RT-PAPER-XU-ZHU-22

Codex, session `codex-rtOQ9t`, 2 October 2026. Job [#4165](https://github.com/CBirkbeck/tauceti-explorer/issues/4165). Repository base: `2b40cf16025787f14a3d388a0ce7ac5a35b62340`.

All **52 findings are confirmed**: four high, nineteen medium and twenty-nine low. Confirmation means that the identified defect warrants correction. It does **not** endorse every proposed repair. The [verdict JSON](../redteam/RT-PAPER-XU-ZHU-22.review.json) gives an individual reason, corrected repair and any remaining source obligation for every finding.

This review changes only that JSON and this report. It does not apply fixes to the extraction, reader, routes, prerequisites or red-team result.

## Independence and method

The issue histories identify different authors for each excluded job: PAPER-XU-ZHU-22, Claude Code `cc-39fac3`, [PR #2024](https://github.com/CBirkbeck/tauceti-explorer/pull/2024); REV-PAPER-XU-ZHU-22, Claude Code `cc-fb70e5`, [PR #2553](https://github.com/CBirkbeck/tauceti-explorer/pull/2553); RT-PAPER-XU-ZHU-22, Claude Code `cc-c2c06b`, [PR #5625](https://github.com/CBirkbeck/tauceti-explorer/pull/5625). I did none of those jobs. The bot confirmed my winning claim before work began.

I read the full 71-page arXiv v2, all 69 extracted items, all five route briefs/reasons, all 21 prerequisite entries, the existing source-issue records, and every finding's claim, evidence and proposed fix. I checked the cited passages myself, including the displayed formula on v2 p.44. Existing reviews supplied context, not mathematical authority. For overlaps I read the actual relevant extraction statements, route contracts, atlas stages and packet nodes rather than infer coverage from paper titles or search matches. Library conclusions below use statements at the specified commits.

The journal comparison is deliberately limited to the passages needed to distinguish versions. I have not collated all 96 journal pages. Likewise, confirmation of a missing citation or prerequisite is not a claim to have re-proved every secondary paper.

## Public sources and version control

These public PDFs were obtained on 2 October 2026. Hashes identify the bytes checked; page references in the verdicts default to **arXiv v2** unless explicitly marked journal or another source.

| Source | Pages read for this verification | PDF SHA-256 |
| --- | --- | --- |
| [Xu–Zhu, arXiv:1910.13391v2](https://arxiv.org/pdf/1910.13391v2) | All 71 pages | `b8d153ef1822a20e8179005d4775e43fc3af7430d840d2b077b45cb8583667cd` |
| [Xu–Zhu, published article, institutional copy](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/11999-Xu-Zhu2022_Article_BesselF-isocrystalsForReductiv.pdf) | PDF pp.4–5,7,44–45,51–55; printed pp.1000–1001,1003,1040–1041,1047–1051 | `1c77d672dc14a3b44f30a96c9956c2890188615fbe0bba945aec30be5c86d47a` |
| [Abe, nearby cycles, arXiv:1805.00153](https://arxiv.org/pdf/1805.00153) | pp.10–12: Definition 3.2, Theorem 3.8 and their category restrictions | `caa0eb0a040c4974e67c248a9ea371d553a25e1881410a545ea77c89b2a95000` |
| [D’Addezio, monodromy, arXiv:1711.06669](https://arxiv.org/pdf/1711.06669) | pp.23–24,28: Theorems 4.1.1 and 4.3.2 | `a5dd5f330a8fd68d569efe11851876c83d580fe7ce0b0211bce0d4821ea2b090` |
| [Tsuzuki, arXiv:1910.03871v3](https://arxiv.org/pdf/1910.03871v3) | p.28: Corollary 6.5 and Remark 6.6 | `611090d2e371483ff7996170368255462eeae03e5277c93a2ec406ac47c18457` |
| [Heinloth–Ngô–Yun, published author copy](https://math.mit.edu/~zyun/Kloosterman_published.pdf) | PDF pp.10–11, printed pp.250–251: canonical Iwahori filtration | `a821a39d6463a8e2d3c206710f2d2b717cd36db5fbee6a8659aa66f763880c7f` |
| [Gross–Reeder, author preprint](https://abel.math.harvard.edu/~gross/preprints/adjointgamma3.pdf) | pp.25–27,30–32,37: ramification, Proposition 5.3 and §5.6 | `1840baea6d5fd9f408013c78efc0a33cedb6c287ad4bd7f0a86b5801b6e9939a` |

The journal has already corrected the integral-Kummer-lift theorem underlying finding /3: Theorem 4.2.1 is untwisted, and Remark 4.2.2 discusses matching multiplicative characters. The false preprint theorem must be corrected in the extraction without reporting it as the current journal theorem. In contrast, the smaller coefficient field in the introduction, the I(2) definition and the affineness claim persist in the inspected journal passages. Journal Lemma 4.2.7(i) corresponds to preprint Lemma 4.2.4(i). The Gross–Reeder author preprint also has different numbering from the cited journal: its Proposition 5.3 and §5.6 are the verified locations.

## Repairs that must differ from the red team's proposal

- **/4:** The quasi-minuscule punctured-surface example disproves affineness and degree-zero concentration. A triangle with a holonomic first term and cone in degrees ≥0 gives vanishing in negative degrees and an injection into H⁰; it permits nonzero positive cohomology. The revised H⁰ comparison still needs its relative-overconvergence proof. Do not declare the entire main comparison theorem repaired by changing the lemma alone.
- **/11:** RD.6 already plans `grothendieck-ogg-shafarevich-formula` and the isocrystal Swan conductor. Import them. A maximal-slope bound gives `Irr ≤ rank × maximum formal slope`; it does not by itself give `Irr ≤ formal Irr`.
- **/17, /41:** D’Addezio's theorems compare component groups and common connected reductive groups with compatible faithful representations, after finite coefficient enlargement and under compatible-system/semisimplicity hypotheses. They do not provide the alleged surjection. The current DAD extraction also moves the shared overconvergent Crew/Weil prefix to the ABE-18/25 arithmetic-D-module continuation; only the additional comparison theory stays in DAD Part II.
- **/29:** The proposed rank-two characteristic-two example violates the coprimality hypothesis. The independently checked rank-three characteristic-two example below satisfies it and proves the extension-iterate defect.
- **/45:** The convolution equality needs n≥2, but the separate n=1 decomposition SO4 → SO3 ⊕ 1 is valid. Along diagonal SL2, `Std ⊗ Std = Sym² Std ⊕ det`; retain that exceptional-isomorphism case.
- **/47:** The source first constructs the Iwahori quotient for **Sp(2n)**; SO(2n+1) is its dual. Retain the valid symplectic paired and affine vectors. Correct the middle vector to E(n,n+1) and restore the coefficients. Substituting odd-orthogonal matrices there would introduce a new error.
- **/51:** Gross–Reeder's definition includes a discrete local **Weil parameter**, with the adjoint conditions. A bare inertia homomorphism is insufficient. Preserve the prime-to-|W| scope of the Coxeter/break theorem.

Further qualifications appear in the individual reasons: general-base algebraic loops are not automatically Witt-vector Grassmannians (/7); FSY's algebraic D-module foundation does not supply stack/de Rham Satake by itself (/8); Abe's equivalence concerns the constituent-Frobenius category (/13); and BG1's order on B(G) includes equal κ, unlike the raw coroot order (/50).

## Independent mathematical controls

I used exact finite-field enumeration and integer matrix arithmetic, without floating-point comparisons. The following specifies the controls so the results do not depend on private scratch files.

| Finding | Calculation | Result |
| --- | --- | --- |
| /1 | n=2, p=3, a=1; sum ψ(x+1/x) for x∈F3×, with ζ³=1 and ζ≠1 | Raw sum ζ+ζ²=−1; normalized value 1/√3 |
| /2 | Square every unit in F2[y]/(y⁴), and compare determinant of diag(1+y,1) | Unit squares are 1 and 1+y²; 1+y is not a square |
| /23 | n=2, q=3, a=2; sum ψ(2s+t+2/t) for (s,t)∈(F3×)² | Residue counts (0,2,2), raw sum −2, normalized −2/3; SO4 gives 4/3 |
| /29 | n=3, p=2, a=1; sum (−1)^Tr(x+y+1/(xy)) for x,y≠0 | F2 raw −1, normalized −1/2; F4 raw 5, normalized 5/4 |
| /47 | Test AᵀJ+JA=0 at n=2,3,4 for the displayed Sp vectors | Paired vectors and E(2n,1) pass; E(n−1,n) fails; E(n,n+1) passes |
| /47 | Same test with the source's symmetric anti-diagonal form at n=3,4 | Both SO(2n) highest and lowest vectors belong to the Lie algebra; the affine term needs the lowest positions |

For the F4 control use F2[u]/(u²+u+1), Tr(z)=z+z², and enumerate its three nonzero elements in each variable. Seven of the nine pairs have trace zero and two have trace one. The normalized rank-three sum is q⁻¹ times the raw sum. Both sums evaluate at the same degree-one point; the F4 trace therefore requires the square of its Frobenius rather than the one-step product. This is an admissible coprime-rank example.

For /1, Q3(μ3)=Q3(√−3) is ramified quadratic. If it also contained √3, it would contain √−1, the unramified quadratic extension, a contradiction. A uniform field must include the selected √p along with π, and the q-Frobenius statement must use Fq. For /2 the determinant obstruction survives scalar changes modulo squares, so it also detects the PGL2 defect; arbitrary high odd powers give the same obstruction. Use the canonical filtration verified in HNY rather than the commutator-plus-center formula.

For /4, the odd-characteristic PGL2 quasi-minuscule fibre is a normal surface minus its vertex, locally A²/{±1}. The rank-one coefficient extends across that vertex; rational smoothness in characteristic-zero coefficients gives a nonzero IC costalk. In the family the cone contributes a rank-one object on X in holonomic degree 1. Thus positive cohomology cannot simply be discarded. This is a counterexample to the stated concentration argument, not a disproof of the ultimate comparison theorem.

## Library and owner checks

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, I read `IsSl2Triple` in `Mathlib/Algebra/Lie/Sl2.lean` and `gaussSum` in `Mathlib/NumberTheory/GaussSum.lean`. The first has the nonzero-h and genuine sl2 bracket relations; the second is the finite multiplicative/additive-character sum. Scoped Lie/category searches did not supply principal-nilpotent, Jacobson–Morozov, Kostant-decomposition or abstract neutral-Tannakian recognition theorems. These searches do not establish absence throughout unrelated library areas.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, I read `TauCeti.Tannaka.fgPointTensorIsoEquiv` in `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean`: it reconstructs points as tensor automorphisms for an **already given Hopf algebra**. It is not abstract neutral recognition. I also read the root-system chamber definitions/membership API in `TauCeti/LinearAlgebra/RootSystem/Chamber.lean`, including `dominantChamber`. Existing root/Lie/representation theory remains credited; no library-wide claim that only sl2 triples exist is justified.

For suppliers I checked the pertinent reviewed audit entries and the actual atlas/packet statements, including GlobalShtukas GS.0/GS.1; GeometricSatake GS0/GS1/GS3 and semi-infinite geometry; RD0–RD7 with Dwork, local monodromy, Swan and GOS nodes; MC6 reconstruction/recognition; BG1 Newton order; FF2 Artin–Schreier; FA6 automorphic theory; and RG2.2/RG2.3. The reviewed audit is supplemented by actual planned contracts where it has no matching entry; a planned node is never called implemented.

The cross-paper comparisons use the current FSY /61, DAD /8,/33,/58,/61,/75, TSUZUKI /164, ABE-18 /25, KP18 /P05,/M01, ZHU17 /T01,/E09 and BCGNT /53 statements and route scope, together with the GAN-HARRIS-SAWIN-ETAL-24 area adoption, the existing FF2 Artin–Schreier consumer and general stack owner. Shared machinery is imported once; distinct coefficient categories, carriers, normalizations and remaining scope gaps stay explicit.

## Finding index

Every row is **confirmed**. Full evidence and repair qualifications are in the corresponding numbered JSON reason.

| Finding | Severity | Verified defect / required qualification |
| --- | --- | --- |
| /1 | High | Uniform coefficient field and q-base mismatch |
| /2 | High | I(2) definition fails in bad characteristic; canonical filtration needed |
| /3 | High | Integral Kummer lifts; journal already narrows the theorem |
| /4 | High | Nonaffine τ and positive cohomology; H⁰ proof remains to close |
| /5 | Medium | Global slope filtration incorrectly assigned to local RD.1 |
| /6 | Medium | Missing FSY shared Kloosterman-object import |
| /7 | Medium | General-base algebraic-loop geometry supplier gap |
| /8 | Medium | Algebraic D-module and de Rham stack/Satake interfaces |
| /9 | Medium | Omitted located prerequisites and stale Abe status |
| /10 | Medium | Trace/weights/recognition/stack/Artin–Schreier imports |
| /11 | Medium | Missing slope input and wrong André citation; reuse existing GOS |
| /12 | Medium | Automorphic bound and Newton-specialization contracts |
| /13 | Medium | Missing precise Abe smoothness criterion and restricted category |
| /14 | Medium | Composite interfaces obscure planned versus missing leaves |
| /15 | Medium | Absolute specialization comparison planned twice |
| /16 | Medium | Unlocated principal-unipotent/Lie theorem inputs |
| /17 | Medium | General monodromy duplication; supplier split and theorem correction |
| /18 | Medium | Missing affine direct-image t-exactness and actual big-cell geometry |
| /19 | Medium | A.9 drops the forget-Frobenius qualifier |
| /20 | Medium | A.1 proof lacks constant-Newton locus and compatible maximal quotients |
| /21 | Medium | Missing all-prime ordinarity and toric theorem contracts |
| /22 | Medium | Miyatani convolution input missing; exact scope remains a source gate |
| /23 | Medium | False n=2 Landau–Ginzburg formula |
| /24 | Low | Coalesced parent title omits p-adic weights |
| /25 | Low | Shared convolution operation omitted; tame/wild objects remain distinct |
| /26 | Low | Hyperbolic-localization geometry import and model scope |
| /27 | Low | Global function-field area misrouting |
| /28 | Low | Final theorem contracts and supplier names incomplete |
| /29 | Low | Extension traces need Frobenius iterates; valid replacement control |
| /30 | Low | Rank-one exception to the Katz table |
| /31 | Low | Missing minus sign under weight duality |
| /32 | Low | LA over divisor does not imply LA over ambient base |
| /33 | Low | Seven six-operation/LA/localization source slips |
| /34 | Low | General f! base change and admissible base extensions omitted |
| /35 | Low | Nonintegral ρ and p-versus-q normalization |
| /36 | Low | Wrong introductory local-monodromy locator |
| /37 | Low | Half Tate twist left implicit |
| /38 | Low | Residue/Frobenius conjugation sign; full convention bridge needed |
| /39 | Low | Variables, dual center and citation/locator corrections |
| /40 | Low | Fibre detection must cover all rigid closed points |
| /41 | Low | Invented surjection and unproved ambient/geometric comparison |
| /42 | Low | Characteristic-two type-A table lacks central-quotient cases |
| /43 | Low | Lowest-root component and parameter confused |
| /44 | Low | External-product ULA/vanishing-cycle adapter missing |
| /45 | Low | Convolution range n≥2; preserve true n=1 decomposition |
| /46 | Low | Middle Frobenius eigenvalue is 1 |
| /47 | Low | Matrix/coefficient errors; original group is Sp, not its dual |
| /48 | Low | Appendix coordinate/sign and Frobenius transport omitted |
| /49 | Low | Exceptional Spin7→G2 representation-ring argument |
| /50 | Low | Shared chamber/order foundation; B(G) scope differs |
| /51 | Low | Simple-wild definition/theorem extraction with Weil/prime scope |
| /52 | Low | Explicit formula and theorem-page locators |

## Limits and validation

The precise secondary convolution, toric, comparison and general Lie theorem contracts must still be extracted from their primary sources by the fixer. In particular, I verified Xu–Zhu's explicit Miyatani citation and the missing dependency, not every parameter version of the original convolution theorem. The revised main comparison, A.1 and ambient monodromy comparison require the proof steps identified in the verdicts. Confirmation records those genuine gaps rather than assert the missing arguments are already complete.

Validation: `scripts/check_redteam.py` passes; `research/blueprint/intake.py check-files` passes for both deliverables; exact result/review ID coverage and verdict counts pass; exact arithmetic controls pass; `git diff --check` passes. No Lean deliverable is requested, and no Lean compilation, Lake bootstrap, cache download or language server was run. Nothing here is claimed formalized.
