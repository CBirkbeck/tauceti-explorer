# REV-PerfectoidQuotients

**Accepted as a complete target-level planning pass, with seven explicit closure gaps.** This is not a closed roadmap or an implementation claim. All seven scoped stages are planned, and none is closed.

Independent reviewer: Codex, session `codex-LAuN0A`, 6 October 2026; job [#468](https://github.com/CBirkbeck/tauceti-explorer/issues/468). The blueprint completion was by session `codex-LrLkX3`; this reviewer did none of the work under review. The packet now has a separate verdict for every node and every local source issue.

## Counts and coverage

| Item | Result |
|---|---:|
| Nodes | 61: 3 definitions, 4 constructions, 15 lemmas, 31 theorems, 2 comparisons, 6 applications |
| Node verdicts | 52 verified, 9 corrected, 0 added, 0 unverifiable |
| Baseline declarations | 65 confirmed; 0 removed or replaced |
| Definition/construction API entries | 42 |
| Definition/construction tests | 34; every such node has at least 4 |
| All planned tests, including theorem tests | 37 |
| Planets | 12 |
| Closure gaps / supplier requests | 7 / 9 |
| Source issues | 5 confirmed, 0 rejected or added |
| Exact direct supplier nodes read | 83 |
| Suggested targets | 26 full, 10 restricted, 20 explicit omissions, 5 supplier applications |

The coverage lists are complete against the actual campaign stage descriptions, rather than only against their own target lists. Q0 realizes its two substage interfaces; Q0:animated-application imports prism and animation theory; Q0:integral-algebra supplies the algebraic prefix and the Tate comparison. Q1 reexports the smooth theory once. Q2 has the initial object, perfectoidization, derived comparison, flat base change and completed colimits. Q3 has cover lifting, André and its auxiliary refinements, including the fixed-field almost variant. Q4 has integral surjectivity and the analytic closed-quotient endpoint. All coverage targets resolve to nodes whose `realises` includes the stage.

## Corrections made

1. **Initial-prism test.** Replaced `initialPrismNotBounded`, a design instruction without a witness, by `initialPrismFp`: for F_p the initial prism is (W(F_p),(p)), identified with (ℤ_p,(p)), with its canonical reduction. The separate statement still explicitly allows all prisms and makes no boundedness assertion.
2. **Bhatt root-extension test.** Replaced `bhattRootExtensionRawFails`, another design instruction, by `bhattRootExtensionZeroElement`. For g=0 the natural map from the saturated model A is an isomorphism and all distinguished roots are zero. In a reduced perfectoid target, the compatible roots of zero are uniquely zero; the universal closed-space property therefore gives the identity pair, and saturation recovers A. The original saturation condition remains in the construction.
3. **Monic root convention.** Added positive degree in André's theorem, its finite-free root steps, the modulo-p ind-syntomic proof and the functorial almost absolutely integrally closed extension. The constant polynomial 1 is monic but has no root in a nonzero ring. The source convention is thus made explicit before translation to Lean. Historical extraction quotations were preserved.
4. **Reduced-special-fibre pullback.** The torsion-free quotient node already states the correct Česnavičius–Scholze decomposition. Its packet signature boundary and suggested-file boundary had dropped both reductions. They now retain the pullback over `(R_tf/ϖ)_red` with factor `(R/ϖ)_red`. This fixes agreement with the target; it makes no claim that an unreduced pullback could never satisfy another theorem.
5. **Locators.** ECD Theorem 5.8 is on printed p.25, not p.24. BMS2 Proposition 4.19(3) has its statement on p.22 and elementary proof on p.23. The André proof/refinement locator now covers pp.61–62. The Tate adapter's BMS1 locator includes Lemmas 3.20–3.21, pp.26–27, so that the quoted text from 3.20 and the localization result 3.21 are both located correctly.
6. **Inherited erratum.** ECD Definition 5.7 has the correct integral-map direction. The reversal is in the remark after Theorem 5.8 on p.25. The reference to `PerfectoidSpaces/E29` now names the supplying P0 packet and locator: P8 also uses E29 for a different paper. No foreign erratum was renamed and no duplicate local issue was created.
7. **Late extension proposal.** Its BS22 list now correctly labels 10.2 and 10.4 as propositions, 10.3 and 10.5 as lemmas, 10.6 as a definition, and 10.7/10.13 as remarks. Its content now describes completed tensor idempotence and J-almost G-Galois extensions rather than nonexistent exterior-power/root-cover results at those locators. Existing BS22 E7/E11 and PR.0 E82 were added as qualified references, without duplicating their issues.
8. **Review evidence.** Added 61 node verdicts and 5 source-issue verdicts; updated current checks and suggested-file SHA256. Earlier author provenance remains historical evidence. No baseline, declaration identifier, API item, planet, gap or request was removed, and no new node was needed.

The nine corrected node identifiers are recorded individually in `review.checked`; the other corrections concern reference and proposal metadata. Suggested-file changes are confined to mathematical planning comments; its existing typed signatures remain at their declared scope.

## Sources and baseline

Freshly acquired bytes of all eleven PDFs matched their packet SHA256 values. I checked all 80 node excerpts: 76 PDF matches after normalizing Unicode ligatures and typesetting whitespace, plus the four Stacks passages. A text match alone was not the verification: I read each cited statement and its relevant proof, and checked the hypotheses and proof inputs against the node. The finite Witt Frobenius paper was read through the implication chain actually used, without claiming all its unrelated conditions are needed.

- [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4) (`bs-prisms-2022`); exact bytes identified by the packet hash.
- [Topological Hochschild homology and integral p-adic Hodge theory](https://arxiv.org/pdf/1802.03261v2) (`bms2-thh-2019`); exact bytes identified by the packet hash.
- [Étale cohomology of diamonds](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf) (`ecd-2026`); exact bytes identified by the packet hash.
- [Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3) (`bms1-integral-2018`); exact bytes identified by the packet hash.
- [Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf) (`BMS2-WITT-TORSION`); exact bytes identified by the packet hash.
- [Purity for flat cohomology](https://arxiv.org/pdf/1912.10932v3) (`cs24-flat-purity`); exact bytes identified by the packet hash.
- [Purity for the Brauer group](https://arxiv.org/pdf/1711.06456v4) (`cesnavicius-purity-2019`); exact bytes identified by the packet hash.
- [Prismatic Dieudonné theory](https://arxiv.org/pdf/1907.10525v4) (`alb23-prismatic-dieudonne`); exact bytes identified by the packet hash.
- [On the direct summand conjecture and its derived variant](https://arxiv.org/pdf/1608.08882v2) (`bhatt-direct-summand-2018`); exact bytes identified by the packet hash.
- [On the Witt vector Frobenius](https://arxiv.org/pdf/1409.7530) (`dk-witt-frobenius`); exact bytes identified by the packet hash.
- [Lecture notes for a class on perfectoid spaces](https://websites.umich.edu/~bhattb/teaching/mat679w17/lectures.pdf) (`bhatt-perfectoid-notes-2017`); exact bytes identified by the packet hash.

The Stacks checks were [091P](https://stacks.math.columbia.edu/tag/091P), [091T](https://stacks.math.columbia.edu/tag/091T), [091U](https://stacks.math.columbia.edu/tag/091U) and [0G3I](https://stacks.math.columbia.edu/tag/0G3I), including the product orthogonality, principal classical/derived completeness, quotient stability and finite-ideal separation arguments. No complete-paper collation or exhaustive published-errata search is claimed. Existing PAPER-BHATT-SCHOLZE-22/E7 and E11 cover result-label and A/A_perf slips also seen in this reading; references were added without duplicate issues. PR.0/E82 supplies its accepted correction that d need not be regular in the raw perfection before p-completion. The exact supplier contract and this packet use the completed version; this review does not independently certify the foreign counterexample. Five local source-issue corrections were confirmed in precisely their cited versions; E3 was collated against both the preprint p.23 and journal p.227. E2's unresolved bibliographic reference remains unresolved and DD.0-owned.

Every one of the 65 baseline statements was read with its enclosing hypotheses at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The packet records Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, but cites no Tau Ceti declaration. The reviewed AUDIT-38 and its independent review were read; `data/library-coverage.json` has no separate PerfectoidQuotients entry. The audit is a search aid, not evidence for individual declarations. Existing completion, perfection, Fontaine θ, Witt, radical-quotient and localization constructions are reused. The planned integral perfectoid predicate, prism/δ, derived completion and almost/analytic interfaces are distinguished from those existing carriers.

The baseline inventory, unchanged by this review, is:

| Pinned Mathlib module | Declarations checked |
|---|---|
| [RingTheory/AdicCompletion/Basic](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Basic.lean) | `IsAdicComplete`, `IsAdicComplete.subsingleton`, `IsAdicComplete.le_jacobson_bot`, `IsAdicComplete.map_algebraMap_iff`, `IsHausdorff.eq_iff_smodEq`, `AdicCompletion`, `AdicCompletion.of_surjective` |
| [RingTheory/Perfection](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Perfection.lean) | `PreTilt`, `PreTilt.coeff`, `Perfection.coeff_surjective`, `Perfection.map`, `Perfection.coeff_map`, `Perfection.lift`, `Perfection.coeff_pow_p`, `Perfection` |
| [RingTheory/Perfectoid/Untilt](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Perfectoid/Untilt.lean) | `PreTilt.untilt`, `PreTilt.mk_untilt_eq_coeff_zero` |
| [RingTheory/Perfectoid/FontaineTheta](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Perfectoid/FontaineTheta.lean) | `WittVector.fontaineTheta`, `WittVector.mk_fontaineTheta`, `WittVector.fontaineTheta_teichmuller`, `surjective_fontaineTheta` |
| [RingTheory/WittVector/Complete](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Complete.lean) | `WittVector.ker_constantCoeff`, `WittVector.quotientPEquiv`, `WittVector.isAdicCompleteIdealSpanP`, `WittVector.eq_zero_of_p_mul_eq_zero`, `WittVector.mem_span_p_iff_coeff_zero_eq_zero`, `WittVector.mem_span_p_pow_iff_le_coeff_eq_zero` |
| [RingTheory/WittVector/Identities](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Identities.lean) | `WittVector.coeff_p_one` |
| [RingTheory/WittVector/Defs](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Defs.lean) | `WittVector.mul_coeff` |
| [RingTheory/WittVector/Teichmuller](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Teichmuller.lean) | `WittVector.constantCoeff_surjective`, `WittVector.teichmuller`, `WittVector.teichmuller_zero`, `WittVector.teichmuller_coeff_zero` |
| [RingTheory/Jacobson/Ideal](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Jacobson/Ideal.lean) | `Ideal.isUnit_of_sub_one_mem_jacobson_bot` |
| [RingTheory/WittVector/Basic](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Basic.lean) | `WittVector.map`, `WittVector.constantCoeff` |
| [RingTheory/WittVector/TeichmullerSeries](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/TeichmullerSeries.lean) | `WittVector.eq_of_apply_teichmuller_eq`, `WittVector.dvd_sub_sum_teichmuller_iterateFrobeniusEquiv_coeff` |
| [RingTheory/Ideal/Quotient/Operations](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Quotient/Operations.lean) | `Ideal.quotientMap`, `Ideal.quotientMap_surjective` |
| [RingTheory/Ideal/Quotient/Defs](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Quotient/Defs.lean) | `Ideal.Quotient.lift`, `Ideal.Quotient.mk_surjective`, `Ideal.Quotient.eq_zero_iff_mem` |
| [RingTheory/Ideal/Quotient/Nilpotent](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Quotient/Nilpotent.lean) | `Ideal.isRadical_iff_quotient_reduced` |
| [RingTheory/Ideal/Operations](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Operations.lean) | `Ideal.IsRadical.radical_le_iff`, `Ideal.radical_isRadical`, `Ideal.radical` |
| [FieldTheory/Perfect](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Perfect.lean) | `PerfectRing`, `PerfectRing.ofSurjective`, `frobeniusEquiv`, `frobeniusEquiv_symm_pow_p`, `injective_frobenius` |
| [Algebra/CharP/Basic](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/CharP/Basic.lean) | `CharP.charP_iff_prime_eq_zero` |
| [RingTheory/Teichmuller](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Teichmuller.lean) | `Perfection.teichmuller_sModEq` |
| [FieldTheory/PerfectClosure](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/PerfectClosure.lean) | `PerfectClosure`, `PerfectClosure.of` |
| [RingTheory/Ideal/Span](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Span.lean) | `Ideal.mem_span_singleton` |
| [Algebra/Ring/Subring/Basic](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Ring/Subring/Basic.lean) | `Subring.closure`, `RingHom.range` |
| [RingTheory/IntegralClosure/Algebra/Basic](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/IntegralClosure/Algebra/Basic.lean) | `integralClosure` |
| [Algebra/Polynomial/Eval/Defs](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/Eval/Defs.lean) | `Polynomial.eval₂RingHom` |
| [GroupTheory/MonoidLocalization/Away](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/MonoidLocalization/Away.lean) | `Localization.Away` |
| [RingTheory/Ideal/Maps](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean) | `RingHom.ker` |
| [RingTheory/AdicCompletion/Exactness](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Exactness.lean) | `AdicCompletion.map_surjective` |
| [RingTheory/AdicCompletion/Functoriality](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Functoriality.lean) | `AdicCompletion.map_of` |

In particular, `AdicCompletion.map_surjective`, `AdicCompletion.of_surjective` and `AdicCompletion.map_of` have the generality actually needed for the completed quotient maps; neither noetherianity nor finite generation was silently inserted. Fontaine and PreTilt require their actual nonunit/completeness instances, and the zero-ring branch handles the excluded instance case. Finite length-reducing Witt Frobenius is still missing from the required supplier interface; the infinite Witt endomorphism is not substituted for it.

## Closure, ownership and red-team repairs

Read the exact direct supplier statements in PR.0–PR.2, DD.0/DD.1/DD.5, E5 and PerfectoidSpaces P0/P1/P2/P4/P5. Imported generic objects stay with their owners. Where a stronger interface is absent, the nine requests identify the consuming nodes and needed statement rather than claiming the supplier already proves it. Supplier packets still needing changes are not treated as implemented libraries.

The seven gaps are sufficiently precise for the seven stages to remain **planned**, under PROTOCOL §0, rather than closed: normalization/completion transport; unavailable supplier carriers and interfaces; stationary initial-prism construction; André limits and ind-syntomic refinement; unit-cofiber comparison for complete-flat descent; completed filtered-colimit calculation; and the analytic integral-model comparison. The acquired Bhatt notes close the old bibliography gap G8, not these implementation/closure gaps.

The delicate early proof boundary is correct. Q4 may use perfectoid reducedness and completed root-stable quotients from the algebraic prefix. It must prove base change and completed colimit transport before descending surjectivity. BS22 Proposition 8.5 uses Theorem 7.4 in its own comparison proof, so citing it to close the earlier surjectivity proof would be circular; the packet avoids that citation and records G5/G6.

The recursive exact-node check reproduces **405 reachable nodes, 1,426 listed exact-node edges (1,425 distinct), and zero cycles**, under the three narrow supplier bindings in the packet. There are **22 opaque stage/reserved imports**. This establishes the stated conditional declaration-level result; it does not expand those stages or certify the whole atlas graph. The local graph has 123 node edges. Applying the proposed bindings remains an orchestrator action, not a mutation made by this review.

The confirmed red-team findings and accepted paper routes were read afresh:

- **RT-AREA-padic-1/1:** Q2/Q4 cover semiperfectoid rings only. BS22 §8.2 and §10 general integral perfectoidization/J-almost purity remain late, after Q3/Q4, with the existing accepted `PerfectoidQuotientsPartIIIntegralPerfectoidization` route as one protocol owner. Q5 is a proposal for that material, not another plan. P8/S2/S4 and PR.4 receive the late inputs. The reader makes this boundary explicitly; no early reverse arrow into P0/P3 is introduced.
- **/6:** Both packet and reader explicitly exclude Q4 as an input to A3. The proposal removes that foreign edge and leaves tilting/characteristic-p geometry with P3/P4. This review does not claim to have applied the edge removal or re-reviewed all of A3's proof sources.
- **/7:** The listed ČS basic algebra is in the Q0 prefix before Q4 uses it. The integral structure Part II keeps general fibre products, valuation tilting, the stronger ordinary ind-syntomic André theorem and remaining later material. Towers stay with P7, and rank-one field tilting is imported from P3. The reader has the same ownership table. No accepted foreign route was edited.

The two upstream examples read were Tau Ceti's AdicSpaces and LocalFieldsRamification roadmaps. The packet is appropriately at target level: its needed key algebraic facts are nodes, while foreign generic theory is imported once. No further proof-lemma splitting is required at this level.

## Suggested file, tests and validation

The seven definition/construction APIs cover presentations/constructors, maps, relations, extensionality or uniqueness, comparison and functoriality where applicable. The zero, characteristic-p, nonperfect, nonradical and saturation cases distinguish the objects from plausible wrong definitions. The two replaced tests are precise computations rather than comments about author intent. Proposed declaration/API/test names all appear as typed declarations/examples or as explicitly classified omissions. Comments are not counted as signatures.

`lean-check research/blueprint/suggested/PerfectoidQuotients.lean` completed successfully twice, including after the edits: **0 errors, 91 warnings, all uses of `sorry`**. The final SHA256 is `0e6a66d81a8689dfcf4d133842a4ed404bed75f0ec6fabfadb3a4fc599d0fd90`. There are 13 Mathlib imports and no Tau Ceti imports. The shared build's Mathlib source is exactly pinned; its Tau Ceti checkout is newer, which has no effect on this Mathlib-only file. Memory exceeded the required 20 GB before each check. No language server, build, cache download or update was started. Compilation checks the stated types, not proofs; 20 omitted targets and missing clauses of the 10 restricted targets remain omitted.

Checks completed: blueprint checker **0 errors, 0 warnings**; local source-issue validation **0 errors**; Unicode/whitespace-normalized excerpt matches; 11 PDF hashes; qualified planned-name/API/test parity; unique complete 61-node review coverage; target/realises parity; authorized-file intake and whitespace diff checks. The transient first parity script assumed all names were fully qualified in source and retained PDF math-spacing; correcting those audit assumptions gave zero discrepancies, without changing mathematical definitions.

## Required orchestrator follow-through

The reader file is not a deliverable of issue #468, so it was read but not edited. Synchronize `research/blueprint/readmes/PerfectoidQuotients.md` with the corrected packet before reader publication:

| Existing reader location | Required synchronization |
|---|---|
| Opening Q3 summary and André/functorial AIC catalogue/proof steps | Make positive degree explicit for monic-root assertions and finite-free root adjoining. |
| Q4 overview, near line 77, and inherited source-issue reference near the end | Attribute the reversed integral map to the remark after ECD 5.8, not Definition 5.7; qualify E29 by the P0 supplying packet. |
| Torsion-free signature boundary, near line 718 | Retain both reduced special fibres in the pullback. |
| Initial prism tests, near line 1175 | Replace `initialPrismNotBounded` with the exact new F_p computation. |
| Bhatt root-extension tests, near line 1531 | Replace `bhattRootExtensionRawFails` with the g=0 computation. |
| Tate comparison source, near line 1029; André source near line 1382; bounded-torsion and strongly closed source entries | Copy the four corrected locators from the packet. |
| Late-extension targets, near lines 2018–2022 | Copy the corrected 10.2–10.7 and 10.13 labels and mathematical descriptions. |

Also reconcile the duplicate foreign `PerfectoidSpaces/E29` IDs in P0/P8 at the register level, retain one late Part II/Q5 owner, apply the requested edge and ownership changes, and narrow the three Q0 supplier imports before advertising global acyclicity. These are foreign-data/reader actions, not additional local node defects; they are not hidden by acceptance of this complete pass. The seven remaining closure inputs stay on the packet's gap/request worklist.

Questions for the orchestrator: should the late owner be exposed as Q5 or as its already accepted protocol-form Part II, and which follow-up applies the reader synchronization and three supplier bindings before global publication? Either late presentation must keep a single owner.
