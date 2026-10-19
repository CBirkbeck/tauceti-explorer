# Independent review: explicit K₀, Z.6

**Accepted as a finished planning pass, with the recorded supplier gaps retained.** Reviewer: Codex, session `codex-VY5Ojp`, 19 October 2026; job `REV-KTheoryLowDegrees--Z.6`, [issue #10793](https://github.com/CBirkbeck/tauceti-explorer/issues/10793). This session did none of the input plan, which was written by `codex-FZqxps` for #10820 and delivered in #10941. The bot [confirmed this review claim](https://github.com/CBirkbeck/tauceti-explorer/issues/10793#issuecomment-6270751300).

The review verifies seven new nodes and clarifies one node's supplier routing in place. No target, baseline citation or planet is removed. All 25 inherited Z.6 targets remain owned by the accepted Z.3 packet. The continuation has eight theorem nodes, three gaps and four requests; its stage remains `planned`, its packet `complete`, and every implementation status `unchecked`. Acceptance does not establish the missing enriched interfaces or an implementation of K-theory.

## Scope and corrections

I read the complete continuation packet, reader and suggested file, the original planning handoff, all 25 inherited Z.6 target contracts and their dispositions, the accepted round-3 Z.3 review, the relevant reviewed library audit and overlap information, and the direct supplier statements. This is a review of the Z.6 continuation and its imports, not a new review of all 260 nodes of the older Z.3 packet.

Two edits accompany the verdict:

1. **Arbitrary multiplicative-set localisation.** `localisation-rank-pic-square` now directly imports `GeneralAlgebraicKTheory:K.5/relative-K-theory-and-excision-boundary` for the ring support category and degree-zero exact sequence. That supplier covers a central multiplicative set, hence any S in the commutative ring here. In contrast, `SchemeKTheoryOperations:S.3/affine-support-comparison` states the principal-open comparison, with its finitely generated-support extension. The S.3 scheme diagram is now explicitly limited to its quasi-compact open-complement setting. Weibel V Theorem 2.6.3, printed p.382/PDF p.390, is added to the source receipt. The arbitrary-S degree-zero result already follows from II.9.8; the edit makes its actual owner explicit and needs no filtered-limit theorem. The theorem and its tests are unchanged.
2. **Suggested-file introductory note.** The Lean companion now explicitly says it is not exhaustive, the reader is definitive, and its signatures suggest Lean forms. This restores the standard note required by PROTOCOL §13. No native declaration changed.

The packet and reader carry the same revised proof and source locator. No upstream roadmap or library file was edited, and no notion changed owners.

## Mathematical checks

| New node suffix | Independent finding |
| --- | --- |
| `affine-comparison-diagram` | The comparison is fixed on projective object classes and is natural for every unital ring map. Exact sequences of projectives split, so this scalar-extension statement needs no flatness. The scheme and tensor-ring claims use commutative rings; the noncommutative comparison uses module complexes. |
| `resolution-euler-cartan-square` | A finite resolution of the individual M suffices. The existing resolution equivalence, Euler class and inclusion give Cartan of that class equal to [M]. The noetherian hypotheses for scheme G-theory and the flatness restriction for its stated pullback square are preserved. A global regularity hypothesis is not silently imposed on the individual calculation. |
| `localisation-rank-pic-square` | The ring-support sequence is exact at the middle, with no asserted surjectivity onto the last K₀. A supported bounded projective complex forgets by its alternating class. Localisation of projectives and invertible modules gives the stated Dedekind coordinates; S containing zero is excluded from the target rank-ℤ description. Supplier routing was clarified as above. |
| `rank-pic-determinant-square` | The component map gives alternating rank and determinant, with rank a locally constant integer function. Shifts give duals and negative grades. The signed rank-one interchange survives on automorphisms; forgetting the grade is used only on component groups. The vector-bundle/perfect comparison still requires the resolution property. |
| `projective-line-functorial-coordinates` | S.5 supplies the basis. The matrix (a,b)↦(a+b,−b) is its own inverse, [O(m)] has coordinates (m+1,−m), proper pushforward is a=r+d, and derived section pullback is r. Tensor multiplication becomes (rs,re+sd). Field extension is the identity on the two coordinates. No downstream λ- or Adams-operation theorem enters the proof. |
| `scheme-determinant-gluing-coherence` | The affine determinant maps descend into the signed Picard stack on qcqs schemes. This does not require a resolution property or hypercompleteness of the K presheaf. Canonical additivity is explicitly conditional on enhanced maps and the requested coherence, rather than deduced from a relation in triangulated K₀. |
| `witt-determinant-sheafification-square` | The formal-Witt support input and the two sheafified one-truncation equivalences give the existing supported extension. Uniqueness is the contractible fibre of an equivalence of natural mapping spaces over the specified determinant and extension homotopy. It is not an objectwise equivalence for every perfect scheme. |
| `witt-filtered-base-change-square` | Actual filtration maps, cofibers and refinement diagrams supply the inputs to coherent additivity. The determinant of a constant finite-length Witt module pulls back from a field line, so it is trivializable with grade equal to its length. No basis or triviality of every individual graded-piece line is asserted. |

The two determinant targets use different ranks: W(k)/p² has virtual W(k)-projective rank zero but supported determinant grade two. Likewise a trivializable field line retains its nontrivial unit automorphisms. These tests prevent a component-only or unsigned substitute for the determinant construction.

The worked nonprincipal-ideal example has the correct sign. For A=ℤ[s]/(s²+5), I=(2,1+s) has quotient F₂ and is nonprincipal: a generator of norm two would require a²+5b²=2. The generators of I² lie in (2), while the difference of 2+2s and −4+2s is 6, which together with 4 generates 2. Thus I²=(2), [I]−[A] is nonzero of order two, and the resolution I→A in degrees −1,0 has class [A]−[I] and determinant I⁻¹. The projective-line and order-four elliptic examples additionally detect inversion signs that this order-two example cannot detect.

## Source and baseline evidence

I independently read the cited contexts in the following public versions; both downloaded PDF hashes match the packet. The prose records mathematical contracts in my own words, without source passages.

- Weibel, [29 August 2013 combined author draft](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf): II.2, printed pp.68–69; II.8, pp.145–149; II.9.2, pp.161–163; II.9.7.5–9.8.1, pp.169–170; IV.6.1–6.2, pp.318–319; IV.7.1–7.2, p.328; V.1.5.4, p.371; V.2.6.3, p.382; V.2.7.2–2.7.4, pp.383–384. Physical PDF page numbers are eight higher. The projective, perfect and vector-bundle comparison hypotheses, supported Euler sign and exact-middle boundary agree with the plan.
- Bhatt–Scholze, [arXiv:1507.06490v3](https://arxiv.org/pdf/1507.06490v3), 21 February 2017: §5, pp.18–20, including Propositions 5.2–5.3, Corollary 5.6 and Theorem 5.7; Lemma 6.11 and both proofs, pp.24–25; §12, pp.54–59, including Corollary 12.17 and Proposition 12.18. PDF and printed pages coincide. The determinant theorem uses sheafification of the one-truncations and natural maps, as the continuation states.
- Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`: all eight baseline declarations and their enclosing hypotheses in `CategoryTheory/GrothendieckGroup/Exact.lean` and `Algebra/Category/ModuleCat/CartanMap.lean`. `ExactK0.hom_ext` tests additive maps on object classes. `cartanMap_apply`, `moduleResolutionEquiv`, its inverse-on-classes formula, `moduleEulerClassOf`, its resolution-computation theorem and `fromFiniteProjectiveResolution_of` supply exactly the categorical comparison used here. These do not require all modules to have finite projective resolutions; the separate Cartan-equivalence statement has its explicit stronger hypothesis.

The pinned Cartan source blob is `2fee1cb54d9c3b880174857c3bc0a4169c25ab51`, identical in the baseline checkout and existing shared checking build. The companion's individual import and signatures elaborate with Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. No Mathlib declaration is newly cited by this continuation.

No new source error is proposed. The already recorded BS17/E31 boundary remains inherited: arbitrary regular noetherian F_p-algebras require the supplier's Popescu/continuity bridge, whereas the smooth finite-type alteration-basis route suffices for determinant descent. This review does not claim a complete comparison of the preprint with the published edition.

## Closure, ownership, API and planets

I read current GrothendieckEulerForms and AlgebraicVectorBundles readers and the relevant Suggested signatures at TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`. Exact/split K₀, finite resolutions and Cartan belong to the former. Finite-locally-free tensor, pullback, affine comparison and determinant geometry belong to AlgebraicVectorBundles L0A–L0C. The continuation imports these inputs. Current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` retains the Cartan APIs at the moved `CartanMap/Basic.lean` path; the enhanced determinant package was not found there.

All 25 old Z.6 targets are accounted for once, and none of the eight new IDs duplicates an existing packet node. Each new node is a target-level comparison theorem. The three imported constructions retain their named five-item APIs and at least three discriminating tests each in the reader: scheme determinant, Witt support input and supported determinant. The tests exercise objects, shifts, support exclusion, signed symmetry, automorphisms and finite-length grades. There is no new definition whose API or tests are omitted.

Direct supplier contracts were checked beyond endpoint existence. In particular H.5 currently has a homotopy-theory comparison with a recorded gap; S.4's sheafified equivalence does not itself expose its enriched mapping adjunction; K.4's additivity surface does not specify every finite-filtration refinement. The continuation therefore correctly retains:

- the enriched Picard/truncation and sheafification mapping interfaces, grouped into one gap with two requests;
- coherent finite-filtration additivity, with its K.4 request;
- the inherited arbitrary-regular Witt comparison gap, with its S.3 request.

These are explicit remaining supplier work, not evidence that the plan is already closed. They do not require inventing generic theory here or returning a finished planning pass for another round.

The new internal prerequisite graph is acyclic. Every direct node reference resolves, and no older node in either the blueprint or integrated decomposition collection refers to a new node. Thus these additions introduce no cross-packet cycle. This does not certify all pre-existing stage-level cycles. The three new planets name central comparisons; with the inherited projective-line planet, the layer has four, below its limit of six.

## Validation

- Packet checker with the pinned declaration index: **0 errors, 0 warnings**. Eight theorem nodes; 52 blueprint-node edges, three integrated-node edges, eight baseline edges and ten internal edges.
- Exact packet/reader parity for all eight statements, hypotheses, proof steps and acceptance items; 25 inherited target dispositions; imported API suffixes and test inventories; planet/gap/request counts: **passed**.
- Independent arithmetic: **6,561** projective-line coordinate products, inverses and pushforward/section functionals, and **201** twists from −100 to 100; **eight** points on y²=x³−x over F₅, all 64 sums and 512 associativity triples, (2,1) of order four and exactly three nonidentity points of order two: **passed**. These finite checks test the examples, not the admitted comparison theorems.
- `lean-check research/blueprint/suggested/KTheoryLowDegrees--Z.6.lean`: **exit 0**, whole **114-line** file; **nine intentional proof-admission warnings, no other warnings**. Available memory was 80 GiB. Only the existing categorical identities and integer arithmetic are native; the eight full targets have explicit missing-carrier inventory entries.
- Submission file checks, data-admission screen and `git diff --check`: **passed**.

The companion contains no replacement carriers, assumed comparison fields or admitted data definitions. Its success checks signatures at the pins and leaves every theorem unimplemented. The reader remains the full mathematical specification.
