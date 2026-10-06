# REV-HabiroRings--HR.1

Independent review of [issue #6449](https://github.com/CBirkbeck/tauceti-explorer/issues/6449), by Codex, session `codex-KH7UFK`, 6 October 2026. The input was written by Codex session `codex-Af1gv8` for BP-HabiroRings--HR.1, issue #6497. I did not write that input.

**Verdict: accepted after corrections.** The packet is a complete target-level planning pass. HR.1 remains `planned`, with one inherited DD.1 request, zero new local gaps and no closed stage. Every implementation status remains `unchecked`. The companion reader needs the corrections listed below at integration; it is outside this issue's permitted edits.

## Scope and counts

I read WORKERS, both protocols, UPSTREAM_GUIDE, BROWSER_AGENTS, the whole packet and suggested file, the companion reader, the stage description, the reviewed AUDIT-17 entry, the accepted parent and its supplier statements, and the accepted RS-10 round-two ownership decision. AdicSpaces and LocalFieldsRamification were the two upstream roadmap models read for the required standard. The parent, suppliers, reader and atlas data were not edited.

| Item | Input | Reviewed result |
|---|---:|---:|
| Nodes | 15 | 17 |
| Definitions / constructions / theorems | 1 / 4 / 10 | 1 / 4 / 12 |
| API items | 26 | 42 |
| Unit tests | 16 | 16 |
| Baseline declarations | 13 | 14 |
| New planets | 3 | 3 |
| Source issues | 0 | 2 confirmed misprints |
| Local gaps / inherited requests | 0 / 1 | 0 / 1 |
| Planned / closed stages | 1 / 0 | 1 / 0 |

The review records seven original nodes as verified, eight as corrected, and two justified additions. The planets remain **Big Witt comonad**, **Wilkerson's theorem**, and **Free Λ-ring**. Together with the three retained parent planets, HR.1 has six. No definition was duplicated from Mathlib, Tau Ceti, HR.4 or PR.0.

## Corrections

1. **Corrected a mathematical sign error.** The finite signed product is
   `(1+c₁t)(1−c₂t²)(1+c₃t³)` through degree three. Consequently exterior
   `λ³(a)=c₃(a)−c₁(a)c₂(a)`, whereas the input stated a plus sign. On the
   integer element 2, the section has `c₁=2, c₂=−1, c₃=−2`, so the corrected
   formula gives 0; the input formula gave −4, contradicting its own test.
   Corrected the packet's acceptance formula and the free Newton convention.
   Added the corrected `exterior_three` signature. The suggested Newton test
   now uses the actual exterior operations: `ψ³(x)=x³−3xλ²(x)+3λ³(x)`.
2. Added `HabiroRings:HR.1/witt-ring-frobenius-congruence`, marked
   `addedBy: REV-HabiroRings--HR.1`. The comonad needs divisibility inside
   `pW(A)`, rather than coordinate divisibility in `pA`. Hesselholt Lemma 1.18
   proves this separate key theorem. Removed its implicit proof step from
   universal-frobenius-polynomials, narrowed that node's locator, and added
   direct dependencies from the comonad and coalgebra Adams-law nodes.
   The corresponding Lean statement already existed; it now has its own tag.
3. Added `HabiroRings:HR.1/witt-product-addition`, also marked with `addedBy`.
   This exposes the non-routine generating-series addition identity used by
   the exterior construction. Its finite coefficient formulation avoids a
   new infinite-product definition. The proof uses universal torsion-free
   coefficients followed by specialization, so its conclusion permits torsion.
   Added its suggested signature and the direct exterior dependency.
4. Added sixteen API entries: comultiplication uniqueness and Teichmüller
   compatibility; coalgebra coaction and coordinate projections, coordinate
   extensionality, morphism extensionality and composition projection;
   Adams-section coordinate recursion; exterior degree-two, degree-three
   and zero-element laws; and the free generator's coaction, lift, generator
   evaluation, lift uniqueness and universal-property equivalence. Added the
   missing Lean signatures; the existing free lift signatures are retained.
5. Added the exact PR.0 torsion-free Frobenius/delta supplier to the section
   construction's prerequisites, for its stated compatibility test. Added
   exterior-operations to the free construction for the triangular exterior
   coordinates and Newton test. Added Wilkerson comparison to the exterior
   node for the integer examples used in the suggested file. Clarified that
   the full Frobenius assembles the imported finite-divisor maps.
6. Corrected the description of `Module.flat_of_localized_maximal`: its local
   hypotheses are flatness **over the original source ring**. Added the
   verified `Module.flat_iff_of_isLocalization` citation and explicitly
   restricted flatness from the localized source before applying that theorem.
   The twisted scalar action and nonzero residue fibres remain explicit.
7. Corrected source Q's title to **q-Hodge complexes over the Habiro ring**.
   Its URL, version and hash are unchanged. Added the published Hesselholt
   PDF, its hash and reading record, and two confirmed source findings E13–E14.
8. Recorded the distinction between current HR.1 scope and RS-10's future early Taylor-ring target. Updated the coverage count from fifteen to seventeen nodes, the summary
   and check records; added the independent review object, this report and
   the required handoff. No original baseline declaration was removed or
   replaced; one citation's description was corrected and one was added.

## Every node checked

The packet's `review.checked` records an individual verdict and justification for every node. The following gives the source and closure checks in compact form; names are suffixes of `HabiroRings:HR.1/`.

| Node | Verdict | Independent check |
|---|---|---|
| dwork-ghost-image | Verified | H Lemma 1.1, pp.6–7. Divisor induction gives integral coordinates; integer torsion-freeness gives uniqueness. The prime lifts need not commute. |
| universal-frobenius-polynomials | Corrected | H Lemmas 1.4/1.8, pp.8–11. Ghost recursion gives integral, weighted, triangular polynomials and the coordinate congruence. Full Frobenius uses compatible finite-divisor maps. |
| witt-ring-frobenius-congruence | Added | H Lemma 1.18, p.16. Divide universal ghosts by p, check the extra p-adic power at the prime p in Dwork's criterion, obtain an integral Witt quotient, and specialize. |
| big-witt-comonad | Corrected | H Proposition 1.19, pp.17–18. Apply Dwork over torsion-free W(C); Frobenius composition makes the differences zero. The universal polynomials specialize to all rings. |
| big-witt-comonad-laws | Verified | H Proposition 1.19. Double/triple ghosts over universal coefficient rings establish naturality, both counits and coassociativity. Pointwise injectivity over torsion is never assumed. |
| lambda-coalgebra | Corrected | H Definitions 1.21/1.23, pp.18–19. Actual ring-map equalities define coalgebras and morphisms on arbitrary rings; coordinates determine structures even in torsion. |
| coalgebra-adams-laws | Corrected | H Lemma 1.24, p.19. Coassociativity gives index multiplication; the Witt-ring congruence followed by the counit gives the prime congruence. |
| adams-to-witt-section | Corrected | B §§1.6–1.9/1.17 and W §2.31. Adams composition makes Dwork differences vanish; ghost injectivity gives the ring laws, recursion, uniqueness and naturality. The exact PR.0 supplier gives the delta dictionary. |
| adams-witt-section-laws | Verified | W §2.31, p.26. The promoted ghost and naturality laws retain the necessary torsion-free target and do not assume coalgebra coassociativity prematurely. |
| wilkerson-comparison | Verified | B §1.17, pp.12–13; H Lemma 1.24 and Proposition 1.19. Double ghosts prove coassociativity of the reconstructed section; torsion-freeness also justifies the morphism comparison. |
| big-witt-cofree-adjunction | Verified | H §2, p.24. Transpose W(f)s and inverse gh₁ have the stated domains and are inverse by the coalgebra laws. W(ghₘ)Δ=Fₘ is a universal identity. Source label reversal E14 does not alter the maps. |
| witt-product-addition | Added | H Proposition 1.14, pp.14–15. Logarithmic derivatives recover additive ghosts; coefficient induction cancels positive integers over universal coefficients, then specializes. Finite truncation suffices. |
| exterior-operations | Corrected | H Remark 1.22, p.18. Signed product gives λ²=−c₂ and λ³=c₃−c₁c₂. Generating-series addition gives the sum law; coordinate functoriality gives naturality. |
| free-lambda-ring | Corrected | B §1.18, p.13; W §2.33, p.27. Polynomial generator evaluation of Δ gives the coaction; its counits/coassociativity give the axioms and s_L(xᵢ)=uᵢ. Exterior coordinates are triangular with unit leading coefficient. |
| free-lambda-universal-property | Verified | B §1.18. Evaluation at s_A(g(i))ₙ gives the coalgebra lift. Applying coordinates to the morphism square forces every variable value, proving uniqueness even for torsion targets and infinite I. |
| free-adams-local-presentations | Verified | Q §1.22(e), p.12 asserts the resulting example; H Lemmas 1.4/1.8 supply the derived proof's inputs. Weighted square matrices reduce to monomial permutation matrices mod p. Away p, triangular substitution has an explicit inverse. Finite block support handles arbitrary I. |
| free-lambda-perfect-cover | Corrected | Q §1.22(e) and W Remark 2.47/footnote (2.3), p.32. Both local presentations have a nonempty free basis. After restriction of scalars, the local flatness theorem applies; nonzero fibres give faithfulness. Prime factorization and the parent equivalence give the canonical perfect cover. |

For the local matrix argument, source degree is multiplied by p. Unique exponent division `a=pq+r`, with every component of r less than p, gives exactly equal finite ranks in each weight. Its reduction modulo p is the monomial bijection, hence has determinant ±1. The integer determinant is a unit in ℤ_(p). This proves a basis, rather than merely linear independence or generation. No infinite matrix is inverted. After inverting p, the leading coefficient p can be divided out successively in the coordinate index; forward and inverse substitutions prove an algebra equivalence. These constructions respect adjoining independent generator blocks.

The current reachable node graph has 27 nodes and no cycle. Its non-library stage boundaries are the inherited DD.1 completion request and the parent's PR.0 boundary; this supplement additionally names the exact PR.0 comparison node. The six accepted parent HR.1 targets are imported literally. The HR.4 Witt carrier/functor and PR.0 delta structures are not redefined as new blueprint nodes. The documented suggested-file adapters are prototypes pending canonical supplier imports. RS-10's interim ownership and atomic QW.1–2 transfer rule are retained.

## Baseline verification

All fourteen declarations were read in their stated modules at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The relevant scalar structures and hypotheses were checked, not merely the names. Tau Ceti's source was searched at git object `f790474821cf4256814db967cb154e7af3d0c369`; this packet cites no Tau Ceti declaration.

| Declaration | Module below Mathlib | Confirmed input |
|---|---|---|
| Matrix.isUnit_iff_isUnit_det | LinearAlgebra/Matrix/NonsingularInverse.lean | Finite square matrices over a commutative ring; a unit determinant gives an invertible matrix. |
| PowerSeries | RingTheory/PowerSeries/Basic.lean | Actual formal power-series carrier. |
| PowerSeries.coeff | RingTheory/PowerSeries/Basic.lean | Natural-index coefficient linear map. |
| IsAddTorsionFree | Algebra/Group/Monoid.lean | Cancellation of nonzero natural scalar multiplication. |
| MvPolynomial | Algebra/MvPolynomial/Basic.lean | Polynomial ring over an arbitrary variable type, including empty/infinite types. |
| MvPolynomial.eval₂Hom | Algebra/MvPolynomial/Eval.lean | Ring evaluation with a coefficient ring map and variable assignment. |
| MvPolynomial.eval₂Hom_X' | Algebra/MvPolynomial/Eval.lean | Evaluation on the polynomial variable. |
| Module.Free.of_basis | LinearAlgebra/FreeModule/Basic.lean | A specified basis implies freeness. |
| Module.FaithfullyFlat | RingTheory/Flat/FaithfullyFlat/Basic.lean | Flatness plus proper maximal-ideal scalar spans; includes the nontrivial free-module instance. |
| Module.flat_of_localized_maximal | RingTheory/Flat/Localization.lean | Requires Flat R of every module localized at a maximal ideal of R, then concludes Flat R globally. |
| Module.flat_iff_of_isLocalization | RingTheory/Flat/Localization.lean | Flat S M iff Flat R M for a localization S/R and a compatible scalar tower. |
| RingHom.FaithfullyFlat | RingTheory/RingHom/FaithfullyFlat.lean | Faithful flatness for the algebra structure induced by the ring map. |
| RingHom.FaithfullyFlat.stableUnderComposition | RingTheory/RingHom/FaithfullyFlat.lean | Composition preserves the ring-map predicate. |
| RingHom.FaithfullyFlat.iff_flat_and_comap_surjective | RingTheory/RingHom/FaithfullyFlat.lean | Equivalence with flatness and surjectivity on prime spectra. |

The reviewed AUDIT-17 HR.1 entry has no existing implementation of these Λ/Wilkerson/free interfaces. Pinned-source searches agree. Mathlib's p-typical Witt vectors are the existing compatibility input to HR.4, not a substitute for the full big Witt functor.

## Sources and source findings

All 22 node source references were checked at their locators, with every short excerpt matching the downloaded text after Unicode/whitespace normalization. All four input PDF hashes matched. Source versions, full hashes, URLs and reading boundaries are retained in the packet.

- [Hesselholt, arXiv:1006.3125v3](https://arxiv.org/pdf/1006.3125v3): §1 pp.6–19 and the cofree adjunction on p.24.
- [Borger, arXiv:0801.1691v6](https://arxiv.org/pdf/0801.1691v6): §§1.6–1.9 and §§1.17–1.18.
- [Wagner, arXiv:2410.23078v5](https://arxiv.org/pdf/2410.23078v5): §§2.31–2.33, Remark 2.47 and footnote (2.3).
- [Wagner, arXiv:2510.04782v2](https://arxiv.org/pdf/2510.04782v2): §1.22(e), plus the retained completion/étale context.
- [Hesselholt, published Acta Mathematica 214 (2015), 135–207](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6800-11511_2015_Article_124.pdf), DOI 10.1007/s11511-015-0124-y: pp.150 and 162. Published PDF SHA-256: `accc403fe6979590661b1d11744eae2adf990ebba92d4927a85815b6ac313de8`.

**E13, confirmed:** the index condition in the final coefficient expansion of Proposition 1.14's proof must be the unweighted sum of the distinct factor indices. The product of the first and second factors contributes to degree three. The printed weighted sum would place that contribution at degree five. The proposition is unaffected; the explicit expansion in its proof is corrected.

**E14, confirmed:** the paragraph defining the cofree right adjoint swaps the names of the unit and counit. The coaction is the unit and the first ghost is the counit, as their displayed domains and codomains show. The maps and adjunction are unaffected.

Both findings are present in the preprint and the version of record. I visually inspected the two published pages, as well as their extracted text. The packet records the author page, arXiv version history, publisher page and title/DOI correction searches; no existing correction of either slip was found. E13–E14 avoid the parent's existing E1–E12. The cubic exterior sign error was in the blueprint, not in Hesselholt's definition, and is not reported as a source error.

## Validation and limits

- Final packet checker: **0 errors, 0 warnings**, with the declaration index available.
- Final `lean-check research/blueprint/suggested/HabiroRings--HR.1.lean`: **exit 0**, with **88 warnings, all declaration uses of `sorry`**. The installed Mathlib source matches the exact pin. The shared Tau Ceti checkout is newer than the Tau Ceti pin; the file imports only Mathlib, so no unpinned Tau Ceti module was used. Memory was checked before each sequential elaboration; no compiler or language server remains running.
- Every packet node tag, all 42 API names and all 16 test names were checked against the suggested file. All five definitions/constructions still have at least three tests.
- Independent sparse integer-polynomial checks verified Frobenius polynomials for p=2,3 and n=1,…,4: integral coefficients, weight, triangularity and mod-p congruence. Direct enumeration verified the restricted-basis rank and permutation dictionary for one/two blocks, weights 0,…,6, p=2,3.
- Signed finite-product coefficients and the corrected third Newton identity were checked symbolically. Integer Adams sections and generalized binomial exterior operations were checked for elements −3,…,4 and degrees 0,…,8. These checks exposed the cubic sign error; elaboration alone cannot establish the truth of admitted theorems.
- Source-issue schema/version validation and whitespace checks pass. Only the two reviewed files, this report and its handoff are changed.

These are planning and prototype checks, not proofs of formal implementation. The arbitrary-ring coalgebra boundary, torsion-free comparison boundary and twisted local scalar action must be preserved when implementing the plan.

## Integration notes for the orchestrator

1. **Synchronize the reader before publishing the reviewed plan.** This review issue does not permit editing `research/blueprint/readmes/HabiroRings--HR.1.md`. Its cubic exterior formula at line 545 and Newton convention at line 581 require the same minus sign. Update its counts to 17 nodes, 42 API items and 14 baseline declarations; expose both added theorem dependencies, the scalar restriction, completed API and source findings/title correction. The review accepts the corrected packet and suggested file; it does not approve the stale reader formulas.
2. Assemble the seventeen supplement nodes with the six accepted parent HR.1 nodes. Replace exactly the two parent HR.1 gap records, preserving unrelated gaps and the inherited DD.1 completion obligation. Keep the current three supplement planets and the parent's three.
3. Route the parent's coarse PR.0 dictionary dependency to the existing torsion-free Frobenius-equivalence node. Resolve DD.1's principal derived completion, derived Nakayama and bounded-torsion comparison before marking HR.1 closed.
4. Retain the accepted RS-10 atomic ownership-transfer rule. HR.1 and HR.4 are interim owners until QW.1–2 are installed; transfer these interfaces and their consumers together. Do not duplicate their nodes under QW ids.

5. RS-10 additionally proposes an early Taylor-glued ring in HR.1. That target is absent from the current atlas HR.1 description and is outside this supplement's two-gap scope. Track it as separate installation/follow-up work; this acceptance does not claim to supply it.

No remaining local mathematical contradiction was found after these corrections. No further reviewer work is required in this job.
