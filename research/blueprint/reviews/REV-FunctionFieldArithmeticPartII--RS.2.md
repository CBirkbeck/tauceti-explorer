# Review: REV-FunctionFieldArithmeticPartII--RS.2

Issue [#8953](https://github.com/CBirkbeck/tauceti-explorer/issues/8953). Independent review by Claude Code (Claude Opus 5.5), session `claude-8wSJsP`, 14 October 2026. The blueprint under review is `BP-FunctionFieldArithmeticPartII--RS.2` (Codex, session `codex-p4L8sW`, atlas PR #9648). It is the target-level geometric refinement of layer RS.2, "Infinite root stacks and DVR fibres", and builds on the accepted parent packet `FunctionFieldArithmeticPartII.json` and its 409 RS.2 algebra nodes.

**Verdict: accepted, with corrections made in place.** No false mathematical statement was found. Every node's argument was checked by hand: coframe normalization, transport and transitions, the Kummer transition convention, the vanishing of lim¹ for finite groups, the origin-change sign and the roots-of-2 example. The main problem is the supplier map. SchemeAndStackFoundations was merged into TauCetiRoadmap at 04:47 UTC on 14 October 2026, a few hours before the plan was written. Its README now owns most of what the plan requested, including finite root stacks. One generic theorem the plan relied on is stated by no supplier, and it is now a node of this packet. Source attributions to Talpo–Vistoli were corrected in three places, and most acceptance tests were boilerplate.

## Counts

| | before | after |
|---|---|---|
| nodes | 20 | 21 (1 added, 19 corrected, 1 verified unchanged) |
| API items | 32 | 40 |
| unit tests | 23 | 25 |
| baseline declarations | 11 | 18 (all 11 confirmed, 7 added) |
| requests | 5 | 7 (5 rewritten, 2 added; one supplier changed) |
| gaps | 3 | 1 |
| restructure proposals | 0 | 1 |
| source issues | 1 | 1 (confirmed) |
| sources | 3 | 4 (Stacks Project added) |

In the node row, "corrected" counts every node with any change. Four of the 19 (`coframe-tower`, `root-limit-descent-native`, `kummer-lift-native` and `kummer-classes-native`) changed only in their acceptance tests. `neutralization-change-native` is the one node verified without change.

`python3 scripts/check_blueprint.py` with the pinned declaration index reports 0 errors and 0 warnings. `research/blueprint/intake.py check-files` passes on the three files. `lean-check` on the suggested file: 0 errors, and its only warnings are the 15 admitted proofs.

## How the review was done

- **Sources.** TV17 (arXiv:1410.1164v2) and AGV08 (arXiv:math/0603151v2) were downloaded from the packet's URLs. Both SHA-256 values match the packet. Every locator was read: TV17 §3 and §3.1, pp. 12–16, and AGV08 Appendix B.1–B.2, pp. 52–54. Springer refused automated access to B24's version of record. Its locators were therefore checked against the public preprint arXiv:2108.13397v3: the fpqc classifying-stack convention is in §2, p. 4, and the DVR root stacks, the reduced fibre S¹_c ≃ B Ẑ(1) and H¹(k, Ẑ(1)) = lim k*/k*ⁿ are in §3, p. 6. The text agrees with what the packet attributes to pp. 133 and 135–136. The reader now records the preprint locators too.
- **Baseline.** All 11 cited declarations were read at Mathlib 082e2d3 and Tau Ceti f790474 in the pinned build tree, and every one provides what its nodes use.
- **Suppliers.** Every external prerequisite id exists: the parent's RS.0, RS.1 and RS.2 nodes, the R09.4 nodes in `AlgebraicModuliForArithmeticGeometry--A0-extension.json`, and the D0 node. Each statement was read. The R09.4 targets are also in the AlgebraicModuliForArithmeticGeometry package README (TauCetiRoadmap pull request #853), as §4.3 `neutralizationEquivalence` and the compatible-limit sample API.
- **Upstream.** TauCetiRoadmap main was read at 42d0023. This covered SchemeAndStackFoundations README §§0.1, 0.9, 1.1, 1.15, 1.16, 1.18, 1.21, 2.3, 2.11 and 3.4, and AlgebraicVectorBundles L0A–L0B with its `Suggested.lean`. A search of all atlas packets looked for any other plan of limits of torsor towers and found none.
- **Lean and reader.** The suggested file was elaborated with `lean-check`. The reader was re-rendered by a script that first reproduced the author's 20 node sections byte for byte from the author's packet. The reader therefore agrees with the corrected packet node by node.

## Supplier map: SchemeAndStackFoundations is now a Tau Ceti roadmap

| Request | Was | Now |
|---|---|---|
| RS2-TOWER-AFF (SF.1) | asked SF.1 for effective affine descent, the faithfully flat limit of finite torsor towers, its finite quotients, and a finite-residue closed point over ℚ | cites §1.1 `qcoh_fpqc_descent` (affine schemes via ModularCurves 0E), §1.15 torsors (fpqc theory for flat affine G, `Torsor.hom_isIso`) and §1.16 contracted products. The tower-limit theorem is not in that README and became node `RS.2/flat-torsor-tower-limit`. The closed point is Mathlib's `finite_of_finite_type_of_isJacobsonRing` |
| RS2-SSF-LAYER0 (SF.0), new | — | §0.9 `affine_transition_limits` and §0.1 relative Spec, used by the new node and by the global coframe torsor |
| RS2-JAC-A (SF.3) | "integrate InvertibleSheaf with tensor powers and pullback" | §3.4 `picardGroupoid` (Core of InvertibleSheaf, symmetric monoidal, pullback, `isStack`) with AlgebraicVectorBundles L0A–L0B (`pullbackModulesMonoidal`, `tensorSection`, `pullbackFiniteLocallyFree`). At the pins InvertibleSheaf has `tensorProduct`, `tensorProductAssoc` and the unitors, but no monoidal instance and no pullback |
| RS2-ORDINARY-STACKS | supplier `DiamondsAndVStacks:D0` | supplier `SchemeAndStackFoundations:SF.1`. §1.18 owns the generic site-level `Stack.twoFibreProduct` and §1.21 the generic `Stack.quotient J (X,R)`. That README states that DiamondsAndVStacks D0.26 is the (Perf, v) instance of these constructions, so the scheme/fpqc owner is SchemeAndStackFoundations. The D0 prerequisite of `root-limit-base-change-native` and `infinite-quotient-native` was replaced |
| RS2-FINITE-ROOT-STACKS (SF.1), new | — | §1.21 `rootStack n (L,s)`, with `.transition`, `.baseChange`, `.affineChart`, `test_dvr_chart` and `test_fibre_nonreduced`. It is cited by `transition-native`, `dvr-uniformizer-native` and `dvr-residual-gerbe-native` |
| RS2-KUMMER-FINITE (SF.2) | asked for fppf Kummer for every n, Pic(Spec k) = 0 and fpqc H¹ | cites §2.11 `fppf_kummer_sequence` and `kummer_test_field` (every field and every n, including n = p), Stacks 040Q pairs (L, α), and §2.3 `NonabelianH1` on any site with `map`. The fppf/fpqc comparison for finite μ_n is part (g) of the new node |
| RS2-LIMIT-TYPING (R09.4) | unchanged | now also cites the AlgebraicModuliForArithmeticGeometry package §4.3 |

Each request's `neededBy` now lists exactly the nodes that use that contract. In particular the three SF.1 requests split the six SF.1 consumers between them.

## Node added

`FunctionFieldArithmeticPartII:RS.2/flat-torsor-tower-limit` (theorem). Over any scheme T, let (G_n) be a divisibility tower of finite locally free commutative group schemes with faithfully flat transitions whose kernels are finite locally free, and let (P_n) be a compatible tower of fppf G_n-torsors. Then:

- (a) the transitions of the tower are torsors under the kernels;
- (b) P = lim P_n exists and is affine over T, with affine-local coordinate rings the directed colimits;
- (c) P → T is faithfully flat, by Stacks 090N;
- (d) P is an fpqc G-torsor, and P ×^G G_n ≅ P_n;
- (e) formation of P commutes with base change;
- (f) G-maps between such limits are compatible families of G_n-maps;
- (g) every fpqc G-torsor is the limit of its pushforwards, which are fppf torsors by Stacks 0245 and fpqc locality.

The plan's coframe torsor, Kummer torsor and roots-of-2 nodes all needed this theorem and requested it from SF.1. It is in neither the merged SchemeAndStackFoundations README nor any atlas packet. AdicEtaleGeometry A4 has finite étale towers under constant groups in an adic setting, which is a different statement. TV17 Remark 3.9 sketches only direction (g). The node discharges the old gaps RS2-AFFINE-LIMIT-PROOF and RS2-FLAT-COHOMOLOGY. The consumers `coframe-inverse-limit`, `coframe-fpqc-torsor`, `kummer-tower-native` and `roots-two-fpqc-native` now cite it.

## Corrections

| Node | What was wrong or missing | Correction |
|---|---|---|
| coframe-inverse-limit | The TV17 match said Remark 3.9 builds a limit torsor from compatible finite torsors. The remark shows only the converse: a torsor is the limit of its pushforwards. The proof glued affine-local limits by effective descent, which is unnecessary. | Match corrected. The construction is now the new tower theorem with G_n = μ_n,T; since P_1 = T, the limit exists globally. API `RootCoframeLimit.towerLimitIso` added. |
| infinite-quotient-native, coframe-evaluation | Both said that TV17 proves the quotient presentation only for fine saturated log structures, and that the arbitrary pair (O,f) is an authored extension. But the chart ℕ → A, 1 ↦ f defines a fine saturated log structure for every f. TV17 Corollary 3.13 applies to it, and Lemma 3.12 (with Borne–Vistoli 4.18) identifies that infinite root stack with compatible roots of (O,f). | Matches and the proof step corrected: the arbitrary-pair statement is the source's, and the coframe proof makes it explicit on native objects. The reader's source-scope paragraph was corrected the same way. |
| normalized-coframes | The torsor was built by Zariski gluing plus "effective affine descent" under SF.1. | Global description: P_n = Spec_T(⊕_{0≤i<n} M^{⊗i}), multiplied through φ in degrees ≥ n. This is the μ_n-torsor of the pair (M,φ) (Stacks 040Q; merged SchemeAndStackFoundations §2.11). Prerequisites SF.1 → SF.0 and SF.2; API `RootCoframe.relativeSpecIso`; a Stacks source added. |
| factorial-roots-native | The node cited the parent's algebra equivalence of colimit rings (`divisibility-factorial-equivalence`), which the groupoid argument does not use. | Replaced by `mathlib:Nat.dvd_factorial` and `mathlib:Nat.factorial_dvd_factorial`, both read at the pin. |
| kummer-iso-native | The bound \|μ_n(k)\| ≤ n was used without a citation. | `mathlib:card_rootsOfUnity` added. |
| roots-two-fpqc-native | The closed point with finite residue field was requested from SF.1. | Mathlib's `finite_of_finite_type_of_isJacobsonRing` (Zariski's lemma), plus the new tower node. |
| kummer-tower-native, coframe-fpqc-torsor | Both rested on the SF.1 TOWER-AFF request. | Both now rest on the new tower node. |
| transition-native, dvr-uniformizer-native, dvr-residual-gerbe-native | None of them cited the upstream owner of finite root stacks. | Each now cites §1.21. `transition-native` keeps only the coherence data that §1.21 does not state. |
| coherent-roots-native | The test "equivalent to the unique unramified object" was vague. Constructors used by later nodes were missing. | The test is restated as contractibility of the system groupoid. Added `RootSystem.ofFrame`, `RootSystem.ofFactorial` and the test `RootSystemTests.realBand`: G(ℝ) = lim μ_n(ℝ) is trivial, since each ζ_n is the square of ζ_2n, so a definition without the compatibility squares fails it. |
| kummer-coordinate-diagram | The transition existed only as an existence-and-uniqueness statement, and the inverse-limit group lim K_n(k) was not a declaration. | Added `transition_ofUnit`, `transition_id`, `transition_comp` and `compatibleFamilies`, and the test `RootKummerTests.realFamilies` (two families over ℝ, one over an algebraically closed field). |
| 14 nodes | The acceptance was the boilerplate line "Retain the stated topology, all positive exponents, component arrows and comparison coherences." | Replaced by concrete instances: the compositor at n\|m\|l, ζ ↦ ζ³ under F(2,6), twisting by the roots-of-2 torsor, the DVR closed fibre, the f = 1 identity check of the LEFT convention, ℤ₃ with π′ = −3, the real Kummer classes, and so on. Four more nodes each gained one instance. |

