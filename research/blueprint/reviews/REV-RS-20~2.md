# REV-RS-20~2 — Fargues–Fontaine restructuring, second review

Verdict: **needs_changes**. This is a completed independent restructuring review, not a completed blueprint or a formalization claim.

Reviewer: Codex, session `codex-a71f92`; key `independent-review-REV-RS-20~2`.
Date: 2026-09-23. Refs #1616.
The original proposal is attributed to `gpt-20260921-c74f2a`; the earlier review and its seven amendments are by `cg-6b83f1`. Neither is this reviewer.

## 1. Decision and exact remaining blocker

The current proposal preserves the earlier review's RF3 warning but does not implement the missing owner or construction-order split. The inherited node `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map` still supplies the relevant target ledger, not an established proof.

For a line bundle L and its nonnegative graded section ring P, a positive-degree homogeneous section g gives a chart construction on its nonvanishing locus X_g. The chart maps initially glue on

`U = union of X_g, for positive-degree homogeneous global sections g.`

A global map from X requires a proof that U = X. Quasicompactness does not supply this premise: it only reduces an existing cover to a finite subcover. The degree-one twist on Proj(P) also need not be invertible for an arbitrary graded P. One must identify the degrees, local trivializations and pullback comparison actually used. These are construction hypotheses, not consequences of a successful graph check. See [Stacks 27.14, tag 01NJ](https://stacks.math.columbia.edu/tag/01NJ) and [Stacks 27.10, tag 01MM](https://stacks.math.columbia.edu/tag/01MM).

A negative test is X = projective 1-space over k with L = O(-1). Every positive tensor power has no nonzero global sections; H^0(O_X) = k. Consequently P is concentrated in degree zero, Proj(P) is empty, and nonempty X cannot map to it. This uses [Stacks Lemma 30.8.1, tag 01XS](https://stacks.math.columbia.edu/tag/01XS). It refutes the extracted unconditional construction, not the Fargues–Fontaine theorem with its actual hypotheses.

Fargues–Scholze Proposition II.2.7 is stated with positive-generation and cohomology-vanishing hypotheses. Its proof's chart construction cannot be detached from the covering and twist requirements of that context. I checked printed pp. 66–67 in both extracted text and page images. [Author PDF](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf)

The current atlas and proposal retain both the direct edge RF3 -> VB2:ampleness and the path RF3 -> VB1 -> VB2:ampleness. Adding VB2:ampleness -> RF3 is cyclic. The general isocrystal functor also cannot be imported from the completed VB1 stage to construct RF3's earlier rank-one objects.

Required before acceptance: choose and implement one precise acyclic construction.

- Prove an early covering/twist lemma from earlier objects, with an exact owner, hypotheses and proof that does not use the global map; or
- Split the early rank-one/graded-ring/chart-map construction from the later global-map comparison, and place the latter after a proved positive-generation input.

In either case preserve the full global morphism and tautological comparison targets and retarget their actual consumers. An asserted property field, a reverse edge, or replacing X by U and declaring the original target complete is not a repair. The choice affects stage/node ownership and cannot be made by a wording-only review amendment.

## 2. Changes made in this review

Exactly one mathematical rationale was clarified: the link `RelativeFarguesFontaine:RF3 -> VectorBundlesAndIsocrystals:VB2:ampleness` still described the "formal Proj map" as an early input. It now identifies the early rank-one, graded-algebra and chartwise inputs and explicitly retains the unconstructed global-map/twist target and unresolved acyclic ownership. No endpoint or graph edge changed.

The top-level review object now names this review, dates it, and records the completed negative verdict. The prior seven amendments were preserved, not newly claimed as this reviewer's work. Their full provenance remains in `reviews/REV-RS-20.md`; the author's original report is also unchanged. No roadmap document, atlas file, inherited decomposition or library-audit file was edited.

## 3. Independent recheck of the prior amendments

| Earlier amendment | Independent check and disposition |
| --- | --- |
| Relative quotient input | RF1 -> integral-divisors is present. The quotient-curve branch needs the actual relative quotient, not just fixed-field F2. Retain. |
| Integral chart coordinate | The image of FS p. 48 gives t_1^sharp = pi/[varpi]. It is defined where [varpi] is inverted and survives pi = 0. Extracted text mangles this fraction, so the image is decisive. Retain the correction instruction for the inherited node. |
| Existing de Rham carriers | Both BDeRhamPlus and BDeRham are definitions in the pinned file. The report's contrary carrier claim is not usable. Retain reuse/canonical comparison without claiming the DVR or relative comparison theorems. |
| Collision versus ordered-leg descent | A specified 2D already has ordered presentation (D,D). Its squared equation tests multiplicity; unsplit unordered data test ordering/descent. Retain both distinct tests and v-sheafification. |
| Raw RF0 constructor | Use RF0/ramified-witt-universal-property before its children, not the completed RF0 aggregate. Preserve the raw node reference and prove its actual strict-lift theorem. |
| General isocrystal functor | VB1 explicitly owns the arbitrary-rank exact tensor functor and rational-slope comparisons. RF3 retains direct rank-one O(n) descent and its normalization. Retain that single-owner split and the old consumers' VB1 inputs. |
| Global Proj map | The covering/twist obligation remains real and unresolved; the negative verdict is still necessary. |

The supporting fresh primary checks were FS II.1.1–II.1.4, II.1.15–II.1.21, the p. 58 isocrystal construction, p. 61 coefficient-base comparison, II.2.7, and VI.1.1–VI.1.4 with the subsequent divisor completions. This is a targeted source check, not a rereading of the entire book. [Fargues–Scholze](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf)

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` I read and byte-compared these files against the raw pinned sources:

- [BDeRham.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Perfectoid/BDeRham.lean): BDeRhamPlus completes along the kernel of fontaineThetaInvertP; BDeRham localizes at images of single-element generators of that kernel. There is no FontaineThetaKer declaration in this file. These carriers do not prove kernel principality, a theta extension, DVR properties or relative topology comparisons. When p = 0 in the input, the p-inverted absolute carriers are zero; they do not replace the integral characteristic-p rings.
- [Complete.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Complete.lean): isAdicCompleteIdealSpanP is p-adic completeness under its perfect characteristic-p hypotheses, not completeness for the two-generator Huber topology.
- [Truncated.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Truncated.lean), the lift section: WittVector.lift is the inverse-limit map for a compatible truncated system, not the ramified strict-lift theorem.

These are positive declaration checks. No fresh exhaustive Tau Ceti audit or broad absence claim is made. The Tau Ceti pin remains `f790474821cf4256814db967cb154e7af3d0c369`.

## 4. Family ownership and target conservation

Both complete member documents, all seventeen member stage descriptions, the complete AdicSpaces anchor and its seven stage descriptions, the three shared diamonds convention/source/dependency documents, all twenty-four inherited nodes, their seven gaps, both prior reports and every proposal field were read.

The twenty-four directed family evidence rows reduce to fifteen unordered pairs. Checking them against the documents gives:

| Evidence rows | Scope and ownership decision |
| --- | --- |
| 1, 13; 3; 14 | F0/RF0 and their AdicSpaces overlaps: the anchor supplies fixed-Q_p-field Witt/Huber objects; RF0 retains all-E, arbitrary perfect-base strict lifts and actual-ring compatibility. |
| 2, 16; 4, 17; 5; 18 | Fixed generic diamondification is not the integral product. Integral-Y retains V(pi); F1's product is over Spd(Q_p), the relative integral product over Spd(O_E). Keep both and compare generic restrictions. |
| 6, 19; 7, 8; 21 | The anchor owns the fixed adic quotient. F2 supplies its effective diamond relation and marked generator. RF1 retains the relative quotient, sheaves, base change and cocycle comparisons. |
| 9, 20 | D6 owns the general site theorem. F3 and RF1 prove the appropriate fixed and relative instances, not a second general theorem. |
| 10, 22; 11, 23 | F4 exports the fixed-field analytic norm/closed-image seed. Integral-divisors owns the extra all-E/all-base degree-one argument before degree-d products; untilts owns its later generic interpretation. |
| 12, 24 | A divisor supplies rank-one line-bundle data; it does not automatically supply the global Proj map or a full arbitrary-rank isocrystal functor. |
| 15 | The anchor's fixed-field strongly noetherian annuli are imported only in that specialization. General relative nonnoetherian topology/sheafiness obligations survive. |

There are sixteen distinct ownership entries, ten narrowed stages and seven kept stages. No member stage is dropped. Both proposed titles use the exact anchor title followed by "Part II"; both extensions start beyond the fixed-Q_p-field adic construction. No anchor layer or document is changed.

The following nonduplicate targets also survive:

- F0 interfaces, F1 marked-untilt functor of points, F2 equivariant effective quotient, F3 cocycles, F4 analytic closed-image proof, and F5's separately gated coefficient comparison.
- RF0 strict lifts and equal-characteristic model; integral-Y completed charts/plus rings, root extension, tilt and split descent; annuli's generic restriction and relative analytic obligations; RF1's actual quotient and base changes without inventing an ordinary structural map X -> S.
- Every-degree integral divisors, ordered products, unordered invertible-ideal descent, collisions, local affineness where required, vector-bundle descent on thickenings, completions and punctured rings. The late generic B_dR interpretation and Perf_Fq/Perf_k moduli-base comparison remain separate.
- RF3 rank-one tensor/dual/divisor APIs and Frobenius sign, graded ring, Proj and full global-map target. Only the duplicate general isocrystal-functor payload has its sole owner in VB1.
- Linear finite-projective patching and its nonnoetherian effectivity hypotheses, followed by G-torsor transfer. BG0 owns the generic three-description equivalence; actual relative torsor patching precedes Grassmannian and uniformization applications. Completion is not assumed fpqc.

All twenty-four inherited node IDs remain references to conserved mathematical targets. Their present statements are not all endorsed: the chart reciprocal, double-leg test, general-functor payload and global-map proof need reconciliation, as does the earlier relocation of the all-base closed-Cartier argument. RF2/RF4 remain aggregate completion stages, not new constructions. The reviewed decomposition is still marked partial with seven open gaps; this review closes none of them.

The broader audit leads were treated as leads, not verdicts. I read the matching AI.0, R06.1, P7:annulus-foundations, Q0, C2 and L0 contracts as well: shared absolute period-ring carriers need reuse/comparison; generic integral-perfectoid theory is not a duplicate of the specialized analytic estimate; late coefficients are not early relative-geometry inputs. The anchor's analytic theory and D6 remain the named general suppliers. The absence of reviewed member entries in library-coverage.json does not justify assuming an empty library.

## 5. Consumers and graph checks

All five external ownership-supplier descriptions and all twelve distinct external consumer descriptions in the proposed exports were read. The twenty-one native outward links remain explicitly present in the proposal:

| Producer(s) | Consumer | Native links |
| --- | --- | ---: |
| RF4:vector-bundles | AInfCohomology:AI.2 | 1 |
| RF0, RF1, RF2, RF3 | BunGAndNewtonStrata:BG0 | 4 |
| RF4:G-torsors | BunGAndNewtonStrata:BG2:uniformization | 1 |
| integral-Y, integral-divisors, untilts, RF4:G-torsors | GeometricSatakeAndFusion:GS0:loop-geometry | 4 |
| integral-divisors, untilts, RF4:G-torsors | HeckeStacksAndLocalShtukas:HS0 | 3 |
| RF4:G-torsors | HeckeStacksAndLocalShtukas:HS2 | 1 |
| RF2, RF3 | VStackSheavesAndLisseCategories:VS1 | 2 |
| integral-Y | VectorBundlesAndIsocrystals:VB0 | 1 |
| RF1, untilts, RF3 | VectorBundlesAndIsocrystals:VB1 | 3 |
| RF3 | VectorBundlesAndIsocrystals:VB2:ampleness | 1 |

The two additional distinct consumers, GS0:Witt and GS3:fusion, were also checked. Integral versus generic group models, colliding divisors and finite-free BKF input are not silently conflated.

All thirteen supplier lists for narrowed layers give forty-three non-self supplier-to-original-consumer checks; none is missing. RF3's suppliedBy = VB1 names the owner of the removed general subproblem, not an instruction to insert VB1 -> RF3. VB1 forwards that subproblem to BG0, VS1 and VB2:ampleness; VB1 needs no self-edge. The retained rank-one prefix is earlier. This reading matches section 15's consumer-forwarding rule and must survive eventual integration.

Reproducible read-only scratch checks, using Python standard-library JSON parsing, edge sets, breadth-first search and Kahn topological sorting, established:

- All seventeen member stages occur once; no anchor stage is amended. Sixteen ownership scopes and seventy-nine non-self links are unique and their endpoints are known.
- Every one of the twenty-one native outward edges is in the proposal link set, not merely in the union with the native graph.
- Native graph: 2,019 vertices including referenced sentinel endpoints, 3,508 unique edges, acyclic.
- Native graph plus proposal: 2,019 vertices, 3,551 edges, acyclic; forty-three proposal edges are new.
- All 728 pending link-map rows across 36 files were included in a separate union test: 2,027 vertices, 4,254 unique edges, acyclic. All seven rows touching a family endpoint were read. This is not an automatic combination of every unaccepted restructuring proposal.
- No path F5 -> integral-Y, untilts -> integral-divisors, completed RF0 -> integral-Y, or RF4:G-torsors -> BG0 was found in the native-plus-proposal graph.
- Adding VB2:ampleness -> RF3 makes that graph cyclic.

These checks do not establish the global-section cover or prove any source theorem.

## 6. Provenance, checks and handoff

Initial review snapshot: `4b3641a4f904237c25db793625a8f3b00c29b1b3`.
The FS author PDF was obtained on 2026-09-23, has 356 pages, and SHA-256
`9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
Read text on printed pp. 47–50, 54–56, 58, 61, 66–68 and 190–192; inspected images of pp. 48, 66 and 67. Stacks pages 01NJ, 01MM and 01XS were read as primary HTML sources.

Initial input SHA-256 values:

| Input | SHA-256 |
| --- | --- |
| data/atlas.json | `62ab6c2ccb94ee9c4d99813da02b69656941721d30fc29384e2b7e6e86361c56` |
| data/library-coverage.json | `6fe73095d574e7f98497e0dcc0eeec3a9ab0a2c04b4eed98ded8e678a3adea7a` |
| RelativeFarguesFontaine decomposition | `88565395c1d43c0a484f7d2e3e02ac8bb437a8223624ee44daf221c144514e8b` |
| RS-20.result.json before this review | `e2852a947654dc5509c94060469f5ff483be4670b83cadbe050d922eab250540` |
| RS-20.json family | `dd6639e569cd0da03b5c2811b1150cbfd3519a85621e3bf4d0662055a5335fbf` |
| FarguesFontaineDiamonds README | `8516e21fe60a055fd03835a0a5d9b3ef9b474e7d22185fa0b0a0968b3454eb0a` |
| RelativeFarguesFontaine README | `2fe283daff1db960718dd662b2ca2515747b3b3d56a58df143e9d0ad4418c417` |
| AdicSpaces README | `7122aa4b7675d54725ac49c515738b32eb34ef89f3dcd0751daf8c628ef6b795` |

Validation commands:

```text
python3 scripts/check_restructure.py research/blueprint/restructure/RS-20.result.json
python3 research/blueprint/intake.py check-files research/blueprint/restructure/RS-20.result.json research/blueprint/reviews/REV-RS-20~2.md
python3 -m unittest discover -s tests -p test_check_restructure.py
python3 -m unittest discover -s tests -p test_restructure.py
python3 -m unittest discover -s tests -p test_intake.py
```

All commands passed: proposal checker ok; intake allowlist/schema check, 2 files and 0 problems; unit suites 8 + 6 + 29 = 43 tests. The separate graph/forwarding checks above also passed.

Before publication, fresh main `6fb1abbb64e76b1c65de3ccbb36d91ef2af7b377` was downloaded. The original proposal hash still matched, the second-review report did not yet exist, and 342 guarded inputs (atlas, coverage, inherited decomposition, family/prior reports, binding instructions, all existing content Markdown and pending link maps) were byte-identical to the reviewed snapshot. The authorized two-file patch was replayed on this fresh base and validated again. No Lean file belongs to this review; Lean was not run.

Handoff: the review itself is complete. The next author/orchestrator must resolve the RF3 covering/twist owner and implement the exact acyclic split, preserving the entire target and its consumers. Retain the seven prior corrections and this review's link qualification. Reconcile the specified inherited node payloads and test declaration-level dependencies before seeking another review. Far20b degree characterization, ramified Witt proofs, sousperfectoid machinery, full patching/effectivity and the Gabber–Ramero edition mismatch remain explicit blueprint/source obligations, not facts supplied by this restructuring verdict. Do not apply this proposal as accepted while that verdict is negative.
