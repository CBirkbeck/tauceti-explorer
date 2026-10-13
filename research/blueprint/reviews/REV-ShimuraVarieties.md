# Independent review: complex Shimura varieties and canonical models

**Accepted as a target-level planning pass, with corrections.** Reviewer: `independent-review-REV-ShimuraVarieties`; agent Codex; session `codex-wTaqjp`; issue [#9403](https://github.com/CBirkbeck/tauceti-explorer/issues/9403); date 2026-10-13. The input was the full blueprint submitted by another worker in [PR #9457](https://github.com/CBirkbeck/tauceti-explorer/pull/9457). This review is complete.

Acceptance verifies the plan's statements, conventions, ownership and honestly recorded proof obligations. It does not close the mathematical development. All ten stages remain `planned`, all implementations remain `unchecked`, and the twenty proof or supplier refinements remain open. Every node has an individual verdict and mathematical note in the packet's `review.checked` array: 92 verified, eight corrected, none unverifiable. No unresolved contradiction requires returning this planning pass.

| Inventory | Reviewed result |
| --- | --- |
| Nodes | 100: 77 theorems, seven definitions, six constructions, eight comparisons, two applications |
| New or removed nodes | None; all 95 inherited node migrations and declaration names preserved |
| Definition/construction API | 80 entries; all 13 definitions/constructions have at least three discriminating tests, 48 tests total |
| Planets | 51 named mathematical definitions, constructions and central results |
| Baseline | All 15 declarations confirmed at the pinned Mathlib commit; none removed or replaced |
| Cross-roadmap requests | All 39 checked against their suppliers and stated missing interfaces |
| Source inventory | 19 source/roadmap entries; sixteen distinct public PDF hashes checked, including the additional published SVI version |
| Source findings | 26 entries: 25 confirmed, one rejected; three confirmed entries are preserved duplicates, giving 23 distinct findings |
| Suggested Lean | 584 lines, unchanged; elaborates at the pins with eight `sorry` warnings and no errors |

## Corrections made

Each correction is synchronized between the packet and reader. The affected eight nodes are recorded as `corrected`; no additional proof lemma or carrier was introduced.

| Node suffix | Correction and mathematical reason |
| --- | --- |
| V0/plan/stabilizer-arithmetic | Replace the nonexistent upstream `Reduction.levelArithmetic_commensurable_pair` with `Reduction.levelArithmetic_commensurable`. The current AdelicAlgebraicGroups §3.4 target already permits arbitrary points and compact opens. All affected request, proof and coverage references were synchronized. |
| V0/plan/stabilizer-commensurable | The same declaration-name correction, retaining the intersection with the chosen domain-component stabilizer. No duplicate pairwise-commensurability target is required. |
| V0/plan/neat-sublevels | Milne SVI 3.5 is **Proposition** 3.5, pp.34 and 58, rather than Theorem 3.5. The neatness and effective-action hypotheses are unchanged. |
| V0/plan/effective-proper-action | Replace SVI 3.11, which is Chow's theorem, with 3.1, 3.6 and 5.13, pp.32, 34–35 and 57–58. Proper discontinuity uses a discrete effective arithmetic image and compact isotropy. |
| V8/plan/hecke-span | Restrict the degree `p+1` example to maximal level for GL₂, with local translation `diag(p,1)` and identity elsewhere. The intersection has lower-triangular reduction modulo p and stabilizes the second coordinate line. An arbitrary level does not have that degree. |
| V8/plan/zero-dimensional-shimura-variety | Correct the global source-finding reference to E20 for the multiplicative reflex-norm formula. Retain the archimedean Y-action: the extended two-point datum gives cyclotomic determinant components, whereas the strict singleton datum quotients by the rational sign. |
| V8/plan/abelian-instance | Correct the references to E24/E25 for the connected/full reconstruction and source-model index, rather than unrelated E9/E10. This node applies V6 existence and conditional V8 construction; it does not repeat either proof. |
| V8/plan/gl2-gamma1 | Current AdelicAlgebraicGroups §5.2 uses `c=0,d=1`, fixing the second row covector. This dictionary uses `a=1,c=0`, fixing the first column and retaining the first generator in its row-basis convention. The SL₂ intersections agree; basis-swap conjugation does not identify the full compact opens. The introductory dictionary, source match and acceptance check now say this precisely. |

All source findings received this review's own verdict and reason, with the prior independent verdicts retained in `reviewHistory`. E3 is the shorter duplicate of E20, E4 of E25, and E10 of E24; their IDs and provenance remain intact and `duplicateOf` records the relationship. E3's assertion that the product-sign correction was new was corrected: the author xnotes index credits Ruida Di, while Jungin Lee's errata supply the embedding-field correction.

Added **E26**, a known author misprint in the 1983 paper's Corollary 5.4, first line of p.256: the marked connected comparison needs the chosen component X⁺. Both the annotated scan and [author erratum](https://www.jmilne.org/math/articles/1983a.html) supply that correction. The existing V7 statement already used the correct component, so no theorem statement needed changing. E8 remains rejected: the fat-point objection does not establish a contradiction in SVI's reduced analytic convention. The nonreduced analytic carrier is nevertheless a separate necessary supplier interface.

The reader's source-findings section now gives the current independent verdicts and reasons for all 26 entries. The packet records independent source-reading dates and scope separately from inherited provenance. No source excerpt or verbatim passage was added.

## Source verification and proof limits

The packet and reader give the public URLs and exact locators of each target. I read the statements and relevant proof arguments at those locators, checking the annotated and image-only material against page images. The 2017 SVI author copy and published 2005 p.356 were checked separately for E24/E25. These are checks of this roadmap's contracts, not claims to have certified every proof in each article.

The important mathematical checks were the following:

- **Arithmetic quotients and compactification:** SVI §§3 and 5 distinguish arithmeticity, ineffective rational centres and neat effective actions. Baily–Borel §§1, 3–4 and 8–10 distinguish an ambient canonical pullback factor at a boundary component from its intrinsic canonical bundle. The full automorphic ring is not proved finitely generated by a finite separating subring. Theorem 10.14's restriction on three-dimensional Q-normal factors remains explicit. Pink 3.4, 6.2 and 9.25 provide the complex functoriality used here; 8.2 and 12.10–12.12 distinguish logarithmic sections, the auxiliary codimension-one extension and arithmetic minimal descent. Neither an arbitrary datum map nor its extension is asserted finite.
- **Borel and definable algebraicity:** KUY Theorem 1.9, Remarks 1.10 and §4.1–4.2, pp.336–337 and 343–346, give an independent complex-chart/exponential comparison. BKT 4.12–4.13 and its four-page erratum retain the polarized period-map and corrected Cartan-compatible conventions. General semialgebraic geometry does not provide o-minimal Chow. The original metric multivariable Borel proof remains an explicitly named source refinement.
- **Reciprocity and CM:** SVI §12 and Milne CM §§1–3 retain multiplicative norms, geometric Artin inversion, full CM-product algebras, polarization multipliers and the good-prime localization. Potential good reduction uses semistable square-zero inertia in the reduced CM algebra followed by Néron–Ogg–Shafarevich; the false absolute-inertia pro-p step is not used. Frobenius identification uses faithful Hom realization and the CM centralizer, without invoking an unavailable Tate-surjectivity theorem. AGHMP §3.1, pp.415–416, distinguishes the neat torus scheme from the general stack quotient and supplies no integral-model conclusion here.
- **Connected and general existence:** SVI 14.15–14.16, Milne–Shih's Taniyama extension and conjugation comparisons, the annotated 1983 pp.239–265, and the 1999 descent paper retain adjoint cocharacters and actual completed canonical Galois symmetry. A PGL₂ cocharacter need not lift to SL₂. Weak comparison, marked comparison, completed equivariance, cocycle and continuous effective descent are different obligations. Platonov–Rapinchuk Theorem 1, p.279, provides a semisimple perfection input; p.282 does not establish the claimed full-reductive simplicity. The central-adjustment gap is correctly retained.
- **Uniqueness and modular examples:** Deligne 5.1.2 and the following misnumbered lemma, pp.153–155, need a nonempty real open and disjointness from a fixed finite extension. Relative cocharacter incidence needs the selected finite locus, not a claim that the entire Hom scheme is finite. MF 8.3–8.9, pp.98–100, retain primitive-pairing normalization and the limitations of the Legendre family. Fine full level starts at N=3, fine Γ₁ at N=4, and Γ₀ remains coarse. The auxiliary two-point datum and Pink's broader domain convention remain explicit.

The source findings do not silently become proof repairs. In particular, replacing the erroneous simplicity assertion with semisimple perfection does not itself remove a central adjustment on the marked torus. Likewise, knowing the full-model theorem's correct number does not construct the connected Galois-extension carrier. Baily–Borel was checked in the identified reproduction of the published article; damaged convergence displays were not certified. Those limitations agree with `sourceReading` and the twenty gaps.

## Baseline, suppliers and ownership

I checked the bodies and hypotheses of all baseline declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Their uses are narrow and correct:

| Pinned module | Confirmed declarations and supplied interface |
| --- | --- |
| Mathlib/GroupTheory/GroupAction/Defs.lean | `MulAction.orbitRel`, `MulAction.orbitRel.Quotient`, `MulAction.stabilizer`: orbit setoid, quotient carrier and stabilizer subgroup, without analytic structure |
| Mathlib/AlgebraicGeometry/Scheme.lean | `AlgebraicGeometry.Scheme`: native schemes, without a canonical-model predicate |
| Mathlib/CategoryTheory/Comma/Over/Basic.lean | `CategoryTheory.Over`: the actual slice category over the base scheme |
| Mathlib/CategoryTheory/Functor/Basic.lean | `CategoryTheory.Functor`: actual maps with identity/composition laws |
| Mathlib/CategoryTheory/Comma/Over/Pullback.lean | `Over.pullback`, `Over.pullbackId`, `Over.pullbackComp`: base change and its natural isomorphisms under the required pullback hypotheses |
| Mathlib/CategoryTheory/Limits/Shapes/Pullback/Cospan.lean | `Limits.span`, `Limits.spanCompIso`: an ordered WalkingSpan and its functor image |
| Mathlib/AlgebraicGeometry/Morphisms/Finite.lean | `AlgebraicGeometry.IsFinite`: native finite morphisms |
| Mathlib/AlgebraicGeometry/Morphisms/Proper.lean | `AlgebraicGeometry.IsProper`: native proper morphisms |
| Mathlib/AlgebraicGeometry/OpenImmersion.lean | `AlgebraicGeometry.IsOpenImmersion`: native open immersions |
| Mathlib/FieldTheory/LinearDisjoint.lean | `IntermediateField.LinearDisjoint`: the subalgebra-based relation for actual intermediate fields |

The Tau Ceti build pin is `f790474821cf4256814db967cb154e7af3d0c369`. I also checked the current library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, the reviewed library audit, and upstream roadmap contracts at `0d144d044dacebca17b654695b6f1ad58f159b27`. Generic Hodge, abelian, universal-cover and restricted-product interfaces stay with their existing owners; no concrete Shimura, analytic-nilpotent or connected canonical-symmetry carrier was found there.

The nine newer roadmap directories named in WORKERS.md were checked, as were Completed/RestrictedProducts and the consumed current AdelicAlgebraicGroups, ReductiveGroups, ReductiveGroupsPartII and ModularCurves interfaces. RealAlgebraicGeometry explicitly excludes the general o-minimal structures needed here. Existing targets are imports rather than repeated plans.

For cross-roadmap closure I read the supplied statements, not just the stage titles: ShimuraData, ComplexComparisonPartII, the relevant abelian and Néron-model layers, PELModuli, CM.0, SchemeAndStackFoundations, AlgebraicModuliForArithmeticGeometry, ArithmeticLocallySymmetricSpaces, InverseGaloisAndArithmeticFundamentalGroups, ReductiveGroupsPartII and ModularCurvesPartII. Important boundaries are the analytic weight-one family versus its algebraization; finite quotient existence versus descended ample powers; structural reductive theory versus arithmetic density and norm obstructions; and moduli existence versus canonical reciprocity. PEL M3 is used before general canonical existence, while its canonical comparisons are used afterward. No CM application is routed back as an input to its own CM theorem.

The two assigned red-team findings are represented correctly. **RT-AREA-algebraicgeometry/3** requires the unapplied ComplexComparisonPartII CA.0 proposal for analytic locally C-ringed spaces with nilpotents before C0, including gluing, products and analytification; C0's target is not an existing carrier. **RT-AREA-algebraicgeometry/28** requires holomorphic locally ringed gluing from the analytic owner; TopCat gluing is insufficient. This job changes neither supplier files nor the external PR196 record. Both proposals and their consumers remain explicit in the packet and reader.

## API, Lean and validation

I checked the 80 API entries and all 48 mathematical tests against their objects and consumers. They expose constructors, equality/extensionality, naturality and compatibility without requiring users to unfold the objects. Tests distinguish discarded domain coordinates, wrong right-translation order, nonmultiplicative norms, intrinsic versus ambient boundary factors, coarse versus fine models, incorrect pairing roots and lost determinant components. The actual compact-open index, extended zero-dimensional set and conditional canonical-model predicate retain their necessary data.

The suggested file contains real-bodied light definitions for the native two-sided orbit carrier and inversion of a supplied homomorphism with abelian target. Its omission manifest preserves all target IDs and names. There is no `sorry`-defined data or artificial scheme-existence substitute. Six generic examples and two theorem signatures remain proof placeholders; elaboration checks their types and does not prove the 48 reader tests or any of the heavy mathematical targets. No Lean edits were needed for the source and reader corrections.

Validation performed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/ShimuraVarieties.json`: zero errors and zero warnings.
- Source-finding and source-version validation through `source_issues.check_issues` and `check_errata.versions_checked`: no errors.
- `lean-check research/blueprint/suggested/ShimuraVarieties.lean`: exit 0; exactly eight warnings, all uses of `sorry`.
- Packet/reader/omission-manifest agreement and unchanged-node inventory checked; all review verdicts and source-finding reviews are complete. `git diff --check` and deliverable-path intake checks pass.

## Questions for the orchestrator and packaging handoff

These do not block accepting the completed planning pass:

1. Apply the CA.0 and holomorphic-gluing ownership proposals and update their external consumer records. The present issue does not authorize editing those suppliers.
2. Before claiming source-proof closure, obtain a legible primary Baily–Borel copy for convergence estimates and the original multivariable Borel proof. Preserve the full-ring and mixed-factor qualifications.
3. Resolve the existing shared Serre/Taniyama and CM norm-kernel supplier requests, completed canonical symmetry, exceptional central adjustment and Pink auxiliary-datum class. Do not replace these contracts with existence axioms or hide a V7 dependency in the abelian lane.
4. The [1983 article's author comments](https://www.jmilne.org/math/articles/1983a.html), updated in June 2025, suggest Borovoi and Nori–Raghunathan as alternative general-existence routes. Those proofs were not audited here; they may inform a later proof-source choice but do not close E12 or any current gap.

Package this accepted full packet and reader under the current roadmap shape. Preserve the 95-entry node migration when updating external links. Restore heavy Lean signatures only when their actual carriers are available, and retain the stated tests, hypotheses and proof refinements meanwhile.