## Verified without change

- The coframe-tower formula β_m ↦ β_m^q α(n,m)⁻¹, with normalization, μ_m → μ_n equivariance, μ_q-torsor and x_n = x_m^q.
- The Kummer transition [a]_m ↦ [a]_n. It is the map on H¹ induced by the morphism of Kummer sequences with vertical maps x ↦ x^q and the identity.
- The origin change: an arrow x_λ → x_vλ has scalar a with a^n v = 1, so b_λ′(y) = b_λ(y)·[v], and π′ = uπ scales the normal frame by ū⁻¹.
- Injectivity and surjectivity in the Kummer classification. The finite isomorphism sets are nonempty torsors under μ_n(k), and the factorial chain needs no cocycle condition.
- The roots-of-2 obstruction, through Eisenstein's bound n ≤ [K:ℚ].

## Mistakes in the sources

E12 (AGV08 B.2, condition (3), p. 53) is **confirmed**. In v2 the section-power exponent is a symbol bound nowhere, while condition (2) identifies the dth tensor power. No other mistake was found in the passages read.

## Suggested file

The file was renamed to the packet's names: namespace `TauCeti.AlgebraicGeometry.RootStack`, with `RootKummer.coordinate`, `ofUnit`, `ofUnit_eq_one` and the rest. The light definitions `RootKummer.transition` (the map of quotient groups induced by the identity) and `RootKummer.compatibleFamilies` (a subgroup of ∏ K_n(k)) now have real bodies and no admitted data. The defining formula `transition_ofUnit` closes by `rfl`, so the convention [a]_m ↦ [a]_n is checked by the kernel. The tests `RootKummerTests.one`, `.two`, `.transition`, `.wild` and `.realFamilies` are examples labelled by comments. The omission ledger now includes the tower theorem. The file has 180 lines and imports Mathlib modules only.

## Questions for the orchestrator

1. **Finite root stacks are upstream.** SchemeAndStackFoundations §1.21 (merged) defines `rootStack n (L,s)` with transitions, base change, the affine chart, the DVR chart and the nonreduced fibre. FunctionFieldArithmeticPartII RS.0–RS.1 plan finite roots natively. The packet's new restructure proposal asks RS.1 to import §1.21 and to keep a single comparison theorem with the native triples, plus stack bases, relative coarse spaces and the invariant ring. The reserved key definition `FunctionFieldArithmeticPartII:key/root-stacks` would then keep only the infinite case. The RS.0 review (#8951) should check the same overlap.
2. **Planets.** This packet adds no planets, so that the combined RS.2 layer stays within six, and the parent's six planets remain. Two of those sit on algebra micro-nodes ("Finite-free root transitions", "Infinite unity-root coordinates"). When RS.2 is assembled, the quotient equivalence, the DVR gerbe and the Kummer classification are better planets.
3. **SchemeAndStackFoundations ids.** The atlas still lists SchemeAndStackFoundations as a proposed roadmap with stages SF.0–SF.6, and this packet cites those stage ids with requests naming the merged README sections. Once the atlas re-identifies the roadmap as a Tau Ceti one, these prerequisites should move with it.
